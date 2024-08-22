Return-Path: <linux-media+bounces-16590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DA695AA99
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 03:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E028E2884A6
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 01:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B33CBA4B;
	Thu, 22 Aug 2024 01:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YZWhMQlr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C4B101F2
	for <linux-media@vger.kernel.org>; Thu, 22 Aug 2024 01:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724290579; cv=none; b=uI4N2uYiGwAkgara7yoaF7OW4ziJKM4Gl0YKoOzjaz/aMI5X1FCojELA7bER1FS8zsC933MAJeXjMloaCTCg8gkxEAFwSTpSZXv9bUzKpkO0TZyChUaXl8zSJEJenttp9bkTNZhHA25oq9Cq2ESBlQrwwY7fgOlMJVIl7noLFik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724290579; c=relaxed/simple;
	bh=0oWc0iUZ17RkFlmB0A+xW+F2PdfzvCN94nx69eQ07wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMxNZgLaqKofLyYX/Rj1jJLHPTLdmudcDgPIQPgbcQ8Jg8DgS7OipH6UzeCBxw2zzwmBF71YUnCgJowanRsw2mrvlDNPWicTV7l2rC+EUDeV/rnTRANO1tRXHYmPxfm5atAB5TsjSrqs3j5Ze8pmGdUCDgEyfjK67IQX1o4sR9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YZWhMQlr; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6c159150ff4so1229406d6.2
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 18:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724290576; x=1724895376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkGym0+NINJviqEk2ORbY7KcAB/aBXVsRZojgi0XtMY=;
        b=YZWhMQlrQcVLDGhJd+CmEkikphveU/2NLZo4SH2lJLDiAl8o7F51rU7ZQ008aq2bOw
         1KsgAIKzODr+uDUYXGTj5/LhUGiryb98LDo5IG87tBtqelXNttF9g5JbTJ/8kw5Z0lli
         PUpZXTfMkp50bw8L0XBahO15fTipCunZk5leg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724290576; x=1724895376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkGym0+NINJviqEk2ORbY7KcAB/aBXVsRZojgi0XtMY=;
        b=WArtT3iHP0V9iCesuIkBIQtGej1GFZQef1x6b1NEPOD7zm+Kwut/ZnBQOMBzuspgmI
         U1jYjUQMT/cp0eLZv8zvCfin/XlQYtsN0FTzTk7ku30zsHpEv1uLM8yS5x+LNrrzSp3Z
         qF4NYEWGe+BvWqof8sI2qhVyx41lxJ33kN4KrMQEdrxiJu9NpFQJJNJRBV9RhRqhuRqt
         l6ZxeWVCKBJvv2WpuzU/5QXr9ELd3mJU1U6NT02V61nK47DVMEYEfDJFTJVPsCUxRxS6
         a/DsdlDmXx2oUlM9S2WVow9jNDTdc0S08wrLMcpY1LzN24QgdVbKvbED9XEcJnURX9/5
         clkA==
X-Forwarded-Encrypted: i=1; AJvYcCUuFuYahXID/slQJ5tViSGRy2C88MZ5Ic9P8BPgH1/kVjB+AYoyoQOx9owcTSDxYM5Qugis9A8vv+VD/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF44NiKZZnQYqbp9EuKd6BPQdfK1VVODPZ3FlEofcgqFVbHe+N
	bKGeJLZH2Xb3R+vslNNN3MpUXasIRqpueC4pUeh8m44Z0qnl9f3ZO/LuqY7r2bNufcTDt2Q6uMw
	C0w==
X-Google-Smtp-Source: AGHT+IFVSx6rVPFyliW3UikYP2dWmSj0CzxJ0MhRq/jBsGX7SnWceZrnPSXrF0xaglV10BMpgpTdoA==
X-Received: by 2002:a0c:f410:0:b0:6bd:69a5:4fc4 with SMTP id 6a1803df08f44-6c1646ea611mr3767816d6.8.1724290576150;
        Wed, 21 Aug 2024 18:36:16 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162db0986sm2587436d6.97.2024.08.21.18.36.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 18:36:15 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-45029af1408so87571cf.1
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 18:36:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1e3StOMADsWDoEKvXajwGJi11T3LFPSlPXGmEuOSH50dzfGfLKa+xs+mM/zOGKRft2QCpNmnS5b8AkA==@vger.kernel.org
X-Received: by 2002:a05:622a:5285:b0:447:e8bd:2fbe with SMTP id
 d75a77b69052e-454fd6ccbaamr1099211cf.1.1724290185907; Wed, 21 Aug 2024
 18:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314153226.197445-1-benjamin.gaignard@collabora.com>
 <20240314153226.197445-3-benjamin.gaignard@collabora.com> <20240821232819.GA18600@pendragon.ideasonboard.com>
