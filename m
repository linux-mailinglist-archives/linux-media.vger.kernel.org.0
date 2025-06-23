Return-Path: <linux-media+bounces-35592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53758AE38F0
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D63AD7A8110
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B434922FAF8;
	Mon, 23 Jun 2025 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7i2WrvA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C91022F74F
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668639; cv=none; b=FUVZsf+VAJhQGvKgGntDYNaGT0a81ax0SPmYvWZZZIisG/akK88X8ydmJeWDM3WPR+ZQn9+B6rSZTwJuBW11v8KFph4gTGa2RiQQcUll9Kf6t7abCbOoT8upi/otmDPz+ZvTj8KmWZn80uYsB/4xJddcKjNP6czJDSFQnxQs6tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668639; c=relaxed/simple;
	bh=FSimaLzGWUQdELj66yLiutBIOfnR4wIThw07tofRJGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJI7Er9obb7dgL1XyXIc36180fafMe4pC2sr8/d6FqDCfWdGPXesyQ4g2XUxeO9UY9WmMM/v1nR4h5bszbUskFv4gEt/Vi50xsfhAoVKEjQtgWtTUBpsNSxkL4cKrCMGr/SO3a+9tfXguQVUaSdBg/rEFa03P2Q0wtplfeGjOqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7i2WrvA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750668637; x=1782204637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FSimaLzGWUQdELj66yLiutBIOfnR4wIThw07tofRJGQ=;
  b=W7i2WrvA/MU2N5ZtJ4D3PML7grpp+kcE7MsipLKzREgfZht85fufOJCA
   S+klPvd8pJUZBev32KYtmTixXXa4cxonn6LsvsmEdZwMEl2KC2J0D3cZO
   DW1G6aPDTd0a0XCaZzvHNLQedcz7gsHCYe8pVYxZ0pyPTVQA6+dxWDQEm
   LXsTv4Jl2E4e8wPNrNb6+f08WLCYwdRMES8oV7VTk3DN9xYQFo40A/o/0
   QHIKFfH1AabnIqMUnNEjGOCCGjMf0FSh5Dr2wPv5VnzmuBZxziUfqBtL0
   MDYcOyPBVVZol2w3FtPOAPenQ0sQWNxPjPpxVUy6kPjnazjRbwC4l4+2D
   A==;
X-CSE-ConnectionGUID: VTZxE1yxSJOTtU6vF7vuow==
X-CSE-MsgGUID: /lKEX19MTACupxT3Lhaz3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="55499004"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="55499004"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:50:36 -0700
X-CSE-ConnectionGUID: 6SZHgXleSGiWC1IywDqYFg==
X-CSE-MsgGUID: wFnRxQCCTuSkTTVb4ohtvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="155548274"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:50:30 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2C7B211FC36;
	Mon, 23 Jun 2025 11:50:27 +0300 (EEST)
Date: Mon, 23 Jun 2025 08:50:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 19/64] media: v4l: uapi: Add a control for color
 pattern flipping effect
Message-ID: <aFkVUwps3_0TR4Ie@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-20-sakari.ailus@linux.intel.com>
 <6nnjs7lwgf6auy2jsa5nrutz5kd6hbzbwlazbqv2p3dypdm46d@uxkudk2rnz7b>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6nnjs7lwgf6auy2jsa5nrutz5kd6hbzbwlazbqv2p3dypdm46d@uxkudk2rnz7b>

Hi Jacopo,

On Fri, Jun 20, 2025 at 02:14:44PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Jun 19, 2025 at 02:57:51PM +0300, Sakari Ailus wrote:
> > Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether
> 
> Is this the same control you have referred to in
> "media: uapi: Add new media bus codes for generic raw formats" as
> V4L2_CID_COLOUR_PATTERN_MODIFY ?

It was intended to be, yes. I'll fix this in the other patch.

> 
> > flipping results in a change in the sensor's color pattern, separately
> > horizontally and vertically. The information is essential for raw formats
> > when using generic raw mbus codes.
> 
> Probably the distinction between horizontal and vertical changes is
> the reason why V4L2_CTRL_FLAG_MODIFY_LAYOUT can't be resused ?

Correct.

> 
> Hoever the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag is specified per-control,
> so if it applies to vflip it conveys already that the bayer ordering
> is flipped in the vertical direction (likewise for hflip).

The documentation for the flag says:

	Changing this control value may modify the layout of the buffer
	(for video devices) or the media bus format (for sub-devices).

	A typical example would be the V4L2_CID_ROTATE control.

	Note that typically controls with this flag will also set the
	V4L2_CTRL_FLAG_GRABBED flag when buffers are allocated or streaming
	is in progress since most drivers do not support changing the
	format in that case.

This seems related indeed, but layout of the buffer is not the same as the
colour pattern in the buffer. I think I'd prefer to keep the
COLOR_PATTERN_FLIP control for that.

I wonder what Hans and Laurent think.

> 
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
> >  include/uapi/linux/v4l2-controls.h                     |  5 +++++
> >  3 files changed, 17 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index b19aaaffbce0..43a62a85afb8 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -131,3 +131,13 @@ Image Source Control IDs
> >        - Raw Bayer, with alternating lines beginning with green, blue pixels and
> >          red, green pixels.
> >        - 3
> > +
> > +``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
> > +    Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
> > +    V4L2_CID_VFLIP) have an effect on the pixel order of the output color
> > +    pattern. Macros ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> > +    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` define bitmasks for both bits. If
> > +    either horizontal or vertical bit is set, the readout pattern order is that
> > +    of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
> > +    ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> > +    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 8119012c2638..9ec65998a8f7 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1156,6 +1156,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
> >  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
> >  	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
> > +	case V4L2_CID_COLOR_PATTERN_FLIP:	return "Color Pattern Flip";
> >
> >  	/* Image processing controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > @@ -1484,6 +1485,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >  		*type = V4L2_CTRL_TYPE_BITMASK;
> >  		break;
> >  	case V4L2_CID_CONFIG_MODEL:
> > +	case V4L2_CID_COLOR_PATTERN_FLIP:
> >  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >  		*type = V4L2_CTRL_TYPE_BITMASK;
> >  		break;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 09e5d5bbe7f8..740bf8544446 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1227,6 +1227,11 @@ enum v4l2_jpeg_chroma_subsampling {
> >  #define V4L2_COLOR_PATTERN_BGGR			2U
> >  #define V4L2_COLOR_PATTERN_GBRG			3U
> >
> > +#define V4L2_CID_COLOR_PATTERN_FLIP		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
> > +#define V4L2_COLOR_PATTERN_FLIP_HORIZONTAL	(1U << 0)
> > +#define V4L2_COLOR_PATTERN_FLIP_VERTICAL	(1U << 1)
> > +#define V4L2_COLOR_PATTERN_FLIP_BOTH \
> > +	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
> >
> >  /* Image processing controls */
> >

-- 
Regards,

Sakari Ailus

