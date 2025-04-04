Return-Path: <linux-media+bounces-29384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E967CA7BA17
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 11:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E4963B347A
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 09:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11551B4232;
	Fri,  4 Apr 2025 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Fmnwubo2"
X-Original-To: linux-media@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2459516132F
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759563; cv=none; b=AGAv003cz/ajaiaVXG8xSaz83B6Wr6H0t9UM3bQBiIpK2IJraAHmuyaaa6aXhn49LvwXG2r8lQRn8HDMRi1K8UHcR3QpxejvdsOpOdA38zijAlZN0SUaX/IVnBLTh4VK5o6DRSgKrb/LUDBGOCdp86Czk/Z9CCv/uPjohQ4Q1CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759563; c=relaxed/simple;
	bh=JsO2DCBi+8esMKHuOLikLhu2OLtnCeJi3aVwUcFStVo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=s/T8BI9wGljNbgZoqHuUYSHoSSmfSEQJIfwTSecJMtq5a6jaN8v0j+T9cnxIhD/uAxnkHeuaSEUqNOi388A1dGVKKoBSAD6xQps/oJdkF0IQR6+F3owL5Kkojk6Gvrx7tCM3eit9vfLuOhNdC4+XjXrwxoXgYdhZQm0GYf/tP0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Fmnwubo2; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743759557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvCbJgJnFGne+TAMBgY6cQ6iJ4WbAlnhHeP54hSBG3U=;
	b=Fmnwubo2TjnwNa23ZsXq1DE1aQDCxDMZQTSrFaDHVwxBUA4J7T93QPMm4Mpo25S6FDBWbe
	hXnzoy6iMBRZc/lE9/ZTBBkQdIyDbrfWZG45bfRlKvTTSNLK55OyHl+b9lko2taHXfZnfn
	MDBdQ6PxRyGu3r5IhprHpajQ+cgmImM=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP is broken, was Re: [RFC
 PATCH 0/6] Deep talk about folio vmap
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20250404090111.GB11105@lst.de>
Date: Fri, 4 Apr 2025 17:38:35 +0800
Cc: Huan Yang <link@vivo.com>,
 bingbu.cao@linux.intel.com,
 Matthew Wilcox <willy@infradead.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org,
 opensource.kernel@vivo.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A899641-BDED-4773-B349-56AF1DD58B21@linux.dev>
References: <20250327092922.536-1-link@vivo.com>
 <20250404090111.GB11105@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Migadu-Flow: FLOW_OUT



> On Apr 4, 2025, at 17:01, Christoph Hellwig <hch@lst.de> wrote:
>=20
> After the btrfs compressed bio discussion I think the hugetlb changes =
that
> skip the tail pages are fundamentally unsafe in the current kernel.
>=20
> That is because the bio_vec representation assumes tail pages do =
exist, so
> as soon as you are doing direct I/O that generates a bvec starting =
beyond
> the present head page things will blow up.  Other users of bio_vecs =
might
> do the same, but the way the block bio_vecs are generated are very =
suspect
> to that.  So we'll first need to sort that out and a few other things
> before we can even think of enabling such a feature.
>=20

I would like to express my gratitude to Christoph for including me in =
the
thread. I have carefully read the cover letter in [1], which indicates
that an issue has arisen due to the improper use of `vmap_pfn()`. I'm
wondering if we could consider using `vmap()` instead. In the HVO =
scenario,
the tail struct pages do **exist**, but they are read-only. I've =
examined
the code of `vmap()`, and it appears that it only reads the struct page.
Therefore, it seems feasible for us to use `vmap()` (I am not a expert =
in
udmabuf.). Right?

[1] =
https://lore.kernel.org/linux-mm/20250327092922.536-1-link@vivo.com/T/#m05=
5b34978cf882fd44d2d08d929b50292d8502b4

Thanks,
Muchun.


