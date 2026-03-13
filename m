Return-Path: <linux-media+bounces-55758-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NrtLp5MtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55758-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:42:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F72883EB
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F4E430E431E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0763CE492;
	Fri, 13 Mar 2026 17:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DknBq4jC"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2314373C01
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 17:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423676; cv=fail; b=W1W7tIgSKGWDMTV3Uc92uhE2JY5m3W/kgFzFvUP5p/fbGEcbSEgX9sAPyDKiMxstf5D9mALmsH/PqkfyQZnkbMYW8T4dIVur2hFWLlph+xyPAp+Q7ixAkt2xO5vRM+qjaZuJWKnIzeHo63+hGXWzgPZSN509sNbwzeTSZRbyIyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423676; c=relaxed/simple;
	bh=B9apHlJZpdiuXPUZA47PDBakCqLNi1vskpAY1tzlzSY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GzB/jCCIH05f7nvY1X3kyFkJBur2h1575Dr2dM+XeS/M3ClbxwUfxb7CiLEFAGmEihrFkVyRSWcohPFcWFEx/C+1Ayv8dmHYkLyN1vaBryl6zPfkwytyY22gCUteZbV+f5irfbxL+JwstKvki/iytrh1Iw8awFhSwyE6vfXTFik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DknBq4jC; arc=fail smtp.client-ip=40.93.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d63PAqVkj1OtXIZ3lGpHqHLiB96niBpjKnjX73s9HSFE1tKHKNiHZ3U19jsM3jkhuOYIFkq8Dh6NSKk38V05PeoFZ2h71Lj2tERdWnibY9s1VyU18jL4XJripM7Orz0ZjCaKvpErJ1V1Wkk7+pkphh2NVfJiI+kP8ws6M5Nz0XeQoCDmNRKS2B/FBVZs77TiPv5YZo3UuF9tbVorPMmpwbV2Uwa5ir31QrywMehGUSmeFKVeHqX74pp41rIA+ZpUSyLXo9O4/ZiCJ2I8Um1rcTjJ4wqiZOiG3oBGiRVYHVKOIrObpTJF0Z2sU9vPBHG+aot4UG8ymbQ/sdNoMIH59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCzK7SAwtZVNI0sXrW0XtwGXtonbY2IGWuWTglvOgNI=;
 b=W9T4LrxnbiUUzH/yQ7HUHn2J50fyNC4tlYQHaGDmfc6CFI9WVJG/5Yq0l58bU98drdGnucdiAxlhdi7oUivAmdsFQrbdq0dWEQ5uJkxnbNg1NwGgRBSWn3o9dZYiIxq3jOdLpJF3fnDar7FOz0dTgzDhKm/HYKB6zYjoGztEU+PeAImX6MgQlVvq2zMgEl0QGbKGBvU7Nu0Fi6q/3Iaj8K8TtjLR/ZmKzVK/PxUgr3RibgSBbGVR/I/S2D3oO9/m+x0FNr8hQOy4wwodjcaKIXTCtW7SD5vvWQ9wgHzH9lpcQtuk3qMgCfpU1enyhHbkm29um5qXjWNll3Vxv23lnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCzK7SAwtZVNI0sXrW0XtwGXtonbY2IGWuWTglvOgNI=;
 b=DknBq4jCBzvf/lXyeIvlRxj/EQadCa3w+S8BESvcYDgYlwlbJoneFs2Oc645cpBUQnb93TWXq89Rcm+O5D/8K4aBzf+Gt3yz7LQ+bCpTADwDstabE3l35MTnT1sYTvfcyXtDDQXTcB0/msMEg8MsITZ8nrtt9yvVRe2NbF7RkwpRT2YTZnH5b9myaVeQwH1jI4u5+cQ88Qi3kOGNYltSTsZCbY7HP15ZGMVTEmMGO+rOl4Z9fCgq5bVWuaH5oV6agkfzVR7ZBNGsB7c0HpLvoehglVyLgFuninH7gRp0oauigAcSUpvHunxux6dxGbrzNvqdF+nUqnKcWNtu7O3UbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB7425.namprd12.prod.outlook.com (2603:10b6:510:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 17:41:07 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Fri, 13 Mar 2026
 17:41:06 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Dave Airlie <airlied@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	David Hildenbrand <david@redhat.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christoph Hellwig <hch@lst.de>,
	Hugh Dickins <hughd@google.com>,
	Julian Orth <ju.orth@gmail.com>,
	Junxiao Chang <junxiao.chang@intel.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Oscar Salvador <osalvador@suse.de>,
	patches@lists.linux.dev,
	Peter Xu <peterx@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH] udmabuf: Do not create malformed scatterlists
