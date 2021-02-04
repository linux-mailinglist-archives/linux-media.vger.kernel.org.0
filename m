Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48AC30F398
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 14:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236192AbhBDNCo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 08:02:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236108AbhBDNCl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 08:02:41 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F352DC061573
        for <linux-media@vger.kernel.org>; Thu,  4 Feb 2021 05:02:00 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id g10so4033762eds.2
        for <linux-media@vger.kernel.org>; Thu, 04 Feb 2021 05:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zmj2bggvU3mXUaf5YXumGCfxqEA3nZoxvul4jZ6QhJU=;
        b=vi7PIk395cL3AQX6MQDQ6OTlwDTfRhbqwgzdsRygWjQZVEG4eGm14XoeXXlAOYDaDQ
         un2/Z4TsRidyDsOVAfh0/ufKuHqAEciww4a1gS1pTaTabRi1a/U3zTuySeiUNm+7m2HF
         DGngwCUTZrvhrfTotdTd8NI1b7/hB/8/Ic3NELClPvxo4+defC3Jm6+vLfAdmbnHPtOW
         MeigR/+vqBGUgAUA7g8Ch0pQgheGtR11oujbeNJb4Q79lfj97dlsiRv6nITx+suBrBaT
         ZND6hI9qH7GZB3nlDtFwQrR6mMnLKb/SgY2BEfJX+dt42mYGb8k3BpfeOAFz4GqrTj1K
         Y0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zmj2bggvU3mXUaf5YXumGCfxqEA3nZoxvul4jZ6QhJU=;
        b=kRA3yokJ+zEi+fSC6XOAUvzemnrUVW4d9PIS1iP4WpQ9TN70G4R/nVxxycYXzPeLUd
         fDo/cJgwyf/3teJScf8yQ+6AUxtXsAdREf3DzIlyJzDylxZvxX+frkp3hVBSkSOkSWbi
         3wtZYp4cVQyTyMLLfyfKbFl9+wffDXI/ZfcbPFJ7tL9XoeXXdKNom2Clg6lwH+jro99p
         n1cy6ht3omJBZPYDm5+7ts0bPpfC0Js/NbvIvZ+2IUMa9Ml3DNmjfLW6YOpO4qKmPaGl
         9Aep6ddXoKIElkC0KoXsrb2ou/IVcQ1kN48I39a5VywO2uLYvjCuCR7qtpRA7ef5j/CX
         B3gw==
X-Gm-Message-State: AOAM5312PjKXaOw8GYeKeXip+sQ7vE5qUj0WXc8AlhkNcJvt6Jxe+Eo3
        lvnqjesugZC9SbKzP0fvMFtOhpF6GA6Wj9omEp5ucw==
X-Google-Smtp-Source: ABdhPJwKd+ug3BQc1g5oHZNv+qMZW7aEKaQZv3blMJ1VsanMCV6gSVIpJ6LgGNtVmc+APg1Dpw9buFdWqjShTdnP3uc=
X-Received: by 2002:aa7:c2c7:: with SMTP id m7mr7778318edp.134.1612443719662;
 Thu, 04 Feb 2021 05:01:59 -0800 (PST)
MIME-Version: 1.0
References: <CAPY8ntCzAMsfujidsLKcL=f61T7WmioWSeaHL2hKmEn1jrnZ=A@mail.gmail.com>
 <CAPBb6MVj9QT+NrWjt+c2uFKWSzveMCBt4YJfnOz_MN0hDemcpw@mail.gmail.com> <CAPY8ntDZ1uPwvz9Yz5yLaByU45cocuHmTbUheraTEUK7R-Jz8Q@mail.gmail.com>
In-Reply-To: <CAPY8ntDZ1uPwvz9Yz5yLaByU45cocuHmTbUheraTEUK7R-Jz8Q@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 4 Feb 2021 10:01:48 -0300
Message-ID: <CAAEAJfC_tV60=j8jvXs5g3MH-DdsGoyM1LKQvQuP+GoT+acnFg@mail.gmail.com>
Subject: Re: Stateful Video Decoder interface vs M2M framework
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thanks for bringing up this topic. I've been wanting
to discuss working on making v4l2-mem2mem less simplistic
for quite some time now :-)

