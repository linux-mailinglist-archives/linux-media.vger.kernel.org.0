Return-Path: <linux-media+bounces-62958-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJwXHyJEGGoEiAgAu9opvQ
	(envelope-from <linux-media+bounces-62958-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 15:33:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D602A5F2C55
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 15:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EC213173924
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 13:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA313F410F;
	Thu, 28 May 2026 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eNAoGpRc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617953F4DCF
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974809; cv=none; b=FBkDfaAHohGBPqZS6S+tMnmLuwjOF1Rt7VZ3Yj13DOqWWf2AbmkGqNMAFxR2rL/NT55w6mY8J5ogfWzcWrWIPuwB/fRlUwWSodKMLIkgCHzyGXMT46sAbokvUIne6w6P1rVEOeS1rrkyfd6EeVx5FBx1ZaB4+Z3PlmFF7CuUp18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974809; c=relaxed/simple;
	bh=ZECEnHVkpwBXXqBG5VF9HeKNplqjJbGvJUGwL/valHc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=buLVTtXKRRHl3CIwl5ZheIHW+sjqxmGhJ3V3iK2KGJ6CYrN4iz+etgq6PVAmaVchi709g7SusuTl3Xc8GIKLqIyR0xitx+z21rHZd1rqUz9vd/f3ArByTYX7sszBuMV+SzZANGcoJuUCwiZAtohBZxoR3DDP0GWZqq8x4OBG3BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eNAoGpRc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so5767301f8f.1
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779974805; x=1780579605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07cGekjSMMRgi+j+3CPWjLKKZCOIFFGPCDT3OAaoCe0=;
        b=eNAoGpRcCmoC5hLS5LDWADSUgsRBUGuRmG+ha3pwKqHrd5cGyQQPYMRXstZ6Pvhs5R
         fVP/Iwy3McMiPle5ly7K1b+u3+yK2bi/E/eIFFXY26xnqPBoN0JIQt/92dPvSr/u88jY
         Hikv9ZnAcyQqg+0fS5JJVXrCtZ5VD+KXnwNuUdpd1125weeH2vnaNq0Lvd2Ue95Fk2Fg
         AXf6abxbkpB3No588FmmwQzyjRNqwVu2Qf0SEO1rpg0nvHXgCXqSy0AWnvtUR5+Lr0lJ
         C7gVvlaoK7/wW1vRH5LlLv0n0MZbNrAnWqcJhu15kiMtMgOpDCEhZ6ew0gzIaiih7W1R
         CCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974805; x=1780579605;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07cGekjSMMRgi+j+3CPWjLKKZCOIFFGPCDT3OAaoCe0=;
        b=gm0ZFH2JHqsaQqA4l16XvQkjIrqaoMAAAZrw8gF43JDJBRdCQdPDzPkX7vbywUciHY
         qpr7oI/GY0n644wG99KJ4wNn2C48iP1+QBgmRN7rYfMoOPf5j3cVGSU8BYv3aArDG8Na
         apdUUZCJC7rxSN8fcrfA6dHyIW5juOac3/t1Jlujzz/rAACYoxukNDi459xGsnFSiZUr
         oItbU3aGYLgfmjaiovaE36tHUPsDINONrcg7dssnkgK/fdNLlLnF1+hU5rp8G3S+FTxl
         TlOtrA2x/3/CwNdFXaqPH7scCal2QTLjOJwZPv/xhmH2GmTXOERW67GR50jK2y7q/OK+
         2XTQ==
X-Gm-Message-State: AOJu0Yw1ECxqXf11wh2W1y4lMHArc6GC01j/WC0wqpFRufqvoh6DMy04
	PKkZMojf1kxvZVWFNofeOKQX+h2424aepiTQbRt2+RYOrutASHpKEemnqYFfaEkwj0k=
X-Gm-Gg: Acq92OG9/4aLwb+b3W27APqETvoo+POawduz4j2WPsPOCpbjhFY0r7UGnDCl+cgfVg6
	1EwsnMb4sLbNZxBXIvrhUJKRDeeA/5cv30OUQgn8FcIpyXXMt9LM6M8IGYsivSvFmEbXFEp/SPS
	aEA4DBnZ8VOe78ga46PjjtSpNXuwyXM6V4mLo3tOYFRQPPm61cXcc6lbl9zkahNjJqyE9vf5sT0
	nPr7OISk4aCXmQSBC7jAN4LedOjdF4ULixj6SfMiKcU22FttDciHERiOMbbYSNMZhdV5KWaE+aR
	VXghWzTlKieg8wndI2rh0qmUBWUN0fTnjYRIl9M7KSyKEp+s5Tt5X9pGxALWP+6W9hXpabRfuI0
	PmcnwOK8LEyqiGc4DpawziAls/ZTNBBTA+tV6cxTO/T6c+codWMc0vTrrFfxF8c5WxLayoe7YOD
	yiJn8f4Gju5TqyOrNHxYmJbEJKXTinjnnNNPtCR7mAYWM=
X-Received: by 2002:a05:6000:4029:b0:45e:e9ac:42e8 with SMTP id ffacd0b85a97d-45ee9ac443bmr4094099f8f.18.1779974804420;
        Thu, 28 May 2026 06:26:44 -0700 (PDT)
Received: from [172.20.10.2] ([37.167.60.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb54a3c3sm14114139f8f.8.2026.05.28.06.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 06:26:43 -0700 (PDT)
Message-ID: <c54e7f34-b3a7-47fa-843a-9930de04599e@linaro.org>
Date: Thu, 28 May 2026 15:26:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
 <12102d68-da35-47ea-a972-28cb6d54ce1c@linaro.org>
 <feb42925-5704-4266-8c3f-aa944fdbed28@oss.qualcomm.com>
 <12da2953-fe51-4999-9656-2b42a7897f91@oss.qualcomm.com>
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
In-Reply-To: <12da2953-fe51-4999-9656-2b42a7897f91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62958-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,gitlab.freedesktop.org:url,msgid.link:url,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: D602A5F2C55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wangao,

On 5/27/26 06:15, Wangao Wang wrote:
> I tested the v4 patch using the gst command you provided earlier. The decoded output still has the previous plane misalignment issue, but all frames are decoded successfully. When viewing the raw data with an image player at 1920x1080 resolution, the first frame looks correct but subsequent frames appear shifted. If viewed at 1920x1088 resolution, there are artifacts at the bottom of each frame. I've attached the images.
> 
> Also, have you tested the 720p case? I can't get it to run on my end.

Thanks for the report but I don't have access to the Purwa platform you use,
I've run test with multiple resolutions with display using P010
and QC10, and ran fluster aswell and all passed on SM8550 and SM8650.

I'll test it on the Hamoa T14S I have which should be the closest to purwa,
but it uses the same driver setup as SM8550 so I expected it to work the same.

Could you indicate which iris firmware you're using ?

Could you try passing the fluster h265 main10 test suite with gstreamer ?

fluster download -c h.265
fluster run -d GStreamer-H.265-V4L2 -ts JCT-VC-HEVC_V1 -q -s -j1

The picture you send looks like there's a mismatch with the kernel
and firmware setup of planes offsets.
Could you check if there's a Purwa specific firmware property
to set for 10bit decoding ?

Neil

> 
> On 2026/5/26 20:45, Vikash Garodia wrote:
>>
>> On 5/26/2026 6:09 PM, Neil Armstrong wrote:
>>> On 5/26/26 09:53, Vikash Garodia wrote:
>>>>
>>>> On 5/21/2026 2:54 PM, Neil Armstrong wrote:
>>>>> This adds the plumbing to support decoding HEVC, VP9 and AV1
>>>>> streams into 10bit pixel formats, linear and compressed.
>>>>>
>>>>> This has only been tested on SM8550 & SM8650 with HEVC, and was
>>>>> inspired by Venus, DRM MSM and the downstream vidc driver for the
>>>>> buffer calculations and HFI messages.
>>>>>
>>>>> Gstreamer support for QC08 and QC10 need the MR at [1] to be applied,
>>>>> but NV12 and P010 works out of the box with mainline Gstreamer.
>>>>>
>>>>> Fluster HEVC results on SM8650 using Gstreamer:
>>>>>
>>>>> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 141/147
>>>>> The failing test case:
>>>>> - Pixel Format mismatch
>>>>>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
>>>>> - Unsupported resolution
>>>>>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>>>>>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>>>>>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>>>>>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
>>>>> - CRC mismatch
>>>>>   - RAP_A_docomo_6
>>>>>
>>>>
>>>> <snip>
>>>>
>>>>
>>>>>
>>>>> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
>>>>>
>>>>> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/ merge_requests/8195
>>>>>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>> Changes in v4:
>>>>> - Picked review tags
>>>>> - Use u32 instead of __u32
>>>>> - Explicit DPB
>>>>> - Drop NULL and use >>1 in q10c buffer calc
>>>>> - Drop selicolon after switch statementr
>>>>> - Correctly align HFI_PROP_UBWC_STRIDE_SCANLINE entry
>>>>
>>>> Its not very clear. Does this fix the issue reported here [1] ?
>>>>
>>>> https://lore.kernel.org/linux-media/fb377b11-c54c-4bd9-bf12- cf19d6484c66@oss.qualcomm.com/
>>>
>>> I wasn't able to reproduce the issue, and the reporter never answered my questions so far.
>>>
>>> Neil
>>
>> It would be nice to add the reviewers directly as well.
>>
>> adding Wangao now.
>>
>>>
>>>>
>>>>> - Rebase on media next tree after the file split
>>>>> - Link to v3: https://patch.msgid.link/20260511-topic-sm8x50- iris-10bit-decoding-v3-0-7fc049b93042@linaro.org
>>>>>
>>>>> Changes in v3:
>>>>> - Added review tag on patch 1
>>>>> - Limited stride command to AV1 decoding only
>>>>> - Link to v2: https://patch.msgid.link/20260417-topic-sm8x50- iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org
>>>>>
>>>>> Changes in v2:
>>>>> - Fixed bug breaking 8bit decoding
>>>>> - Dropped filtering on G_FMT while waiting for soure change
>>>>> - Dropped format filtering on ENUMFMT
>>>>> - Switched ALIGN(x, 192) to roundup(x, 192) because ALIGN works only with Power Of Two numbers
>>>>> - Cleaned and refactors the width/height/stride calculations
>>>>> - Cleaned and redesigned the buffer calculations functions with proper comments and var names
>>>>> - Passed fluster and v4l2-compliance to check for non regression
>>>>> - Tested on SM8550
>>>>> - Added missing V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 with made gstreamer fail decoding
>>>>> - Link to v1: https://patch.msgid.link/20260408-topic-sm8x50- iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org
>>>>>
>>>>> ---
>>>>> Neil Armstrong (6):
>>>>>        media: qcom: iris: add helpers for 8bit and 10bit formats
>>>>>        media: qcom: iris: add QC10C & P010 buffer size calculations
>>>>>        media: qcom: iris: gen2: add support for 10bit decoding
>>>>>        media: qcom: iris: vdec: update size and stride calculations for 10bit formats
>>>>>        media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
>>>>>        media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
>>>>>
>>>>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 195 +++++++++ + ++++++++++-
>>>>>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   8 +-
>>>>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  75 +++++++-
>>>>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
>>>>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  37 +++-
>>>>>   drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
>>>>>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>>>>>   drivers/media/platform/qcom/iris/iris_utils.c      |  16 +-
>>>>>   drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>>>>>   drivers/media/platform/qcom/iris/iris_vdec.c       |  42 ++++-
>>>>>   10 files changed, 364 insertions(+), 15 deletions(-)
>>>>> ---
>>>>> base-commit: 86693e86019a7466be961fd4f45d407cc0b0ba0a
>>>>> change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
>>>>>
>>>>> Best regards,
>>>>> -- 
>>>>> Neil Armstrong <neil.armstrong@linaro.org>
>>>>>
>>>>
>>>> Regards,
>>>> Vikash
>>>
>>
> 


