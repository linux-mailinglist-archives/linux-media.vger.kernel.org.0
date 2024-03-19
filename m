Return-Path: <linux-media+bounces-7341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0B2880837
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 00:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF14E1F217D1
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 23:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CC95FB90;
	Tue, 19 Mar 2024 23:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TxTKBfXX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39BC2DF9F
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 23:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710891429; cv=none; b=qeW+Q0HyvjClNV0i2j3rltV2s9xQe1MaH+PRCbkVeONtqehBG+Z0snG6jHuT1Mv708LSNeLlQ5kfkHOQ1kSMzOYIXd/pu+RNSt8hinjOSK2nPzCkq35/cZhLIrFFLHnM3O4lCOo+bfworu79QAFUvj2fV/9muMkSd6TH0FZy1XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710891429; c=relaxed/simple;
	bh=Kn5BNLuJCRjanc7KWDGt35d5haE4IbJwucNGCwu8fkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3Zlo/tAnpQBmvpv+43Qty+Z05uCtu0wdBizoDxq7e/XDdmP1O6N/bs6ahFs3iLbK2rskbwX+Kf5UeZW25/8gE1+SXdcHr+Df04fcQlapT6GPIhFum48Kk0J+0Mv99cJ/bu7cHd/0CJ5FXyJWIMMGcKywv/dfWRjGFSFhQBCCLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TxTKBfXX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94088B1;
	Wed, 20 Mar 2024 00:36:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710891397;
	bh=Kn5BNLuJCRjanc7KWDGt35d5haE4IbJwucNGCwu8fkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TxTKBfXXpsmrOF+0+FAkdaaHHPU6YvlrHUhSy9iUfpfe8NUfZcSWAv5+LavB494YK
	 p2hzIc/vl4etNQfNxQXB/tAufzDjTpKcz4RuPdEFcR9O/wEJy3vae7XtToAcc/Xqpv
	 h0mZzzqHpKqEDrWUJ4FOEhweHDTXs8l4Lz3hfnEw=
Date: Wed, 20 Mar 2024 01:37:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 05/38] media: uapi: Add generic 8-bit metadata format
 definitions
Message-ID: <20240319233701.GJ8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-6-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

Mentioning V4L2 on the subject line would help differentiating this from
the media bus codes.

On Wed, Mar 13, 2024 at 09:24:43AM +0200, Sakari Ailus wrote:
> Generic 8-bit metadata formats define the in-memory data layout but not
> the format of the data itself. The reasoning for having such formats is to
> allow CSI-2 receiver drivers to receive and DMA drivers to write the data
> to memory without knowing a large number of device specific formats.

s/device specific/device-specific/

> These formats may be used only in conjunction of a Media controller

s/of a/with a/

> pipeline where the internal pad of the source sub-device defines the
> specific format of the data (using an mbus code).
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
>  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
>  .../media/v4l/metafmt-generic.rst             | 304 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   7 +
>  include/uapi/linux/videodev2.h                |   8 +
>  5 files changed, 322 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 43988516acdd..f375b820ab68 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -506,6 +506,8 @@ source pads.
>  
>      subdev-formats
>  
> +.. _subdev-routing:
> +
>  Streams, multiplexed media pads and internal routing
>  ----------------------------------------------------
>  
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index 0bb61fc5bc00..919f595576b9 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -19,3 +19,4 @@ These formats are used for the :ref:`metadata` interface only.
>      metafmt-vsp1-hgo
>      metafmt-vsp1-hgt
>      metafmt-vivid
> +    metafmt-generic

I think the intention was to keep those alphabetically sorted, even if
vivid is out of order already.

> diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> new file mode 100644
> index 000000000000..2ebab1f895e0
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> @@ -0,0 +1,304 @@
> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> +
> +**************************************************************************************************************************************************************************************************************************************************************************************************************************
> +V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O')
> +**************************************************************************************************************************************************************************************************************************************************************************************************************************

Aren't you supposed to match the line lengths ?

> +
> +
> +Generic line-based metadata formats
> +
> +
> +Description
> +===========
> +
> +These generic line-based metadata formats define the memory layout of the data
> +without defining the format or meaning of the metadata itself. These formats may
> +only be used with a Media controller pipeline where the more specific format is

