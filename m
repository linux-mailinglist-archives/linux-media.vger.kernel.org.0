Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FB12BB32B
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 19:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730511AbgKTSac (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 13:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730149AbgKTSab (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 13:30:31 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F49FC061A04
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 10:30:31 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id l2so9882285qkf.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 10:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qS9ZqheXF3qXlYveFf6+vMdNm1LP9a7sCRmU5tIj0vQ=;
        b=DrFYWt+1hb4WfINS92U5IVQMCB6WKF5xEz75W+ZSkpzKVYZw8JxEaaLRhFgpFsX1Rs
         XUxXlb8HtK40tSfGjjunkX8SU199oPuB/G80+Ihj5S6pCKGr2HFJlL7MHo65gDiv8c23
         ofoLjjtqKLcM53/YSHMQnD2n64U/s4LGFx0MXmrxSwtmydzCFFOGbOgl5AefevNt9z4B
         /AzLhrlEIRoOx3a/FI6xZiykdYU/2XpV/SH5UXKmuao5MFBbsI3vKTIdga3hvHSW64qo
         Z/90o2IZQUfzW0ooGr7K6UIiRhh4E1F7jHOF81fznndZO1wpQBiuooGayp0HJjzgftiB
         hUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qS9ZqheXF3qXlYveFf6+vMdNm1LP9a7sCRmU5tIj0vQ=;
        b=SJ9qhQeDP+4vbC25aDfeDaPvP40VVmd78z5dN7FSRCxg4Pc6HriCtTI7RoVXyBhnAL
         LsOKGRiAJ9om8hyKIWRmmcO0IfLCvy9YBN71bM43yfjxDESwqa7rZAehf8FtjPbtTFk9
         N442zTjaL94xgucSPB22b+8V1YjxWKGMtT3geiqd+fex+Rqbl8b/vf8uCnx/Od+EaIn9
         y4b6yiXjh41lnPR9WVsR+pWpU2PcV+s28Uy5BP32MjIbMhPlLcRZPmQO6dfCPQa6Gpxz
         WQ4occL1mBC2DGu6gTE9apQWobdwiTBCv+sr+Q48+KKKJDCo0jI9y0xgK+gtOvUu5Jfm
         ellA==
X-Gm-Message-State: AOAM532Qj6Z3b6PuuUH1Lj7M7Q360A5r7I3bvwFvbgUpIMydPg0yNxW0
        OtrjTj68iEOboCG/fk1dnyBDtg==
X-Google-Smtp-Source: ABdhPJz9SdUwITc+pZGgA9oQw0nYR0dAsKTieY7dxiA1OR9ilvjUimdkoUQjm+gMpnpYWVeoTDxPfg==
X-Received: by 2002:a37:9441:: with SMTP id w62mr17877583qkd.474.1605897030779;
        Fri, 20 Nov 2020 10:30:30 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id f14sm2400142qkk.89.2020.11.20.10.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 10:30:30 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kgBAz-008ujM-Ig; Fri, 20 Nov 2020 14:30:29 -0400
Date:   Fri, 20 Nov 2020 14:30:29 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v6 17/17] RFC: mm: add mmu_notifier argument to follow_pfn
Message-ID: <20201120183029.GQ244516@ziepe.ca>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-18-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119144146.1045202-18-daniel.vetter@ffwll.ch>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 19, 2020 at 03:41:46PM +0100, Daniel Vetter wrote:
> @@ -4805,21 +4824,15 @@ EXPORT_SYMBOL(follow_pte_pmd);
>   * Return: zero and the pfn at @pfn on success, -ve otherwise.
>   */
>  int follow_pfn(struct vm_area_struct *vma, unsigned long address,
> -	unsigned long *pfn)
> +	unsigned long *pfn, struct mmu_notifier *subscription)
>  {
> -	int ret = -EINVAL;
> -	spinlock_t *ptl;
> -	pte_t *ptep;
> +	if (WARN_ON(!subscription->mm))
> +		return -EINVAL;
>  
> +	if (WARN_ON(subscription->mm != vma->vm_mm))
> +		return -EINVAL;

These two things are redundant right? vma->vm_mm != NULL?

BTW, why do we even have this for nommu? If the only caller is kvm,
can you even compile kvm on nommu??

Jason
