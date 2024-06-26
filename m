Return-Path: <linux-media+bounces-14210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 947BF9199A8
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 23:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A1782865BF
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 21:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064F3193084;
	Wed, 26 Jun 2024 21:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b="G1lsL4Bk"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2138.outbound.protection.outlook.com [40.107.220.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1461E16DC03
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 21:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719436572; cv=fail; b=biD8X91eIWKgFDvWA7q2bdkknRD/2LGwOvwbReGUOqGdCr6sv2f3g4V74lswuIap1QXpQpzeKU/7PRLZyyj9dOLBx3JupYxjeNV1RugmT/Rayw8uAdHWXKhkJAFqDEhfE9VKyG9KJq4EA4TgsbsoaQ8mag2+BTHAB7Fysv9DiNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719436572; c=relaxed/simple;
	bh=vjMLdA9hmQEwKHRncdWcLCEUa9o9IYj/Co5od4km8mE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hps9YPFvxiArNEHzTq9fTzsmP4dDKlH86SCSMtLP4vhQsmag2ryUJeH35AuqwI8lzWUYb8iOdb8LWU2Zhqh9/qNRMUsOiWNrbq0dYxqjYMw81hoCiFfFhRsb9FCN5DSy7yA0+uMgJiir9M4qBqml5zMHcPr2s9Nvst4VBBoYdNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com; spf=pass smtp.mailfrom=d3engineering.com; dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b=G1lsL4Bk; arc=fail smtp.client-ip=40.107.220.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gflbr/4Vn8tWfEiwpQk61gqsLulKvttGwlvlWORSVDR4rV07LvSeUFsiPcbvreKrYQF/Z7bq/651OW8sA+WnZZX2jjqTdri3Jlv97LJJs4O7TzTJKlU3MkXoGGkWgLtauOq+YtyYNmvhJy/lv09XnrD1i2Osm8HrlUfQxd9jVuFuTrZ7/st+AN3wzYb/s+r5ajracg+/rRXnXHoF/1Iayat+yLl3eHefBkvg3eokF3Rsj6OnDsH6uVlEW6PEZHs/xk1n2oI2cSrCJ5GJxQ6JhLeA2W/Gh01kJHwIXFVkTZgxn2CQoqSVZVpEX69m/wB0NfWpZYYjsJ3QSJoE1Z0KTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8bBZNmPE4/Fgd7gEo0dQ6/JCElSTf/SKuXEsDZneOU=;
 b=kpr7mmPgX3eKAafKZqCUWK4CBWmS1T9LJYRE9yUy89TxXxSFQrfm96vSFjbH6RPI6tMOyNyr3CFI/ZuObdSTsYM//nfImn4ebLkIJkikIqNviPtmdR3FpTUC+zNdWgfMbCj2LBqGBcRL4Yal7h5x6US1Z7T1LCrO7O5FYjSeOF1XxUJ8h6mT5YBYexHuxEXjk0jB2er3oAx3rXkQ2mlPbW1lhv3NMW5lt4P+Se3hBbyEQR2GiGg+5V8qiRfoJMIeffOredMyXbgrQKxwPVlw6XLZfMznbd1HzHnOLP2qYFQWf9XYVWPrk5KSFMJQbb/0elyuylSP/boN/mUxL65IXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3engineering.com; dmarc=pass action=none
 header.from=d3engineering.com; dkim=pass header.d=d3engineering.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d3engineering.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8bBZNmPE4/Fgd7gEo0dQ6/JCElSTf/SKuXEsDZneOU=;
 b=G1lsL4BkBCm82/14Dihc51lgmmHWMM1QY5wFOXUa5MxzTFFMbRhFiceIB77BYzP8mqyqLB9lXc260JNaov8n5mqmn72ZW1yfssxLKpu2/gjsnd2f3WN/mWvFWwzJdeLjBu7w/yIWMy4q87Xkt0JtBAufvH99A2k9P82zOR6H6KY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3engineering.com;
Received: from CO6PR14MB4385.namprd14.prod.outlook.com (2603:10b6:5:34c::9) by
 CO6PR14MB4242.namprd14.prod.outlook.com (2603:10b6:5:350::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.22; Wed, 26 Jun 2024 21:16:05 +0000
Received: from CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864]) by CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864%4]) with mapi id 15.20.7719.014; Wed, 26 Jun 2024
 21:16:05 +0000
