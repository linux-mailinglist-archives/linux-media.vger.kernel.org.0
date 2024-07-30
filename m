Return-Path: <linux-media+bounces-15520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DD394094A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 09:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 141D61C20850
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 07:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E2918FDA6;
	Tue, 30 Jul 2024 07:15:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACA6150981;
	Tue, 30 Jul 2024 07:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323726; cv=none; b=F/jGVGwuN20/4JSoGRfVPbQf6Mizoo0KySMSxRA48Umb1Hu/atI4d5H5QrYikBTqen7r8pcNz9tvhsqxjXJOl2sFxFaN2IIOd/Kh3pV33W61bSGd5eDv6gOV78SEHONTSC8uYu3bLk8JAl6C3dl50A66R/aNXbN0Ytb3uT9wP2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323726; c=relaxed/simple;
	bh=HrSVNUHI9I60c8rU6phSmrY+tfaYXF76LWq6R2eqVyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pI6QzCVIp8AXKLSXUbtnlh+O+C97kjpC5SoZHxSOTSsPc69z/4d0EmTw/xLjZakXlSFDcRDjiQadXpXaTlfwrDSQrcktfZsHNTr0J4I407jLr9m1IdsMS6Reb+vSELtZ9IOswSxKPP5kjtZWg2sdwyspBh0dBXwT56p2WxcVilc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E32DC32782;
	Tue, 30 Jul 2024 07:15:24 +0000 (UTC)
Message-ID: <590e52a2-d7ea-4b86-b1f2-a6875118653c@xs4all.nl>
Date: Tue, 30 Jul 2024 09:15:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: test-drivers: Use V4L2_FMT_FLAG_ENUM_ALL
 flag
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
 <20240722150523.149667-3-benjamin.gaignard@collabora.com>
 <20240723094913.4zuywzqsthvkowlv@basti-XPS-13-9310>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240723094913.4zuywzqsthvkowlv@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/07/2024 11:49, Sebastian Fricke wrote:
> Hey Benjamin,
> 
> On 22.07.2024 17:05, Benjamin Gaignard wrote:
>> Since V4L2_FMT_FLAG_ENUM_ALL flag mostly targeting stateless
> 
> s/Since/Since the/
> s/targeting/targets/
> 
>> decoder pixel formats enumeration, update vicodec visl test
> 
> s/pixel formats/pixel-format/
> 
>> drivers to use it.
> 
> s/drivers/driver/
> 
> The rest below basically just strips the flag from every use-case of the
> index, before using it.
> 
> I wonder couldn't we implement a macro for this, as I believe this will
> have to be done in a lot of places, something like:
> 
> /*
>  * Drivers can support an enumeration of all formats, by ORing the
>  * V4L2_FMT_FLAG_ENUM_ALL flag into the index field.
>  * In order to use the index field, strip the flag first.
>  *
>  * See vidioc-enum-fmt.rst documentation for more details.
>  */
> #define STRIP_ENUM_ALL_FLAG(index) \
>   index & ~V4L2_FMT_FLAG_ENUM_ALL
> 
> And then use it like this:
> 
> u32 index = STRIP_ENUM_ALL_FLAG(f->index);

There is really no advantage to that. It is much better to be explicit
about it rather than hiding it in a define.

Regards,

	Hans

> 
> If we define this in a common header, then every driver can easily
> utilize it and you have built-in documentation.
> 
> What do you think?
> 
> Regards,
> Sebastian
> 
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> drivers/media/test-drivers/vicodec/vicodec-core.c |  7 ++++---
>> drivers/media/test-drivers/visl/visl-video.c      | 11 +++++++----
>> 2 files changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
>> index 3e011fe62ae1..1b4cd8ddd7c2 100644
>> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
>> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
>> @@ -706,6 +706,7 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
>>             bool is_out)
>> {
>>     bool is_uncomp = (ctx->is_enc && is_out) || (!ctx->is_enc && !is_out);
>> +    u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
>>
>>     if (V4L2_TYPE_IS_MULTIPLANAR(f->type) && !multiplanar)
>>         return -EINVAL;
>> @@ -718,18 +719,18 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
>>
>>         if (ctx->is_enc ||
>>             !vb2_is_streaming(&ctx->fh.m2m_ctx->cap_q_ctx.q))
>> -            info = v4l2_fwht_get_pixfmt(f->index);
>> +            info = v4l2_fwht_get_pixfmt(index);
>>         else
>>             info = v4l2_fwht_find_nth_fmt(info->width_div,
>>                              info->height_div,
>>                              info->components_num,
>>                              info->pixenc,
>> -                             f->index);
>> +                             index);
>>         if (!info)
>>             return -EINVAL;
>>         f->pixelformat = info->id;
>>     } else {
>> -        if (f->index)
>> +        if (index)
>>             return -EINVAL;
>>         f->pixelformat = ctx->is_stateless ?
>>             V4L2_PIX_FMT_FWHT_STATELESS : V4L2_PIX_FMT_FWHT;
>> diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/media/test-drivers/visl/visl-video.c
>> index f8d970319764..c5f3e13b4198 100644
>> --- a/drivers/media/test-drivers/visl/visl-video.c
>> +++ b/drivers/media/test-drivers/visl/visl-video.c
>> @@ -341,21 +341,24 @@ static int visl_enum_fmt_vid_cap(struct file *file, void *priv,
>>                  struct v4l2_fmtdesc *f)
>> {
>>     struct visl_ctx *ctx = visl_file_to_ctx(file);
>> +    u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
>>
>> -    if (f->index >= ctx->coded_format_desc->num_decoded_fmts)
>> +    if (index >= ctx->coded_format_desc->num_decoded_fmts)
>>         return -EINVAL;
>>
>> -    f->pixelformat = ctx->coded_format_desc->decoded_fmts[f->index];
>> +    f->pixelformat = ctx->coded_format_desc->decoded_fmts[index];
>>     return 0;
>> }
>>
>> static int visl_enum_fmt_vid_out(struct file *file, void *priv,
>>                  struct v4l2_fmtdesc *f)
>> {
>> -    if (f->index >= ARRAY_SIZE(visl_coded_fmts))
>> +    u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
>> +
>> +    if (index >= ARRAY_SIZE(visl_coded_fmts))
>>         return -EINVAL;
>>
>> -    f->pixelformat = visl_coded_fmts[f->index].pixelformat;
>> +    f->pixelformat = visl_coded_fmts[index].pixelformat;
>>     return 0;
>> }
>>
>> -- 
>> 2.43.0
>>
>> _______________________________________________
>> Kernel mailing list -- kernel@mailman.collabora.com
>> To unsubscribe send an email to kernel-leave@mailman.collabora.com
>> This list is managed by https://mailman.collabora.com
> 


