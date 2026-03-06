Return-Path: <linux-media+bounces-54764-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NiCDUbKqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54764-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:36:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C81DD220BD0
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56D85303B82B
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C922C11F3;
	Fri,  6 Mar 2026 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="A69ezPr3"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021105.outbound.protection.outlook.com [40.107.51.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E751A8F84;
	Fri,  6 Mar 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800485; cv=fail; b=cHQ53r+ewVRec8hMlUbSQokURhTlH6dGFd1nvbjQstOEbXxRbnvxqewiF8TsLdbfyCg79A1FPzjPHyds/BOukN8YC0JCf2IUFahOd9ECrjlQspahzASrjhG3BFCbY6Ff04mUZbGuwEltyxJRQtT75qSWEW2HHReNNIdMGw+lDSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800485; c=relaxed/simple;
	bh=ujrslm8Fe7+QfsUWkHdE5ahgotuRFdopsq42MJABLVw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l5HIlOGTqO1mjUZkeN+9A4y2B7V3RNK7jsE+geijmbPWsFR6iV41WWfCA6pgvQbgkP2X/BtlqtTjBK78oLyEDFlyGqvoEE0APg2bqOBrNuCdoiN/IRgwBZiG7kiQ6VrmPiN1qRSjtmclqboFkK/+RO4EeA6bduEadR9+F5XMEkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=A69ezPr3; arc=fail smtp.client-ip=40.107.51.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgDShZb9cSFhiRd13T6wvzC5cCc+MB4jrGefrHyu7risW+a1Zbzr/IxuO1Ol3oRKAZVoFdXftSUozzRjYjVRZsf2EYGbN7KkrzFY8rxStR5Rz9ok1sUO7xHFPj97EOjlilfg7YkXiP/zE7hirlcRhfaD8StFaZJCvAd5SUTYj5c/2t6Oc8EGUjZRBxO0dduXwTduJlLsf1aRSurqG9yqroIA0D6VuL4CweyEZe1a2885GM8xn880lzd5VyRZFKJw5niAxKhZrB46C8vkdqmx3IQ+M5SfkckBlaUUnXkqSyzWsCSadnlgOnP6rXaszhC0Ol1GNCTLxtY7haWLcSNBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F63xWCx/Y4pqMfM4DG87Qp0tDMGtBnYQ8NSoMOayghE=;
 b=iyXN9vtW15uiDX3A1zt+Ou95+gH98k0n95KsZaBtRutgw2OU7JqKy384WOQDNYfHO3gVlN1WOiutC4zee7wxPWqy4ff4PBr/bDpH2upvXmKtu5FJZT4pn9S65ift4MQRIfgZ6JWvOeSXSXQqhl4jekQ6YMS+2Fm3YHu7Uk5CeaQd0FqayNcUwaXUaXJFCPfcRr4n57toTAutE3JiLrZYd0bruwwH7WJL/Wnx4QxBn0w1YDdtFm7Vj0lMWfqpzhN2YdQNuNCefFN9Jmgoxhz+Dyq9pHx0WgDMdZeyuDad5cAiOZOVaWjMNrLmoZcYuZtryQ0H1MXWq/stvdIgB+IseA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F63xWCx/Y4pqMfM4DG87Qp0tDMGtBnYQ8NSoMOayghE=;
 b=A69ezPr3Gwa1eP+JBQ4stbTOCa8G7GVRR98bpibWbM5wpsEWomc09QNnzr9TnhfFFTlQKL6NgsVBV+bwD6lXpPvjY3y3sOFpvP1Lqbv+qPmgbNN3SNP09mu1Ptur0kx4yGrRG2L0d43geZXPHyxBjKaAATSMNyZV2bMZMvroXjTw+p6R7K2qNHeLjTlDtLu482CPwWTycHEGij7BR7J5EhJggMQPZVZNQBN7AEgYgN2Ooygni2IvmfJqVc6yxLSxw4JiGn7eSG3aBDuprd2wjsXA6E3wrQJLh7pCMPsdU2algHLCzgMku29RCazMcgJnz2K+obB3C+1bYAWQAeo7bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:30b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:39 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:39 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] media: i2c: os05b10: keep vblank/exposure in sync on mode switch
