Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8C21C3F6B
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 18:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729216AbgEDQIe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 12:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgEDQIe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 12:08:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D152C061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 09:08:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB85E4F7;
        Mon,  4 May 2020 18:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588608511;
        bh=J6/fLKWNmBz3lAuqtcK3EluqKBdCfhDmSKcJ2NpcFvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HS3r9Dwff+SJ1FA+9p5we3ilnuz9G53mBntN+81s4NvaW7SnqVkZ2CAbMlVUZuXUC
         8XZhDl6aDBetXdTX/0vBXaSsPHfMZEuYRs3WHFGL3lVzn/jLVh0wfeh5MiSQRkntg7
         85VT5V8HlVBGFGx4mOA0B1ivisrGAIWN9X/qY6rQ=
Date:   Mon, 4 May 2020 19:08:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH v2 01/34] media: uapi: v4l2-core: Add sensor ancillary
 data V4L2 fourcc type
Message-ID: <20200504160826.GF4365@pendragon.ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-2-laurent.pinchart@ideasonboard.com>
 <b4c2bb55-a93b-2035-289c-50e10282e54f@xs4all.nl>
 <CAPY8ntALc=2gWJ_hK+j3TopP_ipQ5GMRBdVpG5CQz64pcqgrPQ@mail.gmail.com>
 <55a5c2e3-4a76-57b7-910e-f7fb16181c0f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55a5c2e3-4a76-57b7-910e-f7fb16181c0f@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, May 04, 2020 at 05:32:42PM +0200, Hans Verkuil wrote:
> On 04/05/2020 16:39, Dave Stevenson wrote:
> > On Mon, 4 May 2020 at 14:48, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >> On 04/05/2020 11:25, Laurent Pinchart wrote:
> >>> From: Naushir Patuck <naush@raspberrypi.com>
> >>>
> >>> Add V4L2_META_FMT_SENSOR_DATA format 4CC.
> >>>
> >>> This new format will be used by the BCM2835 Unicam device to return
> >>> out camera sensor embedded data.
> >>
> >> out -> our (I think)
> > 
> > More like drop the word totally.
> > "used by BCM2835 Unicam device to return camera sensor embedded data"
> > 
> > The reference to Unicam probably ought to be dropped as other SoCs may
> > also be able to return embedded data.
> > 
> >>> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> >>> ---
> >>>  Documentation/media/uapi/v4l/meta-formats.rst |  1 +
> >>>  .../uapi/v4l/pixfmt-meta-sensor-data.rst      | 32 +++++++++++++++++++
> >>>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
> >>>  include/uapi/linux/videodev2.h                |  1 +
> >>>  4 files changed, 35 insertions(+)
> >>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
> >>>
> >>> diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/media/uapi/v4l/meta-formats.rst
> >>> index 74c8659ee9d6..5474086ef6f0 100644
> >>> --- a/Documentation/media/uapi/v4l/meta-formats.rst
> >>> +++ b/Documentation/media/uapi/v4l/meta-formats.rst
> >>> @@ -21,6 +21,7 @@ These formats are used for the :ref:`metadata` interface only.
> >>>
> >>>      pixfmt-meta-d4xx
> >>>      pixfmt-meta-intel-ipu3
> >>> +    pixfmt-meta-sensor-data
> >>>      pixfmt-meta-uvc
> >>>      pixfmt-meta-vsp1-hgo
> >>>      pixfmt-meta-vsp1-hgt
> >>> diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst b/Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
> >>> new file mode 100644
> >>> index 000000000000..4a67e204d08a
> >>> --- /dev/null
> >>> +++ b/Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
> >>> @@ -0,0 +1,32 @@
> >>> +.. Permission is granted to copy, distribute and/or modify this
> >>> +.. document under the terms of the GNU Free Documentation License,
> >>> +.. Version 1.1 or any later version published by the Free Software
> >>> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
> >>> +.. and no Back-Cover Texts. A copy of the license is included at
> >>> +.. Documentation/media/uapi/fdl-appendix.rst.
> >>> +..
> >>> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
> >>> +
> >>> +.. _v4l2-meta-fmt-sensor-data:
> >>> +
> >>> +***********************************
> >>> +V4L2_META_FMT_SENSOR_DATA  ('SENS')
> >>> +***********************************
> >>> +
> >>> +Sensor Ancillary Metadata
> >>> +
> >>> +Description
> >>> +===========
> >>> +
> >>> +This format describes ancillary data generated by a camera sensor and
> >>> +transmitted over a stream on the camera bus. Sensor vendors generally have their
> >>
> >> 'generally' can be dropped.
> >>
> >>> +own custom format for this ancillary data. Some vendors follow a generic
> >>> +CSI-2/SMIA embedded data format as described in the `CSI-2 specification.
> >>> +<https://mipi.org/specifications/csi-2>`_
> >>
> >> So what does this format represent? Sensor specific custom data where you need
> >> sensor-specific NDA knowledge in userspace to parse it? Or SMIA formatted sensor
> >> data?
> >>
> >> A 4cc should map to a specific data format. I understand that this is not always
> >> known, but at least the SMIA data format would need its own 4cc. I assume that the
> >> sensor driver will at least know that it produces SMIA data, right?
> >>
> >> "SENSOR_DATA" is also much too generic IMHO.
> > 
> > It's a tricky one to call as to either creating a vast number of
> > formats vs being too generic.
> > 
> > With V4L2 setting exposure as a number of lines, and analogue gain as
> > the precomputed the gain code, decoding the register set from embedded
> > data almost always requires sensor specific information.
> > 
> > SMIA defines a strict register set. Yes you could decode that using
> > the defined rules. However I'm not aware of any current sensors that
> > actually implement the SMIA spec - that pretty much died with Nokia.
> 
> OK.

