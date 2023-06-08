Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9045D727A08
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 10:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbjFHIeG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 04:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235430AbjFHIdz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 04:33:55 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657CF2728
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 01:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686213233; x=1717749233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FNaGeDetahslHyqcJhGShqjHEo8/98phYY9MGkWD8WA=;
  b=oCYc6cfpuSZCv1IbZP4teSJnI8PPYhoADdJ43u92N+QsyFhvWeQY/ZVp
   epQivelbe7xMqgMWVnD7pD/FR0eKFlxzcRJEMXpBqWMBZ9f6l3tkvsX+l
   trrN8oFTbKPCtBfuYPZMkf5j5I+64tvIqBFAjY7cF8PHdjWkwIzEZmqTl
   IzbEMH2jkRE/kTRPQyRWxYPdUgZPD+gNvikGsQYSuRJiQ6jiieHZzdTSz
   QNwko4zR9LiyyIK1MuGEZmQXR/5Mf4tOxqIcOzrgfKlJCtdoVKBrcrV3f
   oWPg7NF8CI3zUg/FXUA+gsT7JRYESOPrHhVXjh+LaaUAwMfzk6q8cfm//
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357256474"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="357256474"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 01:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="834094438"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="834094438"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 01:33:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 881B7120C1C;
        Thu,  8 Jun 2023 11:33:48 +0300 (EEST)
Date:   Thu, 8 Jun 2023 08:33:48 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
Message-ID: <ZIGSbOyLxGBEAWVH@kekkonen.localdomain>
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <20230607181855.GM5058@pendragon.ideasonboard.com>
 <b558aac9-0a34-ecca-57b0-d132af8cdefb@redhat.com>
 <ZIDjgFtZ7qp6YYz1@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIDjgFtZ7qp6YYz1@smile.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Wed, Jun 07, 2023 at 11:07:28PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 07, 2023 at 09:01:40PM +0200, Hans de Goede wrote:
> > On 6/7/23 20:18, Laurent Pinchart wrote:
> > > On Tue, Jun 06, 2023 at 06:58:06PM +0200, Hans de Goede wrote:
> 
> ...
> 
> > >> +		if (regs[i].delay_us)
> > >> +			fsleep(regs[i].delay_us);
> > > 
> > > Do you have an immediate need for this ? If not, I'd drop support for
> > > the delay, and add it later when and if needed. It will be easier to
> > > discuss the API and use cases with a real user.
> > 
> > This is a 1:1 mirror of regmap_multi_reg_write() note this uses
> > the existing struct reg_sequence delay_us field and the:
> > 
> > 		if (regs[i].delay_us)
> > 			fsleep(regs[i].delay_us);
> > 
> > is copied from the implementation of regmap_multi_reg_write()
> 
> Reading this I'm wondering if we can actually implement a regmap-cci inside
> drivers/base/regmap and use it. It might be that this is impossible, but can
> save us from repeating existing code I think.

I very much prefer this set over trying to bury equivalent functionality
in regmap. CCI is quite unlike what regmap is intended for, due to
its variable width registers and that CCI isn't a bus itself (but on top of
the bus specification itself).

-- 
Kind regards,

Sakari Ailus
