Return-Path: <linux-media+bounces-23528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B6E9F41CB
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 05:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CBD7188E148
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 04:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC0B156230;
	Tue, 17 Dec 2024 04:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="X0PKllmW"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020132.outbound.protection.outlook.com [52.101.156.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEFE1531D5;
	Tue, 17 Dec 2024 04:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734411108; cv=fail; b=VMEChkFF5gjbIK4RFbVl9DuJ3l27lFRSUVSBFVZh4CV68kLdAZ6tabIFGuYIDZdngrvgAvYIbbOySWtvcH4E9twqTmyoECLw5AOLbdcnBuK+AxrwjenXHoP4O+cuEeIx12gQRRvvhTP/2eu38x8Uc5rYgAyt404crRa8Jdv0+vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734411108; c=relaxed/simple;
	bh=vVBu55Ig+PYsFFq9QKpfR6QOFBgXjzSqWXsnUVmJ0Xk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dv3ld1/rRDWcinsyQDtps00VV/GBzfZVdQQ+Ki3ccPYAiZQa3tp6Uhes3g/caCEyDIJBnbWt/q2jTasyeEtL7nOhBicpD3drV4hQN/tNWniZiVVvXIEgiANmLUdTGtjiZLchSY3vXRD+DMISt/Wq03ok7JzuXaieMRHSvVfvo3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=X0PKllmW; arc=fail smtp.client-ip=52.101.156.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOoRibyxfrZtlPoYKTSZ0XsQtxAtI3VO97S2yMA6+F1NwGr8caHAB9LxigmgoN6lGfe7eZXDrxg1brZc//wHVjgxeSaosbbWJJwKzQfcYe5452LsjBgCp1cqtYaXJ3KgG4gh9Neb1MXhH7cv0S2NN4aReOKGYWzzHwmAtGcOnI7ISgA17JL6JxPJ23Ql2ydwBimn0cFpyJFqZZA73KKGo1BvQ9+mATKMBjYX45VgRbRgOWItBbn1d+n7bej610KCPWXj9DldK8G0Vw91iNgXnhZ54H9xovU5o2ELynZHWUGLucKxqIevEIICCxDrm8xIngh7iW0r29p2KaAYkTHgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYy+GSU2vLdo/1ssMs8tywbX+RBJvozv/3j96s2GLzM=;
 b=ufet/Op1swPq0/lLkTGaM2lmSK7YYqqfGodJIPD9Tb1ydooG0cDt28xULXe7XrQ8GvAGnKlNPXKNJAG4jWFa9MvQ9U9a1xVRwfy0t2HBcM0546R9HBp9xi5qW4dSzU0nlV7UY5rSa9IJYYsuxUKn6gnIshVspPqo78lwlHYI0kAMN4gUJwUuSnQR4fNQHe9giuXSfbJ4EhPjOYWeIT8jPXXBiFebl38I/ma9WI+dmkTpYMeCO1HQZUlZosHwpQjhauKoef7xzZo2ht3WkRkzLR4WB00FKLnkOSV3wdadZJbPMtjRt0q1gCqUFbWC+Ov0g7+OD681+x3kzKbdzpym/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYy+GSU2vLdo/1ssMs8tywbX+RBJvozv/3j96s2GLzM=;
 b=X0PKllmWQRb7CVItRo1uJnl4ueajo3gQ6gNz0N6a+wZoAmlHhL8FnqHOZExo3KvkOmx7jH7mCBWh/vR8HfScpmXTj/rld1v+W3XycpSO4Un15Hr/goyb7VSVDu8O4v/DAjEs29Lwmb7yUcFqJ4vwnWEguWL6Di5u02sXyA6Z31k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB1872.KORP216.PROD.OUTLOOK.COM (2603:1096:301:109::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.22; Tue, 17 Dec 2024 04:51:36 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%3]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 04:51:36 +0000
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
Subject: [PATCH v2 2/4] media: chips-media: wave5: Avoid race condition for interrupt handling
Date: Tue, 17 Dec 2024 13:51:23 +0900
Message-Id: <20241217045125.58-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
References: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0103.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB1872:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab016bd-07cb-4b11-c531-08dd1e567cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I8lmjhC6JMIbWtQqvo2ussAB+HAAfns1ARd88nG++hUltp+5IA5reAwch71+?=
 =?us-ascii?Q?dwcZMgvtRzO4WodqUCaEUYeYHHYojwm7z3c77EWYCqN68cpvM20EWtgPdYaO?=
 =?us-ascii?Q?rttcsh/XYND3IfgdYnqJqhyI5CFaneAmx5zTCj6+qh+cZc/QN0oc9AoqAQYe?=
 =?us-ascii?Q?uOR6EMStfMfQD8/QUeRoW5MPLOxTr3jlvcmckQFrydeo8Zf9PG26ycoNraUk?=
 =?us-ascii?Q?TR7LXsOEyXi7y3P2vyq6RV9q3PYG2/Mq31kqn8lcluh3UeHd5lqByjRvvxWW?=
 =?us-ascii?Q?VnDkdmxqi5Hy/Epc74aqCcaXIGCN2OvSPqPH23C2+sBPuERuIxUmf24rPfvw?=
 =?us-ascii?Q?IOOg2uKmnitZFGzebWbga071an+vAIcb+mJYN1sUeOFO1QlA4DRuOefaLFBN?=
 =?us-ascii?Q?hLhBdWh1O+2aF2mgXfNrhyUZCzau0R3V/c0Q06wm9p4ASuBms1WIZW1todW8?=
 =?us-ascii?Q?7uCkASLGZy53aQbSwN/o8DaTJGQJNfP9x5PNy3iU8dw3ep3PLnYlXOC0k8mv?=
 =?us-ascii?Q?KqC0i4JHiMtkEBR/+xlGFvVRPPxRCcraDqksscbRbTC+JPLsgSEQBaKgljTl?=
 =?us-ascii?Q?JwmJUvsARNUNPKPT7U4vlQ2w/4QoxhyFTYDl6jNSTggyQNlNr3tDJmSH6UO7?=
 =?us-ascii?Q?8H+UK9OvNQJHqo1jo5vXQtH1jg9IloTJOfcRUzSB8mLx7gew6jCC4TvY2p3v?=
 =?us-ascii?Q?h5GBh5q/aEcYMH/WnRqLZ1WJZmIFR/6y65hJ4RRUiq14fvtfZklyvdbXzSXu?=
 =?us-ascii?Q?K9LeSDehTLnYFkpKVM4GwSKf9okO+yZdnGkGNzZrrd5iZtUFmmrvtvjL+CSR?=
 =?us-ascii?Q?K6r9F0Pq7rifPr+0tGBJ6qzdAJWD/xx9Qx8w8JV3bmWLuzpfk5rWTFKsSen+?=
 =?us-ascii?Q?8SKpab2bO/oLciYH+T61dhnJ0ske2zYru82ea1b0+7MSDU8016AjqTcIiojM?=
 =?us-ascii?Q?vAhI3fWRZtscxv/aCl56jzzJFLLTFK0JQJESB+h3Atkav4cuyV9fiNsJ4X/y?=
 =?us-ascii?Q?6Spoc1DnD8RHud1aondz8zb3sRJS/u7OtyIqcW6cWNOheK7HbfMr0oAXjFyf?=
 =?us-ascii?Q?6CcThjS/BuYLBYDLzi1+Zlm9vHgRSn53HBe/fz+l/NUqMAfjkqvTxLJQfZRp?=
 =?us-ascii?Q?7krMbY4KmzUsg44FOlgJAaiiWBT9uq7YO6Z3D8f0B2+iTDjaSkUzd3FfkYrB?=
 =?us-ascii?Q?lkBKoSYqxE2EUEXirECuxmrwRFOzKkZsqn1payota6ziNjysbsKhBh/gfuAH?=
 =?us-ascii?Q?1pDVH+OyFnOPJHLsDbUz50r5ACvuIdLNyGrkWrHFko3OVsFKcMQyuJzLiTXg?=
 =?us-ascii?Q?/vWG5JHC6QXv1vyCq6GvybaDgSrbpTxRZyCRVYsEnvsrRHTn7p0oerRBv9Ke?=
 =?us-ascii?Q?UAWPEm914U/PTYTWMHxMfSS1ZcyYiJYrlAbI5JGAQs0vdUF7o4ckcAHKHo40?=
 =?us-ascii?Q?LCbCXtz5suiiC4Pm/6DMXir28OPN9gIM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Btrdds7/IfS5xK6szhS0uM06maGMEOj2wNc3lfA75j+hPWTzfmdTqe4Q8XuE?=
 =?us-ascii?Q?qlGwKup9AUCOdGYWkgM8bwSfRtfPyBJXTzRQjYfV5WydbEd2fotfi6TYUI8t?=
 =?us-ascii?Q?6cwkpV+alH625tz7gXoTN2eHOYpZWoR8w9kWLtGbC1oViGjnulCAE5OIoLMJ?=
 =?us-ascii?Q?BzPT+T5sgP5H4IDxz+7GftjJr79dwbwkKzCSzvdFWIeLuv29yCacXMjeYzHL?=
 =?us-ascii?Q?n4UDd6p/7xG9RIyHSZKWqBcqTnsTu65mDEjy0bQ21wQPVuV2VrncNtpXkizS?=
 =?us-ascii?Q?I7RXNKL/b0eswkTEs6opNrhY+BHN/gM2+lMxmo7LhcLbIAkUbYv9bDGlOdfr?=
 =?us-ascii?Q?QDkzhDg6Z7JJlos8I7K4T+GPFeAOCCPEpOWKH+jYkHXK4MyaTGPTuilrIYAF?=
 =?us-ascii?Q?3MWx6bXPcI3zrMyaf3RKGEBtr9hNR6OimmBeUF3xQdTCOuRwkmFUnVKsq7d0?=
 =?us-ascii?Q?3Q+vL8tgMlYyCruCZjVjQMluaJfRlWoWWmkBL4yI21mE1N7Epir9/g7CS4F4?=
 =?us-ascii?Q?OgJ6N1ov5ySpZYB1o/LM4KZyM8T0Jd5zj0y7Ba70N2sxNbBtGy3p1sbp3FGE?=
 =?us-ascii?Q?2pFuYpTOR1wgHlSB0AJfdQHVby3bRkughM8Q7crFKbljAqXEi4K9vrQfE+BW?=
 =?us-ascii?Q?9ysYJNRlwj8HJ7BOC/cr7Q0BkvCcOK2xbr+qdWVdW2gA7WIi+3SKQvnrebrb?=
 =?us-ascii?Q?Jxmr2F2ah9PdL9Co5nrte21G4ZKYHzgu30WbZwmIPblNE1Pqas1ThzBF11Z+?=
 =?us-ascii?Q?jGF2kOd2bDwYTn8DRvXebUh9YqfnAyqPR6paKoFC0JL1b/CGF0EFJJ8gXmoH?=
 =?us-ascii?Q?QWmgD17u7NtLTazK3F0i9H+zWWv+EKzVcZ3K8Q3M4zefsMFsjU7RHA9HKOfj?=
 =?us-ascii?Q?FPfD/Ni0Tm8GoqIJ9FgQXzuEwTnmo5PBYq1RShQc9FErjtlUvnfp56Yp6Be0?=
 =?us-ascii?Q?LYplwQOkyg/Wfy4ChvB/+9t1VIzYKV/cmsl4XFQFSugBxzPKCn2orw0xUg7+?=
 =?us-ascii?Q?vAsUuZRLyhlTrQu2RI6UfeRtdF7W7PFYA/lsRUw2MDPZU4HBw/GxBmTN/VlS?=
 =?us-ascii?Q?kTN+y0DMDrfKwP1Dqf+CPyqlCAb7wkJ6OyRvpD04Fx0SmYf8T9exWquerWEY?=
 =?us-ascii?Q?EKLouFcdEJHaPPgPUZcTnG25EguOIafNG7biIkmoiGutbFs+BtCTHw3YKKRY?=
 =?us-ascii?Q?EMH6efxKc5+dE6msq6lXVsIpDF/TSz0B34ANXu2Gq82Rw/MEGPdLX9DBfHGE?=
 =?us-ascii?Q?Rd9ek3wsD4bg4XdnoyQUn0wnY7Ky82Wx/T8+qGKYJrWHFjRAUcTmE7Kue5Ga?=
 =?us-ascii?Q?WL6ey1/W24XDdXBqUnnF1t2W2XIf8zxgX4gXYy7qjRw7O/OmJyp6PYfMeGxC?=
 =?us-ascii?Q?PMNsvG973AH4iw1Z1vcQLnhM28Q+Wy9umaA0pRpTlDGzy4TlsMFd+7qaXfCX?=
 =?us-ascii?Q?n2nIusaOReEzFe7agyrD524xzhPmRlkXRCaitoKUoJRVjfGnElFkN/WvkKEz?=
 =?us-ascii?Q?rs8gszBNpOh5oLjOlxSIzhTnjEotdQbcyLU5Yw661PlSxrtKMSvOcMISIbg8?=
 =?us-ascii?Q?aucgCN34iQNNCKJNWoVkcj6v/ji7WqDHmqFpJMbL2R7oKTF25Wj1n/NrgI2A?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab016bd-07cb-4b11-c531-08dd1e567cab
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 04:51:36.5382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxTytnpyilLb7z1Dqq4xlGwfhnj3LM7v05ZCpXV7ZeOSpGZfLw6M5EXOSVZoNdzs2Gc0HR8kSpXoNV8dBV8HkminpACynYiBAC3U+d5fZRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1872

In case of multi instance, interrupts can occur for other instances as
soon as interrupt is cleared. If driver reads the instance_info after
clearing the interrupt, it is not guaranteed that the instance_info is
valid for the current interrupt.

Read the instance_info register for each interrupt before clearing the
interrupt.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 6b294a2d6717..63a607d10433 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -55,12 +55,12 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	struct vpu_device *dev = dev_id;
 
 	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
+	seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
+	cmd_done = wave5_vdi_read_register(dev, W5_RET_QUEUE_CMD_DONE_INST);
 	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
 	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
 
 	list_for_each_entry(inst, &dev->instances, list) {
-		seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
-		cmd_done = wave5_vdi_read_register(dev, W5_RET_QUEUE_CMD_DONE_INST);
 
 		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
 		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
-- 
2.43.0


