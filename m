Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2C441857F0
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 02:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgCOBvf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Mar 2020 21:51:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35696 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgCOBvf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Mar 2020 21:51:35 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC19B2D6;
        Sat, 14 Mar 2020 12:44:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584186254;
        bh=tN10r2mGOybezvd5yxvvVbz2xZcUgWHw5M3M0WRovos=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZD5yt9c9NZslIYCTEVS9b3dA4tuW/i7wkdVvmzXDTr34FjpMyZN4BdcTu5lVL0N+x
         vSV+Psags/404wL1NLvgHRr9X3nUBj16BQtvfj+P7DFfhacgE/DSb6KO24bj4D4+sf
         e159x4SOt59P+9jZ5Z051wi+jyHtU8/TOnqPbvhg=
Date:   Sat, 14 Mar 2020 13:44:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH/RFC] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200314114410.GA5320@pendragon.ideasonboard.com>
References: <20200313152406.13347-1-laurent.pinchart@ideasonboard.com>
 <efd9202bc0c0a64ff88c3339fdbac5a026842700.camel@ndufresne.ca>
 <20200313172532.GI4751@pendragon.ideasonboard.com>
 <22d39f6da12cf0cc318d6e6476cf0ae851ebb477.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22d39f6da12cf0cc318d6e6476cf0ae851ebb477.camel@ndufresne.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Sat, Mar 14, 2020 at 07:26:40AM -0400, Nicolas Dufresne wrote:
