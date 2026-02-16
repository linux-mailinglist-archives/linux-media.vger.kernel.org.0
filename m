Return-Path: <linux-media+bounces-52907-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIwCKh41k2mg2gEAu9opvQ
	(envelope-from <linux-media+bounces-52907-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:17:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF60145589
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF9C4304178E
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0544F315D40;
	Mon, 16 Feb 2026 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r2tUvp8C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57751316190;
	Mon, 16 Feb 2026 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254569; cv=none; b=Y+jXMdt7yrBs8b5yE/MT5roJtl1AuL8IhaPLUw0PlLLVeGHc9EQr+wmipnkzUskN37pms6x1xrcecV+SV46CSREmViHwGsVH+5FoIl4dOPu3A1fLYW9eJkWTVjWklz+NDvia6MKTSivJIA6kKA41u2/qQLyPie3nUMGnJxYZs40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254569; c=relaxed/simple;
	bh=cMjK8guRa1D0nHUMlioDilLRCYWoazq1GS4/ddoABCs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=uDdE7agIOywAca58y4WR/wAYK1XGKvchPLiaJ2pdrW6sLk7XLlVQRUkt0qstiXOv2XwU0ZFpqkKvsbn4jf1hiAVCtMZkAR4ic3CxYh6i87z3WPV1tZMoq/eutrvrLARpAWTghEzMdxQTYbDmjhTT9XD+ko0mo31YnBp4DqEMfcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r2tUvp8C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC93F250;
	Mon, 16 Feb 2026 16:08:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771254516;
	bh=cMjK8guRa1D0nHUMlioDilLRCYWoazq1GS4/ddoABCs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=r2tUvp8Cn38WuXhbb48271zq+boz/3ZC2jSHg38L4XMg8mqg5Dv/ZyKeWICo1+EvF
	 UmRv6HBkz2wf7EEA1wmE+bKuRkkfv7769meXMaHUpKnpx3KCoFuDzqcErvHWDzoL9A
	 UlgEV4OY+5suIsq9Rpa5y0WQzW9uTe3FN74qb65c=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-21-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-21-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 21/25] media: i2c: imx283: Provide an effective pixel array mode
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:39:21 +0530
Message-ID: <177125456185.14753.11092135084716047928@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52907-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 5FF60145589
X-Rspamd-Action: no action

Quoting Kieran Bingham (2026-02-13 19:32:00)
> Provide a mode that includes all effective pixels which includes a 12
> pixel margin for colour processing on all edges.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx283.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index d001bfb5e241..75a35d9db05d 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -183,6 +183,13 @@ static const struct v4l2_rect imx283_native_area =3D=
 {
>         .height =3D 3710,
>  };
> =20
> +static const struct v4l2_rect imx283_effective_area =3D {
> +       .top =3D 16 + 12, /* Clamp + Ignored area*/
> +       .left =3D 96,
> +       .width =3D 5496,
> +       .height =3D 3672,
> +};
> +
>  static const struct v4l2_rect imx283_active_area =3D {
>         .top =3D 16,
>         .left =3D 96,
> @@ -538,6 +545,21 @@ static const struct imx283_mode supported_modes_12bi=
t[] =3D {
> =20
>                 .crop =3D imx283_active_area,
>         },
> +       {
> +               /* Effective Pixel Mode : 5496x3672 */
> +               .scan =3D &imx283_scan_modes[IMX283_MODE_0],
> +
> +               .width =3D 5496,
> +               .height =3D 3672,
> +               .min_hmax =3D 5914, /* 887 @ 480MHz/72MHz */
> +               .min_vmax =3D 3793, /* Lines */
> +
> +               /* 20.00 FPS */
> +               .default_hmax =3D 6000, /* 900 @ 480MHz/72MHz */
> +               .default_vmax =3D 4000,
> +
> +               .crop =3D imx283_effective_area,
> +       },
>         {
>                 /* 20MPix 21.40 fps readout mode 0 */
>                 .scan =3D &imx283_scan_modes[IMX283_MODE_0],
>=20
> --=20
> 2.52.0
>

