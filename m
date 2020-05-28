Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00A81E6B20
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 21:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406547AbgE1Tfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 15:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406506AbgE1Tfx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 15:35:53 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB032C08C5C6
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 12:35:52 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id k19so1014104edv.9
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 12:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nqW3djALsxiW8xcZNR9N6+CiFQBGXa010/gGbeC7zf8=;
        b=K+qgDjOPpGOD92TeM0dxJ6BMbDtrbjReB16r6u0byQd6rQEy3yqpjvCHxFBHdRpY75
         6VErgrdtkqoziHpDFqqBMXp0OlycSswgYfaZzkjLFVWWFjokayqxACLlsywKG2KBDch/
         Cs/nedlmJ+cWqKbIB5QlnygYM2rxa/mQIR0T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nqW3djALsxiW8xcZNR9N6+CiFQBGXa010/gGbeC7zf8=;
        b=aCLXteLlm2efm96JS/sqT5qndcOtBQrEB6ruxzR70cHftZamnbzmwFT3LQXLApbG4K
         9Z3JhOLVKhHccARLscb/3XSDx2Osd4jeEC+0/G/W/S7tDwUVOq4vP67UhraeEvSoh3W6
         bx9N7o+2xDl1c8YVGPSI3iQ+Hm6kz0hgh9OFIrjWN6tXlYya3QYQ0HxYLtCTQ3teQWBV
         N+nf8+R2YIm0eqDKr4Gm+ly8ajMWEtafWzOu3ZvEmN0kh0j9TKw9hXDVIh0Q5iJchlil
         tY27gQUo9HYCgm4lI1iUE0HPVET6ymc0WOfuaBdJu0RJ5Lh7w5Djx6Zbu0meZnij62/O
         p3fw==
X-Gm-Message-State: AOAM5312/iXKNPxXRqq0106IKrxlwEeTov/Ej430H5Vm0z3WHdc7n0EZ
        O7VsVSrkS7vzkdDEI8DuCzCdsadj01ujTw==
X-Google-Smtp-Source: ABdhPJzUfpjVj+C5yQhzgv6sfgn2fkjjr1zyRBITUfIxrkzLWEVBDY0ROFIE1ld/IJkjbhOXF4OzBA==
X-Received: by 2002:a50:c091:: with SMTP id k17mr4786834edf.106.1590694551106;
        Thu, 28 May 2020 12:35:51 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id o19sm5971452ejc.77.2020.05.28.12.35.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 12:35:50 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id r9so282163wmh.2
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 12:35:50 -0700 (PDT)
X-Received: by 2002:a7b:c622:: with SMTP id p2mr4855741wmk.55.1590694549758;
 Thu, 28 May 2020 12:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200512120522.25960-1-dafna.hirschfeld@collabora.com>
 <20200512120522.25960-6-dafna.hirschfeld@collabora.com> <20200521000901.GE25474@pendragon.ideasonboard.com>
 <CAAFQd5AKrbtYMN+h6phaOYveNoUZptVdy+KD-Ef1+on_HXenyA@mail.gmail.com> <8eaaaf8e-2272-3c74-7c8a-6c320f72bc7a@collabora.com>
In-Reply-To: <8eaaaf8e-2272-3c74-7c8a-6c320f72bc7a@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 28 May 2020 21:35:39 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Dkx6D6RZ3rCiftuXOBpP5Qvv292swQJ8bEBiEZVLaogg@mail.gmail.com>
Message-ID: <CAAFQd5Dkx6D6RZ3rCiftuXOBpP5Qvv292swQJ8bEBiEZVLaogg@mail.gmail.com>
Subject: Re: [PATCH 5/5] media: staging: rkisp1: replace workqueue with
 threaded irq for reading statistics registers
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 28, 2020 at 9:19 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi, Tomasz, Laurent, and everyone
>
> On 21.05.20 12:38, Tomasz Figa wrote:
> > Hi Dafna,
> >
> > On Thu, May 21, 2020 at 2:09 AM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> Hi Dafna,
> >>
> >> Thank you for the patch.
> >>
> >> On Tue, May 12, 2020 at 02:05:22PM +0200, Dafna Hirschfeld wrote:
> >>> Reading the statistics registers might take too long
> >>> to run inside the irq handler. Currently it is deferred
> >>> to bottom half using workqueues. This patch replaces the
> >>> workqueue with threaded interrupts for reading the
> >>> statistics registers.
> >>
> >> Could you please explain why this is needed/desired ? Removal of the
> >> kzalloc(GFP_ATOMIC) is very nice, but I'm sure there would have been
> >> ways to avoid it while keeping a workqueue. I'm not claiming the patch
> >> is bad, but I'd like to understand the reason.
> >>
> >
> > Thanks a lot for working on this driver!
> >
> > I'll second what Laurent said. In general, a description of the patch
> > should explain why a change is needed, e.g. what issues it fixes or
> > what improvements it brings.
>
> So from what I understand, the correct way to handle bottom half is
> using threaded interrupts since they run in higher priority.
> In case of this statistics reading for example, we want to read the stats
> as fast as possible once we recieve the interrupt. If we read the stats too
> long after the interrupt was recieved, then the values in the stats registerd
> might have changed by then. Does that make sense?
>
> I use the rockpi4 board to test the code and actually I did an experiment
> of moving the code that reads the stats into the hard irq and it ran
> fine. Maybe you know why the code is currently in a work queue and not
> inside the hard irq? Also, the params struct is of size 5337 bytes and
> the params subdevice can potentionaly run a lot of registers writing but
> for some reasone the code of writing to the params registers still runs
> inside the hard irq.
>

Actually I now recall that we already discussed this in the past with
Ezequiel and Helen and I even measured the time needed to readout the
statistics registers and it was consistently taking between 23 to 40
microseconds. We concluded that it could be just done in the hardirq
handler.

I've added you to that email thread.

> >
> > Also, would you mind adding me on CC for any patches for this driver?
> > Since we use this driver in Chrome OS, I'd like to stay on top of any
> > updates. Thanks in advance!
> sure!
>

Thanks!

[snip]
> >>> -static void
> >>> -rkisp1_stats_send_measurement(struct rkisp1_stats *stats,
> >>> -                           struct rkisp1_isp_readout_work *meas_work)
> >>> +irqreturn_t rkisp1_read_stats_threaded_irq(int irq, void *ctx)
> >>>   {
> >>> +     struct device *dev = ctx;
> >>> +     struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
> >>> +     struct rkisp1_stats *stats = &rkisp1->stats;
> >>> +     struct rkisp1_kstats_buffer *kstats_buf = NULL;
> >>>        struct rkisp1_stat_buffer *cur_stat_buf;
> >>> -     struct rkisp1_buffer *cur_buf = NULL;
> >>> -     unsigned int frame_sequence =
> >>> -             atomic_read(&stats->rkisp1->isp.frame_sequence);
> >>> -     u64 timestamp = ktime_get_ns();
> >>>        unsigned long flags;
> >>> -
> >>> -     if (frame_sequence != meas_work->frame_id) {
> >>> -             dev_warn(stats->rkisp1->dev,
> >>> -                      "Measurement late(%d, %d)\n",
> >>> -                      frame_sequence, meas_work->frame_id);
> >>> -             frame_sequence = meas_work->frame_id;
> >>> -     }
> >>> +     u64 timestamp = ktime_get_ns();
> >>>
> >>>        spin_lock_irqsave(&stats->stats_lock, flags);
> >>> -     /* get one empty buffer */
> >>> -     if (!list_empty(&stats->stat)) {
> >>> -             cur_buf = list_first_entry(&stats->stat,
> >>> -                                        struct rkisp1_buffer, queue);
> >>> -             list_del(&cur_buf->queue);
> >>> +     if (!stats->is_streaming) {
> >>> +             spin_unlock_irqrestore(&stats->stats_lock, flags);
> >>> +             return IRQ_HANDLED;
> >>> +     }
> >>> +     if (list_empty(&stats->stat)) {
> >>> +             spin_unlock_irqrestore(&stats->stats_lock, flags);
> >>> +             WARN("%s: threaded irq waked but there are no buffers",
> >>> +                  __func__);
> >>> +             return IRQ_HANDLED;
> >>> +     }
> >>> +     kstats_buf = list_first_entry(&stats->stat,
> >>> +                                   struct rkisp1_kstats_buffer, buff.queue);
> >>> +
> >>> +     /*
> >>> +      * each waked irq thread reads exactly one ready statistics
> >>> +      * so it is a bug  if no statistics are ready
> >>> +      */
> >>
> >> What happens if this function takes too long to run ? With the
> >> workqueue, if the work gets delayed once in a while, the work items will
> >> accumulate, and all of them will be handled eventually. Here it seems
> >> that an IRQ could get lost.
>
> If the irs runs and there are no available buffers then indeed we lost the interrupt.
> You think it might be a problem if userspace expect an associated stats buffer
> for every recieved frame?
> Also with workqueue we will lose the stats if we don't have an available buffer
> when the workqueue runs.

I believe this hardware doesn't do any buffering internally, so if one
doesn't read the statistics in time, the values are lost, because they
are overridden with the ones coming from the next frame. So actually
hardirq might be a better context to do the read-out indeed.

Best regards,
Tomasz