> Le vendredi 13 mars 2020 à 19:25 +0200, Laurent Pinchart a écrit :
> > On Fri, Mar 13, 2020 at 01:22:26PM -0400, Nicolas Dufresne wrote:
> > > Le vendredi 13 mars 2020 à 17:24 +0200, Laurent Pinchart a écrit :
> > > > The VIDIOC_ENUM_FMT ioctl enumerates all formats supported by a video
> > > > node. For MC-centric devices, its behaviour has always been ill-defined,
> > > > with drivers implementing one of the following behaviours:
> > > > 
> > > > - No support for VIDIOC_ENUM_FMT at all
> > > > - Enumerating all formats supported by the video node, regardless of the
> > > >   configuration of the pipeline
> > > > - Enumerating formats supported by the video node for the active
> > > >   configuration of the connected subdevice
> > > > 
> > > > The first behaviour is obviously useless for applications. The second
> > > > behaviour provides the most information, but doesn't offer a way to find
> > > > what formats are compatible with a given pipeline configuration. The
> > > > third behaviour fixes that, but with the drawback that applications
> > > > can't enumerate all supported formats anymore, and have to modify the
> > > > active configuration of the pipeline to enumerate formats.
> > > > 
> > > > The situation is messy as none of the implemented behaviours are ideal,
> > > > and userspace can't predict what will happen as the behaviour is
> > > > driver-specific.
> > > > 
> > > > To fix this, let's extend the VIDIOC_ENUM_FMT with a missing capability:
> > > > enumerating pixel formats for a given media bus code. The media bus code
> > > > is passed through the v4l2_fmtdesc structure in a new mbus_code field
> > > > (repurposed from the reserved fields), and an additional flag is added
> > > > to report if the driver supports this API extension. With this
> > > > capability in place, applications can enumerate pixel formats for a
> > > > given media bus code without modifying the active configuration of the
> > > > device.
> > > > 
> > > > The current behaviour of the ioctl is preserved when the new mbus_code
> > > > field is set to 0, ensuring compatibility with existing userspace. This
> > > > behaviour is now documented as mandatory for MC-centric devices as well
> > > > as the traditional video node-centric devices. This allows applications
> > > > to query MC-centric devices for all the supported pixel formats, as well
> > > > as for the pixel formats corresponding to a given media bus code.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > Hello,
> > > > 
> > > > This API extension comes from a need I encountered when working on a
> > > > simple pipeline handler for libcamera. The pipeline handlers we have so
> > > > far are device-specific, and hardcode knowledge about the device drivers
> > > > in their implementation, such as the mapping from media bus codes to
> > > > pixel formats. For "simple" devices (currently defined as linear
> > > > pipelines with no processing, which we will probably extend to include
> > > > basic processing such as scaling and format conversion in the future),
> > > > we want to have a single pipeline handler that will auto-configure the
> > > > pipeline based on information retrieved from the kernel. I thus need an
> > > > API to extract the mapping from media bus code to pixel format.
> > > > 
> > > > Once Niklas patches that add V4L2_CAP_IO_MC land in master, I think this
> > > > patch should be rebased, and specify that this API is mandatory for
> > > > drivers that expose V4L2_CAP_IO_MC and invalid otherwise. It would be a
> > > > good step towards correctly specifying the behaviour of video nodes for
> > > > MC-centric devices.
> > > > 
> > > > I will of course provide patches for v4l2-ctrl to support this
> > > > extension, as well as for v4l2-compliance, but I would like feedback on
> > > > the API first.
> > > > 
> > > >  .../media/uapi/v4l/vidioc-enum-fmt.rst        | 40 +++++++++++++------
> > > >  drivers/media/v4l2-core/v4l2-ioctl.c          | 10 ++++-
> > > >  include/uapi/linux/videodev2.h                |  4 +-
> > > >  3 files changed, 38 insertions(+), 16 deletions(-)
> > > > 
> > > > diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > > index 8ca6ab701e4a..60cac7eef76c 100644
> > > > --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > > +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > > @@ -39,19 +39,26 @@ Arguments
> > > >  Description
> > > >  ===========
> > > >  
> > > > -To enumerate image formats applications initialize the ``type`` and
> > > > -``index`` field of struct :c:type:`v4l2_fmtdesc` and call
> > > > -the :ref:`VIDIOC_ENUM_FMT` ioctl with a pointer to this structure. Drivers
> > > > -fill the rest of the structure or return an ``EINVAL`` error code. All
> > > > -formats are enumerable by beginning at index zero and incrementing by
> > > > -one until ``EINVAL`` is returned. If applicable, drivers shall return
> > > > -formats in preference order, where preferred formats are returned before
> > > > -(that is, with lower ``index`` value) less-preferred formats.
> > > > -
> > > > -.. note::
> > > > -
> > > > -   After switching input or output the list of enumerated image
> > > > -   formats may be different.
> > > > +To enumerate image formats applications initialize the ``type``, ``index`` and
> > > > +``mbus_code`` fields of struct :c:type:`v4l2_fmtdesc` and call the
> > > 
> > > This re-phrase suggests that not setting the mbus_code is a fault,
> > > which pretty much all existing userspace code will do. It's of course
> > > set to zero, as it was a reserved field before, but I'd like that text
> > > to be improved. For someone programming a video device, the presence of
> > > a mbus_code parameter will be very confusing, as the developer may not
> > > even be aware what an mbus is.
> > 
> > I agree with you, I'll improve this.
> > 
> > > > +:ref:`VIDIOC_ENUM_FMT` ioctl with a pointer to this structure. Drivers fill the
> > > > +rest of the structure or return an ``EINVAL`` error code. All formats are
> > > > +enumerable by beginning at index zero and incrementing by one until ``EINVAL``
> > > > +is returned. If applicable, drivers shall return formats in preference order,
> > > > +where preferred formats are returned before (that is, with lower ``index``
> > > > +value) less-preferred formats.
> > > > +
> > > > +If the ``mbus_code`` is set to zero, drivers shall enumerate all image formats
> > > > +supported by the device. For video node-centric devices, the enumerated formats
> > > > +may depend on the active input or output of the device. For MC-centric devices,
> > > > +the enumerated formats shall not depend on the active configuration of the
> > > > +device.
> > > > +
> > > > +If the ``mbus_code`` field is set to a non-zero value, drivers shall restrict
> > > > +enumeration to only the image formats that can be produced from that media bus
> > > > +code, and set the ``V4L2_FMT_FLAG_MBUS_CODE`` flag in the ``flags`` field. The
> > > > +enumerated imge formats shall not depend on the active configuration of the
> > > 
> > > s/imge/image
> > > 
> > > > +device. Enumeration shall otherwise operate as previously described.
> > > 
> > > I think we need to step back a little. This is not only a problem for
> > > MC subdevices, it's a generic problem. As an example, in codecs, the
> > > enumeration of CAPTURE format is restricted by the configuration on the
> > > OTUPUT queue. As we must have a default configuration on the OUTPUT
> > > queue, it means it's not really possible to sort out what the HW can do
> > > globally. This one can be solved by setting formata on the OUTPUT and
> > > enumerating, but seems rather difficult.
> > > 
> > > So I think if that mechanism was slightly more generic, this could be
> > > solved elsewhere too. That being said, maybe a format flag is entirely
> > > sufficient for video nodes.
> > 
> > Do you have an idea on how this mechanism could be made more generic ?
> 
> So thinking about it, the case of M2M Encoder/Decoder (other M2M have
> no spec in this regard), is slightly simpler. Most of the time we only
> want the subset and, to be fair, we manage to make working userspace
> thus far with that. And the second use-case is full list (regardless of
> the other queue configuration), which could serve in early filtering
> when a CODEC is being elected for the detected bitstream. Even though
> we don't have a spec for that yet, it would be even more useful for M2M
> colorspace converter.
> 
> Looking at the API, just like you mbus_code, we'd need a parameter to
> tell that we want a full list. But mbus_code is not reusable. Maybe as
> mbus_code does not make sense in this case we could opt for a anonymous
> union and maybe add some enum_flags (or some better name) in the
> future, and leave you case as "specialized".

