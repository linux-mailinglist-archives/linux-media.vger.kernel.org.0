Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958BF30D0C5
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 02:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhBCB1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 20:27:54 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:12069 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbhBCB1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 20:27:53 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DVkWv5tQ5zMTrn;
        Wed,  3 Feb 2021 09:25:31 +0800 (CST)
Received: from [10.174.179.241] (10.174.179.241) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Feb 2021 09:27:05 +0800
Subject: Re: [PATCH 1/2] mm: replace BUG_ON in vm_insert_page with a return of
 an error
To:     Suren Baghdasaryan <surenb@google.com>, <sumit.semwal@linaro.org>
CC:     <akpm@linux-foundation.org>, <hch@infradead.org>,
        <lmark@codeaurora.org>, <labbott@redhat.com>,
        <Brian.Starkey@arm.com>, <john.stultz@linaro.org>,
        <christian.koenig@amd.com>, <cgoldswo@codeaurora.org>,
        <orjan.eide@arm.com>, <robin.murphy@arm.com>, <jajones@nvidia.com>,
        <minchan@kernel.org>, <hridya@google.com>, <sspatil@google.com>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <kernel-team@android.com>
References: <20210203003134.2422308-1-surenb@google.com>
From:   Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <a2376ae0-c6a2-12e4-d4ad-04696eb51535@huawei.com>
Date:   Wed, 3 Feb 2021 09:27:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203003134.2422308-1-surenb@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi:
On 2021/2/3 8:31, Suren Baghdasaryan wrote:
> Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> WARN_ON_ONCE and returning an error. This is to ensure users of the
> vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> and get an indication of an error without panicing the kernel.
> This will help identifying drivers that need to clear VM_PFNMAP before
> using dmabuf system heap which is moving to use vm_insert_page.
> 
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Looks reasonable. Thanks.
Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

> ---
>  mm/memory.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index feff48e1465a..e503c9801cd9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1827,7 +1827,8 @@ int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
>  		return -EINVAL;
>  	if (!(vma->vm_flags & VM_MIXEDMAP)) {
>  		BUG_ON(mmap_read_trylock(vma->vm_mm));
> -		BUG_ON(vma->vm_flags & VM_PFNMAP);
> +		if (WARN_ON_ONCE(vma->vm_flags & VM_PFNMAP))
> +			return -EINVAL;
>  		vma->vm_flags |= VM_MIXEDMAP;
>  	}
>  	return insert_page(vma, addr, page, vma->vm_page_prot);
> 

