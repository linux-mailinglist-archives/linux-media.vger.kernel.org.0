Return-Path: <linux-media+bounces-57787-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNb1MtvEy2mnLgYAu9opvQ
	(envelope-from <linux-media+bounces-57787-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 14:58:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DEB369D51
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 14:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C0CA30715C4
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E11A3E3C61;
	Tue, 31 Mar 2026 12:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CWpV19df"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A943A7840
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 12:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774961696; cv=none; b=i2bTurMf10Cy8zHERrPE+Z4X9fMLnNHkuirpUDsP7ZS5Ye5ilyTzezgre0kp7k5fnWx5gm42EKJ9NLpDS+wbhBdws3PrQoE8ynnUa9bJ2boml0urnn+WNH/9ijVfbn0/iAPS49Fts9e5uPVga/Ss3YRTA/tIni/dPKIHwruPS2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774961696; c=relaxed/simple;
	bh=ibZ6nxLNuq06q+d4TEtpxm9JQ5RE3Xuh9P+N+4MIkjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=T5346UsmlNycTI/Uh5QYbBjU+MK2X1D+odsXn+0jHYbwck/wmBknfoNXsmY/bicKb4orTaYiiW6r9uAS7ILYwI2OkPWmO3kOS9NjDNnc/uSB18Kf6N4IvBbi5LVIOCBP1SPRGCOkhs7yNB6Z439QXyzZ2PXnkEahLh/n/leKlXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CWpV19df; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260331125445euoutp029c9069bfa18f03aad91c7edb1a9ddab4~h7j-BHoYW2060720607euoutp02t
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 12:54:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260331125445euoutp029c9069bfa18f03aad91c7edb1a9ddab4~h7j-BHoYW2060720607euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774961685;
	bh=UDPXxR0SE4tZo6SAHEuDV5VawAn9RHxLdc/GV2ahcmY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=CWpV19dfi3aKCVmn65P/Kj4WMSYU8Y008v7a6iPLjcfr/70u3PHFeMS5bxMdiMZpP
	 x/IkU/FWyfkJr5Axx5dbEaTf6T8Qg4Y9YfiHyfr+sfBLQplBnBvNX4Aus8e4NcZB65
	 FW/pNTtgcFQ0o4nh7Ov1X224Nh/y5TEPxJRmUrRA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260331125445eucas1p25ed7c9b6e702e473313d0de397658d96~h7j_m4aJp0030700307eucas1p2_;
	Tue, 31 Mar 2026 12:54:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260331125442eusmtip20a0364ea267d99390b05fc4b52f918c4~h7j8E31Ay2848828488eusmtip2b;
	Tue, 31 Mar 2026 12:54:42 +0000 (GMT)
Message-ID: <46397de2-eedf-4e09-a83a-3b683d154fe7@samsung.com>
Date: Tue, 31 Mar 2026 14:54:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 0/8] dma-buf: heaps: Turn heaps into modules
To: Maxime Ripard <mripard@kernel.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Robin Murphy
	<robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>, David
	Hildenbrand <david@kernel.org>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren
	Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: Albert Esteve <aesteve@redhat.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260331125445eucas1p25ed7c9b6e702e473313d0de397658d96
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260331100026eucas1p19bdc2aaca4c9a48c6f6ac8fec71478d8
X-EPHeader: CA
X-CMS-RootMailID: 20260331100026eucas1p19bdc2aaca4c9a48c6f6ac8fec71478d8
References: <CGME20260331100026eucas1p19bdc2aaca4c9a48c6f6ac8fec71478d8@eucas1p1.samsung.com>
	<20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org>
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-57787-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.872];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33DEB369D51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 12:00, Maxime Ripard wrote:
> The recent introduction of heaps in the optee driver [1] made possible
> the creation of heaps as modules.
>
> It's generally a good idea if possible, including for the already
> existing system and CMA heaps.
>
> The system one is pretty trivial, the CMA one is a bit more involved,
> especially since we have a call from kernel/dma/contiguous.c to the CMA
> heap code. This was solved by turning the logic around and making the
> CMA heap call into the contiguous DMA code.
>
> Let me know what you think,
> Maxime
>
> 1: https://lore.kernel.org/dri-devel/20250911135007.1275833-4-jens.wiklander@linaro.org/
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>


Applied again patches 1-5 to my dma-mapping-for-next branch. I hope this time it

won't cause new problems in linux-next.


Here is a stable branch to apply remaining dma-buf heaps patches:

https://web.git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git/log/?h=dma-contig-for-7.1-modules-prep-v4


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


