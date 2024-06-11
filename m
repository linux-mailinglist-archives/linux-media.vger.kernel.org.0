Return-Path: <linux-media+bounces-12921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B04A2903343
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 09:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C83CF1C24EE4
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 07:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A53172BC3;
	Tue, 11 Jun 2024 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="LvpkPLHI"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11020003.outbound.protection.outlook.com [52.101.154.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EE0172769;
	Tue, 11 Jun 2024 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718090119; cv=fail; b=kY+aEiemjZwcQb5+W7EKq4E5BjXALr2OamRItzjc6rPavDnGCmDXslBNW9NM9MVMJ0cBf7ZBa1rYMhL6jG+L5Uk4kxIDjwxRStOdvomYi91Kvak9XHrADjZQIuY302gGLM1uE6q4ohCGBwy/C0b+s7kpNq2rA27NtSASqrbZyo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718090119; c=relaxed/simple;
	bh=SZpG2d3bZtrKvpZp/hnz0Kd8gQgGmCkSB+bxHens02g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pFdFtOPFWSnWvP4UVkJ41vadpRfQ1BzNQaZezAfFNEnclTH1J/ZjX3tf9PXxJPz5Mzmjwod701Ur7K8Xp0Cepq2iYAgheJqs98m0JAMlPeN7WJV/70QJmtNUU/RqGunpsKGT8xRNLnE6NSp/XMjYSIeiMAqgWaNBEKT2dS1BvMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=LvpkPLHI; arc=fail smtp.client-ip=52.101.154.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idX19jnf9UegnbzAbYY0uwhniOD0TAmjQp8B72Vec9T5w7HcSgLddihtzZh7/kc7m4om1ozw/9+tkO2Eaj6OX3Y/Qf6ldBZBbLhivff2lPL9X1laujVOWzeCx1Y4w9Ze18VtpmAaCABYlG+1B39MmulYe1yaIS5jXFYWoFrU7gbZ+xa2kDqX+Nxy4Xq1rRJ9ckzpBW7FXpTzW7Z/EHjMn6gxb8fLDwuKl54Y/3vFSGpEcQHHhV7qlNRW6p1IMEzafgU7lU/7khLCU90pCj8Oh1W/0Itc0bvqbUNNu4nLO8XhRguh/Ya1igWM9RG35Zdnk07KQJCcd2IOd8Bz5Ju+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNHASlbiyIecsumKo7HJA7vUKBkZ3Rx8Og7fVN4+lNg=;
 b=Aj3DdW4RX1VCHBi4SpWhygY7liMv7TqSS7bSGgJmhKlRJgjyqMu8/kpcL2kKs8NvJYYdOgc0Kd2nsmpql7M10uo25kLRgRo2jajqPVrPdSRaS6Ebj5q0olbZjmbufZ87HKkWtCZJeCwiaOvPLA5pzF0FlwgSdFtb2OAG0TimKrf+cZ01Ss9meS7rggH/G3wo3Qr//CuzzdMgkE5sZbW9h0IBMUb+6uGQORTE/fWylC6W01IAO8/8Y2YC8DKdsJ8MduX0gMNANHv/alpPKBcqEsUZU3v53h0/DIeoZhTnuM0YOFQgjpfaJ/bsr33Sje479tl3pMKRhirVzkgnTKve4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNHASlbiyIecsumKo7HJA7vUKBkZ3Rx8Og7fVN4+lNg=;
 b=LvpkPLHIgoJEDfQcSLx2EJj3qPlIM5Az9BhxGoW4OgNO9ncltGQ+fYm390YIgaj+znGLRCYQX0MmdVAXEq80hFa+a2XXTqJk5/KZMQpARVCzYMQrJ7k82ULIjaJvKCl+PMlxI7cC5oVv4b4SUrHTShxwsbNboZ4ntCPYzSejSeo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SEWP216MB2956.KORP216.PROD.OUTLOOK.COM (2603:1096:101:295::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.36; Tue, 11 Jun 2024 07:15:10 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 07:15:10 +0000
From: Jackson Lee <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v5 2/4] media: chips-media: wave5: Support runtime suspend/resume
Date: Tue, 11 Jun 2024 16:14:59 +0900
Message-Id: <20240611071501.80-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611071501.80-1-jackson.lee@chipsnmedia.com>
References: <20240611071501.80-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0014.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::11) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SEWP216MB2956:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b4d55c-c32f-4301-8660-08dc89e63abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y7gExp/uoKRmCmcxQl9kbbY+lHYlT58x7pOS5X3rtHBlvuZ/OQpCBNrv5sSJ?=
 =?us-ascii?Q?IA78qXKYHeRWHVVT55iFr6mi04RvQIl9YXhO/rQCWY+A7JIniqKG9Sdp1804?=
 =?us-ascii?Q?M6CBoYHjXE81Bdyhy82uMUvqSL9sE9rga963eBMG+NHFcOIO1Hg/kzO3Nfu5?=
 =?us-ascii?Q?i3RtgF6bQZ5boVqhdifMldAkfXQNUiQ0Dk4L76CBKuwi1IMsVAQsAjIOAoKN?=
 =?us-ascii?Q?hBTd42gFO8jUZTekRJOqnKDb6NxQXN9JCAaZrW0rjFaUofrI3bGwl0Z/PvMu?=
 =?us-ascii?Q?vH6YU0wRTvhljkUXjPrERKBOWmnztl7iYC43ipMdzq8HphMMjaGX6w53Uuac?=
 =?us-ascii?Q?LgmKhX+Ddn+PqZax9YPzrhRgdma1hPN6TlQSmiKL9hTgSK3GWbz8mRxALWvA?=
 =?us-ascii?Q?T8uYwB5QSblmlWr+v+zKUH1iX2ojGk3p2jKtyt4SPdEE5PH0yck0Ogx2sUP0?=
 =?us-ascii?Q?lKyyoLZc/SUphOGhdup66Axzx3x7bSCDbNNGd72e5KjhEJHhibtS9QQXL7AJ?=
 =?us-ascii?Q?PsVL5ruCabPOwAbLpT1aFi07DNJNv66zRpYNedSLxnDC09t05resWUEqOSWo?=
 =?us-ascii?Q?p8w70Vg0YKaU7bbP8tOqrC9JmgXZfzEUVMknH+L4T0Rorih7gX0EMxn0dbTt?=
 =?us-ascii?Q?A5EEcyMeOvipd9mP93Q4EzhHd+wEP6fDOiUmlEO+utqxaE6MAHdaXMKVp7o6?=
 =?us-ascii?Q?8dW0iXFEpn2ytJRQvPlJkefDMia1x9QDIWauFnXBoljVMozhAjwjTizDGL1S?=
 =?us-ascii?Q?J/Dx07ka0NJ4IKjxd4imjvtPRv5tavXHAN7ZIhwS33lBxVMwzAqOWFLYHubf?=
 =?us-ascii?Q?YkJYm4csFhU9Fy9Ht0SbatG2tkPtc5Bei2XsQBZNgEEzbP/xPAfr/wMOO3nD?=
 =?us-ascii?Q?7xUVddoi5BYDlg5jvTcf7oOYSDZwlRWH/b9g5uRq7s/cCM7FN2dnCIoJwhfJ?=
 =?us-ascii?Q?hTYElS/RwJwIeTy9OopTPGD7wrHIk+2io6ycYHqKb0FGH9EhaP80zaQ5olgy?=
 =?us-ascii?Q?K5MhGNqktH4AJGBki5A7SZPAoZkDXjBHx3seiZtLu2byaG9eD06Ek4YE4tql?=
 =?us-ascii?Q?z+kpv7vAuM4Dw2n+6jjiJ0uXURUqMUrBnUmmmc2cPeVIOTyWjn0nDW6wpN9P?=
 =?us-ascii?Q?hnzlL84K33aV+gKX0VhKUwmn8V6TY5dFCWcx+Nlh/CGhBO+iCaaAlaTWQYfn?=
 =?us-ascii?Q?qYalA78HFrKr4TFnf4VbGTxZw1EHi3+hy9tVnG/etq1qqv39lsd70Fyyf4/w?=
 =?us-ascii?Q?HfTjNL+22t2U1497gXkDvtxPgc0XGbCG7+GcC2NmB79VI8+rkSCKlAL4GXD3?=
 =?us-ascii?Q?yeAKdfPkbU7P8RHdM1t+pT65nWvNseuPO/rBF3HgKcKvm0szpdLGw9qPkZ0v?=
 =?us-ascii?Q?aZwonEc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AXVIhWEJXsWX4G8Sq0VPMHFaUWRcsGaexM6Fo5J/dCly+T2phGIadIoxmPSy?=
 =?us-ascii?Q?Ze/+JwclYOmN37tOmyHrMF3iM6OQoxKakZpTjKjnd6u+/a8LY4+uj4bNWIu0?=
 =?us-ascii?Q?Rxk8lgxv7/95Nn9nMwplkkvXdiK456sNQe3fVhGwAj1vGRkk4L3aAhVqVLn2?=
 =?us-ascii?Q?6jTJcRj9DIPR1Pqpq9DXNzwD1QH4qVJz66BOtam9JaYl9PfSMjNvi+3gaNZ/?=
 =?us-ascii?Q?6E4bbu3rAuvenZXytPI66B6YYwTmV0nSB2q8ZtlF94XmovtVBkXV0cd1TGtO?=
 =?us-ascii?Q?B3/jezAi29kjXWAUmmmkPe+8249x/ndOzOaca3lpPeX+7kr+Yh0k4L3Da/f1?=
 =?us-ascii?Q?p74wqdo1Xmy/4b4grJdIOGUlhijVB440CPgBI7lnfrOMiBUKOO/46K9d+EBI?=
 =?us-ascii?Q?ZTP8FPrQtGEknF1GdjKFGJleSMWbceTl//l1+Qj9MvFDlsOdQGQIatu+8Aw+?=
 =?us-ascii?Q?3i2sDXcsDeVzPee6zS/GaT4PMxNtR2Yio/qBip9aU5LZmY+MZcXbivQGwgFf?=
 =?us-ascii?Q?9UgYKk8a0ZvUZSYJDAr4Ho7FNMBSHBZW+htufg0XM3Ljvqq6fSEoC26ElXYN?=
 =?us-ascii?Q?KhbdiFVaJsaMhCAfMaqBJBwZX1bIeaMnsegQPe51SSHj10kjgNVMEeeeMZBo?=
 =?us-ascii?Q?CucW2LGPrMGO6XMWnVlLaT7h8t08u+WSLyIm5d/+P6zpbdGbzBqJls4Sf/XH?=
 =?us-ascii?Q?amgwdRbvKuLc8TD+EJYVNBHsuIzEBnLwDWg8sNa/qFfCNKhOXy0FvcnRLQ/8?=
 =?us-ascii?Q?zQAFvlgr+3KCgz6smArQWR0gzxqUeuryzy44lD5VWZABZkdWe6of5sGEVEcX?=
 =?us-ascii?Q?AqBkkkSBbf1RLXwWQMi1Cy0Suy0RYwUNK9znXeMB8HdlhxAwwFGfz4DyMASH?=
 =?us-ascii?Q?mVuCdGilIJCd5ADrTr+y/AQ3jGzBhuyf05rw9SUgfUIsP0htOKlmWMEdYWSK?=
 =?us-ascii?Q?yof+kV4fE7BK2Ncify+o/apIGXxM2Lt8oattCokdQiz5KV/hS1El7z7AtGFj?=
 =?us-ascii?Q?8WVW9Q2IwFGgm9wgplcuqh6JsqTvLr6IzVR53I5Tw5qc3binbQZkeHFC/dKE?=
 =?us-ascii?Q?Se6wiUzyHrg1b/Iv6xob+rLHuAitUAkiDy6uN67fujbBiR4Qwn4J6Lomm2fy?=
 =?us-ascii?Q?YOlfUJIyVXfXQAO+Pd+7aIFO+hVJHvjR8oSL1SAORL1qP8MS386u/T/sjgAb?=
 =?us-ascii?Q?6l7EOfuv28lH3HbJFgin4HXt6Q866lPxGI1F8oSMrMaz6WBkVomtmaBDuzZb?=
 =?us-ascii?Q?hxTWphKFRRHB7fakXn/6D/ke2B9Pm9VmQaYUmRfvRo7IE696tpBlDvakfiuk?=
 =?us-ascii?Q?P+FPa5Z9jQuNyY9TO5+j84p/lBMypBlSFoYI7zqJT+e0bz8p3M09A4P9KsBJ?=
 =?us-ascii?Q?8hBdEUbVkHfITdDTKeqCeu17W9YXW2d0hIG66ZXvTmRJIluH2Js4JRvI0yAH?=
 =?us-ascii?Q?ab5DeXCnicscw3iVFmyUdN0GL5p1lxLyYjlCjMZxai6+MoIBN2FPtBpn6fqe?=
 =?us-ascii?Q?5wlP4pBIXr1sBFwpqpQqn9YRRof0D53z5/JDDAYnpq6aKljuWLhfpOO+TuGP?=
 =?us-ascii?Q?c+ZLAhuoYe+NsI5wiuS8SgBWAbNb/6fWrhbu/rYV2oNqmTrOe31iy/Id2sq9?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b4d55c-c32f-4301-8660-08dc89e63abc
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 07:15:10.1298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSvamMBM2xxhUCYpvGT23+9hoyO6g1NSRbBCOCH+e/Ukis6pJb2xKxwrgvRs5WMxPAwyT+Oika3LaEaEbmg9acWu2AbkiWOAowgR9NXhIgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2956

