Return-Path: <linux-media+bounces-58308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AnIK+5W12kFMggAu9opvQ
	(envelope-from <linux-media+bounces-58308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:36:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 531CA3C7192
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 419D0300E2B8
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 07:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2149379EF2;
	Thu,  9 Apr 2026 07:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MIgR2AdH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3110130B50C
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 07:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720165; cv=none; b=SWbMXnCeMm2qiMW0MIcsDYqoagzvanAniJc6bPpXG/2lLvGej+EIuF3vPQNuHJW7tgi6yvt6irwjacgdaiCLzW/KbTwfhWagF2uVRhN6NblqDnvGf8MZ90URN3rJScR4DCM1GjXDZX6QexMzk/nS8PONSjkuODtwoXlRdN9y+0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720165; c=relaxed/simple;
	bh=RurpFfWnbTizWtyqAECeLY6t9zt+iqhkueOjoS2iDBk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hy0Af8oU6S5WHyGMCD2TJYfxqtI2JYGUQD25857FyxFW59X8buTbxj02gWR6dvnCwgpYJ3OkJnmKY2rEcuFxat+G/4+iVcO/vdQGHjQkMt1V/szxgZ/y1sMDdG/3uRI01S+WyxF8l2Gzr/GaVEXRVlMOp1sFnMHpx7dqKCvw9uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MIgR2AdH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d5e87a507so215179f8f.3
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 00:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775720161; x=1776324961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oH271uuO4MMShMRMAwGhiR7Qd6MPFK5WpLtEoO5Nbdk=;
        b=MIgR2AdHJJG4u4/Wf6vxzqucmCj6GAui++gJS/MHN8clC0XT7e48hYZ/zFF4wjZsEw
         9cAKPBRuhlbOxd95Qz+tqP8yfbyAS6HqWV8jVjDcShcghqRGMp+V7enaNQKO+mZrdiu7
         T1OTZfn9Vckfnqze3hDLT4MlO4x1kkJh3wk2qL7DdX4Oi/WG+w/CXoTN77Olta6OsLc1
         43y86Osb5kr8b6d0CqQgrDdsvwtrll3BHhgJYjOLE2oii/7FosQEHyUldFpUuJpb0nmH
         09I65DEgVvJ5RSvpzvTxjcW9qvmjpwrzcbiweQqg6zPjKhwxYb0jSCfdzD4WpOT9wCx3
         2Jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720161; x=1776324961;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oH271uuO4MMShMRMAwGhiR7Qd6MPFK5WpLtEoO5Nbdk=;
        b=g74vOhw0nvI0hONRoa00FPR1GRMRro8XNyzo0wzd+J2ImvP0lGlCaksfcm99elxLsO
         Df9Z+30NHqkJvgDTAFHekD1Tk6Gursr6DiSMpSItV0UQseP4f35/n51XJn+Y3bmcHA63
         sBAX8v20sdMDnqxe6k6yxggoRCUzSW2fZlszR0AFbRdmiXI1kk327MkdFXX/Gnh4B+YK
         Wh9wTvzaovEzrWeuPWm653B2Sfa52L6ZQx1V5LsJEsWxZpxauZPkAfdwQ7q/+AzSR02Q
         wbkDmZwSFCLK6/qti6jlgit0IGSEyGSLuwqtvvkcbscihBO/dXvhaqGTFIea3x91gDyo
         aoxg==
X-Forwarded-Encrypted: i=1; AJvYcCXEoMR8jKWN9iFflV5hMRQjgZEmNzWasrT0waqdFhghrEB/nzAWXlFAlSasErHzWQ0/6oQUxKfayzTIIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHtuHMSff+j6JpcS+9+USeVVg7JgaYMu8mHtE7ufMz0wg9ThuY
	9F203fqZ5tNJuKIQq6oUPT0/jMw/ZnNWJAzp+YHnnoPd2qb9kROGRjTCK1fv+tt7zUI=
X-Gm-Gg: AeBDietXUStvzGLPz4rTAZTKb2kzaKq3oOWDJh4u/adf5KO9e5IUn+0IsHTMcS+URfg
	aLD6swMBm/7kXjAJLa2EBpiU0xZaEZKNlW6OVaQ4/SrCQewOUyPOohsXQcoNmIGUNRzLIUUoBpa
	6L+lQVIgxnWQdNJTiEIGPgIjJbYZfXluYyOa3BYVlMgD5kFjoM/so3GjuWKE5qNL8DaGG2JXKa5
	pop2cg1Q56eeSnONi1Sh0G5dEbceO4i0UJYJTzHm1ohKaXi0RfWP+7GfFFs1BNPO4iAdbMHcxhs
	4mhxgrHDt77bgnI2lk38vZE/W4eaYbWiErFeQ8n4OltX6zcH2gctAjozIWvCO9UQCt4i6Hzhggl
	pu9WYetSdhEU8LV+3hbunPVoIEc58cP+SzRj+LiBhcZr28MoobkpwX6WJpVGkOMhFsI0yVY9PX3
	BUDEj3T7MS3QGtHVnSBsAnIxxaec5uSgD/TBsG61Wwnbh2KwykTivAVIu+cv1N2osLz0y5Qc25G
	Ke1fjk=
X-Received: by 2002:a05:6000:2282:b0:43b:4aba:8f52 with SMTP id ffacd0b85a97d-43d292dbb72mr36364582f8f.32.1775720161413;
        Thu, 09 Apr 2026 00:36:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:70d5:8219:5bd4:e213? ([2a01:e0a:106d:1080:70d5:8219:5bd4:e213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d5e969bbfsm1964754f8f.1.2026.04.09.00.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 00:36:01 -0700 (PDT)
Message-ID: <f9edc172-c26a-4fa1-bca2-425e74bcd90b@linaro.org>
Date: Thu, 9 Apr 2026 09:36:00 +0200
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
In-Reply-To: <454f0f277cbaee5774c25d34a33fc3bc478fa756.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58308-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,gitlab.freedesktop.org:url];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 531CA3C7192
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 4/9/26 03:04, Nicolas Dufresne wrote:
> Hi,
> 
> Le jeudi 09 avril 2026 à 03:02 +0300, Dmitry Baryshkov a écrit :
>> On Wed, Apr 08, 2026 at 06:43:53PM +0200, Neil Armstrong wrote:
>>> This adds the plumbing to support decoding HEVC and AV1
>>> streams into 10bit pixel formats, linear and compressed.
>>>
>>> This has only been tested on SM8650 with HEVC, and was inspired by
>>> Venus and the downstream vidc driver for the buffer
>>> calculations and HFI messages.
>>>
>>> I was unable to get 10bit decoding working with Gstreamer
>>> and ffmpeg, but v4l2-ctl works with:
>>
>> Any particular errors? I assume Gstreamer needs to be taught about
>> Q10C. But P010 should (hopefully) work.
> 
> P010 should work for both Gst and FFMPEG, its probably a user error, or there is
> a hidden bug in the driver that make it fail, v4l2-ctl is very permissive as it
> simply dump to disk. You should provide an updated fluster score, so you have to
> use one of these.

I did run fluster and all main10 fails with Gstreamer and FFmpeg, I tried to manually
run the gst and ffmpeg commands with v4l2-tracer and logs but I can't explain the reason,
all returns from the driver seems valid but somehow they just error out with:

FFmpeg:
$ ffmpeg -c:v hevc_v4l2m2m -i Big_Buck_Bunny_1080_10s_30MB_main10.h265 -y -f null -
...
[hevc_v4l2m2m @ 0x55c0328aa0] Using device /dev/video-dec0
[hevc_v4l2m2m @ 0x55c0328aa0] driver 'iris_driver' on card 'iris_decoder' in mplane mode
[hevc_v4l2m2m @ 0x55c0328aa0] requesting formats: output=HEVC/none capture=NV12/yuv420p10le
...
[hevc_v4l2m2m @ 0x55c0328aa0] An invalid frame was output by a decoder. This is a bug, please report it.
[vist#0:0/hevc @ 0x55c02dc9b0] [dec:hevc_v4l2m2m @ 0x55c029d510] Decoding error: Internal bug, should not have happened

The v4l2 trace shows a normal sequence with the driver returning P010 as G_FMT after the source change event,
and the capture planes dequeued but for an unknown reason the buffer is rejected by ffmpeg.

Gst:
$ gst-launch-1.0 -v -m filesrc location=Big_Buck_Bunny_1080_10s_30MB_main10.h265 ! h265parse !  v4l2h265dec ! tee ! fakevideosink
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
...
Got message #37 from element "h265parse0" (latency): no message details
ERROR: from element /GstPipeline:pipeline0/GstH265Parse:h265parse0: Internal data stream error.
Redistribute latency...
Additional debug info:
../gstreamer/subprojects/gstreamer/libs/gst/base/gstbaseparse.c(3702): gst_base_parse_loop (): /GstPipeline:pipeline0/GstH265Parse:h265parse0:
streaming stopped, reason not-negotiated (-4)
Got message #39 from pad "h265parse0:src" (property-notify): ERROR: pipeline doesn't want to preroll.
GstMessagePropertyNotify, property-name=(string)caps, property-value=(GstCaps)"video/x-h265\,\ width\=\(int\)1920\,\ height\=\(int\)1080\,\ framerate\=\(fraction\)30/1\,\ chroma-format\=\(string\)4:2:0\,\ bit-depth-luma\=\(uint\)10\,\ bit-depth-chroma\=\(uint\)10\,\ parsed\=\(boolean\)true\,\ stream-format\=\(string\)byte-stream\,\ alignment\=\(string\)au\,\ pixel-aspect-ratio\=\(fraction\)1/1\,\ profile\=\(string\)main-10\,\ tier\=\(string\)main\,\ level\=\(string\)4";
/GstPipeline:pipeline0/GstH265Parse:h265parse0.GstPad:src: caps = video/x-h265, width=(int)1920, height=(int)1080, framerate=(fraction)30/1, chroma-format=(string)4:2:0, bit-depth-luma=(uint)10, bit-depth-chroma=(uint)10, parsed=(boolean)true, stream-format=(string)byte-stream, alignment=(string)au, pixel-aspect-ratio=(fraction)1/1, profile=(string)main-10, tier=(string)main, level=(string)4
...

In this case OUTPUT is not STREAMON and no OUTPUT buffers are queued, so I wonder why this one fails....

My gstreamer and ffmpeg foo is bad and I probably missed something obvious...

> 
> For Q10C on GStreamer, it needs mapping [0] and you need some bugfix [1] and
> another that I will be sending tomorrow. We had never tested video compression
> with this module before.
> 
> [0] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195
> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/11222
> 
> The last issue has to do with:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/38965e2d9c1119674a65dc437ee7e8ec95339f31/subprojects/gst-plugins-good/sys/v4l2/gstv4l2object.c#L4378
> 
> V4L2 format gives us the number of allocation, but not really the number of
> planes, and we forgot to initialize that number for the "opaque" format case. A
> tempory fix might be to add this after S_FMT:
> 
> if (GST_VIDEO_INFO_FORMAT (&info.vinfo) == GST_VIDEO_FORMAT_DMA_DRM)
>    n_v4l_planes = format.fmt.pix_mp.num_planes;
> 
> Works for AFBC and QC at leat, since both are unambiguously single plane, and so
> cannot have mplane variants.

I'll definitely try that ! thanks for the pointers !

> 
> Let me know how far you get! Please be aware that Robert and I are making these
> patches based on feedback, we don't have access to any boards capable of
> decoding to QC compressed formats.
> 
>>
>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
>>>
>>> The non-10bit decoding still works as before.
>>>
>>> With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
>>> and tranformed in v4l2 header format with [1]:
>>> ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
>>> /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
>>>
>>> The frames correctness has been verified buy displaying them
>>> via Vulkan DMA_BUF import, including QC10C and QC08C.
> 
> In GStreamer, once the video4linux plugin issues are fixed, you should be able
> to display the frames using glimagesink. GL only allow for RGB render, which
> damages the data, so its not good enough for conformance testing with
> compression enabled, but usually just doing visual inspection is acceptable.
> 
>>>
>>> The support is probably incomplete for other platforms and
>>> I'm unsure what's required to conform to the V4L2 M2M stateless
>>
>> stateful
>>
>>> spec, especially since AFAIK the decoder doesn't support
>>> decoding 10bit streams in 8bit pixel format, thus the RFC state.
>>> Review is welcome !
> 
> Why would your decoder need to support decoding 10bit into 8bit ? This is quite
> rare and its only possible with post-processed capture buffer.

Yeah it's just a note, the Amlogic one supported outputing main10 in NV12 but
only supported 10bit in their compressed format.

> 
>>>
>>> [1] https://github.com/superna9999/pyv4l2compliance
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>> Neil Armstrong (7):
>>>        media: qcom: iris: add QC10C & P010 buffer size calculations
>>>        media: qcom: iris: gen2: add support for 10bit decoding
>>>        media: qcom: iris: add helpers for 8bit and 10bit formats
>>>        media: qcom: iris: vdec: update size and stride calculations for 10bit formats
>>>        media: qcom: iris: vdec: forbid g_fmt while waiting for first source change
> 
> The is suspicious, it should just send the previous state until you get the
> event. Typical use case is for application to set a format based on bitstream
> parsing, and use that as a guess to try and pre-allocate the buffers. I don't
> usually review iris code, but I'll give that series some more eyes in the coming
> days.

Yeah I wasn't sure, venus does that, same as the vendor driver so I thought it would
be good but I'm probably mistaken.

> 
> cheers,
> Nicolas

Thanks!
Neil

> 
>>>        media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
>>>        media: qcom: iris: vdec: allow decoding into 10bit format
>>>
>>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 81 +++++++++++++++++++++-
>>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71 ++++++++++++++++++-
>>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    | 35 ++++++++--
>>>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  3 +-
>>>   drivers/media/platform/qcom/iris/iris_state.c      |  6 ++
>>>   drivers/media/platform/qcom/iris/iris_state.h      |  1 +
>>>   drivers/media/platform/qcom/iris/iris_utils.c      | 16 ++++-
>>>   drivers/media/platform/qcom/iris/iris_utils.h      |  2 +
>>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 70 +++++++++++++++++--
>>>   drivers/media/platform/qcom/iris/iris_vidc.c       | 14 +++-
>>>   13 files changed, 285 insertions(+), 18 deletions(-)
>>> ---
>>> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
>>> change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
>>>
>>> Best regards,
>>> --
>>> Neil Armstrong <neil.armstrong@linaro.org>
>>>


