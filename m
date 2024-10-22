Return-Path: <linux-media+bounces-20043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 851739AA27D
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 14:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBCBFB22F37
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 12:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7043419D8AC;
	Tue, 22 Oct 2024 12:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="FKK0k5s4"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5A419D880;
	Tue, 22 Oct 2024 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729601465; cv=pass; b=oihGTlFaz9MvjQqkpmFDxSoGIMgYX318SSmrpIx4T+gRYOpdA146eRCKowoGNGeFMt8fLvzKWJid7Yf/WxmZG4roscTeCJumJXdTvajlNivj/usrijgmdx8cfaHNaOWdjPULWRbXoB1og9hkDd8uHstaB5ASiHog2hMsJDSAJtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729601465; c=relaxed/simple;
	bh=tzJTLYtKX8HN+CBku2prcqC2R69HWwBCVxVuSpRmujI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUf/T/s8BijJbipztxMClRSAvw/X+KoJYyORl0xrqulHylzra9VkyOvgh3wDJsH5Vn0NFZiqpCtVx5P63wKc6FQTgoIaXMYljVkwlMd8eEjw5fmTSkTxzPWQvYHi+GApv3khLOF9jNsptRo3GzfWby7vMBO1D+V7sdd7q8hxn7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=FKK0k5s4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1729601440; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LtnsdME6hfcDtgoX/lLs7ii2FcMF03EVMxGBYb634KrXGMaZ6iHFYWqlPaHFWPMJpbD9J9CPGW1mvh+XhwuspTNQmGpGDSG9k1X/E14knPmOE6rGDp74g+f617tGyN98e+eAc5+VJW9got8mBzk4JqkxdAC5rIcTF1Mjq8oGcWA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729601440; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EY2bEWQLnfSWP5vcB4FJYNm/3VT2vI8eDwK6W9Y/wJg=; 
	b=QLHkX8lB4II08YLdRlw3SAdTN5yKR0DAj+yHAoVv2Bqq1I/FEGwh5jw8Ft12RNSC6SVF2ddVBN0X3wkTBa7QYdqtP9CWPTjNj3FnYtnnlZqKZAI356CFimVaCtSKA0jAYCDtJjNCnm+FTXjGqduLMqdmf/kNmXvCeSUXRyB4W+g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729601440;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EY2bEWQLnfSWP5vcB4FJYNm/3VT2vI8eDwK6W9Y/wJg=;
	b=FKK0k5s47WJxXetdOdcxoGg/DEnqX7ORXHrtmR29XVZVFmAftRM+5bsLTWEgENQR
	PYE/HjG4SiIeHylJTaIf8v7DHTripbJ1ulCzs+iric2fCiLg2ltK038jJi3lpW5ltQK
	zkSv15E/cEYwu+q+0ACOE8gDEIFnzYwAbJhMs1e0=
Received: by mx.zohomail.com with SMTPS id 1729601437154315.6561653307675;
	Tue, 22 Oct 2024 05:50:37 -0700 (PDT)
Message-ID: <cb8f8576-34a2-4db0-b063-8d7a1a0b114b@collabora.com>
Date: Tue, 22 Oct 2024 14:50:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicon: av1: Store chroma and mv offsets
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, mchehab@kernel.org,
 heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <01020192afc4f87b-fd9b4515-9e30-41e7-8cf9-029cf5c0c7b6-000000@eu-west-1.amazonses.com>
 <26e78427fdd3699e237a20d803c02202c868c2ff.camel@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <26e78427fdd3699e237a20d803c02202c868c2ff.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 22/10/2024 à 14:46, Nicolas Dufresne a écrit :
> Hi,
>
> Le lundi 21 octobre 2024 à 15:49 +0000, Benjamin Gaignard a écrit :
>> Store chroma and motion vectors offsets for each frame so
>> they can be used later when resolution change.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> This is nicer then recalculating it from width/height of the ref frame like we
> do in RK VP9 driver. I think this patch could have a Fixes tag. As we discuss, I
> believe AOM test suite does not cover this case ? and thus the fluster score is
> unchanged ?

This case isn't covered by Fluster test suites so the score is still the same.
At least I haven't introduce regressions ;-)

Benjamin

>
> I still think this patch is correct, so:
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
>> ---
>>   drivers/media/platform/verisilicon/hantro.h              | 7 +++++++
>>   .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c    | 9 +++++----
>>   2 files changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
>> index 811260dc3c77..6d36371c1d13 100644
>> --- a/drivers/media/platform/verisilicon/hantro.h
>> +++ b/drivers/media/platform/verisilicon/hantro.h
>> @@ -332,12 +332,19 @@ struct hantro_vp9_decoded_buffer_info {
>>   	u32 bit_depth : 4;
>>   };
>>   
>> +struct hantro_av1_decoded_buffer_info {
>> +	/* Info needed when the decoded frame serves as a reference frame. */
>> +	size_t chroma_offset;
>> +	size_t mv_offset;
>> +};
>> +
>>   struct hantro_decoded_buffer {
>>   	/* Must be the first field in this struct. */
>>   	struct v4l2_m2m_buffer base;
>>   
>>   	union {
>>   		struct hantro_vp9_decoded_buffer_info vp9;
>> +		struct hantro_av1_decoded_buffer_info av1;
>>   	};
>>   };
>>   
>> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>> index e54f5fac325b..69b5d9e12926 100644
>> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>> @@ -686,8 +686,6 @@ rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
>>   	struct hantro_dev *vpu = ctx->dev;
>>   	struct hantro_decoded_buffer *dst;
>>   	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
>> -	size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
>> -	size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
>>   	int cur_width = frame->frame_width_minus_1 + 1;
>>   	int cur_height = frame->frame_height_minus_1 + 1;
>>   	int scale_width =
>> @@ -744,8 +742,8 @@ rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
>>   
>>   	dst = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
>>   	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
>> -	chroma_addr = luma_addr + cr_offset;
>> -	mv_addr = luma_addr + mv_offset;
>> +	chroma_addr = luma_addr + dst->av1.chroma_offset;
>> +	mv_addr = luma_addr + dst->av1.mv_offset;
>>   
>>   	hantro_write_addr(vpu, AV1_REFERENCE_Y(ref), luma_addr);
>>   	hantro_write_addr(vpu, AV1_REFERENCE_CB(ref), chroma_addr);
>> @@ -2089,6 +2087,9 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
>>   	chroma_addr = luma_addr + cr_offset;
>>   	mv_addr = luma_addr + mv_offset;
>>   
>> +	dst->av1.chroma_offset = cr_offset;
>> +	dst->av1.mv_offset = mv_offset;
>> +
>>   	hantro_write_addr(vpu, AV1_TILE_OUT_LU, luma_addr);
>>   	hantro_write_addr(vpu, AV1_TILE_OUT_CH, chroma_addr);
>>   	hantro_write_addr(vpu, AV1_TILE_OUT_MV, mv_addr);
>

