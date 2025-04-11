Return-Path: <linux-media+bounces-30052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC901A8643B
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D2DF4A59AD
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3874233156;
	Fri, 11 Apr 2025 17:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="R1lNLBo9"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A448221FD0;
	Fri, 11 Apr 2025 17:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391283; cv=fail; b=BJaYSjfzmNByqKZph8ZrWtxa9yzkipHgl98hbXwHuohhKWvsXqxbmSW84Ze5JlMLxXeGtrZHj6CL0OQ/7N65Oa/5bBaBGadChxh7b9/TMSZkbiSKvaGMxhLDAxbcJZjnBclzV3+MzF37KY7Owr3PHfm3WUytFFGdDpNirS5Lm+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391283; c=relaxed/simple;
	bh=FEW971mqYDckTlqliO9ZrZLh4MZpDT0SU4fDmE1lJlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TrojFUXleIMSBtThjr1zPnIcA3d52azY9hB0SbWt4upjy56TsRrF6vqxVOw4gbS3NEXlov+LqHxoW9rTjfECXrSlLwhH2OQctq/s79OaQoq0ZLpkKGhMi5v5nkxtwTYfSUJUTt5wguE2FgYM3ZONKGe0AhbIatmF/BJG8cKmKm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R1lNLBo9; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/4PEseLsbySqEsSMnmJAkN451tE5LECp9HlBmed9AHQAPziZOr+gRZyFwdWVNHhqM5Iy65NavpdL9x9E3F7onZLye/3qdXEv2v3thefG1S5wCbZ5CLXNHuFnV0LgpbPpOGD05MoaTlWR7uaVZui7Thc89Eab8unUBXEcmLpfUBXP8521x5OqbbvH7SPXRkKgOiyvcGPkiVTxTbL73ZoGt8ET4c7mIrCysAEa/lf+XaOHF8z/NL9MkrS4CPKJ8ZpYuLlgZfffmQj8eHdV9qJ6L/8rN7reRuREAgaOuMV8L4b9w6KHwsYjAdyVQNBiXqpfiRJf1/Gu4bHzJbtML/LcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPCAyGIaCpVn+CBKxCEdizeov7zcOBsaTTXln0USCBA=;
 b=nUupq7IsOR6Yt+0PstH2p4m7q/lFi0I2ebvH3nCz+EAzHi6XNoidYj5ApQZKiA5fVgOGV09G3+/TYY54YYA0m1CsKmj+0wfOu5b0g30P5F7GV8CQ9Naxa2bI2cN9eMKAne4BN6IOXboQ3hhbB428YVJN5ysus4NDJQoKX9ey/eMWuBXADQdQjpHgR9X19H0cQFN1qf85au/DKDYnhm5t06irFzKu42DCMHKkgxO9rtZUliBRzMdghS7ifTgy5Zah6HuYY94AQq7E3i6wTkVAx+tfMCmvgHwyN7KZ0eqJDZQ+ZDsfpGfN8py2/Ih2CEGl98nblgc9kxrjYmqWrGLcww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPCAyGIaCpVn+CBKxCEdizeov7zcOBsaTTXln0USCBA=;
 b=R1lNLBo9uggV8L+T9Fk3GTIFhRjPFMd3yJDZrfdhjV2hfRMUg6Ge8NC2MF3BBFMKIliqZLbZSRv42z7mlp+6dzwAZq4A5WabP5JL0o36e8NMCsPRXTwKpqLPwx8PipzoRxXs1eV7AvZgtdpptiO9xsEKropXDDl1pjN7DDHvnK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB7963.jpnprd01.prod.outlook.com (2603:1096:604:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 17:07:55 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:07:55 +0000
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
Subject: [PATCH v7 10/17] media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
Date: Fri, 11 Apr 2025 19:05:38 +0200
Message-ID: <20250411170624.472257-11-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: ba9237dc-9bde-41d0-77a3-08dd791b66f4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ma+uH1+HMp90s8VIT2op7Q5AhT17c5RTIOfPFWKGV8+2z5/CwjxCWimmKeDt?=
 =?us-ascii?Q?xYBS+QBlycNOecGambIV1N6l0hTlH+5b825+Ld8hiZ4LwlS7g4RRS1eqDjN+?=
 =?us-ascii?Q?PRX1sodib3sgwIlq6zVAeHsptfd9arkHcYknBQa/Fxg3Q92I0APACUfos9XU?=
 =?us-ascii?Q?RAyVkDvliWCLS7AiQu7z2Fh81eCSqMWFGeKmN0ry568LGRByToBynXPQnYAh?=
 =?us-ascii?Q?wjFaX8vh5ZZigUITn32sDL/ghfPYsUhlSWCAJxfrXN54DgaGt93kCPcbOKPm?=
 =?us-ascii?Q?Ud/YIb7gTP63a/o1VWxdjaWP8dVm0GWyWBIXV9Ng6ku6zbPACxZueSMWfjjJ?=
 =?us-ascii?Q?ViFTnZ2INbn2aKH1brYlCrxJOOrvUgsu45lvPR4QABKBslgx2HaaDZGInWYi?=
 =?us-ascii?Q?MJesBPMtRr/a7C33Izj0oeGZMEtkvky/szcl6fAV+4vBT+XGcjFnWRwhneRr?=
 =?us-ascii?Q?DFH8ZYdhFmCfFDrPYKoAN5KA3IS3BYl+d0RMg+Os2kdn54Y74yT25v9s7/ar?=
 =?us-ascii?Q?WHlhyHvh8ry1aDLA1MkLK+U3MYSADaYFErbkRKKYzndsVDFNz1WGRsTsD14K?=
 =?us-ascii?Q?wFAvWylI7MEEY48h3RYoOWBL5RcXDij9PCofas2D6GqblQ6sf4CqCxief9gG?=
 =?us-ascii?Q?bfZ12nt9YfxOtQluxLL2aVc3KHwR6E6gdSn2FYwE8ic1PAKjl7Q1nwg7368b?=
 =?us-ascii?Q?rgA8rDjhLnWm/B7EJrbG2wphRLQMC1uUfq/DAWZG4/WnWYpDGfDbutddEwoH?=
 =?us-ascii?Q?Kxb1SgJ16+ckC6aPc9I+/KSslNkwosTxBqW5lIWhxKwb1qsC4xCdAqBAg+CO?=
 =?us-ascii?Q?MO+/DLiAhiEzIC7G/qIO8Q0WK9XY4Q7SEFbG3fCF/XiTgkul9f9rnTnZ05bA?=
 =?us-ascii?Q?yk15xJUJv8YdaBM6YyWV4UiWPPR5zf8QzKEyZe/bhEjLyUeK2JMwknJUDY+Q?=
 =?us-ascii?Q?HcWMkdprKPX+Q8eI5eT8BA9R9eR3EpwTZgjwfbkxLBxlWOzPybVVM0nyeKUE?=
 =?us-ascii?Q?Rr9fOXcLftO7ue0jfTd7IaGoMkUoINFK+7LtLNdTC/6VP1Fv443fb+DXLd5O?=
 =?us-ascii?Q?5wqhJDeTeLU4QVbPbs//Fdt19Qodmh9sN//K+9kxSxL2qCTMIb7OQ983duvp?=
 =?us-ascii?Q?6x1D+CdyNxMSmuh8ghTqit4FWmWUWUkYvaSTzppwNKSEP+R4z+MEVgguko+7?=
 =?us-ascii?Q?+1qw3LDEsu2ytZiBbMPAqz8kS+cCpWObn3EGuoeS56kgX3fgr+U4bknfRRux?=
 =?us-ascii?Q?eFiq9bDVJnYIXxmE0GR1UuB1l3/Y1cs0dsNP+/2nmhjMm4zb1sLqkDPRaHYz?=
 =?us-ascii?Q?Y6iepK66Vcm/1USvpO3k+IRxtvlHRiT7U0wf6gaSKVjZjeFG0qJOYcxm27oH?=
 =?us-ascii?Q?q8F3xmf0oCfaeas0GPKuHUHR0ODpLWX/A02WtF08oDCqg/9v2F7GePVOMEXV?=
 =?us-ascii?Q?7moUA7yOfFckQlrgA4F6FntqvyrHKSh2jA8aXK+niRr9fk+Z162SdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LyWLjPeLh2tcYmmY8RTrjrtQjNoyU+STLzrqqfRGAAIaba0UxYI4n/n2HwfU?=
 =?us-ascii?Q?RpSH1OovVXZtCzruNsNm9C0LX0AYkJZvtHCqV4Wz62Cx0Qnf6kiRU6PoH2rt?=
 =?us-ascii?Q?OitU2c4cGG11eax3RskO/SopPhckXifoTV/o39Hrk2Vlyt7tGWrDdPirje6G?=
 =?us-ascii?Q?3XONv1OAUDoSeCGY1dJ5jiY4Luw/lZTHyBOAVX+v/nl5+Xuuu3p2lAnvU766?=
 =?us-ascii?Q?4bbdZZrquXle8P/aHz6EMRUCCIsFRSeS1oI4i5nUYXT4M3sDy9aDOX400jKG?=
 =?us-ascii?Q?pFBe7IbsYz8iMCgIq+d+4Wu6j4l5Qaa+fTgs+y3KpweMvSFZJXzCxTXBEEyL?=
 =?us-ascii?Q?XOroGVkXg+9MNy9HJizVX/5VFkn1OMgMnE0cRmkZY0+0AjubcJuUJPEytp8h?=
 =?us-ascii?Q?ywwuVWH2urit6VXt1kROc7P/G42H2GW67rAMJUZY4qtg2MaO1ZjgPIKSvnMT?=
 =?us-ascii?Q?NTagILNKJpISPyDOKvYV6+lC2eXz8bWCQ2cpd5G/1RpFO/LASN1SPhwQL3CC?=
 =?us-ascii?Q?uco6Oekq8Xrdy6t6NaPwTYLi5Hxi8qKKfaGLixFA6GWK4WRJn1qSfZp0E2Sa?=
 =?us-ascii?Q?LHt5i98XJzD1lFBXckdhzYNVd6OUNeFxDOOjSm1SXfqKR4fcB7y0g2ZOdnLw?=
 =?us-ascii?Q?pcsqxuO/s6hXijVY0LqQZGdPttfGK03ZDtgLaICNNY9GMC1Qnzso+iQ9go5A?=
 =?us-ascii?Q?FgUl2qOBG6l1BTifuAp5RlLyiGv6UO1vCbAnDn44cFy2a3eGw7h74W9bItCr?=
 =?us-ascii?Q?U0b5YXDm8N/XwFnPqiM0lK/C9neh7lAUHs4NGAkkUB9F2mrPgOb79dFa4n7/?=
 =?us-ascii?Q?kfPJgNmA6vat7CF0XZINfHDtJP6BqGBdjEBodqWfIADcrtB+49D0DVtFXNH2?=
 =?us-ascii?Q?rnNNrXTDGAYMa3mvc7AdLys+f4pj5lVIa6kupxE/RCz5ildk9V/u0LsD/RtZ?=
 =?us-ascii?Q?nK+QYx3DQu4svvgKbIIbbRNdOJgV5IGKyoEbquvJ3zl2nRHvztPri/glyrkX?=
 =?us-ascii?Q?P8nGpbZZsJzbwPZe+LEpEheCsZmYF493Zjl+0ozTIz2wtOaDxz4MJ4NrMe0f?=
 =?us-ascii?Q?KW5hhSY+VBjEbTc0BkhBkyavDqR4b2GFIPk5Mnmqa3AeWz4V1t/2k05ewtVG?=
 =?us-ascii?Q?KwOBoMeY5FUJxVBMbiHB8FIYQiLCfs13onzCB6B/3lBQQQzfkM2yImV8LlIJ?=
 =?us-ascii?Q?Q+IIcrMuhJp12ydF0rpWTCQadfJkaGF+ej3xT93mObUkVyEWLoo/DyYg4jbV?=
 =?us-ascii?Q?XBPEuZGqIuS+Rh8qlI1Ajh34chu8d92lyz9qr5IdNi4sqYrf4zAK35SCYZ3g?=
 =?us-ascii?Q?z5ElYZWSVj1M7r0gojp2t9gE+t3kXRH/MJR9wZn7w5Uga7MFxDOhcvMIU+oq?=
 =?us-ascii?Q?Dkt5XLhrt9SqBJzkRhKVneA2Dj9cXyVcWlLx6fUkUof9xyYeqn38o72aOq9v?=
 =?us-ascii?Q?Do/WxszasbfemSJOdDxO90ealRm5319/rVQWqnzeEp5X1H2hfVn23IRt3s9h?=
 =?us-ascii?Q?9v5R9t84VAUcZf0/h5MYMJsAgXIyAuetRtuSPWlvzjeMh7U8MwwknrYpHAxX?=
 =?us-ascii?Q?5aZiDyeaAm5dcmHMlsDIafoBRHB4wgJIOF5s5Le3pM2lrOmBr3e+1vC4Y+Tg?=
 =?us-ascii?Q?CehlrWZgXHJzkevBtkBxciU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9237dc-9bde-41d0-77a3-08dd791b66f4
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:07:55.6081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BgK7xaKrG+JZ7OVKmUCwLbFWz6Ss+3UTdhZKJWIMOmVvaFcdIDJm8qwXBjxaYuDYQcAkwZEvzTsCZw+HAGlXTDWvADN41Tc48R4NpCIqmYpAJiouYVE+vBteizUouX8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7963

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The D-PHY on the RZ/V2H(P) SoC is different from the D-PHY on the RZ/G2L
SoC. To handle this difference, function pointers for D-PHY enable/disable
have been added, and the `struct rzg2l_csi2_info` pointer is passed as OF
data.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Moved CRUm_SWAPCTL write of rzv2h_csi2_dphy_enable function under the error
   check as suggested by LPinchart.
 - Moved rzv2h_csi2_info after rzv2h_csi2_dphy_enable() as suggested by LPinchart
 - Collected tag.

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e4781105eadc0..9243306e2aa98 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -85,6 +85,15 @@
 					 CSIDPHYSKW0_UTIL_DL2_SKW_ADJ(1) | \
 					 CSIDPHYSKW0_UTIL_DL3_SKW_ADJ(1))
 
