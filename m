Return-Path: <linux-media+bounces-40617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9B8B2FD2A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C47EA627126
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20653281538;
	Thu, 21 Aug 2025 14:32:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021108.outbound.protection.outlook.com [40.107.57.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B713287243;
	Thu, 21 Aug 2025 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755786735; cv=fail; b=VOo2F4hLOBOTZ2tjIasqILWYXRunOH0j9MzuZVyw6C/vt84grWKFvq3OtMKtFzkR+ZUMNdYJsFL4BQM4rpogf1c4+MiUMEb25JfG4zzhExrslmI6CPpGmA/5FbvL94ZH6y1DJRpbcpzAbADz0fCg49TKLsSSU4G/zJ6EBzChWUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755786735; c=relaxed/simple;
	bh=jr5lp16Byqkn3XmopsMph8KlenM0DbIzdn/3mF/XjuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BYvEE+4mhJp5JLLzSceNossnHRZtZjBGlaix/rT7YvHuODcKJQJIdQVGJfZt17Oq/zNDjzwzZx6GR+Ek45Kt43MODOIssVKNkch8hjJWQGXDRPfXb6MlcQH/5oI5UGNcAt4XIp5TcVHwEgDdAbc2v8guOmuIdMQYFE5hy9Lmuvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIoj9ax3N+GZA4oeAvjCZTRPKf3V+JbKfo1uKdFPhOotCRTXDBxAxv+DhHgwQQAtBhlMoY8KqKXmHDDKKPvUgHRU6cCNOmJo6S+h/g5ekPsl+GZJrKBNEqMQwJ8yMX8q0v8+GIjIEywpZbi+rCpyU0efZq6lERvX2HUMGJwbPUx9F+EiWyjR/Ta6hWtDkKpeXoukySODPOBP59vg0o70G4LgsLIVZ0j256QqVs1CYn2YKg+Fo+fiknVf5+grvqXU/sVIdaIQE0aQQ8JOhprJKeL2siz3YSWQIHwxkj6bmS/wqkp/AiRru1lo+GDVNVjQ0uf2cGaRcSSbuQNpzI8jzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRwBmvmZcf0SGSEbKlgKOXEUoqe5xk7PCdFYgzxXM1w=;
 b=F9gjbb2ctrRvpAsNn0AVL8PxXW6FiROOsKkc7yiMCxA4yjm8H55ANMbOn1eH4RHIRtx6WSS1BpGNH6Tsjz3eBNtisMr3hpQG0gBOiVFLsZz9//TKGTsINsG4oo1tSaaTwf2K+P74cXVagYmuprT3qtuN59CHJfYopdR+aFHq6gYtlXGtoeCFdoys71uqTn4A1ejDjwUUyyie00e0Wtv2/uWABIvb8gqlI/93Ep1CFKAq7oz5Cy1SmEF9pXYH+4jKx58ZkSzzdtBXDesN0BE+sRyYOY5evLh8/9tep4F0/8pl6SL6BbSg+xK8Veg1iX9EfM4IpBIxJ0MPRlLI4s9V7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN0P287MB1572.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 14:32:09 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 14:32:09 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Date: Thu, 21 Aug 2025 20:01:12 +0530
Message-Id: <20250821143126.319470-2-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821143126.319470-1-hardevsinh.palaniya@siliconsignals.io>
References: <20250821143126.319470-1-hardevsinh.palaniya@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::16) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|PN0P287MB1572:EE_
X-MS-Office365-Filtering-Correlation-Id: 0421c9f9-fce1-44e6-bee2-08dde0bf82cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ch9b7LL6LEQCn1YJu2VrvrDzjeqg/637MCCbSNSjo+p9YdbBfNayxOGhwSy3?=
 =?us-ascii?Q?O1q9qjbk8+8Wk4C1orXoKt+y7iMe+IqMAQmoRe1/BtdEDpEU3W+dt6gk53fu?=
 =?us-ascii?Q?xjIbMPIogsO3XdSz1x6b2ok/RX6z5eg4pOa7slZBrvPOf9v3wS/KVDHt2qrK?=
 =?us-ascii?Q?qMCufX6MYpi1VzlR+zxNXyIkfJfiPV+RdorhU9PCG+7oR6285W6XGXJCBBw3?=
 =?us-ascii?Q?7gaUiy447UPF5UXZAZypb5w1G3qJ22JAaktUFd2VL8AstoqbYHPC0DDfnTuI?=
 =?us-ascii?Q?8eVIzWGvY8occp9u/124eogKcefEIiBtrZ07JsglpR+29UDKyao2ffD+aUbq?=
 =?us-ascii?Q?r9YbaxQw6R8t2MqjxIJR3ofOJhBQgVWegIVI063akl7QkX8se2IgyhE4H+Qe?=
 =?us-ascii?Q?NUp6UyTWq90WQoyaFL3wZFyMMW74ABiWucfko2PArw33voEMUC7I1cvy0A+a?=
 =?us-ascii?Q?lnHbikFcxq2i/SCZZC78530G5urE3xAUbdpP8vAy39JrR+kzMJMI3AJRmwYc?=
 =?us-ascii?Q?DJpkpd5efj4CJ50TlZWF68uEsYxoN4dwTSTTbWH+Vz2tXq3jZLTo3CIi1h9a?=
 =?us-ascii?Q?4rhDDgFaWDxaLNjPOcAeLse8sb7hSE280F/9NdhW+ZlUlgpTPIdIzqhUTNO9?=
 =?us-ascii?Q?BHxNqXQkxFdb+q/sQr+oE6kfEfo/mv9WTy0QMhecjYKKufuSnh0ZiRcChUwV?=
 =?us-ascii?Q?2K5fMO738UqNT94ARHUwKg8RhUbinG2qw1cs/M+tLpySah9UfwmCXK2iBhHc?=
 =?us-ascii?Q?ufEjRIkRT5YvxuzDFd5bhWuXWFXRNgqjbKAzmNCmxNeuxHCVNrKyXuxPSLRD?=
 =?us-ascii?Q?pXgSIz659bMcoGaXqO3cH4H60dikZga9VSqWw1kzzGxSeFf8g2EcYAn4DSc7?=
 =?us-ascii?Q?euBr8fgrOoJQAbb41vC917dQBqykvf5t/8YWtNp8ubwEnqi9PyRuvKipzudO?=
 =?us-ascii?Q?tWo8yRyxi335KeJ4E0lwjuSJtP5Jypu+QzGov6aVXLtrEtRuOYPUnqKGcIAG?=
 =?us-ascii?Q?bhktKW7LSG/MJGCDc0av0vY/yuB8bGO+snxmY1E7TCqCm/n610hrkrLJ4bgg?=
 =?us-ascii?Q?CHFW+we++TMXkCB4nTIF9tN7Wfyxix9vIcVlEStEImprmWsW7xMVBsL/BAqm?=
 =?us-ascii?Q?TX8HM+MFOiyv4rOGVgefIhN4GoBge16oleerbGxZEJa7TM9dDUHopC8OLQY2?=
 =?us-ascii?Q?cNYvkw5rzsHDQg8Lox9MQ4qv6X1Qn1OavNIJiK9vqaKoADbTPgibVxjUFrrJ?=
 =?us-ascii?Q?hkUhRBrXnQrganecrdQCzGOWnJ599HOMmQ4de3s2qR+nJiiVLVa7UeSNHE20?=
 =?us-ascii?Q?m43rS1wbcVE0TU07tR+EcxtH9wTPz890yIB4m32zEDC6pMbeWrnN7uEDIe/X?=
 =?us-ascii?Q?qFku6i0FV53S0JlYfBMOUTU6ElqzvHKfdhPwgi1MceaifY4YT1qOdF46Ljcg?=
 =?us-ascii?Q?B3j0qIRv78E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wN9aMzvWFewSZe04rEwCjXpDlNSwCSdxY2R0r4deqcOuaN8LgClKWTChuqGa?=
 =?us-ascii?Q?/zxqXvs7LxYO8K9i/zcHjAiACeEFQuPJrM32HNZa4WR+hSalvGpU0IhDdtxS?=
 =?us-ascii?Q?oYt/6uaC7PqSbhIIEioxTsK1kfjylawO8QUl1fI8oU99mx+cxEe0IemebAlE?=
 =?us-ascii?Q?MbBkRtjkkZPmqFkS1Jr2ZQZOVtX7O2E9sqE3p+8x0wX8vQMPiKuFWBLd1VyE?=
 =?us-ascii?Q?DN6vatMR/xcpXEgdhmCjiMOq07hGSbU1m7pBCy2O4imkMytc+TRgoCSbHdb+?=
 =?us-ascii?Q?hDr5J5m7KqoezXdejlHGOCh0M+M/k/PLvxWSQ1xsWOjDbph1UrkAwPnjT8Pg?=
 =?us-ascii?Q?eUWf33XAwpfS/AU0Aud5fwunSnE32+D2H92CFAlwfafZY212vL002MWre+Td?=
 =?us-ascii?Q?zVG5o7NaWD++Sa0nz45AYe4DttwVKI9TYY+UWhB4iW991TDkWRCaDii2sySC?=
 =?us-ascii?Q?qnSaZrrJrPMqSpB3lCDZlw4Nc42AQB82xBQv+z6DKXSYx49JMuALG0ZiSutI?=
 =?us-ascii?Q?NgAXG3mtb8GpvxrxMNn9HxffH09HbXsbISTtdJQz/mV0EoTCXAes37Qjauze?=
 =?us-ascii?Q?IszeCkU8gu/V6WltEkCuEeCOaQqvjmondE7t/KRH91jvMfkGtB0HEcAFozUI?=
 =?us-ascii?Q?X207GmQZeXNtdGMoL8rdqmMzJa9lt1kna0ugYBS2SpJGJR66bjyIaHyvV3aH?=
 =?us-ascii?Q?UZOKlUnHKUu665xl4AF0MJGLzQCktZ7PclmG/IUWPH9gUdaKJFdVcze+TDtk?=
 =?us-ascii?Q?G2sVH1jaMbSx5mqtjFBAhxZwpbzB46pyXsOaRnoFKZkeIJ5vyuo/ispNL6jA?=
 =?us-ascii?Q?2V2UZrV2nm+AoKpgeb6QxO65VIsZR+NK0ps+UKYCHMQhivWGoQlYLTZ2756S?=
 =?us-ascii?Q?LT80EkNLcDjoZZGbc+BAnKlnIoDH/3N4toQ2PQcDLGJjdiOO0sfKxnc3rTRE?=
 =?us-ascii?Q?nCzPBT84lNvlOcw/DF1bClHJABsakvwA8N/Oce65GPekyTsAcEt7pa24M2FR?=
 =?us-ascii?Q?ePWAgXf2yMwKwXQwN9HJ43V07J7mghRKMYnsKS1BNngbHfOhREK0zpZ51FsC?=
 =?us-ascii?Q?K5NuLpGmAM/TLNj9dPWiMh8zLmgpWivBF+nM2fkItg1ToI+V6mHBDqMHAGwx?=
 =?us-ascii?Q?ePntC+umrOLjDN5sFYmRsbX6i1puWDmg8OjHBtQ5wzKGmd6HIIG6Zo+yFYQH?=
 =?us-ascii?Q?Pr4WQXlQXwFMnyM4EcS/jn6YG3H7s/OuI9Ywz4HUrsyAtgN8tq6EcVgegY8Q?=
 =?us-ascii?Q?b5I1QVKf1Yg9lprzAEZ2phvpd37nVMgSYPBCzd9IeT7GnQv3v8IqGfXaXkBu?=
 =?us-ascii?Q?sPUPBTxw5IkiMTLOC2ts49Tg3rzHZINsjcz01inMOYOv6CflkHSrO//2SJax?=
 =?us-ascii?Q?Lf9SwZNo/g3kmPEHLvYMwbrP/Owbln2+1QOmGg4D85jptRKDC/yBmYj8I9TI?=
 =?us-ascii?Q?UREj15oDDdkM1OFdEm9n+so+yznylws6TYoSgj7L/uyfhyOIEGUUA6+P4I22?=
 =?us-ascii?Q?OEjIp1z7ylCeHxD4/AnZysrn6zQTdHL7Padpez4nwpHZKyvm7rAZfgJBCiKo?=
 =?us-ascii?Q?wAeWp41eZk1TjyMpSATgUUTZu5nqTVQpoG5+Mk7l+Y287va/IT33XCtBBwdb?=
 =?us-ascii?Q?QF3uvNn0v0xkgVElLykPUMA=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 0421c9f9-fce1-44e6-bee2-08dde0bf82cc
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 14:32:09.5483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjnMAAP2qdXVgSqE5er+HlsicDj8JHinJwdxLWuJxlvgYuH+lmhHZVERqF9/N15648eZZGxwWTdIDY1viOAyysnW38H4zD7cWMxu3sQnTj48TsvM7FvKoJrGcIUE0c86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1572

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


