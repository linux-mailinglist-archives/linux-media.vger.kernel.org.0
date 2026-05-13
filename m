Return-Path: <linux-media+bounces-61535-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKPaDxbnBGpCQQIAu9opvQ
	(envelope-from <linux-media+bounces-61535-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:03:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF9053ACAD
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB3E63019C80
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6093914F8;
	Wed, 13 May 2026 21:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K0UqKAPr"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013036.outbound.protection.outlook.com [40.107.159.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF03331A6E
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 21:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706194; cv=fail; b=O2yJTkeQp9jDNWYdU5lNDZUNgS3ii9u4x07WeRykumZfPdYWKeL4/ju8pUFlUy2+3dB0kcras8dKxYvmLtr3fWpAx8e85i7pEj8tRmo2RMW8VEcjVNfIUc+cGuxVtYLI/J5wFHoVbSIUTBfA+pw2S1SPeJaNrPBZhKSjp49NaHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706194; c=relaxed/simple;
	bh=D3M/zejgv7UyyOr/uFZqnD/u0LcTLIfUxv+Hl9peuno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gio7Xq18x/PxE2YR3O7mQaD+thqH1UJv4NTmZNabwJ3az0ETcEUclQHANqWuREKCGJmSbXqS0BmwOOygdOhjLfcIFZElPiFhwHeAMzsGMVwAtFR9GWCNCygVSvlcjmIdxXF8tIWgsox8MdDjBjBtaj1bS1o0SyUI7U3glNEhcKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K0UqKAPr; arc=fail smtp.client-ip=40.107.159.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8n+0L9fww7yMIAOzOGqGrMAvlyQDzS2DNqEhF/+4DeiRB6CVQiFctJb+pBm1pM6uAQQtQS2D5j9OxTGoVOyIZJRc/vGQrtY1WDh+ljOsG1Uq5aN15r3so+mQ4xHMxa5VSpU2hqGBJghEC29JLaviu/XtnKki8PVnkSU4sVqDKx61U5osZJqDSJH+9hfV8mfbtoPmLI1kyfcUa6wFuWtfdZre1nDorTilbhZY19p7WRKkGST4kGwELOuMowjJp2CVi8qTLIIWYLyBokSptbelzOczsYXZKY6gZHK1Nf7tM7bioG3drg4daZvin1SghZpVN5/BiMFIs5MCrn5heafrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3M/zejgv7UyyOr/uFZqnD/u0LcTLIfUxv+Hl9peuno=;
 b=fP+D/KvvfKEb/aHKM3OmLdvh/C94Majt3FDfjsUarQnny6BY0fEKHvkCmtKXtLnXTqXu31KNBjglfre+V1kVh60alK3m0uAGh8Vu3N0TSOUogovrBmikfn1+SP4gHKyoMloRsrV0pQBCQy8AQCipoAvDlmu2FMgL0ibwHehzakKeTI+SBBYU/RRDQWYXXzj6r5wB4Zf0jprSMOKnh5A7pumZbS7CVEqOVR61AL/GQi/clXnAkDLtbs+HiTmkzu7N0mBB1IZVrN62m3VgUeh9Eekp3p/Amimy1RwACPheVDFZ2Yv5D59NBMhhwAqrSE2t5vNbRUcvSY8RnFad9Kaxqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3M/zejgv7UyyOr/uFZqnD/u0LcTLIfUxv+Hl9peuno=;
 b=K0UqKAPrHnp6eiHdjXJWT+nmyMZAMFoI8WXEovGaPuxcP3aIhNQF4zX7OepcMThY142B0tsMN+xAmJfAaZQ4YryTjbtdb9VhF3y/NRPPPUi4Ivtz1/olGyFBJo0zyKUBspqWol1sYozmbvznuxE4wLmThujmdKMJ/ZssMkYDlJ4J3vdBjDsCzS6gFWd7MTqorU+15R6jhVGMQhWRumcgaz2UxwHuoYraaA11lc3W6vUFi4OooHMr17MLDCZ2ONBLHGn+LvzGGl+9N9ucfU0zP7J3IKJw9LtJL8JHzOCvpn6oyIOtaBkSf6hxm13VO0IoP/pyXgD6p+LDQuPpaohaBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 21:03:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 21:03:10 +0000
Date: Wed, 13 May 2026 17:03:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 01/17] media: v4l2-common: Add mipi_csi2_dt_for_mbus()
Message-ID: <agTnCLxmqpCR5VtV@lizhi-Precision-Tower-5810>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-2-sakari.ailus@linux.intel.com>
 <agTjDhLt3in_apjf@lizhi-Precision-Tower-5810>
 <agTk8YL_OC7lwHLq@kekkonen.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agTk8YL_OC7lwHLq@kekkonen.localdomain>
