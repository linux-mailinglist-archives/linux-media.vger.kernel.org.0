Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C71D7CF2A3
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 10:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235314AbjJSIcE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 04:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235225AbjJSIb6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 04:31:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5528F183
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697704316; x=1729240316;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=t2XXawFXdtGUyINF/KSIj17ode99crz5cTk31LwFE6E=;
  b=SKQa++Yqimf2EnoU7IV0Wg/Qr8HNTZeWAxOxZwgUrTNw56p+Xk86AkRQ
   QsDdFdSpWbl+/hBJabLJp1cu42lAj5OJmEzbki2Val9F6EomB+0jtj/cM
   r20YQTgMaemsTu+lLzzNJskmpe5dSX9wMCDk0V+mJU+wbOmRdrTaIsw72
   NQ5TJLdzmZ4zAy9d+MEgqksMn2o4SGpevD8qOKqimvgI1EpyYf4Hq1ddS
   TUX6WRMUxsIysKoUzc8CjEJkGPG0/ABhOvddlkOPnyHCIqOz6X9ma1wDl
   3N2DSRc5ZzmVEmofX4PlYcaQF1unFWHDyAq9DFhPl4FQL74vtfSi7HS4B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="371265707"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="371265707"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 01:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="786275162"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="786275162"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by orsmga008.jf.intel.com with ESMTP; 19 Oct 2023 01:31:48 -0700
Subject: Re: [PATCH 12/15] media: add Kconfig and Makefile for IPU6
To:     Andreas Helbech Kleist <andreaskleist@gmail.com>,
        bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-13-bingbu.cao@intel.com>
 <069207da98e6445f0c70c74ba1e1bdb7c46ba25a.camel@gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <bcb23c29-a269-6865-fdcf-20f184fe0897@linux.intel.com>
Date:   Thu, 19 Oct 2023 16:28:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <069207da98e6445f0c70c74ba1e1bdb7c46ba25a.camel@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Andreas,

On 10/3/23 6:13 PM, Andreas Helbech Kleist wrote:
> Hi,
> 
> On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Add IPU6 support in Kconfig and Makefile, with this patch you can
>> build the Intel IPU6 and input system modules by select the
>> CONFIG_VIDEO_INTEL_IPU6 in config.
> 
>> +++ b/drivers/media/pci/intel/ipu6/Kconfig
>> @@ -0,0 +1,15 @@
>> +config VIDEO_INTEL_IPU6
>> +       tristate "Intel IPU6 driver"
>> +       depends on ACPI || COMPILE_TEST
>> +       depends on MEDIA_SUPPORT
>> +       depends on MEDIA_PCI_SUPPORT
>> +       depends on X86 && X86_64
>> +       select IOMMU_IOVA
>> +       select VIDEOBUF2_DMA_CONTIG
>> +       select V4L2_FWNODE
> 
> This is still missing VIDEO_V4L2_SUBDEV_API as mentioned in the RFC
> series:
> https://lore.kernel.org/all/20230706085736.1915096-1-andreaskleist@gmail.com/

Ack, thanks!

> 
> Best regards,
> Andreas
> 

-- 
Best regards,
Bingbu Cao
