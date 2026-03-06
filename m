Return-Path: <linux-media+bounces-54759-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCgyMhPKqmmSXAEAu9opvQ
	(envelope-from <linux-media+bounces-54759-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:35:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF1D220BAB
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2144C30275B4
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C2B23A98D;
	Fri,  6 Mar 2026 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Q9Gk5Zt9"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021120.outbound.protection.outlook.com [40.107.51.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2A62701BB;
	Fri,  6 Mar 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800466; cv=fail; b=sxhayhXLtol1mfVWBkb5X4jYHy//sAHSzI8ITzKOzQ/NcIs239XB4EUtcIejnhhERrs2YmJ1aMUuRuNUnU/eIAP0otg3hDEYqJeTPSkoRf6NO9foCR1BqikBzW7PaPBJZvUr/aqDJWK0jRDiK67tPyeiGqR3GHhpU6bwSymj//A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800466; c=relaxed/simple;
	bh=RDsji2ddP0lBsHg6K/gojwC0OywIRWNua6l4ruNuN/M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TWizsrsspgCDxFzanHNlOE/Kbf8fFnF7wAIfyQHrW0gaqY2sIhLaHSZMg9HIv9/IgHhaYRdDsUHnqnrAm2merIKLxOYm3l/m/psq09Df5HZchBpnUQ2RG73Zvtp8bytuUt5fCSrOeGE1EPTUQ/bel0NPhF9sq3dbB7Jb5SYj41I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Q9Gk5Zt9; arc=fail smtp.client-ip=40.107.51.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HThI1J+gcUbrvfM7E8FBtUJ1PFuYbHYYg7oNB/ovtZAnQNtafLNFaUHuoJMDUThbfrcswqLKdF6iIHnw64N5JsdEgjxvUlDQDj6YcVdJ+DdbO9If/T5xUzEeRSlNFub0VLwVt1TtOrKJh6/ZTwqBIQ9FYkheqDaZyU3bH541IbKDYCTRyzeg4irE5GYC47rlaf9WgxGQBSebL/y8wcStx5I/UolZy1p0DZR3nDp9Ky568ljl+ocrIu8O6fEXDOGXTLfdxhJxwCtwwCsXRcrI4ulGLysVAKc91X1LqTKvA4ttBwbLUGvqcP/mWV4Pmupd4p6cVr83yvwXfHo3u4gC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vE4NENhHcobocm62QdQ9zd0bcsLtTJZJ/HI8JGG0vs=;
 b=mAytMqGPCxmJNN4NFwSmeNWq9VNIq81DXERVcLMuOgRhuOh/8bxYObtTEU519Zn36GsR64XrFMzIGwIfHacaLqFUV6kYeMOYwSwpbbkBW5PEltMrsIJRmd155fMw0cXGawZLwe4y/uJ32sXUF6eRdFIKCxpg4Rm5pYZZ0eii3Nl4mXKwYa0cRZllVNBOTOVlFdVggyH5wl+xVLl/JCrEDc/Se2Cv6Yo9ks8Ub4GYAN9dfxMfhUXNMpsFzIA1eZHTQnji3aJFoStf9cH9AZEwvkkolm7C29wILU5ZYYh9YIA+DFCzA8D/Hx+ygBb8zR0m+19P0mUQEBTJRmeJaVkd1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vE4NENhHcobocm62QdQ9zd0bcsLtTJZJ/HI8JGG0vs=;
 b=Q9Gk5Zt9cmVdjNC7wreLfdl1NQLDyZjAAknUIk51Wj/BL6FVa0B8PdbzJKoQIIz2W1P73nUV+EWz3gX42s+OObLSUKqkmiKXcPiFIzfKOKU4/Ntbirx5RiqIOcI7RbCfvDrCGNFKDS9mji0tYQ3IkfxE/+llNkKqyGKpvmOvBZmjyo7Z0EuqyuuIUTrl3xAneC5si+iZz48BWYJXxn+1X0IPH/Ge3QR/x1qaizarn0Nxp30WHXXmsHrU6BrU04FRm7Z6Kc2eC5m3sEbrS6p1kFqvv1WN7ENlLKJ9zIdYcKSg74z0o34ma+bWuhd75BV46neKdKi19jVxCDPA6rAsDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:30b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:21 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:20 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] media: i2c: os05b10: Add H/V flip support
