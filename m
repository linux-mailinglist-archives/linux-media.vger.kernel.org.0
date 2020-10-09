Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59CE6287FF4
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 03:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbgJIBUc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 21:20:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49512 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgJIBUc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 21:20:32 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2449059E;
        Fri,  9 Oct 2020 03:20:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602206430;
        bh=aMnWBi+cArULsSCGxNMbr2pYvZGzh2dmUDGUvV4/N7Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QhQt0i+gR9ck0k2xSfoscCh61fD+kRbLwnEwAHUUb11ehly6qORbG6faoR1ur/ttK
         /RjLSX0r8Zr0CSt3heedBTa0zh00aNLRJLO5sWXdd+zwUketqnvVrMnjyz17myUjh8
         /H/SErY7OvIcyU3wvMNbcalcJd/KpX6baFlZbUOU=
Date:   Fri, 9 Oct 2020 04:19:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 09/10] media: ipu3-cio2: Drop useless assignments
Message-ID: <20201009011947.GK12857@pendragon.ideasonboard.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
 <20200817160734.12402-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200817160734.12402-9-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Thank you for the patch.

On Mon, Aug 17, 2020 at 07:07:32PM +0300, Andy Shevchenko wrote:
> There are assignments inside the functions which are useless.
> Drop them for good.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: new patch
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index f5c27c1aa9a2..f3ec2d62cace 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1979,8 +1979,8 @@ static int __maybe_unused cio2_suspend(struct device *dev)
>  static int __maybe_unused cio2_resume(struct device *dev)
>  {
>  	struct cio2_device *cio2 = dev_get_drvdata(dev);
> -	int r = 0;
>  	struct cio2_queue *q = cio2->cur_queue;
> +	int r;
>  
>  	dev_dbg(dev, "cio2 resume\n");
>  	if (!cio2->streaming)
> @@ -2007,7 +2007,7 @@ static const struct dev_pm_ops cio2_pm_ops = {
>  
>  static const struct pci_device_id cio2_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, CIO2_PCI_ID) },
> -	{ 0 }
> +	{ }

This change is good but doesn't really match the commit message. You may
want to update it. With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  };
>  
>  MODULE_DEVICE_TABLE(pci, cio2_pci_id_table);

-- 
Regards,

Laurent Pinchart
