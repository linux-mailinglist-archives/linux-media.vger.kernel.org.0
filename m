Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4C318F27D
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 11:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgCWKM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 06:12:57 -0400
Received: from mga01.intel.com ([192.55.52.88]:31838 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727816AbgCWKM5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 06:12:57 -0400
IronPort-SDR: kI7hjC5B2LQROY5wef/k1KYLcT0Vm2/lK1QxzXnaHCimixW2rsjV09FfN4rpJmOTSl7fdSbk/2
 z/HP80e08VrA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 03:12:56 -0700
IronPort-SDR: t1zgyaZwCvr/MEys3Q70J1eusWikkaNBQSVGY4zPCM+Yz7N18dBORL95jIpkmcwYsC9stVp1x/
 1Rqyd7aaVVMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,296,1580803200"; 
   d="scan'208";a="239354031"
Received: from sciuca-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.47.6])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2020 03:12:54 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id C874221EF2; Mon, 23 Mar 2020 12:12:50 +0200 (EET)
Date:   Mon, 23 Mar 2020 12:12:50 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v6 2/5] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200323101250.GB20664@kekkonen.localdomain>
References: <20200319004701.30416-1-laurent.pinchart@ideasonboard.com>
 <20200319004701.30416-3-laurent.pinchart@ideasonboard.com>
 <20200323100328.GA20664@kekkonen.localdomain>
 <20200323100727.GA4768@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323100727.GA4768@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 23, 2020 at 12:07:27PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, Mar 23, 2020 at 12:03:28PM +0200, Sakari Ailus wrote:
> > On Thu, Mar 19, 2020 at 02:46:58AM +0200, Laurent Pinchart wrote:
> > > The VIDIOC_ENUM_FMT ioctl enumerates all formats supported by a video
> > > node. For MC-centric devices, its behaviour has always been ill-defined,
> > > with drivers implementing one of the following behaviours:
> > > 
> > > - No support for VIDIOC_ENUM_FMT at all
> > > - Enumerating all formats supported by the video node, regardless of the
> > >   configuration of the pipeline
> > > - Enumerating formats supported by the video node for the active
> > >   configuration of the connected subdevice
> > > 
> > > The first behaviour is obviously useless for applications. The second
> > > behaviour provides the most information, but doesn't offer a way to find
> > > what formats are compatible with a given pipeline configuration. The
> > > third behaviour fixes that, but with the drawback that applications
> > > can't enumerate all supported formats anymore, and have to modify the
> > > active configuration of the pipeline to enumerate formats.
> > > 
> > > The situation is messy as none of the implemented behaviours are ideal,
> > > and userspace can't predict what will happen as the behaviour is
> > > driver-specific.
> > > 
> > > To fix this, let's extend the VIDIOC_ENUM_FMT with a missing capability:
> > > enumerating pixel formats for a given media bus code. The media bus code
> > > is passed through the v4l2_fmtdesc structure in a new mbus_code field
> > > (repurposed from the reserved fields). With this capability in place,
> > > applications can enumerate pixel formats for a given media bus code
> > > without modifying the active configuration of the device.
> > > 
> > > The current behaviour of the ioctl is preserved when the new mbus_code
> > > field is set to 0, ensuring compatibility with existing userspace. The
> > > API extension is documented as mandatory for MC-centric devices (as
> > > advertised through the V4L2_CAP_IO_MC capability), allowing applications
> > > and compliance tools to easily determine the availability of the
> > > VIDIOC_ENUM_FMT extension.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > I'd address setting the reserved fields explicitly in a separate patch,
> > simply by removing them. As another field in the struct is assigned, the
> > memory is zeroed and explicit assignment is redundant.
> 
> I'm not sure to follow you, what code are you referring to ?

Have you seen the e-mails from the kbuild bot?

-- 
Sakari Ailus
