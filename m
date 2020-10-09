Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1F1287FB4
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 03:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgJIBB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 21:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725952AbgJIBB0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 21:01:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20CDC0613D2
        for <linux-media@vger.kernel.org>; Thu,  8 Oct 2020 18:01:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22C1A59E;
        Fri,  9 Oct 2020 03:01:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602205285;
        bh=MV6ru5CALutDCUAsuDC58y4wxXHRxi2BMxNNovbGedY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qFEtQw0uzt3bx6Em+X3Ebrsp0CdRhKRWDqpZQm0Ame3En2MqAwJfylaizmPQD12gP
         GM3fLt+WmNMUbfXzyS3xhG89SxI+offdmBqSCIH+AwxpSKPAolNpwgkZaDcxcdZ6+e
         ZAWkAqe9LsqpLHiDeN3GgBh0DzHg+4FFcvekFlY4=
Date:   Fri, 9 Oct 2020 04:00:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 02/10] media: ipu3-cio2: Introduce CIO2_LOP_ENTRIES
 constant
Message-ID: <20201009010042.GE12857@pendragon.ideasonboard.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
 <20200817160734.12402-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200817160734.12402-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Thank you for the patch.

On Mon, Aug 17, 2020 at 07:07:25PM +0300, Andy Shevchenko wrote:
> This constant is used in several places in the code, define it
> for better maintenance.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: renamed CIO2_MAX_ENTRIES -> CIO2_LOP_ENTRIES (Sakari)
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 13 +++++--------
>  drivers/media/pci/intel/ipu3/ipu3-cio2.h |  3 +++
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index cb74d49934f1..a89cb3c7e0dc 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -127,7 +127,7 @@ static int cio2_fbpt_init_dummy(struct cio2_device *cio2)
>  	 * List of Pointers(LOP) contains 1024x32b pointers to 4KB page each
>  	 * Initialize each entry to dummy_page bus base address.
>  	 */
> -	for (i = 0; i < CIO2_PAGE_SIZE / sizeof(*cio2->dummy_lop); i++)
> +	for (i = 0; i < CIO2_LOP_ENTRIES; i++)
>  		cio2->dummy_lop[i] = cio2->dummy_page_bus_addr >> PAGE_SHIFT;
>  
>  	return 0;
> @@ -160,8 +160,7 @@ static void cio2_fbpt_entry_init_dummy(struct cio2_device *cio2,
>  	unsigned int i;
>  
>  	entry[0].first_entry.first_page_offset = 0;
> -	entry[1].second_entry.num_of_pages =
> -		CIO2_PAGE_SIZE / sizeof(u32) * CIO2_MAX_LOPS;
> +	entry[1].second_entry.num_of_pages = CIO2_LOP_ENTRIES * CIO2_MAX_LOPS;
>  	entry[1].second_entry.last_page_available_bytes = CIO2_PAGE_SIZE - 1;
>  
>  	for (i = 0; i < CIO2_MAX_LOPS; i++)
> @@ -201,7 +200,7 @@ static void cio2_fbpt_entry_init_buf(struct cio2_device *cio2,
>  	i = 0;
>  	while (remaining > 0) {
>  		entry->lop_page_addr = b->lop_bus_addr[i] >> PAGE_SHIFT;
> -		remaining -= CIO2_PAGE_SIZE / sizeof(u32) * CIO2_PAGE_SIZE;
> +		remaining -= CIO2_LOP_ENTRIES * CIO2_PAGE_SIZE;
>  		entry++;
>  		i++;
>  	}
> @@ -841,10 +840,8 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
>  	struct device *dev = &cio2->pci_dev->dev;
>  	struct cio2_buffer *b =
>  		container_of(vb, struct cio2_buffer, vbb.vb2_buf);
> -	static const unsigned int entries_per_page =
> -		CIO2_PAGE_SIZE / sizeof(u32);
>  	unsigned int pages = DIV_ROUND_UP(vb->planes[0].length, CIO2_PAGE_SIZE);
> -	unsigned int lops = DIV_ROUND_UP(pages + 1, entries_per_page);
> +	unsigned int lops = DIV_ROUND_UP(pages + 1, CIO2_LOP_ENTRIES);
>  	struct sg_table *sg;
>  	struct sg_dma_page_iter sg_iter;
>  	unsigned int i, j;
> @@ -878,7 +875,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
>  			break;
>  		b->lop[i][j] = sg_page_iter_dma_address(&sg_iter) >> PAGE_SHIFT;
>  		j++;
> -		if (j == entries_per_page) {
> +		if (j == CIO2_LOP_ENTRIES) {
>  			i++;
>  			j = 0;
>  		}
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> index 7caab9b8c2b9..a64a829acc34 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> @@ -4,6 +4,8 @@
>  #ifndef __IPU3_CIO2_H
>  #define __IPU3_CIO2_H
>  
> +#include <linux/types.h>
> +
>  #define CIO2_NAME					"ipu3-cio2"
>  #define CIO2_DEVICE_NAME				"Intel IPU3 CIO2"
>  #define CIO2_ENTITY_NAME				"ipu3-csi2"
> @@ -17,6 +19,7 @@
>  /* 32MB = 8xFBPT_entry */
>  #define CIO2_MAX_LOPS					8
>  #define CIO2_MAX_BUFFERS			(PAGE_SIZE / 16 / CIO2_MAX_LOPS)
> +#define CIO2_LOP_ENTRIES			(PAGE_SIZE / sizeof(u32))

Shouldn't this be CIO2_PAGE_SIZE instead of PAGE_SIZE ?

>  
>  #define CIO2_PAD_SINK					0
>  #define CIO2_PAD_SOURCE					1

-- 
Regards,

Laurent Pinchart
