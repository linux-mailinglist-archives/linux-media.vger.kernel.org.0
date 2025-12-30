Return-Path: <linux-media+bounces-49760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05462CEA494
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8313C301F7E2
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C13D33121A;
	Tue, 30 Dec 2025 17:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wGGfvs0s"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F43F32F754;
	Tue, 30 Dec 2025 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114603; cv=fail; b=lZTd8rXawB/hecm/ll+hl0kzQf7WSIgk+E2xl6gWWaRqzWmnR1tKd+z53b2tJv/64zBTl5ZNiIX/KIgvnbvMHN7pLvEgYuQ6Y1m1NZCVI8ShjiDCJ8EfJeTHi+Wie2GAxV024pJvg23ASFm8XLRaTP0uTAzmYdO7Nr5iXtexVI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114603; c=relaxed/simple;
	bh=ANnjtNBekBcU5QOWFeSVNy+ldfz9zoddFscblB2nC0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=giveJrSjcD+OCHqBAGe3/auptqrKv9w81yUSKS0aAzz0hVo6i/8asQxmZvVk6nzAMScZLWFtKRbiQTIZRPxLFTxkA4zHTOznBx3btHbBtj1St2WwqwQ4R3vh0zZTOR/hnR0onAnPJoupIwhBpfWryPH9x3NYMm9NzjR/ppgzOnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wGGfvs0s; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJlXyhOCtTQwaYgexTsEHkvaStPTtR9DLWH0eqANPzalhnkgTppxXvWszIheqIMDsFH6gmWTYzMi7rV4B5EG0GMI6PsA9c5s7sS6eBbA5FqyJyQcA7TntfJ9Bwmb60RVuXe56vUfimy1S9AFxCZY7wHQMom7GYy7TaICA6HR8qyX+tKVKF9VxDjv1ADAvO8AjIX5G5BPK4ONFIUKJluSPPX0Vk+v+DS2CP4OdI2jkyuUlMX1KMCpVLVYzQLVA6Evgjk4kvn6ajY3rl0Ga0p0C8YykY3LJQYqEF6bj7D5yjuVyb7+gCa0sBRp0qrnTOB4ka7LftJB5+l7auqBzjbzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfVOLVaKEG5Ca2L75QeyyhbyZvddU9pYFQmOBoif0cY=;
 b=Cr2A76yZ3poqfUWNqWoI4OUMdhryGLuNs0MR4ql3gzY7IHadOc5IX2w8pE+JMA2SPoH6qiAY8cqsD+yYhZ8G5u/17ZHxPZQndIfTXSc1FO+H4Xxy91KatxeAA1EF6VgugbnbolSH1s7SPKedZdsg94KZ6qdcQOfJzsfrj6pCLRjg0ltpg290iQ3xyowZB5sOIQ/eH2jgqQ3yPXqozkYclob1303P78k0BMoVLDqG7IGAf/QKMggHUpk4iKPaFsMQFg/USRw6T7XA+NZ2yKv4zv4npTK6Z14ZCCVR6lsiIc5WJGhaZDhgTclTm80T0c70GFIsgVmz2/KRcHDvkFE3RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfVOLVaKEG5Ca2L75QeyyhbyZvddU9pYFQmOBoif0cY=;
 b=wGGfvs0sm+OlVN6yGnPC1U8HJgLJtftQ8sRLprSG3pmrwKvhCaJzGtUUk1bId8quGJn3WZSOTky4kMlxZGEkJLmIwSoZqZcLRoTTsSBxhXVEHJiW7c9ts31Hc/MORbNOu5lTf8bU42IqMjKMLWpXhARZeL0Kgibe7dqnqsdI/GI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB17518.jpnprd01.prod.outlook.com (2603:1096:604:44f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 17:09:55 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 17:09:55 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: rzg2l-cru: Use only frame end interrupts for DMA stopping state
Date: Tue, 30 Dec 2025 18:09:16 +0100
Message-ID: <62200deb6cceb09fa9f6086c3d9ef9031b8db5e4.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0399.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB17518:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eda795b-d56c-4179-273e-08de47c640b3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OLirWQpQmsfTWBvWGcQmYmwtw5TYyb35OTCRCzW6+B79dFE0Gd9nKRm931pG?=
 =?us-ascii?Q?bohoDdYyxDHBkSA7lg8IxhvupnHnUx+OtUfyDKu/z5WM3eBObwCOy7pzYc16?=
 =?us-ascii?Q?0mcPLcnizoxe6N5JU4gHsN4ndbJ856Ek2yGAQn8CeeMBt3ORldE6CDlyKCeu?=
 =?us-ascii?Q?y1ANqgX0NJc7EDP7Hn60IPJTiumrgU9WcfluZvOM79HSNjR70jYwkE3+vG+C?=
 =?us-ascii?Q?SLdbASUdUIm6lu6z76mmYuMTJ2QO7W2Bb5DF9WN45V2iDyi8gDbK0nIg+Dyu?=
 =?us-ascii?Q?5jtgE+oeMcGejhHJWTPEcRPP/V16rM34aLEV+BWYsJ+LlXbMml8TOmAwZ/U3?=
 =?us-ascii?Q?OLVB1KCfM1npyZ9AGvNWcNQMSuwvehna0ZzXa+1ihRjjqLR5aa9+XYxi5rNA?=
 =?us-ascii?Q?2t9pd9Lj6QOEcFZ9Ll4CymIfxSbMWsjeN7rkY1bQWFj4XYmwC/xsagWwPKxU?=
 =?us-ascii?Q?CVpdHbm0Z6DPcpEfAOsIC0QDDtWbdOkhGTEMbZ9Vpz8Pgj1GwbU7/M9AvdnN?=
 =?us-ascii?Q?NHWRmDNz90zWzwOy9iVAltRKHaOLMB0AhSnjyUv5indsZzbiBzR3OfMGgyn5?=
 =?us-ascii?Q?JGKBRbROSYaKGHFbkQD5FwCoHbsSZrccY9FZjpSJEw8msynY1yPm2fn1xO29?=
 =?us-ascii?Q?FQQEKAyD399aMW0Tk/0HA0WoEutB6abcNccNg8d1JFZpCJGRg0BeFi1S2Cdw?=
 =?us-ascii?Q?v4yFAQxC96Hiw3C945rd7eb1QdggcY4c8ttMO+bxa9kpz4YgG6ZqKbxk8+/C?=
 =?us-ascii?Q?G/WEeceB/jKYLohlp/zEVXupbuort1+Yb/IhBvykfkfEx1JzdXrHjNz2sVVL?=
 =?us-ascii?Q?ihSLmn3Zmpt3sGGaurxiJaHcn0ROZ8yOE+ErdOE682J732kmeiLcpc3FcCt7?=
 =?us-ascii?Q?OhH8BoiYkMNMhDCoVd1ehh1Y3KY9OdgA+/hgMGmqtgyjlOFEsuZY8Npekfgu?=
 =?us-ascii?Q?3InDStZu9LfXowp2/USKYyswWEpCBUs9PWIVpPExkmaU9RflliACdnZ0UPZ6?=
 =?us-ascii?Q?+NvjnWGwTfYDTtLeF0gbgQWs2Cw40Xtz598wr2FVyxjztKKmOWLsYBsPeqPz?=
 =?us-ascii?Q?TKONEmhJDi0+RzcnRvENMDmSR1ND5M3feKJqyYyfH+qSMxjXzSJZgULF/6My?=
 =?us-ascii?Q?hkyIp3+IZ0Ha+797Pp9GhfZc4pE3ufvKscmt2jYzyzDJA9Hw+/QHTsrt2pmX?=
 =?us-ascii?Q?sxKSrBLjO912w7mcy6makePeY5Ix+W5gVakOLGosZdoHJawIq/+zR6efM0e4?=
 =?us-ascii?Q?IeRMMpXmkWLX2pJLwnkaIJ/EVfgweGQ1TePwTtes0PpktmBdFg/7JpObal+I?=
 =?us-ascii?Q?FCLFUqLqYRrkuzx6kCKkLebUQ+BvPIWUdtRhETwebeb1Vd36r374vmyfkGzY?=
 =?us-ascii?Q?lxQL4HF7uOjPOkOAzpkjEFziedPPCkUnXM540CGTM3khYfMRp3N08om7EzHB?=
 =?us-ascii?Q?P2gBuFvhJ8kiA+J8rPu2r3UHeJ3mNahManY9T5MTXquY3ohanfTWTfNmYj4A?=
 =?us-ascii?Q?wU47v5fLoNywu8T4ZTxK5kfHnY/U8ye6zeV0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eIuhRTf+xG/igvle9qbZdA7XA2Ss2ekw9JyrUWrPwECQ7Gy5avfLjbT9emnm?=
 =?us-ascii?Q?qj1Lbac0Malp11wcFjME9VNhvtIfMtZQL5aJxpcpPC8aQSG42blv9+IQrDSS?=
 =?us-ascii?Q?dVzPZ8x1clVw+5Nro70IEtNx7IMEi51j+AXqg16yUEV3/PEsHa+cPPBs5nCb?=
 =?us-ascii?Q?v4PUVDvgK2vzdAwjZ1fN1s4UgL7qhxe8LdL/mD3sfywQMUO20P0K2Zzf2t/k?=
 =?us-ascii?Q?j+dyOl9Ym1bOC+hxcUVqRe1zmXbe66zm93Y1YXkAH9tcPf1GvmcuHyVqhKnh?=
 =?us-ascii?Q?M6z3dWPvi1JXjbZRzMO6gEjKlk8SPIDYsip4C/VRbdqmfza2jO0bcn62dU/S?=
 =?us-ascii?Q?ug2ivLH+e78zZSAsBAVI9BUbIT8fWG2obfhFfJjHfmeff5uJcHsP+j4KaxhX?=
 =?us-ascii?Q?mLCK/8IuWqQiCh9mq/r8lYvLwpI0GmDAZzfrqT9kiGTacE2a8HNeNPzoDeYZ?=
 =?us-ascii?Q?37GxhyMkr4xXtmzonYdXUcHDcvOdelp67ucSHea1kBjKMNj/PwbYeTY9JtBj?=
 =?us-ascii?Q?IS8qxx6BGbiXcp46aeZgbVlWWMLKtQgc0oSEhyPyQw+4veKYkuyDDEwWLXI/?=
 =?us-ascii?Q?qeaOocO+24Whfj0SNB1PXNvOXgsOPYfUHWikWwh6GpwItBfkJ+P36EOtUIG4?=
 =?us-ascii?Q?TYBXLtsXCvCpzE5q8fSnaT9+LeK29dfiZr2cuxi/fxbWNGwQiilSUogphvkH?=
 =?us-ascii?Q?qG10scDaym7aOk21N5sFYUO0AFoRIbX1xJ4oGuT6ZTb55eFbV/yvTVzPnJND?=
 =?us-ascii?Q?qc986/NJR8gzUcPhqGY0890YHJ1SmRVrBNyz7683JFkZ7Vfx2MXFjjr04Hzd?=
 =?us-ascii?Q?e1XmFEV4P+f/R2c0GNq7M6X1jllJ0VoWZkylnhr/IFiN9oU0GcjH6kREKDVS?=
 =?us-ascii?Q?6kcAVZ/5F/Oo/EHStl+UGAYevo1rtD9k1zv1xtEoEXkaMHsZ7+p8F5fQE2Ha?=
 =?us-ascii?Q?HwAmBTaSDR/hfoqUy+Yw1n3KXrMcTy2M60KkxQ67B0V2X/ukgwj6/CdIegO5?=
 =?us-ascii?Q?B2I/VfXHUMjilxRDAakmKUYYFxnDnBtbkHabWRdzfnX28Fm6/Dll8siqNbik?=
 =?us-ascii?Q?e4nGBZoh6CuxOcZFpgiMok+SBD/nNsfQL0UFByzwnH6ETKeEZrSz0snNR3N3?=
 =?us-ascii?Q?dHFmWdE7KICVmaLTM7YMQ6J2qdHPU1iVUiiBPnPifI/8YcdcsA5e8giWTEtz?=
 =?us-ascii?Q?IGKDXfMb+luBz9D1lboGU0u0SYqd94WyEbBmynHNTf+0+KaIm05ftDWai4rO?=
 =?us-ascii?Q?lnbJovLUTGrvqClYIwlEgGqGlnNzW1PponROkt2v5juM5DGL5tSBrB24QONJ?=
 =?us-ascii?Q?8cqcmsSF0uEvdnQyecTD7NhBZtycBKMUz/H+DeicRng9/jofs/a7/vKCv3e5?=
 =?us-ascii?Q?Q0hsBR8/KriEDNSq9YQi6l2kp8W2/fift6dM0QyBpeZiVIw7nxAZjoUWENbh?=
 =?us-ascii?Q?rPaPX0O5trgaN801O+ZdLwCdhUqbiIIlBIoKFd1qzZw0LzHVLnrBkkVPR4vK?=
 =?us-ascii?Q?3C0uMVpqKOE29/sQ62ged9713c/cQsXJJQJYTq+drKprQ4PDw0bRMI3FQwl3?=
 =?us-ascii?Q?DFY4Ba/BioxMrT3EkAQI1fx7XsZevJt0FVQpVLqOnrJJgs8mGC0SSEN+sLsV?=
 =?us-ascii?Q?TKqB4eyZ/v/uz8N6ZzxgCrrehUfNV/2U1kEEWsrK+YGOEz4O4SfBV7wxzRAy?=
 =?us-ascii?Q?jtiprGiM0LNDM2zqh6aerTPpixUNdf+JepYsqP8SnQKAsCS1l8d8bFYSdvC1?=
 =?us-ascii?Q?hwJuy0Upr31Mihzs0/DRzQRZ8uZzFqEj49PwmFzBk84b+Vq0vu+D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eda795b-d56c-4179-273e-08de47c640b3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 17:09:55.1029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZ+kS4lfnH37z2Qx56RtE7+BXh+EBkcs1j/iZ/IAzDzMZ7Csoj//cjd3ju5KW1ii2PzeYbSpa7SbFFSyS3A3wPKpBDc2cARxH0lpCY3uKJL+n1ptvThGAIm4rjrpS598
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17518

On RZ/G3E the CRU driver relies on frame end interrupts to detect the
completion of an active frame when stopping DMA.

Update the driver to enable only frame end interrupts (CRUnIE2_FExE),
dropping the use of frame start interrupts, which are not required for
this flow.

Fix the interrupt status handling in the DMA stopping state by checking
the correct frame end status bits (FExS) instead of the frame start ones
(FSxS). Add a dedicated CRUnINTS2_FExS() macro to reflect the actual
register bit layout.

This ensures that DMA stopping is triggered by the intended frame end
events and avoids incorrect interrupt handling.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    | 1 +
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c   | 9 ++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
index a5a57369ef0e..102a2fec5037 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -19,6 +19,7 @@
 
 #define CRUnINTS_SFS			BIT(16)
 
+#define CRUnINTS2_FExS(x)		BIT(((x) * 3) + 1)
 #define CRUnINTS2_FSxS(x)		BIT(((x) * 3))
 
 #define CRUnRST_VRESETN			BIT(0)
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 480e9b5dbcfe..34e74e5796e8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -437,7 +437,6 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 
 void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
 {
-	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
 	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
 }
 
@@ -697,10 +696,10 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 		}
 
 		if (cru->state == RZG2L_CRU_DMA_STOPPING) {
-			if (irq_status & CRUnINTS2_FSxS(0) ||
-			    irq_status & CRUnINTS2_FSxS(1) ||
-			    irq_status & CRUnINTS2_FSxS(2) ||
-			    irq_status & CRUnINTS2_FSxS(3))
+			if (irq_status & CRUnINTS2_FExS(0) ||
+			    irq_status & CRUnINTS2_FExS(1) ||
+			    irq_status & CRUnINTS2_FExS(2) ||
+			    irq_status & CRUnINTS2_FExS(3))
 				dev_dbg(cru->dev, "IRQ while state stopping\n");
 			return IRQ_HANDLED;
 		}
-- 
2.43.0


