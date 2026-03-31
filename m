Return-Path: <linux-media+bounces-57723-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBl2NM53y2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57723-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:29:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE813652D8
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8DA7308E4A6
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AB93BE632;
	Tue, 31 Mar 2026 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EjwXkK21"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010056.outbound.protection.outlook.com [52.101.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCF23BC67D;
	Tue, 31 Mar 2026 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941912; cv=fail; b=XE61dpMABwxSF8J9I3VfQfutg31pmfNfYNj6PQtQZQrwGCb4Ru6PJuyCBYApfsdIMDUoRYU8zN1bHFAeSktmneaAk03gNfSIsT/PElv2fqauDbbAH/Mdrrw9dbxXuIZ1M/Ut8Eog+3rfgk0XLKQkJVl2RU1e5fiODh+0hcAJmIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941912; c=relaxed/simple;
	bh=hWKpmWOufJmSLGv7xPU79TLS9GbtWtcXVwLTxhBsuW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WpR7kcMUyjcuZZl/EmG2or1YVvQuGs4/AMxtg4umD0S3tlYP87w68+oKWjk1XJPW0PVlhfoP9ETHvTEY+9u4L06XjolrT80XZZcgk0qCI94O45AGO5JqhH++O98OZ4HQR3tjSAWTMc4mXGMKoXZmxqRmrnehRHHEW/5LppH6Lp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EjwXkK21; arc=fail smtp.client-ip=52.101.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8V/ybwK4anaStLs4dm+4xufYtFr9bDBcDnwn6eg1DNSP/7igjdI5AhnntMXqsahIZh09Mlgq818nW9ltJ8Cx9z5BDrK0Vurv5h72BzSSe2+h2ObmZaHyb7pMGjCYSCopItZteFiTDdQqBaTagIGw7rPG6nLNgZaSK/VDu1a8shREwWBF70q+N+MhyQLm13VtpBxAeTWbEzvqUIBuN1sebDaGlhHuc28yzDYT2+SPWVvDsFgMway1wHNIv4AZILCLrnYsXDFJnmqmMsJBVML80Owp+zTuOKNhrL24mKzTIA6QvGgpUt1X2pYMvBTLDADAOFga+Rr8vJC05k/znjnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6NUmA4qkRY/wUZ93SuhH+Y5gV/K7uEqrf1r9MuqcTE=;
 b=p2vy1UBuOOesC2902ElGrx/Gv72mo9xeGsl6Fa/6S4bAEk5RjHlzJXymz5qHVuZBkbt/wXTnMb9wxxajCyWAoMTzVczTd6ONu0AIM1soRNnZNS3BN6Hy4c5CR8eCLjgTkLW8YRd4vfG6foR1y5OG3QvytKy9zmWBb7LJNIDntUurZjDG3cwm4lnaRZ+87QzvqLMVxS8rglx+0f5TzDWxaph/PnonZ2I/x9nJ5Cubtrf7uXmCQjycp4S0XHmZpH05/VqH+2sw6d4LzK9o4KxeQ9YId3Rb3CM2cYVAuhMIuk3FOa5cPa1PEdseQj85YWMgjo8pA0gcArvvf+qjiCtaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6NUmA4qkRY/wUZ93SuhH+Y5gV/K7uEqrf1r9MuqcTE=;
 b=EjwXkK21+z0CJgThcCxdz8G+U0MuTQ0xL2EvdVf75qlBaZZ2ZuVmVaWzdnS3i7WWJNKmblrJKf4MWRecbnid1HLthYdRfZyrYD8Nc6NW5qEuTVx+qnLYW4inTyOFU/e1VeGr3QSjQujilDNZgyYjvn+dy1dQbFWmIo1qS3Z0JUBZFfZ8E60WB7MPeQFzFXmZFQQkHXAoJ+dZQJtU+JqHk4f0HkK5Kvo4a35P2MvDRg6BApqbDrnIamcygfFYRcLpOFbPTUz92jfC202dIxmSX2TfDmRCacXBYvmBOtqkMVmjlVq5dh+0CLiWno7wy3NC4p5bekCvD3FkLb+ehWQOcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com (2603:10a6:20b:8::21)
 by DUZPR04MB9968.eurprd04.prod.outlook.com (2603:10a6:10:4d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 07:25:07 +0000
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc]) by AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc%5]) with mapi id 15.20.9632.017; Tue, 31 Mar 2026
 07:25:07 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 2/7] docs: media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE control
