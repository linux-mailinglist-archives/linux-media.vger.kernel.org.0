Return-Path: <linux-media+bounces-27183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DEFA48EEB
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 03:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25F93188A932
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 02:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4C1170A11;
	Fri, 28 Feb 2025 02:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="N8aYsYrS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC4714B08C
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 02:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740711543; cv=none; b=bJ/jmxiCjcMkDTvpb9mm34o4b/1ElxMMcm2J+adXwCGRsxWrA1jptrEjx/QYax6OjREAZMWV13D1eFxNg2ZTPhISd2Tow0R2EYibheE0qD3GY+hdWadzjZkTBkoL24kxkTQbEkKB3SD+z5Aq1BMEYKfgsNdFD6TiO73vgIzx+4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740711543; c=relaxed/simple;
	bh=qSBTER3/6mKcsokqpGzyM31jx70vagZLM9xlfjyEBPw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VKPfopUgcB3JdYHcy69EMPTYARmEVa45b84tq5PSowWMzwZn5VycBLKIS8GNDS1PpbRO3dZMhT5sA4dcy6O3tlvHriNcc81xj9EDbgiqALtpbXmlen5FvAAq/H2M/4y4z1tXNo7Dtco2cohHM3B+z3I8SlXPN6pixEnqRDzDCEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=N8aYsYrS; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-472180fec01so17306291cf.0
        for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 18:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1740711541; x=1741316341; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qSBTER3/6mKcsokqpGzyM31jx70vagZLM9xlfjyEBPw=;
        b=N8aYsYrSQyxv7sbbzjtkdgtHqkmOnzGaaQhJiaCFAIVSnflFDCy0BmnSiwTR5QEGcm
         UQc9oMHukPI6zYxba9NjwSi03o1aeu2yuYcl8JmbWnUQiSsiYNmdIYWav88JGZuVEA9F
         wWCERODUhn8BcxGvmXJgs2OnWQydNSkeKdT0hL80+HAti/1xP4V2fB4Z00GoHSgdFfXa
         ZZ4FGN82p8SWcgbVIASt8kGjkMxIFr8qg+R81rx1Al4Oe1fKb0csYFI3NQjKODoh16su
         tKJ1B7KZn6ehA9uN9WXGY/onT0CiCaDbPbGOorGp4EaPv3H/W6xGLcvf1DPrrQv7lHBp
         9Q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740711541; x=1741316341;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSBTER3/6mKcsokqpGzyM31jx70vagZLM9xlfjyEBPw=;
        b=k4mcMDcjVYBRW6Xmytuyv0sNjHzQpjMdTtxQ03lt7jFOwY9q3WPzYcnXqaU9DpGQG8
         MNIcB+4AA335JAt7uFjC2cdScvVRAuJZV+4beGt9QcS0yggm73HkrgtIeAadw6ka4iDq
         GSn60xYt2Jo1J861/Dd9Njd1+aTuEhBUntAbDwhhqV+8sG2kTLTYIHG3UxFkCEfM4eHP
         EguFlLo/ioLXTnthz7dyg9gLSC7Pwy2W+JfL8rFoFnlYp4W3VjLtJ30DSsb+RSvuWVMh
         Cm6dYj9NZ7kNXUKRa6GZ0ZhTyXisCGrLDAhfPniRX9edsITC3PGp4yDtJsNL96wPn40u
         PEFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk1NHGe1WqqGtI/SpIpBmril7fToGIoIZ7aE0QQkctUpDLtQNh//aQEMNZDkCk15RP5y6tUzUdC3VtbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpJF8En93ae/zXIp6Gr9QN2hPSbqIcwSlhfenzwlZcrOvUA7tr
	trfJuoO/tiI3oqCWvyPZ6OoFYrs9Y/nILw31bgcNuFLR4LInimCEaHEiJCXTY32g5Beh2uwYwx9
	Gz1I=
X-Gm-Gg: ASbGncuMfc66wrV4mPFHOK7o0+WgTL3yZJnesN0kIUpp8mGMck/8VuTy7YtdwyiFsKl
	2xoS1eO97kuZKTrrX6S3K/JND6UXyRtnRbvvy4PYtzKktRMaPa70sVuvfRtu4WoR9a8LHoyZrhY
	XT3ZBSGHoxYtjinBsozyi7bYmLrFCUSrF/m8LrgjW56+NBLOqFhUelo+1BINrj/WKi9PwKZDo6W
	j9TacgSbiY/5xW78HfG72rlZ5VenKWVC/iVw+ZKQuRVxD1xzaWm7V3sHAVSsNawdo56EM3s10Db
	yt+IP255+oi6rUl6iG6JaSagUGIE6V8=
