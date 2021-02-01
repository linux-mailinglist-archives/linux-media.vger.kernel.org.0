Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAE030A935
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 14:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbhBAN67 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 08:58:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbhBAN6y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 08:58:54 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62F8C061573
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 05:58:13 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id u25so22818175lfc.2
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 05:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cFnUc2+nrNornwjK6mmZjlPqDUzEfZSeHySFLBDmG3Y=;
        b=G5XP4HecoigwGqVzmXdnnW+DYCJcpfFRbidDzUZNrFq7DZ840yF00CBVXuHTehIZRr
         dlk1YlGMAw8k4UWzaLaV2hB/H5ZgLFD/lBR2tnLZHC7rpEPOFNoLeYj8c28BbS2naYXW
         K4WZ5WpiZgayVPGLPf4UgtvTiTgIyg+zKUlhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cFnUc2+nrNornwjK6mmZjlPqDUzEfZSeHySFLBDmG3Y=;
        b=T0TWOmerZFx+UrVCRo/lX+Kt7K7tZ+sXetbMRkYLtL5lCotYN364FLvka2SNsB9XRX
         +KANDWLyVKdANV6fEiHq9ynmxeQzmmM2OsJW9T/f3eqtQdC8Sj/7lkt3a3b4lnvN0bDy
         /1ITytqq0azHE14NH2kC9oR0gZssvRJ7sXu1wsBIGTmX5GVrDGSdcpUct0nYg59U2AUr
         XkTZVmtJDDk114mg8DlTyU38Hu84Enxi2bUgX+jwIVPNy63xry2OWoQ+Jcc6YqHaVfrj
         ONGI+YQj2kqhnXAZ6zkSkzjzlBCESSTHdCqcJnOQoRpJGBV1kCIx2pOilX1iC6MHg40M
         Co/w==
X-Gm-Message-State: AOAM533J1NWu1Z6GRWFUOtU3y9BQbWTbyzZnZ/6PXDyljPPmXYQJqV82
        Yqn7RCwl8dLSEesRec82ZBvYu1Swpc4DjA==
X-Google-Smtp-Source: ABdhPJz4Usp/cggz3rU//kHVoH0TN03xkGRjgpd4mMif0VVzosxFG28g/ZkWMIDB1VXA60ZnpRu2nQ==
X-Received: by 2002:a05:6512:310:: with SMTP id t16mr9120149lfp.598.1612187891933;
        Mon, 01 Feb 2021 05:58:11 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id x4sm3011488lfe.255.2021.02.01.05.58.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 05:58:11 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id l12so19692331ljc.3
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 05:58:11 -0800 (PST)
X-Received: by 2002:a2e:a54f:: with SMTP id e15mr10332278ljn.441.1612187890843;
 Mon, 01 Feb 2021 05:58:10 -0800 (PST)
MIME-Version: 1.0
References: <CAPY8ntCzAMsfujidsLKcL=f61T7WmioWSeaHL2hKmEn1jrnZ=A@mail.gmail.com>
In-Reply-To: <CAPY8ntCzAMsfujidsLKcL=f61T7WmioWSeaHL2hKmEn1jrnZ=A@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 1 Feb 2021 22:57:59 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVj9QT+NrWjt+c2uFKWSzveMCBt4YJfnOz_MN0hDemcpw@mail.gmail.com>
Message-ID: <CAPBb6MVj9QT+NrWjt+c2uFKWSzveMCBt4YJfnOz_MN0hDemcpw@mail.gmail.com>
Subject: Re: Stateful Video Decoder interface vs M2M framework
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, Feb 1, 2021 at 9:49 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi All.
>
> I'm currently doing battle with the stateful video decoder API for
> video decode on the Raspberry Pi.
>
> Reading the descriptive docs[1] there is no obligation to
> STREAMON(CAPTURE) before feeding in OUTPUT buffers and waiting for
> V4L2_EVENT_SOURCE_CHANGE to configure the CAPTURE queue. Great! It
> makes my colleague who is working on the userspace side happy as it
> saves a config step of allocating buffers that are never needed.
>
> I have been using the v4l2_mem2mem framework, same as some other
> decoders. We use v4l2_m2m in the buffered mode as it's actually
> remoted over to the VPU via the MMAL API, and so the src and dest are
> asynchronous from V4L2's perspective.
>
> Said colleague then complained that he couldn't follow the flow
> described in the docs linked above as it never produced the
> V4L2_EVENT_SOURCE_CHANGE event.
>
> Digging into it, it's the v4l2_mem2mem framework stopping me.
> __v4l2_m2m_try_queue[2] has
>     if (!m2m_ctx->out_q_ctx.q.streaming
>         || !m2m_ctx->cap_q_ctx.q.streaming) {
>         dprintk("Streaming needs to be on for both queues\n");
>         return;
>     }
> So I'm never going to get any of the OUTPUT buffers even queued to my
> driver until STREAMON(CAPTURE). That contradicts the documentation :-(
>
> Now I can see that on a non-buffered M2M device you have to have both
> OUTPUT and CAPTURE enabled because it wants to produce a CAPTURE
> buffer for every OUTPUT buffer on a 1:1 basis. On a buffered codec
> tweaking that one clause to
>     if (!m2m_ctx->out_q_ctx.buffered &&
>         (!m2m_ctx->out_q_ctx.q.streaming ||
>          !m2m_ctx->cap_q_ctx.q.streaming)) {
> solves the problem, but is that a generic solution? I don't have any
> other platforms to test against.

As you said you cannot rely on the v4l2_m2m_try_schedule() to run the
jobs until both queues are streaming. This is one point where stateful
decoders do not fit with the expectation from M2M that 1 input buffer
== 1 output buffer. How to work around this limitation depends on the
design of the underlying hardware, but for example the mtk-vcodec
driver passes the OUTPUT buffers to its hardware in its vb2 buf_queue
hook:

https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c#L1220

This allows the hardware to start processing the stream until it
reports the expected resolution, after which the CAPTURE buffers can
be allocated and the CAPTURE queue started.

Queueing OUTPUT buffers in the buf_queue hook can be done as a general
rule if the hardware expects input and output buffers to be queued
independently. You can also switch to a more traditional M2M scheme
once both queues are running if this fits the driver better.

>
> However it poses a larger question for my colleague as to what
> behaviour he can rely on in userspace. Is there a way for userspace to
> know whether it is permitted on a specific codec implementation to
> follow the docs and not STREAMON(CAPTURE) until
> V4L2_EVENT_SOURCE_CHANGE? If not then the documentation is invalid for
> many devices.

The documentation should be correct for most if not all stateful
decoders in the tree. I know firsthand that at least mtk-vcodec and
venus are compliant.

Cheers,
Alex.
