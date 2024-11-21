Return-Path: <linux-media+bounces-21769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBAA9D4EB1
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 15:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87A231F213E6
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 14:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7CD1D934B;
	Thu, 21 Nov 2024 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="RhiYRIJL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C8F20330;
	Thu, 21 Nov 2024 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732199501; cv=none; b=tCaCOVmLvtwWXQ5ZwN4br8JmzFrOZ2CXLtGH+7EcxWqKpqTBgJ9K+RZjHnR0lEJheX2rXfQJD7r0q6di0d4wSU8ioS4GdYH11AfmDDZoGAgWMV8UwCszEg0ZFJh530tfHI11t3fHQ4G2RhQZWpYesdibl9bo9islXRZOVBSECKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732199501; c=relaxed/simple;
	bh=ipNLKjp0DQNKz1zI+FH+WIIfigEZEG8IJVFlaeB1HQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TBU7/YSib30W7JNYSnZiVqIB9Zlk3+fdNYf7NNIwC7FROtuPpABNzMTBXf2gaaOKkNx9JZETefSoqLnpxYj9bQTMpJO6YWub9GCgDc+XxlYZz0czRW3yY6NfJdEp45TC7kw3aFiQ8zmIge0boAIwDgbI5/T1uzMSrr9PEkvnWsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RhiYRIJL; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALE4fYk031954;
	Thu, 21 Nov 2024 15:31:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	L4AhvO+uIes1NeK6LJvz0UDQof4cSrasjC8QG7eav24=; b=RhiYRIJLqI/rs9dj
	4pQFFoDcYma+OlI8+OX3qgew523W1gwyHsWc4yWMeTEicu2yiX7QK7DQNFsBg6To
	T4IXByDciwGzLr+sn51vOR1hrX5eIgeoTQJXlXoVEk+m0z/hS4P1oMJuWXkoXZV8
	Zk6LKksoPXv5JvT1U5E/meGxIUZzhkcdNttTCzozz7V/+cP2k6MH5EuApueo9C5e
	SeUN4jgBt/DJ9/mEgy5TH1TxZX/gp2vXljt+2K2NTpkAj/b466vFGw025IJkEATF
	Wf76BYXyMB1DSBwSaBl5hBZ9xexuGAas2L98U/BbtjGtnCe6HDKv+nrY8a5yKqtT
	Xi/tPA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkq67g2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 15:31:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2F4264002D;
	Thu, 21 Nov 2024 15:29:55 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 773652786E2;
	Thu, 21 Nov 2024 15:28:57 +0100 (CET)
Received: from [10.48.86.208] (10.48.86.208) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 15:28:56 +0100
Message-ID: <41f0b8e4-d6aa-4a42-8633-9ea77873d275@foss.st.com>
Date: Thu, 21 Nov 2024 15:28:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: verisilicon: add WebP decoding support
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Fritz Koenig <frkoenig@chromium.org>,
        Sebastian
 Fricke <sebastian.fricke@collabora.com>,
        Daniel Almeida
	<daniel.almeida@collabora.com>,
        Andrzej Pietrasiewicz
	<andrzej.p@collabora.com>,
        Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
 <20241120110105.244413-3-hugues.fruchet@foss.st.com>
 <c9f19faacccd47b8a72fc4a29a0f75b30bce1aa1.camel@collabora.com>
 <cf81e5f2-45a4-4c82-890c-c8a4d17b22df@foss.st.com>
 <41310959a7b40f8e28fb324e00c4a51966bec803.camel@collabora.com>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <41310959a7b40f8e28fb324e00c4a51966bec803.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Nicolas,

