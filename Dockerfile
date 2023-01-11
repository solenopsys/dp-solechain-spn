FROM alpine/git AS CLONE
RUN mkdir /temp
WORKDIR /temp
RUN git clone https://github.com/tendermint/spn


FROM ignitehq/cli AS BUILD
COPY --from=CLONE /temp/spn /spn
WORKDIR /spn
RUN ignite chain init
CMD [  "chain","serve" ]
