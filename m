Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB62A6003
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 06:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfICEQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 00:16:35 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54198 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfICEQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 00:16:35 -0400
Received: by mail-wm1-f66.google.com with SMTP id q19so7620806wmc.3
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2019 21:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QBFJQPZLHDeB/fzIsxa0uFNSv6BSbmPLh62kwCUCBfo=;
        b=U8tbYdnOBD/ItyiHvZXg6b3W7dnshSq+kl5i1xtT94GEaH2BwJ5hO8AtPX40CvDwoB
         3j+8A9ZB5VmkyiqvQowwn4GUGQ5A9pJzHgsBuhdqi3GwlwYJX95xhjkzSL76wD+L03YN
         V1jnLQodRjVJ2dsdTAMZQjLnXxsIyOG9z/fRbDGb14300Jm+f37wpm0PlGK6gfOl6QtZ
         Vi45sFTbiL2Aqi/Dtb+FEh2qMMqUIQ0Y6X2NJnSQ3lgs3c3YJhANiRpUh1kSb0u0ZGbB
         H4omAfqgDYWFwQQTxvh4Mq+ehx7Hrc63WtoDmNOv9qsbpEjKjkVwnd95+YzFFfepn8SK
         dFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QBFJQPZLHDeB/fzIsxa0uFNSv6BSbmPLh62kwCUCBfo=;
        b=OXnNEtYcKvwqXuQzB97LnYMBOf6fhLn2MlSaOUS73KgMYQUu+pj0ZLPh3rcFZ61gUm
         grKbdYz1Fqpld9CWdDnlTAPqfj24GQBi8+DFTsoG2MnE7z+hjSSLlkGZ2t1zq4Bfca54
         QCyL3O2MLXGQzw91vWtm/aMeMNEOJ17a8Iw4OzyoBottiUXD/ynKk9iG4NZ1hc5byA3d
         0Zr395XXFA+5cznHLYceGM7piyXDktfvkEmCUakMe2SuBolWB3Pj9TS2Sv0JnJooIoAP
         jwDJNFtpAw5SZyZLyo0+G42Sox/6SouXAkjLpX8FR+YynhlwQEmGK0CDRZXshGWLjIja
         jXsw==
X-Gm-Message-State: APjAAAVNZj0wtXjplT+n/ogCzzoZx1RaepzBbwEKyZMxHYNIa9mdwcym
        O/25EMkHI9D8nSRgKr3zGWrfMp8GwZ8N4HM9gNrw5w==
X-Google-Smtp-Source: APXvYqwkkWASIuZ9rqbGWQ6EIkdHyntAS3XW8S8fG1AsSuJcf/ixmXfkmD9Mgl1gndozyOeR3g15HMMDnyutfjiplv8=
X-Received: by 2002:a1c:4b14:: with SMTP id y20mr7082577wma.10.1567484193015;
 Mon, 02 Sep 2019 21:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190827092339.8858-1-jacopo@jmondi.org> <20190827092339.8858-4-jacopo@jmondi.org>
 <20190827125132.GU5054@pendragon.ideasonboard.com> <20190902112049.uwnawj5rm3tk4eqe@uno.localdomain>
 <20190902164315.GE12197@pendragon.ideasonboard.com>
In-Reply-To: <20190902164315.GE12197@pendragon.ideasonboard.com>
From:   Tomasz Figa <tfiga@google.com>
Date:   Tue, 3 Sep 2019 13:16:21 +0900
Message-ID: <CAAFQd5CTn_6gDZL+kxN=112JW1tRSXo2PG1-twgnYycb0uGPYA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_ROTATION
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 3, 2019 at 1:43 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jacopo,
>
> On Mon, Sep 02, 2019 at 01:20:49PM +0200, Jacopo Mondi wrote:
> > On Tue, Aug 27, 2019 at 03:51:32PM +0300, Laurent Pinchart wrote:
> > > On Tue, Aug 27, 2019 at 11:23:29AM +0200, Jacopo Mondi wrote:
> > >> Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
> > >> control. The newly added read-only control reports the camera device
> > >> mounting rotation.
> > >>
> > >> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > >> ---
> > >>  Documentation/media/uapi/v4l/ext-ctrls-camera.rst | 9 +++++++++
> > >>  1 file changed, 9 insertions(+)
> > >>
> > >> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > >> index ecf151f3f0f4..03d1c23d18f7 100644
> > >> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > >> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > >> @@ -544,6 +544,15 @@ enum v4l2_scene_mode -
> > >>
> > >>
> > >>
> > >> +``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
> > >> +    This read-only control describes the camera sensor orientation by
> > >> +    reporting its mounting rotation in respect to the device intended usage
> > >> +    orientation, expressed in counter clockwise degrees. The control value is
> > >
> > > Counter clockwise relative to what ? :-)
> >
> > I think it is expressed in the previous line:
> > "mounting rotation in respect to the device intended usage
> > orientation, expressed in counter clockwise degrees"
> >
> > Would you prefer to have this re-phrased as:
> >
> > This read-only control describes the camera sensor orientation
> > expressed as rotation in counter clockwise degrees in respect to
> > the device intended usage orientation.
> >
> > ?
>
> Rotation is expressed in degrees around an axis, which is itself
> expressed as a vector. It's pretty intuitive that the rotation vector
> should be perpendicular to the plane of the sensor (which itself should
> be parallel to the plane of the device side on which it is mounted, as
> expressed by the location property), but there are still two possible
> directions for the vector, facing in the same direction as the sensor or
> the opposite direction. Unless there's a good reason to do so, I would
> use the same direction as the one defined by Android. I don't know what
> direction that is though :-)

I don't think Android exposes camera rotation to the layers above the
HAL. The stream is expected to be pre-rotated by the HAL, taking into
account the desired target rotation of the stream itself [1].

[1] https://android.googlesource.com/platform/hardware/libhardware/+/master/include/hardware/camera3.h#1428

That said, Android seems to use "degrees counterclockwise" for rotations.

Best regards,
Tomasz
