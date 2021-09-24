Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605D4417C9A
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 22:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346164AbhIXUzf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 16:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345966AbhIXUze (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 16:55:34 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2B1C061571;
        Fri, 24 Sep 2021 13:54:00 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id w29so30989152wra.8;
        Fri, 24 Sep 2021 13:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uBK3kIF03EoojuPkVPYFnbtHDg911meAFaC4x+8vLoU=;
        b=eG+xwf1r45RolAI7X1FYzC+K9OkqVYQHyQYpfYYqqJueIM/GtMuLrUnWkiF//ZdsP0
         euDauiBLOpRw5ASNk3lX3V2Ewt6WiMsD5BCGoX9Cv0kVdcaStIi6w2J8qEEYY7XlxaGu
         iY9hum/H4z/IGDdTGWKmaBoDsLVO2JCNvKmS+BKU8vhAA8waUWIazRKkvKIZ01g3G6l2
         UBiEo5e8neza03fvcDDIx8DQ803a2gqDQkcfr7+0vXpRkYGfO8w08F5kLw5ag4ESY5gV
         bTdHYZcbly+SdzJ4l8ejQWiAavKeo/i2mp5POgjmU4GHipFocMJY4JqltmcvniaL6Yyr
         8OfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uBK3kIF03EoojuPkVPYFnbtHDg911meAFaC4x+8vLoU=;
        b=1g0jIIUU//JnPNG0XaTPQSkGCX6tQ4bSL0qwLTZ7cpxDtooL3xgdY5ofDTng3sm74O
         nTheESNohQdlz7BwZcjxncozuw0RWoP0Bm7iHXhwehGig1+o3SQO6Rtep4yF4gzXvqvJ
         24SLXKYjd75vufb0KwLOFbYcTHbUD+6UTaY8Tdp9QxAyZD3bK/E/DNZKJreXUWFnEufC
         OgQLzzqlMpPOZm9AN/8p8QLDgzi6ndj7HFK/PkjbaeUqx20GRrhj0tG3Hxx0BLJQW4ch
         paZ5n53effxp9SiWTxwa99aBtTWmuYcC+KsQNMYliiV0uHcoTKLlA38afQoksHs5kwlD
         ueYg==
X-Gm-Message-State: AOAM533+XXbxCPdkVHvFbC21XnQFa6THBRUBoFo4PVpRcAHyoW56BBF1
        F84INysYyg7elZbAOwKF+bFawjcJaOYmngCFfIU=
X-Google-Smtp-Source: ABdhPJyI8zaM6SVV9fKH0gNRI3MH/q09miYXikX9BmaxTIVHKik9puC7KXd2F8UYrIhi7QrD7wnVKE8z9RBeIw3dr2M=
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr4149363wme.127.1632516839424;
 Fri, 24 Sep 2021 13:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210924071759.22659-1-christian.koenig@amd.com>
In-Reply-To: <20210924071759.22659-1-christian.koenig@amd.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 24 Sep 2021 13:58:31 -0700
Message-ID: <CAF6AEGtD5Xb=4LYK3Nxd+ucMDkABdLFvW6rUqqP8q2-iVedqew@mail.gmail.com>
Subject: Re: [PATCH 1/4] dma-buf: add dma_fence_describe and dma_resv_describe
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 24, 2021 at 12:18 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Add functions to dump dma_fence and dma_resv objects into a seq_file and
> use them for printing the debugfs informations.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

for the series,

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/dma-buf/dma-buf.c   | 11 +----------
>  drivers/dma-buf/dma-fence.c | 16 ++++++++++++++++
>  drivers/dma-buf/dma-resv.c  | 23 +++++++++++++++++++++++
>  include/linux/dma-fence.h   |  1 +
>  include/linux/dma-resv.h    |  1 +
>  5 files changed, 42 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d35c71743ccb..4975c9289b02 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1368,8 +1368,6 @@ static int dma_buf_debug_show(struct seq_file *s, v=
oid *unused)
>  {
>         struct dma_buf *buf_obj;
>         struct dma_buf_attachment *attach_obj;
> -       struct dma_resv_iter cursor;
> -       struct dma_fence *fence;
>         int count =3D 0, attach_count;
>         size_t size =3D 0;
>         int ret;
> @@ -1397,14 +1395,7 @@ static int dma_buf_debug_show(struct seq_file *s, =
void *unused)
>                                 file_inode(buf_obj->file)->i_ino,
>                                 buf_obj->name ?: "");
>
> -               dma_resv_for_each_fence(&cursor, buf_obj->resv, true, fen=
ce) {
> -                       seq_printf(s, "\t%s fence: %s %s %ssignalled\n",
> -                                  dma_resv_iter_is_exclusive(&cursor) ?
> -                                       "Exclusive" : "Shared",
> -                                  fence->ops->get_driver_name(fence),
> -                                  fence->ops->get_timeline_name(fence),
> -                                  dma_fence_is_signaled(fence) ? "" : "u=
n");
> -               }
> +               dma_resv_describe(buf_obj->resv, s);
>
>                 seq_puts(s, "\tAttached Devices:\n");
>                 attach_count =3D 0;
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 1e82ecd443fa..5175adf58644 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -907,6 +907,22 @@ dma_fence_wait_any_timeout(struct dma_fence **fences=
, uint32_t count,
>  }
>  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>
> +/**
> + * dma_fence_describe - Dump fence describtion into seq_file
> + * @fence: the 6fence to describe
> + * @seq: the seq_file to put the textual description into
> + *
> + * Dump a textual description of the fence and it's state into the seq_f=
ile.
> + */
> +void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
> +{
> +       seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> +                  fence->ops->get_driver_name(fence),
> +                  fence->ops->get_timeline_name(fence), fence->seqno,
> +                  dma_fence_is_signaled(fence) ? "" : "un");
> +}
> +EXPORT_SYMBOL(dma_fence_describe);
> +
>  /**
>   * dma_fence_init - Initialize a custom fence.
>   * @fence: the fence to initialize
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 266ec9e3caef..6bb25d53e702 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -38,6 +38,7 @@
>  #include <linux/mm.h>
>  #include <linux/sched/mm.h>
>  #include <linux/mmu_notifier.h>
> +#include <linux/seq_file.h>
>
>  /**
>   * DOC: Reservation Object Overview
> @@ -654,6 +655,28 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bo=
ol test_all)
>  }
>  EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
>
> +/**
> + * dma_resv_describe - Dump description of the resv object into seq_file
> + * @obj: the reservation object
> + * @seq: the seq_file to dump the description into
> + *
> + * Dump a textual description of the fences inside an dma_resv object in=
to the
> + * seq_file.
> + */
> +void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq)
> +{
> +       struct dma_resv_iter cursor;
> +       struct dma_fence *fence;
> +
> +       dma_resv_for_each_fence(&cursor, obj, true, fence) {
> +               seq_printf(seq, "\t%s fence:",
> +                          dma_resv_iter_is_exclusive(&cursor) ?
> +                               "Exclusive" : "Shared");
> +               dma_fence_describe(fence, seq);
> +       }
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_describe);
> +
>  #if IS_ENABLED(CONFIG_LOCKDEP)
>  static int __init dma_resv_lockdep(void)
>  {
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index a706b7bf51d7..1ea691753bd3 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -264,6 +264,7 @@ void dma_fence_init(struct dma_fence *fence, const st=
ruct dma_fence_ops *ops,
>
>  void dma_fence_release(struct kref *kref);
>  void dma_fence_free(struct dma_fence *fence);
> +void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
>
>  /**
>   * dma_fence_put - decreases refcount of the fence
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index d4b4cd43f0f1..49c0152073fd 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -486,5 +486,6 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct=
 dma_resv *src);
>  long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool int=
r,
>                            unsigned long timeout);
>  bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);
> +void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
>
>  #endif /* _LINUX_RESERVATION_H */
> --
> 2.25.1
>
