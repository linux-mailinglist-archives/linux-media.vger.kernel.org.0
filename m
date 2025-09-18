Return-Path: <linux-media+bounces-38523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 160BEB134F1
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 08:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80A8618986CC
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 06:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384EA221F38;
	Mon, 28 Jul 2025 06:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIDyAlA/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3337220F52;
	Mon, 28 Jul 2025 06:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753684422; cv=none; b=ZQgZhhV9AB9/HwNMAfeq26PcWQaNMlQpXA2duHmaN2uwugtDmPbqnJqt8uYKH1cWmYRPB6I8DQKvkhqGadollrO4AeU8Cd1cNmH+6Zap//I8uOQkwu62CLSwA7/SQyFqnyDomzEIFj0vC8c24/roU6wTS8XZXoA9qwwGobb8cfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753684422; c=relaxed/simple;
	bh=RRffCoqZOrccLhIBwkFnoHtQmCwlEdg7knA9+wSabJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVpuIdLWnB/Qi0jAKOA0Ho88KqSeRZOiv6KfRWKM/K+h/QZGpZHOTPli+yE2QLJCOk+od54+/7l/nMxrZgDLaEP/yrplMrzWIC0gLcXXgX+UJyUkKqu5X9t/tyj9YYSdVfnpmN5BRa2I5z18nxuHRa2zjCmbtI4Q1m1uYoGn1GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIDyAlA/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753684419; x=1785220419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RRffCoqZOrccLhIBwkFnoHtQmCwlEdg7knA9+wSabJw=;
  b=FIDyAlA/VhqKQwhaPVO8jM9hcHIAcA3O28xte/hFpJGWVie78uyBcrOu
   fSh9GOTaRWgUrSwNbTpwHR9eC9vhCKJEgNRI9wx4hB5x6zVVMvPx4yPm9
   e5Q3vAVNi1MQMpmNjh2oYXM13qWRwyJWSR1/9guYRrpf73qRIieJbqIEN
   iEFs9tYcfgf7WGObKDYfu5hC1z4Nu5KZGhcLhJeskFzxaDpCTbfFlCwRm
   Z91TWfNflO69HMJjzFMGu+jm+uJQ+h3tMbG2Up+HhDX6GUnLwP8D5MSlz
   EbBO+y8hdkXVVsFYjL3Of5h9auOJi/MU/oocdgPmaJijpFSgkkr5vsR62
   Q==;
X-CSE-ConnectionGUID: YrXWbnESSs6WVmXe87S5ZA==
X-CSE-MsgGUID: UGxFz1aSTGigEBXWGJac8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66192735"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66192735"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 23:33:38 -0700
X-CSE-ConnectionGUID: QyRsMeMlSAGzZWY92Pxslw==
X-CSE-MsgGUID: QEpmHBwfRfy8DC1NsLc8mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162701927"
Received: from opintica-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.174])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 23:33:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EE2DC1202CF;
	Mon, 28 Jul 2025 09:33:30 +0300 (EEST)
Date: Mon, 28 Jul 2025 06:33:30 +0000
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
Subject: Re: [PATCH v2 3/8] media: platform: amd: Add helpers to configure
 isp4 mipi phy
Message-ID: <aIcZuj6wrekhaguE@kekkonen.localdomain>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-4-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618091959.68293-4-Bin.Du@amd.com>

Hi Bin,

On Wed, Jun 18, 2025 at 05:19:54PM +0800, Bin Du wrote:
> The helper functions is for configuring, starting and stop the MIPI PHY.
> All configurations related to MIPI PHY configuration and calibration
> parameters are encapsulated in two helper functions: start and stop
> mipi phy.
> 
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> ---
>  drivers/media/platform/amd/isp4/Makefile   |    1 +
>  drivers/media/platform/amd/isp4/isp4_phy.c | 1547 ++++++++++++++++++++
>  drivers/media/platform/amd/isp4/isp4_phy.h |   14 +
>  3 files changed, 1562 insertions(+)
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.h
> 
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> index 8ca1c4dfe246..0e36201fbb30 100644
> --- a/drivers/media/platform/amd/isp4/Makefile
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -4,6 +4,7 @@
>  
>  obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>  amd_capture-objs := isp4.o	\
> +			isp4_phy.o \
>  			isp4_hw.o	\
>  
>  ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
> diff --git a/drivers/media/platform/amd/isp4/isp4_phy.c b/drivers/media/platform/amd/isp4/isp4_phy.c
> new file mode 100644
> index 000000000000..8d31a21074bb
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_phy.c
> @@ -0,0 +1,1547 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +
> +#include "isp4_hw.h"
> +#include "isp4_hw_reg.h"
> +#include "isp4_phy.h"
> +
> +#define ISP_MIPI_DPHY	0
> +#define T_DCO		5	/* nominal: 200MHz */
> +#define TMIN_RX		4
> +#define TIMEBASE	5	/* 5us */
> +
> +#define MIN_T_HS_SETTLE_NS 95
> +#define MAX_T_HS_SETTLE_NS 130
> +#define MIN_T_HS_SETTLE_UI 4
> +#define MAX_T_HS_SETTLE_UI 6

Please align the macro bodies to the same column.

Also using a descriptive prefix for these (such as AMDISP4) would seem like
a reasonable idea. The same goes for the other macros used by the driver,
too.

Speaking of macro names, some of the names below look quite random. Are
these from a hardware datasheet (or something alike)? I might consider
sanitising them. Some are also not in form fit for use in drivers, e.g. if
you have many of something, then the number should be an argument to the
macro, not part of the macro name, e.g. configuration related to lanes --
if feasible.

