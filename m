Return-Path: <linux-media+bounces-15613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F5E942781
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46F6EB2318C
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 07:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C081A7F7B;
	Wed, 31 Jul 2024 07:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QZshJLrw"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065D21A76D3;
	Wed, 31 Jul 2024 07:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722409561; cv=none; b=UUrUWd4QXHu/8eoL7ui8mR1A+6Zh/oTP+z6IRWhQFMK9AIVyv5FwPQu538D/4LJ4NzJtChbCmMOPl5eWM3fX2Reh4NjkridjHtC1VSOCq9oK+BDYKZvzlGnjxnmza+wLOsD5ExBxr4PezOwTvVwptcpnaNYJ8IH8ADXMX2OeKiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722409561; c=relaxed/simple;
	bh=GurD/Q0npPzHPTRJX8cDQoXtccXZwbnjZ9gjIPH/mms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYZga6SoyOFZxsfdD+kjAZU5jHGdRGgBSIdXWIQhREZOUY0AY8mvxauVHxNMgal4RvnP42F1lFiPrtq287JyU4gEPvFi80q6pgJ52XkevPQ7H/iZ+YZslbtZd31jx175fpp9+c50VqMujWOnY/Bl4gBoCzZRpTld/T/4YqcGp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QZshJLrw; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722409558;
	bh=GurD/Q0npPzHPTRJX8cDQoXtccXZwbnjZ9gjIPH/mms=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QZshJLrwme+plhI3Jf9Jyv6pV26GARlnGTptV1j+qt9dYm1/+bvLhpDuRZ2yydSwL
	 hFsAg3vtU8rk3G4q7CVapvn8i078PxWtmHpxHhaKKdJ0qDj6VC8EQRXs/XRfp2TIO+
	 D0bZwjfmBdtXJXhR6Zx0ghbkrriEcF1zZlb3mBuNBdiB+0PB6eye78YbUeIH86/UmY
	 powpJUWkoaXFV5yCZy56SckMQnerxRXlrqFoWzqIMMJsby6SN1Os0F056Ruiy8dlwz
	 auSSKHt6ijHz7Y6tx+gSRMO5LAhMi+105rg55y0AD9fnS1VBT6HXAczcwhhavq360+
	 fGZyqnqXhzynA==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DE8303780B79;
	Wed, 31 Jul 2024 07:05:57 +0000 (UTC)
Message-ID: <fb7f0071-503c-4f06-bae2-1c0e6d69a5e3@collabora.com>
Date: Wed, 31 Jul 2024 09:05:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: test-drivers: Use V4L2_FMT_FLAG_ENUM_ALL
 flag
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
 <20240722150523.149667-3-benjamin.gaignard@collabora.com>
 <92c88d0f-219e-43b4-9dce-5ae99585b767@xs4all.nl>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <92c88d0f-219e-43b4-9dce-5ae99585b767@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 30/07/2024 à 09:13, Hans Verkuil a écrit :
> On 22/07/2024 17:05, Benjamin Gaignard wrote:
>> Since V4L2_FMT_FLAG_ENUM_ALL flag mostly targeting stateless
>> decoder pixel formats enumeration, update vicodec visl test
>> drivers to use it.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/media/test-drivers/vicodec/vicodec-core.c |  7 ++++---
>>   drivers/media/test-drivers/visl/visl-video.c      | 11 +++++++----
>>   2 files changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
>> index 3e011fe62ae1..1b4cd8ddd7c2 100644
>> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
>> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
>> @@ -706,6 +706,7 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
>>   		    bool is_out)
>>   {
>>   	bool is_uncomp = (ctx->is_enc && is_out) || (!ctx->is_enc && !is_out);
>> +	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
> This is not what I am looking for: to properly test this in v4l2-compliance this
> flag actually has to make a difference in the result. I.e. you actually have to
> add some limitation. This might be easier to do in visl than vicodec. As long as
> at least one test-driver support this, then that's good enough for me.

Ok I will focus on visl and made it return another list of formats when the
flag is set.

Regards,
Benjamin

> Regards,
>
> 	Hans
>
>>   
>>   	if (V4L2_TYPE_IS_MULTIPLANAR(f->type) && !multiplanar)
>>   		return -EINVAL;
>> @@ -718,18 +719,18 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
>>   
>>   		if (ctx->is_enc ||
>>   		    !vb2_is_streaming(&ctx->fh.m2m_ctx->cap_q_ctx.q))
>> -			info = v4l2_fwht_get_pixfmt(f->index);
>> +			info = v4l2_fwht_get_pixfmt(index);
>>   		else
>>   			info = v4l2_fwht_find_nth_fmt(info->width_div,
>>   						     info->height_div,
>>   						     info->components_num,
>>   						     info->pixenc,
>> -						     f->index);
>> +						     index);
>>   		if (!info)
>>   			return -EINVAL;
>>   		f->pixelformat = info->id;
>>   	} else {
>> -		if (f->index)
>> +		if (index)
>>   			return -EINVAL;
>>   		f->pixelformat = ctx->is_stateless ?
>>   			V4L2_PIX_FMT_FWHT_STATELESS : V4L2_PIX_FMT_FWHT;
>> diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/media/test-drivers/visl/visl-video.c
>> index f8d970319764..c5f3e13b4198 100644
>> --- a/drivers/media/test-drivers/visl/visl-video.c
>> +++ b/drivers/media/test-drivers/visl/visl-video.c
>> @@ -341,21 +341,24 @@ static int visl_enum_fmt_vid_cap(struct file *file, void *priv,
>>   				 struct v4l2_fmtdesc *f)
>>   {
>>   	struct visl_ctx *ctx = visl_file_to_ctx(file);
>> +	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
>>   
>> -	if (f->index >= ctx->coded_format_desc->num_decoded_fmts)
>> +	if (index >= ctx->coded_format_desc->num_decoded_fmts)
>>   		return -EINVAL;
>>   
>> -	f->pixelformat = ctx->coded_format_desc->decoded_fmts[f->index];
>> +	f->pixelformat = ctx->coded_format_desc->decoded_fmts[index];
>>   	return 0;
>>   }
>>   
>>   static int visl_enum_fmt_vid_out(struct file *file, void *priv,
>>   				 struct v4l2_fmtdesc *f)
>>   {
>> -	if (f->index >= ARRAY_SIZE(visl_coded_fmts))
>> +	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
>> +
>> +	if (index >= ARRAY_SIZE(visl_coded_fmts))
>>   		return -EINVAL;
>>   
>> -	f->pixelformat = visl_coded_fmts[f->index].pixelformat;
>> +	f->pixelformat = visl_coded_fmts[index].pixelformat;
>>   	return 0;
>>   }
>>   
>

