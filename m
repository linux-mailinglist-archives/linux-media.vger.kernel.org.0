Return-Path: <linux-media+bounces-54767-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CCfInfKqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54767-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:37:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B31F220C1A
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69743303EDA8
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65398387361;
	Fri,  6 Mar 2026 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="J1XTNYfr"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021097.outbound.protection.outlook.com [40.107.51.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7D37FF5B;
	Fri,  6 Mar 2026 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800496; cv=fail; b=fmNGxnI0EI0HlMbOBdgAp84Wc5uFUKpAPYRXyCklqfm8IHjYr52a6XFloKIUvgBWlxNSa4ysiozLTPdb4x3L48P64wK64AC3gfd9H/iGB1rKzWaNeX9/SuHfy/YguSSigeOVrJI0nOGrl8Ixg7iJoow7dZJpxGcGUo96k6y5gSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800496; c=relaxed/simple;
	bh=8vW6hKIOuYbA6p8tg4a9iVQtofTq9Qe2osCPw0sqlQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UjFjKCTGZJwnrPOLfrchDLtGEWClflrcy0ydI/wj/3bIkGMGC7R6wpi38Oq4iuQudY9Oge+h+DHVgIkpPscg3Zaa6Qv8uwOxEyp58gBS0VR8W6M61ivl0PdI5VEueQZHP+X9pmJgLBSOCkIMauDPQyH6ahqpf1xBT6U3/xVi/Gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=J1XTNYfr; arc=fail smtp.client-ip=40.107.51.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPZUytdWns+TgO8wm5kfJuJfBsE3Bl8q32uDG54Yv/RSxJSY5xHJWorv0Uq2pPfDaYPTs+CAUcIx05QCYQgBOPp0ZdwmVookaEJxPB+yHT+cTRXVC/dOkrVU24hX3z5hrz2Vqdpdu78T8c4o+JYTbqjWpOCRoEARAPL4HZmcXFvTmQvWggkwZ2HW9qfuEKML1TTeZ1tXEpnR9knyEZpaiqud0PsTBry/JXoFWmVfPTXSVP91zSINbMqlMhavlWEprrNat1WO3nHjB8JygjIfgOpenzft+R+ReLgR8Qre5j3LYCTkyyJtD/21DZkjvHgOy9a0xdAVQi7TTc2yeGhxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pShkqziqgYQgxboMD9cIHMuhnmY1id4iTVd2TP4eQHY=;
 b=y1XkVuda6+5onVzHURAuqKZUq2QlN8dICYMXG59SM74G4wn8Qk+9oTH7//RILe0Jir5TcL/817n25+4IdFTrnuwMDU/7+vJ2n5bM2rZak0RWLMMWUBO+blJU561+raNy3xZz/vUSZkYcFsbMtCDdVTprlib/tw1HOtX1oFIyAjxNyITjAYp7UQQlUw60+cvNFOm0I0EHJBxmebHZrdlQMwSz4GSKms6XTGts6XUa2kNjqjdh5kuBfO2GzB1Mw/zaMvsI4Ksq3d9zB2AKv4QTiUndX00bObBGCgiUvzGHP0fBO+UH7YLck0Etl8ygkTNLxzDrFerVMtfKhH19fmPfqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pShkqziqgYQgxboMD9cIHMuhnmY1id4iTVd2TP4eQHY=;
 b=J1XTNYfrSvGCqOrJRx/JdHqWFmCyjuVSyggpbr7w+zBlCmyqLccMFYukglIcNkSPBShTQIY3ZbJqKKmSU23J/yFritYrKIIdbAqW8xdRM7glLIFg1BagrqpQgHlQnEB6XIxprrz5LzjojOKaA1259l3VSnH/BcpgtAJ79w3cC3pI/HOVQVR/ctQSw3flMb2es/XzHcyoAqrg8/LYKT7sPK40Er4W1u19JBES0yrH3Y0Gbht1nJu/gkR2jNR6iU6ry55h8i74ZrQdsl8K/D4eubk+Zos5YjFSHvC06sHKJsDhKZuoEJoPQilRB/7Xmss7b+IqbrxnWjSBoCWwA/58pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:30b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:50 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:50 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] media: i2c: os05b10: add 2-lane support
