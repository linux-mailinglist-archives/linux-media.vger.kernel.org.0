Return-Path: <linux-media+bounces-13104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 720ED905C8E
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2014C285926
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3237384A54;
	Wed, 12 Jun 2024 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="tnwrO0qc"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1EA7E0FC
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 20:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718223001; cv=none; b=oG0jsJz99wW/NRAO/UbPb6tDrltm4R0clIZ8E4j+WUncFmYZUB8Hd2+6pVIKua95d8skh5yQbPTcm06Pzhw++pbux6c+76+IxAvbblSUQ9rVq9Qx6L0OwCdLQgofI1PJarKfH4YzJHtzZqHeVBPedWnE9c9CALybCBpQHNA0rcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718223001; c=relaxed/simple;
	bh=4pKTwWCbd0iZCFDEFW9wgdvyS220SqHd6Pfsg/ideA4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LMsysSO7AU+VI0Tv50u6RGb1z94+kbqSzbaiB0Ov81EdMHJaJk1WhEmMM9sPg5eDc3w428HN68IWeEL9XnJhubR4PbKmBmtIkDE84G48YFRNPT9MRvExYwQu0V3715I7xtzDsVaq6m6pa1KKp1IGlmJiKyKqfa6CINnMCt+HKck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=tnwrO0qc; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718222998;
	bh=4pKTwWCbd0iZCFDEFW9wgdvyS220SqHd6Pfsg/ideA4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=tnwrO0qci1Bq5Qpt/f1dFu2csVUq0WkoMEcYLLJN6SIhP3RE+yBIBEW/BBG2G6qLX
	 O+9PX2PBcxKtJE+X5rvubV2zvY5cdsiydPTkqzPevNlEMQm5YjvfcCsSFDmmFYngUx
	 HMidRiAQ8v9pshVDnN0zBZReOfGnVKqjysTAXoGwQA4f1ywoIa2UKuX/qOY0Szc41X
	 tfxVNrpFklw53vn2wMs6d3OKl7Wb9OkzxRwvnUvD2gGN9VcNKLmSobUH3fxI6sN+jn
	 2k3aNnozPsVw8s0hefcZL5NVwUHeIHcgRz/neZDS+Os06vgnUa/u/sUPpmcKW+J6Sc
	 EQNjKEi9Mrthg==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D1C18378065F;
	Wed, 12 Jun 2024 20:09:56 +0000 (UTC)
Message-ID: <478a8ea7c62b5a17ca645fdd3d06e677bb5d8572.camel@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Hidenori Kobayashi <hidenorik@chromium.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Sean Young <sean@mess.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 12 Jun 2024 16:09:53 -0400
In-Reply-To: <CAAFQd5ApRq4WL_PcGKp+58u64yKfvyxgfCxXxiZjqzSugzV1FA@mail.gmail.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
	 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
	 <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
	 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
	 <20240612095448.1e99b751@coco.lan>
	 <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
	 <20240612083430.GE28989@pendragon.ideasonboard.com>
	 <CAAFQd5ApRq4WL_PcGKp+58u64yKfvyxgfCxXxiZjqzSugzV1FA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Tomasz,

Le mercredi 12 juin 2024 =C3=A0 18:01 +0900, Tomasz Figa a =C3=A9crit=C2=A0=
:
> > =C2=A0 I would like to
> > deprecate MMAP too and only focus on DMABUF. I believe Linux needs a
> > centralized buffer allocator, instead of having multiple allocation API=
s
> > scattered in different places. There are design ideas in gralloc that w=
e
> > could benefit from.
> >=20
>=20
> Given that we now have DMA-buf heaps in mainline, it sounds much more
> realistic. It would certainly help eliminate some issues in the vb2
> layer, such as vb2-dma-sg having its own open coded page allocation
> that can't handle DMA addressing limitations (which can be fixed with
> some additions to the DMA API, but eliminating the problem altogether
> is way better than any other solution.)
>=20
> That said, as we already use a centralized DMA-buf allocator in
> ChromeOS and don't really care about the MMAP mode, I'm definitely
> biased here. We would need to hear from people working on userspace
> which still uses it (if there is any).

This aspect is what makes the V4L2 support in chromium really sad to non
ChromeOS users. ChromeOS makes arbitrary decisions like that codec video no=
de
must be named video-dec0/enc0 (there is solutions to that using udev and
topologies btw), and decided that minigbm is the only way allocate memory f=
or
these codecs on Linux. In practice, in every project where we need Chromium=
 V4L2
codecs, we endup having to patch it to do MMAP/dmabuf export support and EG=
L
import support (the other way around).

I'm not bashing against ChromeOS, I just want to underline that this is far=
 from
a solve problem, and no one is actively working on it. I don't see minigbm
becoming an acceptable goto library, since EOL (in Chromebook term) hardwar=
e get
removed and you need a CLA to contribute. I also strongly disagree that the
calculation of auxiliary buffer needed for codecs reference frame should be=
 done
in a third party library. The driver must validate these sizes, and is the
logical place to have this logic, not a third party system allocator. On th=
at
front though, its a bit like the video-decX dev node naming, there is a gen=
eric
solution, since the size is exposed through TRY/S_FMT calls already.

I'll repeat that as often as needed, there is a lot of gaps toward removing=
 mmap
(dmabuf exportation) in CODEC drivers which ChromeOS only have hacks around=
 and
no generic solution suitable for generic linux community. In FFMPEG and
GStreamer, we use mmap + dmabuf export because that is actually usable in a
generic manner today.

Nicolas