From: "jackson.lee" <jackson.lee@chipsnmedia.com>

Add support for runtime suspend/resume in the encoder and decoder. This is
achieved by saving the VPU state and powering it off while the VPU idle.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-hw.c     |  4 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 16 ++++++-
 .../chips-media/wave5/wave5-vpu-enc.c         | 15 +++++++
 .../platform/chips-media/wave5/wave5-vpu.c    | 43 +++++++++++++++++++
 .../platform/chips-media/wave5/wave5-vpuapi.c | 14 ++++--
 .../media/platform/chips-media/wave5/wave5.h  |  3 ++
 6 files changed, 88 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index fff6e66b66e4..791b1f0e3199 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -1084,8 +1084,8 @@ int wave5_vpu_re_init(struct device *dev, u8 *fw, size_t size)
 	return setup_wave5_properties(dev);
 }
 
-static int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const uint16_t *code,
-				size_t size)
+int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const uint16_t *code,
+			 size_t size)
 {
 	u32 reg_val;
 	struct vpu_buf *common_vb;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index c8624c681fa6..861a0664047c 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2021-2023 CHIPS&MEDIA INC
  */
 
+#include <linux/pm_runtime.h>
 #include "wave5-helper.h"
 
 #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
@@ -518,6 +519,8 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 	if (q_status.report_queue_count == 0 &&
 	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
 		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
+		pm_runtime_mark_last_busy(inst->dev->dev);
+		pm_runtime_put_autosuspend(inst->dev->dev);
 		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 	}
 }
