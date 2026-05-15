Return-Path: <linux-media+bounces-61760-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hzwMEE5SB2pIygIAu9opvQ
	(envelope-from <linux-media+bounces-61760-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 19:05:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E10554670
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 19:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90E2C304C37D
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 16:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F235D4EA36C;
	Fri, 15 May 2026 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PC7dSiTy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406F23B4EA3;
	Fri, 15 May 2026 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862431; cv=none; b=QN+yx/S5g8YzJj6T62xOamnWm2cOqkPROc3Xf30oPIytBnMJ7CuWtRP79twNxNCvywfI0w7e8g6fRTbW2Dn/ozWuFggX0F6uOJlTKP9ecog+JWMFilrcBfeagXuhRzX6a4bo/95gDh01X7XTRBOAtm4SBkdQH3iM+SjFGomh2nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862431; c=relaxed/simple;
	bh=4rAGTyFMkak7Fl0r/Qo+8V8FhXToI3xwwcj3ISfI+RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDAFiBvUSjlqvvAoO0puxFGqYFDDifbxBn2xDwS9Se7L3E1GdJwJEG3c+aILy4YucmNb2oodk/v0zJdFZhvg+3IkLFqRU4g1d5waD+WZfkCmfLz+UfSnU++b/9YTbtJqXm/MLqxh006SYkAwAzKAm65y6BvY2zC8uGWNQjT0K6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PC7dSiTy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E262C2BCB3;
	Fri, 15 May 2026 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778862430;
	bh=4rAGTyFMkak7Fl0r/Qo+8V8FhXToI3xwwcj3ISfI+RE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PC7dSiTy5peFcoCfy8VSssMZdbVzDhPIhh/vhvoygODfeOlMiVnCEyzTvoRPSYp55
	 7b5/+jyjr+EnkdvdDh81F36jdYSrRI35Tnb+d/ijsdoXuoUckCkDOLeBwNPwrFTl2a
	 rB43k8uo3QD0/LjLJMhYViEhknGaHhHZvTI/R84JBpIHhTih+dGXvk61D7jvqA4HWA
	 2L1khQTAwF8XRh8zHaE95f347jKKtDJGZ4WaJhIbxIBfmYWNkO7SoDHgEAYtv31VDD
	 TmR3XrKL57Ah/AwV9Gyqr+h/XlAC+jkpy4fGsH8qVYQ3WnkNXjgzi7DAqwxF9mJac0
	 9TIW61h6KL45Q==
Message-ID: <26351e3c-bb21-40f6-8cbe-d55a1a1235fd@kernel.org>
Date: Fri, 15 May 2026 17:27:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] qcom: media: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
 <V_d7vS0B9HkpGpEs0y9nJb64rgUqCrtvsth4jBVNHytJUb_Dvuza2SstFCDMahbyY41HvonpitbvjCQfIAuCBg==@protonmail.internalid>
 <20260515-qcom-jpeg-v4l2-v1-2-f38c2e1b3555@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-2-f38c2e1b3555@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C4E10554670
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61760-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On 15/05/2026 12:47, Atanas Filipov wrote:
> Implementation of a V4L2 JPEG encoder device driver supporting
> Qualcomm SC7180, SM8250, SM7280, and SM8550 chipsets.

The first thing I'm noticing is you've enabled 6490 only in this series, 
and that is not called out in your git log.

> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/Kconfig                |    1 +
>   drivers/media/platform/qcom/Makefile               |    1 +
>   drivers/media/platform/qcom/jpeg/Kconfig           |   17 +
>   drivers/media/platform/qcom/jpeg/Makefile          |    9 +
>   drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h  |  253 ++++
>   drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c   |  370 +++++
>   drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h   |  111 ++
>   drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c   |  388 +++++
>   drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h   |  130 ++
>   drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c   | 1522 ++++++++++++++++++++
>   drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h   |   49 +
>   drivers/media/platform/qcom/jpeg/qcom_jenc_res.c   |  268 ++++
>   drivers/media/platform/qcom/jpeg/qcom_jenc_res.h   |   70 +
>   drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c  | 1082 ++++++++++++++
>   drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h  |   27 +
>   .../platform/qcom/jpeg/qcom_v165_jenc_hw_info.h    |  509 +++++++
>   .../platform/qcom/jpeg/qcom_v580_jenc_hw_info.h    |  509 +++++++
>   .../platform/qcom/jpeg/qcom_v680_jenc_hw_info.h    |  509 +++++++
>   .../platform/qcom/jpeg/qcom_v780_jenc_hw_info.h    |  509 +++++++
>   19 files changed, 6334 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
> index 4f4d3a68e6e5..f33d53a754a0 100644
> --- a/drivers/media/platform/qcom/Kconfig
> +++ b/drivers/media/platform/qcom/Kconfig
> @@ -5,3 +5,4 @@ comment "Qualcomm media platform drivers"
>   source "drivers/media/platform/qcom/camss/Kconfig"
>   source "drivers/media/platform/qcom/iris/Kconfig"
>   source "drivers/media/platform/qcom/venus/Kconfig"
> +source "drivers/media/platform/qcom/jpeg/Kconfig"
> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
> index ea2221a202c0..30c94949e9de 100644
> --- a/drivers/media/platform/qcom/Makefile
> +++ b/drivers/media/platform/qcom/Makefile
> @@ -2,3 +2,4 @@
>   obj-y += camss/
>   obj-y += iris/
>   obj-y += venus/
> +obj-y += jpeg/
> diff --git a/drivers/media/platform/qcom/jpeg/Kconfig b/drivers/media/platform/qcom/jpeg/Kconfig
> new file mode 100644
> index 000000000000..51846aeafaf3
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_QCOM_JENC
> +	tristate "Qualcomm V4L2 JPEG Encoder driver"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select VIDEO_V4L2_SUBDEV_API
> +	select VIDEOBUF2_DMA_SG
> +	select V4L2_MEM2MEM_DEV
> +	help
> +	  Qualcomm JPEG memory-to-memory V4L2 encoder driver.
> +
> +	  Provides:
> +	    - qcom-jenc (encode)
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called qcom-jenc
> diff --git a/drivers/media/platform/qcom/jpeg/Makefile b/drivers/media/platform/qcom/jpeg/Makefile
> new file mode 100644
> index 000000000000..310f6c3c1f19
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_VIDEO_QCOM_JENC) += qcom-jenc.o
> +
> +qcom-jenc-objs += \
> +	qcom_jenc_dev.o \
> +	qcom_jenc_v4l2.o \
> +	qcom_jenc_ops.o \
> +	qcom_jenc_res.o \
> +	qcom_jenc_hdr.o
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
> new file mode 100644
> index 000000000000..40e46820c546
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
> @@ -0,0 +1,253 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_DEFS_H_
> +#define QCOM_JENC_DEFS_H_
> +
> +#include <linux/types.h>
> +#include <linux/io.h>
> +#include <linux/bitfield.h>
> +#include <linux/videodev2.h>
> +#include <media/videobuf2-core.h>
> +
> +/* Offline JPEG encoder constraints */
> +#define QCOM_JPEG_HW_MAX_WIDTH	9248
> +#define QCOM_JPEG_HW_MAX_HEIGHT	8192
> +#define QCOM_JPEG_HW_MIN_WIDTH	128
> +#define QCOM_JPEG_HW_MIN_HEIGHT	96
> +
> +#define QCOM_JPEG_HW_DEF_HSTEP	16
> +#define QCOM_JPEG_HW_DEF_VSTEP	16
> +
> +#define QCOM_JPEG_HW_DEF_WIDTH	1920
> +#define QCOM_JPEG_HW_DEF_HEIGHT	1080
> +
> +#define QCOM_JPEG_MAX_PLANES	3
> +
> +#define QCOM_JPEG_QUALITY_MIN	1
> +#define QCOM_JPEG_QUALITY_DEF	95
> +#define QCOM_JPEG_QUALITY_MAX	100
> +#define QCOM_JPEG_QUALITY_MID	(QCOM_JPEG_QUALITY_MAX / 2)
> +#define QCOM_JPEG_QUALITY_UNT	1
> +
> +enum qcom_jpeg_soc_id {
> +	QCOM_V165_SOC_ID = 0,
> +	QCOM_V580_SOC_ID,
> +	QCOM_V680_SOC_ID,
> +	QCOM_V780_SOC_ID,
> +	QCOM_UNKNOWN_SOC_ID,
> +};

You sould only have in the list the versions of the SoC this can 
actually be run on. Right now that's 6490 only.

Add additional SoCs as you make the upstream submission, including dts 
so that others can verify the work.

