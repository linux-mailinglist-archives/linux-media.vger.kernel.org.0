Return-Path: <linux-media+bounces-30690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8A3A96463
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FBE53A45FE
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 09:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F2C20298E;
	Tue, 22 Apr 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="MWRei6sr"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020072.outbound.protection.outlook.com [52.101.156.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492A201261;
	Tue, 22 Apr 2025 09:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314304; cv=fail; b=j8768e0g0rGPC/3G+syk0NWwP4qbCFFEPBhBEti7Vkd1O5Axw+31ejc8YrataMMs3r074KY4MAq7QdcG+Q0SSOkTmKs5GrxMdl9nBrN23VCr3kNujrzoKFcE1SkyK8Nn/9FR37BwI9dV+Bz4VM+f6kefxffEK3llnwLIuKqv0Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314304; c=relaxed/simple;
	bh=OfkLTy0V+UIsr/PO7gQ+A+97PibiYfmCaWIvBaPFFnw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=auaa3JOl0Ab8F7UVHFaSqTcpOkl5x3T5aPAXL7+PXn9cIEx/D7QS+hVNK3MktxLvvbISV+lHgzzCDPoqjfiQAOHTygVPCyCVVW3Q643xoCVvpkpprhNTUOzVlE47etcfbeh8W7dN9237PVzgqGr99secjGZdnnonl6rGHhXW/X8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=MWRei6sr; arc=fail smtp.client-ip=52.101.156.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PP46BE8Z1jKK5Q78raQurDqvIl3Hox9kVnwy/5pAaZoKnObg8J+F0r27THXaW0LI/5opsr/OtAg2MD8C9igqgi5FlxzCj7qPAWMflLElKwYNP7VGEUtbRciumu/wNrB/LLR0iE4Hg9Z4/ktSEg49F9pv27BrlqNzL74yfVnXMiS7UNDYdKjDv4XkXozz2FIp6DU5SySl7qVUKaNx5k3piFQsI9MDE6dLqXsnWucTpR6PC4ypZnYgxkT5YX8A4O7JGh5LeAS0MxWNsgQeFtiX6AqsBVwSy9Q/Njr04LAhrSdj6EyyQeC1D6I7So28Rj8SNf96aVu4o8kAEw/+sBzH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzHiVRtInlsuqGCTHlfDkO3E/QNASDn0rHMVW+MPca8=;
 b=M2yLlYGW9yPzQ8hdpoxLlrNdTRpCfwqF1rsY3JkLIvetUTD4kA7GfFXjOLac+DoNkEvWdJozs27rMmylCkEzNSswwg7Z3yzcF8wYv3FV2thnSnVUc04YEzDmw1j+qxYLLbR6OD730MZ9a4YxYwsyTzdpCXDYB6VEd0+UmywKHKybCLWZ04La/LnOI/gNGEc3tGsMu0TgSdzhvFyWwI5R4EOSHAlpttMiVouDKe75J5umPDO8Sf6LioaxYQsbuUIP73fAac1NxgULRbwlvgcWOtJ1JYgkeQDaWTCaHHP9IgEsg5mXjrEP8JcK+a6poBPdl9ipNIf0MFM72F9OzFxGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzHiVRtInlsuqGCTHlfDkO3E/QNASDn0rHMVW+MPca8=;
 b=MWRei6sriHOz3NAUFYywfKZtfVyMQbXTBnlfy1cXqWjQTTerFLa80dFXKoJXzZlbsuYHnFl0wYm8B26sJZWQd67scb7FvDrJuAJVtTzl9oPe8WzwSbaVY0+abkWuTE2q0pQHu0Iwk+uj0PigYY38GKd2Y8V59Hb14F7a96a4870=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1521.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.34; Tue, 22 Apr 2025 09:31:36 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 09:31:36 +0000
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
Subject: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec device
Date: Tue, 22 Apr 2025 18:31:13 +0900
Message-Id: <20250422093119.595-3-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422093119.595-1-nas.chung@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8330da40-1b9a-4180-1be1-08dd81807a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ruiNrrgMDuX1mgKJRwpIFKbgTW+BP5NFPdn2LR7O5BQhIbJ44UEtWwGGVh5W?=
 =?us-ascii?Q?oXcxNt58Q/eydey7WzLuCVQwQjKRDrmLVI+2yzHSTbAXx9t/JiCxSX2y4SG5?=
 =?us-ascii?Q?fDs2dpXNHlk0KolZP2ThCteEHGrrBXx4sFUqZMmIxFUsRNipX1wnbA0FZIKx?=
 =?us-ascii?Q?9U/3EShu8x+r183ooY+JzcipkLYkyJbzWCuFo3mOalT8am0CoRvaAhzwFHrV?=
 =?us-ascii?Q?cLZ+gd44jHAjePDLxwj1UsIFI1DgH10UU/EG52ZH3ja0ddqhsW22BV20IIga?=
 =?us-ascii?Q?fWhJq8voWcvZZ16GwhXBabP3+pZfGpSwbw8fZUaGITiyrxDlBbYtngPhprNx?=
 =?us-ascii?Q?w37pSL5RiJg2vq49KGAdVXQRhF1p0Un4FHbeXwdnLIhlOHPx+Ol7eeDR/ncN?=
 =?us-ascii?Q?RvgwLGq4QsS0oiGLN9s6cD5yTDVS2z8TZaVel5N9D1G6DghhIrqEuJneySVv?=
 =?us-ascii?Q?DjMhZee9YY2J7ZpbfRy0ttOzy3s9dfjvNPclLm8XS2TRQ/96/9AXUPWth1BL?=
 =?us-ascii?Q?cKzpNo8kK8EfRNIa+85p0feob9t2AsDTnlVt9c7YSkHLkeHaAHZRdEPaenFB?=
 =?us-ascii?Q?Vubu694lFn13NA8mZKVBufbkCKuTRovxonTWOkhmkgCPwTWwTH+w3mZaUxzs?=
 =?us-ascii?Q?MIJcnTA+US11947YLBcWkDHAjQ1QcQD7iCVBcN2nlQxBU34DWLcp1CPitV+q?=
 =?us-ascii?Q?JiXx3yYKgrnGoFRDydcqIq0C1l4x6Db6xZfzdWQ5hcT4r9GRm6CSe3VKCs7B?=
 =?us-ascii?Q?S3wigw8y/W+8Qg5PgCc9vjIiQuwBGsa+0tkTKEgGCoMStDh7r6O+tcPvlLIe?=
 =?us-ascii?Q?2Dj5Ual7DOigF80Pg/XudApM0hucyqc5U8oMTZcaNZCY626Vf2y43bttnbQt?=
 =?us-ascii?Q?PTQMAZhgXhZKu3PY1ybejroQJ1khB1hLYvUEMu2OrGT7y9l/EMMpYJ7M7xX1?=
 =?us-ascii?Q?aIQtRXKigrH4Wu5KekPvLfekPGDWhZrXf7/8YXEzViGi/9nS+srCxq2IvyHF?=
 =?us-ascii?Q?2KXOaLJpgJ3vVCM83hPm2T44KTESY4j52kQtFbgU6VklhLIP4Oem7HzNyVDg?=
 =?us-ascii?Q?SsUqJAMo27dvqK2gFac15WYY8t4oqUYL6PEos43V0GFSmv/hgOFJt7MxJr/o?=
 =?us-ascii?Q?WBZTx6GxROcdADATeMP6oECidjPP5d64habWpP0JlOFNlzace/EPscUTd7hn?=
 =?us-ascii?Q?OYvrCJzxr9GCdnyy0E5sG2Yx4swQgsS9ruIXfzHPS6CN1RJ0wQWQUuA6jBL4?=
 =?us-ascii?Q?66w44n00eFRcjXjbbatHleb/Rz5RhqqhXmcsR70kDyRsVMQgrd3CjFCvsip5?=
 =?us-ascii?Q?fzWvyFUS/YUPergxPTreISP7okcgT1KS1qDaxfFqI/u+ItNndYCouRK9RjwQ?=
 =?us-ascii?Q?GCP1D4b5SgQS7GGQEXqmw6BGJRscpQMZiKCE8zaGL1H4F0iPDsrl2HZT7Eqn?=
 =?us-ascii?Q?fcAVDTgaIbs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/IMn50IadeK+7mfWDECI52JqOz7I0iLSW+MRGa9eKNdPn8NwFQYMxQiv5cNL?=
 =?us-ascii?Q?0E+5ka0iYarz7BPXXaMsVI3f39FV/7zQa3X8nKgi7cnT6eBnDbKUikbobXDa?=
 =?us-ascii?Q?8Y9MKcguHLgKiv7Yi4W6vM3DK8VuimPCgkvGyv2cFmNW7b7rRDoTNRzpxNO8?=
 =?us-ascii?Q?UJdrrwKjqg93AKeSdEy9mZr4dUR+FsNb6zMOhtgBZaNmIrCcUr44KxTo3Bkt?=
 =?us-ascii?Q?C3xS6GbVG4Rguw3ztPzP3WpUHbCDkJZnNbBNVX/l0mqPw6tN/Gd8I+IC1dWj?=
 =?us-ascii?Q?2xyyFyAbRQissLqrZhKHUzsxyd/go5M3kVC2J7KepuU+J5xZfJe7xQEoOgmk?=
 =?us-ascii?Q?rfwyKcSl/bP/mxHTuoEfI6mhrsGoLHPakAMo/2MB9PQSPra7MZaLPqrRX8Zf?=
 =?us-ascii?Q?qUwYbK9kO6AxGTLRaBVfPw9yqRrH0R2YX5ByPgCSEb+hM1wdgtdo64heUXQ3?=
 =?us-ascii?Q?3o+OYxgCuptOjikKjwqyH2SduCSeq+JaJRCRGwdYGkgC3mHt+oYFEmGrAIP7?=
 =?us-ascii?Q?d8SsbuOWiZLG+iWsHAHmXQ2/6jsMWE5SSj0icYjMhpVSE5Kuu6IGEFl60eGU?=
 =?us-ascii?Q?XGJXKUEYKNZ7S3xpIV0iHXGmd60kjoZPMzrIPB5CZ+FPQE61j0EZ7LX4fA6k?=
 =?us-ascii?Q?sT4NGEznzKL0We5FpoCw6vwCakxQE9YK64rusB8WJrtHr4DbYTrcm/fyYbB3?=
 =?us-ascii?Q?uJDy/OjvHBEd6h1nzw1ja05V0VwEGGt8FKNdRrRWxJloo3KgveYeoHCm5FQK?=
 =?us-ascii?Q?6FbFGmSWTN/gKFaIr1+qrIJByW3Vhg5F92aIv5tiY0PnmTWDWRbtQN9V2g9O?=
 =?us-ascii?Q?mHNXa8DDZkKbhOAzDJAx9bzOHrii6d51Ww7hBdCKbO2QqpALdfZ1Lbhnrltx?=
 =?us-ascii?Q?dhK9+yxzbB00uAgBkj1S31gm3vXBHKTrz+9yuUFR23v12CBHMQF/pwW0N1xy?=
 =?us-ascii?Q?4i7O78yBirjuSwzor81BJkCfUjSSh4SDarWfpsvxvHNZ7/nQOd3NZYTkqOtP?=
 =?us-ascii?Q?mlgxMqvlhKMb2uen1c/5RXCpqNlTKkojclnfvtvWmlyiX0yVUUiDtoFd92mM?=
 =?us-ascii?Q?EZ7ckR5BYbiQ9WsGJY75kfeqp0TPGXyidSwceE/jpqMvBXf0Qcz/Cd7RYu0j?=
 =?us-ascii?Q?Mjm+S0AwgHtsd6Ng397njZNMU5RC/UuYbq+aOZJwcfTA4tT1GvS/pf77KXAq?=
 =?us-ascii?Q?hAsGYk0BdZEaeZPfUT20a8iTvHcpT6WgEyOwH1SCUfX1WGYxH4L75sBpqHp0?=
 =?us-ascii?Q?tyDNIUP+hvpeXitzbSmMO9uFizKG3YNG5tlQsFWP7+KRegSk2gz7h7mTNHgx?=
 =?us-ascii?Q?bc4t2iMTIDHgaSOX9T0qdUnx22y3Dmu9IwpQmlI76U59pwOBZQ1eIFlyCgtD?=
 =?us-ascii?Q?fAJi3K7ysYg+NWiH6zEr5Xh0VKomITyvdFMdRYiw0hNuFeylN/N4jHKPuqGG?=
 =?us-ascii?Q?c5QsUr4H0kgjETbWcD/hEG3GxLMp2uHWmwVVDLrrLKLcnIeh3R/c8mXh5UYO?=
 =?us-ascii?Q?cCNnq40mSFxkW9A4ihmvj5VB8eHMLiJGGHIVbcvZIEUN57vhJWCP/jYNJ6p9?=
 =?us-ascii?Q?ObpcQ9dqLjraPwEZx3ErquaWjRKVSUr8xDzZ56qeHT/H1haixeDLuzKfDq+U?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8330da40-1b9a-4180-1be1-08dd81807a1b
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:31:36.2713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBnkdIrxryLtfh+r3JL4hVhecm4iALQAJGgjiPQqy9WFCK+XH1zXZUXAUGcN58Ks4eeW1hUvucRxrnCIPxbc1mtRH+oUBET5T2UD7QmzjHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1521

Add documents for the Wave6 video codec on NXP i.MX SoCs.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../bindings/media/cnm,wave633c.yaml          | 165 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/cnm,wave633c.yaml

diff --git a/Documentation/devicetree/bindings/media/cnm,wave633c.yaml b/Documentation/devicetree/bindings/media/cnm,wave633c.yaml
new file mode 100644
index 000000000000..5bb572e8ca18
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cnm,wave633c.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cnm,wave633c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chips&Media Wave6 Series multi-standard codec IP.
+
+maintainers:
+  - Nas Chung <nas.chung@chipsnmedia.com>
+  - Jackson Lee <jackson.lee@chipsnmedia.com>
+
+description:
+  The Chips&Media Wave6 codec IP is a multi-standard video encoder/decoder.
+  On NXP i.MX SoCs, Wave6 codec IP functionality is split between
+  the VPU control region and the VPU core region.
+  The VPU control region manages shared resources such as firmware memory,
+  while the VPU core region provides encoding and decoding
+  capabilities. The VPU core cannot operate independently without
+  the VPU control region.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nxp,imx95-vpu
+      - const: cnm,wave633c
+
+  clocks:
+    items:
+      - description: VPU clock
+      - description: VPU associated block clock
+
+  clock-names:
+    items:
+      - const: vpu
+      - const: vpublk_wave
+
+  power-domains:
+    maxItems: 1
+    description: Main VPU power domain
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  ranges: true
+
+patternProperties:
+  "^video-core@[0-9a-f]+$":
+    type: object
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - nxp,imx95-vpu-core
+
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+
+    additionalProperties: false
+
+  "^video-controller@[0-9a-f]+$":
+    type: object
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - nxp,imx95-vpu-ctrl
+
+      reg:
+        maxItems: 1
+
+      memory-region:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+        description: Performance power domain
+
+      '#cooling-cells':
+        const: 2
+
+      sram:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: phandle of the SRAM memory region node.
+
+    required:
+      - compatible
+      - reg
+      - memory-region
+      - power-domains
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      vpu: video-codec {
+        compatible = "nxp,imx95-vpu", "cnm,wave633c";
+        clocks = <&scmi_clk 115>,
+                 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+        clock-names = "vpu", "vpublk_wave";
+        power-domains = <&scmi_devpd 21>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        vpucore0: video-core@4c480000 {
+          compatible = "nxp,imx95-vpu-core";
+          reg = <0x0 0x4c480000 0x0 0x10000>;
+          interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        vpucore1: video-core@4c490000 {
+          compatible = "nxp,imx95-vpu-core";
+          reg = <0x0 0x4c490000 0x0 0x10000>;
+          interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        vpucore2: video-core@4c4a0000 {
+          compatible = "nxp,imx95-vpu-core";
+          reg = <0x0 0x4c4a0000 0x0 0x10000>;
+          interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        vpucore3: video-core@4c4b0000 {
+          compatible = "nxp,imx95-vpu-core";
+          reg = <0x0 0x4c4b0000 0x0 0x10000>;
+          interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        vpuctrl: video-controller@4c4c0000 {
+          compatible = "nxp,imx95-vpu-ctrl";
+          reg = <0x0 0x4c4c0000 0x0 0x10000>;
+          memory-region = <&vpu_boot>;
+          power-domains = <&scmi_perf 10>;
+          #cooling-cells = <2>;
+          sram = <&sram1>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0..6ca159e532e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25523,6 +25523,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
 F:	drivers/media/platform/chips-media/wave5/
 
+WAVE6 VPU CODEC DRIVER
+M:	Nas Chung <nas.chung@chipsnmedia.com>
+M:	Jackson Lee <jackson.lee@chipsnmedia.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/cnm,wave633c.yaml
+
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
-- 
2.31.1


