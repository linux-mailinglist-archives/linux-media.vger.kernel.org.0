Return-Path: <linux-media+bounces-30369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BF5A907F8
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 17:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFEC7189C893
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 15:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8575B20F087;
	Wed, 16 Apr 2025 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VowOriex"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7606A20DD42;
	Wed, 16 Apr 2025 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818469; cv=fail; b=av0JIBoKgTOMTsVGa3cGSHZKawHcY9y77FJmwxr6+NzhX5sTtFKXUnKfU9aUZv8XXduqZFc3uiBIZBpfAnN0AF7o9W0yPmO7sPubcDG3X521HfcHWm0gUu5S/DIreCiHUwBH1Bg7jtXYph4/ShHoNz+mOOVZPh4da0REUunlYn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818469; c=relaxed/simple;
	bh=SEhOweQKQTAmuWzm/FdZdgVoW5V4ahfxFsEtU+q/IFw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fM+R+nJVT15l/Httqe+jHUJjSunc6JLk2WOtDtE/BuPDqFOy5n8mvCaugxgBziLzYSZsxIPiuSxTJujEmcyaBV95UHxzEqr/2FJVGa7h9NcbbhOlB+pjJUbikO0d19v/XsRE1qZlvrznFlawnwzAVuZLxT2fk5bOYh0qgqFwdnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VowOriex; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0eWTimPtvjE/7LJh8eOp+bSk3jz5lZs01on4Iwkw5Icu9yWbtLR6GyCJu4Lvk0LCQtYf7FiMtf7Vn7hNMhNHTDsK1xo6tz30QhKEIZiCsoN6SaOu+dAssJcIxsRZAEGgCDG72TVo2MjY1EnQ4G6Fohb8tkU/2lKakrNpvnSOJ0PGKC91mxarhD2UBDP/vgHQW8PkNpIwrUSGWDRSALlydXvBYv9BO6XqNZpsOHCAcY3G3Oe6EsdKSO0bU9wHJBn1pQcF/I1W3ssFt1SVbHE5KXCjE9DRGoyje0YfbUXJLC9aTVwUmbv4vODnP6T1KPSQh7wGIfoawffxeu8Egpjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IgT5vka1RF0inUZLlyjVbWp1JoB/V/Vgbfipk8HtDU=;
 b=EASiUdPqa/9W5suWLRaTnYAIgATVkHMRK/eMt2KJRDofVcses2VtIZTym2CZLNyOdM0B1kIRanLRKOXJXf3pq/c/HbsxPwvP+9l3wHGBiWH/nCptu7JudR4+Ngl2xdXAmKfZq1n6l8uxuLZgn/CxM/eGaQqqnqUj1ZON6OQ/G4oKvzSe1tbM5OCGp8tHAJJg1Km78HwRV1Y4hfrAMk7PNzfVNFQ28vaxpoCDH3xWZUQNzi0QMqEpDfhOpiLOaMhnX9eToGJhxXUkHTI8neFOz+Hy4IEJ/xwWD6vGL7NH8wEtGlICb9gP00TUTOrjhTihTTHsZMEYWaT3A9Mwm+Cblw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IgT5vka1RF0inUZLlyjVbWp1JoB/V/Vgbfipk8HtDU=;
 b=VowOriexP0XAkjMgsky9/CzqrhJ3BaMKjsbnXO+RPHa9NLOVZBU5uFOqM9tPIqz+t+RVw5GJlPErBT1WATjCGlcsMYYu0yQ82y3Z1kcvzplehZjBDVH9ImqblAY2EJoVdvJZgOfIWqGb9qEKjthOko/s9LNG0LkFfXtQd3n+QdjUG/tRWUF47J/IQ4TVhL4/zIBABgVNxv/znJj6DfBrSS9fSJgg9CU24aJn+ArONaJxWa/2w8tlfyq6SU8L8AOpeT8eTOUwtzoKZVY+z6GQiT6VzBTW6lA/oYIO35tft0fVtWC1+iozeb6Imw3WsLT/aqh8a5dNagcCkw1/sfICQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6875.eurprd04.prod.outlook.com (2603:10a6:10:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 15:47:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 15:47:42 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: media: convert imx.txt to yaml format
Date: Wed, 16 Apr 2025 11:47:27 -0400
Message-Id: <20250416154729.3424617-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0029.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: da16f868-3efd-4bf5-f834-08dd7cfe0631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|13003099007|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KcNErywhCMKXOWW5tzb+VSjEsJqErhSHIRVfDJnPUS44BPJWF8FVXCM+boq+?=
 =?us-ascii?Q?+2CE4AIPSJCQDLxLUD4ZQ5DBWV58x0QN+VpMB4+bQ3L0J+8TCNZEhXL7UGQb?=
 =?us-ascii?Q?Fe5lO7T7D3F+8/nuvrVSZYBi1g9/baFkBXJMMTlZlN3YoDGG8p4q/7oGtS8C?=
 =?us-ascii?Q?HgVri/Kq11xeji5msCpZMaS/bFaIZaRGzipGc/Xf04FABHIqwbcRDzifbb4J?=
 =?us-ascii?Q?EOyoxb4zcz/KU/5Pk+s10saVcCtwi4AlnN3AQkABC7UANJ0itXBVWnxorTTt?=
 =?us-ascii?Q?rKOb+6cVtEMwALSkzTqtdXPLr3mXeNHme7/mUu0sg9aB7KMFQkIEGbEdkaDL?=
 =?us-ascii?Q?jl8dTF+xtPBHD1Im03u398IyaYoiRMZJ9FAkYT5Dlua6GD5VKEWapPXrLITb?=
 =?us-ascii?Q?a6YXfvRLilXHmK7oPxgBvZuy9py7G1AIJdzS/che674+cA6nKMmg/+AFcDWR?=
 =?us-ascii?Q?t3c5vYTtp5J8OOeOEnNtpxXNzHJLap0utWxKmh7NunfgwEyYTsZfylmTQWQW?=
 =?us-ascii?Q?Jluub/2HSQy00BN5eheBz5IAzjjJ525xCVDcN+CG+kqWILOZH+f+9OMgppzd?=
 =?us-ascii?Q?AQmwVDNMT7pj8TLKnXt1tXAIHAZ/pbn3Sc/og6h8Eo58r0LHMTCgnTW5Cw3e?=
 =?us-ascii?Q?+V4xsF+QiZniyEfAkno8uWX9bBTuFPbBqB20ASlmspzKrVcvyZlt6kS9SEuq?=
 =?us-ascii?Q?Kt06sOAMOB8dXM+xwU14Nh5L0lygiAp40kgbXnWPdTBc8eu45EtfgwQ6AsDV?=
 =?us-ascii?Q?XJLebTwprnq3HpdVodA/5YmZ7IHNtNDmXRxHcZ61NgnquVnk1Bni2kzi8Ib4?=
 =?us-ascii?Q?fOIAmZHGGR/H0AjxZXzesVL7gUBqSp0RP5Fghmjp/1sG51wVuumQTbNm7xBG?=
 =?us-ascii?Q?lwgoApNuqKYD0TSL7seF0QQMvE0t5A57lH21G6M0MrWIZ1qseWTXChK58R5x?=
 =?us-ascii?Q?sXWVFqm9KfdiAQjsp31LipxgFZ3cAqrX7mtcxAX9hBj416oRTwFrk7VsItRE?=
 =?us-ascii?Q?EjNgaYSSOLv5D+UC0cDQ0sbWFQjQrcDVWA1o/pOe6wYXD8FLkTaPTk+Hpd6b?=
 =?us-ascii?Q?vCJhelzYE6YGccDtdyeti6riig9qq4kRxOIAkVXIO2rr/xm60xhv39dYoqgA?=
 =?us-ascii?Q?W5f3XIuqrwtyEQIq+/W993RzedvIxsVtAXCvk/KMltrSEx6N7b95Bi6E6NIF?=
 =?us-ascii?Q?Zrswea7MdDBrn7oxyHqmCpKiP/Z4IvI86YEz7MuSnOx0srhdnHXOJ7Pcw6VJ?=
 =?us-ascii?Q?tXCaeWq+ges7P/s25ntxLJc+a4wyeYTKrZYeSUZPvX77RJV3z4hBEpZi/2nZ?=
 =?us-ascii?Q?8s69xCn7ThoCZvGaj0vFXq0JGz6s6YBy5iUJy60bp5ZED8Ub9AndpnzyW/pQ?=
 =?us-ascii?Q?DsS9DVYPdWwmH8c0v4VlHkd7eLpXfNMSQQEeOAudjZnTfFdZPLaGYAUFiWnC?=
 =?us-ascii?Q?Iqgj2T2eH4bW3V5dSxwx5KwgV3kN7rP8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(13003099007)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mg0BmK9k/mPxpvi5GbXEjQ5QzUirIiAX9eXBle/WTn/qqc/RwBop+UJkHP91?=
 =?us-ascii?Q?d6i/DwGH12/houUr7QQOn6xe0zMfpxlULa7RPcgseJVqfkleVScvOMXZ0uaD?=
 =?us-ascii?Q?TmcRtel7VPxM1fQf1xjAlSxTflxRVKLO4ly2ip+zl004PGxUT0OBLhEWaZcH?=
 =?us-ascii?Q?xw2NG2vgR4Gv+FLbdgcb1syXDFD/sPk5DyNZpeGJiDoawxbuP/X+JBPGqnzK?=
 =?us-ascii?Q?bR6vaRymtNw80UtzVsxxLZEos7FAZaWD15PmZyTx+22Ion+tnIqDFKkTl9Nm?=
 =?us-ascii?Q?NiHIOpQCqBiQOnA53MzIiWtP+rcjzPpx+Lt+bJkBENyq/YWSv1mpxIifwRpW?=
 =?us-ascii?Q?pyXv0ILaf18LJ/rvYlKJjcGD85tt4UG+5Z3SNllE4Hfj+x2Ksh17qb9SMk+S?=
 =?us-ascii?Q?pixW6lCcMIfjmSLGBnc1EHxLowDuIu2wCvmduJLq98t4S2JRnX+oB6i9OI4w?=
 =?us-ascii?Q?OdpaCH1geeh7swMsg1sP3sTcXJ6yjRSJgeOod7DTSA9WUxVKDAozzwS3JFM0?=
 =?us-ascii?Q?zkXhYwl7Cj+/9Ox54fMpwTdcivwVo+JbD1aNGTptEsvxHir9W52+LYiDoIks?=
 =?us-ascii?Q?/uMd1Q0fzL4+wZLS0TcTV6oLLf9ajkCs4IyUDgMt87l4Wtf2GZTNI3HUXdg+?=
 =?us-ascii?Q?9FM1OuLF/PfhfLhA0gb7DPFZhbQsLWqRkLu5ekoPjHTSZyQBtGz9YbFX2xFh?=
 =?us-ascii?Q?JTh+AKxD52eTzIFJBr2nLK7j7hv1zQmld5RikOb/CMLN7H+sKAVnc1LXpXRC?=
 =?us-ascii?Q?SY8FrulO36FchnfIwZcmHxg/splrQ1AlPUDA0CtwCN9CMQYih2JM66hjB7bS?=
 =?us-ascii?Q?jfavf1QdV91dCTWNpZlMN0KERja/zHyiA8w8mfVaBBZJrM4LaeXG0NNgUPjl?=
 =?us-ascii?Q?SjZbCwg1PIzmXB2a4DGgsdfUm2YMdcTADo0/59UiXAY6WwUaNMgu7LQWD2GH?=
 =?us-ascii?Q?QS1Z/VE1dqjzpNcKOARgt8J+HkPUe0+5MMPW5snZo66WeRlGLY+GMa3vDGsy?=
 =?us-ascii?Q?opFIYZ4vxVTnfBSJiSoR7PM24bLBCspGQGmZviFOG73qfDwfIAZbko+UNQ7q?=
 =?us-ascii?Q?TPfcNSCXgSzHSxYKZlWcg4v/aVQmS2KFEBI6YQaFdoxledG/Biq7t/fzjYdI?=
 =?us-ascii?Q?H5ltNcqbLTzeoImkQKpClxtniU0xkCVbhw1YIkBng6yZPRZsFWyO5VcX9IhX?=
 =?us-ascii?Q?yiZp85ioRMuCC2aGAQaFBBe41WMgHVJT0Q6IREWLPuBkPnRS8/zxjh7JvptB?=
 =?us-ascii?Q?+t7G5QvL/4rH9s01zrd6e9JYhL204aUpXFxD8TzdXdKxIGDB86iJB0yFhsst?=
 =?us-ascii?Q?ZBUNjZUoQwcndMtCvlrKTNa2SgstYQqS7tjinHvZtqXPoMQj2IjTLH8NY6LJ?=
 =?us-ascii?Q?7hCBmJd3HFA7Gug1+UqbX309e2bT7bCea6mjb7evWca3IWHZVcV2FJ2ajs2X?=
 =?us-ascii?Q?oj3jdBtr+BlDvNHE7W0nWEQv+rhX7bSC/LegNHXrFBw0hrxkQai5oDEDjIwR?=
 =?us-ascii?Q?p3gAlNi1k5u2bKo/ADhZvkFQAAtar1IDt/MWqla/S353kRTV587UPNp1nyn2?=
 =?us-ascii?Q?QMWymvxHOIrcdERtnxlly4JnefLw2L1av/KgxeL8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da16f868-3efd-4bf5-f834-08dd7cfe0631
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 15:47:42.7258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27gdYfodRU1g7d96XzMgSBlsYLyJwdhMZBmli3mN18GB/FrqhEAQtrAb23O9A2FFMOA/Qg96plfWDy5MQ4NGxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6875

Convert binding doc imx.txt to yaml format. Create two yaml files:
fsl,imx6-mipi-csi2.yaml and fsl,imx-capture-subsystem.yaml.

Additional changes:
- add example for fsl,imx6-mipi-csi2
- add irq err1 and err2 description
- update MAINTAINERS

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- add irq err1 and err2 description
- ^port@[1-4] to ^port@[1-4]$
- add port1 in example files
- update MAINTAINERS files
---
 .../media/fsl,imx-capture-subsystem.yaml      |  38 +++++
 .../bindings/media/fsl,imx6-mipi-csi2.yaml    | 144 ++++++++++++++++++
 .../devicetree/bindings/media/imx.txt         |  53 -------
 MAINTAINERS                                   |   2 +-
 4 files changed, 183 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/imx.txt

diff --git a/Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml b/Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
new file mode 100644
index 0000000000000..77be3c1f37c5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx-capture-subsystem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX Media Video Device
+
+description:
+  This is the media controller node for video capture support. It is a
+  virtual device that lists the camera serial interface nodes that the
+  media device will control
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx-capture-subsystem
+
+  ports:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Should contain a list of phandles pointing to camera
+      sensor interface ports of IPU devices.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    capture-subsystem {
+        compatible = "fsl,imx-capture-subsystem";
+        ports = <&ipu1_csi0>, <&ipu1_csi1>;
+    };
+
diff --git a/Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
new file mode 100644
index 0000000000000..e2f3a07c0737d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx6-mipi-csi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPI CSI-2 Receiver core in the i.MX SoC
+
+description:
+  This is the device node for the MIPI CSI-2 Receiver core in the i.MX
+  SoC. This is a Synopsys Designware MIPI CSI-2 host controller core
+  combined with a D-PHY core mixed into the same register block. In
+  addition this device consists of an i.MX-specific "CSI2IPU gasket"
+  glue logic, also controlled from the same register block. The CSI2IPU
+  gasket demultiplexes the four virtual channel streams from the host
+  controller's 32-bit output image bus onto four 16-bit parallel busses
+  to the i.MX IPU CSIs.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx6-mipi-csi2
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: hsi_tx (the D-PHY clock)
+      - description: video_27m (D-PHY PLL reference clock)
+      - description: eim_podf;
+
+  clock-names:
+    items:
+      - const: dphy
+      - const: ref
+      - const: pix
+
+  interrupts:
+    items:
+      - description: CSI-2 ERR1 irq
+      - description: CSI-2 ERR2 irq
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
+      Input port node, single endpoint describing the CSI-2 transmitter.
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          clock-lanes:
+            const: 0
+
+          data-lanes:
+            minItems: 1
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+        required:
+          - data-lanes
+
+patternProperties:
+  '^port@[1-4]$':
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      ports 1 through 4 are output ports connecting with parallel bus sink
+      endpoint nodes and correspond to the four MIPI CSI-2 virtual channel
+      outputs.
+
+    properties:
+      endpoint@0:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+      endpoint@1:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+
+    mipi@21dc000 {
+        compatible = "fsl,imx6-mipi-csi2";
+        reg = <0x021dc000 0x4000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&clks IMX6QDL_CLK_HSI_TX>,
+                 <&clks IMX6QDL_CLK_VIDEO_27M>,
+                 <&clks IMX6QDL_CLK_EIM_PODF>;
+        clock-names = "dphy", "ref", "pix";
+
+        port@0 {
+            reg = <0>;
+
+            endpoint {
+                remote-endpoint = <&ov5640_to_mipi_csi2>;
+                clock-lanes = <0>;
+                data-lanes = <1 2>;
+            };
+        };
+
+        port@1 {
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&ipu1_csi0_mux_from_mipi_vc0>;
+            };
+
+            endpoint@1 {
+                reg = <1>;
+                remote-endpoint = <&ipu1_csi1_mux_from_mipi_vc0>;
+            };
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/media/imx.txt b/Documentation/devicetree/bindings/media/imx.txt
deleted file mode 100644
index 77f4b0a7fd2b0..0000000000000
--- a/Documentation/devicetree/bindings/media/imx.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-Freescale i.MX Media Video Device
-=================================
-
-Video Media Controller node
----------------------------
-
-This is the media controller node for video capture support. It is a
-virtual device that lists the camera serial interface nodes that the
-media device will control.
-
-Required properties:
-- compatible : "fsl,imx-capture-subsystem";
-- ports      : Should contain a list of phandles pointing to camera
-		sensor interface ports of IPU devices
-
-example:
-
-capture-subsystem {
-	compatible = "fsl,imx-capture-subsystem";
-	ports = <&ipu1_csi0>, <&ipu1_csi1>;
-};
-
-
-mipi_csi2 node
---------------
-
-This is the device node for the MIPI CSI-2 Receiver core in the i.MX
-SoC. This is a Synopsys Designware MIPI CSI-2 host controller core
-combined with a D-PHY core mixed into the same register block. In
-addition this device consists of an i.MX-specific "CSI2IPU gasket"
-glue logic, also controlled from the same register block. The CSI2IPU
-gasket demultiplexes the four virtual channel streams from the host
-controller's 32-bit output image bus onto four 16-bit parallel busses
-to the i.MX IPU CSIs.
-
-Required properties:
-- compatible	: "fsl,imx6-mipi-csi2";
-- reg           : physical base address and length of the register set;
-- clocks	: the MIPI CSI-2 receiver requires three clocks: hsi_tx
-		  (the D-PHY clock), video_27m (D-PHY PLL reference
-		  clock), and eim_podf;
-- clock-names	: must contain "dphy", "ref", "pix";
-- port@*        : five port nodes must exist, containing endpoints
-		  connecting to the source and sink devices according to
-		  of_graph bindings. The first port is an input port,
-		  connecting with a MIPI CSI-2 source, and ports 1
-		  through 4 are output ports connecting with parallel
-		  bus sink endpoint nodes and correspond to the four
-		  MIPI CSI-2 virtual channel outputs.
-
-Optional properties:
-- interrupts	: must contain two level-triggered interrupts,
-		  in order: 100 and 101;
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b8270495018..65e0716554203 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14775,7 +14775,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	Documentation/admin-guide/media/imx.rst
-F:	Documentation/devicetree/bindings/media/imx.txt
+F:	Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
 F:	drivers/staging/media/imx/
 F:	include/linux/imx-media.h
 F:	include/media/imx.h
-- 
2.34.1