> +
> +enum qcom_soc_perf_level {
> +	QCOM_SOC_PERF_SUSPEND = 0,
> +	QCOM_SOC_PERF_LOWSVS,
> +	QCOM_SOC_PERF_SVS,
> +	QCOM_SOC_PERF_SVS_L1,
> +	QCOM_SOC_PERF_NOMINAL,
> +	QCOM_SOC_PERF_TURBO,
> +	QCOM_SOC_PERF_LEVEL_MAX,
> +};
> +
> +enum qcom_jpeg_mask_id {
> +	JMSK_HW_VER_STEP,
> +	JMSK_HW_VER_MINOR,
> +	JMSK_HW_VER_MAJOR,
> +
> +	JMSK_HW_CAP_ENCODE,
> +	JMSK_HW_CAP_DECODE,
> +	JMSK_HW_CAP_UPSCALE,
> +	JMSK_HW_CAP_DOWNSCALE,
> +

This gaps seem to indicate a grouping. You should have a comment to 
enumerate those groups.

Also it'd be nice if someplace JMSK was defined at least once.

> +	JMSK_RST_CMD_COMMON,
> +	JMSK_RST_CMD_FE_RESET,
> +	JMSK_RST_CMD_WE_RESET,
> +	JMSK_RST_CMD_ENCODER_RESET,
> +	JMSK_RST_CMD_DECODER_RESET,
> +	JMSK_RST_CMD_BLOCK_FORMATTER_RST,
> +	JMSK_RST_CMD_SCALE_RESET,
> +	JMSK_RST_CMD_REGISTER_RESET,
> +	JMSK_RST_CMD_MISR_RESET,
> +	JMSK_RST_CMD_CORE_RESET,
> +	JMSK_RST_CMD_JMSK_DOMAIN_RESET,
> +	JMSK_RST_CMD_RESET_BYPASS,
> +
> +	JMSK_CMD_HW_START,
> +	JMSK_CMD_HW_STOP,
> +	JMSK_CMD_CLR_RD_PLNS_QUEUE,
> +	JMSK_CMD_CLR_WR_PLNS_QUEUE,
> +	JMSK_CMD_APPLY_SWC_RD_PARAMS,
> +
> +	JMSK_CORE_CFG_FE_ENABLE,
> +	JMSK_CORE_CFG_WE_ENABLE,
> +	JMSK_CORE_CFG_ENC_ENABLE,
> +	JMSK_CORE_CFG_SCALE_ENABLE,
> +	JMSK_CORE_CFG_TESTBUS_ENABLE,
> +	JMSK_CORE_CFG_MODE,
> +	JMSK_CORE_CFG_CGC_DISABLE,
> +
> +	JMSK_CORE_STATUS_ENCODE_STATE,
> +	JMSK_CORE_STATUS_SCALE_STATE,
> +	JMSK_CORE_STATUS_RT_STATE,
> +	JMSK_CORE_STATUS_BUS_STATE,
> +	JMSK_CORE_STATUS_CGC_STATE,
> +
> +	JMSK_IRQ_ENABLE_ALL,
> +	JMSK_IRQ_DISABLE_ALL,
> +	JMSK_IRQ_CLEAR_ALL,
> +
> +	JMSK_IRQ_STATUS_SESSION_DONE,
> +	JMSK_IRQ_STATUS_RD_BUF_PLN0_DONE,
> +	JMSK_IRQ_STATUS_RD_BUF_PLN1_DONE,
> +	JMSK_IRQ_STATUS_RD_BUF_PLN2_DONE,
> +	JMSK_IRQ_STATUS_RD_BUF_PLNS_ATTN,
> +	JMSK_IRQ_STATUS_WR_BUF_PLN0_DONE,
> +	JMSK_IRQ_STATUS_WR_BUF_PLN1_DONE,
> +	JMSK_IRQ_STATUS_WR_BUF_PLN2_DONE,
> +	JMSK_IRQ_STATUS_WR_BUF_PLNS_ATTN,
> +	JMSK_IRQ_STATUS_SESSION_ERROR,
> +	JMSK_IRQ_STATUS_STOP_ACK,
> +	JMSK_IRQ_STATUS_RESET_ACK,
> +
> +	JMSK_FE_CFG_BYTE_ORDERING,
> +	JMSK_FE_CFG_BURST_LENGTH_MAX,
> +	JMSK_FE_CFG_MEMORY_FORMAT,
> +	JMSK_FE_CFG_CBCR_ORDER,
> +	JMSK_FE_CFG_BOTTOM_VPAD_EN,
> +	JMSK_FE_CFG_PLN0_EN,
> +	JMSK_FE_CFG_PLN1_EN,
> +	JMSK_FE_CFG_PLN2_EN,
> +	JMSK_FE_CFG_SIXTEEN_MCU_EN,
> +	JMSK_FE_CFG_MCUS_PER_BLOCK,
> +	JMSK_FE_CFG_MAL_BOUNDARY,
> +	JMSK_FE_CFG_MAL_EN,
> +
> +	JMSK_FE_VBPAD_CFG_BLOCK_ROW,
> +
> +	JMSK_PLNS_RD_OFFSET,
> +	JMSK_PLNS_RD_BUF_SIZE_WIDTH,
> +	JMSK_PLNS_RD_BUF_SIZE_HEIGHT,
> +	JMSK_PLNS_RD_STRIDE,
> +	JMSK_PLNS_RD_HINIT,
> +	JMSK_PLNS_RD_VINIT,
> +
> +	JMSK_WE_CFG_BYTE_ORDERING,
> +	JMSK_WE_CFG_BURST_LENGTH_MAX,
> +	JMSK_WE_CFG_MEMORY_FORMAT,
> +	JMSK_WE_CFG_CBCR_ORDER,
> +	JMSK_WE_CFG_PLN0_EN,
> +	JMSK_WE_CFG_PLN1_EN,
> +	JMSK_WE_CFG_PLN2_EN,
> +	JMSK_WE_CFG_MAL_BOUNDARY,
> +	JMSK_WE_CFG_MAL_EN,
> +	JMSK_WE_CFG_POP_BUFF_ON_EOS,
> +
> +	JMSK_PLNS_WR_BUF_SIZE_WIDTH,
> +	JMSK_PLNS_WR_BUF_SIZE_HEIGHT,
> +
> +	JMSK_PLNS_WR_STRIDE,
> +	JMSK_PLNS_WR_HINIT,
> +	JMSK_PLNS_WR_VINIT,
> +	JMSK_PLNS_WR_HSTEP,
> +	JMSK_PLNS_WR_VSTEP,
> +	JMSK_PLNS_WR_BLOCK_CFG_PER_COL,
> +	JMSK_PLNS_WR_BLOCK_CFG_PER_RAW,
> +
> +	JMSK_ENC_CFG_IMAGE_FORMAT,
> +	JMSK_ENC_CFG_APPLY_EOI,
> +	JMSK_ENC_CFG_HUFFMAN_SEL,
> +	JMSK_ENC_CFG_FSC_ENABLE,
> +	JMSK_ENC_CFG_OUTPUT_DISABLE,
> +	JMSK_ENC_CFG_RST_MARKER_PERIOD,
> +	JMSK_ENC_IMAGE_SIZE_WIDTH,
> +	JMSK_ENC_IMAGE_SIZE_HEIGHT,
> +
> +	JMSK_SCALE_CFG_HSCALE_ENABLE,
> +	JMSK_SCALE_CFG_VSCALE_ENABLE,
> +	JMSK_SCALE_CFG_UPSAMPLE_EN,
> +	JMSK_SCALE_CFG_SUBSAMPLE_EN,
> +	JMSK_SCALE_CFG_HSCALE_ALGO,
> +	JMSK_SCALE_CFG_VSCALE_ALGO,
> +	JMSK_SCALE_CFG_H_SCALE_FIR_ALGO,
> +	JMSK_SCALE_CFG_V_SCALE_FIR_ALGO,
> +
> +	JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH,
> +	JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT,
> +
> +	JMSK_SCALE_PLNS_HSTEP_FRACTIONAL,
> +	JMSK_SCALE_PLNS_HSTEP_INTEGER,
> +	JMSK_SCALE_PLNS_VSTEP_FRACTIONAL,
> +	JMSK_SCALE_PLNS_VSTEP_INTEGER,
> +
> +	JMSK_DMI_CFG,
> +	JMSK_DMI_ADDR,
> +	JMSK_DMI_DATA,
> +
> +	JMSK_TESTBUS_CFG,
> +	JMSK_FE_VBPAD_CFG,
> +
> +	JMSK_PLN0_RD_HINIT_INT,
> +	JMSK_PLN1_RD_HINIT_INT,
> +	JMSK_PLN2_RD_HINIT_INT,
> +	JMSK_PLN0_RD_VINIT_INT,
> +	JMSK_PLN1_RD_VINIT_INT,
> +	JMSK_PLN2_RD_VINIT_INT,
> +	JMSK_ID_MAX
> +};
> +
> +struct qcom_jpeg_reg_offs {
> +	u32 hw_version;
> +	u32 hw_capability;
> +	u32 reset_cmd;
> +	u32 core_cfg;
> +	u32 int_mask;
> +	u32 int_clr;
> +	u32 int_status;
> +	u32 hw_cmd;
> +	u32 enc_core_state;
> +
> +	struct {
> +		u32 pntr[QCOM_JPEG_MAX_PLANES];
> +		u32 offs[QCOM_JPEG_MAX_PLANES];
> +		u32 cnsmd[QCOM_JPEG_MAX_PLANES];
> +		u32 bsize[QCOM_JPEG_MAX_PLANES];
> +		u32 stride[QCOM_JPEG_MAX_PLANES];
> +		u32 hinit[QCOM_JPEG_MAX_PLANES];
> +		u32 vinit[QCOM_JPEG_MAX_PLANES];
> +		u32 pntr_cnt;
> +		u32 vbpad_cfg;
> +	} fe;
> +	u32 fe_cfg;
> +
> +	struct {
> +		u32 pntr[QCOM_JPEG_MAX_PLANES];
> +		u32 cnsmd[QCOM_JPEG_MAX_PLANES];
> +		u32 bsize[QCOM_JPEG_MAX_PLANES];
> +		u32 stride[QCOM_JPEG_MAX_PLANES];
> +		u32 hinit[QCOM_JPEG_MAX_PLANES];
> +		u32 hstep[QCOM_JPEG_MAX_PLANES];
> +		u32 vinit[QCOM_JPEG_MAX_PLANES];
> +		u32 vstep[QCOM_JPEG_MAX_PLANES];
> +		u32 blocks[QCOM_JPEG_MAX_PLANES];
> +		u32 pntr_cnt;
> +	} we;
> +	u32 we_cfg;
> +
> +	struct {
> +		u32 hstep[QCOM_JPEG_MAX_PLANES];
> +		u32 vstep[QCOM_JPEG_MAX_PLANES];
> +	} scale;
> +	u32 scale_cfg;
> +	u32 scale_out_cfg[QCOM_JPEG_MAX_PLANES];
> +
> +	u32 enc_cfg;
> +	u32 enc_img_size;
> +	u32 enc_out_size;
> +
> +	u32 dmi_cfg;
> +	u32 dmi_data;
> +	u32 dmi_addr;
> +} __packed;

You generally only care about packing if you are aligning to a hardware 
feature / reg region.

Is that so here ? Seems like not, so unless this is literally a pointer 
to a gigantic register space, I don't believe it needs __packing.

