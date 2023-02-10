Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 036AD691EE6
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 13:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjBJMRV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 07:17:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjBJMRU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 07:17:20 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D266FEAB
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 04:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676031439; x=1707567439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lEO20uzzYE62J9GZAXrPhtcDMRbztVeBHRkO1sd6Ki4=;
  b=YylGae4ZfN0LpwrKY5xz1x67MtHtj+GfpyhVwLVOcnHNhaOHgLQwGxA8
   YaYprITNMOurBwc2JjaOrSmajxU6mAr0GLI6hScmmjT3YIDENTrQGkYZC
   xYD+OqKQDS7fqylZNW6sFlzKAzTO8jgYBstVxSenyHYuZD9iLNO6wzRWN
   Agvb2UemkbO0a99aawh/VHbC0co/RzGHoirs+3G6WXnD4XfkJ93scF9W0
   xyPLzoUyRYNNw1bWwgbb7SGi9wKTEBckKRsel4rS+PITzHJhBU4DQ4PKk
   rSkrwP6QPwGk5ncgAyL0nk3O3t+/lobiobdCmRIHWYhy9jsJv42Vf126O
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="318421422"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="318421422"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 04:17:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="776896632"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="776896632"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 04:17:15 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 46E6711F9EF;
        Fri, 10 Feb 2023 14:17:13 +0200 (EET)
Date:   Fri, 10 Feb 2023 14:17:13 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+Y1yWCGg5ORJEoh@kekkonen.localdomain>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
 <3be27a04-21e5-5929-88a1-0159f554a36f@redhat.com>
 <Y+Yz3qPY3aiJ+bYZ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+Yz3qPY3aiJ+bYZ@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Feb 10, 2023 at 02:09:02PM +0200, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Feb 10, 2023 at 12:56:45PM +0100, Hans de Goede wrote:
