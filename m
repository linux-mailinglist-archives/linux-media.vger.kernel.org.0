Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A50676499F
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 09:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbjG0H6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 03:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233477AbjG0H5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 03:57:37 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B773AB7
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 00:55:04 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-76731802203so57506785a.3
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690444502; x=1691049302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6NJUz38HTUn5Lzf1Xa0ODFyXspS2ZmT9vChRAq/stA=;
        b=IYqyqWWRS1zPU+/f6hElNXBsiFZ6Uu5xVx/wagwU2bzF1OoYMp7rChZr46iljgJ2ov
         /KGYrChrKUEw2fMdw5tx4gBVLVFhHW6IoFqv12fhP1+uGsa7+bRPLQ5s6XVc+m34a7ho
         PxOyjP0byhyIUYb8hEDLlZJCHnCys2Oe+0iHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690444502; x=1691049302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6NJUz38HTUn5Lzf1Xa0ODFyXspS2ZmT9vChRAq/stA=;
        b=IDH1c1TU+7D/zlFM3GFf/ZVFcqfqZ4oVH6etGsCfcOxJAqczD/nT9KZ2U6xgdEsDef
         UfM5nX5ZwQ/JdyXxRc44F0Pgdsi564/tjhnZWKY/odJhoco+5b9PrYRXm1u9uGoESH+o
         ZxAA2xa4JOiCX8uVamiBMrxcZAQ/GdGeidYE3YRwQumc7D+zmWkNQ3BGI8TiRgwyjw9F
         HuuIoO9ZtfV/fLLF/zwVWoBApHGUsTtm8cuKutFQ8EM43r2N5QvhhbQcwte7jwBnX+Hu
         8wtqig0ahfonfWHsnuJ7nNZlpsFB/c82o3rV1fXTlk9sAJdLNr/O84B0Hw7TQh9ewaLY
         ouxQ==
X-Gm-Message-State: ABy/qLYoBSohw7nta8I2IFNolqD4BRQZ19qO0SLz4e6RhtBKPz8LG6tp
        2NajoAQrBGwE7lmOYivLBgpWEnqceGtCU8TrZzI0Qw==
X-Google-Smtp-Source: APBJJlFVdK3dgQiGQbCGtzHO5HAU734tkg07rpZG/vGBcSN0sV11N9GEP40A6EOc7GL2nRzEEsONoQ==
X-Received: by 2002:a37:ac05:0:b0:768:125b:2b67 with SMTP id e5-20020a37ac05000000b00768125b2b67mr4446116qkm.33.1690444502717;
        Thu, 27 Jul 2023 00:55:02 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id os31-20020a05620a811f00b00767e20c4267sm242824qkn.61.2023.07.27.00.55.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 00:55:02 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-765a4ff26cdso59053985a.0
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 00:55:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:767:81fc:c6b8 with SMTP id
 m21-20020a05620a291500b0076781fcc6b8mr5945598qkp.6.1690444501768; Thu, 27 Jul
 2023 00:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230704040044.681850-1-randy.li@synaptics.com>
 <20230704040044.681850-3-randy.li@synaptics.com> <20230712093301.nkj2vok2x7esdhb3@chromium.org>
 <4e70c8b8-d459-2b79-2b3d-40875f701d97@synaptics.com> <CAAFQd5CGO4iiC7HX9wTetuzjZyaAsKStFOpxqcFkZ_o-eJOPtg@mail.gmail.com>
 <ca16e2d6-a1c7-bff6-496f-07174f379fd9@synaptics.com>
In-Reply-To: <ca16e2d6-a1c7-bff6-496f-07174f379fd9@synaptics.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 27 Jul 2023 16:54:49 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DbF_=_ZE3M=g0qjhizDBKy2dbsDxW5fWgUXXFHMoQwzQ@mail.gmail.com>
Message-ID: <CAAFQd5DbF_=_ZE3M=g0qjhizDBKy2dbsDxW5fWgUXXFHMoQwzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: v4l2-mem2mem: add a list for buf used by hw
To:     Hsia-Jun Li <Randy.Li@synaptics.com>
Cc:     linux-media@vger.kernel.org, ayaka@soulik.info,
        hans.verkuil@cisco.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, hiroh@chromium.org,
        hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        nicolas@ndufresne.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 27, 2023 at 4:33=E2=80=AFPM Hsia-Jun Li <Randy.Li@synaptics.com=
