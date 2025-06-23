Return-Path: <linux-media+bounces-35560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9D1AE3316
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 02:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B5DD7A5D4C
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 00:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4490481741;
	Mon, 23 Jun 2025 00:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="iQFRQ5lO"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021109.outbound.protection.outlook.com [40.107.42.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6754139ACC;
	Mon, 23 Jun 2025 00:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750638138; cv=fail; b=Dfm3OwL7iWHYJm8ofYXWSHugvdoxk2inMj4wo936FfRlilM6/wf7eGWKKveDINXo1a8zJh+PF81q5NcyjMzfOMmpvgN5PDoipR+J6uzdfNY5yf5HjXo2upZPIpEqlW63rGV4lK1JlvO7Slo7PvzvL9J2DubERN5EmFiA826AiqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750638138; c=relaxed/simple;
	bh=K3E8bN2nzEVMsI+X6J3fk7eEZXvSgE0arM1moK+KMEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=av8OmkF2Vj4f2ETqKHhEPJ8ugek6FimmogeTzWfeAdtFXd9Fv/FOPALPIGeLmkLt+J6aCN7VsIT6Z9siYNikYcPXhKPspOLZz9qUDfC2FAp1XXMt7WFGC9OxVD82nDEwOL+6LwYrFISKZTozY+zV6kJu2241NjcArT0UqQ48geY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=iQFRQ5lO; arc=fail smtp.client-ip=40.107.42.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBXXtG4MqWDE2quHz2nTS8IhvN93TaRCyrt4Ju9DFW2ewhb4i6F3aLYRTpQ+aUYBiYuCz/ZFIEvdNQ0hH1a04JVKnC7BbWYUY5Lae2iW/wxCRqvc58Cz4u+yxkINLspJtI14U710rQr8ZB4caz4k+Wk2x0tQo/t3kCJL9M/S1DPYAtlK1DXQ4vZK2A09ORxVtojrj5lZHGji+KbI0u1MOeiZcz4EjEKbOgjHupt0uLm+AiJNyM5l3M1L8fEWraj/8TRHQIe8m2T7QRr3zcz+M4x4p4xJlMyP1NTu4PQRuKK/RFAQc7p02rabUDqlKz9mteC8OPXbE+hPeOwzr078Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/5pBx5h9FpSlXhujFIO2vKfQapAkPMMlg6KKwuB94Q=;
 b=VKGPXOu9THYuvF+tqTdoEJ5RJ8KqOzapnBw+EUSJf/NACl43cs+qU5wH/53phFqf0TRtIS5ZiFInTyMDUcWkZGkGhXwEh+yFgqWGHkK8aI98D1APQuOSlXfuYMFzfZb6NiG+lWSJHDTO0IwYhd9cmL7TlSkdRimtsPRTaLxPvgkx02I/Y7IAPG5ABB7P2SmJBcSUcqpIZhGqNCEBeYT0ect/uEbUS/mkEYxD4SyUprhWa3FwVbWqYbgAD3BTSBvcBSAtFEbTMFD3g0zx0WmuDYBBhK7dnFn3Xxoh67w3IY6PU03Q87oZ3Fs0mLvRJgZuXJ5qCijZaU272fgzYsJqNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/5pBx5h9FpSlXhujFIO2vKfQapAkPMMlg6KKwuB94Q=;
 b=iQFRQ5lOLKNtIG9vnqlUzKcVlRF5nFr03nZ2zhlcpnnGhfMULRoe+6N6gphrbQlWWt5cXfN7w8b2zkhdhozIyRouX2fZx6M4tojUYaLezPA+tyMdDRPFTPvF3KGezUW5Vq3Y2qVIrteZ3PxqfYbjPFQMAnCg7+6Szy3A1zLEhok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PUYP216MB3126.KORP216.PROD.OUTLOOK.COM (2603:1096:301:152::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Mon, 23 Jun 2025 00:22:06 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 00:22:06 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v3 4/4] media: chips-media: wave5: Improve performance of decoder
Date: Mon, 23 Jun 2025 09:21:53 +0900
Message-Id: <20250623002153.51-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0150.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::16) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|PUYP216MB3126:EE_
X-MS-Office365-Filtering-Correlation-Id: 3439da76-9784-4535-154d-08ddb1ebfc33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4ZF7ixeekFwW8sby0h82YeP4rqyzEZeSFhJzRITU86BbC56Gx+5KOBFia47H?=
 =?us-ascii?Q?GBGYUcvChydoc2j4+jwF2YqH+L9CM0FEPynZr1WKGn+ZT2+TEug1HAExuZy6?=
 =?us-ascii?Q?jeHeA7xHeEQNWIEce6klVdzWYjHxScmaYujeomL3IjYoFKrNbFKAk869uUdV?=
 =?us-ascii?Q?o/OR8XCDzH/gHeHQaQwU6AJtUqJ27eNWS0WH80I185NqzrNsDv8FbkiQAFC8?=
 =?us-ascii?Q?v4GR7ZRs7h3lrXXD3jPN1evFIE7qTyRdp6UFWVPCKNRBhdOIqCI8T//5Q2Iz?=
 =?us-ascii?Q?z8n5NKvOLPFfYuZvXtJc7izY7YO1mmsvIZxLGSBDs+R4GXYsjlYIQqKHK4Re?=
 =?us-ascii?Q?a8nAYvcAbDztwmhVvR/5PvEbjcDVjx15nQ0jrW6WkcM8YtmALNUu4fR14q1H?=
 =?us-ascii?Q?Fmz8MnVHaHzbOYSy4hy+BcL7ZfnhjNfp3l7qaF33RrMj05TTPxGH52ZGTK4v?=
 =?us-ascii?Q?hY0DOs2nLsqf80CJbgVfU2dTuh6fAAyWo4bO9sFozzSAAl+ep6CHR6CSDDHp?=
 =?us-ascii?Q?faZb4LuvGdKU9GmvZoQ3ijrOyF+QYON8Ai5LLzSFngzgU34DHp4PpdBEIcP7?=
 =?us-ascii?Q?JVG3sHaQevbSzMDbjQQlw35FG0C9dRqP2ukSHEmTvqwAPLG7GuXAG5H5zs6R?=
 =?us-ascii?Q?9EoJ9pVDvSXSEYKxwIgIGX/KW4Zyv2IsbWXqP6RdKIBIQ1snTUJLwlGyb7wD?=
 =?us-ascii?Q?zhBmLONeMlL7I1KWG94HApJoo0ZpFryPjXs42jVYUuHR78elr0hvjqlu8zbN?=
 =?us-ascii?Q?90MSgbMjhC6ovHOInbTVuU3N3IWBtnSHBNin7fYqqbufioj0inu8VxWIwkLH?=
 =?us-ascii?Q?XVmLqpNmWj7L/YM9/7nvjxd0HOEfcUx0YCDfzYNLIg0jV1ju4+q1zWwkyyb9?=
 =?us-ascii?Q?H1oFu1SD3TXAHq7+q6RN4dZf+QWRq8r/uZqxMJRp8MN3ZAkNke6DkTtzqj13?=
 =?us-ascii?Q?pweSOoVMKmEt8qn6lZudz+rxCI94wII2T671agGr9uaTkBPHChMBo5JQXNOX?=
 =?us-ascii?Q?l6yzN2ivl768twic7fFONHRnjs+VEq3+C97qef9altvIG8YlRVRByYgdvkh4?=
 =?us-ascii?Q?GR3KrKhI/44M0/IQgoTPxAyOmq2Cxe8dLBbIpH+a1p23RniMW+VP810S3w5q?=
 =?us-ascii?Q?rR+T9g1GY2VEN/+0fihUZ3tnmwUjCtEAxNGkG7u+PcFXwzxA2KyQrdz/YqGN?=
 =?us-ascii?Q?tPzKJULw5XFt4e/DfhXEBQxdGiRUyZAqWjBSuaEQ/bwvJmEMbUCXxR8abTCn?=
 =?us-ascii?Q?RRvZgALZTNwA/AQDz7xMy15c+rD6rxRXcYlkqMhKo52w7iTw/QOaYfWg7vv3?=
 =?us-ascii?Q?MwvAGJfVF1lNjC75M/PuX4a+sIM9q8TsF96AcH46IvQ14Q8bzuvsVddMOBaC?=
 =?us-ascii?Q?GaiPLm/jsqRVAKMN7x91tC+8VzJwWa9kwmmfhTqx3Vqcv0Mk6SWV2/RECIAn?=
 =?us-ascii?Q?g3n5Ha0uyBO3tXGe3YtGv4TSLpoxfXE7aYtVs7cl+b8eXCH4nEFBpQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mxv+ioe5u/pyUyq9y63YhsQ2XRjXt3uhylsSQjBwmBQRSHUtIr26l/APH7dw?=
 =?us-ascii?Q?nVRweuaaxdjSeOb6x8k0/dx7m2vfr1ECYVWfV9Vecpf/LG9S9EZZEiG192lL?=
 =?us-ascii?Q?dk1IcI8q4LjCOK+7+JQ/380p35EL0CVedKb43fIWYuV57S+yYpv01yv/7t8C?=
 =?us-ascii?Q?ybdks2GRgCKsJcyvJuLs+R8km8RjpxXri8eB7o0yWgaTnFjK9Sb4uD3IlsJ2?=
 =?us-ascii?Q?+yq2+HGIUP6Dn4Je4y9k88UbJnmkyzZvEv1Ej8R9XKGv/EKCRPmSV3I7SdiU?=
 =?us-ascii?Q?goKHz5DrONuTAX7GCBWkDLX/KySpzda/juwU2NiKAn4TFa1iLu5CWC2HglvV?=
 =?us-ascii?Q?QD6nFdqMH9f5fDFaYPEGb7OxaZeL80uLHwQOuBkSGSiFmSFR59Qk+C4zk/Db?=
 =?us-ascii?Q?YuCffbqr0fNA1d47amTwduAdKFmGH+1Qbf1PcDkuY/r1FsPQX4uVyxFTQi82?=
 =?us-ascii?Q?ncF4dP4KEcURoE6yCDuncQgo6bcnDdbgrG9tEpBDbqrPQ8tdoIyYapzIpuXU?=
 =?us-ascii?Q?GJG+uEvfpNGUHQ9EEq16CyA0nugn3yAMeMlZFvqv89xTdUQB5goU+c3n7P/G?=
 =?us-ascii?Q?MmaVGs0+CGu6EXI9ilY/uA+cklEOjAuu9AI/hBWNnI0twrq9j2jLT9kVXY/L?=
 =?us-ascii?Q?lU7yPbcsaW6QeH8exYoDeQcr8RBLXKh/nAFLh4iL4bUVLsmBK5BrOH0gvmL+?=
 =?us-ascii?Q?Dc/p2wsOH58op9CqmpwyMawcEJAWql90Djt9Mnhrsvoq6H+in68okCEVu5ra?=
 =?us-ascii?Q?p85F1CjMKo6XAvjAoId9EaJn9qDnZY7xZqYZSnja39GcIGNGcSmnZCMpaBoM?=
 =?us-ascii?Q?iqtMk2ciD/99mtADWLjYBh9eTHe3Tyl4Z0jKiZc54esvBss32jzKFyaOvXDz?=
 =?us-ascii?Q?ia1c09WAlOwgHPz63O/VaZQZSbmKBQIJ0ftB7m8B/CWwAVQ3k+nRsELXWEjS?=
 =?us-ascii?Q?ynJqDpwLD+T5N1++UcWtbKH9IZZnFjq+y195Jg3BVzub3636kZwZrEhTgo8v?=
 =?us-ascii?Q?0LhRDxXNXJke+27fGxlpDtd0ovcwXWdnEGQnoZSNyW0FRpUa5xBsJbHWRzgh?=
 =?us-ascii?Q?pE/3oHADDOEy5b5IKw0iYmYF72f5r/DDLi1hm9EwOfV3LTsPsMMCaSHAuKmr?=
 =?us-ascii?Q?CiLWg2J5xodWOYlK4ixG/8RSm71Jl388xyKEtJrW9Bsz+Z7EvrG1Xyi64ndl?=
 =?us-ascii?Q?3jgn7EaGyz/RFmyg+zVRIMMG98iAFZ0ZjOt8PJiM8BZ6Yp3GWj0ytbHcbOJ/?=
 =?us-ascii?Q?GNdM5xBNhK5txc4hGRRqvp83ysjQ0QDm1Z5Dm4g+SvjJvIyiREAuT60pLQCF?=
 =?us-ascii?Q?7tqVBKwm+3gab3FhOKsHIkvOH1cWfyUfnBEst55w/OhS6UZtyTld5fvmiT8z?=
 =?us-ascii?Q?0LWngp8/FI+CF5rOUoE4ibWsjIh6fRxgDu32MemA74W09FNKCFnmNwkKmpvz?=
 =?us-ascii?Q?iGzY66YG6SFJDli1wcx9KrdzXeVKUKVYa6K9zR2ymj0y/b9yTMkFEX7iiq27?=
 =?us-ascii?Q?REtkgIFSbdCPuoMBRUzO42JsImwUNxu0TxXxLrPz/NMUI3+fGpo/TBDp5Add?=
 =?us-ascii?Q?9I8e4f0/hoHsdXtXLniV0a7R8YJNIZpC0Q/sidIEPbJjk4VKAHnQrCHHq9Cn?=
 =?us-ascii?Q?Rw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3439da76-9784-4535-154d-08ddb1ebfc33
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 00:22:06.5223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLcViFkkYDzRg23JDFk3l1+fUzGuA3R2TS4Tb0zDLIOYBQsrDdC7jm6uXW+TMEtwWxwBl3Wxkm/RumP1FyZQW86qVsA8djDB1heFPcj4Zc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB3126

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The current decoding method  was to wait until each frame was
decoded after feeding a bitstream. As a result, performance was low
and Wave5 could not achieve max pixel processing rate.

