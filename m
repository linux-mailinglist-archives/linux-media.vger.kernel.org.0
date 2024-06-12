Return-Path: <linux-media+bounces-13106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF60905CAA
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A161287290
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4B784A54;
	Wed, 12 Jun 2024 20:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FIB7abSz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64A055C08
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 20:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718223602; cv=none; b=L5BCh7bOubwysU+/OMkeWJXQpr3QzoC6r2/1O+sNNXei6+DW4FKjz8rKWYCTpOhInbqRTbgTSpN2OrFBmmNIkiFVWJGrMsx38sp+R6m0VI/CgzBCA6EGIcZu/50np/QOnszxupCFToTSkunF9oKFXy8HbkmRW7SvoFf7pJXsg44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718223602; c=relaxed/simple;
	bh=6i0kJIlppSwXjiLYfPvUtAhIqreoT9kSNtZQsxsyejM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGiGzH0dXTu1yS0KZ9bNp9aPt+D04Zgvw+eOK7SPE47K+mUQ6y656GZHsjbMUbJ622EXglGlFVZGXZXtmw8vAjDrQMBoT0lNm7NRrtjvTxw2q23Verye29qfe2wznYdJxuauWIV4oTKUMVgLhLGvkt7pSs5mIOr4j3Nhii83au0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FIB7abSz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 733D812E4;
	Wed, 12 Jun 2024 22:19:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718223585;
	bh=6i0kJIlppSwXjiLYfPvUtAhIqreoT9kSNtZQsxsyejM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIB7abSzVO5SIGbrdyaM3OBIahMAJWPL78kPfUg7UGrM1NUOoUTXzIKeBKOWNEo3R
	 Guhq9VecoI2xkbXtlPYhEAG7rZP67ZCbA4o6G/BCgcDtynGIZzv2a21r9tpahog++O
	 LezsTyPEwqoLEwDUv36tCCk8Dr050sg9MZTimGBo=
Date: Wed, 12 Jun 2024 23:19:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <20240612201939.GS28989@pendragon.ideasonboard.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
 <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
 <20240612095448.1e99b751@coco.lan>
 <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
 <20240612083430.GE28989@pendragon.ideasonboard.com>
 <CAAFQd5ApRq4WL_PcGKp+58u64yKfvyxgfCxXxiZjqzSugzV1FA@mail.gmail.com>
 <478a8ea7c62b5a17ca645fdd3d06e677bb5d8572.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <478a8ea7c62b5a17ca645fdd3d06e677bb5d8572.camel@collabora.com>

On Wed, Jun 12, 2024 at 04:09:53PM -0400, Nicolas Dufresne wrote:
> Le mercredi 12 juin 2024 à 18:01 +0900, Tomasz Figa a écrit :
> > >   I would like to
> > > deprecate MMAP too and only focus on DMABUF. I believe Linux needs a
> > > centralized buffer allocator, instead of having multiple allocation APIs
> > > scattered in different places. There are design ideas in gralloc that we
> > > could benefit from.
> > > 
> > 
> > Given that we now have DMA-buf heaps in mainline, it sounds much more
> > realistic. It would certainly help eliminate some issues in the vb2
> > layer, such as vb2-dma-sg having its own open coded page allocation
> > that can't handle DMA addressing limitations (which can be fixed with
> > some additions to the DMA API, but eliminating the problem altogether
> > is way better than any other solution.)
> > 
> > That said, as we already use a centralized DMA-buf allocator in
> > ChromeOS and don't really care about the MMAP mode, I'm definitely
> > biased here. We would need to hear from people working on userspace
> > which still uses it (if there is any).
> 
> This aspect is what makes the V4L2 support in chromium really sad to non
> ChromeOS users. ChromeOS makes arbitrary decisions like that codec video node
> must be named video-dec0/enc0 (there is solutions to that using udev and
> topologies btw), and decided that minigbm is the only way allocate memory for
> these codecs on Linux. In practice, in every project where we need Chromium V4L2
> codecs, we endup having to patch it to do MMAP/dmabuf export support and EGL
> import support (the other way around).
> 
> I'm not bashing against ChromeOS, I just want to underline that this is far from
> a solve problem,

I think we all agree on this. There's an extensive amount of work
required in this area.

> and no one is actively working on it.

That may change though, I've heard that some of the people involved in a
previous attempt are considering resuming the work. It of course doesn't
provide a guarantee of success.

> I don't see minigbm
> becoming an acceptable goto library, since EOL (in Chromebook term) hardware get
> removed and you need a CLA to contribute. I also strongly disagree that the
> calculation of auxiliary buffer needed for codecs reference frame should be done
> in a third party library. The driver must validate these sizes, and is the
> logical place to have this logic, not a third party system allocator. On that
> front though, its a bit like the video-decX dev node naming, there is a generic
> solution, since the size is exposed through TRY/S_FMT calls already.

I think the selection of an allocator (in a nutshell, what DMA heap to
use) and the selection of buffer parameters (size, format, stride,
modifiers, ...) are two related but distinct problems. We need to design
a solution that will address both, but keep them distinct so that one
can still use the future generic allocator API without having to
delegate all the allocation parameters decisions to a third-party
component.

> I'll repeat that as often as needed, there is a lot of gaps toward removing mmap
> (dmabuf exportation) in CODEC drivers which ChromeOS only have hacks around and
> no generic solution suitable for generic linux community. In FFMPEG and
> GStreamer, we use mmap + dmabuf export because that is actually usable in a
> generic manner today.

-- 
Regards,

Laurent Pinchart

