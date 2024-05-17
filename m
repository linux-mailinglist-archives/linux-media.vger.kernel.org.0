Return-Path: <linux-media+bounces-11588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B17AC8C8419
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 11:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6624C284E25
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 09:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EAD25778;
	Fri, 17 May 2024 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="aJWfcreG"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11020002.outbound.protection.outlook.com [52.101.154.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DFA1EB48;
	Fri, 17 May 2024 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715939395; cv=fail; b=GRzhE6C/jR2U6Z4VWrxHVXefk9RM1iaEVww45yhfioIkCo30lyD0nD0k313hB2a6zjK2F/iQT/pOmGcFZ3knWoPN4FirPwoB7rglut35roPKQBPOMDgPItqP62VQR/fIu+4w15wQ91SZ2AKGs6SjSu8LENXKSgqjoQRJh+gmjns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715939395; c=relaxed/simple;
	bh=8wixs9KktvKVLDwNnu/oWSpJyxfllMrAn8ulQMDCYRg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=u0YJ9csOo9L3qO9zFdnRQyAvIQXGTmBWvafAYs3Qw0V+isPQRuZEu8IcLsJ5d375AMFEi9RFxrHNkP3iB67OsuxCz3VbylvV5IPYUsUCFnCAYjkmzks5AtoA5l++GQK6SLV3NsMFGm3XHStf57HB/xXTBursCcd1PCiWqhDBWgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=aJWfcreG; arc=fail smtp.client-ip=52.101.154.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFNPvpuEaK5zCIO5R9m/8qJrDXt466ybg2yjg4GF6ToZwHdbCtLYPtKZypi7rl3akFBMZCd13MdK+t8xb0ljACF0ADwisuxiYPbq5oPIQ++e71MSVVclDUlZvenwlg/HhWFXIhXQaq80c+ElM2WDprUHkSVmXZM+Xy3SesEM/3UbP3in1eFfVcxUHNoGfaOb2JGSyM7nP2qs1+V9JVxnFjDYul2kCg2jzRENTdlwNwQ5VYnDlCRE3enmJ5s5v2Nvmh6MvX+DLF61tYtv0LLTOUoyUZs2wNlOQIdGIeawMqsqsUTkNK0hxeRwBon7w3MvqDd8g+32iwpTTWIbZDtJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mT/z9Wm2coDk4CyO+OSPldqlfaO2Mdv/YQQ8LbBLbJ4=;
 b=HsorrB7WhyCV6T5DEOAWNpLST7J5WqOxXNzLOYTts2TYyPkxsYANSfnkPL8gyRli9dkbwA99iVvTZAbFHWydxJsDkrRTNWyyX8DK7R1dgxrNTCNptFpgm6BfSvmztiH7I8MPxWqkRxROitZDPJcQr4fIsEkpR8NhCxG6t3xiFIcnLvfx7X1o81r4mjpuR3pmQs3Dki3sQSvQZYScbSqezNar41aEhWLWcWWn1Tt1p/mdoxpVzCi97WhzTtzPc7yc2SLcbHzzFXTv+nIoIqoYr6pG+bk4g+wSISO9v5kCoE9728xoRKR+U2kvxihNRuySzU3jAtRGhVbSqtC3uHZdnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mT/z9Wm2coDk4CyO+OSPldqlfaO2Mdv/YQQ8LbBLbJ4=;
 b=aJWfcreGf/JgfzbnisIXHvgsV+56zf36Wwr2iW+GcwP/0ZevGNvx5IVzWiO/yNkpRSBlUJM9naH6QdfhAFIlUi/y2TwQDzn2zred+aLiyu7DrSwBIvNbHimyD3mgElS2NspZrhu4oH34KP6SWd6YzTo9eOR/5AzIAhezz4YEseA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1999.KORP216.PROD.OUTLOOK.COM (2603:1096:301:12d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.30; Fri, 17 May 2024 09:49:49 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::8bac:533d:dbe5:ba28]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::8bac:533d:dbe5:ba28%7]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 09:49:49 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
