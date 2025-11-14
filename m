Return-Path: <linux-media+bounces-47034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E96DC5AE64
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 02:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CA214E737C
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 01:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA41426E6F5;
	Fri, 14 Nov 2025 01:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="bn9psB3w"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021081.outbound.protection.outlook.com [40.107.42.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2F3264630;
	Fri, 14 Nov 2025 01:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763083317; cv=fail; b=iOWZa5GI7IhN0geaJcX1gsYMDsLS5yTKn8tYpVT5JzraMFinbbFWTOV6lJ27T8FSn8Vr9r9a3mK1rgxv39vFy1ZUllN5RBc3MI1WexzKuY1e+ZOnThYWNfYAgg/PXIDP/hpCJ1lEFJYmFe3LY1Y5nHpQ3nxU4Qf8dwVnbR0cN3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763083317; c=relaxed/simple;
	bh=SADRqdnqEGeiIQvrUV+mAiTuAgQQDzkkjNgCrX/iK40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mFje0SCOMxtrH+YnMG7VRowryNbe0X9h7cBa7eVokpvXTRZmClqIfg0YjoCzvYH2WDHS8AWf6ObupL5Tj5CktaGwYyIaojlejJuRrdS7VdSTYYlpeaD8n/y8qqogIOExAZnHzRAvbKG0abdR8JZ3XQvojzRXQAo0YkRUhDu6SJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=bn9psB3w; arc=fail smtp.client-ip=40.107.42.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2b1hrysYvjt6axgGjwWJ3EEOT332/tm/LJgu41sPU1EdtaGjuQ9Jb1xiySahjwbM0V310UK9SYvezldr6vW+efCY89S6JGbUIsmGoT1eEvd6xD+wnmaQIZm8+8QZZ2GstD2mXF/HM77bWJnQurQNeaflB6e6nIl15t2JVp//+DdlO/i5Tu0AGR3dLRoyh42vD6x9Cf8bZjUvVblw2rmprvn2Q+5NfO1Wr5Pz43PiI7hkT8ZDWAMK9A2BkoWN/35gFQRR6ivw0ZOxbXczaVZzQquyp7NvJRAl046kmEQj3aj6BFlY1NLmEBnRgevT1H/yFmHCjq7ADSZu5OTKv4QHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CbUy43B68FgH8yik5YbKNSRNP2Hc9k0bmmmfxYIIf8=;
 b=PEpfiUDhTccvNN9nQpud+vSBKV2wcejwViVUnEaJvm15B00OdppkxmqN43Tb9oxQhBUSP+uLLAjzZ/Iz7u3pNYRqLvReZl6o8FQzXUHAcyhqHnGAE2zDjsNhqgIDBMK5uiE5ivomas8GKKydElImiRIvtR7jkjQvFzsWtT8l7MwmHsRiNVKWv1hafuVfIvTKapcBGuFOGnNOaGaCWNCarER43wH40tsaFZJMuXB5BDjIL/UnyCVUu6Jdxn+zQ7OW7D2R6JwDBWcGaBCKp/AvnSP0gtR8aOZfaEzg0sieIRgxKExWpkPQDJ7V7KN9dH/oi0Z0iQvpN8hQ3D5+z+c3Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CbUy43B68FgH8yik5YbKNSRNP2Hc9k0bmmmfxYIIf8=;
 b=bn9psB3wS+Z5So7pPir8R7sX53tHhiSUmCALcaWkjwe3/fM7qnXM0JZAieYTHdSzeBfNNxZiwX6ePr/IykuVZK3wMaMuPfJos8pbJ4Shd+17/RvERnGI8XiOc9ikKa9VpN2fcV3VJ9ufbtiCGtkosj443ztcL3Gz63ESz3GCqVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE2P216MB2850.KORP216.PROD.OUTLOOK.COM (2603:1096:101:290::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Fri, 14 Nov 2025 01:21:48 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:21:48 +0000
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
Subject: [PATCH v6 4/4] media: chips-media: wave5: Improve performance of decoder
Date: Fri, 14 Nov 2025 10:21:30 +0900
Message-Id: <20251114012130.59-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114012130.59-1-jackson.lee@chipsnmedia.com>
References: <20251114012130.59-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0031.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::10) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE2P216MB2850:EE_
X-MS-Office365-Filtering-Correlation-Id: 07569821-35ca-4c63-61c1-08de231c2e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iH1Qt1m0uTGDjctjHwKlnZnZak+RlYTSOcVjvLAPH3ZY2dTph1usfVSfVGAc?=
 =?us-ascii?Q?ntHJJYtIN1zg7E7dio96RDk+pPJfktBE1PmavAi4ay7UTuyX2zqrMVJkFPS0?=
 =?us-ascii?Q?pdpJBzd0KaNpVJmxJ/6JtAJ3zNvpPz/3jOJ6I9PE5RVvpe/RDvSTscAhmknz?=
 =?us-ascii?Q?S17A9AKxlmxJ7kNv8mhkjYFVRgAEruCiOs5/DJ7gbi/gM9rgcDBWRAPtUM0O?=
 =?us-ascii?Q?uDbIL9GPBsRVALGxQnLt3BVR8OxF353cH8TOMW/0PDq5Qu2R3kKKJdUU88IY?=
 =?us-ascii?Q?c2tAX2XGZTTUgPtigu0u+CzTfIUDo8iWPjRVoSaisPF5vWfQJbTyd/09R8Bp?=
 =?us-ascii?Q?m5xgxHgQitxK+cUli5Fpy31qfasq/2nC9Fgri9vurtqKlgHLZNFr36QJutBL?=
 =?us-ascii?Q?g9zMPRAgWyerQgQzHVBL1pJKsuj0qTl2awAsD1GxZMnIwVoMvHq7poJVYbnD?=
 =?us-ascii?Q?n84EQ0BLE5KnFQrU7o1Jmj3v0A3C6j/bXUIuvpcm37KrGRM5ME2kTi/MCosT?=
 =?us-ascii?Q?LHoomnjV4Y3nYB0HWzPmmi+LXt/Gv+djadfaZbZWPie9PGxeQP6LZiZU1UKL?=
 =?us-ascii?Q?8jaJ2NH1urRs9nPDU/fsXAw920SLS/3klSnjQtO2AJPmjO5rZ3tikY18dbpM?=
 =?us-ascii?Q?ZZmqmePSTLI+91OrqUOk295fXJajkLdzn/JlneM6e3qwX0uXP6N2QJr47VLS?=
 =?us-ascii?Q?oXjb8qLRrUtu9pFyprS/TTSxHO/5QPSCgiRiTdsb7B2EUrADpFQPItS+cDol?=
 =?us-ascii?Q?69PrFwKEKHGxEOIzk+A/gs/vbGkgye1M9QODBFincJ4NZf0rUN+ZdCzmWjvR?=
 =?us-ascii?Q?9bum1OTtah0cEv/Veft4cFM9A7jPHzNkbXOpunwpu3/P9v6FKyvjrK5ZNkrw?=
 =?us-ascii?Q?biNe45Ff/MW/jP8gUtS28xFuAnBazSaLAaRfqrFS5PMvsjea7967BA0KdeuI?=
 =?us-ascii?Q?Y9UudCgOwVhkDCoY+TxsUgmC1t8z2VIXSViiCRYUMVNhO9clxGwTi8d2BUy4?=
 =?us-ascii?Q?s/p/4vAcOcZJuLC5UMzTtExtBMu+8uhKHhaqoiLrPPNIZiv+EAuE91DNCjbj?=
 =?us-ascii?Q?xgQjMcxvwX4mBxFyCnqq2EPOYpGHOkClfIOWtr91tkMsJYuwHEsOMA3Gs50O?=
 =?us-ascii?Q?zaoDrLGD6tVFBD4qzEzesyAxDUQOPqs7JMumMJsqjiTSS3WOtlb7i5QmhRXu?=
 =?us-ascii?Q?PcaKMv7zngyuH+RvRid02ZpOSor5WiXVPxb4252RDXl+30yxCZYK5ueuTUYv?=
 =?us-ascii?Q?irFqxOnBSvFqn/DvX5ta2Qz3CNeTxgoyY2qb2zDlm519Fg+w+U1IHg0tIbvG?=
 =?us-ascii?Q?oQcA0/cf4yd0sLMt4yWA7/4yXWjTymwY2wloJEMynHqwbkXvyRx8nKBK33Oq?=
 =?us-ascii?Q?6hePVvMCi2R4Z11M622mhN+O0m+6+9okd+BN+Ko/UwhCSAyqVwHFeovTdtC3?=
 =?us-ascii?Q?IF6jqCN9WiA4yRb9X2QR9Dh0Bj5geoqVx9mvGTXQHlw+1ZLhduls857zt5zl?=
 =?us-ascii?Q?GxWMBEwqfFMjOvLf3pq6lf9BVtq2K8+vOt59?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G6d+RCfZwYDh8K2quQR6PZQ92l3XfWyuBNE01Vt2ijprLe3a34gZf6qvj5VN?=
 =?us-ascii?Q?lnnPS93tGVwko3tjmxFKxkpXaszs4xPEyRwqb3MvzlsBjROJCYzrVorYGPro?=
 =?us-ascii?Q?J9C5ovdJqasuB1JGy9lvJ8GfO0pSHGBm9vvxsTC0r59Qs1Xu5ZT5tkg7C22M?=
 =?us-ascii?Q?q/O59zCYd//x/jAXsm1sGWp6+d7695Z0byxaifx31FRbS0VYfmYnTq+ASEfy?=
 =?us-ascii?Q?d3yCPIm2X/xUa/YJSLyVmbZ5qh9WFJvzHFW010vEHMFmDru/3AjU7ExZLBYY?=
 =?us-ascii?Q?OXcKtbiMej0/PKmgb5Q/vXxlFzJR5DwKkVstH1KiILYDwrr1tFAgjQdeXKOx?=
 =?us-ascii?Q?Tg4XQFgsbCiSfYxwiYq1QVxEPvBD7x4zjbG+O6ibp7qfuFKf9h3LPmNOTyoQ?=
 =?us-ascii?Q?lrHJ0VmWyOnX5Un9rrFPz6Yz+BKFknE9nktBrC6V2yBvTYn4oDlfJgYo9Skh?=
 =?us-ascii?Q?xrgWAF/KiVYSwmA4unGyqfwCONNbStj3gaEwIBOux6vcilXKUa55FCCnohRX?=
 =?us-ascii?Q?FfSnA7lUPqVgsULZP9PMo6skrvrpqIDzaJgy9VqXvJ7YfyvKwlXZAlLQP94Y?=
 =?us-ascii?Q?ScqqPQYHNPEi5pXOX/fQQVGpH48JQC2XLQrmYyikeqWYR3zXHSfx8AqeE5jp?=
 =?us-ascii?Q?mtcsUIv3UHsOyGC/rsP0MzFQT3VDqkrqjW1ezY5WiWjRXqnl46LswGY9GSzu?=
 =?us-ascii?Q?VUxMuSIl6oOeq0TOEN0Z2L1jwhkI6FsmWLmuVnrsUE0eL6XLmyvGzNVBRv74?=
 =?us-ascii?Q?U6vxFOH11iYBPczvSC6Qz69/5Pd0CZWkntdN0kacSUYcBN9hXALvpmqZqoA+?=
 =?us-ascii?Q?CuSuDRo/T38yuwDnz6IFcb9qn+qOfzKHt4qVWQ0p3jTjuQrO8kGRPB7Z9trq?=
 =?us-ascii?Q?uQ/s2ZTWHZLAUCcNi0sI6aezIEVgMzqhNEXGMXOqIothlfUeEdooVD01njuc?=
 =?us-ascii?Q?0YHLUPaBo8LuUOBTViC2oDTFK246LdSCvTiI6gUAYtfzJj3OUxgPnKQFz2XY?=
 =?us-ascii?Q?J2vKXmmnrGawTnJYB4l9N90jEyl87XuDgs4Q39cnG+0pY7WOX1i+u6Q3rKOX?=
 =?us-ascii?Q?XMF2DjYOcNZuTYD7bDSlmSkDKlEpHb74nu7iC7Az813xP19/s4M+ALX4FY/q?=
 =?us-ascii?Q?NbJcg/y9C1Na4pSYikFuAw4vc/GOmGNxEKf3T71okEG+hcDjitpIk/RyLNXS?=
 =?us-ascii?Q?iYUA7kZwtyYHjVMMhMZJ3AggDsTLatr8bIiaAYScwVartAxghTAoxY7Riphh?=
 =?us-ascii?Q?qTr2o3KmhZCvf3a9zEaDgO/o84agfAb96jlCjMzfIoqTFmpJU84iQ/wueQvx?=
 =?us-ascii?Q?i9JsKc9TCEAVG6MGltTKksx1g3YRZx7MkI0cfpwVR+WDtMod/k9rI4xA/3xD?=
 =?us-ascii?Q?NekeqQk8UFJsNIOCXvoz19lf8jadxiDY/C1PtIQug56etM9b2Xce9dsMbA6K?=
 =?us-ascii?Q?lIVkh5UIlHK59Fe6CGq1hmIEB3PLcV/GIhXVHt5kU5FdOyELV0+e8VNN7Qxc?=
 =?us-ascii?Q?vIKosq74vst8X0m8viqVdx9nf/YVdAbdh9X1VrkUfrHgdhE/EOc/dC94y8Or?=
 =?us-ascii?Q?1n9mUmUVh7OqwXIwDGgIvKlv/e1Jlf8kLLevRy+XPZgaidGRgXL3pNczMGM1?=
 =?us-ascii?Q?CA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07569821-35ca-4c63-61c1-08de231c2e74
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:21:48.0684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NhSsX5hHXjUFPARA8abL4f/B30cPT1PriJ6K8ivvZ5JarIBdyAKP7mpBGTsGpAuiV+qiHtBIgp5QVeOjfrkgQa65J/Sbi5Muoqfhp7csq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2850

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
 .../chips-media/wave5/wave5-vpu-dec.c         | 165 +++++++++++++-----
 .../platform/chips-media/wave5/wave5-vpu.h    |   2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  53 ++++--
 .../platform/chips-media/wave5/wave5-vpuapi.h |   7 +
 .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
 6 files changed, 173 insertions(+), 57 deletions(-)

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
index b10396fa2379..04d3ffd123ad 100644
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
@@ -442,18 +442,17 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
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
+
+	inst->queuing_fail = false;
 }
 
 static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
