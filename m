Return-Path: <linux-media+bounces-40753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39741B31652
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 13:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16F9A7B2425
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 11:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08ED2ED858;
	Fri, 22 Aug 2025 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OcFnfp0e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9380D2D249A
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 11:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862162; cv=none; b=G+5suUI7eLOnk9t5Ya21NlIts9Vwqj4lcezGYUuzV4osI833D1ix0a/LZinRHs0X+v+lkgx2Tj1808Rpj31VbA6IZva4/6y6yMyDyXQC6gM5TBmymZhEWDmGZvhhHA5pH3U2drnCsQKBsizaGMecNi5qB77jfcKar4vu7swsJp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862162; c=relaxed/simple;
	bh=C+lqR0HkRUBGgaSfBAcjhhRPMbhXWt++FyTLzpB89RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XyPKyBjJwKxNk+5mzvbcRL5I+MKdH9zQZq2f1sqaTZJXrr1T8ed97T7iViIQy7kINXFuiwOfD1OXwNq/59gdL6Rq6dMWPMxVzFI19Ni9BOOG8H6/gkFaGlkV/cOHYwqdrpCOn34pvv5z9LxlIQce1sahX4YUkSNZN5lR8Y8P9kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OcFnfp0e; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9edf504e6so1279739f8f.3
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 04:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755862158; x=1756466958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9D6xpqFKe/fhFvlzy44zqZK5O4fAv56YRQp3bWProX4=;
        b=OcFnfp0eFAxvyJv1Z+dXwZz5mayvuWlnn736tIPENwVuiH6o6bzGsPu0LLN3k3xfCJ
         Nxh4ilGrT7njcsa9fNHUYDCB14aDNon922fE5CAZ9ufNJcxKYwsbppHZsPImrPu8Y+yt
         Reb3BIO8BR0vHgCmtgvHW6nNA8M+sF6hoqWSbg6/61WB+0wQZCvrlxKqKuGV+Y2hhrNi
         tzj9QJSaODqq/y1gXmrDf5Xj9hyv3J9pjEaLTD1S+ghphpgDtcBmXm9Uf6dFH5uLKND3
         BjRHmiX5vDQutoU/Cb2ezD/Q0qY8ird3ZScIoexONdU7Tdqx5hl+3+fOYKtMK9WqYc+C
         /YGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862158; x=1756466958;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9D6xpqFKe/fhFvlzy44zqZK5O4fAv56YRQp3bWProX4=;
        b=L7/XUj3COrz/LhVamRy+Q22xt9MaVMWqwSdeTrAKZSLQcAYpOs0ku1Y+9hrfAZq3D7
         0iiMhcAJU/8FaPRvDVMCnwZ2/pBeBQFHGKcmgbqW+ibVZXZgQEo4Hj82FPd+lwXbaKjs
         cor0M5CMLQ3z5SIZvcBwpuPjgJp1dyd82n78ndopQFPLP18B45PQ2w9pDKJmJj1G1P7S
         F2VsfA/OW6Q8feioQKOM119SgZKW0nxE8FI0TmJ1QowG8IDj81paOvqLowpWetTHQppV
         tv52eYjLCdCOgdYUfgnyhUZZZZkOHmQarVI+AuRSzhPdLiQWpMrIBV96egyrR15WhcRi
         jkTg==
X-Gm-Message-State: AOJu0Yy2Z8ZIvBhdAEjioB0SaZzwN+iftt+CrB7hhQjZwITdrUbi+PHE
	f0KqcJrZ9qAx5+f9VyCmFbIkqTbpBKHzqbxqWASuJS0rN7riHJOv2kB1F0b20eanJM0=
X-Gm-Gg: ASbGncvYMolIPNNVfjvStspKOwEBg8mFV36F7mqqx44GUxvAeBKIMfA2bn8eaj40eV4
	pYA2iPp1Hd+V5ppIId4FqjjFXkFIBwFORzsihGLHKLPMGnBjG0WylUCrlqRne2mImbUKicsQQhA
	44b0FOVTK3IirfOsgcAOqiq/KS9FK/S5P7xlGprfdfAxVFU+Y5QrsYLoN765kXL3Ksqj5Rnuxg0
	dhPExBnoRjdkftxDZMr1NRgTIvKHb1O7ayoqjgwrfaSNZfVdhfB47ZvJL9+jSzaZofp37o//jno
	xOgwJYWfzVEN7wCZISukAOKp7lNah3UEjiv/X6QZLhB1Kq5mG/NpY+Wc9XQBKglG7F2hKB6UTTk
	Pph8lCcoqZ0fWrL/l1/1udd9KbNgxt06oUwaAiAW9SZPD0eqkX/tJxXg09BcJVOjSJTfqhd/DTK
	c=
