Return-Path: <linux-media+bounces-14731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6207092B24F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17CB72835B4
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 08:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F29155300;
	Tue,  9 Jul 2024 08:40:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E9A154C02;
	Tue,  9 Jul 2024 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514403; cv=fail; b=aDiyjGDt+mKHGsdXaVw2hBlnpaQFc0xziVDgJuM9Vde7T+ibgpTulX6zHNANawHGsr4e6uaUdQlb+J4uPk7zcGvd/KDAyasdF3g/3fa7/q6lobq2o7FAEuF0y69F1V4YbOhnaA+jMezu/yCaMeakSHqZxwOjuhHsgndwVetqlgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514403; c=relaxed/simple;
	bh=sayo4V87xszCiBFe1VAH/qoEodDVGFjtvlKqNeihdsE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eIXErxWXzppsgGLkh/g/8Jw4e0KeKMhDX/o79I3eWBGgrBc8U/X4bSRP5m1YNfjvY9gNrp8T7jzV+WPD153K1DUUJne7J+fUsqIL+Lg9AL1ws/QmjQO0CICWyYlcRch+RrXWz8XMbUGHtKzQX1wQUbXR7dSrK78VSjQd5ksLzUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ou+ulvRjz6S8fjwoEZBlWHBh9okwnLKKLPtijQo/z55v5Iedr6U61Swwy8phwnuuiMriMh26BbeMqjQtpJ8bKcrfcLK9qkQARXCkxP/Mzfzl8Bb0YPZ79xIX/O53yi+R04dslcb0N+L7d6pIE9UeOPQZboj7nBSPldGmjUrwhXYyG9HTb886utThzgZRuVs9kQR7EzgZwqWfZQpa8xGoVL0BehX2elVki6ncR8jw0x0dDqSW+DMPHtscZRhVyUK+OYs5JZIJtIATn3bzSJ+dwkYfRpf9+jhdNoqUmLUF++hrhvVzcGefu8KFKYtjS3AJlF5IJvMpZW6JyghSKNGYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGPoJG6WZTSrICAiJmktHByWoI1K0yWN+ivdhvmttgQ=;
 b=AdZwuafO5OGeSTlPZ2hzXjYpOzZF8kSTRQIx7SvqvmvZe8sg7GUrNCh2osNPgbf9135mUkLUs8RJAGbLRdg+lHHXrZY0rMyBIwdPlZQCzPGhK2x3rk9EycwkUj4ksmn/Hz5ESfsen+YT3L6GmMTenfT772k/GK9SivivmPfxubD+v9anBi0sHXbUQ0rlFPs1RDjSQyvE0/66weufY1uUwovpkjONyz2CCJ3E5mYjc+goXtHVm68+09hAhV+h90MYZxbkgjjXUM5rNFf4cFZ4PreKCsD0MEuedgFw5P6W1FmcBi2z7cJ260zhAQp1kvSzpvZshnoj6nMW4WhiyUjtuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:39 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:39 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 06/14] staging: media: starfive: Separate buffer be a common file
