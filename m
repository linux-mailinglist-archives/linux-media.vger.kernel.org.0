Return-Path: <linux-media+bounces-9892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DF38ADE4D
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 09:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F057281E6A
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 07:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FE84779D;
	Tue, 23 Apr 2024 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vTKMqtVc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F4A1CAA2
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713857575; cv=none; b=Oca6QtoDpY2E1IQG2kcESE2IMegfuRV45l5hWCram0ZLfiErj4xOnwsu5xmvPEiK3yHZkpArCHvL4SB9CNa/dlIsT4D8NTNnh+CxsMxR+2ifrfJGQ8EbZ3irXXE8yzs+/p0I9xZu7CSmTwD8/g3bu7fGjJXwWKcIN5bbNACbcPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713857575; c=relaxed/simple;
	bh=arMuzJiVLRHymCO0xUIn8E981Vmd34RWGgl/3Dn0mVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVRDRFlbsGR7mzecivsoraFuIImaw9hYzbeTdHuv5oJhKZlLQTi73e42G9qNmji7XC+KYUq3pX3SRQX58AoiDAQI8LkqpicanUuzKZ/rbR4YvQzBAcAydW69EZ5KcgXLQqvGM4KQyEEGLD8xaATvLY3jDyhqbBXNLEwGFpZ4YXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vTKMqtVc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-16-29-nat.elisa-mobile.fi [85.76.16.29])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D446E4;
	Tue, 23 Apr 2024 09:31:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713857515;
	bh=arMuzJiVLRHymCO0xUIn8E981Vmd34RWGgl/3Dn0mVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vTKMqtVc540P6D/EmjEYSwMheyyA2afjaLqin9MDBqp4U0QwJm0jG6QJv9egVzecp
	 T89PvTS1ngPSvkG7vtnRP6USU2MmYhO5DfC9cCwMUBN2pbr21pK/32mnc4+JFbBSx5
	 Fh8RhlwKgxfa0wAoOhpb7jcN77iw5ySxtKPUpBWY=
Date: Tue, 23 Apr 2024 10:32:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 06/46] media: uapi: v4l: Add generic 8-bit metadata
 format definitions
Message-ID: <20240423072515.GA2134@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-7-sakari.ailus@linux.intel.com>
 <20240419162619.GF6414@pendragon.ideasonboard.com>
 <Ziddmv3dSvEr0SDp@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ziddmv3dSvEr0SDp@kekkonen.localdomain>

Hi Sakari,

On Tue, Apr 23, 2024 at 07:04:58AM +0000, Sakari Ailus wrote:
> On Fri, Apr 19, 2024 at 07:26:19PM +0300, Laurent Pinchart wrote:
> > On Tue, Apr 16, 2024 at 10:32:39PM +0300, Sakari Ailus wrote:
> > > Generic 8-bit metadata formats define the in-memory data layout but not
> > > the format of the data itself. The reasoning for having such formats is to
> > > allow CSI-2 receiver drivers to receive and DMA drivers to write the data
> > > to memory without knowing a large number of device-specific formats.
> > > 
> > > These formats may be used only in conjunction with a Media controller
> > 
> > "Media Controller" or "media controller"
> 
> Yes.
> 
> > > pipeline where the internal pad of the source sub-device defines the
> > > specific format of the data (using an mbus code).
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
> > >  .../userspace-api/media/v4l/meta-formats.rst  |   3 +-
> > >  .../media/v4l/metafmt-generic.rst             | 328 ++++++++++++++++++
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          |   7 +
> > >  include/uapi/linux/videodev2.h                |   8 +
> > >  5 files changed, 347 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > index 43988516acdd..f375b820ab68 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > @@ -506,6 +506,8 @@ source pads.
> > >  
> > >      subdev-formats
> > >  
> > > +.. _subdev-routing:
> > > +
> > >  Streams, multiplexed media pads and internal routing
> > >  ----------------------------------------------------
> > >  
> > > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > index 0bb61fc5bc00..c23aac823d2c 100644
> > > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > @@ -13,9 +13,10 @@ These formats are used for the :ref:`metadata` interface only.
> > >      :maxdepth: 1
> > >  
> > >      metafmt-d4xx
> > > +    metafmt-generic
> > >      metafmt-intel-ipu3
> > >      metafmt-rkisp1
> > >      metafmt-uvc
> > > +    metafmt-vivid
> > >      metafmt-vsp1-hgo
> > >      metafmt-vsp1-hgt
> > > -    metafmt-vivid
> > > diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > > new file mode 100644
> > > index 000000000000..cba34be64dfe
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > > @@ -0,0 +1,328 @@
> > > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > > +
> > > +********************************************************************************************************************************************************************************************************************************************************************************
> > > +V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O')
> > > +********************************************************************************************************************************************************************************************************************************************************************************
> > > +
> > > +
> > > +Generic line-based metadata formats
> > > +
> > > +
> > > +Description
> > > +===========
> > > +
> > > +These generic line-based metadata formats define the memory layout of the data
> > > +without defining the format or meaning of the metadata itself. These formats may
> > > +only be used with a Media Controller pipeline where the more specific format is
> > > +reported by an :ref:`internal sink pad <MEDIA-PAD-FL-INTERNAL>` of the source
> > > +sub-device. See also :ref:`source routes <subdev-routing>`.
> > > +
> > > +.. _v4l2-meta-fmt-generic-8:
> > > +
> > > +V4L2_META_FMT_GENERIC_8
> > > +-----------------------
> > > +
> > > +The V4L2_META_FMT_GENERIC_8 format is a plain 8-bit metadata format.
> > > +
> > > +This format is also used on CSI-2 for both 8 bits per ``Data Unit
> > > +<media-glossary-data-unit>`` as well as for 16 bits per Data Unit when two bytes
> > > +of metadata are packed into one 16-bit Data Unit.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_8.**
> > > +Each cell is one byte. "M" denotes a byte of metadata.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
> > > +
> > > +.. flat-table:: Sample 4x2 Metadata Frame
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - M\ :sub:`10`
> > > +      - M\ :sub:`20`
> > > +      - M\ :sub:`30`
> > > +    * - start + 4:
> > > +      - M\ :sub:`01`
> > > +      - M\ :sub:`11`
> > > +      - M\ :sub:`21`
> > > +      - M\ :sub:`31`
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-10:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_10
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_10 contains 8-bit generic metadata packed in 10-bit
> > > +Data Units, with one padding byte after every four bytes of metadata. This
> > > +format is typically used by CSI-2 receivers with a source that transmits
> > > +MEDIA_BUS_FMT_META_10 and the CSI-2 receiver writes the received data to memory
> > > +as-is.
> > > +
> > > +The packing of the data follows the MIPI CSI-2 specification and the padding of
> > > +the data is defined in the MIPI CCS specification.
> > > +
> > > +This format is also used in conjunction with 20 bits per ``Data Unit
> > 
> > s/in conjunction with/for/
> > 
> > Same below.
> 
> That is shorter but is it better?

