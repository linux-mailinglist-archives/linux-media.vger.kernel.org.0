Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D82926D8CBB
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 03:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234086AbjDFBar (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 21:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbjDFBaq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 21:30:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6219198D
        for <linux-media@vger.kernel.org>; Wed,  5 Apr 2023 18:30:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp [118.241.147.243])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98917905;
        Thu,  6 Apr 2023 03:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680744642;
        bh=Km/eEWTaXj/T1155Gzc//e35P43u2YX2NoC53jy34RM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cP4v3YGnGVK1EVGKd8b9dNqtEaG1I435T0vWkNyeTIgisXpxZWq0rN74/gshkMmVJ
         b5aouP07vupgIItnUOACttV3p03QqJIQztpYnih1ksrPupyQF/4sSFOMwHKF9DXvjv
         JHJTeWaZA0PpphbL57eMr0vrPKxRCztKCMHjPauU=
Date:   Thu, 6 Apr 2023 04:30:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/1] Documentation: v4l: Document rotation and
 orientation for sensor drivers
Message-ID: <20230406013049.GI9915@pendragon.ideasonboard.com>
References: <20230405101646.1804044-1-sakari.ailus@linux.intel.com>
 <20230405130612.gqxmddu5qt56rfav@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230405130612.gqxmddu5qt56rfav@uno.localdomain>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, Apr 05, 2023 at 03:06:12PM +0200, Jacopo Mondi wrote:
> On Wed, Apr 05, 2023 at 01:16:46PM +0300, Sakari Ailus wrote:
> > Document how rotation and orientation should be taken into account in
> > writing camera sensor drivers.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v1:
> >
> > - Simplify language (Laurent's suggestion) and add note on flipping
> >   controls (Jacopo).
> >
> > - Improve the last paragraph, say this is about rotation and orientation.
> >
> >  Documentation/driver-api/media/camera-sensor.rst | 16 ++++++++++++++++
> >  .../userspace-api/media/v4l/ext-ctrls-camera.rst |  1 +
> >  2 files changed, 17 insertions(+)
> >
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > index c7d4891bd24e..61caa7901c51 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -151,3 +151,19 @@ used to obtain device's power state after the power state transition:
> >  The function returns a non-zero value if it succeeded getting the power count or
> >  runtime PM was disabled, in either of which cases the driver may proceed to
> >  access the device.
> > +
> > +Rotation and orientation
> > +------------------------
> > +
> > +Some systems have the camera sensor mounted upside down compared to its natural
> > +mounting rotation. In such cases, drivers shall expose the information to
> > +userspace with the :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION
> > +<v4l2-camera-sensor-rotation>` control.
> > +
> > +Sensor drivers that have any vertical or horizontal flips embedded in the
> > +register programming sequences shall initialize the V4L2_CID_HFLIP and
> > +V4L2_CID_VFLIP controls with the values programmed by the register sequences.
> > +

I would move this paragraph below the next one, to keep the two
paragraphs related to the rotation and orientation together. You may
also want to expand the section title to cover flipping, or add a new
flipping section (although it's related to rotation).

> Just a note about the paragraph about ORIENTATION I suggested on the
> previous version. If it was left out intentionally:

And didn't we discuss the fact that sensor drivers shouldn't flip the
image internally to compensate for the rotation, but instead expose this
to userspace ? That seems to be missing too.

> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> > +Use ``v4l2_fwnode_device_parse()`` to obtain rotation and orientation
> > +information from system firmware and ``v4l2_ctrl_new_fwnode_properties()`` to
> > +register the appropriate controls.
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > index daa4f40869f8..29fe22da52a2 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > @@ -536,6 +536,7 @@ enum v4l2_scene_mode -
> >        - The camera is not directly attached to the device and is freely movable.
> >
> >
> > +.. _v4l2-camera-sensor-rotation:
> >
> >  ``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
> >      This read-only control describes the rotation correction in degrees in the

-- 
Regards,

Laurent Pinchart
