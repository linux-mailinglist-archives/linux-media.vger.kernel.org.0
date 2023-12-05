Return-Path: <linux-media+bounces-1671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A7805554
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 14:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BCB21F21539
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 13:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F255B1E8;
	Tue,  5 Dec 2023 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FHIlajuw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18ECD7;
	Tue,  5 Dec 2023 05:01:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F33E36C;
	Tue,  5 Dec 2023 14:01:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701781272;
	bh=pqrMo45XLA+bav+5b36fJEzlNW7O+STZWXja5pScV44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FHIlajuwC/EXeMMy6kazf5uDaFG84v6dGUKjJM70PY601BbxdXKg1/6M9KqrDGwbl
	 yZMy0T/pvgibWwAjiJZr27bBJsIs9fLXHSSW83gLr4lOGbZUVYi+xfmlWXOy8kp06U
	 hwPyhEdh4ZA7b/NYpTnMfmmD9knjghIwNXPZq2R8=
Date: Tue, 5 Dec 2023 15:01:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Leon Luo <leonl@leopardimaging.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Pavel Machek <pavel@ucw.cz>, Philipp Zabel <p.zabel@pengutronix.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: v4l2-subdev: Add which field to struct
 v4l2_subdev_frame_interval
Message-ID: <20231205130159.GD22111@pendragon.ideasonboard.com>
References: <20231127111359.30315-1-laurent.pinchart@ideasonboard.com>
 <20231127111359.30315-3-laurent.pinchart@ideasonboard.com>
 <849b9333-6155-4e52-ac06-fd47d565a5c8@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <849b9333-6155-4e52-ac06-fd47d565a5c8@xs4all.nl>

Hi Hans,

