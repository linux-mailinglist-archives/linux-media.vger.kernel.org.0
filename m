Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 659D66D7D58
	for <lists+linux-media@lfdr.de>; Wed,  5 Apr 2023 15:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238125AbjDENGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 09:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237126AbjDENGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 09:06:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC237EA
        for <linux-media@vger.kernel.org>; Wed,  5 Apr 2023 06:06:17 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1D3114C0;
        Wed,  5 Apr 2023 15:06:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680699975;
        bh=OoClEUJcOHI5Pp/Q6w0rCz0K1yX2giKUn5/rIi6H648=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W4QOrFWi9m5j/dqzQMMM3GERmwo6l7uDoCYFv0Vn39LxakEw/2gdR+tPwUJJq9OAi
         2k8Sfr3x2J6+43OQuhL2YsPcMBDPiXcsK6+mQP8q8tTz8M7IXfem31bOZsZpvGM8GJ
         tJX7cdgMvE9TVDnVIvlC+j6Iam/LFsVOFjiUKgyw=
Date:   Wed, 5 Apr 2023 15:06:12 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 1/1] Documentation: v4l: Document rotation and
 orientation for sensor drivers
Message-ID: <20230405130612.gqxmddu5qt56rfav@uno.localdomain>
References: <20230405101646.1804044-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230405101646.1804044-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Wed, Apr 05, 2023 at 01:16:46PM +0300, Sakari Ailus wrote:
> Document how rotation and orientation should be taken into account in
> writing camera sensor drivers.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
>
> - Simplify language (Laurent's suggestion) and add note on flipping
>   controls (Jacopo).
>
> - Improve the last paragraph, say this is about rotation and orientation.
>
>  Documentation/driver-api/media/camera-sensor.rst | 16 ++++++++++++++++
>  .../userspace-api/media/v4l/ext-ctrls-camera.rst |  1 +
>  2 files changed, 17 insertions(+)
>
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index c7d4891bd24e..61caa7901c51 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -151,3 +151,19 @@ used to obtain device's power state after the power state transition:
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
> +

Just a note about the paragraph about ORIENTATION I suggested on the
previous version. If it was left out intentionally:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> +Use ``v4l2_fwnode_device_parse()`` to obtain rotation and orientation
> +information from system firmware and ``v4l2_ctrl_new_fwnode_properties()`` to
> +register the appropriate controls.
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
