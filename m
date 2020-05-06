Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06071C6EEA
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 13:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbgEFLJ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 07:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727861AbgEFLJ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 07:09:28 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF3BC061A0F
        for <linux-media@vger.kernel.org>; Wed,  6 May 2020 04:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=tklJkt/qMJNRgdzu1RQc4mu57ElnC8FdgyYmjzia984=; b=bit31eS1mdznnVmStMpZfj95GT
        uC9McBtkeUpQhcrdr2uTrmsEl9nZh35JRb2GrqF5siinKuC7kYZu7NZwJ+2KQie9Voxgq1BHXGeKP
        n7iBRU4kx6YQ/mhD51fDGyUJFvxfYp6gOmVvdjQeBlV4D56IjJRFSwjVSwCCnikS1A/nNJ/vGfI+Y
        EENGLHZ+qQSV/1nXAw7vWA46s/rp3Mh+nBfLPps3zRXce9uIfJDTwpyZdAy/870I1n4VB24A047ai
        IVglKm/wErfGv6vhbsRauMGNlCXn20Ut7aytxwNZG/fs2dGUebyy5ACzWrzQM9vt2Csb1zBqJOBV1
        MSLEi2hw==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWHvR-0005bJ-Ir; Wed, 06 May 2020 11:09:17 +0000
Date:   Wed, 6 May 2020 13:09:13 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH v9 02/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_LOCATION
Message-ID: <20200506130913.7df929ff@coco.lan>
In-Reply-To: <20200506104723.l3wojjyefvazohpd@uno.localdomain>
References: <20200417124110.72313-1-jacopo@jmondi.org>
        <20200417124110.72313-3-jacopo@jmondi.org>
        <20200505140206.589f54ae@coco.lan>
        <a5d77790-5f98-650e-cfb9-a97b8701454d@xs4all.nl>
        <20200506104723.l3wojjyefvazohpd@uno.localdomain>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 6 May 2020 12:47:23 +0200
Jacopo Mondi <jacopo@jmondi.org> escreveu:

