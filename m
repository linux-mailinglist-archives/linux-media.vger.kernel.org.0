Return-Path: <linux-media+bounces-13418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6BC90ABAC
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 844891F26C4B
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45483195381;
	Mon, 17 Jun 2024 10:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="VtwX9kbf"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11020003.outbound.protection.outlook.com [52.101.154.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3931194C67;
	Mon, 17 Jun 2024 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718620934; cv=fail; b=EuslFhI/KTEDFlK+PtMXQH0Ch4hRTcYpFpXRbTAgMji65I2IkzIHhVgKvWI/Luw/zbZy3lZ4oPweVXuoYn0W3nasfuYp4WYonZkPyMI2vkD3dNo+jS5PGp+jW+0BnXud1QVVpHov3e4ZW/jk7a9yQ8h+TFSS+o5HjkgV98MnsGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718620934; c=relaxed/simple;
	bh=3qILsRgTVn2kyQW/Ny3d9ROv4NxhZc6gY7nfpP+Ah/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ys9hIHheM8j0VVnupBQpDqFDyRRH7UYZE+d7fW1hb0cLT6QulYL/M77sqRTDPKYMpY3NLWFksH4kv+xF4HJpvwGuiQNGlZpWXclF70zP8tcTQ9yz6Xn8AaH4zLJebNTxEcjv527gow2AZrRFB/A1ttB6SNzn4SbLVVA1IKHoxcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=VtwX9kbf; arc=fail smtp.client-ip=52.101.154.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCTQ9LrI1kRo4hP6h/Cyq8nc7qyUsKt98Qn1CYfUkuUx4LbNZdCM3lY1zAc8ruwxJ8OhgTb1SkPhB7tAtYgo6rr/PsvfFnEKWW4tvaFleoagtO5VmUj24TjqUxSxfYHKyFKTAFC3vK6+n4bLDHMD3/roTZYyx39gJY431e/PO1SnfArFESOPyltWK5HNjDy2Mbitj8eKwHPJ3UXTvyNyDUCK9jJCitAPdH6oGDeE1MayTndwBykfZbWlpi3Lx/wha7snwI0Xz2TmdaC+vSrFYBdvNFvXXJSzKywuzedkUHekHBTgys8yn1Z55q4BO+/c047FKe16iMEYznON4A0cWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGdEGCEqHtYBaCTzewF2uQr90v0EknKD79yzMufk/lc=;
 b=PJe85d1I0v480cjEDigFPxbi80KQiwMUdMljTn07UHcrUXhsye79kWHNe3LUfOZqkxzOE8otTLBmz/wRVIjHFTy+8GcDxD0/umLl2CemBUc+5xa7BTkHVI+FMRu6dbqN0EEWh57QCtinXHR0Kkj82wakR6zcG7eQKoJ/fHV/IzsezI/saoOiHUcYOK7UTRBpWjL3wa2VpqoE2vhpWG6oTJbxzJhWnouoA9uX9aKglSy75xRa8H/zj+5PDTRF7mGjoehmnGzlQGnaxvdIucfAjLJu+TzV7fWK1tr/ZOyD0GUeEJamrNABBMQsn0VvqWy+El7dE1l6w/HNj3yUtos60g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGdEGCEqHtYBaCTzewF2uQr90v0EknKD79yzMufk/lc=;
 b=VtwX9kbfCPjl2+vdI8REWqU4uWUtYjQY0jYpTcVMr/6hbvv3LY2lDRCYGprfnup+HoTq9itSN+GKJTm4P/CUOajR8M4TMU/nKKtGye8yWRScj8P3JGXyRxtK7oihM8Nmtwzyc6v6NN7UsIeyasE77Do+mFanjrLzeB0kJkjJCy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB3099.KORP216.PROD.OUTLOOK.COM (2603:1096:101:282::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 10:42:04 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:42:04 +0000
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
Subject: [PATCH v6 2/4] media: chips-media: wave5: Support runtime suspend/resume
Date: Mon, 17 Jun 2024 19:41:53 +0900
Message-Id: <20240617104155.153-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617104155.153-1-jackson.lee@chipsnmedia.com>
References: <20240617104155.153-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0185.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::9) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB3099:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6e8ac5-9581-47ba-6c70-08dc8eba2094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|376011|1800799021|366013|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hLbAHoNPzp2s7+Fn7qVTh9QE6qhFgkpbCNFtCgp5ZDOpMi4HdFiz8rZDntpi?=
 =?us-ascii?Q?u4LUcjiYJvjNRp3cSNzqtFPVzbWxwF1nhfDVK119ZsW9vdzCuUzPv0JAnNlx?=
 =?us-ascii?Q?D6sUxC+MSdZSUzxeGUE3Z4mpG7Ey/BaOXNQg7ARYXwk/FlPOdfEzhEjqd5rC?=
 =?us-ascii?Q?iReOg/pX+59r/URun742lNW/puVSY0i1Z9yarpPEGbFwn1pl+tcE/QJDaFSV?=
 =?us-ascii?Q?Fe9HakQSJn5hIU1PbLjnq4iLoTsD/tuP1pfE1zjIujKACCT/8qdoaMzVfB1h?=
 =?us-ascii?Q?04aEfx8YFlU3YfNyzSVlNi0GXUoNuJrauzNr47BH25vgXwR9v0yXbM9IpGhu?=
 =?us-ascii?Q?v8XZXoTuMPexK8PTZFXzpMl5+u/ZmUqI5Lua7L21LOYx+zHGszwHJcVG4yb4?=
 =?us-ascii?Q?jAR7Jc3vj3gFIRaXHX8wPX/xfV9RGmzaW0Wr1oyXRu+Imc4pjDzNu4WUTRZd?=
 =?us-ascii?Q?ltUTz7N0fVK8u5R+I2O8+61mybve5kOs6UnPnOJ8VzMrg9UTE8GsGGOddCIB?=
 =?us-ascii?Q?bEYXMlF/KCVqm4bC7qZaUXWtRJRpmQheN0d6vAsswFwhtxbo4SVSQBGqK3TN?=
 =?us-ascii?Q?RPjtHqFwiWitWvRpMck2FBs9QUoQWEJw95MkiuiKy45qzoqt34a60x2e/OwU?=
 =?us-ascii?Q?aTZmD+ojJ7QJzddHRkSb1+Q7GWVwNQHJmSuRL6pOq75D/OOTuTvBOTN/ogLF?=
 =?us-ascii?Q?Z8Irrci/0k9M/YyV/FdCQgBkl5fFEuOXkQPG5OjjFLWfyUJugWiPA0rTlbHI?=
 =?us-ascii?Q?WB9U2wWHxVTUpggu0cIVKXZQqgUhRncaHXhzHv5ovVs9joTpQpgGG6qcCLQv?=
 =?us-ascii?Q?JxAl1rDUJH3mVRiVAWzoME0ddSjXLrzHQMAU58pJm7WL42coy5zmPThYG/o/?=
 =?us-ascii?Q?CSymjZPoKZD2g/Ij0zWS8kqXq2jdPNvUnOQfAo3NUuKQYFqqQVwtN6UynGK2?=
 =?us-ascii?Q?fajmeXuxpdFIXhsqInaLiE09NVsHTxXixFsA62PBI4mOWBSZmGwdJbJBS7I2?=
 =?us-ascii?Q?E9ZVmvriSAKEt7hM8xH88lphJ2psIFl5FG6pNyRegKDG8iVrPdkZhAhm9f4H?=
 =?us-ascii?Q?RVjXWVrB6zslo7BNRvimGWEQM9TxAy2kFWGNrWZUhG/Ct0wRCx5DhwrtAPFm?=
 =?us-ascii?Q?JTvyLAb28LgWi8BqcQNlmazWRPa9vUnrez2Q4XnN9reTj+licse5cPBa9+dA?=
 =?us-ascii?Q?4H82EI8TgsnPRocEaETIhViegUodt/gGTd516rTIse4RwNHjNgoevP/7m7D7?=
 =?us-ascii?Q?3BGbhbTdYQ7xgu0Vu/XpCgdnYviXBV8TkTFua2+fZtl1N94QGkCAPvNdG0PX?=
 =?us-ascii?Q?7xj3MsHD45dhbDNS2X3oTFtXP8lytBEf0EDFyzYo+qMwqhLI3MUpZVLdofKI?=
 =?us-ascii?Q?uG0yfJ8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(1800799021)(366013)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AayNjS9Dn4BHHQJB2sRflFYnqaO97jPvznYqKZuf5auFJv2qfRaQbQvcbWnd?=
 =?us-ascii?Q?s7BTjfL/kplYk4HCR7CFGKwpH+swVIIXJEkZKryluLAaDbFLtZPv376b70Uz?=
 =?us-ascii?Q?R4ZCR68kz26W4dS9HZ0iWVvtKl8AIMGkHtCzs8fj1jZjSuldaABqq3a3cfH5?=
 =?us-ascii?Q?OLIrcnE8muC8Jb5Ey9iNPAC6DFRj+5ND+fjs5RoG/QHABJro9x0keSbN1sJt?=
 =?us-ascii?Q?LW3paL4tKZ70AvjQG3eyuIm5OmbcnEeS2yWjJYozHVUvC41CVff0MUyvZmme?=
 =?us-ascii?Q?ZKmPorosx1zI3bZys0hvUkvbazImS0bmM0/1Xphk3wktzB69nODV+NATEc52?=
 =?us-ascii?Q?r7i9mieeoK57MZULKMlc2pSmfbfS8kBddagXYT9vug11ttuIwwvPv1xz2EOc?=
 =?us-ascii?Q?Lv6VfZPTLIWxGjyqtE5weJq4DgjnbXdn/QqOFV3hMHdORZ3XRI0vOpG7imHO?=
 =?us-ascii?Q?doO/Nv6di5Ufj0NXa0+yPkEoTC8dRvWJENsqARKoK7wkytrPkyzsqHzz+Z8i?=
 =?us-ascii?Q?GTMcVCdGqxG9IplhFdwhC3rBkI2qsloNYVx1rQhWpXyPPwMvFb7wphOGbOKe?=
 =?us-ascii?Q?+1uvcFW0wp67p73R8vktsMi04P7TzTkrA1djVsBB90HX4BzPEJumSOc10UTI?=
 =?us-ascii?Q?OXT4PBx7CQl+e29hqt2V2WNPohNrAiVUT8HN1j/nV8zGcsiwCVgcmT871U5/?=
 =?us-ascii?Q?cV4mp2kY/nvRpJh/136IXTcuuLITt25/Sh7pgESS+a5NaIWvNcokPlFipM0H?=
 =?us-ascii?Q?yU6mX7ZKZSlB0aobnh0MvIuaCre1nWtEOvWwnZ5oMsx9FAssHM5AkIRRUTGI?=
 =?us-ascii?Q?KXj54gjO+jYtO8hefLvyCxeI4qS9frzVt7YHty3dp7FW2cCwJuTgHDfXyqxt?=
 =?us-ascii?Q?fxzAq2vvZHq0WVBMDdwPUyruV+xs3lm1WaMa5rX6thXtJXqsiLvKO+UUG9fi?=
 =?us-ascii?Q?1SEs4+KoLY/FNjl9KOX/L4R3th7Lt9aBIeE51LB2IsVcT9c52nuj/eIYAFFM?=
 =?us-ascii?Q?nti18sRfK9PXN+t5CTFLK1U8VGtT+AubQ9UJI648w5HbRQwYu8GW0iEYvx7U?=
 =?us-ascii?Q?J+YOKFUbhCVYfAaXSd6bb9p0m1mi8GG2Kuj9wVCYG4OBpTHVeQz029qAmWFk?=
 =?us-ascii?Q?zHISQ2f5z276yLzFAo51lJK3dypEpwioT67K1zmC934jMwE70l/zb6r1lwFF?=
 =?us-ascii?Q?u20rpxpAX6Lvav+hPxhk8bRuHsFuZkKNEsRN3ok7vr77YK2JRQpd/ZPuSBs6?=
 =?us-ascii?Q?7yzahPZmMhwS8rVdX3N9R6Om+dCiI8p/dbXP/mbBIHLr/06JtxEg94nGmBcx?=
 =?us-ascii?Q?wmbBLR0PhsjvjM5joHtFCxSi6zE0MrjVcTeraARlWqAyXG2qDJF8xBNSc86t?=
 =?us-ascii?Q?lPtuSbKrqCrPJmooo8SC9KNstjDu5gCPBuEP1wxXD3MNVbFWVdjuQ97pkxpP?=
 =?us-ascii?Q?yyOE7ZTu9S34rE1gmEqrf+QqjCM/17mQkMAvOuR0vDiLcnkLtvfXcsZXZh/G?=
 =?us-ascii?Q?S4RNLjIuWK7EIgu7y9yK7JHR8H+MAkIsC8RA1td2hYazhes6eH0DB4PReDas?=
 =?us-ascii?Q?e9Azq8hUmpJQ2Nac5MtMAs9GyCPEe7DR5fhzl8qhwUYb/E5tBVB/aBjE4qCu?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6e8ac5-9581-47ba-6c70-08dc8eba2094
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:42:04.2575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dv97GE4ixF7HHojuGAbiyTLyKt/vvfjOZQj0uv7rKgZ1y+JO1vz4l7YNZ1TIyD/rmoPY6LEgZNY8qGSRp4NSSdur7z3hlS+qOs+rsDNclkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3099

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


