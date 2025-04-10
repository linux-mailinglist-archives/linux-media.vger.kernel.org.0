Return-Path: <linux-media+bounces-29888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEA9A83C64
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8D331B672EE
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E514213E81;
	Thu, 10 Apr 2025 08:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UR5ks1WC"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD47205515;
	Thu, 10 Apr 2025 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272895; cv=fail; b=CWzCYx9qSSBAKEy8pmAP12eZtKPze+hy/hGCXtRmbE0LqW3g0qplkR1obVJ2g2z3/gZsdLeltwYNAPD//BbIY6xuAXSzm4XkKDT4/pyHIVJ/XfM8r6zosvyeR36QSTmXk+gthM5rt7nRoASgayDWYvcoJBnwE8rQLG7qyKYSCzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272895; c=relaxed/simple;
	bh=FEW971mqYDckTlqliO9ZrZLh4MZpDT0SU4fDmE1lJlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fFcb/mbElN6zXYpifLS5//kswHntYJ1JSriPn9GshNfGslpkE4FG4Eb4MvzVE6aqjSkdDA7MxKGa5G9t+aARSs89DVMNd30DwadIL1qtNnZwuCLzGMfFgFOQaIsbpRC2BDtpvLjLeCJ11pnXbebDxxXf81NkfDW2cYoZXnpInNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UR5ks1WC; arc=fail smtp.client-ip=52.101.228.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0TC39uxlfv3qasdKRDMerxQIeBBOmns11B6i8IgdWYBOxN1z29rhm+WRIH73n6RRYMCqrpwRoYXs6sLewv5zHKUPsj/UuF9DddrhAuJ60gg0O03NY79VNoOEhgHBxdb6k83slblkue5UD0jAkr6lfqliIn+g2D5roq8b4LHejOBsDoe8v45V6PD8tT7JQWPM5Q1W5zDNpZ4IdnERWWQ/w9qyCMBCWKzBbtvnMGhiHgc7gDdp/PCe3Q9cEBxIKrUHxv5vOY7E4YeF2cSuBaeQ6tRqcGNNlSo4Bxn2KBX9XltwP8N1VO0zefcfNknIHvSJ8MN0dlmjTICc01qP0CKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPCAyGIaCpVn+CBKxCEdizeov7zcOBsaTTXln0USCBA=;
 b=bvFikW5S55/7OyXuNKR6pVVuocV8kkvh2Ad5VAII9DCcFXR+K1l4nyBq91HJpU5MC0ZQXLMqGtPJxM9ZKnvp482GaTr4LoiEYaGSuKwIzRCcCltusCUh7prmVcuDnFaRAhk2qwySrGl5Iui3K6zrQpNvUINGw1y0jNYhN52PDUI0EdLhKWhcJhLxOyqzELGJ6zCe0zVrF/wG/RH1ifcbK8pxwvqaQKYRn7SosHuGdk8Y54Hjq+xf7LYeJwcs4EhMkX6wRLRrILHBDilkanFOJv6do0TCdtVV5/WKNkkjaL1wtteZatdS9ubC+yzmewrcNI08cyyJzaofxUFEZhiykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPCAyGIaCpVn+CBKxCEdizeov7zcOBsaTTXln0USCBA=;
 b=UR5ks1WCxFKz5pNVohGa+7KPclpfe2qmgWDX+u5eD6vd3OGvuV3CrNOsOKC+bR1DILuNE6rnwAWwxlFLu05DQrQv2av96Y5lDEu8jLc5Aq7zlFEdE1Q1woFrmVBvksvl8FwNRtQtNrn7i/RJeiQtg8RenA9sMcUPl/LPTEclg3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB5660.jpnprd01.prod.outlook.com (2603:1096:404:8059::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:14:46 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:14:46 +0000
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
Subject: [PATCH v6 10/17] media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
Date: Thu, 10 Apr 2025 10:12:14 +0200
Message-ID: <20250410081300.3133959-11-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYAPR01MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9a8878-9f43-417c-c52a-08dd7807c160
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?waEGesA79vF3GboWnbO31fIVCcDFH8lI93MagvTZ6udtUwOzWZC93UwhJLWC?=
 =?us-ascii?Q?vfAM8L3IluwCqWJqM26v46wh/mqSXMhSESq7ZbKpjMdCy9nb/EsO7KvUBuDy?=
 =?us-ascii?Q?k4kJfbz+tmFF1g7TBgPXuePgXPYHDCy9f7hxoZs44eSvs4MftcjFDaXxCkzn?=
 =?us-ascii?Q?sGY7IjWqqRDwtQ0OaLWOpdkoouMA+nQuPqCeaIHGav1g+MXJ9sHtGEjVty//?=
 =?us-ascii?Q?QdB004o3NZoVijXbXzUXMedQFDHtu9l4oQe9WZEtL2ZNwFZ2llLQYRolk2t+?=
 =?us-ascii?Q?gx/jiRDfDd38Tab8TVu2EnSXjK2uPnW3C4J2NdeetaR/JJlRLnw1pQIBfkfw?=
 =?us-ascii?Q?WXgtdThPlXcJ/8Lq9S7ec10Za3gql/QbKBSGnJZRqTLWbM0RmjXq6Sxum/NP?=
 =?us-ascii?Q?2j4MyWpHeH7ZzgkfALRsDPdHrK2TRQDYaoZlrONcRZ7P8ki9smHrQ2u0qiVl?=
 =?us-ascii?Q?coZfxXRSrv4jKQGjGOazzE00E0N9bZQaOe7UiS6IfwWEMQK9lLdGQoQ6CMSE?=
 =?us-ascii?Q?XF0S8AwSbasaHwIJGY6dNlnfMQ6US1vxf1p8Sbb44NJZGioVAvFvZDD5cv6I?=
 =?us-ascii?Q?6AQ+ZVsNvWyOWv1FGyfCyofGHa660Mg2K85mAzQyxLlPFGJzo7D3M0ttgh1t?=
 =?us-ascii?Q?1EXT708eUDaZuZmNb6ZKSMmLBTIzzvOu9OxxuceQt+302f4d50ZaMgSBgpxI?=
 =?us-ascii?Q?3nOR1y0fNicYfSYO5c06pnwbKOknuTIZWBAH/aXm6YNalqicSIndfimDLv/K?=
 =?us-ascii?Q?PUzriPdoYo/p98q87itkY/6+FoiGcL1q58Pt/id7EfwUNBMuz7yiTz+ixe3I?=
 =?us-ascii?Q?bjzZfknoHnD++HHE9PSG7Nki+9y5i9+JkIDqgNInk/RI+6rPD/6UbocsvUKa?=
 =?us-ascii?Q?yISYcEJ5/gKZCzwktfBOIlvSzNWIMiadTl5ArqjIqzA65FS6yxoNurRfpRP8?=
 =?us-ascii?Q?sCHQgyF7C87v4xz2bIiQEMHkdGuU7rzAMwhIuwSu+M4Jcog4Mzg/gw2d8DvX?=
 =?us-ascii?Q?9wgPVtydgcySlQrC4YlladO4S4xjsqLfvGnIxK5Oa/K6G9FinN+eIUrhd1EF?=
 =?us-ascii?Q?B6Mfa2fKc1OO33XjSpalTzHhWJBOWaRkG3OBM+KcxzjWtO7ZxehzP0KG65t5?=
 =?us-ascii?Q?+aN0xIKucBtyrIEsQLvESxdYinh/dfeLCoxq4WPvNkjFAv81aS1THWPEUL08?=
 =?us-ascii?Q?eBEuMLTWoxy3yxvDWncvWHoqpog+XWyIdg/nIMkDW+Z2L/o6zkIc26IVKh/y?=
 =?us-ascii?Q?sMxUSTY+kalc9lvM3Vd5jGCdTcYIYM3PuxUPrZYebo7EQV5dBnECu15BEQMw?=
 =?us-ascii?Q?3w3Gu8O+p9a83csYijO/Uki1nuzHnMBgf1vmbw0G+UP+Vtjan8wkOL9pfb7u?=
 =?us-ascii?Q?ASzOlfjCdxkL5sLaLhSsT+1vOqw5EGoxLwiDjIHIDXQ2RxqlNWRC7sAOjsT7?=
 =?us-ascii?Q?RawveBVzJiyFWCren2Lw4d6U28UJhOymAijG7/iFVYRkQVlDfpbBIg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZbxeUigMYc0ouj2szTBaxP+Y+CEnN5w/ozH6JMfmLzh2QV7nXKVEXKJ6G29l?=
 =?us-ascii?Q?YqXw8V5/Q6Ul37tWhzlOQftZ7x3h1hUoK0GbP1YLHnNc/La2aY6i8HDLA0wB?=
 =?us-ascii?Q?rnbMdCfKNp1ySFS1LSi8mRC0+Xvn4HQ+35DwvgrlNQ9JW3IMSAjaABxsXgAq?=
 =?us-ascii?Q?6jBNVvmBrVrpP3KMkwpS28Nt0EewEFep8qp6Is4RflpoErvMkT/6y7aNGbUS?=
 =?us-ascii?Q?1M2pgByXmUxAJLPlw0a2PolSisZO2Uod3NTDriAIg1D+yIjkF/9BzqPpemSE?=
 =?us-ascii?Q?u6+OXekvonbeECc9wBSbDNgi9TrrwkVzAy0KhKS9pMnRCsiUyjKNx0unxvMX?=
 =?us-ascii?Q?CMzjJHwrh7n7q7+d6j0id/TQDcG5xurqXs4YSpPzQyK3Fluw8aBxQtlcIntO?=
 =?us-ascii?Q?eROFqfwWT5HSoDycjbGOr2VDY4Xhn2UPASIFTVfQm35MD7wd7q0MtvucO9xr?=
 =?us-ascii?Q?PWmWbWitNBgZdqAW3OeqXva0zBvWN8HNI9NDrqXO0ehHjqQIGJkPnBWpDSEL?=
 =?us-ascii?Q?ayg5n1i56iRfrjUqpkKwOTN6CudE048C2YzaUuO/VLWaOwYV86ST0ezrhpUu?=
 =?us-ascii?Q?4vissineKPbcPJtwCLUPVT8HG8EqUpHbT+dJtplrW40wS1z7OgONgE4B8a48?=
 =?us-ascii?Q?9zmp94o3TqvL+9hhmBtxxl1/Rsz1M21CO+HY32cS/2v5VQNgiEKOGKD/Ta45?=
 =?us-ascii?Q?dF/iheXRRmGLJT1RyjVtwbhzufaRf0Phc166ea18iGhFWfgkkvmhMWeUuYx6?=
 =?us-ascii?Q?R1OS2ZyH3OHi5xQNlUBeWDvuyCDQuPW3rEoLB5zlrK9dq9h90sXIQt4ghI/C?=
 =?us-ascii?Q?L0npKAMdVefa04415y4LR7AUke8CwXDHHM/ecYYMcVbD9gNChOWYofzTZhMf?=
 =?us-ascii?Q?mzrPUf//+PCYPUfa99n3zu3UlDB/NnuVwHR+f5zw+koYVu9tBfb2/8+40Fr3?=
 =?us-ascii?Q?qJ8TvM/kReR7K5Z53Yuo+GBOhTkTFG68AfWCPt3qFOteqQlfem1RbdLeRB9z?=
 =?us-ascii?Q?qHuB5f1PTSAET2Rv9bpIUJfNjVWbXNKIAyh/o7A2QIKQZyCVlSJe1siXgrDA?=
 =?us-ascii?Q?YnpxDgAXAfOppNFWdUZQZu+naaJLnLgtT0ZuLFj2eMRDlhz9Rr6UmO2MBM2Q?=
 =?us-ascii?Q?KcSGRryOTsMHO1acBU/M0D4gsXoto7zgxRD5VkNAm6mLZL/i3pHgQg0aU5OD?=
 =?us-ascii?Q?LD3yCMKMyh36EM+xsBSpHQLXxLhrSu2JhorLhDBnPkV0Yrn1LIkaglxT+jeV?=
 =?us-ascii?Q?LGaPiJ+uZh7Obq8hQUT6Y5QtkLFuLHyA58Eau/lHy4yvn5Jvpqm9uDTN7tZ8?=
 =?us-ascii?Q?wcmIVzVFA4TaCrLd5G6272Ut/I4MLdyiAeimT1LDsmE6A7POSIQo5g1jegU/?=
 =?us-ascii?Q?Zo/q0oTUU37pfmrbTFzrex9AZw0zSIHc7Wvad6O4yOjHCuH5u/s8xdPf6CXQ?=
 =?us-ascii?Q?j31zCC8ziStE7J62Eb7A5XF6LA5NUysOgtUur8H3nD7GxDzc1GuIi8Cpf7rW?=
 =?us-ascii?Q?8OvlJuSeDSsGb5/MURd3umE8+sjqIb+XMt+WHNREtRKs9crfwI3IiklQ5ucc?=
 =?us-ascii?Q?0wiM6QiWY709MYkwa/oHfQnasHybxw2uKz9vFg99eBUYpLaP8LugKL6Cr5wS?=
 =?us-ascii?Q?AQNaG/miCXjEWQFd2XK9WCg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9a8878-9f43-417c-c52a-08dd7807c160
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:14:46.2786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMGfh04YlYTLOZ/QWCREqPFAFwQTDSBGoKzQlktSCzFPxm4QgeUa/bmsTK/WaXo6D+Rq3Usx9iJG7IMTvNkZuUYWH2C41l/1sn2iDpf4NQcCBDs7fOH9yeGys0hamIIS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660

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


