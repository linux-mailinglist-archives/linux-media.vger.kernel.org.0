Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2154C4B8B
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 17:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239059AbiBYQ6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 11:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243419AbiBYQ6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 11:58:47 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1B7A9A53
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 08:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645808293; x=1677344293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gdiWl6MkAdyodMnOlNh9kwZH4NflQT4voKWLJryyR/k=;
  b=SPpAr8q+ukjfmtNvyOzW5sPsMyw1a68i5Iv5vO/Pn9sd8xsp3kjUbjVC
   vo5eD4wRWPZ9S4WHCTqycbB64H0Q6XYkoh6GxfXNLgZeXL0mzRkB+CGtS
   KB9N2IY+MQs+2Cwsm9tbtpYxjzyAxZTZRHncywVTxxV7XSVcDLW0ETXnv
   hLAKX9p2DrBGW3ZPc6ixnx3qhcjRQYbtsS8556/CcQPLgY8d3XqCyJX1l
   7c66RptjJCzHU0DOKN3whtIOTUUZp0uGe2VzgJ0tZcSlOj7uiyehVeazR
   uNBL5lHSOKOabXdc3h4uO7jyVy9A3QM0cvweVY7XbJBJg7dkg99BaW+fn
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="236040284"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="236040284"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 08:58:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="544107814"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 08:58:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nNduD-008Gs0-ON;
        Fri, 25 Feb 2022 18:57:21 +0200
Date:   Fri, 25 Feb 2022 18:57:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2 02/11] media: ipu3-cio2: Add support for
 V4L2_PIX_FMT_IPU3_Y10
Message-ID: <YhkKcRL57Qg/VWGO@smile.fi.intel.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
 <20220225000753.511996-3-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225000753.511996-3-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 25, 2022 at 12:07:44AM +0000, Daniel Scally wrote:
> We have platforms where a camera sensor transmits Y10 data to
> the CIO2 device - add support for that (packed) format to the
> ipu3-cio2 driver.

...

> -	},

Why?

> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
> +		.fourcc		= V4L2_PIX_FMT_IPU3_Y10,
> +		.mipicode	= 0x2b,
> +		.bpp		= 10,
> +	}

-- 
With Best Regards,
Andy Shevchenko


