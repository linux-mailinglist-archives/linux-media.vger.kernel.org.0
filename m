Return-Path: <linux-media+bounces-52905-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIYrB/w0k2mV2gEAu9opvQ
	(envelope-from <linux-media+bounces-52905-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:17:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF5145554
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D65E302564B
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC9A3161B1;
	Mon, 16 Feb 2026 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vl7UhN/8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA672459DD;
	Mon, 16 Feb 2026 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254383; cv=none; b=iqCcfzJ+g1MShRE7m3/z32IDPoK8+7BBPYUo6Ey214THyYsrv0d/DwHMopC7NTo/O5qaW5Locx2zU7eJj/ebbbT6id7WHJ6+XgBIFtT5wnQV9rv/jyEVcSB/4k1da7i4VTLrmAROOXunIsAzXLCJ4ZXaSp59vYZ0FMC7rlkCQV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254383; c=relaxed/simple;
	bh=EsHMnwCRs90yYneGHRHzfEvh+b2hLoO3OxX575OIWGs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TRKAqed5ToT9WyAPS92b0J6CiaV87QHH731ltNW+OCpj5DsUW3PF0qhsC+LLviin5e/QnzGe2XHpSVtjP2GH0oDJq8xtwQc6VDI/dQ0iCBR2Utg+31Mr0oUd8HIT6TeaadeKEDyZd7rzq0lkCrLQhOsQpXchlyDL2h4qvZAFVRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vl7UhN/8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F619250;
	Mon, 16 Feb 2026 16:05:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771254329;
	bh=EsHMnwCRs90yYneGHRHzfEvh+b2hLoO3OxX575OIWGs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vl7UhN/83tkxEvI/IC4gx2CrDjzaJ2V2wVuy7dFks4EYGeGKVWSUUG0HkT1Naz7se
	 9qOrchQxpHUd41frRTow8q8yIywZGHvyanp2rLLx5vCyes+yrKYhEq8f3Iv1LZ8Kif
	 J7Rjw4ynRYEBenmHQWb6TeGTqzgZkUUEOqX+cB3Y=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-19-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-19-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 19/25] media: i2c: imx283: Provide Native pixel array capture mode
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:36:15 +0530
Message-ID: <177125437585.14753.6923653815360918362@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52905-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 73FF5145554
X-Rspamd-Action: no action

Quoting Kieran Bingham (2026-02-13 19:31:58)
> Provide a mode that outputs all pixels from the full native array.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx283.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index df48793835fd..4976c08c6832 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -508,6 +508,21 @@ static const struct imx283_reg_list link_freq_reglis=
t[] =3D {
> =20
>  /* Mode configs */
>  static const struct imx283_mode supported_modes_12bit[] =3D {
> +       {
> +               /* Full Native pixel array, including HOB/VOB. 5592x3710 =
*/
> +               .scan =3D &imx283_scan_modes[IMX283_MODE_0],
> +
> +               .width =3D 5592,
> +               .height =3D 3710, /* 3694 + 16 additional lines for VOB */
> +               .min_hmax =3D 5914, /* 887 @ 480MHz/72MHz */
> +               .min_vmax =3D 3793, /* Lines */
> +
> +               /* 20.00 FPS */
> +               .default_hmax =3D 6000, /* 900 @ 480MHz/72MHz */
> +               .default_vmax =3D 4000,
> +
> +               .crop =3D imx283_native_area,
> +       },
>         {
>                 /* 20MPix 21.40 fps readout mode 0 */
>                 .scan =3D &imx283_scan_modes[IMX283_MODE_0],
>=20
> --=20
> 2.52.0
>

