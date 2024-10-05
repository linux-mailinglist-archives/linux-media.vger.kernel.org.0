Return-Path: <linux-media+bounces-19117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA43D991404
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 04:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56DBBB23130
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 02:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950601B960;
	Sat,  5 Oct 2024 02:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SKp91mwU"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4091BC2A
	for <linux-media@vger.kernel.org>; Sat,  5 Oct 2024 02:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728096854; cv=none; b=lbP/YAcYy9Y4yYOEK28wb3yZNZy5UvKXNBQPCsYka/9Wjo25sGDJwRUsY01vAL18H47/+qRF4Pq57RotP9ZpUShaDk4sBlI0yLbjdnak3krpnZdbzDbFwh/15v7UPKHN1ycm+IByuENHqL9EQ7p7eDALGNqhCQ2iyig6bVYlEfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728096854; c=relaxed/simple;
	bh=uAz0KG7tpETWNbFPeSi71ydQby067jto2HRH0dFDIMo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RFSk1rqh61VNqDiA/mCEUpwbNF+uJ1NOklAZcm3gP1Hx912HY4ZPgfsjyjNI5dIW91YIutyx5g4nD8QSBTv8DLwvGrTm4S6Ex2OgOXmC5mDunA8DFvmp/LRsQRAp4ThEhE5tyY8ZaZrWftDUik2FxVgjvHRUncsMfWwPYD+kql0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SKp91mwU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728096850;
	bh=uAz0KG7tpETWNbFPeSi71ydQby067jto2HRH0dFDIMo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SKp91mwUnGLRCn1GBFuvVmv2U/GTXBflFYw8ww2bJmwI4ac4XdV4PVqDO7MUQ2nK3
	 v1dt1FanX/8m+vPREhCZmx7K+MNdgFkKH3dB5JCw4deOLoEYsTutYj58haDuqI32j9
	 Axx1L4T7nvpzIJxtqKNCwOk7QxV1tWrX1watRS5wHjeXTsbBHAO6RLT1wHSrJomEEW
	 RKkZEdRcKgHQ95YuTLCU8ZwKJOqgzCWwdAFErQJzXltCdCoZ4trYnk1NQe7s4atqaF
	 Wq399SXHqmxQOB4Ic//9gOaSrFou1hzlunDCUQxr14m4/Tn3cRAAziTlT6WD64cUmq
	 2GrGnM2tOJuvw==
