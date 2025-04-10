Return-Path: <linux-media+bounces-29834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E134BA83742
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 05:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEA0D19E5C62
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9CD1F1524;
	Thu, 10 Apr 2025 03:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="WTIKYhSL"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021108.outbound.protection.outlook.com [40.107.42.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464811F09A8;
	Thu, 10 Apr 2025 03:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744256419; cv=fail; b=AXbPjYe93ly1ochRWC3z92lH3n06VWaWnTg+AzMUEvOuzp3uAJzqNDXodSdAQ06dGdtn1kK6bwgzuXsjrVUEeGvIBH+Zza5UjEcrbuhe2YHA1H/gTJTd4QbVeLmo6PzQ8x0ywI82RlEq4hMjhmveCey0UDDWKoIKuRJEjg+hOLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744256419; c=relaxed/simple;
	bh=YYyAeLpW4vipwI+e7DPZ+U2TdfP4pmNlVJ46ZE35GvA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M4X0LuwaYEob6LlHMknvQXh75GS0i+lIVm0Mk/KWAo01N5g9GQaVBstjBWW/nsWdVlIMD5HW4RzeqNyX0RZg01sJWuC/i49X69pAwB7B2qE9WKP/IZJTh3QvXR8mgl+1m8Rg5k+vnrmpywOjUnVW84MZaB1+hxT1o+RowBm8epY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=WTIKYhSL; arc=fail smtp.client-ip=40.107.42.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mr9pP3G6jw7riiRwFvDxD1rnwdquzgILrh5fYrEEtuE2nxYSnXWUurTbqNMUF/i9am4Q1CXhHfzvapRXHVO90QQXToPccFfiASpLTjqWXKmXAqdfSF5N0I/xCTupGsf1tf+stTtJ62GMcoYffPHFGL2Xq5YrCrQMN2pDeEBsQMFQVd/aia4nFj1bsnK83bwpGEAsFqt1RWjRM0lJJmbTKWKcdF/T6UooWdK4EbT4x3HM6JRUDWVGB/4tWBLrgpinCRmm7Gxr37vL5HzqYlRifsXlYkfoQykj/nxRB27iAjPikFTYpc5mpQe28xKz5EWfHtbkLCBQo3xq1LzndvJBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEpcFnUz6GCo97dFlsyfZ2Ur8raX2EqapoLu7MGFadk=;
 b=XT6eiNDrAo7me6kqmPLztnhqZiV6oeWOB3oEvEFEOeJLPe06GTcR6oyvHDCG2IzRZhehrm2J115MOHHHasX0YYiQZ11dsP0WIuSCwymRl+t1BmZn7EKHoOS3P2h44as9DvHG/yV2svraZEzClcp3DKT6gtXaLyL9Ns5YTSIyRI94J9B+SRBUDn/bZwofGPRxZPwW9g11k5XSFm5p6jULBBBieHh47oEyb3Eefr1s2/FYu2vA7UXmGM4gYl0M/gMKBAy9B0pt5lr6xI2k8GufftmH5iCu4oyqVz36htWonoiRl42mSi0epnSUwvdghr6RR0vopxg2Fy21vcyl2RuHwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEpcFnUz6GCo97dFlsyfZ2Ur8raX2EqapoLu7MGFadk=;
 b=WTIKYhSLT6Ij35QggxgCQ0/el9Il6YmD1Lv5W/dzLckPeFe8jCBev/PWMn7ybRRfMuzDq1FckmK+LL6Nnbwo8rHR+VwUKHsSx3mFSP/7u60B7NNhRe8612YWA9PyirNLU8pTZanHCECAUZjxvt5mkCTUucfDa/KynKsVcFW/jmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by PU4P216MB1439.KORP216.PROD.OUTLOOK.COM (2603:1096:301:ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 03:40:11 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 03:40:11 +0000
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
Subject: [RESEND PATCH v1 1/7] media: chips-media: wave5: Fix Null reference while testing fluster
Date: Thu, 10 Apr 2025 12:39:56 +0900
Message-Id: <20250410034002.88-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
References: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0051.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::12) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|PU4P216MB1439:EE_
X-MS-Office365-Filtering-Correlation-Id: 720fc935-d717-4f6d-2c00-08dd77e1657e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sGIgkoxI/rEFyqVLO1JVZ43xuOUycgDMa9gjOJUe3oWbYqFGuhKchM1frDCr?=
 =?us-ascii?Q?gylKPqIe/DwRAGIeprepgW+TuD3lu/bwHUlprK4LgUKajjsFU3IcqFBKrnf1?=
 =?us-ascii?Q?2jVQircyay94HbowwUtIz/PtQGb3Y5Ke302oayMV97YvBkX9Eb2triP7Bmyp?=
 =?us-ascii?Q?UPd844S69yuqshkPkUkgxQKo/4S6V1Av7Je1S7rKFWfb0kT/1CHTe0Ieed/K?=
 =?us-ascii?Q?S50/InbojdO4TwHY1Xb8FbcFtmp/NmvKCUZAAHKo8gSmoT2qHZ7pZau6OYYq?=
 =?us-ascii?Q?iqEmkDmUgbpiUIFWBSldVf62mZGTt0pWveP+HTOP/PWai1a6x4FjBBfOm3sO?=
 =?us-ascii?Q?nFarDrua9DEnUYi5M2Qm0iW2XeQXiLRqLamKdbYB6y7wMHH9O/SfhWhhnoYs?=
 =?us-ascii?Q?08fln6KElVzkzHSIjxJpryPbwg3eDIqephcYjAtle3WQTWmjnupOjbuqW7x0?=
 =?us-ascii?Q?3bUzhMYMl7MA3zqRc1yzpqk1ELoKSPy3f+xQowxXan2bIZiXZ1FZ9N9MDeYK?=
 =?us-ascii?Q?z1575Nhhmk+Lq3mJlqzkVoybSeaenhDyAMp3aIQiOU+zJc+QLra32uMgZzEU?=
 =?us-ascii?Q?hvYuTRYDaSntS3yQxa0/rDfDbH8He0u73plbH+OeEJuTkhCh5smz2NSuEO2w?=
 =?us-ascii?Q?+6bWqYrrTunawUageTUhfk4r94QyiqXojYi9CV/W040Vd2ZeirWTbnIAJjAN?=
 =?us-ascii?Q?/eEo2rtYf0fxClnYFmRMkYGCf6Z+6YY3VKMfGOPVt7dCugBsNMkGeGKBUz5c?=
 =?us-ascii?Q?91SYUipyMYb28KxiG9/di1DyzOzV1BTkeTRHPgL5+PeDkJDgU3/Y703tD8tl?=
 =?us-ascii?Q?AdQU7/mr5bcHXyFYsSkdNWQIQGpJHbaKZ7YppxH1HGFcMbz5j6yQ4ow0FTYi?=
 =?us-ascii?Q?EwEPdneRlTMOgbFLeO+s/y1sS/aqxWn49zb0gVWDSl4ABm96lygAEjY8j8O2?=
 =?us-ascii?Q?2OHlj/qaR+R3vRA8kKNND1rHN5sUhQ9VV0AyyJwyBNrv6IA4EECicG1mIIVE?=
 =?us-ascii?Q?LRVajk34VxLLZ95n37uB9PYy/jy4ehhdzl/8rqpMmDrJTQDYdyj5GKU4c0aN?=
 =?us-ascii?Q?y5eREvleM4oKGP6GvmwPzDhvr+9Y+GPYHmQdiwH6e7V3hNrqjyQjOJW4VHXH?=
 =?us-ascii?Q?0PsUnIdTDf7VEsPiOVCwPSqe2P299Zq7dKMmQG6HNlP83G4pBpZS8L+P40kZ?=
 =?us-ascii?Q?/iyyvtP5Mdk6bxXPW6Gy0XBPr6VmydDxwlK+0r1Rr05hdqaxpEBF1Fn+70bH?=
 =?us-ascii?Q?SKxtRNWx3Rzd/g2ukJXgxozdK09BrMD9bqzQfbUieoKJV6GZYoTr/SVioJB8?=
 =?us-ascii?Q?U7dCL2v/Mk1QsLFFi27+pnR8aUtG+HvYvBWMj99u1bv+5EMpWjmgN/ydNzHo?=
 =?us-ascii?Q?Kb5stQ+3pwjfNiBZgjIVgt+Jg3JX5nbFAXwZDIP3xaqh9y3LVGRbXsFcm62n?=
 =?us-ascii?Q?58F+7uuHY/tnVJeD+hJ1KqznnViNPeLq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZWghSe5T+Un1PXhkt07VtcZCMHuKdK6jOzJlL2rcWvNequ6dPH6ijrLzJ/pZ?=
 =?us-ascii?Q?BTaEsThhNfgj6ZtyCqNmGzeRgA+XYYXGOeRAdz91dgopvi3+XJECG1r2l1Zf?=
 =?us-ascii?Q?FPEB1YLdYVihTx9oJmCPLPZoAeoLKIAyVpCL/AjBJpZrO0rRIGL2EkOK90K5?=
 =?us-ascii?Q?WosqlS5oBoiYX5BXGHNOF8J/dIoMoyVCtqi7VYfmCn4XwPPnQWzmglnYe2Uo?=
 =?us-ascii?Q?7J3mm2332BD2MoD4zVsVeh58/C+wRGYLMYxN85XWsu2DKaf+G0kcnaAedIO3?=
 =?us-ascii?Q?VvGjaof/Ob4UTUKMKSSxuMsHsPBeu2bG1ZQu/XmgLcs6hOeP2v1tnV4Sox/d?=
 =?us-ascii?Q?+/zcj87SwtIsGEb51gYB4Ik/pSRwsKcrMy65JY1cOr2gMd0AsSoRgZ7ggyFS?=
 =?us-ascii?Q?slqrMh0myPCqfW81sfwt5e4w6bSENy5Iu8myIJL0k8Mt5RklEAsseHAsz2J6?=
 =?us-ascii?Q?hBg5ugDlYlijyMOIght2F636JJNjWwbBA9bS4JEh9Y0Nm21DAhgwL7iAY4E9?=
 =?us-ascii?Q?DLNmwvZZZU9zsUXZUMtjZoWOzJTx6sX/TTJMJYqeOdAVs3zu2p4iPC0S/PWT?=
 =?us-ascii?Q?r3Qv5FqsZIXvbB5eSmcr+SWzl2kTbnkvcVE5vzaWRWDL4+J0rj2+eC0DVgST?=
 =?us-ascii?Q?7b+0tFCuXshaOVwyE9d7cUZoYrxuGbTygGQwwVWPZyMc3FIu6kiL0O1w1mLY?=
 =?us-ascii?Q?jZ3CbvPx8H1oMqTW1G0sUM6jPTu3vxmV/Hy5X728PQ27abyYcxrTWFp6VJlg?=
 =?us-ascii?Q?fbzoEsh2MQsrM9s5xCVIyNKhycyxlkytd1MzQYwcOFmihfAPx3H7+4Ws4diK?=
 =?us-ascii?Q?a/2RgZCkFkQZ2gjVzPOUVwCjDaDHo2AciN2WdUzjPyw2gvF//emca1viLllG?=
 =?us-ascii?Q?GMY+PMBjRUqMeQTM3htmUJK7FXYn7OLMcd7Q66gv28q2zDe69E1TycOd0kIg?=
 =?us-ascii?Q?7ls9VebMKng+YZd5eFcUT3RHZlhviKMZuJ46p8IpVqO8ILEgLrPYL+m1ZNI0?=
 =?us-ascii?Q?snbEsJY2/M0Mkc4of800EUrRko5mfm81tWWuDEddsUdrtSoteAjD4JL9lq7i?=
 =?us-ascii?Q?BpsJ9eY8CiV8mDdGD2OJh4B7QQDDtgACUq8A7PNlhi6+XMvyHASmLL2/E2My?=
 =?us-ascii?Q?s4YjCmipJNrvmkwnwGpGoOj7xVuoO86CL8CxAXvYqeNIog5sv83cwCJmDxjz?=
 =?us-ascii?Q?sAWlyg6qVRsGtx92wSLM5if7kyq41+DPRUI0585I4PCukAhCN2WQNb2wsPQc?=
 =?us-ascii?Q?HCob8rTG0taX8wIKbfOCefWCTFoI9iIOl1rpLQEBE4/8r5ObCP62oRVElNiz?=
 =?us-ascii?Q?hQL2noi3cOHHRjJ8nIRHEGX+4U01xgARQ6IdwElN8hkmrG+2SyHjhHj3eNRM?=
 =?us-ascii?Q?kNmNhxOq1baAmZvrei3leHD3HFcp6MZBHmAQGH1Wmw+SFUvbskgxutOGfM2U?=
 =?us-ascii?Q?nFB+9eQ+jwOTYAJDlSKK5WqPvL2MFeuknIDZIYJCHqrRTOICpzMHaG9qNcou?=
 =?us-ascii?Q?b8dKoPTbmp4tXKD91yeLybMsGIcY9sIAb4iYheAY0+/GtDGp7YqiK0KxZdDC?=
 =?us-ascii?Q?2qZWC6Z+edotXZYgsazxZu83PQKbp9qyGRoBJV+i8mANEb9V0vxKJ85loRUQ?=
 =?us-ascii?Q?Rw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720fc935-d717-4f6d-2c00-08dd77e1657e
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 03:40:11.1811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkAveE7mj74hgzb1xDRZcO2dYPkbq5GtAr3LxggV3S2YgOUU2wfLhO0r/OMppYEB5guuashCQMpD3+vkKscz6sGjajNoTuixh6ayZpOJnOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1439

From: Jackson Lee <jackson.lee@chipsnmedia.com>

When multi instances are created/destroyed, many interrupts happens
or structures for decoder are removed.
"struct vpu_instance" this structure is shared for all flow in decoder,
so if the structure is not protected by lock, Null reference exception
could happens sometimes.
IRQ Handler was spilt to two phases and Lock was added as well.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-helper.c | 10 ++-
 .../chips-media/wave5/wave5-vpu-dec.c         |  5 ++
 .../chips-media/wave5/wave5-vpu-enc.c         |  5 ++
 .../platform/chips-media/wave5/wave5-vpu.c    | 68 ++++++++++++++++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  6 ++
 5 files changed, 85 insertions(+), 9 deletions(-)

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
index fd71f0c43ac3..32de43de1870 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1811,6 +1811,11 @@ static int wave5_vpu_open_dec(struct file *filp)
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
index 1e5fc5f8b856..52a1a00fd9bb 100644
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
index e1715d3f43b0..c53ac9a5c1c2 100644
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
 
@@ -265,6 +308,9 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		goto err_clk_dis;
 	}
 	dev->product = wave5_vpu_get_product_id(dev);
+	sema_init(&dev->irq_sem, 1);
+	INIT_LIST_HEAD(&dev->instances);
+	dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
 
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq < 0) {
@@ -288,7 +334,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		}
 	}
 
-	INIT_LIST_HEAD(&dev->instances);
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
@@ -351,6 +396,12 @@ static void wave5_vpu_remove(struct platform_device *pdev)
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
@@ -361,6 +412,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->dev_lock);
 	mutex_destroy(&dev->hw_lock);
+	mutex_destroy(&dev->irq_lock);
 	reset_control_assert(dev->resets);
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
 	wave5_vpu_enc_unregister_device(dev);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index 45615c15beca..f3c1ad6fb3be 100644
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


