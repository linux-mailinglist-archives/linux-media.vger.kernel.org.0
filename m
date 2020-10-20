Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE2C42937C6
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392667AbgJTJPI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:15:08 -0400
Received: from mga07.intel.com ([134.134.136.100]:56368 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729236AbgJTJPI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:15:08 -0400
IronPort-SDR: 4gihgWXSfwuKV/Zh7DhB8R8jWHybauFboGu5jUfYkuPcdTSmuegun5icNpE72JigTTnSkKoMyC
 +LX/SxBINItQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="231374372"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="231374372"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:15:07 -0700
IronPort-SDR: /c3E6NdoTaJrHjkh79cOigm6bwnFa1NVNGlAl7lw4JTKoFG7OCv9176q8JUd8k8fLoWPykGmgf
 PNTnoeKsYm/w==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="392310309"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:15:01 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUnkQ-00BJlP-PI; Tue, 20 Oct 2020 12:16:02 +0300
Date:   Tue, 20 Oct 2020 12:16:02 +0300
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
Subject: Re: [RFC PATCH v3 5/9] ipu3-cio2: Add T: entry to MAINTAINERS
Message-ID: <20201020091602.GA4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-6-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-6-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 19, 2020 at 11:58:59PM +0100, Daniel Scally wrote:
> Development for the ipu3-cio2 driver is taking place in media_tree, but
> there's no T: entry in MAINTAINERS to denote that - rectify that oversight

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v3:
> 	- patch introduced.
> 	
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 43a025039..5d768d5ad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8851,6 +8851,7 @@ M:	Bingbu Cao <bingbu.cao@intel.com>
>  R:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
>  F:	drivers/media/pci/intel/ipu3/
>  
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


