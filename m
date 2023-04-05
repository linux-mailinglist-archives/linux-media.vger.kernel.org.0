Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D35606D795A
	for <lists+linux-media@lfdr.de>; Wed,  5 Apr 2023 12:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237629AbjDEKNt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 06:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjDEKNs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 06:13:48 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2651995
        for <linux-media@vger.kernel.org>; Wed,  5 Apr 2023 03:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680689627; x=1712225627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=opccJBHBu0Opk5ADjsij5C9Gcfq/2A4genkizgj2AGw=;
  b=IlzPg8Sy88zzmOd7safqerStEUPm+boVs5moFhX9Z8pNseX5Gz5NXRd2
   qpRFAuvMAYFZVeF16Krsz5f/Qc898VF3owyaJiSGAKAHjZzLVxRS+JQR4
   dooHVxgGuWtPFlqoemfy+mTgAExdG9HT11zQmT+34ez53sFfyrFv+MW9Y
   YjC3ThziruJ/WzuWgq1uzgZ0r9gBPs4dQlOZ7+moZM5KKzTrPI7vabn5U
   6Q+YripCxXikiWwp21OLg630//cZNch5TAkeRk5M0TtDz5qbsMxjXD4rz
   OgJHVfw+vpAvsBbrFJEyVvCMCmZaq6InLHbj3oiEZxbuio7w1ZeZz8oP1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="339908342"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="339908342"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 03:13:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="680232851"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="680232851"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 03:13:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 263741218A3;
        Wed,  5 Apr 2023 13:13:42 +0300 (EEST)
Date:   Wed, 5 Apr 2023 13:13:42 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/1] Documentation: v4l: Document rotation and
 orientation for sensor drivers
Message-ID: <ZC1J1oWaulW7uUvC@kekkonen.localdomain>
References: <20230328145248.1489994-1-sakari.ailus@linux.intel.com>
 <20230329182106.xi2k5diul3jixq3z@uno.localdomain>
 <ZCVNR+nMpUoNuVnX@kekkonen.localdomain>
 <20230330162725.5jubjq2muh6ztfhd@uno.localdomain>
 <20230405054102.GV9915@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405054102.GV9915@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Apr 05, 2023 at 08:41:02AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> On Thu, Mar 30, 2023 at 06:27:25PM +0200, Jacopo Mondi wrote:
> > On Thu, Mar 30, 2023 at 11:50:15AM +0300, Sakari Ailus wrote:
> > > On Wed, Mar 29, 2023 at 08:21:06PM +0200, Jacopo Mondi wrote:
> > > > On Tue, Mar 28, 2023 at 05:52:48PM +0300, Sakari Ailus wrote:
> > > > > Document how rotation and orientation should be taken into account in
> > > > > writing camera sensor drivers.
> > > > >
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > > since v1:
> > > > >
> > > > > Use speclial double quotes around functions to use non-proportional font for
> > > > > them.
> > > > >
> > > > >  Documentation/driver-api/media/camera-sensor.rst      | 11 +++++++++++
> > > > >  .../userspace-api/media/v4l/ext-ctrls-camera.rst      |  1 +
> > > > >  2 files changed, 12 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > > > index c7d4891bd24e..2618a91b0d85 100644
> > > > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > > @@ -151,3 +151,14 @@ used to obtain device's power state after the power state transition:
> > > > >  The function returns a non-zero value if it succeeded getting the power count or
> > > > >  runtime PM was disabled, in either of which cases the driver may proceed to
> > > > >  access the device.
> > > > > +
> > > > > +Rotation and orientation
> > > > > +------------------------
> > > > > +
> > > > > +Some systems have been implemented so that the camera sensor has been mounted
> > > > > +upside down compared to its natural mounting rotation. In such a case, the
> > > > > +:ref:`V4L2_CID_CAMERA_SENSOR_ROTATION <v4l2-camera-sensor-rotation>` control
> > > > > +shall indicate the mounting rotation.
> > > >
> > > > I would put it in imperative form for driver developers
> > > >
> > > > "Some systems have been implemented so that the camera sensor has been mounted
> > > > upside down compared to its natural mounting rotation. In such a case,
> 
> I'd simplify it further:
> 
> "Some systems have the camera sensor mounted upside down compared to its
> natural mounting rotation. In such cases, "
> 
> More words can add clarity, but when they don't, excess words should be
> removed :-)

Works for me.

> 
> > > > drivers should register the :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION
> > > > <v4l2-camera-sensor-rotation>` control to report the information to
> > > > userspace."
> > >
> > > That is in conditional, suggesting it isn't mandatory. Is that what you
> > > wanted to say?
> > 
> > "drivers shall register..." ?
> 
> Sounds good, maybe with s/register/expose/. Or
> 
> "drivers shall expose the information to userspace with the
> :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION <v4l2-camera-sensor-rotation>`
> control."
> 
> > > > I would also specify how drivers should initialize their flip controls
> > > >
> > > > "Mode-based sensor driver implementations that have any vertical or
> 
> s/driver implementations/drivers/
> 
> (still chasing extraneous words)
> 
> > > > horizontal flips embedded in the register programming sequences should
> > > > initialize the V4L2_CID_HFLIP and V4L2_CID_VFLIP controls with the
> > > > values programmed by the register sequences.
> > >
> > > I'd use "shall" also here. I can't think of a reasonable exception as it
> > > breaks how this is meant to work for user space.
> > 
> > Yes, I agree
> 
> Agreed. I'd drop "Mode-based" though, I don't think that's relevant,
> other drivers may do something similar.

I'll change these for v3.

> 
> > > > Drivers which implement writable flip controls could automatically
> > > > compensate for the sensor's mounting rotation and shall reflect that in
> > > > the V4L2_CID_HFLIP and V4L2_CID_VFLIP controls initial and default values."
> > >
> > > Good point. For existing drivers (such as CCS or IMX258) this could help
> > > existing users but I'm not sure I'd do this for new drivers. Comments and
> > > opinions would be welcome from others, too. Cc Laurent, too.
> 
> I wouldn't for new drivers, no, and even for IMX258 and CCS, I'm tempted
> to not keep that backward compatibility. We need to assess whether or
> not it would cause breakages in practice, if the risk is very low, I'd
> favour consistency. This is especially the case for CCS.

I've actually already posted patches doing just this for CCS.

> 
> > > > > +
> > > > > +Use ``v4l2_fwnode_device_parse()`` to obtain this information and
> > > > > +``v4l2_ctrl_new_fwnode_properties()`` to generate the appropriate controls.
> > > >
> > > > I would also mention the orientation control before introducing
> > > > v4l2_fwnode_device_parse.
> > > >
> > > > "Sensor drivers should also report their mounting orientation with the
> > > > :ref:`V4L2_CID_CAMERA_SENSOR_ORIENTATION <v4l2-camera-sensor-orientation>`.
> > > >
> > > > Both controls can be registered by using the ``v4l2_fwnode_device_parse()``
> > > > function to obtain this information from the firmware interface and
> > > > ``v4l2_ctrl_new_fwnode_properties()`` to generate the appropriate controls."
> > > >
> > > > How does this work for you ?
> > >
> > > I'd just use "shall" here, too.
> > 
> > Agree on this as well
> > 
> > > This applies of course to new drivers only, many existing ones are missing
> > > these bits.
> > 
> > I know :( It's however worth it to encourage new drivers to do that!
> 

-- 
Regards,

Sakari Ailus
