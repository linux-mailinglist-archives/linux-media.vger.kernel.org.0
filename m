Return-Path: <linux-media+bounces-42885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B19B8F0E5
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 07:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11960189D621
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 05:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120972F0C62;
	Mon, 22 Sep 2025 05:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="AM9KLFd0"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022089.outbound.protection.outlook.com [40.107.43.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAD02ED872;
	Mon, 22 Sep 2025 05:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758520402; cv=fail; b=k39x1tbSWgeQ14YAXZOnYdox2nt8Eql4KI2vPowHvVAR4nYhBJEoTAHLDnae/LFPRJ9/GoSLNaqeXGoLYDGwnfWVKG1DyqjlqSCb2Ta3Brp3R7+9egnOlqlnCSNkahhh2k389SscW1NhQg5u+xPqt3w6qiCOjQ5QEsJ3ixgA1pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758520402; c=relaxed/simple;
	bh=SDjSSBujiUb9H32DTFTM3zQNRXU1nBYK2GsLhvrV18A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P9s7KA57ktg2yCxIN9aga+Hlv+8RzPmBtr7ro8oSMc6RRYjzLLeEFBGp18fytlZjzfIPKHztcq6NdVEj6LAjUlz4XV0MMcwKYRtrqGZFnkXx7YOWAP+pH1mZZd5QJZxl3CpRy9MtqXGv0jCpF6awApRmEeXgYVgwbDV8Ijo5m0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=AM9KLFd0; arc=fail smtp.client-ip=40.107.43.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTGVLs3bKFMSoO+v86pFu5Usfz8WMobW1vMQpB0gi329l+BdWYoH1sPDzXhAhipNil9NT4ZJqZ7fzHBa7etcz3Z2Zc6VP9fw+q6pxWYyV0JtmfqZsRHcfhch1GNk+uyE1W2lK1YsVnJTY/qfaI/ZYd1ddPskwcTxOrOlduGigYLFx86kX32D/PdCD8yDkzX5w+/4r/afVVaFQMgmWj1KZGkr5jAzb4v6retOgPsxT6Nzw88o6+GAQjMFJ5MdSOGANXOogvEUZ1j0A5/tML2JK6jtP2X77d0dGAY4ZA7cxfdGh1Ab1od5uiCCnpT6WNqaFHn32odVBxSGT3ZUXiEjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWefvbCKnJXjAWnN3xyphtB5jWbcmFRvPDyMkkoR+jo=;
 b=OgNQ8cr5Pz0CTd8i+rPqJoeGQxSERxBvGwzZBJx3RgBKqiYPeamxCBRxnQ1TPcJGg/3AMWYl07Fl1xNN/lKlBkUxRyINyH7Ua7Le7AJGYxVROE0TAv18t+Gq61m68POgID027qqm8t1EQJDIrrdeXyADAjPRsVio7eJ+ujHlRTn+Lhwp+TUsGcxSK1QVX7uXdrzzWnbL6Y8QJwCKPLtApT/bIUsNg2r5TYAiM18QuXE2cZGGXaq5sj2IVTHlBV7IrpU0WQDUBu+ucmmxtGDmsZN43EtIJkJUm35HJpWzRdlUwrpbCpfpbJ0Rya31oVIQrZHVaRt3t7RLgqACN6yoFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWefvbCKnJXjAWnN3xyphtB5jWbcmFRvPDyMkkoR+jo=;
 b=AM9KLFd0J0z1dpb0XaxAzP7R79Y3FYJvbIR7jRmGoHlXJKxk4TSBzPY5Yqz7HSG3bdIChfXgQ3NWowCx3WFMyx2TwnxI4s1+OOmYtudY/CK6JoyxFSwuGsT7zc6OHuTEz5ShNODymTzctHbfqb638GZbTb9CVln5kB3j7RdmAjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by SE2P216MB3024.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 05:53:08 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d%4]) with mapi id 15.20.9137.017; Mon, 22 Sep 2025
 05:53:08 +0000
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
Subject: [PATCH v5 4/4] media: chips-media: wave5: Improve performance of decoder
Date: Mon, 22 Sep 2025 14:52:55 +0900
Message-Id: <20250922055255.116-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
References: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::23) To PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:72::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB1149:EE_|SE2P216MB3024:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c79312-36d7-4efc-56ed-08ddf99c4e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UOD8WeQ3ZIS3G5+PkEkbVwOKTBwtSFIaQMqB27um40jkP5Bbo875atX/iSNG?=
 =?us-ascii?Q?diDrdpmvPAC1veVxIdXC3gcRwo499Er6Q6igLAN0NiGmAZdvqld4HBKuM1E8?=
 =?us-ascii?Q?nXkYwteLDziGNo32TyQhKQwnrS1beQ8TOshhRiFYPioXgwajXbhgUCBkS44Z?=
 =?us-ascii?Q?FyLtOdLL8oDrmDkC17fPIGzXxr8Nl9ttEnWoYWKVtbN2wQ8eD/1vMV37vqkd?=
 =?us-ascii?Q?eI1CoOKqzBZ7pTJBOaN48UndkvLLblSVzsw+6sxJ9L22n1psfjUsFV7D9gS1?=
 =?us-ascii?Q?o/RyoWnBWZTdqDo6+pQ6UWnYc9i/IDmIQTo0i+SilfCTPVTONAEIhViszk7S?=
 =?us-ascii?Q?TLFF0IXDQWoffAr+1ePBCIM4rIQ8CFV2e5APpzWwDQHtdpCZcSUDYTSw51C6?=
 =?us-ascii?Q?jChLCMQRExEy0R5WpVLzUgIcXksflq05mRaTmBffhBvQl53iq5TJWEhR/G+K?=
 =?us-ascii?Q?+xhxg82B/NAXNGkWC84qRF4sZIWHo8mhcw47lUSvd70KbYOUWPeq2UgD3dsZ?=
 =?us-ascii?Q?+U5t2nf55K5rtpZIh6iqLNyA6gNAcB1mgAYslGUH4BZTAzJrsrf1vMxOT2FU?=
 =?us-ascii?Q?XvlGZCLIBQuq70lac/nKAy47EtSUyb6daUW8pJOVTiWXXCftX0AAj9yFpitt?=
 =?us-ascii?Q?eZG5mdRxQn271FYFR2MY6Im/O4QHAd/qTe5WdNOGiL3fKTXS3cAu8ZD2JwJk?=
 =?us-ascii?Q?RKoQ9KR0oqKlNXWd/rO91s+8WLBj14JGrHO1KX2e95mUKcVFVUFyJTj86HnC?=
 =?us-ascii?Q?4NFti1plLbkz7CoxPG1X/tUHr3yudwZ81F1Nt2/URe4u70lRgf7HMHBHEaAD?=
 =?us-ascii?Q?7QButhvtWBl0tdOA+/A312vkKJKjKseLV3XIs+vtQeAvt0ukU1U6V3zwfO2K?=
 =?us-ascii?Q?E1iXPY2UElyusPa6aj9tqRmMCofXd/EHkIG/wjPObPknMw7UtvjF1CV4nn53?=
 =?us-ascii?Q?WsajgV0+jtmoyw/N5c7vaAie4flJp9gwWL6IiPmt0D95avhoGM1oqF39bEP/?=
 =?us-ascii?Q?fbYs06XfgNPYobhk/iXS8yVGA7p9WIXQvXWklWQrihFO6veFv4nqrGJUn+ed?=
 =?us-ascii?Q?HZ2HL/zbD0qHRe4n7iNfgF0FtFPnn7+8XM8oDKA7CJOaPMOP9CSCZ5MKnxo2?=
 =?us-ascii?Q?/DKb2QI3BKtVWan/Qg99MR+bIygjwZDwwIyIDMwl3TKtNBG+EguD/fAakvk5?=
 =?us-ascii?Q?wrF6Rhwh9qotxxDexuqqNdqWNyoloo6BDNSBTva5PLdp0PeKZjhl3QFCBEv2?=
 =?us-ascii?Q?JM2q+xm1oT0c8wJ1Dvz2AfGCx7cRy5SNitXQ1B7WZIvFFR2DvhJBRMn8GjkD?=
 =?us-ascii?Q?UoUMtcDSfZUkPl0PALg3NycDMkyFY8/VYKn2OzzSXzWd5o2f6rhlgEOBsnVe?=
 =?us-ascii?Q?rku0fONHN7Ej+7n0LHv9TL4DxOge6+JUHhE2At6vTpRDFZvOicnX4Rm0B8JJ?=
 =?us-ascii?Q?3vhDE0uoQZYgP+hj+zcgcOcYEUu46zpzhaezyLRwRcOoGc/NGAXnzg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5OdG3HJsy02NggSZhI+OU7+ildWAo499QyFBYrwh6+Te0JIa8tiR2rRlKBWF?=
 =?us-ascii?Q?FiWIXWMy29/n1Jxnt3iEBofYdnpiOY4t6qqymg6JnQvNlO/TwkSgyfIfz+fn?=
 =?us-ascii?Q?3P+zlOzkxWCLRqo/4917UR/6UlPW+rApgxLY+onECzGKNMhteRyP77tLk5jZ?=
 =?us-ascii?Q?IXChEk4IUHnQJBNFjzue5HgbPZPJdUFAs9NofW8NyeBGIVm3xS7m1BslhJuo?=
 =?us-ascii?Q?Du1PYmdEckO8W9qx1MtPY1Cjm5SSp6rUcjZFa4vmS/ZQbp5ds4vRPbKhMGck?=
 =?us-ascii?Q?EQAjFZc75mgLEAQiGSKkjafWHrPONq/HW6LtC0u66CWSvu2R2x6dzHfvSanp?=
 =?us-ascii?Q?v4YWw+I0ulW057CN97+8VXIWMbP/uZFKZ00VCGa8liY/Wx8qCF0BeaGQNoO7?=
 =?us-ascii?Q?gAT7u97/ZFsA8cwhVNnvwL6hx6dtG9IXMjcz5QCfR52IGjCfRdDA1lyd6YZh?=
 =?us-ascii?Q?Or/KEUFvWiI/eLmuUQJKMnyzzxTtlPOH64m0AtFQbYY7K4xbFbpqQ7tM4RLJ?=
 =?us-ascii?Q?RoqUC7Tr4lLvaHHtTk83y+uWJx6SKfvkbugq9SlD0vyfVUm+eeCKC+oLJxeu?=
 =?us-ascii?Q?yhDyuVvV+nECJQBg/454il9x9R89EF2/x0LFvGgQhxFCnBofLp9smafWIUkr?=
 =?us-ascii?Q?nQCG4zMfY6CnI8IHQCSqMOLlfca+z00z6ABuRV7YeKq0088Zpst7Wo7vwu1H?=
 =?us-ascii?Q?vBKMOzRhuMZ71egoZkIoew2BJwTWUU7LczVjVBsbopv4cpOWGPo6bzzSFOQs?=
 =?us-ascii?Q?LRS1BU2DX1wnNJdbxQt63r+jxOgCqzLIsP4KB8izEqNG3rbtRTPt65EYiL1y?=
 =?us-ascii?Q?M6gqty9uYzib62nKw30ZUsdL7aVjI76Ifdvp4GvpSevbZVYEmIb3nWyafWjc?=
 =?us-ascii?Q?I5ubgCUno1li9/krBnTueJ9EGsks6dCJP/dpdOYMV9B6Naz+aAOrMpT8eecO?=
 =?us-ascii?Q?ecTCQUPV7OIc+acZo3G3QCtCSzAVXYqEdBOEKG1HYCIeRF0Sx25lkQYUogom?=
 =?us-ascii?Q?mM0cA1fOJDPTzElpFKN4qUE/AkK8s4jbVXt6ogAVr0eXzVv1IgJXIACaf2sK?=
 =?us-ascii?Q?yw3RLlEb372FsZewtWxkkSr9DpHmUhUKq1BaUvNljs9T5oF2luxGBSxLG6J3?=
 =?us-ascii?Q?8SyN91fkt7MErjgelUYZoKaZ6WZziKa8jQs2Pw1Oc7kAxAWR/WpcvUyAQ142?=
 =?us-ascii?Q?NDRATAZ3r+J3rCQ1lWdfJmM9F6BVBsuMRkrztbOVE+qPPs4ou7Rxefvrp20y?=
 =?us-ascii?Q?2i4ERQwF515Kkl8uuEL3zWWTGh7JSRbgfoqWmrNJRrrYpSo2OSOd62O4LnwI?=
 =?us-ascii?Q?tLpuxk0IZl2OHwm89StvDcpM7CD7i4tEfJC8j/h6kbDrM9SJh8DmXKvxMsUA?=
 =?us-ascii?Q?w3/83DlKm2+6JA9CQ86i0aHrSjdAbEXFt+T9QmzfSlShBuiC1AKKIwztoBlJ?=
 =?us-ascii?Q?6fWT9OjkQ5ag/b5SJE2dGSzIbO1V6iuJswBKrWLat3C0LFCvNCpYCsKf4Ckr?=
 =?us-ascii?Q?Ss+dsToWx6cTvW/syVKKFFVvaXwv0fBT2EkDngF6/Bf7Ezmn0icfPLeDDokl?=
 =?us-ascii?Q?am939KI+LehsQydKk1s49HxtQ9cmlg8OYvtWL2jeZv5vuNvorD/kiCagd5ZB?=
 =?us-ascii?Q?eA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c79312-36d7-4efc-56ed-08ddf99c4e4a
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 05:53:08.3651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWAW86xPFZQP4MQONzDuEkZ+/deC6auifYrluekhZyWF4ItqQOiqTPQk5xTPWa25qgHqfsbqakHrzOcpsLW6hlYJrG0JR38UkIzlUCx3rDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3024

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

