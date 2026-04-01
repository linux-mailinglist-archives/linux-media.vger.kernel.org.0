Return-Path: <linux-media+bounces-57864-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCCNIbwEzWnhZQYAu9opvQ
	(envelope-from <linux-media+bounces-57864-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:42:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A46A6379A78
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D0553147750
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 11:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A73B3F7AB9;
	Wed,  1 Apr 2026 11:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ijS4Qz7F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D86B3F7E8D
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 11:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042762; cv=none; b=lRO6GCSfjJ0F49lMoFGNg3rZnyDhr0fFdm4SCsqa1MoZ6VaQqg19sQvKI4CDh2YIVQL0BfxTzenamBVdiAeccHjHQkTo7tKx9bZ5Ez9iiVbnSCayy6L11S9fxBuQp6Wn5XAW3Qeq9X3d6/zWF4Eh7RPGPBNSrsK2K/6zHY/Vhfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042762; c=relaxed/simple;
	bh=lRnNg7S8NW3jc/xjq7n+xqpcEEtl7OISwxFad1e1XQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=adcPmtjc9SuhxNfJN/Z+TJK67fod+0URkRlzALpvnnS73XbW+bbUI3HnNjXNs8JQswwkA2NC5tPsoVddmW3aXHLEyicz3pDUUwYum5TQ4HVWroPTDPEg32fhB8xXEJmVxy3vlnPRWImGwR9YBbo+ZxH4Gxt0DCQZ8+v+rg6ROkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ijS4Qz7F; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso56556835e9.3
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 04:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775042759; x=1775647559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zs6iZYlGOyPgZKbcUuG0785r+bYl7iwnghQ9c7DwBWw=;
        b=ijS4Qz7FxWTEG5Yavyn7GFZQ6aiceKr3TdgzgE9OQpCJYSg8d23mQqv6k7I7V8WLvR
         nVv3Sp6cMRg/TyKlXjtjklXNy0lhOaH61pAsaVUaEMvXN8as3b7Ka4k8hf4pDA0svzVy
         bdc2qeeOhXA+bCahSjocviaWaapdoWgAULLSdbTKeIdzHwJrXmmsFHvWw25uwhq7dERU
         /u+5wSzDfC4lGiLdMwrhP9qh3k5iRS2p5rLhyDdwXHGS7qX7EWS/AZdFogwck8NEXr6L
         H/TLJvxA1FLPVDdTgI7EHIOsrfk456WwkCNGO8TYbcRTLSRsdVJA2QAtBdGm8p+oy7Za
         QPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042759; x=1775647559;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zs6iZYlGOyPgZKbcUuG0785r+bYl7iwnghQ9c7DwBWw=;
        b=Bh1eDRVAqWrmQ/L0bzed2bLZZGHbVd+1p7ShYLnOX+hgh4Xbk1IcQHiH3oOXaSPDTl
         2RDcgdBzh1pITDDVgHC1Ygs0h48H+FHOcc9yDuY1Tx0N4SmCt3PA0Ch4JrigcDKEoTiY
         LOR2IzR3tuefCvorVgYPqLeyRRDbKwP3cBB/AgZVykSwJ4Brv2YLtTLovhAP7t8ojZ7T
         ZWiwpxP9b7gOTMcqkHJptJ7i2GpWYnRWwrM44ytS93MX0s3FmJmz2GkwXjJvK2PUNpjf
         70/4VK19FSuDiW+Sd+qPgI4a73s5BKx1coBnV+drynpz9ooVTzn8D5aSF/Z7IhqgjCIu
         LpUw==
X-Forwarded-Encrypted: i=1; AJvYcCUWB0WD5URFg8Me3W5Hh+Vm6M1McpjYh8jNwcOYfI73aZ4xfuFudVjGJ4KEzxLMQPotOD7NiDZrKPEZpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxes2wXEFACc6vadwZ6PNADGgH75Sm5vVHD7Q8H0nxKFQEzJjuC
	0TttqKRTNRx8Kmd9TEJxL//ra34N5yhzmFcVbEGk+WPAr01xv4xNGvKjiZrwFVXR8sU=
X-Gm-Gg: ATEYQzzKL3t0tXJeA6MwMVzxdSNi1J0YVJTEFccYSb2yvrskwftBE/PTrTRDnSiKbd0
	tuO9vTNMAcUf2t+wWE7SHB/qEK0lQoxAROTb9cczSfSqSevrQYRoZDEtN5jNjyNnjOyqj6k2ePt
	8cMq/8I8/wawji/lCs41/oRJZixNsqwFUiLRpbeGwq9ouYUcWGaL+vHq8tBgoyeSXD0Cg5YFLqg
	K98aJlfyNDkhvBx7v+0dg//ajkhgSoHWsmuEGbKRUWl+UzDqKo7PMYtSGyWgdUpaBxlOyNSXCbX
	CrDTcycCRE6fHC40e+rOrWfqfL0X8M2qtjGACMkWCMJ/7bcCoqsaSUMT/X3Hm1uqA/QJBaHMw0/
	5X4MZaKunJq99abZ28dcs9JxdC9oJeWULEFJHAAOrO7caUudi1elPLJ6YSYgP6Q1qFDw+FjpgwZ
	MtzjdCKdfSDtd/ZGVeXD3ovDJ1mt165wEdVTU=
X-Received: by 2002:a05:600c:a415:b0:485:41c4:e2e5 with SMTP id 5b1f17b1804b1-48883596671mr45009665e9.27.1775042758633;
        Wed, 01 Apr 2026 04:25:58 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.235.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e952b0bsm99777845e9.12.2026.04.01.04.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 04:25:58 -0700 (PDT)
Message-ID: <f3870c5c-df7b-4bf6-8ab6-cd210ce7b0fa@linaro.org>
Date: Wed, 1 Apr 2026 12:25:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] media: qcom: camss: Add common TPG support
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com>
 <20260317-camss_tpg-v10-1-b4cfa85c2e1b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260317-camss_tpg-v10-1-b4cfa85c2e1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-57864-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A46A6379A78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/03/2026 10:05, Wenmeng Liu wrote:
