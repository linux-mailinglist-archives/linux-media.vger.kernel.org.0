Return-Path: <linux-media+bounces-45416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BEDC02446
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 17:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F36C3A653A
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 15:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D50A248F5A;
	Thu, 23 Oct 2025 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OKQl7dAT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A41D24BBFD
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761234987; cv=none; b=MfoETIGaP3PjhVB5KYHPM02FBkMyhOXR8VJhdZ5sk+RoSqPeklznjkBuM+2S8ixH7K1ny2wWCK8/sGMLQpfY4ZBzie03AyTzZbt8fJZHVDgvSZ5yFMC7UxYkpbv+CPAeiqT01XBfNpnadkEQrgmyPas0UDK86+ta3PZ+G2ppsso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761234987; c=relaxed/simple;
	bh=pAcVLp/bnNx0swX3XvJCyZVu+8hB50/+WK+1AGdzNdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Shi2czhPZbxtpotLrmqftB0IhIrW85T2GG5f8+JhCou92OmuDgVofxoqw58/MmCEtn1hnKU/NCG2GmHo4lWAZch40jIzyS/zfbweFQrCdErN86PRj5BSxAosc9HAodmogILDjg3EyhTr5lSvgfwyPKam2/zdyDNl+TaLoK/WWEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OKQl7dAT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so9940135e9.1
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761234983; x=1761839783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :reply-to:content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72GiocTLEUqE+mXeUuzDmtFEtQjIjGQT5sSwumtaQow=;
        b=OKQl7dATq3X2MrRfFLOKKhtznQiLTihOsCvuCcUOpE1m0N/02L1RsSkIfxc+QKw4Rq
         ynBc3RXVPFqxBFJIFp4BHnX9kR3/qOvNpEmzonn9L2DcOjHM4g0mOf6SWInUZ1XJgMYj
         qsc9WSXV3L5jROqDjZF1V/zdsz5fAhv1Zn0O1DXZfHncl5NmEUvs5vpA//GHF8E8lFZ7
         kCaFyekqJkxMg9mTS7jIy2M6Goiil1pPlVI9t99BwDlKxp9ZD/TLScpRrIdNK9Z3Tl6P
         UbR0tyFoERPRsxZQuoPh3CdINTpXEGRo0kV3jt5bzysH/nDokpKDC1qEhsG+wZmcnn4D
         XZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234983; x=1761839783;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :reply-to:content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=72GiocTLEUqE+mXeUuzDmtFEtQjIjGQT5sSwumtaQow=;
        b=r+de1wOrqG7nHO0s9x74/9hFgGRq7kuzqJsk5lb3Sfn3Egjx+hEbgeZufLo5OjXdiZ
         pW3iWTGx3N3rKg0CbxCY82T72JePB5y4lC2YJPAGYFVBkb9TjhSupIcf9QNixj2lEx1I
         eXFB6rQENQGooH9OrOX/2fQuUexUciXu+Iru8vrRyR6QBqUMByrbh596qmRcsItdfADN
         u1IGsACYGn4a2WNK6881uQgOZYdKJ3I49egUibViAXylg9r/x/KlR0kFm643KuVtXg+y
         x8P2URURx7k0QB7fbs/XNTWD0UfVwDG3/j/zkDEN6vzG5z9MbuefpaNNDMYyhvdPEwFN
         8eBA==
X-Forwarded-Encrypted: i=1; AJvYcCXzrrz72IsA9uNl5WkgqqmV4vNUZ7tZJZ9NVPQ/Jr+EPgCgUNQeDM7k3hmmWvuag0YdcYa4NXOY20aHKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUetDNhYKuCc8AIrhKBTNCdCSX2ISroUTEg8Y1Wguht9X5RbmJ
	sTVFydw5PzWQTlnSm3LVhc06iIiVd1Rd/bNMaGubFDSRJ2zaASQK5USQTmCRIDNAXqU=
