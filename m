Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F10727A0D
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 10:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234434AbjFHIfp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 04:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232984AbjFHIfn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 04:35:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D34B26B2
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 01:35:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0475161A9C
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 08:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49895C433EF;
        Thu,  8 Jun 2023 08:35:40 +0000 (UTC)
Message-ID: <2dee5a48-147a-27ff-b1da-cdb1d238e022@xs4all.nl>
Date:   Thu, 8 Jun 2023 10:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 5/7] media: uapi: Add generic serial metadata mbus formats
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-6-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230505215257.60704-6-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2023 23:52, Sakari Ailus wrote:
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
> +content is more or less device specific but the data is transmitted and received
> +by multiple devices that do not process the data in any way, simply writing
> +it to system memory for processing in software at the end of the pipeline.
> +
> +The more specific variant describing the actual data is used on the internal
> +source pad of the originating sub-device.

As Laurent said as well, the mention of 'internal source pad' is confusing.

Aren't there two possibilities here? Either the entity has just a source pad
that delivers the metadata, and that source pad has the precise metadata
format. Or the entity supports routing and then there is a sink pad connected
to an internal source that is routed to a source pad. In that case that sink
pad has the precise metadata format.

Apologies if I am wrong, it's hard to keep track of all the possibilities,
especially if you do not use this regularly.

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

You skip 0x8006 here in case there will be a _18 variant?

> +#define MEDIA_BUS_FMT_META_1X8_20		0x8007
> +#define MEDIA_BUS_FMT_META_1X8_24		0x8009
> +
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

Regards,

	Hans
