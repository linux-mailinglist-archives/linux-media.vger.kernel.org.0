Return-Path: <linux-media+bounces-49898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA21CF34CF
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 12:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 815483027DB6
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 11:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F5B32B9A8;
	Mon,  5 Jan 2026 11:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="E779J8ES"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021081.outbound.protection.outlook.com [40.107.57.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842EA246332;
	Mon,  5 Jan 2026 11:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767612926; cv=fail; b=ZLcH7kR6pzDqcKJvV+gmJfjFqH/cMUXXulDDNrzTMTNfCgwMjwviLh3EXYMiQGLZ0CwFijtGz9ZWAYCaoSXnA+5b3D8myLcFxDMTko+wqg4QxdOREPUTO/NRMSbU0Hva6fnv3g89A1FVfgtCbXh70YXRbx0Xa+UU5v0gU3D18I0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767612926; c=relaxed/simple;
	bh=FbTN1ILiAuWeFE0x3fO+Jai1WeWBo2VF5/fvydBuM2U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=anPTVpiSmrZeEXxodWF6X32W+veBebvlhq53Q5BFKrQY00e85nUj8v4XH7F9F5yMagw6Mh+O2Cd4/5FS05Gxdx6is3udoGoQh69wm4X31XxXTBhYi9GkEXBFaTbsrYj85kRW0VRTchiG+v3Cx+PVdlH0c4qt8XWtbqFX+FZ9nHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=E779J8ES; arc=fail smtp.client-ip=40.107.57.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBKYU63FfPTOMyglAis7itvbwAe9BKnn1NAbDRyLbuNVGZj+bAnt6jrzyKQrcJNeSeXrxk3qOuqJpAM7F+BnibIqdqPTBBM3YeL0exKtzoQQ6KfzJ4ac19WjcdqTSm0i5p2ucBuVnd8YCvM0YOfSDoXYN0PMrL3B1joP2ZlJsFBS1IRtYiON7QsaQ9asr1WwROZAL33e+L+Nh4lC2VNFMqZWKQ8i7fqq1kfdsa/6xBCKW/RuPBoqaGQYzveuFlKqWrIHWKZ9O4qKSsTl9MTCqyvALmpWJFsCSSLpkh+sBoAe2DInkbUN4elUV+36F2vDxpVd+WDJ0SQFGgvkFaAd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knMZuDkPmpu1oZiR2Ryd5ORA6FOts/PypxNFU1CIUFg=;
 b=O639K9kYzf7U4Z724Bw+OapVT/vQgt9UhgmHkGYYaScybBlghFPBAcud2ziQJJ7LRPodlpyNGCkZGglX02Da8xh2WhMznjhA1YXVxPmckfyl2ofEYi9rz8XjlnFhv4Q4Gf1TA33IMEmrE/Bkb0vDz0TswLUUTUV7rFv37cqVvNKpe5P1DU91cQHVLMEIehNtCuV/lUD/t0CuNUMWDqEvDPIVaEW66xXt8GDr1AgwXNJE8Ga7/DQ4Cf6grus6wW0ev7e1Prkh1Yis5bZzecRfG/mvGPY/rsjFkfuyimDHD4ay06NPjKLmCTAF4fkhUl2BJZ3EkNRzSz3Dfoz1YuIWSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knMZuDkPmpu1oZiR2Ryd5ORA6FOts/PypxNFU1CIUFg=;
 b=E779J8EStqTJNld4bB/m3yplgxc9qrwIT89y7kOlb3ZD/77RpoTtvDUYyFbHWLsBsOD2pLKSBE1Ln0jEpN8A+VyjsW0KrpVQ7glz0xTw7lRvhGs07Lt3BF8fCgEW1EWiCwzjBMMF/DftxJgHpcWeo8XMelztWv2Wieh20LcTQXLxLPkB7eGPldTYNxojepfA4PUZCV0uGRMlsjvvJsOgbwrygYz+k1BprxLyvmh6mTZkGp1PKCMWVyifKDfMBhz45dr55EntjMdIOP2XtF5f/kXf2X0HmupcfyvNiR3SG1RxNCe3ZGPVN9BfjPLvavBzIKclYeEnAY1V837fRP9oew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PNYP287MB4591.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 11:35:19 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 11:35:18 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov2735: request reset GPIO as initially asserted
Date: Mon,  5 Jan 2026 17:04:30 +0530
Message-Id: <20260105113430.120620-1-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::8) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|PNYP287MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ab26b8-2122-4a56-ab61-08de4c4e80b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DAbkymHA9ovY5kvcSTf+bYVsuLyKSaMOkAwFGEdfgmyuSL9DotYftZMEWtu+?=
 =?us-ascii?Q?UUvmgEZArs6C06xE2EtP5szpVkH6HBxGTIlb+dgP7oBbwpldZASKv2XTugc3?=
 =?us-ascii?Q?tHHpKRPxynG0dfHBdaiQvMTq76pFr21MWN1QWxImA5cCqQteKZJkgkliCyrU?=
 =?us-ascii?Q?4tRpl39yLQxdaB5XxwkFF+Jqubh4fVX7pYVbw7w8DOINk36v8ZCXRGT9eVo+?=
 =?us-ascii?Q?vZg+PEuTuknMncgTd9J8Uo+IWFMNz+YO/HATe02XDHT2p2qUdYP6yfCQMnms?=
 =?us-ascii?Q?G3OGDe5UVGO/QBakVuHYb5MKLTZ55jJ4NaQx24rKKImiEdwZ7ZFsEuIXaGEj?=
 =?us-ascii?Q?TvwvrE4j0QWszWLcBt3Oje3IYtVaC5UXNtaRsHaVTLjujQPkObleIw6hAW8F?=
 =?us-ascii?Q?lNCJbXBEtDvopA4jLmjBiQkaA3SrNrLaeDsvBwnmKRY526NOj+4Q7Pfzx51B?=
 =?us-ascii?Q?Z6eb4hgaJyfd8pSWLwhkP0d4QEyy5abMDtVWLdN1QwWqUSrDBzsovadlgUA8?=
 =?us-ascii?Q?GyCLMVPhtZqZpoETyZ3/U5j5sgHXGBB2urmXxzxovhW5oy3epd02zv8KwDQ7?=
 =?us-ascii?Q?Br7rrtLrZNXa3pZju8lzxtcsMVb/dwCJHnUtisVfnj3nNPFp7/VAMbqy/wun?=
 =?us-ascii?Q?Ydu7/39uLc43P4vsyvwXx4DgghdQxf4bwyolE1JW8U+yulFDPEOF/wj+bM5S?=
 =?us-ascii?Q?TeB/Dr00J1QQDshYP4KdkkSnxvUJYMirs9V4z2Lwuy3Wn52k8c7KYPsTsvnJ?=
 =?us-ascii?Q?yhq2lWM4s+rk1PBWh9w3xe1QJ2fNlbNVjxannweIV6NMiCISYd9kvEdKBDL6?=
 =?us-ascii?Q?rj0m7x7d7gFA4VO+Sz1EkI1TKBk7q3fMSAkwta/87HkjB4XhgASEND93w77q?=
 =?us-ascii?Q?td0OYdbVr+D9JeS5dSz/G2spyjiaJZXTRuF1NkzKhmI82yb8lMoK+17b7uQc?=
 =?us-ascii?Q?6eT5bATvNVBlb4kKWksgSMKk3+heAyeFaZS07fPTp4Wov5FmUx6RNTuL44QL?=
 =?us-ascii?Q?A+90zSyRZ9jpkQ7+Nc1DnwYhdy7lWZetu9gdqPcj/KAFzbjWoGmh7SXpR+6Q?=
 =?us-ascii?Q?pSn1PrxR8gRgtn5t1yGwvY91J+SdgmYD6jLt5SI7Do4xyzQq3G5TYHlo9HpN?=
 =?us-ascii?Q?kZxRfxGLOD4y3l8zeudh3ujm7w3RZ1RtDurXu9IFswhqHxY6A0kSW1K8cnzJ?=
 =?us-ascii?Q?K6/cuWx3TA44tWjxbE7cF1Z/48FlR5V5kJnoUcYI3lT/8UtxnsJ0etbxEmJ5?=
 =?us-ascii?Q?0NHJFKp4LpABcq0cV+OwOFdanwqbS7FxAY/kfFb1r0NzG4H5AQI5aNaH6Zpd?=
 =?us-ascii?Q?Hr5qKsBggmqKFFFAhCadtVLIkVvPSAkoa0kpbRZzd5pCMEAVdyyimg7zI7Ea?=
 =?us-ascii?Q?JsDlIS2OCJH8K6xUMlq5ggi7WX2AoIAoTyVSMzCjPnxytpWVgCP7bT6nbLO8?=
 =?us-ascii?Q?spicnMHiJl/R70wTax5V6xNmWyKHb9xowLdKPJSTP7dgKbdNqSQn0T9dUsLM?=
 =?us-ascii?Q?8FLNoBCqfBaFORsJ/td2ijMFqJQjgeGPkIq8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ngQAkueGip0y5oK/FNo30izv7fbh/bsMo6eIYN1cwQG4CdAh6JMXiyPEbMJn?=
 =?us-ascii?Q?BoiyBpXw5IkoZp+2lFf2LZRCYVrpD8gs4xQcT/PyYh7h2FU3ACHZRzUD2he1?=
 =?us-ascii?Q?POvyUXHIXiXQPj68dmeJ6XD6rVQExJ2X8BC1EEvLS6zYuKz3b0gK97tOvLB5?=
 =?us-ascii?Q?TbDHrpimyUNX1CQBt+h2FmBG1BL3F2bNZLUdjvQebXQGRn01Lv9c+na48ygu?=
 =?us-ascii?Q?qIGOXK1RX2/uLwyD7QcNuEGcJwQJitV/hbCc1Mv5DIU0mkha8bTzGNOiwdZ7?=
 =?us-ascii?Q?zSoSuH6q7UNJV2+ui3NZv3mqdSvyeilSlEf7d4SYBcnTFV30WtVANF9FNtWI?=
 =?us-ascii?Q?fV+8/y2//pZpwzawPBsDpAzW1m8sbGscj29rE6DHQXFcFMEoexwNJpo9k7+s?=
 =?us-ascii?Q?6x8II9gtOFkjO/rb2OW1u/ZLqMMAPS8LEbRjpbgkZaHLWAz8aEOlMuH2BktQ?=
 =?us-ascii?Q?e3u+FdhO+odnDXdbeYAAZQgiPEAvNPv4YKsJe5MUrV93IAYULoVvm8AwxcJz?=
 =?us-ascii?Q?xj4h+6HARUpbuHPqH4wXU0X5HAYKxsVfKgaW0GPMOxgeQ6k0EkT/Y0dc7KSt?=
 =?us-ascii?Q?3e0ADBCRNQi1WdB5JcFEAgIV1wgFg8mdoeJL8AzYAQ1KrENSWqX/to8QcpZq?=
 =?us-ascii?Q?DYU9dKDLGHyF4+lec8+2LmcUcMyozDuPwHG4uDXZejJD9yKNpc8tIwvKKsp6?=
 =?us-ascii?Q?FGyC3TzwK21Ejz5wCPrR2RV+G9GtuTc0T1oAZyquJ++3iaB6/KwoRd+GD5qN?=
 =?us-ascii?Q?lQeVy8aTaIHiUDr8WDYOv9Sty11XxXnhFprpNoJ9e203tuL8WPGIykGdspYF?=
 =?us-ascii?Q?1kHj8MwH43vdqrkRbgbH2fadnbvPklWElY03kUoRajV/UxpKseYYP+7XsyOb?=
 =?us-ascii?Q?uIA9QyMWwXr044+bRjqp7kZBQXJ8/swTCJD4BpPYP9vKpH7fsJaKNIt3aK02?=
 =?us-ascii?Q?kjNgvVtgPs9+V6TjklIajs3PBZgu3cqdS1n8cA6xdGyeTvEvadSZcVed0E80?=
 =?us-ascii?Q?ktAgUqh/AfmL/N3D524PKJMAxs88Gr0ul/GbUROvzCsrRlfIW5AOuJsJvIjA?=
 =?us-ascii?Q?sVUSOlVsh8io7A236DSmE13ZOlPwwUHQIIyqg8ZeM66x6rVYW9Y98muNLK8/?=
 =?us-ascii?Q?K1tZAIsISwp+DKHzKuhJo+tb4l+BTH8sfWQa433PGh7H89XjDuC2ytG1+66o?=
 =?us-ascii?Q?4P1UfJDChaCbRoQo00te7O6qkep4RNLHCH7Xmqc4VcPI0I2vDqxlP4MVrwrD?=
 =?us-ascii?Q?DM1X6RrRJHJlBZxMCVY+uTWjLN3D2nrX0CT7uo3iugqGwDHgXEOm56ZR+DF1?=
 =?us-ascii?Q?hPqyerDUGrsKZJR790ax4t7UV9Sigy7OVLnrl8QMEz//5kzX9BZCaw3OP5hu?=
 =?us-ascii?Q?lFo7a67CWP83bx1HnG7JCoXvw1XmCO5eah01oDmqjnOdS2lHuyXmg1Q1He/x?=
 =?us-ascii?Q?6dIC6OOkVHEaeaan0F6BVGNK6lpmFP9szMVLdEk6M5EpVjrbxfj4JBNiq7oH?=
 =?us-ascii?Q?TF6bmjD8WQSc0qHEVqFOasP/weLsUTWkmdcw7WFZtZV0GqdFPdbMkvpk0ytB?=
 =?us-ascii?Q?DCZXD1ymUphrqbo5KJiYnAMvzddESMklF/8RuN7brz0keA6MKfxocNj8Gris?=
 =?us-ascii?Q?TklTpWHvXWhpOh9Le16hQBRrKdzbD8mXEDoiFP5XfvqUzYJ2/xFIwBcwEfVr?=
 =?us-ascii?Q?ndtyDSN5pzHS2+6Sp+t1sbcDaGpAiRet4MDWp6KDqS19gxP6m8rdp9LGQgOK?=
 =?us-ascii?Q?HRbbrjef1VV/+a2d+2iQFaPu/KBmGuc=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ab26b8-2122-4a56-ab61-08de4c4e80b4
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:35:18.5181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fStnLUDw3JfpRbxGZ9SfCYVuu21BtWhWl3yN+M2eYyWdhOX3UFbYQSdHGyRoi+YXYyN1GcICWRCqZaw9w5vrB0ush4nzbcsqNp6tg3N6r2oSU2QwlbuPcoLIow6x2iUS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4591

The reset GPIO must be requested in the asserted (HIGH) state to keep
the sensor in standby during probe and power sequencing.

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
---
 drivers/media/i2c/ov2735.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2735.c b/drivers/media/i2c/ov2735.c
index b96600204141..dcb1add1fd9f 100644
--- a/drivers/media/i2c/ov2735.c
+++ b/drivers/media/i2c/ov2735.c
@@ -993,7 +993,7 @@ static int ov2735_probe(struct i2c_client *client)
 				     "failed to parse endpoint configuration\n");

 	ov2735->reset_gpio = devm_gpiod_get_optional(ov2735->dev,
-						     "reset", GPIOD_OUT_LOW);
+						     "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov2735->reset_gpio))
 		return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->reset_gpio),
 				     "failed to get reset GPIO\n");
--
2.34.1


