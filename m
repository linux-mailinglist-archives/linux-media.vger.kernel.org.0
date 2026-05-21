Return-Path: <linux-media+bounces-62421-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIFLMabLDmovCQYAu9opvQ
	(envelope-from <linux-media+bounces-62421-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:08:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 647095A1EB7
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B62E8304971F
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 08:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0563C364E80;
	Thu, 21 May 2026 08:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bNjCMlqt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879E93624B2
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353421; cv=none; b=hpDPWZQbJx4rXWdqwsJhvyiMsT1ioZEfPYG30SPpvhCK+f3V7qDzhclviI1JG4MjQTbLGcKVMnqWed5NgujoDY6Hb5jwfo2N/WLvccba93oDPuaK92m+KyvNp1VXFPLcn9PZ5eN23SF9Qz7aSvL5ZtReqFpMC/pPxzj9GImuU1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353421; c=relaxed/simple;
	bh=vTY0RM3dg3M070ap6xWWuU1YkcB0xmgbp/fSQzeU/1s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Atlw8FwFve2Lxu4mLXe4AbOMgEF6dTpqtTZsFMFw3+R+X6vwOrpUNqSy174VcDeSSL7rysjw3BCQIVBJkHsRsmdh7I9shOqYULnTzcFU68+6HXplEIK4kALguSpTYZOiAF1gIhxn0Fu4GME54YuyVb1S6vBNxKSsYJAq/L94xcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bNjCMlqt; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44a74032ff8so4253507f8f.1
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 01:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779353418; x=1779958218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oq2Ylvrn5xb71Y/6n1UnuMHQm1u3qyFmOJKtDl9YGk=;
        b=bNjCMlqtfAppgSS3Dnr1WGER1yNGTcWE+d+74khANwrqdWbLEeNQR81Ohnf/+C+6Ij
         5PU0ICo+agS94BDds8Y1ypkaMtnEqa5e8r9r20UXflX7MRZehGzViQ+HSrklnSIgajC2
         S81rsUf1a0MwH5HmcFaTXUv1SxfxVJMfzs4Aj3wwuVjYDC3X7H+adIAfbu5rQQvblpuF
         bZW+jMjm4Zv/lRmmKWnrRQGDptpfNvcdsgpqgZYmdXJJyaZ+xZMfE64JLuKPr1ngKLDu
         jJCF0FTjUTerntP7dSRF799GvRUqOL+nzeX4P3+HkeKVlVEIMjhOzrkbwPnUDYY9BemC
         ZBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353418; x=1779958218;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oq2Ylvrn5xb71Y/6n1UnuMHQm1u3qyFmOJKtDl9YGk=;
        b=BFAtrX1AmW/4X1WyWTasKz7s/wjn+D4wa2gOuPXIlnNt/yQN7jqvAtG4l/r4a9pwP2
         GSp4MhxC87YiUDNlfDGvoPIYmwPKFCpMFw+64JMOA+gATw6C1JtsqBBiCVKhKLtggWYS
         MVpAzuXtk8iclwU9Se1LVT0mRem+rsfzrwSGvs2CdgnQSbgCTZ/ltqcvZGi/gzTleDss
         9mVeYk3tPswlVFmIyn7KCxA4oKDPbXvmtat5frj1oPCvDUQqJ+sJlTuSSCSYTH8ZHj0A
         18aW9ZJhpKuaHf4ekgCnPVKRHaUtp2uwyDxFB/Ur+eQvxeecZAuviqS4VWQ5CZPshLrP
         Np0g==
X-Gm-Message-State: AOJu0Yy+7UsDy29ISUAfdpbyzp4NutDgQCB90QZ4v5WuJD3K/+49APi8
	890O0PQYah+EksHtgqRVEBLQ8m8tkgrT4B3kArinof06xJBe4mUfXPgHKAU05y6Ihe8=
X-Gm-Gg: Acq92OFpfFMSbVU4nj7QVbQphgssZ5NZqdhomyxrSO6wjSYjkSHGO5tb9FHSUDJOuvX
	zGA/4/V7Qe7nNOogDv+alI3Zd0WZM8PJJ2Gw+VFmCyXIzpAnEqDQkgTXe6bnsGFF9jshFRSs1Ow
	STo8nZJRTQz37y+rnOCklCREc0LfXkRbU45V+OrjO+xn9PriLtdlYHZfpJ/uT7wYDQG7Yj1zo6w
	01ilRQL08ANERbA0iktS2vzrRa0t12bxd2HylRNrn8y/6vrq3nPIh4sSXL6DtcrI6EvB0qIskSu
	Eritr61gCqXX/d4s1fa6tes0XOC3Vj4VZf3d1qgO+fr9bDF6guTXnsiiNhopMI42gW1/XSAOQfn
	dxhDVU2nZq+86kIVRRLmQZ0eHz5PdEDLvNteHfC5BKl2DczYdPut+9WDzTQIVmgQu4gEnTZZQ/O
	OkDGkz6bTDI2Ls34vdecHVx+BKyb2n7m5DZxYj4xy9PoOTBWvtSBD9g9n6PsKm09YVqSYrmrNcz
	+IRBNE=
X-Received: by 2002:a05:600c:4f51:b0:48a:9562:7a30 with SMTP id 5b1f17b1804b1-4903607878amr31745965e9.24.1779353417517;
        Thu, 21 May 2026 01:50:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e038:7e8a:7467:8c6c? ([2a01:e0a:106d:1080:e038:7e8a:7467:8c6c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d52a0bsm46068595e9.7.2026.05.21.01.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:50:17 -0700 (PDT)
Message-ID: <4f4bcba1-26b9-4d61-bb0d-0b39c8142206@linaro.org>
Date: Thu, 21 May 2026 10:50:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/6] media: qcom: iris: add QC10C & P010 buffer size
 calculations
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-2-7fc049b93042@linaro.org>
 <a5e7a134-8b23-4cd1-a4c5-6f6c1954a983@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <a5e7a134-8b23-4cd1-a4c5-6f6c1954a983@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62421-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 647095A1EB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/13/26 20:43, Vikash Garodia wrote:
> 
> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>> The P010 (YUV format with 16-bits per pixel with interleaved UV)
>> and QC10C (P010 compressed mode similar to QC08C) requires specific
>> buffer calculations to allocate the right buffer size for DPB frames
> 
> expand DPB
> 
>> and frames consumed by userspace.
>>
>> Similar to 8bit, the 10bit DPB frames uses QC10C format.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c | 195 ++++++++++++++++++++++++-
>>   1 file changed, 194 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index 1d53c7414b75..713a63d0ca0c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -15,8 +15,11 @@
>>   #define MAX_WIDTH 4096
>>   #define MAX_HEIGHT 2304
>>   #define Y_STRIDE_ALIGN 128
>> +#define Y_STRIDE_ALIGN_P010 256
>>   #define UV_STRIDE_ALIGN 128
>> +#define UV_STRIDE_ALIGN_P010 256
>>   #define Y_SCANLINE_ALIGN 32
>> +#define Y_SCANLINE_ALIGN_QC10C 16
>>   #define UV_SCANLINE_ALIGN 16
>>   #define UV_SCANLINE_ALIGN_QC08C 32
>>   #define META_STRIDE_ALIGNED 64
>> @@ -80,6 +83,63 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
>>       return ALIGN(y_plane + uv_plane, PIXELS_4K);
>>   }
>> +/*
>> + * P010:
>> + * YUV 4:2:0 image with a plane of 10 bit Y samples followed
>> + * by an interleaved U/V plane containing 10 bit 2x2 subsampled
>> + * colour difference samples.
>> + *
>> + * <-Y/UV_Stride (aligned to 256)->
>> + * <----- Width*2 ------->
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          y_scanlines (aligned to 32)
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
>> + * . . . . . . . . . . . . . . . .              |
>> + * . . . . . . . . . . . . . . . .              |
>> + * . . . . . . . . . . . . . . . .              |
>> + * . . . . . . . . . . . . . . . .              V
>> + * U V U V U V U V U V U V . . . .  ^
>> + * U V U V U V U V U V U V . . . .  |
>> + * U V U V U V U V U V U V . . . .  |
>> + * U V U V U V U V U V U V . . . .  uv_scanlines (aligned to 16)
>> + * . . . . . . . . . . . . . . . .  |
>> + * . . . . . . . . . . . . . . . .  V
>> + * . . . . . . . . . . . . . . . .  --> Buffer size aligned to 4K
>> + *
>> + * y_stride : Width*2 aligned to 256
>> + * uv_stride : Width*2 aligned to 256
>> + * y_scanlines: Height aligned to 32
>> + * uv_scanlines: Height/2 aligned to 16
>> + * Total size = align((y_stride * y_scanlines
>> + *          + uv_stride * uv_scanlines , 4096)
>> + *
>> + * Note: All the alignments are hardware requirements.
>> + */
>> +static u32 iris_yuv_buffer_size_p010(struct iris_inst *inst)
>> +{
>> +    u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines, uv_scanlines;
>> +    struct v4l2_format *f;
>> +
>> +    if (inst->domain == DECODER)
>> +        f = inst->fmt_dst;
>> +    else
>> +        f = inst->fmt_src;
>> +
>> +    y_stride = ALIGN(f->fmt.pix_mp.width * 2, Y_STRIDE_ALIGN_P010);
>> +    uv_stride = ALIGN(f->fmt.pix_mp.width * 2, UV_STRIDE_ALIGN_P010);
>> +    y_scanlines = ALIGN(f->fmt.pix_mp.height, Y_SCANLINE_ALIGN);
>> +    uv_scanlines = ALIGN((f->fmt.pix_mp.height + 1) >> 1, UV_SCANLINE_ALIGN);
>> +    y_plane = y_stride * y_scanlines;
>> +    uv_plane = uv_stride * uv_scanlines;
>> +
>> +    return ALIGN(y_plane + uv_plane, PIXELS_4K);
>> +}
>> +
>>   /*
>>    * QC08C:
>>    * Compressed Macro-tile format for NV12.
>> @@ -204,6 +264,132 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>>       return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
>>   }
>> +/*
>> + * QC10C:
>> + * UBWC-compressed format for P010.
>> + * Contains 4 planes in the following order -
>> + * (A) Y_Meta_Plane
>> + * (B) Y_UBWC_Plane
>> + * (C) UV_Meta_Plane
>> + * (D) UV_UBWC_Plane
>> + *
>> + * Y_Meta_Plane consists of meta information to decode compressed
>> + * tile data in Y_UBWC_Plane.
>> + * Y_UBWC_Plane consists of Y data in compressed macro-tile format.
>> + * UBWC decoder block will use the Y_Meta_Plane data together with
>> + * Y_UBWC_Plane data to produce loss-less uncompressed 10 bit Y samples.
>> + *
>> + * UV_Meta_Plane consists of meta information to decode compressed
>> + * tile data in UV_UBWC_Plane.
>> + * UV_UBWC_Plane consists of UV data in compressed macro-tile format.
>> + * UBWC decoder block will use UV_Meta_Plane data together with
>> + * UV_UBWC_Plane data to produce loss-less uncompressed 10 bit 2x2
>> + * subsampled color difference samples.
>> + *
>> + * Each tile in Y_UBWC_Plane/UV_UBWC_Plane is independently decodable
>> + * and randomly accessible. There is no dependency between tiles.
>> + *
>> + * <----- Y Meta stride -----> (aligned to 64)
>> + * <-------- Width ----------> (aligned to 48)
>> + * M M M M M M M M M M M M . .      ^           ^
>> + * M M M M M M M M M M M M . .      |           |
>> + * M M M M M M M M M M M M . .      Height      |
>> + * M M M M M M M M M M M M . .      |         Meta_Y_Scanlines (aligned to 16)
>> + * M M M M M M M M M M M M . .      |           |
>> + * M M M M M M M M M M M M . .      |           |
>> + * M M M M M M M M M M M M . .      |           |
>> + * M M M M M M M M M M M M . .      V           |
>> + * . . . . . . . . . . . . . .                  |
>> + * . . . . . . . . . . . . . .                  |
>> + * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
>> + * . . . . . . . . . . . . . .                  V
>> + * <--Compressed tile Y stride --> (aligned to 256)
>> + * <------- Width * 4/3 ---------> (aligned to 48)
>> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
>> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
>> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  Height      |
>> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_Scanlines (aligned to 16)
>> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
>> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
>> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
>> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
>> + * . . . . . . . . . . . . . . . .              |
>> + * . . . . . . . . . . . . . . . .              |
>> + * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
>> + * . . . . . . . . . . . . . . . .              V
>> + * <---- UV Meta stride ----> (aligned to 64)
>> + * <----- Width / 2 --------> (aligned to 24)
>> + * M M M M M M M M M M M M . .    ^           ^
>> + * M M M M M M M M M M M M . .    |           |
>> + * M M M M M M M M M M M M . .    Height/2    |
>> + * M M M M M M M M M M M M . .    V           M_UV_Scanlines (aligned to 16)
>> + * . . . . . . . . . . . . . .                |
>> + * . . . . . . . . . . . . . .                V
>> + * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
>> + * <--Compressed tile UV stride--> (aligned to 256)
>> + * <------- Width * 4/3 ---------> (aligned to 48)
>> + * U* V* U* V* U* V* U* V* . . . .  ^
>> + * U* V* U* V* U* V* U* V* . . . .  |
>> + * U* V* U* V* U* V* U* V* . . . .  |
>> + * U* V* U* V* U* V* U* V* . . . .  UV_Scanlines (aligned to 16)
>> + * . . . . . . . . . . . . . . . .  |
>> + * . . . . . . . . . . . . . . . .  V
>> + * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
>> + *
>> + * y_stride: width aligned to 256
>> + * uv_stride: width aligned to 256
> 
> This does not match with above layout
It does:

 >> + * <--Compressed tile Y stride --> (aligned to 256)
...
 >> + * <--Compressed tile UV stride--> (aligned to 256)

> 
>> + * y_scanlines: height aligned to 16
>> + * uv_scanlines: height aligned to 16
>> + * y_plane: buffer size aligned to 4096
>> + * uv_plane: buffer size aligned to 4096
>> + * y_meta_stride: width aligned to 64
>> + * y_meta_scanlines: height aligned to 16
>> + * y_meta_plane: buffer size aligned to 4096
>> + * uv_meta_stride: width aligned to 64
>> + * uv_meta_scanlines: height aligned to 16
>> + * uv_meta_plane: buffer size aligned to 4096
>> + *
>> + * Total size = align( y_plane + uv_plane +
>> + *           y_meta_plane + uv_meta_plane, 4096)
>> + *
>> + * Note: All the alignments are hardware requirements.
>> + */
>> +static u32 iris_yuv_buffer_size_qc10c(struct iris_inst *inst)
>> +{
>> +    u32 y_plane, uv_plane, y_stride, uv_stride;
>> +    u32 uv_meta_stride, uv_meta_plane;
>> +    u32 y_meta_stride, y_meta_plane;
>> +    struct v4l2_format *f = NULL;
> 
> drop NULL
> 
>> +
>> +    if (inst->domain == DECODER)
>> +        f = inst->fmt_dst;
>> +    else
>> +        f = inst->fmt_src;
>> +
>> +    y_meta_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width, 48),
>> +                  META_STRIDE_ALIGNED);
>> +    y_meta_plane = y_meta_stride * ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.height, 4),
>> +                         META_SCANLINE_ALIGNED);
>> +    y_meta_plane = ALIGN(y_meta_plane, PIXELS_4K);
>> +
>> +    y_stride = ALIGN(f->fmt.pix_mp.width * 4 / 3, Y_STRIDE_ALIGN_P010);
>> +    y_plane = ALIGN(y_stride * ALIGN(f->fmt.pix_mp.height, Y_SCANLINE_ALIGN_QC10C),
>> +            PIXELS_4K);
>> +
>> +    uv_meta_stride = ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.width + 1) / 2, 24),
>> +                   META_STRIDE_ALIGNED);
>> +    uv_meta_plane = uv_meta_stride *
>> +            ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.height + 1) / 2, 4),
>> +                  META_SCANLINE_ALIGNED);
> 
> Please use >> 1 throughout for consistency. I see iris_yuv_buffer_size_p010() uses them, while iris_yuv_buffer_size_qc10c() dont.
> 
>> +    uv_meta_plane = ALIGN(uv_meta_plane, PIXELS_4K);
>> +
>> +    uv_stride = ALIGN(f->fmt.pix_mp.width * 4 / 3, UV_STRIDE_ALIGN_P010);
>> +    uv_plane = ALIGN(uv_stride * ALIGN((f->fmt.pix_mp.height + 1) / 2, UV_SCANLINE_ALIGN),
>> +             PIXELS_4K);
>> +
>> +    return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
>> +}
>> +
>>   static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
>>   {
>>       struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
>> @@ -268,10 +454,17 @@ int iris_get_buffer_size(struct iris_inst *inst,
>>           case BUF_OUTPUT:
>>               if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
>>                   return iris_yuv_buffer_size_qc08c(inst);
>> +            else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C)
>> +                return iris_yuv_buffer_size_qc10c(inst);
>> +            else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010)
>> +                return iris_yuv_buffer_size_p010(inst);
>>               else
>>                   return iris_yuv_buffer_size_nv12(inst);
>>           case BUF_DPB:
>> -            return iris_yuv_buffer_size_qc08c(inst);
>> +            if (iris_fmt_is_10bit(inst->fmt_dst->fmt.pix_mp.pixelformat))
>> +                return iris_yuv_buffer_size_qc10c(inst);
>> +            else
>> +                return iris_yuv_buffer_size_qc08c(inst);
>>           default:
>>               return 0;
>>           }
>>
> 


