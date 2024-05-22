Return-Path: <linux-media+bounces-11732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E91A8CC1B2
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 15:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 603C41C21DF7
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 13:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADF813DBA0;
	Wed, 22 May 2024 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UCBffbdq"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25F1757FD;
	Wed, 22 May 2024 13:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716382953; cv=none; b=lE/tVFbJOWfKwx0f7Bxsl8PS633rMFVePONr6CAE6nSnTh19VSWIIyk5dEx0XTumtFXWwJZiru0Pw7XZmYnOOs+1HU3VohzHQhcefZxAu6yDyLZOfkxOOb0Skhu4mfp6Z1no0LIEPpDflc4OQomSawuE0A+6sG5eRlZPjcKlJHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716382953; c=relaxed/simple;
	bh=ItsWZl5G0QS+oyguQ25DhfIuHBh030DblZ9aQCQY95k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bsgYAbOUkEUpILVXaJp0iYwmD4j1HZYZo8vMprB2x/zv7TUtTpZhpic3XFwc/XiKtShDIgK079zLhaygvS39R0BEglBR0Po2O6JUWzDQ8tyzqI8ASaRb1YebsiV+yH0Rf4UARHlx/pVn/6ZTTEVmvDnlxKBIcpiH+Bueck/HPlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UCBffbdq; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716382950;
	bh=ItsWZl5G0QS+oyguQ25DhfIuHBh030DblZ9aQCQY95k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UCBffbdq7PTT1pW6SE6MgvG+WM4DODVOJFjRzCDlbmQ1RJFvw62WNDMfgNRnxsfHH
	 SWAWH8h1YU5krcMnQ3DhsE9bJ/gidkKGU1VvKgfFLQhwiXYY71y+quk5UqltVe3ZCq
	 XYevBLhGL32zpU0s6iZYpRd0HX2Enw9yjUr2NPyt6S1uTSKpBiNFgCdkfe0ae2AEk5
	 VeR8gsX4v6OEtpt291agBR5ADepRGvMZ/XAfvVrN2MrSB6V3di7ECXZtgtlobTDRca
	 XgAoJjf8wt7PnhH2MG2gJXN4B7jPZcO42l4EPiDUQOC6fSuav+Yqu/n3o6d+bHFv1d
	 rF0g+053IwU4w==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 63DBA37821AE;
	Wed, 22 May 2024 13:02:27 +0000 (UTC)
Message-ID: <656423737618913a19633b4b4c39e2e8de54546d.camel@collabora.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present
 users (udev uaccess tag) ?
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Ser
	 <contact@emersion.fr>
Cc: Maxime Ripard <mripard@redhat.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Hans de Goede <hdegoede@redhat.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Lennart
 Poettering <mzxreary@0pointer.de>,  Robert Mader
 <robert.mader@collabora.com>, Sebastien Bacher
 <sebastien.bacher@canonical.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,  linaro-mm-sig@lists.linaro.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal
 <mzamazal@redhat.com>, Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Date: Wed, 22 May 2024 09:02:21 -0400
In-Reply-To: <20240516112055.GB5253@pendragon.ideasonboard.com>
References: <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
	 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
	 <20240507183613.GB20390@pendragon.ideasonboard.com>
	 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
	 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
	 <20240513-heretic-didactic-newt-1d6daf@penduick>
	 <20240513083417.GA18630@pendragon.ideasonboard.com>
	 <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>
	 <20240514204223.GN32013@pendragon.ideasonboard.com>
	 <ttHZ6_mxyApQbVuEg7V20i3gCZ0nCr26aymroG2zxHv3CMRAA6RqZsUxNY3eBiYjycfb1r1WQdyMTwJO_I38FsJQMHA_Zdiqbbjs_YJWKr8=@emersion.fr>
	 <20240516112055.GB5253@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 16 mai 2024 =C3=A0 14:20 +0300, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> On Thu, May 16, 2024 at 07:00:31AM +0000, Simon Ser wrote:
> > On Tuesday, May 14th, 2024 at 22:42, Laurent Pinchart wrote:
> >=20
> > > My experience on Arm platforms is that the KMS drivers offer allocati=
on
> > > for scanout buffers, not render buffers, and mostly using the dumb
> > > allocator API. If the KMS device can scan out YUV natively, YUV buffe=
r
> > > allocation should be supported. Am I missing something here ?
> >=20
> > Note that dumb buffers are only intended for simple software-rendering
> > use-cases. Anything more complicated (e.g. involving GPU rendering)
> > should use another mechanism.
>=20
> Sure. Even if dumb buffers may work for GPU rendering in some cases,
> there's no guarantee they will, so they shouldn't be used.
>=20
> My comment was related to scanout buffers, as I was puzzled by Nicolas
> mentioning how "KMS drivers only offer allocation for render buffers".
> On Arm platforms the render buffers are allocated on the GPU's DRM
> device as far as I understand, while the KMS drivers allocate scanout
> buffers using the dumb buffers API.
>=20

The message is getting distorted. I'm saying that not all supported formats=
 have
an allocation API in DRM/KMS drivers. Most YUV formats needed for media han=
dling
(GPU or scannout) are not supported.

Nicolas

p.s. I feel like commenters thinks its evident for userspace application to=
 know
if they are doing scanout or GPU ... while in reality, they offload their
allocated buffer to a compositor which will have to dynamically juggle betw=
een
these two with its own heuristic.


