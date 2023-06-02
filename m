Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D21371FF9A
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 12:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235481AbjFBKmc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 06:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235721AbjFBKmS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 06:42:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7500C10CF
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 03:41:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp [126.156.168.104])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37CF46E0;
        Fri,  2 Jun 2023 12:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685702179;
        bh=2NWBeQ04SlrYJQ8Y9Kw5ol04Q9oFPX/bLY9r/UFMEJg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h92k6hEKh5ZTMRpZi3UsCKvGRNyo1FaRsXmiMLvspAeEjrqMCQhM8Ww7VIr8godfT
         HoXRVUbzl1zbQJ+6yf1ys2vhirf5iCK9PxUjrNwU0jPIaJxnu1yJ/OTcrppKequZbg
         BN+IsNhTohHn1c6YH2gMYauKPnkZAA9NuT/NiJTE=
Date:   Fri, 2 Jun 2023 13:36:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [RFC 5/7] media: uapi: Add generic serial metadata mbus formats
Message-ID: <20230602103641.GL19463@pendragon.ideasonboard.com>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505215257.60704-6-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Sat, May 06, 2023 at 12:52:55AM +0300, Sakari Ailus wrote:
> Add generic serial metadata mbus formats. These formats describe data
> width and packing but not the content itself. The reason for specifying
> such formats is that the formats as such are fairly device specific but
> they are still handled by CSI-2 receiver drivers that should not be aware
> of device specific formats. What makes generic metadata formats possible
> is that these formats are parsed by software only, after capturing the
> data to system memory.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 257 ++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |   9 +
>  2 files changed, 266 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index a3a35eeed708..1492fff58426 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8234,3 +8234,260 @@ The following table lists the existing metadata formats.
>  	both sides of the link and the bus format is a fixed
>  	metadata format that is not configurable from userspace.
>  	Width and height will be set to 0 for this format.
> +
> +Generic Serial Metadata Formats
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Generic serial metadata formats are used on serial busses where the actual data

s/busses/buses/

> +content is more or less device specific but the data is transmitted and received
> +by multiple devices that do not process the data in any way, simply writing
> +it to system memory for processing in software at the end of the pipeline.
> +
> +The more specific variant describing the actual data is used on the internal
> +source pad of the originating sub-device.

What do you mean by "more specific variant" here ? Please include an
example in the documentation.

I'm not sure I like mentioning internal source pads here, are we
guaranteed that metadata will always originate from an internal source
pad ?

> +
> +"b" in an array cell signifies a byte of data, followed by the number of byte
> +and finally the bit number in subscript. "p" indicates a padding bit.
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
> +      - :cspan:`23` Data organization
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
> +    * .. _MEDIA-BUS-FMT-META-1X8-8:
> +
> +      - MEDIA_BUS_FMT_META_1X8_8
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
> +    * .. _MEDIA-BUS-FMT-META-1X8-10:
> +
> +      - MEDIA_BUS_FMT_META_1X8_10
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
> +      - p
> +      - p
> +    * .. _MEDIA-BUS-FMT-META-1X8-12:
> +
> +      - MEDIA_BUS_FMT_META_1X8_12
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
> +      - p
> +      - p
> +      - p
> +      - p
> +    * .. _MEDIA-BUS-FMT-META-1X8-14:
> +
> +      - MEDIA_BUS_FMT_META_1X8_14
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
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +    * .. _MEDIA-BUS-FMT-META-1X8-16:
> +
> +      - MEDIA_BUS_FMT_META_1X8_16
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
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +    * .. _MEDIA-BUS-FMT-META-1X8-20:
> +
> +      - MEDIA_BUS_FMT_META_1X8_20
> +      - 0x8007
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
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +    * .. _MEDIA-BUS-FMT-META-1X8-24:
> +
> +      - MEDIA_BUS_FMT_META_1X8_24
> +      - 0x8009
> +      -
> +      - b0\ :sub:`7`
> +      - b0\ :sub:`6`
> +      - b0\ :sub:`5`
> +      - b0\ :sub:`4`
> +      - b0\ :sub:`3`
> +      - b0\ :sub:`2`
> +      - b0\ :sub:`1`
> +      - b0\ :sub:`0`
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index a03c543cb072..722463523bbd 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -173,4 +173,13 @@
>   */
>  #define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
>  
> +/* Generic line based metadata formats for serial buses. Next is 0x800b. */
> +#define MEDIA_BUS_FMT_META_1X8_8		0x8001
> +#define MEDIA_BUS_FMT_META_1X8_10		0x8002
> +#define MEDIA_BUS_FMT_META_1X8_12		0x8003
> +#define MEDIA_BUS_FMT_META_1X8_14		0x8004
> +#define MEDIA_BUS_FMT_META_1X8_16		0x8005
> +#define MEDIA_BUS_FMT_META_1X8_20		0x8007
> +#define MEDIA_BUS_FMT_META_1X8_24		0x8009

We've discussed this before privately, it's time to come to a conclusion
:-)

My preference would be 

#define MEDIA_BUS_FMT_META_RAW8			0x8001
#define MEDIA_BUS_FMT_META_RAW10		0x8002
#define MEDIA_BUS_FMT_META_RAW12		0x8003
#define MEDIA_BUS_FMT_META_RAW14		0x8004
#define MEDIA_BUS_FMT_META_RAW16		0x8005
#define MEDIA_BUS_FMT_META_RAW20		0x8007
#define MEDIA_BUS_FMT_META_RAW24		0x8009

without defining the contents of the data (that is, no mention of
padding bits).

> +
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
Regards,

Laurent Pinchart
