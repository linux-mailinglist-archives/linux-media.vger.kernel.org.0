Return-Path: <linux-media+bounces-44476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D64FABDAFAE
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 20:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5CF103566C7
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 18:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8757E29ACF7;
	Tue, 14 Oct 2025 18:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WmllD7ha"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9903C25A64C;
	Tue, 14 Oct 2025 18:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760468132; cv=fail; b=lyoDuhj5bxfEjiWNLIAr1agbdQhkgOQlLaBtkJ2wHu9EYQtT2AbrVo3d7SFs/7ovchoJ4MV5rI+42YVkBabUjw9dFOjh9kIhLX8p7hlnIpKsg8YGkMzyIU2rPzctEfeInawucdPh5rsK4gUdpFcfFvlOJg/c2S7mf2+na/e5pQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760468132; c=relaxed/simple;
	bh=3sB/FWDQ+BxCCBw0haKf1tMgLKmK2cPUqUZUCgE4hbk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VujgXExCn0V8IAolyweaA4i19eAgdCOSmgWiIWzMR102sjNSJiKbPCQrFBtfNkMTpwfBFrUKtfg3XwVM1qsG5ZJucHsWPWt4q+P+/kSpYtDIC2Z8PZwEISdGaudbsaoR89KIiyvhCHEBKNxKE7zZzKo4HYiLdcx0bZ3+3oxTz5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WmllD7ha; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDywMKpE8vBjRlXVr0UNTGfjDB5EP4kkfy76Y97LPI12oUw5EFQII7b4+0TvYu5VjiZz3rmBAtCpScexpmoweDFBGVp+qVjo6uykF64T9gZr/7U4i5LKXqcsuUWOlKidQb+H+9JfhcnCApc+ySQWa96wyBc6j2eDt+5O5K6u7O8k3rthLER358ZNmPx2WWxayGMSv/ZyrPETU7NBPpT7KmUUSmXIEaeZ49DCZYyj5ugcQsy/g5srRjW8RDAAamNHs7MsnmzRqrC8jFKQTAzgIvZz773ZtK228AiKKLVskZKIv+Yp6HZ0wqqlEC6hufdsfRfZOKAC/iLTOBUhFF0TQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmETc4NHeYo8F8F4lTPhZFfGqlYJ04IS+zj5aRBgB2g=;
 b=o4xr00bRD5nfPV12765EtqgJgjan+fLa1h5CQcoYMMHAvEKddcMGlQPjMbx1TUSkiAnmwGE+013S1SCuN/5kru+128GhZax/njjpDtQ8dwIuTkS8EuqzfnEcHW3F3tONTudAF04HoknIpJJu6C/mnyAnSp5Un3bet3Tg7uEP6mlK775CeisTR2XNLDEaXNDPYw8DTPj7zZCAr3p5WOpMU58a8AEeGRoAAGFDWvqzKrozGyFCBu12d7DSPK6XbpvGAzz/wFDNvUVMs74GjyLATpqGJUWTuFFXeZL8QG7E7ppYt4EHdGMG/t+xT0dA9z0vzKoGiX+E3vKjp872ZH+Pyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmETc4NHeYo8F8F4lTPhZFfGqlYJ04IS+zj5aRBgB2g=;
 b=WmllD7harQosdcbgXqNDqeSlGwotONbN72xY2wBR6+09wKsk+/OHifg3LAVDPohArzxmmx7fKkw4dkUsW+QE0xLFINPZrVIyLxbQAyZHaEP1+nfsAwQVq4iqdQXFCC/i7KoYBbSn+9KXP8qSrfgwGUOvmle2LPs8d1GoHVAD/QvQ98fnSPv/JlWE1V+/SkpSGiuzaMX4GsGfLA94+1W7iQV+tMPLgzXX4IvOxnrrrVE/R9cUPafX6qdh6T7dpipMIyK2qipMrFWNwCqcE63wFBPrOcXZGMRMWgzDXzE1JCNf49yRpNJVmEpv41F94fVRGxekZXkcIkT/Gfy7U6d2xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 18:55:28 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 18:55:27 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Heidelberg <david@ixit.cz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: media: Convert ti,tvp5150.txt to yaml format.
Date: Tue, 14 Oct 2025 14:55:09 -0400
Message-Id: <20251014185515.2354668-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0052.namprd17.prod.outlook.com
 (2603:10b6:510:325::19) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU2PR04MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: a64d2c45-5472-4a39-04db-08de0b533d9b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?k3vXA2Puc5BRJ9ZJBXjw7pTbcD6A9GFYQr82BnYOXlY2kbGDpHMNIiZhgDnr?=
 =?us-ascii?Q?B/yTRoq35m4tawXF2s1bGR8/4Hj+/DLKXvThGv1RxNMXYFPFF+/qsQCNuX/V?=
 =?us-ascii?Q?eyXtzbdyiPQheTgeKqXxCDoqYPR4+/BetYGO+TV9UCVzylsire5x8KN7FsCr?=
 =?us-ascii?Q?kIuOE2GsdYQ170g8cj9fl3c0vsAkCRRlGqeSl9O6+IqVFl7sQV70yR6YSLzn?=
 =?us-ascii?Q?E+ghYxlqlai/hPNQFGzeS/tU6GJiagmVsYgXNMmq1fyBmCbYIZ+p/+s63dFR?=
 =?us-ascii?Q?6Iyf2exoNkPwndT8Pes6jgMUULzaToNlQZrFLxwoL/iehQe4Hq0sRMkN5iQW?=
 =?us-ascii?Q?ph9yAVlVXSywmhctRYcoHBscBjibPlMOrKNt4DcAki4H55HBe9svILVD8mjg?=
 =?us-ascii?Q?HRvl7T/7gw7prIBblZVXNOl6u0eqyuXwDkdnYtQroh0dZkMDfue6QqdVT9As?=
 =?us-ascii?Q?AZ7ju6emBe/CNet9KhOZ5K5i5glRT+eMjb/rWEsbVT0iWZEdJqkqqZpfrdzd?=
 =?us-ascii?Q?STpDP07V1QajQ/uHiP+5MkWykHBWDOGPBI5SzepSRn9Wa2L99ekKU2VoEraF?=
 =?us-ascii?Q?AT0hKzsi5tpQW3vKiIgSnU9e5BjCpkqX7Mc+8zCuMHLZJKSi4N78yTk0XPQd?=
 =?us-ascii?Q?N0TaqUQxsCPbzyUe6U8FTSeebwdTqeAhYvZFyN8qNmqEW1IwU1NlZKW6xwgW?=
 =?us-ascii?Q?jZGIiE5HhBfF4NV3SvMF1DUAtuZFlwUoGm8eBDhe7Yud+go6XtuAYCynnPtm?=
 =?us-ascii?Q?umezMmT6wqpPKKfcFaGzegym8gPhS9oBmEf06dYaAcFvOlD4XG+VZj/9FTgc?=
 =?us-ascii?Q?l2myD97dUJkl+9vYqvR57WUFHwEBsF3xe5d7m72ek6AvLwFfya1cWd4zrs/E?=
 =?us-ascii?Q?jP0vVKFPtGWL8plwIrJ3hAVJisut0SXei1Kp/h1Szzm04LGjcghjGZaO72iT?=
 =?us-ascii?Q?xWdpAKuYQdw5Sq20e2ECKFUggM5ePb/HQNv57r8cxSs0+g/MfmFPR5I7q54V?=
 =?us-ascii?Q?YdUiw1x48J1wicSVsj36RVX3O8ebztGxRNIBka0neGfijqaROno7+9u9A/bT?=
 =?us-ascii?Q?+8Rw5u4Xhi9R+IhDl+reZXIvgeiTEryGsAC0N9jgNzo51rlXtzBAk2gffO26?=
 =?us-ascii?Q?Yeh6iinT2nvFDuME99dU1CKXgFpvRFrnvMBYk6HFYhyh0IGh6Hu4PTHTzH7W?=
 =?us-ascii?Q?KId+dXydAvZoxaTto4RtqCmjkn7rHpP/Im/I4Iri7RNkIrflNPsAiSekHdvY?=
 =?us-ascii?Q?qpZw9Z64QEozcAG3SMWtVdqMd+caCvVNOM0Vt8ZVsnhZSkj3gisga++bLKCh?=
 =?us-ascii?Q?jRGlXXFvTcr3q70GRgomNDb15jy59MMUPwKI3vq4g+fZoV+g/UAhXI2VAFQg?=
 =?us-ascii?Q?EMz8U4WjEGDAQxCIqInlSpIDbBTvxoOSFnL7maKOtI3s0kYIlbO0wBOecQGh?=
 =?us-ascii?Q?8V7JFRATFkGFNxfmCIySfQ2kUZ0evfHZ3QVJ2AIGozO15Sn+mmOY2m0zjDzR?=
 =?us-ascii?Q?Qiz9Dfb7wH3e9mI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3vtM2wEcN8AP0msUNfhgvt/0FRpAsWi/Ht/okBLL9M4C5mSoKSxQqIWdOx3Q?=
 =?us-ascii?Q?et27EUd1i0MoTYQzYM0VmVy8u9/C8aFEfpsd6AWJ1wwDJXLjsxTIsz+Rz0NW?=
 =?us-ascii?Q?Wj6d7PP7V8CzsN65hVrfbyO+uNOQ0nSMdrS7STH9QvJeVQpoCU1YXqmnFskc?=
 =?us-ascii?Q?guEaixwHeos8OBQvKtwjr4ESaoOJL89/kAB1bPAYd/07dj4CsNwb6WFRm94+?=
 =?us-ascii?Q?4V50JK0I+8rbH/D45spoqaMi9x8+mXJSxj3VOg2UBUKPxmTCqi890ad3GUb2?=
 =?us-ascii?Q?zRJMEbfCjABDL48vHB4xg4B5uvjogQO5z0KbtJp1CQd0B7W+iQUq8XTuBbuv?=
 =?us-ascii?Q?o3i8/vK6jADuGtIvU0irXl/EHlS7/uWbZ8boom3j1qzwnRRhkT40VpFpiEVr?=
 =?us-ascii?Q?pkv7R2UmDv1j7f4NGgpB7XVd5p1WY70az7Eah6Cl+Eon7qyzYpFL4i3BA9pa?=
 =?us-ascii?Q?qa3MJeGh05D9vtlpQhwNqgKjtLMgiwTkR3tbCHbMSyMhZGC/QJJc5tudAb2J?=
 =?us-ascii?Q?I7o+5EsLi44ZrPGmaN19jTeZ8m5PzD4QlVR104qe5CIEf7eJ2Yf3G5qA+VsS?=
 =?us-ascii?Q?VIX89cDagxQ3Oac2Ko714vZKvPNUI1OLsRisEeMPAFJqoBBTDI+bcmFAOymH?=
 =?us-ascii?Q?7fwtVNcofDZbQw/SRmXxhgKIn6Gi2YnPjS1zQnA4JZzpbZQ5G0gmwHQNf8gC?=
 =?us-ascii?Q?zldmjKfrcl9LdS0+mis3SrF/ndqxqdS/6PB4or/apZokleGhL2Cy69/v8ND8?=
 =?us-ascii?Q?SqJgjEGyk4AMjoHPajgaeZZz9GUSEOJQRFjdAUL6poxnRL+2zUnjq+ur0RrW?=
 =?us-ascii?Q?q8NlB5x01lXcUU9kNz2LG0R/tie5/hD890w8h7Su6fWywGJm7MY5mhBFbkLO?=
 =?us-ascii?Q?DR/nnCcTvLoiJkP3OMgDtnt07T7ku8vSG3bClkU4ski0R75JBB9YXQPj7TMT?=
 =?us-ascii?Q?TzsEhKU3v2s66l5MoVMfDQ0iFesnzPoVfEFmtL1POKa1CXvTe8JyPMG8SqMo?=
 =?us-ascii?Q?M/sDs0uXNyZzws1qRZjndZb5Kl/Fq5sVkoFdv2rXmuRJ6hNGCpJ8nxRzqSSG?=
 =?us-ascii?Q?+NNm27KDzvoHoM4pDrDbOu0Ybk/5Lz21l3oj8XjekNubxR2KOvItEBTFeBRs?=
 =?us-ascii?Q?lv1A6NfKIFX08y01ERvoWGRiZ6tgW8RW4pW9af8t8OVazbORjtZF4vqnLhfw?=
 =?us-ascii?Q?A/b2WVLV0ibvOp1mo4lhnY0GwfQJcNglZhJBHnnYWfQ3iT7+o9ubuGDjgp0W?=
 =?us-ascii?Q?6LcnsEwBYsmv70SmxB/wMk7JGjKt/fy9STYjaJyF4Bm0nflt0cT+b78S4hh7?=
 =?us-ascii?Q?UHu3TSSU7rXEAPcWZwKM8708bgVqgzhbYGSRYWPr6Yke6ALoSNXQZAhrliaI?=
 =?us-ascii?Q?xNogPh2I1OHDfcBD9OW8Kzk1F07BZQXZ6/rxGqt5+2ky1NOxCmEhtDOUVZTc?=
 =?us-ascii?Q?5DgI6ds/nTkPMRukDJcDo7xNWG/rp9BxFDqkMmUaDLjtb4Qm2WaqFMk43GLe?=
 =?us-ascii?Q?UuvlTAdI0/AXr2Mt97PTFa456RWD/OOhSSusLKJYHr6ivjMgAA2fFiHYSa/f?=
 =?us-ascii?Q?QFsrKyMSdxNEGncgpen4aIF6gXA3Tx5w7Mz7zeAV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a64d2c45-5472-4a39-04db-08de0b533d9b
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 18:55:27.9100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgR5aqcnWlNsiBzPW3k9g5DSk6vMea2r3Zf9ajFLXjtzaZxfQYMlrH1/9UcSOXuDxBviJI/uRaiwqZUyEmv9Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8616

