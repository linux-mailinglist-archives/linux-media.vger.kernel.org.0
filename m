Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8C9C729BAC
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 15:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236875AbjFINej (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 09:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjFINei (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 09:34:38 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62743A3
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686317677; x=1717853677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3rWYqB/y8FhRV48AQLlWo412AUN/7nWeJ/MjLtlDnpc=;
  b=TLDjJ3Ip/ZG8y8yjJoLG1bJodjh61R26dRCRs0fV67BAS9ASmcxHKi4A
   Lq2CR52DxxoPpWftZxs+IxM20I2OsfE9+5Spi6NQVJivJkESK6t0PTq1b
   nLpDnknyPj0BCF/VwjzFBzqurHDqTLTAQjv/AT/b655AdH32LCw2Acrdp
   JeuyO9bT4Cl11Iix1jPFC58pM/NACq2BejEoYq0NFXDLl1yNPeSZ7oTBN
   yTotzlrdA5qHzaqfj5O22wvlFptp45dS6k9U/S0fIWt8MLkmkLpheRVXn
   3LrdEQ7kxjkcERuHD0G09LrK13g09RnZ9c+ZDiuegDOtrZEPr+NoCc3UB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="355085380"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="355085380"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:34:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="687748579"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="687748579"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:34:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 03B70120A0E;
        Fri,  9 Jun 2023 16:34:32 +0300 (EEST)
Date:   Fri, 9 Jun 2023 13:34:32 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [RFC 5/7] media: uapi: Add generic serial metadata mbus formats
Message-ID: <ZIMqaFwLnsmVlNZ1@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-6-sakari.ailus@linux.intel.com>
 <2dee5a48-147a-27ff-b1da-cdb1d238e022@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dee5a48-147a-27ff-b1da-cdb1d238e022@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jun 08, 2023 at 10:35:38AM +0200, Hans Verkuil wrote:
> On 05/05/2023 23:52, Sakari Ailus wrote:
> > Add generic serial metadata mbus formats. These formats describe data
> > width and packing but not the content itself. The reason for specifying
> > such formats is that the formats as such are fairly device specific but
> > they are still handled by CSI-2 receiver drivers that should not be aware
> > of device specific formats. What makes generic metadata formats possible
> > is that these formats are parsed by software only, after capturing the
> > data to system memory.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/subdev-formats.rst              | 257 ++++++++++++++++++
> >  include/uapi/linux/media-bus-format.h         |   9 +
> >  2 files changed, 266 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index a3a35eeed708..1492fff58426 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -8234,3 +8234,260 @@ The following table lists the existing metadata formats.
> >  	both sides of the link and the bus format is a fixed
> >  	metadata format that is not configurable from userspace.
> >  	Width and height will be set to 0 for this format.
> > +
> > +Generic Serial Metadata Formats
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Generic serial metadata formats are used on serial busses where the actual data
> > +content is more or less device specific but the data is transmitted and received
> > +by multiple devices that do not process the data in any way, simply writing
> > +it to system memory for processing in software at the end of the pipeline.
> > +
> > +The more specific variant describing the actual data is used on the internal
> > +source pad of the originating sub-device.
> 
> As Laurent said as well, the mention of 'internal source pad' is confusing.
> 
> Aren't there two possibilities here? Either the entity has just a source pad
> that delivers the metadata, and that source pad has the precise metadata
> format. Or the entity supports routing and then there is a sink pad connected
> to an internal source that is routed to a source pad. In that case that sink
> pad has the precise metadata format.
> 
> Apologies if I am wrong, it's hard to keep track of all the possibilities,
> especially if you do not use this regularly.

It's required the generic metadata format is present only on internal pads,
otherwise link validation will fail --- the next device won't be aware of
the specific mbus code.

> 
> > +
> > +"b" in an array cell signifies a byte of data, followed by the number of byte
> > +and finally the bit number in subscript. "p" indicates a padding bit.
> > +
> > +.. _media-bus-format-generic-meta:
> > +
> > +.. cssclass: longtable
> > +
> > +.. flat-table:: Generic Serial Metadata Formats
> > +    :header-rows:  2
> > +    :stub-columns: 0
> > +
> > +    * - Identifier
> > +      - Code
> > +      -
> > +      - :cspan:`23` Data organization
> > +    * -
> > +      -
> > +      - Bit
> > +      - 23
> > +      - 22
> > +      - 21
> > +      - 20
> > +      - 19
> > +      - 18
> > +      - 17
> > +      - 16
> > +      - 15
> > +      - 14
> > +      - 13
> > +      - 12
> > +      - 11
> > +      - 10
> > +      - 9
> > +      - 8
> > +      - 7
> > +      - 6
> > +      - 5
> > +      - 4
> > +      - 3
> > +      - 2
> > +      - 1
> > +      - 0
> > +    * .. _MEDIA-BUS-FMT-META-1X8-8:
> > +
> > +      - MEDIA_BUS_FMT_META_1X8_8
> > +      - 0x8001
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      - b0\ :sub:`7`
> > +      - b0\ :sub:`6`
> > +      - b0\ :sub:`5`
> > +      - b0\ :sub:`4`
> > +      - b0\ :sub:`3`
> > +      - b0\ :sub:`2`
> > +      - b0\ :sub:`1`
> > +      - b0\ :sub:`0`
> > +    * .. _MEDIA-BUS-FMT-META-1X8-10:
> > +
> > +      - MEDIA_BUS_FMT_META_1X8_10
> > +      - 0x8002
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      - b0\ :sub:`7`
> > +      - b0\ :sub:`6`
> > +      - b0\ :sub:`5`
> > +      - b0\ :sub:`4`
> > +      - b0\ :sub:`3`
> > +      - b0\ :sub:`2`
> > +      - b0\ :sub:`1`
> > +      - b0\ :sub:`0`
> > +      - p
> > +      - p
> > +    * .. _MEDIA-BUS-FMT-META-1X8-12:
> > +
> > +      - MEDIA_BUS_FMT_META_1X8_12
> > +      - 0x8003
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      - b0\ :sub:`7`
> > +      - b0\ :sub:`6`
> > +      - b0\ :sub:`5`
> > +      - b0\ :sub:`4`
> > +      - b0\ :sub:`3`
> > +      - b0\ :sub:`2`
> > +      - b0\ :sub:`1`
> > +      - b0\ :sub:`0`
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +    * .. _MEDIA-BUS-FMT-META-1X8-14:
> > +
> > +      - MEDIA_BUS_FMT_META_1X8_14
> > +      - 0x8004
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      - b0\ :sub:`7`
> > +      - b0\ :sub:`6`
> > +      - b0\ :sub:`5`
> > +      - b0\ :sub:`4`
> > +      - b0\ :sub:`3`
> > +      - b0\ :sub:`2`
> > +      - b0\ :sub:`1`
> > +      - b0\ :sub:`0`
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +    * .. _MEDIA-BUS-FMT-META-1X8-16:
> > +
> > +      - MEDIA_BUS_FMT_META_1X8_16
> > +      - 0x8005
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      - b0\ :sub:`7`
> > +      - b0\ :sub:`6`
> > +      - b0\ :sub:`5`
> > +      - b0\ :sub:`4`
> > +      - b0\ :sub:`3`
> > +      - b0\ :sub:`2`
> > +      - b0\ :sub:`1`
> > +      - b0\ :sub:`0`
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +    * .. _MEDIA-BUS-FMT-META-1X8-20:
> > +
> > +      - MEDIA_BUS_FMT_META_1X8_20
> > +      - 0x8007
> > +      -
> > +      -
> > +      -
> > +      -
> > +      -
> > +      - b0\ :sub:`7`
> > +      - b0\ :sub:`6`
> > +      - b0\ :sub:`5`
> > +      - b0\ :sub:`4`
> > +      - b0\ :sub:`3`
> > +      - b0\ :sub:`2`
> > +      - b0\ :sub:`1`
> > +      - b0\ :sub:`0`
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +    * .. _MEDIA-BUS-FMT-META-1X8-24:
> > +
> > +      - MEDIA_BUS_FMT_META_1X8_24
> > +      - 0x8009
> > +      -
> > +      - b0\ :sub:`7`
> > +      - b0\ :sub:`6`
> > +      - b0\ :sub:`5`
> > +      - b0\ :sub:`4`
> > +      - b0\ :sub:`3`
> > +      - b0\ :sub:`2`
> > +      - b0\ :sub:`1`
> > +      - b0\ :sub:`0`
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > +      - p
> > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > index a03c543cb072..722463523bbd 100644
> > --- a/include/uapi/linux/media-bus-format.h
> > +++ b/include/uapi/linux/media-bus-format.h
> > @@ -173,4 +173,13 @@
> >   */
> >  #define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
> >  
> > +/* Generic line based metadata formats for serial buses. Next is 0x800b. */
> > +#define MEDIA_BUS_FMT_META_1X8_8		0x8001
> > +#define MEDIA_BUS_FMT_META_1X8_10		0x8002
> > +#define MEDIA_BUS_FMT_META_1X8_12		0x8003
> > +#define MEDIA_BUS_FMT_META_1X8_14		0x8004
> > +#define MEDIA_BUS_FMT_META_1X8_16		0x8005
> 
> You skip 0x8006 here in case there will be a _18 variant?

I removed duplicate entries but forgot to change the values. I'll address
that for v2.

There are different packings defined for these formats, sensor generally
using the pixel data equivalent format. With 16 and more bits per sample,
multiple octets of metadata can be transported in that sample, and those
formats are equivalent to the formats at half (or third) of the sample
size. Say, alternative format for 16 bpp image data to 1X8_16 is 1X8_8.

-- 
Kind regards,

Sakari Ailus