Update driver to use an asynchronous approach for decoding and feeding a
bitstream in order to achieve full capabilities of the device.

WAVE5 supports command-queueing to maximize performance by pipelining
internal commands and by hiding wait cycle taken to receive a command
from Host processor.

Instead of waiting for each command to be executed before sending the
next command, Host processor just places all the commands in the
command-queue and goes on doing other things while the commands in the
queue are processed by VPU.

While Host processor handles its own tasks, it can receive VPU interrupt
request (IRQ).
In this case, host processor can simply exit interrupt service routine
(ISR) without accessing to host interface to read the result of the
command reported by VPU.
After host processor completed its tasks, host processor can read the
command result when host processor needs the reports and does
response processing.

To archive this goal, the device_run() calls v4l2_m2m_job_finish
so that next command can be sent to VPU continuously, if there is
any result, then irq is triggered and gets decoded frames and returns
them to upper layer.
Theses processes work independently each other without waiting
a decoded frame.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 131 ++++++++++++------
 .../platform/chips-media/wave5/wave5-vpuapi.c |  22 ++-
 .../platform/chips-media/wave5/wave5-vpuapi.h |   5 +
 .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
 5 files changed, 119 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index d94cf84c3ee5..687ce6ccf3ae 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -102,7 +102,7 @@ static void _wave5_print_reg_err(struct vpu_device *vpu_dev, u32 reg_fail_reason
 		dev_dbg(dev, "%s: queueing failure: 0x%x\n", func, reg_val);
 		break;
 	case WAVE5_SYSERR_RESULT_NOT_READY:
-		dev_err(dev, "%s: result not ready: 0x%x\n", func, reg_fail_reason);
+		dev_dbg(dev, "%s: result not ready: 0x%x\n", func, reg_fail_reason);
 		break;
 	case WAVE5_SYSERR_ACCESS_VIOLATION_HW:
 		dev_err(dev, "%s: access violation: 0x%x\n", func, reg_fail_reason);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 2df7668575f4..4554a24df8a1 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -268,6 +268,7 @@ static void send_eos_event(struct vpu_instance *inst)
 
 	v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_eos);
 	inst->eos = false;
