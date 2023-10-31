Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0DF47DCE15
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 14:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344587AbjJaNls (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 09:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344561AbjJaNls (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 09:41:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58FA9F;
        Tue, 31 Oct 2023 06:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698759705; x=1730295705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HIB3SZjfCNG11GTudj4jsu6O4/8FayWcAc+P32hYbQc=;
  b=XxerQenytUpW4AeSlfWLFDH4enPVlC8G8wmkYN+FzoEJe3Pi/6R5JQRC
   N5ij5piwj44U+ZF6KgDPrV4/1DLnD73vc9ghChwqkGlyXt78lGZ8bLB0O
   PT4rAl78Bqau0b0kBqEIMnr41Dz3Km5gDrDeygv5JZLmb2hMZjToOggvv
   rLaCqVNEl7YAafNcnn26qUOwkidkPdhuKZq40ZNQ4NlNAM3Ys77AQfvW6
   1dHft29kLdLhajLNnbHKHK2fUZhlX8qZuEvdmXazpTunk+fVyThW3lb8V
   LH9GWg6nTNdloOAkGV1NCOPRINIASDWtKuNFoTJnJzk50ZKAXMggt9IUQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="368494340"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="368494340"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 06:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="795579232"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="795579232"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 06:41:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qxozm-0000000A9rT-004i;
        Tue, 31 Oct 2023 15:41:26 +0200
Date:   Tue, 31 Oct 2023 15:41:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 3/3] media: i2c: Add driver for THine THP7312
Message-ID: <ZUEEBXfjTPqnnL9b@smile.fi.intel.com>
References: <20231017132103.9914-1-laurent.pinchart@ideasonboard.com>
 <20231017132103.9914-4-laurent.pinchart@ideasonboard.com>
 <ZTutbU1XG_jKZbIp@valkosipuli.retiisi.eu>
 <20231027124529.GA19539@pendragon.ideasonboard.com>
 <ZTvOIQSmpytUisUD@valkosipuli.retiisi.eu>
 <20231028151858.GB20465@pendragon.ideasonboard.com>
 <ZT9kwC3abUKR9fgQ@valkosipuli.retiisi.eu>
 <20231030104241.GJ12144@pendragon.ideasonboard.com>
 <ZUDatMX10WK0bdid@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUDatMX10WK0bdid@valkosipuli.retiisi.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 31, 2023 at 10:45:32AM +0000, Sakari Ailus wrote:
> On Mon, Oct 30, 2023 at 12:42:41PM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 30, 2023 at 08:09:36AM +0000, Sakari Ailus wrote:
> > > On Sat, Oct 28, 2023 at 06:18:58PM +0300, Laurent Pinchart wrote:
> > > > On Fri, Oct 27, 2023 at 02:50:09PM +0000, Sakari Ailus wrote:
> > > > > On Fri, Oct 27, 2023 at 03:45:29PM +0300, Laurent Pinchart wrote:

...

> > > > > > > > +#include <linux/of_device.h>

I believe this shouldn't (mustn't?) be used in a new code.
Rob have been doing a big job of replacing some OF-specific
APIs by generic ones.

...

> > > > > > > uapi/linux/thp7321.h ?

Why does the driver even have that?! Does it allow direct IOCTLs? Some
other hardware information that should be supplied via "abstract"
(presumably existing IOCTL)?

...

> > > > > > > > +	sensor->dev->parent = dev;
> > > > > > > > +	sensor->dev->of_node = of_node_get(sensor->of_node);

This should be device_set_node().

> > > > > > > This device could well find its way to a non-OF system. Could you use the
> > > > > > > fwnode property API instead?
> > > > > > 
> > > > > > I'm pretty sure there will be problems if someone was using this driver
> > > > > > on an ACPI-based system, so trying to pretend it's supported without
> > > > > > being able to test it may not be the best use of development time. I'll
> > > > > > try, but if I hit any issue, I'll keep using the OF-specific functions
> > > > > > in the next version.

Besides ACPI it may be other ways of instantiating the driver.
And we, in general, asking for creating OF-independent drivers as long
as there is no strong evidence that the platform itself and the particular
hardware never ever will have anything than OF. And it almost always
not true for discrete (outside the SoC) components.

> > > > > I'd suggest to use OF functions if there's no corresponding fwnode function
> > > > > available. The intention is they cover the same scope, so it is likely
> > > > > something that's missing will be added sooner or later.
> > > > 
> > > > I understand, but if the conversion is not complete, it's not very
> > > > valuable. I have no objection against using the fwnode API in the
> > > > driver, but I'll let someone else handle it when and if needed.
> > > 
> > > If you leave it using OF-only API now in a driver that is not bound to OF
> > > in any way, someone moving it to fwnode later may not be able to test it on
> > > OF, increasing the likelihood something breaks. So use fwnode API where you
> > > can now, and we'll address that one call later on.
> > 
> > Sorry, this is extra work for very little gain (if any) now, so I don't
> > plan to do so if I can't implement a full conversion.
> 
> I don't see why would you leave this for someone else to clean up later.
> It's called "technical debt". Similarly, we have no ACPI-only sensor
> drivers that would use ACPI specific functions that would not be available
> on non-ACPI systems --- they've all used the fwnode API, missing just
> regulators, clocks and GPIOs.

I agree with Sakari. Let's reduce the scope of ACPI/OF/etc-specific functions
in the drivers. There are really little that have no generic counterparts.
And most of the usages are special cases.

> If you like, I think we could have an fwnode version of the same function,
> to be used with DT binding compliant format for the device in ACPI DSDT.
> Plain ACPI would have no need for the function.

-- 
With Best Regards,
Andy Shevchenko


