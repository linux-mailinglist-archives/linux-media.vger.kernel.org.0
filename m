Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33F9B28B180
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 11:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387413AbgJLJ1e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 05:27:34 -0400
Received: from mga05.intel.com ([192.55.52.43]:31919 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387407AbgJLJ1d (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 05:27:33 -0400
IronPort-SDR: 6Ij8HZePASeh2Sd3TvbDRQXHKspak4nqwAzexZv7WcnzrwYtC5tiFNSsD1Qd2bzNNudTNnK35j
 CASVxsFynG/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="250406669"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; 
   d="scan'208";a="250406669"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 02:26:38 -0700
IronPort-SDR: 5/6m0COGdnwRBxJX5qMiWJ5JibcIBuFjGOyTjFxVvnSUpFRkPUI4VaBidFPzE5pPXkbwa1ykF8
 1/nzzSTzoB3w==
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; 
   d="scan'208";a="299232842"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 02:26:36 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 55A7A20878; Mon, 12 Oct 2020 12:26:34 +0300 (EEST)
Date:   Mon, 12 Oct 2020 12:26:34 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 4/5] ipu3-cio2: Validate mbus format in setting subdev
 format
Message-ID: <20201012092634.GW26842@paasikivi.fi.intel.com>
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
 <20201009150756.3397-5-sakari.ailus@linux.intel.com>
 <CAHp75Vf=KCMTysgCYt2xeF4x-bfM4Zpy_thLPnysuN+QBMkc2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf=KCMTysgCYt2xeF4x-bfM4Zpy_thLPnysuN+QBMkc2w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 09, 2020 at 07:22:38PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 9, 2020 at 6:10 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Validate media bus code, width and height when setting the subdev format.
> >
> > This effectively reworks how setting subdev format is implemented in the
> > driver.
> 
> Does it make it dependent on patch 3/5?

Good question. They're in the same set but these probably should be
backported. If fact, I think I should add Cc: stable to most of these
patches.

> Or maybe you can use min_t() and update to min() in a separate patch?

I would have said that's overkill but considering the stable tree it's not.
I'll do that for v3.

Thanks for the review!

-- 
Sakari Ailus
