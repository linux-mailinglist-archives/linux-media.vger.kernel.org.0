Return-Path: <linux-media+bounces-27065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCE0A4649A
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17549189C977
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2384227E94;
	Wed, 26 Feb 2025 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="b0G0gsFn"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE83227B83;
	Wed, 26 Feb 2025 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583561; cv=fail; b=Lg5FFGul0/5EtHtDyb61As8HhIU53ujLcmk/V8/x8DuHrEgOzpA7ckYL5ddbB7I377SEfPlpei216AUIcUThAWsAjOqlARxQQ+6Q7eb1rZv+LGORFJdHlOpJHqf356eDz8FeI84JK6vgyDgxH2tM0IqyBsxhUJuuhduK56T90Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583561; c=relaxed/simple;
	bh=LqfLMzDRg+QEn35zV+3oPZfAc+VImK8JMpyKyCgmZ6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dckdF7jAzTKl7IJUvJ0roGff+OMbEsf8z7chWTiQ9nL/GIoL9fD2sMwJV0i+PurEx6tM4Jvq0R1v/pweu+E+cxBNPd9vnrZ9rRnU4BPaGwhIzoSNprI72zJYuLhZpWFveRmEgo9MJqggMgklI9z75oXXtkhMAhIcwwN6x2MDwV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=b0G0gsFn; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcZehTdtqt3CuPKPQBVw7KUnZkJuR4yPaH3lqgixpFo8k8rTdy3EKFMvVGsJXDMFXfACwsUx17lOAHUVo7n47Ip5U5zGBsDDqH6x6daP3el0Nj7EbA44Y+OtrPDGEIneEAsIehy7f2ziuhlSUDDXeYqCwZONp+10fTSgzSVhKFx6k0aeiWx9pqiXKgxtamgU2OQA5FVU3IrF+ymy+JDovbGrEN36Bs8NUvVlamqPsA0XNqYw1z1Lnzn48dvLhV0yCFly5ha9dWBQ2NH3SV/yCSJFOYkDbmU5Cvva0MaiexYKVZWWGWF7JK+4BvTr+peKhEZhbuPmU4XgUbiYjCK04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjun3rYJFbgHoj2Fxbo7XX+LDOGEbWMW0HgfswOEADg=;
 b=JgqGQuSjxSaDtlSyDEKGcvCo8jg+eqb+aivVvmCLg5Q3Df7A7qInrO0vQPLXBMjX60x6Lt40e2Y2IS9WrvNRYkpUhD/DwEXF5Yv0h3kVzy23STveYJtomlKOFmoQYqsui/bSJks9xaGc8+bczFjoN533pnOlPv+p+egVSIH4IfIRBxLZXQHn/gf8ILkplntPdYkacZOusZ1N6GjHIdhpEKNgl3fI8ijkBvorMR3/ELSuQe9h7cY1Qom37y0JN+qqzU8XIpLBXaC848TcpCslkP5ZT5FdORn8pkc5Hf3ZSvOF90w48eDJvMGiEjCnHUjXgJ/0cP86T0fpYBZ2DI/kgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjun3rYJFbgHoj2Fxbo7XX+LDOGEbWMW0HgfswOEADg=;
 b=b0G0gsFnNU2BHXNppZYuQK/YccGdnAb/9ONwY/5niybYOWqEiyjZwDhboklw6ByoPzafYMD28eiqfaeftNFZigsoR/BSAd/cX6ufNhJ0pa2Unu1X0s+W7cUoLreRwYNqMBqs7CdxZ+LaHcZtYXv713vAfGTVEX4FYReV0gWKpsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:25:57 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:25:57 +0000
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/17] media: rzg2l-cru: rzg2l-core: Use local variable for struct device in rzg2l_cru_probe()
Date: Wed, 26 Feb 2025 16:23:30 +0100
Message-ID: <20250226152418.1132337-7-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: d123e49f-81c1-4439-0a89-08dd5679ddc0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D2l7joOc0cwbbGjaUn6NSJG87b3EDwHZHFdMY+iIaBTaHkiaiHCIomFG/ZYc?=
 =?us-ascii?Q?dmxZvGEAP349aLW1SUlMnMmaYCHJBnYE/QCKoZf9kJA6zGnSFtQw+rC/q4Fe?=
 =?us-ascii?Q?JGlgidGWx7woj7lyxabHXwalOgMnoe77vAf9LDNLGquluiYqyxKXb+//sRlu?=
 =?us-ascii?Q?KZubwYV4t2CDdwpJ98n68PdzNhENUeIdBIiPak+Sz876Pxag/1BGjmOBRMNK?=
 =?us-ascii?Q?J0dM8yV5q+6OhV5/Q/6WeCbdmG0Ka+qfOb/wsADoLYz2oD9GxjFMA+UgP85X?=
 =?us-ascii?Q?sZoewQeTvpPu0Bqof0Yv+w0dHMDGz6BHAK4Hir+e3Ey3Ro5LQvM24n3QHe0y?=
 =?us-ascii?Q?9BXW8MdvYbcbdev1ylXkmLc6yDc1GjpHps3PUu2TSiWeYhW/0AuKsOBrtqJZ?=
 =?us-ascii?Q?R7jW14Ou3xsAPhw3Sp1i3lvxtXjNOu4b024rZz5MlryLVOYXIiKiIgrtFPl7?=
 =?us-ascii?Q?N6pgnlXMsVnwlZyL+USRJMa/6mufFwXjcUrQps7gQGmUDGD39iXFx3sPRUBC?=
 =?us-ascii?Q?/GJEXM3hewyJ0Tg0VGmN5WpBWdRmJ36r1/y4eIqe0OJNE2eZGH4CUahw5Ov7?=
 =?us-ascii?Q?Z6VnnFHfhYEVgxIbJN4WAq1H36Our4xTuGtm6nEMODSKo8afJk4GTTlgPe53?=
 =?us-ascii?Q?tjEX5K4VLLfgfLbGamzt1yZZHMajVfpIGqAd8U/tImZa+8F/Ahc/sVXJQl/t?=
 =?us-ascii?Q?zeafrWbV4RImn79ugnZmNOIXaBvh6ZgHyEdddB+G3+WfLLCbCuEbg27Nv38S?=
 =?us-ascii?Q?5qVs670cJScIwmIz+JPslg6T4UOxfQ/dndna3DTu79W1UjPetE2grHDxfZt0?=
 =?us-ascii?Q?PWUuu/g+XvODZUYhVZDD8FMAPrePdkM4NKyH76T7fAKl4crIq1rjJmQrC1IQ?=
 =?us-ascii?Q?oKaI6gik8qrB+yCij2tZs7RgZjTvpua2jyfH4w1QYdKDodBWXjba8oVReBgt?=
 =?us-ascii?Q?EEIP6WU4uZJ+h2dLyp0rVYr4rSdP6epcjzij1RZKi5pX81aWnUvIBKC6CSeE?=
 =?us-ascii?Q?qIDRv28QAX1aQy8WZV6kkSlNloMK0qFVzXc+KoQZ5QHrRmhF1kFBc9zkv0mr?=
 =?us-ascii?Q?3oOjS89QOpWxbTBPe+Lk8rOVa5OOpRPxi4n4wZHVvvJXbheMZ7rzjB/TaSDP?=
 =?us-ascii?Q?6cbZAkebXYpWLNpoHj+6pbqf7jE8VTjfYUSLPtQIpzdYsKe9gO7RPQ0FBewb?=
 =?us-ascii?Q?KvxWV4WOiKLshKNub5ng7d2TIUItnhE40SYaK8cv7ZO1XTLpdU1lHdpV8gTF?=
 =?us-ascii?Q?G5wFlJGnHAJevwEjHkBi+A6pfxyhaWmr8e8Af+ZSZgrV2KXM1FWxkBvTbMKj?=
 =?us-ascii?Q?NupUuqEtvLg+bqBBUUqHU+6ppPozG1nTgr5z6pcqSDEIDse1RqwqCoF4q0F7?=
 =?us-ascii?Q?inw1hBqAmBH4Kvf16HfhmCAPFKpmC4Z9opaTrVR90agrHSlapUAhQxYIQhZH?=
 =?us-ascii?Q?V7cAovBUGukQmsB/7xVtCfkHzKUeqJYa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GraazQWPplW5vfsM9ZcnMQfpo+bPPO+UI0KWpjjOhiPChhTGj2Wu/PPy7h/a?=
 =?us-ascii?Q?lNpHVjHTaj5rPkNBjPYgO223WVnTcpwtNugUjjW/hMqe7U/1+fq0f5+sP8yQ?=
 =?us-ascii?Q?JBJ3OivHyurPI1KwnrS+uOb7hqwegn0ssW7nyGtaXuKCZiebsnida2RWvY4A?=
 =?us-ascii?Q?EAIKQPm7ESd+bbgiiZjoo2GDD6pujOAtKwBmvaT330kcMIT1p5TM1nCWNe/T?=
 =?us-ascii?Q?dniJoSX1aMJu+5D+9G7e7tZdVDPRcTgmXD1ytLhQ17TfOUFLkaTjsDqgFxuy?=
 =?us-ascii?Q?xA/hibXTmwkBe0sGaB42VF48JqZKXGbuqVJeNz2sBO6M/JlZRyr0uVO+lenL?=
 =?us-ascii?Q?0OWlLk1ULiiD1Zbi530EfdD5v+zDLQwmColP8TpocY7koCT3ti9XEhO4ofCx?=
 =?us-ascii?Q?s4ZD0a/LYvdCmLIv0W9ZtyZit8lmEoicXTOYCKapw3l0jf3++Hu23HsFP0D4?=
 =?us-ascii?Q?oB/DN74kFmBrC1zPCr5TC22fZrmKJcUlcoV12JtbC5ADI9f2AVoyjQcd5ubM?=
 =?us-ascii?Q?xV5a7VS3+F0l1Eewo62Iz6UmCGdfvN8oNeay0ei9y0o/CPsNSKgOtB4B7fmt?=
 =?us-ascii?Q?2IrkE7y9gN3I3XWTZNUoiXmSdPtiZo0+IdWpaEdTa7Xm6iD1AfML6THPim9E?=
 =?us-ascii?Q?mp/PpBbxGOpVivFEpOIqa160rkdTUuR/XgYl0IQnEU4xUAbQsuQ6+ZNXSZ5t?=
 =?us-ascii?Q?lb8A1BvmBlmWCziBUDVUIcI0I/EUu9fubAfGlyOjQ3JLYBFX/T0AZlb89Clr?=
 =?us-ascii?Q?44HMdkOcr8VkFDW6Mx30MnLgs3cLIxtqAW8DtQIuzo6CJfr6inDrDU4zRSv3?=
 =?us-ascii?Q?P3XDDJKo3WtPWSL5+BPjb1uvycwSNISlJePFECt05ziaIjofWBn3InwlWWvI?=
 =?us-ascii?Q?nEu2dft0x1N2u1pFAkTBuTdddbwtDLjmZep/TLNnU90HVTPMXykaJWp9DXzU?=
 =?us-ascii?Q?Ua9ssSROI6Ch1PqWH6rBcX5Z7YoLOnl6rjPyGDGIAG/KtUYivB6TGupqUWt5?=
 =?us-ascii?Q?ZIfqckoOd6C8zIp2/uEQbihJr1DgTgR5lDi5aV0fj/DxQP6QtVrScO0EglKE?=
 =?us-ascii?Q?bgfWnCTlnyw55V+0ZUJIVWgCZbbGbQTGqRV4xH/+UWAMGokL9UZDD8P85Kx2?=
 =?us-ascii?Q?ZnjOsf3Oun7Q/WgFIqrOsnqCxueD9WyrObKKRpcLvnNI9CkhMThA6u9MLw/i?=
 =?us-ascii?Q?ZmbYohXxJtUFmOFF3WiI0eC8CYdmajphuFLRVl/Rrm/pGeIzGPwJ+wO8AVet?=
 =?us-ascii?Q?vYbMBJVYbRhk1CLipv/UaVx/UlPoLx+Yum+DMDGlu2dlfD0IRaqCOHHnYKkp?=
 =?us-ascii?Q?OfBxoz/RtJscGhAAnOi1lYIbwbiNPH8+wadYJ1koaw1XDpQ6zzdRRH9xKwxk?=
 =?us-ascii?Q?PtMGovLUz9ecv7bKurhyZBhkl4UUlJzETe/8JzC2nEdSDAXUXf1fqhWJKEmi?=
 =?us-ascii?Q?TrEMRTPV2TSe2LCEH2qW6gObT40OKdyPlgXg825qsN85v2xbosDziBmo5y4W?=
 =?us-ascii?Q?Fc6/06qhXZzkLWzCgIQ3lcLLI8QMypf7oRg8e5hevOvVpSIsZyM4fEofadWx?=
 =?us-ascii?Q?qOkHd/PFXny8Ouzym8NQLRIMDdxlSx/UvuiEYR3i3wPvu5YCqnRsTNYuNlVx?=
 =?us-ascii?Q?7hzOtEH87nm9UC62WnQoANk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d123e49f-81c1-4439-0a89-08dd5679ddc0
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:25:56.9094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJxxMMkRLD4rI4cgEGH7yuVCdJB5/74lO4mmgj09ioYEgqS1Zc4nDeBF8pZsUpyg8KqkdrrVnIpFy4Ui0DI0tYsGIXr9kXEMLE0oC4d3vy7EiDsSNeT+X01fNIyP8BmJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local variable for the struct device pointers. This increases code
readability with shortened lines.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed commit msg and commit body as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 89be584a4988..70fed0ce45ea 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -240,10 +240,11 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 
 static int rzg2l_cru_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzg2l_cru_dev *cru;
 	int irq, ret;
 
