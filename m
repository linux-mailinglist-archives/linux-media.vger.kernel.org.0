Return-Path: <linux-media+bounces-37084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51054AFC856
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E7393B3326
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C1426A1A3;
	Tue,  8 Jul 2025 10:26:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021122.outbound.protection.outlook.com [40.107.51.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19526279DA7;
	Tue,  8 Jul 2025 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751970417; cv=fail; b=mGZJPVS6kpF/f6Qjo0zaoDChttZLZRzgzY0Rki7NRCZtvg43j2Ydqzci12vCvGN3u7wTwsYPHW8MWJ4gAoqjMSkULWP5nvc5N2y13Ksb5q2AuTIZcONHImkZkn85g0Shrkdua5gRJhPgGSAlsLXeVGQEp3JAHLpJRXrubooGJNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751970417; c=relaxed/simple;
	bh=J5lfZjrq5hQ/tdz3/uvIMOXr15DOwCU15XiHWTffHBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kId8lOQzCV+PUAeiVisOtBsIPA3G4YDwgX6kTj5GsDZ4ne77SgdtMZ/WUq/gLyQbIQInwU7OILehfWMkUQGtVOqGvDD6o8T8F55VbZXgTkj9Bx/3fEfRnG1szTJfGihEAvAWwhFOlYdBQ3aCn+MVwQfonakaYeGGcmd28Ljz1pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHLOLNUVGnaC3QaS0UZfvHZgbthqGj/Gl6azX0+YbtCotgwoqnU1Wvr0rk2K5d8jANnIMiFzEQQuERxjgf3uesgRsUDjiLdJ9ov6hwDf8P7BkKwIezaAHp+3KBMq3Ot+gvRtVixu2RDKRwAriJVHn9PfOzx+iV6+lpfz3D/krdQ7lmgUqFZUCwCcboEi3CBjpP7ZPf7DWiKZpH37Iw67kg9cNN+YdTnF5ZfELD0pxprFzdgGlwjYtDAV/kyTSCSTfbUVPdjipear1gKXp+wDnBVdSdmAs2QE6TufcDvWoF5LqwsLaiJqpR/cy9QawxUG0vSNHc1ajjXC4Ecw9MLmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPmpnoRwchT/vHSWIyLWtG+Yl36Ej93xQcaauZqqBGs=;
 b=Cy+ld+cyQ9XeUIzV2VhOPn9I5zXdhUifQEXX0JD/2dSaql3Xd9JnuxTG+nryELLaEpYMM+G7/wIHJ+qMarjns1qAxDvmhAvOyJZikzJ/W/jO+Vs9OY5qSE0LDqzO5jKiXTtpoEVFdR7ALoWICqYalEBE34fXKP++5Xh6BTACQQr274drf4ZJ1gpawzl4Hymz1QthUutcseFAP/gfliN9Epd1G2WtMMepf9EbXUQ1AYGsYVtP1BDrZiwL/1IrDvZNItzhNxWfN3WC5d/o6vbvqjqFIp+YBj6CeLP7S8KnerJn86P5ZIAhcVf8VXZU4uz42YsqD7azav2hgBP63t0/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by MAYP287MB3738.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 10:26:51 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 10:26:51 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	krzk+dt@kernel.org
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Hans de Goede <hansg@kernel.org>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Arnd Bergmann <arnd@arndb.de>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	You-Sheng Yang <vicamo.yang@canonical.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Date: Tue,  8 Jul 2025 15:55:55 +0530
Message-Id: <20250708102604.29261-2-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708102604.29261-1-hardevsinh.palaniya@siliconsignals.io>
References: <20250708102604.29261-1-hardevsinh.palaniya@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::28) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|MAYP287MB3738:EE_
X-MS-Office365-Filtering-Correlation-Id: d194b650-a2b5-4f66-542f-08ddbe09f3e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nGl4I4ij8UwSohw71rfVlXqjMx+wGn9e+zjPu+KVl/kSq/fYAuKs4CrKlaxb?=
 =?us-ascii?Q?bnij85FGh+FeShAR7xMJad8fHFVq4aiFGIHlzGawr+lbiKgXh5fsfKURyG2c?=
 =?us-ascii?Q?p7UqX4kKk8JyB/0NxEC9vNo8Q9/xgS9Y06UslYIELcrshpfhp5l5YBmagRvg?=
 =?us-ascii?Q?PisW37sScpzLv5Oceo9Ezp3rSQ0gtHoRf5EgAn75385KkXg8k3bNKPMCjzGe?=
 =?us-ascii?Q?prke0OmsgOO5QD0RRGkJkMWmoMgoZ3adml7YhrnCZ3WeIvqUct5UKi8Km1vp?=
 =?us-ascii?Q?7vhcQrMljN82tFpzGcpyUQqZHPkw3ilZ2gE6RBnX7w8EPu70yE91U+jW45Rp?=
 =?us-ascii?Q?IerzU0My9XfLx/y46Nug9pT7axj0h/efBnxJmWSz+lgZEAn1rixVgK5tiYPt?=
 =?us-ascii?Q?4xnaD/+IH3hlUY+xcnm9gM4WHstnUNjDMFjJu1KvT204J/WopbxE5amIxSiA?=
 =?us-ascii?Q?+XUWneVrarZIOJlRpj50VHE/44cgQ1F4c0onwxLxbonr4PTS3I5vCY2jJWPp?=
 =?us-ascii?Q?UvSm5WnQryW0F2NMYFHSPnedqOXCJgQaCtT7/n6K1MHajEdZ9f+PtjbHURvh?=
 =?us-ascii?Q?6PxCDh6nphaYUfHi8/dAxDhy9yPkCm/RADIx8ZMZiBun00yKfMuATwFfqfKg?=
 =?us-ascii?Q?u9U+1Vet5jSXgDtSGKitpgt2NovhXanbfvWV7UbS/iWTo/yDJIXs9ND5XWeK?=
 =?us-ascii?Q?NR0tRqZxqVvDHNaM8IC1dV9q7MMwpdx0Kw2YM5LSUnABbnlz3InDA7+O6PdF?=
 =?us-ascii?Q?Z3i5QrSpctu6uV9ogj2kUK/wyVF0Ug3q08cLIIzaEZwY2ZI1pcmRLAaEhtRf?=
 =?us-ascii?Q?2CvH7xZm2WfEucTy19r9zdb+dse/DQUMCipjKJFM06jjoujMaoqtl1+vFuuQ?=
 =?us-ascii?Q?BSRez4GAR82RxmH+UYntyfYZT1gAHDFjyI/IhqwYO+LAVmKzTBIqY8qx3Yzr?=
 =?us-ascii?Q?B4oCzjjCJJetkZiqxSsNsbRyeXhuld9SSZ9NJuJ79ALmG8l2Zo9OGP7+sdV7?=
 =?us-ascii?Q?bKa8WZrAxtCVBFbbu5VhxjqVswz8wbdlSWQpsZ1DaBfvUaEXVY2kBoKsV6Qw?=
 =?us-ascii?Q?6wZ2nBqVzVj/4BnnE7NnrthdPxUGFgF6yAIsvWyK18o359stj0NG+JzigGCO?=
 =?us-ascii?Q?bow4aXDgXguUJXcp39WtmeZl+p55aYe8HDc1pVFR1vGKS4HT6Y/pvVHlUfW2?=
 =?us-ascii?Q?QdRLzBb+Mf9GMYH48Dp0kd5/yi+UU9kc20W/15QJFZudrf5BIX1EZTAd4pIN?=
 =?us-ascii?Q?M3adJEXcGDELny5iXVmVTTXUnR6ACxa8RHx5mw3S9CVPmTKG4UDmgn+Jd1dI?=
 =?us-ascii?Q?w82AmH1A9qv9SF2n8ZWcheR4SHKMEkUjMUISdCMe1uZACUNy9CIOAMuaxoGX?=
 =?us-ascii?Q?Vp0QlPTNZl7q3xRBDhU1XPXtCwcb+cuUMDEwUkWVdJg09Uy9mF7RIlz4jthj?=
 =?us-ascii?Q?kgY4KoXS1Uw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ReGCPaB8cqB4uftnoxgVkzkCB+SOaGMocFEFUIy2f2zp0OEA5z8Yaim4IEwR?=
 =?us-ascii?Q?VDCYq/liE+mVNmXz4OJJHzIutZNtgjAD0DEcxFmicVam3drALC3SAsA6qxwq?=
 =?us-ascii?Q?dmgHY69htR4nd+i5necnq1qsEimE0mCmGHJsgivujX1i/YVys50bvAi1GJJ4?=
 =?us-ascii?Q?4+7W/465jmjGUT3ljEl2LzyAC4Ho2sTH1X/WyZ/A3jo1WpBsNrDiTOPJidqq?=
 =?us-ascii?Q?mQG+Nxm4Ke7V4IMjYymCv88TIeyn7tLbe/G6sfHEenqbkgGrbRvDLnITCvC7?=
 =?us-ascii?Q?jLPJvCLQjsiTdmGnTJMJlmvqwTqwccUvFkWxR1ZlXUNTy/0Cqv//rhhsp33v?=
 =?us-ascii?Q?4g7TRGtu9VLNqK54xBfmPvinvS9mkjO4GRpkL+HGZA6ymw7Xx54MGMYnjZnZ?=
 =?us-ascii?Q?ozVgoTq878fbST8Ari/5fvWU2bUQkWFWF7b2fiFjcX4HgOkaISyafdCbLOhH?=
 =?us-ascii?Q?Vh3R4saTeeTGnnlfWzQf73Ua/BfWdUNIgdRSNLoe2Ut/3C++GVW87+SWPI6b?=
 =?us-ascii?Q?4ktZDUA4GGjD1qmRuh0xa1j6ONjK3kgTiI8S++gmT7/IOl+MMvl+W6CYKqex?=
 =?us-ascii?Q?aUB3Y5T6zs5mHMy+eoV2ia7+7iP9HqDkrdUt+9anJarl6dq3OfG+bYZpA7qT?=
 =?us-ascii?Q?jXWq5w40O8EuXEQ7IdsHSiBlDuXKzRvU8J2B6qqvq4Yqy01w+hPnY9ibc4I7?=
 =?us-ascii?Q?OEwB/+8IHTNfoFyybXzGVqxP4V+wuh2iGpncrbL2UYfjd+1evG1wDhZkw2r6?=
 =?us-ascii?Q?BCDelWB3mQHSlZc/CY2H7AxzN48aocpiL71JHv3XtP6JbB6ogSaOGE7yWeZv?=
 =?us-ascii?Q?Kf2dQCxiRdx49QFUDtHznV9/wL0ggTwlju8bC1mFskWdachFaWeNlUPBXGUr?=
 =?us-ascii?Q?c9WqWi0pIsj3dBfg9wqdOc/COPWJ43DPPNm3JlEPdBGSJKQSv4hf1KfV4tN+?=
 =?us-ascii?Q?B84sd5vnyEjRpBSNQ7mR4dRGWqACM17LxQR7QA50fQJxDR3SUdeKwwWhiKgR?=
 =?us-ascii?Q?FDuPSXOiU4OhMBxfSb++0/0zDeZrI7rKtJNmefFlMwzKO517T6SRF1KXfD53?=
 =?us-ascii?Q?K4VRGlW58QfGNxhFATDtLIooqhvGo828Edu1w+bDfzpcMTMxaDVSUDTbyp48?=
 =?us-ascii?Q?sglp0SICmyXW+Un/xaN3mczrHUt1Xi3Gn034V/f7ADStVxMYFFeAbZkT6DDW?=
 =?us-ascii?Q?0hGo+dBDAQvc9BybGpoRkZBcGu60jbXxYrJ+3wZ0KzB9o5DRiXenY35fbTCK?=
 =?us-ascii?Q?/vYamvonVuCuKbBHZTfz1+11/tJyH0yoadYOCyKomY6sJaSTVMgPVCjZHOoI?=
 =?us-ascii?Q?Kt0zHfmqjEEjj7TQszKeH+sByIyLbTRVyrsUPwnC1n+pGaqo+e5E4Jg7QTsL?=
 =?us-ascii?Q?B3uxBKBiiLANcwlhUWdXrsw7nRhYu2SfKcOi4f+aljuvbZBofnwRonD/LW7i?=
 =?us-ascii?Q?tOJR1mOYFSOp2t58Z4B1vFmxahQSO3o8bhVW+XijJsHNGQhGojPv+Z97ZjRR?=
 =?us-ascii?Q?Zkxfga/C1l3nri27lzYFVxrloWS/PqoNkP4UHIixlWZ9fgkxQkKh+OYZY/u/?=
 =?us-ascii?Q?tkV+KosSWUt7ywmX+RhVCYcYh+zVXYiRZoA1ZaOWpRa/esJoNHjDe0g98qo1?=
 =?us-ascii?Q?wJXNZpFRtyW0TFykKqbXN14=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d194b650-a2b5-4f66-542f-08ddbe09f3e5
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 10:26:51.3896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZM5lGS2/QITlLmOm/OUtSd+ZqnWC6GFZCEntBNMFCdA/gW+FKzTrHrvb9qQJmwE19Q7jMq6B83DlCrJB/oAZf4+uyaZKoRgz9RMr67fGG4NvedRve1IZ+s/Gh+xJMi5i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3738

From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Add bindings for Omnivision OV2735 sensor.

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
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