> +
> +#define PPI_STARTUP_RW_COMMON_DPHY_2		0x0C02
> +#define PPI_STARTUP_RW_COMMON_DPHY_6		0x0C06
> +#define PPI_STARTUP_RW_COMMON_DPHY_7		0x0C07
> +#define PPI_STARTUP_RW_COMMON_DPHY_8		0x0C08
> +#define PPI_STARTUP_RW_COMMON_DPHY_10		0x0C10
> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2	0x1CF2
> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0	0x1CF0
> +#define PPI_STARTUP_RW_COMMON_STARTUP_1_1	0x0C11
> +#define PPI_CALIBCTRL_RW_COMMON_BG_0		0x0C26
> +#define PPI_RW_LPDCOCAL_NREF			0x0E02
> +#define PPI_RW_LPDCOCAL_NREF_RANGE		0x0E03
> +#define PPI_RW_LPDCOCAL_TWAIT_CONFIG		0x0E05
> +#define PPI_RW_LPDCOCAL_VT_CONFIG		0x0E06
> +#define PPI_RW_LPDCOCAL_COARSE_CFG		0x0E08
> +#define PPI_RW_COMMON_CFG			0x0E36
> +#define PPI_RW_TERMCAL_CFG_0			0x0E40
> +#define PPI_RW_OFFSETCAL_CFG_0			0x0E50
> +#define PPI_RW_LPDCOCAL_TIMEBASE		0x0E01
> +#define CORE_AFE_CTRL_2_0			0x1C20
> +#define CORE_AFE_CTRL_2_1			0x1C21
> +#define CORE_AFE_CTRL_2_3			0x1C23
> +#define CORE_AFE_CTRL_2_5			0x1C25
> +#define CORE_AFE_CTRL_2_6			0x1C26
> +#define CORE_AFE_CTRL_2_7			0x1C27
> +#define CORE_DIG_COMMON_RW_DESKEW_FINE_MEM	0x1FF0
> +#define CORE_DIG_DLANE_CLK_RW_CFG_0		0x3800
> +#define CORE_DIG_DLANE_0_RW_CFG_0		0x3000
> +#define CORE_DIG_DLANE_1_RW_CFG_0		0x3200
> +#define CORE_DIG_DLANE_2_RW_CFG_0		0x3400
> +#define CORE_DIG_DLANE_3_RW_CFG_0		0x3600
> +#define CORE_AFE_LANE0_CTRL_2_9			0x1029
> +#define CORE_AFE_LANE1_CTRL_2_9			0x1229
> +#define CORE_AFE_LANE2_CTRL_2_9			0x1429
> +#define CORE_AFE_LANE3_CTRL_2_9			0x1629
> +#define CORE_AFE_LANE4_CTRL_2_9			0x1829
> +#define CORE_DIG_RW_COMMON_6			0x1C46
> +#define CORE_DIG_RW_COMMON_7			0x1C47
> +#define PPI_RW_DDLCAL_CFG_0			0x0E20
> +#define PPI_RW_DDLCAL_CFG_1			0x0E21
> +#define PPI_RW_DDLCAL_CFG_2			0x0E22
> +#define PPI_RW_DDLCAL_CFG_3			0x0E23
> +#define PPI_RW_DDLCAL_CFG_4			0x0E24
> +#define PPI_RW_DDLCAL_CFG_5			0x0E25
> +#define PPI_RW_DDLCAL_CFG_6			0x0E26
> +#define PPI_RW_DDLCAL_CFG_7			0x0E27
> +#define CORE_AFE_LANE0_CTRL_2_8			0x1028
> +#define CORE_AFE_LANE1_CTRL_2_8			0x1228
> +#define CORE_AFE_LANE2_CTRL_2_8			0x1428
> +#define CORE_AFE_LANE3_CTRL_2_8			0x1628
> +#define CORE_AFE_LANE4_CTRL_2_8			0x1828
> +#define CORE_DIG_DLANE_0_RW_LP_0		0x3040
> +#define CORE_DIG_DLANE_1_RW_LP_0		0x3240
> +#define CORE_DIG_DLANE_2_RW_LP_0		0x3440
> +#define CORE_DIG_DLANE_3_RW_LP_0		0x3640
> +#define CORE_AFE_LANE0_CTRL_2_2			0x1022
> +#define CORE_AFE_LANE1_CTRL_2_2			0x1222
> +#define CORE_AFE_LANE2_CTRL_2_2			0x1422
> +#define CORE_AFE_LANE3_CTRL_2_2			0x1622
> +#define CORE_AFE_LANE4_CTRL_2_2			0x1822
> +#define CORE_AFE_LANE0_CTRL_2_12		0x102C
> +#define CORE_AFE_LANE1_CTRL_2_12		0x122C
> +#define CORE_AFE_LANE2_CTRL_2_12		0x142C
> +#define CORE_AFE_LANE3_CTRL_2_12		0x162C
> +#define CORE_AFE_LANE4_CTRL_2_12		0x182C
> +#define CORE_AFE_LANE0_CTRL_2_13		0x102D
> +#define CORE_AFE_LANE1_CTRL_2_13		0x122D
> +#define CORE_AFE_LANE2_CTRL_2_13		0x142D
> +#define CORE_AFE_LANE3_CTRL_2_13		0x162D
> +#define CORE_AFE_LANE4_CTRL_2_13		0x182D
> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_0		0x3880
> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_7		0x3887
> +#define CORE_DIG_DLANE_0_RW_HS_RX_0		0x3080
> +#define CORE_DIG_DLANE_1_RW_HS_RX_0		0x3280
> +#define CORE_DIG_DLANE_2_RW_HS_RX_0		0x3480
> +#define CORE_DIG_DLANE_3_RW_HS_RX_0		0x3680
> +#define CORE_DIG_DLANE_0_RW_CFG_1		0x3001
> +#define CORE_DIG_DLANE_1_RW_CFG_1		0x3201
> +#define CORE_DIG_DLANE_2_RW_CFG_1		0x3401
> +#define CORE_DIG_DLANE_3_RW_CFG_1		0x3601
> +#define CORE_DIG_DLANE_0_RW_HS_RX_2		0x3082
> +#define CORE_DIG_DLANE_1_RW_HS_RX_2		0x3282
> +#define CORE_DIG_DLANE_2_RW_HS_RX_2		0x3482
> +#define CORE_DIG_DLANE_3_RW_HS_RX_2		0x3682
> +#define CORE_DIG_DLANE_0_RW_LP_2		0x3042
> +#define CORE_DIG_DLANE_1_RW_LP_2		0x3242
> +#define CORE_DIG_DLANE_2_RW_LP_2		0x3442
> +#define CORE_DIG_DLANE_3_RW_LP_2		0x3642
> +#define CORE_DIG_DLANE_CLK_RW_LP_0		0x3840
> +#define CORE_DIG_DLANE_CLK_RW_LP_2		0x3842
> +#define CORE_DIG_DLANE_0_RW_HS_RX_1		0x3081
> +#define CORE_DIG_DLANE_1_RW_HS_RX_1		0x3281
> +#define CORE_DIG_DLANE_2_RW_HS_RX_1		0x3481
> +#define CORE_DIG_DLANE_3_RW_HS_RX_1		0x3681
> +#define CORE_DIG_DLANE_0_RW_HS_RX_3		0x3083
> +#define CORE_DIG_DLANE_1_RW_HS_RX_3		0x3283
> +#define CORE_DIG_DLANE_2_RW_HS_RX_3		0x3483
> +#define CORE_DIG_DLANE_3_RW_HS_RX_3		0x3683
> +#define CORE_DIG_DLANE_0_RW_HS_RX_4		0x3084
> +#define CORE_DIG_DLANE_1_RW_HS_RX_4		0x3284
> +#define CORE_DIG_DLANE_2_RW_HS_RX_4		0x3484
> +#define CORE_DIG_DLANE_3_RW_HS_RX_4		0x3684
> +#define CORE_DIG_DLANE_0_RW_HS_RX_5		0x3085
> +#define CORE_DIG_DLANE_1_RW_HS_RX_5		0x3285
> +#define CORE_DIG_DLANE_2_RW_HS_RX_5		0x3485
> +#define CORE_DIG_DLANE_3_RW_HS_RX_5		0x3685
> +#define CORE_DIG_DLANE_0_RW_HS_RX_6		0x3086
> +#define CORE_DIG_DLANE_1_RW_HS_RX_6		0x3286
> +#define CORE_DIG_DLANE_2_RW_HS_RX_6		0x3486
> +#define CORE_DIG_DLANE_3_RW_HS_RX_6		0x3686
> +#define CORE_DIG_DLANE_0_RW_HS_RX_7		0x3087
> +#define CORE_DIG_DLANE_1_RW_HS_RX_7		0x3287
> +#define CORE_DIG_DLANE_2_RW_HS_RX_7		0x3487
> +#define CORE_DIG_DLANE_3_RW_HS_RX_7		0x3687
> +#define CORE_DIG_DLANE_0_RW_HS_RX_9		0x3089
> +#define CORE_DIG_DLANE_1_RW_HS_RX_9		0x3289
> +#define CORE_DIG_DLANE_2_RW_HS_RX_9		0x3489
> +#define CORE_DIG_DLANE_3_RW_HS_RX_9		0x3689
> +#define PPI_R_TERMCAL_DEBUG_0			0x0E41
> +
> +#define PPI_STARTUP_RW_COMMON_DPHY_2_RCAL_ADDR_MASK				0x00FF
> +#define PPI_STARTUP_RW_COMMON_DPHY_10_PHY_READY_ADDR_MASK			0x00FF
> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_VAL_MASK		0x2000
> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_EN_MASK		0x1000
> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0_CB_LP_DCO_EN_DLY_MASK		0x00FC
> +#define PPI_STARTUP_RW_COMMON_STARTUP_1_1_PHY_READY_DLY_MASK			0x0FFF
> +#define PPI_STARTUP_RW_COMMON_DPHY_6_LP_DCO_CAL_ADDR_MASK			0x00FF
> +#define PPI_CALIBCTRL_RW_COMMON_BG_0_BG_MAX_COUNTER_MASK			0x01FF
> +#define PPI_RW_LPDCOCAL_NREF_LPDCOCAL_NREF_MASK					0x07FF
> +#define PPI_RW_LPDCOCAL_NREF_RANGE_LPDCOCAL_NREF_RANGE_MASK			0x001F
> +#define PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_PON_MASK			0xFE00
> +#define PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_TRACKING_EN_MASK			0x0001
> +#define PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_USE_IDEAL_NREF_MASK			0x0002
> +#define PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_NREF_RANGE_MASK			0x007C
> +#define PPI_RW_LPDCOCAL_COARSE_CFG_NCOARSE_START_MASK				0x0003
> +#define PPI_RW_COMMON_CFG_CFG_CLK_DIV_FACTOR_MASK				0x0003
> +#define PPI_RW_TERMCAL_CFG_0_TERMCAL_TIMER_MASK					0x007F
> +#define PPI_RW_OFFSETCAL_CFG_0_OFFSETCAL_WAIT_THRESH_MASK			0x001F
> +#define PPI_RW_LPDCOCAL_TIMEBASE_LPDCOCAL_TIMEBASE_MASK				0x03FF
> +#define PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_COARSE_MASK			0x01FF
> +#define PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_TWAIT_FINE_MASK			0xFF80
> +#define CORE_AFE_CTRL_2_0_OA_CB_HSTX_VCOMM_REG_PON_OVR_VAL_MASK			0x0400
> +#define CORE_AFE_CTRL_2_1_OA_CB_HSTX_VCOMM_REG_PON_OVR_EN_MASK			0x0400
> +#define CORE_AFE_CTRL_2_1_OA_CB_HSTXLB_DCO_CLK0_EN_OVR_VAL_MASK			0x8000
> +#define CORE_AFE_CTRL_2_3_OA_CB_HSTXLB_DCO_CLK0_EN_OVR_EN_MASK			0x0100
> +#define CORE_AFE_CTRL_2_0_OA_CB_HSTXLB_DCO_CLK90_EN_OVR_VAL_MASK		0x8000
> +#define CORE_AFE_CTRL_2_3_OA_CB_HSTXLB_DCO_CLK90_EN_OVR_EN_MASK			0x0200
> +#define CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_EN_OVR_EN_MASK			0x2000
> +#define CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_EN_OVR_VAL_MASK			0x0200
> +#define CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_PON_OVR_EN_MASK			0x1000
> +#define CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_PON_OVR_VAL_MASK			0x0100
> +#define CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_TUNE_CLKDIG_EN_OVR_EN_MASK		0x4000
> +#define CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_TUNE_CLKDIG_EN_OVR_VAL_MASK		0x0400
> +#define CORE_AFE_CTRL_2_5_OA_CB_SEL_45OHM_50OHM_MASK				0x0100
> +#define CORE_DIG_DLANE_CLK_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
> +#define CORE_DIG_DLANE_0_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
> +#define CORE_DIG_DLANE_1_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
> +#define CORE_DIG_DLANE_2_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
> +#define CORE_DIG_DLANE_3_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
> +#define CORE_DIG_DLANE_0_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
> +#define CORE_DIG_DLANE_1_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
> +#define CORE_DIG_DLANE_2_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
> +#define CORE_DIG_DLANE_3_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
> +#define CORE_AFE_LANE0_CTRL_2_9_OA_LANE0_HSRX_SEL_GATED_POLARITY_MASK		0x0100
> +#define CORE_AFE_LANE1_CTRL_2_9_OA_LANE1_HSRX_SEL_GATED_POLARITY_MASK		0x0100
> +#define CORE_AFE_LANE2_CTRL_2_9_OA_LANE2_HSRX_SEL_GATED_POLARITY_MASK		0x0100
> +#define CORE_AFE_LANE3_CTRL_2_9_OA_LANE3_HSRX_SEL_GATED_POLARITY_MASK		0x0100
> +#define CORE_AFE_LANE4_CTRL_2_9_OA_LANE4_HSRX_SEL_GATED_POLARITY_MASK		0x0100
> +#define CORE_DIG_RW_COMMON_7_LANE0_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x0003
> +#define CORE_DIG_RW_COMMON_7_LANE1_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x000C
> +#define CORE_DIG_RW_COMMON_7_LANE2_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x0030
> +#define CORE_DIG_RW_COMMON_7_LANE3_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x00C0
> +#define CORE_DIG_RW_COMMON_7_LANE4_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x0300
> +#define PPI_STARTUP_RW_COMMON_DPHY_8_CPHY_DDL_CAL_ADDR_MASK			0x00FF
> +#define PPI_STARTUP_RW_COMMON_DPHY_7_DPHY_DDL_CAL_ADDR_MASK			0x00FF
> +#define PPI_RW_DDLCAL_CFG_0_DDLCAL_TIMEBASE_TARGET_MASK				0x03FF
> +#define PPI_RW_DDLCAL_CFG_7_DDLCAL_DECR_WAIT_MASK				0x1F80
> +#define PPI_RW_DDLCAL_CFG_1_DDLCAL_DISABLE_TIME_MASK				0xFF00
> +#define PPI_RW_DDLCAL_CFG_2_DDLCAL_WAIT_MASK					0xF000
> +#define PPI_RW_DDLCAL_CFG_2_DDLCAL_TUNE_MODE_MASK				0x0C00
> +#define PPI_RW_DDLCAL_CFG_2_DDLCAL_DDL_DLL_MASK					0x0100
> +#define PPI_RW_DDLCAL_CFG_2_DDLCAL_ENABLE_WAIT_MASK				0x00FF
> +#define PPI_RW_DDLCAL_CFG_2_DDLCAL_UPDATE_SETTINGS_MASK				0x0200
> +#define PPI_RW_DDLCAL_CFG_4_DDLCAL_STUCK_THRESH_MASK				0x03FF
> +#define PPI_RW_DDLCAL_CFG_6_DDLCAL_MAX_DIFF_MASK				0x03FF
> +#define PPI_RW_DDLCAL_CFG_7_DDLCAL_START_DELAY_MASK				0x007F
> +#define PPI_RW_DDLCAL_CFG_3_DDLCAL_COUNTER_REF_MASK				0x03FF
> +#define PPI_RW_DDLCAL_CFG_1_DDLCAL_MAX_PHASE_MASK				0x00FF
> +#define PPI_RW_DDLCAL_CFG_5_DDLCAL_DLL_FBK_MASK					0x03F0
> +#define PPI_RW_DDLCAL_CFG_5_DDLCAL_DDL_COARSE_BANK_MASK				0x000F
> +#define CORE_AFE_LANE0_CTRL_2_8_OA_LANE0_HSRX_CDPHY_SEL_FAST_MASK		0x1000
> +#define CORE_AFE_LANE1_CTRL_2_8_OA_LANE1_HSRX_CDPHY_SEL_FAST_MASK		0x1000
> +#define CORE_AFE_LANE2_CTRL_2_8_OA_LANE2_HSRX_CDPHY_SEL_FAST_MASK		0x1000
> +#define CORE_AFE_LANE3_CTRL_2_8_OA_LANE3_HSRX_CDPHY_SEL_FAST_MASK		0x1000
> +#define CORE_AFE_LANE4_CTRL_2_8_OA_LANE4_HSRX_CDPHY_SEL_FAST_MASK		0x1000
> +#define CORE_DIG_DLANE_0_RW_LP_0_LP_0_TTAGO_REG_MASK				0x0F00
> +#define CORE_DIG_DLANE_1_RW_LP_0_LP_0_TTAGO_REG_MASK				0x0F00
> +#define CORE_DIG_DLANE_2_RW_LP_0_LP_0_TTAGO_REG_MASK				0x0F00
> +#define CORE_DIG_DLANE_3_RW_LP_0_LP_0_TTAGO_REG_MASK				0x0F00
> +#define CORE_AFE_LANE0_CTRL_2_2_OA_LANE0_SEL_LANE_CFG_MASK			0x0001
> +#define CORE_AFE_LANE1_CTRL_2_2_OA_LANE1_SEL_LANE_CFG_MASK			0x0001
> +#define CORE_AFE_LANE2_CTRL_2_2_OA_LANE2_SEL_LANE_CFG_MASK			0x0001
> +#define CORE_AFE_LANE3_CTRL_2_2_OA_LANE3_SEL_LANE_CFG_MASK			0x0001
> +#define CORE_AFE_LANE4_CTRL_2_2_OA_LANE4_SEL_LANE_CFG_MASK			0x0001
> +#define CORE_DIG_RW_COMMON_6_DESERIALIZER_EN_DEASS_COUNT_THRESH_D_MASK		0x0038
> +#define CORE_DIG_RW_COMMON_6_DESERIALIZER_DIV_EN_DELAY_THRESH_D_MASK		0x0007
> +#define CORE_AFE_LANE0_CTRL_2_12_OA_LANE0_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
> +#define CORE_AFE_LANE1_CTRL_2_12_OA_LANE1_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
> +#define CORE_AFE_LANE2_CTRL_2_12_OA_LANE2_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
> +#define CORE_AFE_LANE3_CTRL_2_12_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
> +#define CORE_AFE_LANE4_CTRL_2_12_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
> +#define CORE_AFE_LANE0_CTRL_2_13_OA_LANE0_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK	0x0002
> +#define CORE_AFE_LANE1_CTRL_2_13_OA_LANE1_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK	0x0002
> +#define CORE_AFE_LANE2_CTRL_2_13_OA_LANE2_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK	0x0002
> +#define CORE_AFE_LANE3_CTRL_2_13_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK		0x0002
> +#define CORE_AFE_LANE4_CTRL_2_13_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK		0x0002
> +#define CORE_AFE_LANE0_CTRL_2_12_OA_LANE0_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
> +#define CORE_AFE_LANE1_CTRL_2_12_OA_LANE1_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
> +#define CORE_AFE_LANE2_CTRL_2_12_OA_LANE2_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
> +#define CORE_AFE_LANE3_CTRL_2_12_OA_LANE3_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
> +#define CORE_AFE_LANE4_CTRL_2_12_OA_LANE4_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
> +#define CORE_AFE_LANE0_CTRL_2_13_OA_LANE0_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
> +#define CORE_AFE_LANE1_CTRL_2_13_OA_LANE1_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
> +#define CORE_AFE_LANE2_CTRL_2_13_OA_LANE2_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
> +#define CORE_AFE_LANE3_CTRL_2_13_OA_LANE3_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
> +#define CORE_AFE_LANE4_CTRL_2_13_OA_LANE4_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
> +#define CORE_AFE_LANE2_CTRL_2_9_OA_LANE2_HSRX_HS_CLK_DIV_MASK			0x00E0
> +#define CORE_AFE_LANE1_CTRL_2_9_OA_LANE1_HSRX_HS_CLK_DIV_MASK			0x00E0
> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_0_HS_RX_0_TCLKSETTLE_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_7_HS_RX_7_TCLKMISS_REG_MASK			0x00FF
> +#define CORE_DIG_DLANE_0_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK			0xFF00
> +#define CORE_DIG_DLANE_1_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK			0xFF00
> +#define CORE_DIG_DLANE_2_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK			0xFF00
> +#define CORE_DIG_DLANE_3_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK			0xFF00
> +#define CORE_DIG_DLANE_0_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK		0x0004
> +#define CORE_DIG_DLANE_1_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK		0x0004
> +#define CORE_DIG_DLANE_2_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK		0x0004
> +#define CORE_DIG_DLANE_3_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK		0x0004
> +#define CORE_DIG_DLANE_0_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK			0x0008
> +#define CORE_DIG_DLANE_1_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK			0x0008
> +#define CORE_DIG_DLANE_2_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK			0x0008
> +#define CORE_DIG_DLANE_3_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK			0x0008
> +#define CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK		0x8000
> +#define CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK		0x8000
> +#define CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK		0x8000
> +#define CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK		0x8000
> +#define CORE_DIG_DLANE_0_RW_LP_0_LP_0_ITMINRX_REG_MASK				0xF000
> +#define CORE_DIG_DLANE_1_RW_LP_0_LP_0_ITMINRX_REG_MASK				0xF000
> +#define CORE_DIG_DLANE_2_RW_LP_0_LP_0_ITMINRX_REG_MASK				0xF000
> +#define CORE_DIG_DLANE_3_RW_LP_0_LP_0_ITMINRX_REG_MASK				0xF000
> +#define CORE_DIG_DLANE_0_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
> +#define CORE_DIG_DLANE_1_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
> +#define CORE_DIG_DLANE_2_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
> +#define CORE_DIG_DLANE_3_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
> +#define CORE_DIG_DLANE_CLK_RW_LP_0_LP_0_ITMINRX_REG_MASK			0xF000
> +#define CORE_DIG_DLANE_CLK_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
> +#define CORE_DIG_DLANE_0_RW_HS_RX_2_HS_UPDATE_SETTINGS_DESKEW_REG_MASK		0x2000
> +#define CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_UPDATE_SETTINGS_DESKEW_REG_MASK	0x2000
> +#define CORE_DIG_DLANE_2_RW_HS_RX_2_HS_UPDATE_SETTINGS_DESKEW_REG_MASK		0x2000
> +#define CORE_DIG_DLANE_3_RW_HS_RX_2_HS_UPDATE_SETTINGS_DESKEW_REG_MASK		0x2000
> +#define CORE_DIG_DLANE_0_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_1_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_2_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_3_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK		0x1E00
> +#define CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK		0x1E00
> +#define CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK		0x1E00
> +#define CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK		0x1E00
> +#define CORE_DIG_DLANE_0_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK		0x0007
> +#define CORE_DIG_DLANE_1_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK		0x0007
> +#define CORE_DIG_DLANE_2_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK		0x0007
> +#define CORE_DIG_DLANE_3_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK		0x0007
> +#define CORE_DIG_DLANE_0_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK	0xFFFF
> +#define CORE_DIG_DLANE_1_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK	0xFFFF
> +#define CORE_DIG_DLANE_2_RW_HS_RX_4_HS_MAX_ITERATIONS_DESKEW_REG_MASK		0xFFFF
> +#define CORE_DIG_DLANE_3_RW_HS_RX_4_HS_MAX_ITERATIONS_DESKEW_REG_MASK		0xFFFF
> +#define CORE_DIG_DLANE_0_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_1_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_2_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_3_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_0_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK		0xFF00
> +#define CORE_DIG_DLANE_1_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK		0xFF00
> +#define CORE_DIG_DLANE_2_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK		0xFF00
> +#define CORE_DIG_DLANE_3_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK		0xFF00
> +#define CORE_DIG_DLANE_0_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_1_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_2_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_3_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_0_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK	0x2000
> +#define CORE_DIG_DLANE_1_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK	0x2000
> +#define CORE_DIG_DLANE_2_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK	0x2000
> +#define CORE_DIG_DLANE_3_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK	0x2000
> +#define CORE_DIG_DLANE_0_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK	0x8000
> +#define CORE_DIG_DLANE_1_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK	0x8000
> +#define CORE_DIG_DLANE_2_RW_HS_RX_7_HS_SELECT_ALTERNATE_ALGO_REG_MASK		0x8000
> +#define CORE_DIG_DLANE_3_RW_HS_RX_7_HS_SELECT_ALTERNATE_ALGO_REG_MASK		0x8000
> +#define CORE_DIG_DLANE_0_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK		0x01F8
> +#define CORE_DIG_DLANE_1_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK		0x01F8
> +#define CORE_DIG_DLANE_2_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK		0x01F8
> +#define CORE_DIG_DLANE_3_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK		0x01F8
> +#define CORE_DIG_DLANE_0_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_1_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_2_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_3_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK		0x00FF
> +#define CORE_DIG_DLANE_0_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK	0xFF00
> +#define CORE_DIG_DLANE_1_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK	0xFF00
> +#define CORE_DIG_DLANE_2_RW_HS_RX_6_HS_MIN_EYE_OPENING_DESKEW_REG_MASK		0xFF00
> +#define CORE_DIG_DLANE_3_RW_HS_RX_6_HS_MIN_EYE_OPENING_DESKEW_REG_MASK		0xFF00
> +#define CORE_DIG_DLANE_CLK_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
> +
> +struct isp4phy_mipi_reg_seq {
> +	u16 addr;
> +	u16 mask;
> +	u16 data;
> +};
> +
> +union isp4phy_mipi_0 {
> +	struct {
> +		u32 shutdownz : 1;
> +		u32 rstz : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_1 {
> +	struct {
> +		u32 mode : 1;

Please pad these -- I don't think the ABI otherwise requires they're in a
particular location of the container (u32).

> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_2 {
> +	struct {
> +		u32 rxdatawidthhs_0 : 2;
> +		u32 rxdatawidthhs_1 : 2;
> +		u32 rxdatawidthhs_2 : 2;
> +		u32 rxdatawidthhs_3 : 2;
> +	} bit;
> +	u32 value;
> +};
> +
> +struct isp4phy_mipi_3 {
> +	u32 reserved;
> +};
> +
> +union isp4phy_mipi_4 {
> +	struct {
> +		u32 enableclk : 1;
> +		u32 enable_0 : 1;
> +		u32 enable_1 : 1;
> +		u32 enable_2 : 1;
> +		u32 enable_3 : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_5 {
> +	struct {
> +		u32 forcerxmode_0 : 1;
> +		u32 forcerxmode_1 : 1;
> +		u32 forcerxmode_2 : 1;
> +		u32 forcerxmode_3 : 1;
> +		u32 forcerxmode_clk : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_6 {
> +	struct {
> +		u32 turndisable_0 : 1;
> +		u32 turndisable_1 : 1;
> +		u32 turndisable_2 : 1;
> +		u32 turndisable_3 : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_7 {
> +	struct {
> +		u32 ready : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_ind_idx {
> +	struct {
> +		u32 addr : 16;

u16 would seem appropriate here.

> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_ind_data {
> +	struct {
> +		u32 data : 16;

Ditto.

> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_ind_wack {
> +	struct {
> +		u32 ack : 1;
> +		u32 pslverr : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +struct isp4phy_mipi_reg {
> +	union isp4phy_mipi_0 isp_mipi_phy0;
> +	union isp4phy_mipi_1 isp_mipi_phy1;
> +	union isp4phy_mipi_2 isp_mipi_phy2;
> +	struct isp4phy_mipi_3 isp_mipi_phy3;
> +	union isp4phy_mipi_4 isp_mipi_phy4;
> +	union isp4phy_mipi_5 isp_mipi_phy5;
> +	union isp4phy_mipi_6 isp_mipi_phy6;
> +	union isp4phy_mipi_7 isp_mipi_phy7;
> +	u32 reserve;

"reserved"?

> +	union isp4phy_mipi_ind_idx isp_mipi_phy_ind_idx;
> +	union isp4phy_mipi_ind_data isp_mipi_phy_ind_data;
> +	union isp4phy_mipi_ind_wack isp_mipi_phy_inc_wack;
> +};
> +
> +struct isp4phy_mipi_config {
> +	u16 afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg;
> +	u16 max_phase;
> +	u16 ddlcal_cfg_5ddlcal_dll_fbk_reg;
> +	u16 ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg;
> +	u16 afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg;
> +	u16 afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg;
> +	u16 afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg;
> +	u16 afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg;
> +	u16 cfg_1cfg_1_sot_detection_reg;
> +	u16 hs_rx_2hs_rx_2_ignore_alterncal_reg;
> +	u16 cfg_1cfg_1_deskew_supported_reg;
> +	u16 afe_lanex_ctrl_2_9oa_hs_clk_div_reg;
> +	u16 hs_rx_0hs_rx_0_thssettle_reg;
> +	u16 hs_rx_3hs_rx_3_fjump_deskew_reg;
> +	u16 hs_rx_6hs_rx_6_min_eye_opening_deskew_reg;
> +};
> +
> +enum isp4phy_mipi_id {
> +	ISP_MIPI_PHY_ID_0    = 0,
> +	ISP_MIPI_PHY_ID_1    = 1,
> +	ISP_MIPI_PHY_ID_2    = 2,
> +	ISP_MIPI_PHY_ID_MAX
> +};
> +
> +static const struct isp4phy_mipi_reg *isp_mipi_phy_reg[ISP_MIPI_PHY_ID_MAX] = {
> +	(struct isp4phy_mipi_reg *)ISP_MIPI_PHY0_REG0,
> +	(struct isp4phy_mipi_reg *)ISP_MIPI_PHY1_REG0,
> +	(struct isp4phy_mipi_reg *)ISP_MIPI_PHY2_REG0,

That's an interesting way to prefill structs. I don't think these macros
expand to valid pointers.

> +};
> +
> +static const struct isp4phy_mipi_reg_seq startup_seq_general_common_config[] = {
> +	{ PPI_STARTUP_RW_COMMON_DPHY_10, PPI_STARTUP_RW_COMMON_DPHY_10_PHY_READY_ADDR_MASK, 0x30 },
> +	{
> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2,
> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_VAL_MASK, 0x0
> +	},
> +	{
> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2,
> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_EN_MASK, 0x1
> +	},
> +	{
> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0,
> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0_CB_LP_DCO_EN_DLY_MASK, 0x3F
> +	},
> +	{
> +		PPI_STARTUP_RW_COMMON_STARTUP_1_1,
> +		PPI_STARTUP_RW_COMMON_STARTUP_1_1_PHY_READY_DLY_MASK, 0x233
> +	},
> +	{ PPI_STARTUP_RW_COMMON_DPHY_6, PPI_STARTUP_RW_COMMON_DPHY_6_LP_DCO_CAL_ADDR_MASK, 0x27 },
> +	{ PPI_CALIBCTRL_RW_COMMON_BG_0, PPI_CALIBCTRL_RW_COMMON_BG_0_BG_MAX_COUNTER_MASK, 0x1F4 },
> +	{ PPI_RW_LPDCOCAL_NREF, PPI_RW_LPDCOCAL_NREF_LPDCOCAL_NREF_MASK, 0x320 },
> +	{ PPI_RW_LPDCOCAL_NREF_RANGE, PPI_RW_LPDCOCAL_NREF_RANGE_LPDCOCAL_NREF_RANGE_MASK, 0x1B },
> +	{ PPI_RW_LPDCOCAL_TWAIT_CONFIG, PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_PON_MASK, 0x7F},
> +	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_NREF_RANGE_MASK, 0x1B },
> +	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_USE_IDEAL_NREF_MASK, 0x1 },
> +	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_TRACKING_EN_MASK, 0x0 },
> +	{ PPI_RW_LPDCOCAL_COARSE_CFG, PPI_RW_LPDCOCAL_COARSE_CFG_NCOARSE_START_MASK, 0x1 },
> +	{ PPI_RW_COMMON_CFG, PPI_RW_COMMON_CFG_CFG_CLK_DIV_FACTOR_MASK, 0x3 },
> +};
> +
> +static const struct isp4phy_mipi_reg_seq startup_seq_common[] = {
> +	{ PPI_STARTUP_RW_COMMON_DPHY_2, PPI_STARTUP_RW_COMMON_DPHY_2_RCAL_ADDR_MASK, 0x5 },
> +	{ PPI_RW_TERMCAL_CFG_0, PPI_RW_TERMCAL_CFG_0_TERMCAL_TIMER_MASK, 0x17 },
> +	{ PPI_RW_OFFSETCAL_CFG_0, PPI_RW_OFFSETCAL_CFG_0_OFFSETCAL_WAIT_THRESH_MASK, 0x4 },
> +	{ PPI_RW_LPDCOCAL_TIMEBASE, PPI_RW_LPDCOCAL_TIMEBASE_LPDCOCAL_TIMEBASE_MASK, 0x5F },
> +	{
> +		PPI_RW_LPDCOCAL_TWAIT_CONFIG,
> +		PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_COARSE_MASK, 0x1D
> +	},
> +	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_TWAIT_FINE_MASK, 0x1D },
> +	{ CORE_AFE_CTRL_2_0, CORE_AFE_CTRL_2_0_OA_CB_HSTX_VCOMM_REG_PON_OVR_VAL_MASK, 0x0 },
> +	{ CORE_AFE_CTRL_2_1, CORE_AFE_CTRL_2_1_OA_CB_HSTX_VCOMM_REG_PON_OVR_EN_MASK, 0x1 },
> +	{ CORE_AFE_CTRL_2_1, CORE_AFE_CTRL_2_1_OA_CB_HSTXLB_DCO_CLK0_EN_OVR_VAL_MASK, 0x0 },
> +	{ CORE_AFE_CTRL_2_3, CORE_AFE_CTRL_2_3_OA_CB_HSTXLB_DCO_CLK0_EN_OVR_EN_MASK, 0x1 },
> +	{ CORE_AFE_CTRL_2_0, CORE_AFE_CTRL_2_0_OA_CB_HSTXLB_DCO_CLK90_EN_OVR_VAL_MASK, 0x0 },
> +	{ CORE_AFE_CTRL_2_3, CORE_AFE_CTRL_2_3_OA_CB_HSTXLB_DCO_CLK90_EN_OVR_EN_MASK, 0x1 },
> +	{ CORE_AFE_CTRL_2_6, CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_EN_OVR_EN_MASK, 0x1 },
> +	{ CORE_AFE_CTRL_2_7, CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_EN_OVR_VAL_MASK, 0x0 },
> +	{ CORE_AFE_CTRL_2_6, CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_PON_OVR_EN_MASK, 0x1 },
> +	{ CORE_AFE_CTRL_2_7, CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_PON_OVR_VAL_MASK, 0x0 },
> +	{ CORE_AFE_CTRL_2_6, CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_TUNE_CLKDIG_EN_OVR_EN_MASK, 0x1 },
> +	{ CORE_AFE_CTRL_2_7, CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_TUNE_CLKDIG_EN_OVR_VAL_MASK, 0x0 },
> +	{ CORE_AFE_CTRL_2_5, CORE_AFE_CTRL_2_5_OA_CB_SEL_45OHM_50OHM_MASK, 0x0 },
> +};
> +
> +static const struct isp4phy_mipi_reg_seq
> +	startup_seq_dphy_periodic_deskew_program[] = {
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x404 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x40C },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x414 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x41C },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x423 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x429 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x430 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x43A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x445 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x44A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x450 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x45A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x465 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x469 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x472 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x47A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x485 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x489 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x490 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x49A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4A4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4AC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4B4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4BC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4C4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4CC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4D4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4DC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4E4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4EC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4F4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4FC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x504 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x50C },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x514 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x51C },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x523 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x529 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x530 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x53A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x545 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x54A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x550 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x55A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x565 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x569 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x572 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x57A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x585 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x589 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x590 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x59A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5A4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5AC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5B4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5BC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5C4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5CC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5D4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5DC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5E4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5EC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5F4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5FC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x604 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x60C },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x614 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x61C },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x623 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x629 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x632 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x63A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x645 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x64A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x650 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x65A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x665 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x669 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x672 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x67A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x685 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x689 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x690 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x69A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6A4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6AC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6B4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6BC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6C4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6CC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6D4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6DC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6E4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6EC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6F4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6FC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x704 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x70C },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x714 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x71C },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x723 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x72A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x730 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x73A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x745 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x74A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x750 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x75A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x765 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x769 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x772 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x77A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x785 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x789 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x790 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x79A },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7A4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7AC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7B4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7BC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7C4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7CC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7D4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7DC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7E4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7EC },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7F4 },
> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7FC },
> +};
> +
> +inline u16 isp4phy_rreg(void __iomem *base, u32 phy_id, u16 addr)
> +{
> +	const struct isp4phy_mipi_reg *reg = isp_mipi_phy_reg[phy_id];
> +
> +	isp4hw_wreg(base, (uintptr_t)(&reg->isp_mipi_phy_ind_idx), addr);
> +	return (u16)isp4hw_rreg(base, (uintptr_t)(&reg->isp_mipi_phy_ind_data));

Redundant parentheses.

> +}
> +
> +inline void isp4phy_wreg(void __iomem *base, u32 phy_id, u16 addr, u16 data)
> +{
> +	const struct isp4phy_mipi_reg *reg = isp_mipi_phy_reg[phy_id];
> +
> +	isp4hw_wreg(base, (uintptr_t)(&reg->isp_mipi_phy_ind_idx), addr);
> +	isp4hw_wreg(base, (uintptr_t)(&reg->isp_mipi_phy_ind_data), data);
> +}
> +
> +static void isp4phy_mask_wreg(void __iomem *base, u32 phy_id, u16 addr,
> +			      u16 mask, u16 regval)
> +{
> +	unsigned long _mask = mask;
> +	u16 shift = 0;
> +	u16 data;
> +
> +	data = isp4phy_rreg(base, phy_id, addr);
> +	if (mask)
> +		shift = find_first_bit(&_mask, 16);

__ffs()?

> +	data = (data & ~mask) | ((regval << shift) & mask);
> +
> +	isp4phy_wreg(base, phy_id, addr, data);
> +}
> +
> +static void isp4phy_optional_features_dphy(void __iomem *base, u32 phy_id)
> +{
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_CFG_0,
> +			  CORE_DIG_DLANE_CLK_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_CFG_0,
> +			  CORE_DIG_DLANE_CLK_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_CFG_0,
> +			  CORE_DIG_DLANE_0_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_CFG_0,
> +			  CORE_DIG_DLANE_1_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_CFG_0,
> +				  CORE_DIG_DLANE_2_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_CFG_0,
> +				  CORE_DIG_DLANE_3_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_CFG_0,
> +			  CORE_DIG_DLANE_0_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_CFG_0,
> +			  CORE_DIG_DLANE_1_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_CFG_0,
> +				  CORE_DIG_DLANE_2_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_CFG_0,
> +				  CORE_DIG_DLANE_3_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_9,
> +			  CORE_AFE_LANE0_CTRL_2_9_OA_LANE0_HSRX_SEL_GATED_POLARITY_MASK, 0x0);
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_9,
> +			  CORE_AFE_LANE1_CTRL_2_9_OA_LANE1_HSRX_SEL_GATED_POLARITY_MASK, 0x0);
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_9,
> +			  CORE_AFE_LANE2_CTRL_2_9_OA_LANE2_HSRX_SEL_GATED_POLARITY_MASK, 0x0);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_9,
> +				  CORE_AFE_LANE3_CTRL_2_9_OA_LANE3_HSRX_SEL_GATED_POLARITY_MASK,
> +				  0x0);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_9,
> +				  CORE_AFE_LANE4_CTRL_2_9_OA_LANE4_HSRX_SEL_GATED_POLARITY_MASK,
> +				  0x0);
> +	}
> +}
> +
> +static void isp4phy_dphy_periodic_deskew_program(void __iomem *base,
> +						 u32 phy_id)
> +{
> +	for (int ctr = 0;

unsigned int?

> +	     ctr < ARRAY_SIZE(startup_seq_dphy_periodic_deskew_program);
> +	     ctr++)
> +		isp4phy_wreg(base, phy_id,
> +			     startup_seq_dphy_periodic_deskew_program[ctr].addr,
> +			     startup_seq_dphy_periodic_deskew_program[ctr].data);
> +}
> +
> +static void isp4phy_dphy_specific(void __iomem *base, u32 phy_id,
> +				  u64 data_rate,
> +				  struct isp4phy_mipi_config *phycfg)
> +{
> +	u64 half_rate = data_rate >> 1;
> +	u16 ddl_cal;
> +
> +	ddl_cal = TIMEBASE * half_rate;
> +	ddl_cal = (ddl_cal + 31) >> 5;

I think you could do this on a single line as well.

> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
> +			  CORE_DIG_RW_COMMON_7_LANE0_HSRX_WORD_CLK_SEL_GATING_REG_MASK, 0x0);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
> +			  CORE_DIG_RW_COMMON_7_LANE1_HSRX_WORD_CLK_SEL_GATING_REG_MASK, 0x0);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
> +			  CORE_DIG_RW_COMMON_7_LANE2_HSRX_WORD_CLK_SEL_GATING_REG_MASK, 0x0);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
> +				  CORE_DIG_RW_COMMON_7_LANE3_HSRX_WORD_CLK_SEL_GATING_REG_MASK,
> +				  0x0);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
> +				  CORE_DIG_RW_COMMON_7_LANE4_HSRX_WORD_CLK_SEL_GATING_REG_MASK,
> +				  0x0);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, PPI_STARTUP_RW_COMMON_DPHY_8,
> +			  PPI_STARTUP_RW_COMMON_DPHY_8_CPHY_DDL_CAL_ADDR_MASK, 0x50);
> +
> +	if (data_rate < 1500) {
> +		isp4phy_mask_wreg(base, phy_id, PPI_STARTUP_RW_COMMON_DPHY_7,
> +				  PPI_STARTUP_RW_COMMON_DPHY_7_DPHY_DDL_CAL_ADDR_MASK, 0x68);
> +	} else {
> +		/* Digital Delay Line (DDL) tuning calibration */
> +		isp4phy_mask_wreg(base, phy_id, PPI_STARTUP_RW_COMMON_DPHY_7,
> +				  PPI_STARTUP_RW_COMMON_DPHY_7_DPHY_DDL_CAL_ADDR_MASK, 0x28);
> +		/* LUT->24MHz case */
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_0,
> +				  PPI_RW_DDLCAL_CFG_0_DDLCAL_TIMEBASE_TARGET_MASK, 0x77);
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_7,
> +				  PPI_RW_DDLCAL_CFG_7_DDLCAL_DECR_WAIT_MASK, 0x22);
> +		/* LUT->24MHz case */
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_1,
> +				  PPI_RW_DDLCAL_CFG_1_DDLCAL_DISABLE_TIME_MASK, 0x17);
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
> +				  PPI_RW_DDLCAL_CFG_2_DDLCAL_WAIT_MASK, 0x4);
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
> +				  PPI_RW_DDLCAL_CFG_2_DDLCAL_TUNE_MODE_MASK, 0x2);
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
> +				  PPI_RW_DDLCAL_CFG_2_DDLCAL_DDL_DLL_MASK, 0x1);
> +		/* LUT->24MHz case */
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
> +				  PPI_RW_DDLCAL_CFG_2_DDLCAL_ENABLE_WAIT_MASK, 0x17);
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
> +				  PPI_RW_DDLCAL_CFG_2_DDLCAL_UPDATE_SETTINGS_MASK, 0x1);
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_4,
> +				  PPI_RW_DDLCAL_CFG_4_DDLCAL_STUCK_THRESH_MASK, 0xA);
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_6,
> +				  PPI_RW_DDLCAL_CFG_6_DDLCAL_MAX_DIFF_MASK, 0xA);
> +		/* LUT->24MHz case */
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_7,
> +				  PPI_RW_DDLCAL_CFG_7_DDLCAL_START_DELAY_MASK, 0xB);
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_3,
> +				  PPI_RW_DDLCAL_CFG_3_DDLCAL_COUNTER_REF_MASK, ddl_cal);
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_1,
> +				  PPI_RW_DDLCAL_CFG_1_DDLCAL_MAX_PHASE_MASK, phycfg->max_phase);
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_5,
> +				  PPI_RW_DDLCAL_CFG_5_DDLCAL_DLL_FBK_MASK,
> +				  phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg);
> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_5,
> +				  PPI_RW_DDLCAL_CFG_5_DDLCAL_DDL_COARSE_BANK_MASK,
> +				  phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_8,
> +				  CORE_AFE_LANE0_CTRL_2_8_OA_LANE0_HSRX_CDPHY_SEL_FAST_MASK,
> +				  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_8,
> +				  CORE_AFE_LANE1_CTRL_2_8_OA_LANE1_HSRX_CDPHY_SEL_FAST_MASK,
> +				  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_8,
> +				  CORE_AFE_LANE2_CTRL_2_8_OA_LANE2_HSRX_CDPHY_SEL_FAST_MASK,
> +				  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
> +		if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +			isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_8,
> +					  CORE_AFE_LANE3_CTRL_2_8_OA_LANE3_HSRX_CDPHY_SEL_FAST_MASK,
> +					  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
> +			isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_8,
> +					  CORE_AFE_LANE4_CTRL_2_8_OA_LANE4_HSRX_CDPHY_SEL_FAST_MASK,
> +					  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
> +		}
> +	}
> +
> +	/* Write  6 if Tlpx (far end / near end) ratio < 1
> +	 * Write  7 if Tlpx (far end / near end) ratio >= 1
> +	 */
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_0,
> +			  CORE_DIG_DLANE_0_RW_LP_0_LP_0_TTAGO_REG_MASK, 0x7);
> +	/* Write  6 if Tlpx (far end / near end) ratio < 1
> +	 * Write  7 if Tlpx (far end / near end) ratio >= 1
> +	 */
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_LP_0,
> +			  CORE_DIG_DLANE_1_RW_LP_0_LP_0_TTAGO_REG_MASK, 0x7);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		/* Write  6 if Tlpx (far end / near end) ratio < 1
> +		 * Write  7 if Tlpx (far end / near end) ratio >= 1
> +		 */
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_LP_0,
> +				  CORE_DIG_DLANE_2_RW_LP_0_LP_0_TTAGO_REG_MASK, 0x7);
> +		/* Write  6 if Tlpx (far end / near end) ratio < 1
> +		 * Write  7 if Tlpx (far end / near end) ratio >= 1
> +		 */
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_LP_0,
> +				  CORE_DIG_DLANE_3_RW_LP_0_LP_0_TTAGO_REG_MASK, 0x7);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_2,
> +			  CORE_AFE_LANE0_CTRL_2_2_OA_LANE0_SEL_LANE_CFG_MASK, 0x0);
> +
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_2,
> +				  CORE_AFE_LANE1_CTRL_2_2_OA_LANE1_SEL_LANE_CFG_MASK, 0x0);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_2,
> +				  CORE_AFE_LANE2_CTRL_2_2_OA_LANE2_SEL_LANE_CFG_MASK, 0x1);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_2,
> +				  CORE_AFE_LANE3_CTRL_2_2_OA_LANE3_SEL_LANE_CFG_MASK, 0x0);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_2,
> +				  CORE_AFE_LANE4_CTRL_2_2_OA_LANE4_SEL_LANE_CFG_MASK, 0x0);
> +	} else {
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_2,
> +				  CORE_AFE_LANE1_CTRL_2_2_OA_LANE1_SEL_LANE_CFG_MASK, 0x1);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_2,
> +				  CORE_AFE_LANE2_CTRL_2_2_OA_LANE2_SEL_LANE_CFG_MASK, 0x0);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_6,
> +			  CORE_DIG_RW_COMMON_6_DESERIALIZER_EN_DEASS_COUNT_THRESH_D_MASK, 0x1);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_6,
> +			  CORE_DIG_RW_COMMON_6_DESERIALIZER_DIV_EN_DELAY_THRESH_D_MASK, 0x1);
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_12,
> +			  CORE_AFE_LANE0_CTRL_2_12_OA_LANE0_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
> +			  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_12,
> +			  CORE_AFE_LANE1_CTRL_2_12_OA_LANE1_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
> +			  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_12,
> +			  CORE_AFE_LANE2_CTRL_2_12_OA_LANE2_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
> +			  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_12,
> +				  CORE_AFE_LANE3_CTRL_2_12_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
> +				  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_12,
> +				  CORE_AFE_LANE4_CTRL_2_12_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
> +				  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_13,
> +			  CORE_AFE_LANE0_CTRL_2_13_OA_LANE0_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
> +			  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_13,
> +			  CORE_AFE_LANE1_CTRL_2_13_OA_LANE1_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
> +			  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_13,
> +			  CORE_AFE_LANE2_CTRL_2_13_OA_LANE2_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
> +			  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_13,
> +				  CORE_AFE_LANE3_CTRL_2_13_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
> +				  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_13,
> +				  CORE_AFE_LANE4_CTRL_2_13_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
> +				  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_12,
> +			  CORE_AFE_LANE0_CTRL_2_12_OA_LANE0_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
> +			  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_12,
> +			  CORE_AFE_LANE1_CTRL_2_12_OA_LANE1_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
> +			  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_12,
> +			  CORE_AFE_LANE2_CTRL_2_12_OA_LANE2_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
> +			  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_12,
> +				  CORE_AFE_LANE3_CTRL_2_12_OA_LANE3_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
> +				  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_12,
> +				  CORE_AFE_LANE4_CTRL_2_12_OA_LANE4_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
> +				  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_13,
> +			  CORE_AFE_LANE0_CTRL_2_13_OA_LANE0_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
> +			  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_13,
> +			  CORE_AFE_LANE1_CTRL_2_13_OA_LANE1_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
> +			  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_13,
> +			  CORE_AFE_LANE2_CTRL_2_13_OA_LANE2_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
> +			  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_13,
> +				  CORE_AFE_LANE3_CTRL_2_13_OA_LANE3_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
> +				  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_13,
> +				  CORE_AFE_LANE4_CTRL_2_13_OA_LANE4_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
> +				  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_9,
> +				  CORE_AFE_LANE2_CTRL_2_9_OA_LANE2_HSRX_HS_CLK_DIV_MASK,
> +				  phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg);
> +	} else {
> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_9,
> +				  CORE_AFE_LANE1_CTRL_2_9_OA_LANE1_HSRX_HS_CLK_DIV_MASK,
> +				  phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_HS_RX_0,
> +			  CORE_DIG_DLANE_CLK_RW_HS_RX_0_HS_RX_0_TCLKSETTLE_REG_MASK, 0x1C);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_HS_RX_7,
> +			  CORE_DIG_DLANE_CLK_RW_HS_RX_7_HS_RX_7_TCLKMISS_REG_MASK, 0x6);
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_0,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK,
> +			  phycfg->hs_rx_0hs_rx_0_thssettle_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_0,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK,
> +			  phycfg->hs_rx_0hs_rx_0_thssettle_reg);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_0,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK,
> +				  phycfg->hs_rx_0hs_rx_0_thssettle_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_0,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK,
> +				  phycfg->hs_rx_0hs_rx_0_thssettle_reg);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_CFG_1,
> +			  CORE_DIG_DLANE_0_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK,
> +			  phycfg->cfg_1cfg_1_deskew_supported_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_CFG_1,
> +			  CORE_DIG_DLANE_1_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK,
> +			  phycfg->cfg_1cfg_1_deskew_supported_reg);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_CFG_1,
> +				  CORE_DIG_DLANE_2_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK,
> +				  phycfg->cfg_1cfg_1_deskew_supported_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_CFG_1,
> +				  CORE_DIG_DLANE_3_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK,
> +				  phycfg->cfg_1cfg_1_deskew_supported_reg);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_CFG_1,
> +			  CORE_DIG_DLANE_0_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK,
> +			  phycfg->cfg_1cfg_1_sot_detection_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_CFG_1,
> +			  CORE_DIG_DLANE_1_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK,
> +			  phycfg->cfg_1cfg_1_sot_detection_reg);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_CFG_1,
> +				  CORE_DIG_DLANE_2_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK,
> +				  phycfg->cfg_1cfg_1_sot_detection_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_CFG_1,
> +				  CORE_DIG_DLANE_3_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK,
> +				  phycfg->cfg_1cfg_1_sot_detection_reg);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_2,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK,
> +			  phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_2,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK,
> +			  phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_2,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK,
> +				  phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_2,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK,
> +				  phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_0,
> +			  CORE_DIG_DLANE_0_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_LP_0,
> +			  CORE_DIG_DLANE_1_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_LP_0,
> +				  CORE_DIG_DLANE_2_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_LP_0,
> +				  CORE_DIG_DLANE_3_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_2,
> +			  CORE_DIG_DLANE_0_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK, 0x0);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_LP_2,
> +			  CORE_DIG_DLANE_1_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK, 0x0);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_LP_2,
> +				  CORE_DIG_DLANE_2_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK,
> +				  0x0);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_LP_2,
> +				  CORE_DIG_DLANE_3_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK,
> +				  0x0);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_LP_0,
> +			  CORE_DIG_DLANE_CLK_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_LP_2,
> +			  CORE_DIG_DLANE_CLK_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK, 0x0);
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_2,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_2_HS_UPDATE_SETTINGS_DESKEW_REG_MASK, 0x1);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_2,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_UPDATE_SETTINGS_DESKEW_REG_MASK, 0x1);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_2,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_2_HS_UPDATE_SETTINGS_DESKEW_REG_MASK,
> +				  0x1);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_2,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_2_HS_UPDATE_SETTINGS_DESKEW_REG_MASK,
> +				  0x1);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_1,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK, 0x10);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_1,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK, 0x10);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_1,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK,
> +				  0x10);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_1,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK,
> +				  0x10);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_2,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK, 0x3);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_2,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK, 0x3);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_2,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK,
> +				  0x3);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_2,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK,
> +				  0x3);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_3,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK, 0x1);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_3,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK, 0x1);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_3,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK,
> +				  0x1);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_3,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK,
> +				  0x1);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_4,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK, 0x96);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_4,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK, 0x96);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_4,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_4_HS_MAX_ITERATIONS_DESKEW_REG_MASK,
> +				  0x96);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_4,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_4_HS_MAX_ITERATIONS_DESKEW_REG_MASK,
> +				  0x96);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_5,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK, 0x0);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_5,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK, 0x0);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_5,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK, 0x0);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_5,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK, 0x0);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_5,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK, 0x1);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_5,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK, 0x1);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_5,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK, 0x1);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_5,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK, 0x1);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_6,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK, 0x2);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_6,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK, 0x2);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_6,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK, 0x2);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_6,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK, 0x2);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_7,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK, 0x0);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_7,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK, 0x0);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_7,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK,
> +				  0x0);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_7,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK,
> +				  0x0);
> +	}
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_7,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK, 0x0);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_7,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK, 0x0);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_7,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_7_HS_SELECT_ALTERNATE_ALGO_REG_MASK,
> +				  0x0);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_7,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_7_HS_SELECT_ALTERNATE_ALGO_REG_MASK,
> +				  0x0);
> +	}
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_3,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK,
> +			  phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_3,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK,
> +			  phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_3,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK,
> +				  phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_3,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK,
> +				  phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_9,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK,
> +			  phycfg->max_phase);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_9,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK,
> +			  phycfg->max_phase);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_9,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK,
> +				  phycfg->max_phase);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_9,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK,
> +				  phycfg->max_phase);
> +	}
> +
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_6,
> +			  CORE_DIG_DLANE_0_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK,
> +			  phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg);
> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_6,
> +			  CORE_DIG_DLANE_1_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK,
> +			  phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg);
> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_6,
> +				  CORE_DIG_DLANE_2_RW_HS_RX_6_HS_MIN_EYE_OPENING_DESKEW_REG_MASK,
> +				  phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg);
> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_6,
> +				  CORE_DIG_DLANE_3_RW_HS_RX_6_HS_MIN_EYE_OPENING_DESKEW_REG_MASK,
> +				  phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg);
> +	}

