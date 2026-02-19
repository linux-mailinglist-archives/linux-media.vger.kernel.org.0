Return-Path: <linux-media+bounces-53072-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKjQMCGVlmkZhwIAu9opvQ
	(envelope-from <linux-media+bounces-53072-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 05:44:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A67115C0CF
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 05:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3150F303C2AC
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 04:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B92029B78D;
	Thu, 19 Feb 2026 04:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kcP4+gNS"
X-Original-To: linux-media@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D9A298CC4
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 04:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771476226; cv=none; b=s+s0BJO6+K5uxN5XTHQmDUSpKSnpRCsB7lwkkhp9FXmTh5QrZAOcNm5eeBSMpwdjIYxzfuR0YfXMuTqlwuDSwv0eO2x8opMu1yC23749FAXB4Z60vL9b/Ue+ASpF05925qCCE4qeq1yYBwgW8HwtFHo+KX0qj/uXSYgIU6fm7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771476226; c=relaxed/simple;
	bh=pratuVAOGf7bq6R4P7Fll7ZSA31+JBME/ICQsdRNRTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OdcMMzErSc/R20vUeQ7SJji4JRH0GiCZRLBFKbUMAhWw8PyHPiE6SnLbUQCSHKozP/UdTEVJhomOSp4TNDAxucJ5UkXeiYkpoLHsVo/tFPr3KdvD7zLXLZCWxqCoi3sa/9uxnJKonkDpWg8TG9ud8xvvVePtiRkfc8EfOzGPXoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kcP4+gNS; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <7b4d9e08-122b-4c4b-868e-d48ec0f59dce@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771476212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MzIYd8Bu6oYmjdq1gkTQwThMj3+Mr0OUwvt9JYbMgDg=;
	b=kcP4+gNSFzT9Ojfg+u/nAE86J7X1YCQaUm0MRgc4M1bbjaYv/sUhB2LoobSiDSzjlxTWYK
	cq1k7BbKRZCoRq80TBaGDCvJFTcp1jqbhrIUqKDk6pGLptfmyFaHzocLljJ1A5I4KeSLFf
	KYzXLrMumHfN0sB8IyBtf5Df95DLUeI=
Date: Wed, 18 Feb 2026 20:43:26 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
To: Shunsuke Mie <mie@igel.co.jp>, Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jianxin Xiong <jianxin.xiong@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Sean Hefty <sean.hefty@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, dhobsong@igel.co.jp, taki@igel.co.jp,
 etom@igel.co.jp
References: <20211122110817.33319-1-mie@igel.co.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20211122110817.33319-1-mie@igel.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[igel.co.jp,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53072-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yanjun.zhu@linux.dev,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:mid,linux.dev:dkim,spinics.net:url]
X-Rspamd-Queue-Id: 2A67115C0CF
X-Rspamd-Action: no action

在 2021/11/22 3:08, Shunsuke Mie 写道:
> This patch series add a dma-buf support for rxe driver.
> 
> A dma-buf based memory registering has beed introduced to use the memory
> region that lack of associated page structures (e.g. device memory and CMA
> managed memory) [1]. However, to use the dma-buf based memory, each rdma
> device drivers require add some implementation. The rxe driver has not
> support yet.
> 
> [1] https://www.spinics.net/lists/linux-rdma/msg98592.html
> 
> To enable to use the dma-buf memory in rxe rdma device, add some changes
> and implementation in this patch series.
> 
> This series consists of two patches. The first patch changes the IB core
> to support for rdma drivers that has not dma device. The secound patch adds
> the dma-buf support to rxe driver.
> 
Hi, Shunsuke Mie

I was revisiting your 2021 proposal around dma-buf integration with RDMA 
and the related discussions at the time.

As you know, dma-buf usage in RDMA-related workflows has gained more 
traction recently, and we are seeing increasing interest in 
heterogeneous memory and cross-device buffer sharing. Given the changes 
in the ecosystem since then, I’m wondering whether you think the 
original direction might be worth reconsidering.

Do you have any interest in continuing that line of work, or updating 
the design based on today’s context? If not, I’d still appreciate your 
perspective on what you see as the main blockers from the previous 
discussions, and whether you think the landscape has changed enough to 
justify another attempt.

Depending on the direction, we may consider exploring dma-buf support in 
rxe or at the core level, but I’d prefer to first understand your view 
before moving forward.

Zhu Yanjun

> Related user space RDMA library changes are provided as a separate patch.
> 
> v4:
> * Fix warnings, unused variable and casting
> v3: https://www.spinics.net/lists/linux-rdma/msg106776.html
> * Rebase to the latest linux-rdma 'for-next' branch (5.15.0-rc6+)
> * Fix to use dma-buf-map helpers
> v2: https://www.spinics.net/lists/linux-rdma/msg105928.html
> * Rebase to the latest linux-rdma 'for-next' branch (5.15.0-rc1+)
> * Instead of using a dummy dma_device to attach dma-buf, just store
>    dma-buf to use software RDMA driver
> * Use dma-buf vmap() interface
> * Check to pass tests of rdma-core
> v1: https://www.spinics.net/lists/linux-rdma/msg105376.html
> * The initial patch set
> * Use ib_device as dma_device.
> * Use dma-buf dynamic attach interface
> * Add dma-buf support to rxe device
> 
> Shunsuke Mie (2):
>    RDMA/umem: Change for rdma devices has not dma device
>    RDMA/rxe: Add dma-buf support
> 
>   drivers/infiniband/core/umem_dmabuf.c |  20 ++++-
>   drivers/infiniband/sw/rxe/rxe_loc.h   |   2 +
>   drivers/infiniband/sw/rxe/rxe_mr.c    | 113 ++++++++++++++++++++++++++
>   drivers/infiniband/sw/rxe/rxe_verbs.c |  34 ++++++++
>   include/rdma/ib_umem.h                |   1 +
>   5 files changed, 166 insertions(+), 4 deletions(-)
> 


