Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7A437D9C05
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 16:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345927AbjJ0Oro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 10:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345772AbjJ0Orn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 10:47:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1B2C9
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 07:47:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E130A74A;
        Fri, 27 Oct 2023 16:47:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698418044;
        bh=CSKWW3L3dx+a9nijyHcTULdWKvIA8ols4DWPv1lZh4E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KkCiBdV1C8uJeL+yaSmJjHF1e9lkmEMSbjg8PYKG9+Av5blbEnnyoj4rEXIpFm0V0
         wu6uypQrCYS6H9fVg5gyvh6o9u5LqpIHExNBIKHTsfH60DNPvc4LXk6OtZiQsb5Xjl
         00YDn8Fwk0L0V9TBYpeHEzUn8MCr0/ezsubuBKI4=
Date:   Fri, 27 Oct 2023 17:47:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 02/28] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <20231027144742.GC19539@pendragon.ideasonboard.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231003115237.76828-3-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, Oct 03, 2023 at 02:52:30PM +0300, Sakari Ailus wrote:
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
>  .../userspace-api/media/glossary.rst          |   8 +
>  .../media/v4l/subdev-formats.rst              | 258 ++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |   9 +
>  3 files changed, 275 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> index f7b99a4527c7..65217b8a44cc 100644
> --- a/Documentation/userspace-api/media/glossary.rst
> +++ b/Documentation/userspace-api/media/glossary.rst
> @@ -25,6 +25,14 @@ Glossary
>  
>  	See :ref:`cec`.
>  
> +.. _media-glossary-data-unit:
> +
> +    Data unit
> +
> +	Unit of data transported by a bus. On parallel buses, this is called a
> +	sample while on serial buses the data unit is logical. If the data unit
> +	is image data, it may also be called a pixel.

I don't think this is correct. There are parallel formats that transmit
multiple pixels per sample (e.g. UYYVYY8_0_5X24), or use multiple
samples to transmit on pixel (e.g. YUYV8_2X8).

> +
>      Device Driver
>  	Part of the Linux Kernel that implements support for a hardware
>  	component.
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index a3a35eeed708..c54bf834d839 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8234,3 +8234,261 @@ The following table lists the existing metadata formats.
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
> +
> +"b" in an array cell signifies a byte of data, followed by the number of the bit
> +and finally the bit number in subscript. "X" indicates a padding bit.
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
> index a03c543cb072..9ee031397372 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -173,4 +173,13 @@
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

One thing I'd like to do at some point is to fix the historical mistake
we make when adding raw image formats that encode the CFA pattern in the
format itself. While this isn't on-topic for this series, I will then
need to add RAW_{8,10,12,...} media bus codes, which will essentially
describe the same format as the above formats. Could we already unify
them, and add CSI-2 RAW formats instead of metadata-specific formats
here ?

> +
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
Regards,

Laurent Pinchart
