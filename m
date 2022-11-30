Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78D6963D410
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 12:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbiK3LMN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 06:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234025AbiK3LMI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 06:12:08 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119071EAE8;
        Wed, 30 Nov 2022 03:12:08 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="298741187"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="298741187"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 03:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="644175695"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="644175695"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 30 Nov 2022 03:10:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1p0Kz1-002ECm-1m;
        Wed, 30 Nov 2022 13:10:31 +0200
Date:   Wed, 30 Nov 2022 13:10:31 +0200
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
Message-ID: <Y4c6J+IMYspXRmqP@smile.fi.intel.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-7-hdegoede@redhat.com>
 <CAHp75Vc2nYtvHhrsNPe8JwbK_665F5_Z6bMDfvmtBKr0HomycA@mail.gmail.com>
 <7a110978-268d-811d-daa6-39f78f802e2c@redhat.com>
 <Y4c5PVBkWA3lHoqR@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4c5PVBkWA3lHoqR@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 30, 2022 at 01:06:38PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 11:39:42AM +0100, Hans de Goede wrote:
> > On 11/30/22 11:01, Andy Shevchenko wrote:
> > > On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:

...

> > >> +               (polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
> > > 
> > > Perhaps
> > > 
> > > static inline str_high_low(bool v)
> > > {
> > >   return v ? "high" : "low";
> > > }
> > > 
> > > In the string_helpers.h? If you are okay with the idea, you may use my
> > > tag ahead for that patch.
> > 
> > That is an interesting idea. but IMHO best done in a follow-up series
> > after checking for similar code in the rest of the kernel.
> > 
> > This is based on the assumption that "selling" this new helper to
> > the string_helpers.h maintainer will be easier if there are multiple
> > consumers of it right away.
> 
> strings_helper.h maintainer is any known kernel subsystem maintainer + me
> (as a reviewer / main contributor to that library). That's why I proposed
> the solution and my tag would be enough to route it via your tree.
> 
> So, offer still stays.

(You may check last few commits against the header and see the tags)

-- 
With Best Regards,
Andy Shevchenko


