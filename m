Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98011383A07
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 18:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242074AbhEQQfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 12:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245221AbhEQQfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 12:35:34 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 933C5C0610FE
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 08:29:47 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so5868492oth.8
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LHuA8eHjuppTIJ75R7cv3VweFNbwB4dqcEtg7HA60qg=;
        b=RMks6CV9lAVCFBcqyvaL15OwQDYYydA46ie8ERZRUW9bdz6Ss2d63nvntdd2ppylbj
         TT1hoAtcrCR7P1QUgAoKu41mbQqWIXoRN7jJxyGntT0uCWz/IiczJZV24UwIWC7mZW89
         iDl7tmzK3OcYBBXrYUDYJ/OJrz6o9/5h4ij88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LHuA8eHjuppTIJ75R7cv3VweFNbwB4dqcEtg7HA60qg=;
        b=FgxBZbOMIH6m8XldEyzDXu/GLV3MxBXU9okwZ3NgxU153xEvGVwqkm9FK+xS0dCgHl
         fN891QK8OldoBIgjI/fhMfg/A3GmQ93c2ivLhJuWf+gKsAsoGdETUjHjXO3ZzkZvUy14
         Xnxu5bXd/ksJpW4sdtet5hz1BpQEk8fYAFX4XDsF+beJMlPGkCM4pX1H1afJLe9NxY5j
         0T0uLA7/kAATt5BDl+UelmpnFDqcBYr8VnEw7eKWzj8RH+K86DyUhx37w59H4CsK+xyP
         /C3TkpPSWTK+LmfxrUUeS2ohn7Q3UUZgHtOhSh2hvPPWL8emmUdvJsZeEzZ+8dONqObS
         w2Nw==
X-Gm-Message-State: AOAM531RS8D7Is7Ve68lytQJis+cmRInJbGXXmZV9xxqAvau7FkmqAFZ
        lZyyNZ1g1m1Oc65R3YFBCBfZs5oik+RZ94IvE40m2g==
X-Google-Smtp-Source: ABdhPJyx4VgXyr7sHxhLzHJfU08wfDCFYrZOk1+l9hfQuvBlJV+AtL3GicGrv7/C44z5A3YFPk7MxSeP6Ot3b+xUVts=
X-Received: by 2002:a05:6830:1155:: with SMTP id x21mr88425otq.303.1621265387064;
 Mon, 17 May 2021 08:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <YJBHiRiCGzojk25U@phenom.ffwll.local> <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local> <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
 <CAKMK7uELBbkhFBQoSfvMx+AKnbk-fgbamBm3sC20-dJwMq3Xmg@mail.gmail.com> <YJjg3DRnG1RG6VDK@infradead.org>
In-Reply-To: <YJjg3DRnG1RG6VDK@infradead.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 17 May 2021 17:29:35 +0200
Message-ID: <CAKMK7uFsRPod-tAJ8ZrzXM6B_+5VgvRs-U0_TiG75da62cnVnw@mail.gmail.com>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To:     Christoph Hellwig <hch@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 10, 2021 at 9:30 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, May 10, 2021 at 09:16:58AM +0200, Daniel Vetter wrote:
> > > End result: not pulling it, unless somebody can explain to me in small
> > > words why I'm wrong and have the mental capacity of a damaged rodent.
> >
> > No rodents I think, just more backstory of how this all fits. tldr;
> > pin_user_pages is the only safe use of this vb2 userptr thing.
>
> Yes, which is why I advocate for just ripping the follow_pfn path
> out entirely.  It could have been used for crazy ad dangerous peer to
> peer transfers outside of any infrastructure making it safe, or for
> pre-CMA kernel memory carveouts for lage contiguous memory allocations
> (which are pretty broken by design as well).  So IMHO the only sensible
> thing is to remove this cruft entirely, and if it breaks a currently
> working setup (which I think is unlikely) we'll have to make sure it
> can work the proper way.

Since I'm not getting any cozy consenus vibes here on any option I
think I'll just drop this.

Stephen, can you pls drop

git://anongit.freedesktop.org/drm/drm topic/iomem-mmap-vs-gup

from linux-next? It's not going anywhere. I'll also go ahead and
delete the branch, to make sure you catch this update :-)

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
