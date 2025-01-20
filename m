Return-Path: <linux-media+bounces-24919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0F2A16536
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 02:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 362A13A6EB7
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 01:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAE122EE5;
	Mon, 20 Jan 2025 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XurDVzNQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507228FF;
	Mon, 20 Jan 2025 01:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737337806; cv=none; b=sJNa3JZwEB4lKxj4CreSzGgLzqHUjvrIyRvIGzJxNQEayinMbRFdfnFCPxoI0h7K32snvzMCsKRy2taSdD2wyL3Tw8fVPmu1kIkkQvAvIT04Sc/pyqkJCBz+JL1RB6BbnH/1u8BaPiL4ej5biF3+34GyW4g/XOSFUvcBKB5tOhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737337806; c=relaxed/simple;
	bh=tIAQ+WRbfhU71qAT4rI0eOeXoWqyEBTmMuq6XzgTKq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZ4T5pq5mJmjTULMPVOeocqv4/OFgWYEwXCAgFAN/uaUz8tJYYjstCvhBSYhiPLdVb5T/Lmevng8GIyZkJs2w5pslnczQVSq9U+aec40NEHPmCUO5J2pgW9/cH+JeO674Kmaom8AW1Q55CdlL95wR/YbVuU5k3sEgJ0NVnQeqDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XurDVzNQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCE2D6AF;
	Mon, 20 Jan 2025 02:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737337740;
	bh=tIAQ+WRbfhU71qAT4rI0eOeXoWqyEBTmMuq6XzgTKq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XurDVzNQ6diC1DxM7pYySIUNihycapGqGbCqYjMhHcpIKIZ0jpvXt59E783r6tEJz
	 sYddA3HHapyXFgBFqfXQoL1n3TMBnuKQpLEIFFEnxuZEjNYCrUiPCnQuwizuUeubOY
	 H61JaureXxgQMdxDgX/tPEA4b2yzKYX/dZdgpLCw=
Date: Mon, 20 Jan 2025 03:49:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: yuji2.ishikawa@toshiba.co.jp
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, nobuhiro1.iwamatsu@toshiba.co.jp,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v12 3/8] media: uapi: add visconti viif meta buffer format
Message-ID: <20250120014955.GC2467@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-4-yuji2.ishikawa@toshiba.co.jp>
 <20250102131021.GG554@pendragon.ideasonboard.com>
 <TYWPR01MB9986F8A0AC34DCE0C1F35F2692E72@TYWPR01MB9986.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYWPR01MB9986F8A0AC34DCE0C1F35F2692E72@TYWPR01MB9986.jpnprd01.prod.outlook.com>

On Mon, Jan 20, 2025 at 12:15:43AM +0000, yuji2.ishikawa@toshiba.co.jp wrote:
> On Thursday, January 2, 2025 10:10 PM, Laurent Pinchart wrote:
> > On Mon, Nov 25, 2024 at 06:21:41PM +0900, Yuji Ishikawa wrote:
> > > Adds the Toshiba Visconti VIIF specific metadata format
> > 
> > s/Adds/Add/
> > s/format/formats./
> 
> I'll fix the commit message.
> 
> > > - V4L2_META_FMT_VISCONTI_VIIF_PARAMS for ISP parameters
> > > - V4L2_META_FMT_VISCONTI_VIIF_STATS for ISP statistics
> > >
> > > Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> > 
> > Assuming the documentation of the formats in subsequent patches is fine,
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > ---
> > > Changelog v10:
> > > - add entry for V4L2_META_FMT_VISCONTI_VIIF_PARAMS
> > > - add entry for V4L2_META_FMT_VISCONTI_VIIF_STATS
> > >
> > > Changelog v11:
> > > - no change
> > >
> > > Changelog v12:
> > > - add description for meta formats at v4l2-ioctl.c
> > >
> > >  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> > >  include/uapi/linux/videodev2.h       | 4 ++++
> > >  2 files changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index 0304daa8471d..f7facb63b8ea 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1470,6 +1470,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > >  	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
> > >  	case V4L2_META_FMT_RPI_FE_CFG:  descr = "RPi PiSP FE Config format"; break;
> > >  	case V4L2_META_FMT_RPI_FE_STATS: descr = "RPi PiSP FE Statistics format"; break;
> > > +	case V4L2_META_FMT_VISCONTI_VIIF_PARAMS: descr = "Visconti ISP Parameters"; break;
> > > +	case V4L2_META_FMT_VISCONTI_VIIF_STATS: descr = "Visconti ISP Statistics"; break;
> 
> The media-ci has reported the following errors.
> Is it all right to leave these errors unfixed and keep the lines with
> the same style as other entries?

Yes, you can ignore those issues.

> # Test checkpatch:./0003-media-uapi-add-visconti-viif-meta-buffer-format.patch
> ERROR: trailing statements should be on next line
> #26: FILE: drivers/media/v4l2-core/v4l2-ioctl.c:1473:
> +case V4L2_META_FMT_VISCONTI_VIIF_PARAMS: descr = "Visconti ISP 
> +Parameters"; break;
> 
> ERROR: trailing statements should be on next line
> #27: FILE: drivers/media/v4l2-core/v4l2-ioctl.c:1474:
> +case V4L2_META_FMT_VISCONTI_VIIF_STATS: descr = "Visconti ISP 
> +Statistics"; break;
> 
> total: 2 errors, 0 warnings, 0 checks, 18 lines checked
> 
> > >  	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
> > >  	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
> > >  	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
> > > diff --git a/include/uapi/linux/videodev2.h
> > > b/include/uapi/linux/videodev2.h index a5418759e2ba..9e1f66fdf038
> > > 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -863,6 +863,10 @@ struct v4l2_pix_format {
> > >  #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
> > >  #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
> > >
> > > +/* Vendor specific - used for Visconti VIIF sub-system */
> > > +#define V4L2_META_FMT_VISCONTI_VIIF_PARAMS	v4l2_fourcc('V', 'I', 'F', 'P') /* ISP Params */
> > > +#define V4L2_META_FMT_VISCONTI_VIIF_STATS	v4l2_fourcc('V', 'I', 'F', 'S') /* ISP Stats */
> > > +
> > >  #ifdef __KERNEL__
> > >  /*
> > >   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
Regards,

Laurent Pinchart

