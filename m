Return-Path: <linux-media+bounces-24601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 395A7A08CDF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 314D73A9B75
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E182B20C49E;
	Fri, 10 Jan 2025 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PU4IrSa3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2C020C485;
	Fri, 10 Jan 2025 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502314; cv=none; b=W+4D01Fioi8mZJPb3GNJyMx7IW19lsBs6Ce1gOiPC7WgDIAII+D4iYxmzIET5AmGdnH2CrvMrV8orhTT0qK9HwFIOldC7NxmrEW8ul4nvY3EiVuDlUrnxth4yF88vQgNTsbmgqR/JK7lqeFVaMq4fEVYTh8OZgg7j+xxjq4RFpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502314; c=relaxed/simple;
	bh=7Znhp/U94tMKQ2/LeailiP2ewbF22VcLZAcNtav1FqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4QHdVrnZQptL97dDWfZN8IsI2AlYFwKwq5ORpylJjPRKZLauTdpWnt7Kz0c7v6fX5/kV3Lp78LBm9V54upx+DfjaL3Ann2tycjjYAvA5Rv/j0Livg1BOaU/vxnjWaUuEmsXEMqgFzMNAehzbjAj0eFHe9guKUPIwDkxT6FR03U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PU4IrSa3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736502310;
	bh=7Znhp/U94tMKQ2/LeailiP2ewbF22VcLZAcNtav1FqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PU4IrSa3y+NUL8znH84XEh2w/gTaMlPbBRCzD/2zCgNZtPGy8tz2SGcAeZ9U8+emr
	 NBfjEpNKcOJXeoPXKcy/mfQzcAJrbJ+xVjhuSNehdvhAXrFVlpc4OZDYrL+RvhYnz4
	 B3sKGnYNCOHmoITJxO87EGJCD85mqOAUYb+Ayt8OUnUQwx55OV615KDF/R6BYdviEg
	 HJmTPlGVchgjR9WKARGA5ZKanwRxqSxkJaHQiR0ZL+PAFLyLRpqFcCrp06Um/aqbQy
	 CoEcken0KuV7U77MyYxy0g8lVSGutC0J+5aAz5NF0LAfeej3uTS7ify8zUuyVuP94+
	 x40q/ESDxZbjQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 595C417E0CD2;
	Fri, 10 Jan 2025 10:45:09 +0100 (CET)
Message-ID: <df63b281-6889-4ac1-8dfc-b61d81061953@collabora.com>
Date: Fri, 10 Jan 2025 10:45:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1,05/12] media: mediatek: jpeg: fix jpeg hw count setting
To: "kyrie.wu" <kyrie.wu@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
 <20250109133513.20151-6-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250109133513.20151-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/01/25 14:35, kyrie.wu ha scritto:
> 1. different IC has different hw core;
> 2. use a parameter to set jpeg hw count.

In MT8195, each decoder core has its own devicetree node, so you can count
how many cores are actually present and registered.

Please do the same with MT8196, and replace MTK_JPEG{ENC,DEC}_HW_MAX with a
variable that stores the number of cores, counted at probe time.

Regards,
Angelo

> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 28 +++++++++++++++----
>   .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  2 ++
>   2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 77b3bd6c4d3f..4dc6f82d74fa 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1468,7 +1468,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *ctx)
>   	int i;
>   
>   	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
> +	for (i = 0; i < jpeg->variant->max_hw_count; i++) {
>   		comp_jpeg = jpeg->enc_hw_dev[i];
>   		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
>   			hw_id = i;
> @@ -1515,7 +1515,7 @@ static int mtk_jpegdec_get_hw(struct mtk_jpeg_ctx *ctx)
>   	int i;
>   
>   	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> +	for (i = 0; i < jpeg->variant->max_hw_count; i++) {
>   		comp_jpeg = jpeg->dec_hw_dev[i];
>   		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
>   			hw_id = i;
> @@ -1598,7 +1598,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
>   		jpeg_work);
>   	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>   
> -	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++)
> +	for (i = 0; i < jpeg->variant->max_hw_count; i++)
>   		comp_jpeg[i] = jpeg->enc_hw_dev[i];
>   	i = 0;
>   
> @@ -1696,7 +1696,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
>   	struct mtk_jpeg_fb fb;
>   	unsigned long flags;
>   
> -	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++)
> +	for (i = 0; i < jpeg->variant->max_hw_count; i++)
>   		comp_jpeg[i] = jpeg->dec_hw_dev[i];
>   	i = 0;
>   
> @@ -1925,6 +1925,7 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
>   	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
>   	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>   	.multi_core = true,
> +	.max_hw_count = 2,
>   	.jpeg_worker = mtk_jpegenc_worker,
>   };
>   
> @@ -1938,6 +1939,21 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
>   	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>   	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
>   	.multi_core = true,
> +	.max_hw_count = 3,
> +	.jpeg_worker = mtk_jpegdec_worker,
> +};
> +
> +static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata = {
> +	.formats = mtk_jpeg_dec_formats,
> +	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
> +	.qops = &mtk_jpeg_dec_qops,
> +	.m2m_ops = &mtk_jpeg_multicore_dec_m2m_ops,
> +	.dev_name = "mtk-jpeg-dec",
> +	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
> +	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
> +	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
> +	.multi_core = true,
> +	.max_hw_count = 2,
>   	.jpeg_worker = mtk_jpegdec_worker,
>   };
>   
> @@ -1954,6 +1970,7 @@ static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
>   	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
>   	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
>   	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
> +	.max_hw_count = 1,
>   	.support_34bit = true,
>   };
>   
> @@ -1970,6 +1987,7 @@ static const struct mtk_jpeg_variant mtk8188_jpegdec_drvdata = {
>   	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
>   	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>   	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
> +	.max_hw_count = 1,
>   	.support_34bit = true,
>   };
>   
> @@ -2008,7 +2026,7 @@ static const struct of_device_id mtk_jpeg_match[] = {
>   	},
>   	{
>   		.compatible = "mediatek,mt8196-jpgdec",
> -		.data = &mtk8195_jpegdec_drvdata,
> +		.data = &mtk8196_jpegdec_drvdata,
>   	},
>   	{},
>   };
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index d3aba1e6cae8..38672499ca18 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -74,6 +74,7 @@ enum mtk_jpeg_ctx_state {
>    * @out_q_default_fourcc:	output queue default fourcc
>    * @cap_q_default_fourcc:	capture queue default fourcc
>    * @multi_core:		mark jpeg hw is multi_core or not
> + * @max_hw_count:		jpeg hw-core count
>    * @jpeg_worker:		jpeg dec or enc worker
>    * @support_34bit:	flag to check if support dma_address 34bit
>    */
> @@ -91,6 +92,7 @@ struct mtk_jpeg_variant {
>   	u32 out_q_default_fourcc;
>   	u32 cap_q_default_fourcc;
>   	bool multi_core;
> +	u32 max_hw_count;
>   	void (*jpeg_worker)(struct work_struct *work);
>   	bool support_34bit;
>   };


