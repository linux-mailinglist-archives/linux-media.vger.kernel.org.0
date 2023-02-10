Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4DF2691D4D
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 11:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbjBJKxw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 05:53:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbjBJKxu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 05:53:50 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568EF3773F
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 02:53:49 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="318406929"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="318406929"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 02:53:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="668015713"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="668015713"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 10 Feb 2023 02:53:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pQR2F-0050tX-2j;
        Fri, 10 Feb 2023 12:53:43 +0200
Date:   Fri, 10 Feb 2023 12:53:43 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+YiNyC7TeOEn/Hi@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <Y+YamxehIUdF5aU7@kekkonen.localdomain>
 <Y+Ycf4SpMaUfdR5m@pendragon.ideasonboard.com>
 <Y+Yg217HSEi4c+mP@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+Yg217HSEi4c+mP@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 10, 2023 at 12:47:55PM +0200, Sakari Ailus wrote:
> On Fri, Feb 10, 2023 at 12:29:19PM +0200, Laurent Pinchart wrote:
> > On Fri, Feb 10, 2023 at 12:21:15PM +0200, Sakari Ailus wrote:
> > > On Thu, Feb 09, 2023 at 06:11:12PM +0200, Laurent Pinchart wrote:

...

> > > I took a look at this some time ago, too, and current regmap API is a poor
> > > fit for CCI devices. CCI works on top of e.g. both I²C and I3C so something
> > > on top of regmap is a better approach indeed.
> > 
> > I'm confused, is regmap a poor fit, or a better approach ?
> 
> I'm proposing having something on top of regmap, but not changing regmap
> itself.

I don't understand why we can't change regmap? regmap has a facility called
regmap bus which we can provide specifically for these types of devices. What's
wrong to see it done?

-- 
With Best Regards,
Andy Shevchenko


