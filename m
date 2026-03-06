Return-Path: <linux-media+bounces-54763-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM7HAnzKqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54763-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:37:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FB5220C21
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B65B13033E35
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C912274B59;
	Fri,  6 Mar 2026 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="UOjPS7k8"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021105.outbound.protection.outlook.com [40.107.51.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB42223507C;
	Fri,  6 Mar 2026 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800483; cv=fail; b=oecttTDVkLKlnM5MhgZ9cNDysD6jt2jmAtOImKz8McD/rPRgXly8Mtx6zp4u08aPDEkcI1wG3M8BChqp4uJCCOuf77R0IUuWDeQ/33NYDR6MiIEabNQRQqqfkI2oY1E//n0n2gHSWp2lFlbbWbDaw4taqdmcTl3cDV4ji/9Upgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800483; c=relaxed/simple;
	bh=jFS2T0EAERbAtB6YTmyKzun4TOdMKVyfhqA9iQxOwo4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sym30+O++vfDAplE8DUT/ny7dtEnBEz0GA3bDapMUwKjwSCTyjE63cjcPBEKPySe90L6DGMrLY2kkXN6veklZbZGrQUTVSmMS3mIiuCcc8QOw0pP+2+SE2xZXR6r5rQFnno/Bz4gWyQC4ruQHEdisP9UNDqEnT7ZQyxNJGSVgsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=UOjPS7k8; arc=fail smtp.client-ip=40.107.51.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWZ2eamK5JZY8EKoR0KBotKQbVfucZrkU0WiDrIZ9dU3joFxycVFiEr9ROelBSxLskHtPeUvTWqLdwaDKaTcFeaToB80JOWo+JCd4RTqtGBJIghbjn0PfS36KIIfUKCV2L7w0C9N3prloJssKQ1EwdDsTi285mimTmPN0mE50o5haGmIKH32F0umkCpH0xGQJVcCsqirIi+EKUUZmKRpTiqyITd3QtwBcptFLNLpuDkpMYDqiPWJ7mCIVEudqXy9z3DQC7bjWw0nffr33CNC4IYuUMUtoAu8/7iplyaIIVIUky3ixjN6ybyCmPKgwqlsUGxXklOqY/NS4xC7P5QctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TeCTJqIZ1LUyrTLx8AQBWdNu72KFhXMQpnYw+cPl9jg=;
 b=lnvmHIegMFKaa269+5wjdkMHJKYAbKEos69Qm3S9PqZr+tA42SwrQFHuWqzRVzDHKKlGNdbOEa7R3YOc3gfcYi7XGrf7UNor8TFktvDaEK5Rx0+KQYTj/n86z7UWf+oRxQmyD8/Sv66kt6Ow/gzXJPD3ALYoGMNva28br13beP9DojY8S32vexxnPLBtdfWGHKs1MhIGVw0PQYjn1hG5a7MOGFhBvnuGjYuyBJJEbB8rdAoHcFvC5dU1yoHLHBQE7NKoz2eU3z7w4C88nUBUsZBHBuoHOCNRCFbHLZEQQWZSZ9ZpyDJt9h2pBVa0AS3fnBjDjR7MG5X6fo9wMXeYMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeCTJqIZ1LUyrTLx8AQBWdNu72KFhXMQpnYw+cPl9jg=;
 b=UOjPS7k8A+NjlDHnjgvDgz4/skmfWOIV8Q5Cqn68pfK1pwNDArmMbNU3qEt1mGpVcFvNLY1quuonBdnt+p8jyaykam+LZgYDBgqakiqyZWYQodOUvBncwPL+D3ozAVXKnvm4/9jcynPzk6y6Da50ycu+e86/DJ7ESPHYvg6Eae86JYSfUbO3Dfakjw/GIc+F5YvOJ+4Q3mRv126qFEae26orKOaGZ0zJefb13pWgW71bFr6mJs4LbVH3qzvK0OoSSIC1mkYWS/5GTwfIPlBQ8vRgNr9v7/aL1v1Jxn62xzP11LhSs18sl1wuKwzIYStnVK/zPUtqVKl6kUoDLyeeMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:30b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:35 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:35 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
Date: Fri,  6 Mar 2026 18:02:59 +0530
Message-Id: <20260306123304.76722-10-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 18b3b198-79e1-4211-a5f6-08de7b7cb9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	4zzaAhGQs42oBgsXhVUsFNcXN6151kd2d0FNovYK3R7mNrtmKMwvs5xGHk18RVAUbcU9bR5jY87XsUNOL+4FIjmoLmmfJxwRM2v11BFjK5S+WSa6NRYU/lY02USZTAmg5ahVbEHT/Z6NN1ovyefuDfM+IHRjNYNPyQdBo1oazCIMvUDOB9iDfLAL96+kJI6269e92tIZwgFVjE77GGww2cropsQk8Vf+R/HxlO0jqk0yW8Cr2S0tfV790tHp4zS3UKmyKAoNVYSB9nQHh31xwUsOzbgmDIzZRk0qa4m6sG40TrNIcd8cCLpo0R0S19R4r6oXvJiYJ4iCUxEOUDiZn9KZGC3Gw21RPAzntHmE43ClsGhNAR0SpSZsZLYgMEN4jBMRCKgPnNCu25e3toPnQ7pHNXuAE7dFZaZ2rh8VgR90J5wUufEFJSZ3SbFRHkyYGN/NT5/JqLKYobfV9w5lgK/RFnYt54oU0i5aHeHDbVS32fYrfuQOkklyd7x+EFFoJkwy4PI6WbXAZ6T2J5vZSqXIX6mYXMqcewhnHcRys+5+FW0hKDdz4JvvZnuUaTqaADj8fLYIKa1trUXFA9dZcknEwuYPAXbjbpemyPWM5Z88R9eLu2YIhGF12CHnpAvKSkG9lRdqjn0seCfiTOtlF5qaBHFeT+CQJqkX+hQg8dk8NIi2x6gCtgC++KeqMxyC+QkUYY0N5+ofeGpvP68A4t0gnFNfe4XEbyeVc8bWAuIxlHw9ABt7hpMD5JTqDOXd45Iy+QICJtWz6ZPU7gL9+QiidQNa9eh/VjdhzWLbB1E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2sts/lYx1QOOKrYsgTBC0KFPxufnm8P9oTI9ybHiAtwErPjHr8qk//TvgXSQ?=
 =?us-ascii?Q?B1/LM2ERNnnP1QOByvzyhsmdJUeR0ScJ6O053n0LcHui4D9rYTIsUTA7jSy1?=
 =?us-ascii?Q?7eabUt8bFLt6PnHO/ALyEIP1tyZYtueUj9CuLCva6f/LHnbX5lna3pG46Dd0?=
 =?us-ascii?Q?63sib1yEicILjIC9B/iIO/tzES6DoZHwv4f/sHoMwvnz6rU3r/fpo2oEG367?=
 =?us-ascii?Q?MiVqJRwxSllcjC1AKCnQMjVDxqyeuT79tpCK6dj5LcnMaF7W70f3LJ2oOtzs?=
 =?us-ascii?Q?nRBuKOvJgjqEglp6VSOZNcC3Ij9OSv2SsmNEGFl4jeecxQ4xS3pe1sK0baH8?=
 =?us-ascii?Q?MjjBdCgSqvoDT1diw+f5Sr84jNITEBVOH5xOVrOGnKB23qF3hnWhwVyqHidR?=
 =?us-ascii?Q?0SkOy7onqWJ8ecxly50tTVhvU2WkC3hjgVjiHLZFoAOc2Pgcttmnle15FH4a?=
 =?us-ascii?Q?C9UgfVAPvdzXv8pQh5g6Ji+rdvmJbNJ3GYrOYDylTh2Kp2qgyUZDDFt8gNhq?=
 =?us-ascii?Q?C9CYEuVTV/Nsa4xpoGh8tgZdB/3j/KPA80pQsmXPx0AMEKTbYs8zeekJjF0J?=
 =?us-ascii?Q?02PXWef7ZLJLTFqqmED3Q8b3y3PGk+XWqf1un6RkLJNzT7E9JN+ExDhWrzYx?=
 =?us-ascii?Q?3aBbbsPkRc70n3RLMt9LVNsBgr5Zk/pCo3E9ZIpl2KqQkHZTIdOfQjecKtNx?=
 =?us-ascii?Q?vdPPm/t29yztu1ffUtI+eZjov09/t+UtJjvWul0C9tPU9ve9rzXly2vltB0N?=
 =?us-ascii?Q?HAe7eHwi1rFs//wc5S8qYKWRyEylGXYM9f124h7f5ZyuuxpBgBracUZqHPOj?=
 =?us-ascii?Q?Pg6st0QjYDWyQQ6nKVa4GBCN/TfPfmyLWQYWfNt22DcPf/LNskw5Pe0ra0kX?=
 =?us-ascii?Q?DxOOtyE8+rUG1HxxcSycvI7hOhgaU63sAjivw8gfd6ARvHMCJA6g01z+E3Mp?=
 =?us-ascii?Q?oVkxVfU22mn+MnVmi7TqtOJqZSGLsCPjuoTb+PET6fVPBdC4zQe/nDOe2qg6?=
 =?us-ascii?Q?y3I6O2rF/3xrVSNIoWY5fdhUwxwofQFIAdti4mGFMRjLFv7AOuYgmsS8Xll5?=
 =?us-ascii?Q?HlweK2jLdB6cNgIDANaRzNngU/65lBvB1b8yk4bFT3hkvst9kPMoAox1bo6a?=
 =?us-ascii?Q?gQ03cMEki9J0ic0MM+9WzXPLuVdwASj4aJVxERoqC9rEUbBRUHNQxxedhaBq?=
 =?us-ascii?Q?fbNgWeEg4Mu3swIgq5KY1rEriYFaU4lU6B8cTa9nE2BHQy3dtEvR9ck/yzOU?=
 =?us-ascii?Q?EkSBKRXaXq9yYa8adxQ55yMyp6tKidxQf5GYnhoCwSmQTtu5ZQ7KPjRoPQ2/?=
 =?us-ascii?Q?isiehu6A/EUK/zycXIVp0PtB8bFrs56O5YX6gZMOILCsEz2IjN3/SXIXH0E4?=
 =?us-ascii?Q?pt3diLpe0QB0ajzdR2/tvQTDdFEqMtMgDHNZiXm4/F9A4tVceaC51p79eC6p?=
 =?us-ascii?Q?eyDwlJyX5+0255lOPM1GSjZUpT2+0hEnrGp0Ttxt+IXQtphQcfqlhMQYaEzs?=
 =?us-ascii?Q?H8fyIaZbK83SKyGrxY+yiEEkggUVDhLjSFQq2qbaaATozHzot563JsaLwm9c?=
 =?us-ascii?Q?8dknzhetb/QpOr6c2ymBseDW6LJ6J+PQOMeoKzCDkLZUcOe+UowELst7NyvP?=
 =?us-ascii?Q?qsY5g4L2FbtKjKhBmxWrxcpSG+6543NUD9udU4E+w0wInRv26fpxwHPLATwS?=
 =?us-ascii?Q?0wJ6cVJPx+FmCHDlcYvOoWovTV2Bqmd5TPVQP9A12ypF9dnCHrniQWrR33LK?=
 =?us-ascii?Q?zRc2UUVJtK8sL0fTVOBkKgkHhQIjLB4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b3b198-79e1-4211-a5f6-08de7b7cb9b1
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:35.6583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJ2Up4XAn0H40tR2erAswMg252rMS5yosacf+odGg9ozUeKGSe1WsKfuLKWDoWd6/cXNikQY3eWCRhF5xpcFD595pyxxBAGe0grekyVpkbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5365
X-Rspamd-Queue-Id: F2FB5220C21
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
	TAGGED_FROM(0.00)[bounces-54763-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Action: no action

Add support for 1920x1080 and 1280x720 resolutions.
The 1280x720 mode uses 2x2 binning.

Both 10-bit and 12-bit pixel formats are supported.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 121 ++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 5ffc7aef0ed1..d8d776de5f35 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -461,6 +461,78 @@ static const struct cci_reg_sequence mode_2592_1944_regs[] = {
 	{ CCI_REG8(0x4837), 0x12 },
 };
 
+static const struct cci_reg_sequence mode_1920_1080_regs[] = {
+	{ OS05B10_REG_X_ADDR_START, 	0x0280 },
+	{ OS05B10_REG_Y_ADDR_START, 	0x01b4 },
+	{ OS05B10_REG_X_ADDR_END, 	0x0a0f },
+	{ OS05B10_REG_Y_ADDR_END, 	0x05f3 },
+	{ OS05B10_REG_X_OUTPUT_SIZE, 	0x0780 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE, 	0x0438 },
+	{ OS05B10_REG_HTS, 		0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN, 	0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN, 	0x0008 },
+	{ OS05B10_REG_X_INC_ODD, 	0x01 },
+	{ OS05B10_REG_X_INC_EVEN, 	0x01 },
+	{ OS05B10_REG_Y_INC_ODD, 	0x01 },
+	{ OS05B10_REG_Y_INC_EVEN, 	0x01 },
+	{ OS05B10_REG_FORMAT1,		0x88 },
+	{ OS05B10_REG_FORMAT2,		0x00 },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3620), 0x0c },
+	{ CCI_REG8(0x3662), 0x10 },
+	{ CCI_REG8(0x3714), 0x24 },
+	{ CCI_REG8(0x373f), 0xb0 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x04 },
+	{ CCI_REG8(0x37d9), 0x08 },
+	{ CCI_REG8(0x3832), 0x08 },
+	{ CCI_REG8(0x3c86), 0x03 },
+	{ CCI_REG8(0x3d8c), 0x71 },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4837), 0x0d },
+};
+
+static const struct cci_reg_sequence mode_1280_720_regs[] = {
+	{ OS05B10_REG_X_ADDR_START, 	0x0140 },
+	{ OS05B10_REG_Y_ADDR_START, 	0x00fc },
+	{ OS05B10_REG_X_ADDR_END, 	0x0b4f },
+	{ OS05B10_REG_Y_ADDR_END, 	0x06ab },
+	{ OS05B10_REG_X_OUTPUT_SIZE, 	0x0500 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE, 	0x02d0 },
+	{ OS05B10_REG_HTS, 		0x0368 },
+	{ OS05B10_REG_ISP_X_WIN, 	0x0004 },
+	{ OS05B10_REG_ISP_Y_WIN, 	0x0004 },
+	{ OS05B10_REG_X_INC_ODD, 	0x03 },
+	{ OS05B10_REG_X_INC_EVEN, 	0x01 },
+	{ OS05B10_REG_Y_INC_ODD, 	0x03 },
+	{ OS05B10_REG_Y_INC_EVEN, 	0x01 },
+	{ OS05B10_REG_FORMAT1,		0x8b },
+	{ OS05B10_REG_FORMAT2,		0x00 },
+	{ CCI_REG8(0x3610), 0x57 },
+	{ CCI_REG8(0x3620), 0x01 },
+	{ CCI_REG8(0x3662), 0x08 },
+	{ CCI_REG8(0x3714), 0x28 },
+	{ CCI_REG8(0x373f), 0xa0 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x14 },
+	{ CCI_REG8(0x37d9), 0x04 },
+	{ CCI_REG8(0x3832), 0x00 },
+	{ CCI_REG8(0x3c86), 0x03 },
+	{ CCI_REG8(0x3d8c), 0x71 },
+	{ CCI_REG8(0x3f03), 0x1d },
+	{ CCI_REG8(0x4008), 0x01 },
+	{ CCI_REG8(0x4009), 0x06 },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x4041), 0x03 },
+	{ CCI_REG8(0x4505), 0xe4 },
+	{ CCI_REG8(0x4837), 0x0d },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -514,6 +586,31 @@ static const struct os05b10_mode supported_modes_12bit[] = {
 		        .regs = mode_2592_1944_regs,
 		},
 	},
