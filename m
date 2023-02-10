Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7B96927BB
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 21:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233608AbjBJUSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 15:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233601AbjBJUSO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 15:18:14 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44319BB80
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 12:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676060293; x=1707596293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KbKJqm7orm9Pu4lwi4Vn8dxJck8nZzTbye31rXcdld0=;
  b=Bv1S2APPWxXyLMLgapkiMo2//OBZkKU2eGucGXuaAs30rYkH0461wPyU
   Edb51ekxm0NScLMfRqPfG+OAl+QsQH7ooDa+i6BOVZzC2+22cm6Msy13S
   UcdN6X6XTZnMdNMr5iFvjb7PqJ+vjRLTObG/vA10XJcPN4/aCo8OlD931
   qQNwIoKWhN/FKdv6U3qkTwQOC8qOgwoxy6yiy+pcWAfo8MKSzA26f0Ixi
   oyTwDAMMxChdwrJwRqS9GHkGyMgS3lsEuwz2KBEun0Z38gKaw1PjeckBA
   LqWC0l7pOaYedART/QXnyHXaBLyEh9aKso4dwePQ4TaUavnOJBFR0liS5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310148100"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="310148100"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 12:18:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="645739974"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="645739974"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 12:18:09 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id AEFCC1218A3;
        Fri, 10 Feb 2023 22:18:06 +0200 (EET)
Date:   Fri, 10 Feb 2023 22:18:06 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+amfuCNZG8mbYXZ@kekkonen.localdomain>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
 <Y+Y39+IRyjwQi7Jr@kekkonen.localdomain>
 <Y+Zl4UfRN6sgcaf4@smile.fi.intel.com>
 <Y+ZzL5gWUg79wDX+@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+ZzL5gWUg79wDX+@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Andy,

On Fri, Feb 10, 2023 at 06:39:11PM +0200, Laurent Pinchart wrote:
> On Fri, Feb 10, 2023 at 05:42:25PM +0200, Andy Shevchenko wrote:
> > On Fri, Feb 10, 2023 at 02:26:31PM +0200, Sakari Ailus wrote:
> > > On Fri, Feb 10, 2023 at 01:45:10PM +0200, Laurent Pinchart wrote:
> > > > Regarding the width-specific versions of the helpers, I really think
> > > > encoding the size in the register macros is the best option. It makes
> > > > life easier for driver authors (only one function to call, no need to
> > > > think about the register width to pick the appropriate function in each
> > > > call) and reviewers (same reason), without any drawback in my opinion.
> > > 
> > > As I noted previously, this works well for drivers that need to access
> > > registers with multiple widths, which indeed applies to the vast majority
> > > of camera sensor drivers, but not to e.g. flash or lens VCM drivers. Fixed
> > > width registers are better served with a width-specific function. But these
> > > can be always added later on.
> > 
> > Again, we can extend regmap to have something like
> > 
> > 	int (*reg_width)(regmap *, offset)
> > 
> > callback added that will tell the regmap bus underneath what size to use.
> > 
> > In the driver one will define the respective method to return these widths.
> 
> I don't think that's worth it, it would make drivers quite complex
> compared to encoding the register width in the register address macros.
> We're dealing with devices that have hundreds of registers of various
> widths interleaved, a big switch/case for every write isn't great.

I'd really prefer the register width information kept as close as possible
to the register address, and most probably the best way is to be part of
the same macro.

-- 
Kind regards,

Sakari Ailus