Could you do this using a loop instead? With a bit saner macros, that
should be quite a bit easier, too.

> +}
> +
> +static void isp4phy_common(void __iomem *base, u32 phy_id)
> +{
> +	for (int ctr = 0; ctr < ARRAY_SIZE(startup_seq_common); ctr++)
> +		isp4phy_mask_wreg(base, phy_id, startup_seq_common[ctr].addr,
> +				  startup_seq_common[ctr].mask,
> +				  startup_seq_common[ctr].data);
> +}
> +
> +static void isp4phy_general_common_config(void __iomem *base, u32 phy_id)
> +{
> +	for (int ctr = 0; ctr < ARRAY_SIZE(startup_seq_general_common_config); ctr++)

Unsigned int for these, too, please.

> +		isp4phy_mask_wreg(base, phy_id,
> +				  startup_seq_general_common_config[ctr].addr,
> +				  startup_seq_general_common_config[ctr].mask,
> +				  startup_seq_general_common_config[ctr].data);
> +}
> +
> +static void
> +isp4phy_calculate_datarate_cfgs_rx(u32 phy_id, u64 data_rate,
> +				   u32 lane,
> +				   struct isp4phy_mipi_config *phycfg)
> +{
> +	u64 half_rate = data_rate >> 1;
> +	u64 hs_clk_freq;
> +
> +	hs_clk_freq = half_rate * 1000;
> +
> +	if (data_rate <= 2500)
> +		phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg = 1;
> +	else if (data_rate <= 4500)
> +		phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg = 0;
> +
> +	if (data_rate < 1500) {
> +		/*  do nothing */
> +	} else if (data_rate < 1588) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
> +		phycfg->max_phase = 143;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 17;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 3;
> +	} else if (data_rate < 1688) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
> +		phycfg->max_phase = 135;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 16;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 2;
> +	} else if (data_rate < 1800) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
> +		phycfg->max_phase = 127;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 15;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 2;
> +	} else if (data_rate < 1929) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
> +		phycfg->max_phase = 119;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 14;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 2;
> +	} else if (data_rate < 2077) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
> +		phycfg->max_phase = 111;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 13;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 2;
> +	} else if (data_rate < 2250) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
> +		phycfg->max_phase = 103;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 12;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
> +	} else if (data_rate < 2455) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
> +		phycfg->max_phase = 95;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 11;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
> +	} else if (data_rate < 2700) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
> +		phycfg->max_phase = 87;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 10;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
> +	} else if (data_rate < 3000) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
> +		phycfg->max_phase = 79;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 9;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
> +	} else if (data_rate < 3230) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
> +		phycfg->max_phase = 71;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 8;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 0;
> +	} else if (data_rate < 3600) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 1;
> +		phycfg->max_phase = 87;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 10;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
> +	} else if (data_rate < 4000) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 1;
> +		phycfg->max_phase = 79;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 9;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
> +	} else if (data_rate < 4500) {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 1;
> +		phycfg->max_phase = 71;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 8;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
> +	} else {
> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 1;
> +		phycfg->max_phase = 63;
> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 7;
> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 0;
> +	}

