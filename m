Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6537E2EAD4C
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 15:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbhAEOVy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 09:21:54 -0500
Received: from mga03.intel.com ([134.134.136.65]:40199 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbhAEOVy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Jan 2021 09:21:54 -0500
IronPort-SDR: SYQdZLoy8QZ9gKp0QtNVeOPhgnVpLWDatmKGHiL6N7gglX0IU4NPMEJbUl8Jgo55Oey5EzK8py
 V/7jGITWRtgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="177211577"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="177211577"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 06:20:07 -0800
IronPort-SDR: 2YWWHRaNdRdoqc7vMvkZ2TSm//9sf96cc60Ub1PzSok1REUS7woIYsVP4Haa2Ey5Z3o/xpline
 sNrnY5lI2m7Q==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="378884127"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 06:20:06 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 60F5D206FD; Tue,  5 Jan 2021 16:20:04 +0200 (EET)
Date:   Tue, 5 Jan 2021 16:20:04 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com
Subject: Re: [PATCH v2] media: v4l2-async: Add waiting subdevices debugfs
Message-ID: <20210105142004.GR11878@paasikivi.fi.intel.com>
References: <20210104174840.144958-1-ezequiel@collabora.com>
 <X/PhA5xsuHfSE1R/@pendragon.ideasonboard.com>
 <ba227fd79a0e0921b68365a4d636926b7c8b14ef.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba227fd79a0e0921b68365a4d636926b7c8b14ef.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Tue, Jan 05, 2021 at 10:34:14AM -0300, Ezequiel Garcia wrote:
> Hi Sakari, Laurent,
> 
> On Tue, 2021-01-05 at 05:46 +0200, Laurent Pinchart wrote:
> > Hi Ezequiel,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Jan 04, 2021 at 02:48:40PM -0300, Ezequiel Garcia wrote:
> > > There is currently little to none information available
> > > about the reasons why a v4l2-async device hasn't
> > > probed completely.
> > > 
> > > Inspired by the "devices_deferred" debugfs file,
> > > add a file to list information about the subdevices
> > > that are on waiting lists, for each notifier.
> > > 
> > > This is useful to debug v4l2-async subdevices
> > > and notifiers, for instance when doing device bring-up.
> > > 
> > > For instance, a typical output would be:
> > > 
> > > $ cat /sys/kernel/debug/video4linux/pending_async_subdevices
> > > ipu1_csi1:
> > >  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi1_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi1_mux
> > > ipu1_csi0:
> > >  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi0_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi0_mux
> > > imx6-mipi-csi2:
> > >  [fwnode] dev=1-003c, node=/soc/bus@2100000/i2c@21a4000/camera@3c
> > > imx-media:
> > > 
> > > Note that match-type "custom" prints no information.
> > > Since there are no in-tree users of this match-type,
> > > the implementation doesn't bother.
> > 
> > I wonder if we should drop it.
> > 
> 
> That would make sense, unless we have some out-of-tree
> users, and we want to support that.
> 
> Sakari, what do you think?

I think we could drop it. But I'd do that in a separate patch from this
one.

-- 
Regards,

Sakari Ailus