Date: Fri,  6 Mar 2026 18:03:00 +0530
Message-Id: <20260306123304.76722-11-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 2637f237-94de-4d99-6db2-08de7b7cbbd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	7mP63QYASVEvATF1kkdKJpOoY8Wowddanr8Ijq4Dn4lkQNcmEEjb0vfvaCGRDUITFcxGB1hdkx/W4Z3+eAOfhZPMamn5dV9DdWqsBtUS/nR+B86ilVSCHFvpSP10FfTA/hwwIA9oeZGtaGKu3gDSYia2ONDhOuc/hUIv05aLtZDNf9Im80LmOSebD39OJVjfJLQAWKAAt79ctneE2q1mIpamaS0WUHOz+L8Ll5m7uAXMAJ8VCPXNacfJVNjLqDAqgotYuM1zXVU/vV/fd3uI3DFlwmvhy31nYeuKhMkB2/kDFckGL9No2PlyB8jZXgWy+8YM0hD/TiYh6C7DtyyNZn+5NIxmjQbMWRmU8aszjKhJq6uw58zRGvKI6kBmdgt8UwbpDqGsqioMPqcIrdUGQFxZsd3ziStfrcLDSPwd9CRAPuEniqXxDMUy+eO6caCCf0pY9UQ9BKFKaDnOoivZoaBMTzsjdaKC39xmHp51ReKUqe0jc7Jn1vATo+m284Ts7Ikcw2bsTXEyz7rLZGyt0ie0+tZMKMv496PbFPekOHSzxhgLK0U6sx8RiI/kz5ZTY0n+dagXnxNmaXi+VO8VC3MuJGxPn0ppEhENho+Q8Lqk2XuvHvEOtJFfscSL5IeUPwacFTUeecOX0KFuDT2JzLooVRT/kGFKM5tr6K7CV9TyUaBlOyCjFngQjR3uJX3VgJSEiKZ5TVoVqEbFWCC1yN5hG5Gsed/GwxXIsEitVagslDUbh73n77ikPXkCIINLlKcFb3j42wlKcacmu2uUoZSD+JYA+vQnOYzH6of6jj8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GD6fAEHiKx3iT+fzQLzYDN8IGKI+qUZ+hSKJRJVuHL2nBei2MnNNzQY+cqvC?=
 =?us-ascii?Q?0mlXRghGK4GmNov5mk0x9wUdwZAF+fZ0pO3OkTgewa9x6vVRY/Zx93OkIFir?=
 =?us-ascii?Q?Rm4QBTVnl+MKQWnOPxZvEhop7eM3aGiUGQzTHq2PUHyB+Y/G570f0Y+3tkZI?=
 =?us-ascii?Q?I38xrOxeAFCFb0kTTs3HSshWG05aIxi20o4prpMxtFhSgGzOER0VL+QNeM1n?=
 =?us-ascii?Q?R9OBSbKT26dg+qsbgh5+taOuPvq6sgW9zNXetTYHJRcLO6XoJhBwYrBn0NQq?=
 =?us-ascii?Q?P9Zqfc+oD3ccgasPu7qnTuXRgH7o9a+lq6x3VJiZQuqgORaOTJqWpgqAuS2r?=
 =?us-ascii?Q?LYG6nvSxJyEcylqJaqCngvinoH6vT9oaedz1dJKRipSPZEYwKacuMcf92HWq?=
 =?us-ascii?Q?+KK+JctAmr8Ktjo881k6JvGkw9XyDy9CX5DlOzgBIX9PnuMDBNpq99hTaytr?=
 =?us-ascii?Q?GcRSBvMwRuAzQHDxYM3K6eOfrxj4HAXx3gO6awoHf7bMTQ/Vm4pB7WeDiUPP?=
 =?us-ascii?Q?A/4QJoCfralCww+tiXFF6D5tR4o3I87nERTjDGFrMVv2qlUwwfWR0MZ+lOCw?=
 =?us-ascii?Q?A5kNLLkhOEA94BLzNzQiOWBBF68Kc+dBQTt55CfDwMQ5U80d7wVaW5LALfl1?=
 =?us-ascii?Q?cQ/jaStCs9N662p8xGSoAKoC3oKiqJcGi0DpOLM1+ie45E/NmAkVZwi4dCN8?=
 =?us-ascii?Q?a05EBhkvUaBNUH0U+wCN71bia9CFuVzWFGw0jvLi9lQpEfQS7aMwNuYakorz?=
 =?us-ascii?Q?OLLq3OClZlkur8IfbPfLVYeCXknyDHTIUV8G+Eke9DeDXlJun8IDOW5svUL6?=
 =?us-ascii?Q?RHlQU2h2WlNMbyJgqikzDF4PT7He8EYFeIX5N71vFo0gYUDoidLiHrPxxkKk?=
 =?us-ascii?Q?8Y9wt37Ad4reLxdvMaCT8ES96YP73IOaE80N7YcDkFa6Q3wJ6tdpoooo45cn?=
 =?us-ascii?Q?ZJNDuXmRfkS1Jqz41KQ6BYGSCpz4qedH8DH68eqkVuOS8EjfHZ1yswFuwe62?=
 =?us-ascii?Q?k6wKmYEgX8JDPZxA/B27/bAOGkWoIFZemXsBroBChlg4WJTF5oe/NBbcJIfp?=
 =?us-ascii?Q?n72WBvsaYQxyd8oazDQ7KnX44xLoOnkip2kqTSpCyJAmaGpk5PAmYunDp03T?=
 =?us-ascii?Q?bSf18jeWq+eQ7wgDROrSwxnO8QitqXtZ99NP0AhWjiVoFfnWH5hKg+WDs1Rm?=
 =?us-ascii?Q?0ppZ2rdnFliqP21Is2ZPRijoDoM7ZpPOE49PfOVpW373FeQb889AC2YGQpJT?=
 =?us-ascii?Q?3e3BKHt17+sJ602afOh4jI3CBaE0QIFbzRgwV+lAAC7Q+TWGZvaBUMdnOgKT?=
 =?us-ascii?Q?jz+un45PWHDrQp3FFBslcCOEbSCfM7MsGYEXq3p0XfHCIKHMAkjziJJDC69S?=
 =?us-ascii?Q?+tPAdmuXCa5etRkviPEk5GDVD2cJLLnLrHMyZPZfkbcOAhG2NIeQXPjIeWhw?=
 =?us-ascii?Q?d7KJl0LypTzzsC3j3LipUUXfxYh++1hx04f2nqKRksLL9QhgEd8r6UPMi2yL?=
 =?us-ascii?Q?FXr4yrpU7NvOcj7dHTEkMeVS23lTo8jzMtFJ4KSeIH8MY2SPEqh+XUU7FE8d?=
 =?us-ascii?Q?Bu61QkwdytQ/U0ofq4MlVddt00cdX7bAu/dloQlvpZPnZCIsvjJtBcIY+IvX?=
 =?us-ascii?Q?LtbJeCndizoRyjwfFrSGvA25UjDddu7JHQpzSSPT6YSazXmMzvMtxNBdNFhE?=
 =?us-ascii?Q?dWEaVydYq3AOMUk5iA4Wy4hS+Gha6Z7FTEpXc3eZtcGhPlal1hxNSX9xhtVU?=
 =?us-ascii?Q?CvnrzVp2OHUPiUjLfiewOunlUD5YLrkEvg0ElQtzocnIJCh0AhJU?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 2637f237-94de-4d99-6db2-08de7b7cbbd9
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:39.2551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AE5YJ0ueRrPGLs35s5+yt+HlWqHvymGLh3G+rejsDa1C6WhC5P3o/l0jv5BuxhmJqWSolurdrUdbjeerftFLzptahJ8A6LJj482rW1vulr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5365
X-Rspamd-Queue-Id: C81DD220BD0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54764-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