Date: Fri,  6 Mar 2026 18:03:03 +0530
Message-Id: <20260306123304.76722-14-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 023023f9-5f16-4054-641d-08de7b7cc256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	SIpo1rFzRCsnD1j+dZHpDeXVHwwzYlGIgFPfbxESYajYZyzeXkNrhrnsyLkB6OORuSUkhmYvbseVLCSa0sp0AgXnueoFd/3Z8p+bs3nV2XIAmg/tbaE+CxocjgusNfcg0zwISE22uoakQXPiC5SSBA/STcbhf7gaBA6jcgXq74bKg3EQxKQk6iqv/cwhRlWIpoN7mB4WkkdSWTjBqQHt6YtQ/cG6IEWRDpBWqRCJK2mbuPJE/9HlhHV8xqKt93r3Au+CvJyNSNwn7J4n9zp07vLeQtuRxCcDBWHLeqhoBkb3tAm8OxZizB9EfkENcQzLkfi+qVaD7ZuzEHc2Az43LLnXwUzpzQt9N4nWP4TOFNNja8DZptQtFZUBEQgneRNoM0cgihneFYFFn+rA+CCzHPYAEsYDeJYU2p1zbuGZ/0BB6Tskb0mVGYSMAZjUppZY0w51AG1lGCeV/UDdLiaeoKZqSZZR8iXZG9JsG3t0KXrB6VKpv9ureq/iI3o4GriYxxkLqWASdJSW/smxeOubFs8QvBcI3qV25vYI+4xW9S0+gybcAJ3PMa+3iz5Oix2He1SIOoveg9Y9c0okD8eqYA3KYYH08xdOLS3oK135pdJFjwwelv6aoaw/dfXKFP8mdnLkbuLt9TLz1ZhlkbUOAl6ps1m7N9pOqRTmYU0pg9hbwQRFJ3tqR83oP92bn3I0oC92yNPFn+4bmwo34tfsIQwb+BHdds/G7d9Grrh26U/TcdgSum09wX3Zo79HW4gwG6AhL7HZrjFmkJlRxJn/nhUEePKriWjXxBSGDSq6pA0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MpGY1jPRzHeILavv3ntRnJ1uA7ONEbxTvqLKIX9+mglbGXhzSt0BMM8WRw1K?=
 =?us-ascii?Q?dVMAiIG9BfWW9eXGLlr9f48E3nQXVTKNUg0DCfVcQ/z5OiEVqC0YMr4HglbZ?=
 =?us-ascii?Q?QTAPEHS2fgLV7rlB4RcUfs9u7QetOqvDJqByjsIGjXTP7riuDYZ51JxMgOyH?=
 =?us-ascii?Q?gxtKsvhFAYD8sr1Fe+K5a1zVmKC2pEQILzwINfr/ZWo5ZtTxc2/f06bpyCh9?=
 =?us-ascii?Q?ERJB4+nvCrt8mVx8AKRzR57CjWApDhMm67pXdPqADWOMhdO28qqW3A6li6x+?=
 =?us-ascii?Q?ZW2cxPKgFZtZ2PFd3cZO5QDRjN6GOjQ7j2Z0cBD6Ab48sstEA6RCuzgwEuSo?=
 =?us-ascii?Q?Qm+wgh6f17vXqi5EkYSMddv2l4ljhhW+HJ3NltLQ8A7qW4MPPaKE/20kf34E?=
 =?us-ascii?Q?WR0ltn+nChMBB4kkqodOaT3jxBa4umy0yiiXuDS6JmgPahWdyjKP5/YBsHEI?=
 =?us-ascii?Q?EX5MUbRX1vb2aZ8dMWglMT46ugCdCsk7JptkTISoJ1aVSPORKxa/Jn6PEBiy?=
 =?us-ascii?Q?Q7tS88Px/r1HVEEFHsK5/piM6+FV3Ys1C+AWpLjustpMuwK8XbMTTCtsf5LF?=
 =?us-ascii?Q?aJYsSWvLAKzxkZBY43pI0iWP707p8eTpgte6pAgnkn7Y9llGxkNdo+A50XeS?=
 =?us-ascii?Q?WBwGrG1in2eyQfAivGjUb48ZDyy0BzD2QvEc3/Bp1g3PZyWR2hiNgE9lOXjk?=
 =?us-ascii?Q?esNwNYtcjGjU24SDUo4tJnkw7WS4B62fNH/HmaULSGQe9ceA6xqTDCICjWWk?=
 =?us-ascii?Q?EWNs6EAuv+wE5/QMddAmFBUPzB9vrK0GR0QKfUHfwj6B+hKu2z+OaNBNkAwL?=
 =?us-ascii?Q?WQqQY+iKZ7IE0L7vRjpj13bZHJWjbtP0pB41Khy5M/d7YyhVMI1zPNVfQ08h?=
 =?us-ascii?Q?4exLsv9l1wpbDeEGx6Rte3HW3e737jJAtModGEyEXVHBTWTTy/X+qx2O39a2?=
 =?us-ascii?Q?EETzM+EHbAIL+LOlmpj8RaIPBhF0EJgkUCZNSQA6fHC7xc1lNSww8atzbBi4?=
 =?us-ascii?Q?rQXdFa6tZOwgcI2TUhBpx7YamDZATA0wDyvSnvn0x5OzH+SOJCnkEQjqkEQB?=
 =?us-ascii?Q?HkYg+UpXjwOZl6SZ0ovTZy4Ln/EasnW6ZON1RZrmMcL3LNKChlDsg1wsCoAI?=
 =?us-ascii?Q?d98t0Hpz5YYwFCjKEeAWkKhGfg5SRwbfSchf0SH+6XTZGEYJ2wkgSV4l2t1Y?=
 =?us-ascii?Q?zCHYNAoizCgAEovTt8HIhtyxSN36fJxEszWTDt2oO1v1sRIThYMxf9gENAKy?=
 =?us-ascii?Q?YsGDA6RUofmK5OugTyRdRM4evJSo78Qufic0mBrNZHWDQppfeOmiHHU1PDOn?=
 =?us-ascii?Q?LVPOAY2MNxgVYMwEYOZNQI9BvJOiasmfxs8wCpjgmzzNuiVAzps1NScfQM+M?=
 =?us-ascii?Q?9PLoRsTbqtmCi4hQRpigsZcqz7v8ierZgregvt1kFdaQnoJkmDHxCzqEKnK8?=
 =?us-ascii?Q?5QVVjQ/IqMNLLcusIfAUn+LMXIzE7XWSP0dSdDxWRHK9CMguJwIumVdA5u5p?=
 =?us-ascii?Q?X0f5hPj1LGwpXIOsQi5KcAYu/jbTK0gvRTY136/xC86lvR4dd1skF4R5i2Jj?=
 =?us-ascii?Q?2ZMKuq19z99LA/s2XfSgUgiXfSFgb3uGBFtOnc03tazSP/kcTSHyZIW+0ocr?=
 =?us-ascii?Q?PmRGKt3zmSPzJdmyS1CUuAXsmq2NXspvuXSKxlYa/7iGsKaFOvZ0qi/QlW8U?=
 =?us-ascii?Q?jANG4C+erGyq6NViiK+JdNCssB2nb4v8Q9xMhQDS6kxPN9BC0AlmEOb9b448?=
 =?us-ascii?Q?sVI1ldbck1nsnUeLDjHnRQay+30Sb5e24qR/7n6ltyDHywspZL+z?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 023023f9-5f16-4054-641d-08de7b7cc256
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:50.2040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PfF6cdBf6D1QjZnVBbVo19vvLBhi8AyPTVonfqiO+GVndm5q86G2x2/cVCiX+R4HcADKtGsOe4ol11+hj+Xi/3577CARr1qzQMle94VSBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5365
X-Rspamd-Queue-Id: 6B31F220C1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54767-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Action: no action

