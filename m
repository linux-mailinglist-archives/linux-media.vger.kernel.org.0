Return-Path: <linux-media+bounces-19166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47812993391
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F356C28678F
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 16:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7315E1DCB36;
	Mon,  7 Oct 2024 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fv8+EE8e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17431DB554
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 16:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728319019; cv=none; b=QErXteQg+f+SN+9uynN9RrBcFCZUjssfwMm+RdSfzDaOtG3tfmBUXynZTy64sZcOpxV0zGXTD8tz4j+unZb7uAKFbr085gDY7jaZEiH1ViOeHVGCNHsuVGoOcIlcuwAeMPvTi3r125X+uouESGYFQAERc9LjEnmgAN6yODcmGu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728319019; c=relaxed/simple;
	bh=+biEUAo8/3MmUp03Jjbk/HS4pSr56Mt9XANuwpuUbI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLc1ts8dX3/uUqVronV0PHtJXKulePIm4zgDA6XYlLjygnid8K3kNAcxtxeLxZLJyt5USRP9v1gSZjJ+KAXm96Fum1rbwqXHL6yKYyYLKSAD50gQkvcZVzGojraNV/Z4inL4x9r8yTVKW+P6sFn8HuO7H6QROVCjynKYk4NM+1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fv8+EE8e; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4a307566315so1543494137.2
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2024 09:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728319017; x=1728923817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKK/nSFC2pNpBqp374lotGYt1qeYpPxaqXSvYONiXxE=;
        b=Fv8+EE8ecPSOIXOunlFXsSmL+XvtVuWbUsxoEfP+pv682j00h9pHUhGCpoUz1MDKBA
         DNHX78U2gD+BCaRT7gux/7Nc/v0mxFA+WVW+oPghT4E2p9NluTogrbD6LT7JaHP/I9mI
         DvztdtyIV0415C32cT0GHqzYDz1SlmjTib5Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728319017; x=1728923817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKK/nSFC2pNpBqp374lotGYt1qeYpPxaqXSvYONiXxE=;
        b=OY3GfmOkuuczUXmveo7Sw+x8s46XUiqIQqsnMOvIEJt9GJ3EULVag6qYxScwFjsLm2
         wpcgfZ8xQKkKjjW19USS0KjH8PydCfqyZKuuGMnUSO3GBbuXC0RFrnBfp0V7hOFiNZQd
         fsrCYs5y1BxCkZ9aczmect2WBodmTTvOtgaaH5kkhlxpVJrmG62znjkKes1evlKMs1lR
         BXzRzKatBumPVcKzcAn5BjZDBahoTBxKikGdd4utWllxueZjbhXSVi4agMRxlwflwXKA
         hOV/KkjqBr366WNRoYy3DG7sOBRs72B+d8HZAFURXfd2G8786uOZIBAyTvbNjKHQeJLV
         HmVA==
X-Forwarded-Encrypted: i=1; AJvYcCX8D3HJzZB5znnYQSHbCYKZ5AiRRrf1RiNd0GypOL2bu0fA/BIkRs3SyfWwd2ByN0NYedv1Y+vhA35Uzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMTVe2L8x/U8oXi0j1yCIiTkOwZdyH25mJqOleyFN5ney2ceux
	d4mE3XCAhUoc0sh3Lh9Xa8KeFq+sqA1S9VzaglYfqqepTGBn7mwCBew2/xmYpDjuY+q+T6FrNkv
	ccmmGrHqEPw1MfhbyeQL1+p3xbqR/AXrJmE11
X-Google-Smtp-Source: AGHT+IGpMMiVvX2SHouEYoR3w9JVexyW3lDr9S/ssARq2MLFZi3sbGw8E0WPlb0SOxrNUhZpcfr/OKpiSZSOczSpujE=
X-Received: by 2002:a05:6102:c88:b0:49b:a93d:3d0 with SMTP id
 ada2fe7eead31-4a405744304mr7753806137.1.1728319016803; Mon, 07 Oct 2024
 09:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1724928939.git.hverkuil-cisco@xs4all.nl>
 <CAC-pXoNpbzD6SCqshFNOLaYG0N+6hDcE32Z32WERLBVmFBxbAw@mail.gmail.com> <9161cd6c2779b2589ab559a7bdd841a1cbb5a12f.camel@collabora.com>
In-Reply-To: <9161cd6c2779b2589ab559a7bdd841a1cbb5a12f.camel@collabora.com>
From: Steve Cho <stevecho@chromium.org>
Date: Mon, 7 Oct 2024 09:36:45 -0700
Message-ID: <CAC-pXoNzG+bT7NCEqUWBe-d-7AxPU41uQ3yT83TpyHiwYqe26A@mail.gmail.com>
Subject: Re: [PATCHv3 0/3] media: mc: add manual request completion support
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	Sebastian Fricke <sebastian.fricke@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Nicolas for the explanation.

