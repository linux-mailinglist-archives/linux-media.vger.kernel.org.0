Return-Path: <linux-media+bounces-28940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0256EA74F54
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10818173449
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A7A1E0E05;
	Fri, 28 Mar 2025 17:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BgxG4zv+"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8651F1DE88D;
	Fri, 28 Mar 2025 17:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183099; cv=fail; b=ANclvpUzBXByvBHT39Tcu3f/UxTncCB/o8EkQkhElZpkJYWWIt8reJfSzPI3dmmgSkseJwNNKBR4KB3JuhKdDS4Y3dN42Te3gXbLXoz0mi3UtTtk6PX5Ftdw0TV7cyTM4AMrx2N7EwKTlE/yTehNnrlUaV3EDmNsDh8069IjiXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183099; c=relaxed/simple;
	bh=5lU1IvTR+ixEA6Izj8BDp2/LBTXT2y5oWx7TE4PSwZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lRbjp3N8gYQwvNYcaOqWASLU/FSGTSHqB8S4UGpKFyZqO7qlzp5rCFuOUQuU6ZyJIUY3yicwjnlXOMruQuEmMo6KDmLNuTKzDxaBCj3ac2aqyYoAR0pwtvIocwCEmNHRnWAtYWxlYD3Mrz3T48wTrfpTyhSmyLWfbxFm9LvkjaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BgxG4zv+; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLmVzJYYKFD4X6/U/yQQ3koUE/Ng+l1Ryf5IFYkPfZU7P4133RGifpCW6wG69V0++BD0U1CiQxnTY68A0sbyX9oe1JPo3NxUcP81WQc7hL+kxWR9uEp0QAzrnwUWWAdzbPbuDD4BqcrW3xehZr0q6KNUG/lqQrbEwFQNNGgoBtNvnAvqwTFRIggnBzFUz+SL+uAUyTkWRksPiBwrEefKPpz+F8ACup1WjquoeOUlVGyVr+2BDhwF9kiVC5dWdL6FKr3yRbdUQzPyfNvETvt7MBS99uYaG56mfnQYSAJcfweW6lJPNTTDhhg5NcmHqql+BsD5e6FDEQ+6rpOhOOvRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQ7qeoVJqzp6w/iMh3vKTUOEltiFLLKEaA7xGug46xw=;
 b=XgPSx6cMJ+ekviL9eW2eiAHKb6C/5/dQzYr4uaU+nUxDQF+EWqwZNR3OUDialddujMXoCcCn0kartvi9kyVAIsU0TnbtixoEPZ4nFa84H9HdEfACpu06Jx7JqpsnKU0WAEa9TfauBUX02ODUbm6AObB7+HKVeOpPovHPjAj3DU679b9MkgrZYmiTHD67xuHBVfsbyHWeLeahBP+jOIXjLFk2TFgaqFGKcuHvyxmFnx1Z2/7AHorYNQ7vyI5w9vQfjiA5YnzPdilUm3pbUM0wJAtSIHWu4/3TLiKWKs6m2KC3OBHXbWJ3u/FNWh1889/v1kY0Nzz7F7kGlpLsts6tCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQ7qeoVJqzp6w/iMh3vKTUOEltiFLLKEaA7xGug46xw=;
 b=BgxG4zv+lpc0DTKpPuJgLasUGwWreK5CJFa7gzwNoKAwDJhgH3gil8YE6zO0mlt5i+oys5U5g+8SCjsC8RO9zaEyX3c56h5x3hIuDjtI8lPlfu4hsJO/lh3YZVI1UIQMw9ukqq9OlWuX9T6Whas4+Ah2agFFKZfIoyjwahghDV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:31:35 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:31:35 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
