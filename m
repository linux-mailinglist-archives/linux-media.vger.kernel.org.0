Return-Path: <linux-media+bounces-20003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4509A93E5
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 01:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF7C02819D2
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 23:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2E1208D89;
	Mon, 21 Oct 2024 23:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JAq94tn9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED68D1FEFD6;
	Mon, 21 Oct 2024 23:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729551935; cv=none; b=Yq+iw/sq2sIqTaebumDfxx0o4WYi/7p0m0CECt2Jx2TNXBV0PqduDFWsnLLltOYvJdIDZPEFziNKgxHkciZnZA9sjNCNc7XE3ipbkzHEAS+aOjS5k4ToPwUTnrlIiSzXnaItnm2ZvU4IwX+SgGfvITDTeBwL1aSrSlDWcLiDMFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729551935; c=relaxed/simple;
	bh=YKdo+Uxlo1eCoawACV9oWjMlaGMaBHJ/ijXI/XMZF4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZzc3rdCm5q2S0S5jRVieE30Ti4NmHDySU8daUAZLcdfu+pJ8qb6GPhvELVm1Bz6esiFkY3MUGrmKyJHR2AAeWqqWM6kx729k4qfHwqj/q0dUVLfzgxhr4uS8vwWGAL4hn9Rs9u4Ik7ZjyFGDNtYCsWwuAY8b7xGU+cAKR/AQPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JAq94tn9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB763CCC;
	Tue, 22 Oct 2024 01:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729551819;
	bh=YKdo+Uxlo1eCoawACV9oWjMlaGMaBHJ/ijXI/XMZF4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JAq94tn9mUqktHPHFzsTtzJlmc2s1AUFUYocxqZDZGfxRgM29RCjBNtWvAAlqBVeV
	 gIn+WEY1/4F9Pr6S1mRFD2GVTEk/m+uZ6NYUbGQ0y5WlK8hK8wPC0GNTIm1FLC68hq
	 HGu5tzqMnSSxEYZNgl7Rft0WBaJbmsVEKRQxUCsE=
Date: Tue, 22 Oct 2024 02:05:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Christian Hemp <c.hemp@phytec.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: nxp: imx8-isi: better handle the m2m
 usage_count
Message-ID: <20241021230519.GB8113@pendragon.ideasonboard.com>
References: <20240927080420.3867806-1-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240927080420.3867806-1-laurentiu.palcu@oss.nxp.com>

On Fri, Sep 27, 2024 at 11:04:20AM +0300, Laurentiu Palcu wrote:
> Currently, if streamon/streamoff calls are imbalanced we can either end up
> with a negative ISI m2m usage_count (if streamoff() is called more times
> than streamon()) in which case we'll not be able to restart the ISI pipe
> next time, or the usage_count never gets to 0 and the pipe is never
> switched off.
> 
> So, to avoid that, add an 'in_use' flag in the ctx structure that will
> keep track whether the output/capture queues have been started or not,
> and use it to avoid decrementing/incrementing the usage_count
> unnecessarily.
> 
> Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
> v2:
>  * Changed the way 'usage_count' is incremented/decremented by taking
>    into account the context the streamon/streamoff functions are called
>    from;
>  * Changed the commit message and subject to reflect the changes;
> 
>  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 9745d6219a166..3f06ae1349e53 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -65,6 +65,7 @@ struct mxc_isi_m2m_ctx {
>  	} ctrls;
>  
>  	bool chained;
> +	bool in_use[2];

I think you can store this in mxc_isi_m2m_ctx_queue_data instead as a

	bool streaming;

>  };
>  
>  static inline struct mxc_isi_m2m_buffer *
> @@ -491,6 +492,7 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
>  	const struct mxc_isi_format_info *out_info = ctx->queues.out.info;
>  	struct mxc_isi_m2m *m2m = ctx->m2m;
> +	bool already_in_use;
>  	bool bypass;
>  
>  	int ret;
> @@ -502,6 +504,8 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  		goto unlock;
>  	}
>  
> +	already_in_use = ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE];
> +

As the streamon and streamoff operation are covered by the same queue
lock for all contexts, you can do all this outside of the m2m->lock
sections. I think the following patch (untested) should do and would be
simpler:

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 9745d6219a16..cd6c52e9d158 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -43,6 +43,7 @@ struct mxc_isi_m2m_ctx_queue_data {
 	struct v4l2_pix_format_mplane format;
 	const struct mxc_isi_format_info *info;
 	u32 sequence;
+	bool streaming;
 };

 struct mxc_isi_m2m_ctx {
@@ -486,15 +487,18 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type)
 {
 	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
 	const struct v4l2_pix_format_mplane *out_pix = &ctx->queues.out.format;
 	const struct v4l2_pix_format_mplane *cap_pix = &ctx->queues.cap.format;
 	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
 	const struct mxc_isi_format_info *out_info = ctx->queues.out.info;
 	struct mxc_isi_m2m *m2m = ctx->m2m;
 	bool bypass;
-
 	int ret;

+	if (q->streaming)
+		return 0;
+
 	mutex_lock(&m2m->lock);

 	if (m2m->usage_count == INT_MAX) {
@@ -547,6 +551,8 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 		goto unchain;
 	}

+	q->streaming = true;
+
 	return 0;

 unchain:
@@ -569,10 +575,14 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
 				 enum v4l2_buf_type type)
 {
 	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
 	struct mxc_isi_m2m *m2m = ctx->m2m;

 	v4l2_m2m_ioctl_streamoff(file, fh, type);

+	if (!q->streaming)
+		return 0;
+
 	mutex_lock(&m2m->lock);

 	/*
@@ -598,6 +608,8 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,

 	mutex_unlock(&m2m->lock);

+	q->streaming = false;
+
 	return 0;
 }

If this works for you, could you turn it into a v3 ?

>  	bypass = cap_pix->width == out_pix->width &&
>  		 cap_pix->height == out_pix->height &&
>  		 cap_info->encoding == out_info->encoding;
> @@ -520,7 +524,10 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  		mxc_isi_channel_get(m2m->pipe);
>  	}
>  
> -	m2m->usage_count++;
> +	if (!already_in_use) {
> +		m2m->usage_count++;
> +		ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE] = true;
> +	}
>  
>  	/*
>  	 * Allocate resources for the channel, counting how many users require
> @@ -555,7 +562,12 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  	ctx->chained = false;
>  
>  deinit:
> -	if (--m2m->usage_count == 0) {
> +	if (!already_in_use) {
> +		m2m->usage_count--;
> +		ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE] = false;
> +	}
> +
> +	if (m2m->usage_count == 0) {
>  		mxc_isi_channel_put(m2m->pipe);
>  		mxc_isi_channel_release(m2m->pipe);
>  	}
> @@ -575,6 +587,9 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
>  
>  	mutex_lock(&m2m->lock);
>  
> +	if (!ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE])
> +		goto unlock;
> +
>  	/*
>  	 * If the last context is this one, reset it to make sure the device
>  	 * will be reconfigured when streaming is restarted.
> @@ -587,6 +602,8 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
>  		mxc_isi_channel_unchain(m2m->pipe);
>  	ctx->chained = false;
>  
> +	ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE] = false;
> +
>  	/* Turn off the light with the last user. */
>  	if (--m2m->usage_count == 0) {
>  		mxc_isi_channel_disable(m2m->pipe);
> @@ -594,8 +611,7 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
>  		mxc_isi_channel_release(m2m->pipe);
>  	}
>  
> -	WARN_ON(m2m->usage_count < 0);
> -
> +unlock:
>  	mutex_unlock(&m2m->lock);
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart

