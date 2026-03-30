Return-Path: <linux-media+bounces-57600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLKKMAhbymn27gUAu9opvQ
	(envelope-from <linux-media+bounces-57600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:14:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F34735A0CA
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B47E1300DF5E
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3443C4556;
	Mon, 30 Mar 2026 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DDDoNgwy"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2AB3BED0D;
	Mon, 30 Mar 2026 11:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869166; cv=fail; b=E6Lq5cD+u8vCS5AAp07iyCTHTK+x2zn43wVI22+1FZlZDKRbah9+IWzAfoRC5H0E2F6JQIvgpagC4OLRdQsmkx0G0skmzB96lSaPYFYl46Iy43eomRWRjsDXu96sKsS5Sh6oCmy5BJreEIUUkU99XeQunndTsM63u0K6MVr7ujY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869166; c=relaxed/simple;
	bh=wmlJeJrBpN78+Ak/DysPRAN/GhrrdjuczQX6OqBhDBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QCt0P3Poo7pCu+P028tRM/1Ekr5XjO6bGp9LaO7eg2lp+sPPkWrqI1INvchIFTvBMSzHbedAmM4B8x15hW5hVa/ftK7GZfYqZL3BMjNkmtNqB+SgxXk9T1KGkZB4RfkbCH4iPYZCt3r+BTwMX8MucLu9NXzRm+wHjW7N7w1oFyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DDDoNgwy; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LE3MH0NXi3RvDa+UmQs7d8AEXOH9WvHisB+hLQf8t9StgmJwGKDaSmoASOGTUCQHiMwOz1Ps9WHZ86xpUb/0vgMgqZoTu85ZRFHrUxc3Froq0XeXQQbh76mnVRp5aUXnmQwtaqhznO0wvuUUTVLVe+ECUC/cwLzYY5qav8mQsSFrkx+5rf0ec/4ZfAZbtUGD1Auz1Ksip4iW4WE1kDHa4nFyb5e9nE2CWDCPCFD4UG7Tx7lik18D7CLTEXvBsC+EskunvBPONdzlo8p/mgKQwoMsvQG7ijJwwJ9M5ndXqWYZdyt8pa+yxIh+KJQiXoJGb0+LzoQskhtq6uAH0/zQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ywxu4wavvpYkLWSK4D0kDjSJM1gvntVa7SIWsKhm7Aw=;
 b=DRnf9WMULB1IrxDPKHXfr7VY0aQo5pdeBTo6Z1d8Yoxi3k69lXikWlQj3ed1r4W+Hii5ACHiw7fn5C/yHCiPXr7vudh2Q6+cIxHpfhMi8QxVVcGfUYfvAN/6z295BIASJU7a5TZTy+XVQ79IE5rQAiZJMOped2J/rxMK+5JTM23GKCkZo27M2/bbBWUdkAAD/pbup+12EvaGydbDx+dai2jkObw+8lWvfvcjhbqfl8gTE2ftA2/iIP0sCm8vX6hpiJkhC/xBPAwH2y/Q6eodugvn2xtLALobi6bozQe36pztpb1qZnYwLcNCEY8sE/Rrqzx2/sNVbwXn2UvfghM1sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ywxu4wavvpYkLWSK4D0kDjSJM1gvntVa7SIWsKhm7Aw=;
 b=DDDoNgwy/W0MHg2R1wTVeWDRR9Aw2boaVHic4oTSPUVOhJeRWnGKH0pUKZ9MYxArdIK4hI6mUWKn/jSZMqYgwjeKStXzBe7uUS5VHcsFczSvz3tVxS+OJmJaOCzZhadHJcHpSMLEW4pooShAUDkKfaHLeZlxd/B9a4cmmZh7LTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB12677.jpnprd01.prod.outlook.com (2603:1096:405:15e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:12:39 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:12:38 +0000
Date: Mon, 30 Mar 2026 13:12:24 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH 03/14] media: rzg2l-cru: Modernize spin_lock usage with
 cleanup.h
Message-ID: <acpamLH3xqP72ffE@tom-desktop>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-3-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-b4-cru-rework-v1-3-3b7d0430f538@ideasonboard.com>
X-ClientProxiedBy: FR2P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::16) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB12677:EE_
X-MS-Office365-Filtering-Correlation-Id: dbbdfff9-e008-45ca-be9f-08de8e4d40d8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KCOY0eTunOgMTzBiHnWdBthxhDAWkRIaxRtS627RrWRjjvVIe7vrtmlkdBwF8sfYhBAD5r8ZCFXaiwgG2nBHLXvDsbGpf/EOJzBHuh2bzaHPADAu4vy63kdDrFYUrVlCLwFlZbDDS6cOddHFhLFNAoc2O/m6UlSkHoh0pRwMJ21FENupKC/Pac2NjdFf6hUwh6ypMa/sne/TrJjIT2poBYqytCiIQVZ7AernOiuaRx8vYkIWapaoi8qZxNH8dnm6csZ6kv7aYqUuVhaY/zidTbj0vopCIDEcK5wVJCALGPmG+q2CmNbe5mInxTpXoVRdM33MULI1mevpbmR7acOtf2bB+E8fNtfPC5IWGolw8YU6pepnxkz0fpp1n+yu3xPbfSdIzHHmQ9uxLgrWc7e7++0TR0pmF6E3ugnfhiKkg0iDkBmxdBaufO8ej44tnDG63N6DGAnLdz4DaSAR2ZRv9O/PepslZYsQf7SCHrWMYlIKCMOyLTqmhoV5eKOTOSsv24Xzvx9kljTrYhM7lBde/KYXfyFi10tT9E7lPVibztfXyVDQvG1Qzb0yy328FsP20SCp55Mo+0SrmqkwVPAU8p+0yHhPXqnVs4EkscRyMdcj3wmrZIPvSUh6znCJMl4YLhZuostxKvOKdv50hR+LVpNc7Yj1qkdGPngJL/dFi/QzlpoJJEyXz4UQVNhqJ6OG2AvA7eWxvlfy7LUGEA4TyfYi0Q1UexN9Rn8c3hEyF39kQfG00X9p+Eh0dAMyZf7QTWkOFAAYPmvf2ILC5yxEe/iLDaK3YiOY0YJ4NRcnfFo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?34ul0vCrZiehoUdK837sytplgaB+tmViNDO3aEFzHc/OJmx3FGMrUUere8wQ?=
 =?us-ascii?Q?SdxGh2WKQo99vWrjrnUN1LDijt7LcU+VIHZOrVRJRiZlOn0Mr50O1tNItoVn?=
 =?us-ascii?Q?Pa3OovooHWpMjW/k8yW5WggfeJ3m/g6ITMS0/lUKqYJEWBEpC6qPoC0k/gbg?=
 =?us-ascii?Q?jusxmva6HNlewS5kdXoSrPM9SvXdwJTbMX9SBPVFPJzAqus5IGtbkyp/mlJT?=
 =?us-ascii?Q?wtAM/hDTnXKqUuGymwVFqMqK1Ue380ZRnnGBNaB6+/EdNgcuag49DJwxCTA6?=
 =?us-ascii?Q?cBxfbiOkzVdn4fbD+MNo/oFK9vb9HEtHIYlXpzegCq1vSoWYW1+4xZkWuRFL?=
 =?us-ascii?Q?VSXw5HrN+zAwMipk0l4dKS2v5hYi/L1hI+DHnNywqxspqjtKV3Wc1dy/S18X?=
 =?us-ascii?Q?aGPymMQyGzG54J4fb0BxYJ9294f1z7pRoZ06HYUcTqc+yiY5pgdtORlOrHF2?=
 =?us-ascii?Q?WPTlDuobBOU5S3s4DWKp8mnXfhm1BshcmGKJ6m9o7b5tfzRitHwR/kqzeKPp?=
 =?us-ascii?Q?9u9hdEjhd43rFZi9vHSaTpZXilNYaaFoQYsiGADoFEYcraGaJ3YNy9tdjPU0?=
 =?us-ascii?Q?lkkDjWtMXqNDeVUnSOm5URSu5zUOsLTFgF1AgHsiejfldeX27fDN/Gb3fiGK?=
 =?us-ascii?Q?lOlF1UQuzVF7lLNXJX0NTZ5seJS6kevgwxTgbmITyIwrn9cE1uN/Y00mP6X9?=
 =?us-ascii?Q?nCQmJUcKZjuCS2YiS6QQRsN1G0GFhD9qt5elzLYu5WLOKiSXWxko7yVOkzWG?=
 =?us-ascii?Q?7Bv7um5bkdSPZRTJR4FTKHLzZcD/YpKdr0kvnMLygXWd3G8ic/9bhw3dF55a?=
 =?us-ascii?Q?JY2CBLs2MBRpQZngS7ezAOHu6nEBT3tjU3+IVdRJm746iqgrWgSwAeOdYoCb?=
 =?us-ascii?Q?9Q6IpDs3X7TT8KtCS0pVvIHNXWsKYSFcCNC1bODZIFamIxTTUNomvELxsACE?=
 =?us-ascii?Q?EbTayBuDqmzWg3v6teI7JrT1/CmpSrDHGr1yBkYbuxlNc5Nv3zLyHQKaFW44?=
 =?us-ascii?Q?QB5SqRc8sDBWMM+0cYju5/mIph9mTED/HQciC5PHTqoMI2EHEjigjxgPtBbb?=
 =?us-ascii?Q?0rwIfG3Rgbfe0Z13nJm7Y2qztainjhW8WsR/EXh+ECZpNnnICigCTyiFeLz/?=
 =?us-ascii?Q?E703IvQAYNso34QcrTitcNZTEi/2VNOyhweJkbZ9LB+yI8/kVR+8AtRcZxJ4?=
 =?us-ascii?Q?JglXnmVnSAo2wqTylWuIQp7pRlefDJ79WPrdxPCJzATDJjJzjV2LHd8PBoab?=
 =?us-ascii?Q?5nCTbtZ9iW8MLCpx5IkLAXdhqKqHKV+/hwQcxqwBZ/bHc+tj4CKjv94XWLZh?=
 =?us-ascii?Q?a7CtWx4AV0/TJ1g6/CGIy7+U2+RU2UxEtHJMn5pq4063XnneS+Ac0An2MufM?=
 =?us-ascii?Q?pQIP5ZZ6X2LOGRARbUAsql8O+vCdrZTgroIK7TPf8YamVjvt+XWF52yjkT+w?=
 =?us-ascii?Q?SqO+NQInb3jWVk5nCuSHEDuLoFhn2/yszibcNSkbTUyppkP+oK6KeKgNAnLC?=
 =?us-ascii?Q?FvSdi2k71aJqxbLLpXNq8tZS8SeIZ8TSSVO/JbTKSp5gW23r0LJv3HGSGLAb?=
 =?us-ascii?Q?AwXPqKZhdeeWwEbQPK1ZKSGVpVXsJWnb86ZiL/gohZJaj2HlZwXL9cwzypMs?=
 =?us-ascii?Q?rzmTOcKqjrrElU30c3THVqYJM0Wuk1+RJkSn/BgoB08uyaVpTEet3xPxPn3H?=
 =?us-ascii?Q?wcVW58KAIM9mTIdvoqsGe1maIu+TqqzYtApZjH8NRLAmeCi7fgURd+sYWQ8H?=
 =?us-ascii?Q?bzHLhgUve9168cSSsO/05wqHHCpu0nIIkgFowffGk55hOOqZZp7z?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbbdfff9-e008-45ca-be9f-08de8e4d40d8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 11:12:38.8784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S36X+xoyYS1LeS7vAgUezl2TnmwHN1aSPKGVf/CHxgst7M1hKL4WHxX5thwaiAOz2JPkeTrBdjqDABjswk/cxwdgVdRLZbDCrIAHDLvwUaeBvs2XUlEVJ2zH5GMrSIYs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12677
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57600-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 4F34735A0CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,
Thanks for your patch.

On Fri, Mar 27, 2026 at 06:10:08PM +0100, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> Use more modern constructs from cleanup.h to express the locking
> sequences in the rzg2l driver.


Looks good to me.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 32 +++++++---------------
>  1 file changed, 10 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 98b6afbc708d..2d7ac9f37291 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -11,6 +11,7 @@
>   * Copyright (C) 2008 Magnus Damm
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/pm_runtime.h>
> @@ -110,10 +111,10 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
>  				  enum vb2_buffer_state state)
>  {
>  	struct rzg2l_cru_buffer *buf, *node;
> -	unsigned long flags;
>  	unsigned int i;
>  
> -	spin_lock_irqsave(&cru->qlock, flags);
> +	guard(spinlock_irqsave)(&cru->qlock);
> +
>  	for (i = 0; i < cru->num_buf; i++) {
>  		if (cru->queue_buf[i]) {
>  			vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
> @@ -126,7 +127,6 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
>  		vb2_buffer_done(&buf->vb.vb2_buf, state);
>  		list_del(&buf->list);
>  	}
> -	spin_unlock_irqrestore(&cru->qlock, flags);
>  }
>  
>  static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> @@ -165,13 +165,9 @@ static void rzg2l_cru_buffer_queue(struct vb2_buffer *vb)
>  {
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vb->vb2_queue);
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&cru->qlock, flags);
>  
> +	guard(spinlock_irqsave)(&cru->qlock);
>  	list_add_tail(to_buf_list(vbuf), &cru->buf_list);
> -
> -	spin_unlock_irqrestore(&cru->qlock, flags);
>  }
>  
>  static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
> @@ -465,7 +461,6 @@ void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
>  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  {
>  	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
> -	unsigned long flags;
>  	u8 csi_vc;
>  	int ret;
>  
> @@ -475,7 +470,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  	csi_vc = ret;
>  	cru->svc_channel = csi_vc;
>  
> -	spin_lock_irqsave(&cru->qlock, flags);
> +	guard(spinlock_irqsave)(&cru->qlock);
>  
>  	/* Select a video input */
>  	rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
> @@ -492,7 +487,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  	/* Initialize image convert */
>  	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
>  	if (ret) {
> -		spin_unlock_irqrestore(&cru->qlock, flags);
>  		return ret;
>  	}
>  
> @@ -502,8 +496,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  	/* Enable image processing reception */
>  	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
>  
> -	spin_unlock_irqrestore(&cru->qlock, flags);
> -
>  	return 0;
>  }
>  
> @@ -573,16 +565,15 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  {
>  	struct rzg2l_cru_dev *cru = data;
>  	unsigned int handled = 0;
> -	unsigned long flags;
>  	u32 irq_status;
>  	u32 amnmbs;
>  	int slot;
>  
> -	spin_lock_irqsave(&cru->qlock, flags);
> +	guard(spinlock_irqsave)(&cru->qlock);
>  
>  	irq_status = rzg2l_cru_read(cru, CRUnINTS);
>  	if (!irq_status)
> -		goto done;
> +		return IRQ_RETVAL(handled);
>  
>  	handled = 1;
>  
> @@ -591,14 +582,14 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
>  	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
>  		dev_dbg(cru->dev, "IRQ while state stopped\n");
> -		goto done;
> +		return IRQ_RETVAL(handled);
>  	}
>  
>  	/* Increase stop retries if capture status is 'RZG2L_CRU_DMA_STOPPING' */
>  	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
>  		if (irq_status & CRUnINTS_SFS)
>  			dev_dbg(cru->dev, "IRQ while state stopping\n");
> -		goto done;
> +		return IRQ_RETVAL(handled);
>  	}
>  
>  	/* Prepare for capture and update state */
> @@ -621,7 +612,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  	if (cru->state == RZG2L_CRU_DMA_STARTING) {
>  		if (slot != 0) {
>  			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> -			goto done;
> +			return IRQ_RETVAL(handled);
>  		}
>  
>  		dev_dbg(cru->dev, "Capture start synced!\n");
> @@ -646,9 +637,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  	/* Prepare for next frame */
>  	rzg2l_cru_fill_hw_slot(cru, slot);
>  
> -done:
> -	spin_unlock_irqrestore(&cru->qlock, flags);
> -
>  	return IRQ_RETVAL(handled);
>  }
>  
> 
> -- 
> 2.53.0
> 

