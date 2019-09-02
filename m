Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18577A5B89
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 18:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfIBQtp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 12:49:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36052 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfIBQtp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 12:49:45 -0400
Received: from pendragon.ideasonboard.com (231.125-247-81.adsl-dyn.isp.belgacom.be [81.247.125.231])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48D85303;
        Mon,  2 Sep 2019 18:49:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567442983;
        bh=hmQ0CxYzeDkmEaZW4Qk6VHt9ToW/VD04aLtEx+gCdpk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vRHRaGwTD8H9iRm7CXJHLdeg257dpz7jlbd0vz+b8weZW1F+POx8Mxi0duIglvPd5
         yrwKmfpUsbHfdaeRJlQhyAk4j2WGWV4pXdNlQYfi2CEAU1O3mrDhrKSXDMNGNtMQ5h
         EhugFlB8evVZQMrp9V43RR7OLwooTUY0RioA5g38=
Date:   Mon, 2 Sep 2019 19:49:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/10] media: dt-bindings: Document 'location' property
Message-ID: <20190902164937.GF12197@pendragon.ideasonboard.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-2-jacopo@jmondi.org>
 <20190827122126.GQ5054@pendragon.ideasonboard.com>
 <20190829124639.tzjp63tqnojnytlq@uno.localdomain>
 <5d6d1b60.1c69fb81.f3a3a.1619@mx.google.com>
 <20190902164031.yllajoj6duz27mun@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190902164031.yllajoj6duz27mun@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Sep 02, 2019 at 06:40:31PM +0200, Jacopo Mondi wrote:
> On Mon, Sep 02, 2019 at 02:38:40PM +0100, Rob Herring wrote:
> > On Thu, Aug 29, 2019 at 02:46:40PM +0200, Jacopo Mondi wrote:
> >> On Tue, Aug 27, 2019 at 03:21:26PM +0300, Laurent Pinchart wrote:
> >>> On Tue, Aug 27, 2019 at 11:23:27AM +0200, Jacopo Mondi wrote:
> >>>> Add the 'location' device property, used to specify the camera device
> >>>> mounting position. The property is particularly meaningful for mobile
> >>>> devices with a well defined usage orientation.
> >>>>
> >>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>> ---
> >>>>  .../devicetree/bindings/media/video-interfaces.txt     | 10 ++++++++++
> >>>>  1 file changed, 10 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> >>>> index f884ada0bffc..865f4142f432 100644
> >>>> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> >>>> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> >>>> @@ -89,6 +89,16 @@ Optional properties
> >>>>    but a number of degrees counter clockwise. Typical values are 0 and 180
> >>>>    (upside down).
> >>>>
> >>>> +- location: The camera sensor mounting location, expressed as a position
> >>>> +  relative to the usage orientation of the device the sensor is installed on.
> >>>
> >>> DT bindings being ABIs, we need to be precise and thorough there. One
> >>> particular point that bothers me is that the property is named location,
> >>> and its description refers to camera sensor mounting location.
> >>>
> >>> I see two options to fix this. One of them is to rename the property to
> >>> camera-location, but that would limit its future usage for other types
> >>> of devices. The other one is to document the property as applying to a
> >>> "device" instead of a "camera sensor", and add one sentence stating that
> >>> this property is valid for camera sensors only.
> >>>
> >>> This will require finding another name for the device that the device is
> >>> mounted on though, as using device twice would be very confusing.
> >>
> >> I had the same concern, but I cannot find another term to convey
> >> this... suggestions?
> >
> > For accelerometers and/or gyroscopes, we already have 'mount-matrix'.
> 
> Pardon my ignorance, but I could not find it documented. Some binding
> files refers to an iio/mount-matrix.txt file which I cannot find. Has
> it been removed? Anyway, some individual bindings report examples of
> mount matrices (ie
> Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt)
> 
> > That would replace 'rotation'. Maybe we can do something similar here?
> 
> I think 'rotation' simply expressed as degrees is fine here, our
> problem was to find a term that would make it possible to specify that
> rotation/location are applied to a 'device' mounted on a 'device'.
> Sakari suggested on irc to use 'system' in place of the second
> 'device' and that seems to work well to me.
> 
> Or were you suggesting to use a construct similar to mount-matrix for
> a purpose I didn't get :) ?

mount-matrix would allow exposing the rotation in a more generic way,
and if there are standard DT bindings, I think this would make sense,
especially given that we could have device with camera sensors not
mounted parallel to the device side.

-- 
Regards,

Laurent Pinchart
