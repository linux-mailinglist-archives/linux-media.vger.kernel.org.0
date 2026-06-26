Return-Path: <linux-media+bounces-65683-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IRDvLp/UPWqf6wgAu9opvQ
	(envelope-from <linux-media+bounces-65683-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:23:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C7E6C968F
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:23:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=DnxY7cm+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65683-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65683-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A38733081757
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 01:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6882EEE75;
	Fri, 26 Jun 2026 01:22:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022102.outbound.protection.outlook.com [40.107.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBF52D47E9;
	Fri, 26 Jun 2026 01:22:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436971; cv=fail; b=PkXqdGdZlS67P76Qd9FAjprS53Uciv4t+L+f5To9PYOGDwHFOhz0gC98ixmLtj3iGJMXd0NeaC+ht6MKSYSi6SrK1RZX9ZWk6K56MVTDgG3aFLq5ULoRvLe0u3+ZGcwWNvoxBPIzfyWFUp/0M7cYtjwujdVD6AYAKb8oohgLXKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436971; c=relaxed/simple;
	bh=RirNH49UW+bXy5/vMq79LZB6AvkIEvGnQX0UahgYpP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hTEo2g3oJMyqljFCdRionx3cJh5ok5IuGuPQNLA69wYpC7Jb5xgekTM5DaRuh2SQ+jE0KcFxSYbrQPlqLKBu4tHcribFMtSidGLnhNQX2yFk75w3wfpgc/Mw7vmPwJGrmAFmhNw2Qa4p6ngscO9+rNH8y+XYeskAFsSZpe9KT3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=DnxY7cm+; arc=fail smtp.client-ip=40.107.43.102
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APPn6tIuRmYFATQQOZRVQ9OziZQ/kuF2x2hwDk7CjMly5NkXbS9C8Kz6cHHx/wKjXvYbyig3B9XWW6W9/4zSGB1ZPLaZmVUU5C4he3TWon2PT7OHFZELv/6Av03Rl9pSPqj0+KtJWLyFLrSNRdLfOQHr9AK/PD1UZM7Q1GTVymAqlCEB8wWlwV+ucaif72VFuC6uaIUcwTcdrdYf58geETwJQUBxKzPudAM/leLW6ov5wdXpWzA2s0+n2VI58XWsn0aqOXz4ww0dplBfGfo77NaSphGbZLSdQXmZb5RzrZcc67IlNgEx5ydQA8sV/78F7TrlFGw/JaytH+Ck7RSgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wn4mRuJ3R8p45Lzzmc1641UusFM5Qf3gGwtwyTAwyuw=;
 b=H6vIA7kcl7J9CLu6sjhWqPZ7mavZOUTPo86qhJtwXO+Ctavu6SEs8BAt20KVHLehAb+vB/ndpctZY2oWLKCRl+D/MJwTGpc/ejO9ctXV/GhCXNJrZlK9eWCeAOIvH8GqDBrXVqtIeHGma6KYPBeO6GA5Tvc5tLOOf0+9aHtQkfBZEZoj41Rc5AncO9bZ4mehVj9bpnUdHf6bDP5J0vvE+otF8lfnvgh52mWiIjW6CExSOJRyHoAwfqX6AW/4vbxfmyXMjYBow78QW4VmQz/YyO6dojSL2kyW0rrZgoko5on1BatHCWkffyVx7BGi81MDnW078E7kwJzRt6JX+m6xgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wn4mRuJ3R8p45Lzzmc1641UusFM5Qf3gGwtwyTAwyuw=;
 b=DnxY7cm+PvoOEATkDXCQiM5Sd5QVmLizyQSfdRWirvbJ63VjknNotJuanZJ8VvrQAarqJJ/AJyEiNIAdvnUW06/igIFe0hKBntZvcg1rmfylNj6bPaLHymQZXdxuQcIRvbG/vujVTcKbw/EusLdYLynks/zDc+8dyV7jDocxOtY=
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
Subject: [PATCH v1 3/7] media: chips-media: wave5: avoid skipping device_run while VPU has work
Date: Fri, 26 Jun 2026 10:22:28 +0900
Message-Id: <20260626012232.111-4-jackson.lee@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4285d457-a3a3-4df1-444e-08ded3216b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|5023799004|22082099003|18002099003|56012099006|3023799007|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info:
	6v74zJzBZr+YvmgqqqItgztCg/VowD4Jk66HaFdlRDQ6b27RA7yMo6sbn5Nde4bIj2d01PcmstyLtOyOffFrNFNpQ1M9fNlua60uYgmpWxgTZYIE5nJUcgRvPc23wv2dJrhShJ3pNxB+YghCR1+2kkh+BY79BpRBUBdw/7pPOpw8+8nUvO3dV5X4sO0ZiRGqtRmcu0XJGO8Hg3H1WQaS43vfJag41KcpJagKmBvrGAJ+DR90darUWxPDry3rENCdo4O55Oep0EKZW2rjKnlVfBd996Umbqk2u8MqUhQZ9FO0jm7X+7ffqOoOetvT0K6w251OQUc1gkOUwJtdGsFSpaqZ9BEDM9u3As4q3L8WlejhdMz5UhtoRcVFDQndDIYhUsfJv87CiDaU2KV8qqqbmS1v5yt6LZpM5rHfLKMmYJ8CX9dV8fUK5p9LO4iI+qlNoiZAHlIyQFLpY3pnC81lH5PGKeaheSORg09MtpzZkkfsfCvi0IQWnFfq76HmMVtK0kOWWd3jAB3KYg32g+xqrCd2+AsfFq/g2VDcN4BZMDikGrbFVyvL6jpQ3h3wnoR+Ly/DM9oo5Sj9HJF55c9mDeX0I3UKp2jKwojZUdPR39zbhreH6cahLChQftlev+YrR5cN51umOaU8lLEDuhy7TBRSF/hwFHCwCrwTai5RqwoUuwcCVA1D5p0N55EKXACJ1mFFVkimZqPve4isz88UbtOyM5+atsZrH5O3gJJpxm0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(5023799004)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fDt0S/rC5Ygaq0OaMWxqUsms67qRw5L7qw7jgcqGcwjkmIb+RX4w293QsFWQ?=
 =?us-ascii?Q?A09A81eHL6KXi9IY2wTYv+BMQEawehbURZgwms/Dlyqn48WxgrcYnDB/1q85?=
 =?us-ascii?Q?AmLp0MiVFPu8FSm5LbkcMICzkG/TVBONasltxjyd6lsJLg4IOWoKVirqgWgC?=
 =?us-ascii?Q?iS8+lCq0C/f8N8lxx3ErPHb9yIEGpzA2r616JCIaayq17kh5BqNAeyn4YadX?=
 =?us-ascii?Q?jdXlStdIaSeVaAC1UdJyKJxb5W5xl3c+OFzovpNxj1vhyHc3b56Rl5fszAty?=
 =?us-ascii?Q?zDGs61IPlSE2njX6YSZUaWoTpOmCcULH/qlZxSJ62cydzAGI+HK2VrOUavbo?=
 =?us-ascii?Q?zKK2e0yBj5MbYZ9W8l2BlJoTXkkdxrvNxWhvPhyyP57NKfReW6irsW2l1Nnp?=
 =?us-ascii?Q?9U6BLxYWYczKqfbk4Ow0oHy9ussTkQGbgm4Z/qLMrk6aV/AYB8a3Avfsipnt?=
 =?us-ascii?Q?PAujwN41AIFDZWb0tIzmn7D1aJr0jL9vslyIBNhBIbngZES5S8LDwLjzRQhA?=
 =?us-ascii?Q?GBc4FGJvmX04zMo1kwR/n3KEh+LPzUYqzzl5QquvPrZChet5jcGLxctzrGmZ?=
 =?us-ascii?Q?B1ZyBsMiHccxh8r/xkru/MjbGY/eF9UgYKXxyqi2GCP/DUpOi1x6NCHUX3Ry?=
 =?us-ascii?Q?oJbBjdskhGxqijLraFOnZeFUeoPq2/RzZxiI95sY1PaBmZPXxpFvOr9wvr+c?=
 =?us-ascii?Q?Y6lqqbg0atI/L/1qMYWSZN1I1ZIFHMzibkyoR02UDLbFPSiEnvAwUBhNU5UI?=
 =?us-ascii?Q?dvnwB+kHh2SMhd2xmGSytuoXjrWfIi80OjJTMC4SU0j+gAEqWnRZFueMNH5e?=
 =?us-ascii?Q?suYqH8sJNG/B+jA3sgELIhQh9dFX7Wmv4FNY4LeohfHYxBVtHGysfSXuzzw0?=
 =?us-ascii?Q?p0XR46RLdszKphVGWCne2FkawE8nMLvZNS/HPwS9QEcbT7srZGXa6ig1SJrQ?=
 =?us-ascii?Q?nwtceKLIeeApj8le9yZyGoVF8w134W9WGrOhSoIK6SCGTHWViEjCEvh5oZ1R?=
 =?us-ascii?Q?gvGngcuJqALxADHZLoJOOlJpnYDXhRbYw7fKpeXlVB+i67/Vz9HdpY9dLEoX?=
 =?us-ascii?Q?j/QnQKkyf/hwA9HJ0qzY4N/6K5M7QjaUyTjqC1RZdW9N+Q9ENo3/46LNesOz?=
 =?us-ascii?Q?PfoH+frvfI5y0iQxbiyytVDA2LVotKPRh2K/YOzpk6PyXHq/YJS6nkZrC81i?=
 =?us-ascii?Q?0v8dei9qVGWPputZIlGsMHl6ugkhr/E/ueIVZ0ibj5F9u9Stl6loAItRcWyA?=
 =?us-ascii?Q?Y8QXlaxfD6X2q28zCLrUobDbGw0loVpBERNNw981cAB/3+gWWHg2b9tB0EzP?=
 =?us-ascii?Q?jYn8nK5UmeR3hupjqt+Qx37jKy3WV6QYV6qAcUElT+h5YBPi7LETQDVdtaV6?=
 =?us-ascii?Q?pfo8jTP4WJo/llEhW2YlAtGYtB+o8YBLpdnwbjGi8N+J1zU5EaEA5GPUtWZ9?=
 =?us-ascii?Q?6Su789FqN31liteNpo9efH0Tw8iBGkQUGbY89YXFEEhVZtYuR7KGBZoUSBMF?=
 =?us-ascii?Q?WKfmFpDz4z2VpYQlZ7AteiIPFE2y0uSc/xnx6kONYOcf+wYOxpY3lPu4K3z3?=
 =?us-ascii?Q?/2AsBR5meknT9JrMne2r75a3NDGrm1RPscALJEx0Gpmla/cbaBIKjDjLcevU?=
 =?us-ascii?Q?q6sS0v0E5RHs5OBw924Sae6uwmwersbu0S5+tgEU6joQZVpwL41e+gT7RAQq?=
 =?us-ascii?Q?HxEB2jlsg9382jfvXGu52FL07IG4cxpaqeq+JsMaD9v9L1iryYWgEAdrQBOD?=
 =?us-ascii?Q?2vokCWEIBDdA2jyruWs3GZ3fMMd++o0=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4285d457-a3a3-4df1-444e-08ded3216b41
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:22:42.1062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0vZxITZz1dDW8ahONccq8TwyVoiT5S1dHiV2wmRxZbEcZOlEG/JpBhCFmTVxZ2rkPsLR15WXZm7ZASMl93jbbMCqccLSprngx+3Xw8cDNE=
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
	TAGGED_FROM(0.00)[bounces-65683-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41C7E6C968F

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The decoder stalls because empty_queue is set to true even when the
m2m context still has pending commands. As a result, device_run is
never invoked, the m2m source queue fills up, and userspace (e.g.
Chromium) can no longer queue new bitstream buffers to the V4L2
driver.

Fix this by querying the VPU queue status via DEC_GET_QUEUE_STATUS
before deciding whether to skip device_run. Only skip when the
VPU's instance_queue_count equals the number of ready source
buffers in the v4l2-m2m context, which indicates that there is
genuinely no new work to perform. Otherwise, proceed with issuing
a decode command so that the VPU can continue draining its internal
queue.

Fixes: a176ac5e701f ("media: chips-media: wave5: Improve performance of decoder")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../media/platform/chips-media/wave5/wave5-vpu-dec.c   | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 01d1368b2965..6c6e86b09b40 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1663,9 +1663,13 @@ static void wave5_vpu_dec_device_run(void *priv)
 		} else if (!inst->eos &&
 				inst->queuing_num == 0 &&
 				inst->state == VPU_INST_STATE_PIC_RUN) {
-			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
-			inst->empty_queue = true;
-			goto finish_job_and_return;
+			wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
+			if (q_status.instance_queue_count == v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
+				dev_dbg(inst->dev->dev, "%s: no bitstream, skip\n",
+					__func__);
+				inst->empty_queue = true;
+				goto finish_job_and_return;
+			}
 		}
 	}
 
-- 
2.43.0


