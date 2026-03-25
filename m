Return-Path: <linux-media+bounces-57012-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA4/LM3Sw2lLuQQAu9opvQ
	(envelope-from <linux-media+bounces-57012-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:19:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4F8324B94
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6EDDA3076276
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2113D34A9;
	Wed, 25 Mar 2026 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="dNJCHNJG"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021073.outbound.protection.outlook.com [40.107.57.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D083D34AA;
	Wed, 25 Mar 2026 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439304; cv=fail; b=d86NRFIW8uxvvLIgamwOq8BdFUhAQWZibXw2wMYnWwz6oZGx7KPg445NFaUyA2KZQBqg6PceDLUU7Cmfm4rToYB0sRvLk0SIoFvvAOb+SlXwYhbgaajajhtb2fflLBKObXHHnP01nx3XXH5Y4mpiNAitmVU+m8zSaadhak5BUH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439304; c=relaxed/simple;
	bh=0/zwOU2J/26W3Mus249xmb0TLDYM2ucqD6Cl5HUr5WI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EHKzL3uOGEcKsg44xZS81jjFZMsV8mQsPjiNU3jkIa6jOE7Yqlkbax24noJp4jxsDKFg/w3mg8aoDhZcvGzhqxRSz/AGGZXZpw0aCU8u3pLDC7UwfIVsKUfsDSZGnh8Bg/0q2K5zVOIHTtwJOumfcUxUT89bkq7zH7YhvtErB1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=dNJCHNJG; arc=fail smtp.client-ip=40.107.57.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSTICvx1Plzs5KMDvb3uHWzk0iJP7XDFRM/+a5S/q9UgBi71l3ylDxVwHfPuZB3kV3U8/LnDXQsh+GP7jSY4YnlPiRvY8lSlWwDnCWB1lqNwt+so2NfwW3gZHV4HRkfx9+sZXxnWmNBHHh5ARmRbOdB9pK0gqRlcyS2jwcbda3f2JJWgSXV8WDUU8Ew3zBJMTmyPiVC2/wfSR25gSm6MQMtBNCeePrNJXDfKq7Pld32p956wauVeHKeHof4BOyjzah8qnw5F7+YUPFAA99/KsOCW9ofTLA1RG/tcfZ7xG0PU/XtAWJgXqfGPZWBZZnINVwPt9AVK8yStSczrRQua0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwNoLCC2DjRHIBYyspP7UlLZ05Y2LbjPY0Xiwp4g49Q=;
 b=LSZsDL/P+3kvHMJBlDiB+kMpwC+YNs3qWg8WJz+a/OsntMuVHTeRrhLrURPKmdYmzUq0dXnhpm99teTDdHTaT0MSAffiHyym35BVqlde9+blRQkJ1iSa7j7qDFII0xeKomGjwrjaOYlfxpZQIlovKTAcU7o/AxD/Dv43D9FA530Cv4P8Xkr/4vmtyclUUF2zCBP51Tji1qVjVB/BzvrF6sORkgUwMaViEYAamAMKmF2AOm3OVbGGgbcFV8jXDdT/WCSUo7V2OZTw1eqCMhA5mlwqYsj2lQz4RVxylcm9ye5N7o/Jz/5aVrfaqI6sDVM7CIuB9X/+q9REpQUAbpzUKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwNoLCC2DjRHIBYyspP7UlLZ05Y2LbjPY0Xiwp4g49Q=;
 b=dNJCHNJGhvsdel5kfMXDhy4moxcw7EjFZNxL6/5da1HhiBsNStbind3qABK+T6tUS5nDcXVsNJT9L0/LLmbx6rAVAFrmikQ6DdWD+dmOU8EI2BDh6Mww4W7CDLi2+rD7BHg8Ihq3a2BgZOyKvMW21Rlq3bwvSpGJD1IhWTc6wv3TiGCur3Eel9GMjEILBKN2I7kvRU/8unRsqDCRRsSBteX50vi98bHmAPU0eMrF6dBaiWLVvNTAQtDUzDXFelaovvVWbhsCQc+1LzEWED2UcEXgX6FttgHhoJZtdGtLdG8pO+3xEeogcmUkOXpWuQfwW5HSNcFqpGaDtK2mgAvqQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB4501.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 11:48:20 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:48:20 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/15] media: i2c: os05b10: keep vblank and exposure range in sync on mode switch
Date: Wed, 25 Mar 2026 17:13:57 +0530
Message-Id: <20260325114404.95188-12-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNYP287MB4501:EE_
X-MS-Office365-Filtering-Correlation-Id: b9620314-06b2-46bf-1bf0-08de8a64694f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	x/btqlJdy01a8iVHNIcoX9wyPDETQwEMkjS9eqqfPf2402td09QduMSTuuLRpZP7NSXRwfOArCYE1byI+X1wstXF0Joi5wrgFFrbdnrEgNf09wNm0vFmH6ofuuCoPQsnnbMG3cHCqXWpgqRU9ryRwJ2Ka2VA6PRa7M9Fp4i865LZiOEs5L8zX4yJIr0YXPZSRCCrBcUdGUM2VwDA2TZ2BTHIIdnGRLNCJyzGd7rWUZyCDFNYSooKfThX+RsIWT8gYK931AQRQatUx4+d5/A9PIFOCha1WZ8bXquqFJc4R/e2VNQ8barEbn1S5TN3pakdEnTzwpPlG0L3oo6va79HPwPJYRDg3UWPf8CPKz0KZfaUVvIIxKGgnwGJpVw9kcZjbxTWF5ARQqafGM9GSUeC/Pxw4LGkx4iCmlddUfqOZ6yJiYnllYJ1Lg0iXAUhXDOQFrF5BaQF56crqKwXPZ3tsSdVV1ckeNJ1rRwy1VdYGUkSF7igDKuSxi7rucd77aD2m2Kcv/GQTvZEOlxri0gnEApJRVyCYiChbXn1+j5Ngdnx+fVLDKKbvS+/25F5Jlh3ww4Mr10ofg17bPkFu45DX3KqqZZ0Tr78BA8EtBKXFk01hm6+jKdWtEGU/XvC5SeZwzKoZIS/6o/KXv+IsAqwdfrf+gjvvHer+z2ikMS27tEdEPfDIYyrcWEKHJ9wGtufcw2mmNKHAovbvWVgQjxKmkx/yiMOWUoe8hOhHtF0JOaBhrzpFnR+PONhNUneMTtqpSQFG2Oz1ajKURsAKC0YAOz8ljFLq8ymccV0e9k3GAI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BK+7y2ID1DrnfPi4K6w3vFMVEh5iyLRsvurJo+Mtn3IU7F72sxT5UsheS+LV?=
 =?us-ascii?Q?Idl2Fr+fSBKIoQ14fKhb1kA4arVZU18C6IICuX7uGnPREtWa9EjLtCWozEQw?=
 =?us-ascii?Q?5A+aaq2uknzU88FsM9q3cVCnU+bHiKIjML4G7VasFEPUsWmYnxTyA5K/emA/?=
 =?us-ascii?Q?cc7UHWoyLfAKyHVLtyFaZTFeqvkfNUfu+7QJMqLDHN/Ay7KPkP5RPXd+/zBR?=
 =?us-ascii?Q?T++7mbFrNL1d8Qo5k3zUt2YVfmwu0sq3oB4NOi/D5o6Fs1Us/bNVjddVKTl0?=
 =?us-ascii?Q?96abq3NjpZWJ2gvX82ysaqknl10E+6xvt8/DGuwxN0QI6ao89WAxnpPaVrz6?=
 =?us-ascii?Q?QDhwRYhbGVCdwzxqhl6HhXc0n4nVMmg9c8m78ah9NJLfpY/wqK0qDAna3UQt?=
 =?us-ascii?Q?liGhNXgMVMjQ5cYLAh8B2wF71ujEo5p23WLnWztJ7rFrPGg6PiPL3sTSrTA3?=
 =?us-ascii?Q?SlI77Cg9TGjuFC6rYSNlUfQKE0GuXfKIlog6hkEAmXby5RRnrateK1wlXhf5?=
 =?us-ascii?Q?3bsooNbh7bIy3j+nhi1iR3VE/pXH4iUIj54pXsCgqa8cesS2+vJzusYnpbR5?=
 =?us-ascii?Q?XMPf3Qv1denWSVfPRbeJrzvpR85j8HUgLv9L8/wnFbtpISJI4w3nk1z7VWiH?=
 =?us-ascii?Q?sSLF6VF8YEeA+Xu0Z+UF24BLbplBRGJ+JgrSoRnJo3Z1b5RautitdyE68RUj?=
 =?us-ascii?Q?GT5dciAKsm6gjJBtLqluZlDgxQPNGRH/sSB5dlq8G0Hzdm/UW0A8GasRl+F4?=
 =?us-ascii?Q?G0WGDcR1iLiXBVeQ7Hlqy4RWtZltFuFNURhEnBRZk9xvseMpeLXfCyH9FzNC?=
 =?us-ascii?Q?SO0vNf+uyHUZ8zhh2uONa5ozxnDrXOujj/ONIl+WTN+DOSYFia8razIYVCPx?=
 =?us-ascii?Q?mU0bKnJJv4ewKxh/NdHc3M4YFDwQbdO9LZ5c3WKJwhWv5HmyKZpx56Koo0Ly?=
 =?us-ascii?Q?xRW3TLq1ntcBEIDlhe1yPLIhZCd13Sk+9zgbC7Vc7zU9MFpy0kZ9fdFKkqtf?=
 =?us-ascii?Q?Zi5WTvNas5iz6pkimDHSBxrPdIi5c7pWHd0nzHM1Ys0TPnuEMLtTIsn3wrU2?=
 =?us-ascii?Q?U4JobH3mtEC2mRsU0HS/ygSk1xI8Tl/P1c8u+W2Q5iV+YkAoNPyzHgaPIwqq?=
 =?us-ascii?Q?sSok+xJBw+u4AOYh0AKgKn6mvRPnVt7CqeVigufzGtsQL4EzL+9lvPpyY6LP?=
 =?us-ascii?Q?l8FJZqUy2jh32wpF5HCdsxXwrv3pbGMh1n6OzPLY3n2R/yorVgz7QCnk5w4F?=
 =?us-ascii?Q?LfAjdEUn5x2fhkwdKbRwN5cU7ykIlbO/p0Ns3xrVijQN2l5hx1LTpHGkJwBe?=
 =?us-ascii?Q?RYvg47C3zLNbRn6v4dxIw4IYfkusaLi+RAkS7WytFJQYZXFJyy/0lw2cmQr5?=
 =?us-ascii?Q?crsWBa0isj+/8GaK70Iqrbq6BvBGF1Cz/5/NtIWBKB4OcWY2e3Vq/g2bZkhZ?=
 =?us-ascii?Q?2rIaYRkhSWtc/XfsrViX7ZhtCFe9m9anDjgTLXiD8jJ6tySpKKflletjNkq6?=
 =?us-ascii?Q?ogVGgpfw6YmGDVmfv9zN+l+SXvGhy2tAW760P3EfeS+fENSx1WU7Dp2wqkm5?=
 =?us-ascii?Q?KdsDmOSlwMC6LNQpFgTPSL3cbt6hlK9r6TiyeLtcHv1At9NnhB9VP51NaEHr?=
 =?us-ascii?Q?pWVpO+BUni93BVX8APRQsJSN9KHdIGkw6gBlzre+p/+5sBJyAnfO0GmWGCBe?=
 =?us-ascii?Q?ColxaTpiZbUJJs7wWMIQDHPWkUvRBZU1IVLMZtCHrvcACfPKozcQmFKXqjig?=
 =?us-ascii?Q?cPO5z0bOpkwAF1QWsl27avm2TclXDEA=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b9620314-06b2-46bf-1bf0-08de8a64694f
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:48:20.2465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PV6A/4Pk4x2K5UKkaGXpji24SJOgaM3ZgDa9RjKHvNtL5QDMi8o2jjz6kR0JggX85bNv0qnVJ9aA0D7lmUeySLJvBn/+p07qapBBOpRHPec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4501
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
	TAGGED_FROM(0.00)[bounces-57012-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Queue-Id: AF4F8324B94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update vblank through the control path on mode changes so exposure
limits and default values are recalculated consistently from the
active mode.

Move get_mode_table() before its first use to avoid the build issue.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 59 +++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 1496342c24d3..e3dea793121d 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -717,25 +717,52 @@ static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
 			 os05b10_tp_val[pattern], NULL);
 }
 
+static inline void get_mode_table(unsigned int code,
+				  const struct os05b10_mode **mode_list,
+				  unsigned int *num_modes)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+		*mode_list = supported_modes_12bit;
+		*num_modes = ARRAY_SIZE(supported_modes_12bit);
+		break;
+
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+		*mode_list = supported_modes_10bit;
+		*num_modes = ARRAY_SIZE(supported_modes_10bit);
+		break;
+	default:
+		*mode_list = NULL;
+		*num_modes = 0;
+		break;
+	}
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
 						     struct os05b10, handler);
+	const struct os05b10_mode *mode_list;
+	const struct os05b10_mode *mode;
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *fmt;
+	unsigned int num_modes;
 	int vmax, ret;
 
 	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
 	fmt = v4l2_subdev_state_get_format(state, 0);
 
+	get_mode_table(fmt->code, &mode_list, &num_modes);
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->width, fmt->height);
+
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		/* Honour the VBLANK limits when setting exposure. */
 		s64 max = fmt->height + ctrl->val - OS05B10_EXPOSURE_MARGIN;
-
 		ret = __v4l2_ctrl_modify_range(os05b10->exposure,
 					       os05b10->exposure->minimum, max,
 					       os05b10->exposure->step,
-					       os05b10->exposure->default_value);
+					       mode->exp);
 		if (ret)
 			return ret;
 	}