> +#endif /* QCOM_JENC_DEFS_H_ */
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> new file mode 100644
> index 000000000000..4ef6bf9fd48d
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> @@ -0,0 +1,370 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "qcom_jenc_dev.h"
> +
> +#include "qcom_jenc_defs.h"
> +#include "qcom_jenc_ops.h"
> +#include "qcom_jenc_res.h"
> +#include "qcom_jenc_v4l2.h"
> +
> +static int qcom_jpeg_match_data(struct qcom_jenc_dev *jenc)
> +{
> +	struct device *dev = jenc->dev;
> +	const struct qcom_dev_resources *res;
> +
> +	res = device_get_match_data(dev);
> +	if (!res)
> +		return dev_err_probe(dev, -ENODEV, "unsupported SoC\n");
> +
> +	jenc->res = res;
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_clk_init(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_dev_resources *res = jenc->res;
> +	int c_idx;
> +
> +	jenc->clks = devm_kcalloc(jenc->dev, ARRAY_SIZE(res->clk_names), sizeof(*jenc->clks),
> +				  GFP_KERNEL);
> +	if (!jenc->clks)
> +		return -ENOMEM;
> +
> +	for (c_idx = 0; c_idx < ARRAY_SIZE(res->clk_names); c_idx++) {
> +		if (!res->clk_names[c_idx])
> +			break;

Should this be an error ?

No, probably not ..

> +
> +		jenc->clks[c_idx].clk = devm_clk_get(jenc->dev, res->clk_names[c_idx]);
> +		if (IS_ERR(jenc->clks[c_idx].clk)) {
> +			return dev_err_probe(jenc->dev, PTR_ERR(jenc->clks[c_idx].clk),
> +					     "failed to get clock %s\n", res->clk_names[c_idx]);
> +		}
> +
> +		jenc->clks[c_idx].id = res->clk_names[c_idx];
> +		jenc->num_clks++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_clk_rate(struct qcom_jenc_dev *jenc, enum qcom_soc_perf_level level)
> +{
> +	const struct qcom_dev_resources	*res = jenc->res;
> +	const struct qcom_perf_resource	*perf = &res->perf_cfg[level];
> +	int c_idx;
> +	int rc = 0;

Reverse Christmas tree your declarations for preference.

> +
> +	for (c_idx = 0; c_idx < jenc->num_clks; c_idx++) {
> +		/* skip clocks with fixed or default frequency */
> +		if (!perf->clk_rate[c_idx])
> +			continue;
> +
> +		/* setup frequency according to performance level */
> +		rc = clk_set_rate(jenc->clks[c_idx].clk, perf->clk_rate[c_idx]);
> +		if (rc < 0) {
> +			dev_err(jenc->dev, "clock set rate failed: %d\n", rc);
> +			return rc;
> +		}
> +
> +		dev_dbg(jenc->dev, "clock %s current rate: %ld\n",
> +			jenc->clks[c_idx].id, clk_get_rate(jenc->clks[c_idx].clk));
> +	}
> +
> +	return rc;
> +}
> +
> +static int qcom_jpeg_clk_on(struct qcom_jenc_dev *jenc)
> +{
> +	int rc;
> +
> +	rc = qcom_jpeg_clk_rate(jenc, jenc->perf);
> +	if (rc)
> +		return rc;
> +
> +	rc = clk_bulk_prepare_enable(jenc->num_clks, jenc->clks);
> +	if (rc)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +static void qcom_jpeg_clk_off(struct qcom_jenc_dev *jenc)
> +{
> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
> +}
> +
> +static int qcom_jpeg_icc_on(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_dev_resources	*res = jenc->res;
> +	int p_idx;
> +	int rc;
> +
> +	for (p_idx = 0; p_idx < res->num_of_icc; p_idx++) {
> +		rc = icc_set_bw(jenc->icc_paths[p_idx], res->icc_res[p_idx].pair.aggr,
> +				res->icc_res[p_idx].pair.peak);
> +		if (rc) {
> +			dev_err(jenc->dev, "%s failed for path %s: %d\n", __func__,
> +				res->icc_res[p_idx].icc_id, rc);

Please drop those __func__ for upstream submssion - better error strings 
instead.

> +			goto err_icc_set_bw;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_icc_set_bw:
> +	while (--p_idx >= 0)
> +		icc_set_bw(jenc->icc_paths[p_idx], 0, 0);
> +
> +	return rc;
> +}
> +
> +static void qcom_jpeg_icc_off(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_dev_resources	*res = jenc->res;
> +	int p_idx;
> +
> +	for (p_idx = 0; p_idx < res->num_of_icc; p_idx++)
> +		icc_set_bw(jenc->icc_paths[p_idx], 0, 0);
> +}
> +
> +static int qcom_jpeg_icc_init(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_dev_resources	*res = jenc->res;
> +	int p_idx;
> +
> +	jenc->icc_paths = devm_kcalloc(jenc->dev, res->num_of_icc, sizeof(*jenc->icc_paths),
> +				       GFP_KERNEL);
> +	if (!jenc->icc_paths)
> +		return -ENOMEM;
> +
> +	for (p_idx = 0; p_idx < res->num_of_icc; p_idx++) {
> +		jenc->icc_paths[p_idx] = devm_of_icc_get(jenc->dev, res->icc_res[p_idx].icc_id);
> +		if (IS_ERR(jenc->icc_paths[p_idx])) {
> +			return dev_err_probe(jenc->dev, PTR_ERR(jenc->icc_paths[p_idx]),
> +					     "failed to get ICC path: %ld\n",
> +					     PTR_ERR(jenc->icc_paths[p_idx]));
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static __maybe_unused int qcom_jpeg_pm_suspend(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +
> +	qcom_jpeg_clk_off(jenc);
> +
> +	qcom_jpeg_icc_off(jenc);
> +
> +	return 0;
> +}
> +
> +static __maybe_unused int qcom_jpeg_pm_resume(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc = qcom_jpeg_icc_on(jenc);
> +	if (rc)
> +		return rc;
> +
> +	return qcom_jpeg_clk_on(jenc);

if qcom_jpeg_clk_on fails you need to unwind icc_on no ?

> +}
> +
> +static __maybe_unused int qcom_jpeg_suspend(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jenc->m2m_dev);
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static __maybe_unused int qcom_jpeg_resume(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc = pm_runtime_force_resume(dev);
> +	if (rc)
> +		return rc;
> +
> +	v4l2_m2m_resume(jenc->m2m_dev);
> +
> +	return rc;
> +}
> +
> +static const struct dev_pm_ops qcom_jpeg_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(qcom_jpeg_suspend, qcom_jpeg_resume)
> +	SET_RUNTIME_PM_OPS(qcom_jpeg_pm_suspend, qcom_jpeg_pm_resume, NULL)
> +};
> +
> +static int qcom_jpeg_probe(struct platform_device *pdev)
> +{
> +	struct qcom_jenc_dev *jenc;
> +	int rc;
> +
> +	jenc = devm_kzalloc(&pdev->dev, sizeof(*jenc), GFP_KERNEL);
> +	if (!jenc)
> +		return -ENOMEM;
> +
> +	jenc->dev = &pdev->dev;
> +	mutex_init(&jenc->dev_mutex);
> +	spin_lock_init(&jenc->hw_lock);
> +	init_completion(&jenc->reset_complete);
> +	init_completion(&jenc->stop_complete);
> +
> +	rc = qcom_jpeg_match_data(jenc);
> +	if (rc)
> +		return dev_err_probe(jenc->dev, rc, "failed to attach hardware\n");
> +
> +	if (!jenc->res->hw_offs || !jenc->res->hw_ops)
> +		return dev_err_probe(jenc->dev, -EINVAL, "missing hw resources\n");
> +
> +	rc = dma_set_mask_and_coherent(jenc->dev, DMA_BIT_MASK(32));
> +	if (rc)
> +		return dev_err_probe(jenc->dev, rc, "failed to set DMA mask\n");
> +
> +	platform_set_drvdata(pdev, jenc);

Strange place to assign this, do you need it subsequent in your probes 
or could you do it right at the end ?

Minor nit.

> +
> +	jenc->jpeg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(jenc->jpeg_base)) {
> +		rc = PTR_ERR(jenc->jpeg_base);
> +		return dev_err_probe(jenc->dev, rc, "failed to map JPEG resource\n");
> +	}
> +
> +	jenc->cpas_base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(jenc->cpas_base)) {
> +		rc = PTR_ERR(jenc->cpas_base);
> +		return dev_err_probe(jenc->dev, rc, "failed to map CPAS resource\n");
> +	}
> +
> +	rc = qcom_jpeg_clk_init(jenc);
> +	if (rc)
> +		return dev_err_probe(jenc->dev, rc, "failed to init bulk clocks\n");
> +
> +	jenc->irq = platform_get_irq(pdev, 0);
> +	if (jenc->irq < 0)
> +		return dev_err_probe(jenc->dev, jenc->irq, "failed to get IRQ\n");
> +
> +	rc = devm_request_threaded_irq(jenc->dev, jenc->irq,
> +				       jenc->res->hw_ops->hw_irq_top,
> +				       jenc->res->hw_ops->hw_irq_bot,
> +				       IRQF_ONESHOT, dev_name(jenc->dev), jenc);
> +	if (rc)
> +		return dev_err_probe(jenc->dev, rc, "failed to request IRQ\n");
> +
> +	rc = qcom_jpeg_icc_init(jenc);
> +	if (rc)
> +		return dev_err_probe(jenc->dev, rc, "failed to get ICC resources\n");
> +
> +	rc = kfifo_alloc(&jenc->kfifo_inst, sizeof(jenc->enc_status) * VB2_MAX_FRAME, GFP_KERNEL);
> +	if (rc) {
> +		dev_err(jenc->dev, "failed to allocate kfifo\n");

dev_err_probe() like earlier on - I guess this was a jump to 
err_kfifo_free you forgot to tidy up.

> +		return rc;
> +	}
> +
> +	spin_lock_init(&jenc->kfifo_lock);
> +
> +	rc = v4l2_device_register(jenc->dev, &jenc->v4l2_dev);
> +	if (rc) {
> +		dev_err(jenc->dev, "failed to register V4L2 device\n");
> +		goto err_kfifo_free;
> +	}
> +
> +	rc = qcom_jpeg_v4l2_register(jenc);
> +	if (rc) {
> +		dev_err(jenc->dev, "failed to register video device\n");
> +		goto err_v4l2_device_unregister;
> +	}
> +
> +	jenc->perf = QCOM_SOC_PERF_NOMINAL;
> +
> +	pm_runtime_enable(jenc->dev);
> +
> +	dev_info(jenc->dev, "Qualcomm JPEG encoder registered\n");
> +
> +	return 0;
> +
> +err_v4l2_device_unregister:
> +	v4l2_device_unregister(&jenc->v4l2_dev);
> +err_kfifo_free:
> +	kfifo_free(&jenc->kfifo_inst);
> +
> +	return rc;
> +}
> +
> +static void qcom_jpeg_remove(struct platform_device *pdev)
> +{
> +	struct qcom_jenc_dev *jenc = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	qcom_jpeg_v4l2_unregister(jenc);
> +
> +	v4l2_device_unregister(&jenc->v4l2_dev);
> +
> +	kfifo_free(&jenc->kfifo_inst);
> +
> +	dev_info(jenc->dev, "Qualcomm JPEG encoder deregistered\n");
> +}
> +
> +static const struct of_device_id qcom_jpeg_of_match[] = {
> +	{
> +		.compatible	= "qcom,sc7180-jenc",
> +		.data		= &qcom_jpeg_v165_drvdata
> +	},
> +	{
> +		.compatible	= "qcom,sm8250-jenc",
> +		.data		= &qcom_jpeg_v580_drvdata
> +	},
> +	{
> +		.compatible	= "qcom,sm7325-jenc",
> +		.data		= &qcom_jpeg_v580_drvdata
> +	},
> +	{
> +		.compatible	= "qcom,sc7280-jenc",
> +		.data		= &qcom_jpeg_v680_drvdata
> +	},
> +	{
> +		.compatible	= "qcom,qcm6490-jenc",
> +		.data		= &qcom_jpeg_v680_drvdata
> +	},

Only one of these is supported in your submission so NAK for all of the 
others not in the submission.

qcm6490 is the only one anybody can verify in this series, please drop 
the others and progressively add them in with new DT entries to support.

> +	{
> +		.compatible	= "qcom,sm8550-jenc",
> +		.data		= &qcom_jpeg_v780_drvdata
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_jpeg_of_match);
> +
> +static struct platform_driver qcom_jpeg_platform_driver = {
> +	.probe  = qcom_jpeg_probe,
> +	.remove = qcom_jpeg_remove,
> +	.driver = {
> +		.name = QCOM_JPEG_ENC_NAME,
> +		.of_match_table = qcom_jpeg_of_match,
> +		.pm             = &qcom_jpeg_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(qcom_jpeg_platform_driver);
> +
> +MODULE_DESCRIPTION("QCOM JPEG mem2mem V4L2 encoder");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
> new file mode 100644
> index 000000000000..cf0c1a933163
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
> @@ -0,0 +1,111 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_DEV_H
> +#define QCOM_JENC_DEV_H
> +
> +#include <linux/device.h>
> +#include <linux/mutex.h>
> +#include <linux/irqreturn.h>
> +#include <linux/interconnect.h>
> +#include <linux/kfifo.h>
> +#include <linux/irq_work.h>
> +#include <media/videobuf2-core.h>
> +
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/v4l2-ctrls.h>
> +
> +#include "qcom_jenc_res.h"
> +#include "qcom_jenc_hdr.h"
> +#include "qcom_jenc_defs.h"
> +
> +#define QCOM_JPEG_ENC_NAME "qcom-jpeg-enc"
> +
> +#define TYPE2QID(t) \
> +	(V4L2_TYPE_IS_OUTPUT(t) ? JENC_SRC_QUEUE : JENC_DST_QUEUE)
> +
> +enum qcom_enc_qid {
> +	JENC_SRC_QUEUE = 0,
> +	JENC_DST_QUEUE,
> +	JENC_QUEUE_MAX
> +};
> +
> +struct jenc_enc_format {
> +	u32 type;
> +	u32 fourcc;
> +};
> +
> +struct qcom_jpeg_buff {
> +	struct {
> +		struct sg_table		*sgt;
> +		dma_addr_t		dma;
> +		unsigned long		size;
> +
> +	} plns[QCOM_JPEG_MAX_PLANES];
> +};
> +
> +struct qcom_jenc_queue {
> +	struct v4l2_pix_format_mplane	vf;
> +	u32				sequence;
> +	struct qcom_jpeg_buff		buff[VB2_MAX_FRAME];
> +	int				buff_id;
> +};
> +
> +struct qcom_jenc_dev {
> +	struct device			*dev;
> +	struct v4l2_device		v4l2_dev;
> +	struct v4l2_m2m_dev		*m2m_dev;
> +	struct video_device		*vdev;
> +	const struct qcom_dev_resources	*res;
> +	enum qcom_soc_perf_level	perf;
> +	int				irq;
> +	void __iomem			*jpeg_base;
> +	void __iomem			*cpas_base;
> +	struct clk_bulk_data		*clks;
> +	int				num_clks;
> +	/* device mutex lock */
> +	struct mutex			dev_mutex;
> +	atomic_t			ref_count;
> +	struct completion		reset_complete;
> +	struct completion		stop_complete;
> +	/* decoder hardware lock */
> +	spinlock_t			hw_lock;
> +	struct jenc_context		*actx;
> +	struct icc_path			**icc_paths;
> +
> +	struct kfifo			kfifo_inst;
> +	/* lock kfifo operations */
> +	spinlock_t			kfifo_lock;
> +	u32				enc_status;
> +
> +	void (*enc_hw_irq_cb)
> +		(void *data, enum vb2_buffer_state ev, size_t out_size);
> +};
> +
> +struct jenc_context {
> +	struct device		 *dev;
> +	struct qcom_jenc_dev	 *jenc;
> +	struct v4l2_fh		 fh;
> +
> +	/* quality update lock */
> +	struct mutex		 quality_mutex;
> +	struct v4l2_ctrl	 *quality_ctl;
> +	u32			 quality_requested;
> +	u32			 quality_programmed;
> +	struct v4l2_ctrl_handler ctrl_hdl;
> +
> +	/* session context lock */
> +	struct mutex		 ctx_lock;
> +
> +	/* decoder state lock */
> +	struct mutex		 stop_lock;
> +	bool			 is_stopping;
> +
> +	struct qcom_jenc_queue	bufq[JENC_QUEUE_MAX];
> +	struct qcom_jenc_header	hdr_cache;
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
> new file mode 100644
> index 000000000000..5a794882b980
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/string.h>
> +#include <linux/errno.h>
> +
> +#include "qcom_jenc_hdr.h"
> +#include "qcom_jenc_dev.h"
> +
> +/*
> + * The elements defined in this header are specified
> + * in the ITU-T T.81 / JPEG specification.
> + *
> + * https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> + */
> +
> +#define JFIF_HEADER_WIDTH_OFFS	0x07
> +#define JFIF_HEADER_HEIGHT_OFFS	0x05
> +
> +struct jpeg_header_buf {
> +	u8  *ptr;
> +	u32 size;
> +	u32 pos;
> +};
> +
> +static const struct jpeg_soi_app0 soi_app0 = {
> +	.soi		= { 0xff, 0xd8 },
> +	.app0_marker	= { 0xff, 0xe0 },
> +	.app0_length	= { 0x00, 0x10 },
> +	.jfif_id	= { 'J', 'F', 'I', 'F', 0x00 },
> +	.version	= { 0x01, 0x01 },
> +	.units		= 0x00,
> +	.density_x	= { 0x00, 0x01 },
> +	.density_y	= { 0x00, 0x01 },
> +	.thumb_x	= 0x00,
> +	.thumb_y	= 0x00,
> +};
> +
> +static const struct jpeg_record_hdr dqt_luma_hdr = {
> +	.marker = { 0xff, 0xdb },
> +	.length = { 0, 0x43 }
> +};

What are these magic numbers about ? Comments at the very least are 
required so that the question isn't raised when reading.
> +
> +/* Luminance quantization table */
> +static const struct jpeg_dqt_header dqt_luma_data = {
> +	.index = 0x00,
> +};
> +
> +static const struct jpeg_record_hdr  dqt_chroma_hdr = {
> +	.marker = { 0xff, 0xdb },
> +	.length = { 0, 0x84 }
> +};
> +
> +/* Chrominance quantization table */
> +static const struct jpeg_dqt_header dqt_chroma_data = {
> +	.index = 0x01,
> +};
> +
> +static const struct jpeg_record_hdr  sof0_mono_hdr = {
> +	.marker	= { 0xff, 0xc0 },
> +	.length	= { 0x00, 0x0b },
> +};
> +
> +static const struct jpeg_sof0_mono sof0_mono_data = {
> +	.precision	= 0x08,
> +	.height		= { 0x00, 0x00 },
> +	.width		= { 0x00, 0x00 },
> +	.components	= 1,
> +	.y_id		= 1,
> +	.y_sampling	= 0x11,
> +	.y_qtable	= 0,
> +};
> +
> +static const struct jpeg_record_hdr  sof0_color_hdr = {
> +	.marker	= { 0xff, 0xc0 },
> +	.length	= { 0x00, 0x11 },
> +};

Hmm, there seems to be alot of the magic number stuff coming out in this 
area recently.

I'll reiterate - bit-fields with named values are required.


> +
> +static const struct jpeg_sof0_color sof0_color_data = {
> +	.precision	= 0x08,
> +	.height		= { 0x00, 0x00 },
> +	.width		= { 0x00, 0x00 },
> +	.components	= 3,
> +	.y_id		= 1,
> +	.y_sampling	= 0x22,
> +	.y_qtable	= 0,
> +	.cb_id		= 2,
> +	.cb_sampling	= 0x11,
> +	.cb_qtable	= 1,
> +	.cr_id		= 3,
> +	.cr_sampling	= 0x11,
> +	.cr_qtable	= 1,
> +};
> +
> +static const struct jpeg_record_hdr luma_coeff_hdr = {
> +	.marker	= { 0xff, 0xc4 },
> +	.length	= { 0x00, 0xb5 },
> +};
> +
> +/*
> + * DC Luminance
> + *
> + * Typical tables for DC difference coding from  CCITT T.81
> + * specification K.3.3.1, page 162.
> + */

Like this - some kind of guidance what the hex numbers are all about. 
Fantastic.

> +static const struct jpeg_dc_coeff_desc luma_dc_coeff = {
> +	.index	= 0,
> +	.bits	= {
> +		0x00, 0x01, 0x05, 0x01, 0x01, 0x01, 0x01, 0x01,
> +		0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> +	},
> +	.values	= {
> +		0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
> +		0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b
> +	}
> +};
> +
> +/*
> + * AC Luminance
> + *
> + * Typical tables for AC coefficient coding from  CCITT T.81
> + * specification K.3.3.2, page 162.
> + */
> +static const struct jpeg_ac_coeff_desc luma_ac_coeff = {
> +	.index	= 0x10,
> +	.bits	= {
> +		0x00, 0x02, 0x01, 0x03, 0x03, 0x02, 0x04, 0x03,
> +		0x05, 0x05, 0x04, 0x04, 0x00, 0x00, 0x01, 0x7d
> +	},
> +	.values	= {
> +		0x01, 0x02, 0x03, 0x00, 0x04, 0x11, 0x05, 0x12, 0x21,
> +		0x31, 0x41, 0x06, 0x13, 0x51, 0x61, 0x07, 0x22, 0x71,
> +		0x14, 0x32, 0x81, 0x91, 0xa1, 0x08, 0x23, 0x42, 0xb1,
> +		0xc1, 0x15, 0x52, 0xd1, 0xf0, 0x24, 0x33, 0x62, 0x72,
> +		0x82, 0x09, 0x0a, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x25,
> +		0x26, 0x27, 0x28, 0x29, 0x2a, 0x34, 0x35, 0x36, 0x37,
> +		0x38, 0x39, 0x3a, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48,
> +		0x49, 0x4a, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59,
> +		0x5a, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6a,
> +		0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a, 0x83,
> +		0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x92, 0x93,
> +		0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9a, 0xa2, 0xa3,
> +		0xa4, 0xa5, 0xa6, 0xa7, 0xa8, 0xa9, 0xaa, 0xb2, 0xb3,
> +		0xb4, 0xb5, 0xb6, 0xb7, 0xb8, 0xb9, 0xba, 0xc2, 0xc3,
> +		0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xd2, 0xd3,
> +		0xd4, 0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda, 0xe1, 0xe2,
> +		0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9, 0xea, 0xf1,
> +		0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8, 0xf9, 0xfa
> +	}
> +};
> +
> +static const struct jpeg_record_hdr coeff_mono_hdr = {
> +	.marker = { 0xff, 0xc4 },
> +	.length = { 0x00, 0xd2 },
> +};

You have the right idea with the public standards references but yeah 
again closed magic numbers verboten.

> +
> +static const struct jpeg_record_hdr coeff_color_hdr = {
> +	.marker	= { 0xff, 0xc4 },
> +	.length	= { 0x01, 0xa2 },
> +};
> +
> +/* DC Chrominance */
> +static const struct jpeg_dc_coeff_desc chroma_dc_coeff = {
> +	.index	= 1,
> +	.bits	= {
> +		0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> +		0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
> +	},
> +	.values	= {
> +		0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
> +		0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b
> +	}
> +};
> +
> +/* AC Chrominance */
> +static const struct jpeg_ac_coeff_desc chroma_ac_coeff = {
> +	.index	= 0x11,
> +	.bits	= {
> +		0x00, 0x02, 0x01, 0x02, 0x04, 0x04, 0x03, 0x04,
> +		0x07, 0x05, 0x04, 0x04, 0x00, 0x01, 0x02, 0x77
> +	},
> +	.values	= {
> +		0x00, 0x01, 0x02, 0x03, 0x11, 0x04, 0x05, 0x21, 0x31,
> +		0x06, 0x12, 0x41, 0x51, 0x07, 0x61, 0x71, 0x13, 0x22,
> +		0x32, 0x81, 0x08, 0x14, 0x42, 0x91, 0xa1, 0xb1, 0xc1,
> +		0x09, 0x23, 0x33, 0x52, 0xf0, 0x15, 0x62, 0x72, 0xd1,
> +		0x0a, 0x16, 0x24, 0x34, 0xe1, 0x25, 0xf1, 0x17, 0x18,
> +		0x19, 0x1a, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x35, 0x36,
> +		0x37, 0x38, 0x39, 0x3a, 0x43, 0x44, 0x45, 0x46, 0x47,
> +		0x48, 0x49, 0x4a, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58,
> +		0x59, 0x5a, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69,
> +		0x6a, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a,
> +		0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8a,
> +		0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9a,
> +		0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7, 0xa8, 0xa9, 0xaa,
> +		0xb2, 0xb3, 0xb4, 0xb5, 0xb6, 0xb7, 0xb8, 0xb9, 0xba,
> +		0xc2, 0xc3, 0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca,
> +		0xd2, 0xd3, 0xd4, 0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda,
> +		0xe2, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9, 0xea,
> +		0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8, 0xf9, 0xfa
> +	}
> +};
> +
> +static const struct jpeg_record_hdr sos_mono_hdr = {
> +	.marker	= { 0xff, 0xda },
> +	.length	= { 0x00, 0x08 },
> +};
> +
> +static const struct jpeg_sos_mono sos_mono_data = {
> +	.components	= 1,
> +	.y_id		= 1,
> +	.y_tables	= 0x00,
> +	.spectral	= { 0x00, 0x3f },
> +	.approx		= 0x00,
> +};
> +
> +static const struct jpeg_record_hdr sos_color_hdr = {
> +	.marker	= { 0xff, 0xda },
> +	.length	= { 0x00, 0x0c },
> +};
> +
> +static const struct jpeg_sos_color sos_color_data = {
> +	.components	= 3,
> +	.y_id		= 1,
> +	.y_tables	= 0x00,
> +	.cb_id		= 2,
> +	.cb_tables	= 0x11,
> +	.cr_id		= 3,
> +	.cr_tables	= 0x11,
> +	.spectral	= { 0x00, 0x3f },
> +	.approx		= 0x00,
> +};
> +
> +static inline int jb_put_mem(struct jpeg_header_buf *b, const void *src, u32 len)
> +{
> +	if (len > b->size - b->pos)
> +		return -ENOSPC;
> +
> +	memcpy(b->ptr + b->pos, src, len);
> +	b->pos += len;
> +
> +	return 0;
> +}
> +
> +static inline void patch_u16be(u8 *buf, u32 off, u16 v)
> +{
> +	buf[off]	= (v >> 8) & 0xff;
> +	buf[off + 1]	=  v & 0xff;
> +}
> +
> +int qcom_jenc_header_init(struct qcom_jenc_header *c, u32 fourcc)
> +{
> +	int rc;
> +	struct jpeg_header_buf b = {
> +		.ptr = c->data,
> +		.size = sizeof(c->data),
> +		.pos = 0,
> +	};
> +
> +	c->sof_offset	= 0;
> +	c->dqt_one_offs = 0;
> +	c->dqt_two_offs = 0;
> +
> +	rc = jb_put_mem(&b, &soi_app0, sizeof(soi_app0));
> +	if (rc)
> +		return rc;
> +
> +	if (fourcc != V4L2_PIX_FMT_GREY) {
> +		rc = jb_put_mem(&b, &dqt_chroma_hdr, sizeof(dqt_chroma_hdr));
> +		if (rc)
> +			return rc;
> +
> +		/* Store the offset of the first DQT table for later use. */
> +		c->dqt_one_offs = b.pos;
> +		rc = jb_put_mem(&b, &dqt_luma_data, sizeof(dqt_luma_data));
> +		if (rc)
> +			return rc;
> +
> +		/* Store the offset of the second DQT table for later use. */
> +		c->dqt_two_offs = b.pos;
> +		rc = jb_put_mem(&b, &dqt_chroma_data, sizeof(dqt_chroma_data));
> +		if (rc)
> +			return rc;
> +	} else {
> +		rc = jb_put_mem(&b, &dqt_luma_hdr, sizeof(dqt_luma_hdr));
> +		if (rc)
> +			return rc;
> +
> +		/* Store the offset of the first DQT table for later use. */
> +		c->dqt_one_offs = b.pos;
> +		rc = jb_put_mem(&b, &dqt_luma_data, sizeof(dqt_luma_data));
> +		if (rc)
> +			return rc;
> +	}
> +
> +	/* Store the offset of the SOF record for later use. */
> +	c->sof_offset = b.pos;
> +
> +	if (fourcc != V4L2_PIX_FMT_GREY) {
> +		rc = jb_put_mem(&b, &sof0_color_hdr, sizeof(sof0_color_hdr));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &sof0_color_data, sizeof(sof0_color_data));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &coeff_color_hdr, sizeof(coeff_color_hdr));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &luma_dc_coeff, sizeof(luma_dc_coeff));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &luma_ac_coeff, sizeof(luma_ac_coeff));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &chroma_dc_coeff, sizeof(chroma_dc_coeff));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &chroma_ac_coeff, sizeof(chroma_ac_coeff));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &sos_color_hdr, sizeof(sos_color_hdr));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &sos_color_data, sizeof(sos_color_data));
> +		if (rc)
> +			return rc;
> +	} else {
> +		rc = jb_put_mem(&b, &sof0_mono_hdr, sizeof(sof0_mono_hdr));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &sof0_mono_data, sizeof(sof0_mono_data));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &coeff_mono_hdr, sizeof(coeff_mono_hdr));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &luma_dc_coeff, sizeof(luma_dc_coeff));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &luma_ac_coeff, sizeof(luma_ac_coeff));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &sos_mono_hdr, sizeof(sos_mono_hdr));
> +		if (rc)
> +			return rc;
> +		rc = jb_put_mem(&b, &sos_mono_data, sizeof(sos_mono_data));
> +		if (rc)
> +			return rc;
> +	}
> +
> +	c->size = b.pos;
> +
> +	return 0;
> +}
> +
> +void qcom_jenc_dqts_emit(const struct qcom_jenc_header *c, u8 *dst)
> +{
> +	/* Propagate DQT tables into the JPEG header */
> +	if (c->dqt_one_offs) {
> +		u32 one_offs = c->dqt_one_offs + sizeof(dqt_luma_data.index);
> +
> +		memcpy(dst + one_offs, &c->data[one_offs], sizeof(dqt_luma_data.value));
> +	}
> +
> +	if (c->dqt_two_offs) {
> +		u32 two_offs = c->dqt_two_offs + sizeof(dqt_chroma_data.index);
> +
> +		memcpy(dst + two_offs, &c->data[two_offs], sizeof(dqt_chroma_data.value));
> +	}
> +}
> +
> +u32 qcom_jenc_header_emit(const struct qcom_jenc_header *c, u8 *dst, u32 dst_size, u16 width,
> +			  u16 height)
> +{
> +	/* Copy JFIF into JPEG header and update actual image size */
> +	if (dst_size < c->size)
> +		return 0;
> +
> +	memcpy(dst, c->data, c->size);
> +
> +	/* Update output image size */
> +	patch_u16be(dst, c->sof_offset + JFIF_HEADER_WIDTH_OFFS, width);
> +	patch_u16be(dst, c->sof_offset + JFIF_HEADER_HEIGHT_OFFS, height);
> +
> +	return c->size;
> +}
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
> new file mode 100644
> index 000000000000..0c5fcc69e7cd
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_HDR_H
> +#define QCOM_JENC_HDR_H
> +
> +#include <linux/types.h>
> +
> +#include "qcom_jenc_defs.h"
> +
> +#define JPEG_QDT_LENGTH	64
> +#define JPEG_HEADER_MAX	1024
> +
> +struct qcom_jenc_header {
> +	u8  data[JPEG_HEADER_MAX];
> +	u32 size;
> +	u32 sof_offset;
> +	u32 dqt_one_offs;
> +	u32 dqt_two_offs;
> +};
> +
> +struct jpeg_record_hdr {
> +	u8 marker[2];
> +	u8 length[2];
> +} __packed;
> +
> +struct jpeg_dqt_header {
> +	u8 index;
> +	u8 value[JPEG_QDT_LENGTH];
> +} __packed;
> +
> +struct jpeg_soi_app0 {
> +	u8 soi[2];
> +	u8 app0_marker[2];
> +	u8 app0_length[2];
> +	u8 jfif_id[5];
> +	u8 version[2];
> +	u8 units;
> +	u8 density_x[2];
> +	u8 density_y[2];
> +	u8 thumb_x;
> +	u8 thumb_y;
> +} __packed;
> +
> +struct jpeg_sof0_mono {
> +	u8 precision;
> +	u8 height[2];
> +	u8 width[2];
> +	u8 components;
> +
> +	u8 y_id;
> +	u8 y_sampling;
> +	u8 y_qtable;
> +} __packed;

