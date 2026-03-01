Return-Path: <linux-media+bounces-54018-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC/rAEiMpGlrkAUAu9opvQ
	(envelope-from <linux-media+bounces-54018-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 19:58:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC6D1D1296
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 19:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28E073004CBD
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 18:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C3F2C3255;
	Sun,  1 Mar 2026 18:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BVpaB6Eu"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011041.outbound.protection.outlook.com [40.93.194.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B77928000B
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 18:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772391491; cv=fail; b=O4QIbwxLNF14R4kEkyyC9auqRiQ2s8+dkE6wq+5CM8HY9AY14TwM8w7j1RscJXn5xqRWA7aPzJaPAee6ICcYsyGTrWCuMM0Pn9YNaT1vHzlMq8P5/wZx10TKIThOH+Vavxhej9yJIZ/DjUbkwcG3g2B+o2o92e84xPofJvgiOZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772391491; c=relaxed/simple;
	bh=vrtow17nfspkk82vd29DSfjggJgFCNIvqF9VuA4/szc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JAf+Oc31OhDnXyz5FuG5o3eVMGdXqS+B+8zIPz3uUbTozTTZvXU7A6VZnV8gkoyGk1oC6yN+vlBJZpQIF6S7uUmzyM3eH26X5nCqf9w491tz/sY1qIPWPSic9WUA+iyim0K+uXGxFgu2wm+KRm9wT4A8eZL+Zr5STVvVnJwiqig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BVpaB6Eu; arc=fail smtp.client-ip=40.93.194.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ns0rvvhZaIUUebxbk4v45NXBVYYK2W/z7mx32oAGWZbIKKrGjJ4NDY0XuFuto/Curvztt4OXKpxxDrFhBQuljstHkDUSsVt1o2MKvynoJkwUmMt3i8b4pRNM/4+TFXt3iBamtoQ86tLA6SPbQpG4MRAICG/pnwUoIpzmR3NsAMFZojEdeK9ESI3VMi5wloM9Tvx4VCkJ0OZr5My7a6GWWGxO2UPhflxEWaPHYuuxG12Z6FMd+390uC+JxlIWL22Uj7ievaqgVxsrPQxAPS/NeW7VJNwXi+rBL3HAQnJ8i/HAJlc6PTsbF/uKp4MZ5dTwqygAGUOwauKXWN18sj7/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DZNcxOD1jpsUjrV9l+z5rGHQTc15PlZFbLDCINc2Xg=;
 b=LrAo4kr/2cZHr8y1t61ZtG0WSKPpMTDzc4C9t6tTYGADrR+eqVlV19pbpdj0SUJxg72CGuzaMMRkXArFU4KERfTonRUu7j1AKelCXkaxlPjMzikn8MWhyRIMEwgRlscCv0pLPhekB393xNf7yPj43C/HwJppUtZmEliQbCvZjB5GqXHv443Eb1y0Mn1ZAlTmvzF4FtN0nFyhVWLIx7wIQIwf83TzYDFPdbmmHbQLYgURYgR7uio+AlnnW7Lbj6cxFyUOmbSJ3KWYoxZBO4wrIRgLwVCllxhjnbW9Zq9G/yvs6ezBFwAV9tx7y5L3Jifa1hF7clE9fg9ogVB51LGBFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DZNcxOD1jpsUjrV9l+z5rGHQTc15PlZFbLDCINc2Xg=;
 b=BVpaB6Eu7lWQEmP1IAXJi45NedzOb0wQzGl8Lzea6iRehVzjBXvKK5W2Cy4hLXWEG3bIEskRHJPmCbBChqQZcyIGhca4TkfDMTjk+H0hhocJK25qcpyK3mTOwsWqzmSM3ePfD9jJCXH7Vn2axK/5OEvtqOgrX/UheP/5hMKbaYOYYmIx5gba4VED/Si+cXqR1WQiDb8ECwuxiyjx0EEP235FOwNmrghqV8JWHn+l4Wtz1OgSzQ9aCIhjOwQgmsFRulCimH5apz/Yu/pk6AIfrGM6HXx7t+HWeQ1kQG3PeYm0K6/aw6SWSYj14z9a7gUEcIsEEGtMHFGdnSB4B6/4XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sun, 1 Mar
 2026 18:58:00 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 18:58:00 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: patches@lists.linux.dev
Subject: [PATCH 3/5] dma-buf: Change st-dma-fence-unwrap.c to use kunit
Date: Sun,  1 Mar 2026 14:57:55 -0400
Message-ID: <3-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
In-Reply-To: <0-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:208:32f::29) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL1PR12MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: 95bfcaae-02b4-4e5e-23f4-08de77c47496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	DAOaOTp1HYL0wWdgxc4RYeL+nOPswqK7C8semsK7TmGtsg0Z8yVpJEBZ8UUpbhTHEHXGhN5Hpea1s7z6Z451xpgyfSva6vD51W3T2PLyrGMOFamU+HFgAQnu9xciRfF2w+fHF05kNbAmIu51tJcf34fMh5TNQ+KFqSqkHstJbxe3DICC9RNzjZtWOLNhwsCrP9s/GswDmRjArHouBgN9ST2HN2KbJXiT7jgp/K53vEZVtvhgByM0v4ItDFpy181iSu+DZBPQjo5npe16ZlfHWRlx+rSLKMGUTpL/rXSLBhVD6kBa698q6g4EkIzTsG1BPLW6/G+qJhTeL0KhPPW0FN1q925mRKw7asRABq6aE//Ohs8Riwzka3AtL/9V6AiLJQrnBrqxEeK8dViAWaPFj0o1SfxcDt2MBdtUmEnYjlFhSMD3nbLsELvGSmQFu33Jf+2cBFcVulTn0mn8Kh434loKvcQI/HUW5p5C+H4/PwAuoLl1x1GWfEJmLer7C/ZOrDYlFlTcNrJqcbk9+Y+FgaBNurMrxMsPXq1ZqJwOh0Fn8ytE7LkVhOxZxsOxTG15WzlArxvi/siQBB+jBV7IkgGB7uozZrUeUwFl3Ar2PZbwmDdihxrVsrdaZqAr8Ckbn6jQpPzlyJKpwX+OV6HUOE78HO8Dj0FqwisXHtpMLSyPSxap32drDEt/P8lG23/ogN810iU4qYQPqHkF0yYsWztZmZrdmr8lVHkGtz042ognrVFy1DX6MLHTsVAegEJoYs0JLvcKVrAe+5ICS17Zww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R2fdbAPYFR5mkwAqieNDBXuqcie/QaY8lqEFKjmUKTODuHj1JAcGSS5HIrQ5?=
 =?us-ascii?Q?+B/DRjCHooAgHwGjfMCrrKaRUKc16joNXR3QsZJ2Xh9PwSzEuJJKugPGhP0L?=
 =?us-ascii?Q?0K/9JVl1f2jPZXMNd7vUVJFxXY5w5M2jsy9Mn459P61u6zMC57nTFPX8mIHW?=
 =?us-ascii?Q?NzTX5BgMoKfc6tmeSXsEJnkPZhtRut3hn8inZdEWsvKBEbyoORNnH0g8iYVu?=
 =?us-ascii?Q?6Ab9iLJ+Ym3cLc5bWS4DP2yP1vZWVCvzFmXjbCXOnFlU3DRrpUyZEs+FYeyE?=
 =?us-ascii?Q?wZ7JZediOEbm5Ubvzi8ivNP9BzY3QjJynNNKrpf9o1unZEmu5QYe3DCqUmXi?=
 =?us-ascii?Q?JOh9RulyKyaFiWAq5adMHaflf/01XJD5nlV4FrmmVMdf/YYKbM6Tbrgzp1GH?=
 =?us-ascii?Q?CbcfZGc2AXPSQBgiKrcyA0Aaib5XUWvDagAfrIyMJDXR564caIYRSLgdWayH?=
 =?us-ascii?Q?CCbHByIT2bZbIiXd40OUSDubFurxu7rMA+N6OmKYvAttO3oytaA0aKqvJAlv?=
 =?us-ascii?Q?vJvg8XzOvqqLbCkrkG0uvfHd/EL96Z8veWAPFxYUeWqq9yWNOjqs3NdPv6zU?=
 =?us-ascii?Q?jxROaigk2hjeMB/Hg0/bVibg8HOdokyHwCr2jnxhtEgMs+JxxbXuo1JcjgWu?=
 =?us-ascii?Q?J22VJK9p9rxhFCGqguP74StOqYwPZqnug8d2XH8PcNy1OHlGLnIooMwNQtwG?=
 =?us-ascii?Q?9CdX2+/WA6kZZyosXPvU1u2Q7jMRDKELwNH8vu6G1Z+MN3by0XdPAuD2thA4?=
 =?us-ascii?Q?qtaPNc5Nlces7yNR9smNf3gNIc1zVh/P60DokmSlJK9bKFNKfbtRUY5dhod0?=
 =?us-ascii?Q?plFCI9I35lJKQz5Znx3wUIOuQduFIAor1B+eKjL3tONvHqIEeP+3dbov1FzF?=
 =?us-ascii?Q?VtqaMdMthpktUt1MUKo+uWfLHQI68Mt3DEZFDVYJUN7sDVtspxzEf+Z44xTm?=
 =?us-ascii?Q?SJu3dgTuriBnM+WJpbFUMhhcshiLRaDwZSUS30XczZauLnbe2S6cDcKqR7Zl?=
 =?us-ascii?Q?9ppyamLXBg4+KB4N+dz5hcsdAD4OYwgP+Wy2/i/urNyF4RSfaNXqiG3Vlyoz?=
 =?us-ascii?Q?6nQL6kPI1Cd2DYHXBae5m3jYHYemoMI2VtxawJRJSm0lAScbLFVfcHfNVTZ4?=
 =?us-ascii?Q?Ka+7vfUs4uCtnkTgjm7zaO53aHN7J+LObbfHuprSlo4dOflqGxSh6Qnta4+J?=
 =?us-ascii?Q?aTWV9BhphyoR5ffu3LZY9sS4t+rRdaaxrw2EZzazUZ1MjDPq2KDYYIbC3b4A?=
 =?us-ascii?Q?e0s7EN30zB2sDUNnWIZzT5EXb/Xq2suJxBrulYFvomJeCL+jF5369ZogTr8R?=
 =?us-ascii?Q?J3JFLMgRDnDpGBSjtmRYAHTUdQn2EjD7NeT0W09vbp3c/jjuJegVQEjSPTFc?=
 =?us-ascii?Q?b9fT1l/MjWrVsq3AD2NBB57VU5N4lrmK9D+4FH83S2oCYNxMJ1YtFqFFfrfy?=
 =?us-ascii?Q?0PmgfBVEdSq2Rj5/pCL7G6+0uoOO+tqkHl49fDbRZKjiavVr+x/oPoMaGDVN?=
 =?us-ascii?Q?dmleJu26IPcNdT/FM40GEk5j54njGd8r/54NBoiklJigFjfHCv8SDni4xnJd?=
 =?us-ascii?Q?k6VfBCGGscffmx0jGg2rUd5A6YkgB5OBar3k1X5THjNaGSG8rOVptIeViNZt?=
 =?us-ascii?Q?30XZ8qrLQSD4FClyJLexfUTPsaWuw8/YDAMs2aTt2XjSPw5+ep86G9bn886N?=
 =?us-ascii?Q?FrcsWtF9GKgvoz7Nu/Yy3i4ckvWTb8/44/+8hF+TBP2f05NYqgke9BHsWIUx?=
 =?us-ascii?Q?Vt+hf7EBEw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bfcaae-02b4-4e5e-23f4-08de77c47496
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 18:57:59.3575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIIqxMisUSLIc6CvSu5vbAuKZcV1NfSLRhSWQswYjMfklCx1hz4cn15ESlRAYrWQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54018-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,lists.freedesktop.org,linux.intel.com,lists.linaro.org,vger.kernel.org,intel.com,ffwll.ch,linaro.org,ursulin.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0FC6D1D1296
X-Rspamd-Action: no action

