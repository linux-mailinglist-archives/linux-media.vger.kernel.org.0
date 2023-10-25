Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6D8B7D6249
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 09:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbjJYHSq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 03:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbjJYHSo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 03:18:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85854182
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 00:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698218321; x=1729754321;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=bsgKNSsQcmgS05tdD4U6HKU1iAmfiEMfcpDsgcX2uL0=;
  b=czfq6fcyRIFJK1LSDx0z26KKaBmFssNYJfOa09gxoGjiWggyGS35VKKH
   tC7Zs30xhkfmWyDUxExNtbY6geEtZ3ESsjwHBhsutjVr+QtsRdxlwDDYb
   8tJ72XdcPpWjEEpbagn9ip0mkLWMnjxdvUNI6dYTAq+ZsRUqPnlRg6AfR
   //GCwP35c9yv3+KTBZ0VMNz2b1Ri83DjbOlcO8hdYpuFi9dDE8LrDuXoB
   moi8zzQLNd+jVlH7tmnUiWQlyhGtuGhih2zUYFyB9n1nRJ7D6k1qzMoSC
   GO5S2g8P/5DgI8siKqjHCft9iB0CgnrI8Zd32pl5ks2PDVf9/Zgupbos/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="390108735"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="390108735"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 00:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="932272585"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="932272585"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by orsmga005.jf.intel.com with ESMTP; 25 Oct 2023 00:18:37 -0700
Subject: Re: [PATCH v2 02/15] media: intel/ipu6: add IPU auxiliary devices
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-3-bingbu.cao@intel.com>
 <ZTe/WBM/kPB+GWKk@smile.fi.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <3da91870-641a-e0fb-1135-b592d5ca3373@linux.intel.com>
Date:   Wed, 25 Oct 2023 15:14:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ZTe/WBM/kPB+GWKk@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Andy,

Thanks for your review.

On 10/24/23 8:58 PM, Andy Shevchenko wrote:
> On Tue, Oct 24, 2023 at 07:29:11PM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Even the IPU input system and processing system are in a single PCI
>> device, each system has its own power sequence, the processing system
>> power up depends on the input system power up.
>>
>> Besides, input system and processing system have their own MMU
>> hardware for IPU DMA address mapping.
>>
>> Register the IS/PS devices on auxiliary bus and attach power domain
>> to implement the power sequence dependency.
> 
> ...
> 
> Seems again poor / random list of header inclusions...
> Please, go through your files and use IWYU (Include What You Use) principle
> in them.
> 
>> +#include <linux/pci.h>
> 
> auxiliary_bus.h, err.h, list.h, mutex.h, dev_printk.h, slab.h, dma-mapping.h are missing.
> You are lucky it does compile.

auxiliary_bus.h is included in ipu6-bus.h, list.h, mutex.h dev_printk.h are
included in device.h, dma-mapping.h and scatterlist.h are included in pci.h.

I am a little confused about the rule, do you mean we need include the
generic headers we need even it is included in others header?

> 
> ...
> 
>> +#ifndef IPU6_BUS_H
>> +#define IPU6_BUS_H
>> +
>> +#include <linux/auxiliary_bus.h>
> 
> ...Especially for headers which will affect the compilation time.
> 
>> +#include <linux/pci.h>
> 
> This is not used.

Do you mean it just need a 'struct pci_dev;' ?
> 
> ...
> 
>> +	struct list_head list;
> 
> + types.h
> 
>> +	struct sg_table fw_sgt;
> 
> + scatterlist.h
> 
>> +	dma_addr_t pkg_dir_dma_addr;
> 
> types.h
> 
> ...
> 
>> +struct ipu6_auxdrv_data {
>> +	irqreturn_t (*isr)(struct ipu6_bus_device *adev);
>> +	irqreturn_t (*isr_threaded)(struct ipu6_bus_device *adev);
> 
> irqreturn.h
> 
>> +	bool wake_isr_thread;
>> +};
> 
> ...
> 
>> +#define to_ipu6_bus_device(_dev) container_of(to_auxiliary_dev(_dev), \
>> +					      struct ipu6_bus_device, auxdev)
>> +#define auxdev_to_adev(_auxdev) container_of(_auxdev, \
>> +					     struct ipu6_bus_device, auxdev)
> 
> container_of.h
> 
> Also, can you reformat to be more readable like
> 
> #define auxdev_to_adev(_auxdev)					\
> 	container_of(_auxdev, struct ipu6_bus_device, auxdev)

Ack.

> 
>> +#define ipu6_bus_get_drvdata(adev) dev_get_drvdata(&(adev)->auxdev.dev)
> 
> device.h
> 
> ...
> 
>> +	ret = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret,
>> +				     "Failed to set max_seg_size\n");
> 
> With the help of
> 
> 	struct device *dev = &pdev->dev;
> 
> this and other lines become neater
> 
> 
> 	ret = dma_set_max_seg_size(dev, _DMA_SEGMENT_SIZE); // as I commented earlier about
> 	if (ret)
> 		return dev_err_probe(dev, ret, "Failed to set max_seg_size\n");

Ack.

> 

-- 
Best regards,
Bingbu Cao
