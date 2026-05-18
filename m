Return-Path: <linux-media+bounces-61897-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHvpB7TBCmoI7gQAu9opvQ
	(envelope-from <linux-media+bounces-61897-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:37:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C6F567CB1
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58BA3305660C
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 07:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DE43E168B;
	Mon, 18 May 2026 07:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ljosRuNv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A34D30567A
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089568; cv=none; b=Vheo2TqMLr5DtmN8EGooaG9/zfCwOWd2Sg/rlLtHj0GPaIDP72zmUgaVsOaFe6TkgK40LbuavhZ1hkngwzK0QLmvMGOOa475UMfzhrDwaBKsVftKuJsOtNRMWsg6HQOuAv2PYYqPN7cs5aFbufKpqOOsDWbAhtBGoD5bTzL2ILA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089568; c=relaxed/simple;
	bh=brPhBHjUGlrj7AmaXGarcu0KE6dZaP/hUM1DwMbI+0g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NRDY2/Y7t7HORdSGWoBnuM7/nqsZRC8rp4gkRJH0iIWFJ3/00eeYTMZoot2JcnKtyp6IvY2E5N0THPyr4n7mH5zyOLzPog+dUts91t34UwDlN95YVeHMgTC1vGTWSfh/s90eRjTHUt2jANEsaOfBEjs65LPPI2k5PRLGi1aWusg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ljosRuNv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43fe608cb92so1030018f8f.2
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 00:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779089565; x=1779694365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIb43F/FW9nE7kYTGRQdEB8eXYN5MdHZmB7Fyms3I/w=;
        b=ljosRuNvfpJTLuQvkY6gYiTMWodsY0Fcjji3CDBhwETqgPZDPrbRuTMyycE4vNqJKI
         ig9SQqvYvrLYb83PXtZoWHT6gVBB995bYFcx8irLyrFGnyEX5Xk3cBNkNezxoh1NsRHI
         /JNU9OheJm/zvl4rMGJGNo4ddeCbwybwiVjnVpOrg5SsA7YTrk77VzRfoUCfssdAIvRA
         MMT2nOERfb1GSS4fKkVQBIOapj+aZzSvlsDSyVV2Y49B1Ba0mpqEid05QyEBtxoM64gX
         ai1ATnTM3R+P1vv4hsA4lmENVzcXxSmHmj9OJgPfMSzKGMZCiPZg7dNi67Knp/4CY7me
         JaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089565; x=1779694365;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIb43F/FW9nE7kYTGRQdEB8eXYN5MdHZmB7Fyms3I/w=;
        b=NiZmDksrsHC2TAnypBCpm8rGFJFQUyeq3tfPezDxiJ0kLU0eRHMPow0y1rwh6KSTcY
         gyEZ/IUQzRs0Ry54q9jZo/kl1xXLAVqYTIvEd/V1fmpGbe0FW8sRS2wRGAqVYJXF0PEH
         N89gVEagWybOastBVnG78ARCyoBXHoSYd/LzCD4aJJILwtWnx9kjOwKECzaCJ2iK0vUv
         hNqqFvMdjz8N5M/ImDaLRant13egPHgD3GPo0rwwLCc5FMWdSJvRMRfa3Kxy9Gkih3Pd
         AvmQ78KC7+6neyHISdhMBKR+ZqYQGWekFcKVMV/OkbIvM4P1BqvsqDlMbdtV+Hw3uWbK
         O3WQ==
X-Gm-Message-State: AOJu0YyT4VrIxhhWMYrQbdZsTwspIXuydkJqWUWhROt0wkTdUG1LsDV5
	NmnPoygayMaFWgbvJfr5cjYuJyH/0iYaSSHSsqVmzdcK8JPFz29LhQEr9VMo7n7iQj8=
X-Gm-Gg: Acq92OGWFjNC9jXBaMQme3axkAdwKZ2+sRndensAOjnLTc0tmN5dtq6+47qytBsLHYi
	m9DUOJyBtJVgRup70cPD2GAn/f+cpdELmqr9WU9UNTLdzNXe2W1v6m+r1qNU+S3/26LKnt63Ehd
	3GSDW8SKFUgocvi/qxz0qfJWHmjW1kc0v8kTcMidiAQe5Ig0VblQ2Nmmr7ZChdQOQ3qEwZOZM4U
	NnwHj7TeiEqSF8OFdEECpLV0odn0SFjwUiHYtsJTgNqtXuGNSgCKCamOK23YyN7ckDj6PrjUClQ
	KFGxr/gDsr6mBY01bpI2b+YwEJuB0zRcZdGHGPsv151bDU7ABFao0VQYCpNb4T0Cc+R7a0Q5BX4
	paQR/qPLUyiki78DMSLUhO7mRr+G3wyYFDjUxhXa9ZG3c53LHAYP71sihr2dC0cVZf8eLgH18I2
	jAfz7S4ft1ar7or8kC8dxqEm9WWPDyTyuuDVkQcyvBSBnUQf2/GfIZa1ypsZAH+Gn9h/Xw+jcBq
	xHl
X-Received: by 2002:a05:6000:4007:b0:43d:1cec:4766 with SMTP id ffacd0b85a97d-45e5c5bf971mr21754479f8f.23.1779089564624;
        Mon, 18 May 2026 00:32:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:64e2:72b:b9ed:6dcf? ([2a01:e0a:106d:1080:64e2:72b:b9ed:6dcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm35230470f8f.33.2026.05.18.00.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:32:43 -0700 (PDT)
Message-ID: <febaa0cf-eecf-40ea-b243-4f03646af918@linaro.org>
Date: Mon, 18 May 2026 09:32:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-3-7fc049b93042@linaro.org>
 <b6ab2112-c89a-4ac4-8525-e913ed0b5313@oss.qualcomm.com>
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
In-Reply-To: <b6ab2112-c89a-4ac4-8525-e913ed0b5313@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 87C6F567CB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61897-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:mid,linaro.org:replyto,linaro.org:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 5/13/26 20:50, Vikash Garodia wrote:
> 
> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>> Add the necessary plumbing into the HFi Gen2 to signal the decoder
>> the right 10bit pixel format and stride when in compressed mode.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 75 +++++++++++++++++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>   drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>>   3 files changed, 76 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index 30bfd90d423b..89de8c366836 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>>       if (inst->domain == DECODER) {
>>           pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>> -        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>> -            HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>> +        switch (pixelformat) {
>> +        case V4L2_PIX_FMT_NV12:
>> +            hfi_colorformat = HFI_COLOR_FMT_NV12;
>> +            break;
>> +        case V4L2_PIX_FMT_QC08C:
>> +            hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
>> +            break;
>> +        case V4L2_PIX_FMT_P010:
>> +            hfi_colorformat = HFI_COLOR_FMT_P010;
>> +            break;
>> +        case V4L2_PIX_FMT_QC10C:
>> +            hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
>> +            break;
>> +        };
> 
> semicolon ?

Ack

> 
>>       } else {
>>           pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>           hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>> @@ -517,7 +529,8 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>       stride_uv = stride_y;
>>       scanline_uv = scanline_y / 2;
>> -    if (pixelformat != V4L2_PIX_FMT_NV12)
>> +    if (pixelformat != V4L2_PIX_FMT_NV12 &&
>> +        pixelformat != V4L2_PIX_FMT_P010)
>>           return 0;
>>       payload[0] = stride_y << 16 | scanline_y;
>> @@ -532,6 +545,61 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>                             sizeof(u64));
>>   }
>> +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst *inst, u32 plane)
>> +{
>> +    u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
>> +    u32 stride_y, scanline_y, stride_uv, scanline_uv;
>> +    u32 port = iris_hfi_gen2_get_port(inst, plane);
>> +    u32 pixelformat, width, height;
>> +    u32 payload[4];
>> +
>> +    if (inst->domain != DECODER ||
>> +        inst->fmt_src->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_AV1)
> 
> whats the restriction with AV1 here ?

This restriction is used in downstream driver and Dikshita reported we shouldn't
call HFI_PROP_UBWC_STRIDE_SCANLINE except for AV1.

Could you please check if it's necessary ?

> 
>> +        return 0;
>> +
>> +    pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>> +    width = inst->fmt_dst->fmt.pix_mp.width;
>> +    height = inst->fmt_dst->fmt.pix_mp.height;
>> +
>> +    switch (pixelformat) {
>> +    case V4L2_PIX_FMT_QC08C:
>> +        stride_y = ALIGN(width, 128);
>> +        scanline_y = ALIGN(height, 32);
>> +        stride_uv = ALIGN(width, 128);
>> +        scanline_uv = ALIGN((height + 1) >> 1, 32);
>> +        meta_stride_y = ALIGN(DIV_ROUND_UP(width, 32), 64);
>> +        meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 8), 16);
>> +        meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 16), 64);
>> +        meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 8), 16);
>> +        break;
>> +    case V4L2_PIX_FMT_QC10C:
>> +        stride_y = ALIGN(width * 4 / 3, 256);
>> +        scanline_y = ALIGN(height, 16);
>> +        stride_uv = ALIGN(width * 4 / 3, 256);
>> +        scanline_uv = ALIGN((height + 1) >> 1, 16);
>> +        meta_stride_y = ALIGN(DIV_ROUND_UP(width, 48), 64);
>> +        meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 4), 16);
>> +        meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 24), 64);
>> +        meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 4), 16);
>> +        break;
>> +    default:
>> +        return 0;
>> +    }
>> +
>> +    payload[0] = stride_y << 16 | scanline_y;
>> +    payload[1] = stride_uv << 16 | scanline_uv;
>> +    payload[2] = meta_stride_y << 16 | meta_scanline_y;
>> +    payload[3] = meta_stride_uv << 16 | meta_scanline_uv;
>> +
>> +    return iris_hfi_gen2_session_set_property(inst,
>> +                          HFI_PROP_UBWC_STRIDE_SCANLINE,
>> +                          HFI_HOST_FLAGS_NONE,
>> +                          port,
>> +                          HFI_PAYLOAD_U32_ARRAY,
>> +                          &payload[0],
>> +                          sizeof(u32) * 4);
>> +}
>> +
>>   static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
>>   {
>>       u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> @@ -620,6 +688,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>>           {HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
>>           {HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
>>           {HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
>> +        {HFI_PROP_UBWC_STRIDE_SCANLINE,       iris_hfi_gen2_set_ubwc_stride_scanline },
> 
> alignment
> 
>>           {HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
>>           {HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
>>           {HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index cecf771c55dd..68f849232906 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -118,6 +118,7 @@ enum hfi_flip {
>>   #define HFI_PROP_OPB_ENABLE            0x03000184
>>   #define HFI_PROP_AV1_TILE_ROWS_COLUMNS        0x03000187
>>   #define HFI_PROP_AV1_DRAP_CONFIG        0x03000189
>> +#define HFI_PROP_UBWC_STRIDE_SCANLINE        0x03000190
>>   #define HFI_PROP_COMV_BUFFER_COUNT        0x03000193
>>   #define HFI_PROP_AV1_UNIFORM_TILE_SPACING    0x03000197
>>   #define HFI_PROP_END                0x03FFFFFF
>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
>> index bdedd6bfa87a..c75dcb8e671e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_utils.c
>> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
>> @@ -35,7 +35,9 @@ int iris_get_mbpf(struct iris_inst *inst)
>>   bool iris_split_mode_enabled(struct iris_inst *inst)
>>   {
>>       return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
>> -        inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
>> +        inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C ||
>> +        inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010 ||
>> +        inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C;
>>   }
>>   bool iris_fmt_is_8bit(__u32 pixelformat)
>>
> 

Thanks,
Neil

