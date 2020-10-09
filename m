Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5AD287FEA
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 03:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgJIBQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 21:16:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49472 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgJIBQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 21:16:18 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CD4F59E;
        Fri,  9 Oct 2020 03:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602206176;
        bh=6ZJmmtMk/+gjqX6/a9MOUedyHKbfmNCDN4hgtRttb1w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mD+Dcx3GBq/ZvqDsECw9tnK3W5bHJoXpp+XeAGaJywqPtHM+3ZYsmZi8iELZzxITV
         a/B1f9T5icZRpNKh27JJDGUKvhf0vLOkN+sfCPNZ2FwYd/rGdI7LxoBfTr8K5mkSo0
         YLaVc+JLQ4cB3YAjn25uGgl0clIRQg+fbCgfoC0o=
Date:   Fri, 9 Oct 2020 04:15:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 10/10] media: ipu3-cio2: Update Copyright year and fix
 indentation issues
Message-ID: <20201009011533.GI12857@pendragon.ideasonboard.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
 <20200817160734.12402-10-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200817160734.12402-10-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Thank you for the patch.

On Mon, Aug 17, 2020 at 07:07:33PM +0300, Andy Shevchenko wrote:
> Update Copyright year to cover the previous changes and at the same time
> address indentation issues.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v2: one more indentation fix
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index f3ec2d62cace..9a8c6e99d3ac 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (C) 2017 Intel Corporation
> + * Copyright (C) 2017,2020 Intel Corporation
>   *
>   * Based partially on Intel IPU4 driver written by
>   *  Sakari Ailus <sakari.ailus@linux.intel.com>
> @@ -9,7 +9,6 @@
>   *  Jouni Ukkonen <jouni.ukkonen@intel.com>
>   *  Antti Laakso <antti.laakso@intel.com>
>   * et al.
> - *
>   */
>  
>  #include <linux/delay.h>
> @@ -292,7 +291,7 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
>  				 struct cio2_csi2_timing *timing)
>  {
>  	struct device *dev = &cio2->pci_dev->dev;
> -	struct v4l2_querymenu qm = {.id = V4L2_CID_LINK_FREQ, };
> +	struct v4l2_querymenu qm = { .id = V4L2_CID_LINK_FREQ };
>  	struct v4l2_ctrl *link_freq;
>  	s64 freq;
>  	int r;
> @@ -864,7 +863,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
>  		b->offset = sg->sgl->offset;
>  
>  	i = j = 0;
> -	for_each_sg_dma_page (sg->sgl, &sg_iter, sg->nents, 0) {
> +	for_each_sg_dma_page(sg->sgl, &sg_iter, sg->nents, 0) {
>  		if (!pages--)
>  			break;
>  		b->lop[i][j] = PFN_DOWN(sg_page_iter_dma_address(&sg_iter));

-- 
Regards,

Laurent Pinchart
