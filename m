Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD772B4BB0
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 17:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731935AbgKPQw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 11:52:29 -0500
Received: from mga04.intel.com ([192.55.52.120]:2870 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731129AbgKPQw3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 11:52:29 -0500
IronPort-SDR: fSujQ1DLdtsIIHN2aWtW373YD3WWodIpzvzJZt+jH9nMWBPNQcedbXrJkMGA5OeOY0SR+X/+up
 xbifG+jJV1Ow==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="168199846"
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; 
   d="scan'208";a="168199846"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 08:52:29 -0800
IronPort-SDR: 3QbMsrJSdm6LxnDeGpsUE8vA7ScIPzNvZzXdmLCzycOkpZThWZpoZ61CRHoprOCywHwR6mnoIF
 a4MkL2iCwQsg==
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; 
   d="scan'208";a="358526126"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 08:52:17 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kehkl-0077I8-7B; Mon, 16 Nov 2020 18:53:19 +0200
Date:   Mon, 16 Nov 2020 18:53:19 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v2] media: ipu3-cio2: Use macros from mm.h
Message-ID: <20201116165319.GF4077@smile.fi.intel.com>
References: <20201028155520.14458-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028155520.14458-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 28, 2020 at 05:55:20PM +0200, Andy Shevchenko wrote:
> There are few nice macros in mm.h, some of which we may use here.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

If there is no further comments, can it be applied?

> ---
> v2: rewrote to make it short and neat (Bingbu), added Rb tag (Bingbu)
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index d4b575813300..3d0c867e9762 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -15,6 +15,7 @@
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
> +#include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/pfn.h>
> @@ -190,9 +191,8 @@ static void cio2_fbpt_entry_init_buf(struct cio2_device *cio2,
>  	 * 4095 (PAGE_SIZE - 1) means every single byte in the last page
>  	 * is available for DMA transfer.
>  	 */
> -	entry[1].second_entry.last_page_available_bytes =
> -			(remaining & ~PAGE_MASK) ?
> -				(remaining & ~PAGE_MASK) - 1 : PAGE_SIZE - 1;
> +	remaining = offset_in_page(remaining) ?: PAGE_SIZE;
> +	entry[1].second_entry.last_page_available_bytes = remaining - 1;
>  	/* Fill FBPT */
>  	remaining = length;
>  	i = 0;
> -- 
> 2.28.0
> 

-- 
With Best Regards,
Andy Shevchenko


