Return-Path: <linux-media+bounces-20694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C2B9B90EB
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 13:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 418BC1F2200A
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 12:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A2019D075;
	Fri,  1 Nov 2024 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c98+OrkP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38043175D2D;
	Fri,  1 Nov 2024 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462948; cv=none; b=k5FBUZ1HtmJjHrR9IOsAC3JhcS5Bn0HfgK3PnPzXnI+qTaOmk+XJHy/lFi7jUKWGcdTCCpyUzAfPzeLbz/TlpaqkquD4fd5g3qoyU6/ywkclN4NUHLkld9ukLDbWJBr7FNOflapGH5aeowDmuorovIl5XJrm46k0CnfDSNpuuRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462948; c=relaxed/simple;
	bh=gMMg8DFvO36V4MVbzA+pbzAjYShvPXzEHLyAS9/Xe9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nV9Xg4DQlwzty6yf51GVWpnPggE3sIp9F+Cdj2CBxCWhAr7obJ3BOQfWTmJNMNfhi/f8gMGNoQeUFGu6B+8wCg6uqJQ7Ja7d2qBpbMOgLjrtWiEQCgZTnskkn/WmlcK//pOBPe3I6G3FexbZzp+WjQdud+lDMUSQvfgYCu6QJys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c98+OrkP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730462944; x=1761998944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gMMg8DFvO36V4MVbzA+pbzAjYShvPXzEHLyAS9/Xe9E=;
  b=c98+OrkP08FCAl5a3kW4QZYbIm9E+XujVRUM7OpYxRGXWCWsrUpotV6L
   fJ9SODZlTWH8DxrwWwoODnyZQSEvvKJMNJp8BNMxDcEH7DnMNKBvPvMrY
   qvsl901dAS4X21FWpC446sG+Nr4kTQPjkn+p1P1wSjCcNq0GyVPtDZZLd
   0hS5DxENc2TlMI65NHvwyT1pns8LgZeKKlIsq8XuGK5KkOppvkZMAdxVR
   dAHzswY01L88u1hhVr4CVpqcbrpXhpY8wx+BeGjYGdgLhFGkmsE2gHgMh
   REv/RPUv6BbqhkTaTSvrjvR/K7NH3rtWpw+jXGFmvMOjrujtD9Zsu4esa
   A==;
X-CSE-ConnectionGUID: kVCoHtffRL+RhU6ne1OxIA==
X-CSE-MsgGUID: MbIyndtHQeCwMf7f4SoPuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="34025281"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="34025281"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:08:56 -0700
X-CSE-ConnectionGUID: zJSrroGAQIWHkU8cYIkO4g==
X-CSE-MsgGUID: SZd4DVJFToehjon12+7OvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83282290"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:08:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B0D3C11FA28;
	Fri,  1 Nov 2024 14:08:49 +0200 (EET)
Date: Fri, 1 Nov 2024 12:08:49 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com, laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
	alain.volmat@foss.st.com, julien.vuillaumier@nxp.com,
	alice.yuan@nxp.com
Subject: Re: [PATCH 5/5] media: ox05b1s: Add support for Omnivision OS08A20
 raw sensor
Message-ID: <ZyTE0X70SI7Wdqvs@kekkonen.localdomain>
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-6-mirela.rabulea@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241028190628.257249-6-mirela.rabulea@nxp.com>

Hi Mirela,

Thanks set the set.

On Mon, Oct 28, 2024 at 09:06:28PM +0200, Mirela Rabulea wrote:
> This is an 8 megapixel raw10/raw12 sensor with HDR capabilities.
> HDR mode control is supported, with one hdr mode: staggered HDR with
> 2 exposures on separate virtual channels.

The patch still declares just one via get_frame_desc (as there are no
changes). I think we need more documentation on this, including sensor
specific documentation on the HDR mode as the interfaces don't provide it
all. There's Documentation/userspace-api/media/drivers/st-vgxy61.rst that
describes the existing usage of the control. We need more than this,
however, as staggered HDR is more complicated, requiring processing on
receiver side.

Neither I'm sure the control is enough as an interface to configure this.

> Supported resolutions:
>    - 1920 x 1080 @ 60fps (SBGGR10, no HDR)
>    - 1920 x 1080 @ 30fps (SBGGR10, HDR)
>    - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
>    - 3840 x 2160 @ 15fps (SBGGR10, HDR)
>    - 3840 x 2160 @ 15fps (SBGGR12, HDR)
>    - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
>    - 3840 x 2160 @ 30fps (SBGGR10, no HDR)
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  .../media/i2c/ox05b1s/os08a20_regs_1080p.h    | 201 +++++++++++++++++
>  drivers/media/i2c/ox05b1s/os08a20_regs_4k.h   | 209 ++++++++++++++++++
>  .../media/i2c/ox05b1s/os08a20_regs_4k_hdr.h   | 199 +++++++++++++++++
>  drivers/media/i2c/ox05b1s/ox05b1s_mipi.c      | 189 ++++++++++++++++
>  4 files changed, 798 insertions(+)
>  create mode 100644 drivers/media/i2c/ox05b1s/os08a20_regs_1080p.h
>  create mode 100644 drivers/media/i2c/ox05b1s/os08a20_regs_4k.h
>  create mode 100644 drivers/media/i2c/ox05b1s/os08a20_regs_4k_hdr.h
> 
> diff --git a/drivers/media/i2c/ox05b1s/os08a20_regs_1080p.h b/drivers/media/i2c/ox05b1s/os08a20_regs_1080p.h
> new file mode 100644
> index 000000000000..ab9977c56a10
> --- /dev/null
> +++ b/drivers/media/i2c/ox05b1s/os08a20_regs_1080p.h
> @@ -0,0 +1,201 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * A register configuration for Omnivision OS08A20 raw camera, 1920 x 1080 @60fps BGGR10

Over 80, please wrap.