@@ -1142,11 +1141,31 @@ static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t b
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
@@ -1157,9 +1176,8 @@ static int fill_ringbuffer(struct vpu_instance *inst)
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
@@ -1219,9 +1237,12 @@ static int fill_ringbuffer(struct vpu_instance *inst)
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
@@ -1233,7 +1254,8 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 
 	vpu_buf->consumed = false;
 	vbuf->sequence = inst->queued_src_buf_num++;
-
+	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
+	inst->queued_count++;
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 }
 
@@ -1288,10 +1310,16 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
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
@@ -1385,6 +1413,17 @@ static int streamoff_output(struct vb2_queue *q)
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
@@ -1470,6 +1509,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 {
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+
 	bool check_cmd = TRUE;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
@@ -1480,11 +1520,10 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 		struct dec_output_info dec_output_info;
 
 		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
-
-		if (q_status.report_queue_count == 0)
-			break;
-
-		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
+		if ((inst->state == VPU_INST_STATE_STOP ||
+		     inst->state == VPU_INST_STATE_INIT_SEQ ||
+		     q_status.instance_queue_count == 0) &&
+			q_status.report_queue_count == 0)
 			break;
 
 		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
@@ -1498,6 +1537,8 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 	else
 		streamoff_capture(q);
 
+	inst->empty_queue = false;
+	inst->sent_eos = false;
 	pm_runtime_put_autosuspend(inst->dev->dev);
 }
 
