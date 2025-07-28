Return-Path: <linux-media+bounces-38521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BF1B13480
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 07:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33BA03B900E
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 05:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8192322154D;
	Mon, 28 Jul 2025 05:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGWUJT87"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DBD21FF50;
	Mon, 28 Jul 2025 05:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682262; cv=none; b=hTpCHyI73qBHR+dpKalJ4L8fUNuirnkTcl4tALMOmClgpSWc7OWv2aulqRudX0Y2h6K5qRxBNi8yWSq9CWgiB5gxzemZLY0qI4fRzaEecXBBUau4ns8808fl44wkjuCuZ6XwflXHSKf+YED9pdtyFxfH2bbbNhc+ER4PtKgUeys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682262; c=relaxed/simple;
	bh=93FmW8XV2jJxelvz++7T6HWXvhNpHYrpAeDkgbikgKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXE+JMBv1P+U0vZmDLpo4DiTRHHAah4CxbJbXKkcLHWxCTySAb00sCXz3zzIt3s5hG3YpivTHI3ZWYxkeCCNcxSwbOXpwAU/+JeRBYmqZst7WWHiGLLsi8ChcQSI4iMo7G0u47wCrs2jjfe6EpTDiwmwpz4heSK5RNwrZQ/qeEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGWUJT87; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753682260; x=1785218260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=93FmW8XV2jJxelvz++7T6HWXvhNpHYrpAeDkgbikgKQ=;
  b=RGWUJT87d1gYTqOJHeRHdNOhtSSbQypWm7qhpEXDgAb0M4YXUgJ2QJLP
   gdEnNOSHqhmgQXBnpZYGPC/g325pXruj1YR5Jpr/Ap6i5hDRcubUNrXdZ
   C0f5QmzlGi3yiI3b6ZwAL6joIIf6i9zHLZho4WTY9Hlxay278YKogIhE+
   HuFbJoT4MlLAuHI99UwJZCWHXurPlrw3Fj8+Py9xJW1mUPJ9ku6jbZh9z
   znaIbGq/L5HSuxPu2T6XqKA+4qmGWJMK74MyhKFIXO7c5zg8bRoNHxT0c
   tYu7s3mLRlSXiI3tQ5OByCyMiSj4CJSXte0DIo+Ok27FtVYcU2MsP00p+
   g==;
X-CSE-ConnectionGUID: mXWtSjVvR2m9e2ox+88sKA==
X-CSE-MsgGUID: 1ZjU8vhuSpmw3vENRs4eQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="58543784"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="58543784"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 22:57:39 -0700
X-CSE-ConnectionGUID: Pn+BF0l3Swm79I6tIvPCSQ==
X-CSE-MsgGUID: TA+jyJIVQYyuoKCKw1yjyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162647152"
Received: from opintica-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.174])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 22:57:36 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 196AA1202CF;
	Mon, 28 Jul 2025 08:57:33 +0300 (EEST)
Date: Mon, 28 Jul 2025 05:57:33 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, Svetoslav.Stoilov@amd.com
Subject: Re: [PATCH v2 2/8] media: platform: amd: low level support for isp4
 firmware
Message-ID: <aIcRTapInMVSIkx5@kekkonen.localdomain>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-3-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618091959.68293-3-Bin.Du@amd.com>

Hi Bin,

On Wed, Jun 18, 2025 at 05:19:53PM +0800, Bin Du wrote:
> Low level functions for access the registers and mapping to their ranges.
> This change also includes register definitions for ring buffer used to
> communicate with ISP Firmware.
> Ring buffer is the communication interface between driver and ISP Firmware.
> Command and responses are exchanged through the ring buffer.

Please rewrap this, the third line could well be longer.

