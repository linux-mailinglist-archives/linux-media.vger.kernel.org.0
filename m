Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4CB1C5A3F
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 16:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbgEEO6n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 10:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729289AbgEEO6m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 10:58:42 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C396FC061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=dJ7YPxbG/35TsFosSCkDdIiJQ2l+1QDAnondLu+lvRA=; b=cGKUcs6ttWG13oWo07vW6bUV5B
        uN5JdpPO5QdY7jLp6VhIUL9du7JcesGMPa5E4AoNMpGPjw1rK4NO4Gk3yPbK7P1k/u4zci/ezzat9
        jNoayE1THObRo1+85lLWOlsWx7Gk2O+IwAxJ6TuPQWPTcfE7Zz/TvBjn3xfXi0lIFB052ir3ps2ea
        PeF1Y+tM2/LAj+QNrqiZCi4Vgvc+Xd2FSjbAQhmY54JobPZG2AwISGYcagHkEGuZwpf3JYeaDI74q
        vHY1QMpQhvxSsOeZcbUeCPjYI/r6OegyABOuegcNx2Eg6cNlZPEQYaOv/DaAAXo6AD3hHLZQ2yRNx
        CnIFsI3w==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jVz1j-0007KT-HA; Tue, 05 May 2020 14:58:31 +0000
Date:   Tue, 5 May 2020 16:58:26 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH v9 02/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_LOCATION
Message-ID: <20200505165826.1ce8bb0d@coco.lan>
In-Reply-To: <a5d77790-5f98-650e-cfb9-a97b8701454d@xs4all.nl>
References: <20200417124110.72313-1-jacopo@jmondi.org>
        <20200417124110.72313-3-jacopo@jmondi.org>
        <20200505140206.589f54ae@coco.lan>
        <a5d77790-5f98-650e-cfb9-a97b8701454d@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 5 May 2020 14:21:38 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> On 05/05/2020 14:02, Mauro Carvalho Chehab wrote:
> > Em Fri, 17 Apr 2020 14:41:01 +0200
> > Jacopo Mondi <jacopo@jmondi.org> escreveu:
> >   
> >> Add documentation for the V4L2_CID_CAMERA_SENSOR_LOCATION camera
> >> control. The newly added read-only control reports the camera device
> >> mounting position.
> >>
> >> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >> ---
> >>  .../media/v4l/ext-ctrls-camera.rst            | 32 +++++++++++++++++++
> >>  1 file changed, 32 insertions(+)
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> >> index e39f84d2447f..01a9042d53a6 100644
> >> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> >> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> >> @@ -510,6 +510,38 @@ enum v4l2_scene_mode -
> >>      value down. A value of zero stops the motion if one is in progress
> >>      and has no effect otherwise.
> >>  
> >> +``V4L2_CID_CAMERA_SENSOR_LOCATION (integer)``
> >> +    This read-only control describes the camera sensor location by reporting
> >> +    its mounting position on the device where the camera is installed. The
> >> +    control value is constant and not modifiable by software. This control is
> >> +    particularly meaningful for devices which have a well defined orientation,
> >> +    such as phones, laptops and portable devices since the camera location is
> >> +    expressed as a position relative to the device's intended usage orientation.
> >> +    For example, a camera sensor installed on the user-facing side of a phone,
> >> +    a tablet or a laptop device is said to be installed in the
> >> +    ``V4L2_LOCATION_FRONT`` location while camera sensors installed on the side
> >> +    opposite the front one are said to be installed in the
> >> +    ``V4L2_LOCATION_BACK`` location. Camera sensors not directly attached to
> >> +    the device or attached in a way that allows them to move freely, such as
> >> +    webcams and digital cameras, are said to have the ``V4L2_LOCATION_EXTERNAL``
> >> +    location.
> >> +
> >> +
> >> +
> >> +.. flat-table::
> >> +    :header-rows:  0
> >> +    :stub-columns: 0
> >> +
> >> +    * - ``  
> > ``  
> >> +      - The camera sensor is located on the front side of the device.
> >> +    * - ``V4L2_LOCATION_BACK``
> >> +      - The camera sensor is located on the back side of the device.
> >> +    * - ``V4L2_LOCATION_EXTERNAL``
> >> +      - The camera sensor is not directly attached to the device and is
> >> +        freely movable.  
> > 
> > I guess I mentioned this already, but IMHO this ioctl is somewhat flawed,
> > for two reasons:
> > 
> > 1) newer devices may all top of the line mobile devices now are coming
> >    with multiple camera sensors at the same side. So, just saying that
> >    the location is front or back is not enough. A location syscall would
> >    need have something more to better identify the location.
> >    It probably doesn't need to be something fancy, but, at least, on a
> >    device with 3 back sensors, I would call them as:
> > 
> > 	V4L2_LOCATION_BACK_1
> > 	V4L2_LOCATION_BACK_2
> > 	V4L2_LOCATION_BACK_3
> > 
> >    And add some comment at the control documentation that would allow to
> >    uniquely number the other ones, like:
> > 
> > 	"when multiple sensors are present at the same side, sensors
> > 	 will be numbered considering the ``(x,y)`` coordinates of the center
> > 	 of each sensor, starting from the topmost, leftmost position.
> > 
> > 	 She first sensor will be the topmost sensor column at the leftmost
> > 	 side. The other sensors that will have the same ``y`` coordinate,
> > 	 counting from the left to the right, then increment the ``y`` and
> > 	 parse the next column again until all sensors are numbered."  
> 
> I think this isn't a good idea. In most cases you do not care about this.

