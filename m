Return-Path: <linux-media+bounces-52906-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePFHIUk2k2mV2gEAu9opvQ
	(envelope-from <linux-media+bounces-52906-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:22:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D91FF14578F
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0029530FC1F1
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAF123C4F3;
	Mon, 16 Feb 2026 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bBGifoHY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00C430EF82;
	Mon, 16 Feb 2026 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254546; cv=none; b=U8MOH2fd1+T2CP0PRuFJMBIOb3sRc+gsnwHhdbRZNVTnHbBljzVRv2UCRiV6xCD3CPqxzXI4qe5gahE7Lk4i8FkPdNR1n+OukeKtZsDKfsREUA6WVI09ciEBq6W8R4x2d9DYaB5c2VUmAQNXupO2A+bkFEjoq8yHi7jo3wnuOdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254546; c=relaxed/simple;
	bh=KbR6mBYc7NnQTKSz6lt2yllmMmQ/8fgw7/X2Kb6zs40=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=G/VoRLLa7lI3mwPmw7CH/crqA9b6rpM0HgvJOCeiGWXA3q+8uwK0JIG0LYxrJpjj3posetwF24JFzI0VWsVDZyaKxrI1priaSqSlO3HXsm1dmEslo3gnVLKEic65J1Z6mUmORQTWrQAVCK2nQJjGaebp5tTWfDjmMjn3a/Im9+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bBGifoHY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC1AA250;
	Mon, 16 Feb 2026 16:08:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771254492;
	bh=KbR6mBYc7NnQTKSz6lt2yllmMmQ/8fgw7/X2Kb6zs40=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bBGifoHYuC0jbvuho30W88gth6hoaAttpDE35KCGS2PVpsGPWeasPB2K7eOw0cGWE
	 aw4vq1mFjCW64oKyH4ScOQAQhQdxcUmhAYiZcWjJBD6lMDRSL7sw5F+94mU5YnZ+qB
	 ozz2y5+sMvxrVx3HviZYv7lcReowtrCx0AfRWAv4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-20-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-20-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 20/25] media: i2c: imx283: Provide a full active pixels mode
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:38:57 +0530
Message-ID: <177125453740.14753.9697598956914120472@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52906-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: D91FF14578F
X-Rspamd-Action: no action

Quoting Kieran Bingham (2026-02-13 19:31:59)
> Add a mode to support output of the full illuminated area of the pixel
> array.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx283.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 4976c08c6832..d001bfb5e241 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -523,6 +523,21 @@ static const struct imx283_mode supported_modes_12bi=
t[] =3D {
> =20
>                 .crop =3D imx283_native_area,
>         },
> +       {
> +               /* All illuminated pixels : 5496x3694 */
> +               .scan =3D &imx283_scan_modes[IMX283_MODE_0],
> +
> +               .width =3D 5496,
> +               .height =3D 3694,
> +               .min_hmax =3D 5914, /* 887 @ 480MHz/72MHz */
> +               .min_vmax =3D 3793, /* Lines */
> +
> +               /* 20.00 FPS */
> +               .default_hmax =3D 6000, /* 900 @ 480MHz/72MHz */
> +               .default_vmax =3D 4000,
> +
> +               .crop =3D imx283_active_area,
> +       },
>         {
>                 /* 20MPix 21.40 fps readout mode 0 */
>                 .scan =3D &imx283_scan_modes[IMX283_MODE_0],
>=20
> --=20
> 2.52.0
>

