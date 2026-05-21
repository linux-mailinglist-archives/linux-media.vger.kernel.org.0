Return-Path: <linux-media+bounces-62404-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMSvCT2yDmr6AwYAu9opvQ
	(envelope-from <linux-media+bounces-62404-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:20:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8F95A004A
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C14D30488EB
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF86C349B0D;
	Thu, 21 May 2026 07:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uXdzFnB/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D5C306767
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 07:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347936; cv=none; b=dQkgAtrgwwyiwUOYGiiqOGnbESxig2Bjvlbdseup86nc1eFCLYHZZ58aFANZNEUaL8DLqPMb0jHCrAfpUt8zEtDE0WRX1G5zZFHWLjy4sANcMm/Jnl4Il4vMx2F0jIG7j/uGO/sIoUfmoyENNb/wDSJs2PJ6nwiTDSAxjiP7kl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347936; c=relaxed/simple;
	bh=ENWaSHBZoZ9w5cKwcFrQT87wjVPfmFeBFdI2+RaeD74=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KIpIHSmH0/1On3SUAoIqfudI2FuEaLDXXJxA5hZZOUGnk1BLc6xQp34/gjnWohQzTtIJM/2mGx6Ebd6nxyYuheCAS4or8WOZjW4/k0QBu5r2RYmQTzLR0GkwAxUSkV9Eoj+Lx0JJZI8gZDVd2IeR1Dq7Gkf6EC798fvD6T51CNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uXdzFnB/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44a5174670eso3355255f8f.1
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 00:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779347933; x=1779952733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bETVK/qL+P6n+cslnrRdLDkDC8prspZnCCpH5RkWKN0=;
        b=uXdzFnB/PEbkb08zbsX4PkC1McJfoogR2AIPeyu13Lqtw6VNGaoBPxZNt8i0YsvcK8
         lXL7qLKimsNdS/NbS7RLsl4gQTCGRiEgbBOB/38Pc61ZXN7l8FEhZmmQZ1yZmlgakCMX
         7szvRWgw9/k+ae+sVTtWnktCZSCjCS0kOrmvd0eIMyVkaJq9NIttQ6KhVUyX/otJcoE/
         jm4fSywOuiIyCmlhtVN20bp2fzQXjSJhmgjd7QFl6L9WP83AIfciXZEMvohP28Z3ev+9
         xvD403TZEliktzaNvy+2frLaP8me03DUhc9q0WzfuOeOw+oO4LyKZJT6PZEqDU/k/bJH
         jUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779347933; x=1779952733;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bETVK/qL+P6n+cslnrRdLDkDC8prspZnCCpH5RkWKN0=;
        b=RKCRe0e9y7XxTv+GEjsCTlpVUVgJc2Yu5Xqh6y+kO3Wz+J1fs55uheTNUSL68hIFhD
         vUEg8qiY+DNuD0TucXDArnCHBNDu0UY88xndXABqud043B+nrM6UNP94vv957ruoVK3Z
         TZFEr9zCNy5xEyCQQ9NLWzhW3bWkKr6vhXlrrG9rLFDgdgk3Lnchd8AcB8OtXZo7tNBQ
         4pZ9EHKO3myNXPf0StoBSEmqY8F0mWlxcIaNMkMItlkIa98rArTViQPPkTVdTLfHL/ed
         Se3IH4u5XPeCxoSvf49oJEJeiAIB87XbRLxUf8XWG16SXMwSlFu2Jb+iQ6GM6tx768Yb
         IIQA==
X-Gm-Message-State: AOJu0Yz6uuml1CG6c7ZbeZceQQJ8M56VJUq8IO9Yn7AXLnscd65u5nCV
	ajztBWeXIKcmM9mQEi8QofslNBXHh7i2bTtvgFRn/xWRYwLsb1XB1GOqzQSY9y+Bir4=
X-Gm-Gg: Acq92OFVuuDsyUwLcbIZCh7sHCRask1wha8peoom0gwlGzEVXfvJcBpn9NG1UnQI2hQ
	ek5OiTnbHqSCbCGkqJCQ27oRTNjwFZMy+xNoBWbUSw4h08KV9fS9P0lRW65K+9XSFWh7724kc4+
	RH83VaLe/PUT2kKIfjvpEE/EYZ9G0q7dytG8hgpsgOwdU27dvxkQWQAiFQ3140WyxB/lcXYHdKW
	7xHPzAdtmlFGXFL/cEShLu8YuD/5ZgkRLwPRwowP2hC3VxTDvopHi4VFwMs6mrYiWZXMsuaY5lp
	nwqNa4tNpP0w3dHXMIs9N8yem10jSwavqz/C66CfnF4ARwdp43ryD/A7RD9u3D2Xw5gnv7RudxE
	RmQyEkNMRhZSZ6+a4xR2OFz2iXQyNp2bRJIw5lgi058VdIeCZ7XpM1DG0qid4ZYX4oP/cz2g84v
	6IJVF+nSOH3fGMgMVkm0QEijuwDscB6qn43kLwmVNO1/6/V3tddjjYbEpuzvaMdjRvgOzp9lgVc
	nQFjTvGtt7ortyWWw==
X-Received: by 2002:a05:6000:240b:b0:43e:a69b:d810 with SMTP id ffacd0b85a97d-45ea3df3f69mr2462925f8f.38.1779347932779;
        Thu, 21 May 2026 00:18:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e038:7e8a:7467:8c6c? ([2a01:e0a:106d:1080:e038:7e8a:7467:8c6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7d0a36sm544322f8f.2.2026.05.21.00.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 00:18:52 -0700 (PDT)
Message-ID: <f8273eaf-1eb5-4f9e-aca2-ebbe4bd2e361@linaro.org>
Date: Thu, 21 May 2026 09:18:51 +0200
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
 <0534f746-c776-4688-94d3-85a7d7f2d25e@linaro.org>
 <209f8a94-957f-4362-9e17-40e74eed4d7c@oss.qualcomm.com>
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
In-Reply-To: <209f8a94-957f-4362-9e17-40e74eed4d7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62404-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 8E8F95A004A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 17:47, Vikash Garodia wrote:
> 
> On 5/20/2026 9:09 PM, Neil Armstrong wrote:
>> On 5/20/26 17:30, Vikash Garodia wrote:
>>>
>>> On 5/18/2026 1:06 PM, Neil Armstrong wrote:
>>>> On 5/13/26 21:27, Vikash Garodia wrote:
>>>>>
>>>>>
>>>>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>>>>> The 10bit pixel format can be only used when the decoder identifies the
>>>>>> stream as decoding into 10bit pixel format buffers, so update the
>>>>>> find_format helper to filter the formats and only allow the proper
>>>>>> formats when setting or trying a capture format.
>>>>>>
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>>   drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
>>>>>>   drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++ ++ ++++
>>>>>>   2 files changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/iris/ iris_platform_common.h b/drivers/media/platform/qcom/iris/ iris_platform_common.h
>>>>>> index 5a489917580e..cd3509da4b75 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>> @@ -18,6 +18,7 @@ struct iris_inst;
>>>>>>   #define REGISTER_BIT_DEPTH(luma, chroma)    ((luma) << 16 | (chroma))
>>>>>>   #define BIT_DEPTH_8                REGISTER_BIT_DEPTH(8, 8)
>>>>>> +#define BIT_DEPTH_10                REGISTER_BIT_DEPTH(10, 10)
>>>>>>   #define CODED_FRAMES_PROGRESSIVE        0x0
>>>>>>   #define DEFAULT_MAX_HOST_BUF_COUNT        64
>>>>>>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT    256
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/ drivers/ media/platform/qcom/iris/iris_vdec.c
>>>>>> index eea69f937147..f4d9951ed04c 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>>>>> @@ -99,6 +99,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>>>>>       if (i == size || fmt[i].type != type)
>>>>>>           return NULL;
>>>>>> +    if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>>>>>> +        if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
>>>>>> +            inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
>>>>>> +            return NULL;
>>>>>> +
>>>>>> +        if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
>>>>>> +            inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
>>>>>> +            return NULL;
>>>>>> +    }
>>>>>
>>>>> similar logic would be now needed while enumerating fmt.
>>>>>
>>>>> VIDIOC_ENUM_FMT will now enumerate all capture formats (NV12, QC08C, QC10C..) regardless of the stream's bit depth, while VIDIOC_S_FMT will reject the wrong-depth formats.
>>>>>
>>>>> userspace will see formats via ENUM_FMT that it cannot successfully set with S_FMT.
>>>>
>>>> So initially I did that, but I reverted since it broke decoding with gstreamer when trying
>>>> to use QC10C since it requires negociating the src/sink before sending the fist buffer
>>>> and then get the source format change to switch to 10bit.
>>>
>>> Does that mean that src is still producing the data in Q10c, while sink is configured to NV12 (8bit) ?
>>
>> No, it's early src/sink negociation capabilities with the special DRM DMABUF format to handle the QC10c, way before playback starts and starts the v4l2 dance.
>>
> 
> How will it know its Q10c, even before the playback starts ?

So in the way upstream gstreamer wants to support QC8C/QC10C, the format must be specified like:
gst-launch-1.0 -v -m filesrc location=Big_Buck_Bunny_1080_10s_30MB.h265 ! h265parse !  v4l2h265dec ! "video/x-raw(memory:DMABuf), format=DMA_DRM, drm-format=NV12:0x0500000000000001" ! kmssink
or
gst-launch-1.0 -v -m filesrc location=Big_Buck_Bunny_1080_10s_30MB_main10.h265 ! h265parse !  v4l2h265dec ! "video/x-raw(memory:DMABuf), format=DMA_DRM, drm-format=P010:0x0500000000000001" ! kmssink

so this means the QC8C/QC10C format must be listed in the VIDIOC_ENUM_FMT so the v4l2h265dec element can enums them as supported (and translated as drm-format=NV12:0x0500000000000001/drm-format=P010:0x0500000000000001)

Neil

> 
>>>
>>>>
>>>> I checked and none of the other v4l2 drivers supporting 10bit does that, so it seems right
>>>> to allow enumerating all possibly supported formats and only accept the session supported
>>>> one with S_FMT.
>>>
>>> I was reading the documentation on this aspects, and it says to keep all the supported ones, instead of changing runtime and limit it to 10bit ones, in this case.
>>
>> Hmm, so my change is correct ?
> 
> Yes, to me.
> 
>>
>>>
>>> +ing Nico and Hans incase they would like to comment on this.
>>>
>>>>
>>>>>
>>>>>> +
>>>>>>       return &fmt[i];
>>>>>>   }
>>>>>>
>>>>>
>>>>> Regards,
>>>>> Vikash
>>>>>
>>>>
>>>
>>
> 


