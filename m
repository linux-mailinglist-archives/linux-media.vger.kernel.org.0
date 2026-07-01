Return-Path: <linux-media+bounces-66255-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aAZ4KndIRWoo+AoAu9opvQ
	(envelope-from <linux-media+bounces-66255-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:03:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AA56F0211
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:03:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=OKUByHrL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66255-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66255-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29C39303B933
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9D1379C5B;
	Wed,  1 Jul 2026 16:50:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64818379C38;
	Wed,  1 Jul 2026 16:50:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924644; cv=fail; b=NmaDCqmqG/UDcnbODm+vSqJIQUnhu37/LTCcYinCgJ8PYh2U6CghWBPxoZ9HIktk7D8Pk4ZvfETBfAvk5ATgdTXvG6Pa7BLbIBM898hLI+RtW7mxkAo8cd7/ql9uSVnUpTmCTx2cZL13qkSqotGaYyvFp4WJHcCc+jqOpEDTz68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924644; c=relaxed/simple;
	bh=QEOF2ZICMwmkbnTr3I+zQKGcGtxQqLiXAWZKo37Zpp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KqqUn2A196l+rSuNpxtICH9blcmCTtZHlVGBvKBn9Un+ZXAWwDoX3VIY83QTtKy01HSHK1MNmq4D3r2Gj49L0gnqzCp2qBHjEcSen0FC8Kvl5rqW/QrKn7j5dSnmmUNt/RY8i5L2qqSEwY+9OWrd1yuHGsLjUI7pTfr8eZ/wFts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OKUByHrL; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7F4pjutRyEEbASsJ5DOU0mf+JoNFayxVx0T2KGpQzf/qwqnM6MpSYPcuyXYNkqeYdktIB07MNUDw6j2LGWuNMYeuxhnXXTl+zLl1O8omGLKQZkJuLc0fwTwyi2116E+lkDmaX5ZVI4gQiPwntu5Mj0qz6BvgW8vI7VnetkN7XxCmmosVXpN1xAaIDykz8pasO7NorJ1oNTnhEQblIhrxX8sWhQW1ZpbCJDaF0aBIXOI4RCpfottAsjjTgfxfo3lNPYgwUoBGjgh0Y6ZdjaivEXRWBin1KPP1gln56mG5yEQ/0iSm/94B3sjHJ22ssv4rHeDsBtGv83bWl2SN0gDzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1/6cI1Y0eH1/2upbOlKH3HN4M8zMfg9WdHYE7BWYgc=;
 b=hUgrzNOMDl+cW8Yd3jGKkD0BPkhGmeqLJAmG4gjHr29OxYEO5vUHjRPQQSzQjoeJkB86KJ0+rT7Nkswifax3XM3o17Z0TgolW8T6npdrBM9e7ntI8TNca+pNTZRXYQKtkrNTCWmac+Fr6UiXP2IwRi4V0cBYP9DIv7JUm1ZqJwbpqGmi0lAgGDadkjBQTDtgVyKguPlogv9CHFJzEIiuIyS3jNN6YHJnsU1sATgE1jjIjOmq9/BiftD5rhgYkwrb3uczgUbA0jKOKbLXNxNDutSU5QeneQz9zzOah1YqCCrCgUuSPcFc89WACAyfYSt6jGaLjaTxnabcQcJj++XVbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1/6cI1Y0eH1/2upbOlKH3HN4M8zMfg9WdHYE7BWYgc=;
 b=OKUByHrLbC8hu4M3mJsUsNzbJreHnVp8ptK5fqF2lKW+URseRcknIII3WPmziZMLz3j4EaurgVfYLcqDCZaPDH9npKgb7ORWI4l0XAClZzJGuWFYUfT3IuzsT1vJq+UH1R93srUONLjXzZ9I7pkVD8CuHMZIJb0oiurTRbcXcas=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS9PR01MB17534.jpnprd01.prod.outlook.com (2603:1096:604:450::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:50:41 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 16:50:41 +0000
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
Subject: [PATCH v2 1/4] media: v4l2-common: Convert v4l2_fill_pixfmt_mp() to static inline wrapper
Date: Wed,  1 Jul 2026 18:49:58 +0200
Message-ID: <20260701165003.1495035-2-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: d68ba3f7-5caf-46d1-ab09-08ded790e27f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|11063799006|3023799007|22082099003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
 KPsPhDgYS1beQ28XPljyH/yi69qCZotLbppZn+LZ6pMKRkqWz//fpf2jgZHtjw+JXN05aDWc0ZftWrcTLd08m6VsMT0dwB/kzpBT02z/UiuceseaO5l5ucyxtZmAsMptbLcyKSVrrMtoUfwYdxQP6eCma6CuNp1zwedJEjYrmkr0uuGKNdziJ3OmEuLh8/+a19KcLWK96w2+1JXHuQZ6gj+e9ZwgR0+rwinBHlZOarp/9Ktfh3g0ePm/yDU90/Vznay5Af3TR51DKtSbqnB8HLPVzZ3oPAD2vM40Htzi4Irxo2DmyKI+/FmyqY2wQ7EqftgMkkhrn9vfr9wNcgKAbQF4Y0Q+ssv/0je4DI3G6DsPVAD/d+fAAs8xFoN/E9VHR8uOWIwK6MRWPFWaAFeVO8JStEUOEyugme24zr04PU/OEAA7buWBZbbsJTCDJ3lPFPPRXefr5b+xGbtT+Q8O2hiFVVHhs7UM4xeYeh8dQ4/pYT04rHG+6l+qWBkHPGqt1bdcsRE42gteK1k/QbXAbuWJUsCk88Ntlb0FWcuev89XqUsT08CLyUPV9CyLq6duSjPyLpqpYF4hGDZ8mkyO4NEcJK9zQIroK6ai7qABb25Q1/y95rUeuhpP0uXtqZy1aRcVvQ1Xu8okStHhIGioJoSLymKmakMY9Ot67mPpdZ1FeYF4bnFsTE2d85WV1z/HXdF58f0ldJDAk2yQL0of5PITs6zkkerfN/6+xcTOklw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(11063799006)(3023799007)(22082099003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?i4OCv5ZCSGElTcDwF7tCdKELHGLkDgVN+T766ZuqmhReNk2kJmnOizUc2R+p?=
 =?us-ascii?Q?Ll6cYRPCDs6ty3WjoosvAHtGcRTg7OlOGVncqh+C9lwSi/05PIWX9zA4UOw8?=
 =?us-ascii?Q?uA+4fW6OMkA+6unEKcUlIB8u+NfN5oNDitOwHtHnzOgpxd+HYBbz9oWIQQll?=
 =?us-ascii?Q?cBecjEsrPbE7ZWIXu9eEgvGC5TSuU1Omt5IBTznPmCHbUL9CxfAH+KypJq+Q?=
 =?us-ascii?Q?fczgLiCI2K8ZKBtHgxP/ApAbfn5zHmxOOIPe3NyTgO0gSZRQ2Qkayjddrj40?=
 =?us-ascii?Q?HtfrSdyhHlFOYs5hm0MnvBPehfR3X9Fz+rA/j+TWy5cPrLZty3bZs8U7wcp8?=
 =?us-ascii?Q?NwxMczCN0hi33o/GbXBPmtGZu6qAuSnOusw/yzW++j10Qw6PX9mdlzuJ34CS?=
 =?us-ascii?Q?h4BTZ9G2PPCDPmZZ5brYwos6qnyaoNXIPktZ0bADmbrNj6V9hJrDCQUVRLxy?=
 =?us-ascii?Q?72VY+ervlnPmu3Ck71qdM50OiNxup3re+fRkFB/sB+QbecI7j2qysU9DQGBY?=
 =?us-ascii?Q?HebwIkrNc7qrBDs1mjhgCVySqvqIoXlqEb0KWSCmFVdWpjDiSlxSl4/FWMkh?=
 =?us-ascii?Q?eRFDw0gSx4dn3gANa2s+HG4dW/YdCA3F/RqhNupq5BTiI8IEr10HmpIMbaWI?=
 =?us-ascii?Q?vaiWIgP3pMIo+i+CBjeoMRakePv24Mk510Qtf/JbRra+cQ68k4LigMnEnU/Z?=
 =?us-ascii?Q?V26dl2Gm2R5vJAD0iiBUqsSob2xQkUQRAAcFOrxeiXB4/cqkWQTllx8clMm2?=
 =?us-ascii?Q?aW587iLxWboAWBeBokdd9oWbNWTdtyWFZsy2p1V1ztVUEuguQq6tFBXe37ou?=
 =?us-ascii?Q?Q4VQZdUpSKcYD64L+C4Cnx9855xZBazrFEvLD+qKJ9RiPgQPQ9LO8AX9CrXG?=
 =?us-ascii?Q?WeyQAfYbfWywWiiH6eCpT3gG7Ysg9eRjV5ASbqaJZDh4uKSLozrt1HGP6Yde?=
 =?us-ascii?Q?Asx7CtyR5dqRld9joLZTrm3eHYz4SOCeubb1odBNkp4mN7uk/BFEhoyZFaY0?=
 =?us-ascii?Q?GarZhOaEnd32WsEgoSVFvju22R9sqkrBBH1s3t1vZUqHmurcOiNIeNNaXvSm?=
 =?us-ascii?Q?l1i3qh/BxAIUlg9iMtUqlB/Z08lrpSAjTd3EnD4PQUKfG5+o93ZILaG+Fur4?=
 =?us-ascii?Q?uWZ6jpp/rlQrWJJlc2YSuxOQTlaebTXs20lvq65RZsxX217l1uSFdxZa8uF/?=
 =?us-ascii?Q?aYjlkkbVajAc7/le0VlainTMiIEgvVG/nbvpsLXxnzgecH+PveBGY+l/u8zn?=
 =?us-ascii?Q?21Zm4k05M00KDQZAH1TpdxcJmhs2Mx4G6lKHiUWyuZB0vv8OyY1fuYWPMXWH?=
 =?us-ascii?Q?QnPwy+D9VK6b6tT7YWuM/YGa3K1IKswTygDHa9+63TIkyVe5QowwzYlnSLZy?=
 =?us-ascii?Q?sMVhBTufteeQuN2Rw2My06wnzteUoT+1nc8JqrbS8eJV+lsxwPel+L9DiOLT?=
 =?us-ascii?Q?A14TJJxHTvWzhLBTMDQQUN06qJAzjgJaZb83j+qZ1RVDQTr7u7qKtSFNYxdE?=
 =?us-ascii?Q?S2jrYXigNbAkdI/2ffWHg9OfNSoRv1t5O3Buikpg4jE8hX0DTb++0BAS9Mr2?=
 =?us-ascii?Q?khAmW/vZqUyo1geJcxo0T/JZcq+msxqlNpgZotGpGGiSFyR3BYbCxjjvO5M4?=
 =?us-ascii?Q?C38wy4qrOXNPH6lo+dV3OmTAX+/QYS57da8htGynz4JFcH3nsdXQOKMTYfDp?=
 =?us-ascii?Q?OJIc28bz+v4XQ7DVXCFe9tX44RecYVP1aOxLzzQego7XkdRnP1JQQbmam4qu?=
 =?us-ascii?Q?15/FxXA6L2L0iD1Dk3WgBhHBzUGy8By3YGyoLpA1XM22EPZFYIQ2?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68ba3f7-5caf-46d1-ab09-08ded790e27f
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:50:41.1685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ts4MFivuqNZjGGAGJS+CIkgKAVi+Gz4GASUXiFdV1QVE7dM6DpHAudlZlj7NS4QZt8mb8cJNVo8DwkXMSNDw1yZmWKsmn1P6h5blxxa++/phOKdgwN3YiS2Y2bRmpr5L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17534
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mehdi.djait@linux.intel.com,m:s.pueschel@pengutronix.de,m:nas.chung@chipsnmedia.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66255-lists,linux-media=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5AA56F0211

Convert v4l2_fill_pixfmt_mp() to static inline wrapper: drop the exported
v4l2_fill_pixfmt_mp() function from v4l2-common.c and replace it with
an equivalent static inline in the header that delegates to
v4l2_fill_pixfmt_mp_aligned() with stride_alignment=1.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch

 drivers/media/v4l2-core/v4l2-common.c | 8 --------
 include/media/v4l2-common.h           | 9 +++++++--
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 65db7340ad38..54995ba8c20d 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -537,14 +537,6 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
 
-int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
-			u32 pixelformat, u32 width, u32 height)
-{
-	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
-					   width, height, 1);
-}
-EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
-
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height)
 {
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index edd416178c33..749fe38c134e 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -556,13 +556,18 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 				    const struct v4l2_frmsize_stepwise *frmsize);
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height);
-int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
-			u32 width, u32 height);
+
 /* @stride_alignment is a power of 2 value in bytes */
 int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 				u32 pixelformat, u32 width, u32 height,
 				u8 stride_alignment);
 
+static inline int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
+				      u32 pixelformat, u32 width, u32 height)
+{
+	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width, height, 1);
+}
+
 /**
  * v4l2_get_link_freq - Get link rate from transmitter
  *
-- 
2.54.0


