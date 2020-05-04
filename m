Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A891C3D47
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 16:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729078AbgEDOjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 10:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbgEDOjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 10:39:20 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087BAC061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 07:39:20 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h9so10924322wrt.0
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4M6fIvRePl34t/f3EJzxKBzpVl3YNgoAuIZQCOZy9jo=;
        b=ZqlTGzIOwb+qEBok800qr0nohetGdY52J6Hz8xmuVdmfN+fEb60TUhEL6fMgZvrbLo
         2cu3+Xa20a1tieS9qYsxlyet4r1sI9BVrUI87wzo/9z92BmZqa3CCi7m3ACfypkHJs5/
         VZ1NRdN7AdGbP28anw69DxyLb5aLXvAuLJ6NHTj7o//t3LPgWSeEdS2me61LvA7zj5oz
         JoiE+u2NZ++xmp3wQmJx/2vMs5MZPjcMSoevobJzM9NWrrVnz6Mp1OouYzQBvpBMpnQy
         NI03a11ZS8Z+IEVWAvw5oO83lgRXoLZl4Pl7TQRLn9BBo9l6XsBUOoQ8QJiPzbSNABQg
         3TaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4M6fIvRePl34t/f3EJzxKBzpVl3YNgoAuIZQCOZy9jo=;
        b=i1SVlehNYCP0SpnP8zFVEDIqcGVKXumR7xvlyyMG1PPJ93k4W6PI7SB0zSlDzBRjnV
         JqBxyqMdtYqd31hWl5c+fysmd7sQ8IM8NwNitrTqop+QQozM0vs1eERwUHadj3Q0jbnD
         xpXDbt50LMxc9jmghk6O3+vAUGaPxqtU5HP55Glz9B9ruNQYPGH2OHP5hohH82M4ahE4
         of9zD2aYjJRJyOa4W7UtdOCZgknUS521YQmepvIjI+QaZklCo5IyI0il2IsBQuosDFz5
         uh2gTshOLo7nXrAa+oBFgL6Mtst+33ahvbdQ1ZZTCPmlsbbujNf6bh3gaqj3lTGMLbQC
         8llw==
X-Gm-Message-State: AGi0PuZ6p62OdE6Q9BEe1AOu4z1xHAHf/bx+ZPprjlnClpNgbQMnue3f
        p7TkrGYIsvJyI7aKMh2LZB39HfHKtaf/ON4pBLPi4Q==
X-Google-Smtp-Source: APiQypIP6UYi/48Gk/1icXlTBdNJtx7p6IlJ2B0CIgSoP3X7sqLGNmostoDlieFn4A2Hh5vLX3u6qfpwCONQd42bf4I=
X-Received: by 2002:adf:aad4:: with SMTP id i20mr18452601wrc.47.1588603158503;
 Mon, 04 May 2020 07:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-2-laurent.pinchart@ideasonboard.com> <b4c2bb55-a93b-2035-289c-50e10282e54f@xs4all.nl>
In-Reply-To: <b4c2bb55-a93b-2035-289c-50e10282e54f@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 4 May 2020 15:39:01 +0100
Message-ID: <CAPY8ntALc=2gWJ_hK+j3TopP_ipQ5GMRBdVpG5CQz64pcqgrPQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] media: uapi: v4l2-core: Add sensor ancillary
 data V4L2 fourcc type
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Mon, 4 May 2020 at 14:48, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 04/05/2020 11:25, Laurent Pinchart wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> >
> > Add V4L2_META_FMT_SENSOR_DATA format 4CC.
> >
> > This new format will be used by the BCM2835 Unicam device to return
> > out camera sensor embedded data.
>
> out -> our (I think)

More like drop the word totally.
"used by BCM2835 Unicam device to return camera sensor embedded data"

The reference to Unicam probably ought to be dropped as other SoCs may
also be able to return embedded data.

> >
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > ---
> >  Documentation/media/uapi/v4l/meta-formats.rst |  1 +
> >  .../uapi/v4l/pixfmt-meta-sensor-data.rst      | 32 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
> >  include/uapi/linux/videodev2.h                |  1 +
> >  4 files changed, 35 insertions(+)
> >  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
> >
> > diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/media/uapi/v4l/meta-formats.rst
> > index 74c8659ee9d6..5474086ef6f0 100644
> > --- a/Documentation/media/uapi/v4l/meta-formats.rst
> > +++ b/Documentation/media/uapi/v4l/meta-formats.rst
> > @@ -21,6 +21,7 @@ These formats are used for the :ref:`metadata` interface only.
> >
> >      pixfmt-meta-d4xx
> >      pixfmt-meta-intel-ipu3
> > +    pixfmt-meta-sensor-data
> >      pixfmt-meta-uvc
> >      pixfmt-meta-vsp1-hgo
> >      pixfmt-meta-vsp1-hgt
> > diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst b/Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
> > new file mode 100644
> > index 000000000000..4a67e204d08a
> > --- /dev/null
> > +++ b/Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
> > @@ -0,0 +1,32 @@
> > +.. Permission is granted to copy, distribute and/or modify this
> > +.. document under the terms of the GNU Free Documentation License,
> > +.. Version 1.1 or any later version published by the Free Software
> > +.. Foundation, with no Invariant Sections, no Front-Cover Texts
> > +.. and no Back-Cover Texts. A copy of the license is included at
> > +.. Documentation/media/uapi/fdl-appendix.rst.
> > +..
> > +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
> > +
> > +.. _v4l2-meta-fmt-sensor-data:
> > +
> > +***********************************
> > +V4L2_META_FMT_SENSOR_DATA  ('SENS')
> > +***********************************
> > +
> > +Sensor Ancillary Metadata
> > +
> > +Description
> > +===========
> > +
> > +This format describes ancillary data generated by a camera sensor and
> > +transmitted over a stream on the camera bus. Sensor vendors generally have their
>
> 'generally' can be dropped.
>
> > +own custom format for this ancillary data. Some vendors follow a generic
> > +CSI-2/SMIA embedded data format as described in the `CSI-2 specification.
> > +<https://mipi.org/specifications/csi-2>`_
>
> So what does this format represent? Sensor specific custom data where you need
> sensor-specific NDA knowledge in userspace to parse it? Or SMIA formatted sensor
> data?
>
> A 4cc should map to a specific data format. I understand that this is not always
> known, but at least the SMIA data format would need its own 4cc. I assume that the
> sensor driver will at least know that it produces SMIA data, right?
>
> "SENSOR_DATA" is also much too generic IMHO.

