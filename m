Return-Path: <linux-media+bounces-16556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 068FD959624
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 09:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 854BA1F23F49
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 07:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200FA193431;
	Wed, 21 Aug 2024 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="h7mEZptr"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2056.outbound.protection.outlook.com [40.107.255.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C971B81CD;
	Wed, 21 Aug 2024 07:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724225403; cv=fail; b=M0CIDV2W0jTu1MZh5byBst+wlwlI6TeTA6Mj0+MaLAv9jbSoUDpRdC3tJbXfoVtagUBpsjeKnPk8wgiMAnOW9ERDWB+cbILg4KoJL14XQ6X6jC9jgNDkgp0OXCx4n5hP8kp8fjduO3Tq4kLxScPp29pvrnFSlRPbkNWqBAhfBdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724225403; c=relaxed/simple;
	bh=gHpHYwqeWybt/A1t0LuhJrVO6nJNzSTHfuWxlu04vH8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OVQE5LzGyOLdORsN6yWPAqS9aKHPcg+5Laqh2s94WgaBexlNCe9mER6Kll6/FpUSvNBXHcs9pjTPKIngWNJsXYH+3wkB2UQ7FxkRPkdpqJtcGEvUZ72NYHvBQV6B7jxP/q0GjJp/9pBUjupV+UrGPI/Dv8VwQjXb+EtigNpAoTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=h7mEZptr; arc=fail smtp.client-ip=40.107.255.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GggVlmpdZw/tgJx7wQdl87Ra5Hfo0BbQ29wfzsH0za6vGfZHS49HKXX0lHF1EX394ZnJgnjzrD8YUcdvA1K7Xt82OyoH4vdwalgl1mWJO/dfVSh4EnoNLw8oaWMx9os0Bmhm60cHN/bC5ThGZ7iFUfO+1UVVJW/zSgmiZ4kKTAY0qRl9e2nMWdB84L6fyUSKVlp/uBrXm3m20Eqc3lpsGkhLUztrW6pmaqmu0jSApA5vDy8tt6rsE4lxPMfLN6E2DlOcii8nIWrqCx3Qdt53AWkpYakLYCx2VAHJJXSpC5F08Cs8tIXYD9yO7OyZETZok4KF+GpPE9Nekyv50HrViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s8KW6Aag/q069wUAVMR7viCXIlfxkad7MgKaLsO4Jk=;
 b=MQ6pWN7zZpcd0KOxWqRPp42aDsGUhpKlqqGslTUWY/ohVerA6q1bFFmLVqkL6ikAq0ssempwgLk+u8pLTWPldP7eths28h9Y45ImTGGKwJFGQbqsZdDxSEEhy2SErX305betCAGq0v2I2+GV0dGQjWiJ/ZAo2UrrZ5wLMu3JplN4i98WLjMqjr138Nh6IqW7kkr35Dd4J5sbbQqoZNIcNtWPpfIPzGHVfg+DIdvg72tiv34UBVlZw5aOGQTri6EgMGM6vuU/ANZF+Ce9bXhnntVP/6Huz9XI3kADLsxaXoo16KbXK2iGUPOa9a1q+SsrWNcwW/EAzZNvzHqOghMwLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s8KW6Aag/q069wUAVMR7viCXIlfxkad7MgKaLsO4Jk=;
 b=h7mEZptr3dXvy1lac0QovT9G7ueErhvzRMR1Izm5JL8+szPNs9nzU6vf/qYHj39tpBX6IkEc3SnN7veeK5jwJxketlET5fjCQWzPT+gA2VLGp3wgXpXQTOn0d+1Vq46l8aOh/8Uytw8kkXMGAQWoHX+MS/cwjr3L+R18WHMh7/o6N406bveGyHugu1DdSfT2HURg31NzyquVOe8NmzjyyODsLVQDpEYS34rJRP4H49liTzoXC9p5iKkzYdEmAfprrpVB4VgZkGJgk06u7pIFwbMNiG/HP7Wb6GcHC7DXTPwCnprGpoTTI8uD4VCoHOm71DIC3uDjCT3fXMxilk7J/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com (2603:1096:400:33d::14)
 by SEYPR06MB6524.apcprd06.prod.outlook.com (2603:1096:101:171::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 07:29:58 +0000
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268]) by TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268%6]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 07:29:58 +0000
From: Yang Ruibin <11162571@vivo.com>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Yang Ruibin <11162571@vivo.com>
Subject: [PATCH v1] drivers:mgb4:Fix the NULL vs IS_ERR() bug for debugfs_create_dir()
Date: Wed, 21 Aug 2024 03:29:44 -0400
Message-Id: <20240821072944.9275-1-11162571@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0165.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::21) To TYZPR06MB6263.apcprd06.prod.outlook.com
 (2603:1096:400:33d::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6263:EE_|SEYPR06MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 19540023-e487-46dd-2533-08dcc1b30f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uv5a0Pvk/ByAMFZhzucPuUYI+ceSPWQta9umox5gxnlarmr/8Ud18zVe45I5?=
 =?us-ascii?Q?bIRtkJInfOX9I8pZDuDiUNur+JmYWtP0wiLVR5HgmojpCyTB1XX3qnSBUrfY?=
 =?us-ascii?Q?NtjTTzpdOBgRdXayKJkweJYcLuiU2lJhL3v+0qdRCrwI5QW5M9TcN6Q9r9Oq?=
 =?us-ascii?Q?BWAFU8Eza2jc/AGhvOnsAECa7BRbp/LE4m2Q4xGcs3m1TnGBUPzEg86BBBTM?=
 =?us-ascii?Q?6fHN3hMExQxZkzL+g7x0IchjNmVBqllcNu1DtlLxToPt9Zj6HKAk9s4DVxf3?=
 =?us-ascii?Q?WdcQ6V14Ya2lKseahG2VcVTbJsVOdwkrMpdDc6soyoqcqlC7p8gn+8JgVS5T?=
 =?us-ascii?Q?3ZdnNi5jjuAQL4fuzaKtohXlNYm7e1plucCHWANGc0HcT2fz1LQ1m5+7bcuD?=
 =?us-ascii?Q?jtvhm6IIquDhfA0gOyWIXYTBgGFcO4f8vqkBr2VwoYUhpJ0GQJvnLQcHNedC?=
 =?us-ascii?Q?yFl8DyBZI1hMvaHRvrSc1bWWPGDXkrHdH07ZL1CKW+l0wa4xRycxurAD6V5B?=
 =?us-ascii?Q?hNPbkSbtC21kUqlYg5vKgUm1aoc5nBA59Ag1JqlNZn9jGAef1CY7st6el5sJ?=
 =?us-ascii?Q?yPsDyVJPBXj2Ev/MNRmDGF9q/XW49A/3NMt2SqeeCiA7VBy+roRwVUjRKM7l?=
 =?us-ascii?Q?1qQ1gPNZxE0QlRIJzcXcUpWgH9UbHhAWQaX1eeKtY+Hts8OLCJ8jdpBceZ86?=
 =?us-ascii?Q?8COF5MqEUlWuKp4/6wlXynu6p2nceu/tK2g2aT2TBJ9k37iTX1VmMwGjUdus?=
 =?us-ascii?Q?S+KtpPpPsf71wtndjTX2YdoCblut8LaA3s2DoiA4Y0v+ZHN89xDSq6yynWBE?=
 =?us-ascii?Q?XMJC2Bs+CKMmvDQa+dQZl/Lj09vzXPxDLUbqbDBxpR8WTw3jNNbl2+Z/O1T9?=
 =?us-ascii?Q?cRNQLRhmOdh/5yy/P0tycW3YQSAtScvoM7c3GBGGEmIwRteDODxrB/uWS/mR?=
 =?us-ascii?Q?EftjK4FLgQlFEkKwYtj3bVQay3qKYCQW573QlfQ6Pfd+MEVXc7J8pS1sDUZS?=
 =?us-ascii?Q?ytcTqlACH/jY/1mpuog/bYDQy01KvlrCTG6SOtQTmKMVbDqOdroDqq+xxAwB?=
 =?us-ascii?Q?cgJpCho/0DXtf9olTPzuTchmEx+HdRu9ex4yWumKUR0+tzMpcq1xrXVwzCA2?=
 =?us-ascii?Q?mRusc7To3ImHN4TLXiqAXrs5vNqWbcrxTrXcOqiciE6IqbYP/BlV05dLRkeY?=
 =?us-ascii?Q?HcrIABvVUwzQfmkwEpyyLDDlWhp4XozTs7MkQ3rc7Aaey5mtnQ+n90F7st3/?=
 =?us-ascii?Q?a7D/KVre1L+ZlJpAzd9XgVzIoesEDfyyPZc9atVgowvEgHvWaPqyX1cPr2X4?=
 =?us-ascii?Q?K7ir3L2h9Z37xH/zxJubQKsahZlxX4XjxkuP/On+fzud/y17qCsJeiqi137/?=
 =?us-ascii?Q?8WzoZeTl0W6bMOR8GN86cbrlF16YQNlQJNfvfWUxGXjDDNzN1T7RUcohXr2v?=
 =?us-ascii?Q?f/jQTklLs/g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6263.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IldD419+3G1kTlxy+YonDxCrYALgYqq7Cao0TAZOLnTATAOSiYjMWZevaTab?=
 =?us-ascii?Q?SAm6MZSoPR43dE1ph7OcJDeyVL+3AIiBWulchxvczk75U4mPcsPVWN6VwnLz?=
 =?us-ascii?Q?z9JsWCvjUhzlLqBSiw8jHW1ZMxWM5jHrTrl9Fk9KRxBmqftJ61lLC2JUPYWq?=
 =?us-ascii?Q?3jpB0gCM3R1DNpvpsFpAOFy3OiKTmuDGfhjRnnvkxDSOHjjt0tk5ooasU1Gd?=
 =?us-ascii?Q?qFKnPqIeB+elxi+SVdFZAxVFooAbA66FTeVprP4lyFPEl+ZAI170CGKb/dGx?=
 =?us-ascii?Q?w78HuG04d4uzCIN3EI31AgX7eaL1X4wLw1cDSR9ewOmluh5dMR+GOXIzqv1Y?=
 =?us-ascii?Q?ZXaitDL41+hUkISSAH53fFT9dAxDvMXGVapbJaAtWc65F8bGQiwMCIAAHP8m?=
 =?us-ascii?Q?N61f4vFguUI0zoGF2mdukxJIfLFf8VrGG3Jafp5r69S3S1LjlBCuHiunTCuJ?=
 =?us-ascii?Q?8taJOIKteuzMIwq3dNMW1A57tfsl+L4sMLOlgz32ZPrRAdJs5xL26FPJrj8W?=
 =?us-ascii?Q?lEqfVBW2C2+DjrsML52fI05CCClDayB5QZ0XXlesDuYbMLgGbOhyfW+1hoX6?=
 =?us-ascii?Q?ky5PBSODecPTj/1r+du8aVT/ZF2slX0aokuLqQzO2bk7hk2XaQKti5R/1OdL?=
 =?us-ascii?Q?F+RYPZOjCdK0xmvFE9llIQT7/FD6i4xoXFBUlgM1mwJO84vUXgvkUD+JlCUe?=
 =?us-ascii?Q?FKTSGBAKSYsNnSL9OP2zSN1Y7ejiAPeuwTD8XKrT1pOuddYybNBhrSk7jpfp?=
 =?us-ascii?Q?IZql2BtC/BK8PqFlup203q6ViZKZv/BIFVp3g1t50hViu1kovzlZ/ZT4+jlF?=
 =?us-ascii?Q?V7I02kb0o4gzsZ9q/2WA6KKINKJ0axSltMGWlTRYeWkc+dG5qbHTX3LDqxSC?=
 =?us-ascii?Q?c00iokCaFqhZsrN5qAZGDhkRLJwXS3EqAZW1TeFtQh5m4ejo0L0eYaV0+X9A?=
 =?us-ascii?Q?IJFZjsngU5K5Qra9simpMaZqkE8sZC9AuA/9q4Pd0qJbpCw7U5YixYWJLUVF?=
 =?us-ascii?Q?2HDzVH4TbvBJX8pOMXK1tHeR7K1WAEMAu+o9Ofr/sEy3mMwFvpTQSKe+yco5?=
 =?us-ascii?Q?+5RH7F9BpticSp1aCi0X9NYrRJRAe0SY0ifJ7SjDWaY1Spp04KCi8/eFcO8p?=
 =?us-ascii?Q?sVyxfou+KM1ZP4Dlf5bu+M282JKkG79zd5orOHFLbmuOGF7cBcwerv8KVDAS?=
 =?us-ascii?Q?zWBi+W2NgdJ52q82cunhunim24u9KTf0jCMtsLssvSAZsXrSaJ/uL9wcNE5a?=
 =?us-ascii?Q?Jh1cIUQtIPG2t4UKqXpjM0JfqqyZgEHPHcp4OJN1hplh15eLz5Z5QVUVkSsu?=
 =?us-ascii?Q?oPvi0EIWmQUqHpqIi37VkkkKHQxRY7ynYnAuMxwUQhvjq8lC09siVYGV90E2?=
 =?us-ascii?Q?Ve9HvSPOtvMwEzz2/fferkYMgjLiTLtCMtgyrs6Hfy0weVl0YJvMLF7T3eET?=
 =?us-ascii?Q?hiapN0bNsPzBOhtSP+WGt0icWCfayNf9+/mARwzzHYQ4ucl1rha61D7Ubt1R?=
 =?us-ascii?Q?VqUCD3TcV3F233utQZt961bsqQgRln/m5etC8IRGmvEzJhVCAv/a4Wql1bEN?=
 =?us-ascii?Q?E+8Z2NUnfJ4fGJh07FFz7ZL0FfonQIvFcLrHIoJY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19540023-e487-46dd-2533-08dcc1b30f52
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6263.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 07:29:58.2277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqcCTReHHQcfq67uQMbwd7WYOGSu6OCwqfDvq53n+8ou0tuRgM1fltCXBsAZT5ECD0229NSQw/yx4LPsAWwbvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6524

The debugfs_create_dir() function returns error pointers.
It never returns NULL. So use IS_ERR() to check it.

Signed-off-by: Yang Ruibin <11162571@vivo.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index e9332abb3172..808eb51b270c 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -860,7 +860,7 @@ static void debugfs_init(struct mgb4_vin_dev *vindev)
 
 	vindev->debugfs = debugfs_create_dir(vindev->vdev.name,
 					     vindev->mgbdev->debugfs);
-	if (!vindev->debugfs)
+	if (IS_ERR(vindev->debugfs))
 		return;
 
 	vindev->regs[0].name = "CONFIG";
-- 
2.34.1


