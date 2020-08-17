Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 785F324653C
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 13:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgHQLUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 07:20:11 -0400
Received: from mga09.intel.com ([134.134.136.24]:43186 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbgHQLUK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 07:20:10 -0400
IronPort-SDR: xVoK/ygnBoXq0evzEoHwms4UASbniJ4rNHCpMoJXSLM5SCAEYgmlT8qHR56fEZKa3YcKNZdA7J
 Bt+WF7DrVmQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="155772538"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="155772538"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 04:20:09 -0700
IronPort-SDR: qC/IeaFTNbgENxKtAcr6vgy1Oin2GXMFcOdDAPfgWPEDMz4rLX9o0B2CvlLir+Bb2zSQ7CxTPC
 i0YN9HSFSlzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="326380852"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 04:20:07 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k7dBO-009IiG-2g; Mon, 17 Aug 2020 14:20:06 +0300
Date:   Mon, 17 Aug 2020 14:20:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>, joe@perches.com
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 6/7] media: ipu3-cio2: Use readl_poll_timeout() helper
Message-ID: <20200817112006.GH1891694@smile.fi.intel.com>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
 <20200814163017.35001-6-andriy.shevchenko@linux.intel.com>
 <6b739304-7d12-016f-f42a-089c8fe7efac@linux.intel.com>
 <20200817094436.GF1891694@smile.fi.intel.com>
 <20200817111316.GH24582@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817111316.GH24582@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 17, 2020 at 02:13:16PM +0300, Sakari Ailus wrote:
> On Mon, Aug 17, 2020 at 12:44:36PM +0300, Andy Shevchenko wrote:
> > On Mon, Aug 17, 2020 at 05:27:33PM +0800, Bingbu Cao wrote:
> > > On 8/15/20 12:30 AM, Andy Shevchenko wrote:
> > > > We may use special helper macro to poll IO till condition or timeout occurs.
> > 
> > > > +	ret = readl_poll_timeout(dma, value, value & CIO2_CDMAC0_DMA_HALTED, 4000, 2000000);
> > > 
> > > This line is too long, need a break, others look good for me.
> > 
> > checkpatch doesn't complain, but if you insist, I'll split it in v2.
> 
> The coding style hasn't changed, it's just the checkpatch.pl warning that
> has.

Joe, it seems we have inconsistency now between checkpatch and coding style.
Shouldn't we revert 100 limit warning to 80?

-- 
With Best Regards,
Andy Shevchenko


