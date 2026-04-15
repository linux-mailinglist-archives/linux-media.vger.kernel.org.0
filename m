Return-Path: <linux-media+bounces-58809-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDoDMNlb32n1RwAAu9opvQ
	(envelope-from <linux-media+bounces-58809-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:35:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D16402A4C
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2979631326F3
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE4434028B;
	Wed, 15 Apr 2026 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="cnRmdC+t"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021105.outbound.protection.outlook.com [40.107.42.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E47337BB5;
	Wed, 15 Apr 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245165; cv=fail; b=j3DFdTXfqVgEsdOyW6ztEoBQWnPmUQU1mOdBmd81k0i747vZ54I6esAGD8HTgw2uv2h1vb37iwQLElCNdnrBxaAwDgJd9Mxyp6jg8eDv6ByQjTr1auQ39InY+BWqZ4xC+JZyKBpwcLV7o+NiSh56vWGCN03VqmrK10VYqe/fkHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245165; c=relaxed/simple;
	bh=+9/tmqFgEaUI/FlstxSOMw4HkXWVS1uhXDJnw95HTM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gs7/wsFtJViAINXmxac5X6nxCEhYsQ/fKkgTcXss87B7cJxs6onRKbt0vY/dpbwFM35+8xPwJpHNiR4eixx93M8tdQiBe89y4/IrEU0Iie7mFnVAgAz5wfsSOxq5Nxi6SfgqIUbwTPRo2V7R0gieN4ON/OfFMDns4oTg5rnx2Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=cnRmdC+t; arc=fail smtp.client-ip=40.107.42.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxdD2Yhxym5f/fm/x8dI/Vd1zgW8y2da23LCSolZdnknpq5WirozkDh1B4ALCcxCdJyQ+xhIyMNH2wLGEtOMJex0d//bV+U7Jsth8W0gyI4xrlGzRQvvakcnoEvLk7r8j8Oec6rBxTmr7ndSqU6RphescTrePavYFNMQoR9a9BY5w9QMpHxpyC/hqEdQ+FthwSrrtGH1FFM1a8Xv2LXX91wBtFESDlGuB6oHQ3hE7wlUQYZoP70+X/BQONEw0BzHTI4EJeJcEkn6JQPbjmPjiw/MyPzrZaY/tPGoUKD0LPwM5tZiyMIZSEmO1Z3r9GVJVdzyZmGcNkyIyqKIENcUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1aFKHqH49tRNnhprYxGEDmXwxuB/veKYZnnB6hnzBs=;
 b=mObmf3uSA/fOizfPm+/Cw+KTF2Xy8z7wzI31shbgANHJBa9/T+4OtT6k8C6dV3cMPDimJhgPqudM0dO6d01PGKSdYXa8zkFYGpqiBfGmlfWheQ74hv8QuMvoHOdpWLqUqBdBIXcequM1iI1p/BBgTCkbiqC1l/JaDyVolojWYChB6anNCHMcLFVG60HMdTlStQ6drCXDUFtmAhCAEXVCMTgsa+CxDhHL+b+ndoLAmO1t8lJokCKcw34LwMK3zh9sDfG39JxB//8pZ9L6QuLMac92AXuolm4KDNP0xY0j9wqanqJYAT3HCQW0WBghCDAgk2ySSfOsoBHvZY5gdJNAHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1aFKHqH49tRNnhprYxGEDmXwxuB/veKYZnnB6hnzBs=;
 b=cnRmdC+tEBNHomFLC14mKVDgG4TvhEbtvzifHI6ZQIcvcVrEEvPHbDRNdlRDLo86OMA9zneeqwfifOrsy9eU+LFpAjLxzx7cMGFDT0yFWkNX+sh0ISVdY0TL1hYQ8dRnDAZRMlwnxWQoS4sGPCjVl0xgtd71O/1khPkE9u6uBgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB2830.KORP216.PROD.OUTLOOK.COM (2603:1096:101:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 09:25:48 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 09:25:48 +0000
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
Subject: [RFC PATCH v5 7/9] media: chips-media: wave6: Add Wave6 thermal cooling device
Date: Wed, 15 Apr 2026 18:25:27 +0900
Message-Id: <20260415092529.577-8-nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: f25dd3f9-f295-4aa2-a166-08de9ad0fa73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DFkk/+ijAD7n1YwHFDxOBy9mhBVnxTx5JdJEjBguKkdVEv8mN9kbYVV35BP25DrHvA/v6e5b4wpdOp3ZN9dlDBBC6YKRXM78KLc4hJb+2TTWG9Ez7xFDmm8hkM9UGT0JhR0ZzG8ienrKVQMEFPr6bc9pBjQoGQg63A6XhKuHwCIKu+b1qg9dYL2LC5Zs3koOHWRhJrRKKqFjKPM/Iwas8n1WHFTFbEyEhEppJjSfUfUWVOdr3br7p+JrVmZUZhZ61tvTfqYPdRd+8cmhrwgnFGDBNLHqmJuo8Ou7LE9SejhyZo4dO853YZP8Q7E5mO/Szai+l99RsCKt5yWvYGyFrlltQ97XwvAsYI3iTU/wwdTGxYdUz56ITZOz7WFILklQqkxOaLGx+XnZy2Ip0KZ+0G+RBfKi+GRmP3Jgi4eKu6uwoIMQjdc/kc/xU/JrvXMn3Y0ICPXGS2zwXeXzkdHe3938xhEOGI8nBTaFQhrJ+QuNsfbfDzmNQzvefy8Z0grp7+f8gV1KefirsIbcPpBdWHhOjbJtHDafwvkr+XJAp/GFxIdnkZak8Nm93hNSFO4ncUNYy+SSQe7xGSe96HN6XpBJ7fRqjhM84KL5lY+jtsE1ppQYnLYallIAzHCrAxy8mzks8bX4y9/Iap8kYS/JVqMn8B5xhPD7VkWV8wdIEXTVOHjfZCxBa5kDuG4uNZSfB3jmeLhf25/ATezYxEnHixRgfPf/NK8vyQxCZxIymNR1IMOz0HkUDJDPQu5VckCtx25H+iavLHrGH+vkqtYd3Pb8bM0eFZxr8Ou2JcM/6pM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WK4mN1Lho5qLSbhPsqGcdUve4KG2V9cVXeqZcA0sZLlyTss2cqO8ZuGAcycr?=
 =?us-ascii?Q?iM6BgwbxeGGYXPo0WW3IwzORTWuH5mwvfNs22elL+IHQaOn9uR63UCjXgptr?=
 =?us-ascii?Q?YsomUfy9e5cDIUfWPHTPLxMecWSZ3O//tpQp3WRsEj9LQK2jitajY71AqjPs?=
 =?us-ascii?Q?smlZ1B+bEvv+b6W9sI3taajy2fOCUdfLG48/Ht+uw5ebAawD6Bgpz1in0xk+?=
 =?us-ascii?Q?quvYFAqXFm2gZMB2ClHb+k3lVdxXkWkxaWREbUceF9g6LKToXnZnQwaBsvkQ?=
 =?us-ascii?Q?eU7xFtpMhxDwrIL1ZpiDXDJEYLFxy/nBeTx6Lwz6bshnPYj/UfkoN+N2ZWxS?=
 =?us-ascii?Q?vKzfFIoQL4ztxKzn4qF/URALewdkSCEIJFTMok1HP76RF9djoC4XT60rVfza?=
 =?us-ascii?Q?EhRdFveREj2NBdxRF32VfFH+CErJfXHNCASqwAiR09ePk5M/mZSsTQBKtqgC?=
 =?us-ascii?Q?gm8WW2xtf4wMzWlJ/1QeJ6ms64JsdoRgh2bbDT5fVRSrj0yQvTj5o8J2XbKv?=
 =?us-ascii?Q?BofFjOCO0RzL3KW4y7tozRyyZ5YbFpfGMuhBpHQ+lBPcBK4YJo5ENsdO3CTi?=
 =?us-ascii?Q?yMUhhz5vGaWMpUNmz9nQEqopLlcbFlxbmYmHUdCeMzEuMLnQVAbgatPwkf+n?=
 =?us-ascii?Q?eyHWLcxceOhM+AmNchW4XGUgyOvfsOqmsj3jbO/GtGE1X+riQRQw2adEclZS?=
 =?us-ascii?Q?j3GrgNf3R9QLWm/lDyJiB2rSwhsUTmP3Y2wPkgdPnoebbJL89Yyhcj5nvWQN?=
 =?us-ascii?Q?YxffjUiUt3n3W3akeEeGszFggkzkWJnarDXHE5Tj4aEZ3584oITLvQTipVLA?=
 =?us-ascii?Q?8RjtxMNOeyIS9jP11LLGPgbYN7oPqyUV2+jfrhO95mr+TZvG9zAOkOmiqz5n?=
 =?us-ascii?Q?zNAcw3LSC/zBYSTpTGQq7fFj80SL24vaCSUnTzZyCeB5Wzxm0g+zQSUuRHPx?=
 =?us-ascii?Q?S0biLDqnlKjL9PELkr6Si24a2C67P8EL2zZfKRpFZXNiJI2mL1Z3rXVJxyAA?=
 =?us-ascii?Q?vkLzafl+UGGZh9XeS/feau3+YOhAmUEFU5s//FQGa5DfCgrO4/8IyHrqCF9i?=
 =?us-ascii?Q?5N8IOQpSVWfDpfppz3H9wwWImWtnRYOSUkiEhwtOsVJTWNRUrjC2JnrHYxK+?=
 =?us-ascii?Q?MtiWtGY4L/PiMC4TFevX2jLONmNLOYVK7v8xizTqwzEr0eanLmGF9Hnp99Iy?=
 =?us-ascii?Q?t9gQFVJucUENdTgHl0uOOAim6LsNVyPCbUTBra9TCVDen34xa9H49chm+CX3?=
 =?us-ascii?Q?oc+XfmgvVP4Z704R90xVIJaCsdtjuq0awxI12RRoxqNCSZamb9QSWGsSQrl7?=
 =?us-ascii?Q?xtYYcH3NZRVI4EiXeC7lQlZgxm7x7OzdGQzBRUXCsngPH9oS3KFAl8h9u21f?=
 =?us-ascii?Q?vGroHP/UvuKJB/M3U+HzaAwZC5NG55H+EVRZVFnH472sPXFZZ7286CSvwb3L?=
 =?us-ascii?Q?b2kmGcXXht2bWd7Wch20IJsNuPmhnUPU4ed3EOH80ldLv16HjMM3biP5lUz5?=
 =?us-ascii?Q?VE6rESvYeLx2mcGtaTI9VlXq2aO1KC4jkYaGanf3Dx/u0/0c3eeS9zxTs6LP?=
 =?us-ascii?Q?1fHADIKyqLmgwd3DB1Diyu0a6RTr26urqLA07HDAup5Ow8H06xHjjQnLyE7J?=
 =?us-ascii?Q?glPiid/1g5r9QWVwZOJ8cLLB0YU/JwwoEPM51NTqSBb35cDc1W0lHstQ0Pmg?=
 =?us-ascii?Q?Xd6BRPs+mwCJUIFqSHsbk8zssUizF3z6icT358t8ZMNrkbpmbnCU8YLCwbSc?=
 =?us-ascii?Q?QD+TF2M4iTxucjn+9dBsFuJz0BFAY+Q=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25dd3f9-f295-4aa2-a166-08de9ad0fa73
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 09:25:47.9866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9TR5YRSDjy5ofTSxKMUINyVFyw+g9YvyRiNPrfUZi6Ig0cn+NHykC60VaY3XeAq4ePKFwzcHFJDhwaf1haHhhbxbSuLc9IHOCq4xnjYYlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2830
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58809-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,nxp.com:email,chipsnmedia.com:email,chipsnmedia.com:dkim,chipsnmedia.com:mid]
X-Rspamd-Queue-Id: 18D16402A4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a thermal cooling device for the Wave6 VPU.
The device operates within the Linux thermal framework,
adjusting the VPU performance state based on thermal conditions.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 .../chips-media/wave6/wave6-vpu-thermal.c     | 141 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-thermal.h     |  26 ++++
 2 files changed, 167 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
new file mode 100644
index 000000000000..df8161fd4998
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 thermal cooling interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ *
+ */
+
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/units.h>
+#include <linux/slab.h>
+#include "wave6-vpu-thermal.h"
+
+static int wave6_vpu_thermal_cooling_update(struct vpu_thermal_cooling *thermal,
+					    int state)
+{
+	unsigned long new_clock_rate;
+	int ret;
+
+	if (state > thermal->thermal_max || !thermal->cooling)
+		return 0;
+
+	new_clock_rate = DIV_ROUND_UP(thermal->freq_table[state], HZ_PER_KHZ);
+	dev_dbg(thermal->dev, "receive cooling state: %d, new clock rate %ld\n",
+		state, new_clock_rate);
+
+	ret = dev_pm_genpd_set_performance_state(thermal->dev, new_clock_rate);
+	if (ret && !((ret == -ENODEV) || (ret == -EOPNOTSUPP))) {
+		dev_err(thermal->dev, "failed to set perf to %lu, ret = %d\n",
+			new_clock_rate, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_get_max_state(struct thermal_cooling_device *cdev,
+					   unsigned long *state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	*state = thermal->thermal_max;
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+					   unsigned long *state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	*state = thermal->thermal_event;
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+					   unsigned long state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	thermal->thermal_event = state;
+	wave6_vpu_thermal_cooling_update(thermal, state);
+
+	return 0;
+}
+
+static struct thermal_cooling_device_ops wave6_cooling_ops = {
+	.get_max_state = wave6_vpu_cooling_get_max_state,
+	.get_cur_state = wave6_vpu_cooling_get_cur_state,
+	.set_cur_state = wave6_vpu_cooling_set_cur_state,
+};
+
+int wave6_vpu_cooling_init(struct vpu_thermal_cooling *thermal)
+{
+	int i;
+	int num_opps;
+	unsigned long freq;
+
+	if (WARN_ON(!thermal || !thermal->dev))
+		return -EINVAL;
+
+	num_opps = dev_pm_opp_get_opp_count(thermal->dev);
+	if (num_opps < 0) {
+		dev_err(thermal->dev, "fail to get pm opp count, ret = %d\n", num_opps);
+		return num_opps;
+	}
+	if (num_opps == 0) {
+		dev_err(thermal->dev, "no OPP entries found\n");
+		return -ENODEV;
+	}
+
+	thermal->freq_table = kcalloc(num_opps, sizeof(*thermal->freq_table), GFP_KERNEL);
+	if (!thermal->freq_table)
+		goto error;
+
+	for (i = 0, freq = ULONG_MAX; i < num_opps; i++, freq--) {
+		struct dev_pm_opp *opp;
+
+		opp = dev_pm_opp_find_freq_floor(thermal->dev, &freq);
+		if (IS_ERR(opp))
+			break;
+
+		dev_pm_opp_put(opp);
+
+		dev_dbg(thermal->dev, "[%d] = %lu\n", i, freq);
+		if (freq < 100 * HZ_PER_MHZ)
+			break;
+
+		thermal->freq_table[i] = freq;
+		thermal->thermal_max = i;
+	}
+
+	if (!thermal->thermal_max)
+		goto error;
+
+	thermal->thermal_event = 0;
+	thermal->cooling = thermal_of_cooling_device_register(thermal->dev->of_node,
+							      dev_name(thermal->dev),
+							      thermal,
+							      &wave6_cooling_ops);
+	if (IS_ERR(thermal->cooling)) {
+		dev_err(thermal->dev, "register cooling device failed\n");
+		goto error;
+	}
+
+	return 0;
+
+error:
+	wave6_vpu_cooling_remove(thermal);
+
+	return -EINVAL;
+}
+
+void wave6_vpu_cooling_remove(struct vpu_thermal_cooling *thermal)
+{
+	thermal_cooling_device_unregister(thermal->cooling);
+	kfree(thermal->freq_table);
+	thermal->freq_table = NULL;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
new file mode 100644
index 000000000000..16e86e99540a
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 thermal cooling interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ *
+ */
+
+#ifndef __WAVE6_VPU_THERMAL_H__
+#define __WAVE6_VPU_THERMAL_H__
+
+#include <linux/thermal.h>
+
+struct vpu_thermal_cooling {
+	struct device *dev;
+	struct device_node *of_node;
+	int thermal_event;
+	int thermal_max;
+	struct thermal_cooling_device *cooling;
+	unsigned long *freq_table;
+};
+
+int wave6_vpu_cooling_init(struct vpu_thermal_cooling *thermal);
+void wave6_vpu_cooling_remove(struct vpu_thermal_cooling *thermal);
+
+#endif /* __WAVE6_VPU_THERMAL_H__ */
-- 
2.31.1


