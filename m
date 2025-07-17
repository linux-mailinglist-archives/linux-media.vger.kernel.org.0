Return-Path: <linux-media+bounces-38010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3722B08D39
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 374B34A2CA1
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F362C17A0;
	Thu, 17 Jul 2025 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DPyNOge+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F315263F28
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756170; cv=none; b=N+LEiS1WSYeo0IF/c8UZilGdS7B74YYlmD91NJPXExXnf+OQSdqD+rX780oRyBlh6ymH93yDvDPWx4NqIZuDDM76NYdwB12xsdX6mr1m3RPtZn8S2+FzyTEeSdAwe3C1u8C7ms9DWkLixyfNV9Kh9HL6HNXDcb/mSb9I1x5xdgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756170; c=relaxed/simple;
	bh=OZYUXAYzaRzvYvMUS71g1+eKsdGQGkgm3EOyIA1/yzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=in3vyn+IW5Oo2ThT6O0ICLbPiGMTLhp99c/b84SDBWQ6QnLuO1mEhYKuje39AldheZhAuunD4ZcbMuZvZodsYajPTfB+NtusyQvB/+Q/Ql8Nqy1EsrrEUyjjfuKxIHRN7uqtbmMBzT02GCFE2Ex8aF65cdWWehwAxqerjC2WeRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DPyNOge+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a54700a463so524310f8f.1
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752756166; x=1753360966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfoA6CywfL7tG4Hi/bgag6f/cRVej422YcCYw2Pdqgk=;
        b=DPyNOge+nuUqSKGxPbmX1S8boemP4ojaSCQLyRWGr8mqAVpuJ+RWPzYiz3mmWXBNir
         E64ZnpEOzLSga0SDr+vY+wmgvtzRiNyoOYerHVC3E+MXj9rLP6f5US/NB0Z2P58k8+T1
         1KWtgG9hsbPW+lU1yNay8CR/mxSLd+h3iGcPvVKiihuHECfxl0vT49t7pVHyguImZ78G
         j1dnL1kytvOWBFdtM1NYCU9fY2ybAsIaOLrGOa+rYilTHXHLkNKRgxSSHfsBZoOc3EI3
         q03r9kcGCeFmeKGtYN9ZRjhGQF1nvemMLWPrW7Q/jlXITnaCZ8DScW9HkS79ZkSLP6OX
         cfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756166; x=1753360966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfoA6CywfL7tG4Hi/bgag6f/cRVej422YcCYw2Pdqgk=;
        b=oHLf7j5qR3mmXd17/DxsQBx2+5UcGfEuQ019/u0FfDB02QrNcooU6X47b2ozWtDBHe
         1ROcFsWlXoo3p3HJP2yUz9ZWUxUEInwIyY15enlPeEMBYaEGSyPwKpb4pTw8AJBTnd6G
         6E8wXdq2flMQBIvHToyln3gMbSaHjVW2u8l7TSkTG9wQaIm2xp+FxslMjTcbDjEKJzxL
         NNppxmqXRAgmxJYyg0WKgQc6OOkyUL8WWUkcGaVWebCM4D3naFK4LKttUixbshi3wyzL
         EdaPL+SxhLWTKWffjNYPt+oAvTLanl3Nfq4c2b4Vm/lK1FPjcH1tWHgu0DBBQ1ZxdPXv
         +OKg==
X-Forwarded-Encrypted: i=1; AJvYcCU0MYnb/KpTC3Ih7It/OucZB8lQVT99Kjq/kc5M5SUUJvHSoxoVZk6mGdixGzbgtiYDfCjooZ/pox2gnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPyi7PebuypVg2PX5LG6XG96ERWVJbCA/74nQ1Dgq4ezMY7rd8
	4ed4qnL8fVijomFarQCb/lQ5cpuEG6MF1WlLb33jaE90MEN4gr87TmMjbHjyiNhGhl0=
