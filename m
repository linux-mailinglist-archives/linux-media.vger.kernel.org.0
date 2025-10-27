Return-Path: <linux-media+bounces-45721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7074C1178B
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 22:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD6131A220D0
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 21:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5371228313D;
	Mon, 27 Oct 2025 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D6K5bCx3"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9BA1F7586;
	Mon, 27 Oct 2025 21:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761599125; cv=fail; b=b6FGKv5jvp26Bij6xE5bbR1SKwao3mMK48vTf6UU/AlmxVxdO7vyoKh2M0g4NQMO4ZGG9HGwMGqLPxOQhzmUpF8k4PkROaQ3HDosCXQKzp34kp0fy09ajmPoz8By6ZnV0HJYnEYORH4eXu9VsziX9UWc4Kd31ri7Gtr3tVqeY+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761599125; c=relaxed/simple;
	bh=QQcGyuaXyEqUqNFNxKJzvh1Jjv2gzD5/HY4pXfW4Ajg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d8Q555TanrTxPxBtWUbBsV00A+6o7ITPTf4Gub8JDdB3IpJVJVctxFAch+mp1rRIE1yD+BmVrmO40vlfMO2Q3EVc0zj7yeoUqOt1Ei6iy0B7xjMhrd9z8RCznhfDgpHgIz/Yx+OhX0kJ2TOwFt7prhcrK+qE2QtLlo7CVLerRY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D6K5bCx3; arc=fail smtp.client-ip=52.101.65.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiCrKiE6XQrTWlUEImg0qML82h3Qi1jc97CzUeIpe33UwVN/6eJsrjB4thuXe/fxni82j31isV2ouC1ElH1g/Zhm5i/vDmnBmLpjhou1DKSU7xqAxqmT9oWYX8gALPE8RPaUQTxzYFu5XUwY16/+rEsvhDGZO05wn3PYjeyQJ6wvVb55niOKIhcojr3unCyTWiyLv4xEj90t18tyTCEfbCVczV5k4emS281uCnPs5FILBkVbll/xgAnXx5UalzNTqqd4PEt1hZ/0QbkqQ31mAoq6sLi3AFby+SUcmi62Y1Ec9oab8whazPN6VaR0Cv6vNpwP1dUm6Y29i9FGO4ybuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpkGnmsDt+sAteJ7KbmPqnTO3sF2VoJTgvSPjt4Xk+U=;
 b=LZT7L8zSQLNcIzIXoJEYwgK+mLJ6fOih2zC4Uxv8L4sacrHijA8ARJFU/v/8mo1SGN1WqrN93pETjE3OuGirRgc0P29xVdAlLujgbA8rPrPkY01Ys+2Ui+3TWsSiE4S4xs8+J/1ui/qZBfMsVVam7sBwFTfu+Vm54yaBtv13P6VhEyhV2DcJ+r/F4CyF9XK07Wu/+uQmS9xo0uZ49WlI1n/Wj8UqBgzMbV1CVQ8VZdRojmh1UAfM7/0aOMd46DtY2XcH+frKHW6ut5rUUCDX+c4aI3rO7t1KoC6zSyIV97MiSTKrX0mFpKFJTDcOdlBLC0DbPIPQsQ140qk4nKoOcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpkGnmsDt+sAteJ7KbmPqnTO3sF2VoJTgvSPjt4Xk+U=;
 b=D6K5bCx3NgfpQzuC+QVKu+ekPyFjh4nyklFv+0U5K5tgzbEk47IQIKEH/aCk+3jmP84/uIdypK42VAIjJ9odylbEIUYdPF4dyDDCVMTUWLZKAH2NuN/7b4+v0ESSmD82svlPuFz9MsLcRCYjjuXEUu6w5zv0U+/BOEWKQS7UepTXJVBT6zj9ulCv9xwoEm5NTbLwiwLtIagRY1Ivnr7m7E8iJenqtv6YHOEi3MBg5ZNDW5h+Ch1QPyMJu6+TrPAK558cB2jQk1H4TdrH09AXzhegTXnj2PWrnhZRlieTYTuyW/3q6DgNI+oyVmHhSXB7X/0jKPDQtvwCw6x/rxvUEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM9PR04MB8649.eurprd04.prod.outlook.com (2603:10a6:20b:43c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 21:05:19 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 21:05:19 +0000
Date: Mon, 27 Oct 2025 17:05:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev, Luis Oliveira <lolivei@synopsys.com>
Subject: Re: [PATCH v3 01/31] dt-bindings: media: add DW MIPI CSI-2 Host
 support
Message-ID: <aP/ehdkppeVr5G6H@lizhi-Precision-Tower-5810>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
 <aP8t3YClrZxOnHea@valkosipuli.retiisi.eu>
 <aP+enPOHPkvZAkzS@lizhi-Precision-Tower-5810>
 <aP_bSQUIle_9-L-7@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP_bSQUIle_9-L-7@valkosipuli.retiisi.eu>
X-ClientProxiedBy: PH1PEPF000132E6.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::26) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM9PR04MB8649:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8b7c6a-3dfe-4814-e70b-08de159c894f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?aEY0PqVyMyapEXH79Pn3S5ZOk0LMvS6cE4x0bUntGEMgszJawdbXijAgpDQG?=
 =?us-ascii?Q?A2eUGoXQOmKKJj3EHEaBQDp/DpjcZIGRPNaThHH/Kw3wOEmxEnlT5k4ysA5H?=
 =?us-ascii?Q?AUo7Dl6dLf/+vOW2AMZ9BssJEw10ao1rfAbq2N83NlP8XuMjdedVv3LMzMtI?=
 =?us-ascii?Q?C4s0jkfvUbrQVdvEBXsW10pkodkmpD8iy6f9SN9mV8TBCpS2dV1SyKtYbgpO?=
 =?us-ascii?Q?RC1Z+MHHBSAyxn9wFu5ZDpIUnJQdcKVKwnhS4rxyQEIOWjsKhlZcStI8h8pQ?=
 =?us-ascii?Q?kvvJYzWA5M3gRLw+EXX7V6f80gmedm04/AEYfNd8vmU00ulNTTvy3CJP0V+A?=
 =?us-ascii?Q?wOjZ6P5cqkl1jJaS1Yh40ph/Fi0+Fhb5bW50E0DK6gpW5knqxUxJLXR46zz+?=
 =?us-ascii?Q?W5ye67UxYAKGbc+q9Gi9k5PbJjzLK6RfbX5KlEYzgCJz/j5TULfJZp7BvuAr?=
 =?us-ascii?Q?aQ1iV79hKsjFxELEZ/1TZJqjIeIz5tRvSxMIXji2UJTZw8FH0IAWZAxy3ohv?=
 =?us-ascii?Q?vOeH0WP6G183PkLjLEQMI5Yfj+iLADRaXK/HCNL2hwj9Yviqm5lW6SW5E6cx?=
 =?us-ascii?Q?+5N4MVDPDLZy7NU2BVK0+eh/KQMh/K+wzNyFAra68HQaks4E8WNVG2HVhzQk?=
 =?us-ascii?Q?5/XKGLuhrVhCnCwbnOrnTs6lt9qmtzbwOtwC4xleHa/zJIZdRScghgWJBTSQ?=
 =?us-ascii?Q?G+lYC0jmugIXtChq17hANGTIbT6KvO1pYlIJU1VhUx1xGVF2eQPIn0KfKck8?=
 =?us-ascii?Q?/Lk9Phy+46EE6A9FUQ3dVQbfTb2EnVpnfXelyB6AA9cO4GbNH1WBTUwJKjtq?=
 =?us-ascii?Q?nc2VgpFmt3QxnWaS0B6s9L9XwcBlPD8HKrlV5j0prM3h2EGjIXzFkRq2TS++?=
 =?us-ascii?Q?4CCw97qmsf75fN3abFbrXzM3N7i2zmiSTnCFQxThYXIYQZy2yAG/YZwRg3Qg?=
 =?us-ascii?Q?+ASUw09NbzQd62eryJpJJIk24YoVqg2z6xp0DtQUObP4DNETc4u8Lj6hBAMz?=
 =?us-ascii?Q?vKtgngl278tUwL8WFgeG573VQNFndKI00fFWv1AFZLggXXrRkQiuohnPzzNb?=
 =?us-ascii?Q?2S1T7bqi2crbY58zRBcImllfyRCdotVtgqoSvXuR4aOLbNEtna43EhgvtfVs?=
 =?us-ascii?Q?nEDuopeKRMIcNV4prL1ebPEDPOFwIH5DG74RB1KqXfI416pGM6pa3x6vRGdr?=
 =?us-ascii?Q?sZir6x2/VL8Jg7Mj5izvX26ZZTd3FHnMpGBb/aAk5b2mEtnXlu4N3Cud6j8D?=
 =?us-ascii?Q?Z9Fjwsu1Nl0rSZjpzoBgpR8L5+jepyAQnmPDAWKgMoIINPhR/HTbF3jbYNeN?=
 =?us-ascii?Q?CvIhu+1F4/H2Zizb26X2KJbUZNIyjWwzU2k54vJHblCrDdXnK4wRqCHjPFUo?=
 =?us-ascii?Q?TDzIXRTH9m0g01A0amcyG9mqS3pt1UnLkm5uuM/NFTxvVUSlOJSxuHpAmTbR?=
 =?us-ascii?Q?/VdWlTNoRklzs8YRBHAANjkbYQHrKWK1gnwOpVH2r9Fz0sH6EaHNGg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?WVAH0VOUQuUWwoazSAX8tlrHT0nCTjgPvWXCd22xJVSCg9pxgMplGHvpMNXm?=
 =?us-ascii?Q?SXabkecnN9hYbClSS5uKozFvwxq5jgLBwoQBMRT9xqmtSvULJ99VWO1yYsVN?=
 =?us-ascii?Q?2EMiAGGMkpolnSn+fjZJN5M9ezSocIdBubrpzkk19PpF7haCHGsIDX+kmhL4?=
 =?us-ascii?Q?f6Rfv6r3avKbrhSBF3qXET9p3wfkJPOwPouBNkIAnAIlJrpYSZ5uPRPwUz6V?=
 =?us-ascii?Q?+0gS1G5nu694pxeNadfF+LGQSRwifAiH0H2yhPCkCGuQ+fjn5WKMAy5QSiqe?=
 =?us-ascii?Q?uNW6hkxDWr/p49A7XK5MGvhXWYFOrdTOadVfc/xUbj/zsDamP7KHli2q2egs?=
 =?us-ascii?Q?bn7ETfFoIY4XVEigjObRh4n5brfefbgGgx8olcsXmB3g4D6kydYlrJ9Hl7u3?=
 =?us-ascii?Q?gQyX1CnGmc+AoVHBjK3mq1GZYI0qNQTUY/YwvsOi2+eMK/hxz9em+KDOUGAk?=
 =?us-ascii?Q?Zj33P8HW82sWNpKlb4VPvUuC7VPJaGD8leO5yWlNi6VQxREPohdgGRTXnsvv?=
 =?us-ascii?Q?edv16wErfSLlqQZxmvVFm0qSYhy+/sqPQqG1oyvHzIrlzj2vmo+zAVuRCt8H?=
 =?us-ascii?Q?0G4orI43Y6Q0jAMSlUWC6/3fc2rZ/6Iw8BQ4hBQW+Z/8Y0tNggIUwFC4Dbo3?=
 =?us-ascii?Q?kfL1l76NVSypaxyGuCNYzk6mu9IISi7yev1bOQwxDMr0cAstY9EUXNKTc/1N?=
 =?us-ascii?Q?T2F0PkvMjePMldsFGpzHHCZnjXU2SRaqsWfpOSTmwYtkT1PgVSBeF2xAH5y1?=
 =?us-ascii?Q?KKrNJiS2FksWf4JprI0GqB/94t2u9ntSLjBHlUkyI2XPKpuHe8NZcg1lQsB4?=
 =?us-ascii?Q?7OVmcL666miiAIOJMrG/O4jw3sv4mMhcz+lvJajRtxBO57l5AVgYI2QV9VLq?=
 =?us-ascii?Q?V5u7W9gW7Wd2D+VUgn5k+nv1/rVATWf2T8UwGWfrWLe/ycHnQw3MGTwVcx8i?=
 =?us-ascii?Q?PCallBuIsIRF7ggPCj4o2Fx9uEhSDPgItFRi1HTVS243GEMowxiPEqJ28ds/?=
 =?us-ascii?Q?G5ehy6wfBTJMNIeeBJNtqbXiY0mcRk6oGxwkPnLfJlifSvzlCBLWbIb9CmDI?=
 =?us-ascii?Q?pTSEqiyUSsl736i35lP36uZr6wRoZJrzBicTjbvc65iU8YgDfAllN85LQJ8V?=
 =?us-ascii?Q?b9darl7oxILhyn8i5FlT5BXxoxXiqNzomvPXla1gfT2TZOtR1j9pccF20gW/?=
 =?us-ascii?Q?jVQ5ECp74GMVzP737kIFpn1ZT/jKYvMQQUN0JlKAxPlRm9st3jNW6qtmcyfj?=
 =?us-ascii?Q?iO/sEuvefQFdUDanlnKXz9YoIYLvAh/IHPipo9Sp7yvssjoyE82SPP/jK/hv?=
 =?us-ascii?Q?+e0TMVOE9zV4qT7VuU8g+oLyu6aB4nXRnHFsmwvZoDZB/kprvaLrXS/nVUXl?=
 =?us-ascii?Q?qBwyCeeXOpoKNUFTlyL9hNxZ9iX0zci5a8bb2pBNZZach6m+CNYmg+zSSDb7?=
 =?us-ascii?Q?YLmfdoFdsnXMausUr1+krASOhqGJgZIEQ4l/UE5HSGAOHqb2+/w5lJLv/K4v?=
 =?us-ascii?Q?Qw1md442ePqQvR4j80MpSJLxBB84AFG4fEAyzR7X4nIP1jYrrkPcdvlEhrAF?=
 =?us-ascii?Q?TPanF7F6gO6S7fHjEQO+jreqeoAGb3hYGPHMi1aF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8b7c6a-3dfe-4814-e70b-08de159c894f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 21:05:19.8471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KuvCgokffKVRRM03Y7RpBJ56yWawDBt5ujlAUDfeZL0YX9pgZQSJoFUgG+j5dWmMFOXCBlIJ9ln6RLRDaQbJog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8649