It's a tricky one to call as to either creating a vast number of
formats vs being too generic.

With V4L2 setting exposure as a number of lines, and analogue gain as
the precomputed the gain code, decoding the register set from embedded
data almost always requires sensor specific information.

SMIA defines a strict register set. Yes you could decode that using
the defined rules. However I'm not aware of any current sensors that
actually implement the SMIA spec - that pretty much died with Nokia.

Looking slightly more generically, there is the encoding of the
embedded data based on the Bayer format
Raw 10 puts a dummy byte in every 5th byte to "match" the Bayer
encoding of the least sig bits for 4 pixels being packed in the 5th
byte.
Raw 12 puts a dummy byte in every 3rd byte to "match" the Bayer raw 12 format.
Raw 14 I have no idea over with 3 pixels in 7 bytes packing.
(Raw 8 has no additional bytes, and I wouldn't expect raw 16 to have
any either).
This could be defined as a SMIA-style packing, and is very common.
They also tend to use the same 0x55 0x5a 0xa5 0xaa values for
signalling for which registers are used number is being presented.

So you could reasonably define a SENSOR_DATA_RAW8, SENSOR_DATA_RAW10,
SENSOR_DATA_RAW12, SENSOR_DATA_RAW14, and SENSOR_DATA_RAW16 formats,
but userland still needs to know in which registers the actual useful
values are.
You've also now mandated support of V4L2_EVENT_SOURCE_CHANGE events,
as changing the Bayer format on the video node will change the
metadata format on the other.

However unless you also know the exact sensor, you still don't know
which register(s) relates to exposure or analogue gain. To do that
would imply a unique 4CC in both mediabus and V4L2 domains for every
sensor that varies the register configuration (families of sensors may
put them in the same place if you're lucky). And you'll need
raw10/12/14 packing variants of each based on the formats supported by
the sensor.

So as I see it you have 3 levels:
1) Totally generic and let userspace have to worry about the problem.
(1 new format)
2) Semi generic raw8/10/12/14/16 packing for the data, but still
userspace needs to know sensor specifics to decode anything useful
from it (5 new formats)
3) Unique formats for every sensor, and for each bit depth that that
sensor can produce (I'd estimate around ~20 new formats for the
drivers in existing mainline kernel, and probably adding 1 or 2 per
new driver).

Personally I don't see the third option as being practical, and the
second doesn't really add anything that significant over the first as
you still need to know the register setup.

You can't even easily take the second option and add read-only
controls telling userspace the registers for exposure and gain (and
anything else?). You'd also need the info on how many bits of each
register(s) are used, for exposure are all bits denoting whole lines,
or and do you compute the analogue gain code (this can often be
defined via 4 co-efficients, but that's not guaranteed). Perhaps it
can be described in a dozen new read only controls if you're lucky,
but then there's bound to be one sensor that can't.


So where do you draw the line between too generic and totally
unscalable? Over to you.

Regards
  Dave

> > +
> > +The size of the embedded buffer is defined as a single line with a pixel width
> > +width specified in bytes. This is obtained by a call to the
>
> "pixel width width"? Typo?
>
> > +:c:type:`VIDIOC_SUBDEV_G_FMT` ioctl on the sensor subdevice where the ``pad``
> > +field in :c:type:`v4l2_subdev_format` is set to 1.  Note that this size is fixed
>
> Should this description be explicit about the pad number?
>
> Regards,
>
>         Hans
>
> > +and cannot be modified with a call to :c:type:`VIDIOC_SUBDEV_S_FMT`.
> > +
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index b2ef8e60ea7d..faf5a0f5eb6b 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1346,6 +1346,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >       case V4L2_META_FMT_UVC:         descr = "UVC Payload Header Metadata"; break;
> >       case V4L2_META_FMT_D4XX:        descr = "Intel D4xx UVC Metadata"; break;
> >       case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> > +     case V4L2_META_FMT_SENSOR_DATA: descr = "Sensor Ancillary Metadata"; break;
> >
> >       default:
> >               /* Compressed formats */
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 9817b7e2c968..a96146223843 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -766,6 +766,7 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
> >  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> >  #define V4L2_META_FMT_VIVID    v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
> > +#define V4L2_META_FMT_SENSOR_DATA v4l2_fourcc('S', 'E', 'N', 'S') /* Sensor Ancillary metadata */
> >
> >  /* priv field value to indicates that subsequent fields are valid. */
> >  #define V4L2_PIX_FMT_PRIV_MAGIC              0xfeedcafe
> >
>
