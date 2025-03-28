Return-Path: <linux-media+bounces-28949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4753BA74F88
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B66E03AEE0A
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F79B1EB5EB;
	Fri, 28 Mar 2025 17:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jgU4FERj"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5BB1DE8AA;
	Fri, 28 Mar 2025 17:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183186; cv=fail; b=H9nqwf3vojmSciCD8ZgRWiblWw/mKlE6aEWao+7a4M+HMwQ8vOfJdvO0XyeSQnBJUFJW7D0FPgN7mrmzAmE6ozYuc6FJEgv0AjyDAZUuE+adF2gY5j58EczTwqSgp3xaUnIp5OH+tw+1kF5nS3hIiMV87IuO3IVU6s8DGN0+QDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183186; c=relaxed/simple;
	bh=ozVCo3+IWoZHaVSWLbiJkidQtl/bSmb8+e3pOf299mA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C0SSAnWY7r1wsu/Jp8IEo6vbK6KuKe9YINMzqdrKHd3a8TID+tGpIMCm4McwghFSrqQajKP3EuZ2MIFNTzs0etc0e0aho9zzbf0UX2pW5NAYiu/v9W4mle0Xm1Bxx536Qov+OCztkO3aS63PUbS6kRKGuNRoyYdegmkl4hG4Law=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jgU4FERj; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ns+fZU4btzw+QsR+KdDA7R4TCWkWa33ArU56b9imB4mhFb88JVGHwS1opoIACtaGLt1sswXfPslzQ83InMjeusQoF0t/YFouQywzzQErlrIN3KDcRFpsF0izQZsiDKWb6Y6RHuck/lN8nWnox0erCUxy1wey0E8f4EZRTLik18rRJPGSrC9ozGU6LbWaIVGspxqN1wBrobD7O4E4SFYqUzpe9fgW/Sf0s1UeTkk17tCV/zbytzP2QXCGDi63YEBI81hHNw91nh/lMfTj4n+Bfx0Ogf4VxGuRaEbzz8hk2iVccFV65Wk9NoxoAWBnQ9KSNPIzEDp2WPPwB3GI829diQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xolnwFB2U44+ABmra6vPJ4H1SEJQEoJ5QgqSZZ/4JcQ=;
 b=mRXy9EC1HWgD5khowLRmfJmEPEflNUcSbFbBxdc7VmEop/j9pn0joK7TjD9DpHV5jk0I2dkDYPmtXGG/dyXpBc6LvRcQN483KzftWzCvMLOqpqpzqN1HApEVw5Lbh3BwPGcHMTozylcEgf/xZcQmgO9N5pYQZ16C+iFij3JlzguwFi6FavvWj9qtCsYYtC23mzaG9E3tQpoFyXUG1WCVB6nQH7La6eBM2Wsam7THpmiJCnPlYGp5ELfp3NJ/oN0/64jg6PobruXMaQslBOVdHbGNovfOt/gTQ2MITF/w2A3/O1/Gj7b8iidsWNQafpyjj7qAscD3UUOsNs1QTNr7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xolnwFB2U44+ABmra6vPJ4H1SEJQEoJ5QgqSZZ/4JcQ=;
 b=jgU4FERjM6EPh9pl66H75Wcg/tIB9ZcM4fL0OS2jyoL1mdfsExDr1hT7FqiBdq2jXb3j2j5D51K9TcV4pVpb07sB0w66N+pFdIEPYwjLEW5E784sTlKhV9DYrBfP9I8yqigOjc4GWYjb+qBDGlWFP2LK2dCT3joE0D5971fsSwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:33:02 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:33:02 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/17] media: rzg2l-cru: Add IRQ handler to OF data
