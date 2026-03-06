Return-Path: <linux-media+bounces-54691-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1Y1iNjdiqmlZQgEAu9opvQ
	(envelope-from <linux-media+bounces-54691-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 06:12:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E3C21BA4C
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 06:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A048304ADA5
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 05:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E8136D4F8;
	Fri,  6 Mar 2026 05:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KIUzFp++"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B905330B09;
	Fri,  6 Mar 2026 05:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772773905; cv=fail; b=Seyc+gNQmlhZTx86MJdOu6MXotw5gi43JgqN4+lk2LqCUzD+nwjLguiCJPMEyNgP0M0l7DGVoUMzL3vTtiXHSYDtCF+zXanEhq9Q2MPDNDyAHVp/xmvPzBlosspuVm2Sw75AEo9QC4659grUpqdH5lUx3QutsPqiD5Xvuf6N24U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772773905; c=relaxed/simple;
	bh=FcEYRZH2RMrrW3PNhsBqGbCri+MpM4umzULhC0iQRkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aE6QJRIW6ZTaDqsJ8qks0NLQNE8n4QKYmZ+TffiCB941AuB9gXRZ9xO4Fn+E3hSqR9LKaveUroGdVtk4RP6f9Veqhh8rtw2SXbKItM4tkn2xwfAj9VywETOH3eIP2XiwelXgaMVjpVeGOtkmNx1XbJq8+y4qOOGo8/BMzmfEJMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KIUzFp++; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trlOvZZMCD2T8k476KhWP9JnNlbr2Y7cwRlG+yis5IEhNPZJCKUGWeV9Lxv0bJAp+swFMokB9snr23HEM0yoXDHy++gv+D/ZoHRLKhRG9lPk3IjZaDnT0TipY1RwZpMkUuie+Lle3GDBSPicOkI3ZoxtZN9OxL7NNuOOWr1BfjgHT78VYpVLDDZvY70Tvdsutt45a5X0LVGmAkS8gMvrqEhq0ui0sWx49qm07iFJ5oYIKY0Os8Ip43pj+uoggVQSMXQ9/UojvK97mPdRwwUI7ciVY4mTZqGDwd/pQTTNMUNTVN17eLt6OhrxqlDHSfPpcOH0hbTZPQLzyjBn1KPvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcEYRZH2RMrrW3PNhsBqGbCri+MpM4umzULhC0iQRkg=;
 b=MFddHI3iYwlnPNNSVEcXrCgLkF1mPL2tv03S03z12AtEiff/u85ep4jj/22lDDdiLOpOqcbpg/u3Rs8CHUsnIBUUanzGe/Nr/T6aoCjW3jv6RVqIrFmc3+4JzxuhihvyilsOkr+IsseqSv9e/JVtrqPJri7yugGcD8JyVkTuhiYfFVA9STSGPOyOpVqhFJChRtDgQ8S9BRWo/9XQ2cZbHqB0kRYK2V6KFh6Wb+OVav9lzZSDYp01O9kqHmLvju5+V7srParvXMT9dvEO27aMMC/RepK1efUFr/BYhLWhZPfuE8Ewp6a6XVXJ73CgxMNPvbj4GY7ooYJRy0YpjoFxMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcEYRZH2RMrrW3PNhsBqGbCri+MpM4umzULhC0iQRkg=;
 b=KIUzFp++W9ae9CcK+6I3QGRAs4yq2v0XM0epuAMZY2P+zk0q9RU8V75frxMxSNjsbar5JCezdclprBOC4qqunGRXwKNawD4okxbBP+FPf9K5+FlwrC/rKPGEL9z7LduD2Kc+z2Ct7wBXlPoeqUjBMVkRm2EpO0+nexbWdRvOyN6U1titdcHVfJ19KltW9Bbjj+Y2jb5ZHDK/ZHNESZ4wiY65YsihC/B8cV1upgqecjGYLFDJNdop8Dc4fXXXrKFI5xgWEW0pwsNmlDHclTLOznguzKoJ6Y0xmgEQhsWj8lFkIQo1k6ZrXVW+etJ38ADdhjbfCldaKe0FDeW1d6N4Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7957.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 05:11:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 05:11:41 +0000
Date: Fri, 6 Mar 2026 00:11:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-hardening@vger.kernel.org, gustavoars@kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
Message-ID: <aapiBcnPHa3eDLN5@lizhi-Precision-Tower-5810>
References: <20260306044536.149204-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306044536.149204-1-rosenp@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: ebcdd044-035d-48ad-04c2-08de7b3eda4a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 S8vJ4F/ay5PP9NRFoylOv1N/zcNytpXJMM5N2Y6PndQYft757qkMA4hzh8eAHN+oJxG1v0u8g0o4o7IRw5k/lu52zTCczc+wRgHf7yjeDyYt4igRBj6jezeHZmOxUgQBQScVX4wCIWXj4Us7ps+HBtnZ1llxy1dKildfTWcMe+TGHnp14XB2b8ESIGI5mKF7fhU1PHq/fR3QtjiTggM8RGYMKnYD54eXDetwWUTIUJ6Z5xMg7CvviKBIOSrZuntdrN6YI9+G+Z/Umb+hekGs74+WspcmiAowgjaJMcJKd+DL8FWzLbeTNDFtlsRM5XgtSdIeAGBBhfMu9k6CWEvIG6JSYaws528QzlBeCjN0kN8L0Gj0hBnKnkkNJWY0S1ggJF81nuE1gmclFEEnJ0XokcZlhm3UK0vA4c9qa0JvIK8ZwEMsyLtk/oXV2/rC37jlcy5toUHPjwboWBmXgjEuUbWCbPr2X4NMIFfRVA6S0f933DjX9Pt+QWdJtRDc8vGBHZJzUscDGSUklQirVQ55IEtpVtOy9MffM3n/WTcVd2/R/I/Jzutbz9VYy29o853+4BS9y0vdSpQjth6jdtsM+aMegInPenuJ4HVmGBj4vB/KivYnlNQNo8y1sI+SZ4ETZBnGIhUPSAjmqHCMj3UsTP5TjP50sBF7s6NALRPeKIJYvQvLYf+lZMgGK19+DJQpgNZpnQ/8oMes9aGYFaUFQFIIuZkWdQ+0hsnvFoXGzqm/0p8Px5YEmoAW9aRsIolJ8nSsznCMGEzM9jC5q813Bg4s1yQkQzNVY+TCYNpRsQ8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?IwdraBSgAXj6t/rtmj0jl26R7XtbX8N6ZIZxdjosISx5rj05AatyzE1YMNFB?=
 =?us-ascii?Q?lDIKu4P9WJkUrGr296//rVUM+uXWtKEfB9lsfAN4Hqq9GOazKI+NFkClQV7U?=
 =?us-ascii?Q?cZguhaqnzL1Lwfsd6bxJv6n/k2J0hPbHx+5VGBzJRYL+3LLDUvIMVysF6E3Y?=
 =?us-ascii?Q?WjLuZDpJGTVG1Dg5clLEW9U6d07Dd/NdILZ3mIbh6W5RnIRnAGsL3q5GyWBH?=
 =?us-ascii?Q?rBSq1u0/+or2eHYGBg+z4jc7D+Vxm/qI+41/44syMzq+8YUOa2ck6tuCwQgr?=
 =?us-ascii?Q?GjUePaRWgwx0jQLAlv5uKCLj/N/5Gcb2u3TJjG7oa/q5495a81muB6avAiIg?=
 =?us-ascii?Q?o/npw87aWqNcpmjMHOczYK/K8fBrI9VaRnmCy22bY8DHfTEKCpsnOD6Mxx/I?=
 =?us-ascii?Q?QVMvw67ixQgxgl9Q2vSV9JPrRvJpEMCT8X+bjaRFxfj1F6weD7exOAmt/IcL?=
 =?us-ascii?Q?QkmrBOaJuheYN1Kg2f5nNhfs0JLZP8zOy07eUUaWvsx7xlPE1/yZrTQsn3wi?=
 =?us-ascii?Q?8doPEC9tAsH9Sv10alSATlE4hScs5i6/fWGvp+mmEABbzheSFth0iagHh3YB?=
 =?us-ascii?Q?1JSD0Z1JEJ0xc/d1JDflC7yM6yBNwrvWcMgzXzyZGVUlrPhzwkOMtGKJr/8K?=
 =?us-ascii?Q?xpMXJoSG0yDKXBC3qeZxt+4EKioHNY2LAZDz+rj4vqKGmYQwhtriSkKXiRxm?=
 =?us-ascii?Q?sjna7exKPmyk6vgBwWoKzaJLjykkFZD73sByxyh+p4i9RhCu8ydNghqEN0kI?=
 =?us-ascii?Q?nm1wCUuiRLyJRw3IF1k+C5VK8lFZRHwpnr0gKAkte2PMS6yVPujcEKU2//M2?=
 =?us-ascii?Q?w6JJ3eHuEX/Z9dC5SO4aLRn1GOYAFngzzbJmvevswfwFnDssWv7cJjimRiDV?=
 =?us-ascii?Q?+kO28Guhm8ml9hGdxaMIWhVpMeYfwBKePXCl7nHW+FVIk4UjCPSlb3lwlRI+?=
 =?us-ascii?Q?YP3irPWUWS5obtWTaKuU9lsPW1LS1UQJFQSvGjwhx0MUVCY8go9b/Jo7Zu1K?=
 =?us-ascii?Q?Q//kVR2zXi5MdlHGTrUmRUwEUdlNDVKfTTGQFvlMEGKOQViRT1AqyGLl1U5p?=
 =?us-ascii?Q?PaGi96I0ecYMDmUQxA8N+2UVlZDM+3S/ttlQoGGprGsL5B0KHSqSXf+M1FD0?=
 =?us-ascii?Q?ClULdpdQXn6ajr+r2AvLelIgis2omTcKYBY4xEb0A4KJf15Vfcf20Z7toRRl?=
 =?us-ascii?Q?36Z6CD8+GOONkAsLn9OBBbsAaQI6pD+i25m97FFrpKtUj2zKRb0M9dPaDQHX?=
 =?us-ascii?Q?rsX/3Rt7zXC0xshAi8E+o1hAgwPzeoH9eYLxZWwmaOD83p9Dewc4W6Dg/Roo?=
 =?us-ascii?Q?HwzWpWJy0j8m3HNA5ynkl3jcIymF8sQ+Bwg7IFEgv5KqG1/vEdlf4XoGymSf?=
 =?us-ascii?Q?VlN2H7pmeqa88b9hl83818297X2U6wqsAluOZjzI0bZz1BgGw/6RzNU/ipEJ?=
 =?us-ascii?Q?6BEf4NRpQv93cnyg/tG1jb6Vr3SGCcxA0t2qIZzEQ5QY5e/1C0cxsSsxO+9e?=
 =?us-ascii?Q?zrhBXkvbL4pg+jveBC3PiViqKt6lYvtvMcr1NEFkHVLMwm+qyfuEyx8F8Nlh?=
 =?us-ascii?Q?zNwn4eu2i4ti3rSPUTGaP9fqQ98D7b3K9KHI03BkcphUPP4G80zGSnjW9mtp?=
 =?us-ascii?Q?I6q5mwBLwIHcXk7oQw3QBCpu3CJc1NyuVke1dNqlaAVQHaQVwAZ8jdKZCD+b?=
 =?us-ascii?Q?RPUmfu/j7aGeNzph7Nvy8msPAeVcWD/SyJKSdhOSARX3D16aZufc5f9FX1sC?=
 =?us-ascii?Q?YgotL10GAg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcdd044-035d-48ad-04c2-08de7b3eda4a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 05:11:41.4988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iy3YCuFsa5s/TjVNxb7smKAIwAakUIy7zznKVqyG2S6kQ7HRahEZLCGIBeoNC0RI7kVHG5U/WOdboCZjD0HMDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7957
X-Rspamd-Queue-Id: 34E3C21BA4C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54691-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:dkim]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:

Subjest: use flexible array to fix memory leak

> Use a flexible arraay member to combine allocations.

typo arraay
>
> It looks like pipes never gets freed anywhere. Meaning this effectively
> fixes a memory leak.

Remove "It looks like". The pipes never ...

Because fix memory leak, need fixes tag here.

Frank
>

