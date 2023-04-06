Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C0C6D9706
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 14:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237704AbjDFMaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 08:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235234AbjDFMaT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 08:30:19 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4063740C6
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 05:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680784218; x=1712320218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nNsnYCMdE7cc/tws7zB2UnwcXTFvDRQhhIPYrocnz98=;
  b=UxiTZ7YZ1jkWLdeH+cTCuBoVKkFWxchi8A6oWzU+f+MJ5DRa7NXx1Xj9
   sRKxFQ8bc+Gt6h8oXdoZGPkVgyWyYSY9E7ocgJ702F3agezbKAipCl4fy
   zm+UAfbSWRwBvO88u0rUq60ILD6P8XIDKUqP3oLKPkIPx2BkSwAbooiaN
   1Fv/nur0RO7V3zdOJjEr/WySlGaEovOoOwg3ayWBH1YpT0v2TJGJUrghT
   nIkEwTradXs9khx1hslsx/Frj+51WjPalLTbHOztzzKVZ+jDsaTEh3mzi
   iQ8DEGTtFBFVXPKmTQg45tH0jOCqF9SRkVX0ayZyeeawDPmJ+uOU0BMF8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="344456070"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="344456070"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 05:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="637261740"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="637261740"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 05:30:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id CE5DB121387;
        Thu,  6 Apr 2023 15:30:13 +0300 (EEST)
Date:   Thu, 6 Apr 2023 15:30:13 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/1] Documentation: v4l: Document rotation and
 orientation for sensor drivers
Message-ID: <ZC67VSwmiUiRDVAB@kekkonen.localdomain>
References: <20230405101646.1804044-1-sakari.ailus@linux.intel.com>
 <20230405130612.gqxmddu5qt56rfav@uno.localdomain>
 <20230406013049.GI9915@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406013049.GI9915@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Apr 06, 2023 at 04:30:49AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> On Wed, Apr 05, 2023 at 03:06:12PM +0200, Jacopo Mondi wrote:
> > On Wed, Apr 05, 2023 at 01:16:46PM +0300, Sakari Ailus wrote:
> > > Document how rotation and orientation should be taken into account in
> > > writing camera sensor drivers.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > since v1:
> > >
> > > - Simplify language (Laurent's suggestion) and add note on flipping
> > >   controls (Jacopo).
> > >
> > > - Improve the last paragraph, say this is about rotation and orientation.
> > >
> > >  Documentation/driver-api/media/camera-sensor.rst | 16 ++++++++++++++++
> > >  .../userspace-api/media/v4l/ext-ctrls-camera.rst |  1 +
> > >  2 files changed, 17 insertions(+)
> > >
> > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > index c7d4891bd24e..61caa7901c51 100644
> > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > @@ -151,3 +151,19 @@ used to obtain device's power state after the power state transition:
> > >  The function returns a non-zero value if it succeeded getting the power count or
> > >  runtime PM was disabled, in either of which cases the driver may proceed to
> > >  access the device.
> > > +
> > > +Rotation and orientation
> > > +------------------------
> > > +
> > > +Some systems have the camera sensor mounted upside down compared to its natural
> > > +mounting rotation. In such cases, drivers shall expose the information to
> > > +userspace with the :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION
> > > +<v4l2-camera-sensor-rotation>` control.
> > > +
> > > +Sensor drivers that have any vertical or horizontal flips embedded in the
> > > +register programming sequences shall initialize the V4L2_CID_HFLIP and
> > > +V4L2_CID_VFLIP controls with the values programmed by the register sequences.
> > > +
> 
> I would move this paragraph below the next one, to keep the two
> paragraphs related to the rotation and orientation together. You may
> also want to expand the section title to cover flipping, or add a new
> flipping section (although it's related to rotation).
> 
> > Just a note about the paragraph about ORIENTATION I suggested on the
> > previous version. If it was left out intentionally:
> 
> And didn't we discuss the fact that sensor drivers shouldn't flip the
> image internally to compensate for the rotation, but instead expose this
> to userspace ? That seems to be missing too.

I'll try to address these in v5.

> 
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > 
> > > +Use ``v4l2_fwnode_device_parse()`` to obtain rotation and orientation
> > > +information from system firmware and ``v4l2_ctrl_new_fwnode_properties()`` to
> > > +register the appropriate controls.
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > index daa4f40869f8..29fe22da52a2 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > @@ -536,6 +536,7 @@ enum v4l2_scene_mode -
> > >        - The camera is not directly attached to the device and is freely movable.
> > >
> > >
> > > +.. _v4l2-camera-sensor-rotation:
> > >
> > >  ``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
> > >      This read-only control describes the rotation correction in degrees in the

-- 
Regards,

Sakari Ailus
