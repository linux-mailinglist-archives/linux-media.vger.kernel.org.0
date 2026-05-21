Return-Path: <linux-media+bounces-62405-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC0pORi0DmosBQYAu9opvQ
	(envelope-from <linux-media+bounces-62405-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:28:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F17E5A0190
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8171E30B2C19
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350B8392C2E;
	Thu, 21 May 2026 07:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zO/kjsE9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FF1399CFC
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 07:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348297; cv=none; b=nAxKJvKFkxwaYl/VA/beOhAIn4qwcs5M3WvYpYTrm1poSb5PjISKBom+e1Mfn4yAjyWVSxRV+wc8CC49oykfzZfHftY/VtHIIBz8VBly830AohU8cCYacpdYk5qdXcaWpAhI867NAU/IpkyiyE5/iZfyk1j+ereSt8oF+Am8quc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348297; c=relaxed/simple;
	bh=yD3Pj/26SleXylY72WE7+uu20gBtyD5pqbIoEG9pJHE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nSduWFRb5c/2+6y6gTN8m5TkxIcOxAdxH64WN3PNPa2rRSASN3cF+Fkh2WfTb2yCTPwBx3ks/R4pd/TXhNQK1qhsP+ci5OgJSLmInZC03CfmEVwvxwK2D7PA+/mx/Kj8tB65cyQqbz4kHSGOZIekTSLUH5pOhzjg6GI/dbX6Zek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zO/kjsE9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-452169ae568so3670233f8f.3
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 00:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779348292; x=1779953092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kum5lj2T63gTqeDEzNY2vu1o8ElPs88myjInX2jIN8=;
        b=zO/kjsE9/RUsL7l23qfIkS1PlBEvyIF4yNyNHtyzuEZQJywZ2x21kmXyJjk01taGdG
         vdnzaFspG5fAiEUme6LCYJnugL0smhLljScJN5QCnXBM6goMPucdyVGns6oxs9qZX2oM
         bO1X4EOVTbayNH2sns5tbg+B78ofwh+OXzXEcve4f7g2RztS88RQkeYUJt+VFD54KhNK
         HdW6hD6v3dkGKPTxI/9sqzSyhBj469s+r2aaHryQUV8wV0TM+ybckuWSfaBGibWfDjrC
         yE78UNAQjRf6WjwSy0+PgcNPqDaGZ74yKLin8X3NB9/viw8VfRJ8zdb+fBEiVAyEsZmS
         rn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348292; x=1779953092;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kum5lj2T63gTqeDEzNY2vu1o8ElPs88myjInX2jIN8=;
        b=lSfmgxiUC57cXPuA0ExfwvpJepGAlN+RSWF5NBq0RG+mcXnF+gppxPv3wMjogBOE3y
         Kcjfq3m+/UostV+rEOf2VYFG2/q/3uwxMs38wwREMND/p2wPbJwenSJSwoRQOkjP0h1R
         sTwRHnB/jkHKekKw1pNDjFBxZ2Qh6NDbnKYSVXouwslJgGStVimCAxehh0VYIb3+Nw3+
         amrG8AFEsZmCAEHXliRk3HLM2ttcYqoxKiQWnhmaWq2yg4Y8xgReJmenuWJWug32jGV4
         TNyI/NhhsNVzvl9LxaL1Qyy6HLwOLvVb2uirKx0xTfrTzIvg2glj1+h65QhCd/KKmUwH
         197Q==
X-Gm-Message-State: AOJu0YwNtMs9WfpNiN2XzWfmagZfPk3S0N/QMnQQ3gcT2FUWsTKo0qiS
	tiPXlUhpXqsQTSCv7jRNhRDkdfxVNoPIyQSV1n2RLuRsvkZ4PeCnBvDe0rn8D5+EKG4=
X-Gm-Gg: Acq92OHEmhNwnRWYa0u0jVGCUY1hYjwjQ3kjbxuXQNq5WJwQbC2asGrP7riVaQDBcC9
	/aYAo2K9/9BrBc3h3xczNq6A1xMZ3I7aXqH9KpoBwWQeyqEbIcHECxbTRGXDTWULXVHcC9BSiT8
	zTeq3TFcz3x95eZd+Nqcg91qC5yF4ey4bW8sO50RzddtNzBD0AoQ20uTDGZKRTuKjFTuCKMCF9L
	mN0UcS3daSGKBkvwPlPfj1f7g0FXus1Ben7gFWSxFDPg7qSGDqNaJV0WgJVwBVfOoELrxrdoEI5
	g85S/BjXLmkI3qUf5U7Bd9kv3YrwigMsZWRNJI2nMKAzZ13sbkKH+4oRefjdXe/ofFPJaDuh8Oi
	BRHi5w2Mc2s/3k9S7JzQUVBg7k14VEwXdaDW7QLQ17SIm7NDxLrrQWKhhRMcuaCdCdTAiVFnTku
	Z0pcsNCTcnqYy71K6F5dmEN9sq702AYK8ouBtKcztY8YswdwHAOczau6fy/hLVqCM+ZeTKburRQ
	F46eCxJBFh3dgYDeg==
X-Received: by 2002:a05:6000:4023:b0:43d:d037:d59c with SMTP id ffacd0b85a97d-45ea38c97f5mr2635196f8f.16.1779348291660;
        Thu, 21 May 2026 00:24:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e038:7e8a:7467:8c6c? ([2a01:e0a:106d:1080:e038:7e8a:7467:8c6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa93d291sm485480f8f.36.2026.05.21.00.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 00:24:51 -0700 (PDT)
Message-ID: <18096ecd-3905-4d4c-960c-bf438178b4b1@linaro.org>
Date: Thu, 21 May 2026 09:24:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <c4144820-c5fe-4249-85df-acd64642b909@oss.qualcomm.com>
 <3b3fbaab-1463-4593-beeb-40168658de7c@linaro.org>
 <16581410-45e9-4311-a0e5-435dc5314ae6@oss.qualcomm.com>
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
In-Reply-To: <16581410-45e9-4311-a0e5-435dc5314ae6@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-62405-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:replyto,linaro.org:mid,linaro.org:dkim];
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
X-Rspamd-Queue-Id: 0F17E5A0190
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 17:44, Vikash Garodia wrote:
> 
> On 5/18/2026 1:12 PM, Neil Armstrong wrote:
>> On 5/13/26 19:33, Vikash Garodia wrote:
>>>
>>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>>> This adds the plumbing to support decoding HEVC, VP9 and AV1
>>>> streams into 10bit pixel formats, linear and compressed.
>>>>
>>>> This has only been tested on SM8550 & SM8650 with HEVC, and was
>>>> inspired by Venus, DRM MSM and the downstream vidc driver for the
>>>> buffer calculations and HFI messages.
>>>>
>>>> I was unable to get 10bit decoding working with ffmpeg since P010
>>>> support for v4l2 decoding is missing, but v4l2-ctl works with:
>>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt- video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from- hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
>>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt- video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from- hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
>>>>
>>>> The non-10bit decoding still works as before.
>>>>
>>>> With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
>>>> and tranformed in v4l2 header format with [1]:
>>>> ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
>>>> /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
>>>>
>>>> Fluster HEVC results on SM8650:
>>>>
>>>> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147
>>>> The failing test case:
>>>> - Pixel Format mismatch
>>>>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
>>>> - Unsupported resolution
>>>>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>>>>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>>>>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>>>>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
>>>> - CRC mismatch
>>>>   - RAP_A_docomo_6
>>>> - CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
>>>>   - VPSSPSPPS_A_MainConcept_1
>>>
>>>  From earlier SOC reports, 10bit tests which were failing were
>>> - DBLK_A_MAIN10_VIXS_4
>>> - INITQP_B_Main10_Sony_1
>>> - TSUNEQBD_A_MAIN10_Technicolor_2
>>> - WP_A_MAIN10_Toshiba_3
>>> - WP_MAIN10_B_Toshiba_3
>>> - WPP_A_ericsson_MAIN10_2
>>> - WPP_B_ericsson_MAIN10_2
>>> - WPP_C_ericsson_MAIN10_2
>>> - WPP_E_ericsson_MAIN10_2
>>> - WPP_F_ericsson_MAIN10_2
>>>
>>> I was in the opinion that once we enable 10bit, these tests would pass. Though i do not see these in your failing tests, but the count of 131/147 have not improved. Could you check if these tests are passing and count is better than 131 pass ?
>>
>> Sorry there's a copy paste error I'll fix on v4, here's the fluster log:
>>
>>
>> |Test|GStreamer-H.265-V4L2|
>> |-|-|
>> |TOTAL|141/147|
>> |TOTAL TIME|8.600s|
>> |-|-|
>> ...
>> |PICSIZE_A_Bossen_1|☠|
>> |PICSIZE_B_Bossen_1|☠|
>> ...
>> |RAP_A_docomo_6|❌|
>> ...
>> |TSUNEQBD_A_MAIN10_Technicolor_2|☠|
>> ...
>> |WPP_D_ericsson_MAIN10_2|☠|
>> |WPP_D_ericsson_MAIN_2|☠|
>> ...
>> |-|-|
>> |Test|GStreamer-H.265-V4L2|
>> |TOTAL|140/147|
>> |TOTAL TIME|8.600s|
>>
>> |-|-|
>> |Profile|GStreamer-H.265-V4L2|
>> |MAIN|131/135|
>> |MAIN_10|9/11|
>> |MAIN_STILL_PICTURE|1/1|
>>
>> So the failing cases:
>> - Pixel Format mismatch
>>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
> 
> Why would gstreamer expect NV12 for MAIN10 usecase ? Is this something to do with format negotiation ?

                         # Feature: Test unequal luma and chroma bitdepth
                         # setting. The luma bitdepth is higher than the chroma
                         # bitdepth.
                         # Luma is 10 bit, chroma is 9 bit

This particular test uses different bit depth for luma and chroma, and the fw upscales all to 10bit
while the sw decoder seems to downscale to 8bit. And it seems other HW decoder does the same as iris.

I think the HW decoder is right here, but this use case will probably never occur in real life.

> 
>> - Unsupported resolution
>>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
>> - CRC mismatch
>>   - RAP_A_docomo_6
>>
>>>
>>> Regards,
>>> Vikash
>>
> 


