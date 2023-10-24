Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5325D7D50EF
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 15:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234674AbjJXNGX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 09:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbjJXNGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 09:06:00 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9DB4C3E
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698152655; x=1729688655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oguzC3Gr6ggw3J4hnP579p4BgZX323Tfnl7KGZQhve8=;
  b=MXA6/BoEEAl+E48lTAmaSrZ9udYzKJWuUbE1iIgb0h7umgrlothgGn7P
   Y3QJHs1c3XPqskTmIQdPB52CxQdKTD/pNgKqT1nOT5rPQgJllUjUvwhsR
   v4liq2BWyg3FhEtZ6O5WHC5Bx4yh1p4usWlUmjGNAr6CJ+chVBEQS6YQW
   CeyNXI5HVcSage6yYBNIl2CbftSrtkehNM10l9HeWFKj2UOti18LFo5cQ
   P4JOFW+DvI4ivTKxRiumPOmbq90dwWI8rKonMOzGBgQVcUODKdrZ4QC2m
   nJUasC/cjBxZC6Yje296CPQPugercUNKO9jtwTz0ckjbtOl88t7w1u65G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="389899446"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="389899446"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 06:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="793477385"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="793477385"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 06:04:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qvH4n-00000008Hw2-2KTz;
        Tue, 24 Oct 2023 16:04:05 +0300
Date:   Tue, 24 Oct 2023 16:04:05 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH v2 12/15] media: add Kconfig and Makefile for IPU6
Message-ID: <ZTfAxXJcGN8tS0kD@smile.fi.intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-13-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024112924.3934228-13-bingbu.cao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 24, 2023 at 07:29:21PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Add IPU6 support in Kconfig and Makefile, with this patch you can
> build the Intel IPU6 and input system modules by select the
> CONFIG_VIDEO_INTEL_IPU6 in config.

...

> +	depends on X86 && X86_64

How is that? One is a superset of the other IIUC.

...

> +intel-ipu6-objs				+= ipu6.o \

+= doesn't seem right.
Besides that 'objs' is for user space, in kernel we use 'y'.

> +					ipu6-bus.o \
> +					ipu6-dma.o \
> +					ipu6-mmu.o \
> +					ipu6-buttress.o \
> +					ipu6-cpd.o \
> +					ipu6-fw-com.o
> +
> +obj-$(CONFIG_VIDEO_INTEL_IPU6)		+= intel-ipu6.o
> +
> +intel-ipu6-isys-objs			+= ipu6-isys.o \

Ditto.

> +					ipu6-isys-csi2.o \
> +					ipu6-fw-isys.o \
> +					ipu6-isys-video.o \
> +					ipu6-isys-queue.o \
> +					ipu6-isys-subdev.o \
> +					ipu6-isys-mcd-phy.o \
> +					ipu6-isys-jsl-phy.o \
> +					ipu6-isys-dwc-phy.o
> +
> +obj-$(CONFIG_VIDEO_INTEL_IPU6)		+= intel-ipu6-isys.o

-- 
With Best Regards,
Andy Shevchenko


