Return-Path: <linux-media+bounces-61906-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLeOKSPGCmqa7wQAu9opvQ
	(envelope-from <linux-media+bounces-61906-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:56:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9885A568386
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BCBFD30418DB
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 07:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E86B3E0721;
	Mon, 18 May 2026 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pc1ShZfW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCED3E00A9
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090127; cv=none; b=uMPD3kVk4yciBY8nqZKForxXFg+G93kpvtq9wm8p1o8LJkfzj/eJkAMRV2PYlwNnZ8n7tBoLitqnHRHnK+DojUlYYF7nGOSvRLVTrVq/q4EM5Rr1hDxd/aT5scScO8XftCaqG8jE0uDZ/BgTrFYIwlcqtxQgThtLjilIACIEpow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090127; c=relaxed/simple;
	bh=sRgGDxB/bAdisraAN7obD4EfYDrSYP9dOD9kJ2R09BU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bXwj0quM4jDEKlC+lAK8vXdTrVIiMx6gmRy1gC89dx0juNcK1s25M6IpeNkVHAZecZ0pqvxPpkY49BZo29H3B7Z+ae6WzEfPpY+iWtI93iYxHUG+otrkzD+7o6VEaZsTsuiN5ftEDW9NZDhaESBozxll5TuJ0s/CmTo1dPLf45U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pc1ShZfW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48fde648a71so11822725e9.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 00:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779090124; x=1779694924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppNDAHzhFb5s5vvuYDLOkdSd7qRyRqLYBSTq1x9HR6o=;
        b=Pc1ShZfWtQzzuYMz6FJYbwBh/gvoqmyez6l2wdMKVwc/hUl5R+T+So4dzte40dFDp0
         skJ8bT06gzV5QZmnvpgmEKurnP2hDYGOcY0hVVGzwRVTcu+WdL3qo1QcouppXIHNo6rD
         lFvzAtjhpsOqh8Orfne/oSSzHQfLGuJ2ATF9Rbk2C0079ob+ycUjrlKLWGTSSXvt3FGy
         c6/iaEn1FTV4lPdgmQfMLAD/IEvtJt+vUitqHeK/DkQDi4oYA3SZj4G4GW+c30SJV5qt
         0UnWBUeGfbVICYr0WbX2+QVkjuBmP49u6G6oV4sEhRPlVCyc7OZUGhdDnW0mmmlYnny9
         Ejjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090124; x=1779694924;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppNDAHzhFb5s5vvuYDLOkdSd7qRyRqLYBSTq1x9HR6o=;
        b=ocKXl2bwPa+HwT92habQ6ZDH7ryYFVERQHjTPhChk0lejt2CYscQjm/czWdZblEW6p
         SDukRd9strmZ9GI/irNEckhRZR3QI8lc2Y1pyeAUiZEQEx7GffbONbVTxq9AfI5YmtOi
         nQY5Du3NMrOH3tsOWh7BkTU/R1IEVkuwghptxlCl5GHcY/4F4yIg1ad12i0JVy7fCUNS
         lyDon/GnWn36E2bPhfssYz/I54qE16+Lr4Oc0BZgQxmgk2e8wTyIkPVE51lfHizfh/R1
         Z0ujKLHpVRwc3TNVrSiYfhX+Jk4PHGYPcMkyevH4WTu0s60VJy3WewbWCMwY93rj0Z9G
         gYFQ==
X-Gm-Message-State: AOJu0Yxf1CRDR6xuvCC2AESezcmZeMIudt0/1d8g+qT5a4Flqg5H2mUl
	QHEzx53FOPkm/gQ+ojJlJeS1gHcD/5o/eqQT1pxm3APqx8d9HVU3fBUEHJ8O6qg24aY=
X-Gm-Gg: Acq92OEyU37zo9roqGYyDu1ZgYgs2gSwX5p1QYSmasIUbFLJbf9MQZ0qLMTzi/KwFsx
	jXJ6TECfQskI/ouCapdygmX01A1g1u8aOTKFHWUIv0W5v3nmM+k53lJXN7SrJmmG7365DTJR/WE
	qEcE+gSQrUnX96rrKGF6YOK8wFT0k5JGH34JFb1ahb2hT0kPmPDu287jDnWEAz6DLrvilb8ck3a
	Q27KqhDikBY5yT73tyZ813pE/xj7ZgIB0PdHkCgD02i4YuGA1r0W11CFlmZwYUv7Czc3mc/szot
	SMl3Uevsphgsvrh7sSFWxpqbDrrO46NI9/qvMO8V3HN8G28TLqY9k+/h6bc8+KpCpyRyg4W1qON
	07TlaV+yxg9z4+YsyE6SZt+ck9SgAXpeUequyyGLWlDkNWJ+9WRwBq9i/Cjk9bESl06LtQt2/48
	Fwi1CP+bOKS9XBheDUwBDdMF84oelJ/X4wtufeLACkM4aqAYs7zmrW8/UDC6FDmr5lx6PbaIszI
	x++5EaWC44xx0M=
X-Received: by 2002:a05:600c:8485:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48fe537fb6fmr186021655e9.9.1779090124361;
        Mon, 18 May 2026 00:42:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:64e2:72b:b9ed:6dcf? ([2a01:e0a:106d:1080:64e2:72b:b9ed:6dcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53804aesm224907495e9.15.2026.05.18.00.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:42:04 -0700 (PDT)
Message-ID: <3b3fbaab-1463-4593-beeb-40168658de7c@linaro.org>
Date: Mon, 18 May 2026 09:42:03 +0200
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
In-Reply-To: <c4144820-c5fe-4249-85df-acd64642b909@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9885A568386
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61906-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:replyto,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 5/13/26 19:33, Vikash Garodia wrote:
> 
> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>> This adds the plumbing to support decoding HEVC, VP9 and AV1
>> streams into 10bit pixel formats, linear and compressed.
>>
>> This has only been tested on SM8550 & SM8650 with HEVC, and was
>> inspired by Venus, DRM MSM and the downstream vidc driver for the
>> buffer calculations and HFI messages.
>>
>> I was unable to get 10bit decoding working with ffmpeg since P010
>> support for v4l2 decoding is missing, but v4l2-ctl works with:
>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
>>
>> The non-10bit decoding still works as before.
>>
>> With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
>> and tranformed in v4l2 header format with [1]:
>> ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
>> /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
>>
>> Fluster HEVC results on SM8650:
>>
>> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147
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
>> - CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
>>   - VPSSPSPPS_A_MainConcept_1
> 
>  From earlier SOC reports, 10bit tests which were failing were
> - DBLK_A_MAIN10_VIXS_4
> - INITQP_B_Main10_Sony_1
> - TSUNEQBD_A_MAIN10_Technicolor_2
> - WP_A_MAIN10_Toshiba_3
> - WP_MAIN10_B_Toshiba_3
> - WPP_A_ericsson_MAIN10_2
> - WPP_B_ericsson_MAIN10_2
> - WPP_C_ericsson_MAIN10_2
> - WPP_E_ericsson_MAIN10_2
> - WPP_F_ericsson_MAIN10_2
> 
> I was in the opinion that once we enable 10bit, these tests would pass. Though i do not see these in your failing tests, but the count of 131/147 have not improved. Could you check if these tests are passing and count is better than 131 pass ?

Sorry there's a copy paste error I'll fix on v4, here's the fluster log:


|Test|GStreamer-H.265-V4L2|
|-|-|
|TOTAL|141/147|
|TOTAL TIME|8.600s|
|-|-|
...
|PICSIZE_A_Bossen_1|☠|
|PICSIZE_B_Bossen_1|☠|
...
|RAP_A_docomo_6|❌|
...
|TSUNEQBD_A_MAIN10_Technicolor_2|☠|
...
|WPP_D_ericsson_MAIN10_2|☠|
|WPP_D_ericsson_MAIN_2|☠|
...
|-|-|
|Test|GStreamer-H.265-V4L2|
|TOTAL|140/147|
|TOTAL TIME|8.600s|

|-|-|
|Profile|GStreamer-H.265-V4L2|
|MAIN|131/135|
|MAIN_10|9/11|
|MAIN_STILL_PICTURE|1/1|

So the failing cases:
- Pixel Format mismatch
  - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
- Unsupported resolution
  - PICSIZE_A_Bossen_1 - resolution is higher than max supported
  - PICSIZE_B_Bossen_1 - resolution is higher than max supported
  - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
  - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
- CRC mismatch
  - RAP_A_docomo_6

> 
> Regards,
> Vikash