On Mon, Oct 27, 2025 at 10:51:21PM +0200, Sakari Ailus wrote:
> Hi Frank,
>
> On Mon, Oct 27, 2025 at 12:32:28PM -0400, Frank Li wrote:
> > On Mon, Oct 27, 2025 at 10:31:25AM +0200, Sakari Ailus wrote:
> > > Hei Eugen,
> > >
> > > On Thu, Aug 21, 2025 at 04:15:36PM -0400, Frank Li wrote:
> > > > From: Eugen Hristev <eugen.hristev@linaro.org>
> > > >
> > > > Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
> > > > and i.MX95 platform.
> > > >
> > > > Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> > > > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > Change in v3
> > > > - drop remote-endpoint: true
> > > > - drop clock-lanes
> > > >
> > > > Change in v2
> > > > - remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
> > > > - update ugen Hristev's s-o-b tag to align original author's email address
> > > > - remove single snps,dw-mipi-csi2-v150 compatible string
> > > > - move additionalProperties after required
> > > > ---
> > > >  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 151 +++++++++++++++++++++
> > > >  MAINTAINERS                                        |   1 +
> > > >  2 files changed, 152 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..d950daa4ee9cfd504ef84b83271b2a1b710ffd6b
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> > > > @@ -0,0 +1,151 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/snps,dw-mipi-csi2-v150.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Synopsys DesignWare CSI-2 Host controller (csi2host)
> > > > +
> > > > +maintainers:
> > > > +  - Frank Li <Frank.Li@nxp.com>
> > > > +
> > > > +description:
> > > > +  CSI2HOST is used to receive image coming from an MIPI CSI-2 compatible
> > > > +  camera. It will convert the incoming CSI-2 stream into a dedicated
> > > > +  interface called the Synopsys IDI (Image Data Interface).
> > > > +  This interface is a 32-bit SoC internal only, and can be assimilated
> > > > +  with a CSI-2 interface.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - fsl,imx93-mipi-csi2
> > > > +      - const: snps,dw-mipi-csi2-v150
> > > > +
> > > > +  reg:
> > > > +    items:
> > > > +      - description: MIPI CSI-2 core register
> > > > +
> > > > +  reg-names:
> > > > +    items:
> > > > +      - const: core
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 2
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: per
> > > > +      - const: pixel
> > > > +
> > > > +  phys:
> > > > +    maxItems: 1
> > > > +    description: MIPI D-PHY
> > > > +
> > > > +  phy-names:
> > > > +    items:
> > > > +      - const: rx
> > > > +
> > > > +  resets:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +
> > > > +    properties:
> > > > +      port@0:
> > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +        unevaluatedProperties: false
> > > > +        description:
> > > > +          Input port node, single endpoint describing the input port.
> > > > +
> > > > +        properties:
> > > > +          endpoint:
> > > > +            $ref: video-interfaces.yaml#
> > > > +            unevaluatedProperties: false
> > > > +            description: Endpoint connected to input device
> > > > +
> > > > +            properties:
> > > > +              bus-type:
> > > > +                const: 4
> > >
> > > If 4 is the only value supported, you can drop the property altogether.
> >
> > Sorry, What's your means here? There are more options in video-interfaces.yaml.
> > here just add restriction for bus-type. otherwise other value can be
> > provide in dts file.
>
> It could, but wouldn't any other value be incorrect?

at least that 5 # Parallel doesn't make sense for CSI2's input.

Frank

>
> In other words, this property is redundant and should be dropped.
>
> >
> > >
> > > > +
> > > > +              data-lanes:
> > > > +                minItems: 1
> > > > +                maxItems: 4
> > > > +                items:
> > > > +                  maximum: 4
> > > > +
> > > > +      port@1:
> > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +        unevaluatedProperties: false
> > > > +        description:
> > > > +          Output port node, single endpoint describing the output port.
> > > > +
> > > > +        properties:
> > > > +          endpoint:
> > > > +            unevaluatedProperties: false
> > > > +            $ref: video-interfaces.yaml#
> > > > +            description: Endpoint connected to output device
> > > > +
> > > > +            properties:
> > > > +              bus-type:
> > > > +                const: 4
> > >
> > > Are both input and output of this block CSI-2 with D-PHY?
> >
> > Yes, input from camera sensor, output to others image processors to do data
> > transfer or format convert.
>
> The description appears to be saying this is "Synopsys IDI", not CSI-2 with
> D-PHY. We don't have a bus-type for IDI. Couldn't you simply drop it?
>
> --
> Regards,
>
> Sakari Ailus

