Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 469287CF29E
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 10:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbjJSIbU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 04:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232852AbjJSIbT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 04:31:19 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83B912F
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697704277; x=1729240277;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=X4iGSXBx+JWu6WfHSYYQkN/4Z1pdbv3nARXw88rfDfU=;
  b=aQlIWd8+EZMtypeqAdlxXFB7ORfIx1OygWKlo1iWbh/1CUMmK91bWKwR
   hRfYMax710JSn2gotgkTnC9+HRCXoueNAJhqzlknJVSV/crvCPL5OksfA
   ofm0GdEuGZebxcsKnaNKRMV0xj3PS9WZVcfl17UT8eCHXquLpjP6WNJIk
   0PlDWyTUvufmNEO3abVZ9XI9ug8qD878pyndmyBBXZDhbLzAYWyqY/RVU
   lOIA8MRQ50bS4w5J58lLixsDb9UYy3EqucZ69gMd3GENKTWfykYJ5ooIm
   OMsFUIZTu/z9aKW0Z5xaV3r+b58zoGiui77//TqSoQ0MuHNO4qhPMu6UW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="7756467"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="7756467"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 01:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="786274786"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="786274786"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by orsmga008.jf.intel.com with ESMTP; 19 Oct 2023 01:31:12 -0700
Subject: Re: [PATCH 10/15] media: intel/ipu6: add input system driver
To:     Andreas Helbech Kleist <andreaskleist@gmail.com>,
        bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-11-bingbu.cao@intel.com>
 <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
Date:   Thu, 19 Oct 2023 16:28:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
>> Input system driver do basic isys hardware setup and irq handling
>> and work with fwnode and v4l2 to register the ISYS v4l2 devices.
> 
>> +       media_device_pci_init(&isys->media_dev,
>> +                             pdev, IPU6_MEDIA_DEV_MODEL_NAME);
>> +
>> +       strscpy(isys->v4l2_dev.name, isys->media_dev.model,
>> +               sizeof(isys->v4l2_dev.name));
>> +
>> +       ret = media_device_register(&isys->media_dev);
>> +       if (ret < 0)
>> +               goto out_media_device_unregister;
> ...
>> +out_media_device_unregister:
>> +       media_device_unregister(&isys->media_dev);
>> +       media_device_cleanup(&isys->media_dev);
> 
> You should only call media_device_cleanup() if media_device_register()
> fails.
> 
> 
>> +static const struct pci_device_id isys_pci_tbl[] = {
>> +       { PCI_VDEVICE(INTEL, IPU6_PCI_ID) },
>> +       { PCI_VDEVICE(INTEL, IPU6SE_PCI_ID) },
>> +       { PCI_VDEVICE(INTEL, IPU6EP_ADL_P_PCI_ID) },
>> +       { PCI_VDEVICE(INTEL, IPU6EP_ADL_N_PCI_ID) },
>> +       { PCI_VDEVICE(INTEL, IPU6EP_RPL_P_PCI_ID) },
>> +       { PCI_VDEVICE(INTEL, IPU6EP_MTL_PCI_ID) },
>> +       { }
>> +};
> 
> Unused

Have you tried that whether isys driver can be auto-loaded w/o
this pci id table? It cannot on my side.

> 
>> +static const struct auxiliary_device_id ipu6_isys_id_table[] = {
>> +       {
>> +               .name = "intel_ipu6.isys",
>> +               .driver_data =
>> (kernel_ulong_t)&ipu6_isys_auxdrv_data,
>> +       },
>> +};
> 
> Missing sentinel {}.
> 
> 
> Best regards,
> Andreas
> 

-- 
Best regards,
Bingbu Cao