Two points worth noting here:

- SMIA and SMIA++ indeed died with Nokia, but quite a few sensors are
  still at least partly compatible with the specs, as sensor vendors
  have a tendency to start development of new sensors based on older
  hardware implementations. I don't know to what extent this applies to
  metadata, or to recent sensors.

- MIPI has released the Camera Command Set (CCS) specification
  (https://www.mipi.org/specifications/camera-command-set), which is
  similar to SMIA++ for the command set part. Register offsets are
  different, but the sensor model and exposed data is similar. The
  specification standardizes the format of embedded data, and in
  practice the data we're interested in is expressed as a set of
  tag/value pairs. Tags are more or less register addresses, and I think
  vendor-specific tags are allowed (as vendor-specific registers are
  also allowed). The specification isn't widely implemented yet, but
  some sensors that are not advertized as CCS-compliant actually follow
  the specification to some extent (again with more or less variation
  depending on the sensor model).

  The CCS specification is public, you can check it out.

> > Looking slightly more generically, there is the encoding of the
> > embedded data based on the Bayer format
> > Raw 10 puts a dummy byte in every 5th byte to "match" the Bayer
> > encoding of the least sig bits for 4 pixels being packed in the 5th
> > byte.
> > Raw 12 puts a dummy byte in every 3rd byte to "match" the Bayer raw 12 format.
> > Raw 14 I have no idea over with 3 pixels in 7 bytes packing.
> > (Raw 8 has no additional bytes, and I wouldn't expect raw 16 to have
> > any either).

There are two options in RAW16, efficient packing with 2 bytes per
sample, or legacy packing with one byte per sample.

> > This could be defined as a SMIA-style packing, and is very common.
> > They also tend to use the same 0x55 0x5a 0xa5 0xaa values for
> > signalling for which registers are used number is being presented.
> > 
> > So you could reasonably define a SENSOR_DATA_RAW8, SENSOR_DATA_RAW10,
> > SENSOR_DATA_RAW12, SENSOR_DATA_RAW14, and SENSOR_DATA_RAW16 formats,
> > but userland still needs to know in which registers the actual useful
> > values are.
> > You've also now mandated support of V4L2_EVENT_SOURCE_CHANGE events,
> > as changing the Bayer format on the video node will change the
> > metadata format on the other.
> > 
> > However unless you also know the exact sensor, you still don't know
> > which register(s) relates to exposure or analogue gain. To do that
> > would imply a unique 4CC in both mediabus and V4L2 domains for every
> > sensor that varies the register configuration (families of sensors may
> > put them in the same place if you're lucky). And you'll need
> > raw10/12/14 packing variants of each based on the formats supported by
> > the sensor.
> 
> Out of curiosity: is the description of this metadata still something
> that is typically under NDA? Or is this opening up more?

It varies between sensor vendors. For CCS-compliant sensors most of the
information is in the spec. The vendor-specific registers are usually
under NDA, but some vendors release datasheets, at least for some of
their products (for instance Aptina, now On Semi, has traditionally been
more open than OmniVision). I don't know if moving towards CCS
compliance will have the undesired side effect of leaving
vendor-specific registers not documented.

> > So as I see it you have 3 levels:
> > 1) Totally generic and let userspace have to worry about the problem.
> > (1 new format)
> > 2) Semi generic raw8/10/12/14/16 packing for the data, but still
> > userspace needs to know sensor specifics to decode anything useful
> > from it (5 new formats)
> > 3) Unique formats for every sensor, and for each bit depth that that
> > sensor can produce (I'd estimate around ~20 new formats for the
> > drivers in existing mainline kernel, and probably adding 1 or 2 per
> > new driver).
> > 
> > Personally I don't see the third option as being practical, and the
> > second doesn't really add anything that significant over the first as
> > you still need to know the register setup.

