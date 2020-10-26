Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD5029993D
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 23:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391649AbgJZWCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 18:02:14 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38613 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391637AbgJZWCN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 18:02:13 -0400
Received: by mail-wm1-f67.google.com with SMTP id l15so14027593wmi.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2020 15:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nnyXk2pMcKjBK4+Fq7Fk4IbVXn2gczxbne31w99Uqrk=;
        b=aNdxfyvHxW5EhJys38x8msSr36mwdr8ntNEXWK/+T2/MzKfU0VCnCWyghyZeK0cVeb
         rA0iLh+uHuE4kyJ2TJC3GpOOr5wl+e2jm2smdq02RkePbEEuN++cEauu/TxifEzN74sA
         tq59FL7KLoIUR9iPLa6VmUTM39rV8IcMJlYBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nnyXk2pMcKjBK4+Fq7Fk4IbVXn2gczxbne31w99Uqrk=;
        b=GmljakETe3bieiiTYn5RsZbgufV9xBGDniaPFJDpil1xOvRs6XyZTiOO0/0NW2/5sh
         FKMWH1hYWW2s6FM41z3a1hAq8DDJvBt4P7XSdo6AnlEKSqglBgi57A1oXj7nlHQUG86v
         SIlfqu69kK1SVCGks4QCVz+di9sqrVQcGx9wZzmKpfakFcBDGzCGXhgxZVZlJfQt9Bk2
         +F4Nx9ueiOD/Cr8ZC30Sq9Do3etQVl4MxMbFcNbviT0e+OTkAXSuXOusb69a6l79G4QB
         RddRIuEpeQqSAsDDtczVuKLKd/HVI89hnhxWrqLI9M8awI5a4mbEKWSweqwAvxWOjeVn
         Scaw==
X-Gm-Message-State: AOAM532m2ctqNh0IDUlG8z33OsgX2+Ett2cPvILiEnDDFeUxXOBXcWeE
        D0NTI+b9fMJs3jFx6ld4aXyjoA==
X-Google-Smtp-Source: ABdhPJwXQQfk3H55i6k/BF7MPc09Wr29zTiROpPA8yChYSvzhbxp82tIcqHTWfVny/00bz/9GBIJdQ==
X-Received: by 2002:a1c:bc06:: with SMTP id m6mr19364153wmf.68.1603749728982;
        Mon, 26 Oct 2020 15:02:08 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id t7sm23634700wrx.42.2020.10.26.15.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 15:02:08 -0700 (PDT)
Date:   Mon, 26 Oct 2020 22:02:06 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Michel Lespinasse <walken@google.com>
Subject: Re: [PATCH v4 09/15] media/videbuf1|2: Mark follow_pfn usage as
 unsafe
Message-ID: <20201026220206.GA2802004@chromium.org>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201026105818.2585306-10-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201026105818.2585306-10-daniel.vetter@ffwll.ch>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Mon, Oct 26, 2020 at 11:58:12AM +0100, Daniel Vetter wrote:
> The media model assumes that buffers are all preallocated, so that
> when a media pipeline is running we never miss a deadline because the
> buffers aren't allocated or available.
> 
> This means we cannot fix the v4l follow_pfn usage through
> mmu_notifier, without breaking how this all works. The only real fix
> is to deprecate userptr support for VM_IO | VM_PFNMAP mappings and
> tell everyone to cut over to dma-buf memory sharing for zerocopy.
> 
> userptr for normal memory will keep working as-is, this only affects
> the zerocopy userptr usage enabled in 50ac952d2263 ("[media]
> videobuf2-dma-sg: Support io userptr operations on io memory").

Note that this is true only for the videobuf2 change. The videobuf1 code
was like this all the time and does not support normal memory in the
dma_contig variant (because normal memory is rarely physically contiguous).

If my understanding is correct that the CONFIG_STRICT_FOLLOW_PFN is not
enabled by default, we stay backwards compatible, with only whoever
decides to turn it on risking a breakage.

I agree that this is a good first step towards deprecating this legacy
code, so:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Of course the last word goes to Mauro. :)

Best regards,
Tomasz

> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Jérôme Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Pawel Osciak <pawel@osciak.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Daniel Jordan <daniel.m.jordan@oracle.com>
> Cc: Michel Lespinasse <walken@google.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> --
> v3:
> - Reference the commit that enabled the zerocopy userptr use case to
>   make it abundandtly clear that this patch only affects that, and not
>   normal memory userptr. The old commit message already explained that
>   normal memory userptr is unaffected, but I guess that was not clear
>   enough.
> ---
>  drivers/media/common/videobuf2/frame_vector.c | 2 +-
>  drivers/media/v4l2-core/videobuf-dma-contig.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
> index 6590987c14bd..e630494da65c 100644
> --- a/drivers/media/common/videobuf2/frame_vector.c
> +++ b/drivers/media/common/videobuf2/frame_vector.c
> @@ -69,7 +69,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>  			break;
>  
>  		while (ret < nr_frames && start + PAGE_SIZE <= vma->vm_end) {
> -			err = follow_pfn(vma, start, &nums[ret]);
> +			err = unsafe_follow_pfn(vma, start, &nums[ret]);
>  			if (err) {
>  				if (ret == 0)
>  					ret = err;
> diff --git a/drivers/media/v4l2-core/videobuf-dma-contig.c b/drivers/media/v4l2-core/videobuf-dma-contig.c
> index 52312ce2ba05..821c4a76ab96 100644
> --- a/drivers/media/v4l2-core/videobuf-dma-contig.c
> +++ b/drivers/media/v4l2-core/videobuf-dma-contig.c
> @@ -183,7 +183,7 @@ static int videobuf_dma_contig_user_get(struct videobuf_dma_contig_memory *mem,
>  	user_address = untagged_baddr;
>  
>  	while (pages_done < (mem->size >> PAGE_SHIFT)) {
> -		ret = follow_pfn(vma, user_address, &this_pfn);
> +		ret = unsafe_follow_pfn(vma, user_address, &this_pfn);
>  		if (ret)
>  			break;
>  
> -- 
> 2.28.0
> 
