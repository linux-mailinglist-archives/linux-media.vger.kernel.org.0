Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B9323C0BB
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 22:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgHDU1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 16:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgHDU1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 16:27:04 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6402FC061757
        for <linux-media@vger.kernel.org>; Tue,  4 Aug 2020 13:27:04 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id h16so11522505oti.7
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2020 13:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0F8rJxKPxKz2kW50sM0y8YM2E+x9jT63SdZPiQc6zzs=;
        b=H1OkZhq6MBz2mPG9yOilf7cdzsWYCtSOv60OIb+5hLEevjbdyWf7y6zN3c0E7hXpmz
         h5lFdwXRUFdjjKeYyzRJtXDM/RqOzDOyYo2ne5wLglfg9bXb9hPawWzSekTisfu8h1dX
         R7s/m3G0iFxouoE7x6KyzkmAX9u+BXsLebYBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0F8rJxKPxKz2kW50sM0y8YM2E+x9jT63SdZPiQc6zzs=;
        b=D0Rsj/ibDv+f+yvWHI2s+dvr0aHP/56cX7EgKoZVu+VTFJf2L/dLwtcIsv4Q2z+PQd
         DYGCI5rB0BkC/63pByUnrKRHp2txwI5w0JXW8LBGk21SgEF2Bkqf7KAVOXo9kR2jFK4t
         TCrnKSNAG0//UoRV7g/yJI1dnnXCjNn5kBCrP5Ijz7ACkqQibWWFYS47vn3Jlz4EDMbu
         IipyfXEy334/H6r5UhLXTkEate/lc76oOdG42uJ5R9YklJOsjc96FbpnPjiv7t50K+RX
         LID9o0yGiZpGfdnSLDdsCzNY6ykqZesW3ZokDVVNsFu5oSUO6mymd3vmUe8M6XC+/wPj
         x+GQ==
X-Gm-Message-State: AOAM530kliIml5qOyQlTNfm7NddmQ99eehVYhR46L002O2DTIooBrZ/Q
        DZhD0Z/2JNBrMfZYByk25iGmLEitNZ8YzY9rnE/G1A==
X-Google-Smtp-Source: ABdhPJxM2ghXnkojx/uwK1Wl/TqwXOe7oku/3H3udwDC+13SefY0iT978E6kQ/Oj5VS0nPAZGxZz1fIHsTOzPTz/qVk=
X-Received: by 2002:a05:6830:1e71:: with SMTP id m17mr20159797otr.188.1596572823562;
 Tue, 04 Aug 2020 13:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com> <20200803154125.GA23808@casper.infradead.org>
 <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
 <20200803161230.GB23808@casper.infradead.org> <CAJuCfpGot1Lr+eS_AU30gqrrjc0aFWikxySe0667_GTJNsGTMw@mail.gmail.com>
 <20200803222831.GI1236603@ZenIV.linux.org.uk>
In-Reply-To: <20200803222831.GI1236603@ZenIV.linux.org.uk>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 4 Aug 2020 22:26:52 +0200
Message-ID: <CAKMK7uE7V-0=2Z04-vkvFmExeEuKf5zihTO8su1GrHYy=sRKMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, linux-fsdevel@vger.kernel.org,
        Hridya Valsaraju <hridya@google.com>,
        Ioannis Ilkos <ilkos@google.com>,
        John Stultz <john.stultz@linaro.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 4, 2020 at 12:28 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Aug 03, 2020 at 09:22:53AM -0700, Suren Baghdasaryan wrote:
> > On Mon, Aug 3, 2020 at 9:12 AM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Mon, Aug 03, 2020 at 09:00:00AM -0700, Suren Baghdasaryan wrote:
> > > > On Mon, Aug 3, 2020 at 8:41 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > > >
> > > > > On Mon, Aug 03, 2020 at 02:47:19PM +0000, Kalesh Singh wrote:
> > > > > > +static void dma_buf_fd_install(int fd, struct file *filp)
> > > > > > +{
> > > > > > +     trace_dma_buf_fd_ref_inc(current, filp);
> > > > > > +}
> > > > >
> > > > > You're adding a new file_operation in order to just add a new tracepoint?
> > > > > NACK.
> > > >
> > > > Hi Matthew,
> > > > The plan is to attach a BPF to this tracepoint in order to track
> > > > dma-buf users. If you feel this is an overkill, what would you suggest
> > > > as an alternative?
> > >
> > > I'm sure BPF can attach to fd_install and filter on file->f_ops belonging
> > > to dma_buf, for example.
> >
> > Sounds like a workable solution. Will explore that direction. Thanks Matthew!
>
> No, it is not a solution at all.
>
> What kind of locking would you use?  With _any_ of those approaches.
>
> How would you use the information that is hopelessly out of date/incoherent/whatnot
> at the very moment you obtain it?
>
> IOW, what the hell is that horror for?  You do realize, for example, that there's
> such thing as dup(), right?  And dup2() as well.  And while we are at it, how
> do you keep track of removals, considering the fact that you can stick a file
> reference into SCM_RIGHTS datagram sent to yourself, close descriptors and an hour
> later pick that datagram, suddenly getting descriptor back?
>
> Besides, "I have no descriptors left" != "I can't be currently sitting in the middle
> of syscall on that sucker"; close() does *NOT* terminate ongoing operations.
>
> You are looking at the drastically wrong abstraction level.  Please, describe what
> it is that you are trying to achieve.

For added entertainment (since this is specifically about dma-buf) you
can stuff them into various gpu drivers, and convert to a native gpu
driver handle thing. That's actually the expected use case, first a
buffer sharing gets established with AF_UNIX, then both sides close
the dma-buf fd handle.

GPU drivers then internally cache the struct file so that we can hand
out the same (to avoid confusion when re-importing it on some other
driver), so for the case of dma-buf the "it's not actually an
installed fd anywhere for unlimited time" is actually the normal
use-case, not some odd corner.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
