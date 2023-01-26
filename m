Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E481C67D0D9
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 17:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbjAZQDC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 11:03:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbjAZQC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 11:02:58 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F404D37F14
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 08:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674748972; x=1706284972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=us5EMeO4i1ONYFv6uidIHv44G5p5LkZIuCFRzMrWOjM=;
  b=j/1dBMXZuW0OZ2yYGXfnqdvpsilXoBr95FxebiQd1W0WD01sv3ykPG6y
   Ma+P5f6ed701TBTMzG0nrPT+Sbq74CCfoSOExF4TVfkJEmesPM8fClN5J
   98iYOpPIs3qYRh1eA+JOwW71HlXt/O6ycpVoZ95QBl7154lBFds2MKEkC
   3GtFlyUEPpkB+oNbdPeUK8OMLXTQ06yiaWcm0lHb2Q6JHaG0m7See0OXt
   VSq5eZ5wklWdP4X3GfcYSt86WvNbaN7xPchCUNneqPxbRE4H7TvSrJt/Q
   Y4Xmw4vV4gqPsqOAH0R/lhmxvuXLNgI6Pbo4m0JBBZYOFYgJI+OoVOzf9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="328953115"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; 
   d="scan'208";a="328953115"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 08:02:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805416589"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; 
   d="scan'208";a="805416589"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 08:02:10 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 7AF4311FAC0;
        Thu, 26 Jan 2023 18:02:07 +0200 (EET)
Date:   Thu, 26 Jan 2023 18:02:07 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Robert Mader <robert.mader@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
Message-ID: <Y9Kj//mOE9Fq6ZXb@kekkonen.localdomain>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <Y9KTkSqgyxJbvsj9@kekkonen.localdomain>
 <CAPY8ntCWUSbvUKziuq0ABX2vOGJyCwtQN7MEt5LXQf0yKpfMKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntCWUSbvUKziuq0ABX2vOGJyCwtQN7MEt5LXQf0yKpfMKA@mail.gmail.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Thu, Jan 26, 2023 at 03:48:04PM +0000, Dave Stevenson wrote:
> Hi Jacopo and Sakari
> 
> On Thu, 26 Jan 2023 at 14:52, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Jacopo,
> >
> > On Tue, Jan 17, 2023 at 11:06:00AM +0100, Jacopo Mondi wrote:
> > > Currently the imx258 driver requires to have the 'rotation' device node
> > > property specified in DTS with a fixed value of 180 degrees.
> > >
> > > The "rotation" fwnode device property is intended to allow specify the
> > > sensor's physical mounting rotation, so that it can be exposed through
> > > the read-only V4L2_CID_CAMERA_SENSOR_ROTATION control and applications
> > > can decide how to compensate for that.
> > >
> > > The imx258 driver has read-only VFLIP and HFLIP enabled, resulting in
> > > a 180 degrees image rotation being produced by the sensor. But this
> > > doesn't imply that the physical mounting rotation should match the
> > > driver's implementation.
> > >
> > > I took into the series Robert's patch that register device node properties and
> > > on top of that register flips controls, in order to remove the hard requirement
> > > of the 180 degrees rotation property presence.
> >
> > Reconsidering these patches after the flipping vs. rotation discussion,
> > they seem fine. The only thing I'd like to see, after removing the rotation
> > property check, would be to add support for the actual flipping controls.
> > I'm pretty sure they can be found in the same registers as on CCS --- the
> > rest of the registers look very much like that. Would you like to send a
> > patch? :-)
> 
> Yes it is register 0x0101, bits 0 (H) & 1 (V).
> 
> Do watch out as there are register errors in the driver. Currently
> Y_ADD_STA is set to 0, and Y_ADD_END to 3118, giving 3119 lines total.

Yes, this is the problem with register list based drivers. Well spotted.

I remember one driver for a Toshiba sensor using value of 5 for a register
the range of which was 2--10, but only even values were allowed. It worked
nonetheless... oh well.

I wonder if this sensor would work better with the CCS driver 

> That means that when you initially implement flips the Bayer order
> won't change, but you change the field of view by one line.
> The start and end values also break the requirements listed in the
> datasheets for STA/END values being multiples of X (table 4-2 of the
> datasheet). Correcting that will change the Bayer order when inverted.
> Does that count as a regression to userspace? I hope not. Memory says
> that if you don't correct Y_ADD_END then some of the binned modes
> misbehave.

Most sensors also require even values for the ?_ADDR_START registers (and
odd for the _ADDR_END registers). Using an invalid value sometimes might
work, too, but only testing will tell.

> 
> I have been through this loop before as Soho Enterprise [1] make an
> IMX258 board for the Pi. I haven't upstreamed the patches [2] though
> (sorry).

It'd be nice if both worked with the same driver.

-- 
Kind regards,

Sakari Ailus