Date: Fri,  6 Mar 2026 18:02:55 +0530
Message-Id: <20260306123304.76722-6-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
References: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::17) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNYP287MB5365:EE_
X-MS-Office365-Filtering-Correlation-Id: 055eb9fe-bb26-4026-eb38-08de7b7cb0ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	JJ671YUMLDSH1ntwsx1BVWssF7yf+nxzp+3mOhj5fMI0wDr72al59qDw+EoAD8pKflLVdsfm1FlEf44CZcY5YqQbEXb3QpDMAxcIQhvt3sAFKjkXqTjjqwt42NS1z8PSeh3ET0bIFMeXPuP1splylsidOhOD78grBZWOCL2mOJ5ATc+EMZdIEMmIp2InMhoHbWRFLYStAUlmKO2wAaPrnArOIfcENwtC16KciBbqTf63KbkF2R6SuN3t3707CrAw3TJloIgxouHylHEdbwqWYgiWaK7NkiKIQGIap5IooNdS1sm/LT9TyaB3oQmf1yiT8FDjElMmAnU0pTEzCqBnTTgKfzEratRepNCIGGWKpGlibtVdz4gFSAsAN7m2ncg7hh1WoyHEwvyHllu6UfDfxLAfeQVFA4hDQA6vhARojqvCa7Qb017dt5fHKN1vCn0JXpQD90RjiB3DUYS83AZN3LJf7CSpCBuflkXNkpt42KWewj8B0KvAd1yO5jYqQR/rO1b/oo/lQkEUNac/HQZYw+9FmqzsP0t53DReKqo5K7cgfi3JWitaKwEX52p0g+zacfxiImQ81HLWEJQP7Cuoyucv6RfR+XeDe5+wCcCq/Dc5QHDu+udUbKoiPTYaCsYFCdiAffGL6RUxGwzt9AFZ7iq3z3BeIIEzz52++2UKGqpa+BdO/bV6gZs6IcpUETAO5sgmJKvdMdaaMTefqv0zz2173VtKcYzu3l9FQDXCXOTqA3KV2H6SUmHiZsTtEuBCUcNMfynbTfBGVcHX4pHJ/cPj+RSNZAY8a25AJkTwLyk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3zpWD7MYscZl2ETUGcXKli8ngPpffPNul/q9lGtfBcdj7qWiQAM2oNhV7gqm?=
 =?us-ascii?Q?WrQobC+VpuCaGrGcfU1T1iqu1bbP/hCAXfv8nwEvf51aeog2hP95JUa6fmpM?=
 =?us-ascii?Q?87AFcuw01dawTknpO2AHtwzb0nxVF7GaYQCiZrZoc/9MXShG52tKZKMf9iLn?=
 =?us-ascii?Q?gzr7zN7qEVC02i8XSuyO0UQCS9oCfNak6lz/xEXmtrYCdUHykfaEijW0e1dt?=
 =?us-ascii?Q?ZTU/TTpWMnd6Z7Hrn9pRciLJgMMIXW3gbku9KVbdCLinyp/uuLkHfB4EcxAh?=
 =?us-ascii?Q?HKJowVmQQsOl317dafF3rxl28EtbI2HKr1to1OioXquVqsnf5jMpimxPo3AM?=
 =?us-ascii?Q?HV05DFIfzkZNrrS4YNd4KluyYqJ6tX0gdE6lju56YbqtMhl/00rBRAqjpgOX?=
 =?us-ascii?Q?8dqCwb9Kk1hrg/mLbWkRU2OHUqgK4RTaHuRLF7an5RfmG8VBgfrkD4/pFhRn?=
 =?us-ascii?Q?XoryCIeMbpvVSnOCITyOtSCcmrMTH5KJSiMa0xSKsbeUT9ubPnB0pIb3B01a?=
 =?us-ascii?Q?FzLw74UggP5tdXw7Faf6VLlYncYrJ7Wgg1V4HTZLdEXWm9hsm8MehFb7ipF4?=
 =?us-ascii?Q?ECeeFwdEA6zAXFDF6AkbB9KTrzZWxGz7lwdbj0rGrd7ZRcFroSwvy7pdWhK3?=
 =?us-ascii?Q?PlH9vpIuiOdrnXTAwb6Juxu5yLcJufgoGTdtc2gLrAIdNky18cm8qULQCPOr?=
 =?us-ascii?Q?j5dJRbZbL+SI3P+e8Gh7Oe9qs6CSuJXmCJUXAAjRQPYDYawSOQCJTGTJd0sj?=
 =?us-ascii?Q?Ut+L57ie5Rm1+KalCha+7pjiPSSlQ1RUImf91wc8Rp+EFUX8uYOAqfvsEx/F?=
 =?us-ascii?Q?JVnLFAAfgmy46q/fyflbAnquGV1zilX60O3RriBwtCO2SSqmJ8PRjtELJaH0?=
 =?us-ascii?Q?jtenPJv8HTIHguIxRQr5+Iv+KsXLBrp+ViXpPbqdlpGE2LMMfJHvwOuh8Vwb?=
 =?us-ascii?Q?wufwMNAHxF787/gKlTemcqLu39y8QuO9zS9rpNEwmqJSj0/H/rT0EYw3qdRF?=
 =?us-ascii?Q?OM8fLjp7xf/E11CnaAKDnDpiLhgYBVWASdVnhmd8BZFBF0eXw9IcyAA31fWP?=
 =?us-ascii?Q?O6CaOelek8AVGTP5ENXucZzTw+r0EyeP5rYO/q2jW4EY5cFXrEMaZqrP2XPf?=
 =?us-ascii?Q?XGcVFS29smgUYACstUp4wAwBoCfqYZVvVCxZ8FyZIS+lvVBVeM8Yvle7AkmE?=
 =?us-ascii?Q?B3QqAbd/F1bHjhZe049dEJOYbKq7fFuDItLjfUkJIfWCiWNEut6qbk0DGJ56?=
 =?us-ascii?Q?o/6MBVhkHf8z5r+rAqoyarJgCWuqD1T+QlYOfxiPukot7T23y25/2LJT6qmw?=
 =?us-ascii?Q?xDbtJCZ2CjiOscWi5jxURtyAYiqATeiREG5K6OktcqVNmmYlZjX1R+Qex3tY?=
 =?us-ascii?Q?nepdCm8M05QEvjyV8jTASKG/e4v+BZf3RrDUJKj3yHNNFzAkD543D9QtegfC?=
 =?us-ascii?Q?KGKUl6wMmTLOsrlSW++7aKWKIxjevAL+XVwcPLtLPSE8wHZQsTuTBOt8rF7J?=
 =?us-ascii?Q?gPvHCyJYmDGDn/ttrqla/N0yJJtYvyHaXYAfTFeXB73+Q1mDwvTh7r5n8CW8?=
 =?us-ascii?Q?tTHF3WxMyCqMCamn9FPrI558DFwojWC95nKsYhiq3AGCrYErmGYcd1IVNIYc?=
 =?us-ascii?Q?mn2/cpZP1UVyE9Obkxm0WUSWEWADYKG+Xbxc7jsmatZY6kCUqkOkpeqGoaPt?=
 =?us-ascii?Q?O3zQ2DkYsl/PCxTbgbe2dv5w1jQlLflyVFhX8viikVyKF9xLNszUgU29ONxP?=
 =?us-ascii?Q?czNdLURWmUGvjGGqP/Uaz2bgkeqGfJc=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 055eb9fe-bb26-4026-eb38-08de7b7cb0ee
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:20.9505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4IPqWlKkVhicBeRc5ZQ+V5uIl/yxxLmHn+0KQccSDj/4CLxJ5mtQsempbmgPwPc6lALvJg1b8bmjEI3OwQEAs2yTwReq4adNloEHgJpcSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5365
X-Rspamd-Queue-Id: CEF1D220BAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54759-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Action: no action

