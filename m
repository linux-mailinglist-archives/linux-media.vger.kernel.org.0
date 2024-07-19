Return-Path: <linux-media+bounces-15134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB0493748B
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 09:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E7201C21D54
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 07:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E90B6E2BE;
	Fri, 19 Jul 2024 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="N+l3Lfed"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6904EB45;
	Fri, 19 Jul 2024 07:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721375439; cv=fail; b=F0LtwKkAoGagMBJMsXQVAlpQTr4+peRdEnVT+jvRBM03WO2aVF3/0TtvQj0l5BrtMBvHHnkAhYU83pCyBhWAla67p/zfvHT2J8aEjBmhqa2M7fozsjUbGzh7xmk4Pc8q6IUgmILcKnOEtTcar5t6i54+VVagvbVEYPwcwEHXfa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721375439; c=relaxed/simple;
	bh=bNmUK/SdF9mu7QbvDuhJfrg22jiOKzN32a+SWY8y1SE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=eioGlSNERnyXgmPNdoXUf1EuXgglX/5tsLhMZwS0Wq+cx0CGiFBRS+R6ZVlx2D6mTV///Z3059J5ttMuRT7nKjNSmaRWhhbBNjpc2ZlKNRVLUq5NBS4TacdghEqBQJMMrAB9rBYP8gS4Ten5ZgShynYnTPpukalDjDFn3W+Gs9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=N+l3Lfed; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFpNQujRY5PPtz9JwQd4hlrEwr8ChpWG648EJXm6ZQQeZ6O9ZeK4Nu8f7mt8aw6UV+zMK63EBUN4dgmNJ1u8OPLYZ4PReFzY7Zq3zDwPV9Oo0UAS8VlcHO0KTjYsORJGBzSBsTSAqBr3egjdWQ50MN6kNgcoScz+52dxS9Tubbd+Yz+wACo/y5/uC0yu6dMJr+8xvc14awc+SJQ4fzuqaSja6tybCJWidNoBrKFjNzPIEb1X8XNBPc7iHeieZr/RFWPa8WvAFnSOAl1x9GQmQUTd6e/qih5Fxyijc2TEa3lNzLHGn8BuX4s9WfapJDKLL6wJZbTJ2QAq8FvSALx9hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3JUDdlYfUQrIg7ej/SWUTXkcoqeCz4/C2s218s4FpY=;
 b=A0H47D5p0VPylYki0XQXt1oErVIPN3n0//A2Zvy1RCvKkcL3pFmQ+hwXYBCNShZOpMRrcpgQ4yUQKCjJuE8VdlxEhMX/P1eRLIv/NPEaAArpLWCbrc/w48vm3uJLJiPLfj/H8MQltS5bdeE5MK1gZtMvRQj2pKGZxOzRvK2LETDYefMZ8YkkxuwYIUJitg47/WZbpbMti4/l6nzAkBItAxix1zAkJssvIcJXx3QQPNmrC90nOA6S6phfC17hN0/GW9GM/AszsQnC/tRm93fPbmG2c+BqJSSbKp7T7uIANbKynga6vV+Xjsp4n6ILubTvHqYV5jQ/MW9tOaxoJJaQbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3JUDdlYfUQrIg7ej/SWUTXkcoqeCz4/C2s218s4FpY=;
 b=N+l3LfedzxPTE2nzylFnbpW9LTWsaOlVhGsXrgUwZ7Wp4AvoXQ8DKouj8K4PGm+Oif4IIQG9LEuxSZiGtNVDlIQp/3cuw9xLpks6uYgl5UznhIzl7skf3GTSRzdrSCBdsEeiDW7eSynYXp+vtXfnLDns17F3/sdwhLqd9Nxq5PA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI1PR04MB6912.eurprd04.prod.outlook.com (2603:10a6:803:134::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 07:50:34 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%5]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 07:50:34 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: amphion: Start decoding job when both queue are on
