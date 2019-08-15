Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8E7F8EE25
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731464AbfHOO2I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:28:08 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38976 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731085AbfHOO2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:28:08 -0400
Received: by mail-ot1-f67.google.com with SMTP id b1so6269773otp.6
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 07:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L4WmE2+OtbUiwjAuiBQDo7YW8DLMCZ+ao9jANaMs9JE=;
        b=GLVt06yiO8kzZgWApgFIi9mHE7yFQWZ3nBYCOOAknOpgm3U0oPFP3MXYyJZDP1MjRs
         79VwlRvspUxl03WI1gjb3Q2QEbZvjwKUZCPojNr7FKGSn0lmAM5cINu4WTHb3UScH7TT
         49l1tbXSIClmHJgFnuXnPL2bQdm3tEeoDcjxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L4WmE2+OtbUiwjAuiBQDo7YW8DLMCZ+ao9jANaMs9JE=;
        b=MU5K7fbrH08wuz10tlvkg1Fl/rm/bFXPpBbP3LhoqvyZfN9V/UtOT8JG0U8nuxhCLF
         3FrujTvzxH3VUfq93Y0S9Rd5BN2bpJsu2YoLde+exQabBoD5d8IpoIg8lS1i7qCcnPxo
         eVEih/VxNhQXCiSo5Z/MU4NVvRyFxSWcghPbjU40ZrOrEl7JWy9lzKliRhQiI7eR+8Tu
         2SAoTeZ7a2KsGWqN7uQZ0ahDwBKA5hs1u5aIhp+VxUR4BtWKl6iLxFzFOeB3TumxqXj2
         wwBxTSCxIkfPeImmRh1rLHzrtGstahF47EvTAd8NvliJ7oAQPYMqQKwmS6p5L4V4P3Gh
         Xq0Q==
X-Gm-Message-State: APjAAAWBwv8eybgvBt0BSx/SaP/pZQROE4zDMrCHZ55o5Fks088Poa9m
        t7xRXf0suSaTv0cg+GEF10Vj67yTpms=
X-Google-Smtp-Source: APXvYqwhhmbS4kpZd1jfLsa46PL6IBwRVUIJt7DjVUITOQtVZHpcfVQVGKrJYQLZ2gH11Z65OA7XPg==
X-Received: by 2002:a9d:7516:: with SMTP id r22mr3962828otk.151.1565879286123;
        Thu, 15 Aug 2019 07:28:06 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 3sm1141098otx.77.2019.08.15.07.28.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 07:28:05 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id b1so6269528otp.6
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 07:28:05 -0700 (PDT)
X-Received: by 2002:a9d:4817:: with SMTP id c23mr3301801otf.97.1565879284464;
 Thu, 15 Aug 2019 07:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-10-hverkuil-cisco@xs4all.nl> <CAPBb6MW_kSdSA99iFPXmTxqOag3=0D9AOAV6OrO2Umw9nnHdTw@mail.gmail.com>
 <4961c8f5-0cb8-1ab9-af13-9f8092536e21@xs4all.nl>
In-Reply-To: <4961c8f5-0cb8-1ab9-af13-9f8092536e21@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 15 Aug 2019 23:27:53 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXFRWENRNmmBUJg2S7hmsB2FHR0AuT_j-JVSLVF0dsztA@mail.gmail.com>
Message-ID: <CAPBb6MXFRWENRNmmBUJg2S7hmsB2FHR0AuT_j-JVSLVF0dsztA@mail.gmail.com>
Subject: Re: [PATCHv2 09/12] vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 15, 2019 at 8:53 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 8/15/19 10:12 AM, Alexandre Courbot wrote:
> > On Mon, Aug 12, 2019 at 8:06 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> This RFC patch adds support for the V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF flag.
> >> It also adds a new V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability and
> >> a v4l2_m2m_release_capture_buf() helper function.
> >>
> >> Drivers should set vb2_queue->subsystem_flags to VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
> >> to indicate support for this flag.
> >>
> >> The device_run() function should look like this:
> >>
> >> if (v4l2_m2m_release_capture_buf(out_vb, cap_vb)) {
> >>         v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> >>         v4l2_m2m_job_finish(...);
> >>         return;
> >> }
> >> cap_vb->is_held = out_vb->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> >>
> >> ...
> >>
> >> v4l2_m2m_buf_done(out_vb, VB2_BUF_STATE_DONE);
> >> if (!cap_vb->is_held) {
> >>         v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> >>         v4l2_m2m_job_finish(...);
> >> }
> >>
> >> In order to handle the corner case where V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
> >> is always set for the output buffer, and you reached the last frame (so no
> >> new output buffer will be queued with a new timestamp), the driver should
> >> implement support for the V4L2_DEC_CMD_STOP command, and that should do:
>
> V4L2_DEC_CMD_STOP should have been CMD_FLUSH. Sorry for the confusion.
>
> >
> > I wonder if "the driver must implement..." would not make things
> > easier: what about drivers that only support formats for which we have
> > an exact 1:1 mapping (like VP8)? Should they also implement it? What
>
> Such drivers do not need this and will not set
> V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF. If that cap is not set,
> then V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF will be ignored.
>
> > it permitted for a driver supporting this flag to not implement
> > V4L2_DEC_CMD_STOP?
>
> Drivers that support this flag must implement DEC_CMD_FLUSH.
>
> >
> > Leaving this as an option may complicate user-space quite a bit. Since
> > the implementation of V4L2_DEC_CMD_STOP does not seem too complicated,
> > how about making it mandatory for all stateless decoders?
>
> It's a good question: should we support DEC_CMD_FLUSH also for decoders
> that do not set V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF?
>
> It would be a NOP, but it might simplify applications.

