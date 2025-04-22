Return-Path: <linux-media+bounces-30691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60320A96469
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2755C188C088
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 09:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4B0202F8D;
	Tue, 22 Apr 2025 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="h+uqZcMs"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022082.outbound.protection.outlook.com [40.107.43.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18E3202984;
	Tue, 22 Apr 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314306; cv=fail; b=k6aB9yPgF4fCyldfET9S5J7m/AL6edtinYkkJCOhFKcKEhkL4VFzcTAWJK9c5+v/4w9lAFH+9mtQMQYXKdOIfbQecqHiwc+FE1IKrXLv1lQ/9Uw+yzcWxCwUif45Z6M86tOKNAifI3NxCX2rsD9nY6GwL8FzpLtpnjdwwXA4qeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314306; c=relaxed/simple;
	bh=I0CNHLL7Gc16RR7cOWbiJUQPoXn8mZKRPk+pPW4TDOg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=c6Ej3CDu+aq30EwopqHrHX1UEISn3Mif5HrQDl6kwVkt9Hd+AxTmSTtVIpPZRuMu6PR04uRK+qtzz6j/WoOMQLzL7FIfWcr+KUyUqpMUlpJzvlexo3SBIiBDt4uyQ0ZTmX1CEfRsHqhFkKBVna0LobI6Sq3YqrJMG7Hmm0MtMSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=h+uqZcMs; arc=fail smtp.client-ip=40.107.43.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/QAhVFlQllrUPdZSevywCmJuZ0P935i4ME1hPBYP+k4lpZsrmEVahNS556w2PK8M952JkbnHFI84ltyMIM4RK5bUP5Mo4xtAjZAUC9P9YLQW8XvlwOTKqKhSpVd4lvHknF5D5B+2lxvTo+vft9uenwFJ2IVLkb1xePTjZqmrAQ1UvvmZON22U6GRBzRmOECE0Fy2bJl4CktYAr54CV10PgDjr7MhtnNVaMXEEznS5IO2zr9ARSFwU6ol3FPhtTNscPx1L/F6BgChukqh05Xo/EEjKknDzV3cSdyGCvlI57AgQeh/iV+md5UnT+Hg9zTF8n8pj9i62cNDCYkayttRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWZJMSnPWrAShqWSu2BZzLjJ91OEWJc2ge5lZaUaqNc=;
 b=DedCzyVkjL36THVf4vSmBbibS+ImLKr8rOVzFkVPeE9ooHGchUMAhrQLu1LjnOfR1CZBP1YYRqvZlqLQT3ola+2wNYFme2GJRPANV5+8UCBNe8AJHIyxrTzymVLoOOK0J6X4/cRrUT9XTFOogpjIG6OxmAXbfwJzwAwPJqzUn2WoMBF7vvRNX/JslUp+2U0pHTCU62u/rz2LiZf/CZJlcfRAoztaiJB4KevIprbioiJraTLGiWuHEn3Z4eFpwLRl9nJr8uP+R8s8nw0qttS5JHNF09bhpypF/DQvXEZ7zqsTzmMvDiDiDUhp25KXpA8CIGoltuB41oTVVgadnUhPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWZJMSnPWrAShqWSu2BZzLjJ91OEWJc2ge5lZaUaqNc=;
 b=h+uqZcMsAuLNL4Y1785tLTEvVYa1nxUoE9FErCrqZXHMWjOwn3fl7bDVr2kCBQzY4g6Bwql+BvsChPSIhaJRKlsOQdrbVOBxPP+rL9m+Ve2/XEMH67BgUnAuNqWQQe7oM0WLJ8WbzuLcI11aJo9VPIOlacdWHcZhOY1cJWuAdBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1521.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.34; Tue, 22 Apr 2025 09:31:35 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 09:31:35 +0000
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
	marex@denx.de,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v2 0/8] Add support for Wave6 video codec driver
