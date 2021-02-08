Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4486F313516
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 15:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbhBHOYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 09:24:24 -0500
Received: from mga03.intel.com ([134.134.136.65]:25368 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232637AbhBHOV2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 09:21:28 -0500
IronPort-SDR: klcfEWlihUQweQjWMUZM8zlcXBvFmbWgBpe1spShqYdPROywA8iQD76SB3p+XTn99OlYPs59eT
 3lMLHGGwK68w==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="181785116"
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; 
   d="scan'208";a="181785116"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 06:19:31 -0800
IronPort-SDR: bi1ozTMDnQrILKvcf1IPWkZgPjUPqCkm9tP4W/BSK1mAqsuBpH9N2OqRi37p+vnL0XJaX9uoCh
 mNWRFxjXPyvg==
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; 
   d="scan'208";a="435646255"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 06:19:30 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l97Nv-002xW8-Hd; Mon, 08 Feb 2021 16:19:27 +0200
Date:   Mon, 8 Feb 2021 16:19:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] media: atomisp: Remove unused header
Message-ID: <YCFIbwXv8+SDnZwO@smile.fi.intel.com>
References: <20210122123303.41190-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122123303.41190-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 22, 2021 at 02:33:03PM +0200, Andy Shevchenko wrote:
> sfi.h is not anyhow used by the driver. Remove it.

Mario, Sakari, any comments on this?
Can you give your Ack to get this thru another tree?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/staging/media/atomisp/include/linux/atomisp_platform.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> index 5a5121d958ed..8c65733e0255 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> @@ -22,7 +22,6 @@
>  #include <asm/processor.h>
>  
>  #include <linux/i2c.h>
> -#include <linux/sfi.h>
>  #include <media/v4l2-subdev.h>
>  #include "atomisp.h"
>  
> -- 
> 2.29.2
> 

-- 
With Best Regards,
Andy Shevchenko


