Return-Path: <linux-media+bounces-16552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06102959568
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 09:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33311B25600
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 07:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8D61A284E;
	Wed, 21 Aug 2024 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="bdCMbRyG"
X-Original-To: linux-media@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010065.outbound.protection.outlook.com [52.101.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C014134AC;
	Wed, 21 Aug 2024 07:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224284; cv=fail; b=jffJ8vOAydMn1SmQ1Wz/gnUfVJi1ilLkHmB9J84EXcolSTEej+B4ryDZyHU9SiE+wqa8vF8eK4tu0mm4AtzCrT4EgZx87ciw1FgAxfSIrANtMpRiDUnHIgHy3ftdXJa0ummzz/Ft1Moa9G/HOrRdIM2gLc4hkJb8UU2XyZ2G9KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224284; c=relaxed/simple;
	bh=BdfxgOVx4ZBoKD/zq7AstNy0V2eaTqP4j7tysRMJpFE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fbFmfuc8DDLNHmJWUDewEkT5+9TZkbnetTvYbioMwqK1gQLTAcQrNo3B+VEOSTKAz+Npxb8vmRQvhHgmVbWAkEn4mVtmy4bPRmEx2v2iQPbojITJN180UixS6417UCMWRQUq6zbe1kTjUVoYI2W9px7VEh7y9Z/hxBZcPOGy/ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=bdCMbRyG; arc=fail smtp.client-ip=52.101.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLi++ypHmLxr9rKwNZwFn1yVXIv04kI1NeI1CIiYL7PUJmxpc8X6JSVrMrVq7/IhGOVYQXQU+cNMzZz/N64qrM1gigQCGALfZNmDrMXbbBcimRaAGPO6gx3CvEbaN74VJz4yN+BzZHBbPkeo7O7OyXEmhuOz3vhc16dmPNCZp5BW71+dVLRhexbULCDdQ7eB4yD7u7XY8iAbdeEz7lOCoBCP7tieixfo+0gzsWlO+bX18WB+2sRLbBcJqe8lbHFgAWBkQtW4WQjmmDcpmY5wWLFy813u8T0YtdQToQoUDCznmplP1LD+mn0oSZaRB6Bftl+9RRK5q/8clrC5eDElBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp3jq8oGhd/A7FLWd/6scn+l0W1yzqeYykj3pgESd8o=;
 b=atPUP22wRiVg3Hgw9O4EeoGkCQRm2uQzv5Cr8R1dqc8AJKzwNbe7Wh8/4DcyNjHoK+Wp9mO4mEEeGlae1GmJ05B4fidEmnYWuXs6nLh1lv9K4DR2ygsvSjr4yD4mEIKvwyBhCS6Chfufs8eXcrauJUyclYY2TTTMCarA4MDKWpLCUP0j+X2GDw9/vYN/ex8gA+ERikKFmvbt9o2k4KgszDi97aFsrmFudLFoqNBmelLzenAYryvM9Cfx+G+lY9v9UHqISRN+iTI3YibK1rc3rY9xLfCW3tZ1K1kmeC0if3k3CD6zlk75BY4/3gOwpT7uxp6JJ+jNUf79tVWnewjEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vp3jq8oGhd/A7FLWd/6scn+l0W1yzqeYykj3pgESd8o=;
 b=bdCMbRyGwyqXWTIXO7nF/0BnIVJzDrPEC0LlWFJXnKSwEgHTGUnRyTXjM6UThHHPFinNtU56OzVSgzO82L5y6GlagkpNLiMOe4RZYQF1mkYOm6K3DiJO1K5puviv/CdXCl3J3LNzuAmyWgLcmLR6tLex7uZgQAz0keHDEmY5iJWF09lX2e5AFeHYnpp3GoklB56BVNM2YsDUJiEInIb2/svxVeH3vOOoi38aOsSsFbvY3E/iOsnfgKtQCZIvQL7HY8jOK8he/hIk2Ohm1mk9fb6HdnJJIc+buRHmDi+tybCi6Wh8Ss5sd+JwJrzKLonaCDKPYuYiFJ5ee/TpSA1UHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com (2603:1096:400:33d::14)
 by SEZPR06MB5880.apcprd06.prod.outlook.com (2603:1096:101:e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 07:11:18 +0000
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268]) by TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268%6]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 07:11:18 +0000
From: Yang Ruibin <11162571@vivo.com>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Yang Ruibin <11162571@vivo.com>
Subject: [PATCH v1] drivers:mgb4:Fix the NULL vs IS_ERR() bug for debugfs_create_dir()
Date: Wed, 21 Aug 2024 03:10:58 -0400
Message-Id: <20240821071100.7839-1-11162571@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:404:a6::14) To TYZPR06MB6263.apcprd06.prod.outlook.com
 (2603:1096:400:33d::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6263:EE_|SEZPR06MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4ddb7b-dcc5-427a-947e-08dcc1b073c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bHRvzjoKUIJEruyJMWxIxVS/+SRzl8mY68BiwtzLhTmKOLn84rtdwk4WtzOm?=
 =?us-ascii?Q?W9QyZFapDe5IJ15Y5jhU1hR6rleF9C9Z6E4wA3YIQC3t6MozxPriXoE8LF6u?=
 =?us-ascii?Q?7nAF5wOl8h9VKFyKh632cGE4kiAeT76Gj+ifCQETf2bzWCzsMz8niE3TR8ci?=
 =?us-ascii?Q?MMmddRw84Smmg8iwlxZhZowcuMl8ei9sx00+s64UbCwpCKQAmdtfMcDRNUH5?=
 =?us-ascii?Q?PNtp1Ketx6P3REhqs4pwVJPst3LRz3frenAIwyx+yI2DNByZihRWHAqI9CtI?=
 =?us-ascii?Q?+pE4keB+lxjbo3tfXwgzXjhVa/YUrO8ue8EJo7rlq7sUMBp4TtT0iY27xG55?=
 =?us-ascii?Q?yrTKCXvwa7exUjcO0t2s3c0GTSkF4c8XooQrqtmjSQJBqALwEwo+Lzb9t5d/?=
 =?us-ascii?Q?2J/Qrm1OYeHjA5p1kx2dN03L26HvZeDb57ppKxXaVJ17XwSnEbNDKRC2R7xU?=
 =?us-ascii?Q?tBfsTK4esF+j7L4l8T6F8RpotztL7raCPTgyh5zuQe5n2+SQYT2tKdwQb2DU?=
 =?us-ascii?Q?2Z5cr4pfevyihj9aNu84m20rkHbVHvRw1sRrRjWz22llVbtOC1/smL6CrxlT?=
 =?us-ascii?Q?utL7FN9WizZa7RvpWq3cK8f1KkH6gJ4r8whN3zHFVldSe0fNjot/kXteLlIw?=
 =?us-ascii?Q?jHAKKHHjadOrNYnRN+rkONjeWx+LgVZbHgT76Tb/OeQzA4PJFXeOkJRyhOSN?=
 =?us-ascii?Q?XeUqfwNPsh+v5M8y7aCCdARqL+WkCxb8UOqwBf9SLct6w2lmzK2ofaUlAKkm?=
 =?us-ascii?Q?v4XCo9WZrtBbEJIps5dDUMYJfJPNHpsoVi/NA3Gsf4bw5lPNDZV6nc3yzSqt?=
 =?us-ascii?Q?6Ws2Fy99I2LC94HWCd55Hw7AL6kzQZ63naUNGW+/3tY427kJQMU4WegvbKON?=
 =?us-ascii?Q?517jqUNN09JgG/LagZacuZ9nODLqSKKzv1LdM5GWzKDnlvCTZvStslQMzn8C?=
 =?us-ascii?Q?ph0dtqSRy+X5IVVsDmfTu3S8jP4ZM4X/8QGfOENkcQkCQm31x1nizZ/lFUyS?=
 =?us-ascii?Q?A8dFSUTJzWBdk+FkuKa5nmoYHoCRp4mqYuN5OVO3Zkl0ZU/vAP1hU/AcHKWS?=
 =?us-ascii?Q?gqh1azC6at56C7suOe+AIaOWETC48DiF13Ya9XXABOLJXJ+Ccqa823msY5vi?=
 =?us-ascii?Q?motLa8nCOz2v3wBnsAkdB8I9u30KoUs1pEGO9w9JSt7FBBdkYE/1MJ4bibYC?=
 =?us-ascii?Q?FrwqA9GC+lMFOH0dFKk8rxs22qPjlJf0a5rwQnTo/agqg8zaMG7SqRP/YLh1?=
 =?us-ascii?Q?UrKqUDbfQ7UHk0YkEArIhkKLtywIRwk68YX9VygYYOeM43ECdDC1nEhGC4aq?=
 =?us-ascii?Q?NMWdErzo/rPeDFsc9hQ09KKh3RCZY+EAO7XrDP4rX/tM0bzvageEhP6B46Qq?=
 =?us-ascii?Q?tiSHT9VL6Qed5mNMbHCMirga/eNHTF0PKxmJRyFmIvP8LDpXflp/XP8f4gFU?=
 =?us-ascii?Q?23JhB9jNA1o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6263.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iHsAaTkUyErOOSumYEz06dEhc3ilm6dQZ5pYpZBYaOnxZa11uVDp5i1Ri2Sn?=
 =?us-ascii?Q?dYQmamShxnzA53aPeHrrFz1Ktw8YiBwabRsC2c2Q186ny/LaE6iCR3HGxCQh?=
 =?us-ascii?Q?P0zQ9uaPrPKgcnD2PhM2oLFVjAONWdbXA68TUm/89gMSWSOTsUwUotl8+ruQ?=
 =?us-ascii?Q?k7AdT2Ho0Fc1yflBZ26wcvq2QSGlxwh22WD/fkB3rDMiMxQOezhKYQBwyMAr?=
 =?us-ascii?Q?dE502rQB17CNNcK6HIiPS1tn3JeFj+Zdg02fhuofbOA1c72pNmO0cAbgsIY3?=
 =?us-ascii?Q?dzdbT7dNWS909w2yN3rmORjZ3drcGrV+jP7lhzmhG3cUBQjLZMe1huMzEV0p?=
 =?us-ascii?Q?wCdHd4TiG4adcaOKyDGeRKXl7V3EM+MLDNBGWplT+4RDSpZRM1Sii7EDeOno?=
 =?us-ascii?Q?jxG7DuCcsE2r+S4Tg3Rl7LtkX7969+Nz7lvjkfhUr2bMi3wOwVjr4q9Po73N?=
 =?us-ascii?Q?rKhvwV1bsttIsJcJDtjcnLWoQHr08WMXWMrHozFEXQZ1PF9hRh+jYDg3FLdh?=
 =?us-ascii?Q?5v63cvAOTJChVX3bz7yTuw9WZ9TlhKNeRtR4rpKGYHzwmhwCRsPcCgHQK4BG?=
 =?us-ascii?Q?UsdxcWy9JnvtoePWlGmgnUfwS0uDoXg+UM5Sqc4JCTeNWAGg1t4qMGUCjOOI?=
 =?us-ascii?Q?eTJfpYmc8YsHTv3y73BPSL/thg+AtlkN0G6eXtiRcTQbLgN8xRB29Bja0M/K?=
 =?us-ascii?Q?y71zhEqLjynPoyazsJD11v4vkDnVSzgFJ+ghN/6Vc+vKp35lVr4HhfpCG0Al?=
 =?us-ascii?Q?T0pL7SRz+xNZd6rL5dM4Oi/hYIzNzXK1jT7/QaNMzwIbXz/+/SdjhNj/mhfd?=
 =?us-ascii?Q?eIEiWH19gHp+jPfdCDrLwME1NVJBkdK841p+yLLHE4nSIJ/8BAthsf2ZEQPH?=
 =?us-ascii?Q?wyI28MVGhrMOG3Sv2v0Q0RoUV+LqKPIkJydqAFwtw4W9E5C0/Dozsm2iHN+w?=
 =?us-ascii?Q?sjKNx0usrm6Oz7GoW4WyibsVrFiBVK5rxKLDsb2V9SiTmbE+sHhwbgy5i3NN?=
 =?us-ascii?Q?qCgME9g+reo7WRILOhcH7h3TvVmLVtLwMnudWKnp8x8x1nndmyJiDQNNHurm?=
 =?us-ascii?Q?tnMyj5g3/rZ/f+lXcNmlCTF0EntzkSyDsQYK7Hylotc06OhWMIHwHqiMv9pR?=
 =?us-ascii?Q?ykS2A+YuEwyDDEV3TVxoA7vLuSma8B9KfNxTwxcLlgoCivKl5XfeyQvQAufW?=
 =?us-ascii?Q?zOfejp3XtdEC9x5GUApoFRPgSAj2PwnjlDL/0JGYgQ+omiZJWSyAlU2C6Ewc?=
 =?us-ascii?Q?F+Q2iUR7v/LUknsJ/6KQlNqJScmSnI3bYUG3zsjyeYgnnfsV63VqmjBkHprQ?=
 =?us-ascii?Q?JxVLDAOrCQ8lnRe1cZV+vgznBkmYC1waiv0l6ux5NwwDNfcn9KuMmidN8fyg?=
 =?us-ascii?Q?TLukqzudzZ8n1u8o+SjxDd/dzMnz5k8snmOQn7fWW6XcThufKzbgs2SGptW9?=
 =?us-ascii?Q?FT8EcyfKcRyLmPMY395f6JwGBA2K5XBW3IJ2QMRcuPcCz0eAPyRbIXIdNn3k?=
 =?us-ascii?Q?6p5QkB07F5qflZzzkoUADMPM/OfMdtjJVEvnAShIM3khluZPPXA/uCTNpZS1?=
 =?us-ascii?Q?diT/FDnKZidvg9VDEKBiw0ttKALSBYpKW+KUKJNK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4ddb7b-dcc5-427a-947e-08dcc1b073c0
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6263.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 07:11:18.4202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHX9eScfc2emccvAPbKSXvSuwtWtTlDEYY7L/cvqNgwCXVxTG8bRMnyqBUcDZG1nFjbwUALu3r2lvl7JvVWjSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5880

The debugfs_create_dir() function returns error pointers.
It never returns NULL. So use IS_ERR() to check it.

Signed-off-by: Yang Ruibin <11162571@vivo.com>
---
 drivers/media/pci/mgb4/mgb4_vout.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index 998edcbd9723..348c8e01fcbe 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -683,7 +683,7 @@ static void debugfs_init(struct mgb4_vout_dev *voutdev)
 
 	voutdev->debugfs = debugfs_create_dir(voutdev->vdev.name,
 					      voutdev->mgbdev->debugfs);
-	if (!voutdev->debugfs)
+	if (IS_ERR(voutdev->debugfs))
 		return;
 
 	voutdev->regs[0].name = "CONFIG";
-- 
2.34.1


