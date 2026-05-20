Return-Path: <linux-media+bounces-62329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EtWHvbWDWrW3wUAu9opvQ
	(envelope-from <linux-media+bounces-62329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:44:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BA9591248
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B798F3043884
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8FF63EFD35;
	Wed, 20 May 2026 15:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pafoac5n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BD83EFFB8
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291568; cv=none; b=XneHxzryBcbGWjlc/lfpwYkdHZdAqo+4w/H1O1cuU9o4AXg1/T2/J8txC71pNsV0lUnnT2BrO4JcbMelUSjr84t4O1cNcW44vCBjNgzLEBSeCt+61V9h586N9vgYjl1dRWl9keiGgI4Fx1B/xVLTrZhKw3HgYusatbrFVErNkRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291568; c=relaxed/simple;
	bh=KbXaSdV7WxpOPqD2cxuhH9+1lycmCROIX0f80cfBOfc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rwnEebyL/4J2j7BsNF/wfZ3WdohaVNn7saE5l8CLWBEHwiOKWYdc5r7bgLr1AK0ahlkYD64nvcyrYMryIooyGiTnuknjej1QOPE4v2E2hU7odkbnqXHMT5wfPJoHjBSh6W45WAdrYEw0SdW/uTQ7HjCNei6snxTGe0JQ4+Jcfjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pafoac5n; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490229aa522so17417655e9.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779291565; x=1779896365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+eBwUWRmIi3nEQfvUo1Cl/89ojK6tjIV8v0d34bhFE=;
        b=pafoac5nrjb2oG1mJ441k97Hv6Rd6ohN0o6ndRK3SpokVOoNOid4zRv50s/fGh3CPA
         HEM5lXll9DL08G9qQjuENfVv+O+NfRUcW9BxMA/Khz2X32j7V0w2uxPOq2vBR/TPT94y
         HycRzAySKzDoxnu3qmFszWifJJJ28xtTavoeFYgiY6/zBsbVoEM8ylQB934ZBGkLx2mg
         +ec+GxyjdZ1tr4CW4wmwdBMbTCQ0BVSkcBquptbvcQOJOwdVCBwAYOc7ILIL8w9Nd/gl
         CcV/Mdoy91WR+pLW6dtzfNxt9Lf/Fdqx32+VWMjvFrHRGELJr1BlPeGTtj3QgM4h9D7d
         YjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291565; x=1779896365;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+eBwUWRmIi3nEQfvUo1Cl/89ojK6tjIV8v0d34bhFE=;
        b=NbVlBv6oXV0XFxOeRQ82JfxrAIbIcVpeAUNwHozlIJZlZjXB/hfywSHS2kATC5X1gD
         ZckzpfLQMfua0ycGwriP89YjtPbJf6j6VHbGyhwA8rhqiH9nloNZBLM0OVZZVEppvQHI
         2hP/5NqNG3h4rAyg99sV7AdmLpGOFk9JJAtXlWZpgScgnBPM7Q3kFfy6bOMpy1NPBM/p
         Jt6azbI9sEMYIQTDQ/WBnPGd1p+RxrrnqRNahxTSdTTn8HvLv4bHfJEHBn/UZFVE08/W
         RrTkVQCbe82hjIXZvp8ehhHub3lESN/LGCYgj3jnQXT+tu9VRwyWvjc4skM5Z/ric7TH
         uWhA==
X-Gm-Message-State: AOJu0Yw7sAeI72eKNbOZO7Gc9Tt8fsDsJ/PfCWj41S6GIn7DzRpJ94xp
	VSMG83Jl9pHKFLfiIM7/DTid+L0ID+o5eg3z6eZPreMZIkYaRl76PtoO/54gzjyxzv0=
X-Gm-Gg: Acq92OEAb1A4xtp8am3Nf+X51TwfmUpW6ezkO2aIAO5/EXihFNRoeybQKoqIbWOH2S5
	M63EF9OmGwcRZU9o4fq87gpTIUosb83GuEjDgo4ba9VgmLJ/0Sdzzw4hlatEe3hb+30rurxJx0K
	M1w3aUO3P4VmAQpKYbAtGYtP4sJkWQqVF14EyZLxq7vutUxnKF6TMi+Swk08DwD14Cr5SvFCntS
	UhjC7Pc81hkicb2IYsQ5lTjfmowOZiwRKJcl8CWHAvmkw1HwZdMMV4OpbcGVFmK/ImV/ZSQbLCL
	EEuHhMlISl82JBAKuHMlUP7Ix8bqfNfEHgp3wA4NG2d+GS3qLMnc395cfaZu+8riwGAOmwJkRwJ
	eg5mYC79EPP596fll6pSYuWAOCQofnqOoSEVENves/r8mOjU8Y8CphRjXBS20Asl3ILOI1fQuwK
	yVxyM6BWhs8N6oXeCwkQO9xEn2iiB95tFfxhk4zNDO8g+hbyjAUAbVQWsxVBYyMGaBgpbQtBZXJ
	QR3LdroTiHX
X-Received: by 2002:a05:600c:a30a:b0:48a:568f:ae8a with SMTP id 5b1f17b1804b1-48fe5fda35fmr293645575e9.8.1779291564817;
        Wed, 20 May 2026 08:39:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:dec9:6d:b572:fe67? ([2a01:e0a:106d:1080:dec9:6d:b572:fe67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1a22csm54269593f8f.19.2026.05.20.08.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:39:24 -0700 (PDT)
Message-ID: <0534f746-c776-4688-94d3-85a7d7f2d25e@linaro.org>
Date: Wed, 20 May 2026 17:39:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
 <5fc62574-fae1-4bf0-b6b9-fb6fb33041f8@oss.qualcomm.com>
 <08eff436-4221-4bc2-9fac-2ac1b6a091ae@linaro.org>
 <8f708b87-92d3-47ed-8cda-1f34b512816c@oss.qualcomm.com>
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
In-Reply-To: <8f708b87-92d3-47ed-8cda-1f34b512816c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-62329-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 36BA9591248
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 17:30, Vikash Garodia wrote:
> 
> On 5/18/2026 1:06 PM, Neil Armstrong wrote:
>> On 5/13/26 21:27, Vikash Garodia wrote:
>>>
>>>
>>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>>> The 10bit pixel format can be only used when the decoder identifies the
>>>> stream as decoding into 10bit pixel format buffers, so update the
>>>> find_format helper to filter the formats and only allow the proper
>>>> formats when setting or trying a capture format.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
>>>>   drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++ ++++
>>>>   2 files changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> index 5a489917580e..cd3509da4b75 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> @@ -18,6 +18,7 @@ struct iris_inst;
>>>>   #define REGISTER_BIT_DEPTH(luma, chroma)    ((luma) << 16 | (chroma))
>>>>   #define BIT_DEPTH_8                REGISTER_BIT_DEPTH(8, 8)
>>>> +#define BIT_DEPTH_10                REGISTER_BIT_DEPTH(10, 10)
>>>>   #define CODED_FRAMES_PROGRESSIVE        0x0
>>>>   #define DEFAULT_MAX_HOST_BUF_COUNT        64
>>>>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT    256
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/ media/platform/qcom/iris/iris_vdec.c
>>>> index eea69f937147..f4d9951ed04c 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>>> @@ -99,6 +99,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>>>       if (i == size || fmt[i].type != type)
>>>>           return NULL;
>>>> +    if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>>>> +        if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
>>>> +            inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
>>>> +            return NULL;
>>>> +
>>>> +        if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
>>>> +            inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
>>>> +            return NULL;
>>>> +    }
>>>
>>> similar logic would be now needed while enumerating fmt.
>>>
>>> VIDIOC_ENUM_FMT will now enumerate all capture formats (NV12, QC08C, QC10C..) regardless of the stream's bit depth, while VIDIOC_S_FMT will reject the wrong-depth formats.
>>>
>>> userspace will see formats via ENUM_FMT that it cannot successfully set with S_FMT.
>>
>> So initially I did that, but I reverted since it broke decoding with gstreamer when trying
>> to use QC10C since it requires negociating the src/sink before sending the fist buffer
>> and then get the source format change to switch to 10bit.
> 
> Does that mean that src is still producing the data in Q10c, while sink is configured to NV12 (8bit) ?

No, it's early src/sink negociation capabilities with the special DRM DMABUF format to handle the QC10c, way before playback starts and starts the v4l2 dance.

> 
>>
>> I checked and none of the other v4l2 drivers supporting 10bit does that, so it seems right
>> to allow enumerating all possibly supported formats and only accept the session supported
>> one with S_FMT.
> 
> I was reading the documentation on this aspects, and it says to keep all the supported ones, instead of changing runtime and limit it to 10bit ones, in this case.

Hmm, so my change is correct ?

> 
> +ing Nico and Hans incase they would like to comment on this.
> 
>>
>>>
>>>> +
>>>>       return &fmt[i];
>>>>   }
>>>>
>>>
>>> Regards,
>>> Vikash
>>>
>>
> 