I think it's simpler and thus clearer. Up to you.

> > > +<media-glossary-data-unit>`` formats that pack two bytes of metadata into one
> > > +Data Unit.
> > 
> > How about adding a mention of MEDIA_BUS_FMT_META_20 here ? The CCS
> > specification calls this "RAW20 (with more optimal RAW10 packing)",
> > using the same vocabulary could help. Same for
> > V4L2_META_FMT_GENERIC_CSI2_12, and actually V4L2_META_FMT_GENERIC_8 too.
> 
> Is it useful? It's the same as 10-bit packing after all.

I think cross-referencing the two entries that can be used to transmit
metadata for the same image format is useful. 

> RAW20 in CCS refers to image data.

The wording I quoted comes from the CCS specification :-) Using the same
terms as in the spec would help in my opinion.

> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
> > > +
> > > +.. flat-table:: Sample 4x2 Metadata Frame
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - M\ :sub:`10`
> > > +      - M\ :sub:`20`
> > > +      - M\ :sub:`30`
> > > +      - x
> > > +    * - start + 5:
> > > +      - M\ :sub:`01`
> > > +      - M\ :sub:`11`
> > > +      - M\ :sub:`21`
> > > +      - M\ :sub:`31`
> > > +      - x
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-12:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_12
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_12 contains 8-bit generic metadata packed in 12-bit
> > > +Data Units, with two padding bytes after every four bytes of metadata. This
> > 
> > Isn't it one padding byte every two bytes of metadata ?
> 
> Uh, yes. This was mistakenly copied from text for a different bpp.
> 
> > > +format is typically used by CSI-2 receivers with a source that transmits
> > > +MEDIA_BUS_FMT_META_12 and the CSI-2 receiver writes the received data to memory
> > > +as-is.
> > > +
> > > +The packing of the data follows the MIPI CSI-2 specification and the padding of
> > > +the data is defined in the MIPI CCS specification.
> > > +
> > > +This format is also used in conjunction with 24 bits per ``Data Unit
> > > +<media-glossary-data-unit>`` formats that pack two bytes of metadata into one
> > > +Data Unit.
> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_12.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> > > +
> > > +.. flat-table:: Sample 4x2 Metadata Frame
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - M\ :sub:`10`
> > > +      - x
> > > +      - M\ :sub:`20`
> > > +      - M\ :sub:`30`
> > > +      - x
> > > +    * - start + 6:
> > > +      - M\ :sub:`01`
> > > +      - M\ :sub:`11`
> > > +      - x
> > > +      - M\ :sub:`21`
> > > +      - M\ :sub:`31`
> > > +      - x
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-14:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_14
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_14 contains 8-bit generic metadata packed in 14-bit
> > > +Data Units, with three padding bytes after every four bytes of metadata. This
> > > +format is typically used by CSI-2 receivers with a source that transmits
> > > +MEDIA_BUS_FMT_META_14 and the CSI-2 receiver writes the received data to memory
> > > +as-is.
> > > +
> > > +The packing of the data follows the MIPI CSI-2 specification and the padding of
> > > +the data is defined in the MIPI CCS specification.
> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_14.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{.8cm}|
> > > +
> > > +.. flat-table:: Sample 4x2 Metadata Frame
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - M\ :sub:`10`
> > > +      - M\ :sub:`20`
> > > +      - M\ :sub:`30`
> > > +      - x
> > > +      - x
> > > +      - x
> > > +    * - start + 7:
> > > +      - M\ :sub:`01`
> > > +      - M\ :sub:`11`
> > > +      - M\ :sub:`21`
> > > +      - M\ :sub:`31`
> > > +      - x
> > > +      - x
> > > +      - x
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-16:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_16
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_16 contains 8-bit generic metadata packed in 16-bit
> > > +Data Units, with one padding byte after every byte of metadata. This format is
> > > +typically used by CSI-2 receivers with a source that transmits
> > > +MEDIA_BUS_FMT_META_16 and the CSI-2 receiver writes the received data to memory
> > > +as-is.
> > > +
> > > +The packing of the data follows the MIPI CSI-2 specification and the padding of
> > > +the data is defined in the MIPI CCS specification.
> > 
> > Here you could also mention that more optimal packing schemes for
> > MEDIA_BUS_FMT_META_16 use V4L2_META_FMT_GENERIC_8. Same below.
> 
> The "more optimal packing scheme" is really a different format. There's no
> other relation between these, really. I wouldn't mention it here. A driver
> would enumerate both for metadata when they're supported.

