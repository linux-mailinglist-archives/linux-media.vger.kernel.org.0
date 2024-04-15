Return-Path: <linux-media+bounces-9396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A10E8A52A8
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 16:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E72922852C1
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41D274BF2;
	Mon, 15 Apr 2024 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFK46skc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4504F73500
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713189950; cv=none; b=hZRbradDdZKqI9O3FCgFS6klWAXaghszj6sQ+BKC/a3uQecOSBZhL5riMYMrRuUkAn21saz2ybck/S1qUGVq452JVnE7kcnIXYUxeZ27bvBzfje5CQjrC7MJZUEW5SP7Z75d5iB9jiGoWJ8c6hSs5nqf47Rj6UiUL33Y24N3ZDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713189950; c=relaxed/simple;
	bh=AwOdGNxp0A8/pjBUTT2ClMqE6ehsUR+x37yLy9/yxWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eH7fKUBBdH3QM70S2UEUA8X4JzI6Y1p7NE6FD2rWRSIrz4KobuaoqgzYXKPQwiL5Uxvl4KeLcp+Fx/tFEBLIRFeE+J2zQTaql70D2zQglB4ihhmxylLO0j+1aUXRhVd5wTFS7wTL26uChoT21o+g9M0LFCbLpz3VYSC9v+5TX4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFK46skc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713189945; x=1744725945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AwOdGNxp0A8/pjBUTT2ClMqE6ehsUR+x37yLy9/yxWI=;
  b=JFK46skcD5PbVDHP/bbXOv3kq47b94cEibN/Hne21NvJObAQxwWg8v5q
   apLZGUbpwCnLDFhjgRaU6sPW36RaH2D+IskV2/FMXCzw2quc5bl5Y/e6D
   k4C4XMbeOw1xyS86o1iFwSIKOClZcXNE3Ws6aoUrbFLm61IxODVdLqMNs
   AOqgk0vCrSJLNHIHc/v1ObEDfeJDfdtq9SHbV8qbZgJwrHrVAvfPbxiZB
   w7mGOPehfWoc1WL6rp5r+fc1Jc+lzZeo9i2AJ6c/jhXApVb0PcktUV5yL
   28uFoAV5GkhkgJVWTtvwwuKcFEVEnvT/QSTfCBVjjI3XAbfqujzziiwHI
   w==;
X-CSE-ConnectionGUID: +vPP3d4zSOyirb+ei6vhsg==
X-CSE-MsgGUID: hTnwPvF1RdCUep/4JGMPhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="11531867"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="11531867"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:05:43 -0700
X-CSE-ConnectionGUID: iHdO1wRwS0a0xbnah2cczw==
X-CSE-MsgGUID: hiLGtJN2TcC0CboP36qYQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26558768"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:05:39 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9509911FCCF;
	Mon, 15 Apr 2024 17:05:36 +0300 (EEST)
Date: Mon, 15 Apr 2024 14:05:36 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 05/38] media: uapi: Add generic 8-bit metadata format
 definitions
Message-ID: <Zh00MHEFsJSTFuIk@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-6-sakari.ailus@linux.intel.com>
 <20240319233701.GJ8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319233701.GJ8501@pendragon.ideasonboard.com>

On Wed, Mar 20, 2024 at 01:37:01AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> Mentioning V4L2 on the subject line would help differentiating this from
> the media bus codes.

Yes, I'll add that.

> On Wed, Mar 13, 2024 at 09:24:43AM +0200, Sakari Ailus wrote:
> > Generic 8-bit metadata formats define the in-memory data layout but not
> > the format of the data itself. The reasoning for having such formats is to
> > allow CSI-2 receiver drivers to receive and DMA drivers to write the data
> > to memory without knowing a large number of device specific formats.
> 
> s/device specific/device-specific/
> 
> > These formats may be used only in conjunction of a Media controller
> 
> s/of a/with a/

Yes...

> 
> > pipeline where the internal pad of the source sub-device defines the
> > specific format of the data (using an mbus code).
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
> >  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
> >  .../media/v4l/metafmt-generic.rst             | 304 ++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   7 +
> >  include/uapi/linux/videodev2.h                |   8 +
> >  5 files changed, 322 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index 43988516acdd..f375b820ab68 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -506,6 +506,8 @@ source pads.
> >  
> >      subdev-formats
> >  
> > +.. _subdev-routing:
> > +
> >  Streams, multiplexed media pads and internal routing
> >  ----------------------------------------------------
> >  
> > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > index 0bb61fc5bc00..919f595576b9 100644
> > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > @@ -19,3 +19,4 @@ These formats are used for the :ref:`metadata` interface only.
> >      metafmt-vsp1-hgo
> >      metafmt-vsp1-hgt
> >      metafmt-vivid
> > +    metafmt-generic
> 
> I think the intention was to keep those alphabetically sorted, even if
> vivid is out of order already.

