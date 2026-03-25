Return-Path: <linux-media+bounces-57011-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIxIGXbVw2lwuQQAu9opvQ
	(envelope-from <linux-media+bounces-57011-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:30:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDD2324E63
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8C253239240
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599723CF69E;
	Wed, 25 Mar 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Daec+RPZ"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021107.outbound.protection.outlook.com [40.107.57.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5253D0936;
	Wed, 25 Mar 2026 11:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439297; cv=fail; b=BmAIY6e61TamTKcIgCbmoMal/f/myIZhnRxvmk7KfzGwHaZubLdHU6dXwhCd8PAGrmjRWTlsNIRqmfCM1M607KzZK0TAJ1et0cUhvqHd5rFNOr9ZAs+yCD6CO86viVa3js+KDALTMv7Yf5HSu6hOqyki4msyUxfIkYhoYWk7JY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439297; c=relaxed/simple;
	bh=LB9rxTJH9RTbJnLMxi167H/i9hQeEqmSrRcI1zLdwjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gbM/Fn7MLNmuExR/7Id4EySdnBY6VD6PrPrLSZkL4Glq5v8SzBBUQ240FbRjy9N8S/JWgjjaKODqcwy3LrmTVjSDKBhNBquAAkP0aGMvLb24qooUqcOXDx5K2gYOutKvfSomH4XozmTnJFh7JYBQqX1Sol/EY0w7Za5biBGY0yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Daec+RPZ; arc=fail smtp.client-ip=40.107.57.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrY+4UfNwjXiY4s/rnKS3bPWt4mdjpHP4C3nelx14o7T4qb7ywfqDPqWO7l1b4MkgCqoBmdrACCdBwY5YhVNBNKtPSKWtd+wFKn5YWLqNtplzpV9Hc/ABsG9u2HPzOQ60D4HXIiyl1pjiph6sDLwtTobkXSDjN8tgVY5r7QRQIliqnOerzNnz609fRktZYChL6OmSNiPFZ3PPZuxbJ7Ur8AV2CAt8NtbfXwVoJ6cqHziQE4XQk/6rgbvljbMH/BGmYbp+XYid5jKebbME8M8n5EBdg5pA5xR4XnAXYyexljEqXlWpA/JDjwSNJD1S6v/FycnBpwNxyDMgPatjHV+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwdxXt9V6jjEKkBKnowy+CyjSbh8W71UBf6dwSLmA3k=;
 b=bj4M3Pq70EE25M6bBBQ4MAmUH95w861D7qGmz9yEX/1lB/hLAj8VPFQqL3z7Es0M2evhOkjDn4t7fYjH2J7tHDHdbeTGvuRjJQRn74gK+9AgcKqtmtgAjexRnRDcK6f2pOpiMPWrSnt5WWjgA1k0RRJgVXFlV/hbMR85Z5AVZlHLJwsWYHCywGKAmkL1Uhux3QPpsrr+zPKd4ybkDvh55paBn4Fqxf8hQolsTZv1TKNiPijPHGn2OByeYu9RKgmqoqKDVGekYuc4mnx2j+sjEDOxyPaV9bp7BGQZkU2LWSrI5Lesl7njzo9E9SUKDcJylzZzvg+RroyjnLFwHIUbGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwdxXt9V6jjEKkBKnowy+CyjSbh8W71UBf6dwSLmA3k=;
 b=Daec+RPZvgc/9gHlEb3Qf7RfWdCiAYh1KMbbt5whsS6w59Jdo4iJS4VAOUd2RWfkJyp7Qs58ldgUEiUjH4jLpPSOoDyykqHxGSKDIMGn2zsOQcfJYzQIEBY0zCkHbAgMHIds5rbANbf013pwZnAx0OqjYdlB5KgDj0RF5TtAewYlg6lKHpDdXR7pdZmNYwkUIU/pyb2kMultxqeCnk0Xn2ghTTDkUzalZTxYtYuUAGFh5hwLQXx2Wv9smVCs1t1Z6FL/rp2wYMXyZfmjKQ63BB1q0jpSnDPQ8bIDbga3fOG6soGG4U6BHswVCdxfXS6tTZJGbyVStDuuq6BiRQU+sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB4294.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:48:13 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:48:13 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/15] media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
