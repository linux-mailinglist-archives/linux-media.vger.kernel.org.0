Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEA8B7858D3
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 15:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235652AbjHWNRT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 09:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235681AbjHWNRK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 09:17:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB911717
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 06:16:36 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58451968;
        Wed, 23 Aug 2023 15:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692796499;
        bh=ZbarBWoFBk1NLDaS4RstV7h/yMhUSkgE1A8tY4F2ewY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=NnAUEsmpZJtgOQXr0/b9vWfKK4gFbRif35JJqW9hXPDCzJi+rv1mzJMGHvbEAR68D
         +eSNJo/b+DJa0BquC9S+GXDbbREgv9WpPIGvY9WyDETyZmIqB4XSRA7rhzRokWhTwM
         4JcowqDaZJTQK0vYnDYzbp+jJVTgd1pQ/UWLH/Fs=
Message-ID: <0d022884-366d-4df0-caa6-2406714d5e07@ideasonboard.com>
Date:   Wed, 23 Aug 2023 16:16:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 04/10] media: uapi: Add generic serial metadata mbus
 formats
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-5-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230808075538.3043934-5-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 08/08/2023 10:55, Sakari Ailus wrote:
> Add generic serial metadata mbus formats. These formats describe data
> width and packing but not the content itself. The reason for specifying
> such formats is that the formats as such are fairly device specific but
> they are still handled by CSI-2 receiver drivers that should not be aware
> of device specific formats. What makes generic metadata formats possible
> is that these formats are parsed by software only, after capturing the
> data to system memory.

If I'm not mistaken, the CSI-2 spec doesn't say much about embedded 
data, except that it may exist. Afaics, in CSI-2, the embedded data is 
split into "lines", although the amount of data can be different than in 
the video lines.

The CCS specs talks more about embedded data. Some of it is quite odd, 
like: "The length of the embedded data line shall not exceed the length 
of the image data line. The embedded data line should have the same 
length as the image data line.". I think it means the embedded line can 
be shorter than image line, but not longer.

CCS also says that an embedded line should use 0x07 as padding at the 
end of the line, if there's less data than the image line.

CCS also talks about how the embedded data would be packed, and in some 
cases that packing would be the same as for pixel data.

But I don't think these formats are generic. They're defined in CCS, so 
shouldn't the format be, e.g., MEDIA_BUS_FMT_META_CCS_RAW_12 or such?

The MEDIA_BUS_FMT_META_8 is quite safe one, as it just means byte data 
without any padding or packing.

  Tomi

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../media/v4l/subdev-formats.rst              | 257 ++++++++++++++++++
>   include/uapi/linux/media-bus-format.h         |   9 +
>   2 files changed, 266 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index a3a35eeed708..c615da08502d 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8234,3 +8234,260 @@ The following table lists the existing metadata formats.
>   	both sides of the link and the bus format is a fixed
>   	metadata format that is not configurable from userspace.
>   	Width and height will be set to 0 for this format.
> +
> +Generic Serial Metadata Formats
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Generic serial metadata formats are used on serial busses where the actual data
> +content is more or less device specific but the data is transmitted and received
> +by multiple devices that do not process the data in any way, simply writing
> +it to system memory for processing in software at the end of the pipeline.
> +
> +The more specific variant describing the actual data is used on the internal
> +source pad of the originating sub-device.
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
> +      - p
> +      - p
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
> +      - p
> +      - p
> +      - p
> +      - p
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
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
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
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +      - p
> +    * .. _MEDIA-BUS-FMT-META-20:
> +
> +      - MEDIA_BUS_FMT_META_20
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
> +    * .. _MEDIA-BUS-FMT-META-24:
> +
> +      - MEDIA_BUS_FMT_META_24
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
> index a03c543cb072..9ee031397372 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -173,4 +173,13 @@
>    */
>   #define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
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
>   #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

