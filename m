Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 596C37BC609
	for <lists+linux-media@lfdr.de>; Sat,  7 Oct 2023 10:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbjJGIWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Oct 2023 04:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234151AbjJGIWn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Oct 2023 04:22:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EDB7C6;
        Sat,  7 Oct 2023 01:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696666962; x=1728202962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+8aWLmkJylVCOSQ1wVPHKjVmB9sGn5bVfNw0aUfUtJs=;
  b=Xen3/0As9JcsnPyPj7C8W6vDaUStcgvz6stjYagbpOgYhpxUFA3vzxjd
   gdD4A0GPosJiNb0We7AKGqiw3j+tm80+Ic9JGJuhmd5VOwsv244jSbLEF
   nebR4H+eCisc5Vd/wf13CQHUcO/gTLt2D9qfzJcxtcxbWuPwQH9mXUHY+
   UytAj5npRBKo2tTQ/y7KDFXjXHy7CbG8WDqIxfWa53UaEgJYU61X/4gFA
   J0ZfpCtXiQD9t8jwOU2KTM3aWOhP/d667xwtB+7VvHP3e0O6CsSr7djub
   Qoi9VXWt/s6frDy2VIPRXwO3GzXWjYG4UOOMmvC73sVIC3q/tLsT+TjRN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="383787482"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="383787482"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 01:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="729125687"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="729125687"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 01:22:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qp2a3-00000003YHp-3OqR;
        Sat, 07 Oct 2023 11:22:35 +0300
Date:   Sat, 7 Oct 2023 11:22:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hao Yao <hao.yao@intel.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>, djrscally@gmail.com,
        Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] platform/x86: int3472: Add strobe GPIO function
Message-ID: <ZSEVSy122qTWwvdy@smile.fi.intel.com>
References: <20231007021309.9332-1-hao.yao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007021309.9332-1-hao.yao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 07, 2023 at 10:13:09AM +0800, Hao Yao wrote:
> Strobe pin is used for Lattice MIPI aggregator to control the LED
> so it can be handled together with privacy LED.

Thinking about this more, I am not now sure that this is a good approach.
The idea behind the STROBE LED is that is used for flash light and should
not be like on/off state, but rather the (quite) short pulse.

Combining these two together may even overheat the real strobe LED if used.

That said, is that platform using strobe GPIO for the privacy LED for real?!

-- 
With Best Regards,
Andy Shevchenko