Date: Wed, 25 Mar 2026 17:13:56 +0530
Message-Id: <20260325114404.95188-11-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN4P287MB4294:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0ddd7c-21e7-4dc9-e234-08de8a64650d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m+x8VOX4YeoDTmu0q/4I9QYcRQl9lcdGcnbbwx7Tb2icfJeP6K03GGLTVS5rjzhGk65ueQgOKICrD0gzl18FdjrBqDw0/z4B5p/JFXyOiihvoVrfr/T1ZB760N23mLeaVoNZg+2Z4X1j7cyKye8uFGGX02EO4b+sdGjyDYBFIA7pPBK3NFkf1BaaoRP+eAcskUx9CuFECJQlUCeHr2f3tpv9o6knwTl/ftX+uMeN5ZqQmjfC3CK/d+PYa9UWANHuAkCtDyGCYqd8ThsQTFXIBC7CayPltixseSZ4djwbMZvcNkQN6WW83LjxBLK4Pt+pW3rtBbzDOOiLHzWzTFBE2o69Hk6JlvLvUpnYNeXWY/3QC1hDLfhkgbT6V5UhyJa10EucsqbBSctrRpiN2YtTNV3dAsqoqo6KXK7aFGJYO4CQQ9cIzzyAGSdujzYhzCBEWv9xSR/OFOQdHy7UpfU/VBMkSmFbz/Q8aAnQJX2kRcxFF6fTYbvjDXkjysRT5M1Y3NS1QEJoO+S3eHtx6rl9tnXxsuPJAgGxaAh2+04pQlwrn6b7g9svdjHInpIvwzD1aLhiNObpoi1/qoSFTe83OHvpeoF83oj8XZGxbIZ33FtJz6H5Oj1X89Avp2ptdN5/aHVrWU3Y9j96FD2GFm+/Y5/9N8Oth5U3tcRHf+4WnvQN7KPjilkxLSFo1vpWNQv0ZxgV5qyGDxUOH8qQysqP239JWImhiYfC0UiaR8DnHi3ItVFGS5ZFZQPO7sHBpAs3SCszclW3tL/cHvn2fd5COOVeEh3PUjmK0eFBlxI/pHs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x2WLj+RrHa6r2r9DjYCt9r0zzHF78Q6fh3HosxzFwnfCE/AhwHxWo20dbqJ/?=
 =?us-ascii?Q?sFae12GIO7P2PfudxCPS3ybfkJ0nHRyi4EHa5jeWC9Z+I52g1Jx2BeVLth1t?=
 =?us-ascii?Q?g8onr+p6iWmr2L5jtMIZP0j/+VY4x/pfJKxpOMpjgazSxaIlUo4XWCElm0m2?=
 =?us-ascii?Q?kXttC64yN9rgAn2lxL4SFH0DR4znzsh/DiKdIfzQR0hNN6m36OL1Tj6b7fDM?=
 =?us-ascii?Q?xpBqLlhVt3W6IstGvM7xDubxbHCb0NxKqhB1hcTKcJsBrxH1ZEHM1LqNnGCD?=
 =?us-ascii?Q?3VD7I6QjH0K1duuxz3v93moazCkdMXdP4nKrXRy75WYyU0sAbfHl0n74Be7+?=
 =?us-ascii?Q?BdvZ/vgQxBjcS04+SR6P/LmI6OT7EtyGEJP605btybFsGNUV4xJxmSl/9e9k?=
 =?us-ascii?Q?3EOtsW1+qvTeqODIngSvtXa9xXTU92eUIkN0gLGtWA/yNkKo11YDpyRTpng4?=
 =?us-ascii?Q?ScPt0Y2wN/PXEqausn/p56UEDih2gTjf0h3Sx66uQviJ1JsnN5itbcmjIJJg?=
 =?us-ascii?Q?whIb/aV0XCit+U3kTga4+frFNxx+c5CU4DRcdicwxMhZTpp5htJtuB3v+xHA?=
 =?us-ascii?Q?SmuB2Sf1R7P1i2k+jycpEts1wzrkB9g+qHVvYH8nDxMYHKyeNQaGXRM9okS7?=
 =?us-ascii?Q?whP0lkqwQVeJaibttsTBWI0F1L0hxAieDjS39B4w3W2AyH2uoQOW4QzczowL?=
 =?us-ascii?Q?xvxWO/VFUhGtiZo5rjLz+e8HXe1q7AKlAuDCfDiT6XubFdnAAu67rbTqzKzL?=
 =?us-ascii?Q?9+AzK8qCAnjCNJhBeuoxkP2it+yGB/6lUkfaM590uGBh1Gw45CTP6RV4PRpX?=
 =?us-ascii?Q?Aft9FRnN2nCbTU4TMu/nII7eLRtC+k3GX2UoCtS2dk0KTphaSbIk0K4VykHt?=
 =?us-ascii?Q?KGc1dd739CExmpIFKJFiGU+lDF90YhZpU7ULLoxUPhCk/v2/AKzvt+PlDWTV?=
 =?us-ascii?Q?gWP0EqfyCNOb8FyHEyRhh6iZTYR5dkp1f8pVKBBsaOmWCXBLqQym1LBfPSDr?=
 =?us-ascii?Q?WI3w4a8V8PQEI3nLSrAMAj7e6JYjkqW1Km6wskAJZS61nw7Dii6oih01B0Aw?=
 =?us-ascii?Q?E0twDOrpFogVD/qa22LrTUSDjHVs/4zvffE0+NZnE99e2z7ShQsOTprfBlJ6?=
 =?us-ascii?Q?wgxzfYhjyhVOAXhN/Kp/NrYnWI5fBuqcqaazS5iv5cUs4DFryT1OIplt1NBh?=
 =?us-ascii?Q?VQKpSHTUYkV/XT6qrLDecnVWunOFl4BK9dZIDKEtaiUXzkJUKfl8Ya+mfV25?=
 =?us-ascii?Q?h0gc6108x6OEArcxOfdOe683HCwEFMYAI98oCCk4zJokXLGOmqbMyg/0upJT?=
 =?us-ascii?Q?jH5FlPjoMHq44mVPIfrbuXbRNU0sa86tQdSiih/9LaVRjOvRPNj+OxwjPnyq?=
 =?us-ascii?Q?UfN/bnyapOp5KEXDEpmdWhpDnYe8UIvdyr+fu8O+YstzW7DumLYlsqeHGmNR?=
 =?us-ascii?Q?/hTX3TvvcB0/390FOdhBOSuw7eZE1k3ZiQOU8/73UP966btMRxU7V2gSs4/8?=
 =?us-ascii?Q?5eAhGIM0T+fST4ZALJlK3k0ImJG0K9byp4hbEpWb3WgRIZfVAj7bOppxdhmI?=
 =?us-ascii?Q?du9lS+JJHeGz4iw0+fJtX1ht0mBqn4rNR+YwiF9kCKjE44IOWlerQuiVaPD5?=
 =?us-ascii?Q?tnuk+VUVMHJU5afuuUDD3BBi6hJzsCpkMsdbKxpULFYYAzV8T8Q2TLP45PaE?=
 =?us-ascii?Q?e0EXuQo9n6kGvVhKBR+ssCv8zg/beRdKcnwSzXFsi6mkhxUAm9zh/HViXezK?=
 =?us-ascii?Q?FUTQeZJ09MkPwnUnW+mBVeOmIdIzyVI=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0ddd7c-21e7-4dc9-e234-08de8a64650d
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:48:13.2606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2F4Ud8zFE6ns+HMRrt/i5oj8BdO4jGFriVeSvGmhDKnfmcyRzHvNAK8yw9263HLigw05yMRqGimEcfGznm3tXv/LqoAKlkrTDWy9icaNloU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4294
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57011-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BBDD2324E63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for 1920x1080 and 1280x720 resolutions.
The 1280x720 mode uses 2x2 binning.

