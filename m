Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A071A2EAD74
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 15:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbhAEOi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 09:38:26 -0500
Received: from mga01.intel.com ([192.55.52.88]:57659 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbhAEOi0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Jan 2021 09:38:26 -0500
IronPort-SDR: ghmvNdBy06irSH4WRRKRKdARjwmcLXbz38TcyvfglAPXacga9zETnXxYSsCtBS87ghbgrCGcUd
 J0ynkg3eLc9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="195646289"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="195646289"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 06:36:41 -0800
IronPort-SDR: qs68RqcxE++HLA1JoCBuYLhRaVpiDBCQ1s4MR2iSPmAdQVkVQPeXRAMKZw6AuSGJ+E7VZKqoWy
 QYk627pVAIMQ==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="402345974"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 06:36:39 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kwnSv-002Ctb-Bx; Tue, 05 Jan 2021 16:37:41 +0200
Date:   Tue, 5 Jan 2021 16:37:41 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        royale@zerezo.com, USB <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
Subject: Re: [RFT][PATCH v1] media: zr364xx: Fix memory leak in ->probe()
Message-ID: <20210105143741.GK4077@smile.fi.intel.com>
References: <20201230211918.63508-1-andriy.shevchenko@linux.intel.com>
 <20210105140045.GF2809@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105140045.GF2809@kadam>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 05, 2021 at 05:00:45PM +0300, Dan Carpenter wrote:
> On Wed, Dec 30, 2020 at 11:19:18PM +0200, Andy Shevchenko wrote:
> > When ->probe() fails in some cases it may not free resources.
> > Replace few separated calls by v4l2_device_put() to clean up
> > everything.
> > 
> 
> The clean up everything style of error handling is always buggy.
> 
> For example, in this case, all the early error paths will now crash
> instead of leaking.  The __videobuf_free() function will Oops when it
> dereferences "q->int_ops->magic".
> 
> 	MAGIC_CHECK(q->int_ops->magic, MAGIC_QTYPE_OPS);
> 
> The "q->int_ops" pointer is set in videobuf_queue_vmalloc_init().  There
> are probably other bugs as well.  It's almost impossible to audit this
> style of error handling either for completeness or for crashyness.

Feel free to submit better fix, thanks!

-- 
With Best Regards,
Andy Shevchenko