@@ -1576,13 +1617,24 @@ static void wave5_vpu_dec_device_run(void *priv)
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
@@ -1607,7 +1659,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 			}
 			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		} else {
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_INIT_SEQ);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		}
 
 		break;
@@ -1618,8 +1672,9 @@ static void wave5_vpu_dec_device_run(void *priv)
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
@@ -1633,12 +1688,14 @@ static void wave5_vpu_dec_device_run(void *priv)
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
 
@@ -1649,25 +1706,42 @@ static void wave5_vpu_dec_device_run(void *priv)
 			dev_err(inst->dev->dev,
 				"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
 				m2m_ctx, ret, fail_res);
-			break;
+			goto finish_job_and_return;
+		}
+
+		if (fail_res == WAVE5_SYSERR_QUEUEING_FAIL) {
+			inst->retry = true;
+			inst->queuing_fail = true;
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
@@ -1678,6 +1752,8 @@ static void wave5_vpu_dec_job_abort(void *priv)
 	if (ret)
 		dev_warn(inst->dev->dev,
 			 "Setting EOS for the bitstream, fail: %d\n", ret);
+
+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
 static int wave5_vpu_dec_job_ready(void *priv)
@@ -1713,10 +1789,15 @@ static int wave5_vpu_dec_job_ready(void *priv)
 				"No capture buffer ready to decode!\n");
 			break;
 		} else if (!wave5_is_draining_or_eos(inst) &&
-			   !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
+			   (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
+			    inst->empty_queue)) {
 			dev_dbg(inst->dev->dev,
 				"No bitstream data to decode!\n");
 			break;
+		} else if (inst->state == VPU_INST_STATE_PIC_RUN &&
+			   !wave5_is_draining_or_eos(inst) &&
+			   inst->queuing_fail) {
+			break;
 		}
 		ret = 1;
 		break;