> Hello,
> 
> On Tue, May 05, 2020 at 02:21:38PM +0200, Hans Verkuil wrote:
> > On 05/05/2020 14:02, Mauro Carvalho Chehab wrote:  
> > > Em Fri, 17 Apr 2020 14:41:01 +0200
> > > Jacopo Mondi <jacopo@jmondi.org> escreveu:
> > >  
> > >> Add documentation for the V4L2_CID_CAMERA_SENSOR_LOCATION camera
> > >> control. The newly added read-only control reports the camera device
> > >> mounting position.
> > >>
> > >> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > >> ---
> > >>  .../media/v4l/ext-ctrls-camera.rst            | 32 +++++++++++++++++++
> > >>  1 file changed, 32 insertions(+)
> > >>
> > >> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > >> index e39f84d2447f..01a9042d53a6 100644
> > >> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > >> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > >> @@ -510,6 +510,38 @@ enum v4l2_scene_mode -
> > >>      value down. A value of zero stops the motion if one is in progress
> > >>      and has no effect otherwise.
> > >>
> > >> +``V4L2_CID_CAMERA_SENSOR_LOCATION (integer)``
> > >> +    This read-only control describes the camera sensor location by reporting
> > >> +    its mounting position on the device where the camera is installed. The
> > >> +    control value is constant and not modifiable by software. This control is
> > >> +    particularly meaningful for devices which have a well defined orientation,
> > >> +    such as phones, laptops and portable devices since the camera location is
> > >> +    expressed as a position relative to the device's intended usage orientation.
> > >> +    For example, a camera sensor installed on the user-facing side of a phone,
> > >> +    a tablet or a laptop device is said to be installed in the
> > >> +    ``V4L2_LOCATION_FRONT`` location while camera sensors installed on the side
> > >> +    opposite the front one are said to be installed in the
> > >> +    ``V4L2_LOCATION_BACK`` location. Camera sensors not directly attached to
> > >> +    the device or attached in a way that allows them to move freely, such as
> > >> +    webcams and digital cameras, are said to have the ``V4L2_LOCATION_EXTERNAL``
> > >> +    location.
> > >> +
> > >> +
> > >> +
> > >> +.. flat-table::
> > >> +    :header-rows:  0
> > >> +    :stub-columns: 0
> > >> +
> > >> +    * - ``  
> > > ``  
> > >> +      - The camera sensor is located on the front side of the device.
> > >> +    * - ``V4L2_LOCATION_BACK``
> > >> +      - The camera sensor is located on the back side of the device.
> > >> +    * - ``V4L2_LOCATION_EXTERNAL``
> > >> +      - The camera sensor is not directly attached to the device and is
> > >> +        freely movable.  
> > >
> > > I guess I mentioned this already, but IMHO this ioctl is somewhat flawed,
> > > for two reasons:
> > >
> > > 1) newer devices may all top of the line mobile devices now are coming
> > >    with multiple camera sensors at the same side. So, just saying that
> > >    the location is front or back is not enough. A location syscall would
> > >    need have something more to better identify the location.
> > >    It probably doesn't need to be something fancy, but, at least, on a
> > >    device with 3 back sensors, I would call them as:
> > >
> > > 	V4L2_LOCATION_BACK_1
> > > 	V4L2_LOCATION_BACK_2
> > > 	V4L2_LOCATION_BACK_3
> > >
> > >    And add some comment at the control documentation that would allow to
> > >    uniquely number the other ones, like:
> > >
> > > 	"when multiple sensors are present at the same side, sensors
> > > 	 will be numbered considering the ``(x,y)`` coordinates of the center
> > > 	 of each sensor, starting from the topmost, leftmost position.
> > >
> > > 	 She first sensor will be the topmost sensor column at the leftmost
> > > 	 side. The other sensors that will have the same ``y`` coordinate,
> > > 	 counting from the left to the right, then increment the ``y`` and
> > > 	 parse the next column again until all sensors are numbered."  
> >
> > I think this isn't a good idea. In most cases you do not care about this.
> >
> > And if you do care about this, then wouldn't it be better to do that through
> > a new control where you provide the precise coordinates in e.g. mm?
> >
> > BACK_1/2/3 really doesn't tell you anything other than that there are three
> > sensors on the back, but we knew that already.
> >
> > If we need support for the precise location in the future, then let's do that
> > right and not try to shoehorn into something that wasn't meant for it.  
> 
> I think the best move forward to describe movable cameras and such
> would be to provide a 3D rotation matrix, along the lines of what iio
> has in the 'mount-matrix' property as suggested by Rob and Laurent in
> the review of the series.
> 
> Before going the 'easy' way with this proeprty that just allow to
> enumerate fixed locations I considered the idea, but we're still
> missing a unique definition for the device usage orientation that the
> rotation matrix would be defined for.
> 
> This property implements a mechanism that covers most of devices out
> there and all devices in mainline. The properties defined here are the
> most basic ones, and could be combined and expanded to provide more
> precise definition is someone needs to do so (expecially downstream),
> but the important part is that the mechanism to retrieve the
> information is in place.

I had some discussions with Laurent about that.

Yeah, a 3D rotation matrix could work. Another option would be to
name this as CID_LENS_FACING, use about the same definition as on
Android:

 https://jmondi.org/android_metadata_tags/docs.html#static_android.lens.poseTranslation

The definition there is arguable (as some devices may have back
screens nowadays), but a name like that is what this control
really does, as it doesn't neither provide a rotation matrix
nor a camera location.

Starting with a "read-only" control sound OK to me, but I would
add some note about flippable changes that can be changed in
runtime between back/front position.

Something like:

.. note:

	Sensors that could have it side flipped is currently out
	of the scope of this control. Some changes on the behavior
	of this control may change when support for such kind of
	devices would be added upstream.

Thanks,
Mauro
