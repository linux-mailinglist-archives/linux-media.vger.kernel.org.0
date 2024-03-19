Return-Path: <linux-media+bounces-7337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC498807AF
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 00:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3173F1F22D4C
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 23:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1BB53E32;
	Tue, 19 Mar 2024 22:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pydFpBjK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF742F2C
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 22:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710889196; cv=none; b=HxlsKc5gLj9kx6fMeerqVH2N10xnUUSA7afKY+8k/dEoEnfrdElxquk1XRslot45+oGbHBlzsn4aUGMhwQ9Nt6bSHbOhOO6kS2XOrhkfX7T5NbEdvQ8f1mEREmfuKPYq5jysf3npC6SqwRf9gxmlrN2nYMDFDVBL6dBjr7y784M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710889196; c=relaxed/simple;
	bh=bhs0P6tAgq1UY7xRgsq+Rkd55sd8pI8fM3MbCJL4iE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZ/CrmqoeEUc+y9L1l1t1Nn7846p9sQy4boZcYL1EZIt6xeTuOcaDiDXe5bZcKNh0JmP1/c5mfZGhVFptyLPI7L950GVyZbo6mTSkrwc0X+Xny/HT9myCg+J2KYiBkZF/yPuGvWiP8F82VoEln2sNWn0rblSQnM78a4i6zGBmVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pydFpBjK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEB61480;
	Tue, 19 Mar 2024 23:59:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710889164;
	bh=bhs0P6tAgq1UY7xRgsq+Rkd55sd8pI8fM3MbCJL4iE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pydFpBjKlGh1mkG5N1ZdtsrHwrwDTHI2vzm3uK8O6Y8oELYSWmqhhpTO+L+xCLVdB
	 HXJOcihO0LpuZ/fYFIJ/MrXhy+MUju2n8xfi90cGj8snYehEim/GxxeUXEbGUvAx1/
	 MPCPM0T8dbxSCOUIm7yy0r5jAiOwqYx/Zcfw7jYs=
Date: Wed, 20 Mar 2024 00:59:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 03/38] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <20240319225948.GG8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-4-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:41AM +0200, Sakari Ailus wrote:
> Add generic serial metadata mbus formats. These formats describe data
> width and packing but not the content itself. The reason for specifying
> such formats is that the formats as such are fairly device specific but
> they are still handled by CSI-2 receiver drivers that should not be aware
> of device specific formats. What makes generic metadata formats possible
> is that these formats are parsed by software only, after capturing the
> data to system memory.
> 
> Also add a definition for "Data unit" to cover what is essentially a pixel
> but is not image data.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/glossary.rst          |   9 +
>  .../media/v4l/subdev-formats.rst              | 258 ++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |   9 +
>  3 files changed, 276 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> index ef0ab601b5bf..7078141894c5 100644
> --- a/Documentation/userspace-api/media/glossary.rst
> +++ b/Documentation/userspace-api/media/glossary.rst
> @@ -25,6 +25,15 @@ Glossary
>  
>  	See :ref:`cec`.
>  
> +.. _media-glossary-data-unit:
> +
> +    Data unit
> +
> +	Unit of data transported by a bus. On parallel buses, the data unit
> +	consists of one or more related samples while on serial buses the data
> +	unit is logical. If the data unit is image data, it may also be called a
> +	pixel.

I'm pretty sure nobody will be able to understand what this means, but I
don't have a better proposal at the moment.

> +
>      Device Driver
>  	Part of the Linux Kernel that implements support for a hardware
>  	component.
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index eb3cd20b0cf2..cbd475f7cae9 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8306,3 +8306,261 @@ The following table lists the existing metadata formats.
>  	both sides of the link and the bus format is a fixed
>  	metadata format that is not configurable from userspace.
>  	Width and height will be set to 0 for this format.
> +
> +Generic Serial Metadata Formats
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Generic serial metadata formats are used on serial buses where the actual data
> +content is more or less device specific but the data is transmitted and received
> +by multiple devices that do not process the data in any way, simply writing
> +it to system memory for processing in software at the end of the pipeline.
> +
> +The more specific variant describing the actual data is used on the internal
> +source pad of the originating sub-device.

Maybe this paragraph would be best added in the patch that adds the
specific metadata formats, you could then mention one of them as an
example:

The exact format of the data generated by the device is reported on the
internal source pad of the originating sub-device, using one of the more
specific metadata formats such as MEDIA_BUS_FMT_CCS_EMBEDDED.

> +
> +"b" in an array cell signifies a byte of data, followed by the number of the bit

s/bit$/byte/

> +and finally the bit number in subscript. "X" indicates a padding bit.

