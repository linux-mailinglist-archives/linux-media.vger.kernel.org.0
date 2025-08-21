Return-Path: <linux-media+bounces-40576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C07B2F912
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35B947A3A14
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86E231DD94;
	Thu, 21 Aug 2025 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZ0KAYCh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C19530BF65
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781101; cv=none; b=OLhqR8wnRVfMBy333CUJwUfxEQDc++NElD2mQ5D7EYuCaiipnbcH4srjmAYMOxcXG6FJnAcy+zrcTQyFahcwbBY1FNmJtJa8ckYAidvZaSPi5r/W/z63c4muQdllUXcCQhDTulDpiHmZVRkD5mINWykJSboiTlvRC87nT1wkqnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781101; c=relaxed/simple;
	bh=3Hn8HFnUaXJ7/UF543cRYQTw2Uhi0U9cWrR7VRM4ViE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Lf4cvPvX1TDk2IIHIowRLXmmDFrDquztl0JnzN40Tc3m1jiH3A8W7/2F4ZbV1cEUQMMwdk9o8z1Niv2ctf5u8/cxbzdrJXysKNe5bc0tGWq/mD6NrLDxdMeLUuXNhFqbu5m6QV6qfzl666tZhHatT9y828FBpt+Yq36L1RzOrnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VZ0KAYCh; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9d41c1149so573062f8f.0
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 05:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755781094; x=1756385894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeMt1BGo0WA+9/iHl/fwQyOYlP1f6dimmiwHvNIKq/0=;
        b=VZ0KAYChlx26DW/+YDDso1EfvI3gyn520r5GPEA6FQ/BAAQu7Tr01xJU11N0MbGbMJ
         kYyfCPIRn7NF1nvGBUtjF6Fv9BCdKU8zSarY9cE5ZkaH2H+1MOnu7sDHXCYuRLY8cuL8
         c81jYcd+8tT6ZFidxY9cOfZsEu2acSudNQQbJmAfJgzdoyugR2NpnwF9DRxS7rqnSyOP
         qKWSc+8VnAh+hPArNxZ/w229wK/lsnn9VRg5KyIChGfCtjfv9fWPxzLaz2VvAk+xLY8g
         lNPRdAmLZ8sI6Hrz/DLPNXxMGeZEBpu4NyVtU9lzCyQs+g9B9OUyE5VPT3Ci0+n58Hki
         2R4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755781094; x=1756385894;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TeMt1BGo0WA+9/iHl/fwQyOYlP1f6dimmiwHvNIKq/0=;
        b=s8RJwtvYY33WU0XAg4FP+3AjQN59SoTUzg3iItxjOKlgwnaQGKvDfMJkZZT+dGWY6w
         w/r16UoLWnVbOaSSDKpWOMrz7YpfV+P8krlpwtB2+QR0qYOSnJ+Ffid9Uwqw+Pgr/fIv
         idsFhFR6vVxve4Odi1J9X4m7djYOXXNsnbh0WdPQv623ST5/C80O6tVO6BTXg4MDFGVc
         2jDIZychaHm6iTdTZPz1tnL8+3dGm7aFKC3FLeSG3qwpR1NdtQt97KzTW9iFxL/U5TV3
         zDLkuB+Onn/kwyLXwHDn3AvZciNRC+/SAZhCumgjUBMiM9krnstkrfMLcQcy/fGRjayX
         DDFg==
X-Gm-Message-State: AOJu0YzeZuaemCdLBBUf0Xopud6MIbC97m81h05JJGAgElpvtUrIYOY5
	3Egzw/IXpZ+Y0ACBZJh5w72Xvv+0pGIpe215l88liZgPbZ9oiFNznRmhwZK16bvTZwY=
X-Gm-Gg: ASbGnctB2r7cXfaly4hQgqvRkgiHBf9D1aXt1OxHXaHbrN/NFZKL7DEqY687MivX26w
	vbBFNAA7QOXKJTuvZC+lu8t2WIRXCiD8ooY60X1nLOhpPub8W/zbUXJ4V6/a6UXq9Hr2+Cfd6HI
	5NQsGmC2aK2/EMrz+IapCOgcgXeW5qtujT10A5jGocXVQsnmucFVOsHNSS6rVrf+FOvbHag68yS
	enbos5RCoCV+/He+Z/8zLixmsXN+jIX3whhZO+AcDri/6UR8xImG3IegU4xOWBjCviv7BBsjZWy
	4Hc2hmbgrzjL02ol/LwLDoir9ftTx2c06K96tpV0rgSLkbWr7XPlhzuzGvJiPp9Q4fXL3xMsu4M
	JB1/vtzVo+6+e0J7IsMbZatmeaUW7xNMU5v0kwNmcZyaZkqcy7xNGuILjOLJygxBCHtaJi4bBuC
	I=
