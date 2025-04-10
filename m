Return-Path: <linux-media+bounces-29839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C5BA8374D
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 05:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D7221B65A1B
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463EF203713;
	Thu, 10 Apr 2025 03:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="XdRasTcQ"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021108.outbound.protection.outlook.com [40.107.42.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2900B202F89;
	Thu, 10 Apr 2025 03:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744256427; cv=fail; b=PM06wJ8AJO9IHojLVx1muE42L8u4p7AZH9QmRrEE4x4ok8qv4IOcs9UK0aQrhaeMeZw/sXn403PPAMKe/cO8lT1afTjn0BhxbqlOhOrcsBZqr/oCJ76KBuD+9SdDmWwU60AjWpU/zn0CHNzaP1QZw5+b31Jls14u6p86/FJkGRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744256427; c=relaxed/simple;
	bh=AH5fObUc+zqLV+I2Jr6qGKTDpLnptyB51QwBL//qg3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V0PSIiEkuU5I9HpFf3thQOOv+SGS48o8ucXzRfspVKx6xC2YA7aJvMUTFpC1JSc63N/JopPkx0Rl8MumQUMVkHtvPWahFsSjEhJ1NOv9Hj/VY0IBfbf1+4C8slfe+pZxWDGTCdukiVk+3KXzPr9q64bpoW0n/6drcUxqzbvm5Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=XdRasTcQ; arc=fail smtp.client-ip=40.107.42.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8fz1RHxJOUhlKNbG1DrKMQlTFt9pVzDUyWgRo3EgNhQuAmRxMeWrY2emy+gefKgh4xC/ZJ7yZZEieV6TiqMmkpNKU226fqVj/uqI9sG2SSNn1FMIXP9iBgsoECvaXqKa5zsuqnhnvmuME2KCklTjwoKQw2hPMC7+wSFn2leCKHAZiVHUfR5nsKfCzH4Ze0mps2wGxeXEL1YVDTM5jTlVdvFk4HsvsZ+xWntxso9K71vj83Fp8DXNKDsU1OD55jCARUAjYYpYhFy3KPYi6TIH3qYsQ7Bnltse4EBbJ9vBLM1bm5lu1eSL5FCWwG3gESDk7LCjXTHINP2HnEEHbEFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggZ2ztAzqLB1oq/qfR/EnIqKJxoc/27dmch8qEAQFJA=;
 b=xfwJjNzM3vi4ZEggpAfPELfFNUiyBQqxL+q4/DERW8rycO9slb7RFXfgHsOKnPtplNNeqFh8rTP8vDeH4843rLS0t6nPPPnDEMmYev0yxj8UgtTTnASOeyOFCe2QpmmSqorJxJVSwXIAxLHlU5xQ9CBrxmdQcFqlcxU5WeUMm52X3fQUL6SNddfuYaATWuSXnAhStxgLMEoAiB4Gk8vPu3u+gY5lgj3cmg7AwGGIOexeevT+englGrciCFWlmOrLS2kMGUt6l1koY93gyJDk8BfxvFe+CUtwUMZDkexWhTtKxT2Hc7ONurHzCKse3xUoS0GEcyhEjHn2aQcABwrtWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggZ2ztAzqLB1oq/qfR/EnIqKJxoc/27dmch8qEAQFJA=;
 b=XdRasTcQKO8HTUz/CF9IkJAl1QPqyD5NyzdJoU/EPRZMxf5oT9voGna2u9/l83nWdGTGMq4RpP1shNWnjVYC7lTjvqMsHq/MaRmAFOiroKuQ+bmdkHZa/q8S1k5ST4Ily1hJS+wSaFsaSUqpweXgss8JPcL1/3svLxVkl7ftar4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by PU4P216MB1439.KORP216.PROD.OUTLOOK.COM (2603:1096:301:ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 03:40:12 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 03:40:12 +0000
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
Subject: [RESEND PATCH v1 5/7] media: chips-media: wave5: Fix not to free resources normally when instance was destroyed
Date: Thu, 10 Apr 2025 12:40:00 +0900
Message-Id: <20250410034002.88-6-jackson.lee@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: e01d62a8-bd10-4052-8c78-08dd77e16674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1fXxEcn2vvu5GinGrjzeRP4PfKYk6T3/CTf9vfoMLZQG4iiqZo2yXX5UGStr?=
 =?us-ascii?Q?qJ0gLdjm4udMMPVfJuA5fROSu7uNWRZtSA+8YdmjTY9YS38rts3UEulB6WUP?=
 =?us-ascii?Q?Sc2diU/6pq92FBFx4DDYg02Di7bFQ6CvCISNgbHd2RxlmTXTF6+5V00m4+P6?=
 =?us-ascii?Q?TGysvK97phnVThHisCoN/rH5m78+WVRUaAzpTYGG0c8CQaXn/zhYGyQd8b5e?=
 =?us-ascii?Q?9u7kSJefSxvfiGN6Jo2tp1AKxHktts8uRY47pW2+jkvRjv+FVWktYIp8rb5E?=
 =?us-ascii?Q?bs1wwoE4TKss7xavQGdBYKlJp7La/cChmvdtJf59egBfWQRj0/dmg7X/sE8A?=
 =?us-ascii?Q?RLgwOO6VcuH7fNjmQyz4CfKvGspM5s6jYGdZ3ETQAexhtOFeZFzy/Cfxq8jd?=
 =?us-ascii?Q?Um7y5e5TFGcWfzOyM/ikfteFf4M2E5n1yuQCRh4/WHC22NnoKRIYoiFBWZLh?=
 =?us-ascii?Q?7swyUSD3UuH9FgpcJ49ZUc36vEGuxSTcfyHUtRS402bwNX3Liqadf+xW9RLF?=
 =?us-ascii?Q?MLfwD9/TNpZVU47P/Iew8t74t+G+K0ubPnKYIFBD0P9X8zDC5EXWc9yQlrRf?=
 =?us-ascii?Q?Gf2lGgN6Ycn3AqOqmWEjnFP+3chktJJjplJeHA8ihJ+Bz9SVHqXZoi36G4n/?=
 =?us-ascii?Q?pjhChJvWwkmEOvvLKihf6iZFAHS5kJEA6yf+MJ4OLJ4EPluh5dDvKBUaYZhM?=
 =?us-ascii?Q?DW2NwcKFDY9874bhLL9c569vRTYq+N4W8K/v73E2NU40+iZRBPSQuCNeGSFL?=
 =?us-ascii?Q?SP/fXMzJD8XkiTNdbZSzQx0jnuz7Gp6At4nL6hgXxibVJ7DI1s/JkBw5TY0i?=
 =?us-ascii?Q?Uq24Zhmu7TOnlkXllADALF4yzqM4Js2aSIFl3ek14oDJtarqPm4GTe/1BbZP?=
 =?us-ascii?Q?1EZTmkn3WGoj1cuU1QkDjkcN1miu8TK7FuHMBN3IxUip6it3LxyrQFCF5XTi?=
 =?us-ascii?Q?3qXfwAZy5lyBQ5Qem/KcyFyLBA2JpLJeUv8rxhBHpeC2SAbiuw6yevh5lyvS?=
 =?us-ascii?Q?85V7a8d8fqPJu2bST+HTt+++jvzN36CxnV50+TYTEVaMdyTX8eJt/u/toWGG?=
 =?us-ascii?Q?MurkFw5PVaqpS9NPKwdyTodCMtaLGDh9Vszus30ZiEMzKGoUeBaYBNvvFSM5?=
 =?us-ascii?Q?74N3xitikkfHHQrxo3agPzn3wdPOtbDcxwFgOeoSEZd3bRPMtreVQ8TecnoR?=
 =?us-ascii?Q?CY8sBUqnLsPb+RLVZAYDHhRoRLnYjuLh5u1xzjEv07j4YiQWAZmfegKLQ2E/?=
 =?us-ascii?Q?Ou/c90ldwY6USlCzDwQUWh9E+EEQdHTo8BYBvooLfRCZKbN5G/+BRrvwU4xA?=
 =?us-ascii?Q?ea9OWolXdLYiJveMI0IuBXuHZxY9QaIv1eS16urMBIioeHhH1FDKCZ9x7sQf?=
 =?us-ascii?Q?z9kvwe5BKTdXeVWb3lnonylmqnUyS/rLmUCFMf7tlb+5esW3hAQMfcQ1QmVo?=
 =?us-ascii?Q?F3/+1tS/DCkFZZcHv4V1nsKA4Q/ElZ/g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I6pu8RoXW2ux1Mzkq18XMc91d2IqWkbyTeiO0eoeerUxQ2n3kXDRT7MHDAAy?=
 =?us-ascii?Q?YYgW6IuDGC8lLRYfUWyYvNv7HJi6gyP96UMq414YfiLXVIcVJ/kmeaHBoB4M?=
 =?us-ascii?Q?vamDpSJbQK/OQu4bXRZ0hreEuauHI+iPtyzdxygd/GMmTF4YlA3+bJObwlKe?=
 =?us-ascii?Q?w3n/gadeX2EhcuQQ5gNSo/D2LEhKb0A7s23Pl/btccfYD8KMpxj2oIBsGs6S?=
 =?us-ascii?Q?v5Tfd81hFqqTDOrfwPopPla6xg2v9Bll7rJUR1hTfdd1zohUpf6FoEkBERdc?=
 =?us-ascii?Q?lhCoHKFVAqTZQxS3nOIYGLoK+3k7GoMiJEvwU79e7jIZaBft2z4EEVPs+ilN?=
 =?us-ascii?Q?XBlT+9n/DW+Ankeyvjit7JPKv4HGraLfUSRiH7jVNxje0I5sthBfCrTxYHAT?=
 =?us-ascii?Q?yNQjJlB9C+05PHwsZL7dH4XwXCEqP0pHGhnqsCMM8uWXiD5tqSiEaoI5s1PL?=
 =?us-ascii?Q?ZgcTnODMbCK64qdHn3i/fYdvRKyx15+2SceAisrMXn5bf2lUiD0gL1jnZdhI?=
 =?us-ascii?Q?x9cd1zbyl8hsFPiZkHbEIKwxp4EkJyDgcFLJw1s7NrWd/NTtnsY7CGqR4jaw?=
 =?us-ascii?Q?CNYkhHDVXfNT4bKpUVrjDp4nfYHeDOCjFOpGCPba6RMh9a2RoliNqosRqOli?=
 =?us-ascii?Q?kbzwzssdZnbvi6O448rb8IWF1vJ2Wo85Vb3ax16WrvsgDIWwHTfE++jfjvJM?=
 =?us-ascii?Q?6LBDa/2KawOLvh3TXR1le3apPKmrCh1vbjtW+k+4riAGotAiMAI3upTh+WKw?=
 =?us-ascii?Q?QfS9kT9y28rUUiD/25eh/T/G71EBhGk+CvxAhh08YQ7rvfk8Xr08WcWp2VK9?=
 =?us-ascii?Q?XWuQs+PN6HBf3ZXbN2d0/rof5o7eq1D8G2Yqh/1EpkZobztrIb2jAj8c5c2x?=
 =?us-ascii?Q?HIe1QyaWe1E9bMBjJGuH/cAN0NGXR/xStL09e51ERjZlyPicsgzGuELXSWdf?=
 =?us-ascii?Q?AXGPEba5W7gKMfBKimf4ppT2NSipH5RVInPqyXblYPkQJZwnrr6aSiz+u8pS?=
 =?us-ascii?Q?F2gkH8bAFTzeaLdaExBGyB3XQkvU+nq6t/UoY2USfVhfKu/oaIrinF6wNP9B?=
 =?us-ascii?Q?dafVmdDeAyYNyx+nt49Nf7Us0XjtRmAAsLDFg+JaaTBPUzWwdCi3RWLtPHE/?=
 =?us-ascii?Q?+gBmVnVQzalhxNsaOLWiTgwP3AwUkM6TeAj6VTpcUT3P11ZX94FyGnj/jjyq?=
 =?us-ascii?Q?WIGdmvP8KXa6PyXXCsUy8+lWoy6JsDuDsET6pbh5DQfpslSMVr3GyMKpWMni?=
 =?us-ascii?Q?xS3rpBcUcracEmrG9aMnbAXhYDuBb1Tx8FtKXHHAnDSMOKo5m9xboukXPodP?=
 =?us-ascii?Q?erzNTtEihn9Kh0aTJ/3aOvZJmSM80IW7mA0Z6wminqTGJAGGH2k0HQS/j56u?=
 =?us-ascii?Q?dQaek3rfKBStq35qhJi1Hy6mVEQ3TM9i0NlrW+GO41hoyH3aDVySG/tLgn1Y?=
 =?us-ascii?Q?uRHD6HWy8bYTNN0vDr8bwuDkvibAcSe1VtJe7iD9alXWdcRTZWBurOFl/MwN?=
 =?us-ascii?Q?4t4DCqWSaUCVHttEeWuA8cT2n0LCWXOvco8+1mvV7x9lpMdcNdHD/MBSC2Nf?=
 =?us-ascii?Q?+h03fX9lOrhVG+G6r66lhOkth9wii0e+Rvqiuf/kjBv3eWgtSIQQlJVq1xW2?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01d62a8-bd10-4052-8c78-08dd77e16674
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 03:40:12.8269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRQOhDqnsPrPbd75IdukdwFztDGRBpUEeaoIYwcSQMslLDkhitMPSMmJPWTQT6o4qxhC7nbKLlJW5eSRUfwDbLY+InBq4Epd9gNfbauieN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1439

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Since applying performance patch, there was a problem not to free
resources, the root cause was that timeout sometimes happened after
calling the wave5_vpu_dec_finish_seq() when application was closed
forcibly,so if failure reason is WAVE5_SYSERR_VPU_STILL_RUNNING,
the wave5_vpu_dec_get_output_info() should be called to flush videos
decoded before closed.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-vpuapi.c | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index 68d86625538f..d7318d596b73 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -209,6 +209,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int i;
 	int inst_count = 0;
 	struct vpu_instance *inst_elm;
+	struct dec_output_info dec_info;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -229,11 +230,26 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 			goto unlock_and_return;
 		}
 
-		if (*fail_res == WAVE5_SYSERR_VPU_STILL_RUNNING &&
-		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
+		if (ret == 0)
+			break;
+
+		if (*fail_res != WAVE5_SYSERR_VPU_STILL_RUNNING) {
+			dev_warn(inst->dev->dev, "dec_finish_seq timed out\n");
+			goto unlock_and_return;
+		}
+
+		if (retry++ >= MAX_FIRMWARE_CALL_RETRY) {
 			ret = -ETIMEDOUT;
 			goto unlock_and_return;
 		}
+
+		mutex_unlock(&vpu_dev->hw_lock);
+		wave5_vpu_dec_get_output_info(inst, &dec_info);
+		ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
+		if (ret) {
+			pm_runtime_put_sync(inst->dev->dev);
+			return ret;
+		}
 	} while (ret != 0);
 
 	dev_dbg(inst->dev->dev, "%s: dec_finish_seq complete\n", __func__);
-- 
2.43.0


