Return-Path: <linux-media+bounces-28450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974A6A682DF
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 02:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB7671770E0
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 01:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EFF24EAB6;
	Wed, 19 Mar 2025 01:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="OYxv3XcG"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021078.outbound.protection.outlook.com [40.107.42.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EF224EA95;
	Wed, 19 Mar 2025 01:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742348753; cv=fail; b=baM37SLTN+yQoXLW/FLiktrDeaal5gGtPOEcJkV0GeL8UG1423JkWz6t0rNaxv3qEeCXFu/Xn1WlGNl/KXwRWLVnVFhDft1XSOQYUiSwO/CwF3MU9OGd+cFqmIo4unZqEBI/NlQbXzgJHEG9oilKXcsYmE3fGrcH3GI9kXtIcmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742348753; c=relaxed/simple;
	bh=wfbFAPx2zyJ5gRJkVCOimQAXUKMBWwDkb5iqSWltzGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g21YvH9dFZXJeuSZPCZiHKPXtSrsAlSQB3ubeUtNwgs6VK9EFLBVUzi2kXWPqAot6nimyxNelOiUhABMVKlIQXuA3q6swAVIpn8N3TnrYRTD4y7T3apXc78ZhAtdVArmxvt2wmdx5iAiB66bsGz0qdiSUVe7EqEbFGYVsnwj4xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=OYxv3XcG; arc=fail smtp.client-ip=40.107.42.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySkyrySPnls3BnVnpucqPhf8EWvyz7GgWyDjwa+nR2/ug4fqONcX2AYbwN/DCMMapQvrPkw5CRQOfEVZ86mzmmQ8HJVVr+uaLd7nFg4oiz/Dx93aOpdoONXB5UcSdWY9ib+2IZxyB+3yujQggSv+gOHbXGqgQZNR1eoC33eEQjcH+ZBjcx3A6SUM9ec9lBm4WGKhv1/a+OY3Q0Yr3NSeReqV4KaLEZdN+4UoGtKpqDlkaPVI7QujZuogJLnIrBfCmqS/2g+6W1Dl3HPWQ980WdQ9skq3LvC9vHdlKWStvQ4PE32yrds9MrwhWoZgrw5sCnxxhe4xP22pp4U9YEb+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqi1PMwf55fX2C5OSsXeS3X6c+CDUQ/6TfMaWOjBcWM=;
 b=lGwBJPWWAX9vswSclsd/dlSJCCdmWZJfCzGA/z0d1annD6TqtxoqlYxt3+awi1zN/6wYHrjOMzQnXCSIhSswlE+f1dmeHeI60IYNxj0ytGGTXGkHgT4X/ITIuDVrpPt8akZcmHDxrDAyYTsEYFsOmRD1pTyjvECrQbs3ZI3fA8oC82xvD6NKlXId1cAnzrrenhGOhSOJH9faSzJ4RCXc/wf9GqYAhirZA6LJD4DT8nAJ4jKHYGJDuMs4l8qaNHxFRCrM2gL75D6d0m/3OADH41d1dFGoIBeG/LQIYPYFznbBLvKBu6uP1plWz27m0Om2tw5B0Z1eQfh9io9KAB/3mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqi1PMwf55fX2C5OSsXeS3X6c+CDUQ/6TfMaWOjBcWM=;
 b=OYxv3XcGReoUIwSiWz2PVxdlLPOiE6IMdHusgauyaVcBduV4qvsHLNOwhZrMr9vp8VWiggN0SKd5TbiVSEnzOInpuEL+3N79jfkVolITFBbpxS71+M7r3oJOUSpZhPONSip35/DExsNZaMVEE9RIECuOMEyiABRuFvERoPm0OPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB2121.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Wed, 19 Mar 2025 01:45:41 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 01:45:41 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v0 3/3] media: chips-media: wave5: Fix Null reference while testing fluster
