Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4E929F8E2
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 00:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgJ2XK1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 19:10:27 -0400
Received: from mga17.intel.com ([192.55.52.151]:33743 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJ2XK1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 19:10:27 -0400
IronPort-SDR: vorV8/MqqqCtK2YgKjx6LCSjDgtYqctFy2krkIqBSsdB7kTWtlmaZGZA6hCIEC/ZLRrDhWK1uc
 jzqCko9dNg/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="148384192"
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; 
   d="scan'208";a="148384192"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 16:10:27 -0700
IronPort-SDR: qgjKRp68FNQ0FVY4/EriKcNKT16w2S/hOeVlMshtBFLdRM9Ec7q7uIg3JTJnHpGypnLxJOQUkI
 gpAdH1gArtmw==
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; 
   d="scan'208";a="525698073"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 16:10:25 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 72831206D0; Fri, 30 Oct 2020 01:10:23 +0200 (EET)
Date:   Fri, 30 Oct 2020 01:10:23 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1] media: ipu3-cio2: Use macros from mm.h
Message-ID: <20201029231023.GO26150@paasikivi.fi.intel.com>
References: <20201029201657.GE4077@smile.fi.intel.com>
 <20201029220827.GN26150@paasikivi.fi.intel.com>
 <CAHp75VfnFQZhZ1nFPNzgu-fn+yzmUNvwEVkoAk-=GXYvkxEy4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfnFQZhZ1nFPNzgu-fn+yzmUNvwEVkoAk-=GXYvkxEy4w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 30, 2020 at 01:06:30AM +0200, Andy Shevchenko wrote:
> On Fri, Oct 30, 2020 at 12:12 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Thu, Oct 29, 2020 at 10:16:57PM +0200, Andy Shevchenko wrote:
> > > On Wed, Oct 28, 2020 at 04:11:05PM +0800, Bingbu Cao wrote:
> 
> ...
> 
> > > I just realized I can rewrite this as:
> > >
> > >       remaining = offset_in_page(remaining) ?: PAGE_SIZE;
> > >       entry[1].second_entry.last_page_available_bytes = remaining - 1;
> > >
> > > Would it work for you?
> >
> > Looks good to me.
> 
> Have you got v2?

Yes, in fact. I'll check it tomorrow / some time next week.

-- 
Sakari Ailus
