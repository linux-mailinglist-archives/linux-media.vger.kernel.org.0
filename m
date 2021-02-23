Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13483223CB
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 02:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhBWBnk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 20:43:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbhBWBni (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 20:43:38 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1903C06178A
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 17:42:57 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id r23so61342704ljh.1
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 17:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RDooO6fVmEytrmsO+OdxP0t5z+1dW14dWuhPYDbhrNw=;
        b=TOQ2+I+mHXr+E4ckMqzQngYTWUZIiJAMZ4kPqTle0k554YS65ZycN+V9HItvfQ50zr
         EZoT+MbgL+/zfMBRgcqu5UVoaIVwhD+SMKXUFtegjKSZY4TW2k7+/++d/M+F9xtNPSR4
         QNS7Z4Yl0m5J+4tzYKAjfLF5jYN/rQ/3C6zUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RDooO6fVmEytrmsO+OdxP0t5z+1dW14dWuhPYDbhrNw=;
        b=C7eFt7+iIAB1UtbsSxC1esK9daimZxikMz/yMhwZzaBr6v4bbjH/ExbGimMn4TQwgn
         Zb+yjOoVmGGp+zF9+y965c74+GD/SUFnQ2t2AyJhqF2efrr7bovsJaXaUooWJKTDY4Pf
         i5MNzY0xSHILdDMtz0QIvOeWJ6R+hLDaKGLFTLWA9gm03105gOUnwHcldJ+jBuUn7IF4
         UHNORcSeaIUcGYqKo4OobYZORNlm84XGjCxS73vxvHteLYgpOlVoQh0ZTSe6U2W51ki0
         DMFGgsEINv9Y7xuNSb+67065TriOMsTWQgSlj7aO026208f7OholeJRT1fBAoUAbhr31
         J8zQ==
X-Gm-Message-State: AOAM533XGoWDF//zt/8N4F/ZszigPzOcOv9nhLSrWYB/UfTXMhaAvPM0
        KkQPS6wz+w2eivYFaIjDMF3C3xgLnGyjqA==
X-Google-Smtp-Source: ABdhPJy1yjKaxxkgF3XOdLDW8kP/gGoA3KEBrpcR+6AXDImhDW8C0lH1pyLCfIkjBysaaJILuqPDxQ==
X-Received: by 2002:a2e:a550:: with SMTP id e16mr15117800ljn.264.1614044575223;
        Mon, 22 Feb 2021 17:42:55 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id c123sm2242543lfd.95.2021.02.22.17.42.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 17:42:54 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id h26so8921819lfm.1
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 17:42:54 -0800 (PST)
X-Received: by 2002:a19:6916:: with SMTP id e22mr14384009lfc.421.1614044573962;
 Mon, 22 Feb 2021 17:42:53 -0800 (PST)
MIME-Version: 1.0
References: <YDOGERvNuU3+2WWe@phenom.ffwll.local> <CAKMK7uHQ=6OJcRguCUtiB456RWdCfwSNEXV8pQsfsPodTJ6uxw@mail.gmail.com>
In-Reply-To: <CAKMK7uHQ=6OJcRguCUtiB456RWdCfwSNEXV8pQsfsPodTJ6uxw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 22 Feb 2021 17:42:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjNv9izaVO5+1n5zk01zP3mndqdd2zKsX_syq9ntgY2YQ@mail.gmail.com>
Message-ID: <CAHk-=wjNv9izaVO5+1n5zk01zP3mndqdd2zKsX_syq9ntgY2YQ@mail.gmail.com>
Subject: Re: [PULL] fixes around VM_PFNMAP and follow_pfn for 5.12 merge window
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux MM <linux-mm@kvack.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 22, 2021 at 2:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Cc all the mailing lists ... my usual script crashed and I had to
> hand-roll the email and screwed it up ofc :-/

Oh, and my reply thus also became just a reply to you personally.

So repeating it here, in case somebody has comments about that
access_process_vm() issue.

On Mon, Feb 22, 2021 at 2:23 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> I've stumbled over this for my own learning and then realized there's a
> bunch of races around VM_PFNMAP mappings vs follow pfn.
>
> If you're happy with this [..]

Happy? No. But it seems an improvement.

I did react to some of this: commit 0fb1b1ed7dd9 ("/dev/mem: Only set
filp->f_mapping") talks about _what_ it does, but not so much _why_ it
does it. It doesn't seem to actually matter, and seems almost
incidental (because you've looked at f_mapping and i_mapping just
didn't matter but was adjacent.

And generic_access_phys() remains horrific. Does anything actually use
this outside of the odd magical access_remote_vm() code?

I'm wondering if that code shouldn't just be removed entirely. It's
quite old, I'm not sure it's really relevant. See commit 28b2ee20c7cb
("access_process_vm device memory infrastructure").

I guess you do debug the X server, but still.. Do you actually ever
look at device memory through the debugger? I'd hope that you'd use an
access function and make gdb call it in the context of the debuggee?

Whatever. I've pulled it, and I'm not _unhappy_ with it, but I'd also
not call myself overly giddy and over the moon happy about this code.

             Linus