Date: Tue,  9 Jul 2024 01:38:16 -0700
Message-Id: <20240709083824.430473-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1271:EE_
X-MS-Office365-Filtering-Correlation-Id: c87b0b65-25b6-47d9-6ca2-08dc9ff287d9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	LDZyCArPa+aOzBKAxlQP6MW6Av0Q28tjnsE4zQ0Vq8tlZ8Hf4yWhBWCrSN8YaSzAb9H9xfTVzUYWejTXRH4uF02WYCLVSKJup8UeZZUfq7TGnqWsTDqYQYdPZy8nyUAfg4FJNqpSnFuYmUp7e3hR+4AqNgkaTahyvrLi8i3JpDkzqAehQtNPcdD+yEECwfoFlVsCqebJZqHUh/QBllmCUb/QGJqPUDvLXNigS4RcLQmRRLWwqpLos4Eq2LUoPx3dpxbCUAab/qkm3uL7OK2gWFTeEAzBcyIqS0Kx5hV0ORVTG3INI/B8Cg5RHJQH3DfPfjBZ+ghmMzelJSTVdueJroQJ75VchZSfRxPShfLAsvn2sELcP5u82Dx2+OeoF2zY5QXH2D//OeB8FpzmnxiP3satnZ4khdD1uWF3SERfdQ/u946BiEMEdW8hPvv0b4/ud+dj9r8RtGi68eYrOk/Tm0ll6j56UJcxdIQr49A38ZZnxN5MGggjuyYLEl2iojunWFgFXLrCtr+lqTsa9dAwojinCXrZKAS3yf4irDEgyue7qpy4zOzdhDsQrHWS6yQVDqIXY2PpBYhP2PPVBi/nW0HOUxfGZf7pSt0+TRmVAWiQPE77mZgT0Ib6PSVL967w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qt+v+16THAsAyg76bXuFiijqyMMXN4lKV53teR8hu/MaqH7Qx0eS/aaNWJLR?=
 =?us-ascii?Q?ilpsJ0SgD9aIiDFI6Z8MPriCSM8T5PT9nQyPkjNRei2p5hZUlVfXM0QEpF7f?=
 =?us-ascii?Q?LkUg5rEEn4tQw9uxkrAeKOa1DsnTnvUrIavn/2uA9AwWUxwtmvvXE72CJyhp?=
 =?us-ascii?Q?NMatSHDSp9EQLmjBofqdwc8qgE8UMtvrSp54bILdrKZkLpPob9CxdL8HYqCy?=
 =?us-ascii?Q?0/RhuOLirpel0HJzcTVWx+V7BqrEBj7T+pk3UVC+l6W6OnSefpU1HIKzd5ma?=
 =?us-ascii?Q?GyFfKNSuk0cshBvTaMtn8Q37gYILcqH8d7H8emPzr/blc4ZrPQLhdHSM1Vr7?=
 =?us-ascii?Q?qWdQUhsQW9LZ0USMbB5vPdCoYBN4LtR1qKqv5+q7YJoM6aeCrk5O22QoWAF5?=
 =?us-ascii?Q?nTIC3j/6WKF4XXGbxuJWoV0dj4522zUXoDVu9R9syAi46fVMPAOUy+ZZJD/J?=
 =?us-ascii?Q?1zb9XvF2n3oSRiHWfnO2/NYvbms8RZyh8byrAPUtA7adbhz+IwiiuGImdvSz?=
 =?us-ascii?Q?GYDXBbCOuvgIc/N3QH/mOs8aaJ783iJFtXPzFvKolnlDA8/ImP4Fl+3zDamG?=
 =?us-ascii?Q?yza15IHCNhOnsd2UpwqrAKrio/eBawmRs+m2Ziq7T+SknuW389rcgGkbICrO?=
 =?us-ascii?Q?0+tx3HBc3Tj+VC/hqghA27hRPxneBwUkjrwjrSjje9TOxc3z8xgxrhpAQyiC?=
 =?us-ascii?Q?Rle3Z4dyhOMFW+2zHBv3/uNJCQbrzRW+kvc578t175UlJ4OTx51qRT7M9MFf?=
 =?us-ascii?Q?5GSmqkyeW+Hsogm3LiJzPkGxV2clliGdPKkxVbIBCJiLKpmcgwH9j+AU51hQ?=
 =?us-ascii?Q?dOatfwX6wOoZ6Ad1mfnOnlim23lY0JpYbumzEFNwsIfJaQNhFGRCp2dt7ZwO?=
 =?us-ascii?Q?UVNLuFXfspo86WcgUH/qDTwJEyTZ8qnvm5nBHF5ydye4raO1v8UnprPlewKg?=
 =?us-ascii?Q?1B1DXwaStGzKofDBpjfhHKmXEoUvTHDCZCTaZ63pwZasQthsnVlztAdxwWOH?=
 =?us-ascii?Q?fFhBZbwOPPPgp3iWvef3WKDdVZxrWUO4IzwWQm+v2x35DUvdlhjgv75bdeLO?=
 =?us-ascii?Q?q/Z7GdLqC5Qo91rNqx13h0ESB3frjRtmrRTF4WQXcr4xaN2bAY7Xptlm3Pc/?=
 =?us-ascii?Q?Um0TRq6QvuS44CKt8XqvACTqL5myYuI+o6qaAQJxIUvffJQxWp3DQjWEdx6Y?=
 =?us-ascii?Q?C6parFT26GmIdaqHwXFcgVrbTdTS6RfgBep1VY4jYbg23ECgLBqf7A44NcTH?=
 =?us-ascii?Q?4FIpMZyb7NcbYQXsCsCIGeAuwnqEzQweetMHU9sWrmawP2m1T+adD+bwlN08?=
 =?us-ascii?Q?Xkk39JpxJWZCdiAQWg0ZyNKUnUm6ngrxAwboDdsDlJHd34egT8W874V/sxa7?=
 =?us-ascii?Q?QnPQGmSlO0rPf/tQsQbdt6AALZKALRg2NrLMlNbWEm9BiModsAbrQVY6GYlm?=
 =?us-ascii?Q?VXV0vH1ScicGXeJbjfwfaIt01NUOhLkY/S9fdSu0K1qEQX2F4TSrx6g4cgks?=
 =?us-ascii?Q?pErsWZgHsn2x4MYsJR88zSDH1DFo6Qb4pI9lpKrnLPbG2dSYKin2Z1812U3O?=
 =?us-ascii?Q?dkXlrK+9mdtQTelbWEf6KtiqpW29hZa4SXjPDoxSKnncz7k3oyct72JlkJJG?=
 =?us-ascii?Q?CIpXncW8kxhPc6400eUCO6g=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87b0b65-25b6-47d9-6ca2-08dc9ff287d9
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:39.1966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCr4y8PQuQIOMPLzVciqo5Yyk7/ypL0hv1gxgLHtmKG86aqsJA9VERVeMIU5HHVWAxHxf6/n1YeIspnDiHeUjnXoC5Lz4F5lhGgnFifrnCtruy/JfDVmITT/izWdOp0p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

