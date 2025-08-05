Return-Path: <linux-media+bounces-38910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AD0B1B19F
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 11:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B339189FC1E
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 10:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDCC26D4F8;
	Tue,  5 Aug 2025 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aPIOyP3C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FE91AA782;
	Tue,  5 Aug 2025 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754387967; cv=none; b=CVygMerksiiVdSBEET3ZMaMwL91zJUgH3cjeaNyihLFEp0GySe+onTBTDwolxR339oo6JklHi7GCacn5Q+tONuzKSHV1IWK5YgtAXv+D/7TP6G2vdSfMIKfoJ6zz+zAWuQK/2XP4u5uyOOk9C898mRGg/DUKGt+zGOHpew87Dd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754387967; c=relaxed/simple;
	bh=RV+XSnddoBH4JRWHZZy+4T5rBIZcZFEquw455N0WQVA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=jQRoKnVO0QBKMVxUGPiuOhhHj1DfF33Pbxh6LXGsqjMrtvGDzMTkbi8zplQ/TFllOhRHBTu0HO/FWLxJrISwWGPJ2DmxD9hw3MX/WwY1jaidJYUIjRfrcERag0jPtWniAw+rbIch6ssuLGHRm87yme15TEkiLKin3upanYUFORQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aPIOyP3C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D96F2AD0;
	Tue,  5 Aug 2025 11:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754387915;
	bh=RV+XSnddoBH4JRWHZZy+4T5rBIZcZFEquw455N0WQVA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aPIOyP3CCN60ghQ95OYLB9emUWH/n0b6O3gtc9ZoA+uMAITK5524gPFOoFe3iPgrR
	 PeGZgkGvvmEIfAIjVWqinSJN2vlhZuO+XIf+jbLxH1tzVI09y3TIRrSaAcZCkteW9d
	 f9FcX+PdukMOKmU3dXioC96DYHeFg17Pwv6UxHrs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250802-media-private-data-v1-42-eb140ddd6a9d@ideasonboard.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com> <20250802-media-private-data-v1-42-eb140ddd6a9d@ideasonboard.com>