@@ -819,7 +846,7 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 				      const struct os05b10_mode *mode)
 {
 	u64 pixel_rate = os05b10_pixel_rate(os05b10, mode);
-	u32 hblank, vblank, vblank_max, max_exp;
+	u32 hblank, vblank, vblank_max;
 	int ret;
 
 	ret = __v4l2_ctrl_modify_range(os05b10->pixel_rate, pixel_rate,
@@ -844,31 +871,7 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 	if (ret)
 		return ret;
 
-	max_exp = mode->vts - OS05B10_EXPOSURE_MARGIN;
-	return __v4l2_ctrl_modify_range(os05b10->exposure,
-					OS05B10_EXPOSURE_MIN, max_exp,
-					OS05B10_EXPOSURE_STEP, mode->exp);
-}
-
-static inline void get_mode_table(unsigned int code,
-				  const struct os05b10_mode **mode_list,
-				  unsigned int *num_modes)
-{
-	switch (code) {
-	case MEDIA_BUS_FMT_SBGGR12_1X12:
-		*mode_list = supported_modes_12bit;
-		*num_modes = ARRAY_SIZE(supported_modes_12bit);
-		break;
-
-	case MEDIA_BUS_FMT_SBGGR10_1X10:
-		*mode_list = supported_modes_10bit;
-		*num_modes = ARRAY_SIZE(supported_modes_10bit);
-		break;
-	default:
-		*mode_list = NULL;
-		*num_modes = 0;
-		break;
-	}
+	return __v4l2_ctrl_s_ctrl(os05b10->vblank, vblank);
 }
 
 static int os05b10_set_pad_format(struct v4l2_subdev *sd,
-- 
2.34.1


