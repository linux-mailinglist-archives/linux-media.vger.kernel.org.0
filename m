Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23DFD1CECDB
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 08:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgELGM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 02:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725933AbgELGMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 02:12:24 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77932C061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 23:12:23 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id v17so1661833ote.0
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 23:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rDVhfwcqSVyx9q5/p16CBADSN5ABq1zW6fY3UNoJRwE=;
        b=GJU6+oDml8xnoT95xGt/51ibXnSnWHbS6L44A1d4aAxTIhM+TRN0GsMjxc6tOiQxij
         W1HgnyhjOqVZ4EeXD2+Ya67BUUhQZNpILTKhwGGkEyj+lgqcYywNl95I6T/MARS6UR7u
         VIlXBE4FZi1iC3oSuefMY08HMZx+TFAs4C+u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rDVhfwcqSVyx9q5/p16CBADSN5ABq1zW6fY3UNoJRwE=;
        b=R7zg2H7HOwEQZtjThfyLQjBENxKndFwy/KoQY9wuF0BBtbBmNl1B0g9Yf/2TGnb3X2
         o5TTmCaBkUeMTqwxOP4JsOiRJTqcw4/XESbUq7ZP2tHctAL86Fvy/ASqv0kJmVcg+Acm
         c6Yf0niTlp3rFvu9YeKTZh84d63QWS3XLWOK7oitVixSm2Z8He5O82QORoKK0xaHt5yI
         FUw4WtIyHeJ5fhCN1/8RnTxJnGqfvnJIwZs5e/KolJWweJNrnjvDRAF7yp4MgSwbMjZz
         ZCn5D4j8zjWZUDBG7IBFv4F8qNsHpjmvTZ3Bem55xPHpbP74c5eNt9/shSOi84l3zgoz
         mP2g==
X-Gm-Message-State: AGi0PuZbzcamEWMQXjbe/Mg/z3imOCSyMUy846Nlw1OsguINP331DrRV
        6vyDhNToLzQGCYmHu4qEC03mB/DHiI1T1DVqQVcJvw==
X-Google-Smtp-Source: APiQypJhNRGRhinzAhGDFhJNon3eFMcfMUO5uhBHXbuwUw5/kLPwp8toKCD2lNCnnnIIniHhPlp9X7sj/2mlYxXCY6k=
X-Received: by 2002:a05:6830:1d0:: with SMTP id r16mr14792604ota.303.1589263942718;
 Mon, 11 May 2020 23:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-3-daniel.vetter@ffwll.ch> <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
 <CAPM=9tyukFdDiM6-Mxd+ouXCt9Z4t6LRZwxq7DGoX9drrHnMdQ@mail.gmail.com>
In-Reply-To: <CAPM=9tyukFdDiM6-Mxd+ouXCt9Z4t6LRZwxq7DGoX9drrHnMdQ@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 12 May 2020 08:12:11 +0200
Message-ID: <CAKMK7uF=SzeEBtZ9xH+jPzeML4V0QQuwBnPVw+OL+MUgTaaLzQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] misc/habalabs: don't set default fence_ops->wait
To:     Dave Airlie <airlied@gmail.com>
Cc:     Oded Gabbay <oded.gabbay@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Olof Johansson <olof@lixom.net>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 12, 2020 at 4:14 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Mon, 11 May 2020 at 19:37, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> >
> > On Mon, May 11, 2020 at 12:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > It's the default.
> > Thanks for catching that.
> >
> > >
> > > Also so much for "we're not going to tell the graphics people how to
> > > review their code", dma_fence is a pretty core piece of gpu driver
> > > infrastructure. And it's very much uapi relevant, including piles of
> > > corresponding userspace protocols and libraries for how to pass these
> > > around.
> > >
> > > Would be great if habanalabs would not use this (from a quick look
> > > it's not needed at all), since open source the userspace and playing
> > > by the usual rules isn't on the table. If that's not possible (because
> > > it's actually using the uapi part of dma_fence to interact with gpu
> > > drivers) then we have exactly what everyone promised we'd want to
> > > avoid.
> >
> > We don't use the uapi parts, we currently only using the fencing and
> > signaling ability of this module inside our kernel code. But maybe I
> > didn't understand what you request. You want us *not* to use this
> > well-written piece of kernel code because it is only used by graphics
> > drivers ?
> > I'm sorry but I don't get this argument, if this is indeed what you meant.
>
> We would rather drivers using a feature that has requirements on
> correct userspace implementations of the feature have a userspace that
> is open source and auditable.
>
> Fencing is tricky, cross-device fencing is really tricky, and having
> the ability for a closed userspace component to mess up other people's
> drivers, think i915 shared with closed habana userspace and shared
> fences, decreases ability to debug things.
>
> Ideally we wouldn't offer users known untested/broken scenarios, so
> yes we'd prefer that drivers that intend to expose a userspace fencing
> api around dma-fence would adhere to the rules of the gpu drivers.
>
> I'm not say you have to drop using dma-fence, but if you move towards
> cross-device stuff I believe other drivers would be correct in
> refusing to interact with fences from here.

The flip side is if you only used dma-fence.c "because it's there",
and not because it comes with an uapi attached and a cross-driver
kernel internal contract for how to interact with gpu drivers, then
there's really not much point in using it. It's a custom-rolled
wait_queue/event thing, that's all. Without the gpu uapi and gpu
cross-driver contract it would be much cleaner to just use wait_queue
directly, and that's a construct all kernel developers understand, not
just gpu folks. From a quick look at least habanalabs doesn't use any
of these uapi/cross-driver/gpu bits.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
