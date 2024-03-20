Return-Path: <linux-media+bounces-7439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A5188158F
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 17:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3A63280EAE
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 16:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958FC55E7B;
	Wed, 20 Mar 2024 16:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFktWE8/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAE555774
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710951810; cv=none; b=CY/MQHuGiTyaQfxKGVYvfcDudD1qJe4yYRV/FunNtxNuWCI+ynKc6Y/LH5CLSaqhTjH3j4hIKawpV+87mf0kNnaPGa8Hr8jtIU17y+P27TZo0dfXAlOGL/TO3TW4tUmSQgE3kzM5pEw25oMKyRcRRkggyYANU5L5LZhxrDu+2UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710951810; c=relaxed/simple;
	bh=mhbM7/yQkHu0JUGJem58TiFNg79AyZnp/j+lqpUqmPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBx5lHyp5XSWPxSilBMv5wKbk1bM/4yARmx0EAtZBRo7DKPcxUq8fksBm31tjmVo5PxtW8f8Y/5KNfrWldZT+QnBfrUkytkbxAFHaXHZqVhs3K9l8RwRgmJQH29nifL4wId3FU6SxaBgH+vP/SKk2GKyIHv5zrBcER58Hm3RH5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFktWE8/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710951809; x=1742487809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mhbM7/yQkHu0JUGJem58TiFNg79AyZnp/j+lqpUqmPU=;
  b=dFktWE8/xokebemLRREZFA1O+w+8K9E/mevSq63nx2zJ3rFGJz0SMd4/
   6gcEgbvXMpnG0ggLfrFI1UrE/w364iKmd8f2cQ99XtNmBtwDKUe6F/sxt
   f3lV3WiFPrthyISkpTFYjgk1nkxQRbMzuW6hdmu/7ME0ZjD4YVXgHM5os
   L2tQyqVPLFik1qIddWrjC41aJJwT2M1kBbcGfxZZ6r1c04D07EU43371d
   2Ajok0wfn9uQVnKhW5Jzy1WG+gtYqNlmaYs8M37Oy/F5tSFTqoBgLtTR4
   inUTOTKpXWJGtcasRsBfX/5GQkACIqpS9ifgEANWVchPmcdGCdWUPtj5F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="8838289"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="8838289"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 09:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="18791719"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 09:23:04 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 23AAB11F853;
	Wed, 20 Mar 2024 18:23:01 +0200 (EET)
Date: Wed, 20 Mar 2024 16:23:01 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 03/38] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <ZfsNZU5Ewpp-0WZ2@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-4-sakari.ailus@linux.intel.com>
 <20240319225948.GG8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319225948.GG8501@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Mar 20, 2024 at 12:59:48AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:24:41AM +0200, Sakari Ailus wrote:
> > Add generic serial metadata mbus formats. These formats describe data
> > width and packing but not the content itself. The reason for specifying
> > such formats is that the formats as such are fairly device specific but
> > they are still handled by CSI-2 receiver drivers that should not be aware
> > of device specific formats. What makes generic metadata formats possible
> > is that these formats are parsed by software only, after capturing the
> > data to system memory.
> > 
> > Also add a definition for "Data unit" to cover what is essentially a pixel
> > but is not image data.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/glossary.rst          |   9 +
> >  .../media/v4l/subdev-formats.rst              | 258 ++++++++++++++++++
> >  include/uapi/linux/media-bus-format.h         |   9 +
> >  3 files changed, 276 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> > index ef0ab601b5bf..7078141894c5 100644
> > --- a/Documentation/userspace-api/media/glossary.rst
> > +++ b/Documentation/userspace-api/media/glossary.rst
> > @@ -25,6 +25,15 @@ Glossary
> >  
> >  	See :ref:`cec`.
> >  
> > +.. _media-glossary-data-unit:
> > +
> > +    Data unit
> > +
> > +	Unit of data transported by a bus. On parallel buses, the data unit
> > +	consists of one or more related samples while on serial buses the data
> > +	unit is logical. If the data unit is image data, it may also be called a
> > +	pixel.
> 
> I'm pretty sure nobody will be able to understand what this means, but I
> don't have a better proposal at the moment.
> 
> > +
> >      Device Driver
> >  	Part of the Linux Kernel that implements support for a hardware
> >  	component.
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index eb3cd20b0cf2..cbd475f7cae9 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -8306,3 +8306,261 @@ The following table lists the existing metadata formats.
> >  	both sides of the link and the bus format is a fixed
> >  	metadata format that is not configurable from userspace.
> >  	Width and height will be set to 0 for this format.
> > +
> > +Generic Serial Metadata Formats
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Generic serial metadata formats are used on serial buses where the actual data
> > +content is more or less device specific but the data is transmitted and received
> > +by multiple devices that do not process the data in any way, simply writing
> > +it to system memory for processing in software at the end of the pipeline.
> > +
> > +The more specific variant describing the actual data is used on the internal
> > +source pad of the originating sub-device.
> 
> Maybe this paragraph would be best added in the patch that adds the
> specific metadata formats, you could then mention one of them as an
> example:
> 
> The exact format of the data generated by the device is reported on the
> internal source pad of the originating sub-device, using one of the more
> specific metadata formats such as MEDIA_BUS_FMT_CCS_EMBEDDED.

I'd really like to get rid of the "internal source" pads as the naming is
really confusing (it's present still in this version but not in many
locations). They're sink pads after all, so I'd call them such. In a few
locations there's text that explains they do represent sources of data
within the sub-device itself.

> 
> > +
> > +"b" in an array cell signifies a byte of data, followed by the number of the bit
> 
> s/bit$/byte/

Uh, yes.

> 
> > +and finally the bit number in subscript. "X" indicates a padding bit.
> 
> We use a lower-case x in pixfmt-rgb.rst, I would do the same here. We
> also use single quotes there, turning "b" and "x" into 'b' and 'x'.

This is documentation, not C source code where we'd want to denote a single
character. Double quotes should thus be used instead.

I'll switch to lower case X.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you!

-- 
Regards,

Sakari Ailus

