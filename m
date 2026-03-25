Return-Path: <linux-media+bounces-57002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHT4IlvNw2lKuAQAu9opvQ
	(envelope-from <linux-media+bounces-57002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:56:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A60A324487
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 24A4030990CE
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4433D0907;
	Wed, 25 Mar 2026 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="EBQzDQ7H"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020120.outbound.protection.outlook.com [52.101.227.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7032E3CFF6B;
	Wed, 25 Mar 2026 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439222; cv=fail; b=SCnMTDtH7HZTbvwAEn8WVKdxE6xmPKs9bfWhtQB5f+SGm7umfME2sJZXPDpAAr2inEpdWyNIt5gbLGYwBe2uJEBOb/8vr7ppUJcdokSUO6A0pXzDifKHmb/GaZznevgsq5yfYa5gIYond4Ts9eqeURzFzpPyV/jXFOzLAhERLvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439222; c=relaxed/simple;
	bh=BRUnWregPOVou3eLOrtwaA/8+ejTvFHUqv3VGkmUPhU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U8kMhnTAtqLOWoPwkZwgNb/vL1c6Fe4IXIhPEVIlxp0Lv/LhAvgfpHex6j0K9wC0YT3exufeMeZhAUPxNc+qLlNnV5n+l81hlVLaDgmH/U1gwJVLjfqWQQ3Zgff3q1Vc2pC6lus6wZy+THt5BwvZQb5bWLNigWYWCmADjdrh4r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=EBQzDQ7H; arc=fail smtp.client-ip=52.101.227.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i95SYwugxtyqZMmOcNcq3Vv5oBI089DVV8m9mlD1W23NkSq/m5bL80L+47dVo/r2q1Otn3U5pGJ5BEc8LxheaDgjb7xuqjDuAR7G4ZtOaYRBa2BPR3PIyw/D5oG6PvWAtKSRvo/VSJ6hl1uDYbIb0NYZKrqLHHiNrZf4hwCItsmPLDpKTgdTch1hLdUNvKjo6g/1pUG/V9tyWB5FkqVv7IybB7h2iPugzNkey/wb9w9D8rNmJac6E7h3tY8Fo0BWMxUoXvNZwVkcftg/R4xEZY2T+NNhpL5w4xe9cFb0AeinZp+LuEETWf3UADfgTAykIMMhf+fjlPDxklZ/cPCiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+20EqWohn5xgVSZpHYO1cUO3+0KJIM2A1GS8Mt2/0oQ=;
 b=nrWuRA1vlIRSsGBAzbjnlk9UZSG4Jbrx+EFBHeXJ1lhE1biaUaoURziYlG2j7DCqYZo/vEudTaTO8XXMUvhbiTSkySB4YZyyXsOxqIpteWbJMTvzI+IvDTaGkBS/P3hQVh0wZWW7mzYKTVsd8BhS9nFdMcghsgpQLrFUjdO6hv3+O7qxkMffr10FiMm2Xo+1EOzIvKR36d7UbfvTy85fNR4ny/hRCF0+U9v+FBHY9tEpRcpAq8NqzJX1bsp0M1jEWzyh3jqe4bs9/5TAJ8cfRAvbtoITlUMEzxh3Uo2RogDwPjNZjs2Usuwh8OCZde660Emvn3eb26mP+X0uXHtL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+20EqWohn5xgVSZpHYO1cUO3+0KJIM2A1GS8Mt2/0oQ=;
 b=EBQzDQ7Hh+uUbXiAvkGDWz4eUoyOfv7fLGSAqNzKbYcj+ezCiRo72KZmcRUP2xOm6XybuCi3GROXUbebQAO/JXhy3M8s61Zx/rcXwebmwFt6I/uZ034yrP4YKCMKSCYXTwZamcQkovd43BZ1WI/hdSL4JaOIOtR33ZsMaMvFx56X0nYkG9oYYW4P+tHCt7cylYOp5SWi68WauS9Koxwv55kh9FFH3B7SG4zfW8rWS7gQdNGUkkVA+bjA+VWNpLgIwGzn2SsgdF3sm2Q3+m4aBXykqwbvMqjvlGRmz9d7UHU5N8An/MfIkhCWrs8UXmRMQmI5sTrZgcyUmly5AXf77g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAUP287MB4907.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:17f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:46:58 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:46:58 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	stable@vger.kernel.org,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/15] media: i2c: os05b10: Use pm_runtime_get_if_active() when applying controls
Date: Wed, 25 Mar 2026 17:13:47 +0530
Message-Id: <20260325114404.95188-2-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MAUP287MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: dec732e5-e823-43f5-15bf-08de8a643863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	KQmcX7MYQhFONu+dxnsiK0LTlmq00+PDtgwi9HEzM29Z9LkFaDI7d+EORCrGtGPz/25cSehZc6wX7ir6DGZ9i210MSvx6tOWf9ygc+xIx0u2gVFZZeS4XGgL6hDFNdfep2Q/e1oGvDnQLB5QJ2W6bKMfvUywOU9zhWUUmHhcg5DDPkk2VMYRf+9U1LGbndeuwwZfSqnPUbOhAwdXbPXjeVTBxYwllhQlrIKQN2JjeR3k32tlhjrULLhvihcSHK0JpoX0WTNejicDmYwJWGwcECyDmuIEPij2S0y3Vj8uoxSRCddcfoV6vVvCaaG4OmW1mT4y/Trw+tVcOfL7u9iGmlmwmZmEf4ZwxwDyc8UzofpkHutDLm2an0ZJTVTsY+dgj2u599Gd+jjCn89LcEeUelk1zhNrJgSk5+zQs0NkbYr/2s1rH9b7CO1lBfx7Sl2awAM3aoJJjOZiwUYzJ9MtTvETXr0ZHCKKzy4+GQ1jHq1O4rZKhKZXD2KZ2z3VnK55hc2OcJDQkTfPudKWL4jWBhnqslE1o0HtKqodF2XAfN+pcCZf2qmkTSh0QIRokNo29KvZjVefmrEaJdIADnSHZ2CrY3u7YMbSm28TH6dPZ+Xh6pKX4Tn8+7mSID/FIs0xBqjsnNepIdY8XhS35XAggBHAa7do0KWFsERDPDMpxSiJPIWeOoQF+VlsPvwKkGzCouAI39fHkon2Dh18YeFKbU069wZ2QGlFTBHJYWajI9/HldpCy7K5ORtinpCU4BKDvfLynS86pcrxFsPM5YiLiyg3zrNd/BX1IfT2ZsRTumk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X1PnmV/EtA39i6s9OZz9hW40DC4i5midtslzL0iujJbIvq1g8hS1SK71nZ+x?=
 =?us-ascii?Q?/uamRWPWm/g6VzXg4iSHjZd8bMb7f9kK+Bb1V6GP+cJVhFBC9p/FpAJ8dAfV?=
 =?us-ascii?Q?xqr0r78Z3GV/DmxL6RgjMlp19S5+PiH0zh28gq8CCwlxnZWZTDFN3mpcsBU6?=
 =?us-ascii?Q?oDUqCxQMBhLBmN03PwOWUmYsXY11sJfT9MblyC7pmeMAVWMDUMulwOoXd48Y?=
 =?us-ascii?Q?TCX7ln8GX/D8AWFV3gnznVwXEcS+jnwt6qDQ5EK4ZQ/mv5YDAmjaWk5a/V76?=
 =?us-ascii?Q?Bh5GlNnQfeHhJ88ceC4QB/xP3U2SO9W02PWIvw5e9juhzzsP4DxkWaxIuBQJ?=
 =?us-ascii?Q?AhF7+i+Ar4B/eQ94n0kJaVFH8n6XNezDtybPUtFXm9GFmZuWOn4pUklrL+gY?=
 =?us-ascii?Q?7E1MybWSZca/JQDhPsXVbnBIDCw3nLpRO90cvF+auPpEKYfmrxFzd7mD3u0S?=
 =?us-ascii?Q?li26H5JsnKPg58SlEZFCIJX/jUi4StCWl4TNipPKnlGmGVcd41eAJDwgXs6y?=
 =?us-ascii?Q?C+IyhtGEqeMpC8LfqX4ciFR9bOCCavGrBtQd/fPcdB41pJqmKMMlTrJ8nuQP?=
 =?us-ascii?Q?+ndCfF28lznXqYlgHpOG47VPJ75B8SAX1YosnJ+tPoBpAHtHSRTRA/7t7m1l?=
 =?us-ascii?Q?TebIae1XhXjSmSL17G5EEag/FA+dhjcrFhfyNfvBYEcP/sDJ/CRwvIFz7beb?=
 =?us-ascii?Q?gnwEIeF3+WK7AFE7jKkZeXY9KXyjXyLrkC5OhlBA0uT3DjN0/2oBtSPDppF9?=
 =?us-ascii?Q?R4UvZ2JdS15v6m3wijxiqN7/+U4zB9DZcyAj+NoZkI4OexyZZ0iBrmNxulMc?=
 =?us-ascii?Q?RsvJLVMlLx9i9Hhd5Hc5J3k4N0Sirj1ZD7VaHaNpUkJdQKdjwAL9msgdAmBI?=
 =?us-ascii?Q?dk4vi8wY/nMcQWGLKvpWiKZiYi2uOpZRImDZhvM9RHf/pBJs3gXTxi115SV8?=
 =?us-ascii?Q?FVs9Hiw8kfi6+AWjU0yNqeOrf4s/RQfC4vJ4rejGR3SlbLB7w8Iob0b+/2xq?=
 =?us-ascii?Q?Rsjhp+SWMrPubAymdUdJeplJaaCU/ikPemnYCZcZSVYHNQbofGpWMI43HC23?=
 =?us-ascii?Q?EinGaxT/sMw9JFqzgF9IpW76+25jqBlcixhMwFclobIhKYoRFGUwayFVhIiR?=
 =?us-ascii?Q?xEGQB/Rm5gQMfNua+LgNOMeVJ7uFUSzbLfopjGiPse1YstJEE6vP8oCE6iC/?=
 =?us-ascii?Q?/azb4cLTjTEWZEC6qwlEZPm2dCvKtFzI4fdN+NuOeeUVKEYkrTNcOte/BhWB?=
 =?us-ascii?Q?4P9IpIq0wOkuONagSLdrboKxnKCjWxQhgQvldQ4Xq0GRQpm1lVdDWyojU607?=
 =?us-ascii?Q?e9wNKEA0umVb7hdDL9SPCXnWnDGs6NKIiBOIPFJl02n9+3Ezv4LnzcNq+GxE?=
 =?us-ascii?Q?Lcrsj+oge9pF26s8Leb23/FvzD9NptIc/2d8YiJ6JPbrSNvJp7AR114DC5fg?=
 =?us-ascii?Q?/2KxELvYwFy3Q5apclyO0giSK6lqcS4QetN0owpsw5njZE13zaudqZHrn6du?=
 =?us-ascii?Q?lsO2Pl1xz412UQEJEQAq7v/LtkHjj4SyXOfgJUKBYC9imLlcizj85G4FJoUN?=
 =?us-ascii?Q?ccvBvObyw5vdXzRNaILFq85G1YL4daTqNo3u6gN1G9X35qxFAF2HnzfjjFd/?=
 =?us-ascii?Q?G7v/m4eJin7gPqgdrS97XHM9KJ1XiEneSO6iCAGSeLx+fRwy4v9l2JG06Bho?=
 =?us-ascii?Q?LB0V4v41+c9mBACeYlvQPT47mFVxDKOwDLqXWookZP7OwiovbhWDKjI0im++?=
 =?us-ascii?Q?TZHvqOR0t3gK9U33L7NlAMp2BCiGjC0=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: dec732e5-e823-43f5-15bf-08de8a643863
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:46:58.1619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Os3AcCPWpioqcGw5Kkgq0ItN4LOy+hBy8z5MIZdYQWUYwCUGvyIb9YsXx4n+BXdVpDmm+YUzfhoQCGz0YctzYAbESnDYNGp7aOkuiR0EMMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4907
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57002-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A60A324487
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

os05b10_set_ctrl() currently uses pm_runtime_get_if_in_use() to decide
whether controls should be applied to hardware.

This is not correct for the intended behavior. If the runtime PM usage
count is 0 while the device is still active, pm_runtime_get_if_in_use()
returns 0 and the control update is skipped, leaving the software state
updated but not the hardware state.

Use pm_runtime_get_if_active() instead so controls are applied whenever
the device is runtime-active, regardless of the current usage count.

Cc: stable@vger.kernel.org
Fixes: 3aa9296a23ec4("media: i2c: add os05b10 image sensor driver")
Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index e0453c988e4a..5da5b7d21f31 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -531,7 +531,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 			return ret;
 	}
 
-	if (pm_runtime_get_if_in_use(os05b10->dev) == 0)
+	if (pm_runtime_get_if_active(os05b10->dev) == 0)
 		return 0;
 
 	switch (ctrl->id) {
-- 
2.34.1


