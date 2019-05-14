Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F021C689
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 12:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfENKBh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 06:01:37 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37245 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbfENKBh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 06:01:37 -0400
Received: by mail-oi1-f195.google.com with SMTP id f4so4312494oib.4
        for <linux-media@vger.kernel.org>; Tue, 14 May 2019 03:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8L4qGuJki7QTSZmu6+A/gsPxKKE+5AsQzRSn2iECzqg=;
        b=LweJIBNuGdUbtQDG7UYEkxyZoryt9cdTVj51ExaPL5tSkQuTZB5c8kn4y4SnVzAbsl
         jJlfzHZ+DHpSqq44QaObH5wnipTbtye1029A7qQnjCc5C/OgxUcywFCN3Fp1Nst1T1wi
         3mIaq3ZhkyN+A+gFivftlcNXiJush8737BgUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8L4qGuJki7QTSZmu6+A/gsPxKKE+5AsQzRSn2iECzqg=;
        b=LNg6ORL/AddQNxBDXHaU4v+8/M+mKgBJovRWNMjP5sBu1YnllMSAJ1Ue/Ab285rQcQ
         FXPauB2+JyTOCMxlCx2sbd48hbslt2tXyvYcOnTTpIsoT5+EgPmKnpMyR/iBlMPpKYjd
         y9V0HaYDbBKm/gxmbbo4UedVM0JIbYB3fbZ29Tya5Funt4WvnglJsz2vmlVBx1Ud56gb
         YpSsRLEiB70LecrsaopKC2x2QNzq84R2855LvqmeEcHZGckwy8ZI6g0TU+LhOFpd+PEQ
         XfgOsdHM3WsUhgO96rRhGlQ/17KODH2DmYh5gMNE2bELLN3ogdfvmdrIJKHsAU97YPH3
         LYpQ==
X-Gm-Message-State: APjAAAWjtNnRKGDXjiS/2ENHkAA6RGwXIGdsLZZ0CqwUTttT7EcSEFBa
        fu1JqVZIbu1K+oeHDQHmZIUk2p+TWk8=
X-Google-Smtp-Source: APXvYqyZH6Vq2om2h5G6WmpNYl+MdPTOYaV8xSgqdg6XXKn4o5Ck28ma69iv8GAoSev9WNgY6hzP6A==
X-Received: by 2002:aca:4bd2:: with SMTP id y201mr2192073oia.12.1557828095705;
        Tue, 14 May 2019 03:01:35 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id m206sm6113983oif.50.2019.05.14.03.01.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 03:01:34 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id j49so6997396otc.13
        for <linux-media@vger.kernel.org>; Tue, 14 May 2019 03:01:34 -0700 (PDT)
X-Received: by 2002:a9d:634d:: with SMTP id y13mr2252006otk.291.1557828094232;
 Tue, 14 May 2019 03:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <87ad5e5c-088c-c5b6-f653-8936b8f334ab@xs4all.nl> <3a18cca2-4d39-e000-3384-305e28b12025@xs4all.nl>
In-Reply-To: <3a18cca2-4d39-e000-3384-305e28b12025@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 14 May 2019 19:01:22 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVi1yPN5VepRD2TP3q2LVfd7UYc5Tun0EEUBL6GfPHhdg@mail.gmail.com>
Message-ID: <CAPBb6MVi1yPN5VepRD2TP3q2LVfd7UYc5Tun0EEUBL6GfPHhdg@mail.gmail.com>
Subject: Re: [RFC PATCH] vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Mon, May 13, 2019 at 6:36 PM
To: Linux Media Mailing List, Paul Kocialkowski, Tomasz Figa, Nicolas
Dufresne, Alexandre Courbot, Boris Brezillon, Maxime Ripard, Thierry
Reding

