Return-Path: <linux-media+bounces-25881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0112A2E739
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8B967A2C81
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596581BCA19;
	Mon, 10 Feb 2025 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="hRUruTpb"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022096.outbound.protection.outlook.com [40.107.43.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD031C3F04;
	Mon, 10 Feb 2025 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178464; cv=fail; b=b7Gpk5MsbY22F0c/G+fEhgOZiN4Wcw5dxPKQUJQ0fM5K/0s+zOhd4E3cGEJ+BNeEzJpxCbxJm/QAdwtQ6342Y9jlLLJVERoSTLYK1KDvMwLUK2ST4lRvlMITDdEnLNwi5tR6MLiDHNfS7kPQUctsEbj3OmQeN0J4bNA0SHInrWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178464; c=relaxed/simple;
	bh=EL6I+B3DQlVYM3bTGatVd+LRQmvjN8xAiOQ7/yD3ixY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HZjuUhfDq8DK4ug3nvcewxTwRZruhn9VdGdOf9wHvYyCWaHCsqY3z7ypj5JNAo9RH5QvrQ/z00Z8Zf8GYrvyplzM0uz3mXypZXbMIYYKn+Gs3kA3248kLqFu7MiEyMEuGgy+UQpezVatzAF/NALA0T4YWc8rW+tFfyI3sjJj6wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=hRUruTpb; arc=fail smtp.client-ip=40.107.43.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLlAGZgSRWGTBAT0ywlK9erpcgJX/mHCQiDdV/BaxqE6LVUc0bcFte/sK4b5b7PZLzQqBFJEhFtwPB0N0gzLFSW6UD4kNLOr+GY3PaAkqsp9Le9KePt8eEsS9MfpvENPSuVKVN9RoGjGu4laFJu8fXAgxtGFHgAPc19XtmbdK2UKy+wSjia78go7ixLcTMDkSy14HNjeR/995xuLCRAl84RXKRloGw6L48bhy3Bq0PfIwkQMv6upHFK2NtcUJVJWIWNfpNEmdHwAotjTADzjpjiqFtL23eJRpV2+z7lk5/IPf252D91/sDngdvM2lgYtH88DhYdNYrVqJh5b17G7Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z08WkIm2BfVz2YoMz28Gbh0LdZPBv1XGCmRkc78GgF0=;
 b=lShl4vypofbUxaGoNTlP60e1lT/t7OafWReeb+pBEb1BvkoqVJ7AgKIiddlWN69yQ/qcuuHcwoU6YOmgonhOxQ9/50s34TQ3hEOwngwhYQJh9gkRZUuYDnhT2cYGKJ/CJL1AC0vCvMEWE1O01ImZx0HVZb99XoYA4Q1nxppKkEjf1iqCPheYMyMnKAnvScYqUw8n+0EIXjqb3WnKcFLESUiQCJSoez0dpBKwRoWf3lXDFLke1ODesqeuIijaTzbCfkvEK4PfRTne7UDC2QRcr/SQ5vgHbjGU30dXwy3145jjxodRrs6dI4EPL8btXfnhmDYVUZnEdrw8YVKVdoYBvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z08WkIm2BfVz2YoMz28Gbh0LdZPBv1XGCmRkc78GgF0=;
 b=hRUruTpbNVRBVRj+hdnTa/A8xYXqwgJZqIdTTV2e2NLO95bx2dTqiq5h4+RgY47PPdGFw7GyA9zcXd5UC32FXwU4mniMkWhjQtpkIXDNkmxiPQAudFcuUvZF8hQly8r/4OkyHheaot6wTZz6nSsJwi2dDMQxsRVOe4AVw3J2xo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1504.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cf::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Mon, 10 Feb 2025 09:07:35 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 09:07:35 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH 2/8] media: v4l2-common: Add YUV24 format info
