Return-Path: <linux-media+bounces-62406-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHt1Fhu1DmosBQYAu9opvQ
	(envelope-from <linux-media+bounces-62406-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:32:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A60C75A02A0
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 941B8306A5E6
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239E2399CE9;
	Thu, 21 May 2026 07:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O7lHyhut"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54A1396561
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348430; cv=none; b=PADKO0wwt+2xQNkm6470YE6HyWoJMM6cImtiWRtRNfb9MnRkwVukXmDR6IcjPhTKmKjT8UwGYKVTvvNacsiTN1tzHgkevMADXvUoqx87bSkUtIpGAzDCPiz34Akn5Occ/Y4lzXXee49Kv+VG3HfVVxISMH8V1A5Lm8MFgz3o4Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348430; c=relaxed/simple;
	bh=b+dsCjQobQVJSHwz4J0dobN/Ng1Ay6rcNNRtQ8SNH7E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=attZRQArwbQnmolOd46MuiO3PzZ0hTeLzuVYwzIIZizxWTO2jUmhMBHiaG6uIjDuPuyxpApOBDFzYz4nABUr9vh8uiGj5IEqJbOWfK1qAhgFwZWNHN1oCl3khdkxHeu7QElMyCjpBLtFdFTm7AtTMQsCGljGwsTXWoeC9dLfx+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O7lHyhut; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso5339531f8f.2
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 00:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779348427; x=1779953227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXHtGnnOcV5ddtG6N7wO967d73FTdnEIMjnmhjZWCNc=;
        b=O7lHyhutR1gGgHCFCKLwqVWqdRwcQW8xUEJ2S+pv0lGIIwqEigo+FNvSp/BrVuKlOH
         pBDyngY1l1aAj9cl/F74vtt8lhT7jIA9JZQo38pztxwsPIZvWHSbrMNGrj2uvkx0AHsB
         Lru9KDGLuDWZ2iP6cXgC/GvoXLdzV+vsjDKxtdCqNC2J7gXpAYPcQK+S86xpuEtawBl7
         dbt/zIRH1qyADGDZG/pvaRldTKZMqz59nCbnEHJ9vx4XSOYagm2fKVs4E/ySGAlcbuBe
         pCxi5wrsGCW8nyjhu/Jyo1EH5ItPbVX5wQOk409JFt/I59BhVzqG8R6mULo+MY7lafxj
         rr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348427; x=1779953227;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXHtGnnOcV5ddtG6N7wO967d73FTdnEIMjnmhjZWCNc=;
        b=fyFVXPWJroPyEnY7D/Og61BkaJZ1SglV24qxR4HgBaGPv6JRcnLvxD68Ps75CN1DZI
         wQURkKDRvtYL9wLXKVf/okhoccDRpFYSGOw8ZGC0ynHpd71CjrRxTAocuDRUwf01KG9p
         PKPiOVXFfE6VeQp7RFBeUWU50WMRMJkt5Mdt8SwaQRiucOTfCoOffdWnLQEGQy1HJoBa
         Q5PW8D82mCh06OYY4W2j4eTti0QCfdL5B21p3t1lZRtAS8snb6JcN1WGiF2JcYXQDRlh
         cAVcLBt6wXA+arqkAbVjzvp8crBPebAjjFUj3rE/UB5MG6uOdtpa8CcgFFxNF54Q2zkW
         pySw==
X-Gm-Message-State: AOJu0YwPJY/mPjlHwPv+3OtC5DhNIEa7gnAIATXlRs2Y8n1HRWdtS5Xm
	M7VfOXgHBkZFWh7PUN/b8mGgbSTz6FQ/loL2aR/txMGDrvedWyEuymV6SA+tROPucwg=
X-Gm-Gg: Acq92OE+9+/VQNG+44XDAEtWkRG+f/qWbs2pKL2hCC3jbbRO0URlmgamEcl7TATeVlc
	qjeXDgcOHplc5bYJLuamBnfrxwsqOTo29te62jOMTdI1FIst2FdbZWOs9UzodTz19YtDOE+LnJ8
	4EdQ4j5+mK+6dLLbdaTlvuEDbhOmyo2DJzQ2V4x4c2uTUK/wNuo/xRCYzUYwfxJHoEMWOAXtDpt
	hjIVnsO5wkoyf+24WxOpRRyw3JOZhblHAvDmbGumuI6+0gUqDd2j2G/IblKtDAi447YCSISPQuo
	xUPyvpEaXJ9jCfKno80HwXd5P8YYKnEPrm0iFwRKJ8Fj4zgwXYuzYysyy3WEE+uH+CRBNDQEB4E
	69DNrKZKsyoYoUzhleUl0R8cQFmC0QSk14p7/pT6A0LGsEXIl/wBj6XfuxOPHsCoMWsw9p4oOLV
	eFU7WPdFW7d5ZVoJHV4HuTfB8vYMy/2UrNgqgopX8iKXdTxdzBsAsqEkmC8sU/YU6z0f87TEY3g
	x4PQNM=
X-Received: by 2002:a05:6000:1ace:b0:45e:7997:8b7a with SMTP id ffacd0b85a97d-45ea37bb72dmr2607655f8f.16.1779348427186;
        Thu, 21 May 2026 00:27:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e038:7e8a:7467:8c6c? ([2a01:e0a:106d:1080:e038:7e8a:7467:8c6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa9366besm670994f8f.31.2026.05.21.00.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 00:27:06 -0700 (PDT)
Message-ID: <89a81b27-b217-4c74-96c0-c6f813a0768f@linaro.org>
Date: Thu, 21 May 2026 09:27:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
 <c6789e1e-db42-4546-8a98-d75a2443747a@oss.qualcomm.com>
 <de7c6626-a1fc-4a8e-b5e6-86dadf47cdf7@linaro.org>
 <bdc1bd01-f9ab-4101-b9e6-5799d63ed1f6@oss.qualcomm.com>
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
In-Reply-To: <bdc1bd01-f9ab-4101-b9e6-5799d63ed1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62406-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: A60C75A02A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 17:55, Vikash Garodia wrote:
> 
> On 5/18/2026 1:09 PM, Neil Armstrong wrote:
>> On 5/13/26 21:39, Vikash Garodia wrote:
>>>
>>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>>> Add the necessary bits into the gen2 platforms tables and handlers
>>>> to allow decoding streams into 10bit pixel formats.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++ ++++++++++-
>>>>   drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
>>>>   drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  8 +++++---
>>>>   drivers/media/platform/qcom/iris/iris_vdec.c             |  8 ++++++++
>>>>   4 files changed, 30 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/ iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/ iris_hfi_gen2_response.c
>>>> index 0541e02d7507..b6d815c01f1d 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> @@ -542,6 +542,15 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>>>       pixmp_ip->width = width;
>>>>       pixmp_ip->height = height;
>>>> +    if (subsc_params.bit_depth == BIT_DEPTH_8 &&
>>>> +        pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
>>>> +        pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
>>>> +        pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
>>>> +    else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
>>>> +         pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
>>>> +         pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
>>>> +        pixmp_op->pixelformat = V4L2_PIX_FMT_P010;
>>>> +
>>>>       switch (pixmp_op->pixelformat) {
>>>>       case V4L2_PIX_FMT_P010:
>>>>           pixmp_op->width = ALIGN(width, 128);
>>>> @@ -625,7 +634,12 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>>>       inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
>>>>       inst->fw_caps[TIER].value = subsc_params.tier;
>>>> -    if (subsc_params.bit_depth != BIT_DEPTH_8 ||
>>>> +    if (subsc_params.bit_depth == BIT_DEPTH_8)
>>>> +        inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_8;
>>>> +    else
>>>> +        inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_10;
>>>> +
>>>> +    if ((subsc_params.bit_depth != BIT_DEPTH_8 && subsc_params.bit_depth != BIT_DEPTH_10) ||
>>>>           !(subsc_params.coded_frames & HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
>>>>           dev_err(core->dev, "unsupported content, bit depth: %x, pic_struct = %x\n",
>>>>               subsc_params.bit_depth, subsc_params.coded_frames);
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/ drivers/media/platform/qcom/iris/iris_instance.h
>>>> index 16965150f427..16424d1e94a6 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>>>> @@ -25,6 +25,8 @@ enum iris_fmt_type_out {
>>>>   enum iris_fmt_type_cap {
>>>>       IRIS_FMT_NV12,
>>>>       IRIS_FMT_QC08C,
>>>> +    IRIS_FMT_TP10,
>>>> +    IRIS_FMT_QC10C,
>>>>   };
>>>>   struct iris_fmt {
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/ drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> index 5da90d47f9c6..ceed4b5d96ca 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> @@ -56,9 +56,10 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>>>>       {
>>>>           .cap_id = PROFILE_HEVC,
>>>>           .min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>>>> -        .max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>>> +        .max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>>
>>> what about gen1 platforms ?
>>
>> With this patchset gen platforms will reject 10bit since all the
>> plumbing in the HFI response handling is missing.
>>
>> Once the Gen1 HFI gets the bit_depth and calculates the buffer sizes, it
>> should work. But looking at Venus, the 10bit buffer calculation seems much
>> more complex in Gen1.
> 
> Is it more than accommodating higher buffer size by adding 25% extra for higher bits for decode scenario ?

No idea, I haven't looked closely how to implement 10bit on gen1, I just checked if this patchset
wouldn't cause any regressions.

It may show P010 and QC10C in enum_fmt, but the PROFILE_HEVC and would not expose MAIN10 on gen1.

> 
>>
>>>
>>>>           .step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
>>>> -                BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
>>>> +                BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
>>>> +                BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
>>>>           .value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>>>>           .hfi_id = HFI_PROP_PROFILE,
>>>>           .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>>> @@ -287,7 +288,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>>>>       {
>>>>           .cap_id = BIT_DEPTH,
>>>>           .min = BIT_DEPTH_8,
>>>> -        .max = BIT_DEPTH_8,
>>>> +        .max = BIT_DEPTH_10,
>>>>           .step_or_mask = 1,
>>>>           .value = BIT_DEPTH_8,
>>>>           .hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
>>>> @@ -866,6 +867,7 @@ static const u32 sm8550_vdec_output_config_params[] = {
>>>>       HFI_PROP_OPB_ENABLE,
>>>>       HFI_PROP_COLOR_FORMAT,
>>>>       HFI_PROP_LINEAR_STRIDE_SCANLINE,
>>>> +    HFI_PROP_UBWC_STRIDE_SCANLINE,
>>>>   };
>>>>   static const u32 sm8550_venc_output_config_params[] = {
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/ media/platform/qcom/iris/iris_vdec.c
>>>> index f4d9951ed04c..65cf509e4aef 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>>> @@ -70,6 +70,14 @@ static const struct iris_fmt iris_vdec_formats_cap[] = {
>>>>           .pixfmt = V4L2_PIX_FMT_QC08C,
>>>>           .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>>>>       },
>>>> +    [IRIS_FMT_TP10] = {
>>>> +        .pixfmt = V4L2_PIX_FMT_P010,
>>>> +        .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>>>> +    },
>>>> +    [IRIS_FMT_QC10C] = {
>>>> +        .pixfmt = V4L2_PIX_FMT_QC10C,
>>>> +        .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>>>> +    },
>>>>   };
>>>>   static const struct iris_fmt *
>>>>
>>>
>>> Regards,
>>> Vikash
>>>
>>
> 


