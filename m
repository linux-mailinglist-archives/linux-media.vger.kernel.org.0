Return-Path: <linux-media+bounces-60047-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULqwF78H82lHwwEAu9opvQ
	(envelope-from <linux-media+bounces-60047-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 09:41:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BA549EC4E
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 09:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7BA53013020
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 07:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B8C3A2546;
	Thu, 30 Apr 2026 07:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZo5zeIU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1363EB813
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 07:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534732; cv=none; b=BsKAEpB5MIqxDHl0GLkqwq6vwsOA9p7aFwOuJae2YtOVLmSAnaYZFv/nui5my7zDHLSWmdGp4hNJ17iEJDnXG5bjiUwXpZFRper84GKAJK76QXtQ7PP4V2ZCz/efzylZCgI89sU7RyCz0ID4ENnjb37PSQHBox/pKIM9FieNqsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534732; c=relaxed/simple;
	bh=SL3NgNBNxFw29Bltuhuy3L4p2IZnhoHJYJyZXqoC68Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=W6MuZqQBIsS6LLLQO1Qc1YBn3+xeFJkuCYSVtaeAjvxzlFpFibNnHa4r4kPe4mVvD1f6gawIKZA6KacnWsaCYa0b9DnCgJWFswcdz+BaS93suzBI90+5F62DlpgJqPqRVdar/+a3bbybMLDQcQmbeagLwXrHEHL2P7rpwWSVT0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZo5zeIU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-448528f4e69so336337f8f.3
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777534721; x=1778139521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/T1T/EHOWdSYbyFhDgWRrDXkECkPg3J02N11khxxDc=;
        b=dZo5zeIUdcvv/Xh4f9SFB5g4PcWAnT+r8KvqwGU/RFuj9dAl+PwYD8XkBrbgdj0WGo
         7bC8w2n2YGG19KWhnEDGxjKS67x0ajyFeUPGGsmpQzo7ejvtAafGjT4BaRYDpecaTccO
         zOYIHFzVQiN/0uL/Wou0CbBj/D3I9yYQbYF8Npswq5isfkal2yBstKh5iB37vbiuSDwV
         bwQ14YEyxTLTEaQviUrd6qDzuPGFpFkWIpe25R30s22l0kfOmwtxcgPqDa3KAxna098o
         PUgRtPu3votXBsvo3NALyjp+i40tiFL/sJQs2tmMXOYRkVP8VUwkOLH51n/7l/5LCz86
         vQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534721; x=1778139521;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/T1T/EHOWdSYbyFhDgWRrDXkECkPg3J02N11khxxDc=;
        b=XhSvdaGYeSD9yYuRDbjlBFBhwKgZOr7G6fioAMmDJtCHBF+wAew1UmOFd+C5bbSlIr
         Gl9XFuGJ7SJVWChMpQN4Tipxi7gDBlniz+uXGI4h+qQklHA3tpHciB+Dh+tVJ86rhOii
         ecBAAChUL1QaehbpAViE9AsXc/ubgCO4lNWTRWL1ysSt7f2deRE/g+7a0Bciws1+xSGd
         wCn23fEEJv1Zh8L95zkpjBk5Ac4Sruo3R3PHXuYlT/ciw8Dj3ASuNxHHGD0Fa4+x1u6a
         ztf5MQH1XrvD9Uni2Do5gFKFKdHxEcTovVdcHKPcNgHDRe4fyr1PQd8f/SmDqieeAIcK
         1viA==
X-Gm-Message-State: AOJu0YwXmPFTja6rhnNldAv+PwXWbKIVR4vFh9e/AyOM4diQEDKhURqr
	q3ftJeZ1rqMkwKpkt5QLYifVt9dZv9PZ+VX2RiEtNiUCPxBMfbWp8pw0OipIdh9qszg=
X-Gm-Gg: AeBDietaGNdsUMChbf7O/2Q4qrpwxdif2Ztr4VSliRToRM7AF2rOvd+eT5wIMe+RaLV
	PfbLXPNAv1pnEqZqm+WA53ZZ3qyKppiSbKI5VZJysNeo3eIwYC8ns/PEox8pk+RUPfk0uOKs0tm
	3UctzT3tk5PObpydElVs6tCDeXQcyOBez4C+mDc8RaJVb8NCQBdzNjBHH71qN/v38c2QGQ5JCrZ
	mGjwAU2VlwMZo4Zto2K9Dyc03C6qFr12MP17Y1XBSEgO5qcLTTr/kGkKSyutbKTZMKE2nbPuys3
	Bku+cGH+fIgp8BCg02VCvDPrlNYcL6o2v8ThRMw26+ktRjr0aXttS0SL9T97ZBEa3NJnXfcTJ0i
	kdgi2ExcjLJh7oKgaDNIkjaq8uAkLV0CiO5lYZmLvqfzfc7GpH37ayBXYgbmKAQ6bTN6u5j3YQv
	sNk0Taau5dGlOXrMLP0X2c7EboXSHqpUslvVuPKMroEZPTGXbdrUlcCq2sjcBYkqkxK4HYbypfk
	VaAifAre1yjPKYRpg==
X-Received: by 2002:adf:e690:0:b0:449:6a23:dd1f with SMTP id ffacd0b85a97d-4496a23dd94mr1203427f8f.15.1777534720434;
        Thu, 30 Apr 2026 00:38:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6dcc:3980:fe87:c6ae? ([2a01:e0a:106d:1080:6dcc:3980:fe87:c6ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca5fe6sm11558662f8f.32.2026.04.30.00.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:38:39 -0700 (PDT)
Message-ID: <8eb85a16-08f9-4061-a8ee-d3b183060dc4@linaro.org>
Date: Thu, 30 Apr 2026 09:38:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
 <20260417-topic-sm8x50-iris-10bit-decoding-v2-3-c987b65a31d5@linaro.org>
 <568c51fd-a229-0cd9-815d-7461606beb60@oss.qualcomm.com>
 <391c1fb3-cf0a-4255-a8a3-94010754eaf3@linaro.org>
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
In-Reply-To: <391c1fb3-cf0a-4255-a8a3-94010754eaf3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B7BA549EC4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60047-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:email,linaro.org:dkim,linaro.org:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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

On 4/22/26 15:43, Neil Armstrong wrote:
> On 4/22/26 11:13, Dikshita Agarwal wrote:
>>
>>
>> On 4/17/2026 3:07 PM, Neil Armstrong wrote:
>>> Add the necessary plumbing into the HFi Gen2 to signal the decoder
>>> the right 10bit pixel format and stride when in compressed mode.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71 +++++++++++++++++++++-
>>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>   drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>>>   3 files changed, 72 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> index 30bfd90d423b..d664e606e886 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>>>       if (inst->domain == DECODER) {
>>>           pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>> -        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> -            HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>>> +        switch (pixelformat) {
>>> +        case V4L2_PIX_FMT_NV12:
>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12;
>>> +            break;
>>> +        case V4L2_PIX_FMT_QC08C:
>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
>>> +            break;
>>> +        case V4L2_PIX_FMT_P010:
>>> +            hfi_colorformat = HFI_COLOR_FMT_P010;
>>> +            break;
>>> +        case V4L2_PIX_FMT_QC10C:
>>> +            hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
>>> +            break;
>>> +        };
>>>       } else {
>>>           pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>>           hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> @@ -517,7 +529,8 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>       stride_uv = stride_y;
>>>       scanline_uv = scanline_y / 2;
>>> -    if (pixelformat != V4L2_PIX_FMT_NV12)
>>> +    if (pixelformat != V4L2_PIX_FMT_NV12 &&
>>> +        pixelformat != V4L2_PIX_FMT_P010)
>>>           return 0;
>>>       payload[0] = stride_y << 16 | scanline_y;
>>> @@ -532,6 +545,57 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>                             sizeof(u64));
>>>   }
>>> +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst *inst, u32 plane)
>>> +{
>>> +    u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
>>> +    u32 stride_y, scanline_y, stride_uv, scanline_uv;
>>> +    u32 port = iris_hfi_gen2_get_port(inst, plane);
>>> +    u32 pixelformat, width, height;
>>> +    u32 payload[4];
>>> +
>>> +    pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>> +    width = inst->fmt_dst->fmt.pix_mp.width;
>>> +    height = inst->fmt_dst->fmt.pix_mp.height;
>>> +
>>> +    switch (pixelformat) {
>>> +    case V4L2_PIX_FMT_QC08C:
>>> +        stride_y = ALIGN(width, 128);
>>> +        scanline_y = ALIGN(height, 32);
>>> +        stride_uv = ALIGN(width, 128);
>>> +        scanline_uv = ALIGN((height + 1) >> 1, 32);
>>> +        meta_stride_y = ALIGN(DIV_ROUND_UP(width, 32), 64);
>>> +        meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 8), 16);
>>> +        meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 16), 64);
>>> +        meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 8), 16);
>>> +        break;
>>> +    case V4L2_PIX_FMT_QC10C:
>>> +        stride_y = ALIGN(width * 4 / 3, 256);
>>> +        scanline_y = ALIGN(height, 16);
>>> +        stride_uv = ALIGN(width * 4 / 3, 256);
>>> +        scanline_uv = ALIGN((height + 1) >> 1, 16);
>>> +        meta_stride_y = ALIGN(DIV_ROUND_UP(width, 48), 64);
>>> +        meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 4), 16);
>>> +        meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 24), 64);
>>> +        meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 4), 16);
>>> +        break;
>>> +    default:
>>> +        return 0;
>>> +    }
>>> +
>>> +    payload[0] = stride_y << 16 | scanline_y;
>>> +    payload[1] = stride_uv << 16 | scanline_uv;
>>> +    payload[2] = meta_stride_y << 16 | meta_scanline_y;
>>> +    payload[3] = meta_stride_uv << 16 | meta_scanline_uv;
>>> +
>>> +    return iris_hfi_gen2_session_set_property(inst,
>>> +                          HFI_PROP_UBWC_STRIDE_SCANLINE,
>>> +                          HFI_HOST_FLAGS_NONE,
>>> +                          port,
>>> +                          HFI_PAYLOAD_U32_ARRAY,
>>> +                          &payload[0],
>>> +                          sizeof(u32) * 4);
>>> +}
>>
>> I’m still not convinced this change is needed for non‑AV1 codecs.
>> I’m concerned this may be masking an underlying alignment issue, since this
>> property is not intended to be used for non‑AV1 codecs. Even FW team
>> doesn't recommend setting this property for other codecs as it can lead to
>> wasted memory due to over‑allocation and padding.
> 
> I don't see the issue since here we simply pass the same strides as we expect
> on the drm msm and iris driver buffer calculation, as we already do for the
> linear formats BTW.
> It makes no sense to not call HFI_PROP_UBWC_STRIDE_SCANLINE for ubwc formats and
> let the firmware use it's default undocumented strides.

Could you check with the firmware team we shouldn’t set any _STRIDE_SCANLINE property when in UBWC except when in AV1 ?

This doesn't seem coherent, and I don't really understand why it would waste memory.

The whole goal here is to make sure we use the same stride calculation with the produce (iris)
and the consumers (mdss, gpu, iris?...).

If it's a bug in the firmware, then would it be possible to have the exact stride
formula used by the HEVC & VP9 decoders ?

Neil

> 
> Neil
> 
>>
>> Thanks,
>> Dikshita
> 


