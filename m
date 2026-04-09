Return-Path: <linux-media+bounces-58310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC+iE9RY12lqMwgAu9opvQ
	(envelope-from <linux-media+bounces-58310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:44:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B059F3C72FF
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7144A3030B1D
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 07:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D6237F75B;
	Thu,  9 Apr 2026 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p730qma9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54437B40B
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720592; cv=none; b=CB0/1leOJXMGPJKu+5Jxh1u3RlDTwSz3FlCHJup67sEpr5dFNj59exwKYZu2Qeei1OZeu/iSzPzMXi9SybD9rg8VX6T+G25BoS6JJYbyCQoCzZRhm4MKeD9eLQbwNqOY1LweMawxcQPtkZu+2TBkxQnCoPBh9S1brgnoptxXPU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720592; c=relaxed/simple;
	bh=p15WCfIkJ4SuEu8l36dZ0rdpBrY1geE7hTvdbwzRuog=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tI9PxO0OB+kF3NQAGGiL0JO0rtJ8Ji6iun6tjMHw1siM9aYIsBCEzm3XBQswe+pMeBNTX5dM6fevoOi8Ns2krfyMnc7wWqkfVc6tyvGyt5+W6xrQEjHh0afaWS5Z8yShbXgIxoSKacn8u0tQlIqs7AWc/1HM/2kzlWl24oLNk6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p730qma9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483487335c2so5673175e9.2
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 00:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775720589; x=1776325389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4vfOVI2lZlL/h4O6xl86sUjxxrqaTqlcGZT6I0Ul4I=;
        b=p730qma93HiWUROiqyzh1t/JxqNoePaQB9CwXS/9VRfmCJZWmF/s6nOxGJgMqWx/PP
         ugBPj7SPRIh+LsrnTeAVWQ3IrdePIG5GAPHMI29UYkwGIYWZQnT7zhEalJdyBNKJBuLB
         X51+rA0LJFRlDncpgLGHKaVq2OR+QraCk0rFD2a/qbIMWw0f/vcYU8rOpN8taZ1B9+ev
         2cpLNOaG8F0UiU/6Cb0GtvJswGg5XVB6EvhRNRW5R90AWQGxE4LuQd+jUEJe25+e4MSe
         /RmhbnDyXKb1UvbHNqWnrtdxgDJ2Z370aBbGP+oWoFv3Il/nGZZhIANW5lwDq2X/AfmG
         94+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720589; x=1776325389;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4vfOVI2lZlL/h4O6xl86sUjxxrqaTqlcGZT6I0Ul4I=;
        b=hGteZ/AwHUBwMoN/wUj6BjO3eMu5SvDOJ0sjsGwmnIXzfXp7OaeLk2RN0X14oIhaMa
         5BXTgOtv8U6x1INgvdF7irnVCtQa8KN+gCaTt+dausmZIDyjNuHDxcTdtSOrttAb0B8v
         chyf7N5n3abiLXw/hLj3hh9UuQT7N0BlEvVCeUxk2hWaOA7LRmFxcoEXMz6yHs12C8hr
         twtEk5qYt3t8QsxLJXaYBe1IZvr3cvH2vZwxnEqvoCVWnuNRCR8ko8TP7BI94yaDGxQP
         nqtOsQBVb9Utw+/5KtDLZ3787tc6VO3uVm54aG2CFQqHCEeId5ZRdpvTg2ofScbVQQ4p
         Kegw==
X-Forwarded-Encrypted: i=1; AJvYcCWki6J5rEHC1ktf25XGDtgb4zfx2J4mGbqpLZvavBI90lqj95EZ5WxGwc5WtoVmSwW2C64Hj5nfUMtB9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDqkR5tw1XQqTZwnvnKr7LXsIxygy+FFvIwGKhMJq0ZdKRQSeh
	jBlMHgFIZT8yI0cpjn/V7GMlXDbjkB36jbBWXJvBV5OMzZweuv+V010Kn1EMmq4tfxY=
X-Gm-Gg: AeBDieuKwG5M0edjxCexuiXwW/gCzry0sGzDjnduT79ZQ9no13l4MwzukqJAQjxR6j9
	FKQ1TlT1EhpJEDvUe4eg+DcuXAx4dEPI0MkXRKYlRIg/t1A4y3m0Hecxxm28NNzvvePwv7NOJIl
	Ne6BBBF/IMzL55ipf3d/T0JSbJ+y9Yt3/l/y6enp65kKSrIU4WMcsEWmrTmQh3btogmg2nA44I8
	EpU5SqhDP0QWjiAPdbl1fREB3OZAYffEILs1sQl7Ax/ruBFlH+WYh3CDG3v0UAC0iTm9sHtNG0V
	2FT/q+dnFq8M2bBeMi7KYluGDqXGsJNkUOhOR01088nh1/c6reDxAK+PW3iiiv0dbhFVd01f3iE
	5fxuS2lSx2Z+L9g9Lqg7RpGtd9BMbBtn2OrtqMInU6S2u6X4zV+bSjoRqblroEYAfzHjGHWle9A
	Nqeg1GI6nET/mGs76vrNM+scbhgAdNXH1mN4CQQ3QBxXhURVb4LiuMmuqW/VzeGuzT2gOWHQDDf
	CDqtyQ=
X-Received: by 2002:a05:600c:630a:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-488998e3cbemr338436225e9.30.1775720589094;
        Thu, 09 Apr 2026 00:43:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:70d5:8219:5bd4:e213? ([2a01:e0a:106d:1080:70d5:8219:5bd4:e213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cfa5d118sm34101905e9.11.2026.04.09.00.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 00:43:08 -0700 (PDT)
Message-ID: <5ceff68e-f636-40d3-a189-8ead1be936c1@linaro.org>
Date: Thu, 9 Apr 2026 09:43:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 0/7] media: qcom: iris: add support for decoding 10bit
 formats
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <b4uqpepf6caojxe463izkmnrlayrdrgce6jusak33ewcr5yd4w@ukwbo7zfphn2>
 <454f0f277cbaee5774c25d34a33fc3bc478fa756.camel@ndufresne.ca>
 <mdsl5mcgk734p2ypfdeete3ggfnmwizvbl2mulkxeoupm4kqz6@4z544eijvmqw>
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
In-Reply-To: <mdsl5mcgk734p2ypfdeete3ggfnmwizvbl2mulkxeoupm4kqz6@4z544eijvmqw>
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
	TAGGED_FROM(0.00)[bounces-58310-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:replyto,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: B059F3C72FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 03:40, Dmitry Baryshkov wrote:
> On Wed, Apr 08, 2026 at 09:04:02PM -0400, Nicolas Dufresne wrote:
>> Hi,
>>
>> Le jeudi 09 avril 2026 à 03:02 +0300, Dmitry Baryshkov a écrit :
>>> On Wed, Apr 08, 2026 at 06:43:53PM +0200, Neil Armstrong wrote:
>>>> This adds the plumbing to support decoding HEVC and AV1
>>>> streams into 10bit pixel formats, linear and compressed.
>>>>
>>>> This has only been tested on SM8650 with HEVC, and was inspired by
>>>> Venus and the downstream vidc driver for the buffer
>>>> calculations and HFI messages.
>>>>
>>>> I was unable to get 10bit decoding working with Gstreamer
>>>> and ffmpeg, but v4l2-ctl works with:
>>>
>>> Any particular errors? I assume Gstreamer needs to be taught about
>>> Q10C. But P010 should (hopefully) work.
>>
>> P010 should work for both Gst and FFMPEG, its probably a user error, or there is
>> a hidden bug in the driver that make it fail, v4l2-ctl is very permissive as it
>> simply dump to disk. You should provide an updated fluster score, so you have to
>> use one of these.
>>
>> For Q10C on GStreamer, it needs mapping [0] and you need some bugfix [1] and
>> another that I will be sending tomorrow. We had never tested video compression
>> with this module before.
>>
>> [0] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195
>> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/11222
>>
>> The last issue has to do with:
>> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/38965e2d9c1119674a65dc437ee7e8ec95339f31/subprojects/gst-plugins-good/sys/v4l2/gstv4l2object.c#L4378
>>
>> V4L2 format gives us the number of allocation, but not really the number of
>> planes, and we forgot to initialize that number for the "opaque" format case. A
>> tempory fix might be to add this after S_FMT:
>>
>> if (GST_VIDEO_INFO_FORMAT (&info.vinfo) == GST_VIDEO_FORMAT_DMA_DRM)
>>    n_v4l_planes = format.fmt.pix_mp.num_planes;
>>
>> Works for AFBC and QC at leat, since both are unambiguously single plane, and so
>> cannot have mplane variants.
> 
> Reading this made me realize another suggestion for Neil:
> 
> Please check that the data returned by Iris matches the display driver
> expectations. See the comments in the _dpu_format_populate_addrs_ubwc().

I just checked and they match as I already checked against the venus driver already,
which shares the same calculation scheme.

I had to add the HFI_PROP_UBWC_STRIDE_SCANLINE command otherwise the firmware
would give other alignments and wouldn't display properly with some streams.

Neil

> 
>>
>> Let me know how far you get! Please be aware that Robert and I are making these
>> patches based on feedback, we don't have access to any boards capable of
>> decoding to QC compressed formats.
>>
>>>
>>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
>>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
>>>>
>>>> The non-10bit decoding still works as before.
>>>>
>>>> With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
>>>> and tranformed in v4l2 header format with [1]:
>>>> ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
>>>> /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
>>>>
>>>> The frames correctness has been verified buy displaying them
>>>> via Vulkan DMA_BUF import, including QC10C and QC08C.
>>
>> In GStreamer, once the video4linux plugin issues are fixed, you should be able
>> to display the frames using glimagesink. GL only allow for RGB render, which
>> damages the data, so its not good enough for conformance testing with
>> compression enabled, but usually just doing visual inspection is acceptable.
> 
> Nice! Looking forward to testing Q08C aka NV12-UBWC on the display.
> Maybe I should try rebuilding the plugins with the mentioned patches and
> provide my r-b or report issues there.
> 
> 


