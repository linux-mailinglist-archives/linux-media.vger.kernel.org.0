Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3876324635B
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 11:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgHQJ2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 05:28:42 -0400
Received: from mga05.intel.com ([192.55.52.43]:13032 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgHQJ2j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 05:28:39 -0400
IronPort-SDR: IqpBFbIA2SfBti+lDg8vUaK0sFPSwjxPrCQ+W7Vfie8BQ0CNIaPVJQMLS6meECK8aL3xGs2HZx
 HDGdio42nFOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="239487503"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="239487503"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 02:28:39 -0700
IronPort-SDR: 81pAQr87UzT8x/iQfl01SNzgOgSH7Rdp3YUEZ6p/c03QpfzWWIe6TFkrEnCsXa8gy9yJU8FXPI
 NW/+/Qv41q1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="319653266"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 17 Aug 2020 02:28:36 -0700
Subject: Re: [PATCH v1 6/7] media: ipu3-cio2: Use readl_poll_timeout() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
 <20200814163017.35001-6-andriy.shevchenko@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <6b739304-7d12-016f-f42a-089c8fe7efac@linux.intel.com>
Date:   Mon, 17 Aug 2020 17:27:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814163017.35001-6-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/15/20 12:30 AM, Andy Shevchenko wrote:
> We may use special helper macro to poll IO till condition or timeout occurs.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index f4175dc1501a..5f8ff91dbf09 100644
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
> @@ -509,7 +510,10 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
>  static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
>  {
>  	void __iomem *base = cio2->base;
> -	unsigned int i, maxloops = 1000;
> +	void __iomem *dma = base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN);
> +	unsigned int i;
> +	u32 value;
> +	int ret;
>  
>  	/* Disable CSI receiver and MIPI backend devices */
>  	writel(0, q->csi_rx_base + CIO2_REG_IRQCTRL_MASK);
> @@ -518,14 +522,9 @@ static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
>  	writel(0, q->csi_rx_base + CIO2_REG_MIPIBE_ENABLE);
>  
>  	/* Halt DMA */
> -	writel(0, base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN));
> -	do {
> -		if (readl(base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN)) &
> -		    CIO2_CDMAC0_DMA_HALTED)
> -			break;
> -		usleep_range(1000, 2000);
> -	} while (--maxloops);
> -	if (!maxloops)
> +	writel(0, dma);
> +	ret = readl_poll_timeout(dma, value, value & CIO2_CDMAC0_DMA_HALTED, 4000, 2000000);

This line is too long, need a break, others look good for me.

> +	if (ret)
>  		dev_err(&cio2->pci_dev->dev,
>  			"DMA %i can not be halted\n", CIO2_DMA_CHAN);
>  
> 

-- 
Best regards,
Bingbu Cao
