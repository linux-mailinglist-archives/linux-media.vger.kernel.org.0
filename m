Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36ACF2A7EEB
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 13:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgKEMrz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 07:47:55 -0500
Received: from mga01.intel.com ([192.55.52.88]:35011 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgKEMry (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 07:47:54 -0500
IronPort-SDR: 67pHDi4rSgm8NGPdmz2I1intbSH1YjR9zh+RhdzI2Mgg8MfumpWaTqQJWJipjIY23HTyyOe2Oq
 Q2i8LZMVf4Yw==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="187282075"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="187282075"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 04:47:53 -0800
IronPort-SDR: VNh0k/QGsn2IudBfywlT+Yg4gFH9z+w+uhalKXT5FA56EAFZew1g6p/JNPHOK0hoH3WKl13ytk
 lnTTMinsa/pw==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="363798336"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 04:47:53 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2B76B20901; Thu,  5 Nov 2020 14:47:51 +0200 (EET)
Date:   Thu, 5 Nov 2020 14:47:51 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 099/106] v4l: uapi: ccs: Add controls for analogue
 gain constants
Message-ID: <20201105124751.GF26150@paasikivi.fi.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-90-sakari.ailus@linux.intel.com>
 <bccb9a91-99bf-71d2-f3e5-caa429c90f64@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bccb9a91-99bf-71d2-f3e5-caa429c90f64@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Nov 05, 2020 at 01:41:55PM +0100, Hans Verkuil wrote:
> On 07/10/2020 10:45, Sakari Ailus wrote:
> > Add a V4L2 controls for analogue gai constants required to control
> 
> gai -> gain
> 
> > analogue gain. The values are device specific and thus need to be obtained
> > from the driver.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  MAINTAINERS              |  1 +
> >  include/uapi/linux/ccs.h | 14 ++++++++++++++
> >  2 files changed, 15 insertions(+)
> >  create mode 100644 include/uapi/linux/ccs.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b72f666b8b60..c173e503b0b7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11569,6 +11569,7 @@ F:	drivers/media/i2c/ccs/
> >  F:	drivers/media/i2c/ccs-pll.c
> >  F:	drivers/media/i2c/ccs-pll.h
> >  F:	include/uapi/linux/smiapp.h
> > +F:	include/uapi/linux/ccs.h
> >  
> >  MIPS
> >  M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > diff --git a/include/uapi/linux/ccs.h b/include/uapi/linux/ccs.h
> > new file mode 100644
> > index 000000000000..bcdce95955b0
> > --- /dev/null
> > +++ b/include/uapi/linux/ccs.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only AND BSD-3-Clause */
> > +/* Copyright (C) 2020 Intel Corporation */
> > +
> > +#ifndef __UAPI_CCS_H__
> > +#define __UAPI_CCS_H__
> > +
> > +#include <linux/videodev2.h>
> > +
> > +#define V4L2_CID_CCS_ANALOGUE_GAIN_M0		(V4L2_CID_USER_CCS_BASE + 1)
> > +#define V4L2_CID_CCS_ANALOGUE_GAIN_C0		(V4L2_CID_USER_CCS_BASE + 2)
> > +#define V4L2_CID_CCS_ANALOGUE_GAIN_M1		(V4L2_CID_USER_CCS_BASE + 3)
> > +#define V4L2_CID_CCS_ANALOGUE_GAIN_C1		(V4L2_CID_USER_CCS_BASE + 4)
> 
> Please document these controls. Ditto for the later patches that add more
> of these controls.
> 
> This header is a good place to put the documentation.

Yes, I'll add that for v3.

-- 
Sakari Ailus