From: Spencer Hill <shill@d3engineering.com>
To: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Spencer Hill <shill@d3engineering.com>
Subject: [PATCH 2/2] media: dt-bindings: Add Sony IMX728
Date: Wed, 26 Jun 2024 17:15:29 -0400
Message-Id: <20240626211529.2068473-3-shill@d3engineering.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240626211529.2068473-1-shill@d3engineering.com>
References: <20240626211529.2068473-1-shill@d3engineering.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CH0PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:610:32::27) To CO6PR14MB4385.namprd14.prod.outlook.com
 (2603:10b6:5:34c::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR14MB4385:EE_|CO6PR14MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 449f4408-354b-4652-722d-08dc96253054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|366014|1800799022|376012|52116012|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uceNxgcuzkRQWfPEwKoepc0Svc9KXoZ0WNkFvRIw6K7//wmA8f5pwMlFJiQa?=
 =?us-ascii?Q?8kY2MlRdl5K0pqLdkvYvxNUuEejYk5riFgfUUE9LumSFeWMlPiSUAiLZbAyl?=
 =?us-ascii?Q?0JvSaKeXrj2iOFMeyHPbCH2o0c1SDmdLGDyC33KGj6MdibN/sOoUEpoKYkGq?=
 =?us-ascii?Q?/XHB1JRLRz8RduQxyNiIszZfftetPaHx1HwTK3La3u1rEAICC6xwdcjjcADJ?=
 =?us-ascii?Q?e4ZVNvv4wifXT5z4sOqZcK47Nfvb+NwPaEdwSyG4eYLXAvFoY2eWmvFr9tOQ?=
 =?us-ascii?Q?X6I+COs2nJZCponKjIbWfZ5KMnnjLu6bqWFzl2gqyRbSysuU8Gy5WRMQNRKX?=
 =?us-ascii?Q?NYXh981p0Kd79dI7ec9XUiXNoCSqFG9/CdT2hOLo5BzfrCYjMpvnzp/tfroG?=
 =?us-ascii?Q?lJWPrcKmb1XU4Tfi5261512HiVP6f3cz0EZAgrQ3MOxTHYAaVxreVqBe6QgA?=
 =?us-ascii?Q?t230KH5Y8rDMUIjHY2V90wqKckIiXWVoik7DjBcVe4TOdQz/lImQMo/6rz4P?=
 =?us-ascii?Q?YgP+67hsmaLRDNaVmnYVP4TM+AFpffC/2mOTTvrduB+Qd9HuNEcfsXMsyhd9?=
 =?us-ascii?Q?9P/Ww21hDffPHtVKdmkNnVdUKCXzwnAmqz4hRNyyqYXTJSh6aiBnu3S/YwLk?=
 =?us-ascii?Q?Tc7wFnQTps1PYHCjO9ZJzcAXKF7uNe7jPh2wb6OUbsh++EllLscLfbINJ9kh?=
 =?us-ascii?Q?9mEdhk03AcdplEdZwvtX6cWSQ5QrielIQ8lx3SzU95K1ZjZqDJ4IHI8RskLc?=
 =?us-ascii?Q?C3X7Uth2gqwI03zzwLqMuSyTzxLTXPYWxikbU+8xOZ/QQeiSYlx4/y8By5xH?=
 =?us-ascii?Q?Q2e2MrVrNPWD/2U4YGbIBjV/agNoCRAjlNYzEsnj5uZfZkHQtQeCE7vHTLGH?=
 =?us-ascii?Q?jQXE7H1pk2dL6cbkKZ+0mRGIiGjl63i4c5neNNUCjbOFP3yFMugV5csugQaW?=
 =?us-ascii?Q?/7iYFAHVGnMNzLeeLfAs+9tfd7iOEhFknUpyOn7fR5lxLFXoBfljFOdLyPhg?=
 =?us-ascii?Q?tkBF4fr9c3otMJUwE9XOsEYFFZmr1K116nHWT8ACmjVgdjRNNU12QfR88oKj?=
 =?us-ascii?Q?OtGgVT1Vke8XuW9VJ1psRCFjkYR5pDWR9O8XcHQbc6ZVWzUZU7r0JFZk1pPA?=
 =?us-ascii?Q?61xvGse8XaX3hHkyhxNJBe6FjRhuKPZfAIOkufON990CpXVCyK4BQ1vH691w?=
 =?us-ascii?Q?gtVnAI0P8RHNG6sldZyl3XCAQsVv8ahXNUsWzz3st/yIMS4ciDqtd+KXjTZK?=
 =?us-ascii?Q?DLm7hu6SbR8k+ntSD2miOxOtpkLuFnyt7a3O3R+5OrfifCHZS6JisiQGiN08?=
 =?us-ascii?Q?ggMxKxJCsFaTiqor77ESgfSjJqEYRLTF8UoELLfC/LtNPQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR14MB4385.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(1800799022)(376012)(52116012)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vgp1LZhGQd8c3b78rwedHuFOEMdCwltaUv0/ZvLnH2PpaqIozkBcfLpoHVK0?=
 =?us-ascii?Q?9EAHFz5WSaYgSmpLuPXUKRoDmgLv32ro0b2/VtdwxPfMm4+Rbmf26rz74fCm?=
 =?us-ascii?Q?wCcRGsyeW4mBaGHgY48Svd7GdTRkoPUigA1PjAqoEmmzbmTzShfLhs+ocUcI?=
 =?us-ascii?Q?+HwrKfB6TgN8dcUJl9Somc+qyRttFE5K+6rqS/ytxadrrb1kHsl3vOCFQDrf?=
 =?us-ascii?Q?vLzLqsiec/CC6SBoTrYJcLDA3JtUNMz9lr3m5QtOjmJtc7ibaSGMWYCy2hgK?=
 =?us-ascii?Q?Kz96TEet3Z5jpZ5JW4sAGGBQmhfRom2XHWcJzlJNJzbF1huxl0t8TR0qfT4k?=
 =?us-ascii?Q?tNY8j39D5l4D2NfTaARfCOtfYf2oRboqZIIPvwrfO86D21GmxRo2rHCrPAKs?=
 =?us-ascii?Q?XTvAuumhLouJnjPjpukaOi/O3blH5Ulzd8bFfcUqsxt8RigcNQkV6h+3+jTY?=
 =?us-ascii?Q?O0thf/6XhJ3Re/WYdxZQEWGGQd4l33hMG2j9ORL7kDzzvGsQNxMFCs5h9FoD?=
 =?us-ascii?Q?/ZP9EUnN4azCFyoFaiXf364TuQwUXwVUA/D9maNg2GbxOfftjeRj7z59uWZe?=
 =?us-ascii?Q?93ot3BoZ6TWg/apRGHvCvKVMMhGSzRZqEPxaaWedT4lyzwpsmBhXIET2qcnI?=
 =?us-ascii?Q?c6RXQEZ21rRV0C5I5AmRhDO+jdyFx2sxj/0Gx1oWNOWz/c84KjKVr+Od4gf7?=
 =?us-ascii?Q?UB4xDxj1+xYy8dlFhs+LS7FQNqKBUluKzh2sX1qX9WzpgH0330nqz5BCX+2a?=
 =?us-ascii?Q?gb0+p8ltk6bz/wX/dawmxqw51lxRxHCPRFTzszHxMeTCT7I9Wh5IcOQRmTfl?=
 =?us-ascii?Q?PkL5XNOxEvg53AaSs3ymId0qHd/fLjxxTgCJS8Cqrkswt8ABVRWoLzaX7VFE?=
 =?us-ascii?Q?SyV6WOWz0j0dwqKc5+T0nQBdWk6KwXvZ/CL/vhGxjuxytaA2iwAIcvQxpuXE?=
 =?us-ascii?Q?w/2V8r7FAFwSd3mDHAV+2pCjmAIk4XSF44AMSgFQtwrokzOXm7rCZkNo5Wko?=
 =?us-ascii?Q?/VXJZcYpAtJZGtmwplzD4aVjxdKUz6yEnPsUblGaE3xV26vAQ8LTsD6xdhYj?=
 =?us-ascii?Q?GXOotqwouSdIuBcKzp/KtF7LARIDYN3E1NlxWZLDpPzt79a7NFnuBE8ijCy+?=
 =?us-ascii?Q?nLGMPiHRSh5vedlP3wOjz/KgcdUh52fwU8+R5yzjyVz0S7TXF3PW09E0JcX6?=
 =?us-ascii?Q?jvjAufA4/pYYJ81lmwMZLX0SECFXajXMTvvUDmtNi/nSO93W+9Wspe2Gbepf?=
 =?us-ascii?Q?cGsVOZfLtq/gvnohBCh40+rhXd1hZbbGpT4us0bytyQKfWLN1QKHbb2LT+hx?=
 =?us-ascii?Q?OAuvXSehgWFbIxt+DAIIHHUi8LHV7kWEjijWqfGpJXQosoP3a/dG0QdVHKH8?=
 =?us-ascii?Q?I8Qo+UhXRwZwBRCpdYAjMJ3bEcFsQjOpo/PCvTA11pbboVvo5uFvfPm9mCAA?=
 =?us-ascii?Q?0gzsiX5v+KVX6xFKGLgF/fOOxVHxbuJeWpdghYYDtHKV9MnLIcXQiy+Kaovo?=
 =?us-ascii?Q?spw743gUe9QuWgG5Z/09ESuXbw3K5qDYmryOf6xJq5nolNkhcsN8x4QwYUir?=
 =?us-ascii?Q?+D5AIJZCdGhmKjNKMdLAMHuvEDEMh7EqBLJQY7A1kN2r87nXna9+6md7nG6Y?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: d3engineering.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449f4408-354b-4652-722d-08dc96253054
X-MS-Exchange-CrossTenant-AuthSource: CO6PR14MB4385.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 21:16:05.1228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gATT2/CGpsWWZ59n7xGH1/TmmzA85mWCS86CW9KFce9MB/3dAg6OlOpfqu2J+h5ETDb2q2+H0sskExxExOQtrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR14MB4242

Add bindings for Sony IMX728.

Signed-off-by: Spencer Hill <shill@d3engineering.com>
---
 .../bindings/media/i2c/sony,imx728.yaml       | 78 +++++++++++++++++++
 MAINTAINERS                                   |  9 +++
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx728=
.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml b=
/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
new file mode 100644
index 000000000000..613042ab5abe
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx728.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX728 Camera Sensor
+
+maintainers:
+  - Spencer Hill <shill@d3engineering.com>
+
+description: |-
+  Sony IMX728 camera sensor.
+
+properties:
+  compatible:
+    enum:
+      - sony,imx728
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: inck
+
+  xclr-gpios:
+    maxItems: 1
+    description:
+      Specifier for the GPIO connected to the XCLR (System Reset) pin.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: ../video-interfaces.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        clock-frequency =3D <400000>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        camera@1a {
+            compatible =3D "sony,imx728";
+            reg =3D <0x1a>;
+
+            clocks =3D <&fixed_clock>;
+            clock-names =3D "inck";
+
+            xclr-gpios =3D <&gpio4 17 GPIO_ACTIVE_LOW>;
+
+            port {
+                camera1: endpoint {
+                    remote-endpoint =3D <&vin1a_ep>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ef6be9d95143..34fde35eb0bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20589,6 +20589,15 @@ T:     git git://linuxtv.org/media_tree.git
 F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:     drivers/media/i2c/imx415.c

+SONY IMX728 SENSOR DRIVER
+M:     Spencer Hill <shill@d3engineering.com>
+L:     linux-media@vger.kernel.org
+S:     Maintained
+T:     git git://linuxtv.org/media_tree.git
+F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
+F:     drivers/media/i2c/imx728.c
+F:     drivers/media/i2c/imx728.h
+
 SONY MEMORYSTICK SUBSYSTEM
 M:     Maxim Levitsky <maximlevitsky@gmail.com>
 M:     Alex Dubov <oakad@yahoo.com>
--
2.40.1

Please be aware that this email includes email addresses outside of the org=
anization.

