Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3297D507E
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 14:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbjJXM6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 08:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234385AbjJXM6J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 08:58:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF71190
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698152287; x=1729688287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D+E2NXQoXcpgUq/GiKi1LAh0/rTSX6U6MEULxLjcaf0=;
  b=K6n4yvTa7MAgR7UuBaEH2mdqEVtfEARlZ67JdB6UUhbmHl/SeYhElSMI
   OZH0dQmIiBjOoFZcAECV6NcvNW1/auoYg3kerQtS3dQB86vh2y9/JlV19
   0jJTff5PIH96X+ZOlEPzdXmWU/xmD5sMt8EesX/fZFfz0ztB7AJ/qPGSx
   OrFkFomVeLsSOeW7i2WAX5IsKeb9c2diWnxgkK9UAhEi+c012hnFPGTRO
   bUaGx+WrT+D2fpF07b6um8Q3EAwuuI2fV54xV+nPCw0yNGoTsntu0yf4T
   2XNohEOYR8+4/8+jZdJOtCT1RctkXasIvZANiZDTXhmHlHxaRoEdLkCgZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="385942988"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="385942988"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 05:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="735018062"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="735018062"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 05:58:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qvGyu-00000008Hqk-2xXa;
        Tue, 24 Oct 2023 15:58:00 +0300
Date:   Tue, 24 Oct 2023 15:58:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH v2 02/15] media: intel/ipu6: add IPU auxiliary devices
Message-ID: <ZTe/WBM/kPB+GWKk@smile.fi.intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-3-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024112924.3934228-3-bingbu.cao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 24, 2023 at 07:29:11PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Even the IPU input system and processing system are in a single PCI
> device, each system has its own power sequence, the processing system
> power up depends on the input system power up.
> 
> Besides, input system and processing system have their own MMU
> hardware for IPU DMA address mapping.
> 
> Register the IS/PS devices on auxiliary bus and attach power domain
> to implement the power sequence dependency.

...

Seems again poor / random list of header inclusions...
Please, go through your files and use IWYU (Include What You Use) principle
in them.

> +#include <linux/pci.h>

auxiliary_bus.h, err.h, list.h, mutex.h, dev_printk.h, slab.h, dma-mapping.h are missing.
You are lucky it does compile.

...

> +#ifndef IPU6_BUS_H
> +#define IPU6_BUS_H
> +
> +#include <linux/auxiliary_bus.h>

...Especially for headers which will affect the compilation time.

> +#include <linux/pci.h>

This is not used.

...

> +	struct list_head list;

+ types.h

> +	struct sg_table fw_sgt;

+ scatterlist.h

> +	dma_addr_t pkg_dir_dma_addr;

types.h

...

> +struct ipu6_auxdrv_data {
> +	irqreturn_t (*isr)(struct ipu6_bus_device *adev);
> +	irqreturn_t (*isr_threaded)(struct ipu6_bus_device *adev);

irqreturn.h

> +	bool wake_isr_thread;
> +};

...

> +#define to_ipu6_bus_device(_dev) container_of(to_auxiliary_dev(_dev), \
> +					      struct ipu6_bus_device, auxdev)
> +#define auxdev_to_adev(_auxdev) container_of(_auxdev, \
> +					     struct ipu6_bus_device, auxdev)

container_of.h

Also, can you reformat to be more readable like

#define auxdev_to_adev(_auxdev)					\
	container_of(_auxdev, struct ipu6_bus_device, auxdev)

> +#define ipu6_bus_get_drvdata(adev) dev_get_drvdata(&(adev)->auxdev.dev)

device.h

...

> +	ret = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to set max_seg_size\n");

With the help of

	struct device *dev = &pdev->dev;

this and other lines become neater


	ret = dma_set_max_seg_size(dev, _DMA_SEGMENT_SIZE); // as I commented earlier about
	if (ret)
		return dev_err_probe(dev, ret, "Failed to set max_seg_size\n");

-- 
With Best Regards,
Andy Shevchenko


