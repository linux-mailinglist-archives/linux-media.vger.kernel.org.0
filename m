Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E834C6B59
	for <lists+linux-media@lfdr.de>; Mon, 28 Feb 2022 12:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234984AbiB1L5S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 06:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbiB1L5S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 06:57:18 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC185B3F9
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 03:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646049399; x=1677585399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MSlfHNSCJsVoxXmEUGYCtfdgHt4vYp/wp+wNqq0WQ8k=;
  b=HgjLpelU9vEddbsXhA/Cmwza1RlJN4H4tVQvMCBqmCyUoypV3gcDFVW7
   Oudh1Hj3mpqZdyDO1CFRXulzOGR6h8EXzcSIxq3ODJfg1aKnbDN/ztsRb
   G7guO1ifUL4ZRpmnkFnSnjWUVk9HeGCTZ8KP4VXnv0HfRAE29dYCVIWWH
   qF8LuUtkWVn8T0ye8hDYMgU3+fnuUndglRRI/JAC87Hr93dv8/fAEK3x3
   fRQkqUijHWh8iGEniUUcFFWIQ7vYqtlP6nQycQfYT3JyOxBnjsXUrOFGM
   lL3/VSKpVr6wpnh+MbmVW0pASwT/GHUET0zK5KGX/0K2C7YR8AvL/Pumq
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232838050"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="232838050"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 03:56:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="507398486"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 03:56:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nOecl-009I84-Q9;
        Mon, 28 Feb 2022 13:55:31 +0200
Date:   Mon, 28 Feb 2022 13:55:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2 07/11] media: i2c: Add support for new frequencies to
 ov7251
Message-ID: <Yhy4MwU320D3mxeO@smile.fi.intel.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
 <20220225000753.511996-8-djrscally@gmail.com>
 <YhkNR7BhRAG2MjNm@smile.fi.intel.com>
 <03c68a99-c9ff-7cdf-e5d7-2c52657e5d9f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03c68a99-c9ff-7cdf-e5d7-2c52657e5d9f@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 25, 2022 at 10:04:29PM +0000, Daniel Scally wrote:
> On 25/02/2022 17:09, Andy Shevchenko wrote:
> > On Fri, Feb 25, 2022 at 12:07:49AM +0000, Daniel Scally wrote:

...

> > >   	/* get system clock (xclk) */
> > > -	ov7251->xclk = devm_clk_get(dev, "xclk");
> > > +	ov7251->xclk = devm_clk_get(dev, NULL);
> > Why a clock doesn't have a name anymore?
> > Shouldn't you rather switch to _optional()?
> 
> The problem is since we could have a the clock coming from some dt file with
> it named xclk, as this driver is obviously designed for, but it also can be
> created by the int3472-tps68470 or int3472-discrete drivers which don't use
> that name. Without knowing what it's called, best thing I could think to do
> was remove the name and rely on device matching.

So, then the Q is why it's not called the same in the other drivers?

...

> Broken ACPI compensated for by the cio2-bridge - it creates the
> clock-frequency property which ordinarily wouldn't be there on ACPI systems
> AIUI.

In the current practice we have CLK priority over property, this means we may do:
1) unconditional reading of the property;
2) trying CLK.

Can it be done here?

-- 
With Best Regards,
Andy Shevchenko