Modernize the open coded test framework by using kunit.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/Makefile              |   4 +-
 drivers/dma-buf/selftests.h           |   1 -
 drivers/dma-buf/st-dma-fence-unwrap.c | 290 +++++++++++---------------
 3 files changed, 129 insertions(+), 166 deletions(-)

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 37c94562e677ca..65bda1b7cc73eb 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -9,13 +9,13 @@ obj-$(CONFIG_UDMABUF)		+= udmabuf.o
 
 dmabuf_selftests-y := \
 	selftest.o \
-	st-dma-fence-chain.o \
-	st-dma-fence-unwrap.o
+	st-dma-fence-chain.o
 
 obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
 
 dmabuf_kunit-y := \
 	st-dma-fence.o \
+	st-dma-fence-unwrap.o \
 	st-dma-resv.o
 
 obj-$(CONFIG_DMABUF_KUNIT_TEST) += dmabuf_kunit.o
diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
index 0a348a5cbbebc7..7104cf0cce26d1 100644
--- a/drivers/dma-buf/selftests.h
+++ b/drivers/dma-buf/selftests.h
@@ -11,4 +11,3 @@
  */
 selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
 selftest(dma_fence_chain, dma_fence_chain)
-selftest(dma_fence_unwrap, dma_fence_unwrap)
diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 9c74195f47fd33..51c87869b7b82c 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -4,13 +4,12 @@
  * Copyright (C) 2022 Advanced Micro Devices, Inc.
  */
 
