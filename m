Return-Path: <linux-media+bounces-66024-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RCUxCHziQmrmGgoAu9opvQ
	(envelope-from <linux-media+bounces-66024-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 23:24:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 740D76DEDE0
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 23:24:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=ZzDuV3vB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66024-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66024-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D8A43033D37
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 21:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A08397691;
	Mon, 29 Jun 2026 21:23:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011056.outbound.protection.outlook.com [52.101.65.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6267383983;
	Mon, 29 Jun 2026 21:23:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782768211; cv=fail; b=mZ8qDXffdFpGo9alk8cd2P7RSywihJ39zUZJMvjFhOfnRZ27SrZKPsjJO//vxIgs1vjzANaL4313Xy72/bMoeLBj4jRsCPuGDxR7GWBSbhNvdejdZnjGzjbR/xPowdMkupDuuYGxIIo1TEIGtlOPoWp0JTfe9bw3g/Ur7gaEwf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782768211; c=relaxed/simple;
	bh=uu2OFm7VXRIlyI1fftpmnf9PVNIDd26GCo2x91CNiG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aAjnQfLTHRDFku16XZDvdE0GU/L1SqVwEe/V1RoZMKMZFNrOB+DEEKHXFeC1c43QzC1w73uwI5Ad2J4c3PG3f61rF/bgwCaru0Jel9ZeMcabGZrmTsApmzIsP1Nk3wFXz6uUFKikIqzAu+dhQQeZkL6VD2XtVrBQoHj1j28rSBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZzDuV3vB; arc=fail smtp.client-ip=52.101.65.56
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbI3ZjOKsFMRd4Yqxk163dHW4FLhGwLb3tdqdddqp5HhwN27LYH0MXh7pBboG/kB4wWEV+JKW0kogxbz0IbG3wsPqvh0NdzRqhpXaQFMx9a0T6Hhl8iELvKxUBrtcT3QzITEyQ535ESUGZ2vBrJYgBcUXOzo54YBC0/8MHkrjYGSlsN8yoZTI3va47P2tmfYJz69W0RTD/b+7PrLudWO8VcfT1KFqcpSN5USvS6RLxXiowKb/gyask3Zf6qhjMqK9ZHKipEqM8UfxV4K9ay4664SpG/jMG6rx9DvfFKOUAUyZTTJKlqv0ychQ9ivsQpGbf+cFSY3Wqg+503zq/J+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZlLJ8eKeokazvJmP1FmZ3tWkJpJ2bQi4AHoWyzKyEI=;
 b=MnmTzUXxA7vQPqeofSWP1O+yzQkihc9u0BbtRjQJSrA8PaBkcOYK7RoWh6pwXIOnVkjkvKyzcvPKKXkieWh2va99FEO41IxIIQxpNlrWf/STw2JFrsCvtFJqwbDLEuCI0MuhNq9kF0NHOEoaeE5/xrnBm8GtGf5tek6k8Qn+BdFgpxGl+TCH71VOOlEyDgx+9oPDMw7mkimrXaxkl9OkLsSQzxeid9INONggxt334ItK1JorrLfLAa9/oGwKpq/dF5YURYnaT0wbp9j6AKYDGsHaoggIVZqKdTdI6VeGcvweW2h2MBcyDgntvWJUkbh2J+8RmChXE4dmlieqb+NKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZlLJ8eKeokazvJmP1FmZ3tWkJpJ2bQi4AHoWyzKyEI=;
 b=ZzDuV3vBuXvBL8pGavjc5gj0JDIl9osWlbuEsh17UX2ZWyg3G3OhicEa74w+iruZPz9zwOygw9MTZDKXhGdWptodhi1hTCAPDQ15aBlfTpnsfQLy4vO6F+RiFR8PdcW5PTYC2pJ+k/8c9G4KwRYyvMVmvTzS0lr0xoPnTollagKNhct+n8dAk2NdTAPT9hKSJHTXFhnieTSfYizzMLPjF+mD9urqhvBhG000jfDsi62tYubactucmrfI5F6B++Xgk8C3eU3Qz+PwgtOmjQM4FfhNsHWYMyAMuZh5IMG/2+tjok31aH1snsxR21OPzKdvKzfNtORxORncABHRaXPlCg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10305.eurprd04.prod.outlook.com (2603:10a6:150:1d2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:23:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 21:23:25 +0000
Date: Mon, 29 Jun 2026 16:23:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v11 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <akLiQc1q1G8C0ZnQ@SMW015318>
References: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
 <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>
X-ClientProxiedBy: SA1PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10305:EE_
X-MS-Office365-Filtering-Correlation-Id: a1afa79c-f06b-40ed-bbd9-08ded624a764
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|23010399003|19092799006|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
 UZcGRLbWmXuf2I/3O9rNglXoOsuOmT0HmTHCShaz0ibp0J8Rtc69w0+tlgk3pepKPk6Dw/tKzB2ToOghmprZh27/cUD9cMHSG5TJqznk6gkHEBvjH0xoHtE3YkB3XYQEbDuEgnWgv9qzp8MWBbR+3o36WyIvb8qU0efIYrYChIRPNkwGEPQKyJGUvegkkv5bzZ2TzLx6GHZk5WaXlG/C7HyrhWaD6n+PKNDbxa7CgFnPoq0mcPrCydaOr9I5a2FW1nq8lNWgl7RfgFS/8MwzwobfHi8pzxpd0lMf8AvEKpw/EJrDx4GnmPeeQuIUElwTWpexwT9Ew6Riu5lXRT8OSADExPufyHGAlNQaP8OeBl9tyv5GHXxmAEGKJRcW3yoQ9fwCjrv+FQdqFlvc0uBL4rUx9/O9IZUwrfRijPP+YtGFE/CSO+feEw3GB1ugDb/l1KzXonY4GrmDkQUGWczL0m6+bgZlnZDNgR6TnOx5gT2BC2mDu/oAiRoszbwgFd+wISyke3lfUVyDcm4NuvRrTwmgz0TcwMwL4NNZN7Ah0ZxJAhJInux7PESwITnR8yIF5LTBmiWBb5rVyzdtAQo4BIs0K6UlSjCtiqkPDyr/mXc6hXSp41dgpDTziUjSCDCm2ZmkZZwK+TfNMODPiNpm4A2SQ/w9v5dsjI4EmmJwQas=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(19092799006)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?6FxWADYGjnjDS+YxioJkZF/cgyTV7fMwmomXi9AZ6WIUz6h73keXItpvNM6N?=
 =?us-ascii?Q?N5KB77iQ1qRgPWWdcvHU/a8PusPgR0o78oZzzHazyOdz1fDJY5zmU7Lophfs?=
 =?us-ascii?Q?fkHANuWJQy0JoYWBNbAnK1rsRODGHrXAJPovROgJWVTAkUI3TFuYMhQXk4wv?=
 =?us-ascii?Q?Pw/RrwQwguv8uCqExEtUK/T4d0ZoO+SxcCiSwyFh40NV/3d+4rui3B3TL0qn?=
 =?us-ascii?Q?+0ngbU49dnmbsrhr3WKE1Mn9EzkRfymNkwLDPxnVm/OB4uuAL2GeiHjGPtg7?=
 =?us-ascii?Q?XyA/jTxTojcStNsOu4bohm5qQ8ZQ3IRNlrnOMPErFjGy84Mze5rfqoT0Jy9I?=
 =?us-ascii?Q?yibL4C7JCywXC5fukUsvzDwz3T7iyFmfLVlgaBvsmEMlIXssSL0XGe1QBO8N?=
 =?us-ascii?Q?+UP5EoxXDJ7sXhJnXLxPqU6BH7Guvc6BTlLlGd/DYp8czbHpMLkDvyxyI+oi?=
 =?us-ascii?Q?V3/IBZUkQ6G53cUtMYW3bIIat21OWEM3r5v6L8MSbr2XzdMxvQ7Z2jwXSV5Q?=
 =?us-ascii?Q?pf7uy/SBIn2rWeWBldQr65/eoZKkYKgun3oYR7Kn1xidKdjUs44pbu+d7dWY?=
 =?us-ascii?Q?bQDddJzqHsWJ4LvdN2JyN5CCjgs8ZGch7xLb1PqiNq+Cui4eCnoAh1vfA1j+?=
 =?us-ascii?Q?S3ZqEXGpBjGtsRONvbya+ct7AMU3cvdOYhtA0QJmrwM8mIof+7KAcYrjAbh9?=
 =?us-ascii?Q?2TGKHDPTH8evL0SlsasO7wNxYM0xDgsVRJd2iIeQelnZgB96yf1ZFoaeax3G?=
 =?us-ascii?Q?F254KVORMpl4S5ECmbxMd88mYzh0f59rfUCN02IYJ+jpT3fJsgn2yswxWBen?=
 =?us-ascii?Q?JB4RqPh6e8Gg3aF/fCUzdQ7KCRCLY4Lq5j7+amlrAA9Sb9/D8F0X2iQc3PFR?=
 =?us-ascii?Q?ZSPTVLSdWrev01Js04XqpjbWwGZDTUpqFYjYaHkx0SzisNrL4l2wRO9HFLY1?=
 =?us-ascii?Q?G9OCYRqiRGYNvfhgAFEyr/pjcP/9UY6LsHpYonOsmtGaAdy4sjXqQBOqOwnw?=
 =?us-ascii?Q?cv8Uti5vW7GVXcl9RkCiYBBz3onkZVFUtVHbVO1m/24IJFYiKuOyHP8mdant?=
 =?us-ascii?Q?A75onXwfiiouITRDQwsF/2cY6SnF42+BXiosEa1Bqwi+aDxlldj+I7CvBOUA?=
 =?us-ascii?Q?LDpVh25j0FVL8sFUuRcreIrip0HoxegL0MUI024V+zsQwM3Ih6KS5+4OTsEJ?=
 =?us-ascii?Q?qO3+Ms1EdlckObZcECnOilfUS9PWTEuOW/cVdH61lrpqm9qu/1MX7gR0aic0?=
 =?us-ascii?Q?n3zBw0PvDkcbWgFwhDo0xq5+qDFMRdq4/mJcaz/z0UegF7hubg/lF9ds+Dzh?=
 =?us-ascii?Q?um0ZEShojdh1Urx61BHJDZawkiIXDWq5AQu8/BdTNx01E03du7Ifno19CxlR?=
 =?us-ascii?Q?fhdt5CyhjvJrl4ABZFtKLKwsw7h1e9eahv0ws7x9iWBLTd/u8YhtnvGCeIF/?=
 =?us-ascii?Q?MyRpxFq6UmM9T1OxpPkY08q+Jtz6inXBpcdCgql6GRrxcknwUSEravtSz8dz?=
 =?us-ascii?Q?mIqF8ig/EwcbC3CkPx0PJ4aiNQFKGdBmFOycDotXH4Ajx/VNveZI7ioPcAni?=
 =?us-ascii?Q?fNHHbhIwk1v4AUtG0GyufjFvO7zMfPI7claIphZXx5pUKvPp7MDW0vPFrJDi?=
 =?us-ascii?Q?CpbD4vb5Xsv0f/frGo9Byetadi0SHczI6gUNjFwOb1EaEvxEP9/syeFOGMSj?=
 =?us-ascii?Q?zk7JmVKASeSjN0Itf5u/Ev3UlIuXlCykFeziTDo3sGyN3l0jAPJdMxfaJZHt?=
 =?us-ascii?Q?TgeTpB4EAzxuDlyas2jkScghrAiQrGRB8HGrN//8M3BYkWPeq3lN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1afa79c-f06b-40ed-bbd9-08ded624a764
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:23:25.1534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exHAs7ZfsgFXLmqht9gV+UeDrNlHtGL9uVvxV+2URGyV9xfQ8rKnJXlc6jCNNWmmrZnhvpAKV62uUFAiNJ9i2Q8fuNIbpzLBUsM119w/Db54V9Ca51Mt6Vu7VQ+oWSjm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10305
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66024-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:guoniu.zhou@oss.nxp.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:laurent.pinchart@ideasonboard.com,m:frank.li@nxp.com,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:guoniu.zhou@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:from_mime,nxp.com:email,SMW015318:mid,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 740D76DEDE0

On Tue, Jun 23, 2026 at 11:56:32AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
>
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

Abel Vesa:

	There are week dependence with media driver/binding, Can I pick
this with media driver together? If this go through clock tree,
"fsl,imx95-csi-formatter" cause dt_binding_check failure.

Frank

> Changes in v11:
> - Move properties to top-level and use if:then:else (Krzysztof/Frank)
>
> Changes in v10:
> - Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
> - Add formatter subnode binding and camera-csr syscon example
> - Update commit title and message
>
> Changes in v9:
> - New patch to address the issue of formatter acting as a child node of syscon
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d6..fbbf1b3f1790 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -39,6 +39,18 @@ properties:
>        ID in its "clocks" phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
>
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  '^formatter@[0-9a-f]+$':
> +    type: object
> +    $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -46,6 +58,23 @@ required:
>    - power-domains
>    - clocks
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,imx95-camera-csr
> +    then:
> +      required:
> +        - '#address-cells'
> +        - '#size-cells'
> +    else:
> +      properties:
> +        '#address-cells': false
> +        '#size-cells': false
> +      patternProperties:
> +        '^formatter@[0-9a-f]+$': false
> +
>  additionalProperties: false
>
>  examples:
> @@ -57,4 +86,46 @@ examples:
>        clocks = <&scmi_clk 114>;
>        power-domains = <&scmi_devpd 21>;
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    syscon@4ac10000 {
> +      compatible = "nxp,imx95-camera-csr", "syscon";
> +      reg = <0x4ac10000 0x10000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #clock-cells = <1>;
> +      clocks = <&scmi_clk 62>;
> +      power-domains = <&scmi_devpd 3>;
> +
> +      formatter@20 {
> +        compatible = "fsl,imx95-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        power-domains = <&scmi_devpd 3>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +              remote-endpoint = <&mipi_csi_0_out>;
> +            };
> +
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            endpoint {
> +              remote-endpoint = <&isi_in_2>;
> +            };
> +          };
> +        };
> +      };
> +    };
>  ...
>
> --
> 2.34.1
>
>

