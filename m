Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A0E3D5910
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 14:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233780AbhGZLVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 07:21:00 -0400
Received: from mga09.intel.com ([134.134.136.24]:63587 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233903AbhGZLU6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 07:20:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="212210527"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="212210527"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 05:01:26 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="463916102"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 05:01:23 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 7FF4B205CF;
        Mon, 26 Jul 2021 15:01:21 +0300 (EEST)
Date:   Mon, 26 Jul 2021 15:01:21 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v1 1/1] media: ipu3-cio2: Drop reference on error path in
 cio2_bridge_connect_sensor()
Message-ID: <20210726120121.GD3@paasikivi.fi.intel.com>
References: <20210726084055.54887-1-andriy.shevchenko@linux.intel.com>
 <20210726114433.GB3@paasikivi.fi.intel.com>
 <CAHp75VfodVoyDkO4iEGcHw0TWm2g-QbjwXqoCpCr_fj_BXT9jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfodVoyDkO4iEGcHw0TWm2g-QbjwXqoCpCr_fj_BXT9jw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 26, 2021 at 02:55:51PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 26, 2021 at 2:47 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Mon, Jul 26, 2021 at 11:40:55AM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > >  err_free_swnodes:
> > >       software_node_unregister_nodes(sensor->swnodes);
> > >  err_put_adev:
> > > -     acpi_dev_put(sensor->adev);
> > > +     acpi_dev_put(adev);
> >
> > adev is assigned to sensor->adev before goto so the two have the same
> > value. I have no problem with the patch though.
> 
> Are we reading the same version? Or am I missing something?

I'm looking at the one in media-tree master.

-- 
Sakari Ailus