In-Reply-To: <20240821232819.GA18600@pendragon.ideasonboard.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 22 Aug 2024 10:29:29 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AQTZa2epfkJnfn_6kpnaNRMzjZ=FjYjf1DM+ZxE0YkZQ@mail.gmail.com>
Message-ID: <CAAFQd5AQTZa2epfkJnfn_6kpnaNRMzjZ=FjYjf1DM+ZxE0YkZQ@mail.gmail.com>
Subject: Re: [PATCH v21 2/9] videobuf2: Add min_reqbufs_allocation field to
 vb2_queue structure
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hverkuil-cisco@xs4all.nl
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, nicolas@ndufresne.ca, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 8:28=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Benjamin,
>
> On Thu, Mar 14, 2024 at 04:32:19PM +0100, Benjamin Gaignard wrote:
> > Add 'min_reqbufs_allocation' field in the vb2_queue structure so driver=
s
> > can specify the minimum number of buffers to allocate when calling
> > VIDIOC_REQBUFS.
> > When initializing the queue, v4l2 core makes sure that the following
> > constraints are respected:
> > - the minimum number of buffers to allocate must be at least 2 because
> > one buffer is used by the hardware while the other is being processed
> > by userspace.
>
> This breaks userspace for the Renesas vsp1 driver :-( Unit tests fail,
> as some of them rely on operation with a single buffer.
>
> The vsp1 is a memory-to-memory processing engine, so operating with a
> single buffer is fine in some use cases. I would argue that for live
> capture devices there are valid use cases to operate with a single
> buffer too. Changing this by default will break use cases.
>
> How can we relax this check ? Should I simply submit a patch that lowers
> the minimum to one buffer ?
>

Uhm, I didn't notice this when reading this series. (Actually if I
recall correctly, originally it didn't have this restriction.)

Indeed, I don't see what's wrong with just having 1 buffer. If
performance is not a concern, it's okay to just serialize the
operation on 1 buffer.

If you would be so nice to send it, I think a patch that changes
min_reqbufs_allocation to max(max(1, min_reqbufs_allocation),
min_queued_buffers)) would be good.

That said, Benjamin, Hans, are we missing something by any chance? :)

Best,
Tomasz

> > -if the driver needs 'min_queued_buffers' in the queue before calling
> > start_streaming(), then the minimum requirement is 'min_queued_buffers =
+ 1'
> > to keep at least one buffer available for userspace.
> >
> > Simplify __vb2_init_fileio() by using 'min_reqbufs_allocation' directly
> > to avoid duplicating the minimum number of buffers to allocate computat=
ion.
> >
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > ---
> >  .../media/common/videobuf2/videobuf2-core.c   | 38 +++++++++++--------
> >  include/media/videobuf2-core.h                | 15 +++++++-
> >  2 files changed, 37 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/=
media/common/videobuf2/videobuf2-core.c
> > index d8b3c04cb3b5..58c495b253ce 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -866,7 +866,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_=
memory memory,
> >       /*
> >        * Make sure the requested values and current defaults are sane.
> >        */
> > -     num_buffers =3D max_t(unsigned int, *count, q->min_queued_buffers=
);
> > +     num_buffers =3D max_t(unsigned int, *count, q->min_reqbufs_alloca=
tion);
> >       num_buffers =3D min_t(unsigned int, num_buffers, q->max_num_buffe=
rs);
> >       memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
> >       /*
> > @@ -918,7 +918,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_=
memory memory,
> >        * There is no point in continuing if we can't allocate the minim=
um
> >        * number of buffers needed by this vb2_queue.
> >        */
> > -     if (allocated_buffers < q->min_queued_buffers)
> > +     if (allocated_buffers < q->min_reqbufs_allocation)
> >               ret =3D -ENOMEM;
> >
> >       /*
> > @@ -2524,6 +2524,25 @@ int vb2_core_queue_init(struct vb2_queue *q)
> >       if (WARN_ON(q->supports_requests && q->min_queued_buffers))
> >               return -EINVAL;
> >
> > +     /*
> > +      * The minimum requirement is 2: one buffer is used
> > +      * by the hardware while the other is being processed by userspac=
e.
> > +      */
> > +     if (q->min_reqbufs_allocation < 2)
> > +             q->min_reqbufs_allocation =3D 2;
> > +
> > +     /*
> > +      * If the driver needs 'min_queued_buffers' in the queue before
> > +      * calling start_streaming() then the minimum requirement is
> > +      * 'min_queued_buffers + 1' to keep at least one buffer available
> > +      * for userspace.
> > +      */
> > +     if (q->min_reqbufs_allocation < q->min_queued_buffers + 1)
> > +             q->min_reqbufs_allocation =3D q->min_queued_buffers + 1;
> > +
> > +     if (WARN_ON(q->min_reqbufs_allocation > q->max_num_buffers))
> > +             return -EINVAL;
> > +
> >       INIT_LIST_HEAD(&q->queued_list);
> >       INIT_LIST_HEAD(&q->done_list);
> >       spin_lock_init(&q->done_lock);
> > @@ -2717,7 +2736,6 @@ static int __vb2_init_fileio(struct vb2_queue *q,=
 int read)
