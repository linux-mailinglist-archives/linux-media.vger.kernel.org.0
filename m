Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B11217D7504
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 22:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjJYUAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 16:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjJYUAJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 16:00:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6CCC93
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698264007; x=1729800007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DGXUWUSHMgJ97h7udElY6Kgr44+FnSqfERyPf7jHRCI=;
  b=mJwmV8f+IdxybKXiGtXREGbTDOVASZCQ7X1xufO7yIvbVBjxgxdDt2Bu
   KXC6FfGSPpGsW7WeKspQl3ejmZfVchQ+LtcWYkKRo8ZBRI31RZIYG0Cz1
   376dOBw56VsrDFjzdQvMJWgsqe1IY4CHRN76E+k/FM5YXhpkKKwg3IKha
   h8TEq57d5Ol7w0H52UcS5bZv6y9A/u/duFlg40KrGvuyJX1U6gdszwm6f
   niQ3+eEwUUKhWX95PSsEvp9d3UoYVvP0CJlUWb7FMzWw0UrwH+LyUT5Tl
   SmLoW41p9uJ1Onn6d+eG3L1jCJ7BChn9e7Pgm96WB67TvIINGtLQ51089
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="390247879"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="390247879"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 13:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932478031"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="932478031"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 13:00:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qvk2q-00000008fo4-2DjU;
        Wed, 25 Oct 2023 23:00:00 +0300
Date:   Wed, 25 Oct 2023 23:00:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
        andreaskleist@gmail.com, claus.stovgaard@gmail.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH v2 12/15] media: add Kconfig and Makefile for IPU6
Message-ID: <ZTlzwIDZtGWOSGs4@smile.fi.intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-13-bingbu.cao@intel.com>
 <ZTfAxXJcGN8tS0kD@smile.fi.intel.com>
 <840ba517-4739-16ed-9d00-f79a3e6016fb@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <840ba517-4739-16ed-9d00-f79a3e6016fb@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 25, 2023 at 04:43:16PM +0800, Bingbu Cao wrote:
> On 10/24/23 9:04 PM, Andy Shevchenko wrote:
> > On Tue, Oct 24, 2023 at 07:29:21PM +0800, bingbu.cao@intel.com wrote:

...
> > 
> >> +	depends on X86 && X86_64
> > 
> > How is that? One is a superset of the other IIUC.
> 
> It's trying to prevent build IPU6 with other arch such as 'UM'.
> 
> # make W=1 O=build_dir ARCH=um olddefconfig
> ipu6-dma.c:... error: implicit declaration of function 'clflush_cache_range';

Is UM ever supported 64-bit builds?

> X86_64 looks like not an actual architecture.

How comes?

-- 
With Best Regards,
Andy Shevchenko


