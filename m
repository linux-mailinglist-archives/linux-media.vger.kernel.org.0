Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC0DF7CF289
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 10:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344990AbjJSI1m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 04:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235325AbjJSI1h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 04:27:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585A118D
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 01:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697704055; x=1729240055;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=S+3V9FfpjsEDLzJoQ88b+WQWa7vf1AZGd5orxHmt9v4=;
  b=RR3a3fCvZNyJeNqFCsn3j2pQW1sMVw18sXxDHogQjXghlbeeA5gASibY
   k39pIJKXH0pTxIK37UKepq7JcYjNr9qgRHV80/NQOU1YEZDj1u4mQNWd1
   R4FqDt6wicYIuLF0Q7hvqxtx3fy+f4Dz6YhSiVPkNtx1UZbC41pG/82ra
   1+SIyG4ZQimsBMJInuwwn2cx6i0yOXflPmWtkFRsc2ICB0NQuy20frOQb
   2zrO7lAtJoPDpztbTuukS2fCU4F/X6lrwYc3v5sS13d5g1hzKH/jnsHC8
   L+coq/C7Qc1+tV0lEFHYISvVD+QzgOmWIGmnAJbguMpSUDEgsNndaQdge
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452669782"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="452669782"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 01:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930524934"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="930524934"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 01:27:31 -0700
Subject: Re: [PATCH 02/15] media: intel/ipu6: add IPU auxiliary devices
To:     Andreas Helbech Kleist <andreaskleist@gmail.com>,
        bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-3-bingbu.cao@intel.com>
 <ccec8bb8310e65a7f0ab586d3eb204baa417989f.camel@gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <8e5b803c-425b-9beb-bdef-233d64deaf3d@linux.intel.com>
Date:   Thu, 19 Oct 2023 16:24:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ccec8bb8310e65a7f0ab586d3eb204baa417989f.camel@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
>> +struct ipu6_subsystem_trace_config;
> 
> Unused
> 
>> +       struct ipu6_subsystem_trace_config *trace_cfg;
> 
> Unused
> 
>> +#define to_ipu6_bus_driver(_drv) container_of(_drv, struct
>> ipu6_bus_driver, drv)
> 
> Unused
>

Ack and applied. Thanks!

> 
> Best regards,
> Andreas
> 

-- 
Best regards,
Bingbu Cao
