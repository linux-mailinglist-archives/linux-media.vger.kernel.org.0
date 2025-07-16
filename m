Return-Path: <linux-media+bounces-37874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F33FFB07735
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 15:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC5413A4173
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 13:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C611DB92C;
	Wed, 16 Jul 2025 13:45:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021109.outbound.protection.outlook.com [40.107.51.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DDD155C88;
	Wed, 16 Jul 2025 13:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752673515; cv=fail; b=KJQLLxcC0oyf73qAIMc0TqiWzbLe5H+JPaDeCKkyl9kTmiro8A10VbfplAJrlLz8gxxkJRxwaABiyMBMGRj7TP19plcJDAyhem+a6B6LF3i/bat7oH4/hY15Ep23Gt3luYPl+yov2qEaQAHhzrOCX6KxQdVVbAT5lopeHYKGw+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752673515; c=relaxed/simple;
	bh=Wm7y8eQfoi0rKJTEUBCfyoj3BL4NQ/rS4g2zUkv3Eek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BCAMQbHHFaDtg4VhWOvU4dZ+xXOvax1MjRhahqxUCY9P+twhTjU8Kixbacv9bxgdLldRe436fkMM+B32fF9d36KsFNeGKstVjmlDwuMPlWIjye0JR2J0TQCMigv0jtFpd5dnrTu1mA9H4QrE7i7PFGwIuQSxm6PtRr2Wkzgrf9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDunx4IOQGqcGACZWcwctqVwsOmmYr0MzuB+vBXLfrBWKTJIgJhUjyCZILL9Tfp8rOWd+F4ENOnWJsd+OMwB1XTW84IIp3IwTFCgitjHXUUGgb/bkt9BYVI21UM3GWhaoOplxk8wy3XyQkXJ+DjQPq40UALV6zNA7/KqQZxssGf50J0fJRiWg3qxBXDufB+4KnzPbstew2JT/nmVjth2/rjIJz/LZjuccnvO3js9cmOQoYvLuFkwFFIf3T23l1WsDy27UzKmESqzSl4hZFNPPNw/YZgRPzOM7FXMYEf7Xtk01UBNp7YQJtTd4JDqX9Nsnn6RqXkuOQUShE1CypPhqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GFtXoVdkU0/+hryJhC+GAQv7xmBesW8GcdA8gI9u6g=;
 b=ItJU8PQWyw54pbdnKwZSTXz3MV7lW94HPYQz4gT93o5ATIDZFLcyAaji7If0OAr83xAfk3LzepFG+DLNmfc/aSGEHlTBwKaIeZNXeo9r5I+FmWziMrNKrHLa6adZxg6LjxrTuiiYmRR7G4oVMyHbYMmUBzpmTmoVUQlAQhHfZ42DJqOGtvDso1f3hB1mb8deyrzA8k/swOKeiYRHOcEBj5wW4eHBuaZMCND8xE9v/lb6YoF6/VteOb7HsQdJnPxjj5Yvk9PuijHHtZ6+18nkClwSHkdhxPeXaIFIZPSScAt4dB/xohoGpNTBI6qxAaNs+x9yJONV6TZe2EF77yTG8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by MA0P287MB1401.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Wed, 16 Jul
 2025 13:45:09 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 13:45:08 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	krzk+dt@kernel.org
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Date: Wed, 16 Jul 2025 19:14:16 +0530
Message-Id: <20250716134426.8348-2-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::35) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|MA0P287MB1401:EE_
X-MS-Office365-Filtering-Correlation-Id: 241ccb57-32b6-452e-4317-08ddc46efa91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?joJxaUvsMu7a/1lHPOdQc9Vcjh8g6/5N3HuMQaaaA7+LjUphyOf0JxaeO9B2?=
 =?us-ascii?Q?i2cGWTLCnghU26Xo8E3rx7bEYLjTxmxAbutEa62db1cHOXHzqskUSvmXWbVY?=
 =?us-ascii?Q?sUXQIXVQmKFR/llPkD9xldHfC5Yf8lPAO67zzvA6X8xguqrF4/RGrCLWSiir?=
 =?us-ascii?Q?/ndC4v8ZBr3MJi531onWNipBtgiNdvif2oIe88fLGzjxmVfA6UyCMc1Uqyb/?=
 =?us-ascii?Q?85PmYY6Rey5kuutlAV3++MMZoyEieizIghZ9mAwf66JHkjQXfQHXT/azICQY?=
 =?us-ascii?Q?cEGqVrOAWFBNJw6Qx6jJgTY4sIsD/CTF4XpFg88ElJzQ7iWhEPVzV6Dd1v4i?=
 =?us-ascii?Q?64oyGlzJHYJeMK6xvqhqvIJIUqUXdwSaN+uPIkaigkcOgIJCza4QWq/16gAU?=
 =?us-ascii?Q?2jT8co7/1+TK2au7jtX9Vwx7IwS/HITI6CZINKCH+eOqlAocaN0ew2+658mg?=
 =?us-ascii?Q?EmPE1HEUzMVzysBJR2/N56K73JdeimdFll0x2ffdHo+zXhhzk/vnjB6uVfVT?=
 =?us-ascii?Q?Z8rbRDKs3ceGv+uD3jLK0o2h/TrAMiCGCOQgq6xQmnviDyvtLHGzTSdhywlX?=
 =?us-ascii?Q?aJuIVdNBZw/zh03qCF3RD5WEmLAzivWehcrORw9WInQLrtIYZ5u2629ksPp1?=
 =?us-ascii?Q?AOU5Wb9e2jtcvUzutzOLRSVKNg5sO6EOPUq9aQWoh5cgHPGgUfPTuq1LIWas?=
 =?us-ascii?Q?vXo7XQt3Gt5Uf2BZclT7+PkcFRaaQcdVVAbg03oRLh4BNnUpaB2Vxq1j5EML?=
 =?us-ascii?Q?2ssyJheLuTMWNVbntTxRxMNKX2FYfywkgWvFs2AwjE2tmRclgx+1p0tyRJUF?=
 =?us-ascii?Q?DdOyrJ+J6Um1RWbvG5Z82GjSzOiUFZqeRjX5pYOKyBYqv0v9cYQ/hAXVPIfV?=
 =?us-ascii?Q?BYTAy7mQfsGFMNeTIx49NCvRNRM/cd3DXDgsPAvgD5bzC0UAjvqMKbo+owmM?=
 =?us-ascii?Q?imjq+pIgyZ8sY5ObW0+cYmdBrvfP97dXfoPj+hHlh42zxlEqQh0BayNUHljg?=
 =?us-ascii?Q?sRPlMHTzHMPvxTN22LvRnRT+E2iGekvgvqP0SLLFiYf+nCSZ8OrrSD7t0UBZ?=
 =?us-ascii?Q?wtyccjx6+dOPmKjBxBDEGM5FGb0wqdshqtMpf5a163aMM67plxoZ7jHYnS6m?=
 =?us-ascii?Q?HBNgGBBiIwj/7Xdia3my/XkX+6URQ6kxQdlD/gf6VTMmKNDo310ha8qIyZKw?=
 =?us-ascii?Q?3fuVcOjCGAySQKho4N+DaG8r8U288NopKg4GoJYpRsBxilz1EtJ1ILyvGpes?=
 =?us-ascii?Q?KvJStBmo8FBqWh8Wiczu5t6LNHiJElvuWEjrC/hlYN31TNox9Ae9Xz51rfhc?=
 =?us-ascii?Q?7t+5pbFgsaQwiXEtXy2jWS/aIIKTpojWkbcdTtjDKVTsNAyGepQ9ZSYo6x1X?=
 =?us-ascii?Q?EemB4y1IJnP3dkfQdWvG6YHr3K1YPhb4uZaMB971HE4W+60RwPi3K7tlK3qu?=
 =?us-ascii?Q?lUrG8zBuvzc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dtzXCY/ine1Yxf62gTQQ0E5eAWJnSR/bYjq1oJOXdna4WEx6o+YEUhO7oKnb?=
 =?us-ascii?Q?aVZSVy4HMxS5PkBv8MnqTSH008L2El6ivClkiKWbiFXDWaCQRapXPp8QmVrz?=
 =?us-ascii?Q?fYxemnQuvrW4JRPR7NE6/NNCWrSQiWmnYRZpnfR5Sb4ChlX0w9lW24p4eFRq?=
 =?us-ascii?Q?MB7H6QD36WzM3jYJsY9Cxh8Rv3I5hMDsp8R2iLs9NYfEiRiGOlDSTMudB579?=
 =?us-ascii?Q?1llGtRBtMPc1Vlk2IckqHNCjNB+Di0S/SDMYzvXkK1cDtzoNTMTrD3wLJQ2e?=
 =?us-ascii?Q?zROWgPjHun7jjzITIkEl8CYEqzU518FrmN2/mzxkc05pN7Xi+gDHETdwy+4H?=
 =?us-ascii?Q?Nk1AdgLrqom/NLkPVy7ld7v6D6UY3MXoN2QQSoA5enIt/SRv/n7fXvzZplce?=
 =?us-ascii?Q?RPkZ+mTRzR8HSyBCG1GIO50HcJG/KDlicVXDTIU5DgWe7zH4fRa/vhLtUvGW?=
 =?us-ascii?Q?IEQ1a5mAPt5A70NJh7OG25xmsZFnY61ietCNwZx2V6igKEr/eiMwGu+CnNyX?=
 =?us-ascii?Q?cZTpXCgA7c8vpQLaAx9pDgsd6U1RhH54rPqvIByKP9b1k17tPks+wGKwikc1?=
 =?us-ascii?Q?XXi1aPMhPM01D2BK3o/tTlOwoOmhR/Sem2T9YjWxHgKb4SzZ0XxV4pS426Ic?=
 =?us-ascii?Q?JgUgROr9URTyT8/JiW5PwN4sRdpjpVdtvWSA8mgxoBZNrMGmmXpb5Qb7p3zq?=
 =?us-ascii?Q?IVJplQrGB09aJ4ILk2w22tp8xxV58UIVSDnIVCmeqHZES4AsNSdBpHUX8ix+?=
 =?us-ascii?Q?oMoF1HYKscnHGYpGPAyV6qtnAMK4D4oH8kKfuwARXjluEe+qIObnHWO7tsLL?=
 =?us-ascii?Q?Dnq9n63TqQkhXH5CplL6DBUEN/2jojyx40/jbiaZKj779jSrJuC+vWh1UT4r?=
 =?us-ascii?Q?04/K07j4StjeBUFciHIr0zms+OGM7SLK46k7D1aWbodUKWEyxzyxH2MGRxhL?=
 =?us-ascii?Q?50BhuJDYcisPuXZXSsjwR0Dy9d16lQUXSgKtzPQoryA7imsl3cqKMrwtEi9u?=
 =?us-ascii?Q?l/WXXjfz4sDSf1nM5dNEWRYnx3yhZwQVqEttlSymVYSaAYye32vNzV2Mrp/t?=
 =?us-ascii?Q?lvHtakgDWaX4kWDbTWW/4H5mjfA0LNUnGUxNbavjfvYigJeAFGxMbSUYKXJy?=
 =?us-ascii?Q?z5VSlAu/sMjiOpsWySCNVJ7Hc46I5Jt6RAY3IwZfwuXAZfnnNHK/zxi5gIp+?=
 =?us-ascii?Q?xkXk7JCQTUe5os2kdOv/SQtWwQQGXXVi57fcI66QAsLqau+rb764itjDxvnc?=
 =?us-ascii?Q?Fx1/izRVGxmaGigjDX6DVdfbgOi1wOXFi/DOQcMuW/QnG7F+4GQaPtF/xxOz?=
 =?us-ascii?Q?CERPuvLM2WPLICGxtv2uQ06qLtRreuVgjfFfXtF7kqiUNxOo6A+M2CMqmvx7?=
 =?us-ascii?Q?Dwk/mK0bgzocH1Sc6kMPZ0QBSuVq76hjodJSSe02140uw5cgsaIEbxmZ+OuE?=
 =?us-ascii?Q?QKIje9SyDFESdqRqWKBhD+R6ROCK0iKbBpAnZSKtyA53SBmf/7/Nro1Y3JYv?=
 =?us-ascii?Q?jjj5dnUwDQe1rmjA0LEXD78JqtuDXvVGPSoloBtA55Uip+X2czEqknqLUvPO?=
 =?us-ascii?Q?tRHCJzp9JavyGrlfP6HbQMq+c271rgA3vP7z6WsbQC16nKlfoojEY/5Rgaki?=
 =?us-ascii?Q?AJgin5XRP4pviKf6zjRtv7o=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 241ccb57-32b6-452e-4317-08ddc46efa91
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 13:45:08.7685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lu91XypUuunTf98qSDAPWkhWxiP786y25nodmuv+0t+g78tDLgd5bL+izdpfGcSUbCttv1lNYtL1jYNjCeaB2Xd0aWYLnB2l8B/si8v4PU6fxoW4mculXMA7KXvZyHLO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1401

From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Add bindings for Omnivision OV2735 sensor.

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
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


