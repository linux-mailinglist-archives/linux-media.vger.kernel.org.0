Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D44C68ED41
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732505AbfHONsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:48:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732122AbfHONsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:48:54 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E141C2AF;
        Thu, 15 Aug 2019 15:48:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565876932;
        bh=xowyGRiP4/YVXIEzA/PZn8BUaXGf008qzpBzfZbm7g0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iI7FG4A3hy7aFaZLKOforRcR9n5x1GpjnRZ/oNE0bvk2jsJETaf/mnqUBcBZ80j9r
         MiZnTKuLSXk+YEgSIMXZsiXI7Cypb1cVOo3MLCcwrNBiGu3H0rMtvyW5IH/o8yWGrI
         K6tS3lSFCq/AVUarbp8nklxxuVRBkbeENn61GoOo=
Date:   Thu, 15 Aug 2019 16:48:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190815134848.GA20020@pendragon.ideasonboard.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
 <02b40da5-c30c-f1f3-2351-c04da932e94a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <02b40da5-c30c-f1f3-2351-c04da932e94a@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Aug 15, 2019 at 03:30:59PM +0200, Hans Verkuil wrote:
> On 8/14/19 10:28 PM, Jacopo Mondi wrote:
> > Add documentation for the V4L2_CID_LOCATION camera control. The newly
> > added read-only control reports the camera device mounting position.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../media/uapi/v4l/ext-ctrls-camera.rst       | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > index 51c1d5c9eb00..fc0a02eee6d4 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > @@ -510,6 +510,29 @@ enum v4l2_scene_mode -
> >      value down. A value of zero stops the motion if one is in progress
> >      and has no effect otherwise.
> > 
> > +``V4L2_CID_LOCATION (integer)``
> > +    This read-only control describes the camera location by reporting its
> > +    mounting position on the device where the camera is installed. This
> > +    control is particularly meaningful for devices which have a well defined
> > +    orientation, such as phones, laptops and portable devices as the camera
> > +    location is expressed as a position relative to the device intended
> > +    usage position. In example, a camera installed on the user-facing side
> > +    of a phone device is said to be installed in the ``V4L2_LOCATION_FRONT``
> > +    position.
> 
> When should this control be created? If there is only one location (e.g.
> all sensors are front-facing) would you still expose this? Or does it depend
> on the type of device?

Those are important questions that need to be answered :-) Going forward
I think all camera sensors should expose this, and I'd like a helper
function to create the control and set its value based on firmware
properties that all (or most) camera sensor drivers should use. That
helper function should also create the other mandatory or optional
standard controls for camera sensors, such as the pixel rate or link
frequency controls.

> And is the sensor in a digital camera front or back facing? (Just curious
> about what you think about that situation!)

I think we should include here a list of supported device types, and for
each device type, define what the front location is. All other locations
are then derived from that. For a digital camera I would define the
front side as facing the scene being photographed.

> > +
> > +
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +
> > +    * - ``V4L2_LOCATION_FRONT``
> > +      - The camera device is located on the front side of the device.
> > +    * - ``V4L2_LOCATION_BACK``
> > +      - The camera device is located on the back side of the device.
> > +
> > +
> > +
> >  .. [#f1]
> >     This control may be changed to a menu control in the future, if more
> >     options are required.

-- 
Regards,

Laurent Pinchart