Buffer operations is not only applicable to capture device, also
can use for output device. So separating it be a common file.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/staging/media/starfive/camss/Makefile |   1 +
 .../staging/media/starfive/camss/stf-buffer.c | 166 ++++++++++++++++++
 .../staging/media/starfive/camss/stf-buffer.h |  52 ++++++
 .../staging/media/starfive/camss/stf-camss.h  |   1 +
 .../media/starfive/camss/stf-capture.c        | 158 -----------------
 .../media/starfive/camss/stf-capture.h        |  22 ---
 .../staging/media/starfive/camss/stf-video.h  |  10 +-
 7 files changed, 222 insertions(+), 188 deletions(-)
 create mode 100644 drivers/staging/media/starfive/camss/stf-buffer.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-buffer.h

diff --git a/drivers/staging/media/starfive/camss/Makefile b/drivers/staging/media/starfive/camss/Makefile
index 005790202e7b..411b45f3fb52 100644
--- a/drivers/staging/media/starfive/camss/Makefile
+++ b/drivers/staging/media/starfive/camss/Makefile
@@ -4,6 +4,7 @@
 #
 
 starfive-camss-objs += \
+		stf-buffer.o \
 		stf-camss.o \
 		stf-capture.o \
 		stf-isp.o \
diff --git a/drivers/staging/media/starfive/camss/stf-buffer.c b/drivers/staging/media/starfive/camss/stf-buffer.c
new file mode 100644
index 000000000000..7272b5ab9eb5
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf-buffer.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive Camera Subsystem - buffer common
+ *
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#include "stf-camss.h"
+
+void stf_buf_add_pending(struct stf_v_buf *output,
+			 struct stfcamss_buffer *buffer)
+{
+	INIT_LIST_HEAD(&buffer->queue);
+	list_add_tail(&buffer->queue, &output->pending_bufs);
+}
+
+struct stfcamss_buffer *stf_buf_get_pending(struct stf_v_buf *output)
+{
+	struct stfcamss_buffer *buffer = NULL;
+
+	if (!list_empty(&output->pending_bufs)) {
+		buffer = list_first_entry(&output->pending_bufs,
+					  struct stfcamss_buffer,
+					  queue);
+		list_del(&buffer->queue);
+	}
+
+	return buffer;
+}
+
+void stf_buf_add_ready(struct stf_v_buf *output,
+		       struct stfcamss_buffer *buffer)
+{
+	INIT_LIST_HEAD(&buffer->queue);
+	list_add_tail(&buffer->queue, &output->ready_bufs);
+}
+
+struct stfcamss_buffer *stf_buf_get_ready(struct stf_v_buf *output)
+{
+	struct stfcamss_buffer *buffer = NULL;
+
+	if (!list_empty(&output->ready_bufs)) {
+		buffer = list_first_entry(&output->ready_bufs,
+					  struct stfcamss_buffer,
+					  queue);
+		list_del(&buffer->queue);
+	}
+
+	return buffer;
+}
+
+static void stf_buf_update_on_last(struct stf_v_buf *output)
+{
+	switch (output->state) {
+	case STF_OUTPUT_CONTINUOUS:
+		output->state = STF_OUTPUT_SINGLE;
+		output->active_buf = !output->active_buf;
+		break;
+	case STF_OUTPUT_SINGLE:
+		output->state = STF_OUTPUT_STOPPING;
+		break;
+	default:
+		break;
+	}
+}
+
+static void stf_buf_update_on_next(struct stf_v_buf *output)
+{
+	switch (output->state) {
+	case STF_OUTPUT_CONTINUOUS:
+		output->active_buf = !output->active_buf;
+		break;
+	case STF_OUTPUT_SINGLE:
+	default:
+		break;
+	}
+}
+
+void stf_buf_flush(struct stf_v_buf *output, enum vb2_buffer_state state)
+{
+	struct stfcamss_buffer *buf;
+	struct stfcamss_buffer *t;
+
+	list_for_each_entry_safe(buf, t, &output->pending_bufs, queue) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->queue);
+	}
+	list_for_each_entry_safe(buf, t, &output->ready_bufs, queue) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->queue);
+	}
+}
+
+struct stfcamss_buffer *stf_change_buffer(struct stf_v_buf *output)
+{
+	struct stf_capture *cap = container_of(output, struct stf_capture,
+					       buffers);
+	struct stfcamss *stfcamss = cap->video.stfcamss;
+	struct stfcamss_buffer *ready_buf;
+	unsigned long flags;
+	u32 active_index;
+
+	if (output->state == STF_OUTPUT_OFF ||
+	    output->state == STF_OUTPUT_STOPPING ||
+	    output->state == STF_OUTPUT_RESERVED ||
+	    output->state == STF_OUTPUT_IDLE)
+		return NULL;
+
+	spin_lock_irqsave(&output->lock, flags);
+
+	active_index = output->active_buf;
+
+	ready_buf = output->buf[active_index];
+	if (!ready_buf) {
+		dev_dbg(stfcamss->dev, "missing ready buf %d %d.\n",
+			active_index, output->state);
+		active_index = !active_index;
+		ready_buf = output->buf[active_index];
+		if (!ready_buf) {
+			dev_dbg(stfcamss->dev,
+				"missing ready buf2 %d %d.\n",
+				active_index, output->state);
+			goto out_unlock;
+		}
+	}
+
+	/* Get next buffer */
+	output->buf[active_index] = stf_buf_get_pending(output);
+	if (!output->buf[active_index])
+		stf_buf_update_on_last(output);
+	else
+		stf_buf_update_on_next(output);
+
+	if (output->state == STF_OUTPUT_STOPPING)
+		output->last_buffer = ready_buf;
+	else
+		stf_buf_add_ready(output, ready_buf);
+
+out_unlock:
+	spin_unlock_irqrestore(&output->lock, flags);
+
+	return output->buf[active_index];
+}
+
+struct stfcamss_buffer *stf_buf_done(struct stf_v_buf *output)
+{
+	struct stfcamss_buffer *ready_buf;
+	u64 ts = ktime_get_ns();
+	unsigned long flags;
+
+	if (output->state == STF_OUTPUT_OFF ||
+	    output->state == STF_OUTPUT_RESERVED)
+		return NULL;
+
+	spin_lock_irqsave(&output->lock, flags);
+
+	ready_buf = stf_buf_get_ready(output);
+	if (ready_buf) {
+		ready_buf->vb.vb2_buf.timestamp = ts;
+		ready_buf->vb.sequence = output->sequence++;
+	}
+
+	spin_unlock_irqrestore(&output->lock, flags);
+
+	return ready_buf;
+}
diff --git a/drivers/staging/media/starfive/camss/stf-buffer.h b/drivers/staging/media/starfive/camss/stf-buffer.h
new file mode 100644
index 000000000000..9d1670fb05ed
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf-buffer.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * StarFive Camera Subsystem - buffer common
+ *
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#ifndef STF_BUFFER_H
+#define STF_BUFFER_H
+
+#include <linux/list.h>
+#include <media/videobuf2-v4l2.h>
+
+enum stf_v_state {
+	STF_OUTPUT_OFF,
+	STF_OUTPUT_RESERVED,
+	STF_OUTPUT_SINGLE,
+	STF_OUTPUT_CONTINUOUS,
+	STF_OUTPUT_IDLE,
+	STF_OUTPUT_STOPPING
+};
+
+struct stfcamss_buffer {
+	struct vb2_v4l2_buffer vb;
+	dma_addr_t addr[2];
+	struct list_head queue;
+};
+
+struct stf_v_buf {
+	int active_buf;
+	struct stfcamss_buffer *buf[2];
+	struct stfcamss_buffer *last_buffer;
+	struct list_head pending_bufs;
+	struct list_head ready_bufs;
+	enum stf_v_state state;
+	unsigned int sequence;
+	/* protects the above member variables */
+	spinlock_t lock;
+	atomic_t frame_skip;
+};
+
+void stf_buf_add_pending(struct stf_v_buf *output,
+			 struct stfcamss_buffer *buffer);
+struct stfcamss_buffer *stf_buf_get_pending(struct stf_v_buf *output);
+void stf_buf_add_ready(struct stf_v_buf *output,
+		       struct stfcamss_buffer *buffer);
+struct stfcamss_buffer *stf_buf_get_ready(struct stf_v_buf *output);
+void stf_buf_flush(struct stf_v_buf *output, enum vb2_buffer_state state);
+struct stfcamss_buffer *stf_change_buffer(struct stf_v_buf *output);
+struct stfcamss_buffer *stf_buf_done(struct stf_v_buf *output);
+
+#endif /* STF_BUFFER_H */
diff --git a/drivers/staging/media/starfive/camss/stf-camss.h b/drivers/staging/media/starfive/camss/stf-camss.h
index e2b0cfb437bd..ae49c7031ab7 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.h
+++ b/drivers/staging/media/starfive/camss/stf-camss.h
@@ -18,6 +18,7 @@
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
 
