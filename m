Return-Path: <linux-media+bounces-52824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG7+OufZkWlpnQEAu9opvQ
	(envelope-from <linux-media+bounces-52824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:36:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB1D13EDDA
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C1C93007640
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 14:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7652EBB9E;
	Sun, 15 Feb 2026 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NMAEH/ID"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2702E40B;
	Sun, 15 Feb 2026 14:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771166171; cv=none; b=WrPkWxEGboZfXM/5yt1hlaRzY9Ep5ZwzthXvoQlhL3uilom7WNSQy2NgpzIFllohpNL4cJHtixH3BSAjJSlPGdcF3yaWp6/kbJhsBb6u2MjP3mE4o7IMwXmeJx8UoCYEYzudxYHxy8biM8xscrsiDNiCZIuvJ3XyaGnBlRPKAvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771166171; c=relaxed/simple;
	bh=3Ww52zb41J2ri1tFZFVrNIzoaKWhfdUxuU2A5vJH/pY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=my2czkYfCSZKo1ySi6W1nYuDNQwBf3LWsxmC1g1x/sY1vU54vR6vsYdcqdrb2WUCONbWw6vlveBNWCrp9LjgEpruJX2tMEQQ3FWdfI9LxBGXAoC/sxzMDwG+tZBcZtASb9/yowKC719xKbitXkBLM/GXbIiNzBuJuQdRqI05GtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NMAEH/ID; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69CE1FE;
	Sun, 15 Feb 2026 15:35:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771166117;
	bh=3Ww52zb41J2ri1tFZFVrNIzoaKWhfdUxuU2A5vJH/pY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NMAEH/ID9u66gouYZTd43njQd1hjKqBGK+TisGW3HuIZYvqXj1QOKjVT1TRzCO2pD
	 Y59t5ceIKtzJL/aQjFVJ+QK5yDhQmXW4Kh4gUfALrBwK3TDSo6i8YNWD8HZl45Wfbl
	 B+8gBTYZ1FytbRe7ifczdrZ6oh1U63m2C8Ur9wII=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260214-imx283-hang-fix-v2-2-f4fd3de0f020@ideasonboard.com>
References: <20260214-imx283-hang-fix-v2-0-f4fd3de0f020@ideasonboard.com> <20260214-imx283-hang-fix-v2-2-f4fd3de0f020@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: i2c: imx283: Fix hang when going from large to small resolution
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
To: Hans Verkuil <hverkuil@kernel.org>, Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Sun, 15 Feb 2026 14:36:04 +0000
Message-ID: <177116616492.1941913.17937000377442408101@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52824-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+]
X-Rspamd-Queue-Id: 6AB1D13EDDA
X-Rspamd-Action: no action

Quoting Jai Luthra (2026-02-14 13:05:22)
> When switching between modes (e.g. full resolution to binned),
> standby_cancel() previously cleared XMSTA (starting master mode data
> output) before the new mode's MDSEL, crop, and timing registers were
> programmed in start_streaming(). This caused the sensor to briefly
> output MIPI data using the previous mode's configuration.
>=20
> On receivers like imx-mipi-csis, this leads to FIFO overflow errors
> when switching from a higher to a lower resolution, as the receiver is
> configured for the new smaller frame size but receives stale
> full-resolution data.
>=20
> Fix this by moving the XMSTA and SYNCDRV register writes from
> standby_cancel() to the end of start_streaming(), after all mode,
> crop, and timing registers have been configured. Also explicitly stop
> master mode (XMSTA=3D1) when stopping the stream, matching the pattern
> used by other Sony sensor drivers (imx290, imx415).
>=20
> Use named macros IMX283_XMSTA_START/STOP instead of raw 0/BIT(0) for
> readability.

All seems to make sense and explains (and resolves) the issues I've seen
on my i.MX8MP board with this module.

Thanks for digging into all of this.

Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

=20
> Cc: stable@vger.kernel.org
> Fixes: ccb4eb4496fa ("media: i2c: Add imx283 camera sensor driver")
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx283.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 9b3094a57873c6e8ff8c41d058ea3b0012642cac..1be6164c2d15524690b738aa7=
25a6708e84487d0 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -129,7 +129,8 @@
> =20
>  /* Master Mode Operation Control */
>  #define IMX283_REG_XMSTA               CCI_REG8(0x3105)
> -#define   IMX283_XMSTA                 BIT(0)
> +#define   IMX283_XMSTA_START           0
> +#define   IMX283_XMSTA_STOP            BIT(0)
> =20
>  #define IMX283_REG_SYNCDRV             CCI_REG8(0x3107)
>  #define   IMX283_SYNCDRV_XHS_XVS       (0xa0 | 0x02)
> @@ -1023,8 +1024,6 @@ static int imx283_standby_cancel(struct imx283 *imx=
283)
>         usleep_range(19000, 20000);
> =20
>         cci_write(imx283->cci, IMX283_REG_CLAMP, IMX283_CLPSQRST, &ret);
> -       cci_write(imx283->cci, IMX283_REG_XMSTA, 0, &ret);
> -       cci_write(imx283->cci, IMX283_REG_SYNCDRV, IMX283_SYNCDRV_XHS_XVS=
, &ret);
> =20
>         return ret;
>  }
> @@ -1117,6 +1116,10 @@ static int imx283_start_streaming(struct imx283 *i=
mx283,
>         /* Apply customized values from controls (HMAX/VMAX/SHR) */
>         ret =3D  __v4l2_ctrl_handler_setup(imx283->sd.ctrl_handler);
> =20
> +       /* Start master mode */
> +       cci_write(imx283->cci, IMX283_REG_XMSTA, IMX283_XMSTA_START, &ret=
);
> +       cci_write(imx283->cci, IMX283_REG_SYNCDRV, IMX283_SYNCDRV_XHS_XVS=
, &ret);
> +
>         return ret;
>  }
> =20
> @@ -1153,12 +1156,14 @@ static int imx283_disable_streams(struct v4l2_sub=
dev *sd,
>                                   u64 streams_mask)
>  {
>         struct imx283 *imx283 =3D to_imx283(sd);
> -       int ret;
> +       int ret =3D 0;
> =20
>         if (pad !=3D IMAGE_PAD)
>                 return -EINVAL;
> =20
> -       ret =3D cci_write(imx283->cci, IMX283_REG_STANDBY, IMX283_STANDBY=
, NULL);
> +       cci_write(imx283->cci, IMX283_REG_XMSTA, IMX283_XMSTA_STOP, &ret);
> +       cci_write(imx283->cci, IMX283_REG_STANDBY, IMX283_STANDBY, &ret);
> +
>         if (ret)
>                 dev_err(imx283->dev, "Failed to stop stream\n");
> =20
>=20
> --=20
> 2.53.0
>

