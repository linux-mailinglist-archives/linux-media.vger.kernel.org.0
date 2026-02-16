Return-Path: <linux-media+bounces-52886-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG3SJ3Yvk2ke2QEAu9opvQ
	(envelope-from <linux-media+bounces-52886-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:53:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EF3144D9A
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D7283024291
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCA8313547;
	Mon, 16 Feb 2026 14:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="inA71W9g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1915313546;
	Mon, 16 Feb 2026 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253597; cv=none; b=lKSGSf9KNy4IXiaJAnRFatEzEk/q1CM+/vZpNR4AZAtIJVBWErPdFfaY4iq5vXvvFpqgdrAi/M6YIixtrq0EqN6RC8a7sSh2PkAgLv0fc1bNQz132eCWXYoXFGMuWwJGow/LUBNV4+ZLVVYRkKv7TYFOYGRpuWp9d7gjkUW0bhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253597; c=relaxed/simple;
	bh=u5wWLA6GN/MQfFWAhT2a7QE1/3RJc4KWV0gezsMw44A=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=FRfqu1oipnl4wKgPj9kwDn2k0NQbdAiR7+qEGNGeHF9EFjtvC/I0+tpEyRWvexE/+Gn4h5UELQBpeDJSrE8dOjz02XLLdjySUSg60NM2SXMmjvM+atHSCQejvgje/BiGhyhAsXSAZQRoipEZMBJMPJ2MBW79ZvHtkZfu+XZ3A4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=inA71W9g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48E034B3;
	Mon, 16 Feb 2026 15:52:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771253543;
	bh=u5wWLA6GN/MQfFWAhT2a7QE1/3RJc4KWV0gezsMw44A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=inA71W9gyy3p0kWCAX0mGL79HnnR0qt1s634jvWSAJuA50f8xL4/IU+BxgIHCrCAv
	 6ynVCA6cVDTFgcay9g5tFZZLkIPPmik2yBn8WxncL3UF+/ux+3PM+5j+AU7Ifghb4t
	 QrjnS0JSVbKVkcWninaAVjEfYn14e6xznoeMQUjs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-10-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-10-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 10/25] media: i2c: imx283: Move Horizontal configuration block
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:23:09 +0530
Message-ID: <177125358901.14753.7839183006749973768@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52886-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47EF3144D9A
X-Rspamd-Action: no action

Quoting Kieran Bingham (2026-02-13 19:31:49)
> Adapt the Horiztonal configuration into its own scope to improve
> readability of these two associated register configurations.
>=20
> No functional change intended in this commit.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx283.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 32b8070756f0..6d551a26cfa6 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -1160,10 +1160,19 @@ static int imx283_start_streaming(struct imx283 *=
imx283,
> =20
>         cci_write(imx283->cci, IMX283_REG_OB_SIZE_V, mode->scan->vertical=
_ob, &ret);
> =20
> -       /* TODO: Validate mode->crop is fully contained within imx283_nat=
ive_area */
> -       cci_write(imx283->cci, IMX283_REG_HTRIMMING_START, mode->crop.lef=
t, &ret);
> -       cci_write(imx283->cci, IMX283_REG_HTRIMMING_END,
> -                 mode->crop.left + mode->crop.width, &ret);
> +       /* Horizontal Configuration */
> +       {
> +               /*
> +                * While Vertical OB is excluded from the sensor position=
s,
> +                * the Horizontal OB is included within the whole HTRIMMI=
NG
> +                * calculation.
> +                */
> +               u32 left =3D mode->crop.left;
> +               u32 right =3D left + mode->crop.width;
> +
> +               cci_write(imx283->cci, IMX283_REG_HTRIMMING_START, left, =
&ret);
> +               cci_write(imx283->cci, IMX283_REG_HTRIMMING_END, right, &=
ret);
> +       }
> =20
>         /* Disable embedded data */
>         cci_write(imx283->cci, IMX283_REG_EBD_X_OUT_SIZE, 0, &ret);
>=20
> --=20
> 2.52.0
>

