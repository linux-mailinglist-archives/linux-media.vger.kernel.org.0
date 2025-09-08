Return-Path: <linux-media+bounces-42039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8099EB4985C
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 20:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3733E3B39B9
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 18:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CBD3164B7;
	Mon,  8 Sep 2025 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="gmdHZEpj"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC204A2D;
	Mon,  8 Sep 2025 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757356391; cv=pass; b=TiaTWiL2YcGG84/WG97/s4SqaDnofO/0ZIcdAqdxCF0qwN9ZjSJFGUsMYOILCN02Jme+pJpa4K5glc0Na9S6iCGAJA9LgkvxvcO4q8pVvzAcVTTJTVKRoFpGZX6lGbyHVE4crN2WCURIDAkHPyvFq1eZVcV7K2Yrli8EMBSMuAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757356391; c=relaxed/simple;
	bh=EHo9+NbhnZGG6NdApLz2AIMTAkqhCWD3bSxkZ2zHasE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NUi2zCaMbgVXA8V8CL3bTYpI3eqlL4fkGLFYR2EXxj4AHPRZ/UKec66MkRGE6Yj7V0bMbsDFyJy4V6fqh1KFM9u+Z/nhJaMJvPtmwlgOzvlF1segVUQbfW+KJmYDlxVEgH4C6CFQh8R65I+rd7JdM2XlBsFLg5T861JgPgC3osg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=gmdHZEpj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757356371; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mP1gqjkdiUExNbEz/+ZLOQQRp/VIvy2jg6mCgwuNQvpld/C57PjRbvmWiRJhWc0OyzbbB65Ymt4tCkSYA9iTx0hgW3c/zRMmuSUC8zl97O1/jjklh4OHqQJDJoHNK0R4ACGeg0kxbnkIhx2Ma0ccXKkD73BObWmkSZFEX9n5L0g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757356371; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6ltzTi+I6kPPm3F0lLcLlkqmygrdjRSVDeW/ROJ50BY=; 
	b=nEU6mm47QxW+KIhbYWdgDGNME8hkZ19fI0B+ngC/O/wyYyU6MvQ6q8A5rSx+wdNH7x7gCh1pnpcl9yY5tshNPPawa23W+z7SELy+UOrDk/G6efLfRRUpodfHJjrxVXAeQ06p6gXjZKl5wvWqmx6ZPos7dCZh4RPSv1mo6ah+cjE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757356371;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6ltzTi+I6kPPm3F0lLcLlkqmygrdjRSVDeW/ROJ50BY=;
	b=gmdHZEpjqx+Qs0N9zbN7Mgz3VYtN9gkYEaDT2OQegj86gUyG0C+igfYzxfo69760
	P6q8Y0ULhZPp/AskthsyD20oYxulxBHfDGLyTvGcNu83D/XLEiWWVN98eEW489zYcYs
	uLSd90pCQs2vD5VVk7y3fPyi/DeL9IgdV7qMC430=
Received: by mx.zohomail.com with SMTPS id 1757356367793396.9789493803712;
	Mon, 8 Sep 2025 11:32:47 -0700 (PDT)
Message-ID: <c05ea992-b0d8-4ea4-8a11-660b9cae4820@collabora.com>
Date: Mon, 8 Sep 2025 14:32:45 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: rkvdec: Add variants support
To: Jonas Karlman <jonas@kwiboo.se>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250905161942.3759717-1-jonas@kwiboo.se>
 <20250905161942.3759717-3-jonas@kwiboo.se>
Content-Language: en-US, fr-CA
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <20250905161942.3759717-3-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jonas,

On 9/5/25 12:19, Jonas Karlman wrote:
> From: Alex Bee <knaerzche@gmail.com>
>
> Different versions of the Rockchip VDEC IP exists and one way they can
> differ is what decoding formats are supported.
>
> Add a variant implementation in order to support flagging different
> capabilities.
>
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v3:
> - Use a reference to rkvdec_variant
> - Add num_regs field

Why are you adding this field ? I don't see it being used in a later patch.

Would that be useful for writing the right amount of registers later 
when switching to structs and memcpy ?

I haven't checked how different the register maps are between those 
different variants.

