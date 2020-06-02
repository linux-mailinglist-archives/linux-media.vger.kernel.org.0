Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9181EBB93
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 14:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgFBMWq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 08:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbgFBMWp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 08:22:45 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6173EC08C5C0
        for <linux-media@vger.kernel.org>; Tue,  2 Jun 2020 05:22:45 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g9so9886671edw.10
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2020 05:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A08j6fU+RlNfIhwI5UM24mjQznnwSgfTXAFxVissV48=;
        b=JqAagGFBVhcjxJPeBl5cy+G9GwDLNghzA6eP0eUwsaQW5oBc2sm29vAYyo/systJBA
         lPocLTxup1vVlzpiDJdk2rLd5+9I4cXxz2Q1OnpETIGsAp69v8XqSvIi7Dxaa6qVLyra
         1vWzF8dNJE2Qjv6i0Oa3d9mU2+GuB42bt1suc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A08j6fU+RlNfIhwI5UM24mjQznnwSgfTXAFxVissV48=;
        b=R4UElxb7altAxzvO3zD+KSTqdO2p+LCkA5NZlIMAXYnXm50+mv8jEJ1orbTQ+VvhAp
         Lynz0xPhwZO6FeL3IKxMwhGvaVzIdeNISMXfUAkceRmsxzmPXhLs0l34eV4+sG6EH44j
         fex+HgBodR/BZnG8/gIyGU+kZIALzH2N5xEDs7F5yvH90IYmxr/TK2ikyl0GGO0HCstD
         Sh8l8xXgFr5a91IrzjHHL3Jmp+32xDaCvr8EOWr1uY+uAywe4ag0MuHkFe9DB1/I2QBb
         +neuhkYHNTRhIRhQRbuuAnhmQ8EytTlAAKuUmCE1Px/WJ1CyFUM43GW6g5JAcCXP0xZs
         WCfQ==
X-Gm-Message-State: AOAM533AYluGYUPfOGFXBf4j757Pu7fSuniC+Eq9lkzS544KfNnwtbVL
        7xNOnQlhpUMqVg+JDCqbkv4sS0QjCa0Y1A==
X-Google-Smtp-Source: ABdhPJxLExFgsRObBpo1WdnnL7Bso27T9vJ6sWS2netgKlt7c6z5ELb4RsK59Su/Tf+Yf9BCRD6+tw==
X-Received: by 2002:a05:6402:17e6:: with SMTP id t6mr25043445edy.243.1591100563075;
        Tue, 02 Jun 2020 05:22:43 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id v6sm1548273ejv.120.2020.06.02.05.22.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 05:22:41 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id l10so3174209wrr.10
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2020 05:22:41 -0700 (PDT)
X-Received: by 2002:a5d:6750:: with SMTP id l16mr26260746wrw.295.1591100561085;
 Tue, 02 Jun 2020 05:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
 <20200514160153.3646-4-sergey.senozhatsky@gmail.com> <b34ae09b-7c20-7255-6adc-3370680555cd@xs4all.nl>
