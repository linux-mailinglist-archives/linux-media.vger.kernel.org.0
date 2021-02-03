Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4926C30D11D
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 02:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbhBCB4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 20:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbhBCB4n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 20:56:43 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BFC0C061573
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 17:56:03 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m2so4103879wmm.1
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 17:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eqb0FQEG710LFOVTd7yEl7tin1eRbeirJikh0ogVzXs=;
        b=r4yYUo1RncgQIJ2OFCrbLrZmrY2T3kRRqBaZl+AROnou29V143R2jumKvvg19DLqCo
         F2V2aPSyfbh5iMz1kj+xBVJV5f3HQGt+xLXfaqUjvnBhUO3hfL/56qlxZDAIdOsWeEHT
         hgLIVPKdps71ba9B4KnrfwhUrjd8IWTghGyuq5RgmBTA4yN6F/I1hI7BqhdUhBiri6p5
         ti5ok3BitGiRKghlbB49tORC5hYAZPVoOOMlJELLKjTmtecV3vwGP9LPTSn9fwZ9iS2Z
         UEGUrjUGisH5nTtUYi/e4DuidkIQ991KCpyjJd8/CkA6Vn08ScJOtArwZ6K7oU0ZTpcH
         gASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eqb0FQEG710LFOVTd7yEl7tin1eRbeirJikh0ogVzXs=;
        b=HP7ARmWYbIvjIxifUteO4mEa9bLX04LnD4wr/5mJ1/9qmDv8K5Pt9FXqn/zZtrTBMb
         6DwWw1stvvpqG3KO05CDa1emSowJeZ3fr9T1P3Ymg1Is+zumdBd+FovPHjQwGJk9ak9s
         T0kKnvEEo27baIQNRicKCZW5ugAGvRNuFSieggAriAESm/Rmc2By/0pag/wi0eqap8mv
         OaBioPOGImuj0zmtz0bqxpRYMaDgmL/H+BRZEQtrRoSRuYYKHFW9LEmFnsrIyyRrHmXR
         nhUgHINpxuIMnkJgFXNexO2dveY2b/VsTCZ75GzpwlLifsKaiLFfPnS5jUytH+oqAc7g
         rv4Q==
X-Gm-Message-State: AOAM531PdeyDYXsKoa1KSdNfjmpsRuon/RgH2BbZYS0K4VfkyVJWxfU+
        jiVsxkMGVoUwajHTfKh1HTR7Iacha4lxOa/xkPSQzQ==
X-Google-Smtp-Source: ABdhPJy8V/ouw2lofMtSb/Jdw++5KWj9ruCBYLUqtDkkx9ZA4byJWPoR5Az0VDn+L4rTDLhOT5LbVZqAi5I9Yc52fww=
X-Received: by 2002:a1c:acc9:: with SMTP id v192mr665311wme.22.1612317361941;
 Tue, 02 Feb 2021 17:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com> <YBn81xAeCqHgudYb@google.com>
In-Reply-To: <YBn81xAeCqHgudYb@google.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 2 Feb 2021 17:55:50 -0800
Message-ID: <CAJuCfpEirOiisM-xouZB7JRBDpERdvWb2gfaq003+rs0b4M83Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: replace BUG_ON in vm_insert_page with a return of
 an error
To:     Minchan Kim <minchan@kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Liam Mark <lmark@codeaurora.org>, labbott@redhat.com,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        linux-media <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 2, 2021 at 5:31 PM Minchan Kim <minchan@kernel.org> wrote:
>
> On Tue, Feb 02, 2021 at 04:31:33PM -0800, Suren Baghdasaryan wrote:
> > Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> > WARN_ON_ONCE and returning an error. This is to ensure users of the
> > vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> > and get an indication of an error without panicing the kernel.
> > This will help identifying drivers that need to clear VM_PFNMAP before
> > using dmabuf system heap which is moving to use vm_insert_page.
> >
> > Suggested-by: Christoph Hellwig <hch@infradead.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/memory.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index feff48e1465a..e503c9801cd9 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -1827,7 +1827,8 @@ int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
> >               return -EINVAL;
> >       if (!(vma->vm_flags & VM_MIXEDMAP)) {
> >               BUG_ON(mmap_read_trylock(vma->vm_mm));
>
> Better to replace above BUG_ON with WARN_ON_ONCE, too?

If nobody objects I'll do that in the next respin. Thanks!

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
