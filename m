Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98B41691C9E
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 11:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbjBJKVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 05:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbjBJKVX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 05:21:23 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2BA76D8E6
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676024482; x=1707560482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=W85ywjlpyv5ce4zcqbb50fTeYj/4QrGsNfd2xaOmY4w=;
  b=gKKcay/ZbTm5Ej3j7HFCq8ChD9VoToldetWw+Lz1+7vml5Co8Nhu3O6a
   VTvG3fbw68aazxMiuCSyn5e57Hra7TlnTjjGoEtNySKKkpx8GbejnzXDT
   jUhrLpu3/H65KnsJdeuKZobSLlrb20WuzyCSs7UG8WX/O+Q5+BLYmYwYu
   wUjWxHVBtojsN3GjrN1FOX1QzEh9NyYrgKEXCFHka+0nbsL8dEQVnC0wf
   v3NecFI7LDzBp2N60yBq+zwpxaH/BykvsCEU8QRaQDpMJmJ63U9saEJfj
   1CCWl0oEJqDZpjDX8cH2+DIzmsbgsXlkPdNpvN+HkUe5O+HFXIHADCo85
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="314031599"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="314031599"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 02:21:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="700427647"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="700427647"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 02:21:19 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id ED24A11F9EF;
        Fri, 10 Feb 2023 12:21:15 +0200 (EET)
Date:   Fri, 10 Feb 2023 12:21:15 +0200
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
Message-ID: <Y+YamxehIUdF5aU7@kekkonen.localdomain>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Feb 09, 2023 at 06:11:12PM +0200, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Thu, Feb 09, 2023 at 04:03:22PM +0100, Hans de Goede wrote:
> > On 2/8/23 10:52, Laurent Pinchart wrote:
> > > On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
> > >> The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
> > >> ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
> > >> ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
> > >>
> > >> as well as various "atomisp" sensor drivers in drivers/staging, *all*
> > >> use register access helpers with the following function prototypes:
> > >>
> > >> int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
> > >>                     unsigned int len, u32 *val);
> > >>
> > >> int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
> > >>                      unsigned int len, u32 val);
> > >>
> > >> To read/write registers on Omnivision OVxxxx image sensors wich expect
> > >> a 16 bit register address in big-endian format and which have 1-3 byte
> > >> wide registers, in big-endian format (for the higher width registers).
> > >>
> > >> Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > >> versions of these register access helpers, so that this code duplication
> > >> can be removed.
> > > 
> > > Any reason to hand-roll those instead of using regmap ?
> > 
> > These devices have a mix of 8 + 16 + 24 bit registers which regmap
> > appears to not handle, a regmap has a single regmap_config struct
> > with a single "@reg_bits: Number of bits in a register address, mandatory",
> > so we would still need wrappers around regmap, at which point it
> > really offers us very little.
> 
> We could extend regmap too, although that may be too much yak shaving.
> It would be nice, but I won't push hard for it.

I took a look at this some time ago, too, and current regmap API is a poor
fit for CCI devices. CCI works on top of e.g. both I²C and I3C so something
on top of regmap is a better approach indeed.

Nearly all other devices have a fixed register width, so the regmap API
makes sense.

> 
> > Also I'm moving duplicate code present in many of the
> > drivers/media/i2c/ov*.c files into a common header to remove
> > duplicate code. The handrolling was already there before :)
> > 
> > My goal with the new ovxxxx_16bit_addr_reg_helpers.h file was to
> > offer something which is as much of a drop-in replacement of the
> > current handrolled code as possible (usable with just a few
> > search-n-replaces) as possible.
> > 
> > Basically my idea here was to factor out code which I noticed was
> > being repeated over and over again. My goal was not to completely
> > redo how register accesses are done in these drivers.
> > 
> > I realize I have not yet converted any other drivers, that is because
> > I don't really have a way to test most of the other drivers. OTOH
> > with the current helpers most conversions should be fairly simply
> > and remove a nice amount of code. So maybe I should just only compile
> > test the conversions ?
> 
> Before you spend time converting drivers, I'd like to complete the
> discussion regarding the design of those helpers. I'd rather avoid
> mass-patching drivers now and doing it again in the next kernel release.
> 
> Sakari mentioned CCI (part of the CSI-2 specification). I think that
> would be a good name to replace ov* here, as none of this is specific to
> OmniVision.
> 
> > > Also, may I
> > > suggest to have a look at drivers/media/i2c/imx290.c for an example of
> > > how registers of different sizes can be handled in a less error-prone
> > > way, using single read/write functions that adapt to the size
> > > automatically ?
> > 
> > Yes I have seen this pattern in drivers/media/i2c/ov5693.c too
> > (at least I assume it is the same pattern you are talking about).
> 
> Correct. Can we use something like that to merge all the ov*_write_reg()
> variants into a single function ? Having to select the size manually in
> each call (either by picking the function variant, or by passing a size
> as a function parameter) is error-prone. Encoding the size in the
> register macro is much safer, easing both development and review.

I think so, too.

That doesn't mean we shouldn't have function variants for specific register
sizes (taking just register addresses) though.

-- 
Regards,

Sakari Ailus
