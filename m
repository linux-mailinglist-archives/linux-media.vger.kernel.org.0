Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1E430C680
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 17:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236882AbhBBQuw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 11:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236849AbhBBQsi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 11:48:38 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F73C0613ED
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 08:48:21 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id u20so20419666qku.7
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 08:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=z/EBW3lSMJRuUM6KhWPFizjlNyp9yXPemx5mx5O0kPo=;
        b=DyjnsqgOeraM6uqiEo/I2HIVwCcOt8bYyWJ2FKt48gdpWmtQPVIz5sxPlfwIfzMLeC
         ytg2IqvZLjAjLtPkgrxolTiVyU02tcd5Y2a644WFoyT6O7+Cz2CfE+C0/pxReRxHJVHj
         t1MmmakKMVeSsfR7KpT7DAXDwCvVUTYvIJOr183zftIP0+/VONwhwuVElnNVzFw/d8eT
         1SsFi/qnyUnwLrqA+zbufi6ZSHjfZsDAJhusdP1ot4CmS42DErFF13l0E1b81WiGUZDv
         Z2kjAswLOeFryTQc4Dwg0kEgILXr3YgMBrImmmlqC0AwaNk8qU4+J1MAZkh6liCKxmzR
         m9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=z/EBW3lSMJRuUM6KhWPFizjlNyp9yXPemx5mx5O0kPo=;
        b=tvrNHNB94DGlydQZwDgxy1q8xU9n7dNH3DOBCzVVg4R9EMrbLop1kyCbNakdE6tr8b
         jI5wWo47OY64CvW8hqRgchZwRxNH3GXbdinjU7DtAj0MSovlTWeF8Rfw8uFsTOUOZ1tX
         SpugEAsCl+cZKu/l2DTkOPlKRSY5srW0KcPUKBt014zfYMrCUyAJbYv3AL2X7dx8eodh
         k/qPymdzKdEyS77LBLhAqBL2/9u8H5Cc4vMNbO3BtkDG3mYswjlVJFVzYr1uqS/ML4uL
         4/tbNaeGERwn4tSk5TBGj0e4wk6szUV5MEV+CJ+xxYOlqgWZU79AV5IVU/vzZwkYv9iT
         RMaA==
X-Gm-Message-State: AOAM533hf5FMfViSnzjqlt81+atvslt/KuHV4ebQb6ipzP8vEZ6iYv2A
        KDNWyjlcxpZKebRUHJnT6lYwGmpIMR71bK0Q
X-Google-Smtp-Source: ABdhPJwkM+P2BngWlR685lQOcS7zKmhHslXyOvJBo33Jlv9DEtpZYwfzKvFQ/XC58NXuV7KxOVzTBQ==
X-Received: by 2002:a05:620a:64d:: with SMTP id a13mr20217278qka.383.1612284501074;
        Tue, 02 Feb 2021 08:48:21 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id l22sm17293573qtl.96.2021.02.02.08.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 08:48:19 -0800 (PST)
Message-ID: <15b60100bbcf709fd8856d7ad5f2cdf525cc059b.camel@ndufresne.ca>
Subject: Re: Stateful Video Decoder interface vs M2M framework
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Alexandre Courbot <acourbot@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Tue, 02 Feb 2021 11:48:17 -0500
In-Reply-To: <CAPY8ntDZ1uPwvz9Yz5yLaByU45cocuHmTbUheraTEUK7R-Jz8Q@mail.gmail.com>
References: <CAPY8ntCzAMsfujidsLKcL=f61T7WmioWSeaHL2hKmEn1jrnZ=A@mail.gmail.com>
         <CAPBb6MVj9QT+NrWjt+c2uFKWSzveMCBt4YJfnOz_MN0hDemcpw@mail.gmail.com>
         <CAPY8ntDZ1uPwvz9Yz5yLaByU45cocuHmTbUheraTEUK7R-Jz8Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 01 février 2021 à 17:09 +0000, Dave Stevenson a écrit :
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
> > >     if (!m2m_ctx->out_q_ctx.q.streaming
> > >         || !m2m_ctx->cap_q_ctx.q.streaming) {
> > >         dprintk("Streaming needs to be on for both queues\n");
> > >         return;
> > >     }
> > > So I'm never going to get any of the OUTPUT buffers even queued to my
> > > driver until STREAMON(CAPTURE). That contradicts the documentation :-(
> > > 
> > > Now I can see that on a non-buffered M2M device you have to have both
> > > OUTPUT and CAPTURE enabled because it wants to produce a CAPTURE
> > > buffer for every OUTPUT buffer on a 1:1 basis. On a buffered codec
> > > tweaking that one clause to
> > >     if (!m2m_ctx->out_q_ctx.buffered &&
> > >         (!m2m_ctx->out_q_ctx.q.streaming ||
> > >          !m2m_ctx->cap_q_ctx.q.streaming)) {
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

Just a warning, CODA does not really implement the source-change event the way
it should. The other did not have the specification hence didn't know how to get
the frame resolution from the HW. At the moment, it only work for special
userspace that passed the resolution at setup time (which by spec should be
ignored in favour of HW reported sizes).

You might not be aware that this event driven mechanism was added much after
most of drivers were merged into staging. The legacy method, which I don't
recommand was that userspace would queue on OUTPUT the initial header data, and
then it would call G_FMT which would block till the data was processed. If I
remember right, MFC driver (the first of this type of driver) was starting the
proecessing right inside the G_FMT call.

I'm currently working on general support for source-change on GStreamer side
(not only for codecs), that should allow reviving:

https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/240

Which is a left behind attempt to implement compliance to the recent spec in
GStreamer, which I know is available software on RPi.

> 
> v4l2_m2m seems to be so close to doing what is needed for the
> stateless decoders that it seems odd that it's requiring what looks
> like bodging to all stateless decoders. I guess it's just the way
> things have evolved over time.
> 
> Thanks again.
>   Dave


