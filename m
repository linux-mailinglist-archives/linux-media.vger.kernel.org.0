Return-Path: <linux-media+bounces-65532-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pjCaAP60O2qFbggAu9opvQ
	(envelope-from <linux-media+bounces-65532-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:44:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D2B6BD75D
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:44:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=QVCft7ZN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65532-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65532-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D21530BBC16
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC912D77F5;
	Wed, 24 Jun 2026 10:42:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23C524E4AF;
	Wed, 24 Jun 2026 10:42:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297772; cv=fail; b=s4i2lMo3BwDVW/h1wPtVPdvRBXv8SRjwmtIOuhKxLeUKBI5DUCtlcE9boMajl8uEgjR/yJ4Bm4xCc8jkPK9n+EO2I9Lk0Ti/pxgl0Alxdcnng63tZmXzIsPXPoVrPnk/HoRn05GFB9BGS+/EiDSAPLT8IXPmLz2gCCK3vssn7mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297772; c=relaxed/simple;
	bh=pe8klt+MKQdRroJFPrsNFqiRND/Eez/sub+wc3HnplA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uoOObKyf0Hx375j6n+qbUNWN54XJM2QaCiV4RyELiu/9oMAwllfyTpP+j1DvKWKkQEfW+JB1Rql7ubL0wdHS51GAER2MO9rU3+QBs5Ls5CfFsUHefoN8d6Tzzweo8WmMy+woIqR8fI+eO/GY+X8B2G/IvfFjMav9w2IqyDTfTdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QVCft7ZN; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Un6knB+nizdDzSYym7HXD6fHLdC1SNvCTd/5D126RoGlMU3CRZyNy26CbteiryzieK5Ap1j8X3lOU5Ooa3UG3szAkHuC3zI75oi08nFJscbliV7cl242I26dZFh9hblRfdNGNrcvv4aYO9wGL5oEIXrRXPevHPUDyntBF3sq80at/GBVQ0Jw9hhH4UdUvxOcaOkRN8iZVs3kM8MUfoxgCamfdA0LIYvBfiPzzUvrabLSXZgQ8/8PNGJ5zMNcbDkfsldiELK8zj+TaKyYUxfJuMFIRS/YjsOUmMoWH1+UvCTcb7rSd5m0SPY5XcyAM2MvunrYjHbcrGKvvV83bwR5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1HM7rEU2baTlOynDadQldpGONig4ljfJ6st4pfAwx4=;
 b=sDG1a3Ty7uUlZ9PPpK1n7atIMYqQWoJL837i6plttiz3Bg97z0NGhpuLZUx4gbAHg1wonqNQT0/ogvjTjGCbh0n+4qlH0cDmxH/mrv4X1VFm077Yt+kv8onyXsupEFL/+atCszvZZtsHkHGA2MWD+Db2RdJk0GPke4ja0Hqpcyjs1QljSq26AXiXDumJ3pHCNsqpqh0ZJQ0G9uC6I7KQTHzkeiHGa3viuEP18YMWM3zggin98OTXOI3U0VQ4e+eEnp37cEVtsgPhu4LYJxrmTDK3nnotGXV/Dwv/gkECVtVkE6WBbi8ltrZ9AXYmxtQSARTi9KjP8IaOQxW7E4OVPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1HM7rEU2baTlOynDadQldpGONig4ljfJ6st4pfAwx4=;
 b=QVCft7ZNBjogra/wYhTYRlQwiEGSLPW3y9pWOCbtv+W/kIZQwFDbBlfOje+o76P/SMHE+F6yuqT8kGn4FA8czX7NM/nLMRtxmcnFHurJxY3yVBVyc6b9+UXsz+5eFtY1UlooIfBf8XzYN4I40EZSq7TbiU+AlQqxYOsfcQfPNAE=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYRPR01MB14159.jpnprd01.prod.outlook.com (2603:1096:405:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 10:42:48 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 10:42:48 +0000
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
Subject: [PATCH 1/2] media: v4l2-common: add v4l2_fill_pixfmt_aligned() helper
Date: Wed, 24 Jun 2026 12:41:30 +0200
Message-ID: <20260624104153.798953-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624104153.798953-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260624104153.798953-1-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1ca7eeab-7aa9-47db-1183-08ded1dd5514
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|52116014|18002099003|38350700014|3023799007|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 WQgiRbMR9i4bHTNtXICu8LzTpq/xjN4fLbf468+i17MSHvitpK048+bqN5H2FZwxd4Z9HmNU8Yg+eWYx+DZIC1rWWrVBNo2oUU1yc9fSxx9rhVjnfEnMrgzO0GlgmnF1iiPIlzqOTu4gNe0NBwr0t+grTaBApKr+f4x5vDmX31jZkXSSK2SH+1imyPvD/6R3141h/lQL6EnCnbpYBKtuAXteWdmZTE5WNFm1rVvZzM0LvmN6PE+dwVQ/JGuatV6dDHmC7bPbGpD/Plizk7Gd1bI7LACmAoWayV2da9DjpYh/39yjIHsDlWEhJ/CwLBY0I/NxJBP2xzdYE2tItnz/z6KTI6EHsw6PU/3Ab7FAWPi1Lkdl3Jh9frXYYsJLqnqkttzx+wh4CTsGNns2BGGuYU/7e70SEVQKvIOgS16ogs1vIO3e/cSx3Xl6+S0IfgPEqK38SYi/6QXTFdSjfmmLqCdCmp+srD3FLwWZCG16aMW7hvo6LrOC4+IX+Gu9esEl4VyhrEnTrY0hZAQicJPxR1GJadjBhBNhA/hEX/5X2SUx38QBrYypqDhFoDquc9kst9R+U0amaXUMB1gGTBkgJPLQBRlOf+OtrfVrrGHLcbcN+TDsulHXpY5CLyB5ja2VCYlqpvB+mPNVN4Z8Zgg/68H4R70YpGqAWktyPl6ybxlwUvppYZq37GYp99dqnvv3AjKTjGj1yEiaJclvRWogfIxeBhm8dbQTc8yjgKSaDLI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(52116014)(18002099003)(38350700014)(3023799007)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?qxtcEjQVARgD/DLbd9HpYR2Ts+whhkxIb76F2grN1J+fsnIv+FGO9fOqhHJf?=
 =?us-ascii?Q?losihebvAzXMdmKejFpV5VeekEr0vBzteEh0a/dfT4kC2C0QzcOa+M8snfM5?=
 =?us-ascii?Q?SRpA0otykTNuy+t7dmmeKR83lsxFt0hS8C+GJYN47AtlXT5u7x+diBHz9nMz?=
 =?us-ascii?Q?CmPMKr4R5xcrI6eQxuRcb+kgw/i/Sctp/eSLwYnHcIoA4msYDGAz2KyhjPcm?=
 =?us-ascii?Q?gSYjyjDINm8EOmZ0OaMCsCO8xW3JRHzPzRXi646Zu+puqNhk8ychdu9W0r3p?=
 =?us-ascii?Q?3J6SXhfk8GqWJGCMTrukAdS6YGfx9PhU1/tt6rvj6J1abAWxHV3zqiwRVN5p?=
 =?us-ascii?Q?DCNXkfcUoFV+qVFYLE6zu/Z6UbRAlKdkdOeTEhZt/iEsPyXM94MnaiaxQRRS?=
 =?us-ascii?Q?L26BwBgubSnSMPWrILeFH7JK9TuTafgD89bOy1Tqcty90AG4/iwQSVua1wqZ?=
 =?us-ascii?Q?EUjmDdRQERsJgTfRmLpAbCi32ZSW7YEkMhkZuDMvbPJXnNYnpRtO1jA/QkXN?=
 =?us-ascii?Q?Sjb98AqovWooXdSV7sow3jr6nnTGcHFPYvM+2zwaOmh+eRDIWeiFxA8l+XuY?=
 =?us-ascii?Q?7cQ+Y0tR1F40QLGayLz4wfvZz1xHfd5fEauC7FrpoZOSqUHn2QFxp6gE2s1y?=
 =?us-ascii?Q?7vH8mYcpPSBxFYO1d1EcWq2QY6ayxoky7yNHvaUaFfjhdFkvxV9FSkJZEmdV?=
 =?us-ascii?Q?4UZqRq9gtWV8EiI6OziDp1gns8MPqEh7k5Em896RHRlHJ8QEg4t/Ryx3LcAz?=
 =?us-ascii?Q?04sbDAZaVfvvlmlgNOmIxe0MbVDNMS3+P3lfawsAl42YZLFQ+WKpFaajbVgL?=
 =?us-ascii?Q?OvNKz+WHxSOdKnDYQQhQs1daE7NlofuMjNYWBlIftHs2u60ePRSQU0Rh5Mfh?=
 =?us-ascii?Q?3QODOzMUcAWUgOqyLl+HRy7ePlf3JDx3N0hlGQCjGtU2k2L8IgwJq05LBz8l?=
 =?us-ascii?Q?hh1zZM7MIsuf0+MYHpmhBh28ss8Hr+y7yhE0hTGF88bNQ/YG70UGokj1RH/j?=
 =?us-ascii?Q?HR2HgfH+HHIxgbActzqvXbfa9Fl5sXbotbv2I40nlpQrhWRW6lBvfGRohRuY?=
 =?us-ascii?Q?tQ5CppvWQcnEHTgdRjaktoPtuJa9peAGU9acwYPK6uUfvB+0W5RF2XaoVVYw?=
 =?us-ascii?Q?6oJ1piRA3W01plLHoOAquVQKtVrHMFDCmiawCjcN2+8iMO0IQMzMog+fHlaF?=
 =?us-ascii?Q?Gsyr/A5FufZQN7Jffu+59IeKxoBvc8S9Ef+6ZJhsuFHbt8dXmk9NXogQ7TZl?=
 =?us-ascii?Q?BvwOPkqlgqmPMzkoNbFyUb3HGWrxSCW/00Zvr4V+q+QkrwpQTQJfZDFIjHg+?=
 =?us-ascii?Q?tLL4HmgSjTExkh9hVbM5oQxRyWoswdmIpbO/q7/u186gVmSBdn8sPntqtbeq?=
 =?us-ascii?Q?SvY6OcWOyS/yhewWSAnnRr2ISqR92nDqGdwT45FoMfKP5tEl2l7exDO6xBXC?=
 =?us-ascii?Q?Tuey9Oq+wtUNZ/7Xne+d1eTHIAgWk3RXpCFJ2o93bbm/UDJidUemgmFmdfht?=
 =?us-ascii?Q?YlLjD2mi/GFi2dfdFX4mzj6wb5concoBPB1NP20weSsgrJro6Y5CzZVVuvJ8?=
 =?us-ascii?Q?lQVXi8xtRB0Kz/oo3e11sVb3Ai2Zc91phUTP4w1NLQnHB4EFJJBvpmOSv0ry?=
 =?us-ascii?Q?UkaXSZeOCg7ZYzNO3/8PvBx2ehkGUZNlfsF0pNj8NTbZ9tAZ7JQ1bWzOVp55?=
 =?us-ascii?Q?Nzq+4+7vWQFw0IApkroMcAh7xIof1KVbRHRSNxfhd81pkQ5d35P/TAUR4pup?=
 =?us-ascii?Q?pMxRfgSzMNIjsNABLjGaOfBEbNmRJsYPOSBh+VH6Sp7Ir3uQyShK?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca7eeab-7aa9-47db-1183-08ded1dd5514
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:42:48.1793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mukcJKr2k2wtAu3ZRGqh+2geQB/I/IgmUSNQj21rnH/TwLlBBxT2mZt0VDdgCvbo4dppLidzxoVXdiCpb/PED9HM70OmJoOvLNsrAtJuVV5K6Lx4Pik3SQu4vQQNjcoy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65532-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46D2B6BD75D

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
 drivers/media/v4l2-core/v4l2-common.c | 17 +++++++++++++----
 include/media/v4l2-common.h           |  3 +++
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 65db7340ad38..1de246acc7ab 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -545,8 +545,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
 
-int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
-		     u32 width, u32 height)
+int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
+			     u32 width, u32 height, u8 stride_alignment)
 {
 	const struct v4l2_format_info *info;
 	int i;
@@ -562,14 +562,23 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
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
+EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_aligned);
+
+int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
+		     u32 width, u32 height)
+{
+	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
+}
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
 
 #ifdef CONFIG_MEDIA_CONTROLLER
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index edd416178c33..718a0f47f36b 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -556,6 +556,9 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 				    const struct v4l2_frmsize_stepwise *frmsize);
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height);
+/* @stride_alignment is a power of 2 value in bytes */
+int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
+			     u32 width, u32 height, u8 stride_alignment);
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 			u32 width, u32 height);
 /* @stride_alignment is a power of 2 value in bytes */
-- 
2.54.0


