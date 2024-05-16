Return-Path: <linux-media+bounces-11508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 477028C7244
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 09:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1486B21C26
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 07:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B22604D5;
	Thu, 16 May 2024 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QCEBCFV5"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C6E4120A;
	Thu, 16 May 2024 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715845770; cv=none; b=uBFq3vZbB6uBtG67HNRLghO60PzqxUQbiHb5iZ11B9kNJ5kr3ZddsAbKZIswbI798kn9zCcQtII46oibnok40z+mELnNTqyaOnDv2JX6bXMS0ZzpDOQAkaNPORhjo8cGDe92blq7dVJoX+FXM9wRJk9nks6AE1Qise444PRHIL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715845770; c=relaxed/simple;
	bh=fh97yPEiZKC4xTQBr4NpLiFiLmrqRio3gdLh04+oAIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JO5oCRSYEd2QbPKHMycfY+557HSAW7EeansplBE74Sn0HhxbTyWturvwb0edqFcU1G0DMaHLIaWWcw7JQnWBk1zaWGsEcs3XvF60YaUAdt+UFoYfipcJNPRLm3mTnPwrLk19KXtFCk8IxT/umJpjqTC1vh2oWu9Z5HkFB275Km8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QCEBCFV5; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715845767;
	bh=fh97yPEiZKC4xTQBr4NpLiFiLmrqRio3gdLh04+oAIE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QCEBCFV5x/6O6ud6KPBABqmv4C4ugvWmaMA9W5Zwo0oJeJQIMxeNycqhwUYuOzjO5
	 xSywp9KuBmCWzZaYtgLe/5CHYgzCx6tr1q4I/vBdGvYGERdz5xFzY+OBdDO11S9liz
	 CaazF+ZK2WKRRJHY6fPxGJd16ZgQtpKrgpzjzaPk+872O8CR29mEVzC8g7bEwKVvR9
	 NlOMpFzhQMYCxIUv0dlYGabHooQ3RbLYMn3M3+DZjMnBtJb2Ux7muFm5IRehV6uNG8
	 Hg4XCvuzZvO+4QReLLMklunNLUzwJo9kZ8u0jL7cNEv4zQnJBut4RpQJNDzmVQTo5d
	 9hxyvaEFsgbQg==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 914A637821A7;
	Thu, 16 May 2024 07:49:26 +0000 (UTC)
Message-ID: <880e5e74-dc26-4c09-9372-f3465c3e9ee2@collabora.com>
Date: Thu, 16 May 2024 09:49:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicon: Add reference buffers compression
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20240514162054.294002-1-benjamin.gaignard@collabora.com>
 <2bfd5af3b56cd2c90e5236792c13f44e19d274f6.camel@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <2bfd5af3b56cd2c90e5236792c13f44e19d274f6.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 15/05/2024 à 19:31, Nicolas Dufresne a écrit :
> Hi,
>
> Le mardi 14 mai 2024 à 18:20 +0200, Benjamin Gaignard a écrit :
>> Reference frame compression is a feature added in G2 decoder to compress
>> frame buffers so that the bandwidth of storing/loading reference frames
>> can be reduced, especially when the resolution of decoded stream is of
>> high definition.
>>
>> The impact of compressed frames is confirmed when using perf to monitor
>> the number of memory accesses with or without compression feature.
>> The following command
>> perf stat -a -e imx8_ddr0/cycles/,imx8_ddr0/read-cycles/,imx8_ddr0/write-cycles/ gst-launch-1.0 filesrc location=Jockey_3840x2160_120fps_420_8bit_HEVC_RAW.hevc ! queue ! h265parse ! v4l2slh265dec ! fakesink
>>
>> give us these results
>> without compression feature:
>> Performance counter stats for 'system wide':
>>
>>          1711300345      imx8_ddr0/cycles/
>>           892207924      imx8_ddr0/read-cycles/
>>          1291785864      imx8_ddr0/write-cycles/
>>
>>        13.760048353 seconds time elapsed
>>
>> with compression feature:
>> Performance counter stats for 'system wide':
>>
>>           274526799      imx8_ddr0/cycles/
>>           453120194      imx8_ddr0/read-cycles/
>>           833391434      imx8_ddr0/write-cycles/
>>
>>        18.257831534 seconds time elapsed
> On my own testing the duration remained the same. Perhaps you had something else
> running during your test ? I would suggest to always runs multiple time such a
> test before sharing to avoid snapshot effect and possibly wrong interpretation

