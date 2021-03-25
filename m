Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B642348DDD
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 11:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhCYKUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 06:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbhCYKUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 06:20:17 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0EF2C06175F
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 03:20:14 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id g20so839451wmk.3
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 03:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=6HdnO52Awha3IyzRgXLtenextHIzKUQswyTRoTsHAfY=;
        b=vA7pgeA5oaUtMpr5uOwzAJhGKI8jYSF7M48seY75d9EA2CptifVwvMqCWCGZvKtWtO
         7YlGyk3EerlP/pNPPaK5SLRasVonS5jchx3MenbdmuRs7rCV1eHYlrYxCJDYEC0tng3f
         CnI9pZof5k70NSGNNhlpmXliV1JaaZOzNlShpkDyC5rrgUguuLUhI/6ZpMe6SIqht2yE
         l/DPYXfI0kM/6OJuFIkFGafU79lIgmZVWE5aLypa8Jy2skFhdJe2DbsbSoRueQGv88/c
         NRKuJAc4NC3CCs+mNiNBq7J+l0fofdMjRsBBRNdGxTEUP1T+4H48sWVZVIoqvqJbSW3j
         V2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=6HdnO52Awha3IyzRgXLtenextHIzKUQswyTRoTsHAfY=;
        b=OTb6S41VGm0zVyRjmsaF+Udz1k5IJP4/bgGEtT3WZ9pmCzWAOXNnBmZER+psOOREtJ
         E/6ijJnB+lJr7z8uQ9SaAoSNn60zym0tXavtj+gLIG9rGkK7Zl5xS5Xu27ksCUH+8tae
         tTuQWYeRVqV3+XFyEkqbUBlN4NUgAtyJP5/tniFx7v+PX5Xu7NtIhDAKafWMbb07lKHX
         x5Bp+cxSxK7CHmd6s+QtlOY3q4H85ysmwMi/3lSfZ6tfKzy7x3DTxHgkLyHAtvPFAuIb
         /We5oQIaweekx5Iy4QJrboQfcTdnRl3J4ymCUJcyFEIFUWxVVkQ+lxMs8jVMHmRtri65
         D1lQ==
X-Gm-Message-State: AOAM533EKb+OlwOPc4wXjMMk6vH7OWaEoNG5oRxpSXcu8sVTnus9MBlJ
        fAmOZ+yyWviigTJG0fAMZX9Gj9cM8GoHYg==
X-Google-Smtp-Source: ABdhPJwgUpTWyyX1ExJG+CsleZ0S1w/S1bfvTk1hOaBxRdpBJOkuq8riQ3zlAFAPbPMmKCKDCJqDSw==
X-Received: by 2002:a05:600c:2106:: with SMTP id u6mr7277079wml.55.1616667613220;
        Thu, 25 Mar 2021 03:20:13 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id m10sm5839232wmh.13.2021.03.25.03.20.12
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 25 Mar 2021 03:20:12 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.org,
        tfiga@chromium.org, Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH 1/2] media: videobuf2: use dmabuf size for length
Date:   Thu, 25 Mar 2021 10:20:11 +0000
Message-ID: <afno5g9a14fmf7tj1uq0e9pciflop2rv3k@4ax.com>
References: <20210325001712.197837-1-helen.koike@collabora.com>
In-Reply-To: <20210325001712.197837-1-helen.koike@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

