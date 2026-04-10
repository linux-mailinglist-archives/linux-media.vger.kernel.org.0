Return-Path: <linux-media+bounces-58543-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SErHFCrm2GmZjggAu9opvQ
	(envelope-from <linux-media+bounces-58543-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:59:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B777C3D67AE
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94DF5302835D
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96F0385519;
	Fri, 10 Apr 2026 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AccwqYpb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA1C3BA233
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775822367; cv=none; b=HxhCU/EeEga9aOyqZpblO7ZGHkNXvavAxkyqoC6zYayO3tu0rIh5SlagttwNzXcyn4wcz4UGXcLO/Nv8jdM4O+xFHoXQBM45ht0FGW3eG4TR+7hmv3t42ApKwHmnXzLwUX0++JJHKu/bDffP+H//D/mEWpK0nFrVZOC1XWYP0j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775822367; c=relaxed/simple;
	bh=v5NSJZ8m+KjzHf0SXfqwYnT09yfmMTD4G2bhU8FttMQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Mre+92nc7D5O0blwvxWr1S/+PYG0jSlkDHHEgSrsjnP2diziB+X4+jWWXOUjB81cgmol0YpMbQeJHPqhUqqjZZTLJ0V0UYDSsaX4QGtXrDGlBNs98atXHrxZDr6gFMGDXhd7LP9Flf4z2gEQs31lgC8myMIiDApTMKekL6O4PFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AccwqYpb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0046078so19302625e9.1
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 04:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775822364; x=1776427164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARUmy3u+QOOrwwGq9+IgAFjaW2vQNODoG/89VhhLSEM=;
        b=AccwqYpbeQgzCEKfe1TVsHVqUhk1wHFgFco2+o1s9npaV/5k1Qe4Y2QrEt8FacJL3N
         71ob2XWePKw6IUPcx1xtHLxSzskt2xuOvJQf2TEe6v0+pXnUk4qpJ7/zXMrCWMc1sGpp
         Q/OgQNGNeMiAeEehEanbnIdHVJflwjLYpEhhxgFPLb2xuJRTezj+N9G9Bb2y0TlRh4Q7
         0V3YFZGV0Zl0uZYE7vMS+rJAA7r6gFEiDApUDMvp0PbE9sF/LHj4mlBYi8ClYKXuqVK2
         U8m7XM8lbVgeZW68wEcufGeEHPgVWwoE1qLyHVn0B7mGHtdByYUU3RwtRUu9vnuC5xK4
         ymEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775822364; x=1776427164;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARUmy3u+QOOrwwGq9+IgAFjaW2vQNODoG/89VhhLSEM=;
        b=oJMsYL7UkLysBy4yYVzMbVH3cwOd0AQiVcUVC6U0Bb2EQlPge0vqIeOZLMmAvEd6TF
         IPtPd1GY5CprapeElKil5eNuHoriwXytq1MpViOCEZpm1rr/NEf9T4zmatuWKXUU5nuB
         Eu4z1iQZ9NHARAtjaULUH5HJiEcDoPTzbxeNO5yFH1E7xbY44ELJ+NT2ttyAYyedNrWu
         JbeL62fK8XUxrTz/LTnkX0mdztXaHE+92iNCYmAGT7jv+Jig5sL6QNIi7eoWqZZktrOV
         8dCZ2Jf6UUeXDUu2Q9cVt0wQwZJhF8YGWWE998JHsw3nvrysJ3JQYGyb+E+ACIRb8tDn
         UyDg==
X-Gm-Message-State: AOJu0YwHzjrfZ4bJDUWmJFoM9JYWjyDwGKUCwof10IR8AjSm752dwOjF
	vNVb4rA6YEtxgcNr1TQfZ5l86ai6+tIXLkA3UelOr8FrYLEl+f7i0UlIhX/yOPznGGM=
X-Gm-Gg: AeBDies55s88MqnP7fIBGREo7BBTe+j+BZno/T95DcWPmnCgcEXFC+gh0Lw3fl0eHM4
	TROLllIPS2kbByV3/M8bZ4ySidtzd2UAkWfpxrrfF36tOXFyQ7rfMmEzB1kLTzOpLo8ep80UEeV
	lM3wZBRSbCGdbaa+CUqXJAiIpKIqeh7K7Xn77g+RrYdNjY3Z2UpCUR3NUvSUMZiH9g7HhC5o1cs
	1uN1xbKYR49ehBswreqkDriL3fBllt62ugrZ70ti8IEw9HMEraBSL/YZCXuOOaP8btONORUGl8I
	kSbwlyj1LREUkyRANz3e1eHBeXUAHqSimYrrB/nxCG5M3UoUDliG8b6qPAZRv9AWjm/ZDFjsXtM
	J4LvaAKnrNSqXd19gi6ZsU/j3zQughyHHS2OKkVsLSbUq2M2Kh2iBn/dyy+sE7O+313APrkouay
	pJhwxua8qk06ACHvWgfSIzWhjjICcjhBr+Gk5YlRHYh1S8/yXNKgSgURbbmXVFhsI+E9AZXX3fl
	Lxg3TjlcNNhsIyhrw==
X-Received: by 2002:a05:600c:8585:b0:486:fc5f:1ab9 with SMTP id 5b1f17b1804b1-488d68398femr25726335e9.14.1775822364089;
        Fri, 10 Apr 2026 04:59:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:66bc:1b4e:df7c:7dff? ([2a01:e0a:106d:1080:66bc:1b4e:df7c:7dff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d592db30sm60062585e9.10.2026.04.10.04.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 04:59:23 -0700 (PDT)
Message-ID: <0301bf82-0859-44cd-99df-3de997e2cff4@linaro.org>
Date: Fri, 10 Apr 2026 13:59:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 4/7] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-4-428c1ec2e3f3@linaro.org>
 <99eb55a8-6370-bf7b-f9de-e88231454b0e@oss.qualcomm.com>
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
In-Reply-To: <99eb55a8-6370-bf7b-f9de-e88231454b0e@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-58543-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: B777C3D67AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 12:10, Vishnu Reddy wrote:
> 
> On 4/8/2026 10:13 PM, Neil Armstrong wrote:
>> Update the gen2 response and vdec s_fmt code to take in account
>> the P010 and QC010 when calculating the width, height and stride.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../platform/qcom/iris/iris_hfi_gen2_response.c     | 19 ++++++++++++++++---
>>   drivers/media/platform/qcom/iris/iris_vdec.c        | 21 ++++++++++++++++++---
>>   2 files changed, 34 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index 8e19f61bbbf9..d268149191ea 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -542,9 +542,22 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>       pixmp_ip->width = width;
>>       pixmp_ip->height = height;
>> -    pixmp_op->width = ALIGN(width, 128);
>> -    pixmp_op->height = ALIGN(height, 32);
>> -    pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
>> +    pixmp_op->width = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
>> +        ALIGN(width, 192) : ALIGN(width, 128);
>> +    pixmp_op->height = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
>> +        ALIGN(height, 16) : ALIGN(height, 32);
>> +    switch (pixmp_op->pixelformat) {
>> +    case V4L2_PIX_FMT_P010:
>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
>> +        break;
>> +    case V4L2_PIX_FMT_QC10C:
>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
>> +        break;
>> +    case V4L2_PIX_FMT_NV12:
>> +    case V4L2_PIX_FMT_QC08C:
>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
>> +        break;
>> +    }
>>       pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>>       matrix_coeff = subsc_params.color_info & 0xFF;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 719217399a30..ca0518c27834 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -272,10 +272,25 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>>           fmt = inst->fmt_dst;
>>           fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>           fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
>> -        fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>> -        fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>> +        codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 192 : 128;
>> +        fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
>> +        codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 16 : 32;
>> +        fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
>>           fmt->fmt.pix_mp.num_planes = 1;
>> -        fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
>> +        switch (f->fmt.pix_mp.pixelformat) {
>> +        case V4L2_PIX_FMT_P010:
>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
>> +                ALIGN(f->fmt.pix_mp.width * 2, 256);
>> +            break;
>> +        case V4L2_PIX_FMT_QC10C:
>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
>> +                ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
>> +            break;
>> +        case V4L2_PIX_FMT_NV12:
>> +        case V4L2_PIX_FMT_QC08C:
>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline = f->fmt.pix_mp.width;
> In the removed code, bytesperline for NV12 and QC08C was aligned to 128 bytes.
> In the new code, Is that alignment missed or not required?

The alignment is done right before:
	codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 192 : 128;
	fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);

calling ALIGN(f->fmt.pix_mp.width, 128) again is a no-op.

Thanks,
Neil

>> +            break;
>> +        }
>>           fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>>           inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>>           inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
>>


