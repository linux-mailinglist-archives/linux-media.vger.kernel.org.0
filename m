Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58C6C672CF
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 17:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfGLPzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 11:55:32 -0400
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:30034
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726984AbfGLPzc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 11:55:32 -0400
X-Greylist: delayed 481 seconds by postgrey-1.27 at vger.kernel.org; Fri, 12 Jul 2019 11:55:25 EDT
X-Sender-Id: dreamhost|x-authsender|brad@b-rad.cc
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id AAD128C1FD1;
        Fri, 12 Jul 2019 15:47:23 +0000 (UTC)
Received: from pdx1-sub0-mail-a100.g.dreamhost.com (100-96-35-167.trex.outbound.svc.cluster.local [100.96.35.167])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id BBC9E8C226E;
        Fri, 12 Jul 2019 15:47:22 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@b-rad.cc
Received: from pdx1-sub0-mail-a100.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.17.3);
        Fri, 12 Jul 2019 15:47:23 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@b-rad.cc
X-MailChannels-Auth-Id: dreamhost
X-Versed-Reign: 656cb67b3ba26923_1562946443543_1898236359
X-MC-Loop-Signature: 1562946443543:3914881135
X-MC-Ingress-Time: 1562946443543
Received: from pdx1-sub0-mail-a100.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a100.g.dreamhost.com (Postfix) with ESMTP id 1DE487FFA7;
        Fri, 12 Jul 2019 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=
        nextdimension.cc; bh=v7P8C2Z6W2Q3ZSKML8oGh1W17Tc=; b=gn6BV/jX7Pj
        ZrwrkEe5tBjbmAYC4nJ4abLpxuT4R8DUMnf3QooINbFKPKGOlb26AmX5Sz94z8jb
        i0SbHPJ8fsghWk7ab1+ZtYU074ZiA/BBDm80KPbw9eexY/HN6Lrso/TQgCVohBvt
        q4VeyJiPiFRTbyelWEAlo0PNRYKyzMZc=
Received: from [192.168.0.21] (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@b-rad.cc)
        by pdx1-sub0-mail-a100.g.dreamhost.com (Postfix) with ESMTPSA id 336D07FFAD;
        Fri, 12 Jul 2019 08:47:17 -0700 (PDT)
Subject: Re: [PATCH v3] media: si2168: Refactor command setup code
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Brad Love <brad@nextdimension.cc>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <544859b5-108a-1909-d612-64f67a02aeec@free.fr>
X-DH-BACKEND: pdx1-sub0-mail-a100
From:   Brad Love <brad@nextdimension.cc>
Openpgp: preference=signencrypt
Autocrypt: addr=brad@nextdimension.cc; prefer-encrypt=mutual; keydata=
 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
Message-ID: <bde6e367-61a4-7501-2459-eecad5db1d1b@nextdimension.cc>
Date:   Fri, 12 Jul 2019 10:47:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <544859b5-108a-1909-d612-64f67a02aeec@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: -90
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrhedtgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdfftffgtefojffquffvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddutddmnecujfgurhepuffvfhfhkffffgggjggtgfesthhqredttdefjeenucfhrhhomhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqeenucfkphepieejrdduleekrdehjedrudekkeenucfrrghrrghmpehmohguvgepshhmthhppdhhvghloheplgduledvrdduieekrddtrddvudgnpdhinhgvthepieejrdduleekrdehjedrudekkedprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopehmrghrtgdrfidrghhonhiirghlvgiisehfrhgvvgdrfhhrnecuvehluhhsthgvrhfuihiivgeptd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marc,

Replying inline.


On 04/07/2019 05.33, Marc Gonzalez wrote:
> Refactor the command setup code, and let the compiler determine
> the size of each command.
>
> Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
> Changes from v1:
> - Use a real function to populate struct si2168_cmd *cmd, and a trivial=

