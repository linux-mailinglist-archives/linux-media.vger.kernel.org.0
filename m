Return-Path: <linux-media+bounces-35800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8B6AE6B30
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 17:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A964E3AD3AF
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 15:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85C12E6115;
	Tue, 24 Jun 2025 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rLsZMfu+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BD32D9EFA
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 15:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778460; cv=none; b=hAw8KFC2P50vdfF8eCFoA9coCAoQKYT/WFZJtAFA8e1GJFnpy2LmbOwo76CJjPN7Sup3MLEqwAQUIqfsNSXW7yEkSDyX2c6Y8r3WN3SzfB7mta1SlXMW+2vQ7FyqVnBi0mL10ouMXa66K7Bpxew1Syjv1sHKNsJXcT6I9/Beegw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778460; c=relaxed/simple;
	bh=C3NmsLe3QNZzeeS3J0F8NoaIm+VXfYFJUVDJla8MtFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIzwx/8goCrICsZte8MBEMXXx1X6r5Wg4kVvPsygHFsTb1Fk5JKAN9JPA7JIoIwj0wvRIddQxXotVgdhppZOFab3VTF2XLqMU+8+Atx1CvoudcQzgy3kPPQ2O5Q+yzao+LNE/FNGcxI5vLOLIhtYyGJu5G8O09GN8TxGVkKoxr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rLsZMfu+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7A209C72;
	Tue, 24 Jun 2025 17:20:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750778438;
	bh=C3NmsLe3QNZzeeS3J0F8NoaIm+VXfYFJUVDJla8MtFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLsZMfu+p+2S8zRIUrnnRAiEZpodWkd2esyQ4uyX+NFx0RDp025Io+F9yRMdRplHL
	 b+oyuY7Cw0c8dxeGGvqTqPkEfZKogi+jg4QfUo4oVFilftHdguYl5SA9WxZa6GpSQn
	 f6cSJqsvIEGkm64U8nTJGqIYMmMA6xDYElq+kWfE=
Date: Tue, 24 Jun 2025 18:20:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 1/6] media: v4l2: Add Renesas Camera Receiver Unit
 pixel formats
Message-ID: <20250624152033.GA20757@pendragon.ideasonboard.com>
References: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
 <20250623-rzg2l-cru-v5-1-1663a8c6719a@ideasonboard.com>
 <aFp9D-Ii43yNTOSx@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFp9D-Ii43yNTOSx@kekkonen.localdomain>

On Tue, Jun 24, 2025 at 10:25:19AM +0000, Sakari Ailus wrote:
> On Mon, Jun 23, 2025 at 03:43:18PM +0100, Daniel Scally wrote:
> > From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > 
> > The Renesas Camera Receiver Unit in the RZ/V2H SoC can output RAW
> > data captured from an image sensor without conversion to an RGB/YUV
> > format. In that case the data are packed into 64-bit blocks, with a
> > variable amount of padding in the most significant bits depending on
> > the bitdepth of the data. Add new V4L2 pixel format codes for the new
> > formats, along with documentation to describe them.
> > 
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > ---
> > Changes in v5:
> > 
> > 	- None
> > 
> > Changes in v4:
> > 
> > 	- Removed references to "Bayer" or "srgb"
> > 
> > Changes in v3:
> > 
> > 	- Switched from bayer-order specific formats to generic RAWnn
> > 
> > Changes in v2:
> > 
> > 	- Added labels to the new formats in the documentation file
> > 	- Added 20-bit formats
> > ---
> >  .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
> >  .../userspace-api/media/v4l/pixfmt-rawnn-cru.rst   | 143 +++++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-common.c              |   6 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
> >  include/uapi/linux/videodev2.h                     |   6 +
> >  5 files changed, 160 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > index ed3eb432967d9845d3d65150831d8a7f62dec994..20a8aa04330479ed4d44c8e4fc3d57db8c2e6933 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > @@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
> >      pixfmt-srggb14
> >      pixfmt-srggb14p
> >      pixfmt-srggb16
> > +    pixfmt-rawnn-cru
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d786833d0cf355b3955fe63d85c8a211a7a4fb23
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> > @@ -0,0 +1,143 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _v4l2-pix-fmt-cru-raw10:
> > +.. _v4l2-pix-fmt-cru-raw12:
> > +.. _v4l2-pix-fmt-cru-raw14:
> > +.. _v4l2-pix-fmt-cru-raw20:
> > +
> > +**********************************************************************************************************************************
> > +V4L2_PIX_FMT_CRU_RAW10 ('CR10'), V4L2_PIX_FMT_CRU_RAW12 ('CR12'), V4L2_PIX_FMT_CRU_RAW14 ('CR14'), V4L2_PIX_FMT_CRU_RAW20 ('CR20')
> > +**********************************************************************************************************************************
> 
> Regarding naming, could these be called V4L2_PIX_FMT_RAW_CRUxx, to align
> the naming with the new raw formats?
> <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/userspace-api/media/v4l/pixfmt-raw-generic.html>
> 
> If you rebase on the metadata series, I can pick this patch in the set. My
> objective is to get this merged in this cycle, which of course also depends
> on review feedback.

Your set is big enough :-)

Unless I'm missing something, this patch doesn't depend on the metadata
series. I plan to pick up Dan's next version (with the formats renamed)
and send a pull request.

-- 
Regards,

Laurent Pinchart

