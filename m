Return-Path: <linux-media+bounces-19076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3801398F988
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 00:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A248A28332E
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 22:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B09C1C2451;
	Thu,  3 Oct 2024 22:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jK2g1jcn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33353145B39
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 22:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727993008; cv=none; b=MCRzqy3/n6Bw+E14tnmesVJHhKFgJpoQxnhw5tDYAz1cr1LE8YGHyCiVKc7VyFpYPYipxN5Fq0Tt3WNx7nb66RqXJjFZhQfjdLdedpD2cTpLVKADF+vnorI1PtJnQBFYcmOjQbgonaygtattEBE7plU0dvaBZ0WmsPA6jWcBxdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727993008; c=relaxed/simple;
	bh=mHkDDF4I5cE604g0JBwU3fWnW3HeowxD6tFjVOii6Tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NxaGmMUbuJ+/Jdy+MtylhbSxQTHMxLeGeFLzFiTJAs5x1o1EqDjMLvclPKF3a0fkooamJqu2j/aego6Db7fGtzuPUs5iCuR0A0YqfoJKR4bxDWul16UNVh7jd2clPuzW3ffoPbDg/vpIqGG43g1ToQT7pJ2TqpH09Gn0eZjPnwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jK2g1jcn; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7ac83a98e5eso131804685a.0
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2024 15:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727993006; x=1728597806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xv1Z2zO6s1JlCsKCbjSnUgHG9J/xtbt1VVafPfn8rVU=;
        b=jK2g1jcnvgqomWzsZRE/lNIvdVpUbU5hunOHv5URbSpkuJy+t+fseNooy77jQazKh6
         4Pjbn4hjTdvl+m36Hwv0sSMh+2FGR1TmLlgimuifyyiXM0FiXXE1CE91gjG85mEitYT+
         Hf1eWD4irX95niQTMlCuxqUgF24T89JetfJyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727993006; x=1728597806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xv1Z2zO6s1JlCsKCbjSnUgHG9J/xtbt1VVafPfn8rVU=;
        b=IMWU+1/mFJjfkdtYI8+YlqzLhNwbUA+w/k9fjO/huxR07/2xxnKzguFGiwqjVjtJG5
         9kA4iC2GLCf//FGjkc1pTbnt5evJEUkf+dDqjUhbTlbX4UQ/X7R8sHQ7b5FQ72+xdeMC
         xp2K3ZKso9V8Ef/1WvaN/V3vjbtimYG9KSOKQ9GlEID/A8TEm4wOozz4w9GJTOtnSS/C
         5DavmlYn3MPNVxSgkBs7xbSl81qmwpXq2VT3wln6OupMXEaMlITJ95v3IZr/C+t/ZOHk
         80FaAdsb/AVJTKIu23JrtFkjnq8PoqEkXyxs3iTgiIJLP7X87nB/R6k/YNq5gNyx4vZA
         3iag==
X-Gm-Message-State: AOJu0Yzvm2JxHhBpongQqb11Q7/VpdmDP+4gpd/V3ZqL8FhbXGUTnvQ0
	11YAjXHBfaCv8RdjthQuUdcw6kPnJ95Fj4DSSyhU1xTgyHkOyucTv60va9x9NGXjr8Iie7Mw0Ya
	RS0mq5QBUdRBFU2LHilLZrzeP/Rr7Gw7Z0y6zUnbCW+nDPcc=
X-Google-Smtp-Source: AGHT+IGkDlYQMP3F+Rb2CXXDQa5RV3k8aF3M8yiFG0AuC3ib+oszAOMWJQpGYHuBKC6jfzw9mi+00gKW4aTZwY00SBw=
X-Received: by 2002:a05:620a:258a:b0:7ac:bc66:5efb with SMTP id
 af79cd13be357-7ae67e89893mr722297785a.27.1727993006064; Thu, 03 Oct 2024
 15:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1724928939.git.hverkuil-cisco@xs4all.nl>
In-Reply-To: <cover.1724928939.git.hverkuil-cisco@xs4all.nl>
From: Steve Cho <stevecho@chromium.org>
Date: Thu, 3 Oct 2024 15:03:15 -0700
Message-ID: <CAC-pXoNpbzD6SCqshFNOLaYG0N+6hDcE32Z32WERLBVmFBxbAw@mail.gmail.com>
Subject: Re: [PATCHv3 0/3] media: mc: add manual request completion support
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Few questions here.
After this patch, is there any need to reflect in the Request API doc?

On Thu, Aug 29, 2024 at 3:58=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> Normally a request contains one or more request objects, and once all
> objects are marked as 'completed' the request itself is completed and
> userspace gets a signal that the request is complete.
>
> Calling vb2_buffer_done will complete a buffer object, and
> v4l2_ctrl_request_complete will complete a control handler object.
>
> In some cases (e.g. VP9 codecs) there is only a buffer object, so
What codecs have the same behavior here?
How are things different with other codecs?

> as soon as the buffer is marked done, the request is marked as
> completed. But in the case of mediatek, while the buffer is done
> (i.e. the data is consumed by the hardware), the request isn't
> completed yet as the data is still being processed. Once the
This sounds like standard HW behavior to me...
How is it different on rockchip, which I heard was not reproducing this iss=
ue?

> data is fully processed, the driver wants to call
> v4l2_ctrl_request_complete() which will either update an existing
> control handler object, or add a new control handler object to the
> request containing the latest control values. But since the
> request is already completed, calling v4l2_ctrl_request_complete()
> will fail.
>
> One option is to simply postpone calling vb2_buffer_done() and do
> it after the call to v4l2_ctrl_request_complete(). However, in some
> use-cases (e.g. secure memory) the number of available buffers is
> very limited and you really want to return a buffer as soon as
> possible.
>
> In that case you want to postpone request completion until you
> know the request is really ready.
>
> Originally I thought the best way would be to make a dummy request
> object, but that turned out to be overly complicated. So instead
> I just add a bool manual_completion, which you set to true in
> req_queue, and you call media_request_manual_complete() when you
> know the request is complete. That was a lot less complicated.
>
> The first patch adds this new manual completion code, the second
> patch adds this to vicodec so it is included in regression testing,
> and the last patch is an updated old patch of mine that adds debugfs
> code to check if all requests and request objects are properly freed.
> Without it it is really hard to verify that there are no dangling
> requests or objects.
>
> I prefer to merge this third patch as well, but if there are
> objections, then I can live without it.
>
> Regards,
>
>         Hans
>
> Changes since v2:
> - fixed use-after-free bug in the third patch in media_request_object_rel=
ease().
>
> Changes since the RFC:
>
> - Added WARN_ONs
> - vicodec was calling media_request_manual_complete() without
>   checking that it was the stateless output queue first.
> - Some minor cleanups in patch 3.
>
> Hans Verkuil (3):
>   media: mc: add manual request completion
>   media: vicodec: add support for manual completion
>   media: mc: add debugfs node to keep track of requests
>
>  drivers/media/mc/mc-device.c                  | 30 +++++++++++++
>  drivers/media/mc/mc-devnode.c                 |  5 +++
>  drivers/media/mc/mc-request.c                 | 44 ++++++++++++++++++-
>  .../media/test-drivers/vicodec/vicodec-core.c | 21 +++++++--
>  include/media/media-device.h                  |  9 ++++
>  include/media/media-devnode.h                 |  4 ++
>  include/media/media-request.h                 | 38 +++++++++++++++-
>  7 files changed, 144 insertions(+), 7 deletions(-)
>
> --
> 2.43.0
>
>