> macro wrapping it (macro because sizeof).
> Changes from v2:
> - Fix header mess
> - Add Jonathan's tag
> ---
>  drivers/media/dvb-frontends/si2168.c | 146 +++++++++------------------=

>  1 file changed, 45 insertions(+), 101 deletions(-)
>
> diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-f=
rontends/si2168.c
> index c64b360ce6b5..5e81e076369c 100644
> --- a/drivers/media/dvb-frontends/si2168.c
> +++ b/drivers/media/dvb-frontends/si2168.c
> @@ -12,6 +12,16 @@
> =20
>  static const struct dvb_frontend_ops si2168_ops;
> =20
> +static void cmd_setup(struct si2168_cmd *cmd, char *args, int wlen, in=
t rlen)
> +{
> +	memcpy(cmd->args, args, wlen);
> +	cmd->wlen =3D wlen;
> +	cmd->rlen =3D rlen;
> +}
> +


struct si2168_cmd.args is u8, not char. I also think const should apply
to the pointer.


> +#define CMD_SETUP(cmd, args, rlen) \
> +	cmd_setup(cmd, args, sizeof(args) - 1, rlen)
> +


This is only a valid helper if args is a null terminated string. It just
so happens that every instance in this driver is, but that could be a
silent pitfall if someone used a u8 array with this macro.

Otherwise I'm ok with the refactoring.

Regards,

Brad




