Return-Path: <linux-media+bounces-40726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E59B3118C
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 10:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48A90621784
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 08:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C3D7261B;
	Fri, 22 Aug 2025 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SyfdedNX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CF721256B
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755850676; cv=none; b=mreStcf0EMJ1jFy7GqjLTXSJJcZ9QGBUjsHHB7LVj2rlbUnXGnm942m8lfkN+E8IjPeJPzSgUYaVh3HurmZV08KCTbwe00UjkwF7RZJPiw7fTGDfdM9Dr9GQAnKVJiJrNBN0PeCFGgEvYCBKx7b7d9KQBiPKwgbrSWQhn1yK4pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755850676; c=relaxed/simple;
	bh=tJa1j6EHHWaAR6BfAoIjul0sV8+1QsM5R5sHJpUy3jo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tX2uah93ZjXntOISNkot8BSK31Zs7ZcGzS1qg5w44UVDilGn33NA/nWn/rYYbngRzhHoFaDJHWgRARkd9Svu7mmYmrWByObn3aL1gd7EjvpYEsr6DGqSmtWHZ+6OxlBKqKjOMnWUoL6oYKwjvYMWnGfU26JNYPoTXa4deGM3Z6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SyfdedNX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3c43399ea42so1246411f8f.1
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 01:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755850670; x=1756455470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/m8ODyKt6Bl/8gUgN+ua768LLFJCXEkdVrGQxH7T13E=;
        b=SyfdedNXUW0K/PmUJuKSxcVTGnFxFpI1lnC0EegYwQjvjnKi8GppdmjxQdmuUDH1jL
         pTGpyYo28IrIbr9DnjCL1ii72ALxsgQEK002GDJT1wwPPdWBFCZgp3Nl4Yg5JchTbueX
         plYJRRfpmPbrkRu6Qhmj5i9N5/UyyiYLgEY+MvIaSd6HnB1mDcg2lf7YYLcCva55Auqm
         /jgDxnsU/Uwo0XR7xTE56RrlgVxF1JTTNsehF5RX5iB7PyGBaDrlUydhS30rPPo+R5uK
         EDoqjOSYOYdjSBBFg5ZBOlN4AVY3Hl+4RGsor/pNvrlCCJOjSyTMyj2D5fD3Z/w+3/l0
         oknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755850670; x=1756455470;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/m8ODyKt6Bl/8gUgN+ua768LLFJCXEkdVrGQxH7T13E=;
        b=UQnq+pWQUmW406LVcC7rdSvuySYeErM8tdBxxdlP5m9oSyzh8pu/7uGL9KwFO17VJL
         0uoPVnXqqzwyLwx3UCC9uhCi9qUsPUTPzLA0O50uPV4bV0cSi/O5Qrektl4Qs35pmueX
         6rNXJNdwF2sJrq6DXrD+hER1AT3t2mA/CQGJOrD2rknuuuY8wCPKkCbPIKtsOTBS8Ta7
         DRkPUUvSrEjlx3VCWcc9pt2QWDSQspaX+2z7F8Eu1du+gdKuxsbVNQ2QSLpXfWtpfGpu
         5jrhBhCUIyzsFzhW45VEP2yjttcRM1XvDXwQElNFOO9t0wOid2jlFZYlZvaJ9TdZZiuR
         rrxQ==
X-Gm-Message-State: AOJu0YyjxLrrsRUh63Zvw5aVOrFPgTeX6ikEZsns+32MY2SxDGvWUDEe
	VztFHNqap+73DNuJ1nHS6xhnkCD6dyYYzBiTzjVAGB823qB+1EDn5gnQ7gKANPAPVvU=
X-Gm-Gg: ASbGncupSP8E4Zq82mZPNJg6wa1zi8nReZc30bsZKm0v4fJ311Hwv5ycPDvwWFdCruj
	1Cc+rktY0OX7kCwn1+KlfVmcgLqiHptxT6RXaajezMtdrPOJju3PiojDB1XCFmZcsNBFbQLzzAk
	wDkr5T++FCxW13bobJnKkdmVulqgHyiKMOpZc+m+sQywuc9jIqdWSW+w9a+CHnHF+xTMXPHSEk4
	Q96+hhEhnISFB0SnVelGpLFr+jn1kZtLxxAkZL3lBRQGBKlccBx86UsNu8aV4g2gP2foIFrrHWj
	jnATGx1Gnb1uShp4H5CPdQIzjaxgip8oXrpVUyqY4pTfgQ1SjU1AhiZSKe2cc1vdaKASoLQ3uyv
	J0dUmE1P0VT6leJQXBzXn2jyTcIHpKcxpLxLCRQVuhBgdF1HkM9rWlAQv0ivudgVXnWaWEubG4L
	M=
