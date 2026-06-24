Return-Path: <linux-media+bounces-65531-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uahBHdG0O2p7bggAu9opvQ
	(envelope-from <linux-media+bounces-65531-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:43:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C791D6BD74B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:43:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=XqpICbBs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65531-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65531-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5D85304EBA5
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED622C2349;
	Wed, 24 Jun 2026 10:42:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7F41DFDA1;
	Wed, 24 Jun 2026 10:42:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297766; cv=fail; b=qy6hK0s4c4tQf0s+Um75aTXUCBuDyFradtK1VeEAy6N2WBs8gG8iC2P1fb59d9D0mSmcEHR0Dmh0P3Cxu44fuyCsa9/EokbGcbepNVERuCW+Obfg6rxafQgdnKA9sTZiQBt0BTB8YwOkho5NHQZPCkj9Wu9JVoS71mENu0lIXHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297766; c=relaxed/simple;
	bh=s5wq0VYSMqo8Kmfr961wyOfYBdhfu/EKYP0mUpUjLXI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Fet7GDLSb2SaEtg62tB24llO4ktyfGc4jgfjQTEz1zsesraExhUure4i3m+Ioz1sJFYgZHKIP82fUmMh2bamylrR7KRRcnOjigs/ITLhKzPUU1GbDMqKH07OVIRnIrT4nxsQ8Y/KWs+wpIgMzEhSbH2spuBNmvwf0Isp3EOPgAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XqpICbBs; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wiyjvu2e2uPCbewSffYIKMW7TTZ4GMKZNgrw+xzxpKXfsJvt2NmO8sChBrKYqv/9uK7Ylk8gM+1YG+LPu7cIVTfNFHEyDGdMFRrs9aSamBrvCHfeF9C69nqCPD9qM6S8/VFj+b5NexRLRRAdhCWSJTQktOLOOTajyKUuzkzUONBDssJErBwra160VhGOtpVSviXuaBmT3OygdTBAe7JFCKfPvK6O07yQFroBDGn6lYm6M246s1WLwjqZS7ojYeEh2SGqOoHcZMYxxE2DPLk0c8rhjjOs/BbdF2jHhsdEn9JVJyXjt9RZBa9EuNZ4XCK9PO3RaL5LhRW4TS7f1XJWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+d/VVDK+WBdTQWxMZYQ4Gdtw+jtiWWmb7EAedMiyGLA=;
 b=Lr4lxobSy91HrIoXOEJOucohYZN7P4ZqYSVuOQkqyIW3lOCLEdOgx9fUE34a38nQZWlk8Aiyb/aZkVMAr9t0ekDWQQ1QLGpAwLxPrbxYfuXdYR+6k061sfBj/y3xXdhEgaJ1U0e8R+FxcRUvC6xbA5k69494aQC7GkZVfaPA+3YOvb8Vmk6zM6dJz92Bud+YAGSF2DcCJCvaxU/6aNgY/op7+s/vjo+qnIdCfgjh5+KVTmgt9Nw4Ey6WNzc+fYjAWjNnmA6nBgh9wTe09jJI0xKFaV2snDU2QBvVmiWINKJCTxJsyXy7oCvyQCMFXWfghJciF/Wz0B02fvF55dFUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+d/VVDK+WBdTQWxMZYQ4Gdtw+jtiWWmb7EAedMiyGLA=;
 b=XqpICbBsptmB9HROi4+q7xthoNE/tWlbpLkDR5lFDxRdD4rWTnLDNsiOzPOLwsUQW17QH4G+pyZxf6b5lfJpwozk7yTJqoNKDH142WYdkucYbs4PQEcHxcsgFVpQn1N/i8pmIzDLHxhRNlC3hBkWVW+wBwgvLqth7+gYrtlvpmA=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYRPR01MB14159.jpnprd01.prod.outlook.com (2603:1096:405:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 10:42:41 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 10:42:41 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2]  media: rzg2l-cru: Fix DMA stride alignment
Date: Wed, 24 Jun 2026 12:41:29 +0200
Message-ID: <20260624104153.798953-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYRPR01MB14159:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc1289b-b249-4578-de75-08ded1dd514d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|52116014|18002099003|38350700014|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 m9nSurcOnui0nU/XLzpg7JnD0o2p+hCyLynDiiIxpgpu0/867lw9KiwHklegF0Gu8sSBSllTs15W+hwgOq7yRlC+9VqsXWJ5aQIGxMpEIUiYBTyYWrSZ50K4Knjzo0WFtrVmGgH/BL1ZTalHDguLdT2odT17tkUAke1xOTXy24okEHqbDoQD4PQNK2Oybh8SDbQfezr3LwrXj8QFz+HrKzOeb8WcWQAviRAhuDCjfW66bj8EyDN4f8CBBATawj9ZQitDWPZI0ykjsF4H7isDfycKsxsWB8jSu5uwGMgJ0hK+GiVD5Z5Ox4f2W+ap2+dZX7c0d6zqV3JF+XR5INvR1+88WmrCtymdc/XcfreGWBeWLD/1IvYUWTtx8b+x2x6OHilJt4UuexbSZQ7YmRQ3D5LLpMrg32qiNcf4/QLlqsOm1NbByyFVjnS5iVwfD5j6mnhIlkr5WiSpU4w2TsBVFhy4Zwt+CCs2mhXqZVVNsQ3EpLNOMrHO+WDwIN/BFj4Id2xwjLOtyhTUVDIXcmKvCbfxhnLKZl1P9zuYS0HeE5LWtd0PQ9FQyKDfySoF47CG1hf426OA3pCyyFkEfELWGQ2gcuHqIpSsGdDs5GSUaNC2FwjZliO/vOyE4+rAE8XefJDdY/GIl0wxMLsu8j9/K3uJa0ra7YF8xJSr6yegs4O6JRLCp1Sj1tw9vk9uTYNZzRLxz9BYYxEyv8+HF7n4oUqLdEIpvRatls3X/r7rXM0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(52116014)(18002099003)(38350700014)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FY5I+KsaEcbErWgy4xcfsxcHY3uXGT8l2QXhK9HxXdgCydQUKLUnqBPVcH8C?=
 =?us-ascii?Q?RA8E0ecdZgFVUrFQmWWnwMHrlazhrsTzHMhMiey88cOs2yi2kGOWvY41MfXr?=
 =?us-ascii?Q?DX4Qpt0KMimu23N27EJ+uV2imy7uct1b0eSZh6sW8+Fgg+vclBpbKN5RRmGG?=
 =?us-ascii?Q?TVEvBPJLFGJ73De4jgOwoK2kgu7XSjKc/AEd/OtKw9IcvyXX8UEVGAeXtmiW?=
 =?us-ascii?Q?ElpYggpag1KLEBeGoNPlQBZ8f+gXrJJexDfEhCEHY8KzTqFr7hBh/1YG5Dly?=
 =?us-ascii?Q?oG6+sM2W0L75D4jK/ZDUDYVa/xPh26OVlz5JpnfUKtMZaFBYmKXz/o6XlXcx?=
 =?us-ascii?Q?sbE94y/4cBFOdzZfaSO4RlrNsVATiGrJI4M9TESJWwLiz6VkDcAfGKpAjmzd?=
 =?us-ascii?Q?8eNxsKWkFSAIxsTLIofqJZTRsasDmkmolxAILIncyUsnzQb/MlUoRsC+5qTB?=
 =?us-ascii?Q?qnQImaPPofyReT8SLbtq2Ovfuvrk0d3/WlJz+AWyvrUbxY7VQJTW/P3wluEC?=
 =?us-ascii?Q?Zhq9FebdH15ALboM4dc4ITxMAzcMWptZqVFoyBh3b9vYrPgqvg2ikQMag/m0?=
 =?us-ascii?Q?Yos1I5yjlTtqrU+n++/pVSDN30xLpKdErQLe4HmaNspjXox/hb/Hps1DlnTq?=
 =?us-ascii?Q?8S7w89FVrp7AQxmhT5xbGFRzBK3ZKaSuhxt+CsAptWQfviM6qheAb2EYW8+H?=
 =?us-ascii?Q?2rf3CyAt3oT7O0wZYOWbaESNHRGzYMABYHlHjVX1DZ2tR62nQimuuwctE9XE?=
 =?us-ascii?Q?8GCpggotyBkh/VUsWMJbJ5wfNRiI6/bXruojgetiDwV+pDnaAjTvIollMbv2?=
 =?us-ascii?Q?eaVAD4bF9toe849RQxyWfrJ+DT+8xFJhljODn8WpAe/cBG92mDtyIJ2mrQkF?=
 =?us-ascii?Q?1eSGQa8DnUGGnaN4ADGUoFfnKrHhEWhIM3+XcxwRCl42qpOwR0zDcyx2gfj9?=
 =?us-ascii?Q?8fTASF8nHOLDIyauGo4MPfu14fiidGvmIBQhlFF3A+eJLi4qWlFHtqDAR0LR?=
 =?us-ascii?Q?UDuF8wk1KOczdAr9sxzoHY5ntceimkcTx9jlm9PYJht3czqos5ec21/91zSM?=
 =?us-ascii?Q?oJeZSqIYJwnwlp7KSfeoOHh072695GzZACIDsvwbzB4olVzDo6ZnuDgCzGJV?=
 =?us-ascii?Q?2ST/jIxyTwKpN1ScyBX79tiGen7kU4PKwi2Ji/XixWIu7mu1PCn83M2PAYFG?=
 =?us-ascii?Q?/g/5TQg00BQhp9NYNDPOygZBYBb/XofV+wOAriyYyrxm80hgscuClQcqLece?=
 =?us-ascii?Q?qv0fHyFMbzGyByt3SX4ScnjU8qTLZ5ZImzv0nJqjUpgPzW0QoQtJWhjfRPjK?=
 =?us-ascii?Q?MmcIjM0FelbFeWHohBfOO9T01bojiu3jYgk+J98v2ZDIbZmVhOgQcgF9pU0U?=
 =?us-ascii?Q?sKKZHpVHZVoV9XW+e/iXDKbuzATkskgbnfXa3niAzukQJiSnMjY2uov/pJfm?=
 =?us-ascii?Q?1kMp/jWlgaWB7p30HeFAx9Zuby4JPQziZu2knTGhHMJyqse+FKnoeJS0Vqly?=
 =?us-ascii?Q?7rE3LG9/5PbX+Vx9zvWVIg0dJ9lgL/orJlwtlGsI6Xb8ITkrCxzRL+YwwekY?=
 =?us-ascii?Q?h1FOKuYnsxsmM0b4+6BxGbVrFHNfW6CoX32j17BHP5OKw0sFXHXOaGyQ5Ngs?=
 =?us-ascii?Q?LSSCatnzJr1mRWUKa4yuFFfxqiDffr3qPVo6aDamacMlxDjuH/MQyQuQCn7+?=
 =?us-ascii?Q?hokaVWM/cKTxLfgkNPLqeKwUczgRdgb8SFi8z/3PA0si3NRyvNVnif6vTBEx?=
 =?us-ascii?Q?QJFfMxtA6Ny5hz2UAthtvVDPwmRU8A4PhvKzuxOYqXtqMRkt7etE?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc1289b-b249-4578-de75-08ded1dd514d
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:42:41.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /aFRPNLToXG9P1Q2XbxjGpM0D8yNFreCRt/GWpp/4qqi71Fnzr4m92ocK0VejHNcR5S+Bc9zYp+mBCUqhelaYHeAYOwnspIiYbdsPoiB+bwrTHarAsczoVIYcDjskflb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65531-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:s.pueschel@pengutronix.de,m:mehdi.djait@linux.intel.com,m:paul@crapouillou.net,m:isaac.scott@ideasonboard.com,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C791D6BD74B

Dear All,

While testing ov5645 + RZ/G3E we found out that the UYVY8_2X8/2592x1944
is broken. The issue is that the CRU DMA engine requires the line stride
to be a multiple of 128 bytes (RZG2L_CRU_STRIDE_ALIGN). v4l2_fill_pixfmt()
sets bytesperline as width * bytes_per_pixel with no alignment, so for
widths whose natural stride is not 128-byte aligned the hardware silently
rounds up, causing a mismatch that produces visible horizontal banding in
the captured image.

Tested using:

media-ctl -d /dev/media0 --set-v4l2 '"ov5645 0-003c":0[fmt:UYVY8_2X8/2592x1944 field:none]'
media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:UYVY8_2X8/2592x1944]'
media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:UYVY8_2X8/2592x1944]'

v4l2-ctl -d /dev/video0 --verbose --set-fmt-video=width=2592,height=1944,pixelformat=UYVY --stream-mmap --stream-count=100 --stream-to=./frame.raw
gst-launch-1.0 v4l2src device=/dev/video0 blocksize=76800 io-mode=dmabuf num-buffers=200 ! video/x-raw,format=UYVY,width=2592,height=1944 !  videoconvert ! queue ! waylandsink sync=false

This patch fix the issue.

Kind Regards,
Tommaso

Tommaso Merciai (2):
  media: v4l2-common: add v4l2_fill_pixfmt_aligned() helper
  media: rzg2l-cru: Align bytesperline to hardware DMA stride
    requirement

 .../platform/renesas/rzg2l-cru/rzg2l-video.c    |  3 ++-
 drivers/media/v4l2-core/v4l2-common.c           | 17 +++++++++++++----
 include/media/v4l2-common.h                     |  3 +++
 3 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.54.0