+	{	/* 40 fps */
+	        .width = 1920,
+	        .height = 1080,
+	        .vts = 1504,
+	        .hts = 1744,
+	        .exp = 1472,
+	        .bpp = 12,
+	        .reg_list = {
+	                .num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
+	                .regs = mode_1920_1080_regs,
+	        },
+	},
+	{	/* 2x2 binning 120 fps */
+	        .width = 1280,
+	        .height = 720,
+	        .vts = 1003,
+	        .hts = 872,
+	        .exp = 970,
+	        .bpp = 12,
+	        .reg_list = {
+	                .num_of_regs = ARRAY_SIZE(mode_1280_720_regs),
+	                .regs = mode_1280_720_regs,
+	        },
+	},
+
 };
 
 static const struct os05b10_mode supported_modes_10bit[] = {
@@ -529,6 +626,30 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 		        .regs = mode_2592_1944_regs,
 		},
 	},
+	{	/* 40 fps */
+		.width = 1920,
+		.height = 1080,
+		.vts = 1504,
+		.hts = 1744,
+		.exp = 1472,
+		.bpp = 10,
+		.reg_list = {
+		        .num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
+		        .regs = mode_1920_1080_regs,
+		},
+	},
+	{	/* 2x2 binning 120 fps */
+		.width = 1280,
+		.height = 720,
+		.vts = 1003,
+		.hts = 872,
+		.exp = 970,
+		.bpp = 10,
+		.reg_list = {
+		        .num_of_regs = ARRAY_SIZE(mode_1280_720_regs),
+		        .regs = mode_1280_720_regs,
+		},
+	},
 };
 
 static const s64 link_frequencies[] = {
-- 
2.34.1