Date: Tue, 31 Mar 2026 15:23:12 +0800
Message-ID: <20260331072347.253-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260331072347.253-1-ming.qian@oss.nxp.com>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To AM6PR04MB5110.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5110:EE_|DUZPR04MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a0fccb-ff38-4284-05b6-08de8ef6a2ad
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	LY1F7OlDZCAmdB6fv0ndJEWmMJ0IThJUwGAnJMvKQNmpK9pjVmF9Aet3qbINZ5hpaGEKjTWpgtnHoX4EbSuQAaRKIRo2cShZ1tiE6iPRXcDp8qQJivqKOsajWSeYan4pVH1GkGDMA4IXzRMOFzgka9Zk+3/zN12HV1tlSW+XGxiuu0G1zPxAV2xHBAOxUAVT3xjA0/v3Udz/mH2Ks6H3Rf2mVnUiGOn+KfWLERD0cA0er3qkObraIWawXUvMbQu3eJX6Phb05t9JxFV+MQPKZXE/tDOeP5y2s+2SQpTDyrHwAvJZFIx+F1YPBY0v+CKG/QNJR/Qbv8Gw8T6sh7N6qoZT/ngusyAVV8avF7dr0MySv0QsZKeMqUdGZI3HsoJcFEh111GzzuTYCs8V+Nug3tT71lGCBWfWcuMUDqz8+GrJLxCaAQ1PwJghXV40Y7/VJHaadgWDl69HbGQKKDQb5ykK31VSDZkUZjN1tS8DFIQrcd0bMh2nVerUsCXNxlogMsP6craJSDsb819hHRBJcjSmKxttnLme70uf2pDLplbQYvXBbBaqU/fS/KkjrDtG3GnM6eMnW0N9CYPPBsIDiuCtJoOiCgLLHqQZ5LCw2NauPdsnJXeYKFys9DdLLcv9V1JPdKFuK6f+1h8ud5CjxAopnucKvG4qTMc/cV+qWzxVzKA59x2BKapNKCLXuxxh3rxxrwCRK5EDJU5CvMv2P+p0bUA6IeJfPFnFQtDA5lUFAgo5ZWqd2XlGJsJRq4ACVPyuMvZMwptRpNaWJna/h1RlSXSL3yZaUxRcne3eQuo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5110.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HnV8ISG44Ta4yoHE55NM0hbD/D9WnWE1yC8DYVeWRpHn/IPatVMOQLm1p8Bx?=
 =?us-ascii?Q?PpL6qZY2oLv1J0oFiOPYKZfQQtzYBIO1n0x49GMc5QUjGTngqK6FqeCXGp3J?=
 =?us-ascii?Q?YokxLvYpmmhfLU9v1PAXYkd35iI5H48HPDZBFqYkw04ZrRhin6NhFYgtn73J?=
 =?us-ascii?Q?zAAKaUnRRBbhT/AXJsN/RiCKU9fLVjfjZDqgmaiQj0ZSYQvDvhyhOLTS2gx5?=
 =?us-ascii?Q?FkDPZYiFdEL3zhKfgrnZqozYyvGRwXbxEBc0E5H3Wn3meb1Oilq7sE3gq6lx?=
 =?us-ascii?Q?DqIRhTWegv9k8Ocz0UJFkNFXZEuYbc0uStI6ZgWwSouxwOq3bKBujhqbRMpg?=
 =?us-ascii?Q?H5JpG1mYQ307J+ds2voErOhN++NR8Igmdm5o2zej+jLcgGfgc+uMST9BIOaD?=
 =?us-ascii?Q?bGKk+U7ussMOKIHpJbwwsFHSjbKT/5mxfpeLgFLFstM2xIMSF2DgffsOO2lh?=
 =?us-ascii?Q?6rlPRFFAg7qmup9dJ2eeTlgi4WivtpffiQ+cmNyMTDu/KyMBS346cpv1xFAo?=
 =?us-ascii?Q?mC8II1iN7CdWSl2eFMLiH+ETJwKCYDoulIxTMcuOi83QuOCtijDiGwKdnVEW?=
 =?us-ascii?Q?LWiR2Efk/MrnwQGfzoNLGhjxb9Zc8gaie2zYvVWDqGjmphCnZ/FRnee5Hfop?=
 =?us-ascii?Q?LPsNT17oegSQUtMYcnAcMNtdI0d6vlI7k5OXPb8owLMNiwieKLJRVtJf26b3?=
 =?us-ascii?Q?QJkYxFEWqp0FCjmlllS2GCrvRFLxwJ8RwgpDyH5QiqxMyXkA0yFCjmdvdX3i?=
 =?us-ascii?Q?Mohg3IEWMF1WolzBdy/dGkvUwaYVJUCelqKCLVwghAxCE/QHSM+ellGziLmH?=
 =?us-ascii?Q?2ZsF0mC3tGCp8Xg++qAXGsEVAyfrowUKHv2zLQKR2q3sy3dpCPfhTTk7Q9Qy?=
 =?us-ascii?Q?aAMXgBQbkT12vpFb1MJkWmOwXl+KdHx3Gf/LsTdwUeTNKOP1F1t/FmOZHABt?=
 =?us-ascii?Q?RNqc8sRYuy1rBE/29rAqgaLKIf6iVkc4OaUHkv0bzauyLcJtVdbPtcMJ65/n?=
 =?us-ascii?Q?0A0mg3oV0qX/IFpiNhawgKAqk3JYOEo87IDZ26zp3ZiCDLmb/m3bkKcArXoA?=
 =?us-ascii?Q?62CG8+nSgCqZcXparrutlycLg06KPLAIqlJFSF2tNAz68AtJogVUhln8DKf4?=
 =?us-ascii?Q?/V7ZT1q5YIsBmf9Pp7GDe+fdgdGZY+YZuzDfKme8bAS/jDP4Cg5zqH/QNyt6?=
 =?us-ascii?Q?JoQMFsJEJ06trrm1L5EXv9ufjfQEnaCei4Sc5QbZ/Wd3FzEMjL4NGo7VLXG6?=
 =?us-ascii?Q?sgaPOScHIWVx4yKHEKUT13gMi8TLvkRr7myvadqEIkq1JF1oMjp3Tc7dH5Gx?=
 =?us-ascii?Q?gOW2uk0ZRLhsHgOjBhDsn5APkIljdM/AebNjEfY+dsaOKNDFK8GukHVV+9yp?=
 =?us-ascii?Q?wTi3Uh4G8c1QJjNESpXYiAsusFFgUW0nzRsV7EUridM7kLpPjuEZhEWkStKy?=
 =?us-ascii?Q?r1PIqNF942Nf1QqXpuNayIynMRRoprXEOBXcC8kdCjdporIZ8A+SJW03yq3G?=
 =?us-ascii?Q?VzNhMDOjOeFADnAiiTrThZpJFNIltUgovfQWSwQCw4uoFHjPjEKRZz9QRKoa?=
 =?us-ascii?Q?wP4O6qVcVkT4cmxWojJZiESQ7cvU3f9O3PtkQn7DsbW7uj8SaZAOX8pdrDF+?=
 =?us-ascii?Q?tIU8Ea5nJva7JFbjWZOXFz8yGxdwIOhpZVUsIrny9u+dEZ4AbfUpCqhgz/vj?=
 =?us-ascii?Q?riFyAptToOTpklg7k2/xFJuS85d68P3hQQIhRmWhOmXXK1ZkODT2w97tcon4?=
 =?us-ascii?Q?HL+1qt1Bqg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a0fccb-ff38-4284-05b6-08de8ef6a2ad
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5110.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:25:07.8187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vI6/grQU25kBrP1HTciMoh69kjWMA2wemTkHk5v1ehtRPmpAcBq43HBU0fQcJ1zVCT1CNeUSFmjV8pGkkIp2ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9968
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57723-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 6DE813652D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ming Qian <ming.qian@oss.nxp.com>