X-Google-Smtp-Source: AGHT+IEuTK2f8puvCZe97F2KI+cnfg0TafNFpHlIINUMSL1+pq6dHG/QBtIZc3qOg6Tn7M5hn2A8aQ==
X-Received: by 2002:a05:6000:2012:b0:3b7:5dda:d57 with SMTP id ffacd0b85a97d-3c49736a4f3mr1800618f8f.50.1755781094068;
        Thu, 21 Aug 2025 05:58:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:443c:3616:7f17:f26d? ([2a01:e0a:3d9:2080:443c:3616:7f17:f26d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c19fbsm11686722f8f.41.2025.08.21.05.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 05:58:13 -0700 (PDT)
Message-ID: <19f844ee-da08-4497-a4f7-c90d45554534@linaro.org>
Date: Thu, 21 Aug 2025 14:58:12 +0200
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
In-Reply-To: <38d56655-cfea-ef3d-46ff-a77d81e35297@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/08/2025 09:21, Dikshita Agarwal wrote:
> 
> 
> On 8/20/2025 8:29 PM, Neil Armstrong wrote:
>> Hi,
>>
>> On 20/08/2025 11:07, Dikshita Agarwal wrote:
>>> Hi All,
>>>
>>> This patch series adds support for H.264 and H.265 encoder in iris
>>> driver and includes a few fixes and cleanup in the common code that were
>>> identified during encoder bring-up process.
>>>
>>> The changes include:
>>> - Enabling support for H.264 and H.265 encoding.
>>> - Fixes and improvements in shared componenets used by both encoder and
>>> decoder paths.
>>> - Ensuring compatibility and stability with the existing decoder flow.
>>>
>>> Changes in v3:
>>> - Fixed the log when destroying the interanl buffers (Jorge)
>>> - Updated commit text with issue details in patch 05/25 (Krzysztof)
>>> - Added a patch to simplify conditional logic in stop handling for hfi
>>> gen1 (Bryan)
>>> - Reduced duplicate code while registering video devices (Bryan)
>>> - Added a fix for try fmt handling in decoder (Self)
>>> - Fixed the value of max core mbps for qcs8300 (Vikash)
>>> - Simplied the frame rate handling in driver by using non q16 format and
>>> converted to q16 when setting to firmware (Vikash)
>>> - Fixed the issue with bitstream resolution setting to firmware (Neil)
>>> - Addressed other review comments (Vikash, Bryan)
>>> - Link to v2:
>>> https://lore.kernel.org/r/20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com
>>>
>>> Changes in v2:
>>> - Fixed sparse/coccinnelle issues.
>>> - Fixed the kernel doc warning.
>>> - Removed unsupported PEAK_BITRATE property from SM8250.
>>> - Dropped patch 04/25 to fix quality issue with encoder.
>>> - Enhanced command handling for encoder to allow start/stop commands.
>>> - Expanded rate control condition checks to include additional rate
>>>     control types for HFI Gen2.
>>> - Updated default value to MAX_QP for all caps related to max QP settings.
>>> - Add support for INPUT/OUTPUT_BUF_HOST_MAX_COUNT caps for encoder.
>>> - Link to v1:
>>> https://lore.kernel.org/r/20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com
>>>
>>> All patches have been tested with v4l2-compliance, v4l2-ctl and
>>> Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured
>>> that the existing decoder functionality remains uneffected.
>>>
>>> Commands used for V4l2-ctl validation:
>>>
>>> v4l2-ctl --verbose
>>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>>> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
>>> --stream-from=/media/cyclists_1280x720_92frames.yuv
>>> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
>>>
>>> v4l2-ctl --verbose
>>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>>> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
>>> --stream-from=/media/cyclists_1280x720_92frames.yuv
>>> --stream-to=/tmp/cyclists_1280x720_92frames.hevc -d /dev/video1
>>
>> - I've tested this serie on SM8650, first I failed to get HEVC working with
>> the following command:
>>
>> v4l2-ctl --verbose
>> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12
>> --set-selection-output target=crop,top=0,left=0,width=1920,height=1080
>> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
>> --stream-from=Big_Buck_Bunny_1080_10s.yuv
>> --stream-to=Big_Buck_Bunny_1080_10s.hevc -d /dev/video1
>>
>> I got:
>> qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
>>
>> I checked the diff with v2, and reverting this make HEVC encoding work again:
> 
> This is strange, we don't see any such issue on SM8550.
> Could you pls share the full logs.

I tried again with a 720p stream with your exact command line from the cover letter
and it still fails with HEVC:
$ v4l2-ctl --verbose --set-fmt-video-out=width=1280,height=720,pixelformat=NV12 --set-selection-output target=crop,top=0,left=0,width=1280,height=720 --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap --stream-from=Big_Buck_Bunny_720_10s.yuv --stream-to=Big_Buck_Bunny_720_10s.hevc -d /dev/video1
VIDIOC_QUERYCAP: ok
VIDIOC_G_FMT: ok
VIDIOC_S_FMT: ok
Format Video Capture Multiplanar:
	Width/Height      : 320/240
	Pixel Format      : 'HEVC' (HEVC)
	Field             : None
	Number of planes  : 1
	Flags             :
	Colorspace        : Default
	Transfer Function : Default
	YCbCr/HSV Encoding: Default
	Quantization      : Default
	Plane 0           :
	   Bytes per Line : 0
	   Size Image     : 245760
VIDIOC_G_FMT: ok
VIDIOC_S_FMT: ok
Format Video Output Multiplanar:
	Width/Height      : 1280/736
	Pixel Format      : 'NV12' (Y/UV 4:2:0)
	Field             : None
	Number of planes  : 1
	Flags             :
	Colorspace        : Default
	Transfer Function : Default
	YCbCr/HSV Encoding: Default
	Quantization      : Default
	Plane 0           :
	   Bytes per Line : 1280
	   Size Image     : 1413120
VIDIOC_G_SELECTION: ok
VIDIOC_S_SELECTION: ok
		VIDIOC_G_FMT returned 0 (Success)
		VIDIOC_G_FMT returned 0 (Success)
		VIDIOC_G_FMT returned 0 (Success)
		VIDIOC_REQBUFS returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_G_FMT returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_G_FMT returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_G_FMT returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_G_FMT returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_G_FMT returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_STREAMON returned 0 (Success)
VIDIOC_G_FMT: ok
VIDIOC_DQBUF: failed: Input/output error
out dqbuf: 0 seq:      0 bytesused: 0 ts: 0.000000 field: Any
VIDIOC_DQBUF: failed: Input/output error

DMESG:
[  370.390568] videobuf2_common: [out-0000000057b84b86] vb2_core_reqbufs: call_qop(queue_setup)
[  370.390585] qcom-iris aa00000.video-codec: state changed from 1 to 1
[  370.390591] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_alloc: call_memop(0, alloc)
[  370.390742] videobuf2_common: [out-0000000057b84b86] __setup_offsets: buffer 0, plane 0 offset 0x00000000
[  370.390746] videobuf2_common: [out-0000000057b84b86] __vb2_queue_alloc: call_vb_qop(0, buf_init)
[  370.390749] videobuf2_common: [out-0000000057b84b86] vb2_plane_cookie: call_memop(0, cookie)
[  370.390752] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_alloc: call_memop(1, alloc)
[  370.390911] videobuf2_common: [out-0000000057b84b86] __setup_offsets: buffer 1, plane 0 offset 0x00008000
[  370.390913] videobuf2_common: [out-0000000057b84b86] __vb2_queue_alloc: call_vb_qop(1, buf_init)
[  370.390915] videobuf2_common: [out-0000000057b84b86] vb2_plane_cookie: call_memop(1, cookie)
[  370.390918] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_alloc: call_memop(2, alloc)
[  370.391139] videobuf2_common: [out-0000000057b84b86] __setup_offsets: buffer 2, plane 0 offset 0x00010000
[  370.391141] videobuf2_common: [out-0000000057b84b86] __vb2_queue_alloc: call_vb_qop(2, buf_init)
[  370.391143] videobuf2_common: [out-0000000057b84b86] vb2_plane_cookie: call_memop(2, cookie)
[  370.391145] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_alloc: call_memop(3, alloc)
[  370.391293] videobuf2_common: [out-0000000057b84b86] __setup_offsets: buffer 3, plane 0 offset 0x00018000
[  370.391296] videobuf2_common: [out-0000000057b84b86] __vb2_queue_alloc: call_vb_qop(3, buf_init)
[  370.391297] videobuf2_common: [out-0000000057b84b86] vb2_plane_cookie: call_memop(3, cookie)
[  370.391299] videobuf2_common: [out-0000000057b84b86] __vb2_queue_alloc: allocated 4 buffers, 1 plane(s) each
[  370.391363] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(0, num_users)
[  370.391418] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(1, num_users)
[  370.391470] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(2, num_users)
[  370.391522] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(3, num_users)
[  370.391584] videobuf2_common: [out-0000000057b84b86] vb2_mmap: call_memop(0, mmap)
[  370.391638] vb2_common_vm_open: 00000000210e3729, refcount: 1, vma: ffff96927000-ffff96a80000
[  370.391642] vb2_dc_mmap: mapped dma addr 0xdfa00000 at 0xffff96927000, size 1413120
[  370.391646] videobuf2_common: [out-0000000057b84b86] vb2_mmap: buffer 0, plane 0 successfully mapped
[  370.391656] videobuf2_common: [out-0000000057b84b86] vb2_mmap: call_memop(1, mmap)
[  370.391701] vb2_common_vm_open: 0000000076540d0f, refcount: 1, vma: ffff967ce000-ffff96927000
[  370.391704] vb2_dc_mmap: mapped dma addr 0xdf800000 at 0xffff967ce000, size 1413120
[  370.391706] videobuf2_common: [out-0000000057b84b86] vb2_mmap: buffer 1, plane 0 successfully mapped
[  370.391716] videobuf2_common: [out-0000000057b84b86] vb2_mmap: call_memop(2, mmap)
[  370.391759] vb2_common_vm_open: 00000000fe5c7906, refcount: 1, vma: ffff96675000-ffff967ce000
[  370.391761] vb2_dc_mmap: mapped dma addr 0xdf600000 at 0xffff96675000, size 1413120
[  370.391763] videobuf2_common: [out-0000000057b84b86] vb2_mmap: buffer 2, plane 0 successfully mapped
[  370.391768] videobuf2_common: [out-0000000057b84b86] vb2_mmap: call_memop(3, mmap)
[  370.391812] vb2_common_vm_open: 000000006a194006, refcount: 1, vma: ffff9651c000-ffff96675000
[  370.391814] vb2_dc_mmap: mapped dma addr 0xdf400000 at 0xffff9651c000, size 1413120
[  370.391816] videobuf2_common: [out-0000000057b84b86] vb2_mmap: buffer 3, plane 0 successfully mapped
[  370.392050] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(0, num_users)
[  370.393015] videobuf2_common: [out-0000000057b84b86] __buf_prepare: call_vb_qop(0, buf_out_validate)
[  370.393021] videobuf2_common: [out-0000000057b84b86] __prepare_mmap: call_vb_qop(0, buf_prepare)
[  370.393024] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_prepare: call_memop(0, prepare)
[  370.393027] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(0, num_users)
[  370.393030] videobuf2_common: [out-0000000057b84b86] vb2_core_qbuf: qbuf of buffer 0 succeeded
[  370.393033] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000da2be142
[  370.393037] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  370.393039] v4l2_m2m_try_run: No job pending
[  370.393098] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(1, num_users)
[  370.393715] videobuf2_common: [out-0000000057b84b86] __buf_prepare: call_vb_qop(1, buf_out_validate)
[  370.393720] videobuf2_common: [out-0000000057b84b86] __prepare_mmap: call_vb_qop(1, buf_prepare)
[  370.393723] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_prepare: call_memop(1, prepare)
[  370.393725] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(1, num_users)
[  370.393728] videobuf2_common: [out-0000000057b84b86] vb2_core_qbuf: qbuf of buffer 1 succeeded
[  370.393730] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000da2be142
[  370.393733] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  370.393735] v4l2_m2m_try_run: No job pending
[  370.393792] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(2, num_users)
[  370.394421] videobuf2_common: [out-0000000057b84b86] __buf_prepare: call_vb_qop(2, buf_out_validate)
[  370.394425] videobuf2_common: [out-0000000057b84b86] __prepare_mmap: call_vb_qop(2, buf_prepare)
[  370.394427] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_prepare: call_memop(2, prepare)
[  370.394430] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(2, num_users)
[  370.394432] videobuf2_common: [out-0000000057b84b86] vb2_core_qbuf: qbuf of buffer 2 succeeded
[  370.394435] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000da2be142
[  370.394437] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  370.394439] v4l2_m2m_try_run: No job pending
[  370.394496] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(3, num_users)
[  370.395199] videobuf2_common: [out-0000000057b84b86] __buf_prepare: call_vb_qop(3, buf_out_validate)
[  370.395203] videobuf2_common: [out-0000000057b84b86] __prepare_mmap: call_vb_qop(3, buf_prepare)
[  370.395205] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_prepare: call_memop(3, prepare)
[  370.395208] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(3, num_users)
[  370.395210] videobuf2_common: [out-0000000057b84b86] vb2_core_qbuf: qbuf of buffer 3 succeeded
[  370.395212] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000da2be142
[  370.395214] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  370.395216] v4l2_m2m_try_run: No job pending
[  370.395273] videobuf2_common: [out-0000000057b84b86] vb2_core_streamon: call_qop(prepare_streaming) (nop)
[  370.395277] videobuf2_common: [out-0000000057b84b86] __enqueue_in_driver: call_vb_qop(0, buf_queue)
[  370.395280] videobuf2_common: [out-0000000057b84b86] __enqueue_in_driver: call_vb_qop(1, buf_queue)
[  370.395282] videobuf2_common: [out-0000000057b84b86] __enqueue_in_driver: call_vb_qop(2, buf_queue)
[  370.395285] videobuf2_common: [out-0000000057b84b86] __enqueue_in_driver: call_vb_qop(3, buf_queue)
[  370.395287] videobuf2_common: [out-0000000057b84b86] vb2_start_streaming: call_qop(start_streaming)
[  370.396462] qcom-iris aa00000.video-codec: state changed from 2 to 2
[  370.396469] videobuf2_common: [out-0000000057b84b86] vb2_core_streamon: successful
[  370.396473] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000da2be142
[  370.396475] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  370.396477] v4l2_m2m_try_run: No job pending
[  370.396583] videobuf2_common: [cap-00000000e59a888f] vb2_core_streamoff: successful
[  370.396629] videobuf2_common: [cap-00000000e59a888f] vb2_core_reqbufs: call_qop(queue_setup)
[  370.396633] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_alloc: call_memop(0, alloc)
[  370.396691] videobuf2_common: [cap-00000000e59a888f] __setup_offsets: buffer 0, plane 0 offset 0x00000000
[  370.396694] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_alloc: call_vb_qop(0, buf_init)
[  370.396696] videobuf2_common: [cap-00000000e59a888f] vb2_plane_cookie: call_memop(0, cookie)
[  370.396699] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_alloc: call_memop(1, alloc)
[  370.396746] videobuf2_common: [cap-00000000e59a888f] __setup_offsets: buffer 1, plane 0 offset 0x00008000
[  370.396748] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_alloc: call_vb_qop(1, buf_init)
[  370.396750] videobuf2_common: [cap-00000000e59a888f] vb2_plane_cookie: call_memop(1, cookie)
[  370.396752] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_alloc: call_memop(2, alloc)
[  370.396809] videobuf2_common: [cap-00000000e59a888f] __setup_offsets: buffer 2, plane 0 offset 0x00010000
[  370.396811] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_alloc: call_vb_qop(2, buf_init)
[  370.396813] videobuf2_common: [cap-00000000e59a888f] vb2_plane_cookie: call_memop(2, cookie)
[  370.396814] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_alloc: call_memop(3, alloc)
[  370.396884] videobuf2_common: [cap-00000000e59a888f] __setup_offsets: buffer 3, plane 0 offset 0x00018000
[  370.396886] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_alloc: call_vb_qop(3, buf_init)
[  370.396888] videobuf2_common: [cap-00000000e59a888f] vb2_plane_cookie: call_memop(3, cookie)
[  370.396889] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_alloc: allocated 4 buffers, 1 plane(s) each
[  370.396896] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_in_use: call_memop(0, num_users)
[  370.396899] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_in_use: call_memop(1, num_users)
[  370.396902] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_in_use: call_memop(2, num_users)
[  370.396904] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_in_use: call_memop(3, num_users)
[  370.396919] videobuf2_common: [cap-00000000e59a888f] vb2_mmap: call_memop(0, mmap)
[  370.396945] vb2_common_vm_open: 0000000095b56358, refcount: 1, vma: ffff9646f000-ffff9651c000
[  370.396948] vb2_dc_mmap: mapped dma addr 0xdf300000 at 0xffff9646f000, size 708608
[  370.396951] videobuf2_common: [cap-00000000e59a888f] vb2_mmap: buffer 0, plane 0 successfully mapped
[  370.396960] videobuf2_common: [cap-00000000e59a888f] vb2_mmap: call_memop(1, mmap)
[  370.396984] vb2_common_vm_open: 000000005cf693ed, refcount: 1, vma: ffff963c2000-ffff9646f000
[  370.396987] vb2_dc_mmap: mapped dma addr 0xdf200000 at 0xffff963c2000, size 708608
[  370.396989] videobuf2_common: [cap-00000000e59a888f] vb2_mmap: buffer 1, plane 0 successfully mapped
[  370.396994] videobuf2_common: [cap-00000000e59a888f] vb2_mmap: call_memop(2, mmap)
[  370.397018] vb2_common_vm_open: 000000000fb3f862, refcount: 1, vma: ffff96315000-ffff963c2000
[  370.397020] vb2_dc_mmap: mapped dma addr 0xdf100000 at 0xffff96315000, size 708608
[  370.397022] videobuf2_common: [cap-00000000e59a888f] vb2_mmap: buffer 2, plane 0 successfully mapped
[  370.397027] videobuf2_common: [cap-00000000e59a888f] vb2_mmap: call_memop(3, mmap)
[  370.397048] vb2_common_vm_open: 00000000112d3450, refcount: 1, vma: ffff96268000-ffff96315000
[  370.397051] vb2_dc_mmap: mapped dma addr 0xdf000000 at 0xffff96268000, size 708608
[  370.397053] videobuf2_common: [cap-00000000e59a888f] vb2_mmap: buffer 3, plane 0 successfully mapped
[  370.397060] videobuf2_common: [cap-00000000e59a888f] __prepare_mmap: call_vb_qop(0, buf_prepare)
[  370.397062] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_prepare: call_memop(0, prepare)
[  370.397065] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_in_use: call_memop(0, num_users)
[  370.397067] videobuf2_common: [cap-00000000e59a888f] vb2_core_qbuf: qbuf of buffer 0 succeeded
[  370.397069] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000da2be142
[  370.397071] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  370.397072] v4l2_m2m_try_run: No job pending
[  370.397075] videobuf2_common: [cap-00000000e59a888f] __prepare_mmap: call_vb_qop(1, buf_prepare)
[  370.397077] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_prepare: call_memop(1, prepare)
[  370.397079] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_in_use: call_memop(1, num_users)
[  370.397080] videobuf2_common: [cap-00000000e59a888f] vb2_core_qbuf: qbuf of buffer 1 succeeded
[  370.397082] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000da2be142
[  370.397084] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  370.397085] v4l2_m2m_try_run: No job pending
[  370.397087] videobuf2_common: [cap-00000000e59a888f] __prepare_mmap: call_vb_qop(2, buf_prepare)
[  370.397089] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_prepare: call_memop(2, prepare)
[  370.397090] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_in_use: call_memop(2, num_users)
[  370.397092] videobuf2_common: [cap-00000000e59a888f] vb2_core_qbuf: qbuf of buffer 2 succeeded
[  370.397094] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000da2be142
[  370.397095] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  370.397096] v4l2_m2m_try_run: No job pending
[  370.397099] videobuf2_common: [cap-00000000e59a888f] __prepare_mmap: call_vb_qop(3, buf_prepare)
[  370.397100] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_prepare: call_memop(3, prepare)
[  370.397102] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_in_use: call_memop(3, num_users)
[  370.397103] videobuf2_common: [cap-00000000e59a888f] vb2_core_qbuf: qbuf of buffer 3 succeeded
[  370.397105] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000da2be142
[  370.397106] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[  370.397108] v4l2_m2m_try_run: No job pending
[  370.397110] videobuf2_common: [cap-00000000e59a888f] vb2_core_streamon: call_qop(prepare_streaming) (nop)
[  370.397113] videobuf2_common: [cap-00000000e59a888f] __enqueue_in_driver: call_vb_qop(0, buf_queue)
[  370.397115] videobuf2_common: [cap-00000000e59a888f] __enqueue_in_driver: call_vb_qop(1, buf_queue)
[  370.397117] videobuf2_common: [cap-00000000e59a888f] __enqueue_in_driver: call_vb_qop(2, buf_queue)
[  370.397118] videobuf2_common: [cap-00000000e59a888f] __enqueue_in_driver: call_vb_qop(3, buf_queue)
[  370.397120] videobuf2_common: [cap-00000000e59a888f] vb2_start_streaming: call_qop(start_streaming)
[  370.397978] qcom-iris aa00000.video-codec: state changed from 4 to 4
[  370.397998] videobuf2_common: [cap-00000000e59a888f] vb2_core_streamon: successful
[  370.398001] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000da2be142
[  370.398003] v4l2_m2m_try_run: Running job on m2m_ctx: 00000000da2be142
[  370.398609] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
[  370.398674] qcom-iris aa00000.video-codec: state changed from 5 to 5
[  370.398687] videobuf2_common: [cap-00000000e59a888f] __vb2_wait_for_done_vb: Queue in error state, will not wait for buffers
[  370.398695] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
[  370.398716] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
[  370.398732] videobuf2_common: [out-0000000057b84b86] __vb2_wait_for_done_vb: Queue in error state, will not wait for buffers
[  370.398735] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
[  370.398763] videobuf2_common: [out-0000000057b84b86] vb2_buffer_done: done processing on buffer 0, state: done
[  370.398781] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_finish: call_memop(0, finish)
[  370.398805] videobuf2_common: [out-0000000057b84b86] vb2_buffer_done: done processing on buffer 1, state: done
[  370.398821] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_finish: call_memop(1, finish)
[  370.398843] videobuf2_common: [out-0000000057b84b86] vb2_buffer_done: done processing on buffer 2, state: done
[  370.398857] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_finish: call_memop(2, finish)
[  370.398875] videobuf2_common: [out-0000000057b84b86] vb2_buffer_done: done processing on buffer 3, state: done
[  370.398890] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_finish: call_memop(3, finish)
[  370.398909] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_done: done processing on buffer 0, state: done
[  370.398923] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_finish: call_memop(0, finish)
[  370.398929] __v4l2_m2m_try_queue: Trying to schedule a job for m2m_ctx: 00000000da2be142
[  370.398933] __v4l2_m2m_try_queue: Aborted context
[  370.398942] v4l2_m2m_cancel_job: m2m_ctx 00000000da2be142 running, will wait to complete
[  370.398940] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_done: done processing on buffer 1, state: done
[  370.398946] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_cancel: call_qop(stop_streaming)
[  370.398954] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_finish: call_memop(1, finish)
[  370.398979] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_done: done processing on buffer 2, state: done
[  370.398983] v4l2_m2m_try_run: No job pending
[  370.398996] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_finish: call_memop(2, finish)
[  370.399015] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_done: done processing on buffer 3, state: done
[  370.399029] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_finish: call_memop(3, finish)
[  370.401090] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_cancel: call_qop(unprepare_streaming) (nop)
[  370.401094] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_cancel: call_vb_qop(0, buf_finish) (nop)
[  370.401098] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_cancel: call_vb_qop(1, buf_finish) (nop)
[  370.401100] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_cancel: call_vb_qop(2, buf_finish) (nop)
[  370.401103] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_cancel: call_vb_qop(3, buf_finish) (nop)
[  370.401105] videobuf2_common: [cap-00000000e59a888f] vb2_core_streamoff: successful
[  370.401110] videobuf2_common: [out-0000000057b84b86] __vb2_queue_cancel: call_qop(stop_streaming)
[  370.401357] videobuf2_common: [out-0000000057b84b86] __vb2_queue_cancel: call_qop(unprepare_streaming) (nop)
[  370.401361] videobuf2_common: [out-0000000057b84b86] __vb2_queue_cancel: call_vb_qop(0, buf_finish) (nop)
[  370.401363] videobuf2_common: [out-0000000057b84b86] __vb2_queue_cancel: call_vb_qop(1, buf_finish) (nop)
[  370.401367] videobuf2_common: [out-0000000057b84b86] __vb2_queue_cancel: call_vb_qop(2, buf_finish) (nop)
[  370.401369] videobuf2_common: [out-0000000057b84b86] __vb2_queue_cancel: call_vb_qop(3, buf_finish) (nop)
[  370.401373] videobuf2_common: [out-0000000057b84b86] vb2_core_streamoff: successful
[  370.401377] videobuf2_common: [cap-00000000e59a888f] vb2_core_streamoff: successful
[  370.401418] vb2_common_vm_close: 0000000095b56358, refcount: 2, vma: ffff9646f000-ffff9651c000
[  370.401455] vb2_common_vm_close: 000000005cf693ed, refcount: 2, vma: ffff963c2000-ffff9646f000
[  370.401487] vb2_common_vm_close: 000000000fb3f862, refcount: 2, vma: ffff96315000-ffff963c2000
[  370.401522] vb2_common_vm_close: 00000000112d3450, refcount: 2, vma: ffff96268000-ffff96315000
[  370.401529] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_in_use: call_memop(0, num_users)
[  370.401531] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_in_use: call_memop(1, num_users)
[  370.401534] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_in_use: call_memop(2, num_users)
[  370.401536] videobuf2_common: [cap-00000000e59a888f] vb2_buffer_in_use: call_memop(3, num_users)
[  370.401539] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_free: call_vb_qop(0, buf_cleanup) (nop)
[  370.401542] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_free: call_vb_qop(1, buf_cleanup) (nop)
[  370.401545] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_free: call_vb_qop(2, buf_cleanup) (nop)
[  370.401548] videobuf2_common: [cap-00000000e59a888f] __vb2_queue_free: call_vb_qop(3, buf_cleanup) (nop)
[  370.401551] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_free: call_memop(0, put)
[  370.401712] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_free: freed plane 0 of buffer 0
[  370.401715] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_free: call_memop(1, put)
[  370.401865] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_free: freed plane 0 of buffer 1
[  370.401867] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_free: call_memop(2, put)
[  370.402016] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_free: freed plane 0 of buffer 2
[  370.402019] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_free: call_memop(3, put)
[  370.402166] videobuf2_common: [cap-00000000e59a888f] __vb2_buf_mem_free: freed plane 0 of buffer 3
[  370.402172] videobuf2_common: [out-0000000057b84b86] vb2_core_streamoff: successful
[  370.402230] vb2_common_vm_close: 00000000210e3729, refcount: 2, vma: ffff96927000-ffff96a80000
[  370.402299] vb2_common_vm_close: 0000000076540d0f, refcount: 2, vma: ffff967ce000-ffff96927000
[  370.402361] vb2_common_vm_close: 00000000fe5c7906, refcount: 2, vma: ffff96675000-ffff967ce000
[  370.402428] vb2_common_vm_close: 000000006a194006, refcount: 2, vma: ffff9651c000-ffff96675000
[  370.402433] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(0, num_users)
[  370.402436] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(1, num_users)
[  370.402438] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(2, num_users)
[  370.402440] videobuf2_common: [out-0000000057b84b86] vb2_buffer_in_use: call_memop(3, num_users)
[  370.402443] videobuf2_common: [out-0000000057b84b86] __vb2_queue_free: call_vb_qop(0, buf_cleanup) (nop)
[  370.402445] videobuf2_common: [out-0000000057b84b86] __vb2_queue_free: call_vb_qop(1, buf_cleanup) (nop)
[  370.402448] videobuf2_common: [out-0000000057b84b86] __vb2_queue_free: call_vb_qop(2, buf_cleanup) (nop)
[  370.402450] videobuf2_common: [out-0000000057b84b86] __vb2_queue_free: call_vb_qop(3, buf_cleanup) (nop)
[  370.402452] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_free: call_memop(0, put)
[  370.402745] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_free: freed plane 0 of buffer 0
[  370.402748] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_free: call_memop(1, put)
[  370.403037] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_free: freed plane 0 of buffer 1
[  370.403039] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_free: call_memop(2, put)
[  370.403328] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_free: freed plane 0 of buffer 2
[  370.403330] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_free: call_memop(3, put)
[  370.403618] videobuf2_common: [out-0000000057b84b86] __vb2_buf_mem_free: freed plane 0 of buffer 3