To achieve this goal, the device_run() calls v4l2_m2m_job_finish
so that next command can be sent to VPU continuously, if there is
any result, then irq is triggered and gets decoded frames and returns
them to upper layer.
Theses processes work independently each other without waiting
a decoded frame.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 166 ++++++++++++------
 .../platform/chips-media/wave5/wave5-vpu.h    |   2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  46 +++--
 .../platform/chips-media/wave5/wave5-vpuapi.h |   6 +
 .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
 6 files changed, 154 insertions(+), 69 deletions(-)

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
index a3a135946078..e9cc6fedfea8 100644
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
 
@@ -1143,11 +1139,31 @@ static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t b
 	return 0;
 }
 
+static struct vpu_src_buffer *inst_src_buf_remove(struct vpu_instance *inst)
+{
+	struct vpu_src_buffer *b;
+
+	if (list_empty(&inst->avail_src_bufs))
+		return NULL;
+	inst->queued_count--;
+	b = list_first_entry(&inst->avail_src_bufs, struct vpu_src_buffer, list);
+	list_del(&b->list);
+	b->list.prev = NULL;
+	b->list.next = NULL;
+	INIT_LIST_HEAD(&b->list);
+	if (inst->queued_count == 0) {
+		inst->avail_src_bufs.prev = NULL;
+		inst->avail_src_bufs.next = NULL;
+		INIT_LIST_HEAD(&inst->avail_src_bufs);
+	}
+	return b;
+}
+
 static int fill_ringbuffer(struct vpu_instance *inst)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