On Tue, Nov 28, 2023 at 10:32:28AM +0100, Hans Verkuil wrote:
> On 27/11/2023 12:13, Laurent Pinchart wrote:
> > Due to a historical mishap, the v4l2_subdev_frame_interval structure
> > is the only part of the V4L2 subdev userspace API that doesn't contain a
> > 'which' field. This prevents trying frame intervals using the subdev
> > 'TRY' state mechanism.
> > 
> > Adding a 'which' field is simple as the structure has 8 reserved fields.
> > This would however break userspace as the field is currently set to 0,
> > corresponding to V4L2_SUBDEV_FORMAT_TRY, while the corresponding ioctls
> > currently operate on the 'ACTIVE' state. We thus need to add a new
> > subdev client cap, V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL, to indicate
> > that userspace is aware of this new field.
> > 
> > All drivers that implement the subdev .get_frame_interval() and
> > .set_frame_interval() operations are updated to return -EINVAL when
> > operating on the TRY state, preserving the current behaviour.
> > 
> > While at it, fix a bad copy&paste in the documentation of the struct
> > v4l2_subdev_frame_interval_enum 'which' field.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Fix .[gs]et_frame_interval() operation names in commit message
> > - Fix typo in commit message
> > ---
> >  .../media/v4l/vidioc-subdev-g-client-cap.rst  |  5 ++++
> >  .../v4l/vidioc-subdev-g-frame-interval.rst    | 17 ++++++++-----
> >  drivers/media/i2c/adv7180.c                   |  3 +++
> >  drivers/media/i2c/et8ek8/et8ek8_driver.c      |  6 +++++
> >  drivers/media/i2c/imx214.c                    |  3 +++
> >  drivers/media/i2c/imx274.c                    |  6 +++++
> >  drivers/media/i2c/max9286.c                   |  6 +++++
> >  drivers/media/i2c/mt9m111.c                   |  6 +++++
> >  drivers/media/i2c/mt9m114.c                   |  6 +++++
> >  drivers/media/i2c/mt9v011.c                   |  6 +++++
> >  drivers/media/i2c/mt9v111.c                   |  6 +++++
> >  drivers/media/i2c/ov2680.c                    |  3 +++
> >  drivers/media/i2c/ov5640.c                    |  6 +++++
> >  drivers/media/i2c/ov5648.c                    |  3 +++
> >  drivers/media/i2c/ov5693.c                    |  3 +++
> >  drivers/media/i2c/ov6650.c                    |  6 +++++
> >  drivers/media/i2c/ov7251.c                    |  6 +++++
> >  drivers/media/i2c/ov7670.c                    |  4 +++
> >  drivers/media/i2c/ov772x.c                    |  6 +++++
> >  drivers/media/i2c/ov8865.c                    |  3 +++
> >  drivers/media/i2c/ov9650.c                    |  6 +++++
> >  drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  6 +++++
> >  drivers/media/i2c/s5k5baf.c                   |  6 +++++
> >  drivers/media/i2c/thp7312.c                   |  6 +++++
> >  drivers/media/i2c/tvp514x.c                   |  4 +++
> >  drivers/media/v4l2-core/v4l2-subdev.c         | 25 ++++++++++++-------
> >  .../media/atomisp/i2c/atomisp-gc0310.c        |  3 +++
> >  .../media/atomisp/i2c/atomisp-gc2235.c        |  3 +++
> >  .../media/atomisp/i2c/atomisp-mt9m114.c       |  3 +++
> >  .../media/atomisp/i2c/atomisp-ov2722.c        |  3 +++
> >  drivers/staging/media/imx/imx-ic-prp.c        |  6 +++++
> >  drivers/staging/media/imx/imx-ic-prpencvf.c   |  6 +++++
> >  drivers/staging/media/imx/imx-media-csi.c     |  6 +++++
> >  drivers/staging/media/imx/imx-media-vdic.c    |  6 +++++
> >  drivers/staging/media/tegra-video/csi.c       |  3 +++
> >  include/uapi/linux/v4l2-subdev.h              | 13 ++++++++--
> >  36 files changed, 198 insertions(+), 17 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
> > index 20f12a1cc0f7..f168140ebd59 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
> > @@ -71,6 +71,11 @@ is unknown to the kernel.
> >          of 'stream' fields (referring to the stream number) with various
> >          ioctls. If this is not set (which is the default), the 'stream' fields
> >          will be forced to 0 by the kernel.
> > +    * - ``V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL``
> > +      - The client is aware of the :c:type:`v4l2_subdev_frame_interval`
> > +        ``which`` field. If this is not set (which is the default), the
> > +        ``which`` field is forced to ``V4L2_SUBDEV_FORMAT_ACTIVE`` by the
> > +        kernel.
> >  
> >  Return Value
> >  ============
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
> > index 842f962d2aea..41e0e2c8ecc3 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
> > @@ -58,8 +58,9 @@ struct
> >  contains the current frame interval as would be returned by a
> >  ``VIDIOC_SUBDEV_G_FRAME_INTERVAL`` call.
> >  
> > -Calling ``VIDIOC_SUBDEV_S_FRAME_INTERVAL`` on a subdev device node that has been
> > -registered in read-only mode is not allowed. An error is returned and the errno
> > +If the subdev device node has been registered in read-only mode, calls to
> > +``VIDIOC_SUBDEV_S_FRAME_INTERVAL`` are only valid if the ``which`` field is set
> > +to ``V4L2_SUBDEV_FORMAT_TRY``, otherwise an error is returned and the errno
> >  variable is set to ``-EPERM``.
> >  
> >  Drivers must not return an error solely because the requested interval
> > @@ -93,7 +94,11 @@ the same sub-device is not defined.
> >        - ``stream``
> >        - Stream identifier.
> >      * - __u32
> > -      - ``reserved``\ [8]
> > +      - ``which``
> > +      - Active or try frame interval, from enum
> > +	:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
> > +    * - __u32
> > +      - ``reserved``\ [7]
> >        - Reserved for future extensions. Applications and drivers must set
> >  	the array to zero.
> >  
> > @@ -114,9 +119,9 @@ EBUSY
> >  EINVAL
> >      The struct
> >      :c:type:`v4l2_subdev_frame_interval`
> > -    ``pad`` references a non-existing pad, or the pad doesn't support
> > -    frame intervals.
> > +    ``pad`` references a non-existing pad, the ``which`` field references a
> > +    non-existing frame interval, or the pad doesn't support frame intervals.
> 
> "the ``which`` field references a non-existing frame interval": that's a rather
> vague sentence.

I'm not sure I would call it vague, but it's certainly not very
understandable.

> I noticed it was probably copy-and-pasted (VIDIOC_SUBDEV_G_FMT has
> a similar phrase), but it is not clear in that documentation either.

Yes, that's where it came from.

> I expect EINVAL if 'which' is set to something other than TRY or ACTIVE, or the
> driver does not support TRY. Is that what you meant with "references a non-existing
> frame interval"?

That's what it means for all the subdev ioctls that have a 'which'
field, yes.

> The 'references a non-existing' phrase works for pads since pad is an index
> into a pad array, but that's not the case for 'which', which is effectively an
> enum, so there is no obvious indexing going on.
> 
> I think a separate patch clarifying this EINVAL description for the relevant subdev
> ioctls might be useful.

I agree. I'll include a patch in the next version of the series.

> In any case, since this just copies existing text it isn't a blocker.
> 
> >  EPERM
> >      The ``VIDIOC_SUBDEV_S_FRAME_INTERVAL`` ioctl has been called on a read-only
> > -    subdevice.
> > +    subdevice and the ``which`` field is set to ``V4L2_SUBDEV_FORMAT_ACTIVE``.

[snip]

-- 
Regards,

Laurent Pinchart

