Return-Path: <linux-media+bounces-44872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2B3BE7E92
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 11:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC36B62441B
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 09:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6D52DC35C;
	Fri, 17 Oct 2025 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQELrKzP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40A52DAFAC
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760694942; cv=none; b=K5jyDugQ+blg+2ZnXtA353td9a3Y6fOMBTJXiUN6JJXHDzzTv4fZZ/bMJkRTQ/G5/cF5K0QPLKBbmYkZf3t9UBeSnbmjXCM3mXER5p0IrMpZsl68Ux81Hu4GMXooTyERa5vbDvFCKvdkdgAQpBP70fSXqXrkPHVGAydi1vbZU8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760694942; c=relaxed/simple;
	bh=EN7upIAaIlmOcNSSI+VhTmVtHv/HCkrGEWj8+sdnd60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gfoZEoReJ0bBhumaSs293Tr7BxPBhOgQ2nRKYloUvPTdTe3Z7yaXt49kKrJ4JslTUgAmUlHAcavzr2c3H4UKeKVOrQUH/uRA6HIKrMBNEIGfsTypXcZ432nA87A+A3wCNSFzXD+nqEw588d08G03WSrJuoEIN3b+5ghjnPNxpTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FQELrKzP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-471191ac79dso8203385e9.3
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 02:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760694938; x=1761299738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vq1jMsmTKXTmRbJvMFGKNoVVK0ewchvkJ/J+H1o7Sak=;
        b=FQELrKzP7j0PFTYinQXqJvzhC1aZWZTDJWHaYgpHIYhu4xzbR7PylyER3gK2sO/AkY
         k2+mx1x2xAPr4Ns8NtP+n0yYAsZC9ED4y4l/xrqKA9qmh2Uon1w7G/Ib2sBdo49MNb1a
         14v8FA5TMhP3uJbiV1sqw+rl4+v4N9yuKeskO3gfn2MUpjfEa6l2U5fkPtNoPosBvCkA
         RCTkrquyGIxWpNchBCSFAb32L7QY5+BCRA1bGgpu+5FAsxvbzFNmkXUmdxpVPSe3KADu
         sgzZjDGBos6GdMSDqjV6jXBLRhN51KgRfLJjrOrtKxCulEZJ/eFU8rF3xdzckibwwpPQ
         oIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760694938; x=1761299738;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vq1jMsmTKXTmRbJvMFGKNoVVK0ewchvkJ/J+H1o7Sak=;
        b=jtNsnuPgDgbLCGJHuJj9bKOGZ2BSQKETuNXazekmxzb/FrVkgfBk15qrjW6wdZ+rDr
         /3ENqnb0JofJYJxNTw9xyyPPuexemNLCPoQtCE7FGJmjZIoxnQ0+BnTBJfkMifGA0TJx
         XPNGjWjYuLmSrI0aehE7YzmjUWBgN+A9Kx5nMyy9C04Qr/Vl4l+Hu2Rh8v9orjZL+nxz
         9c+vf4VrrK4twpPhI/qilrrqFkiPbWWOnCw0db3q7aJFCMOiTZYY/HtRey8LvHMLcs7D
         JCOIOSRjHpfIH6lQGosxXneAi7fuTNbm+ZZWrrALBCc5ROeB5mFG92YkskoIXb+rfW3n
         JySw==
X-Gm-Message-State: AOJu0YyZO3iMY9eNNFb3B6nzhDeXDZEcwQAswf+6sGgi5ib1wSoMuYQ/
	/1/yPQ5XpV/qy0dTuzrTMF40gVr4eIu5in3xkRwMf1l3eCibW4ik4kxXONvWPQM3/xg=
X-Gm-Gg: ASbGnctTyjGlmZR8Aaa/YJ1qKHmPUPzUrGXJ1aFRKoaVY+WfmzwSpY7lc5NHRDG//N6
	cityGWpajiqsK/aTO7mAfVOiGeeymMO5kyy3JoQ+rHWSwrt9QwHLU+4OtqfWeYxVRYSGkji6SOM
	1T221YCI3P/k+cNNYBnu+AKSsgT316g9rAFdmFCtCEzbcPMDl5t/7kuMXk6m3VYHaulJR4uxgm6
	2lzUOj45O+GyC+Ab6CIYlqITBFO7vYw7n9Namsv5uWx2QkUR0A5w2F7NUevo9fVhIsKPSWFG70p
	bPmrQQFdsXOet0O06dCYk7+fuAm6bBrFD3qFcPxwil244JM8R/cKvVOt5Y5KP9p7ENYSM1bUvjb
	DB+0YzjpDaRSFM669AA5a73ELXUu4Glw9pKHW5i3MciIhyxAJCA1ec0d28HKCUwn+6fT+cP9s0e
	DoicRvm6Qd+SbEXrEv8RYNgtl0xPaijrvgubJ0jTelYD3im+mSi+nhBlqZYRhYy2E=
