Return-Path: <linux-media+bounces-39982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 087BFB27EC6
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 13:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75CA41890BF2
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 11:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8872FF17A;
	Fri, 15 Aug 2025 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gp3CfCSA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643441A314E;
	Fri, 15 Aug 2025 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755255597; cv=none; b=H404a2E/47wHd17YK519LvXIZp7pDI9Yz7okUdljDHETJjck4thqnmJC1VGGn0ONDcz/GfUb6bvlTdubIQmVa2lbxkoLrxJGQpBhv6npH3Y8SCEVFJ/6685hx4ERrYbNMnRe+pfmKzsqHxKxKem0FwUUk+Z2TFYnqEYrglc0b3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755255597; c=relaxed/simple;
	bh=NzWbvAg9ULrtbOcYxkB5gPQ39IzaRkhd+Wm2Y2RmPCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h++puKCo4hSS4LkmZhq7zQG3q1VBxHpdNo1RHkhYe4AlB6KVYjDKvBzH4YTJfFzcqJPHTLYRZuSTrQMHJQ56qdTodc27IYZzcDhbSHACGAL2FhMRMmjifZBBPWx+scjPK43CEoXd0S43/cuBqWPZyQzeo+pr35jf4AUioXQeMOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gp3CfCSA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 88BF556D;
	Fri, 15 Aug 2025 12:58:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755255533;
	bh=NzWbvAg9ULrtbOcYxkB5gPQ39IzaRkhd+Wm2Y2RmPCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gp3CfCSAa6INwM6KYAHJw54juTrynWOk78+YmthMNvgNydks071tCmBydEvA1qgjc
	 BH6HfjIFpFZMUu1kcR3o04XgXzAqnzKAFmQbFkV3cqe/npe9SFMylPkBtdMQkcyTUS
	 D3SWFQqAbJPhz9C1Z7csqDDBjfIgIHwSwwKXvI+E=
Date: Fri, 15 Aug 2025 13:59:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: nxp: imx8-isi: Add suspend/resume support for
 ISI mem2mem
Message-ID: <20250815105928.GL6201@pendragon.ideasonboard.com>
References: <20250815-isi_m2m-v2-1-32e3720880cc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815-isi_m2m-v2-1-32e3720880cc@nxp.com>

On Fri, Aug 15, 2025 at 05:28:51PM +0800, Guoniu Zhou wrote:
> Add suspend/resume support for ISI when work at memory to memory mode.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
>   - Move mxc_isi_m2m_suspend()/resume() out of loop.
>   - Replace ctx->chained with m2m->chained_count.
>   - Link to v1: https://lore.kernel.org/all/20250717024353.1811576-1-guoniu.zhou@oss.nxp.com/
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  9 ++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    | 11 +++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 34 ++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 981648a0311374597a033a7ecbf39f7b0b252cb0..408e9cb61554d05ac92562c322d6a728080bb9e5 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -374,6 +374,8 @@ static int mxc_isi_pm_suspend(struct device *dev)
>  		mxc_isi_video_suspend(pipe);
>  	}
>  
> +	mxc_isi_m2m_suspend(&isi->m2m);
> +
>  	return pm_runtime_force_suspend(dev);
>  }
>  
> @@ -403,6 +405,13 @@ static int mxc_isi_pm_resume(struct device *dev)
>  		}
>  	}
>  
> +	ret = mxc_isi_m2m_resume(&isi->m2m);
> +	if (ret) {
> +		dev_err(dev, "Failed to resume ISI%u (%d) for m2m\n", i,

Drop %u and i.

No need to resubmit, I'll make the change locally.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			ret);
> +		err = ret;
> +	}
> +
>  	return err;
>  }
>  
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 206995bedca4a4c5d7873f3bc872fbae18b3cb75..6493eef907010934217d9f14a0d6d56acdc59ee0 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -343,6 +343,8 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
>  #ifdef CONFIG_VIDEO_IMX8_ISI_M2M
>  int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev);
>  int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi);
> +void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m);
> +int mxc_isi_m2m_resume(struct mxc_isi_m2m *m2m);
>  #else
>  static inline int mxc_isi_m2m_register(struct mxc_isi_dev *isi,
>  				       struct v4l2_device *v4l2_dev)
> @@ -353,6 +355,15 @@ static inline int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
>  {
>  	return 0;
>  }
> +
> +static inline void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m)
> +{
> +}
> +
> +static inline int mxc_isi_m2m_resume(struct mxc_isi_m2m *m2m)
> +{
> +	return 0;
> +}
>  #endif
>  
>  int mxc_isi_channel_acquire(struct mxc_isi_pipe *pipe,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 22e49d3a128732c077beb7ac2e2f688e0899f8e2..26361fe2ca858098d907d4a0719b0fdacc6becd2 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -732,6 +732,40 @@ static const struct v4l2_file_operations mxc_isi_m2m_fops = {
>  	.mmap		= v4l2_m2m_fop_mmap,
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * Suspend & resume
> + */
> +
> +void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m)
> +{
> +	if (m2m->usage_count == 0)
> +		return;
> +
> +	v4l2_m2m_suspend(m2m->m2m_dev);
> +
> +	if (m2m->chained_count > 0)
> +		mxc_isi_channel_unchain(m2m->pipe);
> +
> +	mxc_isi_channel_disable(m2m->pipe);
> +	mxc_isi_channel_put(m2m->pipe);
> +}
> +
> +int mxc_isi_m2m_resume(struct mxc_isi_m2m *m2m)
> +{
> +	if (m2m->usage_count == 0)
> +		return 0;
> +
> +	mxc_isi_channel_get(m2m->pipe);
> +
> +	if (m2m->chained_count > 0)
> +		mxc_isi_channel_chain(m2m->pipe, false);
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
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250815-isi_m2m-3db166a97969

-- 
Regards,

Laurent Pinchart

