Return-Path: <linux-media+bounces-24982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD164A16E4D
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 15:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9944F1886484
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012741E32BE;
	Mon, 20 Jan 2025 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="aRZmGCZp"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987641E104E;
	Mon, 20 Jan 2025 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737382766; cv=pass; b=YlKnk2+qX3+mShphYpL/bIhRBzwl7rVHZvE66Ak/BHKvrtVn81+xth7Ygl5Tm81NGHfF4EGAx3OcR8ErMCoxVTdDfacX0pg3GPagUe7nZMWIszvrxN44Rh64qW/wDa62PldoPQ9mC1heGvtItE3gvfuE8w88lgcY48828ACn6nU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737382766; c=relaxed/simple;
	bh=RMX7E9RKwb0GAKi3y40PC+BLTTqhudHuiirq1bbaDg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JtBCulzkbZTeqy+NAhrOjf2i9ttuqN5rQx+Xke5dolDqDCaHA+rKOFZfjsE99TPbDHi+zRZ6HtFiymZ/ufKs11MSzy4Pdn1D+OL7CaxFS2uKfnuqDympaDeUE2eyZNCCVi2RDg2+HBG+cE65j0yA+xqukmZcw7Nvb7C+6IfuYmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=aRZmGCZp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1737382751; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PFdLP00+DfJy0CN1yx7nB319WnSSTzDMciqTmrywMgytoJ9dqSqiBt7QUvoD3/ZXGmHGdJJaMpcpv7Teyc222bENmdTJjxeoHNdvb3wa7v3tTQHlDRmKHc3yp3BQssg8Gh7RlDJq1IxE31ETKmiR2qA3bdo+xaneTK7aSBVcPnw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737382751; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j+E1q7ijcKFXJxDwrg5aw4UobRbm2qLeSggSBlQ9bug=; 
	b=PdX0dsOlvTRhuhW+MqbKhEMppSGtKgJtdLHhJ5OW0ltSMMvqwwMufyDf2HvH6iz6KHvT4+QCxxun8F7acBaLn7F1ljMlbW++kQNSt99vOoGAlqqWr0TV8h99ZSQYMSRumafgWgKwubA+VJ8q2LorxxarOO8IKgxaQYGWjcukco8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737382751;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=j+E1q7ijcKFXJxDwrg5aw4UobRbm2qLeSggSBlQ9bug=;
	b=aRZmGCZpaeiEer1N8oAnlga/awVEWYYpVKmJGW6AXALo/XKUtP3YAaZrCJV+jMLi
	cginWQPPuzTd3GU+zkcrx4YFAjDX557ygUOC2/t5grQRerllHTfvY25fOyPXwCni5qx
	C1SI7u2RnUl3CqoMZ7t+mCyh/L1fylTaJvpnZQSY=
Received: by mx.zohomail.com with SMTPS id 1737382746840120.86569708376226;
	Mon, 20 Jan 2025 06:19:06 -0800 (PST)
Message-ID: <0a1b29c5-11f7-4836-b41e-99be75afdfd8@collabora.com>
Date: Mon, 20 Jan 2025 15:19:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicon: HEVC: Initialize start_bit field
To: Adam Ford <aford173@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250120081052.63224-1-benjamin.gaignard@collabora.com>
 <cc3b22c9-ff98-4328-9e70-4d22c29a6b0d@collabora.com>
 <95a8e3c6d28444750bd312ff61a3f6b0daea177a.camel@collabora.com>
 <CAHCN7xKySGN6wnE2FmpuLms-DyThBvx9w6vdKqJvsaWpgW6FOQ@mail.gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <CAHCN7xKySGN6wnE2FmpuLms-DyThBvx9w6vdKqJvsaWpgW6FOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 20/01/2025 à 15:15, Adam Ford a écrit :
> On Mon, Jan 20, 2025 at 8:10 AM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
>> Le lundi 20 janvier 2025 à 11:00 +0100, Benjamin Gaignard a écrit :
>>> Le 20/01/2025 à 09:10, Benjamin Gaignard a écrit :
>>>> Always set start_bit field to 0, if not it could lead to corrupted frames
>>>> specially when decoding VP9 bitstreams at the same time since VP9 driver
>>>> set it for it own purpose.
>>                 its
>>
> Does this impact the Fluster score?

No because that happens only when decoding VP9 and HEVC bitstreams at the same time.

>
>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> I could add this tag:
>>>
>>> Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
>> I have tested this on IMX8MQ board using the following GStreamer pipeline.
>> Before the change, the HEVC window was entirely corrupted. The streams don't
>> matter as long as they use both HEVC and VP9 codec.
>>
>> gst-launch-1.0 \
>>    filesrc location=hevc.mp4 ! parsebin ! v4l2slh265dec ! fakevideosink \
>>    filesrc location=vp9.mkv ! parsebin ! v4l2slvp9dec ! fakevideosink
>>
>> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>
>>
>>>> ---
>>>>    drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
>>>> index 85a44143b378..0e212198dd65 100644
>>>> --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
>>>> +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
>>>> @@ -518,6 +518,7 @@ static void set_buffers(struct hantro_ctx *ctx)
>>>>      hantro_reg_write(vpu, &g2_stream_len, src_len);
>>>>      hantro_reg_write(vpu, &g2_strm_buffer_len, src_buf_len);
>>>>      hantro_reg_write(vpu, &g2_strm_start_offset, 0);
>>>> +   hantro_reg_write(vpu, &g2_start_bit, 0);
>>>>      hantro_reg_write(vpu, &g2_write_mvs_e, 1);
>> I've also crossed against "decoder_swreg_map_g2.xlsx" documentation, if you are
>> lucky to have access to that, and within swreg5 there is only g2_tempor_mvp_e
>> that is also shared, and its already being set in both drivers.
>>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>
>>
>>>>      hantro_write_addr(vpu, G2_TILE_SIZES_ADDR, ctx->hevc_dec.tile_sizes.dma);
>>