X-Gm-Gg: ASbGncs1yxOZjeg9ulQrxPNbdVJdtiQ9/Wzwqp5xXDxAO04GDlbD8M2iT4tgB0PzPar
	Mz71Sn5W/GqvVc5ZztMzwJmvkYFPsdLtBQhABAr71JDSS0KCR6AHzLlsKus02SgQWbBUP2hSVgU
	ok/B+vMfG23OhbI5n6TtIgGKUs59LUH6YRQitUNe2IAPJMoxtjZlSnenf5zM+xLh0MYyI/bhppI
	51rI6MBC9AGmymyg2OAEMu944odMoH/slqVVY1TiCyn/8E0KIt3GvAgg+O+f2nk9J90s1yXqfoi
	SwpcYIwxAVmFVm5MnVklUf2sOVK7s7P+eXIqGq4+GUd6LWEbqe3vp0FLJr8b7nuYYfNuzk+3145
	n80txWaoRjuHSSVakGi12UGx6KvbsvUF8Jd41V2O3xB4B9KwdI6fF97bRsPlys2ob
X-Google-Smtp-Source: AGHT+IFAl89+Tn6OBsv93yBwtKsVuwUbefA6Wy0uaJhgwTaR9IGAJphqoInS9YufOHvjO9qfvAbX5Q==
X-Received: by 2002:a05:6000:4006:b0:3b6:d0d:79c1 with SMTP id ffacd0b85a97d-3b6139d3907mr2789762f8f.10.1752756165663;
        Thu, 17 Jul 2025 05:42:45 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e332sm20788187f8f.79.2025.07.17.05.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 05:42:45 -0700 (PDT)
Message-ID: <6d43915b-756f-4ab3-accf-e0a5422db479@linaro.org>
Date: Thu, 17 Jul 2025 13:42:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Add support for TPG common
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
 <20250717-lemans_tpg-v2-1-a2538659349c@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250717-lemans_tpg-v2-1-a2538659349c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2025 04:20, Wenmeng Liu wrote:
> Add support for TPG common, unlike CSID TPG, this TPG can
> be seen as a combination of CSIPHY and sensor.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   drivers/media/platform/qcom/camss/camss-tpg.c | 737 ++++++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-tpg.h | 130 +++++
>   drivers/media/platform/qcom/camss/camss.h     |   5 +
>   4 files changed, 873 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 76845a456c459538b8e9f782dd58e3b59aff3ef1..e4cf3033b8798cf0ffeff85409ae4ed3559879c1 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -24,5 +24,6 @@ qcom-camss-objs += \
>   		camss-vfe.o \
>   		camss-video.o \
>   		camss-format.o \
> +		camss-tpg.o \
>   
>   obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
> diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/media/platform/qcom/camss/camss-tpg.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..3ef5b6dcdf2f7e8bbe442667d0fdf64ee30e2923
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-tpg.c
> @@ -0,0 +1,737 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-tpg.c
> + *
> + * Qualcomm MSM Camera Subsystem - TPG Module
> + *
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "camss-tpg.h"
> +#include "camss.h"
> +
> +const char * const testgen_payload_modes[] = {
> +	"Disabled",
> +	"Incrementing",
> +	"Alternating 0x55/0xAA",
> +	NULL,
> +	NULL,
> +	"Pseudo-random Data",
> +	"User Specified",
> +	NULL,
> +	NULL,
> +	"Color bars",
> +	NULL
> +};

This looks a bit strange.

What at the NULLs about ?

