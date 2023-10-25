Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71AC87D74F3
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 21:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjJYT5q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 15:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjJYT5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 15:57:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA39E5
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 12:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698263864; x=1729799864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vHtyDuXJLKwIPKH4ZA1t737LhD/XRfljiQr0q4IO9vQ=;
  b=R2QZP7qI3KOfckPiqb8a6G9vBF6nwwnu/P1UvYQcp8Howvb0bY4XQjyF
   40yID83sLCz2yYHi150iok2CTXo90NaHW+KL6CpeItMik1SK/f5IX3xY9
   1tE4tcDE3xN+2sqiN6WnDWewfivqjekyZNqVIHc2mqy2LfrcWKY0KAeCP
   QN1JVaakuQHGTHef3kyvAcyjM3lhYpWvh2IL0I2y9VN27OmAKbSJd7ez8
   FdmkTKBb3xsPi5rTMjZFclMy3/sh76xRRd2vEWRrha6eWeFKGImRlDXsU
   3G2PeCCNDNRA7e7dSQF0oba7ch8NPouu4zXyE2AEl8Hw26r1XSbJMLThm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="390247622"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="390247622"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 12:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932477843"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="932477843"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 12:57:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qvk0W-00000008fmb-2s94;
        Wed, 25 Oct 2023 22:57:36 +0300
Date:   Wed, 25 Oct 2023 22:57:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
        andreaskleist@gmail.com, claus.stovgaard@gmail.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH v2 02/15] media: intel/ipu6: add IPU auxiliary devices
Message-ID: <ZTlzMA2Cp10UrUS5@smile.fi.intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-3-bingbu.cao@intel.com>
 <ZTe/WBM/kPB+GWKk@smile.fi.intel.com>
 <3da91870-641a-e0fb-1135-b592d5ca3373@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3da91870-641a-e0fb-1135-b592d5ca3373@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 25, 2023 at 03:14:00PM +0800, Bingbu Cao wrote:
> On 10/24/23 8:58 PM, Andy Shevchenko wrote:
> > On Tue, Oct 24, 2023 at 07:29:11PM +0800, bingbu.cao@intel.com wrote:

> auxiliary_bus.h is included in ipu6-bus.h,

So, you have to include it explicitly as IWYU, strictly speaking ipu6-bus.h
does NOT guarantee that inclusion, even if you fully control it.

> list.h, mutex.h dev_printk.h are
> included in device.h,

I ack for dev_printk.h, but for the rest see above.

> dma-mapping.h and scatterlist.h are included in pci.h.

See above.


> I am a little confused about the rule, do you mean we need include the
> generic headers we need even it is included in others header?

Yes. There are only few guarantees in the kernel, strictly speaking. And having
spaghetti headers in your code is a bad idea from long run maintenance
perspective.

...

> >> +#ifndef IPU6_BUS_H
> >> +#define IPU6_BUS_H
> >> +
> >> +#include <linux/auxiliary_bus.h>
> > 
> > ...Especially for headers which will affect the compilation time.
> > 
> >> +#include <linux/pci.h>
> > 
> > This is not used.
> 
> Do you mean it just need a 'struct pci_dev;' ?

Yes.

-- 
With Best Regards,
Andy Shevchenko