You need to force the decoder to produce NV12 to see the effect of patch.
I will update the test command line in the commit message.

>
> regards,
> Nicolas
>
>> As expected the number of read/write cycles are really lower when compression
>> is used.
>>
>> Since storing compression data requires more memory a module
>> parameter named 'hevc_use_compression' is used to enable/disable
>> this feature and, by default, compression isn't used.
> Perhaps a KConfig to change the default ?

That will be in v2
Regards,
Benjamin

>
>> Enabling compression feature means that decoder output frames
>> are stored with a specific compression pixel format. Since this
>> pixel format is unknown, this patch restrain compression feature
>> usage to the cases where post-processor pixels formats (NV12 or NV15)
>> are selected by the applications.
>>
>> Fluster compliance HEVC test suite score is still 141/147 after this patch.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
>> ---
>>   .../media/platform/verisilicon/hantro_g2.c    | 35 +++++++++++++++++
>>   .../platform/verisilicon/hantro_g2_hevc_dec.c | 20 ++++++++--
>>   .../platform/verisilicon/hantro_g2_regs.h     |  4 ++
>>   .../media/platform/verisilicon/hantro_hevc.c  |  8 ++++
>>   .../media/platform/verisilicon/hantro_hw.h    | 39 +++++++++++++++++++
>>   .../platform/verisilicon/hantro_postproc.c    |  6 ++-
>>   6 files changed, 108 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/hantro_g2.c b/drivers/media/platform/verisilicon/hantro_g2.c
>> index b880a6849d58..62ca91427360 100644
>> --- a/drivers/media/platform/verisilicon/hantro_g2.c
>> +++ b/drivers/media/platform/verisilicon/hantro_g2.c
>> @@ -9,6 +9,12 @@
>>   #include "hantro_g2_regs.h"
>>   
>>   #define G2_ALIGN	16
>> +#define CBS_SIZE	16	/* compression table size in bytes */
>> +#define CBS_LUMA	8	/* luminance CBS is composed of 1 8x8 coded block */
>> +#define CBS_CHROMA_W	(8 * 2)	/* chrominance CBS is composed of two 8x4 coded
>> +				 * blocks, with Cb CB first then Cr CB following
>> +				 */
>> +#define CBS_CHROMA_H	4
>>   
>>   void hantro_g2_check_idle(struct hantro_dev *vpu)
>>   {
>> @@ -56,3 +62,32 @@ size_t hantro_g2_motion_vectors_offset(struct hantro_ctx *ctx)
>>   
>>   	return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
>>   }
>> +
>> +static size_t hantro_g2_mv_size(struct hantro_ctx *ctx)
>> +{
>> +	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
>> +	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
>> +	unsigned int pic_width_in_ctbs, pic_height_in_ctbs;
>> +	unsigned int max_log2_ctb_size;
>> +
>> +	max_log2_ctb_size = sps->log2_min_luma_coding_block_size_minus3 + 3 +
>> +			    sps->log2_diff_max_min_luma_coding_block_size;
>> +	pic_width_in_ctbs = (sps->pic_width_in_luma_samples +
>> +			    (1 << max_log2_ctb_size) - 1) >> max_log2_ctb_size;
>> +	pic_height_in_ctbs = (sps->pic_height_in_luma_samples + (1 << max_log2_ctb_size) - 1)
>> +			     >> max_log2_ctb_size;
>> +
>> +	return pic_width_in_ctbs * pic_height_in_ctbs * (1 << (2 * (max_log2_ctb_size - 4))) * 16;
>> +}
>> +
>> +size_t hantro_g2_luma_compress_offset(struct hantro_ctx *ctx)
>> +{
>> +	return hantro_g2_motion_vectors_offset(ctx) +
>> +	       hantro_g2_mv_size(ctx);
>> +}
>> +
>> +size_t hantro_g2_chroma_compress_offset(struct hantro_ctx *ctx)
>> +{
>> +	return hantro_g2_luma_compress_offset(ctx) +
>> +	       hantro_hevc_luma_compressed_size(ctx->dst_fmt.width, ctx->dst_fmt.height);
>> +}
>> diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
>> index d3f8c33eb16c..85a44143b378 100644
>> --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
>> +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
>> @@ -367,11 +367,14 @@ static int set_ref(struct hantro_ctx *ctx)
>>   	const struct v4l2_ctrl_hevc_decode_params *decode_params = ctrls->decode_params;
>>   	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
>>   	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
>> +	dma_addr_t compress_luma_addr, compress_chroma_addr = 0;
>>   	struct hantro_dev *vpu = ctx->dev;
>>   	struct vb2_v4l2_buffer *vb2_dst;
>>   	struct hantro_decoded_buffer *dst;
>>   	size_t cr_offset = hantro_g2_chroma_offset(ctx);
>>   	size_t mv_offset = hantro_g2_motion_vectors_offset(ctx);
>> +	size_t compress_luma_offset = hantro_g2_luma_compress_offset(ctx);
>> +	size_t compress_chroma_offset = hantro_g2_chroma_compress_offset(ctx);
>>   	u32 max_ref_frames;
>>   	u16 dpb_longterm_e;
>>   	static const struct hantro_reg cur_poc[] = {
>> @@ -445,6 +448,8 @@ static int set_ref(struct hantro_ctx *ctx)
>>   
>>   		chroma_addr = luma_addr + cr_offset;
>>   		mv_addr = luma_addr + mv_offset;
>> +		compress_luma_addr = luma_addr + compress_luma_offset;
>> +		compress_chroma_addr = luma_addr + compress_chroma_offset;
>>   
>>   		if (dpb[i].flags & V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
>>   			dpb_longterm_e |= BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
>> @@ -452,6 +457,8 @@ static int set_ref(struct hantro_ctx *ctx)
>>   		hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), luma_addr);
>>   		hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), chroma_addr);
>>   		hantro_write_addr(vpu, G2_REF_MV_ADDR(i), mv_addr);
>> +		hantro_write_addr(vpu, G2_REF_COMP_LUMA_ADDR(i), compress_luma_addr);
>> +		hantro_write_addr(vpu, G2_REF_COMP_CHROMA_ADDR(i), compress_chroma_addr);
>>   	}
>>   
>>   	vb2_dst = hantro_get_dst_buf(ctx);
>> @@ -465,19 +472,27 @@ static int set_ref(struct hantro_ctx *ctx)
>>   
>>   	chroma_addr = luma_addr + cr_offset;
>>   	mv_addr = luma_addr + mv_offset;
>> +	compress_luma_addr = luma_addr + compress_luma_offset;
>> +	compress_chroma_addr = luma_addr + compress_chroma_offset;
>>   
>>   	hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), luma_addr);
>>   	hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), chroma_addr);
>> -	hantro_write_addr(vpu, G2_REF_MV_ADDR(i++), mv_addr);
>> +	hantro_write_addr(vpu, G2_REF_MV_ADDR(i), mv_addr);
>> +	hantro_write_addr(vpu, G2_REF_COMP_LUMA_ADDR(i), compress_luma_addr);
>> +	hantro_write_addr(vpu, G2_REF_COMP_CHROMA_ADDR(i++), compress_chroma_addr);
>>   
>>   	hantro_write_addr(vpu, G2_OUT_LUMA_ADDR, luma_addr);
>>   	hantro_write_addr(vpu, G2_OUT_CHROMA_ADDR, chroma_addr);
>>   	hantro_write_addr(vpu, G2_OUT_MV_ADDR, mv_addr);
>> +	hantro_write_addr(vpu, G2_OUT_COMP_LUMA_ADDR, compress_luma_addr);
>> +	hantro_write_addr(vpu, G2_OUT_COMP_CHROMA_ADDR, compress_chroma_addr);
>>   
>>   	for (; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
>>   		hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), 0);
>>   		hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), 0);
>>   		hantro_write_addr(vpu, G2_REF_MV_ADDR(i), 0);
>> +		hantro_write_addr(vpu, G2_REF_COMP_LUMA_ADDR(i), 0);
>> +		hantro_write_addr(vpu, G2_REF_COMP_CHROMA_ADDR(i), 0);
>>   	}
>>   
>>   	hantro_reg_write(vpu, &g2_refer_lterm_e, dpb_longterm_e);
>> @@ -594,8 +609,7 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
>>   	/* Don't disable output */
>>   	hantro_reg_write(vpu, &g2_out_dis, 0);
>>   
>> -	/* Don't compress buffers */
>> -	hantro_reg_write(vpu, &g2_ref_compress_bypass, 1);
>> +	hantro_reg_write(vpu, &g2_ref_compress_bypass, !ctx->hevc_dec.use_compression);
>>   
>>   	/* Bus width and max burst */
>>   	hantro_reg_write(vpu, &g2_buswidth, BUS_WIDTH_128);
>> diff --git a/drivers/media/platform/verisilicon/hantro_g2_regs.h b/drivers/media/platform/verisilicon/hantro_g2_regs.h
>> index 82606783591a..b943b1816db7 100644
>> --- a/drivers/media/platform/verisilicon/hantro_g2_regs.h
>> +++ b/drivers/media/platform/verisilicon/hantro_g2_regs.h
>> @@ -318,6 +318,10 @@
>>   #define G2_TILE_BSD_ADDR		(G2_SWREG(183))
>>   #define G2_DS_DST			(G2_SWREG(186))
>>   #define G2_DS_DST_CHR			(G2_SWREG(188))
>> +#define G2_OUT_COMP_LUMA_ADDR		(G2_SWREG(190))
>> +#define G2_REF_COMP_LUMA_ADDR(i)	(G2_SWREG(192) + ((i) * 0x8))
>> +#define G2_OUT_COMP_CHROMA_ADDR		(G2_SWREG(224))
>> +#define G2_REF_COMP_CHROMA_ADDR(i)	(G2_SWREG(226) + ((i) * 0x8))
>>   
>>   #define g2_strm_buffer_len	G2_DEC_REG(258, 0, 0xffffffff)
>>   #define g2_strm_start_offset	G2_DEC_REG(259, 0, 0xffffffff)
>> diff --git a/drivers/media/platform/verisilicon/hantro_hevc.c b/drivers/media/platform/verisilicon/hantro_hevc.c
>> index 2c14330bc562..895dc0c76c74 100644
>> --- a/drivers/media/platform/verisilicon/hantro_hevc.c
>> +++ b/drivers/media/platform/verisilicon/hantro_hevc.c
>> @@ -25,6 +25,11 @@
>>   #define MAX_TILE_COLS 20
>>   #define MAX_TILE_ROWS 22
>>   
>> +bool hevc_use_compression;
>> +module_param_named(hevc_use_compression, hevc_use_compression, bool, 0644);
>> +MODULE_PARM_DESC(hevc_use_compression,
>> +		 "Use reference frame compression for HEVC");
>> +
>>   void hantro_hevc_ref_init(struct hantro_ctx *ctx)
>>   {
>>   	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
>> @@ -275,5 +280,8 @@ int hantro_hevc_dec_init(struct hantro_ctx *ctx)
>>   
>>   	hantro_hevc_ref_init(ctx);
>>   
>> +	hevc_dec->use_compression =
>> +		hevc_use_compression & hantro_needs_postproc(ctx, ctx->vpu_dst_fmt);
>> +
>>   	return 0;
>>   }
>> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
>> index 7737320cc8cc..43d4ff637376 100644
>> --- a/drivers/media/platform/verisilicon/hantro_hw.h
>> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
>> @@ -42,6 +42,14 @@
>>   
>>   #define MAX_POSTPROC_BUFFERS	64
>>   
>> +#define G2_ALIGN	16
>> +#define CBS_SIZE	16	/* compression table size in bytes */
>> +#define CBS_LUMA	8	/* luminance CBS is composed of 1 8x8 coded block */
>> +#define CBS_CHROMA_W	(8 * 2)	/* chrominance CBS is composed of two 8x4 coded
>> +				 * blocks, with Cb CB first then Cr CB following
>> +				 */
>> +#define CBS_CHROMA_H	4
>> +
>>   struct hantro_dev;
>>   struct hantro_ctx;
>>   struct hantro_buf;
>> @@ -144,6 +152,7 @@ struct hantro_hevc_dec_ctrls {
>>    * @ref_bufs_used:	Bitfield of used reference buffers
>>    * @ctrls:		V4L2 controls attached to a run
>>    * @num_tile_cols_allocated: number of allocated tiles
>> + * @use_compression:	use reference buffer compression
>>    */
>>   struct hantro_hevc_dec_hw_ctx {
>>   	struct hantro_aux_buf tile_sizes;
>> @@ -156,6 +165,7 @@ struct hantro_hevc_dec_hw_ctx {
>>   	u32 ref_bufs_used;
>>   	struct hantro_hevc_dec_ctrls ctrls;
>>   	unsigned int num_tile_cols_allocated;
>> +	bool use_compression;
>>   };
>>   
>>   /**
>> @@ -510,6 +520,33 @@ hantro_hevc_mv_size(unsigned int width, unsigned int height)
>>   	return width * height / 16;
>>   }
>>   
>> +static inline size_t
>> +hantro_hevc_luma_compressed_size(unsigned int width, unsigned int height)
>> +{
>> +	u32 pic_width_in_cbsy =
>> +		round_up((width + CBS_LUMA - 1) / CBS_LUMA, CBS_SIZE);
>> +	u32 pic_height_in_cbsy = (height + CBS_LUMA - 1) / CBS_LUMA;
>> +
>> +	return round_up(pic_width_in_cbsy * pic_height_in_cbsy, CBS_SIZE);
>> +}
>> +
>> +static inline size_t
>> +hantro_hevc_chroma_compressed_size(unsigned int width, unsigned int height)
>> +{
>> +	u32 pic_width_in_cbsc =
>> +		round_up((width + CBS_CHROMA_W - 1) / CBS_CHROMA_W, CBS_SIZE);
>> +	u32 pic_height_in_cbsc = (height / 2 + CBS_CHROMA_H - 1) / CBS_CHROMA_H;
>> +
>> +	return round_up(pic_width_in_cbsc * pic_height_in_cbsc, CBS_SIZE);
>> +}
>> +
>> +static inline size_t
>> +hantro_hevc_compressed_size(unsigned int width, unsigned int height)
>> +{
>> +	return hantro_hevc_luma_compressed_size(width, height) +
>> +	       hantro_hevc_chroma_compressed_size(width, height);
>> +}
>> +
>>   static inline unsigned short hantro_av1_num_sbs(unsigned short dimension)
>>   {
>>   	return DIV_ROUND_UP(dimension, 64);
>> @@ -525,6 +562,8 @@ hantro_av1_mv_size(unsigned int width, unsigned int height)
>>   
>>   size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx);
>>   size_t hantro_g2_motion_vectors_offset(struct hantro_ctx *ctx);
>> +size_t hantro_g2_luma_compress_offset(struct hantro_ctx *ctx);
>> +size_t hantro_g2_chroma_compress_offset(struct hantro_ctx *ctx);
>>   
>>   int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
>>   int rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx);
>> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
>> index 41e93176300b..232c93eea7ee 100644
>> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
>> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
>> @@ -213,9 +213,13 @@ static unsigned int hantro_postproc_buffer_size(struct hantro_ctx *ctx)
>>   	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME)
>>   		buf_size += hantro_vp9_mv_size(pix_mp.width,
>>   					       pix_mp.height);
>> -	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE)
>> +	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE) {
>>   		buf_size += hantro_hevc_mv_size(pix_mp.width,
>>   						pix_mp.height);
>> +		if (ctx->hevc_dec.use_compression)
>> +			buf_size += hantro_hevc_compressed_size(pix_mp.width,
>> +								pix_mp.height);
>> +	}
>>   	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_AV1_FRAME)
>>   		buf_size += hantro_av1_mv_size(pix_mp.width,
>>   					       pix_mp.height);
>

