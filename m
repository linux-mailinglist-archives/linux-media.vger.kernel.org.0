Return-Path: <linux-media+bounces-45794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB9EC1438E
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C2B01A68F10
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE6F30F553;
	Tue, 28 Oct 2025 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QUfo25uy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA18930F532
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761648632; cv=none; b=oE9kX2ywGRgkcrAxTybabvkkPqJALcXJtXF0jdbFusZjLuYuA5hbrp3V3B4dpNrxboAluZfDHSvPsjNHvg6NfOdqqE1BA6hSm5n2FlDGCki3ejJ8frR/HMC0nxPB679PwW0NFKYPprEc8ax96NitYEPMsmJ1D27N3uFeM7sG7as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761648632; c=relaxed/simple;
	bh=JcPfzvwJnhHSlD04IovRWNXuTct6SaW5VSsh3aw7QSQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=q8h8ug83vUdQkBJ6SWJ51JXE2cHi5WZIU+aJ1CKDBnrKU04q2iGjrXs67Uoy6P0cdAo/oMR42+pq7WiBFRnbJ1uyhGHb1vPGCNlOkoazttsdA1W5UdjJ/L3ADsCjul56xNtDqk83dG0zEgemWpjfCi0iAneCCz4z77oJw1P8KeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QUfo25uy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so2963749f8f.3
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761648628; x=1762253428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DQs3x2+zkMzUAZ6R855gK20nQAqjTASXPxGz49ZcCo=;
        b=QUfo25uyu7Giltq4NZEg2cKxfix4TAeE8IMVtIns+nGCCdpamppqwNameluA+mWpdi
         ICcWr0uzPs/lMzx+Xo9kB3rxpTEnR0rV/Qj8X4cKF3ifXhMVQvm0WaxpHWykARgeqeU3
         2/nRZaRAfnukqRN2aqZRZbJKfBFzNOBnVs7w1wsbeAoB+9eSvDsgme1pGhyc9JsSaGNZ
         +MMtZZFZ5l5L/mvE6lUoL5UMpvp2RyM8tVH8iQYKV4/rl35TJP7tLT++SMTlDoB5GP1S
         dxOL8GBsrvY9L+BDZ9XaJJDru8wM8NHeWUumtCAdHc0UivCuAcA5/KJWxr0Zq22wfZN7
         qCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761648628; x=1762253428;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1DQs3x2+zkMzUAZ6R855gK20nQAqjTASXPxGz49ZcCo=;
        b=RJPC3HLMzWju1jmo9586GgQqdU+sseoCi0K7VMbMXj+Ei6aqE++8aZVgwFHLt9V383
         5P3oVDFb+m9AWcESPsHRdXefVeaWN0kdW7V3WhcY8v9nRd7g1tavrGYtop07Ih57/J4l
         CwsmIPeDxQ4k2Bh1eGyNX7Snbh/Wr0qIWq7fNFnKJ4WusYzDx/BMimtkJWIZdglrVq8M
         Mwsf3LXh03K8gKcWUPuSLJQKIavooaJLzMjKgErHkqUmsl2dLY1TtiVjkB7rj4pzbnNT
         PaDFcctsSXJX124+rev9TIgUH6WQX6nUqLu22guXizRz4wWsq3EHBVmCnUJFiUpVNPk6
         75wg==
X-Gm-Message-State: AOJu0YyfpjP2O4UHL4pWAMdvwj6AknDUG61UYalKecDcBaZvcuSq0p0P
	OVbtsRJ2Kdh8SqC+CzvcvVa9U2ugW3x+RtkFYlAM+1hTKT/Y0+pEbRlFF7+SOwh9Ad1gy5LUzbR
	X5ZFdZTk=
X-Gm-Gg: ASbGncufHX7x06ImwyHPqFx0koWOcP8FZrbfpXJL9BGaOw22jTavxv/whw+CM2drAS3
	w3qyEK/7+4CP/VeNANZy/EBNyckVtdN92vyFZDFlMTfgRCQNqmZBHmtyCfHOeR4PI0Lf/LB7l0l
	eZWpatHB9T7e9W7zK52+2CWJw9QM8bybppRdYgN6SSgM/jajw4lwC93L+77hLZRBbiPNTWxNLBp
	CocRoWQ2voiKp9zCHYekDZtJvfQUw0MaIk3LEsFugOlUkLwsKi/edS9MWl2y1IRJf15I4US7eeB
	9nGilokvp1/aRljyHaacr4nBM3wQFywXNVGUDpOJLVB1Jo2WGXfRVYxBvIvAUumMWzznm/zVMv7
	C2taKsYx9aCYhQwxML8yIB+QWtwIKf606slidBmvWEEgi6WfpbhcegR4aeBalvkdoy1KCADht3w
	sSWhrZq9iLTpc3+nfP+8dW4ewkCWN/0W4nUPWxu4chPPW8dk5PqA==
