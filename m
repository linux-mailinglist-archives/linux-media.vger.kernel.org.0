Return-Path: <linux-media+bounces-25798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65701A2C184
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 12:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90D0D3AB72C
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 11:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BCD1DF25E;
	Fri,  7 Feb 2025 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="N9VNasw9"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5871C1A9B4C;
	Fri,  7 Feb 2025 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738927827; cv=fail; b=ZxXP565Y53bNefmX716GWzxyO+/VlhhDRwJPEN/9KfHKqZyH2M8fdPddZ2sWy3V1l/js29RPJRbYgUPQkDUHd2d+74MQd66ilylWOk5d07cio2+fl38bcDDt+D2IT/j8BP9+gfXEH9o0P+jI9NkK4dJSskv/y2eY7DS9Mk4DDrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738927827; c=relaxed/simple;
	bh=GmE+8U2SYof1nsHFGCYl5HLBP1OBFj4yskRL+o9Qvp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QCDtRnVKdWVcadOItfn8KHjjCPT+qhqznkWDeuEncC2ntiR8rQXFOzr7m2HaSKx+pbiNkofsvsaA6JyTash3hSwEOzIbat9STeHP3oHRSbhHhGqjwHIiCDuyekllfytD8x1AW0LrtCCdUUTDKjGWSqjGgp21/YoGdgP6I06O1Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=N9VNasw9; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bI8aWPb/bHtBH5QFlFsUDmhV9/9bEVUo2TA6wCF2h9u2BgG0vG3e0yrothtiOEw7Gxs7VDjUHq/PMtcQuGPPrpTBKr3WdBZZCjJPpUKl4ggneWJm8lV19lVKEJSKnBqtAq5wPdggnqyjknrGov1Z6Aqiu2B2cb0ulQgx+VoFfzTxIZvHsxhSJxNXiq1SkZGRpJfEaLM3lANCkvMQUNOLC8J8MwKX0WPkdIu8zfY/18CfgZKXMFeNDNiJn5hUC9trBDWRWY1ka6lbgYFPFy8frX2HPYnNw45icEIE++40wGNt5i+CYUU1aAce6MCCPe1KTsV4KQQpzRCuCk7M8epp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXxKxwQrFfb9TNRAqEBaRJ/DxNNhr4sIyL0wLmQSTlI=;
 b=i397nW+5DKqZUYW4UNecWFH7mwOYWN2aD7SSRyLnWTQyq6XD6eR3khmCH8QS3VzUVIwBCFyqoeD5H94jVRuAxJOc4t0MOmIazqxu1M9X95z8w7JmEqKKMRajeaElOGgKlPGcKjahxVpV2g4k2Gi32FGXKKb/noEExZEhHTcmX0OueQ0lYtnhGqPdRL+lrzsBXmXAuM59OXyn30ivRY1q9xwG/QN1swC6BMew+wzGR972HWwu0m1NJvrdaSpbt0rKDUSPd/gumNORrOWyPpVtFoUKdsAzS5EeIqafFaLjpliK/2OKRrKqntwGNvXpsG2NWhWa8m9RDLYFFW548fq3DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXxKxwQrFfb9TNRAqEBaRJ/DxNNhr4sIyL0wLmQSTlI=;
 b=N9VNasw9VZlVozwSo9ow/8Qx1lcz5pyMhyGBvIJ1osAQrv8jir6rmXs3wQMQym70s2Q+yvjuDRRnZK2X+E1/9sZCH/Hu3WmCT7XUjFSY2hzJLzAeWS3g0kj3E6Xkkzt3f5IvRm/A3zaVWmMIUq2FhTkPKckoa4kSFACDPoI+MjWzCpXOGI5MeVXXfKTGFXJPTZfqBv4eLjvKZmVtd9wVqJb3jLalQj6pHD6XGyMkysKcyqmtLbn9KgoHWgVCVrKcjiK3ozi6i0RPiIfnwg2CfUvtbwzbA/4sf58XyF/DbOueRYAX0BmZBUfCjUiOnZus8+zxuQvBMKO9u4rSFaOldA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 7 Feb
 2025 11:30:20 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 11:30:20 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: i2c: maxim,max96717: add new properties
