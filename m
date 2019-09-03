Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF0FA6987
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 15:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbfICNRV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 09:17:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54534 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbfICNRU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 09:17:20 -0400
Received: from pendragon.ideasonboard.com (85-76-148-17-nat.elisa-mobile.fi [85.76.148.17])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 680EA542;
        Tue,  3 Sep 2019 15:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567516639;
        bh=xHfidRzOCf52Ufi/GO1Yx1zyBHK/gcSqThq5Z2wEE2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PIPk+ZZI28cfypKk211k57sqOU+PS2t9IZwZQ2/AOFbSZpcpYkIsXgzXPaQAVdVG5
         ZKeiOSt3CCMXXI3zTxIrRHybRNWpIajSQ5pE5wN4wk+5n0zlNMud9zvWWnfxCloWI7
         bdA0xz86ADmbWd0QVTwGeYJhrCcgD+0kyPl5dSho=
Date:   Tue, 3 Sep 2019 16:17:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomasz Figa <tfiga@google.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 03/10] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_ROTATION
Message-ID: <20190903131710.GA4812@pendragon.ideasonboard.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-4-jacopo@jmondi.org>
 <20190827125132.GU5054@pendragon.ideasonboard.com>
 <20190902112049.uwnawj5rm3tk4eqe@uno.localdomain>
 <20190902164315.GE12197@pendragon.ideasonboard.com>
 <CAAFQd5CTn_6gDZL+kxN=112JW1tRSXo2PG1-twgnYycb0uGPYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAFQd5CTn_6gDZL+kxN=112JW1tRSXo2PG1-twgnYycb0uGPYA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Tue, Sep 03, 2019 at 01:16:21PM +0900, Tomasz Figa wrote:
> On Tue, Sep 3, 2019 at 1:43 AM Laurent Pinchart wrote:
> > On Mon, Sep 02, 2019 at 01:20:49PM +0200, Jacopo Mondi wrote:
> >> On Tue, Aug 27, 2019 at 03:51:32PM +0300, Laurent Pinchart wrote:
> >>> On Tue, Aug 27, 2019 at 11:23:29AM +0200, Jacopo Mondi wrote:
> >>>> Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
> >>>> control. The newly added read-only control reports the camera device
> >>>> mounting rotation.
> >>>>
> >>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>> ---
> >>>>  Documentation/media/uapi/v4l/ext-ctrls-camera.rst | 9 +++++++++
> >>>>  1 file changed, 9 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >>>> index ecf151f3f0f4..03d1c23d18f7 100644
> >>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >>>> @@ -544,6 +544,15 @@ enum v4l2_scene_mode -
> >>>>
> >>>>
> >>>>
> >>>> +``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
> >>>> +    This read-only control describes the camera sensor orientation by
> >>>> +    reporting its mounting rotation in respect to the device intended usage
> >>>> +    orientation, expressed in counter clockwise degrees. The control value is
> >>>
> >>> Counter clockwise relative to what ? :-)
> >>
> >> I think it is expressed in the previous line:
> >> "mounting rotation in respect to the device intended usage
> >> orientation, expressed in counter clockwise degrees"
> >>
> >> Would you prefer to have this re-phrased as:
> >>
> >> This read-only control describes the camera sensor orientation
> >> expressed as rotation in counter clockwise degrees in respect to
> >> the device intended usage orientation.
> >>
> >> ?
> >
> > Rotation is expressed in degrees around an axis, which is itself
> > expressed as a vector. It's pretty intuitive that the rotation vector
> > should be perpendicular to the plane of the sensor (which itself should
> > be parallel to the plane of the device side on which it is mounted, as
> > expressed by the location property), but there are still two possible
> > directions for the vector, facing in the same direction as the sensor or
> > the opposite direction. Unless there's a good reason to do so, I would
> > use the same direction as the one defined by Android. I don't know what
> > direction that is though :-)
> 
> I don't think Android exposes camera rotation to the layers above the
> HAL. The stream is expected to be pre-rotated by the HAL, taking into
> account the desired target rotation of the stream itself [1].
> 
> [1] https://android.googlesource.com/platform/hardware/libhardware/+/master/include/hardware/camera3.h#1428
> 
> That said, Android seems to use "degrees counterclockwise" for rotations.

Counterclockwise seems better to me as that's coherent with
trigonometry. We still have to define the direction of the rotation axis
though :-)

-- 
Regards,

Laurent Pinchart