> > On 2/10/23 12:45, Laurent Pinchart wrote:
> > > On Fri, Feb 10, 2023 at 12:20:36PM +0100, Hans de Goede wrote:
> > >> On 2/9/23 17:11, Laurent Pinchart wrote:
> > >>> On Thu, Feb 09, 2023 at 04:03:22PM +0100, Hans de Goede wrote:
> > >>>> On 2/8/23 10:52, Laurent Pinchart wrote:
> > >>>>> On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
> > >>>>>> The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
> > >>>>>> ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
> > >>>>>> ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
> > >>>>>>
> > >>>>>> as well as various "atomisp" sensor drivers in drivers/staging, *all*
> > >>>>>> use register access helpers with the following function prototypes:
> > >>>>>>
> > >>>>>> int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
> > >>>>>>                     unsigned int len, u32 *val);
> > >>>>>>
> > >>>>>> int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
> > >>>>>>                      unsigned int len, u32 val);
> > >>>>>>
> > >>>>>> To read/write registers on Omnivision OVxxxx image sensors wich expect
> > >>>>>> a 16 bit register address in big-endian format and which have 1-3 byte
> > >>>>>> wide registers, in big-endian format (for the higher width registers).
> > >>>>>>
> > >>>>>> Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > >>>>>> versions of these register access helpers, so that this code duplication
> > >>>>>> can be removed.
> > >>>>>
> > >>>>> Any reason to hand-roll those instead of using regmap ?
> > >>>>
> > >>>> These devices have a mix of 8 + 16 + 24 bit registers which regmap
> > >>>> appears to not handle, a regmap has a single regmap_config struct
> > >>>> with a single "@reg_bits: Number of bits in a register address, mandatory",
> > >>>> so we would still need wrappers around regmap, at which point it
> > >>>> really offers us very little.
> > >>>
> > >>> We could extend regmap too, although that may be too much yak shaving.
> > >>> It would be nice, but I won't push hard for it.
> > >>>
> > >>>> Also I'm moving duplicate code present in many of the
> > >>>> drivers/media/i2c/ov*.c files into a common header to remove
> > >>>> duplicate code. The handrolling was already there before :)
> > >>>>
> > >>>> My goal with the new ovxxxx_16bit_addr_reg_helpers.h file was to
> > >>>> offer something which is as much of a drop-in replacement of the
> > >>>> current handrolled code as possible (usable with just a few
> > >>>> search-n-replaces) as possible.
> > >>>>
> > >>>> Basically my idea here was to factor out code which I noticed was
> > >>>> being repeated over and over again. My goal was not to completely
> > >>>> redo how register accesses are done in these drivers.
> > >>>>
> > >>>> I realize I have not yet converted any other drivers, that is because
> > >>>> I don't really have a way to test most of the other drivers. OTOH
> > >>>> with the current helpers most conversions should be fairly simply
> > >>>> and remove a nice amount of code. So maybe I should just only compile
> > >>>> test the conversions ?
> > >>>
> > >>> Before you spend time converting drivers, I'd like to complete the
> > >>> discussion regarding the design of those helpers. I'd rather avoid
> > >>> mass-patching drivers now and doing it again in the next kernel release.
> > >>
> > >> I completely agree.
> > >>
> > >>> Sakari mentioned CCI (part of the CSI-2 specification). I think that
> > >>> would be a good name to replace ov* here, as none of this is specific to
> > >>> OmniVision.
> > >>
> > >> I did not realize this was CCI I agree renaming the helpers makes sense.
> > >>
> > >> I see there still is a lot of discussion going on.
> > > 
> > > I haven't seen any disagreement regarding the cci prefix, so let's go
> > > for that. I'd propose cci_read() and cci_write().
> > > 
> > > Sakari, you and I would prefer layering this on top of regmap, while
> > > Andy proposed extending the regmap API. Let's see if we reach an
> > > anonymous agreement on this.
> > > 
> > > Regarding the width-specific versions of the helpers, I really think
> > > encoding the size in the register macros is the best option. It makes
> > > life easier for driver authors (only one function to call, no need to
> > > think about the register width to pick the appropriate function in each
> > > call) and reviewers (same reason), without any drawback in my opinion.
> > > 
> > > Another feature I'd like in these helpers is improved error handling. In
> > > quite a few sensor drivers I've written, I've implemented the write
> > > function as
> > > 
> > > int foo_write(struct foo *foo, u32 reg, u32 val, int *err)
> > > {
> > > 	...
> > > 	int ret;
> > > 
> > > 	if (err && *err)
> > > 		return *err;
> > > 
> > > 	ret = real_write(...);
> > > 	if (ret < 0) {
> > > 		dev_err(...);
> > > 		if (err)
> > > 			*err = ret;
> > > 	}
> > > 
> > > 	return ret;
> > > }
> > > 
> > > This allows callers to write
> > > 
> > > 	int ret = 0;
> > > 
> > > 	foo_write(foo, REG_A, 0, &ret);
> > > 	foo_write(foo, REG_B, 1, &ret);
> > > 	foo_write(foo, REG_C, 2, &ret);
> > > 	foo_write(foo, REG_D, 3, &ret);
> > > 
> > > 	return ret;
> > > 
> > > which massively simplifies error handling. I'd like the CCI write helper
> > > to implement such a pattern.
> > 
> > Interesting, I see that the passing of the err return pointer is optional,
> > so we can still just do a search replace in existing code setting that
> > to just NULL.
> 
> And if someone dislikes having to pass NULL for the last argument, we
> could use some macro magic to accept both the 3 arguments and 4
> arguments variants.
> 
> int __cci_write3(struct cci *cci, u32 reg, u32 val);
> int __cci_write4(struct cci *cci, u32 reg, u32 val, int *err);
> 
> #define __cci_write(_1, _2, _3, _4, NAME, ...) NAME
> #define cci_write(...) __cci_write(__VA_ARGS__, __cci_write4, __cci_write3)(__VA_ARGS__)

This would be nice, yes.

Who will now write the patches for this? :-)

-- 
Sakari Ailus
