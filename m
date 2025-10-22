Return-Path: <linux-media+bounces-45320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B65BABFE3EE
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 23:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9208D1A024CE
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 21:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC17301704;
	Wed, 22 Oct 2025 21:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="NRN+35lh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1782F0698
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 21:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761167285; cv=none; b=GMONrALH2zKbfAUs6p1R2l7trcXqBL2Q+PeWLcogmscDbewZCGX3OMO4WlW1HVl0ONorOaKbIb1QJvwQ0WjJ2dvHA7W/DzlNWuhIUZXsTuP2JqHoa7Wz37X6PFYMTMDR0EgqTXCtDjwg4KmXq7+gjGkH8yA1D3smyqnW4g56SFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761167285; c=relaxed/simple;
	bh=CGrSShTvuXcnt2FYXpJPfEpKsH7BVkBtsoWFEEIyLoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2woFmWay1jyEXxqwDQjBqHOp7KhRHHH8XJXFa0aNG3NIqAQ0+H1YtPn92aYlsG5sC8JriR26YolEKatR4C9d3nyYWEdm8qkZ6EAKS2R6h4lc/ryYJsdYmAlqMbQJh6PNFiaxVB2TepKfi+p0LBx9Zi62od7AYJKAzDktVX0Kzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=NRN+35lh; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1761167282;
 bh=Wvj3Rv5xVswsYUE3/QtMVxqiWzQ9HqecJXpDuIAZ3kk=;
 b=NRN+35lhTuEu6DCmHuTBAq4Lf0V9ehl4/NvH4rPHsVyBDC+W/Fd/lkBiSayCbfGV6P3IueT0P
 WEs4YMaPoQB+pXYRrKcz+DgzhSguroNKmAFHwuEIn3aARYmbolZ/2pakj34RvgC0LgXZCqcikHN
 cJd2Hs+j8ROsGHko4/I+raeNbIDYUfkSX5UqLHDXe2U71SFt776f9BVMOrFyM4jt9ukNsyHRf74
 jEKDzZ3Lpbb/QmueUYUO1BwB3iC8DK4FV+X1JFbgM/MzaGNBPa4AdwRJ9y+8SP5tR6kYZudwIq+
 YW3vulHD+j++3GVUN/1y0k888FEvtF7KnQyxbL/9XMng==
X-Forward-Email-ID: 68f947ab7ffe5c5c38c08a43
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.3.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <35a4ac73-9a30-43af-97b0-7e99c106a3ba@kwiboo.se>
Date: Wed, 22 Oct 2025 23:07:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/15] media: rkvdec: Add RCB and SRAM support
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Yunke Cao <yunkec@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, linux-kernel@vger.kernel.org
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
 <20251022174508.284929-10-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251022174508.284929-10-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