On Fri, Oct 4, 2024 at 7:54=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Steve,
>
> Le jeudi 03 octobre 2024 =C3=A0 15:03 -0700, Steve Cho a =C3=A9crit :
> > Hi Hans,
> >
> > Few questions here.
> > After this patch, is there any need to reflect in the Request API doc?
> >
> > On Thu, Aug 29, 2024 at 3:58=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs=
4all.nl> wrote:
> > >
> > > Normally a request contains one or more request objects, and once all
> > > objects are marked as 'completed' the request itself is completed and
> > > userspace gets a signal that the request is complete.
> > >
> > > Calling vb2_buffer_done will complete a buffer object, and
> > > v4l2_ctrl_request_complete will complete a control handler object.
> > >
> > > In some cases (e.g. VP9 codecs) there is only a buffer object, so
> > What codecs have the same behavior here?
> > How are things different with other codecs?
>
> CODECs with single header are typically affected. VP9 have no sequence he=
ader of
> any sort. Userspace will have to set an initial VP9 Frame header out of r=
equest
> in order to negotiate the format with the driver. VP8 and AV1 are also po=
ssible
> candidates.
>
> >
> > > as soon as the buffer is marked done, the request is marked as
> > > completed. But in the case of mediatek, while the buffer is done
> > > (i.e. the data is consumed by the hardware), the request isn't
> > > completed yet as the data is still being processed. Once the
> > This sounds like standard HW behavior to me...
> > How is it different on rockchip, which I heard was not reproducing this=
 issue?
>
> This only affects MTK VCODEC, and only very recent version of Chromium. E=
vent if
I assume you are referring to what we call "v4l2 flat stateless"
implementation.
This was developed, but it was not enabled.

> Hantro and RKVDEC are not affected, at the time RK3399 support was droppe=
d by
> ChromeOS team, Chromium was still sending all the controls into all the r=
equest.
> Incidently, we never tested the effect of having request without controls=
.
>
> The intention here is to give drivers the control over when the following=
 steps
> occurs. In practice, the most logical event signalling order would be:
>
> - Apply the new controls to the global state
> - Mark the bitstream buffer done (bitstream buffers can immediately be re=
filled)
> - Mark the picture buffer done
> - Signal the request completion
>
> But all drivers, except MTK, uses the helper v4l2_m2m_buf_done_and_job_fi=
nish(),
> which imply
>
> - Apply the new controls to the global state
> - Mark the picture buffer done
> - Mark the bitstream buffer done
> - After which the last object in the request is dropped and the implicit
> signalling triggers
>
> In order to render the bistream buffers available earlier to user space, =
the MTK
> driver is currently delaying the application of controls. But if there is=
 no
> control object in the request, this mechanism is not working and lead to =
the
> splat we are trying to fix in a clean way.
>
> Nicolas
>
> >
> > > data is fully processed, the driver wants to call
> > > v4l2_ctrl_request_complete() which will either update an existing
> > > control handler object, or add a new control handler object to the
> > > request containing the latest control values. But since the
> > > request is already completed, calling v4l2_ctrl_request_complete()
> > > will fail.
> > >
> > > One option is to simply postpone calling vb2_buffer_done() and do
> > > it after the call to v4l2_ctrl_request_complete(). However, in some
> > > use-cases (e.g. secure memory) the number of available buffers is
> > > very limited and you really want to return a buffer as soon as
> > > possible.
> > >
> > > In that case you want to postpone request completion until you
> > > know the request is really ready.
> > >
> > > Originally I thought the best way would be to make a dummy request
> > > object, but that turned out to be overly complicated. So instead
> > > I just add a bool manual_completion, which you set to true in
> > > req_queue, and you call media_request_manual_complete() when you
> > > know the request is complete. That was a lot less complicated.
> > >
> > > The first patch adds this new manual completion code, the second
> > > patch adds this to vicodec so it is included in regression testing,
> > > and the last patch is an updated old patch of mine that adds debugfs
> > > code to check if all requests and request objects are properly freed.
> > > Without it it is really hard to verify that there are no dangling
> > > requests or objects.
> > >
> > > I prefer to merge this third patch as well, but if there are
> > > objections, then I can live without it.
> > >
> > > Regards,
> > >
> > >         Hans
> > >
> > > Changes since v2:
> > > - fixed use-after-free bug in the third patch in media_request_object=
_release().
> > >
> > > Changes since the RFC:
> > >
> > > - Added WARN_ONs
> > > - vicodec was calling media_request_manual_complete() without
> > >   checking that it was the stateless output queue first.
> > > - Some minor cleanups in patch 3.
> > >
> > > Hans Verkuil (3):
> > >   media: mc: add manual request completion
> > >   media: vicodec: add support for manual completion
> > >   media: mc: add debugfs node to keep track of requests
> > >
> > >  drivers/media/mc/mc-device.c                  | 30 +++++++++++++
> > >  drivers/media/mc/mc-devnode.c                 |  5 +++
> > >  drivers/media/mc/mc-request.c                 | 44 +++++++++++++++++=
+-
> > >  .../media/test-drivers/vicodec/vicodec-core.c | 21 +++++++--
> > >  include/media/media-device.h                  |  9 ++++
> > >  include/media/media-devnode.h                 |  4 ++
> > >  include/media/media-request.h                 | 38 +++++++++++++++-
> > >  7 files changed, 144 insertions(+), 7 deletions(-)
> > >
> > > --
> > > 2.43.0
> > >
> > >
>

