Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCE01B6F65
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 09:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgDXHsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 03:48:25 -0400
Received: from mga04.intel.com ([192.55.52.120]:49258 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726788AbgDXHsY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 03:48:24 -0400
IronPort-SDR: tUPC7S1+zePzsOPIHXexJZ9PdMJnBqwOvcI9htLLGQR1l3IdPYvWo/H44VYFxyx680YdfAbIu+
 RbS+D9VoQrmQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2020 00:48:22 -0700
IronPort-SDR: y+UknGwSSgbWQznhPilLFxQD0kC0I55vVdmWfS57+VSgGAHrI6tcEdHiC902D/SQRTYoxeAg8Y
 Ckyv9Da3/lTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,310,1583222400"; 
   d="scan'208";a="259734667"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga006.jf.intel.com with ESMTP; 24 Apr 2020 00:48:20 -0700
Subject: Re: [PATCH 1/1] staging: imgu: Use vmap() instead of __get_vm_area()
 and map_vm_area()
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Christoph Hellwig <hch@infradead.org>, bingbu.cao@intel.com,
        tfiga@chromium.org, rajmohan.mani@intel.com
References: <20200417125431.25105-1-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <d598d565-f956-ffb1-db6a-c633caf52606@linux.intel.com>
Date:   Fri, 24 Apr 2020 15:52:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200417125431.25105-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Sakari

On 4/17/20 8:54 PM, Sakari Ailus wrote:
> Switch to vmap() instead of using both __get_vm_area() and map_vm_area().
> 
> While at it, also assign vm_struct.nr_pages field.
> 
> Reported-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> This is just compile tested but reasonably trivial.
> 
>  drivers/staging/media/ipu3/ipu3-dmamap.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-dmamap.c b/drivers/staging/media/ipu3/ipu3-dmamap.c
> index 7431322379f6..58e6683e5770 100644
> --- a/drivers/staging/media/ipu3/ipu3-dmamap.c
> +++ b/drivers/staging/media/ipu3/ipu3-dmamap.c
> @@ -123,16 +123,12 @@ void *imgu_dmamap_alloc(struct imgu_device *imgu, struct imgu_css_map *map,
>  		iovaddr += PAGE_SIZE;
>  	}
>  
> -	/* Now grab a virtual region */
> -	map->vma = __get_vm_area(size, VM_USERMAP, VMALLOC_START, VMALLOC_END);
> +	map->vma = vmap(pages, size / PAGE_SIZE, VM_USERMAP, PAGE_KERNEL);

vmap() returns the address of virtual area not the area itself, right?

>  	if (!map->vma)
>  		goto out_unmap;
>  
>  	map->vma->pages = pages;
> -	/* And map it in KVA */
> -	if (map_vm_area(map->vma, PAGE_KERNEL, pages))
> -		goto out_vunmap;
> -
> +	map->vma->nr_pages = size / PAGE_SIZE;
>  	map->size = size;
>  	map->daddr = iova_dma_addr(&imgu->iova_domain, iova);
>  	map->vaddr = map->vma->addr;
> @@ -142,9 +138,6 @@ void *imgu_dmamap_alloc(struct imgu_device *imgu, struct imgu_css_map *map,
>  
>  	return map->vma->addr;
>  
> -out_vunmap:
> -	vunmap(map->vma->addr);
> -
>  out_unmap:
>  	imgu_dmamap_free_buffer(pages, size);
>  	imgu_mmu_unmap(imgu->mmu, iova_dma_addr(&imgu->iova_domain, iova),
> 

-- 
Best regards,
Bingbu Cao