Date: Tue, 22 Apr 2025 18:31:11 +0900
Message-Id: <20250422093119.595-1-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0120.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::7) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SE2P216MB1521:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3afd0d-9919-40ee-4830-08dd818079ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j3E5fQUhpzwp0jygvwHV7bWjaWN51Y6tQ90uaZ76xmTtiMY1M5vdAG3Kwzd0?=
 =?us-ascii?Q?XXMXMCeE0aI1GdJUcKvlND5+KQupDZE+Y+L3euLEN0StuBDMFK/nWpBf7Wwa?=
 =?us-ascii?Q?70WVeJq0lRq7Ds6DnIdRj/01W2inhsDt9cIwO0FEiCtEuR2aRj16uCIkh0Sv?=
 =?us-ascii?Q?Wv67Sxi0QzbPU0S2Lhg7euLpqW224/sFP07XhEPOcX9tplooj2QfqG1VuohL?=
 =?us-ascii?Q?0coGwbk9MRL+4fKrS+itc1jDKQxXR1+U+4qsFLMHoRdgOdsh71Uy9UBOiF5/?=
 =?us-ascii?Q?/CiiauPSuEkzrnc9pOxXC0bDtPZMj3cVs0dRU4tmMZwHV7NJs5flV47upDwi?=
 =?us-ascii?Q?Buwjvo2YXHc/E4fAyDlfeNFf1Gu9iGtOYukr6qg/8t0i9xfsTzsLXIkhJhSR?=
 =?us-ascii?Q?UaedL7LIvf8oT8c7gKq49yYsocc3Hii3nA9xy3rvBsAqt1mktLc9dufK/wGz?=
 =?us-ascii?Q?6YXAKNNa2oVxhfU4E4z3SbiHXBJyiYuGhf25zlYXJjRh9KPDqBD63/oWSdOs?=
 =?us-ascii?Q?GRDlp5Nv/944LlSCYcAoOMlb3VQuZRJsLJlOQfJJQEHZ6vzZQzjcXOqkIbch?=
 =?us-ascii?Q?EjdfkR0/VvBFeQjiffW7eyMA7iwh1IC7BxgCKIaL2Y2Wvr0wctzoTjezxgTd?=
 =?us-ascii?Q?LEeK9poJrqg+nGTRYjnJs0sfP++ai948DmtxchzIqpODR2N4KwOrtc1pz5As?=
 =?us-ascii?Q?SkUoO0etsS9kwXLhLqRNsaA4vxansTESp8+mDRuhzsYFhhtg/QyvZmqLbTOr?=
 =?us-ascii?Q?A+IVRcFE8imeM0UTcZZQAhNNgDF//mGMy7GzKv5R4Dh8lqlkYz2SAYJPdKhA?=
 =?us-ascii?Q?Ndo0k4iwwZhgIhjOoZYG8czCcQLLx7onFuEPtgkik9lRjLwPnTDIwHoTKaDF?=
 =?us-ascii?Q?w1fcCsixG2cpQJcy7puaVqoDdG7c9KfilHykqc1yljGNP3e02O3FynaGlNIx?=
 =?us-ascii?Q?Q1EQQPavDqu34T3Pi/ImiP/tk4yWO1lieqwQhHEhsC8ZZQb8yj1Fx2yOmfi8?=
 =?us-ascii?Q?1icPfAF8h1TX2aMGNd2WzAaudvwVK/ZrglmxK0C3ZqDagk9scJDsSDFQCtdm?=
 =?us-ascii?Q?eeafR9Sg9ynWHD2s3MwFiahiSQMXdc5ir+3wmUqflzKpMTU104YtCJjjMLdK?=
 =?us-ascii?Q?Q5f9gVdrI2zktlJmSmeIGaWD7SSleZ7KydiHHoye7omks126hCkVuq9rX/eI?=
 =?us-ascii?Q?0u2ZgtL0xhZAgv+MwGl66sbhjEe0YxnBzCVdsTbl1AHSgPk+HiTf40gT8n6C?=
 =?us-ascii?Q?Mm64axN+nfpg8c/6YUo1j/bhhZxh/HRnxL+M4XsfDdpumkw0Z46c3ggo8UUR?=
 =?us-ascii?Q?tNA5EVhZySNfElptKOZYdV+wINCQjhXUGfD8l3abZBY+SKhRIqKSQ6OcLwOw?=
 =?us-ascii?Q?NIUprPMAuTkEgqEmfmX+s0nYR0dK+dM+gXP9fvhLs+Rf+9m69nmqRF+Tn6Er?=
 =?us-ascii?Q?p07qkIFXmyLYabRVTIYfID5n7xbkuOAZWPhHrR+7J5dWzU/Zsy7hNA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Z6+iG6tl8UeRVJAOfIRhH6tTlCrQEgqOReWeQFiDp5aMPbafM76IqYPyFnX?=
 =?us-ascii?Q?aGozSgwUoszwS6Fl+FEY/yZ0f0p2nWdtCzUeana9fSOooBTzutM/O9GVasIE?=
 =?us-ascii?Q?4MXaZOqbKTK44xri/E2P88jrBN4DL6AN/NZXn+ETkjmd1B4TySv6z0MYkkZH?=
 =?us-ascii?Q?EwQw6yiw5SIUqDYXqYe3+okDo/T8gCkAe/cLqqBF07h36OQp0WEyfVAReR9Q?=
 =?us-ascii?Q?9IEQ/ghtEOWaGP/q6a9c1qD2VmQfyBjIt4T0hMME3dMj1gIizGvgD0PChvHZ?=
 =?us-ascii?Q?G17LSeSvi6decy66p82OIz4ZP9ZqdeaMTjtjc4tr/BneRr/dOqstM19Fsgn7?=
 =?us-ascii?Q?FA5YbtOEI2RxzxW1qfKK0WSYTkCWxvyhiAvjNItZfZoc8VnS7asnkZDWHafK?=
 =?us-ascii?Q?KmptzYz6RRURw2xSnhoKv2yCeG5I1cJg3kV8WOQdR1TvTZETeLv40xoDKrdd?=
 =?us-ascii?Q?uJLjtQId2h8Tre/hPxVPB/Z3JrozUo6PDFdsmybOKp6LydN1TxVASNrZ81Bc?=
 =?us-ascii?Q?eiRVYb5Cvyw7tluDbFCC3ZPFzuVefyR8A2eaTMoKsDXDR07xzuOXE+7HKHSp?=
 =?us-ascii?Q?amUGYyUItz6DM8i6xzwI2cXLJGAaiZUEuqepgJtGflWCk+YjthbrgX9I6Bge?=
 =?us-ascii?Q?yTCyFCpm+yedAAIKaAljcqqMLLJi2C8aH6QvU68KFUniFqVGD1VMHmnw8RJv?=
 =?us-ascii?Q?XRswBuA1rxFDVnr7iT7TAIny6S18hXFpDZ7Ip4qntQM9LZ3UJ8qnquATAvNJ?=
 =?us-ascii?Q?INBiTjrOnitdGblYCopO1B6CHzHOi85UaWje6/fwVRLxduX5N6i5JbOE6ksP?=
 =?us-ascii?Q?sosewhdlKz2ECvviRu0RnbWosSTL/e3Y6FQNHWG/hn0Xqnb1tDd9cWyrJHsM?=
 =?us-ascii?Q?SoOrlhmVK60hnHQ4jYaJu1WfU5KYqB0nh5ibkz8/ct1JfJ1XFodWEMLfzZez?=
 =?us-ascii?Q?rCVfa6WXlOineO4ozRgbgwBjEB4Ix42YV9lK6sxub7NfTaVBxOx42YaMvggy?=
 =?us-ascii?Q?TANQgGPjfh7zSunqd79KyRFEEWlpxXJzEzdgENEaT9Hh3OwbylwXOSB+dltT?=
 =?us-ascii?Q?FUxa7N0AkaqYsHgEXrgUSp0m6TaZ/pE+yRc/AOkZQVMklbvymSd33Eqfd5mX?=
 =?us-ascii?Q?w+T13APfnJkUsElAZgsu5/WXOqPl+tuptgbwcdAIgP3zCbiCdrYBd54vhEXD?=
 =?us-ascii?Q?q8K+JnpuG7yvX1Rn6/F7FUwtc28kk+QjUS9ZKRW1bQWoMzc/YLqWN3woPMa/?=
 =?us-ascii?Q?PqhTus9D39bK3TIUVB7U2LrRL6/tQUMJemot35z8vM/7SLBlIgYCirh/Z+A3?=
 =?us-ascii?Q?r2fNHUImDBL/k8yI4WGyOZzoKxtExMXZ9Imj9lKn519a28WsVqG2ovseC2J+?=
 =?us-ascii?Q?ULXXGeKtmJxDL0UfKQjvzWx4aqbmZlDiYLzcso+zhhDd7/ZoUu7w/luieULd?=
 =?us-ascii?Q?i2cII2yI6QtB8aPZiys1ak3xYIzWxp6pW0ALbL4GjCSqLFXGSnRKN6ORWEoK?=
 =?us-ascii?Q?i90liU6YuO+5id+MGPybqfaqfo2X9YNWduOf4EU2I+Vos8PCjGSq/aPxAq3c?=
 =?us-ascii?Q?faypHQvjExWkHwYU5kUY0rpzphWef/ADpxK4SVyRNnF5k8iNl/om+Tx49vlI?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3afd0d-9919-40ee-4830-08dd818079ae
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:31:35.5070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMX8Yq6VlYbFhpn6i+WKIoGEbhB07PokhmSIdcTUDCMXAZHDp9ktlmgOdQJED8QTMLBRNBa4+XohngyA4f5a8ZSTZ8mPdLwJp/2gSBMit1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1521

