Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0DA70F441
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 12:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbjEXKbr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 06:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbjEXKbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 06:31:34 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7A5C0
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 03:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684924292; x=1716460292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=138EQs7/riAoxGp9LynTALYFu0j0OVRV829jbliaBX8=;
  b=O/Wf+Lpt7JDvThNhC7SBEWv2QtRzuFmmr8Jj/dN1PPFPff0O4JOFxrV2
   2BYzj7pq2jLFsiORxT1SbIhrdw3Jgk2wo91AQizPi3aJs3QPVlu7YuB7U
   olXLeyld0bxL2LOzTtSU+8yUt+y+aXiZkE236TeXyiHVrg2uLaF/bhhLu
   Kna0NE+4LKlOSC1pTN3+/+mtTJlYZdxhmuW3P0yWOrr5cYtIgIzPm2Ufm
   /kM+/9m6XATgDBmacvHogrDhFOl6PIqC4edBF8Di2kBNSEx0dFP8PKCo5
   oELwJ3Khwe0HPrRVDHZvn5PQMFBdNUSziwl75vWaLHsii9+vKpQ6zNPlL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="416984560"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="416984560"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 03:31:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="769400666"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="769400666"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 24 May 2023 03:31:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1q1lmB-000GCX-0K;
        Wed, 24 May 2023 13:31:27 +0300
Date:   Wed, 24 May 2023 13:31:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     bingbu.cao@intel.com
Cc:     djrscally@gmail.com, dan.scally@ideasonboard.com,
        hao.yao@intel.com, markgross@kernel.org,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        hdegoede@redhat.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH 2/3] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
Message-ID: <ZG3nfnJNc2OuxR+h@smile.fi.intel.com>
References: <20230524035135.90315-1-bingbu.cao@intel.com>
 <20230524035135.90315-2-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524035135.90315-2-bingbu.cao@intel.com>
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

On Wed, May 24, 2023 at 11:51:34AM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> On some platforms, the imaging clock should be controlled by evaluating
> specific clock device's _DSM method instead of setting gpio, so this
> change register clock if no gpio based clock and then use the _DSM method
> to enable and disable clock.

...

Add a comment here where you put the GUID in a human-readable format for easy
googling / searching for in the internet / documentation.

> +static const guid_t img_clk_guid =
> +	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
> +		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);

...

With

	struct acpi_device *adev = ...;

> +	init.name = kasprintf(GFP_KERNEL, "%s-clk",
> +			      acpi_dev_name(int3472->adev));


This become a single line.

> +	if (!init.name)
> +		return -ENOMEM;
> +
> +	int3472->clock.frequency = skl_int3472_get_clk_frequency(int3472);
> +	int3472->clock.clk_hw.init = &init;
> +	int3472->clock.clk = clk_register(&int3472->adev->dev,

And the above can be reused later in this function, like

	int3472->clock.clk = clk_register(&adev->dev, &int3472->clock.clk_hw);

> +					  &int3472->clock.clk_hw);
> +	if (IS_ERR(int3472->clock.clk)) {
> +		ret = PTR_ERR(int3472->clock.clk);
> +		goto out_free_init_name;
> +	}

-- 
With Best Regards,
Andy Shevchenko


