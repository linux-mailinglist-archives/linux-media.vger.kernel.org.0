Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1101C6D1B
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 11:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729032AbgEFJjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 05:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728306AbgEFJja (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 05:39:30 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A205FC061A0F
        for <linux-media@vger.kernel.org>; Wed,  6 May 2020 02:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=YDrKAqf/aibq0Ju0nXvSzE5O8lbrElqg6pf9RUuQkwk=; b=cAaDvPHPlTCedycNoCl4x/dGDe
        rODCOx+jYXaVHSWJ0eKsBNWqRqNcaK8J1r3bLX1SGEVi6YrcRsZPSqXTTCDW2si4fdp10IMVKYLjP
        mM5hEyvYELs1URdtP8rUbqYgBDi7Gq1uKc7GLFtQYf2IK7Vl5aS28pdw0B2YKnpD1cJ/eSftr3gZK
        5VGMKcnmwG21PEAhcNLS1eKHDsA3mTn3tmORMPLFw4HrOCIIjEoHReopD8SLLJisDBTQ2zVdYHP7r
        mOuLEBqh55GfBaVX/zZWeWS5U8pY73pU6M0xvZeY0cPk5IFz1a3n5VYZeXKQKpKrzTchGLVePTM6a
        IlUqGWpA==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWGWH-0001BC-QN; Wed, 06 May 2020 09:39:14 +0000
Date:   Wed, 6 May 2020 11:39:09 +0200
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
Message-ID: <20200506113909.1489bd1e@coco.lan>
In-Reply-To: <b3e211da-b9f6-a65c-4453-c11b05bced45@xs4all.nl>
References: <20200417124110.72313-1-jacopo@jmondi.org>
        <20200417124110.72313-3-jacopo@jmondi.org>
        <20200505140206.589f54ae@coco.lan>
        <a5d77790-5f98-650e-cfb9-a97b8701454d@xs4all.nl>
        <20200505165826.1ce8bb0d@coco.lan>
        <b3e211da-b9f6-a65c-4453-c11b05bced45@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 6 May 2020 10:04:39 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> On 05/05/2020 16:58, Mauro Carvalho Chehab wrote:
> > Em Tue, 5 May 2020 14:21:38 +0200
> > Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:
> >   
> >> On 05/05/2020 14:02, Mauro Carvalho Chehab wrote:  
> >>> Em Fri, 17 Apr 2020 14:41:01 +0200
> >>> Jacopo Mondi <jacopo@jmondi.org> escreveu:
> >>>     
> >>>> Add documentation for the V4L2_CID_CAMERA_SENSOR_LOCATION camera
> >>>> control. The newly added read-only control reports the camera device
> >>>> mounting position.
> >>>>
> >>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>> ---
> >>>>  .../media/v4l/ext-ctrls-camera.rst            | 32 +++++++++++++++++++
> >>>>  1 file changed, 32 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> >>>> index e39f84d2447f..01a9042d53a6 100644
> >>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> >>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> >>>> @@ -510,6 +510,38 @@ enum v4l2_scene_mode -
> >>>>      value down. A value of zero stops the motion if one is in progress
> >>>>      and has no effect otherwise.
> >>>>  
> >>>> +``V4L2_CID_CAMERA_SENSOR_LOCATION (integer)``
> >>>> +    This read-only control describes the camera sensor location by reporting
> >>>> +    its mounting position on the device where the camera is installed. The
> >>>> +    control value is constant and not modifiable by software. This control is
> >>>> +    particularly meaningful for devices which have a well defined orientation,
> >>>> +    such as phones, laptops and portable devices since the camera location is
> >>>> +    expressed as a position relative to the device's intended usage orientation.
> >>>> +    For example, a camera sensor installed on the user-facing side of a phone,
> >>>> +    a tablet or a laptop device is said to be installed in the
> >>>> +    ``V4L2_LOCATION_FRONT`` location while camera sensors installed on the side
> >>>> +    opposite the front one are said to be installed in the
> >>>> +    ``V4L2_LOCATION_BACK`` location. Camera sensors not directly attached to
> >>>> +    the device or attached in a way that allows them to move freely, such as
> >>>> +    webcams and digital cameras, are said to have the ``V4L2_LOCATION_EXTERNAL``
> >>>> +    location.
> >>>> +
> >>>> +
> >>>> +
> >>>> +.. flat-table::
> >>>> +    :header-rows:  0
> >>>> +    :stub-columns: 0
> >>>> +
> >>>> +    * - ``    
> >>> ``    
> >>>> +      - The camera sensor is located on the front side of the device.
> >>>> +    * - ``V4L2_LOCATION_BACK``
> >>>> +      - The camera sensor is located on the back side of the device.
> >>>> +    * - ``V4L2_LOCATION_EXTERNAL``
> >>>> +      - The camera sensor is not directly attached to the device and is
> >>>> +        freely movable.    
> >>>
> >>> I guess I mentioned this already, but IMHO this ioctl is somewhat flawed,
> >>> for two reasons:
> >>>
> >>> 1) newer devices may all top of the line mobile devices now are coming
> >>>    with multiple camera sensors at the same side. So, just saying that
> >>>    the location is front or back is not enough. A location syscall would
> >>>    need have something more to better identify the location.
> >>>    It probably doesn't need to be something fancy, but, at least, on a
> >>>    device with 3 back sensors, I would call them as:
> >>>
> >>> 	V4L2_LOCATION_BACK_1
> >>> 	V4L2_LOCATION_BACK_2
> >>> 	V4L2_LOCATION_BACK_3
> >>>
> >>>    And add some comment at the control documentation that would allow to
> >>>    uniquely number the other ones, like:
> >>>
> >>> 	"when multiple sensors are present at the same side, sensors
> >>> 	 will be numbered considering the ``(x,y)`` coordinates of the center
> >>> 	 of each sensor, starting from the topmost, leftmost position.
> >>>
> >>> 	 She first sensor will be the topmost sensor column at the leftmost
> >>> 	 side. The other sensors that will have the same ``y`` coordinate,
> >>> 	 counting from the left to the right, then increment the ``y`` and
> >>> 	 parse the next column again until all sensors are numbered."    
> >>
> >> I think this isn't a good idea. In most cases you do not care about this.  
> > 
> > True, because on most cases, the userspace is hardcoded to open, let's say,
> > video0 for the front sensor or video1 for the back sensor.
> > 
> > This control only makes sense if the userspace is generic enough to accept
> > sensors on different positions, identifying them at runtime.
> > 
> > With the current proposal, userspace can only work with 2 sensors, as, if
> > there's a third sensor, userspace won't know how to pick the right one.
> > 
> > For instance, let's assume a car with 4 sensors, one on each side of
> > the car (right, front); (left, front); (right; back); (left; back).
> > 
> > With the current proposal, userspace can't do anything if it wants
> > to identify the (right, back) camera.
> >   
> >> And if you do care about this, then wouldn't it be better to do that through
> >> a new control where you provide the precise coordinates in e.g. mm?
> >>
> >> BACK_1/2/3 really doesn't tell you anything other than that there are three
> >> sensors on the back, but we knew that already.  
> > 
> > No, if we define some criteria about how sensors should be accounted for
> > (something similar to the text I drafted), the location will be defined.
> > 
> > With the above text, for example, a device with 3 sensors horizontally
> > aligned, the arrangement will be:
> > 
> > - sensor 1 is on the left;
> > - sensor 2 in the middle;
> > - sensor 3 is on the right.  
> 
> Or sensor 2 is below sensor 1 and sensor 3 is to the right of sensor 1.
> It's meaningless information. If you want to specify the location, then
> be precise. Especially for stereoscopic sensors (left and right) it is
> good to know the exact distance between the sensors. Just calling them
> '1' and '2' is not enough.
> 
> For sensors you want to know the plane (back/front) and where they are
> on that plane (in the case of more than one sensor). That's separate
> information that's only needed in the case of more than one sensor.
> 
> > 
> > Ok, I agree that writing a text with such criteria sucks, and maybe
> > just numbering from 1 to n may not be the best thing to do. Yet,
> > adding coordinates in mm would be just too much information, IMHO.  
> 
> Why? Just numbering them makes no sense, it's useless information.
> 
> >   
> >> If we need support for the precise location in the future, then let's do that
> >> right and not try to shoehorn into something that wasn't meant for it.  
> > 
> > Assuming that all the problems we have so far are to support devices with
> > 2 sensors, by the time we add support for a third sensor, we'll end having
> > a new ioctl for the same thing: to specify the sensors locations.  
> 
> It's just a control, nothing more.
> 
> In most cases all you need to know is if it is a front or back sensor. In
> some cases you need to know more: e.g. my Samsung Note 10+ has three sensors
> on the back in a vertical row (wide, telephoto, ultrawide), and two sensors
> for 3D to the right of them. For those last two you need to know the exact
> position relative to one another. For the other sensors all you need to know
> is that they are back sensors.
> 
> > 
> > We know the drill: having two controls for the same thing makes userspace
> > more complex and will require backward-compatibility code at the kernel
> > and at userspace. That's what I want to avoid.
> > 
> > I'm open to other suggestions that won't limit the usage of this control
> > for devices with just (up to) two sensors.  
> 
> What backward compatibility code are you talking about? I honestly don't see
> the problem here.

