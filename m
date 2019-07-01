Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 041003D0F3
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 17:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405056AbfFKPfo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 11:35:44 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42749 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405043AbfFKPfn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 11:35:43 -0400
Received: by mail-pg1-f194.google.com with SMTP id l19so4572453pgh.9
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8h42m3mke7DA8ejB89qFnTkC5cX+aLshhHC5jTwYOa4=;
        b=sLMq+bA6sOUYAuoQSdZze7aS/o01HRJh37fgBzOaTlULVRlgN1Pzky0WnEt9ggPhRi
         JH1qa8PI3fUsxopnA8vxXjk80emL0gwgHoi/kN+wCfZhW7CtGG3mN+/yxVY59EUBa1rS
         M4cxQ83xr93VSRZJzwzbUXprtAi+dT3meCk3L8KOZ/xZDFb/kZqFJzv63133Zz0lw9er
         v1LYil8+krDw44YMHLuvpYAB34RsEpHwQbuoHBJWYMzgMu6DfV6usjm0aFv9/2YjnuNW
         tz3JzLRCLMzdWSO9grr5tL4TPlHUr6KXqW3Th206n5IMIeoSFDjvZhgTeHCUKYHlgpUu
         bTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8h42m3mke7DA8ejB89qFnTkC5cX+aLshhHC5jTwYOa4=;
        b=PakqJQZgg0B8Hbhu3TSnnrsX/ZwKGnAAm7KLCPa0TYFeIjPbeCAg3fX66Zq8s/uk/L
         pRguNgpkXxlSbFutoEmuDpJHbco3b16YmubuIJ9sDJdemZxvz2Pax3uwe0URbUvjqun6
         pn+XFAWBrLODJXfh07keyb8CP+u6bXLTLmCtmBKE5/YrW1pBCs/jjkj01lVDkJjGZmWS
         nZJgS1mi4pmvzU/uYEEi+AF2CJ8PYjRYEkKW9dJYWMj+XsV1EuOKGuMQZXYVczOpvPiD
         /oGYXs85yNuP0L8/YOefwvnV34NlTQTHaes/UJTaX3dZvI4m7vH7VuD0umHtv9t9EwWE
         Y4VQ==
X-Gm-Message-State: APjAAAUHb3ypOue+54VBy57WFp8D8aEvSKL+J7XPTVFjmafJx0c0QwZe
        W20bdQoCInSsmm569jEyr+XbrVdVsMdpASS//lqTeQ==
X-Google-Smtp-Source: APXvYqwVttVVtet3fqIi0VnES8Ilb/p6V60nSXc7x8WFpoZ7Ynv9ahn+wWxWGukqfJnR2JBKBovfx92r2kGjPnyP20Q=
X-Received: by 2002:a63:1919:: with SMTP id z25mr21205093pgl.440.1560267342622;
 Tue, 11 Jun 2019 08:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com> <045a94326401693e015bf80c444a4d946a5c68ed.1559580831.git.andreyknvl@google.com>
 <20190610142824.GB10165@c02tf0j2hf1t.cambridge.arm.com>
In-Reply-To: <20190610142824.GB10165@c02tf0j2hf1t.cambridge.arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 11 Jun 2019 17:35:31 +0200
Message-ID: <CAAeHK+zBDB6i+iEw+TJY14gZeccvWeOBEaU+otn1F+jzDLaRpA@mail.gmail.com>
Subject: Re: [PATCH v16 05/16] arm64: untag user pointers passed to memory syscalls
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
        kvm@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Khalid Aziz <khalid.aziz@oracle.com>, enh <enh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 10, 2019 at 4:28 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Mon, Jun 03, 2019 at 06:55:07PM +0200, Andrey Konovalov wrote:
> > This patch is a part of a series that extends arm64 kernel ABI to allow to
> > pass tagged user pointers (with the top byte set to something else other
> > than 0x00) as syscall arguments.
> >
> > This patch allows tagged pointers to be passed to the following memory
> > syscalls: get_mempolicy, madvise, mbind, mincore, mlock, mlock2, mprotect,
> > mremap, msync, munlock.
> >
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
>
> I would add in the commit log (and possibly in the code with a comment)
> that mremap() and mmap() do not currently accept tagged hint addresses.
> Architectures may interpret the hint tag as a background colour for the
> corresponding vma. With this:

I'll change the commit log. Where do you you think I should put this
comment? Before mmap and mremap definitions in mm/?

Thanks!

>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>
> --
> Catalin
