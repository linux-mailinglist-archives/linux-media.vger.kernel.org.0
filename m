Return-Path: <linux-media+bounces-65056-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O4ZJG6SEMWrJlQUAu9opvQ
	(envelope-from <linux-media+bounces-65056-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:15:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3415692EAC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:15:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=sI4EyMTS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65056-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65056-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FE9E30B844E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3CE47DD78;
	Tue, 16 Jun 2026 17:07:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B6647DD40;
	Tue, 16 Jun 2026 17:07:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629624; cv=fail; b=TigqelZ04VhUNZ6eqn+oTACWL+8TL4ds+bPl9O8CJyZ7G7fX2jFVkofsCibSmFdj0qhwRnnLnPstVXpyRv+tY2HN2hLt1f2s8lYLMsGpa1K5SRjuRepfigNP1wI6cut93W9Be8cOCwlS4Po+/P0ZciwztJiUqnT9m+ZbaZ0dwfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629624; c=relaxed/simple;
	bh=qFNygre8dqsgbq/Dpu5zH2IuJrKVvDTjmORzjOhKbLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hA9R4XAUXSucj2K7McEOMiv0YbukSrEItEJkhljdaH6xr2Y7HYpsz9OlM9+htREU2j37AMTqHSzN/JNwA0zYXQMbziciXCbofIeTqoUOTbelwbQzP+ycAx0ZdD3X/svTWbYmDg/wpaYtYXQRMl2Fji0IoGDnymDwboos2u3GWxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sI4EyMTS; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUOWKnIxMJqiMVSDuQCPhI/pJ9qm23JqgD2fPbpdFpdt5RfvlBSYBFZaLLMsARFDLAPcEeDn+d0zZ34+SsJ6D5LW+TD01EPsoJvz5PAYyP3zYPg+Pg10b6kKOvYhpm2wLIVTyxRGhZOId34qruUmQMpnl2UXiTCUATN+whPfaLpFu0f1G1hF0HgbFvVKuaZKmEF3bHfYm8Gwxoi1ph94bk6J3CKDaEPn0OEf8WgLVIr8WCASbzquEz7TNatVOzpMCcXocEicGw0SkXb3MAxIwcySCoDkWt8OSdwX7B6kAwVtbDG458GtbcJTNWzYLL6A4VTYO08WmIINWqLLI+BOmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zt17tXxaLYPqOp+vFPQr2kuHSHpPuv8h858XRQdwhWc=;
 b=tjlk45TuztQBfIEPDQkOp5PVo6nXazQN+aO9gLnJAVnqhGWUtBWyAoQxShd2t/IKphpV6EluDVDX9JoYUCWWejwz5ylPMxEp7vF3+66e1u/cEStGT7pxImldiBbk/mYL9JiLHCEi3FSziDs6leOea23dF83WYqrD5Cpak7JGp/w00lBm6raXEpXaLaMorcv1Fi3IMrtumKr0BHDEpFdou0N7Kgw7TuK3WvDb6urx+l1pD5OUgwI4InuxHhePyu68xRuLXY5BZM2FAJCttlq55IgaU4Nk5Bu2vvyNH5u3FURtLXYMOskbbJ/aaPegiXGybDnIJxf6v6APuvUt/ZKrjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt17tXxaLYPqOp+vFPQr2kuHSHpPuv8h858XRQdwhWc=;
 b=sI4EyMTSlU3moPuybG3M6YCvBpPG3OxsZYlSCUlPK6RixDgAEkRpv4VDMF2TxcE1/A7g3VZX37dcWQUxVfGj8zM2DzMCSMjTdvt2NoVglNCYH/EIzUkPkc5mGaeaP87DZ2kU0168bb1VCMkPAK4KHH2MOtz3d9hZtcvkxa5aHi4=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9637.jpnprd01.prod.outlook.com (2603:1096:604:1cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 17:07:00 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:07:00 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] media: rzg2l-cru: csi2: Add system sleep PM support
Date: Tue, 16 Jun 2026 19:05:37 +0200
Message-ID: <20260616170542.447804-8-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0393.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 6078e7af-027b-4861-576a-08decbc9ae14
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	EB+oqM0zHJPCe0YJLo403FMXzPmVGxdPQ5CDoSbSzuZ+ruFBh6Dz+fjX6yayXB8RnU+FpH1JlgdSKUtTnQq97sXe+WZNehdokx03rV5Uykr2ud68yIqRNdUJ0VG3JE4J6j2fywP+Xgew/3skuUAUAcOCJb/Es7p2apy7Mnf0vevkOBZO70kL/ztN/cE1+n/Mrhe3o60bxtdDwX7UATY4qjlmH6hgLu3r1EwOss968oLDTlgi/Pu8zW/Tzl6OSbKAO748L8cT3jxuLsspSTHgmlNouqKhX0ouyi+qFPDcJv12Z2NnkqKFz8zdyJikfc6Oa/EJKkx5Wu/x/D+dK4q3rvUTWVDIKPPiaNs6XKbrUUxyHI/Rp4iQaKuDENGhzFIT4NekDTSKRmtH2tOgmto9hD3YmNq47ErLzJgb9OtbdsYznllqFGya/VXast0x90VrtcX2ZcEIoq30dOts9lmeA3ApXFbr+VUk1Q3KIEPiKz8bWOQBrSrfoKMpKIDZppYJ4X6mdQtV79Wfaq9Q9m1Yq/EHRfaHToEqvv4x3V3oIxgOO6W7AKgLAJQVR7lI99gENLMlwTTaw+lIc1ahxUQmcVT0EuCMJIt8XHSf0KDyKHVcGsG+q0ZPw647hOBn0vbO7hhQK76o+wu4xKxbiF0faQ+Q2sCInBof5wPGJcAknm8A8m4qxgwJmR43hi4ZvZ6Tv0NLsj8J/9uYqV0zSYxHkdIYCcFR8X/8F2LRpMlPF/j6HeTROYbRGkZ6kt/ntlGC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fPTcxtM0LCMkBXJrjdOGuofyr4VMGSKO70tPW76GhfN30tAdvntYsfjrllh2?=
 =?us-ascii?Q?L47PGPMbtrDbflHgqGBZT9v0vuYCkRKn0Hi/YyxIU30WHZfsw6ITwPoacfFX?=
 =?us-ascii?Q?eHcktor5zAGaiDkpfNJOPnl4X4QX5dGNNat2hzr9+9qgwh3g2JV5rP78VtS3?=
 =?us-ascii?Q?N1nU27xU+QKLG5vrwc5MnHHCjQDtXgevUPPNDG08b1Aw4k9BeZmv3vOW/WRZ?=
 =?us-ascii?Q?7Q0wABlU9nEg4fiWcuWAXQOFBjLa9QD56GphodmQTI8SuCo3bp/blSTJQRND?=
 =?us-ascii?Q?tHYilZSd6b1M1T9UFQmtYqxvs9z5GcJYPNW4AaIkWDm5PeUd1XWkQyqg/wXa?=
 =?us-ascii?Q?bOEX8IAv6s/tgIjFL9vrltMZl8maqx8FxyHVN61Eymqw4BOO3ythmwbUlCVL?=
 =?us-ascii?Q?GCjRhZzK9BAwfAvS4e+VNypMXx1k7HakBQfprao3Lp46Y9oSpyka3CURNJGz?=
 =?us-ascii?Q?S2ZN/vpG3MpRYzq3WEmmiG23RqAR7ArI4JCMUAVfJ92Mhuon0KAAahSPOj/w?=
 =?us-ascii?Q?ts2bLmtWGIAIewMsxgdtRZEF5TO+FZYfWKvqHQ1F0oDs+ICoBFusGadsNisX?=
 =?us-ascii?Q?HDU7Rb+ggbS1Sr0avZLEf/zMckc2f43xKzKBJcHyzr4N0TLNHFb4nnOWHRbe?=
 =?us-ascii?Q?dNXjt53YtYa5/Caux6DixqFQSSfXM8K4pNKDeeTrQc0HzlUIEJltNa+OKXkX?=
 =?us-ascii?Q?5am3xnrlXKAAAoH27nDdXradeXeaS80oGmnDnaWdqeZXA2wPzFHqucB/Euth?=
 =?us-ascii?Q?Ioq0781u39wCi85K9JcsTgUrTAZqb84rJGjtPHSTtN6IQ3lYOcM/6txo/QAl?=
 =?us-ascii?Q?yYuVpdkK9ANQrCp+Kv/ZNzU/QeBS9PrS/C7C06Ufaorc6Iz7eiMvIlJ4cchF?=
 =?us-ascii?Q?en8kczVK+jyZe13S2YftqBi7BH+/l7rF02RHP6rQ/SEhnXaBJCfd8wTy173C?=
 =?us-ascii?Q?mpUQ1nhfErOfReoG0syNz0WQHlaZZTHc6tVMSvN03ptut+XUG3EMTMz/wNrP?=
 =?us-ascii?Q?ovViOSVYTA7gMlvX8dX0nVJzTrqbmFzJwRMZ+H5sVujBJgnZMYs9k/yT4+Ly?=
 =?us-ascii?Q?Jx0GU+3Pfk0khUtFwwix+M7pXqsNl0y57zXAKvXShYB+cC+hoRsKcpSjKK4u?=
 =?us-ascii?Q?UAs+hmWF4AZApNOB9aSYFTa0yxBUEjrWDRVZtFnjVvAAFS+7oIp2MxWC/OUm?=
 =?us-ascii?Q?nAFu73gH+pNG1oJQQMbwrqmHfh5IKD610mgbvjjuJ7P+ua+c1m0cSamVTfOG?=
 =?us-ascii?Q?+MzYUpGsxG7IMEWzIlvxpF5XhcgPgXe4K18sKZbt4C+qFHXOqPeGa8JGuSZ/?=
 =?us-ascii?Q?u3zcCfmEu2UHvuk1Wm6FuXtJ1qB1eS4ZRawe+ZxjFfe55v0UOSidKs7ttUzy?=
 =?us-ascii?Q?+gfddOoB7qbva0zDh9MpcctPP82Zf8xmyLTeb5QYiniyzL1eTPIzh74BkDWu?=
 =?us-ascii?Q?XFOAhwf9LhkDd6SrSS6ChkiSeG4AOdghc7RN7c868ZmOCc9r2frmirQCb5Tx?=
 =?us-ascii?Q?ZkNyo3rpf5qShQZJ7wKl9V0lriCazKSIEYHNfE35QkqiQLXaTqRaBF911Jak?=
 =?us-ascii?Q?qFBYzNoMtpS3JNk5n+vcnKpA9+lJ0BP3Krupjq/wzj6cRZESUKl8/Wim2GFT?=
 =?us-ascii?Q?CZwkOM69SnnMnfsye9fNmFh24gRFoRWGsQtQdFaFl122vSaWXN1sUtAMDFxA?=
 =?us-ascii?Q?4QadMhjQFyzOhIebrTbWsFbIgSvJkZyIynhpm0RcLRWO1D/yCrcYMy8zgxKe?=
 =?us-ascii?Q?N8XdHr57iAYyz9OkI0uj39clRN2crZ3Wgesr9cqrEbY4tAV6L11H?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6078e7af-027b-4861-576a-08decbc9ae14
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:07:00.6364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiQyBfRjSDVxw86s9wD+XY3H0rSBhsrbTW21i7V4EBHGHjb0z0Mp/YGCEHEU5OEm/ZL5Z5B5M9vzQtXSu0mDrgFGXqxMWwCb5our9fTt4MAg4vr6yOHlFLQZOwLrCzFh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9637
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65056-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3415692EAC

The rzg2l-csi2 driver has runtime PM callbacks but no system sleep
hooks,leaving the device in an undefined state across system
suspend/resume.

Wire up SYSTEM_SLEEP_PM_OPS with pm_runtime_force_suspend/resume to
reuse the existing runtime PM callbacks for system sleep.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 3a4bc4ef72fc..ae1a1816b90a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -1042,6 +1042,7 @@ static int rzg2l_csi2_pm_runtime_resume(struct device *dev)
 static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
 	RUNTIME_PM_OPS(rzg2l_csi2_pm_runtime_suspend,
 		       rzg2l_csi2_pm_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct of_device_id rzg2l_csi2_of_table[] = {
-- 
2.54.0