On Mon, 1 Feb 2021 at 14:13, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Alex
>
> Thanks for the response.
>
> On Mon, 1 Feb 2021 at 13:58, Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > Hi,
> >
> > On Mon, Feb 1, 2021 at 9:49 PM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Hi All.
> > >
> > > I'm currently doing battle with the stateful video decoder API for
> > > video decode on the Raspberry Pi.
> > >
> > > Reading the descriptive docs[1] there is no obligation to
> > > STREAMON(CAPTURE) before feeding in OUTPUT buffers and waiting for
> > > V4L2_EVENT_SOURCE_CHANGE to configure the CAPTURE queue. Great! It
> > > makes my colleague who is working on the userspace side happy as it
> > > saves a config step of allocating buffers that are never needed.
> > >
> > > I have been using the v4l2_mem2mem framework, same as some other
> > > decoders. We use v4l2_m2m in the buffered mode as it's actually
> > > remoted over to the VPU via the MMAL API, and so the src and dest are
> > > asynchronous from V4L2's perspective.
> > >
> > > Said colleague then complained that he couldn't follow the flow
> > > described in the docs linked above as it never produced the
> > > V4L2_EVENT_SOURCE_CHANGE event.
> > >
> > > Digging into it, it's the v4l2_mem2mem framework stopping me.
> > > __v4l2_m2m_try_queue[2] has
> > >     if (!m2m_ctx->out_q_ctx.q.streaming
> > >         || !m2m_ctx->cap_q_ctx.q.streaming) {
> > >         dprintk("Streaming needs to be on for both queues\n");
> > >         return;
> > >     }
> > > So I'm never going to get any of the OUTPUT buffers even queued to my
> > > driver until STREAMON(CAPTURE). That contradicts the documentation :-(
> > >

Although this will sound obvious, let's make a distinction
between the API (which applications can rely on, and drivers
must comply with) and an internal component (v4l2-m2m)
which is 100% subject to change, and just there to offer
some boilerplate to drivers.

IOW, nothing forces drivers to use v4l2-m2m,
and nothing prevents us from figuring out a better framework.

> > > Now I can see that on a non-buffered M2M device you have to have both
> > > OUTPUT and CAPTURE enabled because it wants to produce a CAPTURE
> > > buffer for every OUTPUT buffer on a 1:1 basis. On a buffered codec
> > > tweaking that one clause to
> > >     if (!m2m_ctx->out_q_ctx.buffered &&
> > >         (!m2m_ctx->out_q_ctx.q.streaming ||
> > >          !m2m_ctx->cap_q_ctx.q.streaming)) {
> > > solves the problem, but is that a generic solution? I don't have any
> > > other platforms to test against.
> >
> > As you said you cannot rely on the v4l2_m2m_try_schedule() to run the
> > jobs until both queues are streaming. This is one point where stateful
> > decoders do not fit with the expectation from M2M that 1 input buffer
> > == 1 output buffer. How to work around this limitation depends on the
> > design of the underlying hardware, but for example the mtk-vcodec
> > driver passes the OUTPUT buffers to its hardware in its vb2 buf_queue
> > hook:
> >
> > https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c#L1220
> >
> > This allows the hardware to start processing the stream until it
> > reports the expected resolution, after which the CAPTURE buffers can
> > be allocated and the CAPTURE queue started.
> >
> > Queueing OUTPUT buffers in the buf_queue hook can be done as a general
> > rule if the hardware expects input and output buffers to be queued
> > independently. You can also switch to a more traditional M2M scheme
> > once both queues are running if this fits the driver better.
>
> Is it deliberate that v4l2_m2m_try_schedule enforces both queues being
> active in buffered mode, or an oversight?
>
> I'm happy to switch to a custom qbuf on the OUTPUT queue if we must,
> but at least for drivers using the buffered mode of v4l2_m2m it seems
> unnecessary except for this one conditional.
>
> > >
> > > However it poses a larger question for my colleague as to what
> > > behaviour he can rely on in userspace. Is there a way for userspace to
> > > know whether it is permitted on a specific codec implementation to
> > > follow the docs and not STREAMON(CAPTURE) until
> > > V4L2_EVENT_SOURCE_CHANGE? If not then the documentation is invalid for
> > > many devices.
> >

Applications should have a way of retrieving the supported events,
unless I'm missing something in the API. But OTOH,
supporting V4L2_EVENT_SOURCE_CHANGE
is mandatory for decoders that comply with the stateful interface.

Yet another thing to keep in mind, is that the stateful interface
was officially merged in 2019. I'm unsure how clear
the "de-facto standard" was to older driver authors.

> > The documentation should be correct for most if not all stateful
> > decoders in the tree. I know firsthand that at least mtk-vcodec and
> > venus are compliant.
>
> mtk-vcodec I can see as being compliant now - thanks for your explanation.
>
> venus appears to ignore the v4l2_m2m job scheduling side (device_run
> is empty), has a good rummage in the v4l2_m2m buffer queues from
> venus_helper_process_initial_out_bufs, and then has a custom vb2_ops
> buf_queue to queue the buffer with v4l2_m2m and then immediately kick
> the processing thread.
>

This is another good indication that v4l2_m2m needs a redesign
to fit more sophisticated use-cases.

> Now knowing where to look, coda appears to have a custom code path in
> coda_buf_queue to handle the startup phase, and then drops into a more
> generic path once initialised.
>
> v4l2_m2m seems to be so close to doing what is needed for the
> stateless decoders that it seems odd that it's requiring what looks
> like bodging to all stateless decoders. I guess it's just the way
> things have evolved over time.
>

I don't think the *stateless interface* involves
V4L2_EVENT_SOURCE_CHANGE. The application should be
able to deal with dynamic resolution changes without it.

In any case, revisiting v4l2-m2m is something we
should tackle sooner or later.

If not to support the API around V4L2 events,
then to support devices that need more than just one source
and one sink buffer for each job (venus and rpivid look like
good examples of this).

Thanks,
Ezequiel
