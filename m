Return-Path: <linux-media+bounces-35838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93085AE719C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 23:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691593A8915
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 21:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B907258CF8;
	Tue, 24 Jun 2025 21:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiiUF6br"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62030487BF
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 21:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750800911; cv=none; b=jKVe9A8ZY/3gTgnvLs4eJBvj3B+Ih31sSLuSqyMzg3CsdhfBZyUlnP2QqQIFemg39RaPRPdOCVhHCDZecLQOEUaud7CE6zOxy9qI8hRokotkn2CW26X39EN7J5vt6TeWp5u6mPu7qV+eEqXypV41vi4Lfx9A45wBBH9IWfw17FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750800911; c=relaxed/simple;
	bh=W5th/3ZgxhcUvS4erMOAmQosw24PRH6/b1DoufEqmoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8HHUGR3NePJCWqggUt4y00otG5Sg5j96UQfpWpFSw3pvnzlePfyHprU4AWmcz9YxYh22qY4qG3sqkEp/vY26HoGansVzoW3YKUH3IULjg6TquVTZAdH/y/NVTxw+HIu7dg+tTip/n4Onsci0JrBEqjEd256S8AsU5zJnL3hRbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiiUF6br; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750800910; x=1782336910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W5th/3ZgxhcUvS4erMOAmQosw24PRH6/b1DoufEqmoA=;
  b=YiiUF6brmxOGQVK/x3rob+irg5ca5DLH4GI0g9vwRmDk3afeu3pE4kFM
   bGnFt/l1S3Z8eCtQm+XFNsnw4mqvJv75IkF9n4CPJvbIoQoUrN/QwnFsv
   7ivdHMqxgb3hdUu3sxF+OxNjfZgYDVgyutvt/C6xznn/gG2qJwlmPaFXX
   MoN1HYebM0ciMLX8SC8A+zUijL0Gf/7Ve4E8xWMh6jRY0TBqBWT0Nwcm2
   gL+9Zj0gKce9B6iJA2paD2FtyTOM5A1OzISid2hZd/vSWhe4fvCVT6h5o
   UJIhvXbLC3KX43UHFqmOJkR3/+/gD8WT0aKJ6SBdNXahBS8IT/j02nHLk
   w==;
X-CSE-ConnectionGUID: N0HzOkE0Q2KW1MKgv0Nkfg==
X-CSE-MsgGUID: 06w46hRxR5eiD4mPP/nyTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53193503"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="53193503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:35:09 -0700
X-CSE-ConnectionGUID: GLbAhyleRVWzG4U4mLwfvw==
X-CSE-MsgGUID: nO8TyqVyTaWzpHZRMSuM3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="157525090"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.131])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:35:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 646BA11F9D4;
	Wed, 25 Jun 2025 00:35:04 +0300 (EEST)
Date: Tue, 24 Jun 2025 21:35:04 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 1/6] media: v4l2: Add Renesas Camera Receiver Unit
 pixel formats
Message-ID: <aFsaCNkaY4trZKQO@kekkonen.localdomain>
References: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
 <20250623-rzg2l-cru-v5-1-1663a8c6719a@ideasonboard.com>
 <aFp9D-Ii43yNTOSx@kekkonen.localdomain>
 <20250624152033.GA20757@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624152033.GA20757@pendragon.ideasonboard.com>

Hi Laurent, Dan,

On Tue, Jun 24, 2025 at 06:20:33PM +0300, Laurent Pinchart wrote:
> On Tue, Jun 24, 2025 at 10:25:19AM +0000, Sakari Ailus wrote:
> > On Mon, Jun 23, 2025 at 03:43:18PM +0100, Daniel Scally wrote:
> > > From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > > 
> > > The Renesas Camera Receiver Unit in the RZ/V2H SoC can output RAW
> > > data captured from an image sensor without conversion to an RGB/YUV
> > > format. In that case the data are packed into 64-bit blocks, with a
> > > variable amount of padding in the most significant bits depending on
> > > the bitdepth of the data. Add new V4L2 pixel format codes for the new
> > > formats, along with documentation to describe them.
> > > 
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > > ---
> > > Changes in v5:
> > > 
> > > 	- None
> > > 
> > > Changes in v4:
> > > 
> > > 	- Removed references to "Bayer" or "srgb"
> > > 
> > > Changes in v3:
> > > 
> > > 	- Switched from bayer-order specific formats to generic RAWnn
> > > 
> > > Changes in v2:
> > > 
> > > 	- Added labels to the new formats in the documentation file
> > > 	- Added 20-bit formats
> > > ---
> > >  .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
> > >  .../userspace-api/media/v4l/pixfmt-rawnn-cru.rst   | 143 +++++++++++++++++++++
> > >  drivers/media/v4l2-core/v4l2-common.c              |   6 +
> > >  drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
> > >  include/uapi/linux/videodev2.h                     |   6 +
> > >  5 files changed, 160 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > > index ed3eb432967d9845d3d65150831d8a7f62dec994..20a8aa04330479ed4d44c8e4fc3d57db8c2e6933 100644
> > > --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > > @@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
> > >      pixfmt-srggb14
> > >      pixfmt-srggb14p
> > >      pixfmt-srggb16
> > > +    pixfmt-rawnn-cru
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..d786833d0cf355b3955fe63d85c8a211a7a4fb23
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> > > @@ -0,0 +1,143 @@
> > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > +
> > > +.. _v4l2-pix-fmt-cru-raw10:
> > > +.. _v4l2-pix-fmt-cru-raw12:
> > > +.. _v4l2-pix-fmt-cru-raw14:
> > > +.. _v4l2-pix-fmt-cru-raw20:
> > > +
> > > +**********************************************************************************************************************************
> > > +V4L2_PIX_FMT_CRU_RAW10 ('CR10'), V4L2_PIX_FMT_CRU_RAW12 ('CR12'), V4L2_PIX_FMT_CRU_RAW14 ('CR14'), V4L2_PIX_FMT_CRU_RAW20 ('CR20')
> > > +**********************************************************************************************************************************
> > 
> > Regarding naming, could these be called V4L2_PIX_FMT_RAW_CRUxx, to align
> > the naming with the new raw formats?
> > <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/userspace-api/media/v4l/pixfmt-raw-generic.html>
> > 
> > If you rebase on the metadata series, I can pick this patch in the set. My
> > objective is to get this merged in this cycle, which of course also depends
> > on review feedback.
> 
> Your set is big enough :-)
> 
> Unless I'm missing something, this patch doesn't depend on the metadata
> series. I plan to pick up Dan's next version (with the formats renamed)
> and send a pull request.

That works, too. I believe people are generally happy with the approach of
conveying the color pattern. But you still need the metadata series for
these to work I suppose?

Do you btw. intend to use these in conjunction with the usual Bayer mbus
codes? It might be useful to have helpers for this purpose but we could add
them later on (and probably not just for that).

-- 
Regards,

Sakari Ailus

