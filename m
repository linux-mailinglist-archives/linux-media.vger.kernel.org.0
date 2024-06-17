Return-Path: <linux-media+bounces-13376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 576BD90A38C
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 08:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E383A281C25
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 06:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B83D185089;
	Mon, 17 Jun 2024 06:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="GVAnSZ1l"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022018.outbound.protection.outlook.com [52.101.154.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4B117F397;
	Mon, 17 Jun 2024 06:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718604011; cv=fail; b=OGby8jThfCNFMC4vhwy0ygZU1mo1pHWuZMdX8FAadGktwAqgpNseOlzOdRRuFJXg+0bRsYTZQP8YaGOnPJRL8G8ePpzNpyugdjQia6iQkEdCx7Bny9X9Q3gchP2bMPXfuo3t7XvXrFjRU1moy4pdC5BKESRNwXC7wvHRbNFwAg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718604011; c=relaxed/simple;
	bh=3qILsRgTVn2kyQW/Ny3d9ROv4NxhZc6gY7nfpP+Ah/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p0IhvgGZqt0/jiI3gdGo39AU/wxyO525FshIcS4Y2UdwZLw9s89JxjrvpHjO/M/jueKTeevqpS5KHKTzHhBhtPEoxS2jn+nBEodpuzrsQLXXXXLrCTw4hrb2xzAVcpVdtrKxq0vuUJF/jSJkfaZTR0ZBaWdQ02NdA9pfBQsqbaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=GVAnSZ1l; arc=fail smtp.client-ip=52.101.154.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+jJmq0g79tZZLA4HrI6aDdTGFfPY7nLeZIWy4SREMOJsTitzC3uFpIeFRqGafmPpdOj1pKFWYDNPUnagOVXOwTUvevjGsDwZbW38V/Za9e2V08TyRngQIv9mtTR/nbQwyKkb+tKnitI8fF46xCvGDwGj6p17LNQb5UNawp0c/sDIANEFcIrlYxPojApmGhelghcyMUOzVWq6+T819j9op7xrBib6n9gKF7La2LrxYBd01iUkNo0GAqQw9PFTZBUQHQYoZOAHutSphjRlyhW/abqTUHHT7BFbxKAtxSGXRKrDWppZjFiTOhQUhC1DEl7VO43cAAwiOCgx9JT/jxNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGdEGCEqHtYBaCTzewF2uQr90v0EknKD79yzMufk/lc=;
 b=L1S8qYojTYUf3Wsm6NhQAEJk3cF51NvmL0MwEZqvQ8Le4g+XP9WjGk7ex6OMiSOCNe40n7/1XA8ErtVK7bNwV/csKg+Cr0oRxu6e+60ixXqYQTnGBKMcN4bWyGRaYkx5fVlyEnGw0lP/CJ9zAVPplMoR7pz/3jAh4vtmZ4/PzZAnUnKrHA1mgrEt3SdwfeKhraswEHqOjndtHYTHtfRB/x/VFObbGl7nfvFkwsKCqx//0wXwPqaC0+LU3nrbEFAbvLAhxsyCph4v0sQIlKz6WfgUMwZ7cX505CrKm2EYwhbFeQ+KaEcrzynOch7T7scC0IVJ6S0drnDQib9whf3J+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGdEGCEqHtYBaCTzewF2uQr90v0EknKD79yzMufk/lc=;
 b=GVAnSZ1lr21skn4qXTd1PvZOLywoVoq/5QO2jPRSciIGfz441/D84BQO1h69xxAfa1IVRC/EIY1XE8w3Jxi4flESNg68R4fZ1x/NzmyQA7SoQ1kEeJ39zf2Jmbr2QON0FqLCnYT48eTOm2nw7sJSixvJhb2QrmUN+YKxEBakcOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB2915.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 06:00:05 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 06:00:05 +0000
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
Date: Mon, 17 Jun 2024 14:59:55 +0900
Message-Id: <20240617055957.135-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617055957.135-1-jackson.lee@chipsnmedia.com>
References: <20240617055957.135-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0153.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::8) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB2915:EE_
X-MS-Office365-Filtering-Correlation-Id: 5991487f-6956-43a3-71cd-08dc8e92bc3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|376011|52116011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N6fehGyRT5uSm3Do5XCgQaYUPao+8SB1G1gv7jepkDNKzlG7Punp7b9YrB2t?=
 =?us-ascii?Q?EKvLmnTCglvuiV3lE2OJRDep7aMt3J1lC4xeVgBYdO6NTGkmyqb5owbIihLR?=
 =?us-ascii?Q?vvQk783wY4t66kx//zvptYvt5PK7WMwbtInR+pNSfqnxl1U0YnkzibQUGKea?=
 =?us-ascii?Q?AWfMEgLBnra6lvID1baOTpkJWFDCmeYdtYFTF2Cr4qKh/jVW8xVX9VaeX3nm?=
 =?us-ascii?Q?Ypns4HqpXxCdoqslOf7OeUQFC1Q1MFv+9VdNO03wMg8tbNusu8Z8IdZjij9d?=
 =?us-ascii?Q?41YYUeMKl9zhIq0UIMVd4gfOVbaUCAB22h5Y2nkVdP95zQRRVn07wz7ZwoWG?=
 =?us-ascii?Q?rLSoflY9d5J7TpvDPjsb877xQ7/XKL00b2fvasFXpjEX+Tej6qCLRnmZIjy5?=
 =?us-ascii?Q?5fzp0gtQtIVN+GD10EJORLWIq6ZmX97dV47qB+p0vDkKcnkf7CFl+Y74KtRy?=
 =?us-ascii?Q?56iZ1WHX7xK8BYBOp6rOJujq/h6e//qks09YZO1YHWHUtVMft+iIJYEn0fwW?=
 =?us-ascii?Q?DPmhC7Qg93tn3wh2IyDfy+DWieaJuzSjbGhEBhyu0H5ppXN0x061GtFuEC84?=
 =?us-ascii?Q?Tsn++mC4K3hAT/QpFL94euZnRHUSky3Aw5hKaQOFuwrTtsFyU1cIzyUTC+B0?=
 =?us-ascii?Q?fhE4wZsIs2sFlJZaduu9WlV25jAIlbd7MYjHwB2Yzth6fQm7He1uB3jby94U?=
 =?us-ascii?Q?0upY4inBRfblAATWhThvVaCyYuaa2DGI2dyXeGKCw7aNUORzbEBnmwNEZpml?=
 =?us-ascii?Q?FFVRMfmiUP+gdWpwcbr5BQC/BDznH/qtof3FVal9PVu3BHRkItxZmVMaI2Lc?=
 =?us-ascii?Q?HTWzzTYvC3c/sG4Djs5XJx+byTjPdqb9eJNqWIUts6ylidL2pvhsKmy5FJVc?=
 =?us-ascii?Q?qVOuPBehPm2ofJjcE98SjC5AQjrwmxgOb4ZuYtIkXpSx0uV/Mk9KOnEw0jH2?=
 =?us-ascii?Q?Sp+xs2/k4U4rnmZ4tbr1xFHp4CuilNFjqJ87fhS62LMKc73oueYx3cL4LRzG?=
 =?us-ascii?Q?RYjd3i+kCa5gl2Wb8EtgKe/1jjlqEt/f0/3tPVFZ8xFHvnN5XbkGDk5prSg0?=
 =?us-ascii?Q?Ogg3woS0Sk4MPww39umpQ1AUJPSW0RBn5zEe793kN6GZrbf6nHjdGLDHPPWj?=
 =?us-ascii?Q?4fOeLzIipTClX6YBEbNM1jYbPAT1Z1qok+9su5DF7K8nlEE8Q0HWa6GENxLm?=
 =?us-ascii?Q?J1bDTSJXAzdYVVPN/Y/KZU5Ulnx32h3ZEAuCaLNfmXaAMF4swWcgTFy+m2W4?=
 =?us-ascii?Q?UQU5UOQimEQYSGQp+QCrihP/6Oij7kWe4nIA7oTTl6RILEAITvDv997F7Mb5?=
 =?us-ascii?Q?DeHlf9zS8qO25sdb53qUJeR3uKgfSeyBDZteZ5KM6joA6SId2gkc6dBvqnrA?=
 =?us-ascii?Q?7sZaHQk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(52116011)(1800799021)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VjvroeG6379pw8SEcbc1viWgBURNpsFe+TicXcjVybU5aeMzvLpNzEwzl6wo?=
 =?us-ascii?Q?PCmuVJOh63tlKsM73NX9Sr6PFl1b69YCrlg9IFM+jZHbfjqMtq3r33p4b2ce?=
 =?us-ascii?Q?tMFmLgSu4AGU7YFdMfFCXvf/V0bBRA3VPrwYvL7zwGiVbNHcvjCjg695kw06?=
 =?us-ascii?Q?3nyVQKzsUeLISCtq96g93x+2UMuLHrGAI/VQLqLj1zcI5/OkoQEVM9QRnzmw?=
 =?us-ascii?Q?Fk3ci/Wyl0JrMf8mDxICFzS/65Jt1EX90cc/zSxOocqcBgI3zf8fpUgswEVM?=
 =?us-ascii?Q?YTiHoIFDNFCKNndacnvDKITgQPIogMWz5tEdpRuN2Gcf4vJW0Czer+hiUQDK?=
 =?us-ascii?Q?ds9nvl6G1PuKgDSV+2PmGcX9QBgmYfgngvILiLjrfJKwxxeXmwAxQ7LKXOZA?=
 =?us-ascii?Q?pv2c1KjDCe89sMhHGNVnIFHVnhJxDp3tdrYKcAB8gh2YdGA4huarCUfAjRCt?=
 =?us-ascii?Q?4MYqVUpUlk9AHgih7NVNsOFxEpJeAKKbcT/cJezJtp9gN4yY2+UInyKu/YrF?=
 =?us-ascii?Q?Gn0fLwtIVsTe8A7hP06lt+O3FrwcjbMQy8pgAy680ggPXRaxQC3ghqZFV9qa?=
 =?us-ascii?Q?FCb9jyOcI3gi7Ck/MtjLHj9SCH4OvLKwIsHThOmpBW2rXvNznxDwNW0SJl4O?=
 =?us-ascii?Q?zMBocJY2pHmo0DsEC05YUZDIzldxxEorDqihPIBkbSVLSeXUNb2YCoAr3BwQ?=
 =?us-ascii?Q?QfY5fPJzIQtlhnYfx0OVpcas/YZS3lZsqSNYCEH+YC4rbRsFFX8FX2qzxfut?=
 =?us-ascii?Q?Dp7eyxMkdRfRRvLOHcQzriQq+3nk2esfl+50lEaiYQh1/J+ULbFOv/OwKm5/?=
 =?us-ascii?Q?yo9HnktXUwkGQ3OQ7ExzU0tfe7PYpLtBqOsc1XtgBLqr6ZmP7NOD7bCPvwcV?=
 =?us-ascii?Q?OWFpCahdu0VzMpcJ2WbrMZjlmShgJiFca/KwAXOPELhQM19Y/CQjcY3tyiCA?=
 =?us-ascii?Q?ANRAbHZiFAPl2i1pbQnIn2pJCZr7NqXG6OJ+VacgcGppRhDeZyM4tC+nONCf?=
 =?us-ascii?Q?CAJZgMgPraieXeZiz03INC6MpQoKPdXEYF/LEy+Ez6T4fBbkWjYGglWuoAEm?=
 =?us-ascii?Q?m/ksNn8CBD1VWKOuLP2BN/M3J5JnakGqGf8jNJ9POU3MWqfHyb0TY6Xu/YC4?=
 =?us-ascii?Q?qflj6JTc29rznDng8lsWEWow1eXNQhDJBmpTAkfDZJ3jbpo9m303x2o3zHwy?=
 =?us-ascii?Q?sib25Y4JWNWBsFvzrdtgjQ8YesTPD0f68SCg1yI9O5DNWbrWrZ2sizBPGWZ0?=
 =?us-ascii?Q?ahnXoiU7F5xYy6pm2hRT1pm4Fn/sDRg0z19C4x772XbPkYTYDPJeD5ERVpXC?=
 =?us-ascii?Q?kQWbTlMTbahm86KLQBFRdIsm13sSx+hH5pEOiYhGhyo4MJ2I70GwFWOCFwsi?=
 =?us-ascii?Q?fV6etOFUwz4Th+nuvXkXQpe/RkroKCi9l2RDvYvsbP/l4++M9dyxVh1lEFsL?=
 =?us-ascii?Q?XchBoBpLFDIw/OL7nQUEfcPZ+2Wa7HM0HQejCxmvEaqXRFmHsJwM4QI2dydJ?=
 =?us-ascii?Q?0kcOeaojIEnKYFHjEhpXNle62yQ7T0xxyaU23o49DyR0GBlPmZpUHTuStI3O?=
 =?us-ascii?Q?HOygiJvuC43MzaKEPPBzFTF4UX8PKgRWW7K44uR3X1dcV6QxXvATPoFjwgDs?=
 =?us-ascii?Q?ZA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5991487f-6956-43a3-71cd-08dc8e92bc3a
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 06:00:05.5047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwY60Ndh5o0ajbJkaNok1mRP/ED/hcrxbKGRwF9cRIOTsF3iti+p/UJIqi5Wz+lRFN6TEuJn//5+QxyW1QN+zdMpNy6tB8OYwBirsvgV9oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2915

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