> 
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> ---
>  drivers/media/platform/amd/isp4/Makefile      |   3 +-
>  drivers/media/platform/amd/isp4/isp4_hw.c     |  46 +++++++
>  drivers/media/platform/amd/isp4/isp4_hw.h     |  14 +++
>  drivers/media/platform/amd/isp4/isp4_hw_reg.h | 116 ++++++++++++++++++
>  4 files changed, 178 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.h
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
> 
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> index e9e84160517d..8ca1c4dfe246 100644
> --- a/drivers/media/platform/amd/isp4/Makefile
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -3,7 +3,8 @@
>  # Copyright (C) 2025 Advanced Micro Devices, Inc.
>  
>  obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> -amd_capture-objs := isp4.o
> +amd_capture-objs := isp4.o	\
> +			isp4_hw.o	\
>  
>  ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>  ccflags-y += -I$(srctree)/include
> diff --git a/drivers/media/platform/amd/isp4/isp4_hw.c b/drivers/media/platform/amd/isp4/isp4_hw.c
> new file mode 100644
> index 000000000000..e5315330a514
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_hw.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/types.h>
> +
> +#include "isp4_hw.h"
> +#include "isp4_hw_reg.h"
> +
> +#define RMMIO_SIZE 524288
> +
> +u32 isp4hw_rreg(void __iomem *base, u32 reg)
> +{
> +	void __iomem *reg_addr;
> +
> +	if (reg >= RMMIO_SIZE)
> +		return RREG_FAILED_VAL;
> +
> +	if (reg < ISP_MIPI_PHY0_REG0)
> +		reg_addr = base + reg;
> +	else if (reg <= ISP_MIPI_PHY0_REG0 + ISP_MIPI_PHY0_SIZE)
> +		reg_addr = base + (reg - ISP_MIPI_PHY0_REG0);

Redundant parentheses.

> +	else
> +		return RREG_FAILED_VAL;
> +
> +	return readl(reg_addr);
> +};
> +
> +void isp4hw_wreg(void __iomem *base, u32 reg, u32 val)
> +{
> +	void __iomem *reg_addr;
> +
> +	if (reg >= RMMIO_SIZE)
> +		return;
> +
> +	if (reg < ISP_MIPI_PHY0_REG0)
> +		reg_addr = base + reg;
> +	else if (reg <= ISP_MIPI_PHY0_REG0 + ISP_MIPI_PHY0_SIZE)
> +		reg_addr = base + (reg - ISP_MIPI_PHY0_REG0);

Ditto.

> +	else
> +		return;
> +
> +	writel(val, reg_addr);
> +};
> diff --git a/drivers/media/platform/amd/isp4/isp4_hw.h b/drivers/media/platform/amd/isp4/isp4_hw.h
> new file mode 100644
> index 000000000000..072d135b9e3a
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_hw.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_HW_H_
> +#define _ISP4_HW_H_
> +
> +#define RREG_FAILED_VAL 0xFFFFFFFF
> +
> +u32 isp4hw_rreg(void __iomem *base, u32 reg);
> +void isp4hw_wreg(void __iomem *base, u32 reg, u32 val);
> +
> +#endif
> diff --git a/drivers/media/platform/amd/isp4/isp4_hw_reg.h b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
> new file mode 100644
> index 000000000000..b11f12ba6c56
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_HW_REG_H_
> +#define _ISP4_HW_REG_H_
> +
> +#define ISP_SOFT_RESET		0x62000
> +#define ISP_SYS_INT0_EN		0x62010
> +#define ISP_SYS_INT0_STATUS	0x62014
> +#define ISP_SYS_INT0_ACK	0x62018
> +#define ISP_CCPU_CNTL		0x62054
> +#define ISP_STATUS		0x62058
> +#define ISP_LOG_RB_BASE_LO0	0x62148
> +#define ISP_LOG_RB_BASE_HI0	0x6214C

Lower case hexadecimals, please.

