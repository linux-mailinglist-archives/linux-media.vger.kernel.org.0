Return-Path: <linux-media+bounces-29821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 560CFA83571
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93EF31731AF
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 01:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B40149C53;
	Thu, 10 Apr 2025 01:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="jazyJDni"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021134.outbound.protection.outlook.com [40.107.42.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D6E60B8A;
	Thu, 10 Apr 2025 01:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744247317; cv=fail; b=l/GX57KckLiBP747o4v87ULX5GcWZvjYQhnpKR8H+On14zihDr5eJ3EayxK+4YH3VHZ6pTZj4C61f8eEaURgn+AafNYl9JPlrvkW+2ZKjvev4X40s+AGBCYc7ToMouGBecJ/cHmRMcV2zowOFi8cgMlx8xq2jgUD99cSURvqBco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744247317; c=relaxed/simple;
	bh=Ik9WKF13N07blOblz661ZgD6mKBNeoY/0oMx6ZlcT70=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iMgxcHg/9tUsDGDgpoEwSH2KYw5UTl3IQyEQFX/Ya/8jsO8xL/gsGW3+n5xZfvmmgocNTMrEbhMbtUiPOr3nS8/tCIdLx+s9BoHfCVKcR4owd2lgQ67Y1yr895fPpiYYSd+rqqIYvsYJjcaLLR92j1jCCknDIeP7HusrLu7htzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=jazyJDni; arc=fail smtp.client-ip=40.107.42.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLlw4L4y6qoR2cpwbtn3BcqOx9vqQZNVNDGuCAQGyBSCt0Wmdd1JvSUQxKxJiXm6FpFWc6CTe6T9h4ixTnv9w6Qy5TKrJbk73sWOP5K18bpW/FrNP+lEd0wvICEewg5PXVAkkihBOx11kz5uKaJrrBoaoZOH7na0pzVZuVXnALLdG+Onld49rFJvRWouEtX/6sYcO53Sf5PSCxhNxAhg3slPhA/PlJGysjfDlS1H4kfuLwTLd2ptdGBX6HS9TQ/z8jr3otxBESnQ4RBbe9SOOMzQK1jLLTzpCXC5qHnm2W9YpEa+t2weIuqmLPOnrepbr2UT+MjRt2uU/nDIL2xuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cmghElbMgWV0U/7xBb5cJpCTSBslUZ7KGLFXsxFmi8=;
 b=C6xPC6F2dod0tepHb1KL+et1TswrV3iRn+zwjZzquVZAKzW7j6sh3VqHOOF9l6VZiOHGBg9DNXMlVZfnBmFPrru6gxhLI6BMlr2StQAI8xDj177u9vZRHd7zVL10r3shGheJpyVZBCvGMmpCzLmxhP0Qwa934u4wWuQ76UdvCCXdWqMeC1Q6ejmJVW8E5Kg5yuM1GJCoKz74PucMl/xs6d9jVF7JxWwyME/IB0k+Peqt59PmVrwHfOou5gecmZL67/btY5lRgqS5LJtZ2VLgoF86U6YKk5gBaJzOrFrb8rRCvYVwONUAekcZGP8lngUpu5gMi4JdIPii//4kGUVsQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cmghElbMgWV0U/7xBb5cJpCTSBslUZ7KGLFXsxFmi8=;
 b=jazyJDnizbu+ciPaW/agIsiXiKoViykSWIGG47RgCtGfEyzWtJlgdnyNQ4yh1Syt5uPzm3x8eUPGviZmp0dU+vCnb9sT+9fkIAlmhCBeMQLPNFSXPm9ZcI9gv2dbZ0487d9CGRPK1MnhnR1NTwj+RBj00qevfHHr+sD8lDLBA30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SL2P216MB1403.KORP216.PROD.OUTLOOK.COM (2603:1096:101:32::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 01:08:32 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 01:08:32 +0000
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
Subject: [PATCH v1 4/7] media: chips-media: wave5: Use spinlock whenever state is changed
Date: Thu, 10 Apr 2025 10:08:18 +0900
Message-Id: <20250410010821.52-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
References: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::6) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SL2P216MB1403:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a26e81-a4d4-4a19-c5ce-08dd77cc364c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7XYKRDWsR/mvF/Mgc4nkPEnfOU1afMMF8LD04Y9zEl2qW7wXd6hzdCqAGNgp?=
 =?us-ascii?Q?GGdHVNZ1JSiO4QDAerQ9WkSjo84NscOzMMxlevSANikiilmRFjLcu+YlgCyZ?=
 =?us-ascii?Q?d65e4KLWS66AxxX/dAT61IwSk1mDrCtZWl8rMtoUJDM/QFLAf9+IqXUlp4bC?=
 =?us-ascii?Q?xoPmPhPo+lVwU8jlZrKxpJIF31wuCPLzP8QoSLcL/P3cP2pNq8P93MmN1GtH?=
 =?us-ascii?Q?gsOAIu1UpiIDh1rn3J6ItNfrAsxCoy3G5t05GSTyRjFDBxpRRJiSv2EXkh3h?=
 =?us-ascii?Q?aMjwY9IQ4kd/58hb7hMUhfhO6jegJOCcIYmTACx79uJ1VjvEGCbtw31GcZkb?=
 =?us-ascii?Q?7OySuL23eAR+LsjYtH+5xrec7JXPcgO9gv8vI+AoKTTzs32Mm8xY/ajmir+p?=
 =?us-ascii?Q?FSp1waYU2Hrk98/Kkky+7v3a2GhJ60ejDleFhdkZ371/WS+3qDM3u7wZ3l2D?=
 =?us-ascii?Q?fgg/EzbCSdTWNnkOVdnV238nDnKkd9nCKVad1zw4iitxwzMA7W5VxnXTuDrx?=
 =?us-ascii?Q?TCEK2ucdlc56F3PwAKuEwI4UoTRQutM8Iz1Rz5hJRJGKtu19O5xwk1FFDy3+?=
 =?us-ascii?Q?kRUFzQlq4OJB7UbhLpj7piEE0dFVb2EenJ553P8JwUyd7URXCyM5tF7kArSv?=
 =?us-ascii?Q?MsnS6heMRCslg5bQJgugBeD88amidf7zRyOYNYPWSkvw2QcxtzxKwKGclGro?=
 =?us-ascii?Q?u7wdsBryrsldSuJRq60AFSDe2LrCpz2inP/mup/XmXdizB1Qx5j8yTByNs5u?=
 =?us-ascii?Q?QpEXkj4wC22+ML9DC48YUjCveoXxzp/Z2lGW6cT3+FjlN8Jj2MyPzL6rgSr+?=
 =?us-ascii?Q?lXVChFape0DR5LSm5Y8Cpw7E8yN5KhelU0KEMri/3IlC49bom6QWOcd7RU4k?=
 =?us-ascii?Q?kgr5dB8zaZ0bHcKmI0AtkaKVYdG4OyBsKf4PMDHAqUqiAO2+RKV1/s6xcbUS?=
 =?us-ascii?Q?v/gf6aZTTwLH/1uHtmCqAKx8hnUWggl+1KFfZ7ufsQWh1WV7ZK+GXwBRFqDw?=
 =?us-ascii?Q?sBTgprflcNIbTrX232iDefQN4DySG1xzHDoRzINQm50NM1MsGNnI67KyHu+4?=
 =?us-ascii?Q?ifIkM6740bbu3GdqcXZ2KzkPF1HfZo5SK7eIJk8baqYOcTgnk8UoBcXSwqZN?=
 =?us-ascii?Q?MWLNIm2WZvRLwliaWY+5k5YVNm0vVDFA/mUDlBK4zYbY2NI7f3SC5bjMYePh?=
 =?us-ascii?Q?OVPJahkcSrUraic0HsNioA7vM71imPTCQTOf4Mx0Tv0Cw9YHaqMLpN8ff04n?=
 =?us-ascii?Q?ruR4c9B3TAUVOzqd+6zKdkRvO4HJnU25YiH4DZX9A/g5tOLHuZunFeakVWnI?=
 =?us-ascii?Q?ZKdf+kbvhzomgq3jOaUnT7nSkcGtTCE+PzhHL0OY0lQhnonMdcGFDZwScS+k?=
 =?us-ascii?Q?D7SJQvcmLeUvJq9BydIh65B29KHCE8DiDbD7G6mHy3a8SY2MCTamPI+/ZEA4?=
 =?us-ascii?Q?oVJ72BhMnBfYjNlLGDrpYqvsoHUnpyttg79CV3tn5QWWtBFSq6Ilnw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zmqJoXpIPUojHwT6S03IiolF3mGyudZ+KWzpugVCS5SEnmTt+cvt7O9YWpzJ?=
 =?us-ascii?Q?9q+ym2Rgsv41H9vfZG0OS+NRQsR3LTs2IAdWhGgDDv67zIVXAzKpPxkYw8o8?=
 =?us-ascii?Q?Cu88FgFT8g1x0Zwgd41wJVpuXKVtpaWFkUPXqusjVvhrFPBYgX7wId7KqIin?=
 =?us-ascii?Q?Ewd0Zx20sIr6boXLdBLHUM9ztueqcnzmav+y+crv5RlqBtn97qhZw7wV2SQp?=
 =?us-ascii?Q?qUnsbGcH2o4mpWZWCvGaFU2V/Pi6rTFzCWkO7j6T0HQUrXF+PncNpY+2QQcK?=
 =?us-ascii?Q?PDgxy16oVAVhX+M7IVEHvCtQG3/ac1KTCIcnFMHw3kCfUXglxfOsrtFmrGWk?=
 =?us-ascii?Q?rOhbNKci8KQRm/rNICtqvmQHnBUEXaEMXNiVgKscjNOFoYcfpyS7V0spSKzu?=
 =?us-ascii?Q?Z38M0XqC5DXRD2h1BzQe0ugOGFT3u/UNvve0ybUw4ZXtwylpk6TvTrpG0Hax?=
 =?us-ascii?Q?Agn3on3v6/BRuM4qwoQ1pBPRvBLNVKBjwG4u0muo6HskF61mR+hRrpGkRSSj?=
 =?us-ascii?Q?UKp5//+whcMC9s+XK5zkWIels61kbB8YOlKZlZEC/ov6RxBdUKunLmDjdh3l?=
 =?us-ascii?Q?A4/aZMsk8QiCRCp4bikbEz2vcKsgZhE1hBHFomRUZfzDFNTGQ9npWOTDzI4e?=
 =?us-ascii?Q?0iAwROZHYi2M+66BD8HG0TSx5xf8jhnoXX3bEOhEIsZpVS1LmJ8zziDCkYkr?=
 =?us-ascii?Q?687X8ATfDn2j5wSG6cUwQpBEU34WEpex3ctzPgQ/8vHONv0EjC6KxZCurx4C?=
 =?us-ascii?Q?6JZib/sD3vcZu+8wCwyTAMhmFKyAA+UbyH7RmAsuBahqiOJXAmNso+QdXjoR?=
 =?us-ascii?Q?QSWIOrRNClm+vAAPXcTXv92kDfzPqkCIkudIHhJugooum9EiaAlxR+/TATZ4?=
 =?us-ascii?Q?C1E/4vHXZcksMpe1CdOrVaIMAAZt37L2fnsqxKJLAM33BDjeFSpbpRfoOeA8?=
 =?us-ascii?Q?dCn2W6orFWNvo9RVgVLa9hKjB0jaKz+7GxSeLsEIhWs1nG1MHgvHJ6LlUcxF?=
 =?us-ascii?Q?HZ5XbgyYsjrTo4TdYxHMmRnc4PRk4Ncqrng8b21RA7yILcU3ynirdSjSTNmm?=
 =?us-ascii?Q?Sx/oAXSbxGv3xqAmaGtQCOBAAcZu+CEG8YU0QvJMwIkxtfcyhjInybD6MTt0?=
 =?us-ascii?Q?bwgDc4drZTautRwSrthSin3V1eCeGpVKT/wf9cXhmVKzkD3000g3Kn3cezL+?=
 =?us-ascii?Q?48fOaKlaHz/Svs+HnnKxjg+JHdoq+YY+z6vp6c7Bn5KNzOHXw9uatCZiS6+s?=
 =?us-ascii?Q?QHHXCQpT+rO0lw+cST+lehoUjKjW6xQYeCTmOa/N8pZBvtjfSoh8HAp3JLMd?=
 =?us-ascii?Q?5WjwN+ye7FpUpJJ/WY1/ZMH0puiuzdIKE5WLQqDBNrPHvDyicl/93raMT2I/?=
 =?us-ascii?Q?nMuNqghBlH1wsnOZo8dpFJGXxHVITakaq+v46lRgWvGxLwOw3X5qdHhCZ0HF?=
 =?us-ascii?Q?fN1rtClbfdjPJIRDO9rizyqECVrCndAknIXxnlQfxZbF3DGM2I2ab0f4H4wb?=
 =?us-ascii?Q?TKHi/sJUmFNtVLy/FdXEyVmZqPsWZydZTnggv/5VqzLe3oV//ADWhUfLzCxj?=
 =?us-ascii?Q?akEbYV+qHrDXVa8SDu7L2iZMi0Q2D9ZvjYt7WDdgBzMw6RJ9a0arhwsEX6WS?=
 =?us-ascii?Q?rA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a26e81-a4d4-4a19-c5ce-08dd77cc364c
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 01:08:32.5934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfN9vVA7DF/OemGrnuGYawA3JeHEWguP0SZ4eZYRhu1iY9vSpEyPQgJqWLmmcacPWxJvdN8t81UMQ22SpE7lkJUtrfFabbdr44kLxXbLcRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1403

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The device_run and finish_decode is not any more synchronized,
so lock was needed in the device_run whenever state was changed.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index e0f4b11ee464..485320db9bdc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1577,6 +1577,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 	struct queue_status_info q_status;
 	u32 fail_res = 0;
 	int ret = 0;
+	unsigned long flags;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
 	pm_runtime_resume_and_get(inst->dev->dev);
@@ -1617,7 +1618,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 			}
 			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		} else {
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_INIT_SEQ);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		}
 
 		break;
@@ -1628,8 +1631,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 		 * we had a chance to switch, which leads to an invalid state
 		 * change.
 		 */
+		spin_lock_irqsave(&inst->state_spinlock, flags);
 		switch_state(inst, VPU_INST_STATE_PIC_RUN);
-
+		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		/*
 		 * During DRC, the picture decoding remains pending, so just leave the job
 		 * active until this decode operation completes.
@@ -1643,7 +1647,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 		ret = wave5_prepare_fb(inst);
 		if (ret) {
 			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_STOP);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 			break;
 		}
 
-- 
2.43.0


