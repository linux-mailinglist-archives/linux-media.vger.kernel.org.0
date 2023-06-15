Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC3E731A5F
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 15:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344309AbjFONpZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 09:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344725AbjFONpN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 09:45:13 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0071FEF
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686836712; x=1718372712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Ph60o5TIub/ZC81f9BglW2vSkVNG07elbGl1hyE3cI=;
  b=njQaEKYnPAM+ESRFsqO9nkk9AcKEiaT3CkeRITfyUkl8B4x3wd8g1RSw
   hvLFCeYFNwFlamlEGquRCr9+CZw/KCkxkUWZsvm8L8jRoN/GXNXYFkl65
   dTkswsN7kmzdqxchS0mbTahfBheTEkBRJ5ZzSWK7lgLFzr5CEwjBIX0gY
   vwf2ZXFNG+sS20DpTv5pfpM1hE830xn2KrAGSeqfq/pG+8LKCw3HcOoEw
   OmLSMCHIddYPOfqP2hIS74yw/fDQm8bdfSvGow/If+duIOeA7eiHhyjIv
   P8CN9ORtuB4eGLUJg23Mse5tDgaro56IR+NtMxlns9/LWakWYnJMasQZr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362304018"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="362304018"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 06:19:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825279081"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="825279081"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 06:19:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E4E411202B5;
        Thu, 15 Jun 2023 16:19:30 +0300 (EEST)
Date:   Thu, 15 Jun 2023 13:19:30 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIsP4ohiO7gHi+eC@kekkonen.localdomain>
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <4c9b2cec-e026-e527-2253-fc541ec85d05@redhat.com>
 <ZIrf7Ku9LHRCIU5K@kekkonen.localdomain>
 <647c6bf0-2ad3-16bd-8081-7f4244f60938@redhat.com>
 <ZIr41hzdphg1UbJy@kekkonen.localdomain>
 <f10d2b2d-1496-936c-c609-38279d8f6262@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f10d2b2d-1496-936c-c609-38279d8f6262@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jun 15, 2023 at 02:05:02PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 6/15/23 13:41, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Thu, Jun 15, 2023 at 12:15:47PM +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 6/15/23 11:54, Sakari Ailus wrote:
> >>> Hi Hans,
> >>>
> >>> On Thu, Jun 15, 2023 at 10:45:35AM +0200, Hans de Goede wrote:
> >>>> Hi Sakari,
> >>>>
> >>>> On 6/14/23 22:39, Sakari Ailus wrote:
> >>>
> >>> ...
> >>>>>> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> >>>>>> index 348559bc2468..523ba243261d 100644
> >>>>>> --- a/drivers/media/v4l2-core/Kconfig
> >>>>>> +++ b/drivers/media/v4l2-core/Kconfig
> >>>>>> @@ -74,6 +74,11 @@ config V4L2_FWNODE
> >>>>>>  config V4L2_ASYNC
> >>>>>>  	tristate
> >>>>>>  
> >>>>>> +config V4L2_CCI
> >>>>>> +	tristate
> >>>>>> +	depends on I2C
> >>>>>
> >>>>> This won't do anything if the dependent driver will select V4L2_CCI, will
> >>>>> it? I'd let the sensor driver depend on I2C instead. CCI is also supported
> >>>>> on I3C, for instance.
> >>>>
> >>>> It will cause a Kconfig error if the dependent driver does not depend
> >>>> on I2C. Kconfig items doing select MUST depend on all the depends on
> >>>> of the items they are selecting; and (continued below)
> >>>
> >>> Maybe this has changed? It used to be that these cases were silently
> >>> ignored and it wasn't that long ago. I haven't been following this up.
> >>>
> >>> Nevertheless, this shouldn't depend on I2C as such.
> >>>
> >>>>
> >>>>>
> >>>>>> +	select REGMAP_I2C
> >>>>>
> >>>>> This is a good question.
> >>>>>
> >>>>> How about adding V4L2_CCI_I2C that would select REGMAP_I2C?
> >>>>
> >>>> v4l2-cci.ko uses the devm_regmap_init_i2c() symbol, so
> >>>> REGMAP_I2C must be enabled when V4L2_CCI is enabled and
> >>>> REGMAP_I2C is a symbol which should be selected rather
> >>>> then depended on when necessary.
> >>>
> >>> I agree.
> >>
> >> If you agree that because of the symbol dependency that
> >> the select REGMAP_I2C is necessary then the depends on I2C
> >> is also necessary because any Kconfig symbol selecting
> >> another symbol MUST depends on all of the dependencies
> >> of the selected symbol and REGMAP_I2C has:
> >>
> >> config REGMAP_I2C
> >>         tristate
> >>         depends on I2C
> > 
> > Yes.
> > 
> > How about putting cci_regmap_init_i2c() behind an #ifdef? Then there
> > wouldn't be a need for REGMAP_I2C unconditionally, but dependent on I2C.
> > 
> > I guess right now I2C is more or less given in many systems but binding CCI
> > to it still seems dubious.
> 
> Yes, I can wrap the cci_regmap_init_i2c() prototype +
> implementation in
> 
> #ifdef CONFIG_REGMAP_I2C
> 
> for version 4. Downside of this is that all i2c sensor drivers
> which want to use the CCI helpers now will need to have
> a select REGMAP_I2C added to their Kconfig snippet.

Not if you add a new option for V4L2_CCI, a bit like you suggested for
sensor driver dependencies in general:

config V4L2_CCI_I2C
	tristate
	depends on I2C
	select REGMAP_I2C
	select V4L2_CCI

So individual drivers would then select this instead of the plain V4L2_CCI.

The same could later on be done for I3C.

-- 
Kind regards,

Sakari Ailus