Add support for 2-lane.

Update link-frequency handling to select 750 MHz for 2-lane and 600 MHz for
4-lane, and adjust pixel rate computation accordingly. Extend endpoint
parsing to accept 2 or 4 data lanes.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 94 ++++++++++++++++++++++++++++---------
 1 file changed, 71 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 1393c7b5d860..7107a69157e8 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -114,7 +114,8 @@
 #define OS05B10_TRANSPARENT_EFFECT	0xa0
 #define OS05B10_ROLLING_BAR_EFFECT	0xc0
 
-#define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
+#define OS05B10_LINK_FREQ_4LANE		(600 * HZ_PER_MHZ)
+#define OS05B10_LINK_FREQ_2LANE		(750 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
 	.top = 0,
@@ -137,12 +138,6 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ OS05B10_REG_PLL_CTRL_01, 		0x44 },
-	{ OS05B10_REG_PLL_CTRL_03, 		0x02 },
-	{ OS05B10_REG_PLL_CTRL_05, 		0x32 },
-	{ OS05B10_REG_PLL_CTRL_06, 		0x00 },
-	{ OS05B10_REG_PLL_CTRL_25, 		0x3b },
-	{ OS05B10_REG_MIPI_SC_CTRL, 		0x72 },
 	{ OS05B10_REG_ANALOG_GAIN_SHORT, 	0x0080 },
 	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 	0x0400 },
 	{ OS05B10_REG_EXPOSURE_SHORT, 		0x000020 },
@@ -533,6 +528,24 @@ static const struct cci_reg_sequence mode_1280_720_regs[] = {
 	{ CCI_REG8(0x4837), 0x0d },
 };
 