Subject: [PATCH v5 05/17] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
Date: Fri, 28 Mar 2025 18:29:41 +0100
Message-ID: <20250328173032.423322-6-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: b4d0e1ea-05b7-4339-73ca-08dd6e1e635f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nQsbSqHeuOdi5i7fI/rAIP4fJv60T9Mpfksmdd+6psZfZyIVhgf82Hccr0ME?=
 =?us-ascii?Q?vix7SgyXQcXS26MdrTJo2SPZe43yuCgkuEiqsszXFOEkTIIKLDjG6zsQOeFL?=
 =?us-ascii?Q?6UWU8x5YGca94I5hA9z+zuoT6hbOHQFsgC5u0Jmf7aoo2GXbsHkHigRDqMx4?=
 =?us-ascii?Q?jfOwrPqoilssxBhdsh3HwXq3P6/ZrkJYE8MUzfaohc4zE5R36vND4/yQASkJ?=
 =?us-ascii?Q?oHnUyou/NAdBKEuqZYp4CiZXI7DPJs21W9Y29D895tw+t9AUuMJUe1ewEph2?=
 =?us-ascii?Q?bBAOMznCMZCy70N0Tw/u7v/AavLXpZTleg4U9TJuBuvyX0HM+BM/w3FE2d0a?=
 =?us-ascii?Q?IHSiBMFr130JJr5A+17pHu28cqjhvw0g7N7tB2Fproa4eTtFRQegkwl7h3qT?=
 =?us-ascii?Q?vnP0AFqeEuA7PwYzKWzsu6mCuoVnussN6rDXu+Tz9HhDr2YeBbf6zFojetx5?=
 =?us-ascii?Q?xo9fl9W5mxYNhjPI09zao0xpzNa7ZX10boHPPKXk/bSdGf85mtdp8FzdqR3X?=
 =?us-ascii?Q?rfBpA02rD3NPRtOFwFIcxsMxia6+jcyD2Ji0llaZvt4Rzlm8Ue3fHznVFCOD?=
 =?us-ascii?Q?QDGSLlWUiU18V2taJxwJ7zjyK3Wdsi4IIPBdInKsEHE8bwgiJ7lkJ3Zno2dX?=
 =?us-ascii?Q?Zwc3H5HO1a7/y22n3x9+LmVq/DA9XrJ3kMjGWsMPVAHlSVz5O3PvYQoP3etr?=
 =?us-ascii?Q?n+vafG722kq8Utnr3NSmrvPWVF8vbf7igOapTSAcThqsE2+iiP6m8tfzSnj8?=
 =?us-ascii?Q?oVSjwmoG5bNLDfb5ijewkqgT+wC0MgCGkxaqhfNYBZ/84YcAYcLZRv/A1rDL?=
 =?us-ascii?Q?luehyz/spKK6GoXc/huYFm17WyheBMikfuft0+ReL9s48HQXhRgqWb+z62e9?=
 =?us-ascii?Q?lzFv6p3oz6qd8anv7InKKDPFHgLGBfnkJU22MYqGP371HRKeM1Nnjh4QqGmV?=
 =?us-ascii?Q?T7amvMWNK20sxtl31QfRWahB30i2RYoivcv1ToocNBat66Ly55UYqcCwXY76?=
 =?us-ascii?Q?llSCldKlS4zQXxUPfeYKCWmwpgk6ptUrTTozVolzSiDdE9fjRkP6x7GSriYX?=
 =?us-ascii?Q?pvgYRt3SMusQTc9N5Qaer7d+zyp8IVviSrfGg62rnufQ1zQY27WvXeMER+5d?=
 =?us-ascii?Q?R8aGJJxCjPX+VtADV6uT+PhmkLcK6XKnUCp7ku5pWJiXLS8Yr5NHOc9qRuRD?=
 =?us-ascii?Q?3bQWlXR8B8LiDr4i7wO7P5Aotp1tI+Z3hSdW3ONQ6qWFl/bQoAe5qYSrRKe+?=
 =?us-ascii?Q?SVRGZ/0e+FUVx7ZJRn2qzXHVclk5LkXzsZOXQoe3GsYShxQMREYJxuAosIho?=
 =?us-ascii?Q?zJ9k7ZNS0K/Um95fGjJpRLmHDL3LroUL710O1pkQ5tG9W9Vw6jXxDms4haya?=
 =?us-ascii?Q?pzosUoL6QD6TwQCUQGZh9dpMsKU8pVOCJmj9BSw20NCLNGS8S1knCrGlyL/t?=
 =?us-ascii?Q?Eez+OoRPi876XKaf6qm38HJEyYejxligwnUVAptHTMgcm83wO85Mwg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gCP4TlnD4U8PtRpUZMtmRlPMviFz8jG/ziLSao0i2EiLW4H43VPzce/LyBC1?=
 =?us-ascii?Q?YqBJ5nn6bpjaoZ198Oumhff8/Z8FQrvXso+etXxvGz7gGR/3iK+tMuZccSTf?=
 =?us-ascii?Q?hF40mue2L/UHBfyNvIvAH/H6ClHbWqedtnF43hngAEVL/KQFyyAmCXic3Unn?=
 =?us-ascii?Q?QMzh9j0WHtxVB10TuNGtoD93ieLdQaHotjrnsD6JHE3MSt8300715rPqGD8o?=
 =?us-ascii?Q?Wqfs29ViCW5BuboblZaKHzbDVS89qlPuIsGS2OeD28HZipD0HoY1OyHPmB1F?=
 =?us-ascii?Q?kehzmByJQzynWSspf95iCSrAs5KJmyNREEWxsIOqc6cVqqz89LYRLsfgPyMM?=
 =?us-ascii?Q?VUZbT95WV5ASrxFDLTn5hvSeNChp2LywKJ9cg1+44ypbdT0xqVnOiT4C2HPO?=
 =?us-ascii?Q?SC/6zIhT9+sIrLJcxNH+YIdNtG1tRUihr15KHY8tT1qkvhgC/SzgJ+WMG4tF?=
 =?us-ascii?Q?pP//+BBurPpjRwNVJ8sQ0WQQKoHCfIGkHvW540/H6JNN4u29MwrZ/bt9C9Hs?=
 =?us-ascii?Q?1v6Zf7w7bs4y5NOyYHQhf/tNFv8lU6LzDY3AjgV11JKELwKcAXsgXeAZKZTn?=
 =?us-ascii?Q?WWHArX0P7BQnXDRm+qQKoNjqlOinO+zHJjlRmM0Q+JZpNlUDhyknCbuQOq4V?=
 =?us-ascii?Q?cru0S8S59uLrf/LlJDzuvDxTJifBxkwV12W6xIHa3fr9Rbe+xnKS68Njm0MR?=
 =?us-ascii?Q?KdyQuouP0N23p2bS+lKWhBUIISdZAHnMjzfKZOKMZlOmPDV078yk1Kg/j7jS?=
 =?us-ascii?Q?J261ZHNA4Q5Zo3AzKsRAsBbjUIQn9B9vP8jKDeQfTxKrBYGwV/zdZE4Zktfc?=
 =?us-ascii?Q?IgbPIuJmm0xZ1O1nC1ZyZfXR5T8eUhVJA45J7UvSScePdYPaHcUdJsZaBlSH?=
 =?us-ascii?Q?WTp5KdOSiXth1zmRp1iX1ca1PRdo4WoXf89LUEVibGzW4vyQ0EMF2mukyZ0I?=
 =?us-ascii?Q?i0WjXcH/rfi7+CyhAj406Q+fbvzdIFnYc7thdYgRyKUKA0KzQM+4PjtzK2UN?=
 =?us-ascii?Q?HpQxokv2OLpSjpjg7kvItU/E7EjqtCQ0bKxHP/ZU3OrXAc2CBM0bat7RxqSE?=
 =?us-ascii?Q?M+Qp1mXzC/kJixcgUjGNfeF0Wc3797dqkXv+arQnBbKtqzxCNHmY8vf/je4w?=
 =?us-ascii?Q?iS3OAYPYwNRNIbhONEVi4frb7FcAqxHn+G+yZwWCbvpkVpypXidHFutxd4XC?=
 =?us-ascii?Q?8TzFoaUGS3P4lmiwH3ZgU9lpFyxLeCN+l/JSmq7VIZudeXwHEif+T2iNR1Ji?=
 =?us-ascii?Q?XUXopRbO3v2c2a+ZmOdoB6+2Tt6da5o1mV/vSpZRt3LEEJyYo/nnSUf0c0SB?=
 =?us-ascii?Q?xWbpRWK3kmXJpooGTByDZkBqmM5wJsDoGeZsqYxdGi0bSdrUMRG7hmyNrC4t?=
 =?us-ascii?Q?8PMcP4Zt8Os8vX10aBfQmGjTvH3cTdSc8eba3d1azJ9rlvZh1qON8XZ4sJ75?=
 =?us-ascii?Q?ahvsLEMDD4aXlg+zQq5FnTpAWiP21Ba0swZAr58dNvicqRoDP5zWWUxUKv58?=
 =?us-ascii?Q?ScJcmRsljqDl2+7z+PaSAILpOyRXyXpMup6dFk5kIAghW2qsuKZWaV4r4HtI?=
 =?us-ascii?Q?UHBATcbG+njCtm4OCVm3mtTiw/yFVFZ2LtKOVk1meO9cwGSeLX8/OiICoKcl?=
 =?us-ascii?Q?LFQE50ETvOunpwQdwqq7ZIo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d0e1ea-05b7-4339-73ca-08dd6e1e635f
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:31:35.4764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Qq7ndaUmST4R3TPWmZKmpzX8y5777i3rE+bFeGgaGsemweza+8D3ioWQ41SA9RRUDo5bUQZUlKXKidm4xpsuUAb9G26Oa14HZ6WP4zA/Ibk+5n8NAnoeZF3Sfy0qe9W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

