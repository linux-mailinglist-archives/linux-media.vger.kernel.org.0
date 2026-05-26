Return-Path: <linux-media+bounces-62788-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C5SHPaUFWpSWgcAu9opvQ
	(envelope-from <linux-media+bounces-62788-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:41:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B145D5AFE
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5843B304C2E3
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A563FA5E8;
	Tue, 26 May 2026 12:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y/XlPzPG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0231B3DDDBB
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799191; cv=none; b=DeQMtVOUKEe8AZqENDda4WBtIquR3U9gkQtPgPhuGm3c7nZzRKCbFjHHVuW1yykqppV+YXuto9GSUhVtRY7aGw0nzp5+VcOLXyVwok02/rx4WS0YYDAzFNcDFyl46h7MKR/36WNYpae1JcbW0rI/jwbW468qce2sRNdf1ken+ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799191; c=relaxed/simple;
	bh=nbnpJrXU2XIItSAMgtwBKBJhaWa7Z06/E2ER/pMzQFI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BlaPI2+vLYHVVpgAzY+Xfw7EK/IeIMZSoinY7tyS6HXgqOEkf0/PExOomdOKxfxSURT59gevURjvKkSjw8i8maZmCgPcoTryih+TT0GosRcv2qqLxE/yR0gEl012iZ6MioErNoVvRfpuKwsAk/qycnh9DkBfcx28EFR8bHdrjYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y/XlPzPG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso66041955e9.1
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 05:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779799188; x=1780403988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vxfHmTMup+cwFX0VWDsig/9oysSJkVAiKFCqvi+7+4=;
        b=y/XlPzPGjfyZkLbZVBKQkU4FdoD/c9nucwJUguO0NNuIbvbdVq1HWLnnbLKunCyGa4
         EUmVUOHqS3pDWdwPFBgeX01wmqYn9ekVelNpa1K/MunJ8Ttnpsrod6sp5vU5JCPWWdIY
         6ZHxAM3OjXr+DFC5cqlm4eiYYGzxtdneu2y+HKR4A85IYdDBCqeyi9Okth/1AkoH2t9c
         oGin+dwZQwyoEoODKSBXMyc7uXwkMb5nz5bQ1pdpC/fMkek/cSaKb/PbZGp7nuYyGodH
         bkwvgolNszc1eENo/hAqMAEYWU3jdEqGo7kB80C9RMgn+49kN0zpsoNF0yVxedB/030j
         lR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799188; x=1780403988;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vxfHmTMup+cwFX0VWDsig/9oysSJkVAiKFCqvi+7+4=;
        b=Bw97dm+Y8dcNJg1MWYDdXSXpE4T1/Hszltgc4rWVfIvRmwjTugghUwJwXSh1g4CyqV
         BRSwjWBPNe3OGzVtuZcJ/3/U1mVwCJK189e7vNJ37GeghmDgBweby/4j0+0g9OBOpvUs
         fUetiRuM+WVHdF1oR+39yrOW1baK9pYCnu/RCitwrTOroNSSBnmzr+ZaIfBaKGYUlata
         AqBjN0h4dh3q8opulDdSitI4pgu6KfwE+u9PPnVthf1UvP9jUFgSHrx5vjACfoHaTxg6
         RneL+8C9QoezHSyvuMyMLTQ2jGsf3Z6IvYP8jT1NH72gb0aC57p2dDW/Cd2jECMKIs9g
         SErQ==
X-Gm-Message-State: AOJu0YxoMVKEXrjYLFoJFjQiRQmrEEFWBGbWhn0DyWrpFnzDkHZb1EMP
	ezahS873hhEG5+MwbtZtDM3jhHmbgaKdzw4CXuo/JpEDC8+UIeyeqL3LQRE/BXACbt4=
X-Gm-Gg: Acq92OE6Y4etet9Gwr6Y0AIqZIwZEG7KH11ECwb4uUW9AFQYnx9PxYQokmwinctr/E3
	7pbZZ06YLaqe6Eu9WByPARTS8XurxFKcU2hIKNu+TUDv+Lv2Myv9eS/rUVyV6tRBm4BYKOhQJmX
	U6Hts+uwgNqHQl2DeVRqGzG3k5wCr7yj77GOnaC4LQCt4w3XMzECd4F+usjKismDZ0Xl1erBgHJ
	OJWwHEzThzwligyTbSEaOtQh1xAKqVWrLDA7NIQeeFgD9mqoy9U57F2KClkJ6wJ+wf8GPxp2Pad
	eMkuMGWH5BnMAFN2OzwFDfgs2rCK/Bdsdkt26n5t7a5N4pPzKnl37rr+e7MrsZEx8hm2gw7ACk6
	Qf45fkQRrWp1BUkX1fRZbkvt5RgnmnNDN2BPzk1UYUnw2uBaNL+e9pSpnF0/hxfb9zwqP3+2m2B
	/VODVmhQRGtCWgYhePO3Nj72uIJ5+xAuemA7P6ZNzUBmU8vICTHQqQc4INOaiKsInFpcAiyNvvX
	romG34=
X-Received: by 2002:a05:600c:a402:b0:48f:d1c0:721e with SMTP id 5b1f17b1804b1-490426b294amr210882135e9.12.1779799187805;
        Tue, 26 May 2026 05:39:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e83e:a0d0:39e4:2d25? ([2a01:e0a:106d:1080:e83e:a0d0:39e4:2d25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49049093822sm133096535e9.0.2026.05.26.05.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:39:47 -0700 (PDT)
Message-ID: <12102d68-da35-47ea-a972-28cb6d54ce1c@linaro.org>
Date: Tue, 26 May 2026 14:39:46 +0200
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
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
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
In-Reply-To: <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-62788-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim,gitlab.freedesktop.org:url];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: C5B145D5AFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/26/26 09:53, Vikash Garodia wrote:
> 
> On 5/21/2026 2:54 PM, Neil Armstrong wrote:
>> This adds the plumbing to support decoding HEVC, VP9 and AV1
>> streams into 10bit pixel formats, linear and compressed.
>>
>> This has only been tested on SM8550 & SM8650 with HEVC, and was
>> inspired by Venus, DRM MSM and the downstream vidc driver for the
>> buffer calculations and HFI messages.
>>
>> Gstreamer support for QC08 and QC10 need the MR at [1] to be applied,
>> but NV12 and P010 works out of the box with mainline Gstreamer.
>>
>> Fluster HEVC results on SM8650 using Gstreamer:
>>
>> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 141/147
>> The failing test case:
>> - Pixel Format mismatch
>>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
>> - Unsupported resolution
>>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
>> - CRC mismatch
>>   - RAP_A_docomo_6
>>
> 
> <snip>
> 
> 
>>
>> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
>>
>> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Changes in v4:
>> - Picked review tags
>> - Use u32 instead of __u32
>> - Explicit DPB
>> - Drop NULL and use >>1 in q10c buffer calc
>> - Drop selicolon after switch statementr
>> - Correctly align HFI_PROP_UBWC_STRIDE_SCANLINE entry
> 
> Its not very clear. Does this fix the issue reported here [1] ?
> 
> https://lore.kernel.org/linux-media/fb377b11-c54c-4bd9-bf12-cf19d6484c66@oss.qualcomm.com/

I wasn't able to reproduce the issue, and the reporter never answered my questions so far.

Neil

> 
>> - Rebase on media next tree after the file split
>> - Link to v3: https://patch.msgid.link/20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org
>>
>> Changes in v3:
>> - Added review tag on patch 1
>> - Limited stride command to AV1 decoding only
>> - Link to v2: https://patch.msgid.link/20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org
>>
>> Changes in v2:
>> - Fixed bug breaking 8bit decoding
>> - Dropped filtering on G_FMT while waiting for soure change
>> - Dropped format filtering on ENUMFMT
>> - Switched ALIGN(x, 192) to roundup(x, 192) because ALIGN works only with Power Of Two numbers
>> - Cleaned and refactors the width/height/stride calculations
>> - Cleaned and redesigned the buffer calculations functions with proper comments and var names
>> - Passed fluster and v4l2-compliance to check for non regression
>> - Tested on SM8550
>> - Added missing V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 with made gstreamer fail decoding
>> - Link to v1: https://patch.msgid.link/20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org
>>
>> ---
>> Neil Armstrong (6):
>>        media: qcom: iris: add helpers for 8bit and 10bit formats
>>        media: qcom: iris: add QC10C & P010 buffer size calculations
>>        media: qcom: iris: gen2: add support for 10bit decoding
>>        media: qcom: iris: vdec: update size and stride calculations for 10bit formats
>>        media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
>>        media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
>>
>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 195 ++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   8 +-
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  75 +++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  37 +++-
>>   drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
>>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>>   drivers/media/platform/qcom/iris/iris_utils.c      |  16 +-
>>   drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>>   drivers/media/platform/qcom/iris/iris_vdec.c       |  42 ++++-
>>   10 files changed, 364 insertions(+), 15 deletions(-)
>> ---
>> base-commit: 86693e86019a7466be961fd4f45d407cc0b0ba0a
>> change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
>>
>> Best regards,
>> -- 
>> Neil Armstrong <neil.armstrong@linaro.org>
>>
> 
> Regards,
> Vikash