> On 4/30/19 10:31 AM, Hans Verkuil wrote:
> > This RFC patch adds support for the V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF flag.
> > It also adds a new V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability and
> > a v4l2_m2m_release_capture_buf() helper function.
> >
> > Drivers should set vb2_queue->subsystem_flags to VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
> > to indicate support for this flag.
> >
> > At the start of the device_run function drivers should first check if the
> > current capture buffer should be released:
> >
> > if (v4l2_m2m_release_capture_buf(out_vb, cap_vb)) {
> >       v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> >       v4l2_m2m_job_finish(...);
> >       return;
> > }
> >
> > And at the end they should check (out_vb->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)
> > and, if set, skip returning the capture buffer to vb2.
> >
> > This has only been compile tested, and this is missing the documentation. I would
> > like to know if this works in a real driver first before turning this into a proper
> > patch series.
>
> Ping!
>
> Did anyone have the opportunity (or is planning) to test if this patch actually works?

Sorry, I am also still bringing a test driver up as well. But at first
sight it seems to cover what we discussed.

Just one note regarding the naming of v4l2_m2m_release_capture_buf().

>
> Regards,
>
>         Hans
>
> >
> > Regards,
> >
> >       Hans
> >
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > index fb9ac7696fc6..83372de9b815 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > @@ -50,7 +50,8 @@ module_param(debug, int, 0644);
> >                                V4L2_BUF_FLAG_TIMESTAMP_MASK)
> >  /* Output buffer flags that should be passed on to the driver */
> >  #define V4L2_BUFFER_OUT_FLAGS        (V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_BFRAME | \
> > -                              V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE)
> > +                              V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE | \
> > +                              V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)
> >
> >  /*
> >   * __verify_planes_array() - verify that the planes array passed in struct
> > @@ -321,6 +322,8 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
> >                */
> >               vbuf->flags &= ~V4L2_BUF_FLAG_TIMECODE;
> >               vbuf->field = b->field;
> > +             if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
> > +                     vbuf->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> >       } else {
> >               /* Zero any output buffer flags as this is a capture buffer */
> >               vbuf->flags &= ~V4L2_BUFFER_OUT_FLAGS;
> > @@ -659,6 +662,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
> >               *caps |= V4L2_BUF_CAP_SUPPORTS_USERPTR;
> >       if (q->io_modes & VB2_DMABUF)
> >               *caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
> > +     if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
> > +             *caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
> >  #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
> >       if (q->supports_requests)
> >               *caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> > diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> > index bb3e63d6bd1a..6af1d519938f 100644
> > --- a/include/media/v4l2-mem2mem.h
> > +++ b/include/media/v4l2-mem2mem.h
> > @@ -648,6 +648,38 @@ void v4l2_m2m_buf_copy_metadata(const struct vb2_v4l2_buffer *out_vb,
> >                               struct vb2_v4l2_buffer *cap_vb,
> >                               bool copy_frame_flags);
> >
> > +/**
> > + * v4l2_m2m_release_capture_buf() - check if the capture buffer should be
> > + * released
> > + *
> > + * @out_vb: the output buffer
> > + * @cap_vb: the capture buffer
> > + *
> > + * This helper function returns true if the current capture buffer should
> > + * be released to vb2. This is the case if the output buffer specified that
> > + * the capture buffer should be held (i.e. not returned to vb2) AND if the
> > + * timestamp of the capture buffer differs from the output buffer timestamp.
> > + *
> > + * This helper is to be called at the start of the device_run callback:
> > + *
> > + * if (v4l2_m2m_release_capture_buf(out_vb, cap_vb)) {
> > + *   v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> > + *   v4l2_m2m_job_finish(...);
> > + *   return;
> > + * }

The way this function is called makes it sound like it does release
the capture buffer by itself - but wouldn't the current behavior
suggest it should rather be named something like
v4l2_m2m_should_release_capture_buf()? Either that or we call
v4l2_m2m_buf_done() and v4l2_m2m_job_finish() from it.

> > + *
> > + * This allows for multiple output buffers to be used to fill in a single
> > + * capture buffer. This is typically used by stateless decoders where
> > + * multiple e.g. H.264 slices contribute to a single decoded frame.
> > + */
> > +static inline bool v4l2_m2m_release_capture_buf(const struct vb2_v4l2_buffer *out_vb,
> > +                                             const struct vb2_v4l2_buffer *cap_vb)
> > +{
> > +     return (out_vb->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF) &&
> > +             cap_vb->vb2_buf.copied_timestamp &&
> > +             out_vb->vb2_buf.timestamp != cap_vb->vb2_buf.timestamp;
> > +}
> > +
> >  /* v4l2 request helper */
> >
> >  void v4l2_m2m_request_queue(struct media_request *req);
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> > index 22f3ff76a8b5..e9d99023c637 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -504,6 +504,8 @@ struct vb2_buf_ops {
> >   * @buf_ops: callbacks to deliver buffer information.
> >   *           between user-space and kernel-space.
> >   * @drv_priv:        driver private data.
> > + * @subsystem_flags: Flags specific to the subsystem (V4L2/DVB/etc.). Not used
> > + *           by the vb2 core.
> >   * @buf_struct_size: size of the driver-specific buffer structure;
> >   *           "0" indicates the driver doesn't want to use a custom buffer
> >   *           structure type. for example, ``sizeof(struct vb2_v4l2_buffer)``
> > @@ -570,6 +572,7 @@ struct vb2_queue {
> >       const struct vb2_buf_ops        *buf_ops;
> >
> >       void                            *drv_priv;
> > +     u32                             subsystem_flags;
> >       unsigned int                    buf_struct_size;
> >       u32                             timestamp_flags;
> >       gfp_t                           gfp_flags;
> > diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
> > index 8a10889dc2fd..4e52427a4114 100644
> > --- a/include/media/videobuf2-v4l2.h
> > +++ b/include/media/videobuf2-v4l2.h
> > @@ -49,6 +49,9 @@ struct vb2_v4l2_buffer {
> >       struct vb2_plane        planes[VB2_MAX_PLANES];
> >  };
> >
> > +/* VB2 V4L2 flags as set in vb2_queue.subsystem_flags */
> > +#define VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF (1 << 0)
> > +
> >  /*
> >   * to_vb2_v4l2_buffer() - cast struct vb2_buffer * to struct vb2_v4l2_buffer *
> >   */
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 1050a75fb7ef..26925d63ea05 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -907,11 +907,12 @@ struct v4l2_requestbuffers {
> >  };
> >
> >  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
> > -#define V4L2_BUF_CAP_SUPPORTS_MMAP   (1 << 0)
> > -#define V4L2_BUF_CAP_SUPPORTS_USERPTR        (1 << 1)
> > -#define V4L2_BUF_CAP_SUPPORTS_DMABUF (1 << 2)
> > -#define V4L2_BUF_CAP_SUPPORTS_REQUESTS       (1 << 3)
> > -#define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS (1 << 4)
> > +#define V4L2_BUF_CAP_SUPPORTS_MMAP                   (1 << 0)
> > +#define V4L2_BUF_CAP_SUPPORTS_USERPTR                        (1 << 1)
> > +#define V4L2_BUF_CAP_SUPPORTS_DMABUF                 (1 << 2)
> > +#define V4L2_BUF_CAP_SUPPORTS_REQUESTS                       (1 << 3)
> > +#define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS          (1 << 4)
> > +#define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF   (1 << 5)
> >
> >  /**
> >   * struct v4l2_plane - plane info for multi-planar buffers
> > @@ -1033,6 +1034,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
> >  #define V4L2_BUF_FLAG_IN_REQUEST             0x00000080
> >  /* timecode field is valid */
> >  #define V4L2_BUF_FLAG_TIMECODE                       0x00000100
> > +/* Don't return the capture buffer until OUTPUT timestamp changes */
> > +#define V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF   0x00000200
> >  /* Buffer is prepared for queuing */
> >  #define V4L2_BUF_FLAG_PREPARED                       0x00000400
> >  /* Cache handling flags */
> >
>
