Return-Path: <linux-media+bounces-15776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3B9947A31
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 13:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C849AB220C8
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 11:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06601155386;
	Mon,  5 Aug 2024 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=angelogioacchino.delregno@collabora.com header.b="MA9vZ0KS"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E6A13AD11;
	Mon,  5 Aug 2024 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722855813; cv=pass; b=FdlHE85R154pAX0Y9BQU+aoy0Xw0j+pIhM60pQAR0iCKejD6OAAqLFlQ3Ekt8y7ZIKl9yfUSV/PoK3wlGuQCvDElTWkGGktoVslvAYfWYNgqKrk/1g4dYGMsy03N3owm2Igf7WmkYiYJIzLMTALt+6nt/Jhdi8I+vsbcCfpRRFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722855813; c=relaxed/simple;
	bh=fGIqNS9rvVM6w97AeH5WYsP1wBneJMIRmrL1fmcjpgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sqev5yaAen9CcNo65CHz7pMRsI2aInS0ql4pXNTG2R824aN2VSRomZ093JHgBSSKMkPSnsdXxKmZZK7IvMBKU5rCqdIZdugKp38A4iNqJZKyJu2BbcB6c5Pnn91Sm6/GzoC8usOzHDbEY2DSg8z4jK4ZWBglJ4jQgaYI4dA7DtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=angelogioacchino.delregno@collabora.com header.b=MA9vZ0KS; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: daniel.almeida@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1722855801; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nMI1pHC0citcabjOHWLJOKFR43yjr/ljcaEIDwGsgTw4wXGgAdEdgBNrtijEhN4buKCIAiS0nm9lSyCkXi7t/xxQe/ntZkLzJ7HjykPsgEr9+7DFh7VucLzdV2RJOgTNaaPULK4tHKhjS0ObRHE7O9H5eJltHhfZitjwoXjNF6g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722855801; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3F55AsMRhAsPWlg76OYcgmZE2JHxgl3YpIg0irEUe+k=; 
	b=bTVp260vS3+wv3l+qRFpIMfSOS3qderuE3T4+8HrZAfmInGBwz49h4fdIvCzXhVsO4xkOALVPKArYLbIQ6gQCC32GQLQHa1l21oT5cMFae6pCJL0A6PnivRgCWHnzgawsvwBl0vM98AdqlnRETgQMXQ8avHTUIPC5FkNqcN99CI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722855801;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3F55AsMRhAsPWlg76OYcgmZE2JHxgl3YpIg0irEUe+k=;
	b=MA9vZ0KSYrRVoFH/4CjU6YrPRgIbjGybHaCUmrfxjpfGN7maLQmlWB4JMX+yggTY
	dXo/SSQ+vuoQs3WeY2GQy78oaXYGXKwX/xZXwlK1nYoYPk3acTxmy4nk5d35qC02KPS
	MS2o7ozyU21AwgPj4KUcGpmYyksHHSHXkKfFsHYU=
Received: by mx.zohomail.com with SMTPS id 1722855800152913.3061181095068;
	Mon, 5 Aug 2024 04:03:20 -0700 (PDT)
Message-ID: <2035c6ef-ff91-43d6-8270-7dcb3ae6fbfc@collabora.com>
Date: Mon, 5 Aug 2024 13:03:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] media: mediatek: jpeg: support 34bits
To: Jianhua Lin <jianhua.lin@mediatek.com>, daniel.almeida@collabora.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240801031012.31053-1-jianhua.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240801031012.31053-1-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Il 01/08/24 05:10, Jianhua Lin ha scritto:
> the iommu HW supported 34bits iova space(16GB),
> but mediatek jpeg enc/dec driver still is 32bit,
> then need to set the bit32/bit33 iova to jpeg HW.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
> Changes compared with v3:
> - remove of_property_read_bool() for 34bit supporting check.
> - move the support_34bit into the platform data(mtk_jpeg_variant)
>    for the specific SoC supporting.
> - add mtk8188 SoC to compatible list.
> 
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 55 ++++++++++++++++-
>   .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  4 ++
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 59 +++++++++++++++----
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |  1 +
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |  8 +++
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 44 ++++++++++++--
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |  7 ++-
>   7 files changed, 158 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index ac48658e2de4..101c509ab2ab 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

..snip..

> @@ -1860,6 +1863,10 @@ static struct clk_bulk_data mtk_jpeg_clocks[] = {
>       { .id = "jpgenc" },
>   };
>   +static struct clk_bulk_data mtk_jpeg_dec_clocks[] = {
> +    { .id = "jpgdec" },
> +};
> +
>   static struct clk_bulk_data mt8173_jpeg_dec_clocks[] = {
>       { .id = "jpgdec-smi" },
>       { .id = "jpgdec" },
> @@ -1878,6 +1885,7 @@ static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
>       .ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
>       .out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>       .cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
> +    .support_34bit = false,

You don't need to set this to false, as the default value is already 0 (false).

Please remove all instances of `.support_34bit = false`, and keep only the true
assignments, after which, and *only after*, on your v5:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   };
>     static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
> @@ -1894,6 +1902,7 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
>       .out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
>       .cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>       .multi_core = false,
> +    .support_34bit = false,
>   };
>     static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
> @@ -1907,6 +1916,7 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
>       .cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>       .multi_core = true,
>       .jpeg_worker = mtk_jpegenc_worker,
> +    .support_34bit = false,
>   };
>     static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
> @@ -1920,6 +1930,41 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
>       .cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
>       .multi_core = true,
>       .jpeg_worker = mtk_jpegdec_worker,
> +    .support_34bit = false,
> +};
> +
> +static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
> +    .clks = mtk_jpeg_clocks,
> +    .num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
> +    .formats = mtk_jpeg_enc_formats,
> +    .num_formats = MTK_JPEG_ENC_NUM_FORMATS,
> +    .qops = &mtk_jpeg_enc_qops,
> +    .irq_handler = mtk_jpeg_enc_irq,
> +    .hw_reset = mtk_jpeg_enc_reset,
> +    .m2m_ops = &mtk_jpeg_enc_m2m_ops,
> +    .dev_name = "mtk-jpeg-enc",
> +    .ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
> +    .out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
> +    .cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
> +    .multi_core = false,
> +    .support_34bit = true,
> +};
> +
> +static const struct mtk_jpeg_variant mtk8188_jpegdec_drvdata = {
> +    .clks = mtk_jpeg_dec_clocks,
> +    .num_clks = ARRAY_SIZE(mtk_jpeg_dec_clocks),
> +    .formats = mtk_jpeg_dec_formats,
> +    .num_formats = MTK_JPEG_DEC_NUM_FORMATS,
> +    .qops = &mtk_jpeg_dec_qops,
> +    .irq_handler = mtk_jpeg_dec_irq,
> +    .hw_reset = mtk_jpeg_dec_reset,
> +    .m2m_ops = &mtk_jpeg_dec_m2m_ops,
> +    .dev_name = "mtk-jpeg-dec",
> +    .ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
> +    .out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
> +    .cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
> +    .multi_core = false,
> +    .support_34bit = true,
>   };
>   

