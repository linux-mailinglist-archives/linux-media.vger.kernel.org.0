Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8684ABED7
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 14:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343697AbiBGMqg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 07:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445235AbiBGMlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 07:41:46 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 04:33:16 PST
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3873E031013
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 04:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644237196; x=1675773196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vhBTmSn8UkwEjJUl4ynGb5kIz8nOXSvEwd6JGQ6YNy8=;
  b=Fqqw2uJCw845MkNJjpNiX3L97JVrpmHB5bo4rB7smUNqLd7JgRnI5+La
   7bnxHYR5l0g/GbRWEtOiK3kiHr2QN5fdfRopPkn0AMdTt0l7BXJ1FDqgZ
   4zyRYq17+BKXPbmbTFhQTxKpok2zjdHT1Fdur8ehclsToTzFQy7Xp3/NA
   t2Uz/4TJfXvnB0Ozy8v4e0n0FVi2CYRnPNs1we2Ci1y37pFfnD2b25Sh3
   NthxJ1bdoG0uTdQOnrJSC7iCe8HEPVOfTMNPx4lMI2bb8+mkJJjQTiw4b
   CtGzVqyPgcANV/zNMYuFjzUuKfv8+Hfkegr3eLA18kTJIpF+wOnN3nJZw
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="228674150"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="228674150"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 04:32:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="621535538"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 04:32:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nH3Al-001tq2-Md;
        Mon, 07 Feb 2022 14:31:11 +0200
Date:   Mon, 7 Feb 2022 14:31:11 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
Cc:     gregkh@linuxfoundation.org, joe@perches.com, kitakar@gmail.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        tomi.valkeinen@ideasonboard.com, dan.carpenter@oracle.com
Subject: Re: [PATCH] staging: media: atomisp: Use GENMASK instead of manual
 masking
Message-ID: <YgERD7JdlqdaNHuA@smile.fi.intel.com>
References: <20220206185830.39360-1-mosescb.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220206185830.39360-1-mosescb.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Feb 06, 2022 at 07:58:30PM +0100, Moses Christopher Bollavarapu wrote:
> There is a GENMASK macro available in linux/bits.h, for masking.
> 
> Example: GENMASK(3, 0) = 0b00001111 (same as (1 << 4) - 1)

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index 1173be0e72b0..a345fa1d7de9 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -40,6 +40,7 @@
>  
>  #include <linux/io.h>
>  #include <linux/pm_runtime.h>

> +#include <linux/bits.h>

Probably this can be still ordered.

>  /* Assume max number of ACC stages */
>  #define MAX_ACC_STAGES	20
> @@ -1913,11 +1914,11 @@ void atomisp_css_input_set_mode(struct atomisp_sub_device *asd,
>  			    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_config;
>  		s_config->mode = IA_CSS_INPUT_MODE_TPG;
>  		s_config->source.tpg.mode = IA_CSS_TPG_MODE_CHECKERBOARD;
> -		s_config->source.tpg.x_mask = (1 << 4) - 1;
> +		s_config->source.tpg.x_mask = GENMASK(3, 0);
>  		s_config->source.tpg.x_delta = -2;
> -		s_config->source.tpg.y_mask = (1 << 4) - 1;
> +		s_config->source.tpg.y_mask = GENMASK(3, 0);
>  		s_config->source.tpg.y_delta = 3;
> -		s_config->source.tpg.xy_mask = (1 << 8) - 1;
> +		s_config->source.tpg.xy_mask = GENMASK(7, 0);
>  		return;
>  	}
>  
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


