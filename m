Return-Path: <linux-media+bounces-65618-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TguGGiLjPGpOtwgAu9opvQ
	(envelope-from <linux-media+bounces-65618-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 10:13:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C66C39A6
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 10:13:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=gCHojUWq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65618-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65618-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61E3D301DD39
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 08:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67AA35201C;
	Thu, 25 Jun 2026 08:13:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32003364059;
	Thu, 25 Jun 2026 08:13:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375194; cv=fail; b=duPaOT26nyCT4zqMs6uF/vTaDGOm7RkUojrLU7C7yc5l2nQWibxRGtSW0f+UP95MXbQdsUA2F2eIxylVJsfUrRAsyOoD66vJdZgk7s6xLzFpwDZCgnuD2Z3sRimSXUhjnY3fXkeQxAkQU7ad8hiiYgGBl1kZAMi5dAPMacM6J2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375194; c=relaxed/simple;
	bh=GcnXFsvn0ikvWVx557ZA59nh12i/QOUJXV8is3XbOhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gpv3jwzK2ULDqaIRYvWdoByGGtoBtXNKcTEZVy+vHJBoSzzvyA5jdPBUH1DACzmMgy8HVgbYzCDlcPTcZFYQkkeFYWHuzo8vt67adM8bBzdYZtPbuOpNpmV7gAJPsCwN7mOOXgmeIzCgFew0MLE+K3OHkdxAtsynRcgkaBxBKQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gCHojUWq; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocf7uZIIXLdQTjO1YilnqpFQYYWMzGTEaWj0Ew6NUn3A8+YlFCcnQaEIiVNEjjd6iIlw7pdlTFr9rTQBN8vDEA+57SSgkUc/XfwYVJ+zZpt/VpQffAy+KOlji5T0TmX+6WOIm6IxST7fPvOKV7iMWY1yriaNmgxSKDXtp/WUk/978loiYImqKTXOz9CUfvgSr6NbkJgtupGaUtfK0OM3TFyOhVS/F9fx/o2xmrTfOZm5XYTfIswENuJuiWJKJChwV28+58f44ncaCo6EXVCr7eVx9rcZx9PtnULacu/vPlgfT+V7AvUwNff0zlMIFw0RBA1egu7AUFAojZxltPtUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj4zOAjcWSBf5CYqoWRv5P9lX17VxCxJGDHbJ2pjqwk=;
 b=xBNnfndYFFCMl9jt8I536SsoEPO7RhR0R+D4a1QGX6uzPbQyGT4hUw31yP/EX5niMXb5zE/BUxFdXgaidG0O0cdioQ0J1snDXN9iwk69MxetWT5B2uS2s+uIthdZvBkVS3s48VA7aTDao2RHnLfPTfhnEZNrjST/ifG0HibZ9bwFJF/a+XReulGFKnleNhKQ3YMqRGFQuzJMFEx7EBT3ZPOVkm7kcGrpC5yk4Hswc3tQBdhgu+HlYPHzJOynwhH1zMij5d+q9rYjlxYrPPi/oyQguSHqtVlOtYtGj1u9NgZIy/9nMgMdLtKsDC3ZnbtqZW7Rdd0sTHBv+Gq3ulposQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj4zOAjcWSBf5CYqoWRv5P9lX17VxCxJGDHbJ2pjqwk=;
 b=gCHojUWqM2pr1tl7/Z5flAwPqiHgIjPZd08ijmg963mpx0J0qlr6+qnX+HalmG7lvkQ9TN/tqreS8zD3F14+BuXusv943/IhfhAvVaQb7zwXNwj5c97qkzt6iBDadCPb89Cue1R3ikTc1KJq0cjYV0qvf9jr2x1McQHwR5wtqFo=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY4PR01MB17524.jpnprd01.prod.outlook.com (2603:1096:405:351::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 08:13:08 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0159.012; Thu, 25 Jun 2026
 08:13:08 +0000
Date: Thu, 25 Jun 2026 10:12:49 +0200
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
Subject: Re: [PATCH 1/2] media: v4l2-common: add v4l2_fill_pixfmt_aligned()
 helper
Message-ID: <ajzjAVM8F8ZPMWcy@tom-desktop>
References: <20260624104153.798953-1-tommaso.merciai.xr@bp.renesas.com>
 <20260624104153.798953-2-tommaso.merciai.xr@bp.renesas.com>
 <20260624192855.GH851255@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624192855.GH851255@killaraus.ideasonboard.com>
X-ClientProxiedBy: FR0P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::16) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY4PR01MB17524:EE_
X-MS-Office365-Filtering-Correlation-Id: 7163db22-c61f-411b-401c-08ded2919732
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|23010399003|18002099003|22082099003|6133799003|3023799007|4143699003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
 wY+PyT5mJHWRjyQBDMOx6D7eQOIh1OCwLWpMc74LlibmPxXPO6mxiP47Vc7/RJ8rqmfeQpaj2eNiU4MB13vrxoY6C4zQD04Q5tLPr6clm/Ysf8yQpSsQQScYdBYbxWzPqL5kr26EOwrF0ZSxUCSjLrSfoHb8peY8BslqfDO/GaHyTH/G+aFVmZPSyN/K72gsClK4r07EHYfhZ2tm/AeKEGuCU1R5n3d9elWYr3B017qHmEL4vKqAjQSdIsm1J4+KqsWUSNEuR/p+RquyNMsEtzTdTqkdknnNOVTT+GjeKIpm3cSn3iYsF+L3IWDOjrrZiH20QmIuwKw65AtwTK6CjCy92Lbcu9dHD8y5ih+1tXIRo/3yOWDdKZhBqU8wHEsZ0XVRNkhqmynsUNGPdRLXVZxptjmc5LpRtjGot8W56eie2Aqj54736dwM4TNSCermgK0OeW1EJjz/eP7mNqS4HmdYkVLGAT1K8TwaaNEG5HtfmERR+cbcnLi60u7d3ohSqUeYDrR1NIW3Vai0Q8Hd9nwTjuNU3rcvM9W0j/W/DPYEDKHSxQGdxM5jPtZobh9gTvqcOkmXUJFQtZWu/9ItACFO87nG5mOdsUDPXdSL0oQwhFO23ZYkMI+oIFii7jrIA0YRl/iezsWTl48uHpQf5jT/9d3kskL5cg0hOc5QobY41wmGNUrDUxmtT0ORw63HpHou4ZpQteF3Ris9/eAQrfcLhAN4rUybDusNKFTVjY8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(6133799003)(3023799007)(4143699003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?iO2bbPYx5SIii7Kq75rHO77EhveK/mak7VuQiU0i8VvplOvbxNIHp2+fOxJF?=
 =?us-ascii?Q?QDgyLkol1WqOFMTj9bt91N4hyqxMhhyJiYeOS2iadsopUBA+wEk6V1JI8Qym?=
 =?us-ascii?Q?15X3JdRWxRsl9OH7eXeLhr8zTInBPSghILGWTQLVF9zZmig75UoQND/2Sk22?=
 =?us-ascii?Q?JE2H9A3q2+PnCXio+PnxEElMDDMKp1UkUb53IdGaHxAwqvopOdwtFt7NO30B?=
 =?us-ascii?Q?7t+SwjAbWgMSJcU6fXXNxqSJdLRl0HArzJA6TmkS/jireIfWdnTtOg5TtOLD?=
 =?us-ascii?Q?q7kP2Zmr3V/zIEri8seGrBcajxzNBeh5ziQXq7FzvuMAsJ8LaP39fvXx1/p9?=
 =?us-ascii?Q?BOO5LrFxmE9V73kGiuY69/fF4UnP2PsNKb5/URD7LicTCogmQnJ5L7uHcz3L?=
 =?us-ascii?Q?ksd7hxmFBgm9j4xE2ZYJj6mf5ZnCwoYVrMUCyFpG+/odztS6yDblYGNF9wBf?=
 =?us-ascii?Q?LR79xzDVFfXQfiLd7339zdG72gCW8Gn8WbHEqr10+sDaiEi+HMkfPq4JYUwg?=
 =?us-ascii?Q?nUH9pTT0Evy1LGjl62SKXLv0dky83EFu9HzB2J7cf/Iks6UhVcV7rxX1iGhA?=
 =?us-ascii?Q?zo5s+aVX0nE1XoXyFfe0JAN7nqggATAYIeugC/BQBaaReYWhn0MQAit/cJVD?=
 =?us-ascii?Q?50Fz5rWpp0zjxJ3caX1kk67TJLtGY+6DcRV71fPDf+MqiyhRlbfIiUg1qh/I?=
 =?us-ascii?Q?W4o5vPGQuA48tBPl5hiAqdqDGIgcsl4ulvoG6c1KY5B3Wdmk4/vIWeQ/4qZu?=
 =?us-ascii?Q?U4/VjfeRtPUR+fp9WHByxYjDrT4r8FzNq3s4q9n50FFGzBTdJPgc4Z/j1IJx?=
 =?us-ascii?Q?N2Bsu0E5D8tFGQovKPWaEB8u/LUN8LJME7SkjzSDxTzbF1ZzAbZoVG7Qv4JH?=
 =?us-ascii?Q?JoCm9huPl4SLdDg8y+Y5UoTGg9BEsSknM9ppx8FmrYe/kPGkGPUcMsggwMj2?=
 =?us-ascii?Q?VVHOqN7+c138MnPv2oWg7wAbVNrhwSB8Uz8fLWDYSMBO1nanO41N1+w9SmVC?=
 =?us-ascii?Q?5zttSLbKzw14ikBZpGMftgPwPHaXp4jF/UaVJPzBuYdPvN+nIybyhFNkRkpU?=
 =?us-ascii?Q?D47JRQCN28izFxPWmmGgA2MOCU2HhqEtVvpLdQWKAxXvepWdv4TQKio1wnBk?=
 =?us-ascii?Q?U8nj0UJIqB86WqYDkonZLUwJp40QWUR9OXDywGsyUgArxzeN4VDAecpj5JEv?=
 =?us-ascii?Q?H+Pb4K4fiSr/HRTduFnyIzbQVYEv9hdUBLIjWGyop+FdheN+PdUyMqBajvol?=
 =?us-ascii?Q?UByXV8g7Y9dt2/beVN1o8Bf+uUuPSzCN7/l3Hh0bXocIhj97u9tpZTtaOdX9?=
 =?us-ascii?Q?1E/l+tvZGnvnH/WNte4DQcxY5qCcauEVVrcGVipDNSl44KUxJXSyBR2JSg42?=
 =?us-ascii?Q?CYBrhFYI8i6zraDicZOZItYDFMIveOkOuaYltlJ7B71sG/RqEsodZl9FnLMJ?=
 =?us-ascii?Q?Cu+y9JYu3Z+2yLr5nVmcBH4+k86lDDpUBqIz9vXf47b96TUq752EgHdADDlw?=
 =?us-ascii?Q?d6WA0Fkq+o9jxs/1n9dCoxVVliNEmMB6SJTrfPz0pIlNxzUVG63cLoMaB3Qw?=
 =?us-ascii?Q?ji3GhUitQIY8wGEFBn77/lOF4PKtk63H0+IOQLgJxAJD4qYNDIAXsiTw6YzT?=
 =?us-ascii?Q?sURACF0k5SN0dcGTcc2cbjR5wRokseOi83R0x2JI9GQDrn2xceVD9bQDM2kv?=
 =?us-ascii?Q?+wyErEJNDHK6udvsSJD3A84eDSretZN4ZkcPEjvcMrKtO9p5NibhLyM754wl?=
 =?us-ascii?Q?4AgDzInDfOrerZd1lvXcoZVN8mHoasQQBJJ5S6rNTdaonYrFG60T?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7163db22-c61f-411b-401c-08ded2919732
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 08:13:08.3581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6CnykpVZXWNvjVqQG4o2hRu6c+lpAy6xbWh7k9qNQWXzhSGwNhQ05b3ndTP5NHWx5iqvjkTM0o9TmD1Hho6NDBLztqXAZPUbcrN+gb4w/eSfKDCPqstXLCQpDdwZZa3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17524
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65618-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F32C66C39A6

Hi Laurent,
Thanks for your review.

On Wed, Jun 24, 2026 at 10:28:55PM +0300, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> On Wed, Jun 24, 2026 at 12:41:30PM +0200, Tommaso Merciai wrote:
> > Add v4l2_fill_pixfmt_aligned(), a variant of v4l2_fill_pixfmt()
> > that accepts a stride_alignment parameter, mirroring the existing
> > v4l2_fill_pixfmt_mp() / v4l2_fill_pixfmt_mp_aligned() pair.
> > 
> > v4l2_fill_pixfmt() is refactored to call v4l2_fill_pixfmt_aligned()
> > with stride_alignment=1, preserving its existing behaviour.
> > 
> > The new helper is needed by drivers whose DMA engine requires the
> > line stride to be a multiple of a specific value, such as the
> > Renesas RZ/G3E CRU which requires 128-byte alignment.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 17 +++++++++++++----
> >  include/media/v4l2-common.h           |  3 +++
> >  2 files changed, 16 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 65db7340ad38..1de246acc7ab 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -545,8 +545,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
> >  
> > -int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > -		     u32 width, u32 height)
> > +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > +			     u32 width, u32 height, u8 stride_alignment)
> >  {
> >  	const struct v4l2_format_info *info;
> >  	int i;
> > @@ -562,14 +562,23 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >  	pixfmt->width = width;
> >  	pixfmt->height = height;
> >  	pixfmt->pixelformat = pixelformat;
> > -	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width, 1);
> > +	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width,
> > +							stride_alignment);
> >  	pixfmt->sizeimage = 0;
> >  
> >  	for (i = 0; i < info->comp_planes; i++)
> >  		pixfmt->sizeimage +=
> > -			v4l2_format_plane_size(info, i, width, height, 1);
> > +			v4l2_format_plane_size(info, i, width, height,
> > +					       stride_alignment);
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_aligned);
> > +
> > +int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > +		     u32 width, u32 height)
> > +{
> > +	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
> > +}
> 
> This could be an inline wrapper in include/media/v4l2-common.h, it would
> be more efficient.

Ok, thanks.
I guess we want the same for v4l2_fill_pixfmt_mp() ?

> 
> >  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> >  
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index edd416178c33..718a0f47f36b 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -556,6 +556,9 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
> >  				    const struct v4l2_frmsize_stepwise *frmsize);
> >  int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >  		     u32 width, u32 height);
> > +/* @stride_alignment is a power of 2 value in bytes */
> > +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > +			     u32 width, u32 height, u8 stride_alignment);
> 
> I know the existing functions lack documentation, but it's not a reason
> to continue with that bad habit :-)

Ouch :)

> 
> One point that needs to be clearly documented is how the stride
> alignment is handled for different planes.

Thanks, I will add documentation in v2.


Kind Regards,
Tommaso

> 
> >  int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >  			u32 width, u32 height);
> >  /* @stride_alignment is a power of 2 value in bytes */
> 
> -- 
> Regards,
> 
> Laurent Pinchart

