Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D685F54B22B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 15:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245070AbiFNNSS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 09:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbiFNNSR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 09:18:17 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C913B005
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 06:18:17 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="267299168"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="267299168"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:18:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="535560943"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:18:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1o16Qq-000cOy-MD;
        Tue, 14 Jun 2022 16:18:08 +0300
Date:   Tue, 14 Jun 2022 16:18:08 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/40] media: atomisp: Various hmm and other cleanups
Message-ID: <YqiKkMFp5k23ESVP@smile.fi.intel.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <CAHp75VcLfeN+y3S=AkMDjUyB3oS1k0j7pu4Ts7D9K35F3UkEbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcLfeN+y3S=AkMDjUyB3oS1k0j7pu4Ts7D9K35F3UkEbw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 14, 2022 at 11:25:07AM +0200, Andy Shevchenko wrote:
> On Mon, Jun 13, 2022 at 9:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi All,
> >
> > I want to start writing a libcamera pipeline handler for the atomisp2,
> > but before I can do that I first need to fix mmap support in  atomisp2.
> >
> > My plan for this is to port the atomisp2 handler to videobuf2. To do that
> > I first need to understand the existing memory/buffer management so I've
> > started with cleaning up the hmm code (with a bit of a detour here and
> > there).
> >
> > This series is the result of that. There are likely more cleanups to
> > follow, but I've to focus on some other things for a bit. I hope to be
> > able to return to the cleanups + an eventual videobuf2 conversion soon.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> For patches 1-8: The code wise it's good clean up, functionality it
> might be that intention was to implement it as some point, but looking
> into (internal) history of the driver development I believe it would
> require some firmware changes which is impossible for upstreamed
> version of the driver and as you noticed never productized that time.
> Hence, good that we got less LoCs after all.
> 
> For patches 9-13: I believe that patch 10 and 9 should be swapped in
> the series. Logically you drop caller first followed by (unused)
> callee.
> 
> For the rest: To be continued...

For the rest:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

I believe a couple of comments are easy to address, may keep my tag there.

-- 
With Best Regards,
Andy Shevchenko