-	struct v4l2_m2m_buffer *buf, *n;
-	int ret;
+	struct vpu_src_buffer *vpu_buf;
+	int ret = 0;
 
 	if (m2m_ctx->last_src_buf)  {
 		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
@@ -1158,9 +1174,8 @@ static int fill_ringbuffer(struct vpu_instance *inst)
 		}
 	}
 
-	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
-		struct vb2_v4l2_buffer *vbuf = &buf->vb;
-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(vbuf);
+	while ((vpu_buf = inst_src_buf_remove(inst)) != NULL) {
+		struct vb2_v4l2_buffer *vbuf = &vpu_buf->v4l2_m2m_buf.vb;
 		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
 		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
 		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
@@ -1220,9 +1235,12 @@ static int fill_ringbuffer(struct vpu_instance *inst)
 			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
 			break;
 		}
+
+		inst->queuing_num++;
+		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
@@ -1234,7 +1252,8 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 
 	vpu_buf->consumed = false;
 	vbuf->sequence = inst->queued_src_buf_num++;
-
+	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
+	inst->queued_count++;
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 }
 
@@ -1287,10 +1306,16 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
 		__func__, vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
 		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
 
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mutex_lock(&inst->feed_lock);
 		wave5_vpu_dec_buf_queue_src(vb);
