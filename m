Return-Path: <linux-media+bounces-58546-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNXFDa7v2GnxjwgAu9opvQ
	(envelope-from <linux-media+bounces-58546-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:40:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7CC3D7788
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96CE33039BF0
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E293DEAE0;
	Fri, 10 Apr 2026 12:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NqtE3ZUG"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A093F3CF026
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 12:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823653; cv=none; b=BOu9iKKN5ju/xwK2+CCJ3j1uPGIpsR3GLggbx86CD/SgR8422bht1N6OGki2Bid5BAJyVuy2sT6/ApRja9MmVPxNz+3Qmpsow/LhDEifwRVqgxIcNJKfU8D+CFhk9QmPWXLciGdJTonmn/VvhJCfwWvM7DeHMZbM4mwai7/FMSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823653; c=relaxed/simple;
	bh=51YK6I53KlWTkGpTMwW2r2N8AZPPMihRKqkSq8enjS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=quoqEX24SAS1TMRfkRsk/QUaAah63fbT+yXB78az+lu1k8IIa45rjIEsfxq3Pu48CXa3+SHSZqm4gvZdG8ReqJbHdiyhs8aTt5uLRNOBlefOy9/A5j+dbTyYyw4uMzEutld/flOEJku/o+l1Z7fsD62vVTyphfk8GVlqt3OQDh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NqtE3ZUG; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260410122049euoutp023422146a5529b2806e13f3824c820ab3~k-jNeIHAK1979919799euoutp026
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 12:20:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260410122049euoutp023422146a5529b2806e13f3824c820ab3~k-jNeIHAK1979919799euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1775823649;
	bh=lN5zWO6+anmGDngLkOfFZEph7VAV3nISscwbspgkQFg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=NqtE3ZUGhjK5b+8l3UJojriJ5nrit/EwmaDAMcMN1Br+4xN1xUNTVGwRO9rgOuFEb
	 Bx2jTuJ8f+oN9wlq+XE/SWAFwLerZjUb96fqzAMZHDkFsEJdpJG3ASlCz+YzeKizNO
	 GJFKrCnlGUMsKgU/vRZdu0YCgkUV/c9nFfJj/i48=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260410122049eucas1p2207046638096d1540b23f0a14d6169ac~k-jNEfoaG3206132061eucas1p2p;
	Fri, 10 Apr 2026 12:20:49 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260410122047eusmtip17c8b02f981e525f46be03f8d2d0e134f~k-jLa09If3110231102eusmtip1Z;
	Fri, 10 Apr 2026 12:20:47 +0000 (GMT)
Message-ID: <9e3f7066-f147-4854-b662-9027fa7d3c80@samsung.com>
Date: Fri, 10 Apr 2026 14:20:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] dma-buf: heaps: system: document system_cc_shared
 heap
To: Sumit Semwal <sumit.semwal@linaro.org>, Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
	tjmercier@google.com, christian.koenig@amd.com, robin.murphy@arm.com,
	jgg@ziepe.ca, leon@kernel.org, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAO_48GFt21rv0PJd2Csa0O4OEpN053_p__4Zux+m7jQdHSagEg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260410122049eucas1p2207046638096d1540b23f0a14d6169ac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260410121457eucas1p1450d22bb1d09d9978fe68e801d8c2a58
X-EPHeader: CA
X-CMS-RootMailID: 20260410121457eucas1p1450d22bb1d09d9978fe68e801d8c2a58
References: <20260407092617.635223-1-jiri@resnulli.us>
	<CGME20260410121457eucas1p1450d22bb1d09d9978fe68e801d8c2a58@eucas1p1.samsung.com>
	<CAO_48GFt21rv0PJd2Csa0O4OEpN053_p__4Zux+m7jQdHSagEg@mail.gmail.com>
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58546-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[samsung.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DF7CC3D7788
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 14:14, Sumit Semwal wrote:
> On Tue, 7 Apr 2026 at 14:56, Jiri Pirko <jiri@resnulli.us> wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Document the system_cc_shared dma-buf heap that was introduced
>> recently. Describe its purpose, availability conditions and
>> relation to confidential computing VMs.
>>
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> Reviewed-by: T.J.Mercier <tjmercier@google.com>
> Thank you for the patch!
>
> Marek: Since you're taking the dependent patches through your tree,
> could you please use:
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> and take this as well?

Yes, sure. Applied to dma-mapping-for-next. Thanks!

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