This patch series introduces support for the Chips&Media Wave6 video
codec IP, a completely different hardware architecture compared to Wave5.

The wave6 driver is a M2M stateful encoder/decoder driver.
It supports various video formats, including H.264 and H.265,
for both encoding and decoding.
While other versions of the Wave6 IP may support VP9 decoding and
AV1 decoding and encoding those formats are not implemented or validated
in this driver at this time.

On NXP i.MX SoCs, the Wave6 IP functionality is split between two regions:
VPU Control region, Manages shared resources such as firmware memory.
VPU Core region, Provides encoding and decoding capabilities.
The VPU core cannot operate independently without the VPU control region.

This driver has been tested with GStreamer on:
- NXP i.MX95 board
- pre-silicon FPGA environment

Test results for decoder fluster:
- JVT-AVC_V1, Ran 77/135 tests successfully              in 35.519 secs
- JVT-FR-EXT, Ran 25/69 tests successfully               in 17.725 secs
- JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 81.549 secs
- All failures are due to unsupported hardware features:
-- 10bit, Resolutions higher than 4K, FMO, MBAFF
-- Extended profile, Field encoding and High422 sreams.

Test results for v4l2-compliance:
v4l2-compliance 1.29.0-5359, 64 bits, 64-bit time_t
v4l2-compliance SHA: 2a91a869eb8a 2025-04-12 11:35:53