On 11/21/24 15:20, Nicolas Dufresne wrote:
> Hi Hugues,
> 
> Le jeudi 21 novembre 2024 à 11:07 +0100, Hugues FRUCHET a écrit :
>> Hi Nicolas,
>>
>> On 11/20/24 15:25, Nicolas Dufresne wrote:
>>> Le mercredi 20 novembre 2024 à 12:01 +0100, Hugues Fruchet a écrit :
>>>> Add WebP picture decoding support to VP8 stateless decoder.
>>>>
>>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
>>>> ---
>>>>    .../media/platform/verisilicon/hantro_g1_regs.h |  1 +
>>>>    .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
>>>>    .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
>>>>    .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
>>>>    4 files changed, 32 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
>>>> index c623b3b0be18..e7d4db788e57 100644
>>>> --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
>>>> +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
>>>> @@ -232,6 +232,7 @@
>>>>    #define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
>>>>    #define G1_REG_ADDR_STR					0x030
>>>>    #define G1_REG_ADDR_DST					0x034
>>>> +#define G1_REG_ADDR_DST_CHROMA				0x038
>>>>    #define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
>>>>    #define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
>>>>    #define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
>>>> diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
>>>> index 851eb67f19f5..c83ee6f5edc8 100644
>>>> --- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
>>>> +++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
>>>> @@ -307,6 +307,12 @@ static void cfg_parts(struct hantro_ctx *ctx,
>>>>    			   G1_REG_DEC_CTRL3_STREAM_LEN(dct_part_total_len),
>>>>    			   G1_REG_DEC_CTRL3);
>>>>    
>>>> +	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
>>>> +		vdpu_write_relaxed(vpu,
>>>> +				   G1_REG_DEC_CTRL3_STREAM_LEN_EXT
>>>> +					(dct_part_total_len >> 24),
>>>> +				   G1_REG_DEC_CTRL3);
>>>> +
>>>>    	/* DCT partitions base address */
>>>>    	for (i = 0; i < hdr->num_dct_parts; i++) {
>>>>    		u32 byte_offset = dct_part_offset + dct_size_part_size + count;
>>>> @@ -427,6 +433,12 @@ static void cfg_buffers(struct hantro_ctx *ctx,
>>>>    
>>>>    	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
>>>>    	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
>>>> +
>>>> +	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
>>>> +		vdpu_write_relaxed(vpu, dst_dma +
>>>> +				   ctx->dst_fmt.plane_fmt[0].bytesperline *
>>>> +				   ctx->dst_fmt.height,
>>>> +				   G1_REG_ADDR_DST_CHROMA);
>>>>    }
>>>>    
>>>>    int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>>>> @@ -471,6 +483,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>>>>    		reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
>>>>    	if (hdr->lf.level == 0)
>>>>    		reg |= G1_REG_DEC_CTRL0_FILTERING_DIS;
>>>> +	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
>>>> +		reg |= G1_REG_DEC_CTRL0_WEBP_E;
>>>>    	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
>>>>    
>>>>    	/* Frame dimensions */
>>>> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
>>>> index 2513adfbd825..7075b2ba1ec2 100644
>>>> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
>>>> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
>>>> @@ -470,6 +470,7 @@ hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
>>>>    		break;
>>>>    	case V4L2_PIX_FMT_MPEG2_SLICE:
>>>>    	case V4L2_PIX_FMT_VP8_FRAME:
>>>> +	case V4L2_PIX_FMT_WEBP_FRAME:
>>>>    	case V4L2_PIX_FMT_H264_SLICE:
>>>>    	case V4L2_PIX_FMT_HEVC_SLICE:
>>>>    	case V4L2_PIX_FMT_VP9_FRAME:
>>>> @@ -492,6 +493,7 @@ hantro_update_requires_hold_capture_buf(struct hantro_ctx *ctx, u32 fourcc)
>>>>    	case V4L2_PIX_FMT_JPEG:
>>>>    	case V4L2_PIX_FMT_MPEG2_SLICE:
>>>>    	case V4L2_PIX_FMT_VP8_FRAME:
>>>> +	case V4L2_PIX_FMT_WEBP_FRAME:
>>>>    	case V4L2_PIX_FMT_HEVC_SLICE:
>>>>    	case V4L2_PIX_FMT_VP9_FRAME:
>>>>    		vq->subsystem_flags &= ~(VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
>>>> diff --git a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
>>>> index 833821120b20..48d6912c3bab 100644
>>>> --- a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
>>>> +++ b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
>>>> @@ -22,10 +22,10 @@ static const struct hantro_fmt stm32mp25_vdec_fmts[] = {
>>>>    		.codec_mode = HANTRO_MODE_NONE,
>>>>    		.frmsize = {
>>>>    			.min_width = FMT_MIN_WIDTH,
>>>> -			.max_width = FMT_FHD_WIDTH,
>>>> +			.max_width = FMT_4K_WIDTH,
>>>>    			.step_width = MB_DIM,
>>>>    			.min_height = FMT_MIN_HEIGHT,
>>>> -			.max_height = FMT_FHD_HEIGHT,
>>>> +			.max_height = FMT_4K_HEIGHT,
>>>
>>> I'm a little surprised of this change, since this is modifying VP8_FRAME, while
>>> we should instead introduce WEBP_FRAME.
>>
>> This is the resolution of the YUV output of decoder, not the WebP input,
>> and because of lack of post-processor, the output is not scaled, so can
>> go up to 4K with WebP.
>> Before WebP introduction, the maximum output resolution was FHD for all
>> codecs. Now WebP allows up to 4K but FHD constraint remains for
>> H264/VP8. I don't see real problems because VP8/H264 compressed inputs
>> are well limited to FHD and only WebP allows 4K...
> 
> Good point. Would you mind adding a justification for this change within the
> commit message in v3 ?

v3 already sent but I'll note that for the future v4.
Could you test & ack the 4K support on your platform having 
post-processor support ?

> 
>>
>>>
>>>>    			.step_height = MB_DIM,
>>>>    		},
>>>>    	},
>>>> @@ -68,6 +68,19 @@ static const struct hantro_fmt stm32mp25_venc_fmts[] = {
>>>>    		.codec_mode = HANTRO_MODE_NONE,
>>>>    		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
>>>>    	},
>>>> +	{
>>>> +		.fourcc = V4L2_PIX_FMT_WEBP_FRAME,
>>>> +		.codec_mode = HANTRO_MODE_VP8_DEC,
>>>> +		.max_depth = 2,
>>>> +		.frmsize = {
>>>> +			.min_width = FMT_MIN_WIDTH,
>>>> +			.max_width = FMT_4K_WIDTH,
>>>> +			.step_width = MB_DIM,
>>>> +			.min_height = FMT_MIN_HEIGHT,
>>>> +			.max_height = FMT_4K_HEIGHT,
>>>> +			.step_height = MB_DIM,
>>>> +		},
>>>> +	},
>>>
>>> This is venc_fmt (encoder), this shouldn't be there.
>>
>> All apologizes for this rebase issue, it is of course part of
>> stm32mp25_vdec_fmts.
> 
> Ack, let's get this right in v3 :-D
> 
>>
>>>
>>>>    	{
>>>>    		.fourcc = V4L2_PIX_FMT_YUYV,
>>>>    		.codec_mode = HANTRO_MODE_NONE,
>>>
>>
>> BR,
>> Hugues.
>

