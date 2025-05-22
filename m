Return-Path: <linux-media+bounces-33078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5766BAC05A4
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 09:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C6C93B420E
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 07:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FE4223336;
	Thu, 22 May 2025 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="fJWQNtHA"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022104.outbound.protection.outlook.com [40.107.43.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A32222B0;
	Thu, 22 May 2025 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898785; cv=fail; b=BerGFV7u3zKtQvmBsMpbILUHyXedFgHYjmiuXSI174lgRgNWhRC7WgAikxiDHfn/7LSXc1+8Mh3X7yaEMN52UipV7AqXfOyjmPNLPRunIhoZZVNronhm8QqUqNIsrE6fnTc+EFIQQNl67kV6FIUlWWaRkoy7gl2lI3gTDM55uuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898785; c=relaxed/simple;
	bh=jOe4KvZmx5D9MjGm4KdplfT31YVL/DtmWGF84ukE6zs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LA5DR+29xCHivZLxRgmhpVlWQtsnijPlVZHpAzqaq2rN4LVx/v82tylJzZH3w6fGk5w4p1o9JmG8YEbnBQvLcxgiElNE1sNsqxd0E7tcmbRe4RbUd6gOuJkKEzutmzycgwYbQRl+FVT5MqeEsvHq0o/EPF4OGRQmvl81v//ZShQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=fJWQNtHA; arc=fail smtp.client-ip=40.107.43.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDSct3wYR69yygJRof50POPZcl+5pkmyG6Ne6KewAY9qHd+nG221rOEtVFo/3tM6aHgaVA1Oz+8/iUwrg4RBRBSJMcrpUeS9l4sLeLj/ubIe/+LSDFS3baHjjgP4qDWNllCgYf3agn0WQp1uTznj0I6UcXP1iQ5ZoNyRFQkcydmnafFdX8sGLL5CKtysHXxFO5VMNvvcw7mXW/QSwnSBkFqZG6puWWry5hiqc+2YQDGCTJ3bUul1TYNkDWta5Yo3U6QSL/BHNnVTN1lf3H2K2CIiHCPAe7WOSwGVVk73o/E34XyIJaqKdCq5Qr6fZ94Ys+6j4tWULksh0/AFjyEL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GV2JstJY4lCPcmDx0AeG+whY7Z94zFXVak3e1r5UCKA=;
 b=M/WKiesmFWx3jmyw6p2fuDwyuUm7OqvcbBiIIGLQRZMXIHXqoeQbLamMx0NZHR3PzhmcNP3NMrxLBwX7Ep1FTa+u/5I99ooobqRJVl16/g3jeLQBWa7zb8BTRZVBAdGpsh0mZ5JsGil2wbXmGFyIiO1ukhlJKcFDXCOL2lwnh28slMcIr9IQ9KlOY+3siNUKRnonLt7UA86P2yJYZ9pZ6dHzZ7ufZISxqjmdZc2nnZ4Wx4hP0VVmaTqO4ZKkReVhHIdhs8OsCSYwtz18dO7Q7SYwRayrfnvqg6KU5mPX0/P6KrQYez10IhkUzTMENaNmxgksdXxxoDlaAxyRLaV5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GV2JstJY4lCPcmDx0AeG+whY7Z94zFXVak3e1r5UCKA=;
 b=fJWQNtHAQDIgUshQYPjxTVo5zH1B/F5QtoQZyV/KXxXA8fP2JN+h3wphftXpDBuLbZ2/g9/py/h+YCJqic3MsngInWerxGA/y1X3lBRQxTEOggLhdT4mCQYvSstui2mLKcc3IDG2M/LBe9ALCrqjrvpVGCnWA24TzN4vLJ0kqtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PUYP216MB2872.KORP216.PROD.OUTLOOK.COM (2603:1096:301:152::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.20; Thu, 22 May 2025 07:26:17 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:26:17 +0000
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
Subject: [PATCH v2 3/7] media: chips-media: wave5: Fix not to be closed
Date: Thu, 22 May 2025 16:26:02 +0900
Message-Id: <20250522072606.51-4-jackson.lee@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6fb84c26-e03d-4d79-e3ab-08dd9901f0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fmp8xWxw2EhPCvUKwV6kaw3AHr53AxWtHO/uLtyQJXli/oQVbpjFi2PVMARt?=
 =?us-ascii?Q?PcAji36lnXKqCkLKASmm1tzBA4H9n5voQ0HI/dW166ZuiSUQaAOJIrY02H1Q?=
 =?us-ascii?Q?sr71MgXvVL7/TlfqbibgsX2DGPRJWWJRoXId3kJ+C9+CZEQXICGZjH/nJsQO?=
 =?us-ascii?Q?xg5Go04SkpBMgS2a7GJFHL4kl6hfxE27AOso99wmD8SUJbLTdzsdRQ1GeKqV?=
 =?us-ascii?Q?vYLzWpgZZiCPXe2ZOu1FMlJvKAsa7Uvoki5L15yfi1vhEq8dGfgIccvOZ4rw?=
 =?us-ascii?Q?U+ns65KhWnxlXH2UlCIFmn+ox4RdkAPCOKLTkU+p6fCsZ7CXAKcJzwckHLBe?=
 =?us-ascii?Q?yNDEsVudDH09RG0GNXqzPZ2HBttsoc6OQWlFW9SwnVS8PidxhtSrohKCmrif?=
 =?us-ascii?Q?pA8DOABhzo7GMyE2j73HujeRxDUlSlGoOJwWECKNt+KcxSMn9UsaoC9dMJDT?=
 =?us-ascii?Q?a/q36crafy3sw+bULqQ5nwMZcmwwU2QCXXbpnuyxPRBuBbUWitIIqq84miqd?=
 =?us-ascii?Q?zasT5HWAhUtqAeWe0rHV89UPxSBD1zf6v/ypAZUtS+nLWpL8/0S0Bs3YW0ff?=
 =?us-ascii?Q?xbbBvD1QRjfJOhh5NWHdpxCV77tNPhD0SMe1TszcInxZIv+CenkLqDWtdEhP?=
 =?us-ascii?Q?H8N8CyYwhffIqkec7Z9UdLjEfas1H7Aij0qwoAoX9TKyM370eoq41PEMUNuL?=
 =?us-ascii?Q?jz1/cmEyB/tmr7fszo/gnXy3XdIiD/nZ8cw8Q+kvR77gk/Nzd3Hp1UAQe8aY?=
 =?us-ascii?Q?ykKTE4gSd/v2tsRBqKAY1LmiUZPuW0HVT2Q4XAyBl+uvmYfqqSwek+aGWgIv?=
 =?us-ascii?Q?C118lLQiHTsywBI5bIFuQiLKDVzw6I2XSkH/PeKNbvSppxeiqaaJqUYGFC0o?=
 =?us-ascii?Q?9fGqrn1wiaS9Swl7KHq8ujdcX2RrGGK7ZA5krq3qNioQ2wKsKX4kpLH3XQTA?=
 =?us-ascii?Q?cAePOewidvb8H8J+q8TZh8YdT1UlaatTFvAHotQiBcblG1PNsQTgtTC7tbUk?=
 =?us-ascii?Q?ECdWbPJlKz+jUCqBOxZd7H/rsizVNwYd9QC52FMvBv/z0XhC+veLwJRuZTjz?=
 =?us-ascii?Q?qRHKKdU2vwRP+k8XYijxR3Q9/sQhdPiDduSNJLCPO+X7m+3DDd4C13POs7hJ?=
 =?us-ascii?Q?NYXLZTGlU2+QKY38AHAn2Yzrq2sL8vAGJraFUPNss5Z5URI1rMQfoHch1UCl?=
 =?us-ascii?Q?+kiENLiDNtn4ou/QM2Ix6N2nah1loA9fSZJkZfcxTtU0T1C9pWWfMAgCy9mr?=
 =?us-ascii?Q?b2NZvhhL7QdQJY6jnWaAbyri2YOFOoPAwRRGkZigdcgRw+h/Lwx4nKkZj78+?=
 =?us-ascii?Q?dHbOYGCRzgj+7E5+8BJ98HracFW08yRzNgrZaLiYAjc/GnSCSkantiFUG9/4?=
 =?us-ascii?Q?SG2rErG3gzRP9z0kB22u+IvmYYupGj+wqdIphaxN1ctqoATXJInmXiU70X68?=
 =?us-ascii?Q?xD7nMQTJkscedvobggyO9Ia1Z6Dd2orir2e0OME6NFkIHntsVvEawg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HwhnRda/XuSo4NRS9KV1sbsayXzJnyXZvTxhaIyRTeP3WDbBg+uu+Hk6dHu1?=
 =?us-ascii?Q?zkeOTaht8K/fiu4VFYDDmQaOE80wVHp+vslXDzyefQ0ACFHId2eoaNTGo8f3?=
 =?us-ascii?Q?4xCrefpoO2pCqBmlFLucDYTghhmN6gVuAWIO7tN1R7cpgzLngsPYDl+/VjYW?=
 =?us-ascii?Q?2YDabuK9icRy2N0OEzoEovvTwhCpsuMPM9xT0909Pd59GnTFCtX9YaE0BjrX?=
 =?us-ascii?Q?+AqwQEn4WYa9J3TGme4YQaafbjV2kP688WIEmNwPllYdDefAq6Brup7WbPE+?=
 =?us-ascii?Q?HbKifLuEyRuzTYvbBM8UqWQiXlf3T6/Wh1k41n//fG9VR/wKXH0Cn/yGUHK1?=
 =?us-ascii?Q?sZ/+VrjklZxVgoJELLV8V/edhHErmDslKiSdy1B1mRBPO3O6pGSInOx+pCgH?=
 =?us-ascii?Q?CNJN2V54MOPSmh9blAuaCADsrqVRG1r2nJisCKrs13awcM4UYv0KzB3xx3ta?=
 =?us-ascii?Q?w0uMbeBxMw2Jxm3NthyMY4hU3ot4VTQbGG3y/UNfatVmEpJEqpnK4xuAoMTf?=
 =?us-ascii?Q?9uNIXbJqDC2qBb6D67QNbMkxHrHRFhQVIaShvZN/izcpOI5H6t0pjebspxdO?=
 =?us-ascii?Q?n6J2TdRgLOMaWul55fU1Aq++6nHN+mJn7BnLASb4w4t8iLeLLlIw/oRfP3oP?=
 =?us-ascii?Q?Z9QMkKDCyw27gWWnhM6VKFu6hgQPj43sY6g8sABvLcmmB+WYelqd4z3vtuFK?=
 =?us-ascii?Q?QsFF75AQEXPtDwocEhuukquBLpKX1tRu+JleLaC9s3TJF9ly4faMRm432Fnh?=
 =?us-ascii?Q?fL+CiqNP/I2ory2su02AfXN3XxjN2cY12GkIN734NLkRkT/QU77Vgwdl4g2b?=
 =?us-ascii?Q?1V3ljefi52HfQ0+i3hz0r7xPUjRGz3vHjmCX0Dy7/BhlQfb5SPoqDqB/LOiO?=
 =?us-ascii?Q?EjmcooAI8C+1tVw97/y8XVqc37lUQkKakE0VjnJOPUDJXsUq9WWs3LwH77SU?=
 =?us-ascii?Q?CimsAnLFvE3vSPo9ZquDY8+4sTeD8i2T1XWZzVwVcMSQj38jBZBNyxEBktk3?=
 =?us-ascii?Q?eXV2UtMSgxXgFuhvgmrQ3R36oMDAMPym9s15j3sFdQ2hSbkkun2zr7mutkP0?=
 =?us-ascii?Q?D5vfOa32eqT3cjpe75yOP+jjoAv6u185j8Al4xUhj8axe759vg+a//3DFMT3?=
 =?us-ascii?Q?wzqPudgsboeiQjRTnQjp7vL2GSsN1wUbOp0rO7d9jRz1RlycDZ6HN6xOYIbZ?=
 =?us-ascii?Q?aAeUaNg9UGWOb9+F/1chpgFBIhYmzMLUTAl3tM7gRMzl8Yhb+mrSfk/TN+QN?=
 =?us-ascii?Q?B8ExuJZSSqfhpQRPh4wAfm49EovpTHjvREoRHEVPcxrWvMfv38tJM6Sf7ZZX?=
 =?us-ascii?Q?uXjvwXQCz4yFzyN0LCBV/xRkcpNvom7DsiiJ1cPLbpUpkWm8OXJUXX9KrHbD?=
 =?us-ascii?Q?EgmB+qRAql8iCyFswhCuvnF94PAQhWUhmt8MufJ7dMDctEHD6G2OYbLJ96pF?=
 =?us-ascii?Q?ADbdGlxJ69wd4SCZnPCo0w17txQ2A5NvYCOejbRgQnat4pV9OM6veT2xAvK6?=
 =?us-ascii?Q?ITrTqN0vEt6W/dupwMp0YModjhwdk5YL+PQpeGUHrpJ7ADTcAeP8Z59OCyUc?=
 =?us-ascii?Q?utDojcNM0BJq1j4TurW3SbvKYYtjlR+gHOoJEebMfv7lbaC1nha2qn4ml+0Y?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb84c26-e03d-4d79-e3ab-08dd9901f0bd
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:26:17.1565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4igDdhAnAREt/D5RJBqLmkV8avCYsTAJWWAn37wBMDQOLOTlFbt5kHX19xM+jtqknlyJK515akUUDdNzV2uFGWzWsFmP90EKuJOwwV+ckLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2872

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The current code was to wait interrupt if queue or report queue is not 0,
but since applying the performance patch, input and output is not any
more synchronized.
So even if queue count is not 0, an interrupt could not be triggered.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c   | 6 +++---
 drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 995234a3a6d6..42981c3b49bc 100644
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


