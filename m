Return-Path: <linux-media+bounces-30199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7483FA88D8F
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 23:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A614918988E6
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 21:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47551EDA04;
	Mon, 14 Apr 2025 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wp6sB3Yz"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFD119D06A;
	Mon, 14 Apr 2025 21:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744664863; cv=fail; b=JmMbldtFcEtMZIbQeFDAqez4vU2wFvm+YiY9Ur+zS8QGwQ/ZBpA0+s61GfVCb93MWmF01pmLZv/qRvlPW2xUW2buVsIBSnfv6HOFiVaCiwQLCX2Ky0G33MvKgjfteTJg5ftkpry8QHbNqNdZmCewuW7WVTAooGKEjqBU/aOrfng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744664863; c=relaxed/simple;
	bh=ex5s94XGz5h+LB+5hdZpXTrajrFJFB3c5jcAQhVMiS0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VoKA1Z92aXX2GfW5MnG7+mSEw2iF3Nc+5XwelbrdiPnZiSc+lCCeHKEeHOMPKRUD88WY+2wyWksp9MN+MtmebDr1j3UbJtV/whwOeBd3kxEC3Arunv2690olCOrciQz0ZC1+2gvp8+2Z2bSLkvDI2vlwZ8iUulA7jjUJ8PNnSEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wp6sB3Yz; arc=fail smtp.client-ip=40.107.22.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yc1Jbb4O9mRpStgydKJYXwEQxzEuFw2DQ1in1E9ZJXZwDe2SxNjheJabBGKYPy5XMmBsyCedsiLrRwu2MJjmS7TEels3wIatgVCP5HFAk/xtDz2Qrwe4TGPUZmDPbBfzcZ73wgFuNuQLrU68699pyDbOFns2lJ0JuY8dXBWKty9QbzffePHv1ypWf/Dh+4ItbnCckklcUcXbS5kHMwDc6FX48EZ4ltrBExrfWZVYNV8cMgAAKiUvkNlFtAa9jHvG5DPXa+al1gsiHKdA3jDgQibWcO5MCqOa+hKHOfEqAWhViSm/ZsDZ4W+RiTOO6+syEYaj6ktyI/GgWQZ+aVf+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mne82N7Mesq9/UUHJtdWqeS07/Vs5JeUXiKEr1uaUc4=;
 b=pvHemS+LfjgnguLZHBAWzFuyzUsCq7k39Sj4Xx8S2jumc3Kn3+5aBEQsF8pOuuzlSJyBfXAA1/VvV567iI8O6+rHjrYw5L/jDoV5xrnXFNcs3+XKI7QTkpjwOUgs9MDCW+qoF3Rzda79Ud010YmS709rBAgaQpCRblExeVeZ1UzNi4NGa1yIHYRMP9ktFC4bv6M0TH7j4Ar4v2zHQ5ikD7vQwXXJmeOGhQkhPWp4/yaLbYkfkVjfdABW4LdUy8lBjxLsFDn1rAnwpGOIfR+xi31x+pPLybgXt9idAVW811OD5ZNGe9RHTV5Y+21obf0dcznTIDr1yTym0fgtvABjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mne82N7Mesq9/UUHJtdWqeS07/Vs5JeUXiKEr1uaUc4=;
 b=Wp6sB3Yz5Eya4qtZhZvftgstK7abTJGMTOrdMVFbAsPuChnKvDScRTPzWsvUYG0mh0ic8kI3jnnfOykBl+PwEL8TzVAQl3KMrTdS/gEjt8fE4BjPjYjEXBBUt7W8je9WichJzHPXu9NUaEnSJKjaqQR4UOOuJfudDFG4J+WTLkdzChpbcqrE+awSgX3yTtNwIsR2gZJEWFvbQttTwBySLHkuxVPgLBADpnvwa26VQPJUqNpEWL20mbyLgNJy1mTfLOkfYoOJ+XTsFJ+hjg++JRCpzjZDqqz+OzdLWTW1zG8Epp48sG1E3GOkIATIVVg66o/+iVC3pUNGlbdN/TcTYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9206.eurprd04.prod.outlook.com (2603:10a6:20b:44d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 21:07:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 21:07:36 +0000
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
Subject: [PATCH 1/1] dt-bindings: media: convert imx.txt to yaml format
Date: Mon, 14 Apr 2025 17:07:18 -0400
Message-Id: <20250414210720.3359301-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0054.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9206:EE_
X-MS-Office365-Filtering-Correlation-Id: dd89c066-e73f-408d-c59a-08dd7b9861e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?10dJXbk8YFN0mZSAh5nvDb8iwO9mwqC+KaO20ANVw+83mx9ZdLyCaMSOYlCb?=
 =?us-ascii?Q?0N01bj/f8e8P0aA7+gokWxV+s+RqoDH+BH4p8tOxlIDW9/aEtLveYQ6SeJ67?=
 =?us-ascii?Q?vAHYDYcyyod5FcULeqOmgPuNuUolthcsOou753k+3v3S88S6+5QHDNuDWEgz?=
 =?us-ascii?Q?HJVEf3r77PKHJ+96pEFs5S63plxXo8TgJWlF2CUF5wI4vO0fjVvdu6aO+vL2?=
 =?us-ascii?Q?i7gD87OQrE59xbEVa5YE66bP7uKMYHlgyZJZnYPjVdrqdNZ/7Ad8lEQw19aM?=
 =?us-ascii?Q?izeRklfp+MmkE75JDp/H0UbKPhof/XjRQNGsDcgoM+PGodu/2ut8oeR5iHJJ?=
 =?us-ascii?Q?+Vllw5GnZp3MsjyE80ktI/Lgpov1+neaxhIDxEd7rteFLhoUcBei7nrdaOvu?=
 =?us-ascii?Q?rd7Mve3yYd4JGM5wa8sAHVPzVXcRma9GJBh320T7czCRXhiCJlosunP4bXOH?=
 =?us-ascii?Q?Vnl89phAwM3W4hjnivpR+AiL9dVdkCQG9Uc/y8ey1i8JCzlA1rQx/e/HfdYK?=
 =?us-ascii?Q?UnxGyzrjAaqsm+ZFCCA8oF74vu4F4l3SOCG39xGvEUKUK/DUoiIpP4Fulrtj?=
 =?us-ascii?Q?efVsMMlM/YEgt18ig/VdIvlt8ZUt/3gr+twRmWDRhCx73A4Dv/x9rrKTRA5m?=
 =?us-ascii?Q?kqpb69zlwtLl5sHKqkrKmAW9AYvswRHbCvgwVBZ85M4G60oqSzWkoGvoowRV?=
 =?us-ascii?Q?xiPs5SPRwsXDKoivF0CGx34DOVkL+LLhWOc7PA+4OG7TJ25MzdIwHkU4Na5w?=
 =?us-ascii?Q?eVZGBRKPmttS3AgHnVeWX1I6Ac70+k9xVuzEJPqIyK8kmLWm5dDz9WH/5v7W?=
 =?us-ascii?Q?vlxiyl00PiQI2FLBrNjiH6rIXu9A0y0aR3SmJwKQxKtzxZwCewjdNIVm+MHQ?=
 =?us-ascii?Q?L4gFzsyrlAm4YsRG7g47vMfJYnrW2A+CJjfUuMqq6pAd/mBSyg94ubyrIbZ2?=
 =?us-ascii?Q?4mbRUFnZU/Pt9ahWNsX/iZOnG7hR0byghiGhJUM+22EdwesiEczGeGIsQVhW?=
 =?us-ascii?Q?CqjGyEJhkssdp3HMLz0zM+BYNWHjVMHPY1kMM3Cx7cNQFBE+NKn/Zk44vJk4?=
 =?us-ascii?Q?13fdRBCrb7h39I+is8gt+ldMaNhdg31p4iulFMaRGOZMCeRkQiJ+CFIc/ezp?=
 =?us-ascii?Q?Qa3YdikWuf5X1WZ0b4lHwS/fpLKexSySROFUzZl2U5iY0tj9jVihAtUIavyQ?=
 =?us-ascii?Q?J+XzxGdsLvGOE4ibfb01bqV55rMnp1UTlmvXvBlpk82vqT9QvvGquWldMfUB?=
 =?us-ascii?Q?tpSShQXc3MNX7SX3t1y1a1dNHYptzCjiKwRu34xZMU8AYU6t2q8zJEIxHN9W?=
 =?us-ascii?Q?ddQ4TgIXlD1XkAVR5HeMZD8qyxLRarIuRxyHMzoIr55Ttkzl9pkR0Pl1WO+8?=
 =?us-ascii?Q?3AeuNASOd8T4BnKGtGn55Ne+rfWSGA28C9jegsYJHrnWDdvrNFMD7BaDLqR9?=
 =?us-ascii?Q?sDxpzNkrPITs5hoj6B2eSCawwZFCkhUC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qmcu/8VcJFPJ1Gp1pJyi6IpqRs/7E8saDr57D4EAkRu116vLneBhmR1A1vhS?=
 =?us-ascii?Q?2wFSM5ZkyYfp3xzFBQYCK4ZEriRnJMvfqrWteVheL0wVoBt+ybA0KrEeKi3V?=
 =?us-ascii?Q?SYpRX7wwXG3XYKAqXwU8AIaT+4nFuKwYbPeZQAaBxOaduugKdHEcLfU7noXc?=
 =?us-ascii?Q?4LEFI+/cApx6T+qIoMBLTjkLUKC3yX70Zq6HL1iNay4Yj6HNTtvHdNp2ysti?=
 =?us-ascii?Q?DLta2mo9lbtVN/7a2LAE5JlJ5Cu7ZhUedg+jmM5AQ0DNn/jpddDZnpe1s7V2?=
 =?us-ascii?Q?PqYC2IJi668qF73VgNIKlBxM0WOC5i88a6bwNRp/+5wn+mBw2X7NWb6qzxCD?=
 =?us-ascii?Q?vNaD37Y4Vyo0+PL6Mnlr00h0ZHeUhF4ZFlGs+rx7j9KGZumSOMC/SWRcbshq?=
 =?us-ascii?Q?K3USeMaGqJ6YfXT04MuiFJC475gSCsEPYOvUdWSLzncv4haAqBrD/9kN+fPw?=
 =?us-ascii?Q?RicF+Bl/mDofLr74+427hgbwVa36n9MIcUZbWynI6B3TM6vXwXc7WZELgh9p?=
 =?us-ascii?Q?wjphxQx2ITjhmdM/EVVsq64zawyyfFVhIn6MK74MWSYaU1GtC/KLwhLg6SDc?=
 =?us-ascii?Q?NjGSuGlFuv/oO2XTZWZI6mmA0y7wU6TLoTQzawDvYwPUyHR7L53XwDB7XcdV?=
 =?us-ascii?Q?ENSV8K8qUdLJwpiBpsriN8ylXmEDJrplSc2qzOYjjv4oE3zmsP+gb9VjZTz2?=
 =?us-ascii?Q?6kVV7K4C1Ag2/zWBjW5KSCN6LzFn4UZ1DYalqt4EYcmDW3sODIMA8FnJ8fvL?=
 =?us-ascii?Q?925FOffrOo9gy3/mOeHw7CiMiQkUkL7giYaS1kdNSMfSN1Xz8wPD5cF16Dz1?=
 =?us-ascii?Q?jhrcUEGqY2/H7T1DHFHR+TumRQwSuXObCDjIJZXhn1G90ljb0prrF/7sL06x?=
 =?us-ascii?Q?EqDUq/+6uxYnudNJcMxLULXFGgIEkUd1DsYWO4ESNeehnedDT7oz0U4J4ePo?=
 =?us-ascii?Q?niWwGhWXwsi0pqta7y9UygwMhhuuPnP8/tGAKNeHfeE1Nwk6B8YTQ66E+25c?=
 =?us-ascii?Q?zrNEhjtquYBg0tfruYXso31vghTxnJwNViwWwwXoCi3KtkPDyy4LTGhOHgEp?=
 =?us-ascii?Q?HwFlI+fitnfHtvQrxuz5unFl9PjwM81dCoX3KXVzpBO7S67a1zCW6LA0fIPJ?=
 =?us-ascii?Q?EQ2uyqcmp4/dovga0Mo9jAnsugsh8aAG0+C2ewfaqy/i9nJQGCRXV0/OrAry?=
 =?us-ascii?Q?1+KKMGYczohgQKtRSAhkk0SNCsBW4vYGaT1nIl9uG7NFpohvRbj9ZlbAZFHv?=
 =?us-ascii?Q?LZxid8w6FOa9blrhCqFR6EdibV5S/jPEIs4EnMJghfB9poKcBtJ3h5uq/akA?=
 =?us-ascii?Q?6SLWMkkcGEf0EH2g6ln9Lii1xcgH4/dXANh+8Ymd/sKieeceNJUuKURgohcq?=
 =?us-ascii?Q?jKQAka6pz8LAQ7JM6pX1RwtWZDrmBFjipRPO8XTKCiYwH2Sib/7TvbHQ9wv9?=
 =?us-ascii?Q?rQvD7T7v/lXVfK8okESFqZqK8YsajWXYpg7BbuBMZz+JJpwgP1xK7865Ku93?=
 =?us-ascii?Q?abNPH1CkrxUNcM5HtjqahbOPS8K2B7pBLSRP6HgPozIE+9Q4i1n31PNbYd1R?=
 =?us-ascii?Q?tHwiM20PaEX2w+fvvDk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd89c066-e73f-408d-c59a-08dd7b9861e1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 21:07:36.7045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fT7qRl5SV1X4IdWs1VQJvBrmXkXLRDIwxeRRBxOOWEgIZK7tyN8URMLo/uM7L8u0WXdF5OxCYdeb31vOgRyEeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9206

Convert binding doc imx.txt to yaml format. Create two yaml files:
fsl,imx6-mipi-csi2.yaml and fsl,imx-capture-subsystem.yaml.

Additional changes:
- add example for fsl,imx6-mipi-csi2

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../media/fsl,imx-capture-subsystem.yaml      |  38 ++++++
 .../bindings/media/fsl,imx6-mipi-csi2.yaml    | 126 ++++++++++++++++++
 .../devicetree/bindings/media/imx.txt         |  53 --------
 3 files changed, 164 insertions(+), 53 deletions(-)
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
index 0000000000000..1e69a1ff868cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
@@ -0,0 +1,126 @@
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
+    maxItems: 2
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
+  '^port@[1-4]':
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
-- 
2.34.1


