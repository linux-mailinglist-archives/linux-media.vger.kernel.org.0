Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7817B6D8CD1
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 03:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233074AbjDFBiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 21:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbjDFBiB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 21:38:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A375B83
        for <linux-media@vger.kernel.org>; Wed,  5 Apr 2023 18:38:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp [118.241.147.243])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C728905;
        Thu,  6 Apr 2023 03:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680745079;
        bh=vARwnMR0Y3RTk/V9AydZRLBqI74z6CD5WAMa8rz3elo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HiY8c5oSLTpo8CVii852Iv0nikU5Jo5Sbxw3LxPt3CgiGBTJewCj48LGk9CidygB0
         m2OyzwxX1eyX4gSHKOUznK/PHwSz2nfk0Kwby6yngkB6vu8PY7bgqMpk/blrRSGtT/
         ETq5sKZlB3VILNsSx6iI2oHg56RLibwc47ps8Tag=
Date:   Thu, 6 Apr 2023 04:38:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v4 1/1] Documentation: v4l: Document rotation and
 orientation for sensor drivers
Message-ID: <20230406013807.GM9915@pendragon.ideasonboard.com>
References: <20230405172720.1842738-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230405172720.1842738-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Apr 05, 2023 at 08:27:20PM +0300, Sakari Ailus wrote:
> Document how rotation and orientation should be taken into account in
> writing camera sensor drivers.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v3:
> 
> - Add a missing paragraph on the ORIENTATION control. Use shall.
> 
>  .../driver-api/media/camera-sensor.rst        | 19 +++++++++++++++++++
>  .../media/v4l/ext-ctrls-camera.rst            |  3 +++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index c7d4891bd24e..ad9accb3fd40 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -151,3 +151,22 @@ used to obtain device's power state after the power state transition:
>  The function returns a non-zero value if it succeeded getting the power count or
>  runtime PM was disabled, in either of which cases the driver may proceed to
>  access the device.
> +
> +Rotation and orientation
> +------------------------
> +
> +Some systems have the camera sensor mounted upside down compared to its natural
> +mounting rotation. In such cases, drivers shall expose the information to
> +userspace with the :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION
> +<v4l2-camera-sensor-rotation>` control.
> +
> +Sensor drivers that have any vertical or horizontal flips embedded in the
> +register programming sequences shall initialize the V4L2_CID_HFLIP and
> +V4L2_CID_VFLIP controls with the values programmed by the register sequences.

This feels out of place, as it covers flipping in the "Rotation and
orientation" section, and sits between paragraphs related to rotation
and orientation. I understand this paragraph relates to drivers enabling
180° rotation through h/v flip, but that's not clear enough.

> +
> +Sensor drivers shall also report the sensor's mounting orientation with the
> +:ref:`V4L2_CID_CAMERA_SENSOR_ORIENTATION <v4l2-camera-sensor-orientation>`.
> +
> +Use ``v4l2_fwnode_device_parse()`` to obtain rotation and orientation
> +information from system firmware and ``v4l2_ctrl_new_fwnode_properties()`` to
> +register the appropriate controls.
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index daa4f40869f8..cdc515c60468 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -506,6 +506,8 @@ enum v4l2_scene_mode -
>      value down. A value of zero stops the motion if one is in progress
>      and has no effect otherwise.
>  
> +.. _v4l2-camera-sensor-orientation:
> +
>  ``V4L2_CID_CAMERA_ORIENTATION (menu)``
>      This read-only control describes the camera orientation by reporting its
>      mounting position on the device where the camera is installed. The control
> @@ -536,6 +538,7 @@ enum v4l2_scene_mode -
>        - The camera is not directly attached to the device and is freely movable.
>  
>  
> +.. _v4l2-camera-sensor-rotation:
>  
>  ``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
>      This read-only control describes the rotation correction in degrees in the

-- 
Regards,

Laurent Pinchart
