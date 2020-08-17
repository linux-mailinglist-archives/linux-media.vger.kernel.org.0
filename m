Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A972465A2
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 13:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgHQLqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 07:46:51 -0400
Received: from mga06.intel.com ([134.134.136.31]:59985 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726161AbgHQLqu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 07:46:50 -0400
IronPort-SDR: uWqYa/P4N8A7AU/leMuERQ4WWj4kn6guqeWa3DUHBIsWoZrwCpWrtr+L/rL1dUAqrFWZCqo3uB
 7dQbTti7JPdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="216206405"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="216206405"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 04:46:49 -0700
IronPort-SDR: K+Oc+91E2ZeePE9J1ndbroTP9bEJfaksSslPqgcV7GoshKPCnAk8oMXmcOv8lpDX1vHn2AYcxR
 j+s5fdXr90cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="326385621"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 04:46:47 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k7dbC-009Iyn-Gx; Mon, 17 Aug 2020 14:46:46 +0300
Date:   Mon, 17 Aug 2020 14:46:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 2/7] media: ipu3-cio2: Introduce CIO2_MAX_ENTRIES
 constant
Message-ID: <20200817114646.GL1891694@smile.fi.intel.com>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
 <20200814163017.35001-2-andriy.shevchenko@linux.intel.com>
 <20200814201836.GF24582@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814201836.GF24582@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 14, 2020 at 11:18:36PM +0300, Sakari Ailus wrote:
> On Fri, Aug 14, 2020 at 07:30:12PM +0300, Andy Shevchenko wrote:
> > This constant is used in several places in the code, define it
> > for better maintenance.

...

> > +#define CIO2_MAX_ENTRIES			(PAGE_SIZE / sizeof(u32))
> 
> How about calling this CIO2_ENTRIES_PER_LOP (or CIO2_LOP_ENTRIES) instead?

Sure. (I like the latter).

-- 
With Best Regards,
Andy Shevchenko