We use a lower-case x in pixfmt-rgb.rst, I would do the same here. We
also use single quotes there, turning "b" and "x" into 'b' and 'x'.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +.. _media-bus-format-generic-meta:
> +
> +.. cssclass: longtable
> +
> +.. flat-table:: Generic Serial Metadata Formats
> +    :header-rows:  2
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      -
> +      - :cspan:`23` Data organization within bus ``Data unit
> +	<media-glossary-data-unit>``
> +    * -
> +      -
> +      - Bit
> +      - 23
> +      - 22
> +      - 21
> +      - 20
> +      - 19
> +      - 18
> +      - 17
> +      - 16
> +      - 15
> +      - 14
> +      - 13
> +      - 12
> +      - 11
> +      - 10
> +      - 9
> +      - 8
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +    * .. _MEDIA-BUS-FMT-META-8:
> +
> +      - MEDIA_BUS_FMT_META_8
> +      - 0x8001
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - b0\ :sub:`7`
> +      - b0\ :sub:`6`
> +      - b0\ :sub:`5`
> +      - b0\ :sub:`4`
> +      - b0\ :sub:`3`
> +      - b0\ :sub:`2`
> +      - b0\ :sub:`1`
> +      - b0\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-META-10:
> +
> +      - MEDIA_BUS_FMT_META_10
> +      - 0x8002
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - b0\ :sub:`7`
> +      - b0\ :sub:`6`
> +      - b0\ :sub:`5`
> +      - b0\ :sub:`4`
> +      - b0\ :sub:`3`
> +      - b0\ :sub:`2`
> +      - b0\ :sub:`1`
> +      - b0\ :sub:`0`
> +      - X
> +      - X
> +    * .. _MEDIA-BUS-FMT-META-12:
> +
> +      - MEDIA_BUS_FMT_META_12
> +      - 0x8003
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - b0\ :sub:`7`
> +      - b0\ :sub:`6`
> +      - b0\ :sub:`5`
> +      - b0\ :sub:`4`
> +      - b0\ :sub:`3`
> +      - b0\ :sub:`2`
> +      - b0\ :sub:`1`
> +      - b0\ :sub:`0`
> +      - X
> +      - X
> +      - X
> +      - X
> +    * .. _MEDIA-BUS-FMT-META-14:
> +
> +      - MEDIA_BUS_FMT_META_14
> +      - 0x8004
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - b0\ :sub:`7`
> +      - b0\ :sub:`6`
> +      - b0\ :sub:`5`
> +      - b0\ :sub:`4`
> +      - b0\ :sub:`3`
> +      - b0\ :sub:`2`
> +      - b0\ :sub:`1`
> +      - b0\ :sub:`0`
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +    * .. _MEDIA-BUS-FMT-META-16:
> +
> +      - MEDIA_BUS_FMT_META_16
> +      - 0x8005
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - b0\ :sub:`7`
> +      - b0\ :sub:`6`
> +      - b0\ :sub:`5`
> +      - b0\ :sub:`4`
> +      - b0\ :sub:`3`
> +      - b0\ :sub:`2`
> +      - b0\ :sub:`1`
> +      - b0\ :sub:`0`
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +    * .. _MEDIA-BUS-FMT-META-20:
> +
> +      - MEDIA_BUS_FMT_META_20
> +      - 0x8006
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - b0\ :sub:`7`
> +      - b0\ :sub:`6`
> +      - b0\ :sub:`5`
> +      - b0\ :sub:`4`
> +      - b0\ :sub:`3`
> +      - b0\ :sub:`2`
> +      - b0\ :sub:`1`
> +      - b0\ :sub:`0`
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +    * .. _MEDIA-BUS-FMT-META-24:
> +
> +      - MEDIA_BUS_FMT_META_24
> +      - 0x8007
> +      -
> +      - b0\ :sub:`7`
> +      - b0\ :sub:`6`
> +      - b0\ :sub:`5`
> +      - b0\ :sub:`4`
> +      - b0\ :sub:`3`
> +      - b0\ :sub:`2`
> +      - b0\ :sub:`1`
> +      - b0\ :sub:`0`
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> +      - X
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index f05f747e444d..d4c1d991014b 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -174,4 +174,13 @@
>   */
>  #define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
>  
> +/* Generic line based metadata formats for serial buses. Next is 0x8008. */
> +#define MEDIA_BUS_FMT_META_8			0x8001
> +#define MEDIA_BUS_FMT_META_10			0x8002
> +#define MEDIA_BUS_FMT_META_12			0x8003
> +#define MEDIA_BUS_FMT_META_14			0x8004
> +#define MEDIA_BUS_FMT_META_16			0x8005
> +#define MEDIA_BUS_FMT_META_20			0x8006
> +#define MEDIA_BUS_FMT_META_24			0x8007
> +
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
Regards,

Laurent Pinchart

