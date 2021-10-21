Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8F243603C
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 13:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhJULbV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 07:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbhJULbU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 07:31:20 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0246C06161C
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 04:29:03 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id u18so60447wrg.5
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JwVQwN9/gn7CpBFk2zlaKtJsw/c4l/Vxfk//DWl20Kw=;
        b=g1IXTAt2Sbj3Ocx5s6Gbrz/DhNbque9h9mzTj2GWa7phvsFWFdnjOZcxyq/0nKzoy7
         i06OqRlnUVhqinhnf1CeXShdfB+WiRayuOxXA/1gnEwkiex6MT5L7kCy1JhFT0zhLExp
         HN1MtCb9tWlmo+CGV46CIUzm3X3L4AlH2/UqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JwVQwN9/gn7CpBFk2zlaKtJsw/c4l/Vxfk//DWl20Kw=;
        b=OhMrN7P9fnJHyhXR2se8kc1w2nKqnA1I/R+UUQnEcgVJOU0uO5JkWRkJ8UeBCimGIT
         3ye5xH4YTmBseZWpkk76s6+tVVD3mjQmXc8M2qgL+hhB+weaIt9M5DBKorMJepAuLV1U
         igKNK8uLsxF9Ga+PqNFgoirgOsVF4Dx3UNGkIdHUJgHyl/6PtzHDHPuAQDejkA18e3gA
         d+uA9nU7gadL94UOFTcGu5J6BxZG/HOAK/psFXpEmBV9T/YUGf9VV7YBNu6fqFNt7cnj
         2oKWefB7Gln0nFa9Zz9zz69cdJJlKnoARni6YRvlqYRGYH83VrgmZ8RSnTC3ovcaaiu0
         P4VA==
X-Gm-Message-State: AOAM533BWSHC53y0ni6ISZTSnwnOlWUqoao2UKb4MOr8vuxZk51RccSe
        12ZDhUFd7W7dXyfaHjCj7qK4JQ==
X-Google-Smtp-Source: ABdhPJw0a/W9DjJ3g7NpCHaGmpBUykzh9wqe4oFQGoGy33wM0/oJepxE6tvHrEFlDAo2+HgkvkEAkg==
X-Received: by 2002:adf:c78d:: with SMTP id l13mr6330185wrg.134.1634815742582;
        Thu, 21 Oct 2021 04:29:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k10sm7617128wmr.32.2021.10.21.04.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 04:29:02 -0700 (PDT)
Date:   Thu, 21 Oct 2021 13:29:00 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Felix Kuehling <felix.kuehling@amd.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 12/28] drm/amdgpu: use new iterator in
 amdgpu_ttm_bo_eviction_valuable
Message-ID: <YXFO/Dy1iH3q9snu@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-13-christian.koenig@amd.com>
 <YWboMfLOIjl1l7tF@phenom.ffwll.local>
 <a0a926a7-13d0-b996-5f32-36aa6d74165e@gmail.com>
 <c18a4c91-93b4-79ed-0907-84adb29761d8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c18a4c91-93b4-79ed-0907-84adb29761d8@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 19, 2021 at 12:30:40PM -0400, Felix Kuehling wrote:
> Am 2021-10-19 um 7:36 a.m. schrieb Christian König:
> > Am 13.10.21 um 16:07 schrieb Daniel Vetter:
> >> On Tue, Oct 05, 2021 at 01:37:26PM +0200, Christian König wrote:
> >>> Simplifying the code a bit.
> >>>
> >>> Signed-off-by: Christian König <christian.koenig@amd.com>
> >>> ---
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
> >>>   1 file changed, 4 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>> index e8d70b6e6737..722e3c9e8882 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>> @@ -1345,10 +1345,9 @@ static bool
> >>> amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
> >>>                           const struct ttm_place *place)
> >>>   {
> >>>       unsigned long num_pages = bo->resource->num_pages;
> >>> +    struct dma_resv_iter resv_cursor;
> >>>       struct amdgpu_res_cursor cursor;
> >>> -    struct dma_resv_list *flist;
> >>>       struct dma_fence *f;
> >>> -    int i;
> >>>         /* Swapout? */
> >>>       if (bo->resource->mem_type == TTM_PL_SYSTEM)
> >>> @@ -1362,14 +1361,9 @@ static bool
> >>> amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
> >>>        * If true, then return false as any KFD process needs all its
> >>> BOs to
> >>>        * be resident to run successfully
> >>>        */
> >>> -    flist = dma_resv_shared_list(bo->base.resv);
> >>> -    if (flist) {
> >>> -        for (i = 0; i < flist->shared_count; ++i) {
> >>> -            f = rcu_dereference_protected(flist->shared[i],
> >>> -                dma_resv_held(bo->base.resv));
> >>> -            if (amdkfd_fence_check_mm(f, current->mm))
> >>> -                return false;
> >>> -        }
> >>> +    dma_resv_for_each_fence(&resv_cursor, bo->base.resv, true, f) {
> >>                                 ^false?
> >>
> >> At least I'm not seeing the code look at the exclusive fence here.
> >
> > Yes, but that's correct. We need to look at all potential fences.
> 
> amdkfd_fence_check_mm is only meaningful for KFD eviction fences, and
> they are always added as shared fences. I think setting all_fences =
> false would return only the exclusive fence.

Hm yeah I got that wrong, which puts my entire review a bit in question
:-)

Anyway on the patch: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Regards,
>   Felix
> 
> 
> >
> > It's a design problem in KFD if you ask me, but that is a completely
> > different topic.
> >
> > Christian.
> >
> >> -Daniel
> >>
> >>> +        if (amdkfd_fence_check_mm(f, current->mm))
> >>> +            return false;
> >>>       }
> >>>         switch (bo->resource->mem_type) {
> >>> -- 
> >>> 2.25.1
> >>>
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
