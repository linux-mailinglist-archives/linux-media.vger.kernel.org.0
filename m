Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3EB24643C
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 12:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgHQKR2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 06:17:28 -0400
Received: from mga04.intel.com ([192.55.52.120]:33940 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgHQKR1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 06:17:27 -0400
IronPort-SDR: FySa7dAlmE2NcsMbQ6GaOHg+L7B3GtOogbnK3J8CfTaRZwV7HvMiuUL9MmmRScezwQbGGj/2DQ
 VsunIg4ey90g==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="152075591"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="152075591"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 03:17:26 -0700
IronPort-SDR: ETaTozTXbyvP4M1kZirBs7O6X035KZoNu83itkq/vXWiZt/LNdmlY1zLX8pImFhd2Y4rYwSYZs
 83pDgOZj5ktA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="326368878"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 03:17:22 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k7bgy-009HUC-Nf; Mon, 17 Aug 2020 12:44:36 +0300
Date:   Mon, 17 Aug 2020 12:44:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 6/7] media: ipu3-cio2: Use readl_poll_timeout() helper
Message-ID: <20200817094436.GF1891694@smile.fi.intel.com>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
 <20200814163017.35001-6-andriy.shevchenko@linux.intel.com>
 <6b739304-7d12-016f-f42a-089c8fe7efac@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b739304-7d12-016f-f42a-089c8fe7efac@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 17, 2020 at 05:27:33PM +0800, Bingbu Cao wrote:
> On 8/15/20 12:30 AM, Andy Shevchenko wrote:
> > We may use special helper macro to poll IO till condition or timeout occurs.

> > +	ret = readl_poll_timeout(dma, value, value & CIO2_CDMAC0_DMA_HALTED, 4000, 2000000);
> 
> This line is too long, need a break, others look good for me.

checkpatch doesn't complain, but if you insist, I'll split it in v2.

-- 
With Best Regards,
Andy Shevchenko


