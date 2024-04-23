Return-Path: <linux-media+bounces-9891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAFB8ADE44
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 09:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E76B828308C
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 07:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399B146B9F;
	Tue, 23 Apr 2024 07:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKBO2sVs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C444653C
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 07:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713857473; cv=none; b=QGQGQwN8+KQj4lpduMU3/ZsMEjpN1Oex3VBJjUEMs4v5DgV6Jq0K0UtQK4nIkeWid7mtAIMM4cUeeoG2ZIshHCyDDfHxPUsd6GLSTWS7sLDFjHPDHfnRAdk8Sr1BdgGn/kXJ166sjH+09BOGvpOkhEdwtwGaSVMazPrPOqzcSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713857473; c=relaxed/simple;
	bh=CcUA1uphT8yXF6ZBo8+Elsar7YohU+2K0wfzOIO3R2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rn7xsumoi/H/fqU0EVM54TpVF0QkaE1VlXnNWVQWkyP+ec2v0UXGiDr/85fWAFBq6AzKkFX6UJMtcZ9eVA4iwFwIVptTkahOo9t9acmUdMVnVNR9SyWqYHuGBq9PdLbO90mq8bqlsgbZGT0WTn2ll7gys5VUCbYshhNkFGpe6PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKBO2sVs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713857472; x=1745393472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CcUA1uphT8yXF6ZBo8+Elsar7YohU+2K0wfzOIO3R2Q=;
  b=AKBO2sVse7TFKsALUJHBzcpXxYbrKpQpQb4SZl+aX2aR/M9xbO/uaNjf
   B+NXQGXyxdPbp79Ljk+godpOWMeWvm2ATmU3kyInqWgyACFUqkBaRL6QI
   Mv1wU65/cE3HlyFWFotI6WKPjiiRk+stixIK5TNp9Sv/2ZxStES/FPLKc
   D5usrfWRA976hXAiPe3hNZBn848ZC3fcdy9T0mFDWPC5dVbLMxCCJkYx3
   auMHWctv9UfM8FXLSjDyEsTSmaflQXSefEnSOBrEreqFYSOousOPJhAuk
   Aro0TOcdKivsexEPIxiNsfrFXwBSfmp95kRAB181/kuvHp3B+1nnb8nCh
   g==;
X-CSE-ConnectionGUID: apfg/qpYRhmnSji7Z/rV1g==
X-CSE-MsgGUID: Dj+PCG4BRk21UxQkfH4ZmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20828853"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20828853"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 00:31:11 -0700
X-CSE-ConnectionGUID: 0PDEHKphTYCyi0C+ULwCwQ==
X-CSE-MsgGUID: Cqm3znGsQFmh3C/yroPy8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="29081278"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 00:31:08 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F224811FC19;
	Tue, 23 Apr 2024 10:31:04 +0300 (EEST)
Date: Tue, 23 Apr 2024 07:31:04 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 07/46] media: v4l: Support line-based metadata capture
Message-ID: <ZidjuO0yoBV8wqwF@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-8-sakari.ailus@linux.intel.com>
 <20240419163009.GG6414@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419163009.GG6414@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Apr 19, 2024 at 07:30:09PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thanks for the review.

