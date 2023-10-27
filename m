Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA9A7DA1E4
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 22:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbjJ0UnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 16:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbjJ0UnQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 16:43:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8C31B5
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 13:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698439394; x=1729975394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RPMrLW0ABw25O3G/5StMrSOPJX/N/0to1fe8QINQU7w=;
  b=A85C8C9xH7SwSCPe0zJC0UUvppPhnA7BWQIrMx/hXN+9c9u3Jsi0dDwt
   kBtzPbpSFZr00pcfHbRlXtz6v2V2D3saMLmbrfyUNoSPPOeyX00hOsDJI
   ZTXhtKROeiPi6UxdCRvos7CRv4Ps2Pq764ofTWiZDuIiAJ3fRuicqJXU2
   WK+ZAu8z2ClAUb0D8D5bOiBT3v2wmcUKI4EePMgGRD08X3SxT8XgwH2Nr
   9d0Su8SvIntQlawXeyH4NdjIuvhLGuAZjxv3qhti5oiVAO5jdXIG6xPUB
   EWZikqZ356NMjMdOdqnqnNOIooORqnjQbSJZVPZSnleGthfUb2guhhSe+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="674490"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="674490"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 13:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="876459929"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="876459929"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 13:43:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id F120F11F830;
        Fri, 27 Oct 2023 23:43:07 +0300 (EEST)
Date:   Fri, 27 Oct 2023 20:43:07 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 02/28] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <ZTwg2ycfJ77y8MZ_@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-3-sakari.ailus@linux.intel.com>
 <20231027144742.GC19539@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027144742.GC19539@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Oct 27, 2023 at 05:47:42PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thanks for the review!

> 
> On Tue, Oct 03, 2023 at 02:52:30PM +0300, Sakari Ailus wrote:
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
> >  .../userspace-api/media/glossary.rst          |   8 +
> >  .../media/v4l/subdev-formats.rst              | 258 ++++++++++++++++++
> >  include/uapi/linux/media-bus-format.h         |   9 +
> >  3 files changed, 275 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> > index f7b99a4527c7..65217b8a44cc 100644
> > --- a/Documentation/userspace-api/media/glossary.rst
> > +++ b/Documentation/userspace-api/media/glossary.rst
> > @@ -25,6 +25,14 @@ Glossary
> >  
> >  	See :ref:`cec`.
> >  
> > +.. _media-glossary-data-unit:
> > +
> > +    Data unit
> > +
> > +	Unit of data transported by a bus. On parallel buses, this is called a
> > +	sample while on serial buses the data unit is logical. If the data unit
> > +	is image data, it may also be called a pixel.
> 
> I don't think this is correct. There are parallel formats that transmit
> multiple pixels per sample (e.g. UYYVYY8_0_5X24), or use multiple
> samples to transmit on pixel (e.g. YUYV8_2X8).

The text needs to be adjusted for parallel buses. How about:

	Unit of data transported on a bus. On parallel buses, a data unit
	consists of one or more samples that together form a single logical
	unit of data while on serial buses a data unit is purely logical.
	If a data unit is image data, it may also be called a pixel.

> > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > index a03c543cb072..9ee031397372 100644
> > --- a/include/uapi/linux/media-bus-format.h
> > +++ b/include/uapi/linux/media-bus-format.h
> > @@ -173,4 +173,13 @@
> >   */
> >  #define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
> >  
> > +/* Generic line based metadata formats for serial buses. Next is 0x8008. */
> > +#define MEDIA_BUS_FMT_META_8			0x8001
> > +#define MEDIA_BUS_FMT_META_10			0x8002
> > +#define MEDIA_BUS_FMT_META_12			0x8003
> > +#define MEDIA_BUS_FMT_META_14			0x8004
> > +#define MEDIA_BUS_FMT_META_16			0x8005
> > +#define MEDIA_BUS_FMT_META_20			0x8006
> > +#define MEDIA_BUS_FMT_META_24			0x8007
> 
> One thing I'd like to do at some point is to fix the historical mistake
> we make when adding raw image formats that encode the CFA pattern in the
> format itself. While this isn't on-topic for this series, I will then
> need to add RAW_{8,10,12,...} media bus codes, which will essentially
> describe the same format as the above formats. Could we already unify
> them, and add CSI-2 RAW formats instead of metadata-specific formats
> here ?

Am I right if my understanding of your view is RAW_* formats would only
include raw image formats of various colour components, on different pixel
orders, and non-raw image formats would have similar arrangements?

I'd say still metadata formats should be separate so you can distinguish
the type of the data (non-image data).

Ultimately the question is what we want to specify and where, but there
appear to be at least three things:

- Pixel depth
- Type of format (raw, yuv, metadata...)
- Colour components
- Pixel order for raw formats or order of transmission for non-raw formats

We've used the mbus code to describe all three. At least my hunch is now
that we'd use mbus code and format to denote the two first at least.

-- 
Regards,

Sakari Ailus