I'll sort these while at it.

> 
> > diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > new file mode 100644
> > index 000000000000..2ebab1f895e0
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > @@ -0,0 +1,304 @@
> > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > +
> > +**************************************************************************************************************************************************************************************************************************************************************************************************************************
> > +V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O')
> > +**************************************************************************************************************************************************************************************************************************************************************************************************************************
> 
> Aren't you supposed to match the line lengths ?

Fixed.

> 
> > +
> > +
> > +Generic line-based metadata formats
> > +
> > +
> > +Description
> > +===========
> > +
> > +These generic line-based metadata formats define the memory layout of the data
> > +without defining the format or meaning of the metadata itself. These formats may
> > +only be used with a Media controller pipeline where the more specific format is
> 
> "Media Controller" or "media controller", but not a hybrid mix.

I'll use Media Controller.

> 
> > +defined in an :ref:`internal source pad <MEDIA-PAD-FL-INTERNAL>` of the source
> 
> s/defined in/reported by/

Yes...

> 
> > +sub-device. See also :ref:`source routes <subdev-routing>`.
> > +
> > +.. _v4l2-meta-fmt-generic-8:
> > +
> > +V4L2_META_FMT_GENERIC_8
> > +-----------------------
> > +
> > +The V4L2_META_FMT_GENERIC_8 format is a plain 8-bit metadata format.
> > +
> > +This format is also used on CSI-2 for both 8 bits per ``Data unit
> 
> s/Data unit/Data Unit/ (through the whole patch series)

Yes.

> 
> > +<media-glossary-data-unit>`` as well as for 16 bits per Data unit when two bytes
> > +of metadata are packed into one 16-bit Data unit.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_8.**
> > +Each cell is one byte. "M" denotes a byte of metadata.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
> > +
> > +.. flat-table::
> 
> Let's add a title here
> 
> .. flat-table:: Sample 4x2 Metadata Frame
> 
> (feel free to adjust). Same below.

Sounds good.

> 
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - M\ :sub:`10`
> > +      - M\ :sub:`20`
> > +      - M\ :sub:`30`
> > +    * - start + 4:
> > +      - M\ :sub:`01`
> > +      - M\ :sub:`11`
> > +      - M\ :sub:`21`
> > +      - M\ :sub:`31`
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-10:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_10
> > +-----------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_10 contains packed 8-bit generic metadata, 10 bits
> > +for each 8 bits of data. Every four bytes of metadata is followed by a single
> > +byte of padding. The way the data is packed follows the MIPI CSI-2 specification
> > +and the padding is defined in the MIPI CCS specification.
> 
> Doesn't really sound packed, when you have one byte of padding after
> four bytes of data :-) I understand where this "packing" is from, but
> the documentation seems confusing for people not familiar with the
> topic. How about simplifying it as follows ?
> 
> V4L2_META_FMT_GENERIC_CSI2_10 contains 8-bit generic metadata, stored with one
> padding byte after every four bytes of metadata. This is usually produced by
> CSI-2 receivers with a source that transmits MEDIA_BUS_FMT_META_10, when the
> CSI-2 receiver packs the received data as defined in the MIPI CSI-2
> specification.

The receiver doesn't pack the data, it already arrives packed on the bus.

"Packing" is also generally used term to describe such arrangements (see
e.g. the CCS spec). This also includes packed V4L2 pixel formats.

How about:

V4L2_META_FMT_GENERIC_CSI2_10 contains 8-bit generic metadata packed in 10-bit
data units, with one padding byte after every four bytes of metadata, compliant
with the MIPI CSI-2 specification. This format is typically used by CSI-2
receivers with a source that transmits MEDIA_BUS_FMT_META_10 and the CSI-2
receiver writes the received data to memory as-is.

> 
> > +
> > +This format is also used in conjunction with 20 bits per ``Data unit
> > +<media-glossary-data-unit>`` formats that pack two bytes of metadata into one
> > +Data unit.
> > +
> > +This format is little endian.
> 
> How is it little endian when it's byte-oriented ?

Some bits are still split across bytes.

> 
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
> 
> 'M' and 'x'.
> 
> These comments apply to the formats below too.

Sounds good.

