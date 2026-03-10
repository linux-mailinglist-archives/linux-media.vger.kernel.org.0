Return-Path: <linux-media+bounces-55213-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J8JHSg6sGlbhQIAu9opvQ
	(envelope-from <linux-media+bounces-55213-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:35:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 513B6253A7C
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5A333028EBB
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98A5399352;
	Tue, 10 Mar 2026 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="A8lYc8QR"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012054.outbound.protection.outlook.com [52.101.43.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A607D39BFF8;
	Tue, 10 Mar 2026 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156886; cv=fail; b=WYWKknHCLYc8m0S1WKikTagCP/DF1t+Nhp+rmTTk6e+3RnRij3CQ6i2o7WWib9RuR5JEvZ82Zj75D9G8j8xOxtbgvSR/hMICEaK8aKvVX2NwekPeMRPpVjNroqTSFV/DGTayZXkl12OJtQp/MC54yCV+/z0g7Y0Q7bFM7utXAKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156886; c=relaxed/simple;
	bh=ztfVdTjMdDdvFJxwtc7IGG2heUVJZ/NS5uFpl3OGRHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=COBwRBGnsqE0Riqh57w2A/LtxD/Teh7hNjoaYambPF0xCteWegQtGQ8htdZZbcqfQER7YzxvLFEyUbtO/+82nt33jJRdZirHoxUCIZX1PTGx9HEbjI4xvD82+wS3TxcEzAR+yyQN+xhglfjhVkWa8/inculmT4++SFhGfF6MwYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=A8lYc8QR; arc=fail smtp.client-ip=52.101.43.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YILgGN6/uSmRutnidDvtIvIml8f4bbzWHJv20RsJ34/dLyKE466vRRF/6ZvIyy3g/YXVbrFa28UizOPzbW2DtMulXyd5ZNgtC8K8IDh94O+LUDXEge0BcohvX8rDcZuvgVI/RKx18hCyI6OYFMEtImIR75gBOqPlt4ZOxk0I7mGPjwaVh9qGA5/4+jZtMErKw+ePk4GwtWGbZ3NMydQUi7HIHiEnjEa2YZ6HdtQKXurCWwEuOJB4Re51tl5PsROqxpe/mB+dYk1irbb5X3xEh1l1Mp6Iab1MtnEz5h7Xk7rB6IfHVPlOZjiSa/k4eu8tA1DzZUPlWfNHOX2j8gnZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2AaZnQLnpPcSA+JWcw3kkQ6xeSrSj0uk3s8CywBsQc=;
 b=rvlDhXh1ry5ylEshmmkaPF+6Yj1Cw7Qbxfnx6tVwnK5W0vvnRk4qjdJoTjoPwGKfsqDQpb7BbdqpIgVoe+SNV1lbbBI6qbR4d1rQDTiQGeCWN7QwhqAyOf+3ma+JDMwGyEw5bFum5T2JIoa3CPjrDnMyPh+l+fH1lr1u41TLIYQtM4Lf7xrncUORzi++NCGTnFjTrU2rt58enjd9r+53rS8oUpyFW9W3eFCVQj7QK3co92++Dsoiev/VKFbCOS9Yyi9G31tpC9NnGFVhvaWqwW6M9Q8+GgKeRnFt+1dHPS/sUMDhLt3O4147ngYOAZFfB6tE26z71d/8aj8XTUJauA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=redhat.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2AaZnQLnpPcSA+JWcw3kkQ6xeSrSj0uk3s8CywBsQc=;
 b=A8lYc8QRizamTOyo1RKSBFn6ERFZUq1J+fGkiVBiZtOKTSMm6kkzEcPk9celYOhQm/uW1Y6PVOA+I5Rc1TCtsFgam9Rmt3W44HZ6/kxczgLyMa6Uau85sKrRxYA/4ER+sy9MaVNtHl3SG+S27jQJYMrqTJy+9e1dPdAW2bQV1n4=
Received: from SJ0PR03CA0142.namprd03.prod.outlook.com (2603:10b6:a03:33c::27)
 by DS7PR10MB4944.namprd10.prod.outlook.com (2603:10b6:5:38d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 15:34:38 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::75) by SJ0PR03CA0142.outlook.office365.com
 (2603:10b6:a03:33c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 15:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 15:34:37 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 10:34:35 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 10:34:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 10:34:34 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62AFYY9W2812578;
	Tue, 10 Mar 2026 10:34:34 -0500
Message-ID: <e8dd476f-1be8-46fa-bf56-65fe0bfe29a1@ti.com>
Date: Tue, 10 Mar 2026 10:34:33 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
To: Albert Esteve <aesteve@redhat.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<iommu@lists.linux.dev>, <devicetree@vger.kernel.org>, <mripard@redhat.com>,
	<echanude@redhat.com>
References: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
 <20260306-b4-dmabuf-heap-coherent-rmem-v3-5-3d00d36c9bc4@redhat.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260306-b4-dmabuf-heap-coherent-rmem-v3-5-3d00d36c9bc4@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|DS7PR10MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b8ebc8-e234-46c7-1dc3-08de7eba89f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	tcqjnseasKEOY2wQ9XFrxski1FHIYPs4Jdn/AlktXjEyzSDEsYnW8sPN0X0VXjXjBSuWF0yeXVHYPpif65RQaj90Gm1BoeFafXt2L70UsyOATtLY2IuTRu7pjMDm0x49fWVczJWLnwgC47oCc7WUXAM9Mw6ejmCMEVWAMREBOO1fjGW9lUmtphv0J5yhaz74ZYLh3h6QY1Bgpaj/vjaK60OEIEdCuAnpnZBJ1NxckEDNlp7BcwnLWW5+oE0Z0n+/Y2f0Vxv5YO/awspkaYC07S6OyEfahA3f/gydWw4qan0BwWMh+B+3E9IT92DkWDJFZQlYFDSHjTYcow8BAPOXt5Nq2yakV+DNm0p8RP0gaK2xHL0Jrv2U1oE0ICQ+jr+ymgwTZL1rO7Y17Han30zOVpTh+4Vkw/7udauJKGEO/+ZlEoDXQFkDaANKHRi/OSOw2ZtEccftNPuZbzh0cqMR4hOSogOIVwgv6uQskuiQr/zZ3d/myhyTHlnoVV+2Vk152KoeGO938zPQKifaYFRF7Td5PNwA/FRNLYtzfIoeJnK1PNVa33RLD5lJUaDimFSl0VRZZacSbWaR0D2CngqwwtEYPzKHO1nso6NK1j3VLQzSCB9zBv4WFc5VL23DYzgTQ0kC+xw59E+Ht6QPVOvf/Nm10Q+qecTznYLu7gD7hKG+aI/bXfjROvrXxIV5b3K+i+jEkgGrw0YfDsRlrk2nhN88pEVnAr0h5i8Z0Cs/9lDFFbsL6VKMcCE7N3wq4AlXnwKU4/jEWU2zpC+beJpbqhBl6+MIv+fv9luFoDWkwzkCA+FbvVAneFDBqMPJaTRB
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cIXd+8UulmdQ0SfuuzZ1w0Oq64BgKldNVRFVN5C0L04fsirfCOGxfsrmnzWJqlChfiXL2b6fH4A1bOR2yvYtCVj1+QI8Rs2Re/Pi+2k0cUSYFeEV09aP8yq2rdhgBu+z2AcqiJ8AJmIGq42uY34D/Zj8uh5DgZfR6lHOltbmHTDwt25qagDjDaYNBDYU7r/UdSw54SlmwXGb0aUn3OI4MKs2Cqsnf9Te445Fajmqhy5ye3Y0oqf1WY7RJW7tBWVnBzxk0QgbtkRLJPlcfbD/J9x2FVjA8jO41I8WPZmJpcf9vMQOLjm1pLuWLRI2o0Jx0mJL14yhwAo3SthaEX+RdiDOtB/DV1S4jqtjQ2e1BLqq+fwqv6P3SOoIzhqA42rHwdLtfxZecxcCOuXqp6EoAfwyGH39U67goyRaGVSCTeOqEcqqOMx7NerfEsRXxech
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 15:34:37.5699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b8ebc8-e234-46c7-1dc3-08de7eba89f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4944
X-Rspamd-Queue-Id: 513B6253A7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55213-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Action: no action

On 3/6/26 4:36 AM, Albert Esteve wrote:
> Expose DT coherent reserved-memory pools ("shared-dma-pool"
> without "reusable") as dma-buf heaps, creating one heap per
> region so userspace can allocate from the exact device-local
> pool intended for coherent DMA.
> 
> This is a missing backend in the long-term effort to steer
> userspace buffer allocations (DRM, v4l2, dma-buf heaps)
> through heaps for clearer cgroup accounting. CMA and system
> heaps already exist; non-reusable coherent reserved memory
> did not.
> 
> The heap binds the heap device to each memory region so
> coherent allocations use the correct dev->dma_mem, and
> it defers registration until module_init when normal
> allocators are available.
> 
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>   drivers/dma-buf/heaps/Kconfig         |   9 +
>   drivers/dma-buf/heaps/Makefile        |   1 +
>   drivers/dma-buf/heaps/coherent_heap.c | 414 ++++++++++++++++++++++++++++++++++
>   3 files changed, 424 insertions(+)
> 
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index a5eef06c42264..aeb475e585048 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -12,3 +12,12 @@ config DMABUF_HEAPS_CMA
>   	  Choose this option to enable dma-buf CMA heap. This heap is backed
>   	  by the Contiguous Memory Allocator (CMA). If your system has these
>   	  regions, you should say Y here.
> +
> +config DMABUF_HEAPS_COHERENT
> +	bool "DMA-BUF Coherent Reserved-Memory Heap"
> +	depends on DMABUF_HEAPS && OF_RESERVED_MEM && DMA_DECLARE_COHERENT
> +	help
> +	  Choose this option to enable coherent reserved-memory dma-buf heaps.
> +	  This heap is backed by non-reusable DT "shared-dma-pool" regions.
> +	  If your system defines coherent reserved-memory regions, you should
> +	  say Y here.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
> index 974467791032f..96bda7a65f041 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,3 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0
>   obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
>   obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_COHERENT)	+= coherent_heap.o
> diff --git a/drivers/dma-buf/heaps/coherent_heap.c b/drivers/dma-buf/heaps/coherent_heap.c
> new file mode 100644
> index 0000000000000..55f53f87c4c15
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/coherent_heap.c
> @@ -0,0 +1,414 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF heap for coherent reserved-memory regions
> + *
> + * Copyright (C) 2026 Red Hat, Inc.
> + * Author: Albert Esteve <aesteve@redhat.com>
> + *
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/dma-map-ops.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/highmem.h>
> +#include <linux/iosys-map.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/vmalloc.h>
> +
> +struct coherent_heap {
> +	struct dma_heap *heap;
> +	struct reserved_mem *rmem;
> +	char *name;
> +};
> +
> +struct coherent_heap_buffer {
> +	struct coherent_heap *heap;
> +	struct list_head attachments;
> +	struct mutex lock;
> +	unsigned long len;
> +	dma_addr_t dma_addr;
> +	void *alloc_vaddr;
> +	struct page **pages;
> +	pgoff_t pagecount;
> +	int vmap_cnt;
> +	void *vaddr;
> +};
> +
> +struct dma_heap_attachment {
> +	struct device *dev;
> +	struct sg_table table;
> +	struct list_head list;
> +	bool mapped;
> +};
> +
> +static int coherent_heap_attach(struct dma_buf *dmabuf,
> +				struct dma_buf_attachment *attachment)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	struct dma_heap_attachment *a;
> +	int ret;
> +
> +	a = kzalloc_obj(*a);
> +	if (!a)
> +		return -ENOMEM;
> +
> +	ret = sg_alloc_table_from_pages(&a->table, buffer->pages,
> +					buffer->pagecount, 0,
> +					buffer->pagecount << PAGE_SHIFT,
> +					GFP_KERNEL);
> +	if (ret) {
> +		kfree(a);
> +		return ret;
> +	}
> +
> +	a->dev = attachment->dev;
> +	INIT_LIST_HEAD(&a->list);
> +	a->mapped = false;
> +
> +	attachment->priv = a;
> +
> +	mutex_lock(&buffer->lock);
> +	list_add(&a->list, &buffer->attachments);
> +	mutex_unlock(&buffer->lock);
> +
> +	return 0;
> +}
> +
> +static void coherent_heap_detach(struct dma_buf *dmabuf,
> +				 struct dma_buf_attachment *attachment)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	struct dma_heap_attachment *a = attachment->priv;
> +
> +	mutex_lock(&buffer->lock);
> +	list_del(&a->list);
> +	mutex_unlock(&buffer->lock);
> +
> +	sg_free_table(&a->table);
> +	kfree(a);
> +}
> +
> +static struct sg_table *coherent_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> +						  enum dma_data_direction direction)
> +{
> +	struct dma_heap_attachment *a = attachment->priv;
> +	struct sg_table *table = &a->table;
> +	int ret;
> +
> +	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> +	if (ret)
> +		return ERR_PTR(-ENOMEM);
> +	a->mapped = true;
> +
> +	return table;
> +}
> +
> +static void coherent_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
> +					struct sg_table *table,
> +					enum dma_data_direction direction)
> +{
> +	struct dma_heap_attachment *a = attachment->priv;
> +
> +	a->mapped = false;
> +	dma_unmap_sgtable(attachment->dev, table, direction, 0);
> +}
> +
> +static int coherent_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> +						  enum dma_data_direction direction)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	struct dma_heap_attachment *a;
> +
> +	mutex_lock(&buffer->lock);
> +	if (buffer->vmap_cnt)
> +		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
> +
> +	list_for_each_entry(a, &buffer->attachments, list) {
> +		if (!a->mapped)
> +			continue;
> +		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
> +	}
> +	mutex_unlock(&buffer->lock);
> +
> +	return 0;
> +}
> +
> +static int coherent_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
> +						enum dma_data_direction direction)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	struct dma_heap_attachment *a;
> +
> +	mutex_lock(&buffer->lock);
> +	if (buffer->vmap_cnt)
> +		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
> +
> +	list_for_each_entry(a, &buffer->attachments, list) {
> +		if (!a->mapped)
> +			continue;
> +		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
> +	}
> +	mutex_unlock(&buffer->lock);
> +
> +	return 0;
> +}
> +
> +static int coherent_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	struct coherent_heap *coh_heap = buffer->heap;
> +	struct device *heap_dev = dma_heap_get_dev(coh_heap->heap);
> +
> +	return dma_mmap_coherent(heap_dev, vma, buffer->alloc_vaddr,
> +				 buffer->dma_addr, buffer->len);
> +}
> +
> +static void *coherent_heap_do_vmap(struct coherent_heap_buffer *buffer)
> +{
> +	void *vaddr;
> +
> +	vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE_KERNEL);
> +	if (!vaddr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return vaddr;
> +}
> +
> +static int coherent_heap_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	void *vaddr;
> +	int ret = 0;
> +
> +	mutex_lock(&buffer->lock);
> +	if (buffer->vmap_cnt) {
> +		buffer->vmap_cnt++;
> +		iosys_map_set_vaddr(map, buffer->vaddr);
> +		goto out;
> +	}
> +
> +	vaddr = coherent_heap_do_vmap(buffer);
> +	if (IS_ERR(vaddr)) {
> +		ret = PTR_ERR(vaddr);
> +		goto out;
> +	}
> +
> +	buffer->vaddr = vaddr;
> +	buffer->vmap_cnt++;
> +	iosys_map_set_vaddr(map, buffer->vaddr);
> +out:
> +	mutex_unlock(&buffer->lock);
> +
> +	return ret;
> +}
> +
> +static void coherent_heap_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +
> +	mutex_lock(&buffer->lock);
> +	if (!--buffer->vmap_cnt) {
> +		vunmap(buffer->vaddr);
> +		buffer->vaddr = NULL;
> +	}
> +	mutex_unlock(&buffer->lock);
> +	iosys_map_clear(map);
> +}
> +
> +static void coherent_heap_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	struct coherent_heap *coh_heap = buffer->heap;
> +	struct device *heap_dev = dma_heap_get_dev(coh_heap->heap);
> +
> +	if (buffer->vmap_cnt > 0) {
> +		WARN(1, "%s: buffer still mapped in the kernel\n", __func__);
> +		vunmap(buffer->vaddr);
> +		buffer->vaddr = NULL;
> +		buffer->vmap_cnt = 0;
> +	}
> +
> +	if (buffer->alloc_vaddr)
> +		dma_free_coherent(heap_dev, buffer->len, buffer->alloc_vaddr,
> +				  buffer->dma_addr);
> +	kfree(buffer->pages);
> +	kfree(buffer);
> +}
> +
> +static const struct dma_buf_ops coherent_heap_buf_ops = {
> +	.attach = coherent_heap_attach,
> +	.detach = coherent_heap_detach,
> +	.map_dma_buf = coherent_heap_map_dma_buf,
> +	.unmap_dma_buf = coherent_heap_unmap_dma_buf,
> +	.begin_cpu_access = coherent_heap_dma_buf_begin_cpu_access,
> +	.end_cpu_access = coherent_heap_dma_buf_end_cpu_access,
> +	.mmap = coherent_heap_mmap,
> +	.vmap = coherent_heap_vmap,
> +	.vunmap = coherent_heap_vunmap,
> +	.release = coherent_heap_dma_buf_release,
> +};
> +
> +static struct dma_buf *coherent_heap_allocate(struct dma_heap *heap,
> +					      unsigned long len,
> +					      u32 fd_flags,
> +					      u64 heap_flags)
> +{
> +	struct coherent_heap *coh_heap;
> +	struct coherent_heap_buffer *buffer;
> +	struct device *heap_dev;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	size_t size = PAGE_ALIGN(len);
> +	pgoff_t pagecount = size >> PAGE_SHIFT;
> +	struct dma_buf *dmabuf;
> +	int ret = -ENOMEM;
> +	pgoff_t pg;
> +
> +	coh_heap = dma_heap_get_drvdata(heap);
> +	if (!coh_heap)
> +		return ERR_PTR(-EINVAL);
> +
> +	heap_dev = dma_heap_get_dev(coh_heap->heap);
> +	if (!heap_dev)
> +		return ERR_PTR(-ENODEV);
> +
> +	buffer = kzalloc_obj(*buffer);
> +	if (!buffer)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&buffer->attachments);
> +	mutex_init(&buffer->lock);
> +	buffer->len = size;
> +	buffer->heap = coh_heap;
> +	buffer->pagecount = pagecount;
> +
> +	buffer->alloc_vaddr = dma_alloc_coherent(heap_dev, buffer->len,
> +						 &buffer->dma_addr, GFP_KERNEL);

