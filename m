Return-Path: <linux-media+bounces-44054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5562BC7F11
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 10:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8F833B9C06
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 08:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63179274B5F;
	Thu,  9 Oct 2025 08:11:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D5E244668
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997489; cv=none; b=uhkbNV2Zn2WnxLz5DmjO3k4CeYyeZucJWpYO3payoz8YWzp0ve/t3BpIHJLYak6notwjrmmzbc+SG+Arn5ZKnFeSA6PhfhYc2NSm9CQlW9EXiGxznJdQpVDZhFoQTqnMjXclKWbzqdiw1Z0N9d96UXPMZIvfzKmW2k8ZEbD7OPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997489; c=relaxed/simple;
	bh=5iU1Q+PW0lDptKCEre1Ij7W80r/GWLVj3BagdYkX29o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VvWkvjeM5tLb52SOi4RqZv+oWJrgdvvUdTIHSUmLqKmH6b1rTT0XOVp5pkDvWxiFfU2d+yuD+cVv9hv6a47FpgjqgznEpBHzSsvqXLLuFPpkWjtqIguJIWgU19Ir5whFs3UySxad/ymQDTPxiNZTpEGakfuJnQ42GlvCEpzIrok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6lkB-0000S0-Eg; Thu, 09 Oct 2025 10:11:23 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6lkB-002hZe-0c;
	Thu, 09 Oct 2025 10:11:23 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6lkB-000000001Qu-0U8v;
	Thu, 09 Oct 2025 10:11:23 +0200
Message-ID: <482fe3561e6b6b46e34042428657069015f3a498.camel@pengutronix.de>
Subject: Re: [PATCH 12/25] media: imx-pxp: Drop unneeded v4l2_m2m_get_vq()
 NULL check
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Shawn Guo
	 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Date: Thu, 09 Oct 2025 10:11:23 +0200
In-Reply-To: <20251008175052.19925-13-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
	 <20251008175052.19925-13-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Mi, 2025-10-08 at 20:50 +0300, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL.
>=20
> In the set format handler, the check may have been intended to catch
> invalid format types, but that's not needed as the V4L2 core picks the
> appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
> type can't be incorrect.
>=20
> In the get format handler, the return value is not used for any purpose
> other than the NULL check, which was therefore probably intended to
> catch invalid format types. That's not needed for the same reason as in
> the set format handler.
>=20
> Drop the unneeded return value checks and, as the function has no side
> effect, the unneeded function call as well.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-pxp.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platfor=
m/nxp/imx-pxp.c
> index 7f8ffbac582f..5386650ce194 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -1180,13 +1180,8 @@ static int pxp_enum_fmt_vid_out(struct file *file,=
 void *priv,
> =20
>  static int pxp_g_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
>  {
> -	struct vb2_queue *vq;
>  	struct pxp_q_data *q_data;
> =20
> -	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
> -
>  	q_data =3D get_q_data(ctx, f->type);
> =20
>  	f->fmt.pix.width	=3D q_data->width;
> @@ -1329,8 +1324,6 @@ static int pxp_s_fmt(struct pxp_ctx *ctx, struct v4=
l2_format *f)
>  	struct vb2_queue *vq;
> =20
>  	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
> =20
>  	q_data =3D get_q_data(ctx, f->type);
>  	if (!q_data)


Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