+#include <kunit/test.h>
 #include <linux/dma-fence.h>
 #include <linux/dma-fence-array.h>
 #include <linux/dma-fence-chain.h>
 #include <linux/dma-fence-unwrap.h>
 
-#include "selftest.h"
-
 #define CHAIN_SZ (4 << 10)
 
 struct mock_fence {
@@ -97,52 +96,45 @@ static struct dma_fence *mock_chain(struct dma_fence *prev,
 	return &f->base;
 }
 
-static int sanitycheck(void *arg)
+static void test_sanitycheck(struct kunit *test)
 {
 	struct dma_fence *f, *chain, *array;
-	int err = 0;
 
 	f = mock_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	dma_fence_enable_sw_signaling(f);
 
 	array = mock_array(1, f);
-	if (!array)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, array);
 
 	chain = mock_chain(NULL, array);
-	if (!chain)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, chain);
 
 	dma_fence_put(chain);
-	return err;
 }
 
-static int unwrap_array(void *arg)
+static void test_unwrap_array(struct kunit *test)
 {
 	struct dma_fence *fence, *f1, *f2, *array;
 	struct dma_fence_unwrap iter;
-	int err = 0;
 
 	f1 = mock_fence();
-	if (!f1)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f1);
 
 	dma_fence_enable_sw_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