X-Google-Smtp-Source: AGHT+IEOb1hg3ig0PJe6skydNrTnIbrMbov3jime6vNKfFU9e19mFzXGYm1hFea3M5PGxrcDv/wIrw==
X-Received: by 2002:a05:6000:2104:b0:3c6:97ae:a574 with SMTP id ffacd0b85a97d-3c697aeac73mr102972f8f.24.1755850669982;
        Fri, 22 Aug 2025 01:17:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3dd7:7361:c101:6a77? ([2a01:e0a:3d9:2080:3dd7:7361:c101:6a77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c65f88fa86sm717138f8f.25.2025.08.22.01.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 01:17:49 -0700 (PDT)
Message-ID: <92f50738-571c-479c-9be8-b72c32fd8b70@linaro.org>
Date: Fri, 22 Aug 2025 10:17:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 00/26] Enable H.264/H.265 encoder support and fixes in
 iris driver common code
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <9584a286-7d8a-48b0-a65c-7a37ced78ac6@linaro.org>
 <38d56655-cfea-ef3d-46ff-a77d81e35297@quicinc.com>
 <19f844ee-da08-4497-a4f7-c90d45554534@linaro.org>
 <cdce193e-c055-6599-16e5-83e33123099e@quicinc.com>
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
In-Reply-To: <cdce193e-c055-6599-16e5-83e33123099e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/08/2025 09:02, Dikshita Agarwal wrote:
> 
> 
> On 8/21/2025 6:28 PM, Neil Armstrong wrote:
>> On 21/08/2025 09:21, Dikshita Agarwal wrote:
>>>
>>>
>>> On 8/20/2025 8:29 PM, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 20/08/2025 11:07, Dikshita Agarwal wrote:
>>>>> Hi All,
>>>>>
>>>>> This patch series adds support for H.264 and H.265 encoder in iris
>>>>> driver and includes a few fixes and cleanup in the common code that were
>>>>> identified during encoder bring-up process.
>>>>>
>>>>> The changes include:
>>>>> - Enabling support for H.264 and H.265 encoding.
>>>>> - Fixes and improvements in shared componenets used by both encoder and
>>>>> decoder paths.
>>>>> - Ensuring compatibility and stability with the existing decoder flow.
>>>>>
>>>>> Changes in v3:
>>>>> - Fixed the log when destroying the interanl buffers (Jorge)
>>>>> - Updated commit text with issue details in patch 05/25 (Krzysztof)
>>>>> - Added a patch to simplify conditional logic in stop handling for hfi
>>>>> gen1 (Bryan)
>>>>> - Reduced duplicate code while registering video devices (Bryan)
>>>>> - Added a fix for try fmt handling in decoder (Self)
>>>>> - Fixed the value of max core mbps for qcs8300 (Vikash)
>>>>> - Simplied the frame rate handling in driver by using non q16 format and
>>>>> converted to q16 when setting to firmware (Vikash)
>>>>> - Fixed the issue with bitstream resolution setting to firmware (Neil)
>>>>> - Addressed other review comments (Vikash, Bryan)
>>>>> - Link to v2:
>>>>> https://lore.kernel.org/r/20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com
>>>>>
>>>>> Changes in v2:
>>>>> - Fixed sparse/coccinnelle issues.
>>>>> - Fixed the kernel doc warning.
>>>>> - Removed unsupported PEAK_BITRATE property from SM8250.
>>>>> - Dropped patch 04/25 to fix quality issue with encoder.
>>>>> - Enhanced command handling for encoder to allow start/stop commands.
>>>>> - Expanded rate control condition checks to include additional rate
>>>>>      control types for HFI Gen2.
>>>>> - Updated default value to MAX_QP for all caps related to max QP settings.
>>>>> - Add support for INPUT/OUTPUT_BUF_HOST_MAX_COUNT caps for encoder.
>>>>> - Link to v1:
>>>>> https://lore.kernel.org/r/20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com
>>>>>
>>>>> All patches have been tested with v4l2-compliance, v4l2-ctl and
>>>>> Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured
>>>>> that the existing decoder functionality remains uneffected.
>>>>>
>>>>> Commands used for V4l2-ctl validation:
>>>>>
>>>>> v4l2-ctl --verbose
>>>>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>>>>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>>>>> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
>>>>> --stream-from=/media/cyclists_1280x720_92frames.yuv
>>>>> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
>>>>>
>>>>> v4l2-ctl --verbose
>>>>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>>>>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>>>>> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
>>>>> --stream-from=/media/cyclists_1280x720_92frames.yuv
>>>>> --stream-to=/tmp/cyclists_1280x720_92frames.hevc -d /dev/video1
>>>>
>>>> - I've tested this serie on SM8650, first I failed to get HEVC working with
>>>> the following command:
>>>>
>>>> v4l2-ctl --verbose
>>>> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12
>>>> --set-selection-output target=crop,top=0,left=0,width=1920,height=1080
>>>> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
>>>> --stream-from=Big_Buck_Bunny_1080_10s.yuv
>>>> --stream-to=Big_Buck_Bunny_1080_10s.hevc -d /dev/video1
>>>>
>>>> I got:
>>>> qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
>>>>
>>>> I checked the diff with v2, and reverting this make HEVC encoding work
>>>> again:
>>>
>>> This is strange, we don't see any such issue on SM8550.
>>> Could you pls share the full logs.
>>
>> I tried again with a 720p stream with your exact command line from the
>> cover letter
>> and it still fails with HEVC:
>> $ v4l2-ctl --verbose
>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
>> --stream-from=Big_Buck_Bunny_720_10s.yuv
>> --stream-to=Big_Buck_Bunny_720_10s.hevc -d /dev/video1
>> VIDIOC_QUERYCAP: ok
>> VIDIOC_G_FMT: ok
>> VIDIOC_S_FMT: ok
>> Format Video Capture Multiplanar:
>>      Width/Height      : 320/240
>>      Pixel Format      : 'HEVC' (HEVC)
>>      Field             : None
>>      Number of planes  : 1
>>      Flags             :
>>      Colorspace        : Default
>>      Transfer Function : Default
>>      YCbCr/HSV Encoding: Default
>>      Quantization      : Default
>>      Plane 0           :
>>         Bytes per Line : 0
>>         Size Image     : 245760
>> VIDIOC_G_FMT: ok
>> VIDIOC_S_FMT: ok
>> Format Video Output Multiplanar:
>>      Width/Height      : 1280/736
>>      Pixel Format      : 'NV12' (Y/UV 4:2:0)
>>      Field             : None
>>      Number of planes  : 1
>>      Flags             :
>>      Colorspace        : Default
>>      Transfer Function : Default
>>      YCbCr/HSV Encoding: Default
>>      Quantization      : Default
>>      Plane 0           :
>>         Bytes per Line : 1280
>>         Size Image     : 1413120
>> VIDIOC_G_SELECTION: ok
>> VIDIOC_S_SELECTION: ok
>>          VIDIOC_G_FMT returned 0 (Success)
>>          VIDIOC_G_FMT returned 0 (Success)
>>          VIDIOC_G_FMT returned 0 (Success)
>>          VIDIOC_REQBUFS returned 0 (Success)
>>          VIDIOC_QUERYBUF returned 0 (Success)
>>          VIDIOC_QUERYBUF returned 0 (Success)
>>          VIDIOC_QUERYBUF returned 0 (Success)
>>          VIDIOC_QUERYBUF returned 0 (Success)
>>          VIDIOC_G_FMT returned 0 (Success)
>>          VIDIOC_QUERYBUF returned 0 (Success)
>>          VIDIOC_G_FMT returned 0 (Success)
>>          VIDIOC_QBUF returned 0 (Success)
>>          VIDIOC_QUERYBUF returned 0 (Success)
>>          VIDIOC_G_FMT returned 0 (Success)
>>          VIDIOC_QBUF returned 0 (Success)
>>          VIDIOC_QUERYBUF returned 0 (Success)
>>          VIDIOC_G_FMT returned 0 (Success)
>>          VIDIOC_QBUF returned 0 (Success)
>>          VIDIOC_QUERYBUF returned 0 (Success)
>>          VIDIOC_G_FMT returned 0 (Success)
>>          VIDIOC_QBUF returned 0 (Success)
>>          VIDIOC_STREAMON returned 0 (Success)
>> VIDIOC_G_FMT: ok
>> VIDIOC_DQBUF: failed: Input/output error
>> out dqbuf: 0 seq:      0 bytesused: 0 ts: 0.000000 field: Any
>> VIDIOC_DQBUF: failed: Input/output error
>>
> 
> Thanks for the logs, but those didn't give any useful info on this issue,
> We would firmware logs to check this, as we are not able to reproduce this
> issue on SM8550.
> 
> Please use below patch to enabled firmware logs and share the debug output.
> 
> if you see any issue due to higher logging, you can reduce the paylod value
> for HFI_PROP_DEBUG_LOG_LEVEL to 0x00000018.
> 

Here's the fw debug for 720p:
[  156.014030] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723c008:00> Current cmd contains 1 packet(s)
[  156.025851] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723c008:00> Current cmd contains 1 packet(s)
[  156.048597] videobuf2_common: [out-00000000b3188ebe] __setup_offsets: buffer 0, plane 0 offset 0x00000000
[  156.048740] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723c008:00> Current cmd contains 1 packet(s)
[  156.060239] videobuf2_common: [out-00000000b3188ebe] __setup_offsets: buffer 1, plane 0 offset 0x00008000
[  156.091521] videobuf2_common: [out-00000000b3188ebe] __setup_offsets: buffer 2, plane 0 offset 0x00010000
[  156.091557] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723c008:00> Current cmd contains 1 packet(s)
[  156.112758] videobuf2_common: [out-00000000b3188ebe] __setup_offsets: buffer 3, plane 0 offset 0x00018000
[  156.112760] videobuf2_common: [out-00000000b3188ebe] __vb2_queue_alloc: allocated 4 buffers, 1 plane(s) each
[  156.177110] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723c008:00> HostDriver: Codec 4 Session Created
[  156.199103] videobuf2_common: [out-00000000b3188ebe] vb2_mmap: buffer 0, plane 0 successfully mapped
[  156.216207] videobuf2_common: [out-00000000b3188ebe] vb2_mmap: buffer 1, plane 0 successfully mapped
[  156.225641] videobuf2_common: [out-00000000b3188ebe] vb2_mmap: buffer 2, plane 0 successfully mapped
[  156.235069] videobuf2_common: [out-00000000b3188ebe] vb2_mmap: buffer 3, plane 0 successfully mapped
[  156.245383] videobuf2_common: [out-00000000b3188ebe] vb2_core_qbuf: qbuf of buffer 0 succeeded
[  156.265177] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000539baada
[  156.265180] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  156.265181] v4l2_m2m_try_run: No job pending
[  156.265775] videobuf2_common: [out-00000000b3188ebe] vb2_core_qbuf: qbuf of buffer 1 succeeded
[  156.285938] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000539baada
[  156.285940] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  156.285941] v4l2_m2m_try_run: No job pending
[  156.286521] videobuf2_common: [out-00000000b3188ebe] vb2_core_qbuf: qbuf of buffer 2 succeeded
[  156.306742] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000539baada
[  156.306743] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  156.306745] v4l2_m2m_try_run: No job pending
[  156.307270] videobuf2_common: [out-00000000b3188ebe] vb2_core_qbuf: qbuf of buffer 3 succeeded
[  156.327559] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000539baada
[  156.327561] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  156.327562] v4l2_m2m_try_run: No job pending
[  156.333898] videobuf2_common: [out-00000000b3188ebe] vb2_core_streamon: successful
[  156.336266] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723c008:00> Current cmd contains 1 packet(s)
[  156.347440] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000539baada
[  156.347441] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  156.347442] v4l2_m2m_try_run: No job pending
[  156.358386] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.358391] videobuf2_common: [cap-00000000747aa047] vb2_core_streamoff: successful
[  156.379671] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.379781] videobuf2_common: [cap-00000000747aa047] __setup_offsets: buffer 0, plane 0 offset 0x00000000
[  156.399741] videobuf2_common: [cap-00000000747aa047] __setup_offsets: buffer 1, plane 0 offset 0x00008000
[  156.399741] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.411219] videobuf2_common: [cap-00000000747aa047] __setup_offsets: buffer 2, plane 0 offset 0x00010000
[  156.421223] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.431101] videobuf2_common: [cap-00000000747aa047] __setup_offsets: buffer 3, plane 0 offset 0x00018000
[  156.441081] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.450912] videobuf2_common: [cap-00000000747aa047] __vb2_queue_alloc: allocated 4 buffers, 1 plane(s) each
[  156.450938] videobuf2_common: [cap-00000000747aa047] vb2_mmap: buffer 0, plane 0 successfully mapped
[  156.460941] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.471063] videobuf2_common: [cap-00000000747aa047] vb2_mmap: buffer 1, plane 0 successfully mapped
[  156.480446] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.490477] videobuf2_common: [cap-00000000747aa047] vb2_mmap: buffer 2, plane 0 successfully mapped
[  156.499865] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.509884] videobuf2_common: [cap-00000000747aa047] vb2_mmap: buffer 3, plane 0 successfully mapped
[  156.519283] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.529295] videobuf2_common: [cap-00000000747aa047] vb2_core_qbuf: qbuf of buffer 0 succeeded
[  156.529296] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000539baada
[  156.538687] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.548707] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  156.548708] v4l2_m2m_try_run: No job pending
[  156.548709] videobuf2_common: [cap-00000000747aa047] vb2_core_qbuf: qbuf of buffer 1 succeeded
[  156.548710] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000539baada
[  156.548710] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  156.548711] v4l2_m2m_try_run: No job pending
[  156.548711] videobuf2_common: [cap-00000000747aa047] vb2_core_qbuf: qbuf of buffer 2 succeeded
[  156.548712] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000539baada
[  156.548712] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  156.557573] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.567585] v4l2_m2m_try_run: No job pending
[  156.567586] videobuf2_common: [cap-00000000747aa047] vb2_core_qbuf: qbuf of buffer 3 succeeded
[  156.567586] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000539baada
[  156.567587] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  156.567587] v4l2_m2m_try_run: No job pending
[  156.568234] videobuf2_common: [cap-00000000747aa047] vb2_core_streamon: successful
[  156.576513] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.585323] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000539baada
[  156.585326] v4l2_m2m_try_run: Running job on m2m_ctx: 00000000539baada
[  156.622122] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.632154] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.642193] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.652223] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.662249] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.672276] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_COLOR_FORMAT) --> 0x00000001
[  156.683826] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_RAW_RESOLUTION) --> 0x050002e0
[  156.695557] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  156.707094] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_LINEAR_STRIDE_SCANLINE) --> 0x050002e0
[  156.719523] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_SIGNAL_COLOR_INFO) --> 0x14000003
[  156.731507] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  156.742619] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  156.753733] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  156.764671] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  156.775604] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  156.787965] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  156.800325] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  156.811269] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  156.823100] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  156.834763] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  156.846332] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  156.858068] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.868113] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.878162] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.888213] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.898261] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.908309] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.918360] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.928417] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.938466] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.948518] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.958565] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.968615] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.978664] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.988713] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  156.998765] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.008812] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.018865] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.028910] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.038967] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.049026] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.059078] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.069130] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.079184] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.089239] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.099292] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.109342] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.119392] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.129440] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.139492] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.149542] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_BITSTREAM_RESOLUTION) --> 0x050002e0
[  157.161823] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  157.173386] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_FRAME_RATE) --> 0x001e0000
[  157.184768] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  157.195895] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  157.207017] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  157.217953] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  157.228889] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  157.241250] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  157.253611] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  157.264554] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  157.276383] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  157.288040] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  157.299604] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  157.311341] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> Disabling ONE_SLICE mode, tiling:0 numTile:1 CP:0 SliceDelivery:0 MultiSliceMode:0
[  157.325847] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH, Driver macro size = 9563648 vs FW HFI macro size = 7953920 vs FW golden buffer size = 5833728
[  157.344542] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_NON_COMV, Driver macro size = 299008 vs FW HFI macro size = 299264 vs FW golden buffer size = 299264
[  157.363944] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00> venc_c2Start(3860): Send HFI_CMD_START error response for port 1
[  157.376855] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
[  157.389836] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
[  157.402827] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
[  157.415816] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
[  157.428832] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
[  157.436848] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
[  157.437461] videobuf2_common: [cap-00000000747aa047] __vb2_wait_for_done_vb: Queue in error state, will not wait for buffers
[  157.444852] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
[  157.464359] videobuf2_common: [out-00000000b3188ebe] __vb2_wait_for_done_vb: Queue in error state, will not wait for buffers
[  157.464362] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
[  157.483989] videobuf2_common: [out-00000000b3188ebe] vb2_buffer_done: done processing on buffer 0, state: done
[  157.501256] videobuf2_common: [out-00000000b3188ebe] vb2_buffer_done: done processing on buffer 1, state: done
[  157.511654] videobuf2_common: [out-00000000b3188ebe] vb2_buffer_done: done processing on buffer 2, state: done
[  157.524167] videobuf2_common: [out-00000000b3188ebe] vb2_buffer_done: done processing on buffer 3, state: done
[  157.534706] videobuf2_common: [cap-00000000747aa047] vb2_buffer_done: done processing on buffer 0, state: done
[  157.548756] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000539baada
[  157.548758] __v4l2_m2m_try_queue: Aborted context
[  157.548761] v4l2_m2m_try_run: No job pending
[  157.548762] v4l2_m2m_cancel_job: m2m_ctx 00000000539baada running, will wait to complete
[  157.548791] videobuf2_common: [cap-00000000747aa047] vb2_buffer_done: done processing on buffer 1, state: done
[  157.559268] videobuf2_common: [cap-00000000747aa047] vb2_buffer_done: done processing on buffer 2, state: done
[  157.569579] videobuf2_common: [cap-00000000747aa047] vb2_buffer_done: done processing on buffer 3, state: done
[  157.581887] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.582512] videobuf2_common: [cap-00000000747aa047] vb2_core_streamoff: successful
[  157.600203] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)
[  157.600230] videobuf2_common: [out-00000000b3188ebe] vb2_core_streamoff: successful
[  157.618202] videobuf2_common: [cap-00000000747aa047] vb2_core_streamoff: successful
[  157.626311] videobuf2_common: [cap-00000000747aa047] __vb2_buf_mem_free: freed plane 0 of buffer 0
[  157.635700] videobuf2_common: [cap-00000000747aa047] __vb2_buf_mem_free: freed plane 0 of buffer 1
[  157.645066] videobuf2_common: [cap-00000000747aa047] __vb2_buf_mem_free: freed plane 0 of buffer 2
[  157.654429] videobuf2_common: [cap-00000000747aa047] __vb2_buf_mem_free: freed plane 0 of buffer 3
[  157.663663] videobuf2_common: [out-00000000b3188ebe] vb2_core_streamoff: successful
[  157.672515] videobuf2_common: [out-00000000b3188ebe] __vb2_buf_mem_free: freed plane 0 of buffer 0
[  157.682040] videobuf2_common: [out-00000000b3188ebe] __vb2_buf_mem_free: freed plane 0 of buffer 1
[  157.691531] videobuf2_common: [out-00000000b3188ebe] __vb2_buf_mem_free: freed plane 0 of buffer 2
[  157.701045] videobuf2_common: [out-00000000b3188ebe] __vb2_buf_mem_free: freed plane 0 of buffer 3
[  157.711048] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723e008:00> Current cmd contains 1 packet(s)

