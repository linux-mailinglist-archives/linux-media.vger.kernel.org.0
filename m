Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A77A369238C
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 17:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbjBJQoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 11:44:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbjBJQn5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 11:43:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A518B2387B
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 08:43:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D222C904;
        Fri, 10 Feb 2023 17:43:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676047435;
        bh=Bx0RW8eetzo/7eHBUne+BXLb1YWCcBppPN/gMqlYop0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rcRhtGmNFgJv5zlxlzj+NI4Wyly4UK8bTKo60dtstjrYhvyptkKT5P3/OQAVpSY8o
         sYPGIQCdlfqw0fWsaJuFB1YNoegO/cxe0czHABN/uAtUmQDPiaoMytv2IplurHWQi2
         Ca76IeCTcEhHr1cSsHfbPN8iKHWTUpgLNKOlS0Hw=
Date:   Fri, 10 Feb 2023 18:43:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+Z0SEfZsRC/y+Ju@pendragon.ideasonboard.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8e4813ea-06a4-4e8a-4401-9d05af767377@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Feb 10, 2023 at 03:43:51PM +0100, Hans de Goede wrote:
> On 2/10/23 14:18, Sakari Ailus wrote:
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

The macro-based code I proposed is a poor man's workaround to the lack
of both default argument values and function override in plain C. It
could be nicer with dedicated language constructs for those, but that
won't change how the callers look like (you'll still be able to mix the
3 and 4 parameters variants in a single .c file), only the
implementation.

> So I won't be adding this per-processor (dark) magic to my patch-set
> for this.
> 
> If people really want this they can add this in a follow-up patch-set.

I don't mind much either way personally.

-- 
Regards,

Laurent Pinchart
