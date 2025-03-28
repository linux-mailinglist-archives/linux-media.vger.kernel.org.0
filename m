Return-Path: <linux-media+bounces-28944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0375DA74F62
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3921189194E
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEDE1E5200;
	Fri, 28 Mar 2025 17:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JROFJ1eg"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70A71DDC35;
	Fri, 28 Mar 2025 17:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183132; cv=fail; b=X1ynhv6gIdGEVr1nD4S1BBMfoSOoz8aM/TD32cMvfVCo5WZsq/koxOUdeFN1u1ox0vI6St+DXmUGW2IxolRO6P7R5AzpL03MmULGZLJ9M6PkylrheUdpSGxhBEjwvkYJcAktBG4hnm2uxMOoigVsA7NzBmOxhMGLFxs97zK1hVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183132; c=relaxed/simple;
	bh=zXY3GbyIJZAWdN/DxlV4O1bRTbRKrunsxf2NtcXi/uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n7Jfs3pIQZyrqPLAmHPaAg411kIcVeAyp4Fe6YmtJMuSwMlAI3bAjuqf6Devk5ufekC3E0Y/UMfVNvoUTU+fdSIWKHJpwgDVm0Q0jK1g1vwU+n38hVO6zA7rLy5w1DoNbO1PZEBMBbtOEjloIH9kDsFsgkOtx0V7fkv7XwsoeLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JROFJ1eg; arc=fail smtp.client-ip=52.101.125.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5hZU+RvJ/asZeej2XNgRLOHhc8RmpMAgXN08zFV0AecipLl47JFfd9CpyC6WVhbs/lPmq2ml6x54CPE4H86k6hDuQH/UQrRY2RsxKlLQPKSQLkV+m7V1xD4fNvTir6Yk+RbvPNzC/mERMgo2uAxCZtxz4YxaUIbfvzZ3aRymWRTJqb75DTX6i5S5u/jBKdDCicjM3waTUCMgW3vcfStPhkfwxrHxpAeXhgabxG8Ez1tgh6oG8dH2r4rB92BXL/J06KU5MzZYTKgkk9lzl9stR1OyxUdbET60M7HWhuWIJc5CDewDTdN2uILcgqsst4uMOcN/fJMNZGqpzKLIg8WAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8j2Mh8E82YeH7jtRkatSvZf1T4m0a928yQBZKuOn0/I=;
 b=ezKfi4EKjEubF9nwRH+GP7+uZkc+cpa8HzObLN8+yjm7ZQVhdk0o8AqKh1kKehONbXf7dYNOANFqNmX3VnvZzOAPUeE3ihU387ctsuwiTxfqS+WdQmvlLqPrEBxl2NIwKeMdunvlv+elZmSTosLtTegf5WXOHoEnMaxk+nuKq/f82QRDKVT4oTfcsqCIrs0qGPjEYZxV29qMv4FxqNg15ZIK836Q4iyCEPJvyyAx6PthYTDauia4vtxMXRTFi3KuQwaYhvNO0dptff5wtuYXoTJKxVajgjUrdT4JaDGE4pUoqvinAzItzT0/1XvpM+BpF4cYGLnnpw21uQtQQOkW3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8j2Mh8E82YeH7jtRkatSvZf1T4m0a928yQBZKuOn0/I=;
 b=JROFJ1eg6HkcZmX929FM3G4K/oO1SKyEWRhLJ7tMpg6WYdOpO8CEvvmRHIS4uMjYkKZsjVnlzFU3AMUTW0CzTd7lWXDHzWqo94Pr9sKh3i8cx7EcvhG4mBQqV/zP5/lvglYvLYxZMBtJnLrgkVv7GLvuK3Zn0Bb7EJv2elCvJMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:32:08 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:32:08 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/17] media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC
Date: Fri, 28 Mar 2025 18:29:45 +0100
Message-ID: <20250328173032.423322-10-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7b532379-853b-41cf-a9a4-08dd6e1e7720
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WvUBAQWR+wh59dfC4YScfOvwI6OTVIluavVGTD8s+jONMYAoZ9Q5dtkrWx9U?=
 =?us-ascii?Q?Lgq3wqQKdEBbD9xedtSegALkrKz3i66o2rgF8d7ysaC4ZHaqXoqg8wbZ+bj2?=
 =?us-ascii?Q?HilvuS2J44gzs4A1U1SoNv8cBjfvlUCrQ7pURWkTvct45aHKh7PLJHHvt2pC?=
 =?us-ascii?Q?LJNsobZ/VMgkUTUW+h/JWxFXziIme1G9NAhvUt6joLv5w99YIw0JzQUjZqRn?=
 =?us-ascii?Q?9cF2b4gDtqPKPpuzOzv9BP5fr9WFgDikDtuARCGrMo2mbljjaQ3AistySze5?=
 =?us-ascii?Q?SPpYAKVA9pd2GQSpErG6cOejK1+P3Gd+XJIh18o91kZWuXjpJG0i0npO5mTR?=
 =?us-ascii?Q?Q53WeUlzHFxpxKt2+WZDcVez66P28SnG2lfHs0kPfbmXJ8ZTIg00JIPeqXO7?=
 =?us-ascii?Q?g5FsSCYShgIOZPlc5JIVQfkDzMjSpBrErYQEYxGCivAD/GL9knEwgvStK+ns?=
 =?us-ascii?Q?9AkmdeXPXLYHyKryoIyMj47AgbW0fLsOM8IHp3VdV1uOkkxd97M2lxGB/iop?=
 =?us-ascii?Q?EDRdFvxRpP7htChuz3cO34XN3wUHCC70XvcDneO9fjgjZ2UozwclufSTnyyH?=
 =?us-ascii?Q?NAp8giYFWtmv0WahzwYwsFCPwUrgk7PaHsS0jIR9VQYZJBTIlfho93NkD0h0?=
 =?us-ascii?Q?JqGqC1tQfAe9etiPYGjzTIM4O71BqKWBKtnp4OAYtbYMYeybFGiAhxEek8S+?=
 =?us-ascii?Q?jFatc1x6m5liJDnbUotvh5fRIaZHSOj39TKwyX93Gl5LtXN9JLP6dARjqKUY?=
 =?us-ascii?Q?C5BDDI5shS9/XcJcFTJuUpqoXN2MeMUCRjrFPaLOUxw/mICXs88Tzx89uxfn?=
 =?us-ascii?Q?0zDtnRoZ1YG0/mYiNj8a6G5VL0DM4F0yCEntAtJ2I8TxzMQXUiDPnKDgUj8T?=
 =?us-ascii?Q?LSHONAtmkZ7VdlFWfLnCg88kwo+9yDL6trhZYEp8PzTvMs0HxomCq0AesjDx?=
 =?us-ascii?Q?BnpHCDrcTSqcctwMolzaO4S17ffBkTUJpvz8pHUIQPe8DNXAYAME8/FBenQ/?=
 =?us-ascii?Q?gWOWpXlP5vwglKKKSrRkXdkfTfwk7vcExPfJPSEXxvla02xLJt5XwbXqSd58?=
 =?us-ascii?Q?aIckIbKIewC4Ow/gDT7rES/JCMm6v/XRz1mQl4SzSJPmLipdiBp83VZYlZ1J?=
 =?us-ascii?Q?CBQgAbKLz1t3oJZIEQor59khPj5RXKXpz18Zmcoy7hzUWrKR37NSgpZr8//2?=
 =?us-ascii?Q?A3wCcD/nQ96vzBnziiAUwPK80W4+fIhiEg/NRUp1EoJztgQPNamuIVz4F2AS?=
 =?us-ascii?Q?J2rUt3tt8y79hnrGZa76IOcv18190UHyZY6FocZfjbXLUKTCNnH6cGaLVAtP?=
 =?us-ascii?Q?qwe5gL+MeSQabgwzVHdvJrjzgFzYwSFsMVj+1RyuG4PXWGnuaCNd5fN4xns1?=
 =?us-ascii?Q?UgTxIoH+xXAofrF8tWjCnc9pOM0hDrjrTUmNMjWi51fphVobrJq7VfQVQZB6?=
 =?us-ascii?Q?TrDshmYAiXOJZX5a16unu0FtQzMMtma870gK2PfIMpm1IUKQyT6ksA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?82WPuLn4B2aKA9Ef2fdaYa0/ASo7ry/2l9P5NyMjOJ5fBORGibDwvyiV1Mk1?=
 =?us-ascii?Q?jbUgko8UN2U5Yj3xDcUZGxPRcTkcapDVH2TUimI7pmVDpaoZ1YUeUbKBj72x?=
 =?us-ascii?Q?EkWEQS6v649Ev/f4yi2hxDlnW0AxGMwLxobahTmhjqY8g8su1BSA3En9QF0y?=
 =?us-ascii?Q?5SxXUL50kw7PwfxMj67EBljZpBVsybqdGhnLbwQMJcC8CvrMYQOihs9h9c4i?=
 =?us-ascii?Q?NLA+2ftcTPjTJ9Kyjr/bD3W/LS5batE4SFwTYi4L/ZzndiQ96t+wFUDFoWTN?=
 =?us-ascii?Q?feRg40iaGYtifAdgGnUbJbvu5AaZ6NlysmPmOKTzhVpmxUF5nyVk99cJ93+I?=
 =?us-ascii?Q?ATODge85XikacZ/9i1SHzk3QX/p6vXfypxOwyEUADRIKcJxGcAz2vilGUepN?=
 =?us-ascii?Q?n8hYtjR2cqsVzJJFVdKkR5+a34SK6epnvDJCx/pqqPimWB+nlgPs10ic/S5Y?=
 =?us-ascii?Q?klgzamHel2xwMXSG2nvpPUSSB1NB0kNNSlfEFbMGNmX0XBTwNvaM7soTjUnG?=
 =?us-ascii?Q?FpbiMdTAW9PhjzqutbS9A+K2mDdPs6iYAKtrln1CcqHTqs0ITBNi3vZv1QEU?=
 =?us-ascii?Q?2x4IwlTGaf3pORkMvf3BGz4jnla27Rtie7dk4hbysutL6BW9qY1ZfeP/p3Xo?=
 =?us-ascii?Q?Z4BvgaWGs40LJ144rnT8JqiSlo8JoZx9J3DxGMvEEcUUlIjdLT6cnj8WKDA4?=
 =?us-ascii?Q?zy0q0FgqKPFYlZ2vRjK8kUZNa1lIeN61Fd9l+/+1cLg1SDKFtWvyNSANI7Yl?=
 =?us-ascii?Q?lCuTItig3cEZVeL4yff1jpzuAj4SOSGwC9l1Gh7CBCSzG0tTqnzMBZ8ReZyV?=
 =?us-ascii?Q?byLXx0e7H2xic8u6lrN/tXulysEq7oTjAtxChxehbBMHarA+dxusxrK00cjo?=
 =?us-ascii?Q?CCQo4WqfOpd40wko2HyhTWFBXwLjp+zMtlj3D/SOPZiUs5RVhx21iVzABIpR?=
 =?us-ascii?Q?ukzkPlmpQCEnz5FNtJROo9Au9f4VLFthnQcE0TTUqsQzo7dfQ8MBQ5ibog0o?=
 =?us-ascii?Q?WfvlVCM5U94vPhbNBunVkzzx/CBNS8zopCsAq53RjQxfH4+3SahQ2nqFwSPU?=
 =?us-ascii?Q?TDMoAKPoOJ+k7yECsWCJUxSv45ThECafC1v6cek4mzotFpTuE3KEgbHqd0oh?=
 =?us-ascii?Q?2HwzHLp/3ukBsWRXTpAR+6gQRy5WhqAwbmK/i0T7aeiJpGcm+dEBqzhOHAZO?=
 =?us-ascii?Q?/03QCLsErmkeatIMzY4ARNfsTcF5KC5kiF6wJqeN+VuyeBH3r8fcGN1p7Rpv?=
 =?us-ascii?Q?UTN43IP6v8HOqpl76r/Uz7gJDkU0BmBFrGN0pzj8jSc/gLCm5qgol3pDBxaL?=
 =?us-ascii?Q?W98bqQ492YC2SJ4iITp8wi4IKOWVznv23dlySm/5OCnHnoCKoba8PUlptGat?=
 =?us-ascii?Q?avqOdC39j8fJhFto0UWjqHUaSwfsfS8Kr4wQcjQf0JraUuojNC88p4pfFPx0?=
 =?us-ascii?Q?i7bbfVu/TmerlNfBNVK6JDbSB9QGz8wuoKtWkQvOX5CSKhFgqPD4nnvHpgUj?=
 =?us-ascii?Q?I0q6r97Z0tAEU6uAV1qiDHTX9KLaQ/rMcof5vhJdvq1AdPCkc+CmCpSxJul1?=
 =?us-ascii?Q?yAROlxMUJZ0j4GJZojY8Cb5D+06Ksb2YbljMAGAcq4kDeztKcVBs7rkJNVmF?=
 =?us-ascii?Q?j34Ha7G7HbsgyJ2yUzkWoWU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b532379-853b-41cf-a9a4-08dd6e1e7720
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:32:08.6277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1L96D4u4YFHOUaJM1aIetiynKVo/1q25+cwv66lD1OS7qlxE1o37LcpXf7Kd1lWHumbCjtIiYQefFr6aiotN4mrwyjVf2givGvk31b/6FNIgbM8rJwpxcHLutcC7sxx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

