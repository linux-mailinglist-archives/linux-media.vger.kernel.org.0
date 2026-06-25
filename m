Return-Path: <linux-media+bounces-65629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gISkHh0LPWpMwQgAu9opvQ
	(envelope-from <linux-media+bounces-65629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:03:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F746C4F2E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:03:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=WelusR4S;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65629-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65629-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9D463047E6B
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 11:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E84920DD51;
	Thu, 25 Jun 2026 11:01:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E470E223DCE;
	Thu, 25 Jun 2026 11:01:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385287; cv=fail; b=N7khMVgZ96Z2GGadRfEf2DNoQLOcJfFpZnPv/iDBpppBqnXWlQZ/zOMHbtNkSw3b4wb2inwUz00gFy6HEVMqHouq+Y3m2Q+GFZ7w9TBJ0CRDdggYWbTo/hspB5xk5V6FQQ0W59krTz6joZOf7RsHbaHxI3bxOyXu65Sw9io71pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385287; c=relaxed/simple;
	bh=Aq/+YMDtrjEbYWF3PMu1xJiPMJEJT1b6H6HPywfWWfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q1ybKpn9NTCcQWiU2jPu+OLbeTMgq7pZ3jompLFHWXMU+LzO7bKqxVGdVCVKZCpBIUxKWKacJTALuZMwmk2cSODNCgIvHj8CFG1oOmZgWPoiEyOuOtgyQWxFVxMklHHkCNWA+wPGcafMXEMXlXMSFbYE+EmJQkcHHSzjbtpYyGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WelusR4S; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmZqGHFFOzmQ91oOUbH3kPAKpTm9LnlFc2bKfV2p+zzn34UsJyW1Y94nOEIUXDTEYHLwanrDxy+w58u89njc14/SWFNXdUYO8U+4AaRHupoC7/JbHzabQvd5HVoMcTn71RWtRs7zVcVKo2jgmzmUPfyNYEWisAcbmixE7Rl+BCT+WYHgg8SEQd5wM8JbKYHYu5fkfgZ1gtSQ9NycR+Oc/95p/NvTuK6iLUe144V3srsfFuf2PTF8/TIPksl+5Y5LJL+sa/A1Fe0sNod1nqrAxXwMqU3TXTHOb6MmNTTLPEK3JA738DnTzIpR/gHVWoURBJOQ8oZzDhiu0I9F9LG3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeGkZlBIzeAQtHoCDiRD1GgOGKVm/yqUV6cSLGKUgug=;
 b=aSaY9MdeFQkPSBeeylCq2Bf2JCwQJiCB3VSVwBusTDh6Sb9EkRL7Yk7kE1BHLm/yzxkc0lHh6wgKfUXCQyPFRLWzK6MsfiiHOx4i27912oSmmTLyQ59UhqygIPbiPWjxFrBBgcjoTG7B8r+JhBMlApSCFFgnkDX611WbruMdq+Fnh4ohi5AqiS2k/zfPezzAetdAhY5avbnuhh3XtzL0eT7COFgGO35q5b63aUgZaQwHBljWhkvnStI2hoJg5W9hil35FNUTMjIvtVsvz+XNyiaE4n9Wb2BlmX8jGyyqA16Zdf60NY2CuW//UfKIruhSE4ll9g3CuwPM1QZqh18gmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeGkZlBIzeAQtHoCDiRD1GgOGKVm/yqUV6cSLGKUgug=;
 b=WelusR4Sj4L1RgtE11bb2sidYbBnYOeiYtKPR5ixddHmIHSCHUkrJ7RNJEVQFaQE1JOPXiWQCepVM3abTwQk4wPvbS5r0hx2x9mDFg+IlPpO+bWVKUvbzyKC3vKa/BzSpwXek/95k/vsRpZ8A9CmBk8gOQm2yj0uR7m4B2gzbSM=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSOPR01MB17772.jpnprd01.prod.outlook.com (2603:1096:604:467::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 11:01:24 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0159.012; Thu, 25 Jun 2026
 11:01:23 +0000
Date: Thu, 25 Jun 2026 13:01:09 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, jacopo.mondi@ideasonboard.com,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rzg2l-cru: Align bytesperline to hardware DMA
 stride requirement
Message-ID: <aj0KdVH2H4AJ1Vdw@tom-desktop>
References: <20260624104153.798953-1-tommaso.merciai.xr@bp.renesas.com>
 <20260624104153.798953-3-tommaso.merciai.xr@bp.renesas.com>
 <20260624195334.GI851255@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624195334.GI851255@killaraus.ideasonboard.com>
X-ClientProxiedBy: VIVP296CA0127.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:359::12) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OSOPR01MB17772:EE_
X-MS-Office365-Filtering-Correlation-Id: 8904864d-117c-41b6-013e-08ded2a9188f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|52116014|376014|1800799024|23010399003|4143699003|11063799006|56012099006|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 MovPt/Zp9iy/564tyThEVjWdvlm5Ec49Qm2GDsE7ZYWp0eAUcBvL/RnajbMX78f4M0p6nFTwkjGBQ5sjmzpOrNqgoSRyL+t2YBj/nsPSr74dB56NYY9VYkEQRI/F/Y+f7VLSmn+ZiBUo4qowJCMRMOq2ghqBHjY9Aruss82phdHhm7erHo0nj76G34MDizkeBmK8oiaW9SMHH2YLq+GMDITsE9Tfgmgvyn+jUqINUWYxU6icRWR56cmk+hVjr3j6dsqkpYaV4nsGzUaXl9evgWi+alpUJQSox1m1qsAVQR+tQeIGbYpQfbmXcpPFDbJ961LY3f1xXvubrx1PEDQFTTSgCrAv4g7JfxgymG+vBMIIt9MBy0s8QgkSIT2lMSSDyqBx6RCZ36hrDo8VgjBYktW4SkTk7VxSabRfDHyb4LGhS1smqf6tMZx3IScbJHIFpY4B63sBHPk0H8CRnjP1sMF9DMUjxW1ZRRQMs7vqimPu0fSVXn9DTd0nhURmnuo88+NlnuWjctnB7xlGtx8fWAe1JKVQ2KSG/DA0h3o/Rioq/t/aw7pqNYaAgN0b+QrfN2knofhDGB4a74+ReAr7lErXWRlaR+QVQBi8B0lagJK4Jch3chaJxzqLAhWlDt7ZO1WYw3BJ7YRdDSci9D12u1dpkv8LsDbEejzHW0DhrZFnUSFu8W4n25uxrURe7IgIzm+n+w3f3DJ/GKOy1onAwfxdBE7vofBl9OPKq5RER9c=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(376014)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?neI9KzcvXMlZA85YyJz3lpdyM9sjkCn6FUm9pYE9RiZhUm04iXouQY/4bOjQ?=
 =?us-ascii?Q?cqDbwpJwb6Cdhf5bQrIdq1r+b4hD+yhtknYZv9PV6ihbvTX4nGExo6Zi3SVr?=
 =?us-ascii?Q?FDNvpJeVW/3QfWqeXZqPplBEZH8+cdg5jrKPMYY/RLUM1F5qWgplxor5MDve?=
 =?us-ascii?Q?ILQg2zpGNfB6jrVoqnBbKT7UISIQLExrQ45yCk6cvJt8t1kQ1WK+xwCSnFlQ?=
 =?us-ascii?Q?5JRsG7IDb+Oypbvd9thYi2hrIyop5jZQ4EtSiRApO8aEoPpJTefLDqgdiHdk?=
 =?us-ascii?Q?qi7CxHinHVHFHJvSUd4y04qA3b/GSy1BUZbquTNuDxVM9aUqNbhJjx9VN/0o?=
 =?us-ascii?Q?N2wM8Pb5azPgFd0YahIf8tUGoxcilr+Yij4B43DgljXkXLqXiiKYCQl1BREE?=
 =?us-ascii?Q?jBsCLQiicv1S2OPYkdpZd5ndONthEqhAuUMVuxCyvbbvMzzpoY0WUWzeSTQL?=
 =?us-ascii?Q?R6sTqG7APr/w3D8u6wMjZwECWCBWmj/TjCQgNDLQTnuhRznLygLpkYBhOmOI?=
 =?us-ascii?Q?fIsSSqB74NKVCBrsXZ2kWmGV5Xx2S/XWJWCbMwJicpQn8/k9Xra9WpOSpFw1?=
 =?us-ascii?Q?jBIofZ03+XRa5dxpoCKVTN124egH9KG/WpvSk/DwFk8w8ah4C+RTmnnl+mm7?=
 =?us-ascii?Q?rEkATcmmGoUHqUNXFrXqDAP5o3Cj5846D4B7T0JMskQpbvnBYR7+RIs1DzD2?=
 =?us-ascii?Q?ceq70XA+pc/WbOCLhK6oofXPbB9MJjhR1GuLJlWnoO+goc+9VRzdH88+ruPu?=
 =?us-ascii?Q?GtTRqHG4VdHIgrtNBlq4htmyG86TnC3sKObObN8+DYg4RCf1EyA93f3Y7O1P?=
 =?us-ascii?Q?zfC/O0k00s0UjuWXQhby6m+GGuv5eH7Yn/9gBslJ9o88fzq+l/1oqcKsokmA?=
 =?us-ascii?Q?hhtMSIku3iCYcPHPk+lZJLdMCv0v4iMvkS1L/uVQQhx96j71pyqmtlg9or9I?=
 =?us-ascii?Q?KgBy/C1srZu1m0YyIz3hCR39Ckq6xFz55PE8xTK7oUMm+SgcEi3WibrqYv6s?=
 =?us-ascii?Q?vBSaY6b15fM98Cb+Fq2T0ZXUvjXT8YLmeYbr+810dq5AwmRgBHkE8crjT8AI?=
 =?us-ascii?Q?UhNHnvff4yr3XjoUFxx7mTQrVrisqVq/0RlmzRXUyA7R37WG3FRNA5MZHbU3?=
 =?us-ascii?Q?wt1iSxRLN7q/DXHDlCGuFfrzIk+mSUcUBZhcc2JI7JNwcmbKlzyHlLyrd3pR?=
 =?us-ascii?Q?qwi27tDIDLM8R3hfkwilSLZPWxgAaj61rdO6lL3iKblhvuCmdIL2pme3bHUr?=
 =?us-ascii?Q?X+bkE6ov5Bb+7UiaaBC4gSCfLlodrvttx6+lV7h70fkeI715pQThv/RK3p6u?=
 =?us-ascii?Q?oL/87xCYVVDVonB+++XvXN8EFlQqlrF1bivIxv1PpU3jkOLz2Y1WDWLscKB9?=
 =?us-ascii?Q?79OXNp14xxhfjdJeVwF6bu2c1GNr6CoDKtuTNe5E0z+7Hvb8ho59LuOMb1cH?=
 =?us-ascii?Q?f0qlr5NHJ088mbUuuXf/yRe+LIh+awJ/5z+01X/4TlvIrxe0TgWweWklLZa+?=
 =?us-ascii?Q?aaGQxg3peIKBPp8P7Thb/2ixUEpya3+biGNDkQgpwZiCjkQ5Omk7O7RZ0ilk?=
 =?us-ascii?Q?+JlvV4Uv8QI9SZ6vOWvnFJDZDSrqn4l4PEdPwnHc77Pv+mK5J0ebyKqgq69z?=
 =?us-ascii?Q?9futZN14YDJVbLiaLDlYbwGG67XSLJX3kdC+27UKUFasVBcGx+aTI6KoYHtZ?=
 =?us-ascii?Q?obwLRk7gGPhxciV7izGi+8uk9aJQ5aveujwYb1Rv8eMOAFAyrJSlEk85EmzO?=
 =?us-ascii?Q?e0AOi1nzQ0oE4iIjOvJC8D9IANsHXZRhfbmc0se34vFKXkU92t3U?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8904864d-117c-41b6-013e-08ded2a9188f
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 11:01:23.8220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWQ5qqwXgHoli6UStST5eXHcTihQmLEPqzwxnI2v+0zOk0eFiKjuHZ1M+bRSAs3/To8AVV3tJmbf8YV0KVsDh0D1n5aXf/OxSiZPmEY22H0bC42+kB/uTlAybuZXA6bo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17772
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65629-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:s.pueschel@pengutronix.de,m:mehdi.djait@linux.intel.com,m:paul@crapouillou.net,m:isaac.scott@ideasonboard.com,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,ideasonboard.com,kernel.org,collabora.com,linux.intel.com,pengutronix.de,crapouillou.net];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3F746C4F2E

