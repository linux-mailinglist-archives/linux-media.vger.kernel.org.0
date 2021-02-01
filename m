Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F31030A7F5
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 13:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbhBAMtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 07:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbhBAMti (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 07:49:38 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3A2C061573
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 04:48:57 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id c127so13047518wmf.5
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 04:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=NzOSfwStoSLxKRsgsNQZLr8nr63oG16ullT8zW23Rvo=;
        b=bZMrorON+xVJzzUryuWr+rRPJeVqrF1MZIWF1dMwmeIOzctkdDmVxGijJiTbhwj6na
         lN8PyH/JthnmFwDDZF3BKbCtHsfXZ8Dk0D1JfOB4txOfpt0e2kDrVn7NRmC/bBYe2dUp
         bD+VEoEKA2FiOzvg7agYTQAE6hPdoriCwhDltGkRpH210SzZcVbZgW3XeXJDgh8FFOb8
         FxqY9xL4C/npjKhiNXDp4Vswob5fFXnP21yqh6TSQvCgI0Tj7uqaenecxXahsi/Dgw+j
         MCmCx+ymbwvLxy745EMyIwPUzXNZtbgMNeqNjjF8uy5WDhb6dyaDVMcTvn25wqVtlXqt
         ThVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=NzOSfwStoSLxKRsgsNQZLr8nr63oG16ullT8zW23Rvo=;
        b=R+27WdfRnfYnKoORjd51T1F0/fxeTp2EW592O4sCB5fa2kDhFsBZ+i3TZb7VDb2v1b
         QZgU5H/iepj8tYj5bcS7Idw5O+t9BZh8zYZr4xGe0PI3Dhz3y37nf3jdlqJTBLV23aM0
         +xJMDCI/FQgfSgRe8OyNfadHNn7b2WZmqOrosg22d7m3pejZUufSxT/THXVPnWUjMOM1
         rc1KwqgpFq1DnG6CdqwZ0gGuj7t/ZSXRsZuS7WEac9yRBCJYa1QbmOGUFAkkQcVXmYGB
         7oNHVA1bHUHYkdGueP0Xggmsmn3tH7i5t3YcHo/OMKdKOgLGx7+7mHuS6CjV6UyNNG64
         7FeQ==
X-Gm-Message-State: AOAM532TNvbBmqTiNMA2ysGs2/qBLOehESm5GonRqg7nqPV8U//8L5aC
        SlIR6PJ22XPSllacvnQGUSL2hmTe5C0MvZOsempfIWRIYjh4Fw==
X-Google-Smtp-Source: ABdhPJzSAg4lMUuWEnclr/J5VmpwNwCB6hEkMav0oZFLxDki4OXT1xTa3shuOdev1M5NZjV5lu7LfyTaz15dUyq5RS4=
X-Received: by 2002:a1c:bc46:: with SMTP id m67mr5818767wmf.82.1612183735693;
 Mon, 01 Feb 2021 04:48:55 -0800 (PST)
MIME-Version: 1.0
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 1 Feb 2021 12:48:39 +0000
Message-ID: <CAPY8ntCzAMsfujidsLKcL=f61T7WmioWSeaHL2hKmEn1jrnZ=A@mail.gmail.com>
Subject: Stateful Video Decoder interface vs M2M framework
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All.

I'm currently doing battle with the stateful video decoder API for
video decode on the Raspberry Pi.

Reading the descriptive docs[1] there is no obligation to
STREAMON(CAPTURE) before feeding in OUTPUT buffers and waiting for
V4L2_EVENT_SOURCE_CHANGE to configure the CAPTURE queue. Great! It
makes my colleague who is working on the userspace side happy as it
saves a config step of allocating buffers that are never needed.

I have been using the v4l2_mem2mem framework, same as some other
decoders. We use v4l2_m2m in the buffered mode as it's actually
remoted over to the VPU via the MMAL API, and so the src and dest are
asynchronous from V4L2's perspective.

Said colleague then complained that he couldn't follow the flow
described in the docs linked above as it never produced the
V4L2_EVENT_SOURCE_CHANGE event.

Digging into it, it's the v4l2_mem2mem framework stopping me.
__v4l2_m2m_try_queue[2] has
    if (!m2m_ctx->out_q_ctx.q.streaming
        || !m2m_ctx->cap_q_ctx.q.streaming) {
        dprintk("Streaming needs to be on for both queues\n");
        return;
    }
So I'm never going to get any of the OUTPUT buffers even queued to my
driver until STREAMON(CAPTURE). That contradicts the documentation :-(

Now I can see that on a non-buffered M2M device you have to have both
OUTPUT and CAPTURE enabled because it wants to produce a CAPTURE
buffer for every OUTPUT buffer on a 1:1 basis. On a buffered codec
tweaking that one clause to
    if (!m2m_ctx->out_q_ctx.buffered &&
        (!m2m_ctx->out_q_ctx.q.streaming ||
         !m2m_ctx->cap_q_ctx.q.streaming)) {
solves the problem, but is that a generic solution? I don't have any
other platforms to test against.

However it poses a larger question for my colleague as to what
behaviour he can rely on in userspace. Is there a way for userspace to
know whether it is permitted on a specific codec implementation to
follow the docs and not STREAMON(CAPTURE) until
V4L2_EVENT_SOURCE_CHANGE? If not then the documentation is invalid for
many devices.

On a very brief survey of a few existing drivers I see:
- the Coda driver uses v4l2_m2m in the same mode as my driver, so
presumably it's not currently going to be following the documentation
but the above change should make it do so.
- meson/vdec doesn't work in buffered mode, so it's never going to be
able to follow the docs. There is a TODO stating that (although
implying it's mainly on MPEG1 & 2).
- mtk-vcodec is also not in buffered mode, and appears to have
secondary checks that it has both a src and dst buffer before passing
anything to the hardware. Is there any way for that to be able to
follow the docs?

Guidance please.

Thanks
  Dave

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-decoder.html#initialization
[2] https://git.linuxtv.org/media_tree.git/tree/drivers/media/v4l2-core/v4l2-mem2mem.c#n303