X-Google-Smtp-Source: AGHT+IHlmHYcYowccW6oMzhl/5F1nvmS0h6Fr8h9oiJzFfTp+G2Z6/HSCK7vqLoUyP0oP4vUaAgFIA==
X-Received: by 2002:a05:622a:130f:b0:474:b7b3:1409 with SMTP id d75a77b69052e-474bc0e8807mr21017291cf.40.1740711541046;
        Thu, 27 Feb 2025 18:59:01 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474691a45d3sm18957301cf.8.2025.02.27.18.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 18:58:59 -0800 (PST)
Message-ID: <2b0bbccdbbc30c8587f2e3b2ee7bb0a4a1225e20.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Mikhail Rudenko <mike.rudenko@gmail.com>, Jacopo Mondi
	 <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld	
 <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 27 Feb 2025 21:58:58 -0500
In-Reply-To: <87ldtraz5v.fsf@gmail.com>
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
	 <20250103152326.GP554@pendragon.ideasonboard.com>
	 <87bjw9s4s3.fsf@gmail.com>
	 <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
	 <87ldtraz5v.fsf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 27 f=C3=A9vrier 2025 =C3=A0 23:46 +0300, Mikhail Rudenko a =C3=A9c=
rit=C2=A0:
> Hi Jacopo,
>=20
> On 2025-02-27 at 18:05 +01, Jacopo Mondi <jacopo.mondi@ideasonboard.com> =
wrote:
>=20
> > Hi Mikhail
> >=20
> > On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
> > >=20
> > > Hi Laurent,
> > >=20
> > > On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideaso=
nboard.com> wrote:
> > >=20
> > > > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> > > > > Currently, the rkisp1 driver always uses coherent DMA allocations=
 for
> > > > > video capture buffers. However, on some platforms, using non-cohe=
rent
> > > > > buffers can improve performance, especially when CPU processing o=
f
> > > > > MMAP'ed video buffers is required.
> > > > >=20
> > > > > For example, on the Rockchip RK3399 running at maximum CPU freque=
ncy,
> > > > > the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer =
to a
> > > > > malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when u=
sing
> > > > > non-coherent DMA allocation. CPU usage also decreases accordingly=
.
> > > >=20
> > > > What's the time taken by the cache management operations ?
> > >=20
> > > Sorry for the late reply, your question turned out a little more
> > > interesting than I expected initially. :)
> > >=20
> > > When capturing using Yavta with MMAP buffers under the conditions men=
tioned
> > > in the commit message, ftrace gives 437.6 +- 1.1 us for
> > > dma_sync_sgtable_for_cpu and 409 +- 14 us for
> > > dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> > > buffers in this case is more CPU-efficient even when considering cach=
e
> > > management overhead.
> > >=20
> > > When trying to do the same measurements with libcamera, I failed. In =
a
> > > typical libcamera use case when MMAP buffers are allocated from a
> > > device, exported as dmabufs and then used for capture on the same dev=
ice
> > > with DMABUF memory type, cache management in kernel is skipped [1]
> > > [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], s=
o
> > > DMA_BUF_IOCTL_SYNC from userspace does not work either.
> > >=20
> > > So it looks like to make this change really useful, the above issue o=
f
> > > cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
> > > solved. I'm not an expert in this area, so any advice is kindly welco=
me. :)
> >=20
> > It would be shame if we let this discussion drop dead.. cache
> > management policies are relevant for performances, specifically for
> > cpu access, and your above 7.7ms vs 1.1 ms test clearly shows that.
> >=20
> > >=20
> > > [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/video=
buf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> >=20
> > I would like to know from Hans if the decision to disallow cache-hints
> > for dmabuf importers is a design choice or is deeply rooted in other
> > reasons I might be missing.
> >=20
> > I'm asking because the idea is for libcamera to act solely as dma-buf
> > importer, the current alloc-export-then-import trick is an helper for
> > applications to work around the absence of a system allocator.
> >=20
> > If the requirement to disable cache-hints for importers cannot be
> > lifted, for libcamera it means we would not be able to use it.
>=20
> Meanwhile, I have posted a patch, which re-enables cache management ops
> for non-coherent dmabufs exported from dma-contig allocator [1]. It is
> currently waiting for review.
>=20
> [1] https://lore.kernel.org/all/20250128-b4-rkisp-noncoherent-v3-1-baf39c=
997d2a@gmail.com/

Thanks for you work, this matches what I was referring to missing in my
previous reply.

I don't think there is any intention to block or deprecate it, but
partially enabling leads to problems. Do we need something in the SG
allocator to ?

Nicolas

>=20
> >=20
> > > [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/video=
buf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> > > [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/video=
buf2/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n=
426
> > >=20
> > > --
> > > Best regards,
> > > Mikhail Rudenko
> > >=20
>=20
>=20
> --
> Best regards,
> Mikhail Rudenko
>=20