Right now, we're adding an API that assumes that the video node may have
only up to 2 sensors, and that would cover just one small subset of usecases
(see more below). If it has anything more than that, this control won't help.

One day (probably soon enough, as there are several devices with more than
two sensors already), we'll end adding a proper support for it, and this 
control will become obsoleted, requiring us to think about backward
compatibility issues when this control become deprecated.

That's why I prefer spending some time finding a better way to report it,
avoiding the need of having to do some deprecation logic anytime soon.

> >>>
> >>> 2) There are also some devices that has a movable sensor, that can either
> >>>    be taking a picture from the front or from the back, like those:
> >>>
> >>> 	https://www.youtube.com/watch?v=br6G7MrkRUc
> >>>
> >>>    On such case, the control should not be read-only, as one may need to
> >>>    change this control in order to select if a sensor would either be on
> >>>    FRONT or on BACK position.
> >>>
> >>>    For such kind of sensors (when we start supporting them), we could 
> >>>    for example call them like:
> >>>
> >>> 	V4L2_LOCATION_MOVABLE_IN_BACK_POSITION_1
> >>> 	V4L2_LOCATION_MOVABLE_IN_BACK_POSITION_2
> >>> 	V4L2_LOCATION_MOVABLE_IN_FRONT_POSITION_1
> >>> 	V4L2_LOCATION_MOVABLE_IN_FRONT_POSITION_2    
> >>
> >> I don't like this. If the driver can tell when the position changes, then it
> >> can update the control's value (it's still read-only because userspace
> >> can't write to it, but that doesn't mean it can't be updated).  
> > 
> > Why userspace can't set it? I mean, if the camera is movable, it
> > should be up to the application to select the sensor between FRONT
> > and BACK.  
> 
> Ah, right. If you can command the camera to flip from back to front using
> a button or something, then yes, it can be writable. Sorry, didn't think of
> that. I was thinking that the user would manually move the camera and the
> new position would be detected by the driver and reported in the location
> control.
> 
> In any case, if the location control can be set through the driver by setting
> this control, then just drop the READ_ONLY flag. If the control is writable,
> then the sensor is movable. Just document this and we're done.

