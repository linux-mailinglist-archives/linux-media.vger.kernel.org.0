Return-Path: <linux-media+bounces-65686-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TchlBdnUPWqx6wgAu9opvQ
	(envelope-from <linux-media+bounces-65686-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:24:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2296C96BD
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:24:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=PmIwMbMN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65686-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65686-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E6B6306D8B5
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 01:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA133009E1;
	Fri, 26 Jun 2026 01:22:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022102.outbound.protection.outlook.com [40.107.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496292E975E;
	Fri, 26 Jun 2026 01:22:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436973; cv=fail; b=XrDLD0JSeI4EicZ1r+N6RMO6YTXKSEhD7JC3GmkCRdbvS9nGYz1HQeSiN3RBJjLOE6LUJRYiAtAmT1JEeVfiW8AhjSUHTH+yL6a2bTUVorW2HPNIp+/eR31G/KqAykmvyua6gKGKH0Dsn/pW0853RsygI7Tdur2qk1tict8QJjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436973; c=relaxed/simple;
	bh=m32EHftW5D9Nj37kbAF7GpsDLXeHTpsV8LSkdFQHdjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pYaOLlG/DLckaUZgwtcbqnEax7EIQch4vTIEeTmRKLnMEJPUvb25t0Z4882Gsfkxylomi7My061/QA14bUjwyImbutQUlxacCKNqO17PkSJNxxr0kz3UUlpALx59nZTxCBc/ccx6t1GtqNq6Z/ua590tSCcLFWqrGTNkAUKgdXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=PmIwMbMN; arc=fail smtp.client-ip=40.107.43.102
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xv2jjRdHoobgEa8qySYTBeNOyCYDHEGGjRnye3HltjtZ9Vs6Po/ensLAEcwTARcY9jWLELXvuLhFou/6Nj7rWWLfi1c2baZB6CLlQr/rrNpWOE4RD3cT6WJe3WRhzdjSQqJKcxxr1b8/ARBSmst1SaT/Pg11T5IgWiNph9B0W7woWSBrRTJ2CEdK28t5xk+ZV51I7diN4XkutTb/AlqUYwfIjIkS9woodlvHrEhKmxjWMDsDB60XR98Kh1t8zrMuvizUeukGios4E45hmtBfK76AaTWCWtPKViTiQJlMWUrM3mQd6AcvW1a4UxmKEbPiSkL04G6tpoLhE1p8clcxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Hzd7yz77ca24/wR0auQx2gI4O205MuAlPRgseqmlpY=;
 b=j1HPVYiBnQzvCncB/Bh+W2z/lkYYrdxskbI/qM3qWhPFpDrBk2fTsBD5Tfoslex0V+u3iKshMf8naqPWrrAMducXy4aRPv2s+SlxPm5jF24owGbG6/+df8Z2X/iWj1e5tfDiITrSwvAIRlJkTg65MQqMVxpzU8eDD/dmWg2dhD46b42K/xRbWUTe/43KeiLPiD4NqRpBUgU5cbAZQUKxarCmplNvpM0msnpf/YP0o2V2uDqX4NQplAEvdcoPiRCQhov4CPDfLuv8bKeRaLSJFttjyXPUPlelPVAwJ14V+SRrriI81cH62mOv/imma3oNojkPiXHQHmSrHb3w7041bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Hzd7yz77ca24/wR0auQx2gI4O205MuAlPRgseqmlpY=;
 b=PmIwMbMNcaWw7J+jei/pMV353/FlpO2i956iylaec6eiciF27GNuFoOgB3HM3EFyI3lcp8PllYf1sC8labiChF+do5ySELDOONxZ86O96rAkWvKwX9g+o7/78E1NBlEHwFgD0lCBYJaIt+c6zlpidg/dXVHaJchacAQ2hOzOU0I=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SEWP216MB2955.KORP216.PROD.OUTLOOK.COM (2603:1096:101:295::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.17; Fri, 26 Jun 2026 01:22:42 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 01:22:42 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	stable@vger.kernel.org
Subject: [PATCH v1 1/7] media: chips-media: wave5: Guard bit depth check with initial_info_obtained
Date: Fri, 26 Jun 2026 10:22:26 +0900
Message-Id: <20260626012232.111-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626012232.111-1-jackson.lee@chipsnmedia.com>
References: <20260626012232.111-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::9) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SEWP216MB2955:EE_
X-MS-Office365-Filtering-Correlation-Id: 21bcde2e-578d-4be5-1a94-08ded3216ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|22082099003|18002099003|56012099006|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info:
	3HFcT884LXnG1DduWFiEfOa2G0j8ayGwWIRDjNKvtiljQ2g8Vlghk35ZfIAj9HfhVUzjuT6LpUI2ksV5m7TzzeScsaJ8J0FliLUVrRbWF5PUZR/DXkjo3PQPnWTU7nJrY2B6qWvkySsLz1zTrcAJA9fdHuIo+i89VJE8szMVv25QO5b+e7x5gHEXDcP/KkAiIJg7PUAnMpZfuDwL33XqlyVrO0OMh5Jg8RAR67JT4NjP/ZvpzK2NQ7o0bXJGrJ9FW+9UhoWC5dIDa3XGuIJTn5oR3IB181GRg4iT4XbyerV+rpAJdULpS6nwUqPGHp57mKTHojvQHgdvSTA8AGMd9FLUF4afLturWj+KukzIeeXuCZuoMLPpB9usGlGeorVGRSgJvvQxtqGx3a9RwHbYR80V/ouv4J2PvZX61/I5U91+Tobp3CXpOFW2qaEEzsWcNPL3fMcgUfkc4RULmIMPq858Kjgn+MVHt4VuKFoNL6T9fpjSxQg8TuWJahH9alpV/BZlf8wbtKOBkD9jW3+j+WhLPbIboJDVdsRKjWE8gJRAPRwQwo8kuv58jY5N3Q3TWZHj07OGVkTIvSzAdL2qWyflZ+b7MvXAVdH/YZNPdGLwmDcsCNi5S/QO6nFVDzJmvsimWM6QGnl7nls0v3omov1Q+pUmUqhE/1XONsu25dN8CiNiODEsBJG0TbrfejNADF0PGqnwxE+Z9Wz4TGPKaSMifyVq2wMRKeuHkf+KY3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(22082099003)(18002099003)(56012099006)(6133799003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fm/uRJMVCiTK15zkNGjBL5wLAPxqMvRfqbH44GVECfmcgWbhp6eCeGhFjn8E?=
 =?us-ascii?Q?SXQleNPNZPqsUXjCUoabW9or7wRAyIqxCkjL3ckjQ4fKHP5ldGNOCHs7s7HB?=
 =?us-ascii?Q?4MpOjsvjTImIs1uY9p66YYX0UVX/ZCCjrMRSCLUZ5i6I4HLM9nPElEmcHCmE?=
 =?us-ascii?Q?HqkBoazOR+Yf+vV/xPtuTsgGUfB1RxMKEwd1JchQMgWJ5ow9g4gmX2jGB+l/?=
 =?us-ascii?Q?zcZtORcfgKDZqqgemdxTwm5fXgHugalZaDcDqTpIU2QhqEUI0Y1n9eMhrc1y?=
 =?us-ascii?Q?WL880FUtsIZJ74uC9D7yE6I9H5zHYd0T+pAuR+oTh2hvJuw+zy6jDFyjhSKE?=
 =?us-ascii?Q?t5PoBs7SJaLFPaxBId/5l2XjTnqy9k9CZa9cH8x5ugVXVrXLCmxu0ZMc/9aE?=
 =?us-ascii?Q?tqkzgCbhqy25vrys8fHTdQAcbEwX/h3Y8cGnDtOm8iht0q9izdoggTyJpzKO?=
 =?us-ascii?Q?ExbrJdlZW2OUZJlwGXo5pSDjX9VjWPTT+OdIPiTPuxMF6sFyerXQRwKm08yF?=
 =?us-ascii?Q?StO0fLIaV7MPDRSj2gQ3CF55BBLTeWvOaXFOfIiitgMgKsvlIvvYVjHN6qaU?=
 =?us-ascii?Q?yH+K1dwEAeUSsNY3XE4xx5l+GidEdZBSQpipyf9Mb42OvY3HyMsl+Fq1deHI?=
 =?us-ascii?Q?sC4EzEknlRIqKAztMsmJFkZBlRs5p7H9+7qocZiu1zsy/dyPEp1os553FGoz?=
 =?us-ascii?Q?iIwT9JzxJTLYwA7vGzg79WivnBLLmUr3JQgOKtkqr3E+ksJRGYvp7o5AZreW?=
 =?us-ascii?Q?AWqFpgXjZLV4LFCyIly1p3eJBfYY6iknaVQg/zcWL4pWkIIDQzr78VfXDY3V?=
 =?us-ascii?Q?91/mRog/AAhdaUcl0l41Jd4gncuIfhZniJhckyv3EElraYp2jYRDQkg7ip6y?=
 =?us-ascii?Q?vxskrIEYKa/WuAFqTNP+Jhh2MCMTKjubYbXe3NeYP5pIlkZgNOfQDyWpE3LY?=
 =?us-ascii?Q?8GZDHiwxxHilzFSZAVbZ/+hO6uXgmjVfy4HpCD/Z3Pd9IQK52+VCko8d6qdl?=
 =?us-ascii?Q?J0cfAsRtymDxB/GfchxNmKzhWxLMn0SznpOckfif9KKvHjVilqt4fZvaCcsZ?=
 =?us-ascii?Q?Z/WYGtQZyYRUmTz/cpp0bTIyBQT/1FpJLQNCNBpZyTW3RHBUAhYVzy+1a12w?=
 =?us-ascii?Q?dkeuVg40c8S5ixL9oaBV6qrO4HZOmKZi1PfuWB4Refeg/ScKIvLKJF9i+chd?=
 =?us-ascii?Q?crxoo7auMYO4Uz6NvPnxw8FchkGs/lhSGyZ4cZ2OgPkWw+X0focbc0zrilKR?=
 =?us-ascii?Q?OrbMDhsmok8Wnx+E1kc95HM0e83J9Lvm1MODNFDGNhJnsa1l4Vnm+JcrezHm?=
 =?us-ascii?Q?majV5eodEVYjbFD7rp2g6qq3+sHq0mmOPlAOYoTo7Nigjy5gTU/oe09vvact?=
 =?us-ascii?Q?1AysFIOeo9i8Pu4vWI8El2RAgoCeSh1R7AU3a3oeNWdIGfuUmO925z/Q+D/K?=
 =?us-ascii?Q?lgudivIGHRMsp2dDF59pydjacA5KNf9QQSChotrnBWRE4BlMsAMddXeMcQFH?=
 =?us-ascii?Q?Aa9ywoJP0yk4nWcG/7MvR/BnaiCDiLRJz1LduhJtd7u3qSA7v7eUJ/nctDAu?=
 =?us-ascii?Q?PhhSKxtfZ6UHbiFVNylQBzyJSdD6Occ+gf9GN+LiNUaYqgGfudfdULcUacwu?=
 =?us-ascii?Q?8NBuU9k2K3olnqa66OAXGkGNLzcNC0C9hbKq/isAJTAwwtte/5vrPdeJQwOY?=
 =?us-ascii?Q?4KzsLhaMGDmz/F05zYpI4le5eyVG8uJ34z6XCMxTnyjOtbRNSRLx35kYnAUM?=
 =?us-ascii?Q?Vzu4+uWV1zLTfZMsjXjtxysosSJPZ4c=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21bcde2e-578d-4be5-1a94-08ded3216ad2
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:22:41.3853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTFxiSGTZ1VAj6ZVqEkCrIvoyVFn56IWooZKTh2aj3R0ipsEwknQ7mo4rtXervpJDGAJnl9bOcjHMQylxjQsGgJwMHna/24rSKNAi5powsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2955
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65686-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[chipsnmedia.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil-cisco@xs4all.nl,m:nicolas.dufresne@collabora.com,m:bob.beckett@collabora.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:b-brnich@ti.com,m:hverkuil@xs4all.nl,m:nas.chung@chipsnmedia.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A2296C96BD

From: Jackson Lee <jackson.lee@chipsnmedia.com>

When CAPTURE STREAMON is called before the VPU has completed sequence
initialization (initial_info_obtained == false), the initial_info fields
contain uninitialized data. The driver checks
luma_bitdepth and rejects anything other than 8-bit, so garbage values
(e.g. 15) cause STREAMON to fail spuriously.

This is reproducible with the following multi-threaded test scenario:
  1. Allocate 2 CAPTURE buffers.
  2. Call STREAMON on the CAPTURE queue.
  3. Call DQBUF, which blocks waiting for a decoded frame.
  4. A second thread calls STREAMOFF on the CAPTURE queue.
  5. The blocked DQBUF should be released, allowing graceful termination.

At step 2, STREAMON reads uninitialized luma_bitdepth and rejects the
stream, causing the test to fail.

Fix this by checking initial_info_obtained before accessing the bit
depth fields, so the validation is only performed when the sequence
info has actually been parsed by the VPU.

Fixes: 035371c9e509 ("media: chips-media: wave5: Fix timeout while testing 10bit hevc fluster")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index bb2ba9204a83..01d1368b2965 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1403,6 +1403,7 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 	} else if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		struct dec_initial_info *initial_info =
 			&inst->codec_info->dec_info.initial_info;
+		struct dec_info *p_dec_info = &inst->codec_info->dec_info;
 
 		if (inst->state == VPU_INST_STATE_STOP)
 			ret = switch_state(inst, VPU_INST_STATE_INIT_SEQ);
@@ -1410,6 +1411,7 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 			goto return_buffers;
 
 		if (inst->state == VPU_INST_STATE_INIT_SEQ &&
+		    p_dec_info->initial_info_obtained &&
 		    inst->dev->product_code == WAVE521C_CODE) {
 			if (initial_info->luma_bitdepth != 8) {
 				dev_info(inst->dev->dev, "%s: no support for %d bit depth",
@@ -1418,7 +1420,6 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 				goto return_buffers;
 			}
 		}
-
 	}
 	pm_runtime_put_autosuspend(inst->dev->dev);
 	return ret;
-- 
2.43.0


