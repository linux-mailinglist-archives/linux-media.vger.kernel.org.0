Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1197CF8A3
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 14:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345491AbjJSMWg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 08:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345454AbjJSMWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 08:22:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3213AA3
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 05:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697718154; x=1729254154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bDqGl5qLkLsF1yDqEFuj6KMhoNzv/FEem+VOVAiuEQU=;
  b=JQA5TXv9E158QiEJl3YcMgZ+Sj85AZrZ3zp5Bo3IfVPjWWvLTv7wQGrR
   7N4BVZnXeHRqn4RZyaaCbUsZohotVF1qV+81dQP3fJ7sJI8OOgIWjSLiv
   MYkBSw8N4JO5lYL187Bz8Rl9egMHpN0RKYZDnnNZTT19vSeuZmttpL1G9
   VINCkdqd6GshWg7qhZ1L5Zm0Gx1MHZcmiqyGEtIsFtnrHi6MfWpSmNfHY
   2F3D4sOyGasqChqmUYNm6jOuxpMJbMAEWUQqPzCFQUIETJWnEryg05YyM
   neAkX106DNT9A9N80krDa4zWSadrmuEiKi6D325KbPrRMWDowBDLE+hbI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="450455040"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="450455040"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 05:22:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="706831066"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="706831066"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 05:22:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qtS2l-00000006rIY-1dJi;
        Thu, 19 Oct 2023 15:22:27 +0300
Date:   Thu, 19 Oct 2023 15:22:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Andreas Helbech Kleist <andreaskleist@gmail.com>,
        bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, hdegoede@redhat.com,
        tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH 10/15] media: intel/ipu6: add input system driver
Message-ID: <ZTEfg8+sNGf0KU+a@smile.fi.intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-11-bingbu.cao@intel.com>
 <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
 <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 19, 2023 at 04:28:16PM +0800, Bingbu Cao wrote:
> On 10/3/23 6:13 PM, Andreas Helbech Kleist wrote:
> > On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com wrote:

...

> >> +static const struct pci_device_id isys_pci_tbl[] = {
> >> +       { PCI_VDEVICE(INTEL, IPU6_PCI_ID) },
> >> +       { PCI_VDEVICE(INTEL, IPU6SE_PCI_ID) },
> >> +       { PCI_VDEVICE(INTEL, IPU6EP_ADL_P_PCI_ID) },
> >> +       { PCI_VDEVICE(INTEL, IPU6EP_ADL_N_PCI_ID) },
> >> +       { PCI_VDEVICE(INTEL, IPU6EP_RPL_P_PCI_ID) },
> >> +       { PCI_VDEVICE(INTEL, IPU6EP_MTL_PCI_ID) },
> >> +       { }
> >> +};
> > 
> > Unused
> 
> Have you tried that whether isys driver can be auto-loaded w/o
> this pci id table? It cannot on my side.

But where is the respective MODULE_DEVICE_TABLE()?

-- 
With Best Regards,
Andy Shevchenko


