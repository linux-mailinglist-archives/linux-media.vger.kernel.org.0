Return-Path: <linux-media+bounces-45415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D5674C0242B
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 17:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B6C304FD3FB
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 15:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37653246762;
	Thu, 23 Oct 2025 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="asjzfbge"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EA42472AE
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 15:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761234860; cv=none; b=Lf33Ou6CRHl9wi5cpNW5+ATBnx5VVBPyPOQK82IRi3qSnutX5I5URv/g1zANYk6muBLf6ysk+BTWZ2qQP1df08UHjveo8Ym/JtOktPI/6eV6uZhYZlMT2x20Gng9GDEZbL5njPjj7AMbjQLOjAP5cd7sGQpNhyM6BNgjVbCcylY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761234860; c=relaxed/simple;
	bh=+bQNRO4fRq6WmpXwr2/uDqnf3PV1L2pmYabV6s/CgGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wt88ueVmlizKdtfv9JLXOgjYeSFUE3KliBi7jrtpRDxcqAVi4F2oQFVOyWgBmmtx7ud7ZE48YGnICiQX1hAHrmOVFY7pOj31PazCtxd8VhV86IKbtFUI0jI10GsMFGUBUrTT8a5tp+Dncx1JmLWogwadm2fX2Gg2UEQqgbR5Tto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=asjzfbge; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-471131d6121so8076495e9.1
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 08:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761234857; x=1761839657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :reply-to:content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSVu2yxOxCTzVj/uGbezICgXM1lzxh7i9kyGW3UK/ds=;
        b=asjzfbgeejWyqW8sYmYcurbNvkOSNGIbhlNObrR5AI3qjZeexXnZ6oVF16tsF525cS
         nuDFrYb3LEqxHqluiHjJcrYZ537se8Sv3QwyBt93PO+0HU7lMJtBQI6CdRTN2ROvc5+U
         lqHBJ3aaVYqtdNKIKk7YLQyEFEt3PS7naRh1qdK3hBZPXp9XcqpefIeIM0mmdWtVfqAn
         ZAg9w0sz+oT/6aH8f6L4eIdJA0k440wV6QQSSU1iTKkRz1jP8MJM4KNx5j7+SlqXJLwO
         2xzof8h5Lfjt+5dIG24fyeeD5geXJu503CwfRmIUn23UeoDgU+3FUxpBawERMJFdgsQQ
         9quA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234857; x=1761839657;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :reply-to:content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VSVu2yxOxCTzVj/uGbezICgXM1lzxh7i9kyGW3UK/ds=;
        b=Bk211cf2L+SQDzRaO5aeqfdHfnr3lXVXX/b99ixeoKgaPwwj5Qme5oFd0R+VkNiPos
         7tf0A/FM9W+/xooFP/gmPE2lkrbSGCPz67XzO+xbBbvnh9uDBdOtX0TVMcjCUGvyS9Ca
         dwoSC/wKIiOyatDx7aH+jUKaREONXlNT9cJIfmdbZo7JiFu+QRUHismxyebUV5TL2lLp
         WPeWoJhNi5anTOD0Cx6+0np710JrgJ6c9e8V74xj0MIgx/HmKzBebTjLWzTAVXmEWbi5
         9leO0EQn5u6F5MCfO6POsSunBFUDxBOytOrSP8aLNG9Nq4/RFVfpDuq2+Ul55SLmBGCU
         CtAg==
X-Forwarded-Encrypted: i=1; AJvYcCU8apZKgwOuEB1t/H6XtelThDUtz6WnooJYL4gl7uuqDgiJ8APsbgCuNJ/p0NNxjzQ/myaJd9nnp8SXuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeSa4oyqyCjrqren+JEPRuNhAOHPej1vRfvJ3jLbPSi7FyFtJS
	OxD1nkz+ERG9w7U1mbxZ0t7drYwi5u+BtkbuFdngzsmY3+xDbVW11tcslUkPGGJhAB8=