+	inst->sent_eos = true;
 }
 
 static int handle_dynamic_resolution_change(struct vpu_instance *inst)
@@ -347,13 +348,12 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 	struct vb2_v4l2_buffer *dec_buf = NULL;
 	struct vb2_v4l2_buffer *disp_buf = NULL;
 	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
-	struct queue_status_info q_status;
 
 	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
 
 	ret = wave5_vpu_dec_get_output_info(inst, &dec_info);
 	if (ret) {
-		dev_warn(inst->dev->dev, "%s: could not get output info.", __func__);
+		dev_dbg(inst->dev->dev, "%s: could not get output info.", __func__);
 		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 		return;
 	}
@@ -442,18 +442,14 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 	}
 
-	/*
-	 * During a resolution change and while draining, the firmware may flush
-	 * the reorder queue regardless of having a matching decoding operation
-	 * pending. Only terminate the job if there are no more IRQ coming.
-	 */
-	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
-	if (q_status.report_queue_count == 0 &&
-	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
-		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
-		pm_runtime_mark_last_busy(inst->dev->dev);
-		pm_runtime_put_autosuspend(inst->dev->dev);
-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+	if (inst->sent_eos &&
+	    v4l2_m2m_get_curr_priv(inst->v4l2_m2m_dev)) {
+		struct queue_status_info q_status;
+
+		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
+		if (q_status.report_queue_count == 0 &&
+		    q_status.instance_queue_count == 0)
+			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 	}
 }
 
