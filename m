Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 151F4287FE8
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 03:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgJIBPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 21:15:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49452 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgJIBPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 21:15:41 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6A1859E;
        Fri,  9 Oct 2020 03:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602206138;
        bh=cpZQI+5ODw4/NVl9cEzjip9h3cv0l4UC0TrfHjVMUI8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nVUWEL0yE9CE4VIXSTItYDOk0Luhzey/BG5RKMmqdBVqJe+JIIUOhgkUdEHEveko2
         8iKklKmPyCrnGjCdB5sNONs3A63crIhdcjT0xye8o2PHCqGPk6qArJpH/U7Hb9Q6VF
         ljFMrltKQ/nM+AkFju/LswwECeAUvwG/tX5yHKE8=
Date:   Fri, 9 Oct 2020 04:14:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 06/10] media: ipu3-cio2: Use readl_poll_timeout()
 helper
Message-ID: <20201009011455.GH12857@pendragon.ideasonboard.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
 <20200817160734.12402-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200817160734.12402-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Thank you for the patch.

On Mon, Aug 17, 2020 at 07:07:29PM +0300, Andy Shevchenko wrote:
> We may use special helper macro to poll IO till condition or timeout occurs.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: wrapped long line (Bingbu)
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 36b4c7730f43..7bcde3ba8f6e 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -14,6 +14,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/pfn.h>
> @@ -507,8 +508,10 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
>  
>  static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
>  {
> -	void __iomem *base = cio2->base;
> -	unsigned int i, maxloops = 1000;
> +	void __iomem *const base = cio2->base;
> +	unsigned int i;
> +	u32 value;
> +	int ret;
>  
>  	/* Disable CSI receiver and MIPI backend devices */
>  	writel(0, q->csi_rx_base + CIO2_REG_IRQCTRL_MASK);
> @@ -518,13 +521,10 @@ static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
>  
>  	/* Halt DMA */
>  	writel(0, base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN));
> -	do {
> -		if (readl(base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN)) &
> -		    CIO2_CDMAC0_DMA_HALTED)
> -			break;
> -		usleep_range(1000, 2000);
> -	} while (--maxloops);
> -	if (!maxloops)
> +	ret = readl_poll_timeout(base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN),
> +				 value, value & CIO2_CDMAC0_DMA_HALTED,
> +				 4000, 2000000);

I had to read the implementation of readl_poll_timeout() to see why you
turned [1000, 2000] to 4000. This effectively becomes [1000, 4000] which
should be fine.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	if (ret)
>  		dev_err(&cio2->pci_dev->dev,
>  			"DMA %i can not be halted\n", CIO2_DMA_CHAN);
>  
> 

-- 
Regards,

Laurent Pinchart
