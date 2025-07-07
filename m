Return-Path: <linux-media+bounces-37030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B517AFB6BE
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 17:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62D3B7A75C6
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F672E2665;
	Mon,  7 Jul 2025 15:03:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021139.outbound.protection.outlook.com [40.107.57.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96FA2E2644;
	Mon,  7 Jul 2025 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751900579; cv=fail; b=dodoAumqHLByRXYas7acyeeBhFMjKEv7/ri+N+ojXp1bywNiM1+VTcDT1Mw9mfHXLVQaUOcD8zkYb7W2hjlKz5buopwWiMy5EHNo1HvG6Tpv2d5hrlmBmGL1VrWzEOhgFDMu2016Tez+39nIstR6fLy4IZxMAXsUzA/CEusopUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751900579; c=relaxed/simple;
	bh=OBmrMWvhi5gUbahpDdDCyaoYVaJIuAe5nMr/I/F/IHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MnofEBFn0uNcWoLoyMQHKtBO25xKI8YUtmRnQBFd8TcwY0n8B9TKf6sOdLYEW2hL6mtZzolEznzNY4L9VsSjUYKKrl0A4dD91AMIhEXqJbb8KoUiLA5wlaVxijqbo5A5CPNJDhq+vz7WaMtiXQhdLjKDQPYftdhprfvFn8cqdgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J57TNZ462S7fJ8iPOZMDH6IRNTRRodBk+A8lgxFLOCqPtkisMEHUPOCuSFu2AkJuIFjz6DJFj6mKoq8H9RW/EuRnPHRt1qBCUDgoJcmPwi97kG6qrj7/06Q5HircZvqFIYPECsKGy+FEmJKUEcHyZr0SqK3fW7OyAN6RRJg0kSOwA/axKb9rwqAQ6aRLQVsvQJSI34moLr/zgADgsvqBHpoRXkVHWfADIuYLxoXxX9iVf4Lz8kaDuFOodxIL6GS6tiO88dZuCXQT+5AsVR2YMjA/UhTWxH4mic1LKT2/3mxNe86krCfn2pw5n+slkyv+bXX1x6WNSkEDmRnfeQwOnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQK/jktiXTnFH/nfZSFNm2UuQ6rHx8Jo2eccE+aJxlE=;
 b=BEcj5arFu7S0e5yUg5/HUpktkkdg/wmTKWtLTRDWu0A5Go8sXUfvxbQf7dUdBFv35CppgexdYuu/bNwgChR0jhkowa2Hh20NjfJtidC3/+KxDbA+L00Bk1zwvNTPa419aN+rK80dPBr57Rd18vd4vXSxbNIp29bJhAIub8LojAkRSC+TQ/OKZ6/2Yc4l82QwoFtwf+Q8OuL6XWYxPlxCM7oxy20keG9yZAIMp/8Jen4dU+HotL7MOpCYAxW1XePrygdwC1hDdMYQ8UrLTbTz96xz76Nznq3hUj2MW9+n5LWip9Fexztc4vtwaMGVkdStV29YyTEwQxLON1UGJIKOSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB3511.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:144::22)
 by PN0P287MB1222.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:182::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 15:02:54 +0000