@@ -1146,8 +1142,8 @@ static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t b
 static int fill_ringbuffer(struct vpu_instance *inst)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
-	struct v4l2_m2m_buffer *buf, *n;
-	int ret;
+	struct vpu_src_buffer *vpu_buf;
+	int ret = 0;
 
 	if (m2m_ctx->last_src_buf)  {
 		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
@@ -1158,9 +1154,8 @@ static int fill_ringbuffer(struct vpu_instance *inst)
 		}
 	}
 
-	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
-		struct vb2_v4l2_buffer *vbuf = &buf->vb;
-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(vbuf);
+	list_for_each_entry(vpu_buf, &inst->avail_src_bufs, list) {
+		struct vb2_v4l2_buffer *vbuf = &vpu_buf->v4l2_m2m_buf.vb;
 		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
 		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
 		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
@@ -1220,9 +1215,13 @@ static int fill_ringbuffer(struct vpu_instance *inst)
 			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
 			break;
 		}
+
+		inst->queuing_num++;
+		list_del_init(&vpu_buf->list);
+		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
@@ -1236,6 +1235,11 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 	vbuf->sequence = inst->queued_src_buf_num++;
 
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
+
+	INIT_LIST_HEAD(&vpu_buf->list);
+	mutex_lock(&inst->feed_lock);
+	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
+	mutex_unlock(&inst->feed_lock);
 }
 
 static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
