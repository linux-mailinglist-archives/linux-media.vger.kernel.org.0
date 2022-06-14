Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C62A54B214
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 15:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235877AbiFNNLs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 09:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbiFNNLs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 09:11:48 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5E3366AD
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 06:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655212306; x=1686748306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kT0znz/QHTEnxlIh5Uoc8fEHVI/MelJjVGRANjeXLO8=;
  b=T09xWKseOL3E8hWQ4YERSCyRD0kpRa7xcG+Q/zw0qMXqggACV1KMGsFF
   Z9/lgIGKXheBRd0ivZTiIem8mzB/ZFPKfvJGoRYXoul3G5+GgXPnIKQT0
   ZHMOlEnt410r/Xw1oL98RLN5BKV36wObXjgc90fwuxlNjhVR3UI7I9Ad4
   tIgM8VghGiyA5rp8MYaRVVAdcl+ZZ+yJNxYlFU0ZvOHrj1N/irR1/MT9T
   gUKgY3KRwFq86yM5CKsZktrHDyOYGNEK/kpfNcGqHyQJq+4mEMe1erCD/
   yBhj3cDZ+Zn6G0Vzuu2x6cP+xtZ/60TcQEsH+6KnpQorbCNditH5ROUS+
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279649865"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="279649865"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:11:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="612226496"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:11:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1o16KZ-000cNh-TE;
        Tue, 14 Jun 2022 16:11:39 +0300
Date:   Tue, 14 Jun 2022 16:11:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 30/40] media: atomisp: drop highmem var/arg from the hmm
 code
Message-ID: <YqiJC5Suv7sQ/Iu+@smile.fi.intel.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <20220613195137.8117-31-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613195137.8117-31-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 13, 2022 at 09:51:27PM +0200, Hans de Goede wrote:
> highmem is always false, drop it.

...

>  /*
> - * allocate/free physical pages for the bo. will try to alloc mem
> - * from highmem if from_highmem is set, and type indicate that the
> + * allocate/free physical pages for the bo. type indicate that the

Since you are touching this anyway, can be capitalized

Allocate/Free ...

>   * pages will be allocated by using video driver (for share buffer)
>   * or by ISP driver itself.
>   */

-- 
With Best Regards,
Andy Shevchenko


