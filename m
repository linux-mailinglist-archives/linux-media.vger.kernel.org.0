Return-Path: <linux-media+bounces-44611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C8BDF792
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 17:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8761E4F7AEB
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 15:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF63335BB9;
	Wed, 15 Oct 2025 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ON3TSYLQ"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013019.outbound.protection.outlook.com [52.101.72.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D995526561D;
	Wed, 15 Oct 2025 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760543326; cv=fail; b=qONmTKJdoQqK53656MXy+3UY4fCMHpkHCE1zsROcBVe8gL9dBLQTpU4EW0Q8rkBCvYPy7+g/Zka8YTrQZuzwoBOArfP6kFERABQqiDtRNrJALXvpz5asL3Q1M0bYRAsbX6okCCeoF+UiVgXcuDRMb371L4bLUkU+lQxlTyzwTeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760543326; c=relaxed/simple;
	bh=80bPDAB2YKGGj73XgT7+c+i+s9Yk08s6k3tOrcPHwH8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=C5Yb/87nLmpwSnVTqkgIOPXhsroinPPwt3SQHuAQg+LBM7e+LtOsORo5eF21WJVahbQ76dEpRgDZEeiEOH5uXUrnuwtwQhWC1nswUPgQ0GB87lMQHXMmbq0G7TO6cXFG41/loDih6qUfl86Jpdb9yR+pxVQsEQ0ebT7MXed0wp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ON3TSYLQ; arc=fail smtp.client-ip=52.101.72.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsqkfKtczUYHwUMbS1veO14vq4REDfbV6hHxRwnkGwN4/xyAHjh5lnHL+8nzYvJSFW6mfyKSLgzh3YWo49UTetW/HYSB79T+73/POKF2osJwwvFHIDyDPrLTGVDXQN0dwRP8wdToP4sdv3/WDr4FUPmCMkc9uMb2cCdVBuhgO7nHUqZPsEK7YwFzEsckeAN7UIiN5U7nk6hRpuoBxR3GFqM9e90r7hAyLCHM612kVJj21o4iZ7RyGLB80db7Nk7nY0/LrQg4YMZ6GSgenPcZzIeaE3RTlyTf0eIVFrbisuFMyfWfnZUmBQLQyLHu41FNlc3GsUjjF/UGp3VqdIHSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMOjJ8d8hTnPNNguN8Jxq9BT3/wDAZ9qLJtBgO7hhkU=;
 b=r95H21S6DppVG7hNfM8yPsyhcG1w7rOKYhGltVirIPdRXZ6sBSslhAdcgWvnTEIXzSfDiFEDGzmopkX/AGFcrfs098tuwl+lZ2+lkHMbjWwOs+cQJ1ogFGlvwjTIsA0DLZFN4H9JE6A0oAEHTgOhKNi8QSBV7XufVpf6QDadJIe32APiJXDsckn6UljE8fBlOGhwiMwn5vdFLQDFTMWkABY2N/hp+n6Yr85x/Qpas6btyD9Tq+ZG075Uw/IDtKDscBpvglBqXszwcROh/4pDXoRp+/SFJKVtJnPbqQ4FzRASt54ZzTWvGuh1wMJ+EbVek0g456zUr8Qs+ZVFwXQa9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMOjJ8d8hTnPNNguN8Jxq9BT3/wDAZ9qLJtBgO7hhkU=;
 b=ON3TSYLQy95hBseDxL34HK3izG0Izkmpox2tqKZmDkb1oXEA0M5dCqMsxkPixVBtDivRbp2VQNzTEGaW77cWCE49rnJI3XLtMDnDLt1eW0/okZ9dsxgwxNMR4cGdZressP/YNn0kyS1sLQIuem+8Q0PTwUicNvab27Z84uLfdPjalRFXE4qjtLZTFliQXFxj3aEN6qApD4yYqKRsTDXRdQ/kWgOK2HpE0bhxZ9o+p0G/TxEu+HzoWDfeqbL/pWNreSAz+s8odDqBD9mZ5j/zUneGlG3wIwzRAPdmrm4yHNbfOf8iu2gCTUXua/SU80lYFQxP7rrgcXbCB7eG6AWMcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GVXPR04MB11631.eurprd04.prod.outlook.com (2603:10a6:150:2c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 15:48:34 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 15:48:34 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: media: convert nxp,tda1997x.txt to yaml format
Date: Wed, 15 Oct 2025 11:48:11 -0400
Message-Id: <20251015154817.2500601-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0302CA0024.eurprd03.prod.outlook.com
 (2603:10a6:205:2::37) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GVXPR04MB11631:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ddb52c-b9fa-4c86-fd40-08de0c024c13
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?MHRWkIwrdwVzLbDumHuyrVm106g2dwB7zdBkEqodX/zbgKgu7O/4vj2Hn3Hh?=
 =?us-ascii?Q?+BY+dw23eelMA5NvZlWXSs3m0WUGMnF/dx/BjaL3ugxw5rRUtvamaBOv1sAi?=
 =?us-ascii?Q?7Az77iNTSN43j9W8zDYj/vSFCyApWQ0+loC8o1sMFcTwRLPL/DN+4igmCSaJ?=
 =?us-ascii?Q?QTd4ItJepo90nfPOY0v47jnDUDguHGHHJ2fxMIIfWfqHUWRwh8Cp/WlV1xFw?=
 =?us-ascii?Q?6yXAX/eQSDLUtLdAUCNHi5bWtBi6xoaVn4PU5mnKJ6h9vXLGArwME+HVFevz?=
 =?us-ascii?Q?vLUXri9SJ779qz9Tz4u/G4RoIT+LP6yRGshVvoEu3bqG/rtoIo3Ses4rgaIi?=
 =?us-ascii?Q?01x4SK3EXh1vy9h6XkvxbxnPP0KIEmDBaWThVJm2yBZJNV9wjODLRnWYMeJY?=
 =?us-ascii?Q?e0s6mMfIMxzQ091yRMQ6rHx9w/tNLICh+ErwPo+SX6j7FQtyFq/qJ9jvo/0O?=
 =?us-ascii?Q?l1fxkjDqTMzZ0jFUR1+e1xg3QrvbaBFPIqtK/ttL2dskIa7t+V6W6+lkvVG9?=
 =?us-ascii?Q?KBJ0RlykpQHy+BuC19m+CG3O7x8wEPemvuU3CiHv6uaMf2ehQY3LvoWwUQqx?=
 =?us-ascii?Q?tump/g17TAIOtYplkZdCdfEBsTbkca4OQ18wOCrJLbjVOmsTaG8+V5gkKVs8?=
 =?us-ascii?Q?19SJJkUZZ5+aWA61euIMDwckug5EJu26DO8W5U0ZiiEc6my/lE9XAH9S7IX/?=
 =?us-ascii?Q?Exr/wM17gcstNJ6ksy5sivL9u5xetCRUu3IJV8qJ+7aNnECLEALf8Qaikrgo?=
 =?us-ascii?Q?QdY+RtUxBilfJF/3MU/KhTnrzSf92if8T0q7noMXOZ7uRv5F3RS1vhzIni+K?=
 =?us-ascii?Q?OymzvMS0ZTkKaKz7cjHUdtTAyvTzVdVnoIUYEyDxyUi4QQLa3o0LmRwJbK1C?=
 =?us-ascii?Q?nrxLVKjFkqhipD0ntVZQXRjoBbG7RIaa5EuoXPnsMaOOE7Fqw8MtK67gKZkB?=
 =?us-ascii?Q?ZJGb84/95xq9iWpanHqtm8Swch2ZAXhIIVAoGgdiedcBl3rKFoAlBNi7KGVt?=
 =?us-ascii?Q?OLsb8sR7WPncfDJgfTDUaPOe4ttm9cHQyopJFgW0xzZljSopT3uZp3Egje3s?=
 =?us-ascii?Q?cQDsMmXiXOwQ/PeYMasNwJlls8+M+qr9G1oKoM2YnjgURTwPTGmAYOEiFBtA?=
 =?us-ascii?Q?yvqL5SEa9R550QNp9VwMweyH+Hn7tlzMl+IABMdxgv+ccFgtQt4BA5lC4yO8?=
 =?us-ascii?Q?UlwC2SDtY/uRRnw9Wmg2Q5W0hM0pxjh3OBoB8my/nWwWh0QvVpD7ZWXZpUcs?=
 =?us-ascii?Q?KG3jN25xOI7NZKemvD/bG5N1nFzus/R/2MXfnUtxCibuWHskKiYA476DsBa+?=
 =?us-ascii?Q?oGcjTsC4WZ8H0M3h4EXTD9E03v3PYglL9hp755cBnv3XmzIncrBZf/KQTkeB?=
 =?us-ascii?Q?cQjZ1e0Xtp/G+tF4C84a4Nwv5fo20hTqJfK8NmU8mK2BuRRQUbD6fOotarsJ?=
 =?us-ascii?Q?0guiiXTFXmmw9kRttswwSL96WUN3E5sjOlw8Axk+5o01YaAtpjkjYA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?R0IMCzp2sBSZxD0m8wzICKbTHX+VtmUw3VR2l74Pde8fQkNRfx9MWW6mFvUN?=
 =?us-ascii?Q?VhOVVi6dkuBuNue0Lq7BDBxuMkNHCVLfcN+9I4+2ZyEqdOHwi7v5DbOnRgE4?=
 =?us-ascii?Q?t/xGSJPSrmnvYN437hGnHb1utfu3cofdPQqgwxD9SDPCDmMN13fuQ5ID6veG?=
 =?us-ascii?Q?90bdgLs/sQyrRBEwmIH4NNnfm/TZTiOfMzLKrPceTZ14wV79lfFCP7M4Ovvk?=
 =?us-ascii?Q?94/JGFGX2sH1Ro6roz/3iM+EH7HhBucWmBOkt4yFGkOCPp5yL24cQPfjgGFS?=
 =?us-ascii?Q?FeYGYFwJbG+dbM77z0mUNtnqMFrO8uG6KRHTPn4Xa/QpPNiNVaeWsnMTYjWD?=
 =?us-ascii?Q?/WPvbM6Sun9xmfpTCDL6BKgV0KDuUUeE2o4Yc1LbjraABT6NaUlS0mti+WBp?=
 =?us-ascii?Q?5H7Ndf3wkWvkx9zHAO1YgBdnFJKSUnZqb8MmFjRziMFotFY2Xv7SlzWDZ7sW?=
 =?us-ascii?Q?mqwtoQHhR1zhccOeDK0RTrjYfZAVeqNrRTgH+rXCeQwNyzw9ZQSXsQfOoHVC?=
 =?us-ascii?Q?/TgSXJENQmGELKtSt58BOEkSPWJ/UWZRemkIf0qUeRmk2plYRyqe2gLvCeH+?=
 =?us-ascii?Q?tbHoS8ObF2wNsqcJ45J+sYvb1FpIb/9eCbJfuKQUpimUogxyzgTjITpKS9Lg?=
 =?us-ascii?Q?Q8lasbFZHaf47Cp+/lQHRuj0HaUSn1o707XmTj4L/CMjrSdOXUMMFvgZdQe2?=
 =?us-ascii?Q?NDuEdybaG9Dzk0TI0TLRJDbF3juKX4iP7L/87tpDIITR2xSEPfsb+kW4IPRF?=
 =?us-ascii?Q?7dmWt8AbXI51alwyau/1n6tr/a8VK7A34aFwA9cX5ubobvVtzF880JARlUBg?=
 =?us-ascii?Q?esObS7587FFrxd9lgffbKg0SW22N0zMP+XdsHA2tM9n6sfxpV30HGAPo7yr1?=
 =?us-ascii?Q?Wza7aIkNHO1XB62FcD74+rkY2FZps3ssZGPgcmwzGKax48S9lvCfZ3pPXEiI?=
 =?us-ascii?Q?rDNoGt5E+yAaxXVQdM14QBWeO7+UEYJ7EF+Yq/woVWu3c0UZICt+vfsD7G6+?=
 =?us-ascii?Q?vgswrjeCkIcKTyrkFVSOhGOginpEcac5nDL9FuvEKSXUIExhTyTBI1U9A2/P?=
 =?us-ascii?Q?tZgS6S3s0oEa/rdUWxIb7jdr9NjnNGmI1Ht9RsbTDpQ4WOwuzcd/57Trp9yG?=
 =?us-ascii?Q?PeNgD12vP3MRE5x/RZHlS1SSLmrMrqmDFkOk1zS8+PgIW3Xmv4DXPGIzLrWo?=
 =?us-ascii?Q?vy4waiIk218lyzF56+piPRv72C9YQdTIOfMBOxv9qyIgRNo3O1NfzdlgEyfr?=
 =?us-ascii?Q?pXEMFtDQT/vaabY77EjTOs4+dLCnArdAGvYPocV0qFOaPVEqnTahHQ78BkS4?=
 =?us-ascii?Q?UOG+kOtu1YsAAk5RF90JvcGDrMP6mf8IAYVKGsb8zdvSjC2cpnlOG7uQZcH2?=
 =?us-ascii?Q?pBdBazMDVWVSkQSWlzWskdbB+vRKaSoqou3mA7Ztscbux2OjidFB/eZ+ILng?=
 =?us-ascii?Q?d/LTFLefVuwV5Jb8zk/12+ufCZrmtAvpXQrnQuAbdH4hNBVokNRnddfu776z?=
 =?us-ascii?Q?2R5kb8k4ao0J6TtctEskXk//SWmhOZ9r3UJPD9kegfD3IFdMQ0mz0uxWnS3V?=
 =?us-ascii?Q?c4agJ6JxVD/aD+rVAyg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ddb52c-b9fa-4c86-fd40-08de0c024c13
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 15:48:34.2124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wo03ozFYIcDAaOHb8uFTKGTHE6f78OJDWNqPDL3SzPow4VFdNhzwbRDA4Mn+riWQQIgBNTa/uBLZ6nYMhlEIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11631

Convert nxp,tda1997x.txt to yaml format

Additional changes:
- update audio width to 8, 16, 24, 32.
- keep one example only.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add empty line
- add description for matrix's col. add limit for first index. But not
sure how to limit it to unique id.
---
 .../bindings/media/i2c/nxp,tda19971.yaml      | 162 ++++++++++++++++
 .../bindings/media/i2c/nxp,tda1997x.txt       | 178 ------------------
 2 files changed, 162 insertions(+), 178 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml b/Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
new file mode 100644
index 0000000000000..477e59316dfa4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/nxp,tda19971.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP TDA1997x HDMI receiver
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  The TDA19971/73 are HDMI video receivers.
+
+  The TDA19971 Video port output pins can be used as follows:
+   - RGB 8bit per color (24 bits total): R[11:4] B[11:4] G[11:4]
+   - YUV444 8bit per color (24 bits total): Y[11:4] Cr[11:4] Cb[11:4]
+   - YUV422 semi-planar 8bit per component (16 bits total): Y[11:4] CbCr[11:4]
+   - YUV422 semi-planar 10bit per component (20 bits total): Y[11:2] CbCr[11:2]
+   - YUV422 semi-planar 12bit per component (24 bits total): - Y[11:0] CbCr[11:0]
+   - YUV422 BT656 8bit per component (8 bits total): YCbCr[11:4] (2-cycles)
+   - YUV422 BT656 10bit per component (10 bits total): YCbCr[11:2] (2-cycles)
+   - YUV422 BT656 12bit per component (12 bits total): YCbCr[11:0] (2-cycles)
+
+  The TDA19973 Video port output pins can be used as follows:
+   - RGB 12bit per color (36 bits total): R[11:0] B[11:0] G[11:0]
+   - YUV444 12bit per color (36 bits total): Y[11:0] Cb[11:0] Cr[11:0]
+   - YUV422 semi-planar 12bit per component (24 bits total): Y[11:0] CbCr[11:0]
+   - YUV422 BT656 12bit per component (12 bits total): YCbCr[11:0] (2-cycles)
+
+  The Video port output pins are mapped via 4-bit 'pin groups' allowing
+  for a variety of connection possibilities including swapping pin order within
+  pin groups. The video_portcfg device-tree property consists of register mapping
+  pairs which map a chip-specific VP output register to a 4-bit pin group. If
+  the pin group needs to be bit-swapped you can use the *_S pin-group defines.
+
+properties:
+  compatible:
+    enum:
+      - nxp,tda19971
+      - nxp,tda19973
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  DOVDD-supply: true
+
+  DVDD-supply: true
+
+  AVDD-supply: true
+
+  '#sound-dai-cells':
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+  nxp,vidout-portcfg:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 4
+    items:
+      items:
+        - description: Video Port control registers index.
+          maximum: 8
+          minimum: 0
+        - description: pin(pinswapped) groups
+
+    description:
+      array of pairs mapping VP output pins to pin groups.
+
+  nxp,audout-format:
+    enum:
+      - i2s
+      - spdif
+
+  nxp,audout-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8, 16, 24, 32]
+    description:
+      width of audio output data bus.
+
+  nxp,audout-layout:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      data layout (0=AP0 used, 1=AP0/AP1/AP2/AP3 used).
+
+  nxp,audout-mclk-fs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Multiplication factor between stream rate and codec mclk.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - DOVDD-supply
+  - AVDD-supply
+  - DVDD-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/media/tda1997x.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi-receiver@48 {
+            compatible = "nxp,tda19971";
+            reg = <0x48>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_tda1997x>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+            DOVDD-supply = <&reg_3p3v>;
+            AVDD-supply = <&reg_1p8v>;
+            DVDD-supply = <&reg_1p8v>;
+            /* audio */
+            #sound-dai-cells = <0>;
+            nxp,audout-format = "i2s";
+            nxp,audout-layout = <0>;
+            nxp,audout-width = <16>;
+            nxp,audout-mclk-fs = <128>;
+            /*
+             * The 8bpp YUV422 semi-planar mode outputs CbCr[11:4]
+             * and Y[11:4] across 16bits in the same pixclk cycle.
+             */
+            nxp,vidout-portcfg =
+                /* Y[11:8]<->VP[15:12]<->CSI_DATA[19:16] */
+                < TDA1997X_VP24_V15_12 TDA1997X_G_Y_11_8 >,
+                /* Y[7:4]<->VP[11:08]<->CSI_DATA[15:12] */
+                < TDA1997X_VP24_V11_08 TDA1997X_G_Y_7_4 >,
+                /* CbCc[11:8]<->VP[07:04]<->CSI_DATA[11:8] */
+                < TDA1997X_VP24_V07_04 TDA1997X_R_CR_CBCR_11_8 >,
+                /* CbCr[7:4]<->VP[03:00]<->CSI_DATA[7:4] */
+                < TDA1997X_VP24_V03_00 TDA1997X_R_CR_CBCR_7_4 >;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
+                    bus-width = <16>;
+                    hsync-active = <1>;
+                    vsync-active = <1>;
+                    data-active = <1>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt b/Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
deleted file mode 100644
index e76167999d76c..0000000000000
--- a/Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
+++ /dev/null
@@ -1,178 +0,0 @@
-Device-Tree bindings for the NXP TDA1997x HDMI receiver
-
-The TDA19971/73 are HDMI video receivers.
-
-The TDA19971 Video port output pins can be used as follows:
- - RGB 8bit per color (24 bits total): R[11:4] B[11:4] G[11:4]
- - YUV444 8bit per color (24 bits total): Y[11:4] Cr[11:4] Cb[11:4]
- - YUV422 semi-planar 8bit per component (16 bits total): Y[11:4] CbCr[11:4]
- - YUV422 semi-planar 10bit per component (20 bits total): Y[11:2] CbCr[11:2]
- - YUV422 semi-planar 12bit per component (24 bits total): - Y[11:0] CbCr[11:0]
- - YUV422 BT656 8bit per component (8 bits total): YCbCr[11:4] (2-cycles)
- - YUV422 BT656 10bit per component (10 bits total): YCbCr[11:2] (2-cycles)
- - YUV422 BT656 12bit per component (12 bits total): YCbCr[11:0] (2-cycles)
-
-The TDA19973 Video port output pins can be used as follows:
- - RGB 12bit per color (36 bits total): R[11:0] B[11:0] G[11:0]
- - YUV444 12bit per color (36 bits total): Y[11:0] Cb[11:0] Cr[11:0]
- - YUV422 semi-planar 12bit per component (24 bits total): Y[11:0] CbCr[11:0]
- - YUV422 BT656 12bit per component (12 bits total): YCbCr[11:0] (2-cycles)
-
-The Video port output pins are mapped via 4-bit 'pin groups' allowing
-for a variety of connection possibilities including swapping pin order within
-pin groups. The video_portcfg device-tree property consists of register mapping
-pairs which map a chip-specific VP output register to a 4-bit pin group. If
-the pin group needs to be bit-swapped you can use the *_S pin-group defines.
-
-Required Properties:
- - compatible          :
-  - "nxp,tda19971" for the TDA19971
-  - "nxp,tda19973" for the TDA19973
- - reg                 : I2C slave address
- - interrupts          : The interrupt number
- - DOVDD-supply        : Digital I/O supply
- - DVDD-supply         : Digital Core supply
- - AVDD-supply         : Analog supply
- - nxp,vidout-portcfg  : array of pairs mapping VP output pins to pin groups.
-
-Optional Properties:
- - nxp,audout-format   : DAI bus format: "i2s" or "spdif".
- - nxp,audout-width    : width of audio output data bus (1-4).
- - nxp,audout-layout   : data layout (0=AP0 used, 1=AP0/AP1/AP2/AP3 used).
- - nxp,audout-mclk-fs  : Multiplication factor between stream rate and codec
-                         mclk.
-
-The port node shall contain one endpoint child node for its digital
-output video port, in accordance with the video interface bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Optional Endpoint Properties:
-  The following three properties are defined in video-interfaces.txt and
-  are valid for the output parallel bus endpoint:
-  - hsync-active: Horizontal synchronization polarity. Defaults to active high.
-  - vsync-active: Vertical synchronization polarity. Defaults to active high.
-  - data-active: Data polarity. Defaults to active high.
-
-Examples:
- - VP[15:0] connected to IMX6 CSI_DATA[19:4] for 16bit YUV422
-   16bit I2S layout0 with a 128*fs clock (A_WS, AP0, A_CLK pins)
-	hdmi-receiver@48 {
-		compatible = "nxp,tda19971";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_tda1997x>;
-		reg = <0x48>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
-		DOVDD-supply = <&reg_3p3v>;
-		AVDD-supply = <&reg_1p8v>;
-		DVDD-supply = <&reg_1p8v>;
-		/* audio */
-		#sound-dai-cells = <0>;
-		nxp,audout-format = "i2s";
-		nxp,audout-layout = <0>;
-		nxp,audout-width = <16>;
-		nxp,audout-mclk-fs = <128>;
-		/*
-		 * The 8bpp YUV422 semi-planar mode outputs CbCr[11:4]
-		 * and Y[11:4] across 16bits in the same pixclk cycle.
-		 */
-		nxp,vidout-portcfg =
-			/* Y[11:8]<->VP[15:12]<->CSI_DATA[19:16] */
-			< TDA1997X_VP24_V15_12 TDA1997X_G_Y_11_8 >,
-			/* Y[7:4]<->VP[11:08]<->CSI_DATA[15:12] */
-			< TDA1997X_VP24_V11_08 TDA1997X_G_Y_7_4 >,
-			/* CbCc[11:8]<->VP[07:04]<->CSI_DATA[11:8] */
-			< TDA1997X_VP24_V07_04 TDA1997X_R_CR_CBCR_11_8 >,
-			/* CbCr[7:4]<->VP[03:00]<->CSI_DATA[7:4] */
-			< TDA1997X_VP24_V03_00 TDA1997X_R_CR_CBCR_7_4 >;
-
-		port {
-			tda1997x_to_ipu1_csi0_mux: endpoint {
-				remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
-				bus-width = <16>;
-				hsync-active = <1>;
-				vsync-active = <1>;
-				data-active = <1>;
-			};
-		};
-	};
- - VP[15:8] connected to IMX6 CSI_DATA[19:12] for 8bit BT656
-   16bit I2S layout0 with a 128*fs clock (A_WS, AP0, A_CLK pins)
-	hdmi-receiver@48 {
-		compatible = "nxp,tda19971";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_tda1997x>;
-		reg = <0x48>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
-		DOVDD-supply = <&reg_3p3v>;
-		AVDD-supply = <&reg_1p8v>;
-		DVDD-supply = <&reg_1p8v>;
-		/* audio */
-		#sound-dai-cells = <0>;
-		nxp,audout-format = "i2s";
-		nxp,audout-layout = <0>;
-		nxp,audout-width = <16>;
-		nxp,audout-mclk-fs = <128>;
-		/*
-		 * The 8bpp YUV422 semi-planar mode outputs CbCr[11:4]
-		 * and Y[11:4] across 16bits in the same pixclk cycle.
-		 */
-		nxp,vidout-portcfg =
-			/* Y[11:8]<->VP[15:12]<->CSI_DATA[19:16] */
-			< TDA1997X_VP24_V15_12 TDA1997X_G_Y_11_8 >,
-			/* Y[7:4]<->VP[11:08]<->CSI_DATA[15:12] */
-			< TDA1997X_VP24_V11_08 TDA1997X_G_Y_7_4 >,
-			/* CbCc[11:8]<->VP[07:04]<->CSI_DATA[11:8] */
-			< TDA1997X_VP24_V07_04 TDA1997X_R_CR_CBCR_11_8 >,
-			/* CbCr[7:4]<->VP[03:00]<->CSI_DATA[7:4] */
-			< TDA1997X_VP24_V03_00 TDA1997X_R_CR_CBCR_7_4 >;
-
-		port {
-			tda1997x_to_ipu1_csi0_mux: endpoint {
-				remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
-				bus-width = <16>;
-				hsync-active = <1>;
-				vsync-active = <1>;
-				data-active = <1>;
-			};
-		};
-	};
- - VP[15:8] connected to IMX6 CSI_DATA[19:12] for 8bit BT656
-   16bit I2S layout0 with a 128*fs clock (A_WS, AP0, A_CLK pins)
-	hdmi-receiver@48 {
-		compatible = "nxp,tda19971";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_tda1997x>;
-		reg = <0x48>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
-		DOVDD-supply = <&reg_3p3v>;
-		AVDD-supply = <&reg_1p8v>;
-		DVDD-supply = <&reg_1p8v>;
-		/* audio */
-		#sound-dai-cells = <0>;
-		nxp,audout-format = "i2s";
-		nxp,audout-layout = <0>;
-		nxp,audout-width = <16>;
-		nxp,audout-mclk-fs = <128>;
-		/*
-		 * The 8bpp BT656 mode outputs YCbCr[11:4] across 8bits over
-		 * 2 pixclk cycles.
-		 */
-		nxp,vidout-portcfg =
-			/* YCbCr[11:8]<->VP[15:12]<->CSI_DATA[19:16] */
-			< TDA1997X_VP24_V15_12 TDA1997X_R_CR_CBCR_11_8 >,
-			/* YCbCr[7:4]<->VP[11:08]<->CSI_DATA[15:12] */
-			< TDA1997X_VP24_V11_08 TDA1997X_R_CR_CBCR_7_4 >,
-
-		port {
-			tda1997x_to_ipu1_csi0_mux: endpoint {
-				remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
-				bus-width = <16>;
-				hsync-active = <1>;
-				vsync-active = <1>;
-				data-active = <1>;
-			};
-		};
-	};
-- 
2.34.1