Date: Wed, 19 Mar 2025 10:45:30 +0900
Message-Id: <20250319014530.61-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319014530.61-1-jackson.lee@chipsnmedia.com>
References: <20250319014530.61-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0060.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::8) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB2121:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ad9e66-a6bd-473f-207c-08dd6687c191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+0ts3nWh/q/Fm/jqeK/G3TasZAY8PMp5W2LrHW90Ta5O3WgKgjNAaLwPigvG?=
 =?us-ascii?Q?uCsPcaDsBDkyh5MRmpG3y8d7HRZto0+GfE446BS5Yrk/9p648mGTJ5+DPiDf?=
 =?us-ascii?Q?1HV8Fa9oLvmwcQhkFUFpQh2cj/G7GA50P+ZyHLgTY3BXklNilNrkcM4AYIrR?=
 =?us-ascii?Q?d2W1W0wJUh+zjg4j842YMDEinz4BFs/rh02ydFbA/T9muGzDozDje4daFNCX?=
 =?us-ascii?Q?KoEkttXr24rm72ds1PEZni2pLS8SCqPuCVJ6tgmBZ9SU3EDnd023f6WERtmU?=
 =?us-ascii?Q?Z0+T09BzIhyMxd2Nq1MJaRCgjGUZUlFqMAUiqikiCUw83x2Er2GueO2rlVaA?=
 =?us-ascii?Q?sn3czuDw2QElv6zs5h2j88dWLu0AwxC1duN6TenZyz3P6cZ7Pk0SeCqFG8wR?=
 =?us-ascii?Q?5ueL6uB5dRlvyBbEElcD9zPycArneRoTl3RU+RgzFg+In9VVtk7yAOgagT+I?=
 =?us-ascii?Q?Jgx7zimUWszApYcvufhO3rtndV2h08yFCI4CoSDGxCFKRVBuAzM8s/EQrDXd?=
 =?us-ascii?Q?+srB5FFApxb07pNl+TDA8qXMmeFLKNjKelmeigj1q1+zNAc95dL8YcFZZmPQ?=
 =?us-ascii?Q?ofAIBHGwNySAcb1sPi2drmsk8OEtIvrLDxizyYUI7+i/bIJqJ8IqlZfSVNst?=
 =?us-ascii?Q?YT2iHGEZDjtgYNASibQla9Me9C3Dvht6LjEkXB7Ld37X7SOaiHsOqQ/XOXx1?=
 =?us-ascii?Q?jhB+fX9toHzG1DIvv97ygO57Bl+auPhl1J7O+GlP3oQl8Pxfur1COZbNoRMw?=
 =?us-ascii?Q?HkNYUfV+I+b5pAtMACyrl3ghjVOF3bcAvdtEXWROa5xBviRma1lulU/gm6Go?=
 =?us-ascii?Q?p/B8jlkjz6I8Nslk/fg27gdbjcBSPApLVK76n4S3Gv//osj1hPVrb4Z6j//T?=
 =?us-ascii?Q?kaSg1CK/mrC4cEjEvbULJ5f/IM00Qp4WTN/D54ks48/0JQ1Blgu17KntTHAJ?=
 =?us-ascii?Q?ZOYgIs9l8pKZHyALACEyUnjeGj9u6C/vdyb0+mwu7/6iiFkVaWlDfAl4L9wu?=
 =?us-ascii?Q?BpZnG7p83ZUQXfPJzk6ekVo2ZNwXb3RfFI3TR1/gl18BsSWwl3jpz9oRVzHz?=
 =?us-ascii?Q?Esr/18QwFiqNHoECGFjsSH6+0yWrhakcjecQnhi25VTo73RZtHfJQOCKIwz2?=
 =?us-ascii?Q?OSVnMtJOOY/ktOKMunWvUCue/yEMFbph/kgAfib0cidGb0CmjObjYwBXmrv0?=
 =?us-ascii?Q?jTFnFv1Q8uXw0JLBtrgHpmcWVpNrGVRBTGnkbk2hIqyG/8t2i7npYVcAnrWH?=
 =?us-ascii?Q?4C751uVjos2E0wW6ZL9a7oFh37nJInIsyBgxU9DTXdGmef8xpcyqWBl5CQew?=
 =?us-ascii?Q?Z387MG3q58dZ5p2YlWQJ3lRuYS4kg4481X7Py1UfekbxbR+XBazqkZvNE1tL?=
 =?us-ascii?Q?BrIRIbTq2HNwSJt8j1gw4tBHMjFrhFem9cdMYpjzB+mZuJtljRGB2tK7C7XS?=
 =?us-ascii?Q?S8dL4PublduvlHn41WbY9sexyms8xDkY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SNwvBh9ZqH7Xomm1uinEN+gjxI36ofl8FqAcTA9T3uqSM/vX5O4aWwbjCk6d?=
 =?us-ascii?Q?QtITnqBKxAysaIjA1YEAUqICrLQ7KlIYGffeqOQGVC0s0A4d+8knIQX/A6M+?=
 =?us-ascii?Q?jVsl00R4XlOE+A2E7Q48MH6RAMBqgPsKAusjxd8wzVdjFNhG1edHARo4oOVz?=
 =?us-ascii?Q?Y8IoBI+2MslK30CzCE/NKWy9cSZqyKddlm+rms03OHvzoXb3vVyv5jEOE+cN?=
 =?us-ascii?Q?sPXt4an5J/L9f/wK8j/2s+Qtstv1qrMXxxwicYen8P5lex6Ph7Xtg+270j88?=
 =?us-ascii?Q?Es4LcfFqxsMlS/B0s0cvmDxW8y/Tn5YEjyIJ0uLojYYV6w8qek6lFsODihdZ?=
 =?us-ascii?Q?JtLDbb3ubqhuwbn0gU/wMqL6bsP1JK1/EwW9rcy8wiDIgNx7zJlqcPT0Jcms?=
 =?us-ascii?Q?MvX4133TxboSGiVRG/Xho54o7Tm3KLTa6Mp+gFXLeubX3YsJ6XEJtGScNNMY?=
 =?us-ascii?Q?CRnZKZFBxZ81KUD2wCTpUn8UAfrpKZ7ZlZs+f2C7SVS8seSbi1yQ6VWHSQQF?=
 =?us-ascii?Q?LbaRzJ8pQv0v+pI8B1D9nLueN2Grwn1LYnTdeC28lsRspNqWYwEHbFPM0Hxl?=
 =?us-ascii?Q?1uv6OOsQ5KoRmh9256J9euOksp+CQsVhC9N+IIIWzl+oWi0lrapfsrjmhASD?=
 =?us-ascii?Q?I0UVT8xZ9hOdVTN/mHkWxvDkkTweWNlUsouik3yv16/JlH0xTJFsPJ1C6z7V?=
 =?us-ascii?Q?ckBDlLu2+ClYDOg5AQQaQWa6KJ0h/BpMFpTfka7eWo6dLEpzPzbc5+nZpwLo?=
 =?us-ascii?Q?OMnw7p7+6/OGZJY1WyqoPgttZSjQUWePhBiUBjlwY2pbHOlcGsSqqnFYo6Ij?=
 =?us-ascii?Q?EmCcZXR7etreI7RobQpkt2fUtSlz96IsH+tm0MYDb9KxY33Ybc6IKtjMPT0o?=
 =?us-ascii?Q?7alpMMr1+4dS30XQ+QezAJQvxcjo82O2sNydrcc/K+tOxf7MyFCylBym8RWL?=
 =?us-ascii?Q?mvEt524IA91o3VkDu1lkb7e5vwc+28kk7Ab5Ykz77wAn84YpShYy65vutBUy?=
 =?us-ascii?Q?XLVgZdKly8mjoBzqwYrrvMdt75MutSYahXrPPBBr/tG6k+6X66u8jA7n25TQ?=
 =?us-ascii?Q?lGqO6oEJtWhRZ30qZyiCbeSEFVDdxeMJUpvQ/dbONJ2VtKW+GUGKUpaIxCDB?=
 =?us-ascii?Q?lHdR2Wx/wstzLq8G2WefVU2p9SrJq75LSr3hLX/22Ehz7HmZd4wPYxLE0o9k?=
 =?us-ascii?Q?2LUvxS4hiv4C396MpX3Xd46yAmq56ctlCVNldY4IVzA7oTiOpiSs4e7yiDDi?=
 =?us-ascii?Q?OhspJbUd6VtQGugCCZzpq9a6edWBToEdMX+B3xigT7/l+Ap2vW/Ggb+PiDXK?=
 =?us-ascii?Q?qkcPjOOcdUHC49gy50Y2Ir8R8BnPB7dB+i5rmxXaUepEdecTDtVrn6DafjNF?=
 =?us-ascii?Q?wjC8Y/aOlQ8u8y5DeiRsdFwty1LGNie9Bsv5+KcnW8NQRaXSv+sBWDfnqywh?=
 =?us-ascii?Q?DqyDe5iSbqyXvYDjlaZLD2HSKxEsrePEFkWAwXwRmx5/JR5RQpT9wNqGCYac?=
 =?us-ascii?Q?dKPcOCvOgJQOBpZBXKOu1ek5q3ltB9cxwJneMuvLVXfWPnEayvWJMVh1pFKh?=
 =?us-ascii?Q?7A5YfnawRxt3OYLO9A03jIY+cAdGII4arab9jwWXjD6XlsaiugrFRwQfHpox?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ad9e66-a6bd-473f-207c-08dd6687c191
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 01:45:41.1863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPRuJoa/9J8MV/Mky1+zcy90Wjdh34TmkUGrZzT/uR/CU6Yvg5YKaSCsmUHqDafy48zOu78p3L+AaUNvz+iRQ5lFUQhOcqW3AMI5xCfCaLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2121