> + * Copyright (C) 2024, NXP
> + * Copyright (C) 2024, Omnivision
> + * Copyright (C) 2024, Verisilicon
> + *
> + */
> +#ifndef _OS08A20_REGS_1080P_H_
> +#define _OS08A20_REGS_1080P_H_
> +
> +static struct ox05b1s_reg os08a20_init_setting_1080p[] = {
> +	{0x0100, 0x00},

Spaces inside braces.

Quite few of the register settings here are also shared with the other
modes. Wouldn't it make sense to refactor these into a single common list
and then mode related lists?

> +	{0x0103, 0x01},
> +	{0x0303, 0x01},
> +	{0x0304, 0x00}, /* PLL_CTRL_04 (default 0x00) */
> +	{0x0305, 0x2d}, /* PLL_CTRL_05 (default 0x3c) */
> +	{0x0306, 0x00},
> +	{0x0308, 0x03},
> +	{0x0309, 0x04},
> +	{0x0325, 0x45}, /* PLL_CTRL_25 (default 0x3c) */
> +	{0x0327, 0x05}, /* PLL_CTRL_27 (default 0x07) */
> +	{0x0328, 0x02}, /* PLL_CTRL_28 (default 0x07) */
> +	{0x032a, 0x02}, /* PLL_CTRL_2a (default 0x00) */
> +	{0x300f, 0x11},
> +	{0x3010, 0x01},
> +	{0x3011, 0x04},
> +	{0x3012, 0x41},
> +	{0x3016, 0xf0},
> +	{0x301e, 0x98},
> +	{0x3031, 0xa9},
> +	{0x3103, 0x92},
> +	{0x3104, 0x01},
> +	{0x3106, 0x10},
> +	{0x3400, 0x04}, /* PSV CTRL (default 0x00) bit[2]=r_psv_mode_en */
> +	{0x3025, 0x03}, /* PSV MODE OPT (default 0x02) not used */
> +	{0x3425, 0x01}, /* R ASP PD SEL bit[1:0]=stream blanking */
> +	{0x3428, 0x01}, /* R ASP PD SEL bit[1:0]=bpg1 N-pump1 bypass to AGND */
> +	{0x3408, 0x03}, /* CTRL08 (default 0x01) bit[3:0]=r_clk_winp_off */
> +	{0x340c, 0xff},
> +	{0x340d, 0xff},
> +	{0x031e, 0x09},
> +	{0x3501, 0x04}, /* Long exposure */
> +	{0x3502, 0x62}, /* Long exposure */
> +	{0x3505, 0x83},
> +	{0x3508, 0x00}, /* Long gain */
> +	{0x3509, 0x80}, /* Long gain */
> +	{0x350a, 0x04},
> +	{0x350b, 0x00},
> +	{0x350c, 0x00},
> +	{0x350d, 0x80},
> +	{0x350e, 0x04},
> +	{0x350f, 0x00},
> +	{0x3600, 0x09}, /* CORE0 bit[0]=stg_hdr_align_en, bit[3]=new_stgr_hdr_en */
> +	{0x3603, 0x2c},
> +	{0x3605, 0x50},
> +	{0x3609, 0xb5},
> +	{0x3610, 0x39},
> +	{0x360c, 0x01},
> +	{0x3628, 0xa4},
> +	{0x362d, 0x10},
> +	{0x3660, 0x43}, /* CORE0 bit[0]=rip_sof_vifo_en, bit[1]=stg_hdr_long_en debug mode */
> +	{0x3662, 0x00},
> +	{0x3663, 0x28},
> +	{0x3664, 0x0d},
> +	{0x366a, 0x38},
> +	{0x366b, 0xa0},
> +	{0x366d, 0x00},
> +	{0x366e, 0x00},
> +	{0x3680, 0x00},
> +	{0x36c0, 0x00},
> +	{0x3701, 0x02}, /* Sensor timing control registers 0x3700-0x37ff */
> +	{0x373b, 0x02},
> +	{0x373c, 0x02},
> +	{0x3736, 0x02},
> +	{0x3737, 0x02},
> +	{0x3705, 0x00},
> +	{0x3706, 0x39},
> +	{0x370a, 0x00},
> +	{0x370b, 0x98},
> +	{0x3709, 0x49},
> +	{0x3714, 0x22},  /* Sensor timing control registers 0x3700-0x37ff */
> +	{0x371c, 0x00},
> +	{0x371d, 0x08},
> +	{0x3740, 0x1b},
> +	{0x3741, 0x04},
> +	{0x375e, 0x0b},
> +	{0x3760, 0x10},
> +	{0x3776, 0x10},
> +	{0x3781, 0x02},
> +	{0x3782, 0x04},
> +	{0x3783, 0x02},
> +	{0x3784, 0x08},
> +	{0x3785, 0x08},
> +	{0x3788, 0x01},
> +	{0x3789, 0x01},
> +	{0x3797, 0x04},
> +	{0x3762, 0x11},  /* Sensor timing control registers 0x3700-0x37ff */
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x0c},
> +	{0x3804, 0x0e},
> +	{0x3805, 0xff},
> +	{0x3806, 0x08},
> +	{0x3807, 0x6f},
> +	{0x3808, 0x07}, /* X output size (default 0x07) */
> +	{0x3809, 0x80}, /* X output size (default 0x80) */
> +	{0x380a, 0x04}, /* Y output size (default 0x04) */
> +	{0x380b, 0x38}, /* Y output size (default 0x38) */
> +	{0x380c, 0x07}, /* HTS[15:8], total horizontal timing size */
> +	{0x380d, 0x90}, /* HTS[7:0],  total horizontal timing size */
> +	{0x380e, 0x04}, /* VTS[15:8], total vertical timing (default 0x04) */
> +	{0x380f, 0xa4}, /* VTS[7:0],  total vertical timing (default 0xA0) */
> +	{0x3813, 0x08}, /* ISP_Y_WIN ISP vertical windowing offset */
> +	{0x3814, 0x03}, /* X INC ODD (default 0x01) */
> +	{0x3815, 0x01}, /* X INC EVEN (default 0x01) */
> +	{0x3816, 0x03}, /* Y INC ODD (default 0x01) */
> +	{0x3817, 0x01}, /* Y INC EVEN (default 0x01) */
> +	{0x381c, 0x00}, /* BLC_NUM_OPTION (default 0x0e) */
> +	{0x3820, 0x01}, /* FORMAT1 (default 0x80) bit[0]=vertical bining */
> +	{0x3821, 0x05}, /* FORMAT2 bit[2]=mirror, bit[0]=horizontal bining */
> +	{0x3823, 0x08},
> +	{0x3826, 0x00},
> +	{0x3827, 0x08},
> +	{0x382d, 0x08},
> +	{0x3832, 0x02},
> +	{0x3833, 0x00}, /* REG33 (bit[0]=r_stg_hdr_grp_wr_opt, bit[2]=r_stg_grphold_nomask) */
> +	{0x383c, 0x48},
> +	{0x383d, 0xff},
> +	{0x3d85, 0x0b},
> +	{0x3d84, 0x40},
> +	{0x3d8c, 0x63},
> +	{0x3d8d, 0xd7},
> +	{0x4000, 0xf8},
> +	{0x4001, 0x2b},
> +	{0x4004, 0x00},
> +	{0x4005, 0x40},
> +	{0x400a, 0x01},
> +	{0x400f, 0xa0},
> +	{0x4010, 0x12},
> +	{0x4018, 0x00},
> +	{0x4008, 0x02},
> +	{0x4009, 0x05}, /* BLC CTRL09 (default 0x0f) bl_end */
> +	{0x401a, 0x58},
> +	{0x4050, 0x00},
> +	{0x4051, 0x01},
> +	{0x4028, 0x2f},
> +	{0x4052, 0x00},
> +	{0x4053, 0x80},
> +	{0x4054, 0x00},
> +	{0x4055, 0x80},
> +	{0x4056, 0x00},
> +	{0x4057, 0x80},
> +	{0x4058, 0x00},
> +	{0x4059, 0x80},
> +	{0x430b, 0xff},
> +	{0x430c, 0xff},
> +	{0x430d, 0x00},
> +	{0x430e, 0x00},
> +	{0x4501, 0x98}, /* R1 (default 0x18) bit[4:2]=not used */
> +	{0x4502, 0x00},
> +	{0x4643, 0x00},
> +	{0x4640, 0x01},
> +	{0x4641, 0x04},
> +	{0x4800, 0x64},
> +	{0x4809, 0x2b},
> +	{0x4813, 0x90}, /* MIPI CTRL 13 (bit[5:4]=VC1=1, bit[7:6]=VC2=2) */
> +	{0x4817, 0x04},
> +	{0x4833, 0x18},
> +	{0x4837, 0x16}, /* PCLK PERIOD (default 0x08) */
> +	{0x483b, 0x00},
> +	{0x484b, 0x03},
> +	{0x4850, 0x7c},
> +	{0x4852, 0x06},
> +	{0x4856, 0x58},
> +	{0x4857, 0xaa},
> +	{0x4862, 0x0a},
> +	{0x4869, 0x18},
> +	{0x486a, 0xaa},
> +	{0x486e, 0x03}, /* MIPI CTRL 6E (default 0x03) */
> +	{0x486f, 0x55},
> +	{0x4875, 0xf0},
> +	{0x5000, 0x89},
> +	{0x5001, 0x42},
> +	{0x5004, 0x40},
> +	{0x5005, 0x00},
> +	{0x5180, 0x00},
> +	{0x5181, 0x10},
> +	{0x580b, 0x03},
> +	{0x4d00, 0x03},
> +	{0x4d01, 0xc9},
> +	{0x4d02, 0xbc},
> +	{0x4d03, 0xc6},
> +	{0x4d04, 0x4a},
> +	{0x4d05, 0x25},
> +	{0x4700, 0x2b},
> +	{0x4e00, 0x2b},
> +};
> +
> +#endif
> diff --git a/drivers/media/i2c/ox05b1s/os08a20_regs_4k.h b/drivers/media/i2c/ox05b1s/os08a20_regs_4k.h
> new file mode 100644
> index 000000000000..f3d5f0fe1b61
> --- /dev/null
> +++ b/drivers/media/i2c/ox05b1s/os08a20_regs_4k.h
> @@ -0,0 +1,209 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * A register configuration for Omnivision OS08A20 raw camera, 3840 x 2160 @30fps BGGR12

