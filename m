Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCCBD7858C0
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 15:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235478AbjHWNQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 09:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234149AbjHWNQO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 09:16:14 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FB5E7C
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 06:15:47 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-79df12ff0f0so1915017241.3
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 06:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692796530; x=1693401330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G4PBhoXP1LYQ2AlkCcJ3ZNZ43XaQmRKac+McL4CLhE=;
        b=USkM1wPnbKAO9A1ucEyk5mzrVyjGOHAlWrDkX0ej6NRS7PXcnImyFy/ipTLZcBeEof
         AzJNhc0fciwjeA/z6TiZe6ecKZQy4PGEEXAe2JWSSQ+0pZmZkizYS+GKwbfDLg6/ggCd
         NuwXkw+aDJxq4kFi8yqGWIwKjLSL3Y52/MREo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692796530; x=1693401330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/G4PBhoXP1LYQ2AlkCcJ3ZNZ43XaQmRKac+McL4CLhE=;
        b=aPsdab4HzODp3/GlresJWz7DwfwR7IawDOrgqrnv75muPAJH/WDBxJj0+Q0jgZpMtQ
         nJDdFS6T+zTew70pmYHFH/ROwp3JUV1HeHk/fjdBHlpzblhC79LQZGrbcrh87m8vLUBw
         2Yg4i9XpYgC8P16R7wrLZJRzAORWDKYcyCgRjCDd9xxsOw98MpyY1msl/WAuc+aF6ws/
         OZX0aT0ant6kb4s4lmlBSRetVxTVOMEa3kR+4TgZNc33arxx9ct8svDsRspQ2G9F0qIE
         gToHB/8+CL2FmwDFMA/+DfEwmN6YqueHPzXvFhFXwpCLZlL6eT3gOLTAfVRvZix0GzZL
         FHfQ==
X-Gm-Message-State: AOJu0YzWg4DmBfuEMR+Eihjkiz8a75Nf0uimxpsIpKbY2SckZ9nsP39D
        1dHAFzI2HDPThkGTvuBA6ortk3fMbYzDWR/i305LVA==
X-Google-Smtp-Source: AGHT+IHN/YaA7l4VKt/or7nHCjLSnC0Kq1g022S/QCaaik/PWV8njARQrdznReCZTcl1gX046ukGSw==
X-Received: by 2002:a67:f2d5:0:b0:44d:4160:4f81 with SMTP id a21-20020a67f2d5000000b0044d41604f81mr11056502vsn.1.1692796530274;
        Wed, 23 Aug 2023 06:15:30 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id s8-20020ab04a88000000b007a01f889620sm2028454uae.21.2023.08.23.06.15.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 06:15:29 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-76d846a4b85so1921374241.1
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 06:15:29 -0700 (PDT)
X-Received: by 2002:a67:f988:0:b0:44d:63a3:4be4 with SMTP id
 b8-20020a67f988000000b0044d63a34be4mr4337218vsq.29.1692796528899; Wed, 23 Aug
 2023 06:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
 <CAAFQd5CqAvr7ZUdDSYPEOWSgvbttTBjHa0YWDomxJJSaiZxGog@mail.gmail.com> <f8a168e8-1a23-c6b3-0f68-baa73396d594@synaptics.com>
In-Reply-To: <f8a168e8-1a23-c6b3-0f68-baa73396d594@synaptics.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 23 Aug 2023 22:15:11 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A3YKjt03zLQBRvw1QNNqbCyhVzHNo+2mG6uhXJvGv-Wg@mail.gmail.com>
Message-ID: <CAAFQd5A3YKjt03zLQBRvw1QNNqbCyhVzHNo+2mG6uhXJvGv-Wg@mail.gmail.com>
Subject: Re: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
To:     Hsia-Jun Li <Randy.Li@synaptics.com>
Cc:     linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        hughd@google.com, akpm@linux-foundation.org,
        Simon Ser <contact@emersion.fr>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, daniels@collabora.com,
        ayaka <ayaka@soulik.info>, linux-kernel@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 23, 2023 at 4:11=E2=80=AFPM Hsia-Jun Li <Randy.Li@synaptics.com=
