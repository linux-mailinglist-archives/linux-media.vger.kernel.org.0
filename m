Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A712816A0
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 17:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388243AbgJBPak (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 11:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387984AbgJBPak (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 11:30:40 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B50FC0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 08:30:40 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id u21so2578332eja.2
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M6QjC8wDXu6YbtNqxFL7ep0NA+hYSc+Cr6b4CxgP5co=;
        b=HF1LrcZ7OkwY9QvnWIPrwSYQnb1+XqjVXZP5W/LTB3F+pWVUNqSbS7JgGyZFbW+w+p
         RzLLn8mVxMqE7tUixlIzdWLM6tArkXqdfVMgLN8CTttoMjqpDC1I+foYbSUi76G+2tfR
         Jsx8HPcdzKP1dyVUa1Ya7oqkvnBFJPen/+f7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M6QjC8wDXu6YbtNqxFL7ep0NA+hYSc+Cr6b4CxgP5co=;
        b=gEqPFtU+CFlNiBMY+CDtSpz8OqF87f+rEhkeCicE6JESVgxL5IbO2SbLo662pJYkxm
         2l8Gquux+J/q1EaIjpDvg4WKKgkECzx6rYlFhzAqdv9U+dITkuZllpBmmvZVEKnzsoA0
         Gm6rwX+arRb5sTu8HwShqEQbP79vKr5h74aKwn6SARBJecav2BPA9GjkRakBgJ8Mugco
         tzUHnjQizkPJWfRubTCKm7YhmD/E1Iwefr0/+6oW8a0LbVrNUfo7358dVR2enpSAI7cO
         jepDQeKRYnbt5jQMdvyd6UyB9G95P7srY5wdEJFBsJL4d3OLx5FV0CxmQG37LuiUNPpT
         VykA==
X-Gm-Message-State: AOAM532tZcxcHsrQpWWNaZ7Gnu8ys3fmg1GNbX1Rt1cdhu/lwOi90SEk
        mRgI7aOA36zbk5gl1HfOWZZ1lwIG0uijYg==
X-Google-Smtp-Source: ABdhPJxc+FVvbSPFIyDSxh2pXnUKO15dD4YEr80i9h3nWe1hDx5u4dYmoAajZQvqVqg0L9AyR3hUkQ==
X-Received: by 2002:a17:906:9941:: with SMTP id zm1mr2812111ejb.288.1601652638379;
        Fri, 02 Oct 2020 08:30:38 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id y25sm1378075edr.7.2020.10.02.08.30.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 08:30:37 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 13so2098766wmf.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 08:30:37 -0700 (PDT)
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr3507171wmj.116.1601652636571;
 Fri, 02 Oct 2020 08:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
 <20200922113402.12442-7-dafna.hirschfeld@collabora.com> <20200925204222.GG3607091@chromium.org>
 <bebacafe-11bb-5d9a-f889-4d16bb5d1817@collabora.com>
In-Reply-To: <bebacafe-11bb-5d9a-f889-4d16bb5d1817@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 2 Oct 2020 17:30:24 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BeWOYadUU8nBtFpaA5Eb2T0qFk0kDVf9eYmYzXJj+sZA@mail.gmail.com>
Message-ID: <CAAFQd5BeWOYadUU8nBtFpaA5Eb2T0qFk0kDVf9eYmYzXJj+sZA@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] media: staging: rkisp1: remove atomic operations
 for frame sequence
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 2, 2020 at 11:16 AM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi,
>
> Am 25.09.20 um 22:42 schrieb Tomasz Figa:
> > Hi Dafna,
> >
> > On Tue, Sep 22, 2020 at 01:33:56PM +0200, Dafna Hirschfeld wrote:
> >> The isp.frame_sequence is now read only from the irq handlers
> >> that are all fired from the same interrupt, so there is not need
> >> for atomic operation.
> >> In addition, the frame seq incrementation is moved from
> >> rkisp1_isp_queue_event_sof to rkisp1_isp_isr to make the code
> >> clearer and the incorrect inline comment is removed.
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> Acked-by: Helen Koike <helen.koike@collabora.com>
> >>
> >> ---
> >> changes since v2:
> >> add a closing "}" to if condition
> >> remove usless inline comment
> >> ---
> >>   drivers/staging/media/rkisp1/rkisp1-capture.c |  2 +-
> >>   drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +-
> >>   drivers/staging/media/rkisp1/rkisp1-isp.c     | 16 +++++-----------
> >>   drivers/staging/media/rkisp1/rkisp1-params.c  |  2 +-
> >>   drivers/staging/media/rkisp1/rkisp1-stats.c   |  3 +--
> >>   5 files changed, 9 insertions(+), 16 deletions(-)
> >>
> >
> > Thank you for the patch. Please see my comments inline.
> >
> >> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> >> index 0632582a95b4..1c762a369b63 100644
> >> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> >> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> >> @@ -632,7 +632,7 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
> >>      curr_buf = cap->buf.curr;
> >>
> >>      if (curr_buf) {
> >> -            curr_buf->vb.sequence = atomic_read(&isp->frame_sequence);
> >> +            curr_buf->vb.sequence = isp->frame_sequence;
> >
> > I wonder if with higher resolutions, let's say full 5 Mpix, and/or some
> > memory-intensive system load, like video encoding and graphics rendering,
> > the DMA wouldn't take enough time to have the MI_FRAME interrupt fire after
> > the V_START for the next frame.
> >
> > I recall you did some testing back in time [1], showing that the two are
> > interleaved. Do you remember what CAPTURE resolution was it?
>
> I ran the testing again, I added a patch to allow streaming simultanously from
> both pathes: https://gitlab.collabora.com/dafna/linux/-/commit/8df0d15567b27cb88674fbbe33d1906c3c5a91da
> Then I ran two tests:
> stream simultaneously with 3280x2464 frames from the camera, and then downscaling them to 1920x1080 on selfpath, this is http://ix.io/2zoP
> stream simultaneously with 640x480 frames from the camera, and upscaling them to 1920x1080 on the selfpath. this is http://ix.io/2zoR
>
> the pixelformat for both is 422P.
> I don't know how meaningful and useful is to test it on the rockchip-pi4 board, I only use it with a serial console.
> The functionality can probably only be tested on the scarlet.

Okay, thanks. It looks like there is always plenty of time margin on
the hardware side and if the interrupt handling is delayed for a short
time and both are handled by the same handler call, it's also going to
be handled fine because of rkisp1_capture_isr() being called before
rkisp1_isp_isr().

By the way, do we need the MIPI interrupts every frame? Perhaps we
could enable the RKISP1_CIF_MIPI_ERR_CTRL* interrupts only and then,
when we get an error, we disable it and enable
RKISP1_CIF_MIPI_FRAME_END, which would then re-enable
RKISP1_CIF_MIPI_ERR_CTRL* and disable itself? WDYT?

Best regards,
Tomasz

>
> Thanks,
> Dafna
>
>
>
> >
> >>              curr_buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
> >>              curr_buf->vb.field = V4L2_FIELD_NONE;
> >>              vb2_buffer_done(&curr_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> >> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> >> index 232bee92d0eb..51c92a251ea5 100644
> >> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> >> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> >> @@ -131,7 +131,7 @@ struct rkisp1_isp {
> >>      const struct rkisp1_isp_mbus_info *src_fmt;
> >>      struct mutex ops_lock; /* serialize the subdevice ops */
> >>      bool is_dphy_errctrl_disabled;
> >> -    atomic_t frame_sequence;
> >> +    __u32 frame_sequence;
> >
> > nit: The __ prefixed types are defined for the UAPI to avoid covering userspace
> > types. For kernel types please just use the plain u32.
> >
> > Best regards,
> > Tomasz
> >
