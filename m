Return-Path: <linux-media+bounces-67640-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kS3xDz9JV2qLIgEAu9opvQ
	(envelope-from <linux-media+bounces-67640-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:47:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A41ED75C08D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:47:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="f6WT3/Nh";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67640-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67640-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82F69300A53D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 08:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B23F3D75BF;
	Wed, 15 Jul 2026 08:47:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42D63D6461;
	Wed, 15 Jul 2026 08:47:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105269; cv=fail; b=FwmfO6UMhURRo1HWtq4jw6qDjLt8gH06ymGXjM3cl9kw8JFKM3pWfy+rSDKeC7alOZeNJo8WmnQtm6mR0wKVp/sHAUZ5GDZbb+wBDLP+gXkcDyllSod28bPGQOqvG5PAt5abN2pe9xt8BFV1oe0Jd57wto6miIfP2fK1MjQsaes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105269; c=relaxed/simple;
	bh=5oxxw0hF2hzYDliLEth9fdZXL9jaN9eNUnRs/7gOpYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ogTV5kbafxTQg84l9tKFBy488uKq5vi566ToJXenlyjJ5dvTRBa5uG4GL+WvqONsgivEnx5sFpmzLxwa8GNB7lXxsbF93UjPpIA169ShHmXC7D1A+XoHYPcPAHTbpBslNivc0nWSA1X1wCiHPwWG35ayoA3PQ1dxZCP7yM8usr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=f6WT3/Nh; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZj3u/m+mwhQzdMZe4bECfrbzX7qguyGcmZhcACsiYzMJt5FlRyJ57cOZch3Erq2jY9sSL2flMSMmPEDD0uDsJmVnVmfi7kNlNIsvywkrBOyRu+fD5DCDKu113kKpLxGO6kHLkGEuMB6fxlRSF4T1ycP97Sbt1BB+mXT+k2Jds5KKxi9u9Hr7gHblFNOGuAVtmfhVvS45B4VuxjJlUTOIkzb1Y12Vhh/OxEnRfsMNDkJGtQNc9QWYaWNnr77vaYNUuSsUAHMKpdWyVJrCvdX5QBdOhL5UGvkqYOHzY0cz0lPIsj/yfeOnm3At60LprUlKDOODX3NUTLSYzeBQRrpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bW9dR1O0ch4CsBwS2pS18SCG83fQWP/bH5or/RlBiak=;
 b=HTU2F4Lbkd4qQkIDnlx0n4tN8VCtXSJomGMdkgLBRGlKk6O9iUvGpbeaCssYThEMtqtKxBfPSBOtYlo0+fL4yD/NW2Vuo0Zq7r9iOWsdwyUbkB811LAJpCsr39d/A9dYByGorb32BPFxJfFRID1eY+UW1aVfXGZsvLZqRiwpiB2Os1Dog+2HDedjUdJ89YxUDs7yflMDiE1vucVI2UYnIKaafyqlBDDKQFN9s+eN9cF1/5yc1RR6BvnCYFMiXLvb/zjzPhzeEvGSor0GPWYNGdzOcG179+xUfOl/19X8EXHBwqDofrIMq0TP/MVxPiSD9woO7z5XJW6poisLtgpfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bW9dR1O0ch4CsBwS2pS18SCG83fQWP/bH5or/RlBiak=;
 b=f6WT3/NhiT51afUK/Xkb8YTKBFpioRter0P8dAN93321Vk6poDWtXORuY47cQ2HajcqMBE4O6cVgws1aXmjq/hqNH5dXt0e7M5jnl4ao50YPFjOKxampiPcEeUz/7qxJ8biojqvG0y8z1CZSJeT6m0d83vlenQ3xmQCDt4aypWo=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB10070.jpnprd01.prod.outlook.com (2603:1096:400:1eb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 08:47:38 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 08:47:38 +0000
Date: Wed, 15 Jul 2026 10:47:21 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] media: rzg2l-cru: Add suspend/resume support
Message-ID: <aldJGTkPPCvtlwmj@tom-desktop>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR3P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::11) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB10070:EE_
X-MS-Office365-Filtering-Correlation-Id: 229898e7-35a3-4017-aa7d-08dee24db90e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|11063799006|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	EG0uAUU31xigEhclxR+xjsvfpJ/jB9eQLofeM7IcM4oOdSZeLCukAS/g3EmEsa+icJfm6qwLLOfF7b3knlOVTzf5iiHEnefMAPx8vJhU+1cwpOqOxhAP2l7LjcPgGkEfj/1wccR6LO/JCAWHHghT5fIkP0sU21uTSJz5lZdhFr1ZIopPPeO9aRC8tp+DJf7hi4cvoz7lvFbOCFaIvnDjWsgI9TCPnyBBLNRc4MUjGposb4mezg4EQvgj45Rh1eZSH+ZwS3t2xBqGVn/GjJUQa8i24/739ErP40pZqkZ8ZuL+UPcAQLeymyGVZjSaVczA5uc/Ock9oaU8YKr74S+Rhd3Ec/ze6UhDd0aPYjxojro7EUmCUWMa6IG09Ei32+NZUrMqyZydN+lqhReTro+Wpos6hUazfXpKJF+S20U5OaxDSmIqJmjFnVElcgawB+K1ShihVlaiuUclPgWbt+42B9osZbPwrV6nkcS5nekV2sVYk64BvN6HpH0pEUsK2i+GSPDgcXf2eyBTxMhwjS/XNL1M2QEf87CzDm87vYvTEHUwCk/uiVtCVU9SVcz5bN5tR1SSvBRaU25Cwj9bFgqL0lgsLjDFTQaTLC3Vg9uVmCcppkkCBNAhna2pvh6DhqKfTPQG9dxPRygMPnApSlx4cRObscA4OxmJc1UxJzrmSAT5CAb7abIE1DdEt9NjpqwyWNB6iGbt/Tj4pUYh0QtYBngZr2ub9JZwNaXl4QEzQSs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gr43JW+wX+zCAnVv9KHhiGO1OmA5kQWb66E3xqnlRkuRVq0wMZDDTZ0ctjT+?=
 =?us-ascii?Q?FdzoiibDNpJ3RGHlljXJLNIPCkpag3++Lil7sySHDr5uPfEO/dAsVaaJDgam?=
 =?us-ascii?Q?4D3PTZWTxcfZ8n4EZeMOpvv0RWnuF3E2AlfaHVZBjB2CrHnCsoFNRtKwnn5R?=
 =?us-ascii?Q?EVGNmARAnH7mF8GL6GvyscIUxhGIt3vLmaPzo1PnbUgfpNpb1kmxnwNupJ/V?=
 =?us-ascii?Q?UjylDunjixaZdUuFPAa2Sn4ckIWPdfKy5mbJzNImnPl6Pl2VUk5Y784JGqpF?=
 =?us-ascii?Q?5dpNcGR23POfCuhr1trWlNZjAxSVliVyLhVmfeIg2IKBwLhGb2BIHOyMUlmQ?=
 =?us-ascii?Q?dMQXxksWfyXkM8DHBSyuToKubTTgrSESqQIsZ5pN37gdWC/osUoSBkzlNfnY?=
 =?us-ascii?Q?24gVJXNbYCbU3ULuU7QJX8VxejmbKHGFoir2rTbhEMufwZ57haTaB3L2VEZL?=
 =?us-ascii?Q?W0t9uiQILx18uZc5zRUITL8ixrcteaYe3zyf8jLqVzwto0XCE/+crBkxBXvy?=
 =?us-ascii?Q?YbCYbDEqxcBZJhtjRBdZpAzP4PSvs4ULkVzOfVo4t2npcxAPIQpKRTKKEtro?=
 =?us-ascii?Q?gqWz7ruxbvuMCWIGLRKV6/mdg3A/cywuW5GFY9CInpPzpzLhQ3xp6PqAObji?=
 =?us-ascii?Q?O9eFxqggJHzXVdAWJ9XFLWN1f8cqoSpHooiA+CjufWq/srwQ138PGfOziNYJ?=
 =?us-ascii?Q?nGT28Jk0GI8HIwxuHAaHfAuVzm6/SxNVJTR/9wAVjMs5hcYuHo/wy9ZWq57C?=
 =?us-ascii?Q?F+pkuVvDnWHR0gie66dQZklnRdGqi7PfiaMGqbmTCY2REJsSYtORemp8Tx1f?=
 =?us-ascii?Q?F1HZ5kr5g1P5D/+pbEZLEXzXMm5ZpuwHKGnjMD593AMAhcyao3rURCAY4AnE?=
 =?us-ascii?Q?iomRAxPB7VSUYLz8+iR+e8Iyf2Z89Oa8alPuDX6e643zINicllyo+mY7smlj?=
 =?us-ascii?Q?IrNdBz/jdpGK4PhzDgsb7X9+VIRd9QoXf+Y9a5DwOLhmFYIuXrfNlFAhtGB/?=
 =?us-ascii?Q?BpxWMHiBjzSaCxFILaS3oY2kDw1UJroC7DFmCWaFcCALGDFyKhH2Ggccss6L?=
 =?us-ascii?Q?EEp1NZmeL4NCOTvSIxzI4XoHt1oIUl3i/nI3/P+9vSQ5k+dEQwdqc9ehSnOq?=
 =?us-ascii?Q?srs3bckJ8NudFY3M5y9j8kZgffGVqF7nw8kpQj8OIpa8H44c1jBEt9biR9ar?=
 =?us-ascii?Q?+E0nhLrUt8MtQNhmC1OXI5ZfwHcoyTK0V23hRHAvzeRpqrWpEOEuUSnLkvm6?=
 =?us-ascii?Q?V0NIo84XyeMjTVIgaFv+SArn1MpBaG3utCWnm3uQXbTjD9HdfG8LAev8KizA?=
 =?us-ascii?Q?pfkWEFXnqQ4nXH7x+tFd5aMnZiX97UfM9LF1kT5HSx3T8Uih4dP0CkfI589x?=
 =?us-ascii?Q?uBnR5xeUHD7E7YWbP0pNlZXDB0+GM1shbVTWHKGldzYw9OpvGLs96MUYrril?=
 =?us-ascii?Q?TctXl57TuAMAu1vETPmQzUWZBobYpn7w0/NXWf8RXXbWALFM94vv3mg/Sw4W?=
 =?us-ascii?Q?Hq5tUmtLZg2CLMB/aXl155pw6skKvDyXZAtyJ5BXfrpjqJXnfl6zf/AW/RTw?=
 =?us-ascii?Q?RIfElMmnGYaejVwV3bwCrMauFVMZz4SJrY+RGoKl63xYH7SbCkClJavTWdlZ?=
 =?us-ascii?Q?N7mxOXts2QkFXMofcJj4HnPeHXOqUdIU8LR6vgsdwbzPSt1X20B05/73rxA8?=
 =?us-ascii?Q?Dp/yBTjZDiuJPoGPSp9ZEegIognLYlcrsyqwB8RZODkhi61bhdwu6fPgQZXX?=
 =?us-ascii?Q?iJ+xwBzpgITIZDKAmIlyVAMPAwLDhiq1FFp+ZmRWZsW4uMNI+EQo?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229898e7-35a3-4017-aa7d-08dee24db90e
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 08:47:38.2069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBxQguKyTXx+AImSSVnl0urGW5/q3wBJkIrgqyyMPplu3J/OP67JrIerTYKn1zKsmtq1TfKMZoOkrKFT8OtgiWEjPSpc6SualTDQnLsfWJ9/tZbpwJJPpyv7EJxJWk8H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67640-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tom-desktop:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A41ED75C08D

