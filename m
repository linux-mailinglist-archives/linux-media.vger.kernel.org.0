Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93CA7D3355
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 13:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbjJWL3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 07:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234004AbjJWL3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 07:29:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CBC102
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 04:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698060550; x=1729596550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hnCDExVsQw8nBKnJJnypjueFi485C5DGwBJYCS8KPUA=;
  b=A7xMFv85kcZt7opYRXI4RQ7LghbpLdAbBN3ykyxvQF7q+1usKF2gTSSB
   lTRrMsDtwFf0ro2eoEDOl1HOahZ0jY8MYBwSQi2cx4ASyrPxrqRaFO5EA
   TmpOXDrkPhxmID8XOYpkyVAnFWigKQP7vjueu436FtsqHDu5WSYw+aZpQ
   OK2p5+8WpB4nLy9DAUP/RBEtcwAo5Dv2Ae23s9TX/7kJvnA8EG0qB+PnM
   rJO+YMpo8aRqddmZINJp+dHWgAxCT1NCX3qjAOXHVbQ07aN38kHJhNZQc
   SkRxRLHAfN6k6whSJRPHuS5M2YpFKn9SqhSTN+LUtnotw7KUByYz0pkgq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="386633649"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="386633649"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 04:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="761715769"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="761715769"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 04:29:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qut7H-00000007vBs-37fQ;
        Mon, 23 Oct 2023 14:29:03 +0300
Date:   Mon, 23 Oct 2023 14:29:03 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andreas Helbech Kleist <andreaskleist@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com, claus.stovgaard@gmail.com
Subject: Re: [PATCH 10/15] media: intel/ipu6: add input system driver
Message-ID: <ZTZY/5bETVFeD1Ok@smile.fi.intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-11-bingbu.cao@intel.com>
 <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
 <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
 <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com>
 <9d5d0bd8-41d1-4879-fccf-54e56aaa5073@redhat.com>
 <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 23, 2023 at 08:23:23AM +0200, Andreas Helbech Kleist wrote:
> On Fri, 2023-10-20 at 16:39 +0200, Hans de Goede wrote:
> > On 10/20/23 12:47, Andreas Helbech Kleist wrote:

...

> > But it does have an effect, modprobe will load both the main
> > ipu6 driver registering the aux devices as well as this driver
> > based on the modalias of the PCI device because with this
> > MODULE_DEVICE_TABLE(pci, isys_pci_tbl); statement both drivers
> > match that PCI modalias.
> 
> All right. But since the main driver contains the same table, I don't
> think there's any need to have it here?
> 
> > But the correct thing to do here would be to switch to
> > an auxbus based MODULE_DEVICE_TABLE() for the isys driver.
> 
> The isys_driver already has an auxiliary_device_id table. I'm not sure
> if that's what you mean?
> 
> From the bottom of ipu6-isys.c in PATCH 10/15:
> 
> +static const struct auxiliary_device_id ipu6_isys_id_table[] = {
> +	{
> +		.name = "intel_ipu6.isys",
> +		.driver_data = (kernel_ulong_t)&ipu6_isys_auxdrv_data,
> +	},

Should be {} here...

> +};

...and MODULE_DEVICE_TABLE() here.

-- 
With Best Regards,
Andy Shevchenko


