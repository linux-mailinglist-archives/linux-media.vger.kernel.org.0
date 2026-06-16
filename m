Return-Path: <linux-media+bounces-65052-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HlzFDUeEMWqhlQUAu9opvQ
	(envelope-from <linux-media+bounces-65052-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:13:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF76B692E1E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:13:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=vUPHrVrw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65052-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65052-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C293310AEF9
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3DA47CC6F;
	Tue, 16 Jun 2026 17:06:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CA647B432;
	Tue, 16 Jun 2026 17:06:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629606; cv=fail; b=cfgjuUOreZxReyMuShX5b/sU3tXSSxYHiYjG9BBZUbP9RI79ESM9jx+fPX6Y6LsenT3hBPnBc8QxFRn3p08Z+czqvs98TInZQ5DVQUG66PkCXp8QnTBz2ceSmIZT23rqPiT6eiy5uvJSB6v2gNtsIjOHrrZt3oc3eyTPOedMOvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629606; c=relaxed/simple;
	bh=8Y6Xj8kr/m6kSu751X3Be4cXJ9sWYAeBwl4KQtgwJU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GAQuBNKBOHf027RCu/aOJY+HdgzAJzMo4/3xOM0IjDmlgh8kG3jBqHEcpmYvidczdU4wYX1XwAM21IFaZgBiJf4NUxJSrL604I4TqphztngM341OaIW3OdGyOsc8oEk0i0Yl0xewX118xImY4GNazAn6+B51oCIUK52dyipz3As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vUPHrVrw; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/QgdD+5zWpBD6J1Ek0uTzyvnt0Yr+L+4d/Df8n1cUs600x2duv1z/8iUA3YC7W08lTzdDGlGFsueWPQ2vJ3T834vVvZNhyvfgnfmxn47if9k/+fDpFNikZpUVMoXaAI7X9ewa4SobW4e64aKRXPhsN//1iNEhrQJCG42FGISwO8UkJM011puVP4ueFlVYSORk7FAH3as8be7yFs9tMOTMRfcCt6n9FOZjzg+27PLDmvYT1/uoDdtd1dRa5UKpXEUnmynVjsvTqbrkVxxIBgen3NdYA/T+IVZqMKJRnP/XCLjkrhIveY44b4Ns91EZoLyVzuQn7lqkeahR0vw/cDMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqT5NM+nTVpc0A+HdkaE6pzwFfHTF3Ak3ydDaQ6I/sw=;
 b=FuKYM7qFuqD912B4rRUzlDjHXoyyMxFzkVHSQooODYhsLunlffmSvdxHi1B/L6BpVQgMZjxyBWBvQ6OiNwcgxmXTAYNmwrzpfbII8gM0JuzCZxuu8MXUKJBtD24Ac9R7imMGPxXxM3Q1UfIuSGFU8xsV1fX9eqEsg9eZ0ChUdW4n5qpybgG+tnKEn+2gUQbH8rHiYx67DyvsM21RR9KvY37KBX+dQ05W6ZbcW9MMXonDSr4QrxQ1K1uNSt6SguDXCNxF/7m+6nY+sXlchaBdxWugPdiQkzzSB4VM5A3qQYC8kvPvzsOccQBWsS+PoJ+4lmI+PxD/vuHbIkvEFVsYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqT5NM+nTVpc0A+HdkaE6pzwFfHTF3Ak3ydDaQ6I/sw=;
 b=vUPHrVrw0j+gE6zpXy9nU1/kjPlWwBeHwRLPpEEm3iGP0b7vRkchLD5pdZ7tWmQg/QGtcMMlyxOnSqVeikD/1KJWIFGo3Sn/wrPvaUe1+gZjrxIJh31amqIah9ItsFCeqHm+IVNubWGeQMEQ39A01iEo1MD7hUB9rKPhHa/no7g=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9637.jpnprd01.prod.outlook.com (2603:1096:604:1cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 17:06:43 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:06:43 +0000
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
Subject: [PATCH 3/9] media: rzg2l-cru: Use bulk reset API in rzg2l_cru_start_streaming_vq()
Date: Tue, 16 Jun 2026 19:05:33 +0200
Message-ID: <20260616170542.447804-4-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 81183013-8034-4864-090f-08decbc9a3d6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	a83x+5D3NpF4LN+g1jH7AS6uXvJzyZ87qEfNpjpjHHlpKfS57tweZ3hsIUBtjBk/aMxXweiKaXJID/jxIZouPg4sY2u+f1CuKtLAWAmbKLVLQS/yFSKmKXw6rNltVP9gCJQ2YMH0oMMSbF9z4Tzh/cHiWF7ERqbhFpHkV9oEO8NzDxMjHTksm06CAuGRq6WsJSvg0Qo2meFiAixs7lx5bi7mYQDRPbwE/1++YprPAD7GZ3ITqOc2fq0W2xl0QYettzdwmQCxqOtZMKeNx9HP1nFlq1zOXpGeXvmKyqhcA5xsGHNmlB+i0bAUTzbhrl2a9x/91MADvSKycZPuIKmBb6aHC/H7qB9W9x7Xrs3smbKgpi0+Onzum4vFZqbztYSH+yftPJpa8alSxzsyVMMYpPyosaHG+x0A3dExmieK5kD/+3XO7l+CjdXnPet/tc3xdtcn+RepSsxklVytx7ihmRSIlm3O8Xjn5Ad89bBKKtCumGTY2CWfiHCHDJXbPVso9qJmNnVv3r9kSuP0AZ8Rb12XB+1wB8SUhF0BeE6fyWnCNLZESMCtskf1TesekJF3dh7tKvDXujnlzwbBubp00Jvg7J/D04ejzPr+1qstlE3NgZqE1x5776bthMa4Tju1XF6uSsSr+7KdNLrczope5YN8YVRqsbfn/+Nl8ts7vrlZxJ7ihHAcQQhfgbhMRmAV2hflqQFHyDmPW+T13n6701mZFXA1mJiMySXHvn76X6dOWZnJ1E2TdKeagwyDRlJQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+OpTH9vqS3qFIpmeLHO9hqovMXhgSgvxmSAfLimxdvZh+MuvU/NGDLPBtjR8?=
 =?us-ascii?Q?ODCRbjZFzp8yQFnoqVRs37hqXI4h1Dwh8SQcs/LVA6Z6CpxnqQWzxDJ/8FTC?=
 =?us-ascii?Q?MrfKCG2iK6d7NRZE19wLrBAWXtpj6Sshu3WASLeaC8zgRAvIjSaG68e1T8vj?=
 =?us-ascii?Q?8qWUVE3ihds0Ud0g6dYj5Kqp+GTnCOqNue4GgPmu1Av7nuOa9Lc1GTwuOrOS?=
 =?us-ascii?Q?d+gYseRXf35MmZszOZaMfz9qYFQ8pv1ee0iffALA8ZCudXjPZFvqgwQ2JPh2?=
 =?us-ascii?Q?9Cbpny2GeLrmQfP+EEP6Mn+mBmBHG1mdZhwTdIKOYULv/Q7qsxN69hXaJo1m?=
 =?us-ascii?Q?PtTR+1nJaWdGgILUWbwG9e5hAHmmaZvEjoJZBhVZiq6ZYxvzCVoUSusPxUWs?=
 =?us-ascii?Q?pV9wUAoHDX+mUb1On41Pa/zym7Mq89N3SfMJYVEZ+Agd4+VXCFOflJNbrG/8?=
 =?us-ascii?Q?qaN6zp/rbtLa/6vCVZkG45GvZLKHg60ogseVbbEw5NWVxeD0Eorbt1OsKxsK?=
 =?us-ascii?Q?BeKfK5l4sAPw0hBmGdQR/wrH4vn19bXq200Ic5fxux1hmIsoCgqPcYIR3wfw?=
 =?us-ascii?Q?7v9n9wNwkhZ55CftylY/m1MzRwax3Ij1VV/d796HWJ9uGycPyN9av1/KuAd3?=
 =?us-ascii?Q?iaCnfzy2Svx9LXQXNRw8xV6J3Crh3jbSHLdTKNQtuptzuhr2HI1SDhAfkQty?=
 =?us-ascii?Q?jpeC745s0sEMJRapyGjHqp7pStiNbkHIRJPTa4zefg4dsTCA2VC6r0h6T3Kq?=
 =?us-ascii?Q?0Dnzl/TvIkIafDlTLsbJ/w3a1uW8xNKiY5HJ6qIYjzCJ21rdjm/P8rms5L0O?=
 =?us-ascii?Q?kBx8YolH60SmCjZHSiTQjYs6evclvx6qbkKkel2cVpOs23zq/8kaRWq0vTeo?=
 =?us-ascii?Q?SB8N1CybjW4bcIHuZHX3ImnfVxU6DVrMgIAo0XS8LAYsjd/yyL96ztKdE5oA?=
 =?us-ascii?Q?TfnNqdr3VIR7r4cyI3lRRAUOHKf0SYBRyh3Ur4xHhn/z7nJIxi7OqoZgCU+c?=
 =?us-ascii?Q?SSW/KIsM7S61aDBktNDXCrhSvkBD7H2CTMXTmci1WXLfZOwakSAtP1iGmGR4?=
 =?us-ascii?Q?/xa2/4TZXYaIP+kl3XCz+gEokXtwC+oYgjQa2cZ9IvmmWTqcEqs9TrGw2Pq7?=
 =?us-ascii?Q?aNHshYDdlz6xmvOBu75m9ivwu2ggLRDcI6J8mYhh8pSugfmC3xzZZrxWtvMi?=
 =?us-ascii?Q?Xy6XkfQ3f4ECEFLHOcF9VkccU5fT5MhIA2m8/c6nK6WQyaXZahyeGg/M3uWr?=
 =?us-ascii?Q?zIOdlOpvNmdnKrpamTpGiGUyCDCBcRrc0INzRhjyofPS0Vf8yCykwDxXh8AT?=
 =?us-ascii?Q?PoutLtWEk9UYCR8FLNxyWVyKY3sBMPh6KY4LNCtVGiSRt/2IaQZoDUr+XcC0?=
 =?us-ascii?Q?DulFvIqaGl14VZrhnMKKi+aWajT3cnCp8T2CymwhDrdlTq/k+h5N2MLRg7xx?=
 =?us-ascii?Q?i0JAEr24JKxCv2XugDKejy4MmRfPIcBJ45RXC4joFrfi46H+FtlYxUw5Oxnr?=
 =?us-ascii?Q?X3G6ZDy65DyvW7x4+vedsZzXOmmVQsFtSvAoenD3T8HecaR4ntwQa7Ei0tSq?=
 =?us-ascii?Q?b5s5fETOkRYlITk05/NCrws+ZghWRxCcXmz9D8mwipXRQ8B1RezVsvkugEo/?=
 =?us-ascii?Q?3DR9VDs6BxTADYUIUGXsjZbBuaJLyvRDL+RorufAiFr2sRp4qUGcpRR0Kxq5?=
 =?us-ascii?Q?68naJDwQrqBHRWhm9XHsrgwkZXfF/HCq8X43t8JIYKQYBEMvfSMclGaDDwF1?=
 =?us-ascii?Q?8GRQi6E1loCPsKNQFwCcbXshNnPFl87Ky06WNq3AeCdb5tkVt/fW?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81183013-8034-4864-090f-08decbc9a3d6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:06:43.4411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dlcdSYxc4DzE4D90AAWJAobdxrUvN2g4wft/t3t8RyUVp/6f88xlr1DpdhBngfd9Plgy7IjagIyRWEppvE+O6XnhqyKvH20GYQsrrv7DhP5jRHN3Jo3EyyWpJc1xcjh
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
	TAGGED_FROM(0.00)[bounces-65052-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF76B692E1E

Replace individual reset_control_deassert() calls for aresetn and presetn
with reset_control_bulk_deassert(), and consolidate the error path labels
into a single err_assert_resets using reset_control_bulk_assert().

No functional changes intended.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 23 ++++++++-----------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 5185a547461d..bf61a74f8f74 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -672,6 +672,10 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
 {
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = cru->aresetn },
+		{ .rstc = cru->presetn },
+	};
 	int ret;
 
 	ret = pm_runtime_resume_and_get(cru->dev);
@@ -683,19 +687,12 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto err_pm_put;
 
 	/* Release reset state */
-	ret = reset_control_deassert(cru->aresetn);
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret) {
-		dev_err(cru->dev, "failed to deassert aresetn\n");
+		dev_err(cru->dev, "failed to deassert resets\n");
 		goto err_vclk_disable;
 	}
 
-	ret = reset_control_deassert(cru->presetn);
-	if (ret) {
-		reset_control_assert(cru->aresetn);
-		dev_err(cru->dev, "failed to deassert presetn\n");
-		goto assert_aresetn;
-	}
-
 	/* Allocate scratch buffer */
 	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
 					  &cru->scratch_phys, GFP_KERNEL);
@@ -703,7 +700,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_QUEUED);
 		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
 		ret = -ENOMEM;
-		goto assert_presetn;
+		goto err_assert_resets;
 	}
 
 	cru->active_slot = 0;
@@ -722,11 +719,9 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 	if (ret)
 		dma_free_coherent(cru->dev, cru->format.sizeimage, cru->scratch,
 				  cru->scratch_phys);
-assert_presetn:
-	reset_control_assert(cru->presetn);
 
-assert_aresetn:
-	reset_control_assert(cru->aresetn);
+err_assert_resets:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 
 err_vclk_disable:
 	clk_disable_unprepare(cru->vclk);
-- 
2.54.0