OK so we can establish these are hardware / firmware specific 
data-strcutures and => again no magic numbers.

I'm an athiest, I don't do magic.


> +struct jpeg_sof0_color {
> +	u8 precision;
> +	u8 height[2];
> +	u8 width[2];
> +	u8 components;
> +
> +	u8 y_id;
> +	u8 y_sampling;
> +	u8 y_qtable;
> +
> +	u8 cb_id;
> +	u8 cb_sampling;
> +	u8 cb_qtable;
> +
> +	u8 cr_id;
> +	u8 cr_sampling;
> +	u8 cr_qtable;
> +} __packed;
> +
> +struct jpeg_dc_coeff_desc {
> +	u8 index;
> +	u8 bits[16];
> +	u8 values[12];
> +} __packed;
> +
> +struct jpeg_ac_coeff_desc {
> +	u8 index;
> +	u8 bits[16];
> +	u8 values[162];
> +} __packed;
> +
> +struct jpeg_sos_hdr {
> +	u8 sos_marker[2];
> +	u8 sos_length[2];
> +	u8 components;
> +} __packed;
> +
> +struct jpeg_sos_mono {
> +	u8 components;
> +
> +	u8 y_id;
> +	u8 y_tables;
> +
> +	u8 spectral[2];
> +	u8 approx;
> +} __packed;
> +
> +struct jpeg_sos_color {
> +	u8 components;
> +
> +	u8 y_id;
> +	u8 y_tables;
> +
> +	u8 cb_id;
> +	u8 cb_tables;
> +
> +	u8 cr_id;
> +	u8 cr_tables;
> +
> +	u8 spectral[2];
> +	u8 approx;
> +} __packed;
> +
> +struct jenc_context;
> +
> +int qcom_jenc_header_init(struct qcom_jenc_header *c, u32 fourcc);
> +
> +void qcom_jenc_dqts_emit(const struct qcom_jenc_header *c, u8 *dst);
> +
> +u32 qcom_jenc_header_emit(const struct qcom_jenc_header *c, u8 *dst, u32 dst_size, u16 width,
> +			  u16 height);
> +
> +#endif /* QCOM_JENC_HDR_H */

