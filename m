Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9E52937E0
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392690AbgJTJTh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:19:37 -0400
Received: from mga01.intel.com ([192.55.52.88]:37770 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391238AbgJTJTg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:19:36 -0400
IronPort-SDR: C3pWNGRvUuDpZZg/5T5Tm5I4Ix4p62xCUKwf+gP4yr3sztTaja13o2wqg8oidTjNxDLkGG77YY
 bBzaD+fO1w+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="184806176"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="184806176"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:19:35 -0700
IronPort-SDR: MBMaReXSxVI2+i/+rV6T1h29ulVH47nCz0OBwZqMIg8CsWZcsQrZlv94cV5/8CnQshTDJuYTj/
 Bte/ehOOiJvA==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="315968920"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:19:30 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUnol-00BJvE-Ng; Tue, 20 Oct 2020 12:20:31 +0300
Date:   Tue, 20 Oct 2020 12:20:31 +0300
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
Subject: Re: [RFC PATCH v3 2/9] lib/test_printf.c: Use helper function to
 unwind array of software_nodes
Message-ID: <20201020092031.GD4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-3-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-3-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 19, 2020 at 11:58:56PM +0100, Daniel Scally wrote:
> Use the new software_node_unregister_nodes_reverse() function to
> unwind this array in a cleaner way.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v3:
> 	- patch introduced.
> 
>  lib/test_printf.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/lib/test_printf.c b/lib/test_printf.c
> index 7ac87f18a..c63365570 100644
> --- a/lib/test_printf.c
> +++ b/lib/test_printf.c
> @@ -644,9 +644,7 @@ static void __init fwnode_pointer(void)
>  	test(second_name, "%pfwP", software_node_fwnode(&softnodes[1]));
>  	test(third_name, "%pfwP", software_node_fwnode(&softnodes[2]));
>  
> -	software_node_unregister(&softnodes[2]);
> -	software_node_unregister(&softnodes[1]);
> -	software_node_unregister(&softnodes[0]);
> +	software_node_unregister_nodes_reverse(softnodes);
>  }
>  
>  static void __init
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


