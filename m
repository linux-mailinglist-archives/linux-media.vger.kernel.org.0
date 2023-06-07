Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95DC3726EF2
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 22:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235491AbjFGUyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 16:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235487AbjFGUyE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 16:54:04 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964861FDC
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 13:53:56 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354595184"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="354595184"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 13:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="854046137"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="854046137"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2023 13:53:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1q70AC-00207z-32;
        Wed, 07 Jun 2023 23:53:52 +0300
Date:   Wed, 7 Jun 2023 23:53:52 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 15/28] media: ov2680: Add support for 19.2 MHz clock
Message-ID: <ZIDuYN5Zmh2ZzPBc@smile.fi.intel.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-16-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607164712.63579-16-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 07, 2023 at 06:46:59PM +0200, Hans de Goede wrote:
> Most x86/ACPI boards use the ov2680 with a 19.2 MHz xvclk,
> rather then the expected 24MHz, add support for this.
> 
> Compensate for the lower clk by setting a higher PLL multiplier
> of 69 when using 19.2 MHz vs the default multiplier of 55 for
> a 24MHz xvclk.

...

> @@ -720,12 +736,19 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)

I believe this call is solely the part of the ->probe() flow, hence...

...

> +	if (i == ARRAY_SIZE(ov2680_xvclk_freqs)) {
> +		dev_err(dev, "unsupported xvclk frequency %d Hz\n", sensor->xvclk_freq);
>  		return -EINVAL;

	return dev_err_probe(...);

?

>  	}

-- 
With Best Regards,
Andy Shevchenko