> wrote:
>
>
>
> On 7/27/23 15:25, Tomasz Figa wrote:
> > CAUTION: Email originated externally, do not click links or open attach=
ments unless you recognize the sender and know the content is safe.
> >
> >
> > On Mon, Jul 17, 2023 at 4:15=E2=80=AFPM Hsia-Jun Li <Randy.Li@synaptics=
.com> wrote:
> >>
> >>
> >> On 7/12/23 17:33, Tomasz Figa wrote:
> >>> CAUTION: Email originated externally, do not click links or open atta=
chments unless you recognize the sender and know the content is safe.
> >>>
> >>>
> >>> On Tue, Jul 04, 2023 at 12:00:38PM +0800, Hsia-Jun Li wrote:
> >>>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> >>>>
> >>>> Many drivers have to create its own buf_struct for a
> >>>> vb2_queue to track such a state. Also driver has to
> >>>> iterate over rdy_queue every times to find out a buffer
> >>>> which is not sent to hardware(or firmware), this new
> >>>> list just offers the driver a place to store the buffer
> >>>> that hardware(firmware) has acknowledged.
> >>>>
> >>>> One important advance about this list, it doesn't like
> >>>> rdy_queue which both bottom half of the user calling
> >>>> could operate it, while the v4l2 worker would as well.
> >>>> The v4l2 core could only operate this queue when its
> >>>> v4l2_context is not running, the driver would only
> >>>> access this new hw_queue in its own worker.
> >>> Could you describe in what case such a list would be useful for a
> >>> mem2mem driver?
> >>
> >> This list, as its description, just for saving us from creating a
> >> private buffer struct to track buffer state.
> >>
> >> The queue in the kernel is not the queue that hardware(codec firmware)
> >> are using.
> >>
> >
> > Sorry, I find the description difficult to understand. It might make
> > sense to have the text proofread by someone experienced in writing
> > technical documentation in English before posting in the future.
> > Thanks.
> >
> Sorry, I may not be able to get more resource here. I would try to ask a
> chatbot to fix my description next time.

I think people on the linux-media IRC channel (including me) could
also be willing to help with rephrasing things, but if a chatbot can
do it too, it's even better. :)