> wrote:
>
>
>
> On 8/23/23 12:46, Tomasz Figa wrote:
> > CAUTION: Email originated externally, do not click links or open attach=
ments unless you recognize the sender and know the content is safe.
> >
> >
> > Hi Hsia-Jun,
> >
> > On Tue, Aug 22, 2023 at 8:14=E2=80=AFPM Hsia-Jun Li <Randy.Li@synaptics=
.com> wrote:
> >>
> >> Hello
> >>
> >> I would like to introduce a usage of SHMEM slimier to DMA-buf, the maj=
or
> >> purpose of that is sharing metadata or just a pure container for cross
> >> drivers.
> >>
> >> We need to exchange some sort of metadata between drivers, likes dynam=
ic
> >> HDR data between video4linux2 and DRM.
> >
> > If the metadata isn't too big, would it be enough to just have the
> > kernel copy_from_user() to a kernel buffer in the ioctl code?
> >
> >> Or the graphics frame buffer is
> >> too complex to be described with plain plane's DMA-buf fd.
> >> An issue between DRM and V4L2 is that DRM could only support 4 planes
> >> while it is 8 for V4L2. It would be pretty hard for DRM to expend its
> >> interface to support that 4 more planes which would lead to revision o=
f
> >> many standard likes Vulkan, EGL.
> >
> > Could you explain how a shmem buffer could be used to support frame
> > buffers with more than 4 planes?
> > If you are asking why we need this:

I'm asking how your proposal to use shmem FD solves the problem for those c=
ases.

> 1. metadata likes dynamic HDR tone data
> 2. DRM also challenges with this problem, let me quote what sima said:
> "another trick that we iirc used for afbc is that sometimes the planes
> have a fixed layout
> like nv12
> and so logically it's multiple planes, but you only need one plane slot
> to describe the buffer
> since I think afbc had the "we need more than 4 planes" issue too"
>
> Unfortunately, there are vendor pixel formats are not fixed layout.
>
> 3. Secure(REE, trusted video piepline) info.
>
> For how to assign such metadata data.
> In case with a drm fb_id, it is simple, we just add a drm plane property
> for it. The V4L2 interface is not flexible, we could only leave into
> CAPTURE request_fd as a control.
> >>
> >> Also, there is no reason to consume a device's memory for the content
> >> that device can't read it, or wasting an entry of IOMMU for such data.
> >
> > That's right, but DMA-buf doesn't really imply any of those. DMA-buf
> > is just a kernel object with some backing memory. It's up to the
> > allocator to decide how the backing memory is allocated and up to the
> > importer on whether it would be mapped into an IOMMU.
> >
> I just want to say it can't be allocated at the same place which was for
> those DMA bufs(graphics or compressed bitstream).
> This also could be answer for your first question, if we place this kind
> of buffer in a plane for DMABUF(importing) in V4L2, V4L2 core would try
> to prepare it, which could map it into IOMMU.
>

V4L2 core will prepare it according to the struct device that is given
to it. For the planes that don't have to go to the hardware a struct
device could be given that doesn't require any DMA mapping. Also you
can check how the uvcvideo driver handles it. It doesn't use the vb2
buffers directly, but always writes to them using CPU (due to how the
UVC protocol is designed).

> >> Usually, such a metadata would be the value should be written to a
> >> hardware's registers, a 4KiB page would be 1024 items of 32 bits regis=
ters.
> >>
> >> Still, I have some problems with SHMEM:
> >> 1. I don't want the userspace modify the context of the SHMEM allocate=
d
> >> by the kernel, is there a way to do so?
> >
> > This is generally impossible without doing any of the two:
> > 1) copying the contents to an internal buffer not accessible to the
> > userspace, OR
> > 2) modifying any of the buffer mappings to read-only
> >
> > 2) can actually be more costly than 1) (depending on the architecture,
> > data size, etc.), so we shouldn't just discard the option of a simple
> > copy_from_user() in the ioctl.
> >
> I don't want the userspace access it at all. So that won't be a problem.

In this case, wouldn't it be enough to have a DMA-buf exporter that
doesn't provide the mmap op?

> >> 2. Should I create a helper function for installing the SHMEM file as =
a fd?
> >
> > We already have the udmabuf device [1] to turn a memfd into a DMA-buf,
> > so maybe that would be enough?
> >
> > [1] https://elixir.bootlin.com/linux/v6.5-rc7/source/drivers/dma-buf/ud=
mabuf.c
> >
> It is the kernel driver that allocate this buffer. For example, v4l2
> CAPTURE allocate a buffer for metadata when VIDIOC_REQBUFS.
> Or GBM give you a fd which is assigned with a surface.
>
> So we need a kernel interface.

Sorry, I'm confused. If we're talking about buffers allocated by the
specific allocators like V4L2 or GBM, why do we need SHMEM at all?

Best,
Tomasz

> > Best,
> > Tomasz
> >
> >>
> >> --
> >> Hsia-Jun(Randy) Li
>
> --
> Hsia-Jun(Randy) Li