True, because on most cases, the userspace is hardcoded to open, let's say,
video0 for the front sensor or video1 for the back sensor.

This control only makes sense if the userspace is generic enough to accept
sensors on different positions, identifying them at runtime.

With the current proposal, userspace can only work with 2 sensors, as, if
there's a third sensor, userspace won't know how to pick the right one.

For instance, let's assume a car with 4 sensors, one on each side of
the car (right, front); (left, front); (right; back); (left; back).

With the current proposal, userspace can't do anything if it wants
to identify the (right, back) camera.

> And if you do care about this, then wouldn't it be better to do that through
> a new control where you provide the precise coordinates in e.g. mm?
> 
> BACK_1/2/3 really doesn't tell you anything other than that there are three
> sensors on the back, but we knew that already.

No, if we define some criteria about how sensors should be accounted for
(something similar to the text I drafted), the location will be defined.

With the above text, for example, a device with 3 sensors horizontally
aligned, the arrangement will be:

- sensor 1 is on the left;
- sensor 2 in the middle;
- sensor 3 is on the right.

Ok, I agree that writing a text with such criteria sucks, and maybe
just numbering from 1 to n may not be the best thing to do. Yet,
adding coordinates in mm would be just too much information, IMHO.

> If we need support for the precise location in the future, then let's do that
> right and not try to shoehorn into something that wasn't meant for it.

Assuming that all the problems we have so far are to support devices with
2 sensors, by the time we add support for a third sensor, we'll end having
a new ioctl for the same thing: to specify the sensors locations.

We know the drill: having two controls for the same thing makes userspace
more complex and will require backward-compatibility code at the kernel
and at userspace. That's what I want to avoid.

I'm open to other suggestions that won't limit the usage of this control
for devices with just (up to) two sensors.

> 
> > 
> > 2) There are also some devices that has a movable sensor, that can either
> >    be taking a picture from the front or from the back, like those:
> > 
> > 	https://www.youtube.com/watch?v=br6G7MrkRUc
> > 
> >    On such case, the control should not be read-only, as one may need to
> >    change this control in order to select if a sensor would either be on
> >    FRONT or on BACK position.
> > 
> >    For such kind of sensors (when we start supporting them), we could 
> >    for example call them like:
> > 
> > 	V4L2_LOCATION_MOVABLE_IN_BACK_POSITION_1
> > 	V4L2_LOCATION_MOVABLE_IN_BACK_POSITION_2
> > 	V4L2_LOCATION_MOVABLE_IN_FRONT_POSITION_1
> > 	V4L2_LOCATION_MOVABLE_IN_FRONT_POSITION_2  
> 
> I don't like this. If the driver can tell when the position changes, then it
> can update the control's value (it's still read-only because userspace
> can't write to it, but that doesn't mean it can't be updated).

Why userspace can't set it? I mean, if the camera is movable, it
should be up to the application to select the sensor between FRONT
and BACK.

Btw, this is a case where I clearly see value on this ioctl: all cameras
with flippable sensors need a control to switch the sensor's position,
even if the sensor device is hardcoded on some application.

> So there is
> no need to call it 'MOVABLE', you just report the correct location. And with
> QUERYMENU you can tell that it is movable since multiple possible locations
> are reported (BACK and FRONT in this example). If it is fixed, then QUERYMENU
> will report only a single location.
> 
> This might have some consequences for the DT bindings, though. Not sure
> how to represent this there.

I guess DT should contain the default value when the device is turned
off. 

> If the driver cannot tell what the position is, then it makes no sense for
> the driver to expose this location control since it clearly is something that
> has to be hardcoded in userspace. I.e., there is no point for userspace to
> write to the control and then read back what it wrote :-)

Actually there is. When you command a device to switch position, it may
take some time to move the sensor, and such operation may even fail.

So, reading back the position is probably mandatory.

That reminds that it may actually have a third position, to warn
that the sensor was blocked.

Also, some flip sensors may have another position (a "closed"
position).

> So I disagree that there is a need for FIXED vs MOVABLE, this can be
> represented nicely with the current proposal.

Thanks,
Mauro
