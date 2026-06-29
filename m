Return-Path: <linux-media+bounces-65895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KWlfHRJPQmo34gkAu9opvQ
	(envelope-from <linux-media+bounces-65895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:55:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CC06D917F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:55:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=AB66Q0fZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65895-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65895-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81F1F30008A3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0EE369D73;
	Mon, 29 Jun 2026 10:55:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED0C3630BA;
	Mon, 29 Jun 2026 10:55:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730504; cv=fail; b=jA8xde9aawNKwLnq7u5EhDX3xidYRdo/jGTgL5r4a9EKwyoEoMAlOq2tt1Lqh3BhJAUvcDgYhTdKYeN41rs/KRnqDB5Y9Ipz3hG9AxOczVOI0IwZISXdkaudwovXqvDu1nNz3Qt0/GpRD1WJa7ByggcWZyt4HxwMRzO7uqoAqew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730504; c=relaxed/simple;
	bh=LRzixOfWRQzc1epb/qcqnuo9oLTMJtCF0pcxNk1/fPs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=X61NzDu2f4WKsQTckwAaZ4Jb6Oy5BGB1NXYaG50tQ1qQACWJ9KOXxkmYjLJJdctfojHmdwcp3+wvllIRyirOHZ2WLRtssigVJVGOlE41rLyLK7/A/Z55SfC9Is1P6yTP8kgDL3Qd3r+Q9mY3usHmMhE/EKtim82r/4YEp/m6Rs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AB66Q0fZ; arc=fail smtp.client-ip=52.101.66.36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfAKeuO2BixS7qJ/zSAcJHmCveWYuuvQ3Q67+T1EY8xRFHMW9tOJDOsL8wehlWGee0+0gk7IXgGZJd+bWgEqjpQ+iK56rSipS2iIzzmJzjLYDMr/UYWZsigOm2INGSyyzHugwmJFO06vlsDSjrnOyv9sKSWO8G+jAmTTftKwk/skHnYXF1edVuPxZTZI+Hj6ObfuI6Z2+x12fePh6I5E4KrggBxDZGCeoPfQqwUjv4Sdu2U4IMP3hR4etaLCMKrB91A6QjvKe0QqCnzOT5JJX5z5ZRl6cbSSvuIjRKnFfyVg+vv/UgIAWmyVY/vqIeNE5xoFIbDmRBDW0uqBF6HbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=433s79QuiBdquUivzUKSNqienkbPl38lx7g0+m8SDNI=;
 b=ryz+7NKFXV+m/aO9c0dfN/RHapmJFebs+885RCJwFn/22D4hhw92zRbb92I9lADoYMzdUMV6vgqFPT3Zb3KbkwA5hYQqJXhLEbEft2RPiclDMT7ebdehlqktvPsZFEQcPJUy0NEtYiNqCTVvfyQnCjxBz2HWSv3/JtM3+H3vrEUCF68BG0qxuNXRLdv+4FHrhCQTl1XZGgOgTXBcRok2LFiXFUTQkCuMaOBHPQOszx0MMtWauWjmKf20Cs1GDzeEzDuhN+21zDLyvZfa1/RPhuPu62YPMQhPAq9jjfuaKiuJeOhNzGOdUZIFETEvCOWIpAIF7SsNtH+PQZ1mcZ7o1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=433s79QuiBdquUivzUKSNqienkbPl38lx7g0+m8SDNI=;
 b=AB66Q0fZ+e4B6QASMI/ODRSaTiy4ABnlY7djqKavVGJQPxhl4aWm2iS1IOMxtVMfmnKFIjJAojS5Xp7ctZM1OyPMrJ9y565I0sAhm0kvbiTOAyBoVyQPyh6JxbUOJdKaWsvG/erI+rnSbBaJLC3h+OOUlkXP7/p4+L5iJPrq3lUk7DVUVSWwe+NP9Mq5rEPJsA2Pnwm21/ECp0ZVvUmdiLCwhlzSjk5UC7T4tpjGEm/CS++AWLR8cOM7XfhCeBoHxGElho5nR7FM+MeWC1Uh0SSB39GY9j04lzikRwadifiytRQZwSIjmvaXOtDO9pvGgahjWb4eLZK5aCyqffxcbw==
Received: from CWLP265CA0345.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5a::21)
 by DB5PR10MB9713.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:653::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Mon, 29 Jun
 2026 10:54:57 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:401:5a:cafe::1) by CWLP265CA0345.outlook.office365.com
 (2603:10a6:401:5a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:54:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 12:59:11 +0200
Received: from localhost (10.130.78.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 12:54:56 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v2 0/5] media: i2c: vd55g1: Add vd55g4 support and various
 fixes
Date: Mon, 29 Jun 2026 12:51:45 +0200
Message-ID: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEFOQmoC/32NQQ6CMBREr0L+2hIopaAr72EIgfYXamJr+rHRE
 O5uwb3Ll5k3swJhsEhwyVYIGC1Z7xLwUwZqHtyEzOrEwAsuC8FbFnVdT6IfnO6NfSOxc6MVr0Z
 puJSQtGfAI0jWrfsxvcY7qmXf2RuzpcWHz/EZy733Zz6WrGDCNKIe2mpsG7waT5TTkiv/gG7bt
 i8YBB6fxAAAAA==
X-Change-ID: 20260428-vd55g4_and_fixes-97dc23b6f266
To: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, <stable@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|DB5PR10MB9713:EE_
X-MS-Office365-Filtering-Correlation-Id: deef7077-7f75-40cc-6b20-08ded5ccdba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|7416014|376014|36860700016|13003099007|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	uAC3LtC9tF74UAb0VuJMCNGHepzjuSj9EDy+e6uGbflfxIwSClWsj5zxdIzPb3Qb0Gzi54Y2q+cLl2G3anTsIGA9SyoyUdyiQDacEUGpcLGFB2VRxlPK/sP8aF/5U4P2gJpyGZFaseKCAJMA0zryd2gjx2jIU6g6GXA5B/qz0f9CkfXrvb8CRjeLudEATxSlR/U/FnS0uUFNHhMcxuf7dUZQflVZDJa6AfCQgFNUgNlLEsLkHnzNTB7JeXFZB+jHLg+UpbDmm4gUb8NCZIZTWFDtBJhPMkd6aDDlQwfbNDscd2JT0HqwTSF5fP1qaPAlvvnzRlxv8aRwYrJimP8n+7D4915bnB38Nb+oazAgjaxURsvBZcMRJVbpKKFFwXMgY9kXwg6E5949mERZoc6oTZ3+ovUkAhyPoYHpMu51zFclMbwptr7YDWPGaY1mhUCWTsikCBLvqt4gwvT8yOpNuu/gNRNH1wMZ+BWUu42YHATrrn96eHeneAKSRKuf7VCzcqDfxQxC9Ib59bAF0Pu/BTtWErx9yeanlNXH41QP10TeMyHMcPal6hVzgnHauAzur8vYjnComZBLbX3dQ69YgJvF7em0k1N4Nt99bn2oPEE6YkU25DGJtbjtCW96giajSE4UrWyH5LTj4yqCIN7aZCYSNp2uoUMDjDlsOgPFD2I=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(7416014)(376014)(36860700016)(13003099007)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1YKiWTuO/gVfx/ckEtkY5Wxno6+iNRHEOwLmWWN6zgLIKnILXxhM2PV9RCy1rBJ4X39B1dLQ/wg0c0ImiXPFASuJxq8KScJt885tjnHGfWI1FG5WXTLABchErt03kXK9Wr6+djuVzyNZgMUFhmBwonXFsgyCoUD2HbnODVb9Hw3qEDONBcjs/xCjRsM6LxgIVmNOAsCW0AUWcNKyYLvWocPW06/6kjo+CPrs8kuEH7KPAXEAwHtv3idMPTP5QBMe48tVU4Hc+DIJgcwIpLasgmRJDRU3h7YLyl7USfRT/x8sd5eHacXV2PqA6MTujXZtRn8biLH0oL3RxUSxNE4ztxwxI0UjjHDnrInQgK0YN46HLIv4Cippo8TP4OCCGM8ko6D72ahQEDkbaelkLW4QyVvyMpQ+EUklfFJ5OT932RAhgLpPfcKjjZN18sesxcC4
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:54:56.7137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deef7077-7f75-40cc-6b20-08ded5ccdba0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB9713
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65895-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:benjamin.mugnier@foss.st.com,m:stable@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,msgid.link:url,intel.com:email,st.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39CC06D917F

The vd55g4 is the monochrome variant of the vd56g4. This series adds the
necessary code in the driver to probe and stream from the sensor
in the correct format, and a new compatible in device tree bindings.

This series also fixes some issues I encountered while developing.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
Changes in v2:
- Cc stable on "Fixes" patches
- Check mono code is correct in vd55g1_get_fmt_code()
- Remove VD55G1_MBUS_CODE_IDX_DEF
- Don't initialize vd55g1_color_version members
- Indent vd55g1_get_version() one tab left
- Declare vd55g1_get_version() iterator in for loop
- Reorder commits to put device tree patch before implementation patch
- Link to v1: https://patch.msgid.link/20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com

To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Benjamin Mugnier (5):
      media: i2c: vd55g1: Fix media bus code initialization
      media: i2c: vd55g1: Remove spurious pad format update on init_state()
      media: i2c: vd55g1: Fix manual digital gain on color variant
      media: dt-bindings: vd55g1: Add vd55g4 compatible
      media: i2c: vd55g1: Add support for vd55g4

 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |   3 +-
 drivers/media/i2c/vd55g1.c                         | 160 ++++++++++++++-------
 2 files changed, 111 insertions(+), 52 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260428-vd55g4_and_fixes-97dc23b6f266

Best regards,
--  
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


