Return-Path: <linux-media+bounces-54756-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KuuLdDJqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54756-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:34:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C674B220B5E
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69960300BC92
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A496227BB9;
	Fri,  6 Mar 2026 12:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="d51D89Mv"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021086.outbound.protection.outlook.com [40.107.51.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6891F2236FA;
	Fri,  6 Mar 2026 12:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800455; cv=fail; b=N6ADKWp2fBBkL3PPOAmPaFc8BaNCuoRFPEdMgQP1r2q0RrUY5tpubd5o0pnKD8WVzQ+sURLjwGNV3sHnYWak6MugQtFR9ci7Ta0N+YJ9csCqg+BLvSkbpWNLHgS5cWLCB0i3GDpSVbPq1NWqS6KUUB/AuZd+TiZNrYXueMphXzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800455; c=relaxed/simple;
	bh=LaDZ868PfOAHcvT6VWywRAkeIgswrlAYVkdiC2zXOzw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mA1ASY6tlWgqgO55nRP/0PSjHk0Wt1HiLkmGMvJe/G1AFSO075hOQhq67jf/eoqI4ZgmYaOQ2Qqit24v42LdJPsttpC7jOMlZYjwE8zVSZFnKjRWNPD/m2/SKqiqe5IuOnNjMEcqiQDXxOxsFSqSmTijtRo5OxPNU9odp3SeHjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=d51D89Mv; arc=fail smtp.client-ip=40.107.51.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpqQ7jNYETGc7Nsjmi1f8pJGutz5MHsRHbuJYTJ9rr1RD9rMcFO3m3x5A0vUjZ/adIACWSEKzif5LcBkXI7UGQiSCd+pPi92p5iEtMiuXJ+bYghQJHJI+iNjiZYFZpCaMo4Qkwl26whp2B+z+C7JhNe8N3PlEqswLTGJWHEwbk4j7I70HIsCOAGOtVZpCt6rsjOkqvd20Ptobuo3MsrtW4ztaIEKficre0i0/EqeV99cdhCn2wmRL70l29a8q9MMRc3WUZYI3c0P7Lxm97F+d98q93LGQWGARaaEKMD8tUxlNP25WO+FcFpBHOXF3lF4UhqYxHwwtfRZP6U0Xzi+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSTpUYWnha2BsXEn5KWH7iXwlFCIoiHzWNc7Exd3Prw=;
 b=n/3/ODMnCf7ppLN7k5ACWjUgJYkZ8g1OzOP9/xb11XeuHWHMmDaHVZJLhWV9hVDgJc9viJHI3jk5JMqjHZxd/Pc0FyC5A/sxgWXrUzPU3tNzi7OyGuqGsiU5vugw37lz/7AErQVZJ7Bilu2IgeSSTr4QtYRzabArRnxlEbOuYPQOiwf0Y+sTDc1ldZmQV1MKlLN8EZjSJiE5lMIKh9G5bK1MCQl5cBHprkGCnY2qoViZmLmA8BaV39bA8BqDNCVRzqHSQhKx3I+oQ6UmNDF4HdtySvJ8mwRkv24VGoKeY6MZ4WekkNmG8xqYOWUMFPwtv4/2MWIOxy92yOwxy37cMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSTpUYWnha2BsXEn5KWH7iXwlFCIoiHzWNc7Exd3Prw=;
 b=d51D89Mv05UaiHX/WQJobjbX0Pe48ECKoEXoqZTTYcYaQNzXI3ZZKJVgCbkimq/ps9VxGvfr8tC+bWVkUtQ5LjBvj10MyxYN/Gar93LBKsZKz4tb5WZKWE8ElH7vBRJrr0YEyPzR7S5RTkpq+VQtwbmcdnyrCyUgKeyca1/Ko/OZR3SVyuL//TVRCIC1NCIQnepyNtCt4vM800DJMVS7b3lE2YSl3ufdSICQ2sweXKbRP3dkgjZHQB1XbFP20dk4QtnAzA/FBwf7zzrfAK7WXsh5UqWgVZ+cY+JD0st+k4e+Fwm5OyII8ebrXa7dWrrb9evT5Vvy+DHj6r/990OZVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:30b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:09 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:09 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] media: i2c: os05b10: add register definitions and use them in init table
Date: Fri,  6 Mar 2026 18:02:52 +0530
Message-Id: <20260306123304.76722-3-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 81776846-8cc9-4c3b-d4f7-08de7b7caa2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	4MjEZjXlWrPNS01Odmnx+0QATJE6QSVxzW2WtFaNEDdR8tBXal4r0j/Z/zDwtiwzX9bTEYgqtkilCtGoXigAOP/pP8PaEeeiy/CH0jUWtaW3KQp7vkU8R5VE5AzY4ffOQZvUFDBYeTINYs7P/ThZTkG4Z+s/QBsBYcJdL3To1a0psRHHhN+0ioCt91B7V09FRmtskiX8UD+uYSYO4nVHDvsb4PXZXTBLThKnWNm/EERisa+VAyHwMaGlD7YTSsgyLBNliUEmYpE2+Y1rg2AGc2LRpYLRZcJ0zg6/KXQkLXo7W1sdmSaVYio3Er4fEtEEUQTXfrPtNNRHlp4qxsk5eK8CtCPBrCaJ2opywAjJ2Qezuvd4+JgG8l+pkql1Sf+5biCGHSqA6qSZC05Lr0MFci2sd90CChqwpd9o4w+AoXh+rnfJf0XUyV1G6+bR8x+Fm3i/oim0H9mKaphB0GybwAyw420wNTAAkzSuGCmNtVNVMznd7fw17A+XSXPPn6c/JfZ80K+qEDqARzrc4cRQGVswahvfs8i1wDh/s1XNyNakOnL1v+W1rXDsPknkxbd2/ewBuG9Qfsl83yRj0jvEeq1VVA2HZOfGqRywKgixo39H5xT2xzFwFLQZz8tmZuFZxXHAR24J1xvfav1fu62GyYPuuFQ3Llp6LG5BHfjLq5OUC5ItuH5ixJImR/LCtnJcxkTm9wqA5QZwp+D9Ni6BtvxmVADlzh1KQpz7aFuNlWazZYFLteARaX2QLoaeHGPbJ1IGxtp7KPvkGmDmcJSsT3CaD/VDdRYcXDDg1txonHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wl+fE0CcWYjpYxUaJIrJo7ohEJ94cGY3C6OL6eun6lUXIifYH/8RbPNNP6vg?=
 =?us-ascii?Q?RZE/HMsqTvcqBcctshGctrzD67xj6FWPYFEOR3yf3NCjRpZ1QcWrFTqIuoHS?=
 =?us-ascii?Q?D2o1xea6gdo3SrhCwhrZbdcoFbeB1qNmhtfVhahNoR6E+Fs8G6YnfsVBH+1B?=
 =?us-ascii?Q?Jvwu38w9E1jldg4GEVGwuUlsI1GNEKpdZQuL+r4p4ogFg25NhZycM48AGmY8?=
 =?us-ascii?Q?RRkMJsAbZvHzn0ZZucdAY83TyrBS7173zYEyCyPhsWK4n8SDgkA3uc+5Hrm/?=
 =?us-ascii?Q?os8r0SSG8jmCagmn56Y1m7zsDcuBsMjA0UFxBjkhDqm+AhQ1r7p1oC1SyvzV?=
 =?us-ascii?Q?i8TPu/i9d7oG3OkjmpxfbhGsRDjo917JZjcziMte7eE24RchIl/7D6AzVpfN?=
 =?us-ascii?Q?0SnWsl+6426u6wjWjZggvPnHVQoWjGqhwMabX3yLpZhY94GMJU2hHUdOryTr?=
 =?us-ascii?Q?DUbhpk+v/RzA/+MQQwLmJ88RfxlEqCVvouprzlzqm9InRGdCxsAABHj//s6o?=
 =?us-ascii?Q?9Ev8d++7XYd1aR3v61mPc05esOK2jhAyJZLjNFziqGQlpLo/u7n/sixsvEtK?=
 =?us-ascii?Q?CdM9i47A2N7yYIjdk9b3Vim1kie1bpA3+LB0TVHiwCwQEK4DHyhmcHMD5aSA?=
 =?us-ascii?Q?Jed1T+PZVahsoEiEGaVJXBfMqTzdWBH0rgNmU1vGVVQ0Czr1XLLUNjj+hsAA?=
 =?us-ascii?Q?VyhR6drWSbLraayl31nOlak36I6SgmMl/xOFUaYUcTLPOTWF31xFO8JE9i4k?=
 =?us-ascii?Q?KO85VOJHt/tka4aGAm0ZY+CS9tq8yYC4c4IhRl34wHmA4sbqLZS042Ho0V/k?=
 =?us-ascii?Q?LJEH7Pr07KpHfQZVs2zBkczpi56yTnYnafXSGDEhDUxChvEy4vNAtFvYdM62?=
 =?us-ascii?Q?wIae5rt6Zn505YM0FSC3Xgsfin4SNgvtwQKRDHhjs+EKo26CyZkBJgw/Dz7Z?=
 =?us-ascii?Q?GAb7i8YRf+aVYIVunL2vYehFXQNH9BPTSQSACy872fRI3XKUMnWA8PVG2kKy?=
 =?us-ascii?Q?BxHPR5soHLyp3tuENL2982Hcx2bp4ZxIKKnNlu7rX1QmrM7fj8HjXKHDoEVE?=
 =?us-ascii?Q?fZJqMUJbVlTOLDmfrAoViARZMYFlGB3bBRyUZ6HsmaN9gVJPegLOb+OO3tRo?=
 =?us-ascii?Q?5PWeXUUiUR4OGgRPRUM9uAi8iNhWife6Rvpr2umsIG9/HFj3MA0GbUvo22ZK?=
 =?us-ascii?Q?3VUbL/UelTtpuvCz19sJMYZsQ1wAwd0zRKjuSY+04yV+1fHfl/f+fxXWIReQ?=
 =?us-ascii?Q?UV5WU0M/Eu2Q9N3wIMRHHCk2Ttr2HQ23J0W4D/RIoqXCedDoLeCNk/mI65pB?=
 =?us-ascii?Q?+McG7hDLttzQu67wG10LKgOxtXx14Yjnen6XVFYPiI63e8ZDyQn2PU++M2/v?=
 =?us-ascii?Q?Yq1IC83kR3VFNZiyZnQgFu7tdfIS66ZiY0m+j0JyUwixvb2aqulGvua6n/S/?=
 =?us-ascii?Q?DAPc8bW1D/Bv7VAVlR0VRgHYNjvkcpWdvBVeIC+iisO3ctjbYsCS0/GjQX3Z?=
 =?us-ascii?Q?VpvIPrhYFNs+lcgNCOJ9ARCsmrFyyZpASEjZhmChHQ0hC3YDfoUGtnXNSx/M?=
 =?us-ascii?Q?H8uio8/lJhAT3ZK4jQGtiXqijQPWtYanD3kmuS4hiQ8sRjpVnb3wsp+O99Ui?=
 =?us-ascii?Q?5swJbmw80/Qa04aNZcQFBhSqLgE0I9LTDvcQ/nf+QLDPx7qR6SL+j4LddUGM?=
 =?us-ascii?Q?U5esRpN8xarGrvPe9BvuhSiMHaQWZmXJyWpvBetmWr+7IwojTVA2EDjrh88q?=
 =?us-ascii?Q?ts4RUYRw5B1GFO1oYpXvb+fKq0hXweE=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 81776846-8cc9-4c3b-d4f7-08de7b7caa2a
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:09.5966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jr4r55udi+2G7c+fvrUBvn0QaZ2GfZNmz2gSzWx2bQrlemMGr3b/3BOzLindSFswXQxE7+f6jOOG7pU25V30xnuofLrPJeqkQa1CXIMw9q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5365
X-Rspamd-Queue-Id: C674B220B5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54756-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Define named register macros for OS05B10 and replace raw register
addresses in the common initialization array with the new definitions.
This improves readability and maintainability without changing
functionality.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 111 +++++++++++++++++++++++-------------
 1 file changed, 71 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 7f32e3b1e7bd..89a564f70818 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -38,6 +38,20 @@
 #define OS05B10_MODE_STANDBY		0x00
 #define OS05B10_MODE_STREAMING		0x01
 
+#define OS05B10_REG_PLL_CTRL_01		CCI_REG8(0x0301)
+#define OS05B10_REG_PLL_CTRL_03		CCI_REG8(0x0303)
+#define OS05B10_REG_PLL_CTRL_05		CCI_REG8(0x0305)
+#define OS05B10_REG_PLL_CTRL_06		CCI_REG8(0x0306)
+#define OS05B10_REG_PLL_CTRL_25		CCI_REG8(0x0325)
+
+#define OS05B10_REG_MIPI_SC_CTRL	CCI_REG8(0x3016)
+#define OS05B10_4_LANE_MODE		0x72
+#define OS05B10_2_LANE_MODE		0x32
+
+#define OS05B10_REG_MIPI_SC_CTRL_1	CCI_REG8(0x3022)
+#define OS05B10_10BIT_MODE		0x01
+#define OS05B10_12BIT_MODE		0x61
+
 #define OS05B10_REG_EXPOSURE		CCI_REG24(0x3500)
 #define OS05B10_EXPOSURE_MIN		2
 #define OS05B10_EXPOSURE_STEP		1
@@ -49,11 +63,42 @@
 #define OS05B10_ANALOG_GAIN_STEP	1
 #define OS05B10_ANALOG_GAIN_DEFAULT	0x80
 
+#define OS05B10_REG_DIGITAL_GAIN	CCI_REG16(0x350a)
+#define OS05B10_DIGITAL_GAIN_MIN	0x400
+#define OS05B10_DIGITAL_GAIN_MAX	0x3fff
+#define OS05B10_DIGITAL_GAIN_STEP	16
+#define OS05B10_DIGITAL_GAIN_DEFAULT	0x400
+
+#define OS05B10_REG_ANALOG_GAIN_SHORT	CCI_REG16(0x350c)
+#define OS05B10_REG_DIGITAL_GAIN_SHORT	CCI_REG16(0x350e)
+#define OS05B10_REG_EXPOSURE_SHORT	CCI_REG24(0x3510)
+
+#define OS05B10_REG_X_ADDR_START	CCI_REG16(0x3800)
+#define OS05B10_REG_Y_ADDR_START	CCI_REG16(0x3802)
+#define OS05B10_REG_X_ADDR_END		CCI_REG16(0x3804)
+#define OS05B10_REG_Y_ADDR_END		CCI_REG16(0x3806)
+#define OS05B10_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
+#define OS05B10_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
+
 #define OS05B10_REG_HTS			CCI_REG16(0x380c)
 
 #define OS05B10_REG_VTS			CCI_REG16(0x380e)
 #define OS05B10_VTS_MAX			0x7fff
 
+#define OS05B10_REG_ISP_X_WIN		CCI_REG16(0x3810)
+#define OS05B10_REG_ISP_Y_WIN		CCI_REG16(0x3812)
+#define OS05B10_REG_X_INC_ODD		CCI_REG8(0x3814)
+#define OS05B10_REG_X_INC_EVEN		CCI_REG8(0x3815)
+#define OS05B10_REG_Y_INC_ODD		CCI_REG8(0x3816)
+#define OS05B10_REG_Y_INC_EVEN		CCI_REG8(0x3817)
+
+#define OS05B10_REG_FORMAT1		CCI_REG8(0x3820)
+#define OS05B10_MIRROR			BIT(3)
+#define OS05B10_FLIP			GENMASK(5, 4)
+
+#define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
+#define OS05B10_HDR_ENABLE	 	0x04
+
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
@@ -77,30 +122,25 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ CCI_REG8(0x0301), 0x44 },
-	{ CCI_REG8(0x0303), 0x02 },
-	{ CCI_REG8(0x0305), 0x32 },
-	{ CCI_REG8(0x0306), 0x00 },
-	{ CCI_REG8(0x0325), 0x3b },
+	{ OS05B10_REG_PLL_CTRL_01, 0x44 },
+	{ OS05B10_REG_PLL_CTRL_03, 0x02 },
+	{ OS05B10_REG_PLL_CTRL_05, 0x32 },
+	{ OS05B10_REG_PLL_CTRL_06, 0x00 },
+	{ OS05B10_REG_PLL_CTRL_25, 0x3b },
 	{ CCI_REG8(0x3002), 0x21 },