Date: Fri, 17 May 2024 18:49:40 +0900
Message-Id: <20240517094940.1169-1-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0175.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PU4P216MB1999:EE_
X-MS-Office365-Filtering-Correlation-Id: e84c618b-d87f-494a-fb17-08dc7656b124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|52116005|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o4UMcvbJ6ZoQq7fIXvlEkJa3zpWz2H4srUsOhHuRZTXAkGxVCqry8w5z2+1+?=
 =?us-ascii?Q?0+aZFKTD/tHGYo+c2F9jT5Urffc1FHOsjwoF4bjcKzIfYcI1KRQ6iO47xocV?=
 =?us-ascii?Q?lVXD//S0UFxvfFJLViWHHYuh4mX+5/cy84t4fxO0ftOk87sios+rUCwExB3W?=
 =?us-ascii?Q?kB0YrRyMy0vCMreVN9KCkc7L4xVx02T6C1t3Ekk6GMI7He5gMWNZHxFaUbaO?=
 =?us-ascii?Q?42nqzuq0IKTE7nVHsuJQxOt37cr8ut2/p75BxrCX6qH2RmytgyJZW/5q45zx?=
 =?us-ascii?Q?FutvblUbYGnpMohNpto7p4GMH70Z8Xse2SGORQaWfwL5uGeOc0bCm3yzmMgN?=
 =?us-ascii?Q?3bflvXRt0nC7HxTd7SlafzlM4dBoNx9ZGFH4E16eRnLKjl9YCkighzxeYpx0?=
 =?us-ascii?Q?2v0sq9GtKpfVaSUQQnSJaRZ5d4j5y17nMOiVnm33hD2IEHdM0HLBR4sipy4b?=
 =?us-ascii?Q?lNsnydo62xzMYF/WznaiuO5C4jvsbHRaNac0pEk1BY3k8bco80mnR3IWul2b?=
 =?us-ascii?Q?ixHM33QHcPxZNE0NRByxOhwr03ypIZu5c/B9eOeVWM7ceWMQZ+EhZklbuQLf?=
 =?us-ascii?Q?SqT7m+dyHTk8XGj4JmBuoFOGbHL4ktuoW3/JfF75kWJLDecajHQ1J/F05ivB?=
 =?us-ascii?Q?bUtC+IstZufaV3VjQog1O3TtuM7cAwHvfUkXhthMNENR9fu2vQ0UGLgqhFM5?=
 =?us-ascii?Q?oNpLa5kYRkGXq+DT0fAThoKUuCfli33NxTTz7Gqm+F5QMJmEgbaRfkIwQcP3?=
 =?us-ascii?Q?1fIPkIxbK6hr7QmPfySA/JjhsH2rdfrBj59L11yV0XesWjczv0J1ZDbd2Yjc?=
 =?us-ascii?Q?JK+xMLOwHuQNcczapmZfZqG1FqyWnQxZOk9vqnOhyljZjkXk4kh2A3CBqAZd?=
 =?us-ascii?Q?QjYLba3LgrbSxnPGJFmUHU8Vwzek2UjLDOZtdMY5T58uE+6kZbwuRowIKMBk?=
 =?us-ascii?Q?BEfizyx7sCIlM4mqK0/rcehAyV8pNgixOvl4Tp3dKLBkq8jodmhntS4UGLy0?=
 =?us-ascii?Q?21bn2VmY03HCnSDqRtGavwFCvLyYLx+NB4Okocja76WcnxLdn4iePWRTQKWG?=
 =?us-ascii?Q?/xv0HDzG8SbijF2NzgwsLFysWkagkeNgnlQ2WEz3XebSYtDHSHPutteBMbjl?=
 =?us-ascii?Q?SnUAfBIUfT8QluftmIkxn2On3qNaNyH1yiHrAPGYxKjPRIemyy+kUo40sfT8?=
 =?us-ascii?Q?sP92azFX80jMMkKd+7JeaUqkLY7sVNnuF5YSmhRHBZmdppZRWFlbH3TDD/Hj?=
 =?us-ascii?Q?vt/ga90vTgfAjnEHp6QiXxb2BxJZiT2Wtb6ozE4PBHDC1oA64c36Ke0gYDrh?=
 =?us-ascii?Q?G4A11Vhz6f/2povECMJIa8UaMZqQSnQek5aCxndQnrhUDA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DtFQCw73f1f248XoGquBH9f6huJnvpCcgIn1UquwARt2GB2WuMfmzEa+mXOy?=
 =?us-ascii?Q?+S9BCqOEwiKqXU7z6Z13dDvgi5Qxl+eBOFUzK4APeVyQah/0RE/DjngRx+jW?=
 =?us-ascii?Q?0gGbu5PKFs78Fc3vMkMMc/mvepDPPD1LiTY5b/kRsoSR58p05mTurFSFNwFm?=
 =?us-ascii?Q?IaLMW1kXawsSL/ZF3aajYVOBpvAjrqKYeRUIYpuM2p+L1Y6zA6V+ajjdLWpt?=
 =?us-ascii?Q?omCcnfUqZW9CxNbW/vJ3qkrey/s2+Gi8bDnJJE5bHvsVCO2+MCgHLs5pDpc8?=
 =?us-ascii?Q?H+CDhTSHlyp3MOPbOLx4VmFmVfy/tWB/XvmNqOWBWUojtPTm9Djhl1WRVB96?=
 =?us-ascii?Q?k6mqp2IWANxVpupm955RtkrjW5MU2nRanjDu8QxYMiN0D2DigACZgSB5v8jX?=
 =?us-ascii?Q?TGe7c8HtauNPDDR17rYZGlApEQifODNvnjG/SZ6rLuOKSWrOZ75g1U9SwGop?=
 =?us-ascii?Q?qUn9omkrdEpRrPiuYLZO/aQTWtONmVtR0asOh4S7SQWbETTenFCWGVaDVjId?=
 =?us-ascii?Q?3HQLOqZ/kbgPRyDwT0W7Xk002R0O2dzNxNzdFIrRcD9CtHOu3u8VKq3GkGmH?=
 =?us-ascii?Q?1/6SogE+9tYCnPDzQgJURW7ARKhGQDF3p6CQHMdpreDVXuv6UFL8sOhSK9YS?=
 =?us-ascii?Q?98OdfAqkruTdnw4+qDX5o+UHEc7IoGHDIUR9rYUIImad7l2vljGqn68CAjDv?=
 =?us-ascii?Q?FUTQNBDEaDJWI9lYRZu+ekYiqGuobszGtNe/Iaix+Vqe6C2pfIExI5tEg+z9?=
 =?us-ascii?Q?KLVk3sH4SlXmRmP915sy2kfZ70d45JW4+msQd/BFtMriP9R8Gk4sD2UnD1O+?=
 =?us-ascii?Q?pgfFCpGO+geRbuinJnm56UzY4yphaLKf26imyRjrlyN2P0s0KOG0Eks79Oqa?=
 =?us-ascii?Q?fEJn+JcLT8WCltk+kg2o774LqNKLliRx9gE1++T4hLnSJpKdxWbCgiUcoDJu?=
 =?us-ascii?Q?qRub8YqvfVzS3AW9pmTfZeuIPA/FCjBthtsXMWiyIqmPFf0saeU6O2rNNj3G?=
 =?us-ascii?Q?IFWK5ZKXkofUS5T9408GiiO+MjMB0d09z1L+ADFPsMvxqAlMCEFILu+wYnhN?=
 =?us-ascii?Q?vNFKvfFW3jpmN4BH8F9mS2QYNziHXyZDsQCBqzqzlikL3h1MgV3TdSwv/XJ7?=
 =?us-ascii?Q?EOmK6iW1qcEqap2AAdv8U72DBQTPEdEa3s0LDazPyBMjPoy1/6DeFecw9f/9?=
 =?us-ascii?Q?40IIOMz8Q5p2AljBYWx2DncnrLrseGkLhL5geDUi3QQtE+EVSzhaMWOdoO7w?=
 =?us-ascii?Q?Y7FzQYhV8KUAst9pie+07xQ9levH7sBE1O3SQeemkmebd/9OkIOnI+dCwnk0?=
 =?us-ascii?Q?PiaBBCRzUOZJq/5hJBT1uMYJTK0fTIym0LJKYWrgJxX2VOF8SEVL5fYpUgjS?=
 =?us-ascii?Q?xUhtal6bj8ujCI5rVJWfOzopA1c59GvHMssUMku3tW+4qJZdn5pCplDoFOlu?=
 =?us-ascii?Q?hIsvFclCX5B69htSsC6aCu1DGaIquhL/feDVOdsMYfP+iPnfDg9Nuo1dix6V?=
 =?us-ascii?Q?4WIw8ldLyQprbdGAgAuj4aHw9uOGrkcFssJ1DQ5nVReGgIDsj48JLbwDUDq4?=
 =?us-ascii?Q?+cDyRhFhOFy+64jsJFtb5VM9lnqF6f0kbsNuNkhZJ71rGUmegLTEOjU2Zj7o?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e84c618b-d87f-494a-fb17-08dc7656b124
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 09:49:49.1778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2FKZS46gimDdbElxRQylk9MqOn5BSlnzYT5MmmX0z+pv5KJlL12kOHsWzK4GAISUHHa3dR21vN/V9QMRxeugDhwUfyNsM6oVYSeQ+QXz44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1999

We expect V4L2_TYPE_IS_CAPTURE() macro allow only CAPTURE type.
But, Inverting OUTPUT type can allow undefined v4l2_buf_type.
Check CAPTURE type directly instead of inverting OUTPUT type.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 include/uapi/linux/videodev2.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index fe6b67e83751..32b10e2b7695 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -171,7 +171,13 @@ enum v4l2_buf_type {
 	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
 
-#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
+#define V4L2_TYPE_IS_CAPTURE(type)				\
+	((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE			\
+	 || (type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
+	 || (type) == V4L2_BUF_TYPE_VBI_CAPTURE			\
+	 || (type) == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE		\
+	 || (type) == V4L2_BUF_TYPE_SDR_CAPTURE			\
+	 || (type) == V4L2_BUF_TYPE_META_CAPTURE)
 
 enum v4l2_tuner_type {
 	V4L2_TUNER_RADIO	     = 1,
-- 
2.25.1


