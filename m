Return-Path: <linux-media+bounces-20040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B38329A9FBE
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 12:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D318D1C214E7
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 10:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2307F19993C;
	Tue, 22 Oct 2024 10:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aNdMtngF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005A4145B24
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 10:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729592069; cv=none; b=YQsoRc0a0uDGynQDYx9oLAPVJKbznshqvI1ITpBOAFdS/DoR8PgSsnvaF+1inaTltw4kEz3qIV+Hi+3bdUkbxns1lkDUdoPWWXp69D1A1Q9R8pwHvDaTOl4p6X3FixXKala4sYQMa1hfdbtRteSkkIBuS2J1SMheoL9YTMaHC+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729592069; c=relaxed/simple;
	bh=o7uA9IaVk/S6URjFYAJOZq+6Cix3Ual1BCFspHaQZNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKfmDWeTlwT8UM1C/hyGWHSZYnwdeFslAjX9yWd6KxXy6qFNQc3CxoKH5XLhoEXt7GDQmqaMkcHJ3l2nCsoO8JWo2Hr9rotn0IrB+BpABJcOS8dGyyCt6WoK/APK820hPL4Ucf+Q/MBrgsceR3QoxA4hnstAN4+mepd7INaIy3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aNdMtngF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e31af47681so4276758a91.2
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 03:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729592065; x=1730196865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTHKhHuf43PCRWtznuW401IZ//gGlkJ88c8pnwcCtq8=;
        b=aNdMtngF0QZlzILScjJB6B5ACNpm7kquPQ/S2JfQS6EUXAxRJ0CONxPsk2EFcsc1+y
         F8pYweJ6ZftgzcEIWO6yT/Hfq4+kivjlFBJF4P8VGVVFpCD4Oo95p9YdMcarTCDNkURm
         W44aIPjMJ9U6y0q+FPsJuQ9f4LYNTLd2+8960=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729592065; x=1730196865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTHKhHuf43PCRWtznuW401IZ//gGlkJ88c8pnwcCtq8=;
        b=dCc1mFmrYZRqHYHiP6kSuf78yjW//wmWDqyHnyXeEjeyca/SCu3YWJ+R02g4CuRFeh
         +SPPwwfqWE5zCNAm+g7gieQuUBUNUZApsn+b/AUy5l/8vlMB3qHtIBTfvaXd+Ng7E3HK
         FfcCFWHUP94alMBnABE81aUqfvmBrY6cXlruW4iPv8OYHPPY8Chz4HVLz0FhmIO9hDEt
         cf+/1yQuD+2L2PnteEUvd2zxsmVQOhdPpeaDjuL0EnNaP0nU3DAxmY38YTIrg/KgAzvH
         TJmt7qxpAq3cj2c62C20RKY2U7lkPFuQnQJmWIVAfs+BZWhAJM3UxClg1NRqn3CstCG7
         eb/w==
X-Forwarded-Encrypted: i=1; AJvYcCVTtypZ//TTB7oyi08GsScqpUXxnJkoD1NzSVSxHN99+ASJ6QHtdJL4vVaJYfi7EptHx3LKdVnOF5ETSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+hAUPC0NHYM+Aetxcd/tYKLA5ztV+uh+M6VZuZ90SWOB/6Lyl
	1U/B3mwWalK5/RKZC8B69ZDLVa/CD/fwx73yzyAiL9tQy56WGDBw7LzuM6fft4LtqDTsUPBOW9w
	=
