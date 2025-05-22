Return-Path: <linux-media+bounces-33136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9358FAC0D98
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0D231BC6324
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C06B28C2A4;
	Thu, 22 May 2025 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Ve/3tFsU"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012006.outbound.protection.outlook.com [52.101.71.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1928C02B;
	Thu, 22 May 2025 14:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922798; cv=fail; b=oDfW+yiLWolkc8Di9kuFswEXALY6Ck3dggV6NeYAHprVownNqsg390nEt2tB9ryT5R9cdjhtUk7KNP2rHLcVKz2NPbTE9KLbhZIpvs/sbXJoUp2V6D5Lt/ozOEX+qhlq/o6ANgmFvKRl++CRfGU4QtvBSMT+7+Shwnh13ZCVNbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922798; c=relaxed/simple;
	bh=r/16opGlPi/HMt0ohz4XmRjc8gvcu8GFBqyg3ZeS3JU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O0hseOX7NXt6Vi1tsV9r9XXZ9qWKDAAucGvt2d90FGq4ADBPsBTBrBMsQjgdHkZb+DbkfbWGCS74vGxuBAxFQ/W2Vx7TH4RWnwGWxi8bDs8YzaHHIWSJCqdlSrVpj9aEl9QWkMVQ+lGPTvbvU1inn/yT3364loUbCU1Q0OT4cR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Ve/3tFsU; arc=fail smtp.client-ip=52.101.71.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l09WvoyobOdUMiIOT1uUa7KMjnVyDpDQJ1hrwJi60fSTzFQU7ofO5KS711w8Ou+zCwkmfvO98pWolLQbkzpSSa2kDhzMKH5nPb8FgwB2nimyF+J6udbOOtpdTGHY/GE9+iowMbFUhESyETuFSdeas0MCVSn/mcJnk8Wd/WXGLcJk2aqAFlx8plSVTEzLObVKvf3nlJMnqOYVDudlbV2ykweIL+8vPlTZuf0ohz+ZBAs4+akNcOz8TjVbkElAbO1xy1me1fJaTJ2PX7TRh2qJ4/AORhuKd+N0toLqgm48OEhtKkpBgTiHqTCW4oxbMGm9iJh7xbWLIssgE1dMRaMqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2d8lBGUMmM5wk/O1wf1v0HaSQEp2NcTq09RRa3tsd8=;
 b=kWdD4VzwCVUHvSFOYSRu3TBqRxDvUMc9GuspgvNWOfMrAT3jMz4+aqLlpBx2JFJNqF49TYz5lH5h40Seq2YS3JEZCc2v1R4O85z2bkNgyx2U2sr2nnPJ9j5L+Dr3+kmT5lGyzY7a2VNaoQNjPG7K8T3gkSe8djAIShAuodpEGZXj4ziFg0Rm+9OjDjKkkzpuWRkgSbaYzy6pKk4WZGa3LrUU1/YBanWwJ1XYy8sVSR+x7+edAEhYwREKTTkKqNKXn/K3+uk5rqDiw6bMMU4ozqHbWBA63UvzEBdF952Yc+Iocd/8oLW+63Wg6noK2gtclmHB/ay/4mnPkrexUNxT3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2d8lBGUMmM5wk/O1wf1v0HaSQEp2NcTq09RRa3tsd8=;
 b=Ve/3tFsUXQbkSjWq5INhi1YWVH4l9mBBRJAQRKyWuJW9MrX084tZFlePrna3nI7zG02VVMdNKW/8/lVdvgK25bp5KOZtPf/69gZcgB/YvV7rGwjeX0HfaBXbJhmdvNC2X5VnaqVNXTzG9aRA6aakAUIKCAARa66JxtIGhtEqUUnwTCV1MJHO2ZJLlOF8U7hcP80cjFaV/5kFYWEhKqvMvMHa2gdFO5/M8+f3xoZEIKhlgnE0re0M+IkSKCwWwG1z57Lqgy+jD58X+2QQxrUM67TcARCla8CrAsRKAis6yjz1iuzENe3n8vqUaE729EpW9ikUoX7P/VsWy6qNGzXu2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by PAXPR03MB8252.eurprd03.prod.outlook.com (2603:10a6:102:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:06:34 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:06:33 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v5 1/7] media: dt-bindings: mt9m114: Add slew-rate DT-binding