From: Jackson Lee <jackson.lee@chipsnmedia.com>

When multi instances are created/destroyed, many interrupts happens
or structures for decoder are removed.
"struct vpu_instance" this structure is shared for all flow in decoder,
so if the structure is not protected by lock, Null reference exception
could happens sometimes.
IRQ Handler was spilt to two phases and Lock was added as well.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-helper.c | 10 ++-
 .../chips-media/wave5/wave5-vpu-dec.c         |  5 ++
 .../chips-media/wave5/wave5-vpu-enc.c         |  5 ++
 .../platform/chips-media/wave5/wave5-vpu.c    | 69 ++++++++++++++++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  6 ++
 5 files changed, 86 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 2c9d8cbca6e4..5d9969bb7ada 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -49,7 +49,7 @@ void wave5_cleanup_instance(struct vpu_instance *inst)
 		v4l2_fh_del(&inst->v4l2_fh);
 		v4l2_fh_exit(&inst->v4l2_fh);
 	}
-	list_del_init(&inst->list);
+	kfifo_free(&inst->irq_status);
 	ida_free(&inst->dev->inst_ida, inst->id);
 	kfree(inst->codec_info);
 	kfree(inst);
@@ -61,8 +61,16 @@ int wave5_vpu_release_device(struct file *filp,
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(filp->private_data);
 	int ret = 0;
+	unsigned long flags;
 
 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+	ret = mutex_lock_interruptible(&inst->dev->irq_lock);
+	if (ret)
+		return ret;
+	spin_lock_irqsave(&inst->dev->irq_spinlock, flags);
+	list_del_init(&inst->list);
+	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
+	mutex_unlock(&inst->dev->irq_lock);
 	if (inst->state != VPU_INST_STATE_NONE) {
 		u32 fail_res;
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 8349b37d0106..8ecd19d0178c 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1868,6 +1868,11 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
 	init_completion(&inst->irq_done);
+	ret = kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index cf20f774ed1b..7f1aa392805f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1760,6 +1760,11 @@ static int wave5_vpu_open_enc(struct file *filp)
 	inst->frame_rate = 30;
 
 	init_completion(&inst->irq_done);
+	ret = kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 5948a18958d1..1a8eec206f53 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -51,8 +51,11 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	u32 seq_done;
 	u32 cmd_done;
 	u32 irq_reason;
-	struct vpu_instance *inst;
+	u32 irq_subreason;
+	struct vpu_instance *inst, *tmp;
 	struct vpu_device *dev = dev_id;
+	int val;
+	unsigned long flags;
 
 	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
 	seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
@@ -60,7 +63,8 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
 	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
 
-	list_for_each_entry(inst, &dev->instances, list) {
+	spin_lock_irqsave(&dev->irq_spinlock, flags);
+	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
 
 		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
 		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
@@ -82,14 +86,22 @@ static void wave5_vpu_handle_irq(void *dev_id)
 		    irq_reason & BIT(INT_WAVE5_ENC_PIC)) {
 			if (cmd_done & BIT(inst->id)) {
 				cmd_done &= ~BIT(inst->id);
-				wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST,
-							 cmd_done);
-				inst->ops->finish_process(inst);
+				if (dev->irq >= 0) {
+					irq_subreason =
+						wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
+					if (!(irq_subreason & BIT(INT_WAVE5_DEC_PIC)))
+						wave5_vdi_write_register(dev,
+									 W5_RET_QUEUE_CMD_DONE_INST,
+									 cmd_done);
+				}
+				val = BIT(INT_WAVE5_DEC_PIC);
+				kfifo_in(&inst->irq_status, &val, sizeof(int));
 			}
 		}
-
-		wave5_vpu_clear_interrupt(inst, irq_reason);
 	}