X-Google-Smtp-Source: AGHT+IFJMh932ewe5yYU0myYuBjh226kA4m1+YU9mnLFowzHq0IbdVhexZ1r8wzZ4B53Azl97u779w==
X-Received: by 2002:a05:6000:4381:b0:425:86ae:b0b with SMTP id ffacd0b85a97d-42704db486dmr2260278f8f.38.1760694938059;
        Fri, 17 Oct 2025 02:55:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5849:4623:6b2a:2be9? ([2a01:e0a:3d9:2080:5849:4623:6b2a:2be9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711443e7a1sm75138505e9.9.2025.10.17.02.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 02:55:37 -0700 (PDT)
Message-ID: <23f08812-7890-446e-95b7-4ff5b8f547f2@linaro.org>
Date: Fri, 17 Oct 2025 11:55:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 0/4] media: qcom: iris: encoder feature enhancements
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
 quic_renjiang@quicinc.com
References: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
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
In-Reply-To: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 11:27, Wangao Wang wrote:
> Hi All,
> 
> This patch series introduces several enhancements to the Qualcomm Iris
> encoder driver, improving support for V4L2 controls and enabling more
>   video encoding features.
> 
> All patches have been tested with v4l2-compliance, v4l2-ctl and
> on QCS8300 for encoder.

Nice, but did you test those on any other device ? This patchset
affects all supported HW, so please test on all of them.


> 
> Commands used for V4l2-ctl validation:
> 
> Scale:
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=width=1280,height=720,pixelformat=H264 \
> --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/scale_720p_output.h264

Please provide a way to generate/retrieve this `input_nv12_1080p.yuv` file aswell.

Thanks,
Neil>
> Flip:
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/vertical_flip.h264 \
> --set-ctrl vertical_flip=1
> 
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/horizontal_flip.h264 \
> --set-ctrl horizontal_flip=1
> 
> Rotate:
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/rotate90.h264 \
> --set-ctrl rotate=90
> 
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/rotate180.h264 \
> --set-ctrl rotate=180
> 
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/rotate270.h264 \
> --set-ctrl rotate=270
> 
> Intra Refresh:
> Testing of this feature requires the use of this application.
> https://github.com/quic/v4l-video-test-app
> 
> The result of v4l2-compliance on QCS8300:
> v4l2-compliance 1.31.0-5378, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 2ed8da243dd1 2025-06-30 08:18:40
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.17.0
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
>          Standard Controls: 43 Private Controls: 0
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
> Wangao Wang (4):
>    media: qcom: iris: Add support for scale and improve format alignment
>    media: qcom: iris: Add rotation support for encoder
>    media: qcom: iris: Add flip support for encoder
>    media: qcom: iris: Add intra refresh support for encoder
> 
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 94 +++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h |  3 +
>   .../qcom/iris/iris_hfi_gen2_command.c         | 26 +++--
>   .../qcom/iris/iris_hfi_gen2_defines.h         | 19 ++++
>   .../qcom/iris/iris_hfi_gen2_response.c        |  2 +
>   .../media/platform/qcom/iris/iris_instance.h  |  8 ++
>   .../platform/qcom/iris/iris_platform_common.h |  5 +
>   .../platform/qcom/iris/iris_platform_gen2.c   | 61 ++++++++++++
>   drivers/media/platform/qcom/iris/iris_utils.c |  6 ++
>   drivers/media/platform/qcom/iris/iris_utils.h |  1 +
>   drivers/media/platform/qcom/iris/iris_venc.c  | 28 +++++-
>   .../platform/qcom/iris/iris_vpu_buffer.c      | 52 +++++-----
>   12 files changed, 273 insertions(+), 32 deletions(-)
> 