+#include "stf-buffer.h"
 #include "stf-isp.h"
 #include "stf-capture.h"
 
diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers/staging/media/starfive/camss/stf-capture.c
index 494e56e731f0..696d79920713 100644
--- a/drivers/staging/media/starfive/camss/stf-capture.c
+++ b/drivers/staging/media/starfive/camss/stf-capture.c
@@ -93,20 +93,6 @@ static void stf_init_addrs(struct stfcamss_video *video)
 		stf_set_yuv_addr(video->stfcamss, addr0, addr1);
 }
 
-static struct stfcamss_buffer *stf_buf_get_pending(struct stf_v_buf *output)
-{
-	struct stfcamss_buffer *buffer = NULL;
-
-	if (!list_empty(&output->pending_bufs)) {
-		buffer = list_first_entry(&output->pending_bufs,
-					  struct stfcamss_buffer,
-					  queue);
-		list_del(&buffer->queue);
-	}
-
-	return buffer;
-}
-
 static void stf_cap_s_cfg(struct stfcamss_video *video)
 {
 	struct stf_capture *cap = to_stf_capture(video);
@@ -263,61 +249,6 @@ static void stf_capture_init(struct stfcamss *stfcamss, struct stf_capture *cap)
 	}
 }
 
-static void stf_buf_add_ready(struct stf_v_buf *output,
-			      struct stfcamss_buffer *buffer)
-{
-	INIT_LIST_HEAD(&buffer->queue);
-	list_add_tail(&buffer->queue, &output->ready_bufs);
-}
-
-static struct stfcamss_buffer *stf_buf_get_ready(struct stf_v_buf *output)
-{
-	struct stfcamss_buffer *buffer = NULL;
-
-	if (!list_empty(&output->ready_bufs)) {
-		buffer = list_first_entry(&output->ready_bufs,
-					  struct stfcamss_buffer,
-					  queue);
-		list_del(&buffer->queue);
-	}
-
-	return buffer;
-}
-
-static void stf_buf_add_pending(struct stf_v_buf *output,
-				struct stfcamss_buffer *buffer)
-{
-	INIT_LIST_HEAD(&buffer->queue);
-	list_add_tail(&buffer->queue, &output->pending_bufs);
-}
-
-static void stf_buf_update_on_last(struct stf_v_buf *output)
-{
-	switch (output->state) {
-	case STF_OUTPUT_CONTINUOUS:
-		output->state = STF_OUTPUT_SINGLE;
-		output->active_buf = !output->active_buf;
-		break;
-	case STF_OUTPUT_SINGLE:
-		output->state = STF_OUTPUT_STOPPING;
-		break;
-	default:
-		break;
-	}
-}
-
-static void stf_buf_update_on_next(struct stf_v_buf *output)
-{
-	switch (output->state) {
-	case STF_OUTPUT_CONTINUOUS:
-		output->active_buf = !output->active_buf;
-		break;
-	case STF_OUTPUT_SINGLE:
-	default:
-		break;
-	}
-}
-
 static void stf_buf_update_on_new(struct stfcamss_video *video,
 				  struct stfcamss_buffer *new_buf)
 {
@@ -353,95 +284,6 @@ static void stf_buf_update_on_new(struct stfcamss_video *video,
 	}
 }
 