It's a different format, but the two are linked to the same image
format. That's why I think it's useful to cross-reference them.

> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|
> > > +
> > > +.. flat-table:: Sample 4x2 Metadata Frame
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - x
> > > +      - M\ :sub:`10`
> > > +      - x
> > > +      - M\ :sub:`20`
> > > +      - x
> > > +      - M\ :sub:`30`
> > > +      - x
> > > +    * - start + 8:
> > > +      - M\ :sub:`01`
> > > +      - x
> > > +      - M\ :sub:`11`
> > > +      - x
> > > +      - M\ :sub:`21`
> > > +      - x
> > > +      - M\ :sub:`31`
> > > +      - x
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-20:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_20
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_20 contains 8-bit generic metadata packed in 20-bit
> > > +Data Units, with alternating one or two padding bytes after every byte of
> > > +metadata. This format is typically used by CSI-2 receivers with a source that
> > > +transmits MEDIA_BUS_FMT_META_20 and the CSI-2 receiver writes the received data
> > > +to memory as-is.
> > > +
> > > +The packing of the data follows the MIPI CSI-2 specification and the padding of
> > > +the data is defined in the MIPI CCS specification.
> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_20.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> > > +
> > > +.. flat-table:: Sample 4x2 Metadata Frame
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - x
> > > +      - M\ :sub:`10`
> > > +      - x
> > > +      - x
> > > +      - M\ :sub:`20`
> > > +      - x
> > > +      - M\ :sub:`30`
> > > +      - x
> > > +      - x
> > > +    * - start + 10:
> > > +      - M\ :sub:`01`
> > > +      - x
> > > +      - M\ :sub:`11`
> > > +      - x
> > > +      - x
> > > +      - M\ :sub:`21`
> > > +      - x
> > > +      - M\ :sub:`31`
> > > +      - x
> > > +      - x
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-24:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_24
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_24 contains 8-bit generic metadata packed in 24-bit
> > > +Data Units, with two padding bytes after every byte of metadata. This format is
> > > +typically used by CSI-2 receivers with a source that transmits
> > > +MEDIA_BUS_FMT_META_24 and the CSI-2 receiver writes the received data to memory
> > > +as-is.
> > > +
> > > +The packing of the data follows the MIPI CSI-2 specification and the padding of
> > > +the data is defined in the MIPI CCS specification.
> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_24.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> > > +
> > > +.. flat-table:: Sample 4x2 Metadata Frame
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - x
> > > +      - x
> > > +      - M\ :sub:`10`
> > > +      - x
> > > +      - x
> > > +      - M\ :sub:`20`
> > > +      - x
> > > +      - x
> > > +      - M\ :sub:`30`
> > > +      - x
> > > +      - x
> > > +    * - start + 12:
> > > +      - M\ :sub:`01`
> > > +      - x
> > > +      - x
> > > +      - M\ :sub:`11`
> > > +      - x
> > > +      - x
> > > +      - M\ :sub:`21`
> > > +      - x
> > > +      - x
> > > +      - M\ :sub:`31`
> > > +      - x
> > > +      - x
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index 5aeff5519407..ae2dca7f2817 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1460,6 +1460,13 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > >  	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
> > >  	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
> > >  	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
> > > +	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8-bit Generic Meta, 14b CSI-2"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
> > >  
> > >  	default:
> > >  		/* Compressed formats */
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > index 2663213b76a4..c7cf20b5da67 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -839,6 +839,14 @@ struct v4l2_pix_format {
> > >  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
> > >  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
> > >  
> > > +#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> > > +
> > >  /* priv field value to indicates that subsequent fields are valid. */
> > >  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> > >  

-- 
Regards,

Laurent Pinchart

