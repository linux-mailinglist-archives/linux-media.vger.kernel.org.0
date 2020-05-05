Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD6D1C54FD
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 14:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbgEEMCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 08:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728497AbgEEMCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 08:02:24 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FEFC061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 05:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=2B9EF7ZG6VLHghS2dcFJsnZMeN5hh2i7ksYJc+3yuLo=; b=cgIFq+/faqY7SWT5B1hvhRV0/Z
        rY0ZZWwacq+tOQdMpWH5K6Fbd5TqhFiI9GU7x6itjRc+g3zA1EVbnAsICYWdS+McKJpUQxUgq8WNM
        CIre+30w2EaDcvCkPYccWHN+BbuJFgauAVod+Y3MjbcvdB5qwt3dWMPH/o8SqK8j2GkAmpS2l7Vdv
        4Coh7ZLZiY2Cx+dPDBs9bIfoSKosZWxa828zskLcvUp00E0N+RLJnERWpfn5KY2dT2sg+3MwDK3xV
        FeOpJjQ81DeSqX3fHpFPBlECYUMyDD6ns0EwC1UEGaZtywNqdu/vEW+uTpgxnkZ3ntcYvKKeMBAyF
        qQHMJXwQ==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jVwH6-0007oX-QN; Tue, 05 May 2020 12:02:13 +0000
Date:   Tue, 5 May 2020 14:02:06 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE 
        (V4L/DVB)), libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH v9 02/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_LOCATION
Message-ID: <20200505140206.589f54ae@coco.lan>
In-Reply-To: <20200417124110.72313-3-jacopo@jmondi.org>
References: <20200417124110.72313-1-jacopo@jmondi.org>
        <20200417124110.72313-3-jacopo@jmondi.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 17 Apr 2020 14:41:01 +0200
Jacopo Mondi <jacopo@jmondi.org> escreveu:

> Add documentation for the V4L2_CID_CAMERA_SENSOR_LOCATION camera
> control. The newly added read-only control reports the camera device
> mounting position.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../media/v4l/ext-ctrls-camera.rst            | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index e39f84d2447f..01a9042d53a6 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -510,6 +510,38 @@ enum v4l2_scene_mode -
>      value down. A value of zero stops the motion if one is in progress
>      and has no effect otherwise.
>  
> +``V4L2_CID_CAMERA_SENSOR_LOCATION (integer)``
> +    This read-only control describes the camera sensor location by reporting
> +    its mounting position on the device where the camera is installed. The
> +    control value is constant and not modifiable by software. This control is
> +    particularly meaningful for devices which have a well defined orientation,
> +    such as phones, laptops and portable devices since the camera location is
> +    expressed as a position relative to the device's intended usage orientation.
> +    For example, a camera sensor installed on the user-facing side of a phone,
> +    a tablet or a laptop device is said to be installed in the
> +    ``V4L2_LOCATION_FRONT`` location while camera sensors installed on the side
> +    opposite the front one are said to be installed in the
> +    ``V4L2_LOCATION_BACK`` location. Camera sensors not directly attached to
> +    the device or attached in a way that allows them to move freely, such as
> +    webcams and digital cameras, are said to have the ``V4L2_LOCATION_EXTERNAL``
> +    location.
> +
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``
``
> +      - The camera sensor is located on the front side of the device.
> +    * - ``V4L2_LOCATION_BACK``
> +      - The camera sensor is located on the back side of the device.
> +    * - ``V4L2_LOCATION_EXTERNAL``
> +      - The camera sensor is not directly attached to the device and is
> +        freely movable.

I guess I mentioned this already, but IMHO this ioctl is somewhat flawed,
for two reasons:

1) newer devices may all top of the line mobile devices now are coming
   with multiple camera sensors at the same side. So, just saying that
   the location is front or back is not enough. A location syscall would
   need have something more to better identify the location.
   It probably doesn't need to be something fancy, but, at least, on a
   device with 3 back sensors, I would call them as:

	V4L2_LOCATION_BACK_1
	V4L2_LOCATION_BACK_2
	V4L2_LOCATION_BACK_3

   And add some comment at the control documentation that would allow to
   uniquely number the other ones, like:

	"when multiple sensors are present at the same side, sensors
	 will be numbered considering the ``(x,y)`` coordinates of the center
	 of each sensor, starting from the topmost, leftmost position.

	 She first sensor will be the topmost sensor column at the leftmost
	 side. The other sensors that will have the same ``y`` coordinate,
	 counting from the left to the right, then increment the ``y`` and
	 parse the next column again until all sensors are numbered."

2) There are also some devices that has a movable sensor, that can either
   be taking a picture from the front or from the back, like those:

	https://www.youtube.com/watch?v=br6G7MrkRUc

   On such case, the control should not be read-only, as one may need to
   change this control in order to select if a sensor would either be on
   FRONT or on BACK position.

   For such kind of sensors (when we start supporting them), we could 
   for example call them like:

	V4L2_LOCATION_MOVABLE_IN_BACK_POSITION_1
	V4L2_LOCATION_MOVABLE_IN_BACK_POSITION_2
	V4L2_LOCATION_MOVABLE_IN_FRONT_POSITION_1
	V4L2_LOCATION_MOVABLE_IN_FRONT_POSITION_2

   And add rename the other definitions to:

	V4L2_LOCATION_FIXED_FRONT_1
	V4L2_LOCATION_FIXED_BACK_1

Ok, nobody has yet attempted to upstream code for such devices,
so, we, for now, we don't need to add more than those 3 types.

But, IMO, we would change the sensors description in a way that it
would be easier to add support for more than one sensor per location
in the future, like:

	* - ``V4L2_LOCATION_FIXED_FRONT_1``
          - The camera sensor is fixed, being the first sensor
	    located on the front side of the device.
	* - ``V4L2_LOCATION_FIXED_BACK_1``
	  - The camera sensor is fixed, being the first sensor
	    located on the back side of the device.
	* - ``V4L2_LOCATION_EXTERNAL``
          - The camera sensor is not directly attached to the device
	    and is freely movable.

	.. note:: Please submit a patch upstream if you need to have
		  more than one sensor either at front or back position.

This would make a lot easier when someone upstream patches requiring 
to locate more than one sensor location, or to support flipping
sensors.

Thanks,
Mauro