I fully agree about the third option. The second option could be tempted
to provide help configuring the CSI-2 receiver and userspace decoder in
a more generic way, but in practice I believe that the related code will
know the pixel format being transmitted anyway.

However, wouldn't the CSI-2 specification allow transmitting embedded
data in a different format than pixel data ? That's probably not widely
done in practice, but if there's a chance it could happen, the second
option may be required.

> > You can't even easily take the second option and add read-only
> > controls telling userspace the registers for exposure and gain (and
> > anything else?). You'd also need the info on how many bits of each
> > register(s) are used, for exposure are all bits denoting whole lines,
> > or and do you compute the analogue gain code (this can often be
> > defined via 4 co-efficients, but that's not guaranteed). Perhaps it
> > can be described in a dozen new read only controls if you're lucky,
> > but then there's bound to be one sensor that can't.
> > 
> > So where do you draw the line between too generic and totally
> > unscalable? Over to you.
> 
> So a proper description of this format would be that it is custom sensor
> specific data stored in the first line of the image sent by the sensor.

First line or first few lines. There's also more non-image data that can
be sent by sensors, including PDAF data or statistics.

> Since this is sensor specific, how does libcamera know which sensor it is?
> It uses the sensor entity information for that?

Correct, libcamera identifies sensors, and has sensor-specific code.
Doing so through the entity name isn't ideal though, as the format of
the name has never been standardized :-/ It would have been nice to have
an entity model field, or a standardized format for the entity name.

> >>> +
> >>> +The size of the embedded buffer is defined as a single line with a pixel width
> >>> +width specified in bytes. This is obtained by a call to the
> >>
> >> "pixel width width"? Typo?
> >>
> >>> +:c:type:`VIDIOC_SUBDEV_G_FMT` ioctl on the sensor subdevice where the ``pad``
> >>> +field in :c:type:`v4l2_subdev_format` is set to 1.  Note that this size is fixed
> >>
> >> Should this description be explicit about the pad number?

Work is ongoing to try and use the proposed multiplexed streams API to
avoid exposing two pads.

> >>> +and cannot be modified with a call to :c:type:`VIDIOC_SUBDEV_S_FMT`.
> >>> +
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> index b2ef8e60ea7d..faf5a0f5eb6b 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> @@ -1346,6 +1346,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >>>       case V4L2_META_FMT_UVC:         descr = "UVC Payload Header Metadata"; break;
> >>>       case V4L2_META_FMT_D4XX:        descr = "Intel D4xx UVC Metadata"; break;
> >>>       case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> >>> +     case V4L2_META_FMT_SENSOR_DATA: descr = "Sensor Ancillary Metadata"; break;
> >>>
> >>>       default:
> >>>               /* Compressed formats */
> >>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >>> index 9817b7e2c968..a96146223843 100644
> >>> --- a/include/uapi/linux/videodev2.h
> >>> +++ b/include/uapi/linux/videodev2.h
> >>> @@ -766,6 +766,7 @@ struct v4l2_pix_format {
> >>>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
> >>>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> >>>  #define V4L2_META_FMT_VIVID    v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
> >>> +#define V4L2_META_FMT_SENSOR_DATA v4l2_fourcc('S', 'E', 'N', 'S') /* Sensor Ancillary metadata */
> >>>
> >>>  /* priv field value to indicates that subsequent fields are valid. */
> >>>  #define V4L2_PIX_FMT_PRIV_MAGIC              0xfeedcafe

-- 
Regards,

Laurent Pinchart