and with 640x480:
[  282.394172] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723c008:00> Current cmd contains 1 packet(s)
[  282.409166] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723c008:00> Current cmd contains 1 packet(s)
[  282.431742] videobuf2_common: [out-0000000066975fcf] __setup_offsets: buffer 0, plane 0 offset 0x00000000
[  282.431799] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723c008:00> Current cmd contains 1 packet(s)
[  282.447126] videobuf2_common: [out-0000000066975fcf] __setup_offsets: buffer 1, plane 0 offset 0x00008000
[  282.447189] videobuf2_common: [out-0000000066975fcf] __setup_offsets: buffer 2, plane 0 offset 0x00010000
[  282.468613] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723c008:00> Current cmd contains 1 packet(s)
[  282.489826] videobuf2_common: [out-0000000066975fcf] __setup_offsets: buffer 3, plane 0 offset 0x00018000
[  282.489828] videobuf2_common: [out-0000000066975fcf] __vb2_queue_alloc: allocated 4 buffers, 1 plane(s) each
[  282.575556] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723c008:00> HostDriver: Codec 4 Session Created
[  282.587027] videobuf2_common: [out-0000000066975fcf] vb2_mmap: buffer 0, plane 0 successfully mapped
[  282.599638] videobuf2_common: [out-0000000066975fcf] vb2_mmap: buffer 1, plane 0 successfully mapped
[  282.619757] videobuf2_common: [out-0000000066975fcf] vb2_mmap: buffer 2, plane 0 successfully mapped
[  282.629178] videobuf2_common: [out-0000000066975fcf] vb2_mmap: buffer 3, plane 0 successfully mapped
[  282.639035] videobuf2_common: [out-0000000066975fcf] vb2_core_qbuf: qbuf of buffer 0 succeeded
[  282.647911] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 0000000079b61dc9
[  282.647913] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  282.647914] v4l2_m2m_try_run: No job pending
[  282.648284] videobuf2_common: [out-0000000066975fcf] vb2_core_qbuf: qbuf of buffer 1 succeeded
[  282.666948] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 0000000079b61dc9
[  282.666949] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  282.666950] v4l2_m2m_try_run: No job pending
[  282.667273] videobuf2_common: [out-0000000066975fcf] vb2_core_qbuf: qbuf of buffer 2 succeeded
[  282.676140] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 0000000079b61dc9
[  282.676141] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  282.676142] v4l2_m2m_try_run: No job pending
[  282.676505] videobuf2_common: [out-0000000066975fcf] vb2_core_qbuf: qbuf of buffer 3 succeeded
[  282.696438] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 0000000079b61dc9
[  282.696440] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  282.696441] v4l2_m2m_try_run: No job pending
[  282.700138] videobuf2_common: [out-0000000066975fcf] vb2_core_streamon: successful
[  282.702464] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723c008:00> Current cmd contains 1 packet(s)
[  282.716205] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 0000000079b61dc9
[  282.716207] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  282.716207] v4l2_m2m_try_run: No job pending
[  282.736985] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.736998] videobuf2_common: [cap-00000000cc711ce3] vb2_core_streamoff: successful
[  282.750425] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.758641] videobuf2_common: [cap-00000000cc711ce3] __setup_offsets: buffer 0, plane 0 offset 0x00000000
[  282.770259] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.780126] videobuf2_common: [cap-00000000cc711ce3] __setup_offsets: buffer 1, plane 0 offset 0x00008000
[  282.790099] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.799987] videobuf2_common: [cap-00000000cc711ce3] __setup_offsets: buffer 2, plane 0 offset 0x00010000
[  282.809973] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.819860] videobuf2_common: [cap-00000000cc711ce3] __setup_offsets: buffer 3, plane 0 offset 0x00018000
[  282.829834] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.839685] videobuf2_common: [cap-00000000cc711ce3] __vb2_queue_alloc: allocated 4 buffers, 1 plane(s) each
[  282.849710] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.859827] videobuf2_common: [cap-00000000cc711ce3] vb2_mmap: buffer 0, plane 0 successfully mapped
[  282.869820] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.879231] videobuf2_common: [cap-00000000cc711ce3] vb2_mmap: buffer 1, plane 0 successfully mapped
[  282.889238] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.898650] videobuf2_common: [cap-00000000cc711ce3] vb2_mmap: buffer 2, plane 0 successfully mapped
[  282.908664] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.918072] videobuf2_common: [cap-00000000cc711ce3] vb2_mmap: buffer 3, plane 0 successfully mapped
[  282.928079] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.937474] videobuf2_common: [cap-00000000cc711ce3] vb2_core_qbuf: qbuf of buffer 0 succeeded
[  282.937475] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 0000000079b61dc9
[  282.937476] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  282.937476] v4l2_m2m_try_run: No job pending
[  282.937478] videobuf2_common: [cap-00000000cc711ce3] vb2_core_qbuf: qbuf of buffer 1 succeeded
[  282.947494] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.956358] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 0000000079b61dc9
[  282.956360] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  282.956361] v4l2_m2m_try_run: No job pending
[  282.956362] videobuf2_common: [cap-00000000cc711ce3] vb2_core_qbuf: qbuf of buffer 2 succeeded
[  282.956363] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 0000000079b61dc9
[  282.956364] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  282.956364] v4l2_m2m_try_run: No job pending
[  282.956366] videobuf2_common: [cap-00000000cc711ce3] vb2_core_qbuf: qbuf of buffer 3 succeeded
[  282.956366] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 0000000079b61dc9
[  282.956367] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  282.956367] v4l2_m2m_try_run: No job pending
[  282.957187] videobuf2_common: [cap-00000000cc711ce3] vb2_core_streamon: successful
[  282.965294] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  282.975271] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 0000000079b61dc9
[  282.975273] v4l2_m2m_try_run: Running job on m2m_ctx: 0000000079b61dc9
[  283.010930] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.020984] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.031021] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.041057] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.051097] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_COLOR_FORMAT) --> 0x00000001
[  283.062639] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_RAW_RESOLUTION) --> 0x028001e0
[  283.074374] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  283.085933] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_LINEAR_STRIDE_SCANLINE) --> 0x028001e0
[  283.098388] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_SIGNAL_COLOR_INFO) --> 0x14000003
[  283.110399] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  283.121510] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  283.132620] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  283.143556] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  283.154491] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  283.166852] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  283.179213] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  283.190149] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  283.201978] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  283.213641] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  283.225214] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  283.236948] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.247001] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.257049] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.267097] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.277148] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.287196] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.297244] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.307291] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.317341] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.327391] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.337441] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.347494] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.357543] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.367591] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.377696] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_BITSTREAM_RESOLUTION) --> 0x028001e0
[  283.389980] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  283.401539] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.411589] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.421634] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.431683] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.441732] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.451779] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.461828] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.471881] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.481928] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.491976] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.502027] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.512092] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.522137] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.532186] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.542229] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.552274] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_FRAME_RATE) --> 0x001e0000
[  283.563652] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  283.574758] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  283.585867] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  283.596803] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  283.607738] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  283.620094] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  283.632457] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  283.643390] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  283.655216] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  283.666854] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  283.678411] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  283.690146] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> Disabling ONE_SLICE mode, tiling:0 numTile:1 CP:0 SliceDelivery:0 MultiSliceMode:0
[  283.704644] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH, Driver macro size = 23787008 vs FW HFI macro size = 2614784 vs FW golden buffer size = 1923072
[  283.723415] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723a008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_NON_COMV, Driver macro size = 274176 vs FW HFI macro size = 274432 vs FW golden buffer size = 274432
[  283.742809] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723a008:00> venc_c2Start(3860): Send HFI_CMD_START error response for port 1
[  283.755706] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723a008:00> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
[  283.768690] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723a008:00> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
[  283.781675] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723a008:00> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
[  283.794658] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723a008:00> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
[  283.807679] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
[  283.815686] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
[  283.816669] videobuf2_common: [cap-00000000cc711ce3] __vb2_wait_for_done_vb: Queue in error state, will not wait for buffers
[  283.823675] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
[  283.843267] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
[  283.854795] videobuf2_common: [out-0000000066975fcf] __vb2_wait_for_done_vb: Queue in error state, will not wait for buffers
[  283.866607] videobuf2_common: [out-0000000066975fcf] vb2_buffer_done: done processing on buffer 0, state: done
[  283.880173] videobuf2_common: [out-0000000066975fcf] vb2_buffer_done: done processing on buffer 1, state: done
[  283.891718] videobuf2_common: [out-0000000066975fcf] vb2_buffer_done: done processing on buffer 2, state: done
[  283.903227] videobuf2_common: [out-0000000066975fcf] vb2_buffer_done: done processing on buffer 3, state: done
[  283.917229] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 0000000079b61dc9
[  283.917231] __v4l2_m2m_try_queue: Aborted context
[  283.917236] v4l2_m2m_cancel_job: m2m_ctx 0000000079b61dc9 running, will wait to complete
[  283.917284] videobuf2_common: [cap-00000000cc711ce3] vb2_buffer_done: done processing on buffer 0, state: done
[  283.917286] v4l2_m2m_try_run: No job pending
[  283.927793] videobuf2_common: [cap-00000000cc711ce3] vb2_buffer_done: done processing on buffer 1, state: done
[  283.938108] videobuf2_common: [cap-00000000cc711ce3] vb2_buffer_done: done processing on buffer 2, state: done
[  283.948414] videobuf2_common: [cap-00000000cc711ce3] vb2_buffer_done: done processing on buffer 3, state: done
[  283.961022] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.961974] videobuf2_common: [cap-00000000cc711ce3] vb2_core_streamoff: successful
[  283.979434] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)
[  283.979503] videobuf2_common: [out-0000000066975fcf] vb2_core_streamoff: successful
[  283.997396] videobuf2_common: [cap-00000000cc711ce3] vb2_core_streamoff: successful
[  284.005569] videobuf2_common: [cap-00000000cc711ce3] __vb2_buf_mem_free: freed plane 0 of buffer 0
[  284.015022] videobuf2_common: [cap-00000000cc711ce3] __vb2_buf_mem_free: freed plane 0 of buffer 1
[  284.024455] videobuf2_common: [cap-00000000cc711ce3] __vb2_buf_mem_free: freed plane 0 of buffer 2
[  284.033965] videobuf2_common: [cap-00000000cc711ce3] __vb2_buf_mem_free: freed plane 0 of buffer 3
[  284.043215] videobuf2_common: [out-0000000066975fcf] vb2_core_streamoff: successful
[  284.051277] videobuf2_common: [out-0000000066975fcf] __vb2_buf_mem_free: freed plane 0 of buffer 0
[  284.060607] videobuf2_common: [out-0000000066975fcf] __vb2_buf_mem_free: freed plane 0 of buffer 1
[  284.069920] videobuf2_common: [out-0000000066975fcf] __vb2_buf_mem_free: freed plane 0 of buffer 2
[  284.079233] videobuf2_common: [out-0000000066975fcf] __vb2_buf_mem_free: freed plane 0 of buffer 3
[  284.088940] qcom-iris aa00000.video-codec: <VFW_H:HostDr:265e:a723a008:00> Current cmd contains 1 packet(s)


