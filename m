Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95281A1A60
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 14:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbfH2MqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 08:46:20 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:60587 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfH2MqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 08:46:20 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3AB68C0014;
        Thu, 29 Aug 2019 12:46:17 +0000 (UTC)
Date:   Thu, 29 Aug 2019 14:47:49 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 02/10] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_LOCATION
Message-ID: <20190829124749.2ndghbnqhh37h3y2@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-3-jacopo@jmondi.org>
 <20190827125008.GT5054@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6vp7taqxzmb6q4jp"
Content-Disposition: inline
In-Reply-To: <20190827125008.GT5054@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6vp7taqxzmb6q4jp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Aug 27, 2019 at 03:50:08PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Aug 27, 2019 at 11:23:28AM +0200, Jacopo Mondi wrote:
> > Add documentation for the V4L2_CID_CAMERA_SENSOR_LOCATION camera
> > control. The newly added read-only control reports the camera device
> > mounting position.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../media/uapi/v4l/ext-ctrls-camera.rst       | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > index 51c1d5c9eb00..ecf151f3f0f4 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > @@ -510,6 +510,40 @@ enum v4l2_scene_mode -
> >      value down. A value of zero stops the motion if one is in progress
> >      and has no effect otherwise.
> >
> > +``V4L2_CID_CAMERA_SENSOR_LOCATION (integer)``
> > +    This read-only control describes the camera sensor location by
> > +    reporting its mounting position on the device where the camera is
> > +    installed. The control value is constant and not modifiable by software
> > +    and its value is retrieved from the firmware interface by parsing the
> > +    'location' property.
>
> How the value is known to the driver is irrelevant in this context, I
> would drop "and its value ...".
>

I recall Sakari pointed out it was not mentioned the control value
comes from firmware in review of v1. Are you both ok in removing this?

> > This control is particularly meaningful for
> > +    devices which have a well defined orientation, such as phones, laptops
> > +    and portable devices as the camera location is expressed as a position
> > +    relative to the device intended usage orientation. In example, a camera
>
> s/In example/For example/
>
> > +    sensor installed on the user-facing side of a phone, a tablet or a
> > +    laptop device is said to be installed in the ``V4L2_LOCATION_FRONT``
> > +    location while camera sensors installed on the side opposed to the
>
> s/opposed to the front one/opposite the front/
>
> > +    front one are said to be installed in the ``V4L2_LOCATION_BACK``
> > +    location. Camera sensors connected to the device by extension cables
> > +    which are freely movable regardless of the device orientation, such as
> > +    webcams and digital cameras, are said to be have
> > +    ``V4L2_LOCATION_EXTERNAL`` location.
>
> Same comment as for the DT bindings regarding cables.
>
> > +
> > +
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +
> > +    * - ``V4L2_LOCATION_FRONT``
> > +      - The camera sensor is located on the front side of the device.
> > +    * - ``V4L2_LOCATION_BACK``
> > +      - The camera sensor is located on the back side of the device.
> > +    * - ``V4L2_LOCATION_EXTERNAL``
> > +      - The camera sensor is connected by extension cables to the device and
> > +        it's freely movable.
>
> s/it's/is/
>
> > +
> > +
> > +
> >  .. [#f1]
> >     This control may be changed to a menu control in the future, if more
> >     options are required.
>
> --
> Regards,
>
> Laurent Pinchart

--6vp7taqxzmb6q4jp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1nyXUACgkQcjQGjxah
VjyvkxAAr7zMDd16mAQUVXNOplVd4R9bpWX3xBVggZFZFzQ77Wts/HLaKfXPo1Yl
ybgZuj2t6TuyH9MQtbdG+vCWD3h7e2ozNn7cR0+/n+92bGd46VgwbJXNSTBC7dxK
Iwv7UBSo0wGG4Q24DI1NJ+fwKAAmsnD8LpGQUo0oiyYjiMSzMk4u7aIjfJ3WT6MQ
9ETIbenNuQssnj/anYvO8BcZxWoQT4lwJY0MkEL1UrlQUmH1EYzVQNW3I4f30wbr
CNBXKfC9h+8ummHF2hrANOxvr30LpPmdJObz+o3mOl+LuhLpP0av7pfXbF5nSiML
3eP8oXL+ALV+YgRRAm1iTrMV9cR8TIF7wCIT76pKg0Fyunt+wdbttSYIGtzbwSf5
pVLI2bdrR9rXOD3X/KE6+KrOqobjcTvAlSEpPmsZzh3RAt9YquZC0SqOpr3b/mm3
1PR+X4EVALnNtL2vevomo9kAQLeVC2nD8pczEV2vACuF8CW8F8f1Cr+Ppg/hhqn0
jYhWcne8wJT81Dmn/MvUgrYza4DI8v76sIh2WbxfwGAXYZcIxE3atQr8iiwNrgB1
7bhvivakqVcju8xShiCZbS+gy530gVY1CWyPRE5EFGaTcoR0Trv7VCAY8MQp4C2B
Tar9rpm5k6aymVyyaqiEn+sxH5OHHCEBvCYbfBP11lQLVLtRb9g=
=uPJx
-----END PGP SIGNATURE-----

--6vp7taqxzmb6q4jp--
