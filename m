Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE0EE766349
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 06:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbjG1EoD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 00:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbjG1En7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 00:43:59 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F703A85
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 21:43:54 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-406b9bcad5dso9390961cf.2
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 21:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690519433; x=1691124233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJXU0zdhDbd4PjwjLH9DqPwBcwJ9xMKRgNCiI/oFA1A=;
        b=NBRh9FGpapv2z+2LWGmtrrwBlwGmUPGh4FTiWXarg2dZGonnh8zzoCz6zsi56UQ+MN
         WCtGMFTI5TyocSPQ5QWDVS4donaLd0kZGpLJY/MbnGa9ip00X5+C9Zn+CgLJ4KFeXX7Z
         oyT6t+6W9pbzsOhFD5y1yq7ZpAFX3J2+cTd6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690519433; x=1691124233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJXU0zdhDbd4PjwjLH9DqPwBcwJ9xMKRgNCiI/oFA1A=;
        b=Kn7Nq5dmdLQFOk4vGlYtiiRTI0+Cb3BsktPcByviznTAoAbAz73tWJETUSjRITOkKj
         8NHckmnGPXNriGwggb3G3K12892lGidnqf99lHLw8/PkTm3aMNtWoC/v6DaPb3PyzQ6c
         mCnfpm2dDJqyWKSidEC9hISarYIJ/nwEge/BtKckZ2/3l3RPOFFC3XllRsq60jSh26Cx
         24DydNjfI7VCMs9btrqEQT9cLvvShTX8xUh7Aa+Hn1gUpFUVdU7eYjBRJd1babBXoJ4/
         /Vn6J9MtONaDWbn9hX1+XM1CT7isxXmqgeNd3gSVO3aW2Hk814cfsuq9E8mhtNWl7fHN
         Ox4w==
X-Gm-Message-State: ABy/qLbsxSpNciuYG9SdP8exrypsAna76gYhCefTmUIT4XYLG8cb55Eg
        sf293ku5fKCH7fsTYilLv7MyZ6yHJL0r+s3tdbSntw==
X-Google-Smtp-Source: APBJJlHLRor1WU5aNmhlGdJdQ2xAQjiCbYfrO55SWf/OR+Y7y8qT9gKCp8vFwQ4aQU9DMXaC/mB2iw==
X-Received: by 2002:a05:620a:1a24:b0:767:35a:5f19 with SMTP id bk36-20020a05620a1a2400b00767035a5f19mr1618028qkb.14.1690519432685;
        Thu, 27 Jul 2023 21:43:52 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id s26-20020a05620a031a00b00765a676b75csm886524qkm.21.2023.07.27.21.43.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 21:43:52 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-767b6d6bb87so129700285a.2
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 21:43:51 -0700 (PDT)
X-Received: by 2002:a05:620a:d88:b0:765:aa35:f03f with SMTP id
 q8-20020a05620a0d8800b00765aa35f03fmr1369543qkl.37.1690519431101; Thu, 27 Jul
 2023 21:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230704040044.681850-1-randy.li@synaptics.com>
 <20230704040044.681850-3-randy.li@synaptics.com> <20230712093301.nkj2vok2x7esdhb3@chromium.org>
 <f8f766c0166c502e29b06cda71f6531e44a91a17.camel@ndufresne.ca>
 <CAAFQd5CO4TS6wMsnaL7ob4CXogj5KT52x85YUUN1ZwDkOxW0oQ@mail.gmail.com> <583e22718b80cc5e1ae631528c83c95e97de5cae.camel@ndufresne.ca>
In-Reply-To: <583e22718b80cc5e1ae631528c83c95e97de5cae.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 28 Jul 2023 13:43:39 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CAJ7GxiY5=bBAa+L=1WJth6QZ3+PG83=GX+eEx1S4uhg@mail.gmail.com>
Message-ID: <CAAFQd5CAJ7GxiY5=bBAa+L=1WJth6QZ3+PG83=GX+eEx1S4uhg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: v4l2-mem2mem: add a list for buf used by hw
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hsia-Jun Li <randy.li@synaptics.com>
Cc:     linux-media@vger.kernel.org, ayaka@soulik.info,
        hans.verkuil@cisco.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, hiroh@chromium.org,
        hverkuil@xs4all.nl, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 28, 2023 at 1:58=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Le jeudi 27 juillet 2023 =C3=A0 16:43 +0900, Tomasz Figa a =C3=A9crit :
