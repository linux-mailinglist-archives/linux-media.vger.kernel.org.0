Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84EDE246534
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 13:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgHQLNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 07:13:24 -0400
Received: from mga14.intel.com ([192.55.52.115]:9503 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726944AbgHQLNX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 07:13:23 -0400
IronPort-SDR: xbfzc01JdwjEIZIfIWgI+QrzwTOjds0wWjxB8j1IRygilWbiURvGj5cy6KIU/Rdq4xatiA63mn
 ofkA4pscmaVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="153930105"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="153930105"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 04:13:20 -0700
IronPort-SDR: PPsrPyCra44ubFisXJzEDs3krKBNpsCZas5KV/xZR0fUJZ1qSCcEIdLEzHFy6wIMmoEJFJeTN5
 OThLjnOi6t2w==
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="496449023"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 04:13:18 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 7F050207BA; Mon, 17 Aug 2020 14:13:16 +0300 (EEST)
Date:   Mon, 17 Aug 2020 14:13:16 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 6/7] media: ipu3-cio2: Use readl_poll_timeout() helper
Message-ID: <20200817111316.GH24582@paasikivi.fi.intel.com>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
 <20200814163017.35001-6-andriy.shevchenko@linux.intel.com>
 <6b739304-7d12-016f-f42a-089c8fe7efac@linux.intel.com>
 <20200817094436.GF1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817094436.GF1891694@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 17, 2020 at 12:44:36PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 17, 2020 at 05:27:33PM +0800, Bingbu Cao wrote:
> > On 8/15/20 12:30 AM, Andy Shevchenko wrote:
> > > We may use special helper macro to poll IO till condition or timeout occurs.
> 
> > > +	ret = readl_poll_timeout(dma, value, value & CIO2_CDMAC0_DMA_HALTED, 4000, 2000000);
> > 
> > This line is too long, need a break, others look good for me.
> 
> checkpatch doesn't complain, but if you insist, I'll split it in v2.

The coding style hasn't changed, it's just the checkpatch.pl warning that
has.

-- 
Sakari Ailus
