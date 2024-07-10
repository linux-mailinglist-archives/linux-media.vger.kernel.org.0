Return-Path: <linux-media+bounces-14838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F4C92D093
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 13:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBA9E1C21B66
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 11:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2918190464;
	Wed, 10 Jul 2024 11:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LteFCTlU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427FF17FD;
	Wed, 10 Jul 2024 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720610464; cv=none; b=rjV3wSxV4wX+m7ZCdh2/Dhu3iE8TyV0q0AvadMgNyRrf8Ro8pZPfoBOdm9pQRzfyvvIZQV9HDVEXI0AS03eQ6xq/EeI8/LAwL/kT0mhG+rn0BVrOK1SMtJvtEecDgE9QaxDEdyCC9kBvbm6RjbfwniYPTPdR4cdrG84VMvHuyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720610464; c=relaxed/simple;
	bh=jC5btTHR9c/NrnI1tFbOOloD12GbHubUsqPdEGt6lWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWIJTc54c5XBlXK98NypTR96IT/LciYotujLYE8wa641FgZAYjHfszw7MO/k2drd6GesH/JZ2LbOI/+NNQt3JD8i/eoIbIThtArnj8Qhwq/JRCia2JieU0ZT56Z9shaBQQUcHEFSRoULiwU4iZyOZXyrKXm3B5CMRdtfrgyUJWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LteFCTlU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919FCC32781;
	Wed, 10 Jul 2024 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720610462;
	bh=jC5btTHR9c/NrnI1tFbOOloD12GbHubUsqPdEGt6lWY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LteFCTlU60wKj5Q/o+m4a+DhhU1yBIPABWEb1W+KR3Inb73KqLzmAffiTS94AWorc
	 kfsLnZpO5M+VDJcjj5J88Jujbp+xFAn+DNwaBgopGvgQ0hTMJbgbi5b2IScPcC2Evd
	 4YQJ+9icpsW0qEcGZcV7qeeVl6zI8Tg0mIrHNXCUakO71AfsXJcfvjQMBU6TyZYpXU
	 qvZHTcKJu+jJzae/29NcLpRlAukVJjRDleXpRnev2gvmL2OrLQpROlgWswQ+FNO+vK
	 0u4kYyoIH40VeeGjwtn2iC25lCfQ/BcW96lxMRfg7z3tc/Xpc1uaVzNrOVXVhno92T
	 sPT7R72TmGvVg==
Message-ID: <1da50dd1-b170-4775-94fc-19a10b7f9c47@kernel.org>
Date: Wed, 10 Jul 2024 13:20:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-10-quic_depengs@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240709160656.31146-10-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/07/2024 18:06, Depeng Shao wrote:
> The CSID in SM8550 is gen3, it has new register offset and new
> functionality. The buf done irq,register update and reset are
> moved to CSID gen3. And CSID gen3 has a new register block which
> is named as CSID top, it controls the output of CSID, since the
> CSID can connect to Sensor Front End (SFE) or original VFE, the
> register in top block is used to control the HW connection.
> 
> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>  drivers/media/platform/qcom/camss/Makefile    |   1 +
>  .../platform/qcom/camss/camss-csid-gen3.c     | 445 ++++++++++++++++++
>  .../platform/qcom/camss/camss-csid-gen3.h     |  26 +
>  .../media/platform/qcom/camss/camss-csid.h    |   2 +
>  4 files changed, 474 insertions(+)
>  create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.c
>  create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.h
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index e636968a1126..c336e4c1a399 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -7,6 +7,7 @@ qcom-camss-objs += \
>  		camss-csid-4-1.o \
>  		camss-csid-4-7.o \
>  		camss-csid-gen2.o \
> +		camss-csid-gen3.o \
>  		camss-csiphy-2ph-1-0.o \
>  		camss-csiphy-3ph-1-0.o \
>  		camss-csiphy.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> new file mode 100644
> index 000000000000..17fd7c5499de
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -0,0 +1,445 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-csid-gen3.c
> + *
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
> + *
> + * Copyright (c) 2024 Qualcomm Technologies, Inc.
> + */
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +
> +#include "camss.h"
> +#include "camss-csid.h"
> +#include "camss-csid-gen3.h"
> +
> +
> +#define CSID_TOP_IO_PATH_CFG0(csid)	(0x4 * (csid))
> +#define		OUTPUT_IFE_EN 0x100
> +#define		INTERNAL_CSID 1
> +
> +#define CSID_HW_VERSION		0x0
> +#define		HW_VERSION_STEPPING	0
> +#define		HW_VERSION_REVISION	16
> +#define		HW_VERSION_GENERATION	28
> +
> +#define CSID_RST_CFG	0xC
> +#define		RST_MODE		0
> +#define		RST_LOCATION	4
> +
> +#define CSID_RST_CMD	0x10
> +#define		SELECT_HW_RST	0
> +#define		SELECT_SW_RST	1
> +#define		SELECT_IRQ_RST	2
> +
> +#define CSID_CSI2_RX_IRQ_STATUS	0x9C
> +#define	CSID_CSI2_RX_IRQ_MASK	0xA0
> +#define CSID_CSI2_RX_IRQ_CLEAR	0xA4
> +#define CSID_CSI2_RX_IRQ_SET	0xA8
> +
> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)		(0xEC + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)		(0xF0 + 0x10 * (rdi))
> +#define   CSID_CSI2_RDIN_INFO_FIFO_FULL 2