+	spin_unlock_irqrestore(&dev->irq_spinlock, flags);
+
+	up(&dev->irq_sem);
 }
 
 static irqreturn_t wave5_vpu_irq_thread(int irq, void *dev_id)
@@ -121,6 +133,35 @@ static enum hrtimer_restart wave5_vpu_timer_callback(struct hrtimer *timer)
 	return HRTIMER_RESTART;
 }
 
+static int irq_thread(void *data)
+{
+	struct vpu_device *dev = (struct vpu_device *)data;
+	struct vpu_instance *inst, *tmp;
+	int irq_status, ret;
+
+	while (!kthread_should_stop()) {
+		if (down_interruptible(&dev->irq_sem))
+			continue;
+
+		if (kthread_should_stop())
+			break;
+
+		mutex_lock(&dev->irq_lock);
+		list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
+			while (kfifo_len(&inst->irq_status)) {
+				ret = kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
+				if (!ret)
+					break;
+
+				inst->ops->finish_process(inst);
+			}
+		}
+		mutex_unlock(&dev->irq_lock);
+	}
+
+	return 0;
+}
+
 static int wave5_vpu_load_firmware(struct device *dev, const char *fw_name,
 				   u32 *revision)
 {
@@ -224,6 +265,8 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->dev_lock);
 	mutex_init(&dev->hw_lock);