Add documentation for the V4L2_CID_MEMORY_USAGE control in the
userspace API documentation. This read-only control allows applications
to query the total amount of memory currently used by a device instance.

The documentation explains:
- The control reports memory usage in bytes for driver-managed allocations
- It includes internal buffers, intermediate processing data, and other
  driver allocations associated with the instance
- Applications can use it for debugging, resource monitoring, and making
  informed buffer allocation decisions
- The value may change dynamically during device operation
- It only reports driver-managed memory, not application-allocated buffers

Update V4L2_CID_LASTP1 definition to reflect the new control as the
last predefined control ID.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../userspace-api/media/v4l/control.rst       | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
index 19372bb32c4b..6904c5bdbf37 100644
--- a/Documentation/userspace-api/media/v4l/control.rst
+++ b/Documentation/userspace-api/media/v4l/control.rst
@@ -316,9 +316,29 @@ Control IDs
     set the alpha component value of all pixels for further processing
     in the device.
 
+``V4L2_CID_MEMORY_USAGE`` ``(integer64)``
+    This is an optional read-only control that reports the total amount of
+    memory, in bytes, currently allocated and used by this device instance.
+    This includes memory used for internal buffers, intermediate processing
+    data, and any other driver-managed allocations associated with the
+    instance.
+
+    Applications can use this control to monitor memory consumption for
+    debugging purposes, resource management, or to make informed decisions
+    about buffer allocation strategies. The value may change dynamically
+    as the device operates, for example when buffers are allocated or
+    released during streaming.
+
+    Note that this control only reports memory managed by the driver for
+    this specific instance; it does not include memory allocated by the
+    application itself (e.g., userspace buffers passed to the driver).
+
+    Not all drivers support this control. Applications should query for
+    its availability before use.
+
 ``V4L2_CID_LASTP1``
     End of the predefined control IDs (currently
-    ``V4L2_CID_ALPHA_COMPONENT`` + 1).
+    ``V4L2_CID_MEMORY_USAGE`` + 1).
 
 ``V4L2_CID_PRIVATE_BASE``
     ID of the first custom (driver specific) control. Applications
-- 
2.53.0