+		KUNIT_FAIL(test, "Failed to create mock fence");
 		dma_fence_put(f1);
-		return -ENOMEM;
+		return;
 	}
 
 	dma_fence_enable_sw_signaling(f2);
 
 	array = mock_array(2, f1, f2);
-	if (!array)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, array);
 
 	dma_fence_unwrap_for_each(fence, &iter, array) {
 		if (fence == f1) {
@@ -150,43 +142,37 @@ static int unwrap_array(void *arg)
 		} else if (fence == f2) {
 			f2 = NULL;
 		} else {
-			pr_err("Unexpected fence!\n");
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Unexpected fence!");
 		}
 	}
 
-	if (f1 || f2) {
-		pr_err("Not all fences seen!\n");
-		err = -EINVAL;
-	}
+	if (f1 || f2)
+		KUNIT_FAIL(test, "Not all fences seen!");
 
 	dma_fence_put(array);
-	return err;
 }
 
-static int unwrap_chain(void *arg)
+static void test_unwrap_chain(struct kunit *test)
 {
 	struct dma_fence *fence, *f1, *f2, *chain;
 	struct dma_fence_unwrap iter;
-	int err = 0;
 
 	f1 = mock_fence();
-	if (!f1)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f1);
 
 	dma_fence_enable_sw_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
+		KUNIT_FAIL(test, "Failed to create mock fence");
 		dma_fence_put(f1);
