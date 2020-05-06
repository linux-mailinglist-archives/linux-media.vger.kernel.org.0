Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765611C6EE1
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 13:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgEFLFO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 07:05:14 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:43299 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbgEFLFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 May 2020 07:05:13 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id D8710200021;
        Wed,  6 May 2020 11:04:18 +0000 (UTC)
Date:   Wed, 6 May 2020 13:07:30 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH v9 02/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_LOCATION
Message-ID: <20200506110730.rvhxoh74u3rmemtw@uno.localdomain>
References: <20200417124110.72313-1-jacopo@jmondi.org>
 <20200417124110.72313-3-jacopo@jmondi.org>
 <20200505140206.589f54ae@coco.lan>
 <a5d77790-5f98-650e-cfb9-a97b8701454d@xs4all.nl>
 <20200505165826.1ce8bb0d@coco.lan>
 <b3e211da-b9f6-a65c-4453-c11b05bced45@xs4all.nl>
 <20200506113909.1489bd1e@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200506113909.1489bd1e@coco.lan>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, May 06, 2020 at 11:39:09AM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 6 May 2020 10:04:39 +0200
> Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:
>
> > On 05/05/2020 16:58, Mauro Carvalho Chehab wrote:
> > > Em Tue, 5 May 2020 14:21:38 +0200
> > > Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:
> > >
> > >> On 05/05/2020 14:02, Mauro Carvalho Chehab wrote:
> > >>> Em Fri, 17 Apr 2020 14:41:01 +0200
> > >>> Jacopo Mondi <jacopo@jmondi.org> escreveu:
> > >>>
> > >>>> Add documentation for the V4L2_CID_CAMERA_SENSOR_LOCATION camera
> > >>>> control. The newly added read-only control reports the camera device
> > >>>> mounting position.
> > >>>>
> > >>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > >>>> ---
> > >>>>  .../media/v4l/ext-ctrls-camera.rst            | 32 +++++++++++++++++++
> > >>>>  1 file changed, 32 insertions(+)
> > >>>>
> > >>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > >>>> index e39f84d2447f..01a9042d53a6 100644
> > >>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > >>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > >>>> @@ -510,6 +510,38 @@ enum v4l2_scene_mode -
> > >>>>      value down. A value of zero stops the motion if one is in progress
> > >>>>      and has no effect otherwise.
> > >>>>
> > >>>> +``V4L2_CID_CAMERA_SENSOR_LOCATION (integer)``
> > >>>> +    This read-only control describes the camera sensor location by reporting
> > >>>> +    its mounting position on the device where the camera is installed. The
> > >>>> +    control value is constant and not modifiable by software. This control is
> > >>>> +    particularly meaningful for devices which have a well defined orientation,
> > >>>> +    such as phones, laptops and portable devices since the camera location is
> > >>>> +    expressed as a position relative to the device's intended usage orientation.
> > >>>> +    For example, a camera sensor installed on the user-facing side of a phone,
> > >>>> +    a tablet or a laptop device is said to be installed in the
> > >>>> +    ``V4L2_LOCATION_FRONT`` location while camera sensors installed on the side
> > >>>> +    opposite the front one are said to be installed in the
> > >>>> +    ``V4L2_LOCATION_BACK`` location. Camera sensors not directly attached to
> > >>>> +    the device or attached in a way that allows them to move freely, such as
> > >>>> +    webcams and digital cameras, are said to have the ``V4L2_LOCATION_EXTERNAL``
> > >>>> +    location.
> > >>>> +
> > >>>> +
> > >>>> +
> > >>>> +.. flat-table::
> > >>>> +    :header-rows:  0
> > >>>> +    :stub-columns: 0
> > >>>> +
> > >>>> +    * - ``
> > >>> ``
> > >>>> +      - The camera sensor is located on the front side of the device.
> > >>>> +    * - ``V4L2_LOCATION_BACK``
> > >>>> +      - The camera sensor is located on the back side of the device.
> > >>>> +    * - ``V4L2_LOCATION_EXTERNAL``
> > >>>> +      - The camera sensor is not directly attached to the device and is
> > >>>> +        freely movable.
> > >>>
> > >>> I guess I mentioned this already, but IMHO this ioctl is somewhat flawed,
> > >>> for two reasons:
> > >>>
> > >>> 1) newer devices may all top of the line mobile devices now are coming
> > >>>    with multiple camera sensors at the same side. So, just saying that
> > >>>    the location is front or back is not enough. A location syscall would
> > >>>    need have something more to better identify the location.
> > >>>    It probably doesn't need to be something fancy, but, at least, on a
> > >>>    device with 3 back sensors, I would call them as:
> > >>>
> > >>> 	V4L2_LOCATION_BACK_1
> > >>> 	V4L2_LOCATION_BACK_2
> > >>> 	V4L2_LOCATION_BACK_3
> > >>>
> > >>>    And add some comment at the control documentation that would allow to
> > >>>    uniquely number the other ones, like:
> > >>>
> > >>> 	"when multiple sensors are present at the same side, sensors
> > >>> 	 will be numbered considering the ``(x,y)`` coordinates of the center
> > >>> 	 of each sensor, starting from the topmost, leftmost position.
> > >>>
> > >>> 	 She first sensor will be the topmost sensor column at the leftmost
> > >>> 	 side. The other sensors that will have the same ``y`` coordinate,
> > >>> 	 counting from the left to the right, then increment the ``y`` and
> > >>> 	 parse the next column again until all sensors are numbered."
> > >>
> > >> I think this isn't a good idea. In most cases you do not care about this.
> > >
> > > True, because on most cases, the userspace is hardcoded to open, let's say,
> > > video0 for the front sensor or video1 for the back sensor.
> > >
> > > This control only makes sense if the userspace is generic enough to accept
> > > sensors on different positions, identifying them at runtime.
> > >
> > > With the current proposal, userspace can only work with 2 sensors, as, if
> > > there's a third sensor, userspace won't know how to pick the right one.
> > >
> > > For instance, let's assume a car with 4 sensors, one on each side of
> > > the car (right, front); (left, front); (right; back); (left; back).
> > >
> > > With the current proposal, userspace can't do anything if it wants
> > > to identify the (right, back) camera.
> > >
> > >> And if you do care about this, then wouldn't it be better to do that through
> > >> a new control where you provide the precise coordinates in e.g. mm?
> > >>
> > >> BACK_1/2/3 really doesn't tell you anything other than that there are three
> > >> sensors on the back, but we knew that already.
> > >
> > > No, if we define some criteria about how sensors should be accounted for
> > > (something similar to the text I drafted), the location will be defined.
> > >
> > > With the above text, for example, a device with 3 sensors horizontally
> > > aligned, the arrangement will be:
> > >
> > > - sensor 1 is on the left;
> > > - sensor 2 in the middle;
> > > - sensor 3 is on the right.
> >
> > Or sensor 2 is below sensor 1 and sensor 3 is to the right of sensor 1.
> > It's meaningless information. If you want to specify the location, then
> > be precise. Especially for stereoscopic sensors (left and right) it is
> > good to know the exact distance between the sensors. Just calling them
> > '1' and '2' is not enough.
> >
> > For sensors you want to know the plane (back/front) and where they are
> > on that plane (in the case of more than one sensor). That's separate
> > information that's only needed in the case of more than one sensor.
> >
> > >
> > > Ok, I agree that writing a text with such criteria sucks, and maybe
> > > just numbering from 1 to n may not be the best thing to do. Yet,
> > > adding coordinates in mm would be just too much information, IMHO.
> >
> > Why? Just numbering them makes no sense, it's useless information.
> >
> > >
> > >> If we need support for the precise location in the future, then let's do that
> > >> right and not try to shoehorn into something that wasn't meant for it.
> > >
> > > Assuming that all the problems we have so far are to support devices with
> > > 2 sensors, by the time we add support for a third sensor, we'll end having
> > > a new ioctl for the same thing: to specify the sensors locations.
> >
> > It's just a control, nothing more.
> >
> > In most cases all you need to know is if it is a front or back sensor. In
> > some cases you need to know more: e.g. my Samsung Note 10+ has three sensors
> > on the back in a vertical row (wide, telephoto, ultrawide), and two sensors
> > for 3D to the right of them. For those last two you need to know the exact
> > position relative to one another. For the other sensors all you need to know
> > is that they are back sensors.
> >
> > >
> > > We know the drill: having two controls for the same thing makes userspace
> > > more complex and will require backward-compatibility code at the kernel
> > > and at userspace. That's what I want to avoid.
> > >
> > > I'm open to other suggestions that won't limit the usage of this control
> > > for devices with just (up to) two sensors.
> >
> > What backward compatibility code are you talking about? I honestly don't see
> > the problem here.
>
> Right now, we're adding an API that assumes that the video node may have
> only up to 2 sensors, and that would cover just one small subset of usecases
> (see more below). If it has anything more than that, this control won't help.