Please add an array for the values and implement this as a loop instead.

> +
> +	if (data_rate <= 1500) {
> +		phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg = 1;
> +		phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg = 1;
> +		phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg = 0;
> +		phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg = 1;
> +		phycfg->cfg_1cfg_1_deskew_supported_reg = 0;
> +		phycfg->cfg_1cfg_1_sot_detection_reg = 1;
> +	} else if (data_rate <= 4500) {
> +		phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg = 0;
> +		phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg = 0;
> +		phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg = 0;
> +		phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg = 0;
> +		phycfg->cfg_1cfg_1_deskew_supported_reg = 1;
> +		phycfg->cfg_1cfg_1_sot_detection_reg = 0;
> +	}
> +
> +	if (data_rate < 160)
> +		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b001;
> +	else if (data_rate < 320)
> +		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b010;
> +	else if (data_rate < 640)
> +		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b011;
> +	else if (data_rate < 1280)
> +		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b100;
> +	else if (data_rate < 2560)
> +		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b101;
> +	else
> +		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b110;

Ditto. Or maybe use ilog2()?

> +
> +	u32 t_hs_settle_ns = MIN_T_HS_SETTLE_NS + MAX_T_HS_SETTLE_NS;
> +
> +	t_hs_settle_ns = t_hs_settle_ns >> 1;
> +	u32 t_hs_settle_ui = MIN_T_HS_SETTLE_UI + MAX_T_HS_SETTLE_UI;
> +
> +	t_hs_settle_ui = t_hs_settle_ui >> 1;
> +
> +	t_hs_settle_ui = t_hs_settle_ui * 1000000;
> +	t_hs_settle_ui = t_hs_settle_ui >> 1;
> +	t_hs_settle_ui = div64_u64(t_hs_settle_ui, hs_clk_freq);
> +
> +	u32 ths_settle_target = t_hs_settle_ns + t_hs_settle_ui;
> +
> +	ths_settle_target = div64_u64(ths_settle_target, T_DCO);
> +	phycfg->hs_rx_0hs_rx_0_thssettle_reg = ths_settle_target - TMIN_RX - 7;
> +
> +	u16 jump_deskew_reg = phycfg->max_phase + 39;
> +
> +	jump_deskew_reg = div64_u64(jump_deskew_reg, 40);
> +	phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg = jump_deskew_reg;
> +
> +	u16 eye_opening_deskew_reg = phycfg->max_phase + 4;
> +
> +	eye_opening_deskew_reg = div64_u64(eye_opening_deskew_reg, 5);
> +	phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg = eye_opening_deskew_reg;