Received: from MA0P287MB3511.INDP287.PROD.OUTLOOK.COM
 ([fe80::398:38f1:cc91:ece8]) by MA0P287MB3511.INDP287.PROD.OUTLOOK.COM
 ([fe80::398:38f1:cc91:ece8%4]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 15:02:54 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Date: Mon,  7 Jul 2025 20:31:05 +0530
Message-Id: <20250707150118.20536-2-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707150118.20536-1-hardevsinh.palaniya@siliconsignals.io>
References: <20250707150118.20536-1-hardevsinh.palaniya@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::9) To MA0P287MB3511.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:144::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3511:EE_|PN0P287MB1222:EE_
X-MS-Office365-Filtering-Correlation-Id: f5cd9221-778d-456c-bd21-08ddbd6759ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HVedjax6/K22VgmrHYcwqyqT573b/03X/OeEP/ib7SadICflfM6hrNTYbBPE?=
 =?us-ascii?Q?6WhJ4EGqxccfFz2R4kIKetvKEeD1qXyrEKDkxm3YuJqoOuBSgj15TOFv+ku7?=
 =?us-ascii?Q?6FA68swxVLDlXf8VI/uGey/2IltmLL8JR+Y1fu53bMALtUoVbPGO7GkQnMxv?=
 =?us-ascii?Q?AcsUTWO0wYdCLJm1dus+0c4GchpveBma3sxNISgwCAMNQJoCU0syPZtlLNxq?=
 =?us-ascii?Q?1O8VxqdAWoQaRvnFFh488AmcEGirgDP53w/pnW1+ERroKQXH2flsKtUHG2Qe?=
 =?us-ascii?Q?KpWQ0Bm0tjpdwMEZ8zE3LVh+Rpo06IbFCnCtm/MadiGKbFOAUvLpuOhZ7nUb?=
 =?us-ascii?Q?ESh6Xc1R0ZMJCLHqJonwkB+tVI3xjNIBJapa3cSnOhmsrpapfE+ho2zkgJZB?=
 =?us-ascii?Q?bzyUl/9IMLYJcedsUS4zlshF3y2ZMwkbK+oRoIembNdfWH0Ya4b9x6NX4UVA?=
 =?us-ascii?Q?OD9SUQ9kVauzC5Y1yoJFynNWkR3NHtBAn1/mwVa0uDQrDdI6V44+MheebJzq?=
 =?us-ascii?Q?PNHvkuXAQjTlIgLFo0nbBsl8DFYrpLoTegTF9SdhJoksoNbXz5OggjU/4J95?=
 =?us-ascii?Q?RPdHWRTbmuI2HZkd7WsjG0FiTKNXxRYoDk7JGTFiZktSCJtulMQH9jUA71V9?=
 =?us-ascii?Q?mP8yxYoWOnWoALpkOjvQ4ZDVNYht/iFUqNnUAoRNNEQqjgtcMvH5deI2iVw8?=
 =?us-ascii?Q?HStsOST5D9kFP+N6BO/RYrPassprCvmDyaJ92Wgaf5KWLYTCHXnd4s0Mq3k+?=
 =?us-ascii?Q?VJyKv2JrP0oOmWeQY3g6IaWi1CnBAAWjx7oDXu93nWNxYtNgSEwKlLrmn5AT?=
 =?us-ascii?Q?kYwjcqf9IBRRhP7g4q4B2phz6ovIDwBnzbXCkQdK4YfFkfOKUw56Als991gE?=
 =?us-ascii?Q?2PvTOTMFJL1mx9jEx0VAvyC9lNnNoLBlzpDlLzv1L/0Oa8BUEpqusaRiNGTP?=
 =?us-ascii?Q?2NfXFGWSAxco7V8LkfEBym1ZG9liBa9M4vGr5tE6Ttk1AjKeeC7iyuPaBNLb?=
 =?us-ascii?Q?5BuCbpnq7oy8ifmK6YcNXoqMaGleNZNZ6xYNl8VbwCUbCVtqJjCs9YFKwHBg?=
 =?us-ascii?Q?JAyto8XTiHa98epU9y24zVWmZ2/6rxmY7gM5oNdgAwc1TAmjcx8YBZ0lf8Vn?=
 =?us-ascii?Q?uw82uc7GZg9Ix5nz4yJge38I7bSg51pKOrZGDHH20OWWgbtf7OqmXGK0IR7O?=
 =?us-ascii?Q?3imo3dDfl9zHeL9z5QfZRRJpvApA1XfQ5dOKa4VIS8Ug8Mmfww2VgunEEdXW?=
 =?us-ascii?Q?znB0aeF426eQWa68EHT3LnfOZAzbaWX0Z0uouKnqK13iJ1rhez0rIChl37jM?=
 =?us-ascii?Q?hko6x7Ikv58bWUqwL3ftKLWmA8IHSNbfnyJNBQm2GJskwbWWMCe7R609+Rag?=
 =?us-ascii?Q?AWw7aWDh4EJh84d6FYJX/aZpeTcw+1OcKCS1T9KKBnQNCfYaryEaGtnT353I?=
 =?us-ascii?Q?RwK7LMz+oV8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3511.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9y97KCXs9tibY9TPnIPnlxwAep6oxLYGHfSADHUHMt5q1JFrVapBibvvIOa9?=
 =?us-ascii?Q?mDwiT2rJiP62W9wBSqWTe4B2ntAbMiSTanoxKGQzyW5oBC4LeP7H8B6lk1bK?=
 =?us-ascii?Q?ydxl/P4sp6KRdgLLYU7vIoBnU/pUqnKhhjBm4XG+VOHVFOeHFnwGEHda1eX3?=
 =?us-ascii?Q?IqGbKJfPezZrOvG43t47SogE2mO6E5Om3Kf7Q6n4vvmBmTY+5P9/ao6nzbI+?=
 =?us-ascii?Q?RcHNBprazxFiz2ZEPIf96bsZOw7mvzTyYYc/qXdyle8c7oiqKlT9arxfFVui?=
 =?us-ascii?Q?8KJ/9vucV6rFNU8aDl0hhNmjouRwd+r8hnFAi2P6uB2/0BA6MgbcK6sBFzrY?=
 =?us-ascii?Q?6V8dcFHr2gd1RDPN6975N068zeZm+TRkdOJRvg+/c851rGJoGWbDkdDEBbp5?=
 =?us-ascii?Q?5TYAbK7DG/y4BxxseZxjGSQPUsgrIe2jwZ1CS/Icr9HQSevemA2hgkKtqFlf?=
 =?us-ascii?Q?BSNtFm1O9/IMT+4i+vOm/UDcKkNKicg8dE5f2IdxGEWCcXgeZgqpUdU6qtRk?=
 =?us-ascii?Q?zExMXU8g44bnmu+8d1870tVgW+YNjZIUY/qWd6YSfk602VZXQgpeRP1/Z74a?=
 =?us-ascii?Q?m9qBaYtCw2y038fw3Ty+L04lZbILINsmoDhXnGOtLDSNcojn7ObDOAeEPXGd?=
 =?us-ascii?Q?hHRnU8yL3zMrIOU9Dlw36oXAMwVlwR5MaobyakMQQVZvQd9uEKOwkCKwe8r6?=
 =?us-ascii?Q?0dTyr8qABvkoFj0g3CGM47Sfzj4SJskzj2hJUTIEh7y0sO2Cjr3YFCdav2u0?=
 =?us-ascii?Q?Vcj7GFhG3D1l845BfZleMjuBLA1G1SXF2ie6xaVQG2FxGseIOkLWj3Jw5pYm?=
 =?us-ascii?Q?wr+pNMP6fnNWOav+1vIy5AVNJsXQj9LpKER01KfkSbTF3h5PWmCQyCgiWh0d?=
 =?us-ascii?Q?ZJ6Q1D+wSO1mSsRqHbVD7yx3ND2cy3h8wMf5Ht66sfue4u1xcwEG+Oy7N57T?=
 =?us-ascii?Q?l3HAx8W4n//6eW00TyaZHp8Wu6cWuzangBATS1Cp1/APea+XvqyycW7FCSIn?=
 =?us-ascii?Q?uZqQHUHJCQwtO+MwZiS5eo6TBgknOWgW2mayBL3sYRwTMFIq4nstb77nxzYi?=
 =?us-ascii?Q?DQ4sFJSc9t/C4GhC6iRiUfyXJjf+c8wh4WKJqK16YGGzTbdL8lPiqXy/9RCY?=
 =?us-ascii?Q?VJj7FhRTxlsolqY1vx64lrRWLUzvj0I/At7fBjZ9kTwn0hLMuQkh8sO22Frg?=
 =?us-ascii?Q?45cZgVCUbOE2jERRaaztkiOPTQvnbIAx7oA4fI8o5Pi7c6ZcZhHVpxMbYhks?=
 =?us-ascii?Q?sv7bxgo4MjPRvQoCQhHO+BCa0phOj/HgpCUmK16Bq/L/pHIzUWm3+Mes4h5U?=
 =?us-ascii?Q?zapS7bfBOmIus/GnNqdA7oDigG8aNftlVHm3g3KrHQCB08Jxy2gXf9GzydZv?=
 =?us-ascii?Q?nDzec/9L8shSR8g/NOkusnFIOUdgoM7n+uYwSsbFEv9dKSpFPM4tSSDkGkN5?=
 =?us-ascii?Q?PGYGPl1xiNgKKFBW/+qDfw9LLTyInzKnS+mqWcMnpPeHnuAZQ+ij88UdW8Ye?=
 =?us-ascii?Q?l6Yyr9R8KfPdLw324pFWOj8FIC1A80+u5l4eQL/YZzcK0GoJ5yBiNmk22GDb?=
 =?us-ascii?Q?tGVj37ZscpqVRqn4ztzlMbXSrhkyEeQ7RvWCtgrZK2gJfcDC22IJ8ZDXq3EM?=
 =?us-ascii?Q?8W0fSJx0OLo8WwuLnGRAZ7s=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cd9221-778d-456c-bd21-08ddbd6759ec
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3511.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 15:02:54.5824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTSxIVqW0i8PhY4MAqttu/9HV/6W8QPgYiNE1X/oar/MR2CXdkidrMN3Vkm0k7kHowdUzG6dUJykLnavVlI3Ut8jRUS/wrtYo+/Z5CTaXMWkzgoGAPwVoCm1mNoiVr4u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1222

Add bindings for Omnivision OV2735 sensor.

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
---
 .../bindings/media/i2c/ovti,ov2735.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
new file mode 100644
index 000000000000..a6be7886f4d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
@@ -0,0 +1,104 @@
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
+description: |
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
+  clock-names:
+    items:
+      - const: xvclk
+
+  AVDD-supply:
+    description: Analog Domain Power Supply
+
+  DOVDD-supply:
+    description: I/O Domain Power Supply
+
+  DVDD-supply:
+    description: Digital Domain Power Supply
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  pwdn-gpios:
+    maxItems: 1
+    description: Powerdown Pin GPIO Control (active low)
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
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3399-cru.h>
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
+            assigned-clocks = <&ov2735_clk>;
+            assigned-clock-parents = <&ov2735_clk_parent>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+            pwdn-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2>;
+                };
+            };
+        };
+    };
-- 
2.34.1