X-ClientProxiedBy: SN7PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:806:121::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: b02d0dde-1c01-4604-0944-08deb13309f6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|52116014|376014|1800799024|38350700014|22082099003|18002099003|11063799003|4143699003|56012099003;
X-Microsoft-Antispam-Message-Info:
 FhUYHri97pwwPk050UsBXUeW+b+8eSwvphTAHLE0lAKcpq9B+mUq/qHG+3r6bXcDjRz1jvTmplbu0f+GuyGYLZPX/REueYAg2eF/O1ciFNNcXHMa5GUZ9dYo4AB9pZxKhG7RFUGXWUqFO+DoaJ3l9czOlQE9/INV2RX9TRNkcYQ9KGNafPZlMD9tbqw4c7TYljH/ZQhF9B2N/lSmmfXFc4BIEtTxRSeewqZjfOFZI528AUb4bx09md/NegB9dt0UBdZXUOqa0rg1KzB++iZwcxZ3Bhg2sRNmD5eZNmbt0e1DmtNXBkf2wgt/eGZw1X7V2ukPXsIonO+hUSNkjipH3nS71muX6ReXNUiN3GeENbbiluGVsncecQEXBDFBPW3lVDDjZT3W8jVWW+kNGBvZEWrwFELLNoUAw0DpmLdQY5Z9qBIM5PJOH3OtwWAxxVI9Z1db9BANBkf1dFO/x3F/KyNudYoy7MThv5FPwLUEPtFqzsH70vKgfZOj2wrGRdcTaglUj558biwBLTej/kUaL7HykUsfqb5UBG6sqgYPM8zeEhfbpf2Oj4kVvrQ+yTYWI2GOQzRjwTe/m0/vKgAinEHGGGuGAaGyl1eEPROVF8gwHj16q4N9WkQsBpCNh6lueGgsD0xii6KdMRNqQlxukiFQv7rCwEzp0kunJ8scEUkmD7vGZkO4yqb9bmQkiw8n2zUJYMa4REiTCzdjb8QXwf8Q0q5PXUK95ELlxk9XSTozDWz7AZGocuTDxa+TOsyE
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(1800799024)(38350700014)(22082099003)(18002099003)(11063799003)(4143699003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?eNBPAb1dt/C3vRvJKywiF7ymGoY99Rr1Wa8WmJpRaFeSJD8Lb5b57mhlX80m?=
 =?us-ascii?Q?w8vU2DUvB2p1tTweUJZrV3tnD9CphX/BD0QqWY9Nc0bxrasnM9Ycvb2+N2DD?=
 =?us-ascii?Q?9dq+5xUFYkuAgwRrV9OR3HFpL30WKBGN9+QxNyHuHReHrn8yAr4VkPJphRAl?=
 =?us-ascii?Q?BgU+JdNjBzphEPecfc7u+0UJxA+1K0hIu07BAfERaO21EgrJIx6Dsd18tpRm?=
 =?us-ascii?Q?zAGMkPwr7teXb2g6N5TEClfy9vQ72DKtx8QATnYna94TLXfh9Hpo7u3hN5BD?=
 =?us-ascii?Q?lFiTdngyuCTefDUiX5W+eeO4ptffi0ochlMbUH5wpNvWkRfVkLCJ7coWQzuR?=
 =?us-ascii?Q?r5zQlQWewkUzqq8X9F3IV1Z/VbS6YKCM1siUnub/7sIE8rlY+lilj2evMSfU?=
 =?us-ascii?Q?aSCVQnBdxXJkvg36NLA6fV/Vb6LlPKbAZRlpfa5CQS4BZRX+g9d45owY1n1Z?=
 =?us-ascii?Q?TxpPCQFEqiLZknuE0XzU4kcW7lw3DUtvXOPEW4buGZtb5N3MCWzJqFs+G/M3?=
 =?us-ascii?Q?srp8ojN6ZGk05IM4l/Z4Oa2a7q82F5jQgfIYYDzoOHDkMgWkzqBq+HrRAIte?=
 =?us-ascii?Q?1NzN5WXo2IGWbVubc9VFWlfGarKah5ihvIskPKt+dO82L1ybrtMemK/608wh?=
 =?us-ascii?Q?k49bgn2WOq7prCtfxO2vX2GcD4i00wzB4A0X21Qcb5Ltix/Mu35XvtwUaKH6?=
 =?us-ascii?Q?5GGSyO2fBSJr0cxeK4KD0xTSkUsqdwA/k6HpsLbUU60zqEsgnBAltlEWh+ro?=
 =?us-ascii?Q?N42XIqFia1hTiQ6NKxTUYdc6NAVcYkzKO1IV95qz/wHG11dfdijY8DnvXCjA?=
 =?us-ascii?Q?c6pmO3RHz/0gayRDS+6pctm72IYKiQ6HpTSe58NeJ8L0Zp3zkcjqYTDNawno?=
 =?us-ascii?Q?Uwaipd+9cky1CNk98t4GmHFQdT03h9Jypk8Ec+K8Kevkk3bo2sBNcL8ZI387?=
 =?us-ascii?Q?khfZANH1nmlnOG37FjpWLRsUoMLkVJIVJtFOX8hrtHPWIQxgKhbyrV1RkgQu?=
 =?us-ascii?Q?0fKRc3iwZuei15GTiGoHIA7WZ5+Q9SgI2mMmHU2qF0s3aVF+Hsuavs2sLps+?=
 =?us-ascii?Q?5oXPFqU3IZS5dYG9CLvPZMZ76UozkeGdXgHtcOs45P8c8yChJTsQydx6h7x3?=
 =?us-ascii?Q?Cnu5j1Yhg0QblI571jVGXxzMwpvPrqv3R+xGSaww1LTzrMTUqSaBsEWxeRWS?=
 =?us-ascii?Q?RmZLEPoGas9WNKLSinqheL34q8PTFalBpl+17TDzAw9y95bg8c079S/dOX7j?=
 =?us-ascii?Q?9PRwOiKWsBAJoasyJzW+woj1vmUiXmFodWHb97Ro7Vlqc+mKF9UURDHGBwnI?=
 =?us-ascii?Q?MOE7KjIGEUC1Chi2m4ggJoP8Y6+0nFI2SftRDAoZxJgOmbF+Koi/S7df6QYC?=
 =?us-ascii?Q?pZRNyh0Hi35UD/oLK8eEhXOYRzDVSN5vQG9cs5Fst7VCtniJzamS9RUoPcl3?=
 =?us-ascii?Q?QigbLfaxatzLQPIN6QYVqjG8ENuUPhqQpxKlgqkaqCVBjPADx0ui1m6v+OWI?=
 =?us-ascii?Q?moevJzwM51ZrlmqlfO/+V3VBvoL471P0AfPu9TZ40kYyn6Q+sgwkuwtxdamr?=
 =?us-ascii?Q?6C/NsDk4gCHJkuoQiaBzoX+GV+793a9xiglOghp5/AKp/GE9fL1WwRoEffVl?=
 =?us-ascii?Q?O96AW+V2K83aVjqATKUrAlwnlavP9ehvyZqoRzFkCHVzg2vjxoSFKxiilbuj?=
 =?us-ascii?Q?YGDRYPZqI69LWsgwOfOvv2IFsCmVm0agasW8xdFmWqAjao2U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b02d0dde-1c01-4604-0944-08deb13309f6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 21:03:10.3240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBiM2IDGdRCOVh5wsA2JrZ/eLUhsrqLToQ6QmpVTqr0UvNCIj6/9c3xilQdmP7GxcmYcQW2kV5oMCFnpIRNxnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034
X-Rspamd-Queue-Id: ABF9053ACAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61535-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 11:54:09PM +0300, Sakari Ailus wrote:
> Hi Frank,
>
> On Wed, May 13, 2026 at 04:46:06PM -0400, Frank Li wrote:
> > On Wed, May 13, 2026 at 01:43:42PM +0300, Sakari Ailus wrote:
> > > Add mipi_csi2_dt_for_mbus() for obtaining the MIPI CSI-2 data type (DT)
> > > for a given Media bus pixel code.
> >
> > Thanks, I worked similar version before.
> > https://lore.kernel.org/linux-media/aP+isGnWmJ4tLXcs@lizhi-Precision-Tower-5810/
> >
> > strange, I have not find updated one, I remember I posted.
> > we may need more information, such as bpp.
>
> Ah, I remember this, too! I'd prefer your patch in fact, but it needs some
> cleanup first. I'd be interested in seeing the lost updated version of it.
> :-)

I just post single patch for your reference
https://lore.kernel.org/linux-media/20260513205949.105444-1-Frank.Li@nxp.com/T/#u

you can combine it into this thread, I need more time to work original imx6
stage threads, which is big changes.

Best regards
Frank
>
> --
> Kind regards,
>
> Sakari Ailus

