Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E767D2CB1
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 10:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjJWI2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 04:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjJWI2d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 04:28:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45476C0
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 01:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698049711; x=1729585711;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Ds2wxz0Hwf4Vjf49KrzliMGYFmCfxbhKd2fziIqg+0Y=;
  b=ZrzCxh4TvzSMmgJd36rSV/eqlpx4XT4SmijtOVdG57bUpf331bD0RFcv
   poVQ3/yrIzD0DEK+o7nDOd1FMP6CirJX1UXF/NLPbf4aFBgz0Nzv/YaAb
   THgQalTyY0vglrRpLIMupxqNXOnUaAj5FE8e8UIUwhgWvY6Eu6oglYAXx
   JRVoinDjzmHrGAMcplG2mtmtJshCzoDpH0UxXMHOTXdesa0lFernUAGq2
   cwYRtLkmd5Tmx574yv//VQenVR64/qxt1PiTfkgWtHBikz/86Z27rHRt6
   ptj515zglsdN5bPJdcrbrjqOBiYo9ZYsWkxSQsPhccsHALLfgsG7sAuTk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="453263465"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="453263465"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 01:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="823893927"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="823893927"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by fmsmga008.fm.intel.com with ESMTP; 23 Oct 2023 01:28:27 -0700
Subject: Re: [PATCH 10/15] media: intel/ipu6: add input system driver
To:     Hans de Goede <hdegoede@redhat.com>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com, claus.stovgaard@gmail.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-11-bingbu.cao@intel.com>
 <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
 <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
 <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com>
 <9d5d0bd8-41d1-4879-fccf-54e56aaa5073@redhat.com>
 <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com>
 <83426573-8c4b-ec20-6916-2917aa06954f@redhat.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <c79258d1-78fb-895e-dc70-3985bf8cc5a5@linux.intel.com>
Date:   Mon, 23 Oct 2023 16:23:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <83426573-8c4b-ec20-6916-2917aa06954f@redhat.com>
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

Hans,

>>>> but I think it
>>>> is correct for IPU6 as well. The reason is that isys_driver is an
>>>> auxiliary_driver, so I don't think 
>>>>
>>>>     MODULE_DEVICE_TABLE(pci, isys_pci_tbl);
>>>>
>>>> has any effect. The PCI probe happens in ipu6_pci_probe in ipu6.c
>>>> (because it has a pci_device_id table as well), and the isys_driver
>>>> is
>>>> probed indirectly by ipu6-bus.c.
>>>
>>> So the MODULE_DEVICE_TABLE(pci, isys_pci_tbl) indeed does not
>>> belong in this auxbus driver, instead it should use some sort
>>> of auxbus MODULE_DEVICE_TABLE() to autoload based on its
>>> auxbus modalias.
>>>
>>> But it does have an effect, modprobe will load both the main
>>> ipu6 driver registering the aux devices as well as this driver
>>> based on the modalias of the PCI device because with this
>>> MODULE_DEVICE_TABLE(pci, isys_pci_tbl); statement both drivers
>>> match that PCI modalias.
>>
>> All right. But since the main driver contains the same table, I don't
>> think there's any need to have it here?
>>
>>> But the correct thing to do here would be to switch to
>>> an auxbus based MODULE_DEVICE_TABLE() for the isys driver.
>>
>> The isys_driver already has an auxiliary_device_id table. I'm not sure
>> if that's what you mean?
>>
>> From the bottom of ipu6-isys.c in PATCH 10/15:
>>
>> +static const struct auxiliary_device_id ipu6_isys_id_table[] = {
>> +	{
>> +		.name = "intel_ipu6.isys",
>> +		.driver_data = (kernel_ulong_t)&ipu6_isys_auxdrv_data,
>> +	},
>> +};
> 
> Right, so this needs a:
> 
> MODULE_DEVICE_TABLE(auxiliary, ipu6_isys_id_table);

Ack, thanks. I will send v2 this week including the fixes.
> 
> And then the:
> 
> MODULE_DEVICE_TABLE(pci, isys_pci_tbl)
> 
> and any other mention of isys_pci_tbl can be dropped.
> 
> Regards,
> 
> Hans
> 

-- 
Best regards,
Bingbu Cao
