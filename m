Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBF67729FA
	for <lists+linux-media@lfdr.de>; Mon,  7 Aug 2023 18:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbjHGQAS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Aug 2023 12:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjHGQAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Aug 2023 12:00:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9609CE74
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 09:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691424015; x=1722960015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z/4FddksZRjYPF/sctXV9wacx6/6dUIpgpIazoNeWKI=;
  b=Ler+P97WXiKPIiofElnKirzLqAr1z/jdkIPw6u7vmKqc/XN6nJP/vtaY
   G38zXwAzRu8YXALfU5j+O47ZZZ/iFXJy3mVmXaoALnrM3rR2y+MbRhK5Z
   ZbchTHoYSA5DTP92G8ktYvKGPPqv2GoO0fHxenjKfCD6YY1evU0WUT3Az
   RWOGOuYgPvl32WZRD2gz9/dIHhCaHQMpN5xdGZHaa0U4jraHqIsN3DhIf
   PZgs3IFI9Q2sN1pqgB9PsojOAQk4jSzyMu+kFj0Np/jcbSwzVyYhCmq2y
   7pnQJtdpL3czIUdW+HXoCNTco4OOh1zbyNIqEZ4ALSqv1g/aNnAkpVh/S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401553715"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="401553715"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 09:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="977491938"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="977491938"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 07 Aug 2023 09:00:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qT2eN-000sgs-2E;
        Mon, 07 Aug 2023 19:00:07 +0300
Date:   Mon, 7 Aug 2023 19:00:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-media@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
Message-ID: <ZNEVB8ZJah9Y9Bua@smile.fi.intel.com>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
 <a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
 <87leeugbxm.wl-tiwai@suse.de>
 <ZMlGKy7ibjkQ6ii7@smile.fi.intel.com>
 <87pm3yj2s5.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pm3yj2s5.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 07, 2023 at 05:22:18PM +0200, Takashi Iwai wrote:
> On Tue, 01 Aug 2023 19:51:39 +0200, Andy Shevchenko wrote:
> > On Tue, Aug 01, 2023 at 02:54:45PM +0200, Takashi Iwai wrote:

...

> I rather wonder why it can't be simple strncpy().

This is obvious. To avoid compiler warning about 0 (possible) truncation.

...

> > Taking all remarks into account I would rather go with sockptr.h being
> > untouched for now, just a big
> > 
> > /* DO NOT USE, it's obsolete, use uniptr.h instead! */
> > 
> > to be added.
> 
> Possibly that's a safer choice.  But the biggest question is whether
> we want a generic type or not.  Let's try to ask it first.
> 
> Interestingly, this file doesn't belong to any subsystem in
> MAINTAINERS, so I'm not sure who to be Cc'ed.  Chirstoph as the
> original author and net dev, maybe.

Yes, but actually it's fine to just copy and change sockptr.h to say
"that's blablabla for net subsystem" (maybe this is implied by the name?).
In that case we just introduce our copy and can do whatever modifications
we want (see previous reply).

-- 
With Best Regards,
Andy Shevchenko


