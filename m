Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59F4772E8F1
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 19:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234823AbjFMRBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 13:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234850AbjFMRBV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 13:01:21 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B88719BF
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686675679; x=1718211679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OVFig+pV3wnFs9/RG4WDfcKcLh939x1w3jeEqqnK9UQ=;
  b=VIJ35d1VuWjmimpU9i9a9kcxYCXrSWnp/WWwVXgL+m46uWMMZWbpzpqG
   Ieq51NxY+oW9L/04I/1zyIfaqNrudQsc24sPFbyc2/ctiD0BFd9ykLdUi
   NNoQH9ePIsh5QWsDOAmePXlO18FL/DUq/cyLNF8sVOwAzuiX4KBGEQU1V
   NoF6xkQ3xdWCuuloUd0dWPH4Q9+wvNoYMHLgUyzyj4lqeDPyTc5w+z1JK
   BCu/JKJcNprC8HCxC6XPgBz/zOIGGD3hpXdXgbHQ4/AMoqqdOFhFwI1Tn
   SUV08nC13kwTJXTV6D/D+dfWoEaipG7QAhNFhqr9X9ZILq/rjBrmc4aTe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="357276610"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="357276610"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="835953757"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="835953757"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 13 Jun 2023 10:01:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1q97OM-003VLO-1i;
        Tue, 13 Jun 2023 20:01:14 +0300
Date:   Tue, 13 Jun 2023 20:01:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/1] media: staging: atomisp: select V4L2_FWNODE
Message-ID: <ZIig2sPWRnLvI+iH@smile.fi.intel.com>
References: <20230613165109.111837-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613165109.111837-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 13, 2023 at 07:51:09PM +0300, Sakari Ailus wrote:
> Select V4L2_FWNODE as the driver depends on it.

Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>

I believe this should be @linux.intel.com, but it doesn't matter.

> Fixes: aa31f6514047 ("media: atomisp: allow building the driver again")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/staging/media/atomisp/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
> index c9bff98e5309a..e9b168ba97bf1 100644
> --- a/drivers/staging/media/atomisp/Kconfig
> +++ b/drivers/staging/media/atomisp/Kconfig
> @@ -13,6 +13,7 @@ config VIDEO_ATOMISP
>  	tristate "Intel Atom Image Signal Processor Driver"
>  	depends on VIDEO_DEV && INTEL_ATOMISP
>  	depends on PMIC_OPREGION
> +	select V4L2_FWNODE
>  	select IOSF_MBI
>  	select VIDEOBUF2_VMALLOC
>  	select VIDEO_V4L2_SUBDEV_API
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


