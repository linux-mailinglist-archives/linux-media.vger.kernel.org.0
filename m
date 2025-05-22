Return-Path: <linux-media+bounces-33077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9680AC05A2
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 09:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E7DB1688D3
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 07:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353742222D2;
	Thu, 22 May 2025 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="M9wcm8Cj"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022104.outbound.protection.outlook.com [40.107.43.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4373728F3;
	Thu, 22 May 2025 07:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898783; cv=fail; b=nOuXsKiBTg2oJLK9UANx67Fev2XA7rEmI1f3u2xnVpD+BAYHleZJJVgPSZoNCTRyP0r20PFVVzvAVWQGh4mGGNjQzezbctE9CSnqmFfEjiIfdFh6m9LBSLUDjeYuvOi7So90HXcUCRYECHdQg1LQNWV04v0v5PKrgo+nchZhGbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898783; c=relaxed/simple;
	bh=GjcU4TiyXpTgUB4N6SmrycrijuRGAbrdxjN1FirKEWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O2IEJAg4ck4AJTQAwy2Tmaq9BO/06z7JoSz/RuBc3tYawl5qyjiGtnwm2f5QPoNfn0LtX5COo0cgBHZh477Xb95IzY/a/SSmG/XS2tr67BAGsgt26uMD963372Nra+EZVbLANu7LsBBAkqnYeZ34C8s4ANqOyAJtbTvV6kp+45I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=M9wcm8Cj; arc=fail smtp.client-ip=40.107.43.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vt9oo4tc+IOH03bSF5VYQQt1uar2ICLEfGz5dm3OTYNpbRxkX3Tb7fOLewKNTQ9YFrv9CZWtQHBbLNKmQQ48SI+K1tuEHX5/TYm40DGE5yql3JEreTKKOMe28JIaV8Oby/unFciutpOdmwdFhge4YHo5WaOYGFUj1N70WFl5XPpspx6rolRgXSf7UeMXr2S2EK1/W0v8A20rJFgymyB0Xn3wEo0rskKM/uF5Xuk0otNu4F7nmjrF5sIlSXIp4hyJKrlk6Jx2krWQhAON91o6yvmh/CldW7FPEgTrg+cXirqYQRVqvuex7l/CuWbAc8A7wPs0BveNLs2NUO+XTG9/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROdWuiLnRZCj9WCMcfOqRvY3cFL1BWpGXwM0gxQtMs0=;
 b=vdPiheEks0fSBBd31ZCjsUK4jADbi34RZXmeTUfvFWK/9Vm5Wdg0grmg6c+pagPKWpJXRCJ4X1z077ynRDNkpSVZd2AlEyjFPTtxOaBU7Fo/pJcCjzo4EviM2n6mjfuXo8WxmexOc35Ef73hEVQTIxC6pmOUWS2RzTQlUV8ZU9fEX/L6LihA0LKHmV+S5xmgd2zH+/ttGk6OTRm6O5T6/KldO82kW2jnjeEJ/vA082tixM8+yGqr6CfL4OVQ21AxOFvjvBls9jOWbp8+AUTy2qOJ3dW8CFsbi04m0A4zlrEN61pVGhy7NKaLF9Jk4S3GminWOdxoqtbzt/XXQNlHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROdWuiLnRZCj9WCMcfOqRvY3cFL1BWpGXwM0gxQtMs0=;
 b=M9wcm8CjEEg5Y/IiAdNA61RGEtmEA+mRwBMmmMPDyMYbXKNc1zs93/yqdMCiZDDvED2Wavbpu8mwK5LYABPkYSFIb3FoJ1fQnno4D11w1ztO7jOFjqvKqlAavsxUEhe/6TTlkBtciIfpYMnc6m7QTEcblG2rDsl7h5poTvDuni0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PUYP216MB2872.KORP216.PROD.OUTLOOK.COM (2603:1096:301:152::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.20; Thu, 22 May 2025 07:26:16 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:26:16 +0000
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
Subject: [PATCH v2 2/7] media: chips-media: wave5: Improve performance of decoder
Date: Thu, 22 May 2025 16:26:01 +0900
Message-Id: <20250522072606.51-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0071.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::13) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PUYP216MB2872:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd66015-a571-4370-876d-08dd9901f07e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5BgNjVC/ZQtL5K/r37hAzBG73Inmc0xJJhi3xBEZ9i0tZQcjv9g/D7ByiGcV?=
 =?us-ascii?Q?4HbGkZVOkJvGdrdbf1UfG9SSdSElSKhYjKxEk/Rz7jnu13eWuT4sZCjEhIBF?=
 =?us-ascii?Q?4KSzS8bAkn6Bg/5G6H4CiQfFX3bCMC30CACZoTosTFVVaoBsxZ+HxoP12CXl?=
 =?us-ascii?Q?AGRNxMPkKXlZ6d32v+lvCH1YNn7vdMufOGbW6zczZKvENDnqFZZ5tfzFP9D4?=
 =?us-ascii?Q?22Orv+msNKWAUdtBVVr7kADe8pkT/AbX7OPh4TqaE2FO90thLHfZTI8CZZzN?=
 =?us-ascii?Q?2isOHh8R1U5N1rQFoSbOzuQTTZ1tBInMEgcgNoI37L7JenBlR0yH8lusy1fl?=
 =?us-ascii?Q?NZQtKk4H2OEmA7d7eA7XrzXMqrfoIMaM16Z3OxNhUwu+vF4GFjBeZWSHyRAK?=
 =?us-ascii?Q?/WVqmKRznVYaAxHEgqg55q0oNwjcSL2uK8ZT1DpSrPV7DAAHzTehe9P+8+vp?=
 =?us-ascii?Q?0AafOMDMVH2tC43d3VFG/ok9rdXxlFhi2rLHDIQv4sGKYGc8Cq6NN/3wL0We?=
 =?us-ascii?Q?4tNwNbiitQFHleqUJfWuK6S4+CGoAWxEOyUgs/g5o7L3D2OKG+Bg3u1EopeB?=
 =?us-ascii?Q?7HWPOALVxihmYnmh8O7SWqd1I7PR2kIzGZxfknK/rycWfirZ0mN9awXbQxut?=
 =?us-ascii?Q?+QiSBj+V3Z6HvOr/sbHWSVnxVlzRIoQG4jLBQsgAX2+jJw+We+4dxCCPcXpy?=
 =?us-ascii?Q?8LMWpEtfamrQ8IUxl50/jL29YvJO5/ez6WwyL1jyxe4QVQGDBIm4IyvW1VQQ?=
 =?us-ascii?Q?Ns6FbDReu+e5E68umR+os6Iq6leXf6W44XmCVOTZT6hKMrICbEKdDvnNbPys?=
 =?us-ascii?Q?Zo2eXJhcKy02Uv9imCa3ZHwd0RMVvNvE3eOL9SJ3LA1Xn1iJvUmX+0iUNx/o?=
 =?us-ascii?Q?mv38PXz91PjRgmo3K/GTHHbWXAwA4Ehuy9+OtUbyDdoxMjhEVL0ljnV5BWOZ?=
 =?us-ascii?Q?QpVfsavmhHGkmKJxQZXzyDmdQNh5qm4hsy8/asrL9ghLSj+Yi9nftihVAoKY?=
 =?us-ascii?Q?ITmkyWZIqLGHgUrkDHs+AuNUlT173LSFiRZGWRZnCmGIT9iLNsd0uWY3m44Q?=
 =?us-ascii?Q?f6JpfJs/mp/S8LzOc9nNz81oxM4aagmO2jY3a5V/DmTcdgyLGSZijfOsFf7/?=
 =?us-ascii?Q?kzDLdclqPGou1QWts3v/mD7z8JHOoc1brsi+LYvuDTnqHMO6sRPbeT0mpGxm?=
 =?us-ascii?Q?sCpdQ4FlGXo/TzbFLktrH+owHYtp+AKPyLSi3Y+32PNO56f2T5b9/WtE1SBf?=
 =?us-ascii?Q?grWDQkxlRtZY1EuS97ZtKMx7u5Yi4qo8g+/d6d+pE96UGJE+ZNS77hTiUscE?=
 =?us-ascii?Q?2HS5QHYDgBcceMFnGzkpTNf3j/h0Ga4GAml0QeUoPNa9iotpaC+MXhGk+XkS?=
 =?us-ascii?Q?1JAgs4FA2zTAnQNgkirZtqGxUITt6aklk/JOb4Ux3s5+6ahs8Jsu1eRQ2bFj?=
 =?us-ascii?Q?TDm9QArnn+8aXgEbtLo4IuxzdkdOd7iEF77gs2EbIHa1eojGeLVrvQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ycTAjm9uPGzm5sKY6pQaRaT1OQqW5n1LpZZEZOkemwKG3BOfCfla38PG7qAz?=
 =?us-ascii?Q?0LdDqQ566nBBHPls3irqv6y58R5TgeQpwRsZOoTSNX+AFrq71xyDyUHv49sZ?=
 =?us-ascii?Q?ec/BbE93eMWSg6z3pBJ23eFH5YEblkYJ1Ak7nKvHAKRjDDL5lD0hrDzuiePN?=
 =?us-ascii?Q?D81LQ9PTlOQhRM59Vi8XqqY94d5eZgjnFh7Qu7VnBk0mvwAHVkGSswTcGqum?=
 =?us-ascii?Q?pBNenQPhoSswW6ncdSBhAQah+/t9uTOTxvwIgIKOszQ6mSZZQyOkOGs/e3I7?=
 =?us-ascii?Q?2bLQPd2C26A5st6qM5kUVmGldUQDUWsPMsxEZXZTr5jcBFJ4NRwkmzoPdY8F?=
 =?us-ascii?Q?j+c6C0StcCCTqJODkpVuarGFsDQSUquQ4yF8dykgJxplRNwM+Rsc5D4kOFVL?=
 =?us-ascii?Q?fte2AL2y3xjKd2vSf0Op0lvEEALbzrjyrfgrdBKuTQBSFaLYCegcOsdN7+WT?=
 =?us-ascii?Q?STq5HOUKp+QPrlw+ptVXLT4j8gbGpwHifmmRNPkptUXyTeAA4+lcMtSlPFV9?=
 =?us-ascii?Q?euRJO6JgawAdSjz/fT9TnHCwaffoNFsyUzj29d3A8HQqiptKbG7PHO9DOL5l?=
 =?us-ascii?Q?nL/L990CvMrWTOYcX36bY2VNTERoQiB1TrSUeHl9lDQ3o36OBHCb+TZdhtf0?=
 =?us-ascii?Q?/KDBBCM63zmzJ8EnRzscTlM0G/KfWn0hDoQFxCHIDE0IAR0dPpK1+mUsbjPd?=
 =?us-ascii?Q?Jn8TahVtnTbBlnK+Kbb6vmk9OWGWTtEj7VTAtnGlZbIkYPSVqIGO9kp0HIER?=
 =?us-ascii?Q?+uVGVyI1mLY/Hac8s1pSaozU7A+Rx8jvgMYscvDJJ/Ep5oqj9FRkY1oKvkLS?=
 =?us-ascii?Q?0rbZuFVBPzyzCSx9efCtboKTpoKQkI8qTeb9A7fhYCKCXuL+efwDBHa7dleo?=
 =?us-ascii?Q?fjuuOyNwMxdY2qDL34yVlFSH2ocV62SuyPXgtkXal8znBt0xJ58DFHBl+7Mf?=
 =?us-ascii?Q?8Iz96VkBVPnw24jiIZUuGlDpB6LmSOuyGjc/kgqLHvdw2WeP4X8LL08s1veh?=
 =?us-ascii?Q?D0XeELfriUu+EGTH0RQ7c/8biDrEdUlnm7GwNZdBAjC72TVRpzQPRTc6DsYJ?=
 =?us-ascii?Q?3F0aBUU8kETQE1KSvFmpzwlddT6FhYVb9U8TbVJAgpIckPBzjTFuhu9KQpRg?=
 =?us-ascii?Q?KRYemr1AVwAI9QuyXG0VZeJb7iuQqioxy0S6JeILXTFqjOKboxZs8qAAp6bo?=
 =?us-ascii?Q?KFPaZzsWJim+PfKbvK9dZK5Irhr42g05B+hjXGVg+O7nVF3rkIDZQpSqZDOZ?=
 =?us-ascii?Q?Ei6hNgiON54QnczrJrZcukkleXqnHaCuPxjAnWwSu9QMBAjt1ojoYshofszV?=
 =?us-ascii?Q?AmIA6bH37hb1nT3JR++lckDLIbVh9zNXVGrOKYBVrpzChneGvbDOt1zn5vLw?=
 =?us-ascii?Q?HKKCvFQJqIMa0xlW4oJIiz67MsYredG6vlO9sRjDko59vWuQMqhdanjZ2xQO?=
 =?us-ascii?Q?V74BtBrYtjvEYXqJNqNskXx9lAd+UkhW4graGVxsmJcliiyIOVmtcWjh1ynS?=
 =?us-ascii?Q?5MjdIVoQWG2rj0RNGzHtql5Gx217A0sT8UUMt+9IUdkzNWLQbKVhykNc+pxI?=
 =?us-ascii?Q?Mjp4HGcwtfpX4sg89xc7iAZbWA9B8bvOLO/RfbZPhpLutpJIgpn1q55xJd/N?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd66015-a571-4370-876d-08dd9901f07e
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:26:16.7523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtEqgTiHU8H3fp43PkECW8c3eta7TSMFw3D2HDx/piF7fxIdzS/SqNminbiiv3vANIzhkq/PP20FBoipaCaGGhl58SE1fatLhHf/nCyUcO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2872

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
 .../platform/chips-media/wave5/wave5-hw.c     |  2 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 84 +++++++++++--------
 .../platform/chips-media/wave5/wave5-vpuapi.c |  2 +
 .../platform/chips-media/wave5/wave5-vpuapi.h |  3 +
 4 files changed, 57 insertions(+), 34 deletions(-)

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
index 32de43de1870..995234a3a6d6 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -347,13 +347,12 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
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
@@ -441,20 +440,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 		}
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 	}
-
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
-	}
 }
 
 static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
