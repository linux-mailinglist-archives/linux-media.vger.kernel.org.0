Return-Path: <linux-media+bounces-36248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E318AED5DC
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 473C93B1B63
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 07:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B41B2222A6;
	Mon, 30 Jun 2025 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gF+4Ie7J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155971E502;
	Mon, 30 Jun 2025 07:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751269077; cv=none; b=WS+izp2QjGSbXqHCUuXGGD8d+vksVSiafmZmuIyxAaWL4IvB2UEXnfZcVBFg2E4VeZJodHkjyOWOgOnwXygzQJVAVF03tw/As/aFZhXbwOErdA694QpbcMD0C/+WWnSlxUCoBs/fKw86SZFhN8JdcjVstkOWD0siQ0ruwPFipW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751269077; c=relaxed/simple;
	bh=J+i5E5nappl0ril9BLgF8kvARi1HEQJl5YkrGc6cR6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qM8wj7M/bFpMHWGK0jPCh4MprpL9drP7BWPtLDCtV98yb2MWjwiYufwlD3GZi7+79os/ioq0/8vzdGHFlZMyi4Er+BDQ1VKBmhlVBZ8SXOllvffoJonmeT9pnP/bWoS23MGR0Zh2NWg6Z5JkFhL8K5/IvkO9yj6xODFjVgnUhrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gF+4Ie7J; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751269076; x=1782805076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J+i5E5nappl0ril9BLgF8kvARi1HEQJl5YkrGc6cR6s=;
  b=gF+4Ie7JEXuaq19WazK9iYg605tvepq9IG/5y9p4ydRfgJ9ZdX85J0l+
   YXtSzRfS8R09tA9ZUe0r9HXAw5CWP7Ihwj9+TESEXShSVQzlANPrgM/74
   KUYnA8mprf7E9Ww42kL9VbSj7fH5Y1D8ppEGMWW/s0MXbGRz7s5ejfdVW
   1WleC3PDLo1fJpcvYRfMm+0eWMy98DYz39C+ImyYreZJgj99mmHGqf11c
   fTehYho1GfiC8pudxqU5uPiIKBEjmwm9qGS5T0cMhJwr/ulcz8GMqz3//
   7YmBtRWInSSJlR55p8girZg54Bow8v7MqKgjeP8I/zBw0gTaWcyXuzC95
   A==;
X-CSE-ConnectionGUID: 3IcLBw4YRDeqaI8p54YDDw==
X-CSE-MsgGUID: oDy46JGLSp+tzcgXjmbwFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53633733"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53633733"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:37:55 -0700
X-CSE-ConnectionGUID: mqYOQuhjQ+6VZF9w7ycY/A==
X-CSE-MsgGUID: EIrgA14pTqC5j6UZ3LB+8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153481695"
Received: from agladkov-desk.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.57])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:37:52 -0700
Received: from svinhufvud (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTPS id 5414C427E5;
	Mon, 30 Jun 2025 10:37:49 +0300 (EEST)
Date: Mon, 30 Jun 2025 10:37:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v10 07/17] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <aGI+y4sOlPAQMzWI@svinhufvud>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-7-54f3d4196990@ideasonboard.com>
 <cee962ce-3719-4ae7-9849-548a95d98e99@linux.intel.com>
 <20250629183547.GF6260@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629183547.GF6260@pendragon.ideasonboard.com>

Hi Laurent,

On Sun, Jun 29, 2025 at 09:35:47PM +0300, Laurent Pinchart wrote:
> On Sat, Jun 28, 2025 at 11:06:54PM +0300, Sakari Ailus wrote:
> > On 6/24/25 13:21, Daniel Scally wrote:
> 
> [snip]
> 
> > > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..20d4d16c75fbf0d5519ecadb5ed1d080bdae05de
> > > --- /dev/null
> > > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > > @@ -0,0 +1,656 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * ARM Mali-C55 ISP Driver - Image signal processor
> > > + *
> > > + * Copyright (C) 2024 Ideas on Board Oy
> > 
> > It's 2025 already.
> > 
> > > + */
> > > +
> > > +#include <linux/delay.h>
> > > +#include <linux/iopoll.h>
> > > +#include <linux/property.h>
> > > +#include <linux/string.h>
> > > +
> > > +#include <linux/media/arm/mali-c55-config.h>
> > 
> > If this is a UAPI header, please include uapi in the path, too.
> > 
> > Earlier such headers have been under include/uapi/linux, I don't object 
> > putting new ones elsewhere in principle though. Just check with Hans and 
> > Laurent, too... I don't have an opinion yet really.
> 
> With each new media header we add to include/uapi/linux/, I wish
> stronger and stronger that we had created include/uapi/linux/media/. We
> don't have to do it now, my regret will just grow stronger :-)

