Return-Path: <linux-media+bounces-65688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id auu/FbjUPWqj6wgAu9opvQ
	(envelope-from <linux-media+bounces-65688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:24:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E91DC6C96A1
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:24:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b="GyI/1w/v";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65688-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65688-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A29F430569FD
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 01:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC7E30F531;
	Fri, 26 Jun 2026 01:22:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022102.outbound.protection.outlook.com [40.107.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4961C2FC898;
	Fri, 26 Jun 2026 01:22:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436975; cv=fail; b=HE1PJmbXIUVyilGKyxQVuGyqlbHsG+1l98jNbo9N7edCtSgsFkEEFKZGwqTIxDDi6e7+baL7c+iS56YPakCLvAZLx3XJKkqHlsNCJ0Nf5JokLOPKCGF8zfHUjfwOEtZ1s6rz1X38xBIH7/WeBLrr9g/qtM3vMX3BNpW0YNZF9A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436975; c=relaxed/simple;
	bh=aEWgAUbsrst32wonlcrT/0NkaAG6lpgUV4IJ21ODXnc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u49jflgiZY9cTBge6MAQ4PEnbRwJ09Q+8qVh1a+f6ZOrTTUgGn/bros98JoNLs6CFBZcpLzMeW43Vq/+AOM3x0q3f5CAC0BzQYPb1iqdF2CerYIR4SXtL6MrAx7Jlp6csKIsNxh6RP6TiI/1cFn8gDaV+YPXdA9YHE0Zivr++/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=GyI/1w/v; arc=fail smtp.client-ip=40.107.43.102
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIwIifbtaKiAUspMT7DJEY+J4cAzSDEnxK3K5SSw3DWhjiBBySrX3Quaz0y1mB1whQBJ9/au1NvY5ms/jJMrA4QqFHfajhCIp0ycwTGcjFatLDXKK1dlFXg0okhC82NwcAtg2kxTHz+6vU6QwzFNXC1bywrJWZ7WZr+myY1vF2udvGJKrlLri4veOWKoJtxkNSkdjHTMIOG3jwaS7wiiiK+Y6eZQXWnnEgvaSbnBkAsgyPQD+JZdDfh3OvCAsxlQisdxU07v0AAvPyYFyHWagZu5R7EEX76wScmBzwaWGJDkZqBp+uG9H08Nf9x5Xw97MpzCOxi7D5V54EqR+hAd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6C6FRkdghIFvVVY+8+GmZTOlmQz91ChPjgpgBu3jBk=;
 b=oUQ8qG2IQwWu6/anrRZAdlPJUGnel3BKwSyVCtI+7SYg84hYlEP4Dn/x8gLBtYfs0FrWKliZNBSRU5DYWvYw/HV2p/lrd88H32NIj6w71Mh/jx4287ECo7WKfDtyphLomEzxcDtnWuGIA3AkvAoR80zRhfsQmQPFWYQsuE55n/yVWNeYwIWXhRSnf0KeUSDauaRBe32pAqtDmaaI6aAVX3iNOn8soTZ6jy7NxHhKBAVykC4rx1mMlmMDJa4tvvtqNwIZKmhBXojEWDAdKja6fE6Cm12bEhsa7vnztwxD09gt/WoV8H4d533DB5ApyiGsAEFCcgNq75ZO+dFJvYfS2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6C6FRkdghIFvVVY+8+GmZTOlmQz91ChPjgpgBu3jBk=;
 b=GyI/1w/vrCCk96Mj1z2GL0AXQ3t+fQU/k7irFEuGgs61rusmmWlj8s11P50ykA20ysE+X+clCd5y9v0eUxrWVJ5JoZLg0QeSrTiNch3WySNSdX/kUUwjVad5/N9jiXRuSpGeGDfrUPGdW9bjUhgvEZelD/lR11g28y27Q22Cox4=
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
Subject: [PATCH v1 5/7] media: chips-media: wave5: Defer job_finish() only when a DEC_PIC was queued
Date: Fri, 26 Jun 2026 10:22:30 +0900
Message-Id: <20260626012232.111-6-jackson.lee@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 72ce7ed2-7d22-49d5-c4cf-08ded3216b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|22082099003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	NxiInuazcVx1wGeZHmZHlWUoZFqVUK837KC5Uo7p8/p6bokNFc8L19/ByPuEpQGjOVeKob5Lkyd9PeU/E6ZzxZCgznSnkDPTuk+hawnF6z4qY9aeT4v7W148o7EAbZx9BcqYiqOPcyQ5LN9/rR23StAQdPeCR36gXNJz7PyhILcg0UuAYXgcJGdVARZTNehaOTuiH+4bXJasLLT7n8yiA88YyWQknMua/uasXCPsHmDmUBoMZlBrbrR0/VkG68Z2KeTzv7vNvxyxBILVEcYPO7T/ipqfr3e7KTLO7pyE+4dr+1RVwe3PQ3iS1u5fgDYUUt/sKUtm0COUFpqbyGMi4aq83prEEygQOmk4j9sWHhMnxq7gGyyi5uLU4lyfrUUXxvHd7ZMGHXta48tkDodE1m37LYgWCwDGeMZ7GIXaGgwyHtapey15rizfXDlYI8NXqutUfY1vuB/K8qE3Tbarznnc36upGJTxi1CzGqDZfDaq2eMD/jctdSN99E6FDWPTSxqj5DA3zqZpLdtt3ht5sI41X2a8WcUb5Va6sUw69wo+LGBePqds8g80hqBohhgyIbJ2u41aOi0CiWKDCJeVFIw7AdsRn1M1RMUexABl8j6i58ragGbhN7vpqgQqk+KiVMvuFGPxN9w5sPNOXeuovAKSZ2FDVaUc+rxGEgXit64mr50+YWQXDmgbc0FTTWjOq8rOma5vxrtE5ap/+y4qaYb1+Y6ZlN3bitcPLn7zXR0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(22082099003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1dVYEjL+cHYl7a8CHQp3qg0zOWjVho2+5nFr+eY5SlKUSZn2FO3WIgVsMYnx?=
 =?us-ascii?Q?1BuRPL0lFCFSvhSGR+WGkIOG7WlcMjPy0WLBPmsMFktU/tRuv0hlxMmd5EDH?=
 =?us-ascii?Q?HtXc2fXgDM00OQ0/N+MpWrujrZYDObBqmvWy9gXL2F/k0jcDBzbTmX7boycO?=
 =?us-ascii?Q?WP8E4qGTppcRYzfXzwm+s/Ly8qa0dQwieGd4pJC33bb3PoS21ritu6eglbU+?=
 =?us-ascii?Q?Lb4B1jyJKkRwRl+uJVruUDpwgL85/E+skn4nA+UThblbJrKzmBiQPoBLjtic?=
 =?us-ascii?Q?a4dDtsgkTRFckiVFe9dh80CsYtj2BXM6vKfLtEnAA60wZju5PIMVOBEeOk2F?=
 =?us-ascii?Q?xcEcokPvMhaHPmpokT3vAdMuYNTpspdUmR9zrVA8xw19ITMLIRnQOGDDctIp?=
 =?us-ascii?Q?57mUAiBUMDFPJAokEnTbTXr4kYsshOhyF5rYvdjBv8DxfmX0OyuRwYwsa6pr?=
 =?us-ascii?Q?PGOFKeZVm2gFvTwtEzEeotaxi+jKCG+NmM4G0vO/clp7NpUv5kq/7CZxocHH?=
 =?us-ascii?Q?aDcbuNyI2hPczmZNh5MR0go3U9EdDfcrr3pF+Ra3LZJWs109SU1P/A5Hpizm?=
 =?us-ascii?Q?kjCtjyr2Rh04Nb5SycILhvodlDunqyJgvU5Rg/+ByWNY2MyBLf8aJgMlllh9?=
 =?us-ascii?Q?xEYtEzyCAF6OIrV71Qktf/IUHy1U1vcu+oHWCSTfy6cGAT0VWV//bCy0cRO7?=
 =?us-ascii?Q?ZuBWFFTsMkq1WJfDcyzl+udNC4JyFAhpUreJCYApGcHszvlL4RzNDQp/YFpJ?=
 =?us-ascii?Q?q+CTjFvXqGpRFd5XnqMbsbjDuq+HuNQvH/CwdyUlr7bL+foIMbRCvVEqnXbv?=
 =?us-ascii?Q?a4KIcNJic6nSuMJAC5VUsXaz4xNv0mqdClHoZ5MF9Xd+vl5tepfpzr10k8BL?=
 =?us-ascii?Q?Bv2eofuVekTnZHTXD/kPyP2rh/7T68E881AM/si2ARUawq4Oi4h3+CAVVj6A?=
 =?us-ascii?Q?q5LFQABSvRjdDT5uhf+/5aVxzqb61doCZFGQ1jCs/6w5F/ZmSFX+Tzra7ktH?=
 =?us-ascii?Q?3IfTKenbooXJ8zkodd1EfJGl4gAy/f1Xb+D5m/AldrQFXLkjrPclfoZWdF6e?=
 =?us-ascii?Q?lbTK7GpeIWVKR7INyJwkFNb9PwtrZsXN+4pLC+EokOtmLxKBSiCg4gO9ESs9?=
 =?us-ascii?Q?V5owBFL4x02Mf9OQczhuLgSKc8GqfhIgtmMXo0/XTfGUuVHy17n4GCQwXTg0?=
 =?us-ascii?Q?TsOdUCaROZvGwU2UtmbU0iX6D7E0Fv3HVxtFS6ct0dPo64zVUshPg7zxYp/G?=
 =?us-ascii?Q?z27x+BU/GJzs6mbuclnKtStAWwk2Bj83XzebDbh20lM636N8Hv8rDB2kK5C3?=
 =?us-ascii?Q?CHqg/xFkgcrm2n35wO2y0gO/DTrOxAXc3FDqQO4/eX0rsmuQakSDD2I3xpLw?=
 =?us-ascii?Q?+elfeA+RXHiLTRSovXCeIDZnz8F4/N2h7E4R66M7hjT8f8GPciLg5RXT1kOU?=
 =?us-ascii?Q?8QXIB22SF0nr32vEuBPf6QiuCKhFj4am5BOBJ3xmEaxXKmGH/5cEc4Et+PK4?=
 =?us-ascii?Q?sh+lJoIAE71+y+2bXa2EK91NgBcg4UPvBtKt5MjTxMGkYuxBnTmcYINpen3y?=
 =?us-ascii?Q?ZNbvDVlqP2srKUmq+xj45HkzKJv1Jrj6Gbm4BQ/nVXPmxZZHN68lJD0kJfKc?=
 =?us-ascii?Q?gjAnveolDMFWf19YmIKT7OkY8iMiZb8+iXZV8ZwDOku6zYgcBuJ+os6W1bgz?=
 =?us-ascii?Q?k3C1+sL59tx9VbTbun06pKJOHO9j+Gf5Y620KQmBntiuRKRdzXMA6c5HR+qz?=
 =?us-ascii?Q?XYUpkxLZEIZ2SluQJgG3KRayv7uIiok=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ce7ed2-7d22-49d5-c4cf-08ded3216b9a
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:22:42.7185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUN0Y3SD70M+hf3oTmhWyDXFkavd41Z9dafghuXf3X6a477ckrv/VGCEAs4U026paHBBj5Na6FywfY0O9e7juE1uyyg4XHzoHG010qbv5Ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2955
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65688-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E91DC6C96A1

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Decoder instances sharing a VPU also share one v4l2_m2m job slot, released
when the running context calls v4l2_m2m_job_finish(). While draining,
device_run() defers job_finish() once EOS is sent (sent_eos), expecting a
later finish_decode() (from a DEC_PIC completion IRQ) to release the slot.

But the m2m core checks job_ready() only when a job is queued, not when it
is dispatched. A job queued while draining can run after finish_decode()
has already moved the instance to STOP and sent EOS. device_run() then runs
in STOP, issues no DEC_PIC, yet still skips job_finish() - so no IRQ, no
finish_decode(), and the shared slot is leaked, stalling every instance.
With several v4l2h264dec instances in parallel, GStreamer hangs at EOS.

Track whether the run actually queued a DEC_PIC (cmd_issued) and defer
job_finish() only then. Otherwise finish the job immediately

Fixes: a176ac5e701f ("media: chips-media: wave5: Improve performance of decoder")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../media/platform/chips-media/wave5/wave5-vpu-dec.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 93f7b724d86c..f33c00cb801b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1655,6 +1655,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 	struct queue_status_info q_status;
 	u32 fail_res = 0;
 	int ret = 0;
+	bool cmd_issued = false;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
 	pm_runtime_resume_and_get(inst->dev->dev);
@@ -1752,6 +1753,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 			inst->retry = false;
 			if (!inst->eos)
 				inst->queuing_num--;
+			cmd_issued = true;
 		}
 		break;
 	default:
@@ -1769,8 +1771,16 @@ static void wave5_vpu_dec_device_run(void *priv)
 	 * in power and CPU time.
 	 * If EOS is passed, device_run will not call job_finish no more, it is called
 	 * only if HW is idle status in order to reduce overhead.
+	 *
+	 * Deferring job_finish() is only safe when this run actually queued a
+	 * DEC_PIC command (cmd_issued): that guarantees a completion IRQ, and
+	 * thus a later finish_decode(), will release the shared job slot. When
+	 * device_run() is entered with no command to issue (e.g. a job that was
+	 * queued while draining but reached the STOP state by the time it ran),
+	 * no IRQ follows, so finish the job here to avoid leaking the slot and
+	 * stalling every instance sharing the VPU.
 	 */
-	if (!inst->sent_eos)
+	if (!inst->sent_eos || !cmd_issued)
 		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
-- 
2.43.0