Ditto.

> + * Copyright (C) 2024, NXP
> + * Copyright (C) 2024, Omnivision
> + * Copyright (C) 2024, Verisilicon
> + *
> + */
> +
> +#ifndef _OS08A20_REGS_4K_H_
> +#define _OS08A20_REGS_4K_H_
> +
> +static struct ox05b1s_reg os08a20_init_setting_4k[] = {
> +	{0x0100, 0x00},
> +	{0x0103, 0x01},
> +	{0x0303, 0x01},
> +	{0x0305, 0x3c}, /* PLL_CTRL_05 (default 0x3c) */
> +	{0x0306, 0x00},
> +	{0x0308, 0x03},
> +	{0x0309, 0x04},
> +	{0x0325, 0x47}, /* PLL_CTRL_25 (default 0x3c) */
> +	{0x032a, 0x00}, /* PLL_CTRL_2a (default 0x00) */
> +	{0x300f, 0x11},
> +	{0x3010, 0x01},
> +	{0x3011, 0x04},
> +	{0x3012, 0x41},
> +	{0x3016, 0xf0},
> +	{0x301e, 0x98},
> +	{0x3031, 0xa9},
> +	{0x3103, 0x92},
> +	{0x3104, 0x01},
> +	{0x3106, 0x10},
> +	{0x3400, 0x04}, /* PSV CTRL (default 0x00) bit[2]=r_psv_mode_en */
> +	{0x3025, 0x03}, /* PSV MODE OPT (default 0x02) not used */
> +	{0x3425, 0x01}, /* R ASP PD SEL bit[1:0]=stream blanking */
> +	{0x3428, 0x01}, /* R ASP PD SEL bit[1:0]=bpg1 N-pump1 bypass to AGND */
> +	{0x3408, 0x03}, /* CTRL08 (default 0x01) bit[3:0]=r_clk_winp_off */
> +	{0x340c, 0xff},
> +	{0x340d, 0xff},
> +	{0x031e, 0x0a},
> +	{0x3501, 0x08}, /* Long exposure */
> +	{0x3502, 0xe5}, /* Long exposure */
> +	{0x3505, 0x83},
> +	{0x3508, 0x00}, /* Long gain */
> +	{0x3509, 0x80}, /* Long gain */
> +	{0x350a, 0x04},
> +	{0x350b, 0x00},
> +	{0x350c, 0x00},
> +	{0x350d, 0x80},
> +	{0x350e, 0x04},
> +	{0x350f, 0x00},
> +	{0x3600, 0x00}, /* CORE0 bit[0]=stg_hdr_align_en, bit[3]=new_stgr_hdr_en */
> +	{0x3603, 0x2c},
> +	{0x3605, 0x50},
> +	{0x3609, 0xdb},
> +	{0x3610, 0x39},
> +	{0x360c, 0x01},
> +	{0x3628, 0xa4},
> +	{0x362d, 0x10},
> +	{0x3660, 0xd3}, /* CORE0 bit[0]=rip_sof_vifo_en, bit[1]=stg_hdr_long_en debug mode */
> +	{0x3662, 0x00},
> +	{0x3663, 0x28},
> +	{0x3664, 0x0d},
> +	{0x366a, 0x38},
> +	{0x366b, 0xa0},
> +	{0x366d, 0x00},
> +	{0x366e, 0x00},
> +	{0x3680, 0x00},
> +	{0x36c0, 0x00},
> +	{0x3701, 0x02}, /* Sensor timing control registers 0x3700-0x37ff */
> +	{0x373b, 0x02},
> +	{0x373c, 0x02},
> +	{0x3736, 0x02},
> +	{0x3737, 0x02},
> +	{0x3705, 0x00},
> +	{0x3706, 0x72},
> +	{0x370a, 0x01},
> +	{0x370b, 0x30},
> +	{0x3709, 0x48},
> +	{0x3714, 0x21}, /* Sensor timing control registers 0x3700-0x37ff */
> +	{0x371c, 0x00},
> +	{0x371d, 0x08},
> +	{0x3740, 0x1b},
> +	{0x3741, 0x04},
> +	{0x375e, 0x0b},
> +	{0x3760, 0x10},
> +	{0x3776, 0x10},
> +	{0x3781, 0x02},
> +	{0x3782, 0x04},
> +	{0x3783, 0x02},
> +	{0x3784, 0x08},
> +	{0x3785, 0x08},
> +	{0x3788, 0x01},
> +	{0x3789, 0x01},
> +	{0x3797, 0x04},
> +	{0x3762, 0x11},  /* Sensor timing control registers 0x3700-0x37ff */
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x0c},
> +	{0x3804, 0x0e},
> +	{0x3805, 0xff},
> +	{0x3806, 0x08},
> +	{0x3807, 0x6f},
> +	{0x3808, 0x0f}, /* X output size (default 0x07) */
> +	{0x3809, 0x00}, /* X output size (default 0x80) */
> +	{0x380a, 0x08}, /* Y output size (default 0x04) */
> +	{0x380b, 0x70}, /* Y output size (default 0x38) */
> +	{0x380c, 0x08}, /* HTS[15:8], total horizontal timing size */
> +	{0x380d, 0x14}, /* HTS[7:0],  total horizontal timing size */
> +	{0x380e, 0x08}, /* VTS[15:8], total vertical timing (default 0x04) */
> +	{0x380f, 0xf0}, /* VTS[7:0],  total vertical timing (default 0xA0) */
> +	{0x3813, 0x10}, /* ISP_Y_WIN ISP vertical windowing offset */
> +	{0x3814, 0x01}, /* X INC ODD (default 0x01) */
> +	{0x3815, 0x01}, /* X INC EVEN (default 0x01) */
> +	{0x3816, 0x01}, /* Y INC ODD (default 0x01) */
> +	{0x3817, 0x01}, /* Y INC EVEN (default 0x01) */
> +	{0x381c, 0x00}, /* BLC_NUM_OPTION (default 0x0e) */
> +	{0x3820, 0x00}, /* FORMAT1 (default 0x80) bit[0]=vertical bining */
> +	{0x3821, 0x04}, /* FORMAT2 bit[2]=mirror, bit[0]=horizontal bining */
> +	{0x3823, 0x08},
> +	{0x3826, 0x00},
> +	{0x3827, 0x08},
> +	{0x382d, 0x08},
> +	{0x3832, 0x02},
> +	{0x3833, 0x00}, /* REG33 (bit[0]=r_stg_hdr_grp_wr_opt, bit[2]=r_stg_grphold_nomask) */
> +	{0x383c, 0x48},
> +	{0x383d, 0xff},
> +	{0x3d85, 0x0b},
> +	{0x3d84, 0x40},
> +	{0x3d8c, 0x63},
> +	{0x3d8d, 0xd7},
> +	{0x4000, 0xf8},
> +	{0x4001, 0x2b},
> +	{0x4004, 0x00},
> +	{0x4005, 0x40},
> +	{0x400a, 0x01},
> +	{0x400f, 0xa0},
> +	{0x4010, 0x12},
> +	{0x4018, 0x00},
> +	{0x4008, 0x02},
> +	{0x4009, 0x0d}, /* BLC CTRL09 (default 0x0f) bl_end */
> +	{0x401a, 0x58},
> +	{0x4050, 0x00},
> +	{0x4051, 0x01},
> +	{0x4028, 0x2f},
> +	{0x4052, 0x00},
> +	{0x4053, 0x80},
> +	{0x4054, 0x00},
> +	{0x4055, 0x80},
> +	{0x4056, 0x00},
> +	{0x4057, 0x80},
> +	{0x4058, 0x00},
> +	{0x4059, 0x80},
> +	{0x430b, 0xff},
> +	{0x430c, 0xff},
> +	{0x430d, 0x00},
> +	{0x430e, 0x00},
> +	{0x4501, 0x18}, /* R1 (default 0x18) bit[4:2]=not used */
> +	{0x4502, 0x00},
> +	{0x4600, 0x00},
> +	{0x4601, 0x20},
> +	{0x4603, 0x01},
> +	{0x4643, 0x00},
> +	{0x4640, 0x01},
> +	{0x4641, 0x04},
> +	{0x4800, 0x64},
> +	{0x4809, 0x2b},
> +	{0x4813, 0x90}, /* MIPI CTRL 13 (bit[5:4]=VC1=1, bit[7:6]=VC2=2) */
> +	{0x4817, 0x04},
> +	{0x4833, 0x18},
> +	{0x4837, 0x10}, /* PCLK PERIOD (default 0x08) */
> +	{0x483b, 0x00},
> +	{0x484b, 0x03},
> +	{0x4850, 0x7c},
> +	{0x4852, 0x06},
> +	{0x4856, 0x58},
> +	{0x4857, 0xaa},
> +	{0x4862, 0x0a},
> +	{0x4869, 0x18},
> +	{0x486a, 0xaa},
> +	{0x486e, 0x03}, /* MIPI CTRL 6E (default 0x03) */
> +	{0x486f, 0x55},
> +	{0x4875, 0xf0},
> +	{0x5000, 0x89},
> +	{0x5001, 0x42},
> +	{0x5004, 0x40},
> +	{0x5005, 0x00},
> +	{0x5180, 0x00},
> +	{0x5181, 0x10},
> +	{0x580b, 0x03},
> +	{0x4d00, 0x03},
> +	{0x4d01, 0xc9},
> +	{0x4d02, 0xbc},
> +	{0x4d03, 0xc6},
> +	{0x4d04, 0x4a},
> +	{0x4d05, 0x25},
> +	{0x4700, 0x2b},
> +	{0x4e00, 0x2b},
> +	{0x3501, 0x09}, /* Long exposure */
> +	{0x3502, 0x01}, /* Long exposure */
> +	{0x4028, 0x4f},
> +	{0x4029, 0x1f},
> +	{0x402a, 0x7f},
> +	{0x402b, 0x01},
> +	{0x0100, 0x01},
> +};
> +
> +#endif
> diff --git a/drivers/media/i2c/ox05b1s/os08a20_regs_4k_hdr.h b/drivers/media/i2c/ox05b1s/os08a20_regs_4k_hdr.h
> new file mode 100644
> index 000000000000..2ae79ebae436
> --- /dev/null
> +++ b/drivers/media/i2c/ox05b1s/os08a20_regs_4k_hdr.h
> @@ -0,0 +1,199 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * A register configuration for Omnivision OS08A20 raw camera, 3840 x 2160 @30fps BGGR10 HDR