Supporting it as a NOP (maybe even transparently) seems to be the most
portable and easiest to handle for user-space.

>
> That said, I think we can postpone a decision about that until we have
> more experience. It is easier to add support for this than to remove
> it later.
>
> Regards,
>
>         Hans
>
> >
> >
> >>
> >> struct vb2_v4l2_buffer *out_vb = v4l2_m2m_last_src_buf(m2m_ctx);
> >> struct vb2_v4l2_buffer *cap_vb = v4l2_m2m_last_dst_buf(m2m_ctx);
> >>
> >> if (out_vb) {
> >>         out_vb->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> >> } else if (cap_vb && cap_vb->is_held) {
> >>         v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> >>         v4l2_m2m_job_finish(...);
> >> }
> >>
> >> At least, I think so. Comments on this are very welcome. We definitely
> >> need better support in v4l2-mem2mem.c for such situations (same for
> >> stateful codecs) since it's too complex for drivers to get right IMHO.
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> Tested-by: Boris Brezillon <boris.brezillon@collabora.com>
> >> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> >> ---
> >>  Documentation/media/uapi/v4l/buffer.rst       | 13 ++++++
> >>  .../media/uapi/v4l/vidioc-reqbufs.rst         |  6 +++
> >>  .../media/common/videobuf2/videobuf2-v4l2.c   |  8 +++-
> >>  include/media/v4l2-mem2mem.h                  | 42 +++++++++++++++++++
> >>  include/media/videobuf2-core.h                |  3 ++
> >>  include/media/videobuf2-v4l2.h                |  5 +++
> >>  include/uapi/linux/videodev2.h                | 13 +++---
> >>  7 files changed, 84 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
> >> index 1cbd9cde57f3..afb03906ead9 100644
> >> --- a/Documentation/media/uapi/v4l/buffer.rst
> >> +++ b/Documentation/media/uapi/v4l/buffer.rst
> >> @@ -607,6 +607,19 @@ Buffer Flags
> >>         applications shall use this flag for output buffers if the data in
> >>         this buffer has not been created by the CPU but by some
> >>         DMA-capable unit, in which case caches have not been used.
> >> +    * .. _`V4L2-BUF-FLAG-M2M-HOLD-CAPTURE-BUF`:
> >> +
> >> +      - ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF``
> >> +      - 0x00000200
> >> +      - Only valid if ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` is
> >> +        set. It is typically used with stateless decoders where multiple
> >> +       output buffers each decode to a slice of the decoded frame.
> >> +       Applications can set this flag when queueing the output buffer
> >> +       to prevent the driver from dequeueing the capture buffer after
> >> +       the output buffer has been decoded (i.e. the capture buffer is
> >> +       'held'). If the timestamp of this output buffer differs from that
> >> +       of the previous output buffer, then that indicates the start of a
> >> +       new frame and the previously held capture buffer is dequeued.
> >>      * .. _`V4L2-BUF-FLAG-LAST`:
> >>
> >>        - ``V4L2_BUF_FLAG_LAST``
> >> diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> >> index d7faef10e39b..d0c643db477a 100644
> >> --- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> >> +++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> >> @@ -125,6 +125,7 @@ aborting or finishing any DMA in progress, an implicit
> >>  .. _V4L2-BUF-CAP-SUPPORTS-DMABUF:
> >>  .. _V4L2-BUF-CAP-SUPPORTS-REQUESTS:
> >>  .. _V4L2-BUF-CAP-SUPPORTS-ORPHANED-BUFS:
> >> +.. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
> >>
> >>  .. cssclass:: longtable
> >>
> >> @@ -150,6 +151,11 @@ aborting or finishing any DMA in progress, an implicit
> >>        - The kernel allows calling :ref:`VIDIOC_REQBUFS` while buffers are still
> >>          mapped or exported via DMABUF. These orphaned buffers will be freed
> >>          when they are unmapped or when the exported DMABUF fds are closed.
> >> +    * - ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF``
> >> +      - 0x00000020
> >> +      - Only valid for stateless decoders. If set, then userspace can set the
> >> +        ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
> >> +       capture buffer until the OUTPUT timestamp changes.
> >>
> >>  Return Value
> >>  ============
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >> index 5a9ba3846f0a..699787f48f46 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >> @@ -50,7 +50,8 @@ module_param(debug, int, 0644);
> >>                                  V4L2_BUF_FLAG_TIMESTAMP_MASK)
> >>  /* Output buffer flags that should be passed on to the driver */
> >>  #define V4L2_BUFFER_OUT_FLAGS  (V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_BFRAME | \
> >> -                                V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE)
> >> +                                V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE | \
> >> +                                V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)
> >>
> >>  /*
> >>   * __verify_planes_array() - verify that the planes array passed in struct
> >> @@ -194,6 +195,7 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
> >>         }
> >>         vbuf->sequence = 0;
> >>         vbuf->request_fd = -1;
> >> +       vbuf->is_held = false;
> >>
> >>         if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
> >>                 switch (b->memory) {
> >> @@ -321,6 +323,8 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
> >>                  */
> >>                 vbuf->flags &= ~V4L2_BUF_FLAG_TIMECODE;
> >>                 vbuf->field = b->field;
> >> +               if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
> >> +                       vbuf->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> >>         } else {
> >>                 /* Zero any output buffer flags as this is a capture buffer */
> >>                 vbuf->flags &= ~V4L2_BUFFER_OUT_FLAGS;
> >> @@ -654,6 +658,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
> >>                 *caps |= V4L2_BUF_CAP_SUPPORTS_USERPTR;
> >>         if (q->io_modes & VB2_DMABUF)
> >>                 *caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
> >> +       if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
> >> +               *caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
> >>  #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
> >>         if (q->supports_requests)
> >>                 *caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> >> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> >> index 0b9c3a287061..724858efded2 100644
> >> --- a/include/media/v4l2-mem2mem.h
> >> +++ b/include/media/v4l2-mem2mem.h
> >> @@ -644,6 +644,48 @@ void v4l2_m2m_buf_copy_metadata(const struct vb2_v4l2_buffer *out_vb,
> >>                                 struct vb2_v4l2_buffer *cap_vb,
> >>                                 bool copy_frame_flags);
> >>
> >> +/**
> >> + * v4l2_m2m_release_capture_buf() - check if the capture buffer should be
> >> + * released
> >> + *
> >> + * @out_vb: the output buffer
> >> + * @cap_vb: the capture buffer
> >> + *
> >> + * This helper function returns true if the current capture buffer should
> >> + * be released to vb2. This is the case if the output buffer specified that
> >> + * the capture buffer should be held (i.e. not returned to vb2) AND if the
> >> + * timestamp of the capture buffer differs from the output buffer timestamp.
> >> + *
> >> + * This helper is to be called at the start of the device_run callback:
> >> + *
> >> + * .. code-block:: c
> >> + *
> >> + *     if (v4l2_m2m_release_capture_buf(out_vb, cap_vb)) {
> >> + *             v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> >> + *             v4l2_m2m_job_finish(...);
> >> + *             return;
> >> + *     }
> >> + *     cap_vb->is_held = out_vb->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> >> + *
> >> + *     ...
> >> + *
> >> + *     v4l2_m2m_buf_done(out_vb, VB2_BUF_STATE_DONE);
> >> + *     if (!cap_vb->is_held) {
> >> + *             v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> >> + *             v4l2_m2m_job_finish(...);
> >> + *     }
> >> + *
> >> + * This allows for multiple output buffers to be used to fill in a single
> >> + * capture buffer. This is typically used by stateless decoders where
> >> + * multiple e.g. H.264 slices contribute to a single decoded frame.
> >> + */
> >> +static inline bool v4l2_m2m_release_capture_buf(const struct vb2_v4l2_buffer *out_vb,
> >> +                                               const struct vb2_v4l2_buffer *cap_vb)
> >> +{
> >> +       return cap_vb->is_held && cap_vb->vb2_buf.copied_timestamp &&
> >> +              out_vb->vb2_buf.timestamp != cap_vb->vb2_buf.timestamp;
> >> +}
> >> +
> >>  /* v4l2 request helper */
> >>
> >>  void v4l2_m2m_request_queue(struct media_request *req);
> >> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> >> index 640aabe69450..a2b2208b02da 100644
> >> --- a/include/media/videobuf2-core.h
> >> +++ b/include/media/videobuf2-core.h
> >> @@ -505,6 +505,8 @@ struct vb2_buf_ops {
> >>   * @buf_ops:   callbacks to deliver buffer information.
> >>   *             between user-space and kernel-space.
> >>   * @drv_priv:  driver private data.
> >> + * @subsystem_flags: Flags specific to the subsystem (V4L2/DVB/etc.). Not used
> >> + *             by the vb2 core.
> >>   * @buf_struct_size: size of the driver-specific buffer structure;
> >>   *             "0" indicates the driver doesn't want to use a custom buffer
> >>   *             structure type. for example, ``sizeof(struct vb2_v4l2_buffer)``
> >> @@ -571,6 +573,7 @@ struct vb2_queue {
> >>         const struct vb2_buf_ops        *buf_ops;
> >>
> >>         void                            *drv_priv;
> >> +       u32                             subsystem_flags;
> >>         unsigned int                    buf_struct_size;
> >>         u32                             timestamp_flags;
> >>         gfp_t                           gfp_flags;
> >> diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
> >> index 8a10889dc2fd..13ab101864aa 100644
> >> --- a/include/media/videobuf2-v4l2.h
> >> +++ b/include/media/videobuf2-v4l2.h
> >> @@ -33,6 +33,7 @@
> >>   * @timecode:  frame timecode.
> >>   * @sequence:  sequence count of this frame.
> >>   * @request_fd:        the request_fd associated with this buffer
> >> + * @is_held:   if true, then this buffer was held
> >>   * @planes:    plane information (userptr/fd, length, bytesused, data_offset).
> >>   *
> >>   * Should contain enough information to be able to cover all the fields
> >> @@ -46,9 +47,13 @@ struct vb2_v4l2_buffer {
> >>         struct v4l2_timecode    timecode;
> >>         __u32                   sequence;
> >>         __s32                   request_fd;
> >> +       bool                    is_held;
> >>         struct vb2_plane        planes[VB2_MAX_PLANES];
> >>  };
> >>
> >> +/* VB2 V4L2 flags as set in vb2_queue.subsystem_flags */
> >> +#define VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF (1 << 0)
> >> +
> >>  /*
> >>   * to_vb2_v4l2_buffer() - cast struct vb2_buffer * to struct vb2_v4l2_buffer *
> >>   */
> >> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >> index 530638dffd93..4fa9f543742d 100644
> >> --- a/include/uapi/linux/videodev2.h
> >> +++ b/include/uapi/linux/videodev2.h
> >> @@ -915,11 +915,12 @@ struct v4l2_requestbuffers {
> >>  };
> >>
> >>  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
> >> -#define V4L2_BUF_CAP_SUPPORTS_MMAP     (1 << 0)
> >> -#define V4L2_BUF_CAP_SUPPORTS_USERPTR  (1 << 1)
> >> -#define V4L2_BUF_CAP_SUPPORTS_DMABUF   (1 << 2)
> >> -#define V4L2_BUF_CAP_SUPPORTS_REQUESTS (1 << 3)
> >> -#define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS (1 << 4)
> >> +#define V4L2_BUF_CAP_SUPPORTS_MMAP                     (1 << 0)
> >> +#define V4L2_BUF_CAP_SUPPORTS_USERPTR                  (1 << 1)
> >> +#define V4L2_BUF_CAP_SUPPORTS_DMABUF                   (1 << 2)
> >> +#define V4L2_BUF_CAP_SUPPORTS_REQUESTS                 (1 << 3)
> >> +#define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS            (1 << 4)
> >> +#define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF     (1 << 5)
> >>
> >>  /**
> >>   * struct v4l2_plane - plane info for multi-planar buffers
> >> @@ -1041,6 +1042,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
> >>  #define V4L2_BUF_FLAG_IN_REQUEST               0x00000080
> >>  /* timecode field is valid */
> >>  #define V4L2_BUF_FLAG_TIMECODE                 0x00000100
> >> +/* Don't return the capture buffer until OUTPUT timestamp changes */
> >> +#define V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF     0x00000200
> >>  /* Buffer is prepared for queuing */
> >>  #define V4L2_BUF_FLAG_PREPARED                 0x00000400
> >>  /* Cache handling flags */
> >> --
> >> 2.20.1
> >>
>