Date: Fri, 28 Mar 2025 18:29:50 +0100
Message-ID: <20250328173032.423322-15-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b18d224-43e6-4b88-9884-08dd6e1e974c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5jYAsa08yRdN2+pQSCg5ZPlMXBLiQpjAhJV+QGNzUiH+02GzTxmdJurka+RQ?=
 =?us-ascii?Q?RfBIwfeWL3kSUviyMvnKmEdTB5NRRmv/RgGTKlCRZRcxEQ9ljW86xcogmija?=
 =?us-ascii?Q?v7h7xQlsRto/3NhBkR7ysw0YSb8OVbmHpmO+tjSKcDS4oSnN10Tt7aV6mZ1L?=
 =?us-ascii?Q?D3s8oyOXeV+/Wk3XDpNMsZHquBHxNUB/sGzUVV5CNAOG5JgDjB5RLyx6KiFe?=
 =?us-ascii?Q?+vq9TZRLZvjJ2H/LF5JoXEdGGJsr7MLMbKTuEnNBQa3eBm5Opy3Hj1aKAaoT?=
 =?us-ascii?Q?fe47lBd3EasgM1admWOeI4RdcXQ0TTBLc0VNouoU0MmiLeCYRTFWHiOGL84o?=
 =?us-ascii?Q?KmQqBlK/W6H0/hoRHLhlYW6ivN797MqoTYV3lKT6xI3gmtwBZWvne2GcMSRs?=
 =?us-ascii?Q?tQN2czF95nFl4h26dqZ2RHoyI3Tw9i1AJqe04AADC5ZDrt8Mids191CkLRMg?=
 =?us-ascii?Q?Tvy0WVQfTHZfAC4dboHCTs+5AoFiOe+o96pWKiloyDmYxztV64Gb0mCX5cxc?=
 =?us-ascii?Q?YGpXvl0bjaopjQg9uI39UIwVMab98drCRuNCF67xU6VsdtwXI33ZZD5sjlQy?=
 =?us-ascii?Q?/F5VykD6zd/JuJ25M0fgP79Adj/3NMgYgTYvElMuJMupx3Jlb7HL+ENXz/H0?=
 =?us-ascii?Q?OEWDmVykm9oN7kEQTqImqjciQOy+/L2QKW8vALhgSrKFD0O96L5/9u0glmXk?=
 =?us-ascii?Q?cVJRk/ktiaqA0ktu8x/alWcsRXCXl9by7v4DFeBS9o4NkClba4Dt/jHyMV6R?=
 =?us-ascii?Q?VwHs2oAkvuPaJRTHHq2UQJFIcJmddy9ZiBGz2bWDPVWvIY+g2+ROPrFl1B/f?=
 =?us-ascii?Q?zELXO5re4946KsYKyGIxZHb8TBglRm+CNYorSLVvWyn4m1jOyKvSdzp8BNP/?=
 =?us-ascii?Q?9AIy5VKm17M2SSQYV8lHOVMfx8uhhTnxB2Jk7CHX/bgy7WK7BkrhbX7rgOJI?=
 =?us-ascii?Q?3McdEPZaOKrBHNxtu4bx2h4KrQuYPBN5gSw0FwdMeAShLHE907BNszqfusZv?=
 =?us-ascii?Q?ErwjyGvctSNioMe6W605YmVW9KffTkJZ+RzGCvgyLeC8RleCwFyC6gqOiNpT?=
 =?us-ascii?Q?bwFbq3myTnzJo2YKrXE+5ZIWNrXAGpPEKsf5Y74ccJPhFt6q++BgPjQ7kNwA?=
 =?us-ascii?Q?7YODhLs4HT90evFJ8db4IIfcDJvra1RKCwENkjefWKiWoDPjbyhlKENrKyKx?=
 =?us-ascii?Q?eMsGqcCbCUV+zqAnSb5Navj9AQc4QZbhs9oyZQbEdwwHudl9UfTPbixzRVF0?=
 =?us-ascii?Q?5BEnz07tgF0CFIi3nLy+wF2g7yktvLk2UeNuYzt/li/65aM7KsHsl7zQ2cnh?=
 =?us-ascii?Q?sAEbd9EuprFOWa6cF0Ka/XRjSr0LL4sbCJBofHJxu2OT049g4vT80F3C2frc?=
 =?us-ascii?Q?3d58cSIhaqR83u3hddddY7BNalKDq3lKcUDhucb85THmAvnd0LPUVcREZZYc?=
 =?us-ascii?Q?hlg9WkKy0QDxAMzN8tCz0YQdPOis23R3PmnSYiJKSF3dZ4Et/W/ydQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dEeBepj4L7uHFRZ/eNh5XdG8K4gnrH1KEnnpHuXonLzQtk/UXyaFrJFIuAYK?=
 =?us-ascii?Q?+iWNOfNyu3Xcnt6F5kdFvoPMfmJs8iuAWLNT4kWRyP9nH+ZOOhyHxf6N4xHT?=
 =?us-ascii?Q?a568/iUVESUJW4O6hI4+wSbVatMCnrUQ4ikcqJfCHVk/c7dfPoICjr+lzvKe?=
 =?us-ascii?Q?bl5Uv0odjdFuUECx7c8ljWY6vRwXpxLY/TPnPV36Kf8DzF1n3lZ0sqHkyfCj?=
 =?us-ascii?Q?y2CvJNzZWmnTbE2mXi8yGQAloFbeIkk2sz1J7X87b/mplPj6jGi46qHQJ//7?=
 =?us-ascii?Q?aycuVpmPCf0dgTp3jEAvSBodymCiBDLsMjlm3eqpSrkD+cbEQlFn2/EeBENg?=
 =?us-ascii?Q?Och25e5zAxpqn22O5nFm9w9L9+NFMm22nWSa4r4KpxL/9F0JeGPgeOdjEaLg?=
 =?us-ascii?Q?O0eJCtzSyF/lZzN6CsASp0d1GjSz3A2dApZTMqQAqw4RevCMQIpRHryUgr9G?=
 =?us-ascii?Q?Y3FmboXmEDGFC1pq1poqMYg20vmIUsmfatV4Ac96RPtAogc4nEfiw0l7lYf6?=
 =?us-ascii?Q?tBIJtG1NGMDNkjnFgLCDkdzVaGt0TcL1bf30NDhfG9ub48E4lngOZgPNcxh0?=
 =?us-ascii?Q?7bPTlGGCYmf7vjz+h+udVq2bK9IDHbO4YlM2aeUnqjH6Qu7fR18rXzYP62Va?=
 =?us-ascii?Q?jrGC7SwmVc/jcnsxK3owDnKrUKbIrO00ykh3r3ke3zi80n1GoV4zYi8CDZ0w?=
 =?us-ascii?Q?qxmT/jkH+ZJHIAXd/fvrNfa3y7RkZkOvYHfcvmDOhGjfVcKwcC320Wle8k7K?=
 =?us-ascii?Q?dkMoAv0Ctpl28lDcbQ7k4Rj7MGLiNK4k3htf3mfrE3IqfQm6C0zrLWYOheae?=
 =?us-ascii?Q?iDrlc/t/AELDBlNoX6ARDmFCISosGfoPoexDdfSwfscKKmFuO7Hjg/3Oi0L5?=
 =?us-ascii?Q?Ig9O9lIHr3hQbEooyW0wLX+lvI2Q39/9Chuj9PIy2IEMjd2i1rosID6iKuUG?=
 =?us-ascii?Q?7cmUPcbqAAps5rnx0TjaELLOk7jxoaE3ZdaV0Qy7zLPoJRKX+A+qXBR6b1kx?=
 =?us-ascii?Q?BOUrrH6rjvbulRWVaw/e6owsCKqVb071sY1hAJRJePX5CNNZreiICrncx/1/?=
 =?us-ascii?Q?pARHe85iIoEg6wuFo4dCe1ZrTa3tGHRdWV6oWeegFNLQmZPyXp0ZhbZjrLqs?=
 =?us-ascii?Q?g/Q3fUNbso8az+OfTcQjJNS3cbDi+btYFrq0jnWZG44PJ27HvyDmZn/nRFR7?=
 =?us-ascii?Q?62CMBDrBJDifsfzG+GnLzDdEgbLbt6t9W2Ms6EjxLEQ+mmdfAZyAnD7UivXa?=
 =?us-ascii?Q?RI+HBNXXhm1UpFobzldHc9wL+5ubOcXlOlZ+xNvsFB+HJtbSojgmsU7phIFv?=
 =?us-ascii?Q?vZN8HSpBv9iQoaraBGNvErTnRyi9GtyFr+0YiUP/me7DtmvUEtkcnhqX9zRN?=
 =?us-ascii?Q?PEqGn2ujQyia6ArdWxIUYOHWYQuGboP3jMGQjNLwyq7la9NX1SFmvgVXmoRh?=
 =?us-ascii?Q?RrkZrWVdYKMsHpBuCUAbNlNOaEyOTTnEd5839t+t0MoxzsSMz0200jRQvXbZ?=
 =?us-ascii?Q?OceaX+iLGeRivWGRF4PiVgWtbMPiZziK+t7jpHbjwF2xpYQlXIOlrdQzI2P0?=
 =?us-ascii?Q?FzfXRu6/pggqDvJ73wgTHKyMFgZIRzlBKf2YdcAFOxOMNrpl5fGUVVYjFl3z?=
 =?us-ascii?Q?KM3hqKnYSe4l8m5Mp2tdOZ0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b18d224-43e6-4b88-9884-08dd6e1e974c
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:33:02.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hR/tv0Tspn9IfqI0y6LfqQL+cm9CQNvltRS764OTVNKtFnkbtZOxfghibifUJ2PSkerHyItiug4J/Jbb6RTILSFNVa+0RuAEpHWBXAJabIX+RNTMdkc/TyuvYLk2FsTn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `irq_handler` to the `rzg2l_cru_info` structure and pass it as part of
the OF data. This prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which
require a different IRQ handler. Update the IRQ request code to use the
handler from the OF data.