This really is a very large amount of code for one single patch.

Please break it up a bit.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
> new file mode 100644
> index 000000000000..92e3c09df3d1
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
> @@ -0,0 +1,1522 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <asm/div64.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "qcom_jenc_dev.h"
> +#include "qcom_jenc_ops.h"
> +#include "qcom_jenc_defs.h"
> +
> +#define JPEG_RESET_TIMEOUT_MS	300
> +#define JPEG_STOP_TIMEOUT_MS	200
> +
> +#define JPEG_DQT_SHIFT		20
> +#define JPEG_Q5_21_SHIFT	21
> +
> +#define JPEG_MCU_BLOCK_8	8
> +#define JPEG_MCU_BLOCK_16	16
> +#define JPEG_MCU_BLOCK_128	128
> +#define JPEG_MCU_BLOCK_256	256
> +
> +#define JPEG_DEFAULT_SCALE_STEP	0x200000
> +
> +#define JPEG_U32_CLR	(0U)
> +#define JPEG_U32_SET	(~0U)
> +
> +/*
> + *  JPEG | V4L2
> + *  ---- | -------
> + *  H1V1 | GREY
> + *  H1V2 | YUV422M
> + *  H2V1 | NV16M
> + *  H2V2 | NV12M
> + */
> +enum qcom_jpeg_encode_fmt {
> +	JPEG_ENCODE_H1V1 = 0,
> +	JPEG_ENCODE_H1V2,
> +	JPEG_ENCODE_H2V1,
> +	JPEG_ENCODE_H2V2,
> +	JPEG_ENCODE_MONO,
> +};
> +
> +enum qcom_jpeg_memory_fmt {
> +	JPEG_MEM_FMT_PLANAR	 = 0x0,
> +	JPEG_MEM_FMT_PPLANAR	 = 0x1,
> +	JPEG_MEM_FMT_MONO	 = 0x2,
> +	JPEG_MEM_FMT_COEFFICIENT = 0x3
> +};
> +
> +enum jpeg_mal_bounds {
> +	JPEG_CFG_MAL_BOUND_32_BYTES	= 0x0,
> +	JPEG_CFG_MAL_BOUND_64_BYTES	= 0x1,
> +	JPEG_CFG_MAL_BOUND_128_BYTES	= 0x2,
> +	JPEG_CFG_MAL_BOUND_256_BYTES	= 0x3,
> +	JPEG_CFG_MAL_BOUND_512_BYTES	= 0x4,
> +	JPEG_CFG_MAL_BOUND_1K_BYTES	= 0x5,
> +	JPEG_CFG_MAL_BOUND_2K_BYTES	= 0x6,
> +	JPEG_CFG_MAL_BOUND_4K_BYTES	= 0x7
> +};
> +
> +struct qcom_jpeg_scale_blocks {
> +	u8 w_block[QCOM_JPEG_MAX_PLANES];
> +	u8 h_block[QCOM_JPEG_MAX_PLANES];
> +};
> +
> +struct qcom_jpeg_mal_boundary {
> +	u32 bytes;
> +	int boundary;
> +};
> +
> +struct qcom_jpeg_formats {
> +	u32 fourcc;
> +	enum qcom_jpeg_encode_fmt encode;
> +	enum qcom_jpeg_memory_fmt memory;
> +};
> +
> +/*
> + * Luminance quantization table defined by CCITT T.81.
> + * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> + */
> +static const u8 t81k1_dct_luma_table[JPEG_QDT_LENGTH] = {
> +	16,  11,  10,  16,  24,  40,  51,  61,
> +	12,  12,  14,  19,  26,  58,  60,  55,
> +	14,  13,  16,  24,  40,  57,  69,  56,
> +	14,  17,  22,  29,  51,  87,  80,  62,
> +	18,  22,  37,  56,  68, 109, 103,  77,
> +	24,  35,  55,  64,  81, 104, 113,  92,
> +	49,  64,  78,  87, 103, 121, 120, 101,
> +	72,  92,  95,  98, 112, 100, 103,  99
> +};
> +
> +/*
> + * Chrominance quantization table defined by CCITT T.81.
> + * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> + */
> +static const u8 t81k2_dct_chroma_table[JPEG_QDT_LENGTH] = {
> +	17,  18,  24,  47,  99,  99,  99,  99,
> +	18,  21,  26,  66,  99,  99,  99,  99,
> +	24,  26,  56,  99,  99,  99,  99,  99,
> +	47,  66,  99,  99,  99,  99,  99,  99,
> +	99,  99,  99,  99,  99,  99,  99,  99,
> +	99,  99,  99,  99,  99,  99,  99,  99,
> +	99,  99,  99,  99,  99,  99,  99,  99,
> +	99,  99,  99,  99,  99,  99,  99,  99
> +};
> +
> +/*
> + * Zig-zag scan order for quantized DCT coefficients
> + * as defined by CCITT T.81.
> + * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> + */
> +static const u8 t81a6_dct_zig_zag_table[] = {
> +	 0,  1,  5,  6, 14, 15, 27, 28,
> +	 2,  4,  7, 13, 16, 26, 29, 42,
> +	 3,  8, 12, 17, 25, 30, 41, 43,
> +	 9, 11, 18, 24, 31, 40, 44, 53,
> +	10, 19, 23, 32, 39, 45, 52, 54,
> +	20, 22, 33, 38, 46, 51, 55, 60,
> +	21, 34, 37, 47, 50, 56, 59, 61,
> +	35, 36, 48, 49, 57, 58, 62, 63
> +};
> +
> +static const u8 jpeg_mcu_per_ratio[] = {
> +	0, /* MCU = 1, Ratio < 2x	 */
> +	3, /* MCU = 0, 2x <= Ratio < 4x	 */
> +	2, /* MCU = 0, 4x <= Ratio < 8x	 */
> +	1, /* MCU = 0, 8x <= Ratio < 16x */
> +	0, /* MCU = 0, Ratio > 16x	 */
> +};
> +
> +static const struct qcom_jpeg_formats jpeg_encode_fmt[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_GREY,
> +		.encode = JPEG_ENCODE_MONO,
> +		.memory = JPEG_MEM_FMT_MONO
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_JPEG,
> +		.encode = JPEG_ENCODE_H1V1,
> +		.memory = JPEG_MEM_FMT_PPLANAR
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_YUV422M,
> +		.encode = JPEG_ENCODE_H1V2,
> +		.memory = JPEG_MEM_FMT_PLANAR
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_YVU422M,
> +		.encode = JPEG_ENCODE_H1V2,
> +		.memory = JPEG_MEM_FMT_PLANAR
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV16M,
> +		.encode = JPEG_ENCODE_H2V1,
> +		.memory = JPEG_MEM_FMT_PPLANAR
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV61M,
> +		.encode = JPEG_ENCODE_H2V1,
> +		.memory = JPEG_MEM_FMT_PPLANAR
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12M,
> +		.encode = JPEG_ENCODE_H2V2,
> +		.memory = JPEG_MEM_FMT_PPLANAR
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV21M,
> +		.encode = JPEG_ENCODE_H2V2,
> +		.memory = JPEG_MEM_FMT_PPLANAR
> +	}
> +};
> +
> +static const struct qcom_jpeg_mal_boundary jpeg_mal_bounds[] = {
> +	{ .bytes =   32, .boundary = JPEG_CFG_MAL_BOUND_32_BYTES  },
> +	{ .bytes =   64, .boundary = JPEG_CFG_MAL_BOUND_64_BYTES  },
> +	{ .bytes =  128, .boundary = JPEG_CFG_MAL_BOUND_128_BYTES },
> +	{ .bytes =  256, .boundary = JPEG_CFG_MAL_BOUND_256_BYTES },
> +	{ .bytes =  512, .boundary = JPEG_CFG_MAL_BOUND_512_BYTES },
> +	{ .bytes = 1024, .boundary = JPEG_CFG_MAL_BOUND_1K_BYTES  },
> +	{ .bytes = 4096, .boundary = JPEG_CFG_MAL_BOUND_4K_BYTES  }
> +};
> +
> +static const struct qcom_jpeg_scale_blocks jpeg_mcu_blocks[] = {
> +	[JPEG_ENCODE_H1V1] = {
> +		.w_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
> +		.h_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
> +	},
> +	[JPEG_ENCODE_H1V2] = {
> +		.w_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8  },
> +		.h_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
> +	},
> +	[JPEG_ENCODE_H2V1] = {
> +		.w_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
> +		.h_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8  },
> +	},
> +	[JPEG_ENCODE_H2V2] = {
> +		.w_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
> +		.h_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
> +	},
> +	[JPEG_ENCODE_MONO] = {
> +		.w_block = { JPEG_MCU_BLOCK_8 },
> +		.h_block = { JPEG_MCU_BLOCK_8 }
> +	},
> +};
> +
> +static inline int jpeg_get_memory_fmt(u32 fourcc)
> +{
> +	u32 fi;
> +
> +	for (fi = 0; fi < ARRAY_SIZE(jpeg_encode_fmt); fi++) {
> +		if (jpeg_encode_fmt[fi].fourcc == fourcc)
> +			return jpeg_encode_fmt[fi].memory;
> +	}
> +
> +	return -EINVAL;

EINVAL or ENODEV ENOTSUPP?

Its up to you actually I don't think it makes a real difference.

> +}
> +
> +static inline int jpeg_get_encode_fmt(u32 fourcc)
> +{
> +	u32 fi;
> +
> +	for (fi = 0; fi < ARRAY_SIZE(jpeg_encode_fmt); fi++) {
> +		if (jpeg_encode_fmt[fi].fourcc == fourcc)
> +			return jpeg_encode_fmt[fi].encode;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static inline int jpeg_get_mal_boundary(u32 width, const struct qcom_jpeg_mal_boundary *table,
> +					u32 count)
> +{
> +	u32 bi;
> +
> +	if (!table || !count)
> +		return -EINVAL;

So either trust table and count (or) test to make sure count doesn't 
exceed your expected boundary of table[count - 1]

Either we trust the values coming in here or we should check them all.

In particular the table[index - 1] makes me wonder how/where we have 
verified count with respect to the extent of table[].

> +
> +	for (bi = 0; bi < count; bi++) {
> +		if (table[bi].bytes > width)
> +			break;
> +	}
> +
> +	if (!bi)
> +		return table[0].boundary;
> +
> +	return table[bi - 1].boundary;
> +}
> +
> +static inline u8 jpeg_get_mcu_per_block(u32 src_size, u32 dst_size)
> +{
> +	u8 h_rto;
> +
> +	if (!src_size || !dst_size)
> +		return 0;

I get the error checking part but is it _sensible_ to have either 
src_size or dst_size be zero and then return 0 as a result ?

> +
> +	/* Calculate scale factor */
> +	h_rto = max(src_size, dst_size) / min(src_size, dst_size);
> +
> +	if (h_rto >= 0 && h_rto < 2)
> +		return jpeg_mcu_per_ratio[0];
> +	else if (h_rto >= 2 && h_rto < 4)
> +		return jpeg_mcu_per_ratio[1];
> +	else if (h_rto >= 4 && h_rto < 8)
> +		return jpeg_mcu_per_ratio[2];
> +	else if (h_rto >= 8 && h_rto < 16)
> +		return jpeg_mcu_per_ratio[3];
> +
> +	return jpeg_mcu_per_ratio[4];
> +}
> +
> +static inline int jpeg_get_mcu_geometry(enum qcom_jpeg_encode_fmt fmt, u32 width, u32 height,
> +					u32 *blk_w, u32 *blk_h, u32 *mcu_cols, u32 *mcu_rows)
> +{
> +	const struct qcom_jpeg_scale_blocks *blks;
> +	u32 bw = 0, bh = 0;
> +	u8 pln;
> +
> +	if (!width || !height)
> +		return -EINVAL;

I'm not going to keep challenging these defensive coding practices, the 
question is why can we get this far into your code where width or height 
can have unexpected values and why does that justify getting thrown up 
the callstack as an error.

Ditto with the previous function - why is returning 0 a valid value to 
throw up the call stack and does the calling function know what to do 
with that ?

Better to validiate width, height, src_width, src_height when you input 
them from elsewhere in the kernel or userspace _once_ or any time up 
update them, than to consume values and pass those values down to 
functions which can reject their size.

> +
> +	blks = &jpeg_mcu_blocks[fmt];
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		bw = max(bw, blks->w_block[pln]);
> +		bh = max(bh, blks->h_block[pln]);
> +	}
> +
> +	if (!bw || !bh)
> +		return -EINVAL;

For example this check makes way more sense to me. You're reading the 
value from a buffer so it makes sense to validate that but validating 
the input just to me says the input _ought_ to have been validated way 
earlier.

> +
> +	if (blk_w)
> +		*blk_w = bw;
> +	if (blk_h)
> +		*blk_h = bh;
> +
> +	if (mcu_cols)
> +		*mcu_cols = ALIGN(width, bw) / bw;
> +
> +	if (mcu_rows)
> +		*mcu_rows = ALIGN(height, bh) / bh;
> +
> +	return 0;
> +}
> +
> +/* Integer part of scale */
> +static inline s32 jpeg_calc_scale_int(u32 in_width, u32 out_width)
> +{
> +	if (!out_width)
> +		return 0;

no

> +
> +	return (s32)(in_width / out_width);
> +}
> +
> +/* Fractional part od scale */
> +static inline u32 jpeg_calc_scale_frac(u32 in_width, u32 out_width)
> +{
> +	u32 remainder = in_width % out_width;
> +
> +	if (!out_width)
> +		return 0;
> +
> +	/* 64-bit to avoid overflow during shift */
> +	return (u32)(((u64)remainder << JPEG_Q5_21_SHIFT) / out_width);
> +}
> +
> +static inline s32 jpeg_calc_q5_21(s32 int_part, u32 frac_part)
> +{
> +	return ((s32)((u32)int_part << JPEG_Q5_21_SHIFT)) | (frac_part & ((1u << 21) - 1));
> +}
> +
> +static inline u32 jpeg_io_read(struct qcom_jenc_dev *jenc, u32 offset)
> +{
> +	u32 data;
> +
> +	rmb();	/* Preventing concurrency read/write interference */
> +	data = readl_relaxed(jenc->jpeg_base + offset);

I'm a big fan of telling people to "just relax man" but in this case I'd 
like to understand your use case for relaxed read/writes full stop.

> +
> +	return data;
> +}
> +
> +static inline void jpeg_io_write(struct qcom_jenc_dev *jenc, u32 offset, u32 value)
> +{
> +	wmb();	/* Preventing concurrency read/write interference */

Why do relaxed writes at all ?

A better model is

{
write_relaxed();
write_relaxed();

wmb();
}

> +	writel_relaxed(value, jenc->jpeg_base + offset);

To me what you have here implies you fear you have a bunch of relaxed 
writes and you aren't really sure if they have been sequenced over the 
fabric to their destination.

Which to me is an argument not to do any relaxed writes at all.


> +}
> +
> +/*
> + * Runtime bitfield helpers (for non-constant masks).
> + *
> + * Requirements:
> + *  - mask must be non-zero
> + *  - mask must be contiguous (e.g. 0x7u << n)
> + */
> +
> +static inline u32 jpeg_bits_get(u32 mask, u32 reg)
> +{
> +	return (reg & mask) >> __builtin_ctz(mask);
> +}
> +
> +static inline u32 jpeg_bits_set(u32 mask, u32 val)
> +{
> +	return (val << __builtin_ctz(mask)) & mask;
> +}
> +
> +static inline u32 jpeg_rd_bits(struct qcom_jenc_dev *jenc, u32 offs, enum qcom_jpeg_mask_id mid)
> +{
> +	u32 reg  = jpeg_io_read(jenc, offs);
> +	u32 mask = jenc->res->hw_mask[mid];
> +
> +	return jpeg_bits_get(mask, reg);
> +}
> +
> +/*
> + * Read-modify-write (for R/W registers)
> + */
> +static inline void jpeg_rw_bits(struct qcom_jenc_dev *jenc, u32 offs, enum qcom_jpeg_mask_id mid,
> +				u32 val)
> +{
> +	u32 reg  = jpeg_io_read(jenc, offs);
> +	u32 mask = jenc->res->hw_mask[mid];
> +
> +	reg &= ~mask;
> +	reg |= jpeg_bits_set(mask, val);
> +
> +	jpeg_io_write(jenc, offs, reg);
> +}
> +
> +/*
> + * Write-only variant (for write only registers)
> + */
> +static inline void jpeg_wo_bits(struct qcom_jenc_dev *jenc, u32 offs, enum qcom_jpeg_mask_id mid,
> +				u32 val)
> +{
> +	u32 mask = jenc->res->hw_mask[mid];
> +
> +	jpeg_io_write(jenc, offs, jpeg_bits_set(mask, val));
> +}
> +
> +static u8 jpeg_calculate_dqt(struct jenc_context *ectx, u8 dqt_value)
> +{
> +	u64 ratio;
> +	u8 calc_val;
> +
> +	ratio = (QCOM_JPEG_QUALITY_MAX - ectx->quality_requested) << JPEG_DQT_SHIFT;
> +	ratio = max_t(u64, 1, ratio);
> +	do_div(ratio, QCOM_JPEG_QUALITY_MID);
> +
> +	calc_val = DIV64_U64_ROUND_CLOSEST(ratio * dqt_value, 1LU << JPEG_DQT_SHIFT);
> +
> +	return max_t(u8, 1, calc_val);
> +}
> +
> +static void jpeg_apply_dmi_table(struct jenc_context *ectx)
> +{
> +	const struct qcom_jpeg_reg_offs *offs = ectx->jenc->res->hw_offs;
> +	u32 pcfg = { 0x00000011 };
> +	u32 addr = { 0x00000000 };
> +	u8 *base;
> +	u8 dqt_val, idx;
> +	u32 reg_val;
> +	int i;
> +
> +	/* DMI upload start sequence */
> +	jpeg_io_write(ectx->jenc, offs->dmi_addr, addr);
> +	jpeg_io_write(ectx->jenc, offs->dmi_cfg, pcfg);
> +
> +	/* DMI Luma upload */
> +	base = &ectx->hdr_cache.data[ectx->hdr_cache.dqt_one_offs + 1];
> +	for (i = 0; i < ARRAY_SIZE(t81k1_dct_luma_table); i++) {
> +		dqt_val = jpeg_calculate_dqt(ectx, t81k1_dct_luma_table[i]);
> +		/*
> +		 * Store the luma to be propagated to the JPEG header at a later stage.
> +		 * If offs == 0, no DQT is present in the header and the write
> +		 * should be skipped.
> +		 */
> +		if (ectx->hdr_cache.dqt_one_offs) {
> +			idx = t81a6_dct_zig_zag_table[i];
> +			/* Perform reordering to arrange transformed DQT in a zigzag pattern */
> +			base[idx] = dqt_val;
> +		}
> +		/* The calculated DQT value cannot be less than 1 */
> +		reg_val = div_u64(U16_MAX + 1U, dqt_val);
> +		jpeg_io_write(ectx->jenc, offs->dmi_data, clamp_t(u32, reg_val, 0, U16_MAX));
> +	}
> +
> +	/* DMI Chroma upload */
> +	base = &ectx->hdr_cache.data[ectx->hdr_cache.dqt_two_offs + 1];
> +	for (i = 0; i < ARRAY_SIZE(t81k2_dct_chroma_table); i++) {
> +		dqt_val = jpeg_calculate_dqt(ectx, t81k2_dct_chroma_table[i]);
> +		/*
> +		 * Store the chroma to be propagated to the JPEG header at a later stage.
> +		 * If offs == 0, no DQT is present in the header and the write
> +		 * should be skipped.
> +		 */
> +		if (ectx->hdr_cache.dqt_two_offs) {
> +			idx = t81a6_dct_zig_zag_table[i];
> +			/* Perform reordering to arrange transformed DQT in a zigzag pattern */
> +			base[idx] = dqt_val;
> +		}
> +		/* The calculated DQT value cannot be less than 1 */
> +		reg_val = div_u64(U16_MAX + 1U, dqt_val);
> +		jpeg_io_write(ectx->jenc, offs->dmi_data, clamp_t(u32, reg_val, 0, U16_MAX));
> +	}
> +
> +	/* DMI upload end sequence */
> +	jpeg_io_write(ectx->jenc, offs->dmi_cfg, addr);
> +
> +	ectx->quality_programmed = ectx->quality_requested;
> +
> +	dev_dbg(ectx->dev, "%s: ctx=%p quality_programmed=%d\n", __func__, ectx,
> +		ectx->quality_programmed);

For dbg __func__ is fine though.

> +}
> +
> +static void jpeg_cpu_access(struct device *dev, struct qcom_jpeg_buff *frame,
> +			    enum dma_data_direction direction)
> +{
> +	u8 pln;
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		struct sg_table	*sgt = frame->plns[pln].sgt;
> +
> +		if (!frame->plns[pln].dma || !sgt)
> +			break;
> +
> +		dma_sync_sg_for_cpu(dev, sgt->sgl, sgt->orig_nents, direction);
> +	}
> +}
> +
> +static void jpeg_dev_access(struct device *dev, struct qcom_jpeg_buff *frame,
> +			    enum dma_data_direction direction)
> +{
> +	u8 pln;
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		struct sg_table	*sgt = frame->plns[pln].sgt;
> +
> +		if (!frame->plns[pln].dma || !sgt)
> +			continue;
> +
> +		dma_sync_sg_for_device(dev, sgt->sgl, sgt->orig_nents, direction);
> +	}
> +}
> +
> +static int jpeg_init(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_jpeg_reg_offs *offs;
> +	void __iomem *mem_base;
> +	unsigned long rtime;
> +	u32 hw_ver;
> +
> +	if (!jenc || !jenc->dev || !jenc->jpeg_base || !jenc->res->hw_offs) {
> +		pr_err("encoder HW init failed\n");
> +		return -EINVAL;
> +	}

Don't pass !jenc to this function ... please reconsider the defensive 
programming approach here and validate at input source once with 
subsequent trust.

> +
> +	offs	 = jenc->res->hw_offs;
> +	mem_base = jenc->jpeg_base;
> +
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
> +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_RESET_ACK, JPEG_U32_SET);
> +
> +	reinit_completion(&jenc->reset_complete);
> +
> +	jpeg_wo_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_COMMON, JPEG_U32_SET);
> +
> +	rtime = wait_for_completion_timeout(&jenc->reset_complete,
> +					    msecs_to_jiffies(JPEG_RESET_TIMEOUT_MS));
> +	if (!rtime) {
> +		dev_err(jenc->dev, "encoder HW reset timeout\n");
> +		disable_irq(jenc->irq);
> +		return -ETIME;
> +	}
> +
> +	hw_ver = jpeg_io_read(jenc, offs->hw_version);
> +	dev_info(jenc->dev, "JPEG HW encoder version %d.%d.%d\n",
> +		 jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_VER_MAJOR], hw_ver),
> +		 jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_VER_MINOR], hw_ver),
> +		 jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_VER_STEP], hw_ver));
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_U32_SET);
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_U32_CLR);
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_U32_SET);
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_U32_CLR);
> +
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
> +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_ENABLE_ALL, JPEG_U32_SET);
> +
> +	return 0;
> +}
> +
> +static int jpeg_exec(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_START, 1);
> +
> +	return 0;
> +}
> +
> +static void jpeg_stop(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_START, 0);
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_U32_SET);
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_U32_CLR);
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_U32_SET);
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_U32_CLR);
> +
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
> +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_ENABLE_ALL, JPEG_U32_SET);
> +}
> +
> +static int jpeg_deinit(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	unsigned long rtime;
> +
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
> +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_STOP_ACK, JPEG_U32_SET);
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_STOP, 1);
> +
> +	reinit_completion(&jenc->stop_complete);
> +	rtime = wait_for_completion_timeout(&jenc->stop_complete,
> +					    msecs_to_jiffies(JPEG_STOP_TIMEOUT_MS));
> +	if (!rtime) {
> +		dev_err(jenc->dev, "encoder HW stop timeout\n");
> +		return -ETIME;
> +	}

