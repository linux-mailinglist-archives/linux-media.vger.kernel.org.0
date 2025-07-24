Return-Path: <linux-media+bounces-38370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17620B10813
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 12:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3284E7BB501
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 10:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7085E26A09F;
	Thu, 24 Jul 2025 10:48:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021072.outbound.protection.outlook.com [40.107.51.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F70925F98E;
	Thu, 24 Jul 2025 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753354091; cv=fail; b=N7QbOQMUuJ2fdg1RJxnh4ieNIGKEMpwIAyQgKmTU9AZQ1dy1cYkUg8FYaYlgA5s4rhsYa0qt+ovU/h0z+nYSfwkpiU0vniNJoljb9Yz3codI2muj4gduRBV0TmHOo+FWAYvg6z9ZPFyqcVKbXRPp8pCLrO6BlHbScVhPkY/tdr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753354091; c=relaxed/simple;
	bh=ImgZJiBml5tory7v3EvOJphCsPJhnYRb0lDTYm7E6I8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p9KJYxUZBFJjGlipeRz0KqFqFkHzojWxZ2A38LJqwXFatSXwT1Jkvu5YTRdweDfua+msEiGdBZIEoRy8hm5lz/bYSOQJufrCY2t0rnukZSaTJ75NnCH7GMOlS4YqTjk9Iv1UhT9FHnR21QQu1AWDAZ13HI7txdqtirP5XqnHIdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQUWXrVD6179Jl1778ez/Mvw86vIjrxRVqC3PA4MnDMRJS09c2Njx2cfZ7u+MEUVcRDmf2QSUFTkxkrIyDZcBxdsrVzNB+7HpXReX3PgsAvX+uSF/r9rg4yWVl65RFpGoPBnngG0X4Sup3IBwA7T7yOLzc6yrNZIVpEnjpWRjOYtSjmjJ+jGAmw+kZ58+cirdBUIBwHToreeHVYIn3hBbkKxoYH/mkZyhvu/n9tR7UKtaw+Ls5OpQnUtedyKeXJVJwMe3Ehb03eSPjoYGo+u8ZjFA9qFVryE/9oC3RWltmzmCdB1OI1jSleyr5WYx1kjgiXrYD3F/uRECu10TRA94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apEMJSAQfElNW5fYuo0Rq59NtXwOA7/EP/f1IwW5qYk=;
 b=l/h0N5acFZW1hrPMEzxTsiHpNLtURNIVWIlu3douww3VnsLDeyRRkLxvtw+Ry6Uv7wWZjtTOROD/JQ/iCqysOIBlLgJWFkCtf7h0N/eqTPYwj3G0oqo0989jaiMwpTZbuZ2pqm9M5pTXtnVtGlX/OH2+d505ZM/iiCXOTgaBZFlfVcZE4ys4BbYKGMyneRqu84FUWJIGv2iS87F2k+pCxnGmAluCCwzfhI8Hf6aJ/blaFZONXHFhD1D4KE9Zl+/dlmRylawo+jocpo112LOQGbNJdQ3hIGCslSgcLYgn5iYEDySa0PI+pcgj808dgyqK1S4xSMGymWD6sxkx/EQFEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN0P287MB1634.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:186::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 10:48:04 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 10:48:04 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Matthias Fend <matthias.fend@emfend.at>,
	Hans de Goede <hansg@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Date: Thu, 24 Jul 2025 16:17:04 +0530
Message-Id: <20250724104711.18764-2-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724104711.18764-1-hardevsinh.palaniya@siliconsignals.io>
References: <20250724104711.18764-1-hardevsinh.palaniya@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::10) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|PN0P287MB1634:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f084208-c682-4ecb-09a4-08ddca9f912b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UqtHHWS2EHT0FqG92Pj4ncskNFghQpYTfjafGzxwgG6AdjQXSmjQnmRjJLrf?=
 =?us-ascii?Q?eS3mY0trHBfSgk15/A/8n3TUy5/AK6BuJ75mJpcsFu20duh/hfjbviFBD/xJ?=
 =?us-ascii?Q?XLPS0e86d8cx8oWLzqgEOC/WNj84VgmNkhot4B1R9YA9SVKYr4yejrnSyNY2?=
 =?us-ascii?Q?MrkmUvLkj32K7tMvftyCYjp5ezkQU6S2d8fBdATyMCwd0qta4R2SLo9YCDNl?=
 =?us-ascii?Q?lg4sxBI71qMyHRlnogY+FUiOzFsNssJlq6m946ExnZc4aUfCyl+pNYCQtwvY?=
 =?us-ascii?Q?JoK+qZPCu8ksNuepOF5S2KYz1RC5tmz5utGorkGx6rp675i00pada4ncYQvb?=
 =?us-ascii?Q?q6+FxutkWJAPz6+FPpzPctUrwykNuFdYRMpPblzkcq8DN/KD/zTz+ETOV1pZ?=
 =?us-ascii?Q?cZzlaQq/1aM1qFirw9cNOPd9wzfLTgBwgQS45CRVxSBm0YDZP0XBRgZs/vJY?=
 =?us-ascii?Q?lVleIGVSrjf+e1Qk33Tvt2tOL8rvZ/zHcHkz/yJoI0Cz54La2CCgoRZboWGb?=
 =?us-ascii?Q?ypWvpmAN2GV//rKgDfaLLpn2H32kJltReI7ZtIymwNYeg2fE/ajHsJc+xwn5?=
 =?us-ascii?Q?0Z2dpeI/q7sX0zt3FGmnDyFqK7f43VP5vaRO0ZtFEm0vE1ybdrPUG/6CkVxs?=
 =?us-ascii?Q?9MrQLoIFxzX99SFaNWvE7dFtXpojjt67HgKkBFWPn0Lj5ARuh0bhum7AtHxH?=
 =?us-ascii?Q?EKeS+KxoVZKXA+VioSnZQP4C4UnQRuvXlB9iyAXUTLszP+qj/qoPeOO8ct2x?=
 =?us-ascii?Q?XR9kf3CLwNfLSv6ZDhHPVCIFlPl5EKUsEif1GUd22leFRPf30iUoX8mcIlEX?=
 =?us-ascii?Q?VvRb6fukWAYvEugFGpYs1te3718WfiY/68z9WYS2nNCbHADfyGwGuGMXmsaz?=
 =?us-ascii?Q?ZPC2p3DCnm4Z8DQagtYNlxFeaV7jO4Op/hKdVzCdoMlcmKHCKmkt2hUP0HMj?=
 =?us-ascii?Q?zcsB6Te2d3X35cDgkg4XaSlYHbn2RiGYiQcIXdwhC6IEdho0xVZS04xsnEWU?=
 =?us-ascii?Q?1osaTAbZMOpl4rR149dqwtsfa4A8EtpGE2JBP3CKwGT8j41YtHgZqlbc0Xtj?=
 =?us-ascii?Q?5pKPiiJ9+tzynT1G7az2WaijwV68T3lOBMr1fWs3X3WVqV3wXXb/71Mui6Xo?=
 =?us-ascii?Q?yRBS4xMvXj7bg6s8USLzvOhf/HwW8jVUFanzZuNi0GdOK4aj8rSZ4DTu9I2s?=
 =?us-ascii?Q?m4XFbgvn2nKO9k5Z417uWTbjJB+6IrjfflzcMNwWMPKglPgY9ZR9S4jUYbSX?=
 =?us-ascii?Q?ynSwakzxkL9NqUeL6XZ4vrLipGfEPEDuhvDqzdVNESzyMiRdRYVlqKxMf+pO?=
 =?us-ascii?Q?nzGPlLIe9+0AgQGUnJM68COwRHq0XgtUIol8PfGLuiGbrshhV8lRfJpQx91p?=
 =?us-ascii?Q?xFYXMQtT1CuL8pu6hrTf9E1bXwFmZXHT981bwxL64FA3QU86MzzMUoUN8MNj?=
 =?us-ascii?Q?e/NgdtMmFBA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E6CXi6STKBP8KaWP54pralUIxabnOE0Y2prmgxLr0eU07eFw/qLkCKX5CKkM?=
 =?us-ascii?Q?zUvXTz+bmwjZSgAPNysTJZoaDL5/zCtDp7HAhOSjvLVVgGf2VKrnbjjAX1eF?=
 =?us-ascii?Q?o3bXXMJzt7QJXO8EWFI/AyDMr3YcNOSbucPJyNnAhLTNt1Ps1nqjVRyCrU1J?=
 =?us-ascii?Q?Nr2XJ2dRcMdWA+w4FbBaBuWb66YYBHH6gjQPncYhEu30phItk+AMLGXsIFe3?=
 =?us-ascii?Q?OvE9VSU6ln5VXLBlrC9SNz0ny4n7BJTqkVpHj4D42gZVEd1LaKH1Yblf7mmo?=
 =?us-ascii?Q?78O7kiNuPvMRz7R3xwPudBId9cXMlPOHvWLTn5QQHbPj/MWHbZ+rN6/1lHBP?=
 =?us-ascii?Q?5RXwQQ8aCEYHmZCdWc16+cPnK1gDU77//oBHW3xIfRIR9G8dQgN5ifro+TWo?=
 =?us-ascii?Q?GZZANTPe9c3HXCsyxAPacnx8oPIMQqhHsybuyR6b2ZSlNK5/ouV+rG6T4rxf?=
 =?us-ascii?Q?iqBcok/ijM7mOQ5ECxfE/NtUpGhk1H6C6ztrx10maOjCsXdG8e1edt0+Nmfz?=
 =?us-ascii?Q?usi3Wrz6v/jxyf28N6juoCBhk56yQpA9nZZgN8r2ZMVgzi0izxF1NnwFosx0?=
 =?us-ascii?Q?UJ4eGYkgTs/1Mkd4pT+UCRvpeB4X5a2P3rN1tyWbLkKjOugJWm0FXDrkOV3l?=
 =?us-ascii?Q?tghMyUrf6ukZOglk/gspFU8c0182Cf8V3b95ASutfZVRnxaCnUrhSqAnk1V/?=
 =?us-ascii?Q?zRx20rrTS6WcKomxi2mNw3BnMAg1B3uaB3KffUbUIjASzVStJTLEG6fLc2JB?=
 =?us-ascii?Q?zo5ZuF8rL89uQ4l3ArT6vXp7o7RQDcCWvZd7ptdUZ1CMRCtUigxcNStyDA1l?=
 =?us-ascii?Q?xvezvXXuTxsV652TI3/UTeQzRV6emf5p9o8DdbxRHmWT/020BAd2V3t3FYzG?=
 =?us-ascii?Q?LehEjsgZ/1y5x57rMCCaojj/4o2y37DlOVEv3R5/uJEfhGIvrQmA+bEUU2BK?=
 =?us-ascii?Q?GEA8ySwcgUVHI4/GAIwxN61efV1LMPIMSl1bVGgiGZW0TFu5jonsddg9delx?=
 =?us-ascii?Q?d2dgmQzUkdVK65avfeYJDuA1YweTb/iAy6ioco5PvkIMjYTEzJCRNqb4OCgg?=
 =?us-ascii?Q?1GMd5OrajuG5KVnLkKrB/norsYmO0mn66vOoXVbcfyr2hEx53oS83DBDSPPc?=
 =?us-ascii?Q?ji4umk0j630AQEkWAkQ63CnBa5weuH2VepmrboeoQpdL9qCDWcda0L6Ijg2r?=
 =?us-ascii?Q?OrJR/D2uxuTu7a7mzjq+j2ZvWNEPCREN6eHq9N0cbur62h4L8PKkBhTmO51Y?=
 =?us-ascii?Q?/qE/XzwfBpYez2DQzfIw3i96O6PdX+ynhWzEXkciAm47+RMxNy+nPRIj9Ip6?=
 =?us-ascii?Q?hs75bDThvt1PUE6GcubDQxHb4AqEroYmpO2uP9EAeQLEOZk3GmWlCddZDX5u?=
 =?us-ascii?Q?/lDZpAfagigs5rO6i9fG1q80iqrVmxINz5YCbln71+p1JB+CkKA6Y6F7Zi4Y?=
 =?us-ascii?Q?aMpyfcO9O6NsmD+j5IJW7Dr43pY0grYfCullnPUJnL2DLBTAyFgDC9TbR1dk?=
 =?us-ascii?Q?KphJm6qHGmvAUjo2K5WdboG/i5eib35hDm+Qe4jzXrKUVa89om1A9mIgpqFN?=
 =?us-ascii?Q?SGH4Wno8CFVY71IYoWz5toLJPFfYRmqAD52kmMK2FsmIwG2PH6ciX4voWaT6?=
 =?us-ascii?Q?y+2NYzWUhh7N5LijJ0OLr7A=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f084208-c682-4ecb-09a4-08ddca9f912b
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 10:48:04.4863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEBDC2lMcmVsMEjnjaxih4a1v3FH0IUXZ1OnRRirRM9jL+5Hi7fCzGZqBr1d9mPufgwIrVfa3dBu7iEWLsx/1kw5TPmKA/Ig20PcZOGoe3qw0mxUvdapIWlnJGyhPdJD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1634

