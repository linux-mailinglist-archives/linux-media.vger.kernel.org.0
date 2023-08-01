Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAE276B67C
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 15:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbjHAN6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 09:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjHAN6W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 09:58:22 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C24AC3
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690898301; x=1722434301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZKIy+hH5QB+KBuMy5Vbg4Dhcb8h2GptMzqQNMbJ5fGU=;
  b=U6/YBzf7lB6RYuyYSxAExsByVn7QW2NGueLJJH6O+RSvyuahELGb7R+4
   kBjuCwncotKI9C06xC+yBiqp7qjChZYxO22ypQ8kkmFZk+rmkPB2onIRD
   GbLGLOUTTjomWQ8QuNtt5qz2LitvepQ7ucy8ofqEnay5uKa/F2GNT+jpf
   7vjpB87NlLmE2UMJeimlto6EVjFEpvF5a+ZzTsmrgNSBHLGnmzpWzWxoa
   9hwLnkOBeTphdkuFoMkD1dUefyx4/pbJZVOmTfpeg45SvZamu7NG04gKT
   XhspAMsw1zalVHJDqa6s9cy6+Ma+WQMTr8GRxzWUxQnuE1rGeyTFMT4GB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400250891"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="400250891"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 06:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="763772313"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="763772313"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 01 Aug 2023 06:57:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQpsm-005MX9-2k;
        Tue, 01 Aug 2023 16:57:52 +0300
Date:   Tue, 1 Aug 2023 16:57:52 +0300
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
Message-ID: <ZMkPYFblXjxah6Xt@smile.fi.intel.com>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6pjj2ui.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 31, 2023 at 09:30:29PM +0200, Takashi Iwai wrote:
> On Mon, 31 Jul 2023 19:20:54 +0200,
> Mark Brown wrote:
> > 
> > On Mon, Jul 31, 2023 at 05:46:54PM +0200, Takashi Iwai wrote:
> > 
> > > this is a patch set to clean up the PCM copy ops using sockptr_t as a
> > > "universal" pointer, inspired by the recent patch from Andy
> > > Shevchenko:
> > >   https://lore.kernel.org/r/20230721100146.67293-1-andriy.shevchenko@linux.intel.com
> > 
> > > Even though it sounds a bit weird, sockptr_t is a generic type that is
> > > used already in wide ranges, and it can fit our purpose, too.  With
> > > sockptr_t, the former split of copy_user and copy_kernel PCM ops can
> > > be unified again gracefully.
> > 
> > It really feels like we ought to rename, or add an alias for, the type
> > if we're going to start using it more widely - it's not helping to make
> > the code clearer.
> 
> That was my very first impression, too, but I changed my mind after
> seeing the already used code.  An alias might work, either typedef or
> define genptr_t or such as sockptr_t.  But we'll need to copy the
> bunch of helper functions, too...

Maybe we should define a genptr_t (in genptr.h) and convert sockptr infra to
use it (in sockptr.h)? This will leave network and other existing users to
convert to it step-by-step.

Another approach is to simply copy sockptr.h to genptr.h with changed naming
scheme and add a deprecation note to the former.

Thank you, Takashi, for doing this!

-- 
With Best Regards,
Andy Shevchenko