>Always use dmabuf size when considering the length of the buffer.
>Discard userspace provided length.
>Fix length check error in _verify_length(), which was handling single =
and
>multiplanar diferently, and also not catching the case where userspace
>provides a bigger length and bytesused then the underlying buffer.
>
>Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
>Signed-off-by: Helen Koike <helen.koike@collabora.com>
>---
>
>Hello,
>
>As discussed on
>https://patchwork.linuxtv.org/project/linux-media/patch/gh5kef5bkeel3o6b=
2dkgc2dfagu9klj4c0@4ax.com/
>
>This patch also helps the conversion layer of the Ext API patchset,
>where we are not exposing the length field.
>
>It was discussed that userspace might use a smaller length field to
>limit the usage of the underlying buffer, but I'm not sure if this is
>really usefull and just complicates things.
>
>If this is usefull, then we should also expose a length field in the Ext
>API, and document this feature properly.
>
>What do you think?
>---
> .../media/common/videobuf2/videobuf2-core.c   | 21 ++++++++++++++++---
> .../media/common/videobuf2/videobuf2-v4l2.c   |  8 +++----
> include/uapi/linux/videodev2.h                |  7 +++++--
> 3 files changed, 27 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/media/common/videobuf2/videobuf2-core.c =
b/drivers/media/common/videobuf2/videobuf2-core.c
>index 02281d13505f..2cbde14af051 100644
>--- a/drivers/media/common/videobuf2/videobuf2-core.c
>+++ b/drivers/media/common/videobuf2/videobuf2-core.c
>@@ -1205,6 +1205,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>=20
> 	for (plane =3D 0; plane < vb->num_planes; ++plane) {
> 		struct dma_buf *dbuf =3D dma_buf_get(planes[plane].m.fd);
>+		unsigned int bytesused;
>=20
> 		if (IS_ERR_OR_NULL(dbuf)) {
> 			dprintk(q, 1, "invalid dmabuf fd for plane %d\n",
>@@ -1213,9 +1214,23 @@ static int __prepare_dmabuf(struct vb2_buffer =
*vb)
> 			goto err;
> 		}
>=20
>-		/* use DMABUF size if length is not provided */
>-		if (planes[plane].length =3D=3D 0)
>-			planes[plane].length =3D dbuf->size;
>+		planes[plane].length =3D dbuf->size;
>+		bytesused =3D planes[plane].bytesused ?
>+			    planes[plane].bytesused : dbuf->size;
>+
>+		if (planes[plane].bytesused > planes[plane].length) {
>+			dprintk(q, 1, "bytesused is bigger then dmabuf length for plane =
%d\n",
>+				plane);
>+			ret =3D -EINVAL;
>+			goto err;
>+		}
>+
>+		if (planes[plane].data_offset >=3D bytesused) {
>+			dprintk(q, 1, "data_offset >=3D bytesused for plane %d\n",
>+				plane);
>+			ret =3D -EINVAL;
>+			goto err;
>+		}
>=20
> 		if (planes[plane].length < vb->planes[plane].min_length) {
> 			dprintk(q, 1, "invalid dmabuf length %u for plane %d, minimum length=
 %u\n",
>diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c =
b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>index 7e96f67c60ba..ffc7ed46f74a 100644
>--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>@@ -98,14 +98,14 @@ static int __verify_length(struct vb2_buffer *vb, =
const struct v4l2_buffer *b)
> 	unsigned int bytesused;
> 	unsigned int plane;
>=20
>-	if (V4L2_TYPE_IS_CAPTURE(b->type))
>+	/* length check for dmabuf is performed in _prepare_dmabuf() */
>+	if (V4L2_TYPE_IS_CAPTURE(b->type) || b->memory =3D=3D =
VB2_MEMORY_DMABUF)
> 		return 0;
>=20
> 	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
> 		for (plane =3D 0; plane < vb->num_planes; ++plane) {
>-			length =3D (b->memory =3D=3D VB2_MEMORY_USERPTR ||
>-				  b->memory =3D=3D VB2_MEMORY_DMABUF)
>-			       ? b->m.planes[plane].length
>+			length =3D b->memory =3D=3D VB2_MEMORY_USERPTR
>+				? b->m.planes[plane].length
> 				: vb->planes[plane].length;
> 			bytesused =3D b->m.planes[plane].bytesused
> 				  ? b->m.planes[plane].bytesused : length;
>diff --git a/include/uapi/linux/videodev2.h =
b/include/uapi/linux/videodev2.h
>index 8d15f6ccc4b4..79b3b2893513 100644
>--- a/include/uapi/linux/videodev2.h
>+++ b/include/uapi/linux/videodev2.h
>@@ -968,7 +968,9 @@ struct v4l2_requestbuffers {
> /**
>  * struct v4l2_plane - plane info for multi-planar buffers
>  * @bytesused:		number of bytes occupied by data in the plane (payload)
>- * @length:		size of this plane (NOT the payload) in bytes
>+ * @length:		size of this plane (NOT the payload) in bytes. Filled
>+ *			by userspace for USERPTR and by the driver for DMABUF
>+ *			and MMAP.
>  * @mem_offset:		when memory in the associated struct v4l2_buffer is
>  *			V4L2_MEMORY_MMAP, equals the offset from the start of
>  *			the device memory for this plane (or is a "cookie" that
>@@ -1025,7 +1027,8 @@ struct v4l2_plane {
>  * @m:		union of @offset, @userptr, @planes and @fd
>  * @length:	size in bytes of the buffer (NOT its payload) for =
single-plane
>  *		buffers (when type !=3D *_MPLANE); number of elements in the
>- *		planes array for multi-plane buffers
>+ *		planes array for multi-plane buffers. Filled by userspace for
>+ *		USERPTR and by the driver for DMABUF and MMAP.
>  * @reserved2:	drivers and applications must zero this field
>  * @request_fd: fd of the request that this buffer should use
>  * @reserved:	for backwards compatibility with applications that do not=
 know

I think this does what I want. But I'm going to restate my usage desires
and check that you agree that it covers them.

I'm interested in passing compressed bitstreams to a decoder.  The size
of these buffers can be very variable and the worst case will nearly
always be much larger than the typical case and that size cannot be
known in advance of usage.  It can be very wasteful to have to allocate
buffers that are over an order of magnitude bigger than are likely to
ever be used.  If you have a fixed pool of fixed size buffers allocated
at the start of time this wastefulness is unavoidable, but dmabufs can
be dynamically sized to be as big as required and so there should be no
limitation on passing in buffers that are smaller than the maximum.  It
also seems plausible that dmabufs that are larger than the maximum
should be allowed as long as their bytesused is smaller or equal.

As an aside, even when using dynamically sized dmabufs they are often
way larger than the data they contain and forcing cache flushes or maps
of their entire length rather than just the used portion is also
wasteful.  This might be a use for the incoming size field.

Regards

John Cox
