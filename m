Return-Path: <linux-media+bounces-39851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A020B256D9
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 00:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4E72188BC0D
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 22:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A4E2F3C01;
	Wed, 13 Aug 2025 22:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lsCbZ1Tf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2823A2FCBF8;
	Wed, 13 Aug 2025 22:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755124774; cv=none; b=C0OzqhyIV+SxQcshP/Ddmfny5ah7aK0EBknnFNBO7xce3/pqUhuoClb+U0whMfFhkgNvut4zif5cg4rH3HQTHiPg+7Dp11NCE8vYYF3Zl13H53ktFmujXWAAEfahYKhU7Tz4aYRH6ZMzDmyAsSUc5p5OuJ6Xojs4ECIRKs5+Yqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755124774; c=relaxed/simple;
	bh=RSzrbNuZ/ezGEZBB5B8+3JnfSmbDh3D2Pjh9jwrpZrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0jeD8BFZtcfsL6KKhVc3wVmFB3SnVdF8J+bXWKE3oarUIegGPVWqg810jnjpkERfgDctiVAVKrbLMbPLmdVFa5+O3vbRYp3/TkUQjiPLa0HJrwkd75WboyQBNpcnKPjYPwOwKaWcMIVmSj4mCML2KeDRfSIfPyIPa1WdAQsz4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lsCbZ1Tf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8B0387E0;
	Thu, 14 Aug 2025 00:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755124715;
	bh=RSzrbNuZ/ezGEZBB5B8+3JnfSmbDh3D2Pjh9jwrpZrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lsCbZ1TfT/ZSYGrS6tdKV3bjyuKkyZgskNkXTZz1Av7msvcZTLQVnPzvjnek8ekzm
	 Tqb/7L3l623lYEhQB8f+Ng4P0g6XSuMBaACdp2E5GmhvG0EqVfDZ+bUUp8d/8H1HFN
	 c0cOLrQyJLjh+mk106bnhM1i2OyXJaREbnud0ZR0=
Date: Thu, 14 Aug 2025 01:39:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: guoniu.zhou@oss.nxp.com
Cc: rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm, mchehab@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: Add suspend/resume support for ISI
 mem2mem
Message-ID: <20250813223910.GA11412@pendragon.ideasonboard.com>
References: <20250717024353.1811576-1-guoniu.zhou@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250717024353.1811576-1-guoniu.zhou@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Thu, Jul 17, 2025 at 10:43:54AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Add suspend/resume support for ISI when work at memory to memory mode.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     |  8 ++++
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     | 11 +++++
>  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 48 +++++++++++++++++++
>  3 files changed, 67 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 981648a03113..6eef45302e6c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -372,6 +372,7 @@ static int mxc_isi_pm_suspend(struct device *dev)
>  		struct mxc_isi_pipe *pipe = &isi->pipes[i];
>  
>  		mxc_isi_video_suspend(pipe);
> +		mxc_isi_m2m_suspend(pipe);
>  	}

Given that only the first pipe can be used for M2M, I would move the
mxc_isi_m2m_suspend() call after the loop, and pass it a &isi->m2m
argument.

>  
>  	return pm_runtime_force_suspend(dev);
> @@ -401,6 +402,13 @@ static int mxc_isi_pm_resume(struct device *dev)
>  			 */
>  			err = ret;
>  		}
> +
> +		ret = mxc_isi_m2m_resume(pipe);
> +		if (ret) {
> +			dev_err(dev, "Failed to resume ISI%u (%d) for m2m\n", i,
> +				ret);
> +			err = ret;
> +		}

Same here, that can be moved after the loop.

>  	}
>  
>  	return err;
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 206995bedca4..b979b79b5525 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -343,6 +343,8 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
>  #ifdef CONFIG_VIDEO_IMX8_ISI_M2M
>  int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev);
>  int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi);
> +void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe);
> +int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe);
>  #else
>  static inline int mxc_isi_m2m_register(struct mxc_isi_dev *isi,
>  				       struct v4l2_device *v4l2_dev)
> @@ -353,6 +355,15 @@ static inline int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
>  {
>  	return 0;
>  }
> +
> +static inline void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe)
> +{
> +}
> +
> +static inline int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe)
> +{
> +	return 0;
> +}
>  #endif
>  
>  int mxc_isi_channel_acquire(struct mxc_isi_pipe *pipe,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 22e49d3a1287..fe9d85335b6c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -732,6 +732,54 @@ static const struct v4l2_file_operations mxc_isi_m2m_fops = {
>  	.mmap		= v4l2_m2m_fop_mmap,
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * Suspend & resume
> + */
> +
> +void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_m2m *m2m = &pipe->isi->m2m;
> +	struct mxc_isi_m2m_ctx *ctx = m2m->last_ctx;
> +
> +	/*
> +	 * Check pipe for ISI memory to memory since only
> +	 * channel 0 support this feature.
> +	 */
> +	if (m2m->pipe != pipe || m2m->usage_count == 0)

If we pass the mxc_isi_m2m pointer to the function, you can drop the
comment and the first part of the condition. Same in
mxc_isi_m2m_resume().

> +		return;
> +
> +	v4l2_m2m_suspend(m2m->m2m_dev);
> +
> +	if (ctx->chained)

Shouldn't you check m2m->chained_count instead ? Same in
mxc_isi_m2m_resume().

> +		mxc_isi_channel_unchain(pipe);
> +
> +	mxc_isi_channel_disable(pipe);
> +	mxc_isi_channel_put(pipe);
> +}
> +
> +int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_m2m *m2m = &pipe->isi->m2m;
> +	struct mxc_isi_m2m_ctx *ctx = m2m->last_ctx;
> +
> +	/*
> +	 * Check pipe for ISI memory to memory since only
> +	 * channel 0 support this feature.
> +	 */
> +	if (m2m->pipe != pipe || m2m->usage_count == 0)
> +		return 0;
> +
> +	mxc_isi_channel_get(pipe);
> +
> +	if (ctx->chained)
> +		mxc_isi_channel_chain(pipe, false);
> +
> +	m2m->last_ctx = NULL;
> +	v4l2_m2m_resume(m2m->m2m_dev);
> +
> +	return 0;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Registration
>   */

-- 
Regards,

Laurent Pinchart

