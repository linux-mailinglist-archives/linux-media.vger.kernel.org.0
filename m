Return-Path: <linux-media+bounces-58969-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +COLK5Lq4WmKzgAAu9opvQ
	(envelope-from <linux-media+bounces-58969-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:08:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32450418694
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 323A4312CA02
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6256A396D1E;
	Fri, 17 Apr 2026 08:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="onrZ+cAK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE2D397E7D
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413028; cv=none; b=o6ayCtHHKyWQ5NlYyeZyo2Ij6J/hYbcIiwQaFnVXdM3Ezzgs3r3MwvRLZmoBl7Hda4fSTGUeYdE+WJlDrhDINwZ1N97sohp2uoeICPcDx6gE3Nc6VmorLhbyBxmZT0rasyDSTd66CQu8qBIASqqBg6wN1x86aQr+XkK3hFSWLfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413028; c=relaxed/simple;
	bh=PJj574MZSD9xr4sX5KUPPwBaXZNnbWMT3BvGF1rpGqA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hyd59oDS3RAQfcnJlEXJ7N364wZi9SAbEnTAvyZyRbIVmGR8xTkk37loU8Quna2bJ0FRZYpMQduLnYvYRoDIIwyzxV2SuZ+q8Fp4PsQCXwcz2r+Kp2XeAuzDPSNMnC1pwbXQ4q4VPRXQj8dMj8JQOtZjtRe81BncD8ULfTaE9BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=onrZ+cAK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso3172115e9.3
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 01:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776413023; x=1777017823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fD2ZOWKCDk/XVVeYz7vP6ot2Ob7dgYO2NJJEcJDYA1w=;
        b=onrZ+cAKmIqpfhkhXVbmB2NygycQrGZmu+xk+SkzP+oQfqGT2IpLL5Vt8B9nK3ZsHb
         ORwQekPgekxdQVCOikAkiv58Ck0UUy4iytre+4s+k9dhmgeXQHI7iO3+5MLyiHJTuGKz
         fn1/di5x92vAyAXoJx6rkXXRB7dX0tRSckIRptT8lDPRBeIbDHM2WGcist1AAZXQ+sET
         hRZqsYmCCd8VkB1IdzyVLpHNRzTKB13netYS0CSP+cKaKHC7rKWLDTrHPMoboUI6Cx3v
         wt1Cu1CtrpKKluDhFGqM5Oj4vzYCZmaHzdIuxGbqjGYBPvk4fD0zv2/TLNXJPg57NCxn
         QpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776413023; x=1777017823;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fD2ZOWKCDk/XVVeYz7vP6ot2Ob7dgYO2NJJEcJDYA1w=;
        b=k5zsqrUkMyLAeqzO8QWz2+NZj5OHqhWyYasEN0Ofu79NaFF5gin71n/A4X8YjWOYpa
         4qgpsSEesRXshFcYyRNixYnwd+bBRrUMVmlN4t0WPCHFz5bvtcGPEAHN89J7cLc32Zk0
         jiWO6kexHvShFAv++NKTkWdRrzigvuTeer9SxyLP9y2y65JbpKufU9RZxfxN1fkNufIV
         kbQfgSbvrjyIHl5Mr87Zs6aPjzAaCFNFOrpWhGbSTW+GiN6s5s3nHVcAVbzEof18pPPb
         +HpwOuvxIEl6mFjdfktNh+Dqnm2c2FWVg0y+n/fml1ti0UHr54bga+tzfoTaKSo3NbK5
         CY4w==
X-Gm-Message-State: AOJu0YzBvVfmBHd0PM/Ig2DAlkwaQMHSfZKdCxi0BXp26t1m92WiI1pz
	PF24YP+svI7RroEcpScOBpdsgtLRmnVaNNTPdyQnChetbSufLqkuBNf+guxsD0lA9Uk=
X-Gm-Gg: AeBDies9JqNskdwRozAx7bCYRzzCB2zho9jZ4RKLHuMkyimEIBRj4gxWaKtiy6dEnCz
	XSl4Fsr5Rvs0+mQOEkWyw2lujxhpoHmFt83q/efzcwe3KI3w2pXcOuQON8rjcjRPx8KDz2If9hT
	ryySDZTHfGui6EIyEwjHqh4x2CT9HSS7sEoCYVK58kzsVVGNBXi4DIslO5p/Dxk3cmNLZExFFlR
	zFS8FwIjfv1tSBvrZRYecJ9zitkO1QOG4T4DmEQNNMv52DFe3Mb5xX19+3iHECDrPry9AmdSF+c
	KZ9dFy1uKEpmBPnavtuP0shTOzq5qy51nDiXk5dIlrXFyiNQbbZeZG8Ci4JNvOerYSo7sO2dBS6
	HA4TZHDXFUKyL3IwFnL7alh5Sgo/n/sUIWFJ3lKEjvLhgt0yn2AgFJavuC/Xe5BvUhifV5BQ4eN
	vQPDYX9TUhZ2+9loTWvDoRtMh+XUQG7LPAwNb6cQEKk3iTeXgYXKf9jxBcUdw2RGLikPQ9+fHVi
	WM0ub15PdUjw9w=
X-Received: by 2002:a05:600c:a00f:b0:486:fe83:8621 with SMTP id 5b1f17b1804b1-488fb788924mr25219095e9.23.1776413022606;
        Fri, 17 Apr 2026 01:03:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b416:50ee:20e:8775? ([2a01:e0a:106d:1080:b416:50ee:20e:8775])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1ce408sm22191375e9.14.2026.04.17.01.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 01:03:42 -0700 (PDT)
Message-ID: <858eba40-5e7a-4dc2-89cc-a6cd81ac189c@linaro.org>
Date: Fri, 17 Apr 2026 10:03:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 1/7] media: qcom: iris: add QC10C & P010 buffer size
 calculations
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-1-428c1ec2e3f3@linaro.org>
 <0afa05c9-1cbe-88b6-32d6-f65813391817@oss.qualcomm.com>
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
In-Reply-To: <0afa05c9-1cbe-88b6-32d6-f65813391817@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58969-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:replyto,linaro.org:email,linaro.org:dkim,linaro.org:mid];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 32450418694
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/26 08:47, Dikshita Agarwal wrote:
> 
> 
> On 4/8/2026 10:13 PM, Neil Armstrong wrote:
>> The P010 (YUV format with 16-bits per pixel with interleaved UV)
>> and QC10C (P010 compressed mode similar to QC08C) requires specific
>> buffer calculations to allocate the right buffer size for DPB frames
>> and frames consumed by userspace.
>>
>> Similar to 8bit, the 10bit DPB frames uses QC10C format.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c | 81 +++++++++++++++++++++++++-
>>   1 file changed, 80 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index 9151f43bc6b9..a0e31bff8f26 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -15,7 +15,9 @@
>>   #define MAX_WIDTH 4096
>>   #define MAX_HEIGHT 2304
>>   #define Y_STRIDE_ALIGN 128
>> +#define Y_STRIDE_ALIGN_P010 256
>>   #define UV_STRIDE_ALIGN 128
>> +#define UV_STRIDE_ALIGN_P010 256
>>   #define Y_SCANLINE_ALIGN 32
>>   #define UV_SCANLINE_ALIGN 16
>>   #define UV_SCANLINE_ALIGN_QC08C 32
>> @@ -80,6 +82,26 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
>>   	return ALIGN(y_plane + uv_plane, PIXELS_4K);
>>   }
>>   
>> +static u32 iris_yuv_buffer_size_p010(struct iris_inst *inst)
>> +{
>> +	u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines, uv_scanlines;
>> +	struct v4l2_format *f;
>> +
>> +	if (inst->domain == DECODER)
>> +		f = inst->fmt_dst;
>> +	else
>> +		f = inst->fmt_src;
>> +
>> +	y_stride = ALIGN(f->fmt.pix_mp.width * 2, Y_STRIDE_ALIGN_P010);
>> +	uv_stride = ALIGN(f->fmt.pix_mp.width * 2, UV_STRIDE_ALIGN_P010);
>> +	y_scanlines = ALIGN(f->fmt.pix_mp.height, Y_SCANLINE_ALIGN);
>> +	uv_scanlines = ALIGN((f->fmt.pix_mp.height + 1) >> 1, UV_SCANLINE_ALIGN);
>> +	y_plane = y_stride * y_scanlines;
>> +	uv_plane = uv_stride * uv_scanlines;
>> +
>> +	return ALIGN(y_plane + uv_plane, PIXELS_4K);
>> +}
>> +
>>   /*
>>    * QC08C:
>>    * Compressed Macro-tile format for NV12.
>> @@ -204,6 +226,55 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>>   	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
>>   }
>>   
>> +/*
>> + * QC10C:
>> + * Compressed Macro-tile format for TP10.
>> + */
>> +static u32 iris_yuv_buffer_size_qc10c(struct iris_inst *inst)
>> +{
>> +	u32 y_stride, y_buf_height;
>> +	u32 uv_stride, uv_buf_height;
>> +	u32 y_md_stride, y_md_height;
>> +	u32 uv_md_stride, uv_md_height;
>> +	u32 y_data_size, uv_data_size;
>> +	u32 y_md_size, uv_md_size;
>> +	struct v4l2_format *f = NULL;
>> +
>> +	if (inst->domain == DECODER)
>> +		f = inst->fmt_dst;
>> +	else
>> +		f = inst->fmt_src;
>> +
>> +	y_stride = ALIGN(ALIGN(f->fmt.pix_mp.width, 192) * 4 / 3,
>> +			 Y_STRIDE_ALIGN_P010);
> 
> Y_STRIDE_ALIGN_P010 is being used for both P010 and QC10C, lets keep it
> Y_STRIDE_ALIGN_10_BIT ? or something similar ?
> 
>> +	y_buf_height = ALIGN(f->fmt.pix_mp.height, UV_SCANLINE_ALIGN);
> 
> why not call it y_scanlines only?
> 
>> +
>> +	y_data_size = ALIGN(y_stride * y_buf_height, PIXELS_4K);
> 
> s/y_data_size/y_plane ?
> 
>> +
>> +	uv_stride = ALIGN(ALIGN(f->fmt.pix_mp.width, 192) * 4 / 3,
>> +			  UV_STRIDE_ALIGN_P010);
>> +	uv_buf_height = ALIGN((f->fmt.pix_mp.height + 1) / 2,
>> +			      UV_SCANLINE_ALIGN);
> 
> s/uv_buf_height/uv_scanline?
> 
>> +
>> +	uv_data_size = ALIGN(uv_stride * uv_buf_height, PIXELS_4K);
> 
> s/uv_data_size/uv_plane?
> 
> Pls keep all these names consistent with other functions, applies to below
> variables as well.
> 
> 
> Thanks,
> Dikshita
> 
>> +
>> +	y_md_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width, 48),
>> +			    META_STRIDE_ALIGNED);
>> +	y_md_height = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.height, 4),
>> +			    META_SCANLINE_ALIGNED);
>> +
>> +	y_md_size = ALIGN(y_md_stride * y_md_height, PIXELS_4K);
>> +
>> +	uv_md_stride = ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.width + 1) / 2, 24),
>> +			     META_STRIDE_ALIGNED);
>> +	uv_md_height = ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.height + 1) / 2, 4),
>> +			     META_SCANLINE_ALIGNED);
>> +
>> +	uv_md_size = ALIGN(uv_md_stride * uv_md_height, PIXELS_4K);
>> +
>> +	return y_data_size + uv_data_size + y_md_size + uv_md_size;
>> +}
>> +
>>   static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
>>   {
>>   	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
>> @@ -268,10 +339,18 @@ int iris_get_buffer_size(struct iris_inst *inst,
>>   		case BUF_OUTPUT:
>>   			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
>>   				return iris_yuv_buffer_size_qc08c(inst);
>> +			else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C)
>> +				return iris_yuv_buffer_size_qc10c(inst);
>> +			else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010)
>> +				return iris_yuv_buffer_size_p010(inst);
>>   			else
>>   				return iris_yuv_buffer_size_nv12(inst);
>>   		case BUF_DPB:
>> -			return iris_yuv_buffer_size_qc08c(inst);
>> +			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ||
>> +			    inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010)
> 
> Please introduce one API, is_10bit_format and use that here instead.

Ack

> 
> Thanks,
> Dikshita
>> +				return iris_yuv_buffer_size_qc10c(inst);
>> +			else
>> +				return iris_yuv_buffer_size_qc08c(inst);
>>   		default:
>>   			return 0;
>>   		}
>>


