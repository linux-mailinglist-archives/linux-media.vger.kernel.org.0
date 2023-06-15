Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0AF6731586
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 12:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343697AbjFOKgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 06:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343756AbjFOKga (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 06:36:30 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73EF2D40
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 03:36:02 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="356364161"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="356364161"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 03:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="782473103"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="782473103"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2023 03:35:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1q9kKb-003v2B-2Z;
        Thu, 15 Jun 2023 13:35:57 +0300
Date:   Thu, 15 Jun 2023 13:35:57 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIrpjS/gIlqZKgcF@smile.fi.intel.com>
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <4c9b2cec-e026-e527-2253-fc541ec85d05@redhat.com>
 <ZIrf7Ku9LHRCIU5K@kekkonen.localdomain>
 <647c6bf0-2ad3-16bd-8081-7f4244f60938@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <647c6bf0-2ad3-16bd-8081-7f4244f60938@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 15, 2023 at 12:15:47PM +0200, Hans de Goede wrote:
> On 6/15/23 11:54, Sakari Ailus wrote:
> > On Thu, Jun 15, 2023 at 10:45:35AM +0200, Hans de Goede wrote:
> >> On 6/14/23 22:39, Sakari Ailus wrote:

...

> > This is documented in
> > Documentation/driver-api/media/maintainer-entry-profile.rst and media tree
> > follows that.
> 
> Ah, I missed that. Ok, I'll run
> 
> ./scripts/checkpatch.pl --strict --max-line-length=80
> 
> and fix the warnings, with maybe one or 2 exceptions
> where longer lines really make the code more readable.

No objection from me.

-- 
With Best Regards,
Andy Shevchenko


