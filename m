Return-Path: <linux-media+bounces-67437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EE16GnScVGr1oAMAu9opvQ
	(envelope-from <linux-media+bounces-67437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:06:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A906F7487E0
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:06:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=oFRdZ0Sy;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67437-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67437-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18231304456B
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D365D3A48F1;
	Mon, 13 Jul 2026 08:03:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA304CA52;
	Mon, 13 Jul 2026 08:03:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929836; cv=fail; b=SU3LoLASpJQVPavPV5u0/X8nRD2xceFsDuCJRwrC8ryrdAjcgZYpT+o1Xcun+oIMIR9WNRiejDSuSz10ekhDxdFR1+4UCOCotUuWZYU0EccIR9wRq4l5SAAQklcaLx4cuB0L1OFXE/DxJdrNoa6iDXRvFd8u1O4kIQ2cJoR3qto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929836; c=relaxed/simple;
	bh=zfjeIZ73/5+VEPBtQ3/5/7Y3qV6S/DVz0zJE0RjYKcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t+R71nLM5uKD8g8Uz2DwlBeMg1mDis+SiiOdmD8MmZQ2CnJ0OxzRgLYTenMiVTLgeQe6Qo7u+bmxETQMJmzBxQyEovJF9JjiCKFKq5ewtU9y4fvuWv+d93dfGb2vjtwdSpbFDwt9g5H7RxdOivaPtuaGm5mYwBRgrvYHDTwI5AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oFRdZ0Sy; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hecI1H3OEV78tq15wUQREeor8j8W99+f+XYKzLqVG2islkG+JsIiuAIqX+zuYR5Vj2lIZRTpbANxgKDWZQ0T/9Xo/gutXc2vk5iMLDfKRWiP0iqGkU2UcgzZxAO7VzRQwzy02kOgOpn4neyZ7rO8WUN1Zwajb0g8RR0QVTtWjAeqDFVH/TyjcCI0Cn3KN/uU4ksjdAUT0dT2X5WOxngrI+2mG/FnNTQ+y+SxAcRbL5Yi/ctInC3z1V8+avJrMU/iH/S+gEue3bJailziaCcktnl+JgvWCSZodc+0McVAErJhylY7XgQ5ffZ08NUsddg6UgspjoRr4YxNHYgaSHq2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ux8mihsRPfeE/0VHpurVqMSLj1DZKhLQqgZnyO62k4w=;
 b=w0JVmJL23apVFl/2t91GFNP97mS3w5GnEqCCgpKi3tLKfNXSyuNcOXr+3RHAS0kko/aN4IrYCgOtBbtH0luWOEr1c6YgsdCTRdWyU3O+I0D68n5s+7SxfmOVe46fsrZnnltOZOQn0FRwEOIND42DqCsI/ZD6HJgwhZc7qRskMd++0CbW1zjsOVJl+Nx80XKly07LQyw9M0bjLopdq6ZEtCaZ79Pq0Y/RxZkRflWvCbV6jJtzYovPF7KrPFcF3Oc4m054I+bEBIa+o4huj4j4lqM+vHzeqhV3qT1QbUGN0J1NClFRhUulciObxtzEoErHhDrP212TP8FeZUPgANvWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ux8mihsRPfeE/0VHpurVqMSLj1DZKhLQqgZnyO62k4w=;
 b=oFRdZ0SyBeRQfTxhlCK/Di3D5XeFD2sRAE7IYuvGwBFEXSQ/gtmAynIWMvM9LNvHdX4gfrlBKxTaEniGjfexMZpZdG20ByeBZCOLdbCr0o0GBC2gLhsjoe+JLUC81dVwWbQ2mYK8WsbGN4MWu6U4fg+T73X6Zw0tGWNMkKyFUjA=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB11657.jpnprd01.prod.outlook.com (2603:1096:400:3b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 08:03:52 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 08:03:52 +0000
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 4/4] media: rzg2l-cru: Align bytesperline to hardware DMA stride requirement
Date: Mon, 13 Jul 2026 10:02:53 +0200
Message-ID: <20260713080259.21835-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713080259.21835-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260713080259.21835-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-MS-Office365-Filtering-Correlation-Id: b287f02c-0872-4244-dbed-08dee0b54734
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|23010399003|366016|1800799024|18002099003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 HjcPeHZbvTVj2duljqy8QfqPMZspYypuxFHZkGIrMERQwAlRGMewlb6Ei3iF7FRiehaXvFugODgoyS30jYaPKBbINQ5ZTHL0UJR89fho8Bm1f5J+mzlLZQpQhCoasU/EZHfDVFxtuK/iQd2yGF6bn48xRtwyzRkTvOZktN5H7F+OXmM0e9Jq+hJt+4N3Lj/f7WJjEvDNxciLYgWfcDa5BoMnblbBWDRVNXY/+lP5AkyBd3DgMjyXbLWBiM16ffigOs7As8vVq56VgL+eo0UnVjQ21wH8MjKg4dCkuD53Bccr7pOEuIgQ8vQ0pXX03/rjvVEk/Wc7kOGn0y+zJsFBSKdqWvchT0JwKBDjvIHAppi/2ZesKPRPmLnES7Brl3q40K/yar8ulzBAGAOBwTL06CXU2E0sH/ScijEVsgyvMQKrApj9AemNO1XydwJAKGbjkxrjyZBnhinPca4yCB9242r5TaD3wAiZhCbcYK9syIB27zlKcypswQxt7ynCCNlmSgjJRaKDPwhW5E8rOP9lXYtSVqYFqUVnR8Nbb57su6rE0tCSFesXPXBXGWj90d8xwp2BjD5uqIcPqNJPRTIVb8QB+l66M4ElCE6UbGpGU875M4x7Cw1L4/8oERksRTAPH7fwt59OfogA6Cp4TfuZN6Sx5NitiSW7iNAApVV22fEd7VnbZ8U6EuNm0R9Mdb1ngI6K7tFBQK2a8DGzqa8wIyVtxjJcQuAFurWOJ2+3138=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?htr4ZyvF69nAauK4Kp0PL2X5s7nzGKYA2X9Q8M+lr7BhYxljtbtN67HLygFj?=
 =?us-ascii?Q?7Mus7wWVOlGvWVsPxOPpCpgjB4DDKPe/hVsxqqsh6nnYwqYSzS+Hy067Zv1j?=
 =?us-ascii?Q?yk8Qv8NPTytQ1JuAqQB9aDrvrlCOQgHmhm3Vy5YwQxFCaQaPY9qPMPQYv6A1?=
 =?us-ascii?Q?aRtyMtgj8BGAZ8VjEXrPWJ5coc+Ui/DAhTLsSdM7/eqyG1B2eWST3frhut6/?=
 =?us-ascii?Q?u+oYEyI8sbzviQgqyBH1gCdk407ibeKsm3v+H6H9yw36pLjbympjQuGeEhff?=
 =?us-ascii?Q?dmipdw+ETAHtmWdnduogfN0JXVdaK9vN8hQ8/SOuQDjlobWp0ESFzQ2kPxW/?=
 =?us-ascii?Q?VYtuIAWvSjZWvng1kb4KwGAbOkI6vsy+P6qfu/FR97rpPxKVdBYCA0d3Gcsn?=
 =?us-ascii?Q?Ahe8XQS6fYnNKFTLzPaA1+VR51qPAwI6YZTEjVEI/4F2ZwKsHZBP5Vi1WTCu?=
 =?us-ascii?Q?FPu/kgxobnCjWvfcRM/eitNleqd6AXora+Hxannu6mVHF69WD+bNxf2+kpl+?=
 =?us-ascii?Q?zMHMuGXSrOQGPQFRMRSxJ/tXqXmVgn5bX1Vf4TLwesFGEHufrysICnNY40Dc?=
 =?us-ascii?Q?TloNNF2kkNJKtohoO5yN31fGNi5uHEo61xMD7ayktD0Ztds+ZTR0GOKBzmQ+?=
 =?us-ascii?Q?G8QE0jpMO1Or2FBHqsPR2mtAwrLpLhUQ9tpq9IbUWnmBMHiHrHTqCrF80SMk?=
 =?us-ascii?Q?9On30VW93LHnFffMrp+c02XNYu2FAhou32TqgrN0yq72aMELCrtzelvJb4q2?=
 =?us-ascii?Q?/iwJDyPDXfr2fgf9GPrzjDnS5qhye0LzmZqk+N09EhM5oYn6TQo7FskgCEle?=
 =?us-ascii?Q?0b04WpwrU3VNudS8tgV2iFV0wbcNtpMYg/F+3g2LmGFX9k6cdomVY+3vO9/9?=
 =?us-ascii?Q?GBnwCH3cCHTOxKSvHoABpkH0dyzWlc3VSMjkxQcI7cdxFHlgIETkvM/ZoK2k?=
 =?us-ascii?Q?kYmQ38Dc9F2b9FfK3My3/xQmSPAjNBAyMOtKhWluyo5yBRhPD8xKCQYx7vYw?=
 =?us-ascii?Q?vRBHVsKE2Sy6oP0X607O6Uk4Sg7gwaNnaqTEuylChbv7++6mNqaBkKncNPUz?=
 =?us-ascii?Q?q4YXUSJrPqCh2xs4G36ZE/5jDaTB3DdbsmF56mMTEQPtMZUy6LJyF5h0/7f5?=
 =?us-ascii?Q?vFhSjHEAtTFc3jXG0kuRrrYBPQEWC55je9qJDIAAlVVIBQ7lgw0w9Llmnkwg?=
 =?us-ascii?Q?9uuVccb1WXkVskxR7cvJUPveUHDMOLkypTOPsxoz6ibQZLMmzoG9kRsF/xjN?=
 =?us-ascii?Q?+aq43gMBVdCKCl6nQceql1+IDzzxjE5mnJTq7pQP+hBV5pywj9MLJAnlPITR?=
 =?us-ascii?Q?X2SytpBXM3Voo0PBAopA1DiTe/gHQtXpmMxe9cm5ZzITPppKR9MjLGxPZIjZ?=
 =?us-ascii?Q?HhMj9534X2FoT31jj417f7J4jKU//7IPjRyPDFS4ZiLVAQGXmXTaFxFCpoS4?=
 =?us-ascii?Q?O3fMyOBOqLNe3n3wKNPyQ+VpQeDp0yQg0vvmgO8PswmpMQXMVFcrjLUP3KO2?=
 =?us-ascii?Q?Fsap7vaO4Dp1075cDJk67eLRz0EUEePONcOjuO7Cdx30T92CF7QrXGoMyOf3?=
 =?us-ascii?Q?XB5q80doS6nFJcQ56U3GU4GWHC9F72gqF/zF/DJ66lgZ8n8ux5ffrtg+lnx3?=
 =?us-ascii?Q?KyadY3oDau+uAGf9aeuwgLW2y3xcbzZs6DMRM2mjZHkvsvW5H/NOQHW5Q6wf?=
 =?us-ascii?Q?QfNBa7ZuNBFBE+0K1NKAs098NXO4ce/520gjT583EmDnecTRh0ba7nMZtFR7?=
 =?us-ascii?Q?hEnYG8G91LaMjTyzf5wfMc9hXqALyUEeh42XKZy3UI/JLpNEVJxt?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b287f02c-0872-4244-dbed-08dee0b54734
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 08:03:52.2551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89iFo08wlLLkyphIpv3j2jzUyiEjdA9oIxg2AU/vT748a3ORX4JQZkuMXeu7wYELVl9rCSbN52/Wqtql5QpRBZCO+MkFQKgdIb2H4pQ8faakeE/KA7DtXKgD8VANOUWt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11657
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
	TAGGED_FROM(0.00)[bounces-67437-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:s.pueschel@pengutronix.de,m:m.szyprowski@samsung.com,m:mehdi.djait@linux.intel.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:from_mime,bp.renesas.com:dkim,bp.renesas.com:mid,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A906F7487E0

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

Cc: stable@vger.kernel.org
Fixes: ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Collected tag.
 - Rebased on top of media-committers/next

v2->v3:
 - No changes.

v1->v2:
 - Collected tag
 - Add missing Cc stable
 - Fix s/commit/Commit/ into commit body

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 5185a547461d..27a35ef2a6df 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -849,7 +849,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
 			      &pix->height, 240, info->max_height, 2, 0);
 
-	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
+	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
+				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
 		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
-- 
2.54.0


