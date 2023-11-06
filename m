Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 666AB7E1D23
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 10:23:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjKFJXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 04:23:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbjKFJXw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 04:23:52 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1BFAB
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699262630; x=1730798630;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=bcDuLU6IPGt3sfARnVFEz9kO75fluiyBFiVn1LKRfIc=;
  b=m2oRftVO2M5kKVs8YDGku9Zu9Gkn2TrHrX/xhb91RTyHA+rYOZwMN8sf
   tohFYLy9biLKQlVapIgM2luxRhjvts6rdBdI0TOcLnL2oe1PuljxXQjd8
   K3hiL+ZHbQEDpKKuuflWsbqh4aVtdxBb+QYlV15BJKDX9NBeKLmEAgv4w
   mJhCd7RF+63vw5NFwcr8RKOrxbB18ag1kXkojOHb1BbchwrDh5ksOcIyk
   K3RdDLn3Gzj4TD+XXSVLmdRU5W3ScKgjQqWkwTq2Pe6mu6MSWh79IxKhT
   S6wdFHLT+kEmEVKo6eFgrEKDDqeTVDWfzTUu/gmClzfShQI4xnbXBYXqH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="10775333"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="10775333"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 01:23:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762260070"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="762260070"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by orsmga002.jf.intel.com with ESMTP; 06 Nov 2023 01:23:44 -0800
Subject: Re: [PATCH v2 11/15] media: intel/ipu6: input system video capture
 nodes
To:     Hans de Goede <hans@hansg.org>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-12-bingbu.cao@intel.com>
 <855f69b8-dc33-225a-ebd3-134467d55cf1@hansg.org>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <8df79f15-2054-d558-7b27-7362cdcde26b@linux.intel.com>
Date:   Mon, 6 Nov 2023 17:18:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <855f69b8-dc33-225a-ebd3-134467d55cf1@hansg.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans,

On 11/6/23 12:59 AM, Hans de Goede wrote:
> Hi Bingbu,
> 
> On 10/24/23 13:29, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Register v4l2 video device and setup the vb2 queue to
>> support basic video capture. Video streaming callback
>> will trigger the input system driver to construct a
>> input system stream configuration for firmware based on
>> data type and stream ID and then queue buffers to firmware
>> to do capture.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> 
> While testing this new version I found a small issue in the enum_fmt implementation caused by the mbus_code filtering support I suggested.
> 
> Attached is a single-line patch which fixes this, can you please fold this into the next version ?

Yes, sure.

> 
> Regards,
> 
> Hans
> 

-- 
Best regards,
Bingbu Cao