-	else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+
+		if (inst->empty_queue)
+			inst->empty_queue = false;
+		mutex_unlock(&inst->feed_lock);
+	} else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		wave5_vpu_dec_buf_queue_dst(vb);
+	}
 }
 
 static int wave5_vpu_dec_allocate_ring_buffer(struct vpu_instance *inst)
@@ -1385,6 +1410,17 @@ static int streamoff_output(struct vb2_queue *q)
 	dma_addr_t new_rd_ptr;
 	struct dec_output_info dec_info;
 	unsigned int i;
+	struct vpu_src_buffer *vpu_buf, *tmp;
+
+	inst->retry = false;
+	inst->queuing_num = 0;
+	inst->queued_count = 0;
+	mutex_lock(&inst->feed_lock);
+	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list) {
+		vpu_buf->consumed = false;
+		list_del(&vpu_buf->list);
+	}
+	mutex_unlock(&inst->feed_lock);
 
 	for (i = 0; i < v4l2_m2m_num_dst_bufs_ready(m2m_ctx); i++) {
 		ret = wave5_vpu_dec_set_disp_flag(inst, i);
@@ -1470,27 +1506,10 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 {
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
-	bool check_cmd = TRUE;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
 	pm_runtime_resume_and_get(inst->dev->dev);
 
-	while (check_cmd) {
-		struct queue_status_info q_status;
-		struct dec_output_info dec_output_info;
-
-		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
-
-		if (q_status.report_queue_count == 0)
-			break;
-
-		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
-			break;
-
-		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
-			dev_dbg(inst->dev->dev, "there is no output info\n");
-	}
-
 	v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -1498,6 +1517,8 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 	else
 		streamoff_capture(q);
 
+	inst->empty_queue = false;
+	inst->sent_eos = false;
 	pm_runtime_mark_last_busy(inst->dev->dev);
 	pm_runtime_put_autosuspend(inst->dev->dev);
 }
@@ -1577,13 +1598,24 @@ static void wave5_vpu_dec_device_run(void *priv)
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
@@ -1608,7 +1640,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 			}
 			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		} else {
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_INIT_SEQ);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		}
 
 		break;
