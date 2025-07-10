Return-Path: <linux-media+bounces-37300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F12B00306
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B90D3171FAD
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1802C1599;
	Thu, 10 Jul 2025 13:11:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020121.outbound.protection.outlook.com [52.101.227.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047F328DB5D;
	Thu, 10 Jul 2025 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752153118; cv=fail; b=sBk7uMtP58r/HZ9Y4kXJZgjfcTUlxYJcw7L6b+BzW4qoZgCDMrunjHheeG2tf/euTqHREAUlyiW7cRATzK8o5rXcaNBm95ygs/AilAYVp/jCrooYv3HNNR9O1piMVCW5YMtsxINdrofBCH6FOXAdx22TtF8iVncFIfOYyU27vbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752153118; c=relaxed/simple;
	bh=henbb1B8+fucHKSX8XG1r/VgbvH0AZPBDJ8RJelmTR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GZnuePpJG1KbwysuXh+nOMAtDTqMUir4Vge2jcJs9cLjzue9xNdb/I1/0ZUrOEWlUF71Jg6JR1pxgATdMhBfa3edJiONu8t1+KSs2SU4Ml7QmjQBBd81/gzJAtvBWj/REH6zVHz41F/404gapS+fFwqfKIaOczgwgJGPXD7unHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFdzOs+neLfjn+GUvGuoMJXRajWcKNz3VIJDjnHhWgwyB/Cgu7XqiGRA2JCPvOMDJ0ro4MEcpDWQyiUViPodldEesGLIDELD9JYfbs3F80oXU999OrlCPvCq8Q1dP/8u5cUhzK9SYdFGi0vANjKO0HdH3IddnN3BX6bMdU6ZERiA+xIyFwVp934GvVHJ9cYs2JlYAHBEHatp8HtWlHI9GMk6lURwMg6rqDxXpXmPFEfx0E+V2RQSXL0kChKy4kZqJK+LmqE1ULV7RXTA4+7oxZny0DVk4LY8ZLWj936lWE8/kwlZEMmxZ0H5Xf0PqVm/mb4gn0AvmtnMNofOIOWetQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMAzR6VRjnEFHMutpPDQEX2iYxNOvyyRZZmZwvBNVSs=;
 b=UMaOeWQ/y4RndWJlHx6zqZADXjCoa1z4uGBvOpqW9hrGR8V1LfEanQgxr7znhY5+vNJ7+cETDgwwHFZ6RK4iFP8kfOZQtTdyi1qs/aBxgTQLJ1X6kU89Lyoi0J5ReIDhL/966OuSE5zEzQY22/zrkrkMIGF0z/b6UXqV0yAYomnlj6BPkC4cg9VRcP+IZgc/CnisvEIukX9bdk2hPfE4nSfsd/v1haJNtqybbY+S8AKFEv1fn6Xm1ZPdWklQQoF8YktIyr6siHUAsBw+6Ea1L+xXTVhcubyDZ/zEEpEqazbJzsQGQBhL+2QKZvyrOfI60XtIyCMKnK476mEJcNL5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by MA0P287MB0108.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 13:11:53 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 13:11:53 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	krzk+dt@kernel.org,
	kieran.bingham@ideasonboard.com
Cc: dave.stevenson@raspberrypi.com,
	pratap.nirujogi@amd.com,
	laurent.pinchart@ideasonboard.com,
	tarang.raval@siliconsignals.io,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Date: Thu, 10 Jul 2025 18:40:58 +0530
Message-Id: <20250710131107.69017-2-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710131107.69017-1-hardevsinh.palaniya@siliconsignals.io>
References: <20250710131107.69017-1-hardevsinh.palaniya@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::35) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|MA0P287MB0108:EE_
X-MS-Office365-Filtering-Correlation-Id: 46925a51-b1be-46b6-f4f2-08ddbfb356d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KRNBbJzT/DHnofeToyOlJfRIau1zjeAChVORfkFVJ8YRH6QIiJ82nra2nZpo?=
 =?us-ascii?Q?4bT+Y5BSr5UmFGkDSApx3u//uwPeacdjnxp/VF/rQxTCpbN4/mJfxjv9r9n3?=
 =?us-ascii?Q?whhhBFD99FB4hOAvS+EzpIMVdUljNLiDB+RktNotKLjhMg4DwwvVJHArQx5n?=
 =?us-ascii?Q?rBx8OFf6zchzj/Nr+5VOI4t+tqAPfVFmN9ZNhowJvh6G7tAQBSPLbY8wFh3q?=
 =?us-ascii?Q?k2+BDk6JRruNx6Wm+r9gv/2pwndtKskK0dnMeo4Vm+lR+2Leo24yw60PRiij?=
 =?us-ascii?Q?aqQjsZeAaaZ0KC5ESTJIOyEUv7EUuq2FahgHsQNPnaiOM9jH2b1+GCxSJHZW?=
 =?us-ascii?Q?Do6yDYCG+BZ77TE4bijlsoZ35kzSBT7JcinpGYz6mdf4tCHWhphRoohErDOL?=
 =?us-ascii?Q?CWWqaMpAWvFbVxHMT/Nbz1bp4/cgddXIuP52NnZdwIjrqHQDocE+yCprak46?=
 =?us-ascii?Q?hM4zojl1uDWBjQnWk7zaaCiyMCXO2Bg+rsYeK2VZ9Doz8WKsEDbffBp6d3L1?=
 =?us-ascii?Q?vLv8VIbM3JPnujPtIXfjWHqi83x0xczizeDeePmzva8Ggrl65OhkS6QkxKyv?=
 =?us-ascii?Q?/Szyuv8QPW5uLLkDqMytmAr6ggQU0GQHYI+FnFVPY8rCWEh5YRKkOPIFcpat?=
 =?us-ascii?Q?M3mOHG24S8mgTZBH0S+kmv2IeyscAWtLTVthuqnTVSTk7kX1761rPHxbXDql?=
 =?us-ascii?Q?AIIsLsAmrRPMDE+XhRvD4CyAWv6Q6hwf9YAF3j0Ds6dpnKjTaGSN4lMvIJIW?=
 =?us-ascii?Q?2d/rxOixVfsBr1FKPEjo/q+jYXccNPdrCbf+ni3pPRJ/zSHaMDmkOosALfRs?=
 =?us-ascii?Q?ringL1dC8okeb40mdYwa5HffWl8/v+YR8/kflpV+0ChaRO8cpjnlNJMjAVgs?=
 =?us-ascii?Q?NPo+W3uCV5IJcPE7c3cViRh9zFOjyFp7SMT6oJt4ibGvHiWm84EvurFbkAkc?=
 =?us-ascii?Q?MJMKQaYa/285B2GlraCH2L6aTwJdQD19TbyfkRQ9PC7gQt8xrYpPvLB8b6Wg?=
 =?us-ascii?Q?Dp+881byOZuaqkvQn1JzYqkgDlJVsXvNa4sNMLEA7cMA3SiQRr8FcJA/tAM7?=
 =?us-ascii?Q?V5bwNZzHtsTBAfGqPjupn0qd0+CTe0ooof1ylxDQ3uF+6DS4JK/koHuw9UVv?=
 =?us-ascii?Q?txtCAkk26m3gOLzL3gvbb5VoZgDXjTeVqg79vTuxY/J7vWNt7bVejiqV0pcl?=
 =?us-ascii?Q?hmIf1T+H9WQpfNksx9oXlfkitZDbCqsAwP3FY5Dn45Tt1AjFlvR0i/BD0IRq?=
 =?us-ascii?Q?I5BGaUzBDM0AldDNXAtJHfE0ErK8BatJSlLDPvLNEraP/YngZ9IyVQpmdG3j?=
 =?us-ascii?Q?W6u82JFJER0FwRt6Zr1o1NCTIhPHQTnhDR2FMNPLocSq0nsftM4nV0r093ED?=
 =?us-ascii?Q?RQuC1YNENLqQy2fIjoj+KOHZHYzglLSO8In4B7PIkBBL1LRRdMwnqTwVSxhu?=
 =?us-ascii?Q?H9zYOnvWLPQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8FHSuKGoNuF+XWP3fCLz3s4hkv5w1qsd/gbt0f7d1n3ISMTy/wvdmL1ggESl?=
 =?us-ascii?Q?8M33xEGH/7U6FkLB9ph0z0qnFT70Sucb3sou47pADQ98GLyY1CfvznzoXRvG?=
 =?us-ascii?Q?4WZbZKSZWcjXWfzttorp5e2hEyojli71hezSVxcaJT7oM4a0aoNJTaVqnuL4?=
 =?us-ascii?Q?b1H2c/9saHrUhnT7Y+EEOkwOAnl6RIJJgpaN4T9RWM48dckyb4F1UBIB0uxq?=
 =?us-ascii?Q?pvMEAfNbUbbOOWWIO8zTWGD1a6/R9Io6jVUwXj8oNWbKUO9xnU3Yhrf775HH?=
 =?us-ascii?Q?f9c+91DfituiNqLsEGx8O5fS6W8K+U0pFGwNIpIOljAdUDf02FGwot6cL3NI?=
 =?us-ascii?Q?Qp/vkIC6jm3wUNc72hi8yAlPnTmSkkx2bidTN2avctYPNGJiwdNatDC+utFv?=
 =?us-ascii?Q?q5YuVp9MF1b4Y/XKnhqM5U72AM67PO+ekiUnfed4hz8YsP9SrHf6EK/R6hgq?=
 =?us-ascii?Q?W53oxY5kVwi9/FbepN7eZxk1vqU7xq1xvIni+gDoIwLDa9wnRxrwoaHhLZ11?=
 =?us-ascii?Q?QQfB900yoccGT3l449Cwj35uz2LRa4tYOzGOseVm9pULkBVHPz7qqWgGqJ5b?=
 =?us-ascii?Q?zRaR9a3POnNHikFN/j/SRInvKX/Aw0dpYeeZGbITsrB1OmE8+Mobb1ofkLRb?=
 =?us-ascii?Q?AMlIS2+BSzZOqzpFuax2XuyPxldxtsSLQCLjosRcvT15dT1gpGBmATLg0q0I?=
 =?us-ascii?Q?D04EitrvMtvu/XXcFXNH6DaU4ym9AS7RFCfOwOlp25wwHBiMHhddEO0lDmjt?=
 =?us-ascii?Q?XHBPlkakXpBZmAALlvEz42f5GNVofBTy7mW9i+GFaOwYtbGT7amAey9Cs74/?=
 =?us-ascii?Q?tBDJMSSNrDUsaLaR46J1YZleREs/mjlHXRUwiDFUZo7dPA2WTjG3m0D6GgUV?=
 =?us-ascii?Q?+QQ6HCVNjqmGHHLq+u/fVtZwhrucDRIDNvzfvFbsVE1IVQC2Mci3fco5bt89?=
 =?us-ascii?Q?s4yT71XE3XREY6ivatKrRfvYFEyHfXnHJZjhcBg8mxVg19dMSbqpLRxzQbM7?=
 =?us-ascii?Q?XeOIr0bzLzHpRg5u9J4dsO6NSt61FmZQ4MfezMdYpRP5Si7z9YXCqE2AQIj7?=
 =?us-ascii?Q?/cTpnv5a5ffMDurrHeaNGUwkQTJapefcETkYbRivps3Hw5asaZw9NvhZQ7T6?=
 =?us-ascii?Q?AvJkdZFeL6ygP5wpsl84bCZi2E9OzGP2e3p0KsPciOowJkXUDNSMt/xRQZ/I?=
 =?us-ascii?Q?f/UVy/9OexOZdjTdAhLJVqNImbR9GIPq91UWfLi0NUvGI2OLwmlk/6h0qgZP?=
 =?us-ascii?Q?BsZy7wZd/DqjS3MA7kHdDTiJPtBoW0ipDY7o0Pe4Z5gV6/Fh2himGNYBHFMe?=
 =?us-ascii?Q?Cl6/m46C6nml3WbqLYBBFJVTZ7pyPL5xEQaaLAaiwInLREGHrgP61u3hhsgb?=
 =?us-ascii?Q?OPQVtnGTcn84urDe8ZgHjABaLlH/etOSqdOHlBXwsP+c1gGieKyqS586AZvc?=
 =?us-ascii?Q?of0f2PdFb0Y5ENdVSYaH6ePTBGyehioC+XpBJ58+6IODa7UN1+gmiXEjM/t/?=
 =?us-ascii?Q?lIIUn8bg3dFvQ+hyVqUFq05VBcvrzuTMLXa2fmdL/5Nm5iV75+kqPI0SnPD1?=
 =?us-ascii?Q?s9a9BGel1RaRN2OTw5vYaf1OcG90rZeTGjBYMapZr2+jhb42BI82vwFLkv0Y?=
 =?us-ascii?Q?WzIrrn7QVRqnqh/ph8yW57k=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 46925a51-b1be-46b6-f4f2-08ddbfb356d6
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 13:11:53.8081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S63WYP2sn96B3Ut65Jt8jW35mfxdGtyU0z2Ems5QEl6OZ839zFJvkM2X6BdCv1E31SkgnLqx9t/hdaOpLguZKEiTNwNzvgnQUdncYqSWayWizzn3E/gyqZ0kCbsgOphf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0108

From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Add bindings for Omnivision OV2735 sensor.

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
---
 .../bindings/media/i2c/ovti,ov2735.yaml       | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
new file mode 100644
index 000000000000..d9d01db88844
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
@@ -0,0 +1,115 @@
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
+    description: |
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
+                };
+            };
+        };
+    };
-- 
2.34.1


