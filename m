Return-Path: <linux-media+bounces-13423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CA990AC1D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2D751C21D67
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BB9195809;
	Mon, 17 Jun 2024 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Urzl2bTr"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022019.outbound.protection.outlook.com [52.101.154.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B24E194AC3;
	Mon, 17 Jun 2024 10:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718621313; cv=fail; b=Zsln5KNyM5PU6UI4vJShevPYWmfnzwe+i0as6HRdshqJlVJNxEGjIcohyQRXP/t4H9wqHJByK211lOQdwaqVtOY0YCff4XTC/4KGxzhsJrr7+iRUM4jTUYqFv0xdE2WiBSQvVRwYYwqULsR0nSKMCqUNT2oRrplAUI8iR3rnPoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718621313; c=relaxed/simple;
	bh=3qILsRgTVn2kyQW/Ny3d9ROv4NxhZc6gY7nfpP+Ah/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=anqAHNUa2kN9FRbZ3TEMVzdAwx9wN1IaMqdLlYm5nykdu/kQueWSbLYoZWbxaEgES3+OC8Gh22K1Ua5VNa5qFOcs+dGVMq2bpXqUhE8xZZ29CtDiHEYposU/eAGIFFul5T0uOBPv7ZN0Cpzt7ImUZIKc6ZtL7l4Z5stDdp044a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Urzl2bTr; arc=fail smtp.client-ip=52.101.154.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyS1Io7ZygGioBQZsJGWBJLT8ub+rLn2MlYEtpz28d8fPinEgmQE5S9n6OKgHTtI723wUpAjME4igo7Dq9ZzzlfsQG5oK78AIDqnD6OiWXqmciw7Yy3n2UXmxP0EP3yNANFJDStKg8Iu32XAd02pkAzS095xMcVcKOwWtZv6IjP9+vPfHVLrFz7MB9GZbE2350Xi/VyIm4xCW/h58qag1l3utqVdsbQBKx9g6R8cH368AjA+7SAlSXSfoA2zAhgzrvS4bzu+W7577AQV6jk1ohVdsthVCWl89WUzC0FBO2NdTuZ3eMCSZrK89tSDvoqF3L+rq20ymSG5hCIdfCopIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGdEGCEqHtYBaCTzewF2uQr90v0EknKD79yzMufk/lc=;
 b=UzYwnViz1xltgqSu0AdscnncGpXqyIPpc4J8uoZb2JE2cphnRU2ecVCiGCapJ4a9MiOAWVwAI2WxCwrkLGjTehBV4ncJYfEtsqbJeQYMP/ymUSdDD7uV5EEBD0/0sOZu5vhUmO33wZmyWNknXO2Dfc0s/Kn4gp3oJo+fFe7qhAl0L1sNA7xVeo+GilnUVE0tcqgUD2lstyUN3nX37GaW8xWqGwyxFP2GFBSapz6cCvq9OzLroO18C/sR1vVLYOb9M+t7KLOHTktRHcoIAXYQGkjgNUj3Zp+59IAgQrMzG04V8dMFGL3b01w0ocIKHwlGj+0H3YOdGFpyx4DlKc/xbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGdEGCEqHtYBaCTzewF2uQr90v0EknKD79yzMufk/lc=;
 b=Urzl2bTrmiu46zligVw0FS5X2cIzU8bc1BfCKwwU4tU4vfd3bBGopPncQZiymJ4+Teh2diQtbKWbLX5AUbHynpuuwqSNrapmuCDXMJTicULVNG5D/ol8NLTIdDmxMV7yvd4CgV+KZug/X2nMoJmbh6OqiI/9RXJqqbwjYGT+I9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB2773.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 10:48:26 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:48:26 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
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
Subject: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime suspend/resume
Date: Mon, 17 Jun 2024 19:48:16 +0900
Message-Id: <20240617104818.221-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::16) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB2773:EE_
X-MS-Office365-Filtering-Correlation-Id: a0303470-6861-4a7c-678a-08dc8ebb0466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|376011|52116011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CRDwL2jNiwELAboYa/YC+bWF+ZSPhbcPVBINfzMk3ClqnSPsEoYQhSfOdy9O?=
 =?us-ascii?Q?O19wG2MAg9KCB6iArsOJgbkhtF7RrhWe6jM1rB/D9DHgJaAyPuYegzYKn/Ll?=
 =?us-ascii?Q?vx5DtezqkAs1dttAthpDDwTuvGruiqu655br7go3wHg2hfV0qWaQxOo1hmN1?=
 =?us-ascii?Q?PYv/uyRxUrykcmwWFr+F+OhkkOUWzhq5lYSfr34H6U4PFTlctX41br/7Cw+H?=
 =?us-ascii?Q?EEHaBz94syUk/uvG/Rhx/vHwGvJzRPB1F+l6EjIawIFhUXUPxgbLHO+8RmAf?=
 =?us-ascii?Q?Dudk4v7im1fzloH+x55LNxTrrVhyt/sKn7J8KfUjAkdCHT21O+py8EX6hs2p?=
 =?us-ascii?Q?b+QM+ba4gFeCRYEUEd1RrMTphRMsDhUN2ApcgULr6f/OsfZo+5YEeCL+DTjz?=
 =?us-ascii?Q?wvc+yMUO6Ey6aGGJIBGX9WDOxe7ec7yQivQ+esiua/z8oQU9a+0XD4jPsyS7?=
 =?us-ascii?Q?RHXCHdoi13/e6w7tfhoQWUM+3NtwKitY8mnyf5JBgqbFGmA0/CUJXmfn/19f?=
 =?us-ascii?Q?KWVLBOm8Xu5/lzji0UL8s98waL/ObQmsVmx3UBJqO+Km5XQMDRsaFl2MkM5h?=
 =?us-ascii?Q?J+S6bpRjozxZr1uYSxm9azBxn1aC1v5IaWQdSTIPCf1MsXzjfgFdOgHpRkvC?=
 =?us-ascii?Q?cTJB+OZK+w13s7Vt0zcbd1SvDydtnbX1cPTY1kW5hHcvm9Ypye2OTOamLYOU?=
 =?us-ascii?Q?ImJI0O5bvj08SuVpC7uxyhj2Fzvpo7IKMGiGTjhhk7TLAXrkngzfe/Yn1jj0?=
 =?us-ascii?Q?vHh7qzEdz7yl3X0tM/RQ3lbGiiYhoaXM1xwYu3OYw39J/yK6B0e1e7cXSKfb?=
 =?us-ascii?Q?4cppQfhpKwdMvtCCVXEUoSyzGlQlJXECuitIrxXyN6Qs8w9rkun8Zstlm6pF?=
 =?us-ascii?Q?eTyg6uCPjl682XVCb9ow5AIuIahcQvZwkfJ5zWO8v/QhBg456rBlaHkM4T/D?=
 =?us-ascii?Q?8wdv/n6kCxkiWbVxqkG9H0K2Csj2R3Rmc9QJKMU2Z5Pu2yMMjA8VfhNUcYoW?=
 =?us-ascii?Q?J5EEwuCJp4WYCPr5vS7cLBtMECJ6dC2NB5vHgoLpK5hLin2jc+KtfNCxKibI?=
 =?us-ascii?Q?ePRRrJRv0AcE3ObgMhEJYSoqvGnBPwgf8vXDzLxHRyaAzY4xybgjdcVPyNCt?=
 =?us-ascii?Q?3GKIGVl+f79N1Dr9hHsoYm0RlpewDRXiibUitBmLvGCM0Aj4Jiw/zpD5ivJK?=
 =?us-ascii?Q?wEDjQtGuskzJJeyc82kbQhnLBnJgXV1nWhFthTJB9ZWq7s6AtxYCA13ztLKv?=
 =?us-ascii?Q?NJ9jktFjf6GAX4WK7oeyEd7Uz8ygNQUAlBdeoU+up2ttDzsDT3kk1MvBRRpU?=
 =?us-ascii?Q?OSmAoxuo2Yo9lM8UpYWrrXhcWzvtIHoct2JdJHcVykBJ9UURUAb/fEUDFLBM?=
 =?us-ascii?Q?1i1EfMo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(52116011)(1800799021)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wMF3z+3ndFOrgjHrXIsf+TgdiSJCOq5DrrQI4Jk5v0DAAUTjPu/gcjJ1aSpR?=
 =?us-ascii?Q?JXUITRjAdoMpQYYfRVhrrqwOoC5XI6dJtTfY/OTBwpBN0tnoSlK0m1vyMy5J?=
 =?us-ascii?Q?8oMmc0fhFBDZtDMb5wPLDz2skr9/BWxGSg07Z/Q82u7zcT4EW/3Nne+W2692?=
 =?us-ascii?Q?yIOKC4GzRO6k89ax6ZmwINMbe9FVh5pOUYGXnU2CGld7n7HsuOuqZroJXhU1?=
 =?us-ascii?Q?jLN7fiy3x8CAwixjWV6WSt7SForWWp4LYAYekhQhWgI7shxOg4hTY7mlaQaB?=
 =?us-ascii?Q?N8bOKIAnQ0JysnxxVHJL/5oR/g+8ukJCuOdN1vkU+4KnDYU4zkTUDXSbQSKS?=
 =?us-ascii?Q?FmrM8EENEEjg9effQt5O7YUdPkyBGiLd6bVij2O5Ffgm1q/FcV3+telsEjLw?=
 =?us-ascii?Q?sEZAHUAcXhsUx9/6D4QeDIXkbaS82brUFmiPJD87q8uUjP/PFjiS58Xde3PT?=
 =?us-ascii?Q?geEHJtBxd2tnXPVvgOU8l9AvbI6bJvIAyKsZVd5T22IkGdzuSbmIejlfCDjL?=
 =?us-ascii?Q?Fq2uWDH7VDV6g9V2t+EbO+ktgxxnk122qqSEKxkHty/ZLjtas3C2bvpc+17U?=
 =?us-ascii?Q?4l9kWV/+QfOFbZQXj7cu/PLYZ2gUDasUl+LgkDEy7zkbSGzx9hBa0J7E2dt+?=
 =?us-ascii?Q?B6z6yup93RcMz8B0igPGsdphoR3omGLW0YTsTkB7CIbkRTJdIQYDPYWiwP6q?=
 =?us-ascii?Q?FqEwlvs1SYot11fQ/vj0yIvk8DoGWsxlExIcIoZ4jzdpmTpp0YspkxM2h4kh?=
 =?us-ascii?Q?baj3x2HrSnwk3OFfUMibpXZUrh/oidtUoM/LPvEtxnc9zOuVxVLiVYOc8bp4?=
 =?us-ascii?Q?EYtr9bnb3ZPfHojliP5m8hKmJIiSAL4EQUublO9Znd4WYz/zOX4fbfOMP2w8?=
 =?us-ascii?Q?Hd0bMuHr4jcESh6Eeeem4wVLLOqe7mOSpmeSIYuWQi+4+jjptiR6oe1mIP6S?=
 =?us-ascii?Q?sNtj0XyHy1Je06u8gnE5yXtfMaM75rTZDr1yAvNgw3V1hi7NfRS89DAqTpeF?=
 =?us-ascii?Q?U+4Y+RVXdnCm7DTb52kkS4KUaxNAZZCo8TEjrBSEdK3xRkXm6H6R9iDrdtE8?=
 =?us-ascii?Q?HmrmHbJaW5cCcWuP9QCV5zn4rahT99e4aKzHzRM/sQiE106jHzuS/PKODwZQ?=
 =?us-ascii?Q?v4rwOnlZyG5yDKGSy85SGE1UtPdNGPDyhaWaV4PZTIIzUW67OC+7vb60DRAx?=
 =?us-ascii?Q?KEs5kgXLYz3a5zxUj5N0P1sNsEve8+V0JSPpOAzc+GPKnWuhW/eIstb/0TUe?=
 =?us-ascii?Q?UF2a/20as5MDhtWkEkBf2icUtLT1BWesifNIofGCMUNXITqTYAkESxso5Cft?=
 =?us-ascii?Q?FjzaZXlbU7mL54tMOO487Ym1l8uKy6k+cnYyzgUnbyXBNKr9MQnWDxHajdzK?=
 =?us-ascii?Q?U6mv70zulFoIwML6blnwIqDUGu0LCEsvidMGUE2PIXeoiJiWiVbSt8wkfRr8?=
 =?us-ascii?Q?idfHBwlA/I05HwuUigOfDp8+dPiNYtxD4aM4/jjbF6/ZSC0U+mnzyREQM57V?=
 =?us-ascii?Q?QlnVbOxYuMGUjqOipRO0acLT2QWclQ40fkCin24rYhsnbeN/qj3yqOyjo2kc?=
 =?us-ascii?Q?AKUiAbKcWfxy/RRnCaLMbM/Otqmu+4VLN+MKUHbaBkhFtegggL/fD7LH6LyY?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0303470-6861-4a7c-678a-08dc8ebb0466
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:48:26.4627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RiwGCE4/4kfhe0tu02CA/KPpoGqzYrC8cujZLv+oTHEj2P+KF1BEwd+OuHFkQc3AV4XE0jXLKMaqzMpBz7vj1CMRP/8OcD773M8Vsgnb9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2773

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
index 6ef5bd5fb325..dcdb1eab0174 100644
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


