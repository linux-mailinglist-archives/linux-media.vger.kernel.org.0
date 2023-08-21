Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A6E7823AF
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 08:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbjHUGZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 02:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjHUGZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 02:25:14 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921F6A2
        for <linux-media@vger.kernel.org>; Sun, 20 Aug 2023 23:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692599112; x=1724135112;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=0h+a1+akNNzbL12sh/RHE04j6UuqaaFM8lD4RdqvjUQ=;
  b=YVf1GGA2+vvkGx84IgHt0tTupDY7sGO8mUcu4asRdPDMCoo5B3HrzxsY
   XE1pigw/R6gwLC2zwx2yncrJqAOIuV5yU2dyDj9Od7ocasABVd3L/wlwm
   vqdYesCbsPpEAEMh6JkcUIjcrzlX8SHSoNbLXBJ7RiBnl175iMvBk2u7/
   PDbGLGM0ebBK/NajU+6YaAUpbR05Y9/T7anB0k5lbHOYlCWvoQsBbhFKw
   masy/KQPfq7SBqBw5rI2W9xTsAdG5EH2viBkU1Gc1zBVGyDWmqiP3nv3G
   UkkOPY5mdLXR4gP5kSR5CufSVw0LtMwMecA+8w8KaWARWZWbCejUePZF+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="372407839"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="372407839"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2023 23:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="685541917"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="685541917"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by orsmga003.jf.intel.com with ESMTP; 20 Aug 2023 23:25:07 -0700
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
To:     Claus Stovgaard <claus.stovgaard@gmail.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
 <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
Message-ID: <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
Date:   Mon, 21 Aug 2023 14:22:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Claus,


On 8/21/23 11:14 AM, Bingbu Cao wrote:
> Hi, Claus,
> 
> Thanks for your mail.
> 
> On 8/20/23 11:09 PM, Claus Stovgaard wrote:
>> On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>> This patch series adds a driver for Intel IPU6 input system.
>>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>>> device which can be found in some Intel Client Platforms. User can
>>> use
>>> IPU6 to capture images from MIPI camera sensors.
>>>
>>>
>>
>> Hello Bingbu.
>>
>> First thanks for your work in upstreaming the IPU6 isys driver, and the
>> updates with v1 of the patch series.
>>
>> I am trying to test it on a Dell XPS 9320 (0AF3) laptop
>>
>> First - The patch series does not apply cleanly on linus 6.5-rc6, nor
>> the linux-media master.
> 
> I think it is caused by some media changes was queued after I send
> this patch - such as ipu-bridge, ivsc, v4l2-async, etc. So it
> needs some rebase work.
> 
>>
>> For v6.5-rc6 I have an issue with
>>
>> Patch failed at 0012 media: add Kconfig and Makefile for IPU6
>> When you have resolved this problem, run "git am --continue".
>> If you prefer to skip this patch, run "git am --skip" instead.
>> To restore the original branch and stop patching, run "git am --abort".
>> error: drivers/media/pci/intel/Kconfig: does not exist in index
>> error: patch failed: drivers/media/pci/intel/Makefile:4
>> error: drivers/media/pci/intel/Makefile: patch does not apply
>>
>> For linux media it fails after commit 
>> https://git.linuxtv.org/media_tree.git/commit/?id=dd61c2a380037166517214957790a1486ae5d348
>> media: mediatek: vcodec: Consider vdecsys presence in reg range check
>>
>> As next commit is
>> https://git.linuxtv.org/media_tree.git/commit/?id=bda8953e8c3e7ecbbf6cb1be11790496300e3961
>> media: v4l: async: Drop v4l2_async_nf_parse_fwnode_endpoints()
>>
>> It fails on the v4l parts, and of cause the newer commits regarding
>> v4l: async in the linux-media master branch. So the IPU6 patch series
>> need a refresh to fit the linux-media.
>>
>> I did a custom branch from linus tag v6.5-rc5 with the commits from
>> linux-media up to the "Drop v4l2_async_nf_parse_fwnode_endpoints()" and
>> then applied the IPU6 patches on top.
>> https://github.com/frosteyes/linux/tree/fe/v6.5-rc5/media_test
>>
>> With this I am able to load the IPU6 modules, but I have problems with
>> the sensor.
>>
>> The sensor module is loaded - named ov01a10 but the probe function is
>> not run - as far as I can see
>>
>> Also in /sys/kernel/debug/v4l2-async/pending_async_subdevices I have it
>> as pending
>>
>> ipu6:
>>  [fwnode] dev=nil, node=\_SB.PC00.LNK1
>>
>> Looking at the /sys/bus/acpi/devices I can see the sensor device with a
>> status of 15 (cat OVTI01A0\:00/status)
>>
>> Will continue investigating, but I would like any input in getting the
>> driver up an running and testing on this Dell laptop. I think it should
>> be very close to working.
> 
> Do you any failure log for ov01a10?
> 
> For Dell XPS 9320, the camera sensor module has a dependency on Intel
> IVSC driver, so please make sure you have the latest ivsc driver.
> I remember they are already in media tree.
> 
> I will check again with latest IVSC driver, feel free to mail me or
> Wentong Wu meanwhile if you have any problems for camera sensor and
> IVSC.

I see that the ivsc driver has not been in master branch. Before that,
could you try several hack to check whether camera can work on master?

https://github.com/bingbucao/linux/commits/ipu_dev

7ebff51284d9 media: ov01a10: hack ivsc to make camera can work
01cc9f3d1b61 i2c: ljca: Call acpi_dev_clear_dependencies()
92e5d122e105 vsc: Defer firmware loading to avoid long probing time
5f5d5f0df06b driver: ivsc: add intel ivsc driver
0f4819dec533 Revert "gpio: Add support for Intel LJCA USB GPIO driver"

> 
>>
>> Regards
>> Claus Stovgaaard
>>
> 

-- 
Best regards,
Bingbu Cao