I'm fine with using include/uapi/linux/media/.

> 
> > > +/* NOT const because the default needs to be filled in at runtime */
> > > +static struct v4l2_ctrl_config mali_c55_isp_v4l2_custom_ctrls[] = {
> > > +	{
> > > +		.ops = &mali_c55_isp_ctrl_ops,
> > > +		.id = V4L2_CID_MALI_C55_CAPABILITIES,
> > > +		.name = "Mali-C55 ISP Capabilities",
> > > +		.type = V4L2_CTRL_TYPE_BITMASK,
> > > +		.min = 0,
> > > +		.max = MALI_C55_GPS_PONG_FITTED |
> > > +		       MALI_C55_GPS_WDR_FITTED |
> > > +		       MALI_C55_GPS_COMPRESSION_FITTED |
> > > +		       MALI_C55_GPS_TEMPER_FITTED |
> > > +		       MALI_C55_GPS_SINTER_LITE_FITTED |
> > > +		       MALI_C55_GPS_SINTER_FITTED |
> > > +		       MALI_C55_GPS_IRIDIX_LTM_FITTED |
> > > +		       MALI_C55_GPS_IRIDIX_GTM_FITTED |
> > > +		       MALI_C55_GPS_CNR_FITTED |
> > > +		       MALI_C55_GPS_FRSCALER_FITTED |
> > > +		       MALI_C55_GPS_DS_PIPE_FITTED,
> > > +		.def = 0,
> > > +	},
> > > +};
> > > +
> > > +static int mali_c55_isp_init_controls(struct mali_c55 *mali_c55)
> > > +{
> > > +	struct v4l2_ctrl_handler *handler = &mali_c55->isp.handler;
> > > +	struct v4l2_ctrl *capabilities;
> > > +	int ret;
> > > +
> > > +	ret = v4l2_ctrl_handler_init(handler, 1);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	mali_c55_isp_v4l2_custom_ctrls[0].def = mali_c55->capabilities;
> > 
> > The capabilities here are still specific to a device, not global, in 
> > principle at least. Can you move it here, as a local variable?
> > 
> > > +
> > > +	capabilities = v4l2_ctrl_new_custom(handler,
> > > +					    &mali_c55_isp_v4l2_custom_ctrls[0],
> > > +					    NULL);
> > > +	if (capabilities)
> > > +		capabilities->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +	if (handler->error) {
> > > +		dev_err(mali_c55->dev, "failed to register capabilities control\n");
> > > +		v4l2_ctrl_handler_free(handler);
> > > +		return handler->error;
> > 
> > v4l2_ctrl_handler_free() will return the error soon, presumably sooner 
> > than the above code makes it to upstream. Before that, this pattern 
> > won't work as v4l2_ctrl_handler_free() also resets the handler's error 
> > field. :-)
> > 
> > > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..36a81be0191a15da91809dd2da5d279716f6d725
> > > --- /dev/null
> > > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > > @@ -0,0 +1,318 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * ARM Mali-C55 ISP Driver - Register definitions
> > > + *
> > > + * Copyright (C) 2024 Ideas on Board Oy
> > > + */
> > > +
> > > +#ifndef _MALI_C55_REGISTERS_H
> > > +#define _MALI_C55_REGISTERS_H
> > > +
> > > +#include <linux/bits.h>
> > > +
> > > +/* ISP Common 0x00000 - 0x000ff */
> > > +
> > > +#define MALI_C55_REG_API				0x00000
> > > +#define MALI_C55_REG_PRODUCT				0x00004
> > > +#define MALI_C55_REG_VERSION				0x00008
> > > +#define MALI_C55_REG_REVISION				0x0000c
> > > +#define MALI_C55_REG_PULSE_MODE				0x0003c
> > > +#define MALI_C55_REG_INPUT_MODE_REQUEST			0x0009c
> > > +#define MALI_C55_INPUT_SAFE_STOP			0x00
> > > +#define MALI_C55_INPUT_SAFE_START			0x01
> > > +#define MALI_C55_REG_MODE_STATUS			0x000a0
> > > +#define MALI_C55_REG_INTERRUPT_MASK_VECTOR		0x00030
> > > +#define MALI_C55_INTERRUPT_MASK_ALL			GENMASK(31, 0)
> > > +
> > > +#define MALI_C55_REG_GLOBAL_MONITOR			0x00050
> > > +
> > > +#define MALI_C55_REG_GEN_VIDEO				0x00080
> > > +#define MALI_C55_REG_GEN_VIDEO_ON_MASK			BIT(0)
> > > +#define MALI_C55_REG_GEN_VIDEO_MULTI_MASK		BIT(1)
> > > +#define MALI_C55_REG_GEN_PREFETCH_MASK			GENMASK(31, 16)
> > > +
> > > +#define MALI_C55_REG_MCU_CONFIG				0x00020
> > > +#define MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK		BIT(0)
> > > +#define MALI_C55_REG_MCU_CONFIG_WRITE_MASK		BIT(1)
> > > +#define MALI_C55_MCU_CONFIG_WRITE(x)			((x) << 1)
> > 
> > Is x unsigned?
> 
> Does it matter ? The reason why the BIT() macro uses (UL(1) << (nr))
> instead of (1 << (nr)) is (if I'm not mistaken) to avoid incorrect
> handling of bit 31. As long as x doesn't take negative values and
> doesn't extend to bit 31, it should be fine.

For that reason exactly. If you're unsure, maybe at least cast it as
unsigned?

> 
> > > +#define MALI_C55_REG_MCU_CONFIG_WRITE_PING		BIT(1)
> > > +#define MALI_C55_REG_MCU_CONFIG_WRITE_PONG		0x00
> > > +#define MALI_C55_REG_MULTI_CONTEXT_MODE_MASK		BIT(8)
> > > +#define MALI_C55_REG_PING_PONG_READ			0x00024
> > > +#define MALI_C55_REG_PING_PONG_READ_MASK		BIT(2)
> > > +#define MALI_C55_INTERRUPT_BIT(x)			BIT(x)
> > > +
> > > +#define MALI_C55_REG_GLOBAL_PARAMETER_STATUS		0x00068
> > > +#define MALI_C55_GPS_PONG_FITTED			BIT(0)
> > > +#define MALI_C55_GPS_WDR_FITTED				BIT(1)
> > > +#define MALI_C55_GPS_COMPRESSION_FITTED			BIT(2)
> > > +#define MALI_C55_GPS_TEMPER_FITTED			BIT(3)
> > > +#define MALI_C55_GPS_SINTER_LITE_FITTED			BIT(4)
> > > +#define MALI_C55_GPS_SINTER_FITTED			BIT(5)
> > > +#define MALI_C55_GPS_IRIDIX_LTM_FITTED			BIT(6)
> > > +#define MALI_C55_GPS_IRIDIX_GTM_FITTED			BIT(7)
> > > +#define MALI_C55_GPS_CNR_FITTED				BIT(8)
> > > +#define MALI_C55_GPS_FRSCALER_FITTED			BIT(9)
> > > +#define MALI_C55_GPS_DS_PIPE_FITTED			BIT(10)
> > > +
> > > +#define MALI_C55_REG_BLANKING				0x00084
> > > +#define MALI_C55_REG_HBLANK_MASK			GENMASK(15, 0)
> > > +#define MALI_C55_REG_VBLANK_MASK			GENMASK(31, 16)
> > > +#define MALI_C55_VBLANK(x)				((x) << 16)
> > 
> > Same question for the bit shifts left elsewhere in the header.
> > 
> > > +
> > > +#define MALI_C55_REG_HC_START				0x00088
> > > +#define MALI_C55_HC_START(h)				(((h) & 0xffff) << 16)
> > > +#define MALI_C55_REG_HC_SIZE				0x0008c
> > > +#define MALI_C55_HC_SIZE(h)				((h) & 0xffff)
> > > +#define MALI_C55_REG_VC_START_SIZE			0x00094
> > > +#define MALI_C55_VC_START(v)				((v) & 0xffff)
> > > +#define MALI_C55_VC_SIZE(v)				(((v) & 0xffff) << 16)
> > > +
> > > +/* Ping/Pong Configuration Space */
> > > +#define MALI_C55_REG_BASE_ADDR				0x18e88
> > > +#define MALI_C55_REG_BYPASS_0				0x18eac
> > > +#define MALI_C55_REG_BYPASS_0_VIDEO_TEST		BIT(0)
> > > +#define MALI_C55_REG_BYPASS_0_INPUT_FMT			BIT(1)
> > > +#define MALI_C55_REG_BYPASS_0_DECOMPANDER		BIT(2)
> > > +#define MALI_C55_REG_BYPASS_0_SENSOR_OFFSET_WDR		BIT(3)
> > > +#define MALI_C55_REG_BYPASS_0_GAIN_WDR			BIT(4)
> > > +#define MALI_C55_REG_BYPASS_0_FRAME_STITCH		BIT(5)
> > > +#define MALI_C55_REG_BYPASS_1				0x18eb0
> > > +#define MALI_C55_REG_BYPASS_1_DIGI_GAIN			BIT(0)
> > > +#define MALI_C55_REG_BYPASS_1_FE_SENSOR_OFFS		BIT(1)
> > > +#define MALI_C55_REG_BYPASS_1_FE_SQRT			BIT(2)
> > > +#define MALI_C55_REG_BYPASS_1_RAW_FE			BIT(3)
> > > +#define MALI_C55_REG_BYPASS_2				0x18eb8
> > > +#define MALI_C55_REG_BYPASS_2_SINTER			BIT(0)
> > > +#define MALI_C55_REG_BYPASS_2_TEMPER			BIT(1)
> > > +#define MALI_C55_REG_BYPASS_3				0x18ebc
> > > +#define MALI_C55_REG_BYPASS_3_SQUARE_BE			BIT(0)
> > > +#define MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH	BIT(1)
> > > +#define MALI_C55_REG_BYPASS_3_MESH_SHADING		BIT(3)
> > > +#define MALI_C55_REG_BYPASS_3_WHITE_BALANCE		BIT(4)
> > > +#define MALI_C55_REG_BYPASS_3_IRIDIX			BIT(5)
> > > +#define MALI_C55_REG_BYPASS_3_IRIDIX_GAIN		BIT(6)
> > > +#define MALI_C55_REG_BYPASS_4				0x18ec0
> > > +#define MALI_C55_REG_BYPASS_4_DEMOSAIC_RGB		BIT(1)
> > > +#define MALI_C55_REG_BYPASS_4_PF_CORRECTION		BIT(3)
> > > +#define MALI_C55_REG_BYPASS_4_CCM			BIT(4)
> > > +#define MALI_C55_REG_BYPASS_4_CNR			BIT(5)
> > > +#define MALI_C55_REG_FR_BYPASS				0x18ec4
> > > +#define MALI_C55_REG_DS_BYPASS				0x18ec8
> > > +#define MALI_C55_BYPASS_CROP				BIT(0)
> > > +#define MALI_C55_BYPASS_SCALER				BIT(1)
> > > +#define MALI_C55_BYPASS_GAMMA_RGB			BIT(2)
> > > +#define MALI_C55_BYPASS_SHARPEN				BIT(3)
> > > +#define MALI_C55_BYPASS_CS_CONV				BIT(4)
> > > +#define MALI_C55_REG_ISP_RAW_BYPASS			0x18ecc
> > > +#define MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK		BIT(0)
> > > +#define MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK		GENMASK(9, 8)
> > > +#define MALI_C55_ISP_RAW_BYPASS_RAW_FR_BYPASS		(2 << 8)
> > > +#define MALI_C55_ISP_RAW_BYPASS_RGB_FR_BYPASS		(1 << 8)
> > 
> > BIT() or make these unsigned.
> 
> It's a 2 bits field, BIT() isn't appropriate.

That leaves us with the other alternative, doesn't it?

-- 
Kind regards,

Sakari Ailus