I don't agree the number of sensor is limited to 2. This property does
not identify sensors, it describes one more thing that userspace might
use to filter cameras. I was actually suprised nothing like this
existed in Linux when I started looking into this issue, as this seems
to me quite basic information that a generic enough userspace
application would like to be able to retrieve.

TL;DR: you can describe as many BACK cameras you want, the 'location'
gives you -one- filtering criteria more, that's it.

>
> One day (probably soon enough, as there are several devices with more than
> two sensors already), we'll end adding a proper support for it, and this
> control will become obsoleted, requiring us to think about backward
> compatibility issues when this control become deprecated.
>
> That's why I prefer spending some time finding a better way to report it,
> avoiding the need of having to do some deprecation logic anytime soon.
>

As said and discussed during the review of this series, a 3-d rotation
matrix is probably the right direction. I refrained from taking that
path because:
1) 99% of devices are interested in reporting FRONT/BACK or some
specialization of those. Asking dt to provide a 9 entries matrix to
say "FRONT" seemed an overkill.
2) There is no consensus on how the reference plane should be defined,
given the wide range of devices that we target. This is a separate
discussion on itself, and given it took 6 months to get to the point
of considering these basic properties, I'm a bit skeptical such a
discussion would have taken less than that.

> > >>>
> > >>> 2) There are also some devices that has a movable sensor, that can either
> > >>>    be taking a picture from the front or from the back, like those:
> > >>>
> > >>> 	https://www.youtube.com/watch?v=br6G7MrkRUc
> > >>>
> > >>>    On such case, the control should not be read-only, as one may need to
> > >>>    change this control in order to select if a sensor would either be on
> > >>>    FRONT or on BACK position.
> > >>>
> > >>>    For such kind of sensors (when we start supporting them), we could
> > >>>    for example call them like:
> > >>>
> > >>> 	V4L2_LOCATION_MOVABLE_IN_BACK_POSITION_1
> > >>> 	V4L2_LOCATION_MOVABLE_IN_BACK_POSITION_2
> > >>> 	V4L2_LOCATION_MOVABLE_IN_FRONT_POSITION_1
> > >>> 	V4L2_LOCATION_MOVABLE_IN_FRONT_POSITION_2
> > >>
> > >> I don't like this. If the driver can tell when the position changes, then it
> > >> can update the control's value (it's still read-only because userspace
> > >> can't write to it, but that doesn't mean it can't be updated).
> > >
> > > Why userspace can't set it? I mean, if the camera is movable, it
> > > should be up to the application to select the sensor between FRONT
> > > and BACK.
> >
> > Ah, right. If you can command the camera to flip from back to front using
> > a button or something, then yes, it can be writable. Sorry, didn't think of
> > that. I was thinking that the user would manually move the camera and the
> > new position would be detected by the driver and reported in the location
> > control.
> >
> > In any case, if the location control can be set through the driver by setting
> > this control, then just drop the READ_ONLY flag. If the control is writable,
> > then the sensor is movable. Just document this and we're done.
>
> Works for me.
>

