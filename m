Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5354C1DBC42
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 20:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgETSFC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 14:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgETSFC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 14:05:02 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1DEC061A0E
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 11:05:00 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so4089458wra.7
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 11:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=7VLWQjSGehoQQ10TIMLPZjQP7xmwIhJsBUGDoa1VrTI=;
        b=Gkqd7eG/0dnXjHy1xG1j6m7TgceuOsXw1H/rc22l7IJlPhwJ2B6P2ljAHXrYzTRdar
         MIaXDobt3I0ohzfnM8+IrTc0qKhgEUwuY7/Fo9s2GXiixg4EmEP6C4/NiXdh9NUFhFJv
         EkITnRLky4apVZDMRRGPfnmoIfrxMMPEjnOeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=7VLWQjSGehoQQ10TIMLPZjQP7xmwIhJsBUGDoa1VrTI=;
        b=RVfvQxsn+rxSKot0xCWUvULpXQtHInHVlzibCjLLXtBYOHQTVrpXUAVCtT31OQcV2C
         eZ+1p4gBgcZEXwpwrlYu+Rn6h7rGfGXcTswjyvYLb7QRN1GJy9co4pe/BctTd716BOzA
         5BWfthMaBhND4JZa+EHE1XQwNm88C6n+curb53qDkdvyc7fh/RJ9Jln4B6wpjQAOPNkd
         nYydYJFILXgfrgqtxW2bcMmb72tnFxjg01ezAa9tNPzvbkiDKZjivTGcKgwxx8z1n9Kf
         Qsins6aymUNHSGjxQE4rj41YYQfDvjiL/EF+U0TkpfZFu3eBqSQhAEaYPmDbskkvE/P7
         nvHg==
X-Gm-Message-State: AOAM533S4IAV0qxJQKI3bBIuLW4eVUGdgkgrBCoozzjlsmArX82kATRI
        SUVwik0R4XWwnso+vDXMriYX8g==
X-Google-Smtp-Source: ABdhPJyS/wpov4LAbGyHkjwZQ9PTa7H2uWj92iFIX5HPBrejAjzuIvVfeVBaSJI7TyMuvzzPHXcGHg==
X-Received: by 2002:adf:ec87:: with SMTP id z7mr5634315wrn.149.1589997899278;
        Wed, 20 May 2020 11:04:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b12sm4040708wmj.0.2020.05.20.11.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 11:04:58 -0700 (PDT)
Date:   Wed, 20 May 2020 20:04:56 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Oded Gabbay <oded.gabbay@gmail.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Dave Airlie <airlied@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Olof Johansson <olof@lixom.net>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Intel-gfx] [PATCH 3/3] misc/habalabs: don't set default
 fence_ops->wait
Message-ID: <20200520180456.GC206103@phenom.ffwll.local>
Mail-Followup-To: Oded Gabbay <oded.gabbay@gmail.com>,
        Dave Airlie <airlied@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-3-daniel.vetter@ffwll.ch>
 <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
 <CAPM=9tyukFdDiM6-Mxd+ouXCt9Z4t6LRZwxq7DGoX9drrHnMdQ@mail.gmail.com>
 <CAKMK7uF=SzeEBtZ9xH+jPzeML4V0QQuwBnPVw+OL+MUgTaaLzQ@mail.gmail.com>
 <CAFCwf110j5EDNH9nvrVX9fQ5JkEt5B217snyiTyfpFz8yAkxNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf110j5EDNH9nvrVX9fQ5JkEt5B217snyiTyfpFz8yAkxNg@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 14, 2020 at 02:38:38PM +0300, Oded Gabbay wrote:
> On Tue, May 12, 2020 at 9:12 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Tue, May 12, 2020 at 4:14 AM Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > On Mon, 11 May 2020 at 19:37, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> > > >
> > > > On Mon, May 11, 2020 at 12:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > >
> > > > > It's the default.
> > > > Thanks for catching that.
> > > >
> > > > >
> > > > > Also so much for "we're not going to tell the graphics people how to
> > > > > review their code", dma_fence is a pretty core piece of gpu driver
> > > > > infrastructure. And it's very much uapi relevant, including piles of
> > > > > corresponding userspace protocols and libraries for how to pass these
> > > > > around.
> > > > >
> > > > > Would be great if habanalabs would not use this (from a quick look
> > > > > it's not needed at all), since open source the userspace and playing
> > > > > by the usual rules isn't on the table. If that's not possible (because
> > > > > it's actually using the uapi part of dma_fence to interact with gpu
> > > > > drivers) then we have exactly what everyone promised we'd want to
> > > > > avoid.
> > > >
> > > > We don't use the uapi parts, we currently only using the fencing and
> > > > signaling ability of this module inside our kernel code. But maybe I
> > > > didn't understand what you request. You want us *not* to use this
> > > > well-written piece of kernel code because it is only used by graphics
> > > > drivers ?
> > > > I'm sorry but I don't get this argument, if this is indeed what you meant.
> > >
> > > We would rather drivers using a feature that has requirements on
> > > correct userspace implementations of the feature have a userspace that
> > > is open source and auditable.
> > >
> > > Fencing is tricky, cross-device fencing is really tricky, and having
> > > the ability for a closed userspace component to mess up other people's
> > > drivers, think i915 shared with closed habana userspace and shared
> > > fences, decreases ability to debug things.
> > >
> > > Ideally we wouldn't offer users known untested/broken scenarios, so
> > > yes we'd prefer that drivers that intend to expose a userspace fencing
> > > api around dma-fence would adhere to the rules of the gpu drivers.
> > >
> > > I'm not say you have to drop using dma-fence, but if you move towards
> > > cross-device stuff I believe other drivers would be correct in
> > > refusing to interact with fences from here.
> >
> > The flip side is if you only used dma-fence.c "because it's there",
> > and not because it comes with an uapi attached and a cross-driver
> > kernel internal contract for how to interact with gpu drivers, then
> > there's really not much point in using it. It's a custom-rolled
> > wait_queue/event thing, that's all. Without the gpu uapi and gpu
> > cross-driver contract it would be much cleaner to just use wait_queue
> > directly, and that's a construct all kernel developers understand, not
> > just gpu folks. From a quick look at least habanalabs doesn't use any
> > of these uapi/cross-driver/gpu bits.
> > -Daniel
> 
> Hi Daniel,
> I want to say explicitly that we don't use the dma-buf uapi parts, nor
> we intend to use them to communicate with any GPU device. We only use
> it as simple completion mechanism as it was convenient to use.
> I do understand I can exchange that mechanism with a simpler one, and
> I will add an internal task to do it (albeit not in a very high
> priority) and upstream it, its just that it is part of our data path
> so we need to thoroughly validate it first.

Sounds good.

Wrt merging this patch here, can you include that in one of your next
pulls? Or should I toss it entirely, waiting for you to remove dma_fence
outright?

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
