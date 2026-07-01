Return-Path: <linux-media+bounces-66257-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oT3GF4hGRWqp9woAu9opvQ
	(envelope-from <linux-media+bounces-66257-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:55:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C64D46F0091
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:55:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=FJnXLcK2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66257-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66257-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A20FD304B7F2
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252D637FF63;
	Wed,  1 Jul 2026 16:51:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011015.outbound.protection.outlook.com [40.107.74.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B28379C38;
	Wed,  1 Jul 2026 16:50:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924663; cv=fail; b=kWkAEfQ1StOCm8QqPKqcNL4C6eyjF0gDlzWYY133dTMywZo4iTMMOX3dMrx/Tznwow1GHKpD8x7MmaYSan/uxb0NU5cVZcsbJavInK0rpYqlJnx9irCeLhxmkhvOsLAtUHlHvSbPoDsxB0BYNcF3HbhUGzbN3Q54BaxD15eAKxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924663; c=relaxed/simple;
	bh=j+udvX/HqcuiI1qNmffpYambosg5Z21oJhueozq//S4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VglIGjH34ozNEV8TqUsjoe+Gay5Y/nTaGrKtp5WNuf/JjRfp7iTOg+LMt7nlhXGce96lxJeA+/2V0LWdq4QVbSA9QgAUQk7q9r/+pyVqFh/Fnfhbqsjl8DMdtyiFSR31qEu8EetlIEkGCnUyigKtYDDpQthw3NAdX2rmRozsohE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FJnXLcK2; arc=fail smtp.client-ip=40.107.74.15
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsHbwZcRxge2ka15adjp1nwxxxO5bV5/TaBtKYqRrNpL8Buflla0ZUptKRFu4Xe/7cwLsfUs51J1dn72Fahpq7ZsgkisadWWGaZYWTvuQKJaZ+d2vWSwSuFN7+Xj06PaHkJ6Ic7ExZO7aA8Rmz1L4VaE7U9uQ7ZPKMuAwf6MBGB5pC1/N1xMowOcHc3hZg9rru/G/BD8zQxGxuqWsaIQUbojszT0MNP8B1FR6vp2XQyBuVmMr2Iw2VOyEz69ojE52ubwBT247hqe/6G9IJ97KqUqcJQcvaljQINRTzf764JwltmxUzcvREHzwsKJtobAsasLiNbE7RHk3iWIiVXxNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rq8fD6DRC20rdvIRZ6qXDxWR5A0fN4ok48ZjWcro2Ws=;
 b=MPa9FpPSNcCZ2plD5hAFAGhDr8jh6E6FHm4rFMuc9yGAwpBfQZJWXxHM/wUxJbluwWu74wPZrCgDVl5weFyVTqoXWwtFGh8cq1hSINaB6HHZS6zB5iYhnp8XVwnJ7xydRs5KKIK53X6KmDcbOZtcavdbvFd8WvvlCJrXuWGp3EwzeNEaVFLupRyFC/7UFoSn1AybCgI4+GppUWJweKvBpN558GTj3Vol9wmm8F/ON8PrL8tn3qwJkwM5dSGOSCwKjf9jCWFJJ0EejKBcwFpyNRXESWHto1JFM8UivSxrPMs7sN7JQ40bJTftCFmLwFHpYV256IF4UAN5qedrbTaMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rq8fD6DRC20rdvIRZ6qXDxWR5A0fN4ok48ZjWcro2Ws=;
 b=FJnXLcK26AoOgvC9zB/RLZrg8TCSSDMprGGhqQ0YRnRDt1TcbFKCGlDTWGkIufcA1Ih/ajiyqKLNNXH6HuI5ppo6Ipytq1Pe60LcB8fa1hA8YUuiev8scfFthot0JvQW7cWCif5Mfi5SWGLSatWQBaosNz8XKSC2SZKm5PPzP2w=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS9PR01MB17534.jpnprd01.prod.outlook.com (2603:1096:604:450::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:50:55 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 16:50:55 +0000
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
Subject: [PATCH v2 3/4] media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
Date: Wed,  1 Jul 2026 18:50:00 +0200
Message-ID: <20260701165003.1495035-4-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 65ef7920-9e47-47f1-0ddb-08ded790eaf1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|11063799006|3023799007|22082099003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
 89J7V5C2dXsGWzVeC/mDqr8ubDI2ZpHFpHl5d7nAuzgfcBWSwNW2nYshQIvl9HN1AUfQ57n5EmEJpXPNfmcXexE1frtFyKQyIoN8VMDCHXjz5okBw0Zx5n8Gi1F9eB+AJudNKJOv30jROCs3cbGdGKREmeMBs14Cuj7VGWb5UVcyKat1PRdqM3n/qU4DlN43XwjqL3r9gFH3WW7Yu7kmutjMl6Un1UCZM8hXLtCe6lxqQdXXuiK64BbTD0IhFFJHZFFfS5OgcaKpyzRobZsMyZnfUOG0c6a8yN6vMJb19Kh0tNIo3E6bVw0WnY0u7wa9jVYmhx8XvfCfvqZc2jGnhh49kaHmM0zrdk+ylGwpOaRvA+ijmfIJXSA6qbzUGNQgc1NdYpzdepx03uBQcT6g6la3/2Zi7XrRsW1WXHbEhkv/FZME88bZ/wEJfFVW7yEEQn9XzcdB5x3foQnjodYBp22n+Noob1wSK+hgANw/h/74U2k457HVK2a+yqkpPzbgj5HX8/D2Y60ecBsULSyA/DYMAHIw3r3Umc40yGeEKQLQtmxVukOFVjdQ4OBqj6YL+KaMIXpx4GR4FPmlUK+ujsT/Ve2VR9wqyXJAiXyPYebWrW5HPTGpY/Ixxbd6QM0xHauUK0unSnpklwvDWsjV/dn789vy7a9F/xZcm3+x9remcBvomkUgsgPfhgbXg7RGM+Z97E34O4Z/52t96Zj9DWb/1lvS8s69D7KP1zIzqdQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(11063799006)(3023799007)(22082099003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Ton+fKZKsbilHyBVgC36riTvA+TX7t0V3nn0mHuO/40+I+LOWW7xFtiam1od?=
 =?us-ascii?Q?8rhxXF/IQGetbRqkubQoiYj1tU+h7pVAE0eaEaBfFJpFoQgsT0DUaU2ir/An?=
 =?us-ascii?Q?3CAcpscZoB33mZA6Oh9+kuyDgU89fbYVePOAnrMKa5xH84nqGubfRsD+AGlX?=
 =?us-ascii?Q?TocEXznlKxnDNJCgov1HGm8v1IcL98YQqbHqWJ9Q/LD4gie0DX3/ATk4IYah?=
 =?us-ascii?Q?mQ3hscovGnok0Sn+4mxobt0jNxsTRZg113tVYoe63PjD318JJPH86o7OrySt?=
 =?us-ascii?Q?AeVKA95RctF5rO+hv7N51DIAxsmdOllom7Yc4qdmnTnmnhynOCpQ0pSMpUR5?=
 =?us-ascii?Q?AHVJl3gF5Lfaj1gUZ1SBLyS4aOnYWpOez/XIyohDO/yZnzG7RDsLWtvXY3DS?=
 =?us-ascii?Q?OcmiOyDVDdO57RJqkmmB2BtppLjr2bz5mJenx1D3+a1LFTEpV+r/3OIHJu7r?=
 =?us-ascii?Q?SbrR2r+ld7zYz9X71N90A23FdtaEpwq+EPuDdEvrDgGX2OfvsjS6+wx8Oy13?=
 =?us-ascii?Q?gcYl7vX0WodZQajrwfCgviYeLrXRRRcZN4gYZSkJQUVXcWaC/eY2MDaZYwxb?=
 =?us-ascii?Q?utcgPdDCDuP0CvRb3edPAn3rPkcaSemPqIUARAqE7Kom1UjBiRezqGF+T/df?=
 =?us-ascii?Q?nXdqgLtpZRVFvtUBQh6uVcfB0MR+UPyMr8OprpcmCSZ2zgvrVcJlEWrEuHq7?=
 =?us-ascii?Q?HL6/qKr/6oySJ2zPMaJdivcwqSEKqgzXCieF9NyIp7fvgSg5hjHfMZb2q+lV?=
 =?us-ascii?Q?7H04bBywra81ABBzlzzT23lVYlTldRzdNVbFv1yZHRYNN97XvhwkspAJVPLm?=
 =?us-ascii?Q?oSksZTILToUeHzXav7jtEaHhiKtzSTipe8xbcpcf9rH96ZnqTUlDrq5HH3K4?=
 =?us-ascii?Q?/xEVY8Kfquh98vLQHWrVZU03wCpfoAYQae3p8KRnoXHsoNsyfcIEJVNCNcPF?=
 =?us-ascii?Q?ZA4pYqIfGsmlVT2++6xjnr7kqgnY/uaQwIs8l70dLcbYo/vHBcWVNEiA49RH?=
 =?us-ascii?Q?e46fXBz181ufaYixOID+Uqi/8nGOAz8SrOrPnS3kwU5yzCZ78btlYU1h4qrZ?=
 =?us-ascii?Q?HUhq05jjC/Kpa7AgK6W13PtYcKCuTqEs0r5G86SsD0awInFffeiscw+rW2Iu?=
 =?us-ascii?Q?wYOwvbt+lQFxf/phKfzGpR0z2n0X5ERURU5lchH6AgWFaqYNKSItg4qFEf7P?=
 =?us-ascii?Q?GVRAYMTZT8SiCKlc0u6L/hi3BYfsBbhhmKD8o3AH7wi8PQDWjcfc7NuZzCy4?=
 =?us-ascii?Q?Q66o5zQdwkbyZjbCNl5Bse/Ppxs8kDx5wh6hRLrXgpowNQPCA3mvQFsY2Ms+?=
 =?us-ascii?Q?vsr71mFftCHyJPQJ2GkGAjHBKq/g+KKzv9DPgMHUw7LZbY4XQ7CAl16yOO7T?=
 =?us-ascii?Q?QuVOplDUuTKZ6K9a4vt1J/1RvuBeW4EHBB3ayto81NRJLBAqwO8BALbk839R?=
 =?us-ascii?Q?GUlErYAHagNlEI5HYr7Jt/TMJrSBv1GH1TH7+VWGabLGjtichPZTMUXBnDJQ?=
 =?us-ascii?Q?Lpz0dhhPGKrhufCmPexPupPdurlfTfLwlR4M8ZR22EK7SVh0G8u45TcakZEQ?=
 =?us-ascii?Q?KMul+IgSj0syqn6QyFRqrZOtQ2AE5Y7yAstD0v3d6HasCx94mivaX0B8AMgZ?=
 =?us-ascii?Q?O8zfjV14KIM1O+TkgNLo9ky1VRfixCgIx+Itr9ui0kubfrpCW3GDM4lVuq35?=
 =?us-ascii?Q?5ZZ25QXfQDtvE7s1QaaVvU7UbhuKvsmVrH092pn+3ixKXEIaPWqAmGKtRunS?=
 =?us-ascii?Q?P0edHP1dVtAUJB6CYPg5+yumyRp53yJlNiZRJM2sk61b9ZBaWVg1?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ef7920-9e47-47f1-0ddb-08ded790eaf1
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:50:55.3453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+iWYsERYmG6Wowm/cFwSq7zGof/rbzkHYY08aXdVUUw4VmQXT2/4WWC6BJLdFYGk0OMuDWEgh0ssVLn/gw7MJMtV0ZSCHnJWMfHuvSMmOGJke+4WhoRbY6ew1UqjEUB
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
	TAGGED_FROM(0.00)[bounces-66257-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C64D46F0091

Add v4l2_fill_pixfmt_aligned(), a variant of v4l2_fill_pixfmt()
that accepts a stride_alignment parameter, mirroring the existing
v4l2_fill_pixfmt_mp() / v4l2_fill_pixfmt_mp_aligned() pair.

v4l2_fill_pixfmt() is refactored to call v4l2_fill_pixfmt_aligned()
with stride_alignment=1, preserving its existing behaviour.

The new helper is needed by drivers whose DMA engine requires the
line stride to be a multiple of a specific value, such as the
Renesas RZ/G3E CRU which requires 128-byte alignment.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
 - Add v4l2_fill_pixfmt_aligned() helper documentation.

 drivers/media/v4l2-core/v4l2-common.c | 12 +++++----
 include/media/v4l2-common.h           | 38 +++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 54995ba8c20d..2ce4f1c20fbc 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -537,8 +537,8 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
 
-int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
-		     u32 width, u32 height)
+int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
+			     u32 width, u32 height, u8 stride_alignment)
 {
 	const struct v4l2_format_info *info;
 	int i;
@@ -554,15 +554,17 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 	pixfmt->width = width;
 	pixfmt->height = height;
 	pixfmt->pixelformat = pixelformat;
-	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width, 1);
+	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width,
+							stride_alignment);
 	pixfmt->sizeimage = 0;
 
 	for (i = 0; i < info->comp_planes; i++)
 		pixfmt->sizeimage +=
-			v4l2_format_plane_size(info, i, width, height, 1);
+			v4l2_format_plane_size(info, i, width, height,
+					       stride_alignment);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
+EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_aligned);
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index db59dda578f0..7c8cb5a8befd 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -554,8 +554,42 @@ static inline bool v4l2_is_format_bayer(const struct v4l2_format_info *f)
 const struct v4l2_format_info *v4l2_format_info(u32 format);
 void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 				    const struct v4l2_frmsize_stepwise *frmsize);
