Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB42F2FA674
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 17:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406122AbhARQkD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 11:40:03 -0500
Received: from mga07.intel.com ([134.134.136.100]:24585 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405707AbhARQjB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 11:39:01 -0500
IronPort-SDR: TtJC5Y8AUz/8qc1j4h2zRtKfSD39F6bL7mb7B1DPtq+fquBhHRYWUU9+fAJ+1j6i77KFbkDwf3
 7LtlGExWXfUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="242894252"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="242894252"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 08:37:02 -0800
IronPort-SDR: /1q7VBu3PmCUuae3E2pTh+5o9jA7x+FLUtCblDOKWwObNQhXs9ryKKxFd7ak3F0sK9hR6u2GB8
 IYWFbDEATvjA==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="569234468"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 08:37:00 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 6E8BB208D7; Mon, 18 Jan 2021 18:36:57 +0200 (EET)
Date:   Mon, 18 Jan 2021 18:36:57 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH v2 1/6] media: mach-pxa: Register the camera sensor
 fixed-rate clock
Message-ID: <20210118163657.GZ11878@paasikivi.fi.intel.com>
References: <20210112194919.50176-1-ezequiel@collabora.com>
 <20210112194919.50176-2-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210112194919.50176-2-ezequiel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thanks for the patch.

On Tue, Jan 12, 2021 at 04:49:14PM -0300, Ezequiel Garcia wrote:
> The pxa-camera capture driver currently registers a v4l2-clk
> clock, named "mclk", to represent the mt9m111 sensor clock.
> 
> Register a proper fixed-rate clock using the generic clock framework,
> which will allow to remove the v4l2-clk clock in the pxa-camera
> driver in a follow-up commit.

Where is the clock generated?

If it's the same device, shouldn't it be registered in the pxa_camera
driver?

> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de> (for arch/arm/mach-*/)
> ---
> Quoting Arnd:
> """
> If there are no objections to the change itself, please take it through
> the v4l2 git tree.
> """
> 
>  arch/arm/mach-pxa/devices.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
> index 524d6093e0c7..09b8495f3fd9 100644
> --- a/arch/arm/mach-pxa/devices.c
> +++ b/arch/arm/mach-pxa/devices.c
> @@ -4,6 +4,7 @@
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
>  #include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  #include <linux/spi/pxa2xx_spi.h>
> @@ -634,6 +635,13 @@ static struct platform_device pxa27x_device_camera = {
>  
>  void __init pxa_set_camera_info(struct pxacamera_platform_data *info)
>  {
> +	struct clk *mclk;
> +
> +	/* Register a fixed-rate clock for camera sensors. */
> +	mclk = clk_register_fixed_rate(NULL, "pxa_camera_clk", NULL, 0,
> +					     info->mclk_10khz * 10000);
> +	if (!IS_ERR(mclk))
> +		clkdev_create(mclk, "mclk", NULL);
>  	pxa_register_device(&pxa27x_device_camera, info);
>  }
>  

-- 
Kind regards,

Sakari Ailus