Date: Fri,  7 Feb 2025 13:29:55 +0200
Message-Id: <20250207112958.2571600-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::6) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 991a0035-a99f-46ee-c97a-08dd476aca8e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H9+Gf0VOplWJLc0cWFHeSXLh09hlyfa6R+QhjruC3Kl2NougEoKr7i5VDBKt?=
 =?us-ascii?Q?jxp5ucr8oIBNfVNmdvxGPFB1F8o8AntNHH2OB8OfcBGN0F7i1TztNH4tzV37?=
 =?us-ascii?Q?ZjQ8Z9qcKN8FfyWJLUu9LP0ICMYyu+2akOyasMzvrXUeFq7dmCbAFnFqd2as?=
 =?us-ascii?Q?nLYDHkD1+Md+cbWakdR9VuuCqQJoSBmLsY5ki3uYXz9Z32g67+yDGzdJEIbB?=
 =?us-ascii?Q?x8VIvdvL2TAJR3EoRIdc5yu4g9swxOizM+nxMGsibG/SN7/irbX/IMXgfTRK?=
 =?us-ascii?Q?EtXb+BeT0f8h9yO+OESUJrD+s5MeGZmFtqNzpVEUrzbaBU1UjZYbujIBjXlz?=
 =?us-ascii?Q?uzTBM/2G2hDg8kJiU5dHXm6LS8ZuaFbRBavdiiVE4h4EFuHe0l9CUhM/gLDX?=
 =?us-ascii?Q?UTiRJNFCXjY4MOIClw1jiL+XEey0lJBIVSLmaB3V0EeQ5ZTvSSTACeHh/AGU?=
 =?us-ascii?Q?EDMn0tlj0GhNdP3FntBoWGZwBKNF4INhKk62SUK/82cyvu5I3STkIGvWqUDM?=
 =?us-ascii?Q?RlRmsAlfHEjAdNtGYurC0TnT5Rz1AYZduJPEeYhH+kCvjKOIQU4m3ZVKoDZc?=
 =?us-ascii?Q?BIqWAexBIEHJSH9vzH8lBX2hqepeGuDG+0YnqDzwjMa6Kzm8uqzWK8eiD/ow?=
 =?us-ascii?Q?xe8XkzQRaV/HkGTzy2yqG+90VTy8VLdRlIhUOv3K2bJUIy1kOh7mYGZYqBT+?=
 =?us-ascii?Q?dB0+IpnJuu91C7BH7U/oF/wsugi/nchqXw+KYiINsng+rqpLxOY3BgqO/M1A?=
 =?us-ascii?Q?xWTua/xoMMF5ry1pBkFbnTt+cvK9YKlZ04WMzd/y5N6nYyn471d8X7HBWXn4?=
 =?us-ascii?Q?PrEgWlEP2TfeWfb9Ppol6ib5acr/XCpHqY9m9KXaeCepzOEeKMM5H012gJg1?=
 =?us-ascii?Q?BtZkhWmKTXegcN/t3mBC0TT6ga0+IrA+mTcJ/pIrYwfBcvYGHzNQsoU+TpG/?=
 =?us-ascii?Q?6Qe6styetPsgASdna2VexTvygEN2OfloZgRWVeq/ZhMj/ZBIi1js5jTIzevi?=
 =?us-ascii?Q?oYC6iXJDZZlg7QW1D5+CD2liW5bh8yXqZwlBTGiOKWB1kQ830H0pJLwUEdDl?=
 =?us-ascii?Q?KELGGOHyfHf4gxY8oi9NQx5LvyL2iZEmvULe0tFVydkXkYsh2JpQ87XLCQwt?=
 =?us-ascii?Q?Y0X/r4p6Mt+ofTX+JJAWkKyRg1vk1nZcKQYe6zPpDnZdV5bFlg4doWEXWMAo?=
 =?us-ascii?Q?hhouA1dsI2hKLFFyWZ5ALHp94juFDta3sIbI/nKt7MwDVA0DvVyOl7/GvBIh?=
 =?us-ascii?Q?sS9f3+6Oj/xRedtCICK2Mm92/xVCJQo9xcH8pQIcvF3tVZENLM9OC5DEknYa?=
 =?us-ascii?Q?pQZPBmidQ3a6nJ6/6FlD1z/7JXcOaXugF6LmWVwTnsMo9qJBh5CF/ZahpMvP?=
 =?us-ascii?Q?ADwp+1ehnNsf2MFZ8Ji7/Ud0EH2F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OKVHdra/pIvrFTNdwjWX5OBW2lR1czw3YnL9XQttK043iXofibmP9SEfbjN5?=
 =?us-ascii?Q?WJUEuMolbV9CcAcDsCRUxf7WH8QRbC5TpBVcJj1zJJRm4ZJmiScotz8C3Egx?=
 =?us-ascii?Q?WnQT3vDb+W0Tn8ayKtgUrLk2asPyXQtAcfXK7tc8umvY27C+FDxDbZ5nQhNB?=
 =?us-ascii?Q?jSBsZ9tOCRCcxGNHRthquO2FpVVDR9Ncbg93S+JPfvsMupq5v/nYVNFGacqd?=
 =?us-ascii?Q?0EllV+A2KmUhmVMgSOKl1FN9yl0QEvTeSaRL8IeeD+YzS+PbTu2aM1mOTPL3?=
 =?us-ascii?Q?zUR0HNzeB24uPHLdc2MxMBw9u/E4/NkqVWcXdsZmH1f/tejsOh/65k0KsE2L?=
 =?us-ascii?Q?gNBMyGd9xlk05hp8iroZJSxboS2L9Qzpvwg1oECx4Ms44LJddtMf9egl7Js4?=
 =?us-ascii?Q?KJsdZFocv2OnOf4JUlegTEf62XKSpkqvaMcXETesgJ6Vj2/Aa4zbqJ1Q6AqB?=
 =?us-ascii?Q?JMzzH8jUgISFzo2PavIOVg6pB9ApAEDfCLuIvLLjQPwaIWG7A23eOujL517v?=
 =?us-ascii?Q?iI/f0HbB72sEMO7fQu+++4JtT6kyse+2MTTPlIfk4ZhqiBW3q7D5dUp3yK8a?=
 =?us-ascii?Q?nrvUSYVVbIYpeDqJ2+cxD7fdh0XC2hhilDxl96VxIf7tlfqp7L6znF8pRRTm?=
 =?us-ascii?Q?EExtsbVvhqSjlRavJk0m4QhCBvB0+HYB7DUibUztXy84Jz2hl1nygkAAS+wT?=
 =?us-ascii?Q?gWzLWNhB3h2VL4iuApQxDw+j1eI8OVv/vQpL5AkZaPLWkYpWT0QZTDaiasBx?=
 =?us-ascii?Q?iHxFeYRk9jBV2/P/X+tzt65rBj6QAlTEYabMJccd4DyYAG5Oi6Vs+I7aWV+I?=
 =?us-ascii?Q?Mw73bvil0K1z5Ez6ttS65/60/3SvLylYZcebU+7S2jPuJ7hJVOtr3lbZEOq4?=
 =?us-ascii?Q?Fy70ibplc7QwcqbeAqFIdwXsoZE6mStWuxZd9e/Suz4ihNwKiA6nmCis542P?=
 =?us-ascii?Q?JCEabpGiGTDu1RtxDEgJNBLZhrnX9Nx6wUTC4EAjcEioT9zIotgmi8dxCvSy?=
 =?us-ascii?Q?2fr0YHdXb3Fv0VIBSfqsjKTH1Hmam2mjQrTm1XjlAHvVDddt4lHdo8NzwO1F?=
 =?us-ascii?Q?Pw6n5c1zmK8fa5dqjfX2xb4wWDUYQ5r8deELLqCaiv8sC1/JdWJ6G3XK9t9n?=
 =?us-ascii?Q?hP7ubzKDRAwtQkhKXgHEjhOrjM/trjy4k8iFvSOBHtgmRoDWtnlVa2j3bZ8U?=
 =?us-ascii?Q?TTsapAjRsCR720ysrRwBmOOnP4NHyAv50U17RCvA8zijxr9jH0vgnFi+rX/Q?=
 =?us-ascii?Q?dCSJQlmdj+2t6i4P+3DqLx23bEfOywDqlYxK2b5HXLS+mRGR+5wtF2cb8NCB?=
 =?us-ascii?Q?S0sCgH0meYRF6ZVffkm+TMf440bvFuuvPyJUmzNC8l3MTSOkpHlClox5J+Lt?=
 =?us-ascii?Q?+gGvc4YVcewMdY9OVKgkNGj45pHPUrZy9f5tY9oUD06rS1VNM3OHZMB7O8KU?=
 =?us-ascii?Q?MEg0YK5oqTaLLLlng1OblounqD/s4jHHPfopvgsOsHQcop6hrkXfkwH7hNtU?=
 =?us-ascii?Q?FQA7mHtqNQvGE2vJ7i+ZscDSrS83OPmG6IHKKdFODo0eru3zOE04igBcV4RD?=
 =?us-ascii?Q?n0cFVMSvjnZJCWM1wnwKNvb9J+KtgeyrlstmNKvCi0MPAU/b1aboJMeFXfgt?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991a0035-a99f-46ee-c97a-08dd476aca8e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:30:14.8594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zpkmEFQZendAv+ExFex06b//sAZAI66OJnd9JZsyl8YziD19elB89zmbh33ZfS5y2kJlGWo7Ga3tVpPTQNwSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392

