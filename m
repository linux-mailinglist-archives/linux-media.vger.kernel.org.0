Return-Path: <linux-media+bounces-29825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4ABA83567
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 790E919E5742
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 01:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C28E1BFE00;
	Thu, 10 Apr 2025 01:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="iDV1O5XL"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021134.outbound.protection.outlook.com [40.107.42.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B5918A6A7;
	Thu, 10 Apr 2025 01:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744247321; cv=fail; b=l4kOnaBSEiybzM5J5H6qU41b1i/S/9t9Rn5uiz+XjBPeI3dCFGv50vzdtxk9yhleHR+2GAbuhj4Ge47S6adKPmJpz3tRLxuUhXh10yFAyOYnBfn9jaV0H+mOdpo/9yPuCwjqyXiNyQTgzvLQa6hILYuVIyu7mwalGTMR0S+sFa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744247321; c=relaxed/simple;
	bh=Qxc9dI/DEyTfUyhPwkX1MrMuk3yJEUtQBbD2rxSmLuE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZrNdKBdBvX2Pw1e2SqUjf6fQawMExL2scapgx49paKz6XO0C6j7bdg4V6RwuZqm8tJGiiF3bEZjbZmwk5D+ppqIiLx16AU/cg6HWDXHOqy1rmePCroBDEeyJBXbLcFIH2xCxS+tefOT9oUL+xOmQTfzwWPcC7h4oCyuJ146E4Qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=iDV1O5XL; arc=fail smtp.client-ip=40.107.42.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z06wIFS1inon/ElC6aZxiQuNQ73ULr/cXiQSCKmi5UHIuIwJ7QRbsRKqaa4iP8xaWMPJVgmgsBKlUr/AopX6QJUtVWKMHFvuIY4SaC+TowjAv+OQPFAas7bpiFmrRMpQEQuqC2DLQemh0FF1sj25bAVY37cHSPTfZj51xU7B7sG5p4l14RQ1tva1ESIDnU8Y84Qta1L+53E1bSOC6uapwJ49NZ2CuyqP0NP4uo3cNyNz0EiBDHWZgwexXlPQIQ+NG78kgW1inlrDmI11Q8+Hfv+tApKhUoMfK9IP5UD+/RZWH55ePWE+Q8K74klP8hRpiBOoESN4jm/aaizxVs2FCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bFaFlTMT54RK4We8EIMHVArqrJkHLC4pa/BqJdWrjo=;
 b=GlBdHpl1zlquDKhGFYle0EUq+NMsWD+BSAv2YYCYvjuYKDrbZpG2flF48PGc90PZE6a5ziARaOys3Q0dEKHKdkitX93y2k9bu184MKiMbLYl75xYZZQmSHq3etIp/p1UCR+FW+d1aI+/Ci4IHD+6XRLzolY8KE4i/MuQ2Vbejw5iELvPaedpvvaAHAFf7HlTsv6tgbengXwm0yNjF/IOtY9TK1kp8IJVm7G9otX9L8grX7/EZydqMzZ1LkX27vTxcFtXJ7F8mUorGRsDJGo+egwuuDiXtlFJz227cmnVgKOSaf5bRnZXlqMOQDRXSD6ZcQc5J3gixXGS6VrVelUDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bFaFlTMT54RK4We8EIMHVArqrJkHLC4pa/BqJdWrjo=;
 b=iDV1O5XL7r3AwCOnZz3PNlivUiSIq3sFM1C9eXcxoKU+9kFg6LvaCfH0diYawQPbv/8q+9ZDdXPftDlHo/qyw1KMwdTkMx1Az6i59Wi8jZgVtTGCb2Q3dPNj4y8hyr+Kn4va9g9Xl40xZYUdv1ZUDoO4lEmEHR412mdMZRMEliM=
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
Subject: [PATCH v1 3/7] media: chips-media: wave5: Fix not to be closed
Date: Thu, 10 Apr 2025 10:08:17 +0900
Message-Id: <20250410010821.52-4-jackson.lee@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9202f667-e2c3-4b0b-7aff-08dd77cc3607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uPe6tF0k4k2bbG7C6En3w3UejgEl2foBGKveOjX59F9WcID2MeBz8FpGeIPk?=
 =?us-ascii?Q?2Tr64NIWrG/U6A2D/qP5GvKlZ4jG1VQz+UIVvF2/Y9wbEnHgw5Lc3cGjfqjF?=
 =?us-ascii?Q?7CEAppcok7ywuL5HYUKjWrDYsa9dJM9u6V+5243rn3FGvrt73wNy/YEwiSYq?=
 =?us-ascii?Q?l2lfYWq5eNOHww8OP4bNpj12j7QrWiInBIpEw/lAQoN6cJYdqX+YUwBO+suB?=
 =?us-ascii?Q?kZ752f80Ir/J9jDJFhHCjxjHumPjHbfAPspp4RYjEVmUVuteUBi9uOHnaUuu?=
 =?us-ascii?Q?SXXD1d1AgIKxO3buWBg5MvAU6hsDZML4xKuh20KxHcLxgZo5/DtUc5Sn3x8u?=
 =?us-ascii?Q?ZjKdlXDIsE4f/a0li/TVwWbaifO+Ilhunqt0OsyEc7SGo/YNMnvWipB3S/Wk?=
 =?us-ascii?Q?ptvdCj2xe/FjPZYNyDQBWweiUjUc8ACAWcs+GTWSrz1HDJvihRKKIyFOlfuQ?=
 =?us-ascii?Q?R5Jf1A95Qrb4de/uYQYoFRH4Os1agRS+i2ZsTErXnpWBbXAMWIZdqpGbqpWd?=
 =?us-ascii?Q?UegZF4UK0rGMgWuqsPHt7VWiI/hybL2VIsjEu/kS8QeThnZTYUKGAU8g7kub?=
 =?us-ascii?Q?15UiB6INoWnXqVd53uR0jUt4KaT+A7OXNuBBfnOrXXO9twnDaOZXyefHGmPg?=
 =?us-ascii?Q?xOI1336CutOYAVjoHJIqb8oUiHXz0YJbB0rNj2GwvShqYU7iAm+cYphgEjIO?=
 =?us-ascii?Q?MkbXHZq+9L3NZ8T7C7hQQOSaRQLJ4lrsiDB9a+h3q8SSzPfyB2uIYXLrPd/5?=
 =?us-ascii?Q?BvfFCw2UDZXccmD9bp4VzWDsdebT3hg9wHUboV1sdgoCtcHR5bnW3Ip4tjOo?=
 =?us-ascii?Q?EQDxAVoSPuTQ9qaoVsgjJbljzOyBmC6mzGdaG2BDL5yUHwub8nLYSOAJtyM+?=
 =?us-ascii?Q?tJ6ZiPAkm/hWObsFwupomnTKPWFsZMwDbc2C31ugP26M58jv1RQ3kYOtpVyk?=
 =?us-ascii?Q?mwB2+qJtBiayWaiPmyRFY4Q+g38+eWLhytZnMQdEW9e0/JQbS5GwBhs64x3F?=
 =?us-ascii?Q?LnbfZ802HpU9MFGhSMK/m4lryopYXv3tGdV3OU+rUJUGGLMYtK+EVQs8hCQn?=
 =?us-ascii?Q?6T5KnNOlDEdA7SP3UGqlJ1n4yuzgF+dch0a5Ze9c+SRTijFJ0MFOEvDhAdql?=
 =?us-ascii?Q?+50OYqFQgsAC8noSIvJl623sYgdN7BEi+SKpkdM6FgzF+rOPNK5YAzCk+cSO?=
 =?us-ascii?Q?02SY/NOosHz9JvKQ/D5VrxMg1yFs/is6BWA+wO7wNvdExe7iacKmvM/SVes5?=
 =?us-ascii?Q?UR+n8ebLZtjcHAjKULBVgmRwtYxKSF2ZMZW6OcgqgFwydeXov2MK+Och0sdp?=
 =?us-ascii?Q?UZ1zINchoYpoRmsysk9+Dx9we4DiRaV8drG7eUYPW2EEhNmbKIOxdNXtiP+R?=
 =?us-ascii?Q?HOvbgTudmTDk29kmi62G36hSuALJcON5pQruCpfZrUiVG7KFeq3bCN9fiQeQ?=
 =?us-ascii?Q?uoK5OZ08P6dJ9s/r2nj84TTN8/W2PgvQh3OPFwSlxflWXm60rGB6ug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xv3MjStSmeiIR80ZDSG0Fk8y+EPZRdwk0U/Z1QCI8aW7tAGvQEZ+MwjcAnJI?=
 =?us-ascii?Q?e+E9Xfrf7PqXT65VuF9AnvvhS2vXWlGIAE9wTZ1PWIFQbRJ43IT3GSGj9doL?=
 =?us-ascii?Q?oJTi2KFl7oTKcDaM1gqzQfT5GQL7JkELo6fyT5qq9Bhnu63e78MmRM8o5GBb?=
 =?us-ascii?Q?dKcxtRrBVe2JOoVRa+nqS1g4pNNV5DIFZ/c/7M0UXd2UspHky/Tjx6LfCFNm?=
 =?us-ascii?Q?lSdpIB8a83VUfeojCnpeaN8+FlnC+l1RRtV5S1kVREkWjoMCAzVngxsRo/jE?=
 =?us-ascii?Q?Id5jGF3jXZz1Y2/UEWhT7nucnyZope0TN+tHbKbo6fq3q65bzibpXWYlitlf?=
 =?us-ascii?Q?rkC9X973roaSYJuPuTPIPKk1AMHtnM0YYoHGAZ6wOpoExCPvCLa7Vb10x348?=
 =?us-ascii?Q?722m9zGUf9OjiEUUoBuKl3LiZHc2nCWBRchDzGq8tAh6gafvPSVF9XxblFY3?=
 =?us-ascii?Q?LbCIwdflLMdUvghCH42enLmodqtd2ioQDAZ5W7APLFWxfLebB5tMe5hgC5Fz?=
 =?us-ascii?Q?mZiAtmXa31A6D0D36bPWFdusMYVK2pDgPkArrJSYlK1E1yw+oE73jeZ8WMoE?=
 =?us-ascii?Q?/I3on1I+viOS2RJE28DCqc0j8hgrxdo9gtF5F49z9BSGT3luP9YQLY09/Z1k?=
 =?us-ascii?Q?h3kpOW51j7Xr+Ha3ip0O+pMdRWQm0sdP2BuvM3bsJ1uYQ0g3ExKx899+sNGd?=
 =?us-ascii?Q?Np6jxChabBeBX5mlOhRdPriy+AazH5+bPCVieRr1y0uuRFWta38XVvegmCw9?=
 =?us-ascii?Q?SoQP7oe4mC+PRVb1EqVrEUhkK81AItnZPEO0KKPhuvzC2Iny1LaQf4idmWbo?=
 =?us-ascii?Q?zPGvrtVfAH85xtqXP9YkGpriOyHOgqQdWgyWAPAb79kv2jMqO35jdMKpmp5n?=
 =?us-ascii?Q?9gi0xNWBAQuquBHxkhvmU5REwNLjWv6hwdxSOQatSrs6OxjqK2Bmkcew5t8Q?=
 =?us-ascii?Q?5t86Wph00IEFWgEE1JVSHLBIyeU0glURwqSI3vqsoCQ7YcT2cRPadH+09DEr?=
 =?us-ascii?Q?rkDHLwsw2B3r/PkbUcrKZFr37ms92nDoZJm9dvfJRaD6EsdWJ8XZPYH5wZEc?=
 =?us-ascii?Q?3BRcesZmTZ4A3uUSXjdrqt4g7jzUI3npr2nYY1CWWAPwEs6J6eqF6sD+zIr3?=
 =?us-ascii?Q?V9pbSvQ3yhGUVP6CP/Z179wsHbeg+jo+fDQb7P26g1CURN3fNHytvm+wc0ys?=
 =?us-ascii?Q?lmf+NrPwUqRoUb3+J+oUZ1CECNHvfgU2TouhKheIk87o09vjesdKmAkxA5Mp?=
 =?us-ascii?Q?gTiNowa9HK4B7hN8Q5D3cTgbfMA9LrhFuJbHooJNQap+cdnKyLOZ7I9AUeD0?=
 =?us-ascii?Q?k2mMjhkgdYysR4RS2Rdi22ukbauS0YU9BdxOYhN4JVAyADfg9lp7xCe6RxNX?=
 =?us-ascii?Q?GnSR6Uz4GDG1sbXWjcYfP9JP/VIv4cC6smzVZAPRx6QR+NQgDvxx4SXXrAi+?=
 =?us-ascii?Q?V4pbHaW78tMGQm3HtY24gUV/YHJJKIypaSQLPtke+t5zZowChAA2u65HJ8OG?=
 =?us-ascii?Q?PhfuZ/cAOif2Uqh78Vj6aPgrFrN49LN+uXBhzb8X5ggTzZAIGfJiT3QHSBom?=
 =?us-ascii?Q?roeVnLkEIc60Yfto0/X9XWd9xjSn+QhT4pHru3Ux99Drgcz7+7wMgC0kHFFZ?=
 =?us-ascii?Q?Vg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9202f667-e2c3-4b0b-7aff-08dd77cc3607
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 01:08:32.1439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sLlWqDyLVRFs7NTe2LdrLUC4IPSJOFCVTNEm3gGQOPm+n6nAe2HwctpfrCKsEphMGnmKq00EbbQzEAVrML/hNUyNpy/xCwrpIG9MuQ7ZAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1403

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The current code was to wait interrupt if queue or report queue is not 0,
but since applying the performance patch, input and output is not any
more synchronized.
So even if queue count is not 0, an interrupt could not be triggered.

Fixes: 15a4f7492acc ("media: chips-media: wave5: Improve performance of decoder")
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c   | 6 +++---
 drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 192556b91aaa..e0f4b11ee464 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1481,11 +1481,11 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
 
-		if (q_status.report_queue_count == 0)
+		if ((inst->state == VPU_INST_STATE_STOP || q_status.instance_queue_count == 0) &&
+		    q_status.report_queue_count == 0)
 			break;
 
-		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
-			break;
+		wave5_vpu_wait_interrupt(inst, VPU_DEC_STOP_TIMEOUT);
 
 		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
 			dev_dbg(inst->dev->dev, "there is no output info\n");
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
index 1ea9f5f31499..4ebd48d5550e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
@@ -59,6 +59,7 @@
 //  application specific configuration
 #define VPU_ENC_TIMEOUT                 60000
 #define VPU_DEC_TIMEOUT                 60000
+#define VPU_DEC_STOP_TIMEOUT            10
 
 // for WAVE encoder
 #define USE_SRC_PRP_AXI         0
-- 
2.43.0


