Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45C5099042
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 12:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732874AbfHVKA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 06:00:56 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:41033 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732735AbfHVKAz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 06:00:55 -0400
Received: by mail-oi1-f170.google.com with SMTP id g7so3906506oia.8
        for <linux-media@vger.kernel.org>; Thu, 22 Aug 2019 03:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yWX7GJclJ6d1RGrDMSRF9mEMeylMroI/2X5Aj7URAPA=;
        b=eLDN0UKuldNXjfsCe8dQ+ljhSw9yf4uVqAbNecpIRA2vJr1jBdFY4Yq7GiL+L74ie6
         KLI7+gS92rywP89K81omJSWPCEg3ysw+1sMvanNjEceUfuU/xXqSShatXHlay1DyTFAS
         uGQzbV4f78H4uUxN16ujxKeYD0x9JVscq4e3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yWX7GJclJ6d1RGrDMSRF9mEMeylMroI/2X5Aj7URAPA=;
        b=MNzUoTW6WqEExzrYA+ZsLOmmA/FhCIyQt5tS3rcTzhMBCRp3D0yZWgG48rT6p2wvZj
         lFERuxLmtrSLY4j7J7EjKIppKTtRchopWETm8ALeV49e19FaJJv1VwsHDIz4ogompc9M
         WsfTf357jy6LNbKP1bPXn39Jvc/tdidjqbg/ninY+6BwuWYkOZlJ8XxJs56u3fJWYnF8
         Rmvsy8GBjUBmpbCy36XGMbJ2NUY+Feo2Dk+fqsVhYMkG/j58DN07Gd9StCFvLmZ+87sq
         DXy6x9M769AWSdU4MoEUAiH0HcNVsb/OC+bTh/x/Un84EiVYUsFq/kw8s0CbBMNU4O9E
         hKkw==
X-Gm-Message-State: APjAAAUnELKfj5ss/vga13cgzjbDo3JNBkxpK5BkxNlGDYmjnyiCXX2h
        U+d1AGrBGBcHtmXnBz9eYg5NLxpOYi/RmBLpqLUTa8zOdDg=
X-Google-Smtp-Source: APXvYqz/lfBf/IFhc68SjqSsMF+qGPUCGpwPEXfgqwTlcaU3Tysb9ERRWPDaMRby4XaiZfbZbeQres+rwXsG+LejO7g=
X-Received: by 2002:aca:b104:: with SMTP id a4mr3203183oif.14.1566468054402;
 Thu, 22 Aug 2019 03:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <156641829139.20466.3485292236947741339@skylake-alporthouse-com>
 <CAKMK7uFAreLt64Y9btk4VNxo6a2YMgXrg136z0uuyy5B3SMS+A@mail.gmail.com> <03244148-a560-47e2-e992-a3ea873e7bd1@gmail.com>
In-Reply-To: <03244148-a560-47e2-e992-a3ea873e7bd1@gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 22 Aug 2019 12:00:42 +0200
Message-ID: <CAKMK7uEjJL2mFaD5D60bVZGEJsKdYLfSxtmU67wibmRoTaNZRQ@mail.gmail.com>
Subject: Re: [RFC] replacing dma_resv API
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 22, 2019 at 11:14 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 21.08.19 um 22:22 schrieb Daniel Vetter:
> > On Wed, Aug 21, 2019 at 10:11 PM Chris Wilson <chris@chris-wilson.co.uk=
> wrote:
> >> Quoting Christian K=C3=B6nig (2019-08-21 13:31:37)
> >>> Hi everyone,
> >>>
> >>> In previous discussion it surfaced that different drivers use the sha=
red and explicit fences in the dma_resv object with different meanings.
> >>>
> >>> This is problematic when we share buffers between those drivers and r=
equirements for implicit and explicit synchronization leaded to quite a num=
ber of workarounds related to this.
> >>>
> >>> So I started an effort to get all drivers back to a common understand=
ing of what the fences in the dma_resv object mean and be able to use the o=
bject for different kind of workloads independent of the classic DRM comman=
d submission interface.
> >>>
> >>> The result is this patch set which modifies the dma_resv API to get a=
way from a single explicit fence and multiple shared fences, towards a nota=
tion where we have explicit categories for writers, readers and others.
> >> Fwiw, I would like the distinction here between optional fences
> >> (writers, readers) and mandatory fences (others). The optional fences
> >> are where we put the implicit fence tracking that clever userspace wou=
ld
> >> rather avoid. The mandatory fences (I would call internal) is where we
> >> put the fences for tracking migration that userspace can not opt out o=
f.
> > I think this would make sense, and is kinda what I expected here.
>
> Yeah, exactly that's the intention here.
>
> Basic idea is to group the fences into the categories of "you always
> need to wait for when doing implicit synchronization" (writers), "you
> only need to wait for them when you want to write to the object"
> (readers) and "ignore them for implicit synchronization".
>
> > If (and I think that's a huge if) we can agree on what those internal
> > fences are. There's a huge difference between internal fences for
> > buffer moves (better not ignore those) and internal fences like
> > amdkfd's eviction fence (better ignore those).
>
> Yeah, that's exactly why I want to get away from those exclusive/shared
> naming.

The bikeshed was epic. The idea behind exclusive/shared was that you
might want to ignore writers (like amdgpu does for internal buffers),
so shared doesn't necessarily mean it only contains readers, there
might also be writers in there. But only writers who are coordinating
their writes through some other means.

For writers the reason with going with exclusive was again the above,
that you might not want to put all writers into the exclusive slot
(amdgpu doesn't, at least for internal stuff). Also, some exclusive
fences might not be traditional writers, but other stuff like bo
moves.

But clearly amdkfd_eviction fence doesn't fit into this scheme. And on
the other hand we might want to have better rules to differentiate
between writers/reads for implicit sync and stuff the kernel does
more. Currently the rules are that you always have to sync with the
exclusive fence, since you have no idea why exactly it is exclusive -
it could be implicit sync, or it could be a bo move, or something else
entirely. At least for foreing fences.

For your own fences I don't think any of this matters, and essentially
you can treat them all as just an overall list of fences on your bo.
E.g. you could also treat the exlusive fence slot as a shared fence
slot for internal purposes, if the driver-internal semantics allow
that.

> For readers/writers I hoped the semantic would be more clear, but that's
> doesn't seems to be the case.
>
> > So whatever we do add, it better come with really clear docs and pretty=
 diagrams about what
> > it's supposed to do, and how it's supposed to be used. Or we're just
> > back to the current mess we're in, times two.
>
> Well documenting it in the end is clearly a good idea, but I don't think
> we should start with that before we actually know what we want to
> implement and how we want to implement it.
>
> Otherwise I would write tons of documentation which can be thrown away
> again in the end because we decided to don't do it this way.

Yeah there's a bit a problem there. So for your RFC I guess the main
goal is the "other" bucket, which is both going to be a huge bikeshed
(not again ...) but also real tricky to figure out the semantics. If
the goal with "other" is to use that for bo moves, and not for
amdkfd_eviction (that one I feel like doesn't fit, at least amdgpu
code tends to ignore it in many cases), then maybe we should call it
kernel_exclusive? Or something else that indicates it's a level above
the normal exclusive, kinda usual user/kernel split. And if you ignore
the kernel_exclusive fence then the kernel will break (and not just
some data corruption visible to userspace).

Or is there something else you want to clear up? I mean aside from the
reader/writer vs exlusive/shared thing, imo that's easier to decided
once we know what "other" is exactly like.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
