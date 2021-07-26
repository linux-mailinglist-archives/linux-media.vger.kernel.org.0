Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAECB3D5255
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 06:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbhGZDl7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 23:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbhGZDl6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 23:41:58 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DF6C061760
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 21:22:26 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ga41so14307197ejc.10
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 21:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f9FY8RophWih5OIqv5j8Fma8dSng51kNBzCPNivtXdI=;
        b=RJnDalBeqaUNKBcdd04AyASk/ivbR4qREnnraq1wTYbZAeKWH5Yh3hYkjxTsVHVQzI
         XWPtP5gmwWHZAnHhcQbmwfCKYiW35gb7wjfEd2IDa5UfjHorWOUjTK3kq3+VMeFpnE/j
         6ZU0jDYtZBEzBPtrHIPPenwV1ozxsz1Mm7GEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f9FY8RophWih5OIqv5j8Fma8dSng51kNBzCPNivtXdI=;
        b=T7HXbljgbytEFu4utM/DBgsfgzGl3Bmo6Myy1czkd1IsjhWe7ilcQ+CT0EODzxhrpO
         kl8DWroZIxxFeKViTYhpq2jwG1IOo+86V6E+5HQA0a8JFcBxpqsO47SwRrL9SmqZwYlo
         KDz3HAiUP3XZt9GatInKsU7Y5hqaemY1z94Ooz3Rwnk4ap0YbQsHDqdkWqdflFCcnw0v
         0luEFABBZiPcCt5KtYBAX5Pc6ztnm4b1F9vaIccUYKEu3LFHwGnuOv54rFtTfpoJL5E7
         9e8FCrHvfN9WwycsI5qPqmdzoh+04HF7ihmQWaCWvAux74fgLjkJgwhyU6pEaUZdv6/j
         +Gyg==
X-Gm-Message-State: AOAM531HnUSc5mCdhSVxns9rfqpCOUPQT51mo/fTts/nOPcADzTgUro+
        6bzNhqonIKkS4O682mYD24FQamCbpJDtVQ==
X-Google-Smtp-Source: ABdhPJzE5LKo5xZ1QPfb26mPVWMeydV8nEBmGXlvcVz4jUf1cr0deepMAt9fLoqpwDmqInlR4lDsFg==
X-Received: by 2002:a17:906:2bdb:: with SMTP id n27mr15322071ejg.312.1627273344623;
        Sun, 25 Jul 2021 21:22:24 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id q9sm13777785ejf.70.2021.07.25.21.22.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jul 2021 21:22:24 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id h14so1485001wrx.10
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 21:22:23 -0700 (PDT)
X-Received: by 2002:a05:6000:548:: with SMTP id b8mr17286012wrf.159.1627273343336;
 Sun, 25 Jul 2021 21:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
 <20210709092027.1050834-8-senozhatsky@chromium.org> <0c89ef1e-8abb-8749-bbce-c7e5a2e2f304@collabora.com>
 <YP4Sfo0PjLokYi3B@google.com> <YP40paMcGjlfofi8@google.com> <YP439RUKhVeAm945@google.com>
In-Reply-To: <YP439RUKhVeAm945@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 26 Jul 2021 13:22:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D=7Ao_gaxLamf8rv_QWxdemh=KZKdGU-1HFfY7L8A3MQ@mail.gmail.com>
Message-ID: <CAAFQd5D=7Ao_gaxLamf8rv_QWxdemh=KZKdGU-1HFfY7L8A3MQ@mail.gmail.com>
Subject: Re: [PATCHv3 7/8] videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT flag
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 26, 2021 at 1:20 PM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (21/07/26 13:05), Sergey Senozhatsky wrote:
> > On (21/07/26 10:40), Sergey Senozhatsky wrote:
> > > On (21/07/22 19:33), Dafna Hirschfeld wrote:
> > > [..]
> > > > >   int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
> > > > >   {
> > > > >         int ret = vb2_verify_memory_type(q, req->memory, req->type);
> > > > > +       u32 flags = req->flags;
> > > > >         fill_buf_caps(q, &req->capabilities);
> > > > > -       return ret ? ret : vb2_core_reqbufs(q, req->memory, 0, &req->count);
> > > > > +       validate_memory_flags(q, req->memory, &flags);
> > > > > +       req->flags = flags;
> > > >
> > > > you can do instead
> > > >
> > > > validate_memory_flags(q, req->memory, &req->flags);
> > >
> > > ->flags are u32 for create-bufs and u8 for reqi-bufs. So `*flags = <value>`
> > > can write to ->reserved[] for req-bufs (if the value is huge enough).
> >
> > I guess ->flags can become u8 for both create-bufs and req-bufs.
> > We had ->flags in both structs as u32, but then decided to leave
> > some reserved[] space in req-bufs and switched to u8 there.
>
> Something like this
>
> ---
>
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> index a048a9f6b7b6..cf633b5a4919 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> @@ -112,13 +112,13 @@ than the number requested.
>         other changes, then set ``count`` to 0, ``memory`` to
>         ``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
>
> -    * - __u32
> +    * - __u8
>        - ``flags``
>        - Specifies additional buffer management attributes.
>         See :ref:`memory-flags`.
>
> -    * - __u32
> -      - ``reserved``\ [6]
> +    * - __u8
> +      - ``reserved``\ [27]
>        - A place holder for future extensions. Drivers and applications
>         must set the array to zero.
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 6edf4508c636..2ae949ec0afa 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -694,7 +694,7 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>
>  static void validate_memory_flags(struct vb2_queue *q,
>                                   int memory,
> -                                 u32 *flags)
> +                                 u8 *flags)
>  {
>         if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP) {
>                 /*
> @@ -711,11 +711,9 @@ static void validate_memory_flags(struct vb2_queue *q,
>  int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  {
>         int ret = vb2_verify_memory_type(q, req->memory, req->type);
> -       u32 flags = req->flags;
>
>         fill_buf_caps(q, &req->capabilities);
> -       validate_memory_flags(q, req->memory, &flags);
> -       req->flags = flags;
> +       validate_memory_flags(q, req->memory, &req->flags);
>         return ret ? ret : vb2_core_reqbufs(q, req->memory,
>                                             req->flags, &req->count);
>  }
> @@ -990,11 +988,9 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>  {
>         struct video_device *vdev = video_devdata(file);
>         int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
> -       u32 flags = p->flags;
>
>         fill_buf_caps(vdev->queue, &p->capabilities);
> -       validate_memory_flags(vdev->queue, p->memory, &flags);
> -       p->flags = flags;
> +       validate_memory_flags(vdev->queue, p->memory, &p->flags);
>         if (res)
>                 return res;
>         if (vb2_queue_is_busy(vdev, file))
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 7973aa0465d2..ad4f7cee53f2 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2513,8 +2513,8 @@ struct v4l2_create_buffers {
>         __u32                   memory;
>         struct v4l2_format      format;
>         __u32                   capabilities;
> -       __u32                   flags;
> -       __u32                   reserved[6];
> +       __u8                    flags;
> +       __u8                    reserved[27];
>  };
>
>  /*

I don't think we want this UABI churn anymore for a trivial
simplification in the implementation.

Best regards,
Tomasz
