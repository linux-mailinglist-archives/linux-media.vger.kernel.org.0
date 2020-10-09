Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D61287FF0
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 03:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgJIBTK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 21:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgJIBTK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 21:19:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29C7C0613D2
        for <linux-media@vger.kernel.org>; Thu,  8 Oct 2020 18:19:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50F0959E;
        Fri,  9 Oct 2020 03:19:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602206348;
        bh=iVe+QLpm4TeurCHcZt5bU8wwMLU14ksJjsscS+xiOKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qcgRT6C2lrdCgiBAH8xziMIUOLZetN5zUUg8xihfazDufWjQ8l/jpMTZw5LNMNq9t
         lC/3LqaXgZK6y5qzEtHFk/D42BP46E0v6Rki+nQP45NIuLaMMGuF3BVnYdjpCDMeBH
         RkvYS11zaCwxxABZDQHSMgixrocHb2+LbR9dH2tQ=
Date:   Fri, 9 Oct 2020 04:18:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 08/10] media: ipu3-cio2: Drop bogus check and error
 message
Message-ID: <20201009011825.GJ12857@pendragon.ideasonboard.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
 <20200817160734.12402-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200817160734.12402-8-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Thank you for the patch.

On Mon, Aug 17, 2020 at 07:07:31PM +0300, Andy Shevchenko wrote:
> pcim_iomap_table() won't fail if previous pcim_iomap_regions() hasn't.
> Since we check pcim_iomap_regions() for failure the check close to
> pcim_iomap_table() is bogus and not needed.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: new patch
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 57310d7874ce..f5c27c1aa9a2 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1715,7 +1715,6 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  			  const struct pci_device_id *id)
>  {
>  	struct cio2_device *cio2;
> -	void __iomem *const *iomap;
>  	int r;
>  
>  	cio2 = devm_kzalloc(&pci_dev->dev, sizeof(*cio2), GFP_KERNEL);
> @@ -1738,13 +1737,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  		return -ENODEV;
>  	}
>  
> -	iomap = pcim_iomap_table(pci_dev);
> -	if (!iomap) {
> -		dev_err(&pci_dev->dev, "failed to iomap table\n");
> -		return -ENODEV;
> -	}
> -
> -	cio2->base = iomap[CIO2_PCI_BAR];
> +	cio2->base = pcim_iomap_table(pci_dev)[CIO2_PCI_BAR];

pcim_iomap_table() can return NULL if devres_alloc() runs out of memory.

>  
>  	pci_set_drvdata(pci_dev, cio2);
>  

-- 
Regards,

Laurent Pinchart
