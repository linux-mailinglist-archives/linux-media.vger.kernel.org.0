Return-Path: <linux-media+bounces-67135-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sqqgBIZ1T2qShAIAu9opvQ
	(envelope-from <linux-media+bounces-67135-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 12:18:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B172F801
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 12:18:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=GmB6TYLs;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67135-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67135-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 649E3305A490
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 10:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CD03F823A;
	Thu,  9 Jul 2026 10:17:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A043F660B;
	Thu,  9 Jul 2026 10:17:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592227; cv=fail; b=EqXy3KrfrxNxoGZPi39Q3HpbmBVAWyAiD4W3/47ePBdRHtNbpTAxc3L124oTw4L+3ncxUREQV5jLWqzqiyxisoitVGO7FIMczGW6Um4fLiselv6ohyHvwxyMr7UNSD7GHmxqL13uhdTiijM40O4dTolhDUmqY2H8/m25AtC5qXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592227; c=relaxed/simple;
	bh=JpG9Et5e8+PxquqxhBOzX7dDnlFEs1pIGhcFn76VanI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IYaKe5x/z41IzR2LVGkUAbtdulEAL+o64U4U5IwWTpZWI7ryvrM5MYMuHN/AFHphlYs63E25jRXq8AMnG5e0NcKODVbbwFvUSyRCLEx+TS2D2DdTOIIY5uFWU7HxWFs2wqn6VVKnJPWhA7A5Qeta7M5n32+D9TkhGisT5CCXezc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GmB6TYLs; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7t+jjHi++9kKnyK0E9HX0cEKG7Kg0elDhEyIsw/GDiLBN/+/Rsjb3W7qAki2wXIlYWAWPhgyQeYtR6KAm0SWF0tCAjHy++XSizivuJBIZTrxzTpEgr+1QVHL3HqQDGPYHMVN0hdLiRwY3HJa5aNkzQBB9CZa8M9FUl2AoVMaxmSKLl872DzoSb0MDFLigigoI5W/97EhZlskYEmDTV1C8PMhEMi6bOGzG1dMyPDMZX0RD+l2UdqMygfeFk34Ov+epBm4YJAC/CzS3Hkz1tSRL7ePXgkcGhvJKJuHk7xQrDLzUerd4Ckkh7gWOKxFi/K6IISyebvDkAa0FOpqTcjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZ0enGGORT3XbehuXWxphE6BoCqQZBGg5G9vm4QrS8U=;
 b=DPx5jZotCk5+G7POKgYnw6rFxccDx9SHM9Qsr4Quc0e6wJiKgDrbnkF+JyXWAmTyBcBTmTWR2K+fqcpTvnBZt9ldukygcFA+1RUVXnk7zvkoFZ6p4bHZtHIWiWnerpspPwgrQVShy+M6B9Wp0dkG8CNYJuCA51wFdvEGRr2ElHr3XfLKXlbPQvIHI5/ekKN8ukARF4+ccIGwXGiGbS3VGxsIL8cljF/IoSuoT/Mg4uCQx9PprI4cwRVO4HmeYz5iYbWULnF7x805TeGSpherj7I2mwPW3OZbAcoEaVg6vcw4B4y4bYB0RarSOvu0YbYnrnD7UClDs5/ZbLu8ikxGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZ0enGGORT3XbehuXWxphE6BoCqQZBGg5G9vm4QrS8U=;
 b=GmB6TYLstCawub3DbXOiAYx+qLUHdO1il3IynhTmmT3CQPXEYT8FI1brjFs00mG87k6cvxKR/ArT3kEiYKcTx25MnvNcjKFLhaIHn9DE8WnUxmVbEay7Ps3X6n1rkBgrxVwajJ5gN7SCMlHfgmN1mjkuL96T5EKwGIPfEIU9+I0=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS9PR01MB16121.jpnprd01.prod.outlook.com (2603:1096:604:3d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 10:16:57 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 10:16:57 +0000
Date: Thu, 9 Jul 2026 12:16:37 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 4/4] media: rzg2l-cru: Align bytesperline to hardware
 DMA stride requirement
Message-ID: <ak91BYMOgqJZoCSm@tom-desktop>
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-5-tommaso.merciai.xr@bp.renesas.com>
 <ak9l33lrocjxj1Gd@zed>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak9l33lrocjxj1Gd@zed>
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS9PR01MB16121:EE_
X-MS-Office365-Filtering-Correlation-Id: f231c559-0c64-4d02-7a2b-08dedda33523
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|1800799024|366016|38350700014|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 Dk5B7d+fiXBydqoovO3GEuSFabGjY6U85jm/eiCIBLckVi5XdJ/GeZ1L4vIwgGojC4BQzw/uDqJ3IzRt5bzwpD9GTuQ6ypeBxrcCtBtB4yaThoyd5y1DGaO8kVfXGUwwzAbdwd9zVJTD+S5r2cXWvrO3dy5HFx7AAiHKm+972Mu2OVdLx19V3rvN+aKRJfVjG44s+XUDRHnat6TAzTQQAuzO7KAG1tety5JoxL/NB6ESbXtb1kS+WerjwyKkolDv4abPmgEacYoZbMnc2gh3ZRRcrVd93gTqhfqsATkZ1nrEkwn8zEunFiTX0ceh6ka7tJjDfvVcHBt+0DjZWUjKJ2KwS57KdYbW5AC+1ZFQpxRw0FkSWjcCgOLHmaVxiQ3i8+gj4RtOgilJVMYCKEwwXRI5vp5KX3ZRj1UVS7njOcaORRtTZKCrJyBsqHXwzwzd4RQKBzsdfS0huVo47QvVjMBs5G2KdDSnrk3Z76ZvYzBM98R9A8nLKLUMQcpFmZp+BDxTvfbaNPEU/0q6wDN/0PZ1L3yMPixHzxHstLWhbHrjBCTpMQaxOWWGHK6GNGkMsXFduopjCRVDZclsJqLRK1XJMAeGiZMjb4oOPWj+zkNHjz500Mvx7Fkkp83D1QEV0fojYQ1GPRNntZQ5tWgE+n+rOAnsnuB50grgDqEcE+ys+CU28nEosFEuPGf/X6YnIXAHJwmRSi7VyEgKQ5/vwIB6pYocZe+CpPIF/2nEsEU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(1800799024)(366016)(38350700014)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?YfPa/7NISvAxa2RioBq5kWKEc8ogyHMz3B154vZisC8YDEeUnMuMqBZ0iFag?=
 =?us-ascii?Q?obijc+OV5u2eIHP5XiioEH7e1zcSP+g8SjTjumRthbR71QSIj++/7p+t5E8P?=
 =?us-ascii?Q?NIccfLA2mEkNiJ1IMF521D6us3sHhpeWLak4CsJChTjdbRMIZD+/pBpLKbde?=
 =?us-ascii?Q?BbXXl4E5HHUV1Idz/xxqrfptmpFqWtlJjn0ttSDnHiPLqWh8XNzzBi+bvOkP?=
 =?us-ascii?Q?mYqoJDzWqknwiyTBVf0xsghVEByWfEL7KHqfHekl9e40CnBr0Jn4B4Hi5XSv?=
 =?us-ascii?Q?TU4wGniWdIz9dxT/XtNaClvqrSJZBtCMkW3xdPPoh8o+izYjQNz77d0ECQw8?=
 =?us-ascii?Q?4HprUbDlHe2ci71NlLn1Yk/9TUME8QBW8zvqI3g9OM50j2940SG32T3r/3Ws?=
 =?us-ascii?Q?AKitrF2ykwttVnF2TbvgKOlRHS5AkW3kRGCDB8jcM2DTMQEKpfKb8iSvSuVX?=
 =?us-ascii?Q?kWtVevZwMMRthgs8je/8cwPKrVInf/r7bsSaCHMM85g8fOxGFMZiWd9I0t44?=
 =?us-ascii?Q?/4P1nBXzKthCt1BFq3aIj4yXaHC98Up8M47vh5SY1bg3J9pxiXKS0Iy64KDi?=
 =?us-ascii?Q?81be7g0QNtsGcB0uM2O6m9vUHxcu27RDwEWb49xvaMmAhYNmr+Em1c6ecUYe?=
 =?us-ascii?Q?uQp4KD72n9FoufINgQJDrGHhVD9nbqfhjzuyHOXwy3agUsL7Jah17TBhHQCx?=
 =?us-ascii?Q?BMpmLOSTWY3uX7bZi2VTdy1df1+yhzhpdvKGKfIsp52G1uDOICsEll2bE4Sw?=
 =?us-ascii?Q?mryWhkUyknGEvp72NoEh+WpTX3NzS3hH8bwGiNk+uUEt8QX1rE8AkA/Vlxj3?=
 =?us-ascii?Q?QMsF8yExdf0L8dW640RVRzCVlQ9PgOYPmMNYgTRg5OmKhRffNBlk6NS2nhsz?=
 =?us-ascii?Q?7utmGrTXzbKx/sbNwlgQVi22WMVmwDYxEW/Tv4zBNA0BNWeIy1LMXMbluCbz?=
 =?us-ascii?Q?FLaRLSh/S1dWzJfz+UTkvi8M4T5XiN7BBwwyfbcmTa3m10G2BSQknF4yiVfL?=
 =?us-ascii?Q?SQ9UBzCm8woCCgDUaOzIlhrsMP4zImXUbahKuhPF60JWLtfwJuFucX6H2j6/?=
 =?us-ascii?Q?eXtT4rcmMVHit0NepxVu21noarCtyksRQUuPbttqn/ndxN7+7jIMH3k8qB3U?=
 =?us-ascii?Q?ZiQN06IG7+RtfnWL2DTo94b7eHsmllQjsb1KfW1Zq61zIxRFOSeB1t+nKjC6?=
 =?us-ascii?Q?J+1I5ue6xEdTmvwYg0vdapTITLgQol2bhdyok/thqsFBdaNS76ZZ5L14KecE?=
 =?us-ascii?Q?UiAE37drqX7KWTZdnoG5MAokfi6W+iMXNvsn6QHkE7J9kE/DBKMMOKzJD+dy?=
 =?us-ascii?Q?/tjsVPoVq+Y5ApUBWHU22ngvswLZAEZvnsfCLwqr/5KwblQdaAMgyDVXNdOx?=
 =?us-ascii?Q?q3VhISlpfQQWQ/Z7m/3eJPS3Zr78pixPE1kZNkHpqQW+pJf2K1h7100YHQI0?=
 =?us-ascii?Q?jUVwnYQCxIw1kDXda3wXevZ5L8KT0QTUuuclLwGZCvU9qxZ8VZCYpJSAgkQN?=
 =?us-ascii?Q?jy+wwB0MPRIH1GOIHkm/8GaAt3r+lGr90Q0ddO1ai1ADJGGwKo5lNr6vvXc3?=
 =?us-ascii?Q?BLh2koDCBPGJFg/uqKv3G6qF+tSfNEJnn1oGJVC6/fxuMjYusGH9+jncKgG/?=
 =?us-ascii?Q?77h4ubLJKo8wcM6HFEvB41BL65qBNVuDUT++ESSSwBeQGyi3M92JBflwysnD?=
 =?us-ascii?Q?sxK/Kq0Ame+LwQx0+bt9ixqTBI3NJyGIPKtjfkVUp4mBmqSxz3gXLQ77NmeN?=
 =?us-ascii?Q?r/A0SYn03Bo7kBhscbO2s0Vy/yf5gjq1fvzjFaTb1dD0qD5D90GJ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f231c559-0c64-4d02-7a2b-08dedda33523
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 10:16:57.7547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adUI2LO2vPpNEj0mh5qsixWtOhJMhE35s5+IIpY9tGsfOUSJsgzf6VPZu62Rd1lKrX3VNgdMR8+H9HEyh4yzrHiiI4BT5np0U0RtJRPM8yOZ7QjzkOOBdmiHPFddjgAg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67135-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:s.pueschel@pengutronix.de,m:m.szyprowski@samsung.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:stable@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,kernel.org,collabora.com,linux.intel.com,ideasonboard.com,pengutronix.de,samsung.com,crapouillou.net];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,ideasonboard.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C76B172F801

