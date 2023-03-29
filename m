Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB17C6CF20F
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 20:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjC2SVN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 14:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjC2SVM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 14:21:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F3A49D5
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 11:21:11 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03FB74D5;
        Wed, 29 Mar 2023 20:21:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680114069;
        bh=XtgHUhNQsxzRDRc1Z0rtLtQyf1/g1GYSnuqSTm7eTVg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hkLSzILwNLi+2N2ZXyFM7dykqKDtXEu1Eatx6EqYnj0RHNif4TU26L87DZarG/LOi
         yJJCWncGSF6xmRYtNR+Ul6v2N4wugyv0SgT+evZzq35/eRFjEpbq+OI6H7GfsvX47X
         ILj2R416LU1CoTzmrxE+nMH667z3CEHKVCq0axy4=
Date:   Wed, 29 Mar 2023 20:21:06 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v2 1/1] Documentation: v4l: Document rotation and
 orientation for sensor drivers
Message-ID: <20230329182106.xi2k5diul3jixq3z@uno.localdomain>
References: <20230328145248.1489994-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230328145248.1489994-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari
   sorry, I missed this one!

On Tue, Mar 28, 2023 at 05:52:48PM +0300, Sakari Ailus wrote:
> Document how rotation and orientation should be taken into account in
> writing camera sensor drivers.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
>
> Use speclial double quotes around functions to use non-proportional font for
> them.
>
>  Documentation/driver-api/media/camera-sensor.rst      | 11 +++++++++++
>  .../userspace-api/media/v4l/ext-ctrls-camera.rst      |  1 +
>  2 files changed, 12 insertions(+)
>
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index c7d4891bd24e..2618a91b0d85 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -151,3 +151,14 @@ used to obtain device's power state after the power state transition:
>  The function returns a non-zero value if it succeeded getting the power count or
>  runtime PM was disabled, in either of which cases the driver may proceed to
>  access the device.
> +
> +Rotation and orientation
> +------------------------
> +
> +Some systems have been implemented so that the camera sensor has been mounted
> +upside down compared to its natural mounting rotation. In such a case, the
> +:ref:`V4L2_CID_CAMERA_SENSOR_ROTATION <v4l2-camera-sensor-rotation>` control
> +shall indicate the mounting rotation.

I would put it in imperative form for driver developers

"Some systems have been implemented so that the camera sensor has been mounted
upside down compared to its natural mounting rotation. In such a case,
drivers should register the :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION
<v4l2-camera-sensor-rotation>` control to report the information to
userspace."

I would also specify how drivers should initialize their flip controls

"Mode-based sensor driver implementations that have any vertical or
horizontal flips embedded in the register programming sequences should
initialize the V4L2_CID_HFLIP and V4L2_CID_VFLIP controls with the
values programmed by the register sequences.

Drivers which implement writable flip controls could automatically
compensate for the sensor's mounting rotation and shall reflect that in
the V4L2_CID_HFLIP and V4L2_CID_VFLIP controls initial and default values."

> +
> +Use ``v4l2_fwnode_device_parse()`` to obtain this information and
> +``v4l2_ctrl_new_fwnode_properties()`` to generate the appropriate controls.

I would also mention the orientation control before introducing
v4l2_fwnode_device_parse.

"Sensor drivers should also report their mounting orientation with the
:ref:`V4L2_CID_CAMERA_SENSOR_ORIENTATION <v4l2-camera-sensor-orientation>`.

Both controls can be registered by using the ``v4l2_fwnode_device_parse()``
function to obtain this information from the firmware interface and
``v4l2_ctrl_new_fwnode_properties()`` to generate the appropriate controls."

How does this work for you ?


> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index daa4f40869f8..29fe22da52a2 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -536,6 +536,7 @@ enum v4l2_scene_mode -
>        - The camera is not directly attached to the device and is freely movable.
>
>
> +.. _v4l2-camera-sensor-rotation:
>
>  ``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
>      This read-only control describes the rotation correction in degrees in the
> --
> 2.30.2
>
