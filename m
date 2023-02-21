Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 097C069E420
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 17:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbjBUQCl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 11:02:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233025AbjBUQCk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 11:02:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E2B2366A
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 08:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676995316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9izMAfpyPSC2j4KF6KccqxxHP0NMJSdJ01aiq+ruxRA=;
        b=KNCfO8ghf3XOT++BB7r3J4jYNLexYKULhypb1hPhR93DIR6kwRK6K2w4Q9B+rwRIt63jrS
        Fep1CKqJhWoMVCVdKYrK62mjT6tvFiqh1DLcGy70G6GaFvAHXICwBpV33iU1lxtcBKtpuL
        DVwestkXyylDbXi3O4Nbw0SIO9B4qIg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-vz7nEbF8N4esKlSZjZlUfQ-1; Tue, 21 Feb 2023 11:01:51 -0500
X-MC-Unique: vz7nEbF8N4esKlSZjZlUfQ-1
Received: by mail-pj1-f70.google.com with SMTP id b23-20020a17090a8c9700b002371fc964f7so1109197pjo.3
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 08:01:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9izMAfpyPSC2j4KF6KccqxxHP0NMJSdJ01aiq+ruxRA=;
        b=6FDxM7PsvLSQ0ZhMrLJLTdGBBr2Je99vcyxWALNgYZHXudQkJsiGIL9PQA8wP0sN6J
         0Bb/Ks0p6PsPF3HX7Txr4M9mr7n5rLxktJzM2G/wTpaEt614dNu30SzxUK+d2S66aYZC
         hVhSZ2qRjxhPDlnnmXsUmZ0GCKhGe8rCJORXtv1pQklPFEDeiEuOuSI0CcHhVbQlH9Ri
         xzsfnaMp9rf7vzPIH/EONsBhKa0LBKXtvCiltBdUmjFrFM0UwQrgumRIvvAs/FssmU3/
         eCvCIpNC6qHpGRHkniG8gnWCoifEQaVp1j68ZwUNKubyVlu/Xd3OYZM+YzqTEQjDzNum
         /zIw==
X-Gm-Message-State: AO0yUKVUOAHjpQUt14GxzIu6GaQQHabSDfFjP/UQZnnmDtPGkL7mq6VX
        wlnEaH+dn8SgRwqd6kUNPGCXAvb5JDth7GWo0waFPBJ9B1J1ZSOPnYP9Is8ujdXuTF1k9z/NNqA
        aPQmsrUvuUxj3x4SXk1xSDo3ikDtciMaQrqRPfHA=
X-Received: by 2002:a17:90b:2645:b0:237:39b1:7c5f with SMTP id pa5-20020a17090b264500b0023739b17c5fmr9697pjb.96.1676995310471;
        Tue, 21 Feb 2023 08:01:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+7t/vLNHtsxzvT2bollF+HO+l6TckmTWA3PewfgaKv+tlYXZrcfQ/NIzB6QL95XtxeqfTMakmosPDQgkjw3lw=
X-Received: by 2002:a17:90b:2645:b0:237:39b1:7c5f with SMTP id
 pa5-20020a17090b264500b0023739b17c5fmr9677pjb.96.1676995310112; Tue, 21 Feb
 2023 08:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com> <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell> <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <20230221103753.205082d3@eldfell>
In-Reply-To: <20230221103753.205082d3@eldfell>
From:   Sebastian Wick <sebastian.wick@redhat.com>
Date:   Tue, 21 Feb 2023 17:01:36 +0100
Message-ID: <CA+hFU4xexaHAYsbGm6PdNfVFHBgOS4WiMo=AU0Gi5cYt566aTg@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        open list <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 21, 2023 at 9:38 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 20 Feb 2023 08:14:47 -0800
> Rob Clark <robdclark@gmail.com> wrote:
>
> > On Mon, Feb 20, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Sat, 18 Feb 2023 13:15:49 -0800
> > > Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
> > > > wait (as opposed to a "housekeeping" wait to know when to cleanup after
> > > > some work has completed).  Usermode components of GPU driver stacks
> > > > often poll() on fence fd's to know when it is safe to do things like
> > > > free or reuse a buffer, but they can also poll() on a fence fd when
> > > > waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
> > > > lets the kernel differentiate these two cases.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > >
> > > Hi,
> > >
> > > where would the UAPI documentation of this go?
> > > It seems to be missing.
> >
> > Good question, I am not sure.  The poll() man page has a description,
> > but my usage doesn't fit that _exactly_ (but OTOH the description is a
> > bit vague).
> >
> > > If a Wayland compositor is polling application fences to know which
> > > client buffer to use in its rendering, should the compositor poll with
> > > PRI or not? If a compositor polls with PRI, then all fences from all
> > > applications would always be PRI. Would that be harmful somehow or
> > > would it be beneficial?
> >
> > I think a compositor would rather use the deadline ioctl and then poll
> > without PRI.  Otherwise you are giving an urgency signal to the fence
> > signaller which might not necessarily be needed.
> >
> > The places where I expect PRI to be useful is more in mesa (things
> > like glFinish(), readpix, and other similar sorts of blocking APIs)
>
> Sounds good. Docs... ;-)
>
> Hmm, so a compositor should set the deadline when it processes the
> wl_surface.commit, and not when it actually starts repainting, to give
> time for the driver to react and the GPU to do some more work. The
> deadline would be the time when the compositor starts its repaint, so
> it knows if the buffer is ready or not.

Technically we don't know when the commit is supposed to be shown.
Just passing a deadline of the next possible deadline however is
probably a good enough guess for this feature to be useful.

One thing that neither API allows us to do is tell the kernel in
advance when we're going to submit work and what the deadline for it
is and unfortunately that work is the most timing sensitive.

>
>
> Thanks,
> pq
>
>
> >
> > BR,
> > -R
> >
> > >
> > >
> > > Thanks,
> > > pq
> > >
> > > > ---
> > > >  drivers/dma-buf/sync_file.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > > > index fb6ca1032885..c30b2085ee0a 100644
> > > > --- a/drivers/dma-buf/sync_file.c
> > > > +++ b/drivers/dma-buf/sync_file.c
> > > > @@ -192,6 +192,14 @@ static __poll_t sync_file_poll(struct file *file, poll_table *wait)
> > > >  {
> > > >       struct sync_file *sync_file = file->private_data;
> > > >
> > > > +     /*
> > > > +      * The POLLPRI/EPOLLPRI flag can be used to signal that
> > > > +      * userspace wants the fence to signal ASAP, express this
> > > > +      * as an immediate deadline.
> > > > +      */
> > > > +     if (poll_requested_events(wait) & EPOLLPRI)
> > > > +             dma_fence_set_deadline(sync_file->fence, ktime_get());
> > > > +
> > > >       poll_wait(file, &sync_file->wq, wait);
> > > >
> > > >       if (list_empty(&sync_file->cb.node) &&
> > >
>