@@ -1382,6 +1385,7 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 	int ret = 0;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
+	pm_runtime_resume_and_get(inst->dev->dev);
 
 	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
 
@@ -1425,13 +1429,15 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 			}
 		}
 	}
-
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	return ret;
 
 free_bitstream_vbuf:
 	wave5_vdi_free_dma_memory(inst->dev, &inst->bitstream_vbuf);
 return_buffers:
 	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	return ret;
 }
 
@@ -1517,6 +1523,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 	bool check_cmd = TRUE;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
+	pm_runtime_resume_and_get(inst->dev->dev);
 
 	while (check_cmd) {
 		struct queue_status_info q_status;
@@ -1540,6 +1547,9 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 		streamoff_output(q);
 	else
 		streamoff_capture(q);
+
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 }
 
 static const struct vb2_ops wave5_vpu_dec_vb2_ops = {
@@ -1626,7 +1636,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 	int ret = 0;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
-
+	pm_runtime_resume_and_get(inst->dev->dev);
 	ret = fill_ringbuffer(inst);
 	if (ret) {
 		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
@@ -1709,6 +1719,8 @@ static void wave5_vpu_dec_device_run(void *priv)
 
 finish_job_and_return:
 	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index a23908011a39..703fd8d1c7da 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2021-2023 CHIPS&MEDIA INC
  */
 
+#include <linux/pm_runtime.h>
 #include "wave5-helper.h"
 
 #define VPU_ENC_DEV_NAME "C&M Wave5 VPU encoder"
@@ -1310,6 +1311,7 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	int ret = 0;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
 	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
 
 	if (inst->state == VPU_INST_STATE_NONE && q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
@@ -1364,9 +1366,13 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 	if (ret)
 		goto return_buffers;
 
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	return 0;
 return_buffers:
 	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	return ret;
 }
 
@@ -1408,6 +1414,7 @@ static void wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
 	 */
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
+	pm_runtime_resume_and_get(inst->dev->dev);
 
 	if (wave5_vpu_both_queues_are_streaming(inst))
 		switch_state(inst, VPU_INST_STATE_STOP);
@@ -1432,6 +1439,9 @@ static void wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
 		streamoff_output(inst, q);
 	else
 		streamoff_capture(inst, q);
+
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 }
 
 static const struct vb2_ops wave5_vpu_enc_vb2_ops = {
@@ -1478,6 +1488,7 @@ static void wave5_vpu_enc_device_run(void *priv)
 	u32 fail_res = 0;
 	int ret = 0;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
 	switch (inst->state) {
 	case VPU_INST_STATE_PIC_RUN:
 		ret = start_encode(inst, &fail_res);
@@ -1491,6 +1502,8 @@ static void wave5_vpu_enc_device_run(void *priv)
 			break;
 		}
 		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
+		pm_runtime_mark_last_busy(inst->dev->dev);
+		pm_runtime_put_autosuspend(inst->dev->dev);
 		return;
 	default:
 		WARN(1, "Execution of a job in state %s is invalid.\n",
@@ -1498,6 +1511,8 @@ static void wave5_vpu_enc_device_run(void *priv)
 		break;
 	}
 	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 68a519ac412d..0e7c1c255563 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 #include "wave5-vpu.h"
 #include "wave5-regdefine.h"
 #include "wave5-vpuconfig.h"
@@ -145,6 +146,38 @@ static int wave5_vpu_load_firmware(struct device *dev, const char *fw_name,
 	return 0;
 }
 
+static __maybe_unused int wave5_pm_suspend(struct device *dev)
+{
+	struct vpu_device *vpu = dev_get_drvdata(dev);
+
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	wave5_vpu_sleep_wake(dev, true, NULL, 0);
+	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
+
+	return 0;
+}
+
+static __maybe_unused int wave5_pm_resume(struct device *dev)
+{
+	struct vpu_device *vpu = dev_get_drvdata(dev);
+	int ret = 0;
+
+	wave5_vpu_sleep_wake(dev, false, NULL, 0);
+	ret = clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
+	if (ret) {
+		dev_err(dev, "Enabling clocks, fail: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static const struct dev_pm_ops wave5_pm_ops = {
+	SET_RUNTIME_PM_OPS(wave5_pm_suspend, wave5_pm_resume, NULL)
+};
+
 static int wave5_vpu_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -268,6 +301,12 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		 (match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "");
 	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
 	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
+
 	return 0;
 
 err_enc_unreg:
@@ -295,6 +334,9 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 		hrtimer_cancel(&dev->hrtimer);
 	}
 
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
 	mutex_destroy(&dev->dev_lock);
 	mutex_destroy(&dev->hw_lock);
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
@@ -320,6 +362,7 @@ static struct platform_driver wave5_vpu_driver = {
 	.driver = {
 		.name = VPU_PLATFORM_DEVICE_NAME,
 		.of_match_table = of_match_ptr(wave5_dt_ids),
+		.pm = &wave5_pm_ops,
 		},
 	.probe = wave5_vpu_probe,
 	.remove_new = wave5_vpu_remove,
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index 1a3efb638dde..b0911fef232f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -6,6 +6,8 @@
  */
 
 #include <linux/bug.h>
+#include <linux/pm_runtime.h>
+#include <linux/delay.h>
 #include "wave5-vpuapi.h"
 #include "wave5-regdefine.h"
 #include "wave5.h"
@@ -200,9 +202,13 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	if (!inst->codec_info)
 		return -EINVAL;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
+
 	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_sync(inst->dev->dev);
 		return ret;
+	}
 
 	do {
 		ret = wave5_vpu_dec_finish_seq(inst, fail_res);
@@ -234,7 +240,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
-
+	pm_runtime_put_sync(inst->dev->dev);
 	return ret;
 }
 
@@ -702,6 +708,8 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	if (!inst->codec_info)
 		return -EINVAL;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
+
 	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
 	if (ret)
 		return ret;
@@ -733,9 +741,9 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	}
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
-
 	mutex_unlock(&vpu_dev->hw_lock);
 
+	pm_runtime_put_sync(inst->dev->dev);
 	return 0;
 }
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5.h b/drivers/media/platform/chips-media/wave5/wave5.h
index 063028eccd3b..6125eff938a8 100644
--- a/drivers/media/platform/chips-media/wave5/wave5.h
+++ b/drivers/media/platform/chips-media/wave5/wave5.h
@@ -56,6 +56,9 @@ int wave5_vpu_get_version(struct vpu_device *vpu_dev, u32 *revision);
 
 int wave5_vpu_init(struct device *dev, u8 *fw, size_t size);
 
+int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const uint16_t *code,
+			 size_t size);
+
 int wave5_vpu_reset(struct device *dev, enum sw_reset_mode reset_mode);
 
 int wave5_vpu_build_up_dec_param(struct vpu_instance *inst, struct dec_open_param *param);
-- 
2.43.0


