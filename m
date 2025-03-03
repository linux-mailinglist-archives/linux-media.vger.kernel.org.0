Return-Path: <linux-media+bounces-27391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE5AA4C696
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28FC43A1588
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAFF23F422;
	Mon,  3 Mar 2025 16:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="P+Cp42GZ"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B021B9DC;
	Mon,  3 Mar 2025 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018233; cv=fail; b=iPUltu6va5/i+vjjqgO/oWK7ek+BBZLpzoWWBFSiBBrjXS8kaonziVqs6ZpwZ5bTLv+IRL2TtN0V21gNy+cqcc1XEI77HB9CKHBedvn4XJTPmigBU+DANuYM1N530t+pYi9skKNaLkgrQLly7xMmXzryopDqc5ACEkrcupLRLZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018233; c=relaxed/simple;
	bh=s0LbwMd+yNOrDuaI69BkfWNoj6IZMmF36hfugARTaZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UmvN3md6eVbthR1IQpDEm+DgHbNA3LJ8iEvHblDqIGo1P0/XA/1HWAr6YJKa0UdtplBDTCHxGurePdRKJQuVZP44U7fn6HzEAtWZ1+PC3Z4yj40kIUjSTZtWi3dHdIEWDY94nubQ+rwRdlfFq1rBkdWnTzTekUQp/+agwIIC3gA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=P+Cp42GZ; arc=fail smtp.client-ip=52.101.125.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzZg3Dp4yHVC+hEeK8ImtANeVvU49Q6q0vXUZDjcAi6Lc10cMhJxzMVgqwRNujffjm4gdilG2rxQrwa1UdasK10OcYellbICO2lIS7FM32DLLwQyw/hZGZK6ZD+FzqbCm7+O0vOjYyK7d0cdW5RRmP8i8a8KssxzRSaB7csVyvQgL5jcn/vR9ccthotHt0rzONpzzuQ2mlPxoBxM26E9GGD67zVw8DyWeZI7ywfYyTeAKn9gfEQ/MNjUYbndsmVR4CNQB3nGUTFVpWItaHzXRUMCKl5w0ANBtWjheeB5ldEj/8XlgrGPMasdCLqsk8qkOsg6JXND8D3761g+59LH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlfJa5bXaEV/JpIyOlesXVZosJEKUGMLaFI88fiQ4fw=;
 b=C8ShLEOyMMGtnFJnfymCHdrb1vsutjzP8ud+uRxzKC1JWkzRq0n2nDTsSrKqFCZKVt2/lvv7oOa7PqCa3tNrk48AMc+aP2LbMVzdcdwRvdmi/4NQIqM0OZlThhbKYmogsxB0Q8ahhXYnnoLlOHrMqSGMFItV/N0LT6+TCWcHUnf44V8jF/V4PskOaMg5UUeIFHKx9cavS7U+S4oJLzXxdFmOfjRnbieniIQMkKbxuOP03NvqbngBPlx4fsfvT9K2jXMo5m2GDVm3vIxhgg5gNZeDBHZqG5hCtjg6XTnNhp3n5wAkLcLDxTrgXj22bGMRowlHo65o/4HRl/5hefklCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlfJa5bXaEV/JpIyOlesXVZosJEKUGMLaFI88fiQ4fw=;
 b=P+Cp42GZycdDMkNhSK2EIx1RiYxXvWnBiSB3wWz/IcZDTbUC+uKnh8+anB3xVyPQXCGh1P7UOsOixtE74pU2mgKDThV1N9LO4yEAT0ZUAiqehpif7y78sT1lW7ae6egjayQnoHjy1yVVhbBIVQPhkMo21mhMz0LM9BP1S0pyk0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:10:28 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:10:28 +0000
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
Subject: [PATCH v4 10/17] media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
Date: Mon,  3 Mar 2025 17:07:50 +0100
Message-ID: <20250303160834.3493507-11-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5f720633-ac83-4a8b-2650-08dd5a6dea42
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fypGHEKH01EXsgGnpKmcd1FIscuOw5szyWYOl3o81VZGFf7GC9/EVDDnLDm9?=
 =?us-ascii?Q?+zGNRGPi3vnOTUSdwm3oywr4SZdXC+kc1Vfh72y1dNntv7DQOeaSBoeBnxJs?=
 =?us-ascii?Q?VzGaHUHFi2580/Kw+6WqZGlFTHAyC7XYeWCe3s56lzzyHhMtf4tqaHzpJUAn?=
 =?us-ascii?Q?YnMd9ByW4ZNpZ1NVGDg1aQehhQ7FVjmljviNb5rRDAwwKfCfJDl9OrBfoM/t?=
 =?us-ascii?Q?c+FerDzhphCLzbsW5yighQrYBqp4AsV7ioO1uN62KRq0ZYf4y5M6B7Fgm7nz?=
 =?us-ascii?Q?IEAdCxWx4z8pmjhSZU2ym/pj1c1cSFlPnBV71M5SSMecYOUU0Uc0EdoO0ekG?=
 =?us-ascii?Q?z3bARywUPQD7S86ERp3s166fd+gcagX/uTpFsVHNVTkOZkXkXR8Fni9Vq7wN?=
 =?us-ascii?Q?tFGz3XUA2YCKJgcc5hH0KdKTSvXFRKLRFBxhg52/IrJCzHT1Jr5uEowGcQx1?=
 =?us-ascii?Q?IB6XnP1llQpW+cIMytjaA1mVTr+jQOCJge9SRIUf1pyfjfzJYiRVeujUUMuA?=
 =?us-ascii?Q?07JoaCM+o/ddiDtN9MqmQsOwHYAT+5lLLCbCF+6I2HnF6NqTonhvXsqueYyh?=
 =?us-ascii?Q?sEW2O/dOQrjOttzmVDGdClXZH9dIeq+qFSbALoQKYqzHWs7GomArGLpsSgAz?=
 =?us-ascii?Q?XSnk28NI8bTXQ/lQQR/GYlMdDVmgyfV12qb6gD3RRjw4A/JlDSQoLnavT6Kl?=
 =?us-ascii?Q?pkgxm/sETxFFQ8cFRgK6LPAecGtk+IkKJJcqWBgJqMqKx4o+iI8H6tYpJmZZ?=
 =?us-ascii?Q?AjvpQSYqXbyDiwvmQ2r9ajLr08tRwzx8dhX2T9tKLyuu7uhI6Krj1xe7ecH+?=
 =?us-ascii?Q?68b6Iv8KeEjQVO826t6tNNXoBpViqYSGml2vQtITYuglVRpr7KBgmsegrewl?=
 =?us-ascii?Q?4DJY+UnLI8+wd03uhz+TXNzUsl21R4oBwqU0995FI3enHYuSgIl90k4QZUW/?=
 =?us-ascii?Q?oFD45MPlwTf0VhrG46cjn5i1KG87f/8mteQsBTktudDDnxvyOMd+5ogvcqIw?=
 =?us-ascii?Q?jXmFVrL6ruXUEu3GU1q+ahDk5n+U5DY2HD9/MR1uWYt6fDX7BeNHT2WmmaSM?=
 =?us-ascii?Q?/RmPqErdQeAhS8gkQk9+a/O/RAl2Cs5h03slF8Fx7/XKJLu7b/KDq5Imue7F?=
 =?us-ascii?Q?nWazmuQdVIbydYaNzQQiNJcqUXe5p2atazdSQndKLyUR0HkPu5c1AP/e3lHc?=
 =?us-ascii?Q?rXShsPIIdSwkaflcoBMRq/pttJMBr77VjQhHaqbFYX5aWgESK4KtTn0DhlOr?=
 =?us-ascii?Q?1y8k5ds2n4PF2Y5mwA7QhUihfrvf1BuoNvrRCvn6eActnqqqpq4zTepUyvlD?=
 =?us-ascii?Q?OUSshc8/LO8qi4mw0IjWKaeb4DYqD22Xl+JGYzGWBtSyMxIwnW9NgAEG9Ihf?=
 =?us-ascii?Q?qf94GTw6un2uK6Ed09QyOZoCHiSpReQw6b61UdYEPK9DOtyQhbb4GCRIBD9O?=
 =?us-ascii?Q?1MFTKmzHkKOQxDY1kZc/1ILehU73XSGF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Sh9ngVPtmmrO2ISJGyajHDcMMQXGRj0dl6uiQCTBwVL3X7JDupEouQaEq9s?=
 =?us-ascii?Q?ZfuuSClYCNnd0VLQ/MxqECHkiW7iV3M9xhTSGRMSQTBtIV1fBshW0K9U2ZVL?=
 =?us-ascii?Q?NRFb33+WzMbrlW73fadFE8n2oH9lBOOdjQzQoC8paPIeG41aYkfopFFXBgdK?=
 =?us-ascii?Q?96pJmS+5/PCyQwAJN8Tm7WRLkxKniNsd1y6XlhB3Qb9dqF+pUbrehLoQ2jqw?=
 =?us-ascii?Q?9IQqghqBiTqpol6tgiV2fft5B6q6a8HGQ7HVKrUUi4gUwn7TOmg9Ki6EaEjY?=
 =?us-ascii?Q?nBlhk2YEWVTtjJgxEZjGiNtn7dvI/nAFr7Df7i36LEoAnn+4u+vPilUhV+l8?=
 =?us-ascii?Q?Mxaslnnvx6m028ow+kRPiMXF1jH1JKl7AtGZwA33cltd4uNbq3ZLtj2ijaMT?=
 =?us-ascii?Q?AvBdt2JQVZDZdJXv6jVZXtSJlownv9k75xGdMzFdc3gKahPMMLFgxmEHWvE9?=
 =?us-ascii?Q?uDlk4F+v22GNnWmAN8iwnJS/rt2JeVprRbeSureACisVlH6YgfUjWvwwlF4i?=
 =?us-ascii?Q?M6ZQB5cf5RoNO9PmOD4suK27icSBDTDqkp5qAyuuS+bOgDmDlnoCVbYbxqCL?=
 =?us-ascii?Q?pjSAzMTFEhrdRYPr3V24wCuysXZPJYPRBwun+CxHsTWHf5GI6yiHAsR6rYfX?=
 =?us-ascii?Q?UmB21i/FhROEkFtcZvQ0bVO+ZdEPSKXJagG4r4M83/G+2KLxlXOC60U4fc6z?=
 =?us-ascii?Q?l0QNfJOWwVBJv4llZ1CYE2WSU6C4pKMXulg1vEGGxPrExykZZVw5JJK4B1Ny?=
 =?us-ascii?Q?hkv8b6IsS0OHrHiWnds76PoiMrO2Bh2F8mJQsqRbPW3eARrlJcazk+i0o9Th?=
 =?us-ascii?Q?cBOR64SYkK8XIyQ2Sc17grO1yFUBXOhICeUcbJ0BJ5DnCqAVpcrUbfD2QSbN?=
 =?us-ascii?Q?rocZLcMmYJ7rJ2ju5OCS4ZfyZntN6V2OWZjkJXy5Z88JFsQDV07YCDfv17CN?=
 =?us-ascii?Q?h+UJbuOJ/I9WUMBQJDHoMl0ppT1sfwwKTsIGTOtHGIAL2/6p6aS04yW5TiLd?=
 =?us-ascii?Q?fKjh3MoJVUCsLOSLOCnG/e1dFwRfQNZhg+sFKdexKkqFiy3fkwjje0FMBRic?=
 =?us-ascii?Q?oiPAp4xah4Bz1HEwMEL5WsKnlCpMvE95riz6OcCFfbzsiTYbDtL5Funp5ck6?=
 =?us-ascii?Q?3oIrYprU9ZZDhyD+hRGNzpV43Eesl9t4MEvGRKZ8ks4Hbsm9EDViYqXV9yGb?=
 =?us-ascii?Q?llkhIst3r8FqgXDP5g7IA3Vkeh+vtPVL7Zt3nl6t2F1wMyghfwyo3NwY45vB?=
 =?us-ascii?Q?uHLc3LYNFmKBeW4syC9wFf9xvzOgaD7E4NUMq5R6Fpp+M558UBTXWr+OK+iq?=
 =?us-ascii?Q?en/WlygBYZb2nDvqEp/LbYOAPe88Ab6eDad9Epft8SyCuY+RSvL1Mhtam56R?=
 =?us-ascii?Q?slQGw+jBaxrYbRWrNS11w/huCZ1qvt1L11CBMiS31D+pU503ByeEhnVZ2V/Q?=
 =?us-ascii?Q?Ywv4PncGvFtlfS3U61cq/piXi7ekjIoizzLuYZyoNzHPorlru1DiHY9Rz9+9?=
 =?us-ascii?Q?1VJUg7Sp9wJXozLT6Lte12toBN1OYfbQNmw0+vrKcT2En6rbO3em/qbJANYo?=
 =?us-ascii?Q?bkkzklgLKoCJPyeq63vjEQT/Wjv/sA3frFhhDhkkSlOVpsgofCNsttU/ptkg?=
 =?us-ascii?Q?jcIcOx7xBh8bFQMwubrjGCw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f720633-ac83-4a8b-2650-08dd5a6dea42
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:10:28.8079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0cv1LXaaVY+IM3cg37/m9EMbtRLw8GAyPoPTSzUULb2k7qCOXRQI2BodApuhf31D8n3Eof87enFxIyk4X9hJyzODdqCkoMHExQRYhWmgXr3cj1QUUwFT7ug/yuESn1b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

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
index e4781105eadc..9243306e2aa9 100644
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