> > On Mon, Jul 17, 2023 at 11:07=E2=80=AFPM Nicolas Dufresne <nicolas@nduf=
resne.ca> wrote:
> > >
> > > Le mercredi 12 juillet 2023 =C3=A0 09:33 +0000, Tomasz Figa a =C3=A9c=
rit :
> > > > On Tue, Jul 04, 2023 at 12:00:38PM +0800, Hsia-Jun Li wrote:
> > > > > From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> > > > >
> > > > > Many drivers have to create its own buf_struct for a
> > > > > vb2_queue to track such a state. Also driver has to
> > > > > iterate over rdy_queue every times to find out a buffer
> > > > > which is not sent to hardware(or firmware), this new
> > > > > list just offers the driver a place to store the buffer
> > > > > that hardware(firmware) has acknowledged.
> > > > >
> > > > > One important advance about this list, it doesn't like
> > > > > rdy_queue which both bottom half of the user calling
> > > > > could operate it, while the v4l2 worker would as well.
> > > > > The v4l2 core could only operate this queue when its
> > > > > v4l2_context is not running, the driver would only
> > > > > access this new hw_queue in its own worker.
> > > >
> > > > Could you describe in what case such a list would be useful for a
> > > > mem2mem driver?
> > >
> > > Today all driver must track buffers that are "owned by the hardware".=
 This is a
> > > concept dictated by the m2m framework and enforced through the ACTIVE=
 flag. All
> > > buffers from this list must be mark as done/error/queued after stream=
off of the
> > > respective queue in order to acknowledge that they are no longer in u=
se by the
> > > HW. Not doing so will warn:
> > >
> > >   videobuf2_common: driver bug: stop_streaming operation is leaving b=
uf ...
> > >
> > > Though, there is no queue to easily iterate them. All driver endup ha=
ving their
> > > own queue, or just leaving the buffers in the rdy_queue (which isn't =
better).
> > >
> >
> > Thanks for the explanation. I see how it could be useful now.
> >
> > Although I guess this is a problem specifically for hardware (or
> > firmware) which can internally queue more than 1 buffer, right?
> > Otherwise the current buffer could just stay at the top of the
> > rdy_queue until it's removed by the driver's completion handler,
> > timeout/error handler or context destruction.
>
> Correct, its only an issue when you need to process multiple src buffers =
before
> producing a dst buffer. If affects stateful decoder, stateful encoders an=
d
> deinterlacer as far as I'm aware.

Is it actually necessary to keep those buffers in a list in that case, thou=
gh?
I can see that a deinterlacer would indeed need 2 input buffers to
perform the deinterlacing operation, but those would be just known to
the driver, since it's running the task currently.
For a stateful decoder, wouldn't it just consume the bitstream buffer
(producing something partially decoded to its own internal buffers)
and return it shortly?
The most realistic scenario would be for stateful encoders which could
keep some input buffers as reference frames for further encoding, but
then would this patch actually work for them? It would make
__v4l2_m2m_try_queue never add the context to the job_queue if there
are some buffers in that hw_queue list.

Maybe what I need here are actual patches modifying some existing
drivers. Randy, would you be able to include that in the next version?
Thanks.

Best regards,
Tomasz

