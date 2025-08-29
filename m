Return-Path: <linux-media+bounces-41319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE216B3B6BF
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 11:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78745A03AC8
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 09:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE382F6572;
	Fri, 29 Aug 2025 09:10:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020091.outbound.protection.outlook.com [52.101.225.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E86A2E8B6B;
	Fri, 29 Aug 2025 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756458652; cv=fail; b=gwxD6hzpi3O7aAS4OsZQV2MW6Fg51ggBALdz/0QrjlrBnEmGXT9eqP4OA4oNc/mrphpQljquPW6RW3cnE+S7ocCR0x2NS06YsHAQ3GN1gwWANt/BAlh88/wjVrp9wymx4M57iAoaqoQaGG7vkbXdo9gLrPK57NCIBOMYmosoLr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756458652; c=relaxed/simple;
	bh=CDucjZNrv6M6FGCx5xs6suolUsrDeQjGDAlYnZNce9c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ietT8VlvgofwqCVM09G4lVf4FcfFL1yOak6ITu+4TvVOYtdz4VBORmFNq/bMOgtWmlVQrd1f/tzzW9EdFMW0NIbKGHyssZ15LW8+lk+x8ttwI//9EYEXuMHC1FVRdYHFxwHFGoqDBc9TgrG1KilXb9jHBj1H2mCt7L+j0hWcE1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzL8I96uX1wQ14+Bd8m2eOql230nmizSPLf0SmIiBSn67NKPfbgeehuoaUlc8fErluewJ0ufXT74URYd8KxTMxxqdsJOFeJrJMR3L3tEt3oWHcA0BPNMxoIU/XC6gr4gFE5cGJqldW8fVvcTuGDAtbWJk0rrsxxawT+c8qh3y00I5dxGndE5EaHqUdf2rx1ieZgQljRoass4c1SA1Q08dghAz42ZL6OZyKHHmF4H1r/AA/l/hYB29Jsj7cb9tiuAN7t9cQyhw/JhrwUxUO3vNnjQjGyv26bd06lHkBCd6v2dwXECw5GcLAhLY8aMFUtEJT0YjknmC1AnPmL2CR8hGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exxbg9V03EZS2QRPmocIux1xDUZIZFxm52GUvWcmP6Q=;
 b=FYoLox1DrfJOmYWfNqCCdStaJILOqHorBqZ8Y5QyqCLNLFWqFftajkTN1GkrYSvZub3Hj+dJ5hvZshlVgiUlx4LCTirFxXFJaDNQfrv3RaJlvWStHOknuIrrF2odLgZrUcyiZPA6N+r2Yja7oNg+tm8BX++ZW0cdD17cJknCnBUshP+UJ+gTDRymjMo7xVil3r1CmefOcagdC3EV8ySzPRL8K21ABZWAXb1JMTmYVVkWbeVK2am1OYVZ7WpPcu2TSJFAa/swjlHYHy/f1QAQn1RMLHmn2OHB6HcGknXvt/HAUEQ6IKI7ajsFwAiQWPNlhy+69Vzerlgc6C3FW/vrgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by MA0P287MB0801.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.19; Fri, 29 Aug
 2025 09:10:46 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 09:10:46 +0000
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
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Hans de Goede <hansg@kernel.org>,
	Jim Lai <jim.lai@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Date: Fri, 29 Aug 2025 14:39:50 +0530
Message-Id: <20250829090959.82966-2-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829090959.82966-1-hardevsinh.palaniya@siliconsignals.io>
References: <20250829090959.82966-1-hardevsinh.palaniya@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::15) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|MA0P287MB0801:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b39c356-2ee9-45c1-72f0-08dde6dbf08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PUs7C9b6YzWf/pXYB1J7mDcyvmlphx444x5m5mfbOUDwld26nQFX8LWEW2ss?=
 =?us-ascii?Q?ZAJHruVBYTcOKKRYDsmLoxXyuxMimjV4mjdt/dKEz+ne9X9yrDp1GcxoblVS?=
 =?us-ascii?Q?noVUQGrE400jwnp0MNi2hEwoJTzm+XjiKtnnhEqRqt5h1YiepC/MToIsNFas?=
 =?us-ascii?Q?H0p4FLm3wZvxtcwkoFjhTrJQPnF/Zw5KKh96JaKHVfnQUhBxY6DrPcvQkpYv?=
 =?us-ascii?Q?s3J5XagD3EyHSSRt4ABLdFJEFg1zkgcOKmtYGEoYfoXHZdvHTVOB/tNNKIjb?=
 =?us-ascii?Q?BI2l9cZwAXS+ebi0+3kyPMSbbF5aomLRDyemFfSpIRNYeLirPF3KU3x/wbuO?=
 =?us-ascii?Q?rbOD90A0VIFtKHjBRv0oG6U63mPlxWIWLAeP8ZPhyrAYM3x52aukFPHWXAhC?=
 =?us-ascii?Q?ZeiSoCCkTblfAyRAWSpRozeHA3JvLg0K7BF8sWgM/0bK3f63xT2ByMYlQAgD?=
 =?us-ascii?Q?zt+GiwjTGqtpbA5mvYYqjpkEzyAtMqCwu8qqSjWyYYYJ1h+J/WV1vEyzcHQk?=
 =?us-ascii?Q?eE+Kv+XaB0mqApsRIgtroxTyHeO0UKDGG+/Jg3snnmkEZmIQln9W2JgB6kS7?=
 =?us-ascii?Q?nnu7eURthsVxBmta2RFQDbTLmLJUXUHkXQUXfQtjp6JGgMvcPFMGsLA0HQN+?=
 =?us-ascii?Q?OOOmmLQtebgSi4/pmrd2Uu8WeYH6ElDYn9/sn5d4hk5Q4N20wFuhwGnkZl7w?=
 =?us-ascii?Q?945S20En+8uvsxLeH1YiQwbGZHdqRXqxoqqjSCQ4KhaurHOg3tjY4rXgA77p?=
 =?us-ascii?Q?eisTljWY5Nt8rZg51nEN5fnz+qIqPr/JTteEKLTYheqW8MHWdjQ+btdhZvA4?=
 =?us-ascii?Q?kYQuhnF4dcYfSi+lX99Ycon+0FLZJLAUIYfQAKuwp0BIiAGszdvg+2GZG1af?=
 =?us-ascii?Q?Rd9PLmPWpPQp30cwl3Ocx3X15s9UzoWQYiVMeqAROT2Ac62Hy17HrI/ag+2H?=
 =?us-ascii?Q?ZgupTnc+Hx2IxWTYABDoDjyItCUQp+8/lU2ldT+ZsmgavYqY0NO7m1eqhDU0?=
 =?us-ascii?Q?Sgm4tYI9yp2+Q+/Ht2Mbca6jm3BqivwegLuMKlYJK7gQh+vNofPlbKNaS+Li?=
 =?us-ascii?Q?tRlikAFwePs1eoWn9kvAArrd82/9/RHznVdAwjzBXNSXFnnEfwkS2W0XTlNw?=
 =?us-ascii?Q?aM3RIxk99F8pW4Nw9qtqmnpL+jfEdcHqD0fjRWanjxpXZUvZX4DFElu/A1Jk?=
 =?us-ascii?Q?9RycuIbCunrPqfUUPcTun58FWOuvo3iJaZdUDOSB8RBBfXaPxc3tNqjVbC3r?=
 =?us-ascii?Q?GfaecbyDSHJA2g3eTw4vHGcFZHpjWAB4bg4kJV1NyDqvlNaSpVe/uUldswdZ?=
 =?us-ascii?Q?qWLnbeKK1OvSHdSCNpVIBRA93NuVywAwGSfHvzdflensxbDYXtU7ybx8pbrq?=
 =?us-ascii?Q?UmifCK6w0K9Uxke/TMH4ZGTKTes7myove/Dn3GdRgxxRpW9zkVSq5LJQm6Ia?=
 =?us-ascii?Q?+PX5bm8g03k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dLL9MuWPIRKfUGHvjvNgAukt0HNOpSXjKNqmHfE/Kt4H4Dl6WVpfIyKSN4YH?=
 =?us-ascii?Q?saHhUmcGUrwcSiNAzBsxyWu2QshMslKS8iT4IIEK8TVgABB6bdfLOVTbS9EI?=
 =?us-ascii?Q?TaJQ2g1Lq9wql2fo1HvHjHQSzeqdVOU7KQkyL0JjOdL4GKfrienClTp6vYRN?=
 =?us-ascii?Q?PoQtecZIoaEiPJYxX7iOFrJXI++CSSi/bGhPmEcLUPycVyR1sXtdLJkBVj43?=
 =?us-ascii?Q?lD+MuHH3FgaylwPXoTC3cJWa+T7R4LYEXa+v4DMfbhpX0PUMI9vb4WA6NFdJ?=
 =?us-ascii?Q?y+db4mpMWAzQxC2J7dbR2CnZJAjc4B6/OWJALlweQynZRjFP6ptDyiML2mNQ?=
 =?us-ascii?Q?8UDnIET5uoxFVmK82T4Yp+qBB5EHxVjAW6r8BNKXf+W4Z9WToFVec0Cp+nN7?=
 =?us-ascii?Q?K/DUEX6Sc3YeHpnVSdzQXvxndryY7tpPwgJPFVcOa7QATQbi2OGTIxsfq7R6?=
 =?us-ascii?Q?23Y4FZHR3cdFOnaR6MoVLEuf0Y6B2+ZwHXq30gSzg2Z8ssH3sTMM7siISjlr?=
 =?us-ascii?Q?Breo/kfl7FVqUFUGMs7GUcumfTrHkZyj8xn5zYnA9DjS/e+nqj0/1hvW0imI?=
 =?us-ascii?Q?pjhKhdxVNLhna9R/aSsZda4F+RqC2jhKn4LdyN1aHeE6UL3+aFqQLu9FXK1a?=
 =?us-ascii?Q?M7V69fojCz5MqcR+g8bIkkHbCgwNjqzvXOQQ0nT1RsdASAVYjjxqTTk7lCXf?=
 =?us-ascii?Q?+dgda+ubcntg/zJ2ze1VDiQhiZ5B0ZbDD8W6GPMbV1tH7pfly1huCewEvfU+?=
 =?us-ascii?Q?6WSyNtPVGnaTxhYiFk6fVnFe7yhaICbKIqOLqPFWwAUKsbEKdhzYgx8N4a3y?=
 =?us-ascii?Q?FVZaVNzz9tY7h+92gSS4UlHNqxQ/q8Bv3uwQZcSqqoux09JyxAjm/Er8tbSU?=
 =?us-ascii?Q?6ZnaS7MS70btklHftZ77fyNJYub8LUPGVTcKxwQ+KdPk8ZmiU9SWaudPbbld?=
 =?us-ascii?Q?u9blRperMOD8sEY/eTUxRt36qGx0if2VT57wCEq/BDhClrKaXKTvzygXzCBN?=
 =?us-ascii?Q?lzOoIF0OtOyYePBwCQbq0XdzyTRI855DxtIpyIJDZ+wXHh3b6B+ev7Io0OV9?=
 =?us-ascii?Q?G+eUPfa7hUIbO2B2n0ZPpaJezkyNXkEVnnOiDZR+sieUjied+T2aLYOWfk4L?=
 =?us-ascii?Q?HJH7eJhyZHW3UsJnar8GUsnQgCHHRhfAxsURX524yzPbwDt/lgbv4Zsgav9i?=
 =?us-ascii?Q?P2s5ynxjS+YlqbJFjKU6etbZLsgvhPGlf7MDRRSd2DaOTkY3PA75eJnW317T?=
 =?us-ascii?Q?y1LVnEitRjuS+YDQHbpnM99uWzGwZM9VxKqtqzt2/F8yOp34yxNQcGWUYzQ7?=
 =?us-ascii?Q?7D7kMHRspitTSQkkxRba4KtUABspQDrz2Fa1l0wdZM22o6U+LTRgjKB1sgcz?=
 =?us-ascii?Q?nsGFekFWrYhiq6zabrh0lUcutvw+kmRf1lByKMqWWBLqVDk0UAVeYeNjMUOD?=
 =?us-ascii?Q?clLZ1n4nZpnDh0+GnU67gaoa9Z/nqJ/YJKEdoKNkOW0PNB7cI/JJl+Qvemtr?=
 =?us-ascii?Q?yfilyhfT1/XN3or/U1T/Tjnd7ORUHhXc0eHw2ICyQ+203rAMDfTbTz46mxJ8?=
 =?us-ascii?Q?w7a2bJ2oI9Do7ypwK61zITQPj0WyG9RButml9E0fpPUYMnrNPkcopk4dJ7yi?=
 =?us-ascii?Q?52Q8xmMlmT3iF978SL2CX3E=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b39c356-2ee9-45c1-72f0-08dde6dbf08b
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 09:10:46.5632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyUKSkSW58Aw0T0FhBqtEOu67Q7Vlb6SEIIj3br15XybhJP6aiIwc55ydxGgWzm4H5sJcAez7LZK3Jw9tIzp1IqzW6SQmBhRQX6kY0VYRS3fKzAetCeBQO4Wu0d0uW/h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0801

From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Add bindings for Omnivision OV2735 sensor.

Add MAINTAINERS entry for Omnivision OV2735 binding documentation

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/i2c/ovti,ov2735.yaml       | 108 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 115 insertions(+)
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
index 92e9d8c7708f..710f2b2e5fc8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18471,6 +18471,13 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
 F:	drivers/media/i2c/ov2685.c
 
+OMNIVISION OV2735 SENSOR DRIVER
+M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
+
 OMNIVISION OV2740 SENSOR DRIVER
 M:	Tianshu Qiu <tian.shu.qiu@intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
-- 
2.34.1


