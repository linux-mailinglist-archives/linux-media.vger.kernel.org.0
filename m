Return-Path: <linux-media+bounces-21240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 660029C3946
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 08:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBA5D1F213D3
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 07:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F191591F0;
	Mon, 11 Nov 2024 07:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="od4nhaWL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A48B15ECD7;
	Mon, 11 Nov 2024 07:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731311456; cv=none; b=EhXW3lywY3vjzTz/c+jCyjYrWm7jNHcMr9zbRPIOXJqLL+trEBVMVVwhvfgaJ/fgC3XukvCZd9FGaINA7M1JyeL/cFqnJJnqSdqZ9Nof2PNS8+1vUlA+a0oPSU4F6N2bJTBRfdWKnOY0K2eL5PCY/72U6OB8BWBOPUCzYagL7JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731311456; c=relaxed/simple;
	bh=ltTZSnkDQIGoQk/N9ULeVLgYWLr0hGAW6/vFQwPTloM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCa+MmmQm1wL6gGtFacMv/w6DVUb59/nCjIn3OaxnDWlNQPpfRxFaZHGl5rIiIidc2OtelnRrZhW817teIoLjVdYC6aKwjRToEUAz9h5tB9jdA9YrsbfaJHo7pZlmL+QVdoFuUiULms6AHaEMOel2tPEhxIr5BCQ9KBSQZe64bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=od4nhaWL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-143-109.net.vodafone.it [5.90.143.109])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A5BE6AF;
	Mon, 11 Nov 2024 08:50:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731311440;
	bh=ltTZSnkDQIGoQk/N9ULeVLgYWLr0hGAW6/vFQwPTloM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=od4nhaWLHCHRHzN2rQroGEm3yAt4hxxP/10jgPgmVHw5A3O1TFS3DJlugtbv5EZq4
	 U4MCIV40aGktQWr52NWAVB/A+Ndpj/Ibs/gzhx4+7OmwZ/quXLs/JzAonBgbFGlQrK
	 qWDJ3a0t2tBWOCQ3qDtCbW2PAfFWH9TEaTPtozkE=
Date: Mon, 11 Nov 2024 08:50:47 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Keke Li <keke.li@amlogic.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Subject: Re: [PATCH v3 7/9] media: platform: Add c3 ISP driver
Message-ID: <bwar32yjdafkvvw75u64e6yof2egj6kyo4yh7hs6fhiy5y4cp6@rcosn2wjf2vy>
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
 <20240918-c3isp-v3-7-f774a39e6774@amlogic.com>
 <kk23fd7evat3haw7o5l5xcbkx22tpupllheownw4u2kxl433d4@yd66zdccnwmr>
 <fedec977-632c-44bc-ae8b-44fe96dd3648@amlogic.com>
 <br5rdk5jmsf7lsoucah75nhjm4l3ocrdx2bvluab7lvf2yqd4l@jqqkohxdxzbf>
 <6cf52356-28ee-4067-85f4-e97cf64c8137@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cf52356-28ee-4067-85f4-e97cf64c8137@amlogic.com>

Hi Keke,
   let me ask Sakari's and Laurent's opinion on this specific
issue

On Mon, Nov 11, 2024 at 11:00:07AM +0800, Keke Li wrote:
> Hi Jacopo
>
> Thanks very much for your reply.
>
> On 2024/11/8 22:04, Jacopo Mondi wrote:
> > [ EXTERNAL EMAIL ]
> >
> > Hi Keke
> >
> > On Fri, Nov 08, 2024 at 08:34:41PM +0800, Keke Li wrote:
> > > Hi Jacopo
> > >
> > > Thanks very much for your reply.
> > >
> > > On 2024/11/8 00:03, Jacopo Mondi wrote:
> > > > [ EXTERNAL EMAIL ]
> > > >
> > > > Hi Keke
> > > >
> > > >      a first pass of review without going into details about the
> > > > ISP parameters and stats but mostly on architecture.
> > > >
> > > > On Wed, Sep 18, 2024 at 02:07:18PM +0800, Keke Li via B4 Relay wrote:
> > > > > From: Keke Li <keke.li@amlogic.com>
> > > > >
> > > > > The C3 ISP supports multi-camera and muti-exposure
> > > > > high dynamic range (HDR). It brings together some
> > > > > advanced imaging technologies to provide good image quality.
> > > > > This driver mainly responsible for driving ISP pipeline
> > > > > to process raw image.
> > > > >
> > > > > Signed-off-by: Keke Li <keke.li@amlogic.com>
> > > > > ---
> > > > >    drivers/media/platform/amlogic/Kconfig             |   1 +