Hi Laurent,
Thanks for your review.

On Wed, Jun 24, 2026 at 10:53:34PM +0300, Laurent Pinchart wrote:
> On Wed, Jun 24, 2026 at 12:41:31PM +0200, Tommaso Merciai wrote:
> > The RZ/G3E CRU programs the line stride via the AMnIS register, whose
> > IS field encodes the value in units of 128 bytes. If bytesperline is
> > not a multiple of 128, the division truncates and the hardware uses a
> > wrong stride, causing horizontal banding.
> > 
> > commit ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")
> 
> s/commit/Commit/

thanks.

> 
> > replaced the open-coded aligned calculation with v4l2_fill_pixfmt(),
> > which sets no alignment, reintroducing the issue.
> 
> I wonder how I missed that. Sorry.
> 
> > Switch to v4l2_fill_pixfmt_aligned() with RZG2L_CRU_STRIDE_ALIGN when
> > info->has_stride is set. RZ/G2L has no AMnIS register and keeps using
> > v4l2_fill_pixfmt() unchanged.
> > 
> > Fixes: ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 69346a585f9f..478264f26466 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -860,7 +860,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
> >  	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
> >  			      &pix->height, 240, info->max_height, 0, 0);
> >  
> > -	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
> > +	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
> > +				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);
> 
> The documentation states that, for RGB888, the stride has to be a
> multiple of 384 (3*128). Shouldn't you take that into account here ?
> 
> Also, for semi-planar YUV 4:2:0, the hardware seems to use a stride
> equal to AMnIS*2, which leaves blank lines after every U/V line. That's
> something userspace doesn't expect.

Correct.

Currently neither RGB888 nor semi-planar YUV 4:2:0 are supported.
I will handle this once the support for those formats will be added
if for you is ok.

Please let me know.
Thanks.

Kind Regards,
Tommaso

> 
> >  
> >  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
> >  		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

