Return-Path: <linux-media+bounces-30050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E15A86453
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A2619C64E5
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE759231C8D;
	Fri, 11 Apr 2025 17:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hPAfGFmw"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011043.outbound.protection.outlook.com [40.107.74.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B204227EAC;
	Fri, 11 Apr 2025 17:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391269; cv=fail; b=sZYibHMAhsKxwqPU+JBUjuHWoSZvZHhEHRFG1ZWCjBWpH4KGK61Xplo3WgNx5Sx6KWZDqt/7U3rg1YR2c6RLT4lPbrEqeFiCBp8k+p/Hd/YeF/y13VfH+im14SCUV2ad1VjGmk8CmO39rQ/Y5oe0cxVD/xAC9jDZIayNO1v5qfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391269; c=relaxed/simple;
	bh=8rPwWyKGU42djKH6MYxaE82TLxzNheQbC/s6A7rWfWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kYv+Qowr0Hvl/XZu/wO76OFSG+mXUCBqlZtcx1qQCHpaTUR7jYiCSiCWzDCx6mFqpNsTj3mnaNKbP4SaUdk7G1bVMuo81u66n03IwFwXauhlLW1rCFgrzo6aBMbsudOZJcl+da4mTr1ef05hkfKTjGOoDMnWnCtcmZgriQw0wE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hPAfGFmw; arc=fail smtp.client-ip=40.107.74.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmoMxkjlzADzAMu4TOIJYbV246h/aZVnWK47n6z9vFrofSuZi8dtNdv62Qv+EVgd9/wLzSzQ+yyF9bxAQNQ1gUHYYj4NyLH1OqRg3magMfqwZZLJAWDS0bsNSPJbpIE8mlPqH2sOQXJWvNpdECcjaxEnibKCdbewEQBByWnFeBvCA25xA6/VnTiGGi4OkCMsOB+PFHSf4j7vd2n3x0Ok6Ws+JCzAk+46Dnp4OhG4V8sUFCPvwNzXsOP4cRdhKpMWt9PgxJL3H4fIet2S9EX2HVJUNTQJzao7tCkmCsOZcbUeYf8COfqlQSaqs0TYJYlEAzDVyWsGlKBm8ngaDBnwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bM/KzKiGFXhJddIsb0wAEvP17kYlm0x8ySJwv+CLakc=;
 b=NN+Iyj5V2xjRmDU15yO0dAAr5LwX/VenNY+2rJZk3xfD8rekoKcnEJfxao9Bj7NjBIN6FdEj0MpE0+L7GBo3DsjGm8qI6A6zjjxce/n+apmr1vBrvGOmV8npzdu6QJQg2VbYUh9rKpYNTTId1l0oMZAoPQlQMzuwiH/VJdsJp2BJboTN/Tea9xNaZHFnAkk6rJ1pLjg5t3iHsx9MxfrXiyweIJL88k0uv/X1kVRQgLzGp49zFMtk9gpQVYmYU+3XNzdiFFcicyU2O3usNa8SLkG0n7wTAHEckxuwjFki2ha7uLEsl122cbqn+A2+m+BYVJWoc30NnDpu405AggOb0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bM/KzKiGFXhJddIsb0wAEvP17kYlm0x8ySJwv+CLakc=;
 b=hPAfGFmwocHtvP3E8DMMrejYCYsZsLLsxoxrKrt5UVayM6chlX9ZIQqcHKO08flpT4jpATlsu3Rh810nNxYRroX9+9z8HhIss6xibbFmzHbsUPHRR6XPiCMoG/0GPPJzUjFtCPPkIwwVTCuZNOrO1KuoZwrANULYaieZPKxUCLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB7963.jpnprd01.prod.outlook.com (2603:1096:604:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 17:07:41 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:07:41 +0000
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
Subject: [PATCH v7 08/17] media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
Date: Fri, 11 Apr 2025 19:05:36 +0200
Message-ID: <20250411170624.472257-9-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 6505a1a0-0924-4d98-5fd4-08dd791b5e51
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rY0L7OiI2O16sg1M62WdbPM/76RdV5SFaa3Zo+Fuo7CuBbH8vrG90e3j/KCu?=
 =?us-ascii?Q?DwT8Q3vtvPPCmshHf7WDYjcEeSXlcDUszNQDddp2+8jbDST9yhKkMEXwKRLV?=
 =?us-ascii?Q?pLY8sCqIsSTk5LqPuIT5duOdgoy24ggSiCs4qUn4wUY3R4uu6VZiADTO8bwE?=
 =?us-ascii?Q?+k7T4IL3nXdOoguOpw/37Th2rOahHT94RZnZIJLVIw6Wndfn5UJ2GGgHn2Ft?=
 =?us-ascii?Q?FzpkZGNPD5GJ7dUVgsBqNfcQRwLKE8VeSDmMWdc6e5NhDeJsTJU1SzRv2QSY?=
 =?us-ascii?Q?Cfg0ch6DOIKJs4jfLGLNHY9TdFIBr7WcnSvAGNJcmjR7Z32ofMwWpHsSgf+x?=
 =?us-ascii?Q?Oqf2BsKh9xznow1pe3kI6uTyrwXA7Yti30afkGNCWol7YURLvuw2Gq2FgTws?=
 =?us-ascii?Q?rTHjJ5zDP+/rtWuBNLOOL3EO9PeWsA0nrKihZWjwG8PqKPTsq1anYDx4mPoi?=
 =?us-ascii?Q?RY1szvrJ5sKZ1m/QgUXYh7jHE1ZL64tFBgbx75YTWO/fly8p3dcJ3cD3dW/K?=
 =?us-ascii?Q?ibnwYlpRSddwgmjP+42AxX9qn80mYSl2khBNHFfTuaiWQBbi9ftXFefNZEId?=
 =?us-ascii?Q?rkhMS7w0ORywygi6T5me+idSeEpcmYsTLLorzhJq+WB4aSoua+KWYW8OVqx2?=
 =?us-ascii?Q?grvIJglCUfB16biZVHKPtGVvyafAc7incmVjCQ3t8c2thjVrnpDfUnr5uFFT?=
 =?us-ascii?Q?LanBZ313kt49BG1LX+lSb5uWMxjeeUp4WlxgDzpB+enhyNQCTA7InX5roTT6?=
 =?us-ascii?Q?FnmSRY6/7Hw5X817TBp+PuHO9wiBCtOnbCbDxfE/6BoRKMrypff46EGDeMT5?=
 =?us-ascii?Q?fRqqWtbqgQ2X6ib5R4UM+ylTKFu5fAp15K2/sUG5LxBfM6jcc8GUxb67eXxY?=
 =?us-ascii?Q?KkFtWwosUHZeNtKYs+p8+0meRwhq3Ofxf+NAgfV3cux/Zu7yqOlIYII8Vs57?=
 =?us-ascii?Q?MbGbi2GD3zygGER/QC8t4VH8yKnFJNkrhFLDu22lkbFDZ6ZntitHGigScGAt?=
 =?us-ascii?Q?E9u0BTFJHvkaxD33a1Y0EJV5aKE/vH3Fa7YihIG2MD5J9hlgtwYWNoHCNqC5?=
 =?us-ascii?Q?Q1p1fsr/AY7xTStELJUuFfmc1ko1vmIVz2B0xbq/5PRnqPtvv3+XuZFs7+fK?=
 =?us-ascii?Q?tNiNnBbldn2u8yKe3s3cylg1AZJ3RKEigDS/jA8qyOjZ4lQzbvGY2iYvDzv1?=
 =?us-ascii?Q?URoAfaXcseszvK8KJxUtDnU2cvLbLj86pYr1wUYBMXRm07zD/SSnTKXlhFjD?=
 =?us-ascii?Q?L9Xf0YMoAqAgMHqiJo6GPv1EZsqeAhogu84mntXEo2QBts816+/isosLS3+E?=
 =?us-ascii?Q?1mVA9HQk6xy3lyydtiXAopDw6ZqdahWT8llrmNpo+ll1aQSLF0PeIdKOLOQn?=
 =?us-ascii?Q?u00BGHwUMgGQmPjbmYK0vgIeZXZT92Gr3XTlkRmWOtcBT5wN+jZcnpQqQ7ex?=
 =?us-ascii?Q?6oYJPvTCDY16Thk4x7IYQStWDAi6wN/eXP1wJG9sHFdjD76NQeL4Jg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vwjsOnfNdZ2aqYLq7vzCeHVe6OI3rc7jy+yDChJ/Vq7qMrKQoDbObwoJgeXG?=
 =?us-ascii?Q?6hd4fYQ90Gnf5EBYmXieDKO2tq/IafmRgJ5Q8+U4tff4cQuj35x+3Vf1F767?=
 =?us-ascii?Q?siPyePpTvMzh3AtC74kLIbBveIk89b24b1f7/06RN4jiqlJJKmDgNAoKR82x?=
 =?us-ascii?Q?UjdELkm6Ia7TIpZ+xw22Afu1yiU+9AP6AKkshqA9d8q7XxpckgwAp6iT6dpt?=
 =?us-ascii?Q?KKc5i93GgY6ZYYMfMyl/03dSdifiFJ49Cy8VNepJcD58WkYP0Tn3rYsRzAsT?=
 =?us-ascii?Q?I7ZIAbdgbsvWt9Hff2N3YtsP6ZMAy0EMbdv3phy5UV+T0sFk1TpLQbf7Mxsr?=
 =?us-ascii?Q?bSCn4Y47IV7LmvsOo/Zpz7UTpX+QTSFSF7f7NxzybJZwbXRtsBjHxPfecKmf?=
 =?us-ascii?Q?6a8AH17dRdx+Mnq7SQh+8cnfNBwoNfhIsOZ/2GLj2sVDYEoWDQdxlwoa2exP?=
 =?us-ascii?Q?FEHjJ32VFk4Fv/Xo2jgwqPjNSTsO8St3ggbWq40mCTeIp+5D3SslvRGGgwwv?=
 =?us-ascii?Q?3tZRGsBhJTy5EfT8oe+ITW/3VVUdvpI0YTfRtXPVthW5H/XWZbbV0Fe8fox8?=
 =?us-ascii?Q?W4rDsTXZYEANhu9JnJuFYehE10cs9ORjYhFcI+U3+SfRFsfkS2ggqW6od5Lo?=
 =?us-ascii?Q?CQNTdNVDftPOCmY5tF6aUxTAU2streIW54Az2ll8G5Dg8cUN842+O6u5jXYu?=
 =?us-ascii?Q?Di8xMZmMWVT/xBLFjZzRUtICjtAIICBF7ZQzu619h5M3BKmVEgIhBuY4qYfO?=
 =?us-ascii?Q?h5h5CGTMP1ffz2yuqRIZwS/QTXj+aUvQmlC1MpAI3edzZBPsndUPCGm+xmSR?=
 =?us-ascii?Q?uBRtfjV7S/efJ5Lnwuvt/XV2ER/Gxffpwj58nsdKC+iPzvZD6gJ7lE2+AxJS?=
 =?us-ascii?Q?/S7Kg4SuShQCihqzFjqcISwhAk9ZFJbfgdpnG0DZrDCUpv5mUf5TVn/NJWHZ?=
 =?us-ascii?Q?6uuHyb10P36UJ1ChmkEyt3L+atSG2LezEENGX7+NYfL1HwSrotYswMnvzTMG?=
 =?us-ascii?Q?uRRnZNkJ5+2YYETyrPUPPReyVoChVNKyA9FjB8zkfMhZ5bakXPFfFyoaSv62?=
 =?us-ascii?Q?2KhvCkWLFTqHaeWg/MYh47WN+q3HrCY/o7wf90R+YBe4kB0MQOT4stOiye+4?=
 =?us-ascii?Q?kIsGadDMXaBFC5TKZutsTrQrhzjlvdZnmHdBLoCctfX3U+52AsSZYiyeCaKB?=
 =?us-ascii?Q?zMlTHTSP477z9sSyvg8nwCaqgYsrR6zkXcffC7cC/DPFWof+WYy/4tVlNXG7?=
 =?us-ascii?Q?aK+rM4NifgXSKwdw6nh6kE4H0PyAEKLVTvqo3eDQv4PvElgGZvPf/f+GGhYt?=
 =?us-ascii?Q?/J04JAOuiBdVrsD3hDhYZ4fzOyDnTM194dZUdwMONLH51cyWsqhbEuL128ID?=
 =?us-ascii?Q?eLUrS6d3FuE0PZ7y7l3LzWAr70oPK69izKpxU+PEh9bNjIA+evYp+W0s1Lkb?=
 =?us-ascii?Q?O3udnzUCknkhjDAMKH4kU9EhMpg5p7h1oizLOE1RDLHK09qxJO8Uc25z4HIn?=
 =?us-ascii?Q?N3ROaqs10w0v/A4kUpEE7AQieV4TgW0JtFShDBQraP0wYneVYYYFXlBlwfRR?=
 =?us-ascii?Q?EgR3s55toX/7316O7aBeQGYFVS0SqIEPPBikX7Em0oGHXP5rpRbSdZw3OkVE?=
 =?us-ascii?Q?2QfRpUHPZ49vvX/lN+UMpdw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6505a1a0-0924-4d98-5fd4-08dd791b5e51
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:07:41.1133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4KNjaH6Hwu2FV9WvVocaj6popa68OzuVTOefTlgAIJdvByje65cpIBQP1hmrJBw7jiqEvXLiohrglIdvEpn6lNoWCPZLPUgBnn35NTiqs280+iQ/HDkh+/gGMLGP9Yb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7963

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding support for the RZ/V2H(P) SoC, where the D-PHY
differs from the existing RZ/G2L implementation, introduce a new
rzg2l_csi2_info structure. This structure provides function pointers for
SoC-specific D-PHY enable and disable operations.

Modify rzg2l_csi2_dphy_setting() to use these function pointers instead of
calling rzg2l_csi2_dphy_enable() and rzg2l_csi2_dphy_disable() directly.
Update the device match table to store the appropriate function pointers
for each compatible SoC.

This change prepares the driver for future extensions without affecting
the current functionality for RZ/G2L.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Moved rzg2l_csi2_info below the definition of the rzg2l_csi2_dphy_enable()
   function as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 4ccf7c5ea58b0..4aa5d58dde5bd 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -107,6 +107,7 @@ struct rzg2l_csi2 {
 	void __iomem *base;
 	struct reset_control *presetn;
 	struct reset_control *cmn_rstb;
+	const struct rzg2l_csi2_info *info;
 	struct clk *sysclk;
 	struct clk *vclk;
 	unsigned long vclk_rate;
@@ -123,6 +124,11 @@ struct rzg2l_csi2 {
 	bool dphy_enabled;
 };
 
+struct rzg2l_csi2_info {
+	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
+	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
+};
+
 struct rzg2l_csi2_timings {
 	u32 t_init;
 	u32 tclk_miss;
@@ -355,14 +361,19 @@ static int rzg2l_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
 	return ret;
 }
 
+static const struct rzg2l_csi2_info rzg2l_csi2_info = {
+	.dphy_enable = rzg2l_csi2_dphy_enable,
+	.dphy_disable = rzg2l_csi2_dphy_disable,
+};
+
 static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
 {
 	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
 
 	if (on)
-		return rzg2l_csi2_dphy_enable(csi2);
+		return csi2->info->dphy_enable(csi2);
 
-	return rzg2l_csi2_dphy_disable(csi2);
+	return csi2->info->dphy_disable(csi2);
 }
 
 static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
@@ -772,6 +783,10 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (!csi2)
 		return -ENOMEM;
 
+	csi2->info = of_device_get_match_data(dev);
+	if (!csi2->info)
+		return dev_err_probe(dev, -EINVAL, "Failed to get OF match data\n");
+
 	csi2->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(csi2->base))
 		return PTR_ERR(csi2->base);
@@ -891,7 +906,10 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
 };
 
 static const struct of_device_id rzg2l_csi2_of_table[] = {
-	{ .compatible = "renesas,rzg2l-csi2", },
+	{
+		.compatible = "renesas,rzg2l-csi2",
+		.data = &rzg2l_csi2_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
-- 
2.43.0