-	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
+	cru = devm_kzalloc(dev, sizeof(*cru), GFP_KERNEL);
 	if (!cru)
 		return -ENOMEM;
 
@@ -251,32 +252,32 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	if (IS_ERR(cru->base))
 		return PTR_ERR(cru->base);
 
-	cru->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
+	cru->presetn = devm_reset_control_get_shared(dev, "presetn");
 	if (IS_ERR(cru->presetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->presetn),
+		return dev_err_probe(dev, PTR_ERR(cru->presetn),
 				     "Failed to get cpg presetn\n");
 
-	cru->aresetn = devm_reset_control_get_exclusive(&pdev->dev, "aresetn");
+	cru->aresetn = devm_reset_control_get_exclusive(dev, "aresetn");
 	if (IS_ERR(cru->aresetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->aresetn),
+		return dev_err_probe(dev, PTR_ERR(cru->aresetn),
 				     "Failed to get cpg aresetn\n");
 
-	cru->vclk = devm_clk_get(&pdev->dev, "video");
+	cru->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(cru->vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->vclk),
+		return dev_err_probe(dev, PTR_ERR(cru->vclk),
 				     "Failed to get video clock\n");
 
-	cru->dev = &pdev->dev;
-	cru->info = of_device_get_match_data(&pdev->dev);
+	cru->dev = dev;
+	cru->info = of_device_get_match_data(dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, 0,
+	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
 			       KBUILD_MODNAME, cru);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
+		return dev_err_probe(dev, ret, "failed to request irq\n");
 
 	platform_set_drvdata(pdev, cru);
 
@@ -285,8 +286,8 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 		return ret;
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
-	pm_suspend_ignore_children(&pdev->dev, true);
-	pm_runtime_enable(&pdev->dev);
+	pm_suspend_ignore_children(dev, true);
+	pm_runtime_enable(dev);
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -296,7 +297,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.43.0


