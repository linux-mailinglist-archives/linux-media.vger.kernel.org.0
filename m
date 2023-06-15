Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236A2731A99
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 15:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344773AbjFON5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 09:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245328AbjFON5U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 09:57:20 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F1C1FD5
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 06:56:58 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362308593"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="362308593"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 06:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="886654108"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="886654108"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 15 Jun 2023 06:23:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1q9mwX-003wpF-0b;
        Thu, 15 Jun 2023 16:23:17 +0300
Date:   Thu, 15 Jun 2023 16:23:16 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIsQxIhG1ovB9jsz@smile.fi.intel.com>
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <4c9b2cec-e026-e527-2253-fc541ec85d05@redhat.com>
 <ZIrf7Ku9LHRCIU5K@kekkonen.localdomain>
 <647c6bf0-2ad3-16bd-8081-7f4244f60938@redhat.com>
 <ZIr41hzdphg1UbJy@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIr41hzdphg1UbJy@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 15, 2023 at 11:41:10AM +0000, Sakari Ailus wrote:
> On Thu, Jun 15, 2023 at 12:15:47PM +0200, Hans de Goede wrote:
> > On 6/15/23 11:54, Sakari Ailus wrote:
> > > On Thu, Jun 15, 2023 at 10:45:35AM +0200, Hans de Goede wrote:
> > >> On 6/14/23 22:39, Sakari Ailus wrote:

...

> > If you agree that because of the symbol dependency that
> > the select REGMAP_I2C is necessary then the depends on I2C
> > is also necessary because any Kconfig symbol selecting
> > another symbol MUST depends on all of the dependencies
> > of the selected symbol and REGMAP_I2C has:
> > 
> > config REGMAP_I2C
> >         tristate
> >         depends on I2C
> 
> Yes.
> 
> How about putting cci_regmap_init_i2c() behind an #ifdef? Then there
> wouldn't be a need for REGMAP_I2C unconditionally, but dependent on I2C.
> 
> I guess right now I2C is more or less given in many systems but binding CCI
> to it still seems dubious.

Can't we solve the issue when it comes?
What you are suggesting seems controversial to me at this stage.

-- 
With Best Regards,
Andy Shevchenko


