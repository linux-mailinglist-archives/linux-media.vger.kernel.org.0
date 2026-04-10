Return-Path: <linux-media+bounces-58544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKFRAeXm2GmmjggAu9opvQ
	(envelope-from <linux-media+bounces-58544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:02:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 362C53D67F4
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6866301327A
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD783B9618;
	Fri, 10 Apr 2026 12:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FrMxcBy7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ABD38D6B8
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775822417; cv=none; b=l9TD9RLSch66o+W4bYa22nE3PIGvvsFLO5gKWNdwgRDn8MTRIDIM5oovB45i18ipz/L5P3RRjmC0KxU/RiQ7dvCEydozHkWWWvYYGTxTr25FSQ/lteKSc3ZTPONt1sdlrDQ9+DwucCSMv+sMgHNcy8XBYLbcjRXMkKydbIuOTTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775822417; c=relaxed/simple;
	bh=PmJBO0Q8ADqka6NrotXOAw9bG5IjdAVJP1ar59SLAho=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=n0GGYlUjJeR1DsnrrUC4LLe4lt4HDJp9f4s8rjsDD6nS4q8EtOxdt4ifgX19EETuOfydFsB0MwLpR575Rehr95GShj3bWOyPWZWYqWlkmfOpYnZ3JghIi2uElpe2EhTzITRszfZEr0M715WW0v9eqvxqGayYI08slGi/mpxexSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FrMxcBy7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b8efed61so17255345e9.1
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 05:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775822414; x=1776427214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83mE7heIrqr7d0P4hUAqEE3g8GDUV5UsH51SSsEBXFA=;
        b=FrMxcBy7PJMg6upxcd5uYDtC+CAeg4dziduZl1N1IESgrrkvKBpEnSEUBbEAgl71SO
         K/ZzN7Oafjph4I97yibQoCtYfBIdkRNHTLq74xWivlig1O3ZCt02c3GmhTCD58VrYTXk
         RIpHjkxrkneiEzmGfTg2e/LnGcm7Q52Fm25b0LHs8JdYSDUpl6t1wAahnhlBLk1ZA0c9
         bgloEIEtpkiWUOzJBjQBzRkS/3u7BbWh+j0lbkQDq63dlFkLBsLYhdZRMVjDaB9LXYuJ
         Qg1AnPCFt6K//kK+h5k54Fu978x4B0fcMR6o+hXeIOFMCmKsDPHQNlmPxFtPK8H6q7L5
         gR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775822414; x=1776427214;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83mE7heIrqr7d0P4hUAqEE3g8GDUV5UsH51SSsEBXFA=;
        b=olmgu4IUyN30J7QwGXbSFhwBaSE19e3jkXBsfFsyOPCTi6YOdIeQZMJfWScmF4wxys
         YMpumKOE2Q1pVn6Hx+7Q+TwjmJwyKxEVsZCoFZUm4XtScXIxvMQvNlKEy6uQSxzE90Yo
         KFblUMctKZgAURD0u/VkZoWWNwUdStBxbVhHJ23z09WKstFOOwX3o1mIo05vbPeLD69+
         XuLBN5agLfaabS6UxYuR9TOiK/Oqrr9yOEHjnv9JEwt8gYDLGDestk57vXDgRrVE3dRg
         UXMl6bh8u6MSuHLek4AQ0IxCLwENmmdlKv7JCY7y+2yKHq5H5R/GfpRD62kieE/FVQQ2
         MPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLwsxs0/BmpqecDy3w2BM+tfu+XMabArQ/Y775yfo7p1eDhyjbgfo/t8mFgSfGwwDq5633A3a09flCgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEOq4jzHKcexZkutfDM6L60jCrcCrH8mOFW/UyW2fsp92hcTqy
	VSu+PTrBZw7UHY48THUAZVfiYVtWIpAJoCbdKYj6nFfNMLmHJIKSQFb6itcXetP+Bqo=
X-Gm-Gg: AeBDiesjGRhshkT6NaoF1/OuJDlXiLnFOlYiJ9bZhxTQ4eHMOkbxNrMbJRGnzj02rlE
	G06BIlujfhgvCZPG1NLL2cnBoZWqboQXiwXRYoxV12IelcG71RJkah2HcnmhpF+J7Q+ZTA1Deqe
	qUILXc9W2CxZqQyEtJA/Cu9oWtkvCeTjvsK1Fr58rPb1M3bWg/NjS4IZ41nr1NcAi78O80jRHLa
	y9TdWFfaTigTDzbwhGZmnPXIdpsF8KnSAWB/R66xF+rkUox3xxWT0YsdyfbiKFiWYOnindnpnt1
	8Ti4RLBKmhH5nrBMoe/0NcQlBwlOi0Q+tTaLHdFQQOSZyXWNQh2+07S0CNOwo9C72IFQNRGEKRw
	0PbrEG5V9IeLGG2VeC2JJGhqCqIFU9nKFp0HyElu0OtM96mL3QqYLbS09xtg6X9YmikAI9WGert
	6wmwFRIiNmUjKgCCJ4OepSskDp7R+ltqCRDv4V/ifS6OU+NxoDYpCMBjtwgktpDwSL+oSzT2BaL
	G2W20c=
X-Received: by 2002:a05:600c:154d:b0:485:3989:b3e4 with SMTP id 5b1f17b1804b1-488d685b6ddmr32921265e9.6.1775822412250;
        Fri, 10 Apr 2026 05:00:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:66bc:1b4e:df7c:7dff? ([2a01:e0a:106d:1080:66bc:1b4e:df7c:7dff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm20187255e9.10.2026.04.10.05.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 05:00:11 -0700 (PDT)
Message-ID: <43378eb2-8976-49fe-add6-c691d78c0ec6@linaro.org>
Date: Fri, 10 Apr 2026 14:00:10 +0200
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
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <b4uqpepf6caojxe463izkmnrlayrdrgce6jusak33ewcr5yd4w@ukwbo7zfphn2>
 <454f0f277cbaee5774c25d34a33fc3bc478fa756.camel@ndufresne.ca>
 <f9edc172-c26a-4fa1-bca2-425e74bcd90b@linaro.org>
 <353933d7dc0821de180db2a8bae4b0d309ed4c25.camel@ndufresne.ca>
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
In-Reply-To: <353933d7dc0821de180db2a8bae4b0d309ed4c25.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58544-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url];
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
X-Rspamd-Queue-Id: 362C53D67F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 15:19, Nicolas Dufresne wrote:
> Le jeudi 09 avril 2026 à 09:36 +0200, Neil Armstrong a écrit :
>> Hi,
>>
>> On 4/9/26 03:04, Nicolas Dufresne wrote:
>>> Hi,
>>>
>>> Le jeudi 09 avril 2026 à 03:02 +0300, Dmitry Baryshkov a écrit :
>>>> On Wed, Apr 08, 2026 at 06:43:53PM +0200, Neil Armstrong wrote:
>>>>> This adds the plumbing to support decoding HEVC and AV1
>>>>> streams into 10bit pixel formats, linear and compressed.
>>>>>
>>>>> This has only been tested on SM8650 with HEVC, and was inspired by
>>>>> Venus and the downstream vidc driver for the buffer
>>>>> calculations and HFI messages.
>>>>>
>>>>> I was unable to get 10bit decoding working with Gstreamer
>>>>> and ffmpeg, but v4l2-ctl works with:
>>>>
>>>> Any particular errors? I assume Gstreamer needs to be taught about
>>>> Q10C. But P010 should (hopefully) work.
>>>
>>> P010 should work for both Gst and FFMPEG, its probably a user error, or there is
>>> a hidden bug in the driver that make it fail, v4l2-ctl is very permissive as it
>>> simply dump to disk. You should provide an updated fluster score, so you have to
>>> use one of these.
>>
>> I did run fluster and all main10 fails with Gstreamer and FFmpeg, I tried to manually
>> run the gst and ffmpeg commands with v4l2-tracer and logs but I can't explain the reason,
>> all returns from the driver seems valid but somehow they just error out with:
>>
>> FFmpeg:
>> $ ffmpeg -c:v hevc_v4l2m2m -i Big_Buck_Bunny_1080_10s_30MB_main10.h265 -y -f null -
>> ...
>> [hevc_v4l2m2m @ 0x55c0328aa0] Using device /dev/video-dec0
>> [hevc_v4l2m2m @ 0x55c0328aa0] driver 'iris_driver' on card 'iris_decoder' in mplane mode
>> [hevc_v4l2m2m @ 0x55c0328aa0] requesting formats: output=HEVC/none capture=NV12/yuv420p10le
>> ...
>> [hevc_v4l2m2m @ 0x55c0328aa0] An invalid frame was output by a decoder. This is a bug, please report it.
>> [vist#0:0/hevc @ 0x55c02dc9b0] [dec:hevc_v4l2m2m @ 0x55c029d510] Decoding error: Internal bug, should not have happened
>>
> 
> This one needs further investigation for sure. This error can be various things,
> and it requires going up to the v4l2 code to figure-out:
> 
> 
> Case 1:
>      if (!frame->buf[0] || frame->format < 0)
>          goto fail;
> 
> Case 2
>          if (frame->width <= 0 || frame->height <= 0)
>              goto fail;
> 
> But a quick look lead me to think it case 1 (frame->format < 0) since I don't
> see P010 in the format map in ./libavcodec/v4l2_fmt.c (at least in mainline).
> Its also missing support for any opaque format, in fact I believe the DMABuf/DRM
> context is only in LibreELEC fork. But overall, it points toward ffmpeg for this
> error so far.

Yeah I didn't find any ffmpeg for with P010 supported...

> 
> 
>> The v4l2 trace shows a normal sequence with the driver returning P010 as G_FMT after the source change event,
>> and the capture planes dequeued but for an unknown reason the buffer is rejected by ffmpeg.
>>
>> Gst:
>> $ gst-launch-1.0 -v -m filesrc location=Big_Buck_Bunny_1080_10s_30MB_main10.h265 ! h265parse !  v4l2h265dec ! tee ! fakevideosink
>> Setting pipeline to PAUSED ...
>> Pipeline is PREROLLING ...
>> ...
>> Got message #37 from element "h265parse0" (latency): no message details
>> ERROR: from element /GstPipeline:pipeline0/GstH265Parse:h265parse0: Internal data stream error.
>> Redistribute latency...
>> Additional debug info:
>> ../gstreamer/subprojects/gstreamer/libs/gst/base/gstbaseparse.c(3702): gst_base_parse_loop (): /GstPipeline:pipeline0/GstH265Parse:h265parse0:
>> streaming stopped, reason not-negotiated (-4)
>> Got message #39 from pad "h265parse0:src" (property-notify): ERROR: pipeline doesn't want to preroll.
>> GstMessagePropertyNotify, property-name=(string)caps, property-value=(GstCaps)"video/x-h265\,\ width\=\(int\)1920\,\ height\=\(int\)1080\,\ framerate\=\(fraction\)30/1\,\ chroma-format\=\(string\)4:2:0\,\ bit-depth-luma\=\(uint\)10\,\ bit-depth-chroma\=\(uint\)10\,\ parsed\=\(boolean\)true\,\ stream-format\=\(string\)byte-stream\,\ alignment\=\(string\)au\,\ pixel-aspect-ratio\=\(fraction\)1/1\,\ profile\=\(string\)main-10\,\ tier\=\(string\)main\,\ level\=\(string\)4";
>> /GstPipeline:pipeline0/GstH265Parse:h265parse0.GstPad:src: caps = video/x-h265, width=(int)1920, height=(int)1080, framerate=(fraction)30/1, chroma-format=(string)4:2:0, bit-depth-luma=(uint)10, bit-depth-chroma=(uint)10, parsed=(boolean)true, stream-format=(string)byte-stream, alignment=(string)au, pixel-aspect-ratio=(fraction)1/1, profile=(string)main-10, tier=(string)main, level=(string)4
>> ...
> 
> There is not a lot of details here, but I would start looking into
> V4L2_CID_MPEG_VIDEO_HEVC_PROFILE and V4L2_CID_MPEG_VIDEO_HEVC_LEVEL
> implementation. GStreamer (and Chromium too) will refuse to use a decoder that
> does not advertise the supported profile (though I see there is code for that,
> maybe its just some bug).
> 
>>
>> In this case OUTPUT is not STREAMON and no OUTPUT buffers are queued, so I wonder why this one fails....
>>
>> My gstreamer and ffmpeg foo is bad and I probably missed something obvious...
>>
>>
> You may get a different hint with more traces, just enabling general warnings:
> 
>    export GST_DEBUG=2
> 
> Or the full V4L2 traces too:
> 
>    export GST_DEBUG="v4l2*:7,2"
> 
> 
> I'm sure its just a bug (or two). Happy to help to find it.

You were right, this did the trick:
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index a9cdd93e77fd..debdd30a751e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -56,9 +56,10 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
         {
                 .cap_id = PROFILE_HEVC,
                 .min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-               .max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+               .max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
                 .step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
-                               BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+                               BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
+                               BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
                 .value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
                 .hfi_id = HFI_PROP_PROFILE,
                 .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,

But the gstreamer I'm using is too old and doesn't support P010... updating but it should work now,
and I'll test the QC10 in the same time.

Neil

> 
>>
>>>
>>> For Q10C on GStreamer, it needs mapping [0] and you need some bugfix [1] and
>>> another that I will be sending tomorrow. We had never tested video compression
>>> with this module before.
>>>
>>> [0] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195
>>> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/11222
>>>
>>> The last issue has to do with:
>>> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/38965e2d9c1119674a65dc437ee7e8ec95339f31/subprojects/gst-plugins-good/sys/v4l2/gstv4l2object.c#L4378
>>>
>>> V4L2 format gives us the number of allocation, but not really the number of
>>> planes, and we forgot to initialize that number for the "opaque" format case. A
>>> tempory fix might be to add this after S_FMT:
>>>
>>> if (GST_VIDEO_INFO_FORMAT (&info.vinfo) == GST_VIDEO_FORMAT_DMA_DRM)
>>>     n_v4l_planes = format.fmt.pix_mp.num_planes;
>>>
>>> Works for AFBC and QC at leat, since both are unambiguously single plane, and so
>>> cannot have mplane variants.
>>
>> I'll definitely try that ! thanks for the pointers !
>>
>>>
>>> Let me know how far you get! Please be aware that Robert and I are making these
>>> patches based on feedback, we don't have access to any boards capable of
>>> decoding to QC compressed formats.
>>>
>>>>
>>>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
>>>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
>>>>>
>>>>> The non-10bit decoding still works as before.
>>>>>
>>>>> With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
>>>>> and tranformed in v4l2 header format with [1]:
>>>>> ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
>>>>> /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
>>>>>
>>>>> The frames correctness has been verified buy displaying them
>>>>> via Vulkan DMA_BUF import, including QC10C and QC08C.
>>>
>>> In GStreamer, once the video4linux plugin issues are fixed, you should be able
>>> to display the frames using glimagesink. GL only allow for RGB render, which
>>> damages the data, so its not good enough for conformance testing with
>>> compression enabled, but usually just doing visual inspection is acceptable.
>>>
>>>>>
>>>>> The support is probably incomplete for other platforms and
>>>>> I'm unsure what's required to conform to the V4L2 M2M stateless
>>>>
>>>> stateful
>>>>
>>>>> spec, especially since AFAIK the decoder doesn't support
>>>>> decoding 10bit streams in 8bit pixel format, thus the RFC state.
>>>>> Review is welcome !
>>>
>>> Why would your decoder need to support decoding 10bit into 8bit ? This is quite
>>> rare and its only possible with post-processed capture buffer.
>>
>> Yeah it's just a note, the Amlogic one supported outputing main10 in NV12 but
>> only supported 10bit in their compressed format.
>>
> 
> Ack. There is a lot of variation with various hardware for sure. The Allwinner
> stateless one swallow the extra 2bit plane (since they do some funky NV12 + two
> more planes for the missing 2bits, and that's complicate as a format hehe).
> 
> 
> cheers,
> Nicolas
> 
>>
>>>
>>>>>
>>>>> [1] https://github.com/superna9999/pyv4l2compliance
>>>>>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>> Neil Armstrong (7):
>>>>>         media: qcom: iris: add QC10C & P010 buffer size calculations
>>>>>         media: qcom: iris: gen2: add support for 10bit decoding
>>>>>         media: qcom: iris: add helpers for 8bit and 10bit formats
>>>>>         media: qcom: iris: vdec: update size and stride calculations for 10bit formats
>>>>>         media: qcom: iris: vdec: forbid g_fmt while waiting for first source change
>>>
>>> The is suspicious, it should just send the previous state until you get the
>>> event. Typical use case is for application to set a format based on bitstream
>>> parsing, and use that as a guess to try and pre-allocate the buffers. I don't
>>> usually review iris code, but I'll give that series some more eyes in the coming
>>> days.
>>
>> Yeah I wasn't sure, venus does that, same as the vendor driver so I thought it would
>> be good but I'm probably mistaken.
>>
>>>
>>> cheers,
>>> Nicolas
>>
>> Thanks!
>> Neil
>>
>>>
>>>>>         media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
>>>>>         media: qcom: iris: vdec: allow decoding into 10bit format
>>>>>
>>>>>    drivers/media/platform/qcom/iris/iris_buffer.c     | 81 +++++++++++++++++++++-
>>>>>    .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71 ++++++++++++++++++-
>>>>>    .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>>>    .../platform/qcom/iris/iris_hfi_gen2_response.c    | 35 ++++++++--
>>>>>    drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>>>>>    .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>>>>    .../media/platform/qcom/iris/iris_platform_gen2.c  |  3 +-
>>>>>    drivers/media/platform/qcom/iris/iris_state.c      |  6 ++
>>>>>    drivers/media/platform/qcom/iris/iris_state.h      |  1 +
>>>>>    drivers/media/platform/qcom/iris/iris_utils.c      | 16 ++++-
>>>>>    drivers/media/platform/qcom/iris/iris_utils.h      |  2 +
>>>>>    drivers/media/platform/qcom/iris/iris_vdec.c       | 70 +++++++++++++++++--
>>>>>    drivers/media/platform/qcom/iris/iris_vidc.c       | 14 +++-
>>>>>    13 files changed, 285 insertions(+), 18 deletions(-)
>>>>> ---
>>>>> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
>>>>> change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
>>>>>
>>>>> Best regards,
>>>>> --
>>>>> Neil Armstrong <neil.armstrong@linaro.org>
>>>>>


