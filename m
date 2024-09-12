Return-Path: <linux-media+bounces-18196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6760797690C
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 14:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7070282C60
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 12:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240ED1A3AA0;
	Thu, 12 Sep 2024 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fZaSnBl7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6961A38C1;
	Thu, 12 Sep 2024 12:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726143793; cv=none; b=t/83P32FIFbCn+yJQR+7EcTrMHPVL7yocW9A9FnOovudzf9OcDoHJk22cOM5CAcKkjdAsfkumXIzi2dxdXM/e+zQJTpEglszLKTzbSjFjL91f9pqdIy8SdtEHsK8hXTZvG19tLdCNDvhsrVE+tktE/96h433XvEpVmxFqf+GoLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726143793; c=relaxed/simple;
	bh=KG+zUz0hUF7CRByKiUI2Dj8yjs9oPaRciDf6IGtjWSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=crhsXbmK2vdfGeTrAT7/9ToQIxx4zApHq2WCp7fC7etfrqxe02IP/7bW9AGtm58gbUwCri37GiWbAKeKwQqmvrUeIqJC8Z/IcoCbrs5xYOTGWTmYAwfKOn513pUnRuNG4lRCu4DnOsZnEJaYZPMcpHFwhiCjWgCSNai0h7uqrwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fZaSnBl7; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C91FUm002705;
	Thu, 12 Sep 2024 14:22:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	SX+Z/DatuVOcDHpJ/jFHPxVB42dtQCJyNR16/NC58QE=; b=fZaSnBl74lzunzAF
	+jqIqbFcr5PAcucscpLRFjnGD1y9emHTGZR3q7udJamzqfI2FQEDrL/XcZARoNfs
	IiLG2s8bJq9+2JgiHxXdriQNH+vZ0yS3gGYaJSa5vsQCus4glL/vCfHOmw2KVFsm
	7LoK+ni7jJkZT0yQTpU7CChrGgkcVDBf1TO0//68UytbLCJNhsIZl/yAsDFMUDTe
	RCuvoV7ypfxNbIjLGofOQA2QN1VXEuI5oeLUK8UPA0KPN6OR1lcx3EMzNz10I6KQ
	qtIxmi9e+1Y5rvmlqYzTvNtWJwIVY8GV4y1JGFVSb9xKzbjeuVISHdty71gkCzBh
	/jlYew==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41h1sgkr1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 14:22:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5826A4008F;
	Thu, 12 Sep 2024 14:20:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F3DB2721DF;
	Thu, 12 Sep 2024 14:18:38 +0200 (CEST)
Received: from [10.48.86.208] (10.48.86.208) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Sep
 2024 14:18:37 +0200
Message-ID: <e3e4a4e6-d0ac-455e-9854-d93bdb13f272@foss.st.com>
Date: Thu, 12 Sep 2024 14:18:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: verisilicon: add WebP decoding support
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
        Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
 <20240911135011.161217-3-hugues.fruchet@foss.st.com>
 <1d02cbe2797053c69ba9d7adb9c666ca221407e0.camel@collabora.com>
 <01020191e2672cd9-0b3804cc-def2-4dfb-aa44-8eddbd5e99fb-000000@eu-west-1.amazonses.com>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <01020191e2672cd9-0b3804cc-def2-4dfb-aa44-8eddbd5e99fb-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Nicolas,

Thanks for reviewing.

GStreamer changes are provided through this merge request: 
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7505

Code:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/138ecfac54ce85b273a26ff6f0fefe3998f8d436?merge_request_iid=7505