Date: Fri, 13 Mar 2026 14:41:05 -0300
Message-ID: <0-v1-42779f29381a+4b9-udmabuf_sg_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA1P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:461::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: e36e1d7d-0c33-4e00-5f1e-08de8127b48a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	szgdETTy3OI6RkeD6ZqnwOe4NruZ0Gmym68mzo/+B91HFCo++2RAro0gxgLaJVSpLLatsV0faV617hVyRpFAkneHNuMlmBHRoFb6qN35jNI/+19vAp/iXjSPvAH3fCMjiW9hTy5tZ+4tI/lZ0FTWLH0kV2FVb+8zYPwsi8Sepevx7mnGs2M6iQMajCrz1oOInznokLtsO7o4Xc1CKbNIY5PTEhN/kIgEeukA6r8SDp6pIyEXx2RWDdh4a9micCVub+/WU9QKHntAky251fQHUwf9HgajfSoJHBqfQ/RGBLqidrpUy4HPXdZBXV356LI5+wUYrovT6oW9IHJO8gHDJOrhwv0hcQM5BJqp9kbzNXIPfTKDcW0wUew1TXBmwUWYgqNJIZVJwKbU1+StxmbGgY7agb30vTa9lSBlHhL3lc8U4UgX93HarOt2nfzi3mWvSEWFHm/FwUzLWRnUUSROdehvn7SAe+M62j40Rx1S22ghmH+kslPqIPuyzL+R8Ez4HrUIeopxzXKeAz36kKCivQ5EmYI8ShRaPI8kHfF8HKnWyNOYD5vpo5oiZtQsQwGUzUp1XTuT5kcWaqID8G0slWnrwmdyRZvLJxVuA9M9qzcZmiLLmSG3qTGT+BbJ2wRRzR2IIFiich/yPwR+Dpdvwu+9hNuvpYH9PcVakCuPKXF1KOfDLRYRYTPCv4HZ3PfzKKU9nuXYMN9AckVT+3h9SMeXnxO91okw7KNDqjuKRno=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DiSWQsO6pMHvkO18k1BKXFdKFZaN91i31zFE11LbCGnii/zkMTFXZBLTNrLl?=
 =?us-ascii?Q?1C/X2aBjiwF/OVtAlP/whwk23cJA4vdpW311kv8MiggexGuUv1454+svAVWW?=
 =?us-ascii?Q?ZNXW0R8DfladE2C32bjVLaYVThtR0C8ocnoQiEKPJj3zxsipRpnhHQlRZsYM?=
 =?us-ascii?Q?VcSxueTn0FrkHPMv3eRIHEiMzZbaoTxSvQjDq9f3Gsldh26zB3AbsEhsVenF?=
 =?us-ascii?Q?W1aVkXZuF82Nj7yS82ZMVTbGCtgqYj98t8cEA84jAIWLcwuzNr3Ttl23WODl?=
 =?us-ascii?Q?npB5PwHtIQbp9xNul8sTlXGh6YInR1kWiAyHehXpcTuWfb71q3jIbYtim5D8?=
 =?us-ascii?Q?4KPLlWLf7H6FUtmKRPcFY2aujlDfJmp1UWybCQtoi/JmFo914xj+lGWIjfPn?=
 =?us-ascii?Q?kN5Dff/PvwiY1ZRETRk6zQybUPnvu9L+ef29CVsBLQtqcBBAEGYisCwzZpDd?=
 =?us-ascii?Q?bZ22n5KXQifjLf9g8AgDcLDoz5go81vTA/xx0QyuAsrykC/IRGwD8+mjT2Ug?=
 =?us-ascii?Q?StDl/CkYBgtE2tsqJQJw+VUu5bFtANgkmApjdEJuJbo3rpc0vJb/32LmvUhE?=
 =?us-ascii?Q?1umnh6UT1X/909QT+7IAFX6IDlukVu7O4BYeK5jn9iF30/qXcpWUUMKXzjqx?=
 =?us-ascii?Q?Y5TcHp6iOLEHLNnV/GpnosIY2pZiMrour8bCY6IKa++Qu+zs2MA7p4Vs6iEM?=
 =?us-ascii?Q?oi+dKznEjg/FK4RDWqX3ixfcJHuTK+bzbeS5ddorlHojFPrx9uk6jq4ieb69?=
 =?us-ascii?Q?Ui+KcdhANxqlbNu6BgT8Fh1/9wAQlKsvda0Lv5hl2TnWLKSsSbEQNv8NyICC?=
 =?us-ascii?Q?5bidW9LYjKUgWFNG13eK9l1ClnV+iVzlRCPMqjRVDRMTI55ZPtnKUz9vbo4Q?=
 =?us-ascii?Q?d98pQE6zXJw0JW35mwVLYdK8BIIWu83Dv4HJQNDalz/HTr/wHbZZjRYUfv84?=
 =?us-ascii?Q?HGZhbxl2LV+wfpC+GfSneP1K7nbVjJTZk+2wJ0hjnZa1uFq/T4L9ofXDOONw?=
 =?us-ascii?Q?v8T9b4mggnSPlDX9kGjB1BPZk/ufOzdbfFs1WAczEBLprwZ3jMQodFe8vIMf?=
 =?us-ascii?Q?1dLR3f3y8KvZGs/7+kaOBvVJ1TVQCzkiYURn+FLw5jI9DjTZayuMusvgfoRn?=
 =?us-ascii?Q?hiPN+4X9t9+fzvXMFaYvBlptGp6ZMzv2LZMowjdA13reXVPA2nJm6VFisB6Q?=
 =?us-ascii?Q?+8hXfTt+q1GrtwVOoqoEVvXP2uW3JDCewRDD007amppzJmEVSvfrLmbSaT6q?=
 =?us-ascii?Q?jBoiH/dkNh4pwxVmwNgx+7UgJ7OI4vVyMPlvp3QoJPjdsTjD/pYNzyW4HH9q?=
 =?us-ascii?Q?qzwF9OuFkMmB5M1gRTeerwlbJqyrCGX+E5oq22J2es/0a+SkxauFudQmToVW?=
 =?us-ascii?Q?QCXaj7QKxWxUi8UmAZqBqpRxZ3mc5PZdbVLE+iBB5RuDZXM7J7/CrxVbO+O8?=
 =?us-ascii?Q?pZhFF3ztgIA4kRDpz4oHt90Rahv6PLtbGkbfpDAluLxY+S/hfILm0ViHFW+J?=
 =?us-ascii?Q?/ju6l6VIZ4ApxPCgT4b+yubwwdsZHpPty+gmwhB0Jkh7Vywfs/2HDzpAOGu5?=
 =?us-ascii?Q?uRFlOQV8akkyJvA5qpj+gPvWZgDEoQ49d8KykhhukvFAZoM0//QpTLgyJTlg?=
 =?us-ascii?Q?0hcvnar6jS03jTEoiz1oDFFOJg5j+eA1SYvA8ynoGr0wwAJtDsSonvshsql1?=
 =?us-ascii?Q?mUiM99jcoPDUwfv4yQNm97hHJm+HzjtblRtNEPSb4j33XZuAQmilFdJEYU/Y?=
 =?us-ascii?Q?0gcIKt3wOg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e36e1d7d-0c33-4e00-5f1e-08de8127b48a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 17:41:06.8239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fC/Y37F7f1BylTGNoNhZU9za+vUw3gSXuVBkfRm4QxY3H6pwVPXJPzn0okgFI89Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7425
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,linux-foundation.org,arndb.de,ffwll.ch,intel.com,infradead.org,lst.de,google.com,gmail.com,oracle.com,suse.de,lists.linux.dev,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55758-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 209F72883EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Using a sg_set_folio() loop for every 4K results in a malformed scatterlist
because sg_set_folio() has an issue with offsets > PAGE_SIZE and because
scatterlist expects the creator to build a list which consolidates any
physical contiguity.

