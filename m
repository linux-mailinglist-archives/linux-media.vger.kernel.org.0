Return-Path: <linux-media+bounces-42869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F234B8EF28
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 06:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0EE31898B3A
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 04:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D2F2EDD63;
	Mon, 22 Sep 2025 04:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Qe5FOD7y"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021127.outbound.protection.outlook.com [40.107.42.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E636A2010EE;
	Mon, 22 Sep 2025 04:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758515810; cv=fail; b=r9EzO3sjJrggboMcRbMaO0SRZQ8U0jrmtBEd+ldkGTba8Yt1ih6hWYnBDBmdbRPbz9S0ILHfcKJI2rFz7u516Fxab0MgeGO1BmAH/PSSpqpiSpEFNb8FHcpiIJwDDwH+hNMiV3nsUX/8GiWAmqSodcEP6YxCG6eSw565j8Rl9B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758515810; c=relaxed/simple;
	bh=BxxrqX8FWLzXvXn7WPjaWLkTAp6/Ak3jaBbfozvERy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BXEAg00CGDE2yQdzRAiEcQGzGFCVMUt61HzUUk5qN4/gDPbQZLGCxK3Ik0bu7HmrApJM5k0g+pcUQcITQBEozz+6AnrIZH4whrGiPANrMtw0kjHZmC77PSnkGaL5fiwiW2O/15zh6b48kYmPDYFdVxaYc8iTBd7u28zaj7TWnzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Qe5FOD7y; arc=fail smtp.client-ip=40.107.42.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PB2GWGCLMwsRoWrpqj+/2lRCfm8tss5Dt3YvSxUUw1vSql5F9f7+0AvfHcRr4BDX8FN8rgVjphJSUJn6sDI1Rq6H0pkMmFJd5L5Zg2h5eXuS9u3jTi+nfiEXQvh/AsU57PDkBYDlsrn4KNhe/d2nVhTA4SHdoFosr2UTHuRvKMfB+QWJRyXcVK/WdsUcpEdijFduxXxs3i76GIWB38Tsxk0OuOwP1iZ05VIChPVHOpy7YFkwrTueVsMdj/syuxLeuOry7aV1HmJ0HU6YG+u82O/9z21IB+AzctV/mpImUl8GJHpWTbuTMEy44UmMHxJxCfLMf/265e/Rmqdmftnyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4i+d0Df9spyoNIhqfALLAHgOZPoKUWnLyRTu/V/Qq4=;
 b=eDeZdCyhUimlzFWD9tvjGgmkPXwjDW1EPRFhEm9U+sFAoUJ1IFrTOJrAPWGgOyytP7g8b/P8ffgZDh03q2NhwZ//lzj6NzDGs56ceehreIS+Fk36EBTgJNnC8PGu8up78oyP+ouYJtA0TnSLqFyillUMP7Su2Ty5FLNUYmtPDJ68yoJhqtYBjo2AqmUESaxkhaWxjXx+iE9HJ467lMWffQJfagPwy91vbBr3Qhvt+6TN0Cq7i4gL79JWXZ1C0L+1Tu6mSC6ONvZRZ66TRkeQXdXeJ93qym2dwipKUonwriJxe4rIyEskNu9ublqxKbF8G7s9H2UJ78pXye3bL5UjJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4i+d0Df9spyoNIhqfALLAHgOZPoKUWnLyRTu/V/Qq4=;
 b=Qe5FOD7yJhrhfMsxrg2vYOYJg/j7Ea2TuKjhvkDCaqKg/kdz2fkJDzeYb+b1miEh2dv9weTqqe0LfmGfJbgcUVqWjlPRRfUQnACBDU9EVGcW9da+TiZqcjcaZRO4jTyOKAp6HLPQ6grNcvYVo/9rqf0ErTS7LwbnXMij+DDz0lU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by SE2P216MB2789.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 04:36:43 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d%4]) with mapi id 15.20.9137.017; Mon, 22 Sep 2025
 04:36:43 +0000
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
Subject: [PATCH v4 4/4] media: chips-media: wave5: Improve performance of decoder
Date: Mon, 22 Sep 2025 13:36:30 +0900
Message-Id: <20250922043630.74-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922043630.74-1-jackson.lee@chipsnmedia.com>
References: <20250922043630.74-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0023.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::18) To PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:72::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB1149:EE_|SE2P216MB2789:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ca620d-3517-448a-e184-08ddf991a139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dVArC3InJgMegg87n9Sm9W4HdtPsf9xyu/dhyIg+tnavs9Jg2qcj5ifMbnuj?=
 =?us-ascii?Q?LQc08CFpYZFHOqFwnQopYk5JYDW0Dgc4hHuq1gWCgTvaCLhxz91/SScBxNOm?=
 =?us-ascii?Q?qTXi78tlzxMcxg2o9BN56JdHiKRdxJUoiutzZfwbXqagwcJvsgpT3Eo9MWyi?=
 =?us-ascii?Q?S+/yK7XYd1drdgPh/3KqfYN00qkudO0I53l7WnC0mj/MBvxg2QvpF35DwU/x?=
 =?us-ascii?Q?Yz5YmtO2OADHh5GGgE1WYsiVoV/xrmlye8s86sE7VyYVbn0DL3oj/gelIA78?=
 =?us-ascii?Q?LbVzVu217P9JeEx2QomqjiCOI964lRnzH7oP77g7wr5vmlBy+MrBQOjEPcMG?=
 =?us-ascii?Q?I06XXx4L1lJJxE3B44Vt2K5CSNen6dav69xUPuO2Yf/LYia3kSAz96RMj4RF?=
 =?us-ascii?Q?snwJROtIm5PPCq6EZH3zotva5mFFxNXX+d9jrYTaaknG8/Vhp8JiXk9INmDh?=
 =?us-ascii?Q?dY9dTkR8y9OpV5jvsWnhuxt6TyTH/pIQVIm2TUM9ptdr5lsX+O/QZ+RgFP9H?=
 =?us-ascii?Q?NpFG0zwDc9CKaPvySkNI05dSu6F8h2x/jAujxftZp68E1v53mfEYhheKb4PK?=
 =?us-ascii?Q?XwMk9ja7ywLHIoBbHjDOlrSQA25N2UY7wvHN84Q5vgwMMwrxYNoaJSIekHg5?=
 =?us-ascii?Q?xN/TItHi/1Y73qgVIt+kS3ObXz7HMqk4GWx4dQ92LLL1nultB4MvUzB1alrd?=
 =?us-ascii?Q?hiDQBHTBgL19eu6L87jo+FUMfwk1MiXLXoy6TQs0C8fcFr/XacLDGJQvMXb1?=
 =?us-ascii?Q?74RYXtrHCLO/pxCsBNhagQM0HwjYIE5EHtr/EloAwgho/h+Y0EkYfuRCQNoC?=
 =?us-ascii?Q?9lEr8f4u6SPqpZJ1dUWQvXe5GsQffRca2SDKkhphXOl9OlzUY9Wxrey+Z6AP?=
 =?us-ascii?Q?cq4MH5jbqI3VFNhy+lqwlAxk86MngSoSe7rYlQqfDUTM7Oid9t6cvSUTIH8G?=
 =?us-ascii?Q?xGfaY4LE8JT+h/hCZk+GRntzHoRQoc9hEYzk0jkZawrHJqzQ6DM06K4pz/ge?=
 =?us-ascii?Q?i01AEXEr7KecUwrNdjdQBio4ip+m6kThgoO7X23yIKl3NZBN7mlnzdVivn1V?=
 =?us-ascii?Q?Y2ycvJdrmDOQ9XtSBp3BjOp0/raYrmT28zOKbnFZ4H9jGtjq+KypoRqcoLrN?=
 =?us-ascii?Q?zEw9Nb9ZfKfbOMIuLsFpUlTpp99T+wapezpYgqJaJHW3ma6sq9zxELfB9Jo6?=
 =?us-ascii?Q?jtY5Vjox7smvwNMTMye31b6Y/A2d6KhidemUBB8Ukb9/kbdLidkn8FlA6Ppl?=
 =?us-ascii?Q?xR4nJUdGGbPKlhNN1DPxxjDHTH02UvL3DNKnSgcQIETjvXb0W6s66KYv+7hz?=
 =?us-ascii?Q?87XxzGMW95QRBv5YVXGWjGTvoo8D7BFWNCxiSHXgpjB2wl6wnDbaA+7vFdok?=
 =?us-ascii?Q?tFSUPJWusMS/AcjKAQ+Rm2+f/fWirPQpB1Y1NTe74OHmsJyjJ6NwaTS8pLzn?=
 =?us-ascii?Q?/j/Cv/EFL67XdneGVKwICx0a4VHSGp8hqNza7jfuh8cFZ6vTmLeTSg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l2JgttImHgOLuaEIesCsjx3xwHe3bP/PAq5MUGGFOY5iWoufXKk8S7LpLC/c?=
 =?us-ascii?Q?8HNrtVnMUEnpcpqaMCZ8NgRv+hpX01GyRkgeYt5EktTQPIqYZMShKF+c1H3k?=
 =?us-ascii?Q?0G7l0tFNhQslvwZL2SzL7ALqN7mkK1qOLoQZEUhDkoktVU8Vif7WuLERdgHz?=
 =?us-ascii?Q?ES8qOr/UEbPqkJXxRRDNYklPKvhi9ev5k0zLMbHrQYuscqdie6CqrkDFHy38?=
 =?us-ascii?Q?Dgferjr6vfinK/35M9iXFuaT2X1FCKz+1cn5O7Yb9+MqnYhzCwqlyYBHxDa2?=
 =?us-ascii?Q?5SWWhveVIFeWk4qV2JjiFozPveh2yCBoPJqfeiycInvbl8fmhpHL9EwOel8M?=
 =?us-ascii?Q?IAcnvXJVRTPHMREiqASt7GGxAEnOfNjmZv/78pTKyY4gAPFUJ8897qipDjhj?=
 =?us-ascii?Q?r7lOvMok+MGA8LbU5Zp7Ol8ZBccRQ6Xxp/Q6mqVNkXYr/OXfxkPygnADLDlN?=
 =?us-ascii?Q?dHLNeaM0NqSmh41SZs/dc8WYl3Ky/aXwXvy19cRjlU8sEL+rHaK/HzqJANIj?=
 =?us-ascii?Q?Fm955hoEQ+TXi2RTRZRYP2Jv2cLt476ORp+5NmAej7ANwtYRfZorQCEtuO1i?=
 =?us-ascii?Q?rV5zDJAoye81sSDEimzBtuJcrGblPsx4X/jovaSU4F/hkXDYlUk1xCls4MiI?=
 =?us-ascii?Q?WZMLMolXBlqfnmxAaHcp4/LpQpy7lXEBuaG8CtTpyBP8fAmmF7qcIdzkZJWb?=
 =?us-ascii?Q?FgUIe3XiTt123A63GeaG8OxrWHlHyBh14ofpR39rS++OrlWLpPOAob71nNUf?=
 =?us-ascii?Q?2/ojIDI3F82qxBzGx5Ml4fiin8eyqGKmsJb7LQNCI0VLutIu5ip3daKuObk7?=
 =?us-ascii?Q?f/+PlXjgAB08q/Cqb1xVsJ2ihA/A7cQq+vb9RXIz6oFavhcfj3N06q9oZZMN?=
 =?us-ascii?Q?4QOSJqL4y71XKGS1zCjkKbK728Dluix82Lw/cE7o57tUPq+BPoTL+7b9hZjC?=
 =?us-ascii?Q?y7U6YHf5knoUFiywMFrlS1Pzg+AaWXJbldLh9Hu52Bup1fweoRiAxTaJSQ2r?=
 =?us-ascii?Q?AIeEa3AMNUMVR9ksFm0lDJanNyqQ3V/iGcUFbOns7cb6pm6cQOBUuOt0arru?=
 =?us-ascii?Q?aMvCdUinKNW59tnF9v5zwXEpNv5RX8DZp8dql+KUSHIcoiKNHkxjWMddj55a?=
 =?us-ascii?Q?6aQaqi7B9DSwwKK1D9OTybWFv/BbwseEqCEkMxfcVpz47rLPzSKpBmzx4Jq2?=
 =?us-ascii?Q?zwfuiYY7q8BMgVF5s3Qx8RTEzpUN8udbze1CRJjs6suKRLFZGcyvfUuk1CNZ?=
 =?us-ascii?Q?I6kCFjhcCjUf2bCKkgSnandKja1YgZQdNrWdh3I3f4ZeWhJPEmP5pbYRbZwu?=
 =?us-ascii?Q?jb65XPFDotdAskWzAbxfk4QquxSKT7C1lWD0gohKh8kWStPrrUQHpueunbzX?=
 =?us-ascii?Q?KpwsGjXCdoRTbWouUjEDLUM69k6XK5sR7w2jKZnvFYTGXduuI+gJhelHY5n8?=
 =?us-ascii?Q?+n6mYmlPiciLobeZRCwfYsxXsfvUr/RS5+71gdO/bOapgM3O3QMtmcQ2mhe7?=
 =?us-ascii?Q?vyJke7lMpxekzwVwwgdj+CnhkcopliysjKucfBx6iajSoNbsTXgMZVXOKtNG?=
 =?us-ascii?Q?CuC+4sBN3s8p6IG+HrmANjsZe02ArLHjJTSqB7Vx90CcDVGDDJ5eweGrGraF?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ca620d-3517-448a-e184-08ddf991a139
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 04:36:42.9052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vh8TsNIy4ZFkOpikiz25wuAPGj/1Fw7IVBp3NDfcnoC0hrF+IHvS0NQ/z+KXyKdqB0mr3ZOabhZoGHmmuWwvt6krrlVzYZ+YjByF+SSffw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2789

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
index f1e7fbac6149..8f1d2af8063d 100644
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
index 4da1772ef100..10a7d24e31d1 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -819,6 +819,12 @@ struct vpu_instance {
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