@@ -1619,8 +1653,9 @@ static void wave5_vpu_dec_device_run(void *priv)
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
@@ -1634,12 +1669,14 @@ static void wave5_vpu_dec_device_run(void *priv)
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
 
@@ -1650,26 +1687,42 @@ static void wave5_vpu_dec_device_run(void *priv)
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
@@ -1680,6 +1733,8 @@ static void wave5_vpu_dec_job_abort(void *priv)
 	if (ret)
 		dev_warn(inst->dev->dev,
 			 "Setting EOS for the bitstream, fail: %d\n", ret);
+
+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
 static int wave5_vpu_dec_job_ready(void *priv)
@@ -1715,7 +1770,8 @@ static int wave5_vpu_dec_job_ready(void *priv)
 				"No capture buffer ready to decode!\n");
 			break;
 		} else if (!wave5_is_draining_or_eos(inst) &&
-			   !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
+			   (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
+			    inst->empty_queue)) {
 			dev_dbg(inst->dev->dev,
 				"No bitstream data to decode!\n");
 			break;
@@ -1755,6 +1811,8 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->ops = &wave5_vpu_dec_inst_ops;
 
 	spin_lock_init(&inst->state_spinlock);
+	mutex_init(&inst->feed_lock);
+	INIT_LIST_HEAD(&inst->avail_src_bufs);
 
 	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
 	if (!inst->codec_info)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.h b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
index 5943bdaa9c4c..99c3be882192 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
@@ -22,8 +22,8 @@
 
 struct vpu_src_buffer {
 	struct v4l2_m2m_buffer	v4l2_m2m_buf;
-	struct list_head	list;
 	bool			consumed;
+	struct list_head	list;
 };
 
 struct vpu_dst_buffer {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index 5b10f9f49b9f..b967f0efea57 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -52,11 +52,12 @@ int wave5_vpu_init_with_bitcode(struct device *dev, u8 *bitcode, size_t size)
 int wave5_vpu_flush_instance(struct vpu_instance *inst)
 {
 	int ret = 0;
+	int mutex_ret = 0;
 	int retry = 0;
 
-	ret = mutex_lock_interruptible(&inst->dev->hw_lock);
-	if (ret)
-		return ret;
+	mutex_ret = mutex_lock_interruptible(&inst->dev->hw_lock);
+	if (mutex_ret)
+		return mutex_ret;
 	do {
 		/*
 		 * Repeat the FLUSH command until the firmware reports that the
@@ -80,9 +81,9 @@ int wave5_vpu_flush_instance(struct vpu_instance *inst)
 
 			mutex_unlock(&inst->dev->hw_lock);
 			wave5_vpu_dec_get_output_info(inst, &dec_info);
-			ret = mutex_lock_interruptible(&inst->dev->hw_lock);
-			if (ret)
-				return ret;
+			mutex_ret = mutex_lock_interruptible(&inst->dev->hw_lock);
+			if (mutex_ret)
+				return mutex_ret;
 			if (dec_info.index_frame_display > 0)
 				wave5_vpu_dec_set_disp_flag(inst, dec_info.index_frame_display);
 		}
@@ -207,6 +208,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
+	struct dec_output_info dec_info;
+	int ret_mutex;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -214,10 +217,10 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	pm_runtime_resume_and_get(inst->dev->dev);
 
-	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
-	if (ret) {
+	ret_mutex = mutex_lock_interruptible(&vpu_dev->hw_lock);
+	if (ret_mutex) {
 		pm_runtime_put_sync(inst->dev->dev);
-		return ret;
+		return ret_mutex;
 	}
 
 	do {
@@ -227,11 +230,26 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
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
+		ret_mutex = mutex_lock_interruptible(&vpu_dev->hw_lock);
+		if (ret_mutex) {
+			pm_runtime_put_sync(inst->dev->dev);
+			return ret_mutex;
+		}
 	} while (ret != 0);
 
 	dev_dbg(inst->dev->dev, "%s: dec_finish_seq complete\n", __func__);
@@ -248,6 +266,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
 
+	mutex_destroy(&inst->feed_lock);
+
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
@@ -460,11 +480,11 @@ int wave5_vpu_dec_set_rd_ptr(struct vpu_instance *inst, dma_addr_t addr, int upd
 dma_addr_t wave5_vpu_dec_get_rd_ptr(struct vpu_instance *inst)
 {
 	int ret;
-	dma_addr_t rd_ptr;
+	dma_addr_t rd_ptr = 0;
 
 	ret = mutex_lock_interruptible(&inst->dev->hw_lock);
 	if (ret)
-		return ret;
+		return rd_ptr;
 
 	rd_ptr = wave5_dec_get_rd_ptr(inst);
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index bc101397204d..3088f3966fcb 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -818,6 +818,12 @@ struct vpu_instance {
 	bool cbcr_interleave;
 	bool nv21;
 	bool eos;
+	bool sent_eos; /* check if EOS is sent to application */
+	bool retry; /* retry to feed bitstream if failure reason is WAVE5_SYSERR_QUEUEING_FAIL*/
+	int queuing_num; /* count of bitstream queued */
+	int queued_count; /* the number of bitstream buffers queued from the buf_queue */
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


