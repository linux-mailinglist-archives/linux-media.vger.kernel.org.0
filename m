Return-Path: <linux-media+bounces-29836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A5A83745
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 05:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EF4919E5C8E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F05E20010C;
	Thu, 10 Apr 2025 03:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Xhug7nRB"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021108.outbound.protection.outlook.com [40.107.42.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EDE1F1512;
	Thu, 10 Apr 2025 03:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744256422; cv=fail; b=FUrsR/RRhvnyTK7yx5Tns5Zrdx0NxjVpv/xrzBG6wSWqpu+LW/8CC1gdDbW9HqjkF70BI6l4wC+gaszEmfqdCOaBO0qmYCp8uVB7LALfj4E9ErzOZ6LugwVGWfxQbLJ3366DSCL57QRjRfIbzD1HwWtLXoTk54rbwI/AzgHvZNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744256422; c=relaxed/simple;
	bh=YDtb6hA3MkXwhkAWMKx8x2lVe+YNO3jEo3ipHfMtjmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tX44vSM5Tr0QTCfjTk32iinpJFxEY9Zdn0zNVxxG5v8+2JMN0Fx/lMJCkHxDCqRtwLBqJ0uVcsdsON1/mhrSR0y7mzA7Ug57YjWjJgcOSeYTGAYCl42Md8Cd7/8BElgmfMXqvWMAeBTzHAAOrssW5vxFWhvM1AtR5lvRVM7Ncw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Xhug7nRB; arc=fail smtp.client-ip=40.107.42.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhlUoRZyfbQ42Gy7Ejb7ZjxXd40URNbW0Rr4t0v0pA9eeQgcItf4P0j+OD8j2sGRHEZ6WMHmVdn3d7rAn4uuxiuUnXM6x6bsQoz+70YZitXiFShy0H+RxBnuWzogQd3wypmcxyqYhx6Ir4dgEV7upmLe9JQs0CF6hxIcVbC+8WU56phcc0JeQrYnyOHHZPnxV6hM8Wb0g/rp/2DEIDoxld1NShBmEjDmsWFq6MLJK4bb/kbWnQTwtobNBQNap+1wtvIFWeaw9ZgCENDoFAp2VBQMUc7LQUhsJuv0UC2RMxj42Qp5tSNsmVQfAOKpkdYHaf2MXRIBOxU3pgT+LiVUag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVzA4eS89mDZTmuHVNKAWpZdSLSEAjHSO4ywkKF5RC0=;
 b=aAEHfAZ9eqFbFxkPl66/KT+6TN1x/i9JynixyuXH4a3clEjCHYE2Ej1Aegwf9QtWHaaJ8cNstChMuQ8Z1hUG8JVetWQstFF3D56QgbKdKWxjtBRf4KYhD4Ph0yEeUJ/4VruhY4mWXHoCUyeLGW3Ajrl7hC9Q1zT+r1P7jGJE/nqlPopwcFrpJnY/8oJO7GiZhXRd1gP62fkB962lcCj+41g7EVc7TyMXsaM7KE4+Qzq05cJC3SPadhejLhzqHgT6/w6pU9n3oyNSl1yXFupuqMHlu4eUCLYGFa/L2WHEMdAVJyLv9oyqrxCvcxAWKxJBVjVq151wystq4u1r1dfHRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVzA4eS89mDZTmuHVNKAWpZdSLSEAjHSO4ywkKF5RC0=;
 b=Xhug7nRBvrIh9y4GQ4KoR1q/VzTSI4fra8u7fEMR6M71buTASBrfffkJ/G44OMe6CfujdfHVrDwwhF2bbftAIpDbtgO79N90SrlLsV+1i/TCzYEsU3vEXvdKDubZ+XXMbjeLK8CF4PiVsrUg9YX0mwWvV2zpeW0eU9OjXyDSKQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by PU4P216MB1439.KORP216.PROD.OUTLOOK.COM (2603:1096:301:ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 03:40:11 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 03:40:11 +0000
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
Subject: [RESEND PATCH v1 2/7] media: chips-media: wave5: Improve performance of decoder
Date: Thu, 10 Apr 2025 12:39:57 +0900
Message-Id: <20250410034002.88-3-jackson.lee@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: d60fa6ff-6255-45fe-6ab3-08dd77e165c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P8JJgPfjlsspHHxkU0vAwLMgMRXp5+MVWkzCmpB5y5d74XMV9Jqo3/MBRb+U?=
 =?us-ascii?Q?STZ74gsoyF3XpgWokJOAaRZYuwXxeJtuweCTpHeXUMsm/yDGLf3QAtkf+FPd?=
 =?us-ascii?Q?fxI62ckNkICQc3ieUKUQmV0/bEm2C3sGYnPGVveGVs1IR3QsAxN0QRh72su2?=
 =?us-ascii?Q?9dPbWeEdC6qqHthnQ66EmHFhN+qGG70/oYxelmhpFKeisYFOXO1kSykFJaXj?=
 =?us-ascii?Q?wH40HHhjTcdIV1udXuG4k4QSwGCkEQh3IVvbbj6zk99wwk1q23AnTnNa13tA?=
 =?us-ascii?Q?XEGbxqEJ4XxZPCjjs4kcgHJmQ/B8LhdtyZykAdJhDtmbLS20hElKMWcFO8z6?=
 =?us-ascii?Q?QH+K1iYuBe4puCSAhijA54AQUCagPN9DluudUC4rGtTaQrm4MakueCVontcr?=
 =?us-ascii?Q?L1QUfZbq0tpA3mEmepsgTB5xGGEnVr5YTyJ/BHlH7ciVfQdtYEraUWWiNI4b?=
 =?us-ascii?Q?DawC0dIlI+XRAwztQNhjyTkxIQVJ2+YKDdTzjDkloT1by3t7wSRFBQiwJEQK?=
 =?us-ascii?Q?O0aB+F1p+pP621gNNH6ha7431/S2SOMRJ/ftLAG8WDqFTpFVmujfpMbZjNsy?=
 =?us-ascii?Q?wjvgNowX7qtXAm8+diBWSXVLEpoD/ZBhX1847K76kujPSypVd8SHGP8SVpDC?=
 =?us-ascii?Q?nR0NLCl1IWeaTN1ht3ioDFFO77IH6LpvZJkbo9GDqOC6Uf1IYZ+Bdj98KOaw?=
 =?us-ascii?Q?NJOrRJI76IQTs3BwsF4kSpeMPOk4BoMrzgQ5s6W8qd/HokAXJcPWoQJMi6fh?=
 =?us-ascii?Q?KpS+0e6gHuS9ijaIjth2mp1k2hZbE244bfeY+ZCgR5WZZVpYGL9WvI0Jxzyt?=
 =?us-ascii?Q?mVHX24lfGKQmZCr2ruMid1GHkZsMJTU/dI1MX1brBX0b9yZ8qAV9mUyO5DKw?=
 =?us-ascii?Q?T4MO0xaWsnJ2Zm4RtmrsAPljd4sA+H6Budk357T/6jWAwjf/SXgg+j2UJAtR?=
 =?us-ascii?Q?PFEdvbkauVnTWDq81fuXq/q0vwApQ8TT1FAkLMgsqOtlUfndsZeyGyH2KE8/?=
 =?us-ascii?Q?/2iCF6sKLDRL92dZlxXR2iNK2xYO1fWD/sPAVSKy+N7SViwdCwya/vNsJ2m1?=
 =?us-ascii?Q?L3w7g86TpcaHqIpufYtFW3Bo62kszOHiU9JwJWyx3ZA51MJ0gKpuXxRI8vLM?=
 =?us-ascii?Q?JGaW/bLHQnzAsLTLg7XqnTwyFmSvGamV609tQxgEOw78GpBzJfQrb8057kSx?=
 =?us-ascii?Q?XCbd1vPLuXaNRv1loH5BkktY+dO1IYAzaOaWkm4WV7E2VoU1omsAHHVQpVWF?=
 =?us-ascii?Q?MCPpFqw2iM4kX3wu96tjwfcAhnNwP2+du5dm1FlgoqsNLBQ9I1xrQzA++4pH?=
 =?us-ascii?Q?ycSRDYsWp9oSwrSIcGk19flKyz3Yx+uBApxaLh0nwIoWzKUaVq3c7D651yRU?=
 =?us-ascii?Q?6xDGItD67l4xPBjTPyF0envmLkEfzp58DFUTVdW9zmCEtLUGjyFCMlCVWN/Y?=
 =?us-ascii?Q?JSPm4FGQd3raFItXUZOLX3Pg/EkU/qgn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FUZw35vyrYrLxVAvoW5h5bIHcS2BCwTWiTmRlELrP9+PDgxe6j8Zo5bf+iZU?=
 =?us-ascii?Q?A9DLFyi+CIF0Uz0U/mW7WykYC+2IUUJNgbEvfL0tqnBjaUi7ZhBEI19i0iDN?=
 =?us-ascii?Q?lgSH5L3dIv9f3sm+NBJ0h21aAzj7u8/WW0qIXXxyNy8Y9oPor/Fa03UBm6pB?=
 =?us-ascii?Q?HQIkm9VxoLdCtHHWcLKPgptn4ti5qe3yZkBZBjrpR1PldYnx/a7feC0NWDVg?=
 =?us-ascii?Q?fQ8sdMpbTlSRVMF1rLt2qfQD7TBTcT9yeXoGFLe1YOfQ0uHHwcORus/JpqlG?=
 =?us-ascii?Q?xneYNh2ALpZtT+kJK0E1DkT9nlUOZj3LUpD1+tfPV3WzJWMLZ+0LYcRwAv3v?=
 =?us-ascii?Q?jJ8MT8zktK6MkXj/+Yo9GNfsTAsxcDW4L//Z0qV2Q24a1H+a9EJB25i432+z?=
 =?us-ascii?Q?1SwPRREk9fsl0WcyNITGZn3Nj/3KsCU+0KSnZxOXxL2RQAhuiIf2nQ+A1Dr1?=
 =?us-ascii?Q?+ZJI131ux44ShOZalB3LBCB35gPshXgGPHLSp+XQzFJMyznUUKloIxmyD6e+?=
 =?us-ascii?Q?WV6rQUDF4ssx4bnotaXCczFSR7roYUsKHr3EDZt4aF6e5YUoo9hOJWnNzWLx?=
 =?us-ascii?Q?oU+UIQmyy+gVe44COQ7vHb8/1L+seYoYFjH9FIt/fr7k8VYwmpXtw3tZ+Ykh?=
 =?us-ascii?Q?yLxTmRZkJbzISXiamMqkg1520FpNjaFcMdNoze8jb7U0Lu1FQ1+TdAyPcOP/?=
 =?us-ascii?Q?PvbEuDVkr0XPig7DyLBukHRuORN/WUnAdQNwipijKR/IAXWle7MatnVCP2BY?=
 =?us-ascii?Q?cUctn1CCBauW2/uWUo4mb1lqjTZDWAK/fVcNWNecu/tMEXNfm0qD7MKUuxMN?=
 =?us-ascii?Q?Yw8UTCDHYUw5viN6LjJkGPTXTx+SfR1d09yjjCFR0zyRkcfKhuJTBQryLOFq?=
 =?us-ascii?Q?PYbf7bclY2J8oiyDlavFdqqh73f/Sv8nvdYCSjMOG8W0rQc+rAWARmCxyIDd?=
 =?us-ascii?Q?NHru8umcUPy+qkwoWeAVybQ371Qby8gZbEAALPq6WUQrDZriQ6yW2Fd/sTtP?=
 =?us-ascii?Q?tbeCkatECNjLlqh+1vM4dRpmbNS8ze5JsabAcr2nALMSQgox0puUptoVhKgh?=
 =?us-ascii?Q?jvckOeUQOzjaPFbyFI9u2TRpE6rTpqnbVt7tioufKTS5gcrsOf5Y0WqhOov6?=
 =?us-ascii?Q?pUd6UDKniXBILayaIEh8VDNKNnSlUxob86QcycNRXQ45lzW4EWSq+7YxNfQf?=
 =?us-ascii?Q?ZyF+4avXqXubA+34OIomPwQMkdcaDkf8zUPP+Pj9AK2GDQLKnjn4wbf7H3Iw?=
 =?us-ascii?Q?X/d8AOCpnwhQP3vjT23+vu5Tw9GtepDeLwX+Gwpk2E11I2KFpxCmcImiDU6Q?=
 =?us-ascii?Q?AYS7v6NPkVCBzIl/NKxnlFZt2p3054MaWKC0t5BipC/yF+cdYfoedBOpZnpk?=
 =?us-ascii?Q?+FiMy7qK1v/HjUWtJ4KNuYhYJDbPxf2QTmQPBhAYxYcdX2RN8HZmqOVXBa6o?=
 =?us-ascii?Q?T6gK+9UZ6TIAt75IyKGVCnmWDpBOUQiluTTRw0Vyqs73ssUOxi1L9dKlEabD?=
 =?us-ascii?Q?OaChYJiLitzX9kfGDt9zU7RAeZNxTyhBDOTDBFZKkcKV9nBZlZvRPRg/nyj9?=
 =?us-ascii?Q?xasABQXDhTtUCuIUkwnXhNXMp8AINuhER7m+YZ2HLzXdM5W+5c+Ot8SXH2dZ?=
 =?us-ascii?Q?nA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60fa6ff-6255-45fe-6ab3-08dd77e165c8
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 03:40:11.6645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSd06zexQrHkSoYwtfQZynSKKoxDJPL2GrL5Cx3Oth8KKZwn5UvZPJBAHg21mG8YDk6wMKhXn4m20cyu7dn+zd3khvyP4ea7Pk+c/aG0fJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1439

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
 .../chips-media/wave5/wave5-vpu-dec.c         | 82 +++++++++++--------
 .../platform/chips-media/wave5/wave5-vpuapi.c |  2 +
 .../platform/chips-media/wave5/wave5-vpuapi.h |  3 +
 3 files changed, 55 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 32de43de1870..192556b91aaa 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -347,7 +347,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 	struct vb2_v4l2_buffer *dec_buf = NULL;
 	struct vb2_v4l2_buffer *disp_buf = NULL;
 	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
-	struct queue_status_info q_status;
 
 	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
 
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
+		if (!v4l2_m2m_has_stopped(m2m_ctx))
+			WARN(1, "Execution of a job in state %s illegal.\n",
+			     state_to_str(inst->state));
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


