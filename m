Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588CC30D0D4
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 02:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBCBb5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 20:31:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbhBCBbs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 20:31:48 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BABEC0613ED;
        Tue,  2 Feb 2021 17:31:08 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id o16so16165967pgg.5;
        Tue, 02 Feb 2021 17:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T+IFulWS30TVdfKg6FbK/0wljc+JOjEQqde/nrXKzCI=;
        b=pHh0nOo43ZTL5LL9P7k8jk/hC0amgWajB0mH3Dxb+vwAmJsJmm/nGyaG++L/G1mVNK
         eDiW55ib9GCrzzm1FaVcoNxYgnApFS7wl0oXCt4dHRtUunxsYGX4PyyZG9peXq3jNugE
         9jqld7I4QdoQTqMGI1xnvPCO6XSRkm/HRq/sXHP0RHvxaC3GeBTRLlvfHUqCOrgjhPjI
         7sZ6na77hAuh5dI+E6MUQnVguhNOdS2AzUAGlmPiqSKzcXP09y9xoGCXVukyBxOtWZxt
         u2Ki9FNu/+eDKY60VVxREEQkIKo3xthogr7K0IvOl5r8kHX9pJfkJkvG/XcYHqU8fKY4
         EvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=T+IFulWS30TVdfKg6FbK/0wljc+JOjEQqde/nrXKzCI=;
        b=eE0sVSqa/gXfP/9j1nFPOFzdHGTiz0rDgd37z4n94fTYUTeQO/D+sUGRcFodwfG62f
         jZ1ErS8RLW2EHqh0HQ3O0rX22ucLhNWaPFA2kl2PcO5qaWipJ/ikqnQe2Xs11rLzNczT
         MSpqa4h+5Eqr87hGhjTsdW+cnYaOeBGQSo6h/SYmWdYaO/3p58wl11AHVochlTV1hv8c
         CnSAD7zibysBZcfocBFFXFDRDrV+nx/45wNdr8SdmV9DFM/3Vds32mYAOO7z/745eAdG
         oJnsfC9lqvAfDF/v7KEGPKH35albbfXYD6U+3SZvSOyb9uTigIp3Ebe35HDfHMNp5BDk
         VIuA==
X-Gm-Message-State: AOAM533aw1u1HxZx7IqjAg2owybg4RETON6QqcNeRh5MMlb9ZTbK2sIx
        vQFH/AOkq0XpEKNyWYFYoD0=
X-Google-Smtp-Source: ABdhPJz+SHeDGDiOTFr7BCLmdLVZac+uhes3CUQ3tgyGdAX3UbuwtARrizczD0kVVmAQ9gNAoPNKtA==
X-Received: by 2002:a62:f202:0:b029:1bc:a634:8e9c with SMTP id m2-20020a62f2020000b02901bca6348e9cmr717628pfh.49.1612315867684;
        Tue, 02 Feb 2021 17:31:07 -0800 (PST)
Received: from google.com ([2620:15c:211:201:1502:84f8:ffc3:45b])
        by smtp.gmail.com with ESMTPSA id o20sm212189pgn.6.2021.02.02.17.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 17:31:06 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 2 Feb 2021 17:31:03 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     sumit.semwal@linaro.org, akpm@linux-foundation.org,
        hch@infradead.org, lmark@codeaurora.org, labbott@redhat.com,
        Brian.Starkey@arm.com, john.stultz@linaro.org,
        christian.koenig@amd.com, cgoldswo@codeaurora.org,
        orjan.eide@arm.com, robin.murphy@arm.com, jajones@nvidia.com,
        hridya@google.com, sspatil@google.com, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH 1/2] mm: replace BUG_ON in vm_insert_page with a return
 of an error
Message-ID: <YBn81xAeCqHgudYb@google.com>
References: <20210203003134.2422308-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203003134.2422308-1-surenb@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 02, 2021 at 04:31:33PM -0800, Suren Baghdasaryan wrote:
> Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> WARN_ON_ONCE and returning an error. This is to ensure users of the
> vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> and get an indication of an error without panicing the kernel.
> This will help identifying drivers that need to clear VM_PFNMAP before
> using dmabuf system heap which is moving to use vm_insert_page.
> 
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
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

Better to replace above BUG_ON with WARN_ON_ONCE, too?
