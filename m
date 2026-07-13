Return-Path: <linux-media+bounces-67433-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id giZzJuGbVGrdoAMAu9opvQ
	(envelope-from <linux-media+bounces-67433-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:03:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E55A274879E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:03:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=XZl5kRoo;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67433-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67433-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC6253007AD1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5E23A5E70;
	Mon, 13 Jul 2026 08:03:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839583A5435;
	Mon, 13 Jul 2026 08:03:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929812; cv=fail; b=kNaX1a+EwYbm/l7BJE3LZNYPQx9tjliMmsUSVD2Ftt0i2c/jDXoB6S/P+ACPXpF6IDl5hD1C/MF4+nTAXfrjFVAtLekT6GZv1UAxisY9J/u0NSXIl3D8lMqewEo7Me5Rtyedg1hqn5Kj1zSnqFTK37hFGNOd/PIZ3vpwwsKuwNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929812; c=relaxed/simple;
	bh=b5sbzQblonHBpZmgzdhXp/iG5gmM/Q2fCKPoInqgTcg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bHuebY1V18Upgt8DbHPpt6vzCrhk7hoLO783PV21p2LRulXcePQirXIMHPO063PTLZ9OEZ8RzMwExZ/+QCsFly9cDvwuBID8i+qSTWtRAt6Q/m86tOPBKvDfDVj6Y2uQVxHpDDabtZp+kkSQ3qGN1efRr6qSHlVIDMj4Cyt12Dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XZl5kRoo; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gB4muE4CD4rHfip4hFkuEGnueuRXBmnJ6RXwVAqc4jnEqDBOERa7fyqenWKH71CGwm2bjSMh7460YMFaQj7ISHNUiDlvGIfmpM3PwEl7SbcwftDLWBF/hXo8Gjx8Kizir8DSff+RaatEkCHs/S6XiR4QJz82Ro7MN/5LIG7wwPmIo1pddLjWQhjXREM3/M86pkcPMdo8U+Uudsghi8ngFceebMHjU7ToYaOJgSWN2ZKjhRIE3vCVdH57rRTR/CwSIC1E6QRXQM0E/y5r/T9LYsTv08nr67Et1NOV5Yp6Obt/ZiVBe+jZKEGl+LPUUac+yj/10opTsh2qD3RYWxUc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdSfhqhz/mN/oydkGXx2kAOfNoPBoFOiTQBQJiHfeDo=;
 b=pWSQTjQcUQTwrK7cdGN7n0LBNJzBp4stPc4W6IRKgb40r+aPK9vjtLgO0s++IVCScRIpx2XGLAgSvmTVUzWDjH4qEM2gelNRqC8MzvPMs8+i6oJbgl0J6Qh2DrtJ/R9YHtI67E+E1XbZn+vM1E83SP4ykrxq08TxX2gsjronDYWUtW0HMMibbbc0ZCY3WlAy0F7xy/HLDF+ePzQEUMwcqOn+PTjSjTvZq9i/Ye7hHsSpVe3/WyHN8oAvzxeiacPHvQoMLHF/8vTSi9io8uqj6Y6+329hRmC4oZDNztbuYsK7ORUm3pQGwDo3J2fQDmubOoyVeWWYUBqr1KdmwXf1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdSfhqhz/mN/oydkGXx2kAOfNoPBoFOiTQBQJiHfeDo=;
 b=XZl5kRooU2tetJ2qUeVG4riI9x2sbRwkJSRporSvpmMbrgkXKyzFJgqA/4r5qvJWC9q1wb7mpaFZKIxCnEGOiH1r5bkA6ihnTgCZ5QNbHvJdofhl4i2QTBvN8x/YBv3u2Ru4T+ulcO9/uW+AA5xvcFTIfiAbfmReAziEVHy5qm0=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB11657.jpnprd01.prod.outlook.com (2603:1096:400:3b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 08:03:25 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 08:03:25 +0000
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
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] media: rzg2l-cru: Fix DMA stride alignment
Date: Mon, 13 Jul 2026 10:02:49 +0200
Message-ID: <20260713080259.21835-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB11657:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f8da56-a67d-4022-0f82-08dee0b536b3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|23010399003|366016|1800799024|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 80rEQP9rJzpGYrY2JnCFyW2+6zHR9D4uEmWERZA49QS4D+tQHCc5F0E/KDGVCCBJF/b3kNcRPb8q9ngYkhSfO4PSO29HxM3QuxsyMNYtaHCewle9AxbHTAAe5P1DFClkFCvTRlEaR8vad1Tk/b7D3hZE92RXmkJ9tnddeTRyvvqeIBw+wc39fJjxbcEWIOhKHuND1rM+RXfeS1x5UU+eH6k+OjtaXL3O9yrCvYxViIu1rxRsAADBPVP5xIa5K9JKu77IxaWGlIeEpT+UnQy2FKLtoWJQnvVMMkW5rvJh13MuR00hwabSF9IG4NdgXItTETK6aYeNYXy09u2Psk9ZGF6jbWIqMAR/36ROrFXLecHcVn06OzQ2QkeEnsCoKPgiDT/JY0sBeV9cBEIbwV9Qb3fmndkwucRkLIXDOfvWeQ1LPTFpw4iJho9wsMoEzrWq7s05XJrin92Zbi6JK+hJ2u9UzHpLhnQkZaM6XZaBKdu5RcGg/ZgD7jXMyaor1Ol4yUyaA7J0Cx9sQX9ie58A+CnVZQLjJROANkVd6BuqOepcmpWvVlp/5H5b85Wm9+dlAO5eZ/nNJvBm3jVCE0sANXanCHxA3K/+HgX/MAzMcK4uOTAReaC16Xx0t4KyGScqIjiCWq4b2oV9KDdCaYCivs2KNZN/XTsZRKFUujUB3cDdRTDWZqQhoanRVCFXtjCEe8G+aawN62MUHNSLCrrt2AjIuJM8adNkwl9hKjwWPpU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(23010399003)(366016)(1800799024)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VEJLdkt5MGFPd0NKSS9FZkd3KzNzcTFwV3BMQlBQS2dPRUNGMXJqYkpQenVr?=
 =?utf-8?B?RithM0tpVGw5MDRscXdpK1BsZkR5SGk2Z2pKczQzN2pWWEp3S3dhNU9IOVpv?=
 =?utf-8?B?dzVSc0lVV2FwNjg3YUFiTU1XRnpoZXJRL3c1NC9jaEFEREZHQzkxS29sMG9q?=
 =?utf-8?B?WG1sTlNiaWNHSEdTVFVqTTJ6RjJXZ0NJRU5PWkV5RGVaSVNGMm4rbDJwRWZM?=
 =?utf-8?B?QnBLRGtiUWhVQmtLN2Y4aHFmc2Q3RytaWDY1ZUs5OEZlYzBobjIwVGlPMWxO?=
 =?utf-8?B?NE1ZaDg4S0VVZmdmT215NDFlNTBGbkxpUzdiWGhKUXNzQXJ3b2h5QTBrOVh2?=
 =?utf-8?B?TlNRTWthNTI1RE1VR2tEaUs0NGREUHZZNWlzWHRudzcvZk5tL1RUYWR5bTVt?=
 =?utf-8?B?L3pFU2ZWQ1dqNXFFYmZSSzJ3WlorTVVQNzNaR3VCd21RRGpCWEFERkhvTXJU?=
 =?utf-8?B?dmhBVkIzTVliNDloL0lTYmJ6cHpSOUlEZ3Q2Z1JacnZXTUlKeTIvUENxR1J4?=
 =?utf-8?B?bzd5dXJhN1JMUDJOeHlDck5XQit6dncrQll6RllJaFpaZWdwOVkxQTJ1bjUw?=
 =?utf-8?B?TEZnWUdlRGRmVnJvRCtWTTAyUExyekYwcXFLV1k0c1Y4dGhTMnN6MkFyM3F2?=
 =?utf-8?B?VUR4TzEwR215T2luZkJCb3VGcnhva2RsemVVMzdzSlNXd1RUZWg3amZ1QW5l?=
 =?utf-8?B?QjRTWHZqYXRieGVjUDVLdXVTNEpHSmlma2YrRTVPSkpWOFR4SzAzUGcrSGcw?=
 =?utf-8?B?TEdyVW1XVjZkWDNta0FXcnN2cWl3N1dJTXVWUldtZ29mdW9kTlRmMTJTY0VW?=
 =?utf-8?B?YitQcEpsckxha0h4S0FjWTlNVW1KWUFVVTE3TklrbXRmbFJockxWOWpjQkVZ?=
 =?utf-8?B?cDhLWVJZN3RiQURGUTZXSXNocyt1ZkJnSnFFazRDeFpqbFpCUzlPaWg4Z0h3?=
 =?utf-8?B?cmIxVVo4OS9wS2YwMW1maEw4eFMyS1lLTmNCdFluNDhPOXluM3hxS24vYkFr?=
 =?utf-8?B?VEhiSVQzY3JsRzhGcFgzVjlPMWUzUmpQUFpiZWlOMTUwMUdVUzJGNGFvWDFn?=
 =?utf-8?B?YXFWNitiTDM5OXhOUTQ5NEdtSDdLcTJTTTdlYkY2aUJIZmIvSTliSWFiQ2ZV?=
 =?utf-8?B?ekg4MlFWdFIyZ1U0NzJseGF3VHVPcWJzcE41bFlEck92K3JtNjJYQ0VZaDh3?=
 =?utf-8?B?NVpVR2YyRHpSM0dYWnVhdXJjaXBNeHk1UkdrNUg0ZWkrcXFQTVRQUStRVFJy?=
 =?utf-8?B?bmJXNUh3anYrbHhoelRDdm4vY01DeURqcHk1U0RKbWN3VUVFeWRjZWhQZ2s5?=
 =?utf-8?B?aDdCUEdGTUNCUFF4K0MyL0ZXVVkyVGc0bG1UMVFiZ3B3T0xEVkJFS3BubUhH?=
 =?utf-8?B?R2QrTmlXeDM4Rk5LMzh6aTN4UDNYdmExTUxRRG5iWkU5Nmh4cWpLbnRwQ0xz?=
 =?utf-8?B?bXNCZ0lTZ2pxcmpYWTdDVUI3b24vODhlZ1NORzFlbng0UTBhNjVpbUZjallt?=
 =?utf-8?B?aldjV2l5Q2h1NTF2L0wwdG94cFgxWk9oTUVmMGZmNWZQTEpHVUFiSHZBbGlC?=
 =?utf-8?B?Sk1LYzRQdXdzUGpoRElBRytKSlJRWW1MdGlUbWwvWVdWK1FPbWxJYTcyZ05B?=
 =?utf-8?B?MDVUcDhVVThBcngxN3FxTGFwd0FSRjl5eGs2dEovRktRTmNLVzZiZnd2RDE4?=
 =?utf-8?B?VVM5Q2QzeEMxdEwzVmg4SlZaYnMwOFEyRFU5VXhMV0ZuZ2dSVmJocTg3S09F?=
 =?utf-8?B?R0tZRHIzbFYxZmVnZGlpdWJiQldHVTlUY1NCb2QzMUdEM3dTYUZqejB5Q0Zt?=
 =?utf-8?B?dHF4WkRsWnczcittdDFaSUJSbHFjcWJtcTBnVTdvOGRCNWxBZ2dvY3RZUEZS?=
 =?utf-8?B?a29ISldFZFBGRFRsdTB2dWlkem1ySFpiZkdUeGlCUU5vSXB0ZWFkdjNvSEQx?=
 =?utf-8?B?SVBCRHo3Wk91bzBvSDhWYzJvY2lVSFNxaEFBeE5DMW4xd2xLa2U3Z3NEam9o?=
 =?utf-8?B?dEg1VWZ0S2dBZWYwd2lmOGFubDNoVkV4ZU96UStYQWVMaWlvMzhqVnp3eGRK?=
 =?utf-8?B?MUlENGVZTHp3SHlzZlF4MnhYVXlheGgyd25IRlFadU52U3c5OWIvUWk2dzlY?=
 =?utf-8?B?cjdLc1VQRW1tMHNlU3F0c0NISGI4RWg3NUQ5bnZ3cUxFZlRHZjlHK0hqVTBV?=
 =?utf-8?B?ZWJrYXlsY1M0NGxlMi9VWmpEeDk1eWdlYVpwa0M5eVR0QThMVDUrZ3cwblcv?=
 =?utf-8?B?bzR1aUZ6alNOY3FKM0Z4U0NoSmUrZHEybUZJeVBIaUlsVWF0dmpnL0Vydlph?=
 =?utf-8?B?NXR6UHVKMGpkZ0xNdndrb29PWDFmazQzMkxnUUtqT2FUTmFrc1d6TGZiS1c4?=
 =?utf-8?Q?LP8luTkrv6V1Rj/bVkh1z0l3vkXgmK7gEPH47?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f8da56-a67d-4022-0f82-08dee0b536b3
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 08:03:24.9520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGMwECurg4fxz0RyfUy8C/ISnuW/QBe6Bq5H61R2YDIqIt2HxrVxTF/faLBThr+G5lv8WihBcvovDa1suf0ZT2/BbmLDXTyukZjPY0mOMRgUU3ZdOWJJGoSgOnZ/F9Xs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11657
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67433-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:s.pueschel@pengutronix.de,m:m.szyprowski@samsung.com,m:mehdi.djait@linux.intel.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E55A274879E

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

v3->v4:
 - Rebased on top of media-committers/next
 - PATCH 1/4: Collected tag.
 - PATCH 2/4: Collected Jacopo tag. Removed "." at the end of the function's
   brief description. Removed "component" from @pixfmt->sizeimage line
   Removed wrong tab.
   Fixed example (e.g NV12) -> (e.g. YUV420) into function description
 - PATCH 3/4: Collected Jacopo tag. Fixed into "and each plane's sizeimage is"
 - PATCH 4/4: Collected tag.

v2->v3:
 - PATCH 2/4: No changes, just moved to from PATCH 3/4 to PATCH 2/4
 - PATCH 3/4: Moved to PATCH 3/4, from PATCH 2/4.
   Fixed documentation as suggested by Sven Püschel

v1->v2:
 - PATCH 3/4: Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
   Add v4l2_fill_pixfmt_aligned() helper documentation.
 - PATCH 4/4: Collected tag, add missing Cc stable, fix s/commit/Commit/
   into commit body.

Tommaso Merciai (4):
  media: v4l2-common: Convert v4l2_fill_pixfmt_mp() to static inline
    wrapper
  media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
  media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
  media: rzg2l-cru: Align bytesperline to hardware DMA stride
    requirement

 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  3 +-
 drivers/media/v4l2-core/v4l2-common.c         | 20 ++---
 include/media/v4l2-common.h                   | 75 +++++++++++++++++--
 3 files changed, 79 insertions(+), 19 deletions(-)

-- 
2.54.0