@@ -1146,8 +1131,8 @@ static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t b
 static int fill_ringbuffer(struct vpu_instance *inst)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
-	struct v4l2_m2m_buffer *buf, *n;
-	int ret;
+	struct vpu_src_buffer *vpu_buf;
+	int ret = 0;
 
 	if (m2m_ctx->last_src_buf)  {
 		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
@@ -1158,9 +1143,8 @@ static int fill_ringbuffer(struct vpu_instance *inst)
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
@@ -1220,9 +1204,13 @@ static int fill_ringbuffer(struct vpu_instance *inst)
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
@@ -1236,6 +1224,11 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 	vbuf->sequence = inst->queued_src_buf_num++;
 
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
+
+	INIT_LIST_HEAD(&vpu_buf->list);
+	mutex_lock(&inst->feed_lock);
+	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
+	mutex_unlock(&inst->feed_lock);
 }
 
 static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
@@ -1385,6 +1378,13 @@ static int streamoff_output(struct vb2_queue *q)
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
@@ -1580,10 +1580,19 @@ static void wave5_vpu_dec_device_run(void *priv)
 
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
+			goto finish_job_and_return;
+		}
 	}
 
 	switch (inst->state) {
@@ -1639,7 +1648,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 		}
 
 		if (q_status.instance_queue_count) {
-			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
+			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 			return;
 		}
 
@@ -1650,14 +1659,21 @@ static void wave5_vpu_dec_device_run(void *priv)
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
+
 	}
 
 finish_job_and_return:
@@ -1755,6 +1771,8 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->ops = &wave5_vpu_dec_inst_ops;
 
 	spin_lock_init(&inst->state_spinlock);
+	mutex_init(&inst->feed_lock);
+	INIT_LIST_HEAD(&inst->avail_src_bufs);
 
 	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
 	if (!inst->codec_info)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e5e879a13e8b..68d86625538f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -255,6 +255,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	if (inst_count == 1)
 		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
 
+	mutex_destroy(&inst->feed_lock);
+
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index f3c1ad6fb3be..fd0aef0bac4e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -818,6 +818,9 @@ struct vpu_instance {
 	bool cbcr_interleave;
 	bool nv21;
 	bool eos;
+	bool retry; /* retry to feed bitstream if failure reason is WAVE5_SYSERR_QUEUEING_FAIL*/
+	int queuing_num; /* check if there is input buffer or not */
+	struct mutex feed_lock; /* lock for feeding bitstream buffers */
 	struct vpu_buf bitstream_vbuf;
 	dma_addr_t last_rd_ptr;
 	size_t remaining_consumed_bytes;
-- 
2.43.0