Date: Fri, 19 Jul 2024 16:50:06 +0900
Message-ID: <20240719075007.384342-1-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI1PR04MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c0d7e4f-1385-4beb-f327-08dca7c7787c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B4Tt2S2NtMpJjkzPkgdvbH0QGnxlPkNEON/943eYk6Z5g6PYh9prgW0syFKS?=
 =?us-ascii?Q?vXKFjWD4F/xHBfH5UCBxPEOz25oxiV5mkLPjQ3DwaOWtiYcPZWFUYB/+giTD?=
 =?us-ascii?Q?rsOkExMZxucSJiQlXYuzJtRI//zcDn/2dcpD5qSPqXsMQMEaklJXjCzmEmew?=
 =?us-ascii?Q?HeasQwlb1wDF/IZJVYs/elvwkJElY/nJAeLs9GfsKF6CXd8uFbsFtH7BQBvo?=
 =?us-ascii?Q?pNH9C9n3PkahDnNiji3D2GWVor9yXMx21q7rYziK8hbF6NI6HjRHjqEovq9E?=
 =?us-ascii?Q?BKbtfZcSu2nq6hUhYGiAYA2Tks7SObyKFtZIDOAv83oLXOBjBzUhFlie7SbD?=
 =?us-ascii?Q?O/11HvAu57fuOMIL17DfnqpwY3qnCT4BZZXf4ZLSuIwZClXjvV6c3plBk91P?=
 =?us-ascii?Q?vAnEzLo4siLGXov8BR4M9g1/Eu/WVCFTQv9GZh9dnSMms20SsUAL2+OqUwiE?=
 =?us-ascii?Q?0wTrSZbvcZ8V6wWlq0kF5inrA0l7zs9P+WJ/jt80L9gQYOh1M3BkXIBlGYgQ?=
 =?us-ascii?Q?u3hOhSDXjoWpKnFFNPbt9ms+g9dk+a/ae9RR1i62/9e7mxlq7GnfjYdO0O3f?=
 =?us-ascii?Q?b3H4mCePX9n69OWyLC5HX4TLOb9YlR0vVaDj+7j5Ss6W0aKC1QRmifItlW9G?=
 =?us-ascii?Q?N/I9yl8cV5ioeIzDexAhRMKp9H5IHWkDBlVmov90uq3XIrW0l/tuwart5Xf3?=
 =?us-ascii?Q?bS5lDsS+KWXYul+Osl1IIQ8kSs+BP6p3CSLtv9MDzEOAC8LJ3LT701NTotHI?=
 =?us-ascii?Q?mFtBxmD0i8dUdfQ6HYdFI87vz0zMVA2+VMsaxAphmm89zgq5p1vf0mgN+M6p?=
 =?us-ascii?Q?PShzJ5JZudm85oLvQzQVOTk7J59zDkIuiCou25FllRxexXSKjqNVLalXPQcS?=
 =?us-ascii?Q?1fRfqLeE2Do19MPA01ccZapEfUseANNT/sKCUgOy18BMoNnATLLIs21Fyq/W?=
 =?us-ascii?Q?ewwiJuekp7YjcpSuZweaxWeVxHVFDPmMylh07RsoOUuxm+l1G7lV5hL++g3y?=
 =?us-ascii?Q?veAGUGdgJzpCZoh7uM7+zhMZlAuQUeSWMKfn+xuh5nUlFl1m7E0djLQ/kaux?=
 =?us-ascii?Q?nV5qKKDTQO1UrSx5o20ezOjfHpur9RHw4QJVFEWL+ZJ/jccEdzuHZi02UO3U?=
 =?us-ascii?Q?DEqxHliM+BmHFKZFsg2nEuNdXnRI+izQDyqjP285VH7jjuTxrRZFBryaF4EY?=
 =?us-ascii?Q?D5kJIMwKJK0do/w1oI4PzE/BjP/CF88fKb23C5QDTkExJCImnKT0mAD9pHxd?=
 =?us-ascii?Q?tynX7vXGjg2jc57Byv6d3KFyHb0//LP5uRV5Qt+jFfGbazkth31a+qcOBEYV?=
 =?us-ascii?Q?Ybj0wF7Mluy3z1dSN7yxrI3O/Ok293yoH4ZJZNrZU7fC/7vraaaduB+RKMaT?=
 =?us-ascii?Q?4uCfAktsawjwSWdNubY+UOJwtOkaWGXi32BM5uuIgUKAN5CqxA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Lj+O+kFg4QOumTUGPz6VwutIUmYbpGujF7Fpn1V8amvzVaNKNbaL/ca6lUO?=
 =?us-ascii?Q?1fGmYUj0epSCSNa/GkzKypo1ZFu7PfPuTljiAQRbmalY+HdsYe4wbJ1Os9/M?=
 =?us-ascii?Q?bIbcvZWf0tq/VRFZ/tkJFFng/9m9v79td95xPloFSOx8zocerfyD4A5UjIu7?=
 =?us-ascii?Q?Xv6W6jnD3fUpk3PpwwXu5dKUKDv6YGazrNOMNW0O6WUVKU5m6QZQJA7orbtM?=
 =?us-ascii?Q?KvHNkJOiYL2vJuvc20cUQ2YdY0A+8o2ipsac9Z2jdXJTdPlJdJNC0NsqZh/K?=
 =?us-ascii?Q?pxBtbDei+FdROI/QGbsRSFvV+oYiA4bMCwhybEXURzoSUywvz76kOE/zEiW9?=
 =?us-ascii?Q?5GUSmDNYfYIM4NG+AkqpbLDwep2be/6kzCmSvfRuE6fYoissNcDf//nMO5pz?=
 =?us-ascii?Q?Cvmcig8yx5JgGd3koawI7mnjH9Kijw9YICdoklkTuEqxnfGSgbuUsLsdFAUx?=
 =?us-ascii?Q?4sgSuheQsR16/cCPA0shKWyZUDVZLiilmp76x7lkC37oDENdwrEiSSH6UEXM?=
 =?us-ascii?Q?v0crJMkTA0+5KcwvffnrwYg8PeiYk0LqUhRDEu3SP6dxbp7MNo6hn0HFWSCV?=
 =?us-ascii?Q?P+yi4Kc+vtKS0m6HuLwknxr1IXyKTHgW/TYXC2Z28WJFkpC8b+kk6sdYNXxc?=
 =?us-ascii?Q?vtgUWpLZqdO3DThrLqdnjLVWzT9pns7R5nmOFnp9eJbTlwXTwxOHdZtXgCZv?=
 =?us-ascii?Q?hUKjWgObEPAoI0f37DWx/5y3o1s+tInHpGURUOMeK6vNpQ4NmqDiMZPnoCU7?=
 =?us-ascii?Q?MiqS4hF5yeWU4sL3uAQcO60fpprSFIFIDekW80jUH3y87fnFCFsZgoVBx8jS?=
 =?us-ascii?Q?Jr002U0oGhOA4QBgwPy71mz0znkx8gYKwymSX1v3wNUurwwy9Xe7pEvFL6Nl?=
 =?us-ascii?Q?MQm5PkrFJ6QLe1soNNz9ZZdhyynI5GGuDfWIn4t996pW5UsuiNZCqtpHSn/U?=
 =?us-ascii?Q?8wYb5hgwDchu1DzdcKZtE1BKa/Z6i6NZoZ7yvw6GcoDxDUnadTDOw5kekoNb?=
 =?us-ascii?Q?I5b2jLwrwiajFVkHtf3l3mWRB3Q+uHB30G8D+iyd+71QFoLxQ5qop+rZ0oXc?=
 =?us-ascii?Q?tnkHhau+cT4wP8uPWhttlmLJNALxcx7i2I9I3k6QFNx/9ERiV09xST8dzQEF?=
 =?us-ascii?Q?0O7YA8rfiRf8GeqNIU13Mpj/xQIL+LlLhmV91r8s1w+9Wr2QK+LRqchCly0Y?=
 =?us-ascii?Q?im7u8NXoPf0UTh/M0yCbabtjC2f/N7vv5PrJFRE1DeLGNXl3xjfVJpJ/ohad?=
 =?us-ascii?Q?felxWcKnleBXxhmE0VEby4TFDI2ra6oHvpbw8hnVTk1uJ0W229PEroVicra4?=
 =?us-ascii?Q?+UDlq4wRw998/VztqlXbXPrRqvu0+UtDNbAyqE581Pxq1kYHS+al0yeqPmhV?=
 =?us-ascii?Q?FZCpqvQe3ZJvLKKz4rNFtga8+1ayVIrexIKs/elcEpIinuF9Q5FB9/mkTeYV?=
 =?us-ascii?Q?puyCbrqK5lzQkm2QPBiRQhiLQbqENmQTY8zaeAfe20+FQweYcfk0Dk8Rn/E9?=
 =?us-ascii?Q?AlY91n+vwkaBhJQVWQTVOBs3mHe/YGzfsTYKYfH+YUA+gubXtSMV5m+sPPKr?=
 =?us-ascii?Q?4rr9c4IZ95WSoJLcVNghn9FZ0QXQRdOXE4w0uBhC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0d7e4f-1385-4beb-f327-08dca7c7787c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 07:50:34.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cD8DKuaA7LB2E8USmuEGYUWqEwbzORJGiJSkCRxsoHS8yNRaP7nxrQOVLpD0rzXz2tvBJdw+qXCvj8zMq8lBZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6912

