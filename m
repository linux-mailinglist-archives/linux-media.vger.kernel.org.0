Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29B4AA69A5
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 15:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729362AbfICNW4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 09:22:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54586 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728538AbfICNW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 09:22:56 -0400
Received: from pendragon.ideasonboard.com (85-76-148-17-nat.elisa-mobile.fi [85.76.148.17])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10935542;
        Tue,  3 Sep 2019 15:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567516973;
        bh=1YcGE344GTtqnTMiGlz4fz6gFmf+FFw0GZAFE8coxak=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JSKViCDhidRVUSW9XGEXTMAGA0mioYmhWnPKrY1tI5necUFgi2fFfWqP16v+ZEQxi
         JnqT22eQmc5B+CbYXwDbMYbGony1PZqNPnsX4TChvJ5Z90iYqU2Y+kzzmSteVWuT0K
         DUkZfdi1t/3CUQ7mxeqyRW+FrSao8i0YbQozcgO0=
Date:   Tue, 3 Sep 2019 16:22:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/10] media: dt-bindings: Document 'location' property
Message-ID: <20190903132244.GB4812@pendragon.ideasonboard.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-2-jacopo@jmondi.org>
 <20190827122126.GQ5054@pendragon.ideasonboard.com>
 <20190829124639.tzjp63tqnojnytlq@uno.localdomain>
 <5d6d1b60.1c69fb81.f3a3a.1619@mx.google.com>
 <20190902164031.yllajoj6duz27mun@uno.localdomain>
 <20190902164937.GF12197@pendragon.ideasonboard.com>
 <20190902190949.3zhbg6fcudfdmu4z@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190902190949.3zhbg6fcudfdmu4z@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Sep 02, 2019 at 09:48:30PM +0200, Jacopo Mondi wrote:
> On Mon, Sep 02, 2019 at 07:49:37PM +0300, Laurent Pinchart wrote:
> > On Mon, Sep 02, 2019 at 06:40:31PM +0200, Jacopo Mondi wrote:
> >> On Mon, Sep 02, 2019 at 02:38:40PM +0100, Rob Herring wrote:
> >>> On Thu, Aug 29, 2019 at 02:46:40PM +0200, Jacopo Mondi wrote:
> >>>> On Tue, Aug 27, 2019 at 03:21:26PM +0300, Laurent Pinchart wrote:
> >>>>> On Tue, Aug 27, 2019 at 11:23:27AM +0200, Jacopo Mondi wrote:
> >>>>>> Add the 'location' device property, used to specify the camera device
> >>>>>> mounting position. The property is particularly meaningful for mobile
> >>>>>> devices with a well defined usage orientation.
> >>>>>>
> >>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>>>> ---
> >>>>>>  .../devicetree/bindings/media/video-interfaces.txt     | 10 ++++++++++
> >>>>>>  1 file changed, 10 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> >>>>>> index f884ada0bffc..865f4142f432 100644
> >>>>>> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> >>>>>> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> >>>>>> @@ -89,6 +89,16 @@ Optional properties
> >>>>>>    but a number of degrees counter clockwise. Typical values are 0 and 180
> >>>>>>    (upside down).
> >>>>>>
> >>>>>> +- location: The camera sensor mounting location, expressed as a position
> >>>>>> +  relative to the usage orientation of the device the sensor is installed on.
> >>>>>
> >>>>> DT bindings being ABIs, we need to be precise and thorough there. One
> >>>>> particular point that bothers me is that the property is named location,
> >>>>> and its description refers to camera sensor mounting location.
> >>>>>
> >>>>> I see two options to fix this. One of them is to rename the property to
> >>>>> camera-location, but that would limit its future usage for other types
> >>>>> of devices. The other one is to document the property as applying to a
> >>>>> "device" instead of a "camera sensor", and add one sentence stating that
> >>>>> this property is valid for camera sensors only.
> >>>>>
> >>>>> This will require finding another name for the device that the device is
> >>>>> mounted on though, as using device twice would be very confusing.
> >>>>
> >>>> I had the same concern, but I cannot find another term to convey
> >>>> this... suggestions?
> >>>
> >>> For accelerometers and/or gyroscopes, we already have 'mount-matrix'.
> >>
> >> Pardon my ignorance, but I could not find it documented. Some binding
> >> files refers to an iio/mount-matrix.txt file which I cannot find. Has
> >> it been removed? Anyway, some individual bindings report examples of
> >> mount matrices (ie
> >> Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt)
> >>
> >>> That would replace 'rotation'. Maybe we can do something similar here?
> >>
> >> I think 'rotation' simply expressed as degrees is fine here, our
> >> problem was to find a term that would make it possible to specify that
> >> rotation/location are applied to a 'device' mounted on a 'device'.
> >> Sakari suggested on irc to use 'system' in place of the second
> >> 'device' and that seems to work well to me.
> >>
> >> Or were you suggesting to use a construct similar to mount-matrix for
> >> a purpose I didn't get :) ?
> >
> > mount-matrix would allow exposing the rotation in a more generic way,
> > and if there are standard DT bindings, I think this would make sense,
> > especially given that we could have device with camera sensors not
> > mounted parallel to the device side.
> 
> After reading this entry you pointed me to
> https://lore.kernel.org/patchwork/patch/1044786/
> I understand why Rob suggested that, but it seems a bit far fetched to
> me... The devices that could make use of 'mount-matrix', such as the
> ones IIO deal with, sample data in a 3D space, and to compensate their
> mounting displacement a rotation matrix is required.
> 
> Do you see use cases for compensating mounting displacement in a 3-d
> space for a camera ? I'm not saying it's not possible, but seems -a
> bit- far fetched.

360° cameras come to mind, they can use multiple sensors mounted with
different angles.

> If we consider cameras as always mounted parallel to the device used
> to take picturea, the correction you could apply to the possible mounting
> displacements are just rotations along the origin (or the z axis you want
> to consider a 3 dimensional space) and requiring to supply a 2-dimensions
> rotation matrix (with only a few combinations of 0, 1 and -1, if we only
> accept multiples of 90 degrees as we agreed) it seems a bit an overkill.
> 
> True, we could also handle image flipping, not just rotation with a rotation
> matrix but an image sensor mounted flipped upside down kind of defeat its
> purpose, doesn't it ? (it would point to the inside of the device :)
> 
> When we'll have devices with movable sensors like the one Pavel
> linked, rotation matrices could be used to report the current camera
> position maybe, but to represent a mounting displacement compensation,
> for devices working in a 2 dimensional space and with fixed rotations
> of 90 degrees multiples it seems an overkill to ask to developers to
> me.
> 
> That said, there are devices out there which do things I cannot even
> imagine, and maybe could actually compensate rotations in the 3D
> space, sample 3D point maps or other advanced things. Indeed they
> could use a rotation matrix if they need to, but the purpose of
> 'rotation' is much more humble and even if it could be represented
> with 'mount-matrix' it seems to me a non justifiable effort.

Most devices will only need to report a 0, 90, 180 or 270 rotation angle
along an axis perpendicular to the device. For those, mount-matrix is
indeed a bit overkill, and a rotation property would be enough. However,
when we will need to express more than those simple configurations,
mount-matrix will become needed, and all of a sudden we will have
multiple ways to express the same information. That's what I would like
to avoid by going for mount-matrix already.

-- 
Regards,

Laurent Pinchart
