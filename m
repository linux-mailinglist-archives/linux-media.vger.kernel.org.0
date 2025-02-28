Return-Path: <linux-media+bounces-27250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 448B5A49F09
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 17:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A08916481E
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 16:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2BB274255;
	Fri, 28 Feb 2025 16:38:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E251828E7
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740760705; cv=none; b=o/j87D6/U7sMly+ZrDOzOPkJwML881/ZMfVEDb6xoTZCpzw7uabN62893016BaI/e5Drbbdcc/VELv007NTbWa7K5Agn4FmwoSHmyyaiveyMw4Qw+/9oSd/QJqsYF5oRmrrFsc+mL0W5myL5Ptr5drfMBml+BeMQmLLvVwHxMTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740760705; c=relaxed/simple;
	bh=QErM3wHjLyAkdDm7rcn/oamG2MYpwbwyh/uwrbQVH+Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bRWudD3t1dV18e64JpYkxNM9WVDvFlvy/ds/JT/Hc1B56eUUjOWd3uW50eJ7XQRqJOiZCuBEJYB/QPyBqsXVVPexlu89A76L6xBN73nBkUXvuwPAPORuYuLgS9yBiUm+wGJjgi2SAYdQSRcPXBsQP3AP/WkrscNp8WwEu/rEClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1to3NI-0004MW-V4; Fri, 28 Feb 2025 17:38:08 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1to3NH-003KIL-36;
	Fri, 28 Feb 2025 17:38:07 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1to3NH-000D1T-2r;
	Fri, 28 Feb 2025 17:38:07 +0100
Message-ID: <1fcf08fe37a8e14c4acae445d65bd1503b13b6d2.camel@pengutronix.de>
Subject: Re: [PATCH 3/4] media: platform: qcom/iris: add support for vpu33
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vikash Garodia
 <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 28 Feb 2025 17:38:07 +0100
In-Reply-To: <20250225-topic-sm8x50-iris-v10-v1-3-128ef05d9665@linaro.org>
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
	 <20250225-topic-sm8x50-iris-v10-v1-3-128ef05d9665@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Di, 2025-02-25 at 10:05 +0100, Neil Armstrong wrote:
> The IRIS acceleration found in the SM8650 platforms uses the vpu33
> hardware version, and requires a slighly different reset and power off
> sequences in order to properly get out of runtime suspend.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  drivers/media/platform/qcom/iris/iris_vpu33.c      | 315 +++++++++++++++=
++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  3 files changed, 317 insertions(+)
>=20
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/pl=
atform/qcom/iris/Makefile
> index 35390534534e93f4617c1036a05ca0921567ba1d..6b64c9988505afd9707c70444=
9d60bb53209229f 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -21,6 +21,7 @@ qcom-iris-objs +=3D \
>               iris_vdec.o \
>               iris_vpu2.o \
>               iris_vpu3.o \
> +             iris_vpu33.o \
>               iris_vpu_buffer.o \
>               iris_vpu_common.o \
> =20
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu33.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu33.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..128a050f206f99ec0d43b97ff=
995fa50d5684150
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu33.c
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights r=
eserved.
> + */
> +
> +#include <linux/iopoll.h>
> +#include <linux/reset.h>
> +
> +#include "iris_instance.h"
> +#include "iris_vpu_common.h"
> +#include "iris_vpu_register_defines.h"
> +
> +#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> +#define AON_BASE_OFFS				0x000E0000
> +#define AON_MVP_NOC_RESET			0x0001F000
> +
> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> +#define REQ_POWER_DOWN_PREP			BIT(0)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> +#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
> +#define CORE_CLK_RUN				0x0
> +
> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> +#define CTL_AXI_CLK_HALT			BIT(0)
> +#define CTL_CLK_HALT				BIT(1)
> +
> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> +#define RESET_HIGH				BIT(0)
> +
> +#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
> +#define CORE_BRIDGE_SW_RESET			BIT(0)
> +#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> +
> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> +#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> +#define MSK_CORE_POWER_ON			BIT(1)
> +
> +#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
> +#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
> +
> +#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
> +
> +#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> +
> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> +
> +#define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
> +#define SW_RESET				BIT(0)
> +#define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
> +#define NOC_HALT				BIT(0)
> +#define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
> +
> +#define VCODEC_DMA_SPARE_3 0x87B8
> +
> +static int reset_control_bulk_assert_id(int num_rstcs,
> +					struct reset_control_bulk_data *rstcs,
> +					char *id)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < num_rstcs; ++i) {
> +		if (!strcmp(rstcs[i].id, id))
> +			return reset_control_assert(rstcs[i].rstc);
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static int reset_control_bulk_deassert_id(int num_rstcs,
> +					  struct reset_control_bulk_data *rstcs,
> +					  char *id)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < num_rstcs; ++i) {
> +		if (!strcmp(rstcs[i].id, id))
> +			return reset_control_deassert(rstcs[i].rstc);
> +	}
> +
> +	return -ENODEV;
> +}

Please adapt the abstractions instead of working around them. If the
driver isn't suited for a single reset_control_bulk_data in iris_core,
split it into multiple groups, or store the resets individually.

At the very least, this could use constant indices instead of linear
search with string compares.

regards
Philipp