Works for me.

> You are making this much more complicated than it need to be IMHO.
> 
> > 
> > Btw, this is a case where I clearly see value on this ioctl: all cameras  
> 
> It's a *control*, not a new ioctl.
> 
> > with flippable sensors need a control to switch the sensor's position,
> > even if the sensor device is hardcoded on some application.
> >   
> >> So there is
> >> no need to call it 'MOVABLE', you just report the correct location. And with
> >> QUERYMENU you can tell that it is movable since multiple possible locations
> >> are reported (BACK and FRONT in this example). If it is fixed, then QUERYMENU
> >> will report only a single location.
> >>
> >> This might have some consequences for the DT bindings, though. Not sure
> >> how to represent this there.  
> > 
> > I guess DT should contain the default value when the device is turned
> > off. 
> >   
> >> If the driver cannot tell what the position is, then it makes no sense for
> >> the driver to expose this location control since it clearly is something that
> >> has to be hardcoded in userspace. I.e., there is no point for userspace to
> >> write to the control and then read back what it wrote :-)  
> > 
> > Actually there is. When you command a device to switch position, it may
> > take some time to move the sensor, and such operation may even fail.  
> 
> Yeah, I forgot about that option.
> 
> > 
> > So, reading back the position is probably mandatory.  
> 
> Well, it's a control, so that's standard.
> 
> > 
> > That reminds that it may actually have a third position, to warn
> > that the sensor was blocked.
> > 
> > Also, some flip sensors may have another position (a "closed"
> > position).  
> 
> It's certainly possible that we need to add new positions to support the
> various states of such a movable sensor. But that's no problem. It's just
> a menu control, adding new positions is cheap and easy.
> 
> I stand by what I said, except that I agree that this control can be
> writable in some circumstances, and that should be documented
> 
> I strongly disagree with the notion of BACK_1/2/3 and FRONT_1/2/3: it adds
> no meaningful information. 

Ok, but if this control would just say where a sensor is mounted
(front, back or unknown/external), naming it as "LOCATION" seems too
ambitious ;-)

What it is actually trying to report is the angle of the sensor, with
regards to the front position, adding currently two possible angles:
0 degrees (front) or 180 degrees (back).

So, I would call it, instead, as V4L2_CID_CAMERA_VIEWING_ANGLE
(or something similar to it).

Having just two pre-defined angles (front/back) only works fine on
devices like cell-phones or tablets, where the sensor cannot be
on some other angle.

If you mount cameras on a larger device, like a car, you may have
some cameras mounted with different angles, for example, the front
cameras could have been mounted with -45, 0 and 45 degrees, in order
to cover a larger region.

So, if that would be ok for you, I can live with a

V4L2_CID_CAMERA_VIEWING_ANGLE (or some similar name) that will
specify the angle where the sensor is mounted (for fixed sensors),
or the current angle, in case of movable ones, being RO for fixed
sensors and RW for movable ones.

Let's postpone discussions for a LOCATION control once this
would be needed by some driver.

> If you have multiple sensors and in order to use
> them the application needs to know the relative positions (most likely for
> 3D sensors), then provide the precise position. The unit for that should
> probably be micrometer since millimeter is most likely not precise enough
> (at least looking at the depth sensors on my camera).

I can see two different types of usage for a real localization control:

1) 3D sensors - for that, micrometer is probably a better measure;
2) multiple sensors, each covering a different view. That could be,
   for example, a back camera on the left side or on at the right side
   of a car. It could also be several sensors at the same side on a long
   product inspection line.

For (2), the distance between sensors could be several meters. So,
perhaps we'll need to either add two different LOCATION controls,
one for 3D and another one for multiple 2D sensors spread to cover
a larger region.

In any case, let's postpone any further discussions about that until
when we have someone needing it.


Thanks,
Mauro