@@ -1753,6 +1834,8 @@ static int wave5_vpu_open_dec(struct file *filp)
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
index 5b10f9f49b9f..d26ffc942219 100644
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
@@ -80,11 +81,16 @@ int wave5_vpu_flush_instance(struct vpu_instance *inst)
 
 			mutex_unlock(&inst->dev->hw_lock);
 			wave5_vpu_dec_get_output_info(inst, &dec_info);
-			ret = mutex_lock_interruptible(&inst->dev->hw_lock);
-			if (ret)
-				return ret;
-			if (dec_info.index_frame_display > 0)
+			mutex_ret = mutex_lock_interruptible(&inst->dev->hw_lock);
+			if (mutex_ret)
+				return mutex_ret;
+			if (dec_info.index_frame_display >= 0) {
+				mutex_unlock(&inst->dev->hw_lock);
 				wave5_vpu_dec_set_disp_flag(inst, dec_info.index_frame_display);
+				mutex_ret = mutex_lock_interruptible(&inst->dev->hw_lock);
+				if (mutex_ret)
+					return mutex_ret;
+			}
 		}
 	} while (ret != 0);
 	mutex_unlock(&inst->dev->hw_lock);
@@ -207,6 +213,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
+	struct dec_output_info dec_info;
+	int ret_mutex;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -214,10 +222,10 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
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
@@ -227,11 +235,26 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
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
@@ -248,6 +271,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
 
+	mutex_destroy(&inst->feed_lock);
+
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
@@ -460,11 +485,11 @@ int wave5_vpu_dec_set_rd_ptr(struct vpu_instance *inst, dma_addr_t addr, int upd
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
index bc101397204d..67da81611e1b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -818,6 +818,13 @@ struct vpu_instance {
 	bool cbcr_interleave;
 	bool nv21;
 	bool eos;
+	bool sent_eos; /* check if EOS is sent to application */
+	bool retry; /* retry to feed bitstream if failure reason is WAVE5_SYSERR_QUEUEING_FAIL*/
+	int queuing_num; /* count of bitstream queued */
+	int queued_count; /* the number of bitstream buffers queued from the buf_queue */
+	struct mutex feed_lock; /* lock for feeding bitstream buffers */
+	bool queuing_fail; /* if there is the queuing failure */
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


