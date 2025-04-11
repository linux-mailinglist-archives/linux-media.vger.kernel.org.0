Return-Path: <linux-media+bounces-30044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DADA86408
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A02C67B9D2F
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9594B2253EA;
	Fri, 11 Apr 2025 17:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="R0S7HXo1"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2042224B06;
	Fri, 11 Apr 2025 17:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391228; cv=fail; b=h+Dfx7U4LMttfggcEtD68kp5tXUpIc9DaKsloDOr952AObbS/ggXvub55yUcDDnLbhhMH9PcQ9nWAdSiKamrpl6GvnYb38/DtIhslbzemZrZfnH0Z++eXUZkwyYT2o/P4iWkD08uz2OrjG4mk3dWR8F+LV+YxmhGLpxy9tAHCUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391228; c=relaxed/simple;
	bh=WB0gky+PvyKTq9GLo3NZzCeLeTxen0u7m3GVboV+bxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s77bJ7AfE4YJn/hs6SPGwtu5DBn1pvWjxUiNxam2zfSCy1+FPrbC2au6H8vIx2zncL/OI/6+ynxcVDFaHKIppITAV6ZvuAHknYjro1XNuYRQJ5VAfFNnW0YnTr9oPS6rnt/n4FQcRNNKqiu4TvGr+2nmVtwNl4/uLzJWWeaQ0KI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R0S7HXo1; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lq1MOjX8ITbrr9WvnS00XCOCleyh6Gp2NzPy0TB5+LJTZkzhpxZAojHCWQNtTB2lWhvI3rQrP6pqnC/qJY9wMVYJdPL1NgKIqvLVkmf/UPjvfGGQrJVKhcDvo8KSATv8SFox1vL+zOGNwqEn3UG1HCJmhu9/CNkkYCWtinDcdRWjMiUElkrTBB75nbOhtjYqw6dHfTGe0LnJNBf9SRIhULITYxkzIT05y+lBnT5X7wtDSHV0nHKjnGaGwwf2nR1AAXr8ZNdyXTfuRIQHWJ75rxztGY+0HBnhUDVysJTzkt1tHHWaFreSguvLViyqgb513gmnVtnN6fgt2kRHWHZ+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aYkYpLNwH4DvxRbvPmdoz+LCX596HB0t9+usGAwlmI=;
 b=CB56WiFlRToJdRnLQ202hwJXC4N0PQkrqRRptF9LKMxkcqzVtOT2LUUfJMd5i7XPhsaS7mVS2m59IzhvEQ+YrkeRvgPJbxMFxLS/jqMdpVxQM51rX/N51+Bli7VVTAW5OJHWF+7jSbBHkCKEjh7MDuh/YmvDOF+j7pn05miVK5XVKhk/4ibX7xBoL2t09fYjZ+TdPJxp9EV5gxQjBHZnA8Ig7razEOZX/Tdly/DQFHJZyjIwnO21QNUXdQ97pEUfzV747Z8ZhYOrMV7askTr3aCxjywImovTX0q4sESffoiuU7B5Zb9hNnTQ4BiTMCJjXRKvErZpt24mLCsVe0SK8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aYkYpLNwH4DvxRbvPmdoz+LCX596HB0t9+usGAwlmI=;
 b=R0S7HXo146BaIeeAfH9bIul6gR2I9XU8oOcHUfZPEP+xaJzUOBU26ECugEn80VWsXXgK+y6NzB7gCqQwz1ijhRR5Z49Ikzb7EJd958fHoo7pQ4T25pwk1H+0avPYOTeutmW+ox+iicuOiHwHuFkJsuqRspNiNqNM3EtQV+/DBoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB7963.jpnprd01.prod.outlook.com (2603:1096:604:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 17:06:59 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:06:59 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 02/17] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2 block
