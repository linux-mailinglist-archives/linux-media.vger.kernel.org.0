Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89163287FCC
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 03:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729251AbgJIBKM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 21:10:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49428 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbgJIBKM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 21:10:12 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5103859E;
        Fri,  9 Oct 2020 03:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602205810;
        bh=p0hHHIx6qzlcSyG770MajdHIEcnIzA5/NG25FjGQPHE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XWEF1qn60p0xH3W3Ocwk8JB4T7AVHzuokxhHC7MKwxpl/XUvLrchszAEgJb+F8Kl0
         8JsB3jh2UCpQFdFNIjT/RzdBFPLFT1FRn+o/zba3FEvQL4obXkNv86sqexsX95MC9x
         Z4mAv6Qvy6lEgCrH45opUYomDmx9LCAY/nJgZbAU=
Date:   Fri, 9 Oct 2020 04:09:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 07/10] media: ipu3-cio2: Get rid of pci_set_master()
 duplication
Message-ID: <20201009010927.GG12857@pendragon.ideasonboard.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
 <20200817160734.12402-7-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200817160734.12402-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Thank you for the patch.

On Mon, Aug 17, 2020 at 07:07:30PM +0300, Andy Shevchenko wrote:
> It's unclear why driver repeats the code from PCI core.
> Drop it for good.

You may want to mention that pci_set_master() is already called by the
cio2_pci_probe().

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: new patch
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 26 +++++-------------------
>  1 file changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 7bcde3ba8f6e..57310d7874ce 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1711,24 +1711,6 @@ static void cio2_queues_exit(struct cio2_device *cio2)
>  
>  /**************** PCI interface ****************/
>  
> -static int cio2_pci_config_setup(struct pci_dev *dev)
> -{
> -	u16 pci_command;
> -	int r = pci_enable_msi(dev);
> -
> -	if (r) {
> -		dev_err(&dev->dev, "failed to enable MSI (%d)\n", r);
> -		return r;
> -	}
> -
> -	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
> -	pci_command |= PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER |
> -		PCI_COMMAND_INTX_DISABLE;
> -	pci_write_config_word(dev, PCI_COMMAND, pci_command);
> -
> -	return 0;
> -}
> -
>  static int cio2_pci_probe(struct pci_dev *pci_dev,
>  			  const struct pci_device_id *id)
>  {
> @@ -1774,9 +1756,11 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  		return -ENODEV;
>  	}
>  
> -	r = cio2_pci_config_setup(pci_dev);
> -	if (r)
> -		return -ENODEV;
> +	r = pci_enable_msi(pci_dev);
> +	if (r) {
> +		dev_err(&pci_dev->dev, "failed to enable MSI (%d)\n", r);
> +		return r;
> +	}
>  
>  	r = cio2_fbpt_init_dummy(cio2);
>  	if (r)

-- 
Regards,

Laurent Pinchart
