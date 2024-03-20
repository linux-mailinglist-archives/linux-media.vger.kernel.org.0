Return-Path: <linux-media+bounces-7441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465F28815E4
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 17:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3C5B2848C3
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 16:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD80969DEA;
	Wed, 20 Mar 2024 16:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUf/4Yb8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D1110FF
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 16:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710953423; cv=none; b=B+LPp4PLhej89KJ+dy4GfZJ0sSUseOZjHFVSo0NRKawhXIDxYUg5UqX0LczufC9LoYYoyJmlPzXK2xFKo+iM8HI+vE45QlkPZ839iC1PurYVP10QmC06B9Ua5t55/L4rICdX2rnpBo4lHXUuqVVpd/jB4VQm8SQcPcmpSdUF7nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710953423; c=relaxed/simple;
	bh=SOoOk8Xejv4qaWZYgE4si4IS+8mCMG0ElOnkgSJUBcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sy81uo/1emjyJWMYRy8bdtxf99j7mlpOQz0uG9WoiEUsprbsL4sNCcNPntGFBUSq60cKzxuPVj1S5tsfZEq8hjdYfhgL5LkZPk6pkGa0K+3qm7kInAl904WYm3RVTeZu/4ONrUgPsOd2pv+rNxTNzop4lbBKCVN0yNOiboF5JFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUf/4Yb8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710953421; x=1742489421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SOoOk8Xejv4qaWZYgE4si4IS+8mCMG0ElOnkgSJUBcw=;
  b=GUf/4Yb8hNi/HX2KJmoPiztuTxLm8yMqFsHe5IeH9S4MZzYQZyU/IMR3
   r4T7ilaZdZz+313cHlzcP/RJ/hVLmWfa+BEYRPRtwOj6wmrLOesIvwsDh
   6YoqDBDK36J8smSoz0TGlHkQpjCIZyA1Gg+ysoDfo10SGnS3uT9lIO4u2
   fkXiQ4LZMekHyDNlNhIDoM5yKIEH2pV5wcTHQuj3SUH+bKDOzuAA68Q3Y
   QT7kbR1JbLJI5jWEhcVDiG9wjea2uXzAJ5gJKiqY+tnNsKeu57DMpN8db
   WP29SrU2OytZ7l4LdgfvvwlSDbep83DWWrQip+53biz49xkBIwVvwxkQT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5739270"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5739270"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 09:50:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="14117276"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 09:49:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 34F3211F853;
	Wed, 20 Mar 2024 18:49:54 +0200 (EET)
Date: Wed, 20 Mar 2024 16:49:54 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 04/38] media: uapi: Document which mbus format fields
 are valid for metadata
Message-ID: <ZfsTsjkfpOrUiF-4@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-5-sakari.ailus@linux.intel.com>
 <20240319231440.GI8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319231440.GI8501@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Mar 20, 2024 at 01:14:40AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:24:42AM +0200, Sakari Ailus wrote:
> > Now that metadata mbus formats have been added, it is necessary to define
> > which fields in struct v4l2_mbus_format are applicable to them (not many).
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/uapi/linux/v4l2-mediabus.h | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> > index 6b07b73473b5..de1d6161bf62 100644
> > --- a/include/uapi/linux/v4l2-mediabus.h
> > +++ b/include/uapi/linux/v4l2-mediabus.h
> > @@ -19,12 +19,18 @@
> >   * @width:	image width
> >   * @height:	image height
> >   * @code:	data format code (from enum v4l2_mbus_pixelcode)
> > - * @field:	used interlacing type (from enum v4l2_field)
> > - * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
> > - * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
> > - * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
> > - * @quantization: quantization of the data (from enum v4l2_quantization)
> > - * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
> > + * @field:	used interlacing type (from enum v4l2_field), zero on metadata
> > + *		mbus codes
> 
> I would write "zero for metadata formats". Up to you.

The code field determines this, and elsewhere it's called mbus code. I
prefer thus "mbus code".

> 
> Shouldn't you also update
> Documentation/userspace-api/media/v4l/subdev-formats.rst ?

Good point. I'll do that for v9, with similar additions than here.

> 
> > + * @colorspace:	colorspace of the data (from enum v4l2_colorspace), zero on
> > + *		metadata mbus codes
> > + * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding), zero
> > + *		on metadata mbus codes
> > + * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding), zero on
> > + *		metadata mbus codes
> > + * @quantization: quantization of the data (from enum v4l2_quantization), zero
> > + *		on metadata mbus codes
> > + * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func), zero
> > + *		on metadata mbus codes
> >   * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
> >   * @reserved:  reserved bytes that can be later used
> >   */

-- 
Kind regards,

Sakari Ailus