"Media Controller" or "media controller", but not a hybrid mix.

> +defined in an :ref:`internal source pad <MEDIA-PAD-FL-INTERNAL>` of the source

s/defined in/reported by/

> +sub-device. See also :ref:`source routes <subdev-routing>`.
> +
> +.. _v4l2-meta-fmt-generic-8:
> +
> +V4L2_META_FMT_GENERIC_8
> +-----------------------
> +
> +The V4L2_META_FMT_GENERIC_8 format is a plain 8-bit metadata format.
> +
> +This format is also used on CSI-2 for both 8 bits per ``Data unit

s/Data unit/Data Unit/ (through the whole patch series)

> +<media-glossary-data-unit>`` as well as for 16 bits per Data unit when two bytes
> +of metadata are packed into one 16-bit Data unit.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_8.**
> +Each cell is one byte. "M" denotes a byte of metadata.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
> +
> +.. flat-table::

Let's add a title here

.. flat-table:: Sample 4x2 Metadata Frame

(feel free to adjust). Same below.

> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - M\ :sub:`10`
> +      - M\ :sub:`20`
> +      - M\ :sub:`30`
> +    * - start + 4:
> +      - M\ :sub:`01`
> +      - M\ :sub:`11`
> +      - M\ :sub:`21`
> +      - M\ :sub:`31`
> +
> +.. _v4l2-meta-fmt-generic-csi2-10:
> +
> +V4L2_META_FMT_GENERIC_CSI2_10
> +-----------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_10 contains packed 8-bit generic metadata, 10 bits
> +for each 8 bits of data. Every four bytes of metadata is followed by a single
> +byte of padding. The way the data is packed follows the MIPI CSI-2 specification
> +and the padding is defined in the MIPI CCS specification.

Doesn't really sound packed, when you have one byte of padding after
four bytes of data :-) I understand where this "packing" is from, but
the documentation seems confusing for people not familiar with the
topic. How about simplifying it as follows ?

V4L2_META_FMT_GENERIC_CSI2_10 contains 8-bit generic metadata, stored with one
padding byte after every four bytes of metadata. This is usually produced by
CSI-2 receivers with a source that transmits MEDIA_BUS_FMT_META_10, when the
CSI-2 receiver packs the received data as defined in the MIPI CSI-2
specification.

> +
> +This format is also used in conjunction with 20 bits per ``Data unit
> +<media-glossary-data-unit>`` formats that pack two bytes of metadata into one
> +Data unit.
> +
> +This format is little endian.

How is it little endian when it's byte-oriented ?

> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
> +Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.

'M' and 'x'.

These comments apply to the formats below too.

> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - M\ :sub:`10`
> +      - M\ :sub:`20`
> +      - M\ :sub:`30`
> +      - X
> +    * - start + 5:
> +      - M\ :sub:`01`
> +      - M\ :sub:`11`
> +      - M\ :sub:`21`
> +      - M\ :sub:`31`
> +      - X
> +
> +.. _v4l2-meta-fmt-generic-csi2-12:
> +
> +V4L2_META_FMT_GENERIC_CSI2_12
> +-----------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_12 contains packed 8-bit generic metadata, 12 bits
> +for each 8 bits of data. Every four bytes of metadata is followed by a single
> +byte of padding. The way the data is packed follows the MIPI CSI-2 specification
> +and the padding is defined in the MIPI CCS specification.
> +
> +This format is also used in conjunction with 24 bits per ``Data unit
> +<media-glossary-data-unit>`` formats that pack two bytes of metadata into one
> +Data unit.
> +
> +This format is little endian.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_12.**
> +Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - M\ :sub:`10`
> +      - X
> +      - M\ :sub:`20`
> +      - M\ :sub:`30`
> +      - X
> +    * - start + 6:
> +      - M\ :sub:`01`
> +      - M\ :sub:`11`
> +      - X
> +      - M\ :sub:`21`
> +      - M\ :sub:`31`
> +      - X
> +
> +.. _v4l2-meta-fmt-generic-csi2-14:
> +
> +V4L2_META_FMT_GENERIC_CSI2_14
> +-----------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_14 contains packed 8-bit generic metadata, 14 bits
> +for each 8 bits of data. Every four bytes of metadata is followed by three bytes
> +of padding. The way the data is packed follows the MIPI CSI-2 specification and
> +the padding is defined in the MIPI CCS specification.
> +
> +This format is little endian.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_14.**
> +Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - M\ :sub:`10`
> +      - M\ :sub:`20`
> +      - M\ :sub:`30`
> +      - X
> +      - X
> +      - X
> +    * - start + 7:
> +      - M\ :sub:`01`
> +      - M\ :sub:`11`
> +      - M\ :sub:`21`
> +      - M\ :sub:`31`
> +      - X
> +      - X
> +      - X
> +
> +.. _v4l2-meta-fmt-generic-csi2-16:
> +
> +V4L2_META_FMT_GENERIC_CSI2_16
> +-----------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_16 contains packed 8-bit generic metadata, 16 bits
> +for each 8 bits of data. Every byte of metadata is followed by one byte of
> +padding. The way the data is packed follows the MIPI CSI-2 specification and the
> +padding is defined in the MIPI CCS specification.
> +
> +This format is little endian.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
> +Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - X
> +      - M\ :sub:`10`
> +      - X
> +      - M\ :sub:`20`
> +      - X
> +      - M\ :sub:`30`
> +      - X
> +    * - start + 8:
> +      - M\ :sub:`01`
> +      - X
> +      - M\ :sub:`11`
> +      - X
> +      - M\ :sub:`21`
> +      - X
> +      - M\ :sub:`31`
> +      - X
> +
> +.. _v4l2-meta-fmt-generic-csi2-20:
> +
> +V4L2_META_FMT_GENERIC_CSI2_20
> +-----------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_20 contains packed 8-bit generic metadata, 20 bits
> +for each 8 bits of data. Every byte of metadata is followed by alternating one
> +and two bytes of padding. The way the data is packed follows the MIPI CSI-2
> +specification and the padding is defined in the MIPI CCS specification.
> +
> +This format is little endian.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_20.**
> +Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - X
> +      - M\ :sub:`10`
> +      - X
> +      - X
> +      - M\ :sub:`20`
> +      - X
> +      - M\ :sub:`30`
> +      - X
> +      - X
> +    * - start + 10:
> +      - M\ :sub:`01`
> +      - X
> +      - M\ :sub:`11`
> +      - X
> +      - X
> +      - M\ :sub:`21`
> +      - X
> +      - M\ :sub:`31`
> +      - X
> +      - X
> +
> +.. _v4l2-meta-fmt-generic-csi2-24:
> +
> +V4L2_META_FMT_GENERIC_CSI2_24
> +-----------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_24 contains packed 8-bit generic metadata, 24 bits
> +for each 8 bits of data. Every byte of metadata is followed by two bytes of
> +padding. The way the data is packed follows the MIPI CSI-2 specification and the
> +padding is defined in the MIPI CCS specification.
> +
> +This format is little endian.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_24.**
> +Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - X
> +      - X
> +      - M\ :sub:`10`
> +      - X
> +      - X
> +      - M\ :sub:`20`
> +      - X
> +      - X
> +      - M\ :sub:`30`
> +      - X
> +      - X
> +    * - start + 12:
> +      - M\ :sub:`01`
> +      - X
> +      - X
> +      - M\ :sub:`11`
> +      - X
> +      - X
> +      - M\ :sub:`21`
> +      - X
> +      - X
> +      - M\ :sub:`31`
> +      - X
> +      - X
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 33076af4dfdb..7cb6063f7056 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1452,6 +1452,13 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
>  	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
>  	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
> +	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8b Generic Meta, 10b CSI-2"; break;

You could write "8-bit Generic Meta, 10b CSI-2" and it would still fit.
Up to you.

> +	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8b Generic Meta, 12b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8b Generic Meta, 14b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8b Generic Meta, 16b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8b Generic Meta, 20b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8b Generic Meta, 24b CSI-2"; break;
>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index a8015e5e7fa4..6a4f8ae30186 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -839,6 +839,14 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>  
> +#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> +
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
>  

-- 
Regards,

Laurent Pinchart