Add 'maxim,override-mode' property to allow the user to toggle the pin
configured chip operation mode and 'maxim,fsync-config' to configure the
chip for relaying a frame synchronization signal, received from
deserializer, to the attached sensor. The latter is needed for
synchronizing the images in multi-sensor setups.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d1e8ba6e368ec..fae578d55fd4d 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -42,10 +42,35 @@ properties:
       number must be in range of [0, 10].
 
   gpio-controller: true
+  gpio-reserved-ranges: true
 
   '#clock-cells':
     const: 0
 
+  maxim,override-mode:
+    description: Toggle the operation mode from the pin configured one.
+    type: boolean
+
+  maxim,fsync-config:
+    description:
+      Frame synchronization (FSYNC) is used to align images sent from multiple
+      sources in surround-view applications and is required for concatenation.
+      In FSYNC mode, the deserializer sends a sync signal to each serializer;
+      the serializers then send the signal to the connected sensor.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: FSYNC RX ID, needs to match the TX ID configured in the deserializer.
+        minimum: 0
+        maximum: 31
+        default: 0
+      - description:
+          Output GPIO pin used for sending the FSYNC to the sensor. The pin, however, needs
+          to be excluded from the gpiochip using the gpio-reserved-ranges property since
+          it will be used exclusively for FSYNC generation.
+        minimum: 0
+        maximum: 10
+        default: 0
+
   reg:
     maxItems: 1
 
@@ -113,6 +138,9 @@ examples:
             #gpio-cells = <2>;
             #clock-cells = <0>;
 
+            gpio-reserved-ranges = <0 1>;
+            maxim,fsync-config = <0 0>;
+
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
2.34.1


