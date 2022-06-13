Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 552B1549BAF
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 20:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245055AbiFMSh6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 14:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245712AbiFMShi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 14:37:38 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E85660A80
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 08:39:47 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="364650974"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="364650974"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 08:39:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="568079409"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 08:39:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1o0m9w-000b8d-0y;
        Mon, 13 Jun 2022 18:39:20 +0300
Date:   Mon, 13 Jun 2022 18:39:19 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: atomisp: revert "don't pass a pointer to a
 local variable"
Message-ID: <YqdaJ6fzEzeWpIGz@smile.fi.intel.com>
References: <20220612160556.108264-1-hdegoede@redhat.com>
 <20220612160556.108264-2-hdegoede@redhat.com>
 <CAHp75VcNjQ+0=LcMdi=64U5qvO2f3PeZCPAf9AKbrGLx4PdKmg@mail.gmail.com>
 <20220613145820.GF2146@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613145820.GF2146@kadam>
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

On Mon, Jun 13, 2022 at 05:58:20PM +0300, Dan Carpenter wrote:
> On Sun, Jun 12, 2022 at 09:22:55PM +0200, Andy Shevchenko wrote:
> > > Note there is another patch in this series, which fixes the warning
> > > in another way.
> > 
> > > Fixes: fa1451374ebf ("media: atomisp: don't pass a pointer to a local variable")
> > 
> > Dunno for media subsystem, but for ones that Greg is maintain, the
> > point is that revert itself is already kinda fix and no need to have a
> > Fixes tag, instead the commit message should clearly have the
> > automatically generated line of revert (with the rest of the
> > explanation why that is needed). Just sharing my experience.
> 
> How would that work in this case?  We don't have a reference to the git
> hash.

What do you mean? `git revert` adds the hash of the commit being reverted.

> The `git revert` command came from early days of git and I always
> feel like it hasn't keep up with how git is used these days.  The
> subject doesn't have the subsystem prefix.  The commit message is wrong.
> It uses the full git hash instead of the 12 char hash.  It doesn't have
> a fixes tag.  Hans's commit is only correct because he re-wrote
> basically everything.
> 
> Do a `git --grep=revert`.  Some of them you can grep for "This reverts
> commit 8bdc2a190105e862dfe7a4033f2fd385b7e58ae8." but there are a lot
> which are not machine parsable

Why not? The format of the string hasn't been changed, no difference from other
patterns.

P.S. I have told this as my experience and what Greg told me, feel free to
discuss with him or others, I'm pretty much okay if Hans' patch goes as is.

-- 
With Best Regards,
Andy Shevchenko