When encoding h264 I get:
720p:
[  435.812159] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_COLOR_FORMAT) --> 0x00000001
[  435.812163] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_RAW_RESOLUTION) --> 0x050002e0
[  435.812167] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  435.812171] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_LINEAR_STRIDE_SCANLINE) --> 0x050002e0
[  435.812176] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_SIGNAL_COLOR_INFO) --> 0x14000003
[  435.812179] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000004
[  435.812185] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000004
[  435.812189] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_LEVEL) --> 0x0000000e
[  435.812193] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_LEVEL) --> 0x0000000e
[  435.812196] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  435.812200] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  435.812205] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  435.812209] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  435.812212] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  435.812216] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  435.812220] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  435.812223] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_CABAC_SESSION) --> 0x00000001
[  435.812227] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_BITSTREAM_RESOLUTION) --> 0x050002d0
[  435.812231] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  435.812235] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:264e:a723c008:00> encC2SetEncodedFrameCropOffset(2766): Invalid Crop Offset: Right or Bottom is bigger than max offset 15
[  435.812239] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:264e:a723c008:00> venc_c2SetProperty(4438): Error in SetProperty HFI_PROP_CROP_OFFSETS
[  435.812243] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_FRAME_RATE) --> 0x001e0000
[  435.812247] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000004
[  435.812251] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000004
[  435.812254] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_LEVEL) --> 0x0000000e
[  435.812258] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_LEVEL) --> 0x0000000e
[  435.814198] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  435.814204] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  435.814209] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  435.814212] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  435.814216] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  435.814221] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  435.814224] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  435.814229] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_CABAC_SESSION) --> 0x00000001
[  435.814232] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> Disabling ONE_SLICE mode, tiling:0 numTile:1 CP:0 SliceDelivery:0 MultiSliceMode:0
[  435.814237] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH, Driver macro size = 9563648 vs FW HFI macro size = 7797248 vs FW golden buffer size = 5723136
[  435.814242] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_2, Driver macro size = 5804032 vs FW HFI macro size = 5804032 vs FW golden buffer size = 2899968
[  435.814246] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> LOAD_RESOURCES
[  435.814250] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_COMV, Driver macro size = 436224 vs FW HFI macro size = 436224 vs FW golden buffer size = 436224
[  435.814256] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_NON_COMV, Driver macro size = 392448 vs FW HFI macro size = 392448 vs FW golden buffer size = 159488
[  435.817008] qcom-iris aa00000.video-codec: <VFW_H:WrkDec:264e:a723c008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_LINE, Driver macro size = 509952 vs FW HFI macro size = 509952 vs FW golden buffer size = 93952
[  435.817020] qcom-iris aa00000.video-codec: <VFW_H:WrkDec:264e:a723c008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_LINE, Driver macro size = 509952 vs FW HFI macro size = 509952 vs FW golden buffer size = 93952