Compliance test for wave6-dec device /dev/video0:
                fail: ../utils/v4l2-compliance/v4l2-test-controls.cpp(1180): !have_source_change || !have_eos
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1, Warnings: 0

Compliance test for wave6-enc device /dev/video1:
                fail: ../utils/v4l2-compliance/v4l2-test-controls.cpp(1169): node->codec_mask & STATEFUL_ENCODER
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0

Note: the failures are all related with the eos event.

Changelog:

v2:
- Refined DT bindings to better represent the hardware
- Reworked driver to align with the parent(VPU) and child(CTRL, CORE)
- Fixed build issues reported by CI tools (Smatch, Sparse, TRACE)
- Improved commit messages with clearer descriptions
- Added kernel-doc for exported functions
- Removed redundant print statements and unused code
- Reordered patches to prevent build failures

Nas Chung (8):
  media: v4l2-common: Add YUV24 format info
  dt-bindings: media: nxp: Add Wave6 video codec device
  media: chips-media: wave6: Add Wave6 driver
  media: chips-media: wave6: Add Wave6 control driver
  media: chips-media: wave6: Add Wave6 VPU interface
  media: chips-media: wave6: Improve debugging capabilities
  media: chips-media: wave6: Add v4l2 m2m driver support
  media: chips-media: wave6: Add Wave6 core driver

 .../bindings/media/cnm,wave633c.yaml          |  165 +
 MAINTAINERS                                   |    8 +
 drivers/media/platform/chips-media/Kconfig    |    1 +
 drivers/media/platform/chips-media/Makefile   |    1 +
 .../media/platform/chips-media/wave6/Kconfig  |   35 +
 .../media/platform/chips-media/wave6/Makefile |   20 +
 .../platform/chips-media/wave6/wave6-hw.c     | 3108 +++++++++++++++++
 .../platform/chips-media/wave6/wave6-hw.h     |   69 +
 .../chips-media/wave6/wave6-regdefine.h       |  675 ++++
 .../platform/chips-media/wave6/wave6-trace.h  |  336 ++
 .../platform/chips-media/wave6/wave6-vdi.c    |   49 +
 .../platform/chips-media/wave6/wave6-vdi.h    |   45 +
 .../chips-media/wave6/wave6-vpu-core.c        |  461 +++
 .../chips-media/wave6/wave6-vpu-core.h        |  105 +
 .../chips-media/wave6/wave6-vpu-ctrl.c        |  860 +++++
 .../chips-media/wave6/wave6-vpu-dbg.c         |  230 ++
 .../chips-media/wave6/wave6-vpu-dbg.h         |   14 +
 .../chips-media/wave6/wave6-vpu-dec.c         | 1854 ++++++++++
 .../chips-media/wave6/wave6-vpu-enc.c         | 2699 ++++++++++++++
 .../chips-media/wave6/wave6-vpu-v4l2.c        |  387 ++
 .../platform/chips-media/wave6/wave6-vpu.c    |  469 +++
 .../platform/chips-media/wave6/wave6-vpu.h    |   85 +
 .../platform/chips-media/wave6/wave6-vpuapi.c |  998 ++++++
 .../platform/chips-media/wave6/wave6-vpuapi.h |  987 ++++++
 .../chips-media/wave6/wave6-vpuconfig.h       |   84 +
 .../chips-media/wave6/wave6-vpuerror.h        |  262 ++
 drivers/media/v4l2-core/v4l2-common.c         |    1 +
 27 files changed, 14008 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/cnm,wave633c.yaml
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuerror.h

-- 
2.31.1


