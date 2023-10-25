Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B10F67D65B1
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 10:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234523AbjJYIsU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 04:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234383AbjJYIsE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 04:48:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34476198
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698223678; x=1729759678;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=iFgdd7n6jpiZHjuvHGlk+Kwl29ROGYWxoodHZQRwA7M=;
  b=eKSwqEQfN6P3zA3zl2zc2mvrzRWaLKXD8tkl4UiBWfmxTrulmFW3qf4N
   jklP8OpsA8rezrKkqSroDKQPUaP9QHQHqdZwW/FtKCcY3l8uG2TCfHPeo
   ehtddjuZQp66rh/aNW48Hd8n4bnvkatt7RMcvFUnpVMkmOWGsx6BKpyzc
   /E9o+IOjPQHO5W0tNSfmIyo1LgGO5OC/EH5m94s3G2zeKRTpdKsLgAtXN
   7rGUZcgLPQCFwLpPbmRvJG4Cq9XrIYTK9Hc7SXIPQ24XgAkWqmhErmq7N
   CWz/OjVL6d0TjIpXjzlu4mVdIkHy4cyaI482sr5OMRWy14BycGnnKt2Jl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="473502298"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="473502298"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 01:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="793790607"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="793790607"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by orsmga001.jf.intel.com with ESMTP; 25 Oct 2023 01:47:53 -0700
Subject: Re: [PATCH v2 12/15] media: add Kconfig and Makefile for IPU6
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-13-bingbu.cao@intel.com>
 <ZTfAxXJcGN8tS0kD@smile.fi.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <840ba517-4739-16ed-9d00-f79a3e6016fb@linux.intel.com>
Date:   Wed, 25 Oct 2023 16:43:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ZTfAxXJcGN8tS0kD@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Andy,

Thanks for the review.

On 10/24/23 9:04 PM, Andy Shevchenko wrote:
> On Tue, Oct 24, 2023 at 07:29:21PM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Add IPU6 support in Kconfig and Makefile, with this patch you can
>> build the Intel IPU6 and input system modules by select the
>> CONFIG_VIDEO_INTEL_IPU6 in config.
> 
> ...
> 
>> +	depends on X86 && X86_64
> 
> How is that? One is a superset of the other IIUC.

It's trying to prevent build IPU6 with other arch such as 'UM'.

# make W=1 O=build_dir ARCH=um olddefconfig
ipu6-dma.c:... error: implicit declaration of function 'clflush_cache_range';

X86_64 looks like not an actual architecture.

> 
> ...
> 
>> +intel-ipu6-objs				+= ipu6.o \
> 
> += doesn't seem right.
> Besides that 'objs' is for user space, in kernel we use 'y'.
> 
>> +					ipu6-bus.o \
>> +					ipu6-dma.o \
>> +					ipu6-mmu.o \
>> +					ipu6-buttress.o \
>> +					ipu6-cpd.o \
>> +					ipu6-fw-com.o
>> +
>> +obj-$(CONFIG_VIDEO_INTEL_IPU6)		+= intel-ipu6.o
>> +
>> +intel-ipu6-isys-objs			+= ipu6-isys.o \
> 
> Ditto.

Ack.

> 
>> +					ipu6-isys-csi2.o \
>> +					ipu6-fw-isys.o \
>> +					ipu6-isys-video.o \
>> +					ipu6-isys-queue.o \
>> +					ipu6-isys-subdev.o \
>> +					ipu6-isys-mcd-phy.o \
>> +					ipu6-isys-jsl-phy.o \
>> +					ipu6-isys-dwc-phy.o
>> +
>> +obj-$(CONFIG_VIDEO_INTEL_IPU6)		+= intel-ipu6-isys.o
> 

-- 
Best regards,
Bingbu Cao