> - Collect r-b tag
>
> Changes in v2:
> - No change
> ---
>   .../media/platform/rockchip/rkvdec/rkvdec.c   | 22 ++++++++++++++++++-
>   .../media/platform/rockchip/rkvdec/rkvdec.h   | 11 ++++++++++
>   2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index c15fc238d6af..daf6d9ab2d1d 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -14,6 +14,7 @@
>   #include <linux/iommu.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/of_device.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm.h>
>   #include <linux/pm_runtime.h>
> @@ -327,6 +328,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>   		.ops = &rkvdec_hevc_fmt_ops,
>   		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
>   		.decoded_fmts = rkvdec_hevc_decoded_fmts,
> +		.capability = RKVDEC_CAPABILITY_HEVC,
>   	},
>   	{
>   		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> @@ -343,6 +345,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>   		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
>   		.decoded_fmts = rkvdec_h264_decoded_fmts,
>   		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +		.capability = RKVDEC_CAPABILITY_H264,
>   	},
>   	{
>   		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
> @@ -358,6 +361,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>   		.ops = &rkvdec_vp9_fmt_ops,
>   		.num_decoded_fmts = ARRAY_SIZE(rkvdec_vp9_decoded_fmts),
>   		.decoded_fmts = rkvdec_vp9_decoded_fmts,
> +		.capability = RKVDEC_CAPABILITY_VP9,
>   	}
>   };
>   
> @@ -1186,8 +1190,18 @@ static void rkvdec_watchdog_func(struct work_struct *work)
>   	}
>   }
>   
> +static const struct rkvdec_variant rk3399_rkvdec_variant = {
> +	.num_regs = 78,
> +	.capabilities = RKVDEC_CAPABILITY_HEVC |
> +			RKVDEC_CAPABILITY_H264 |
> +			RKVDEC_CAPABILITY_VP9,
> +};
> +
>   static const struct of_device_id of_rkvdec_match[] = {
> -	{ .compatible = "rockchip,rk3399-vdec" },
> +	{
> +		.compatible = "rockchip,rk3399-vdec",
> +		.data = &rk3399_rkvdec_variant,
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> @@ -1198,16 +1212,22 @@ static const char * const rkvdec_clk_names[] = {
>   
>   static int rkvdec_probe(struct platform_device *pdev)
>   {
> +	const struct rkvdec_variant *variant;
>   	struct rkvdec_dev *rkvdec;
>   	unsigned int i;
>   	int ret, irq;
>   
> +	variant = of_device_get_match_data(&pdev->dev);
> +	if (!variant)
> +		return -EINVAL;
> +
>   	rkvdec = devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
>   	if (!rkvdec)
>   		return -ENOMEM;
>   
>   	platform_set_drvdata(pdev, rkvdec);
>   	rkvdec->dev = &pdev->dev;
> +	rkvdec->variant = variant;
>   	mutex_init(&rkvdec->vdev_lock);
>   	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
>   
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index 209dd79ce9bd..c47457c954e5 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -22,6 +22,10 @@
>   #include <media/videobuf2-core.h>
>   #include <media/videobuf2-dma-contig.h>
>   
> +#define RKVDEC_CAPABILITY_HEVC		BIT(0)
> +#define RKVDEC_CAPABILITY_H264		BIT(1)
> +#define RKVDEC_CAPABILITY_VP9		BIT(2)
> +
>   struct rkvdec_ctx;
>   
>   struct rkvdec_ctrl_desc {
> @@ -63,6 +67,11 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>   			    base.vb.vb2_buf);
>   }
>   
> +struct rkvdec_variant {
> +	unsigned int num_regs;
> +	unsigned int capabilities;
> +};
> +
>   struct rkvdec_coded_fmt_ops {
>   	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
>   			  struct v4l2_format *f);
> @@ -98,6 +107,7 @@ struct rkvdec_coded_fmt_desc {
>   	unsigned int num_decoded_fmts;
>   	const struct rkvdec_decoded_fmt_desc *decoded_fmts;
>   	u32 subsystem_flags;
> +	unsigned int capability;
>   };
>   
>   struct rkvdec_dev {
> @@ -111,6 +121,7 @@ struct rkvdec_dev {
>   	struct mutex vdev_lock; /* serializes ioctls */
>   	struct delayed_work watchdog_work;
>   	struct iommu_domain *empty_domain;
> +	const struct rkvdec_variant *variant;
>   };
>   
>   struct rkvdec_ctx {

Regards,

Detlev


