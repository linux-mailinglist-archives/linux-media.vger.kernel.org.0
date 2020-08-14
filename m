Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873E72445F5
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgHNHtx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbgHNHtw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:49:52 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C42D7C061383
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 00:49:52 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id h22so6899220otq.11
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qoodTYnvmHMnPQmUEgPzXZrxz5AE+DKLV8cXnXK0zts=;
        b=T0XgxqVIKlOGhxmt72E2jBCKPxii/nBEY+Ty5sC40Hnf/it52i6n5H8k+MryheSn/w
         7mvRBZV4nm7JHEQlunqXFDvFo2ufVJMOi9S17Zi70WvRSllBc72iTgpcHeThqLwQggZr
         Cyi6OCIi5690WsMA+pargD5xWC43P/b//vfcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qoodTYnvmHMnPQmUEgPzXZrxz5AE+DKLV8cXnXK0zts=;
        b=HdWVk75wQJdeL6vl15LfnEeOhiCHuy3EhX0vvRQ3h3u+5fEarczMghiTIDD1qky/Ri
         2P0kuWO8KpFvI/B1zDKnVXmA69FXg98u+biMkBc2DcWRs0IhSKOmdmqXhuinv5pYfwNc
         pgJdqBVjQ6Og918568D5QlCRqt2CXue5Wp6+oHWSEeVX8s1kioUI7g3esUm3+1bg4RqU
         8R2as3Qt122XGLz+XVmhvlWYYscJrozGjFGNHXFBHGkmtegIo44u2ZjWl7dfyIGTrUGq
         G87OuemnSm3b/hTMqxKc6xbRVBLdnrqm/yBfbRZcyXn4EwP5CDyVmSLKB607WnSdd/UW
         PUmQ==
X-Gm-Message-State: AOAM533tKkN64izrQIxhfagmnXFZNxYNEOb+eIsNUmp25zUKLdn2e0k1
        qAXaTVr40HpXH836QoPpWa76+mZQ/Gh1Pw==
X-Google-Smtp-Source: ABdhPJxP939hp66Cy+Psx9YqsSad1HI1M7W+8S46xvGLmeTPOu2n7udGgPbQL3TD+YYd0jku7CnK1w==
X-Received: by 2002:a9d:48d:: with SMTP id 13mr1154912otm.9.1597391391054;
        Fri, 14 Aug 2020 00:49:51 -0700 (PDT)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com. [209.85.167.170])
        by smtp.gmail.com with ESMTPSA id s135sm1673280oih.35.2020.08.14.00.49.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2020 00:49:50 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id e6so7460905oii.4
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 00:49:49 -0700 (PDT)
X-Received: by 2002:aca:c6d6:: with SMTP id w205mr779756oif.94.1597391389189;
 Fri, 14 Aug 2020 00:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200804192939.2251988-1-helen.koike@collabora.com> <20200804192939.2251988-3-helen.koike@collabora.com>
In-Reply-To: <20200804192939.2251988-3-helen.koike@collabora.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 14 Aug 2020 16:49:37 +0900
X-Gmail-Original-Message-ID: <CAPBb6MX5wyADcp0ZKeXCAEB=2DY=c4BupGYjvc9tZwKdtQ8wEQ@mail.gmail.com>
Message-ID: <CAPBb6MX5wyADcp0ZKeXCAEB=2DY=c4BupGYjvc9tZwKdtQ8wEQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] media: v4l2: Add extended buffer operations
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com,
        narmstrong@baylibre.com, LKML <linux-kernel@vger.kernel.org>,
        frkoenig@chromium.org, Maxime Jourdan <mjourdan@baylibre.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 5, 2020 at 4:32 AM Helen Koike <helen.koike@collabora.com> wrote:
>
> From: Hans Verkuil <hans.verkuil@cisco.com>
>
> Those extended buffer ops have several purpose:
> 1/ Fix y2038 issues by converting the timestamp into an u64 counting
>    the number of ns elapsed since 1970
> 2/ Unify single/multiplanar handling
> 3/ Add a new start offset field to each v4l2 plane buffer info struct
>    to support the case where a single buffer object is storing all
>    planes data, each one being placed at a different offset
>
> New hooks are created in v4l2_ioctl_ops so that drivers can start using
> these new objects.
>
> The core takes care of converting new ioctls requests to old ones
> if the driver does not support the new hooks, and vice versa.
>
> Note that the timecode field is gone, since there doesn't seem to be
> in-kernel users. We can be added back in the reserved area if needed or

"We can add it back" or "It can be added back"?


