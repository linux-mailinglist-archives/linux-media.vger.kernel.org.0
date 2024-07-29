Return-Path: <linux-media+bounces-15450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 569F493F5A7
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 14:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B95FEB21AEC
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 12:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9C01487F4;
	Mon, 29 Jul 2024 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="zDIMeh0K"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E69B1474CF;
	Mon, 29 Jul 2024 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722256922; cv=none; b=sNSnZS7FpSN9CNTejmfKGsH6Cq0cMIImnLprci4KDfYEUvHBBPb7xetU4pjrozJZdUZSPHQrkuPAeeckZK61zWke6lwg1LN4k6kW4lMBNX32EA4eIZnQfoE8w1kUKm2elT5s8zJ5KyHM99WX0QSLuK2HTOGWL/ymNN+ug+nsTPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722256922; c=relaxed/simple;
	bh=X2u0PrWontZeldcDpL+njEQwMDia9hCQv81wis8dBZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/On7Ju2T+MOcD16D3zFmUK7hAfEmK7Crjm+VuAGsBnx9AMXCa/Xb2MByWCn78WHruKiNHGNx2FMK+mZq8YuE001i0FuMD8jd5RdzSXiuavm+plGZn5i3YBITXgXsWbrcBr78hlMTobSdoUN10iLk1ljRhP1Cho949A49FDnyjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=zDIMeh0K; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722256919;
	bh=X2u0PrWontZeldcDpL+njEQwMDia9hCQv81wis8dBZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=zDIMeh0KQ57DH7NdTsBL1i5R22tUOSs33l+APLxNicDEnocmlSDFe7YGBKzUhQsYg
	 KcJi6lIdBhrDlPPF9PBtsPqmPO8GrtyPjQlDGVCSh/Q7bkax57y1k4/fXgVbqY/Mv7
	 22BxG+F7nw9zuefRiT0dbbI/N/dZdgAZNF1OM58yJiQSIzCowrJuUntD3t/VeicCd/
	 T3/875y2VBHgiOEbd4msgw5NsVLZaz0k8YGO+sFLiK64kwM5ovVQhXn3aqOii8+u9q
	 FykHVw409xZoImd55I5O6WJMv7EhWZP/4VDWi8pbNYxkXBwGhvOT6Ij4iFh/dqRLbG
	 WgkpulPZQudQA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 194A437804D4;
	Mon, 29 Jul 2024 12:41:59 +0000 (UTC)
Message-ID: <ae3a3925-0c34-4e05-8786-f76debadab9a@collabora.com>
Date: Mon, 29 Jul 2024 14:41:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] media: mediatek: jpeg: support 34bits
To: Jianhua Lin <jianhua.lin@mediatek.com>, daniel.almeida@collabora.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240728120140.25135-1-jianhua.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240728120140.25135-1-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 28/07/24 14:01, Jianhua Lin ha scritto:
> the iommu HW supported 34bits iova space(16GB),
> but mediatek jpeg enc/dec driver still is 32bit,
> then need to set the bit32/bit33 iova to jpeg HW.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
> Changes compared with v2:
> - remove dev_info() to print 34bits support info.
> - keep of_property_read_bool() to check 34bits status,
>    because need to compatible old soc.
> - use FIELD_PREP() and GENMASK() to generate bit mask.
> - remove rdma pandig enable code, because the code not
>    related to 34bit support.
>   
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  8 ++-
>   .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  4 ++
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 59 +++++++++++++++----
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |  1 +
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |  8 +++
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 44 ++++++++++++--
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |  7 ++-
>   7 files changed, 111 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index ac48658e2de4..abee5ee5c6e3 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1030,6 +1030,7 @@ static void mtk_jpeg_dec_device_run(void *priv)
>   	spin_lock_irqsave(&jpeg->hw_lock, flags);
>   	mtk_jpeg_dec_reset(jpeg->reg_base);
>   	mtk_jpeg_dec_set_config(jpeg->reg_base,
> +				jpeg->support_34bit,
>   				&jpeg_src_buf->dec_param,
>   				jpeg_src_buf->bs_size,
>   				&bs,
> @@ -1317,6 +1318,9 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> +	if (of_property_read_bool(pdev->dev.of_node, "mediatek,34bits"))

I seem to remember that I already reviewed this part and said that this is a SoC
capability, meaning that one SoC either always does, or always doesn't support
34-bits IOVA.

This means that this **shall not** be a devicetree property, but *must* be set in
the platform data (mtk_jpeg_variant) for the specific SoC supporting that.

> +		jpeg->support_34bit = true;
> +
>   	if (!jpeg->variant->multi_core) {
>   		ret = mtk_jpeg_single_core_init(pdev, jpeg);
>   		if (ret) {
> @@ -1564,7 +1568,8 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
>   	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>   	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>   
> -	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
> +	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
> +			ctx->jpeg->support_34bit);
>   	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
>   
>   	buf_state = VB2_BUF_STATE_DONE;
> @@ -1764,6 +1769,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
>   	ctx->total_frame_num++;
>   	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
>   	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
> +				jpeg->support_34bit,
>   				&jpeg_src_buf->dec_param,
>   				jpeg_src_buf->bs_size,
>   				&bs,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 8ba6e757e11a..bf65bb54a035 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -34,6 +34,8 @@
>   
>   #define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)
>   
> +#define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
> +
>   /**
>    * enum mtk_jpeg_ctx_state - states of the context state machine
>    * @MTK_JPEG_INIT:		current state is initialized
> @@ -209,6 +211,7 @@ struct mtk_jpegdec_comp_dev {
>    * @reg_decbase:	jpg decode register base addr
>    * @dec_hw_dev:	jpg decode hardware device
>    * @hw_index:		jpg hw index
> + * @support_34bit:	flag to check if support dma_address 34bit
>    */
>   struct mtk_jpeg_dev {
>   	struct mutex		lock;
> @@ -231,6 +234,7 @@ struct mtk_jpeg_dev {
>   	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
>   	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
>   	atomic_t hw_index;
> +	bool support_34bit;

...and you don't need to add this member here, as struct mtk_jpeg_dev
already has a pointer to mtk_jpeg_variant, which will contain the same
member from platform data.

Regards,
Angelo