That's a random set of indentations.

> +#define   CSID_CSI2_RDIN_INFO_CAMIF_EOF 3
> +#define   CSID_CSI2_RDIN_INFO_CAMIF_SOF 4
> +#define   CSID_CSI2_RDIN_INFO_INPUT_EOF 9
> +#define   CSID_CSI2_RDIN_INFO_INPUT_SOF 12


...

> +
> +	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
> +
> +	val = 1 << RDI_CFG1_PACKING_FORMAT;
> +	val |= 1 << RDI_CFG1_PIX_STORE;
> +	val |= 1 << RDI_CFG1_DROP_H_EN;
> +	val |= 1 << RDI_CFG1_DROP_V_EN;
> +	val |= 1 << RDI_CFG1_CROP_H_EN;
> +	val |= 1 << RDI_CFG1_CROP_V_EN;
> +	val |= RDI_CFG1_EARLY_EOF_EN;
> +
> +	writel_relaxed(val, csid->base + CSID_RDI_CFG1(vc));
> +
> +	val = 0;
> +	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
> +
> +	val = 1;
> +	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
> +
> +	val = 0;
> +	writel_relaxed(val, csid->base + CSID_RDI_CTRL(vc));
> +
> +	val = readl_relaxed(csid->base + CSID_RDI_CFG0(vc));
> +	val |=  enable << RDI_CFG0_EN;
> +	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
> +}
> +

such patterns and...

> + */
> +static int csid_reset(struct csid_device *csid)
> +{
> +	unsigned long time;
> +	u32 val;
> +	int i;
> +
> +	reinit_completion(&csid->reset_complete);
> +
> +	writel_relaxed(1, csid->base + CSID_TOP_IRQ_CLEAR);
> +	writel_relaxed(1, csid->base + CSID_IRQ_CMD);
> +	writel_relaxed(1, csid->base + CSID_TOP_IRQ_MASK);
> +
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			writel_relaxed(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
> +						csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +			writel_relaxed(0x1 << IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
> +			writel_relaxed(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
> +						csid->base + CSID_BUF_DONE_IRQ_MASK);
> +		}
> +
> +	/* preserve registers */
> +	val = (0x1 << RST_LOCATION) | (0x1 << RST_MODE);
> +	writel_relaxed(val, csid->base + CSID_RST_CFG);

... here - using everywhere relaxed here is odd and looks racy. These
looks like some strict sequences.


> +
> +	val = (0x1 << SELECT_HW_RST) | (0x1 << SELECT_IRQ_RST);
> +	writel_relaxed(val, csid->base + CSID_RST_CMD);
> +
> +	time = wait_for_completion_timeout(&csid->reset_complete,
> +					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
> +	if (!time) {
> +		dev_err(csid->camss->dev, "CSID reset timeout\n");
> +		return -EIO;
> +	}
> +


> +
> +static void csid_subdev_init(struct csid_device *csid)
> +{
> +	csid->testgen.modes = csid_testgen_modes;
> +	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2;
> +}
> +
> +const struct csid_hw_ops csid_ops_gen3 = {

Isn't there a warning here?

> +	.configure_stream = csid_configure_stream,
> +	.configure_testgen_pattern = csid_configure_testgen_pattern,
> +	.hw_version = csid_hw_version,
> +	.isr = csid_isr,
> +	.reset = csid_reset,
> +	.src_pad_code = csid_src_pad_code,
> +	.subdev_init = csid_subdev_init,
> +};

Your patchset does not apply at all. Tried v6.9, v6.10, next. I see some
dependency above, but that means no one can test it and no one can apply it.

Fix the warnings, I cannot verify it but I am sure you have them.

Best regards,
Krzysztof


