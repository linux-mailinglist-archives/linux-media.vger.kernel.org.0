Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEFF1D2E81
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 13:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgENLjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 07:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgENLjG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 07:39:06 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A91C061A0C;
        Thu, 14 May 2020 04:39:05 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id c83so643535oob.6;
        Thu, 14 May 2020 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZSwtCexk9nrc5wXHZb6xl7x3Ukus0pVklq+X0lXtP9M=;
        b=q8byuDEV/HBaHutEfKPBCsOyJyKXLTe4fdppUu5YAyVeuJZ/cfy0kQWEcbAeRjIVy6
         AZkToLQ6x/5AVr9U+gRwDb9fIvkuXhFu+VIWabcrx71puBIQSHn8hH7/T08WuZAGb2B7
         Yn2cYkz3VxMdDJbOOAyk7jH906xTaQoGoFsaxjiRg+KFqP1wIS1AldxFzTqZs2TIC8F3
         HdlclyNH5C5/2cRr3L16eW33oGDt2+ZZuwoot7brtKW68FMdUhy5Vm/2oO1mPQ2NKV8s
         yuUbUGhQxHy2Dmp+DUlMBgnV8IwEZIzwfAfefoJkjWWveDDJSK548DuLRV7v6Pqr5Zw0
         Rb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZSwtCexk9nrc5wXHZb6xl7x3Ukus0pVklq+X0lXtP9M=;
        b=GyP6RAwYDOtM+3PHRAcfKsm43Z6NW3oa8fItvWLIaRsxlfuJxoSsxhBWeba2Gw77C/
         uFjRleKQKXh/EPL1c1gddIp5L8XwsBrBE1SWp1a/CtsBzcvqUmqL5GgQoWBP+8xaK0rq
         T8RSRWKv0mOJkCA0jhxAX7zuSyz+3WSmf4aId+Go2scos+aObo1r1iYdnByP2colVfNQ
         gMI9rvGDfDFsPz/teHyLPh34TRT5OK/1Xqlmvui6OkxetfclZ7m2CrDwlYPbOZKQfucx
         oeRK4UQNPRXdv0yx/Ms3UdsG1EmlutByhEU39Mo0WvH2EyRKe9IvWdAa1Adib4kIlEC0
         2OkQ==
X-Gm-Message-State: AOAM53091IgKJ0NF6oUEpQVcQru4eywk1sv5BiVv2EGgX2Z/sKHzf7Lx
        FsTurW0a2vljfcQ8NReN8Ru2adAsPL9i3Yk/qEc=
X-Google-Smtp-Source: ABdhPJzpF/j77VZ1mUAB6oImvLDs5y+yw8Ffqf9KnZIjayJc7xQ/fTQmYbxSeR6K0/KuM1T7We9orB4e+Fb4bfMi4ag=
X-Received: by 2002:a4a:a50e:: with SMTP id v14mr3145833ook.27.1589456345130;
 Thu, 14 May 2020 04:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-3-daniel.vetter@ffwll.ch> <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
 <CAPM=9tyukFdDiM6-Mxd+ouXCt9Z4t6LRZwxq7DGoX9drrHnMdQ@mail.gmail.com> <CAKMK7uF=SzeEBtZ9xH+jPzeML4V0QQuwBnPVw+OL+MUgTaaLzQ@mail.gmail.com>
In-Reply-To: <CAKMK7uF=SzeEBtZ9xH+jPzeML4V0QQuwBnPVw+OL+MUgTaaLzQ@mail.gmail.com>
From:   Oded Gabbay <oded.gabbay@gmail.com>
Date:   Thu, 14 May 2020 14:38:38 +0300
Message-ID: <CAFCwf110j5EDNH9nvrVX9fQ5JkEt5B217snyiTyfpFz8yAkxNg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] misc/habalabs: don't set default fence_ops->wait
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Dave Airlie <airlied@gmail.com>,
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

On Tue, May 12, 2020 at 9:12 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Tue, May 12, 2020 at 4:14 AM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Mon, 11 May 2020 at 19:37, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> > >
> > > On Mon, May 11, 2020 at 12:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > It's the default.
> > > Thanks for catching that.
> > >
> > > >
> > > > Also so much for "we're not going to tell the graphics people how to
> > > > review their code", dma_fence is a pretty core piece of gpu driver
> > > > infrastructure. And it's very much uapi relevant, including piles of
> > > > corresponding userspace protocols and libraries for how to pass these
> > > > around.
> > > >
> > > > Would be great if habanalabs would not use this (from a quick look
> > > > it's not needed at all), since open source the userspace and playing
> > > > by the usual rules isn't on the table. If that's not possible (because
> > > > it's actually using the uapi part of dma_fence to interact with gpu
> > > > drivers) then we have exactly what everyone promised we'd want to
> > > > avoid.
> > >
> > > We don't use the uapi parts, we currently only using the fencing and
> > > signaling ability of this module inside our kernel code. But maybe I
> > > didn't understand what you request. You want us *not* to use this
> > > well-written piece of kernel code because it is only used by graphics
> > > drivers ?
> > > I'm sorry but I don't get this argument, if this is indeed what you meant.
> >
> > We would rather drivers using a feature that has requirements on
> > correct userspace implementations of the feature have a userspace that
> > is open source and auditable.
> >
> > Fencing is tricky, cross-device fencing is really tricky, and having
> > the ability for a closed userspace component to mess up other people's
> > drivers, think i915 shared with closed habana userspace and shared
> > fences, decreases ability to debug things.
> >
> > Ideally we wouldn't offer users known untested/broken scenarios, so
> > yes we'd prefer that drivers that intend to expose a userspace fencing
> > api around dma-fence would adhere to the rules of the gpu drivers.
> >
> > I'm not say you have to drop using dma-fence, but if you move towards
> > cross-device stuff I believe other drivers would be correct in
> > refusing to interact with fences from here.
>
> The flip side is if you only used dma-fence.c "because it's there",
> and not because it comes with an uapi attached and a cross-driver
> kernel internal contract for how to interact with gpu drivers, then
> there's really not much point in using it. It's a custom-rolled
> wait_queue/event thing, that's all. Without the gpu uapi and gpu
> cross-driver contract it would be much cleaner to just use wait_queue
> directly, and that's a construct all kernel developers understand, not
> just gpu folks. From a quick look at least habanalabs doesn't use any
> of these uapi/cross-driver/gpu bits.
> -Daniel

Hi Daniel,
I want to say explicitly that we don't use the dma-buf uapi parts, nor
we intend to use them to communicate with any GPU device. We only use
it as simple completion mechanism as it was convenient to use.
I do understand I can exchange that mechanism with a simpler one, and
I will add an internal task to do it (albeit not in a very high
priority) and upstream it, its just that it is part of our data path
so we need to thoroughly validate it first.

Thanks,
Oded
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