[snip]

> >  > > > > +++ b/drivers/media/platform/amlogic/c3-isp/c3-isp-capture.c
> > > > > @@ -0,0 +1,759 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> > > > > +/*
> > > > > + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
> > > > > + */
> > > > > +
> > > > > +#include <linux/cleanup.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > > +
> > > > > +#include <media/v4l2-ctrls.h>
> > > > > +#include <media/v4l2-event.h>
> > > > > +#include <media/v4l2-ioctl.h>
> > > > > +#include <media/v4l2-mc.h>
> > > > > +#include <media/videobuf2-dma-contig.h>
> > > > > +
> > > > > +#include "c3-isp-common.h"
> > > > > +#include "c3-isp-regs.h"
> > > > > +
> > > > > +static const struct c3_isp_capture_format cap_formats[] = {
> > > > > +     {
> > > > > +             .mbus_code = MEDIA_BUS_FMT_Y8_1X8,
> > > > > +             .fourcc = V4L2_PIX_FMT_GREY,
> > > > > +             .depth = 8,
> > > > > +     },
> > > > > +     {
> > > > > +             .mbus_code = MEDIA_BUS_FMT_YUYV8_1_5X8,
> > > > Does the 5X8 version represents the format on the internal bus between
> > > > the resizers and the capture device ?
> > > >
> > > > How does format propagation work from the ISP to the resizers and the
> > > > capture devices ? I mean, is there an internal bus where the number of
> > > > samples (5X8 vs 2X8) changes depending on the output format ?
> > > >
> > > There is no internal bus between the resizer and the capture device.
> > >
> > I presume there is at least a data path, maybe as internal memory
> > buffers, between the different components of the ISP though.
>
>
> Yes, there is a data path between  resizer and capture node.
>
> > > The output format should be only configured in capture device.
> > >
> > Ok, what I'm after here is finding out the reason why you have
> > different mbus codes associated with different output formats. Same
> > thing as per the below question about the mbus codes used between the
> > ISP and the resizers.
> >
> > The mbus code should describe the format as it actually is in the data
> > path between the different ISP components. In example, if your
> > demosaicing block outputs data in a specific format with a specific
> > bit-depth (in example RGB data with a 30 bits wide bus) you should use
> > MEDIA_BUS_FMT_RGB101010_1X30.
> >
> > However, if this information is not available, or not relevant as it
> > doesn't influence the behaviour of any of the ISP blocks, I think
> > using MEDIA_BUS_FMT_FIXED should be fine.
> >
> > Otherwise, if there are reasons to use MEDIA_BUS_FMT_YUYV8_1_5X8 over
> > MEDIA_BUS_FMT_YUYV8_2X8 it's fine, but please explain them :)
> >
> > Thanks
> >    j
>
>
> I have checked the ISP datasheet, there is no need to use mbus code.
>
> So decided to use MEDIA_BUS_FMT_FIXED.
>
> > > > > +             .fourcc = V4L2_PIX_FMT_NV12,
> > > > > +             .depth = 12,
> > > > > +     }, {
> > > > > +             .mbus_code = MEDIA_BUS_FMT_YUYV8_1_5X8,
> > > > > +             .fourcc = V4L2_PIX_FMT_NV21,
> > > > > +             .depth = 12,
> > > > > +     }, {
> > > > > +             .mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > +             .fourcc = V4L2_PIX_FMT_NV16,
> > > > > +             .depth = 16,
> > > > > +     }, {
> > > > > +             .mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > +             .fourcc = V4L2_PIX_FMT_NV61,
> > > > > +             .depth = 16,
> > > > > +     },
> > > > > +};

