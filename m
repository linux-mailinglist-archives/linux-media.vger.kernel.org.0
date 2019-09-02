Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 336D6A5B7C
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 18:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbfIBQnX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 12:43:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36006 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbfIBQnX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 12:43:23 -0400
Received: from pendragon.ideasonboard.com (231.125-247-81.adsl-dyn.isp.belgacom.be [81.247.125.231])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5ACCD303;
        Mon,  2 Sep 2019 18:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567442601;
        bh=011huPWE3gy5ElkVozrTAN74zDmGfrGwtGsGuqtUSLE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oppWfumELCdrwXhI56n35lInExdxFiB0TqJKontZMRQ6KZzpvruizFxSr+Agsx2ZU
         DAbBrE7XwqTHFKbNk4zyCuKKbOp4PIJfiH65UwfdMdVvIRAVUBv980wogYiTgHNvEE
         V6ZDM2q8kOFWpOdLJKKM7fNdoqbKAn+3k1wRaP2o=
Date:   Mon, 2 Sep 2019 19:43:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 03/10] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_ROTATION
Message-ID: <20190902164315.GE12197@pendragon.ideasonboard.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-4-jacopo@jmondi.org>
 <20190827125132.GU5054@pendragon.ideasonboard.com>
 <20190902112049.uwnawj5rm3tk4eqe@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190902112049.uwnawj5rm3tk4eqe@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Sep 02, 2019 at 01:20:49PM +0200, Jacopo Mondi wrote:
> On Tue, Aug 27, 2019 at 03:51:32PM +0300, Laurent Pinchart wrote:
> > On Tue, Aug 27, 2019 at 11:23:29AM +0200, Jacopo Mondi wrote:
> >> Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
> >> control. The newly added read-only control reports the camera device
> >> mounting rotation.
> >>
> >> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >> ---
> >>  Documentation/media/uapi/v4l/ext-ctrls-camera.rst | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >> index ecf151f3f0f4..03d1c23d18f7 100644
> >> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >> @@ -544,6 +544,15 @@ enum v4l2_scene_mode -
> >>
> >>
> >>
> >> +``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
> >> +    This read-only control describes the camera sensor orientation by
> >> +    reporting its mounting rotation in respect to the device intended usage
> >> +    orientation, expressed in counter clockwise degrees. The control value is
> >
> > Counter clockwise relative to what ? :-)
> 
> I think it is expressed in the previous line:
> "mounting rotation in respect to the device intended usage
> orientation, expressed in counter clockwise degrees"
> 
> Would you prefer to have this re-phrased as:
> 
> This read-only control describes the camera sensor orientation
> expressed as rotation in counter clockwise degrees in respect to
> the device intended usage orientation.
> 
> ?

Rotation is expressed in degrees around an axis, which is itself
expressed as a vector. It's pretty intuitive that the rotation vector
should be perpendicular to the plane of the sensor (which itself should
be parallel to the plane of the device side on which it is mounted, as
expressed by the location property), but there are still two possible
directions for the vector, facing in the same direction as the sensor or
the opposite direction. Unless there's a good reason to do so, I would
use the same direction as the one defined by Android. I don't know what
direction that is though :-)

> >> +    constant and not modifiable by software and its value is retrieved from the
> >> +    firmware interface by parsing the 'rotation' property. Typical values are 0
> >> +    degrees for upright mounted sensors and 180 degrees for sensors mounted
> >> +    upside down.
> >
> > Same comment as for 02/10 regarding how the value is known to the
> > driver.
> >
> >> +
> >>  .. [#f1]
> >>     This control may be changed to a menu control in the future, if more
> >>     options are required.

-- 
Regards,

Laurent Pinchart
