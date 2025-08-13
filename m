Return-Path: <linux-media+bounces-39799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53B5B247AC
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF6CE720A63
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 10:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DFE2F5322;
	Wed, 13 Aug 2025 10:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cz8Fsycv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7E82F3C02
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 10:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081971; cv=none; b=d4xPl4rHg8zoMfNYQAIxDN2Rjsex/D5QbWtOIPjDCFda3BKP2f+q8k2obEuH/yPWAkoRsSdAxs/EFBXxkTm0sEqmw9Mp1ekF3wCRVpi/Q5VbQZoFd2nrQkHlt2CwQ6c5A2wVDz/0ieF2QkmMdc34qBazeFSNvjY6u4J4C9VPxNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081971; c=relaxed/simple;
	bh=X0gm3TU0EO1LhkcEuDmhEGdw+KMdvnLjq07FmddfPW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Efe9TK7JQX6hyO7u4EtsEVAC1Tk+z8ZikZnrhEZpmL35iNl40k/T2m/yxKTC02i84tEvFVLDneD7MJ+fF2GEThcdwwzF5G8SG/80BUwk+voZkNiKLd5O5AK0IB+9y84J0PnKX26J90xEqJeJoagtyGWtpLeRTiXlkFB8ME81zXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cz8Fsycv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1290F379;
	Wed, 13 Aug 2025 12:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755081914;
	bh=X0gm3TU0EO1LhkcEuDmhEGdw+KMdvnLjq07FmddfPW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cz8FsycvLohfuBrR41qKMNx14yEtKsVtwV6bJS7HWPAlOMXyCZo1s6eL5afllkkk6
	 klsfGql7km8AnFaPRiMKyf/LUNfPSnta02HtNahzWV8mkNx0Eub2wQbFZFxLqD59cy
	 02ru76BIIn81jb+pDOi73MPoKm3X7I3fOW7EmwIE=
Date: Wed, 13 Aug 2025 13:45:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 56/76] media: s5p-jpeg: Access v4l2_fh from file
Message-ID: <20250813104548.GE6440@pendragon.ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250810013100.29776-57-laurent.pinchart+renesas@ideasonboard.com>
 <b6f75a41-d5bb-46c7-966d-eeb1d47736e5@gmail.com>
 <20250812075155.GG30054@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812075155.GG30054@pendragon.ideasonboard.com>

On Tue, Aug 12, 2025 at 10:51:57AM +0300, Laurent Pinchart wrote:
> On Tue, Aug 12, 2025 at 08:13:39AM +0200, Andrzej Pietrasiewicz wrote:
> > Hi Laurent & Jacopo,
> > 
> > Thanks for taking care of this, this generally looks good to me,
> > but please see inline.
> > 
> > W dniu 10.08.2025 o 03:30, Laurent Pinchart pisze:
> > > From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > 
> > > The v4l2_fh associated with an open file handle is now guaranteed
> > > to be available in file->private_data, initialised by v4l2_fh_add().
> > > 
> > > Access the v4l2_fh, and from there the driver-specific structure,
> > > from the file * in all ioctl handlers.
> > > 
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Reviewed-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
> > > Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > > Changes since v1:
> > > 
> > > - Update file-to-ctx macro due to removal of fh-to-ctx macro
> > > ---
> > >   .../platform/samsung/s5p-jpeg/jpeg-core.c     | 27 ++++++++-----------
> > >   1 file changed, 11 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> > > index 65f256db4c76..81792f7f8b16 100644
> > > --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> > > +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> > > @@ -580,14 +580,9 @@ static inline struct s5p_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *c)
> > >   	return container_of(c->handler, struct s5p_jpeg_ctx, ctrl_handler);
> > >   }
> > >   
> > > -static inline struct s5p_jpeg_ctx *fh_to_ctx(struct v4l2_fh *fh)
> > > -{
> > > -	return container_of(fh, struct s5p_jpeg_ctx, fh);
> > > -}
> > > -
> > >   static inline struct s5p_jpeg_ctx *file_to_ctx(struct file *filp)
> > >   {
> > > -	return fh_to_ctx(file_to_v4l2_fh(filp));
> > > +	return container_of(file_to_v4l2_fh(filp), struct s5p_jpeg_ctx, fh);
> > >   }
> > >   
> > >   static int s5p_jpeg_to_user_subsampling(struct s5p_jpeg_ctx *ctx)
> > > @@ -1015,8 +1010,8 @@ static int s5p_jpeg_open(struct file *file)
> > >   
> > >   static int s5p_jpeg_release(struct file *file)
> > >   {
> > > -	struct s5p_jpeg *jpeg = video_drvdata(file);
> > >   	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> > > +	struct s5p_jpeg *jpeg = video_drvdata(file);
> > 
> > What is the purpose of this change?
> 
> I don't think this is needed, I believe it can be dropped.
> 
> I'll send a new version (of this patch only, I don't want to respin the
> whole series and spam everybody).