Dear All,

On Tue, Jun 16, 2026 at 07:05:30PM +0200, Tommaso Merciai wrote:
> Dear All,
> 
> This patch series adds suspend/resume support to the CRU/CSI-2 driver.
> The series has been tested using ov5645 camera sensor connected to
> the RZ/G3E via CSI-2 connector of the RZ SMARC Carrier II board.
> 
> Thanks & Regards,
> Tommaso
> 
> Tommaso Merciai (9):
>   media: rzg2l-cru: Add device_link from CRU to CSI-2
>   media: rzg2l-cru: csi2: Add device_link from CSI-2 to sensor
>   media: rzg2l-cru: Use bulk reset API in rzg2l_cru_start_streaming_vq()
>   media: rzg2l-cru: Drop stop streaming function
>   media: rzg2l-cru: Move active_slot reset into rzg2l_cru_set_stream()
>   media: rzg2l-cru: Add suspend/resume support
>   media: rzg2l-cru: csi2: Add system sleep PM support
>   media: i2c: ov5645: Switch to RUNTIME_PM_OPS() and pm_ptr()
>   media: i2c: ov5645: Add suspend/resume support

A gentle ping on this series.

Kind Regards,
Tommaso

> 
>  drivers/media/i2c/ov5645.c                    |  5 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 74 +++++++++++++++++++
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  5 ++
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 25 +++++--
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 55 ++++++++------
>  5 files changed, 135 insertions(+), 29 deletions(-)
> 
> -- 
> 2.54.0
> 

