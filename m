Return-Path: <linux-media+bounces-31144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB37A9E9A2
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FF971896C10
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 07:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103E41DEFD9;
	Mon, 28 Apr 2025 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="jZVxGIjL"
X-Original-To: linux-media@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11011025.outbound.protection.outlook.com [52.101.129.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFD01A7045;
	Mon, 28 Apr 2025 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826058; cv=fail; b=BOqCEZ7De5rkLJLWQa/J9CUWrWxlj9VR1D1ASBFe/s1n1JAaL5CRhrbmjQcpH1rA4uKnLkxw8sTQ1oZRZN7rRf6kFgQdYZg5pGkg8wjdtXk7/34D5LU/65DNankfw9JqNWTIfLopsEt0rBYgoxtsjDwst6auebfgyYSkRGKLmN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826058; c=relaxed/simple;
	bh=8gX0FsV4qlNTlBK/392kgP7jn9peKY5dJ/OFs/I73So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vdw8LIplXVqxqsk6lrzns0LQRlMzeGiLap3djltXlrNszkgw5VhCYdFM9At4cBlJOGTt3+hXyR8NsjU/2t/NdGs6cTM4likL2IJEwFr1ifh0pXknP2fhZqrZ1x7zWZ7UHvadjOSX9UWwBxxTdq4JHnB/CLGjdRlLO1NSOiCGkPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=jZVxGIjL; arc=fail smtp.client-ip=52.101.129.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioFguwV37/FABB2LOaI06/CaB7CaqUNQnbnisgG3eEBWueFT0c3VBe7QwpgGOZlUllu2y81LrBbF0wwiPhiOubN68fo3xXzdHPOH1xD4WBNbyOGcN7Yonu5V8kTTjobnmZ2k/Aao0H3GhQfXxankxpJMYZS9x/bpYCRqdOfGzM8rhS9zUM/IUubTb8pH1FSfVsW0qa8mt3vVauL0hu0qJ5QmdoQMHe8EBwHGLX5yrzjJPFfpXOvmkAV9vtNyUB/DN+dcaOwx+UweVzdL3695Wg5p3VnhKZq4oiVPLm1hrcokQ3o7cUNScOhVGWvFiylAnAEdyQwNc28sUES8o8A9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U46C7+zfXZfeRyQIoCGJYfchuHBaajWgN5LgDUiKkwU=;
 b=c3NhS+KJ2Yy7mxyq8qWknx3wsQukS8dq8Or3Yjrv3FcXQRGqeWmISXjRkg7MYwi1CkwAyk/3oWsa/lwy7V+fvsf0kY/eDfTulBjzzkhrsmOLcvCTgfjCnPp8UPLkdEaWALonghmlsew4r7BfF2fZ+ogik0ZdM4W256rf9PKyQ8DCapVH2W78XaY4L1/unKxnqQAciIVW3+v3lRnAgZoatMpJweeBzQ3egn5Who0MG8lp6CBfFhLd2vRcOsHufme0K62cRi3xnrib9zcZhVnxPKfDm+yqplsLUp9QEOys2qnI+kr5KvZgyLzqIlCuHEB61diyPsuMSTSVqkxZwlsbpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U46C7+zfXZfeRyQIoCGJYfchuHBaajWgN5LgDUiKkwU=;
 b=jZVxGIjL7RGvu/Yr2cmuIlK1Ft96J1wuBWj18KKLI4x6ogLayrQ2X8v7z6mLeHF9VHa4OFnTrqVqVpjCpjqurqNhwLkeShYMXnhwhy9Y6TRPhrO1DXXDCBr8BwPWciZlxAQKxgBJrzIwf46f71AFFBCHT2Vt9HvLT14GDpWwhvWBgStCiTPm2khKTgMsQHR7lSWri/sHZGyCyW7jIWFL5wTLvDgC3TShjBnWE58dEla3vcUwU/peLnaHSAOLv5P2tldGhHWDgYxGmC4vZfFE6FCC4SkweaKP3LsOQoWm0b/KFMzyVSG0InnphecHylND950Jjj8oiNt/eQZJ2x7dww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYZPR06MB7093.apcprd06.prod.outlook.com (2603:1096:405:ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 07:40:51 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:40:50 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Dave Airlie <airlied@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>,
	Bingbu Cao <bingbu.cao@linux.intel.com>
Subject: [PATCH v2 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
Date: Mon, 28 Apr 2025 15:38:29 +0800
Message-ID: <20250428073831.19942-2-link@vivo.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428073831.19942-1-link@vivo.com>
References: <20250428073831.19942-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYZPR06MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cdcdce9-b8cb-41fe-9d3c-08dd8627ff9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xK25BAjJj4fRW7ZKcZMupvU3BwrGwMYrJiBjDh6vXKjK0wOr+9bQDj3PIi/Q?=
 =?us-ascii?Q?d7i6mmh6pU6mUGgrtPDrS9V7R/9qlvzd61ydCf4kVCX6g4b3bvRFwWm4K8L+?=
 =?us-ascii?Q?8HbwrtJBsq9A+UONvF0JlNmnG3Kyxqx5ilBVuKN6UAn649i41zzfU4HUhWRx?=
 =?us-ascii?Q?u/Mj6QHEtAOw7dyfXizQXggCkBW1fn/PPDbmpO1br9uRdT3WOt4BugsmjEMX?=
 =?us-ascii?Q?F8ooRKIR92PPd265JKlvcFNs+Tfyth3L4IYNW4tYuVWQFvtJ5AfRNg9v6Cz+?=
 =?us-ascii?Q?LEmy8h7PU61bUtPRxZJ3zFhPkYChqs4JPz1pEggfEixfSVfJ6wf6SvGthsW4?=
 =?us-ascii?Q?XfMcabKa7P/9NomsxJ7/4UfI1Lr2cwaWTlTBz8921jEPv9STEnbO7vwhl604?=
 =?us-ascii?Q?SpSlOpXHS8IlNRDbLHnSNByQgvmZ4nQY6dSfiDmnvEJy+6CrnxUtM7MbbSm8?=
 =?us-ascii?Q?LpskG4Fp9oR+TVy4G6wPnJ5vtJHFpfJIIaV4ylkvqVRfbvCRHIbbVNf3dTxQ?=
 =?us-ascii?Q?er+FXrRtEzFjGvX0BwRn8fqZGIpILUdDzpo6EB3LrliFWMIjzS2WEi5ZTVGH?=
 =?us-ascii?Q?I94MDJx/gELpPuZ2DuMbnfekZW+jdeazMGr5r2+s+27kDkq7UAO2REmyZdPc?=
 =?us-ascii?Q?1MdKNcYzH65rGsEsFn+oSaeGvGcr8BaWZgOz+DEytCh92yKU6wK1tll1WYkl?=
 =?us-ascii?Q?i/7strCIxqbumbe3f+ZqgZFHEaeG0GaghNmHnQaF0ynjR8P734h11z2RQ2IF?=
 =?us-ascii?Q?LrGyHjppKM0dQJ3IFZA2034aPrJ4RTTLwGellzty4jgfwmzS9NFjMskD6yf1?=
 =?us-ascii?Q?lZEkHikATTnAmbbvJVkje4JYCuv1xhR1mnZFSgxsi50uscFKNAk+YWL/gS+Q?=
 =?us-ascii?Q?GwTAov/LaeY8papoW1lhfQzTIyFLjisoYmgJM1TKocHCxWHi08my0VHYJrrY?=
 =?us-ascii?Q?3due1I70gCkcBwtQLvbjgROXEo7UglwEcJJNZ9hP3Rd7LinV5xf7NiNaeYmv?=
 =?us-ascii?Q?49rF7AICaUA2xGhuD0VHvTNSQZdxNdqi+eAlivCuOHkeXZRyJsbQr9i/9yIX?=
 =?us-ascii?Q?b9e6GlMDW5Qigh2vL603b9hz6TN8U9wDoD9TmUOW/TmI8OEp59fJiCmqpS4Z?=
 =?us-ascii?Q?hlLwxEQY6m99aM1cG15y+Hejp2t42MPsRKulXY7nJcRrJXPkYvtXgUgQghuv?=
 =?us-ascii?Q?f4gjq83y9AZVBmgrXgXG9QF1alPpbypdn6Toj9wOIB+tRtvg59kFVzWM1/Lt?=
 =?us-ascii?Q?Z1sI0iLSvFDmX5DPGGEm8vHwwhLpzEz7YmaWMRIsWZ57D6CeP1vc1DNc/YUS?=
 =?us-ascii?Q?1JZfVAXatWsja3XLIt7mZ/zdHq4ey3esEIQvcnzbpwo82lZq/0S5/AbH1O0U?=
 =?us-ascii?Q?dYWZPneADpIC8YRl2lXiFrgMAnGNI1CWg0zq3IVteEAwS+42CcjuCdJLIkUX?=
 =?us-ascii?Q?d4xZEbfVqHMff8ZMq3aCS19706R39WL/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fllX+KemW/XwtT97Se7VvtRtaLx8anTU66iwXRl8V7daP0ee4AWrqgXNyn0W?=
 =?us-ascii?Q?ybzKQq0tspe6ElrtfaG9NlaR8UeSJjM2kPr7AQHz+cbhpgY7acRNWzYkwowl?=
 =?us-ascii?Q?wNul2RHAxtqFg4SDbK/1OciqWdyL9z7pWl2jvfnN2cguA24qJD84OQ5ODBwP?=
 =?us-ascii?Q?ws36iWmlNzxafZ2KC0RZV10VE3G7Q2SUxVYGIchqKOE40yMuSu460rAmYKMD?=
 =?us-ascii?Q?NImjGMxJ8X1FFwdBqNvGDOKgHCVO0mc1fwcNE3Kr17kqyZhMz7x8fSXMQJNq?=
 =?us-ascii?Q?zhiZd7pft9wLnVjZuIHaI2oBCTQB/jAnY2iYumMtLUI9gu+Q+GxnqTXTwTWM?=
 =?us-ascii?Q?tO0MRpLP/sfFvxrwoO7Xezyn6/u+BZNPbqkOiMZSinYp8mmty3ifoDpQi0Qt?=
 =?us-ascii?Q?VH5c7cb2jJlw3O5jcdLcXeAl6RcRvAgN3R02kyv8bA29V7YhbNFMw4tHWhlz?=
 =?us-ascii?Q?98VgcWrYoaZoUGAmuoMGL11XyvmLJbH+92tcmbk+zn1IQNdsC9O4vnX/PiHi?=
 =?us-ascii?Q?8phVn6fofC+T5V/PI1ZicH9EgzWxzOEqJybtTSnupJTMe69jxl8joILw4vNC?=
 =?us-ascii?Q?o2RDemyalJz1C2n2GjDb8LUkv6G71l74Or92rZy/AziedXWdHCU+uCwGZsWx?=
 =?us-ascii?Q?0NuqKLLlQI9gO8j0asK8wnb+NSVOvLcRwLXHE0KJ601mc146pdYkzl0IVuHt?=
 =?us-ascii?Q?KgKmQ5cQRMHQo82frks27/y65PnYN1ZsjjPv5Nh9v7vP9qtauXMV6dGo51PL?=
 =?us-ascii?Q?RMN7+b9um88hMdE52LqYw9SIzRr7xsrW4n+WtF1QNrTbSQJF8IEtksXdE3Jp?=
 =?us-ascii?Q?WoUST10UAl9IjkufGl72fxtIu95URD7QhFtWPAk/ZFKrN/gVL+edU19jPuXy?=
 =?us-ascii?Q?TKv+8YZ0u9QqiQOriMi2ipD53PRHCWruEYh17cHVM717ecdqxGPZMc93H53z?=
 =?us-ascii?Q?iI0AshcpoM339lA6Fd1sRW7zkEMmgv84/dtbaMMZm0Dz/yozZY0kP03POsaa?=
 =?us-ascii?Q?M1bVqyv7v/KuSDgjKSjDThY+pxeF+jJqKV7HO7t3ygizTUl2pAg3dWr0GHzA?=
 =?us-ascii?Q?bRJDqwpwqmlnYyDcm5hJtbiVBNaz2CY8wufd4GX77FeSllWNfSYjVyUFYT3G?=
 =?us-ascii?Q?fidT9E2bIY5XQyRWTsPZtYYogZWQjcTbtpxrHOvI1SECQwGGXTplWF7FMM9K?=
 =?us-ascii?Q?UQZGFZzk8m+HGq6+FNER6pcyMcu9YsJnTblQVsKaDKE5GWXlIgZ9iHVhMUOl?=
 =?us-ascii?Q?LzHmGqAfIBOAujSDhMT3VOqpSew4GR3878pJyENa4F4QlZKJvOVteVcH2pDO?=
 =?us-ascii?Q?wWjG9v6ytt6Ogn8VIEw2cpkBar1PgP+5tifmyjHil3zEsxm4DWLsusnMWG87?=
 =?us-ascii?Q?R9LwpQVTc9V5xxzhLvPlWvuCaPd3NhrGxYUJBQwqHUQ+vtymNs0W5Z8so+85?=
 =?us-ascii?Q?6YuDVA0NRA8KRopN0+dZECL3KTyqz6kMR3KZVwCCDgR4yAyCz2qcACwzPr+z?=
 =?us-ascii?Q?66W19yyYmrL/DEdktZDZgC2TsLkDH/bdayz8XP9phojxtc3hE4XI72tqFq5U?=
 =?us-ascii?Q?FXMyhpAv8h7GsNe3Dxee/pjSLGiLH+gwXMLa1ZiY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdcdce9-b8cb-41fe-9d3c-08dd8627ff9a
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 07:40:50.8442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WsZRhZNbRCS4eOFMVoahYTMG8oKTbLR6une30jWqOWpnbSY3OvKTHn653HSyNhY7VkRrvmXH6KcGurVO+nxxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7093

This reverts commit 18d7de823b7150344d242c3677e65d68c5271b04.

We cannot use vmap_pfn() in vmap_udmabuf() as it would fail the pfn_valid()
check in vmap_pfn_apply(). This is because vmap_pfn() is intended to be
used for mapping non-struct-page memory such as PCIe BARs. Since, udmabuf
mostly works with pages/folios backed by shmem/hugetlbfs/THP, vmap_pfn()
is not the right tool or API to invoke for implementing vmap.

Signed-off-by: Huan Yang <link@vivo.com>
Suggested-by: Kasireddy, Vivek <vivek.kasireddy@intel.com>
Reported-by: Bingbu Cao <bingbu.cao@linux.intel.com>
Closes: https://lore.kernel.org/dri-devel/eb7e0137-3508-4287-98c4-816c5fd98e10@vivo.com/T/#mbda4f64a3532b32e061f4e8763bc8e307bea3ca8
---
 drivers/dma-buf/Kconfig   |  1 -
 drivers/dma-buf/udmabuf.c | 22 +++++++---------------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index fee04fdb0822..b46eb8a552d7 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -36,7 +36,6 @@ config UDMABUF
 	depends on DMA_SHARED_BUFFER
 	depends on MEMFD_CREATE || COMPILE_TEST
 	depends on MMU
-	select VMAP_PFN
 	help
 	  A driver to let userspace turn memfd regions into dma-bufs.
 	  Qemu can use this to create host dmabufs for guest framebuffers.
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 7eee3eb47a8e..79845565089d 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -109,29 +109,21 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 {
 	struct udmabuf *ubuf = buf->priv;
-	unsigned long *pfns;
+	struct page **pages;
 	void *vaddr;
 	pgoff_t pg;
 
 	dma_resv_assert_held(buf->resv);
 
-	/**
-	 * HVO may free tail pages, so just use pfn to map each folio
-	 * into vmalloc area.
-	 */
-	pfns = kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
-	if (!pfns)
+	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
 		return -ENOMEM;
 
-	for (pg = 0; pg < ubuf->pagecount; pg++) {
-		unsigned long pfn = folio_pfn(ubuf->folios[pg]);
-
-		pfn += ubuf->offsets[pg] >> PAGE_SHIFT;
-		pfns[pg] = pfn;
-	}
+	for (pg = 0; pg < ubuf->pagecount; pg++)
+		pages[pg] = &ubuf->folios[pg]->page;
 
-	vaddr = vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
-	kvfree(pfns);
+	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
+	kvfree(pages);
 	if (!vaddr)
 		return -EINVAL;
 
-- 
2.48.1


