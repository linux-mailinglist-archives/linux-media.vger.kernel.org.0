Return-Path: <linux-media+bounces-33537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5521DAC6CA3
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 17:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16DA116B25A
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 15:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8706128C2B3;
	Wed, 28 May 2025 15:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ocTIM4H1"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08FE28BAAD;
	Wed, 28 May 2025 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445063; cv=none; b=vE4w0adIS3EFP6zy63Vi5+NF5oyg42xGnYfN3EHVU4DYCYk7z/n/+2Nge6MkyMm0LUI76tpByjIlLS7UXlLGoXzhNUVmkWie/RFpI/xIZJW8q9CondeKAFweiLQwcSGs+4K/EGAnNR4dqk4AB2enoPpG6F/5ebSMotI8bC2qrDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445063; c=relaxed/simple;
	bh=2insgHiZQR7p5wDJ020t1ub628/CBQGfKrAAC0h7XjM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SfkO8KUAIr44/Gc9Q/Ey9AzCwWvfHFWlUqDwhH9ejfcICbmKFi4xvjD/CCz4BrbpfBqOJaTrc7j4vyVJVORr5a3OYdujGVzbB71B8xkBAjgEfiiyQiH4n5luWqiuAzlWVl8ilbk9wVgDmYUBYhvUAUvy65Y049joVvpENE5Uduo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ocTIM4H1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748445059;
	bh=2insgHiZQR7p5wDJ020t1ub628/CBQGfKrAAC0h7XjM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ocTIM4H1xvxfaSzI137wEbK2D5Nwa7Cpjz4v9oBNtA9O+rufRY7TJbOGrbgcOOjWA
	 XYJjQoZrJ9jOX5aYU5RwxYcPrBH2xlWJcqPe5e0YMBDY7uqStF6a9uYP7DzmgBeZwh
	 MPX6QnjVOy+2gMk+zVK9SnPqxQU+APeKYKTFiTBBNVyh88q6lJbjGIL78B+GpuB9vG
	 rLIj1kklzMKLvzJUDJlfAJMRyZvTETb3yiCUVF4JpAWPkYuO1Q08eD/DOuw2tTvCq+
	 VYFYn1RRyM15IZZSn/MD+dbLeaXsKM08JM3KwM7G/5cg5tXOxR9qgsS/MHYjK1HuVD
	 VWGQd+o1twxzg==
Received: from [IPv6:2606:6d00:17:b2fc::5ac] (unknown [IPv6:2606:6d00:17:b2fc::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C49F17E153E;
	Wed, 28 May 2025 17:10:58 +0200 (CEST)
Message-ID: <0476c8d6ef2482688d07077592393074398c9ce0.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Switch to using structs instead of writel
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Detlev Casanova
	 <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "linux-media@vger.kernel.org"	 <linux-media@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org"	 <linux-rockchip@lists.infradead.org>,
 "linux-staging@lists.linux.dev"	 <linux-staging@lists.linux.dev>,
 "kernel@collabora.com" <kernel@collabora.com>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>
Date: Wed, 28 May 2025 11:10:57 -0400
In-Reply-To: <a787e6e0-d4ce-45e3-8263-2489585d3ec0@kwiboo.se>
References: <20250527150043.174415-1-detlev.casanova@collabora.com>
	 <a787e6e0-d4ce-45e3-8263-2489585d3ec0@kwiboo.se>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jonas,

Le mardi 27 mai 2025 à 19:51 +0200, Jonas Karlman a écrit :
> Hi Detlev,
> 
> On 2025-05-27 17:00, Detlev Casanova wrote:
> > In an effort to merge the rkvdec2 driver [1] with this one, switch from
> > writel() calls to using structs to represent the register mappings.
> 
> Please wait with this until HEVC support has landed, now that H264
> 4:2:2/Hi10 finally have been merged I was hoping to be able to send a v2


Detlev communicated to me that this was meant to have the RFC tag. The intent
being to check with others if the usage of bitfield in structure for registers is
acceptable. I personally like it, and don't see any issue with it considering
the performance is not affected at all. The idea is not new, you can find
similar proposal from 2019.

https://lore.kernel.org/all/20190131031333.11905-2-ayaka@soulik.info/

> of the old HEVC series [3]. I was waiting on v6.16-rc1 before sending
> the series but can send it sooner if needed, [4] has current state of v2.

Please don't wait for that, just send as soon as your are happy with it.
Just based it on current media-committers/next branch, I will deal with the
rest.

> 
> H264 4:2:2/Hi10 and HEVC have been in the works for a few years now,
> would be nice to have it fully land before refactoring starts ;-)

My roadmap was that HEVC was not truly an unstaging dependency. I was a lot
more worried about concurrent decode, but I have a patch in queue now. So
unstaging is what I will prioritize once a patch is made. Meanwhile, better send
you patches soon.

> 
> [3] https://lore.kernel.org/linux-media/20231105233630.3927502-1-jonas@kwiboo.se
> [4] https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-hevc-v2b/
> 
> > This is done in order to have all supported decoders use the same format
> > in the future and ease reading of the code.
> 
> Do you have any work-in-progress patches for this?
> 
> > Using structs also improves stability as the hardware is tested and
> > validated downstream using a similar method.
> > It was noticed, on decoders, that:
> >  - Some registers require to be writen in increasing order [2]
> >  - Some registers, even if unrelated, need to be written to their reset
> >    values (it was the case here for axi_ddr_[rw]data).
> > 
> > Using structs can also help improving performance later when, e.g.
> > multicore support is added on RK3588.
> 
> Are your referring to the linked-list feature (also present in e.g.
> RK3328) or just for multi-core purpose?

RK3588 multi-core design, but this is also needed if you want to use HW queues.
Multi-core is more pressing at the moment, the benefit of using HW queues will
have to be proven. It does not make a big difference for a single media.

Nicolas

> 
> Regards,
> Jonas
> 
> > Performance seems to be slightly improved, but at least, not made worse.
> > Running fluster's JVT-AVC_V1 test suite with GStreamer on the Radxa ROCK
> > PI 4 SE gives the following times:
> > 
> > Before this patch:
> > 
> > - --jobs 1: Ran 129/135 tests successfully               in 77.167 secs
> > - --jobs 6: Ran 129/135 tests successfully               in 23.046 secs
> > 
> > With this patch:
> > - --jobs 1: Ran 129/135 tests successfully               in 70.698 secs
> > - --jobs 6: Ran 129/135 tests successfully               in 22.917 secs
> > 
> > This also shows that the fluster score hasn't changed.
> > 
> > [1]: https://lore.kernel.org/all/20250325213303.826925-1-detlev.casanova@collabora.com/
> > [2]: https://lore.kernel.org/all/20200127143009.15677-5-andrzej.p@collabora.com/
> > 
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> >  drivers/staging/media/rkvdec/rkvdec-h264.c | 168 +++---
> >  drivers/staging/media/rkvdec/rkvdec-regs.h | 567 ++++++++++++++-------
> >  drivers/staging/media/rkvdec/rkvdec-vp9.c  | 239 ++++-----
> >  drivers/staging/media/rkvdec/rkvdec.c      |   1 -
> >  4 files changed, 559 insertions(+), 416 deletions(-)
> 
> [snip]