The series got merged before I could send a new version of this patch.
Sorry about that. The new order of the variables doesn't really make a
difference as far as I can see, so I won't send a patch to revert it. If
there's an issue I'm missing that requires a fix, please let me know.

> > >   
> > >   	mutex_lock(&jpeg->lock);
> > >   	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> > > @@ -1253,7 +1248,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
> > >   static int s5p_jpeg_querycap(struct file *file, void *priv,
> > >   			   struct v4l2_capability *cap)
> > >   {
> > > -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> > > +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> > >   
> > >   	if (ctx->mode == S5P_JPEG_ENCODE) {
> > >   		strscpy(cap->driver, S5P_JPEG_M2M_NAME,
> > > @@ -1301,7 +1296,7 @@ static int enum_fmt(struct s5p_jpeg_ctx *ctx,
> > >   static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
> > >   				   struct v4l2_fmtdesc *f)
> > >   {
> > > -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> > > +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> > >   
> > >   	if (ctx->mode == S5P_JPEG_ENCODE)
> > >   		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
> > > @@ -1314,7 +1309,7 @@ static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
> > >   static int s5p_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
> > >   				   struct v4l2_fmtdesc *f)
> > >   {
> > > -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> > > +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> > >   
> > >   	if (ctx->mode == S5P_JPEG_ENCODE)
> > >   		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
> > > @@ -1340,7 +1335,7 @@ static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
> > >   	struct vb2_queue *vq;
> > >   	struct s5p_jpeg_q_data *q_data = NULL;
> > >   	struct v4l2_pix_format *pix = &f->fmt.pix;
> > > -	struct s5p_jpeg_ctx *ct = fh_to_ctx(priv);
> > > +	struct s5p_jpeg_ctx *ct = file_to_ctx(file);
> > >   
> > >   	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
> > >   	if (!vq)
> > > @@ -1480,7 +1475,7 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct s5p_jpeg_fmt *fmt,
> > >   static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
> > >   				  struct v4l2_format *f)
> > >   {
> > > -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> > > +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> > >   	struct v4l2_pix_format *pix = &f->fmt.pix;
> > >   	struct s5p_jpeg_fmt *fmt;
> > >   	int ret;
> > > @@ -1539,7 +1534,7 @@ static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
> > >   static int s5p_jpeg_try_fmt_vid_out(struct file *file, void *priv,
> > >   				  struct v4l2_format *f)
> > >   {
> > > -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> > > +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> > >   	struct s5p_jpeg_fmt *fmt;
> > >   
> > >   	fmt = s5p_jpeg_find_format(ctx, f->fmt.pix.pixelformat,
> > > @@ -1686,7 +1681,7 @@ static int s5p_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
> > >   	if (ret)
> > >   		return ret;
> > >   
> > > -	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
> > > +	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
> > >   }
> > >   
> > >   static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
> > > @@ -1698,7 +1693,7 @@ static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
> > >   	if (ret)
> > >   		return ret;
> > >   
> > > -	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
> > > +	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
> > >   }
> > >   
> > >   static int s5p_jpeg_subscribe_event(struct v4l2_fh *fh,
> > > @@ -1795,7 +1790,7 @@ static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
> > >   static int s5p_jpeg_g_selection(struct file *file, void *priv,
> > >   			 struct v4l2_selection *s)
> > >   {
> > > -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> > > +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> > >   
> > >   	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
> > >   	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)

-- 
Regards,

Laurent Pinchart

