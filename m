Return-Path: <linux-media+bounces-67489-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id km4WCcPiVGrOgQAAu9opvQ
	(envelope-from <linux-media+bounces-67489-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 15:06:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5055774B443
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 15:06:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=iDvbb1Ze;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67489-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67489-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A617300A65D
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 13:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3AB416D01;
	Mon, 13 Jul 2026 13:05:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90544414DC5
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 13:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947937; cv=none; b=flDpDe/ooK/y9+TUwlGg4dPyPn2BhprB77beUSZH5v+3dY+IRqMM1gzIxMW+Xuv0xOXh7JIQBqTAbB8Iv+nEx1c/MbAoMajvVY7oKiAEtKnHScqcngDugUoERlXm3/A6JCN1q3UqpJuJO6MrPzuELE5yGMers2qT0DIxjqyJAec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947937; c=relaxed/simple;
	bh=LOLjznPspC1I6dtqAHg1MsPIrAzR512HbwBbzv+G9xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwzrXnUWXdRYVnPCcXCdednFOififQerFlePQlXz78wjjXFkN7YWVrgb/MoyA7apkFY0xGMRNueAzdnFCT0vR1UUOAFYRxrXmqTl4D4zNcfEtwG20oz65QXWNgpnbDb1b0lqwd9JmBQ3NQ9UKrJTHj4mnEzFQqRyLZJO5oH8zF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iDvbb1Ze; arc=none smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69c19a37eeaso6163202a12.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783947932; x=1784552732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1I9AnCFa8eH6fsCvMzP+tR/LftoRmjX+2dMhPeaMT8=;
        b=iDvbb1Ze+M+KacQPFmdPkWfnmNs+Jekyf9FohTnP5RTyM2DzFiXh19oXUpB8a5e/wl
         tkVZbMpa3T2fQRa17U8Wporvang7SevgbqMpCesGO1dn4+pOhlHqszLtPTtM04opCZWR
         QzOcAA/rnw+xdSjQ1+dNXI8M+49PoKTDFDaCgCzmPrpm5SUNdNrYmfGAa6fKDp5HMigY
         zO3J5laMfgqXQZZdtfbnSZmN9EGvwa3Hu0sz0KSijgRj6CFMj1OLuPDNV0ssjQUhROtK
         X0hk2m2s0SS1aTDx5+EH4x4zeSSRUIVk4sNe9Jx8zAouLApo9yjUkgIaQi6Sq3cLGZ9i
         I68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947932; x=1784552732;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1I9AnCFa8eH6fsCvMzP+tR/LftoRmjX+2dMhPeaMT8=;
        b=qdYnGIy/WxZhkoGJOmSDEYP0G1n0O7bmCJSH8Oh+C9DeFrDY34TDmjWKhFc3hXFR+b
         Bcb1RZvGfaAm2Cqha71ozkVWSezsQxy4+ss5FD7daGvqPQPyer60LwFQyd4wh6gAnNkx
         K5szLT7PyX6Mca87Q9qOwHCnf+Ms3j5YUU1MCEVFRmlyii2Py3THnD8KlN5sJXWTXQyw
         I3i6UvHUq7ixuuJ57frHH5zCMpnKTahu5hetuK4Do1OpddIEH0+liy9djgJuy38u6EB3
         aRJRmRnZFTMh7w9MamWezzeU6ceqXDffQphiUj87H69wj7EcE8ef28KRQ/H9nUB7YReb
         GhKA==
X-Forwarded-Encrypted: i=1; AHgh+Roit+bShaXoWkiZC4EeiC5sVTWpvgiGH8w51bIM9pxZQ/jRlwfUBhNbQTI2VvwtJSTR7/eLio3906TbSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGsDeDOv2pwvU0lOz36tD7bZ23bFY8+vKd8dW+3oED3Owb756a
	9OL7oZRXPQOhwfclYqtgu7vkwK+O5bySQrzqfvxkBaUpMKdZ3PwTUsOXDjv0ZsxusEw=
X-Gm-Gg: AfdE7ckAUJBhfIil0k0FTIpDMPLiE1+sMegO+15SVx0Edf4hgs1FtrpFqQWzaDtQH5q
	zxT+0qwFCZ/Ihrvq9mXx59dCdw7S4Iwwc1W4ZP/Az/rVNqzMvozr2ixEBzSdmPwkeyKOqTw582K
	cQkyv5kQl5fywjOegYK70hZwrB68djHOIsQVxE1vthhpnVQcJ4Ll6aBkwKA7SYAu0jnFqzjsTt4
	r1d1bjS0CXB6DKqU5k67S4f3Qf2qdORHKJqo2L6gmDEmMys1QXV6b9VYvngp4v5FSyK3J29FXyo
	7/cj32gdgH0/61HORQvEB4b1093RYVnv4pdqA/y55kjC8dsRYVl/IELABfGXVbfueCKy0Mqx6OL
	DXAVe+WZfZ0uR6cfUAovE1HnSj7SHEbgwTucEQHEqDsTJnHXSTMWLAB52stSm9Ry8owSmeloL19
	cr4dtyN2g4i2vsoQlHS44K0fo=
X-Received: by 2002:a05:6402:2b8c:b0:698:a9e0:4386 with SMTP id 4fb4d7f45d1cf-69c5f12dc29mr3676164a12.29.1783947931935;
        Mon, 13 Jul 2026 06:05:31 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.2.191])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm14880852a12.10.2026.07.13.06.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 06:05:30 -0700 (PDT)