X-Gm-Gg: ASbGncs256MP375mIDdcB2qBhPm5rd0Xjx/fBdX0rcvkrKiJdlqfFI5geTkwFkP2wan
	q048KkgVYacrX5CZs0qyrbjlVV7+5PWIt8b5gGq3x6K/QjjyCPOClbuKV0KsJJy88XV/8KlT1C5
	plXUZAO6bjavLUxFTOsWUE/6Dqed2kHm6pfr9LOzu1YXDglE+vEIxg8zq7OXQARR81VOmjk4TCF
	Y5aeqBLt7lpOhNICLqNRIP2qux6N5puax96o/7oRp6YW+urvMnrjckAdIyWFFTiXgeEgyAfj9kH
	HzzqxQlR7nbJ5dZBzkjLumdowJTbLqVLfXSqspt0JZhMPMN9xNyHYONTJRu8T30v3REBs7DVndE
	LVZOy6q2Lcza1NjSBKMDtl9N5cfIZ35x2iqF1JGZ+BoN9mo1UwOe48CUqKh2VAkp2PXh7oDnDng
	I+2rffzk5N8ziX7/+obxBCXzYjXaczjJraamz4OEjrLDGFchCWQDTaZySjHx0W
X-Google-Smtp-Source: AGHT+IEU+pEEpJDkNwcVSD6BECnItRO+JIkIpEXv24bYvb5oKCys5mFoigX1yTVder56JjMcwSS4HA==
X-Received: by 2002:a05:600c:3512:b0:471:12c2:201f with SMTP id 5b1f17b1804b1-471179134f0mr213733285e9.32.1761234856587;
        Thu, 23 Oct 2025 08:54:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a1bd:ad6d:e81:795e? ([2a01:e0a:3d9:2080:a1bd:ad6d:e81:795e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cae9253bsm42203255e9.1.2025.10.23.08.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 08:54:16 -0700 (PDT)
Message-ID: <6f608c8f-b75a-4865-8a2e-f990ede2c662@linaro.org>
Date: Thu, 23 Oct 2025 17:54:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: i2c: add Samsung S5KJN1 image sensor device
 driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/25 04:04, Vladimir Zapolskiy wrote:
> Samsung S5KJN1 is a 50MP image sensor, it produces Bayer GRBG (2x2)
> frames in RAW10 output format, the maximum supported output resolution
> is 8160x6144 at 10 frames per second rate.
> 
> Changes from v1 to v2:
> * added a collected Reviewed-by tag to the dt bindings documentation (Rob),
> * managed to get one PLL setup to cover both supported output modes,
> * vflip/hflip sensor controls swap media bus code of Bayer patterns,
> * extracted a common initialization subsequence of modes into its own array,
> * set a step to the analog gain control like it's done in downstream,
> * reworded a sequence of CCI commands in s5kjn1_enable_streams().
> 
> Link to v1:
> - https://lore.kernel.org/linux-media/20250928200956.1215285-1-vladimir.zapolskiy@linaro.org
> 
> ----8<---- V4L2 compliance results (v4l-utils-1.20.0) ----8<----
> % v4l2-compliance -d /dev/v4l-subdev28
> v4l2-compliance SHA: not available, 64 bits, 64-bit time_t
> 
> Compliance test for device /dev/v4l-subdev28:
> 
> Required ioctls:
> 
> Allow for multiple opens:
> 	test second /dev/v4l-subdev28 open: OK
> 	test for unlimited opens: OK
> 	test invalid ioctls: OK
> 
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
> Total for device /dev/v4l-subdev28: 41, Succeeded: 41, Failed: 0, Warnings: 0
> 
> ----8<----
> 
> Vladimir Zapolskiy (2):
>    dt-bindings: media: i2c: Add Samsung S5KJN1 image sensor
>    media: i2c: add Samsung S5KJN1 image sensor device driver
> 
>   .../bindings/media/i2c/samsung,s5kjn1.yaml    |   95 ++
>   MAINTAINERS                                   |    8 +
>   drivers/media/i2c/Kconfig                     |   10 +
>   drivers/media/i2c/Makefile                    |    1 +
>   drivers/media/i2c/s5kjn1.c                    | 1387 +++++++++++++++++
>   5 files changed, 1501 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
>   create mode 100644 drivers/media/i2c/s5kjn1.c
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

