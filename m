Return-Path: <linux-media+bounces-21732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EE39D4A7F
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 11:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87B50282DA1
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 10:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF101CCEF7;
	Thu, 21 Nov 2024 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="mrpi+rv2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812045FEED;
	Thu, 21 Nov 2024 10:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732183782; cv=none; b=AHHuvWNjcs2NeiFi5tZncXmLeyqSe20IKXEulXY+GmBSyUPZ9adkTXcC3n6XuZ0Yi9IVKQwY6PN1ms1NmVA3rgT+6XElUF3qYM223qXUq2Z1Vtbjhnzu8E1M0D6bN7HyBrDbJ/yF0wLmUQDd72fRR2SpS2It597H8K6zOn4iLWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732183782; c=relaxed/simple;
	bh=MJIsYwn9fBnud/3ZjeEPlG8yd/6NpkpIEJq2NtZeBf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TXf23KcIqBfPVFti8csHMJbbWfg7gjKh735Nzwt514VfTTjTO58LVnx/y/UULQQffUGg7NVYJgOWA4twcbNY+c53hTS3gcKIIRnLjTAiYF6lAkG/7mgEp8Sp/Bo0/SqU4gxEUKXoRfCcknPUe0zIyXuyMnBNEr6mLz59B5lTz2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=mrpi+rv2; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL9h4Df009852;
	Thu, 21 Nov 2024 11:09:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zWo2sYecNUbBd7STZ2QGAq2bQhy0GDw9Ky+/P/IZiUQ=; b=mrpi+rv29qlzNMzM
	PiR7kol/k4u+sV8vsdWDrBHrSZCYi19Mq7pCK1kDRxqXDrwQCTJGuNwz+zdvfPwl
	g6K55jaKrfOneUgP7tXHHTvgs7ourgqE6GJmMtB8eWOK/89DiomtmPV6o8wFBgHc
	AUSYy5SRaHgzZcaMUzU5AvJp4a/6b05R0ug5fPEEQ4iE+RosvG8Kau16A/KBa44+
	K6FXCJUx4+YQYcNHbn1l4CRihklivRKT7Old+fE8tA8pkoaG6v0H8KTc8nkl0ufK
	UwCEqEpRlqpvUDpw4aROFBWUn4F7xTBGPIXCaqtFBcVRXQp4T1gM6NxPwZu1Kua9
	9VKShA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 431bqxp0u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 11:09:17 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C41A040044;
	Thu, 21 Nov 2024 11:08:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 877A2266425;
	Thu, 21 Nov 2024 11:07:07 +0100 (CET)
Received: from [10.48.86.208] (10.48.86.208) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 11:07:06 +0100
Message-ID: <cf81e5f2-45a4-4c82-890c-c8a4d17b22df@foss.st.com>
Date: Thu, 21 Nov 2024 11:07:06 +0100
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
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <c9f19faacccd47b8a72fc4a29a0f75b30bce1aa1.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Nicolas,