X-Google-Smtp-Source: AGHT+IFqwYmA5QYGcLGS2MPupstOaLYmeY4g8ujJynvOazw3XcuKNPDTauMBn6vA131jhA2zXCU2hg==
X-Received: by 2002:a17:90a:e7c2:b0:2e2:e4d3:3401 with SMTP id 98e67ed59e1d1-2e5ddba39d1mr2439816a91.20.1729592064966;
        Tue, 22 Oct 2024 03:14:24 -0700 (PDT)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com. [209.85.214.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed392sm5692300a91.41.2024.10.22.03.14.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 03:14:24 -0700 (PDT)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20ca03687fdso173435ad.0
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 03:14:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWj3NgukWKTSHWf1DO7K0hHum8ycyuuV6UpkiCuSn9ZemciAz2EbA7bp7pX+V1AfWbIj/J30vVGs4GK9w==@vger.kernel.org
X-Received: by 2002:a17:902:e541:b0:20b:bf5a:c8 with SMTP id
 d9443c01a7336-20e97fbde77mr2541025ad.10.1729592063561; Tue, 22 Oct 2024
 03:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625112425.37172-1-fusibrandon13@gmail.com> <fb3c5f48-8a82-445c-b015-dde4f4f58def@xs4all.nl>
In-Reply-To: <fb3c5f48-8a82-445c-b015-dde4f4f58def@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 22 Oct 2024 19:14:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AmgbkWy5sUDM7Po-KjU+3YnnAD512rtymDsULiVH8JKw@mail.gmail.com>
Message-ID: <CAAFQd5AmgbkWy5sUDM7Po-KjU+3YnnAD512rtymDsULiVH8JKw@mail.gmail.com>
Subject: Re: [PATCH v3 v4l-utils] common: Use posix_memalign for allocating
 userptr buffers
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>, linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 7:51=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> Hi Brandon,
>
> On 25/06/2024 13:24, Brandon Cheo Fusi wrote:
> > When dealing with a userptr pointing to a buffer in userspace,
> > videobuf2 swaps the corresponding physical pages with other pages
> > so we have a contiguous area of memory for DMA. This only works if
> > the userptr is page aligned.
> >
> > The current way of allocating user buffers using malloc only
> > guarantees alignment up to `alignof(max_align_t)`, which is usually
> > 16. So replace malloc with posix_memalign to ensure the returned
> > pointer is on a page boundary.
>
> With which driver is this tested? USERPTR is really supposed to work
> with malloc()ed memory.

In theory yes, but the entire idea of USERPTR is shaky enough that
some hardware may not work if the pointer is not aligned enough.
Another aspect is security - IOMMUs can only work on page granularity,
so if the first page of the buffer is preceded (or last page followed)
by some other data, that data would be leaked to the hardware.

That said, that doesn't seem to be what the commit description refers
to and actually it's kind of wrong - videobuf2 doesn't do anything to
make the userptr memory contiguous. It's all down to the DMA mapping
ops of the device, and if it's behind an IOMMU, it should just work
regardless of the alignment, minus the user data leak caveat I
mentioned.

Besides that, any idea why this function actually even uses userptr?
(I assume this is libv4l?)

>
> There have been drivers in the past that used contiguous DMA but still
> allowed USERPTR, but that was a hack and these days you would use DMABUF.
>
> Regards,
>
>         Hans
>
> >
> > Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > ---
> >  utils/common/v4l-helpers.h | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
> > index cf0e92d..aa9ee26 100644
> > --- a/utils/common/v4l-helpers.h
> > +++ b/utils/common/v4l-helpers.h
> > @@ -1661,10 +1661,11 @@ static inline int v4l_queue_alloc_bufs(struct v=
4l_fd *f,
> >               return 0;
> >       for (b =3D from; b < v4l_queue_g_buffers(q); b++) {
> >               for (p =3D 0; p < v4l_queue_g_num_planes(q); p++) {
> > -                     void *m =3D malloc(v4l_queue_g_length(q, p));
> > -
> > -                     if (m =3D=3D NULL)
> > -                             return errno;
> > +                     void *m;
> > +                     int ret =3D posix_memalign(&m, getpagesize(),
> > +                                             v4l_queue_g_length(q, p))=
;
> > +                     if (ret)
> > +                             return ret;
> >                       v4l_queue_s_userptr(q, b, p, m);
> >               }
> >       }
>