When switching sensor modes, V4L2 updates the vblank range/default but
keeps the previous current value, leaving vertical blanking unchanged.
Update the vblank and exposure control values to the new mode defaults
after adjusting the ranges.

Clamp the exposure default value to the new maximum to prevent -ERANGE
during format changes.

Also use pm_runtime_get_if_active() in set_ctrl() to avoid touching the
sensor when runtime suspended.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index d8d776de5f35..4601e33b7e8f 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -732,16 +732,15 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		/* Honour the VBLANK limits when setting exposure. */
 		s64 max = fmt->height + ctrl->val - OS05B10_EXPOSURE_MARGIN;
-
+		s64 def = min_t (s64, max, os05b10->exposure->default_value);
 		ret = __v4l2_ctrl_modify_range(os05b10->exposure,
 					       os05b10->exposure->minimum, max,
-					       os05b10->exposure->step,
-					       os05b10->exposure->default_value);
+					       os05b10->exposure->step, def);
 		if (ret)
 			return ret;
 	}
 
-	if (pm_runtime_get_if_in_use(os05b10->dev) == 0)
+	if (pm_runtime_get_if_active(os05b10->dev) == 0)
 		return 0;
 
 	switch (ctrl->id) {
@@ -844,10 +843,18 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 	if (ret)
 		return ret;
 
+	ret = __v4l2_ctrl_s_ctrl(os05b10->vblank, vblank);
+	if (ret)
+		return ret;
+
 	max_exp = mode->vts - OS05B10_EXPOSURE_MARGIN;
-	return __v4l2_ctrl_modify_range(os05b10->exposure,
-					OS05B10_EXPOSURE_MIN, max_exp,
-					OS05B10_EXPOSURE_STEP, mode->exp);
+	ret = __v4l2_ctrl_modify_range(os05b10->exposure,
+				       OS05B10_EXPOSURE_MIN, max_exp,
+				       OS05B10_EXPOSURE_STEP, mode->exp);
+	if (ret)
+		return ret;
+
+	return __v4l2_ctrl_s_ctrl(os05b10->exposure, mode->exp);
 }
 
 static inline void get_mode_table(unsigned int code,
-- 
2.34.1