Hi Jacopo,
Thanks for your review.

On Thu, Jul 09, 2026 at 11:19:17AM +0200, Jacopo Mondi wrote:
> Hi Tommaso
> 
> On Wed, Jul 08, 2026 at 06:14:05PM +0200, Tommaso Merciai wrote:
> > The RZ/G3E CRU programs the line stride via the AMnIS register, whose
> > IS field encodes the value in units of 128 bytes. If bytesperline is
> 
> Unrelated, it seems for RGB888 the alignemtn requirement is 384 bytes,
> something that doesn't seem handled at the moment ?

Yes, I had a similar discussion with Laurent at [1]

Currently neither RGB888 nor semi-planar YUV 4:2:0 are supported.
I will handle this once the support for those formats will be added
if for you is ok.

> 
> > not a multiple of 128, the division truncates and the hardware uses a
> > wrong stride, causing horizontal banding.
> >
> > Commit ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")
> > replaced the open-coded aligned calculation with v4l2_fill_pixfmt(),
> > which sets no alignment, reintroducing the issue.
> >
> > Switch to v4l2_fill_pixfmt_aligned() with RZG2L_CRU_STRIDE_ALIGN when
> > info->has_stride is set. RZ/G2L has no AMnIS register and keeps using
> > v4l2_fill_pixfmt() unchanged.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Cc: stable@vger.kernel.org
> > Fixes: ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v2->v3:
> >  - No changes.
> >
> > v1->v2:
> >  - Collected tag
> >  - Add missing Cc stable
> >  - Fix s/commit/Commit/ into commit body
> >
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
> 
> This doesn't apply on media-committers/next which has
> 
> 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
> 			      &pix->height, 240, info->max_height, 2, 0);
> 
> in this line.
> 
> What have I missed ?

Mmmm my fault I errenously have [2]
on top of my local media-committers/next tree.

Will fix that in v4

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260624104153.798953-3-tommaso.merciai.xr@bp.renesas.com/
[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260521131911.92845-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Kind Regards,
Tommaso

> 
> >
> > -	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
> > +	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
> > +				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);
> 
> Rebasing apart, this seems correct
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> Thanks
>   j
> 
> >
> >  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
> >  		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
> > --
> > 2.54.0
> >
> >

