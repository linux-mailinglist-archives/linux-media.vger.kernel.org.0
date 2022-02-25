Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81FAD4C4B98
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 18:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243317AbiBYRDY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 12:03:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243495AbiBYRC7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 12:02:59 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80685F94
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 09:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645808547; x=1677344547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E9RZM59pWT7TCwzNh7Xc1Fggeij3BLui5Mz3jw4kEeg=;
  b=laJZs2E5R/NgDbwLsEqLkrs2UA2hNPmW8VDR1ygz0bNTks7wUkcTHINs
   Jofd5xLcRhuges6VWIDA/DZioasLkUiMyH8jBnyg4v164qG5bwobDSJFk
   pO9HHuO7jWVT3NquZIAaYCVejnlxEbX1Y3TOxT5gzojUnrjLJI75wv0DD
   /P0mZN8XvGpNouv91jdiLZOvugDLd05IbmewjC4jkZOXSD09oAwmSgktF
   31iSGZ9uLKZZ4AxD/J299qvP8c8Hy2qO++ZvAOwZeIILMK7z5FujzZHEl
   ytKqrgdrBbUTfpOdYZX0z6+KAIAF/2ekL9pVQhQKhyeWfBuW2hVjv37dI
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233158117"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="233158117"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 09:02:11 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="607815068"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 09:02:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nNdy4-008GwF-1f;
        Fri, 25 Feb 2022 19:01:20 +0200
Date:   Fri, 25 Feb 2022 19:01:19 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2 04/11] media: i2c: Provide ov7251_check_hwcfg()
Message-ID: <YhkLX/OgI+PSIkBg@smile.fi.intel.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
 <20220225000753.511996-5-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225000753.511996-5-djrscally@gmail.com>
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

On Fri, Feb 25, 2022 at 12:07:46AM +0000, Daniel Scally wrote:
> Move the endpoint checking from .probe() to a dedicated function,
> and additionally check that the firmware provided link frequencies
> are a match for those supported by the driver. Store the index to the
> matching link frequency so it can be easily identified later.

...

> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> +	fwnode_handle_put(endpoint);
> +	if (ret)
> +		return dev_err_probe(ov7251->dev, ret,
> +				     "parsing endpoint node failed\n");
> +
> +	if (!bus_cfg.nr_of_link_frequencies) {

> +		dev_err(ov7251->dev, "no link frequencies defined\n");
> +		ret = -EINVAL;

It's also fine to use dev_err_probe() here.

> +		goto out_free_bus_cfg;
> +	}
> +
> +	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> +		for (j = 0; j < ARRAY_SIZE(link_freq); j++)
> +			if (bus_cfg.link_frequencies[i] == link_freq[j]) {
> +				freq_found = true;
> +				break;
> +			}
> +
> +		if (freq_found)
> +			break;

freq_found may be replaced by the

		if (j < ARRAY_SIZE(link_freq))

here.

> +	}
> +
> +	if (i == bus_cfg.nr_of_link_frequencies) {
> +		dev_err(ov7251->dev, "no supported link freq found\n");
> +		ret = -EINVAL;

dev_err_probe()

> +		goto out_free_bus_cfg;
> +	}
> +
> +	ov7251->link_freq_idx = i;
> +
> +out_free_bus_cfg:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko


