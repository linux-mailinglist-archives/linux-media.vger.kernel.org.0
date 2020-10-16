Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787282907C7
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 16:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409418AbgJPOxY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 10:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409215AbgJPOxX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 10:53:23 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B65C0613D3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 07:53:22 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id c22so3625761ejx.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 07:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JbcxjXmky0ZVQym5aCWYX3Osbuks/NOgNftBZgZ9Csk=;
        b=hlcWzha/+Oc8NDyB60ArQltW+/tTS8Fjn/mQpq1Wz9D3jC2RbaURqTddcw4vdD19JO
         0KjZMSXruF9wuBHm8meYOzM6XKtk7Zzj+qjiLpaW0EwUlu6G2TyH1WwmCpQjhS/AhQhz
         SGuJgrvu1MxYOmk5UzK3pZolrY1GDAA04lnCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JbcxjXmky0ZVQym5aCWYX3Osbuks/NOgNftBZgZ9Csk=;
        b=HAuEMUUSEAg6xNEoSv5Cu0J5PGki58XvHMtBlnDxwvG4aUsJnV+zUv90hEctGVhAVe
         eRRDxw1YsoMIF8g49PbLm+uC60eT1V6ykIoOqMsVsxFeNrKf96wVMy8U6D4A99v1yGsm
         tJBMFnlpgPFqtC/+g1l2DIqg3SIAUfs7Z+EDBjVy0fbxRkJG8q6vfB7xLadWh4atIEtt
         OnRfGj1lIq3A1M88L4YioB1dIohww9rfnMe09rtH5T+NbjvW72Uu6k/6eJzsNMqWSDIN
         rbvfF2ksfAnp3+8lbJ4DE0P5f0HwFQYrPR9554Fg6XtrpHHPRZmpuNCZ13wxPTTiu4Ke
         auFQ==
X-Gm-Message-State: AOAM531aCG9KsJPE1Wr+2EhXEueHvTJbgjF4heLk8FSSKX0pPWwFuRn/
        yn4zHabPbL4mhR4KgWLbJjW7kJjWLJG+1A==
X-Google-Smtp-Source: ABdhPJwG9twC7mJsDncpj4FoFZEsSlff5UQDGQdbmZAcE8S0Knix7LqNy9i3TbAor/QIfUUuYyxV2g==
X-Received: by 2002:a17:907:429f:: with SMTP id ny23mr4035036ejb.150.1602860000752;
        Fri, 16 Oct 2020 07:53:20 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id w4sm1717914eds.83.2020.10.16.07.53.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2020 07:53:19 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id b127so3266124wmb.3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 07:53:19 -0700 (PDT)
X-Received: by 2002:a1c:8057:: with SMTP id b84mr4150078wmd.116.1602859998763;
 Fri, 16 Oct 2020 07:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201015195746.264722-1-helen.koike@collabora.com> <8b31c5a3-9b01-9536-384a-b06d9a0a2e1a@collabora.com>