480p:
[  403.967554] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_COLOR_FORMAT) --> 0x00000001
[  403.967611] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_RAW_RESOLUTION) --> 0x028001e0
[  403.967614] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  403.967619] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_LINEAR_STRIDE_SCANLINE) --> 0x028001e0
[  403.967623] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723c008:00> SetProperty(HFI_PROP_SIGNAL_COLOR_INFO) --> 0x14000003
[  536.001357] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000004
[  536.001361] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x0000000e
[  536.001364] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x0000000e
[  536.001369] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  536.001372] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  536.001376] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  536.001380] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  536.001383] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  536.001387] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  536.001390] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  536.001393] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_CABAC_SESSION) --> 0x00000001
[  536.001397] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_BITSTREAM_RESOLUTION) --> 0x028001e0
[  536.001400] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  536.001404] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_FRAME_RATE) --> 0x001e0000
[  536.001408] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000004
[  536.001412] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000004
[  536.001415] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x0000000e
[  536.001419] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x0000000e
[  536.001423] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  536.001426] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  536.001430] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  536.001433] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  536.001437] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  536.001441] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  536.003117] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  536.003125] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> SetProperty(HFI_PROP_CABAC_SESSION) --> 0x00000001
[  536.003128] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> Disabling ONE_SLICE mode, tiling:0 numTile:1 CP:0 SliceDelivery:0 MultiSliceMode:0
[  536.003132] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH, Driver macro size = 23787008 vs FW HFI macro size = 2614784 vs FW golden buffer size = 1923072
[  536.003136] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_2, Driver macro size = 1921024 vs FW HFI macro size = 1921024 vs FW golden buffer size = 958464
[  536.003140] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> LOAD_RESOURCES
[  536.003143] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_COMV, Driver macro size = 147456 vs FW HFI macro size = 147456 vs FW golden buffer size = 147456
[  536.003148] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:a723e008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_NON_COMV, Driver macro size = 313856 vs FW HFI macro size = 313856 vs FW golden buffer size = 86784
[  536.004955] qcom-iris aa00000.video-codec: <VFW_H:WrkDec:264e:a723e008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_LINE, Driver macro size = 404992 vs FW HFI macro size = 404992 vs FW golden buffer size = 62976
[  536.005100] qcom-iris aa00000.video-codec: <VFW_H:VppDec:264e:a723e008:00> bOverride_C: 0 bOverride_D: 0 bOverride_E:0
[  536.005132] qcom-iris aa00000.video-codec: <VFW_H:VppDec:264e:a723e008:00> is_llc_set 0 SCID[0] 0 SCID[1] 0 core_id 0
[  536.005147] qcom-iris aa00000.video-codec: <VFW_H:WrkDec:264e:a723e008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_LINE, Driver macro size = 404992 vs FW HFI macro size = 404992 vs FW golden buffer size = 62976