You could just as well do these without a temporary variable.

> +}
> +
> +static void isp4phy_startup_seq_dphy_rx(void __iomem *base, u32 phy_id,
> +					u64 data_rate, u32 lane)
> +{
> +	struct isp4phy_mipi_config phycfg;
> +
> +	memset(&phycfg, 0, sizeof(phycfg));

Would assigning phycfg to { } do the job?

> +
> +	isp4phy_calculate_datarate_cfgs_rx(phy_id, data_rate, lane, &phycfg);
> +	isp4phy_general_common_config(base, phy_id);
> +	isp4phy_common(base, phy_id);
> +	isp4phy_dphy_specific(base, phy_id, data_rate, &phycfg);
> +	isp4phy_dphy_periodic_deskew_program(base, phy_id);
> +	isp4phy_optional_features_dphy(base, phy_id);
> +}
> +
> +static int isp4phy_startup_seq_cdphy_rx(struct device *dev,
> +					void __iomem *base, u32 phy_id,
> +					u64 data_rate, u32 lane)
> +{
> +	struct isp4phy_mipi_reg phy_reg = {0};

{ } is enough.


> +
> +	/* readback the mipi phy reg */
> +	phy_reg.isp_mipi_phy0.value =
> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0);
> +	phy_reg.isp_mipi_phy1.value =
> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy1);
> +	phy_reg.isp_mipi_phy2.value =
> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy2);
> +	phy_reg.isp_mipi_phy4.value =
> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy4);
> +	phy_reg.isp_mipi_phy5.value =
> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy5);
> +	phy_reg.isp_mipi_phy6.value =
> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy6);
> +	phy_reg.isp_mipi_phy7.value =
> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy7);
> +
> +	phy_reg.isp_mipi_phy0.bit.shutdownz = 0;
> +	phy_reg.isp_mipi_phy0.bit.rstz = 0;
> +	isp4hw_wreg(base, (uintptr_t)(&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0),
> +		    phy_reg.isp_mipi_phy0.value);
> +
> +	/*PHY register access test */
> +	isp4phy_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_0, 0x473C);
> +	usleep_range(10, 20);
> +	if (isp4phy_rreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_0) == 0x473C) {
> +		dev_dbg(dev, "PHY register access test suc\n");
> +	} else {
> +		dev_err(dev, "PHY register access test fail\n");
> +		return -EFAULT;
> +	}
> +
> +	/** T1: top level static inputs must be set to the desired
> +	 * configuration (for example, phyMode. These *inputs can be
> +	 * identified with Startup and Active Mode state: Static label
> +	 * in Chapter 4, ��Signal Descriptions��).
> +	 */
> +	phy_reg.isp_mipi_phy5.value = (1 << lane) - 1;
> +	phy_reg.isp_mipi_phy5.bit.forcerxmode_clk = 1;
> +	isp4hw_wreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy5,
> +		    phy_reg.isp_mipi_phy5.value);
> +
> +	phy_reg.isp_mipi_phy4.value = (0x2 << lane) - 1;
> +	isp4hw_wreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy4,
> +		    phy_reg.isp_mipi_phy4.value);
> +
> +	phy_reg.isp_mipi_phy1.bit.mode = ISP_MIPI_DPHY;
> +	isp4hw_wreg(base, (uintptr_t)(&isp_mipi_phy_reg[phy_id]->isp_mipi_phy1),
> +		    phy_reg.isp_mipi_phy1.value);
> +
> +	/** T2: APB slave is active and can be accessed (presetN = 1b1)*/