Start the decoding job when both queue are on, except the for the
initialization sequence.

Especially when seeking, the capture streamon may be called after output
streamon, driver will start to decode job immediately after output
streamo, if seek to a new resolution, then the source change flow may be
mixed with the seek, it will cause confusion, then may led to pipeline
hang.

When both output and capture queue are on, it's ready to start the
decoding job, and it can avoid the above potential problem.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
 drivers/media/platform/amphion/vdec.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 6a38a0fa0e2d..ca8f7319503a 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -1363,6 +1363,12 @@ static int vdec_process_output(struct vpu_inst *inst, struct vb2_buffer *vb)
 	if (inst->state == VPU_CODEC_STATE_STARTED)
 		vdec_update_state(inst, VPU_CODEC_STATE_ACTIVE, 0);
 
+	if (vdec->seq_hdr_found &&
+	    !vb2_start_streaming_called((v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx)))) {
+		vpu_trace(inst->dev, "[%d] capture is not ready, pend input frame\n", inst->id);
+		return -EINVAL;
+	}
+
 	ret = vpu_iface_get_stream_buffer_desc(inst, &desc);
 	if (ret)
 		return ret;
@@ -1555,6 +1561,16 @@ static int vdec_start(struct vpu_inst *inst)
 	return ret;
 }
 
+static void vdec_enqueue_pending_frames(struct vpu_inst *inst)
+{
+	int i;
+
+	for (i = 0; i < v4l2_m2m_num_src_bufs_ready(inst->fh.m2m_ctx); i++) {
+		if (vpu_process_output_buffer(inst))
+			break;
+	}
+}
+
 static int vdec_start_session(struct vpu_inst *inst, u32 type)
 {
 	struct vdec_t *vdec = inst->priv;
@@ -1573,10 +1589,10 @@ static int vdec_start_session(struct vpu_inst *inst, u32 type)
 	if (V4L2_TYPE_IS_OUTPUT(type)) {
 		vdec_update_state(inst, vdec->state, 1);
 		vdec->eos_received = 0;
-		vpu_process_output_buffer(inst);
 	} else {
 		vdec_cmd_start(inst);
 	}
+	vdec_enqueue_pending_frames(inst);
 	if (inst->state == VPU_CODEC_STATE_ACTIVE)
 		vdec_response_fs_request(inst, false);
 
-- 
2.43.0-rc1