On 11/20/24 15:25, Nicolas Dufresne wrote:
> Le mercredi 20 novembre 2024 à 12:01 +0100, Hugues Fruchet a écrit :
>> Add WebP picture decoding support to VP8 stateless decoder.
>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
>> ---
>>   .../media/platform/verisilicon/hantro_g1_regs.h |  1 +
>>   .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
>>   .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
>>   .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
>>   4 files changed, 32 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
>> index c623b3b0be18..e7d4db788e57 100644
>> --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
>> +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
>> @@ -232,6 +232,7 @@
>>   #define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
>>   #define G1_REG_ADDR_STR					0x030
>>   #define G1_REG_ADDR_DST					0x034
>> +#define G1_REG_ADDR_DST_CHROMA				0x038
>>   #define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
>>   #define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
>>   #define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
>> diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
>> index 851eb67f19f5..c83ee6f5edc8 100644
>> --- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
>> +++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
>> @@ -307,6 +307,12 @@ static void cfg_parts(struct hantro_ctx *ctx,
>>   			   G1_REG_DEC_CTRL3_STREAM_LEN(dct_part_total_len),
>>   			   G1_REG_DEC_CTRL3);
>>   
>> +	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
>> +		vdpu_write_relaxed(vpu,
>> +				   G1_REG_DEC_CTRL3_STREAM_LEN_EXT
>> +					(dct_part_total_len >> 24),
>> +				   G1_REG_DEC_CTRL3);
>> +
>>   	/* DCT partitions base address */
>>   	for (i = 0; i < hdr->num_dct_parts; i++) {
>>   		u32 byte_offset = dct_part_offset + dct_size_part_size + count;
>> @@ -427,6 +433,12 @@ static void cfg_buffers(struct hantro_ctx *ctx,
>>   
>>   	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
>>   	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
>> +
>> +	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
>> +		vdpu_write_relaxed(vpu, dst_dma +
>> +				   ctx->dst_fmt.plane_fmt[0].bytesperline *
>> +				   ctx->dst_fmt.height,
>> +				   G1_REG_ADDR_DST_CHROMA);
>>   }
>>   
>>   int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>> @@ -471,6 +483,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>>   		reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
>>   	if (hdr->lf.level == 0)
>>   		reg |= G1_REG_DEC_CTRL0_FILTERING_DIS;
>> +	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
>> +		reg |= G1_REG_DEC_CTRL0_WEBP_E;
>>   	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
>>   
>>   	/* Frame dimensions */
>> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
>> index 2513adfbd825..7075b2ba1ec2 100644
>> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
>> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
>> @@ -470,6 +470,7 @@ hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
>>   		break;
>>   	case V4L2_PIX_FMT_MPEG2_SLICE:
>>   	case V4L2_PIX_FMT_VP8_FRAME:
>> +	case V4L2_PIX_FMT_WEBP_FRAME:
>>   	case V4L2_PIX_FMT_H264_SLICE:
>>   	case V4L2_PIX_FMT_HEVC_SLICE:
>>   	case V4L2_PIX_FMT_VP9_FRAME:
>> @@ -492,6 +493,7 @@ hantro_update_requires_hold_capture_buf(struct hantro_ctx *ctx, u32 fourcc)
>>   	case V4L2_PIX_FMT_JPEG:
>>   	case V4L2_PIX_FMT_MPEG2_SLICE:
>>   	case V4L2_PIX_FMT_VP8_FRAME:
>> +	case V4L2_PIX_FMT_WEBP_FRAME:
>>   	case V4L2_PIX_FMT_HEVC_SLICE:
>>   	case V4L2_PIX_FMT_VP9_FRAME:
>>   		vq->subsystem_flags &= ~(VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
>> diff --git a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
>> index 833821120b20..48d6912c3bab 100644
>> --- a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
>> +++ b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
>> @@ -22,10 +22,10 @@ static const struct hantro_fmt stm32mp25_vdec_fmts[] = {
>>   		.codec_mode = HANTRO_MODE_NONE,
>>   		.frmsize = {
>>   			.min_width = FMT_MIN_WIDTH,
>> -			.max_width = FMT_FHD_WIDTH,
>> +			.max_width = FMT_4K_WIDTH,
>>   			.step_width = MB_DIM,
>>   			.min_height = FMT_MIN_HEIGHT,
>> -			.max_height = FMT_FHD_HEIGHT,
>> +			.max_height = FMT_4K_HEIGHT,
> 
> I'm a little surprised of this change, since this is modifying VP8_FRAME, while
> we should instead introduce WEBP_FRAME.

This is the resolution of the YUV output of decoder, not the WebP input, 
and because of lack of post-processor, the output is not scaled, so can 
go up to 4K with WebP.
Before WebP introduction, the maximum output resolution was FHD for all 
codecs. Now WebP allows up to 4K but FHD constraint remains for 
H264/VP8. I don't see real problems because VP8/H264 compressed inputs 
are well limited to FHD and only WebP allows 4K...

> 
>>   			.step_height = MB_DIM,
>>   		},
>>   	},
>> @@ -68,6 +68,19 @@ static const struct hantro_fmt stm32mp25_venc_fmts[] = {
>>   		.codec_mode = HANTRO_MODE_NONE,
>>   		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
>>   	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_WEBP_FRAME,
>> +		.codec_mode = HANTRO_MODE_VP8_DEC,
>> +		.max_depth = 2,
>> +		.frmsize = {
>> +			.min_width = FMT_MIN_WIDTH,
>> +			.max_width = FMT_4K_WIDTH,
>> +			.step_width = MB_DIM,
>> +			.min_height = FMT_MIN_HEIGHT,
>> +			.max_height = FMT_4K_HEIGHT,
>> +			.step_height = MB_DIM,
>> +		},
>> +	},
> 
> This is venc_fmt (encoder), this shouldn't be there.

All apologizes for this rebase issue, it is of course part of 
stm32mp25_vdec_fmts.

> 
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_YUYV,
>>   		.codec_mode = HANTRO_MODE_NONE,
> 

BR,
Hugues.