1080p:
[  549.781449] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_COLOR_FORMAT) --> 0x00000001
[  549.781452] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_RAW_RESOLUTION) --> 0x07800440
[  549.781455] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  549.781459] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_LINEAR_STRIDE_SCANLINE) --> 0x07800440
[  549.781462] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_SIGNAL_COLOR_INFO) --> 0x14000003
[  549.781465] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000004
[  549.781468] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000004
[  549.781516] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_LEVEL) --> 0x0000000e
[  549.781520] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_LEVEL) --> 0x0000000e
[  549.781523] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  549.781527] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  549.781530] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  549.781533] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  549.781536] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  549.781539] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  549.781542] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  549.781545] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_CABAC_SESSION) --> 0x00000001
[  549.781548] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_BITSTREAM_RESOLUTION) --> 0x07800438
[  549.781554] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:264e:96bfa008:00> encC2SetEncodedFrameSize(2713): Invalid Bitstream Resolution: Width or Height has to be aligned to 16
[  549.781557] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:264e:96bfa008:00> venc_c2SetProperty(4449): Error in SetProperty HFI_PROP_BITSTREAM_RESOLUTION
[  549.781561] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  549.781564] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_FRAME_RATE) --> 0x001e0000
[  549.781567] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000004
[  549.781570] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000004
[  549.781573] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_LEVEL) --> 0x0000000e
[  549.781576] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_LEVEL) --> 0x0000000e
[  549.781579] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  549.781583] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  549.781586] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  549.781589] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  549.781593] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  549.781596] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  549.781599] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  549.781602] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> SetProperty(HFI_PROP_CABAC_SESSION) --> 0x00000001
[  549.782951] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> Disabling ONE_SLICE mode, tiling:0 numTile:1 CP:0 SliceDelivery:0 MultiSliceMode:0
[  549.782954] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> VPSS Internal Buffer is not set, Disabling support for DS/Blur + DynamicFlip
[  549.782958] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH, Driver macro size = 21479936 vs FW HFI macro size = 7797248 vs FW golden buffer size = 5723136
[  549.782962] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_2, Driver macro size = 12636160 vs FW HFI macro size = 5804032 vs FW golden buffer size = 2899968
[  549.782966] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> LOAD_RESOURCES
[  549.782969] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_COMV, Driver macro size = 983040 vs FW HFI macro size = 436224 vs FW golden buffer size = 436224
[  549.782973] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:264e:96bfa008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_NON_COMV, Driver macro size = 542720 vs FW HFI macro size = 392448 vs FW golden buffer size = 159488
[  549.784705] qcom-iris aa00000.video-codec: <VFW_H:WrkDec:264e:96bfa008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_LINE, Driver macro size = 628224 vs FW HFI macro size = 509952 vs FW golden buffer size = 186624
[  549.784723] qcom-iris aa00000.video-codec: <VFW_H:WrkDec:264e:96bfa008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_LINE, Driver macro size = 628224 vs FW HFI macro size = 509952 vs FW golden buffer size = 186624
=> works but I get a 720p stream

