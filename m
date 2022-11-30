Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24BD263D3F1
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 12:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbiK3LGt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 06:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232983AbiK3LGq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 06:06:46 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9889B663EF;
        Wed, 30 Nov 2022 03:06:43 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="317217216"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="317217216"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 03:06:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="889245958"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="889245958"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2022 03:06:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1p0KvG-002E5f-02;
        Wed, 30 Nov 2022 13:06:38 +0200
Date:   Wed, 30 Nov 2022 13:06:37 +0200
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
Subject: Re: [PATCH 6/6] platform/x86: int3472/discrete: Get the polarity
 from the _DSM entry
Message-ID: <Y4c5PVBkWA3lHoqR@smile.fi.intel.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-7-hdegoede@redhat.com>
 <CAHp75Vc2nYtvHhrsNPe8JwbK_665F5_Z6bMDfvmtBKr0HomycA@mail.gmail.com>
 <7a110978-268d-811d-daa6-39f78f802e2c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a110978-268d-811d-daa6-39f78f802e2c@redhat.com>
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

On Wed, Nov 30, 2022 at 11:39:42AM +0100, Hans de Goede wrote:
> On 11/30/22 11:01, Andy Shevchenko wrote:
> > On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> According to:
> >> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
> >>
> >> Bits 31-24 of the _DSM pin entry integer value codes the active-value,
> >> that is the actual physical signal (0 or 1) which needs to be output on
> >> the pin to turn the sensor chip on (to make it active).
> >>
> >> So if bits 31-24 are 0 for a reset pin, then the actual value of the reset
> >> pin needs to be 0 to take the chip out of reset. IOW in this case the reset
> >> signal is active-high rather then the default active-low.
> >>
> >> And if bits 31-24 are 0 for a clk-en pin then the actual value of the clk
> >> pin needs to be 0 to enable the clk. So in this case the clk-en signal
> >> is active-low rather then the default active-high.
> >>
> >> IOW if bits 31-24 are 0 for a pin, then the default polarity of the pin
> >> is inverted.
> >>
> >> Add a check for this and also propagate this new polarity to the clock
> >> registration.
> > 
> > I like it in this form, thanks!
> > 
> > ...
> > 
> >> +               (polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
> > 
> > Perhaps
> > 
> > static inline str_high_low(bool v)
> > {
> >   return v ? "high" : "low";
> > }
> > 
> > In the string_helpers.h? If you are okay with the idea, you may use my
> > tag ahead for that patch.
> 
> That is an interesting idea. but IMHO best done in a follow-up series
> after checking for similar code in the rest of the kernel.
> 
> This is based on the assumption that "selling" this new helper to
> the string_helpers.h maintainer will be easier if there are multiple
> consumers of it right away.

strings_helper.h maintainer is any known kernel subsystem maintainer + me
(as a reviewer / main contributor to that library). That's why I proposed
the solution and my tag would be enough to route it via your tree.

So, offer still stays.

-- 
With Best Regards,
Andy Shevchenko


