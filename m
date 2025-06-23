Return-Path: <linux-media+bounces-35584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8124AE37CD
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7670D18889E1
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CBC1FECDF;
	Mon, 23 Jun 2025 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RPrV2D53"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9F91FCFE7
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665957; cv=none; b=HKBkKLn8yQomtS5BxvjQSkuIIxKwNPuzxMlsQTBo0dpjhfmEHDlk0Yw5G8UV7r4TrcNJeqsBorhJ2bKyDS4BwUYBGKx+id34Vc3BF/wA06cPJc7q7L7PKhdHgIJzrNeE/n/3LmDw5X0LtQyUkc/pVeKSHUzkoZbgpyZiT/QhCQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665957; c=relaxed/simple;
	bh=TMN+buFz/f1o0Ih/mdYkljN9qNJpHAVIGO4qRhwXfRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uO/nHSCMDpumia6BUuDVPmWhha0mXpgus99+iounsQu0yzB1AMHDp7O921tXs9SqQm+pvnqUsLiiBhxx7Md1h5LDavwimFkyWUeQlifGsajzHGLHt1WKAdX8rKOrPoc7XQPEnXSRWM0wp+/A3iA9nV9rxXBPNtGoNVLVTHimR/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RPrV2D53; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-88.net.vodafone.it [5.90.136.88])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC03F8DB;
	Mon, 23 Jun 2025 10:05:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750665936;
	bh=TMN+buFz/f1o0Ih/mdYkljN9qNJpHAVIGO4qRhwXfRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPrV2D536G1THqG/hs0mJJCaowm5Lyydac4YjO3DfdgAmHrxKlav7ZZuO66Smh6HG
	 x10XlwCB7Sq2QAsAcmP5QpzO9NqIM4rPkSyOn4uFbcKiSRjULyAbdnDWY/ShDvZs31
	 RwoM2EaXaMVnmjQt2P/lXYNG2ssEO/yTzVCEQE34=
Date: Mon, 23 Jun 2025 10:05:48 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 18/64] media: uapi: Add V4L2_CID_COLOR_PATTERN for
 describing color patterns
Message-ID: <rolzxb7ohlgxfvyhh7mrqdxbeykn7j45gdnohy2fgiunrvlo7i@ishquwnqrwfi>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-19-sakari.ailus@linux.intel.com>
 <pczbu7ubfshbhtc5ukmxhbd4xjrmcbwnv7saqy73q2mrgta4q7@5xmultpljt7f>
 <aFkJmUOctRJPWgsg@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFkJmUOctRJPWgsg@kekkonen.localdomain>

Hi Sakari

On Mon, Jun 23, 2025 at 08:00:25AM +0000, Sakari Ailus wrote:
> Hi Jacopo,
>
> Thank you for the review.
>
> On Fri, Jun 20, 2025 at 02:10:00PM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Thu, Jun 19, 2025 at 02:57:50PM +0300, Sakari Ailus wrote:
> > > Add V4L2_CID_COLOR_PATTERN to tell the camera sensor's native color
> > > pattern.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../media/v4l/ext-ctrls-image-source.rst      | 39 +++++++++++++++++++
> > >  .../media/v4l/subdev-formats.rst              |  2 +
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
> > >  include/uapi/linux/v4l2-controls.h            |  6 +++
> > >  4 files changed, 48 insertions(+)
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > index 71f23f131f97..b19aaaffbce0 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > @@ -92,3 +92,42 @@ Image Source Control IDs
> > >      representing a gain of exactly 1.0. For example, if this default value
> > >      is reported as being (say) 128, then a value of 192 would represent
> > >      a gain of exactly 1.5.
> > > +
> > > +``V4L2_CID_COLOR_PATTERN (integer)``
> > > +    This control determines the color components and native pixel order in the
> > > +    sensor's CFA (Color Filter Array) when used in conjunction with
> > > +    :ref:`generic raw mbus codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit
> > > +    depth) <v4l2-mbus-pixelcode-generic-raw>` pixelcodes. The native pixel
> > > +    order is constant for a given device, it is not affected by cropping or
> > > +    flipping.
> > > +
> > > +    This control may only be used on V4L2 sub-devices.
> > > +
> > > +    This is a read-only control.
> > > +
> > > +    Available patterns:
> > > +
> > > +.. flat-table:: V4L2 color patterns
> > > +    :header-rows:  1
> > > +    :stub-columns: 0
> > > +    :widths:       1 2 1
> > > +
> > > +    * - Macro name
> > > +      - Synopsis
> > > +      - Value
> > > +    * - V4L2_COLOR_PATTERN_GRBG
> > > +      - Raw Bayer, with alternating lines beginning with green, red pixels and
> > > +        blue, green pixels.
> > > +      - 0
> > > +    * - V4L2_COLOR_PATTERN_RGGB
> > > +      - Raw Bayer, with alternating lines beginning with red, green pixels and
> > > +        green, blue pixels.
> > > +      - 1
> > > +    * - V4L2_COLOR_PATTERN_BGGR
> > > +      - Raw Bayer, with alternating lines beginning with blue, green pixels and
> > > +        green, red pixels.
> > > +      - 2
> > > +    * - V4L2_COLOR_PATTERN_GBRG
> > > +      - Raw Bayer, with alternating lines beginning with green, blue pixels and
> > > +        red, green pixels.
> > > +      - 3
> > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > index c06d8c83e2b8..d6d0e9a0eee1 100644
> > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > @@ -3434,6 +3434,8 @@ organization is given as an example for the first pixel only.
> > >
> > >      \endgroup
> > >
> > > +.. _v4l2-mbus-pixelcode-generic-raw:
> > > +
> > >  Generic raw formats on serial interfaces
> > >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > index dd5f06546773..8119012c2638 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > @@ -1155,6 +1155,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > >  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
> > >  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
> > >  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
> > > +	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
> > >
> > >  	/* Image processing controls */
> > >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > > index c3e6a49b2549..09e5d5bbe7f8 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -1221,6 +1221,12 @@ enum v4l2_jpeg_chroma_subsampling {
> > >  #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
> > >  #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
> > >
> > > +#define V4L2_CID_COLOR_PATTERN			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
> > > +#define V4L2_COLOR_PATTERN_GRBG			0U
> > > +#define V4L2_COLOR_PATTERN_RGGB			1U
> > > +#define V4L2_COLOR_PATTERN_BGGR			2U
> > > +#define V4L2_COLOR_PATTERN_GBRG			3U
> > > +
> >
> > Additional empty line ?
>
> Did you mean adding one more or not adding one at all?
>
> There are currently two empty lines between control classes in the header.

Uh sorry, didn't notice, I thought it was an unecessary empty line
here.

Thanks
  j

>
> >
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > Thanks
> >   j
> >
> > >
> > >  /* Image processing controls */
> > >
> > > --
> > > 2.39.5
> > >
> > >
>
> --
> Regards,
>
> Sakari Ailus