> 
> On Tue, Apr 16, 2024 at 10:32:40PM +0300, Sakari Ailus wrote:
> > Many camera sensors, among other devices, transmit embedded data and image
> > data for each CSI-2 frame. This embedded data typically contains register
> > configuration of the sensor that has been used to capture the image data
> > of the same frame.
> > 
> > The embedded data is received by the CSI-2 receiver and has the same
> > properties as the image data, including that it is line based: it has
> > width, height and bytesperline (stride).
> > 
> > Add these fields to struct v4l2_meta_format and document them.
> > 
> > Also add V4L2_FMT_FLAG_META_LINE_BASED to tell a given format is
> > line-based i.e. these fields of struct v4l2_meta_format are valid for it.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/dev-meta.rst      | 21 +++++++++++++++++++
> >  .../media/v4l/vidioc-enum-fmt.rst             |  7 +++++++
> >  .../media/videodev2.h.rst.exceptions          |  1 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +++--
> >  include/uapi/linux/videodev2.h                | 10 +++++++++
> >  5 files changed, 42 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
> > index 0e7e1ee1471a..5eee9ab60395 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-meta.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
> > @@ -47,6 +47,12 @@ member of the ``fmt`` union as needed per the desired operation. Both drivers
> >  and applications must set the remainder of the :c:type:`v4l2_format` structure
> >  to 0.
> >  
> > +Devices that capture metadata by line have the struct v4l2_fmtdesc
> > +``V4L2_FMT_FLAG_META_LINE_BASED`` flag set for :c:func:`VIDIOC_ENUM_FMT`. Such
> > +devices can typically also :ref:`capture image data <capture>`. This primarily
> > +involves devices that receive the data from a different devices such as a camera
> > +sensor.
> > +
> >  .. c:type:: v4l2_meta_format
> >  
> >  .. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
> > @@ -65,3 +71,18 @@ to 0.
> >        - ``buffersize``
> >        - Maximum buffer size in bytes required for data. The value is set by the
> >          driver.
> > +    * - __u32
> > +      - ``width``
> > +      - Width of a line of metadata in Data Units. Valid when
> > +	:c:type`v4l2_fmtdesc` flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is set,
> > +	otherwise zero. See :c:func:`VIDIOC_ENUM_FMT`.
> > +    * - __u32
> > +      - ``height``
> > +      - Number of rows of metadata. Valid when :c:type`v4l2_fmtdesc` flag
> > +	``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
> > +	:c:func:`VIDIOC_ENUM_FMT`.
> > +    * - __u32
> > +      - ``bytesperline``
> > +      - Offset in bytes between the beginning of two consecutive lines. Valid
> > +	when :c:type`v4l2_fmtdesc` flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is
> > +	set, otherwise zero. See :c:func:`VIDIOC_ENUM_FMT`.
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > index 000c154b0f98..a439be1b15d1 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > @@ -227,6 +227,13 @@ the ``mbus_code`` field is handled differently:
> >  	The application can ask to configure the quantization of the capture
> >  	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
> >  	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
> > +    * - ``V4L2_FMT_FLAG_META_LINE_BASED``
> > +      - 0x0200
> > +      - The metadata format is line-based. In this case the ``width``,
> > +	``height`` and ``bytesperline`` fields of :c:type:`v4l2_meta_format` are
> > +	valid. The buffer consists of ``height`` lines, each having ``width``
> > +	Data Units of data and offset (in bytes) between the beginning of each
> 
> s/and offset/, and the offset/

Sounds good.

> 
> > +	two consecutive lines is ``bytesperline``.
> >  
> >  Return Value
> >  ============
> > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > index 3e58aac4ef0b..bdc628e8c1d6 100644
> > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > @@ -215,6 +215,7 @@ replace define V4L2_FMT_FLAG_CSC_XFER_FUNC fmtdesc-flags
> >  replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
> >  replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
> >  replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
> > +replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
> >  
> >  # V4L2 timecode types
> >  replace define V4L2_TC_TYPE_24FPS timecode-type
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index ae2dca7f2817..2cfc9106857a 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -343,8 +343,9 @@ static void v4l_print_format(const void *arg, bool write_only)
> >  	case V4L2_BUF_TYPE_META_OUTPUT:
> >  		meta = &p->fmt.meta;
> >  		pixelformat = meta->dataformat;
> > -		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
> > -			&pixelformat, meta->buffersize);
> > +		pr_cont(", dataformat=%p4cc, buffersize=%u, width=%u, height=%u, bytesperline=%u\n",
> > +			&pixelformat, meta->buffersize, meta->width,
> > +			meta->height, meta->bytesperline);
> >  		break;
> >  	}
> >  }
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index c7cf20b5da67..37112dfebd0c 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -877,6 +877,7 @@ struct v4l2_fmtdesc {
> >  #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
> >  #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
> >  #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> > +#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
> 
> Could the V4L2_FMT_FLAG_META_LINE_BASED flag be set by the V4L2 core for
> line-based metadata formats, instead of requiring drivers to set it ? It
> would ensure consistency.

This would essentially need to be set after driver callbacks dealing with a
format-related IOCTL has returned, drivers don't need this information as
such.

I can add a separate patch for it.

> 
> >  
> >  	/* Frame Size and frame rate enumeration */
> >  /*
> > @@ -2424,10 +2425,19 @@ struct v4l2_sdr_format {
> >   * struct v4l2_meta_format - metadata format definition
> >   * @dataformat:		little endian four character code (fourcc)
> >   * @buffersize:		maximum size in bytes required for data
> > + * @width:		number of data units of data per line (valid for line
> > + *			based formats only, see format documentation)
> > + * @height:		number of lines of data per buffer (valid for line based
> > + *			formats only)
> > + * @bytesperline:	offset between the beginnings of two adjacent lines in
> > + *			bytes (valid for line based formats only)
> >   */
> >  struct v4l2_meta_format {
> >  	__u32				dataformat;
> >  	__u32				buffersize;
> > +	__u32				width;
> > +	__u32				height;
> > +	__u32				bytesperline;
> >  } __attribute__ ((packed));
> >  
> >  /**
> 

-- 
Regards,

Sakari Ailus

