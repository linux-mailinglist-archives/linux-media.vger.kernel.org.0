Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42A7C7650CA
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 12:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbjG0KT3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 06:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233414AbjG0KT2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 06:19:28 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8CC1710
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 03:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690453162; x=1721989162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jttbpbHTeeQGBEmjC0921PuaENtuPx1/xttVekpVySk=;
  b=RELjQS5z4JIM85R/649Es1Af0khbKaazGW8y3ihspmH10fKjJGWFUU0Y
   Qr3GNcPAg9L7M5xuSE3/ijLtDFR4IPL6WjlrNUROQahrdX2n3/qEN8IOi
   gRR5DTUYta8nOq1CgzCbHx+V1TI4FtCjFUSQBkDsEajfFdWhFo1jiTgHv
   egN+eKJh/U58IrN2DCVwc9mGgbCnwFhdsHtFPRrxtTWdCpGX7B1gA7o22
   AsuLkGzdDsRlXNjSHs7IiKpW1bxZQZfhoodGeLUkSX0lKyy0ZTUG/ffrQ
   7+wn6wF5Ku0lZrrAWkZDMCVmLXicJP1A7BbfkVozA0guad430S4d8V14a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347882775"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="347882775"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 03:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="762115382"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="762115382"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 27 Jul 2023 03:19:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qOy5T-00Gvwi-3D;
        Thu, 27 Jul 2023 13:19:16 +0300
Date:   Thu, 27 Jul 2023 13:19:15 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com,
        tfiga@chromium.org, senozhatsky@chromium.org, hdegoede@redhat.com,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 13/15] MAINTAINERS: add maintainers for Intel IPU6 input
 system driver
Message-ID: <ZMJEo1MBocFQ11/z@smile.fi.intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-14-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727071558.1148653-14-bingbu.cao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 27, 2023 at 03:15:56PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Update MAINTAINERS file for Intel IPU6 input system driver.

> +INTEL IPU6 INPUT SYSTEM DRIVER

In both cases the word "input" is confusing.
We have INPUT subsystem, how does this relate to it?

-- 
With Best Regards,
Andy Shevchenko


