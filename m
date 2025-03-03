Return-Path: <linux-media+bounces-27393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6C8A4C6AF
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDAE5164A74
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6825229B07;
	Mon,  3 Mar 2025 16:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SDjYmIRF"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F47B215789;
	Mon,  3 Mar 2025 16:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018256; cv=fail; b=mGucnyqFrqGCpKoPBcrjSNmXMypgbNwb2KlwnTuRYQ4NHHuIXchfD0o020liIfFoDIYRBE8pMDHRwJovw8f1dtt67nWQaePf/6rvbTn6UBAUOWh/r02UIkew5sbjgUvsDE+IjSvPS8pLnV5YltNJ4lt/u+YFrrRxXPxp50xiLzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018256; c=relaxed/simple;
	bh=R7e8sBeHKiF4O4mbOmtYo6FhJ/lbF58edsaRTia8At4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZPt/rYL83l2EQreNUN0+EtfH8KvpEle2Pmcgt4GEO52H8ZLD6wcrUqPV3JEWmKbAOvpo82sCn/Be/dfyVw58I88p+w1BTagdN+Wr8kVCKXLYp/B8oL4jY/mH/JpRZ6bvm7DXG4R+UbZ/e6f0oZr5SqNyqN/Lr2rjksLpB0yz4oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SDjYmIRF; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2kSS3iEBuTv9UEVxsW9TIsW0PAMW/X3Z0NZDv4BkYbAWWsdhcj44ERxIWZkePDE9UeLl5gIVnzKH8EtAXtip6CCAJFZbi2rFl0UqrqKEUfVDR1kcY8sJ/QjuCLQ/6NA2ODFcTFQQPajwEwzoEp8eOziNfipHvjK2e+bbtcsZQfLnCWKgTUFIwDSS0cJcyvI+W7jY3fM/5VuH6Nk35pScGzQcAOe5eH4KmCRfLAOdRiASJKDbg1MQYR+ddA6qiJxahqfrQG3nBj6L52eKXXb6hwsv50Loz1eYq24VyMJuq+9GGwiG7T5et9hfzL3tY43664bmskx1H+EvSKWCPgRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15/v3wlFz+7cQaYOHIKZDPeGhO6EtfNUagjuSLzJYj4=;
 b=paVL3P8uAtFppAKw9UJHt1DWiGfCpnFmJK4qmVMsOgXiLY0oaqnZgO5t+TsgX2FKe3wE9hxD05qDHl19Vg6ymE36ROW5Sl8x/SvajcyuTpaNnipJXasm4930qV6UTyyL1Ak+xZuDcBvnPE5DtChjKXwK2fRlsBxfsokNtq21RaGLqInPfeI/NWoQb2z+boC3VakUhhaminIBZ5il1A+2w3ldg3zTD+wpoK87siZ0rOpkSxQpPnRnbWmFYxBdqTSiuw2lmHw4kaIlZmBFRHs+LPvoOpVkDCFP3jTRb7mvhRRp8oegCr7hts5WisiE7n5PeVi2kHnOlgBwmBne8GT8Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15/v3wlFz+7cQaYOHIKZDPeGhO6EtfNUagjuSLzJYj4=;
 b=SDjYmIRF62u2JHBQFFKxPpS0RTOkMzSBo9n4zwADkReURcFQj/BTml8nGfz39Q7ec0FaCIzsIVyt0CvGftypUlCK/6kbAxxASodYYkKjJxGdJvTOC2FcqR3z1c+6oUSqEsci51GoAHddap1OeUq+wFofDRek7WWycsHb4gEipbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:10:51 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:10:51 +0000
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
Subject: [PATCH v4 12/17] media: rzg2l-cru: Pass resolution limits via OF data
Date: Mon,  3 Mar 2025 17:07:52 +0100
Message-ID: <20250303160834.3493507-13-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 044886d8-51b0-4ec1-91ed-08dd5a6df810
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ytz5i+hnZh/0lkUvmoL4nnc7/n21cQPdcynHvZ3ThYVs8uJL1x+QZdy4YioJ?=
 =?us-ascii?Q?CX1U1iomLgphSoeW8l+/kOzvi6iV0BS3HWsK5X46edZjCVqONi+dj8YZWukl?=
 =?us-ascii?Q?MjtCtghuoVKL/KiE+6zm3eppK4qKoo+Gc3uldpX4drOEalGmxZFmdXeg0QAe?=
 =?us-ascii?Q?KpEwLMjEcj47HGwKZnXJ3vV2RxM5IqDdv4yHeOJFjpTRPrEYEKyLruew/RoL?=
 =?us-ascii?Q?uBwdhisYMLGtvBM9DIzcRC2IxGWKowXg7f01ocmMr3n8xV706rnuxgIkXTtF?=
 =?us-ascii?Q?EgF/1hkgW9gshRbusd8yTmzE6xOaa3KCUWaG5sEMK2a/9ZX4xsxShIiCGu6m?=
 =?us-ascii?Q?yp20JNq8KUTKkt11lYMm+zJVpmK0nuqF0QJGSX4/Ye8M37sHZWevIXbBsR3T?=
 =?us-ascii?Q?Bo0teoYAole9lVrlgIoUeaHRDjHoiPTeuUvZVQGVF8cMs7UmmV5uga1A/IxJ?=
 =?us-ascii?Q?kGexD4gbsCEmkFvjpWB+ETcqpGTPmE7RAimbTURG+Kthsw7FettXQ61sgXTj?=
 =?us-ascii?Q?wWUwt3qGcaWdN8OsEaHQhJyAYGJ5xKsNnHVGMooV47LO1jSzm2P3ummgIt+l?=
 =?us-ascii?Q?jJai91x6H5NqB/xkOJdcEzjsbN0lXNuh1xBfE8QYEmm8N93yKOx7DIJDi3xW?=
 =?us-ascii?Q?o81ujx2h2L5dFddBub0Np/wEsISSM4BuQlEWrmbp1GR05bKHm8ONIPPvF54E?=
 =?us-ascii?Q?LJ4slSqZaN+1aVameTb66alnFuMdg2zYy7A3QyBcYZDT2yUCT7yb/de9Mb74?=
 =?us-ascii?Q?bijGaqWTpQkbyz5gjOvjwFAyP0j+UWciT+YNyFtw+p39W3QeyO85dF5905nu?=
 =?us-ascii?Q?FqBjFnLw/V9uNSF+f/TmiasdIlJkKEWibvZaaa1ARFCg/ei845+nT2Q2v1WD?=
 =?us-ascii?Q?+H9816zXqRuB0l688bIzx18yXIg1+9mxJo1ghMjUn1SC3ODlnS2MiM+uizx+?=
 =?us-ascii?Q?woa0l+HEoMwmnGKchmISbaJiF7W8FJbih+z+z+OSP/cAeuQ2uu1wSA2Y649Y?=
 =?us-ascii?Q?KXxXLIngVadEZSFXgudpzssOPHhrKlRi7p8SmMw8Ru+bqBZSc93lwDJ3nvPf?=
 =?us-ascii?Q?tke8tvm5joJoEZnyAmxd1seRoyW0g0lN0BZSXCfjBT5c1blFT1UVLzXwrFDv?=
 =?us-ascii?Q?bAqBkkw8L+yaTV4hIVB42yMdz5CohgyD3l/5XMWVxUXUZje4Endb6A11I87D?=
 =?us-ascii?Q?/h+g0qycaWa/jj2jhjjZZK+WIRMdES2F8mbZugn7LWU6oRb9LNbixQXruABT?=
 =?us-ascii?Q?gM/oKXf1U/BMxXbBZUJfDwt0nnm5fJrtGr1q97y7t2LRgo2UVFlmsKMKQ17l?=
 =?us-ascii?Q?I4H26yy6Y4iCrbNsa/cb7dQlsBSPcyD6JK7e/dr5vRrpImjDOV20TMEwgK/y?=
 =?us-ascii?Q?kPo4vAb2bOJH7tf7y4AjU8+PSz4klfPzjFs61TCpvDXY0nQUkVzY+re6H+Mk?=
 =?us-ascii?Q?Wm5DnByuUtvR4uARZ0dUMv6Q00GNOote?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BNGMFkXwU3WONTr3KQh2t6Zo3kHTkKJtzbRAd6snOyMKzcgM0+6wQDqcxQo3?=
 =?us-ascii?Q?MVue7F7QgwtBIJ+R25l75rWrbZZpaaj/nbUX9K8GERyVG3LERnuHqOMHD9HK?=
 =?us-ascii?Q?7yZ7D6V06nUTJfQaCOK6UmdrR6HFzzRVdezXheonPjkrulAhUcK8su1B8GCL?=
 =?us-ascii?Q?+hQVCJjSkwtHK2W5JYlLHJM3Te3wprRs7U+2NIEnvCooxCxHB9fLD9O3jOD5?=
 =?us-ascii?Q?svRurXsdQJ/o2N2Qp75xV5aHzHIrBfPd2jYEbpkCpPfvWPptbFQZgiSCxq3X?=
 =?us-ascii?Q?eJ6wAmLZuCmICFkJx0QAKZuAfvNnvt+BVwjkZioVT580g0xru1UNLmJkJnmK?=
 =?us-ascii?Q?whlxHdMhmE8noCU1bEXCkpZpKG3eYtQlW3FXtf1sGWkTmrRKGk3O7EVCQEpg?=
 =?us-ascii?Q?Q/cVFFA16CsJIuvz4W6L/IPHQOR0tg025ErzhrqJi3Vyo+MdQmPamnZETnbc?=
 =?us-ascii?Q?5juSNGC4t4VjuYHqHEV1W6NjidQhNBKAPxOXx817AknBLFESx9NKmGsDsAse?=
 =?us-ascii?Q?aGY0fvK+lD5F5+Rc7bNs3psBM2S+Na9ndDYCSaBwjqqOPt7qysNuV57CZ/iP?=
 =?us-ascii?Q?phHMX897rHgt5Ux8noqKM82XLHgQc+VKlsdBJBgQCvcTG1AQt3QkBrnsNm0w?=
 =?us-ascii?Q?H3jSMa6HHLs7nnIWs4I58qj5xOFH7Zo6q4qb1LWDmME+F40DFYYVZhZO4Pmv?=
 =?us-ascii?Q?lxTv7MRBLVcrzDQ5Eo6KcHf73teOa5shwVr5Mr8l3Hrc0LgMdBB0ASMonfrO?=
 =?us-ascii?Q?VukX00iSH/yQLlVVuRd+DL2VjnbdBicqnHie8WkB/UdvAuqY2XSkGAY9510E?=
 =?us-ascii?Q?nfHh5ffKU6tmN4T1WLslDmmXsza+031vDJhxrJNzqABnm3aI20+qI7Ezo79a?=
 =?us-ascii?Q?XZXo4AWOtrkbOgPYiK44IuOR19qKPPlkHonG/08uHL0xMZ5eSCH4s+QRAsZQ?=
 =?us-ascii?Q?S0bw+4566jy68AY2kw8BRrEFtZtX7Z+us0J66GWsFK1CHe4XHhu75R1U7wdz?=
 =?us-ascii?Q?5EK3uuDhS/ZT3SvvMN/l9mXuV7A6kN6DYSJpPecY4u9MsrKUNR9Z0u8JK5Us?=
 =?us-ascii?Q?pb8XskVPVUbTM6vzFNSzK2zIqhY0Oo02uQ3SebdS0uLVgnq9ksUMhjR/fc/9?=
 =?us-ascii?Q?7lKvJFgWUyf5PtGHQDKU2wTTDcphs4mGpyjafARuomL/TlAytQ3avKgDPslZ?=
 =?us-ascii?Q?BJlzDYtQp8fHFbQaAlqc8MyIVceDydRrAdzRt3EvZEnMO9IfN8BIhhgKnwlp?=
 =?us-ascii?Q?I/Ew2ahDvPMD5zRtYldr7yit2O/n/1q6EYQxSmZM0hDLfuyLYcNO4wOMM/8G?=
 =?us-ascii?Q?IFuSezkD1rHl+8YMMEsjVBintN/FyZefCRXn/lw1AEw8ZenW0JGODjAQ4dON?=
 =?us-ascii?Q?26ztig6QwFIAe1OdsO6vxh+bv857Udex1WZKmlpA4Iu2lRmAYxeGL5kpNApS?=
 =?us-ascii?Q?jCjF2QHauzVILPJDZooxxbYzxFFnkPCi+ighqyiGkD+HGbVGB2AJnZRtuzGv?=
 =?us-ascii?Q?EYw5nA5nBPoKOy3WZcL/396jBlyYfUt9ojLG5nlVAtDLfVAVrQ/zsPl0ixp7?=
 =?us-ascii?Q?cZa8lLuysobQB2qKYA/A7LfTXucj5M5YQBqfleo7QB0FiuD7+6eehE2d8pl4?=
 =?us-ascii?Q?Xy3yMJmPt8mlGThN+x/NDNg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 044886d8-51b0-4ec1-91ed-08dd5a6df810
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:10:51.7262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JCb/mu19AJeXgPZ4m8g9EfnRISb6Dc/er66FWbSl3+G5WF1k0Dvy+/d20nQfbkbHDrp0U/P8/0qm6jC5GLsvBuCk1dw9xDKVAeFQtbi+1IoEzbBNM3FrnzcBtmYooZP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Pass `max_width` and `max_height` as part of the OF data to facilitate the
addition of support for RZ/G3E and RZ/V2H(P) SoCs. These SoCs have a
maximum resolution of 4096x4096 as compared to 2800x4095 on RZ/G2L SoC.
This change prepares the driver for easier integration of these SoCs by
defining the resolution limits in the `rzg2l_cru_info` structure.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Collected tag.

 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 ++
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++--
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 13 +++++++++----
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c  |  5 +++--
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index abc2a979833a..19f93b7fe6fb 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -355,6 +355,8 @@ static const u16 rzg2l_cru_regs[] = {
 };
 
 static const struct rzg2l_cru_info rzgl2_cru_info = {
+	.max_width = 2800,
+	.max_height = 4095,
 	.regs = rzg2l_cru_regs,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 00c3f7458e20..6a621073948a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -27,9 +27,7 @@
 #define RZG2L_CRU_CSI2_VCHANNEL		4
 
 #define RZG2L_CRU_MIN_INPUT_WIDTH	320
-#define RZG2L_CRU_MAX_INPUT_WIDTH	2800
 #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
-#define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
 
 enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SINK = 0,
@@ -81,6 +79,8 @@ struct rzg2l_cru_ip_format {
 };
 
 struct rzg2l_cru_info {
+	unsigned int max_width;
+	unsigned int max_height;
 	const u16 *regs;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 76a2b451f1da..7836c7cd53dc 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -148,6 +148,8 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *fmt)
 {
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	const struct rzg2l_cru_info *info = cru->info;
 	struct v4l2_mbus_framefmt *src_format;
 	struct v4l2_mbus_framefmt *sink_format;
 
@@ -170,9 +172,9 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 	sink_format->ycbcr_enc = fmt->format.ycbcr_enc;
 	sink_format->quantization = fmt->format.quantization;
 	sink_format->width = clamp_t(u32, fmt->format.width,
-				     RZG2L_CRU_MIN_INPUT_WIDTH, RZG2L_CRU_MAX_INPUT_WIDTH);
+				     RZG2L_CRU_MIN_INPUT_WIDTH, info->max_width);
 	sink_format->height = clamp_t(u32, fmt->format.height,
-				      RZG2L_CRU_MIN_INPUT_HEIGHT, RZG2L_CRU_MAX_INPUT_HEIGHT);
+				      RZG2L_CRU_MIN_INPUT_HEIGHT, info->max_height);
 
 	fmt->format = *sink_format;
 
@@ -197,6 +199,9 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 					struct v4l2_subdev_state *state,
 					struct v4l2_subdev_frame_size_enum *fse)
 {
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	const struct rzg2l_cru_info *info = cru->info;
+
 	if (fse->index != 0)
 		return -EINVAL;
 
@@ -205,8 +210,8 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 
 	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
 	fse->min_height = RZG2L_CRU_MIN_INPUT_HEIGHT;
-	fse->max_width = RZG2L_CRU_MAX_INPUT_WIDTH;
-	fse->max_height = RZG2L_CRU_MAX_INPUT_HEIGHT;
+	fse->max_width = info->max_width;
+	fse->max_height = info->max_height;
 
 	return 0;
 }
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 792f0df51a4b..93a105dec8f1 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -736,6 +736,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
 static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 				   struct v4l2_pix_format *pix)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	const struct rzg2l_cru_ip_format *fmt;
 
 	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
@@ -758,8 +759,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	}
 
 	/* Limit to CRU capabilities */
-	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH, 1,
-			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
+	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
+			      &pix->height, 240, info->max_height, 2, 0);
 
 	pix->bytesperline = pix->width * fmt->bpp;
 	pix->sizeimage = pix->bytesperline * pix->height;
-- 
2.43.0