> 
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - M\ :sub:`10`
> > +      - M\ :sub:`20`
> > +      - M\ :sub:`30`
> > +      - X
> > +    * - start + 5:
> > +      - M\ :sub:`01`
> > +      - M\ :sub:`11`
> > +      - M\ :sub:`21`
> > +      - M\ :sub:`31`
> > +      - X
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-12:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_12
> > +-----------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_12 contains packed 8-bit generic metadata, 12 bits
> > +for each 8 bits of data. Every four bytes of metadata is followed by a single
> > +byte of padding. The way the data is packed follows the MIPI CSI-2 specification
> > +and the padding is defined in the MIPI CCS specification.
> > +
> > +This format is also used in conjunction with 24 bits per ``Data unit
> > +<media-glossary-data-unit>`` formats that pack two bytes of metadata into one
> > +Data unit.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_12.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - M\ :sub:`10`
> > +      - X
> > +      - M\ :sub:`20`
> > +      - M\ :sub:`30`
> > +      - X
> > +    * - start + 6:
> > +      - M\ :sub:`01`
> > +      - M\ :sub:`11`
> > +      - X
> > +      - M\ :sub:`21`
> > +      - M\ :sub:`31`
> > +      - X
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-14:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_14
> > +-----------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_14 contains packed 8-bit generic metadata, 14 bits
> > +for each 8 bits of data. Every four bytes of metadata is followed by three bytes
> > +of padding. The way the data is packed follows the MIPI CSI-2 specification and
> > +the padding is defined in the MIPI CCS specification.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_14.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - M\ :sub:`10`
> > +      - M\ :sub:`20`
> > +      - M\ :sub:`30`
> > +      - X
> > +      - X
> > +      - X
> > +    * - start + 7:
> > +      - M\ :sub:`01`
> > +      - M\ :sub:`11`
> > +      - M\ :sub:`21`
> > +      - M\ :sub:`31`
> > +      - X
> > +      - X
> > +      - X
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-16:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_16
> > +-----------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_16 contains packed 8-bit generic metadata, 16 bits
> > +for each 8 bits of data. Every byte of metadata is followed by one byte of
> > +padding. The way the data is packed follows the MIPI CSI-2 specification and the
> > +padding is defined in the MIPI CCS specification.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - X
> > +      - M\ :sub:`10`
> > +      - X
> > +      - M\ :sub:`20`
> > +      - X
> > +      - M\ :sub:`30`
> > +      - X
> > +    * - start + 8:
> > +      - M\ :sub:`01`
> > +      - X
> > +      - M\ :sub:`11`
> > +      - X
> > +      - M\ :sub:`21`
> > +      - X
> > +      - M\ :sub:`31`
> > +      - X
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-20:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_20
> > +-----------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_20 contains packed 8-bit generic metadata, 20 bits
> > +for each 8 bits of data. Every byte of metadata is followed by alternating one
> > +and two bytes of padding. The way the data is packed follows the MIPI CSI-2
> > +specification and the padding is defined in the MIPI CCS specification.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_20.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - X
> > +      - M\ :sub:`10`
> > +      - X
> > +      - X
> > +      - M\ :sub:`20`
> > +      - X
> > +      - M\ :sub:`30`
> > +      - X
> > +      - X
> > +    * - start + 10:
> > +      - M\ :sub:`01`
> > +      - X
> > +      - M\ :sub:`11`
> > +      - X
> > +      - X
> > +      - M\ :sub:`21`
> > +      - X
> > +      - M\ :sub:`31`
> > +      - X
> > +      - X
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-24:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_24
> > +-----------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_24 contains packed 8-bit generic metadata, 24 bits
> > +for each 8 bits of data. Every byte of metadata is followed by two bytes of
> > +padding. The way the data is packed follows the MIPI CSI-2 specification and the
> > +padding is defined in the MIPI CCS specification.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_24.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - X
> > +      - X
> > +      - M\ :sub:`10`
> > +      - X
> > +      - X
> > +      - M\ :sub:`20`
> > +      - X
> > +      - X
> > +      - M\ :sub:`30`
> > +      - X
> > +      - X
> > +    * - start + 12:
> > +      - M\ :sub:`01`
> > +      - X
> > +      - X
> > +      - M\ :sub:`11`
> > +      - X
> > +      - X
> > +      - M\ :sub:`21`
> > +      - X
> > +      - X
> > +      - M\ :sub:`31`
> > +      - X
> > +      - X
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 33076af4dfdb..7cb6063f7056 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1452,6 +1452,13 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
> >  	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
> >  	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
> > +	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
> > +	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8b Generic Meta, 10b CSI-2"; break;
> 
> You could write "8-bit Generic Meta, 10b CSI-2" and it would still fit.
> Up to you.

I'll change it. The rest are using "x-bit" already.

> 
> > +	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8b Generic Meta, 12b CSI-2"; break;
> > +	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8b Generic Meta, 14b CSI-2"; break;
> > +	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8b Generic Meta, 16b CSI-2"; break;
> > +	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8b Generic Meta, 20b CSI-2"; break;
> > +	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8b Generic Meta, 24b CSI-2"; break;
> >  
> >  	default:
> >  		/* Compressed formats */
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index a8015e5e7fa4..6a4f8ae30186 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -839,6 +839,14 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
> >  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
> >  
> > +#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> > +
> >  /* priv field value to indicates that subsequent fields are valid. */
> >  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> >  
> 

-- 
Regards,

Sakari Ailus