There's a flags field in v4l2_fmtdesc, maybe you could define a new
V4L2_FMT_FLAG_FULL for this use case ? This wouldn't require turning
mbus_code into a union.

The thing that bothers me a bit is that it's not possible, with M2M
devices, to enumerate formats on the dependent side of the device
without modifying the active format on the other side first. There's no
TRY semantics that can span both sides. It would be possible to reuse
the mechanism I propose here, setting mbus_code to a pixel format (we
would make it a union then) for a VIDIOC_ENUM_FMT call on the dependent
side would enumerate only the pixel formats compatible with the give
pixel format on the other side. However, this won't give you the full
list, so we'd still need a separate API (such as V4L2_FMT_FLAG_FULL) to
enumerate everything, as we can't change the default behaviour to
enumerate everything without breaking userspace.

How did we design all this so badly ? :-(

> > > >  
> > > >  
> > > >  .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> > > > @@ -145,6 +152,13 @@ formats in preference order, where preferred formats are returned before
> > > >  	parameters are detected. This flag can only be used in combination
> > > >  	with the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to
> > > >  	compressed formats only. It is also only applies to stateful codecs.
> > > > +    * - ``V4L2_FMT_FLAG_MBUS_CODE``
> > > > +      - 0x0010
> > > > +      - The ``mbus_code`` field has been taken into account and only formats
> > > > +        compatible with the supplied media bus code are enumerated. This flag
> > > > +        shall only be  set by drivers, and only when ``mbus_code`` is not zero.
> > > 
> > > s/  / /
> > > (double space)
> > > 
> > > > +        Applications may read the flag to check if code-aware enumeration is
> > > > +        supported by the driver.
> > > >  
> > > >  
> > > >  Return Value
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > index aaf83e254272..2d635a5f0797 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > @@ -264,12 +264,13 @@ static void v4l_print_fmtdesc(const void *arg, bool write_only)
> > > >  {
> > > >  	const struct v4l2_fmtdesc *p = arg;
> > > >  
> > > > -	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, description='%.*s'\n",
> > > > +	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, mbus_code=0x%04x, description='%.*s'\n",
> > > >  		p->index, prt_names(p->type, v4l2_type_names),
> > > >  		p->flags, (p->pixelformat & 0xff),
> > > >  		(p->pixelformat >>  8) & 0xff,
> > > >  		(p->pixelformat >> 16) & 0xff,
> > > >  		(p->pixelformat >> 24) & 0xff,
> > > > +		p->mbus_code,
> > > >  		(int)sizeof(p->description), p->description);
> > > >  }
> > > >  
> > > > @@ -1416,12 +1417,17 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
> > > >  	struct video_device *vdev = video_devdata(file);
> > > >  	struct v4l2_fmtdesc *p = arg;
> > > >  	int ret = check_fmt(file, p->type);
> > > > +	u32 mbus_code;
> > > >  	u32 cap_mask;
> > > >  
> > > >  	if (ret)
> > > >  		return ret;
> > > >  	ret = -EINVAL;
> > > >  
> > > > +	mbus_code = p->mbus_code;
> > > > +	CLEAR_AFTER_FIELD(p, type);
> > > > +	p->mbus_code = mbus_code;
> > > > +
> > > >  	switch (p->type) {
> > > >  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > > >  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> > > > @@ -2703,7 +2709,7 @@ DEFINE_V4L_STUB_FUNC(dv_timings_cap)
> > > >  
> > > >  static const struct v4l2_ioctl_info v4l2_ioctls[] = {
> > > >  	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
> > > > -	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, INFO_FL_CLEAR(v4l2_fmtdesc, type)),
> > > > +	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
> > > >  	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
> > > >  	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
> > > >  	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > > index 5f9357dcb060..b13e54e196e3 100644
> > > > --- a/include/uapi/linux/videodev2.h
> > > > +++ b/include/uapi/linux/videodev2.h
> > > > @@ -777,13 +777,15 @@ struct v4l2_fmtdesc {
> > > >  	__u32               flags;
> > > >  	__u8		    description[32];   /* Description string */
> > > >  	__u32		    pixelformat;       /* Format fourcc      */
> > > > -	__u32		    reserved[4];
> > > > +	__u32		    mbus_code;		/* Media bus code    */
> > > > +	__u32		    reserved[3];
> > > >  };
> > > >  
> > > >  #define V4L2_FMT_FLAG_COMPRESSED		0x0001
> > > >  #define V4L2_FMT_FLAG_EMULATED			0x0002
> > > >  #define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM	0x0004
> > > >  #define V4L2_FMT_FLAG_DYN_RESOLUTION		0x0008
> > > > +#define V4L2_FMT_FLAG_MBUS_CODE			0x0010
> > > >  
> > > >  	/* Frame Size and frame rate enumeration */
> > > >  /*

-- 
Regards,

Laurent Pinchart
