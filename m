Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A663A7D6B3D
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 14:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343809AbjJYMVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 08:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343791AbjJYMVq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 08:21:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701ED13A
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698236504; x=1729772504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TQW4wW9Cin/+hAW3j3f1VrikT3+t2kG6DdQG0d4b5Eg=;
  b=WSHG1IJqHjM/VNZsQgy0eriWO7ehP6T1oKl/lUEX857IA2fvWV5aOVfv
   EC33R7XyenAJYkvClnscwXZ4mofslcXQyr6eaaAc7hig7/OBTlnYP25lR
   HPlgca+ftUlPNgt49iU9dAVlPxhUQCboE1S8lM5TUFiE9kCyruzbOWm8b
   xoo702OUXhYOtenJr0S1s+mrHt/fXdoj+KotF6EaZzfoZGDrQ/N3618yq
   +qH9x0uaBrRV9uFfg8C9nwgg4s4VohfliDYoTYHLQ7tA5GKJrIBwatgqC
   EvZN7nCl4x3vwwRle4NRMQyJVtavqGgbB5L+uITUqmFOQn3i1DjZx4rnH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="386178210"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="386178210"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 05:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="793824617"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="793824617"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 05:21:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 7F74511F82E;
        Wed, 25 Oct 2023 15:21:13 +0300 (EEST)
Date:   Wed, 25 Oct 2023 12:21:13 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH v2 12/15] media: add Kconfig and Makefile for IPU6
Message-ID: <ZTkIOYgvN8CoMa_Z@kekkonen.localdomain>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-13-bingbu.cao@intel.com>
 <ZTfAxXJcGN8tS0kD@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTfAxXJcGN8tS0kD@smile.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Tue, Oct 24, 2023 at 04:04:05PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 24, 2023 at 07:29:21PM +0800, bingbu.cao@intel.com wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
> > 
> > Add IPU6 support in Kconfig and Makefile, with this patch you can
> > build the Intel IPU6 and input system modules by select the
> > CONFIG_VIDEO_INTEL_IPU6 in config.
> 
> ...
> 
> > +	depends on X86 && X86_64
> 
> How is that? One is a superset of the other IIUC.
> 
> ...
> 
> > +intel-ipu6-objs				+= ipu6.o \
> 
> += doesn't seem right.
> Besides that 'objs' is for user space, in kernel we use 'y'.

This is a common pattern used in other Makefiles, too... I guess ":=" would
work, too.

How otherwise would you do this?

It'd be nice to align the object names starting after the column after
"+= ".

> 
> > +					ipu6-bus.o \
> > +					ipu6-dma.o \
> > +					ipu6-mmu.o \
> > +					ipu6-buttress.o \
> > +					ipu6-cpd.o \
> > +					ipu6-fw-com.o
> > +
> > +obj-$(CONFIG_VIDEO_INTEL_IPU6)		+= intel-ipu6.o
> > +
> > +intel-ipu6-isys-objs			+= ipu6-isys.o \
> 
> Ditto.
> 
> > +					ipu6-isys-csi2.o \
> > +					ipu6-fw-isys.o \
> > +					ipu6-isys-video.o \
> > +					ipu6-isys-queue.o \
> > +					ipu6-isys-subdev.o \
> > +					ipu6-isys-mcd-phy.o \
> > +					ipu6-isys-jsl-phy.o \
> > +					ipu6-isys-dwc-phy.o
> > +
> > +obj-$(CONFIG_VIDEO_INTEL_IPU6)		+= intel-ipu6-isys.o
> 

-- 
Regards,

Sakari Ailus
