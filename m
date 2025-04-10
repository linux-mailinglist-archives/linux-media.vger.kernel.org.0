Return-Path: <linux-media+bounces-29823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E49DA8356E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BF193BDEB6
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 01:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777EE19007D;
	Thu, 10 Apr 2025 01:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="TMbHFNJM"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021134.outbound.protection.outlook.com [40.107.42.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69EE13B58D;
	Thu, 10 Apr 2025 01:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744247319; cv=fail; b=JPw20OogWCCYmcYMdi0EmWFLFgINsiD55sF/Sxjx8U40w5l3eA0jGJNpE3MC07O2F1gasKnHDLI7qtWEXl5xX1LnJNF97OHw/AssUkmBCORsS+TneBmg2o9qRYSf5G5JHWeT+rSNjJdsNhS7t6rWg/lAV0M2YWksUz+Qkj6gnCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744247319; c=relaxed/simple;
	bh=YDtb6hA3MkXwhkAWMKx8x2lVe+YNO3jEo3ipHfMtjmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gW68TLCP9jI63fCIXd9ko16TeaohGlLgiYYTsbVKeWNwPXk2fQdaj29UmKdnivcJQkg7H4GY/ehjiJj3CdWs5jLtNZuoBIeoS/wIfghYh57Un1LMSlIfu0p1ur+n2RpRYjSUDZNdOooGJudi18JuymJ13uGTzqPwIcJDBweiBIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=TMbHFNJM; arc=fail smtp.client-ip=40.107.42.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kj73qlIbJSQ3WySnnnr347qEdDsk+YfPMSMRK7a6LiOZk/Xo0umVBLw1dilQHmi0KAxozY+RdpLXbR/ZOcS63+SzXJtIKBK8S/UNKdD6DL9HraD7YBlP7sEdXgHIFofyK2+65kgIC4BgxuNoEpORMTDLasLt43vJozWqgiI7EFneAKWf9pfiAs6fpAtm5LgsY1mbufyzvs7k/KsuVLvJaNPErj2yohhDvGcJXezeKu3VPwXG+dJg2ssXENPDtZ72+TyquRqQiEVS1g5G9O8b3bCPADmCbRqeCIZSpoVgcV9LPKvB2RIeWnjlh0zp+n0PATjJGEHWasahu0i18lMWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVzA4eS89mDZTmuHVNKAWpZdSLSEAjHSO4ywkKF5RC0=;
 b=hdY8aav63hyYy+m4NrP0yf3T2y7cySJGMRG0ahaoBpI9O9R3B3kb+AxQE2etEWcW8wHCmBNLL+iEUccmWPyDbV6YUJtBd5WvRugKNAf+HLnrr5YvV/z0uH0xQQMjNS5Iqf34wD3xih7w4Lq2yat19Xyrc2iL+coXA7cR00z72NiZ68TX7dJrI0vuoJVro4N7+lykgq7tucLEG+/hun1YGbMcTTT70Brqg5hJ9ah30YV+pX7yo+KTDo5hkekXSD/p19qg6pUbeoVWBEgbzd94OBQzEN7h2uRlbJw73NqCxRswizD1iIpjNl1Foc8sIqsCowy1A2TwHnq62rjMGnxLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVzA4eS89mDZTmuHVNKAWpZdSLSEAjHSO4ywkKF5RC0=;
 b=TMbHFNJMsqJJ0LZKkeI4kxDSLWbXVf0L0ICSUv0ifwqAZ3IHsAJ3NDDdAlkIlyV99NDq/IPbisQFIkOSoEoijwT47CQKZjkICyuR4FfumGXHhvYoDcbzWc9qBZMDm3EMFNHQ8FTqaHIHPFz9/fpBS493bBKAypHXRIbfc1c1Dz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SL2P216MB1403.KORP216.PROD.OUTLOOK.COM (2603:1096:101:32::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 01:08:31 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 01:08:31 +0000
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
Subject: [PATCH v1 2/7] media: chips-media: wave5: Improve performance of decoder
Date: Thu, 10 Apr 2025 10:08:16 +0900
Message-Id: <20250410010821.52-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
References: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::6) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SL2P216MB1403:EE_
X-MS-Office365-Filtering-Correlation-Id: edfd94b9-df44-4c81-2e58-08dd77cc35c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r3VNEji/EidI3E+91BGiMKSZhH82AEidp//dCtOGhM1uXGFjOqWAe0YSkiAI?=
 =?us-ascii?Q?5n+YsqrFAE3zEndpskYkeLVOLOjJMAJY6dmv0e8sGJ+XxwwgQkofrNTng1NH?=
 =?us-ascii?Q?ymR/zgD6QMVUSbkTk+Gyun40QDyDHeY4HcBsM625QjTU6ybExU/zkQ6xI5hM?=
 =?us-ascii?Q?+SZ/YG1QDYDJ+o/Ucd13FCXLdnWtudcdknIguZej82Q8CfCh0XZ5Bquu+FoL?=
 =?us-ascii?Q?1rNE5LWCd81OgCVwgd8dwWtnujPVKGIEV7UCjUYBa3i2uibddEhBldQ9QbVI?=
 =?us-ascii?Q?EuGTmAFztNF/5E4T+ACfmUYbKbUVSlb0PEoPLQnPXX6OfQwB2hFFR7xRwbQs?=
 =?us-ascii?Q?OSvOXeivRZnLmah+ok09V7d7p4bpNuLjCI+2m4EuCmuiu7mP+XMWlmM2MUWJ?=
 =?us-ascii?Q?F6LQ2qe/v/lvKbj7YHbKheMhXWzqLdN++GN4fRVBpi4v0rOfV9Kq/hMU3Pyp?=
 =?us-ascii?Q?rMhi+YWLrZ8Kixu5FAOqAh5mx0NLb5De4GxQgx2QeBqlFkuRmR0qaVvNpScx?=
 =?us-ascii?Q?Lu+m3RFe72XvL6lLAiC5cLUmclQZD527GXJu5sACFFXSUxgOZdEb6+2L/UFt?=
 =?us-ascii?Q?FRmKBlljNv9YZ/S4ufwpHuwOzJWS+xiUqh7dLz9OjW1ERvBUCKizUuel5jj9?=
 =?us-ascii?Q?OOBzNDggPvwMcVrZpNmQUS+FNoU6HfHdWvJdTIdDFGyoE8+ZkVlLbQNnFJ3b?=
 =?us-ascii?Q?G6/jiPy6x0tPODMqUpJFgsuPsncB8Eg/0IixYEymXg6G+erosI4O2PgrMuFb?=
 =?us-ascii?Q?B2QMuPBUX1za0Y7/4RglzmZYSK6/wJ+U8U66TmuAoWQiogYz0lmpyBM7/0vC?=
 =?us-ascii?Q?+fEDXg8ZCa0GY0a8045y7G/YDbzsKny/0wflBtWsUkj+XRcftUjXssnBN7Lz?=
 =?us-ascii?Q?t0JGpaUnx0ZvlpMvhBriz9XZLnJIc9Y/yrOB8oRxpK+Igs2/ijDzJDC0vJB+?=
 =?us-ascii?Q?Ng/uw8c1ijKEjqo6Xjo1AB7pgTLN4HtNFjFvOENHaHLJk0FHJfU2INGRXPhr?=
 =?us-ascii?Q?cXKo1UstENo73FuXX70GLKR+Hmy7QxPI1iV9cXorjUyjyKoCsCIG7/mqgbWM?=
 =?us-ascii?Q?u7Kh9kIWtdUh+rxWq4d+CPkIQOrLP6125aFVFkYFVcHDuBb87+z8vGurDQxw?=
 =?us-ascii?Q?g9cIhQf1rmPZMEPGYoKbvmz2P9CvVD3KQhwWKR8bt2K7ziMbxdNqxxLQEecl?=
 =?us-ascii?Q?3cJ5vvQYxFoYWLnnNX8WX5OwBffoi3C/qipq+cJMPEDKNO7Ed/SZSHkZKCDR?=
 =?us-ascii?Q?wz7KLlwhdBTt8qVl0aJFbYMqJBXJo1i8SaUtQiZufyL4RmUc4L8gmyKVjOQv?=
 =?us-ascii?Q?+SkOsAT5CKyMimQb6dJmuO2S5ax0qvyVzahlxavIS42tLoh+3Bt+2nFhG7co?=
 =?us-ascii?Q?necbnuPlfPDxjmpEH6Sh1Z2YxJ4MfOWcOpQIq+7K3wq8eEDCVkHBBtW9kkuP?=
 =?us-ascii?Q?uRgvthoKA70LvaRl6DEmY+JODUbwZtlGV8exjqHIIgh3a6rmPDlMXw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gXMtorRcMCJs+adLpmidgpPwBaWFC9h9LDjOrhwT9o9BKOZYTbrAC5ffxxWS?=
 =?us-ascii?Q?8bv+sT9y7+BTx3N1jnUlg9TdiL0wPJ5bm2glwo8HdP52M0ou7hQ2437HHxyE?=
 =?us-ascii?Q?HO16t8rJnX45c6huSxkxtKu26iObsHm7AOafdiILm2QMC97UTzmSZMP2VIFU?=
 =?us-ascii?Q?euuPm88/tiKOtuIUIUW2CbBs/MQma5Z+tu7kGnDMqrZzgZxAJ8Z+kOSex5GJ?=
 =?us-ascii?Q?fWl1NyPHNnAExZkYdJMYd1r3oNVg0pQs4VL2TtM8Vq0cOFAgr955Ym8JOFNp?=
 =?us-ascii?Q?R7aJAQG4LJqLNVtX8RRKBCcUpklvUdE0/7jmjSTnaexVX0ceJZNUgO++xUNy?=
 =?us-ascii?Q?0hFLLK+VN16Xw2+WphSI/pvLV6l+g5hMWWF3GNmom/XoFgbK6NYF2i+KlTXz?=
 =?us-ascii?Q?/OtUS9J1JqZ49e078UJ6p3Vbv3T4XsetUWVz8p2BdKsWOsWy70dpfz/bhRAy?=
 =?us-ascii?Q?xsWcJH+Ke8/0E4fcwgLAtQi2PaZFdvv5xo2RGVatN0uzB8cK9JS8k7Q5qzHT?=
 =?us-ascii?Q?XgVTJUrk7cx0O2jv2If813wspFiWnxLvAWlcaSfSL8rFv40QUxjZX5Z5nFhN?=
 =?us-ascii?Q?xgDdNZCFbBDJkFJimYGqhhZr+rdAc0T/AwBtid1hfLKFBRcypsWco+0Cva2r?=
 =?us-ascii?Q?TKnsCmIW3zlu+zzgmBNddz2mUxpgA/kNxjZhqSM0cnKz67m5eXSRo4G4rDwB?=
 =?us-ascii?Q?lJ0n6fUx8/JJoThBIYrKFNyF3UcIp/4B4YiKzzIgx+yr386xRnGHmkDUCahm?=
 =?us-ascii?Q?AFu3RfpaLoGvoqDG7aJosORJr7SnvdlnWCy5E0FzLqdGXCm46jQ4s55neupY?=
 =?us-ascii?Q?Ne3HJ7ZwIUrzdmDnxURkmDDiR1/nGFlxFqyQ3bnm0bpLz4Q9M0J2oFEnE6Ab?=
 =?us-ascii?Q?KGzaqFhSy8IRMKkF/MbGnpfGhafV0MK733qzL+WnD+p73BHTb6zRuvmz6BtK?=
 =?us-ascii?Q?uC6IZxzxiP5dMwCweZOAhRKnfGVl9mZjlpcEJIw2aFZUnv9wZmKiRapXK/wI?=
 =?us-ascii?Q?XC32IOL12e4GdO05++5Fuo2kD6a6OlwFp45Is2blk1OUUbIYk4/9EWyf6v5j?=
 =?us-ascii?Q?flUAQiZs/fyyoPh8RYb7rFtH7mTFdTK6Uh3/J2cdM4kMuuCZ2Q8EbYrhplqV?=
 =?us-ascii?Q?uI2n8x+/Hi8C8BCJD+diQBJWbIP6uFLejipsmjIAo6nsX/wmEqHGSmPt6kXI?=
 =?us-ascii?Q?plfHHA7bsIIN0Gn3lOHsXmEKblddOucUJg3gFm9ytGtc9uZs3q8FMXVpMSc0?=
 =?us-ascii?Q?EwPrm3huOFPpIrzYH0FgldO7tI4ZmNGcwDmDi9nddywLFrabQzGZPEVq+vxS?=
 =?us-ascii?Q?tJvlrppkGfDPudHDyRWcZJQCMMJQsnEBQ9SQML1GMYHw2nfGMlxYzFUauowO?=
 =?us-ascii?Q?BypUr4lt9UBiKdihDMLe8rTlTBRIRUYPW1iteXS2skkmfVZ2ie/lncecb8Gy?=
 =?us-ascii?Q?BTulj0tOj+isFKGnNf0l0bolafR51frzAOVbEqQPmBF2EKwbH0jvjR0/DS/I?=
 =?us-ascii?Q?/1WHK3J4jrGr2IWz29OlIeq0Kqs992G9kAihJbO+bmi6U6Fh/r4PfntP/dAJ?=
 =?us-ascii?Q?u3wLLWO4DvLALJGz2o40pu4mpcTxpQLCvJXMlbbtN4Dpyr209hi7x15pk2bw?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edfd94b9-df44-4c81-2e58-08dd77cc35c2
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 01:08:31.7133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TokDn1sKlNiA+aH0ccmOE+36QX8BH52/dlzJg9gxWtmBwShwgccOnMbtW1OrAHgiACQZXwu/Q3YeODN96F4sspX6pOE3jPdLmb31xWG2WLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1403

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


