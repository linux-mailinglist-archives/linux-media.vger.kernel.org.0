Return-Path: <linux-media+bounces-21276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5201E9C4C61
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 03:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1114F283E3E
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 02:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D347120822C;
	Tue, 12 Nov 2024 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Oein6f6e"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021085.outbound.protection.outlook.com [40.107.42.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A429207A34;
	Tue, 12 Nov 2024 02:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731377734; cv=fail; b=P8w0787v3YQ60Nd1EQienqEVIR9NnTP7rIUQ55SvhpIstXhCwjN5ENE8kH6wYMFxV+hfdmWGDX0ewuSM8x6pRWjZd0ibAeNN4tN/KdASJE8mMQ/5EBSrNZ+3RUG7/kSMbfaxgNyQ61GhLxUl9nk0KeultHe+xLU0pNqKqGsRH9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731377734; c=relaxed/simple;
	bh=4ahxejURnaVVUm4qrjYFhLkfs8QT62VN6duD2U9ywF4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YCBfOmwX+0coQcdPrZjqqgynpca3go90o+8c8H70XqKJAnNQLJ7GO/MV18hWC5ODdTfIPpU/ufbbFKylOpKgdP5hobYFuBInPFw5pjW0RK2wW2L9eWI51AE1TVyE7ozP3+Q1y6Nqr/U+oLWYHaLMj/pHKXVe1QuQ/ywO6iGU2rU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Oein6f6e; arc=fail smtp.client-ip=40.107.42.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxoKF1+n2fGuhu+1DJy8mbPmEz+Knu4meOADeclobPCdJMcwDN5iFelilOS+QZKWd8erHGcqZstKD7aEXRO/PCc0B5rEhAlAe2+930wuA10nZsWh6CqUgdm4f7O59I0do8fbk4Stb5zdnjdht+9Q+qRNnf8cwEqSz4NpMjFrkFyKwOQMDRQ+n6EWZOWO7jx15uFbbpgaw3Cdv71hxt8WXtfVYoDTcUDzXd4+SGBbLtjR2sbpW/xPp3G3IgHzH3IBWN7kQRfeVLBV+GRXXSqxjZa6DH9ee1h2HIsSTwrYGA+KgwZogyIN8VsN01Tf1BIUhiVt1zlyyeza7QDoMxUzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2tZBSgIXWvUzkd+xm2nMlCMakQ+7QZAzXx+HNbJ0AI=;
 b=ZPZ+Yd9qqeCtuwrmVXZzHvRUX7fQTxhThUl4+CL9+RNo5r+eN5EupGisTm/Sm4q+DHdz44lPb8+SQ2QdcC+mcumQ9HKHVwadftbNeFnSJ5OdFzezAhmt7mpO1MHgLqlddZPE7T3/BMYxM4JsMcaYMF1I+6zVLUoADJCkrqIZwtxeMADXlKLDUnnxVWE2OzxxL4s9zXdmxPHaOObjWB7rq+7AaOpiC+TH0Y6+XNNcv7zNBGS3M1Ix1jRagqLCzrvRzBeL/v3CGeAbVcwwkdxJ8/qfggn6wgwOBKsht/f5sbB5lm37b/kLZBmpL70bLrvgMiyWYKHukLJc51+7e1pn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2tZBSgIXWvUzkd+xm2nMlCMakQ+7QZAzXx+HNbJ0AI=;
 b=Oein6f6eMBjpD4tuW49wvQqsDzcZbrmj70CDkpLO3Ch4B2P83fmjkGB8prBpCjyTHb3lSi2F0UlI7/o/aO1E6ox2dzhCKOfLsjGHadyBjChVpsVU95ihLEP0mI8GUsKJZU3lGGKTueTG/jnfSiUjvPJfTy3sSa0YDbUAysWpIi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE1P216MB2114.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.29; Tue, 12 Nov 2024 02:15:27 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 02:15:27 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
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
Subject: [PATCH v0 6/6] media: chips-media: wave5: Fix timeout while testing 10bit hevc fluster
Date: Tue, 12 Nov 2024 11:15:17 +0900
Message-Id: <20241112021517.121-7-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112021517.121-1-jackson.lee@chipsnmedia.com>
References: <20241112021517.121-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0042.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::7) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE1P216MB2114:EE_
X-MS-Office365-Filtering-Correlation-Id: 8325b71c-2a59-461a-6a0d-08dd02bfdfce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?URecvhU6bnd+vBmpvHF0/cCyXQQW1wz5EaL2rGOLQNtef5aczWsJYsmpi3IN?=
 =?us-ascii?Q?WZ7zE4qeudlMw8PWMv40Q5YdOmgY1F4v57Hz40r22F27KmxEnx+JBTaCiXkI?=
 =?us-ascii?Q?58MJs6vyClhTLu5DovTtPyL2GOC2BupqGF1qkUL9K7HM0GzthjFhQknKnObv?=
 =?us-ascii?Q?Iq0/z4f4kUsJbNu8j8MfLtYsyn+zoSaOjtvtWAY7uq1gEcGncz5xuMQatJzC?=
 =?us-ascii?Q?w5gte6g4d9i3reyr2Kvr7i3hu7bQxur3aHasK+8jCOpAHW+BF0YxnLo+pPxs?=
 =?us-ascii?Q?6VIWmUCOCigXCfjaQtfVMm4vh+xDu0jdrV+/rqBueeoscNAJf8wy35+RBMe3?=
 =?us-ascii?Q?JIiDV05rHOeXwfY+41Fs++xmXyZ7clreTSnMFL/J5ZVp47F8LVqAAA5QspI+?=
 =?us-ascii?Q?yvsbON3A61xxGz+fFZHduZNkDUQqD1E2ikce9SkBjLzANO+fCfCWhvTj5hMX?=
 =?us-ascii?Q?Br5j/6qEJmOjnDCu0+0QaVnFAjfAwwvREfS/8sm7YA0MlO1oatctOFGAgRf7?=
 =?us-ascii?Q?O15a5ep17Z9ssYqw5jwkq58GXVzrxIyZ7PIXBdrk4iqGMl8CvMi2dl72PXCv?=
 =?us-ascii?Q?jBG8fcDje4oUjizHS5wv/7BjeTcoHuUueEHGRwJ6wXyXicbW5XFUw7Q40xmS?=
 =?us-ascii?Q?q8XkegOH3OPqwrx0x86njLAYx8855+HvtZqtr5WVcB/ohC+oB04H1GV162fe?=
 =?us-ascii?Q?81L1KvMQ6ZXfs2T/NzJiDTjV136rP+ubs/qzXji6wUa8AkfPXqB0zBUmp1cw?=
 =?us-ascii?Q?0dusYH70H1OOfpgSYKKc8TL/Bjjb1K/7ogRgmUuQ5ue2O0Zam7i6bdgiJVZj?=
 =?us-ascii?Q?KTXgmDT9P1zaW2drQ+76ZO2TyMUIJasB7McmV/3FMluJ4Doc1r9Gq+OtcbBU?=
 =?us-ascii?Q?bKulNr3g43ImknZKc3nTYaT+7EfqwkZ9t/wpd+xenJ5O73RlhhmP+OIC9d6e?=
 =?us-ascii?Q?bBXzs72sqpdVIxz1b7Jn4n1TdPlt/7tr+5SxcCKYxbN2oKxyCEM9T50oubTx?=
 =?us-ascii?Q?uWQZkt+aC2pgqCdOg0ajChOw/VlxjwPnMwhsaDkYW86dpxPvKhUztrgwIWop?=
 =?us-ascii?Q?JNtSNNRdCjc8RKDQRqW3slOSzTRz2l8+6XoJl3dltuSIHk1YPbk8PD5oaWoR?=
 =?us-ascii?Q?ArdCd2wef9aWPcssNNoEG+f8aKXyQjg5bQwdI7w1FHxsu0vg2U2VeSDKoHIV?=
 =?us-ascii?Q?N4QH7YULmBn2SuZvJ+KkNijYvE3VjeQcQt9Ds/z/AQyab2UjlC5ZMjacWNyi?=
 =?us-ascii?Q?MYteNm130iFenYbE2wTTZt4H/UvaUglVwLJbm7uc4mA1ZEfFzVgHS2s2GegX?=
 =?us-ascii?Q?00K0wcza4Klov4P0WTeC9psvNvzDP9Ode0KGZ2CEIfo9Ql9UReYmPgHVgdEl?=
 =?us-ascii?Q?+mcCtms=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xyBoFBtCLm2oVVUQOHXq5jIYryNAwpW5pWjh0eOET11RHP9xkPMKwG43RC3C?=
 =?us-ascii?Q?A8xDjkV4vzJGB6T6ZFlmD6U3anuu+Hy9qfZz1kp3ZjU+dQ2tel+ZXIM6VPKt?=
 =?us-ascii?Q?p5StWi5gxzrC91ekrREZLgbVauIA11C18bNCdsZTVO3w4ST+nhCTWQjBX0fH?=
 =?us-ascii?Q?zrysL81I9ZkW+Lq21+lxxsALwn2j559Fe2Qd0f3xTqLHfD1vVUnLNo47gGZZ?=
 =?us-ascii?Q?Vla54YZyTyePiXp77rtVLN+BSE4jZIsuFN140J9ErpgI9uQCe/GSMyMLHmg6?=
 =?us-ascii?Q?4Q7quP3d8vLraaElP7fmP+8jWgu7X5B/ypiLNfY+Tt6gdwijfaQTbykMjF4S?=
 =?us-ascii?Q?d1GiSEY23b6SWBNbKxsXmRLDv0Gi4uNSvMXPI+ieF6IbKvocbB2mI7++fSRQ?=
 =?us-ascii?Q?wM2uTJ345PW81gsuiubV7ygwkl1jRaSZSJBiOIEMuueTY9rHsvwMJUVEjWR0?=
 =?us-ascii?Q?rWVMt63dCS2834jkn6VTO+c3yueK0Wclrx/CSrVTYZJSG3L+VmeNqEkkpPOg?=
 =?us-ascii?Q?cqQ/gOa+qy76ICbWUK3nz+HLbyYi+khuo9QdLZqiDRGCItOWHLSRPUAB8USy?=
 =?us-ascii?Q?oJBRdV/fs2Kz8KFa3eXIH6Mtcv89PBlFhEy94RDNKtd02R5nk8Ag4QxEAiK5?=
 =?us-ascii?Q?XD282T/8tERAFBkrHGz4sJvHMDlI1+dmz8mIFK9ISET/9zMgO1En8p9UAWKy?=
 =?us-ascii?Q?m35L/42bea/zQ5JTMmnNjaCi0XFs5r01ScHK5ypcx/6tOtRHkCQiYjMQnwC3?=
 =?us-ascii?Q?nm4Z32K0IEqT8uocW3391h2hkWvN7000CtSHkSFyQUwutWwAXz/FJjPdTx30?=
 =?us-ascii?Q?6LClK6eQPCC9aB4Sc22G/+z0gGOipNkYWS8VJrQ0h9UGLxqITuKghyVvfyY+?=
 =?us-ascii?Q?LjM4FTnmlQsIE6GksvP9PYfGnjRvzTBpfRqyyXCODcNbqeK/KVX/FGc0h1ZO?=
 =?us-ascii?Q?AlZusOd+5L3FrVfupe0g/McrCpoMS8cqxOAWzStVHTbLWFcUrQXcH6Ul5Yht?=
 =?us-ascii?Q?MqXUJA/iTrQ5Cml9puIe9eNDrY4N7F8Z++TpXlkp9Nti/s2ETu82/9nGhiP/?=
 =?us-ascii?Q?fulF659I5HchkBd3Hfrg6GmfqvM5jNSbfBUkORgvrypYW3sQyC5Vf97K/2rv?=
 =?us-ascii?Q?FhDaR2UVKFtRIIWwH0GeHx22CIIcDMIay/b6DZCR5K3yt6izb94mPIH4jHHR?=
 =?us-ascii?Q?S+RdCt7Ss9KRJ30RK70VjrysPLm7cI+RWHXJEftpwLipUew+gQtpZMqdmxxU?=
 =?us-ascii?Q?btxiS+dXPoahlBTZhCovp2PS3/rIePncL8K75BzYMwgMlhYLFOetvHZ2+v8P?=
 =?us-ascii?Q?YtA5rdg7mLx0AS2fqu4D+DMCt+rjt7icTjaKxDsukp5sw5B1LvWj0c5v/oRM?=
 =?us-ascii?Q?HBxz+3Spn1lh8mvW4tTAQN+Z5Fj9prle7cNRpO5aBn4Oez3Yh21SVBF+Qkzu?=
 =?us-ascii?Q?9fnV8eveyHYsnRUZEboloHC3qmyBbtpCCPLd1Wl2RTAYbyV8oSD5PKn9qbeL?=
 =?us-ascii?Q?osF1S1+FtBJQH8vyxwgfLbeITudSsLRzjMegyXaSzySiEaRO4UFGVx6RvAnc?=
 =?us-ascii?Q?JypKxcYvL9pZdIchaT/rAzNH13WHgEXf4dTioJqJd4d/+unU8axGWdkKUuQC?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8325b71c-2a59-461a-6a0d-08dd02bfdfce
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 02:15:27.4809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kef0nEX75XN1MsBlKetopOcRpY/MCrUpYwgDNgMZjBRfrHxt/sl5ViwZZUuojaaGyFAjs/XbtQ7Dkrl/yq+g0hfCMWl7i+/FpAG3z8v03Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2114