-static void stf_buf_flush(struct stf_v_buf *output, enum vb2_buffer_state state)
-{
-	struct stfcamss_buffer *buf;
-	struct stfcamss_buffer *t;
-
-	list_for_each_entry_safe(buf, t, &output->pending_bufs, queue) {
-		vb2_buffer_done(&buf->vb.vb2_buf, state);
-		list_del(&buf->queue);
-	}
-	list_for_each_entry_safe(buf, t, &output->ready_bufs, queue) {
-		vb2_buffer_done(&buf->vb.vb2_buf, state);
-		list_del(&buf->queue);
-	}
-}
-
-static struct stfcamss_buffer *stf_buf_done(struct stf_v_buf *output)
-{
-	struct stfcamss_buffer *ready_buf;
-	u64 ts = ktime_get_ns();
-	unsigned long flags;
-
-	if (output->state == STF_OUTPUT_OFF ||
-	    output->state == STF_OUTPUT_RESERVED)
-		return NULL;
-
-	spin_lock_irqsave(&output->lock, flags);
-
-	ready_buf = stf_buf_get_ready(output);
-	if (ready_buf) {
-		ready_buf->vb.vb2_buf.timestamp = ts;
-		ready_buf->vb.sequence = output->sequence++;
-	}
-
-	spin_unlock_irqrestore(&output->lock, flags);
-
-	return ready_buf;
-}
-
-static struct stfcamss_buffer *stf_change_buffer(struct stf_v_buf *output)
-{
-	struct stf_capture *cap = container_of(output, struct stf_capture,
-					       buffers);
-	struct stfcamss *stfcamss = cap->video.stfcamss;
-	struct stfcamss_buffer *ready_buf;
-	unsigned long flags;
-	u32 active_index;
-
-	if (output->state == STF_OUTPUT_OFF ||
-	    output->state == STF_OUTPUT_STOPPING ||
-	    output->state == STF_OUTPUT_RESERVED ||
-	    output->state == STF_OUTPUT_IDLE)
-		return NULL;
-
-	spin_lock_irqsave(&output->lock, flags);
-
-	active_index = output->active_buf;
-
-	ready_buf = output->buf[active_index];
-	if (!ready_buf) {
-		dev_dbg(stfcamss->dev, "missing ready buf %d %d.\n",
-			active_index, output->state);
-		active_index = !active_index;
-		ready_buf = output->buf[active_index];
-		if (!ready_buf) {
-			dev_dbg(stfcamss->dev,
-				"missing ready buf2 %d %d.\n",
-				active_index, output->state);
-			goto out_unlock;
-		}
-	}
-
-	/* Get next buffer */
-	output->buf[active_index] = stf_buf_get_pending(output);
-	if (!output->buf[active_index])
-		stf_buf_update_on_last(output);
-	else
-		stf_buf_update_on_next(output);
-
-	if (output->state == STF_OUTPUT_STOPPING)
-		output->last_buffer = ready_buf;
-	else
-		stf_buf_add_ready(output, ready_buf);
-
-out_unlock:
-	spin_unlock_irqrestore(&output->lock, flags);
-
-	return output->buf[active_index];
-}
-
 irqreturn_t stf_wr_irq_handler(int irq, void *priv)
 {
 	struct stfcamss *stfcamss = priv;
diff --git a/drivers/staging/media/starfive/camss/stf-capture.h b/drivers/staging/media/starfive/camss/stf-capture.h
index 2f9740b7e500..fe2489d55090 100644
--- a/drivers/staging/media/starfive/camss/stf-capture.h
+++ b/drivers/staging/media/starfive/camss/stf-capture.h
@@ -48,28 +48,6 @@
 #define U0_VIN_P_I_MIPI_HAEDER_EN0_MASK		BIT(12)
 #define U0_VIN_PIX_NUM_MASK			GENMASK(16, 13)
 
-enum stf_v_state {
-	STF_OUTPUT_OFF,
-	STF_OUTPUT_RESERVED,
-	STF_OUTPUT_SINGLE,
-	STF_OUTPUT_CONTINUOUS,
-	STF_OUTPUT_IDLE,
-	STF_OUTPUT_STOPPING
-};
-
-struct stf_v_buf {
-	int active_buf;
-	struct stfcamss_buffer *buf[2];
-	struct stfcamss_buffer *last_buffer;
-	struct list_head pending_bufs;
-	struct list_head ready_bufs;
-	enum stf_v_state state;
-	unsigned int sequence;
-	/* protects the above member variables */
-	spinlock_t lock;
-	atomic_t frame_skip;
-};
-
 struct stf_capture {
 	struct stfcamss_video video;
 	struct stf_v_buf buffers;
diff --git a/drivers/staging/media/starfive/camss/stf-video.h b/drivers/staging/media/starfive/camss/stf-video.h
index 8052b77e3ad8..59799b65cbe5 100644
--- a/drivers/staging/media/starfive/camss/stf-video.h
+++ b/drivers/staging/media/starfive/camss/stf-video.h
@@ -10,13 +10,13 @@
 #ifndef STF_VIDEO_H
 #define STF_VIDEO_H
 
-#include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-fh.h>
 #include <media/v4l2-ioctl.h>
-#include <media/videobuf2-v4l2.h>
+
+#include "stf-buffer.h"
 
 #define STFCAMSS_FRAME_MIN_WIDTH		64
 #define STFCAMSS_FRAME_MAX_WIDTH		1920
@@ -40,12 +40,6 @@ enum stf_capture_type {
 	STF_CAPTURE_NUM,
 };
 
-struct stfcamss_buffer {
-	struct vb2_v4l2_buffer vb;
-	dma_addr_t addr[2];
-	struct list_head queue;
-};
-
 struct fract {
 	u8 numerator;
 	u8 denominator;
-- 
2.25.1


