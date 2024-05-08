Return-Path: <linux-media+bounces-11160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E58438C01A4
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 18:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2132B1C2488E
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 16:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD1312880F;
	Wed,  8 May 2024 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nLY3lT4k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B40B12839E
	for <linux-media@vger.kernel.org>; Wed,  8 May 2024 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715184192; cv=none; b=o1168ZOq+gqcJp4cq7jgFH6CcpJ/S3fedQD9heEpwhurYasAn1DIw6t3MkWsnGk5gfeaTkx2of2hdkv2rz5c9mef988loP9AG4zPLDD7uxBouanwHckLleIEnxXLeqUhp6nlQnLb4DGtO7FaiLasFIGDvXOaXhysGXQUYYy3/RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715184192; c=relaxed/simple;
	bh=5jfCntwr39NXK+SXBK7sVpZ4INCa6H5fluHPHCGhbLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JYxOQaYLdC/mqDvAaerqBz4ezShK5T18e78gf++CzV9RUqt3iyS7ZO9TPZRDrGF51k4h9qjgehB4drLP033dixvjjOyP0GJuotUUvLpyW7neZyBdmbSkhO0N3teUqn4WGTCaobyWqr1rUb05B9C/baTgs/TFy/bwd74e19imcHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nLY3lT4k; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-792706dbdc6so63664985a.0
        for <linux-media@vger.kernel.org>; Wed, 08 May 2024 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715184187; x=1715788987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TLMeXXTKnai8hJf2QP1o9FBbAiEzYToHiLTaviw8Zk=;
        b=nLY3lT4kh3FkikG+ZHFVAZu1c5NEt9v7UZNFFXlwF3QSbXSbZo9FbKjhuOEIcuMf2Q
         628oWGanmHf/5g8xYHPPXXvDYugggO+0ghk81csD2VB3y4qQ1NlbKeoWku9FVkoM0qEf
         Afi485XY50kSCxuACzHiOnPdakSqZLEF8C1mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715184187; x=1715788987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TLMeXXTKnai8hJf2QP1o9FBbAiEzYToHiLTaviw8Zk=;
        b=sW0SHfhjm6CmNlGID2V160t9SeYxbm6tjCOOhnqq0DsK+n+DaTqQjFvFmbPQ1Bc+QS
         anZFXyWcIPWsd07MpCj8mSDqViH0Bh0wvRxDtt/VEWhB8Ax7PBPQrXtdsSCaxHmmKip+
         rs4s1v5NzmtR+sVrESbHiFIXE7A8Dq5xxY8eXsxHqIwSv8VKiyRaRl1ieRt6U73qs6bb
         vswE74XA70VwW31wLpIj1gImpLIzDfJaxBbNDFrRUQBWe7p7D5qwjf/PEyFolYdow26k
         QCsJ+7iJV/18WBjI40iujy5aLu5sR0iCED1/8cyvHzxAOkIz/tkdedxEVJ666OGJiC/K
         sgtw==
X-Forwarded-Encrypted: i=1; AJvYcCUowl898gTApOy+ZHpudYas5ZrhfjbS84bvvgULWzwmblj2xu0QNDoQ/mo1yfFHKXkE/kpXlEH2jduBu4w5Rn3f0PpQn0mc0mHffhc=
X-Gm-Message-State: AOJu0Yw3nNucz5XGj/mMW7ByOaCMl0Mnz8WMZV/D5ptRn7AZx1B9Ilhl
	fKng4vnepn4r1AuPep0WDSTNJiwY5ArCJc55Qa+lCpltv/egMcvgHpXjEJjtecTwwsnLiNrBdqt
	Png==
X-Google-Smtp-Source: AGHT+IH1w19nn3N7hiq/6PWMErVkB5bnYMH1HFzST3Kzq4jdPCDFf3FY2n88ULa6O5I1MYcYD626ag==
X-Received: by 2002:a0c:dc94:0:b0:6a0:f483:214 with SMTP id 6a1803df08f44-6a15cbf3b44mr1535056d6.16.1715184187175;
        Wed, 08 May 2024 09:03:07 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id m9-20020ad45049000000b006a0f175adb0sm5626122qvq.24.2024.05.08.09.03.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 09:03:06 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6a0c8fb3540so7846286d6.1
        for <linux-media@vger.kernel.org>; Wed, 08 May 2024 09:03:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWo5W2wd5JkAhnnUFp9Gw3cgpwZL5wdGKg/km930FkIB+YJGpSdYUGRxs9PmC2HsVly42lsBG5lAcxmSR5fA1+bTgT+d+ap3FeVUqU=
X-Received: by 2002:a05:6214:334:b0:6a0:b93f:e678 with SMTP id
 6a1803df08f44-6a15cbc452fmr1618526d6.10.1715184186240; Wed, 08 May 2024
 09:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403091306.1308878-1-yunkec@chromium.org> <863b76d9-a463-4bdb-a808-77d7b77c1722@xs4all.nl>
In-Reply-To: <863b76d9-a463-4bdb-a808-77d7b77c1722@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 9 May 2024 01:02:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DOBwDAYr=EnLBEJOeMdqQhLkd+4gJ3BFZGw5jvHGvO2g@mail.gmail.com>
Message-ID: <CAAFQd5DOBwDAYr=EnLBEJOeMdqQhLkd+4gJ3BFZGw5jvHGvO2g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] media: videobuf2-core: attach once if multiple
 planes share the same dbuf
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 7:25=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> Tomasz,
>
> I would appreciate it if you can review this series.

Sorry, I've been out for the last 2 weeks. Catching up now and should
get to this shortly.

Best,
Tomasz

>
> Regards,
>
>         Hans
>
> On 03/04/2024 11:13, Yunke Cao wrote:
> > Hi,
> >
> > This patch set avoids attaching and mapping a dma_buf multiple times wh=
en
> > several planes in one vb2 buffer share the same dma_buf.
> >
> > 1/3 and 2/3 refactors __prepare_dmabuf()
> > 3/3 adds a flag to avoid duplicated attaching
> >
> > Changelog since v1:
> > - Add patch 1/3 to refactor __prepare_dmabuf()
> > - Add patch 2/3 to resolve Tomasz's comment on __vb2_buf_dmabuf_put()'s
> > iteration order
> > - Fix mem_priv in patch 3/3
> > - Rename duplicated_dbuf to dbuf_duplicated
> >
> > Yunke Cao (3):
> >   media: videobuf2-core: release all planes first in __prepare_dmabuf()
> >   media: videobuf2-core: reverse the iteration order in
> >     __vb2_buf_dmabuf_put
> >   media: videobuf2-core: attach once if multiple planes share the same
> >     dbuf
> >
> >  .../media/common/videobuf2/videobuf2-core.c   | 97 +++++++++++--------
> >  include/media/videobuf2-core.h                |  3 +
> >  2 files changed, 62 insertions(+), 38 deletions(-)
> >
>