Aren't you missing an IRQ disable like you have on the error path of the 
init(); ?

> +
> +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_DISABLE_ALL, JPEG_U32_CLR);
> +	jpeg_rw_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
> +
> +	return 0;
> +}
> +
> +static int jpeg_apply_fe_addr(struct jenc_context *ectx, struct qcom_jenc_queue *q,
> +			      struct vb2_buffer *vb)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct qcom_jpeg_buff *frame = &q->buff[vb->index];
> +	struct v4l2_pix_format_mplane *fmt = &q->vf;
> +	u8 pln = 0;
> +
> +	if (WARN_ON_ONCE(!frame->plns[pln].dma))
> +		return -EPERM;
> +
> +	for (pln = 0; pln < fmt->num_planes; pln++) {
> +		if (!frame->plns[pln].sgt || !frame->plns[pln].sgt->sgl)
> +			break;
> +
> +		jpeg_io_write(jenc, offs->fe.pntr[pln], frame->plns[pln].dma);
> +		jpeg_io_write(jenc, offs->fe.offs[pln], 0);
> +
> +		dev_dbg(jenc->dev, "%s: pln=%d addr=0x%llx idx:%d\n", __func__,
> +			pln, frame->plns[pln].dma, vb->index);
> +	}
> +
> +	q->buff_id = vb->index;
> +
> +	jpeg_dev_access(jenc->dev, frame, DMA_TO_DEVICE);
> +
> +	return 0;
> +}
> +
> +static int jpeg_store_fe_next(struct jenc_context *ectx, struct vb2_buffer *vb2)
> +{
> +	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb2->type)];
> +	struct qcom_jpeg_buff *buff = &q->buff[vb2->index];
> +	u8 pln = 0;
> +
> +	buff->plns[pln].sgt = vb2_dma_sg_plane_desc(vb2, pln);
> +	if (WARN_ON_ONCE(!buff->plns[pln].sgt))
> +		return -EINVAL;
> +
> +	if (WARN_ON_ONCE(!buff->plns[pln].sgt->sgl))
> +		return -EINVAL;
> +
> +	buff->plns[pln].dma = sg_dma_address(buff->plns[pln].sgt->sgl);
> +	if (WARN_ON_ONCE(!buff->plns[pln].dma))
> +		return -EINVAL;
> +
> +	buff->plns[pln].size = vb2_plane_size(vb2, pln);
> +	if (WARN_ON_ONCE(!buff->plns[pln].size))
> +		return -EINVAL;