On 10/22/2025 7:45 PM, Detlev Casanova wrote:
> The RCB (Rows and Cols Buffers) are a set of buffers used by other
> variations of the decoder to store temporary data.
> 
> Those variation come with a dedicated SRAM area used to store those
> buffers for better performances.
> 
> The buffer sizes are either the width or height of the frame being
> decoded multiplied by a documented factor and can be stored either
> in SRAM or RAM.
> A fallback to RAM is provided if the SRAM is full (e.g.: multiple
> streams are being decoded at the same time).
> 
> To manage the different kind of allocation, an enum is added to the
> rkvdec_aux_buf struct to specify how the buffer was allocated, and
> so, how to free it.
> 
> This commit is in preparation of other variants support.
> 
> Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/Makefile   |   1 +
>  .../platform/rockchip/rkvdec/rkvdec-rcb.c     | 173 ++++++++++++++++++
>  .../platform/rockchip/rkvdec/rkvdec-rcb.h     |  29 +++
>  .../media/platform/rockchip/rkvdec/rkvdec.c   |  27 ++-
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |  13 ++
>  5 files changed, 241 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> 
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
> index 1b4bc44be23e..3d75103e536d 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -7,4 +7,5 @@ rockchip-vdec-y += \
>  		   rkvdec-h264-common.o \
>  		   rkvdec-hevc.o \
>  		   rkvdec-hevc-common.o \
> +		   rkvdec-rcb.o \
>  		   rkvdec-vp9.o
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> new file mode 100644
> index 000000000000..5a4959c239e3
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip video decoder Rows and Cols Buffers manager
> + *
> + * Copyright (C) 2025 Collabora, Ltd.
> + *  Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include "rkvdec.h"
> +#include "rkvdec-rcb.h"
> +
> +#include <linux/types.h>
> +#include <linux/iommu.h>
> +#include <linux/genalloc.h>
> +
> +struct rkvdec_rcb_config {
> +	struct rkvdec_aux_buf *rcb_bufs;
> +	size_t rcb_count;
> +};
> +
> +static size_t rkvdec_rcb_size(const struct rcb_size_info *size_info,
> +			      unsigned int width, unsigned int height)
> +{
> +	return size_info->multiplier * (size_info->axis == PIC_HEIGHT ? height : width);
> +}
> +
> +dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id)
> +{
> +	return ctx->rcb_config->rcb_bufs[id].dma;
> +}
> +
> +size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id)
> +{
> +	return ctx->rcb_config->rcb_bufs[id].size;
> +}
> +
> +int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx)
> +{
> +	return ctx->rcb_config->rcb_count;
> +}
> +
> +void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *dev = ctx->dev;
> +	struct rkvdec_rcb_config *cfg = ctx->rcb_config;
> +	unsigned long virt_addr;
> +	int i;
> +
> +	if (!cfg)
> +		return;
> +
> +	for (i = 0; i < cfg->rcb_count; i++) {
> +		size_t rcb_size = cfg->rcb_bufs[i].size;
> +
> +		if (!cfg->rcb_bufs[i].cpu)
> +			continue;
> +
> +		switch (cfg->rcb_bufs[i].type) {
> +		case RKVDEC_ALLOC_SRAM:
> +			virt_addr = (unsigned long)cfg->rcb_bufs[i].cpu;
> +
> +			if (dev->iommu_domain)
> +				iommu_unmap(dev->iommu_domain, virt_addr, rcb_size);
> +			gen_pool_free(dev->sram_pool, virt_addr, rcb_size);
> +			break;
> +		case RKVDEC_ALLOC_DMA:
> +			dma_free_coherent(dev->dev,
> +					  rcb_size,
> +					  cfg->rcb_bufs[i].cpu,
> +					  cfg->rcb_bufs[i].dma);
> +			break;
> +		}
> +	}
> +
> +	if (cfg->rcb_bufs)
> +		devm_kfree(dev->dev, cfg->rcb_bufs);
> +
> +	devm_kfree(dev->dev, cfg);
> +}
> +
> +int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
> +			const struct rcb_size_info *size_info,
> +			size_t rcb_count)
> +{
> +	int ret, i;
> +	u32 width, height;
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +	struct rkvdec_rcb_config *cfg;
> +
> +	ctx->rcb_config = devm_kzalloc(rkvdec->dev, sizeof(*ctx->rcb_config), GFP_KERNEL);

Should we allocate a rcb_config when rcb_count = 0 or size_info is NULL?

> +	if (!ctx->rcb_config)
> +		return -ENOMEM;
> +
> +	cfg = ctx->rcb_config;
> +
> +	cfg->rcb_bufs = devm_kzalloc(rkvdec->dev, sizeof(*cfg->rcb_bufs) * rcb_count, GFP_KERNEL);

This would try to allocate 0 bytes if rcb_count = 0.

> +	if (!cfg->rcb_bufs) {
> +		ret = -ENOMEM;
> +		goto err_alloc;
> +	}
> +
> +	width = ctx->decoded_fmt.fmt.pix_mp.width;
> +	height = ctx->decoded_fmt.fmt.pix_mp.height;
> +
> +	for (i = 0; i < rcb_count; i++) {
> +		void *cpu = NULL;
> +		dma_addr_t dma;
> +		size_t rcb_size = rkvdec_rcb_size(&size_info[i], width, height);
> +		enum rkvdec_alloc_type alloc_type = RKVDEC_ALLOC_SRAM;
> +
> +		/* Try allocating an SRAM buffer */
> +		if (ctx->dev->sram_pool) {
> +			if (rkvdec->iommu_domain)
> +				rcb_size = ALIGN(rcb_size, 0x1000);
> +
> +			cpu = gen_pool_dma_zalloc_align(ctx->dev->sram_pool,
> +							rcb_size,
> +							&dma,
> +							0x1000);
> +		}
> +
> +		/* If an IOMMU is used, map the SRAM address through it */
> +		if (cpu && rkvdec->iommu_domain) {
> +			unsigned long virt_addr = (unsigned long)cpu;
> +			phys_addr_t phys_addr = dma;
> +
> +			ret = iommu_map(rkvdec->iommu_domain, virt_addr, phys_addr,
> +					rcb_size, IOMMU_READ | IOMMU_WRITE, 0);
> +			if (ret) {
> +				gen_pool_free(ctx->dev->sram_pool,
> +					      (unsigned long)cpu,
> +					      rcb_size);
> +				cpu = NULL;
> +				goto ram_fallback;
> +			}
> +
> +			/*
> +			 * The registers will be configured with the virtual
> +			 * address so that it goes through the IOMMU
> +			 */
> +			dma = virt_addr;
> +		}
> +
> +ram_fallback:
> +		/* Fallback to RAM */
> +		if (!cpu) {
> +			cpu = dma_alloc_coherent(ctx->dev->dev,
> +						 rcb_size,
> +						 &dma,
> +						 GFP_KERNEL);
> +			alloc_type = RKVDEC_ALLOC_DMA;
> +		}
> +
> +		if (!cpu) {
> +			ret = -ENOMEM;
> +			goto err_alloc;
> +		}
> +
> +		cfg->rcb_bufs[i].cpu = cpu;
> +		cfg->rcb_bufs[i].dma = dma;
> +		cfg->rcb_bufs[i].size = rcb_size;
> +		cfg->rcb_bufs[i].type = alloc_type;
> +
> +		cfg->rcb_count += 1;
> +	}
> +
> +	return 0;
> +
> +err_alloc:
> +	rkvdec_free_rcb(ctx);
> +
> +	return ret;
> +}
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> new file mode 100644
> index 000000000000..30e8002555c8
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip video decoder Rows and Cols Buffers manager
> + *
> + * Copyright (C) 2025 Collabora, Ltd.
> + *  Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include <linux/types.h>
> +
> +struct rkvdec_ctx;
> +
> +enum rcb_axis {
> +	PIC_WIDTH = 0,
> +	PIC_HEIGHT = 1
> +};
> +
> +struct rcb_size_info {
> +	u8 multiplier;
> +	enum rcb_axis axis;
> +};
> +
> +int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
> +			const struct rcb_size_info *size_info,
> +			size_t rcb_count);
> +dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id);
> +size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id);
> +int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
> +void rkvdec_free_rcb(struct rkvdec_ctx *ctx);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index a7af1e3fdebd..5dd486edd64d 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/genalloc.h>
>  #include <linux/interrupt.h>
>  #include <linux/iommu.h>
>  #include <linux/module.h>
> @@ -28,6 +29,7 @@
>  
>  #include "rkvdec.h"
>  #include "rkvdec-regs.h"
> +#include "rkvdec-rcb.h"
>  
>  static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
>  				   enum rkvdec_image_fmt fmt2)
> @@ -771,6 +773,7 @@ static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
>  {
>  	struct rkvdec_ctx *ctx = vb2_get_drv_priv(q);
>  	const struct rkvdec_coded_fmt_desc *desc;
> +	const struct rkvdec_config *cfg = ctx->dev->variant->config;
>  	int ret;
>  
>  	if (V4L2_TYPE_IS_CAPTURE(q->type))
> @@ -780,13 +783,22 @@ static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
>  	if (WARN_ON(!desc))
>  		return -EINVAL;
>  
> +	ret = rkvdec_allocate_rcb(ctx, cfg->rcb_size_info, cfg->rcb_num);

The older variants do not seem to use rcb and there does not seem to be
any check check for rcb_num > 0 in rkvdec_allocate_rcb().

Do we need to protect the call here or bail out early inside the func?

Regards,
Jonas

> +	if (ret)
> +		return ret;
> +
>  	if (desc->ops->start) {
>  		ret = desc->ops->start(ctx);
>  		if (ret)
> -			return ret;
> +			goto err_ops_start;
>  	}
>  
>  	return 0;
> +
> +err_ops_start:
> +	rkvdec_free_rcb(ctx);
> +
> +	return ret;
>  }
>  
>  static void rkvdec_queue_cleanup(struct vb2_queue *vq, u32 state)
> @@ -822,6 +834,8 @@ static void rkvdec_stop_streaming(struct vb2_queue *q)
>  
>  		if (desc->ops->stop)
>  			desc->ops->stop(ctx);
> +
> +		rkvdec_free_rcb(ctx);
>  	}
>  
>  	rkvdec_queue_cleanup(q, VB2_BUF_STATE_ERROR);
> @@ -1350,6 +1364,10 @@ static int rkvdec_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	rkvdec->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> +	if (!rkvdec->sram_pool && rkvdec->variant->config->rcb_num > 0)
> +		dev_info(&pdev->dev, "No sram node, RCB will be stored in RAM\n");
> +
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> @@ -1358,7 +1376,8 @@ static int rkvdec_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_disable_runtime_pm;
>  
> -	if (iommu_get_domain_for_dev(&pdev->dev)) {
> +	rkvdec->iommu_domain = iommu_get_domain_for_dev(&pdev->dev);
> +	if (rkvdec->iommu_domain) {
>  		rkvdec->empty_domain = iommu_paging_domain_alloc(rkvdec->dev);
>  
>  		if (IS_ERR(rkvdec->empty_domain)) {
> @@ -1372,6 +1391,10 @@ static int rkvdec_probe(struct platform_device *pdev)
>  err_disable_runtime_pm:
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +
> +	if (rkvdec->sram_pool)
> +		gen_pool_destroy(rkvdec->sram_pool);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index 3b1cc511412e..74f71542e031 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -19,6 +19,7 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-core.h>
>  #include <media/videobuf2-dma-contig.h>
>  
> @@ -29,6 +30,7 @@
>  #define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
>  
>  struct rkvdec_ctx;
> +struct rkvdec_rcb_config;
>  
>  struct rkvdec_ctrl_desc {
>  	struct v4l2_ctrl_config cfg;
> @@ -117,6 +119,8 @@ struct rkvdec_coded_fmt_desc {
>  struct rkvdec_config {
>  	const struct rkvdec_coded_fmt_desc *coded_fmts;
>  	size_t coded_fmts_num;
> +	const struct rcb_size_info *rcb_size_info;
> +	size_t rcb_num;
>  };
>  
>  struct rkvdec_dev {
> @@ -129,6 +133,8 @@ struct rkvdec_dev {
>  	void __iomem *regs;
>  	struct mutex vdev_lock; /* serializes ioctls */
>  	struct delayed_work watchdog_work;
> +	struct gen_pool *sram_pool;
> +	struct iommu_domain *iommu_domain;
>  	struct iommu_domain *empty_domain;
>  	const struct rkvdec_variant *variant;
>  };
> @@ -141,6 +147,7 @@ struct rkvdec_ctx {
>  	struct v4l2_ctrl_handler ctrl_hdl;
>  	struct rkvdec_dev *dev;
>  	enum rkvdec_image_fmt image_fmt;
> +	struct rkvdec_rcb_config *rcb_config;
>  	void *priv;
>  };
>  
> @@ -149,10 +156,16 @@ static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)
>  	return container_of(file_to_v4l2_fh(filp), struct rkvdec_ctx, fh);
>  }
>  
> +enum rkvdec_alloc_type {
> +	RKVDEC_ALLOC_DMA  = 0,
> +	RKVDEC_ALLOC_SRAM = 1,
> +};
> +
>  struct rkvdec_aux_buf {
>  	void *cpu;
>  	dma_addr_t dma;
>  	size_t size;
> +	enum rkvdec_alloc_type type;
>  };
>  
>  void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);