/* Single-line comment. */

> +	/** T3: static register fields are programmed/read through the APB,
> +	 *	with PHY in reset (these register
> +	 *	fields can be found in Chapter 11.2, Static Register Access).
> +	 */

/*
 * Multi-line
 * comment.
 */

> +	/* DPHY mode setup */
> +	isp4phy_startup_seq_dphy_rx(base, phy_id, data_rate, lane);
> +
> +	/** T4: initial programming phase is over and PHY is ready
> +	 *	to leave Shutdown Mode (shutdownN = 1��b1
> +	 *	and rstN = 1��b1).
> +	 */
> +	phy_reg.isp_mipi_phy0.bit.shutdownz = 1;
> +	phy_reg.isp_mipi_phy0.bit.rstz = 1;
> +	isp4hw_wreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0,
> +		    phy_reg.isp_mipi_phy0.value);
> +
> +	dev_dbg(dev, "Termination calibration observability: 0x%x\n",
> +		isp4phy_rreg(base, phy_id, PPI_R_TERMCAL_DEBUG_0));
> +
> +	/** T5: internal calibrations ongoing. No configurations are accepted
> +	 *	during power-on-reset (POR).
> +	 *	phyReady asserts to signal that POR is complete.
> +	 */
> +	do {
> +		usleep_range(1000, 2000);
> +		phy_reg.isp_mipi_phy7.value =
> +			isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy7);

