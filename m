Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 987001797D0
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 19:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388202AbgCDSZs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 13:25:48 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36478 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728168AbgCDSZs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 13:25:48 -0500
Received: by mail-wm1-f65.google.com with SMTP id g83so2907428wme.1
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2020 10:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pgs/+y1lKhJr8LKJNQXvXNsvaRMjo/Tmo1g6PlIDGX4=;
        b=mQUHbY7aPATzO9+R6dEfjjqNkjd6U6xkCT3SSQxeaYSPt6GkY+g/eJAr/ZTCYgAcYM
         upQUH0Mcc0OFpGUkr2aFunwT7KVWQmTnpdC4vLtHgUVfrDDg9UGs8szKVOS0s9hyqlBN
         UAdhT8ZD9mBDD95MPanSvIU0tbnnQFCUMYqDpfa5KHWckf0Mw6Xooq4GAGAjaeFZEoJC
         tqlsyNzY2yU3FA0KlXaILmrc2Pp3rPqHFlvQsYUKPwZ0Avxk598CybnKGktLwtiWBXeY
         ZI3/cdarFeKs9bAIqWu6IaNRCjzJcdbVMPjbov7gTgVh50t1T+UA/bmrcgUZq3ArlZPf
         Zeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pgs/+y1lKhJr8LKJNQXvXNsvaRMjo/Tmo1g6PlIDGX4=;
        b=hzgjjHjWqR98dHfu6l9pBfGIcejURFcocPRwtjcg8iGC1l04ShWawhYjUQv3OWguDZ
         oKVVusx5pRKUTTcGb8lOlJ9vDp+JrciuMw1mJ5IDX6sdSgLOAL2/wqKuS3Kzg6HNWlIT
         B7jXMM/E6xN+ILac2pMPXyBZgp564WfS9QSa0DpUk6VU7AwtgtW8cjsXFOlCq+EBCAXb
         T0g7Jl0EZpQ1OpHdLvrAgVSBn8FHpPuXrjlLM9eERqBHdJUOcXwPUGMMbu7xt19CfzBM
         CNJzVcY2IUYMnBSiMQLkqcWZVfnKGalH7DN/x6XKfOAcs/ibyTyoCodmqn+oSob40joj
         o2QA==
X-Gm-Message-State: ANhLgQ3r3gQtvBLtl+NUO1DmkFa6yPN+1sJdbdhWt8vTb7OCTlaWr4/g
        UrlFhbMiYWVSDDfey1RfyR6qFbSHjSpo/BgQH/gbGMyX6l8grw==
X-Google-Smtp-Source: ADFU+vu78y7se6ZVW5aJW5fVc85ExWMf4G2WtDP6R04xNBFB6Yh0T9CJjVJkeJgTfIKIlipyNfgf7Yh7ot95n5Ut2q8=
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr4818553wml.104.1583346343329;
 Wed, 04 Mar 2020 10:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20191008091119.7294-3-boris.brezillon@collabora.com> <20200304175421.63586-1-frkoenig@google.com>
