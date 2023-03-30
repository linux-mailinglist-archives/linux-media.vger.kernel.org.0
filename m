Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6056D0B03
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 18:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbjC3Q1d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 12:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjC3Q1c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 12:27:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CFABBB3
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 09:27:30 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A14976E1;
        Thu, 30 Mar 2023 18:27:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680193648;
        bh=1H0/Rsm2TnDwX+QGfUummj1ND+yaVraWmAf7M0rQb5k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DCufdDamh21YoF3PkHtVPNHOupScV50Fm8/Hng8XWVzY9lez6ljDtCv9WvNjRCpQJ
         LLruQ9k/ptylW+UO01ABX1GxlhXkpF7JmLVgQUmEwVX0n4Cwd8RJRcKxaLZ61HvyFy
         9zmwZO6XKe+N8DynwRCkwc9B1+JHIdcgrx7GFUWE=
Date:   Thu, 30 Mar 2023 18:27:25 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 1/1] Documentation: v4l: Document rotation and
 orientation for sensor drivers
Message-ID: <20230330162725.5jubjq2muh6ztfhd@uno.localdomain>
References: <20230328145248.1489994-1-sakari.ailus@linux.intel.com>
 <20230329182106.xi2k5diul3jixq3z@uno.localdomain>
 <ZCVNR+nMpUoNuVnX@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZCVNR+nMpUoNuVnX@kekkonen.localdomain>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

On Thu, Mar 30, 2023 at 11:50:15AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Wed, Mar 29, 2023 at 08:21:06PM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >    sorry, I missed this one!
>
> No problem.
>
> >
> > On Tue, Mar 28, 2023 at 05:52:48PM +0300, Sakari Ailus wrote:
> > > Document how rotation and orientation should be taken into account in
> > > writing camera sensor drivers.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > since v1:
> > >
> > > Use speclial double quotes around functions to use non-proportional font for
> > > them.
> > >
> > >  Documentation/driver-api/media/camera-sensor.rst      | 11 +++++++++++
> > >  .../userspace-api/media/v4l/ext-ctrls-camera.rst      |  1 +
> > >  2 files changed, 12 insertions(+)
> > >
> > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > index c7d4891bd24e..2618a91b0d85 100644
> > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > @@ -151,3 +151,14 @@ used to obtain device's power state after the power state transition:
> > >  The function returns a non-zero value if it succeeded getting the power count or
> > >  runtime PM was disabled, in either of which cases the driver may proceed to
> > >  access the device.
> > > +
> > > +Rotation and orientation
> > > +------------------------
> > > +
> > > +Some systems have been implemented so that the camera sensor has been mounted
> > > +upside down compared to its natural mounting rotation. In such a case, the
> > > +:ref:`V4L2_CID_CAMERA_SENSOR_ROTATION <v4l2-camera-sensor-rotation>` control
> > > +shall indicate the mounting rotation.
> >
> > I would put it in imperative form for driver developers
> >
> > "Some systems have been implemented so that the camera sensor has been mounted
> > upside down compared to its natural mounting rotation. In such a case,
> > drivers should register the :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION
> > <v4l2-camera-sensor-rotation>` control to report the information to
> > userspace."
>
> That is in conditional, suggesting it isn't mandatory. Is that what you
> wanted to say?
>

"drivers shall register..." ?

> >
> > I would also specify how drivers should initialize their flip controls
> >
> > "Mode-based sensor driver implementations that have any vertical or
> > horizontal flips embedded in the register programming sequences should
> > initialize the V4L2_CID_HFLIP and V4L2_CID_VFLIP controls with the
> > values programmed by the register sequences.
>
> I'd use "shall" also here. I can't think of a reasonable exception as it
> breaks how this is meant to work for user space.
>

Yes, I agree

> >
> > Drivers which implement writable flip controls could automatically
> > compensate for the sensor's mounting rotation and shall reflect that in
> > the V4L2_CID_HFLIP and V4L2_CID_VFLIP controls initial and default values."
>
> Good point. For existing drivers (such as CCS or IMX258) this could help
> existing users but I'm not sure I'd do this for new drivers. Comments and
> opinions would be welcome from others, too. Cc Laurent, too.
>
> >
> > > +
> > > +Use ``v4l2_fwnode_device_parse()`` to obtain this information and
> > > +``v4l2_ctrl_new_fwnode_properties()`` to generate the appropriate controls.
> >
> > I would also mention the orientation control before introducing
> > v4l2_fwnode_device_parse.
> >
> > "Sensor drivers should also report their mounting orientation with the
> > :ref:`V4L2_CID_CAMERA_SENSOR_ORIENTATION <v4l2-camera-sensor-orientation>`.
> >
> > Both controls can be registered by using the ``v4l2_fwnode_device_parse()``
> > function to obtain this information from the firmware interface and
> > ``v4l2_ctrl_new_fwnode_properties()`` to generate the appropriate controls."
> >
> > How does this work for you ?
>
> I'd just use "shall" here, too.
>

Agree on this as well

> This applies of course to new drivers only, many existing ones are missing
> these bits.
>

I know :( It's however worth it to encourage new drivers to do that!

> --
> Kind regards,
>
> Sakari Ailus
