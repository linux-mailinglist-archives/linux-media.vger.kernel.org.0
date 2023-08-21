Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22AAA7829AC
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 14:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbjHUM63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 08:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbjHUM62 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 08:58:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07BAB1;
        Mon, 21 Aug 2023 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692622706; x=1724158706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yj4Ub3NGKuT5KMp7EJxzTmEnkFxgbp2FVwvGWaU6VwE=;
  b=bHaTB8IN/VKikv1Vh9Bxwji07VmP0n1gwLvmMlxXWCpeZlo2BoW69bRD
   iqeROAbIldTvR6p+n91VBptqUBzTc6Ts5NN6qzJiRBsiyqcFZ85QNdaIS
   AYmxDvbqF+Ez9YPghczur4a9cnWft7OQJkuuahnFc7+mA85EsVkZ6UvD5
   j8CmIzAh1aSe579spDRvguwPn9F/57qfo0rH4js/AUy+8TKjnmzYBgWpr
   LHiQL6Xj+M5YQkj40pA7Pvdv+1blxNg64L2MpJAAdW/jiH8ceqt4QTi78
   PqkseoFDMSIKY9W2d50vKCH//lTUjsWnEXQJYrkfGUlbEG2RSlaHFyJbF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="439954090"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="439954090"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 05:58:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="982451006"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="982451006"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 21 Aug 2023 05:58:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qY4UA-00EpzT-30;
        Mon, 21 Aug 2023 15:58:22 +0300
Date:   Mon, 21 Aug 2023 15:58:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: i2c: video-i2c: Convert enum->pointer for data in
 the match tables
Message-ID: <ZONfbqzMSYDCgS82@smile.fi.intel.com>
References: <20230820075846.51592-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820075846.51592-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 20, 2023 at 08:58:46AM +0100, Biju Das wrote:
> Convert enum->pointer for data in the match tables, so that
> device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
> bus type match support added to it.
> 
> Replace enum->struct *video_i2c_chip for data in the match table. Simplify
> the probe() by replacing device_get_match_data() and ID lookup for
> retrieving data by i2c_get_match_data().

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