> +
> +static const struct tpg_format_info formats_gen1[] = {
> +	{
> +		MEDIA_BUS_FMT_SBGGR8_1X8,
> +		DATA_TYPE_RAW_8BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGBRG8_1X8,
> +		DATA_TYPE_RAW_8BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGRBG8_1X8,
> +		DATA_TYPE_RAW_8BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SRGGB8_1X8,
> +		DATA_TYPE_RAW_8BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SBGGR10_1X10,
> +		DATA_TYPE_RAW_10BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGBRG10_1X10,
> +		DATA_TYPE_RAW_10BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGRBG10_1X10,
> +		DATA_TYPE_RAW_10BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SRGGB10_1X10,
> +		DATA_TYPE_RAW_10BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SBGGR12_1X12,
> +		DATA_TYPE_RAW_12BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGBRG12_1X12,
> +		DATA_TYPE_RAW_12BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGRBG12_1X12,
> +		DATA_TYPE_RAW_12BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SRGGB12_1X12,
> +		DATA_TYPE_RAW_12BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_Y8_1X8,
> +		DATA_TYPE_RAW_8BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
> +	},
> +	{
> +		MEDIA_BUS_FMT_Y10_1X10,
> +		DATA_TYPE_RAW_10BIT,
> +		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
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
> +	WARN(1, "Unknown format\n");
> +
> +	return &formats[0];
> +}
> +
> +/*
> + * tpg_set_clock_rates - Calculate and set clock rates on tpg module
> + * @tpg: tpg device
> + */
> +static int tpg_set_clock_rates(struct tpg_device *tpg)
> +{
> +	struct device *dev = tpg->camss->dev;
> +	int i, j;
> +	int ret;
> +
> +	for (i = 0; i < tpg->nclocks; i++) {
> +		struct camss_clock *clock = &tpg->clock[i];
> +		u64 min_rate = 0;
> +		long round_rate;
> +
> +		camss_add_clock_margin(&min_rate);

Which clock is it we are setting here i.e. do we really need to care 
about the rate at all ?

> +
> +		for (j = 0; j < clock->nfreqs; j++)
> +			if (min_rate < clock->freq[j])
> +				break;

multi-line should be bracketed

for () {
     if(x)
         break;
}

> +
> +		if (j == clock->nfreqs) {
> +			dev_err(dev,
> +				"clock is too high for TPG\n");
> +			return -EINVAL;
> +		}
> +
> +		/* if clock is not available */
> +		/* set highest possible tpg clock rate */
> +		if (min_rate == 0)
> +			j = clock->nfreqs - 1;

This makes sense for a CSIPHY where the pixel rate changes but, does it 
make sense for the TPG ?

> +
> +		round_rate = clk_round_rate(clock->clk, clock->freq[j]);
> +		if (round_rate < 0) {
> +			dev_err(dev, "clk round rate failed: %ld\n",
> +				round_rate);
> +			return -EINVAL;
> +		}
> +
> +		tpg->timer_clk_rate = round_rate;
> +
> +		ret = clk_set_rate(clock->clk, tpg->timer_clk_rate);
> +		if (ret < 0) {
> +			dev_err(dev, "clk set rate failed: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * tpg_set_power - Power on/off tpg module
> + * @sd: tpg V4L2 subdevice
> + * @on: Requested power state
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
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
> +		enable_irq(tpg->irq);

Do we need an IRQ for the TPG ?

What's the use-case for it ? I'm not necessarily asking to drop this 
just to understand if it is really useful.

> +
> +		tpg->res->hw_ops->reset(tpg);
> +
> +		tpg->res->hw_ops->hw_version(tpg);
> +	} else {
> +		disable_irq(tpg->irq);
> +
> +		camss_disable_clocks(tpg->nclocks, tpg->clock);
> +
> +		pm_runtime_put_sync(dev);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * tpg_set_stream - Enable/disable streaming on tpg module
> + * @sd: tpg V4L2 subdevice
> + * @enable: Requested streaming state
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int tpg_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
> +	int ret = 0;
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
> +	tpg->res->hw_ops->configure_stream(tpg, enable);
> +
> +	return 0;
> +}
> +
> +/*
> + * __tpg_get_format - Get pointer to format structure
> + * @tpg: tpg device
> + * @cfg: V4L2 subdev pad configuration
> + * @pad: pad from which format is requested
> + * @which: TRY or ACTIVE format
> + *
> + * Return pointer to TRY or ACTIVE format structure
> + */
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
> +	return &tpg->fmt[pad];
> +}
> +
> +/*
> + * tpg_try_format - Handle try format by pad subdev method
> + * @tpg: tpg device
> + * @cfg: V4L2 subdev pad configuration
> + * @pad: pad on which format is requested
> + * @fmt: pointer to v4l2 format structure
> + * @which: wanted subdev format
> + */
> +static void tpg_try_format(struct tpg_device *tpg,
> +			   struct v4l2_subdev_state *sd_state,
> +			   unsigned int pad,
> +			   struct v4l2_mbus_framefmt *fmt,
> +			   enum v4l2_subdev_format_whence which)
> +{
> +	unsigned int i;
> +
> +	switch (pad) {
> +	case MSM_TPG_PAD_SINK:
> +		/* Test generator is enabled, set format on source */
> +		/* pad to allow test generator usage */
> +
> +		for (i = 0; i < tpg->res->formats->nformats; i++)
> +			if (tpg->res->formats->formats[i].code == fmt->code)
> +				break;
> +
> +		/* If not found, use SBGGR8 as default */
> +		if (i >= tpg->res->formats->nformats)
> +			fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;

If not found why set a default at all ?

> +
> +		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
> +		fmt->height = clamp_t(u32, fmt->height, 1, 8191);
> +
> +		fmt->field = V4L2_FIELD_NONE;
> +		fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +
> +		break;
> +	case MSM_TPG_PAD_SRC:
> +		/* Set and return a format same as sink pad */
> +
> +		*fmt = *__tpg_get_format(tpg, sd_state,
> +					 MSM_TPG_PAD_SINK,
> +					 which);
> +
> +		break;
> +	}
> +}
> +
> +/*
> + * tpg_enum_mbus_code - Handle format enumeration
> + * @sd: tpg V4L2 subdevice
> + * @cfg: V4L2 subdev pad configuration
> + * @code: pointer to v4l2_subdev_mbus_code_enum structure
> + * return -EINVAL or zero on success
> + */
> +static int tpg_enum_mbus_code(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
> +	struct v4l2_mbus_framefmt *format;
> +
> +	if (code->pad == MSM_TPG_PAD_SINK) {
> +		if (code->index >= tpg->res->formats->nformats)
> +			return -EINVAL;
> +
> +		code->code = tpg->res->formats->formats[code->index].code;
> +	} else {
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		format = __tpg_get_format(tpg, sd_state,
> +					  MSM_TPG_PAD_SINK,
> +					  code->which);
> +
> +		code->code = format->code;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * tpg_enum_frame_size - Handle frame size enumeration
> + * @sd: tpg V4L2 subdevice
> + * @cfg: V4L2 subdev pad configuration
> + * @fse: pointer to v4l2_subdev_frame_size_enum structure
> + * return -EINVAL or zero on success
> + */
> +static int tpg_enum_frame_size(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *sd_state,
> +			       struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
> +	struct v4l2_mbus_framefmt format;
> +
> +	if (fse->index != 0)
> +		return -EINVAL;

What is this test about and how does the index != 0 come to pass ?

> +
> +	format.code = fse->code;
> +	format.width = 1;
> +	format.height = 1;
> +	tpg_try_format(tpg, sd_state, fse->pad, &format, fse->which);
> +	fse->min_width = format.width;
> +	fse->min_height = format.height;
> +
> +	if (format.code != fse->code)
> +		return -EINVAL;

Is EINVAL the right return value here ?

> +
> +	format.code = fse->code;
> +	format.width = -1;
> +	format.height = -1;
> +	tpg_try_format(tpg, sd_state, fse->pad, &format, fse->which);
> +	fse->max_width = format.width;
> +	fse->max_height = format.height;
> +
> +	return 0;
> +}
> +
> +/*
> + * tpg_get_format - Handle get format by pads subdev method
> + * @sd: tpg V4L2 subdevice
> + * @cfg: V4L2 subdev pad configuration
> + * @fmt: pointer to v4l2 subdev format structure
> + *
> + * Return -EINVAL or zero on success
> + */
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
> +/*
> + * tpg_set_format - Handle set format by pads subdev method
> + * @sd: tpg V4L2 subdevice
> + * @cfg: V4L2 subdev pad configuration
> + * @fmt: pointer to v4l2 subdev format structure
> + *
> + * Return -EINVAL or zero on success
> + */
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
> +	tpg_try_format(tpg, sd_state, fmt->pad, &fmt->format,
> +		       fmt->which);
> +	*format = fmt->format;
> +
> +	if (fmt->pad == MSM_TPG_PAD_SINK) {
> +		format = __tpg_get_format(tpg, sd_state,
> +					  MSM_TPG_PAD_SRC,
> +					  fmt->which);
> +
> +		*format = fmt->format;
> +		tpg_try_format(tpg, sd_state, MSM_TPG_PAD_SRC,
> +			       format,
> +			       fmt->which);
> +	}
> +	return 0;
> +}
> +
> +/*
> + * tpg_init_formats - Initialize formats on all pads
> + * @sd: tpg V4L2 subdevice
> + * @fh: V4L2 subdev file handle
> + *
> + * Initialize all pad formats with default values.
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int tpg_init_formats(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_fh *fh)
> +{
> +	struct v4l2_subdev_format format = {
> +		.pad = MSM_TPG_PAD_SINK,
> +		.which = fh ? V4L2_SUBDEV_FORMAT_TRY :
> +			      V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.format = {
> +			.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +			.width = 1920,
> +			.height = 1080
> +		}
> +	};
> +
> +	return tpg_set_format(sd, fh ? fh->state : NULL, &format);
> +}
> +
> +/*
> + * tpg_set_test_pattern - Set test generator's pattern mode
> + * @tpg: TPG device
> + * @value: desired test pattern mode
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int tpg_set_test_pattern(struct tpg_device *tpg, s32 value)
> +{
> +	return tpg->res->hw_ops->configure_testgen_pattern(tpg, value);
> +}
> +
> +/*
> + * tpg_s_ctrl - Handle set control subdev method
> + * @ctrl: pointer to v4l2 control structure
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int tpg_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct tpg_device *tpg = container_of(ctrl->handler,
> +					      struct tpg_device, ctrls);
> +	int ret = -EINVAL;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = tpg_set_test_pattern(tpg, ctrl->val);
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
> +/*
> + * msm_tpg_subdev_init - Initialize tpg device structure and resources
> + * @tpg: tpg device
> + * @res: tpg module resources table
> + * @id: tpg module id
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +int msm_tpg_subdev_init(struct camss *camss,
> +			struct tpg_device *tpg,
> +			const struct camss_subdev_resources *res, u8 id)
> +{
> +	struct device *dev = camss->dev;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	int i, j;
> +	int ret;

Reverse Christmas tree your declarations please.

> +
> +	tpg->camss = camss;
> +	tpg->id = id;
> +	tpg->res = &res->tpg;
> +	tpg->res->hw_ops->subdev_init(tpg);
> +
> +	/* Memory */
> +	tpg->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
> +	if (IS_ERR(tpg->base))
> +		return PTR_ERR(tpg->base);
> +
> +	/* Interrupt */
> +	ret = platform_get_irq_byname(pdev, res->interrupt[0]);
> +	if (ret < 0)
> +		return ret;
> +
> +	tpg->irq = ret;
> +	snprintf(tpg->irq_name, sizeof(tpg->irq_name), "%s_%s%d",
> +		 dev_name(dev), MSM_TPG_NAME, tpg->id);
> +
> +	ret = devm_request_irq(dev, tpg->irq, tpg->res->hw_ops->isr,
> +			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
> +			       tpg->irq_name, tpg);
> +	if (ret < 0) {
> +		dev_err(dev, "request_irq failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Clocks */
> +	tpg->nclocks = 0;
> +	while (res->clock[tpg->nclocks])
> +		tpg->nclocks++;
> +
> +	tpg->clock = devm_kcalloc(dev,
> +				  tpg->nclocks, sizeof(*tpg->clock),
> +				  GFP_KERNEL);
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
> +		clock->freq = devm_kcalloc(dev,
> +					   clock->nfreqs,
> +					   sizeof(*clock->freq),
> +					   GFP_KERNEL);
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
> +/*
> + * tpg_link_setup - Setup tpg connections
> + * @entity: Pointer to media entity structure
> + * @local: Pointer to local pad
> + * @remote: Pointer to remote pad
> + * @flags: Link flags
> + *
> + * Rreturn 0 on success
> + */
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
> +/*
> + * msm_tpg_register_entity - Register subdev node for tpg module
> + * @tpg: tpg device
> + * @v4l2_dev: V4L2 device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +int msm_tpg_register_entity(struct tpg_device *tpg,
> +			    struct v4l2_device *v4l2_dev)
> +{
> +	struct v4l2_subdev *sd = &tpg->subdev;
> +	struct media_pad *pads = tpg->pads;
> +	struct device *dev = tpg->camss->dev;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &tpg_v4l2_ops);
> +	sd->internal_ops = &tpg_v4l2_internal_ops;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		     V4L2_SUBDEV_FL_HAS_EVENTS;
> +	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
> +		 MSM_TPG_NAME, tpg->id);
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
> +
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
> +	pads[MSM_TPG_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	pads[MSM_TPG_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +	sd->entity.ops = &tpg_media_ops;
> +	ret = media_entity_pads_init(&sd->entity, MSM_TPG_PADS_NUM, pads);
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
> +/*
> + * msm_tpg_unregister_entity - Unregister tpg module subdev node
> + * @tpg: tpg device
> + */
> +void msm_tpg_unregister_entity(struct tpg_device *tpg)
> +{
> +	v4l2_device_unregister_subdev(&tpg->subdev);
> +	media_entity_cleanup(&tpg->subdev.entity);
> +	v4l2_ctrl_handler_free(&tpg->ctrls);
> +}
> diff --git a/drivers/media/platform/qcom/camss/camss-tpg.h b/drivers/media/platform/qcom/camss/camss-tpg.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..63fdb090481cf1297890e3cd50191f4bc103fc95
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-tpg.h
> @@ -0,0 +1,130 @@
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
> +#include <linux/interrupt.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-mediabus.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define MSM_TPG_PAD_SINK 0
> +#define MSM_TPG_PAD_SRC 1
> +#define MSM_TPG_PADS_NUM 2
> +
> +#define DATA_TYPE_RAW_8BIT		0x2a
> +#define DATA_TYPE_RAW_10BIT		0x2b
> +#define DATA_TYPE_RAW_12BIT		0x2c
> +
> +#define ENCODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
> +#define ENCODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
> +#define ENCODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
> +#define ENCODE_FORMAT_UNCOMPRESSED_14_BIT	0x4
> +#define ENCODE_FORMAT_UNCOMPRESSED_16_BIT	0x5
> +#define ENCODE_FORMAT_UNCOMPRESSED_20_BIT	0x6
> +#define ENCODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
> +
> +#define MSM_TPG_NAME "msm_tpg"
> +
> +enum tpg_testgen_mode {
> +	TPG_PAYLOAD_MODE_DISABLED = 0,
> +	TPG_PAYLOAD_MODE_INCREMENTING = 1,
> +	TPG_PAYLOAD_MODE_ALTERNATING_55_AA = 2,
> +	TPG_PAYLOAD_MODE_RANDOM = 5,
> +	TPG_PAYLOAD_MODE_USER_SPECIFIED = 6,
> +	TPG_PAYLOAD_MODE_COLOR_BARS = 9,
> +	TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 9, /* excluding disabled */
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
> +	void (*configure_stream)(struct tpg_device *tpg, u8 enable);
> +
> +	int (*configure_testgen_pattern)(struct tpg_device *tpg, s32 val);
> +
> +	u32 (*hw_version)(struct tpg_device *tpg);
> +
> +	irqreturn_t (*isr)(int irq, void *dev);
> +
> +	int (*reset)(struct tpg_device *tpg);
> +
> +	void (*subdev_init)(struct tpg_device *tpg);
> +};
> +
> +struct tpg_subdev_resources {
> +	u8 lane_cnt;
> +	u8 vc_cnt;
> +	const struct tpg_formats *formats;
> +	const struct tpg_hw_ops *hw_ops;
> +};
> +
> +struct tpg_device {
> +	struct camss *camss;
> +	u8 id;
> +	struct v4l2_subdev subdev;
> +	struct media_pad pads[MSM_TPG_PADS_NUM];
> +	void __iomem *base;
> +	void __iomem *base_clk_mux;

clk_mux ?

Can you please go through this list and remove anything that isn't being 
used, don't just copy/paste existing code/structures.


> +	u32 irq;
> +	char irq_name[30];
> +	struct camss_clock *clock;
> +	int nclocks;
> +	u32 timer_clk_rate;
> +	struct tpg_testgen_config testgen;
> +	struct v4l2_mbus_framefmt fmt[MSM_TPG_PADS_NUM];
> +	struct v4l2_ctrl_handler ctrls;
> +	struct v4l2_ctrl *testgen_mode;
> +	const struct tpg_subdev_resources *res;
> +	const struct tpg_format *formats;
> +	unsigned int nformats;
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
> +extern const char * const testgen_payload_modes[];
> +
> +extern const struct tpg_formats tpg_formats_gen1;
> +
> +extern const struct tpg_hw_ops tpg_ops_gen1;
> +
> +#endif /* QC_MSM_CAMSS_TPG_H */
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index b5600a8b2c4b3972633d42938feec9265b44dec5..99392e3bada80a8736b2c317308e510e5a7c66ea 100644
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
> @@ -51,6 +52,7 @@ struct camss_subdev_resources {
>   	char *interrupt[CAMSS_RES_MAX];
>   	union {
>   		struct csiphy_subdev_resources csiphy;
> +		struct tpg_subdev_resources tpg;
>   		struct csid_subdev_resources csid;
>   		struct vfe_subdev_resources vfe;
>   	};
> @@ -100,6 +102,7 @@ struct camss_resources {
>   	enum camss_version version;
>   	const char *pd_name;
>   	const struct camss_subdev_resources *csiphy_res;
> +	const struct camss_subdev_resources *tpg_res;
>   	const struct camss_subdev_resources *csid_res;
>   	const struct camss_subdev_resources *ispif_res;
>   	const struct camss_subdev_resources *vfe_res;
> @@ -107,6 +110,7 @@ struct camss_resources {
>   	const struct resources_icc *icc_res;
>   	const unsigned int icc_path_num;
>   	const unsigned int csiphy_num;
> +	const unsigned int tpg_num;
>   	const unsigned int csid_num;
>   	const unsigned int vfe_num;
>   	int (*link_entities)(struct camss *camss);
> @@ -118,6 +122,7 @@ struct camss {
>   	struct media_device media_dev;
>   	struct device *dev;
>   	struct csiphy_device *csiphy;
> +	struct tpg_device *tpg;
>   	struct csid_device *csid;
>   	struct ispif_device *ispif;
>   	struct vfe_device *vfe;
> 
---
bod

