Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5A107314C7
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 12:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239935AbjFOKEH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 06:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238214AbjFOKEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 06:04:06 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5552703
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 03:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686823445; x=1718359445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vvpjwov+wN4nQHWhG6cLBFlcLw+Wf9W305uDzZQo6wY=;
  b=WGxNxpNt/BRc1ath0drlLKQQ2ONKWIZTwaa90fEyaTJzdrYCWCuu9XoY
   KYNzFeyArZEjnxiWBp+rinbPLejKoLze+0znxU7NJ/nT1m1FdRnNOzWKc
   0r8H37Ug5kA4vLqVKkXneWYGq+l2AClLCdbMI4JYZIT7aLxH5ANts8+Bt
   mWqTAPp/axToxnMTYJ7kt/Xe7eh1A5uL7ruRvfFQVJLBwPnE//TnWDwcx
   ZXQIPBSmbvlEZGqkCibtyGyXoJpIwkSrU/aVn4gi8xU5+AOT2JLUF/LnS
   FRiugrTL4rpXN32gLxrf5CA2nOwSi3FzKkgCYSpRGEIQXRm1c9LH7gRH7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="387308068"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="387308068"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 03:04:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="777600939"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="777600939"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 03:04:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 649D51202B5;
        Thu, 15 Jun 2023 12:54:52 +0300 (EEST)
Date:   Thu, 15 Jun 2023 09:54:52 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIrf7Ku9LHRCIU5K@kekkonen.localdomain>
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <4c9b2cec-e026-e527-2253-fc541ec85d05@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c9b2cec-e026-e527-2253-fc541ec85d05@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jun 15, 2023 at 10:45:35AM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 6/14/23 22:39, Sakari Ailus wrote:

...
> >> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> >> index 348559bc2468..523ba243261d 100644
> >> --- a/drivers/media/v4l2-core/Kconfig
> >> +++ b/drivers/media/v4l2-core/Kconfig
> >> @@ -74,6 +74,11 @@ config V4L2_FWNODE
> >>  config V4L2_ASYNC
> >>  	tristate
> >>  
> >> +config V4L2_CCI
> >> +	tristate
> >> +	depends on I2C
> > 
> > This won't do anything if the dependent driver will select V4L2_CCI, will
> > it? I'd let the sensor driver depend on I2C instead. CCI is also supported
> > on I3C, for instance.
> 
> It will cause a Kconfig error if the dependent driver does not depend
> on I2C. Kconfig items doing select MUST depend on all the depends on
> of the items they are selecting; and (continued below)

Maybe this has changed? It used to be that these cases were silently
ignored and it wasn't that long ago. I haven't been following this up.

Nevertheless, this shouldn't depend on I2C as such.

> 
> > 
> >> +	select REGMAP_I2C
> > 
> > This is a good question.
> > 
> > How about adding V4L2_CCI_I2C that would select REGMAP_I2C?
> 
> v4l2-cci.ko uses the devm_regmap_init_i2c() symbol, so
> REGMAP_I2C must be enabled when V4L2_CCI is enabled and
> REGMAP_I2C is a symbol which should be selected rather
> then depended on when necessary.

I agree.

...

> >> +/**
> >> + * cci_regmap_init_i2c() - Create regmap to use with cci_*() register access functions
> >> + *
> >> + * @client: i2c_client to create the regmap for
> >> + * @reg_addr_bits: register address width to use (8 or 16)
> >> + *
> >> + * Note the memory for the created regmap is devm() managed, tied to the client.
> >> + *
> >> + * Return: %0 on success or a negative error code on failure.
> >> + */
> >> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits);
> >> +
> >> +#endif
> > 
> > Could you run
> > 
> > 	./scripts/checkpatch.pl --strict --max-line-length=80
> > 
> > on this?
> 
> As I mentioned during the v1 review where you also asked about
> the 80 column limit, can we first please have an official
> decision what the column limit is for drivers/media and then
> also document this somewhere?

This is documented in
Documentation/driver-api/media/maintainer-entry-profile.rst and media tree
follows that.

> 
> Also note that you are asking me to modify the checkpatch
> default max-line-length here. So basically you are deviating
> from the official kernel coding style standards here.

We're not. Note that checkpatch.pl is a tool to check code, it isn't the
coding style itself, which is documented in
Documentation/process/coding-style.rst . The default in checkpatch.pl was
changed as it often produced many warnings where there was a justified
reason for having longer lines (such as violating other rules in coding
style).

> 
> You are asking for 80 columns. Andy often adds review remarks
> along the lines of:
> 
> "this can fit on a single line" assuming the now official 100
> chars hard limit.

I know...

> 
> And I cannot make both you and Andy happy at the same time.
> So please pick a limit, *document it* and then stick with it.
> 
> This current inconsistency between reviewers is unhelpful.
> 
> My personal opinion on this is that sometimes going over
> 80 chars actually results in better readable code,
> so I have a slight preference to just stick with the kernel
> default of 100 chars. Sticking to the kernel default also
> makes life a lot easier for people contributing to multiple
> subsystems. So my vote goes to sticking with the new
> kernel default of 100 chars.
> 
> I'm happy to adjust this patch-set to fit everything in
> 80 chars, but can we please first get some clarity on
> what actual column limit we want for drivers/media ?

Answered above. Note that the limit is not strict but it appears that in
this set there are many longer lines than 80 but no apparent reason for
having them that way.

-- 
Kind regards,

Sakari Ailus
