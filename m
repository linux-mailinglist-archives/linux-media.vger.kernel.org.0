Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63EDD30C9B7
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 19:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238514AbhBBS06 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 13:26:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238391AbhBBSYp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 13:24:45 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E079EC061573
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 10:24:04 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 190so3379177wmz.0
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 10:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MgieW2mFRkLjVmzEdO+rCy5IuyzB9BYZea1yZZDisDU=;
        b=ThwOimmnlbRD7ClelZlSvTTMvrt4/HBr3aKX0vqL4pluYtd4RcmqyXdbjWm3rmmvfO
         XaDBvZZesrQSJj0dn68mkh+pkniH4hIco+w5W/cj0fyIu3v2ZKHgIQiwJ0UWRvpEDB+0
         4gDej/5zHg+ssFLGrlXUpoo8MD2YiPyjPXHRsUYDAJknZASEzx3DA6dAw05cbHWK/09m
         AmXlZbqcBmp9fLBzac3W3VL6rNZfAcUyp/FkgcwxvWR5tJ+DOkphAmx5i80lVINqt2e3
         WzXD5H5PIsTrl6s9CmK99hscu3ecC8QiG4oKiZdFWOqznB+xrTj9bvVPgAIYpI37oTGQ
         DpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MgieW2mFRkLjVmzEdO+rCy5IuyzB9BYZea1yZZDisDU=;
        b=JJUeGxX0+QWdb343ggCs55s4sMavf5WSmDzL6BzMNcq9h7h0Xf5lTAoFgl1BmkumQw
         bT2JHLk0JcxYb0ajEkFZBC9Cs7BG4HHW8A2PuJ8K6g8SCPAEhbn9u7oJo5B7E04GuNXF
         NlKDGoe92SD/1pv+xCbwwNh59Zvw74SlVm8hJOOrtXR4Hl33fGkYtokC/zl+2Wrt9wjx
         hsiK/uReWiwk+oSHmVe8rF92glkpF+wfmhdoooN+aFkOLTmrvmUS+gNPdAb9qFsl96af
         79RJiHq7aR1Y4yl7iqsh4TMjR954l+7nrkkaYZunNCZ8L5nGtQNjuf4m72TerG/CJcRw
         HkoA==
X-Gm-Message-State: AOAM533Aicq7tpCkmKZHE8jaGHz3wUb90yIAWpA1xnJxNOjzBC5Ho8rL
        nPYEPbVPfVzoDl591PsDiQbT9BmI8++Ab7z0RTc/dw==
X-Google-Smtp-Source: ABdhPJxyWbsmgA9sTq5DVu4oskgnl1milGSq73HSrJ4cKCCbs2f7IWzxeKS8co+5qhzF2K7w7UV8O69zhWPTCyWzYw8=
X-Received: by 2002:a05:600c:4e92:: with SMTP id f18mr4736926wmq.126.1612290243428;
 Tue, 02 Feb 2021 10:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20210128083817.314315-1-surenb@google.com> <20210128091348.GA1962975@infradead.org>
 <CAJuCfpFUhJozS98WJpH0KQKBzyGXvqS1fitu-mgSyhaJ1xL8SQ@mail.gmail.com>
 <YBMAGRIwcbPF17cU@google.com> <CAJuCfpF78RYedBoAgkDdgMdfSmNwC2AQk-zZxAqkhCdtBB9gtQ@mail.gmail.com>
 <CAJuCfpH5nwvtMR+32G0-xa_hY-b_Hnw=Figqq9xcsTGgJhOiww@mail.gmail.com>
 <20210202070336.GA3535861@infradead.org> <CAJuCfpHWVcL1Cw=nm4THf0EzEan0jyVgLRNOdKr2ZbXex3DUcg@mail.gmail.com>
 <20210202085114.GA3562876@infradead.org>
In-Reply-To: <20210202085114.GA3562876@infradead.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 2 Feb 2021 10:23:52 -0800
Message-ID: <CAJuCfpEfJEnzzr6dKZGTyVmQGZMmZBVTR+M4RsbZXjeGzFe8Gw@mail.gmail.com>
Subject: Re: [PATCH 1/1] dma-buf: heaps: Map system heap pages as managed by
 linux vm
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Minchan Kim <minchan@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "(Exiting) Benjamin Gaignard" <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>, labbott@redhat.com,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        "Christian K??nig" <christian.koenig@amd.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        "??rjan Eide" <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        linux-media <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 2, 2021 at 12:51 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Feb 02, 2021 at 12:44:44AM -0800, Suren Baghdasaryan wrote:
> > On Mon, Feb 1, 2021 at 11:03 PM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > IMHO the
> > >
> > >         BUG_ON(vma->vm_flags & VM_PFNMAP);
> > >
> > > in vm_insert_page should just become a WARN_ON_ONCE with an error
> > > return, and then we just need to gradually fix up the callers that
> > > trigger it instead of coming up with workarounds like this.
> >
> > For the existing vm_insert_page users this should be fine since
> > BUG_ON() guarantees that none of them sets VM_PFNMAP.
>
> Even for them WARN_ON_ONCE plus an actual error return is a way
> better assert that is much developer friendly.

Agree.

>
> > However, for the
> > system_heap_mmap I have one concern. When vm_insert_page returns an
> > error due to VM_PFNMAP flag, the whole mmap operation should fail
> > (system_heap_mmap returning an error leading to dma_buf_mmap failure).
> > Could there be cases when a heap user (DRM driver for example) would
> > be expected to work with a heap which requires VM_PFNMAP and at the
> > same time with another heap which requires !VM_PFNMAP? IOW, this
> > introduces a dependency between the heap and its
> > user. The user would have to know expectations of the heap it uses and
> > can't work with another heap that has the opposite expectation. This
> > usecase is purely theoretical and maybe I should not worry about it
> > for now?
>
> If such a case ever arises we can look into it.

Sounds good. I'll prepare a new patch and will post it later today. Thanks!