Both 10-bit and 12-bit pixel formats are supported.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 120 ++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 1fe5650680bb..1496342c24d3 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -461,6 +461,78 @@ static const struct cci_reg_sequence mode_2592_1944_regs[] = {
 	{ CCI_REG8(0x4837), 0x12 },
 };
 
+static const struct cci_reg_sequence mode_1920_1080_regs[] = {
+	{ OS05B10_REG_X_ADDR_START,	0x0280 },
+	{ OS05B10_REG_Y_ADDR_START,	0x01b4 },
+	{ OS05B10_REG_X_ADDR_END,	0x0a0f },
+	{ OS05B10_REG_Y_ADDR_END,	0x05f3 },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0780 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x0438 },
+	{ OS05B10_REG_HTS,		0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN,	0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN,	0x0008 },
+	{ OS05B10_REG_X_INC_ODD,	0x01 },
+	{ OS05B10_REG_X_INC_EVEN,	0x01 },
+	{ OS05B10_REG_Y_INC_ODD,	0x01 },
+	{ OS05B10_REG_Y_INC_EVEN,	0x01 },
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
+	{ OS05B10_REG_X_ADDR_START,	0x0140 },
+	{ OS05B10_REG_Y_ADDR_START,	0x00fc },
+	{ OS05B10_REG_X_ADDR_END,	0x0b4f },
+	{ OS05B10_REG_Y_ADDR_END,	0x06ab },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0500 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x02d0 },
+	{ OS05B10_REG_HTS,		0x0368 },
+	{ OS05B10_REG_ISP_X_WIN,	0x0004 },
+	{ OS05B10_REG_ISP_Y_WIN,	0x0004 },
+	{ OS05B10_REG_X_INC_ODD,	0x03 },
+	{ OS05B10_REG_X_INC_EVEN,	0x01 },
+	{ OS05B10_REG_Y_INC_ODD,	0x03 },
+	{ OS05B10_REG_Y_INC_EVEN,	0x01 },
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
@@ -514,6 +586,30 @@ static const struct os05b10_mode supported_modes_12bit[] = {
 			.regs = mode_2592_1944_regs,
 		},
 	},
+	{	/* 40 fps */
+		.width = 1920,
+		.height = 1080,
+		.vts = 1504,
+		.hts = 1744,
+		.exp = 1472,
+		.bpp = 12,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
+			.regs = mode_1920_1080_regs,
+		},
+	},
+	{	/* 2x2 binning 120 fps */
+		.width = 1280,
+		.height = 720,
+		.vts = 1003,
+		.hts = 872,
+		.exp = 970,
+		.bpp = 12,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280_720_regs),
+			.regs = mode_1280_720_regs,
+		},
+	},
 };
 
 static const struct os05b10_mode supported_modes_10bit[] = {
@@ -529,6 +625,30 @@ static const struct os05b10_mode supported_modes_10bit[] = {
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
+			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
+			.regs = mode_1920_1080_regs,
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
+			.num_of_regs = ARRAY_SIZE(mode_1280_720_regs),
+			.regs = mode_1280_720_regs,
+		},
+	},
 };
 
 static const s64 link_frequencies[] = {
-- 
2.34.1


