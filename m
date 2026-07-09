Return-Path: <linux-media+bounces-67083-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7iZRKHgBT2qJYwIAu9opvQ
	(envelope-from <linux-media+bounces-67083-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 04:03:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 628C772BD1C
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 04:03:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=BA4vgtNw;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67083-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67083-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E224E301C6DC
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 02:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE63C31E850;
	Thu,  9 Jul 2026 02:03:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D922F8E8C;
	Thu,  9 Jul 2026 02:03:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783562603; cv=fail; b=PvJfCFmnOaxCkIFhX5MmCACQvhwcZePLfA/jNU7/lsKshBSpjO1Z62T+eFuaga7q+m40tLsoMPg6ZVENbdrMjEnJJVtF8+Tqb5f31+ocvc32IrOoHDstIki1PAEvouo1QUPZxOUN1/Obl4nIAi3awPF3YY7Qg5O6YR/fHgtqJqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783562603; c=relaxed/simple;
	bh=8F+dPOHBnlxIaKTVL0tYNSMQR82Qzks1arK4P+12eUY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sWRxAdxblg5JGSjvJoEILl34laH85Ho+xNRA2/vNXgqOcR/DOb2+lciJISRdjmnOMRWWReU6c3t+C8/F/o189mVoW20JPGrHGwes66Urr+3ku5Pr4dCuVweFWTNTCQfiYPB3FAlk2yL6Wuld+ytUCMV805MvkFP0qi2lSs4cXTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BA4vgtNw; arc=fail smtp.client-ip=52.101.48.58
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3C6UBAjGvsdrDpzCEtH+885Ye+QphMtNO+OY5nWtRu8DOAXgYX6beLpQC2vdAjibOwr7GwfPlUI3GvAixGAV4K8MWP555m4s8TqNNp4m62ZINQxkhkZk50hLTQszPdBbAGp7rVxXa+/yWgmuepYbtyDYFjGyM8uuNWotpVWltkJBogKNZzBrnyqabH+jlMQSjJnWEB68nSCtHpITGSJY9rZH5aQg1qPHLYtob9yenOFmEtPjk7YaAWMM6ZC1oSj5NMljIOkDK3Aj/b1+Y56v1GNVDyNHT/4WIHbdFdI4ec/pc0eBldPpBb3sPdAD+jmhNtnSwgVpXI18R5N+g0rSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/LiVCckba+tuo9wErnXL0a33uBkLlm1UoxO7RUSCSc=;
 b=Lu0nMux7HTE2PzBucef8jfw518nW7/vt8zAmUNFRLq9uC4Oru1n+5CMRxVonPzIyWTKEhRVVfCNUTt2Qx1GARfxS4U7XCX5b5YLI6UUZUe/NCU6x68JFGsg+ES2sgp1yH6b9U0YwyusBqMl4OwNCWmfaqVOGmXFqitsa7eZtvxqwsFVlHoH+v6HkkdfyF9jkX3hQlHRTnmvOlnWFH6aqZOemI1HVBn+9LxPZuxN9MkXOsDcZhb6HpsdNEbR8I+6bTDvRnXwTMOb2jmK6GRuv4ZJbNT87bZnDogSpN1y/18PTKXVxsDx8gShjGj6DJkFBP55x2PB1DdkBG3UVFiK5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/LiVCckba+tuo9wErnXL0a33uBkLlm1UoxO7RUSCSc=;
 b=BA4vgtNwJ31MhYvALzdAJnBvs+ihKaWi8ODP1ZtRpFfYV1aVUocYgqk7O4LMeZxpcfOk3bU2DjbOx/W9t8isXZ3EKb7gq0bukmT8tr9w5drVQz6agkDrftfr0G6Eefj5g9lGjEOFejC9MUkeIAXVO6icGphQKM+I/HveAKj+RJzEZA+4Bo9tiAXdoWjygmFgnQvVR3CWLsVOifkp2iUFjx0zEp0ONzXAoaPDIyEzHIKVzz2McNTxWRMMXWlthgb7WhoEbxm6ZteLHU6xfzffL8TGOS8OO5UcEtKxsKwxChdSR8Az5/IxBN3A88CdcjUrPIgQOjsJLkMe5uTIvhZcjQ==
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DS4PR12MB9818.namprd12.prod.outlook.com (2603:10b6:8:2a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 02:03:16 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 02:03:16 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Russell King <linux@armlinux.org.uk>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Allen <john.allen@amd.com>,
	Kees Cook <kees@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Yury Norov <ynorov@nvidia.com>,
	sunyi <279644543@qq.com>
Subject: [PATCH 0/5] bitmap: align bitmap_find_next_zero_area_off() output with the rest of the API
Date: Wed,  8 Jul 2026 22:03:06 -0400
Message-ID: <20260709020312.133977-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DS4PR12MB9818:EE_
X-MS-Office365-Filtering-Correlation-Id: b92c3024-f948-40fa-43cb-08dedd5e3d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|921020|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZaPqwJCDqAoZ3fiBPNoiXSl6zYbpfQsTmMl3tgfCmhs8jjTASqVESS5rARQ67T875Bl2PRDGQPe482zRhh7iq3/pSRtm5P+6bRlfPbZYqo+JyogxtBnvi8U2nAsMpsK0KPAVs+5uHDIvlbsACwrx/aaik2+6KtOYs+vjjsZCJW483pG2GOsSZra5kbNH0bnq3SPsO79GnxTGTxtqcKVSGpLpbLXw6MMOSrmZZFlKB0uwc+VLnppmHvEZwQjyrc+BZCJpWV3Ce1F+Rd4bsPFdyaTywyl/VkVFiwXmLqAQnes7pc42zzfqh6h7u/b2eChNGP0B/SPdnwWbWUnVHbiyV5cH3Zj+VDABJkshgX52MN3fGCBYoEfKTzTWGXLgZK4PcIu092gL1FxEKTfqoC4Jbge47jxBjq+Er1TnvcpZqIXLmUhdZJCcmMeAyl6HuCjlvgWDpeyqjFDmk8dAo9RunKu/TFsEtJThmml3+ScPlw/YTqRDcjMsasRWweb/y9WLC1N5J0Dko80qK2lDYhl9UekUyenIpyNCZWQa523O7P9JMPVetE8MJcviPuGteMRsHhvyx8kA6Al63ANVE5HF8dmgKR++TlzmkTzkcs13e7LnN2rk6qgZsGBD0+L59RLZP9x3W+NU3w+bA6Qg7tRFvYMxbxxHqT1OY3Df7FHMgqORsTvUdUAaWgdJj+26+Wa5nrHGfJa8u67CAtd/dRg+7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(921020)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XZFPS/GtgCRcdwEdoIHvySuBetanCUwTqqON3Xs4ctiLiiGfeKJ+IHwk0PGi?=
 =?us-ascii?Q?1QGySD958FomaHYlfBcA/GFonNwNxOvAHHq525bepkGMuY3CLnpbvNCLQGWb?=
 =?us-ascii?Q?p6Ojh8/x1vBc1GgaYlsVJLz6qQT0ZfOnGcMU29tsjWiyGsdtG0kmX+aIzV1M?=
 =?us-ascii?Q?TS8BseODZfEuyhqztTXs908HLknkTsYyL9jKGYQY68vDFNaJKoVyw8dGK1Q1?=
 =?us-ascii?Q?AkiM0QMgsdMduaJZBYIGyilDKYOaUDqUbvF7S1m2yVLcaPR2wUoU9GtLXQSM?=
 =?us-ascii?Q?ly9ujYcCFTxKEs6mKSPZ1RyxvSY/S/tzPbjXqGY2LIXg0ORvJvEdTEGhxqWy?=
 =?us-ascii?Q?r807yk3/YI198VRd/4kFk46C0PJpNP0uvRe3GHrNAwjw1K/EwLQ6S4Mw3rDs?=
 =?us-ascii?Q?vh9AAKx272WwqjS71NJJO6/Iv5SOr9x+EcvfysqYSbUm2lnhfWe9x8Os88lt?=
 =?us-ascii?Q?5t1liGQdyVIRTUPsszIfc3wGqZ5kjVfOvCRNB+UqkGEEXq87/rNbgiICITcu?=
 =?us-ascii?Q?C47isUg9QCmGxyRgxYumJsdYCtabyg9i9WsFUSg8Ca+UVIXlWLfO3Ztw8Cz5?=
 =?us-ascii?Q?wvx88H6wVE00eqlvKHxkYJFLkNarW5BU+HZDJdswBJ2FvgLQvViFqVT6J90d?=
 =?us-ascii?Q?7t3c8hh8z/9Z35FQJX1ilCs/CJBMEJKiVdVcp1OY3qO0E1Uumezks/XB8e0j?=
 =?us-ascii?Q?k0aDov+VryTMv29ooSGgGuoDTFU/DX09Z6F3SjIz9r/0B4GSeEEKcBtntYJE?=
 =?us-ascii?Q?iNprtz51W6t/EQdOivV0otFCZpMDpl7xhmcSKSpmKLuO+nC8yyI0QjgOVu9q?=
 =?us-ascii?Q?FWkcZZb3uR4C3Vee2CD9LBtxcXIZnnycrfjTm0XbDBYWFUzb4qabQ0xOyQDD?=
 =?us-ascii?Q?LWKeavdLaPecqFNIMaNyKrfjHKXULXh7a42B5ZymAMyzQHeLNAy/dbpOjEQ2?=
 =?us-ascii?Q?mOfluAtcnAs8PtsvQdPcZYz9OUD/mWLU1GlR2dExrJumyPSUGJk+DvLoq6rk?=
 =?us-ascii?Q?aYxev4SnUfDw7ZymqFXcuXYIFapyXCa9blOvV47hYNRSWH9ZWM3O6P1dCcV7?=
 =?us-ascii?Q?li/5bgAe9bJwKCD+g+9jE6LW9pv062eQOjlXSSuHtUmtHKDUVUoAPiYuWgeF?=
 =?us-ascii?Q?0IIrWxa7wIHI5FgiAL3bpSWeJkQDGIF+ZI3xUBK5XauGUlfp3wVQxp9/qB30?=
 =?us-ascii?Q?/r0QNvr/60Zj4UHABG/ObWA7wUKm8qxfJF7OpER8Xbvkw339UbmnKuX5IBTh?=
 =?us-ascii?Q?S3WIaPtKNpfptFXVbNEHGgCVE0em/ynzSitwE8G1ehIxMRNXZ6fmKKmjiLYq?=
 =?us-ascii?Q?6zFxK+LQXnNx3ZFegvnXfdxbWcvGqbALspEISu/FCcbbveOYk3gVXmlxwwtL?=
 =?us-ascii?Q?PnB+4widUxJlUIq+SRdmy4OFWoLGrA4qVL7GHRqgjKqKRb4oKmrtgVn0hyko?=
 =?us-ascii?Q?mU6oAmqsH9CW1OUI2OvO89jz1TMBriEs5CcU5IY0o5drCVJMJCAn5GdOou9v?=
 =?us-ascii?Q?fSjKpzVWcQWQd2EFjXKStQxcFBGKtBq5DdZ/N0GXKCS0OjtB/6kaLcR6/0M8?=
 =?us-ascii?Q?WxjT5MBD6dO6sKUrkLVdI3kVMWnSWe+oc0tZBtgrQg/4sTGw/ZTLk/b8YFhw?=
 =?us-ascii?Q?caxV4a+JSJeobb/pddeSA9bDajvha+7T/Vbea+yxwEIi3y9ZLO2sru9cENAL?=
 =?us-ascii?Q?Z+G3njFROCCQhQanZl0emHiYAsSJ6OzXlJplO63/9jRH+HU2CqQ6ItBG0rBw?=
 =?us-ascii?Q?kkJLTvgPWg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92c3024-f948-40fa-43cb-08dedd5e3d93
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:03:16.4497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJrAnOLxCpc2iE4Io5yFxIY80n3frGMC3PBMWTBbRLVoR5wTtwaMlWl0Vj0i+/kC+FrfARaIGSXdTo8poWKV4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9818
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:chleroy@kernel.org,m:davem@davemloft.net,m:willy@infradead.org,m:akpm@linux-foundation.org,m:andrzej.hajda@intel.com,m:dakr@kernel.org,m:dianders@chromium.org,m:herbert@gondor.apana.org.au,m:jgg@ziepe.ca,m:john.allen@amd.com,m:kees@kernel.org,m:leon@kernel.org,m:maddy@linux.ibm.com,m:m.szyprowski@samsung.com,m:mchehab@kernel.org,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linux@rasmusvillemoes.dk,m:thomas.lendacky@amd.com,m:yury.norov@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:ynorov@nvidia.com,m:279644543@qq.com,m:yurynorov@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67083-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[armlinux.org.uk,kernel.org,davemloft.net,infradead.org,linux-foundation.org,intel.com,chromium.org,gondor.apana.org.au,ziepe.ca,amd.com,linux.ibm.com,samsung.com,ellerman.id.au,gmail.com,rasmusvillemoes.dk,lists.infradead.org,vger.kernel.org,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,qq.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:from_mime,Nvidia.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 628C772BD1C

Bitmap search functions return a value greater than or equal to nbits when
no suitable bits are found. bitmap_find_next_zero_area_off() is an
exception: it returns a value greater than nbits.

Align the function with the rest of the API and adjust the affected callers
accordingly.

Patches 1-4 are sent only to their respective maintainers and mailing
lists. Patch 5 and the cover letter are sent to all recipients.

On top of -next. I plan to carry the series with bitmap-for-next.

Yury Norov (5):
  ARM: dma-mapping: Treat bitmap size as allocation failure
  powerpc/msi: Treat bitmap size as allocation failure
  crypto: ccp: Treat bitmap size as allocation failure
  media: s5p-mfc: Treat bitmap size as allocation failure
  bitmap: Return size when no zero area is found

 arch/arm/mm/dma-mapping.c                            |  4 ++--
 arch/powerpc/sysdev/msi_bitmap.c                     |  2 +-
 drivers/crypto/ccp/ccp-dev-v3.c                      |  2 +-
 drivers/crypto/ccp/ccp-dev-v5.c                      |  6 +++---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c |  2 +-
 include/linux/bitmap.h                               |  3 +++
 lib/bitmap.c                                         | 10 ++++------
 7 files changed, 15 insertions(+), 14 deletions(-)

-- 
2.53.0