-		return -ENOMEM;
+		return;
 	}
 
 	dma_fence_enable_sw_signaling(f2);
 
 	chain = mock_chain(f1, f2);
-	if (!chain)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, chain);
 
 	dma_fence_unwrap_for_each(fence, &iter, chain) {
 		if (fence == f1) {
@@ -194,47 +180,40 @@ static int unwrap_chain(void *arg)
 		} else if (fence == f2) {
 			f2 = NULL;
 		} else {
-			pr_err("Unexpected fence!\n");
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Unexpected fence!");
 		}
 	}
 
-	if (f1 || f2) {
-		pr_err("Not all fences seen!\n");
-		err = -EINVAL;
-	}
+	if (f1 || f2)
+		KUNIT_FAIL(test, "Not all fences seen!");
 
 	dma_fence_put(chain);
-	return err;
 }
 
-static int unwrap_chain_array(void *arg)
+static void test_unwrap_chain_array(struct kunit *test)
 {
 	struct dma_fence *fence, *f1, *f2, *array, *chain;
 	struct dma_fence_unwrap iter;
-	int err = 0;
 
 	f1 = mock_fence();
-	if (!f1)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f1);
 
 	dma_fence_enable_sw_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
+		KUNIT_FAIL(test, "Failed to create mock fence");
 		dma_fence_put(f1);
-		return -ENOMEM;
+		return;
 	}
 
 	dma_fence_enable_sw_signaling(f2);
 
 	array = mock_array(2, f1, f2);
-	if (!array)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, array);
 
 	chain = mock_chain(NULL, array);
-	if (!chain)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, chain);
 
 	dma_fence_unwrap_for_each(fence, &iter, chain) {
 		if (fence == f1) {
@@ -242,35 +221,29 @@ static int unwrap_chain_array(void *arg)
 		} else if (fence == f2) {
 			f2 = NULL;
 		} else {
-			pr_err("Unexpected fence!\n");
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Unexpected fence!");
 		}
 	}
 
-	if (f1 || f2) {
-		pr_err("Not all fences seen!\n");
-		err = -EINVAL;
-	}
+	if (f1 || f2)
+		KUNIT_FAIL(test, "Not all fences seen!");
 
 	dma_fence_put(chain);
-	return err;
 }
 
-static int unwrap_merge(void *arg)
+static void test_unwrap_merge(struct kunit *test)
 {
 	struct dma_fence *fence, *f1, *f2, *f3;
 	struct dma_fence_unwrap iter;
-	int err = 0;
 
 	f1 = mock_fence();
-	if (!f1)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f1);
 
 	dma_fence_enable_sw_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
-		err = -ENOMEM;
+		KUNIT_FAIL(test, "Failed to create mock fence");
 		goto error_put_f1;
 	}
 
@@ -278,7 +251,7 @@ static int unwrap_merge(void *arg)
 
 	f3 = dma_fence_unwrap_merge(f1, f2);
 	if (!f3) {
-		err = -ENOMEM;
+		KUNIT_FAIL(test, "Failed to merge fences");
 		goto error_put_f2;
 	}
 
@@ -290,39 +263,33 @@ static int unwrap_merge(void *arg)
 			dma_fence_put(f2);
 			f2 = NULL;
 		} else {
-			pr_err("Unexpected fence!\n");
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Unexpected fence!");
 		}
 	}
 
-	if (f1 || f2) {
-		pr_err("Not all fences seen!\n");
-		err = -EINVAL;
-	}
+	if (f1 || f2)
+		KUNIT_FAIL(test, "Not all fences seen!");
 
 	dma_fence_put(f3);
 error_put_f2:
 	dma_fence_put(f2);
 error_put_f1:
 	dma_fence_put(f1);
-	return err;
 }
 
-static int unwrap_merge_duplicate(void *arg)
+static void test_unwrap_merge_duplicate(struct kunit *test)
 {
 	struct dma_fence *fence, *f1, *f2;
 	struct dma_fence_unwrap iter;
-	int err = 0;
 
 	f1 = mock_fence();
-	if (!f1)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f1);
 
 	dma_fence_enable_sw_signaling(f1);
 
 	f2 = dma_fence_unwrap_merge(f1, f1);
 	if (!f2) {
-		err = -ENOMEM;
+		KUNIT_FAIL(test, "Failed to merge fences");
 		goto error_put_f1;
 	}
 
@@ -331,41 +298,35 @@ static int unwrap_merge_duplicate(void *arg)
 			dma_fence_put(f1);
 			f1 = NULL;
 		} else {
-			pr_err("Unexpected fence!\n");
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Unexpected fence!");
 		}
 	}
 
-	if (f1) {
-		pr_err("Not all fences seen!\n");
-		err = -EINVAL;
-	}
+	if (f1)
+		KUNIT_FAIL(test, "Not all fences seen!");
 
 	dma_fence_put(f2);
 error_put_f1:
 	dma_fence_put(f1);
-	return err;
 }
 
-static int unwrap_merge_seqno(void *arg)
+static void test_unwrap_merge_seqno(struct kunit *test)
 {
 	struct dma_fence *fence, *f1, *f2, *f3, *f4;
 	struct dma_fence_unwrap iter;
-	int err = 0;
 	u64 ctx[2];
 
 	ctx[0] = dma_fence_context_alloc(1);
 	ctx[1] = dma_fence_context_alloc(1);
 
 	f1 = __mock_fence(ctx[1], 1);
-	if (!f1)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f1);
 
 	dma_fence_enable_sw_signaling(f1);
 
 	f2 = __mock_fence(ctx[1], 2);
 	if (!f2) {
-		err = -ENOMEM;
+		KUNIT_FAIL(test, "Failed to create mock fence");
 		goto error_put_f1;
 	}
 
@@ -373,7 +334,7 @@ static int unwrap_merge_seqno(void *arg)
 
 	f3 = __mock_fence(ctx[0], 1);
 	if (!f3) {
-		err = -ENOMEM;
+		KUNIT_FAIL(test, "Failed to create mock fence");
 		goto error_put_f2;
 	}
 
@@ -381,7 +342,7 @@ static int unwrap_merge_seqno(void *arg)
 
 	f4 = dma_fence_unwrap_merge(f1, f2, f3);
 	if (!f4) {
-		err = -ENOMEM;
+		KUNIT_FAIL(test, "Failed to merge fences");
 		goto error_put_f3;
 	}
 
@@ -393,15 +354,12 @@ static int unwrap_merge_seqno(void *arg)
 			dma_fence_put(f2);
 			f2 = NULL;
 		} else {
-			pr_err("Unexpected fence!\n");
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Unexpected fence!");
 		}
 	}
 
-	if (f2 || f3) {
-		pr_err("Not all fences seen!\n");
-		err = -EINVAL;
-	}
+	if (f2 || f3)
+		KUNIT_FAIL(test, "Not all fences seen!");
 
 	dma_fence_put(f4);
 error_put_f3:
@@ -410,40 +368,41 @@ static int unwrap_merge_seqno(void *arg)
 	dma_fence_put(f2);
 error_put_f1:
 	dma_fence_put(f1);
-	return err;
 }
 
-static int unwrap_merge_order(void *arg)
+static void test_unwrap_merge_order(struct kunit *test)
 {
 	struct dma_fence *fence, *f1, *f2, *a1, *a2, *c1, *c2;
 	struct dma_fence_unwrap iter;
-	int err = 0;
 
 	f1 = mock_fence();
-	if (!f1)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f1);
 
 	dma_fence_enable_sw_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
+		KUNIT_FAIL(test, "Failed to create mock fence");
 		dma_fence_put(f1);
-		return -ENOMEM;
+		return;
 	}
 
 	dma_fence_enable_sw_signaling(f2);
 
 	a1 = mock_array(2, f1, f2);
-	if (!a1)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, a1);
 
 	c1 = mock_chain(NULL, dma_fence_get(f1));
-	if (!c1)
+	if (!c1) {
+		KUNIT_FAIL(test, "Failed to create chain");
 		goto error_put_a1;
+	}
 
 	c2 = mock_chain(c1, dma_fence_get(f2));