The RZ/V2H(P) SoC does not require a `system` clock for the CSI-2
interface. To accommodate this, introduce a `has_system_clk` bool flag
in the `rzg2l_csi2_info` structure and update the rzg2l_csi2_probe() to
conditionally request the clock only when needed.

This patch is in preparation for adding support for RZ/V2H(P) SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Added has_system_clk bool flag to the rzg2l_csi2_info structure to handle
   case where system clock is not required as suggested by LPinchart.
 - Fixed commit body and msg

 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 4aa5d58dde5bd..e4781105eadc0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -127,6 +127,7 @@ struct rzg2l_csi2 {
 struct rzg2l_csi2_info {
 	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
 	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
+	bool has_system_clk;
 };
 
 struct rzg2l_csi2_timings {
@@ -364,6 +365,7 @@ static int rzg2l_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
 static const struct rzg2l_csi2_info rzg2l_csi2_info = {
 	.dphy_enable = rzg2l_csi2_dphy_enable,
 	.dphy_disable = rzg2l_csi2_dphy_disable,
+	.has_system_clk = true,
 };
 
 static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
@@ -801,10 +803,12 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
 				     "Failed to get cpg presetn\n");
 
-	csi2->sysclk = devm_clk_get(dev, "system");
-	if (IS_ERR(csi2->sysclk))
-		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
-				     "Failed to get system clk\n");
+	if (csi2->info->has_system_clk) {
+		csi2->sysclk = devm_clk_get(dev, "system");
+		if (IS_ERR(csi2->sysclk))
+			return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
+					     "Failed to get system clk\n");
+	}
 
 	csi2->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(csi2->vclk))
-- 
2.43.0


