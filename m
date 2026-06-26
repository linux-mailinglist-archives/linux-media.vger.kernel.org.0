Return-Path: <linux-media+bounces-65687-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UfxENQLVPWq46wgAu9opvQ
	(envelope-from <linux-media+bounces-65687-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:25:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5775F6C96C7
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:25:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=Jzmbz9K7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65687-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65687-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DE47306AD39
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 01:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9002DCF61;
	Fri, 26 Jun 2026 01:22:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020078.outbound.protection.outlook.com [52.101.156.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF012F8E82;
	Fri, 26 Jun 2026 01:22:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436974; cv=fail; b=tHdbE05zPh3fmkPZqchPzk49m8KTZoxSSoFak5bUn240U4YzYBZ9Hx+9+LEnkNkXL8Enx2Hdu7fupPstQdt0LEPjhJ+2hdPEBNpg3EtyAYxeJ6HfHS1lUPzUjaRj0FqZvrUlEdsS46lK7rcP9ollEVdgk4hRNhJ5EAgexXRdA74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436974; c=relaxed/simple;
	bh=sTp5TwiEvwjVSuZU1ZauOzDttaAk++Xdm78vDxXlXz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OURksfd/0g0MsbRqxMlo3PW1xc5U5jIWlr/53lebCZ13A6Cc3iXzjI3KCf1X4mMJBx60Qr9n/rnKNjW0rWNAGyB9UQ0+v3dUfpjbXsuRM32Hhk8hHW5QKhO4LQhDCFbh1XacPDTM9IDcYIYVP26YEbmE6JRf+mW3NeUhs/MvUl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Jzmbz9K7; arc=fail smtp.client-ip=52.101.156.78
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFK0FIpBOJIRs6VmW9QTFQLh+kCMcwajBSFP55EKdwBxPW9t4eVwndkSjz2yj/thqNdtuS04mXX+y3CKyngffdu2F3I4mP1bbiUkCCvgazijduvLcfDCY367UDY9PdVAWU1eowwuEnNQsJiLqViIupyaJAyLGhoaEIIPSZfazlc8S45wYjEAs7+E8irINVHqb5UzK/eBlG0ips+emcjvME0T0bhcQGl4GY2tzWh0kCQzBrLBqEhHa1z6pXVEIj3qrNM+KkDAF2EinZOIqBFY/yYjYuGnPtrPR0RpEDeolSoOdyf6UiWT4U313iXwFiUWn4zB8spvIybY+uSIbqp6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ob6uyePcgw13IVj0RYtxj3xf2GsWekgN3QcwB8bl1cg=;
 b=JytvRjlTgEwVSbbWO7kHFrXipCWI3UiU5p/M5I6flOEwOlUNRIcBk5x54lWilWbX8K6lsWtozkPTgn2Jt6FSNsFZsK23oYip8RZDywkb++/jYnm1ldgNmu3OEXyEli4tyFNzB4QG8WYoIl3M4fNYr7FiU8BMIW+TbnqfHU2fQb9najBREgZvnISqowH+6ekBKscvBD9zTFIJrbhMh+U/ibsntC+U//+a5CYp2btbQR9tTI/ZQxTX0dTnxMc6FIoBLLZif+HlkG/OlmiEBRnkrt6xSnNxp4sBsUbe2Npv5Cr57N8akDi+lceJHiuM0fS/R/lSVAUb9crngfWTPWuAzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ob6uyePcgw13IVj0RYtxj3xf2GsWekgN3QcwB8bl1cg=;
 b=Jzmbz9K7vE+3dO/yhewm0VYg30MQrq53k7bEMdtnqm4GKKs8u26YhtzTKL5VGmIchtO5zFq9Vmryrn87ehi78etC57yFFzKP7izm/79ZfwTzD5WgB8OoYr8CHGJVnWFgPN2i0dYQwmVp+Q5gs7RrL38aqvaD3JkLzrF9Sa/7fJQ=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SEWP216MB2955.KORP216.PROD.OUTLOOK.COM (2603:1096:101:295::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.17; Fri, 26 Jun 2026 01:22:43 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 01:22:43 +0000
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
	nas.chung@chipsnmedia.com,
	stable@vger.kernel.org
Subject: [PATCH v1 4/7] media: chips-media: wave5: Add timeout while stop_streaming
Date: Fri, 26 Jun 2026 10:22:29 +0900
Message-Id: <20260626012232.111-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626012232.111-1-jackson.lee@chipsnmedia.com>
References: <20260626012232.111-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::9) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SEWP216MB2955:EE_
X-MS-Office365-Filtering-Correlation-Id: 0726691f-40a3-40ac-9559-08ded3216b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|22082099003|18002099003|56012099006|3023799007|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info:
	vTAM/QNZJNH7tqOGjo2nzDT5SHzSReV+aY7RM1mWJtQl8g1piu/2KvDaaZciTrK60BwiIAoswOTwpYkxURux0btjJ6txF8SF9pAbzJkpf4Mng4HIghTwkItDTWijhdn5IlCDcafSH+GV1RvcLeaFnsCqHdCiUVuSFRlSOze+maJ28bLXZmie9Mc6BT4jB8Ew4G2ZCGMSFjvzW1qXgCfgSy5njLl5NF+KDKLgVyx0dPlvbPU4SwLfQFohzlZ6syQkkt0XE5INgApplRmh7bZgSxTZNtnXhkPravsqNNoqGY4G4TC0CRFHhN851QEAZqq46y2XOmdNdda4JyL1OBCWLwmt+XmB6PiBEuQI+ZrHFxMtAn9tLtzdsPBAA6Om3MWg/gtE4sM0InitDME39XVTrnkrI/zn49oS+skm/hK5ULmBovSP+qsIXGW+wzMk8zLwLrq5I0PFHIeoa3Pxsm1B6pwPovvRa2nidPV9zfSMhN35M9iP8YpNITSxl84J6p55a6Zk3RBUwAl934dChxWSu48DYDSKsJkL6Ww5E42J0/xzfBRyLaZE/bG6USjP0dnVz4xxfcW9zXXUqrXwlWtq7NTloGLMB8eEAk5Fb/nyqxoM3kDwRkT6Q9vYw9F9Z/GJ9aSOy/rRQArIAw9W+rCS6E7ITkzgUMXZieKVD1CyeB+IhPPhpC2JnFEXn1EsJGy/oNZb3RFihENd7cuPMMGTMk0A6UFpi5VlOawIBMq9L/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?phAG/F/fFiWvZbP4o/wsVtgXgk9qZ+zxY3fsVrfGX4JjH9xiDaJShvIdhBoq?=
 =?us-ascii?Q?qSoTWqoRpaUDBfkD9nz6e7cMf4TEqAIUMNkxnCH3orqiqRhkqFoEwt0ckVEc?=
 =?us-ascii?Q?87kto8I8HyHFaYacdvSUryFtRcipi20q7Zi2B0mrDrbqAZAAF/37MzvODy2D?=
 =?us-ascii?Q?mapi/ni6YFmCmEsfIi0NtiWQn82jx68J/ASvKkaaeysnxLMvWx0cZ41Vuft+?=
 =?us-ascii?Q?G5Jv+iCCIddNThI3dkI30hFHKvH97o/lCZIP6wWZm5uqaX9+skatL08nJIVE?=
 =?us-ascii?Q?HyhA5YVOvtaTT4SNtGjR0IskwjXg+CqRArja/jAOZJqaP8pIsfutuHlNY1yF?=
 =?us-ascii?Q?mjGzDRuZMoqY/+e9EkGgM9iMDIy1jxxisE1WXED4NxHvoxBxPBEjeqrUcwYJ?=
 =?us-ascii?Q?GPclITpQKge7KJwpcAPb8Nv9MfN3c+HgJAaJd9zUrUXPtdLfevF8ns/v0Bm5?=
 =?us-ascii?Q?GEASut3zAC+GTp1BXh9HJmge1TDRzMVE7TNZeXT3HiGoQsDod0gpLoivtTNc?=
 =?us-ascii?Q?9x372DUo+w0BrbtdmQ6RhccwdzDCz7jEcAOHmiLrIyGJdQnDGiGOQLGRfuio?=
 =?us-ascii?Q?bONR+FBMYUmfBZza+Sezk5/ZwaFisJCV/0K16xXDDRIyKWFQ5M1tR+nBK12D?=
 =?us-ascii?Q?Ymd+CjpioLsIpiFcqwjIjyjpqNhDjyrSDQJg/7Io7mnUSeKc/9v44T6Zqgit?=
 =?us-ascii?Q?T6Xzy+F6/kIZivDe2MDK//OtwgNRw6VfeKzOr8mmrueVwMBTGD7psEj6egtD?=
 =?us-ascii?Q?qE/Mm86su59DQsjPo0nFVsxcD4Q7L0Mi5d0mn0+KBM6bt3nvYKFCgpZJp+pq?=
 =?us-ascii?Q?aeLg0O+QSW5x75+LUXfdVGw4Gwb40r+Hh9tobZf4ltLUIo7Cz7qQD8ijXMHY?=
 =?us-ascii?Q?VGAz6RY1a2McJXiNtsE1RK/YVskIpW5HMfYFp4yFjN4/wBbQrwGxd2mO+h5D?=
 =?us-ascii?Q?sG6S5ZpDr0gjEUfu9dgJcbaSziRiZSHGTP0KkL/cqf90SAzLNcuBhDT1tK1X?=
 =?us-ascii?Q?MmnQBoujpxefV8qal6kXPOyrovWlPTQeRcHb3690WEUOQCZal89l8wsXE/GK?=
 =?us-ascii?Q?H3I6pm86TQGkmQqkbH6vIzeI3vhhKcxwwr97eJTaP6hxPGw8yMT/BIT+vBTw?=
 =?us-ascii?Q?y0nOsv2u4sVtNoPcT5EPD/OVXGhxwyivliHYnXVYe0V5NBb1YM/oTSLEhNYe?=
 =?us-ascii?Q?b4KmGK5g/AcM7gk+OrtL9csk7vASyNSUubBGYNZZBGGZ1ANWLwjUIK1QBgSn?=
 =?us-ascii?Q?+KxmPFnIOmSJoG1ai4B1CO5S2zJ8T1bRImnZSz7apfDgUtCxhvpNWWFZq1BK?=
 =?us-ascii?Q?sMDO/baR7yOs+VNFYgOZ2D4V4FeZ4pEh4E4+xg+TccuqC9zFxyTJVqTHxzyQ?=
 =?us-ascii?Q?qO9hG78QfikaKJlXTCgzfzCtC0J4MD7w9Ty8jZhmb6n39a+FMyak7EzPtrj3?=
 =?us-ascii?Q?P1uLKMYJWVpy74GfNv5FZvbwTDSrfyNJA+dCoREQ+HYtLlWG2ftraCO6noJy?=
 =?us-ascii?Q?BekbhzeXAtJYzkqvQU1P1xDkBZ3i8xUGseF+x1M8SfERy7zvurtUHA39mEM3?=
 =?us-ascii?Q?2Zs7IT/OzAICq12uSeiwItlevRRtrXh1PiegIFOmCUlkpJ9FYQWt1Ud/0gc0?=
 =?us-ascii?Q?MybKXaJrb4uwnUxxUPPF2lwL1ZfqsBrDbcKwHzxbgqAQJpWTdfggWLN9Y5Rd?=
 =?us-ascii?Q?onkdGiUtsJYOH7ZkaL9l1xs9iwp6kl8L46SsAgGSGqYOBB52RlncaXwqL4nU?=
 =?us-ascii?Q?Z2xWNHojZV7lo3LqJgA6VNsJi5g7QFA=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0726691f-40a3-40ac-9559-08ded3216b73
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:22:42.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uUMD7LYG7fJcni5Rcb7RnIfkokyJUcaCCm2KDIDI5nLwlYxOFpnzgQxJ+6IBwgsGPfkj+jgyhg+qbwgUJg8rPZ0Jk6Y5sRA2WVQa89RabE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2955
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65687-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[chipsnmedia.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil-cisco@xs4all.nl,m:nicolas.dufresne@collabora.com,m:bob.beckett@collabora.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:b-brnich@ti.com,m:hverkuil@xs4all.nl,m:nas.chung@chipsnmedia.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5775F6C96C7

From: Jackson Lee <jackson.lee@chipsnmedia.com>

When stop_streaming is called, an infinite loop may occur in some cases.
Add a bounded poll of the queue status: loop until the queues drain,
sleeping briefly between polls, and bail out once VPU_DEC_STOP_TIMEOUT
elapses.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-vpu-dec.c    | 15 +++++++++------
 .../platform/chips-media/wave5/wave5-vpuconfig.h  |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 6c6e86b09b40..93f7b724d86c 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2021-2023 CHIPS&MEDIA INC
  */
 
+#include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include "wave5-helper.h"
 
@@ -1537,15 +1538,15 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 {
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
-
-	bool check_cmd = TRUE;
+	unsigned long timeout;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
 	pm_runtime_resume_and_get(inst->dev->dev);
 	inst->empty_queue = true;
-	while (check_cmd) {
+
+	timeout = jiffies + msecs_to_jiffies(VPU_DEC_STOP_TIMEOUT);
+	while (true) {
 		struct queue_status_info q_status;
-		struct dec_output_info dec_output_info;
 
 		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
 		if ((inst->state == VPU_INST_STATE_STOP ||
@@ -1554,8 +1555,10 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 			q_status.report_queue_count == 0)
 			break;
 
-		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
-			dev_dbg(inst->dev->dev, "there is no output info\n");
+		if (time_after(jiffies, timeout))
+			break;
+
+		usleep_range(1000, 2000);
 	}
 
 	v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
index 4ebd48d5550e..e04f2dbf3b65 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
@@ -59,7 +59,7 @@
 //  application specific configuration
 #define VPU_ENC_TIMEOUT                 60000
 #define VPU_DEC_TIMEOUT                 60000
-#define VPU_DEC_STOP_TIMEOUT            10
+#define VPU_DEC_STOP_TIMEOUT            300
 
 // for WAVE encoder
 #define USE_SRC_PRP_AXI         0
-- 
2.43.0


