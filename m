Return-Path: <linux-media+bounces-27931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E22A58EC6
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 10:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27F86188D4EA
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 09:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93C522488E;
	Mon, 10 Mar 2025 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="efhtGd5F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0568C1B6CF1
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741597227; cv=none; b=crY6pnr2Q9N5eXf3fIu6ta52PjYKvHK+UaHmIkdUpHiRsPw2HJwqirwEU5V8b98WVDNVZVWVvzyHQZngVjmMkYif/1oMTbmlgq1ogo4rAxp8Mhz79xs9QsI+oOUqrgRIoh9cy1YbiZfv8H6lhKHKIjgWt04fwisOPvQB8Jze5kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741597227; c=relaxed/simple;
	bh=NHp7ZMafCgZi0KuBw/MuMMHbK0+r7tHwyaEpZyxsNAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D63VKMx39AiSRk+zNj/MBqAVsb+bPPT/5s899CpsjpnBgl6eIgHAyrlcX6YNgPpZuuCrJGFe8CGddr53y1Qapc9C66i1vKPv1P7yfQe3zRS7GdFuZ/Y6Uudi/HOL1fMlhutcgj3J2ddk6D+UZq5KB+/CjCwyAdb6Wq5XQ4u8RqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=efhtGd5F; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so4429009a12.3
        for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 02:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741597223; x=1742202023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5Yuxxu0WAoN1GxBYvN/CmEDsSXx0gVMofLIggB5ihw=;
        b=efhtGd5Fjoqdq/jU+weqi/P3I4/pOEQMLoaSoCLTXRzvExkb/GHWXhvbMsKeMxzfMh
         Y6qZ+t9uDkAd+918Y5pf3DyNC+FOxfk4pvcVVd70Ej3ZjxCE2RdNoruMdG+zFwBfQNQ0
         3B4PFCWS3McVMCrzn4ATP10geO5/5/Mc/cMts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741597223; x=1742202023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5Yuxxu0WAoN1GxBYvN/CmEDsSXx0gVMofLIggB5ihw=;
        b=PbgeCKuZ5+DZ8/GBKpYH78kVbmjEfEnKqL5LG/A2nF1nQNVZ6sHjSRfapmgZ6XHzbp
         QQWYMAOF9WrnIqenB78BtXA0tw3+JaeCU70qjtF9JeHAwfAikxuP82lg5WI/qZR8TgzO
         a8taCgIpgfuDZfIFgrdGDuV8R6IB5nKRhKV6S1/FGNiuvBccHhWjcr+MZtpE4Yz13K01
         s1I+0kVOwqaGUl/krq/QwarSt6O/xlnJuXaAyI/LWnMFhCHkkkxzRzreG5q7W59Un+EM
         2MeaGFYl+MwwRtPGiNxyCE8LKlfneVUmia3oieI/Miyu0WBvBsh2RreLd104h4PTDyG2
         c83w==
X-Forwarded-Encrypted: i=1; AJvYcCWjDkgjncGpm4opVkMnLZoSzS69F02yBQfpjcg3ks2fwT1RuzGu2o0OY3ZlVGozZ82tmPfXLo+2byuPkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/c59cj21vY2BSicnz+HYcSlKikHwkb6WdYc/pHMdknI8+K+zr
	gNe+h/TX++kV2OER4n7I15GdRfIFRQcqB6DlaYLxBjP1Mwr13h6XNSaK85YlcPt3f6r1Q+VwUF0
	=
X-Gm-Gg: ASbGncsMykwoExBFLlXong6M8TjxBU4cYsga7BBy/3ROrNNmI33gu3zEacRsWCJ1VfZ
	nJkqHm1dCQWdK2HwvBoPBOQEdG6py6if58vbjYVy4mJTtUCqa9HL2rK2+NLOjSDBAiTH7mj77Q/
	0tufMXPP+Z9NGBRiIzeyJx/tt1IAkwZRivHDfsSEbDUuDxqQB4vRfoe2nxUvTPHRmOgiDnB5/09
	KAyuYkIUW+Gu8L3WuRQ18mDm0Qf5us7hEfQ2q+yOavxF70XcLrwXdv9mk4SBBbXg32ZFKWlYDdN
	3NzbRduWlOi7FqVxTpr1C1bEkI1GaTb/tDizLUv6L+E5doCzskSRdZw+xAqN/Sjs1qFoWqDPqgF
	jF8gd