Subject: Re: [PATCH 42/65] media: renesas: Access v4l2_fh from file
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 05 Aug 2025 10:59:19 +0100
Message-ID: <175438795943.1641235.15440393062572657340@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Jacopo Mondi (2025-08-02 10:23:04)
> The v4l2_fh associated with an open file handle is now guaranteed
> to be available in file->private_data, initialised by v4l2_fh_add().
>=20
> Access the v4l2_fh, and from there the driver-specific structure,
> from the file * in all ioctl handlers.
>=20
> While at it, remove the now unused fh_to_ctx() macro.
>=20
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar_fdp1.c | 11 +++--------
>  drivers/media/platform/renesas/rcar_jpu.c  | 21 ++++++++-------------
>  2 files changed, 11 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/p=
latform/renesas/rcar_fdp1.c
> index e78d8fb104e9544d27c8ace38888995ca170483f..84c3901a2e5dc3e7ccfb3b440=
62e839f8f19ee02 100644
> --- a/drivers/media/platform/renesas/rcar_fdp1.c
> +++ b/drivers/media/platform/renesas/rcar_fdp1.c
> @@ -630,11 +630,6 @@ struct fdp1_ctx {
>         struct fdp1_field_buffer        *previous;
>  };
> =20
> -static inline struct fdp1_ctx *fh_to_ctx(struct v4l2_fh *fh)
> -{
> -       return container_of(fh, struct fdp1_ctx, fh);
> -}
> -
>  static inline struct fdp1_ctx *file_to_ctx(struct file *filp)
>  {
>         return container_of(file_to_v4l2_fh(filp), struct fdp1_ctx, fh);
> @@ -1411,8 +1406,8 @@ static int fdp1_enum_fmt_vid_out(struct file *file,=
 void *priv,
> =20
>  static int fdp1_g_fmt(struct file *file, void *priv, struct v4l2_format =
*f)
>  {
> +       struct fdp1_ctx *ctx =3D file_to_ctx(file);
>         struct fdp1_q_data *q_data;
> -       struct fdp1_ctx *ctx =3D fh_to_ctx(priv);
> =20
>         if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
>                 return -EINVAL;
> @@ -1589,7 +1584,7 @@ static void fdp1_try_fmt_capture(struct fdp1_ctx *c=
tx,
> =20
>  static int fdp1_try_fmt(struct file *file, void *priv, struct v4l2_forma=
t *f)
>  {
> -       struct fdp1_ctx *ctx =3D fh_to_ctx(priv);
> +       struct fdp1_ctx *ctx =3D file_to_ctx(file);
> =20
>         if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>                 fdp1_try_fmt_output(ctx, NULL, &f->fmt.pix_mp);
> @@ -1660,7 +1655,7 @@ static void fdp1_set_format(struct fdp1_ctx *ctx,
> =20
>  static int fdp1_s_fmt(struct file *file, void *priv, struct v4l2_format =
*f)
>  {
> -       struct fdp1_ctx *ctx =3D fh_to_ctx(priv);
> +       struct fdp1_ctx *ctx =3D file_to_ctx(file);
>         struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
>         struct vb2_queue *vq =3D v4l2_m2m_get_vq(m2m_ctx, f->type);
> =20
> diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/pl=
atform/renesas/rcar_jpu.c
> index 058fcfb967bd98440f33272db42f0d973299d572..9c70a74a2969fce6446b0f26e=
0637a68eade3942 100644
> --- a/drivers/media/platform/renesas/rcar_jpu.c
> +++ b/drivers/media/platform/renesas/rcar_jpu.c
> @@ -480,11 +480,6 @@ static struct jpu_ctx *ctrl_to_ctx(struct v4l2_ctrl =
*c)
>         return container_of(c->handler, struct jpu_ctx, ctrl_handler);
>  }
> =20
> -static struct jpu_ctx *fh_to_ctx(struct v4l2_fh *fh)
> -{
> -       return container_of(fh, struct jpu_ctx, fh);
> -}
> -
>  static struct jpu_ctx *file_to_ctx(struct file *filp)
>  {
>         return container_of(file_to_v4l2_fh(filp), struct jpu_ctx, fh);
> @@ -661,7 +656,7 @@ static u8 jpu_parse_hdr(void *buffer, unsigned long s=
ize, unsigned int *width,
>  static int jpu_querycap(struct file *file, void *priv,
>                         struct v4l2_capability *cap)
>  {
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
> =20
>         if (ctx->encoder)
>                 strscpy(cap->card, DRV_NAME " encoder", sizeof(cap->card)=
);
> @@ -719,7 +714,7 @@ static int jpu_enum_fmt(struct v4l2_fmtdesc *f, u32 t=
ype)
>  static int jpu_enum_fmt_cap(struct file *file, void *priv,
>                             struct v4l2_fmtdesc *f)
>  {
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
> =20
>         return jpu_enum_fmt(f, ctx->encoder ? JPU_ENC_CAPTURE :
>                             JPU_DEC_CAPTURE);
> @@ -728,7 +723,7 @@ static int jpu_enum_fmt_cap(struct file *file, void *=
priv,
>  static int jpu_enum_fmt_out(struct file *file, void *priv,
>                             struct v4l2_fmtdesc *f)
>  {
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
> =20
>         return jpu_enum_fmt(f, ctx->encoder ? JPU_ENC_OUTPUT : JPU_DEC_OU=
TPUT);
>  }
> @@ -828,7 +823,7 @@ static int __jpu_try_fmt(struct jpu_ctx *ctx, struct =
jpu_fmt **fmtinfo,
> =20
>  static int jpu_try_fmt(struct file *file, void *priv, struct v4l2_format=
 *f)
>  {
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
> =20
>         if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
>                 return -EINVAL;
> @@ -839,7 +834,7 @@ static int jpu_try_fmt(struct file *file, void *priv,=
 struct v4l2_format *f)
>  static int jpu_s_fmt(struct file *file, void *priv, struct v4l2_format *=
f)
>  {
>         struct vb2_queue *vq;
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
>         struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
>         struct jpu_fmt *fmtinfo;
>         struct jpu_q_data *q_data;
> @@ -868,8 +863,8 @@ static int jpu_s_fmt(struct file *file, void *priv, s=
truct v4l2_format *f)
> =20
>  static int jpu_g_fmt(struct file *file, void *priv, struct v4l2_format *=
f)
>  {
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
>         struct jpu_q_data *q_data;
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
> =20
>         if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
>                 return -EINVAL;
> @@ -902,8 +897,8 @@ static const struct v4l2_ctrl_ops jpu_ctrl_ops =3D {
> =20
>  static int jpu_streamon(struct file *file, void *priv, enum v4l2_buf_typ=
e type)
>  {
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
>         struct jpu_q_data *src_q_data, *dst_q_data, *orig, adj, *ref;
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
>         enum v4l2_buf_type adj_type;
> =20
>         src_q_data =3D jpu_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPL=
ANE);
> @@ -1284,8 +1279,8 @@ static int jpu_open(struct file *file)
> =20
>  static int jpu_release(struct file *file)
>  {
> -       struct jpu *jpu =3D video_drvdata(file);
>         struct jpu_ctx *ctx =3D file_to_ctx(file);
> +       struct jpu *jpu =3D video_drvdata(file);
> =20
>         v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>         v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>=20
> --=20
> 2.49.0
>