You are doing this DMA allocation using a non-DMA pseudo-device (heap_dev).
This is why you need to do that dma_coerce_mask_and_coherent(64) nonsense, you
are doing a DMA alloc for the CPU itself. This might still work, but only if
dma_map_sgtable() can handle swiotlb/iommu for all attaching devices at map
time.

> +	if (!buffer->alloc_vaddr) {
> +		ret = -ENOMEM;
> +		goto free_buffer;
> +	}
> +
> +	buffer->pages = kmalloc_array(pagecount, sizeof(*buffer->pages),
> +				      GFP_KERNEL);
> +	if (!buffer->pages) {
> +		ret = -ENOMEM;
> +		goto free_dma;
> +	}
> +
> +	for (pg = 0; pg < pagecount; pg++)
> +		buffer->pages[pg] = virt_to_page((char *)buffer->alloc_vaddr +
> +						 (pg * PAGE_SIZE));
> +

Is any of this valid if the coherent pool in DT was marked "no-map;"?
I'm sure the .mmap and .cpu_access function are not valid in that case.
Our (TI) evil vendor tree version of this heap sets a flag in that case and
avoids doing anything invalid when the region doesn't have normal backing
page structs. This region is treated more like a P2PDMA area in that case.

https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/drivers/dma-buf/heaps/carveout-heap.c?h=ti-linux-6.18.y#n372