From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Add bindings for Omnivision OV2735 sensor.

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/i2c/ovti,ov2735.yaml       | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
new file mode 100644
index 000000000000..9236829cc00d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov2735.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV2735 Image Sensor
+
+maintainers:
+  - Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+
+description:
+  The OmniVision OV2735 is a 2MP (1920x1080) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10 format and uses a 1/2.7"
+  optical format.
+
+properties:
+  compatible:
+    const: ovti,ov2735
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XVCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply
+
+  dovdd-supply:
+    description: I/O Domain Power Supply
+
+  dvdd-supply:
+    description: Digital Domain Power Supply
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  enable-gpios:
+    maxItems: 1
+    description:
+      Active-low enable pin. Labeled as 'PWDN' in the datasheet, but acts as
+      an enable signal. During power rail ramp-up, the device remains powered
+      down. Once power rails are stable, pulling this pin low powers on the
+      device.
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@3c {
+            compatible = "ovti,ov2735";
+            reg = <0x3c>;
+            clocks = <&ov2735_clk>;
+
+            avdd-supply = <&ov2735_avdd>;
+            dovdd-supply = <&ov2735_dovdd>;
+            dvdd-supply = <&ov2735_dvdd>;
+
+            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+            enable-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <420000000>;
+                };
+            };
+        };
+    };
-- 
2.34.1