Add HFLIP and VFLIP controls, lock them while streaming,
and update the reported Bayer format based on the flip state.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 58 ++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index a9a8000a8154..009097a00eff 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -96,6 +96,10 @@
 #define OS05B10_MIRROR			BIT(3)
 #define OS05B10_FLIP			GENMASK(5, 4)
 
+#define OS05B10_REG_ANALOG_FLIP         CCI_REG8(0x3716)
+#define OS05B10_FLIP_ENABLE             0x04
+#define OS05B10_FLIP_DISABLE            0x24
+
 #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
 #define OS05B10_HDR_ENABLE	 	0x04
 
@@ -232,7 +236,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x370f), 0x1c },
 	{ CCI_REG8(0x3710), 0x00 },
 	{ CCI_REG8(0x3713), 0x00 },
-	{ CCI_REG8(0x3716), 0x24 },
 	{ CCI_REG8(0x371a), 0x1e },
 	{ CCI_REG8(0x3724), 0x09 },
 	{ CCI_REG8(0x3725), 0xb2 },
@@ -466,6 +469,8 @@ struct os05b10 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
 
 	u32 link_freq_index;
 	u32 data_lanes;
@@ -514,6 +519,18 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct os05b10, sd);
 };
 
+static u32 os05b10_get_format_code(struct os05b10 *os05b10)
+{
+        static const u32 codes[2][2] = {
+                { MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
+                { MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+        };
+
+	u32 code = codes[os05b10->vflip->val][os05b10->hflip->val];
+
+	return code;
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -557,6 +574,20 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		ret = cci_update_bits(os05b10->cci, OS05B10_REG_FORMAT1,
+				      GENMASK(5,3), os05b10->hflip->val << 3 |
+				      os05b10->vflip->val << 5 |
+				      os05b10->vflip->val << 4, NULL);
+		if (ret)
+			return ret;
+
+		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLIP,
+				(os05b10->vflip->val ==1) ?
+				OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISABLE,
+				NULL);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -571,10 +602,12 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct os05b10 *os05b10 = to_os05b10(sd);
+
 	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
 		return -EINVAL;
 
-	code->code = os05b10_mbus_codes[code->index];
+	code->code = os05b10_get_format_code(os05b10);
 
 	return 0;
 }
@@ -713,6 +746,9 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_rpm_put;
 
+	__v4l2_ctrl_grab(os05b10->vflip, true);
+	__v4l2_ctrl_grab(os05b10->hflip, true);
+
 	return 0;
 
 err_rpm_put:
@@ -733,6 +769,9 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(os05b10->dev, "failed to set stream off\n");
 
+	__v4l2_ctrl_grab(os05b10->vflip, false);
+	__v4l2_ctrl_grab(os05b10->hflip, false);
+
 	pm_runtime_put(os05b10->dev);
 
 	return 0;
@@ -741,6 +780,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 static int os05b10_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	struct os05b10 *os05b10 = to_os05b10(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct os05b10_mode *mode;
 
@@ -748,7 +788,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	mode = &supported_modes_10bit[0];
-	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	format->code = os05b10_get_format_code(os05b10);
 
 	/* Update image pad formate */
 	format->width = mode->width;
@@ -929,7 +969,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	int ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -975,6 +1015,16 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 			  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
 			  OS05B10_DIGITAL_GAIN_STEP,OS05B10_DIGITAL_GAIN_DEFAULT);
 
+	os05b10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+	                                  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (os05b10->hflip)
+	        os05b10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+	                                  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (os05b10->vflip)
+	        os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
-- 
2.34.1


