Return-Path: <linux-media+bounces-30047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF0BA8644A
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33D241BC3EA5
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F5A23026B;
	Fri, 11 Apr 2025 17:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hjzbQl95"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010002.outbound.protection.outlook.com [52.101.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE8522DFA2;
	Fri, 11 Apr 2025 17:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391247; cv=fail; b=eT6rfdbwCOI9XZfrtaYAILVJ1YFYdY2Ml5YKRE5gN4gbGcq/C3DapLRjLgOCOu/cS6shxH73/8NDoYxr+A5xsTh6lFXiX5muAOUyr/w/xTHPqXdMY0D1mkAEOCGznZgsXF2Hnt1qieOG25YfOwbnMVAhh7DIYvO4HwXsQGLMXtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391247; c=relaxed/simple;
	bh=5lU1IvTR+ixEA6Izj8BDp2/LBTXT2y5oWx7TE4PSwZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ogp7TRG9dIkoS/aeKl6hekswUwVmK4imFydKtzOarBf8DXVADAiAXIzvh+7MGfDTQxuqQAHFjjGXLQX9HjVkoRAtTxED/f8pnm8VhOq5KiP6VHX2BbR3QTd33xCK7eK/FV3wEn1iVBM1TB5/alkCpIMEky+sLXUHTSCCzYzISh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hjzbQl95; arc=fail smtp.client-ip=52.101.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muFKF4h91WzcnWfVRA9O7ahbslWRoytIxsDsPPuEMX6Z6Mqj1wa0A8gZagHf6u2ejGJiQ/KYN9VYlHQOE543UlYy6OY+JsYZZQEWvRZAcRGsoTwitcIq13gV7fiKuBZ98gtfSTZ9WoHfH8CXakn7oWAKS/WWtxiRJF8DCUG8zfaD6T1vABBQY1OqvrXjTtXH1Xit2PXfdMDelmycurnA0moVXWG4UXI3jevZ5h1tMsAc+IFG4Ifg/QYzb/ypQjf90ds2QhLHrSYeDoeyNLHVrW8KDpAHhkwqR57ynIhLBrUdUZhvhKoO2X3wF87QBAdnxxDfV4PPPeysNp3hYSz8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQ7qeoVJqzp6w/iMh3vKTUOEltiFLLKEaA7xGug46xw=;
 b=gV/Sea6/NKh2m+kjLWUEfT2q9Fe0WFbBG00jKiMT7B4UvtKLnmW//6japntmEDcsusujoYd6ZK2A4UxhyxZjWStUL+FxScbpDl7AtWnV2LVRpH3+P6a+tHj/LeI0x4j7ai54gELip3z5NTqrDdHLy0hlrWK6TUV0rd7pPC3I8KiYP6J+xPJtbEKEJDdTP7C7ptn0b5VJJfCOWsf7EzRd/3R3yLoppdmvM1TWe4hQyb/Vn9SqseTSnXgpLenl2EwzJGpPTdsWfx0d30MZURVRgKnUdg6ln+iZOA+gPfhCxENnu+W670SteUguLk9QH6Njn73kYSqOECSbtEy/FYPB8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQ7qeoVJqzp6w/iMh3vKTUOEltiFLLKEaA7xGug46xw=;
 b=hjzbQl95qp6t9Pq/hJonAE7P2pw5K1Q4aSzsD81c0SQjVirU1aBSsMZ4OncbOD+dD24euN9tn/QBMTmd3Mx3tzBgNCY2s7gfvm1jJ2zlA3XloPDHNmdR60P1BeaXwuqfNaAE8sY3Y5rdUMSXPaq3NDqe2FtoPcZ5nH0FCWJfEpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB7963.jpnprd01.prod.outlook.com (2603:1096:604:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 17:07:19 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:07:19 +0000
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
Subject: [PATCH v7 05/17] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
Date: Fri, 11 Apr 2025 19:05:33 +0200
Message-ID: <20250411170624.472257-6-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9f20acbf-d425-4911-a6e5-08dd791b5146
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RndZH7xDiH1KxRJAxelj3BTiTDwvKask5m8WEoILyBPvZNUAQpjbXQIcfE43?=
 =?us-ascii?Q?xzodWwOlMsMU8KD7QJIFacHBvoG77fF6h2EiTWVhX9NWUoA/n7cIZQeXdL5V?=
 =?us-ascii?Q?ouYHeshicGKFpkd+aoyRres/j+u6rhL3nGLbOKhsuRmMTmqgyn6ejSX+qRNk?=
 =?us-ascii?Q?jWrW/I+5mwAMYgmsLbA7+1ijVpRtYe1oKOXaeK+x8JSt7YJaX+deRbXK8G6f?=
 =?us-ascii?Q?oqw9iCBzpZQKi19iloNXZMBT5AIDAKrKmagygZxlNNVtcdPCpmnZCsaF+Afx?=
 =?us-ascii?Q?JQ51NuOKZZSE9N7HI3elYcIrTjGkkwZdEhn2I+l3u8CM30D+iZg4pgcPSvA6?=
 =?us-ascii?Q?1zKExC6T41P5cNqUV6cbBSOQIHGYkwC4eJkdASEuzZiHynSYU4bj+KXGjWqk?=
 =?us-ascii?Q?b3LI4CLep8v/dkW00TO/thL5QrH24fzfEjkbQlD9NXQ0R+0L8Q7XiECpk+gQ?=
 =?us-ascii?Q?r8OHL9kj9pIBvUWM3O6EO24pn/YhjAMWP4BGJAmx1gEACJMuhF3BVLz55iLj?=
 =?us-ascii?Q?MJeJL9pHcEiPnGagRZuPYIsH/N2Gn2mS8MVsa8nYsMBNrYu1kAbL3xpKCmD9?=
 =?us-ascii?Q?GgUhUfkNoruQqSS8IvTErWGBeM75E98KGZEMIMJ/XbvsMDRFNnihBp8YeC4+?=
 =?us-ascii?Q?w0k6Fy/SX0i3dH15EO79zjOjJiD/o4WcZJjPQ+DrS7HW8woFV+lkS56t4Cs+?=
 =?us-ascii?Q?p4i2YcZ9SjlRnAL91u1qoMQ03ffd62uI2UZNTQzbMIxNTyDQzMkYGbRjPtJB?=
 =?us-ascii?Q?bWgDV6XgI6sXhRF2ssvx0NLyWOJg2sExGB2VOO3y+Uo3CH13JaVscAWxT9Bi?=
 =?us-ascii?Q?563HkYA3qCETzKEg0x82FYUOePb/mrAMSBVDInpvTjHs20dyIZ1kmSRvGtjJ?=
 =?us-ascii?Q?KwoKQkVhYs3znaodgsM4XS/N0IAOP88ax2vnDu1RCYTcnf7Kl/llSehNETdu?=
 =?us-ascii?Q?sIXSE/vgMPAukH4eBfgpclxnHaW/UGJut4FVP005+7e/XgSWr1kF43SA9DqF?=
 =?us-ascii?Q?Rejwq5MM5ju6VSFG6MoSr5k/wcbS3C1Tb/nVG8NX2KCywn1De2WNXQ0vljOh?=
 =?us-ascii?Q?y845GKS4+CJ48Wx/4tQrMe/LFpa5A6sKiH6J0XNIeNVvb8Jgk/OvZXCe6ufx?=
 =?us-ascii?Q?CXfYGhB/GPplYU1qVzEIl7HdstadRgOdqk6m54p9tq30bHxewWShzlICrNPV?=
 =?us-ascii?Q?1qnfLZvQiJAMaKRiSuwghDktHLI8iS3zvn1AyRoa5sIGMJRX7+2BQBO6vY+K?=
 =?us-ascii?Q?S5udsZLVtjV+z2RriQ8wCIj7oVlwi4ZOddXxBwre14eW2pw64OiFBLjHN/0E?=
 =?us-ascii?Q?axNhMwDgrbctoFTGUssCIe4AmjuGdY0ZKWN1xdS6X+ndGOen6O8l3SZc5ssQ?=
 =?us-ascii?Q?gQxCO/kw+VH5+jP74azIIqtrVxfR1i8hEg+/q1F+umRAayxk3LCvuIfu3Tbg?=
 =?us-ascii?Q?rDlK9syeuUh0zGctVPkK8LHxEpQ8910mF/EToShtmV5OJQ6uFkjpYA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uVRiaoSiXRErZaqwOyybMAVfGcrt17xYlFsoz+lyjiQqrUgC+2CrlfHEXMU8?=
 =?us-ascii?Q?Mx4o4KkFhr9PciYh4TdfuIMzZ5WKPYYaQrhA21LuZfP+UguuFq5ki2jOLpPE?=
 =?us-ascii?Q?GzI57tGQaWivuDAmTemDexjAiX6c1hsUJqJO3wny3ObTmmasIw8OKS0zBpv5?=
 =?us-ascii?Q?WJSXnOZJ2hO6wgesYwBCpcv+JuUx6X8k1DJ1j5gKPvMFm4VxfBqA0yRdsqYK?=
 =?us-ascii?Q?KLzED6eejx/wIsSClg5bN8CNQe3nRfqK5938A3dcDO6Ug4ZwAHurPM46GnYV?=
 =?us-ascii?Q?P/7J3CzyrPwDAlWaiHcv0wLGQEWn1Hg8OaUWBRlKJNrwoD7Zqwbi4o4f7AMI?=
 =?us-ascii?Q?ZXHVXcP1/ywYWUmgP+OtPepYRhKTA3GLmJ8pHccy7lvsHe1nyJApz6eKnyCq?=
 =?us-ascii?Q?9zpCb+6128rFbL1flcD2ZjGwiwlU4LsPD2wCM390gM2yUMMiJVu84ttvLXqn?=
 =?us-ascii?Q?lhmHTz946SVfOtClaDPk+/6mLQGxRGMopu4bsgXFrVjoQir/JUVdAVG/jUTC?=
 =?us-ascii?Q?Y8D1UQMGQs1eQb+tJ3Dev2fiImk8PetreaFNOthc2QYmoIKPNvUcVZzx/I2r?=
 =?us-ascii?Q?oDWtPKJciJ+TelPDOwLTpS6FSTt3iDOAScsxJGRj5ATwVInjeaNhDfXrb3Bh?=
 =?us-ascii?Q?7RKA9/JSmKXQw2F9pQSgIUjxDpcxiyBW71QllfWili0L0//8s5MY6ntDdCR7?=
 =?us-ascii?Q?22QREp+XucrbQ7PPngCnNYVumF6DAXLkHXq31Z0Tw4FFXhI1dq1WRYcvBta4?=
 =?us-ascii?Q?19FEI8X8QtcF0XoxLHHS74PzrRTHCjLDQvlq/jUx9ZNSP2oxXv9LKKOZVG5Z?=
 =?us-ascii?Q?rDkBqwffRXxGZqp5jY/BUYaUWaZN1ul07g6PYs9UyNFYpDjqkdKD5Ri2wbId?=
 =?us-ascii?Q?hLtdlxDL0LNU7IAH+7/a+Th2oMP82v3++tW3/bW/yxp+eEdk52LdRaqiWNou?=
 =?us-ascii?Q?NPvZadFX2tR/eYUI4nWj7Mccpnl3lKSxGriNMdHbR/JCvj7DzAVFLIAtJZL2?=
 =?us-ascii?Q?a18ZHQScsWEO8oRjf13dIcqNvEdXPS2HMUhh1DVnIuXr1UlkI/NztGc+VgXb?=
 =?us-ascii?Q?GhLpW9V726P5P4Pj7RUNOHfY0Mkjh5Mv+7BygzEwLF/SJ7qjHahp+5BI02ns?=
 =?us-ascii?Q?vkCMoOZMtikABjh1Zc1UmURTIxNJlLgrtgpO8sKDzEeL8d03HFqclNTOMryO?=
 =?us-ascii?Q?xJis2+DI1XryONJIern2wymgQEMo7RRKGFTKkjqxdJgN6RBHzIRbcDHOPtAU?=
 =?us-ascii?Q?ccIufP7bXL2QVBuzzpUKQXVJqku69PhxKAb9NXlkclUKMlSwvFy6kzE3MSim?=
 =?us-ascii?Q?+3/X+irNGPqt9Jafy5V1Kw9ZbZ4VmpK3OPJ5xoed0cMTdfPqyrDCYYzS/DEW?=
 =?us-ascii?Q?HJDF9JiVMGdGBuLUfuQ+mEVvCsyO6LBWJ4++97d7iZhdpTBHbRzyMDse7UIJ?=
 =?us-ascii?Q?FRexgtHWw2Ne2uyc48V1NlHGgldrwvqxX4Wql/Vts0gIc1nGm1whqPbh+ZAE?=
 =?us-ascii?Q?lShfi8idjDsHvLJuw6u2s0b4IZLeB4cuFIx6D0f4zCxLzCfiw2BRbZ6BibQ4?=
 =?us-ascii?Q?ZvwAHPlbY4AJh9C6qkiOBursXzhO0/o2STKQ2M3Sd1OTXnFd+HJTptP6NV2a?=
 =?us-ascii?Q?fhYlusrDfJ5NMRcx2bN1hzs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f20acbf-d425-4911-a6e5-08dd791b5146
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:07:19.5011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inWRoVM1md+/e4L2IdAsPVC5BD/12f+FI46O7sKwCm9I3CzWrfrzBym7haHxahyoFJ9HBaOjJls8RD6EnFLabuFWYtqNtnC9MGAw07fOiwkjGlhqKFRpvbdN9vQtbRCU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7963

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


