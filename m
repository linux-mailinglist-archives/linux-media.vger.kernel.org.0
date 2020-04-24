Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACAA1B714A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgDXJ4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:56:46 -0400
Received: from mga17.intel.com ([192.55.52.151]:35006 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726860AbgDXJ4p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:56:45 -0400
IronPort-SDR: SghrriOTPRVd0UUl1Imm/1gPN+ZqlELI1gxM2vJVlL6zxTZsad4dBrZd0b0am2b1T6tpux5WpK
 SShJw2cCguUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2020 02:56:45 -0700
IronPort-SDR: Go/OUlVR8G2hjUd1n4vX7PJDdGLns6FdZaNVuiIsnWxtqcnZDhkPXBMzpzqpMbztYrNHvcRse8
 mwc6OYjRVqrQ==
X-IronPort-AV: E=Sophos;i="5.73,311,1583222400"; 
   d="scan'208";a="301505948"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2020 02:56:44 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 07F1F20740; Fri, 24 Apr 2020 12:56:42 +0300 (EEST)
Date:   Fri, 24 Apr 2020 12:56:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
        bingbu.cao@intel.com, tfiga@chromium.org, rajmohan.mani@intel.com
Subject: Re: [PATCH 1/1] staging: imgu: Use vmap() instead of __get_vm_area()
 and map_vm_area()
Message-ID: <20200424095641.GT5381@paasikivi.fi.intel.com>
References: <20200417125431.25105-1-sakari.ailus@linux.intel.com>
 <d598d565-f956-ffb1-db6a-c633caf52606@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d598d565-f956-ffb1-db6a-c633caf52606@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Fri, Apr 24, 2020 at 03:52:22PM +0800, Bingbu Cao wrote:
> Hi, Sakari
> 
> On 4/17/20 8:54 PM, Sakari Ailus wrote:
> > Switch to vmap() instead of using both __get_vm_area() and map_vm_area().
> > 
> > While at it, also assign vm_struct.nr_pages field.
> > 
> > Reported-by: Christoph Hellwig <hch@infradead.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > This is just compile tested but reasonably trivial.
> > 
> >  drivers/staging/media/ipu3/ipu3-dmamap.c | 11 ++---------
> >  1 file changed, 2 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/ipu3-dmamap.c b/drivers/staging/media/ipu3/ipu3-dmamap.c
> > index 7431322379f6..58e6683e5770 100644
> > --- a/drivers/staging/media/ipu3/ipu3-dmamap.c
> > +++ b/drivers/staging/media/ipu3/ipu3-dmamap.c
> > @@ -123,16 +123,12 @@ void *imgu_dmamap_alloc(struct imgu_device *imgu, struct imgu_css_map *map,
> >  		iovaddr += PAGE_SIZE;
> >  	}
> >  
> > -	/* Now grab a virtual region */
> > -	map->vma = __get_vm_area(size, VM_USERMAP, VMALLOC_START, VMALLOC_END);
> > +	map->vma = vmap(pages, size / PAGE_SIZE, VM_USERMAP, PAGE_KERNEL);
> 
> vmap() returns the address of virtual area not the area itself, right?

Yes. But there's a cleaner patches from Christoph here:

<URL:https://lore.kernel.org/lkml/20200414131348.444715-5-hch@lst.de/>

So I've dropped mine.

> 
> >  	if (!map->vma)
> >  		goto out_unmap;
> >  
> >  	map->vma->pages = pages;
> > -	/* And map it in KVA */
> > -	if (map_vm_area(map->vma, PAGE_KERNEL, pages))
> > -		goto out_vunmap;
> > -
> > +	map->vma->nr_pages = size / PAGE_SIZE;
> >  	map->size = size;
> >  	map->daddr = iova_dma_addr(&imgu->iova_domain, iova);
> >  	map->vaddr = map->vma->addr;
> > @@ -142,9 +138,6 @@ void *imgu_dmamap_alloc(struct imgu_device *imgu, struct imgu_css_map *map,
> >  
> >  	return map->vma->addr;
> >  
> > -out_vunmap:
> > -	vunmap(map->vma->addr);
> > -
> >  out_unmap:
> >  	imgu_dmamap_free_buffer(pages, size);
> >  	imgu_mmu_unmap(imgu->mmu, iova_dma_addr(&imgu->iova_domain, iova),
> > 
> 

-- 
Kind regards,

Sakari Ailus
