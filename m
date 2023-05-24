Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 165BA70F424
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 12:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjEXK1X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 06:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232707AbjEXK0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 06:26:54 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1418C1AC
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 03:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684924013; x=1716460013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8F/qEAPb6gSEPr1VGIAZBmDWj3IfY283dT1n3UuF1b4=;
  b=k/WTekdybQHgK/lUNqGRHfPhcgzSAmYPP1fXL5BudsZr8Klt+jEWwNSL
   UJ13zLH5ATWwxjpTR1GE47z10/BZn6IOahkgw7XsrYiaRNit112PJW/JX
   +GQaH9FNqsMkwIGy91mEFb4Vc6cS/vGnQ6bNRKU/V5esWCpw0FNxSDZ6R
   qnZSmgzi8sqeqp1LWc0MxhwlpQZ9FHcIk9udmrSn/c02/5juBz7YPRwYj
   YDbq9oUeaXyCKXb/2wjmPZqFC3s4hyNIRMWtqdemIWmW+Rop6jvv9n1JT
   jDWUx9dIKc2YPNzWWUuy+nbj9gFykiH+FqWtQ0IvZB0osOr/Trt3eFpW9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="351035230"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="351035230"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 03:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="735154450"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="735154450"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 24 May 2023 03:26:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1q1lhg-000GCH-1X;
        Wed, 24 May 2023 13:26:48 +0300
Date:   Wed, 24 May 2023 13:26:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     bingbu.cao@intel.com
Cc:     djrscally@gmail.com, dan.scally@ideasonboard.com,
        hao.yao@intel.com, markgross@kernel.org,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        hdegoede@redhat.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH 1/3] platform/x86: int3472: Avoid crash in unregistering
 regulator gpio
Message-ID: <ZG3maJQ9aIiV9ciL@smile.fi.intel.com>
References: <20230524035135.90315-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524035135.90315-1-bingbu.cao@intel.com>
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

On Wed, May 24, 2023 at 11:51:33AM +0800, bingbu.cao@intel.com wrote:
> From: Hao Yao <hao.yao@intel.com>
> 
> When int3472 is loaded before GPIO driver, acpi_get_and_request_gpiod()
> failed but the returned gpio descriptor is not NULL, it will cause panic
> in later gpiod_put(), so set the gpio_desc to NULL in register error
> handling to avoid such crash.

It should return deferred probe and if somebody is asking for troubles with
it...

Probably you need to assign only available GPIOs by introducing a local variable

	struct gpio_desc *gdesc;

	gdesc = ...
	if (IS_ERR(gdesc))
		...

	...->... = gdesc;

-- 
With Best Regards,
Andy Shevchenko


