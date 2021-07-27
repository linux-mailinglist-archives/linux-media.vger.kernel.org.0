Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43273D7469
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 13:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236502AbhG0Lfg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 07:35:36 -0400
Received: from mga14.intel.com ([192.55.52.115]:48450 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231781AbhG0Lff (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 07:35:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="212145008"
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; 
   d="scan'208";a="212145008"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2021 04:35:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; 
   d="scan'208";a="498453641"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2021 04:35:17 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1m8LMc-0016dX-Fd; Tue, 27 Jul 2021 14:35:10 +0300
Date:   Tue, 27 Jul 2021 14:35:10 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v1 1/1] media: ipu3-cio2: Drop reference on error path in
 cio2_bridge_connect_sensor()
Message-ID: <YP/vbsXlsT8DOOy3@smile.fi.intel.com>
References: <20210726084055.54887-1-andriy.shevchenko@linux.intel.com>
 <20210726114433.GB3@paasikivi.fi.intel.com>
 <CAHp75VfodVoyDkO4iEGcHw0TWm2g-QbjwXqoCpCr_fj_BXT9jw@mail.gmail.com>
 <20210726120335.GE3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726120335.GE3@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 26, 2021 at 03:03:35PM +0300, Sakari Ailus wrote:
> On Mon, Jul 26, 2021 at 02:55:51PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 26, 2021 at 2:47 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > > On Mon, Jul 26, 2021 at 11:40:55AM +0300, Andy Shevchenko wrote:
> > 
> > ...
> > 
> > > >  err_free_swnodes:
> > > >       software_node_unregister_nodes(sensor->swnodes);
> > > >  err_put_adev:
> > > > -     acpi_dev_put(sensor->adev);
> > > > +     acpi_dev_put(adev);
> > >
> > > adev is assigned to sensor->adev before goto so the two have the same
> > > value. I have no problem with the patch though.
> > 
> > Are we reading the same version? Or am I missing something?
> 
> Ah. I noticed the adev assignment was removed (and added later) by the
> other patch. Yeah, agreed; this one's needed.

Thanks! Can we have your tag?

-- 
With Best Regards,
Andy Shevchenko