X-Google-Smtp-Source: AGHT+IFTBQBHcfmeUGvRf7/rpvus3GrF95ciWCT4w5aSjfWPdlzTM9TYY4CDd/gxhJoP5nLe2m7N+g==
X-Received: by 2002:a5d:64e8:0:b0:429:66bf:1475 with SMTP id ffacd0b85a97d-429a7e4eb79mr2630951f8f.3.1761648628154;
        Tue, 28 Oct 2025 03:50:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:ebe6:df10:d28d:aa5? ([2a01:e0a:cad:2140:ebe6:df10:d28d:aa5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7a7csm19783903f8f.8.2025.10.28.03.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:50:27 -0700 (PDT)
Message-ID: <b976b442-7d07-4fef-b851-ccd14661a233@linaro.org>
Date: Tue, 28 Oct 2025 11:50:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] Add Amlogic stateless H.264 video decoder for S4
To: zhentao.guo@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
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
In-Reply-To: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/27/25 06:42, Zhentao Guo via B4 Relay wrote:
> Introduce initial driver support for Amlogic's new video acceleration
> hardware architecture, designed for video stream decoding.
> 
> Compared to the current Amlogic video decoder hardware architecture,
> this new implementation eliminates the Esparser hardware component,
> enabling direct vb2 buffer input. The driver is designed to support
> the V4L2 M2M stateless decoder API. The initial phase includes support
> for H.264 decoding on Amlogic S805X2 platform.
> 
> The driver is capable of:
> - Supporting stateless H.264 decoding up to a resolution 1920x1088(on the S805X2 platform).
> - Supporting I/P/B frame handling.
> - Supporting vb2 mmap and dma-buf modes.
> - Supporting frame-based decode mode. (Note that some H.264 bitstreams require
>    DPB reordering to generate reference lists, the stateless decoder driver
>    cannot access reordered reference lists in this mode, requiring the driver
>    to perform reference list reordering itself)
> - Supporting NV12/NV21 output.
> - Supporting Annex B start codes.

Thanks for the initial drop, it's very nice !

First of all, this still requires some work so it would be better if you
used the RFC tag until all issues are sorted out.

You didn't tell anything about the firmware, did you build a specific version
of the firmware to handle the stateless and bypass ESPARSER ?
Will this technique work with the released firmwares of GXL/G12/SM1 ?

Will you support the compressed format and 10bit with this ?

> 
> This driver is tested with Gstreamer.
> Example:
> gst-launch-1.0 filesrc location=/tmp/video_640x360_mp4_hevc_450kbps_no_b.mp4 !
> parsebin ! v4l2slh264dec ! filesink location=/tmp/output.yuv
> 
> The driver passes v4l2 compliance test, test reports :
> v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
> 
> Compliance test for aml-vdec-drv device /dev/video0:
> 
> Driver Info:
>          Driver name      : aml-vdec-drv
>          Card type        : platform:aml-vdec-drv
>          Bus info         : platform:fe320000.video-codec
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
>          Detected Stateless Decoder
> Media Driver Info:
>          Driver name      : aml-vdec-drv
>          Model            : aml-vdec-drv
>          Serial           :
>          Bus info         : platform:fe320000.video-codec
>          Media version    : 6.16.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.16.0
> Interface Info:
>          ID               : 0x0300000c
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x00000001 (1)
>          Name             : aml_dev_drv-source
>          Function         : V4L2 I/O
>          Pad 0x01000002   : 0: Source
>            Link 0x02000008: to remote pad 0x1000004 of entity 'aml_dev_drv-proc' (Video Decoder): Data, Enabled, Immutable
> 
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video0 open: OK
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
>          Standard Controls: 6 Private Controls: 0
>          Standard Compound Controls: 4 Private Compound Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK
>          test blocking wait: OK

Please also enable the streaming tests.

> 
> Total for aml-vdec-drv device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
> 
> Some Fluster test cases are still failing. We will publish the final results
> once all these Fluster test failures have been resolved.

As Christian reported, please add the flutter results aswell.

Neil

> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
> Zhentao Guo (3):
>        dt-bindings: vdec: Add binding document of Amlogic decoder accelerator
>        dts: decoder: Support V4L2 stateless decoder dt node for S4
>        decoder: Add V4L2 stateless H.264 decoder driver
> 
>   .../bindings/media/amlogic,vcodec-dec.yaml         |   96 ++
>   MAINTAINERS                                        |    7 +
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   24 +
>   drivers/media/platform/amlogic/Kconfig             |    2 +
>   drivers/media/platform/amlogic/Makefile            |    1 +
>   drivers/media/platform/amlogic/vdec/Kconfig        |   15 +
>   drivers/media/platform/amlogic/vdec/Makefile       |    4 +
>   drivers/media/platform/amlogic/vdec/aml_vdec.c     |  759 +++++++++
>   drivers/media/platform/amlogic/vdec/aml_vdec.h     |   31 +
>   .../platform/amlogic/vdec/aml_vdec_canvas_utils.c  |  154 ++
>   .../platform/amlogic/vdec/aml_vdec_canvas_utils.h  |   22 +
>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  263 +++
>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  194 +++
>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  652 +++++++
>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  182 ++
>   .../platform/amlogic/vdec/aml_vdec_platform.c      |   37 +
>   .../platform/amlogic/vdec/aml_vdec_platform.h      |   62 +
>   drivers/media/platform/amlogic/vdec/h264.c         | 1790 ++++++++++++++++++++
>   drivers/media/platform/amlogic/vdec/h264.h         |  300 ++++
>   drivers/media/platform/amlogic/vdec/reg_defines.h  |  175 ++
>   20 files changed, 4770 insertions(+)
> ---
> base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
> change-id: 20251027-b4-s4-vdec-upstream-0603c1a4c84a
> 
> Best regards,