In-Reply-To: <8b31c5a3-9b01-9536-384a-b06d9a0a2e1a@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 16 Oct 2020 16:53:07 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CBBgrr2MckWua4XiM8paydevVkckfhHibTs-hVhFpWiQ@mail.gmail.com>
Message-ID: <CAAFQd5CBBgrr2MckWua4XiM8paydevVkckfhHibTs-hVhFpWiQ@mail.gmail.com>
Subject: Re: [PATCH] media: staging: rkisp1: cap: refactor enable/disable
 stream to allow multistreaming
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 16, 2020 at 4:28 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi,
>
> Am 15.10.20 um 21:57 schrieb Helen Koike:
> > Allow streaming from self picture path and main picture path at the same
> > time.
> >
> > Take care for s_stream() callbacks to not be called twice.
> > When starting a stream, s_stream(true) shouldn't be called for the isp
> > and the sensor if the other stream is already enabled (since it was
> > already called).
> > When stopping a stream, s_stream(false) shouldn't be called for isp and
> > the sensor if the other stream is still enabled.
> >
> > Remove the callback function scheme for navigating through the topology,
> > simplifying the code, improving readability, while calling
> > media_pipeline_{start,stop}() in the right order.
> >
> > Remove multistreaming item from the TODO list.
> >
> > Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >
> > ---
> > Hello,
> >
> > Since we didn't reach an agreement on the helpers in the core[1], I'm
> > sending this patch to fix this limitation only for rkisp1.
> >
> > [1] https://patchwork.linuxtv.org/project/linux-media/cover/20200415013044.1778572-1-helen.koike@collabora.com/
> >
> > If we decide to add the helpers in the future, we can clean up drivers
> > even more, but I don't want to block this feature.
> >
> > Overview of the patch:
> > ======================
> >
> > * Rename rkisp1_stream_{start,stop}() to
> >    rkisp1_cap_stream_{enable,disable}() to clarify the difference between
> >    other stream enable/disable functions
> >
> > * Implement rkisp1_pipeline_stream_{enable,disable}() to replace
> >    rkisp1_pipeline_{enable,disable}_cb() and rkisp1_pipeline_sink_walk(),
> >    which were removed.
> >
> > * Call rkisp1_cap_stream_{enable,disable}() from
> >    rkisp1_pipeline_stream_{enable,disable}() for better
> >    unwind handling and function name semantics.
> >
> > * Call media_pipeline_{start,stop}() in the right order.
> >
> > * Remove item from TODO list (I also reviewed the use of the
> >    is_streaming var in the code and lgtm).
> >
> > This patch was tested on rockpi4 board with:
> > ============================================
> >
> > "media-ctl" "-d" "platform:rkisp1" "-r"
> > "media-ctl" "-d" "platform:rkisp1" "-l" "'imx219 4-0010':0 -> 'rkisp1_isp':0 [1]"
> > "media-ctl" "-d" "platform:rkisp1" "-l" "'rkisp1_isp':2 -> 'rkisp1_resizer_selfpath':0 [1]"
> > "media-ctl" "-d" "platform:rkisp1" "-l" "'rkisp1_isp':2 -> 'rkisp1_resizer_mainpath':0 [1]"
> >
> > "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"imx219 4-0010":0 [fmt:SRGGB10_1X10/1640x1232]'
> >
> > "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_isp":0 [fmt:SRGGB10_1X10/1640x1232 crop: (0,0)/1600x1200]'
> > "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_isp":2 [fmt:YUYV8_2X8/1600x1200 crop: (0,0)/1500x1100]'
> >
> > "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_resizer_selfpath":0 [fmt:YUYV8_2X8/1500x1100 crop: (300,400)/1400x1000]'
> > "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_resizer_selfpath":1 [fmt:YUYV8_2X8/900x800]'
> >
> > "v4l2-ctl" "-z" "platform:rkisp1" "-d" "rkisp1_selfpath" "-v" "width=900,height=800,"
> > "v4l2-ctl" "-z" "platform:rkisp1" "-d" "rkisp1_selfpath" "-v" "pixelformat=422P"
> >
> > "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_resizer_mainpath":0 [fmt:YUYV8_2X8/1500x1100 crop: (300,400)/1400x1000]'
> > "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_resizer_mainpath":1 [fmt:YUYV8_2X8/900x800]'
> >
> > "v4l2-ctl" "-z" "platform:rkisp1" "-d" "rkisp1_mainpath" "-v" "width=900,height=800,"
> > "v4l2-ctl" "-z" "platform:rkisp1" "-d" "rkisp1_mainpath" "-v" "pixelformat=422P"
> >
> > sleep 1
> >
> > time v4l2-ctl "-z" "platform:rkisp1" "-d" "rkisp1_mainpath" "--stream-mmap" "--stream-count" "100" &
> > time v4l2-ctl "-z" "platform:rkisp1" "-d" "rkisp1_selfpath" "--stream-mmap" "--stream-count" "100" &
> >
> > wait
> > echo "Completed"
> >
> > Thanks
> > Helen
> > ---
> >   drivers/staging/media/rkisp1/TODO             |   3 -
> >   drivers/staging/media/rkisp1/rkisp1-capture.c | 227 +++++++++---------
> >   2 files changed, 113 insertions(+), 117 deletions(-)
> >
> > diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> > index e7c8398fc2cef..a2dd0ad951c25 100644
> > --- a/drivers/staging/media/rkisp1/TODO
> > +++ b/drivers/staging/media/rkisp1/TODO
> > @@ -1,9 +1,6 @@
> >   * Fix pad format size for statistics and parameters entities.
> >   * Fix checkpatch errors.
> >   * Add uapi docs. Remember to add documentation of how quantization is handled.
> > -* streaming paths (mainpath and selfpath) check if the other path is streaming
> > -in several places of the code, review this, specially that it doesn't seem it
> > -supports streaming from both paths at the same time.
> >
> >   NOTES:
> >   * All v4l2-compliance test must pass.
> > diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> > index b6f497ce3e95c..254936873c6c1 100644
> > --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> > +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> > @@ -830,71 +830,43 @@ static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
> >   }
> >
> >   /*
> > - * rkisp1_pipeline_sink_walk - Walk through the pipeline and call cb
> > - * @from: entity at which to start pipeline walk
> > - * @until: entity at which to stop pipeline walk
> > - *
> > - * Walk the entities chain starting at the pipeline video node and stop
> > - * all subdevices in the chain.
> > - *
> > - * If the until argument isn't NULL, stop the pipeline walk when reaching the
> > - * until entity. This is used to disable a partially started pipeline due to a
> > - * subdev start error.
> > + * Most of registers inside rockchip ISP1 have shadow register since
> > + * they must be not be changed during processing a frame.
> > + * Usually, each sub-module updates its shadow register after
> > + * processing the last pixel of a frame.
> >    */
> > -static int rkisp1_pipeline_sink_walk(struct media_entity *from,
> > -                                  struct media_entity *until,
> > -                                  int (*cb)(struct media_entity *from,
> > -                                            struct media_entity *curr))
> > +static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
> >   {
> > -     struct media_entity *entity = from;
> > -     struct media_pad *pad;
> > -     unsigned int i;
> > -     int ret;
> > -
> > -     while (1) {
> > -             pad = NULL;
> > -             /* Find remote source pad */
> > -             for (i = 0; i < entity->num_pads; i++) {
> > -                     struct media_pad *spad = &entity->pads[i];
> > -
> > -                     if (!(spad->flags & MEDIA_PAD_FL_SINK))
> > -                             continue;
> > -                     pad = media_entity_remote_pad(spad);
> > -                     if (pad && is_media_entity_v4l2_subdev(pad->entity))
> > -                             break;
> > -             }
> > -             if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> > -                     break;
> > +     struct rkisp1_device *rkisp1 = cap->rkisp1;
> > +     struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
> >
> > -             entity = pad->entity;
> > -             if (entity == until)
> > -                     break;
> > +     cap->ops->set_data_path(cap);
> > +     cap->ops->config(cap);
> >
> > -             ret = cb(from, entity);
> > -             if (ret)
> > -                     return ret;
> > +     /* Setup a buffer for the next frame */
> > +     spin_lock_irq(&cap->buf.lock);
> > +     rkisp1_set_next_buf(cap);
> > +     cap->ops->enable(cap);
> > +     /* It's safe to config ACTIVE and SHADOW regs for the
> > +      * first stream. While when the second is starting, do NOT
> > +      * force update because it also update the first one.
> > +      *
> > +      * The latter case would drop one more buf(that is 2) since
> > +      * there's not buf in shadow when the second FE received. This's
> > +      * also required because the second FE maybe corrupt especially
> > +      * when run at 120fps.
> > +      */
> > +     if (!other->is_streaming) {
> > +             /* force cfg update */
> > +             rkisp1_write(rkisp1,
> > +                          RKISP1_CIF_MI_INIT_SOFT_UPD, RKISP1_CIF_MI_INIT);
> > +             rkisp1_set_next_buf(cap);
> >       }
> > -
> > -     return 0;
> > -}
> > -
> > -static int rkisp1_pipeline_disable_cb(struct media_entity *from,
> > -                                   struct media_entity *curr)
> > -{
> > -     struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
> > -
> > -     return v4l2_subdev_call(sd, video, s_stream, false);
> > -}
> > -
> > -static int rkisp1_pipeline_enable_cb(struct media_entity *from,
> > -                                  struct media_entity *curr)
> > -{
> > -     struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
> > -
> > -     return v4l2_subdev_call(sd, video, s_stream, true);
> > +     spin_unlock_irq(&cap->buf.lock);
> > +     cap->is_streaming = true;
> >   }
> >
> > -static void rkisp1_stream_stop(struct rkisp1_capture *cap)
> > +static void rkisp1_cap_stream_disable(struct rkisp1_capture *cap)
> >   {
> >       int ret;
> >
> > @@ -911,6 +883,81 @@ static void rkisp1_stream_stop(struct rkisp1_capture *cap)
> >       }
> >   }
> >
> > +/*
> > + * rkisp1_pipeline_stream_disable - disable nodes in the pipeline
> > + *
> > + * Call s_stream(false) in the reverse order from
> > + * rkisp1_pipeline_stream_enable() and disable the DMA engine.
> > + * Should be called before media_pipeline_stop()
> > + */
> > +static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
> > +     __must_hold(&cap->rkisp1->stream_lock)
> > +{
> > +     struct rkisp1_device *rkisp1 = cap->rkisp1;
> > +
> > +     rkisp1_cap_stream_disable(cap);
> > +
> > +     /*
> > +      * If the other capture is streaming, isp and sensor nodes shouldn't
> > +      * be disabled, skip them.
> > +      */
> > +     if (rkisp1->pipe.streaming_count < 2) {
> > +             v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
> > +                              false);
> > +             v4l2_subdev_call(&rkisp1->isp.sd, video, s_stream, false);
> > +     }
> > +
> > +     v4l2_subdev_call(&rkisp1->resizer_devs[cap->id].sd, video, s_stream,
> > +                      false);
>
> I wonder if the order of the disable matters. If it should be from the sensor up to the
> capture then we should call 'rkisp1_cap_stream_disable' at the end of this
> function.

According to our downstream code [1] and my recollection of discussion
with Rockchip, the power up order was:
 - ISP
 - sensor
 - PHY
and power down the opposite.

That said, the sensor drivers we had didn't implement s_power and used
runtime PM at streaming time, so I think in practice the order ended
up as:
 - ISP,
 - PHY,
 - sensor.

The streaming enable order [2] was:
 - ISP,
 - PHY,
 - sensor
and disable:
 - PHY,
 - sensor,
 - ISP.

It's possible that the powering order probably was irrelevant and just
the streaming itself is important or actually it doesn't matter. Some
testing would be appreciated.

[1] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/master:src/third_party/kernel/v4.4/drivers/media/platform/rockchip/isp1/dev.c;drc=4372c82fc2f0d63b4fbb5390e72464709f8a34e9;l=110
[2] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/master:src/third_party/kernel/v4.4/drivers/media/platform/rockchip/isp1/dev.c;drc=4372c82fc2f0d63b4fbb5390e72464709f8a34e9;l=175

Best regards,
Tomasz
