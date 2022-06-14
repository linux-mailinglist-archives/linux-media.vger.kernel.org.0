Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAC9954ADE4
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 12:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239482AbiFNKE4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 06:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiFNKE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 06:04:56 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B4B24F21
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 03:04:55 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279289215"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="279289215"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 03:04:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="673801721"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 03:04:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1o13Pl-000cEx-3D;
        Tue, 14 Jun 2022 13:04:49 +0300
Date:   Tue, 14 Jun 2022 13:04:48 +0300
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
Message-ID: <YqhdQIPaG6ictF7/@smile.fi.intel.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <CAHp75VcLfeN+y3S=AkMDjUyB3oS1k0j7pu4Ts7D9K35F3UkEbw@mail.gmail.com>
 <655885f2-e3c4-2e26-7271-7032bae017c5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655885f2-e3c4-2e26-7271-7032bae017c5@redhat.com>
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

On Tue, Jun 14, 2022 at 11:50:32AM +0200, Hans de Goede wrote:
> On 6/14/22 11:25, Andy Shevchenko wrote:
> > On Mon, Jun 13, 2022 at 9:51 PM Hans de Goede <hdegoede@redhat.com> wrote:

> > For patches 9-13: I believe that patch 10 and 9 should be swapped in
> > the series. Logically you drop caller first followed by (unused)
> > callee.
> 
> Note the code removed in patch 9 was never called even before patch 10,
> the removed calls in patch 10 were already "#if 0"-ed out. So there
> is no bisect breakage here. With that said I get your point.

Yes, it's not about bisecting, but rather logic and (quite unlike) possibility
of restoring that partially and when someone switches 0 to 1 in those #if:s,
compilation will be broken.

-- 
With Best Regards,
Andy Shevchenko