> > I think I got the point from Nicolas' explanation, though.
> >
> >>
> >>>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> >>>> ---
> >>>>    drivers/media/v4l2-core/v4l2-mem2mem.c | 25 +++++++++++++++++----=
----
> >>>>    include/media/v4l2-mem2mem.h           | 10 +++++++++-
> >>>>    2 files changed, 26 insertions(+), 9 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/=
v4l2-core/v4l2-mem2mem.c
> >>>> index c771aba42015..b4151147d5bd 100644
> >>>> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> >>>> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> >>>> @@ -321,15 +321,21 @@ static void __v4l2_m2m_try_queue(struct v4l2_m=
2m_dev *m2m_dev,
> >>>>                 goto job_unlock;
> >>>>         }
> >>>>
> >>>> -     src =3D v4l2_m2m_next_src_buf(m2m_ctx);
> >>>> -     dst =3D v4l2_m2m_next_dst_buf(m2m_ctx);
> >>>> -     if (!src && !m2m_ctx->out_q_ctx.buffered) {
> >>>> -             dprintk("No input buffers available\n");
> >>>> -             goto job_unlock;
> >>>> +     if (list_empty(&m2m_ctx->out_q_ctx.hw_queue)) {
> >>>> +             src =3D v4l2_m2m_next_src_buf(m2m_ctx);
> >>>> +
> >>>> +             if (!src && !m2m_ctx->out_q_ctx.buffered) {
> >>>> +                     dprintk("No input buffers available\n");
> >>>> +                     goto job_unlock;
> >>>> +             }
> >>>>         }
> >>>> -     if (!dst && !m2m_ctx->cap_q_ctx.buffered) {
> >>>> -             dprintk("No output buffers available\n");
> >>>> -             goto job_unlock;
> >>>> +
> >>>> +     if (list_empty(&m2m_ctx->cap_q_ctx.hw_queue)) {
> >>>> +             dst =3D v4l2_m2m_next_dst_buf(m2m_ctx);
> >>>> +             if (!dst && !m2m_ctx->cap_q_ctx.buffered) {
> >>>> +                     dprintk("No output buffers available\n");
> >>>> +                     goto job_unlock;
> >>>> +             }
> >>>>         }
> >>> src and dst would be referenced unitialized below if neither of the
> >>> above ifs hits...
> >> I think they have been initialized at v4l2_m2m_ctx_init()
> >
> > What do you mean? They are local variables in this function.
> >
> Sorry, I didn't notice the sentence after that.
> >>>
> >>> Best regards,
> >>> Tomasz
> >>>
> >>>>         m2m_ctx->new_frame =3D true;
> >>>> @@ -896,6 +902,7 @@ int v4l2_m2m_streamoff(struct file *file, struct=
 v4l2_m2m_ctx *m2m_ctx,
> >>>>         INIT_LIST_HEAD(&q_ctx->rdy_queue);
> >>>>         q_ctx->num_rdy =3D 0;
> >>>>         spin_unlock_irqrestore(&q_ctx->rdy_spinlock, flags);
> >>>> +     INIT_LIST_HEAD(&q_ctx->hw_queue);
> >>>>
> >>>>         if (m2m_dev->curr_ctx =3D=3D m2m_ctx) {
> >>>>                 m2m_dev->curr_ctx =3D NULL;
> >>>> @@ -1234,6 +1241,8 @@ struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(struct =
v4l2_m2m_dev *m2m_dev,
> >>>>
> >>>>         INIT_LIST_HEAD(&out_q_ctx->rdy_queue);
> >>>>         INIT_LIST_HEAD(&cap_q_ctx->rdy_queue);
> >>>> +     INIT_LIST_HEAD(&out_q_ctx->hw_queue);
> >>>> +     INIT_LIST_HEAD(&cap_q_ctx->hw_queue);
> >>>>         spin_lock_init(&out_q_ctx->rdy_spinlock);
> >>>>         spin_lock_init(&cap_q_ctx->rdy_spinlock);
> >>>>
> >>>> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2m=
em.h
> >>>> index d6c8eb2b5201..2342656e582d 100644
> >>>> --- a/include/media/v4l2-mem2mem.h
> >>>> +++ b/include/media/v4l2-mem2mem.h
> >>>> @@ -53,9 +53,16 @@ struct v4l2_m2m_dev;
> >>>>     *   processed
> >>>>     *
> >>>>     * @q:               pointer to struct &vb2_queue
> >>>> - * @rdy_queue:       List of V4L2 mem-to-mem queues
> >>>> + * @rdy_queue:       List of V4L2 mem-to-mem queues. If v4l2_m2m_bu=
f_queue() is
> >>>> + *           called in struct vb2_ops->buf_queue(), the buffer enqu=
eued
> >>>> + *           by user would be added to this list.
> >>>>     * @rdy_spinlock: spin lock to protect the struct usage
> >>>>     * @num_rdy: number of buffers ready to be processed
> >>>> + * @hw_queue:        A list for tracking the buffer is occupied by =
the hardware
> >>>> + *           (or device's firmware). A buffer could only be in eith=
er
> >>>> + *           this list or @rdy_queue.
> >>>> + *           Driver may choose not to use this list while uses its =
own
> >>>> + *           private data to do this work.
> >>>>     * @buffered:        is the queue buffered?
> >>>>     *
> >>>>     * Queue for buffers ready to be processed as soon as this
> >>>> @@ -68,6 +75,7 @@ struct v4l2_m2m_queue_ctx {
> >>>>         struct list_head        rdy_queue;
> >>>>         spinlock_t              rdy_spinlock;
> >>>>         u8                      num_rdy;
> >>>> +     struct list_head        hw_queue;
> >>>>         bool                    buffered;
> >>>>    };
> >>>>
> >>>> --
> >>>> 2.17.1
> >>>>
> >> --
> >> Hsia-Jun(Randy) Li
> >>
>
> --
> Hsia-Jun(Randy) Li