X-Google-Smtp-Source: AGHT+IHNtvhzrN3R6SqwBxUy+7S3r0selnLiOypsV9YtXjIx9YNQbEuX2SLqzbHmpEXByMBjCwLHwQ==
X-Received: by 2002:a17:907:3f2a:b0:abf:5660:5d87 with SMTP id a640c23a62f3a-ac2525e07c4mr1534631466b.4.1741597222921;
        Mon, 10 Mar 2025 02:00:22 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac29363d604sm224597066b.76.2025.03.10.02.00.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 02:00:21 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e50bae0f5bso9248a12.0
        for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 02:00:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbdRR3Y5UbcdMnmgAHz/TuuLyBAWDgYmwiQ4DnyBvyaAcNbHaF1OSesERKqu5qKo/G52jgVcY8XbAgfQ==@vger.kernel.org
X-Received: by 2002:a05:6402:95a:b0:5e6:887f:6520 with SMTP id
 4fb4d7f45d1cf-5e6887f672fmr62677a12.5.1741597220471; Mon, 10 Mar 2025
 02:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
 <20250303-b4-rkisp-noncoherent-v4-1-e32e843fb6ef@gmail.com>
 <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca> <87wmcxs1xw.fsf@gmail.com>
In-Reply-To: <87wmcxs1xw.fsf@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 10 Mar 2025 18:00:03 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A70T2iaN17X2Jfk_6fCKRYZdKpreb+9i76n5WMYNEt1A@mail.gmail.com>
X-Gm-Features: AQ5f1JowVCHSCv6zRQDIlGrshBtBzEUT-W75FlZzOuUhz9aDBR_F5KxVvuObz24
Message-ID: <CAAFQd5A70T2iaN17X2Jfk_6fCKRYZdKpreb+9i76n5WMYNEt1A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 5:52=E2=80=AFPM Mikhail Rudenko <mike.rudenko@gmail=
.com> wrote:
>
>
> Hi Nicolas, Tomasz,
>
> On 2025-03-03 at 10:24 -05, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> > Hi Mikhail,
> >
> > Le lundi 03 mars 2025 =C3=A0 14:40 +0300, Mikhail Rudenko a =C3=A9crit =
:
> >> When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
> >> commit 129134e5415d ("media: media/v4l2: remove
> >> V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
> >> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
> >> no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
> >> introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
> >> V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
> >> no-ops, making cache maintenance for non-coherent dmabufs allocated
> >> by
> >> dma-contig impossible.
> >>
> >> Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
> >> {flush,invalidate}_kernel_vmap_range calls to
> >> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
> >> buffers.
> >>
> >> Fixes: c0acf9cfeee0 ("media: videobuf2: handle
> >> V4L2_MEMORY_FLAG_NON_COHERENT flag")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> >> ---
> >>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22
> >> ++++++++++++++++++++++
> >>  1 file changed, 22 insertions(+)
> >>
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> >> b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> >> index
> >> a13ec569c82f6da2d977222b94af32e74c6c6c82..d41095fe5bd21faf815d6b035d7
> >> bc888a84a95d5 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> >> @@ -427,6 +427,17 @@ static int
> >>  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> >>                                 enum dma_data_direction
> >> direction)
> >>  {
> >> +    struct vb2_dc_buf *buf =3D dbuf->priv;
> >> +    struct sg_table *sgt =3D buf->dma_sgt;
> >> +
> >> +    if (!buf->non_coherent_mem)
> >> +            return 0;
> >> +
> >> +    if (buf->vaddr)
> >> +            invalidate_kernel_vmap_range(buf->vaddr, buf->size);
> >
> > What would make me a lot more confortable with this change is if you
> > enable kernel mappings for one test. This will ensure you cover the
> > call to "invalidate" in your testing. I'd like to know about the
> > performance impact. With this implementation it should be identical to
> > the VB2 one.
> >
>
> I have re-run my tests on RK3399, with 1280x720 XRGB capture buffers (1
> plane, 3686400 bytes). Capture process was pinned to "big" cores running
> at fixed frequency of 1.8 GHz. Libcamera was modified to request buffers
> with V4L2_MEMORY_FLAG_NON_COHERENT flag. DMA_BUF_IOCTL_SYNC ioctls were
> used as appropriate. For kernel mapping effect test, vb2_plane_vaddr
> call was inserted into rkisp1_vb2_buf_init.
>
> The timings are as following:
>
> - memcpy coherent buffer: 7570 +/- 63 us
> - memcpy non-coherent buffer: 1120 +/- 34 us
>
> without kernel mapping:
>
> - ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_START|DMA_BUF_SYNC_READ}): =
428 +/- 15 us
> - ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_END|DMA_BUF_SYNC_READ}): 42=
2 +/- 28 us
>
> with kernel mapping:
>
> - ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_START|DMA_BUF_SYNC_READ}): =
526 +/- 13 us
> - ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_END|DMA_BUF_SYNC_READ}): 51=
9 +/- 38 us
>
> So, even with kernel mapping enabled, speedup is 7570 / (1120 + 526 + 519=
) =3D 3.5,
> and the use of noncoherent buffers is justified -- at least on this platf=
orm.

Thanks a lot for the additional testing.

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