In-Reply-To: <20200304175421.63586-1-frkoenig@google.com>
From:   Fritz Koenig <frkoenig@google.com>
Date:   Wed, 4 Mar 2020 10:25:30 -0800
Message-ID: <CAMfZQbx9h-wiPD+FhXnX_y6+LJfKhr2Cu=rfPh1f4hK7CsV8Rg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] media: v4l2: Add extended buffer operations
To:     boris.brezillon@collabora.com
Cc:     Brian.Starkey@arm.com, hans.verkuil@cisco.com, hiroh@chromium.org,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        nicolas@ndufresne.ca, sakari.ailus@iki.fi, tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 4, 2020 at 9:54 AM Fritz Koenig <frkoenig@google.com> wrote:
>
> Thanks for putting this patch set together.  I'm currently trying to get
> modifiers working for UBWC.  I've applied these patches and with a little
> tweaking can get video decode working without modifiers.  I haven't tried the
> new ioctls yet.
> > From: Hans Verkuil <hans.verkuil@cisco.com>
> >
> > Those extended buffer ops have several purpose:
> > 1/ Fix y2038 issues by converting the timestamp into an u64 counting
> >    the number of ns elapsed since 1970
> > 2/ Unify single/multiplanar handling
> > 3/ Add a new start offset field to each v4l2 plane buffer info struct
> >    to support the case where a single buffer object is storing all
> >    planes data, each one being placed at a different offset
> >
> > New hooks are created in v4l2_ioctl_ops so that drivers can start using
> > these new objects.
> >
> > The core takes care of converting new ioctls requests to old ones
> > if the driver does not support the new hooks, and vice versa.
> >
> > Note that the timecode field is gone, since there doesn't seem to be
> > in-kernel users, but can be added back in the reserved area if needed.
> >
> > Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Changes in v3:
> > - Rebased on top of media/master (post 5.4-rc1)
> >
> > Changes in v2:
> > - Add reserved space to v4l2_ext_buffer so that new fields can be added
> >   later on
> > ---
> >  drivers/media/v4l2-core/v4l2-dev.c   |  30 +-
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 428 +++++++++++++++++++++++++--
> >  include/media/v4l2-ioctl.h           |  30 ++
> >  include/uapi/linux/videodev2.h       | 130 ++++++++
> >  4 files changed, 591 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > index 9aad715537b3..35c8caccd025 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -696,12 +696,30 @@ static void determine_valid_ioctls(struct video_device *vdev)
> >       if (is_vid || is_vbi || is_sdr || is_tch) {
> >               /* ioctls valid for video, metadata, vbi or sdr */
> >               SET_VALID_IOCTL(ops, VIDIOC_REQBUFS, vidioc_reqbufs);
> > -             SET_VALID_IOCTL(ops, VIDIOC_QUERYBUF, vidioc_querybuf);
> > -             SET_VALID_IOCTL(ops, VIDIOC_QBUF, vidioc_qbuf);
> > -             SET_VALID_IOCTL(ops, VIDIOC_EXPBUF, vidioc_expbuf);
> > -             SET_VALID_IOCTL(ops, VIDIOC_DQBUF, vidioc_dqbuf);
> > -             SET_VALID_IOCTL(ops, VIDIOC_CREATE_BUFS, vidioc_create_bufs);
> > -             SET_VALID_IOCTL(ops, VIDIOC_PREPARE_BUF, vidioc_prepare_buf);
> > +             if (ops->vidioc_querybuf || ops->vidioc_ext_querybuf) {
> > +                     set_bit(_IOC_NR(VIDIOC_QUERYBUF), valid_ioctls);
> > +                     set_bit(_IOC_NR(VIDIOC_EXT_QUERYBUF), valid_ioctls);
> > +             }
> > +             if (ops->vidioc_qbuf || ops->vidioc_ext_qbuf) {
> > +                     set_bit(_IOC_NR(VIDIOC_QBUF), valid_ioctls);
> > +                     set_bit(_IOC_NR(VIDIOC_EXT_QBUF), valid_ioctls);
> > +             }
> > +             if (ops->vidioc_expbuf || ops->vidioc_ext_expbuf) {
> > +                     set_bit(_IOC_NR(VIDIOC_EXPBUF), valid_ioctls);
> > +                     set_bit(_IOC_NR(VIDIOC_EXT_EXPBUF), valid_ioctls);
> > +             }
> > +             if (ops->vidioc_dqbuf || ops->vidioc_ext_dqbuf) {
> > +                     set_bit(_IOC_NR(VIDIOC_DQBUF), valid_ioctls);
> > +                     set_bit(_IOC_NR(VIDIOC_EXT_DQBUF), valid_ioctls);
> > +             }
> > +             if (ops->vidioc_create_bufs || ops->vidioc_ext_create_bufs) {
> > +                     set_bit(_IOC_NR(VIDIOC_CREATE_BUFS), valid_ioctls);
> > +                     set_bit(_IOC_NR(VIDIOC_EXT_CREATE_BUFS), valid_ioctls);
> > +             }
> > +             if (ops->vidioc_prepare_buf || ops->vidioc_ext_prepare_buf) {
> > +                     set_bit(_IOC_NR(VIDIOC_PREPARE_BUF), valid_ioctls);
> > +                     set_bit(_IOC_NR(VIDIOC_EXT_PREPARE_BUF), valid_ioctls);
> > +             }
> >               SET_VALID_IOCTL(ops, VIDIOC_STREAMON, vidioc_streamon);
> >               SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
> >       }
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 78e14c1dc76f..356218e44ccb 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -579,6 +579,25 @@ static void v4l_print_buffer(const void *arg, bool write_only)
> >                       tc->type, tc->flags, tc->frames, *(__u32 *)tc->userbits);
> >  }
> >
> > +static void v4l_print_ext_buffer(const void *arg, bool write_only)
> > +{
> > +     const struct v4l2_ext_buffer *p = arg;
> > +     const struct v4l2_ext_plane *plane;
> > +     int i;
> > +
> > +     pr_cont("%lld index=%d, type=%s, flags=0x%08x, field=%s, sequence=%d, memory=%s\n",
> > +             p->timestamp, p->index, prt_names(p->type, v4l2_type_names),
> > +             p->flags, prt_names(p->field, v4l2_field_names),
> > +             p->sequence, prt_names(p->memory, v4l2_memory_names));
> > +
> > +     for (i = 0; i < p->num_planes; ++i) {
> > +             plane = &p->planes[i];
> > +             pr_debug("plane %d: bytesused=%d, data_offset=0x%08x, offset/userptr=0x%llx, length=%d\n",
> > +                      i, plane->bytesused, plane->data_offset,
> > +                      plane->m.userptr, plane->length);
> > +     }
> > +}
> > +
> >  static void v4l_print_exportbuffer(const void *arg, bool write_only)
> >  {
> >       const struct v4l2_exportbuffer *p = arg;
> > @@ -588,6 +607,18 @@ static void v4l_print_exportbuffer(const void *arg, bool write_only)
> >               p->index, p->plane, p->flags);
> >  }
> >
> > +static void v4l_print_ext_exportbuffer(const void *arg, bool write_only)
> > +{
> > +     const struct v4l2_ext_exportbuffer *p = arg;
> > +     unsigned int i;
> > +
> > +     pr_cont("type=%s, index=%u, first_plane=%u num_planes=%u, flags=%08x\n",
> > +             prt_names(p->type, v4l2_type_names), p->index, p->first_plane,
> > +             p->num_planes, p->flags);
> > +     for (i = p->first_plane; i < p->first_plane + p->num_planes; ++i)
> > +             pr_debug("plane %u: fd=%d\n", i, p->fds[i]);
> > +}
> > +
> >  static void v4l_print_create_buffers(const void *arg, bool write_only)
> >  {
> >       const struct v4l2_create_buffers *p = arg;
> > @@ -598,6 +629,15 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
> >       v4l_print_format(&p->format, write_only);
> >  }
> >
> > +static void v4l_print_ext_create_buffers(const void *arg, bool write_only)
> > +{
> > +     const struct v4l2_ext_create_buffers *p = arg;
> > +
> > +     pr_cont("index=%d, count=%d, memory=%s, ", p->index, p->count,
> > +             prt_names(p->memory, v4l2_memory_names));
> > +     v4l_print_ext_format(&p->format, write_only);
> > +}
> > +
> >  static void v4l_print_streamparm(const void *arg, bool write_only)
> >  {
> >       const struct v4l2_streamparm *p = arg;
> > @@ -1319,6 +1359,123 @@ int v4l2_format_to_ext_format(const struct v4l2_format *f,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_format_to_ext_format);
> >
> > +int v4l2_ext_buffer_to_buffer(const struct v4l2_ext_buffer *e,
> > +                           struct v4l2_buffer *b, bool mplane_cap)
> > +{
> > +     u64 nsecs;
> > +
> > +     if (!mplane_cap && e->num_planes > 1)
> > +             return -EINVAL;
> > +
> > +     memset(b, 0, sizeof(*b));
>
> b->planes needs to be preserved.
>
> I was not able to find a tree that these patches applied to cleanly.  In v5.4
> the struct v4l2_buffer member planes is a raw pointer, so this memset will
> clear it out.
>
> > +
> > +     b->index = e->index;
> > +     b->flags = e->flags;
> > +     b->field = e->field;
> > +     b->sequence = e->sequence;
> > +     b->memory = e->memory;
> > +     b->request_fd = e->request_fd;
> > +     b->timestamp.tv_sec = div64_u64_rem(e->timestamp, NSEC_PER_SEC, &nsecs);
> > +     b->timestamp.tv_usec = (u32)nsecs / NSEC_PER_USEC;
> > +     if (mplane_cap) {
> > +             unsigned int i;
> > +
> > +             if (e->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > +                     b->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > +             else
> > +                     b->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > +
> > +             b->length = e->num_planes;
> > +             for (i = 0; i < e->num_planes; i++) {
> > +                     if (b->memory == V4L2_MEMORY_DMABUF) {
> > +                             if (e->planes[i].m.dmabuf.offset)
> > +                                     return -EINVAL;
> > +
> > +                             b->m.planes[i].m.fd = e->planes[i].m.dmabuf.fd;
> > +                     } else {
> > +                             b->m.planes[i].m.userptr = e->planes[i].m.userptr;
> > +                     }
> > +                     b->m.planes[i].length = e->planes[i].length;
> > +                     b->m.planes[i].bytesused = e->planes[i].bytesused;
> > +                     b->m.planes[i].data_offset = e->planes[i].data_offset;
> > +                     memset(b->m.planes[i].reserved, 0,
> > +                            sizeof(b->m.planes[i].reserved));
> > +             }
> > +     } else {
> > +             b->type = e->type;
> > +             b->bytesused = e->planes[0].bytesused;
> > +             b->length = e->planes[0].length;
> > +             if (b->memory == V4L2_MEMORY_DMABUF) {
> > +                     if (e->planes[0].m.dmabuf.offset)
> > +                             return -EINVAL;
> > +
> > +                     b->m.fd = e->planes[0].m.dmabuf.fd;
> > +             } else {
> > +                     b->m.userptr = e->planes[0].m.userptr;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_ext_buffer_to_buffer);
> > +
> > +int v4l2_buffer_to_ext_buffer(const struct v4l2_buffer *b,
> > +                           struct v4l2_ext_buffer *e)
> > +{
> > +     memset(e, 0, sizeof(*e));
> > +
> > +     e->index = b->index;
> > +     e->flags = b->flags;
> > +     e->field = b->field;
> > +     e->sequence = b->sequence;
> > +     e->memory = b->memory;
> > +     e->request_fd = b->request_fd;
> > +     e->timestamp = b->timestamp.tv_sec * NSEC_PER_SEC +
> > +             b->timestamp.tv_usec * NSEC_PER_USEC;
> > +     if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
> > +             unsigned int i;
> > +
> > +             if (!b->m.planes)
> > +                     return -EINVAL;
> > +
> > +             if (b->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> > +                     e->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> > +             else
> > +                     e->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> > +
> > +             e->num_planes = b->length;
> > +             for (i = 0; i < e->num_planes; i++) {
> > +                     if (b->memory == V4L2_MEMORY_DMABUF) {
> > +                             e->planes[i].m.dmabuf.fd = b->m.planes[i].m.fd;
> > +                             e->planes[i].m.dmabuf.offset = 0;
> > +                     } else {
> > +                             e->planes[i].m.userptr = b->m.planes[i].m.userptr;
> > +                     }
> > +                     e->planes[i].length = b->m.planes[i].length;
> > +                     e->planes[i].bytesused = b->m.planes[i].bytesused;
> > +                     e->planes[i].data_offset = b->m.planes[i].data_offset;
> > +                     memset(e->planes[i].reserved, 0,
> > +                            sizeof(e->planes[i].reserved));
> > +             }
> > +     } else {
> > +             e->type = b->type;
> > +             e->num_planes = 1;
> > +             e->planes[0].bytesused = b->bytesused;
> > +             e->planes[0].length = b->length;
> > +             if (b->memory == V4L2_MEMORY_DMABUF) {
> > +                     e->planes[0].m.dmabuf.fd = b->m.fd;
> > +                     e->planes[0].m.dmabuf.offset = 0;
> > +             } else {
> > +                     e->planes[0].m.userptr = b->m.userptr;
> > +             }
> > +             e->planes[0].m.userptr = b->m.userptr;
> > +             e->planes[0].data_offset = 0;
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_buffer_to_ext_buffer);
> > +
> >  static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
> >                               struct file *file, void *fh, void *arg)
> >  {
> > @@ -2506,31 +2663,109 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
> >       return ops->vidioc_reqbufs(file, fh, p);
> >  }
> >
> > -static int v4l_querybuf(const struct v4l2_ioctl_ops *ops,
> > -                             struct file *file, void *fh, void *arg)
> > +static int v4l_do_buf_op(int (*op)(struct file *, void *,
> > +                                struct v4l2_buffer *),
> > +                      int (*ext_op)(struct file *, void *,
> > +                                    struct v4l2_ext_buffer *),
> > +                      struct file *file, void *fh, struct v4l2_buffer *b)
> >  {
> > -     struct v4l2_buffer *p = arg;
> > -     int ret = check_fmt(file, p->type);
> > +     struct v4l2_ext_buffer eb;
> > +     int ret;
> >
> > -     return ret ? ret : ops->vidioc_querybuf(file, fh, p);
> > +     ret = check_fmt(file, b->type);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (op)
> > +             return op(file, fh, b);
> > +
> > +     ret = v4l2_buffer_to_ext_buffer(b, &eb);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = ext_op(file, fh, &eb);
> > +     if (ret)
> > +             return ret;
> > +
> > +     v4l2_ext_buffer_to_buffer(&eb, b, V4L2_TYPE_IS_MULTIPLANAR(b->type));
> > +     return 0;
> > +}
> > +
> > +static int v4l_do_ext_buf_op(int (*op)(struct file *, void *,
> > +                                    struct v4l2_buffer *),
> > +                          int (*ext_op)(struct file *, void *,
> > +                                        struct v4l2_ext_buffer *),
> > +                          struct file *file, void *fh,
> > +                          struct v4l2_ext_buffer *eb)
> > +{
> > +     struct video_device *vdev = video_devdata(file);
> > +     struct v4l2_buffer b;
> > +     bool mplane_cap;
> > +     int ret;
> > +
> > +     ret = check_fmt(file, eb->type);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (ext_op)
> > +             return ext_op(file, fh, eb);
> > +
> > +     mplane_cap = !!(vdev->device_caps &
> > +                     (V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> > +                      V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> > +                      V4L2_CAP_VIDEO_M2M_MPLANE));
> > +     ret = v4l2_ext_buffer_to_buffer(eb, &b, mplane_cap);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = op(file, fh, &b);
> > +     if (ret)
> > +             return ret;
> > +
> > +     v4l2_buffer_to_ext_buffer(&b, eb);
> > +     return 0;
> > +}
> > +
> > +static int v4l_querybuf(const struct v4l2_ioctl_ops *ops,
> > +                     struct file *file, void *fh, void *arg)
> > +{
> > +     return v4l_do_buf_op(ops->vidioc_querybuf, ops->vidioc_ext_querybuf,
> > +                          file, fh, arg);
> > +}
> > +

VIDIOC_QUERYBUF has a problem now.
v4l_do_buf_op macro expands into:
v4l2_buffer_to_ext_buffer
op
v4l2_ext_buffer_to_buffer

To copy to an v4l2_ext_buffer, type is changed by
v4l2_buffer_to_ext_buffer from V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE to
V4L2_BUF_TYPE_VIDEO_CAPTURE.

When __fill_v4l2_buffer is called from vb2_core_querybuf, type is set
back to the V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE.

Finally when v4l2_ext_buffer_to_buffer is called the queue ends up
getting set to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE.

The reason I see this is that my OUTPUT queue is mm and my CAPTURE
queue is dmabuf.  When I try to then VIDIOC_QBUF that buffer, the
memory types for the queue and the buffer do not match.


> > +static int v4l_ext_querybuf(const struct v4l2_ioctl_ops *ops,
> > +                         struct file *file, void *fh, void *arg)
> > +{
> > +     return v4l_do_ext_buf_op(ops->vidioc_querybuf,
> > +                              ops->vidioc_ext_querybuf, file, fh, arg);
> >  }
> >
> >  static int v4l_qbuf(const struct v4l2_ioctl_ops *ops,
> > -                             struct file *file, void *fh, void *arg)
> > +                 struct file *file, void *fh, void *arg)
> >  {
> > -     struct v4l2_buffer *p = arg;
> > -     int ret = check_fmt(file, p->type);
> > +     return v4l_do_buf_op(ops->vidioc_qbuf, ops->vidioc_ext_qbuf,
> > +                          file, fh, arg);
> > +}
> >
> > -     return ret ? ret : ops->vidioc_qbuf(file, fh, p);
> > +static int v4l_ext_qbuf(const struct v4l2_ioctl_ops *ops,
> > +                     struct file *file, void *fh, void *arg)
> > +{
> > +     return v4l_do_ext_buf_op(ops->vidioc_qbuf, ops->vidioc_ext_qbuf,
> > +                              file, fh, arg);
> >  }
> >
> >  static int v4l_dqbuf(const struct v4l2_ioctl_ops *ops,
> > -                             struct file *file, void *fh, void *arg)
> > +                  struct file *file, void *fh, void *arg)
> >  {
> > -     struct v4l2_buffer *p = arg;
> > -     int ret = check_fmt(file, p->type);
> > +     return v4l_do_buf_op(ops->vidioc_dqbuf, ops->vidioc_ext_dqbuf,
> > +                          file, fh, arg);
> > +}
> >
> > -     return ret ? ret : ops->vidioc_dqbuf(file, fh, p);
> > +static int v4l_ext_dqbuf(const struct v4l2_ioctl_ops *ops,
> > +                      struct file *file, void *fh, void *arg)
> > +{
> > +     return v4l_do_ext_buf_op(ops->vidioc_dqbuf, ops->vidioc_ext_dqbuf,
> > +                              file, fh, arg);
> >  }
> >
> >  static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
> > @@ -2546,7 +2781,27 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
> >
> >       v4l_sanitize_format(&create->format);
> >
> > -     ret = ops->vidioc_create_bufs(file, fh, create);
> > +     if (ops->vidioc_create_bufs) {
> > +             ret = ops->vidioc_create_bufs(file, fh, create);
> > +     } else {
> > +             struct v4l2_ext_create_buffers ecreate = {
> > +                     .count = create->count,
> > +                     .memory = create->memory,
> > +             };
> > +
> > +             ret = v4l2_format_to_ext_format(&create->format,
> > +                                             &ecreate.format, true);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ret = ops->vidioc_ext_create_bufs(file, fh, &ecreate);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             create->index = ecreate.index;
> > +             create->count = ecreate.count;
> > +             create->capabilities = ecreate.capabilities;
> > +     }
> >
> >       if (create->format.type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
> >           create->format.type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > @@ -2555,13 +2810,59 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
> >       return ret;
> >  }
> >
> > -static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops,
> > -                             struct file *file, void *fh, void *arg)
> > +static int v4l_ext_create_bufs(const struct v4l2_ioctl_ops *ops,
> > +                            struct file *file, void *fh, void *arg)
> >  {
> > -     struct v4l2_buffer *b = arg;
> > -     int ret = check_fmt(file, b->type);
> > +     struct v4l2_ext_create_buffers *ecreate = arg;
> > +     struct video_device *vdev = video_devdata(file);
> > +     struct v4l2_create_buffers create = {
> > +             .count = ecreate->count,
> > +             .memory = ecreate->memory,
> > +     };
> > +     bool mplane_cap;
> > +     int ret;
> >
> > -     return ret ? ret : ops->vidioc_prepare_buf(file, fh, b);
> > +     ret = check_fmt(file, ecreate->format.type);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (ops->vidioc_ext_create_bufs)
> > +             return ops->vidioc_ext_create_bufs(file, fh, ecreate);
> > +
> > +     mplane_cap = !!(vdev->device_caps &
> > +                     (V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> > +                      V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> > +                      V4L2_CAP_VIDEO_M2M_MPLANE));
> > +     ret = v4l2_ext_format_to_format(&ecreate->format,
> > +                                     &create.format, mplane_cap, true);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = v4l_create_bufs(ops, file, fh, &create);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ecreate->index = create.index;
> > +     ecreate->count = create.count;
> > +     ecreate->capabilities = create.capabilities;
> > +
> > +     return 0;
> > +}
> > +
> > +static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops,
> > +                        struct file *file, void *fh, void *arg)
> > +{
> > +     return v4l_do_buf_op(ops->vidioc_prepare_buf,
> > +                          ops->vidioc_ext_prepare_buf,
> > +                          file, fh, arg);
> > +}
> > +
> > +static int v4l_ext_prepare_buf(const struct v4l2_ioctl_ops *ops,
> > +                            struct file *file, void *fh, void *arg)
> > +{
> > +     return v4l_do_ext_buf_op(ops->vidioc_prepare_buf,
> > +                              ops->vidioc_ext_prepare_buf,
> > +                              file, fh, arg);
> >  }
> >
> >  static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
> > @@ -3159,6 +3460,86 @@ static int v4l_enum_freq_bands(const struct v4l2_ioctl_ops *ops,
> >       return -ENOTTY;
> >  }
> >
> > +static int v4l_expbuf(const struct v4l2_ioctl_ops *ops, struct file *file,
> > +                   void *fh, void *arg)
> > +{
> > +     struct v4l2_exportbuffer *b = arg;
> > +     struct v4l2_ext_exportbuffer eb = {
> > +             .type = b->type,
> > +             .index = b->index,
> > +             .first_plane = b->plane,
> > +             .num_planes = 1,
> > +             .flags = b->flags,
> > +     };
> > +     int ret;
> > +
> > +     if (ops->vidioc_expbuf)
> > +             return ops->vidioc_expbuf(file, fh, b);
> > +
> > +     if (b->plane >= VIDEO_MAX_PLANES)
> > +             return -EINVAL;
> > +
> > +     ret = ops->vidioc_ext_expbuf(file, fh, &eb);
> > +     if (ret)
> > +             return ret;
> > +
> > +     b->fd = eb.fds[b->plane];
> > +     return 0;
> > +}
> > +
> > +static int v4l_ext_expbuf(const struct v4l2_ioctl_ops *ops,
> > +                       struct file *file, void *fh, void *arg)
> > +{
> > +     struct v4l2_ext_exportbuffer *eb = arg;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     if (eb->first_plane >= VIDEO_MAX_PLANES ||
> > +         eb->num_planes > VIDEO_MAX_PLANES ||
> > +         eb->first_plane + eb->num_planes > VIDEO_MAX_PLANES)
> > +             return -EINVAL;
> > +
> > +     if (ops->vidioc_ext_expbuf)
> > +             return ops->vidioc_ext_expbuf(file, fh, eb);
> > +
> > +     for (i = eb->first_plane; i < eb->first_plane + eb->num_planes; i++) {
> > +             struct v4l2_exportbuffer b = {
> > +                     .type = eb->type,
> > +                     .index = eb->index,
> > +                     .plane = i,
> > +                     .flags = eb->flags,
> > +             };
> > +
> > +             ret = ops->vidioc_expbuf(file, fh, &b);
> > +             if (ret)
> > +                     goto err_put_dmabufs;
> > +
> > +             eb->fds[i] = b.fd;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_put_dmabufs:
> > +     for (i = eb->first_plane; i < eb->first_plane + eb->num_planes; i++) {
> > +             struct dma_buf *dmabuf;
> > +
> > +             if (eb->fds[i] <= 0)
> > +                     break;
> > +
> > +             /*
> > +              * We must call dma_buf_put() twice because we got one
> > +              * reference taken at dmabuf creation time one taken when
> > +              * calling dma_buf_get().
> > +              * FIXME: not entirely sure this works correctly.
> > +              */
> > +             dmabuf = dma_buf_get(eb->fds[i]);
> > +             dma_buf_put(dmabuf);
> > +             dma_buf_put(dmabuf);
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> >  struct v4l2_ioctl_info {
> >       unsigned int ioctl;
> >       u32 flags;
> > @@ -3201,7 +3582,6 @@ struct v4l2_ioctl_info {
> >
> >  DEFINE_V4L_STUB_FUNC(g_fbuf)
> >  DEFINE_V4L_STUB_FUNC(s_fbuf)
> > -DEFINE_V4L_STUB_FUNC(expbuf)
> >  DEFINE_V4L_STUB_FUNC(g_std)
> >  DEFINE_V4L_STUB_FUNC(g_audio)
> >  DEFINE_V4L_STUB_FUNC(s_audio)
> > @@ -3237,12 +3617,16 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
> >       IOCTL_INFO(VIDIOC_S_EXT_FMT, v4l_s_ext_fmt, v4l_print_ext_format, INFO_FL_PRIO),
> >       IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> >       IOCTL_INFO(VIDIOC_QUERYBUF, v4l_querybuf, v4l_print_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_buffer, length)),
> > +     IOCTL_INFO(VIDIOC_EXT_QUERYBUF, v4l_ext_querybuf, v4l_print_ext_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_ext_buffer, num_planes)),
> >       IOCTL_INFO(VIDIOC_G_FBUF, v4l_stub_g_fbuf, v4l_print_framebuffer, 0),
> >       IOCTL_INFO(VIDIOC_S_FBUF, v4l_stub_s_fbuf, v4l_print_framebuffer, INFO_FL_PRIO),
> >       IOCTL_INFO(VIDIOC_OVERLAY, v4l_overlay, v4l_print_u32, INFO_FL_PRIO),
> >       IOCTL_INFO(VIDIOC_QBUF, v4l_qbuf, v4l_print_buffer, INFO_FL_QUEUE),
> > -     IOCTL_INFO(VIDIOC_EXPBUF, v4l_stub_expbuf, v4l_print_exportbuffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_exportbuffer, flags)),
> > +     IOCTL_INFO(VIDIOC_EXT_QBUF, v4l_ext_qbuf, v4l_print_ext_buffer, INFO_FL_QUEUE),
> > +     IOCTL_INFO(VIDIOC_EXPBUF, v4l_expbuf, v4l_print_exportbuffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_exportbuffer, flags)),
> > +     IOCTL_INFO(VIDIOC_EXT_EXPBUF, v4l_ext_expbuf, v4l_print_ext_exportbuffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_exportbuffer, flags)),
> >       IOCTL_INFO(VIDIOC_DQBUF, v4l_dqbuf, v4l_print_buffer, INFO_FL_QUEUE),
> > +     IOCTL_INFO(VIDIOC_EXT_DQBUF, v4l_ext_dqbuf, v4l_print_ext_buffer, INFO_FL_QUEUE),
> >       IOCTL_INFO(VIDIOC_STREAMON, v4l_streamon, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
> >       IOCTL_INFO(VIDIOC_STREAMOFF, v4l_streamoff, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
> >       IOCTL_INFO(VIDIOC_G_PARM, v4l_g_parm, v4l_print_streamparm, INFO_FL_CLEAR(v4l2_streamparm, type)),
> > @@ -3307,7 +3691,9 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
> >       IOCTL_INFO(VIDIOC_SUBSCRIBE_EVENT, v4l_subscribe_event, v4l_print_event_subscription, 0),
> >       IOCTL_INFO(VIDIOC_UNSUBSCRIBE_EVENT, v4l_unsubscribe_event, v4l_print_event_subscription, 0),
> >       IOCTL_INFO(VIDIOC_CREATE_BUFS, v4l_create_bufs, v4l_print_create_buffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> > +     IOCTL_INFO(VIDIOC_EXT_CREATE_BUFS, v4l_ext_create_bufs, v4l_print_ext_create_buffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> >       IOCTL_INFO(VIDIOC_PREPARE_BUF, v4l_prepare_buf, v4l_print_buffer, INFO_FL_QUEUE),
> > +     IOCTL_INFO(VIDIOC_EXT_PREPARE_BUF, v4l_ext_prepare_buf, v4l_print_ext_buffer, INFO_FL_QUEUE),
> >       IOCTL_INFO(VIDIOC_ENUM_DV_TIMINGS, v4l_stub_enum_dv_timings, v4l_print_enum_dv_timings, INFO_FL_CLEAR(v4l2_enum_dv_timings, pad)),
> >       IOCTL_INFO(VIDIOC_QUERY_DV_TIMINGS, v4l_stub_query_dv_timings, v4l_print_dv_timings, INFO_FL_ALWAYS_COPY),
> >       IOCTL_INFO(VIDIOC_DV_TIMINGS_CAP, v4l_stub_dv_timings_cap, v4l_print_dv_timings_cap, INFO_FL_CLEAR(v4l2_dv_timings_cap, pad)),
> > diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> > index 39ac07fbc7b7..f7e375d38602 100644
> > --- a/include/media/v4l2-ioctl.h
> > +++ b/include/media/v4l2-ioctl.h
> > @@ -168,16 +168,28 @@ struct v4l2_fh;
> >   *   :ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
> >   * @vidioc_querybuf: pointer to the function that implements
> >   *   :ref:`VIDIOC_QUERYBUF <vidioc_querybuf>` ioctl
> > + * @vidioc_ext_querybuf: pointer to the function that implements
> > + *   :ref:`VIDIOC_EXT_QUERYBUF <vidioc_ext_querybuf>` ioctl
> >   * @vidioc_qbuf: pointer to the function that implements
> >   *   :ref:`VIDIOC_QBUF <vidioc_qbuf>` ioctl
> > + * @vidioc_ext_qbuf: pointer to the function that implements
> > + *   :ref:`VIDIOC_EXT_QBUF <vidioc_ext_qbuf>` ioctl
> >   * @vidioc_expbuf: pointer to the function that implements
> >   *   :ref:`VIDIOC_EXPBUF <vidioc_expbuf>` ioctl
> > + * @vidioc_ext_expbuf: pointer to the function that implements
> > + *   :ref:`VIDIOC_EXT_EXPBUF <vidioc_ext_expbuf>` ioctl
> >   * @vidioc_dqbuf: pointer to the function that implements
> >   *   :ref:`VIDIOC_DQBUF <vidioc_qbuf>` ioctl
> > + * @vidioc_ext_dqbuf: pointer to the function that implements
> > + *   :ref:`VIDIOC_EXT_DQBUF <vidioc_ext_qbuf>` ioctl
> >   * @vidioc_create_bufs: pointer to the function that implements
> >   *   :ref:`VIDIOC_CREATE_BUFS <vidioc_create_bufs>` ioctl
> > + * @vidioc_ext_create_bufs: pointer to the function that implements
> > + *   :ref:`VIDIOC_EXT_CREATE_BUFS <vidioc_ext_create_bufs>` ioctl
> >   * @vidioc_prepare_buf: pointer to the function that implements
> >   *   :ref:`VIDIOC_PREPARE_BUF <vidioc_prepare_buf>` ioctl
> > + * @vidioc_ext_prepare_buf: pointer to the function that implements
> > + *   :ref:`VIDIOC_EXT_PREPARE_BUF <vidioc_ext_prepare_buf>` ioctl
> >   * @vidioc_overlay: pointer to the function that implements
> >   *   :ref:`VIDIOC_OVERLAY <vidioc_overlay>` ioctl
> >   * @vidioc_g_fbuf: pointer to the function that implements
> > @@ -438,17 +450,29 @@ struct v4l2_ioctl_ops {
> >                             struct v4l2_requestbuffers *b);
> >       int (*vidioc_querybuf)(struct file *file, void *fh,
> >                              struct v4l2_buffer *b);
> > +     int (*vidioc_ext_querybuf)(struct file *file, void *fh,
> > +                                struct v4l2_ext_buffer *b);
> >       int (*vidioc_qbuf)(struct file *file, void *fh,
> >                          struct v4l2_buffer *b);
> > +     int (*vidioc_ext_qbuf)(struct file *file, void *fh,
> > +                            struct v4l2_ext_buffer *b);
> >       int (*vidioc_expbuf)(struct file *file, void *fh,
> >                            struct v4l2_exportbuffer *e);
> > +     int (*vidioc_ext_expbuf)(struct file *file, void *fh,
> > +                              struct v4l2_ext_exportbuffer *e);
> >       int (*vidioc_dqbuf)(struct file *file, void *fh,
> >                           struct v4l2_buffer *b);
> > +     int (*vidioc_ext_dqbuf)(struct file *file, void *fh,
> > +                             struct v4l2_ext_buffer *b);
> >
> >       int (*vidioc_create_bufs)(struct file *file, void *fh,
> >                                 struct v4l2_create_buffers *b);
> > +     int (*vidioc_ext_create_bufs)(struct file *file, void *fh,
> > +                                   struct v4l2_ext_create_buffers *b);
> >       int (*vidioc_prepare_buf)(struct file *file, void *fh,
> >                                 struct v4l2_buffer *b);
> > +     int (*vidioc_ext_prepare_buf)(struct file *file, void *fh,
> > +                                   struct v4l2_ext_buffer *b);
> >
> >       int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
> >       int (*vidioc_g_fbuf)(struct file *file, void *fh,
> > @@ -757,4 +781,10 @@ int v4l2_ext_format_to_format(const struct v4l2_ext_format *e,
> >                             struct v4l2_format *f,
> >                             bool mplane_cap, bool strict);
> >
> > +int v4l2_ext_buffer_to_buffer(const struct v4l2_ext_buffer *e,
> > +                           struct v4l2_buffer *b,
> > +                           bool mplane_cap);
> > +int v4l2_buffer_to_ext_buffer(const struct v4l2_buffer *b,
> > +                           struct v4l2_ext_buffer *e);
> > +
> >  #endif /* _V4L2_IOCTL_H */
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index c7b169de1c7b..33c8348df13f 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -953,6 +953,49 @@ struct v4l2_plane {
> >       __u32                   reserved[11];
> >  };
> >
> > +/**
> > + * struct v4l2_ext_plane - extended plane buffer info
> > + * @bytesused: number of bytes occupied by data in the plane (payload)
> > + * @length: size of this plane (NOT the payload) in bytes
> > + * @mem_offset: when memory in the associated struct v4l2_ext_buffer is
> > + *           V4L2_MEMORY_MMAP, equals the offset from the start of the
> > + *           device memory for this plane (or is a "cookie" that should be
> > + *           passed to mmap() called on the video node)
> > + * @userptr: when memory is V4L2_MEMORY_USERPTR, a userspace pointer pointing
> > + *        to this plane
> > + * @dmabuf.fd: when memory is V4L2_MEMORY_DMABUF, a userspace file descriptor
> > + *          associated with this plane
> > + * @dmabuf.offset: where the plane starts inside the DMABUF buffer. All planes
> > + *              might share the same buffer object. In this case we need to
> > + *              know where the plane start inside this buffer.
> > + * @data_offset: offset in the plane to the start of data; usually 0, unless
> > + *            there is a header in front of the data. data_offset is
> > + *            relative to start_offset, so absolute data_offset is actually
> > + *            start_offset + data_offset
> > + *
> > + *
> > + * Multi-planar buffers consist of one or more planes, e.g. an YCbCr buffer
> > + * with two planes can have one plane for Y, and another for interleaved CbCr
> > + * components. Each plane can reside in a separate memory buffer, or even in
> > + * a completely separate memory node (e.g. in embedded devices).
> > + * Note that this struct is also used for uni-planar buffers, but in that case
> > + * you'll only have one plane defined.
> > + */
> > +struct v4l2_ext_plane {
> > +     __u32 bytesused;
> > +     __u32 length;
> > +     union {
> > +             __u32 mem_offset;
> > +             __u64 userptr;
> > +             struct {
> > +                     __s32 fd;
> > +                     __u32 offset;
> > +             } dmabuf;
> > +     } m;
> > +     __u32 data_offset;
> > +     __u32 reserved[10];
> > +};
> > +
> >  /**
> >   * struct v4l2_buffer - video buffer info
> >   * @index:   id number of the buffer
> > @@ -1010,6 +1053,40 @@ struct v4l2_buffer {
> >       };
> >  };
> >
> > +/**
> > + * struct v4l2_ext_buffer - extended video buffer info
> > + * @index: id number of the buffer
> > + * @type: enum v4l2_buf_type; buffer type. _MPLANE and _OVERLAY formats are
> > + *     invalid
> > + * @flags: buffer informational flags
> > + * @field: enum v4l2_field; field order of the image in the buffer
> > + * @timestamp: frame timestamp
> > + * @sequence: sequence count of this frame
> > + * @memory: enum v4l2_memory; the method, in which the actual video data is
> > + *          passed
> > + * @planes: per-plane buffer information
> > + * @num_planes: number of plane buffers
> > + * @request_fd: fd of the request that this buffer should use
> > + * @reserved: some extra space reserved to add future fields (like timecode).
> > + *         Must be set to 0
> > + *
> > + * Contains data exchanged by application and driver using one of the Streaming
> > + * I/O methods.
> > + */
> > +struct v4l2_ext_buffer {
> > +     __u32 index;
> > +     __u32 type;
> > +     __u32 flags;
> > +     __u32 field;
> > +     __u64 timestamp;
> > +     __u32 sequence;
> > +     __u32 memory;
> > +     struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
> > +     __u32 num_planes;
> > +     __u32 request_fd;
> > +     __u32 reserved[10];
> > +};
> > +
> >  /**
> >   * v4l2_timeval_to_ns - Convert timeval to nanoseconds
> >   * @ts:              pointer to the timeval variable to be converted
> > @@ -1087,6 +1164,35 @@ struct v4l2_exportbuffer {
> >       __u32           reserved[11];
> >  };
> >
> > +/**
> > + * struct v4l2_ext_exportbuffer - export of video buffer as DMABUF file
> > + *                             descriptor using extended format
> > + *
> > + * @index: id number of the buffer
> > + * @type: enum v4l2_buf_type; buffer type
> > + * @flags: flags for newly created file(s), currently only O_CLOEXEC is
> > + *      supported, refer to manual of open syscall for more details
> > + * @first_plane: first plane to export. Most likely set to 0
> > + * @num_planes: number of planes to export. Most set to the number of planes
> > + *           attached to the buffer
> > + * @fds: file descriptors associated with DMABUF (set by driver). Note that all
> > + *    planes might share the same buffer and then be returned the same FD
> > + *
> > + * Contains data used for exporting a video buffer as DMABUF file descriptor.
> > + * The buffer is identified by a 'cookie' returned by VIDIOC_QUERYBUF
> > + * (identical to the cookie used to mmap() the buffer to userspace). All
> > + * reserved fields must be set to zero.
> > + */
> > +struct v4l2_ext_exportbuffer {
> > +     __u32 type; /* enum v4l2_buf_type */
> > +     __u32 index;
> > +     __u32 flags;
> > +     __u32 first_plane;
> > +     __u32 num_planes;
> > +     __s32 fds[VIDEO_MAX_PLANES];
> > +     __u32 reserved;
> > +};
> > +
> >  /*
> >   *   O V E R L A Y   P R E V I E W
> >   */
> > @@ -2483,6 +2589,23 @@ struct v4l2_create_buffers {
> >       __u32                   reserved[7];
> >  };
> >
> > +/**
> > + * struct v4l2_ext_create_buffers - VIDIOC_EXT_CREATE_BUFS argument
> > + * @index:   on return, index of the first created buffer
> > + * @count:   entry: number of requested buffers,
> > + *           return: number of created buffers
> > + * @memory:  enum v4l2_memory; buffer memory type
> > + * @capabilities: capabilities of this buffer type.
> > + * @format:  frame format, for which buffers are requested
> > + */
> > +struct v4l2_ext_create_buffers {
> > +     __u32                   index;
> > +     __u32                   count;
> > +     __u32                   memory;
> > +     __u32                   capabilities;
> > +     struct v4l2_ext_format  format;
> > +};
> > +
> >  /*
> >   *   I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
> >   *
> > @@ -2586,6 +2709,13 @@ struct v4l2_create_buffers {
> >  #define VIDIOC_G_EXT_FMT     _IOWR('V', 104, struct v4l2_ext_format)
> >  #define VIDIOC_S_EXT_FMT     _IOWR('V', 105, struct v4l2_ext_format)
> >  #define VIDIOC_TRY_EXT_FMT   _IOWR('V', 106, struct v4l2_ext_format)
> > +#define VIDIOC_EXT_CREATE_BUFS       _IOWR('V', 107, struct v4l2_ext_create_buffers)
> > +#define VIDIOC_EXT_QUERYBUF  _IOWR('V', 108, struct v4l2_ext_buffer)
> > +#define VIDIOC_EXT_QBUF              _IOWR('V', 109, struct v4l2_ext_buffer)
> > +#define VIDIOC_EXT_DQBUF     _IOWR('V', 110, struct v4l2_ext_buffer)
> > +#define VIDIOC_EXT_PREPARE_BUF       _IOWR('V', 111, struct v4l2_ext_buffer)
> > +#define VIDIOC_EXT_EXPBUF    _IOWR('V', 112, struct v4l2_ext_exportbuffer)
> > +
> >  /* Reminder: when adding new ioctls please add support for them to
> >     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> >
> > --
> > 2.21.0
> >
> >