> Introduce a new common Test Pattern Generator (TPG) implementation for
> Qualcomm CAMSS. This module provides a generic interface for pattern
> generation that can be reused by multiple platforms.
> 
> Unlike CSID-integrated TPG, this TPG acts as a standalone block
> that emulates both CSIPHY and sensor behavior, enabling flexible test
> patterns without external hardware.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |  11 +-
>   drivers/media/platform/qcom/camss/camss-tpg.c | 519 ++++++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-tpg.h | 118 ++++++
>   drivers/media/platform/qcom/camss/camss.h     |   5 +
>   4 files changed, 648 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 5e349b4915130c71dbff90e73102e46dfede1520..d747aa7db3c12ad27d986e0b2b85a44870f89ad3 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -10,10 +10,13 @@ qcom-camss-objs += \
>   		camss-csid-680.o \
>   		camss-csid-gen2.o \
>   		camss-csid-gen3.o \
> +		camss-csiphy.o \
>   		camss-csiphy-2ph-1-0.o \
>   		camss-csiphy-3ph-1-0.o \
> -		camss-csiphy.o \
> +		camss-format.o \
>   		camss-ispif.o \
> +		camss-tpg.o \
> +		camss-vfe.o \
>   		camss-vfe-4-1.o \
>   		camss-vfe-4-7.o \
>   		camss-vfe-4-8.o \
> @@ -21,11 +24,9 @@ qcom-camss-objs += \
>   		camss-vfe-340.o \
>   		camss-vfe-480.o \
>   		camss-vfe-680.o \
> -		camss-vfe-gen3.o \
>   		camss-vfe-gen1.o \
> +		camss-vfe-gen3.o \
>   		camss-vfe-vbif.o \
> -		camss-vfe.o \
> -		camss-video.o \
> -		camss-format.o \
> +		camss-video.o
>   
>   obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
> diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/media/platform/qcom/camss/camss-tpg.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c5b75132add44b1392806e65a1985a1e28da3b0b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-tpg.c
> @@ -0,0 +1,519 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *
> + * Qualcomm MSM Camera Subsystem - TPG Module
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/mipi-csi2.h>
> +
> +#include "camss-tpg.h"
> +#include "camss.h"
> +
> +static const struct tpg_format_info formats_gen1[] = {
> +	{
> +		MEDIA_BUS_FMT_SBGGR8_1X8,
> +		MIPI_CSI2_DT_RAW8,
> +		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGBRG8_1X8,
> +		MIPI_CSI2_DT_RAW8,
> +		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGRBG8_1X8,
> +		MIPI_CSI2_DT_RAW8,
> +		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SRGGB8_1X8,
> +		MIPI_CSI2_DT_RAW8,
> +		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SBGGR10_1X10,
> +		MIPI_CSI2_DT_RAW10,
> +		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
> +		10,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGBRG10_1X10,
> +		MIPI_CSI2_DT_RAW10,
> +		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
> +		10,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGRBG10_1X10,
> +		MIPI_CSI2_DT_RAW10,
> +		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
> +		10,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SRGGB10_1X10,
> +		MIPI_CSI2_DT_RAW10,
> +		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
> +		10,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SBGGR12_1X12,
> +		MIPI_CSI2_DT_RAW12,
> +		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
> +		12,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGBRG12_1X12,
> +		MIPI_CSI2_DT_RAW12,
> +		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
> +		12,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGRBG12_1X12,
> +		MIPI_CSI2_DT_RAW12,
> +		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
> +		12,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SRGGB12_1X12,
> +		MIPI_CSI2_DT_RAW12,
> +		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
> +		12,
> +	},
> +	{
> +		MEDIA_BUS_FMT_Y8_1X8,
> +		MIPI_CSI2_DT_RAW8,
> +		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +	},
> +	{
> +		MEDIA_BUS_FMT_Y10_1X10,
> +		MIPI_CSI2_DT_RAW10,
> +		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
> +		10,
> +	},
> +};
> +
> +const struct tpg_formats tpg_formats_gen1 = {
> +	.nformats = ARRAY_SIZE(formats_gen1),
> +	.formats = formats_gen1
> +};
> +
> +const struct tpg_format_info *tpg_get_fmt_entry(const struct tpg_format_info *formats,
> +						unsigned int nformats,
> +						u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nformats; i++)
> +		if (code == formats[i].code)
> +			return &formats[i];
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int tpg_set_clock_rates(struct tpg_device *tpg)
> +{
> +	struct device *dev = tpg->camss->dev;
> +	int i, ret;
> +
> +	for (i = 0; i < tpg->nclocks; i++) {
> +		struct camss_clock *clock = &tpg->clock[i];
> +		long round_rate;
> +
> +		if (clock->freq) {
> +			round_rate = clk_round_rate(clock->clk, clock->freq[0]);
> +			if (round_rate < 0) {
> +				dev_err(dev, "clk round rate failed: %ld\n",
> +					round_rate);
> +				return -EINVAL;
> +			}
> +
> +			ret = clk_set_rate(clock->clk, round_rate);
> +			if (ret < 0) {
> +				dev_err(dev, "clk set rate failed: %d\n", ret);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int tpg_set_power(struct v4l2_subdev *sd, int on)
> +{
> +	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
> +	struct device *dev = tpg->camss->dev;
> +
> +	if (on) {
> +		int ret;
> +
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = tpg_set_clock_rates(tpg);
> +		if (ret < 0) {
> +			pm_runtime_put_sync(dev);
> +			return ret;
> +		}
> +
> +		ret = camss_enable_clocks(tpg->nclocks, tpg->clock, dev);
> +		if (ret < 0) {
> +			pm_runtime_put_sync(dev);
> +			return ret;
> +		}
> +
> +		tpg->res->hw_ops->reset(tpg);
> +
> +		tpg->res->hw_ops->hw_version(tpg);
> +	} else {
> +		camss_disable_clocks(tpg->nclocks, tpg->clock);
> +
> +		pm_runtime_put_sync(dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static int tpg_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
> +	int ret;
> +
> +	if (enable) {
> +		ret = v4l2_ctrl_handler_setup(&tpg->ctrls);
> +		if (ret < 0) {
> +			dev_err(tpg->camss->dev,
> +				"could not sync v4l2 controls: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return tpg->res->hw_ops->configure_stream(tpg, enable);
> +}
> +
> +static struct v4l2_mbus_framefmt *
> +__tpg_get_format(struct tpg_device *tpg,
> +		 struct v4l2_subdev_state *sd_state,
> +		 unsigned int pad,
> +		 enum v4l2_subdev_format_whence which)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
> +		return v4l2_subdev_state_get_format(sd_state,
> +						    pad);
> +
> +	return &tpg->fmt;
> +}
> +
> +static void tpg_try_format(struct tpg_device *tpg,
> +			   struct v4l2_mbus_framefmt *fmt)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < tpg->res->formats->nformats; i++)
> +		if (tpg->res->formats->formats[i].code == fmt->code)
> +			break;
> +
> +	if (i >= tpg->res->formats->nformats)
> +		fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
> +
> +	fmt->width = clamp_t(u32, fmt->width, TPG_MIN_WIDTH, TPG_MAX_WIDTH);
> +	fmt->height = clamp_t(u32, fmt->height, TPG_MIN_HEIGHT, TPG_MAX_HEIGHT);
> +	fmt->field = V4L2_FIELD_NONE;
> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +}
> +
> +static int tpg_enum_mbus_code(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
> +
> +	if (code->index >= tpg->res->formats->nformats)
> +		return -EINVAL;
> +
> +	code->code = tpg->res->formats->formats[code->index].code;
> +
> +	return 0;
> +}
> +
> +static int tpg_enum_frame_size(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *sd_state,
> +			       struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
> +	unsigned int i;
> +
> +	if (fse->index != 0)
> +		return -EINVAL;
> +
> +	for (i = 0; i < tpg->res->formats->nformats; i++)
> +		if (tpg->res->formats->formats[i].code == fse->code)
> +			break;
> +
> +	if (i >= tpg->res->formats->nformats)
> +		return -EINVAL;
> +
> +	fse->min_width = TPG_MIN_WIDTH;
> +	fse->min_height = TPG_MIN_HEIGHT;
> +	fse->max_width = TPG_MAX_WIDTH;
> +	fse->max_height = TPG_MAX_HEIGHT;
> +
> +	return 0;
> +}
> +
> +static int tpg_get_format(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
> +	struct v4l2_mbus_framefmt *format;
> +
> +	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
> +	if (!format)
> +		return -EINVAL;
> +
> +	fmt->format = *format;
> +
> +	return 0;
> +}
> +
> +static int tpg_set_format(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
> +	struct v4l2_mbus_framefmt *format;
> +
> +	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
> +	if (!format)
> +		return -EINVAL;
> +
> +	tpg_try_format(tpg, &fmt->format);
> +	*format = fmt->format;
> +
> +	return 0;
> +}
> +
> +static int tpg_init_formats(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_fh *fh)
> +{
> +	struct v4l2_subdev_format format = {
> +		.pad = MSM_TPG_PAD_SRC,
> +		.which = fh ? V4L2_SUBDEV_FORMAT_TRY :
> +			      V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.format = {
> +			.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +			.width = 1920,
> +			.height = 1080,
> +		}
> +	};
> +
> +	return tpg_set_format(sd, fh ? fh->state : NULL, &format);
> +}
> +
> +static int tpg_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct tpg_device *tpg = container_of(ctrl->handler,
> +					      struct tpg_device, ctrls);
> +	int ret = -EINVAL;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = tpg->res->hw_ops->configure_testgen_pattern(tpg, ctrl->val);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops tpg_ctrl_ops = {
> +	.s_ctrl = tpg_s_ctrl,
> +};
> +
> +int msm_tpg_subdev_init(struct camss *camss,
> +			struct tpg_device *tpg,
> +			const struct camss_subdev_resources *res, u8 id)
> +{
> +	struct platform_device *pdev;
> +	struct device *dev;
> +	int i, j;
> +
> +	dev  = camss->dev;
> +	pdev = to_platform_device(dev);
> +
> +	tpg->camss = camss;
> +	tpg->id = id;
> +	tpg->res = &res->tpg;
> +	tpg->res->hw_ops->subdev_init(tpg);
> +
> +	tpg->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
> +	if (IS_ERR(tpg->base))
> +		return PTR_ERR(tpg->base);
> +
> +	tpg->nclocks = 0;
> +	while (res->clock[tpg->nclocks])
> +		tpg->nclocks++;
> +
> +	if (!tpg->nclocks)
> +		return 0;
> +
> +	tpg->clock = devm_kcalloc(dev, tpg->nclocks,
> +				  sizeof(*tpg->clock), GFP_KERNEL);
> +	if (!tpg->clock)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < tpg->nclocks; i++) {
> +		struct camss_clock *clock = &tpg->clock[i];
> +
> +		clock->clk = devm_clk_get(dev, res->clock[i]);
> +		if (IS_ERR(clock->clk))
> +			return PTR_ERR(clock->clk);
> +
> +		clock->name = res->clock[i];
> +
> +		clock->nfreqs = 0;
> +		while (res->clock_rate[i][clock->nfreqs])
> +			clock->nfreqs++;
> +
> +		if (!clock->nfreqs) {
> +			clock->freq = NULL;
> +			continue;
> +		}
> +
> +		clock->freq = devm_kcalloc(dev, clock->nfreqs,
> +					   sizeof(*clock->freq), GFP_KERNEL);
> +		if (!clock->freq)
> +			return -ENOMEM;
> +
> +		for (j = 0; j < clock->nfreqs; j++)
> +			clock->freq[j] = res->clock_rate[i][j];
> +	}
> +
> +	return 0;
> +}
> +
> +static int tpg_link_setup(struct media_entity *entity,
> +			  const struct media_pad *local,
> +			  const struct media_pad *remote, u32 flags)
> +{
> +	if (flags & MEDIA_LNK_FL_ENABLED)
> +		if (media_pad_remote_pad_first(local))
> +			return -EBUSY;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_core_ops tpg_core_ops = {
> +	.s_power = tpg_set_power,
> +};
> +
> +static const struct v4l2_subdev_video_ops tpg_video_ops = {
> +	.s_stream = tpg_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops tpg_pad_ops = {
> +	.enum_mbus_code = tpg_enum_mbus_code,
> +	.enum_frame_size = tpg_enum_frame_size,
> +	.get_fmt = tpg_get_format,
> +	.set_fmt = tpg_set_format,
> +};
> +
> +static const struct v4l2_subdev_ops tpg_v4l2_ops = {
> +	.core = &tpg_core_ops,
> +	.video = &tpg_video_ops,
> +	.pad = &tpg_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops tpg_v4l2_internal_ops = {
> +	.open = tpg_init_formats,
> +};
> +
> +static const struct media_entity_operations tpg_media_ops = {
> +	.link_setup = tpg_link_setup,
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +int msm_tpg_register_entity(struct tpg_device *tpg,
> +			    struct v4l2_device *v4l2_dev)
> +{
> +	struct v4l2_subdev *sd = &tpg->subdev;
> +	struct device *dev = tpg->camss->dev;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &tpg_v4l2_ops);
> +	sd->internal_ops = &tpg_v4l2_internal_ops;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		     V4L2_SUBDEV_FL_HAS_EVENTS;
> +	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
> +		 "msm_tpg", tpg->id);
> +	sd->grp_id = TPG_GRP_ID;
> +	v4l2_set_subdevdata(sd, tpg);
> +
> +	ret = v4l2_ctrl_handler_init(&tpg->ctrls, 1);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
> +		return ret;
> +	}
> +
> +	tpg->testgen_mode = v4l2_ctrl_new_std_menu_items(&tpg->ctrls,
> +							 &tpg_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +							 tpg->testgen.nmodes, 0, 0,
> +							 tpg->testgen.modes);
> +	if (tpg->ctrls.error) {
> +		dev_err(dev, "Failed to init ctrl: %d\n", tpg->ctrls.error);
> +		ret = tpg->ctrls.error;
> +		goto free_ctrl;
> +	}
> +
> +	tpg->subdev.ctrl_handler = &tpg->ctrls;
> +
> +	ret = tpg_init_formats(sd, NULL);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to init format: %d\n", ret);
> +		goto free_ctrl;
> +	}
> +
> +	tpg->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	sd->entity.ops = &tpg_media_ops;
> +	ret = media_entity_pads_init(&sd->entity, 1, &tpg->pad);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to init media entity: %d\n", ret);
> +		goto free_ctrl;
> +	}
> +
> +	ret = v4l2_device_register_subdev(v4l2_dev, sd);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to register subdev: %d\n", ret);
> +		media_entity_cleanup(&sd->entity);
> +		goto free_ctrl;
> +	}
> +
> +	return 0;
> +
> +free_ctrl:
> +	v4l2_ctrl_handler_free(&tpg->ctrls);
> +
> +	return ret;
> +}
> +
> +void msm_tpg_unregister_entity(struct tpg_device *tpg)
> +{
> +	v4l2_device_unregister_subdev(&tpg->subdev);
> +	media_entity_cleanup(&tpg->subdev.entity);
> +	v4l2_ctrl_handler_free(&tpg->ctrls);
> +}
> diff --git a/drivers/media/platform/qcom/camss/camss-tpg.h b/drivers/media/platform/qcom/camss/camss-tpg.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..7fb35a97dd068f8992a02d8d81cccfda8e556daf
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-tpg.h
> @@ -0,0 +1,118 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * camss-tpg.h
> + *
> + * Qualcomm MSM Camera Subsystem - TPG Module
> + *
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#ifndef QC_MSM_CAMSS_TPG_H
> +#define QC_MSM_CAMSS_TPG_H
> +
> +#include <linux/clk.h>
> +#include <linux/bitfield.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-mediabus.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define ENCODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
> +#define ENCODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
> +#define ENCODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
> +#define ENCODE_FORMAT_UNCOMPRESSED_14_BIT	0x4
> +#define ENCODE_FORMAT_UNCOMPRESSED_16_BIT	0x5
> +#define ENCODE_FORMAT_UNCOMPRESSED_20_BIT	0x6
> +#define ENCODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
> +
> +#define MSM_TPG_PAD_SRC		0
> +#define MSM_TPG_ACTIVE_VC		0
> +#define MSM_TPG_ACTIVE_DT		0
> +
> +#define TPG_MIN_WIDTH   1
> +#define TPG_MIN_HEIGHT  1
> +#define TPG_MAX_WIDTH   8191
> +#define TPG_MAX_HEIGHT  8191
> +
> +#define TPG_GRP_ID 0
> +
> +enum tpg_testgen_mode {
> +	TPG_PAYLOAD_MODE_DISABLED = 0,
> +	TPG_PAYLOAD_MODE_INCREMENTING = 1,
> +	TPG_PAYLOAD_MODE_ALTERNATING_55_AA = 2,
> +	TPG_PAYLOAD_MODE_RANDOM = 5,
> +	TPG_PAYLOAD_MODE_USER_SPECIFIED = 6,
> +	TPG_PAYLOAD_MODE_COLOR_BARS = 9,
> +	TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 9,
> +};
> +
> +struct tpg_testgen_config {
> +	enum tpg_testgen_mode mode;
> +	const char * const*modes;
> +	u8 nmodes;
> +};
> +
> +struct tpg_format_info {
> +	u32 code;
> +	u8 data_type;
> +	u8 encode_format;
> +	u8 bpp;
> +};
> +
> +struct tpg_formats {
> +	unsigned int nformats;
> +	const struct tpg_format_info *formats;
> +};
> +
> +struct tpg_device;
> +
> +struct tpg_hw_ops {
> +	int (*configure_stream)(struct tpg_device *tpg, u8 enable);
> +	int (*configure_testgen_pattern)(struct tpg_device *tpg, s32 val);
> +	u32 (*hw_version)(struct tpg_device *tpg);
> +	int (*reset)(struct tpg_device *tpg);
> +	void (*subdev_init)(struct tpg_device *tpg);
> +};
> +
> +struct tpg_subdev_resources {
> +	u8 lane_cnt;
> +	const struct tpg_formats *formats;
> +	const struct tpg_hw_ops *hw_ops;
> +};
> +
> +struct tpg_device {
> +	struct camss *camss;
> +	u8 id;
> +	struct v4l2_subdev subdev;
> +	struct media_pad pad;
> +	void __iomem *base;
> +	struct camss_clock *clock;
> +	int nclocks;
> +	struct tpg_testgen_config testgen;
> +	struct v4l2_mbus_framefmt fmt;
> +	struct v4l2_ctrl_handler ctrls;
> +	struct v4l2_ctrl *testgen_mode;
> +	const struct tpg_subdev_resources *res;
> +	u32 hw_version;
> +};
> +
> +struct camss_subdev_resources;
> +
> +const struct tpg_format_info *tpg_get_fmt_entry(const struct tpg_format_info *formats,
> +						unsigned int nformats,
> +						u32 code);
> +
> +int msm_tpg_subdev_init(struct camss *camss,
> +			struct tpg_device *tpg,
> +			const struct camss_subdev_resources *res, u8 id);
> +
> +int msm_tpg_register_entity(struct tpg_device *tpg,
> +			    struct v4l2_device *v4l2_dev);
> +
> +void msm_tpg_unregister_entity(struct tpg_device *tpg);
> +
> +extern const struct tpg_formats tpg_formats_gen1;
> +
> +extern const struct tpg_hw_ops tpg_ops_gen1;
> +
> +#endif /* QC_MSM_CAMSS_TPG_H */
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 6d048414c919e963d6eb0cba2a287015cb25416f..9ffc777d4bd7227166509bd836f73be15dae8cd0 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -21,6 +21,7 @@
>   #include "camss-csid.h"
>   #include "camss-csiphy.h"
>   #include "camss-ispif.h"
> +#include "camss-tpg.h"
>   #include "camss-vfe.h"
>   #include "camss-format.h"
>   
> @@ -52,6 +53,7 @@ struct camss_subdev_resources {
>   	char *interrupt[CAMSS_RES_MAX];
>   	union {
>   		struct csiphy_subdev_resources csiphy;
> +		struct tpg_subdev_resources tpg;
>   		struct csid_subdev_resources csid;
>   		struct vfe_subdev_resources vfe;
>   	};
> @@ -105,6 +107,7 @@ struct camss_resources {
>   	enum camss_version version;
>   	const char *pd_name;
>   	const struct camss_subdev_resources *csiphy_res;
> +	const struct camss_subdev_resources *tpg_res;
>   	const struct camss_subdev_resources *csid_res;
>   	const struct camss_subdev_resources *ispif_res;
>   	const struct camss_subdev_resources *vfe_res;
> @@ -112,6 +115,7 @@ struct camss_resources {
>   	const struct resources_icc *icc_res;
>   	const unsigned int icc_path_num;
>   	const unsigned int csiphy_num;
> +	const unsigned int tpg_num;
>   	const unsigned int csid_num;
>   	const unsigned int vfe_num;
>   };
> @@ -122,6 +126,7 @@ struct camss {
>   	struct media_device media_dev;
>   	struct device *dev;
>   	struct csiphy_device *csiphy;
> +	struct tpg_device *tpg;
>   	struct csid_device *csid;
>   	struct ispif_device *ispif;
>   	struct vfe_device *vfe;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Dell Inpsiron14p