Why are all of these WARN_ONCE they seem like errors - at least some of 
them ..

> +
> +	for (pln = 1; pln < q->vf.num_planes; pln++) {
> +		buff->plns[pln].sgt = vb2_dma_sg_plane_desc(vb2, pln);
> +		if (WARN_ON_ONCE(!buff->plns[pln].sgt || !buff->plns[pln].sgt->sgl))
> +			return -EINVAL;
> +
> +		buff->plns[pln].dma = sg_dma_address(buff->plns[pln].sgt->sgl);
> +		if (WARN_ON_ONCE(!buff->plns[pln].dma))
> +			return -EINVAL;
> +
> +		buff->plns[pln].size = vb2_plane_size(vb2, pln);
> +		if (WARN_ON_ONCE(!buff->plns[pln].size))
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_fe_size(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	struct v4l2_pix_format_mplane *sfmt = &q->vf;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	u8 pln;
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_WIDTH, 0);
> +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_HEIGHT, 0);
> +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_STRIDE, 0);
> +	}
> +
> +	for (pln = 0; pln < sfmt->num_planes; pln++) {
> +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_WIDTH,
> +			     sfmt->width  - 1);
> +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_HEIGHT,
> +			     sfmt->height  - 1);
> +		jpeg_rw_bits(jenc, offs->fe.stride[pln], JMSK_PLNS_RD_STRIDE,
> +			     sfmt->plane_fmt[pln].bytesperline);
> +
> +		dev_dbg(ectx->dev, "%s: ctx=%p pln=%d width=%d height=%d stride=%d\n",
> +			__func__, ectx, pln,
> +			jpeg_rd_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_WIDTH),
> +			jpeg_rd_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_HEIGHT),
> +			jpeg_rd_bits(jenc, offs->fe.stride[pln], JMSK_PLNS_RD_STRIDE));
> +	}
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_fe_hinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	struct v4l2_pix_format_mplane *sfmt = &q->vf;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	u8 pln;
> +
> +	if (!sfmt->width) {
> +		dev_err(ectx->dev, "%s: invalid source width=%d\n", __func__, sfmt->width);
> +		return -EINVAL;
> +	}
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
> +		jpeg_io_write(jenc, offs->fe.hinit[pln], 0);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_fe_vinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	struct v4l2_pix_format_mplane *sfmt = &q->vf;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	u8 pln;
> +
> +	if (!sfmt->height) {
> +		dev_err(ectx->dev, "%s: invalid source height=%d\n", __func__, sfmt->height);
> +		return -EINVAL;
> +	}
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
> +		jpeg_io_write(jenc, offs->fe.vinit[pln], 0);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_fe_params(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	struct v4l2_pix_format_mplane *sfmt = &q->vf;
> +	struct v4l2_pix_format_mplane *dfmt = &ectx->bufq[JENC_DST_QUEUE].vf;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	u8 expected_planes, pln;
> +	int rval;
> +
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MAL_EN, 1);
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_BOTTOM_VPAD_EN, 1);
> +
> +	rval = jpeg_get_memory_fmt(sfmt->pixelformat);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "%s: invalid memory format for v4l2 format:0x%x\n",
> +			__func__, sfmt->pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	switch (rval) {
> +	case JPEG_MEM_FMT_MONO:
> +		expected_planes = 1;
> +		break;
> +	case JPEG_MEM_FMT_PPLANAR:
> +		expected_planes = 2;
> +		break;
> +	case JPEG_MEM_FMT_PLANAR:
> +		expected_planes = 3;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (sfmt->num_planes != expected_planes) {
> +		dev_err(ectx->dev, "%s: plane mismatch fmt=%u expected=%u got=%u\n",
> +			__func__, rval, expected_planes, sfmt->num_planes);

Drop the __funcs__ for non dev_dbg() cases.

> +		return -EINVAL;
> +	}
> +
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MEMORY_FORMAT, rval);
> +
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN0_EN, 0);
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN1_EN, 0);
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN2_EN, 0);
> +
> +	if (sfmt->width == dfmt->width && sfmt->height == dfmt->height) {
> +		/* No scaling */
> +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_SIXTEEN_MCU_EN, 1);
> +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MCUS_PER_BLOCK, 0);
> +	} else {
> +		u8 mcu_per_blks;
> +
> +		/* Scaling */
> +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_SIXTEEN_MCU_EN, 0);
> +		/* get value according to image width */
> +		mcu_per_blks = jpeg_get_mcu_per_block(sfmt->width, dfmt->width);
> +		/* get value according to image height assign the bigger */
> +		mcu_per_blks = max_t(u8, mcu_per_blks,
> +				     jpeg_get_mcu_per_block(sfmt->height, dfmt->height));
> +
> +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MCUS_PER_BLOCK, mcu_per_blks);
> +	}
> +
> +	dev_dbg(ectx->dev, "%s: sixteen MCU enabled=%d, %d MCU per blocks\n", __func__,
> +		jpeg_rd_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_SIXTEEN_MCU_EN),
> +		jpeg_rd_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MCUS_PER_BLOCK));
> +
> +	rval = jpeg_get_mal_boundary(sfmt->width, jpeg_mal_bounds, ARRAY_SIZE(jpeg_mal_bounds));
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "%s: failed to get FE mal boundary width=%u\n", __func__,
> +			sfmt->width);
> +		return -EINVAL;
> +	}
> +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MAL_BOUNDARY, rval);
> +
> +	dev_dbg(ectx->dev, "%s: optimal FE mal boundary=%d\n", __func__,
> +		jpeg_rd_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MAL_BOUNDARY));
> +
> +	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "%s: unsupported encode format fourcc=0x%x\n",
> +			__func__, sfmt->pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	switch (rval) {
> +	case JPEG_ENCODE_MONO:
> +	case JPEG_ENCODE_H1V1:
> +	case JPEG_ENCODE_H2V1:
> +		jpeg_rw_bits(jenc, offs->fe.vbpad_cfg, JMSK_FE_VBPAD_CFG_BLOCK_ROW,
> +			     DIV_ROUND_UP(sfmt->height, JPEG_MCU_BLOCK_8));
> +		break;
> +	case JPEG_ENCODE_H1V2:
> +	case JPEG_ENCODE_H2V2:
> +		jpeg_rw_bits(jenc, offs->fe.vbpad_cfg, JMSK_FE_VBPAD_CFG_BLOCK_ROW,
> +			     DIV_ROUND_UP(sfmt->height, JPEG_MCU_BLOCK_16));
> +		break;
> +	default:
> +		dev_err(ectx->dev, "%s: unsupported encode format fourcc=0x%x\n", __func__, rval);
> +		return -EINVAL;
> +	}
> +
> +	if (sfmt->pixelformat == V4L2_PIX_FMT_NV21 || sfmt->pixelformat == V4L2_PIX_FMT_NV61)
> +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_CBCR_ORDER, 1);
> +	else
> +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_CBCR_ORDER, 0);
> +
> +	for (pln = 0; pln < sfmt->num_planes; pln++) {
> +		if (sfmt->width && sfmt->height) {
> +			switch (pln) {
> +			case 0:
> +				jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN0_EN, 1);
> +				break;
> +			case 1:
> +				jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN1_EN, 1);
> +				break;
> +			case 2:
> +				jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN2_EN, 1);
> +				break;
> +			}
> +		}
> +	}
> +
> +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_FE_ENABLE, 1);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_fe(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	int rc;
> +
> +	rc = jpeg_setup_fe_size(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	rc = jpeg_setup_fe_hinit(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	rc = jpeg_setup_fe_vinit(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	rc = jpeg_setup_fe_params(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +static int jpeg_apply_we_addr(struct jenc_context *ectx, struct qcom_jenc_queue *q,
> +			      struct vb2_buffer *vb)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct qcom_jpeg_buff *frame = &q->buff[vb->index];
> +	u8 pln = 0;
> +
> +	if (WARN_ON_ONCE(!frame->plns[pln].dma))
> +		return -EPERM;
> +
> +	jpeg_io_write(jenc, offs->we.pntr[pln], frame->plns[pln].dma);
> +
> +	dev_dbg(jenc->dev, "%s: pln=%d addr=0x%llx idx:%d\n", __func__,
> +		pln, frame->plns[pln].dma, vb->index);
> +
> +	q->buff_id = vb->index;
> +
> +	return 0;
> +}
> +
> +static int jpeg_store_we_next(struct jenc_context *ectx, struct vb2_buffer *vb2)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb2->type)];
> +	struct qcom_jpeg_buff *frame = &q->buff[vb2->index];
> +	struct qc_jfif *mptr;
> +	struct sg_table *sgt;
> +	dma_addr_t dma;
> +
> +	sgt = vb2_dma_sg_plane_desc(vb2, 0);
> +	if (WARN_ON_ONCE(!sgt || !sgt->sgl))
> +		return -EINVAL;
> +
> +	dma = sg_dma_address(sgt->sgl);
> +	if (WARN_ON_ONCE(!dma))
> +		return -EINVAL;
> +
> +	mptr = vb2_plane_vaddr(vb2, 0);
> +	if (WARN_ON_ONCE(!mptr))
> +		return -EINVAL;

Still don't understand this WARN_ONCE pattern you have. Do you see this 
at all with your runtime ?

> +	mutex_lock(&ectx->quality_mutex);
> +	if (ectx->quality_programmed != ectx->quality_requested)
> +		jpeg_apply_dmi_table(ectx);
> +	mutex_unlock(&ectx->quality_mutex);
> +
> +	dma += qcom_jenc_header_emit(&ectx->hdr_cache, (void *)mptr,
> +				     min_t(size_t, vb2->planes[0].length, ectx->hdr_cache.size),
> +				     q->vf.width, q->vf.height);
> +	qcom_jenc_dqts_emit(&ectx->hdr_cache, (void *)mptr);
> +
> +	frame->plns[0].sgt	= sgt;
> +	frame->plns[0].dma	= dma;
> +	frame->plns[0].size	= vb2_plane_size(vb2, 0);
> +
> +	jpeg_dev_access(jenc->dev, frame, DMA_TO_DEVICE);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_we_size(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct v4l2_pix_format_mplane *dfmt = &q->vf;
> +	u8 pln;
> +
> +	if (!dfmt->plane_fmt[0].sizeimage) {
> +		dev_err(ectx->dev, "%s: invalid destination buffer size=0\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
> +		jpeg_rw_bits(jenc, offs->we.stride[pln], JMSK_PLNS_WR_STRIDE, 0);
> +
> +	jpeg_io_write(jenc, offs->we.bsize[0], dfmt->plane_fmt[0].sizeimage);
> +
> +	dev_dbg(ectx->dev, "%s: ctx=%p size=%u\n", __func__,
> +		ectx, dfmt->plane_fmt[0].sizeimage);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_we_hinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct v4l2_pix_format_mplane *dfmt = &q->vf;
> +	u8 pln;
> +
> +	if (!dfmt->width) {
> +		dev_err(ectx->dev, "%s: invalid destination width=%d\n", __func__, dfmt->width);
> +		return -EINVAL;
> +	}
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		jpeg_rw_bits(jenc, offs->we.hinit[pln], JMSK_PLNS_WR_HINIT, 0);
> +		jpeg_rw_bits(jenc, offs->we.hstep[pln], JMSK_PLNS_WR_HSTEP, 0);
> +	}
> +
> +	jpeg_rw_bits(jenc, offs->we.hstep[0], JMSK_PLNS_WR_HSTEP, dfmt->width);
> +
> +	dev_dbg(ectx->dev, "%s: ctx=%p hstep=%u\n", __func__, ectx,
> +		jpeg_rd_bits(jenc, offs->we.hstep[0], JMSK_PLNS_WR_HSTEP));
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_we_vinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct v4l2_pix_format_mplane *dfmt = &q->vf;
> +	u8 pln;
> +
> +	if (!dfmt->height) {
> +		dev_err(ectx->dev, "%s: invalid destination height=%d\n", __func__, dfmt->height);
> +		return -EINVAL;
> +	}
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		jpeg_rw_bits(jenc, offs->we.vinit[pln], JMSK_PLNS_WR_VINIT, 0);
> +		jpeg_rw_bits(jenc, offs->we.vstep[pln], JMSK_PLNS_WR_VSTEP, 0);
> +	}
> +
> +	jpeg_rw_bits(jenc, offs->we.vstep[0], JMSK_PLNS_WR_VSTEP, dfmt->height);
> +
> +	dev_dbg(ectx->dev, "%s: ctx=%p vstep=%u\n", __func__, ectx,
> +		jpeg_rd_bits(jenc, offs->we.vstep[0], JMSK_PLNS_WR_VSTEP));
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_we_params(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct v4l2_pix_format_mplane *dfmt = &q->vf;
> +	u32 blk_w, blk_h, mcu_cols, mcu_rows;
> +	int rval;
> +
> +	rval = jpeg_get_memory_fmt(dfmt->pixelformat);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "%s: invalid memory format for v4l2 format:0x%x\n",
> +			__func__, dfmt->pixelformat);
> +		return -EINVAL;
> +	}
> +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MEMORY_FORMAT, rval);
> +
> +	rval = jpeg_get_mal_boundary(dfmt->width, jpeg_mal_bounds, ARRAY_SIZE(jpeg_mal_bounds));
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "%s: failed to get WE mal boundary width=%u\n",
> +			__func__, dfmt->width);
> +		return -EINVAL;
> +	}
> +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MAL_BOUNDARY, rval);
> +
> +	dev_dbg(ectx->dev, "%s: optimal WE mal boundary=%d\n", __func__,
> +		jpeg_rd_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MAL_BOUNDARY));
> +
> +	rval = jpeg_get_encode_fmt(dfmt->pixelformat);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "%s: unsupported encode format fourcc=0x%x\n",
> +			__func__, dfmt->pixelformat);
> +		return rval;
> +	}
> +
> +	rval = jpeg_get_mcu_geometry(rval, dfmt->width, dfmt->height, &blk_w, &blk_h,
> +				     &mcu_cols, &mcu_rows);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "%s: invalid MCU geometry mcu_cols=%d mcu_rows=%d\n",
> +			__func__, mcu_cols, mcu_rows);
> +		return rval;
> +	}
> +
> +	dev_dbg(ectx->dev, "%s blk_w=%u blk_h=%u cols=%u rows=%u\n", __func__,
> +		blk_w, blk_h, mcu_cols, mcu_rows);
> +
> +	jpeg_rw_bits(jenc, offs->we.blocks[0], JMSK_PLNS_WR_BLOCK_CFG_PER_RAW, mcu_rows - 1);
> +	jpeg_rw_bits(jenc, offs->we.blocks[0], JMSK_PLNS_WR_BLOCK_CFG_PER_COL, mcu_cols - 1);
> +
> +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_CBCR_ORDER, 1);
> +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MAL_EN, 1);
> +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_POP_BUFF_ON_EOS, 1);
> +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_PLN0_EN, 1);
> +
> +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_MODE, 1);
> +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_WE_ENABLE, 1);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_we(struct jenc_context *ectx, struct qcom_jenc_queue *q)
> +{
> +	int rc;
> +
> +	rc = jpeg_setup_we_size(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	rc = jpeg_setup_we_hinit(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	rc = jpeg_setup_we_vinit(ectx, q);
> +	if (rc)
> +		return rc;
> +
> +	return jpeg_setup_we_params(ectx, q);
> +}
> +
> +static int jpeg_setup_scale(struct jenc_context *ectx)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
> +	struct qcom_jenc_queue *dq = &ectx->bufq[JENC_DST_QUEUE];
> +	struct v4l2_pix_format_mplane *sfmt = &sq->vf;
> +	struct v4l2_pix_format_mplane *dfmt = &dq->vf;
> +	u32 blk_w, blk_h, mcu_cols, mcu_rows;
> +	int rval;
> +	u8 pln;
> +
> +	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_SCALE_RESET, 1);
> +
> +	/* explicit no scaling */
> +	jpeg_rw_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_HSCALE_ENABLE, 0);
> +	jpeg_rw_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_VSCALE_ENABLE, 0);
> +
> +	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> +		jpeg_io_write(jenc, offs->scale.hstep[pln], JPEG_DEFAULT_SCALE_STEP);
> +		jpeg_io_write(jenc, offs->scale.vstep[pln], JPEG_DEFAULT_SCALE_STEP);
> +	}
> +
> +	if (jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_HSCALE_ENABLE)) {
> +		for (pln = 0; pln < sq->vf.num_planes; pln++) {
> +			jpeg_rw_bits(jenc, offs->scale.hstep[pln],
> +				     JMSK_SCALE_PLNS_HSTEP_INTEGER,
> +				     jpeg_calc_scale_int(sfmt->width, dfmt->width));
> +			jpeg_rw_bits(jenc, offs->scale.hstep[pln],
> +				     JMSK_SCALE_PLNS_HSTEP_FRACTIONAL,
> +				     jpeg_calc_scale_frac(sfmt->width, dfmt->width));
> +
> +			dev_dbg(ectx->dev, "%s: ctx=%p hint=%d hfrac=%d\n",
> +				__func__, ectx,
> +				jpeg_rd_bits(jenc, offs->scale.hstep[pln],
> +					     JMSK_SCALE_PLNS_HSTEP_INTEGER),
> +				jpeg_rd_bits(jenc, offs->scale.hstep[pln],
> +					     JMSK_SCALE_PLNS_HSTEP_FRACTIONAL));
> +		}
> +	}
> +
> +	if (jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_VSCALE_ENABLE)) {
> +		for (pln = 0; pln < sq->vf.num_planes; pln++) {
> +			jpeg_rw_bits(jenc, offs->scale.vstep[pln],
> +				     JMSK_SCALE_PLNS_VSTEP_INTEGER,
> +				     jpeg_calc_scale_int(sfmt->height, dfmt->height));
> +			jpeg_rw_bits(jenc, offs->scale.vstep[pln],
> +				     JMSK_SCALE_PLNS_VSTEP_FRACTIONAL,
> +				     jpeg_calc_scale_frac(sfmt->height, dfmt->height));
> +
> +			dev_dbg(ectx->dev, "%s: ctx=%p vint=%d vfrac=%d\n",
> +				__func__, ectx,
> +				jpeg_rd_bits(jenc, offs->scale.vstep[pln],
> +					     JMSK_SCALE_PLNS_VSTEP_INTEGER),
> +				jpeg_rd_bits(jenc, offs->scale.vstep[pln],
> +					     JMSK_SCALE_PLNS_VSTEP_FRACTIONAL));
> +		}
> +	}
> +
> +	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "%s: unsupported encode format fourcc=0x%x\n",
> +			__func__, sfmt->pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	rval = jpeg_get_mcu_geometry(rval, dfmt->width, dfmt->height, &blk_w, &blk_h,
> +				     &mcu_cols, &mcu_rows);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "%s: invalid MCU geometry blk_w=%d blk_h=%d\n",
> +			__func__, blk_w, blk_h);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(ectx->dev, "%s blk_w=%u blk_h=%u cols=%u rows=%u\n", __func__, blk_w, blk_h,
> +		mcu_cols, mcu_rows);
> +
> +	for (pln = 0; pln < sq->vf.num_planes; pln++) {
> +		jpeg_rw_bits(jenc, offs->scale_out_cfg[pln],
> +			     JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH, mcu_cols - 1);
> +		jpeg_rw_bits(jenc, offs->scale_out_cfg[pln],
> +			     JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT, mcu_rows - 1);
> +	}
> +
> +	dev_dbg(ectx->dev, "%s: ctx=%p scale src=%ux%u dst=%ux%u enable=%d/%d\n",
> +		__func__, ectx, sfmt->width, sfmt->height, dfmt->width, dfmt->height,
> +		jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_HSCALE_ENABLE),
> +		jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_VSCALE_ENABLE));
> +
> +	/* Disabled, but must be configured */
> +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_SCALE_ENABLE, 0);
> +
> +	return 0;
> +}
> +
> +static int jpeg_setup_encode(struct jenc_context *ectx)
> +{
> +	struct qcom_jenc_dev *jenc = ectx->jenc;
> +	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
> +	struct v4l2_pix_format_mplane *sfmt = &sq->vf;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	u32 blk_w, blk_h, mcu_cols, mcu_rows;
> +	int rval;
> +
> +	if (!sfmt->width || !sfmt->height)
> +		return -EINVAL;
> +
> +	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_ENCODER_RESET, 1);
> +
> +	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "%s: unsupported encode format fourcc=0x%x\n",
> +			__func__, sfmt->pixelformat);
> +		return -EINVAL;
> +	}
> +	jpeg_rw_bits(jenc, offs->enc_cfg, JMSK_ENC_CFG_IMAGE_FORMAT, rval);
> +
> +	rval = jpeg_get_mcu_geometry(rval, sfmt->width, sfmt->height, &blk_w, &blk_h,
> +				     &mcu_cols, &mcu_rows);
> +	if (rval < 0) {
> +		dev_err(ectx->dev, "%s: invalid MCU geometry mcu_cols=%d mcu_rows=%d\n",
> +			__func__, mcu_cols, mcu_rows);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(ectx->dev, "%s blk_w=%u blk_h=%u cols=%u rows=%u\n", __func__,
> +		blk_w, blk_h, mcu_cols, mcu_rows);
> +
> +	jpeg_rw_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_WIDTH, mcu_cols - 1);
> +	jpeg_rw_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_HEIGHT, mcu_rows - 1);
> +
> +	dev_dbg(ectx->dev, "%s: ctx=%p width=%d height=%d\n", __func__, ectx,
> +		jpeg_rd_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_WIDTH),
> +		jpeg_rd_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_HEIGHT));
> +
> +	jpeg_rw_bits(jenc, offs->enc_cfg, JMSK_ENC_CFG_APPLY_EOI, 1);
> +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_ENC_ENABLE, 1);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t op_jpeg_irq_bot(int irq, void *data)
> +{
> +	struct qcom_jenc_dev *jenc = data;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	u32 irq_status;
> +	u32 irq_mask;
> +	unsigned long flags;
> +	int rc;
> +
> +	rc = kfifo_out_spinlocked(&jenc->kfifo_inst, &irq_status, sizeof(irq_status),
> +				  &jenc->kfifo_lock);
> +	if (rc != sizeof(irq_status)) {
> +		dev_err(jenc->dev, "IRQ status: FIFO empty\n");
> +		return IRQ_HANDLED;
> +	}
> +
> +	irq_mask = jenc->res->hw_mask[JMSK_IRQ_STATUS_SESSION_DONE];
> +	if (jpeg_bits_get(irq_mask, irq_status)) {
> +		struct jenc_context *ctx = jenc->actx;
> +		struct qcom_jenc_queue *dq = &ctx->bufq[JENC_DST_QUEUE];
> +		size_t out_size;
> +
> +		spin_lock_irqsave(&jenc->hw_lock, flags);
> +		jenc->actx = NULL;
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +		if (ctx && dq->buff_id >= 0) {
> +			struct qcom_jpeg_buff *frame;
> +			unsigned long flags;
> +
> +			spin_lock_irqsave(&jenc->hw_lock, flags);
> +			frame = &dq->buff[dq->buff_id];
> +			out_size = jpeg_io_read(jenc, offs->enc_out_size);
> +			spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +			dev_dbg(jenc->dev, "complete idx:%d addr=0x%llx size=%zu\n",
> +				dq->buff_id, frame->plns[0].dma, out_size);
> +
> +			jpeg_cpu_access(jenc->dev, frame, DMA_FROM_DEVICE);
> +			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
> +					    out_size + JPEG_HEADER_MAX);
> +			jpeg_stop(jenc);
> +		}
> +	}
> +
> +	irq_mask = jenc->res->hw_mask[JMSK_IRQ_STATUS_SESSION_ERROR];
> +	if (jpeg_bits_get(irq_mask, irq_status)) {
> +		struct jenc_context *ctx = jenc->actx;
> +
> +		spin_lock_irqsave(&jenc->hw_lock, flags);
> +		jenc->actx = NULL;
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +		dev_err(jenc->dev, "encoder hardware failure=0x%x\n",
> +			jpeg_bits_get(JMSK_IRQ_STATUS_SESSION_ERROR, irq_status));
> +		if (ctx)
> +			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_ERROR, 0);
> +
> +		jpeg_stop(jenc);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t op_jpeg_irq_top(int irq, void *data)
> +{
> +	struct qcom_jenc_dev *jenc = data;
> +	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
> +	u32 irq_status;
> +	u32 irq_mask;
> +	unsigned long flags;
> +	int rc;
> +
> +	spin_lock_irqsave(&jenc->hw_lock, flags);
> +
> +	irq_status = jpeg_io_read(jenc, offs->int_status);
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, irq_status);
> +
> +	irq_mask = jenc->res->hw_mask[JMSK_IRQ_STATUS_RESET_ACK];
> +	if (jpeg_bits_get(irq_mask, irq_status)) {
> +		complete(&jenc->reset_complete);
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +		return IRQ_HANDLED;
> +	}
> +
> +	irq_mask = jenc->res->hw_mask[JMSK_IRQ_STATUS_STOP_ACK];
> +	if (jpeg_bits_get(irq_mask, irq_status)) {
> +		complete(&jenc->stop_complete);
> +		dev_dbg(jenc->dev, "hardware stop acknowledged\n");
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +		return IRQ_HANDLED;
> +	}
> +
> +	rc = kfifo_in(&jenc->kfifo_inst, &irq_status, sizeof(irq_status));
> +	if (rc != sizeof(irq_status))
> +		dev_err(jenc->dev, "IRQ status: FIFO full\n");
> +
> +	spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +	return IRQ_WAKE_THREAD;
I'll stop here.

Really great to see this hardware getting enabled. In V2 please break 
the code up into smaller patches which can be reviewed in more managable 
chunks.

---
bod

