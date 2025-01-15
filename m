Return-Path: <linux-media+bounces-24810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2CBA12B92
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 20:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80B003A6444
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 19:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8E21D6DD4;
	Wed, 15 Jan 2025 19:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="hXnzYSPC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752DB1D63C7
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 19:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736968411; cv=none; b=MCHlyZKDhFpjtpbVxUiSJ+H0Cq1Rm3v1P/74iCPSCKgM5RudJok4hs+YnccIz3LV5c3489bNrDEtScXBhvhxb9R7HkU1jNAJBenTlA79HXy6inp3lfDOi94daYqXNLrbfJg0eJv4DD8f292i1lS7hB0S10/UQQtyUk9HQE63d6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736968411; c=relaxed/simple;
	bh=zLPSjMEctNCr0CfmUH65A3G8flj6/XxbgTXl0MggbIs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ug9uEHwt32jg3wkqDdRu8DP4kPSDtHVpLPfGGaxSn1c5ykzCzudwS8YND4lL1AmT7rauj/R+Zsrr6kUDqb19Si+i37Q7I0aHhQkrXDl8q4fOiOhCjZSRKhJM/3oLpHIlea8Wg1klEO2MUnVrd7NerNO0cJzDUDh1rzpAC+UhHyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=hXnzYSPC; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d8f99cb0d9so1722676d6.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 11:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736968408; x=1737573208; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zLPSjMEctNCr0CfmUH65A3G8flj6/XxbgTXl0MggbIs=;
        b=hXnzYSPC4eihNC1yrlRAHKzRq0PUe65wzdLK0NBEl6AC6nso/YdqvMBXpiNY2QIUPX
         TrlYP+RZ95YdoOARkLggmCs3ToGgm8t2j5pQSozXp9ws0BsqpmcDK4aAjVYjKwUy32Jz
         lmlCRp1v7MgrkyKsYVKpbfKPQ+GzdRdbTksv1YrOZnc91mffQNoJlPyclnYczKUzJJzg
         1SwuowInPjDxIiBxlOOVOzEluuzsF9kWcxAtAtyczG5O4g4PVNkUl/lpXZbnWV7rHwh+
         oLGhMsma5j2sRYaVGBc3E+9h/5gohnsEAM6986xl6DFE90LBgCs2hReDATVv1UU7PCZN
         cwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736968408; x=1737573208;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLPSjMEctNCr0CfmUH65A3G8flj6/XxbgTXl0MggbIs=;
        b=QyDSfaKWOdy/DzTyfZ/yGjYiWYvgIABb1j0KLIDOET3WHE0jADVIb3SFFQVgukNBj6
         OFoumRUwQdkNxTki26ou3KJWhu4WONfWI1cINncXwJnPv7IhsccrHlY3XBgYIMzFozf/
         f19ojHVZojnL+czPdvxdkFVVw+1KpjqTgewDcqa/WUvNEkDff8iXOmWVyczUe4tST7Rx
         CmYPYFJlqz92zD8O6uDi0UQyjzRMcKxTGN72ZVPj3fKsiOX25Xo5TD39d8gztwiGXZKs
         qRJp+slhnT/sZy0nq9+tjL/jWJ9UjqdIhvF9bEUD+pauyug2yIjuLcf+4RTdqOrhyROz
         YD5A==
X-Forwarded-Encrypted: i=1; AJvYcCWqTdxhLg6TvXzeBnROQ/ZkH/ts00YEIzz6YcMd1WA+Q12PIx88fX6HFOYsXjXgVNinDfcKlg2rmJ0PBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFo7LDRElZFN0AiebJjxtYo/WEOMyCPHAEoNf2GkD999JD3Xpp
	LrPqY/zhpxyP94cBkp/4MODbhTRxQfSVy+C8zHFWPJuXDMCmk4q/f4Lb2lkoS6M=
X-Gm-Gg: ASbGncvAjx3eciQxk7YmtifEKCJlUY3kscFVVcTzWuPpBkC0FmwC4vwLOE81HXr+FVG
	SF7FGZwk/l05aI8Mh1fCT5Efd1agMGU4v8k0D+AmEVO5+iO0LFpN3mZQXQ/LI9zSPM5xJmo9KxB
	a5Vv3Y6GnWELvj9vp9+vOf3lWmj/pPyYT1WagFNy5q/qDrl0D6xGCjeufxTpxMSBeRpOhAMcxG+
	HVORAdsEaNha0sii4NlBKJrjWWizISqyWv+kNWMEE4zU2wr1uZ7pvp+hg==
X-Google-Smtp-Source: AGHT+IFnsoiKe7uegsgPWYDB1RCuZQrLk0csHxrvV++7dz72d6AHNX8tJjks7RFtVLA5aLi/FpTAFQ==
X-Received: by 2002:a05:6214:5192:b0:6d8:8f14:2f5b with SMTP id 6a1803df08f44-6df9b240540mr547388736d6.19.1736968408422;
        Wed, 15 Jan 2025 11:13:28 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade900c6sm67775316d6.111.2025.01.15.11.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 11:13:28 -0800 (PST)
Message-ID: <4eaae50515b46545de4ff399bc2365a3c4f9c44f.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Mikhail Rudenko <mike.rudenko@gmail.com>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 14:13:27 -0500
In-Reply-To: <87bjw9s4s3.fsf@gmail.com>
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
	 <20250103152326.GP554@pendragon.ideasonboard.com>
	 <87bjw9s4s3.fsf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 14 janvier 2025 =C3=A0 19:00 +0300, Mikhail Rudenko a =C3=A9crit=
=C2=A0:
> Hi Laurent,
>=20
> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonboa=
rd.com> wrote:
>=20
> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> > > Currently, the rkisp1 driver always uses coherent DMA allocations for
> > > video capture buffers. However, on some platforms, using non-coherent
> > > buffers can improve performance, especially when CPU processing of
> > > MMAP'ed video buffers is required.
> > >=20
> > > For example, on the Rockchip RK3399 running at maximum CPU frequency,
> > > the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
> > > malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
> > > non-coherent DMA allocation. CPU usage also decreases accordingly.
> >=20
> > What's the time taken by the cache management operations ?
>=20
> Sorry for the late reply, your question turned out a little more
> interesting than I expected initially. :)
>=20
> When capturing using Yavta with MMAP buffers under the conditions mention=
ed
> in the commit message, ftrace gives 437.6 +- 1.1 us for
> dma_sync_sgtable_for_cpu and 409 +- 14 us for
> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> buffers in this case is more CPU-efficient even when considering cache
> management overhead.
>=20
> When trying to do the same measurements with libcamera, I failed. In a
> typical libcamera use case when MMAP buffers are allocated from a
> device, exported as dmabufs and then used for capture on the same device
> with DMABUF memory type, cache management in kernel is skipped [1]
> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
> DMA_BUF_IOCTL_SYNC from userspace does not work either.
>=20
> So it looks like to make this change really useful, the above issue of
> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
> solved. I'm not an expert in this area, so any advice is kindly welcome. =
:)


The manual coherency hints are not implemented for DMABuf, and libcamera on=
ly do
dmabuf. Someone will have to look into that. This is also why this API have=
 very
low adoption, its breaks easily.

>=20
> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426
>=20
> --
> Best regards,
> Mikhail Rudenko
>=20


