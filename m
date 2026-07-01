Return-Path: <linux-media+bounces-66258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FaNlBadGRWqw9woAu9opvQ
	(envelope-from <linux-media+bounces-66258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:56:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DABE6F00A3
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:56:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=wMHzupaf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66258-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66258-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC33930CE9E5
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F50533F58E;
	Wed,  1 Jul 2026 16:51:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05137FF42;
	Wed,  1 Jul 2026 16:51:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924670; cv=fail; b=I0zf6gr0ur9nob3dSe4Taj3HAkFmj3m84GL6Iu3N/y/Yb72doAvUDRClhyV24ZE+A289gYgwK7UzWSkNVXkW1KUkwJwTEQmq3mZ2GvZUZpYitwxwpomBe1LIHQXgyp/Lk+UZ+NFrnmw1rWtIo7vST5hSA9d/huXMaOAFqt68DD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924670; c=relaxed/simple;
	bh=3rd0XjRgl8yf/+UoloO5UvbVN+PKYqynYEPwvo7qgfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ad7NJMQuzBWdoDBo3ieSuAVuiuLtARped4lcxW7zAzJuHdYVTXRxO5g3J6Vb80jjR1RqR6XzA73/y6s06w8VFSIp4t332rOQrAWX2ER2vQGXWJ82esDASOMim7atLA+FfuzdGNbJbxw4DLOQzJFNmFoMLEVAcyZQEJocEi9t9GQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wMHzupaf; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XF/2HGci5swOZ8sUQfApkgppFNrkVBLmMmMf9DnQ0L96C3JbPo1n3DJyIK1E/VBs0mn4NhuL25dDf8Jg+1uq2SQ1NPd1FflndPPj2quBHAknNXo9XAOeC4iJMDyZmubXwQfM3ymZZ9zunbwk6mqmfCkDwWlaMrXS9UJv5q/JHtv+vQabMFOvNH2kS8ypXhYpqW4qwZUrMIxlryrVeJBoh7wa1EQ9xFmLgrSvrg9ddRWI/cg7jysms7hYzQETcbx0LXyP4tzTjpxDYnHKd43hgtmWTm1lwsRghkRJMtVDTKOk9Z3hPcPVoJF23TbK69iCrg++J/CgjPJ43Oo1U9aFkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WHNUcVHdu5h8KRimu8aJ5jwtQGzaZVWbP4ugZob/wg=;
 b=hZNzWgk6RoK78KWBcvG7WLNI7PX+De80onzFmFiriCDmVkgTG5vWHITLZVj6zAmZmqOe6KhFW8SAQssuw3ycoloa6Zd+pS4c32kt4k1L1I1zU6YA/ye1mw+1jOZ4XK8H2RahU9tZwqHh3gy8UNUrIuIru6FOQIj99Luhkdf7zArdhmFVdsebd4OyR5ePE00o+AkC6VrZWil5j1CUpYaRJJr5M2uOM5SIzl6Mm2Z5JjRm0Y6ujvFeGnlZnqvNFohQ6m1NcH5yEzFJ0w5cdiVIXV84D6pPQw/HxBJG2QG81MVRDw+Adc16GwydecUyySM0HzzeqJ9DV/ZrYDz5OaOp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WHNUcVHdu5h8KRimu8aJ5jwtQGzaZVWbP4ugZob/wg=;
 b=wMHzupafV2pALYLcs6ZtNT0hbxKbY/dyl0Qzc455wam9lkfBihzmhWd7IWaYjo93MIAawhxFGW0RSDWCzKBFyOscND6seTS4V63C16aH1n6ZjackTzLRLpaWHiRL5RIIG4VD2CsUq1qwkpTrCy9iMgMeuf5QyrJd/WVnpT9IgEk=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS9PR01MB17534.jpnprd01.prod.outlook.com (2603:1096:604:450::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:51:02 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 16:51:02 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] media: rzg2l-cru: Align bytesperline to hardware DMA stride requirement
Date: Wed,  1 Jul 2026 18:50:01 +0200
Message-ID: <20260701165003.1495035-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701165003.1495035-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260701165003.1495035-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS9PR01MB17534:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5c3c31-0274-4373-4284-08ded790ef7d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|11063799006|22082099003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
 sI3VwzJvv9+6yRpj+nt1IB4lQ/++HaxyvrVhV7U5FdFux84ydK5mJClyd9ArlcHCTElSaOIoLaln+FehKCMC3/bbJljjlxuCKss2NXhguRTNvuJEyaTLUleLa4/E8sCYLojp9PpKjt7lOOfQ/++kaOGXAgb+Pq0cMj0p+JcJED8NC21v6cBKxjIQGCpvBKwrCXLs6TxhztdNpA+bVVLLQRTEB/CwxBQnv0lfbhV+CWCBN2EQ5i2fPtVgrxYzfbpAZ7/EDvAo3UjwOg4SF+QXatPp3C79kWfWUDMP7mwmfc9k4ww6Lc0HgBkfJ3X3dxDCO3Z52puBpzJs1yUs2stFC7BHE7E4bj6NRFmSos4CublB4Nvpfjkof+/PWQ4dumYp1RvwI77tcJhljPh8QkifJ4rAFYM64KpBs4zmZ2shYIve003bqQn1ECGsKQIJCQ+WNzJ9vXwdWEFkSJ/c9bMUpmgAiQhbsGHxBYQ09SdYSFCMR5XmjzC/uQtIH4UY2pZhc6ZbbvOPq1/TvfxRvzaUPUaElJG/fxZPedA6hrBhf8Lwae5ryQFhNfMD0DNRYMjGE0MGlu225pLtxTU970sGOjnHH+5lmA/jsf/pJsqDtMYUllCLfdmpVatG6Dy/DIw8/fokDUFlTWcVPBFBFMhf8ilb5iKAJdeQ2W1oPeoCylLlHtmrDDAavTVDZZgV6fCDgfg260gxUCOWEijju8u+aedT41KGHlXp2aBpchFr3bk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(11063799006)(22082099003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?GJ5z6TrsQJa4hlamWr9TRNIaZkumVpUpxw3cibXyuR1P2/eGdd8/vDZCLhoc?=
 =?us-ascii?Q?wyKuxF7OvRqplPlEx+MkZF83VLa5hIwRhK6FEkOuJA77n/B/F2DP962SBiO7?=
 =?us-ascii?Q?5aS34zvqfV0EhGuTh/jnGambz3ha8ALO+BU+nwnfEkcpK4NC5tYh1/sRm5ZT?=
 =?us-ascii?Q?8dtAs+061SrMEKj49B6YHSD6qEvfq0rCXF5I16BxdzmMc8RRC/LY6zrj0DcN?=
 =?us-ascii?Q?j8ZDWf0aBKLx9RleZLg/tKLly2kDNB1gQL1yiCW0Qr1gWXq7vDXBLZMhfH3e?=
 =?us-ascii?Q?hlYA0LNMneanjLUy2LY+ACQMqFKFp2KZKAlv/In1U5l1t1Ng0aznAFujh3vd?=
 =?us-ascii?Q?ewW/LD2yiVMObJeNTa6wQuDArqtz9sM2AXKxDTEGz0mbHXQWY57dlSUxNYHB?=
 =?us-ascii?Q?dSoIqbTo7/HrihLMmpZEmGA8kl0tM77+Jwb9mJvGeu34dRmOiheTYr+LDGh0?=
 =?us-ascii?Q?j0Z9TEDN9vbN6z6VmiG+nWtVQaXMDUGs/q9bOVRVImt/F8mAOxhm+P2cZfj+?=
 =?us-ascii?Q?ZQbQaaLuHLgzDKz+MMQa7U1RxCWaeai5K/X6eEFPUiF0b2dQ/NZBUH9qtoYJ?=
 =?us-ascii?Q?LdqfhDBEmoOVpGlB0ZSmCNuBoPL456vO4eZN/zTc494NEwNo5OFd6IheB0lH?=
 =?us-ascii?Q?YxEe0x7yiPjRBrRcDoLvDtqLqozlFK8dJmNMi+PrZSAURETfZlF3FgSFSo2u?=
 =?us-ascii?Q?grc1DALtb/3Xe1Xvv6PXthelSNuSk0PfFnFjx1DP8utjCK0/o4014y/supcA?=
 =?us-ascii?Q?7CGY4vMI4NjLvy4nkt52Jt3kwoFZ13bZ6njAlwpu7X6JpRgd2H9OAES00iLg?=
 =?us-ascii?Q?7LkFTjpHHWryFEO9dVEJ5CsIYkQHHl/0qA4OTdrs714YNV2tqgbp3/SQcoul?=
 =?us-ascii?Q?JRAi4jPY8cUJJZJEO364RSNOtXxvezA/6DOZpHljhOJREX+7cqHlYJMxswWf?=
 =?us-ascii?Q?jPK3zEBi8+6d28Snm9MZ+IRGZKturjx2NpB5cQibeKBzSQEO73l3njIBfxH/?=
 =?us-ascii?Q?EROr6zu4yjoC2kl+x/BBkdf32O3dWsbOcAPL+X67JLy01pu7uFR6H08GY8Q+?=
 =?us-ascii?Q?Ov72fQdJwOKet85uXQjNQyV0+WpGLb4nOB6xdr1EVNAXQFSkiG/mzBIXvlID?=
 =?us-ascii?Q?NOFRelLaEaaG2UAH+SKA8YKmSWO6VVqwdncPXpgXVKimu1N1dCuL1m9OeIZq?=
 =?us-ascii?Q?OCQf5Zu2kJxtbaYv8hbMPOjAfCJfllovf0lKZABaI51+Rtj+12Dyd2aGS6oQ?=
 =?us-ascii?Q?6ROtOjq/1q3LFWonUuf4/2IoQ7OC7l0DfML3I53cNYQAgSNoVfkmkKfpEVQn?=
 =?us-ascii?Q?yhPwFtA1/J38JByKjl2QSuIghbHxglrJjtAivQHbvC0D/1VGf90mECpvmKTk?=
 =?us-ascii?Q?a8dC6wgutDT3UT51WOjy/2mUjHY6RHPDTRvXzXln1E/qA2XIXqgvnwtivIXG?=
 =?us-ascii?Q?cWWjZg1GrPSw1dx6GXyGdBvS9NRpOGzUewr/hMgmvzrComEwcoHi7/UrTcbE?=
 =?us-ascii?Q?NuvBv90dWJknrcY0VgX4E9pfy13DGvHXl4WKPuhEtmlVo0DIGDU374DOVdZr?=
 =?us-ascii?Q?96GgyxrEqnYgI+5tWXaDrg0oLKnljh20BS9ILk+MI337NuzobiGfuzL+tiRf?=
 =?us-ascii?Q?ekkeDxCSXsriYxtlVTpcgQ8rvkNLfVUSrTuM86useIFWE/C2z8SVLOWVnSPf?=
 =?us-ascii?Q?HmH3fzMfdT8BfAPFOcxRSVVD/Iu7CwHAqf9BZwbWyXSTZS5MB6AmLUF/O0Fc?=
 =?us-ascii?Q?1xcScziIPWJC0XO5bqES+5eYeg8YGQ0zR9CpUmRxFLBQGJmo0bnQ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5c3c31-0274-4373-4284-08ded790ef7d
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:51:02.7334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+RGkthfiRB6oQGQo5oYZHTPIxwAgPzi0MrZvrZq0TgxRTU3HF+xGmMQDR7Ic6pGhBV3FPNqP0HZDwowg6Xyp8czJ3azFVYURkssAP03qQl/npM9dznVdg+6kGhrK/mk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17534
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66258-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mehdi.djait@linux.intel.com,m:s.pueschel@pengutronix.de,m:nas.chung@chipsnmedia.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:stable@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DABE6F00A3

The RZ/G3E CRU programs the line stride via the AMnIS register, whose
IS field encodes the value in units of 128 bytes. If bytesperline is
not a multiple of 128, the division truncates and the hardware uses a
wrong stride, causing horizontal banding.

Commit ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")
replaced the open-coded aligned calculation with v4l2_fill_pixfmt(),
which sets no alignment, reintroducing the issue.

Switch to v4l2_fill_pixfmt_aligned() with RZG2L_CRU_STRIDE_ALIGN when
info->has_stride is set. RZ/G2L has no AMnIS register and keeps using
v4l2_fill_pixfmt() unchanged.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: stable@vger.kernel.org
Fixes: ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected tag
 - Add missing Cc stable
 - Fix s/commit/Commit/ into commit body

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 69346a585f9f..478264f26466 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -860,7 +860,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
 			      &pix->height, 240, info->max_height, 0, 0);
 
-	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
+	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
+				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
 		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
-- 
2.54.0