Why uintptr_t btw.? This seems to be a recurring pattern.

> +		dev_dbg(dev, "Wait for phyReady: 0x%x\n",
> +			phy_reg.isp_mipi_phy7.value);
> +	} while (phy_reg.isp_mipi_phy7.bit.ready != 1);

Use read_poll_timeout() maybe?

> +
> +	/** T6: dynamic register fields can be programmed/read through APB
> +	 *	(these register fields can be found in Chapter 11.3, Dynamic Register Access).
> +	 *	Check Chapter 9.3.4, D-PHY and C-PHY HS Receivers for analog settings that must be
> +	 *	programmed in T3.
> +	 */
> +
> +	/** T7: de-assert forcerxmode_N.*/
> +	phy_reg.isp_mipi_phy5.bit.forcerxmode_0 = 0;
> +	phy_reg.isp_mipi_phy5.bit.forcerxmode_1 = 0;
> +	phy_reg.isp_mipi_phy5.bit.forcerxmode_2 = 0;
> +	phy_reg.isp_mipi_phy5.bit.forcerxmode_3 = 0;
> +	phy_reg.isp_mipi_phy5.bit.forcerxmode_clk = 0;
> +	isp4hw_wreg(base, (uintptr_t)(&isp_mipi_phy_reg[phy_id]->isp_mipi_phy5),
> +		    phy_reg.isp_mipi_phy5.value);
> +	return 0;
> +}
> +
> +int isp4phy_start(struct device *dev,

How about using "amdisp4" as the prefix for the driver's symbol names? Just
"isp4" is very generic.

> +		  void __iomem *base, u32 phy_id, u64 bit_rate,
> +		  u32 lane_num)
> +{
> +	if (phy_id >= ISP_MIPI_PHY_ID_MAX)
> +		return -EINVAL;
> +
> +	if (phy_id == 2 && lane_num > 2) {
> +		dev_err(dev, "MIPI PHY 2 just has 2 lane\n");

Maybe use a similar format than for the 4-lane case?

> +		return -EINVAL;
> +	}
> +
> +	if (phy_id == 0 && lane_num > 4) {
> +		dev_err(dev, "fail invalid lane number %u for phy0\n",
> +			lane_num);
> +		return -EINVAL;
> +	}

Maybe a switch for phy_id?

> +
> +	return isp4phy_startup_seq_cdphy_rx(dev, base, phy_id, bit_rate, lane_num);

This line would benefit from wrapping.

> +}
> +
> +int isp4phy_stop(void __iomem *base, u32 phy_id)
> +{
> +	struct isp4phy_mipi_reg phy_reg = {0};
> +
> +	if (phy_id >= ISP_MIPI_PHY_ID_MAX)
> +		return -EINVAL;
> +
> +	phy_reg.isp_mipi_phy0.value =
> +		isp4hw_rreg(base, (uintptr_t)
> +			    (&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0));

Extra parentheses.

> +
> +	/* shutdown phy */
> +	phy_reg.isp_mipi_phy0.bit.shutdownz = 0;
> +	phy_reg.isp_mipi_phy0.bit.rstz = 0;
> +	isp4hw_wreg(base,
> +		    (uintptr_t)(&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0),

Redundant parentheses.

> +		    phy_reg.isp_mipi_phy0.value);
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/amd/isp4/isp4_phy.h b/drivers/media/platform/amd/isp4/isp4_phy.h
> new file mode 100644
> index 000000000000..2909892dbd00
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_phy.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_PHY_H_
> +#define _ISP4_PHY_H_
> +
> +int isp4phy_start(struct device *dev,
> +		  void __iomem *base, u32 phy_id, u64 bit_rate,
> +		  u32 lane_num);
> +int isp4phy_stop(void __iomem *base, u32 phy_id);
> +
> +#endif

-- 
Kind regards,

Sakari Ailus

