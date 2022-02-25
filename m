Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD2A34C4B99
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 18:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243314AbiBYRFE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 12:05:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241440AbiBYRFD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 12:05:03 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9011FEFAC
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645808671; x=1677344671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=naiOkaXtaEIuy/IeGheaDMkTi30AK3/b1PHcIH4ebn8=;
  b=FShUxY2K/Kx4YSmEhQPPTY1FA1jG3+VQnRQ7k/P13Tae3jW9tZ9riEGL
   8O2pACtlvMjoukwS5qzR22fh6kBeZApjguBIlwidEvdjyJnCWCBcdxTp4
   XFvJJM9mCpNI8i9SappvekFhPTTLQY2Scc/GdV/XBfSlk5/XA5LKDO8Wh
   pNlYL9enkokxNKMVR5daPaPPNYv878lp5Xqs6EJi4D7So25PvSr92U7O/
   D1VuOCldWcj9AOtY4lFjR2HyNHk6bCLJvZISVUTb9/Q+VvwMO18pSOLVN
   1l4w+onoPUgwLygAr5fPGyVLR2JdALO16SZIq8KSNkjm6Gas/FhOMsrrg
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="239938026"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="239938026"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 09:04:31 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="509326225"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 09:04:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nNe0I-008GyQ-NH;
        Fri, 25 Feb 2022 19:03:38 +0200
Date:   Fri, 25 Feb 2022 19:03:34 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2 06/11] media: i2c: Add ov7251_pll_configure()
Message-ID: <YhkL5jQ8nzr3FATI@smile.fi.intel.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
 <20220225000753.511996-7-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225000753.511996-7-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 25, 2022 at 12:07:48AM +0000, Daniel Scally wrote:
> Rather than having the pll settings hidden inside mode blobs, define
> them in structs and use a dedicated function to set them. This makes
> it simpler to extend the driver to support other frequencies for both
> the external clock and desired link frequency.

...

> +static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_240_mhz = {
> +	.pre_div = 0x03,
> +	.mult = 0x64,
> +	.div = 0x01,
> +	.pix_div = 0x0a,
> +	.mipi_div = 0x05

+ Comma.

> +};
> +
> +static const struct ov7251_pll2_cfg ov7251_pll2_cfg_24_mhz = {
> +	.pre_div = 0x04,
> +	.mult = 0x28,
> +	.div = 0x00,
> +	.sys_div = 0x05,
> +	.adc_div = 0x04

Ditto.

> +};
> +
> +static const struct ov7251_pll_cfgs ov7251_pll_cfgs_24_mhz = {
> +	.pll2 = &ov7251_pll2_cfg_24_mhz,
> +	.pll1 = {
> +		[OV7251_LINK_FREQ_240_MHZ] = &ov7251_pll1_cfg_24_mhz_240_mhz,
> +	}

Ditto.

> +};
> +
> +static const struct ov7251_pll_cfgs *ov7251_pll_cfgs[] = {
> +	[OV7251_24_MHZ] = &ov7251_pll_cfgs_24_mhz

Ditto.

> +};

-- 
With Best Regards,
Andy Shevchenko


