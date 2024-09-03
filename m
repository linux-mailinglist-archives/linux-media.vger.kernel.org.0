Return-Path: <linux-media+bounces-17450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9917E96978A
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 10:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56D8E28622B
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 08:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679231D0967;
	Tue,  3 Sep 2024 08:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="H+vlZO11"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2066.outbound.protection.outlook.com [40.107.117.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9913DAC0F;
	Tue,  3 Sep 2024 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352908; cv=fail; b=EI5aBC3h8tYxon8+X9eeQTPV+/goWB8iOxJk1BPm123kq6W4EuVS9qTPptllEV+C/QCAucT8HEYiAn41aT7gs/XFmINtu9aD5LUh7OqccRyzbxDuosyZ1J3rmzrZU8yLAkPQSFMbWBV8Za+ddwzZdDF0MhtlWIjSCERlt3yBYnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352908; c=relaxed/simple;
	bh=4TS1H5FaunkQIN3UyBznmjJzf7LO9AMEA2xM2LCIGz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ecHnWoDmCFJTtqd32rJDlMHI3GXxFhVAp1GuKOR1VWA0zoyuDbWs++A2r597S90iNQeE4E1lFZDEPXJJr4S2bh0hU/f5UhbwbFGBXHigmuaeuGQIyWZ0Ev0L7AdmeWir7Ye6a/Yr1TeT99/n3c8r1EmNnb2zdRL7JkattiGkATY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=H+vlZO11; arc=fail smtp.client-ip=40.107.117.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8hvYnT+X/GODP6mJQXAUCOwnRqbS1sLENyuC1HS4cTuabwW1Vk7Vz4y9Ua1wctx2VpOErMFhylj/Jhp1ZXd/t1lgkzAsek6FsOoxM7FKlsbxelGpCpjIL8O2Ozq8n5SYiZmE2fl/6fA5SSGzI0eK9GZLvQblu7D3IYK9z1s7QY9rLFhWJW5MZBVRNHMKP6P407AyP2B1ykCYX6EOu4JjRpLHpjNbDcY2RNXizLfo0Qya57FWp9K8YeqCEKuib8YgnNPYTSgi0bHd2MPaOGn19LHPCsEu4t9xuR+1c5rjWyCBAUMSmPgfwRH0FA/TA8nEnqhwtA2GC92NN1+SFDdsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrcsXSzao/1m9YhUG4R6phJgjboEubpDXKN4lMRZP5g=;
 b=n4a99/BpffyLp4Hq4kcAav0PADuITOjDdGyKLRZz2vfrTa1OIfn0lqv9Cyd3suytkU4a1jwGoShVxjs2iYDrIJ8a/2EXBc9MlpN5p+dQFV/SCPrw/v/IHo4zlKQdTR2Fa3ZtcMaIn4PFGveNkEfQ9Xw0go7Fh0UqUrj+Zzvx4fJiBDGrpR/gKALUZ1gVCGqdhu5nNeiesaBXwp7BB4QzCPPtWqjqITIOcO3PCVGK+u0svu+88QAUGEMHG0An8Z3S/OAD4BzGPNLjWgA5xxhtHNoTO1oCdlkapqlWZQFlfkr5L1RNnC67F5IZyZGJdC+nNjy5GtGmVHj8hCXK34thhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrcsXSzao/1m9YhUG4R6phJgjboEubpDXKN4lMRZP5g=;
 b=H+vlZO11hMpb8fmq4bdvrW1aucm6YCmZ13sfH7jN66OaasJjOLlAdcSyRcG3BxG9nkQg5UNowVvKmRB9kAgVVBKZ/ms+wBkf6rvTrOYlrA7aSSynrjLGeIVfsPk7VuuuQQjmZ9xgQ9ax1VjD1g5mn2lc6SMVWN0Pe8mhrgy0bxCipWP6+Nz7vG7MEwaI5lqCU7XnPTY3miGDdGyKfAwRAwmoyvzAVP6PeojnQQ0SppMM/CaWG0mskypozLcuwtz9LDegjj8EgiqKEoN5JGYn3nIvkPj+SICu/vxwIrs2HiF5dUZZ8nuNIPTCyAXHM/c01PWLjnGc2sghC3rsyfzzEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5359.apcprd06.prod.outlook.com (2603:1096:4:1d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:41:44 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:41:44 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v5 3/7] udmabuf: fix vmap_udmabuf error page set
Date: Tue,  3 Sep 2024 16:38:08 +0800
Message-ID: <20240903083818.3071759-4-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903083818.3071759-1-link@vivo.com>
References: <20240903083818.3071759-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SG2PR06MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3fb7d4-028d-4b25-5b5d-08dccbf43d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S5ePT1QApYkci2YANX2CwlfdpVMl6KtV0ZU/cWsJYA8kT9+lyEjUySDz9t11?=
 =?us-ascii?Q?Lda/8x3P3R8c/8zLn4/clV0oa4WHtP7IYT6hJ2wA3gM19/f2VKaCirKFbn3i?=
 =?us-ascii?Q?nZOXMr5rTqstYwbHwaHHboz62SSjTgicnooHlorYW6CB/K9G2Lp/8p8UUiqj?=
 =?us-ascii?Q?D1WI6cSLEayVmak7OAx+q8sqdIV9upFNrAOkWlqgKL5GrLoTFDRPGq2Uu8S8?=
 =?us-ascii?Q?I2ffX6vdUNQfa25R/2geL+S6QRvS05z/X/lwqzB/9avKqd0nD7JQU8cO7VG2?=
 =?us-ascii?Q?AweaVz3d3sgu/rebdJ3cWEdnYqmezjQwb9bz9y3QiPhxBO1lGoTJh/CJX1wZ?=
 =?us-ascii?Q?NzGoywZxJKUDfsaVFVSHkeiMx07uxkB0uIm61bGyPXjOPE/HqhSiukk0aQkU?=
 =?us-ascii?Q?jN6tTelY39Vp2myaZn6sV6S+wyqxgZmEkgl9qdm4n3/CE+zxUaZOD8OVJOVF?=
 =?us-ascii?Q?WW9wOLaPEexJMZktqFtk9QssfmrA9DsaNOPir30MEOepI00Tm/4vrYEACmAZ?=
 =?us-ascii?Q?JyKI0Rj40bhqPOLyd2TAT3iN2O18YA9+x/m2Mmi7vYXFZP6dvuxV/aNR5SA+?=
 =?us-ascii?Q?TD4DrRdAUfzPVdr2pNtyY/yAIB7ybScYi3b8txIgzMqJUtTQxd/bZ30Zt6Ci?=
 =?us-ascii?Q?ZtDf+xjHQ0IFydCt3EeHBS7kuBcYM6jR+Bh4fPWgjpN78DLGZpNoEuG9gBpm?=
 =?us-ascii?Q?eu6zM0kyUjk8niV3iGpS0t0CXme1C5D87QeF5vOfGGkc4IQ5eiFoCA1wo3+e?=
 =?us-ascii?Q?okwf+DEb4NypKETfvhmRveO6YvciFVxbpsatwYjMUcRbidxo8xWwEHVyLD6I?=
 =?us-ascii?Q?r7JfHd6GFkKkXvie0D3GL8u5ecnlMzHt7QQWV31kR5kp2GKGQYV6XpwH3nqg?=
 =?us-ascii?Q?PeabbSHPZT7Hw2haTBsAqrPezisDwqqi9nMboofkMpJMvRlNEZdhtYYU0U4k?=
 =?us-ascii?Q?UtnfdOR1WIeI8jVN/wLW8bX84RvNr/r3N82lj16r15e744akr5f8U36tio6k?=
 =?us-ascii?Q?ClqoA8hiZ9Pz14XzxpQBB4g8RyJTdvw7j+hhE8m7uioaW+G8RTGKn1qETvb2?=
 =?us-ascii?Q?NDL/kGsd7swRQMNqkMXxhZuNd1RQ1LmcDCDbsZWFiSktkG2S2FLClcDUQ5qB?=
 =?us-ascii?Q?mBz3Kfe+z1p+RmDoYF7e7kOiw9DPK3isAsqr6OKkwywa4e5Sr+tMZRBTW/Xj?=
 =?us-ascii?Q?F5MMu6PyfYu4CXYmmHcIF6q5EaBannkZlBPUkXnZrVbEo73k7j5rS6AbFO4c?=
 =?us-ascii?Q?RRlFw4+8pHQpaLHsrYpzDKvx5zPDBG/fq1MTYPw7EFztGkY9Ovrb509d5BO0?=
 =?us-ascii?Q?PwMQ6+0whGbyMVDGZzvbzxIQcZzm7HmSkSq2JJY/DeBcNT4MNxjTjeXIfuj7?=
 =?us-ascii?Q?Ux+ZznXWR9I5+M8XtjkWa7x/EzrxxFkEowUrAD4cTsf9VdfBVg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y0uOxV/nZ7CdR/i8+0qbQNVkBBWqKEPSZFeCj5piYCeCiy60I+SOPoOVrxMh?=
 =?us-ascii?Q?XfvzlwIKQPxQ/LAiYY5SApPS6YexleRIpM1NIxVGTXR4bSwJvnpS6kvR25mY?=
 =?us-ascii?Q?WvECLeYOMC/ytNyskynFbNGMvyoC+QASwC61xQvm8XDiivXtq9ag6JI6lcnt?=
 =?us-ascii?Q?VSfSAsgob5MUvDm5ef7PNbmE7k66w4dsD18E7kRjZjhNS37Xy5uQzB0P53FS?=
 =?us-ascii?Q?6P2UvMD1SoM5nsIeYLYvfJouY0b4W/hy1FTet1WWpbRw1UQCEpY/IVocUyYB?=
 =?us-ascii?Q?6wQ64RBHTEDFc0a6Yet/3jdSjre9iYWAU3UDcuO1UTx42rSRWpaLbwroXuAn?=
 =?us-ascii?Q?J2Q0HCqwdz/0e5jM3Zt+47iA1kBGPMw2iKAYxmGFcGaA4qnIk08pDi87QRbC?=
 =?us-ascii?Q?Iw373hqxOlR0tw857bUmF5a29BAZJTOi3XzVftmsZuuw0NI0ytAxd/p633CR?=
 =?us-ascii?Q?a/Rvr4nDNRn6JO4X6IUKZdjnsES7jOTkFPBZOGVQFxN5QmTEdYRHGDSIpSNY?=
 =?us-ascii?Q?mqpoA4JVtJMY80KfHqlxJfvrzVtC1AccvWcbC8d9eUd4EqtlHp3CDROMSI8F?=
 =?us-ascii?Q?l+z1jhibzYv8s+yhmUqzbRlAPUySCYt+V3IlODHDedNw3Nu/IwKzVCwjsVr2?=
 =?us-ascii?Q?WjmGLI0/H4bTNvSIcOpeYQTf0rithrvLRpaNBj9hPPLdFYuUgfq/WDFSDFRZ?=
 =?us-ascii?Q?4Fz8yHZanx448OsTYP/Wn3BxGuk+DHXWZmSA6+h6zBhoUNeFUhU1f6IA2wVx?=
 =?us-ascii?Q?MkXOxutxuew8IQ3f7P6PSXi43sNpo4uiz3NL3omPJTx35Dcssj3UofQwi3gW?=
 =?us-ascii?Q?OQZhuxROPm/Ro1nGsqHRH6plx9BuGhg5e+3ZdyyO5KhVuDDbZq2XoudiRN2Y?=
 =?us-ascii?Q?CU0UqHYMthHw8q1kBeOfao6EpECRY0TlVBqLQhgY/xBnyUrRQv5fqle/ema1?=
 =?us-ascii?Q?b7bnYVB5cS47bbS78kL2YEH7SX2xZ0C5OWr/QlCO81e/9+hrcQ2KyR1yIWrV?=
 =?us-ascii?Q?FaiLHPYSte0L8WvZU8soMhXW0cAjc9dlvOcUcJrKPQyh8JIGqqiS/rHGQ8Id?=
 =?us-ascii?Q?3414d+/wouwCW7csrwHqfDQsbbjU48CvmUYRiDbwqIe6Nx2/D4vxz3GQSrfr?=
 =?us-ascii?Q?kxDm8EHcUdKca9Wucg0Ze91SaLcKjSc4piYhlC2qOr1oFk275AldcG5DR93H?=
 =?us-ascii?Q?ljqhAcvXmEpUwP+sajq69nEqx1ZhaCr6Ofm0ABmAddTj4M5i/lMAb2nGd/52?=
 =?us-ascii?Q?SZvahVEXAOU4BHB2x2d8bcRrAE9EDQFmezsmIUp1rd/KTrVeH5aJ312rlUpR?=
 =?us-ascii?Q?I9COa8M0Fdvh73swCiaflhdPNnhEiR7vPmzziao+nt/awlm/iEiN0LcJLfYR?=
 =?us-ascii?Q?VNsEomvcRfA79X1CKhIlhnvnQC3ZZaWXKu2YOnUdMDr++aq1w0DMaQJfsCNM?=
 =?us-ascii?Q?uLvbV/dSXEN8GF5O2kvojrfGLc5s9iqo3HfBVj9HuVK8Y2hIouchLvr9oasb?=
 =?us-ascii?Q?GOojTi10g1tQarGY8BK0NiaohWj89eCgk/V0efmIK9qcVFqpHZdYGDN7NdGp?=
 =?us-ascii?Q?26hYt0ni9JJQtkFGQGitYUz1SERRcw+NCueTlc4R?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3fb7d4-028d-4b25-5b5d-08dccbf43d79
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:41:44.4878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dY3C6Ky295kVXV28dx1WLvIrNdXvdJNQYKrjABlVqN36hZv4iiRysciFAU5DxAGcgcxGEaUPqO2ouTSo1fggbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5359

Currently vmap_udmabuf set page's array by each folio.
But, ubuf->folios is only contain's the folio's head page.

That mean we repeatedly mapped the folio head page to the vmalloc area.

Due to udmabuf can use hugetlb, if HVO enabled, tail page may not exist,
so, we can't use page array to map, instead, use pfn array.

By this, we removed page usage in udmabuf totally.

Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/Kconfig   |  1 +
 drivers/dma-buf/udmabuf.c | 22 +++++++++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index b46eb8a552d7..fee04fdb0822 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -36,6 +36,7 @@ config UDMABUF
 	depends on DMA_SHARED_BUFFER
 	depends on MEMFD_CREATE || COMPILE_TEST
 	depends on MMU
+	select VMAP_PFN
 	help
 	  A driver to let userspace turn memfd regions into dma-bufs.
 	  Qemu can use this to create host dmabufs for guest framebuffers.
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 789fba312a68..456db58446e1 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -105,21 +105,29 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct page **pages;
+	unsigned long *pfns;
 	void *vaddr;
 	pgoff_t pg;
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
-	if (!pages)
+	/**
+	 * HVO may free tail pages, so just use pfn to map each folio
+	 * into vmalloc area.
+	 */
+	pfns = kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
+	if (!pfns)
 		return -ENOMEM;
 
-	for (pg = 0; pg < ubuf->pagecount; pg++)
-		pages[pg] = &ubuf->folios[pg]->page;
+	for (pg = 0; pg < ubuf->pagecount; pg++) {
+		unsigned long pfn = folio_pfn(ubuf->folios[pg]);
 
-	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kvfree(pages);
+		pfn += ubuf->offsets[pg] >> PAGE_SHIFT;
+		pfns[pg] = pfn;
+	}
+
+	vaddr = vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
+	kvfree(pfns);
 	if (!vaddr)
 		return -EINVAL;
 
-- 
2.45.2


