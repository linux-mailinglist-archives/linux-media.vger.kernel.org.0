Return-Path: <linux-media+bounces-57668-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGXTFySyymkX/QUAu9opvQ
	(envelope-from <linux-media+bounces-57668-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:25:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B941535F47D
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 288353037D4B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1183DC4D6;
	Mon, 30 Mar 2026 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eQfqOpzJ"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1073A7F60;
	Mon, 30 Mar 2026 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891467; cv=fail; b=bEzuzPexsTaihQOKnYTG2fx5HHV6DH/tHjD1wQhmr/dgK5hC8QY9miWHVzcyA/HWOGtmCuUa4xaLeiOPog2KFCeD1WSFkqU+pm838bttEhkA4mH6HFI6cuWY32c/c0GbWFCq04APCOQdCH4U2N+ze4XcVpE5eto0Vd41/UGxCkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891467; c=relaxed/simple;
	bh=sFi0gllKQzHdnFwmuhNq803cpYoEQebV7lHOXMM7WyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b2LO0P/br60ImiQwe7qvcWN5rRnWgaTiyEQvQgA5KrIEFfFXmZUaVIspOvcwbmL6BGcCkSexnsdx2u0SbBPIGk8hzkSKb05epVf3YuH9rlUT1rLl/rBxLjVHivQRWbcD9O1NTbqpnWBBoXT/l+tVJ+dz/xb6w2epAnh/FcGC+7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eQfqOpzJ; arc=fail smtp.client-ip=52.101.228.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lh8dz5ssEN8WDMd0TNqdAdefDYofHE+bmbSxuaaFy5JMDqDmVRGOZE3OPyeBBM5Nh3aWuvib8SFz/P4g9tn70r8TXTTXaHfomnW6rPitSCXdR0VuHWnD2N+Lt52IeVtLCoMQR4V4R1HDdu8kuSPIcoTYTh/MiluXX1groct54fLhDxZX/Shj8Aahw6ShMCmOnGc8kj7X/o4yGOl1mXL9AYxkxKws5MbwdJvi/RfI8nXkUNMe+m8pE0x/sWrNDY8Qtjpk2uwCYh6DcxWdl2nzj/sJ3J4Y24Nkzh1KvZSDvsc6SCF6FtyMyIpVGzGVoDyIHTtWt5SZAFO+yarcpKle4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5p51b+FymDb4RW1XCFzhco3rJKz423WWU1UUJRD3VWg=;
 b=DEpK3T5K+uLa9uQKSCXQZufo3VGN/ivYEv4+LgOBswHqK9XGlBFB3SW3yPHZixqGlIzAq9414RSMyZ0G/twpgeBNu/Vbx2N0BudF8wueZioAv5H7YDnDv2aR7thBq540uSqBR+opMiIQHiQYLx3mjmSeAWE9zrcwScTDqVMcu22F8cxYSwCoqeoXCyluiU0ozp2m3Es6pzUKHI0TMbp6T9kyRMZ4xJnf9BSHhCpPYqB0yyOw1RAYCGaa4Vz+UdquJ3UQSHIYGM51tegnl+mxmxrGk3ud9TRuhTl9GyVpt5uqEYP5ODHWklJXpCCUXKO+bQBEq8DYT+hYO0XuZ4CEPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5p51b+FymDb4RW1XCFzhco3rJKz423WWU1UUJRD3VWg=;
 b=eQfqOpzJ516L9q+jQizduiD7uJJd6mN35P4kAG4Zc0h+1SyM5zQrz6prvAeEBsTIGCE86iDOJIGjBUQdWykduj07GZgAwlOGCZGHYkBD1trZ5t4lr+0pEZsStMEKdKSrbdIqM6qOt2x3QkCAcef67nQzeamLLiczuAXFdpwyoJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9395.jpnprd01.prod.outlook.com (2603:1096:604:1d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 17:24:23 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 17:24:23 +0000
Date: Mon, 30 Mar 2026 19:24:11 +0200
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
Subject: Re: [PATCH 14/14] media: rzg2l-cru: Simplify irq return value
 handling
Message-ID: <acqxuz75l0XR_b15@tom-desktop>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-14-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-b4-cru-rework-v1-14-3b7d0430f538@ideasonboard.com>
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: ca64bf7c-256a-4e3c-ade9-08de8e812f3a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	aucFiDWCqNyLwyKvvstSMbKanbV0XhbRhOBJgnV0EO7/PVII0Ru8sdMJNAdgvpYmOwmnjm2klCUEASNV16oDIG1BXoQ1MODU5ZVvQzIlyR5j3PmvPd/CJos+JSZtun4rFb6kzUF0G1EfRRTryzXt3CXY3JPOnyZj0BuFp1mhgRmyHm49VaoUuDRbZwxZ5tSk5oFpNZCEhzxKIJdqiAGQlEMlRJyv5pUeXJeXddFbaGEcGaVflUa31VdBgK8Hxmn9OTCl5hksqsUm3CoyHnWgdPL0907NAx3Iyz5skIV/Icn0diaZKG70eSQwXJL9kEuyd/NGDvGvGpEnJ58bbRzgZeB/MZF0MN3/LLmhu7C+RN3E34ROxob4VSw1bZvWXbR7gK76pieXnEH8IqsPegZbnQDxAvPRYknUVy+lBH909TzR9CndOmGM5L6hV9OXKSnJ+cGSx2jDVH5p7D27V0kZKOzhGSM9rXil9PyR/IktKo5EAHPCPxMQ+O56NXpmrhfFmqMKIFpqibyxhYwDgIs0DaeQyieXoXqqfapr2SiNa9a4D8gN3Y3QcrG6tffetBfpF36VtIKiJ287WFHCkWnBxwpcjSt0aCpUENdrqHY0p9KxuL1sb2RXE/SF7tfBfQOXCC9WyEvEd353XnDmakv+ACM4bOLDzZSTXU1TBvo743oGQOHEzzGIygvk3VPGaE3A9r0zTjgZ/hYIFcCe4fHIB5z9ANDhYP1u584DT5NFCJmIHKUd2ozS0lDtZ39woiMQTY9InIU1YsxW7zutfJPjS+AbkfxcWhFUfiMPik4Qjl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BNalcJ71/hgPiKcCMEDT0/+m5EjO6jQVz4EhxeWyrrztl/YpX6IoIXgF2RRP?=
 =?us-ascii?Q?OM5KvSn+qKfh5xaLCk1WXu0r8d1gZXLi6NKq5nyqkDyWhWI4avwLeH0Tx2ZM?=
 =?us-ascii?Q?EqdoYHF8XizvNdJo9xo5FgCnB0LxIJ+EXFWjSazs5Triayljo4mf87GxjKeG?=
 =?us-ascii?Q?UfeMCYOKTodqLvVvyTjFAmZzAefZtwJAQ5LApGzws50lfdFmGXeWKjzDGEY0?=
 =?us-ascii?Q?UGOCclV43L0tKDCBcun3WZJHNM3KqYPTZsBd0V2rLfcTf6Puq9mhLxOewk11?=
 =?us-ascii?Q?474lFCwLbhRO6QBTLLBNjQlKDZehnAKfZQJ0kj2zmd8Wj3eAE2w/KLWA0Tj2?=
 =?us-ascii?Q?ad6nAvaA4iT9vQpOZJ8G31ln1nkuD+xKE8LnbL6OtEsGy8RPj2eKBwfrQ1aj?=
 =?us-ascii?Q?DKBMLoagGZ6viTE11jpp56KEs83YD+cg0HMig3X9z6q/fcg2o/EeOzjkD1zw?=
 =?us-ascii?Q?k0gXMJb/XjxsoEm8vLaUu/VVjJAxttC3luK7LgH8092fTBoXFK6RmSyg+Yrq?=
 =?us-ascii?Q?C8g/bE8vbF0tJZabPXY6fB31dV6/1I5tCH7cQKrmq7YjNWtgTrX09BoSjClT?=
 =?us-ascii?Q?h8E7OUNdJVraG3+M1SIc43aYikUzEL6GVnMojo1DE0vKMuiOIfOOUNG8q3hR?=
 =?us-ascii?Q?PtbiqZntWHbKAJLsf7unoJM7H6TxHNho3GUisomdSLArtNgW5QtOCa210wbc?=
 =?us-ascii?Q?bi9gtvOy2Gc2aKDWsR2mSZsC0Uu2swHlZ5exOY8US4V95/4t4oSt+aikBnk5?=
 =?us-ascii?Q?oVqsa0UoUJtEVsbDn0RNFWvQDLs4O+1nAqNmwFFFS4AAXNRLloiIdKlCJzls?=
 =?us-ascii?Q?AHinaTJ9/zfs4BEifucHyaz4ox8I1jkOk62/Pe8TfvmuNtmHDwdWZKkqYB9R?=
 =?us-ascii?Q?lg2sWDE6r1f657cvtME2aDeuoKdwwQr9GVbV3l/aIKcTzefH7XLYtlUccL7J?=
 =?us-ascii?Q?EzOeAVVpBwhzGItFmpcZTDK7AkFiAls3Vgs2N7jOuSsb2lbJLRL77OMBMx+S?=
 =?us-ascii?Q?c7+QzMW7bdOgW8nHRKxKg5++htvMUKAE0UNgBTsSPaNYnCSRmwcttNlJwpEL?=
 =?us-ascii?Q?+ERx7Ivkkn4PB5PGEfkwVu8AJW3pDH42vmH9Lb2KCJRnGpNRUCkCt3nakP6u?=
 =?us-ascii?Q?45F9e0O82ST4cT5K2oLhGZ/Mt27NIamUJ5HRLlt3Q0QqR7pftUxSO6Yzwhyp?=
 =?us-ascii?Q?atn1nBxXHebfdaGRyoTNnsU5Mh55Q32WUeLNw7KzFZdq8kj4bo004CCcJDzX?=
 =?us-ascii?Q?sM88H/Q566qSPcVKz1z1uF72po0aJ/bjQk3GsBtiUM37pSfmwJ/3xpZLsWyu?=
 =?us-ascii?Q?Jo3pb08uZb1FefzcWHOcCl/dLrRiCcBBNUnId5O/jXpBOQUBtbeP0KpAAWAP?=
 =?us-ascii?Q?S253XkhJ4M0m3PGR+wpxN3STSWslbblSaOM2Y1a9yhgbA7tCbbUxgbigIigj?=
 =?us-ascii?Q?9XyVPNAsYLsAtFMjebBEm7AljRcqGEYHdZuAFZscX0897/m6UJ9Qb9fWOrEV?=
 =?us-ascii?Q?wDgK1uQ1/p7aoLoGmLs14FyLNOhCyzcXTXzdGmTJPWVALQsUNleYSYGNbLhB?=
 =?us-ascii?Q?9XvKiUKUYGbM3sxXFmeqo4fW2UUXtfzHDgvmUQUz/LQkVx0IQCZgRUfpG1Nn?=
 =?us-ascii?Q?bTp9invwwl9V58InwUr2awpfpCLlfPVkFg3Cg97+MbIECIdixgEwkPmCp58U?=
 =?us-ascii?Q?RjWIetauvazaErHyT5sJwmEhIgJIKeziUSDUDa9g8oe2lEDopGLU6/upYiU0?=
 =?us-ascii?Q?/jhJ7BycP2qLzJua9WAe0dThiiAx4cloA8+ouQVNhoR3YsI9OTga?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca64bf7c-256a-4e3c-ade9-08de8e812f3a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 17:24:23.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2p7c7CPM36bPEh1ConnsXx3l7Za1qgGhkLj2KsFLLsjMSsaUc8fWmVNqSLqTuNmWvYrHQYDHXAom+Q4OVvayyV/AXmo9DmjR5GT9jpdl30yzdVK0RV8T2oTbHb5M5SVB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9395
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57668-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,ideasonboard.com:email,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B941535F47D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,
Thanks for your patch.

On Fri, Mar 27, 2026 at 06:10:19PM +0100, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The rzg2l_cru_irq() irq handler uses a local variable to store the
> handler return value.
> 
> Simplify it by using IRQ_NONE and IRQ_HANDLED.
> 

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 30424e2b6cc0..e81573d0a84c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -592,16 +592,13 @@ static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
>  irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  {
>  	struct rzg2l_cru_dev *cru = data;
> -	unsigned int handled = 0;
>  	u32 irq_status;
>  	u32 amnmbs;
>  	int slot;
>  
>  	irq_status = rzg2l_cru_read(cru, CRUnINTS);
>  	if (!irq_status)
> -		return IRQ_RETVAL(handled);
> -
> -	handled = 1;
> +		return IRQ_NONE;
>  
>  	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
>  
> @@ -638,7 +635,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  	/* Prepare for next frame */
>  	rzg2l_cru_fill_hw_slot(cru, slot);
>  
> -	return IRQ_RETVAL(handled);
> +	return IRQ_HANDLED;
>  }
>  
>  irqreturn_t rzg3e_cru_irq(int irq, void *data)
> 
> -- 
> 2.53.0
> 

