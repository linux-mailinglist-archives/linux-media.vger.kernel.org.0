Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305BC2DD9CF
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 21:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730991AbgLQUXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 15:23:41 -0500
Received: from mga07.intel.com ([134.134.136.100]:37224 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730981AbgLQUXl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 15:23:41 -0500
IronPort-SDR: GQlN0hnbzveIfWb5fez60stTt7sEfbxCuCf+D+mpZuFiXNzKyYy37dFCT/5ZXd7TXCdKoGPYns
 VasDYn8wGV2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9838"; a="239416835"
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; 
   d="scan'208";a="239416835"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2020 12:21:55 -0800
IronPort-SDR: /7nc/W6BsB+C5wR13IKnSqJQX3jYUWbrj86eCxWMT4HP7UhWNEnoVQ6bB0RCR9UfOwm7Uj8voV
 LaSpPxBMEFbw==
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; 
   d="scan'208";a="393011136"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2020 12:21:53 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0E523203F9; Thu, 17 Dec 2020 22:21:52 +0200 (EET)
Date:   Thu, 17 Dec 2020 22:21:52 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: uapi: Add an entity type for Image Signal
 Processors
Message-ID: <20201217202151.GT26370@paasikivi.fi.intel.com>
References: <20201217182903.27098-1-sakari.ailus@linux.intel.com>
 <X9umSNYPdC0uxm7/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9umSNYPdC0uxm7/@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 17, 2020 at 08:41:12PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Dec 17, 2020 at 08:29:03PM +0200, Sakari Ailus wrote:
> > Add and document a media entity type for Image Signal Processor devices.
> > Surprisingly we didn't have one, so add one now. More or less all ISP
> > drivers should use this type instead of what they currently are using (or
> > not using anything).
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/userspace-api/media/mediactl/media-types.rst | 6 ++++++
> >  include/uapi/linux/media.h                                 | 1 +
> >  2 files changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > index 7b24a213cae7..f18b2004de6d 100644
> > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > @@ -39,6 +39,7 @@ Types and flags used to represent the media graph elements
> >  .. _MEDIA-ENT-F-PROC-VIDEO-STATISTICS:
> >  .. _MEDIA-ENT-F-PROC-VIDEO-ENCODER:
> >  .. _MEDIA-ENT-F-PROC-VIDEO-DECODER:
> > +.. _MEDIA-ENT-F-PROC-VIDEO-ISP:
> >  .. _MEDIA-ENT-F-VID-MUX:
> >  .. _MEDIA-ENT-F-VID-IF-BRIDGE:
> >  .. _MEDIA-ENT-F-DV-DECODER:
> > @@ -201,6 +202,11 @@ Types and flags used to represent the media graph elements
> >            decompressing a compressed video stream into uncompressed video
> >  	  frames. Must have one sink pad and at least one source pad.
> >  
> > +    *  -  ``MEDIA_ENT_F_PROC_VIDEO_ISP``
> > +       -  An Image Signal Processor (ISP) device. ISPs generally are one of a
> > +	  kind devices that have their specific control interfaces. Most devices
> > +	  have either memory or data bus input.
> > +
> 
> This looks good to me. I don't think we need to formally define what an
> ISP is here, it's a fairly well understood concept in the industry and
> having some flexibility in the definition is useful.
> 
> We may want to expand a bit on the "specific control interface", to tell
> it's about the V4L2 API, and not the hardware interface. Maybe "...,
> using a combination of custom V4L2 controls and IOCTLs, and parameters
> supplied in a metadata buffer" ?
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

v2 sent.

-- 
Sakari Ailus
