Return-Path: <linux-media+bounces-55387-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGCwDmJssWlVvAIAu9opvQ
	(envelope-from <linux-media+bounces-55387-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:21:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FCE2645D8
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFA9D3104C96
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB3C286413;
	Wed, 11 Mar 2026 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FX3Sue06"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012011.outbound.protection.outlook.com [52.101.48.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEF730DED1;
	Wed, 11 Mar 2026 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235117; cv=fail; b=L439YW9Y4rg1FFZLb2dnp1U6UZWKtmfrbkoEoHZvgmzaNBpMUkpLnAn0pCC40oir5otQ51aPP9g09xxqx9J7VKbv05fvCVqDNu8vj+2nOH/TKBMoELl6if77ECsJC05g4VApE+Gn1ZvXkxYIbtkI9Rqmk9d1N76ZsHjp3yJTdnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235117; c=relaxed/simple;
	bh=E/xYZ3Y4fU13OUl3+ey9wo7H0TcGhpLwCojyCTfKbnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X2ritgEd+01GU/rEj1ekbqK5xabgGL0OV8MTDltMar6O3cLKAjEJMzwYHy9P+qxtktR9NlrHRMbnmR4avXAFiqMTr82l01EkRovhyD05LmxyxGIuk8LE+Arc2jwZHpge8T3UmROC+2FKZy1CYYht2RYEJFyGDQYe7G/SlWSGQHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FX3Sue06; arc=fail smtp.client-ip=52.101.48.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cia3xEaPrXbtybgTmhISgBJlXoCDPYEcZukFkqC5+aYUM0fBvexMwOa/ncshkJbroSOiHXj39M7IFMRShv4kU0Ll2gtLShAP1zXyzUippBLJ4tJFJEPwackVUNpL20zorVzYyF0Zhi2gJlg5oftnDotf/H1j+W3K6YrF60ZfFdISloDmOrED8y10OHcZ+7X4XuwV0M/g8ZUkIyZZ3RcgMhzKcoCsMm/y1j6E7Kzw063NI6ydscAz70b7RXqHBzWEkCDwDx8P5bQmwtqXuMPoWWnyNVuHIhz/t1lrCT63TwZG0bPjvsC5RqyE5FnqH1Tt69M3M8LsJe8cM9HOo+CGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gat2kWQW/pOsqA3tDsIrfhgf5yxfIN6loZgIH+x71dc=;
 b=eJwiKDYu3oE4MWGqx1l7NvFVWrH3+I54mUNi++9S7ZiUMaT8pGB4+TWBQ1pMrh9FdPNybTSikoxFwAMzguD9+1AuVkNWbnox6V2Y3F7rhaVQ8ZFLGKcCefwqZAgLgtZ/Upoiu19ZH9mpNKXtzztPaLp6X3BNL8SwIbDY5EbTrKH8fFSZFw0/7bCisPZMYM3rgICKB8FL2A3MkBe/OFtxQadawWP9JDqDarXqHCZHpPY5Yq4j9KnYmWZcCPaP0lA21iCwseBZC7NK6g9LMDFIhA3RM2eqEI3R2GAQvCy/3p7bk/tqVKuR6q/XABuqOuhKm7TVv4EAGyBld08kRkI9iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=redhat.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gat2kWQW/pOsqA3tDsIrfhgf5yxfIN6loZgIH+x71dc=;
 b=FX3Sue06/VCSStUM5rW0oiiMkexzt6bAJPMfh3wnE+LldiRkfDuO6gyyPgHC/5mEPBB6AiWUCszDRBtkN9tz3f4EBvwmhutixP3HWcMV3KIyMyzybh45F3UVE0C+qnHMBtiHkw26iluj8U0JAT1qlV0JbhiAhcTaK0eg8NJNzrQ=
Received: from SJ0PR05CA0126.namprd05.prod.outlook.com (2603:10b6:a03:33d::11)
 by IA4PR10MB8518.namprd10.prod.outlook.com (2603:10b6:208:56a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 13:18:31 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::30) by SJ0PR05CA0126.outlook.office365.com
 (2603:10b6:a03:33d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 13:18:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 13:18:30 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 08:18:29 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 08:18:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 08:18:29 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BDISnV905045;
	Wed, 11 Mar 2026 08:18:28 -0500
Message-ID: <1afc696a-9afb-48af-887d-2a209680784e@ti.com>
Date: Wed, 11 Mar 2026 08:18:28 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
To: Albert Esteve <aesteve@redhat.com>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<iommu@lists.linux.dev>, <devicetree@vger.kernel.org>, <mripard@redhat.com>,
	<echanude@redhat.com>
References: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
 <20260306-b4-dmabuf-heap-coherent-rmem-v3-5-3d00d36c9bc4@redhat.com>
 <e8dd476f-1be8-46fa-bf56-65fe0bfe29a1@ti.com>
 <CADSE00+-SQr3wGdgBmLowHPWE5bGxoyO4o20jZs4ma-71aOxUA@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CADSE00+-SQr3wGdgBmLowHPWE5bGxoyO4o20jZs4ma-71aOxUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|IA4PR10MB8518:EE_
X-MS-Office365-Filtering-Correlation-Id: 669f1783-7564-4db7-93fb-08de7f70b0a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZgnofTwsSRijbi+NXfgikxQP+GHJN7ZYb0Gs8bJeDvIls5J22RobAkKoT7k6ZKRH3hlCh4mhXSVZwGFLeDpxqE+fDarrxDhOfzQukgRyBCS+We3WePFK700GPIeM8NUfd65fN+ttcHu+1ICOhm1/5sxDbkUdcLRoYk48hAHCZp5uy8SOfjNbQZAt1+gY7Du9LYCuhmVjkg8hfPz5HQU6VdLyMMDeQn328A/0hVKaZXlLyY/93ioslq9CwoMQKRt3uvhBI9qPCZDIu3j/cNLLFSV2s/ZR0TCil5fuqmmmXQFQ/KH9ht+GmFjwsfBa38h4iLfHDuNoDeQjw18hFCzkQ/1rs0PvcqrrjzkBBp9H+U9kz7cDQPCHeXI8Od4gQEG9nRSMFI/ujGTULY109vgLIb6kUq0DDLp6MvkRjWKSn6buGyWeL7uYOyPFmGPmVfLyBEnuKHanYs9q8H3UjdfyjiP24k+HsSwfUj5SbJdvkx0uP8GPQD106keG8NzLDlPb87YOJMS4ybhVLncrXRO7txNSobuqr3WQQCZQIVAU97bB6iVrX4yoRoH4IacUmrrLHxqO/bSCsREgTVglOTgrHXISVZvB1y1vhEXdCObfb0FcpqYAoPTI60ZC6qKbzooZ2HkqqtPDYrcHLnj4B5BqK2VhHIjVaMKDtNi54QtUQ6ed0i11xDoC+8IY/WYRAiIT+Sl+o/HK/gopo7d7rMI3Z6D4N/2MyIT5W38gDemy5t+Eb6atEWEyTyL44x6O2QknseN82aGRbOc4icoqW2ePKg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h+XcD/0R2HC3lBdVNlJ8L8knLci4EGhbOf5QI9PqiZaC31CFyffFCH+jxyNiHbWiqERTsEPqGys9KWIHKgOzL8Q19ad3fXt5DRO2V9UsSf81RfhWJ+rD+BfIRl6pS1SVMqlXHvEvQb/zObf5gYHDf72BrWMxcGRZ0lpqtTac9MxEpFdb4OFJFUTn7yEmBfpem00/ScK87JA2Gwafifndbnsz0bj/jcIIGr+671lvKR/y0zQ8NngeU2r1GyuEPnKoV64oGp5gYndAMthiakPA4G8b1bTcOKFr7muBuIvxB3mNcsszRvhNDHhcCpFtNm9I9RhY11aobe1ve6bN8irznKUCQ3nc6PvcFNXZfMfROTc+UjVnQ/hvRM0n7R6CBIF6hKWaY0oM0AzaPvHkltoJ9l/aKSGVg2n/CQG0+l6jlz8GHgle8dJZpyaizlXea60L
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 13:18:30.8281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 669f1783-7564-4db7-93fb-08de7f70b0a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8518
X-Rspamd-Queue-Id: 94FCE2645D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55387-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[exp_info.name:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ti.com:dkim,ti.com:email,ti.com:url,ti.com:mid];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 3/11/26 5:19 AM, Albert Esteve wrote:
> On Tue, Mar 10, 2026 at 4:34 PM Andrew Davis <afd@ti.com> wrote:
>>
>> On 3/6/26 4:36 AM, Albert Esteve wrote:
>>> Expose DT coherent reserved-memory pools ("shared-dma-pool"
>>> without "reusable") as dma-buf heaps, creating one heap per
>>> region so userspace can allocate from the exact device-local
>>> pool intended for coherent DMA.
>>>
>>> This is a missing backend in the long-term effort to steer
>>> userspace buffer allocations (DRM, v4l2, dma-buf heaps)
>>> through heaps for clearer cgroup accounting. CMA and system
>>> heaps already exist; non-reusable coherent reserved memory
>>> did not.
>>>
>>> The heap binds the heap device to each memory region so
>>> coherent allocations use the correct dev->dma_mem, and
>>> it defers registration until module_init when normal
>>> allocators are available.
>>>
>>> Signed-off-by: Albert Esteve <aesteve@redhat.com>
>>> ---
>>>    drivers/dma-buf/heaps/Kconfig         |   9 +
>>>    drivers/dma-buf/heaps/Makefile        |   1 +
>>>    drivers/dma-buf/heaps/coherent_heap.c | 414 ++++++++++++++++++++++++++++++++++
>>>    3 files changed, 424 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
>>> index a5eef06c42264..aeb475e585048 100644
>>> --- a/drivers/dma-buf/heaps/Kconfig
>>> +++ b/drivers/dma-buf/heaps/Kconfig
>>> @@ -12,3 +12,12 @@ config DMABUF_HEAPS_CMA
>>>          Choose this option to enable dma-buf CMA heap. This heap is backed
>>>          by the Contiguous Memory Allocator (CMA). If your system has these
>>>          regions, you should say Y here.
>>> +
>>> +config DMABUF_HEAPS_COHERENT
>>> +     bool "DMA-BUF Coherent Reserved-Memory Heap"
>>> +     depends on DMABUF_HEAPS && OF_RESERVED_MEM && DMA_DECLARE_COHERENT
>>> +     help
>>> +       Choose this option to enable coherent reserved-memory dma-buf heaps.
>>> +       This heap is backed by non-reusable DT "shared-dma-pool" regions.
>>> +       If your system defines coherent reserved-memory regions, you should
>>> +       say Y here.
>>> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
>>> index 974467791032f..96bda7a65f041 100644
>>> --- a/drivers/dma-buf/heaps/Makefile
>>> +++ b/drivers/dma-buf/heaps/Makefile
>>> @@ -1,3 +1,4 @@
>>>    # SPDX-License-Identifier: GPL-2.0
>>>    obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)   += system_heap.o
>>>    obj-$(CONFIG_DMABUF_HEAPS_CMA)              += cma_heap.o
>>> +obj-$(CONFIG_DMABUF_HEAPS_COHERENT)  += coherent_heap.o
>>> diff --git a/drivers/dma-buf/heaps/coherent_heap.c b/drivers/dma-buf/heaps/coherent_heap.c
>>> new file mode 100644
>>> index 0000000000000..55f53f87c4c15
>>> --- /dev/null
>>> +++ b/drivers/dma-buf/heaps/coherent_heap.c
>>> @@ -0,0 +1,414 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * DMABUF heap for coherent reserved-memory regions
>>> + *
>>> + * Copyright (C) 2026 Red Hat, Inc.
>>> + * Author: Albert Esteve <aesteve@redhat.com>
>>> + *
>>> + */
>>> +
>>> +#include <linux/dma-buf.h>
>>> +#include <linux/dma-heap.h>
>>> +#include <linux/dma-map-ops.h>
>>> +#include <linux/dma-mapping.h>
>>> +#include <linux/err.h>
>>> +#include <linux/highmem.h>
>>> +#include <linux/iosys-map.h>
>>> +#include <linux/of_reserved_mem.h>
>>> +#include <linux/scatterlist.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/vmalloc.h>
>>> +
>>> +struct coherent_heap {
>>> +     struct dma_heap *heap;
>>> +     struct reserved_mem *rmem;
>>> +     char *name;
>>> +};
>>> +
>>> +struct coherent_heap_buffer {
>>> +     struct coherent_heap *heap;
>>> +     struct list_head attachments;
>>> +     struct mutex lock;
>>> +     unsigned long len;
>>> +     dma_addr_t dma_addr;
>>> +     void *alloc_vaddr;
>>> +     struct page **pages;
>>> +     pgoff_t pagecount;
>>> +     int vmap_cnt;
>>> +     void *vaddr;
>>> +};
>>> +
>>> +struct dma_heap_attachment {
>>> +     struct device *dev;
>>> +     struct sg_table table;
>>> +     struct list_head list;
>>> +     bool mapped;
>>> +};
>>> +
>>> +static int coherent_heap_attach(struct dma_buf *dmabuf,
>>> +                             struct dma_buf_attachment *attachment)
>>> +{
>>> +     struct coherent_heap_buffer *buffer = dmabuf->priv;
>>> +     struct dma_heap_attachment *a;
>>> +     int ret;
>>> +
>>> +     a = kzalloc_obj(*a);
>>> +     if (!a)
>>> +             return -ENOMEM;
>>> +
>>> +     ret = sg_alloc_table_from_pages(&a->table, buffer->pages,
>>> +                                     buffer->pagecount, 0,
>>> +                                     buffer->pagecount << PAGE_SHIFT,
>>> +                                     GFP_KERNEL);
>>> +     if (ret) {
>>> +             kfree(a);
>>> +             return ret;
>>> +     }
>>> +
>>> +     a->dev = attachment->dev;
>>> +     INIT_LIST_HEAD(&a->list);
>>> +     a->mapped = false;
>>> +
>>> +     attachment->priv = a;
>>> +
>>> +     mutex_lock(&buffer->lock);
>>> +     list_add(&a->list, &buffer->attachments);
>>> +     mutex_unlock(&buffer->lock);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void coherent_heap_detach(struct dma_buf *dmabuf,
>>> +                              struct dma_buf_attachment *attachment)
>>> +{
>>> +     struct coherent_heap_buffer *buffer = dmabuf->priv;
>>> +     struct dma_heap_attachment *a = attachment->priv;
>>> +
>>> +     mutex_lock(&buffer->lock);
>>> +     list_del(&a->list);
>>> +     mutex_unlock(&buffer->lock);
>>> +
>>> +     sg_free_table(&a->table);
>>> +     kfree(a);
>>> +}
>>> +
>>> +static struct sg_table *coherent_heap_map_dma_buf(struct dma_buf_attachment *attachment,
>>> +                                               enum dma_data_direction direction)
>>> +{
>>> +     struct dma_heap_attachment *a = attachment->priv;
>>> +     struct sg_table *table = &a->table;
>>> +     int ret;
>>> +
>>> +     ret = dma_map_sgtable(attachment->dev, table, direction, 0);
>>> +     if (ret)
>>> +             return ERR_PTR(-ENOMEM);
>>> +     a->mapped = true;
>>> +
>>> +     return table;
>>> +}
>>> +
>>> +static void coherent_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
>>> +                                     struct sg_table *table,
>>> +                                     enum dma_data_direction direction)
>>> +{
>>> +     struct dma_heap_attachment *a = attachment->priv;
>>> +
>>> +     a->mapped = false;
>>> +     dma_unmap_sgtable(attachment->dev, table, direction, 0);
>>> +}
>>> +
>>> +static int coherent_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>>> +                                               enum dma_data_direction direction)
>>> +{
>>> +     struct coherent_heap_buffer *buffer = dmabuf->priv;
>>> +     struct dma_heap_attachment *a;
>>> +
>>> +     mutex_lock(&buffer->lock);
>>> +     if (buffer->vmap_cnt)
>>> +             invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
>>> +
>>> +     list_for_each_entry(a, &buffer->attachments, list) {
>>> +             if (!a->mapped)
>>> +                     continue;
>>> +             dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
>>> +     }
>>> +     mutex_unlock(&buffer->lock);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int coherent_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>>> +                                             enum dma_data_direction direction)
>>> +{
>>> +     struct coherent_heap_buffer *buffer = dmabuf->priv;
>>> +     struct dma_heap_attachment *a;
>>> +
>>> +     mutex_lock(&buffer->lock);
>>> +     if (buffer->vmap_cnt)
>>> +             flush_kernel_vmap_range(buffer->vaddr, buffer->len);
>>> +
>>> +     list_for_each_entry(a, &buffer->attachments, list) {
>>> +             if (!a->mapped)
>>> +                     continue;
>>> +             dma_sync_sgtable_for_device(a->dev, &a->table, direction);
>>> +     }
>>> +     mutex_unlock(&buffer->lock);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int coherent_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>>> +{
>>> +     struct coherent_heap_buffer *buffer = dmabuf->priv;
>>> +     struct coherent_heap *coh_heap = buffer->heap;
>>> +     struct device *heap_dev = dma_heap_get_dev(coh_heap->heap);
>>> +
>>> +     return dma_mmap_coherent(heap_dev, vma, buffer->alloc_vaddr,
>>> +                              buffer->dma_addr, buffer->len);
>>> +}
>>> +
>>> +static void *coherent_heap_do_vmap(struct coherent_heap_buffer *buffer)
>>> +{
>>> +     void *vaddr;
>>> +
>>> +     vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE_KERNEL);
>>> +     if (!vaddr)
>>> +             return ERR_PTR(-ENOMEM);
>>> +
>>> +     return vaddr;
>>> +}
>>> +
>>> +static int coherent_heap_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>>> +{
>>> +     struct coherent_heap_buffer *buffer = dmabuf->priv;
>>> +     void *vaddr;
>>> +     int ret = 0;
>>> +
>>> +     mutex_lock(&buffer->lock);
>>> +     if (buffer->vmap_cnt) {
>>> +             buffer->vmap_cnt++;
>>> +             iosys_map_set_vaddr(map, buffer->vaddr);
>>> +             goto out;
>>> +     }
>>> +
>>> +     vaddr = coherent_heap_do_vmap(buffer);
>>> +     if (IS_ERR(vaddr)) {
>>> +             ret = PTR_ERR(vaddr);
>>> +             goto out;
>>> +     }
>>> +
>>> +     buffer->vaddr = vaddr;
>>> +     buffer->vmap_cnt++;
>>> +     iosys_map_set_vaddr(map, buffer->vaddr);
>>> +out:
>>> +     mutex_unlock(&buffer->lock);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static void coherent_heap_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
>>> +{
>>> +     struct coherent_heap_buffer *buffer = dmabuf->priv;
>>> +
>>> +     mutex_lock(&buffer->lock);
>>> +     if (!--buffer->vmap_cnt) {
>>> +             vunmap(buffer->vaddr);
>>> +             buffer->vaddr = NULL;
>>> +     }
>>> +     mutex_unlock(&buffer->lock);
>>> +     iosys_map_clear(map);
>>> +}
>>> +
>>> +static void coherent_heap_dma_buf_release(struct dma_buf *dmabuf)
>>> +{
>>> +     struct coherent_heap_buffer *buffer = dmabuf->priv;
>>> +     struct coherent_heap *coh_heap = buffer->heap;
>>> +     struct device *heap_dev = dma_heap_get_dev(coh_heap->heap);
>>> +
>>> +     if (buffer->vmap_cnt > 0) {
>>> +             WARN(1, "%s: buffer still mapped in the kernel\n", __func__);
>>> +             vunmap(buffer->vaddr);
>>> +             buffer->vaddr = NULL;
>>> +             buffer->vmap_cnt = 0;
>>> +     }
>>> +
>>> +     if (buffer->alloc_vaddr)
>>> +             dma_free_coherent(heap_dev, buffer->len, buffer->alloc_vaddr,
>>> +                               buffer->dma_addr);
>>> +     kfree(buffer->pages);
>>> +     kfree(buffer);
>>> +}
>>> +
>>> +static const struct dma_buf_ops coherent_heap_buf_ops = {
>>> +     .attach = coherent_heap_attach,
>>> +     .detach = coherent_heap_detach,
>>> +     .map_dma_buf = coherent_heap_map_dma_buf,
>>> +     .unmap_dma_buf = coherent_heap_unmap_dma_buf,
>>> +     .begin_cpu_access = coherent_heap_dma_buf_begin_cpu_access,
>>> +     .end_cpu_access = coherent_heap_dma_buf_end_cpu_access,
>>> +     .mmap = coherent_heap_mmap,
>>> +     .vmap = coherent_heap_vmap,
>>> +     .vunmap = coherent_heap_vunmap,
>>> +     .release = coherent_heap_dma_buf_release,
>>> +};
>>> +
>>> +static struct dma_buf *coherent_heap_allocate(struct dma_heap *heap,
>>> +                                           unsigned long len,
>>> +                                           u32 fd_flags,
>>> +                                           u64 heap_flags)
>>> +{
>>> +     struct coherent_heap *coh_heap;
>>> +     struct coherent_heap_buffer *buffer;
>>> +     struct device *heap_dev;
>>> +     DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>>> +     size_t size = PAGE_ALIGN(len);
>>> +     pgoff_t pagecount = size >> PAGE_SHIFT;
>>> +     struct dma_buf *dmabuf;
>>> +     int ret = -ENOMEM;
>>> +     pgoff_t pg;
>>> +
>>> +     coh_heap = dma_heap_get_drvdata(heap);
>>> +     if (!coh_heap)
>>> +             return ERR_PTR(-EINVAL);
>>> +
>>> +     heap_dev = dma_heap_get_dev(coh_heap->heap);
>>> +     if (!heap_dev)
>>> +             return ERR_PTR(-ENODEV);
>>> +
>>> +     buffer = kzalloc_obj(*buffer);
>>> +     if (!buffer)
>>> +             return ERR_PTR(-ENOMEM);
>>> +
>>> +     INIT_LIST_HEAD(&buffer->attachments);
>>> +     mutex_init(&buffer->lock);
>>> +     buffer->len = size;
>>> +     buffer->heap = coh_heap;
>>> +     buffer->pagecount = pagecount;
>>> +
>>> +     buffer->alloc_vaddr = dma_alloc_coherent(heap_dev, buffer->len,
>>> +                                              &buffer->dma_addr, GFP_KERNEL);
>>
>> You are doing this DMA allocation using a non-DMA pseudo-device (heap_dev).
>> This is why you need to do that dma_coerce_mask_and_coherent(64) nonsense, you
>> are doing a DMA alloc for the CPU itself. This might still work, but only if
>> dma_map_sgtable() can handle swiotlb/iommu for all attaching devices at map
>> time.
> 
> The concern is valid. We're allocating via a synthetic device, which
> ties the allocation to that device's DMA domain. I looked deeper into
> this trying to address the concern.
> 
> The approach works because dma_map_sgtable() handles both
> dma_map_direct and use_dma_iommu cases in __dma_map_sg_attrs(). For
> each physical address in the sg_table (extracted via sg_phys()), it
> creates device-specific DMA mappings:
> - For direct mapping: it checks if the address is directly accessible
> (dma_capable()), and if not, it falls back to swiotlb.
> - For IOMMU: it creates mappings that allow the device to access
> physical addresses.
> 
> This means every attached device gets its own device-specific DMA
> mapping, properly handling cases where the physical addresses are
> inaccessible or have DMA constraints.
> 

While this means it might still "work" it won't always be ideal. Take
the case where the consuming device(s) have a 32bit address restriction,
if the allocation was done using the real devices then the backing buffer
itself would be allocated in <32bit mem. Whereas here the allocation
could end up in >32bit mem, as the CPU/synthetic device supports that.
Then each mapping device would instead get a bounce buffer.

(this example might not be great as we usually know the address of
carveout/reserved memory regions, but substitute in whatever restriction
makes more sense)

These non-reusable carveouts tend to be made for some specific device, and
they are made specifically because that device has some memory restriction.
So we might run into the situation above more than one would expect.

Not a blocker here, but just something worth thinking on.

> I'm not sure whether other approaches (whatever they may be) would be
> better, as here we are leveraging a great part of the existing
> infrastructure.
> 
>>
>>> +     if (!buffer->alloc_vaddr) {
>>> +             ret = -ENOMEM;
>>> +             goto free_buffer;
>>> +     }
>>> +
>>> +     buffer->pages = kmalloc_array(pagecount, sizeof(*buffer->pages),
>>> +                                   GFP_KERNEL);
>>> +     if (!buffer->pages) {
>>> +             ret = -ENOMEM;
>>> +             goto free_dma;
>>> +     }
>>> +
>>> +     for (pg = 0; pg < pagecount; pg++)
>>> +             buffer->pages[pg] = virt_to_page((char *)buffer->alloc_vaddr +
>>> +                                              (pg * PAGE_SIZE));
>>> +
>>
>> Is any of this valid if the coherent pool in DT was marked "no-map;"?
>> I'm sure the .mmap and .cpu_access function are not valid in that case.
>> Our (TI) evil vendor tree version of this heap sets a flag in that case and
>> avoids doing anything invalid when the region doesn't have normal backing
>> page structs. This region is treated more like a P2PDMA area in that case.
>>
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/drivers/dma-buf/heaps/carveout-heap.c?h=ti-linux-6.18.y#n372
> 
> I completely missed the "no-map" case. Thanks for the review and the
> link! I will address this in the next version, using a logic similar
> to the one from the linked driver.
> 

Do take note that the linked driver is only part of an evil vendor tree,
I do things in that driver that are not correct and would not fly upstream.

For "no-map" I chose to make un-cached mappings for the CPU. This allowed for
kernel/userspace access without changing cacheability (which can't be done
safely on ARM). The issue is that "no-map" really should mean DO NOT MAP.
It might be these carveouts are firewalled or have some other side effect
that prevent *any* mapping from CPU. The safer thing to do would be to
simply not allow CPU mappings (vmap/mmap) if "no-map" is set.

Andrew

> BR,
> Albert.
> 
>>
>> Andrew
>>
>>> +     /* create the dmabuf */
>>> +     exp_info.exp_name = dma_heap_get_name(heap);
>>> +     exp_info.ops = &coherent_heap_buf_ops;
>>> +     exp_info.size = buffer->len;
>>> +     exp_info.flags = fd_flags;
>>> +     exp_info.priv = buffer;
>>> +     dmabuf = dma_buf_export(&exp_info);
>>> +     if (IS_ERR(dmabuf)) {
>>> +             ret = PTR_ERR(dmabuf);
>>> +             goto free_pages;
>>> +     }
>>> +     return dmabuf;
>>> +
>>> +free_pages:
>>> +     kfree(buffer->pages);
>>> +free_dma:
>>> +     dma_free_coherent(heap_dev, buffer->len, buffer->alloc_vaddr,
>>> +                       buffer->dma_addr);
>>> +free_buffer:
>>> +     kfree(buffer);
>>> +     return ERR_PTR(ret);
>>> +}
>>> +
>>> +static const struct dma_heap_ops coherent_heap_ops = {
>>> +     .allocate = coherent_heap_allocate,
>>> +};
>>> +
>>> +static int __coherent_heap_register(struct reserved_mem *rmem)
>>> +{
>>> +     struct dma_heap_export_info exp_info;
>>> +     struct coherent_heap *coh_heap;
>>> +     struct device *heap_dev;
>>> +     int ret;
>>> +
>>> +     if (!rmem || !rmem->name)
>>> +             return -EINVAL;
>>> +
>>> +     coh_heap = kzalloc_obj(*coh_heap);
>>> +     if (!coh_heap)
>>> +             return -ENOMEM;
>>> +
>>> +     coh_heap->rmem = rmem;
>>> +     coh_heap->name = kstrdup(rmem->name, GFP_KERNEL);
>>> +     if (!coh_heap->name) {
>>> +             ret = -ENOMEM;
>>> +             goto free_coherent_heap;
>>> +     }
>>> +
>>> +     exp_info.name = coh_heap->name;
>>> +     exp_info.ops = &coherent_heap_ops;
>>> +     exp_info.priv = coh_heap;
>>> +
>>> +     coh_heap->heap = dma_heap_create(&exp_info);
>>> +     if (IS_ERR(coh_heap->heap)) {
>>> +             ret = PTR_ERR(coh_heap->heap);
>>> +             goto free_name;
>>> +     }
>>> +
>>> +     heap_dev = dma_heap_get_dev(coh_heap->heap);
>>> +     ret = dma_coerce_mask_and_coherent(heap_dev, DMA_BIT_MASK(64));
>>> +     if (ret) {
>>> +             pr_err("coherent_heap: failed to set DMA mask (%d)\n", ret);
>>> +             goto destroy_heap;
>>> +     }
>>> +
>>> +     ret = of_reserved_mem_device_init_with_mem(heap_dev, rmem);
>>> +     if (ret) {
>>> +             pr_err("coherent_heap: failed to initialize memory (%d)\n", ret);
>>> +             goto destroy_heap;
>>> +     }
>>> +
>>> +     ret = dma_heap_register(coh_heap->heap);
>>> +     if (ret) {
>>> +             pr_err("coherent_heap: failed to register heap (%d)\n", ret);
>>> +             goto destroy_heap;
>>> +     }
>>> +
>>> +     return 0;
>>> +
>>> +destroy_heap:
>>> +     dma_heap_destroy(coh_heap->heap);
>>> +     coh_heap->heap = NULL;
>>> +free_name:
>>> +     kfree(coh_heap->name);
>>> +free_coherent_heap:
>>> +     kfree(coh_heap);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int __init coherent_heap_register(void)
>>> +{
>>> +     struct reserved_mem *rmem;
>>> +     unsigned int i;
>>> +     int ret;
>>> +
>>> +     for (i = 0; (rmem = dma_coherent_get_reserved_region(i)) != NULL; i++) {
>>> +             ret = __coherent_heap_register(rmem);
>>> +             if (ret) {
>>> +                     pr_warn("Failed to add coherent heap %s",
>>> +                             rmem->name ? rmem->name : "unknown");
>>> +                     continue;
>>> +             }
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +module_init(coherent_heap_register);
>>> +MODULE_DESCRIPTION("DMA-BUF heap for coherent reserved-memory regions");
>>>
>>
> 