Add `enable_interrupts` and `disable_interrupts` function pointers to the
`rzg2l_cru_info` structure and pass them as part of the OF data. This
prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which require different
interrupt configurations.

Implement `rzg2l_cru_enable_interrupts()` and
`rzg2l_cru_disable_interrupts()` functions and update the code to use them
instead of directly writing to interrupt registers.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Squashed patch 15 and 14
 - Collected tag

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  5 ++++-
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  8 ++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 19 ++++++++++++++-----
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 7e94ae8039677..302f792cb4159 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -278,7 +278,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
+	ret = devm_request_irq(dev, irq, cru->info->irq_handler, 0,
 			       KBUILD_MODNAME, cru);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to request irq\n");
@@ -359,6 +359,9 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.max_height = 4095,
 	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
+	.irq_handler = rzg2l_cru_irq,
+	.enable_interrupts = rzg2l_cru_enable_interrupts,
+	.disable_interrupts = rzg2l_cru_disable_interrupts,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index ca156772b949b..3f694044d8cd1 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -34,6 +34,8 @@ enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SOURCE,
 };
 
+struct rzg2l_cru_dev;
+
 /**
  * enum rzg2l_cru_dma_state - DMA states
  * @RZG2L_CRU_DMA_STOPPED:   No operation in progress
@@ -83,6 +85,9 @@ struct rzg2l_cru_info {
 	unsigned int max_height;
 	u16 image_conv;
 	const u16 *regs;
+	irqreturn_t (*irq_handler)(int irq, void *data);
+	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
+	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 };
 
 /**
@@ -177,4 +182,7 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
+void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index e13f633a687b2..3bfb30a61d9b4 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -300,8 +300,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	spin_lock_irqsave(&cru->qlock, flags);
 
 	/* Disable and clear the interrupt */
-	rzg2l_cru_write(cru, CRUnIE, 0);
-	rzg2l_cru_write(cru, CRUnINTS, 0x001F0F0F);
+	cru->info->disable_interrupts(cru);
 
 	/* Stop the operation of image conversion */
 	rzg2l_cru_write(cru, ICnEN, 0);
@@ -393,6 +392,17 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	return fd.entry[0].bus.csi2.vc;
 }
 
+void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
+}
+
+void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, 0);
+	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
+}
+
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
@@ -414,8 +424,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, CRUnRST, CRUnRST_VRESETN);
 
 	/* Disable and clear the interrupt before using */
-	rzg2l_cru_write(cru, CRUnIE, 0);
-	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
+	cru->info->disable_interrupts(cru);
 
 	/* Initialize the AXI master */
 	rzg2l_cru_initialize_axi(cru);
@@ -428,7 +437,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	}
 
 	/* Enable interrupt */
-	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
+	cru->info->enable_interrupts(cru);
 
 	/* Enable image processing reception */
 	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
-- 
2.43.0


