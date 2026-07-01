Return-Path: <linux-media+bounces-66254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NeBcLEpGRWqP9woAu9opvQ
	(envelope-from <linux-media+bounces-66254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:54:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5556F0066
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:54:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=GrBnF6Fv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66254-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66254-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAD0C309F9FC
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC4E374E71;
	Wed,  1 Jul 2026 16:50:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76A53793BD;
	Wed,  1 Jul 2026 16:50:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924640; cv=fail; b=B5AD2ktSZ6gycA2ncf+9OX0FB7a9M5uJF2DwpQ+w+LEc6b6ywfz3Uv+knDdNJqafc16V8lDJdKQ8DQKYgMDpX8Y2JtNtfdrpcfpufBOxZN9IHyPERgdDz193Xwe4V86SIk0k/DwyAUxkmgejHjnHh4UK83yygtzD0Obh5fZOB7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924640; c=relaxed/simple;
	bh=WgRvlQQLutwFjSC9tuUY8Fc125jTd+SX60xJpG/Vczg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=eDUL6StRBzMbQHfF9iXvc0jiVKwh2611aRrfSCLrPxIl84qIMttUAUBTyVAd/i+0bICCo+aUSi57Vx5uhVpUTeKUUL2eMog1onwoeWhAWK9JSKWoeImIIn7mhnubxO/+iVdkvlmMrtoHk+OH9ChEpLY3Hy9OQbcqdlKaSI3e4Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GrBnF6Fv; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alZzpEBbXQk1GAEVl9tF6jYhUqLyznq7APGbjgYgqdWKSDRYQwSPKDwY/rN0HSJf3ZohAmNyyou69vcRNbP0pikp4X6EJzXACzDvHesge4mGkRVRdmyR9R6rTLXcQPMqBwgqA0VZCJCH5HoHGIpAZfGy8ml48skq/S9v9s3NBSn0pcdQsoy7FO12LaprMnCEaDOLkSbyocMYrWLls52ukbBk0SEyTPTtoQ0njd5rBPDTVVSnMhoP6ZKXAMPYMMHpBd7ckIE7bH2UwjDOYmm834t3K1dN4Eb5Tc2WH5lmbb8tc23cDGHHMW7MwZe6qhvOvBdKNqpw6IHNt70AO8DLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmmZgBebNbBLP4bTwdH4jdz5XWU23zzSTn03i9llYGE=;
 b=mDHeaRkFK5NPQ/BGb82hzxXYFcFR6+Vq8B1hf/bHHDyRbcpxqE/O6owrUGN9GVUeBXBXo3xmwVDfqzScep9mEWzmK9UvXoKYm4Pz1Hr1kAKOVoqfjR151WWU3Zc5YI1xIJhjhFIvwuCncAbZC7EjIY16iuOHFbxwDeRyd6ZeHlgSR6uIwQbtwtzstqJE5Nxt2vp+Ko3r0wPx997JZOYswVF3BxVoxP9v84UYCI5db2VQJuC3t/Un2NqITPXMrm/Z7LQTJBku9jpYBHstoAMgrrdQQgLZgFIB3Mke6vYNOt5jjxAieuqj0beg1ocg4unE1E3tBrcnEHUgA/bZjfFNQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmmZgBebNbBLP4bTwdH4jdz5XWU23zzSTn03i9llYGE=;
 b=GrBnF6FvNrgYyJ29qwLyOehHMjiV+55Iv0YC8KOtgpDGfeYrxg0PE74igfzp6qzg2Y8lv4s2Ja9b24Qx4XL18MZ8Sl0JGu7TU14Pqx7eE9psULFZa2tJEkfdl8gu6SpEsb+DwKAWEGRPGuITILxr+Gaig0ls1V1pbQl/kPM6BkI=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS9PR01MB17534.jpnprd01.prod.outlook.com (2603:1096:604:450::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:50:34 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 16:50:34 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] media: rzg2l-cru: Fix DMA stride alignment
Date: Wed,  1 Jul 2026 18:49:57 +0200
Message-ID: <20260701165003.1495035-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-Office365-Filtering-Correlation-Id: 8de1be60-78a2-45ec-1f46-08ded790de6a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|11063799006|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
 nJYa6mGkAXa370w5rKOkvLHLCNL0BjRDTJXhX96uH9d0VHnI/NrkomlxVSTHl1UdmhUzj81ZEr2YjZGfxy3UczCld2pnwKKV+sIFsHmavQj06mzVzekhFAY9ZsoOcK2ELKg1djDqSaWlPF4czV50ffOP1MrweDiS5Yb/7HpqaeNzPN8qrzwsOT+W4q0Q71pVgGsizygJ7Sx/yuEIeuY8fp2jPz5gqY2YpF7F8jZLTmC8YcV/d9V1OPO6RzuosXtyvFQTQRIYmI+2gpIzJEISyd9+krvRYutkbjr6uxx1iZCZJ+8UfhX6gSyvjV3Ts3sEfYgjCdw8GvP78ArEdcuxwGOwWJOGvHpbS4kmf/jaKU6Af+ENxaODFFi/6pIDwcD/psdQEj3Z1iUa/ABC1FcZnwuBnPNPBTe2c2ySbk/eLML+O2etcGmkkrSMAR1nYicPVkxp9pzVYtzhEErvTMJLd1ji1deGcY0OlBz5ZxLnwfkUQOYkX6smgq6UVqEYqnojcfG46GZoCoViEZ3UQ39vW7F2pA2owMclI01mujroowRE2iFeXCPhvXu4wY43JbvZVVro4aPGWMrV+6/edxhRHXi5IOyoKqs3BGWR6omyEcgaEw0QUGrGjo9o+2yqVm3w3SBNQGhUiq/cJUME+PcpxvN8Z9FPBQm2Oj3sdp4rBVoz0Er/hbFm39BoT+0pX7zWR9XhU23bK/kvPF0RH2VCxlMHIrg7HaADePHx2JYqYXc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(11063799006)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?WDwlQICylRjnvKCV8Fzy9VmS/G+nvxZzgLtvl+mEVRectqqfd+tTTC2NeTKn?=
 =?us-ascii?Q?4OCNaIuqYQI8iXQ5RJdTs29ZY9KP0TnveMIMQoIDQkbycOtRVkeFK7MexqgU?=
 =?us-ascii?Q?b+ZIRGRIKysgbZB/sJU4l1XiIMga35V9slAn/02ls+N4KfdVZq37ReyBJbg7?=
 =?us-ascii?Q?Ow3jysgm1BBFdoZHXsdT9jwkQLlmM6EbPwL/qYuuls5Pl38q/yVrQ+/ARglq?=
 =?us-ascii?Q?uOAO9fTcqssR0QDNfInK0hzK4AK5JHXvnYQzjD3Jw2eq5R6t5jTGI0ozzN8k?=
 =?us-ascii?Q?/IuCcnGlD49zNkVExr9d9FgBqM9WaweVb1GqWeOr+QBk6t+zvtQ8JWBCNJRK?=
 =?us-ascii?Q?hQ2hgyK4QXqrgUA+WdcqaGNUSw3u1GeqdhSCfZELqE2eiev+bnpjp/+4sATR?=
 =?us-ascii?Q?rDIdyUmQSe5aIi1Vf2IPx6Qh1376zh8dM0iD02CAxAlVJc87tYKxftCzqZC+?=
 =?us-ascii?Q?aUizSYWiHNJiBVcciXeedZGtXWb1lW4n+SvGipqn0DbaUWZtZyare4x/T+bd?=
 =?us-ascii?Q?LNMhWKRpTjbUDVsydj9OBDctmBLiNWcuCC2Iz9qXudcTSgggRRo6DGm+V0XP?=
 =?us-ascii?Q?XsqQA/aM7XnqQpaJuhuCmlLpg6IUkvhAuLumCffGz7k3XfShc3opSRz+oMim?=
 =?us-ascii?Q?IMi/eWAhp9l0IdmBy8CVGWhW5YqkRKjO3Onlr98BvF/gmHLZRKSOP2wTqhsg?=
 =?us-ascii?Q?TZ7IfAPIZw+Z0Y4UbI2Q1bqPrF3YppRN9AmB6RZKYuLKe4YQcEiIpgr9Icvv?=
 =?us-ascii?Q?+mB5SemgIlKhfCAZiqKKjT1k/L90WirR0jB+98sNmnEEOj9ZqZ8pW4MW/qjK?=
 =?us-ascii?Q?x6sQ1zhrtPWcwkxxVNYFfFAmRXBYFSke81qNTqySYus71RZsjH5f9Bul6Q7S?=
 =?us-ascii?Q?RYfSFuhg+PWHoHfZPsr4aKfNUOzy8pnTjtHcb1ejj4cXJUv9z5JS8xBnTkZF?=
 =?us-ascii?Q?wZMI+UBULPKFwt8Hk1OAeJatsUKyAhsmXHcc1/EjfIRiUj6DMG1s9J9L5tpn?=
 =?us-ascii?Q?a9H/a2Xbb+QJsWaHcexSkIYQPwnTuSMLOxLeHHZx5JYsX/6AIZDWL4qN4V11?=
 =?us-ascii?Q?1fEERtm6ePjwKdB+LUPYPY9OjstbFc0dsbq08yoYMizuJTkK4EdRt7WIZdBD?=
 =?us-ascii?Q?5nmgXKl2EIs3vQPGjyaV3t0Bw8j/LLd9nPIAviSQs/DWIqjYPdk52oHx+BpH?=
 =?us-ascii?Q?vFJWhIKJGTwq3BUnQdVrgrgd2VmzqDXpxOFd1LH6Ss22v548Z6vj/ZBxJaav?=
 =?us-ascii?Q?tWTEGQpFmwxNK0J/d8WkbWv1kiLKT1Gwdbr/6y4WBKdv4DerxWf9XyURaKoN?=
 =?us-ascii?Q?rjwcKv+7BIqB1Nsd1Ah8msEwvlVRF702/pO6n6v+8ok9FmTO6yzPchybT311?=
 =?us-ascii?Q?aZGrXG0ZxlMUceyB8hyomPUl0iTwBbM/4cfqA4vFJ/aX3rDllOKSTSRjTu14?=
 =?us-ascii?Q?jON1EH+iFYe0wJE/253B+6K0shLcyzeXXvJyrzj4SnUz4j5pr8k0RRq8hj3n?=
 =?us-ascii?Q?1prjAB0jvtp/xBmgOnJNLSIvUBzEXCBzTcnaHrpuUdhT5LZbmPS5xdCTPPei?=
 =?us-ascii?Q?Ntd8jvxt7WSMTCRH1mwX/iLVsz4E+Hgy5JCtXTM5oR+GRYno1tB4CtKd4zJ2?=
 =?us-ascii?Q?+fSL/DhVSXw4m2dn0xp5/3N/9PbtgKpFHDiFCfx3fFsG9arGR5IZjFij5nb2?=
 =?us-ascii?Q?ckLbJE0tOpnK3hNW+V3slQ/5jeMqvz2ZcBPKAR0lP3OS8isqDPjbeFQo5Zoj?=
 =?us-ascii?Q?0y0TrmLEMfFZXXh3keZ/SmINJnD/5XUQu8H9IR6Fpc5FpeIroGnO?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de1be60-78a2-45ec-1f46-08ded790de6a
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:50:34.1222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QiI0BzFORBblCySLaXHdnhvaNurH3WoAXefdod2xziqLGpvtJw+9nU/dWzTVzHnbbij+Wl2IzLA8kDKkb1n9+O1mmwYsvQF5axvya9LkfRgNQ5y5rZfVLXoSL1Bt7gf2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17534
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66254-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mehdi.djait@linux.intel.com,m:s.pueschel@pengutronix.de,m:nas.chung@chipsnmedia.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D5556F0066

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

v1->v2:
 - PATCH 3/4: Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
   Add v4l2_fill_pixfmt_aligned() helper documentation.
 - PATCH 4/4: Collected tag, add missing Cc stable, fix s/commit/Commit/
   into commit body.

Tommaso Merciai (4):
  media: v4l2-common: Convert v4l2_fill_pixfmt_mp() to static inline
    wrapper
  media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
  media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
  media: rzg2l-cru: Align bytesperline to hardware DMA stride
    requirement

 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  3 +-
 drivers/media/v4l2-core/v4l2-common.c         | 20 ++---
 include/media/v4l2-common.h                   | 74 +++++++++++++++++--
 3 files changed, 78 insertions(+), 19 deletions(-)

-- 
2.54.0


