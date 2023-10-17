Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF08B7CC209
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 13:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234635AbjJQLwS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 07:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233761AbjJQLwR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 07:52:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33F3B0
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 04:52:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76DD8E4;
        Tue, 17 Oct 2023 13:52:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697543527;
        bh=D1p579MtML/v6OVr1FWv5CGJkrjI1/kTypTwVvEH7w8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H69orSK7e6d/ylgFXVNmIxeNCRxnUD0hG2U4dtRd1f6wf+PuZ2WK5n5m1UOaLCo3n
         zmXXcjywAbwj0gUH40Y2I4GUndi1FOMA754Io4G7hdswqfGu/U3Q/sMU09oOkafNQ0
         aMHTWsxqed+QhXb6NWAjjgxUP6jb50H/m6YV6e3Q=
Date:   Tue, 17 Oct 2023 14:52:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 1/3] media: Documentation: Document how link
 frequencies can be chosen
Message-ID: <20231017115221.GC10076@pendragon.ideasonboard.com>
References: <20231017105630.558089-1-sakari.ailus@linux.intel.com>
 <20231017105630.558089-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231017105630.558089-2-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, Oct 17, 2023 at 01:56:28PM +0300, Sakari Ailus wrote:
> Document how link frequencies can be selected for the link-frequencies
> property.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/camera-sensor.rst   | 14 ++++++++++++++
>  .../userspace-api/media/drivers/camera-sensor.rst  |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index 6456145f96ed..0de5c86cbd1f 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -29,6 +29,20 @@ used in the system. Using another frequency may cause harmful effects
>  elsewhere. Therefore only the pre-determined frequencies are configurable by the
>  user.
>  
> +On choosing link frequencies
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Choosing link frequencies for a board is generally a part of the hardware design
> +process as one needs to ensure an EMC-safe frequency the sensor supports with
> +the given external clock frequency exists.

This is a bit hard to parse. I would write

Choosing link frequencies for a board is generally a part of the hardware design
process as one needs to select EMC-safe frequencies that the sensor supports with
the given external clock frequency.

> On development systems this may be
> +less than an immediate concern, so more or less anything that sensor and the
> +rest of the applicable hardware supports can be used.

True, but it still doesn't say what to pick :-)

Q: What link frequency do I put in DT for a development board?
A: Any frequency will do.
Q: 1Hz?
A: No, it has to be supported by the sensor
Q: How do I figure that out?
A: ...

And once the range (or list) of frequencies the driver supports (for a
given input clock frequency) will be known, the selection process is
still not totally straightforward, as it will have implications on what
resolutions and frame rates the sensor will be able to output. This is
complicated even further if the sensor can support different number of
data lanes.

> +
> +If the sensor's PLL tree is not documented and all that is available are
> +register lists, even knowing the frequency a driver uses may be difficult. This
> +could still be :ref:`calculated from the number of lanes, sensor's output image
> +size, blanking values and frame rate <media_camera_raw_frame_interval>`.
> +
>  ACPI
>  ~~~~
>  
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 919a50e8b9d9..e0596b85e7ec 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -44,6 +44,8 @@ There are two different methods for obtaining possibilities for different frame
>  intervals as well as configuring the frame interval. Which one to implement
>  depends on the type of the device.
>  
> +.. _media_camera_raw_frame_interval:
> +
>  Raw camera sensors
>  ~~~~~~~~~~~~~~~~~~
>  

-- 
Regards,

Laurent Pinchart
