Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C363C6927B5
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 21:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233241AbjBJUQQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 15:16:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbjBJUQP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 15:16:15 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A19B28875
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 12:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676060174; x=1707596174;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=17GJZ1NO2ymVZYO20+ZLQYft1Xj7M4uGY8kZbVCznjk=;
  b=ksKIGUyXwk4kPvhNEY5+KFnhEkXTYJhU3K6s1QldhGbCaRac4sj1fUm/
   sDbiu6lpaRw9TkJff88skEzImrinrcw+4X7S9vsh7eMeJlKab4+OKy6cy
   iQVaRr8yFDmGvivfJ8zKwzu+xlwkDZFEL7dT6wc/Ql1JP4dqMv8bAw5lQ
   2Yo4LzD8cUFVFPvCAwdXanPMDR7IUQRWyA7/t7vrtDrE2aN9989dN9K/t
   9Uv/sepF74eixE4L8kf2pVEH9vBkd8oBlQSTbTnFAFe5AJcCoxlypYezS
   hcAE8tw/brXLtzmWKQ3ntmRYyuzavQZYStq9OJQmVqVlt+LOznglqr3vF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="314161163"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="314161163"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 12:16:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="700595624"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="700595624"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 12:16:10 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 4BE4C1218A3;
        Fri, 10 Feb 2023 22:16:07 +0200 (EET)
Date:   Fri, 10 Feb 2023 22:16:07 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+amB+54n3o558ip@kekkonen.localdomain>
References: <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
 <3be27a04-21e5-5929-88a1-0159f554a36f@redhat.com>
 <Y+Yz3qPY3aiJ+bYZ@pendragon.ideasonboard.com>
 <30181cf6-7dc8-d75c-5d7a-93f483d4f045@redhat.com>
 <Y+ZEMTJZcbPAj+yk@kekkonen.localdomain>
 <8e4813ea-06a4-4e8a-4401-9d05af767377@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e4813ea-06a4-4e8a-4401-9d05af767377@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Feb 10, 2023 at 03:43:51PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 2/10/23 14:18, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Fri, Feb 10, 2023 at 01:47:49PM +0100, Hans de Goede wrote:
> >>> And if someone dislikes having to pass NULL for the last argument, we
> >>> could use some macro magic to accept both the 3 arguments and 4
> >>> arguments variants.
> >>>
> >>> int __cci_write3(struct cci *cci, u32 reg, u32 val);
> >>> int __cci_write4(struct cci *cci, u32 reg, u32 val, int *err);
> >>>
> >>> #define __cci_write(_1, _2, _3, _4, NAME, ...) NAME
> >>> #define cci_write(...) __cci_write(__VA_ARGS__, __cci_write4, __cci_write3)(__VA_ARGS__)
> >>
> >> TBH this just feels like code obfuscation to me and it is also going
> >> to write havoc with various smarted code-editors / IDEs which give
> >> proptype info to the user while typing the function name.
> >>
> >> Having the extra ", NULL" there in calls which don't use / need
> >> the *err thingie really is not a big deal IMHO.
> > 
> > It's still an eyesore if the driver doesn't use that pattern of register
> > access error handling. I also prioritise source code itself rather than try
> > to make it fit for a particular editor (which is neither Emacs nor Vim I
> > suppose?).
> 
> vim and emacs also both have support for showing function prototypes,
> but this is not only about breaking tooling like that.
> 
> My main objection is not that it confuses various tooling, it also confuses
> me as a human if I'm trying to figure out what is going on. The kernel's
> internal API documentation generally isn't great so I'm used to just look
> at a functions implementation as an alternative. These sort of dark-magic
> pre-compiler macros make it very hard for me *as a human* to figure out
> what is going on.
> 
> So to me personally this level of code-obfuscation just to avoid 6 chars
> ", NULL" per function calls is very much not worth the making things
> harder to understand level it adds.
> 
> I mean this will even allow mixing the 3 and 4 parameter variants
> in a single .c file! That is just very very confusing and anti KISS.
> 
> Who knows maybe iso-c2023 or whatever will give us default function
> arguments values? That would be a nice way to do this, the above
> not so much IMHO.
> 
> So I won't be adding this per-processor (dark) magic to my patch-set
> for this.
> 
> If people really want this they can add this in a follow-up patch-set.

Your arguments are entirely reasonable, but I still prefer to have what is
a best fit for most sensor drivers.

Although this, as well as other fixed size register access helpers, can be
added later as needed. The core functionality is what interests me the most
now. Even with one function for read and another (or a few, for bulk data?)
for write is a huge improvement over the current situation IMO.

-- 
Kind regards,

Sakari Ailus