> >       struct vb2_fileio_data *fileio;
> >       struct vb2_buffer *vb;
> >       int i, ret;
> > -     unsigned int count =3D 0;
> >
> >       /*
> >        * Sanity check
> > @@ -2738,18 +2756,8 @@ static int __vb2_init_fileio(struct vb2_queue *q=
, int read)
> >       if (q->streaming || vb2_get_num_buffers(q) > 0)
> >               return -EBUSY;
> >
> > -     /*
> > -      * Start with q->min_queued_buffers + 1, driver can increase it i=
n
> > -      * queue_setup()
> > -      *
> > -      * 'min_queued_buffers' buffers need to be queued up before you
> > -      * can start streaming, plus 1 for userspace (or in this case,
> > -      * kernelspace) processing.
> > -      */
> > -     count =3D max(2, q->min_queued_buffers + 1);
> > -
> >       dprintk(q, 3, "setting up file io: mode %s, count %d, read_once %=
d, write_immediately %d\n",
> > -             (read) ? "read" : "write", count, q->fileio_read_once,
> > +             (read) ? "read" : "write", q->min_reqbufs_allocation, q->=
fileio_read_once,
> >               q->fileio_write_immediately);
> >
> >       fileio =3D kzalloc(sizeof(*fileio), GFP_KERNEL);
> > @@ -2763,7 +2771,7 @@ static int __vb2_init_fileio(struct vb2_queue *q,=
 int read)
> >        * Request buffers and use MMAP type to force driver
> >        * to allocate buffers by itself.
> >        */
> > -     fileio->count =3D count;
> > +     fileio->count =3D q->min_reqbufs_allocation;
> >       fileio->memory =3D VB2_MEMORY_MMAP;
> >       fileio->type =3D q->type;
> >       q->fileio =3D fileio;
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-c=
ore.h
> > index 667bf9ee1101..4a8b9135cec8 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -549,9 +549,21 @@ struct vb2_buf_ops {
> >   *           @start_streaming can be called. Used when a DMA engine
> >   *           cannot be started unless at least this number of buffers
> >   *           have been queued into the driver.
> > - *           VIDIOC_REQBUFS will ensure at least @min_queued_buffers
> > + *           VIDIOC_REQBUFS will ensure at least @min_queued_buffers +=
 1
> >   *           buffers will be allocated. Note that VIDIOC_CREATE_BUFS w=
ill not
> >   *           modify the requested buffer count.
> > + * @min_reqbufs_allocation: the minimum number of buffers to be alloca=
ted when
> > + *           calling VIDIOC_REQBUFS. Note that VIDIOC_CREATE_BUFS will=
 *not*
> > + *           modify the requested buffer count and does not use this f=
ield.
> > + *           Drivers can set this if there has to be a certain number =
of
> > + *           buffers available for the hardware to work effectively.
> > + *           This allows calling VIDIOC_REQBUFS with a buffer count of=
 1 and
> > + *           it will be automatically adjusted to a workable buffer co=
unt.
> > + *           If set, then @min_reqbufs_allocation must be larger than
> > + *           @min_queued_buffers + 1.
> > + *           If this field is > 3, then it is highly recommended that =
the
> > + *           driver implements the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OU=
TPUT
> > + *           control.
> >   * @alloc_devs:      &struct device memory type/allocator-specific per=
-plane device
> >   */
> >  /*
> > @@ -622,6 +634,7 @@ struct vb2_queue {
> >       u32                             timestamp_flags;
> >       gfp_t                           gfp_flags;
> >       u32                             min_queued_buffers;
> > +     u32                             min_reqbufs_allocation;
> >
> >       struct device                   *alloc_devs[VB2_MAX_PLANES];
> >
>
> --
> Regards,
>
> Laurent Pinchart

