Return-Path: <linux-media+bounces-15370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 769F493DB32
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2024 01:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ACA61C23339
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 23:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0ABA14F114;
	Fri, 26 Jul 2024 23:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z2glDitQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1A61CD13;
	Fri, 26 Jul 2024 23:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037619; cv=none; b=Zu8+mcD867qBaMxMxs5Q5Ovw40fNKAJEitXEYoAd48jTcEmfK55EDRyC6k5xP+Ca/4hrnjh4z7mJ3YSPVjJLsGk24FHj2TS9f7Mu97ceBptfM6LfE3uGvY/uM7dx2Lybx8CgzimquOHWSd2JI4iSrDu1mrq3KCdaETs3b058oxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037619; c=relaxed/simple;
	bh=5/PzxMTpWkDUOdlnbdCr2Q9qJin2wpwqnTQrXy29FVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7yE64ptZieLq3mEpg7puvQDpxZ+1g33eX3bS4Cbaf1N5IhBi/BhwOb/1wklK/oofGHf5ESrKZs4uZfUywCJsaHykk01HlHRtCUoFIN9PW/2dseJjBmn1A6g/9AaoJGY0rXkZUmPW2DqxF6BUag0/MT2saLfm9UUP1ygsd/PxQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z2glDitQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 209D463F;
	Sat, 27 Jul 2024 01:46:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722037570;
	bh=5/PzxMTpWkDUOdlnbdCr2Q9qJin2wpwqnTQrXy29FVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z2glDitQm24E82tdUO2KMAw4YfF+SZVq4uw7ErFusQKacG5hq7MuUXjSV08aIQtuH
	 uCFViKWFjC0dNCX1VwSRtslF36htfxopyCAW97nQkXvq6XmKBGYzYdEbey5lvVViPU
	 WG6+4/rDITpo6g36rLaYBoU2G+LLfehrjlFZUR+8=
Date: Sat, 27 Jul 2024 02:46:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= v5 01/14] media:
 starfive: Add JH7110 ISP module definitions
Message-ID: <20240726234636.GB300@pendragon.ideasonboard.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-2-changhuang.liang@starfivetech.com>
 <h52qw6ndset7h7rgbfs6jqbsweldgvc3ewforvzlhmacvmqzzl@u4ik6jeswswi>
 <20240722142724.GG5732@pendragon.ideasonboard.com>
 <ZQ0PR01MB13025E2A2CC848A5F82B66ABF2AA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQ0PR01MB13025E2A2CC848A5F82B66ABF2AA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>

Hello Changhuang,

