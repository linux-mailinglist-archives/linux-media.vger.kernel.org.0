Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA7048EC9D
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732128AbfHONUE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:20:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45708 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730304AbfHONUE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:20:04 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E7912AF;
        Thu, 15 Aug 2019 15:20:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565875202;
        bh=eDIJZI2UnIojM1PRCFwzGcZMZQDhOZCW8hi2JK1Jnlc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XApBsCOlCxHaIV20Kt0Y2iPt6JMsbIBf13lrTWxASnf1jiqSnyil0n97NwJLPsJld
         b+pkOeQU/c/pOuuydS+FGDb2OTYCFcbJxtSOK/aNdZL+p1gB7T/YNVFGR8gHSClSuk
         idInnjau2tlAXHhDJq4OhN3aKl+f5iY6e4jCO1QQ=
Date:   Thu, 15 Aug 2019 16:19:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190815131959.GQ5011@pendragon.ideasonboard.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
 <20190815070025.GK6133@paasikivi.fi.intel.com>
 <20190815125938.GI13823@pendragon.ideasonboard.com>
 <20190815130849.GQ6133@paasikivi.fi.intel.com>
 <20190815131053.GO5011@pendragon.ideasonboard.com>
 <20190815131509.GR6133@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190815131509.GR6133@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 15, 2019 at 04:15:10PM +0300, Sakari Ailus wrote:
> On Thu, Aug 15, 2019 at 04:10:53PM +0300, Laurent Pinchart wrote:
> > On Thu, Aug 15, 2019 at 04:08:49PM +0300, Sakari Ailus wrote:
> >> On Thu, Aug 15, 2019 at 03:59:38PM +0300, Laurent Pinchart wrote:
> >>> On Thu, Aug 15, 2019 at 10:00:25AM +0300, Sakari Ailus wrote:
> >>>> On Wed, Aug 14, 2019 at 10:28:12PM +0200, Jacopo Mondi wrote:
> >>>>> Add documentation for the V4L2_CID_LOCATION camera control. The newly
> >>>>> added read-only control reports the camera device mounting position.
> >>>>> 
> >>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>>> ---
> >>>>>  .../media/uapi/v4l/ext-ctrls-camera.rst       | 23 +++++++++++++++++++
> >>>>>  1 file changed, 23 insertions(+)
> >>>>> 
> >>>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >>>>> index 51c1d5c9eb00..fc0a02eee6d4 100644
> >>>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >>>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >>>>> @@ -510,6 +510,29 @@ enum v4l2_scene_mode -
> >>>>>      value down. A value of zero stops the motion if one is in progress
> >>>>>      and has no effect otherwise.
> >>>>> 
> >>>>> +``V4L2_CID_LOCATION (integer)``
> >>>>> +    This read-only control describes the camera location by reporting its
> >>>>> +    mounting position on the device where the camera is installed. This
> >>>>> +    control is particularly meaningful for devices which have a well defined
> >>>>> +    orientation, such as phones, laptops and portable devices as the camera
> >>>>> +    location is expressed as a position relative to the device intended
> >>>>> +    usage position. In example, a camera installed on the user-facing side
> >>>> 
> >>>> s/In/For/
> >>>> 
> >>>>> +    of a phone device is said to be installed in the ``V4L2_LOCATION_FRONT``
> >>>>> +    position.
> >>>>> +
> >>>>> +
> >>>>> +
> >>>>> +.. flat-table::
> >>>>> +    :header-rows:  0
> >>>>> +    :stub-columns: 0
> >>>>> +
> >>>>> +    * - ``V4L2_LOCATION_FRONT``
> >>>>> +      - The camera device is located on the front side of the device.
> >>>>> +    * - ``V4L2_LOCATION_BACK``
> >>>>> +      - The camera device is located on the back side of the device.
> >>>>> +
> >>>>> +
> >>>>> +
> >>>>>  .. [#f1]
> >>>>>     This control may be changed to a menu control in the future, if more
> >>>>>     options are required.
> >>>> 
> >>>> There's an effective limit of 64 for menus. ACPI has less than ten
> >>>> different locations for a device, I think 64 will be enough here.
> >>>> 
> >>>> So I'd be actually in favour of switching to a menu.
> >>> 
> >>> Why ? As you explained yourself, it's a static read-only control, all it
> >>> needs to report is a single value.
> >> 
> >> Yes. That's true. It wasn't meant for this but it's nevertheless a
> >> convenient API to get that information, both as integer and string.
> > 
> > But why is that needed ? The integer seems enough to me.
> 
> Because it's a qualitative control, not a quantitative one.

And ? :-) The integer values are defined in the V4L2 spec, they map to a
usage, and a name can easily be derived from that in userspace if
desired.

-- 
Regards,

Laurent Pinchart