@@ -1287,10 +1291,13 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
 		__func__, vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
 		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
 
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (inst->empty_queue)
+			inst->empty_queue = false;
 		wave5_vpu_dec_buf_queue_src(vb);
-	else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+	} else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		wave5_vpu_dec_buf_queue_dst(vb);
+	}
 }
 
 static int wave5_vpu_dec_allocate_ring_buffer(struct vpu_instance *inst)
@@ -1385,6 +1392,13 @@ static int streamoff_output(struct vb2_queue *q)
 	dma_addr_t new_rd_ptr;
 	struct dec_output_info dec_info;
 	unsigned int i;
+	struct vpu_src_buffer *vpu_buf, *tmp;
+
+	inst->retry = false;
+	inst->queuing_num = 0;
+
+	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list)
+		list_del_init(&vpu_buf->list);
 
 	for (i = 0; i < v4l2_m2m_num_dst_bufs_ready(m2m_ctx); i++) {
 		ret = wave5_vpu_dec_set_disp_flag(inst, i);
@@ -1474,6 +1488,8 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
 	pm_runtime_resume_and_get(inst->dev->dev);
+	inst->empty_queue = false;
+	inst->sent_eos = false;
 
 	while (check_cmd) {
 		struct queue_status_info q_status;
@@ -1481,11 +1497,11 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
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
@@ -1577,13 +1593,24 @@ static void wave5_vpu_dec_device_run(void *priv)
 	struct queue_status_info q_status;
 	u32 fail_res = 0;
 	int ret = 0;
+	unsigned long flags;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
 	pm_runtime_resume_and_get(inst->dev->dev);
-	ret = fill_ringbuffer(inst);
-	if (ret) {
-		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
-		goto finish_job_and_return;
+	if (!inst->retry) {
+		mutex_lock(&inst->feed_lock);
+		ret = fill_ringbuffer(inst);
+		mutex_unlock(&inst->feed_lock);
+		if (ret < 0) {
+			dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
+			goto finish_job_and_return;
+		} else if (!inst->eos &&
+				inst->queuing_num == 0 &&
+				inst->state == VPU_INST_STATE_PIC_RUN) {
+			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
+			inst->empty_queue = true;
+			goto finish_job_and_return;
+		}
 	}
 
 	switch (inst->state) {
@@ -1608,7 +1635,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 			}
 			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		} else {
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_INIT_SEQ);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		}
 
 		break;
@@ -1619,8 +1648,9 @@ static void wave5_vpu_dec_device_run(void *priv)
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
@@ -1634,12 +1664,14 @@ static void wave5_vpu_dec_device_run(void *priv)
 		ret = wave5_prepare_fb(inst);
 		if (ret) {
 			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_STOP);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 			break;
 		}
 
 		if (q_status.instance_queue_count) {
-			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
+			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 			return;
 		}
 