Ditto.

> + * Copyright (C) 2024, NXP
> + * Copyright (C) 2024, Omnivision
> + * Copyright (C) 2024, Verisilicon
> + *
> + */
> +
> +#ifndef _OS08A20_REGS_4K_HDR_H_
> +#define _OS08A20_REGS_4K_HDR_H_
> +
> +static struct ox05b1s_reg os08a20_init_setting_4k_hdr[] = {
> +	{0x0100, 0x00},
> +	{0x0103, 0x01},
> +	{0x0303, 0x01},
> +	{0x0305, 0x3c}, /* PLL_CTRL_05 (default 0x3c) */
> +	{0x0306, 0x00},
> +	{0x0308, 0x03},
> +	{0x0309, 0x04},
> +	{0x032a, 0x00}, /* PLL_CTRL_2a (default 0x00) */
> +	{0x300f, 0x11},
> +	{0x3010, 0x01},
> +	{0x3011, 0x04},
> +	{0x3012, 0x41},
> +	{0x3016, 0xf0},
> +	{0x301e, 0x98},
> +	{0x3031, 0xa9},
> +	{0x3103, 0x92},
> +	{0x3104, 0x01},
> +	{0x3106, 0x10},
> +	{0x340c, 0xff},
> +	{0x340d, 0xff},
> +	{0x031e, 0x09},
> +	{0x3501, 0x08}, /* Long exposure */
> +	{0x3502, 0xe5}, /* Long exposure */
> +	{0x3505, 0x83},
> +	{0x3508, 0x00}, /* Long gain */
> +	{0x3509, 0x80}, /* Long gain */
> +	{0x350a, 0x04},
> +	{0x350b, 0x00},
> +	{0x350c, 0x00},
> +	{0x350d, 0x80},
> +	{0x350e, 0x04},
> +	{0x350f, 0x00},
> +	{0x3600, 0x00}, /* CORE0 bit[0]=stg_hdr_align_en, bit[3]=new_stgr_hdr_en */
> +	{0x3603, 0x2c},
> +	{0x3605, 0x50},
> +	{0x3609, 0xb5},
> +	{0x3610, 0x39},
> +	{0x360c, 0x01},
> +	{0x3628, 0xa4},
> +	{0x362d, 0x10},
> +	{0x3660, 0x42}, /* CORE0 bit[0]=rip_sof_vifo_en, bit[1]=stg_hdr_long_en debug mode */
> +	{0x3661, 0x07}, /* CORE1 (default 0x06) bit[0]=stg_hdr_align_en */
> +	{0x3662, 0x00},
> +	{0x3663, 0x28},
> +	{0x3664, 0x0d},
> +	{0x366a, 0x38},
> +	{0x366b, 0xa0},
> +	{0x366d, 0x00},
> +	{0x366e, 0x00},
> +	{0x3680, 0x00},
> +	{0x36c0, 0x00},
> +	{0x3701, 0x02}, /* Sensor timing control registers 0x3700-0x37ff */
> +	{0x373b, 0x02},
> +	{0x373c, 0x02},
> +	{0x3736, 0x02},
> +	{0x3737, 0x02},
> +	{0x3705, 0x00},
> +	{0x3706, 0x39},
> +	{0x370a, 0x00},
> +	{0x370b, 0x98},
> +	{0x3709, 0x49},
> +	{0x3714, 0x21}, /* Sensor timing control registers 0x3700-0x37ff */
> +	{0x371c, 0x00},
> +	{0x371d, 0x08},
> +	{0x3740, 0x1b},
> +	{0x3741, 0x04},
> +	{0x375e, 0x0b},
> +	{0x3760, 0x10},
> +	{0x3776, 0x10},
> +	{0x3781, 0x02},
> +	{0x3782, 0x04},
> +	{0x3783, 0x02},
> +	{0x3784, 0x08},
> +	{0x3785, 0x08},
> +	{0x3788, 0x01},
> +	{0x3789, 0x01},
> +	{0x3797, 0x04},
> +	{0x3762, 0x11}, /* Sensor timing control registers 0x3700-0x37ff */
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x0c},
> +	{0x3804, 0x0e},
> +	{0x3805, 0xff},
> +	{0x3806, 0x08},
> +	{0x3807, 0x6f},
> +	{0x3808, 0x0f}, /* X output size (default 0x07) */
> +	{0x3809, 0x00}, /* X output size (default 0x80) */
> +	{0x380a, 0x08}, /* Y output size (default 0x04) */
> +	{0x380b, 0x70}, /* Y output size (default 0x38) */
> +	{0x380c, 0x08}, /* HTS[15:8], total horizontal timing size */
> +	{0x380d, 0x18}, /* HTS[7:0],  total horizontal timing size */
> +	{0x380e, 0x09}, /* VTS[15:8], total vertical timing (default 0x04) */
> +	{0x380f, 0x0a}, /* VTS[7:0],  total vertical timing (default 0xA0) */
> +	{0x3813, 0x10}, /* ISP_Y_WIN ISP vertical windowing offset */
> +	{0x3814, 0x01}, /* X INC ODD (default 0x01) */
> +	{0x3815, 0x01}, /* X INC EVEN (default 0x01) */
> +	{0x3816, 0x01}, /* Y INC ODD (default 0x01) */
> +	{0x3817, 0x01}, /* Y INC EVEN (default 0x01) */
> +	{0x381c, 0x08}, /* BLC_NUM_OPTION (default 0x0e) */
> +	{0x3820, 0x00}, /* FORMAT1 (default 0x80) bit[0]=vertical bining */
> +	{0x3821, 0x24}, /* FORMAT2 bit[5]=stagger hdr en, bit[2]=mirror */
> +	{0x3823, 0x08},
> +	{0x3826, 0x00},
> +	{0x3827, 0x08},
> +	{0x382d, 0x08},
> +	{0x3832, 0x02},
> +	{0x3833, 0x01}, /* REG33 (bit[0]=r_stg_hdr_grp_wr_opt, bit[2]=r_stg_grphold_nomask) */
> +	{0x383c, 0x48},
> +	{0x383d, 0xff},
> +	{0x3d85, 0x0b},
> +	{0x3d84, 0x40},
> +	{0x3d8c, 0x63},
> +	{0x3d8d, 0xd7},
> +	{0x4000, 0xf8},
> +	{0x4001, 0x2b},
> +	{0x4004, 0x00},
> +	{0x4005, 0x40},
> +	{0x400a, 0x01},
> +	{0x400f, 0xa0},
> +	{0x4010, 0x12},
> +	{0x4018, 0x00},
> +	{0x4008, 0x02},
> +	{0x4009, 0x0d}, /* BLC CTRL09 (default 0x0f) bl_end */
> +	{0x401a, 0x58},
> +	{0x4050, 0x00},
> +	{0x4051, 0x01},
> +	{0x4028, 0x2f},
> +	{0x4052, 0x00},
> +	{0x4053, 0x80},
> +	{0x4054, 0x00},
> +	{0x4055, 0x80},
> +	{0x4056, 0x00},
> +	{0x4057, 0x80},
> +	{0x4058, 0x00},
> +	{0x4059, 0x80},
> +	{0x430b, 0xff},
> +	{0x430c, 0xff},
> +	{0x430d, 0x00},
> +	{0x430e, 0x00},
> +	{0x4501, 0x18}, /* R1 (default 0x18) bit[4:2]=not used */
> +	{0x4502, 0x00},
> +	{0x4643, 0x00},
> +	{0x4640, 0x01},
> +	{0x4641, 0x04},
> +	{0x4800, 0x64},
> +	{0x4809, 0x2b},
> +	{0x4813, 0x98}, /* MIPI CTRL 13 (bit[5:4]=VC1=1, bit[7:6]=VC2=2) */
> +	{0x4817, 0x04},
> +	{0x4833, 0x18},
> +	{0x4837, 0x10}, /* PCLK PERIOD (default 0x08) */
> +	{0x483b, 0x00},
> +	{0x484b, 0x03},
> +	{0x4850, 0x7c},
> +	{0x4852, 0x06},
> +	{0x4856, 0x58},
> +	{0x4857, 0xaa},
> +	{0x4862, 0x0a},
> +	{0x4869, 0x18},
> +	{0x486a, 0xaa},
> +	{0x486e, 0x07}, /* MIPI CTRL 6E (default 0x03) */
> +	{0x486f, 0x55},
> +	{0x4875, 0xf0},
> +	{0x5000, 0x89},
> +	{0x5001, 0x42},
> +	{0x5004, 0x40},
> +	{0x5005, 0x00},
> +	{0x5180, 0x00},
> +	{0x5181, 0x10},
> +	{0x580b, 0x03},
> +	{0x4d00, 0x03},
> +	{0x4d01, 0xc9},
> +	{0x4d02, 0xbc},
> +	{0x4d03, 0xc6},
> +	{0x4d04, 0x4a},
> +	{0x4d05, 0x25},
> +	{0x4700, 0x2b},
> +	{0x4e00, 0x2b},
> +	{0x3501, 0x08}, /* Long exposure */
> +	{0x3502, 0xe1}, /* Long exposure */
> +	{0x3511, 0x00}, /* Short exposure */
> +	{0x3512, 0x20}, /* Short exposure */
> +	{0x3833, 0x01},
> +};
> +
> +#endif
> diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> index 5b9c069af19b..15559265d8f0 100644
> --- a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> +++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> @@ -42,6 +42,7 @@ struct ox05b1s_sizes {
>  	u32	sizes[OX05B1S_MAX_SIZES][2];
>  };
>  
> +struct ox05b1s;
>  struct ox05b1s_plat_data {
>  	char				name[20];
>  	u32				chip_id;
> @@ -56,6 +57,9 @@ struct ox05b1s_plat_data {
>  	u32				default_mode_index;
>  	const struct ox05b1s_sizes	*supported_codes;
>  	u32				supported_codes_count;
> +	const char * const		*hdr_modes;
> +	u32				hdr_modes_count;
> +	int (*set_hdr_mode)(struct ox05b1s *sensor, u32 hdr_mode);
>  };
>  
>  struct ox05b1s_ctrls {
> @@ -66,6 +70,7 @@ struct ox05b1s_ctrls {
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *gain;
>  	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *hdr_mode;
>  };
>  
>  struct ox05b1s_reg {
> @@ -73,6 +78,9 @@ struct ox05b1s_reg {
>  	u32 data;
>  };
>  
> +#include "os08a20_regs_1080p.h"
> +#include "os08a20_regs_4k.h"
> +#include "os08a20_regs_4k_hdr.h"
>  #include "ox05b1s_regs_5mp.h"
>  
>  struct ox05b1s_mode {
> @@ -104,6 +112,68 @@ struct ox05b1s {
>  	struct ox05b1s_ctrls ctrls;
>  };
>  
> +static struct ox05b1s_mode os08a20_supported_modes[] = {
> +	{
> +		/* 1080p BGGR10, no hdr, 60fps */
> +		.index		= 0,
> +		.width		= 1920,
> +		.height		= 1080,
> +		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.bpp		= 10,
> +		.vts		= 0x4a4,
> +		.hts		= 0x790,
> +		.exp		= 0x4a4 - 8,
> +		.h_bin		= true,
> +		.fps		= 60,
> +		.reg_data	= os08a20_init_setting_1080p,
> +		.reg_data_count	= ARRAY_SIZE(os08a20_init_setting_1080p),
> +	},
> +	{

These fit on the same line.

> +		/* 4k BGGR10, staggered hdr VC0/VC1, 15fps */
> +		.index		= 1,
> +		.width		= 3840,
> +		.height		= 2160,
> +		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.bpp		= 10,
> +		.vts		= 0x90a,
> +		.hts		= 0x818,
> +		.exp		= 0x90a - 8,
> +		.h_bin		= false,
> +		.fps		= 15,
> +		.reg_data	= os08a20_init_setting_4k_hdr,
> +		.reg_data_count	= ARRAY_SIZE(os08a20_init_setting_4k_hdr),
> +	},
> +	{
> +		/* 4k BGGR12, no hdr, 30fps */
> +		.index		= 2,
> +		.width		= 3840,
> +		.height		= 2160,
> +		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.bpp		= 12,
> +		.vts		= 0x8f0,
> +		.hts		= 0x814,
> +		.exp		= 0x8f0 - 8,
> +		.h_bin		= false,
> +		.fps		= 30,
> +		.reg_data	= os08a20_init_setting_4k,
> +		.reg_data_count	= ARRAY_SIZE(os08a20_init_setting_4k),
> +	},
> +};
> +
> +/* keep in sync with os08a20_supported_modes*/
> +static const struct ox05b1s_sizes os08a20_supported_codes[] = {
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.sizes_count = 2,

This doesn't seem like very nice to maintain. :-(

Could you make sizes a pointer instead?

> +		.sizes = { {1920, 1080}, {3840, 2160} }

Spaces inside braces, please.

> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.sizes_count = 1,
> +		.sizes = { {3840, 2160} }
> +	},
> +};
> +
>  static struct ox05b1s_mode ox05b1s_supported_modes[] = {
>  	{
>  		.index		= 0,
> @@ -210,6 +280,18 @@ static int ox05b1s_read_reg(struct ox05b1s *sensor, u16 reg, u8 *val)
>  	return ret;
>  }
>  
> +static int ox05b1s_update_bits(struct ox05b1s *sensor, u16 reg, unsigned int mask, u8 val)
> +{
> +	struct device *dev = &sensor->i2c_client->dev;
> +	int ret = 0;

The initialisation is redundant.

> +
> +	ret = regmap_update_bits(sensor->regmap, reg, mask, val);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to update reg addr 0x%04x with 0x%02x\n", reg, val);
> +
> +	return ret;
> +}
> +
>  #define OX05B1S_MAX_REG_BULK 16
>  static int ox05b1s_write_reg_array(struct ox05b1s *sensor,
>  				   struct ox05b1s_reg *reg_array,
> @@ -239,6 +321,67 @@ static int ox05b1s_write_reg_array(struct ox05b1s *sensor,
>  	return 0;
>  }
>  
> +static const char * const os08a20_hdr_modes[] = {
> +	"NO HDR",		/* No HDR, single exposure */
> +	"HDR Staggered",	/* Staggered HDR mode, 2 exposures on separate virtual channels */
> +};
> +
> +#define OS08A20_REG_CORE1		0x3661
> +#define OS08A20_STG_HDR_ALIGN_EN	BIT(0)
> +
> +#define OS08A20_REG_FORMAT2		0x3821
> +#define OS08A20_STG_HDR_EN		BIT(5)
> +
> +#define OS08A20_REG_MIPI_CTRL_13	0x4813
> +#define OS08A20_MISTERY_BIT3		BIT(3)
> +
> +#define OS08A20_REG_MIPI_CTRL_6E	0x486e
> +#define OS08A20_MIPI_VC_ENABLE		BIT(2)
> +
> +static int os08a20_enable_staggered_hdr(struct ox05b1s *sensor)
> +{
> +	int ret = 0;
> +
> +	ret |= ox05b1s_update_bits(sensor, OS08A20_REG_CORE1, OS08A20_STG_HDR_ALIGN_EN,
> +				   OS08A20_STG_HDR_ALIGN_EN);

How about returning the actual error code to the caller?

Also this requires reading the registers over I²C that is slow. If it's not
during streaming it should be fine though.

I'd probably make this a loop.

> +	ret |= ox05b1s_update_bits(sensor, OS08A20_REG_FORMAT2, OS08A20_STG_HDR_EN,
> +				   OS08A20_STG_HDR_EN);
> +	ret |= ox05b1s_update_bits(sensor, OS08A20_REG_MIPI_CTRL_13, OS08A20_MISTERY_BIT3,
> +				   OS08A20_MISTERY_BIT3);
> +	ret |= ox05b1s_update_bits(sensor, OS08A20_REG_MIPI_CTRL_6E, OS08A20_MIPI_VC_ENABLE,
> +				   OS08A20_MIPI_VC_ENABLE);
> +	if (ret)
> +		ret = -EIO;
> +
> +	return ret;
> +}
> +
> +static int os08a20_disable_staggered_hdr(struct ox05b1s *sensor)
> +{
> +	int ret = 0;
> +
> +	ret |= ox05b1s_update_bits(sensor, OS08A20_REG_CORE1, OS08A20_STG_HDR_ALIGN_EN, 0);
> +	ret |= ox05b1s_update_bits(sensor, OS08A20_REG_FORMAT2, OS08A20_STG_HDR_EN, 0);
> +	ret |= ox05b1s_update_bits(sensor, OS08A20_REG_MIPI_CTRL_13, OS08A20_MISTERY_BIT3, 0);
> +	ret |= ox05b1s_update_bits(sensor, OS08A20_REG_MIPI_CTRL_6E, OS08A20_MIPI_VC_ENABLE, 0);
> +	if (ret)
> +		ret = -EIO;
> +
> +	return ret;
> +}
> +
> +static int os08a20_set_hdr_mode(struct ox05b1s *sensor, u32 hdr_mode)
> +{
> +	switch (hdr_mode) {
> +	case 0:
> +		return os08a20_disable_staggered_hdr(sensor);
> +	case 1:
> +		return os08a20_enable_staggered_hdr(sensor);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static int ox05b1s_set_hts(struct ox05b1s *sensor, u32 hts)
>  {
>  	u8 values[2] = { (u8)(hts >> 8) & 0xff, (u8)(hts & 0xff) };
> @@ -307,6 +450,12 @@ static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_EXPOSURE:
>  		ret = ox05b1s_set_exp(sensor, ctrl->val);
>  		break;
> +	case V4L2_CID_HDR_SENSOR_MODE:
> +		if (sensor->model->set_hdr_mode)
> +			ret = sensor->model->set_hdr_mode(sensor, ctrl->val);
> +		else
> +			ret = -EINVAL;
> +		break;
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -369,6 +518,13 @@ static int ox05b1s_init_controls(struct ox05b1s *sensor)
>  	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
>  					0, 0xFFFF, 1, 0x80);
>  
> +	if (sensor->model->hdr_modes)
> +		ctrls->hdr_mode = v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_HDR_SENSOR_MODE,
> +							       sensor->model->hdr_modes_count - 1,
> +								0, 0, sensor->model->hdr_modes);
> +	else
> +		ctrls->hdr_mode = NULL;
> +
>  	if (hdl->error) {
>  		ret = hdl->error;
>  		goto free_ctrls;
> @@ -670,7 +826,10 @@ static u8 ox05b1s_code2dt(const u32 code)
>  {
>  	switch (code) {
>  	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
>  		return MIPI_CSI2_DT_RAW10;
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +		return MIPI_CSI2_DT_RAW12;
>  	default:
>  		return MIPI_CSI2_DT_RAW10;
>  	}
> @@ -775,6 +934,9 @@ static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
>  	}
>  
>  	switch (chip_id) {
> +	case 0x530841:
> +		camera_name = "os08a20";
> +		break;
>  	case 0x580542:
>  		camera_name = "ox05b1s";
>  		break;
> @@ -915,6 +1077,26 @@ static void ox05b1s_remove(struct i2c_client *client)
>  static DEFINE_RUNTIME_DEV_PM_OPS(ox05b1s_pm_ops, ox05b1s_runtime_suspend,
>  				 ox05b1s_runtime_resume, NULL);
>  
> +static const struct ox05b1s_plat_data os08a20_data = {
> +	.name			= "os08a20",
> +	.chip_id		= 0x530841,
> +	.native_width		= 3872, /* 16 dummy + 3840 active pixels + 16 dummy */
> +	.native_height		= 2192, /* 16 dummy + 2160 active lines + 16 dummy */
> +	.active_top		= 16,
> +	.active_left		= 16,
> +	.active_width		= 3840,
> +	.active_height		= 2160,
> +	.supported_modes	= os08a20_supported_modes,
> +	.supported_modes_count	= ARRAY_SIZE(os08a20_supported_modes),
> +	.default_mode_index	= 0,
> +	.supported_codes	= os08a20_supported_codes,
> +	.supported_codes_count	= ARRAY_SIZE(os08a20_supported_codes),
> +	.hdr_modes		= os08a20_hdr_modes,
> +	.hdr_modes_count	= ARRAY_SIZE(os08a20_hdr_modes),
> +	.set_hdr_mode		= os08a20_set_hdr_mode,
> +
> +};
> +
>  static const struct ox05b1s_plat_data ox05b1s_data = {
>  	.name			= "ox05b1s",
>  	.chip_id		= 0x580542,
> @@ -929,9 +1111,16 @@ static const struct ox05b1s_plat_data ox05b1s_data = {
>  	.default_mode_index	= 0,
>  	.supported_codes	= ox05b1s_supported_codes,
>  	.supported_codes_count	= ARRAY_SIZE(ox05b1s_supported_codes),
> +	.hdr_modes		= NULL,
> +	.hdr_modes_count	= 0,
> +	.set_hdr_mode		= NULL,
>  };
>  
>  static const struct of_device_id ox05b1s_of_match[] = {
> +	{
> +		.compatible = "ovti,os08a20",
> +		.data = &os08a20_data,
> +	},
>  	{
>  		.compatible = "ovti,ox05b1s",
>  		.data = &ox05b1s_data,

-- 
Kind regards,

Sakari Ailus

