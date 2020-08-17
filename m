Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5109A246557
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 13:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgHQL1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 07:27:52 -0400
Received: from mga09.intel.com ([134.134.136.24]:43818 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbgHQL1w (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 07:27:52 -0400
IronPort-SDR: GnG3LP67pFhXj4EByw3FwOpAqIUEEXZLJkvcxAJrIcUq63n/3O9hqs3/U3WObaJF24KCo0JRuk
 KPFx/IMytDzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="155773461"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="155773461"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 04:27:51 -0700
IronPort-SDR: D3hePcOvjEa5nYIpjBP7KODT6CnJ7j5hQBUa+TOPx4l1AeB5MlKlNnFSe50gNTzAaJvrBXJ0zd
 wKFoYvOYAEpQ==
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="496452178"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 04:27:49 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2241D207BA; Mon, 17 Aug 2020 14:27:47 +0300 (EEST)
Date:   Mon, 17 Aug 2020 14:27:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     joe@perches.com, Bingbu Cao <bingbu.cao@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 6/7] media: ipu3-cio2: Use readl_poll_timeout() helper
Message-ID: <20200817112746.GI24582@paasikivi.fi.intel.com>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
 <20200814163017.35001-6-andriy.shevchenko@linux.intel.com>
 <6b739304-7d12-016f-f42a-089c8fe7efac@linux.intel.com>
 <20200817094436.GF1891694@smile.fi.intel.com>
 <20200817111316.GH24582@paasikivi.fi.intel.com>
 <20200817112006.GH1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817112006.GH1891694@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 17, 2020 at 02:20:06PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 17, 2020 at 02:13:16PM +0300, Sakari Ailus wrote:
> > On Mon, Aug 17, 2020 at 12:44:36PM +0300, Andy Shevchenko wrote:
> > > On Mon, Aug 17, 2020 at 05:27:33PM +0800, Bingbu Cao wrote:
> > > > On 8/15/20 12:30 AM, Andy Shevchenko wrote:
> > > > > We may use special helper macro to poll IO till condition or timeout occurs.
> > > 
> > > > > +	ret = readl_poll_timeout(dma, value, value & CIO2_CDMAC0_DMA_HALTED, 4000, 2000000);
> > > > 
> > > > This line is too long, need a break, others look good for me.
> > > 
> > > checkpatch doesn't complain, but if you insist, I'll split it in v2.
> > 
> > The coding style hasn't changed, it's just the checkpatch.pl warning that
> > has.
> 
> Joe, it seems we have inconsistency now between checkpatch and coding style.
> Shouldn't we revert 100 limit warning to 80?

There are sometimes genuine reasons for having longer lines than 80, and
depending on the code, that happens more often in some places than
elsewhere. This tended to generate lots of checkpatch.pl warnings in the
past.

While I didn't see the patch removing the 80 chars per line limit until it
made the news, I think it was a quite reasonable compromise.

-- 
Sakari Ailus
