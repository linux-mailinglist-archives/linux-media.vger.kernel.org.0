Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1A8C246881
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 16:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgHQOho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 10:37:44 -0400
Received: from mga04.intel.com ([192.55.52.120]:59384 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728666AbgHQOho (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 10:37:44 -0400
IronPort-SDR: qqXprItlvonDg5+IvLw6J2CfDBuT0br0GElKNCXvK7H39U/0Ymp8NfX51/IjIqeU6E0eCrCUv7
 UmZCR9ybnMdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="152119460"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="152119460"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 07:37:43 -0700
IronPort-SDR: cmvSTLOHC3fYZJAlJFh6w4ZEJYNJj7pfYQ/L7mK8O0em75mL6N7EnqvuIqN+fKwl88ln2VpqdO
 j3gXfeUJjyUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="326427608"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 07:37:41 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k7gGa-009S27-4w; Mon, 17 Aug 2020 17:37:40 +0300
Date:   Mon, 17 Aug 2020 17:37:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/7] media: ipu3-cio2: Simplify cleanup code
Message-ID: <20200817143740.GR1891694@smile.fi.intel.com>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
 <20200814201617.GE24582@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814201617.GE24582@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 14, 2020 at 11:16:17PM +0300, Sakari Ailus wrote:
> On Fri, Aug 14, 2020 at 07:30:11PM +0300, Andy Shevchenko wrote:
> > The code looks more nicer if we use:
> > 	while (i--)
> > instead:
> > 	for (i = i - 1; i >= 0; i--)

...

> > -	for (i--; i >= 0; i--)
> > +	while (i--)
> 
> Nice! This would also allow making i unsigned again.

Yes. I will add this to v2.

-- 
With Best Regards,
Andy Shevchenko