Received: from nicolas-tpx395.lan (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 63F7E17E0F90;
	Sat,  5 Oct 2024 04:54:09 +0200 (CEST)
Message-ID: <9161cd6c2779b2589ab559a7bdd841a1cbb5a12f.camel@collabora.com>
Subject: Re: [PATCHv3 0/3] media: mc: add manual request completion support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Steve Cho <stevecho@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, Sebastian Fricke
	 <sebastian.fricke@collabora.com>
Date: Fri, 04 Oct 2024 22:54:07 -0400
In-Reply-To: <CAC-pXoNpbzD6SCqshFNOLaYG0N+6hDcE32Z32WERLBVmFBxbAw@mail.gmail.com>
References: <cover.1724928939.git.hverkuil-cisco@xs4all.nl>
	 <CAC-pXoNpbzD6SCqshFNOLaYG0N+6hDcE32Z32WERLBVmFBxbAw@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Steve,

Le jeudi 03 octobre 2024 à 15:03 -0700, Steve Cho a écrit :
> Hi Hans,
> 
> Few questions here.
> After this patch, is there any need to reflect in the Request API doc?
> 
> On Thu, Aug 29, 2024 at 3:58 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > 
> > Normally a request contains one or more request objects, and once all
> > objects are marked as 'completed' the request itself is completed and
> > userspace gets a signal that the request is complete.
> > 
> > Calling vb2_buffer_done will complete a buffer object, and
> > v4l2_ctrl_request_complete will complete a control handler object.
> > 
> > In some cases (e.g. VP9 codecs) there is only a buffer object, so
> What codecs have the same behavior here?
> How are things different with other codecs?

CODECs with single header are typically affected. VP9 have no sequence header of
any sort. Userspace will have to set an initial VP9 Frame header out of request
in order to negotiate the format with the driver. VP8 and AV1 are also possible
candidates.

> 
> > as soon as the buffer is marked done, the request is marked as
> > completed. But in the case of mediatek, while the buffer is done
> > (i.e. the data is consumed by the hardware), the request isn't
> > completed yet as the data is still being processed. Once the
> This sounds like standard HW behavior to me...
> How is it different on rockchip, which I heard was not reproducing this issue?

This only affects MTK VCODEC, and only very recent version of Chromium. Event if
Hantro and RKVDEC are not affected, at the time RK3399 support was dropped by
ChromeOS team, Chromium was still sending all the controls into all the request.
Incidently, we never tested the effect of having request without controls.

The intention here is to give drivers the control over when the following steps
occurs. In practice, the most logical event signalling order would be:

- Apply the new controls to the global state
- Mark the bitstream buffer done (bitstream buffers can immediately be refilled)
- Mark the picture buffer done
- Signal the request completion

But all drivers, except MTK, uses the helper v4l2_m2m_buf_done_and_job_finish(),
which imply

- Apply the new controls to the global state
- Mark the picture buffer done
- Mark the bitstream buffer done
- After which the last object in the request is dropped and the implicit
signalling triggers

In order to render the bistream buffers available earlier to user space, the MTK
driver is currently delaying the application of controls. But if there is no
control object in the request, this mechanism is not working and lead to the
splat we are trying to fix in a clean way.

Nicolas

> 
> > data is fully processed, the driver wants to call
> > v4l2_ctrl_request_complete() which will either update an existing
> > control handler object, or add a new control handler object to the
> > request containing the latest control values. But since the
> > request is already completed, calling v4l2_ctrl_request_complete()
> > will fail.
> > 
> > One option is to simply postpone calling vb2_buffer_done() and do
> > it after the call to v4l2_ctrl_request_complete(). However, in some
> > use-cases (e.g. secure memory) the number of available buffers is
> > very limited and you really want to return a buffer as soon as
> > possible.
> > 
> > In that case you want to postpone request completion until you
> > know the request is really ready.
> > 
> > Originally I thought the best way would be to make a dummy request
> > object, but that turned out to be overly complicated. So instead
> > I just add a bool manual_completion, which you set to true in
> > req_queue, and you call media_request_manual_complete() when you
> > know the request is complete. That was a lot less complicated.
> > 
> > The first patch adds this new manual completion code, the second
> > patch adds this to vicodec so it is included in regression testing,
> > and the last patch is an updated old patch of mine that adds debugfs
> > code to check if all requests and request objects are properly freed.
> > Without it it is really hard to verify that there are no dangling
> > requests or objects.
> > 
> > I prefer to merge this third patch as well, but if there are
> > objections, then I can live without it.
> > 
> > Regards,
> > 
> >         Hans
> > 
> > Changes since v2:
> > - fixed use-after-free bug in the third patch in media_request_object_release().
> > 
> > Changes since the RFC:
> > 
> > - Added WARN_ONs
> > - vicodec was calling media_request_manual_complete() without
> >   checking that it was the stateless output queue first.
> > - Some minor cleanups in patch 3.
> > 
> > Hans Verkuil (3):
> >   media: mc: add manual request completion
> >   media: vicodec: add support for manual completion
> >   media: mc: add debugfs node to keep track of requests
> > 
> >  drivers/media/mc/mc-device.c                  | 30 +++++++++++++
> >  drivers/media/mc/mc-devnode.c                 |  5 +++
> >  drivers/media/mc/mc-request.c                 | 44 ++++++++++++++++++-
> >  .../media/test-drivers/vicodec/vicodec-core.c | 21 +++++++--
> >  include/media/media-device.h                  |  9 ++++
> >  include/media/media-devnode.h                 |  4 ++
> >  include/media/media-request.h                 | 38 +++++++++++++++-
> >  7 files changed, 144 insertions(+), 7 deletions(-)
> > 
> > --
> > 2.43.0
> > 
> > 