Date: Thu, 22 May 2025 16:06:07 +0200
Message-Id: <20250522140613.104963-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522140613.104963-1-mathis.foerst@mt.com>
References: <20250522140613.104963-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0078.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::11) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|PAXPR03MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b1e265-997e-4352-e6ef-08dd9939dbdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TYuwWk9so6EfPLge1KY86AHw4H0wUAQihdhCHGSnJ725E6qwshee50O2WwJW?=
 =?us-ascii?Q?+j9AZsPjs9tW0jB+/qFyi8kjieTTPY7jrBktH478ohLse5BcMIymLzcgqpDi?=
 =?us-ascii?Q?D0A4epm06I7jnDE3uuncyyO6hfj5G/B7wNsI7e5Bh/YEN10hP4uDOTiAMxR9?=
 =?us-ascii?Q?6oGWT4oRpZE6WoHCgEVNwS6bPHNfLywVXpJ+fBYT937rysSft7iH49m+nVxD?=
 =?us-ascii?Q?LUiN95nZHEyiNCWd2ie+tyI+AlD2BBfumSLClUzhs+JTsPrRgUUW2xnyEBGS?=
 =?us-ascii?Q?Xw/mOFBJY404SMMTEALlU7tbtL+NNu58JCWWZXjxGF0XyKmMb6j8Ul7O0A0S?=
 =?us-ascii?Q?sWMWM3h3LU0LAcZiCADbfLLId9Z5t1VyS8GmhZxvmGhqX7cYHOrw8bPYfnji?=
 =?us-ascii?Q?OxZM2X930Pa/lvo91pj6tTfHvSV8lfFq7Q1tlDKZruhTNaLwdQPyB0Atym0h?=
 =?us-ascii?Q?tPdyIyPnJT1epqDw4ponE3HzuB7eTfqc82PAgpVZkcRyYV9UFlYDIcswVwfo?=
 =?us-ascii?Q?MFf2J2b6uPB8/lYh2oY5hVg1r1iipB7eWnIZ5WXFm3cF+784BqSWpWI6egBn?=
 =?us-ascii?Q?XLm1w9L5OcySQnCzFUIMCwtAY7OTL4/mhGs8tWHBKqzrqrtqR01jcqpM8Z0Q?=
 =?us-ascii?Q?3dDHsaaVITNBrBOjbiPZ8KzJVBiaX0ynOT7FXPh4//3afYqtgzooWcn8gMKC?=
 =?us-ascii?Q?PBG+QHBuoXJlez0MJbOvLNaW+0OPEs2wOaWrN+hV3/ge/j4qmJSiSi3ZELxg?=
 =?us-ascii?Q?+T/NQ7+HPNlAHDuLIXBd4/YnqSOTVMiTKUXSI+8cNsRe01RJ0RdchaIGjTXE?=
 =?us-ascii?Q?KFhY13Revu2nS43trZe5r1C/aIzFNgwhFKGbep91qJw1+YdTNCZZkCJK0DHL?=
 =?us-ascii?Q?uz5PikWV7jd1Z/QmTxsefpnRA4nrOaTtPT2zi3tEUGgD8kms/AumEkVHzz9w?=
 =?us-ascii?Q?Vqns2PB/9to5PErIx8FySEA5QYieZDVCZHrsaB1F6IWcR/ABkZroBIee2jBq?=
 =?us-ascii?Q?3uRz+qwLGH0O3cwH2nkFLoUGnDdYL2y5ENhf64eY2goVT6RACdvGLB6two2o?=
 =?us-ascii?Q?WQBWtPwKKcL0ttbrsOsKnncZUcfOSZ7+jvHHEr1MkS2WIjMwYpdvXuzA5u1Z?=
 =?us-ascii?Q?fIUxCzeOkSdOYoRZUr/bUEG/L0ncAz5TOgrksEBIgdzUSSdMnFsgMHkVMooR?=
 =?us-ascii?Q?hDMBKCL3SKoUiKWkdMpU5b4wNvWJ0ob+ahPzqBOHSTaQG5zQW/+2Q9pVDHYi?=
 =?us-ascii?Q?YjC8xK40fdoD6Zyv+IlIA+fjYqnv5Z3UWUJ9mm4ahDA2AK1hBoKsWmSwI1iu?=
 =?us-ascii?Q?LE3ZaYAx5T/Q2hQ4w5EUX1DFQROyBYuAxW6HF8de4p1hBXLNxfbHQj/oUGpq?=
 =?us-ascii?Q?ihINHb/amA2NUgRJ7w0DUNilyCvogzsSole37+N1BLjVlHFz15ykolxBtqTI?=
 =?us-ascii?Q?7Q2jzuJXvUeSyPm8chSiav1nVXjLRxqDG1mZbRrtsE3c2LxkuJnMvw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tLOUPDj7gmAb6xVng8BLRIGzqDD+w/2qDN3JRDKm5o5HU/qQEA8brrKocR8g?=
 =?us-ascii?Q?j72t8mD/AZHb63AmQwxKoX1ksv0M/aF2BLpWXbYLGjpdDDu6tLihMxOkRrjc?=
 =?us-ascii?Q?SDk1V4j1S1tRHp+kDWZoqzHNR4zOEtNzEYusvRtOILZO7Bs86w5J0qjbwYmo?=
 =?us-ascii?Q?A/ZttAUrxJtplGDTB34Fr8VjRjQM/iwbNQrqoHPkA2Y9G+JesY2D4OhB0vdu?=
 =?us-ascii?Q?iidljstD2PLB1nJ4ZF9n8m7IdBRPk5QnIi6uQmAOwkeDz2WAa27pHOtCK34s?=
 =?us-ascii?Q?ty5vdKTJMRFiRxqU6BIZtZQQSwwQRKSuctnGM8UOz1s7pqNcirT53W7VLJwT?=
 =?us-ascii?Q?zUppGwLqeLqQAL2AnLoPRxcWEVz1N7/EK2xlFuGC7sQ0PAjN8BaoI+7Ugfec?=
 =?us-ascii?Q?7B4f/42+G4jn8jh7Jb3nyufT1cM+E7sins+li/Ehcw/QBp0jD9h1tNbN8rZY?=
 =?us-ascii?Q?3B4E1f3sZj9fA7vYwxvaaAz5PIt0cFh0sIhjYlyHw4l+a5mBdyE0fOgtNK0i?=
 =?us-ascii?Q?0aRx1tTRvXtz9AgsGxPLX9wMTFE56GT9bbCQ2/srhcC0Yk1Icl+qj/S1ewC4?=
 =?us-ascii?Q?bRS/lAhYTYDc07AzwkgiscPGYNg0snWhO1hwPn8liPfjl77AkQeyGFwelZfF?=
 =?us-ascii?Q?Hu5JteFWWCHbksF75gilUS0ZnXcxITTsbvshKXWN8mn34zIQ3Sxud1xwMDRq?=
 =?us-ascii?Q?Y+yTQSmp2syXqyWpWv4JJYkahUgLA3RXb556e2h+WPrnfaZQJLjKof6DmGuT?=
 =?us-ascii?Q?nAbiSWA1rxcs13OFDC2efBPmp+nyr6e+rtpJ/CfJcmiO1ZSlQJT3wyOcSyIq?=
 =?us-ascii?Q?+/goJ4Tirm6+L7nkeQupfE1D8o+HlNAaKwubGZWygbgCp89X72/1hG9RBp1N?=
 =?us-ascii?Q?9vo01/MJRHjF1tRDzn3hD7qB8MnUF6/dIMZ0kq5FI54Lekkly69pkQNQ7uWJ?=
 =?us-ascii?Q?UvnKXX1jbOAmsr0DATK2J1ROfUqf4gZBJqiYIfUMOuPf+kPQfdrAFGVMtSSQ?=
 =?us-ascii?Q?PaPlAfRri61cD9mzR46CvNmHQPMk4zCkovQ3pMXgfdhrFJKlEEHFlOnPpPkU?=
 =?us-ascii?Q?fLdgx7VRhZFsh2gDlkFAQV6hwK1sIDHSi4DBdklAO7mFPK1DRcJgHkiaa7hf?=
 =?us-ascii?Q?yM/gTaxNS6361gx8piminyFuiiJrXn5AorJh/4q7GJmgQdq0MOB4iP3dOsR4?=
 =?us-ascii?Q?wuc3PPL9UjbPXAMnImL6LlOSWaRUKClzDu1t2ZWHH+6RU373gre//xvg51qe?=
 =?us-ascii?Q?ocCfDAPaLVZg4ryy/kRSUpV6Lch1c8ggIoplw+V7S2Y0nPSd6GTV7RrboJDK?=
 =?us-ascii?Q?HCjALlUgnno7kL5Z5qqjGQar9VKm6roTiRIM3ZCcmsjWYLWg007inE09tOuX?=
 =?us-ascii?Q?d4xaXa5PWZ2lbIioGYsMMsOcopyL2se3dYHdCgBghNTNqXRrNWgUrhV63asm?=
 =?us-ascii?Q?9a50fynC3RXTReE9o0IkSOQRqS0bjUmMRlxIy1KO+eFTZpinU6/3d5tmKB/E?=
 =?us-ascii?Q?r1359Dmd8z0nEWKIZctUZLqwtV00irtx1MX6nW+3/TPnchLZ5F88YpdPaWqZ?=
 =?us-ascii?Q?19ZmD5vqq0WovL1tcww+nccwlBKkXn0k2QDKKqzr?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b1e265-997e-4352-e6ef-08dd9939dbdb
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:06:33.8901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5271gBM6DVd0NFCy9rlYkg6CBOwVwJtoZEzT8vFqkY52V44eoHT3qBi7vwLf5EW0zjWCKhUL/TIKKzWlv5uHMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8252

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Add the 'slew-rate' property to the MT9M114 DT-bindings for selecting
the desired slew rate.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
index f6b87892068a..a89f740214f7 100644
--- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -70,6 +70,15 @@ properties:
           - bus-type
           - link-frequencies
 
+  slew-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Slew rate ot the output pads DOUT[7:0], LINE_VALID, FRAME_VALID and
+      PIXCLK. Higher values imply steeper voltage-flanks on the pads.
+    minimum: 0
+    maximum: 7
+    default: 7
+
 required:
   - compatible
   - reg
-- 
2.34.1