> +#define ISP_LOG_RB_SIZE0	0x62150
> +#define ISP_LOG_RB_RPTR0	0x62154
> +#define ISP_LOG_RB_WPTR0	0x62158
> +#define ISP_RB_BASE_LO1		0x62170
> +#define ISP_RB_BASE_HI1		0x62174
> +#define ISP_RB_SIZE1		0x62178
> +#define ISP_RB_RPTR1		0x6217C
> +#define ISP_RB_WPTR1		0x62180
> +#define ISP_RB_BASE_LO2		0x62184
> +#define ISP_RB_BASE_HI2		0x62188
> +#define ISP_RB_SIZE2		0x6218C
> +#define ISP_RB_RPTR2		0x62190
> +#define ISP_RB_WPTR2		0x62194
> +#define ISP_RB_BASE_LO3		0x62198
> +#define ISP_RB_BASE_HI3		0x6219C
> +#define ISP_RB_SIZE3		0x621A0
> +#define ISP_RB_RPTR3		0x621A4
> +#define ISP_RB_WPTR3		0x621A8
> +#define ISP_RB_BASE_LO4		0x621AC
> +#define ISP_RB_BASE_HI4		0x621B0
> +#define ISP_RB_SIZE4		0x621B4
> +#define ISP_RB_RPTR4		0x621B8
> +#define ISP_RB_WPTR4		0x621BC
> +#define ISP_RB_BASE_LO5		0x621C0
> +#define ISP_RB_BASE_HI5		0x621C4
> +#define ISP_RB_SIZE5		0x621C8
> +#define ISP_RB_RPTR5		0x621CC
> +#define ISP_RB_WPTR5		0x621D0
> +#define ISP_RB_BASE_LO6		0x621D4
> +#define ISP_RB_BASE_HI6		0x621D8
> +#define ISP_RB_SIZE6		0x621DC
> +#define ISP_RB_RPTR6		0x621E0
> +#define ISP_RB_WPTR6		0x621E4
> +#define ISP_RB_BASE_LO7		0x621E8
> +#define ISP_RB_BASE_HI7		0x621EC
> +#define ISP_RB_SIZE7		0x621F0
> +#define ISP_RB_RPTR7		0x621F4
> +#define ISP_RB_WPTR7		0x621F8
> +#define ISP_RB_BASE_LO8		0x621FC
> +#define ISP_RB_BASE_HI8		0x62200
> +#define ISP_RB_SIZE8		0x62204
> +#define ISP_RB_RPTR8		0x62208
> +#define ISP_RB_WPTR8		0x6220C
> +#define ISP_RB_BASE_LO9		0x62210
> +#define ISP_RB_BASE_HI9		0x62214
> +#define ISP_RB_SIZE9		0x62218
> +#define ISP_RB_RPTR9		0x6221C
> +#define ISP_RB_WPTR9		0x62220
> +#define ISP_RB_BASE_LO10	0x62224
> +#define ISP_RB_BASE_HI10	0x62228
> +#define ISP_RB_SIZE10		0x6222C
> +#define ISP_RB_RPTR10		0x62230
> +#define ISP_RB_WPTR10		0x62234
> +#define ISP_RB_BASE_LO11	0x62238
> +#define ISP_RB_BASE_HI11	0x6223C
> +#define ISP_RB_SIZE11		0x62240
> +#define ISP_RB_RPTR11		0x62244
> +#define ISP_RB_WPTR11		0x62248
> +#define ISP_RB_BASE_LO12	0x6224C
> +#define ISP_RB_BASE_HI12	0x62250
> +#define ISP_RB_SIZE12		0x62254
> +#define ISP_RB_RPTR12		0x62258
> +#define ISP_RB_WPTR12		0x6225C
> +
> +#define ISP_POWER_STATUS	0x60000
> +
> +#define ISP_MIPI_PHY0_REG0	0x66700
> +#define ISP_MIPI_PHY1_REG0	0x66780
> +#define ISP_MIPI_PHY2_REG0	0x67400
> +
> +#define ISP_MIPI_PHY0_SIZE	0xD30
> +
> +/* ISP_SOFT_RESET */
> +#define ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK			0x00000001UL
> +
> +/* ISP_CCPU_CNTL */
> +#define ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK			0x00040000UL
> +
> +/* ISP_STATUS */
> +#define ISP_STATUS__CCPU_REPORT_MASK				0x000000feUL
> +
> +/* ISP_SYS_INT0_STATUS */
> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK	0x00010000UL
> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK	0x00040000UL
> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK	0x00100000UL
> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK	0x00400000UL
> +
> +/* ISP_SYS_INT0_EN */
> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK	0x00010000UL
> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT10_EN_MASK	0x00040000UL
> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT11_EN_MASK	0x00100000UL
> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK	0x00400000UL
> +
> +/* ISP_SYS_INT0_ACK */
> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK	0x00010000UL
> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT10_ACK_MASK	0x00040000UL
> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT11_ACK_MASK	0x00100000UL
> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK	0x00400000UL
> +
> +#endif

-- 
Kind regards,

Sakari Ailus

