Return-Path: <linux-media+bounces-41660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E17C4B41BC9
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 653611BA4A3A
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1953C2E9EB8;
	Wed,  3 Sep 2025 10:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ovck7pAY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D798326E716
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895148; cv=none; b=hMobnN8auvedzvTQ29fKN9IuXytu/R4seqgUbqqvHo1ZaLDChysKa26UGhF1vskRGGWef5SHx7UiUdopdY8roWXhvRu7nxPWVm/WfuIWdgdR7FSIRgi6PkIFK8Xio/KfhTDV9UtKaD8g510jktrkGcZJOF+P+iH2TLUjPiIgitw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895148; c=relaxed/simple;
	bh=cD3rNgCvqFjFQTzEeGxxmyKQvXFJz2m1khmuBrLnzwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trgHfQ8DzcF+AguMVOZdEmhVFQqsp6bFtIAaRhOD+5hudsd+4DFZyVGOPnW9/dpvCj9tEIMjPMyon06CIBD/efC9/2w9jrTVVpZFZTx0Qmk1elWtbBzP6evXg0iWEyS/t2bxNYK/ztl8fm9nXHD+F8MvmX09tPRn2RskHUi1n5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ovck7pAY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756895147; x=1788431147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cD3rNgCvqFjFQTzEeGxxmyKQvXFJz2m1khmuBrLnzwk=;
  b=Ovck7pAYl+Ix1LmJ4+CUJK+hL+ltKxM397qEFYM8sp4FPojAIRqE333S
   wMUhqyawTS+IBOJ+Fpc7BFSYMPj7ENkpYgfCCGdizNewYcsEXPwy1p6aS
   0HWR2JF0w7wyCIkI7nG46QRr3BNFG7QC+P/bk5yZIhf+mOiRGlT1jaVvw
   EecIFN6dscY0VdnMR81kdthC04coPKy3dpcw2THy9BfsWUMbR6qcIVt5c
   4BNCNi6mMtkGd2Z4GBzeSryKSgyGjN7q0yUgJMYqKaMoZqyxKlFMXI9+G
   1TTv5vNkR1lrOklcUa9kWvQoWIRjiIfBU9z2fbEP3o2GkXmQtc9HP7xqt
   A==;
X-CSE-ConnectionGUID: 63UooKnqQrubgbBnWiHSEg==
X-CSE-MsgGUID: jKmHx0lJSC6UvMXsSmdyTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59139767"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="59139767"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:25:40 -0700
X-CSE-ConnectionGUID: 6y9ma8Q+RGCCxjZr94y72Q==
X-CSE-MsgGUID: iPCupiocQEGZKKjWYF/XrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="175908311"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:25:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 020FA11F99F;
	Wed, 03 Sep 2025 13:25:29 +0300 (EEST)
Date: Wed, 3 Sep 2025 13:25:29 +0300
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
Subject: Re: [PATCH v11 21/66] media: v4l: uapi: Add a control for color
 pattern flipping effect
Message-ID: <aLgXmb-ANkC5JNYD@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-22-sakari.ailus@linux.intel.com>
 <b2yrfklofl6qpoekmy3r745gk4fvgdlpcdppatwwr3y34kn5zv@xusoi3rasdrc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2yrfklofl6qpoekmy3r745gk4fvgdlpcdppatwwr3y34kn5zv@xusoi3rasdrc>

Hi Jacopo,

On Mon, Sep 01, 2025 at 04:34:56PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:22PM +0300, Sakari Ailus wrote:
> > Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether
> > flipping results in a change in the sensor's color pattern, separately
> > horizontally and vertically. The information is essential for raw formats
> > when using generic raw mbus codes.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
> >  include/uapi/linux/v4l2-controls.h                     |  6 ++++++
> >  3 files changed, 18 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index 0fcd60d8c621..ef3784d1119a 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -133,3 +133,13 @@ Image Source Control IDs
> >        - Raw Bayer, with alternating lines beginning with green, blue pixels and
> >          red, green pixels.
> >        - 3
> > +
> > +``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
> 
> I still believe that having this and V4L2_CTRL_FLAG_MODIFY_LAYOUT
> might be confusing. Should sensor driver that registers H/VFLIP still
> mark those controls as V4L2_CTRL_FLAG_MODIFY_LAYOUT or should they
> implement V4L2_CID_COLOR_PATTERN_FLIP, or do both ?
> 
> Should we deprectate V4L2_CTRL_FLAG_MODIFY_LAYOUT for flip controls ?
> In this case I think the documentation of the flag should be updated.

Good question. I don't think the flag provides any useful information to
the userspace in this case, it's just a matter of UAPI consistency.

How about setting set the flag to these controls in the control framework?
I can add a patch for that.

> 
> > +    Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
> > +    V4L2_CID_VFLIP) have an effect on the pixel order of the output color
> > +    pattern. Macros ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> > +    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` define bitmasks for both bits. If
> > +    either horizontal or vertical bit is set, the readout pattern order is that
> > +    of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
> 
> I don't think
> 
> "the readout pattern order is that of the reversed readout." is very
> clear.
> 
> Providing examples might be convenient
> 
> In libcamera we have:
> 
>  * Applying a transform to an image stored in a Bayer format affects the Bayer
>  * order. For example, performing a horizontal flip on the Bayer pattern RGGB
>  * causes the RG rows of pixels to become GR, and the GB rows to become BG. The
>  * transformed image would have a GRBG order. Performing a vertical flip on the
>  * Bayer pattern RGGB causes the GB rows to come before the RG ones and the
>  * transformed image would have GBRG order. Applying both vertical and
>  * horizontal flips on the Bayer patter RGGB results in transformed images with
>  * BGGR order. The bit depth and modifiers are not affected.
> 
> Should we at least make a table for the most common Bayer CFA ?

Do you think this is an issue in practice? The text is meant to apply to
non-Bayer patterns as well.

How about simply, for the part you commented on:

the readout pattern is reversed

> 
> 
> > +    ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> > +    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> 
> Personally I don't like V4L2_COLOR_PATTERN_FLIP_BOTH much, and would
> prefer to have the two flags separate, but it might be just personal
> tastes.

I only added it once I realised I needed it in sensor drivers. We don't
have to document it here in fact.

> 
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
> > index e552f6655fd0..eb9ffdd74d32 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1233,6 +1233,12 @@ enum v4l2_jpeg_chroma_subsampling {
> >  #define V4L2_COLOR_PATTERN_BGGR			2U
> >  #define V4L2_COLOR_PATTERN_GBRG			3U
> >
> > +#define V4L2_CID_COLOR_PATTERN_FLIP		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
> > +#define V4L2_COLOR_PATTERN_FLIP_HORIZONTAL	(1U << 0)
> > +#define V4L2_COLOR_PATTERN_FLIP_VERTICAL	(1U << 1)
> > +#define V4L2_COLOR_PATTERN_FLIP_BOTH \
> > +	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
> > +
> >
> >  /* Image processing controls */
> >

-- 
Kind regards,

Sakari Ailus

