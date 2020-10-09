Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24174287FAB
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 02:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgJIA6C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 20:58:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49310 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgJIA6B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 20:58:01 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E336859E;
        Fri,  9 Oct 2020 02:57:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602205080;
        bh=DqLSl4ToVYXBqnOQbNUFfpA4F7rGbb++wiKrXbvGY5k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Btcb6r9m490ZhVIU0elTPk43xiwwx32vHBs4e2Z435w00BpAtHJgPD9zNKu+fP5yX
         q/5SPOVVaIsL8FzKnPNCnNLP6ysVzz2aSzSUtffyzB24uW3AISgYrG2x5VFPdgjrWb
         RxaqYE7nH6JTm9sl/7pm8RdsllVOkA5TZ8NY3uD4=
Date:   Fri, 9 Oct 2020 03:57:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 01/10] media: ipu3-cio2: Simplify cleanup code
Message-ID: <20201009005716.GD12857@pendragon.ideasonboard.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Thank you for the patch. Glad to see interest in the CIO2 driver :-)

On Mon, Aug 17, 2020 at 07:07:24PM +0300, Andy Shevchenko wrote:
> The code looks more nicer if we use:
> 	while (i--)
> instead:
> 	for (i = i - 1; i >= 0; i--)
> 
> This would also allow making 'i' unsigned again.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: converted i to unsigned (Sakari)
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 92f5eadf2c99..cb74d49934f1 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -847,7 +847,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
>  	unsigned int lops = DIV_ROUND_UP(pages + 1, entries_per_page);
>  	struct sg_table *sg;
>  	struct sg_dma_page_iter sg_iter;
> -	int i, j;
> +	unsigned int i, j;
>  
>  	if (lops <= 0 || lops > CIO2_MAX_LOPS) {
>  		dev_err(dev, "%s: bad buffer size (%i)\n", __func__,
> @@ -887,7 +887,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
>  	b->lop[i][j] = cio2->dummy_page_bus_addr >> PAGE_SHIFT;
>  	return 0;
>  fail:
> -	for (i--; i >= 0; i--)
> +	while (i--)
>  		dma_free_coherent(dev, CIO2_PAGE_SIZE,
>  				  b->lop[i], b->lop_bus_addr[i]);

Looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

There's an additional issue though, if vb2_dma_sg_plane_desc() fails, we
should free all the allocated memory.

>  	return -ENOMEM;

-- 
Regards,

Laurent Pinchart