Date: Mon, 10 Feb 2025 18:07:19 +0900
Message-Id: <20250210090725.4580-3-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0178.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PU4P216MB1504:EE_
X-MS-Office365-Filtering-Correlation-Id: d388269e-077e-44d1-5fb8-08dd49b25c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e3tU15C6nVb6bHs0VSMxwEQIE0gp/sLHRg70dwwV0GabY+9NLwYCbNJ+lcE9?=
 =?us-ascii?Q?OQ8HzNkE3WWxrLWVfnhjMp4NakXYfD9rv9v7WI5Yfhf2011HoU1Mi9Hd0rfw?=
 =?us-ascii?Q?4tmufj3K3i0MRH9xEPNXPwVrcN5hFjLYtRxNAPav95S640AIu8hAYK2PoL2t?=
 =?us-ascii?Q?rmVEjxoWrpLn/zOhuha7rLieo9LCYFNM7x1CKUHekk9LqAPoFbpeL9xeI97U?=
 =?us-ascii?Q?g1dt35LiUocCziJMoW1yNIh9g9pk2ieCCdiHkYdxadd5VJnnRkq+z8uLrqW8?=
 =?us-ascii?Q?5OnvohskpTjXH9RGoLx9YD6OvDWB8PgU9UV4UOI9nPH6Zvoj8avncqqKIr6t?=
 =?us-ascii?Q?JZRPZsGrw2jhySFDcgqKeO9nhE/o7ru0HVqcn+iDKKD61gfR/m0XRmFSdWJG?=
 =?us-ascii?Q?WWG/GcIdz1Uzt1cvktKqUgxuk9zWTSFQyqOqXknVZH9yEvjVUk7b2d/z9ZMn?=
 =?us-ascii?Q?vPnDdYJ9gg8JyAR0OKOxwo4vRMeTMU+MPlKDbzjoICPt32jtM8ApD4JOjjhg?=
 =?us-ascii?Q?1qgrqwM8gpKCjvqt6wGN9BwXWZf6by46yp5LEoxqf2TLVJV1K1R4vHOWrx06?=
 =?us-ascii?Q?yCQ6FBB19TkisqrX7CvYZPTQZcEbOmhS05WYnZP5zjkCBxP5QuxIxL6AifQi?=
 =?us-ascii?Q?RKwrPFO3ZyQnagXDv5fUjbLX0D9/TBVAfR+SNWZevpIka+opD882sNVepLsP?=
 =?us-ascii?Q?Dj1osgwHMLGumgnIsr4/tX9HID/44zvermiYwkWVFH8xgNkd+OMn1f+ky8A3?=
 =?us-ascii?Q?Bkyd95kzkWuZ1wdOQaZxTFt3clX4UYGT5ArASzVqTq5TCLUph+8RkTp0QYBu?=
 =?us-ascii?Q?nXyVMCPiRW8O0eGz69mkotXxN1Iixt2IbO/iYFXyxvzLniha+mBBqZs880XV?=
 =?us-ascii?Q?xvENdMd/FMcZSIbE9IBlz0KOfEYpdIr8DFehaax4/J3T6QgBk3+3tXI35iXP?=
 =?us-ascii?Q?z3LbYF/rg55qMpZihYBIgWHHfZ11XB/e39DqtPvh3VO9Pn48BDr45nSSsAeA?=
 =?us-ascii?Q?bSK00mTEUHWURt0JgNKGPUrCTFSAjt0uJQTbuuGAA02cwf6uwD0hOWAJX3ZN?=
 =?us-ascii?Q?bXRGdz/8gveVAJu/FAgUvL2ktrjikzlBLnp28sFLQoz/CDeCXi4WPUqg/pvu?=
 =?us-ascii?Q?+SH155vwWrF2EB7wmeBpOaL0b/EFuWIocpCNV/76ZbLYrP2fDtbHKjF3bJCn?=
 =?us-ascii?Q?EzfAvZvRNBvG48RtIYc/kdd7sbA+1jyq7B63u4hyLByvlLBM1xvckdsGhwKh?=
 =?us-ascii?Q?yBLoBj8qyZmojbCmK0Bm4V8kOdZ/4rm2hfcevo3Zqbz68TfTNkanMa4nu1Vu?=
 =?us-ascii?Q?UBdzuZvhvH9F3/CyJn7ClIXgitIKdCK7D8ViavT1hcE1tU/Bh91/NbvkqDfN?=
 =?us-ascii?Q?5jEutS51BmHhWHmtZhCVdtqwNGH1awg0WcXuwwOcSC1MtH0wkQ5cQl/bmk0/?=
 =?us-ascii?Q?Yz1wxzDnp6i+jHaqGnbZtn2FbK1v1c52?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A/l+PZbBOGdOkXTdhD96a+WTPlEEbGwtgo7VDifHezgnMjznQQ5M9hTdGAZM?=
 =?us-ascii?Q?zeQXgblOpvtEUOaNV/5ZE7xnMRqs2gIGolUzJhdfOspJxqncyp08sTMF82nM?=
 =?us-ascii?Q?GZmEUCCSHDDmKlaaFbp4P4N82npdf4xllgGJpgmcDFR9xesIbA4ZDZPWKODm?=
 =?us-ascii?Q?+w9AKUHnN2UpWQRsP6kQVjGyYe0YLaQ9L1+b6efrjT3hOsSqKJ4eNgrlTem8?=
 =?us-ascii?Q?m92jihmsotVmsrkOHBVsccigXKfu/iQ8XCb1JeVYPVegwtcScLOMyP4ez7Zk?=
 =?us-ascii?Q?FXTnMBa46SU+fUBwDskJGy61PVwb/EdIxqCj+WC2U1RpN3PFh4DzntVs5rUy?=
 =?us-ascii?Q?7TpcTS1qf1TccvkQc5s4gEyM4Qv7w+YgmEVQer01CWkKSlgv674b52tXvvb/?=
 =?us-ascii?Q?2Jg89LKl6u/1ROAcQL85xTWW9MZj/EgActkyZdDAmxq/xCANgv6bz0/UwoFp?=
 =?us-ascii?Q?eGOP8xihom6oIgwx50jHVW0MP4jKOVuw/SlE+2NvH4FBLepBptUcYQrhF+5v?=
 =?us-ascii?Q?JehgXozaH+UU0I/8n+aQPJRLc2nVzv9Q93UduhyLtYnx/UoSsLjRou0PrGRS?=
 =?us-ascii?Q?nLw/y8osS7QVqa78UIk0dUEhw43x6bN61+tVhDhN3ATSrDWbs13auv92K5B9?=
 =?us-ascii?Q?EJU2lG2BuMnFWJ4L+EhY8lp6gE9cl4pPi/lFUv2NgG7ql0tfGGY6hHSfFNHM?=
 =?us-ascii?Q?YFVdH3zSfhdfxMWl+ZpWpx6Mz3c2KLobsbX8ZQ/WVgOcifPwory3uHasUNZ9?=
 =?us-ascii?Q?YqAaNF3Tm9FRzlbcFDPTlTB2T4F4Mq7x7yurvGq0a4Lj8Zn/kGxd97ygdfCM?=
 =?us-ascii?Q?LaJAbd/pJrmKxeTQyo6DX7QjCJklls0xJwTDd1/GSrK7pOm0Kw5hA5TORv2N?=
 =?us-ascii?Q?33Vp0fQeFwxtmxY2Z1b6dlp+ijurcDfMs+NAA7MNLlYn2J0WVepe0x1bQ9TD?=
 =?us-ascii?Q?cy7HONoc3zwb1L1WdgWgg4OUT0EO5pdgYituzix+gRnCWNaoZP/dOIY21DZw?=
 =?us-ascii?Q?LwuUhR4JcwPdXFefDhLu4SH8fu2bCE6sm9sEeBpJ5BqBEREmosymtOwfGV13?=
 =?us-ascii?Q?UiduuCq8LGXkKqWhNJfvNM+gOhwuTD0M5HMIunAYNM4KbVQJhpb0z39IO0Az?=
 =?us-ascii?Q?/U7zjanNaytRqzN3CC92iva+PT47d5pdDh+ardrUzV9hugCuJuK0NqWUP3DV?=
 =?us-ascii?Q?FC4EUphmKiw63kGRG9C/PkON5S8tt9j3nsdTICOOAMVjZsecMTUA0toZEu6w?=
 =?us-ascii?Q?Vybr+raWJOjqyFnunw2+gCvgxaRd8q14YFVJtbkOQjTrjfyVrTldjeGKLQoI?=
 =?us-ascii?Q?0OjG8lX9hjRb+u5eIz7fgo5a4OYkhavejYPwiya6nHO6n/iktRsdXeaS47jh?=
 =?us-ascii?Q?uQzJEfKMj3toeJmjpKEExEYwsXnmnaamedz6WqaZS5grl8DDn5/otaWLGjKW?=
 =?us-ascii?Q?pn/PsA/pgIv1r6AcmcHJSRS5brRbpKgFVG1HY1FWIGdYLY/tNlkEb1/gjGgd?=
 =?us-ascii?Q?5z0wSG3HHNXm4GtnV87955CbcEdmLY6SUm6JZTb6TNA9bTCBahXLujGgSHy2?=
 =?us-ascii?Q?oNAr+N7qrhr3GrSHUdiyBvElhSB5GC9t/c/C3KdvVuBiycxijgtkuuGsZa+k?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d388269e-077e-44d1-5fb8-08dd49b25c0e
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 09:07:35.4800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEyG24g57veWVJaNDuEnMQwyYbivMqr1eNM+yH1P2tDTaISw1mwriglCQs15xYuQDckFniRR4Dt3G+XNVaoaRs4guYk2phb0qkhCS1JjM6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1504

The YUV24 format is missing an entry in the v4l2_format_info().
The YUV24 format is the packed YUV 4:4:4 formats with 8 bits
per component.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 0a2f4f0d0a07..de3636f1cdf1 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -269,6 +269,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_Y212,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_Y216,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_YUV48_12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_YUV24,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_MT2110T, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
 		  .block_w = { 16, 8, 0, 0 }, .block_h = { 32, 16, 0, 0 }},
 		{ .format = V4L2_PIX_FMT_MT2110R, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
-- 
2.31.1


