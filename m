Return-Path: <linux-media+bounces-61716-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDZNCBMVB2pQrgIAu9opvQ
	(envelope-from <linux-media+bounces-61716-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:44:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EBA54FD10
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D73F30BEA23
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095F647DF96;
	Fri, 15 May 2026 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSS14W6J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B83F4129;
	Fri, 15 May 2026 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847699; cv=none; b=Kisp+qNzxh5nM48Lxpu29naeVODQ1MKcX3T4FId5fhGBszi6Ot9MZ3amZWGeVpi2riC80pcbS9DffbHEU5HrYU6A/owPXZh9k9HlRNx1MEiYW5AiL2K3sQkeohWG8VBJ+rwcFxU1EEzjOzJOWxDR0uYLblkta5qSNFFk9eCEwSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847699; c=relaxed/simple;
	bh=cJ++CDKm02rovMLX6hp4ms54PYQyCiftrVxj2AhjOz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPh7JC1IZ1xtYJGemAePvOU3qW7NbSn9AjU0X59PrFc9Cr528jEeTni5Q3PWai9f7cDvDnXZNi6+7ghZocE/ITbaV8MBE7bDvtcfov7isniawgPrw3rDbXx6RfcrdBO/43LykLKyfqHV3KheQIZW7soEkABLfteqtR46OPXsnok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSS14W6J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA81C2BCB0;
	Fri, 15 May 2026 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778847698;
	bh=cJ++CDKm02rovMLX6hp4ms54PYQyCiftrVxj2AhjOz0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HSS14W6JiqYtqwci/OcUcX2/UHmOcVjkgM826K9Y6tXr4K9Wua7APU3Ym+/4jTKJX
	 AyIph23h09XJOmspDnyoHo7i05GVdR7oBxoo5XMCt3oJQjrZq5KV4JGieGYE9XNOTG
	 ruPxVTS8AxHD15u8NwRCIFk9TbJxPjWQMSP3wyPFmV77A0cE1G+CvY4ItrQNrrID+6
	 FLM3hGF/XUWTE0ywwsyeeLXl+mnrFRxGeVolqsyn1MO8Q5f2vozkWD472ION3oWST4
	 4JQpc7XFElMUggOmva+Ln+mZwDfKHXBW6/n8DQd063yGMt0TC+UsrWY3ZuvGGJnVD1
	 k6zN0o30RaS1Q==
Message-ID: <5e1d0c51-9543-4698-8715-a7402401a758@kernel.org>
Date: Fri, 15 May 2026 14:21:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] qcom: media: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
 <20260515-qcom-jpeg-v4l2-v1-2-f38c2e1b3555@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-2-f38c2e1b3555@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 87EBA54FD10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61716-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 15/05/2026 13:47, Atanas Filipov wrote:
> Implementation of a V4L2 JPEG encoder device driver supporting
> Qualcomm SC7180, SM8250, SM7280, and SM8550 chipsets.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

There is no subsystem "qcom".

> ---
>  drivers/media/platform/qcom/Kconfig                |    1 +
>  drivers/media/platform/qcom/Makefile               |    1 +
>  drivers/media/platform/qcom/jpeg/Kconfig           |   17 +
>  drivers/media/platform/qcom/jpeg/Makefile          |    9 +
>  drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h  |  253 ++++
>  drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c   |  370 +++++
>  drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h   |  111 ++
>  drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c   |  388 +++++
>  drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h   |  130 ++
>  drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c   | 1522 ++++++++++++++++++++
>  drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h   |   49 +
>  drivers/media/platform/qcom/jpeg/qcom_jenc_res.c   |  268 ++++
>  drivers/media/platform/qcom/jpeg/qcom_jenc_res.h   |   70 +
>  drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c  | 1082 ++++++++++++++
>  drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h  |   27 +
>  .../platform/qcom/jpeg/qcom_v165_jenc_hw_info.h    |  509 +++++++
>  .../platform/qcom/jpeg/qcom_v580_jenc_hw_info.h    |  509 +++++++
>  .../platform/qcom/jpeg/qcom_v680_jenc_hw_info.h    |  509 +++++++
>  .../platform/qcom/jpeg/qcom_v780_jenc_hw_info.h    |  509 +++++++
>  19 files changed, 6334 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
> index 4f4d3a68e6e5..f33d53a754a0 100644
> --- a/drivers/media/platform/qcom/Kconfig
> +++ b/drivers/media/platform/qcom/Kconfig
> @@ -5,3 +5,4 @@ comment "Qualcomm media platform drivers"
>  source "drivers/media/platform/qcom/camss/Kconfig"
>  source "drivers/media/platform/qcom/iris/Kconfig"
>  source "drivers/media/platform/qcom/venus/Kconfig"
> +source "drivers/media/platform/qcom/jpeg/Kconfig"
> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
> index ea2221a202c0..30c94949e9de 100644
> --- a/drivers/media/platform/qcom/Makefile
> +++ b/drivers/media/platform/qcom/Makefile
> @@ -2,3 +2,4 @@
>  obj-y += camss/
>  obj-y += iris/
>  obj-y += venus/
> +obj-y += jpeg/

Random order. It seems you follow such pattern in multiple places. This
must follow existing ordering.


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
> +
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
> +
> +		jenc->clks[c_idx].clk = devm_clk_get(jenc->dev, res->clk_names[c_idx]);

So you just re-implemented clk bulk API, no?

> +		if (IS_ERR(jenc->clks[c_idx].clk)) {

Run checkpatch.

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
> +
> +	jenc->jpeg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(jenc->jpeg_base)) {
> +		rc = PTR_ERR(jenc->jpeg_base);

Pointless assignment, drop.

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

Why do you print same errors twice?

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

Allocation errors should never result in error messages.

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

Drop, useless.

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

So devices are compatible? Then express that.

> +	},
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

Why do you include so many other headers inside header? You ONLY include
what you use. ONLY.


Best regards,
Krzysztof