This makes sense, it will impact bindings in the sense that it now
becomes possible to specify several locations to which select from,
which will become the items of the menu control (with some rule that
says "the first is the default" or such). If more than one location is
specified the control is RW, RO otherwise.

> > You are making this much more complicated than it need to be IMHO.
> >
> > >
> > > Btw, this is a case where I clearly see value on this ioctl: all cameras
> >
> > It's a *control*, not a new ioctl.
> >
> > > with flippable sensors need a control to switch the sensor's position,
> > > even if the sensor device is hardcoded on some application.
> > >
> > >> So there is
> > >> no need to call it 'MOVABLE', you just report the correct location. And with
> > >> QUERYMENU you can tell that it is movable since multiple possible locations
> > >> are reported (BACK and FRONT in this example). If it is fixed, then QUERYMENU
> > >> will report only a single location.
> > >>
> > >> This might have some consequences for the DT bindings, though. Not sure
> > >> how to represent this there.
> > >
> > > I guess DT should contain the default value when the device is turned
> > > off.
> > >
> > >> If the driver cannot tell what the position is, then it makes no sense for
> > >> the driver to expose this location control since it clearly is something that
> > >> has to be hardcoded in userspace. I.e., there is no point for userspace to
> > >> write to the control and then read back what it wrote :-)
> > >
> > > Actually there is. When you command a device to switch position, it may
> > > take some time to move the sensor, and such operation may even fail.
> >
> > Yeah, I forgot about that option.
> >
> > >
> > > So, reading back the position is probably mandatory.
> >
> > Well, it's a control, so that's standard.
> >
> > >
> > > That reminds that it may actually have a third position, to warn
> > > that the sensor was blocked.
> > >
> > > Also, some flip sensors may have another position (a "closed"
> > > position).
> >
> > It's certainly possible that we need to add new positions to support the
> > various states of such a movable sensor. But that's no problem. It's just
> > a menu control, adding new positions is cheap and easy.
> >
> > I stand by what I said, except that I agree that this control can be
> > writable in some circumstances, and that should be documented
> >
> > I strongly disagree with the notion of BACK_1/2/3 and FRONT_1/2/3: it adds
> > no meaningful information.
>
> Ok, but if this control would just say where a sensor is mounted
> (front, back or unknown/external), naming it as "LOCATION" seems too
> ambitious ;-)
>
> What it is actually trying to report is the angle of the sensor, with
> regards to the front position, adding currently two possible angles:
> 0 degrees (front) or 180 degrees (back).
>
> So, I would call it, instead, as V4L2_CID_CAMERA_VIEWING_ANGLE
> (or something similar to it).