X-Google-Smtp-Source: AGHT+IHJoTvbZoFiRTcR9uW6rHjlZ3bocX8wh1q+ygy7EhpEF8ZS5kuVFE62MjOg5+uYAbP66n4f7A==
X-Received: by 2002:a05:6000:310d:b0:3c3:d82c:2295 with SMTP id ffacd0b85a97d-3c5dad0fdbamr2176755f8f.24.1755862157720;
        Fri, 22 Aug 2025 04:29:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3dd7:7361:c101:6a77? ([2a01:e0a:3d9:2080:3dd7:7361:c101:6a77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074e38d65sm15356395f8f.27.2025.08.22.04.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 04:29:17 -0700 (PDT)
Message-ID: <7e734644-15d7-4a47-a98e-7f6c5a50697d@linaro.org>
Date: Fri, 22 Aug 2025 13:29:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/08/2025 11:07, Dikshita Agarwal wrote:
> Hi All,
> 
> This patch series adds support for H.264 and H.265 encoder in iris
> driver and includes a few fixes and cleanup in the common code that were
> identified during encoder bring-up process.
> 
> The changes include:
> - Enabling support for H.264 and H.265 encoding.
> - Fixes and improvements in shared componenets used by both encoder and
> decoder paths.
> - Ensuring compatibility and stability with the existing decoder flow.
> 
> Changes in v3:
> - Fixed the log when destroying the interanl buffers (Jorge)
> - Updated commit text with issue details in patch 05/25 (Krzysztof)
> - Added a patch to simplify conditional logic in stop handling for hfi gen1 (Bryan)
> - Reduced duplicate code while registering video devices (Bryan)
> - Added a fix for try fmt handling in decoder (Self)
> - Fixed the value of max core mbps for qcs8300 (Vikash)
> - Simplied the frame rate handling in driver by using non q16 format and
> converted to q16 when setting to firmware (Vikash)
> - Fixed the issue with bitstream resolution setting to firmware (Neil)
> - Addressed other review comments (Vikash, Bryan)
> - Link to v2: https://lore.kernel.org/r/20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com
> 
> Changes in v2:
> - Fixed sparse/coccinnelle issues.
> - Fixed the kernel doc warning.
> - Removed unsupported PEAK_BITRATE property from SM8250.
> - Dropped patch 04/25 to fix quality issue with encoder.
> - Enhanced command handling for encoder to allow start/stop commands.
> - Expanded rate control condition checks to include additional rate
>    control types for HFI Gen2.
> - Updated default value to MAX_QP for all caps related to max QP settings.
> - Add support for INPUT/OUTPUT_BUF_HOST_MAX_COUNT caps for encoder.
> - Link to v1: https://lore.kernel.org/r/20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com
> 
> All patches have been tested with v4l2-compliance, v4l2-ctl and
> Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured
> that the existing decoder functionality remains uneffected.
> 
> Commands used for V4l2-ctl validation:
> 
> v4l2-ctl --verbose --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
> --stream-from=/media/cyclists_1280x720_92frames.yuv
> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
> 
> v4l2-ctl --verbose --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
> --stream-from=/media/cyclists_1280x720_92frames.yuv
> --stream-to=/tmp/cyclists_1280x720_92frames.hevc -d /dev/video1
> 
> Commands used for GST validation:
> 
> gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
> rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h264enc
> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> location=/tmp/gst_cyclists_1280x720_92frames.h264
> 
> gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
> rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h265enc
> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> location=/tmp/gst_cyclists_1280x720_92frames.hevc
> 
> The result of v4l2-compliance on SM8550:
> v4l2-compliance 1.29.0-5270, 64 bits, 64-bit time_t
> v4l2-compliance SHA: dc947661089e 2024-11-11 10:25:38
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.16.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Encoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video1 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 37 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>          test read/write: OK (Not Supported)
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, CREATE_BUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> The result of v4l2-compliance on SM8250:
> v4l2-compliance 1.29.0-5270, 64 bits, 64-bit time_t
> v4l2-compliance SHA: dc947661089e 2024-11-11 10:25:38
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.16.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Encoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video1 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 19 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>          test read/write: OK (Not Supported)
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, CREATE_BUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> Looking forward to your review and feedback.
> 
> Thanks,
> Dikshita
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Dikshita Agarwal (26):
>        media: iris: Fix buffer count reporting in internal buffer check
>        media: iris: Report unreleased PERSIST buffers on session close
>        media: iris: Fix memory leak by freeing untracked persist buffer
>        media: iris: Fix port streaming handling
>        media: iris: Allow substate transition to load resources during output streaming
>        media: iris: Always destroy internal buffers on firmware release response
>        media: iris: Update vbuf flags before v4l2_m2m_buf_done
>        media: iris: Simplify session stop logic by relying on vb2 checks
>        media: iris: Allow stop on firmware only if start was issued.
>        media: iris: Send dummy buffer address for all codecs during drain
>        media: iris: Fix missing LAST flag handling during drain
>        media: iris: Fix format check for CAPTURE plane in try_fmt
>        media: iris: Add support for video encoder device
>        media: iris: Initialize and deinitialize encoder instance structure
>        media: iris: Add support for ENUM_FMT, S/G/TRY_FMT encoder
>        media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder
>        media: iris: Add support for VIDIOC_QUERYCAP for encoder video device
>        media: iris: Add encoder support for V4L2 event subscription
>        media: iris: Add support for G/S_SELECTION for encoder video device
>        media: iris: Add support for G/S_PARM for encoder video device
>        media: iris: Add platform-specific capabilities for encoder video device
>        media: iris: Add V4L2 streaming support for encoder video device
>        media: iris: Set platform capabilities to firmware for encoder video device
>        media: iris: Allocate and queue internal buffers for encoder video device
>        media: iris: Add support for buffer management ioctls for encoder device
>        media: iris: Add support for drain sequence in encoder video device
> 
>   drivers/media/platform/qcom/iris/Makefile          |   5 +-
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 220 ++++--
>   drivers/media/platform/qcom/iris/iris_buffer.h     |   7 +-
>   drivers/media/platform/qcom/iris/iris_common.c     | 232 ++++++
>   drivers/media/platform/qcom/iris/iris_common.h     |  18 +
>   drivers/media/platform/qcom/iris/iris_core.h       |  20 +-
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 675 +++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 +
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +-
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 480 +++++++++---
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 112 ++-
>   .../platform/qcom/iris/iris_hfi_gen1_response.c    |  60 +-
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 359 ++++++---
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  44 +-
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  46 +-
>   drivers/media/platform/qcom/iris/iris_instance.h   |  24 +
>   .../platform/qcom/iris/iris_platform_common.h      |  74 +-
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 522 ++++++++++++-
>   .../platform/qcom/iris/iris_platform_qcs8300.h     | 352 ++++++++-
>   .../platform/qcom/iris/iris_platform_sm8250.c      | 234 +++++-
>   drivers/media/platform/qcom/iris/iris_probe.c      |  33 +-
>   drivers/media/platform/qcom/iris/iris_state.c      |   9 +-
>   drivers/media/platform/qcom/iris/iris_state.h      |   1 +
>   drivers/media/platform/qcom/iris/iris_utils.c      |  36 +
>   drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>   drivers/media/platform/qcom/iris/iris_vb2.c        |  58 +-
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 251 +-----
>   drivers/media/platform/qcom/iris/iris_vdec.h       |  13 +-
>   drivers/media/platform/qcom/iris/iris_venc.c       | 579 ++++++++++++++
>   drivers/media/platform/qcom/iris/iris_venc.h       |  27 +
>   drivers/media/platform/qcom/iris/iris_vidc.c       | 299 +++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 847 ++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  20 +
>   33 files changed, 4964 insertions(+), 712 deletions(-)
> ---
> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> change-id: 20250704-iris-video-encoder-b193350b487a
> 
> Best regards,

Thanks !

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

It still requires some sm8650 specific buffer calculations tweaks
to support new firmwares and HEVC for encoding, but I'll post that in
a second time. The core is functional for H264 on older firmwares.

Neil