+/* DPHY registers on RZ/V2H(P) SoC */
+#define CRUm_S_TIMCTL			0x41c
+#define CRUm_S_TIMCTL_S_HSSETTLECTL(x)	((x) << 8)
+
+#define CRUm_S_DPHYCTL_MSB		0x434
+#define CRUm_S_DPHYCTL_MSB_DESKEW	BIT(1)
+
+#define CRUm_SWAPCTL			0x438
+
 #define VSRSTS_RETRIES			20
 
 #define RZG2L_CSI2_MIN_WIDTH		320
@@ -140,6 +149,30 @@ struct rzg2l_csi2_timings {
 	u32 max_hsfreq;
 };
 
+struct rzv2h_csi2_s_hssettlectl {
+	unsigned int hsfreq;
+	u16 s_hssettlectl;
+};
+
+static const struct rzv2h_csi2_s_hssettlectl rzv2h_s_hssettlectl[] = {
+	{   90,  1 }, {  130,  2 }, {  180,  3 },
+	{  220,  4 }, {  270,  5 }, {  310,  6 },
+	{  360,  7 }, {  400,  8 }, {  450,  9 },
+	{  490, 10 }, {  540, 11 }, {  580, 12 },
+	{  630, 13 }, {  670, 14 }, {  720, 15 },
+	{  760, 16 }, {  810, 17 }, {  850, 18 },
+	{  900, 19 }, {  940, 20 }, {  990, 21 },
+	{ 1030, 22 }, { 1080, 23 }, { 1120, 24 },
+	{ 1170, 25 }, { 1220, 26 }, { 1260, 27 },
+	{ 1310, 28 }, { 1350, 29 }, { 1400, 30 },
+	{ 1440, 31 }, { 1490, 32 }, { 1530, 33 },
+	{ 1580, 34 }, { 1620, 35 }, { 1670, 36 },
+	{ 1710, 37 }, { 1760, 38 }, { 1800, 39 },
+	{ 1850, 40 }, { 1890, 41 }, { 1940, 42 },
+	{ 1980, 43 }, { 2030, 44 }, { 2070, 45 },
+	{ 2100, 46 },
+};
+
 static const struct rzg2l_csi2_timings rzg2l_csi2_global_timings[] = {
 	{
 		.max_hsfreq = 80,
@@ -434,6 +467,64 @@ static int rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
 	return 0;
 }
 
+static int rzv2h_csi2_dphy_disable(struct rzg2l_csi2 *csi2)
+{
+	int ret;
+
+	/* Reset the CRU (D-PHY) */
+	ret = reset_control_assert(csi2->cmn_rstb);
+	if (ret)
+		return ret;
+
+	csi2->dphy_enabled = false;
+
+	return 0;
+}
+
+static int rzv2h_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
+{
+	unsigned int i;
+	u16 hssettle;
+	int mbps;
+
+	mbps = rzg2l_csi2_calc_mbps(csi2);
+	if (mbps < 0)
+		return mbps;
+
+	csi2->hsfreq = mbps;
+
+	for (i = 0; i < ARRAY_SIZE(rzv2h_s_hssettlectl); i++) {
+		if (csi2->hsfreq <= rzv2h_s_hssettlectl[i].hsfreq)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(rzv2h_s_hssettlectl))
+		return -EINVAL;
+
+	rzg2l_csi2_write(csi2, CRUm_SWAPCTL, 0);
+
+	hssettle = rzv2h_s_hssettlectl[i].s_hssettlectl;
+	rzg2l_csi2_write(csi2, CRUm_S_TIMCTL,
+			 CRUm_S_TIMCTL_S_HSSETTLECTL(hssettle));
+
+	if (csi2->hsfreq > 1500)
+		rzg2l_csi2_set(csi2, CRUm_S_DPHYCTL_MSB,
+			       CRUm_S_DPHYCTL_MSB_DESKEW);
+	else
+		rzg2l_csi2_clr(csi2, CRUm_S_DPHYCTL_MSB,
+			       CRUm_S_DPHYCTL_MSB_DESKEW);
+
+	csi2->dphy_enabled = true;
+
+	return 0;
+}
+
+static const struct rzg2l_csi2_info rzv2h_csi2_info = {
+	.dphy_enable = rzv2h_csi2_dphy_enable,
+	.dphy_disable = rzv2h_csi2_dphy_disable,
+	.has_system_clk = false,
+};
+
 static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
 {
 	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
@@ -910,6 +1001,10 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
 };
 
 static const struct of_device_id rzg2l_csi2_of_table[] = {
+	{
+		.compatible = "renesas,r9a09g057-csi2",
+		.data = &rzv2h_csi2_info,
+	},
 	{
 		.compatible = "renesas,rzg2l-csi2",
 		.data = &rzg2l_csi2_info,
-- 
2.43.0