Convert ti,tvp5150.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/media/i2c/ti,tvp5150.txt         | 157 ------------------
 .../bindings/media/i2c/ti,tvp5150.yaml        | 133 +++++++++++++++
 2 files changed, 133 insertions(+), 157 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,tvp5150.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
deleted file mode 100644
index 94b908ace53c8..0000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
+++ /dev/null
@@ -1,157 +0,0 @@
-* Texas Instruments TVP5150 and TVP5151 video decoders
-
-The TVP5150 and TVP5151 are video decoders that convert baseband NTSC and PAL
-(and also SECAM in the TVP5151 case) video signals to either 8-bit 4:2:2 YUV
-with discrete syncs or 8-bit ITU-R BT.656 with embedded syncs output formats.
-
-Required Properties:
-====================
-- compatible:	Value must be "ti,tvp5150".
-- reg:		I2C slave address.
-
-Optional Properties:
-====================
-- pdn-gpios:	Phandle for the GPIO connected to the PDN pin, if any.
-- reset-gpios:	Phandle for the GPIO connected to the RESETB pin, if any.
-
-The device node must contain one 'port' child node per device physical input
-and output port, in accordance with the video interface bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt. The port nodes
-are numbered as follows
-
-	  Name		Type		Port
-	--------------------------------------
-	  AIP1A		sink		0
-	  AIP1B		sink		1
-	  Y-OUT		src		2
-
-The device node must contain at least one sink port and the src port. Each input
-port must be linked to an endpoint defined in [1]. The port/connector layout is
-as follows
-
-tvp-5150 port@0 (AIP1A)
-	endpoint@0 -----------> Comp0-Con  port
-	endpoint@1 ------+----> Svideo-Con port
-tvp-5150 port@1 (AIP1B)  |
-	endpoint@1 ------+
-	endpoint@0 -----------> Comp1-Con  port
-tvp-5150 port@2
-	endpoint (video bitstream output at YOUT[0-7] parallel bus)
-
-Required Endpoint Properties for parallel synchronization on output port:
-=========================================================================
-
-- hsync-active:		Active state of the HSYNC signal. Must be <1> (HIGH).
-- vsync-active:		Active state of the VSYNC signal. Must be <1> (HIGH).
-- field-even-active:	Field signal level during the even field data
-			transmission. Must be <0>.
-
-Note: Do not specify any of these properties if you want to use the embedded
-      BT.656 synchronization.
-
-Optional Connector Properties:
-==============================
-
-- sdtv-standards: Set the possible signals to which the hardware tries to lock
-                  instead of using the autodetection mechanism. Please look at
-                  [1] for more information.
-
-[1] Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml.
-
-Example - three input sources:
-#include <dt-bindings/display/sdtv-standards.h>
-
-comp_connector_0 {
-	compatible = "composite-video-connector";
-	label = "Composite0";
-	sdtv-standards = <SDTV_STD_PAL_M>; /* limit to pal-m signals */
-
-	port {
-		composite0_to_tvp5150: endpoint {
-			remote-endpoint = <&tvp5150_to_composite0>;
-		};
-	};
-};
-
-comp_connector_1 {
-	compatible = "composite-video-connector";
-	label = "Composite1";
-	sdtv-standards = <SDTV_STD_NTSC_M>; /* limit to ntsc-m signals */
-
-	port {
-		composite1_to_tvp5150: endpoint {
-			remote-endpoint = <&tvp5150_to_composite1>;
-		};
-	};
-};
-
-svideo_connector {
-	compatible = "svideo-connector";
-	label = "S-Video";
-
-	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		svideo_luma_to_tvp5150: endpoint@0 {
-			reg = <0>;
-			remote-endpoint = <&tvp5150_to_svideo_luma>;
-		};
-
-		svideo_chroma_to_tvp5150: endpoint@1 {
-			reg = <1>;
-			remote-endpoint = <&tvp5150_to_svideo_chroma>;
-		};
-	};
-};
-
-&i2c2 {
-	tvp5150@5c {
-		compatible = "ti,tvp5150";
-		reg = <0x5c>;
-		pdn-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
-		reset-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-
-			tvp5150_to_composite0: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&composite0_to_tvp5150>;
-			};
-
-			tvp5150_to_svideo_luma: endpoint@1 {
-				reg = <1>;
-				remote-endpoint = <&svideo_luma_to_tvp5150>;
-			};
-		};
-
-		port@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-
-			tvp5150_to_composite1: endpoint@0 {
-				reg = <0>;
-                                remote-endpoint = <&composite1_to_tvp5150>;
-			};
-
-			tvp5150_to_svideo_chroma: endpoint@1 {
-				reg = <1>;
-				remote-endpoint = <&svideo_chroma_to_tvp5150>;
-			};
-		};
-
-		port@2 {
-			reg = <2>;
-
-			tvp5150_1: endpoint {
-				remote-endpoint = <&ccdc_ep>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.yaml b/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.yaml
new file mode 100644
index 0000000000000..4869ba7ca0763
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ti,tvp5150.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TVP5150 and TVP5151 video decoders
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The TVP5150 and TVP5151 are video decoders that convert baseband NTSC and PAL
+  (and also SECAM in the TVP5151 case) video signals to either 8-bit 4:2:2 YUV
+  with discrete syncs or 8-bit ITU-R BT.656 with embedded syncs output formats.
+
+properties:
+  compatible:
+    const: ti,tvp5150
+
+  reg:
+    maxItems: 1
+
+  pdn-gpios:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  port@0:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      sink port node, AIP1A
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+  port@1:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      sink port node, AIP1B
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+  port@2:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      source port node, Y-OUT
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - port@2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/display/sdtv-standards.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@5c {
+            compatible = "ti,tvp5150";
+            reg = <0x5c>;
+            pdn-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                     remote-endpoint = <&composite0_to_tvp5150>;
+                };
+
+                endpoint@1 {
+                   reg = <1>;
+                   remote-endpoint = <&svideo_luma_to_tvp5150>;
+                };
+            };
+
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&composite1_to_tvp5150>;
+                };
+
+                endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&svideo_chroma_to_tvp5150>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+
+                endpoint {
+                    remote-endpoint = <&ccdc_ep>;
+                };
+            };
+        };
+    };
-- 
2.34.1


