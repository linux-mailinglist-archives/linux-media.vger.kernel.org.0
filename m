Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09C330AD76
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 18:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbhBARKa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 12:10:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhBARK1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 12:10:27 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951FAC06174A
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 09:09:47 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 190so13284316wmz.0
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 09:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jjhxr8DMM/sgCvC++Pc9nC6gaPfLauYiY3GuLKM5TB8=;
        b=LqYPlkID11L7RiQ41FlDe8UUAt4BHBjcrEfz7c2E6t/UnG3gGCRPdZHj1O1JXwEE3h
         Qg0Fyjs2t88DWLSTUl/7yyk4jnEqLj0RDYkPQkFbiymsde5P5lQ7VFDWIvizyefy4Nnw
         2tRuxlHGU69woK5AAl9mXy8gZU3LG9Dj8YXDYxEqN3YX14O02Skd0sPIxUSqph1b7HVq
         2vg+8QUvnbbF+MDWSAnJgQVZQePXiJYi8c9080ImYVwKREV+CW7lsFm7COmDijXq1MbJ
         LLWTlcVltqNQznHtgfk5V1IOuw9nSul0BsjbQP1zZo0I9nCArV9eKg3KJZ4CNsKmj3oq
         t4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jjhxr8DMM/sgCvC++Pc9nC6gaPfLauYiY3GuLKM5TB8=;
        b=ePN0TjA9sI26Hqh43iA2cqhgOBNV2Nv+R9nE9Xkj5wT6zAwmKd0LlvGUa9ibACK9Xa
         7FYUaQu9IGI48WcPv+BBX3oGNgr/CijugLr8+DD706FHgq1BRqS7po12QuR2jkgU/Y2n
         YCN7vV050Do5G8iS4U9z/YumcNfCgL5d7eVIBnt2wtGv9b6Rr8kF6FjB5YQk8FgPmlBx
         gTiy3yyKjrHX6ZUxr3eQa5wwmcSVdBVH874gmry4nQLE7mKOJ5gEyuPZUfpiJm01iq96
         JWwu4CbJATSZNxR60A8cbGIW7q+jz3sQmYGoUWPNhpXuNV480R9xK6+sUQ1WxohIhzoL
         2sgg==
X-Gm-Message-State: AOAM530IkbGzJQvfwN79OcETuTDnJvsKO3FzTiZkDlRIZQIl0iy6ljpT
        ol9XolvjcJL9XBP81JYj18wRfn+3//A2tg7k3R6G4Zx30Ok=
X-Google-Smtp-Source: ABdhPJxZbqG+mkXcj7zmwelFzxpp3OIyquCu7h9T1gVJqvThWWffOyb2krjYdAkXX89MO975cfUkIxI+L+AW7DmO/tI=
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr15441847wmg.183.1612199386250;
 Mon, 01 Feb 2021 09:09:46 -0800 (PST)
MIME-Version: 1.0
References: <CAPY8ntCzAMsfujidsLKcL=f61T7WmioWSeaHL2hKmEn1jrnZ=A@mail.gmail.com>
 <CAPBb6MVj9QT+NrWjt+c2uFKWSzveMCBt4YJfnOz_MN0hDemcpw@mail.gmail.com>
In-Reply-To: <CAPBb6MVj9QT+NrWjt+c2uFKWSzveMCBt4YJfnOz_MN0hDemcpw@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 1 Feb 2021 17:09:29 +0000
Message-ID: <CAPY8ntDZ1uPwvz9Yz5yLaByU45cocuHmTbUheraTEUK7R-Jz8Q@mail.gmail.com>
Subject: Re: Stateful Video Decoder interface vs M2M framework
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex

Thanks for the response.