In-Reply-To: <b34ae09b-7c20-7255-6adc-3370680555cd@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 2 Jun 2020 14:22:28 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Cu5ex=YcuVfmEC1uNA4DZBSAF04LYtrw3-q22ZMc7_DA@mail.gmail.com>
Message-ID: <CAAFQd5Cu5ex=YcuVfmEC1uNA4DZBSAF04LYtrw3-q22ZMc7_DA@mail.gmail.com>
Subject: Re: [PATCH v6 03/14] videobuf2: handle V4L2 buffer cache flags
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Jun 2, 2020 at 11:51 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Sergey,
>
> While doing final testing for this patch series (together with the v4l-utils patch)
> I found one remaining issue:
>
> On 14/05/2020 18:01, Sergey Senozhatsky wrote:
> > From: Sergey Senozhatsky <senozhatsky@chromium.org>
> >
> > Set video buffer cache management flags corresponding to V4L2 cache
> > flags.
> >
> > Both ->prepare() and ->finish() cache management hints should be
> > passed during this stage (buffer preparation), because there is
> > no other way for user-space to tell V4L2 to avoid ->finish() cache
> > flush.
> >
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > ---
> >  .../media/common/videobuf2/videobuf2-v4l2.c   | 48 +++++++++++++++++++
> >  include/media/videobuf2-core.h                | 11 +++++
> >  2 files changed, 59 insertions(+)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > index eb5d5db96552..f13851212cc8 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > @@ -337,6 +337,53 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
> >       return 0;
> >  }
> >
> > +static void set_buffer_cache_hints(struct vb2_queue *q,
> > +                                struct vb2_buffer *vb,
> > +                                struct v4l2_buffer *b)
> > +{
> > +     /*
> > +      * DMA exporter should take care of cache syncs, so we can avoid
> > +      * explicit ->prepare()/->finish() syncs. For other ->memory types
> > +      * we always need ->prepare() or/and ->finish() cache sync.
> > +      */
> > +     if (q->memory == VB2_MEMORY_DMABUF) {
> > +             vb->need_cache_sync_on_finish = 0;
> > +             vb->need_cache_sync_on_prepare = 0;
> > +             return;
> > +     }
> > +
> > +     /*
> > +      * Cache sync/invalidation flags are set by default in order to
> > +      * preserve existing behaviour for old apps/drivers.
> > +      */
> > +     vb->need_cache_sync_on_prepare = 1;
> > +     vb->need_cache_sync_on_finish = 1;
> > +
> > +     if (!vb2_queue_allows_cache_hints(q)) {
> > +             /*
> > +              * Clear buffer cache flags if queue does not support user
> > +              * space hints. That's to indicate to userspace that these
> > +              * flags won't work.
> > +              */
> > +             b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
> > +             b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
> > +             return;
> > +     }
>
> These two flags need to be cleared for VB2_MEMORY_DMABUF as well in the test above.
> This bug is causing v4l2-compliance failures (use the test-media script in contrib/test
> in v4l-utils: 'sudo test-media vim2m').

Would you be able to paste the failures, so that we know that we
reproduce the same problems? Thanks!

Best regards,
Tomasz

>
> It's enough to post a v6.1 for this patch, everything else is fine.
>
> Regards,
>
>         Hans
>
> > +
> > +     /*
> > +      * ->finish() cache sync can be avoided when queue direction is
> > +      * TO_DEVICE.
> > +      */
> > +     if (q->dma_dir == DMA_TO_DEVICE)
> > +             vb->need_cache_sync_on_finish = 0;
> > +
> > +     if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
> > +             vb->need_cache_sync_on_finish = 0;
> > +
> > +     if (b->flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN)
> > +             vb->need_cache_sync_on_prepare = 0;
> > +}
> > +
> >  static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
> >                                   struct v4l2_buffer *b, bool is_prepare,
> >                                   struct media_request **p_req)
> > @@ -381,6 +428,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
> >       }
> >
> >       if (!vb->prepared) {
> > +             set_buffer_cache_hints(q, vb, b);
> >               /* Copy relevant information provided by the userspace */
> >               memset(vbuf->planes, 0,
> >                      sizeof(vbuf->planes[0]) * vb->num_planes);
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> > index 7f39d9fffc8c..ccc5c498d3e3 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -635,6 +635,17 @@ struct vb2_queue {
> >  #endif
> >  };
> >
> > +/**
> > + * vb2_queue_allows_cache_hints() - Return true if the queue allows cache
> > + * and memory consistency hints.
> > + *
> > + * @q:               pointer to &struct vb2_queue with videobuf2 queue
> > + */
> > +static inline bool vb2_queue_allows_cache_hints(struct vb2_queue *q)
> > +{
> > +     return q->allow_cache_hints && q->memory == VB2_MEMORY_MMAP;
> > +}
> > +
> >  /**
> >   * vb2_plane_vaddr() - Return a kernel virtual address of a given plane.
> >   * @vb:              pointer to &struct vb2_buffer to which the plane in
> >
>