-	if (!c2)
+	if (!c2) {
+		KUNIT_FAIL(test, "Failed to create chain");
 		goto error_put_a1;
+	}
 
 	/*
 	 * The fences in the chain are the same as in a1 but in oposite order,
@@ -455,63 +414,64 @@ static int unwrap_merge_order(void *arg)
 		if (fence == f1) {
 			f1 = NULL;
 			if (!f2)
-				pr_err("Unexpected order!\n");
+				KUNIT_FAIL(test, "Unexpected order!");
 		} else if (fence == f2) {
 			f2 = NULL;
 			if (f1)
-				pr_err("Unexpected order!\n");
+				KUNIT_FAIL(test, "Unexpected order!");
 		} else {
-			pr_err("Unexpected fence!\n");
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Unexpected fence!");
 		}
 	}
 
-	if (f1 || f2) {
-		pr_err("Not all fences seen!\n");
-		err = -EINVAL;
-	}
+	if (f1 || f2)
+		KUNIT_FAIL(test, "Not all fences seen!");
 
 	dma_fence_put(a2);
-	return err;
+	return;
 
 error_put_a1:
 	dma_fence_put(a1);
-	return -ENOMEM;
 }
 
-static int unwrap_merge_complex(void *arg)
+static void test_unwrap_merge_complex(struct kunit *test)
 {
 	struct dma_fence *fence, *f1, *f2, *f3, *f4, *f5;
 	struct dma_fence_unwrap iter;
-	int err = -ENOMEM;
 
 	f1 = mock_fence();
-	if (!f1)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f1);
 
 	dma_fence_enable_sw_signaling(f1);
 
 	f2 = mock_fence();
-	if (!f2)
+	if (!f2) {
+		KUNIT_FAIL(test, "Failed to create mock fence");
 		goto error_put_f1;
+	}
 
 	dma_fence_enable_sw_signaling(f2);
 
 	f3 = dma_fence_unwrap_merge(f1, f2);
-	if (!f3)
+	if (!f3) {
+		KUNIT_FAIL(test, "Failed to merge fences");
 		goto error_put_f2;
+	}
 
 	/* The resulting array has the fences in reverse */
 	f4 = mock_array(2, dma_fence_get(f2), dma_fence_get(f1));
-	if (!f4)
+	if (!f4) {
+		KUNIT_FAIL(test, "Failed to create array");
 		goto error_put_f3;
+	}
 
 	/* Signaled fences should be filtered, the two arrays merged. */
 	f5 = dma_fence_unwrap_merge(f3, f4, dma_fence_get_stub());
-	if (!f5)
+	if (!f5) {
+		KUNIT_FAIL(test, "Failed to merge fences");
 		goto error_put_f4;
+	}
 
-	err = 0;
 	dma_fence_unwrap_for_each(fence, &iter, f5) {
 		if (fence == f1) {
 			dma_fence_put(f1);
@@ -520,15 +480,12 @@ static int unwrap_merge_complex(void *arg)
 			dma_fence_put(f2);
 			f2 = NULL;
 		} else {
-			pr_err("Unexpected fence!\n");
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Unexpected fence!");
 		}
 	}
 
-	if (f1 || f2) {
-		pr_err("Not all fences seen!\n");
-		err = -EINVAL;
-	}
+	if (f1 || f2)
+		KUNIT_FAIL(test, "Not all fences seen!");
 
 	dma_fence_put(f5);
 error_put_f4:
@@ -539,56 +496,64 @@ static int unwrap_merge_complex(void *arg)
 	dma_fence_put(f2);
 error_put_f1:
 	dma_fence_put(f1);
-	return err;
 }
 
-static int unwrap_merge_complex_seqno(void *arg)
+static void test_unwrap_merge_complex_seqno(struct kunit *test)
 {
 	struct dma_fence *fence, *f1, *f2, *f3, *f4, *f5, *f6, *f7;
 	struct dma_fence_unwrap iter;
-	int err = -ENOMEM;
 	u64 ctx[2];
 
 	ctx[0] = dma_fence_context_alloc(1);
 	ctx[1] = dma_fence_context_alloc(1);
 
 	f1 = __mock_fence(ctx[0], 2);
-	if (!f1)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f1);
 
 	dma_fence_enable_sw_signaling(f1);
 
 	f2 = __mock_fence(ctx[1], 1);
