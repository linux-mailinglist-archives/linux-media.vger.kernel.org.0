Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8AB54B217
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 15:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237111AbiFNNNK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 09:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235968AbiFNNNJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 09:13:09 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB3E2A41D
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655212388; x=1686748388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aHef+7/u0+xLgNDgDfOcIfe1/pGQja1IhhoY/gdLLyw=;
  b=FdTGU2ZTQL3qfRLADx+AuU/Hab37eqhfhIXOXgPnfXTRToiRoWEErFQq
   MHt6m4Bg3c6R3T4SrmbkIFoLBHTbET3N70iGhnk8x6tdXNo3ybgR8XV4L
   tBm634/wtICl5gy+rmNDDF1XDOCwrskphTZPJOQTwtlsrzXUyy2CF8jPf
   cmeRy9FXAuzDub7Fntrd3iX/JPA2fCWt3SNCTQ2vQ2i4B9Y5Jv+/6qTHL
   syXgXa6g3fRZIh7qK13t2Z5gKn5xHN7FClNJfu8HB1wdxNARkA+L5VF6l
   GYWWbqW33H3EtM9G4Ob02XwnC2foJaW91/zBPwJ+SL0n3PN1umEARosus
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="258449557"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="258449557"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:13:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="652029357"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:13:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1o16Lu-000cNw-Vj;
        Tue, 14 Jun 2022 16:13:02 +0300
Date:   Tue, 14 Jun 2022 16:13:02 +0300
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
Subject: Re: [PATCH 32/40] media: atomisp: remove hmm_page_object
Message-ID: <YqiJXgSoET8vTIDM@smile.fi.intel.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <20220613195137.8117-33-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613195137.8117-33-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 13, 2022 at 09:51:29PM +0200, Hans de Goede wrote:
> hmm_page_object only stores a struct page pointer, so we can just use
> the hmm_bo.pages page pointer array everywhere.

Right!

-- 
With Best Regards,
Andy Shevchenko


