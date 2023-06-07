Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4C27267EA
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 20:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232360AbjFGSDx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 14:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbjFGSDx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 14:03:53 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FDB1FC2
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 11:03:52 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="420625518"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="420625518"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 11:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="774726437"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="774726437"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 07 Jun 2023 11:03:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1q6xV0-001yIa-0n;
        Wed, 07 Jun 2023 21:03:10 +0300
Date:   Wed, 7 Jun 2023 21:03:10 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
Message-ID: <ZIDGXsebVCLiwIlq@smile.fi.intel.com>
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <CAHp75Vd6TPfZhPEDUdAj0Y7G8fQDPKQhmcY_tDWmN7VHBpXL0w@mail.gmail.com>
 <0760b8ba-0091-5270-5e46-9787a910bd6f@redhat.com>
 <ZIBxhg1LVL8+zBCE@kekkonen.localdomain>
 <CAHp75VeZe-aeusoeYgDh=6kGfxNUDexLvvwMdLTKe-k1_vtAwA@mail.gmail.com>
 <2f367370-1dcd-5246-4016-dfb06019eda6@redhat.com>
 <CAHp75VekdeW1P0-CvcdTCYryvq0DGkJ6JzCVtatVAgFDu5gJxA@mail.gmail.com>
 <1847f77d-0a14-8204-bdeb-cf30699f0acb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1847f77d-0a14-8204-bdeb-cf30699f0acb@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 07, 2023 at 06:20:08PM +0200, Hans de Goede wrote:
> On 6/7/23 18:14, Andy Shevchenko wrote:
> > On Wed, Jun 7, 2023 at 6:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 6/7/23 17:40, Andy Shevchenko wrote:
> >>> On Wed, Jun 7, 2023 at 3:01 PM Sakari Ailus
> >>> <sakari.ailus@linux.intel.com> wrote:
> >>>> On Wed, Jun 07, 2023 at 10:40:34AM +0200, Hans de Goede wrote:
> >>>>> On 6/6/23 22:43, Andy Shevchenko wrote:

...

> >>>>>               *val = __get_unaligned_be24(buf);
> >>>
> >>> __without double underscore prefix
> >>
> >> include/asm-generic/unaligned.h
> >>
> >> defines __get_unaligned_be24() and not get_unaligned_be24(), I guess because 24bit is not a standard register width.
> > 
> > Strange. Do you have some custom patches in the area?
> > 
> > https://elixir.bootlin.com/linux/v6.4-rc5/source/include/asm-generic/unaligned.h#L112
> > https://elixir.bootlin.com/linux/v6.4-rc5/source/include/asm-generic/unaligned.h#L90
> 
> No I do not have any custom patches in that area; and the wrapper you
> point to is right there...
> 
> I somehow missed it, sorry.

No problem.

> So I will drop the __ as requested when adding the switch-case implementation for v2.

Thank you!

-- 
With Best Regards,
Andy Shevchenko