-	if (!f2)
+	if (!f2) {
+		KUNIT_FAIL(test, "Failed to create mock fence");
 		goto error_put_f1;
+	}
 
 	dma_fence_enable_sw_signaling(f2);
 
 	f3 = __mock_fence(ctx[0], 1);
-	if (!f3)
+	if (!f3) {
+		KUNIT_FAIL(test, "Failed to create mock fence");
 		goto error_put_f2;
+	}
 
 	dma_fence_enable_sw_signaling(f3);
 
 	f4 = __mock_fence(ctx[1], 2);
-	if (!f4)
+	if (!f4) {
+		KUNIT_FAIL(test, "Failed to create mock fence");
 		goto error_put_f3;
+	}
 
 	dma_fence_enable_sw_signaling(f4);
 
 	f5 = mock_array(2, dma_fence_get(f1), dma_fence_get(f2));
-	if (!f5)
+	if (!f5) {
+		KUNIT_FAIL(test, "Failed to create array");
 		goto error_put_f4;
+	}
 
 	f6 = mock_array(2, dma_fence_get(f3), dma_fence_get(f4));
-	if (!f6)
+	if (!f6) {
+		KUNIT_FAIL(test, "Failed to create array");
 		goto error_put_f5;
+	}
 
 	f7 = dma_fence_unwrap_merge(f5, f6);
-	if (!f7)
+	if (!f7) {
+		KUNIT_FAIL(test, "Failed to merge fences");
 		goto error_put_f6;
+	}
 
-	err = 0;
 	dma_fence_unwrap_for_each(fence, &iter, f7) {
 		if (fence == f1 && f4) {
 			dma_fence_put(f1);
@@ -597,15 +562,12 @@ static int unwrap_merge_complex_seqno(void *arg)
 			dma_fence_put(f4);
 			f4 = NULL;
 		} else {
-			pr_err("Unexpected fence!\n");
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Unexpected fence!");
 		}
 	}
 
-	if (f1 || f4) {
-		pr_err("Not all fences seen!\n");
-		err = -EINVAL;
-	}
+	if (f1 || f4)
+		KUNIT_FAIL(test, "Not all fences seen!");
 
 	dma_fence_put(f7);
 error_put_f6:
@@ -620,23 +582,25 @@ static int unwrap_merge_complex_seqno(void *arg)
 	dma_fence_put(f2);
 error_put_f1:
 	dma_fence_put(f1);
-	return err;
 }
 
-int dma_fence_unwrap(void)
-{
-	static const struct subtest tests[] = {
-		SUBTEST(sanitycheck),
-		SUBTEST(unwrap_array),
-		SUBTEST(unwrap_chain),
-		SUBTEST(unwrap_chain_array),
-		SUBTEST(unwrap_merge),
-		SUBTEST(unwrap_merge_duplicate),
-		SUBTEST(unwrap_merge_seqno),
-		SUBTEST(unwrap_merge_order),
-		SUBTEST(unwrap_merge_complex),
-		SUBTEST(unwrap_merge_complex_seqno),
-	};
+static struct kunit_case dma_fence_unwrap_cases[] = {
+	KUNIT_CASE(test_sanitycheck),
+	KUNIT_CASE(test_unwrap_array),
+	KUNIT_CASE(test_unwrap_chain),
+	KUNIT_CASE(test_unwrap_chain_array),
+	KUNIT_CASE(test_unwrap_merge),
+	KUNIT_CASE(test_unwrap_merge_duplicate),
+	KUNIT_CASE(test_unwrap_merge_seqno),
+	KUNIT_CASE(test_unwrap_merge_order),
+	KUNIT_CASE(test_unwrap_merge_complex),
+	KUNIT_CASE(test_unwrap_merge_complex_seqno),
+	{}
+};
 
-	return subtests(tests, NULL);
-}
+static struct kunit_suite dma_fence_unwrap_test_suite = {
+	.name = "dma-buf-fence-unwrap",
+	.test_cases = dma_fence_unwrap_cases,
+};
+
+kunit_test_suite(dma_fence_unwrap_test_suite);
-- 
2.43.0


