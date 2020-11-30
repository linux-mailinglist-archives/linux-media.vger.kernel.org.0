Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22E32C85C5
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 14:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgK3Nld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 08:41:33 -0500
Received: from mga07.intel.com ([134.134.136.100]:53734 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726220AbgK3Nlc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 08:41:32 -0500
IronPort-SDR: gGytLDsimFrk50+dmk2X2EH1gsc4POSraJdWAo+KUi93MnbGqAk07Bvam6vsVxwGJf2oSz5wx1
 ndocO2ORWxaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="236757839"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="236757839"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 05:39:51 -0800
IronPort-SDR: N3ryU2U5GWh96LcV/5uY/T0DXkcqTsWwzyafOtJ4D1+SJiOaQwHrEApHPJPDZYHkHc/BT4ZAjg
 zLwf7tvmHeMQ==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="404729837"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 05:39:49 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C2BDD208FD; Mon, 30 Nov 2020 15:39:45 +0200 (EET)
Date:   Mon, 30 Nov 2020 15:39:45 +0200
From:   'Sakari Ailus' <sakari.ailus@linux.intel.com>
To:     martinax.krasteva@linux.intel.com
Cc:     'Jacopo Mondi' <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH 2/2] media: Add imx334 camera sensor driver
Message-ID: <20201130133945.GV3940@paasikivi.fi.intel.com>
References: <20201120142803.308-1-martinax.krasteva@linux.intel.com>
 <20201120142803.308-3-martinax.krasteva@linux.intel.com>
 <20201123111029.rcoxchzj332tu6y4@uno.localdomain>
 <20201123140223.GZ3940@paasikivi.fi.intel.com>
 <001f01d6c702$8b760d40$a26227c0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001f01d6c702$8b760d40$a26227c0$@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martina,

On Mon, Nov 30, 2020 at 10:21:12AM -0000, martinax.krasteva@linux.intel.com wrote:
> Hi Sakari, Jacopo,
> 
> Thank you for the review
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Monday, November 23, 2020 2:02 PM
> > To: Jacopo Mondi <jacopo@jmondi.org>
> > Cc: Martina Krasteva <martinax.krasteva@linux.intel.com>; linux-
> > media@vger.kernel.org; mchehab@kernel.org; robh+dt@kernel.org;
> > devicetree@vger.kernel.org; daniele.alessandrelli@linux.intel.com;
> > gjorgjix.rosikopulos@linux.intel.com
> > Subject: Re: [PATCH 2/2] media: Add imx334 camera sensor driver
> > 
> > Hi Jacopo,
> > 
> > On Mon, Nov 23, 2020 at 12:10:29PM +0100, Jacopo Mondi wrote:
> > ...
> > > > +#include <media/v4l2-fwnode.h>
> > >
> > > You only use v4l2_async_register_subdev_sensor_common() from fwnde.h
> > > If you think you can replace it with v4l2_async_register_subdev() (see
> > > below comment) this should be changed in v4l2-async.h
> > 
> > Either is fine in principle. I'd use
> > v4l2_async_register_subdev_sensor_common() for sensors though, as it
> allows
> > connecting lens and flash sub-devices.
> > 
> > Regarding DT bindings --- I wonder if there's a way to say these are
> relevant for
> > all sensors. That'd be another discussion though.
> > 
> 
> Should I add lens and flash in DT binding doc, so it is clear that
> connecting such sub-devs is supported?
> I thought the binding doc should include only the bare minimum for a certain
> driver to be used, but it does make sense adding this info.

I wouldn't add them to bindings here as they're not related to this device
but to other devices.

I wonder what Rob thinks.

...

> > > > +static const struct media_entity_operations imx334_subdev_entity_ops
> = {
> > > > +	.link_validate = v4l2_subdev_link_validate, };
> > >
> > > Is link_validate called on sensor subdev ? My understanding is that
> > > they're called on the sink entity, but I might be mistaken.
> > 
> > Correct.
> > 
> 
> This is what I read in the v4l2-subdev.rst:
> " If the subdev driver intends to process video and integrate with the media
> framework, it must implement format related functionality using
> :c:type:`v4l2_subdev_pad_ops` instead of :c:type:`v4l2_subdev_video_ops`.
> 
> In that case, the subdev driver may set the link_validate field to provide
> its own link validation function. <<The link validation function is called
> for
> every link in the pipeline where both of the ends of the links are V4L2
> sub-devices.>> The driver is still responsible for validating the
> correctness
> of the format configuration between sub-devices and video nodes."
> 
> I find it a bit misleading, however I checked the source code, so I will
> remove it in the next version.
> 
> Something that is not clear to me is, do I have to explicitly set
> link_validate for the sink pad's entity to trigger validation. According to
> the doc
> I don't need to, but I cannot find the place in the source code where the
> default func is called even if the op is not set, neither setting default
> ops in case they weren't set.
>  
> "If link_validate op is not set, the default function
> :c:func:`v4l2_subdev_link_validate_default` is used instead. This function
> ensures that width, height and the media bus pixel code are equal on both
> source
> and sink of the link. Subdev drivers are also free to use this function to
> perform the checks mentioned above in addition to their own checks."

When a link is validated, it's the link_validate callback of the sink pad
that will be used for the purpose. This is currently not documented here
but should be added.

-- 
Kind regards,

Sakari Ailus