+static const struct cci_reg_sequence os05b10_2lane_regs[] = {
+	{ OS05B10_REG_PLL_CTRL_01, 	0x44 },
+	{ OS05B10_REG_PLL_CTRL_03, 	0x02 },
+	{ OS05B10_REG_PLL_CTRL_05, 	0x64 },
+	{ OS05B10_REG_PLL_CTRL_06, 	0x00 },
+	{ OS05B10_REG_PLL_CTRL_25, 	0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL,	OS05B10_2_LANE_MODE },
+};
+
+static const struct cci_reg_sequence os05b10_4lane_regs[] = {
+	{ OS05B10_REG_PLL_CTRL_01, 	0x44 },
+	{ OS05B10_REG_PLL_CTRL_03, 	0x02 },
+	{ OS05B10_REG_PLL_CTRL_05, 	0x32 },
+	{ OS05B10_REG_PLL_CTRL_06, 	0x00 },
+	{ OS05B10_REG_PLL_CTRL_25, 	0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL, 	OS05B10_4_LANE_MODE },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -652,8 +665,12 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 	},
 };
 
-static const s64 link_frequencies[] = {
-	OS05B10_LINK_FREQ_600MHZ,
+static const s64 link_frequencies_4lane[] = {
+	OS05B10_LINK_FREQ_4LANE,
+};
+
+static const s64 link_frequencies_2lane[] = {
+	OS05B10_LINK_FREQ_2LANE,
 };
 
 static const u32 os05b10_mbus_codes[] = {
@@ -804,7 +821,9 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
 			      const struct os05b10_mode *mode)
 {
-	u64 link_freq = link_frequencies[os05b10->link_freq_index];
+	u64 link_freq = (os05b10->data_lanes == 2) ?
+			link_frequencies_2lane[os05b10->link_freq_index] :
+			link_frequencies_4lane[os05b10->link_freq_index];
 	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
 
 	dev_dbg(os05b10->dev,
@@ -972,6 +991,17 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
 		return ret;
+	/* Set pll & mipi lane configuration */
+	if (os05b10->data_lanes == 2)
+		cci_multi_reg_write(os05b10->cci, os05b10_2lane_regs,
+				    ARRAY_SIZE(os05b10_2lane_regs), &ret);
+	else
+		cci_multi_reg_write(os05b10->cci, os05b10_4lane_regs,
+				    ARRAY_SIZE(os05b10_4lane_regs), &ret);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to write pll & mipi lane registers\n");
+		goto err_rpm_put;
+	}
 
 	/* Write common registers */
 	ret = cci_multi_reg_write(os05b10->cci, os05b10_common_regs,
@@ -1184,22 +1214,39 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 	if (ret)
 		return ret;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4 &&
+	    bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
 		ret = dev_err_probe(os05b10->dev, -EINVAL,
-				    "only 4 data lanes are supported\n");
+				    "4 and 2 data lanes are supported\n");
 		goto error_out;
 	}
 
 	os05b10->data_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 
-	ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
-				       bus_cfg.nr_of_link_frequencies,
-				       link_frequencies,
-				       ARRAY_SIZE(link_frequencies),
-				       &link_freq_bitmap);
-	if (ret) {
-		dev_err(os05b10->dev, "only 600MHz frequency is available\n");
-		goto error_out;
+	if (os05b10->data_lanes == 2) {
+		ret = v4l2_link_freq_to_bitmap(os05b10->dev,
+					       bus_cfg.link_frequencies_2lane,
+					       bus_cfg.nr_of_link_frequencies_2lane,
+					       link_frequencies_2lane,
+					       ARRAY_SIZE(link_frequencies_2lane),
+					       &link_freq_bitmap);
+		if (ret) {
+			dev_err(os05b10->dev,
+				"For 2 lane 750MHz frequency is available\n");
+			goto error_out;
+		}
+	} else {
+		ret = v4l2_link_freq_to_bitmap(os05b10->dev,
+					       bus_cfg.link_frequencies_4lane,
+					       bus_cfg.nr_of_link_frequencies_4lane,
+					       link_frequencies_4lane,
+					       ARRAY_SIZE(link_frequencies_4lane),
+					       &link_freq_bitmap);
+		if (ret) {
+			dev_err(os05b10->dev,
+				"For 4 lane 600MHz frequency is available\n");
+			goto error_out;
+		}
 	}
 
 	os05b10->link_freq_index = __ffs(link_freq_bitmap);
@@ -1229,10 +1276,11 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 
 	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
-						    ARRAY_SIZE(link_frequencies) - 1,
+						    ARRAY_SIZE(link_frequencies_4lane) - 1,
 						    os05b10->link_freq_index,
-						    link_frequencies);
-
+						    (os05b10->data_lanes == 2) ?
+						    link_frequencies_2lane :
+						    link_frequencies_4lane);
 	if (os05b10->link_freq)
 		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-- 
2.34.1