On Wed, Jul 24, 2024 at 02:20:17AM +0000, Changhuang Liang wrote:
> > On Wed, Jul 10, 2024 at 11:11:57AM +0200, Jacopo Mondi wrote:
> > > On Tue, Jul 09, 2024 at 01:38:11AM GMT, Changhuang Liang wrote:
> > > > Add JH7110 ISP module definitions for user space.
> > > >
> > > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > > Signed-off-by: Zejian Su <zejian.su@starfivetech.com>
> > > > ---
> > > >  MAINTAINERS                     |   1 +
> > > >  include/uapi/linux/jh7110-isp.h | 739 ++++++++++++++++++++++++++++++++
> > >
> > > With the recently merged support for the RaspberryPi PiSP BE we have
> > > introduced include/uapi/linux/media/raspberry.
> > >
> > > Would you consider placing this in
> > > include/uapi/linux/media/startfive/ ?
> > 
> > That sounds like a good idea.
> > 
> > > >  2 files changed, 740 insertions(+)
> > > >  create mode 100644 include/uapi/linux/jh7110-isp.h
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS index
> > > > 507f04a80499..890604eb0d64 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -21305,6 +21305,7 @@ S:	Maintained
> > > >  F:	Documentation/admin-guide/media/starfive_camss.rst
> > > >  F:
> > 	Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> > > >  F:	drivers/staging/media/starfive/camss
> > > > +F:	include/uapi/linux/jh7110-isp.h
> > > >
> > > >  STARFIVE CRYPTO DRIVER
> > > >  M:	Jia Jie Ho <jiajie.ho@starfivetech.com>
> > > > diff --git a/include/uapi/linux/jh7110-isp.h
> > > > b/include/uapi/linux/jh7110-isp.h new file mode 100644 index
> > > > 000000000000..4939cd63e771
> > > > --- /dev/null
> > > > +++ b/include/uapi/linux/jh7110-isp.h
> > > > @@ -0,0 +1,739 @@
> > > > +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR
> > > > +BSD-3-Clause) */
> > > > +/*
> > > > + * jh7110-isp.h
> > > > + *
> > > > + * JH7110 ISP driver - user space header file.
> > > > + *
> > > > + * Copyright © 2023 StarFive Technology Co., Ltd.
> > > > + *
> > > > + * Author: Zejian Su <zejian.su@starfivetech.com>
> > > > + *
> > > > + */
> > > > +
> > > > +#ifndef __JH7110_ISP_H_
> > > > +#define __JH7110_ISP_H_
> > > > +
> > >
> > > Do you need to include
> > >
> > > #include <linux/types.h>
> > >
> > > > +/**
> > >
> > > Is this kernel-doc or a single * would do ?
> > >
> > > > + * ISP Module Diagram
> > > > + * ------------------
> > > > + *
> > > > + *  Raw  +-----+    +------+    +------+    +----+
> > > > + *  ---->| OBC |--->| OECF |--->| LCCF |--->| WB |-----+
> > > > + *       +-----+    +------+    +------+    +----+     |
> > > > + *                                                     |
> > > > + *  +--------------------------------------------------+
> > > > + *  |
> > > > + *  |    +-----+    +-----+    +-----+    +-----+
> > > > + *  +--->| DBC |--->| CTC |--->| CFA |--->| CAR |------+
> > > > + *       +-----+    +-----+    +-----+    +-----+      |
> > > > + *                                                     |
> > > > + *  +--------------------------------------------------+
> > > > + *  |
> > > > + *  |    +-----+    +--------+    +-----+    +------+
> > > > + *  +--->| CCM |--->| GMARGB |--->| R2Y |--->| YCRV |--+
> > > > + *       +-----+    +--------+    +-----+    +------+  |
> > > > + *                                                     |
> > > > + *  +--------------------------------------------------+
> > > > + *  |
> > > > + *  |    +-------+    +-------+    +-----+    +----+
> > > > + *  +--->| SHARP |--->| DNYUV |--->| SAT |--->| SC |
> > > > + *       +-------+    +-------+    +-----+    +----+
> > > > + *
> > 
> > The diagram is useful, thank you. A glossary would also be nice, maybe as
> > 
> >  * - OBC: Optical Black Correction
> >  * - OECF: Opto-Electric Conversion Function
> >  * ...
> > 
> > I think that would be easier to read than the comments above each macro
> > below. Up to you.
> > 
> > > > + */
> > > > +
> > > > +/* Auto White Balance */
> > > > +#define JH7110_ISP_MODULE_WB_SETTING			(1U << 0)
> > > > +/* Color Artifact Removal */
> > > > +#define JH7110_ISP_MODULE_CAR_SETTING			(1U << 1)
> > > > +/* Color Correction Matrix */
> > > > +#define JH7110_ISP_MODULE_CCM_SETTING			(1U << 2)
> > > > +/* Color Filter Arrays */
> > > > +#define JH7110_ISP_MODULE_CFA_SETTING			(1U << 3)
> > > > +/* Crosstalk Correction */
> > > > +#define JH7110_ISP_MODULE_CTC_SETTING			(1U << 4)
> > > > +/* Defect Bad Pixel Correction */
> > > > +#define JH7110_ISP_MODULE_DBC_SETTING			(1U << 5)
> > > > +/* Denoise YUV */
> > > > +#define JH7110_ISP_MODULE_DNYUV_SETTING			(1U << 6)
> > > > +/* RGB Gamma */
> > > > +#define JH7110_ISP_MODULE_GMARGB_SETTING		(1U << 7)
> > > > +/* Lens Correction Cosine Fourth */
> > > > +#define JH7110_ISP_MODULE_LCCF_SETTING			(1U << 8)
> > > > +/* Optical Black Correction */
> > > > +#define JH7110_ISP_MODULE_OBC_SETTING			(1U << 9)
> > > > +/* Opto-Electric Conversion Function */
> > > > +#define JH7110_ISP_MODULE_OECF_SETTING			(1U << 10)
> > > > +/* RGB To YUV */
> > > > +#define JH7110_ISP_MODULE_R2Y_SETTING			(1U << 11)
> > > > +/* Saturation */
> > > > +#define JH7110_ISP_MODULE_SAT_SETTING			(1U << 12)
> > > > +/* Sharpen */
> > > > +#define JH7110_ISP_MODULE_SHARP_SETTING			(1U << 13)
> > > > +/* Y Curve */
> > > > +#define JH7110_ISP_MODULE_YCRV_SETTING			(1U << 14)
> > > > +/* Statistics Collection */
> > > > +#define JH7110_ISP_MODULE_SC_SETTING			(1U << 15)
> > 
> > Unless there's a specific reason to keep the current order, maybe you could
> > sort those macros in the same order as in the module diagram ?
> > 
> > > > +
> > > > +/**
> > > > + * struct jh7110_isp_wb_gain - auto white balance gain
> > > > + *
> > > > + * @gain_r: gain value for red component.
> > > > + * @gain_g: gain value for green component.
> > > > + * @gain_b: gain value for blue component.
> > 
> > I suppose the gains are expressed as fixed-point integers. This needs more
> > details, what are the limits, and how many bits of integer and fractional parts
> > are there ?
> > 
> > Same comment for all the other values below.
> > 
> > > > + */
> > > > +struct jh7110_isp_wb_gain {
> > > > +	__u16 gain_r;
> > > > +	__u16 gain_g;
> > > > +	__u16 gain_b;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct jh7110_isp_wb_setting - Configuration used by auto white
> > > > +balance gain
> > > > + *
> > > > + * @enabled: enabled setting flag.
> > > > + * @gains: auto white balance gain setting.
> > > > + */
> > > > +struct jh7110_isp_wb_setting {
> > > > +	__u32 enabled;
> > > > +	struct jh7110_isp_wb_gain gains;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct jh7110_isp_car_setting - Configuration used by color
> > > > +artifact removal
> > > > + *
> > > > + * @enabled: enabled setting flag.
> > > > + */
> > > > +struct jh7110_isp_car_setting {
> > > > +	__u32 enabled;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct jh7110_isp_ccm_smlow - Color correction matrix
> > > > + *
> > > > + * @ccm: color transform matrix with size 3 by 3.
> > > > + * @offsets: the offsets of R, G, B after the transform by the ccm.
> > > > + */
> > > > +struct jh7110_isp_ccm_smlow {
> > > > +	__s32 ccm[3][3];
> > > > +	__s32 offsets[3];
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct jh7110_isp_ccm_setting - Configuration used by color
> > > > +correction matrix
> > > > + *
> > > > + * @enabled: enabled setting flag.
> > > > + * @ccm_smlow: Color correction matrix.
> > > > + */
> > > > +struct jh7110_isp_ccm_setting {
> > > > +	__u32 enabled;
> > > > +	struct jh7110_isp_ccm_smlow ccm_smlow; };
> > > > +
> > > > +/**
> > > > + * struct jh7110_isp_cfa_params - demosaic parameters
> > > > + *
> > > > + * @hv_width: detail smooth factor
> > > > + * @cross_cov: Cross covariance weighting.
> > 
> > This documentation doesn't tell how to use those paraemeters. This comment
> > applies to many other parameters below. There are three main options to
> > improve that:
> > 
> > - Expanding the documentation in this header file to clearly explain how
> >   to compute the parameters values.
> > 
> > - Providing an open userspace implementation of ISP algorithms that
> >   showcase how to calculate the values.
> > 
> > - Providing detailed hardware documentation for the ISP. This is usually
> >   not favoured by ISP vendors, and we are not pushing for this, but I
> >   wanted to mention it for completeness.
> > 
> 
> We prefer the first option. It will take a lot of time for us to
> supplement the documentation.

That is fine. Very broadly speaking, the level of documentation we are
aiming for should be enough for a third party developer to implement
support for the ISP control algorithms in libcamera. Please let me know
if you would like to discuss this in more details, to make sure there's
no misunderstanding in the expectations.

> > If you would prefer the second option, any open-source camera framework
> > would be acceptable, but in practice the only real option is likely libcamera.
> > 
> > This does not mean that you have to open-source all your ISP control
> > algorithms. Only the code needed to explain how ISP parameters are applied
> > to the image and are computed is needed. Other parts, such as for instance
> > AI-based computation of white balance gains, or complex AGC calculations,
> > don't need to be open-source.
> > 
> > The explain this requirement different and perhaps more clearly, the goal is to
> > make sure that developers who have access to only open-source code (ISP
> > kernel driver, this header, any open-source userspace code,
> > ...) will have enough information to configure and control the ISP.

-- 
Regards,

Laurent Pinchart