On 9/11/24 20:44, Nicolas Dufresne wrote:
> Le mercredi 11 septembre 2024 à 13:58 -0400, Nicolas Dufresne a écrit :
>> Hi Hugues,
>>
>> Le mercredi 11 septembre 2024 à 15:50 +0200, Hugues Fruchet a écrit :
>>> Add WebP picture decoding support to VP8 stateless decoder.
>>
>> Unless when its obvious, the commit message should explain what is being
>> changed.
>>
>>>
>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
>>> ---
>>>   drivers/media/platform/verisilicon/hantro_g1_regs.h    | 1 +
>>>   drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c | 7 +++++++
>>>   2 files changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
>>> index c623b3b0be18..e7d4db788e57 100644
>>> --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
>>> +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
>>> @@ -232,6 +232,7 @@
>>>   #define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
>>>   #define G1_REG_ADDR_STR					0x030
>>>   #define G1_REG_ADDR_DST					0x034
>>> +#define G1_REG_ADDR_DST_CHROMA				0x038
>>>   #define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
>>>   #define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
>>>   #define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
>>> diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
>>> index 851eb67f19f5..c6a7584b716a 100644
>>> --- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
>>> +++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
>>> @@ -427,6 +427,11 @@ static void cfg_buffers(struct hantro_ctx *ctx,
>>>   
>>>   	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
>>>   	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
>>> +
>>> +	if (hdr->flags & V4L2_VP8_FRAME_FLAG_WEBP)
>>> +		vdpu_write_relaxed(vpu, dst_dma +
>>> +				   ctx->dst_fmt.height * ctx->dst_fmt.width,
>>
>> I'm not really not fan of that type of formula using padded width/height. Not
>> sure if its supported already, but if we have foreign buffers with a bigger
>> bytesperline, the IP may endup overwriting the luma. Please use the per-plane
>> bytesperline, we have v4l2-common to help with that when needed.
>>> +				   G1_REG_ADDR_DST_CHROMA);

OK, I'll check that.

>>
>> I have a strong impression this patch is incomplete (not generic enough). The
>> documentation I have indicates that the resolution range for WebP can be
>> different for different synthesis. See swreg54 (0xd8), if bit 19 is set, then it
>> can support 16K x 16K resolution. There is no other way around that then
>> signalling explicitly at the format level that this is webp, since otherwise you
>> can't know from userspace and can't enumerate the different resolution. I'm
>> curious what is the difference at bitstream level, would be nice to clarify too.

See below WebP image details.

> 
> I've also found that when the PP is used, you need to fill some extended
> dimension (SWREG92) with the missing bit of the width/height, as the dimension
> don't fit the usual register.
> 

Yes there are additional registers to set in postproc for large image > 
3472x4672 and image input bitstream larger than 16777215 bytes.
I have not tested such large images for now.
Additionally I don't have postproc support on STM32MP25.
Anyway I can guard for those limits in code...

> More notes, I noticed that WebP supports having a second frame for the alpha,
> similar to WebM Alpha, for that we expect 2 requests, so no issue on this front.
> WebP Loss-less is a completely different codec, and should have its own format.
> 
> I think overall, from my read of the spec, that its normal VP8, but the
> resolution will exceed the normal one. We also can't always enable WebP, since
> it will break references.
> 
> Nicolas
> 

As far as I have understood & tested, WebP is just an encapsulation of 
VP8 video chunk:
  * Webp image RIFF header
  *
  * 52 49 46 46 f6 00 00 00 57 45 42 50 56 50 38 20  RIFF....WEBPVP8
  * ea 00 00 00 90 09 00 9d 01 2a 30 00 30 00 3e 35  .........*0.0.>5
  *           | \______/ \______/
  *           |       |         \__VP8 startcode
  *           |        \__VP8 frame_tag
  *           |
  *            \__End of WebP RIFF header: 20 bytes, then VP8 chunk

At least for lossy WebP.

There are two others WebP formats which are loss-less WebP and animated 
WebP but untested on my side, I don't even know if those formats are 
supported by the hardware IP.

>>
>> On GStreamer side, the formats are entirely seperate, image/webp vs video/x-vp8
>> are the mime types. Seems a lot safe to keep these two as seperate formats. They
>> can certainly share the same stateless frame structure, with the additional flag
>> imho.
>>
>> Nicolas

Really very few changes needed on VP8 codebase to support WebP. On my 
opinion it doesn't need a fork of codec for that, hence just the minor 
addition of "WebP"  signaling on uAPI see GStreamer limited changes in 
VP8 codebase to support WebP:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/138ecfac54ce85b273a26ff6f0fefe3998f8d436?merge_request_iid=7505

>>
>>>   }
>>>   
>>>   int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>>> @@ -471,6 +476,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>>>   		reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
>>>   	if (hdr->lf.level == 0)
>>>   		reg |= G1_REG_DEC_CTRL0_FILTERING_DIS;
>>> +	if (hdr->flags & V4L2_VP8_FRAME_FLAG_WEBP)
>>> +		reg |= G1_REG_DEC_CTRL0_WEBP_E;
>>>   	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
>>>   
>>>   	/* Frame dimensions */
>>
> 

BR,
Hugues.

