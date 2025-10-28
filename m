Return-Path: <linux-media+bounces-45796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F4150C144A1
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5642D541E9A
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C723054E1;
	Tue, 28 Oct 2025 11:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q8V3sWwK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F21C27FB2B
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649329; cv=none; b=DKj2QxtfQ5xaSszxeF2ps3A/Y7/fHkTT29aC/14ALV2v6vRfzNwrjyxhRbXRPwv3YVaxufASxkm01KGEzQcr71zCQclSmMKqcb3AwOUils5bQhB8JhDCnGW0eHxJVXKeXKuNAwM7rqkexz8vP3IlIn4nuz681uQenz3h7b7Xtn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649329; c=relaxed/simple;
	bh=aDqEShCNS3GaTcQkTAhvLCnubIAMrmZR2xQrt+mS/uA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ThEegpf4EYpAHdwz669dFCxSHw7jzqNZ83OGF/YEIk0dJ0S9hLP8cit5PgyIYCELYZkZJ3+iVilyQW/qbYAj5xvBZclJh/4EyX3bdeFRKP0f0TPTIPd4AgtgdkByI2+s6z1Pg3+hslFerP/IYqwowPM+zesWCyKp/QPgKUThOoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q8V3sWwK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-475dc0ed8aeso29579915e9.2
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761649321; x=1762254121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xysh1fEduwR7rFIQdBppyZ68D4vqSzDc1Kk6DE0xbas=;
        b=Q8V3sWwKniNvv8rAz+lLeQ3H1cJuTSm0G5Y+DsM8rL1ENhZNlnincV2R87YUb8xmip
         hp+oMJHOMLJWuZyTnbOQm76WfsQFZwh9JkO5rNxpBZuEC0D9PyVT5NT3YW5ck7Bwp3aZ
         z8ZfqhNpjidStXyBT+/gt4I9jf7aqiXvJQLDBsxC///h285Nf1CZm0NyVK5JE53PiYBv
         6QEjKK+cB3XvW0h4qqMfO5K5nH1EP5FOSwsIhYM4jRnEp4qynWlqe1+Egny3rO5tEN1v
         2ixgvZJ5MDA3VwmMjfaeDmrasQrkZUWewheMTP5PEVMXgyvzgwKA1bv2Jsf0hXzYUkwx
         PuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761649321; x=1762254121;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xysh1fEduwR7rFIQdBppyZ68D4vqSzDc1Kk6DE0xbas=;
        b=Puj7XrYUebINduO1MlRkqxu9dXsn8GckKuBO7zhnujABv/xRb4WLh0s8QubY6uTzJQ
         UJIWG9kMDN4o07mB+o7JQbEKuTPJRQOnmR64QdT7ctBu0gCkEM6qNaeTX0gCP3KlGq4H
         pJ1xcbldo62DnYiND6DDyaBKdpuVUBP9+UL4YD2i1COJqWq9QAlf0xbRLz8CNpkeL/aJ
         6kUjZnNJqnrFXSMjlCezo5oLatQnbdh6BA2hfTxPnGYNHesrtt7zdrySfyX0u4EfTl9I
         /n/03PjG3Yz+X+AsKwDm+QRq7WpIPFaFw1TSzykVeyuWfpAQNjO+L0cD35Qsv2h7rBb0
         RhCw==
X-Gm-Message-State: AOJu0YyPQ4lfMbP8H+kI6cJP2rJ/YKZTX5TGsF5fkh/jzAVUaOkK7epn
	6cqSt85SDHQGZxo5EJi2EmEf+sfa38jWUGXvyL36TriPyPMP50RjhQNWCMdGJKY/x7c=
X-Gm-Gg: ASbGncvTfoRu5ECtokFd20gJDMcJLNTOLb+gT+RRqYRb+r90gzefOWR16QvIsWhOh3C
	EHqCTgIdQgz3ipnyYr+/aqL7Iiwm8frVrOYTUQJO8d1w0lxAqLiVD5c9LZcq2bZB1AhhsKWNuIt
	ULFCKRKclT4WW2lgHZzQfZdq8FMGGkr7EhLGJe0p8BdSRycUXlRBgEpl35IfohZ4gf75zUC2lyL
	e30BAmOUoCc773Y0xMI5yA40frf9dTKsYmmBN+CxGSPNNHKPhqLFqZ3YdEyulI36hRYIn/rhW3p
	NiXrbyoCpYLCyjz0R3T5fhr/gUhlx03l7WAiZKtkxTSt+ltuAthgKJ0bM1GMWggRUfbi+lPxwug
	k7tivNYBBPrm7sCZ8OBxz7TXqnk/vRE62kbYw5mrQAoC5RFP8hYVboBPwQh53diDos+LM9+5pp+
	1SLG9CwIsCN/Pp82jLPyz61U19EDK9649afdirBoHgH2ChJ0l2nQ==
X-Google-Smtp-Source: AGHT+IHDqba/uvWA2KsqX/Yk8eLp2cYfpQp6w0H/n82sLEk8QTE268+DWS/zbvZXBPXq+IlWjM6VCw==
X-Received: by 2002:a05:600c:4fc4:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47717e037f5mr23993365e9.17.1761649320116;
        Tue, 28 Oct 2025 04:02:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:ebe6:df10:d28d:aa5? ([2a01:e0a:cad:2140:ebe6:df10:d28d:aa5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd02ce46sm227467295e9.3.2025.10.28.04.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 04:01:59 -0700 (PDT)
Message-ID: <42909f90-e2d3-4911-ae6d-47d180ccb367@linaro.org>
Date: Tue, 28 Oct 2025 12:01:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] decoder: Add V4L2 stateless H.264 decoder driver
To: zhentao.guo@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
 <20251027-b4-s4-vdec-upstream-v1-3-620401813b5d@amlogic.com>
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
In-Reply-To: <20251027-b4-s4-vdec-upstream-v1-3-620401813b5d@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/27/25 06:42, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
> 
> This patch introduces initial driver support for Amlogic's new
> video acceleration hardware architecture, designed for video
> stream decoding. The driver is designed to support the
> V4L2 M2M stateless decoder API. In phase 1, it supports H.264
> bitstreams decoding.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>   MAINTAINERS                                        |    7 +
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
>   18 files changed, 4650 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5ea78444f035..f400b5dabf30 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1352,6 +1352,13 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
>   F:	drivers/spi/spi-amlogic-spisg.c
>   
> +AMLOGIC VCODEC DRIVER
> +M:	Zhentao Guo <zhentao.guo@amlogic.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/amlogic,vcodec-dec.yaml
> +F:	drivers/media/platform/amlogic/vdec/
> +
>   AMPHENOL CHIPCAP 2 DRIVER
>   M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
>   L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
> index 458acf3d5fa8..8132f5b9282b 100644
> --- a/drivers/media/platform/amlogic/Kconfig
> +++ b/drivers/media/platform/amlogic/Kconfig
> @@ -4,3 +4,5 @@ comment "Amlogic media platform drivers"
>   
>   source "drivers/media/platform/amlogic/c3/Kconfig"
>   source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
> +
> +source "drivers/media/platform/amlogic/vdec/Kconfig"

PLease respect original formatting and drop the empty line

> diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
> index c744afcd1b9e..7409de674c0b 100644
> --- a/drivers/media/platform/amlogic/Makefile
> +++ b/drivers/media/platform/amlogic/Makefile
> @@ -2,3 +2,4 @@
>   
>   obj-y += c3/
>   obj-y += meson-ge2d/
> +obj-y += vdec/

Ditto> diff --git a/drivers/media/platform/amlogic/vdec/Kconfig b/drivers/media/platform/amlogic/vdec/Kconfig
> new file mode 100644
> index 000000000000..05c4568e058b
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +config VIDEO_AMLOGIC_VCODEC
> +    tristate "Amlogic Video Codec Driver"
> +    depends on ARCH_MESON || COMPILE_TEST
> +    depends on VIDEO_DEV
> +    depends on V4L_MEM2MEM_DRIVERS
> +    select VIDEOBUF2_DMA_CONTIG
> +    select V4L2_H264
> +    select V4L2_MEM2MEM_DEV
> +    help
> +      This is a v4l2 driver for Amlogic video codec driver.
> +	  This driver is designed to support V4L2 M2M STATELESS
> +	  interface.
> +      To compile this driver as a module choose m here.
> diff --git a/drivers/media/platform/amlogic/vdec/Makefile b/drivers/media/platform/amlogic/vdec/Makefile
> new file mode 100644
> index 000000000000..f645f7ca5e2d
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o aml_vdec_canvas_utils.o\
> +
> +obj-$(CONFIG_VIDEO_AMLOGIC_VCODEC) += aml-vdec-drv.o
> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/media/platform/amlogic/vdec/aml_vdec.c
> new file mode 100644
> index 000000000000..e8a66bde0397
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
> @@ -0,0 +1,759 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "aml_vdec.h"
> +#include "aml_vdec_hw.h"
> +#include "aml_vdec_platform.h"
> +
> +#define VCODEC_DRV_NAME "aml-vdec-drv"
> +
> +static const struct aml_vdec_v4l2_ctrl controls[] = {
> +	{
> +		.codec_type = CODEC_TYPE_H264,
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
> +		},
> +	}, {
> +		.codec_type = CODEC_TYPE_H264,
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_H264_SPS,
> +		},
> +	}, {
> +		.codec_type = CODEC_TYPE_H264,
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_H264_PPS,
> +		},
> +	}, {
> +		.codec_type = CODEC_TYPE_H264,
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
> +		},
> +	}, {
> +		.codec_type = CODEC_TYPE_H264,
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
> +			.min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +			.def = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +			.max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +		},
> +	}, {
> +		.codec_type = CODEC_TYPE_H264,
> +		.cfg = {
> +			.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +		},
> +	}, {
> +		.codec_type = CODEC_TYPE_H264,
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_H264_START_CODE,
> +			.min = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +			.def = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +			.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +		},
> +	}, {
> +		.codec_type = CODEC_TYPE_H264,
> +		.cfg = {
> +			.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +			.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +			.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> +		},
> +	}
> +};
> +
> +static struct aml_video_fmt aml_video_formats[] = {
> +	{
> +		.name = "H.264",
> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> +		.type = AML_FMT_DEC,
> +		.codec_type = CODEC_TYPE_H264,
> +		.num_planes = 1,
> +		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
> +			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
> +	},
> +	{
> +		.name = "NV21M",
> +		.fourcc = V4L2_PIX_FMT_NV21M,
> +		.type = AML_FMT_FRAME,
> +		.codec_type = CODEC_TYPE_FRAME,
> +		.num_planes = 2,
> +		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
> +			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
> +	},
> +	{
> +		.name = "NV21",
> +		.fourcc = V4L2_PIX_FMT_NV21,
> +		.type = AML_FMT_FRAME,
> +		.codec_type = CODEC_TYPE_FRAME,
> +		.num_planes = 1,
> +		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
> +			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
> +	},
> +	{
> +		.name = "NV12M",
> +		.fourcc = V4L2_PIX_FMT_NV12M,
> +		.type = AML_FMT_FRAME,
> +		.codec_type = CODEC_TYPE_FRAME,
> +		.num_planes = 2,
> +		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
> +			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
> +
> +	},
> +	{
> +		.name = "NV12",
> +		.fourcc = V4L2_PIX_FMT_NV12,
> +		.type = AML_FMT_FRAME,
> +		.codec_type = CODEC_TYPE_FRAME,
> +		.num_planes = 1,
> +		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
> +			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
> +	},
> +};
> +
> +void aml_vdec_set_default_params(struct aml_vdec_ctx *ctx)
> +{
> +	struct aml_q_data *q_data = NULL;
> +
> +	ctx->m2m_ctx->q_lock = &ctx->v4l2_intf_lock;
> +
> +	ctx->pic_info.colorspace = V4L2_COLORSPACE_DEFAULT;
> +	ctx->pic_info.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	ctx->pic_info.quantization = V4L2_QUANTIZATION_DEFAULT;
> +	ctx->pic_info.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +
> +	q_data = &ctx->q_data[AML_Q_DATA_SRC];
> +	memset(q_data, 0, sizeof(struct aml_q_data));
> +	q_data->visible_width = AML_VDEC_MIN_W;
> +	q_data->visible_height = AML_VDEC_MIN_H;
> +	q_data->coded_width = AML_VDEC_MIN_W;
> +	q_data->coded_height = AML_VDEC_MIN_H;
> +	q_data->filed_flag = V4L2_FIELD_NONE;
> +	q_data->bytesperline[0] = 0;
> +	q_data->sizeimage[0] = (1024 * 1024);
> +	q_data->fmt = &aml_video_formats[DEFAULT_OUT_IDX];
> +
> +	q_data = &ctx->q_data[AML_Q_DATA_DST];
> +	memset(q_data, 0, sizeof(struct aml_q_data));
> +	q_data->visible_width = AML_VDEC_MIN_W;
> +	q_data->visible_height = AML_VDEC_MIN_H;
> +	q_data->coded_width = AML_VDEC_MIN_W;
> +	q_data->coded_height = AML_VDEC_MIN_H;
> +	q_data->filed_flag = V4L2_FIELD_NONE;
> +	q_data->bytesperline[0] = q_data->coded_width;
> +	q_data->sizeimage[0] = q_data->coded_width * q_data->coded_height;
> +	q_data->bytesperline[1] = q_data->coded_width;
> +	q_data->sizeimage[1] = q_data->sizeimage[0] / 2;
> +	q_data->fmt = &aml_video_formats[DEFAULT_CAP_IDX];
> +}
> +
> +int aml_vdec_ctrls_setup(struct aml_vdec_ctx *ctx)
> +{
> +	int i;
> +	int ctrls_size = sizeof(controls) / sizeof(struct aml_vdec_v4l2_ctrl);
> +
> +	v4l2_ctrl_handler_init(&ctx->ctrl_handler, ctrls_size);
> +	for (i = 0; i < ctrls_size; i++) {
> +		v4l2_ctrl_new_custom(&ctx->ctrl_handler, &controls[i].cfg, NULL);
> +		if (ctx->ctrl_handler.error) {
> +			pr_debug("add ctrl for (%d) failed%d\n",
> +				 controls[i].cfg.id, ctx->ctrl_handler.error);
> +			v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +			return ctx->ctrl_handler.error;
> +		}
> +	}
> +	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
> +	return v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
> +}
> +
> +static void m2mops_vdec_device_run(void *m2m_priv)
> +{
> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)m2m_priv;
> +	struct aml_vdec_dev *dev = ctx->dev;
> +	struct vb2_v4l2_buffer *src, *dst;
> +	struct media_request *src_req;
> +	const char *fw_path = dev->pvdec_data->fw_path[ctx->curr_dec_type];
> +
> +	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	pr_debug("device run : src buf : %d dst buf %d\n", src->vb2_buf.index, dst->vb2_buf.index);

Switch to dev_dbg everywhere

