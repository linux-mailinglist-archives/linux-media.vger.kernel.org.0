Return-Path: <linux-media+bounces-11284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9338C1E8E
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F290BB230ED
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 06:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6767415FA7D;
	Fri, 10 May 2024 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="daPZQlR0"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022018.outbound.protection.outlook.com [52.101.154.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40DF15EFB7;
	Fri, 10 May 2024 06:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715324318; cv=fail; b=X1Z/hEkXCPDBVvnDBSDzCuGStU8Lm35zXCbjrSjq7Lip35mD3ZKD8VWOZNK9j2lzkbVXQkeNA3s7yliRAG28Ua9qRfbYIEgZhhS9J0DLhYZpouZL4UsmDKbveou90OdUwukl/CBuQ9MKhQzqhQ/yWTS7GGHn82tr1Um1Wt/DUc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715324318; c=relaxed/simple;
	bh=xZjC5Ab4JmVwWF4Uog4CgivMX3blp6oRo08rwmQXU6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ORIBNuDPyW8Xiuv+GYriO1fYLmG4Icw8zcPk4zti+KCkWPHDLjCAPtpktU2MXV29UWbUjb7wevTsBer+7UFny+WnzJjwfAkDxpIieRerTXof19XQSBKcZL2ExEJlPQh40JL7D3ywD+yK8iML6R3LE+RRtz1aFWFPi+kr90QRfW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=daPZQlR0; arc=fail smtp.client-ip=52.101.154.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRUCwCSHO8CwjVpUNcAcYVlsmr37suCf8/P57OE9ZTwwZBcsp/oD75nvl5JBTCifzAtqTz4Q9uh8rb/qIZleC2Zljitlvl5g/sa71eGgCbRtay8fI93xYsK9IMsbJbHcTCtNBIifqcnNJnKqxe0+uPQHn2m4hz5FTsgiOJFCiQPlx03zeoXZ6I0NjpXDyET3QXyUtT1vS++scXjZJRxaA/ZGc7PNYC0v4h796guYN8ssqLQ7+5WjfOTs/2jg1ebMdZoFZxf0qT3F3NaHMc0gcjVWEAIQY3gSpkIDx2rScxSqcN/ASqckmvDF9PlLkizuJMVtX0cVnUcD/jfKx7Bp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcO/zvPBzs7ZGOQScq+lMlN0ZObPQX4lYy5u7RowwwM=;
 b=nKbgF/Bf921jr6bjXjSpxqkF2pDvj7gGU6TwVcGLrJkClbbBJS4iJ4FD2lRSTsQvhorn4hhX/tJ8BRw12SxD/T6kFlcFesETzNfDz23aOqhwhHwL8CcCfaKde15P8L0hZcgGtp/yx4MOpYyc3OM59vehLpkHKd75oXGS8B1ilDnd9qJ4NrWPzhVjUi4pVgOt86O/1itD7XSht9mwbAOggfO3CjA4cfawehNk5ld1U7bGvKqLtkmQEnMLx2embsbyZGS4fDfbU2DVpLqwplvbDmImToQJqhhsuoswS1PGMUgx/08qsWaig+D1htkRAw1+ZfBOEA5vC2RaDnz7uRatHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcO/zvPBzs7ZGOQScq+lMlN0ZObPQX4lYy5u7RowwwM=;
 b=daPZQlR0JYBpGE69/bXtomk9fAy6fcwvRbSgebWH2nVZkTKcolB/kSbnY9qNVFc8v7Oo28jC8y9d7DX5vCn0ag6fNBqgyD580yvFApAWs33+vjd3dUDTaLAsjCEaFUTi2KXW+rC+l0RX2dUNRJG9K+39jkgHOpqfVnfeNuzHve0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB2247.KORP216.PROD.OUTLOOK.COM (2603:1096:301:12c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.49; Fri, 10 May 2024 06:58:28 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 06:58:28 +0000
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
	jackson.lee@chipsnmedia.com
Subject: [PATCH v4 2/4] media: chips-media: wave5: Support runtime suspend/resume
Date: Fri, 10 May 2024 15:58:15 +0900
Message-Id: <20240510065817.743-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510065817.743-1-jackson.lee@chipsnmedia.com>
References: <20240510065817.743-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0033.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::19) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB2247:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b6b1d5-9589-4606-da97-08dc70be97ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6xZWthwCOErxq2FPcINgdBMj7WeoCwtj80mqUDfYEUwwQL9cDHVAlH7CuBk6?=
 =?us-ascii?Q?43ZLaFWQL3gSQJc9I6MQpmnLti05jmjeakEQ3JZP7x+DZLGpH9eUpvlTwK9f?=
 =?us-ascii?Q?RcsK7yB1JnzzNfCz2DWxH8RbJIRQfxlmDAzJedMyVFZP/UyMeMo11kWiKxh0?=
 =?us-ascii?Q?ObeBlPMYBxb8jZF11k0BxvNNwY5KjgyJGJQvfmN7jK8JcbVkHZQJ5+7I3NKP?=
 =?us-ascii?Q?Xv4qQNrhbmG1pxH3PjAzqELq2m8OWWZoDch8pypYJhbuh0v+6sZlenO5ZwUY?=
 =?us-ascii?Q?TV+HJl5bqL4bOmcggwTKIIV2mZsGPOC6IXHGF5qV2g1aMWfX7hoOb1vJwfhf?=
 =?us-ascii?Q?MQpzlUGHKnemBa+PBAVNTGSGiqy7jWJn4jLXr8/FU2eholh0BH2bszx2bL43?=
 =?us-ascii?Q?6rW3klUBgybpdaG2FzvQxm3so4B39wEPefbAObUvn609O5Oj+rblksZxct3T?=
 =?us-ascii?Q?BCYUi1AgfIvZv2KNhK2G++sna3uAqAmiDn+mOE5BrNeZqWEsJdrv7ofgxj2+?=
 =?us-ascii?Q?yw1iKgm03G8Ae6lbvfuStz3rmAeRUMNl0hyCgjAdsysLhBht86CP1ar/e9KO?=
 =?us-ascii?Q?24Ew4rqDB6hvIBFxzlJNVV2P2IKKkS7HPo33ZisvON1ysUpvEQ/eAANAPPjH?=
 =?us-ascii?Q?rV+Zw1NGeujlkdu+lWgx3XhA29F44xf0hq/ojwZXbex8gAl5DR2lpr3mTGRx?=
 =?us-ascii?Q?DfYDPm8F5J+iwhmUVFoX3pTIb0pbs8VZQenLHj24F7kKM14b9QSU5b3qtzXa?=
 =?us-ascii?Q?LEf8FDfJAv7j6hxyRD5Wqy1JORq2CHzQ6AnCOkLjdKUe2ak7FKE3jDxnSOyO?=
 =?us-ascii?Q?Krs5zRdM5Vd6fLYn73RUAC8/j1300zNa1IsaaA+B3Phqo2rNAy5Rc66QglEH?=
 =?us-ascii?Q?eKkv6E4hKVLhnKQVgM4nGKYVr2dFONifVJ0sS5t1h0Phdr7qvgmU5z7UL7ZF?=
 =?us-ascii?Q?YuCtooBJlb6rop8sC4OfnjINGo/IsyefTlCRq0NPTb71K9hTCeQwvZyoy5OS?=
 =?us-ascii?Q?coEY4UereHzHe5aKAM+UUggz9jO/Ps/a+8QC/i8H8sQTz3tp7q3hv82smRwg?=
 =?us-ascii?Q?5rfLPqe5FlpFnHc61NK3f7Gh0PiPRMlfk1w8P1+btlz+UCJG4E9CT2LtVwcH?=
 =?us-ascii?Q?ePUZQHkj5yWX1YabUCuOlYJDi/PSFG7SSeWQcqLbM9X733qSidNF64Saidni?=
 =?us-ascii?Q?UL3sII38YDPQLxrLEfA7emwF5bzPOdQ/Vu8WTj8og8emqPXwdA9e3yhEJvnP?=
 =?us-ascii?Q?dX6B14OmgtzPbu9DE1Nu1ka46zrTmHtJeWkc7ciZYjz6TAc78QyD6hY6gyxa?=
 =?us-ascii?Q?3auFCAOP1qvP02TMBT1YL8Apkn9Wm4T1k+71jtkcprDNQw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bP9vRsiFloCOSOX4FpC8q/MnM5rLQFDNJGbWW/I5aDSQnBAD70+MRotqFzYZ?=
 =?us-ascii?Q?oqInMem92VTJpmeK4YHEAbUyryFQN30RvZNh2rYZ1fgKGRNG/KNtY/RdSu6X?=
 =?us-ascii?Q?7ZO1LYADd/vc8ZftUmBP24HiVjMQ8tP19NgIRh4Dlqxs2jLqvLbJFDcqd/xN?=
 =?us-ascii?Q?+N9X6YPCUYy3K3i4wTB3kGvYWWvpXycSUHOholqan/et9wVoOi7KAFHFuVgT?=
 =?us-ascii?Q?iaQn198+3BFTBMGZioDreUYgs4Ddvvr+I4drXuawoXJ8BG3UmhSy4ri1j+8o?=
 =?us-ascii?Q?ZZNRPMnu7CuQZxTz7DQiZp6vgVvO6aYsaDGf8TGtFplWX9zoBt5BJImJ+fJD?=
 =?us-ascii?Q?1V7Ig1cklalZ9L3JDDdptw2mMcWQKquvHMhW3ZdP5eL2LND/1RxORFeXQ9sv?=
 =?us-ascii?Q?gejxdYQxm7hcnxFCCtaVAINz5zsOyMhh4fAbkKYpbxKrDc4xHAY+EmybcNUf?=
 =?us-ascii?Q?EYg34lIkJNCFHrhIJmI4csqd3XDKfpTPqfBaTI0wMbbXKYMu7MnY20/BQplw?=
 =?us-ascii?Q?k+HjtjJJgTr60JBPU4hbE4V5BOBpin9Qha+v/OyO4zjPIBnsRwjw4YKCBFQb?=
 =?us-ascii?Q?ffOOWT96gjVvk4KKTikQG7Xc9U/Bf4z3zt/Qq2p7pOVCwWrZHuz11JI/2Y2I?=
 =?us-ascii?Q?xCC2dCb8rSVI+tJlMM73x14F5VHFV1pKyQG/66feVqibijoL9E/6XPF8/tJY?=
 =?us-ascii?Q?TkBTdk6MMhJgr8IoYoNexVA9Kp+F5LTrO2nkzpxiRpj4N4R006KJ97bE/Y/z?=
 =?us-ascii?Q?VHScEZocjKqsm+KtYh/VNKMdsg77MaMwij6ZrdTyo4+KGL1RILm5LMUeTPBl?=
 =?us-ascii?Q?eiPjkxUw4Ba8PK5nUQj1yXxicWwHpzelFHoCcvHE1HEQppHp+aqJTcG+6wVy?=
 =?us-ascii?Q?zdBuufn8uFliqwBlEYEpp44NDDyJi/1QuaynM6RHRwCJUpvsCS42RmMlogT2?=
 =?us-ascii?Q?jsJLW4Nm8vhDVXpXt0wkp6h/MTB6E46IVx1UBSenZYewR7qOOi87kK74kdQO?=
 =?us-ascii?Q?n1qyXyzcJRJA2OHmP1owo/krNGUn4wU/dhNrn+PrLD5SvzAlwijkYGTqjOHO?=
 =?us-ascii?Q?RU4zaQZ18o1XqElknROhcCUhYXmMTZXHoV1jfAtLNvaFF/Ox/JLDGUbrf3MM?=
 =?us-ascii?Q?eMpFQ281v+W9lXF9ZGvwHe5ieZ7GUYRv0Gof6waME0U+LBp8XwvBPyoGR14E?=
 =?us-ascii?Q?NE9MuYO9WVEWo/BBQ0v1iue+3kcbXMtWjtrjP/f26zBQ24gMkIpOk3oZ0GpB?=
 =?us-ascii?Q?RmgRNGKgLQtPklT/uy1/PJFGJwmq8ISUa8AZK2m1xLrcgsS1arylgBIHasFp?=
 =?us-ascii?Q?+Y6rC6wEf7j6pwH0zR2SOr98d//OJv7om16hTHUsO8ziE52FNrXlnCvigdCU?=
 =?us-ascii?Q?B+mF8DKFdO5SG9q2eaYhsQlZ1DL0rRQ5XL9OHwCFHt2jSwyL0TaN2eRH4QZm?=
 =?us-ascii?Q?VzMdwSge5C3pxK1bTFT0n/Gfx+Vda8Gb8axhma9soiBQ16DH21tIIVu1c3MM?=
 =?us-ascii?Q?BjvxDHYcId8j0Tw/fjHj/2094B6eQEJFndt7pqYTGU7IByBpWHEjlBmIIbDg?=
 =?us-ascii?Q?ETRCi/6HGgTu7xyx3hfF7wcKM8MjvoJ1dx3Q7gdo5D0k/xXYcB/FS6h+p5hD?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b6b1d5-9589-4606-da97-08dc70be97ea
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 06:58:27.5437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtjtRK0qIzlV6+iKZpzujoVdY6Kz/YCPJRid0Ckt9Cm+ydjhXNR1+1baYJSoVs8WlNr1ibR6abGDcQCg5QtpX6d5t5i8J385YvNZoBtGenM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2247

From: "Jackson.lee" <jackson.lee@chipsnmedia.com>

Add support for runtime suspend/resume in the encoder and decoder. This is
achieved by saving the VPU state and powering it off while the VPU idle.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
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
index 68a519ac412d..325e311cdedc 100644
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
 
+static int wave5_pm_suspend(struct device *dev)
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
+static int wave5_pm_resume(struct device *dev)
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


