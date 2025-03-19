Return-Path: <linux-media+bounces-28454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A64A683FC
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 04:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1C743B7939
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 03:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FA02500B4;
	Wed, 19 Mar 2025 03:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="A5yqrUms"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022108.outbound.protection.outlook.com [40.107.43.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61E224F594;
	Wed, 19 Mar 2025 03:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742356256; cv=fail; b=f2fRxMwarJw9B5AzXODBMsVuBcnZiR1ERFw1J10rzzRRBcwZMIx9uH2VIA7hHMLNmnOEhXp5WylWuLc6AcyzLCDk+M66AW761Zk0AmPWRXTgqkDkrlR2dFP9jKegrotq7ipikQsdcUX80WINfxt9G3TIsK3rwHzI2gXQV4/Olh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742356256; c=relaxed/simple;
	bh=kfv2KXRFezh74wVkyT8AM/nGrknV7Tw6RPGF3Os/QvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HdKjfGrDrGDhhwHL3RqbycwCfeI8mq+k4QyPQeCFhqvwRBpuFBAG9uUAn83GduORx5iluhFQM6B5a3ftF5tiKu9WMvcSamQGGUgInHHdFJlPs7gvDvPfmuSKd/VPMGmk0EUUTN+xZT00mXB7rVYXuvAS0OFOZ0f8N1Y103sjZ7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=A5yqrUms; arc=fail smtp.client-ip=40.107.43.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7OfOaZ058xAvdkRvSAsoPuxW7cFKMkEQufbOgW83zIbdIT4xD01KPQccLoy/nO3e2c5JyxEx7heTJfqWhI8kq9p8wSHAOumiurnbKHsiibgP2OA/K6VCSCrju784wYB1hdVCEU5yI1Kl5yDNUzvWZj0aX2nKak5ftrdL34NWy7m5oAJ0aYVzL+K+dhvjdv7BOhKe44tcHT3aVoNmx3JANFWXLAnWVDle+BqymmPismfYOPyAaaTmteskqpyK+2mFOemHqlnQK15JCNncurun1H8ysN4pJiJtCxW14SDVQLyTv79Rf59hBfG5A5yHQ1dKFUxzdCwp5wKGZdtVHilzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6z30Q+2UXaNMxS4uKdeVPjaoSaJTlzXcua8T7qQn3c=;
 b=ywkkECYO8Lch3y/QobQ5gAm8hKV1GgGNLeLSbpaixgcwQ5YAC7zjSNlgKpg4v0XPGdgIyxwdjef4SrbPoMKSk6YDyX0g7m8bX4FBPXjH1sF9Elu9MMDkBjb4gq7yZGhqiST8FXu1JKJwTBT9K+jeYwtuRn/ug5e2LgWAztktRbo4Wi++3AJQUGHsf299jJg+HXG0mSrJE6SWKeImGxI8jBjAHoJyGPhHNjFr/gFaGpWGz7wUyuT+jef58uVcu6D0Zm7b2wMw6Unaen99oX9SS9Bjs/ix4cnzZ1tLe2L1odZvq+ZkuZjy4EM1LEIK6SAOC19Twn1siHQIMwxO4/zmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6z30Q+2UXaNMxS4uKdeVPjaoSaJTlzXcua8T7qQn3c=;
 b=A5yqrUmss/YNjnrZzIxD6ikb+kt0ZN4URq03zxd+HPF+E3hntBXbcWzsNn7QewK7hiy5Ryq3sLYb/qFZ7aY2rP1Ba2U21rDCNQm4/7C0cn0rcSCHODt6Mxo7RrKjNQwHIPd/1HnoV0W36LaOloN9MVMaanNUa3q7kH0hYEzECCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB2051.KORP216.PROD.OUTLOOK.COM (2603:1096:301:130::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Wed, 19 Mar 2025 03:50:43 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 03:50:43 +0000
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
Subject: [RESEND PATCH v0 3/3] media: chips-media: wave5: Fix Null reference while testing fluster
Date: Wed, 19 Mar 2025 12:50:34 +0900
Message-Id: <20250319035034.111-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
References: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0085.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB2051:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ea24ad-fc96-428e-90f0-08dd6699396b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YOoYWYIFvzYjDABx0b4cZ+9wnnrootOoaO4zFrLvMjloFhXel7qnRxqZ2qs9?=
 =?us-ascii?Q?Wh44DAaPdfb50DhICLC0vp/QuFpHvJlYvyXhFqdhmRzZ2jafvc7QtvmbcmMa?=
 =?us-ascii?Q?aCn+z2gFq4uX0PjdA4mjSqgXlLuMZFlP2GmxCiX+pPqXe/ayGgchMIBkQCYR?=
 =?us-ascii?Q?0sB8HR7U0uxMIljO8rNSraLKXXBpHREYG+KjCyttEHR5VJx8CheurWrpEcK6?=
 =?us-ascii?Q?i0IfWnAzXxKldgiect6RgUtNgz0g+k14QED15Js8nDSTamOIJXSVKXMzeGq9?=
 =?us-ascii?Q?xlAjFdhKb+d33bLF3OUT6+XUaUXS/wo3kjAGRCMYZmva+dhvsGIH3kJux/EU?=
 =?us-ascii?Q?NcTIKL/YG8iwfikzKd7vpwIxdlvakVROr3HxI1ACb7qT0h694ZWL957ZyEMM?=
 =?us-ascii?Q?+x4khEe+WdkozkXdlvyvuANGF79ItPayUPHGcs/miXzMo5M9XVIZWEiyXr9R?=
 =?us-ascii?Q?oOWet/+gKFnIq+hr2pQjlqOGhMjUFv5bzkKu+3x+/dCnaYSKS0P59Tex+dZ2?=
 =?us-ascii?Q?bejWGRT/wWPqf/vrRKWvRs6P0r3Djk4zdGrimo+bwi+2GhBElMf9zvL6Yz+D?=
 =?us-ascii?Q?omXYt73UUevUr+EYH9g/lbOFDEPcJy0M9RlqUUaVzKH5EArDJzRtMgLWmfMO?=
 =?us-ascii?Q?7Tw80BGS81wC1xs/LanAqMg7X4Uzlh85DRfa3K8BmLMCX80fCcHY9Ln2f78d?=
 =?us-ascii?Q?1DOVDVEyzNjjeHLHePzG9dzHvVnqDQNSor+bSTCzBFa6sQoZa1DLuEY6yk2r?=
 =?us-ascii?Q?KETd6CqKsfcewHKCbeODKO0n17Xt8ziwDQbVDdRZY4s1xi+zTe1F3igdiM0f?=
 =?us-ascii?Q?nYUCtmDZ0sLnhH0gWg5BdYv4OZcDI7hviCxyEU5AMO6i1ZihVHXK+DGZBfEN?=
 =?us-ascii?Q?Zk2Vm3kN8z/iUbshvaBJOXGpnN4nQdQu0ZkuB4hxha0x12snW4FFac79tK5j?=
 =?us-ascii?Q?evS6zri6EqnNX3LHTGWw96kvc8jrj30d3LDVX2lLqkUo822bWORMZ8cITr5g?=
 =?us-ascii?Q?xnceU5YKTy8zL9al4Z+9B/dZOJzR5X9AqC6nVDDaOT2dyNSAYV23s5CwLcza?=
 =?us-ascii?Q?J1G3wCcZcVzXUGDbBrxXFLcJTGwFaCCIecELUJLqCKqLBOxNIOwDFElbWJcu?=
 =?us-ascii?Q?gtcAFdUartIV+aFgzifQpag+T0EH6gANIdVSaEUhAcCO2gXGvA108D6WQF1T?=
 =?us-ascii?Q?QjNsWAZiDELmhQl3yLnrHpsisboQqfF/WkUXVI0HyLNDreNcS6TNc6Eh6z/d?=
 =?us-ascii?Q?RqGseInmc2B9hvet7S3L92kGPNMn+Cw0KvpAxWC86B879xvF6TS1+iFVDDcF?=
 =?us-ascii?Q?5n9I5EfwO/5zkyoZRcPf0w359Tjt9LF/eSo+ZFwy3ZVlUW7k+mf3QNLkqjxy?=
 =?us-ascii?Q?hPrG7HcqBzCrP1cPGkAxUE1QS27+xU5j2ziJPO2Yb1JTvWrahD18z15G67Pu?=
 =?us-ascii?Q?zw6HiC63P0T09b6PephTwCgJ9jHQmcIG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FnDxHaJFq3BRtNs8d05ixg9SQpZ3OnrbqN1OXxSW1HDAh31uc7cy9bYoke+8?=
 =?us-ascii?Q?sK5/rugWXyU72E07ab4D79l0uMEG6ShPnomnvYKW+B9BI3FjQh6p++yKwKVJ?=
 =?us-ascii?Q?2C97JmlQn1OLxYL7fXqMF/qDo0A+17EZvWYcp1fPS+SXxHubzMjn7AR4858F?=
 =?us-ascii?Q?DAPtOg2O3fk2OsnqsBGEEJeFcHCThsiMg45sEW2zVl0MHs+Kgww4UcsIZKlk?=
 =?us-ascii?Q?Idb1SbqeZZbqPgA5cqmMV6ss58CKtipT3Ozo2mnc+IKNs+Ts96mTtAH0KwOU?=
 =?us-ascii?Q?vQqaU3LP+pUBWFkL50UfNDAgbGP28zS8JToBUtNVlS6mByc+F7HYOYNi0AnD?=
 =?us-ascii?Q?lMgxSsS8u52RNo+RD2X4hS8EPUXvBlqtR3A0nrsV6BPaDMRQrCQpZCAQ+iFg?=
 =?us-ascii?Q?gycTGjnrF7xhvlOFXjrmxwkO4McxxbF9vp4ECspWdvHz1uYxVGv7kPFWJr1M?=
 =?us-ascii?Q?Sh9IvLi+j+qfg/vDpDWKABZllIBFunkzC4L6YDYJ5Y56fsJydu7BiJ1mx1QT?=
 =?us-ascii?Q?LQ1M00csXO8j4VTp2GwxTwmWZ3DyRhuQ1rHkfMPuxsVaX1gSoObTr7ucJEA3?=
 =?us-ascii?Q?sHaSfDV6jOs0rJwhpHPG5h1BVQeLnJKd57gf+l0UF0uYyB6JxyW199r5iLsy?=
 =?us-ascii?Q?smCIGs7q+tE/LsfWYN6tWqeKwr0ybxhvq12AEJZUI4qQcu9oFzJ8CpE0i/5z?=
 =?us-ascii?Q?o32nocgcRe8j9IursBVa6LhWdIxCrH2zNK9R1RfWqG1wusV9VjTb/SsxSHo0?=
 =?us-ascii?Q?anA1ypDHHyQ029PyCPaf/ZjOUql1PPio/JPHkLgebg37eOzTmrArHvnfxjrJ?=
 =?us-ascii?Q?LXEm9JiRDLebg7v4yi1bC287HeU35jslMzAZywA7Ua92qG/fzNTPEF6T/Vsk?=
 =?us-ascii?Q?TK+lYy9tmv2mD2uPYiSbtnC6nCttZv4xP/Kjs5W5dOpN2KIpX4fB5k/kGhj0?=
 =?us-ascii?Q?/Ao6xMokCmRTys/jO4FXPHgcxI3aeGfFRAo3w/ULiE+EyXL0GEJPu7PPJtMh?=
 =?us-ascii?Q?Dw6grCARanEQfiU1jdIdEmuG6AvqvQI95hpvd7TzO0qJF+wqletOavy+cXfB?=
 =?us-ascii?Q?JL/fTPVoebL/RtDNUVXp4IwOMtqY2Qf2XG9CGP6OwOtJkcXjil7RxjwW4fX7?=
 =?us-ascii?Q?RLs2jdwXzBlheteRRz3/M7Ehl9/uIWovuZLZ/6V70H5Ov3xBOczfWEDiqibz?=
 =?us-ascii?Q?2Knmrcl/zSVE3nAlC5RlULPukcI8zidgCVhEfrhK9fIZCJlHP0KcacV6fcMD?=
 =?us-ascii?Q?xWM/Ek/WI/WpwMmurTxqqL79l+njNO8Dw8X7e+T3CKME8laSkTsQiLJYcb0Q?=
 =?us-ascii?Q?oXmhYFYp8Z8zmZHZZOZ8IU6kPLXeTQIKtkQMMqG2s/gaNiBspXjVE/ZvT2wl?=
 =?us-ascii?Q?+xXHjCovM7Rib2cYTmTusEUXheb43lA7cNF5iZbXkctCXmuCTa0C0iWuOSN+?=
 =?us-ascii?Q?MKTPbYCqL6dAkWBIk+kUsNdZvPK1YvJIWtXw9J9HyeHSs8DFVS+5Z7Vt96EF?=
 =?us-ascii?Q?2CrN46i5gFZBnrE7a0EmhT6aES/HFAWSDVuPcWLQMxy7+atIdxOZHIlIVPil?=
 =?us-ascii?Q?wXo+l/a74cNCEhHCqXv3Pee3RmG83BUzpJ8Pw+fIymU9ErCYALslXeep4vfD?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ea24ad-fc96-428e-90f0-08dd6699396b
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 03:50:43.7212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8m8+Ta52sSvN1k8+8bNU+TsaCTKosV/Q5SFDRolmwGzSRm4+PpVEzkfLrWUxUVxRasMkGstx+6EB3NS4YmmZXu070CCvwh4r2pDMZ+xF0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2051

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
index 5ba3aaba24ce..38f7a98192ad 100644
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


