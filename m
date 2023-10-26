Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 994DA7D7B28
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 05:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjJZDIt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 23:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjJZDIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 23:08:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E23DB18B
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 20:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698289725; x=1729825725;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=fFuZddHKu6p407ShzCxDMV3cUeA/HSD9Q0FErtJ1Rm0=;
  b=UA/lUTb6/1Gq5QiNl+263o2w9xCUWhzoqKgN8Xy0nygjxi8UtwHVyUrz
   6VGj99hoPUftLnUWrpDMyOkxHXPe8ngh0wj0uq+FaGQ6z41MBscgYWzTW
   Ced0BUXA4ZrZ/4d4ShYBs/kMgLV9LghCp6xDdo+a+UK/1VDx/T91vsqsL
   Ppj83d3hGjnaxNC/GeH6Ntr+tpmQ9Tts8FJhx+nxhVrbVIOQ70Ucd0we3
   AFYVs/RG+q0AOqvsYIgm2I2U6xyoAr6kGZs+ATZaKcoyKMjgYGrAISa2s
   A+fGylXmOQ4imYz5utnFLw9VGeYtaH6s+tNnUtkO7UjHMswWyHKUMT1xf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="366797475"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="366797475"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 20:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="794043076"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="794043076"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by orsmga001.jf.intel.com with ESMTP; 25 Oct 2023 20:08:38 -0700
Subject: Re: [PATCH v2 02/15] media: intel/ipu6: add IPU auxiliary devices
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        hdegoede@redhat.com
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-3-bingbu.cao@intel.com>
 <ZTe/WBM/kPB+GWKk@smile.fi.intel.com>
 <3da91870-641a-e0fb-1135-b592d5ca3373@linux.intel.com>
 <ZTlzMA2Cp10UrUS5@smile.fi.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <2b0d75b4-e92d-56e1-d4fc-800a745bdb4f@linux.intel.com>
Date:   Thu, 26 Oct 2023 11:04:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ZTlzMA2Cp10UrUS5@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Andy and Hans,

Thanks.

On 10/26/23 3:57 AM, Andy Shevchenko wrote:
> On Wed, Oct 25, 2023 at 03:14:00PM +0800, Bingbu Cao wrote:
>> On 10/24/23 8:58 PM, Andy Shevchenko wrote:
>>> On Tue, Oct 24, 2023 at 07:29:11PM +0800, bingbu.cao@intel.com wrote:
> 
>> auxiliary_bus.h is included in ipu6-bus.h,
> 
> So, you have to include it explicitly as IWYU, strictly speaking ipu6-bus.h
> does NOT guarantee that inclusion, even if you fully control it.
> 
>> list.h, mutex.h dev_printk.h are
>> included in device.h,
> 
> I ack for dev_printk.h, but for the rest see above.
> 
>> dma-mapping.h and scatterlist.h are included in pci.h.
> 
> See above.
> 
> 
>> I am a little confused about the rule, do you mean we need include the
>> generic headers we need even it is included in others header?
> 
> Yes. There are only few guarantees in the kernel, strictly speaking. And having
> spaghetti headers in your code is a bad idea from long run maintenance
> perspective.
> 
> ...
> 
>>>> +#ifndef IPU6_BUS_H
>>>> +#define IPU6_BUS_H
>>>> +
>>>> +#include <linux/auxiliary_bus.h>
>>>
>>> ...Especially for headers which will affect the compilation time.
>>>
>>>> +#include <linux/pci.h>
>>>
>>> This is not used.
>>
>> Do you mean it just need a 'struct pci_dev;' ?
> 
> Yes.
>

Ack. Will address them in v3.
 

-- 
Best regards,
Bingbu Cao
