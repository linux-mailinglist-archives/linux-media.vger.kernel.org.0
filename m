Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F4330BF2C
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 14:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbhBBNSV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 08:18:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232238AbhBBNR5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 08:17:57 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DEDDC061573
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 05:17:15 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id p21so27863321lfu.11
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 05:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TDZmuVOZ4D4zsuoBFHIoHjvTYlVzvEb7eizkdN/yG84=;
        b=hexouicT0c3lnJnT2ROMxtDAWrsWidv6+KXwrpP3ZKdQaDXpM6eAKcCDPxA/geCn18
         Lq+74nVOkS0UtGJ5E9Q7v6FSJk1TiO+jB+Zc0mZUk8GKfAqCXzyqTwBqqmksMny8BDFg
         NEt5MnwKaMcmodDfcswZl4Z9rMalvdUFdIJO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TDZmuVOZ4D4zsuoBFHIoHjvTYlVzvEb7eizkdN/yG84=;
        b=i2S6R4DB9acudlKPZ4DhyG316tRm9inUUUIeR9JRcmBQh78TAD7r/7WdEr2LZGqhK6
         AlJyjr9zegCK3c8pgWq/fv0yLYTIGZiZ1hIP6Zjzn6+wHsC4sS6CIrKQzg5zED+Wijnm
         bbRsOfYyWkmDiFwOhFbLZaROjmz5mEBzxFZmoj1WP9M7APr0GU7YfooX6HeWMiUfvvk4
         5mAHzkqlA/4pXxQTrH1WpxjCeMozQnASiXXY9YEgKBVkxZ8vxRyg88jVx+nKCE6NhfDi
         IG5Wui2TUlfUuLcUdYhGOe6DY1zI99MoAVpPB+9iVR7sG5wjPlqPIo1XdQ8G/7pxNVR1
         wWEQ==
X-Gm-Message-State: AOAM5325SUFJxLHz5jVR8iRNqrOcVtlWZ27y1zV2P+lSp5GxSfIl+gY4
        mOQkXfcihDpNkVgWo7YES2W5/MzyAeo9K4fY
X-Google-Smtp-Source: ABdhPJw1XzabYV2O3V6zOX2b21ThYYXJX6LAaF92y7exLKDUnU4cCyYiZiCks3biOU1/x658JI/icw==
X-Received: by 2002:a19:8cc:: with SMTP id 195mr10541082lfi.504.1612271833512;
        Tue, 02 Feb 2021 05:17:13 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id v144sm3290340lfa.31.2021.02.02.05.17.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 05:17:12 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id f1so27881632lfu.3
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 05:17:12 -0800 (PST)
X-Received: by 2002:ac2:561b:: with SMTP id v27mr11255791lfd.233.1612271832031;
 Tue, 02 Feb 2021 05:17:12 -0800 (PST)
MIME-Version: 1.0
References: <CAPY8ntCzAMsfujidsLKcL=f61T7WmioWSeaHL2hKmEn1jrnZ=A@mail.gmail.com>
 <CAPBb6MVj9QT+NrWjt+c2uFKWSzveMCBt4YJfnOz_MN0hDemcpw@mail.gmail.com> <CAPY8ntDZ1uPwvz9Yz5yLaByU45cocuHmTbUheraTEUK7R-Jz8Q@mail.gmail.com>
In-Reply-To: <CAPY8ntDZ1uPwvz9Yz5yLaByU45cocuHmTbUheraTEUK7R-Jz8Q@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 2 Feb 2021 22:16:59 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXCtCkPpL+4TU9eScKrmq2BwrjpCpECAxaTuk0HbZSpHA@mail.gmail.com>
Message-ID: <CAPBb6MXCtCkPpL+4TU9eScKrmq2BwrjpCpECAxaTuk0HbZSpHA@mail.gmail.com>
Subject: Re: Stateful Video Decoder interface vs M2M framework
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Tue, Feb 2, 2021 at 2:09 AM Dave Stevenson
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

IIUC that's what the M2M framework expects, historically. It needs
both ends of "memory to memory" in order to do its work, and this
matched well with the first devices using this framework. Stateful
decoders are also "memory to memory", but in the broader sense, both
queues being asynchronous. So while it saves some effort to reuse some
of the M2M helpers, the whole framework cannot be used as it was
originally intended.

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
> Now knowing where to look, coda appears to have a custom code path in
> coda_buf_queue to handle the startup phase, and then drops into a more
> generic path once initialised.
>
> v4l2_m2m seems to be so close to doing what is needed for the
> stateless decoders that it seems odd that it's requiring what looks
> like bodging to all stateless decoders. I guess it's just the way
> things have evolved over time.

Yeah, what we really need here are encoder and stateful/stateless
decoder helpers (that may or may not rely on M2M) that manage the
queues as expected, while also enforcing the specification. Coming
with a design that works for all drivers is not easy though.

Cheers,
Alex.