-int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
-		     u32 width, u32 height);
+
+/**
+ * v4l2_fill_pixfmt_aligned - Fill in a &struct v4l2_pix_format with stride
+ *	alignment requirements.
+ *
+ * @pixfmt: pointer to the &struct v4l2_pix_format to be filled
+ * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
+ * @width: image width in pixels
+ * @height: image height in pixels
+ * @stride_alignment: stride alignment in bytes, must be a power of 2
+ *
+ * Fills all fields of @pixfmt for the given pixel format, dimensions, and
+ * stride alignment. Only formats stored in a single memory plane are
+ * supported; returns -EINVAL for multi-memory-plane formats.
+ *
+ * @pixfmt->bytesperline is set to the stride of the primary (plane 0) plane,
+ * rounded up to a multiple of @stride_alignment. For formats that store
+ * multiple component planes in a single memory buffer (e.g. NV12), the
+ * alignment applied to each component plane's stride is scaled relative to
+ * @stride_alignment so that the chroma stride remains consistently derivable
+ * from the luma stride. @pixfmt->bytesperline therefore reflects only the
+ * primary plane stride.
+ *
+ * @pixfmt->sizeimage is set to the total size in bytes of all component planes.
+ *
+ * Return: 0 on success, -EINVAL if @pixelformat is unknown or uses multiple
+ *	memory planes.
+ */
+int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
+			     u32 width, u32 height, u8 stride_alignment);
+
+static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
+				   u32 pixelformat, u32 width, u32 height)
+{
+	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
+}
 
 /**
  * v4l2_fill_pixfmt_mp_aligned - Fill in a &struct v4l2_pix_format_mplane with
-- 
2.54.0