Message-ID: <da70ed94-fd76-4105-8071-1ed8d8e41d84@linaro.org>
Date: Mon, 13 Jul 2026 14:05:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org, Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-6-51207a0319d8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260710-camss-isp-ope-v4-6-51207a0319d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67489-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:johannes.goede@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5055774B443

On 10/07/2026 10:04, Loic Poulain wrote:
> Add an image processing driver for the Qualcomm Offline Processing Engine
> (OPE). OPE is a memory-to-memory ISP block that converts raw Bayer
> frames to YUV, performing white balance, demosaic, chroma enhancement,
> color correction and downscaling.
> 
> The hardware architecture consists of Fetch Engines and Write Engines,
> connected through intermediate pipeline modules for pix processing.
> 
> The driver exposes three video nodes per pipeline instance:
>    - ope_input: Bayer RAW input (V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>    - ope_disp_output: YUV output     (V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>    - ope_params: ISP parameters (V4L2_BUF_TYPE_META_OUTPUT)
> 
> Hardware features:
>    - Stripe-based processing (up to 336 pixels wide per stripe)
>    - White balance (CLC_WB)
>    - Demosaic / Bayer-to-RGB (CLC_DEMO)
>    - RGB-to-YUV conversion (CLC_CHROMA_ENHAN)
>    - Color correction matrix (CLC_CC)
>    - MN downscaler for chroma and luma planes
> 
> Default configuration values are based on public standards such as BT.601.
> 
> Processing Model:
> OPE processes frames in stripes of up to 336 pixels. Therefore, frames must
> be split into stripes for processing. Each stripe is configured after the
> previous one has been acquired (double buffered registers). To minimize
> inter-stripe latency, stripe configurations are generated ahead of time.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Co-developed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Kconfig     |   18 +
>   drivers/media/platform/qcom/camss/Makefile    |    4 +
>   drivers/media/platform/qcom/camss/camss-ope.c | 3245 +++++++++++++++++++++++++

I think this should be in a sub-directory.

>   3 files changed, 3267 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
> index 4eda48cb1adf049a7fb6cb59b9da3c0870fe57f4..895fc57a679655fcb6f308be1565dc6b77bbbd67 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,21 @@ config VIDEO_QCOM_CAMSS
>   	select VIDEO_V4L2_SUBDEV_API
>   	select VIDEOBUF2_DMA_SG
>   	select V4L2_FWNODE
> +
> +config VIDEO_QCOM_CAMSS_OPE
> +	tristate "Qualcomm Offline Processing Engine (OPE) driver"
> +	depends on VIDEO_QCOM_CAMSS
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on VIDEO_DEV
> +	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> +	select V4L2_ISP
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_VMALLOC
> +	help
> +	  Enable support for the Qualcomm Offline Processing Engine (OPE).
> +	  OPE is a memory-to-memory ISP block that converts raw Bayer frames
> +	  to YUV, performing white balance, demosaic, chroma enhancement and
> +	  downscaling. Found on QCM2290 and related SoCs.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called qcom-camss-ope.
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 5678621efb6780b67a043ec8a2e914cce02d9b98..422eebc0a86301de3f39c743fbc06c437b17ac9a 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -31,3 +31,7 @@ qcom-camss-objs += \
>   		camss-params.o \
>   
>   obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
> +
> +qcom-camss-ope-objs := camss-ope.o
> +
> +obj-$(CONFIG_VIDEO_QCOM_CAMSS_OPE) += qcom-camss-ope.o
> diff --git a/drivers/media/platform/qcom/camss/camss-ope.c b/drivers/media/platform/qcom/camss/camss-ope.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..2c0d68cf1a637c998ebe4d3afb1fa6dbdb68f029
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-ope.c
> @@ -0,0 +1,3245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-ope.c
> + *
> + * Qualcomm MSM Camera Subsystem - Offline Processing Engine
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/*
> + * This driver provides driver implementation for the Qualcomm Offline
> + * Processing Engine (OPE). OPE is a memory-to-memory hardware block
> + * designed for image processing on a source frame. Typically, the input
> + * frame originates from the SoC CSI capture path, though not limited to.
> + *
> + * The hardware architecture consists of Fetch Engines and Write Engines,
> + * connected through intermediate pipeline modules:
> + *   [FETCH ENGINES] => [Pipeline Modules] => [WRITE ENGINES]
> + *
> + * Current Configuration:
> + *     Fetch Engine: One fetch engine is used for Bayer frame input.
> + *     Write Engines: Two display write engines for Y and UV planes output.
> + *
> + * Only a subset of the pipeline modules are enabled:
> + *   CLC_WB: White balance for channel gain configuration
> + *   CLC_DEMO: Demosaic for Bayer to RGB conversion
> + *   CLC_CC: Color Correct, coefficient based RGB correction
> + *   CLC_CHROMA_ENHAN: for RGB to YUV conversion
> + *   CLC_DOWNSCALE*: Downscaling for UV (YUV444 -> YUV422/YUV420) and YUV planes
> + *
> + * Default configuration values are based on public standards such as BT.601.
> + *
> + * Processing Model:
> + * OPE processes frames in stripes of up to 336 pixels. Therefore, frames must
> + * be split into stripes for processing. Each stripe is configured after the
> + * previous one has been acquired (double buffered registers). To minimize
> + * inter-stripe latency, the stripe configurations are generated ahead of time.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interconnect.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/units.h>
> +
> +#include <media/v4l2-device.h>
> +#include <media/media-device.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-rect.h>
> +
> +#include "camss-pipeline.h"
> +
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#include <uapi/linux/camss-config.h>
> +
> +#include "camss-params.h"
> +
> +#define OPE_NAME	"qcom-camss-ope"
> +
> +/* Format descriptor */
> +struct ope_fmt {
> +	u32		fourcc;
> +	unsigned int	depth;
> +	unsigned int	align;
> +	unsigned int	num_planes;
> +	u32		mbus_code;
> +	unsigned int	c_hsub;
> +	unsigned int	c_vsub;
> +};
> +
> +/* Per-queue format state */
> +struct ope_fmt_state {
> +	const struct ope_fmt	*fmt;
> +	unsigned int		width;
> +	unsigned int		height;
> +	struct v4l2_rect	crop;
> +	unsigned int		bytesperline;
> +	unsigned int		sizeimage;
> +	enum v4l2_colorspace	colorspace;
> +	enum v4l2_xfer_func	xfer_func;
> +	enum v4l2_ycbcr_encoding	ycbcr_enc;
> +	enum v4l2_quantization	quantization;
> +	unsigned int		sequence;
> +	struct v4l2_fract	timeperframe;
> +};
> +
> +/* -------- Register layout -------- */
> +
> +#define OPE_TOP_HW_VERSION					0x000
> +#define		OPE_TOP_HW_VERSION_STEP		GENMASK(15, 0)
> +#define		OPE_TOP_HW_VERSION_REV		GENMASK(27, 16)
> +#define		OPE_TOP_HW_VERSION_GEN		GENMASK(31, 28)
> +#define OPE_TOP_RESET_CMD					0x004
> +#define		OPE_TOP_RESET_CMD_HW		BIT(0)
> +#define		OPE_TOP_RESET_CMD_SW		BIT(1)
> +#define OPE_TOP_IRQ_STATUS					0x014
> +#define OPE_TOP_IRQ_MASK					0x018
> +#define		OPE_TOP_IRQ_STATUS_RST_DONE	BIT(0)
> +#define		OPE_TOP_IRQ_STATUS_WE		BIT(1)
> +#define		OPE_TOP_IRQ_STATUS_FE		BIT(2)
> +#define		OPE_TOP_IRQ_STATUS_VIOL		BIT(3)
> +#define		OPE_TOP_IRQ_STATUS_IDLE		BIT(4)
> +#define OPE_TOP_IRQ_CLEAR					0x01c
> +#define OPE_TOP_IRQ_CMD						0x024
> +#define		OPE_TOP_IRQ_CMD_CLEAR		BIT(0)
> +#define OPE_TOP_VIOLATION_STATUS				0x028
> +
> +/* Fetch engine */
> +#define OPE_BUS_RD_INPUT_IF_IRQ_MASK				0x00c
> +#define OPE_BUS_RD_INPUT_IF_IRQ_CLEAR				0x010
> +#define OPE_BUS_RD_INPUT_IF_IRQ_CMD				0x014
> +#define		OPE_BUS_RD_INPUT_IF_IRQ_CMD_CLEAR	BIT(0)
> +#define OPE_BUS_RD_INPUT_IF_IRQ_STATUS				0x018
> +#define OPE_BUS_RD_INPUT_IF_CMD					0x01c
> +#define		OPE_BUS_RD_INPUT_IF_CMD_GO_CMD		BIT(0)
> +#define OPE_BUS_RD_CLIENT_0_CORE_CFG				0x050
> +#define		OPE_BUS_RD_CLIENT_0_CORE_CFG_EN	BIT(0)
> +#define OPE_BUS_RD_CLIENT_0_CCIF_META_DATA			0x054
> +#define		OPE_BUS_RD_CLIENT_0_CCIF_MD_PIX_PATTERN GENMASK(7, 2)
> +#define OPE_BUS_RD_CLIENT_0_ADDR_IMAGE				0x058
> +#define OPE_BUS_RD_CLIENT_0_RD_BUFFER_SIZE			0x05c
> +#define OPE_BUS_RD_CLIENT_0_RD_STRIDE				0x060
> +#define OPE_BUS_RD_CLIENT_0_UNPACK_CFG_0			0x064
> +
> +/* Write engines */
> +#define OPE_BUS_WR_INPUT_IF_IRQ_MASK_0				0x018
> +#define OPE_BUS_WR_INPUT_IF_IRQ_MASK_1				0x01c
> +#define OPE_BUS_WR_INPUT_IF_IRQ_CLEAR_0				0x020
> +#define OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0			0x028
> +#define		OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_RUP_DONE	BIT(0)
> +#define		OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_BUF_DONE	BIT(8)
> +#define		OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_CONS_VIOL	BIT(28)
> +#define		OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_VIOL		BIT(30)
> +#define		OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_IMG_SZ_VIOL	BIT(31)
> +#define OPE_BUS_WR_INPUT_IF_IRQ_CMD				0x030
> +#define		OPE_BUS_WR_INPUT_IF_IRQ_CMD_CLEAR	BIT(0)
> +#define OPE_BUS_WR_VIOLATION_STATUS				0x064
> +#define OPE_BUS_WR_IMAGE_SIZE_VIOLATION_STATUS			0x070
> +#define OPE_BUS_WR_CLIENT_CFG(c)				(0x200 + (c) * 0x100)
> +#define		OPE_BUS_WR_CLIENT_CFG_EN		BIT(0)
> +#define		OPE_BUS_WR_CLIENT_CFG_AUTORECOVER	BIT(4)
> +#define OPE_BUS_WR_CLIENT_ADDR_IMAGE(c)				(0x204 + (c) * 0x100)
> +#define OPE_BUS_WR_CLIENT_IMAGE_CFG_0(c)			(0x20c + (c) * 0x100)
> +#define OPE_BUS_WR_CLIENT_IMAGE_CFG_1(c)			(0x210 + (c) * 0x100)
> +#define OPE_BUS_WR_CLIENT_IMAGE_CFG_2(c)			(0x214 + (c) * 0x100)
> +#define OPE_BUS_WR_CLIENT_PACKER_CFG(c)				(0x218 + (c) * 0x100)
> +#define OPE_BUS_WR_CLIENT_MAX	4
> +
> +/* Pipeline modules */
> +#define OPE_PP_CLC_WB_GAIN_MODULE_CFG				(0x200 + 0x60)

Can you just map the individual blocks so that we can interrogate 
HW_VERSION HW_STATUS and friends ? Those regs usually come first. I can 
see useful debugfs and/or dev_dbg() usages of those data.
> +#define		OPE_PP_CLC_WB_GAIN_MODULE_CFG_EN	BIT(0)
> +#define OPE_PP_CLC_WB_GAIN_WB_CFG(ch)				(0x200 + 0x68 + 4 * (ch))
> +#define		OPE_PP_CLC_WB_GAIN_WB_CFG_GAIN		GENMASK(14, 0)
> +#define OPE_PP_CLC_WB_GAIN_WB_SUB_CFG(ch)			(0x200 + 0x74 + 4 * (ch))
> +#define		OPE_PP_CLC_WB_GAIN_WB_SUB_CFG_VAL	GENMASK(31, 20)
> +#define OPE_PP_CLC_WB_GAIN_WB_ADD_CFG(ch)			(0x200 + 0x80 + 4 * (ch))
> +#define		OPE_PP_CLC_WB_GAIN_WB_ADD_CFG_VAL	GENMASK(31, 20)
> +
> +#define OPE_PP_CLC_CC_BASE					0x400

Is this actually the correct register base for CCM ?

I think you should check again.

Same comment for each of these blocks HW_VERSION should be the first 
register.

---
bod

