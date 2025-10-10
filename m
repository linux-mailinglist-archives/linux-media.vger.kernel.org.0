Return-Path: <linux-media+bounces-44153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC0BCC2B8
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 10:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 723DF3BA8DE
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 08:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E34264A83;
	Fri, 10 Oct 2025 08:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YLScx+x4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E97C264612
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760085646; cv=none; b=dbRX2/6RkIBEVoV4HQR33+8/aA8APxf734eeTxa7EYscksvjy9actbHdEAISd4V3EoIqCWbX47i+HflLBW+gmFB0NSEkeND+qbxC4aaIUtzHXjkE37hRGSJPuSIEjDJy4/EE8oD+ZxrFx9zOVSj7fxYRLQRYgy7ynxxwJ5n5oV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760085646; c=relaxed/simple;
	bh=zqMvhuBBRR1SBcXTIklSNg0wisCKIgbp44KXUdSBCEI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fLqiRtzv/UL0D30ctZmHS19o6N/XheadykU1MZ471Gz/z2hIg1jbmUeh0gF7/gMYFkBONdWvN1sfBc4XYOlqu6H/pz/I14NxheZu/D2+9fTs/hDBxAqucWEqqg4n/u8XpHDQ2RTre/tos693+7Tjz8fHXAfg32YeHC5N4cz+WXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YLScx+x4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:22d7:7fc4:7ab4:3e13])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 24602664;
	Fri, 10 Oct 2025 10:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760085548;
	bh=zqMvhuBBRR1SBcXTIklSNg0wisCKIgbp44KXUdSBCEI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YLScx+x4uQJVNOYbMpjwuFpgXomwj4wJpdtwU+ZMYSC+WCx55u5ZAXo43aSKAuu2J
	 1ck0+GZjrtEqJcFC9k4TVsAfmmBYCGLjJ6w+KRrhi5Kt6K880Yg4oD2TqOoKKEJzc9
	 y5Wj6o9UMuOgXC8hvEXWedjgEnO0rPZsDuZWdFMg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251008175052.19925-11-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com> <20251008175052.19925-11-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 10/25] media: dw100: Drop unneeded v4l2_m2m_get_vq() NULL check
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
Date: Fri, 10 Oct 2025 10:40:41 +0200
Message-ID: <176008564130.3214037.17279403493128702940@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Laurent,

Thank you for the patch.

Quoting Laurent Pinchart (2025-10-08 19:50:37)
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

Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>=20

Cheers,
Stefan

> ---
>  drivers/media/platform/nxp/dw100/dw100.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/pla=
tform/nxp/dw100/dw100.c
> index fed1788d0702..7a0ee44d9e1f 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -765,13 +765,8 @@ static int dw100_enum_framesizes(struct file *file, =
void *priv,
>  static int dw100_g_fmt_vid(struct file *file, void *priv, struct v4l2_fo=
rmat *f)
>  {
>         struct dw100_ctx *ctx =3D dw100_file2ctx(file);
> -       struct vb2_queue *vq;
>         struct dw100_q_data *q_data;
> =20
> -       vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -       if (!vq)
> -               return -EINVAL;
> -
>         q_data =3D dw100_get_q_data(ctx, f->type);
> =20
>         f->fmt.pix_mp =3D q_data->pix_fmt;
> @@ -833,8 +828,6 @@ static int dw100_s_fmt(struct dw100_ctx *ctx, struct =
v4l2_format *f)
>         struct vb2_queue *vq;
> =20
>         vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -       if (!vq)
> -               return -EINVAL;
> =20
>         q_data =3D dw100_get_q_data(ctx, f->type);
>         if (!q_data)
> --=20
> Regards,
>=20
> Laurent Pinchart
>=20
>

