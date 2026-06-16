Return-Path: <linux-media+bounces-65058-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yKT7HP+EMWr5lQUAu9opvQ
	(envelope-from <linux-media+bounces-65058-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:16:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1336E692F3A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:16:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="Y5TRM/rh";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65058-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65058-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8AED30C4A46
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168FE47ECDC;
	Tue, 16 Jun 2026 17:07:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA77C47ECC4;
	Tue, 16 Jun 2026 17:07:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629633; cv=fail; b=hZOH3sr8ExhLNjWPZohaAaFDWtZnlWeHSfcZl9fKHdB/heeS9STJ99A+dnol1KuGMbJXwHlQ74IXVWNy9h4rttNTAAcLHTXTXFqHorxNbZqP14b0fkFnqmd6ZrCpvOdGBvNW435zlf8FXcLroMKv4n4MmjZ1biAwMFlvrgmvomA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629633; c=relaxed/simple;
	bh=Ki8b5VTEvo5Yy634VqfnaPd7mBgERLAigs5TKycfu4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dNPx/eZvW7WtYZC07gpuy1UBRvRhR8MR4xwLDdGWycRzOs4+s56aJ0yQkJ2/gILW4JllyzlvfsA9E0o/9UnxAge1nVbmvNBDSJIlETqNMA2EGfNZzi/pulptqTJ9VzL3A2MhbM/MhWFgjzUSn+5QqTOP3A+lsrrNdbJPbY16dSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Y5TRM/rh; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPYv8fWHNmsiSfYlxXCXmG0FeHKXVOuDPXtTvRlsZW8xKe6mUH5tL9iEnXQKJOwNN5swzobNjS1rleCokw1nZvTWGMsOjttjPTPlxgF0j1rFnLN1xRDcXQqgtHVVe/nP3UkgM9b79PHhJwRmaAF8zWJIMer0ur9rLDczGZH+vTpeNgMJ3YDWsOC9kSqMQEzozuyEPSwHphX/wU1+cr8f/ZuSPcgqCUwFeHsRn9ytD4S7GKMYcH2kdVqW9O05D22RMg2CJfn60Gtq7ToyPBWwrWAC5aC7B+SWqtp6ImbqFw+Uc1uZiBQe+54UFkOWs8+1sqhlLsABdp4P5gkVTsOC9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvFhM83ahg55SC9NE1Dgrwg1bwMk3146TIaS7A7dG4I=;
 b=Wt9EIA8ZKQPYfa3ESK5F/xa62PjluUmTEcDLpUzZ4UP2w0vQ0TJ7dNVXkUoDUyhGemzZMZAGLKQeZCCrXWK0Po6vTGAkOSu+pT9Sk0UPnHLYeR0kN8vaTLnK9HUlQFxjRLMAPBuxbX4Ho4vYMLo18JjjlNrLBmmB2pGJfzxXpvxARZeL5CVIHD9Zfw08CZu1ZYpKuJF0xWmCeQxwEIR2d0I4lYLauN3DQZEeZNyryZpqPSvicQ5G5HsxAXmCtvO2D6OnXJlTNyc9sowdNFDIAwEhYcqnwDoVe1nt0R9q6RwJ4labWiFsZ8jyFGZfZOne7XIq4jWErec4arM3wpvNTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvFhM83ahg55SC9NE1Dgrwg1bwMk3146TIaS7A7dG4I=;
 b=Y5TRM/rhUre2MJlRP0VPY0QF+36Iegyckubard3ENKZVQT5kI3AEo654Vfb4gl7HXsKO6SuS83WYE0UlE+tW9E5YGk91hI88QHWQHqbMLdmqKTdc990eUgYbb98rPP0kIhlc8P456qwhwsEjRmSA/r9YDaUE0WYz/jXGKzxWYMw=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9637.jpnprd01.prod.outlook.com (2603:1096:604:1cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 17:07:09 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:07:09 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] media: i2c: ov5645: Add suspend/resume support
Date: Tue, 16 Jun 2026 19:05:39 +0200
Message-ID: <20260616170542.447804-10-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0393.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d7e3a4-775c-4ab1-7909-08decbc9b354
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	IAi0MQBByo5K9rXFGfIOSkQNovMOMVt85V49ECiZK8eJ+UO1YqRuepvI2el2hssh9iIpkxXbTL7mWI+kSg1hYngCoOfuvw8njZse9z6fFCRnjxDWdTcCEVbD8u3z4cizhXIL/P2Rfsu2ZvpGW22/e0toDSNMNmpcM//kO7+gZcUVl2OzbJy5vrCI+FkN1hFYqm1sm12Oc+sVm1hIIdRxMrYj1JLv58x2qGT4iF249sfRuVPHEdmpSx/AGDUay3LzHGB3oVOJ6LojOFfGEcuOilsr5B+AemO1BxLxOuL6ME7ColminLIm4KaAW4Mr4H/S24hiQSTC9zTLmYERG8e8ihQffbUAXD8q2Aw0DyXFBqkcIPvwUudS6F1QRvA56SxY3HGmRzwbedK6v6Bb8S4t/pb7jX22zdrj2/fMgua0gScrMpcwIr9m+mK5a1sntBW7JB6Vrnl4BE1h5JPdpvmAIP41IAu+z1uiVP5AQB/V0q2BnGku4Zwy1qVMncHwblX5YFjKg+xy2rcBGgWX2LiW4Mvw6AQG1yD6p6ZS7S6wMnnz1iYko/vCDFyVa5E+OQJt2M+jnZwiVgpLrMI7IJrolZZ5OE4Ykui+bJJkyo3MVq4sR51jZjKZ3Qd+jW6SZktDgRWRVd1FDhpccc/8ODX5nnXJc1Lv/HZcvP2N61bskOCm0wy0maI7NjEOTgFA79nqiJNPlwlNeDrL8kLIMGoYfrCrv8T8QQzX7Y8LJU/cCqUoIfhuWI/yn5FENDxRT+9v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q6XNBEp8eTYAXey5Iace6beJiQNhku1VT/y+F6NF4+ktKAqiV8QQZnyt6BfJ?=
 =?us-ascii?Q?f6r1GehO41PchNvYsBFpxLx1Vx3DoqB6/SmWdnUsGr4yAbPhJ2zLOyWRiPHT?=
 =?us-ascii?Q?1H8kxEdkReKnH9lo4LiI1xlywgjLVb1Xa+I6dmv6T+VA4SpXr7mTGf97Dv2E?=
 =?us-ascii?Q?DFa1mxVD70xhkiTzpQS0jYQBFfBC7/BrBOasA0fm2J0yro9NsDKZuSPlZ+KD?=
 =?us-ascii?Q?yeEMZA0CU9VDF4AvAk1DL42TxEQrZUneCWxkc8DVYk4aIGn6heh115hQqLt9?=
 =?us-ascii?Q?z2zGdFuXGBTwqWbEIqJNPPCfly7zNaApFfs+YULLBhh8ieZGyuHXVRSAaD99?=
 =?us-ascii?Q?A/KD/i6wbyxz3dYU5Efn1s5eW6+yAYxOemoXMHNAslCfA1sqk2Up7/HUG956?=
 =?us-ascii?Q?MEwQ/4SjWyY+2id7kGeK2OqT5xbVaeotMsUUZXB6p1PqGuy8dOQt1ID8rifh?=
 =?us-ascii?Q?8NbGgeDBwc8MwCqUurZhaxkyjFVGHB7gWK8rrq3TFedg0BoD/gzTTgyeeOMJ?=
 =?us-ascii?Q?1cDEyAnwgiigxzSWnQ4FCoPTmmTGEQxqRf4XIhDxo7BiXtDcLuuX57N+B0h7?=
 =?us-ascii?Q?FBKCOAeiWWoxGnuj+Qymg8aREdQwhMeBBvv8gZB/nhVuDAwON+4vjJuIS2aV?=
 =?us-ascii?Q?avryPiUZcDSVDA3PBhINvq+43JXqbGhGuxLvDlwsTKUxI6jmumn0lKypDeRk?=
 =?us-ascii?Q?eNjBIHkk6ipgp/H+Ekq/D+UpeVsQ361/2cqfqFtx7/szSRb4Mo96EeTuBLLg?=
 =?us-ascii?Q?Ep2TF/Cz80rGjpkxiJXWXg0dQAuveNleV+bGfj25/p/gEE4BfCePBLBUEm6k?=
 =?us-ascii?Q?RFP7mH18hR13yGvYwQI8NonkdX5DX0dZtdzN6yhMvc9gHt4ypj0XcCkTJMa2?=
 =?us-ascii?Q?B3lZXzJXirgxNz+VEug8JKgLt6DTro+ayl2vee1iWTmo9MOGXXAhVdypKv4h?=
 =?us-ascii?Q?ck9+RS5IOCA3dZ1zfw4go4gjHmrnY9fhAHJztO8hNQTTYDikmm8Vy9zZH2Tc?=
 =?us-ascii?Q?LFgxkKPrVjOAtvKM5+IaDBwRCstcQC0GJUzdEVuodmNZiU+u2YlFLlS0xiO9?=
 =?us-ascii?Q?V5TdrZeVwCDXpSRtFX8gdSD/VuB/Y+7ywxw0P3I+Xqi1L1NAYEOVlDLvvd82?=
 =?us-ascii?Q?OMPqanEkFiD/Hvr2Ppra8Cv7IWhidiej09PcnYTC1wBwAIGYkJVQDEzVQYEh?=
 =?us-ascii?Q?ktKaam0veOdeXrK9vhfGA9b7XH1LMG5dfH6ca50HfN11a9t0qff45JJ8ZYUz?=
 =?us-ascii?Q?xzSeHNDP870oO0/+qP4Z70yKwJVuKzPJWNe9GmmSfyxtemGNZ5FDhyhvaUQL?=
 =?us-ascii?Q?e2tTjNcATts4D4aBactNQ1qwubfxsA8J6qR6idX2PuDXnaOJOk4KQMrZoEQM?=
 =?us-ascii?Q?uawHby4VYQ/Xi2ggzlKP2qs4lmt2HTjw79Htm0M19QHEmlguE9xRwMXKWvoi?=
 =?us-ascii?Q?MKzbk/uVBpuTnVTSWkVo/yMxwM2AJEhJkeUVyIAyDUN7TQCsPw4J27hrmwQ9?=
 =?us-ascii?Q?5dl8TBt1DUhYwQV0fnlNflxZAYdSPLaZUZO1i6xtqj7pS9aQMaEjsZJ/U7Mr?=
 =?us-ascii?Q?SETF7qwScu7utyF/+YMUyPQue/wch0iSMCJ0T6ocQbvE/hLXZK9M1khRPGH7?=
 =?us-ascii?Q?MZEPleaQ0nbLG+yeGs1ka0vU6A6Jq+vbssCFqjhtwa5FntQqOzD6cgBGPShE?=
 =?us-ascii?Q?YncQ4l7+Akize5nr4W3o/F6KXvEgXinf4c7wf2ffvO3EKpJRqCxuv65YiJUJ?=
 =?us-ascii?Q?rSDcUOHQFhoT5m4ph3Ec7Pkb8Ji55yJY1Z0kVxNjU8rQhnCKyoAI?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d7e3a4-775c-4ab1-7909-08decbc9b354
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:07:09.4308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/tRfNygEnOM44bMm0C/taEnNeZejt+leUSanhE4bnKjle534pfpqPB/J1BtFFfmBb3OSmg419qrKT8ZBCBzXLMS4ihfQ6LAFCoW6fymobLmw18eJVf1QZNmObLO+jf3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9637
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65058-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,renesas.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1336E692F3A

Add suspend/resume support to the ov5645 driver.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 14692d128571..ac64936bef09 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1232,6 +1232,7 @@ MODULE_DEVICE_TABLE(of, ov5645_of_match);
 
 static const struct dev_pm_ops ov5645_pm_ops = {
 	RUNTIME_PM_OPS(ov5645_set_power_off, ov5645_set_power_on, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct i2c_driver ov5645_i2c_driver = {
-- 
2.54.0