On Mon, 1 Feb 2021 at 13:58, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> Hi,
>
> On Mon, Feb 1, 2021 at 9:49 PM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi All.
> >
> > I'm currently doing battle with the stateful video decoder API for
> > video decode on the Raspberry Pi.
> >
> > Reading the descriptive docs[1] there is no obligation to
> > STREAMON(CAPTURE) before feeding in OUTPUT buffers and waiting for
> > V4L2_EVENT_SOURCE_CHANGE to configure the CAPTURE queue. Great! It
> > makes my colleague who is working on the userspace side happy as it
> > saves a config step of allocating buffers that are never needed.
> >
> > I have been using the v4l2_mem2mem framework, same as some other
> > decoders. We use v4l2_m2m in the buffered mode as it's actually
> > remoted over to the VPU via the MMAL API, and so the src and dest are
> > asynchronous from V4L2's perspective.
> >
> > Said colleague then complained that he couldn't follow the flow
> > described in the docs linked above as it never produced the
> > V4L2_EVENT_SOURCE_CHANGE event.
> >
> > Digging into it, it's the v4l2_mem2mem framework stopping me.
> > __v4l2_m2m_try_queue[2] has
> >     if (!m2m_ctx->out_q_ctx.q.streaming
> >         || !m2m_ctx->cap_q_ctx.q.streaming) {
> >         dprintk("Streaming needs to be on for both queues\n");
> >         return;
> >     }
> > So I'm never going to get any of the OUTPUT buffers even queued to my
> > driver until STREAMON(CAPTURE). That contradicts the documentation :-(
> >
> > Now I can see that on a non-buffered M2M device you have to have both
> > OUTPUT and CAPTURE enabled because it wants to produce a CAPTURE
> > buffer for every OUTPUT buffer on a 1:1 basis. On a buffered codec
> > tweaking that one clause to
> >     if (!m2m_ctx->out_q_ctx.buffered &&
> >         (!m2m_ctx->out_q_ctx.q.streaming ||
> >          !m2m_ctx->cap_q_ctx.q.streaming)) {
> > solves the problem, but is that a generic solution? I don't have any
> > other platforms to test against.
>
> As you said you cannot rely on the v4l2_m2m_try_schedule() to run the
> jobs until both queues are streaming. This is one point where stateful
> decoders do not fit with the expectation from M2M that 1 input buffer
> == 1 output buffer. How to work around this limitation depends on the
> design of the underlying hardware, but for example the mtk-vcodec
> driver passes the OUTPUT buffers to its hardware in its vb2 buf_queue
> hook:
>
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c#L1220
>
> This allows the hardware to start processing the stream until it
> reports the expected resolution, after which the CAPTURE buffers can
> be allocated and the CAPTURE queue started.
>
> Queueing OUTPUT buffers in the buf_queue hook can be done as a general
> rule if the hardware expects input and output buffers to be queued
> independently. You can also switch to a more traditional M2M scheme
> once both queues are running if this fits the driver better.

Is it deliberate that v4l2_m2m_try_schedule enforces both queues being
active in buffered mode, or an oversight?

I'm happy to switch to a custom qbuf on the OUTPUT queue if we must,
but at least for drivers using the buffered mode of v4l2_m2m it seems
unnecessary except for this one conditional.

> >
> > However it poses a larger question for my colleague as to what
> > behaviour he can rely on in userspace. Is there a way for userspace to
> > know whether it is permitted on a specific codec implementation to
> > follow the docs and not STREAMON(CAPTURE) until
> > V4L2_EVENT_SOURCE_CHANGE? If not then the documentation is invalid for
> > many devices.
>
> The documentation should be correct for most if not all stateful
> decoders in the tree. I know firsthand that at least mtk-vcodec and
> venus are compliant.

mtk-vcodec I can see as being compliant now - thanks for your explanation.

venus appears to ignore the v4l2_m2m job scheduling side (device_run
is empty), has a good rummage in the v4l2_m2m buffer queues from
venus_helper_process_initial_out_bufs, and then has a custom vb2_ops
buf_queue to queue the buffer with v4l2_m2m and then immediately kick
the processing thread.

Now knowing where to look, coda appears to have a custom code path in
coda_buf_queue to handle the startup phase, and then drops into a more
generic path once initialised.

v4l2_m2m seems to be so close to doing what is needed for the
stateless decoders that it seems odd that it's requiring what looks
like bodging to all stateless decoders. I guess it's just the way
things have evolved over time.

Thanks again.
  Dave