> use the Request API to collect more metadata information from the
> frame.
>
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> Changes in v5:
> - migrate memory from v4l2_ext_buffer to v4l2_ext_plane
> - return mem_offset to struct v4l2_ext_plane
> - change sizes and reorder fields to avoid holes in the struct and make
>   it the same for 32 and 64 bits
>
> Changes in v4:
> - Use v4l2_ext_pix_format directly in the ioctl, drop v4l2_ext_format,
> making V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] the only valid types.
> - Drop VIDIOC_EXT_EXPBUF, since the only difference from VIDIOC_EXPBUF
> was that with VIDIOC_EXT_EXPBUF we could export multiple planes at once.
> I think we can add this later, so I removed it from this RFC to simplify it.
> - Remove num_planes field from struct v4l2_ext_buffer
> - Add flags field to struct v4l2_ext_create_buffers
> - Reformulate struct v4l2_ext_plane
> - Fix some bugs caught by v4l2-compliance
> - Rebased on top of media/master (post 5.8-rc1)
>
> Changes in v3:
> - Rebased on top of media/master (post 5.4-rc1)
>
> Changes in v2:
> - Add reserved space to v4l2_ext_buffer so that new fields can be added
>   later on
> ---
>  drivers/media/v4l2-core/v4l2-dev.c   |  29 ++-
>  drivers/media/v4l2-core/v4l2-ioctl.c | 353 +++++++++++++++++++++++++--
>  include/media/v4l2-ioctl.h           |  26 ++
>  include/uapi/linux/videodev2.h       |  90 +++++++
>  4 files changed, 476 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index e1829906bc086..cb21ee8eb075c 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -720,15 +720,34 @@ static void determine_valid_ioctls(struct video_device *vdev)
>                 SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_sdr_out);
>         }
>
> +       if (is_vid || is_tch) {
> +               /* ioctls valid for video and touch */
> +               if (ops->vidioc_querybuf || ops->vidioc_ext_querybuf)
> +                       set_bit(_IOC_NR(VIDIOC_EXT_QUERYBUF), valid_ioctls);
> +               if (ops->vidioc_qbuf || ops->vidioc_ext_qbuf)
> +                       set_bit(_IOC_NR(VIDIOC_EXT_QBUF), valid_ioctls);
> +               if (ops->vidioc_dqbuf || ops->vidioc_ext_dqbuf)
> +                       set_bit(_IOC_NR(VIDIOC_EXT_DQBUF), valid_ioctls);
> +               if (ops->vidioc_create_bufs || ops->vidioc_ext_create_bufs)
> +                       set_bit(_IOC_NR(VIDIOC_EXT_CREATE_BUFS), valid_ioctls);
> +               if (ops->vidioc_prepare_buf || ops->vidioc_ext_prepare_buf)
> +                       set_bit(_IOC_NR(VIDIOC_EXT_PREPARE_BUF), valid_ioctls);
> +       }
> +
>         if (is_vid || is_vbi || is_sdr || is_tch || is_meta) {
>                 /* ioctls valid for video, vbi, sdr, touch and metadata */
>                 SET_VALID_IOCTL(ops, VIDIOC_REQBUFS, vidioc_reqbufs);
> -               SET_VALID_IOCTL(ops, VIDIOC_QUERYBUF, vidioc_querybuf);
> -               SET_VALID_IOCTL(ops, VIDIOC_QBUF, vidioc_qbuf);
>                 SET_VALID_IOCTL(ops, VIDIOC_EXPBUF, vidioc_expbuf);
> -               SET_VALID_IOCTL(ops, VIDIOC_DQBUF, vidioc_dqbuf);
> -               SET_VALID_IOCTL(ops, VIDIOC_CREATE_BUFS, vidioc_create_bufs);
> -               SET_VALID_IOCTL(ops, VIDIOC_PREPARE_BUF, vidioc_prepare_buf);
> +               if (ops->vidioc_querybuf || ops->vidioc_ext_querybuf)
> +                       set_bit(_IOC_NR(VIDIOC_QUERYBUF), valid_ioctls);
> +               if (ops->vidioc_qbuf || ops->vidioc_ext_qbuf)
> +                       set_bit(_IOC_NR(VIDIOC_QBUF), valid_ioctls);
> +               if (ops->vidioc_dqbuf || ops->vidioc_ext_dqbuf)
> +                       set_bit(_IOC_NR(VIDIOC_DQBUF), valid_ioctls);
> +               if (ops->vidioc_create_bufs || ops->vidioc_ext_create_bufs)
> +                       set_bit(_IOC_NR(VIDIOC_CREATE_BUFS), valid_ioctls);
> +               if (ops->vidioc_prepare_buf || ops->vidioc_ext_prepare_buf)
> +                       set_bit(_IOC_NR(VIDIOC_PREPARE_BUF), valid_ioctls);
>                 SET_VALID_IOCTL(ops, VIDIOC_STREAMON, vidioc_streamon);
>                 SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
>         }
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 14a0def50f8ea..7ecdd9cc1bf48 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -527,6 +527,26 @@ static void v4l_print_buffer(const void *arg, bool write_only)
>                         tc->type, tc->flags, tc->frames, *(__u32 *)tc->userbits);
>  }
>
> +static void v4l_print_ext_buffer(const void *arg, bool write_only)
> +{
> +       const struct v4l2_ext_buffer *e = arg;
> +       const struct v4l2_ext_plane *plane;
> +       unsigned int i;
> +
> +       pr_cont("%lld index=%d, type=%s, flags=0x%08x, field=%s, sequence=%d\n",
> +               e->timestamp, e->index, prt_names(e->type, v4l2_type_names),
> +               e->flags, prt_names(e->field, v4l2_field_names), e->sequence);
> +
> +       for (i = 0; i < VIDEO_MAX_PLANES &&
> +                   e->planes[i].buffer_length; i++) {
> +               plane = &e->planes[i];
> +               pr_debug("plane %d: buffer_length=%d, plane_length=%d offset=0x%08x, memory=%s\n",
> +                        i, plane->buffer_length, plane->plane_length,
> +                        plane->offset,
> +                        prt_names(plane->memory, v4l2_memory_names));
> +       }
> +}
> +
>  static void v4l_print_exportbuffer(const void *arg, bool write_only)
>  {
>         const struct v4l2_exportbuffer *p = arg;
> @@ -546,6 +566,15 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
>         v4l_print_format(&p->format, write_only);
>  }
>
> +static void v4l_print_ext_create_buffers(const void *arg, bool write_only)
> +{
> +       const struct v4l2_ext_create_buffers *p = arg;
> +
> +       pr_cont("index=%d, count=%d, memory=%s, ", p->index, p->count,
> +               prt_names(p->memory, v4l2_memory_names));
> +       v4l_print_ext_pix_format(&p->format, write_only);
> +}
> +
>  static void v4l_print_streamparm(const void *arg, bool write_only)
>  {
>         const struct v4l2_streamparm *p = arg;
> @@ -1220,6 +1249,143 @@ int v4l2_format_to_ext_pix_format(const struct v4l2_format *f,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_format_to_ext_pix_format);
>
> +/*
> + * If mplane_cap is true, b->m.planes should have a valid pointer of a
> + * struct v4l2_plane array, and b->length with its size
> + */
> +int v4l2_ext_buffer_to_buffer(const struct v4l2_ext_buffer *e,
> +                             struct v4l2_buffer *b, bool mplane_cap)
> +{
> +       unsigned int planes_array_size = b->length;
> +       struct v4l2_plane *planes = b->m.planes;
> +       u64 nsecs;
> +
> +       if (!mplane_cap && e->planes[1].buffer_length != 0)
> +               return -EINVAL;
> +
> +       memset(b, 0, sizeof(*b));
> +
> +       b->index = e->index;
> +       b->flags = e->flags;
> +       b->field = e->field;
> +       b->sequence = e->sequence;
> +       b->memory = e->planes[0].memory;
> +       b->request_fd = e->request_fd;
> +       b->timestamp.tv_sec = div64_u64_rem(e->timestamp, NSEC_PER_SEC, &nsecs);
> +       b->timestamp.tv_usec = (u32)nsecs / NSEC_PER_USEC;
> +
> +       if (mplane_cap) {
> +               unsigned int i;
> +
> +               if (!planes || !planes_array_size)
> +                       return -EINVAL;
> +
> +               b->m.planes = planes;
> +
> +               if (e->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +                       b->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +               else
> +                       b->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +
> +               for (i = 0; i < VIDEO_MAX_PLANES && i < planes_array_size &&
> +                           e->planes[i].buffer_length; i++) {
> +
> +                       if (e->planes[0].memory != e->planes[i].memory)
> +                               return -EINVAL;
> +
> +                       if (e->planes[i].offset)
> +                               return -EINVAL;
> +
> +                       memset(&b->m.planes[i], 0, sizeof(b->m.planes[i]));
> +
> +                       if (b->memory == V4L2_MEMORY_MMAP)
> +                               b->m.planes[i].m.mem_offset = e->planes[i].m.mem_offset;
> +                       else if (b->memory == V4L2_MEMORY_DMABUF)
> +                               b->m.planes[i].m.fd = e->planes[i].m.dmabuf_fd;
> +                       else
> +                               b->m.planes[i].m.userptr = e->planes[i].m.userptr;
> +
> +                       b->m.planes[i].bytesused = e->planes[i].plane_length;
> +                       b->m.planes[i].length = e->planes[i].buffer_length;
> +               }
> +               /* In multi-planar, length contain the number of planes */
> +               b->length = i;
> +       } else {
> +               b->type = e->type;
> +               b->bytesused = e->planes[0].plane_length;
> +               b->length = e->planes[0].buffer_length;
> +
> +               if (e->planes[0].offset)
> +                       return -EINVAL;
> +
> +               if (b->memory == V4L2_MEMORY_MMAP)
> +                       b->m.offset = e->planes[0].m.mem_offset;
> +               else if (b->memory == V4L2_MEMORY_DMABUF)
> +                       b->m.fd = e->planes[0].m.dmabuf_fd;
> +               else
> +                       b->m.userptr = e->planes[0].m.userptr;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_ext_buffer_to_buffer);
> +
> +int v4l2_buffer_to_ext_buffer(const struct v4l2_buffer *b,
> +                             struct v4l2_ext_buffer *e)
> +{
> +       memset(e, 0, sizeof(*e));
> +
> +       e->index = b->index;
> +       e->flags = b->flags;
> +       e->field = b->field;
> +       e->sequence = b->sequence;
> +       e->request_fd = b->request_fd;
> +       e->timestamp = b->timestamp.tv_sec * NSEC_PER_SEC +
> +               b->timestamp.tv_usec * NSEC_PER_USEC;
> +       if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
> +               unsigned int i;
> +
> +               if (!b->m.planes)
> +                       return -EINVAL;
> +
> +               if (b->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +                       e->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +               else
> +                       e->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +
> +               /* In multi-planar, length contain the number of planes */
> +               for (i = 0; i < b->length; i++) {
> +                       if (b->memory == V4L2_MEMORY_MMAP)
> +                               e->planes[i].m.mem_offset = b->m.planes[i].m.mem_offset;
> +                       else if (b->memory == V4L2_MEMORY_DMABUF)
> +                               e->planes[i].m.dmabuf_fd = b->m.planes[i].m.fd;
> +                       else
> +                               e->planes[i].m.userptr = b->m.planes[i].m.userptr;
> +
> +                       e->planes[i].memory = b->memory;
> +                       e->planes[i].buffer_length = b->m.planes[i].length;
> +                       e->planes[i].plane_length = b->m.planes[i].bytesused;
> +                       if (b->m.planes[i].data_offset)
> +                               pr_warn("Ignoring data_offset value %d\n",
> +                                       b->m.planes[i].data_offset);
> +               }
> +       } else {
> +               e->type = b->type;
> +               e->planes[0].memory = b->memory;
> +               e->planes[0].plane_length = b->bytesused;
> +               e->planes[0].buffer_length = b->length;
> +               if (b->memory == V4L2_MEMORY_MMAP)
> +                       e->planes[0].m.mem_offset = b->m.offset;
> +               else if (b->memory == V4L2_MEMORY_DMABUF)
> +                       e->planes[0].m.dmabuf_fd = b->m.fd;
> +               else
> +                       e->planes[0].m.userptr = b->m.userptr;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_buffer_to_ext_buffer);
> +
>  static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
>                                 struct file *file, void *fh, void *arg)
>  {
> @@ -2473,31 +2639,112 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>         return ops->vidioc_reqbufs(file, fh, p);
>  }
>
> +static int v4l_do_buf_op(int (*op)(struct file *, void *,
> +                                  struct v4l2_buffer *),
> +                        int (*ext_op)(struct file *, void *,
> +                                      struct v4l2_ext_buffer *),
> +                        struct file *file, void *fh, struct v4l2_buffer *b)
> +{
> +       struct v4l2_ext_buffer e;
> +       int ret;
> +
> +       ret = check_fmt(file, b->type);
> +       if (ret)
> +               return ret;
> +
> +       if (op)
> +               return op(file, fh, b);
> +
> +       ret = v4l2_buffer_to_ext_buffer(b, &e);
> +       if (ret)
> +               return ret;
> +
> +       ret = ext_op(file, fh, &e);
> +       if (ret)
> +               return ret;
> +
> +       v4l2_ext_buffer_to_buffer(&e, b, V4L2_TYPE_IS_MULTIPLANAR(b->type));
> +       return 0;
> +}
> +
> +static int v4l_do_ext_buf_op(int (*op)(struct file *, void *,
> +                                      struct v4l2_buffer *),
> +                            int (*ext_op)(struct file *, void *,
> +                                          struct v4l2_ext_buffer *),
> +                            struct file *file, void *fh,
> +                            struct v4l2_ext_buffer *e)
> +{
> +       struct video_device *vdev = video_devdata(file);
> +       struct v4l2_plane planes[VIDEO_MAX_PLANES];
> +       struct v4l2_buffer b;
> +       bool mplane_cap;
> +       int ret;
> +
> +       ret = check_fmt(file, e->type);
> +       if (ret)
> +               return ret;
> +
> +       if (ext_op)
> +               return ext_op(file, fh, e);
> +
> +       mplane_cap = !!(vdev->device_caps &
> +                       (V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +                        V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> +                        V4L2_CAP_VIDEO_M2M_MPLANE));
> +       b.m.planes = planes;
> +       b.length = VIDEO_MAX_PLANES;
> +       ret = v4l2_ext_buffer_to_buffer(e, &b, mplane_cap);
> +       if (ret)
> +               return ret;
> +
> +       ret = op(file, fh, &b);
> +       if (ret)
> +               return ret;
> +
> +       v4l2_buffer_to_ext_buffer(&b, e);
> +       return 0;
> +}
> +
>  static int v4l_querybuf(const struct v4l2_ioctl_ops *ops,
> -                               struct file *file, void *fh, void *arg)
> +                       struct file *file, void *fh, void *arg)
>  {
> -       struct v4l2_buffer *p = arg;
> -       int ret = check_fmt(file, p->type);
> +       return v4l_do_buf_op(ops->vidioc_querybuf, ops->vidioc_ext_querybuf,
> +                            file, fh, arg);
> +}
>
> -       return ret ? ret : ops->vidioc_querybuf(file, fh, p);
> +static int v4l_ext_querybuf(const struct v4l2_ioctl_ops *ops,
> +                           struct file *file, void *fh, void *arg)
> +{
> +       return v4l_do_ext_buf_op(ops->vidioc_querybuf,
> +                                ops->vidioc_ext_querybuf, file, fh, arg);
>  }
>
>  static int v4l_qbuf(const struct v4l2_ioctl_ops *ops,
> -                               struct file *file, void *fh, void *arg)
> +                   struct file *file, void *fh, void *arg)
>  {
> -       struct v4l2_buffer *p = arg;
> -       int ret = check_fmt(file, p->type);
> +       return v4l_do_buf_op(ops->vidioc_qbuf, ops->vidioc_ext_qbuf,
> +                            file, fh, arg);
> +}
>
> -       return ret ? ret : ops->vidioc_qbuf(file, fh, p);
> +static int v4l_ext_qbuf(const struct v4l2_ioctl_ops *ops,
> +                       struct file *file, void *fh, void *arg)
> +{
> +       return v4l_do_ext_buf_op(ops->vidioc_qbuf, ops->vidioc_ext_qbuf,
> +                                file, fh, arg);
>  }
>
>  static int v4l_dqbuf(const struct v4l2_ioctl_ops *ops,
> -                               struct file *file, void *fh, void *arg)
> +                    struct file *file, void *fh, void *arg)
>  {
> -       struct v4l2_buffer *p = arg;
> -       int ret = check_fmt(file, p->type);
> +       return v4l_do_buf_op(ops->vidioc_dqbuf, ops->vidioc_ext_dqbuf,
> +                            file, fh, arg);
> +}
>
> -       return ret ? ret : ops->vidioc_dqbuf(file, fh, p);
> +static int v4l_ext_dqbuf(const struct v4l2_ioctl_ops *ops,
> +                        struct file *file, void *fh, void *arg)
> +{
> +       return v4l_do_ext_buf_op(ops->vidioc_dqbuf, ops->vidioc_ext_dqbuf,
> +                                file, fh, arg);
>  }
>
>  static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
> @@ -2513,7 +2760,27 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>
>         v4l_sanitize_format(&create->format);
>
> -       ret = ops->vidioc_create_bufs(file, fh, create);
> +       if (ops->vidioc_create_bufs) {
> +               ret = ops->vidioc_create_bufs(file, fh, create);
> +       } else {
> +               struct v4l2_ext_create_buffers ecreate = {
> +                       .count = create->count,
> +                       .memory = create->memory,
> +               };
> +
> +               ret = v4l2_format_to_ext_pix_format(&create->format,
> +                                                   &ecreate.format, true);
> +               if (ret)
> +                       return ret;
> +
> +               ret = ops->vidioc_ext_create_bufs(file, fh, &ecreate);
> +               if (ret)
> +                       return ret;
> +
> +               create->index = ecreate.index;
> +               create->count = ecreate.count;
> +               create->capabilities = ecreate.capabilities;
> +       }
>
>         if (create->format.type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
>             create->format.type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> @@ -2522,13 +2789,60 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>         return ret;
>  }
>
> +static int v4l_ext_create_bufs(const struct v4l2_ioctl_ops *ops,
> +                              struct file *file, void *fh, void *arg)
> +{
> +       struct v4l2_ext_create_buffers *ecreate = arg;
> +       struct video_device *vdev = video_devdata(file);
> +       struct v4l2_create_buffers create = {
> +               .count = ecreate->count,
> +               .memory = ecreate->memory,
> +               .flags = ecreate->flags,
> +       };
> +       bool mplane_cap;
> +       int ret;
> +
> +       ret = check_fmt(file, ecreate->format.type);
> +       if (ret)
> +               return ret;
> +
> +       if (ops->vidioc_ext_create_bufs)
> +               return ops->vidioc_ext_create_bufs(file, fh, ecreate);
> +
> +       mplane_cap = !!(vdev->device_caps &
> +                       (V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +                        V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> +                        V4L2_CAP_VIDEO_M2M_MPLANE));
> +       ret = v4l2_ext_pix_format_to_format(&ecreate->format,
> +                                           &create.format, mplane_cap, true);
> +       if (ret)
> +               return ret;
> +
> +       ret = v4l_create_bufs(ops, file, fh, &create);
> +       if (ret)
> +               return ret;
> +
> +       ecreate->index = create.index;
> +       ecreate->count = create.count;
> +       ecreate->capabilities = create.capabilities;
> +
> +       return 0;
> +}
> +
>  static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops,
> -                               struct file *file, void *fh, void *arg)
> +                          struct file *file, void *fh, void *arg)
>  {
> -       struct v4l2_buffer *b = arg;
> -       int ret = check_fmt(file, b->type);
> +       return v4l_do_buf_op(ops->vidioc_prepare_buf,
> +                            ops->vidioc_ext_prepare_buf,
> +                            file, fh, arg);
> +}
>
> -       return ret ? ret : ops->vidioc_prepare_buf(file, fh, b);
> +static int v4l_ext_prepare_buf(const struct v4l2_ioctl_ops *ops,
> +                              struct file *file, void *fh, void *arg)
> +{
> +       return v4l_do_ext_buf_op(ops->vidioc_prepare_buf,
> +                                ops->vidioc_ext_prepare_buf,
> +                                file, fh, arg);
>  }
>
>  static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
> @@ -3202,12 +3516,15 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>         IOCTL_INFO(VIDIOC_S_EXT_PIX_FMT, v4l_s_ext_pix_fmt, v4l_print_ext_pix_format, INFO_FL_PRIO),
>         IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
>         IOCTL_INFO(VIDIOC_QUERYBUF, v4l_querybuf, v4l_print_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_buffer, length)),
> +       IOCTL_INFO(VIDIOC_EXT_QUERYBUF, v4l_ext_querybuf, v4l_print_ext_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_ext_buffer, planes)),
>         IOCTL_INFO(VIDIOC_G_FBUF, v4l_stub_g_fbuf, v4l_print_framebuffer, 0),
>         IOCTL_INFO(VIDIOC_S_FBUF, v4l_stub_s_fbuf, v4l_print_framebuffer, INFO_FL_PRIO),
>         IOCTL_INFO(VIDIOC_OVERLAY, v4l_overlay, v4l_print_u32, INFO_FL_PRIO),
>         IOCTL_INFO(VIDIOC_QBUF, v4l_qbuf, v4l_print_buffer, INFO_FL_QUEUE),
>         IOCTL_INFO(VIDIOC_EXPBUF, v4l_stub_expbuf, v4l_print_exportbuffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_exportbuffer, flags)),
> +       IOCTL_INFO(VIDIOC_EXT_QBUF, v4l_ext_qbuf, v4l_print_ext_buffer, INFO_FL_QUEUE),
>         IOCTL_INFO(VIDIOC_DQBUF, v4l_dqbuf, v4l_print_buffer, INFO_FL_QUEUE),
> +       IOCTL_INFO(VIDIOC_EXT_DQBUF, v4l_ext_dqbuf, v4l_print_ext_buffer, INFO_FL_QUEUE),
>         IOCTL_INFO(VIDIOC_STREAMON, v4l_streamon, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
>         IOCTL_INFO(VIDIOC_STREAMOFF, v4l_streamoff, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
>         IOCTL_INFO(VIDIOC_G_PARM, v4l_g_parm, v4l_print_streamparm, INFO_FL_CLEAR(v4l2_streamparm, type)),
> @@ -3272,7 +3589,9 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>         IOCTL_INFO(VIDIOC_SUBSCRIBE_EVENT, v4l_subscribe_event, v4l_print_event_subscription, 0),
>         IOCTL_INFO(VIDIOC_UNSUBSCRIBE_EVENT, v4l_unsubscribe_event, v4l_print_event_subscription, 0),
>         IOCTL_INFO(VIDIOC_CREATE_BUFS, v4l_create_bufs, v4l_print_create_buffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> +       IOCTL_INFO(VIDIOC_EXT_CREATE_BUFS, v4l_ext_create_bufs, v4l_print_ext_create_buffers, INFO_FL_PRIO | INFO_FL_QUEUE),
>         IOCTL_INFO(VIDIOC_PREPARE_BUF, v4l_prepare_buf, v4l_print_buffer, INFO_FL_QUEUE),
> +       IOCTL_INFO(VIDIOC_EXT_PREPARE_BUF, v4l_ext_prepare_buf, v4l_print_ext_buffer, INFO_FL_QUEUE),
>         IOCTL_INFO(VIDIOC_ENUM_DV_TIMINGS, v4l_stub_enum_dv_timings, v4l_print_enum_dv_timings, INFO_FL_CLEAR(v4l2_enum_dv_timings, pad)),
>         IOCTL_INFO(VIDIOC_QUERY_DV_TIMINGS, v4l_stub_query_dv_timings, v4l_print_dv_timings, INFO_FL_ALWAYS_COPY),
>         IOCTL_INFO(VIDIOC_DV_TIMINGS_CAP, v4l_stub_dv_timings_cap, v4l_print_dv_timings_cap, INFO_FL_CLEAR(v4l2_dv_timings_cap, pad)),
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index 8bbcb74d8ee31..75996657ad1ba 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -169,16 +169,26 @@ struct v4l2_fh;
>   *     :ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
>   * @vidioc_querybuf: pointer to the function that implements
>   *     :ref:`VIDIOC_QUERYBUF <vidioc_querybuf>` ioctl
> + * @vidioc_ext_querybuf: pointer to the function that implements
> + *     :ref:`VIDIOC_EXT_QUERYBUF <vidioc_ext_querybuf>` ioctl
>   * @vidioc_qbuf: pointer to the function that implements
>   *     :ref:`VIDIOC_QBUF <vidioc_qbuf>` ioctl
> + * @vidioc_ext_qbuf: pointer to the function that implements
> + *     :ref:`VIDIOC_EXT_QBUF <vidioc_ext_qbuf>` ioctl
>   * @vidioc_expbuf: pointer to the function that implements
>   *     :ref:`VIDIOC_EXPBUF <vidioc_expbuf>` ioctl
>   * @vidioc_dqbuf: pointer to the function that implements
>   *     :ref:`VIDIOC_DQBUF <vidioc_qbuf>` ioctl
> + * @vidioc_ext_dqbuf: pointer to the function that implements
> + *     :ref:`VIDIOC_EXT_DQBUF <vidioc_ext_qbuf>` ioctl
>   * @vidioc_create_bufs: pointer to the function that implements
>   *     :ref:`VIDIOC_CREATE_BUFS <vidioc_create_bufs>` ioctl
> + * @vidioc_ext_create_bufs: pointer to the function that implements
> + *     :ref:`VIDIOC_EXT_CREATE_BUFS <vidioc_ext_create_bufs>` ioctl
>   * @vidioc_prepare_buf: pointer to the function that implements
>   *     :ref:`VIDIOC_PREPARE_BUF <vidioc_prepare_buf>` ioctl
> + * @vidioc_ext_prepare_buf: pointer to the function that implements
> + *     :ref:`VIDIOC_EXT_PREPARE_BUF <vidioc_ext_prepare_buf>` ioctl
>   * @vidioc_overlay: pointer to the function that implements
>   *     :ref:`VIDIOC_OVERLAY <vidioc_overlay>` ioctl
>   * @vidioc_g_fbuf: pointer to the function that implements
> @@ -439,17 +449,27 @@ struct v4l2_ioctl_ops {
>                               struct v4l2_requestbuffers *b);
>         int (*vidioc_querybuf)(struct file *file, void *fh,
>                                struct v4l2_buffer *b);
> +       int (*vidioc_ext_querybuf)(struct file *file, void *fh,
> +                                  struct v4l2_ext_buffer *b);
>         int (*vidioc_qbuf)(struct file *file, void *fh,
>                            struct v4l2_buffer *b);
> +       int (*vidioc_ext_qbuf)(struct file *file, void *fh,
> +                              struct v4l2_ext_buffer *b);
>         int (*vidioc_expbuf)(struct file *file, void *fh,
>                              struct v4l2_exportbuffer *e);
>         int (*vidioc_dqbuf)(struct file *file, void *fh,
>                             struct v4l2_buffer *b);
> +       int (*vidioc_ext_dqbuf)(struct file *file, void *fh,
> +                               struct v4l2_ext_buffer *b);
>
>         int (*vidioc_create_bufs)(struct file *file, void *fh,
>                                   struct v4l2_create_buffers *b);
> +       int (*vidioc_ext_create_bufs)(struct file *file, void *fh,
> +                                     struct v4l2_ext_create_buffers *b);
>         int (*vidioc_prepare_buf)(struct file *file, void *fh,
>                                   struct v4l2_buffer *b);
> +       int (*vidioc_ext_prepare_buf)(struct file *file, void *fh,
> +                                     struct v4l2_ext_buffer *b);
>
>         int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
>         int (*vidioc_g_fbuf)(struct file *file, void *fh,
> @@ -758,6 +778,12 @@ int v4l2_ext_pix_format_to_format(const struct v4l2_ext_pix_format *e,
>                                   struct v4l2_format *f,
>                                   bool mplane_cap, bool strict);
>
> +int v4l2_ext_buffer_to_buffer(const struct v4l2_ext_buffer *e,
> +                             struct v4l2_buffer *b,
> +                             bool mplane_cap);
> +int v4l2_buffer_to_ext_buffer(const struct v4l2_buffer *b,
> +                             struct v4l2_ext_buffer *e);
> +
>  /*
>   * The user space interpretation of the 'v4l2_event' differs
>   * based on the 'time_t' definition on 32-bit architectures, so
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 7123c6a4d9569..334cafdd2be97 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -996,6 +996,41 @@ struct v4l2_plane {
>         __u32                   reserved[11];
>  };
>
> +/**
> + * struct v4l2_ext_plane - extended plane buffer info
> + * @buffer_length:     size of the entire buffer in bytes, should fit
> + *                     @offset + @plane_length
> + * @plane_length:      size of the plane in bytes.
> + * @mem_offset:                If V4L2_MEMORY_MMAP is used, then it can be a "cookie"
> + *                     that should be passed to mmap() called on the video node.
> + * @userptr:           when memory is V4L2_MEMORY_USERPTR, a userspace pointer pointing
> + *                     to this plane.
> + * @dmabuf_fd:         when memory is V4L2_MEMORY_DMABUF, a userspace file descriptor
> + *                     associated with this plane.
> + * @offset:            offset in the memory buffer where the plane starts.
> + * @memory:            enum v4l2_memory; the method, in which the actual video
> + *                     data is passed
> + * @reserved:          extra space reserved for future fields, must be set to 0.
> + *
> + *
> + * Buffers consist of one or more planes, e.g. an YCbCr buffer with two planes
> + * can have one plane for Y, and another for interleaved CbCr components.
> + * Each plane can reside in a separate memory buffer, or even in
> + * a completely separate memory node (e.g. in embedded devices).
> + */
> +struct v4l2_ext_plane {
> +       __u32 buffer_length;
> +       __u32 plane_length;
> +       union {
> +               __u32 mem_offset;
> +               __u64 userptr;
> +               __s32 dmabuf_fd;
> +       } m;
> +       __u32 offset;
> +       __u32 memory;
> +       __u32 reserved[4];
> +};
> +
>  /**
>   * struct v4l2_buffer - video buffer info
>   * @index:     id number of the buffer
> @@ -1057,6 +1092,33 @@ struct v4l2_buffer {
>         };
>  };
>
> +/**
> + * struct v4l2_ext_buffer - extended video buffer info
> + * @index:     id number of the buffer
> + * @type:      V4L2_BUF_TYPE_VIDEO_CAPTURE or V4L2_BUF_TYPE_VIDEO_OUTPUT
> + * @flags:     buffer informational flags
> + * @field:     enum v4l2_field; field order of the image in the buffer
> + * @timestamp: frame timestamp
> + * @sequence:  sequence count of this frame
> + * @planes:    per-plane buffer information
> + * @request_fd:        fd of the request that this buffer should use
> + * @reserved:  extra space reserved for future fields, must be set to 0
> + *
> + * Contains data exchanged by application and driver using one of the Streaming
> + * I/O methods.
> + */
> +struct v4l2_ext_buffer {
> +       __u32 index;
> +       __u32 type;
> +       __u32 field;
> +       __u32 sequence;
> +       __u64 flags;
> +       __u64 timestamp;
> +       struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
> +       __s32 request_fd;
> +       __u32 reserved[9];
> +};
> +
>  #ifndef __KERNEL__
>  /**
>   * v4l2_timeval_to_ns - Convert timeval to nanoseconds
> @@ -2523,6 +2585,29 @@ struct v4l2_create_buffers {
>         __u32                   reserved[6];
>  };
>
> +/**
> + * struct v4l2_ext_create_buffers - VIDIOC_EXT_CREATE_BUFS argument
> + * @index:     on return, index of the first created buffer
> + * @count:     entry: number of requested buffers,
> + *             return: number of created buffers
> + * @memory:    enum v4l2_memory; buffer memory type
> + * @capabilities: capabilities of this buffer type.
> + * @format:    frame format, for which buffers are requested
> + * @flags:     additional buffer management attributes (ignored unless the
> + *             queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
> + *             and configured for MMAP streaming I/O).
> + * @reserved:  extra space reserved for future fields, must be set to 0
> + */
> +struct v4l2_ext_create_buffers {
> +       __u32                           index;
> +       __u32                           count;
> +       __u32                           memory;
> +       __u32                           capabilities;
> +       struct v4l2_ext_pix_format      format;
> +       __u32                           flags;
> +       __u32 reserved[5];
> +};
> +
>  /*
>   *     I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
>   *
> @@ -2626,6 +2711,11 @@ struct v4l2_create_buffers {
>  #define VIDIOC_G_EXT_PIX_FMT   _IOWR('V', 104, struct v4l2_ext_pix_format)
>  #define VIDIOC_S_EXT_PIX_FMT   _IOWR('V', 105, struct v4l2_ext_pix_format)
>  #define VIDIOC_TRY_EXT_PIX_FMT _IOWR('V', 106, struct v4l2_ext_pix_format)
> +#define VIDIOC_EXT_CREATE_BUFS _IOWR('V', 107, struct v4l2_ext_create_buffers)
> +#define VIDIOC_EXT_QUERYBUF    _IOWR('V', 108, struct v4l2_ext_buffer)
> +#define VIDIOC_EXT_QBUF                _IOWR('V', 109, struct v4l2_ext_buffer)
> +#define VIDIOC_EXT_DQBUF       _IOWR('V', 110, struct v4l2_ext_buffer)
> +#define VIDIOC_EXT_PREPARE_BUF _IOWR('V', 111, struct v4l2_ext_buffer)
>
>  /* Reminder: when adding new ioctls please add support for them to
>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> --
> 2.28.0.rc2
>
