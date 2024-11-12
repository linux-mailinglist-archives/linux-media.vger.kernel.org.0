Return-Path: <linux-media+bounces-21277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 255579C4C63
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 03:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA29C1F2564C
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 02:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD5C20A5CE;
	Tue, 12 Nov 2024 02:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="WXPrxH4u"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022128.outbound.protection.outlook.com [40.107.43.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A853D208215;
	Tue, 12 Nov 2024 02:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731377735; cv=fail; b=VXy1ncGzCVXt1Rsg+q5LoZXxJ7eXpU2zwml6CrgVWTtHLwLDIcH9sX5zvQ5VwQQp4TYl99446/u20BAcnQE/nuMvsCsmp+a2LLZeoHHZ8n0Uq4GNvoHVds3Pstw85bI+L2pvgECH+vLEFcZjRXx7RF6JMcgXcqI1dBSqFfm4K2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731377735; c=relaxed/simple;
	bh=yvEX9kLTXiGl1IHcoffjzsUsLxKTj7HHrndozi0qKO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BbRl4LNlIMAb74a9VvUay8dmyFvWiy9048XsWrT3jhPfDnpWMfs6P2pTSwxn+1Hkm6Ovur6Ux/SSnB9zB4BuPsdejzRi/9WVIBptfVB4PJ/87My6AnNv9S8Z6glV7w6N7os+RIgW8OLnPrexiF0ec8qNUJ/ShK3EPTfXpgWxzBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=WXPrxH4u; arc=fail smtp.client-ip=40.107.43.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVZH01RPGqdqzA3UO92OkfjbsQWmLOBkoKCXXX6TvuDoF5SlLitD9cKucmAeJx9R4y2aWEsUd/PfRsi+e1MsBVCD9ENfTpOYvmy3h4cx0ZZ9sb92n9lYYSdgl+aZ5ZcUQNOp2HgDFnVaVr2WG0DYJ0Ff0aw4KW5m10Ppq1vrJZITTMpBJ+0uMfJF+yMoQ9xln2Q03Pdy53umnM+MSuBo43bPtNvKmc1zXw7XyKi/LEem0jisq9zdgGnuuxUDflcp0SoElEwDkq4ol+nmqNRcrR6NYGSYmZ/iRyN5FE74djXYA+uSvATdD/bljaOge27Xa5Y7XN/YPXt0dipwl4u2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N86sxHpu0ZmI+36m85EhEa8AuGXjwCSEGGlTjuc7HhI=;
 b=XiKIrCOnaki4655JMUqHZnuVBN4sM8/YdJmyrM8c6LzgH+bv0Rw0E7lF/bIySIApfN+3COzQCTPZxyoFvYUdbyfRNDfwu/cub7miWQRPFvQ/EvB7lzsUv13oAIJ3S1DoZkhdnBoP6VYbonptLTwngbJ9BxwvFwy5ZSabyh756nMoa5DewilwBipNAqbwP91bNfK11agU5d1qtMFWDJDtWfQ4GrxHl5+WBA4NFN1kVIcrnX4ox9sO7KuMC98U2m13NcZeesAdUTDAUd1QhfUf1Y54gY1/gNI53DG/q65mE0jVk0RfuGziIrfh82yi57A/+9Dev8J7YoCxJ9fMFUjkkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N86sxHpu0ZmI+36m85EhEa8AuGXjwCSEGGlTjuc7HhI=;
 b=WXPrxH4uTVMjw4Zf9pv/ZE7MHtGB/JumZ/MfD91fn8vqBnZ6M+0ShOHai6X41Ms/mappLfI2a5GlX5m5UW6wBSfjE0eN0NIPeki7lC5NzGo4l3Fwcp0rrdfL/K91ZER55QfcwX3IO4Wfh8BALLMdLRa51ChSPBqlBBfU7ElOQ4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1900.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.29; Tue, 12 Nov 2024 02:15:26 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 02:15:26 +0000
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
Subject: [PATCH v0 2/6] media: chips-media: wave5: Avoid race condition for interrupt handling
Date: Tue, 12 Nov 2024 11:15:13 +0900
Message-Id: <20241112021517.121-3-jackson.lee@chipsnmedia.com>
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
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB1900:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c462faf-08e7-4332-3921-08dd02bfdf12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WPEqI/t8/XLBy+HoLM/1rFGemi/SNpoAgLq8vma8pwwezjH/KLR0bZLEUI3o?=
 =?us-ascii?Q?5uEi5uKjU+mGgYC/Ke9CIOdP+SuB1WrAQrBZ4eGU6B+FrtHk3r6BzCVz08Ue?=
 =?us-ascii?Q?QEq0EB1iUBrhiPJKxwjoISJ6ijnjr+Xm2yzobCIXj8sbB9rOIn+/uk94CoWB?=
 =?us-ascii?Q?Uf+XG08Cwwo5Y4zjVhO3g9GX13evCdahErtD0HPz6VaoTJf+c9N0pe+YBaHH?=
 =?us-ascii?Q?dl5tCkDCs6a52r5Xhg2JmebJmFKpL5Kr603dXOIL0trO3358O6SQKxlTxjSo?=
 =?us-ascii?Q?hVmqfqIEZgNizwENOWIVNpHSOB5KQkZgUKGDqIsbjyMYfuU0oIvJ7n8+t2AG?=
 =?us-ascii?Q?/+aVqSV1EUFtuMiEyRWHsrrJvqwy0uFg5i/BH1BIqGYEKJ+wf2n9HAmA97ia?=
 =?us-ascii?Q?hkuESXOnuDOl+X76THXF9W7nhF3HCPE5F4JRHJ/auXltKHHRLb/kG2wPbL4J?=
 =?us-ascii?Q?T4yTnA9mM/4mBSPS6IokNB1vG3NqiO5R+WMKhPPHRbQeVpb6EuaIVkLTlSDJ?=
 =?us-ascii?Q?V+cYwRM6JCry5kHxzf6xDA1D1GcEJm5DBM8+exX2jRdZIAI2GKZe1e2fDwzp?=
 =?us-ascii?Q?2A19vMvzwOzDIXu9NEnp+CayjiLnzFKhk1PwoVJepEdEfXD2we4AQWWDFsre?=
 =?us-ascii?Q?NXu/wpl0eI3aNqOZS5cDkUK+S21WqTTUffqK6U9mLFZzFtdq8J9PYkfru3fP?=
 =?us-ascii?Q?hmMD+UYsdN9m8yX9yZgzBXtHKzMEPoXrK0bN2kbZvhfKPhV9BNNUW5D45Lvi?=
 =?us-ascii?Q?eFqQql873h5+oW/fuBnm1MSW6LZV+3UDYF/2X4C9zEGdrwiR8MvbWVdqaPOa?=
 =?us-ascii?Q?astQOd+ULY6S2rvVD1EeAwtSidF1oOSojaLDwBOyYJDJhl+/Qd0G7lFvTfta?=
 =?us-ascii?Q?RKAEi4SKvbMnaBgaa5LEGZq5l2eJrbRho4jxg+h9Fwau8Cm2k48zd7pguDkx?=
 =?us-ascii?Q?P4fuKVsPdPrsmgrVretA1ndPWdp4r8x64pb+xLWV1fxH2bfQinwkSQKAPeUl?=
 =?us-ascii?Q?CiFaLYzRDm22Y+OTAuu+AJEoY3MZ9cfb5B03mLtnFzRijvuCB9R2yGqEfBPD?=
 =?us-ascii?Q?BH2Wc1dOH/pg0xImQMbIQ550qIOXS640juCNRMYILGJgFLyxi64WXhlDLgAk?=
 =?us-ascii?Q?jUS65EhfG1h7+ER7zYSA1SMOdSwU57t8x5KKOtAFftEPEqWDtbX7iHPfGUEH?=
 =?us-ascii?Q?ybrB1aW7eX6meMoqK+7OcOyRgDcnGJlKUmPfswrXBl/h+nZfuYsVkt6/XPtm?=
 =?us-ascii?Q?Vi2c+Y1kqu9XRKneoNrh0VXRUh4Gs5FSVuKyNDw3YymyEnXAncZGhdFNh0zf?=
 =?us-ascii?Q?7/0RL3fbmfHa7bZpb5zY5tvxxsaxMHS0qX+1gpiggd4R4I0dSURM+kDIq186?=
 =?us-ascii?Q?WlkSRiE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QiE5C/vF+J1lMpt77ETPKDqxaUZvPa5pYQ26PYSO0QHbLPF1Wg4pP9TSP2JL?=
 =?us-ascii?Q?RCDy6u9cLQWYn0ebXdi1IFZWtSx4Mfu+4V3wuDFljoNZnjCBl+KXRsf3fOG+?=
 =?us-ascii?Q?zKv04aiaB7F6AQBxLbr/ZaymyDgPRZOBs4AT0XdSVmYfs+8wNuRiszPD7mQa?=
 =?us-ascii?Q?+FVeBaUl2rakSJOc26SIn4fV6kIxA2I/IjkTVJDpusASdLIs4Aow+Hfvumce?=
 =?us-ascii?Q?2G0yuDtErJ1+oWkLVCK283hVvcjWGOOY8uucHdaGnyTAaGDITRVHyNy9xSzM?=
 =?us-ascii?Q?tv5Jp3gIncsi5helGq2qOCPgK4jONTzuclgm8eHDrvD3JCI3kadDHGCV29LG?=
 =?us-ascii?Q?I7W8aEJ8FWdspi1V2v65OWlozRaPynb0ihrzI1bb77caVMEEBIrZv6pafsE4?=
 =?us-ascii?Q?hPjLsy3yU/HhAb69zZYBMzHBmJzxmgph4pmTKzhzf8hdnmgHrs1tXni+KshV?=
 =?us-ascii?Q?AOwb088KrmnmF+ih5MECJ/KKIlV4hfja6holLlRenLIIDiDOk7Ew6Wma3XUa?=
 =?us-ascii?Q?uHBUjxvBkKGpdSRLz9XthYvfHeBzCUArGAEMZ7xCJyEgP820JaJ+aqHYCAJT?=
 =?us-ascii?Q?Ez7e+d4B5swT3+oE7e7T1YVDQ4iKKq2YZQINgp+B4q1TJiuV9k6c/BwV1bmW?=
 =?us-ascii?Q?xKfA8wnp4wxeZJHKbaWxSD1qYp9fd6VaGeuvHejaY4ekV/hNDX2eVJO7GS1c?=
 =?us-ascii?Q?bMmKedyCz9lAHigyI0V4QV/QBNaDgPzIpPVKNXyQ/P2+ea2ReCQn++3Cpnuz?=
 =?us-ascii?Q?sXZFY0jjJv3qdq76OmnInEThh6YQ/uoRd7toIaYPAp9WSxHmMYrV4BW/epyQ?=
 =?us-ascii?Q?4yH+63XeT3xNn/W11kqrvUuPNLyxf4eJr4InwXtTk6K9ep06e5UygVGiCr3w?=
 =?us-ascii?Q?NLqeOO2gjt1eyI/KpHu8mWav7uEwlpZiEHH8E11IC84ZHC5Hi12arAdMZ1cP?=
 =?us-ascii?Q?SC5A2vv0CdYMPBRkLAZUx+CSdLJ6gMBOtn5WlDJrvELtBNABGxVqOej5QBGQ?=
 =?us-ascii?Q?nK3uZ38dkLrRryeSUPMJVKZxyttaRSTFs+lERVY4AcbsA8RFOJYJ9vAeTrag?=
 =?us-ascii?Q?EHz6I/BK2hwAL/Q+FbiHWzYxllLq3uGMrpxk6vX9aK9lrvBG658Q5c6HCWHM?=
 =?us-ascii?Q?sCettCGqLeI8ukdCLsbd2PuSENzX2M/mgIKUCJvsReFGoWPLKUAnD4r1lp1c?=
 =?us-ascii?Q?H2m+5dL1yKxpbpwLRg6JY0LQZftkFHO0cFHTfINrNduvUEILuPzmi4R5zx1T?=
 =?us-ascii?Q?bND7DvLmzsB4x14x9ArlYN8OpL0HxqeD9scTMUtSjp4gdVPOia4NjxoBeVD9?=
 =?us-ascii?Q?dURHy/kcjnI5ctmDAKGk1gAYK7mTzL70PkWgefkvAaxSvLvcaTBKnNbSxHsf?=
 =?us-ascii?Q?HPOrKwV/RHqOmaAsDCGGCTEhiA3d6vGiB09aBKe4uyKu3S7lLeU2LZhh4Cuk?=
 =?us-ascii?Q?AGS8iHIY9LxEVdZmFPdtiFQh7q5L+KKQUQlawCaAstDfUkhIapLW5du7EoRD?=
 =?us-ascii?Q?pCdZ6d26nLHM8r+35RtZRnRICPZZ7iSw3LRf3EW8RqO1BCsIFuUJnBQRixzT?=
 =?us-ascii?Q?Mq1b03zAaEfa8NBGtQWDRILmaDBY+E/gw7AXvfG/RxCi6eScsISntX1tSEpQ?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c462faf-08e7-4332-3921-08dd02bfdf12
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 02:15:26.2658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlS3/lvvZVYynuK3Y3KvSkbruXekonKbEgvNRGeQdO08dQSrV57qUycl/tWs25565XerTiMYQdJlgL7ZfsEFN06mAnlxmT4AbkuAcHocRH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1900

In case of multi instance, interrupts can occurr for other instances as
soon as interrupt is cleared. If driver reads the instance_info after
clearing the interrupt, it is not guaranteed that the instance_info is
valid for the current interrupt.

Read the instance_info register for each interrupt before clearing the
interrupt.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
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


