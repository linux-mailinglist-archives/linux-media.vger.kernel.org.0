Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C03E63D3E8
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 12:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232477AbiK3LEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 06:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiK3LEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 06:04:14 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4F92BB08;
        Wed, 30 Nov 2022 03:04:13 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="317216807"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="317216807"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 03:04:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="889245327"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="889245327"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2022 03:04:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1p0Ksk-002E1m-1o;
        Wed, 30 Nov 2022 13:04:02 +0200
Date:   Wed, 30 Nov 2022 13:04:02 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 3/6] platform/x86: int3472/discrete: Treat privacy LED as
 regular GPIO
Message-ID: <Y4c4oveumdtSJ8Py@smile.fi.intel.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-4-hdegoede@redhat.com>
 <CAHp75VfZ2Lk-AaQDazaUJARiHrGrMH46d5La7qwVTU8fkDiPAQ@mail.gmail.com>
 <f54e3235-b146-ed4d-4848-edfbeb97bbe6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f54e3235-b146-ed4d-4848-edfbeb97bbe6@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 30, 2022 at 11:34:57AM +0100, Hans de Goede wrote:
> On 11/30/22 10:54, Andy Shevchenko wrote:
> > On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> On some systems, e.g. the Lenovo ThinkPad X1 Yoga gen 7 and the ThinkPad
> >> X1 Nano gen 2 there is no clock-enable pin, triggering the:
> >> "No clk GPIO. The privacy LED won't work" warning and causing the privacy
> >> LED to not work.
> >>
> >> Fix this by treating the privacy LED as a regular GPIO rather then
> >> integrating it with the registered clock.
> >>
> >> Note this relies on the ov5693 driver change to support an (optional)
> >> privacy-led GPIO to avoid the front cam privacy LED regressing on some
> >> models.
> > 
> > ...
> > 
> >> -       case INT3472_GPIO_TYPE_PRIVACY_LED:
> >> -               gpio = acpi_get_and_request_gpiod(path, pin, "int3472,privacy-led");
> >> -               if (IS_ERR(gpio))
> >> -                       return (PTR_ERR(gpio));
> >>
> >> -               int3472->clock.led_gpio = gpio;
> >> -               break;
> > 
> > I'm not sure how the previous patch makes this one work without
> > regressions. We have a "privacy-led" GPIO name there and here it used
> > to be with a prefix. Maybe I'm missing something...
> 
> The GPIO used to be controlled as part of the clk-provider,
> and the "int3472,privacy-led" name was the name of the consumer
> of the GPIO shown in /sys/kernel/debug/gpio. The "int3472,privacy-led"
> name has no lookup meaning since the pin is directly looked up by
> GPIO chip ACPI path + pin offset here.
> 
> Since not all devices with a privacy LED also have a clk-enable GPIO
> and thus a clk provider this did not work anywhere.
> 
> So this patch removes the code which controls the privacy LED
> through the clk-provider (which used the "int3472,privacy-led"
> and instead now adds an entry to the GPIO lookup table attached
> to the sensor. That new GPIO lookup table entry uses the name
> "privacy-led" since the LED no now longer is controlled by
> the INT3472 code (*).  The matching sensor driver patch
> (patch 1/6) to make the sensor driver directly control the
> privacy-led also uses "privacy-led" when calling gpiod_get()
> for it.
> 
> I hope this helps explain.

Definitely, thanks!

> *) all the INT3472 code now does is add the lookup table entry
> gpio lookup table

-- 
With Best Regards,
Andy Shevchenko