If I revert the align, I still get errors for 720p ans 480p but 1080p "works" but generates a 720p stream:
720:
[  461.154790] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_COLOR_FORMAT) --> 0x00000001
[  461.154793] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_RAW_RESOLUTION) --> 0x028001e0
[  461.154797] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  461.154800] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_LINEAR_STRIDE_SCANLINE) --> 0x028001e0
[  461.154804] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_SIGNAL_COLOR_INFO) --> 0x14000003
[  461.154807] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  461.154810] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  461.154814] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  461.154817] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  461.154820] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  461.154823] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  461.154869] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  461.154873] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  461.154876] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  461.154880] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  461.154884] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  461.154887] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_BITSTREAM_RESOLUTION) --> 0x028001e0
[  461.154891] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  461.154894] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_FRAME_RATE) --> 0x001e0000
[  461.154897] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  461.154900] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  461.154903] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  461.154906] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  461.154910] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  461.154913] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  461.154916] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  461.154919] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  461.154923] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  461.154926] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  461.154929] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  461.156113] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> Disabling ONE_SLICE mode, tiling:0 numTile:1 CP:0 SliceDelivery:0 MultiSliceMode:0
[  461.156117] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH, Driver macro size = 23787008 vs FW HFI macro size = 2614784 vs FW golden buffer size = 1923072
[  461.156120] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_NON_COMV, Driver macro size = 274176 vs FW HFI macro size = 274432 vs FW golden buffer size = 274432
[  461.156124] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a3f7e008:00> venc_c2Start(3860): Send HFI_CMD_START error response for port 1

