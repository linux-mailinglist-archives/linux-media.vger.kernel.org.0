Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 427E82937C5
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392659AbgJTJOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:14:51 -0400
Received: from mga06.intel.com ([134.134.136.31]:52767 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391117AbgJTJOt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:14:49 -0400
IronPort-SDR: C6eGypWbK6xgbsGayN6UKPAzlxU8Z/arr3FdgVLxP7NYFjN8Q89AeQ7MNnXdeu2pHB9SpfuSlM
 R/cOFTlfPE0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="228811505"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="228811505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:14:48 -0700
IronPort-SDR: qPdlouPryKkDiR922w0/B9UaKmKKnlTVqxQcWD3N9f51nTdhfUZ33MPchW6gcYD1DCRkUzxIqg
 WF9eeVSquwpQ==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="320583511"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:14:42 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUnk8-00BJku-90; Tue, 20 Oct 2020 12:15:44 +0300
Date:   Tue, 20 Oct 2020 12:15:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com, dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 6/9] ipu3-cio2: Rename ipu3-cio2.c to allow module
 to be built from multiple sources files retaining ipu3-cio2 name
Message-ID: <20201020091544.GZ4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-7-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-7-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 19, 2020 at 11:59:00PM +0100, Daniel Scally wrote:
> ipu3-cio2 driver needs extending with multiple files; rename the main
> source file and specify the renamed file in Makefile to accommodate that.

Suggested-by?

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
after addressing below comment.

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v3:
> 	- patch introduced
> 
>  drivers/media/pci/intel/ipu3/Makefile                          | 2 ++
>  drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} | 0
>  2 files changed, 2 insertions(+)
>  rename drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} (100%)
> 
> diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
> index 98ddd5bea..b4e3266d9 100644
> --- a/drivers/media/pci/intel/ipu3/Makefile
> +++ b/drivers/media/pci/intel/ipu3/Makefile
> @@ -1,2 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
> +
> +ipu3-cio2-y += ipu3-cio2-main.o
> \ No newline at end of file

Don't forget to add \n at the end of above line.

> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> similarity index 100%
> rename from drivers/media/pci/intel/ipu3/ipu3-cio2.c
> rename to drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