Do you need other debug output ?

I'm fine with firmware expecting specific aligments, but I would expect the driver to error
out instead of the firmware.

Neil
> 
>> ===========================><=================================================
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -194,9 +194,8 @@ static int
>> iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
>>                  inst_hfi_gen2->src_subcr_params.bitstream_resolution =
>> resolution;
>>                  payload_type = HFI_PAYLOAD_U32;
>>          } else {
>> -               codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
>> -               resolution = ALIGN(inst->fmt_dst->fmt.pix_mp.width,
>> codec_align) << 16 |
>> -                       ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align);
>> +               resolution = inst->fmt_dst->fmt.pix_mp.width << 16 |
>> +                       inst->fmt_dst->fmt.pix_mp.height;
>>                  inst_hfi_gen2->dst_subcr_params.bitstream_resolution =
>> resolution;
>>                  payload_type = HFI_PAYLOAD_32_PACKED;
>>          }
>> ===========================><=================================================
>> Did I pass some wrong parameters ? I don't expect the fw to crash.
>>
>> - On the 1280x720 output bug, I tried the same commands as v2:
>> v4l2-ctl --verbose
>> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12
>> --set-selection-output target=crop,top=0,left=0,width=1920,height=1080
>> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
>> --stream-from=Big_Buck_Bunny_1080_10s.yuv
>> --stream-to=Big_Buck_Bunny_1080_10s.h264 -d /dev/video1
>>
>> And I still get a 1280x720 h264 video, did I miss something ?
> 
> The above chnage which you reverted is needed to resolve this bug,
> basically if you don't set the resolution aligned with 16 (for H264) and 32
> (for HEVC) firmware will reject the property and encode to some default
> resolution which is 720p in this case.
> 
>>
>> - Finally I tested the firmware you sent today
>> (https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/654),
>> first thanks a lot for that !
>>
>> But then I was unable to encode with this firmware (v2 or v3 patchset), I
>> got around all the firmwares
>> I got and here's the results:
>> | QC_IMAGE_VERSION_STRING                                     | BUILD_DATE
>> | Release                         | decoding | encoding v2 | encoding v3 |
>> |-------------------------------------------------------------|-------------|---------------------------------|----------|-------------|-------------|
>> | video-firmware.3.4-245082a0a3cc5e740f6340c295000ab4bcfc367d | Aug 24 2023
>> | VIDEO.LA.4.0.r2-02400-lanai.0-1 | OK       | OK          | KO HEVC     |
>> | video-firmware.3.4-457429862ac40592d143de942b04d80fd9987e56 | Jan 29 2024
>> | VIDEO.LA.4.0.r2-03800-lanai.0-1 | OK       | OK          | KO HEVC     |
>> | video-firmware.3.4-0d8a914b010672616a0d0613e22866c0b639a807 | Aug 14 2024
>> | VIDEO.LA.4.0.r2-05900-lanai.0-1 | OK       | KO          | KO          |
>> | video-firmware.3.4-75ad4eb9657cf50ee663b05f78c01d6ceccd5632 | Jan 29 2025
>> | VIDEO.LA.4.0.r2-05900-lanai.0-1 | OK       | KO          | KO          |
>> | video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693 | Aug 14 2025
>> | VIDEO.VPU.3.4-0054              | OK       | KO          | KO          |
>> ------------------------------------------------------------------------------------------------------------------------------------------------------
>>
>> The change occurs around Aug 14 2024, So I checked the downstream driver
>> and I found that fixes the encoding:
>> ===========================><=================================================
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -863,9 +863,18 @@ static inline
>>   u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
>>                         u32 frame_width_coded)
>>   {
>> -       return ALIGN(((((((8192) >> 2) << 5) * (num_vpp_pipes_enc)) + 64) +
>> -                     (((((max_t(u32, (frame_width_coded),
>> -                                (frame_height_coded)) + 3) >> 2) << 5) +
>> 256) * 16)), 256);
>> +       u32 vpss_4tap_top = 0, vpss_4tap_left = 0, vpss_div2_top = 0,
>> vpss_div2_left = 0, vpss_top_lb = 0, vpss_left_lb = 0, size_left = 0,
>> size_top = 0;
>> +
>> +       vpss_4tap_top = ((((max_t(u32, frame_width_coded,
>> frame_height_coded) * 2) + 3) >> 2) << 4) + 256;
>> +       vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
>> +       vpss_div2_top = (((max_t(u32,frame_width_coded, frame_height_coded)
>> + 3) >> 2) << 4) + 256;
>> +       vpss_div2_left = ((((max_t(u32, frame_width_coded,
>> frame_height_coded)* 2) + 3) >> 2) << 5) + 64;
>> +       vpss_top_lb = (frame_width_coded + 1) << 3;
>> +       vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
>> +       size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
>> +       size_top = (vpss_4tap_top + vpss_div2_top) * 2;
>> +
>> +       return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb,
>> DMA_ALIGNMENT);
>>   }
> 
> Seems this calculation is different for iris3 and iris33, hence you see
> this issue on SM8650.
> 
> Updating this calculation in common code will increase the buffer size with
> from ~400KB to ~2.2 MBs (for 640x480) and even more for higher resolution.
> 
> @vikash, pls comment if we should update in common code or have this
> implemented specific for iris33 separately using some ops.
> 
> Thanks,
> Dikshita
> 
>>
>>   static inline
>> ===========================><=================================================
>>
>> And I checked and encoding still works with the "old" firmwares.
>>
>> With both changes, I can get H264 & HEVC encoding working on any firmware.
>>
>> Neil
>>
>>
>>>
>>> Commands used for GST validation:
>>>
>>> gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
>>> rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h264enc
>>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>>> location=/tmp/gst_cyclists_1280x720_92frames.h264
>>>
>>> gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
>>> rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h265enc
>>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>>> location=/tmp/gst_cyclists_1280x720_92frames.hevc
>>>
>>> The result of v4l2-compliance on SM8550:
>>> v4l2-compliance 1.29.0-5270, 64 bits, 64-bit time_t
>>> v4l2-compliance SHA: dc947661089e 2024-11-11 10:25:38
>>>
>>> Compliance test for iris_driver device /dev/video1:
>>>
>>> Driver Info:
>>>           Driver name      : iris_driver
>>>           Card type        : Iris Encoder
>>>           Bus info         : platform:aa00000.video-codec
>>>           Driver version   : 6.16.0
>>>           Capabilities     : 0x84204000
>>>                   Video Memory-to-Memory Multiplanar
>>>                   Streaming
>>>                   Extended Pix Format
>>>                   Device Capabilities
>>>           Device Caps      : 0x04204000
>>>                   Video Memory-to-Memory Multiplanar
>>>                   Streaming
>>>                   Extended Pix Format
>>>           Detected Stateful Encoder
>>>
>>> Required ioctls:
>>>           test VIDIOC_QUERYCAP: OK
>>>           test invalid ioctls: OK
>>>
>>> Allow for multiple opens:
>>>           test second /dev/video1 open: OK
>>>           test VIDIOC_QUERYCAP: OK
>>>           test VIDIOC_G/S_PRIORITY: OK
>>>           test for unlimited opens: OK
>>>
>>> Debug ioctls:
>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>           Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls:
>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>           test VIDIOC_QUERYCTRL: OK
>>>           test VIDIOC_G/S_CTRL: OK
>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>           Standard Controls: 37 Private Controls: 0
>>>
>>> Format ioctls:
>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>           test VIDIOC_G/S_PARM: OK
>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>           test VIDIOC_G_FMT: OK
>>>           test VIDIOC_TRY_FMT: OK
>>>           test VIDIOC_S_FMT: OK
>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>           test Cropping: OK
>>>           test Composing: OK (Not Supported)
>>>           test Scaling: OK (Not Supported)
>>>
>>> Codec ioctls:
>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK
>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>
>>> Buffer ioctls:
>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>           test CREATE_BUFS maximum buffers: OK
>>>           test VIDIOC_REMOVE_BUFS: OK
>>>           test VIDIOC_EXPBUF: OK
>>>           test Requests: OK (Not Supported)
>>>           test blocking wait: OK
>>>
>>> Test input 0:
>>>
>>> Streaming ioctls:
>>>           test read/write: OK (Not Supported)
>>>           Video Capture Multiplanar: Captured 61 buffers
>>>           test MMAP (select, REQBUFS): OK
>>>           Video Capture Multiplanar: Captured 61 buffers
>>>           test MMAP (epoll, REQBUFS): OK
>>>           Video Capture Multiplanar: Captured 61 buffers
>>>           test MMAP (select, CREATE_BUFS): OK
>>>           Video Capture Multiplanar: Captured 61 buffers
>>>           test MMAP (epoll, CREATE_BUFS): OK
>>>           test USERPTR (select): OK (Not Supported)
>>>           test DMABUF: Cannot test, specify --expbuf-device
>>>
>>> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0,
>>> Warnings: 0
>>>
>>> The result of v4l2-compliance on SM8250:
>>> v4l2-compliance 1.29.0-5270, 64 bits, 64-bit time_t
>>> v4l2-compliance SHA: dc947661089e 2024-11-11 10:25:38
>>>
>>> Compliance test for iris_driver device /dev/video1:
>>>
>>> Driver Info:
>>>           Driver name      : iris_driver
>>>           Card type        : Iris Encoder
>>>           Bus info         : platform:aa00000.video-codec
>>>           Driver version   : 6.16.0
>>>           Capabilities     : 0x84204000
>>>                   Video Memory-to-Memory Multiplanar
>>>                   Streaming
>>>                   Extended Pix Format
>>>                   Device Capabilities
>>>           Device Caps      : 0x04204000
>>>                   Video Memory-to-Memory Multiplanar
>>>                   Streaming
>>>                   Extended Pix Format
>>>           Detected Stateful Encoder
>>>
>>> Required ioctls:
>>>           test VIDIOC_QUERYCAP: OK
>>>           test invalid ioctls: OK
>>>
>>> Allow for multiple opens:
>>>           test second /dev/video1 open: OK
>>>           test VIDIOC_QUERYCAP: OK
>>>           test VIDIOC_G/S_PRIORITY: OK
>>>           test for unlimited opens: OK
>>>
>>> Debug ioctls:
>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>           Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls:
>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>           test VIDIOC_QUERYCTRL: OK
>>>           test VIDIOC_G/S_CTRL: OK
>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>           Standard Controls: 19 Private Controls: 0
>>>
>>> Format ioctls:
>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>           test VIDIOC_G/S_PARM: OK
>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>           test VIDIOC_G_FMT: OK
>>>           test VIDIOC_TRY_FMT: OK
>>>           test VIDIOC_S_FMT: OK
>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>           test Cropping: OK
>>>           test Composing: OK (Not Supported)
>>>           test Scaling: OK (Not Supported)
>>>
>>> Codec ioctls:
>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK
>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>
>>> Buffer ioctls:
>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>           test CREATE_BUFS maximum buffers: OK
>>>           test VIDIOC_REMOVE_BUFS: OK
>>>           test VIDIOC_EXPBUF: OK
>>>           test Requests: OK (Not Supported)
>>>           test blocking wait: OK
>>>
>>> Test input 0:
>>>
>>> Streaming ioctls:
>>>           test read/write: OK (Not Supported)
>>>           Video Capture Multiplanar: Captured 61 buffers
>>>           test MMAP (select, REQBUFS): OK
>>>           Video Capture Multiplanar: Captured 61 buffers
>>>           test MMAP (epoll, REQBUFS): OK
>>>           Video Capture Multiplanar: Captured 61 buffers
>>>           test MMAP (select, CREATE_BUFS): OK
>>>           Video Capture Multiplanar: Captured 61 buffers
>>>           test MMAP (epoll, CREATE_BUFS): OK
>>>           test USERPTR (select): OK (Not Supported)
>>>           test DMABUF: Cannot test, specify --expbuf-device
>>>
>>> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0,
>>> Warnings: 0
>>>
>>> Looking forward to your review and feedback.
>>>
>>> Thanks,
>>> Dikshita
>>>
>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>> ---
>>> Dikshita Agarwal (26):
>>>         media: iris: Fix buffer count reporting in internal buffer check
>>>         media: iris: Report unreleased PERSIST buffers on session close
>>>         media: iris: Fix memory leak by freeing untracked persist buffer
>>>         media: iris: Fix port streaming handling
>>>         media: iris: Allow substate transition to load resources during
>>> output streaming
>>>         media: iris: Always destroy internal buffers on firmware release
>>> response
>>>         media: iris: Update vbuf flags before v4l2_m2m_buf_done
>>>         media: iris: Simplify session stop logic by relying on vb2 checks
>>>         media: iris: Allow stop on firmware only if start was issued.
>>>         media: iris: Send dummy buffer address for all codecs during drain
>>>         media: iris: Fix missing LAST flag handling during drain
>>>         media: iris: Fix format check for CAPTURE plane in try_fmt
>>>         media: iris: Add support for video encoder device
>>>         media: iris: Initialize and deinitialize encoder instance structure
>>>         media: iris: Add support for ENUM_FMT, S/G/TRY_FMT encoder
>>>         media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for
>>> encoder
>>>         media: iris: Add support for VIDIOC_QUERYCAP for encoder video device
>>>         media: iris: Add encoder support for V4L2 event subscription
>>>         media: iris: Add support for G/S_SELECTION for encoder video device
>>>         media: iris: Add support for G/S_PARM for encoder video device
>>>         media: iris: Add platform-specific capabilities for encoder video
>>> device
>>>         media: iris: Add V4L2 streaming support for encoder video device
>>>         media: iris: Set platform capabilities to firmware for encoder
>>> video device
>>>         media: iris: Allocate and queue internal buffers for encoder video
>>> device
>>>         media: iris: Add support for buffer management ioctls for encoder
>>> device
>>>         media: iris: Add support for drain sequence in encoder video device
>>>
>>>    drivers/media/platform/qcom/iris/Makefile          |   5 +-
>>>    drivers/media/platform/qcom/iris/iris_buffer.c     | 220 ++++--
>>>    drivers/media/platform/qcom/iris/iris_buffer.h     |   7 +-
>>>    drivers/media/platform/qcom/iris/iris_common.c     | 232 ++++++
>>>    drivers/media/platform/qcom/iris/iris_common.h     |  18 +
>>>    drivers/media/platform/qcom/iris/iris_core.h       |  20 +-
>>>    drivers/media/platform/qcom/iris/iris_ctrls.c      | 675 +++++++++++++++-
>>>    drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 +
>>>    drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +-
>>>    .../platform/qcom/iris/iris_hfi_gen1_command.c     | 480 +++++++++---
>>>    .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 112 ++-
>>>    .../platform/qcom/iris/iris_hfi_gen1_response.c    |  60 +-
>>>    .../platform/qcom/iris/iris_hfi_gen2_command.c     | 359 ++++++---
>>>    .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  44 +-
>>>    .../platform/qcom/iris/iris_hfi_gen2_response.c    |  46 +-
>>>    drivers/media/platform/qcom/iris/iris_instance.h   |  24 +
>>>    .../platform/qcom/iris/iris_platform_common.h      |  74 +-
>>>    .../media/platform/qcom/iris/iris_platform_gen2.c  | 522 ++++++++++++-
>>>    .../platform/qcom/iris/iris_platform_qcs8300.h     | 352 ++++++++-
>>>    .../platform/qcom/iris/iris_platform_sm8250.c      | 234 +++++-
>>>    drivers/media/platform/qcom/iris/iris_probe.c      |  33 +-
>>>    drivers/media/platform/qcom/iris/iris_state.c      |   9 +-
>>>    drivers/media/platform/qcom/iris/iris_state.h      |   1 +
>>>    drivers/media/platform/qcom/iris/iris_utils.c      |  36 +
>>>    drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>>>    drivers/media/platform/qcom/iris/iris_vb2.c        |  58 +-
>>>    drivers/media/platform/qcom/iris/iris_vdec.c       | 251 +-----
>>>    drivers/media/platform/qcom/iris/iris_vdec.h       |  13 +-
>>>    drivers/media/platform/qcom/iris/iris_venc.c       | 579 ++++++++++++++
>>>    drivers/media/platform/qcom/iris/iris_venc.h       |  27 +
>>>    drivers/media/platform/qcom/iris/iris_vidc.c       | 299 +++++++-
>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 847
>>> ++++++++++++++++++++-
>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  20 +
>>>    33 files changed, 4964 insertions(+), 712 deletions(-)
>>> ---
>>> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
>>> change-id: 20250704-iris-video-encoder-b193350b487a
>>>
>>> Best regards,
>>


