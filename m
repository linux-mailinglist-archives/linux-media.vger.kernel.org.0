Return-Path: <linux-media+bounces-67054-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aM1+Jwd4TmqQNQIAu9opvQ
	(envelope-from <linux-media+bounces-67054-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:17:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D3728950
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:17:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=cPho1Hya;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67054-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67054-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC5703025ACD
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 16:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CD742DA25;
	Wed,  8 Jul 2026 16:15:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010056.outbound.protection.outlook.com [52.101.228.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE73A41CB5B;
	Wed,  8 Jul 2026 16:14:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527300; cv=fail; b=rq3bQTPTwqVOo0WaajVyuBmbkytaOJfWhUKLXAd9ISiUAC4bt+m7fMfF4gSalCIOfdq3vHfOlpJRN3Wld4wy0EZLFcfWGg0TXHfvNmgbd1zWMRcglx5gcFM21cHCz5mwwoMuFxJtfY1y60GCjoZrUeKeylrl36ud7cy9QUoENro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527300; c=relaxed/simple;
	bh=h1TTlHZ8LphahUM50iI7+M7sasiXRDBk7hT17agmbc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IaOc7TsrIbB6gaRTwe5Vo2bz/MTqHUtIaJamBmfTYSy2eDp0lTyONPPPK4dT6AjWqX9C7zPzVNEILgVijcALW6eS8RoEDO5miN48/F+jz75o3MwWCDOUcYissL5Dr3HWfYrXS6LEiwZCsx4XsyUpW65yTY3Dys6eVCanYEfXT6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cPho1Hya; arc=fail smtp.client-ip=52.101.228.56
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKRAJboiyakHVnqmurLdaKDU5I64BrKA0vURN46GvroATytPSR+Scx3pJvexJUahyC01U0+rIH//iDfGH79cItYoCKixF69wfHjP2/4isDFtLr1xIaCBU/x2LYwo61aSUIVlYnjnUWMOu1tYNWEBxuuPAwEkmtQW+XQaDTko3AfrwCbAC4daIsWJ6OggkRawrybtbcROlZH0Sj2BZSjRw11BF3fEiwg33SZnNcbeG1iMlqojitCE1Ztq44N1j10ttqYMxJ6/7VxKhwSM8N8rgM9tiAP/TvFjC72y93HdazSIMkrxBdFiU8+nmq/JVZL4RqoEB3TreShP9fs/+BNWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBKFNULemZ7wi9WD9PiZ7Avcz6O4GytUG3cCJLE0GsQ=;
 b=ksdDruW50xetEhDJQcbMymyLo/d59/wOFLa9TGOnVB1KXdPqGTLurbZ+tYxyRgvRQcL5EVvGu1ZiZoV25s/Fz0jQrrfRD1pBQEfZu4a9jIrFs3e631G0viAruwx4EyvdtR5bCg5UoemykxVDWq6eOwNcTHpRlYcR4LUTFJoaCxnckrp0u/3w924GM0r4Wm8myk/dDZ+pjMe025uFnDTYwf2EP3YGqNTc7cWKnbVBVd4X5m1Ke0d8ktt/ZKU5pJZiTVY7lGVvHe5e+qNdxFkdA9SEoeZU7ZzmrPJIFALrvnOy2RGncofbffbioROLNrMhViqA4dIg03vV5mM0WTJ2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBKFNULemZ7wi9WD9PiZ7Avcz6O4GytUG3cCJLE0GsQ=;
 b=cPho1HyaGuSzAV0upgwuWCo9b4CDjqhgR4LA978Gbd0TelJ6g0UrZ9gtGb6jAT0pIz+8oAo3qsJY9dDQbq8McO/Ii19rgELV0h3TAiowR28vjZQkBNSdFDWQ0otkbue6ZEinuo+75TvxSr8Y0DdUiFfGYHaWf0WneLGxKH1yvXo=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB11590.jpnprd01.prod.outlook.com (2603:1096:400:3b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 16:14:56 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 16:14:56 +0000
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
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 4/4] media: rzg2l-cru: Align bytesperline to hardware DMA stride requirement
Date: Wed,  8 Jul 2026 18:14:05 +0200
Message-ID: <20260708161406.396183-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::8) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB11590:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4b56c3-76dd-4836-d179-08dedd0c0cf8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|23010399003|1800799024|366016|38350700014|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 hG/zhIsrkDf4h133LZL7nXtekrDqQNdaz+6zlyqdP0Xa2wRAjgz4d1XzfFrmRaSVfMbC6GdxpIDugA0mbWXNVJ7zrPWeslYpZvQW3uXOOxuGwyyGkOSzNX7iedpxBqWbBSOX/97VGqCPZS9Gy+SogbVklimNAVMJY7TFIcPcqC/AbMWsin1/tfmupx8H2kR6kxo3/FYCsZK4Tk8fazh/u/0KJFugDmae2XUdJsF8p7qqkBdd6iYKlI6Hqmgsdf3DrGZt1i7BU1Ag7RqSaRZd5MTUNRABfAdWDndxKLX9RbT5UQuNc7aGkrfniPa9CSa08Fyjo1wjWf8cuYFCiBpSjlfy6pfJM+RWBvvwaA9NiElovOdW6vvRufh+dbK85f8ZobHE1zu7+bN7IX6K9tm4Lgkw2XUwkp5V2FcbayO+T64+OHk4visYhJPSHcYx13bhLp44bawCRuC2oRxHI1mKPw1raTuVqTFT40YGjh24gRZHVYGCstJ663YVzO8+c+m5FDlVFc7JaPI1O9uPm5z7EERd4B4YmHm8EPPSmEDK/f59fPI4nSKYzSMPNk+fng5iCeS9ChTWR9xFzvxIIQsJWSHA319UaBDMfynLU6BneAHTXDviD8ko1TRusLqsnAR1b/Qt2j16BvOdbXb9Z6RgfI2UgFrKn1b+tnVqxGDYEjm3HDzhd9be11Gq4/Ilj6AQFn0YAoIKP/PyaPRatTCHz1vIAW187KNUQj4W0H4dus4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(23010399003)(1800799024)(366016)(38350700014)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?TX0piT7etPvFq/HARLV3jeNT4HBDabpve41pMLDtiGygszyKM3k5Mbx0srUn?=
 =?us-ascii?Q?gcB1AGRW0+coefuO4htbAnqnWpkbQrKW20Wxu3+0D0U/n1KD2msvwQeoiV2U?=
 =?us-ascii?Q?fl5++/P+twWbYu2ARRxZmNAO7Za/pAKx9jVT+PHpoUKiI39mVpdPBr0fSm4l?=
 =?us-ascii?Q?opg1JwMgCequ6IssXN42POf+BypeBQyb0aul9Nu1ADr9Hkg/ScBDZwQ+eMfc?=
 =?us-ascii?Q?O2w31IUyO8Hm2TLgFLSrdGAuPQDwgORu3ZXnFuMOPF/ERbjEGMOVHeOnIN0S?=
 =?us-ascii?Q?4CwtG45QLWPvHcmaXjUKeDyjPQNyiuwWbwLmDRGaeXQlNiRQz/YbTIQ94SYS?=
 =?us-ascii?Q?0QhZKhkkda2Z/i8K94CQ6JRM+dg8o9m6llpB+LOgaGtPOMB44tsQFIVYpeWw?=
 =?us-ascii?Q?MxG0zN2ya87q/scxuakbHtSH6iaMPOAr+kv73j+27jZrqdFa1amdjD+cbb61?=
 =?us-ascii?Q?PF8YjeAnEYHKvAH3eCqlnQx5KyKqF/qbLAxe8biecnPjegGMrAOHvooFLjB9?=
 =?us-ascii?Q?LWftuRe945ToGRMRmrGXlkpjh2MUuZGJNLD3UMCjmLmAYrwrbsV7CiZpYsDP?=
 =?us-ascii?Q?qkRo6R62sulkY5exHji1iKYmYSxbjIkQ+FZ55uE3LsYf0ZfpvG0amGwmUCTC?=
 =?us-ascii?Q?fjGFQVC7kiApQNEHlWahMZIZbYhAzjuA0ooiH82yGUqE2SWJ7Xy5qFyJOtrz?=
 =?us-ascii?Q?HcOWw8RjObnC3OwDr5Q4gZIoiTVDXn5KSjsKFwsSWJ4s68gd/42XDUo2iRiU?=
 =?us-ascii?Q?KJzqUByTo/+UYLngyHv2jpLm1h8Fqn6VoUoyS14NS4LzLdLlVEgJfnZGHT8A?=
 =?us-ascii?Q?FwasmHJDHmy3PbzUqaK55MSFW4d60sWgrNkEE9M/Lq4p8fzM5J1LgcXBTbEg?=
 =?us-ascii?Q?LteQTW36jMqe7gcAZwCbrDxOexgDzAUUwwZrK32qQq/H1e6NV/eVG0WhKAC/?=
 =?us-ascii?Q?7vr8Jn9Nl/uC6g+uezg5X7sYzCFyYbl4ig64d20fWCSqtFoWnyvvU43QyT0e?=
 =?us-ascii?Q?KpSZ7kcw/E3isQTBun36nGF4WgWc42ddmHspG7xLxfduDTSCM4A1uJD7TWAa?=
 =?us-ascii?Q?QUQahqOS7ZkvcCciF13ErrmcBOMyjDptJDAFxHp79CHoiLA9Fo4+UoXluXI4?=
 =?us-ascii?Q?CPDxPnBA2KdqSXPeHWpPZROPdBaiKrCHtvSCIxazisgm/LMNgjYEzTJvaOlk?=
 =?us-ascii?Q?8txI+ioQwI43Tdf5UPEtky9nf0qvttijmnwoX+1UzkJ10YXKQOlppC84aZlw?=
 =?us-ascii?Q?HYi9Q1OA88spvvrgeT6799K9kNguDXVLt7E21SXhEjzgIyh5Yn0XtaNZitGN?=
 =?us-ascii?Q?4MhYx57o3d01mpE/wct9N6RTj+XRrqTCtbozOe5DJk34Zp/TOGj14bFKclHh?=
 =?us-ascii?Q?25YwwL71kjjf/unVarNFadejTW3r03CJ8ribFxUgdzqottiyiOX+AV5pYHvh?=
 =?us-ascii?Q?d6K59DtJjOmJWr/UpfSk5qGo94UXHCRtwgXGzRjXSbsyqQjhw4MZ/aNi3IQn?=
 =?us-ascii?Q?X3q2nI3WUYBxT8PvbjyHMlg15afLP0qA8v+5/5ypiWHTpTzGQr/7gOgNSQ24?=
 =?us-ascii?Q?8yqFfpyVId2prlmMH9Zv6dqxU9jWIXMtKjUzplz4h8ZmrvUzgxmIvTyInO29?=
 =?us-ascii?Q?xF/WX91zDWcRxYvmP/83V1C6C14ghHc0V24ApGPv3vs8Ws4AG8/hj6MD5y7G?=
 =?us-ascii?Q?WBwNwKDPi30EjrX06khCrQCY+8KmZAlTSbYpfbfTGgP7qU0fjI04wnoTkgcn?=
 =?us-ascii?Q?qJa6bHGCm+fCYtfxPVBRTrkDgUbwHUO8jAXj26H5jiF3NvIO4VbB?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4b56c3-76dd-4836-d179-08dedd0c0cf8
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:14:56.0908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h492lk3AcvvTo3UAeRmg/kzYOfIzg2LtYusQJOGDZF3tNsXIsnr1/fljPUe7k0bmEGqGeJuGO5L4nALtSyj7T06k7QdQ8+cc51F2dqSB+2Ve4k9cizo47jUyqiKJUAHi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11590
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67054-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:s.pueschel@pengutronix.de,m:m.szyprowski@samsung.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:stable@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,ideasonboard.com:email,bp.renesas.com:from_mime,bp.renesas.com:dkim,bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 705D3728950

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
v2->v3:
 - No changes.

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


