Return-Path: <linux-media+bounces-45203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10004BFAAD7
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E41B74EAAD8
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D4D3016EA;
	Wed, 22 Oct 2025 07:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="C/WQqwmu"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021101.outbound.protection.outlook.com [40.107.42.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38CD2FF173;
	Wed, 22 Oct 2025 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119261; cv=fail; b=AFAOOT0DoZjmQSestBMmuEuyqkaXdrMh5qGUcf1vgbEPcibCtg/Kkr4ziwaz6w4Beap9ZAr1ubzVFYokn/c3fT72Cv+qud3j0pATqElgwDbxUQRbhYJQvYOmf6c6ATbHX/UvnPxFM8d7ySOgZJLd79P8w+jBh47oy6+bLub7mTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119261; c=relaxed/simple;
	bh=zggJYKGCT30ak1fbUGHS4/Iqp7jt3Fe2ICbojnN3wSM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RKWAAl4ARQgJZSIMYBxPY27J6kc/P4rV0Lh7q8NXvvws4LBbCuimJyz2egmIMfRRnGty9i/dUH7E8wrHnOWp35jO+FNHt8Rs8CebcxrrOB2RE5ArWwTl2Cv/CJ9y+nm54GqLxam2lkYPGnZB+bBMxGMuzqrbHYK6yeTA41CmN24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=C/WQqwmu; arc=fail smtp.client-ip=40.107.42.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXhHB8P6qfSuVl8e+ybg8Q+SA8BeellkNJNPc0DZJdEy3+tQ7w3imy1jehIgaJW8BPvtp7eN6t6ensK7wiNH3TbbbMplXLCELpl5MV0kteMCFBhqLVsxLE4P6PlkTsF3dY5YqFK2UhNoMhudiMgZ3BWIhBqyR2DE5eFCzWp6PKAlpPZkU14J/gPhdhY9lQC8uu3hnm/Iueb2N87/BcRXqkh2TOQ7aAPB8pQIDPK2McPLhsKEjXcJK2m8bkRfYIDDqS0Jv6bKB+8swbnnX+Z9YdoEFjswux37tPzgsvL4msv9ZnFoIBw9RoFbxGUR8pIb0wGsL3j0Nw66dnSZKsLalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u62JDgwZEnQUelBI+Ioz1iSZsTWuP9GtiDJ2fcvDbPM=;
 b=PQnyhvtvLNg+1wOVmW1oVwxeeqxEDzzXMKHVfiTQC1bst5uiOkqdIDT7kVm2stw4p8yHguLRpyl6G4sCc8pPor4b9fMSNOj7ccNtfqyGeMnzy5313lZypoHaMvWCA2aNJ1DQFuF31tHsGcKvORw593raoIOmJGK1+j+ZXgCv4TDXfTZVwprGVl22Ou4QOWaxxeTS0bxyQ7oqT6Kjh8fGlFNcsR4uRUcIHO8pzM052c8YtoRKqQpoPofWY5+cNqEaNoP7IFuBq012Aojkv9cJ9tpeiqPEXlFxqcjAA+LNBJf+gkCi3NxlKaQCJMlUfFt/Mxf/hnPgeHmO92wf0Zg3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u62JDgwZEnQUelBI+Ioz1iSZsTWuP9GtiDJ2fcvDbPM=;
 b=C/WQqwmuuN6yb31YLaclnfKC6kU7xCeNiIwhT0cQvcFaaE3mdWfc1LYUv0IF854eSb1t46qsc4vticMjCsgxVk0KEZ4dL6P7XDbju2+WaKgqSNy+TCH9SLu4U/OWcbMzJ9C5t4m+ppC8atQdsHy4py9Tsr/oSBzvfpUavnX3+Y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PUYP216MB2918.KORP216.PROD.OUTLOOK.COM (2603:1096:301:159::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Wed, 22 Oct 2025 07:47:28 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9228.009; Wed, 22 Oct 2025
 07:47:28 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v4 9/9] arm64: dts: freescale: imx95: Add video codec node
Date: Wed, 22 Oct 2025 16:47:10 +0900
Message-Id: <20251022074710.575-10-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022074710.575-1-nas.chung@chipsnmedia.com>
References: <20251022074710.575-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PUYP216MB2918:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8b979e-2954-4645-c6f7-08de113f3f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?snxETAIY2XL78iEOcO0e3gfjAZdW2ZrcxVISyNRXrvfvGeDML3m4JuIdv7gs?=
 =?us-ascii?Q?yeftEumSyNDzA/z0ULWjQTBxv3yw92qRLUaJRf1r1PVgnZrskgEBL+sE/3Pd?=
 =?us-ascii?Q?4rlD52vcPfrWUq8V+P1BS9vLH8XblWJf8dK9rUJ0MS/OZrEAcrHz5CflJzVo?=
 =?us-ascii?Q?l9imlxxC8e0BEe96tD2SkR1Mx2jogMPLZ9++mqgB9P5e+OcsJZ7Hz0XaqgDt?=
 =?us-ascii?Q?9fu0RfdoDioutOBgR2oA+7EBVYL041844+JRyuzDnGgwjAilJEHRiVdLFBTg?=
 =?us-ascii?Q?ZZCNyZyg7D/5/DDPVbL8REtMJkLif24Cq+LSheoZyN8iI0ZtCAHHWk0qoS1R?=
 =?us-ascii?Q?hqT3PXjLeF3RLHY6XfCKdrCGYM6hr+opFx4vrfVfTfT7LuE7Ps+emQxOauT4?=
 =?us-ascii?Q?8E3EmvfeN7gFK13I+JwzkGKVaoGUo1NWKqqEcHMIBnJoKXiGf0XBT3ZEO/HL?=
 =?us-ascii?Q?0cl5L69zcFUGZ0cuKg9vjGc+N1gVNs+2rIYtxtE2GcjH8/BkWX3gm8Y+kMFV?=
 =?us-ascii?Q?VT3ZeFlTHXnRFoCuamKTgE8mIBWpgce0xMktVbYjMuWB2s6RfqFDZd/SQInZ?=
 =?us-ascii?Q?/fzjl7cK2G8WIM7gy/eLtR1CdD9bjJlNoTw35gjbksinXe/sjySWDuFmnkvy?=
 =?us-ascii?Q?vOuGy2qiyGQJFwAdnWKrdCJimpW15KeEe/f+1YerrXKAMZnD72VVwRk7TNGu?=
 =?us-ascii?Q?FIfoU2dRaymHdjn1OiBDs6KzxOdzNhALzH3+iGZbUf7q5PZZbwdIG2TRbtS1?=
 =?us-ascii?Q?8GXx794lrC+yF2WUMOBlDVVGXbMb81IEoWV+73xrg7RIUUo639+vcJfSmo6s?=
 =?us-ascii?Q?qxJd5nq1dfluD3YxnXUYnjvktLu9Vq30H/nclc1jaxRAXdC9FcvKMc6uUBFy?=
 =?us-ascii?Q?QaokYKNnSfpbVO1nfoPkqqD4vCTfNap/7IcGXXseuXnP41fniDEswUbwctnm?=
 =?us-ascii?Q?Tq2Pnh+f8m/hNgdSpikJ75hoYivTLmalCplZhqkZ8h+AdD0QS+yyV5E/r6H2?=
 =?us-ascii?Q?3AVstez5DdFaEF+GWQnnfHy0kUX4bZRSLPnU/BNWc/B2VDpFBEyJW4s87Tpp?=
 =?us-ascii?Q?PR80F3XZBwkJXccsf6ptypmV1dYakXvxKI6LKh73IKKmMXHov3DlbYGcL9Jo?=
 =?us-ascii?Q?A5jc8OjQ+APHDFazdZP5IAAqwLuHoQAnOvAI7U9c3/lWSLOVS03sYI8tGfHb?=
 =?us-ascii?Q?JsMLx09vCfcqkkVfpm5oww3LyqpWIFLaKolES311nlLQS0jRTC6uRd7rBOYM?=
 =?us-ascii?Q?qXCqy6Np6xoz1mlMNZ1vygFhVgkeCsFKAzGs6lQdU0QMvVh+dz2cDFDJLg9a?=
 =?us-ascii?Q?Qm3ZGpyq9xgNlHmNfN8SfWCY27NeefeldgjWcCEit/T2vnsAnftfgGOUAvBE?=
 =?us-ascii?Q?PsBJf1mDdb0QWjon4pgmMksBnsND+ODpeyjiOOK0kwNjt9I7V2QfLGBDLESe?=
 =?us-ascii?Q?NmpKvL+S0iuEIWMvPaWSzLj1cqJdLUxn7fVbTZqoW1EyVq1Hbo+D1//0jcNC?=
 =?us-ascii?Q?HakzfytMEGtM1KFJ4iEr8dhhNedB2L7ZHvCk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1djoBZ8r7ypXuhapXmMNQWe9d2ROpR/W387WQ975wTCM3zsVJ0sskQ4NcfTV?=
 =?us-ascii?Q?/ytZ216ZDLMTgOjT44hPJjrLa4ulk7pNDYFY5IgQ27M8lBn3uinYDaWmk7EQ?=
 =?us-ascii?Q?RVl7+h4IEhuJ0pTLbKza1HHFX3+TRpZS4AePQcEVR9zLMQUWhpJXdH/grsYy?=
 =?us-ascii?Q?ITdF5nvL7soZ0R5Ng+FOlYSwgcx7+RbO5ueXAr5T+rj1wBEtJ20fJUQxTg2E?=
 =?us-ascii?Q?7mnLACJhSLjW3cqqhMTKk3auyUjsmefBmRMMdLDdUEx/eTcvJfgW1rQ65fsE?=
 =?us-ascii?Q?HN+E+Sji3xfxoiroHsV4hh1c8FUYHxlEMPxbESR+jN3I4a6U60Ia9vW3KxAe?=
 =?us-ascii?Q?jNBOjvVn1tcsn5OUJbTSNHT3tGYIqvqUKHgl0HBDS/ubl2epSA1ETk5L8gB2?=
 =?us-ascii?Q?L5cOKKwGh8KHDnShVqF1XiD5Jc8E9aVb/DjOvCj404YSABKwL5kwEVwlsJxu?=
 =?us-ascii?Q?6NPywKTvH70xMZuHFB93KJzGV3tw4hy1X6hMRKsUIJqPl0F9lw6wiwfT4fH0?=
 =?us-ascii?Q?KlkFoY+CxykGaBHuHKWevEqrkf+JgUkVmiu22kgAB4jwoWx5TdWTCoJePNxl?=
 =?us-ascii?Q?k9exocxqQnfzc/fthQCfhcCXFWEj04jlBtXIFW1RUFmzp+Cmau9Ls5GT6ppv?=
 =?us-ascii?Q?Rx0Dx0duvLtyYwnjX8RaT081YreepZOj9DcMRM6QQp1OG7tOUOQ197uyyHuO?=
 =?us-ascii?Q?cDxwFEgti0DMneb4gtSA3TiLHf/bMaWjGlJtr0d5iiYw8ObNd81We5/8aXvg?=
 =?us-ascii?Q?P3S7WG+U9QGZHYDuCT5HKtba/3nG8HGF7BV1I6VKJ5GUDi+36f8cxJr7ABsS?=
 =?us-ascii?Q?YvNMsuc4HkpzAy4zVsZ41iEc9EKoot7eyoHRGyXS7w4y/CKhYp9Hf4u/lZTw?=
 =?us-ascii?Q?ivE//Qc44S18zz+rlfjP1MjbthsvdoLso7+tonj8WaU0UTFMhCHciJB696u0?=
 =?us-ascii?Q?5EjeVefv+3tpSvZBC8evsu5buWc5+x5vIrF77dDhxiumUUU372i7u62+uAbd?=
 =?us-ascii?Q?Ybftzakkzmus0Jb1em+LKDp+B0C0Zh6D5JyT7aJRJ+oLGyd3jgZiuZk8lbSr?=
 =?us-ascii?Q?XITBqoBae9eyzPrHjY+zpBqAsE33/12F4ei9NgeCb5VMiZyzSTCqMvOxlYC3?=
 =?us-ascii?Q?m1n6HDWoD1xCDF++rMDXONOPZrgYe39svYNxolTyEVeUCVRLKPNsrYp45GjB?=
 =?us-ascii?Q?xZrEqV8Ro0Lwgs29ff83CITRcKmtzWJUl2LcS0zbH83tTedtk8FCPS6LgtD6?=
 =?us-ascii?Q?rH3b/VsQWyMcBuP7UBXn/mcTZcW9LxkR7iEKBgLBd8YkXiCgL8nzv7B3fRsa?=
 =?us-ascii?Q?koIb5JqCFBUjB/fNFr7HRWyMFLlaoEiGLk/jHgPpOeFLe169rTuh8pxwaDvb?=
 =?us-ascii?Q?qqLVbeuq9BQBJ6lANJawY7pW2oYuQsq0h7fNY1n6aFnZ69BL1nBWX9u3kgkm?=
 =?us-ascii?Q?bw0lWQ4SN4ZRFiiKaNMy4whnyRXCLVlj0kwDMVO6CBOiDxxyC1FjWgfSE+sf?=
 =?us-ascii?Q?mJ8z4Az8kF/mRE0ZEfWQyvqFsWaFzzNnPXHJnZH0pR455cQEhzfk4sIzlGun?=
 =?us-ascii?Q?5QvN3rk7UJFuX26O3tC8k6qxgLrica1rvYVJciD+jiO6wyJcI8TIN/hJxCcC?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8b979e-2954-4645-c6f7-08de113f3f94
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 07:47:28.1870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+keJ/NfgZzktaAAA16H0JWTcDhDismMbxRyWV/Tlo8ifnh5Pv/so0DKklP/slgPzWYZigfz36M/kk9tJet4mx2Hwc536cyaFXqfHtOF8iU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2918

Add the Chips and Media wave633 video codec node on IMX95 SoCs.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../boot/dts/freescale/imx95-15x15-evk.dts    |  7 ++-
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 10 +++++
 .../dts/freescale/imx95-phycore-fpsc.dtsi     | 10 +++++
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  |  7 ++-
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 43 +++++++++++++++++++
 5 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 148243470dd4..1b09ac02d7bd 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -215,7 +215,7 @@ rsc_table: rsc-table@88220000 {
 			no-map;
 		};
 
-		vpu_boot: vpu_boot@a0000000 {
+		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
 		};
@@ -1155,6 +1155,11 @@ &wdog3 {
 	status = "okay";
 };
 
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
+
 &xcvr {
 	clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
 		 <&scmi_clk IMX95_CLK_SPDIF>,
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 9f968feccef6..052dd027da07 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -76,6 +76,11 @@ linux_cma: linux,cma {
 			linux,cma-default;
 			reusable;
 		};
+
+		vpu_boot: memory@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	flexcan1_phy: can-phy0 {
@@ -1139,3 +1144,8 @@ &tpm6 {
 	pinctrl-0 = <&pinctrl_tpm6>;
 	status = "okay";
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi b/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
index 7519d5bd06ba..b713d4159e35 100644
--- a/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
@@ -59,6 +59,11 @@ linux,cma {
 			size = <0 0x3c000000>;
 			linux,cma-default;
 		};
+
+		vpu_boot: memory@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 
@@ -654,3 +659,8 @@ &usdhc3 { /* FPSC SDIO */
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	pinctrl-names = "default";
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 180124cc5bce..49031f3210c1 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -40,7 +40,7 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vpu_boot: vpu_boot@a0000000 {
+		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
 		};
@@ -696,3 +696,8 @@ pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
 	};
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 1292677cbe4e..dbf21dc041f9 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1982,6 +1982,49 @@ vpu_blk_ctrl: clock-controller@4c410000 {
 			assigned-clock-rates = <133333333>, <667000000>, <500000000>;
 		};
 
+		vpu: video-codec@4c4c0000 {
+			compatible = "nxp,imx95-vpu";
+			reg = <0x0 0x4c4c0000 0x0 0x10000>;
+			clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+			power-domains = <&scmi_perf IMX95_PERF_VPU>;
+			#cooling-cells = <2>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			video-core@4c480000 {
+				compatible = "nxp,imx95-vpu-core";
+				reg = <0x0 0x4c480000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_VPU>;
+				power-domains = <&scmi_devpd IMX95_PD_VPU>;
+				interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			video-core@4c490000 {
+				compatible = "nxp,imx95-vpu-core";
+				reg = <0x0 0x4c490000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_VPU>;
+				power-domains = <&scmi_devpd IMX95_PD_VPU>;
+				interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			video-core@4c4a0000 {
+				compatible = "nxp,imx95-vpu-core";
+				reg = <0x0 0x4c4a0000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_VPU>;
+				power-domains = <&scmi_devpd IMX95_PD_VPU>;
+				interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			video-core@4c4b0000 {
+				compatible = "nxp,imx95-vpu-core";
+				reg = <0x0 0x4c4b0000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_VPU>;
+				power-domains = <&scmi_devpd IMX95_PD_VPU>;
+				interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		jpegdec: jpegdec@4c500000 {
 			compatible = "nxp,imx95-jpgdec", "nxp,imx8qxp-jpgdec";
 			reg = <0x0 0x4C500000 0x0 0x00050000>;
-- 
2.31.1


