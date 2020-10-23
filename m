Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E96296F09
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 14:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505954AbgJWM0H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 08:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897739AbgJWM0H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 08:26:07 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E90C0613D4
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:26:06 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d78so1239753wmd.3
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PAFtVAQ3tChjSUzKujX9wl7xWmpuDPW53yjWkRt+YX4=;
        b=K/MlvxqbXxKBD7NtxzEVlnQQgEo8R7jzzQ6d8aTKu/t7mVOfhin25s4agcsW7aC9Fm
         Dg+jn2+aY9gWuXi7wduTHjxE/oiqtUmeSjJS9d5bV3rltqi1wTiNFP2rJPUUFWgVs7E6
         gRtIWzD7wrVKYbLUc6keZxA0hqL4l6D2l+jUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=PAFtVAQ3tChjSUzKujX9wl7xWmpuDPW53yjWkRt+YX4=;
        b=bw8OqFxs0bXiOvSOr3bS/cqYbbVwVVnJxAGxCP0MTwL47kzKGhKyDy640dgnBgk/7I
         lHWnBtIp+AO+mdRoE3E2Lat5G5xCDW3niykf0J6DHfBB1nIJfXPmjZdtZdsZX8rlEA+J
         tuKuyXnul50ZsebaOo18Ve2BIez5JLLg+7Csox2dWZvzBofz2HqSikKnu4LzClWvNPXd
         Dj+B3fBQa0wP7mEx2oVCrVrpwcBfb/33ICKAiagq6Y1mQG6Jd09nWZyiIUqTDhUTQ4lc
         4Vwm9N3malRox5A8izqZykIMSelsw7i2XZot/FaIMh8+urptdTkGA2tK0FGTzFr11YgV
         6Zmg==
X-Gm-Message-State: AOAM531bpLhPHQmK26vaugx0suRWaVMD9iwa2VLDpb8neHXhMTu5JqKE
        UcngR38uqRBjFqDHe8iARMLn7A==
X-Google-Smtp-Source: ABdhPJzmCXFy0gj+CVwTI7L79a3sWTdS3hTTu9nmTWuT4VCd2/G9Mq4Y+61MqYgpQ+yiCjJ3FCfC5Q==
X-Received: by 2002:a7b:c015:: with SMTP id c21mr2044322wmb.22.1603455964962;
        Fri, 23 Oct 2020 05:26:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k203sm3232158wmb.37.2020.10.23.05.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:26:04 -0700 (PDT)
Date:   Fri, 23 Oct 2020 14:26:02 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH 29/65] s390/pci: Remove races against pte updates
Message-ID: <20201023122602.GB401619@phenom.ffwll.local>
Mail-Followup-To: DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        linux-s390@vger.kernel.org
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-29-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201023122216.2373294-29-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 23, 2020 at 02:21:40PM +0200, Daniel Vetter wrote:
> Way back it was a reasonable assumptions that iomem mappings never
> change the pfn range they point at. But this has changed:
> 
> - gpu drivers dynamically manage their memory nowadays, invalidating
> ptes with unmap_mapping_range when buffers get moved
> 
> - contiguous dma allocations have moved from dedicated carvetouts to
> cma regions. This means if we miss the unmap the pfn might contain
> pagecache or anon memory (well anything allocated with GFP_MOVEABLE)
> 
> - even /dev/mem now invalidates mappings when the kernel requests that
> iomem region when CONFIG_IO_STRICT_DEVMEM is set, see commit
> 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims the
> region")
> 
> Accessing pfns obtained from ptes without holding all the locks is
> therefore no longer a good idea. Fix this.
> 
> Since zpci_memcpy_from|toio seems to not do anything nefarious with
> locks we just need to open code get_pfn and follow_pfn and make sure
> we drop the locks only after we're done. The write function also needs
> the copy_from_user move, since we can't take userspace faults while
> holding the mmap sem.
> 
> v2: Move VM_IO | VM_PFNMAP checks around so they keep returning EINVAL
> like before (Gerard)
> 
> v3: Polish commit message (Niklas)
> 
> Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Jérôme Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Apologies for this random patch bomb, typoed git send-email command :-/

v4 of this will come properly on Monday or so.
-Daniel

