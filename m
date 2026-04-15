Return-Path: <linux-media+bounces-58805-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI2TKh9a32n1RwAAu9opvQ
	(envelope-from <linux-media+bounces-58805-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:27:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A97F54028F5
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27637305931C
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152A4336888;
	Wed, 15 Apr 2026 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="GXgjIB2q"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021105.outbound.protection.outlook.com [40.107.42.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802A23385AA;
	Wed, 15 Apr 2026 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245155; cv=fail; b=Ghr1iOBwxevZdsCvA9hWkKgrUheUqcb02j96IMxhB+nkOS5U1HIXFlJAaZV+wLBlOk0aHm3T2uSj0XaKyPpyTAAwjQdWSSB5cS8SqZpvNBxua0yI6X/gTJ6AIoK0OM4WxhzDq7qgeKO49fB//tLax04//IeDt/VqCFb4LvFmv6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245155; c=relaxed/simple;
	bh=B7G1UX6FZKxEABrWfk9z83XGnI6zLnZLzmBwFalUl7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZTwAHtdnK/s+qlU57KMPpp6gPUb0ml3wcYq/o0aYofbNPt3sJz3sjhxJMqbKZ03mM7IFP3/k2e25/RCa3/nfHGJRDwfHBt9yw+5SYLRBlAeBP30LxeVAswEnR60Uy8fW6MtmJmbRxDapoK7+feA24w+jQqcPaJEqEobntHfSrnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=GXgjIB2q; arc=fail smtp.client-ip=40.107.42.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fa7omvD+q8DU+KmjW89UMz1nYyAvFVHlFzJoA/0Dpe7idZjPppamY6hNZk2g86whRq+U6mIfnGAiAKqKI9jF488+QGaF1nWQCOERtmGS/jT1/hzvE74pUuXUwE/MGDwQCvWqHHVZuQmCbdvsAuve1HAz9ibcdK8ZnoqQY9h8bZpymQ728cp5AqXWjfwmRnj8W/+7q+fsRBU5S/B4tEQIqMa5kiBWcmLaRt84IW3O6zq0JJOaGF9QylVoMqbzn3Q0oghGfmCrnQVce/48VRLU8EKWXAlSHzGPMqsbr10VrsOR4BgVHPBSmb2028nIyHz6YYPkyFhYS4/lhzQwGp3MVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sF4DIvW5zVRLrRxulMwzqwE7o0nXYL5uZj1k7bNqwM=;
 b=Yq7jjCmvcYuZ/Uf69Xe3g5/vEgzJCkSGimu3bSz1EWoIncXJ29mIbrgaTUDZ5zDqO40L7dpW21bfA2wo6xX2KCBud9hW5XRPR0/wm5eLoU0/1MwHI1ud5Msst7JbiuEQC4W+Vw/ehpX9lbCDM29vwmLxsQx+8zx4CtvxftEHTMQZQ5IadsaBFIHSvank+yXKuYwmfR7aiWYLfOEFi8R+fs24f70YSR1jGSRQhhM7zcqlQZwqb5i3dsFR8aySV3+kb/UkRQQCz3yBhodO/yWj+j6wfFgpdkVbAGOr1BcCVrLQSNrFc+OEmqJd1yKIRZYJdegLldVRnMcoU4p41YAQmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sF4DIvW5zVRLrRxulMwzqwE7o0nXYL5uZj1k7bNqwM=;
 b=GXgjIB2qyvR3KTRXa43Q731faL48xl2Te+IK9hnxDecjIA2KQhTn2WMjHEdO9pbPIwPWXXkyCmuvhD3X5fsc1qxnwadE1hQcv9O2zzaon1+s79h/zdTN6ENxAYK78gV0bRRE53qJFarRPXvbmLRGn0SLBkCyBBGxLIK/AWqQkXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB2830.KORP216.PROD.OUTLOOK.COM (2603:1096:101:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 09:25:45 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 09:25:45 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	marek.vasut@mailbox.org,
	ming.qian@oss.nxp.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [RFC PATCH v5 5/9] media: chips-media: wave6: Add Wave6 core driver
Date: Wed, 15 Apr 2026 18:25:25 +0900
Message-Id: <20260415092529.577-6-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415092529.577-1-nas.chung@chipsnmedia.com>
References: <20260415092529.577-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0163.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::11) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SL2P216MB2830:EE_
X-MS-Office365-Filtering-Correlation-Id: 796709e8-444e-40af-ce4e-08de9ad0f93a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Gt6PsQPV/NP1ksZaoQ5REe12VqaMaroBmXTBgLP/ByzGtvKNTcVlCt+sCUN8G0P2XMXtxc+LSA78B/RtN7QXeP7SLWH+XgyibIY6mfXpgpW3qHzy6YmepJU8bkxdnyuYQxjX2c+OLD6/5g8E1yr2MYqAT/yUGT+1ceyjGiCztCG0CHbZ/q9kOKFB+blH2ltnSC8zPhW2l6SUKv4IZzqKCBaJ52QV3ittcx/hyZrZs+3h36L/RRRBTjkj0h95PIa4NxJn/LYrv1ZkeVrmDizj5hZO44BfkGmGWQLEuOIOPYV7q/7XnGPf9QnJ5Iet3a1hsNdYUFETJRV098s2XSNGVjLqf7gOoVrDDnsCldOvs5y0Swg+jzYRPz462QZNc1hx4xE8hzHjSrNqsfwbyyARs0Hnd91uALTyOSbyM8s6kT4ZuGLPnWI3zz6xmNnzwkoU4zQmaWjfQspBYxySvypIdOq6ezXUgwN13uacUVtMWXXaAoZOtuqfZ4FJ4v0RDhwpF+L4qx+1mKbSdk8zxDaYI6bIP6DGw+7O46nzLbAJo4xXTamemHErvbQF3jGp1jSBqpK5raSJRaN1+BQyv1z+7kYOzlnSb2EzQtznBwbJR1ILfPWGCwwhbrUObzkWew1h32XQsx6RIODp57Z7S9SRRfIhipXZ7jxdHRu/CeXiBbu4LN3I2SZgA2pcGkf0tzhb1d0TWbgqsszGya53tcWDs/wKGYXtsy7zx6bPlVeUifbBY5uz1tAHXT2yJ1ti2On6SGkFP/PaBs6peQjsadBFsBmP5B25UTZOg0sHNdFincA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OhWMzaN0S4e35SqmeFmh7oP3rGBh3FJdCL4jzHtZ92f9Jw4abTErmOV9wtsh?=
 =?us-ascii?Q?O9PUyseVPOyMdLW+hc3a0B3Iqfn4qAiKsDDqtfGnK+Tk+GAhRZzxHbAFRxFz?=
 =?us-ascii?Q?6XZ0At5UsyDtgmYZJry/EJkiC330DXdeCjVo6J1hQjnE6LvGQ32Je5kRIw9F?=
 =?us-ascii?Q?Va61/q4bHNJcmTD7sB0fQtlm1dXkZIiH+aA40zfAhM4FlV1f7OQ1kHwEN5sE?=
 =?us-ascii?Q?91s7w5f5pYedCNvnXG66u1hUkBjoCV2fe3izVyU477SPF644CQf6ZweiyR5I?=
 =?us-ascii?Q?dErCa8da33PtcFso/RoF0uVAVP2aWAvwuHhHpwjcTl4X7tv0upRZUsYHYJmz?=
 =?us-ascii?Q?T4fh5+46ZshhGP9u8EcVeTWn255SFrZ0ppKojfs/dG5zTewYLHw8LCT0mAdd?=
 =?us-ascii?Q?4pe9bze+olKjuyuY2OxkjKqhvw5WbzPeqWxP3YSPTq5d1QPc4ilcA8G3iA2f?=
 =?us-ascii?Q?XbaBIalODPCIZcxiPFOxz93BT8ueS486K3M0UpsWnO46buZ3f0Z7YG2DSPwu?=
 =?us-ascii?Q?73Wz5vhqKWYluVyS3mYeE5dHuBQF8DIlVMBlEZA5J2gtTE8vnjNNjncdFG8h?=
 =?us-ascii?Q?dNorRqZUsjcl/fUzWf7j9NUwKk03GFsVvfGvtYCLwNU1CC6GhogG4YJ2p2mC?=
 =?us-ascii?Q?hGHdPdfoRspBY+CjGtFphWyLPRqYfaaVFYo0+bAMYUAVprh6DZq8FaBTdLNZ?=
 =?us-ascii?Q?HnTIedtPe3WAG7O8EFTmNxv4GkC77cGNJqiYI1wDGTrQqd7vDnT1Y0GjjQqW?=
 =?us-ascii?Q?gOSh3V/SF33cU6j8V6RBtiPANPAnP+rPE7ouyFHUNDNTM1aBLqvo7xuuk5lq?=
 =?us-ascii?Q?YPIG3xUwj0uonx7IqbY0ClCLg4PC1arMOa9soePkoH0y69PJGGMzbcIU+Nvo?=
 =?us-ascii?Q?h7kCQEdNs9Vswi4a5I3gnesSsOd9WLlejb4mSmjHi9zaZhnXIjqH0MdfXWXb?=
 =?us-ascii?Q?kYV2W15RiPlTI+QBXWxxkwSuRzbBO0huMycxWad+rPP6OgClu8BHGFetJpXc?=
 =?us-ascii?Q?3pPdDbsJCkQmeH8ovgbNf9OvFW/xOfOKoKwofS5jKDEUBgxuGnksvEC4Ojni?=
 =?us-ascii?Q?urWs3ebu2ZeLTOB6ixg/oHa4u0WGd3Ol2TudylB13yBevJliNOd3mAmOJU0l?=
 =?us-ascii?Q?Tty3AU18P+9sjEEmX/+5+TB5bywFZzrVvfwvSPgWUA1PF/bn8GLVBNes2RBJ?=
 =?us-ascii?Q?//YA78DJTUjbjNqmfsmA/hgo5qG/MzMd2JsZiVY5/CtEieIQ96+bHgtGqHRn?=
 =?us-ascii?Q?VxUxWfyrIQBPz4ZSJFq9s3JeO7elxYnpfBhlw01YyNGCfLW8g7SFkth6l0f0?=
 =?us-ascii?Q?evGCFwh2ug6jp0DoexD//SoZvVzdoA7XXNINhdJoTqvJqLrmy+fDpyabTBYX?=
 =?us-ascii?Q?HVBpyFrzFxTiOIsef0syLVagSKaZjR6kP9c+0acpveLZ3scIiEp3Nw5kr2vR?=
 =?us-ascii?Q?JNY1OaS5/7mjbo8ITuhGBKQLmk4/MhUTJ4oxC9V2h0QAVjXpBu53Nm6rmKsa?=
 =?us-ascii?Q?OAacPDCrm5UUiHwN5XDMjTi60bkC00jvx88YM8ml/uyRqsFwgwC5WHPqWLOd?=
 =?us-ascii?Q?lHH7slxWTfIAZUiVYeCUG5m5BfzbX/ibI08cXOQxCJZYHC6CZwuTXI+Lbl+c?=
 =?us-ascii?Q?7iJA1X5MTU2TDvVADy++YdUrmrc2o2Bqr4JdEt1AXz522HgKFOMiJFJz5fIx?=
 =?us-ascii?Q?ZEOlwvmMBygPrtesPc/4wpoLETLiBDD1m7RuDt1i1hEpvahAN9fC03MebdpB?=
 =?us-ascii?Q?CqoTi/4iR0fOgDProp6r0qz9/c6ZLZs=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796709e8-444e-40af-ce4e-08de9ad0f93a
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 09:25:45.9392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8HkzfCllfCj15hySw+D74mD6U2k9hXfwe1C9DusB689Q4Soin9fTtWx3atsFjUTl3mCXe7NbuAX1tiUqwhQD+QAwQ1YJI+rAg+IwW94TfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2830
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58805-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,pengutronix.de];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,nxp.com:email,chipsnmedia.com:email,chipsnmedia.com:dkim,chipsnmedia.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A97F54028F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the core driver for the Chips&Media Wave6 video codec IP.

The hardware contains one control register region and four interface
register regions for a shared video processing engine. This driver
handles the interface register regions, each with its own MMIO range and
interrupt, while relying on the control driver for firmware loading and
shared resource management.

It configures the V4L2 mem2mem devices and communicates with the Wave6
hardware to perform video processing tasks.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 .../chips-media/wave6/wave6-vpu-core.c        | 397 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-core.h        | 123 ++++++
 2 files changed, 520 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
new file mode 100644
index 000000000000..d666a6bb22e8
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
@@ -0,0 +1,397 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 core driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/debugfs.h>
+#include <linux/iopoll.h>
+#include "wave6-vpu-core.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpuconfig.h"
+#include "wave6-hw.h"
+#include "wave6-vpu-dbg.h"
+
+#define CREATE_TRACE_POINTS
+#include "wave6-trace.h"
+
+#define WAVE6_VPU_DEBUGFS_DIR "wave6"
+
+static irqreturn_t wave6_vpu_core_irq(int irq, void *dev_id)
+{
+	struct vpu_core_device *core = dev_id;
+	struct vpu_irq irq_info;
+
+	if (!vpu_read_reg(core, W6_VPU_VPU_INT_STS))
+		return IRQ_NONE;
+
+	irq_info.status = vpu_read_reg(core, W6_VPU_VINT_REASON);
+	irq_info.inst_idc = vpu_read_reg(core, W6_RET_INT_INSTANCE_INFO);
+
+	vpu_write_reg(core, W6_RET_INT_INSTANCE_INFO, INT_INSTANCE_INFO_CLEAR);
+	vpu_write_reg(core, W6_VPU_VINT_REASON_CLEAR, irq_info.status);
+	vpu_write_reg(core, W6_VPU_VINT_CLEAR, VINT_CLEAR);
+
+	trace_wave6_vpu_irq(core, irq_info.status, irq_info.inst_idc);
+
+	if (irq_info.status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
+		if (core->vpu)
+			core->vpu->req_work_buffer(core->vpu, core);
+
+		return IRQ_HANDLED;
+	}
+
+	kfifo_in(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq));
+
+	return IRQ_WAKE_THREAD;
+}
+
+static struct vpu_instance *wave6_vpu_core_get_instance(struct vpu_core_device *core,
+							u32 inst_idc)
+{
+	struct vpu_instance *inst;
+
+	guard(spinlock)(&core->inst_lock);
+
+	list_for_each_entry(inst, &core->instances, list) {
+		if (BIT(inst->id) & inst_idc)
+			return inst;
+	}
+
+	return NULL;
+}
+
+static irqreturn_t wave6_vpu_core_irq_thread(int irq, void *dev_id)
+{
+	struct vpu_core_device *core = dev_id;
+	struct vpu_instance *inst;
+	struct vpu_irq irq_info;
+
+	while (kfifo_len(&core->irq_fifo)) {
+		bool error = false;
+
+		if (!kfifo_out(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)))
+			break;
+
+		inst = wave6_vpu_core_get_instance(core, irq_info.inst_idc);
+		if (!inst)
+			break;
+
+		if ((irq_info.status & BIT(W6_INT_BIT_INIT_SEQ)) ||
+		    (irq_info.status & BIT(W6_INT_BIT_ENC_SET_PARAM))) {
+			complete(&inst->irq_done);
+			continue;
+		}
+
+		if (irq_info.status & BIT(W6_INT_BIT_BSBUF_ERROR))
+			error = true;
+
+		if (inst->ops && inst->ops->finish_process)
+			inst->ops->finish_process(inst, error);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void wave6_vpu_core_check_state(struct vpu_core_device *core)
+{
+	u32 val;
+	int ret;
+
+	guard(mutex)(&core->hw_lock);
+
+	ret = read_poll_timeout(vpu_read_reg, val, val != 0,
+				W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				false, core, W6_VPU_VCPU_CUR_PC);
+	if (ret)
+		return;
+
+	wave6_vpu_enable_interrupt(core);
+	ret = wave6_vpu_get_version(core);
+	if (ret) {
+		dev_err(core->dev, "wave6_vpu_get_version fail\n");
+		return;
+	}
+
+	dev_dbg(core->dev, "product 0x%x, fw_ver %d.%d.%d(r%d), hw_ver 0x%x\n",
+		core->attr.product_code,
+		FW_VERSION_MAJOR(core->attr.fw_version),
+		FW_VERSION_MINOR(core->attr.fw_version),
+		FW_VERSION_REL(core->attr.fw_version),
+		core->attr.fw_revision,
+		core->attr.hw_version);
+
+	if (core->attr.fw_version < core->res->compatible_fw_version)
+		dev_err(core->dev, "fw version is too low (< v%d.%d.%d)\n",
+			FW_VERSION_MAJOR(core->res->compatible_fw_version),
+			FW_VERSION_MINOR(core->res->compatible_fw_version),
+			FW_VERSION_REL(core->res->compatible_fw_version));
+}
+
+void wave6_vpu_core_activate(struct vpu_core_device *core)
+{
+	core->active = true;
+}
+
+static void wave6_vpu_core_wait_activated(struct vpu_core_device *core)
+{
+	if (core->active)
+		wave6_vpu_core_check_state(core);
+}
+
+static int wave6_vpu_core_probe(struct platform_device *pdev)
+{
+	struct vpu_core_device *core;
+	const struct wave6_vpu_core_resource *res;
+	int ret;
+	int irq;
+
+	res = dev_get_platdata(&pdev->dev);
+	if (!res) {
+		dev_err(&pdev->dev, "There is no platform data\n");
+		return -ENODEV;
+	}
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
+		return ret;
+	}
+
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&pdev->dev, &core->dev_lock);
+	if (ret)
+		return ret;
+
+	ret = devm_mutex_init(&pdev->dev, &core->hw_lock);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&core->inst_lock);
+	INIT_LIST_HEAD(&core->instances);
+	dev_set_drvdata(&pdev->dev, core);
+	core->dev = &pdev->dev;
+	core->res = res;
+
+	if (pdev->dev.parent->driver && pdev->dev.parent->driver->name &&
+	    !strcmp(pdev->dev.parent->driver->name, WAVE6_VPU_PLATFORM_DRIVER_NAME))
+		core->vpu = dev_get_drvdata(pdev->dev.parent);
+
+	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(core->reg_base))
+		return PTR_ERR(core->reg_base);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &core->clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to get clocks\n");
+
+	core->num_clks = ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq,
+					wave6_vpu_core_irq,
+					wave6_vpu_core_irq_thread,
+					0, "vpu_irq", core);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_device_register(&pdev->dev, &core->v4l2_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register v4l2_dev: %d\n", ret);
+		return ret;
+	}
+
+	ret = wave6_vpu_init_m2m_dev(core);
+	if (ret)
+		goto err_v4l2_unregister;
+
+	ret = kfifo_alloc(&core->irq_fifo,
+			  MAX_NUM_INSTANCE * sizeof(struct vpu_irq),
+			  GFP_KERNEL);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to allocate fifo\n");
+		goto err_m2m_dev_release;
+	}
+
+	core->temp_vbuf.size = ALIGN(W6_TEMPBUF_SIZE, 4096);
+	ret = wave6_vdi_alloc_dma(core->dev, &core->temp_vbuf);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to allocate temp_vbuf: %d\n", ret);
+		goto err_kfifo_free;
+	}
+
+	core->debugfs = debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
+	if (IS_ERR_OR_NULL(core->debugfs))
+		core->debugfs = debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);
+
+	pm_runtime_enable(&pdev->dev);
+
+	if (core->res->codec_types & WAVE6_IS_DEC) {
+		ret = wave6_vpu_dec_register_device(core);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"failed to register video_dev_dec: %d\n", ret);
+			goto err_temp_vbuf_free;
+		}
+	}
+	if (core->res->codec_types & WAVE6_IS_ENC) {
+		ret = wave6_vpu_enc_register_device(core);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"failed to register video_dev_enc: %d\n", ret);
+			goto err_dec_unreg;
+		}
+	}
+
+	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s %s\n",
+		core->res->codec_types & WAVE6_IS_ENC ? "'ENCODE'" : "",
+		core->res->codec_types & WAVE6_IS_DEC ? "'DECODE'" : "");
+
+	return 0;
+
+err_dec_unreg:
+	if (core->res->codec_types & WAVE6_IS_DEC)
+		wave6_vpu_dec_unregister_device(core);
+err_temp_vbuf_free:
+	wave6_vdi_free_dma(&core->temp_vbuf);
+err_kfifo_free:
+	kfifo_free(&core->irq_fifo);
+err_m2m_dev_release:
+	wave6_vpu_release_m2m_dev(core);
+err_v4l2_unregister:
+	v4l2_device_unregister(&core->v4l2_dev);
+
+	return ret;
+}
+
+static void wave6_vpu_core_remove(struct platform_device *pdev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(&pdev->dev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	wave6_vpu_enc_unregister_device(core);
+	wave6_vpu_dec_unregister_device(core);
+	wave6_vdi_free_dma(&core->temp_vbuf);
+	kfifo_free(&core->irq_fifo);
+	wave6_vpu_release_m2m_dev(core);
+	v4l2_device_unregister(&core->v4l2_dev);
+}
+
+static int __maybe_unused wave6_vpu_core_runtime_suspend(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+
+	if (WARN_ON(!core))
+		return -ENODEV;
+
+	/*
+	 * Only call parent VPU put_vpu if the core has a parent and is active.
+	 * - core->vpu: prevent access in core without parent VPU.
+	 * - core->active: execute sleep only after m2m streaming is started.
+	 */
+	if (core->vpu && core->active)
+		core->vpu->put_vpu(core->vpu, core);
+
+	if (core->num_clks)
+		clk_bulk_disable_unprepare(core->num_clks, core->clks);
+
+	return 0;
+}
+
+static int __maybe_unused wave6_vpu_core_runtime_resume(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (WARN_ON(!core))
+		return -ENODEV;
+
+	if (core->num_clks) {
+		ret = clk_bulk_prepare_enable(core->num_clks, core->clks);
+		if (ret) {
+			dev_err(dev, "failed to enable clocks: %d\n", ret);
+			return ret;
+		}
+	}
+
+	/*
+	 * Only call parent VPU get_vpu if the core has a parent and is active.
+	 * - core->vpu: prevent access in core without parent VPU.
+	 * - core->active: execute boot only after m2m streaming is started.
+	 */
+	if (core->vpu && core->active)
+		ret = core->vpu->get_vpu(core->vpu, core);
+
+	if (!ret)
+		wave6_vpu_core_wait_activated(core);
+	else if (core->num_clks)
+		clk_bulk_disable_unprepare(core->num_clks, core->clks);
+
+	return ret;
+}
+
+static int __maybe_unused wave6_vpu_core_suspend(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret;
+
+	v4l2_m2m_suspend(core->m2m_dev);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		v4l2_m2m_resume(core->m2m_dev);
+
+	return ret;
+}
+
+static int __maybe_unused wave6_vpu_core_resume(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	v4l2_m2m_resume(core->m2m_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops wave6_vpu_core_pm_ops = {
+	SET_RUNTIME_PM_OPS(wave6_vpu_core_runtime_suspend,
+			   wave6_vpu_core_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(wave6_vpu_core_suspend,
+				wave6_vpu_core_resume)
+};
+
+static struct platform_driver wave6_vpu_core_driver = {
+	.driver = {
+		.name = WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME,
+		.pm = &wave6_vpu_core_pm_ops,
+	},
+	.probe = wave6_vpu_core_probe,
+	.remove = wave6_vpu_core_remove,
+};
+
+module_platform_driver(wave6_vpu_core_driver);
+MODULE_ALIAS("platform:" WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME);
+MODULE_DESCRIPTION("chips&media Wave6 VPU CORE V4L2 driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
new file mode 100644
index 000000000000..728ea5a0578d
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
@@ -0,0 +1,123 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 core driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_CORE_H__
+#define __WAVE6_VPU_CORE_H__
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include "wave6-vpuconfig.h"
+#include "wave6-vpuapi.h"
+
+#define vpu_write_reg(CORE, ADDR, DATA) wave6_vpu_writel(CORE, ADDR, DATA)
+#define vpu_read_reg(CORE, ADDR) wave6_vpu_readl(CORE, ADDR)
+
+struct vpu_buffer {
+	struct v4l2_m2m_buffer v4l2_m2m_buf;
+	bool consumed;
+	bool used;
+	bool error;
+	bool force_key_frame;
+	bool force_frame_qp;
+	u32 force_i_frame_qp;
+	u32 force_p_frame_qp;
+	u32 force_b_frame_qp;
+	ktime_t ts_input;
+	ktime_t ts_start;
+	ktime_t ts_finish;
+	ktime_t ts_output;
+	u64 hw_time;
+	u32 average_qp;
+};
+
+enum vpu_fmt_type {
+	VPU_FMT_TYPE_CODEC	= 0,
+	VPU_FMT_TYPE_RAW	= 1
+};
+
+#define VPU_FMT_FLAG_CBCR_INTERLEAVED	BIT(0)
+#define VPU_FMT_FLAG_CRCB_ORDER		BIT(1)
+#define VPU_FMT_FLAG_10BIT		BIT(2)
+#define VPU_FMT_FLAG_RGB		BIT(3)
+
+struct vpu_format {
+	unsigned int v4l2_pix_fmt;
+	unsigned int max_width;
+	unsigned int min_width;
+	unsigned int max_height;
+	unsigned int min_height;
+	unsigned int num_planes;
+	enum frame_buffer_format fb_fmt;
+	enum endian_mode endian;
+	enum csc_format_order csc_fmt_order;
+	unsigned int flags;
+};
+
+static inline struct vpu_instance *wave6_fh_to_vpu_inst(struct v4l2_fh *vfh)
+{
+	return container_of(vfh, struct vpu_instance, v4l2_fh);
+}
+
+static inline struct vpu_instance *wave6_file_to_vpu_inst(struct file *filp)
+{
+	return wave6_fh_to_vpu_inst(file_to_v4l2_fh(filp));
+}
+
+static inline struct vpu_instance *wave6_ctrl_to_vpu_inst(struct v4l2_ctrl *vctrl)
+{
+	return container_of(vctrl->handler, struct vpu_instance, v4l2_ctrl_hdl);
+}
+
+static inline struct vpu_buffer *wave6_to_vpu_buf(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct vpu_buffer, v4l2_m2m_buf.vb);
+}
+
+static inline bool wave6_vpu_both_queues_are_streaming(struct vpu_instance *inst)
+{
+	struct vb2_queue *vq_cap = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
+	struct vb2_queue *vq_out = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
+
+	return vb2_is_streaming(vq_cap) && vb2_is_streaming(vq_out);
+}
+
+u32 wave6_vpu_get_consumed_fb_num(struct vpu_instance *inst);
+void wave6_vpu_core_activate(struct vpu_core_device *core);
+void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  unsigned int width,
+			  unsigned int height);
+struct vb2_v4l2_buffer *wave6_get_dst_buf_by_addr(struct vpu_instance *inst,
+						  dma_addr_t addr);
+dma_addr_t wave6_get_dma_addr(struct vb2_v4l2_buffer *buf,
+			      unsigned int plane_no);
+enum codec_std wave6_to_codec_std(enum vpu_instance_type type, unsigned int v4l2_pix_fmt);
+const char *wave6_vpu_instance_state_name(enum vpu_instance_state state);
+void wave6_vpu_set_instance_state(struct vpu_instance *inst,
+				  enum vpu_instance_state state);
+u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle);
+int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
+int  wave6_vpu_dec_register_device(struct vpu_core_device *core);
+void wave6_vpu_dec_unregister_device(struct vpu_core_device *core);
+int  wave6_vpu_enc_register_device(struct vpu_core_device *core);
+void wave6_vpu_enc_unregister_device(struct vpu_core_device *core);
+void wave6_vpu_finish_job(struct vpu_instance *inst);
+void wave6_vpu_record_performance_timestamps(struct vpu_instance *inst);
+void wave6_vpu_handle_performance(struct vpu_instance *inst,
+				  struct vpu_buffer *vpu_buf);
+void wave6_vpu_reset_performance(struct vpu_instance *inst);
+int wave6_vpu_init_m2m_dev(struct vpu_core_device *core);
+void wave6_vpu_release_m2m_dev(struct vpu_core_device *core);
+int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
+			      const struct v4l2_event_subscription *sub);
+void wave6_vpu_return_buffers(struct vpu_instance *inst,
+			      unsigned int type, enum vb2_buffer_state state);
+
+#endif /* __WAVE6_VPU_CORE_H__ */
-- 
2.31.1