> +
> +	src_req = src->vb2_buf.req_obj.req;
> +	if (src_req)
> +		v4l2_ctrl_request_setup(src_req, &ctx->ctrl_handler);
> +
> +	dos_enable();
> +	/* incase of bus hang in stop_streaming */
> +	ctx->dos_clk_en = 1;
> +	aml_vdec_reset_core();
> +	load_firmware(dev->dec_hw, fw_path);
> +
> +	if (ctx->codec_ops->run)
> +		ctx->codec_ops->run(ctx);
> +
> +	v4l2_m2m_buf_copy_metadata(src, dst);
> +	if (src_req)
> +		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
> +
> +	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, VB2_BUF_STATE_DONE);
> +}
> +
> +const struct v4l2_m2m_ops aml_vdec_m2m_ops = {
> +	.device_run = m2mops_vdec_device_run,
> +};
> +
> +static int vidioc_vdec_querycap(struct file *file, void *priv,
> +				struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, VCODEC_DRV_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, "platform:" VCODEC_DRV_NAME, sizeof(cap->card));
> +
> +	return 0;
> +}
> +
> +static int vidioc_vdec_enum_fmt(struct v4l2_fmtdesc *f, bool is_output)
> +{
> +	struct aml_video_fmt *fmt;
> +	int fmt_size = sizeof(aml_video_formats) / sizeof(struct aml_video_fmt);
> +	int i = 0, j = 0;
> +
> +	for (; i < fmt_size; i++) {
> +		fmt = &aml_video_formats[i];
> +		if (is_output && fmt->type != AML_FMT_DEC)
> +			continue;
> +		if (!is_output && fmt->type != AML_FMT_FRAME)
> +			continue;
> +
> +		if (j == f->index) {
> +			f->pixelformat = fmt->fourcc;
> +			strscpy(f->description, fmt->name,
> +				sizeof(f->description));
> +			if (strlen(fmt->name) >= sizeof(f->description)) {
> +				pr_err("fmt name string is too long!\n");
> +				f->description[sizeof(f->description) - 1] = '\0';
> +			}
> +			return 0;
> +		}
> +		++j;
> +	}
> +	return -EINVAL;
> +}
> +
> +static struct aml_q_data *aml_vdec_get_qdata_by_type(struct aml_vdec_ctx *ctx,
> +						     enum v4l2_buf_type type)
> +{
> +	if (V4L2_TYPE_IS_OUTPUT(type))
> +		return &ctx->q_data[AML_Q_DATA_SRC];
> +
> +	return &ctx->q_data[AML_Q_DATA_DST];
> +}
> +
> +static struct aml_video_fmt *aml_vdec_get_video_fmt(u32 format)
> +{
> +	struct aml_video_fmt *fmt;
> +	unsigned int k;
> +
> +	for (k = 0; k < (sizeof(aml_video_formats) / sizeof(struct aml_video_fmt)); k++) {
> +		fmt = &aml_video_formats[k];
> +		if (fmt->fourcc == format)
> +			return fmt;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int aml_vdec_init_dec_inst(struct aml_vdec_ctx *ctx,
> +				  struct aml_video_fmt *fmt_out)
> +{
> +	struct aml_vdec_dev *dev = ctx->dev;
> +	int ret = -1;
> +
> +	if (!fmt_out)
> +		return ret;
> +
> +	if (fmt_out->codec_type == CODEC_TYPE_FRAME) {
> +		pr_debug("capture type no need to set\n");
> +		return 0;
> +	}
> +
> +	ctx->codec_ops = &dev->pvdec_data->codec_ops[fmt_out->codec_type];
> +	if (ctx->codec_ops->init) {
> +		ret = ctx->codec_ops->init(ctx);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	ctx->curr_dec_type = fmt_out->codec_type;
> +	pr_info("%s set curr_dec_type = %d\n", __func__, ctx->curr_dec_type);

And dev_info/dev_err/dev_warn...

> +
> +	return ret;
> +}
> +

<snip>

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_canvas_utils.c b/drivers/media/platform/amlogic/vdec/aml_vdec_canvas_utils.c
> new file mode 100644
> index 000000000000..066958118b00
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_canvas_utils.c
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#include "aml_vdec_canvas_utils.h"
> +
> +#define CANVAS_REG_OFFSET   (0x12 << 2)
> +
> +/*
> + * DMC_CAV_LUT_DATAL/DMC_CAV_LUT_DATAH
> + * high 32bits of canvas data which need to be configured
> + * to canvas memory.
> + * 64bits CANVAS look up table
> + * bit 61 : 58   Endian control.
> + * bit 61 :  1 : switch 2 64bits data inside 128bits boundary.
> + * 0 : no change.
> + * bit 60 :  1 : switch 2 32bits data inside 64bits data boundary.
> + * 0 : no change.
> + * bit 59 :  1 : switch 2 16bits data inside 32bits data boundary.
> + * 0 : no change.
> + * bit 58 :  1 : switch 2 8bits data  inside 16bits data boundary.
> + * 0 : no change.
> + * bit 57 : 56.   Canvas block mode.  2 : 64x32, 1: 32x32;
> + *  0 : linear mode.
> + * bit 55 :      canvas Y direction wrap control.
> + * 1: wrap back in y.  0: not wrap back.
> + * bit 54 :      canvas X direction wrap control.
> + * 1: wrap back in X.  0: not wrap back.
> + * bit 53 : 41.   canvas Hight.
> + * bit 40 : 29.   canvas Width, unit: 8bytes. must in 32bytes boundary.
> + * that means last 2 bits must be 0.
> + * bit 28 : 0.    canvas start address.   unit. 8 bytes. must be in
> + * 32bytes boundary. that means last 2bits must be 0.
> + */
> +
> +#define CANVAS_WADDR_LBIT       0
> +#define CANVAS_WIDTH_LBIT       29
> +#define CANVAS_HEIGHT_HBIT      (41 - 32)
> +#define CANVAS_WRAPX_HBIT       (54 - 32)
> +#define CANVAS_WRAPY_HBIT       (55 - 32)
> +#define CANVAS_BLKMODE_HBIT     (56 - 32)
> +#define CANVAS_ENDIAN_HBIT      (58 - 32)
> +
> +/* canvas regs */
> +#define DC_CAV_LUT_DATAL        0x12
> +#define DC_CAV_LUT_DATAH        0x13
> +#define DC_CAV_LUT_ADDR         0x14
> +#define DC_CAV_LUT_RDATAL       0x15
> +#define DC_CAV_LUT_RDATAH       0x16
> +
> +#define CANVAS_ADDR_LMASK       0x1fffffff
> +#define CANVAS_WIDTH_LMASK      0x7
> +#define CANVAS_WIDTH_LWID       3
> +#define CANVAS_WIDTH_HMASK      0x1ff
> +#define CANVAS_WIDTH_HBIT       0
> +#define CANVAS_HEIGHT_MASK      0x1fff
> +#define CANVAS_HEIGHT_BIT       9
> +#define CANVAS_ADDR_NOWRAP      0x00
> +#define CANVAS_ADDR_WRAPX       0x01
> +#define CANVAS_ADDR_WRAPY       0x02
> +#define CANVAS_BLKMODE_MASK     0x03
> +
> +#define CANVAS_BLKMODE_LINEAR   0x00
> +#define CANVAS_BLKMODE_32X32    0x01
> +#define CANVAS_BLKMODE_64X32    0x02
> +
> +#define CANVAS_LUT_WR_EN   (0x2 << 8)
> +#define CANVAS_LUT_RD_EN   (0x1 << 8)
> +
> +#define CANVAS_ADDR_BITS_MASK		GENMASK(28, 0)
> +#define CANVAS_WIDTH_L_MASK		GENMASK(31, 29)
> +#define CANVAS_WIDTH_H_MASK		GENMASK(8, 0)
> +#define CANVAS_HEIGHT_H_MASK		GENMASK(21, 9)
> +#define CANVAS_WRAP_H_MASK		GENMASK(23, 23)
> +#define CANVAS_BLOCK_H_MASK		GENMASK(25, 24)
> +#define CANVAS_BITS_CTRL_MASK		GENMASK(29, 26)
> +
> +static struct vdec_canvas_s canvas;

There's already a canvas driver for that, please use it and extend it if necessary:
drivers/soc/amlogic/meson-canvas.c
<snip>

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
> new file mode 100644
> index 000000000000..ef2c779839d8
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
> @@ -0,0 +1,263 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +
> +#include "aml_vdec.h"
> +#include "aml_vdec_hw.h"
> +#include "aml_vdec_platform.h"
> +
> +#define AML_VDEC_DRV_NAME "aml-vdec-drv"
> +
> +static int fops_vcodec_open(struct file *file)
> +{
> +	struct aml_vdec_dev *dec_dev = video_drvdata(file);
> +	struct aml_vdec_ctx *ctx = NULL;
> +	int ret = 0;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mutex_lock(&dec_dev->dev_mutex);
> +	dec_dev->dec_ctx = ctx;
> +	ctx->dev = dec_dev;
> +	v4l2_fh_init(&ctx->fh, video_devdata(file));
> +	file->private_data = &ctx->fh;
> +	v4l2_fh_add(&ctx->fh, file);
> +	dec_dev->filp = file;
> +	mutex_init(&ctx->v4l2_intf_lock);
> +	init_waitqueue_head(&ctx->queue);
> +	ctx->int_cond = 0;
> +
> +	ctx->m2m_ctx = v4l2_m2m_ctx_init(dec_dev->m2m_dev_dec, ctx,
> +					 &aml_vdec_queue_init);
> +	if (IS_ERR((__force void *)ctx->m2m_ctx)) {
> +		ret = PTR_ERR((__force void *)ctx->m2m_ctx);
> +		v4l2_err(&dec_dev->v4l2_dev, "Failed to v4l2_m2m_ctx_init() (%d)", ret);
> +		goto err_m2m_ctx_init;
> +	}
> +
> +	ctx->fh.m2m_ctx = ctx->m2m_ctx;
> +	ret = aml_vdec_ctrls_setup(ctx);
> +	if (ret) {
> +		v4l2_err(&dec_dev->v4l2_dev, "Failed to init all ctrls (%d)", ret);
> +		goto err_ctrls_setup;
> +	}
> +
> +	aml_vdec_set_default_params(ctx);
> +	mutex_unlock(&dec_dev->dev_mutex);
> +
> +	return ret;
> +
> +err_ctrls_setup:
> +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
> +err_m2m_ctx_init:
> +	v4l2_fh_del(&ctx->fh, file);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +	mutex_unlock(&dec_dev->dev_mutex);
> +
> +	return ret;
> +}
> +
> +static int fops_vcodec_release(struct file *file)
> +{
> +	struct aml_vdec_dev *dec_dev = video_drvdata(file);
> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file->private_data);
> +
> +	mutex_lock(&dec_dev->dev_mutex);
> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
> +	v4l2_fh_del(&ctx->fh, file);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +	mutex_unlock(&dec_dev->dev_mutex);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations aml_vdec_fops = {
> +	.owner        = THIS_MODULE,
> +	.open        = fops_vcodec_open,
> +	.release    = fops_vcodec_release,
> +	.poll        = v4l2_m2m_fop_poll,
> +	.unlocked_ioctl    = video_ioctl2,
> +	.mmap        = v4l2_m2m_fop_mmap,
> +};
> +
> +static const struct video_device dec_dev = {
> +	.name = "aml_dev_drv",
> +	.fops = &aml_vdec_fops,
> +	.ioctl_ops = &aml_vdec_ioctl_ops,
> +	.release = video_device_release,
> +	.vfl_dir = VFL_DIR_M2M,
> +	.device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
> +};
> +
> +static const struct media_device_ops aml_m2m_media_ops = {
> +	.req_validate = vb2_request_validate,
> +	.req_queue = v4l2_m2m_request_queue,
> +};
> +
> +static int aml_vdec_drv_probe(struct platform_device *pdev)
> +{
> +	struct aml_vdec_dev *dev;
> +	struct video_device *vfd_dec;
> +	struct aml_vdec_hw *hw;
> +	int ret = 0;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->plat_dev = pdev;
> +	mutex_init(&dev->dev_mutex);
> +
> +	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "v4l2_device_register err\n");
> +
> +	vfd_dec = video_device_alloc();
> +	if (!vfd_dec) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to allocate video device\n");
> +		ret = -ENOMEM;
> +		goto err_device_alloc;
> +	}
> +	*vfd_dec = dec_dev;
> +	vfd_dec->v4l2_dev = &dev->v4l2_dev;
> +	vfd_dec->lock = &dev->dev_mutex;
> +	video_set_drvdata(vfd_dec, dev);
> +	dev->vfd = vfd_dec;
> +	platform_set_drvdata(pdev, dev);
> +
> +	hw = kzalloc(sizeof(*hw), GFP_KERNEL);
> +	if (!hw) {
> +		ret = -ENOMEM;
> +		goto err_dec_mem_init;
> +	}
> +	dev->dec_hw = hw;
> +
> +	dev->pvdec_data = of_device_get_match_data(&pdev->dev);
> +	ret = dev->pvdec_data->req_hw_resource(dev);
> +	if (ret < 0)
> +		goto err_hw_init;
> +
> +	dev->m2m_dev_dec = v4l2_m2m_init(&aml_vdec_m2m_ops);
> +	if (IS_ERR((__force void *)dev->m2m_dev_dec)) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem dec device\n");
> +		ret = PTR_ERR((__force void *)dev->m2m_dev_dec);
> +		goto err_hw_init;
> +	}
> +
> +	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register video device");
> +		goto err_vid_dev_register;
> +	}
> +
> +	v4l2_info(&dev->v4l2_dev, "Registered %s as /dev/%s\n",
> +		  vfd_dec->name, video_device_node_name(vfd_dec));
> +
> +	dev->mdev.dev = &pdev->dev;
> +	strscpy(dev->mdev.model, AML_VDEC_DRV_NAME, sizeof(dev->mdev.model));
> +	media_device_init(&dev->mdev);
> +	dev->mdev.ops = &aml_m2m_media_ops;
> +	dev->v4l2_dev.mdev = &dev->mdev;
> +
> +	ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec, vfd_dec,
> +						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
> +		goto error_m2m_mc_register;
> +	}
> +
> +	ret = media_device_register(&dev->mdev);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register media device");
> +		goto err_media_dev_register;
> +	}
> +	vdec_enable(dev->dec_hw);
> +	return 0;
> +
> +err_media_dev_register:
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +error_m2m_mc_register:
> +	media_device_cleanup(&dev->mdev);
> +err_vid_dev_register:
> +	v4l2_m2m_release(dev->m2m_dev_dec);
> +err_hw_init:
> +	kfree(hw);
> +	dev->dec_hw = NULL;
> +err_dec_mem_init:
> +	video_device_release(vfd_dec);
> +err_device_alloc:
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +	return ret;
> +}
> +
> +static void aml_vdec_drv_remove(struct platform_device *pdev)
> +{
> +	struct aml_vdec_dev *dev = platform_get_drvdata(pdev);
> +
> +	vdec_disable(dev->dec_hw);
> +
> +	if (media_devnode_is_registered(dev->mdev.devnode)) {
> +		media_device_unregister(&dev->mdev);
> +		media_device_cleanup(&dev->mdev);
> +	}
> +
> +	if (dev->m2m_dev_dec)
> +		v4l2_m2m_release(dev->m2m_dev_dec);
> +	if (dev->vfd)
> +		video_unregister_device(dev->vfd);
> +	if (dev->dec_hw)
> +		dev->pvdec_data->destroy_hw_resource(dev);
> +
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +
> +	pr_debug("aml v4l2 decoder driver remove\n");
> +}
> +
> +static const struct of_device_id aml_vdec_match[] = {
> +	{.compatible = "amlogic,s4-vcodec-dec", .data = &aml_vdec_s4_pdata},
> +	{},
> +};
> +
> +static struct platform_driver aml_vcodec_dec_driver = {
> +	.probe    = aml_vdec_drv_probe,
> +	.remove    = aml_vdec_drv_remove,
> +	.driver    = {
> +		.name    = AML_VDEC_DRV_NAME,

Use proper formatting here

> +		.of_match_table = aml_vdec_match,
> +	},
> +};
> +
> +static int __init aml_vdec_init(void)
> +{
> +	pr_debug("aml v4l2 decoder module init\n");
> +
> +	if (platform_driver_register(&aml_vcodec_dec_driver)) {
> +		pr_err("failed to register aml v4l2 decoder\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit aml_vdec_exit(void)
> +{
> +	pr_debug("aml v4l2 decoder module exit\n");
> +	platform_driver_unregister(&aml_vcodec_dec_driver);
> +}
> +
> +module_init(aml_vdec_init);
> +module_exit(aml_vdec_exit);
> +
> +MODULE_DESCRIPTION("Amlogic V4L2 decoder driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.h b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.h
> new file mode 100644
> index 000000000000..f3318cceff3f
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.h
> @@ -0,0 +1,194 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#ifndef _AML_VDEC_DRV_H_
> +#define _AML_VDEC_DRV_H_
> +
> +#include <linux/platform_device.h>
> +#include <linux/videodev2.h>
> +#include <linux/clk.h>
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#define AML_VCODEC_MAX_PLANES 3
> +#define AML_VDEC_MIN_W    64U
> +#define AML_VDEC_MIN_H    64U
> +#define AML_VDEC_1080P_MAX_H  1088U
> +#define AML_VDEC_1080P_MAX_W  1920U
> +
> +struct aml_vdec_ctx;
> +/**
> + * enum aml_fmt_type - Type of format type
> + */
> +enum aml_fmt_type {
> +	AML_FMT_DEC = 0,
> +	AML_FMT_FRAME = 1,
> +};
> +
> +/**
> + * enum aml_codec_type - Type of codec format
> + */
> +enum aml_codec_type {
> +	CODEC_TYPE_H264 = 0,
> +	CODEC_TYPE_FRAME,
> +};
> +
> +/**
> + * enum aml_q_type - Type of queue : cap or output
> + */
> +enum aml_q_type {
> +	AML_Q_DATA_SRC = 0,
> +	AML_Q_DATA_DST = 1,
> +};
> +
> +/**
> + * struct aml_video_fmt - aml video decoder fmt information
> + * @fourcc: FourCC code of the format. See V4L2_PIX_FMT_*.
> + * @type: Curr queue type: capture or output.
> + * @codec_type: Codec mode related. See aml_codec_type.
> + * @num_planes: Num planes of the format.
> + * @name: Name of the format.
> + * @stepwise: Supported range of frame sizes (only for bitstream formats).
> + */
> +struct aml_video_fmt {
> +	u32 fourcc;
> +	enum aml_fmt_type type;
> +	enum aml_codec_type codec_type;
> +	u32 num_planes;
> +	const u8 *name;
> +	struct v4l2_frmsize_stepwise stepwise;
> +};
> +
> +/**
> + * struct aml_q_data - aml video queue information
> + * @visible_width: Width for display.
> + * @visible_height: Height for display.
> + * @coded_width: Width for decode, which is 64/32 aligned.
> + * @coded_height: Height for decode, which is 64/32 aligned.
> + * @filed_flag: Field pic flag.
> + * @bytesperline: Byte num of each pixel line.
> + * @sizeimage: Size of frame in bytes.
> + * @fmt: Format for curr queue. See struct aml_video_fmt.
> + */
> +struct aml_q_data {
> +	u32 visible_width;
> +	u32 visible_height;
> +	u32 coded_width;
> +	u32 coded_height;
> +	u32 filed_flag;
> +	u32 bytesperline[AML_VCODEC_MAX_PLANES];
> +	u32 sizeimage[AML_VCODEC_MAX_PLANES];
> +	struct aml_video_fmt *fmt;
> +};
> +
> +/**
> + * struct aml_vdec_dev - driver data
> + * @plat_dev: Platform device for the current driver.
> + * @v4l2_dev: V4L2 device to register video devices for.
> + * @m2m_dev_dec: Mem2mem device associated to this device.
> + * @vfd: Video_device associated to this device.
> + * @mdev: Media_device associated to this device.
> + * @dec_ctx: Decoder context. See struct aml_vdec_ctx.
> + * @dec_hw: Decoder hardware resources. See struct aml_vdec_hw.
> + * @pvdec_data: Decoder platform data. See struct aml_dev_platform_data.
> + * @dev_mutex: video_device lock.
> + * @filp: v4l2 file handle pointer.
> + */
> +struct aml_vdec_dev {
> +	struct platform_device *plat_dev;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_m2m_dev *m2m_dev_dec;
> +	struct video_device *vfd;
> +	struct media_device mdev;
> +
> +	struct aml_vdec_ctx *dec_ctx;
> +	struct aml_vdec_hw *dec_hw;
> +	const struct aml_dev_platform_data *pvdec_data;
> +
> +	struct mutex dev_mutex;
> +	struct file *filp;
> +};
> +
> +/**
> + * struct dec_pic_info - pic information description
> + * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
> + * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
> + * @xfer_func: enum v4l2_xfer_func, colorspace transfer function
> + * @quantization: enum v4l2_quantization, colorspace quantization
> + * @cap_pix_fmt: Pixel format for capture queue.
> + * @output_pix_fmt: Pixel format for output queue.
> + * @coded_width: Width for decode.
> + * @coded_height: Height for decode.
> + * @fb_size: Frame buffer size for Y or UV.
> + * @plane_num: Num for planes for curr format.
> + */
> +struct dec_pic_info {
> +	enum v4l2_colorspace colorspace;
> +	enum v4l2_ycbcr_encoding ycbcr_enc;
> +	enum v4l2_xfer_func xfer_func;
> +	enum v4l2_quantization quantization;
> +	u32 cap_pix_fmt;
> +	u32 output_pix_fmt;
> +	u32 coded_width;
> +	u32 coded_height;
> +	u32 fb_size[2];
> +	u32 plane_num;
> +};
> +
> +/**
> + * struct aml_vdec_ctx - driver instance context
> + * @dev: pointer to the aml_vdec_dev of the device.
> + * @fh: struct v4l2 fh.
> + * @m2m_ctx: pointer to v4l2_m2m_ctx context.
> + * @ctrl_handler: V4L2 ctrl handler.
> + * @v4l2_intf_lock: Mutex lock for v4l2 interface.
> + * @codec_ops: Codec operation functions. See struct aml_codec_ops.
> + * @int_cond: Variable used by the waitqueue.
> + * @queue: Waitqueue to wait for the current decode context finish.
> + * @q_data: feature supported by the current decoder instance.
> + * @is_cap_streamon: indicates if the current capture stream is on.
> + * @is_output_streamon: indicates if the current output stream is on.
> + * @dos_clk_en: indicates if dos clk is enabled.
> + * @pic_info: Pic information for curr decoder context. See struct dec_pic_info.
> + * @curr_dec_type: Current decoder type. (CODEC_TYPE_H264, etc.)
> + * @codec_priv: Pointer to current decoder instance.
> + */
> +struct aml_vdec_ctx {
> +	struct aml_vdec_dev *dev;
> +	struct v4l2_fh fh;
> +	struct v4l2_m2m_ctx *m2m_ctx;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct mutex v4l2_intf_lock;
> +
> +	const struct aml_codec_ops *codec_ops;
> +	int int_cond;
> +	wait_queue_head_t queue;
> +	struct aml_q_data q_data[2];
> +
> +	bool is_cap_streamon;
> +	bool is_output_streamon;
> +	bool dos_clk_en;
> +
> +	struct dec_pic_info pic_info;
> +	u32 curr_dec_type;
> +	void *codec_priv;
> +};
> +
> +static inline struct aml_vdec_ctx *fh_to_dec_ctx(struct v4l2_fh *fh)
> +{
> +	return container_of(fh, struct aml_vdec_ctx, fh);
> +}
> +
> +static inline struct aml_vdec_ctx *ctrl_to_dec_ctx(struct v4l2_ctrl_handler *ctrl)
> +{
> +	return container_of(ctrl, struct aml_vdec_ctx, ctrl_handler);
> +}
> +
> +#endif
> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
> new file mode 100644
> index 000000000000..4db0e3076761
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
> @@ -0,0 +1,652 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +#include <linux/firmware.h>
> +
> +#include "aml_vdec_drv.h"
> +#include "aml_vdec_hw.h"
> +#include "aml_vdec_platform.h"
> +#include "aml_vdec_canvas_utils.h"
> +
> +#define MHz     (1000000)
> +#define MC_SIZE (4096 * 16)
> +
> +static void __iomem *reg_base[MAX_REG_BUS];
> +
> +static struct pm_pd_s vdec_domain_data[] = {
> +	[VDEC_1] = {.name = "pwrc-vdec", },
> +	[VDEC_HEVC] = {.name = "pwrc-hevc", },
> +};
> +
> +u32 read_dos_reg(u32 addr)
> +{
> +	return readl(reg_base[DOS_BUS] + (addr << 2));
> +}
> +
> +void write_dos_reg(u32 addr, int val)
> +{
> +	writel(val, reg_base[DOS_BUS] + (addr << 2));
> +}
> +
> +u32 read_dmc_reg(u32 addr)
> +{
> +	return readl(reg_base[DMC_BUS] + (addr << 2));
> +}
> +
> +void write_dmc_reg(u32 addr, int val)
> +{
> +	writel(val, reg_base[DMC_BUS] + (addr << 2));
> +}
> +
> +void dos_reg_set_mask(u32 addr, u32 mask)
> +{
> +	u32 r;
> +
> +	r = read_dos_reg(addr);
> +	write_dos_reg(addr, (r | mask));
> +}
> +
> +void dos_reg_clear_mask(u32 addr, u32 mask)
> +{
> +	u32 r;
> +
> +	r = read_dos_reg(addr);
> +	write_dos_reg(addr, (r & (~mask)));
> +}
> +
> +void dos_reg_write_bits(u32 reg, u32 val, int start, int len)
> +{
> +	u32 to_val = read_dos_reg(reg);
> +	u32 mask = (((1L << (len)) - 1) << (start));
> +
> +	to_val &= ~mask;
> +	to_val |= (val << start) & mask;
> +	write_dos_reg(reg, to_val);
> +}

Do not reinvent register writting, use regmap for all that.

> +
> +void dos_enable(void)
> +{
> +	WRITE_VREG_BITS(DOS_GCLK_EN0, 0x3ff, 0, 10);
> +
> +	WRITE_VREG(GCLK_EN, 0x3ff);
> +
> +	CLEAR_VREG_MASK(MDEC_PIC_DC_CTRL, (1 << 31));
> +}
> +
> +void aml_vdec_reset_core(void)
> +{
> +	unsigned int mask = 0;
> +
> +	mask = (1 << 21);
> +
> +	write_dmc_reg(0x0, (read_dmc_reg(0x0) & ~mask));
> +	usleep_range(60, 70);
> +	WRITE_VREG(DOS_SW_RESET0, (1 << 3) | (1 << 4) |
> +		   (1 << 5) | (1 << 7) | (1 << 8) | (1 << 9));
> +	WRITE_VREG(DOS_SW_RESET0, 0);
> +	CLEAR_VREG_MASK(VDEC_ASSIST_MMC_CTRL1, 1 << 3);
> +	CLEAR_VREG_MASK(MDEC_PIC_DC_MUX_CTRL, 1 << 31);
> +	WRITE_VREG(MDEC_EXTIF_CFG1, 0);
> +
> +	write_dmc_reg(0x0, (read_dmc_reg(0x0) | mask));
> +}
> +
> +void aml_start_vdec_hw(void)
> +{
> +	RD_VREG(DOS_SW_RESET0);
> +	RD_VREG(DOS_SW_RESET0);
> +	RD_VREG(DOS_SW_RESET0);
> +
> +	WRITE_VREG(DOS_SW_RESET0, (1 << 12) | (1 << 11));
> +	WRITE_VREG(DOS_SW_RESET0, 0);
> +
> +	RD_VREG(DOS_SW_RESET0);
> +	RD_VREG(DOS_SW_RESET0);
> +	RD_VREG(DOS_SW_RESET0);
> +
> +	WRITE_VREG(MPSR, 0x0001);

This is basilly copuy of downstream code, use proper register writing
functions and stop using downstream macros.

> +}
> +
> +void aml_stop_vdec_hw(void)
> +{
> +	ulong timeout = jiffies + HZ / 10;
> +
> +	WRITE_VREG(MPSR, 0);
> +	WRITE_VREG(CPSR, 0);
> +
> +	while (RD_VREG(IMEM_DMA_CTRL) & 0x8000) {
> +		if (time_after(jiffies, timeout))
> +			break;
> +	}

Use read_poll_timeout() or any variant instead of re-inventig polling.

> +
> +	timeout = jiffies + HZ / 10;
> +	while (RD_VREG(LMEM_DMA_CTRL) & 0x8000) {
> +		if (time_after(jiffies, timeout))
> +			break;
> +	}
> +
> +	timeout = jiffies + HZ / 80;
> +	while (RD_VREG(WRRSP_LMEM) & 0xfff) {
> +		if (time_after(jiffies, timeout)) {
> +			pr_err("%s, ctrl %x, rsp %x, pc %x status %x,%x\n",
> +			       __func__, RD_VREG(LMEM_DMA_CTRL),
> +			       RD_VREG(WRRSP_LMEM), RD_VREG(MPC_E),
> +			       RD_VREG(AV_SCRATCH_J), RD_VREG(AV_SCRATCH_9));
> +			break;
> +		}
> +	}
> +
> +	RD_VREG(DOS_SW_RESET0);
> +	RD_VREG(DOS_SW_RESET0);
> +	RD_VREG(DOS_SW_RESET0);
> +
> +	WRITE_VREG(DOS_SW_RESET0, (1 << 12) | (1 << 11));
> +	WRITE_VREG(DOS_SW_RESET0, 0);
> +
> +	RD_VREG(DOS_SW_RESET0);
> +	RD_VREG(DOS_SW_RESET0);
> +	RD_VREG(DOS_SW_RESET0);
> +}
> +
> +int load_firmware(struct aml_vdec_hw *hw, const char *path)
> +{
> +	const struct firmware *fw;
> +	struct device *dev = hw->dev;
> +	static u8 *mc_addr;
> +	static dma_addr_t mc_addr_map;
> +	int fw_head_len;
> +	ulong timeout;
> +	int ret;
> +
> +	ret = request_firmware(&fw, path, dev);
> +	if (ret < 0) {
> +		pr_info("request_firmware %s failed ret %d\n", path, ret);
> +		return -EINVAL;
> +	}
> +
> +	if (fw->size > MC_SIZE) {
> +		pr_info("fw %s oversize\n", path);
> +		ret = -EINVAL;
> +		goto release_firmware;
> +	}
> +
> +	fw_head_len = 512;
> +	mc_addr = dma_alloc_coherent(dev, MC_SIZE, &mc_addr_map, GFP_KERNEL);
> +	if (!mc_addr) {
> +		pr_info("no mem for fw %s\n", path);
> +		ret = -ENOMEM;
> +		goto release_firmware;
> +	}
> +	memset(mc_addr, 0, MC_SIZE);
> +	memcpy(mc_addr, ((u8 *)fw->data + fw_head_len),
> +	       (fw->size - fw_head_len));
> +
> +	WRITE_VREG(MPSR, 0);
> +	WRITE_VREG(CPSR, 0);
> +
> +	timeout = RD_VREG(MPSR);
> +	timeout = RD_VREG(MPSR);
> +	timeout = jiffies + HZ;
> +
> +	WRITE_VREG(IMEM_DMA_ADR, mc_addr_map);
> +	WRITE_VREG(IMEM_DMA_COUNT, 0x1000);
> +	WRITE_VREG(IMEM_DMA_CTRL, (0x8000 | (7 << 16)));
> +
> +	while (RD_VREG(IMEM_DMA_CTRL) & 0x8000) {
> +		if (time_before(jiffies, timeout)) {
> +			schedule();
> +		} else {
> +			pr_info("vdec load mc error\n");
> +			ret = -EBUSY;
> +			break;
> +		}
> +	}
> +
> +	/* Only h264 needs this step */
> +	if (hw->hw_ops.load_firmware_ex) {
> +		ret = hw->hw_ops.load_firmware_ex(hw->curr_ctx,
> +						  mc_addr,
> +						  (fw->size - fw_head_len));
> +		if (ret < 0) {
> +			ret = -EINVAL;
> +			goto free_dma_mem;
> +		}
> +	}
> +
> +free_dma_mem:
> +	dma_free_coherent(dev, MC_SIZE, mc_addr, mc_addr_map);
> +release_firmware:
> +	release_firmware(fw);
> +	return ret;
> +}
> +
> +static int vdec_clock_gate_init(struct aml_vdec_hw *hw)
> +{
> +	int i;
> +
> +	hw->gates[VDEC].name = "vdec";
> +	hw->gates[VDEC_MUX].name = "clk_vdec_mux";
> +	hw->gates[HEVCF_MUX].name = "clk_hevcf_mux";
> +
> +	for (i = 0; i < DOS_CLK_MAX; i++) {
> +		hw->gates[i].clk = devm_clk_get(hw->dev, hw->gates[i].name);
> +		hw->gates[i].ref_count = 0;
> +		mutex_init(&hw->gates[i].mutex);
> +	}
> +
> +	return 0;
> +}
> +
> +static int vdec_gate_clk(struct gate_switch_node *gate_node, bool enable)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&gate_node->mutex);
> +	if (enable) {
> +		gate_node->ref_count++;
> +		if (gate_node->ref_count == 1) {
> +			ret = clk_prepare_enable(gate_node->clk);
> +			pr_debug("the %-15s clock on, ref cnt: %d ret = %d\n",
> +				 gate_node->name, gate_node->ref_count, ret);
> +		}
> +	} else {
> +		gate_node->ref_count--;
> +		if (!gate_node->ref_count) {
> +			clk_disable_unprepare(gate_node->clk);
> +			pr_debug("the %-15s clock off, ref cnt: %d ret = %d\n",
> +				 gate_node->name, gate_node->ref_count, ret);
> +		}
> +	}
> +	mutex_unlock(&gate_node->mutex);
> +
> +	return 0;
> +}
> +
> +static int vdec_switch_gate(struct aml_vdec_hw *hw,
> +			    const char *name, bool enable)
> +{
> +	int i;
> +
> +	for (i = 0; i < DOS_CLK_MAX; i++) {
> +		if (!strcmp(name, hw->gates[i].name)) {
> +			if (hw->gates[i].clk)
> +				vdec_gate_clk(&hw->gates[i], enable);
> +			else
> +				return -ENODEV;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int vdec_set_rate(struct aml_vdec_hw *hw,
> +			 const char *name, unsigned long hz)
> +{
> +	int i;
> +
> +	for (i = 0; i < DOS_CLK_MAX; i++) {
> +		if (!strcmp(name, hw->gates[i].name)) {
> +			if (hw->gates[i].clk && hw->gates[i].ref_count) {
> +				clk_set_rate(hw->gates[i].clk, hz);
> +				pr_debug("after set, vdec mux clock is %lu Hz\n",
> +					 clk_get_rate(hw->gates[i].clk));
> +			} else {
> +				return -ENODEV;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
> +static void pm_vdec_clock_switch(struct aml_vdec_hw *hw, int id, bool on)
> +{
> +	int ret = 0;
> +
> +	if (id == VDEC_1) {
> +		ret = vdec_switch_gate(hw, "clk_vdec_mux", on);
> +		vdec_set_rate(hw, "clk_vdec_mux", 499999992);
> +	} else if (id == VDEC_HEVC) {
> +		/* enable hevc clock */
> +		ret = vdec_switch_gate(hw, "clk_hevcf_mux", on);
> +		if (ret == -ENODEV)
> +			ret = vdec_switch_gate(hw, "clk_hevc_mux", on);
> +	}
> +
> +	if (ret < 0)
> +		pr_debug("clk %d, unreachable ret %d\n", id, ret);
> +}
> +
> +static void pm_vdec_power_switch(struct pm_pd_s *pd, int id, bool on)
> +{
> +	struct device *dev = pd[id].dev;
> +	int ret;
> +
> +	if (!dev) {
> +		pr_debug("no dev %d, maybe always on\n", id);
> +		return;
> +	}
> +
> +	if (on)
> +		ret = pm_runtime_get_sync(dev);
> +	else
> +		ret = pm_runtime_put_sync(dev);
> +
> +	pr_debug("dev: %p link %p the %-15s power %s ret %d\n",
> +		 dev, pd[id].link, pd[id].name, on ? "on" : "off", ret);
> +}

Thoses helpers functions are quite overengineered and only used in 2 functions,
just call pm_runtime_XXX, clk_XXX functions directly...

> +
> +static int pm_vdec_power_domain_init(struct aml_vdec_hw *hw)
> +{
> +	int i, err;
> +	const struct power_manager_s *pm = hw->pm;
> +	struct pm_pd_s *pd = pm->pd_data;
> +
> +	mutex_init(&hw->pm_mutex);
> +
> +	for (i = 0; i < VDEC_MAX; i++) {
> +		pd[i].dev = dev_pm_domain_attach_by_name(hw->dev, pd[i].name);
> +		if (IS_ERR_OR_NULL(pd[i].dev)) {
> +			err = PTR_ERR(pd[i].dev);
> +			pr_debug("Get %s failed, pm-domain: %d\n",
> +				 pd[i].name, err);
> +			continue;
> +		}
> +
> +		pd[i].link = device_link_add(hw->dev, pd[i].dev,
> +					     DL_FLAG_PM_RUNTIME |
> +					     DL_FLAG_STATELESS);
> +		if (IS_ERR_OR_NULL(pd[i].link)) {
> +			pr_err("Adding %s device link failed!\n", pd[i].name);
> +			return -ENODEV;
> +		}
> +
> +		pr_debug("power domain: name: %s, dev: %p, link: %p\n",
> +			 pd[i].name, pd[i].dev, pd[i].link);
> +	}
> +
> +	return 0;
> +}
> +
> +static void pm_vdec_power_domain_release(struct aml_vdec_hw *hw)
> +{
> +	int i;
> +	const struct power_manager_s *pm = hw->pm;
> +	struct pm_pd_s *pd = pm->pd_data;
> +
> +	for (i = 0; i < VDEC_MAX; i++) {
> +		if (!IS_ERR_OR_NULL(pd[i].link))
> +			device_link_del(pd[i].link);
> +
> +		if (!IS_ERR_OR_NULL(pd[i].dev))
> +			dev_pm_domain_detach(pd[i].dev, true);
> +	}
> +}
> +
> +static void dos_local_config(bool is_on, int id)
> +{
> +	if (is_on) {
> +		usleep_range(20, 100);
> +
> +		switch (id) {
> +		case VDEC_1:
> +			WRITE_VREG(DOS_MEM_PD_VDEC, 0);
> +			WRITE_VREG(DOS_SW_RESET0, 0xfffffffc);
> +			usleep_range(20, 100);
> +			WRITE_VREG(DOS_SW_RESET0, 0);
> +			usleep_range(20, 100);
> +			WRITE_VREG(DOS_MEM_PD_VDEC, 0);
> +			break;
> +		case VDEC_HEVC:
> +			WRITE_VREG(DOS_MEM_PD_HEVC, 0);
> +			WRITE_VREG(DOS_SW_RESET3, 0xffffffff);
> +			usleep_range(20, 100);
> +			WRITE_VREG(DOS_SW_RESET3, 0);
> +			usleep_range(20, 100);
> +			WRITE_VREG(DOS_MEM_PD_HEVC, 0);
> +			break;
> +		default:
> +			pr_debug("%s on, not found id %d\n", __func__, id);
> +			break;
> +		}
> +	} else {
> +		switch (id) {
> +		case VDEC_1:
> +			WRITE_VREG(DOS_SW_RESET0, 0xfffffffc);
> +			usleep_range(20, 100);
> +			WRITE_VREG(DOS_SW_RESET0, 0);
> +			usleep_range(20, 100);
> +			WRITE_VREG(DOS_MEM_PD_VDEC, 0xffffffffUL);
> +			break;
> +		case VDEC_HEVC:
> +			WRITE_VREG(DOS_SW_RESET3, 0xffffffff);
> +			usleep_range(20, 100);
> +			WRITE_VREG(DOS_SW_RESET3, 0);
> +			usleep_range(20, 100);
> +			WRITE_VREG(DOS_MEM_PD_HEVC, 0xffffffffUL);
> +			break;
> +		default:
> +			pr_debug("%s off, not found id %d\n", __func__, id);
> +			break;
> +		}
> +	}
> +
> +	pr_debug("%s end, id %d, is_on %d\n", __func__, id, is_on);
> +}
> +
> +static void pm_vdec_power_domain_power_on(struct aml_vdec_hw *hw, int id)
> +{
> +	const struct power_manager_s *pm = hw->pm;
> +
> +	pm_vdec_clock_switch(hw, id, true);
> +	pm_vdec_power_switch(pm->pd_data, id, true);
> +
> +	dos_local_config(1, id);
> +}
> +
> +static void pm_vdec_power_domain_power_off(struct aml_vdec_hw *hw, int id)
> +{
> +	const struct power_manager_s *pm = hw->pm;
> +
> +	dos_local_config(0, id);
> +
> +	pm_vdec_clock_switch(hw, id, false);
> +	pm_vdec_power_switch(pm->pd_data, id, false);
> +}
> +
> +static bool pm_vdec_power_domain_power_state(struct aml_vdec_hw *hw, int id)
> +{
> +	if (hw->pm->pd_data[id].dev)
> +		return pm_runtime_active(hw->pm->pd_data[id].dev);
> +	else
> +		return false;
> +}
> +
> +static void vdec_poweron(struct aml_vdec_hw *hw, enum vdec_type_e core)
> +{
> +	if (core >= VDEC_MAX)
> +		return;
> +
> +	mutex_lock(&hw->pm_mutex);
> +	if (!hw->pm->pd_data[core].dev)
> +		goto out;
> +
> +	hw->pm->pd_data[core].ref_count++;
> +	if (hw->pm->pd_data[core].ref_count > 1)
> +		goto out;
> +
> +	if (hw->pm->power_state(hw, core))
> +		goto out;
> +
> +	hw->pm->power_on(hw, core);
> +
> +out:
> +	mutex_unlock(&hw->pm_mutex);
> +}
> +
> +static void vdec_poweroff(struct aml_vdec_hw *hw, enum vdec_type_e core)
> +{
> +	if (core >= VDEC_MAX)
> +		return;
> +
> +	mutex_lock(&hw->pm_mutex);
> +	if (hw->pm->pd_data[core].ref_count == 0)
> +		goto out;
> +
> +	hw->pm->pd_data[core].ref_count--;
> +	if (hw->pm->pd_data[core].ref_count > 0)
> +		goto out;
> +
> +	hw->pm->power_off(hw, core);
> +
> +out:
> +	mutex_unlock(&hw->pm_mutex);
> +}
> +
> +int vdec_enable(struct aml_vdec_hw *hw)
> +{
> +	vdec_switch_gate(hw, "vdec", 1);
> +	vdec_poweron(hw, VDEC_1);
> +
> +	return 0;
> +}
> +
> +int vdec_disable(struct aml_vdec_hw *hw)
> +{
> +	vdec_poweroff(hw, VDEC_1);
> +	vdec_switch_gate(hw, "vdec", 0);
> +
> +	return 0;
> +}
> +
> +static const struct power_manager_s pm[] = {
> +	[AML_PM_PD] = {
> +		.pd_data    = vdec_domain_data,
> +		.init        = pm_vdec_power_domain_init,
> +		.release    = pm_vdec_power_domain_release,
> +		.power_on    = pm_vdec_power_domain_power_on,
> +		.power_off    = pm_vdec_power_domain_power_off,
> +		.power_state = pm_vdec_power_domain_power_state,
> +	},
> +};
> +
> +static irqreturn_t vdec_irq_handler(int irq, void *priv)
> +{
> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
> +	struct aml_vdec_hw *hw = dev->dec_hw;
> +	irqreturn_t ret;
> +
> +	if (hw->hw_ops.irq_handler)
> +		ret = hw->hw_ops.irq_handler(irq, priv);
> +
> +	return ret;
> +}
> +
> +static irqreturn_t vdec_threaded_isr_handler(int irq, void *priv)
> +{
> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
> +	struct aml_vdec_hw *hw = dev->dec_hw;
> +	irqreturn_t ret = IRQ_HANDLED;
> +
> +	if (hw->hw_ops.irq_threaded_func)
> +		ret = hw->hw_ops.irq_threaded_func(irq, priv);
> +
> +	return ret;
> +}
> +
> +struct aml_vdec_hw *vdec_get_hw(void *priv)
> +{
> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
> +
> +	return dev->dec_hw;
> +}
> +
> +int dev_request_hw_resources(void *priv)
> +{
> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
> +	struct aml_vdec_hw *hw;
> +	struct platform_device *pdev;
> +	struct resource res;
> +	u32 res_size;
> +	int i;
> +	int ret = -1;
> +
> +	if (!dev || !dev->dec_hw) {
> +		pr_err("%s param invalid\n", __func__);
> +		return -1;
> +	}
> +	pdev = dev->plat_dev;
> +	hw = dev->dec_hw;
> +	hw->dev = &pdev->dev;
> +
> +	hw->dec_irq = platform_get_irq(pdev, VDEC_IRQ_1);
> +	if (hw->dec_irq < 0) {
> +		dev_err(&pdev->dev, "get irq failed\n");
> +		return hw->dec_irq;
> +	}
> +	ret = devm_request_threaded_irq(&pdev->dev, hw->dec_irq, vdec_irq_handler,
> +					vdec_threaded_isr_handler, IRQF_ONESHOT,
> +					"vdec-1", dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to install irq %d (%d)",
> +			hw->dec_irq, ret);
> +		return -1;
> +	}
> +
> +	for (i = 0; i < MAX_REG_BUS; i++) {
> +		if (of_address_to_resource(pdev->dev.of_node, i, &res)) {
> +			pr_err("of_address_to_resource %d failed\n", i);
> +			return -EINVAL;
> +		}
> +
> +		res_size = resource_size(&res);
> +		hw->regs[i] = ioremap(res.start, res_size);
> +		reg_base[i] = hw->regs[i];
> +
> +		pr_debug("%s, res start %llx, end %llx, iomap: %p\n",
> +			 __func__, (unsigned long long)res.start,
> +			 (unsigned long long)res.end, reg_base[i]);
> +	}
> +
> +	hw->pm = &pm[dev->pvdec_data->power_type];
> +	if (hw->pm->init) {
> +		ret = hw->pm->init(hw);
> +		if (ret < 0) {
> +			pr_err("power mgr init failed!\n");
> +			return ret;
> +		}
> +	}
> +	vdec_clock_gate_init(hw);
> +
> +	aml_vdec_canvas_register(hw);
> +
> +	pr_debug("##Amlogic hw resource init OK##\n");
> +
> +	return 0;
> +}
> +
> +void dev_destroy_hw_resources(void *priv)
> +{
> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
> +	struct aml_vdec_hw *hw;
> +
> +	if (!dev || !dev->dec_hw) {
> +		pr_err("%s param invalid\n", __func__);
> +		return;
> +	}
> +	hw = dev->dec_hw;
> +
> +	if (hw->pm->release)
> +		hw->pm->release(hw);
> +
> +	kfree(hw);
> +	dev->dec_hw = NULL;
> +	pr_debug("##Amlogic hw resource release OK##\n");
> +}
> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h
> new file mode 100644
> index 000000000000..ad1e613a2cf8
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h
> @@ -0,0 +1,182 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#ifndef _AML_VDEC_HW_H_
> +#define _AML_VDEC_HW_H_
> +
> +#include <linux/module.h>
> +#include <linux/clk.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/delay.h>
> +#include <linux/regmap.h>
> +#include <linux/interrupt.h>
> +#include "reg_defines.h"
> +
> +#define VDEC_FIFO_ALIGN     8
> +#define VLD_PADDING_SIZE    1024
> +
> +#define RD_VREG(addr) read_dos_reg(addr)
> +#define WRITE_VREG(addr, val) write_dos_reg(addr, val)
> +#define WRITE_VREG_BITS(r, val, start, len) dos_reg_write_bits(r, val, start, len)
> +#define CLEAR_VREG_MASK(r, mask) dos_reg_clear_mask(r, mask)
> +#define SET_VREG_MASK(r, mask) dos_reg_set_mask(r, mask)


Please drop this macros and use the functions directly.

> +
> +/**
> + * struct aml_vdec_hw_ops - codec mode specific operations for hw
> + * @load_firmware_ex: Load firmware for current dec specific.
> + * @irq_handler: mandatory call when the ISR triggers
> + * @irq_threaded_func: mandatory call for the threaded ISR
> + * @canvas_alloc: Alloc canvas for curr frame
> + * @canvas_free: Release canvas.
> + * @config_canvas: Config for curr frame, such as w/h, Y/UV start addr etc.
> + */
> +struct aml_vdec_hw_ops {
> +	int (*load_firmware_ex)(void *priv, const u8 *data, u32 len);
> +	irqreturn_t (*irq_handler)(int irq, void *priv);
> +	irqreturn_t (*irq_threaded_func)(int irq, void *priv);
> +	int (*canvas_alloc)(u8 *canvas_index);
> +	void (*canvas_free)(u8 canvas_index);
> +	void (*config_canvas)(u8 canvas_index,
> +			      ulong addr, u32 width, u32 height,
> +			      u32 wrap, u32 blkmode, u32 endian);
> +};
> +
> +/**
> + * enum vdec_type_e - Type of decoder hardware.
> + */
> +enum vdec_type_e {
> +	VDEC_1 = 0,
> +	VDEC_HEVC,
> +	VDEC_MAX,
> +};
> +
> +/**
> + * enum vdec_irq_num - Definition of the irq.
> + */
> +enum vdec_irq_num {
> +	VDEC_IRQ_0 = 0,
> +	VDEC_IRQ_1,
> +	VDEC_IRQ_2,
> +	VDEC_IRQ_MAX,
> +};
> +
> +/**
> + * enum vdec_type_e - Type of decoder clock.
> + */
> +enum clk_type_e {
> +	VDEC = 0,
> +	VDEC_MUX,
> +	HEVCF_MUX,
> +	DOS_CLK_MAX,
> +};
> +
> +/**
> + * enum aml_power_type_e - Type of decoder power.
> + */
> +enum aml_power_type_e {
> +	AML_PM_PD = 0,
> +};
> +
> +/**
> + * enum mm_bus_e - Type of decoder hardware bus.
> + */
> +enum mm_bus_e {
> +	DOS_BUS = 0,
> +	DMC_BUS,
> +	MAX_REG_BUS
> +};
> +
> +/**
> + * struct gate_switch_node - clock node definition
> + * @clk: Pointer to clk instance.
> + * @name: Clock name used.
> + * @mutex: Mutex lock for multi decoder instance.
> + * @ref_count: Curr clk instance ref count.
> + */
> +struct gate_switch_node {
> +	struct clk *clk;
> +	const char *name;
> +	struct mutex mutex;
> +	int ref_count;
> +};
> +
> +/**
> + * struct pm_pd_s - power domain definition
> + * @name: Power domain name.
> + * @dev: Pointer to device structure.
> + * @mutex: Pointer to device_link structure.
> + * @ref_count: Curr power domain instance ref count.
> + */
> +struct pm_pd_s {
> +	u8 *name;
> +	struct device *dev;
> +	struct device_link *link;
> +	int ref_count;
> +};
> +
> +/**
> + * struct aml_vdec_hw - decoder hardware resources definition
> + * @pdev: Pointer to struct platform_device.
> + * @dev: Pointer to struct device.
> + * @regs: Reg base for dos/dmc hardware.
> + * @pm_mutex: Mutex for pm->pd_data.
> + * @pm: Pointer to struct power_manager_s.
> + * @hw_ops: Hardware resource operation functions. See struct aml_vdec_hw_ops.
> + * @gates: Clk instance used by curr decoder context.
> + * @dec_irq: Irq registered.
> + * @curr_ctx: Pointer to curr decoder context.
> + */
> +struct aml_vdec_hw {
> +	struct platform_device *pdev;
> +	struct device *dev;
> +	void __iomem *regs[MAX_REG_BUS];
> +	struct mutex pm_mutex;
> +	const struct power_manager_s *pm;
> +	struct aml_vdec_hw_ops hw_ops;
> +	struct gate_switch_node gates[DOS_CLK_MAX];
> +	int dec_irq;
> +	void *curr_ctx;
> +};
> +
> +/**
> + * struct power_manager_s - Power manager & opertion function
> + * @pd_data: Pointer to struct pm_pd_s
> + * @init: Power manager init.
> + * @release: Power manager release.
> + * @power_on: Power on for decoder hw.
> + * @power_off: Power off for decoder hw.
> + * @power_state: Query the power state.
> + */
> +struct power_manager_s {
> +	struct pm_pd_s *pd_data;
> +	int (*init)(struct aml_vdec_hw *hw);
> +	void (*release)(struct aml_vdec_hw *hw);
> +	void (*power_on)(struct aml_vdec_hw *hw, int id);
> +	void (*power_off)(struct aml_vdec_hw *hw, int id);
> +	bool (*power_state)(struct aml_vdec_hw *hw, int id);
> +};
> +
> +int dev_request_hw_resources(void *priv);
> +void dev_destroy_hw_resources(void *priv);
> +struct aml_vdec_hw *vdec_get_hw(void *priv);
> +u32 read_dos_reg(u32 reg_addr);
> +void write_dos_reg(u32 addr, int val);
> +void dos_reg_write_bits(u32 reg, u32 val, int start, int len);
> +void dos_reg_clear_mask(u32 addr, u32 mask);
> +void dos_reg_set_mask(u32 addr, u32 mask);
> +u32 read_dmc_reg(u32 addr);
> +void write_dmc_reg(u32 addr, int val);
> +int vdec_enable(struct aml_vdec_hw *hw);
> +int vdec_disable(struct aml_vdec_hw *hw);
> +void dos_enable(void);
> +void aml_start_vdec_hw(void);
> +void aml_stop_vdec_hw(void);
> +int load_firmware(struct aml_vdec_hw *hw, const char *path);
> +void aml_vdec_reset_core(void);
> +
> +#endif
> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
> new file mode 100644
> index 000000000000..f1f8ba1f4ff6
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#include "aml_vdec_platform.h"
> +#include "aml_vdec_drv.h"
> +#include "aml_vdec_hw.h"
> +#include "h264.h"
> +
> +#define VIDEO_DEC_H264  "s4_h264_multi.bin"
> +
> +const struct aml_codec_ops aml_S4_dec_ops[] = {
> +	[CODEC_TYPE_H264] = {
> +		.init = aml_h264_init,
> +		.exit = aml_h264_exit,
> +		.run = aml_h264_dec_run,
> +	},
> +};
> +
> +static const struct aml_video_dec_fmt aml_S4_dec_fmts = {
> +	.max_height = AML_VDEC_1080P_MAX_H,
> +	.max_width = AML_VDEC_1080P_MAX_W,
> +	.align = 32,
> +	.is_10_bit_support = 0,
> +};
> +
> +const struct aml_dev_platform_data aml_vdec_s4_pdata = {
> +	.dec_fmt = &aml_S4_dec_fmts,
> +	.codec_ops = aml_S4_dec_ops,
> +	.power_type = AML_PM_PD,
> +	.req_hw_resource = dev_request_hw_resources,
> +	.destroy_hw_resource = dev_destroy_hw_resources,
> +	.fw_path = {
> +		VIDEO_DEC_H264,
> +	},
> +};
> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.h b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.h
> new file mode 100644
> index 000000000000..ff0933f6f074
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#ifndef AML_VDEC_PLATFORM_H_
> +#define AML_VDEC_PLATFORM_H_
> +
> +#include <linux/videodev2.h>
> +
> +#define MAX_DEC_FORMAT 3
> +
> +/**
> + * struct aml_codec_ops - codec mode specific operations
> + * @init: Used for decoder initialization.
> + * @exit: If needed, can be used to undo the .init phase.
> + * @run: Start a single decoding job. Called from atomic context.
> + * Caller should ensure that a pair of buffers is ready and the
> + * hardware is powered on and clk is enabled. Returns zero if OK,
> + * a negative value in error cases.
> + */
> +struct aml_codec_ops {
> +	int (*init)(void *priv);
> +	void (*exit)(void *priv);
> +	int (*run)(void *priv);
> +};
> +
> +/**
> + * struct aml_video_dec_fmt - codec format required by platform
> + * @max_height: Max decode frame height of current platform.
> + * @max_width: Max decode frame width of current platform.
> + * @align: Align requirement of the current platform.
> + * @is_10_bit_support: Whether the platform supports 10 bit.
> + */
> +struct aml_video_dec_fmt {
> +	u32 max_height;
> +	u32 max_width;
> +	int align;
> +	int is_10_bit_support;
> +};
> +
> +/**
> + * struct aml_dev_platform_data - compatible data for each chip.
> + * @dec_fmt: Support dec format.
> + * @codec_ops: Codec operation function.
> + * @req_hw_resource: Operation function to request the hardware resource.
> + * @destroy_hw_resource: Operation function to release the hardware resource.
> + * @power_type: Type of power that the current chip need. See aml_power_type_e.
> + * @fw_path: Path of the firmware.bin.
> + */
> +struct aml_dev_platform_data {
> +	const struct aml_video_dec_fmt *dec_fmt;
> +	const struct aml_codec_ops *codec_ops;
> +	int (*req_hw_resource)(void *priv);
> +	void (*destroy_hw_resource)(void *priv);
> +	int power_type;
> +	const char *fw_path[MAX_DEC_FORMAT];
> +};
> +
> +extern const struct aml_dev_platform_data aml_vdec_s4_pdata;
> +
> +#endif
> diff --git a/drivers/media/platform/amlogic/vdec/h264.c b/drivers/media/platform/amlogic/vdec/h264.c
> new file mode 100644
> index 000000000000..ebfd10885eaa
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/h264.c
> @@ -0,0 +1,1790 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <media/v4l2-h264.h>
> +#include <linux/vmalloc.h>
> +#include "aml_vdec.h"
> +#include "aml_vdec_hw.h"
> +#include "h264.h"
> +
> +#define INVALID_POC 0xffffffff
> +
> +#define H264_SLICE_HEADER_DONE		0x1
> +#define H264_SLICE_DATA_DONE		0x2
> +
> +#define DECODER_TIMEOUT_MS			500
> +
> +#define COL_BUFFER_MARGIN			2
> +
> +struct vdec_h264_stateless_ctrl_ref {
> +	const struct v4l2_ctrl_h264_decode_params *decode;
> +	const struct v4l2_ctrl_h264_scaling_matrix *scaling;
> +	const struct v4l2_ctrl_h264_sps *sps;
> +	const struct v4l2_ctrl_h264_pps *pps;
> +};
> +
> +enum SliceType {
> +	P_SLICE = 0,
> +	B_SLICE = 1,
> +	I_SLICE = 2,
> +	SP_SLICE = 3,
> +	SI_SLICE = 4,
> +	MAX_SLICE_TYPES = 5
> +};
> +
> +/* Used by firmware */
> +union param {
> +	struct {
> +		unsigned short data[RPM_END - RPM_BEGIN];
> +	} l;
> +	struct {
> +		unsigned short dump[DPB_OFFSET];
> +		unsigned short dpb_base[FRAME_IN_DPB << 3];
> +
> +		unsigned short dpb_max_buffer_frame;
> +		unsigned short actual_dpb_size;
> +
> +		unsigned short colocated_buf_status;
> +
> +		unsigned short num_forward_short_term_reference_pic;
> +		unsigned short num_short_term_reference_pic;
> +		unsigned short num_reference_pic;
> +
> +		unsigned short current_dpb_index;
> +		unsigned short current_decoded_frame_num;
> +		unsigned short current_reference_frame_num;
> +
> +		unsigned short l0_size;
> +		unsigned short l1_size;
> +		/**
> +		 * [6:5] : nal_ref_idc
> +		 * [4:0] : nal_unit_type
> +		 */
> +		unsigned short NAL_info_mmco;
> +		/**
> +		 * [1:0] : 00 - top field, 01 - bottom field,
> +		 *         10 - frame, 11 - mbaff frame
> +		 */
> +		unsigned short picture_structure_mmco;
> +		unsigned short frame_num;
> +		unsigned short pic_order_cnt_lsb;
> +
> +		unsigned short num_ref_idx_l0_active_minus1;
> +		unsigned short num_ref_idx_l1_active_minus1;
> +
> +		unsigned short PrevPicOrderCntLsb;
> +		unsigned short PreviousFrameNum;
> +
> +		/* 32 bits variables */
> +		unsigned short delta_pic_order_cnt_bottom[2];
> +		unsigned short delta_pic_order_cnt_0[2];
> +		unsigned short delta_pic_order_cnt_1[2];
> +
> +		unsigned short PrevPicOrderCntMsb[2];
> +		unsigned short PrevFrameNumOffset[2];
> +
> +		unsigned short frame_pic_order_cnt[2];
> +		unsigned short top_field_pic_order_cnt[2];
> +		unsigned short bottom_field_pic_order_cnt[2];
> +
> +		unsigned short colocated_mv_addr_start[2];
> +		unsigned short colocated_mv_addr_end[2];
> +		unsigned short colocated_mv_wr_addr[2];
> +	} dpb;
> +	struct {
> +		unsigned short dump[MMCO_OFFSET];
> +
> +		/* array base address for offset_for_ref_frame */
> +		unsigned short offset_for_ref_frame_base[128];
> +
> +		/**
> +		 * 0 - Index in DPB
> +		 * 1 - Picture Flag
> +		 *  [2] : 0 - short term reference,
> +		 *			1 - long term reference
> +		 *  [1] : bottom field
> +		 *  [0] : top field
> +		 * 2 - Picture Number (short term or long term) low 16 bits
> +		 * 3 - Picture Number (short term or long term) high 16 bits
> +		 */
> +		unsigned short reference_base[128];
> +
> +		/* command and parameter, until command is 3 */
> +		unsigned short l0_reorder_cmd[REORDER_CMD_MAX];
> +		unsigned short l1_reorder_cmd[REORDER_CMD_MAX];
> +
> +		/* command and parameter, until command is 0 */
> +		unsigned short mmco_cmd[44];
> +
> +		unsigned short l0_base[40];
> +		unsigned short l1_base[40];
> +	} mmco;
> +	struct {
> +		/* from ucode lmem, do not change this struct */
> +	} p;
> +};
> +
> +struct h264_decode_buf_spec {
> +	struct v4l2_h264_dpb_entry *dpb;
> +	u32 canvas_pos;
> +	u32 dpb_index;
> +	u32 poc;
> +	int col_buf_index;
> +	u8 y_canvas_index;
> +	u8 u_canvas_index;
> +	u8 v_canvas_index;
> +	u8 used;
> +	u8 long_term_flag;
> +	dma_addr_t y_dma_addr;
> +	dma_addr_t c_dma_addr;
> +};
> +
> +#define REORDERING_COMMAND_MAX_SIZE	33
> +struct slice {
> +	int frame_num;
> +	/*modification */
> +	int slice_type;
> +	int num_ref_idx_l0;
> +	int num_ref_idx_l1;
> +	int ref_pic_list_reordering_flag[2];
> +	int modification_of_pic_nums_idc[2][REORDERING_COMMAND_MAX_SIZE];
> +	int abs_diff_pic_num_minus1[2][REORDERING_COMMAND_MAX_SIZE];
> +	int long_term_pic_idx[2][REORDERING_COMMAND_MAX_SIZE];
> +	unsigned char dec_ref_pic_marking_buffer_valid;
> +};
> +
> +struct aml_h264_ctx {
> +	struct aml_vdec_ctx *v4l2_ctx;
> +	u8 init_flag;
> +	u8 new_pic_flag;
> +	u8 mc_cpu_loaded;
> +	u8 param_set;
> +	u8 colocated_buf_num;
> +	u8 reg_iqidct_control_init_flag;
> +	u32 reg_iqidct_control;
> +	u32 reg_vcop_ctrl_reg;
> +	u32 reg_rv_ai_mb_count;
> +	u32 vld_dec_control;
> +	u32 save_avscratch_f;
> +	u32 seq_info;
> +	u32 decode_pic_count;
> +	union param dpb_param;
> +	u32 dec_status;
> +	struct slice mslice;
> +	struct h264_decode_buf_spec curr_spec;
> +	struct h264_decode_buf_spec ref_list0[V4L2_H264_NUM_DPB_ENTRIES + 1];
> +	struct h264_decode_buf_spec ref_list1[V4L2_H264_NUM_DPB_ENTRIES + 1];
> +	struct h264_decode_buf_spec ref_list0_unreordered[V4L2_H264_NUM_DPB_ENTRIES + 1];
> +	struct h264_decode_buf_spec ref_list1_unreordered[V4L2_H264_NUM_DPB_ENTRIES + 1];
> +	u8 list_size[2];
> +	dma_addr_t lmem_phy_addr;
> +	void *lmem_addr;
> +	dma_addr_t mc_cpu_paddr;
> +	void *mc_cpu_vaddr;
> +	dma_addr_t cma_alloc_addr;
> +	void *cma_alloc_vaddr;
> +	dma_addr_t collated_cma_addr;
> +	dma_addr_t collated_cma_addr_end;
> +	void *collated_cma_vaddr;
> +	dma_addr_t workspace_offset;
> +	void *workspace_vaddr;
> +	u32 col_buf_alloc_size;
> +	u32 one_col_buf_size;
> +	u32 colocated_buf_map;
> +	int colocated_buf_poc[32];
> +
> +	u32 frame_width;
> +	u32 frame_height;
> +	u32 mb_width;
> +	u32 mb_height;
> +	u32 mb_total;
> +	u32 max_num_ref_frames;
> +
> +	struct vdec_h264_stateless_ctrl_ref ctrl_ref;
> +};
> +
> +static inline int get_flag(u32 flag, u32 mask)
> +{
> +	return (flag & mask) ? 1 : 0;
> +}
> +
> +static inline void write_lmem(unsigned short *base, u32 offset, u32 value)
> +{
> +	base[offset] = value;
> +}
> +
> +static inline uint32_t spec2canvas(struct h264_decode_buf_spec *buf_spec)
> +{
> +	return (buf_spec->v_canvas_index << 16) |
> +		(buf_spec->u_canvas_index << 8) |
> +		(buf_spec->y_canvas_index << 0);
> +}
> +
> +static struct h264_decode_buf_spec *find_spec_by_dpb_index(struct aml_h264_ctx *h264_ctx, int index)
> +{
> +	int i;
> +
> +	for (i = 0; i < h264_ctx->list_size[0]; i++) {
> +		if (index == h264_ctx->ref_list0[i].dpb_index)
> +			return &h264_ctx->ref_list0[i];
> +	}
> +
> +	for (i = 0; i < h264_ctx->list_size[1]; i++) {
> +		if (index == h264_ctx->ref_list1[i].dpb_index)
> +			return &h264_ctx->ref_list1[i];
> +	}
> +	return NULL;
> +}
> +
> +static int h264_prepare_input(struct aml_vdec_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *src;
> +	struct vb2_buffer *vb;
> +	dma_addr_t src_dma;
> +	u32 payload_size;
> +	int dummy;
> +
> +	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	if (!src) {
> +		pr_info("no input buffer available!\n");
> +		return -1;
> +	}
> +	vb = &src->vb2_buf;
> +	payload_size = vb2_get_plane_payload(vb, 0);
> +	src_dma = vb2_dma_contig_plane_dma_addr(vb, 0);
> +
> +	WRITE_VREG(VLD_MEM_VIFIFO_CONTROL, 0);
> +	/* reset VLD fifo for all vdec */
> +	WRITE_VREG(DOS_SW_RESET0, (1 << 5) | (1 << 4) | (1 << 3));
> +	WRITE_VREG(DOS_SW_RESET0, 0);
> +	WRITE_VREG(POWER_CTL_VLD, 1 << 4);
> +
> +	WRITE_VREG(VLD_MEM_VIFIFO_START_PTR, src_dma);
> +	WRITE_VREG(VLD_MEM_VIFIFO_END_PTR, (src_dma + payload_size));
> +	WRITE_VREG(VLD_MEM_VIFIFO_CURR_PTR,
> +		   round_down(src_dma, VDEC_FIFO_ALIGN));
> +
> +	WRITE_VREG(VLD_MEM_VIFIFO_CONTROL, 1);
> +	WRITE_VREG(VLD_MEM_VIFIFO_CONTROL, 0);
> +	WRITE_VREG(VLD_MEM_VIFIFO_BUF_CNTL, 2);
> +
> +	WRITE_VREG(VLD_MEM_VIFIFO_RP,
> +		   round_down(src_dma, VDEC_FIFO_ALIGN));
> +	dummy = payload_size + VLD_PADDING_SIZE;
> +	WRITE_VREG(VLD_MEM_VIFIFO_WP,
> +		   round_down((src_dma + dummy), VDEC_FIFO_ALIGN));
> +
> +	WRITE_VREG(VLD_MEM_VIFIFO_BUF_CNTL, 3);
> +	WRITE_VREG(VLD_MEM_VIFIFO_BUF_CNTL, 2);
> +
> +	WRITE_VREG(VLD_MEM_VIFIFO_CONTROL,
> +		   (0x11 << 16) | (1 << 10) | (7 << 3));
> +
> +	WRITE_VREG(AV_SCRATCH_1, 0x0);
> +	WRITE_VREG(H264_DECODE_INFO, (1 << 13));
> +	WRITE_VREG(H264_DECODE_SIZE, payload_size);
> +	WRITE_VREG(VIFF_BIT_CNT, payload_size * 8);
> +
> +	return 0;
> +}
> +
> +static void config_sps_params(struct aml_h264_ctx *h264_ctx,
> +			      unsigned short *sps_base,
> +			      const struct v4l2_ctrl_h264_sps *sps)
> +{
> +	u32 cfg_tmp = 0;
> +	u32 frame_size;
> +	u32 offset = 0;
> +	unsigned short data_tmp[0x100];
> +	int i, ii;
> +
> +	memset(sps_base, 0, 0x100);
> +
> +	h264_ctx->frame_width = (sps->pic_width_in_mbs_minus1 + 1) << 4;
> +	h264_ctx->frame_height = (sps->pic_height_in_map_units_minus1 + 1) << 4;
> +
> +	data_tmp[offset] = PARAM_BASE_VAL;
> +	offset += 2;
> +
> +	data_tmp[offset++] = GET_SPS_PROFILE_IDC(sps->profile_idc);
> +
> +	data_tmp[offset++] = GET_SPS_SEQ_PARAM_SET_ID(sps->seq_parameter_set_id) |
> +	    GET_SPS_LEVEL_IDC(sps->level_idc);
> +
> +	if (sps->profile_idc >= 100) {
> +		data_tmp[offset++] = GET_SPS_CHROMA_FORMAT_IDC(sps->chroma_format_idc);
> +
> +		data_tmp[offset++] = ((sps->chroma_format_idc ^ 1) << 1);
> +	}
> +
> +	data_tmp[offset++] = GET_SPS_LOG2_MAX_FRAME_NUM(sps->log2_max_frame_num_minus4);
> +	data_tmp[offset++] = GET_SPS_PIC_ORDER_TYPE(sps->pic_order_cnt_type);
> +
> +	if (sps->pic_order_cnt_type == 0) {
> +		data_tmp[offset++] =
> +			GET_SPS_PIC_ORDER_CNT_LSB(sps->log2_max_pic_order_cnt_lsb_minus4);
> +	} else if (sps->pic_order_cnt_type == 1) {
> +		data_tmp[offset++] =
> +			get_flag(sps->flags,
> +				 V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO);
> +		data_tmp[offset++] =
> +			GET_SPS_OFFSET_FOR_NONREF_PIC_LOW(sps->offset_for_non_ref_pic);
> +		data_tmp[offset++] =
> +			GET_SPS_OFFSET_FOR_NONREF_PIC_HIGH(sps->offset_for_non_ref_pic);
> +		data_tmp[offset++] =
> +			GET_SPS_OFFSET_FOR_TOP_BOT_FIELD_LOW(sps->offset_for_top_to_bottom_field);
> +		data_tmp[offset++] =
> +			GET_SPS_OFFSET_FOR_TOP_BOT_FIELD_HIGH(sps->offset_for_top_to_bottom_field);
> +		data_tmp[offset++] = sps->num_ref_frames_in_pic_order_cnt_cycle;
> +	}
> +
> +	data_tmp[offset++] = GET_SPS_NUM_REF_FRAMES(sps->max_num_ref_frames) |
> +	    GET_SPS_GAPS_ALLOWED_FLAG(get_flag(sps->flags,
> +					       V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED));
> +
> +	data_tmp[offset++] = GET_SPS_PIC_WIDTH_IN_MBS(sps->pic_width_in_mbs_minus1);
> +
> +	data_tmp[offset++] = GET_SPS_PIC_HEIGHT_IN_MBS(sps->pic_height_in_map_units_minus1);
> +	data_tmp[offset++] =
> +		GET_SPS_DIRECT_8X8_FLAGS
> +				(get_flag(sps->flags,
> +					  V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE)) |
> +		GET_SPS_MB_ADAPTIVE_FRAME_FIELD_FLAGS
> +				(get_flag(sps->flags,
> +					  V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)) |
> +		GET_SPS_FRAME_MBS_ONLY_FLAGS
> +				(get_flag(sps->flags,
> +					  V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY));
> +
> +	for (i = 0; i < 0x100; i += 4) {
> +		for (ii = 0; ii < 4; ii++)
> +			sps_base[i + 3 - ii] = data_tmp[i + ii];
> +	}
> +
> +	frame_size = (sps->pic_width_in_mbs_minus1 + 1) * (sps->pic_height_in_map_units_minus1 + 1);
> +	cfg_tmp = (get_flag(sps->flags, V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) << 31) |
> +				(sps->max_num_ref_frames << 24) | (frame_size << 8) |
> +				(sps->pic_width_in_mbs_minus1 + 1);
> +	WRITE_VREG(AV_SCRATCH_1, cfg_tmp);
> +	h264_ctx->seq_info = cfg_tmp;
> +
> +	cfg_tmp = 0;
> +	cfg_tmp = (get_flag(sps->flags, V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE) << 15) |
> +				(sps->chroma_format_idc);
> +	WRITE_VREG(AV_SCRATCH_2, cfg_tmp);
> +
> +	cfg_tmp = 0;
> +	cfg_tmp = (sps->max_num_ref_frames << 8) | (sps->level_idc);
> +	WRITE_VREG(AV_SCRATCH_B, cfg_tmp);
> +
> +	cfg_tmp = ((sps->level_idc & 0xff) << 7) |
> +	    (get_flag(sps->flags, V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) << 2);
> +	WRITE_VREG(NAL_SEARCH_CTL, RD_VREG(NAL_SEARCH_CTL) | cfg_tmp);
> +
> +	h264_ctx->mb_width = (sps->pic_width_in_mbs_minus1 + 4) & 0xfffffffc;
> +	h264_ctx->mb_height = (sps->pic_height_in_map_units_minus1 + 4) & 0xfffffffc;
> +	h264_ctx->mb_total = h264_ctx->mb_width * h264_ctx->mb_height;
> +	h264_ctx->max_num_ref_frames = sps->max_num_ref_frames;
> +}
> +
> +static void config_pps_params(struct aml_h264_ctx *h264_ctx,
> +			      unsigned short *pps_base,
> +			      const struct v4l2_ctrl_h264_pps *pps)
> +{
> +	u32 offset = 0;
> +	unsigned short data_tmp[0x100];
> +	u32 max_reference_size = V4L2_H264_NUM_DPB_ENTRIES;
> +	u32 max_list_size;
> +	int i, ii;
> +
> +	memset(pps_base, 0, 0x100);
> +
> +	data_tmp[offset++] = PARAM_BASE_VAL;
> +
> +	data_tmp[offset++] =
> +		GET_PPS_PIC_PARAM_SET_ID(pps->pic_parameter_set_id) |
> +	    GET_PPS_SEQ_PARAM_SET_ID(pps->seq_parameter_set_id) |
> +	    GET_PPS_ENTROPY_CODING_MODE_FLAG
> +			(get_flag(pps->flags,
> +				  V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE)) |
> +	    GET_PPS_PIC_ORDER_PRESENT_FLAG
> +			(get_flag(pps->flags,
> +				  V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT));
> +
> +	data_tmp[offset++] =
> +		GET_PPS_WEIGHTED_BIPRED_IDC(pps->weighted_bipred_idc) |
> +		GET_PPS_WEIGHTED_PRED_FLAG(get_flag(pps->flags,
> +						    V4L2_H264_PPS_FLAG_WEIGHTED_PRED)) |
> +		GET_PPS_NUM_IDX_REF_L1_MINUS1(pps->num_ref_idx_l1_default_active_minus1) |
> +		GET_PPS_NUM_IDX_REF_L0_MINUS1(pps->num_ref_idx_l0_default_active_minus1);
> +
> +	data_tmp[offset++] = GET_PPS_INIT_QS_MINUS26(pps->pic_init_qs_minus26) |
> +	    GET_PPS_INIT_QP_MINUS26(pps->pic_init_qp_minus26);
> +
> +	data_tmp[offset] =
> +	    GET_PPS_CHROMA_QP_INDEX_OFFSET(pps->chroma_qp_index_offset) |
> +	    GET_PPS_DEBLOCK_FILTER_CTRL_PRESENT_FLAG
> +				(get_flag(pps->flags,
> +					  V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT)) |
> +	    GET_PPS_CONSTRAIN_INTRA_PRED_FLAG
> +				(get_flag(pps->flags,
> +					  V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED)) |
> +	    GET_PPS_REDUNDANT_PIC_CNT_PRESENT_FLAG
> +				(get_flag(pps->flags,
> +					  V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT));
> +	if (get_flag
> +	    (pps->flags,
> +	     V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE |
> +	     V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT))
> +		data_tmp[offset] |= (1 << 11);
> +	offset++;
> +
> +	data_tmp[offset++] =
> +	    GET_PPS_SCALING_MATRIX_PRESENT_FLAG(get_flag
> +						(pps->flags,
> +						 V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT)) |
> +	    GET_PPS_TRANSFORM_8X8_FLAG(get_flag
> +				       (pps->flags,
> +					V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE));
> +
> +	data_tmp[offset++] =
> +		GET_PPS_GET_SECOND_CHROMA_QP_OFFSET(pps->second_chroma_qp_index_offset);
> +
> +	max_list_size = (pps->num_ref_idx_l1_default_active_minus1 + 1) +
> +	    (pps->num_ref_idx_l0_default_active_minus1 + 1);
> +
> +	h264_ctx->max_num_ref_frames = max_list_size > h264_ctx->max_num_ref_frames ?
> +						max_list_size : h264_ctx->max_num_ref_frames;
> +
> +	WRITE_VREG(AV_SCRATCH_0, ((h264_ctx->max_num_ref_frames + 1) << 24) |
> +		   (max_reference_size << 16) | (max_reference_size << 8));
> +
> +	for (i = 0; i < 0x100; i += 4) {
> +		for (ii = 0; ii < 4; ii++)
> +			pps_base[i + 3 - ii] = data_tmp[i + ii];
> +	}
> +}
> +
> +static void h264_config_params(struct aml_vdec_ctx *ctx)
> +{
> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)ctx->codec_priv;
> +	unsigned short *p_sps_base, *p_pps_base;
> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
> +	const struct v4l2_ctrl_h264_sps *sps = ctrls->sps;
> +	const struct v4l2_ctrl_h264_pps *pps = ctrls->pps;
> +
> +	p_sps_base = (unsigned short *)(h264_ctx->workspace_vaddr +
> +		MEM_SPS_BASE + sps->seq_parameter_set_id * 0x400);
> +	p_pps_base = (unsigned short *)(h264_ctx->workspace_vaddr +
> +		MEM_PPS_BASE + pps->pic_parameter_set_id * 0x200);
> +
> +	config_sps_params(h264_ctx, p_sps_base, sps);
> +	config_pps_params(h264_ctx, p_pps_base, pps);
> +}
> +
> +static void config_decode_canvas(struct aml_vdec_hw *hw,
> +				 struct h264_decode_buf_spec *buf_spec,
> +				 u32 mb_width, u32 mb_height)
> +{
> +	int canvas_alloc_result = 0;
> +	int blkmode = 0x0;
> +
> +	canvas_alloc_result = hw->hw_ops.canvas_alloc(&buf_spec->y_canvas_index);
> +	canvas_alloc_result = hw->hw_ops.canvas_alloc(&buf_spec->u_canvas_index);
> +	buf_spec->v_canvas_index = buf_spec->u_canvas_index;
> +
> +	if (!canvas_alloc_result) {
> +		/* config y canvas */
> +		hw->hw_ops.config_canvas(buf_spec->y_canvas_index,
> +					 buf_spec->y_dma_addr, mb_width << 4,
> +					 mb_height << 4, 0, blkmode, 7);
> +		WRITE_VREG(VDEC_ASSIST_CANVAS_BLK32, (1 << 11) |	/* canvas_blk32_wr */
> +			   (blkmode << 10) |	/* canvas_blk32 */
> +			   (1 << 8) |	/* canvas_index_wr */
> +			   (buf_spec->y_canvas_index << 0)	/* canvas index */
> +		    );
> +
> +		/* config uv canvas */
> +		hw->hw_ops.config_canvas(buf_spec->u_canvas_index,
> +					 buf_spec->c_dma_addr, mb_width << 4,
> +					 mb_height << 3, 0, blkmode, 7);
> +		WRITE_VREG(VDEC_ASSIST_CANVAS_BLK32, (1 << 11) |	/* canvas_blk32_wr */
> +			   (blkmode << 10) |	/* canvas_blk32 */
> +			   (1 << 8) |	/* canvas_index_wr */
> +			   (buf_spec->u_canvas_index << 0)	/* canvas index */
> +		    );
> +
> +		WRITE_VREG(ANC0_CANVAS_ADDR + buf_spec->canvas_pos,
> +			   spec2canvas(buf_spec));
> +	}
> +}
> +
> +static int allocate_colocate_buf(struct aml_h264_ctx *h264_ctx, int poc)
> +{
> +	int i;
> +
> +	for (i = 0; i < h264_ctx->colocated_buf_num; i++) {
> +		if (((h264_ctx->colocated_buf_map >> i) & 0x1) == 0) {
> +			h264_ctx->colocated_buf_map |= (1 << i);
> +			break;
> +		}
> +	}
> +
> +	if (i == h264_ctx->colocated_buf_num)
> +		return -1;
> +
> +	h264_ctx->colocated_buf_poc[i] = poc;
> +	pr_debug("%s colocated_buf_index %d poc %d\n", __func__, i,
> +		 h264_ctx->colocated_buf_poc[i]);
> +
> +	return i;
> +}
> +
> +static void release_colocate_buf(struct aml_h264_ctx *h264_ctx, int index)
> +{
> +	if (index >= 0) {
> +		if (index >= h264_ctx->colocated_buf_num) {
> +			pr_debug
> +			    ("%s error, index %d is bigger than buf count %d\n",
> +			     __func__, index, h264_ctx->max_num_ref_frames);
> +		} else {
> +			if (((h264_ctx->colocated_buf_map >> index) & 0x1) == 0x1) {
> +				h264_ctx->colocated_buf_map &= (~(1 << index));
> +				pr_debug
> +				    ("%s colocated_buf_index %d released poc %d\n",
> +				     __func__, index,
> +				     h264_ctx->colocated_buf_poc[index]);
> +			}
> +			h264_ctx->colocated_buf_poc[index] = INVALID_POC;
> +		}
> +	}
> +}
> +
> +static int get_col_buf_index_by_poc(struct aml_h264_ctx *h264_ctx, int poc)
> +{
> +	int idx;
> +
> +	for (idx = 0; idx < h264_ctx->colocated_buf_num; idx++) {
> +		if (h264_ctx->colocated_buf_poc[idx] == poc)
> +			break;
> +	}
> +
> +	if (idx == h264_ctx->colocated_buf_num)
> +		idx = -1;
> +
> +	return idx;
> +}
> +
> +static int alloc_colocate_cma(struct aml_h264_ctx *h264_ctx,
> +			      struct aml_vdec_ctx *ctx)
> +{
> +	int alloc_size = 0;
> +	int i;
> +	struct aml_vdec_hw *hw;
> +
> +	if (h264_ctx->collated_cma_vaddr)
> +		return 0;
> +
> +	hw = vdec_get_hw(ctx->dev);
> +	if (!hw)
> +		return -1;
> +
> +	/* 96 :col buf size for each mb */
> +	h264_ctx->one_col_buf_size = h264_ctx->mb_total * 96;
> +	alloc_size = PAGE_ALIGN(h264_ctx->one_col_buf_size *
> +			(h264_ctx->max_num_ref_frames + COL_BUFFER_MARGIN));
> +	h264_ctx->collated_cma_vaddr = dma_alloc_coherent(hw->dev, alloc_size,
> +							  &h264_ctx->collated_cma_addr, GFP_KERNEL);
> +	if (!h264_ctx->collated_cma_vaddr)
> +		return -ENOMEM;
> +
> +	pr_debug
> +	    ("collated_cma_addr = 0x%llx, one_col_buf_size = %x alloc_size = %x\n",
> +	     h264_ctx->collated_cma_addr, h264_ctx->one_col_buf_size,
> +	     alloc_size);
> +	h264_ctx->collated_cma_addr_end =
> +	    h264_ctx->collated_cma_addr + alloc_size;
> +	memset(h264_ctx->collated_cma_vaddr, 0, alloc_size);
> +	h264_ctx->col_buf_alloc_size = alloc_size;
> +	h264_ctx->colocated_buf_map = 0;
> +	h264_ctx->colocated_buf_num = h264_ctx->max_num_ref_frames + COL_BUFFER_MARGIN;
> +
> +	/* 32 : max index of co-locate buffer */
> +	for (i = 0; i < 32; i++)
> +		h264_ctx->colocated_buf_poc[i] = INVALID_POC;
> +
> +	return 0;
> +}
> +
> +static void config_p_reflist(struct aml_h264_ctx *h264_ctx,
> +			     struct v4l2_h264_reference *v4l2_p0_reflist,
> +			     u32 list_size)
> +{
> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
> +	struct v4l2_ctrl_h264_decode_params *decode =
> +	    (struct v4l2_ctrl_h264_decode_params *)ctrls->decode;
> +	struct v4l2_h264_dpb_entry *dpb = decode->dpb;
> +	u8 index;
> +	int i;
> +
> +	for (i = 0; i < list_size; i++) {
> +		index = v4l2_p0_reflist[i].index;
> +		h264_ctx->ref_list0[i].used = 1;
> +		h264_ctx->ref_list0[i].dpb = &dpb[index];
> +		h264_ctx->ref_list0[i].poc = dpb[index].top_field_order_cnt;
> +		h264_ctx->ref_list0[i].long_term_flag =
> +		    dpb[index].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ? true : false;
> +		h264_ctx->ref_list0[i].dpb_index = index;
> +	}
> +	h264_ctx->list_size[0] = i;
> +}
> +
> +static void config_b_reflist(struct aml_h264_ctx *h264_ctx,
> +			     struct v4l2_h264_reference *v4l2_b0_reflist,
> +			     struct v4l2_h264_reference *v4l2_b1_reflist,
> +			     u32 list_size)
> +{
> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
> +	struct v4l2_ctrl_h264_decode_params *decode =
> +	    (struct v4l2_ctrl_h264_decode_params *)ctrls->decode;
> +	struct v4l2_h264_dpb_entry *dpb = decode->dpb;
> +	u8 index;
> +	int i, j;
> +
> +	for (i = 0; i < list_size; i++) {
> +		index = v4l2_b0_reflist[i].index;
> +		if (dpb[index].top_field_order_cnt > decode->top_field_order_cnt) {
> +			h264_ctx->list_size[0] = i;
> +			break;
> +		}
> +		h264_ctx->ref_list0[i].used = 1;
> +		h264_ctx->ref_list0[i].dpb = &dpb[index];
> +		h264_ctx->ref_list0[i].poc = dpb[index].top_field_order_cnt;
> +		h264_ctx->ref_list0[i].long_term_flag =
> +		    dpb[index].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ? true : false;
> +		h264_ctx->ref_list0[i].col_buf_index =
> +			get_col_buf_index_by_poc(h264_ctx, dpb[index].top_field_order_cnt);
> +		h264_ctx->ref_list0[i].dpb_index = index;
> +	}
> +
> +	for (j = 0; j < list_size; j++) {
> +		index = v4l2_b1_reflist[j].index;
> +		if (dpb[index].top_field_order_cnt < decode->top_field_order_cnt) {
> +			h264_ctx->list_size[1] = j;
> +			break;
> +		}
> +		h264_ctx->ref_list1[j].used = 1;
> +		h264_ctx->ref_list1[j].dpb = &dpb[index];
> +		h264_ctx->ref_list1[j].poc = dpb[index].top_field_order_cnt;
> +		h264_ctx->ref_list1[j].long_term_flag =
> +		    dpb[index].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ? true : false;
> +		h264_ctx->ref_list1[j].col_buf_index =
> +			get_col_buf_index_by_poc(h264_ctx, dpb[index].top_field_order_cnt);
> +		h264_ctx->ref_list1[j].dpb_index = index;
> +	}
> +
> +	if ((h264_ctx->list_size[1] + h264_ctx->list_size[0]) < list_size)
> +		pr_info("ref list incorrect list0 %d list0 %d list_size%d\n",
> +			h264_ctx->list_size[0], h264_ctx->list_size[1], list_size);
> +}
> +
> +static int poc_is_in_dpb(int poc, const struct v4l2_h264_dpb_entry *dpb)
> +{
> +	int i;
> +	int ret = 0;
> +
> +	for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
> +		if (poc == dpb[i].top_field_order_cnt) {
> +			ret = 1;
> +			pr_debug("%s find poc %d col index %x inDPB\n", __func__, poc, i);
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int get_ref_list_size(struct aml_h264_ctx *h264_ctx, int cur_list)
> +{
> +	unsigned short override_flag = h264_ctx->dpb_param.l.data[REF_IDC_OVERRIDE_FLAG];
> +	int num_ref_idx_lx_active_minus1;
> +
> +	if (cur_list == 0) {
> +		num_ref_idx_lx_active_minus1 =
> +			h264_ctx->ctrl_ref.pps->num_ref_idx_l0_default_active_minus1;
> +		if (override_flag)
> +			num_ref_idx_lx_active_minus1 =
> +				h264_ctx->dpb_param.dpb.num_ref_idx_l0_active_minus1;
> +	} else {
> +		num_ref_idx_lx_active_minus1 =
> +			h264_ctx->ctrl_ref.pps->num_ref_idx_l1_default_active_minus1;
> +	}
> +	pr_debug("%s get list %d size %d\n", __func__, cur_list, num_ref_idx_lx_active_minus1 + 1);
> +
> +	return num_ref_idx_lx_active_minus1 + 1;
> +}
> +
> +static int get_refidx_by_picnum(struct aml_h264_ctx *h264_ctx, int pic_num,
> +				int curr_list)
> +{
> +	int i;
> +	struct h264_decode_buf_spec *ref_list;
> +
> +	if (curr_list == 0)
> +		ref_list = &h264_ctx->ref_list0[0];
> +	else
> +		ref_list = &h264_ctx->ref_list1[0];
> +
> +	for (i = 0; ref_list[i].dpb; i++) {
> +		if (pic_num == ref_list[i].dpb->pic_num)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static struct h264_decode_buf_spec *get_st_refpic_by_num(struct aml_h264_ctx *h264_ctx,
> +							 int pic_num, int curr_list)
> +{
> +	int i;
> +	struct h264_decode_buf_spec *ref_list;
> +
> +	if (curr_list == 0)
> +		ref_list = &h264_ctx->ref_list0_unreordered[0];
> +	else
> +		ref_list = &h264_ctx->ref_list1_unreordered[0];
> +
> +	for (i = 0; ref_list[i].dpb; i++) {
> +		if (pic_num == ref_list[i].dpb->pic_num && ref_list[i].long_term_flag == 0)
> +			return &ref_list[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct h264_decode_buf_spec *get_lt_refpic_by_num(struct aml_h264_ctx *h264_ctx,
> +							 int pic_num, int curr_list)
> +{
> +	int i;
> +	struct h264_decode_buf_spec *ref_list;
> +
> +	if (curr_list == 0)
> +		ref_list = &h264_ctx->ref_list0_unreordered[0];
> +	else
> +		ref_list = &h264_ctx->ref_list1_unreordered[0];
> +
> +	for (i = 0; ref_list[i].dpb; i++) {
> +		if (pic_num == ref_list[i].dpb->pic_num && ref_list[i].long_term_flag == 1)
> +			return &ref_list[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static void reorder_short_term(struct slice *curr_slice, int cur_list,
> +			       int pic_num_lx, int *ref_idx_lx)
> +{
> +	struct aml_h264_ctx *h264_ctx = container_of(curr_slice, struct aml_h264_ctx, mslice);
> +	int c_idx, n_idx;
> +	int num_ref_idx_lx_active;
> +	struct h264_decode_buf_spec *pic_lx = NULL;
> +	struct h264_decode_buf_spec *ref_list_reordered;
> +
> +	if (cur_list == 0)
> +		ref_list_reordered = &h264_ctx->ref_list0[0];
> +	else
> +		ref_list_reordered = &h264_ctx->ref_list1[0];
> +
> +	num_ref_idx_lx_active = get_ref_list_size(h264_ctx, cur_list);
> +
> +	/* find short-term ref frame with pic_num is pic_num_lx */
> +	pic_lx = get_st_refpic_by_num(h264_ctx, pic_num_lx, cur_list);
> +	if (!pic_lx) {
> +		pr_debug("cannot find st pic_lx for %d\n", pic_num_lx);
> +		return;
> +	}
> +
> +	if (*ref_idx_lx == get_refidx_by_picnum(h264_ctx, pic_num_lx, cur_list)) {
> +		pr_debug("no need to move pic lx %d\n", *ref_idx_lx);
> +		*ref_idx_lx = *ref_idx_lx + 1;
> +		return;
> +	}
> +
> +	for (c_idx = num_ref_idx_lx_active; c_idx > *ref_idx_lx; c_idx--)
> +		memcpy(&ref_list_reordered[c_idx], &ref_list_reordered[c_idx - 1],
> +		       sizeof(struct h264_decode_buf_spec));
> +
> +	memcpy(&ref_list_reordered[*ref_idx_lx], pic_lx, sizeof(struct h264_decode_buf_spec));
> +	pr_debug("%s 1 : RefPicListX[%d ] = pic %p pic_num(%d)\n", __func__,
> +		 *ref_idx_lx, pic_lx, ref_list_reordered[*ref_idx_lx].dpb->pic_num);
> +	*ref_idx_lx = *ref_idx_lx + 1;
> +
> +	n_idx = *ref_idx_lx;
> +	for (c_idx = *ref_idx_lx; c_idx <= num_ref_idx_lx_active; c_idx++) {
> +		if (ref_list_reordered[c_idx].long_term_flag || !ref_list_reordered[c_idx].dpb ||
> +		    ref_list_reordered[c_idx].dpb->pic_num != pic_num_lx)
> +			memcpy(&ref_list_reordered[n_idx++], &ref_list_reordered[c_idx],
> +			       sizeof(struct h264_decode_buf_spec));
> +	}
> +
> +	h264_ctx->list_size[cur_list] = num_ref_idx_lx_active;
> +}
> +
> +static void reorder_long_term(struct slice *curr_slice, int cur_list,
> +			      int lt_pic_num, int *ref_idx_lx)
> +{
> +	struct aml_h264_ctx *h264_ctx = container_of(curr_slice, struct aml_h264_ctx, mslice);
> +	int num_ref_idx_lx_active;
> +	int c_idx, n_idx;
> +	struct h264_decode_buf_spec *ref_list;
> +	struct h264_decode_buf_spec *pic_lt = NULL;
> +
> +	if (cur_list == 0)
> +		ref_list = &h264_ctx->ref_list0[0];
> +	else
> +		ref_list = &h264_ctx->ref_list1[0];
> +
> +	num_ref_idx_lx_active = get_ref_list_size(h264_ctx, cur_list);
> +
> +	/* find long-term ref frame with pic_num is lt_pic_num */
> +	pic_lt = get_lt_refpic_by_num(h264_ctx, lt_pic_num, cur_list);
> +	if (!pic_lt) {
> +		pr_debug("cannot find lt pic_lx for %d\n", lt_pic_num);
> +		return;
> +	}
> +
> +	if (*ref_idx_lx == get_refidx_by_picnum(h264_ctx, lt_pic_num, cur_list)) {
> +		pr_debug("no need to move pic lx %d\n", *ref_idx_lx);
> +		*ref_idx_lx = *ref_idx_lx + 1;
> +		return;
> +	}
> +
> +	for (c_idx = num_ref_idx_lx_active; c_idx > *ref_idx_lx; c_idx--)
> +		memcpy(&ref_list[c_idx], &ref_list[c_idx - 1], sizeof(struct h264_decode_buf_spec));
> +
> +	memcpy(&ref_list[*ref_idx_lx], pic_lt, sizeof(struct h264_decode_buf_spec));
> +	pr_debug("%s 1 : RefPicListX[%d ] = pic %p pic_num(%d)\n", __func__,
> +		 *ref_idx_lx, pic_lt, ref_list[*ref_idx_lx].dpb->pic_num);
> +	*ref_idx_lx = *ref_idx_lx + 1;
> +
> +	n_idx = *ref_idx_lx;
> +	/* Pointer dpb is NULL means this is a dummy frame store */
> +	for (c_idx = *ref_idx_lx; c_idx <= num_ref_idx_lx_active; c_idx++) {
> +		if (!ref_list[c_idx].long_term_flag || !ref_list[c_idx].dpb ||
> +		    ref_list[c_idx].dpb->pic_num != lt_pic_num)
> +			memcpy(&ref_list[n_idx++], &ref_list[c_idx],
> +			       sizeof(struct h264_decode_buf_spec));
> +	}
> +
> +	h264_ctx->list_size[cur_list] = num_ref_idx_lx_active;
> +}
> +
> +static void get_modification_cmd(unsigned short *reorder_cmd, struct slice *curr_slice, int list)
> +{
> +	int i, j, val;
> +
> +	val = curr_slice->ref_pic_list_reordering_flag[list];
> +	if (val) {
> +		i = 0;
> +		j = 0;
> +		do {
> +			curr_slice->modification_of_pic_nums_idc[list][i] =
> +				reorder_cmd[j++];
> +			if (j >= REORDER_CMD_MAX) {
> +				curr_slice->modification_of_pic_nums_idc[list][i] = 0;
> +				break;
> +			}
> +
> +			val = curr_slice->modification_of_pic_nums_idc[list][i];
> +			if (val == 0 || val == 1)
> +				curr_slice->abs_diff_pic_num_minus1[list][i] = reorder_cmd[j++];
> +			else if (val == 2)
> +				curr_slice->long_term_pic_idx[list][i] = reorder_cmd[j++];
> +
> +			i++;
> +
> +			if (i >= REORDERING_COMMAND_MAX_SIZE) {
> +				curr_slice->ref_pic_list_reordering_flag[list] = 0;
> +				break;
> +			};
> +			if (j > REORDER_CMD_MAX) {
> +				curr_slice->ref_pic_list_reordering_flag[list] = 0;
> +				break;
> +			};
> +		} while (val != 3);
> +	}
> +}
> +
> +static void reorder_pics(struct aml_h264_ctx *h264_ctx, struct slice *curr_slice, int cur_list)
> +{
> +	int *modification_of_pic_nums_idc =
> +		curr_slice->modification_of_pic_nums_idc[cur_list];
> +	int *abs_diff_pic_num_minus1 =
> +		curr_slice->abs_diff_pic_num_minus1[cur_list];
> +	int *long_term_pic_idx = curr_slice->long_term_pic_idx[cur_list];
> +	int pic_num_lx_nowarp, pic_num_lx_pred, pic_num_lx;
> +	int curr_pic_num = curr_slice->frame_num;
> +	int max_pic_num = 1 << (4 + h264_ctx->ctrl_ref.sps->log2_max_frame_num_minus4);
> +	int ref_idx_lx = 0;
> +	int nowarp_tmp = 0;
> +	int i;
> +
> +	pic_num_lx_pred = curr_pic_num;
> +	for (i = 0; i < REORDERING_COMMAND_MAX_SIZE && modification_of_pic_nums_idc[i] != 3; i++) {
> +		if (modification_of_pic_nums_idc[i] > 3) {
> +			pr_info("error, Invalid modification_of_pic_nums_idc command\n");
> +			break;
> +		}
> +
> +		if (modification_of_pic_nums_idc[i] < 2) {
> +			if (modification_of_pic_nums_idc[i] == 0) {
> +				nowarp_tmp = pic_num_lx_pred - (abs_diff_pic_num_minus1[i] + 1);
> +				pic_num_lx_nowarp = nowarp_tmp + (nowarp_tmp < 0 ? max_pic_num : 0);
> +			} else if (modification_of_pic_nums_idc[i] == 1) {
> +				nowarp_tmp = pic_num_lx_pred + (abs_diff_pic_num_minus1[i] + 1);
> +				pic_num_lx_nowarp = nowarp_tmp -
> +					(nowarp_tmp > max_pic_num ? max_pic_num : 0);
> +			}
> +			pic_num_lx_pred = pic_num_lx_nowarp;
> +			if (pic_num_lx_nowarp > curr_pic_num)
> +				pic_num_lx = pic_num_lx_nowarp - max_pic_num;
> +			else
> +				pic_num_lx = pic_num_lx_nowarp;
> +
> +			reorder_short_term(curr_slice, cur_list, pic_num_lx, &ref_idx_lx);
> +		} else {
> +			reorder_long_term(curr_slice, cur_list, long_term_pic_idx[i], &ref_idx_lx);
> +		}
> +	}
> +}
> +
> +static void copy_ref_list(struct aml_h264_ctx *h264_ctx, int curr_list)
> +{
> +	if (curr_list == 0)
> +		memcpy(h264_ctx->ref_list0_unreordered, h264_ctx->ref_list0,
> +		       sizeof(h264_ctx->ref_list0));
> +	else
> +		memcpy(h264_ctx->ref_list1_unreordered, h264_ctx->ref_list0,
> +		       sizeof(h264_ctx->ref_list1));
> +}
> +
> +static void h264_reorder_reflists(struct aml_h264_ctx *h264_ctx)
> +{
> +	unsigned short *reorder_cmd;
> +	struct slice *curr_slice = &h264_ctx->mslice;
> +
> +	memset(curr_slice, 0, sizeof(struct slice));
> +	/* parsed by ucode */
> +	curr_slice->slice_type = h264_ctx->dpb_param.l.data[SLICE_TYPE];
> +	curr_slice->num_ref_idx_l0 = h264_ctx->dpb_param.dpb.num_ref_idx_l0_active_minus1 + 1;
> +	curr_slice->num_ref_idx_l1 = h264_ctx->dpb_param.dpb.num_ref_idx_l1_active_minus1 + 1;
> +	curr_slice->frame_num = h264_ctx->ctrl_ref.decode->frame_num;
> +
> +	if (curr_slice->slice_type != I_SLICE && curr_slice->slice_type != SI_SLICE) {
> +		reorder_cmd = &h264_ctx->dpb_param.mmco.l0_reorder_cmd[0];
> +		/* 3:parsed by ucode, means no reorder needed */
> +		if (reorder_cmd[0] != 3)
> +			curr_slice->ref_pic_list_reordering_flag[0] = 1;
> +		else
> +			curr_slice->ref_pic_list_reordering_flag[0] = 0;
> +
> +		get_modification_cmd(reorder_cmd, curr_slice, 0);
> +	}
> +
> +	if (curr_slice->slice_type == B_SLICE) {
> +		reorder_cmd = &h264_ctx->dpb_param.mmco.l1_reorder_cmd[0];
> +		/* 3:parsed by ucode, means no reorder needed */
> +		if (reorder_cmd[0] != 3)
> +			curr_slice->ref_pic_list_reordering_flag[1] = 1;
> +		else
> +			curr_slice->ref_pic_list_reordering_flag[1] = 0;
> +
> +		get_modification_cmd(reorder_cmd, curr_slice, 1);
> +	}
> +
> +	if (curr_slice->slice_type != I_SLICE &&
> +	    curr_slice->slice_type != SI_SLICE &&
> +	    curr_slice->ref_pic_list_reordering_flag[0] != 0) {
> +		copy_ref_list(h264_ctx, 0);
> +		reorder_pics(h264_ctx, curr_slice, 0);
> +	}
> +
> +	if (curr_slice->slice_type == B_SLICE && curr_slice->ref_pic_list_reordering_flag[1] != 0) {
> +		copy_ref_list(h264_ctx, 1);
> +		reorder_pics(h264_ctx, curr_slice, 1);
> +	}
> +}
> +
> +static void h264_config_ref_lists(struct aml_vdec_ctx *ctx)
> +{
> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)ctx->codec_priv;
> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
> +	struct v4l2_ctrl_h264_decode_params *decode =
> +		(struct v4l2_ctrl_h264_decode_params *)ctrls->decode;
> +	struct v4l2_ctrl_h264_sps *sps = (struct v4l2_ctrl_h264_sps *)ctrls->sps;
> +	const struct v4l2_h264_dpb_entry *dpb = decode->dpb;
> +	struct v4l2_h264_reflist_builder builder;
> +	struct v4l2_h264_reference v4l2_p0_reflist[V4L2_H264_REF_LIST_LEN];
> +	struct v4l2_h264_reference v4l2_b0_reflist[V4L2_H264_REF_LIST_LEN];
> +	struct v4l2_h264_reference v4l2_b1_reflist[V4L2_H264_REF_LIST_LEN];
> +
> +	if (decode->flags == V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC)
> +		return;
> +
> +	v4l2_h264_init_reflist_builder(&builder, decode, sps, dpb);
> +	pr_debug("%s num_valid = %d", __func__, builder.num_valid);
> +
> +	if (decode->flags & V4L2_H264_DECODE_PARAM_FLAG_PFRAME) {
> +		v4l2_h264_build_p_ref_list(&builder, v4l2_p0_reflist);
> +		config_p_reflist(h264_ctx, v4l2_p0_reflist, builder.num_valid);
> +	} else if (decode->flags & V4L2_H264_DECODE_PARAM_FLAG_BFRAME) {
> +		v4l2_h264_build_b_ref_lists(&builder, v4l2_b0_reflist, v4l2_b1_reflist);
> +		config_b_reflist(h264_ctx, v4l2_b0_reflist, v4l2_b1_reflist, builder.num_valid);
> +	}
> +}
> +
> +static void clear_unused_col_buf(struct aml_h264_ctx *h264_ctx,
> +				 struct v4l2_ctrl_h264_decode_params *decode)
> +{
> +	int i, col_poc;
> +
> +	/* flush all col buffers when IDR */
> +	if (decode->flags == V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC) {
> +		/* 32 : max index of co-locate buffer */
> +		for (i = 0; i < 32; i++)
> +			release_colocate_buf(h264_ctx, i);
> +		return;
> +	}
> +
> +	for (i = 0; i < h264_ctx->colocated_buf_num; i++) {
> +		col_poc = h264_ctx->colocated_buf_poc[i];
> +		if (col_poc != INVALID_POC && (poc_is_in_dpb(col_poc, decode->dpb) != 1))
> +			release_colocate_buf(h264_ctx, i);
> +	}
> +}
> +
> +static void h264_config_decode_spec(struct aml_vdec_hw *hw, struct aml_vdec_ctx *ctx)
> +{
> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)hw->curr_ctx;
> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
> +	struct v4l2_ctrl_h264_decode_params *decode =
> +		(struct v4l2_ctrl_h264_decode_params *)ctrls->decode;
> +	struct h264_decode_buf_spec *buf_spec;
> +	struct vb2_buffer *vb;
> +	struct vb2_v4l2_buffer *vb2_v4l2;
> +	struct vb2_queue *vq;
> +	int i;
> +
> +	clear_unused_col_buf(h264_ctx, decode);
> +
> +	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +	vb = &vb2_v4l2->vb2_buf;
> +
> +	h264_ctx->curr_spec.y_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
> +	if (ctx->pic_info.plane_num > 1)
> +		h264_ctx->curr_spec.c_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
> +	else
> +		h264_ctx->curr_spec.c_dma_addr =
> +				h264_ctx->curr_spec.y_dma_addr + ctx->pic_info.fb_size[0];
> +	h264_ctx->curr_spec.canvas_pos = 0;
> +	h264_ctx->curr_spec.col_buf_index =
> +		allocate_colocate_buf(h264_ctx, decode->top_field_order_cnt);
> +	h264_ctx->curr_spec.poc = decode->top_field_order_cnt;
> +	config_decode_canvas(hw, &h264_ctx->curr_spec, h264_ctx->mb_width, h264_ctx->mb_height);
> +
> +	h264_config_ref_lists(ctx);
> +
> +	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +
> +	for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
> +		struct v4l2_h264_dpb_entry *dpb = &decode->dpb[i];
> +
> +		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> +			continue;
> +
> +		buf_spec = find_spec_by_dpb_index(h264_ctx, i);
> +		if (buf_spec) {
> +			buf_spec->canvas_pos = i + 1;
> +			vb = vb2_find_buffer(vq, dpb->reference_ts);
> +			if (!vb) {
> +				pr_err("ref pic for ts %llu lost\n", dpb->reference_ts);
> +				continue;
> +			}
> +
> +			buf_spec->y_dma_addr =
> +				vb2_dma_contig_plane_dma_addr(vb, 0);
> +			if (ctx->pic_info.plane_num > 1)
> +				buf_spec->c_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
> +			else
> +				buf_spec->c_dma_addr =
> +					buf_spec->y_dma_addr + ctx->pic_info.fb_size[0];
> +			config_decode_canvas(hw, buf_spec, h264_ctx->mb_width, h264_ctx->mb_height);
> +			pr_debug
> +			    ("config canvas for poc %d canvas %d y_dma_addr 0x%llx\n",
> +			     buf_spec->dpb->top_field_order_cnt,
> +			     buf_spec->canvas_pos, buf_spec->y_dma_addr);
> +		}
> +	}
> +
> +	h264_reorder_reflists(h264_ctx);
> +}
> +
> +static int h264_config_decode_buf(struct aml_vdec_hw *hw, struct aml_vdec_ctx *ctx)
> +{
> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)hw->curr_ctx;
> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
> +	struct v4l2_ctrl_h264_decode_params *decode =
> +		(struct v4l2_ctrl_h264_decode_params *)ctrls->decode;
> +	unsigned long canvas_adr;
> +	unsigned int ref_cfg;
> +	unsigned int ref_cfg_once = 0;
> +	unsigned int type_cfg = 0x3; /* 0x3: frame type */
> +	unsigned int colocate_adr_offset, colocate_wr_adr;
> +	unsigned int info0;
> +	unsigned int info1;
> +	unsigned int info2;
> +	int i, j;
> +	int h264_buffer_info_data_write_count;
> +	u8 canvas_pos;
> +	u8 use_mode_8x8_flag;
> +
> +	WRITE_VREG(H264_CURRENT_POC_IDX_RESET, 0);
> +	WRITE_VREG(H264_CURRENT_POC, decode->top_field_order_cnt);
> +	WRITE_VREG(H264_CURRENT_POC, decode->top_field_order_cnt);
> +	WRITE_VREG(H264_CURRENT_POC, decode->bottom_field_order_cnt);
> +	WRITE_VREG(CURR_CANVAS_CTRL, h264_ctx->curr_spec.canvas_pos << 24);
> +	canvas_adr = RD_VREG(CURR_CANVAS_CTRL) & 0xffffff;
> +	pr_debug("canvas_pos = %d canvas_adr 0x%lx\n", h264_ctx->curr_spec.canvas_pos, canvas_adr);
> +
> +	WRITE_VREG(REC_CANVAS_ADDR, canvas_adr);
> +	WRITE_VREG(DBKR_CANVAS_ADDR, canvas_adr);
> +	WRITE_VREG(DBKW_CANVAS_ADDR, canvas_adr);
> +
> +	WRITE_VREG(H264_BUFFER_INFO_INDEX, 16);
> +	info0 = 0xf480;
> +	info1 = decode->top_field_order_cnt;
> +	info2 = decode->bottom_field_order_cnt;
> +	if (decode->bottom_field_order_cnt < decode->top_field_order_cnt)
> +		info0 |= 0x100;
> +
> +	WRITE_VREG(H264_BUFFER_INFO_DATA, info0 | 0xf);
> +	WRITE_VREG(H264_BUFFER_INFO_DATA, info1);
> +	WRITE_VREG(H264_BUFFER_INFO_DATA, info2);
> +
> +	for (j = 0; j < V4L2_H264_NUM_DPB_ENTRIES; j++) {
> +		struct v4l2_h264_dpb_entry *dpb = &decode->dpb[j];
> +
> +		info0 = 0;
> +		info1 = 0;
> +		info2 = 0;
> +		if (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE) {
> +			info0 = 0xf480;
> +			if (decode->bottom_field_order_cnt < decode->top_field_order_cnt)
> +				info0 |= 0x100;
> +			info1 = dpb->top_field_order_cnt;
> +			info2 = dpb->bottom_field_order_cnt;
> +			if (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
> +				info0 |= ((1 << 5) | (1 << 4));
> +		}
> +		WRITE_VREG(H264_BUFFER_INFO_DATA, info0);
> +		WRITE_VREG(H264_BUFFER_INFO_DATA, info1);
> +		WRITE_VREG(H264_BUFFER_INFO_DATA, info2);
> +	}
> +
> +	WRITE_VREG(H264_BUFFER_INFO_INDEX, 0);
> +	/* when frame width <= 256, Disable DDR_BYTE64_CACHE */
> +	if (ctx->pic_info.coded_width <= 256) {
> +		SET_VREG_MASK(IQIDCT_CONTROL, (1 << 16));
> +		WRITE_VREG(DCAC_DDR_BYTE64_CTL,
> +			   (RD_VREG(DCAC_DDR_BYTE64_CTL) & (~0xf)) | 0xa);
> +	} else {
> +		CLEAR_VREG_MASK(IQIDCT_CONTROL, (1 << 16));
> +	}
> +
> +	ref_cfg = 0;
> +	j = 0;
> +
> +	if (h264_ctx->list_size[0] > 0) {
> +		for (i = 0; i < h264_ctx->list_size[0]; i++) {
> +			canvas_pos = h264_ctx->ref_list0[i].canvas_pos;
> +			/* bit 0:3 canvas_pos bit 5:6 frame struct cfg */
> +			ref_cfg_once = (canvas_pos & 0x1f) | (type_cfg << 5);
> +			ref_cfg <<= 8;
> +			ref_cfg |= ref_cfg_once;
> +			j++;
> +
> +			if (j == 4) {
> +				WRITE_VREG(H264_BUFFER_INFO_DATA, ref_cfg);
> +				pr_debug("H264_BUFFER_INFO_DATA: %x\n", ref_cfg);
> +				h264_buffer_info_data_write_count++;
> +				j = 0;
> +			}
> +		}
> +
> +		if (j != 0) {
> +			while (j != 4) {
> +				ref_cfg <<= 8;
> +				ref_cfg |= ref_cfg_once;
> +				j++;
> +			}
> +			WRITE_VREG(H264_BUFFER_INFO_DATA, ref_cfg);
> +			pr_debug("H264_BUFFER_INFO_DATA: %x\n", ref_cfg);
> +			h264_buffer_info_data_write_count++;
> +		}
> +		ref_cfg = (ref_cfg_once << 24) | (ref_cfg_once << 16) |
> +			(ref_cfg_once << 8) | ref_cfg_once;
> +		for (j = h264_buffer_info_data_write_count; j < 8; j++)
> +			WRITE_VREG(H264_BUFFER_INFO_DATA, ref_cfg);
> +	}
> +
> +	WRITE_VREG(H264_BUFFER_INFO_INDEX, 8);
> +	j = 0;
> +	ref_cfg = 0;
> +
> +	if (h264_ctx->list_size[1] > 0) {
> +		for (i = 0; i < h264_ctx->list_size[1]; i++) {
> +			canvas_pos = h264_ctx->ref_list1[i].canvas_pos;
> +			ref_cfg_once = (canvas_pos & 0x1f) | (type_cfg << 5);
> +			ref_cfg <<= 8;
> +			ref_cfg |= ref_cfg_once;
> +			j++;
> +
> +			if (j == 4) {
> +				WRITE_VREG(H264_BUFFER_INFO_DATA, ref_cfg);
> +				pr_debug("H264_BUFFER_INFO_DATA: %x\n", ref_cfg);
> +				j = 0;
> +			}
> +		}
> +	}
> +
> +	if (j != 0) {
> +		while (j != 4) {
> +			ref_cfg <<= 8;
> +			ref_cfg |= ref_cfg_once;
> +			j++;
> +		}
> +		pr_debug("H264_BUFFER_INFO_DATA: %x\n", ref_cfg);
> +		WRITE_VREG(H264_BUFFER_INFO_DATA, ref_cfg);
> +	}
> +
> +	if (get_flag(ctrls->sps->flags, V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
> +	    get_flag(ctrls->sps->flags, V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE))
> +		use_mode_8x8_flag = 1;
> +	else
> +		use_mode_8x8_flag = 0;
> +
> +	while ((RD_VREG(H264_CO_MB_RW_CTL) >> 11) & 0x1)
> +		continue;
> +
> +	/* col buf for curr frame */
> +	colocate_adr_offset = 0;
> +	if (h264_ctx->curr_spec.col_buf_index >= 0 &&
> +	    h264_ctx->curr_spec.col_buf_index < h264_ctx->colocated_buf_num) {
> +		colocate_wr_adr = h264_ctx->collated_cma_addr +
> +			((h264_ctx->one_col_buf_size * h264_ctx->curr_spec.col_buf_index) >>
> +			(use_mode_8x8_flag ? 2 : 0));
> +		if (colocate_wr_adr + h264_ctx->one_col_buf_size >
> +		    h264_ctx->collated_cma_addr_end) {
> +			pr_err
> +			    ("Error, colocate buf is not enough, index is %d\n",
> +			     h264_ctx->curr_spec.col_buf_index);
> +			return -1;
> +		}
> +		WRITE_VREG(H264_CO_MB_WR_ADDR,
> +			   (colocate_wr_adr + colocate_adr_offset));
> +		pr_debug("col buffer addr = 0x%x col_buf_index %d\n",
> +			 (colocate_wr_adr + colocate_adr_offset),
> +			 h264_ctx->curr_spec.col_buf_index);
> +	} else {
> +		WRITE_VREG(H264_CO_MB_WR_ADDR, 0xffffffff);
> +		pr_debug("col buffer addr = 0xffffffff\n");
> +	}
> +
> +	if (h264_ctx->list_size[1] > 0) {
> +		struct h264_decode_buf_spec *colocate_pic = &h264_ctx->ref_list1[0];
> +		struct h264_decode_buf_spec *curr_pic = &h264_ctx->curr_spec;
> +		int l10_structure = 2; /* for pic struct == FRAME, default to 2 */
> +		int cur_colocate_ref_type;
> +		unsigned int colocate_rd_adr;
> +		unsigned int colocate_rd_adr_offset = 0;
> +		unsigned int val;
> +
> +		cur_colocate_ref_type =
> +			(abs(curr_pic->poc - colocate_pic->dpb->top_field_order_cnt) <
> +			abs(curr_pic->poc - colocate_pic->dpb->bottom_field_order_cnt)) ?
> +			0 : 1;
> +
> +		if (colocate_pic->col_buf_index >= 0 &&
> +		    colocate_pic->col_buf_index < h264_ctx->colocated_buf_num) {
> +			colocate_rd_adr = h264_ctx->collated_cma_addr +
> +				((h264_ctx->one_col_buf_size * colocate_pic->col_buf_index) >>
> +				(use_mode_8x8_flag ? 2 : 0));
> +			if (colocate_rd_adr + h264_ctx->one_col_buf_size >
> +			    h264_ctx->collated_cma_addr_end) {
> +				pr_err
> +				    ("Error, colocate rd buf is not enough, index is %d\n",
> +				     colocate_pic->col_buf_index);
> +				return -1;
> +			}
> +			val  = ((colocate_rd_adr_offset + colocate_rd_adr) >> 3) |
> +				(cur_colocate_ref_type << 29) |
> +				(l10_structure << 30);
> +			WRITE_VREG(H264_CO_MB_RD_ADDR, val);
> +		} else {
> +			pr_err
> +			    ("Error, reference pic has no colocated buf poc %d\n",
> +			     curr_pic->poc);
> +			return -1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void h264_release_decode_spec(struct aml_vdec_hw *hw, struct aml_vdec_ctx *ctx)
> +{
> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)hw->curr_ctx;
> +	int i;
> +	struct h264_decode_buf_spec *buf;
> +
> +	hw->hw_ops.canvas_free(h264_ctx->curr_spec.y_canvas_index);
> +	hw->hw_ops.canvas_free(h264_ctx->curr_spec.v_canvas_index);
> +
> +	if (h264_ctx->list_size[0] > 0) {
> +		for (i = 0; i < h264_ctx->list_size[0]; i++) {
> +			buf = &h264_ctx->ref_list0[i];
> +			if (buf->used) {
> +				buf->canvas_pos = 0;
> +				buf->dpb = NULL;
> +				hw->hw_ops.canvas_free(buf->y_canvas_index);
> +				hw->hw_ops.canvas_free(buf->u_canvas_index);
> +				buf->used = 0;
> +			}
> +		}
> +		h264_ctx->list_size[0] = 0;
> +	}
> +
> +	if (h264_ctx->list_size[1] > 0) {
> +		for (i = 0; i < h264_ctx->list_size[1]; i++) {
> +			buf = &h264_ctx->ref_list1[i];
> +			if (buf->used) {
> +				buf->canvas_pos = 0;
> +				buf->dpb = NULL;
> +				hw->hw_ops.canvas_free(buf->y_canvas_index);
> +				hw->hw_ops.canvas_free(buf->u_canvas_index);
> +				buf->used = 0;
> +			}
> +		}
> +		h264_ctx->list_size[1] = 0;
> +	}
> +}
> +
> +static void save_reg_status(struct aml_h264_ctx *h264_ctx)
> +{
> +	h264_ctx->reg_iqidct_control = RD_VREG(IQIDCT_CONTROL);
> +	h264_ctx->reg_iqidct_control_init_flag = 1;
> +	h264_ctx->reg_vcop_ctrl_reg = RD_VREG(VCOP_CTRL_REG);
> +	h264_ctx->reg_rv_ai_mb_count = RD_VREG(RV_AI_MB_COUNT);
> +	h264_ctx->vld_dec_control = RD_VREG(VLD_DECODE_CONTROL);
> +}
> +
> +static irqreturn_t h264_isr(int irq, void *priv)
> +{
> +	WRITE_VREG(VDEC_ASSIST_MBOX1_CLR_REG, 1);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static irqreturn_t h264_threaded_isr_func(int irq, void *priv)
> +{
> +	int dec_status = RD_VREG(DPB_STATUS_REG);
> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)dev->dec_hw->curr_ctx;
> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)dev->dec_ctx;
> +	struct aml_vdec_hw *hw = (struct aml_vdec_hw *)dev->dec_hw;
> +	unsigned short *p = (unsigned short *)h264_ctx->lmem_addr;
> +	int i, ii;
> +
> +	h264_ctx->dec_status = dec_status;
> +	pr_debug
> +	    ("%s, dec_status 0x%x VIFF_BIT_CNT 0x%x MBY_MBX 0x%x VLD_SHIFT_STATUS 0x%x\n",
> +	     __func__, dec_status, RD_VREG(VIFF_BIT_CNT), RD_VREG(MBY_MBX),
> +	     RD_VREG(VLD_SHIFT_STATUS));
> +
> +	h264_ctx->save_avscratch_f = RD_VREG(AV_SCRATCH_F);
> +
> +	switch (dec_status) {
> +	case H264_SLICE_HEADER_DONE:
> +		for (i = 0; i < 0x400; i += 4)
> +			for (ii = 0; ii < 4; ii++)
> +				h264_ctx->dpb_param.l.data[i + ii] = p[i + 3 - ii];
> +		save_reg_status(h264_ctx);
> +		if (h264_ctx->new_pic_flag == 1)
> +			h264_config_decode_spec(hw, ctx);
> +
> +		if (h264_config_decode_buf(hw, ctx) < 0) {
> +			h264_release_decode_spec(hw, ctx);
> +			ctx->int_cond = 1;
> +			wake_up_interruptible(&ctx->queue);
> +			goto irq_handled;
> +		}
> +		if (h264_ctx->new_pic_flag == 1) {
> +			WRITE_VREG(DPB_STATUS_REG, H264_ACTION_DECODE_NEWPIC);
> +			pr_debug("action decode new pic\n");
> +			h264_ctx->new_pic_flag = 0;
> +		} else {
> +			WRITE_VREG(DPB_STATUS_REG, H264_ACTION_DECODE_SLICE);
> +			pr_debug("action decode new slice\n");
> +		}
> +		break;
> +	case H264_SLICE_DATA_DONE:
> +		h264_release_decode_spec(hw, ctx);
> +		h264_ctx->decode_pic_count++;
> +		ctx->int_cond = 1;
> +		wake_up_interruptible(&ctx->queue);
> +		break;
> +	default:
> +		h264_release_decode_spec(hw, ctx);
> +		ctx->int_cond = 1;
> +		wake_up_interruptible(&ctx->queue);
> +		break;
> +	}
> +irq_handled:
> +	return IRQ_HANDLED;
> +}
> +
> +static int h264_restore_hw_ctx(struct aml_vdec_ctx *ctx)
> +{
> +	struct aml_h264_ctx *h264_ctx =
> +		(struct aml_h264_ctx *)ctx->codec_priv;
> +
> +	WRITE_VREG(POWER_CTL_VLD,
> +		   (RD_VREG(POWER_CTL_VLD) | (0 << 10) | (1 << 9) | (1 << 6)));
> +
> +	WRITE_VREG(PSCALE_CTRL, 0);
> +
> +	/* clear mailbox interrupt */
> +	WRITE_VREG(VDEC_ASSIST_MBOX1_CLR_REG, 1);
> +
> +	/* enable mailbox interrupt */
> +	WRITE_VREG(VDEC_ASSIST_MBOX1_MASK, 1);
> +
> +	SET_VREG_MASK(MDEC_PIC_DC_CTRL, (1 << 17));
> +	if (ctx->q_data[AML_Q_DATA_DST].fmt->fourcc == V4L2_PIX_FMT_NV21 ||
> +	    ctx->q_data[AML_Q_DATA_DST].fmt->fourcc == V4L2_PIX_FMT_NV21M)
> +		SET_VREG_MASK(MDEC_PIC_DC_CTRL, (1 << 16));
> +	else
> +		CLEAR_VREG_MASK(MDEC_PIC_DC_CTRL, (1 << 16));
> +
> +	SET_VREG_MASK(MDEC_PIC_DC_CTRL, (0xbf << 24));
> +	CLEAR_VREG_MASK(MDEC_PIC_DC_CTRL, (0xbf << 24));
> +	CLEAR_VREG_MASK(MDEC_PIC_DC_CTRL, (1 << 31));
> +
> +	CLEAR_VREG_MASK(MDEC_PIC_DC_MUX_CTRL, 1 << 31);
> +	WRITE_VREG(MDEC_EXTIF_CFG1, 0);
> +	WRITE_VREG(MDEC_PIC_DC_THRESH, 0x404038aa);
> +
> +	WRITE_VREG(DPB_STATUS_REG, 0);
> +
> +	WRITE_VREG(LMEM_DUMP_ADR, h264_ctx->lmem_phy_addr);
> +	WRITE_VREG(FRAME_COUNTER_REG, h264_ctx->decode_pic_count);
> +	WRITE_VREG(AV_SCRATCH_8, h264_ctx->workspace_offset);
> +	WRITE_VREG(AV_SCRATCH_G, h264_ctx->mc_cpu_paddr);
> +
> +	WRITE_VREG(AV_SCRATCH_F, ((h264_ctx->save_avscratch_f & 0xffffffc3) | (1 << 4)));
> +	CLEAR_VREG_MASK(AV_SCRATCH_F, 1 << 6);
> +
> +	WRITE_VREG(MDEC_PIC_DC_THRESH, 0x404038aa);
> +
> +	if (h264_ctx->reg_iqidct_control_init_flag == 0)
> +		WRITE_VREG(IQIDCT_CONTROL, 0x200);
> +
> +	if (h264_ctx->reg_iqidct_control)
> +		WRITE_VREG(IQIDCT_CONTROL, h264_ctx->reg_iqidct_control);
> +
> +	if (h264_ctx->reg_vcop_ctrl_reg)
> +		WRITE_VREG(VCOP_CTRL_REG, h264_ctx->reg_vcop_ctrl_reg);
> +
> +	if (h264_ctx->vld_dec_control)
> +		WRITE_VREG(VLD_DECODE_CONTROL, h264_ctx->vld_dec_control);
> +
> +	pr_debug
> +	    ("IQIDCT_CONTROL = 0x%x, VCOP_CTRL_REG 0x%x VLD_DECODE_CONTROL 0x%x\n",
> +	     RD_VREG(IQIDCT_CONTROL), RD_VREG(VCOP_CTRL_REG),
> +	     RD_VREG(VLD_DECODE_CONTROL));
> +
> +	return 0;
> +}
> +
> +static void *aml_h264_get_ctrl(struct v4l2_ctrl_handler *hdl, u32 id)
> +{
> +	struct v4l2_ctrl *ctrl;
> +
> +	ctrl = v4l2_ctrl_find(hdl, id);
> +	return ctrl ? ctrl->p_cur.p : NULL;
> +}
> +
> +static int aml_h264_get_stateless_ctrl_ref(struct aml_h264_ctx *h264_ctx)
> +{
> +	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
> +
> +	ctrls->sps =
> +		(struct v4l2_ctrl_h264_sps *)aml_h264_get_ctrl(&ctx->ctrl_handler,
> +			V4L2_CID_STATELESS_H264_SPS);
> +	if (WARN_ON(!ctrls->sps))
> +		return -EINVAL;
> +
> +	ctrls->pps =
> +		(struct v4l2_ctrl_h264_pps *)aml_h264_get_ctrl(&ctx->ctrl_handler,
> +			V4L2_CID_STATELESS_H264_PPS);
> +	if (WARN_ON(!ctrls->pps))
> +		return -EINVAL;
> +
> +	ctrls->decode =
> +		(struct v4l2_ctrl_h264_decode_params *)aml_h264_get_ctrl(&ctx->ctrl_handler,
> +			V4L2_CID_STATELESS_H264_DECODE_PARAMS);
> +	if (WARN_ON(!ctrls->decode))
> +		return -EINVAL;
> +
> +	ctrls->scaling =
> +		(struct v4l2_ctrl_h264_scaling_matrix *)aml_h264_get_ctrl(&ctx->ctrl_handler,
> +			V4L2_CID_STATELESS_H264_SCALING_MATRIX);
> +	if (WARN_ON(!ctrls->scaling))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void copy_mc_cpu_fw(void *mc_cpu_addr, const u8 *data)
> +{
> +	/*header */
> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_HEADER,
> +	       data + 0x4000, MC_SWAP_SIZE);
> +	/*data */
> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_DATA,
> +	       data + 0x2000, MC_SWAP_SIZE);
> +	/*mmco */
> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_MMCO,
> +	       data + 0x6000, MC_SWAP_SIZE);
> +	/*list */
> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_LIST,
> +	       data + 0x3000, MC_SWAP_SIZE);
> +	/*slice */
> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_SLICE,
> +	       data + 0x5000, MC_SWAP_SIZE);
> +	/*main */
> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_MAIN, data, 0x2000);
> +	/*data */
> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_MAIN + 0x2000,
> +	       data + 0x2000, 0x1000);
> +	/*slice */
> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_MAIN + 0x3000,
> +	       data + 0x5000, 0x1000);
> +}
> +
> +static int aml_h264_load_fw_ext(void *priv, const u8 *data, u32 len)
> +{
> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)priv;
> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)h264_ctx->v4l2_ctx;
> +	struct aml_vdec_hw *dec_hw;
> +
> +	if (h264_ctx->mc_cpu_loaded)
> +		return 0;
> +
> +	dec_hw = vdec_get_hw(ctx->dev);
> +	if (!dec_hw)
> +		return -1;
> +
> +	if (len > MC_TOTAL_SIZE) {
> +		pr_info("size of mc_cpu_fw id invalid\n");
> +		return -1;
> +	}
> +
> +	h264_ctx->mc_cpu_vaddr = dma_alloc_coherent(dec_hw->dev, MC_TOTAL_SIZE,
> +						    &h264_ctx->mc_cpu_paddr,
> +						    GFP_KERNEL);
> +	if (!h264_ctx->mc_cpu_vaddr)
> +		return -ENOMEM;
> +
> +	copy_mc_cpu_fw(h264_ctx->mc_cpu_vaddr, data);
> +
> +	h264_ctx->mc_cpu_loaded = true;
> +
> +	pr_debug("h264 mccpu fw loaded\n");
> +
> +	return 0;
> +}
> +
> +int aml_h264_init(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)priv;
> +	struct aml_vdec_hw *dec_hw;
> +	struct aml_h264_ctx *h264_ctx;
> +	int ret = 0;
> +
> +	h264_ctx = kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
> +	if (!h264_ctx)
> +		return -ENOMEM;
> +
> +	h264_ctx->v4l2_ctx = ctx;
> +	dec_hw = vdec_get_hw(ctx->dev);
> +	if (!dec_hw)
> +		return -1;
> +
> +	h264_ctx->mc_cpu_loaded = false;
> +	dec_hw->hw_ops.irq_handler = h264_isr;
> +	dec_hw->hw_ops.irq_threaded_func = h264_threaded_isr_func;
> +	dec_hw->hw_ops.load_firmware_ex = aml_h264_load_fw_ext;
> +
> +	h264_ctx->lmem_addr = dma_alloc_coherent(dec_hw->dev, LMEM_DUMP_SIZE,
> +						 &h264_ctx->lmem_phy_addr,
> +						 GFP_KERNEL);
> +	if (!h264_ctx->lmem_addr) {
> +		ret = -ENOMEM;
> +		goto err_alloc_lmem;
> +	}
> +
> +	h264_ctx->cma_alloc_vaddr =
> +	    dma_alloc_coherent(dec_hw->dev, V_BUF_ADDR_OFFSET,
> +			       &h264_ctx->cma_alloc_addr, GFP_KERNEL);
> +	if (!h264_ctx->cma_alloc_vaddr) {
> +		ret = -ENOMEM;
> +		goto err_alloc_workspace;
> +	}
> +
> +	h264_ctx->workspace_offset = h264_ctx->cma_alloc_addr + DCAC_READ_MARGIN;
> +	h264_ctx->workspace_vaddr = h264_ctx->cma_alloc_vaddr + DCAC_READ_MARGIN;
> +
> +	ctx->codec_priv = h264_ctx;
> +	dec_hw->curr_ctx = h264_ctx;
> +	h264_ctx->col_buf_alloc_size = 0;
> +	h264_ctx->init_flag = 0;
> +	h264_ctx->new_pic_flag = 0;
> +	h264_ctx->param_set = 0;
> +	h264_ctx->reg_iqidct_control_init_flag = 0;
> +	h264_ctx->decode_pic_count = 0;
> +
> +	return 0;
> +
> +err_alloc_workspace:
> +	dma_free_coherent(dec_hw->dev, LMEM_DUMP_SIZE,
> +			  h264_ctx->lmem_addr, h264_ctx->lmem_phy_addr);
> +err_alloc_lmem:
> +	kfree(h264_ctx);
> +
> +	return ret;
> +}
> +
> +void aml_h264_exit(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)priv;
> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)ctx->codec_priv;
> +	struct aml_vdec_hw *dec_hw;
> +
> +	if (!h264_ctx) {
> +		pr_info("h264 decoder is already destroyed or not created!\n");
> +		return;
> +	}
> +	dec_hw = vdec_get_hw(ctx->dev);
> +	h264_ctx->param_set = 0;
> +
> +	if (ctx->dos_clk_en)
> +		aml_stop_vdec_hw();
> +
> +	if (h264_ctx->collated_cma_vaddr) {
> +		dma_free_coherent(dec_hw->dev, h264_ctx->col_buf_alloc_size,
> +				  h264_ctx->collated_cma_vaddr,
> +				  h264_ctx->collated_cma_addr);
> +		h264_ctx->col_buf_alloc_size = 0;
> +	}
> +
> +	if (h264_ctx->mc_cpu_vaddr) {
> +		dma_free_coherent(dec_hw->dev, MC_TOTAL_SIZE,
> +				  h264_ctx->mc_cpu_vaddr,
> +				  h264_ctx->mc_cpu_paddr);
> +		h264_ctx->mc_cpu_loaded = false;
> +	}
> +
> +	if (h264_ctx->lmem_addr)
> +		dma_free_coherent(dec_hw->dev, LMEM_DUMP_SIZE,
> +				  h264_ctx->lmem_addr, h264_ctx->lmem_phy_addr);
> +
> +	if (h264_ctx->cma_alloc_vaddr)
> +		dma_free_coherent(dec_hw->dev, V_BUF_ADDR_OFFSET,
> +				  h264_ctx->cma_alloc_vaddr,
> +				  h264_ctx->cma_alloc_addr);
> +
> +	kfree(ctx->codec_priv);
> +	dec_hw->curr_ctx = NULL;
> +	ctx->codec_priv = NULL;
> +}
> +
> +static void config_decode_mode(struct aml_h264_ctx *h264_ctx)
> +{
> +	WRITE_VREG(H264_DECODE_MODE, 0x1);  /*decode mode framebase*/
> +	WRITE_VREG(HEAD_PADDING_REG, 0);
> +	WRITE_VREG(H264_DECODE_SEQINFO, h264_ctx->seq_info);
> +	WRITE_VREG(INIT_FLAG_REG, 1);
> +}
> +
> +int aml_h264_dec_run(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)priv;
> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)ctx->codec_priv;
> +	int ret = -1;
> +	int i;
> +
> +	ret = aml_h264_get_stateless_ctrl_ref(h264_ctx);
> +	if (ret < 0) {
> +		pr_err("not ctrl ref for h264 decoder\n");
> +		return ret;
> +	}
> +
> +	h264_config_params(ctx);
> +
> +	if (h264_prepare_input(ctx) < 0)
> +		return ret;
> +
> +	if (alloc_colocate_cma(h264_ctx, ctx) < 0)
> +		return ret;
> +
> +	h264_restore_hw_ctx(ctx);
> +
> +	config_decode_mode(h264_ctx);
> +	/* enable stream input hardware */
> +	SET_VREG_MASK(VLD_MEM_VIFIFO_CONTROL, (1 << 2) | (1 << 1));
> +	/* enable hardware timer */
> +	WRITE_VREG(NAL_SEARCH_CTL, RD_VREG(NAL_SEARCH_CTL) | (1 << 16));
> +	WRITE_VREG(MDEC_EXTIF_CFG2, RD_VREG(MDEC_EXTIF_CFG2) | 0x20);
> +	WRITE_VREG(NAL_SEARCH_CTL, RD_VREG(NAL_SEARCH_CTL) & (~0x2));
> +	CLEAR_VREG_MASK(VDEC_ASSIST_MMC_CTRL1, 1 << 3);
> +
> +	aml_start_vdec_hw();
> +	h264_ctx->init_flag = 1;
> +	h264_ctx->new_pic_flag = 1;
> +
> +	WRITE_VREG(DPB_STATUS_REG, H264_ACTION_SEARCH_HEAD);
> +
> +	ret = wait_event_interruptible_timeout(ctx->queue, ctx->int_cond,
> +					       msecs_to_jiffies(DECODER_TIMEOUT_MS));
> +	ctx->int_cond = 0;
> +	if (!ret) {
> +		ret = -1;
> +		pr_err("dec timeout=%u\n", DECODER_TIMEOUT_MS);
> +		for (i = 0; i < 16; i++) {	/* 16 : show ucode PC 16 times when timeout */
> +			pr_info("decoder timeout, pc 0x%x\n", RD_VREG(MPC_E));
> +			usleep_range(10, 20);
> +		}
> +	} else if (-ERESTARTSYS == ret) {
> +		ret = -1;
> +		pr_err("dec inter fail\n");
> +	}
> +
> +	aml_stop_vdec_hw();
> +	h264_ctx->init_flag = 0;
> +
> +	return ret;
> +}
> diff --git a/drivers/media/platform/amlogic/vdec/h264.h b/drivers/media/platform/amlogic/vdec/h264.h
> new file mode 100644
> index 000000000000..3d3a35a641c9
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/h264.h
> @@ -0,0 +1,300 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +#ifndef _H264_H_
> +#define _H264_H_
> +
> +#define RPM_BEGIN           0x0
> +#define FRAME_IN_DPB        24
> +#define RPM_END             0x400
> +#define DPB_OFFSET          0x100
> +#define MMCO_OFFSET         0x200
> +#define SPS_OFFSET          0x100
> +#define PPS_OFFSET          0x300
> +#define PARAM_BASE_VAL      0x414d
> +#define MEM_MMCO_BASE       0x01c3000
> +#define MEM_SPS_BASE        0x01c3c00
> +#define MEM_PPS_BASE        0x01cbc00
> +#define MC_TOTAL_SIZE       ((20 + 16) * SZ_1K)
> +#define MC_SWAP_SIZE        (4 * SZ_1K)
> +#define LMEM_DUMP_SIZE      4096
> +#define V_BUF_ADDR_OFFSET   (0x200000 + 0x8000 + 0x20000 + 0x1000)
> +#define DCAC_READ_MARGIN    (64 * 1024)
> +#define MC_OFFSET_HEADER    0x0000
> +#define MC_OFFSET_DATA      0x1000
> +#define MC_OFFSET_MMCO      0x2000
> +#define MC_OFFSET_LIST      0x3000
> +#define MC_OFFSET_SLICE     0x4000
> +#define MC_OFFSET_MAIN      0x5000
> +
> +/* Rename the dos regs */
> +#define H264_DECODE_INFO    M4_CONTROL_REG
> +#define INIT_FLAG_REG       AV_SCRATCH_2
> +#define HEAD_PADDING_REG     AV_SCRATCH_3
> +#define UCODE_WATCHDOG_REG   AV_SCRATCH_7
> +#define LMEM_DUMP_ADR       AV_SCRATCH_L
> +#define DEBUG_REG1          AV_SCRATCH_M
> +#define DEBUG_REG2          AV_SCRATCH_N
> +#define FRAME_COUNTER_REG       AV_SCRATCH_I
> +#define RPM_CMD_REG          AV_SCRATCH_A
> +#define H264_DECODE_SIZE    AV_SCRATCH_E
> +#define H264_DECODE_MODE    AV_SCRATCH_4
> +#define H264_DECODE_SEQINFO    AV_SCRATCH_5
> +/**
> + * NAL_SEARCH_CTL: bit 0, enable itu_t35
> + * NAL_SEARCH_CTL: bit 1, enable mmu
> + * NAL_SEARCH_CTL: bit 2, detect frame_mbs_only_flag whether switch resolution
> + * NAL_SEARCH_CTL: bit 3, recover the correct sps pps
> + * NAL_SEARCH_CTL: bit 7-14,level_idc
> + * NAL_SEARCH_CTL: bit 15,bitstream_restriction_flag
> + */
> +#define NAL_SEARCH_CTL      AV_SCRATCH_9
> +#define DPB_STATUS_REG      AV_SCRATCH_J
> +#define ERROR_STATUS_REG    AV_SCRATCH_9
> +
> +#define H264_BUFFER_INFO_INDEX      PMV3_X	/* 0xc24 */
> +#define H264_BUFFER_INFO_DATA       PMV2_X	/* 0xc22 */
> +#define H264_CURRENT_POC_IDX_RESET  LAST_SLICE_MV_ADDR	/* 0xc30 */
> +#define H264_CURRENT_POC            LAST_MVY	/* 0xc32 shared with conceal MV */
> +#define H264_CO_MB_WR_ADDR          VLD_C38
> +#define H264_CO_MB_RD_ADDR          VLD_C39
> +#define H264_CO_MB_RW_CTL           VLD_C3D
> +#define MBY_MBX                     MB_MOTION_MODE
> +
> +#define H264_ACTION_SEARCH_HEAD     0xf0
> +#define H264_ACTION_DECODE_SLICE    0xf1
> +#define H264_ACTION_CONFIG_DONE     0xf2
> +#define H264_ACTION_DECODE_NEWPIC   0xf3
> +#define H264_ACTION_DECODE_START    0xff
> +
> +/* RPM memory definition */
> +#define FIXED_FRAME_RATE_FLAG						0X21
> +#define OFFSET_DELIMITER_LO						0x2f
> +#define OFFSET_DELIMITER_HI						0x30
> +#define REF_IDC_OVERRIDE_FLAG						0x35
> +#define SLICE_IPONLY_BREAK						0X5C
> +#define PREV_MAX_REFERENCE_FRAME_NUM					0X5D
> +#define EOS								0X5E
> +#define FRAME_PACKING_TYPE						0X5F
> +#define OLD_POC_PAR_1							0X60
> +#define OLD_POC_PAR_2							0X61
> +#define PREV_MBX							0X62
> +#define PREV_MBY							0X63
> +#define ERROR_SKIP_MB_NUM						0X64
> +#define ERROR_MB_STATUS							0X65
> +#define L0_PIC0_STATUS							0X66
> +#define TIMEOUT_COUNTER							0X67
> +#define BUFFER_SIZE							0X68
> +#define BUFFER_SIZE_HI							0X69
> +#define CROPPING_LEFT_RIGHT						0X6A
> +#define CROPPING_TOP_BOTTOM						0X6B
> +/**
> + * sps_flags2:
> + * bit 3, bitstream_restriction_flag
> + * bit 2, pic_struct_present_flag
> + * bit 1, vcl_hrd_parameters_present_flag
> + * bit 0, nal_hrd_parameters_present_flag
> + */
> +#define SPS_FLAGS2							0x6C
> +#define NUM_REORDER_FRAMES						0x6D
> +#define MAX_BUFFER_FRAME						0X6E
> +
> +#define NON_CONFORMING_STREAM						0X70
> +#define RECOVERY_POINT							0X71
> +#define POST_CANVAS							0X72
> +#define POST_CANVAS_H							0X73
> +#define SKIP_PIC_COUNT							0X74
> +#define TARGET_NUM_SCALING_LIST						0X75
> +#define FF_POST_ONE_FRAME						0X76
> +#define PREVIOUS_BIT_CNT						0X77
> +#define MB_NOT_SHIFT_COUNT						0X78
> +#define PIC_STATUS							0X79
> +#define FRAME_COUNTER							0X7A
> +#define NEW_SLICE_TYPE							0X7B
> +#define NEW_PICTURE_STRUCTURE						0X7C
> +#define NEW_FRAME_NUM							0X7D
> +#define NEW_IDR_PIC_ID							0X7E
> +#define IDR_PIC_ID							0X7F
> +
> +/* h264 LOCAL */
> +#define NAL_UNIT_TYPE							0X80
> +#define NAL_REF_IDC							0X81
> +#define SLICE_TYPE							0X82
> +#define LOG2_MAX_FRAME_NUM						0X83
> +#define FRAME_MBS_ONLY_FLAG						0X84
> +#define PIC_ORDER_CNT_TYPE						0X85
> +#define LOG2_MAX_PIC_ORDER_CNT_LSB					0X86
> +#define PIC_ORDER_PRESENT_FLAG						0X87
> +#define REDUNDANT_PIC_CNT_PRESENT_FLAG					0X88
> +#define PIC_INIT_QP_MINUS26						0X89
> +#define DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG				0X8A
> +#define NUM_SLICE_GROUPS_MINUS1						0X8B
> +#define MODE_8X8_FLAGS							0X8C
> +#define ENTROPY_CODING_MODE_FLAG					0X8D
> +#define SLICE_QUANT							0X8E
> +#define TOTAL_MB_HEIGHT							0X8F
> +#define PICTURE_STRUCTURE						0X90
> +#define TOP_INTRA_TYPE							0X91
> +#define RV_AI_STATUS							0X92
> +#define AI_READ_START							0X93
> +#define AI_WRITE_START							0X94
> +#define AI_CUR_BUFFER							0X95
> +#define AI_DMA_BUFFER							0X96
> +#define AI_READ_OFFSET							0X97
> +#define AI_WRITE_OFFSET							0X98
> +#define AI_WRITE_OFFSET_SAVE						0X99
> +#define RV_AI_BUFF_START						0X9A
> +#define I_PIC_MB_COUNT							0X9B
> +#define AI_WR_DCAC_DMA_CTRL						0X9C
> +#define SLICE_MB_COUNT							0X9D
> +#define PICTYPE								0X9E
> +#define SLICE_GROUP_MAP_TYPE						0X9F
> +#define MB_TYPE								0XA0
> +#define MB_AFF_ADDED_DMA						0XA1
> +#define PREVIOUS_MB_TYPE						0XA2
> +#define WEIGHTED_PRED_FLAG						0XA3
> +#define WEIGHTED_BIPRED_IDC						0XA4
> +/* bit 3:2 - PICTURE_STRUCTURE
> + * bit 1 - MB_ADAPTIVE_FRAME_FIELD_FLAG
> + * bit 0 - FRAME_MBS_ONLY_FLAG
> + */
> +#define MBFF_INFO							0XA5
> +#define TOP_INTRA_TYPE_TOP						0XA6
> +#define RV_AI_BUFF_INC							0xA7
> +#define DEFAULT_MB_INFO_LO						0xA8
> +/* 0 -- no need to read
> + * 1 -- need to wait Left
> + * 2 -- need to read Intra
> + * 3 -- need to read back MV
> + */
> +#define NEED_READ_TOP_INFO						0xA9
> +/* 0 -- idle
> + * 1 -- wait Left
> + * 2 -- reading top Intra
> + * 3 -- reading back MV
> + */
> +#define READ_TOP_INFO_STATE						0xAA
> +#define DCAC_MBX							0xAB
> +#define TOP_MB_INFO_OFFSET						0xAC
> +#define TOP_MB_INFO_RD_IDX						0xAD
> +#define TOP_MB_INFO_WR_IDX						0xAE
> +
> +#define VLD_NO_WAIT	 0
> +#define VLD_WAIT_BUFFER 1
> +#define VLD_WAIT_HOST   2
> +#define VLD_WAIT_GAP	3
> +
> +#define VLD_WAITING							0xAF
> +
> +#define MB_X_NUM							0xB0
> +#define MB_HEIGHT							0xB2
> +#define MBX								0xB3
> +#define TOTAL_MBY							0xB4
> +#define INTR_MSK_SAVE							0xB5
> +#define NEED_DISABLE_PPE						0xB6
> +#define IS_NEW_PICTURE							0XB7
> +#define PREV_NAL_REF_IDC						0XB8
> +#define PREV_NAL_UNIT_TYPE						0XB9
> +#define FRAME_MB_COUNT							0XBA
> +#define SLICE_GROUP_UCODE						0XBB
> +#define SLICE_GROUP_CHANGE_RATE						0XBC
> +#define SLICE_GROUP_CHANGE_CYCLE_LEN					0XBD
> +#define DELAY_LENGTH							0XBE
> +#define PICTURE_STRUCT							0XBF
> +#define DCAC_PREVIOUS_MB_TYPE						0xC1
> +
> +#define TIME_STAMP							0XC2
> +#define H_TIME_STAMP							0XC3
> +#define VPTS_MAP_ADDR							0XC4
> +#define H_VPTS_MAP_ADDR							0XC5
> +#define PIC_INSERT_FLAG							0XC7
> +#define TIME_STAMP_START						0XC8
> +#define TIME_STAMP_END							0XDF
> +#define OFFSET_FOR_NON_REF_PIC						0XE0
> +#define OFFSET_FOR_TOP_TO_BOTTOM_FIELD					0XE2
> +#define MAX_REFERENCE_FRAME_NUM						0XE4
> +#define FRAME_NUM_GAP_ALLOWED						0XE5
> +#define NUM_REF_FRAMES_IN_PIC_ORDER_CNT_CYCLE				0XE6
> +#define PROFILE_IDC_MMCO						0XE7
> +#define LEVEL_IDC_MMCO							0XE8
> +#define FRAME_SIZE_IN_MB						0XE9
> +#define DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG				0XEA
> +#define PPS_NUM_REF_IDX_L0_ACTIVE_MINUS1				0XEB
> +#define PPS_NUM_REF_IDX_L1_ACTIVE_MINUS1				0XEC
> +#define CURRENT_SPS_ID							0XED
> +#define CURRENT_PPS_ID							0XEE
> +/* bit 0 - sequence parameter set may change
> + * bit 1 - picture parameter set may change
> + * bit 2 - new dpb just inited
> + * bit 3 - IDR picture not decoded yet
> + * bit 5:4 - 0: mb level code loaded 1: picture
> + * level code loaded 2: slice level code loaded
> + */
> +#define DECODE_STATUS							0XEF
> +#define FIRST_MB_IN_SLICE						0XF0
> +#define PREV_MB_WIDTH							0XF1
> +#define PREV_FRAME_SIZE_IN_MB						0XF2
> +/* bit 0 - aspect_ratio_info_present_flag
> + * bit 1 - timing_info_present_flag
> + * bit 2 - nal_hrd_parameters_present_flag
> + * bit 3 - vcl_hrd_parameters_present_flag
> + * bit 4 - pic_struct_present_flag
> + * bit 5 - bitstream_restriction_flag
> + */
> +#define VUI_STATUS							0XF4
> +#define ASPECT_RATIO_IDC						0XF5
> +#define ASPECT_RATIO_SAR_WIDTH						0XF6
> +#define ASPECT_RATIO_SAR_HEIGHT						0XF7
> +#define NUM_UNITS_IN_TICK						0XF8
> +#define TIME_SCALE							0XFA
> +#define CURRENT_PIC_INFO						0XFC
> +#define DPB_BUFFER_INFO							0XFD
> +#define REFERENCE_POOL_INFO						0XFE
> +#define REFERENCE_LIST_INFO						0XFF
> +
> +#define REORDER_CMD_MAX             66
> +
> +/* config parameters to DDR lmem */
> +#define GET_SPS_PROFILE_IDC(x)       (((x) & 0xff) << 8)
> +#define GET_SPS_LEVEL_IDC(x)         ((x) & 0xff)
> +#define GET_SPS_SEQ_PARAM_SET_ID(x)       (((x) & 0x1f) << 8)
> +#define GET_SPS_CHROMA_FORMAT_IDC(x)      ((x) << 8)
> +#define GET_SPS_NUM_REF_FRAMES(x)         ((x) & 0xff)
> +#define GET_SPS_GAPS_ALLOWED_FLAG(x)      ((x) << 8)
> +#define GET_SPS_LOG2_MAX_FRAME_NUM(x)     ((x) + 4)
> +#define GET_SPS_PIC_ORDER_CNT_LSB(x)      ((x) + 4)
> +#define GET_SPS_PIC_ORDER_TYPE(x)         (x)
> +#define GET_SPS_OFFSET_FOR_NONREF_PIC_HIGH(x)      (((x) & 0xffff0000) >> 16)
> +#define GET_SPS_OFFSET_FOR_NONREF_PIC_LOW(x)         ((x) & 0xffff)
> +#define GET_SPS_OFFSET_FOR_TOP_BOT_FIELD_HIGH(x)      (((x) & 0xffff0000) >> 16)
> +#define GET_SPS_OFFSET_FOR_TOP_BOT_FIELD_LOW(x)         ((x) & 0xffff)
> +#define GET_SPS_PIC_WIDTH_IN_MBS(x)       ((x) + 1)
> +#define GET_SPS_PIC_HEIGHT_IN_MBS(x)      ((x) + 1)
> +#define GET_SPS_DIRECT_8X8_FLAGS(x)       (((x) & 0x1) << 2)
> +#define GET_SPS_MB_ADAPTIVE_FRAME_FIELD_FLAGS(x)       (((x) & 0x1) << 1)
> +#define GET_SPS_FRAME_MBS_ONLY_FLAGS(x)   ((x) & 0x1)
> +
> +#define GET_PPS_PIC_PARAM_SET_ID(x)       ((x) & 0xff)
> +#define GET_PPS_SEQ_PARAM_SET_ID(x)       (((x) & 0x1f) << 8)
> +#define GET_PPS_ENTROPY_CODING_MODE_FLAG(x)  (((x) & 0x1) << 13)
> +#define GET_PPS_PIC_ORDER_PRESENT_FLAG(x)    (((x) & 0x1) << 14)
> +#define GET_PPS_NUM_IDX_REF_L0_MINUS1(x)       ((x) & 0x1f)
> +#define GET_PPS_NUM_IDX_REF_L1_MINUS1(x)       (((x) & 0x1f) << 5)
> +#define GET_PPS_WEIGHTED_PRED_FLAG(x)         (((x) & 0x1) << 10)
> +#define GET_PPS_WEIGHTED_BIPRED_IDC(x)        (((x) & 0x3) << 11)
> +#define GET_PPS_INIT_QS_MINUS26(x)           (((x) & 0xff) << 8)
> +#define GET_PPS_INIT_QP_MINUS26(x)           ((x) & 0xff)
> +#define GET_PPS_CHROMA_QP_INDEX_OFFSET(x)   ((x) & 0xff)
> +#define GET_PPS_DEBLOCK_FILTER_CTRL_PRESENT_FLAG(x)   (((x) & 0x1) << 8)
> +#define GET_PPS_CONSTRAIN_INTRA_PRED_FLAG(x)          (((x) & 0x1) << 9)
> +#define GET_PPS_REDUNDANT_PIC_CNT_PRESENT_FLAG(x)     (((x) & 0x1) << 10)
> +#define GET_PPS_SCALING_MATRIX_PRESENT_FLAG(x)        (((x) & 0x1) << 1)
> +#define GET_PPS_TRANSFORM_8X8_FLAG(x)                 ((x) & 0x1)
> +#define GET_PPS_GET_SECOND_CHROMA_QP_OFFSET(x)        (x)
> +
> +int aml_h264_init(void *priv);
> +void aml_h264_exit(void *priv);
> +int aml_h264_dec_run(void *priv);
> +
> +#endif
> diff --git a/drivers/media/platform/amlogic/vdec/reg_defines.h b/drivers/media/platform/amlogic/vdec/reg_defines.h
> new file mode 100644
> index 000000000000..6b1900ecbedb
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/reg_defines.h
> @@ -0,0 +1,175 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#ifndef _REG_DEFINES_H_
> +#define _REG_DEFINES_H_
> +
> +#define VDEC_ASSIST_MMC_CTRL0        0x0001
> +#define VDEC_ASSIST_MMC_CTRL1        0x0002
> +
> +#define VDEC_ASSIST_CANVAS_BLK32     0x0005
> +
> +#define VDEC_ASSIST_MBOX1_CLR_REG    0x0075
> +#define VDEC_ASSIST_MBOX1_MASK       0x0076
> +
> +#define MPSR                         0x0301
> +#define MPC_P                        0x0306
> +#define MPC_D                        0x0307
> +#define MPC_E                        0x0308
> +#define MPC_W                        0x0309
> +#define CPSR                         0x0321
> +#define IMEM_DMA_CTRL                0x0340
> +#define IMEM_DMA_ADR                 0x0341
> +#define IMEM_DMA_COUNT               0x0342
> +#define WRRSP_IMEM                   0x0343
> +#define LMEM_DMA_CTRL                0x0350
> +#define WRRSP_LMEM                   0x0353
> +
> +#define PSCALE_CTRL                  0x0911
> +#define GCLK_EN                      0x0983
> +#define MDEC_PIC_DC_CTRL             0x098e
> +#define MDEC_PIC_DC_MUX_CTRL         0x098d
> +#define ANC0_CANVAS_ADDR             0x0990
> +#define ANC1_CANVAS_ADDR             0x0991
> +#define ANC2_CANVAS_ADDR             0x0992
> +#define ANC3_CANVAS_ADDR             0x0993
> +#define ANC4_CANVAS_ADDR             0x0994
> +#define ANC5_CANVAS_ADDR             0x0995
> +#define ANC6_CANVAS_ADDR             0x0996
> +#define ANC7_CANVAS_ADDR             0x0997
> +#define ANC8_CANVAS_ADDR             0x0998
> +#define ANC9_CANVAS_ADDR             0x0999
> +#define ANC10_CANVAS_ADDR            0x099a
> +#define ANC11_CANVAS_ADDR            0x099b
> +#define ANC12_CANVAS_ADDR            0x099c
> +#define ANC13_CANVAS_ADDR            0x099d
> +#define ANC14_CANVAS_ADDR            0x099e
> +#define ANC15_CANVAS_ADDR            0x099f
> +#define ANC16_CANVAS_ADDR            0x09a0
> +#define ANC17_CANVAS_ADDR            0x09a1
> +#define ANC18_CANVAS_ADDR            0x09a2
> +#define ANC19_CANVAS_ADDR            0x09a3
> +#define ANC20_CANVAS_ADDR            0x09a4
> +#define ANC21_CANVAS_ADDR            0x09a5
> +#define ANC22_CANVAS_ADDR            0x09a6
> +#define ANC23_CANVAS_ADDR            0x09a7
> +#define ANC24_CANVAS_ADDR            0x09a8
> +#define ANC25_CANVAS_ADDR            0x09a9
> +#define ANC26_CANVAS_ADDR            0x09aa
> +#define ANC27_CANVAS_ADDR            0x09ab
> +#define ANC28_CANVAS_ADDR            0x09ac
> +#define ANC29_CANVAS_ADDR            0x09ad
> +#define ANC30_CANVAS_ADDR            0x09ae
> +#define ANC31_CANVAS_ADDR            0x09af
> +#define DBKR_CANVAS_ADDR             0x09b0
> +#define DBKW_CANVAS_ADDR             0x09b1
> +#define REC_CANVAS_ADDR              0x09b2
> +#define CURR_CANVAS_CTRL             0x09b3
> +#define MDEC_PIC_DC_THRESH           0x09b8
> +#define AV_SCRATCH_0                 0x09c0
> +#define AV_SCRATCH_1                 0x09c1
> +#define AV_SCRATCH_2                 0x09c2
> +#define AV_SCRATCH_3                 0x09c3
> +#define AV_SCRATCH_4                 0x09c4
> +#define AV_SCRATCH_5                 0x09c5
> +#define AV_SCRATCH_6                 0x09c6
> +#define AV_SCRATCH_7                 0x09c7
> +#define AV_SCRATCH_8                 0x09c8
> +#define AV_SCRATCH_9                 0x09c9
> +#define AV_SCRATCH_A                 0x09ca
> +#define AV_SCRATCH_B                 0x09cb
> +#define AV_SCRATCH_C                 0x09cc
> +#define AV_SCRATCH_D                 0x09cd
> +#define AV_SCRATCH_E                 0x09ce
> +#define AV_SCRATCH_F                 0x09cf
> +#define AV_SCRATCH_G                 0x09d0
> +#define AV_SCRATCH_H                 0x09d1
> +#define AV_SCRATCH_I                 0x09d2
> +#define AV_SCRATCH_J                 0x09d3
> +#define AV_SCRATCH_K                 0x09d4
> +#define AV_SCRATCH_L                 0x09d5
> +#define AV_SCRATCH_M                 0x09d6
> +#define AV_SCRATCH_N                 0x09d7
> +#define WRRSP_VLD                    0x09da
> +#define MDEC_DOUBLEW_CFG0            0x09db
> +#define MDEC_DOUBLEW_CFG1            0x09dc
> +#define MDEC_DOUBLEW_CFG2            0x09dd
> +#define MDEC_DOUBLEW_CFG3            0x09de
> +#define MDEC_DOUBLEW_CFG4            0x09df
> +#define MDEC_DOUBLEW_CFG5            0x09e0
> +#define MDEC_DOUBLEW_CFG6            0x09e1
> +#define MDEC_DOUBLEW_CFG7            0x09e2
> +#define MDEC_DOUBLEW_STATUS          0x09e3
> +#define MDEC_EXTIF_CFG0              0x09e4
> +
> +#define MDEC_EXTIF_CFG1              0x09e5
> +#define MDEC_EXTIF_CFG2              0x09e6
> +
> +#define POWER_CTL_VLD                0x0c08
> +#define VLD_DECODE_CONTROL           0x0c18
> +
> +#define PMV1_X                       0x0c20
> +#define PMV1_Y                       0x0c21
> +#define PMV2_X                       0x0c22
> +#define PMV2_Y                       0x0c23
> +#define PMV3_X                       0x0c24
> +#define PMV3_Y                       0x0c25
> +#define PMV4_X                       0x0c26
> +#define PMV4_Y                       0x0c27
> +#define M4_TABLE_SELECT              0x0c28
> +#define M4_CONTROL_REG               0x0c29
> +#define BLOCK_NUM                    0x0c2a
> +#define PATTERN_CODE                 0x0c2b
> +#define MB_INFO                      0x0c2c
> +#define VLD_DC_PRED                  0x0c2d
> +#define VLD_ERROR_MASK               0x0c2e
> +#define VLD_DC_PRED_C                0x0c2f
> +#define LAST_SLICE_MV_ADDR           0x0c30
> +#define LAST_MVX                     0x0c31
> +#define LAST_MVY                     0x0c32
> +
> +#define MB_MOTION_MODE               0x0c07
> +#define VIFF_BIT_CNT                 0x0c1a
> +#define M4_CONTROL_REG               0x0c29
> +#define VLD_C38                      0x0c38
> +#define VLD_C39                      0x0c39
> +#define VLD_SHIFT_STATUS             0x0c3b
> +#define VLD_C3D                      0x0c3d
> +#define VLD_MEM_VIFIFO_START_PTR     0x0c40
> +#define VLD_MEM_VIFIFO_CURR_PTR      0x0c41
> +#define VLD_MEM_VIFIFO_END_PTR       0x0c42
> +#define VLD_MEM_VIFIFO_BYTES_AVAIL   0x0c43
> +#define VLD_MEM_VIFIFO_CONTROL       0x0c44
> +#define VLD_MEM_VIFIFO_WP            0x0c45
> +#define VLD_MEM_VIFIFO_RP            0x0c46
> +#define VLD_MEM_VIFIFO_LEVEL         0x0c47
> +#define VLD_MEM_VIFIFO_BUF_CNTL      0x0c48
> +
> +#define VCOP_CTRL_REG                0x0e00
> +#define RV_AI_MB_COUNT               0x0e0c
> +#define IQIDCT_CONTROL               0x0e0e
> +#define DCAC_DDR_BYTE64_CTL          0x0e1d
> +
> +#define VDEC2_IMEM_DMA_CTRL          0x2340
> +#define VDEC2_IMEM_DMA_ADR           0x2341
> +#define VDEC2_IMEM_DMA_COUNT         0x2342
> +
> +#define DOS_SW_RESET0                0x3f00
> +#define DOS_GCLK_EN0                 0x3f01
> +#define DOS_GCLK_EN1                 0x3f09
> +#define DOS_GCLK_EN3                 0x3f35
> +
> +#define DOS_MEM_PD_VDEC              0x3f30
> +#define DOS_MEM_PD_VDEC2             0x3f31
> +#define DOS_MEM_PD_HCODEC            0x3f32
> +/*add from M8M2*/
> +#define DOS_MEM_PD_HEVC              0x3f33
> +
> +#define DOS_SW_RESET3                0x3f34
> +#define DOS_GCLK_EN3                 0x3f35
> +#define DOS_HEVC_INT_EN              0x3f36
> +
> +#endif
> +
> 
Thanks,
Neil

