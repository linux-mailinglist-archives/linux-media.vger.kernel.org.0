Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6541433833
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 16:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbhJSOSy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 10:18:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:43531 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229584AbhJSOSx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 10:18:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="289374764"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="289374764"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 07:06:58 -0700
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="526668039"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 07:06:52 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mcplB-000f1m-2P;
        Tue, 19 Oct 2021 17:06:33 +0300
Date:   Tue, 19 Oct 2021 17:06:33 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nable <nable.maininbox@googlemail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>
Subject: Re: [BUG 0/5] bug reports for atomisp to make it work
Message-ID: <YW7Q6ZXMffrNY3RL@smile.fi.intel.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
 <2170cfdf-767f-969c-f241-4e61bfafd1f5@redhat.com>
 <CAHp75VcuP4NTYYL6FreW-bdB549T1WNwty74PUFm+LYLeLkdhA@mail.gmail.com>
 <919e6e09bf258b48dd8819ec43cd13ab48489aa7.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <919e6e09bf258b48dd8819ec43cd13ab48489aa7.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 19, 2021 at 09:58:20PM +0900, Tsuchiya Yuto wrote:
> On Mon, 2021-10-18 at 11:10 +0300, Andy Shevchenko wrote:
> > On Mon, Oct 18, 2021 at 10:51 AM Hans de Goede <hdegoede@redhat.com> wrote:
> > 
> > > Just adding some folks to the Cc.
> > 
> > A hint to the newly added folks, there is an archive of the Linux
> > kernel related emails located on lore.kernel.org. The quite famous
> > distros already have in their repositories the `b4` tool that helps to
> > access that archive. So, after installing that tool you may download
> > the whole thread as a mailbox or as a bundle ready for `git am` just
> > using the Message-ID value.
> 
> Ah sorry, I failed to add people to Cc who I should have definitly
> added.
> 
> And I might have sent all of the emails to people who I should not
> by blindly using `scripts/get_maintainer.pl` for the first bug report
> with `--cc-cmd`.

I have written a script [1] for myself which helps me a lot nowadays.
It tries to be smart enough to include all interested parties. Although,
user may expand the Cc and/or To lists.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko


