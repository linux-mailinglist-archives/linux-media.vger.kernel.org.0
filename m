Return-Path: <linux-media+bounces-39416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A980B2027B
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E18C1664AB
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CF92DCF45;
	Mon, 11 Aug 2025 08:59:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021138.outbound.protection.outlook.com [40.107.51.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B46D2DC34C;
	Mon, 11 Aug 2025 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902758; cv=fail; b=WpeMh37iwoeWf5qKZibxIGf0fdJxy+edHMIkBDT480+RE9qdPWPD44PUX26qyfy5iHdogsai9bsMLh4wO26gTqvJnqVuc5YvqvroykEHWiuWBluNO8pr8CoV4WL8MlTjb4PxUVN2MXXJbIzM78BbEMc+4Mfl9P3Mg1xnxblyR6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902758; c=relaxed/simple;
	bh=jr5lp16Byqkn3XmopsMph8KlenM0DbIzdn/3mF/XjuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jPRhLi5Qk+xKyPB1wj6richYOAGxozEfXAAj2eiemx+Flpoasep899Kg07b1bCyZlY/MFrbspLOd23beJtRBRet86dOgs0qELfgumV0pVZ6Z8zIe0bxHkTMTJGuGxqRONHNYSh1EC+UmBK+VhrmEUVK5coh69Vt2O1v6ctgoSLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIeDvFt31xh+2bUaDBjHnW9DSWW8dh0DVPe9zy7VcvciML0541ho8ZZQzy7ZekZdwriK/6Gsb8WB4DgSLteciFTNyFGEGOusPCFFvGdRESVOYmCDjnD5A2oahAa4rmBzUQ7CH6kX9vLD7aIbxZbMyshflOhTpjnwtCysofariATe1LiBOkAztH1i9ZLdbzxF4LsquE16vPFbLtg4LW+bJTqMABUvOwBghNQ3IxdORiqUN0F1lD8j4/NvQxzKbr7Ls4UDzsIkNEw175EXi1QCTIRLauCRSepRrdo/w2dDRIejAZUG58eZ8pHcdvKAzz3CsdDUWqwyIkTMJse1rykMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRwBmvmZcf0SGSEbKlgKOXEUoqe5xk7PCdFYgzxXM1w=;
 b=cIrYNYVrmrAhXdCUXW5WUhJW2Oznkl4jY6cvQpSPgSj79jplvopy6hT2j/bQpMEoSRa56hk+H9oDzRJoyEgdT0sJ9t49UdSjwPB+H4AQkbWyvvYZ7GT0XOFP6RIgWLVR1jasEDsCs5qwQyG5Kdwhydgq/2hbh79CkWRPdOCo2T+IDDG4kpY1fm/INPUqTeeavGt0PzdyKYWTpwZfxzI2993ZZ1ldSYpjMJM8dIj56wzcxxNA4i0bemhAwCQC1w1zBilaC9vERmPCACMpggPtfw1AVzDtSHq8Ig3ifoFPLFe6uCrqtIecz1rONdY33H33X8HoIc3eZP+XUCnomV3bjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN0P287MB1716.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 08:59:07 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 08:59:07 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Arnd Bergmann <arnd@arndb.de>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Date: Mon, 11 Aug 2025 14:28:04 +0530
Message-Id: <20250811085814.111073-2-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811085814.111073-1-hardevsinh.palaniya@siliconsignals.io>
References: <20250811085814.111073-1-hardevsinh.palaniya@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::11) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|PN0P287MB1716:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f265be6-0123-49cf-5819-08ddd8b55418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mjnaa9eONrzWfOcZEZfRofucsokMa5R7EFSh6kt3vUcqn+KffoPE4QSSXA6E?=
 =?us-ascii?Q?DF9q9m9IW4RcC019A/Z+2OH0MkKHLR8Bt+Gtcr10EAM3w4WKTBAaF9ZbMKKX?=
 =?us-ascii?Q?5jFmLjVv8cpdabGYBFv1hBNk2mhUJJi3lJTbeY1tl6PSo6q5BqPhWtUQPjL5?=
 =?us-ascii?Q?s69ykFOwdIssHckbYC5YVVPXRWPZjgi7x3ZOq9Vq2sJkJl+kQ6w4bF/EMZRU?=
 =?us-ascii?Q?rLS3vLwLKEg+oY7AwnQcaWtrz61qxicOzwZeLXfdg0eeq27z9GTlkwlbIDgw?=
 =?us-ascii?Q?Zmcf96A2yPrLf6r74SFEP1W/IgnRXDhKyWs6/qHuR4NbxgFYkBD2gSvMTiL3?=
 =?us-ascii?Q?4RZUX6RchSzH1Oc78bOez9EimG327DrqTu2mvigLGfKnmSQ3x+YgmDIrQaP3?=
 =?us-ascii?Q?14F9u8BYnokSxC/ZQ0wKWqSk0RyOBfGNC/NlxzHHi5wQHTnIhqFsbz9aNfTK?=
 =?us-ascii?Q?ln4+XgGvXI6TNvbtHjY+2Mxuz6YHNJA7TCOzCehJ3M29wACChpiEM+XGkqy0?=
 =?us-ascii?Q?pjlJdOCgufLufInE+z2JiVfaRIXE0Ce/IH+2+tP3ttbndNNi+lpGl13E4WJL?=
 =?us-ascii?Q?K/Y2T1cItbEBuOggRq9fED81YQiGQtYydooSQ/FxqhffXJHZ3ZWstvg+I8Ed?=
 =?us-ascii?Q?Z7RNNdv1jYnhLFse7nI0HmiCpC62Vn1y2yHvPN0OwYceobNiAclHDTiEL0Nm?=
 =?us-ascii?Q?NOKmI0c8odH0O3Kzd80bsH65kK/8oHfI98tClHh6aVAwrJkidTy+Iwf01BvH?=
 =?us-ascii?Q?UcxwURlK1t8QS6RX+BwEVA5XlRyt1AXnJNRj0bwvXb83DHGcJkhfcZ3QvOr5?=
 =?us-ascii?Q?1pzRUYFVZAxZ2033YsHlZSQPvFhnEeN6Q11AN8gXzB+DX019nuM54bf5maBO?=
 =?us-ascii?Q?fq972CP8bLr4GgfgoirEEeXVfNb986UOEbUAdRdtwTz71Arpy7G79XiJ3x8k?=
 =?us-ascii?Q?m4/Q+V8IWdtM03L0+NPGYoKj6ILRrAOCtRJ9cfKK6M54BI+bMEys2ZyAeGhY?=
 =?us-ascii?Q?o28V2BQKVet+jUh8824T8H/P5nidDNnSA6RdIux1rzKgdWKMFNgEP5VnUj0D?=
 =?us-ascii?Q?zuOafLN5KeEhO1ZTSkwHVUCRwn2l4+OnwcBzZsjDTgcO4VOmyu86ri74JCVU?=
 =?us-ascii?Q?ovynezpoThvKHEn+1v992PpV7Y4E0AL/ImGxDtjN0MKVEsznp+9DloodZMqd?=
 =?us-ascii?Q?sx2mB93mjb4P8Am44fTC5xEHUtTZDOOISQ5otUttYDqU8fzJMLs6LacDjOj8?=
 =?us-ascii?Q?YEOMHrZ9pykZPTvCt8zRD4opyH6s28yCq8pTMGytRhF5WqIiVpINVxNTwC3v?=
 =?us-ascii?Q?JW6lYuUWt/MFaZ7u7Kk+MZdT+Wt05ly/NfAwolQcCbcRk3im78lt6fT2NuO6?=
 =?us-ascii?Q?7sHbEdkrLtrY5B8m4tNsgjAHWGrg8rL+tfBT9UITcMWe8kKkG3DyVV1i+TI3?=
 =?us-ascii?Q?V7JK0laKPOk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U5ydF58CAMnnoArBPlvHr4p5zg7PQ8qfDBLJNs7bgKDK8s1E+F/xTAiWaKfO?=
 =?us-ascii?Q?vuyUrwm8oDqC+DJkdbwqz4rFW3tVlBYvbVQEBozjZ6vW7sfUM6kIAZ7+snCr?=
 =?us-ascii?Q?Q/lBsy93s6oLPg37crrCjSfaY8s0UbTmZP7mzpiT/17GNrn2mMxayKDzSeyM?=
 =?us-ascii?Q?s0qk1fORHTOm9WPfjjJghvvGdqml57OzQvzQPJvecuPgG3roRNei7cpviED7?=
 =?us-ascii?Q?N0w+8VCeIVXAC/jz82dQIskf9ynwZ4aw/pn3tWXOSQPb36FUGpV7JBiuLZnV?=
 =?us-ascii?Q?cfbs6rWg+CpfOFzEQnMdxXpY18lE2nz3acjdqwB1+jaXjsA1YxDMzrpBnjCl?=
 =?us-ascii?Q?tcSKcCIBCQiMBkkySpiFFjKJsYhBZ6NP8n4+MkMZA9il48SqvoPL5ZUXvks7?=
 =?us-ascii?Q?IBhaHpnGfNBh3TwABrPHuhXZ2s0jyJNAzYo2wt+Hx5RYb1sSTCknwtE12+qf?=
 =?us-ascii?Q?Tir+ctdJDtV7hfEoM4DGQqg4g7UVZmU8/jzq4U0sVss3hRrfkDq7AjWlJFAx?=
 =?us-ascii?Q?t/ioM/Z2PEn0+vRQjB7HqqiuLLOmVkzlX4TDIf7QQJVIFvBk6sp5ohRHBJ5b?=
 =?us-ascii?Q?chEymkQzH6HGzaGXppx6e2zm9EFHzMykxVmKq+gRWX4zpNh5EKBMdpzAtQXZ?=
 =?us-ascii?Q?1OVXpPtDtO2OlMEWdPS+N/JdUwlirqvIJJb8qQX7QqTni/CAoLTgPSZMZ3k9?=
 =?us-ascii?Q?gNVBLP6SzisO89iYFrhW7q7asewywtDab4SOQ/uJm4vtFhl6kYwzFaOj25pw?=
 =?us-ascii?Q?Y1zul/VD3VLaVGfYj3Sg5hTGeWBXvLTntvnOEWKT63s8d4hOKcTzCN6k1rsB?=
 =?us-ascii?Q?Bzplf7qRD3N1+bO0aWSwRkPjkjSUE1e7LwOWto7vTCzeF04AeGO6N0fySDbL?=
 =?us-ascii?Q?r02mnMQ/08T92vqIpolqd/qpthUsGWp7jPJKSJnZYPtGgjXhL4EaEAX64Rwj?=
 =?us-ascii?Q?9ZN9poORrsXlf3NqlCiZW7wAVwDKR+KIzxM+ANPPD9CvEBLqG8u0IxgRHZ5D?=
 =?us-ascii?Q?wHnxi8X1mcVWr8EUSgxHBCM9XLMJ24gsc37ZdYKeL+e60Kb/8JIw+H9J5H3+?=
 =?us-ascii?Q?dBqQizDr4UYevUsNnLGud3xeR99mXHX5WuyI1YkujZKwcQYx+fyW9XFJydGC?=
 =?us-ascii?Q?rZZjfzarZI6tTtQgFLYBLsIz3MCCZ+7rRWELoA9lzzsnJP/yLS4GhQWLD6OM?=
 =?us-ascii?Q?p/9DAqDE81VrhTi87nbUJEvtXMmOXYlDpEYvIUsAszQ+yUyqocmWpo37DCqD?=
 =?us-ascii?Q?NJ0sX/HbJLVMbNnVkb04K7dfcnEFx5tEsfUZDPQBqc2N1Qb6dVZhemLD+bhJ?=
 =?us-ascii?Q?8CFP6eA+FGq5KxpLZBK9y9YkjF7+bHbhkcJSL1CBfi/imldXVYJSngrMsMCd?=
 =?us-ascii?Q?o5yeafBx07eV8K4sWvkMF7uDYyOqw0S/jLYJx1e5muk9AtcqwNDd2w4hNKFC?=
 =?us-ascii?Q?MIatgw4cG1Nj+aYJwi/vZ1CfIMQuTqntp+CBV9Ui8AZgxX110BTqfZTiyEc+?=
 =?us-ascii?Q?E2RlndDBnJzR20Tra/je+B9sPbl7+XcNzyTopTHlUu4drCI0M9567+/FIgf3?=
 =?us-ascii?Q?yZdhJz61jVl5wdmJTbzUd7fgUbJadQcDt4WBP7J/qi4fi/cxxRRokxQj7LaF?=
 =?us-ascii?Q?CKmPD5b1pYXtYNB6LyP2UCc=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f265be6-0123-49cf-5819-08ddd8b55418
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 08:59:06.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Om38YZ876qbMBV12Cbb5J1EqfafCuPD18z1Bp4nIFdh9Fv0mgPQWzoOgpeZqWRrIWuVsBTM2bJzQMcNXLEPjt3neVz/4IgaUIgw7pJydohEr+esZJHybSdfHTNeubUdb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1716

From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Add bindings for Omnivision OV2735 sensor.

Add MAINTAINERS entry for Omnivision OV2735 binding documentation

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/i2c/ovti,ov2735.yaml       | 108 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
new file mode 100644
index 000000000000..bb34f21519c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
@@ -0,0 +1,108 @@
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 92e9d8c7708f..474eefbd1363 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18471,6 +18471,14 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
 F:	drivers/media/i2c/ov2685.c
 
+OMNIVISION OV2735 SENSOR DRIVER
+M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
+
 OMNIVISION OV2740 SENSOR DRIVER
 M:	Tianshu Qiu <tian.shu.qiu@intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
-- 
2.34.1