Andrew

> +	/* create the dmabuf */
> +	exp_info.exp_name = dma_heap_get_name(heap);
> +	exp_info.ops = &coherent_heap_buf_ops;
> +	exp_info.size = buffer->len;
> +	exp_info.flags = fd_flags;
> +	exp_info.priv = buffer;
> +	dmabuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(dmabuf)) {
> +		ret = PTR_ERR(dmabuf);
> +		goto free_pages;
> +	}
> +	return dmabuf;
> +
> +free_pages:
> +	kfree(buffer->pages);
> +free_dma:
> +	dma_free_coherent(heap_dev, buffer->len, buffer->alloc_vaddr,
> +			  buffer->dma_addr);
> +free_buffer:
> +	kfree(buffer);
> +	return ERR_PTR(ret);
> +}
> +
> +static const struct dma_heap_ops coherent_heap_ops = {
> +	.allocate = coherent_heap_allocate,
> +};
> +
> +static int __coherent_heap_register(struct reserved_mem *rmem)
> +{
> +	struct dma_heap_export_info exp_info;
> +	struct coherent_heap *coh_heap;
> +	struct device *heap_dev;
> +	int ret;
> +
> +	if (!rmem || !rmem->name)
> +		return -EINVAL;
> +
> +	coh_heap = kzalloc_obj(*coh_heap);
> +	if (!coh_heap)
> +		return -ENOMEM;
> +
> +	coh_heap->rmem = rmem;
> +	coh_heap->name = kstrdup(rmem->name, GFP_KERNEL);
> +	if (!coh_heap->name) {
> +		ret = -ENOMEM;
> +		goto free_coherent_heap;
> +	}
> +
> +	exp_info.name = coh_heap->name;
> +	exp_info.ops = &coherent_heap_ops;
> +	exp_info.priv = coh_heap;
> +
> +	coh_heap->heap = dma_heap_create(&exp_info);
> +	if (IS_ERR(coh_heap->heap)) {
> +		ret = PTR_ERR(coh_heap->heap);
> +		goto free_name;
> +	}
> +
> +	heap_dev = dma_heap_get_dev(coh_heap->heap);
> +	ret = dma_coerce_mask_and_coherent(heap_dev, DMA_BIT_MASK(64));
> +	if (ret) {
> +		pr_err("coherent_heap: failed to set DMA mask (%d)\n", ret);
> +		goto destroy_heap;
> +	}
> +
> +	ret = of_reserved_mem_device_init_with_mem(heap_dev, rmem);
> +	if (ret) {
> +		pr_err("coherent_heap: failed to initialize memory (%d)\n", ret);
> +		goto destroy_heap;
> +	}
> +
> +	ret = dma_heap_register(coh_heap->heap);
> +	if (ret) {
> +		pr_err("coherent_heap: failed to register heap (%d)\n", ret);
> +		goto destroy_heap;
> +	}
> +
> +	return 0;
> +
> +destroy_heap:
> +	dma_heap_destroy(coh_heap->heap);
> +	coh_heap->heap = NULL;
> +free_name:
> +	kfree(coh_heap->name);
> +free_coherent_heap:
> +	kfree(coh_heap);
> +
> +	return ret;
> +}
> +
> +static int __init coherent_heap_register(void)
> +{
> +	struct reserved_mem *rmem;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; (rmem = dma_coherent_get_reserved_region(i)) != NULL; i++) {
> +		ret = __coherent_heap_register(rmem);
> +		if (ret) {
> +			pr_warn("Failed to add coherent heap %s",
> +				rmem->name ? rmem->name : "unknown");
> +			continue;
> +		}
> +	}
> +
> +	return 0;
> +}
> +module_init(coherent_heap_register);
> +MODULE_DESCRIPTION("DMA-BUF heap for coherent reserved-memory regions");
> 