_ORIENTATION might be the right word, I'm fine to reserve _LOCATION
for a more precise property if that helps moving forward.

>
> Having just two pre-defined angles (front/back) only works fine on
> devices like cell-phones or tablets, where the sensor cannot be
> on some other angle.
>
> If you mount cameras on a larger device, like a car, you may have
> some cameras mounted with different angles, for example, the front
> cameras could have been mounted with -45, 0 and 45 degrees, in order
> to cover a larger region.

I considered that case, but I expect those very specific usages to be
covered by downstream extensions of the property supported values. I
wish we had a .dts to describe a car in mainlien, but I would be happy
enough to provide a standard mechanism for people to use downstream
eventually, instead of adding custom properties, or taking shortcuts
like it mostly happens today.

>
> So, if that would be ok for you, I can live with a
>
> V4L2_CID_CAMERA_VIEWING_ANGLE (or some similar name) that will
> specify the angle where the sensor is mounted (for fixed sensors),
> or the current angle, in case of movable ones, being RO for fixed
> sensors and RW for movable ones.
>
> Let's postpone discussions for a LOCATION control once this
> would be needed by some driver.

Would V4L2_CID_CAMERA_ORIENTATION work ?

I could:
1) rename dt-proeprty and control to use orientation
2) specify multiple locations could be entered, the first one being
the "default" (eg. device turned off) location
3) make am RW control if multiple entries have been specified, a RO
otherwise.

Ack ?

Thanks
   j