-	{ CCI_REG8(0x3016), 0x72 },
+	{ OS05B10_REG_MIPI_SC_CTRL, 0x72 },
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
-	{ CCI_REG8(0x3022), 0x01 },
+	{ OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },
 	{ CCI_REG8(0x3107), 0xa1 },
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
 	{ CCI_REG8(0x3503), 0x88 },
-	{ CCI_REG8(0x350a), 0x04 },
-	{ CCI_REG8(0x350b), 0x00 },
-	{ CCI_REG8(0x350c), 0x00 },
-	{ CCI_REG8(0x350d), 0x80 },
-	{ CCI_REG8(0x350e), 0x04 },
-	{ CCI_REG8(0x350f), 0x00 },
-	{ CCI_REG8(0x3510), 0x00 },
-	{ CCI_REG8(0x3511), 0x00 },
-	{ CCI_REG8(0x3512), 0x20 },
+	{ OS05B10_REG_DIGITAL_GAIN, 0x0400 },
+	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
+	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 0x0400 },
+	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
 	{ CCI_REG8(0x3610), 0x87 },
@@ -274,34 +314,25 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37f5), 0x00 },
 	{ CCI_REG8(0x37f6), 0x00 },
 	{ CCI_REG8(0x37f7), 0x00 },
-	{ CCI_REG8(0x3800), 0x01 },
-	{ CCI_REG8(0x3801), 0x30 },
-	{ CCI_REG8(0x3802), 0x00 },
-	{ CCI_REG8(0x3803), 0x00 },
-	{ CCI_REG8(0x3804), 0x0b },
-	{ CCI_REG8(0x3805), 0x5f },
-	{ CCI_REG8(0x3806), 0x07 },
-	{ CCI_REG8(0x3807), 0xa7 },
-	{ CCI_REG8(0x3808), 0x0a },
-	{ CCI_REG8(0x3809), 0x20 },
-	{ CCI_REG8(0x380a), 0x07 },
-	{ CCI_REG8(0x380b), 0x98 },
-	{ CCI_REG8(0x380c), 0x06 },
-	{ CCI_REG8(0x380d), 0xd0 },
-	{ CCI_REG8(0x3810), 0x00 },
-	{ CCI_REG8(0x3811), 0x08 },
-	{ CCI_REG8(0x3812), 0x00 },
-	{ CCI_REG8(0x3813), 0x08 },
-	{ CCI_REG8(0x3814), 0x01 },
-	{ CCI_REG8(0x3815), 0x01 },
-	{ CCI_REG8(0x3816), 0x01 },
-	{ CCI_REG8(0x3817), 0x01 },
+	{ OS05B10_REG_X_ADDR_START, 0x0130 },
+	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
+	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
+	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
+	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
+	{ OS05B10_REG_HTS, 0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
+	{ OS05B10_REG_X_INC_ODD, 0x01 },
+	{ OS05B10_REG_X_INC_EVEN, 0x01 },
+	{ OS05B10_REG_Y_INC_ODD, 0x01 },
+	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
 	{ CCI_REG8(0x3818), 0x00 },
 	{ CCI_REG8(0x3819), 0x00 },
 	{ CCI_REG8(0x381a), 0x00 },
 	{ CCI_REG8(0x381b), 0x01 },
-	{ CCI_REG8(0x3820), 0x88 },
-	{ CCI_REG8(0x3821), 0x00 },
+	{ OS05B10_REG_FORMAT1, 0x88 },
+	{ OS05B10_REG_FORMAT2, 0x00 },
 	{ CCI_REG8(0x3822), 0x12 },
 	{ CCI_REG8(0x3823), 0x08 },
 	{ CCI_REG8(0x3824), 0x00 },
-- 
2.34.1