>  /* execute firmware command */
>  static int si2168_cmd_execute(struct i2c_client *client, struct si2168=
_cmd *cmd)
>  {
> @@ -84,15 +94,13 @@ static int si2168_ts_bus_ctrl(struct dvb_frontend *=
fe, int acquire)
>  	dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
> =20
>  	/* set TS_MODE property */
> -	memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
> +	CMD_SETUP(&cmd, "\x14\x00\x01\x10\x10\x00", 4);
>  	if (acquire)
>  		cmd.args[4] |=3D dev->ts_mode;
>  	else
>  		cmd.args[4] |=3D SI2168_TS_TRISTATE;
>  	if (dev->ts_clock_gapped)
>  		cmd.args[4] |=3D 0x40;
> -	cmd.wlen =3D 6;
> -	cmd.rlen =3D 4;
>  	ret =3D si2168_cmd_execute(client, &cmd);
> =20
>  	return ret;
> @@ -116,19 +124,13 @@ static int si2168_read_status(struct dvb_frontend=
 *fe, enum fe_status *status)
> =20
>  	switch (c->delivery_system) {
>  	case SYS_DVBT:
> -		memcpy(cmd.args, "\xa0\x01", 2);
> -		cmd.wlen =3D 2;
> -		cmd.rlen =3D 13;
> +		CMD_SETUP(&cmd, "\xa0\x01", 13);
>  		break;
>  	case SYS_DVBC_ANNEX_A:
> -		memcpy(cmd.args, "\x90\x01", 2);
> -		cmd.wlen =3D 2;
> -		cmd.rlen =3D 9;
> +		CMD_SETUP(&cmd, "\x90\x01", 9);
>  		break;
>  	case SYS_DVBT2:
> -		memcpy(cmd.args, "\x50\x01", 2);
> -		cmd.wlen =3D 2;
> -		cmd.rlen =3D 14;
> +		CMD_SETUP(&cmd, "\x50\x01", 14);
>  		break;
>  	default:
>  		ret =3D -EINVAL;
> @@ -165,9 +167,7 @@ static int si2168_read_status(struct dvb_frontend *=
fe, enum fe_status *status)
> =20
>  	/* BER */
>  	if (*status & FE_HAS_VITERBI) {
> -		memcpy(cmd.args, "\x82\x00", 2);
> -		cmd.wlen =3D 2;
> -		cmd.rlen =3D 3;
> +		CMD_SETUP(&cmd, "\x82\x00", 3);
>  		ret =3D si2168_cmd_execute(client, &cmd);
>  		if (ret)
>  			goto err;
> @@ -198,9 +198,7 @@ static int si2168_read_status(struct dvb_frontend *=
fe, enum fe_status *status)
> =20
>  	/* UCB */
>  	if (*status & FE_HAS_SYNC) {
> -		memcpy(cmd.args, "\x84\x01", 2);
> -		cmd.wlen =3D 2;
> -		cmd.rlen =3D 3;
> +		CMD_SETUP(&cmd, "\x84\x01", 3);
>  		ret =3D si2168_cmd_execute(client, &cmd);
>  		if (ret)
>  			goto err;
> @@ -286,22 +284,18 @@ static int si2168_set_frontend(struct dvb_fronten=
d *fe)
>  			goto err;
>  	}
> =20
> -	memcpy(cmd.args, "\x88\x02\x02\x02\x02", 5);
> -	cmd.wlen =3D 5;
> -	cmd.rlen =3D 5;
> +	CMD_SETUP(&cmd, "\x88\x02\x02\x02\x02", 5);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
>  	/* that has no big effect */
>  	if (c->delivery_system =3D=3D SYS_DVBT)
> -		memcpy(cmd.args, "\x89\x21\x06\x11\xff\x98", 6);
> +		CMD_SETUP(&cmd, "\x89\x21\x06\x11\xff\x98", 3);
>  	else if (c->delivery_system =3D=3D SYS_DVBC_ANNEX_A)
> -		memcpy(cmd.args, "\x89\x21\x06\x11\x89\xf0", 6);
> +		CMD_SETUP(&cmd, "\x89\x21\x06\x11\x89\xf0", 3);
>  	else if (c->delivery_system =3D=3D SYS_DVBT2)
> -		memcpy(cmd.args, "\x89\x21\x06\x11\x89\x20", 6);
> -	cmd.wlen =3D 6;
> -	cmd.rlen =3D 3;
> +		CMD_SETUP(&cmd, "\x89\x21\x06\x11\x89\x20", 3);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> @@ -318,103 +312,77 @@ static int si2168_set_frontend(struct dvb_fronte=
nd *fe)
>  			goto err;
>  	}
> =20
> -	memcpy(cmd.args, "\x51\x03", 2);
> -	cmd.wlen =3D 2;
> -	cmd.rlen =3D 12;
> +	CMD_SETUP(&cmd, "\x51\x03", 12);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
> -	memcpy(cmd.args, "\x12\x08\x04", 3);
> -	cmd.wlen =3D 3;
> -	cmd.rlen =3D 3;
> +	CMD_SETUP(&cmd, "\x12\x08\x04", 3);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
> -	memcpy(cmd.args, "\x14\x00\x0c\x10\x12\x00", 6);
> -	cmd.wlen =3D 6;
> -	cmd.rlen =3D 4;
> +	CMD_SETUP(&cmd, "\x14\x00\x0c\x10\x12\x00", 4);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
> -	memcpy(cmd.args, "\x14\x00\x06\x10\x24\x00", 6);
> -	cmd.wlen =3D 6;
> -	cmd.rlen =3D 4;
> +	CMD_SETUP(&cmd, "\x14\x00\x06\x10\x24\x00", 4);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
> -	memcpy(cmd.args, "\x14\x00\x07\x10\x00\x24", 6);
> -	cmd.wlen =3D 6;
> -	cmd.rlen =3D 4;
> +	CMD_SETUP(&cmd, "\x14\x00\x07\x10\x00\x24", 4);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
> -	memcpy(cmd.args, "\x14\x00\x0a\x10\x00\x00", 6);
> +	CMD_SETUP(&cmd, "\x14\x00\x0a\x10\x00\x00", 4);
>  	cmd.args[4] =3D delivery_system | bandwidth;
>  	if (dev->spectral_inversion)
>  		cmd.args[5] |=3D 1;
> -	cmd.wlen =3D 6;
> -	cmd.rlen =3D 4;
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
>  	/* set DVB-C symbol rate */
>  	if (c->delivery_system =3D=3D SYS_DVBC_ANNEX_A) {
> -		memcpy(cmd.args, "\x14\x00\x02\x11", 4);
> +		CMD_SETUP(&cmd, "\x14\x00\x02\x11\x00\x00", 4);
>  		cmd.args[4] =3D ((c->symbol_rate / 1000) >> 0) & 0xff;
>  		cmd.args[5] =3D ((c->symbol_rate / 1000) >> 8) & 0xff;
> -		cmd.wlen =3D 6;
> -		cmd.rlen =3D 4;
>  		ret =3D si2168_cmd_execute(client, &cmd);
>  		if (ret)
>  			goto err;
>  	}
> =20
> -	memcpy(cmd.args, "\x14\x00\x0f\x10\x10\x00", 6);
> -	cmd.wlen =3D 6;
> -	cmd.rlen =3D 4;
> +	CMD_SETUP(&cmd, "\x14\x00\x0f\x10\x10\x00", 4);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
> -	memcpy(cmd.args, "\x14\x00\x09\x10\xe3\x08", 6);
> +	CMD_SETUP(&cmd, "\x14\x00\x09\x10\xe3\x08", 4);
>  	cmd.args[5] |=3D dev->ts_clock_inv ? 0x00 : 0x10;
> -	cmd.wlen =3D 6;
> -	cmd.rlen =3D 4;
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
> -	memcpy(cmd.args, "\x14\x00\x08\x10\xd7\x05", 6);
> +	CMD_SETUP(&cmd, "\x14\x00\x08\x10\xd7\x05", 4);
>  	cmd.args[5] |=3D dev->ts_clock_inv ? 0x00 : 0x10;
> -	cmd.wlen =3D 6;
> -	cmd.rlen =3D 4;
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
> -	memcpy(cmd.args, "\x14\x00\x01\x12\x00\x00", 6);
> -	cmd.wlen =3D 6;
> -	cmd.rlen =3D 4;
> +	CMD_SETUP(&cmd, "\x14\x00\x01\x12\x00\x00", 4);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
> -	memcpy(cmd.args, "\x14\x00\x01\x03\x0c\x00", 6);
> -	cmd.wlen =3D 6;
> -	cmd.rlen =3D 4;
> +	CMD_SETUP(&cmd, "\x14\x00\x01\x03\x0c\x00", 4);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
> -	memcpy(cmd.args, "\x85", 1);
> -	cmd.wlen =3D 1;
> -	cmd.rlen =3D 1;
> +	CMD_SETUP(&cmd, "\x85", 1);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> @@ -444,26 +412,20 @@ static int si2168_init(struct dvb_frontend *fe)
>  	dev_dbg(&client->dev, "\n");
> =20
>  	/* initialize */
> -	memcpy(cmd.args, "\xc0\x12\x00\x0c\x00\x0d\x16\x00\x00\x00\x00\x00\x0=
0", 13);
> -	cmd.wlen =3D 13;
> -	cmd.rlen =3D 0;
> +	CMD_SETUP(&cmd, "\xc0\x12\x00\x0c\x00\x0d\x16\x00\x00\x00\x00\x00\x00=
", 0);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
>  	if (dev->warm) {
>  		/* resume */
> -		memcpy(cmd.args, "\xc0\x06\x08\x0f\x00\x20\x21\x01", 8);
> -		cmd.wlen =3D 8;
> -		cmd.rlen =3D 1;
> +		CMD_SETUP(&cmd, "\xc0\x06\x08\x0f\x00\x20\x21\x01", 1);
>  		ret =3D si2168_cmd_execute(client, &cmd);
>  		if (ret)
>  			goto err;
> =20
>  		udelay(100);
> -		memcpy(cmd.args, "\x85", 1);
> -		cmd.wlen =3D 1;
> -		cmd.rlen =3D 1;
> +		CMD_SETUP(&cmd, "\x85", 1);
>  		ret =3D si2168_cmd_execute(client, &cmd);
>  		if (ret)
>  			goto err;
> @@ -472,9 +434,7 @@ static int si2168_init(struct dvb_frontend *fe)
>  	}
> =20
>  	/* power up */
> -	memcpy(cmd.args, "\xc0\x06\x01\x0f\x00\x20\x20\x01", 8);
> -	cmd.wlen =3D 8;
> -	cmd.rlen =3D 1;
> +	CMD_SETUP(&cmd, "\xc0\x06\x01\x0f\x00\x20\x20\x01", 1);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> @@ -542,17 +502,13 @@ static int si2168_init(struct dvb_frontend *fe)
> =20
>  	release_firmware(fw);
> =20
> -	memcpy(cmd.args, "\x01\x01", 2);
> -	cmd.wlen =3D 2;
> -	cmd.rlen =3D 1;
> +	CMD_SETUP(&cmd, "\x01\x01", 1);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> =20
>  	/* query firmware version */
> -	memcpy(cmd.args, "\x11", 1);
> -	cmd.wlen =3D 1;
> -	cmd.rlen =3D 10;
> +	CMD_SETUP(&cmd, "\x11", 10);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> @@ -610,9 +566,7 @@ static int si2168_sleep(struct dvb_frontend *fe)
>  	if (dev->version > ('B' << 24 | 4 << 16 | 0 << 8 | 11 << 0))
>  		dev->warm =3D false;
> =20
> -	memcpy(cmd.args, "\x13", 1);
> -	cmd.wlen =3D 1;
> -	cmd.rlen =3D 0;
> +	CMD_SETUP(&cmd, "\x13", 0);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> @@ -638,9 +592,7 @@ static int si2168_select(struct i2c_mux_core *muxc,=
 u32 chan)
>  	struct si2168_cmd cmd;
> =20
>  	/* open I2C gate */
> -	memcpy(cmd.args, "\xc0\x0d\x01", 3);
> -	cmd.wlen =3D 3;
> -	cmd.rlen =3D 0;
> +	CMD_SETUP(&cmd, "\xc0\x0d\x01", 0);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> @@ -658,9 +610,7 @@ static int si2168_deselect(struct i2c_mux_core *mux=
c, u32 chan)
>  	struct si2168_cmd cmd;
> =20
>  	/* close I2C gate */
> -	memcpy(cmd.args, "\xc0\x0d\x00", 3);
> -	cmd.wlen =3D 3;
> -	cmd.rlen =3D 0;
> +	CMD_SETUP(&cmd, "\xc0\x0d\x00", 0);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err;
> @@ -753,25 +703,19 @@ static int si2168_probe(struct i2c_client *client=
,
>  	mutex_init(&dev->i2c_mutex);
> =20
>  	/* Initialize */
> -	memcpy(cmd.args, "\xc0\x12\x00\x0c\x00\x0d\x16\x00\x00\x00\x00\x00\x0=
0", 13);
> -	cmd.wlen =3D 13;
> -	cmd.rlen =3D 0;
> +	CMD_SETUP(&cmd, "\xc0\x12\x00\x0c\x00\x0d\x16\x00\x00\x00\x00\x00\x00=
", 0);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err_kfree;
> =20
>  	/* Power up */
> -	memcpy(cmd.args, "\xc0\x06\x01\x0f\x00\x20\x20\x01", 8);
> -	cmd.wlen =3D 8;
> -	cmd.rlen =3D 1;
> +	CMD_SETUP(&cmd, "\xc0\x06\x01\x0f\x00\x20\x20\x01", 1);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err_kfree;
> =20
>  	/* Query chip revision */
> -	memcpy(cmd.args, "\x02", 1);
> -	cmd.wlen =3D 1;
> -	cmd.rlen =3D 13;
> +	CMD_SETUP(&cmd, "\x02", 13);
>  	ret =3D si2168_cmd_execute(client, &cmd);
>  	if (ret)
>  		goto err_kfree;