Use newly added devm_pm_runtime_enable() into rzg2l_csi2_probe() and
drop error path accordingly. Drop also unnecessary pm_runtime_disable()
from rzg2l_csi2_remove().

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Collected tags

Changes since v2:
 - Collected tags

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 948f1917b830d..4ccf7c5ea58b0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -805,11 +805,13 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = rzg2l_validate_csi2_lanes(csi2);
 	if (ret)
-		goto error_pm;
+		return ret;
 
 	csi2->subdev.dev = dev;
 	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
@@ -834,7 +836,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	ret = media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(csi2->pads),
 				     csi2->pads);
 	if (ret)
-		goto error_pm;
+		return ret;
 
 	ret = v4l2_subdev_init_finalize(&csi2->subdev);
 	if (ret < 0)
@@ -852,8 +854,6 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&csi2->notifier);
 	v4l2_async_nf_cleanup(&csi2->notifier);
 	media_entity_cleanup(&csi2->subdev.entity);
-error_pm:
-	pm_runtime_disable(dev);
 
 	return ret;
 }
@@ -867,7 +867,6 @@ static void rzg2l_csi2_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csi2->subdev);
 	v4l2_subdev_cleanup(&csi2->subdev);
 	media_entity_cleanup(&csi2->subdev.entity);
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int rzg2l_csi2_pm_runtime_suspend(struct device *dev)
-- 
2.43.0


