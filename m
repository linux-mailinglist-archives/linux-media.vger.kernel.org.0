Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36F64726A64
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 22:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjFGUHh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 16:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbjFGUHg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 16:07:36 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342111BD9
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 13:07:32 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="359564097"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="359564097"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 13:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739417535"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="739417535"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 07 Jun 2023 13:07:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1q6zRI-001ze3-1G;
        Wed, 07 Jun 2023 23:07:28 +0300
Date:   Wed, 7 Jun 2023 23:07:28 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
Message-ID: <ZIDjgFtZ7qp6YYz1@smile.fi.intel.com>
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <20230607181855.GM5058@pendragon.ideasonboard.com>
 <b558aac9-0a34-ecca-57b0-d132af8cdefb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b558aac9-0a34-ecca-57b0-d132af8cdefb@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 07, 2023 at 09:01:40PM +0200, Hans de Goede wrote:
> On 6/7/23 20:18, Laurent Pinchart wrote:
> > On Tue, Jun 06, 2023 at 06:58:06PM +0200, Hans de Goede wrote:

...

> >> +		if (regs[i].delay_us)
> >> +			fsleep(regs[i].delay_us);
> > 
> > Do you have an immediate need for this ? If not, I'd drop support for
> > the delay, and add it later when and if needed. It will be easier to
> > discuss the API and use cases with a real user.
> 
> This is a 1:1 mirror of regmap_multi_reg_write() note this uses
> the existing struct reg_sequence delay_us field and the:
> 
> 		if (regs[i].delay_us)
> 			fsleep(regs[i].delay_us);
> 
> is copied from the implementation of regmap_multi_reg_write()

Reading this I'm wondering if we can actually implement a regmap-cci inside
drivers/base/regmap and use it. It might be that this is impossible, but can
save us from repeating existing code I think.

-- 
With Best Regards,
Andy Shevchenko