Date: Fri, 11 Apr 2025 19:05:30 +0200
Message-ID: <20250411170624.472257-3-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 97ea8b37-6bf5-4cf9-a797-08dd791b456c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5nztiNKTq5jVxwNxBRA/N70ooD6FtIK7tihysY2za6u7dpI3rO7vKcszYD8u?=
 =?us-ascii?Q?sRNIqmUlUeDv4OQDugpry3S0dOk9Kkh96Y08Ur3qeXFTktItrIzwO+4mmn8y?=
 =?us-ascii?Q?ogqHIMHh6hecRq/FwbCPRCnB7nRAoyXqZUdGlNCPfWNNmVlgc5szaDTiPDc/?=
 =?us-ascii?Q?kD3ZUn+a4TwtjaJD0iX/e2dsi6DLkgMxHhgXwzER7oCgTgQNhBzGFzaK4tGc?=
 =?us-ascii?Q?hP2LFZKb9IsD1KzKOANvi34ZoBbDMuqjzVu8SqaBfsVEj3U0xswyg4aOW/ae?=
 =?us-ascii?Q?3bTaxb7iWVjCvAu5+Z1Fow2ZWpt6nvpzsH+BHPil/tflZzqlNvPlQEGSo1Sa?=
 =?us-ascii?Q?1+BizpJ9iHr3liLC79OSNO1/uUoDqBVkURJbIb1d+zP56f6yGM+47bXz3oaq?=
 =?us-ascii?Q?rvM/p1LjnS7MPKcTMkhjGdGyQh/U5wk9bPt0wKbDLidBU6ZaXqEmHQ5TXmPP?=
 =?us-ascii?Q?Gxchrk5NiqtUciKMLoFemEZTYzvrlH3LosTlyPHH1uKXatSK/bsl04myNFWY?=
 =?us-ascii?Q?nR8CRtpGFM17LI4Oef4BJUkhGKj4ODpnzvpZqsxSPMqNL+pTSVz1ZN46l5/s?=
 =?us-ascii?Q?1FAbAzBXm/raSR/dgX3jXX/Qu3EQc0L7pWzhHapmHArSJgnXcGEDdr/Q8Wbt?=
 =?us-ascii?Q?fs4ks4/qG6FJm4LSFiHk/mrtYwg+Xdl958CRy+8a0Jjlh91hVTZCaou/4V4H?=
 =?us-ascii?Q?BsWS5HyNCyP+eNpRQwB/1a1ylQSkVw/zyJMyxDmU/ZElVgjq30kMf2uHFZto?=
 =?us-ascii?Q?VsjoHS3sH0pc0qVnhvbI4/A31ZyTkEbeinTMr4z1QZn6B4RdZBVlZrWglwVz?=
 =?us-ascii?Q?9cW8MM8njiF4mEjPlZJZvpfSJ6k0XrHU4WgIY3Atwzs40OryLeZhUBvI3VFe?=
 =?us-ascii?Q?M6IDmd9H2Pm5q3jee4pYXuG6LXDzqLF7hRb9VNjFAyM0XZOufY8ua99T3XQf?=
 =?us-ascii?Q?QHJChnwU1SOehuiYSXE9MWeo90IUKfbr80lNO/GnsDV6IqG/mwGdqOSc3hzr?=
 =?us-ascii?Q?VluXfhenrjUts1fCzbsJPnwsIaFqSBNaxi5SVRLQb6RAwWrOidrnLD+zNbpZ?=
 =?us-ascii?Q?GoR8D+T9vaDNYS+PjJcGvXe7hrbTEQE5MmSquTcsaw9YRrSxT+yVaq2NFUKV?=
 =?us-ascii?Q?UxDqkniJYOACewAuWMbYx+79nt5YxYfB66pts2LNI/tIoVKlXqjs3kcYyMbg?=
 =?us-ascii?Q?bqVEnCuVELkBl6tzRbZWLAzrdt+DuJui6Zis2JU2yAjKV5JvuC+Duzsiy0Lg?=
 =?us-ascii?Q?Yj1EzQHkECgqt7Diyi11Z1vfn1r261z3oVQYxu0qXClm0SAZI+9VOF+1+lWx?=
 =?us-ascii?Q?eemo3grfoUDZeEJzoN4Hp+Cv9NELR95DZk5pYYi4ijPGKDrjS60Xucns0wvz?=
 =?us-ascii?Q?Eij5OqTVPk0pYAvtYRgQlfzlR/cLv+X5pSBXI8qjG4Zasv7wBHJPAuKco/p0?=
 =?us-ascii?Q?JTfh+6NXcld7pQmSu7OHIU/4FbrhV7PnLS18JTFArZNcYeWDOh/8QA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l40AqH5JlaWswDdveJ2tQpSOyQgxaHW+2MR/ipTMj+BtE8GZG3csrkjwVM8j?=
 =?us-ascii?Q?HwvZnp0pNhBTaiGYA1YkQbe76yD5/iP5sTMA80DJ12DhdWN0d3ejKJIoRJKw?=
 =?us-ascii?Q?9Alj41QLMn3sF8WRdqnlScPE1SP0bj1JZYIExlz/SncaGbrBLL6cArIuZOoT?=
 =?us-ascii?Q?qSR5guSZb5sHbUV9JIZojcQVofOPKUnzKfZkHYmZW32vJTw+6RmOl004f5hZ?=
 =?us-ascii?Q?O1Gd1gLs9zAGROCjdbuB9y3ABT+7XtwOs3R4vyFnDx3Bt2asjs5fyGtDz2rH?=
 =?us-ascii?Q?7I7EwxTsCXQhIbrDWQ8oZZwPp947iHNcfjxJds3qZh7OmVrVmzOlGTerlUcG?=
 =?us-ascii?Q?KAaHH7PRy+9sbLWrlUrql2cM1GK/lztl+QBGomgls8NezXUSN927IgElZ4Jc?=
 =?us-ascii?Q?j0RNtwY6zi1x5IBGNWPtB1mDHiME3eyjIUMF00loDr8OFvQYSSpjBS/YQ+Qr?=
 =?us-ascii?Q?SBAay+YS83d2cFONvEwp4P1w2NOO0yPAB1VCEI1e4GKL/27j8lv4zg3orCOl?=
 =?us-ascii?Q?NKpkjgelVpSHNaWzTIviCRj2ZWKr9cHD+ivOTdyiqI0RBFkycgPNM+pc2ADN?=
 =?us-ascii?Q?L9Heu3SqwuKX+C+4FMoNZ1Cy5fuw6s8l+5IKfxI2IBcBWfhGH4Tw1xhRcQQm?=
 =?us-ascii?Q?fRwo4cOF/3Qp7Sdh6jsCZD14A7PcRfFL3Qk3I00dwxXwH9y6HemjEIr53e3a?=
 =?us-ascii?Q?Tah1DlmQWpdDscLqbE+EbRK0ToMYaY3fK5sxdt9/S91vER2kKPoZoui1oLYI?=
 =?us-ascii?Q?57zdAHPS3wGAjkk9Kxx0s9zZ6wyK/PK17XkoBvooaFRhxrZ6spRdb/Kag230?=
 =?us-ascii?Q?OsuYQteKkI025OzGTMfIzPEs8kP3RmfAZGxJDCjfSfA4/4JC6IRAirCz5hx7?=
 =?us-ascii?Q?LtAGJxymBnNJHiRGy6UvIMoBOwCMqn+YywV8eEMSwt1HI5zC/arRk0MsNFpY?=
 =?us-ascii?Q?lfXsfQagfc+gms7iVnkRnk7B7PqkB5LDReAKYoF8MnBAXpsiih0rELkd/4qP?=
 =?us-ascii?Q?SKR1XA9Z4Q1vddPRUhBN0+K3TVGHe6twrn3LYNEiQ4cxmBP65KHJ09pMLesu?=
 =?us-ascii?Q?QxLUATb0e5J7SAE9ikq5vUASTdScSgRILAc7s4aoWp8hoehVPUoVHEOvaS2e?=
 =?us-ascii?Q?gXZv+1RZSuLfidBmrIsT8zQ1bywYiA2yjeufa/dCEgC8ZoV2jUArWqAqrUmg?=
 =?us-ascii?Q?Tz25Y6a/lhWkwnQ56suMunKLZ2C21g9gQeWRfvsikiqzJI4IWVbA8BCVLQ9U?=
 =?us-ascii?Q?SuHb+DZRkqE9Hxv1cxQPzrC8YxVIsB0299E2FWRuCXZaw6yPxLHGu0oprN0L?=
 =?us-ascii?Q?gU8Jbrrqg0MeRzg+3CiahA6qtW4AUs38kRNF+GX54rrBXufRcRJ9bJM7rGJC?=
 =?us-ascii?Q?9LZpDhRupuQtrsTjh1rxUfncNPx4rKySTxQzC5jRaEydREwfYo5I+s1Yzz5r?=
 =?us-ascii?Q?gCf9AEIWBZPxFN4f8E4+Y+QHa36DF+e9QTQYitIwmUHKXEbO/yvIu51yfCBB?=
 =?us-ascii?Q?/ysSxm/zDll+r9FSg9tE/c9zxqlVb2qCwpWyBio1e2BgAsQdSJJjgZzw0HJi?=
 =?us-ascii?Q?Gz1AHb48Db3p+mpJk8zkqc2FKyvuicTj2Ai71F838Q5GepWS2JAqFvhPgLT6?=
 =?us-ascii?Q?Q4tt5SoBUwDuZCNA5roWjz4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ea8b37-6bf5-4cf9-a797-08dd791b456c
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:06:59.5937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+MMXfpACp69iPQF5YLFQAOxUzgNPTBSl6rpXbZm9eaw0VevIko3fUby+EvWfOONQt27t9IXIaK24TxH7QU3j6pH7fNsfgMFwx2bR4vtCA10LKKS10UKSd+aAqnYhFqd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7963

Document the CSI-2 block which is part of CRU found in Renesas RZ/G3E
SoC.

The CSI-2 block on the RZ/G3E SoC is identical to one found on the
RZ/V2H(P) SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Fixed CRU_CMN_RSTB as suggested by LPinchart
 - Collected tags.

Changes since v3:
 - Collected tag.

 .../devicetree/bindings/media/renesas,rzg2l-csi2.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 1f9ee37584b34..c5c511c9f0db2 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -24,6 +24,9 @@ properties:
               - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
               - renesas,r9a07g054-csi2 # RZ/V2L
           - const: renesas,rzg2l-csi2
+      - items:
+          - const: renesas,r9a09g047-csi2 # RZ/G3E
+          - const: renesas,r9a09g057-csi2
       - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
 
   reg:
-- 
2.43.0