sg_alloc_table_from_pages() creates a valid scatterlist directly from a
struct page array, so go back to that.

Remove the offsets allocation and just store an array of tail pages as it
did before the below commit. Everything wants that anyhow.

Fixes: 0c8b91ef5100 ("udmabuf: add back support for mapping hugetlb pages")
Reported-by: Julian Orth <ju.orth@gmail.com>
Closes: https://lore.kernel.org/all/20260308-scatterlist-v1-1-39c4566b0bba@gmail.com/
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/udmabuf.c | 49 +++++++++++----------------------------
 1 file changed, 13 insertions(+), 36 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 94b8ecb892bb17..5d687860445137 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -26,10 +26,10 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is
 
 struct udmabuf {
 	pgoff_t pagecount;
-	struct folio **folios;
+	struct page **pages;
 
 	/**
-	 * Unlike folios, pinned_folios is only used for unpin.
+	 * Unlike pages, pinned_folios is only used for unpin.
 	 * So, nr_pinned is not the same to pagecount, the pinned_folios
 	 * only set each folio which already pinned when udmabuf_create.
 	 * Note that, since a folio may be pinned multiple times, each folio
@@ -41,7 +41,6 @@ struct udmabuf {
 
 	struct sg_table *sg;
 	struct miscdevice *device;
-	pgoff_t *offsets;
 };
 
 static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
@@ -55,8 +54,7 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 	if (pgoff >= ubuf->pagecount)
 		return VM_FAULT_SIGBUS;
 
-	pfn = folio_pfn(ubuf->folios[pgoff]);
-	pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
+	pfn = page_to_pfn(ubuf->pages[pgoff]);
 
 	ret = vmf_insert_pfn(vma, vmf->address, pfn);
 	if (ret & VM_FAULT_ERROR)
@@ -73,8 +71,7 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 		if (WARN_ON(pgoff >= ubuf->pagecount))
 			break;
 
-		pfn = folio_pfn(ubuf->folios[pgoff]);
-		pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
+		pfn = page_to_pfn(ubuf->pages[pgoff]);
 
 		/**
 		 * If the below vmf_insert_pfn() fails, we do not return an
@@ -109,22 +106,11 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct page **pages;
 	void *vaddr;
-	pgoff_t pg;
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kvmalloc_objs(*pages, ubuf->pagecount);
-	if (!pages)
-		return -ENOMEM;
-
-	for (pg = 0; pg < ubuf->pagecount; pg++)
-		pages[pg] = folio_page(ubuf->folios[pg],
-				       ubuf->offsets[pg] >> PAGE_SHIFT);
-
-	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kvfree(pages);
+	vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
 	if (!vaddr)
 		return -EINVAL;
 
@@ -146,22 +132,18 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 {
 	struct udmabuf *ubuf = buf->priv;
 	struct sg_table *sg;
-	struct scatterlist *sgl;
-	unsigned int i = 0;
 	int ret;
 
 	sg = kzalloc_obj(*sg);
 	if (!sg)
 		return ERR_PTR(-ENOMEM);
 
-	ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
+	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount, 0,
+					ubuf->pagecount << PAGE_SHIFT,
+					GFP_KERNEL);
 	if (ret < 0)
 		goto err_alloc;
 
-	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
-		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
-			     ubuf->offsets[i]);
-
 	ret = dma_map_sgtable(dev, sg, direction, 0);
 	if (ret < 0)
 		goto err_map;
@@ -207,12 +189,8 @@ static void unpin_all_folios(struct udmabuf *ubuf)
 
 static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pgcnt)
 {
-	ubuf->folios = kvmalloc_objs(*ubuf->folios, pgcnt);
-	if (!ubuf->folios)
-		return -ENOMEM;
-
-	ubuf->offsets = kvzalloc_objs(*ubuf->offsets, pgcnt);
-	if (!ubuf->offsets)
+	ubuf->pages = kvmalloc_objs(*ubuf->pages, pgcnt);
+	if (!ubuf->pages)
 		return -ENOMEM;
 
 	ubuf->pinned_folios = kvmalloc_objs(*ubuf->pinned_folios, pgcnt);
@@ -225,8 +203,7 @@ static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pgcnt)
 static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
 {
 	unpin_all_folios(ubuf);
-	kvfree(ubuf->offsets);
-	kvfree(ubuf->folios);
+	kvfree(ubuf->pages);
 }
 
 static void release_udmabuf(struct dma_buf *buf)
@@ -344,8 +321,8 @@ static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 		ubuf->pinned_folios[nr_pinned++] = folios[cur_folio];
 
 		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
-			ubuf->folios[upgcnt] = folios[cur_folio];
-			ubuf->offsets[upgcnt] = subpgoff;
+			ubuf->pages[upgcnt] = folio_page(folios[cur_folio],
+						subpgoff >> PAGE_SHIFT);
 			++upgcnt;
 
 			if (++cur_pgcnt >= pgcnt)

base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
-- 
2.43.0