>
> Nicolas
>
> >
> > Best regards,
> > Tomasz
> >
> > > Nicolas
> > > >
> > > > >
> > > > > Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> > > > > ---
> > > > >  drivers/media/v4l2-core/v4l2-mem2mem.c | 25 +++++++++++++++++---=
-----
> > > > >  include/media/v4l2-mem2mem.h           | 10 +++++++++-
> > > > >  2 files changed, 26 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/med=
ia/v4l2-core/v4l2-mem2mem.c
> > > > > index c771aba42015..b4151147d5bd 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > > > > @@ -321,15 +321,21 @@ static void __v4l2_m2m_try_queue(struct v4l=
2_m2m_dev *m2m_dev,
> > > > >             goto job_unlock;
> > > > >     }
> > > > >
> > > > > -   src =3D v4l2_m2m_next_src_buf(m2m_ctx);
> > > > > -   dst =3D v4l2_m2m_next_dst_buf(m2m_ctx);
> > > > > -   if (!src && !m2m_ctx->out_q_ctx.buffered) {
> > > > > -           dprintk("No input buffers available\n");
> > > > > -           goto job_unlock;
> > > > > +   if (list_empty(&m2m_ctx->out_q_ctx.hw_queue)) {
> > > > > +           src =3D v4l2_m2m_next_src_buf(m2m_ctx);
> > > > > +
> > > > > +           if (!src && !m2m_ctx->out_q_ctx.buffered) {
> > > > > +                   dprintk("No input buffers available\n");
> > > > > +                   goto job_unlock;
> > > > > +           }
> > > > >     }
> > > > > -   if (!dst && !m2m_ctx->cap_q_ctx.buffered) {
> > > > > -           dprintk("No output buffers available\n");
> > > > > -           goto job_unlock;
> > > > > +
> > > > > +   if (list_empty(&m2m_ctx->cap_q_ctx.hw_queue)) {
> > > > > +           dst =3D v4l2_m2m_next_dst_buf(m2m_ctx);
> > > > > +           if (!dst && !m2m_ctx->cap_q_ctx.buffered) {
> > > > > +                   dprintk("No output buffers available\n");
> > > > > +                   goto job_unlock;
> > > > > +           }
> > > > >     }
> > > >
> > > > src and dst would be referenced unitialized below if neither of the
> > > > above ifs hits...
> > > >
> > > > Best regards,
> > > > Tomasz
> > > >
> > > > >
> > > > >     m2m_ctx->new_frame =3D true;
> > > > > @@ -896,6 +902,7 @@ int v4l2_m2m_streamoff(struct file *file, str=
uct v4l2_m2m_ctx *m2m_ctx,
> > > > >     INIT_LIST_HEAD(&q_ctx->rdy_queue);
> > > > >     q_ctx->num_rdy =3D 0;
> > > > >     spin_unlock_irqrestore(&q_ctx->rdy_spinlock, flags);
> > > > > +   INIT_LIST_HEAD(&q_ctx->hw_queue);
> > > > >
> > > > >     if (m2m_dev->curr_ctx =3D=3D m2m_ctx) {
> > > > >             m2m_dev->curr_ctx =3D NULL;
> > > > > @@ -1234,6 +1241,8 @@ struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(stru=
ct v4l2_m2m_dev *m2m_dev,
> > > > >
> > > > >     INIT_LIST_HEAD(&out_q_ctx->rdy_queue);
> > > > >     INIT_LIST_HEAD(&cap_q_ctx->rdy_queue);
> > > > > +   INIT_LIST_HEAD(&out_q_ctx->hw_queue);
> > > > > +   INIT_LIST_HEAD(&cap_q_ctx->hw_queue);
> > > > >     spin_lock_init(&out_q_ctx->rdy_spinlock);
> > > > >     spin_lock_init(&cap_q_ctx->rdy_spinlock);
> > > > >
> > > > > diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-me=
m2mem.h
> > > > > index d6c8eb2b5201..2342656e582d 100644
> > > > > --- a/include/media/v4l2-mem2mem.h
> > > > > +++ b/include/media/v4l2-mem2mem.h
> > > > > @@ -53,9 +53,16 @@ struct v4l2_m2m_dev;
> > > > >   * processed
> > > > >   *
> > > > >   * @q:             pointer to struct &vb2_queue
> > > > > - * @rdy_queue:     List of V4L2 mem-to-mem queues
> > > > > + * @rdy_queue:     List of V4L2 mem-to-mem queues. If v4l2_m2m_b=
uf_queue() is
> > > > > + *         called in struct vb2_ops->buf_queue(), the buffer enq=
ueued
> > > > > + *         by user would be added to this list.
> > > > >   * @rdy_spinlock: spin lock to protect the struct usage
> > > > >   * @num_rdy:       number of buffers ready to be processed
> > > > > + * @hw_queue:      A list for tracking the buffer is occupied by=
 the hardware
> > > > > + *                 (or device's firmware). A buffer could only b=
e in either
> > > > > + *                 this list or @rdy_queue.
> > > > > + *                 Driver may choose not to use this list while =
uses its own
> > > > > + *                 private data to do this work.
> > > > >   * @buffered:      is the queue buffered?
> > > > >   *
> > > > >   * Queue for buffers ready to be processed as soon as this
> > > > > @@ -68,6 +75,7 @@ struct v4l2_m2m_queue_ctx {
> > > > >     struct list_head        rdy_queue;
> > > > >     spinlock_t              rdy_spinlock;
> > > > >     u8                      num_rdy;
> > > > > +   struct list_head        hw_queue;
> > > > >     bool                    buffered;
> > > > >  };
> > > > >
> > > > > --
> > > > > 2.17.1
> > > > >
> > >
>
