Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3BA172444C
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 15:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237951AbjFFNXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 09:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233251AbjFFNXi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 09:23:38 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1851E6E;
        Tue,  6 Jun 2023 06:23:34 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355523748"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="355523748"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 06:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="742146299"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="742146299"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 06 Jun 2023 06:23:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1q6Weh-001dqM-0m;
        Tue, 06 Jun 2023 16:23:23 +0300
Date:   Tue, 6 Jun 2023 16:23:22 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        bingbu.cao@linux.intel.com, platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Hao Yao <hao.yao@intel.com>
Subject: Re: [PATCH v2] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
Message-ID: <ZH8zSqY2uMr+FuHh@smile.fi.intel.com>
References: <20230531134429.171337-1-hdegoede@redhat.com>
 <CAHp75VfZN5M8LiP3nw0NT5p3WyJJJJm6w2OZKgm28b6aokzopQ@mail.gmail.com>
 <b1cdf8b7-ae9b-a86d-5298-bd0cfa70f9cb@redhat.com>
 <CAHp75Vc7fq=PK5vN5Ya6yMRG3VCFhfwBVobxsSKYwKUyWnDq3g@mail.gmail.com>
 <5d38e467-d3f9-1d7b-84e7-e107e048cb01@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d38e467-d3f9-1d7b-84e7-e107e048cb01@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 06, 2023 at 03:13:47PM +0200, Hans de Goede wrote:
> On 6/6/23 13:26, Andy Shevchenko wrote:
> > On Tue, Jun 6, 2023 at 12:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 5/31/23 19:56, Andy Shevchenko wrote:
> >>> On Wed, May 31, 2023 at 4:44 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> >>>> +       if (clk->ena_gpio)
> >>>> +               gpiod_set_value_cansleep(clk->ena_gpio, 1);
> >>>> +       else
> >>>> +               skl_int3472_enable_clk_acpi_method(clk, 1);
> >>>
> >>> Looking at this, can we avoid duplicative validation of the GPIO?
> >>> Perhaps skl_int3472_enable_clk_acpi_method() can have embedded another
> >>> check so they won't be called together?
> >>>
> >>> ...
> >>>
> >>>> +       if (clk->ena_gpio)
> >>>> +               gpiod_set_value_cansleep(clk->ena_gpio, 0);
> >>>> +       else
> >>>> +               skl_int3472_enable_clk_acpi_method(clk, 0);
> >>>
> >>> Ditto.
> >>
> >> Ack, I've squashed a fix for this into this patch while merging it into
> >> my review-hans branch.
> > 
> > Now you have two different checks for the same, I would suggest that
> > you switch to check clk->cl in the skl_int3472_enable_clk()
> > as it's done in the skl_int3472_register_dsm_clock() instead of GPIO.
> > Other way around is also possible but it seems to me that checking for
> > clock existence has better guarantees than just checking for GPIO
> > availability.
> 
> Hmm, you mean the:
> 
>         if (int3472->clock.cl)
>                 return 0; /* A GPIO controlled clk has already been registered */
> 
> Check in skl_int3472_register_dsm_clock() ? That matches with / aligns with
> this check:
> 
>         if (int3472->clock.cl)
>                 return -EBUSY;
> 
> in skl_int3472_register_gpio_clock().
> 
> To me it seems sensible to align the checks for "a clk has already been
> registered" up this way.

I'm talking about enable method when we actually change the clock state.

-- 
With Best Regards,
Andy Shevchenko