@@ -1650,26 +1682,42 @@ static void wave5_vpu_dec_device_run(void *priv)
 			dev_err(inst->dev->dev,
 				"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
 				m2m_ctx, ret, fail_res);
-			break;
+			goto finish_job_and_return;
+		}
+
+		if (fail_res == WAVE5_SYSERR_QUEUEING_FAIL) {
+			inst->retry = true;
+		} else {
+			inst->retry = false;
+			if (!inst->eos)
+				inst->queuing_num--;
 		}
-		/* Return so that we leave this job active */
-		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
-		return;
-	default:
-		WARN(1, "Execution of a job in state %s illegal.\n", state_to_str(inst->state));
 		break;
+	default:
+		dev_dbg(inst->dev->dev, "Execution of a job in state %s illegal.\n",
+			state_to_str(inst->state));
 	}
 
 finish_job_and_return:
 	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
 	pm_runtime_mark_last_busy(inst->dev->dev);
 	pm_runtime_put_autosuspend(inst->dev->dev);
-	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+	/*
+	 * After receiving CMD_STOP, there is no input, but we have to run device_run
+	 * to send DEC_PIC command until display index == -1, so job_finish was always
+	 * called in the device_run to archive it, the logic was very wasteful
+	 * in power and CPU time.
+	 * If EOS is passed, device_run will not call job_finish no more, it is called
+	 * only if HW is idle status in order to reduce overhead.
+	 */
+	if (!inst->sent_eos)
+		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
 static void wave5_vpu_dec_job_abort(void *priv)
 {
 	struct vpu_instance *inst = priv;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	int ret;
 
 	ret = switch_state(inst, VPU_INST_STATE_STOP);
@@ -1680,6 +1728,8 @@ static void wave5_vpu_dec_job_abort(void *priv)
 	if (ret)
 		dev_warn(inst->dev->dev,
 			 "Setting EOS for the bitstream, fail: %d\n", ret);
+
+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
 static int wave5_vpu_dec_job_ready(void *priv)
@@ -1715,7 +1765,8 @@ static int wave5_vpu_dec_job_ready(void *priv)
 				"No capture buffer ready to decode!\n");
 			break;
 		} else if (!wave5_is_draining_or_eos(inst) &&
-			   !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
+			   (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
+			    inst->empty_queue)) {
 			dev_dbg(inst->dev->dev,
 				"No bitstream data to decode!\n");
 			break;
@@ -1755,6 +1806,8 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->ops = &wave5_vpu_dec_inst_ops;
 
 	spin_lock_init(&inst->state_spinlock);
+	mutex_init(&inst->feed_lock);
+	INIT_LIST_HEAD(&inst->avail_src_bufs);
 
 	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
 	if (!inst->codec_info)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index 5b10f9f49b9f..edbe69540ef1 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -207,6 +207,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
+	struct dec_output_info dec_info;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -227,11 +228,26 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
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
@@ -248,6 +264,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
 
+	mutex_destroy(&inst->feed_lock);
+
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index bc101397204d..adfbc104f939 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -818,6 +818,11 @@ struct vpu_instance {
 	bool cbcr_interleave;
 	bool nv21;
 	bool eos;
+	bool sent_eos; /* check if EOS is sent to application */
+	bool retry; /* retry to feed bitstream if failure reason is WAVE5_SYSERR_QUEUEING_FAIL*/
+	int queuing_num; /* count of bitstream queued */
+	struct mutex feed_lock; /* lock for feeding bitstream buffers */
+	bool empty_queue;
 	struct vpu_buf bitstream_vbuf;
 	dma_addr_t last_rd_ptr;
 	size_t remaining_consumed_bytes;
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


