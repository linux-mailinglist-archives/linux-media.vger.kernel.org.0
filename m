Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9215B6CFF14
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 10:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbjC3Iuh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 04:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbjC3IuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 04:50:21 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238B57EE8
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 01:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680166220; x=1711702220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rJOb1q/XU2vX6WssmVnmDQQXc86PbguD+XxybKE9kDg=;
  b=M/+nTDm0z7U8EGZySgQPNDkT/1I0KqORXM+zCw9Ft3W4qpC+Tak9yO+b
   JQLvyn4xthzrnJbR4RW3igV41fgbKDXE2G+1aHD4eqDf2D+7plXDKEAfm
   C7B7jj3xWibboVuORl+/Qz0DvzYUZVY51zB2+JkgHeYSfkKKWc5xvtaMt
   1aP5ZNtlpdIxg5qKRDnW0Fv88JmjGM2erjrbCb7m51Z9hME2bnS+T8OX1
   WbDxfVjQUolFeYeLkuKY4XLJE9s5LeWiCYHB8KslYEVs91IxVSm16NnzI
   1k7zwjUVF5b9jnXL0EHmXG6hupg+ifl4KFGe+k0PXugFk9r/8EUWqFjjg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="403758736"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="403758736"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 01:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="634796855"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="634796855"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 01:50:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 9D7CA11F8F6;
        Thu, 30 Mar 2023 11:50:15 +0300 (EEST)
Date:   Thu, 30 Mar 2023 11:50:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 1/1] Documentation: v4l: Document rotation and
 orientation for sensor drivers
Message-ID: <ZCVNR+nMpUoNuVnX@kekkonen.localdomain>
References: <20230328145248.1489994-1-sakari.ailus@linux.intel.com>
 <20230329182106.xi2k5diul3jixq3z@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329182106.xi2k5diul3jixq3z@uno.localdomain>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Mar 29, 2023 at 08:21:06PM +0200, Jacopo Mondi wrote:
> Hi Sakari
>    sorry, I missed this one!

No problem.

> 
> On Tue, Mar 28, 2023 at 05:52:48PM +0300, Sakari Ailus wrote:
> > Document how rotation and orientation should be taken into account in
> > writing camera sensor drivers.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v1:
> >
> > Use speclial double quotes around functions to use non-proportional font for
> > them.
> >
> >  Documentation/driver-api/media/camera-sensor.rst      | 11 +++++++++++
> >  .../userspace-api/media/v4l/ext-ctrls-camera.rst      |  1 +
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > index c7d4891bd24e..2618a91b0d85 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -151,3 +151,14 @@ used to obtain device's power state after the power state transition:
> >  The function returns a non-zero value if it succeeded getting the power count or
> >  runtime PM was disabled, in either of which cases the driver may proceed to
> >  access the device.
> > +
> > +Rotation and orientation
> > +------------------------
> > +
> > +Some systems have been implemented so that the camera sensor has been mounted
> > +upside down compared to its natural mounting rotation. In such a case, the
> > +:ref:`V4L2_CID_CAMERA_SENSOR_ROTATION <v4l2-camera-sensor-rotation>` control
> > +shall indicate the mounting rotation.
> 
> I would put it in imperative form for driver developers
> 
> "Some systems have been implemented so that the camera sensor has been mounted
> upside down compared to its natural mounting rotation. In such a case,
> drivers should register the :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION
> <v4l2-camera-sensor-rotation>` control to report the information to
> userspace."

That is in conditional, suggesting it isn't mandatory. Is that what you
wanted to say?

> 
> I would also specify how drivers should initialize their flip controls
> 
> "Mode-based sensor driver implementations that have any vertical or
> horizontal flips embedded in the register programming sequences should
> initialize the V4L2_CID_HFLIP and V4L2_CID_VFLIP controls with the
> values programmed by the register sequences.

I'd use "shall" also here. I can't think of a reasonable exception as it
breaks how this is meant to work for user space.

> 
> Drivers which implement writable flip controls could automatically
> compensate for the sensor's mounting rotation and shall reflect that in
> the V4L2_CID_HFLIP and V4L2_CID_VFLIP controls initial and default values."

Good point. For existing drivers (such as CCS or IMX258) this could help
existing users but I'm not sure I'd do this for new drivers. Comments and
opinions would be welcome from others, too. Cc Laurent, too.

> 
> > +
> > +Use ``v4l2_fwnode_device_parse()`` to obtain this information and
> > +``v4l2_ctrl_new_fwnode_properties()`` to generate the appropriate controls.
> 
> I would also mention the orientation control before introducing
> v4l2_fwnode_device_parse.
> 
> "Sensor drivers should also report their mounting orientation with the
> :ref:`V4L2_CID_CAMERA_SENSOR_ORIENTATION <v4l2-camera-sensor-orientation>`.
> 
> Both controls can be registered by using the ``v4l2_fwnode_device_parse()``
> function to obtain this information from the firmware interface and
> ``v4l2_ctrl_new_fwnode_properties()`` to generate the appropriate controls."
> 
> How does this work for you ?

I'd just use "shall" here, too.

This applies of course to new drivers only, many existing ones are missing
these bits.

-- 
Kind regards,

Sakari Ailus
