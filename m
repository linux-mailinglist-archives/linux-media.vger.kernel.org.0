Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 612AB7317E6
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 13:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344666AbjFOLvs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 07:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345267AbjFOLvO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 07:51:14 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910664233
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686829631; x=1718365631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1sIrnZkWHwBmWGV6avSd/QtSO6v9kuqlgyFgyVzaSwQ=;
  b=gJQzMguWX2b/ZfAsUgvM+y4lQmz+CGW2s1IbfL72BQZchPX7XFmop8dy
   9tuyHT1PbIF2QOPokuhuArRSksFS1h7GNuvTDgbL/O76XdQ5ZQ6oSNiI+
   NSznlsm4F7j0faBGNjcXynWckNFGijwJXea73Gdvjo7+mKst/8MQfGqzs
   Gf/yk5qMG876SQwAh9ZQ24f8PCIBMwrwrrtzalyzybnA9Bho9ohEK3v+v
   vypwXU/iGtQVW7er60MSNe6p/l4IIyTYO3zaAFmXeZ1e7LAF8Bg0nk1b8
   gPkrfDLfmSc9efb7Qpduq46LFDpGMcnc+BezLvmjulLhR5HiYc9ay/CmZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="338515071"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="338515071"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 04:41:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="836583791"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="836583791"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 04:41:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0314A1202B5;
        Thu, 15 Jun 2023 14:41:10 +0300 (EEST)
Date:   Thu, 15 Jun 2023 11:41:10 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIr41hzdphg1UbJy@kekkonen.localdomain>
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <4c9b2cec-e026-e527-2253-fc541ec85d05@redhat.com>
 <ZIrf7Ku9LHRCIU5K@kekkonen.localdomain>
 <647c6bf0-2ad3-16bd-8081-7f4244f60938@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <647c6bf0-2ad3-16bd-8081-7f4244f60938@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jun 15, 2023 at 12:15:47PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 6/15/23 11:54, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Thu, Jun 15, 2023 at 10:45:35AM +0200, Hans de Goede wrote:
> >> Hi Sakari,
> >>
> >> On 6/14/23 22:39, Sakari Ailus wrote:
> > 
> > ...
> >>>> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> >>>> index 348559bc2468..523ba243261d 100644
> >>>> --- a/drivers/media/v4l2-core/Kconfig
> >>>> +++ b/drivers/media/v4l2-core/Kconfig
> >>>> @@ -74,6 +74,11 @@ config V4L2_FWNODE
> >>>>  config V4L2_ASYNC
> >>>>  	tristate
> >>>>  
> >>>> +config V4L2_CCI
> >>>> +	tristate
> >>>> +	depends on I2C
> >>>
> >>> This won't do anything if the dependent driver will select V4L2_CCI, will
> >>> it? I'd let the sensor driver depend on I2C instead. CCI is also supported
> >>> on I3C, for instance.
> >>
> >> It will cause a Kconfig error if the dependent driver does not depend
> >> on I2C. Kconfig items doing select MUST depend on all the depends on
> >> of the items they are selecting; and (continued below)
> > 
> > Maybe this has changed? It used to be that these cases were silently
> > ignored and it wasn't that long ago. I haven't been following this up.
> > 
> > Nevertheless, this shouldn't depend on I2C as such.
> > 
> >>
> >>>
> >>>> +	select REGMAP_I2C
> >>>
> >>> This is a good question.
> >>>
> >>> How about adding V4L2_CCI_I2C that would select REGMAP_I2C?
> >>
> >> v4l2-cci.ko uses the devm_regmap_init_i2c() symbol, so
> >> REGMAP_I2C must be enabled when V4L2_CCI is enabled and
> >> REGMAP_I2C is a symbol which should be selected rather
> >> then depended on when necessary.
> > 
> > I agree.
> 
> If you agree that because of the symbol dependency that
> the select REGMAP_I2C is necessary then the depends on I2C
> is also necessary because any Kconfig symbol selecting
> another symbol MUST depends on all of the dependencies
> of the selected symbol and REGMAP_I2C has:
> 
> config REGMAP_I2C
>         tristate
>         depends on I2C

Yes.

How about putting cci_regmap_init_i2c() behind an #ifdef? Then there
wouldn't be a need for REGMAP_I2C unconditionally, but dependent on I2C.

I guess right now I2C is more or less given in many systems but binding CCI
to it still seems dubious.

> 
> <snip>
> 
> > This is documented in
> > Documentation/driver-api/media/maintainer-entry-profile.rst and media tree
> > follows that.
> 
> Ah, I missed that. Ok, I'll run
> 
> ./scripts/checkpatch.pl --strict --max-line-length=80
> 
> and fix the warnings, with maybe one or 2 exceptions
> where longer lines really make the code more readable.

Thank you.

-- 
Kind regards,

Sakari Ailus