480:
[  461.154790] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_COLOR_FORMAT) --> 0x00000001
[  461.154793] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_RAW_RESOLUTION) --> 0x028001e0
[  461.154797] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  461.154800] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_LINEAR_STRIDE_SCANLINE) --> 0x028001e0
[  461.154804] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_SIGNAL_COLOR_INFO) --> 0x14000003
[  461.154807] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  461.154810] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  461.154814] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  461.154817] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  461.154820] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  461.154823] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  461.154869] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  461.154873] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  461.154876] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  461.154880] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  461.154884] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  461.154887] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_BITSTREAM_RESOLUTION) --> 0x028001e0
[  461.154891] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  461.154894] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_FRAME_RATE) --> 0x001e0000
[  461.154897] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  461.154900] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  461.154903] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  461.154906] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  461.154910] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  461.154913] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  461.154916] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  461.154919] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  461.154923] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  461.154926] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  461.154929] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  461.156113] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> Disabling ONE_SLICE mode, tiling:0 numTile:1 CP:0 SliceDelivery:0 MultiSliceMode:0
[  461.156117] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH, Driver macro size = 23787008 vs FW HFI macro size = 2614784 vs FW golden buffer size = 1923072
[  461.156120] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a3f7e008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_NON_COMV, Driver macro size = 274176 vs FW HFI macro size = 274432 vs FW golden buffer size = 274432
[  461.156124] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a3f7e008:00> venc_c2Start(3860): Send HFI_CMD_START error response for port 1

1080p:
[  412.129203] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_COLOR_FORMAT) --> 0x00000001
[  412.129220] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_RAW_RESOLUTION) --> 0x07800440
[  412.129237] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  412.129255] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_LINEAR_STRIDE_SCANLINE) --> 0x07800440
[  412.129272] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_SIGNAL_COLOR_INFO) --> 0x14000003
[  412.129288] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  412.129304] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  412.129319] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  412.129335] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  412.129351] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  412.129369] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  412.129386] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  412.129403] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  412.129421] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  412.129439] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  412.129457] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  412.129716] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_BITSTREAM_RESOLUTION) --> 0x07800438
[  412.129735] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:9b15c008:00> encC2SetEncodedFrameSize(2713): Invalid Bitstream Resolution: Width or Height has to be aligned to 32
[  412.129754] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:9b15c008:00> venc_c2SetProperty(4449): Error in SetProperty HFI_PROP_BITSTREAM_RESOLUTION
[  412.129772] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_CROP_OFFSETS) --> 0x00000000
[  412.129789] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_FRAME_RATE) --> 0x001e0000
[  412.129806] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  412.129824] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_PROFILE) --> 0x00000000
[  412.129840] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  412.129857] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_LEVEL) --> 0x00000007
[  412.129873] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  412.129890] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_BUFFER_HOST_MAX_COUNT) --> 0x00000040
[  412.129908] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_STAGE) --> 0x00000002
[  412.129925] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_SEQ_HEADER_MODE) --> 0x00000002
[  412.129943] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_TOTAL_BITRATE) --> 0x01312d00
[  412.129960] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_RATE_CONTROL) --> 0x00000000
[  412.129976] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
[  412.133012] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> Disabling ONE_SLICE mode, tiling:0 numTile:1 CP:0 SliceDelivery:0 MultiSliceMode:0
[  412.133028] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> VPSS Internal Buffer is not set, Disabling support for DS/Blur + DynamicFlip
[  412.133047] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH, Driver macro size = 21479936 vs FW HFI macro size = 7953920 vs FW golden buffer size = 5833728
[  412.133065] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_2, Driver macro size = 12636160 vs FW HFI macro size = 5804032 vs FW golden buffer size = 2899968
[  412.133083] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> LOAD_RESOURCES
[  412.133098] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_COMV, Driver macro size = 458752 vs FW HFI macro size = 206336 vs FW golden buffer size = 206336
[  412.133116] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:9b15c008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_NON_COMV, Driver macro size = 345344 vs FW HFI macro size = 299264 vs FW golden buffer size = 80640
[  412.133170] qcom-iris aa00000.video-codec: <VFW_H:WrkDec:265e:9b15c008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_LINE, Driver macro size = 617472 vs FW HFI macro size = 500736 vs FW golden buffer size = 177152
[  412.134723] qcom-iris aa00000.video-codec: <VFW_H:WrkDec:265e:9b15c008:00> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_LINE, Driver macro size = 617472 vs FW HFI macro size = 500736 vs FW golden buffer size = 177152
=> works but I get a 720p stream

The 1080p encoding probably works because I provide buffers sized for 1080p but it encodes 720p in reality ?

Thanks,
Neil

> 
> Thanks,
> Dikshita