521C Wave5 variant does not support 10 bit. When 10 bit support for 515
variant was added, the code which returns an error was removed. While
testing 10bit hevc fluster on the 521C hw, timeout happened.

Fixes: 143e7ab4d9a0 ("media: chips-media: wave5: support decoding HEVC Main10 profile")

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-vpu-dec.c      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 51209700b7e8..09b54374db61 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1406,10 +1406,23 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 		if (ret)
 			goto free_bitstream_vbuf;
 	} else if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		struct dec_initial_info *initial_info =
+			&inst->codec_info->dec_info.initial_info;
+
 		if (inst->state == VPU_INST_STATE_STOP)
 			ret = switch_state(inst, VPU_INST_STATE_INIT_SEQ);
 		if (ret)
 			goto return_buffers;
+
+		if (inst->state == VPU_INST_STATE_INIT_SEQ &&
+		    inst->dev->product_code == WAVE521C_CODE) {
+			if (initial_info->luma_bitdepth != 8) {
+				dev_info(inst->dev->dev, "%s: no support for %d bit depth",
+					 __func__, initial_info->luma_bitdepth);
+				ret = -EINVAL;
+				goto return_buffers;
+			}
+		}
 	}
 	pm_runtime_mark_last_busy(inst->dev->dev);
 	pm_runtime_put_autosuspend(inst->dev->dev);
-- 
2.43.0