+	mutex_init(&dev->irq_lock);
+	spin_lock_init(&dev->irq_spinlock);
 	dev_set_drvdata(&pdev->dev, dev);
 	dev->dev = &pdev->dev;
 
@@ -266,6 +309,10 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	}
 	dev->product = wave5_vpu_get_product_id(dev);
 
+	sema_init(&dev->irq_sem, 1);
+	INIT_LIST_HEAD(&dev->instances);
+	dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
+
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
@@ -288,7 +335,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		}
 	}
 
-	INIT_LIST_HEAD(&dev->instances);
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
@@ -351,6 +397,12 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 {
 	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
 
+	if (dev->irq_thread) {
+		kthread_stop(dev->irq_thread);
+		up(&dev->irq_sem);
+		dev->irq_thread = NULL;
+	}
+
 	if (dev->irq < 0) {
 		kthread_destroy_worker(dev->worker);
 		hrtimer_cancel(&dev->hrtimer);
@@ -361,6 +413,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->dev_lock);
 	mutex_destroy(&dev->hw_lock);
+	mutex_destroy(&dev->irq_lock);
 	reset_control_assert(dev->resets);
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
 	wave5_vpu_enc_unregister_device(dev);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index 3f6e37b6be86..6fcaae62bd73 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -8,6 +8,7 @@
 #ifndef VPUAPI_H_INCLUDED
 #define VPUAPI_H_INCLUDED
 
+#include <linux/kfifo.h>
 #include <linux/idr.h>
 #include <linux/genalloc.h>
 #include <media/v4l2-device.h>
@@ -747,6 +748,7 @@ struct vpu_device {
 	struct video_device *video_dev_enc;
 	struct mutex dev_lock; /* lock for the src, dst v4l2 queues */
 	struct mutex hw_lock; /* lock hw configurations */
+	struct mutex irq_lock;
 	int irq;
 	enum product_id product;
 	struct vpu_attr attr;
@@ -764,7 +766,10 @@ struct vpu_device {
 	struct kthread_worker *worker;
 	int vpu_poll_interval;
 	int num_clks;
+	struct task_struct *irq_thread;
+	struct semaphore irq_sem;
 	struct reset_control *resets;
+	spinlock_t irq_spinlock; /* protect instances list */
 };
 
 struct vpu_instance;
@@ -788,6 +793,7 @@ struct vpu_instance {
 	enum v4l2_ycbcr_encoding ycbcr_enc;
 	enum v4l2_quantization quantization;
 
+	struct kfifo irq_status;
 	enum vpu_instance_state state;
 	enum vpu_instance_type type;
 	const struct vpu_instance_ops *ops;
-- 
2.43.0


