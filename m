Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5840A4116C4
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 16:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233732AbhITOY4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 10:24:56 -0400
Received: from mga04.intel.com ([192.55.52.120]:53219 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230089AbhITOYz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 10:24:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="221256296"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="221256296"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 07:23:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="473636452"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 07:23:18 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 6080F20397; Mon, 20 Sep 2021 17:23:16 +0300 (EEST)
Date:   Mon, 20 Sep 2021 17:23:16 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: select V4L2_ASYNC where needed
Message-ID: <YUiZVCMHaAf4Biiv@paasikivi.fi.intel.com>
References: <20210920095830.1259051-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920095830.1259051-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Anrd,

On Mon, Sep 20, 2021 at 11:58:24AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I came across a link failure from randconfig builds:
> 
> x86_64-linux-ld: drivers/media/i2c/ths8200.o: in function `ths8200_remove':
> ths8200.c:(.text+0x491): undefined reference to `v4l2_async_unregister_subdev'
> x86_64-linux-ld: drivers/media/i2c/ths8200.o: in function `ths8200_probe':
> ths8200.c:(.text+0xe49): undefined reference to `v4l2_async_register_subdev'
> x86_64-linux-ld: drivers/media/i2c/tw9910.o: in function `tw9910_remove':
> tw9910.c:(.text+0x467): undefined reference to `v4l2_async_unregister_subdev'
> x86_64-linux-ld: drivers/media/i2c/tw9910.o: in function `tw9910_probe':
> tw9910.c:(.text+0x1123): undefined reference to `v4l2_async_register_subdev'
> 
> These clearly lack a 'select' statement, but I don't know why
> this started happening only now. I had a bit of a look around to find
> other configs that have the same problem, but could not come up with
> a reliable way and found nothing else through experimentation.
> It is likely that other symbols like these exist that need an extra
> select.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Probably this one:

commit ff3cc65cadb5d7333fde557b38cbb60b3a6cf496
Author: Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Fri Mar 5 18:38:39 2021 +0100

    media: v4l: async, fwnode: Improve module organisation
    
    The V4L2 async framework is generally used with the V4L2 fwnode, which
    also depends on the former. There are a few exceptions but they are
    relatively few.
    
    At the same time there is a vast number of systems that need videodev
    module, but have no use for v4l2-async that's now part of videodev.
    
    In order to improve, split the v4l2-async into its own module. Selecting
    V4L2_FWNODE also selects V4L2_ASYNC.
    
    This also moves the initialisation of the debufs entries for async subdevs
    to loading of the v4l2-async module. The directory is named as
    "v4l2-async".
    
    Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
    Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I think I must have missed some drivers using v4l2-async.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