> ---
>  arch/s390/pci/pci_mmio.c | 98 +++++++++++++++++++++++-----------------
>  1 file changed, 57 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/s390/pci/pci_mmio.c b/arch/s390/pci/pci_mmio.c
> index 401cf670a243..1a6adbc68ee8 100644
> --- a/arch/s390/pci/pci_mmio.c
> +++ b/arch/s390/pci/pci_mmio.c
> @@ -119,33 +119,15 @@ static inline int __memcpy_toio_inuser(void __iomem *dst,
>  	return rc;
>  }
>  
> -static long get_pfn(unsigned long user_addr, unsigned long access,
> -		    unsigned long *pfn)
> -{
> -	struct vm_area_struct *vma;
> -	long ret;
> -
> -	mmap_read_lock(current->mm);
> -	ret = -EINVAL;
> -	vma = find_vma(current->mm, user_addr);
> -	if (!vma)
> -		goto out;
> -	ret = -EACCES;
> -	if (!(vma->vm_flags & access))
> -		goto out;
> -	ret = follow_pfn(vma, user_addr, pfn);
> -out:
> -	mmap_read_unlock(current->mm);
> -	return ret;
> -}
> -
>  SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, mmio_addr,
>  		const void __user *, user_buffer, size_t, length)
>  {
>  	u8 local_buf[64];
>  	void __iomem *io_addr;
>  	void *buf;
> -	unsigned long pfn;
> +	struct vm_area_struct *vma;
> +	pte_t *ptep;
> +	spinlock_t *ptl;
>  	long ret;
>  
>  	if (!zpci_is_enabled())
> @@ -158,7 +140,7 @@ SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, mmio_addr,
>  	 * We only support write access to MIO capable devices if we are on
>  	 * a MIO enabled system. Otherwise we would have to check for every
>  	 * address if it is a special ZPCI_ADDR and would have to do
> -	 * a get_pfn() which we don't need for MIO capable devices.  Currently
> +	 * a pfn lookup which we don't need for MIO capable devices.  Currently
>  	 * ISM devices are the only devices without MIO support and there is no
>  	 * known need for accessing these from userspace.
>  	 */
> @@ -176,21 +158,37 @@ SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, mmio_addr,
>  	} else
>  		buf = local_buf;
>  
> -	ret = get_pfn(mmio_addr, VM_WRITE, &pfn);
> +	ret = -EFAULT;
> +	if (copy_from_user(buf, user_buffer, length))
> +		goto out_free;
> +
> +	mmap_read_lock(current->mm);
> +	ret = -EINVAL;
> +	vma = find_vma(current->mm, mmio_addr);
> +	if (!vma)
> +		goto out_unlock_mmap;
> +	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
> +		goto out_unlock_mmap;
> +	ret = -EACCES;
> +	if (!(vma->vm_flags & VM_WRITE))
> +		goto out_unlock_mmap;
> +
> +	ret = follow_pte_pmd(vma->vm_mm, mmio_addr, NULL, &ptep, NULL, &ptl);
>  	if (ret)
> -		goto out;
> -	io_addr = (void __iomem *)((pfn << PAGE_SHIFT) |
> +		goto out_unlock_mmap;
> +
> +	io_addr = (void __iomem *)((pte_pfn(*ptep) << PAGE_SHIFT) |
>  			(mmio_addr & ~PAGE_MASK));
>  
> -	ret = -EFAULT;
>  	if ((unsigned long) io_addr < ZPCI_IOMAP_ADDR_BASE)
> -		goto out;
> -
> -	if (copy_from_user(buf, user_buffer, length))
> -		goto out;
> +		goto out_unlock_pt;
>  
>  	ret = zpci_memcpy_toio(io_addr, buf, length);
> -out:
> +out_unlock_pt:
> +	pte_unmap_unlock(ptep, ptl);
> +out_unlock_mmap:
> +	mmap_read_unlock(current->mm);
> +out_free:
>  	if (buf != local_buf)
>  		kfree(buf);
>  	return ret;
> @@ -274,7 +272,9 @@ SYSCALL_DEFINE3(s390_pci_mmio_read, unsigned long, mmio_addr,
>  	u8 local_buf[64];
>  	void __iomem *io_addr;
>  	void *buf;
> -	unsigned long pfn;
> +	struct vm_area_struct *vma;
> +	pte_t *ptep;
> +	spinlock_t *ptl;
>  	long ret;
>  
>  	if (!zpci_is_enabled())
> @@ -287,7 +287,7 @@ SYSCALL_DEFINE3(s390_pci_mmio_read, unsigned long, mmio_addr,
>  	 * We only support read access to MIO capable devices if we are on
>  	 * a MIO enabled system. Otherwise we would have to check for every
>  	 * address if it is a special ZPCI_ADDR and would have to do
> -	 * a get_pfn() which we don't need for MIO capable devices.  Currently
> +	 * a pfn lookup which we don't need for MIO capable devices.  Currently
>  	 * ISM devices are the only devices without MIO support and there is no
>  	 * known need for accessing these from userspace.
>  	 */
> @@ -306,22 +306,38 @@ SYSCALL_DEFINE3(s390_pci_mmio_read, unsigned long, mmio_addr,
>  		buf = local_buf;
>  	}
>  
> -	ret = get_pfn(mmio_addr, VM_READ, &pfn);
> +	mmap_read_lock(current->mm);
> +	ret = -EINVAL;
> +	vma = find_vma(current->mm, mmio_addr);
> +	if (!vma)
> +		goto out_unlock_mmap;
> +	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
> +		goto out_unlock_mmap;
> +	ret = -EACCES;
> +	if (!(vma->vm_flags & VM_WRITE))
> +		goto out_unlock_mmap;
> +
> +	ret = follow_pte_pmd(vma->vm_mm, mmio_addr, NULL, &ptep, NULL, &ptl);
>  	if (ret)
> -		goto out;
> -	io_addr = (void __iomem *)((pfn << PAGE_SHIFT) | (mmio_addr & ~PAGE_MASK));
> +		goto out_unlock_mmap;
> +
> +	io_addr = (void __iomem *)((pte_pfn(*ptep) << PAGE_SHIFT) |
> +			(mmio_addr & ~PAGE_MASK));
>  
>  	if ((unsigned long) io_addr < ZPCI_IOMAP_ADDR_BASE) {
>  		ret = -EFAULT;
> -		goto out;
> +		goto out_unlock_pt;
>  	}
>  	ret = zpci_memcpy_fromio(buf, io_addr, length);
> -	if (ret)
> -		goto out;
> -	if (copy_to_user(user_buffer, buf, length))
> +
> +out_unlock_pt:
> +	pte_unmap_unlock(ptep, ptl);
> +out_unlock_mmap:
> +	mmap_read_unlock(current->mm);
> +
> +	if (!ret && copy_to_user(user_buffer, buf, length))
>  		ret = -EFAULT;
>  
> -out:
>  	if (buf != local_buf)
>  		kfree(buf);
>  	return ret;
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
