Return-Path: <linux-media+bounces-38682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D96C3B16BE2
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 08:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2745C622AEE
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 06:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36301242D8F;
	Thu, 31 Jul 2025 06:10:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020133.outbound.protection.outlook.com [52.101.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F59F23B61F;
	Thu, 31 Jul 2025 06:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753942251; cv=fail; b=CZ9ER4u7bbQ8vxId8fEbDNGGORit21tyWDBRocYFHGoI4LFDQFoEGoKANLwjcA+gryHL30Ybe/zeitJ9xCI5eBGLY4c8a+/x7kIwZMs5J9jGvlGorY0/m7b0Sym6X262UpBkN7va+CHyWBEAHs4Ze1TAG3MG/zmLmnYxz8oEMDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753942251; c=relaxed/simple;
	bh=pb0BYMVWADbL0Ba4XK3jHn2A1OgRmXXuvVzcgK/HkqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eECzt5IzEWBrD7lhNDwcRg265kMxoEF6b5KsdL7kEXNpEBRwrxzXz5gD5Cwyq9/qLlOnIyw8hQbb4fbTYZ6df5k+Uzp+rZ0CXk3S+aBX8cxM3cSlW9W3KbnMVliu6V3OZAn1JimMDR+Ofv03gOfgIxMYEwEoLGvkVEjJTKVckko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4vWsvdpX1Wpd8Agvvw6jBeiSLmZsxMDQOG9qRKGXD0nZcFA3yb2h+5kzOCOBd/Zf5RBcleptmjzWnhd+5rbwjOIPD9TJCQGH9GZcOn4SRyDJqvJpH/ka5DBQ0uryzFVQdnY5NqgDKetb5rKlNpK6+AVIUwZbG/Hvs3Fcqs52MgPtQYSPlCDsID/QuwA1w//wvYuprrdp4/RUId/AhYGnElcnC5HBNr1ALhZ46EMIi+RKcuodhe1hkmA7/hPgB16zsE/rW24HSf6Pr28HQDHwmDvhXIRaj3GO+pbFRC0y7KsLzye5yMuJaSsA0by4c3Ov5ynBgbP7nU6MpQkv6b0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IZu/fbd5OQx/ecIHRbqukOUZ0tTpHxR4cwBoSRSN3Q=;
 b=yRn1noSPMwNwdfIiA1mpmB3A5LlV4GlbZOQ4FGGbG5/y6IiFs/gHkKBwWGZYz4nQqxLZ/kTMIwqeihd3lltx90vRqUUO+mDhzTDcdIp+Mp9a/NgKSOmQgwmUaPHdj7EGximNQsa09lEwjdUzDvDQp5RTW2TH7HXzh+5ndo8hxBMnEKNdnCmVCNgIzjR6QWE+6HQJeOlh/VbSb/5Rx0CEdSdftbbcfHDoZ5OtM0sKyMiaOeE1pPy/FO9pyntfZ+qO5iyk10F6bRy3E1wFcgdKvmiJd5sRDnBdzSit15niYDe30pB0PHGfGCTZYqMw3hmECVTx3lDxEhfnBCjPZjcJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by MAYP287MB3886.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 06:10:46 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 06:10:46 +0000
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
	Ricardo Ribalda <ribalda@chromium.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Matthias Fend <matthias.fend@emfend.at>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Date: Thu, 31 Jul 2025 11:39:57 +0530
Message-Id: <20250731061004.5447-2-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
References: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::13) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|MAYP287MB3886:EE_
X-MS-Office365-Filtering-Correlation-Id: c637a7b3-8e23-4f78-8c77-08ddcff8fce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ucL0a1lbFNLTm8IazDQA6IRwA2QObNoM3X+yGC9E+Xe642MKaYUQBfsW+uO/?=
 =?us-ascii?Q?pJcXtiQnCU9NgYjl12m5pwo+yG8ECDsxZ5azVOLK+quZLBqKF+6Jtqh/jdH3?=
 =?us-ascii?Q?B3NQ9BQ+qTlUpxyrp14PcruC0ONrXxvD1NcbOQ9MU/BLuKms5dzLE/r/hYBT?=
 =?us-ascii?Q?A9W4ZAWFHX3jAOQhBbbPMTuJF0DDUlqSqjwFtOcnou9FbUJTVjuNVRoOh4om?=
 =?us-ascii?Q?bNbbOOP5BLrZkh2vWifyvcDgg+beMEdfxEc5KN3Mqj/BnnFPMr1+6bgUmPC4?=
 =?us-ascii?Q?4cNDdSw1NTi3dJ/WyW5a94rh/5nDv2miBAh9w+1ZWDFF6aOt0/lb4Mq9cEt1?=
 =?us-ascii?Q?da1EA8dR+VAxFSsPOiG6+e9WKvi9S9h6PeYximr+YucCPNMQO+9vdsU4RcPL?=
 =?us-ascii?Q?sCROUy6oEPXDwm8AlQtXs/eNESfIyg3+El9drdPhaiMOHzCEwzxnLRSZG65j?=
 =?us-ascii?Q?qQzGQVxnQekja1oG26Uk8UpAaw4HJihSFwok+E+/xHWlRQtHqFIzU6Wsqhhk?=
 =?us-ascii?Q?HRnPTIoaFDxo+tqfOBoTT+2XR6BbM5nwTKesVXOTCtW/dfUMxepy9iqfVYCo?=
 =?us-ascii?Q?CYfS2JEw19llvsou8kujNWFYS8IPbXuHoe4HuAh5vGTMwERpF2USfDeB+h0w?=
 =?us-ascii?Q?uSLTiiVuR092gohW80Vg+vyOgIeAd7YEpuMVoilcoT8HCNTX4aIrQclMpa9O?=
 =?us-ascii?Q?9GyVrOU60ZFU9uXGeIrbLjuK2DPhiL+fF40GJAIhUMpcJIV1nw4pClQXrRjZ?=
 =?us-ascii?Q?ymw/3i1MGuUJA6lcOJtqb6rtWpVX9U1NCsJMe2i8lB85qPe4bSjHWHpQ5iBa?=
 =?us-ascii?Q?ClGBjpcdsCVXDH+33uxplJcXBUTc6TrBJoYZx6KYrgkGq7VHKIdjZomNZCcf?=
 =?us-ascii?Q?V0jIkWr04fdsc4hEiyyZfXRkzwLA8lp784MTfTMRWwQ+HKZz37nMgavpjcUb?=
 =?us-ascii?Q?jC5NnEB+ap/0JUHr2VV9IDyXHtqhqPpM38FJNT+jHvSTh0FageUM5+rLb1ND?=
 =?us-ascii?Q?24Nn1tKiMBnvg1/fUVl7Cyks0USdTT/H3hf1re5Y7VmaSWOBww1yWByq2Spg?=
 =?us-ascii?Q?GOduC0tXo3IjdC5CmaHu1UD2nlhJeY8XYp/L6eepRQ88aLc2PaXfc7JCLfrT?=
 =?us-ascii?Q?joprdxab38zylQTTDFbp3rMacLM+EszFuK2Raz3u3n3jsJNOogAX4V+3jdH9?=
 =?us-ascii?Q?yHZsqo+7hnHhFB37x8g5Z5FvHCa4Id9QYZocIkTPkv11yu6pryVCmJKe3RTJ?=
 =?us-ascii?Q?SEGt9TA7mLRgJzBoDD8XU5vuk8omthW0uc0hirI/iTpI8tw23sv8RQbjBj9A?=
 =?us-ascii?Q?GxZfXFBkgT5TIT+JUHzLMMgWbfmGjKdQTokm1w5Axv9vgc0autI/WmzeSsPv?=
 =?us-ascii?Q?qB0EuqnpLxMfqZGzrcq5f1Tyw2Je28uZ/4bQ1HfMpgAz+3FK3TPlMAI8AH0b?=
 =?us-ascii?Q?PNXqRHbU4kT9MWJ7cvdw4/AiBcmuFE4o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PyK/M714F4USaed72WVt7+Ls/qTQGf1dPFhlTOtS/eIcAkJrIQ9wXUbmfq7x?=
 =?us-ascii?Q?qtA7FYCvOAApFd6ePlrjJ2ibEh8gHtzfkfUFezpea7Y6qp0izlU+kHcQj8uz?=
 =?us-ascii?Q?4RQPy7Nnr6cFtGOr2NQrviH4LkIO52gy64Hfos264pcaBnZMdEk0HTzYIjLw?=
 =?us-ascii?Q?OiJcKw2JRF8shqsKgD6UrKk620LEvpN+kqBnwXH2ZPx6mM6dQ+7O6+F0MWQa?=
 =?us-ascii?Q?bPJHr45qOwYppW7TUKRrXUeEM7wlUEi8+CiZCORx0eBD4fC6w4WQi+brrcZ0?=
 =?us-ascii?Q?dJgaKV/0uRA4sSBgwLBYRC3099wxXseppsYcJHsVDR/DD/fhDY/ASjYyjw8i?=
 =?us-ascii?Q?H1DYeOohM5u1dbviHvts8Kc1gH/oTc/1XwCoXmOOoNbZziXs/0VupsH2WEnd?=
 =?us-ascii?Q?hBalkX03+lnyqojFs6h7S5ZsPE6nS0Xx/hAMPnmBebc9EefdIWvPPLPsRQ1n?=
 =?us-ascii?Q?JysJRhxUK1zxyeP0iSNryoxYUDVSJwfDtkWX6dlKiq+SJ92Ia7O+h1c54707?=
 =?us-ascii?Q?pCoHdY8peRcWwmX7A95ixNCT2Y/yMozmtW9LS1u3eEjFrOFaLipHPBib4LMl?=
 =?us-ascii?Q?uR0gsPGGHHvEm5HwOJztxnNenEZYY+10KGBMgmHQD7J+80dEoh5Vq8tmyjdY?=
 =?us-ascii?Q?IcsoKZxO0LkFHP6Q7bmCKS0wdN+ctYmrw60nQLpMogky8+fVL4Qp74ozkbhu?=
 =?us-ascii?Q?XVy6quuR2nLTfHLNC7kWnuxasJc9FNLBRka7yu9GHcKIk1tBcfNmZWLp01H/?=
 =?us-ascii?Q?rFYIyrernmdpf0q+r0K/L0FQT//0jC9oBDERYsPfGjpw+4MoOs81HGLWCtaE?=
 =?us-ascii?Q?QGxRqlJgGYd+9q5zChmHwRi2JKtNhMHuVKGrJjdkeTlOEGEsIi3MOsv74IUB?=
 =?us-ascii?Q?XA1c0yY5wrmbbZPDUJxg3XplLcyXy8cTvWWW7a2dzKPIpPfgWAwyRwbjAwNs?=
 =?us-ascii?Q?29AZVwY/wcaWHMzKk3yAsK3OSh2Rt7FNO+cpJTRj0Szo6OAE68BYaQpgyVKG?=
 =?us-ascii?Q?t12kvfcBBY+S7noNCSQAX7yDNuwDqP+9TWZXfiL613aAEZJaqGnkoCjlMG3E?=
 =?us-ascii?Q?la2xmS6F7L91XARwPpHrCJhO+BFV7DDeUT5zObkOZ45l4r7eSTsml45fTWMG?=
 =?us-ascii?Q?WiZNF0idc2D+DzIx6d+LGTxPU9mBI9GDcTWNfHsaTj/vBFgY1csefZMPECG2?=
 =?us-ascii?Q?hCmNb+p0WhymcC4vn8ZEEjqN3FGocQHLpVhHpSz19P+sXCEwz8G5hUnllf8S?=
 =?us-ascii?Q?sGesO1HFZ/ajTlD0ZjSDsTDcc9938PaknCQnX140fhRVjHEdM26D9GJjr9T5?=
 =?us-ascii?Q?s/oZB82Nc3c59DrlDNOialwRZwVVEvoUKv8Nx65oaY0ryRKcd0TIIUsf3MWo?=
 =?us-ascii?Q?ByiPtEhj4dBIJ7F6QP+nyHSFInYEmvCpskocdpPQf2uO2LjH1npDhsWTKkYr?=
 =?us-ascii?Q?9VLaaLoKG8O2U+7wAo3BpLMa2vBvPuZtmp6pARazM1IV0TOZelU4Nq4BnOnB?=
 =?us-ascii?Q?zJ7JRoOHFjz1wWSBA74fvPB208AHjhK5RArNS6XL1RNDw+m717XZcm0xwW1l?=
 =?us-ascii?Q?9zOpAvJsI+zf0wUzRD9t31zrw1LNDzSm5Y4auooUb4oHMP9KrwbSgMngzWJ/?=
 =?us-ascii?Q?4UwC+39IrIrtXcLNbbIhzGU=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c637a7b3-8e23-4f78-8c77-08ddcff8fce5
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 06:10:46.0487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +e/LTPQMe9WLQxdFo4XgpF9U6On8nwZR2BHgUG1hPwQQutRIn5RqEuzpaS/owrzjTEiyp+em3OYyUObPMuUPFelCK/8M1IZn1oOezrb2QT1VOoS3LoNY8DoGP8Z4yrjg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3886

From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Add bindings for Omnivision OV2735 sensor.

Add MAINTAINERS entry for Omnivision OV2735 binding documentation

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/i2c/ovti,ov2735.yaml       | 109 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 117 insertions(+)
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