X-Gm-Gg: ASbGncuLGOHCjGwLkSwxIaagp/2/U7TwB0c+oBAkD91ckYLPzrsKcMI7icsI7/6cSXx
	pJrPpvseR0kSg1RqxZpj3rNeMdLM8XD0Cy/fBH8+57ll3U9Uws5LvDhyk4T6PGrG5gECfdGOppN
	U1qlZ09LNGr2khbiP8sXKbqcfihTZmEN2eR8AjFuut14PgyUEB4AOcjQtC5mbSBv484udoXah0i
	xRk4ZSxGo8x3ZSAIjrT0S6b350+y4iZO5T/6M1vi934EAsY/6qRSdSSltve+oi4JvlCiXtR2+Bg
	HaE+MSfTOnMCee64utW0GMBsd7zWbQZIgDfxp8NmFOK8/T2qSwFnyZD0zWEtBbDqw/yBn3Pzrlz
	cQ3M930B3ciGMQO/OqxYTsvaCPDjUBpa7cuhSYIr61kV4o8biwWMwSCkDMPRXyTyx6sxSww3Rw4
	dz5JJ3lktcNzI+mGzrjq9uGYcao002n557Rw33yZ9bVQjMb4/WbGJ2DUJOs1T5
X-Google-Smtp-Source: AGHT+IEGUDrCVjyuQlYn3gt/cM8G9wBnXtyo7ZIhcC0Hjl0lgxQCkvYYN+HXxG+y2tZTEh+sM/bm+w==
X-Received: by 2002:a05:600c:5029:b0:45d:cfee:7058 with SMTP id 5b1f17b1804b1-471179035dbmr183826485e9.22.1761234983311;
        Thu, 23 Oct 2025 08:56:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a1bd:ad6d:e81:795e? ([2a01:e0a:3d9:2080:a1bd:ad6d:e81:795e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496cf3b51sm61668735e9.9.2025.10.23.08.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 08:56:23 -0700 (PDT)
Message-ID: <f0eacec2-976d-4ebb-93c6-2be4f67515ba@linaro.org>
Date: Thu, 23 Oct 2025 17:56:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] media: i2c: Add Samsung S5K3M5 13MP camera sensor
 driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20251012231102.1797408-1-vladimir.zapolskiy@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20251012231102.1797408-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 01:11, Vladimir Zapolskiy wrote:
> Samsung S5K3M5 (ISOCELL 3M5) is a 13MP image sensor, it produces
> Bayer GRBG (2x2) frames in RAW10 output format, the maximum supported
> output resolution is 4208x3120 at 30 frames per second rate.
> 
> The changeset supports two output resolutions 4208x3120@30 and 2104x1184@60,
> PLL configuration is done for 24MHz external clock, in future it would be
> possible to add a setup for 19.2MHz external clock also.
> 
> The next V4L2 controls are supported by the driver: vertical/horizontal flip,
> exposure, analogue gain, vertical/horizontal blanking and test pattern.
> 
> ----8<----8<----8<----8<----8<----8<----
> 
> % v4l2-compliance -d /dev/v4l-subdev30
> v4l2-compliance SHA: not available, 64 bits, 64-bit time_t
> 
> Compliance test for device /dev/v4l-subdev30:
> 
> Required ioctls:
> 
> Allow for multiple opens:
> 	test second /dev/v4l-subdev30 open: OK
> 	test for unlimited opens: OK
> 
> 	test invalid ioctls: OK
> Debug ioctls:
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 12 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK (Not Supported)
> 	test VIDIOC_TRY_FMT: OK (Not Supported)
> 	test VIDIOC_S_FMT: OK (Not Supported)
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> 	test VIDIOC_EXPBUF: OK (Not Supported)
> 	test Requests: OK (Not Supported)
> 
> Total for device /dev/v4l-subdev30: 41, Succeeded: 41, Failed: 0, Warnings: 0
> 
> 
> Vladimir Zapolskiy (2):
>    dt-bindings: media: i2c: Add Samsung S5K3M5 image sensor
>    media: i2c: Add Samsung S5K3M5 13MP camera sensor driver
> 
>   .../bindings/media/i2c/samsung,s5k3m5.yaml    |   95 ++
>   MAINTAINERS                                   |    8 +
>   drivers/media/i2c/Kconfig                     |   10 +
>   drivers/media/i2c/Makefile                    |    1 +
>   drivers/media/i2c/s5k3m5.c                    | 1362 +++++++++++++++++
>   5 files changed, 1476 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
>   create mode 100644 drivers/media/i2c/s5k3m5.c
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD

