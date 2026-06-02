Return-Path: <linux-media+bounces-63378-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KYOdF4/YHmrnVwAAu9opvQ
	(envelope-from <linux-media+bounces-63378-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:20:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C2F62E6B3
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:20:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=lBvKBoiw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63378-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63378-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BC20302867A
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9ED93E275E;
	Tue,  2 Jun 2026 13:14:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27123E7BD8;
	Tue,  2 Jun 2026 13:14:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406090; cv=fail; b=BfsmhkEM1InG7CsN3gga6qVcWy1xIha1BKQ8suHBAd+PrfwMgk+Oghct2hxh87OvjqbOSd8G2bh0olo3hwNE467pXmpQdKJKVsIXTQvQzY/sH/+aOJ5a8cKgsQoV3es3tGCKQVolJwcJy7xJKB4i+uoE6DRTuMQk8EKRk5QyTm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406090; c=relaxed/simple;
	bh=9h/7Hc6wHM1gBTZstnOnrYEUAdTVkmi9ORi8TT2Ho70=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=truJ1bgj7rJCAJ36Z5/N5Gw6dYz+MtIzAsdkTT2ybnUAeclQ3QGsYGZKFc1wJeq3tDJ+d2NeShREm3dx58pASIOSTA0+23ae7JQv8vvI+mxDlJG/fE7jEDKGara9cIGWYJY9GIoFguw1iComiKCulVdBTUcNAxBGU6UdGdqyf3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lBvKBoiw; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=typUH8YvR0kBqU8T18QIRdBKlQcgwaLvAVd1U6GTM802e7yJkgZ0FQiOKpecP4pEj8K/Hr91Eoh1lPQBzHCk6qSVs68bRei4gauJncfmlc1uKrrkQzU9iQO2WLxw3xfKJj+hzB/Ilaub90OKwzLvBWWtSlXcPDYaHcKBNNFMHbQvi+hBF7bUWrtPUQisiDapet9uWjeXj5hwlvE3namwmaFugZx10i3x9mLxUEE47R+PkvmG3/6SUemnq5+RT4MS1SXyJOhkYlQ9b8gGk06lekCw6d2Vw8PPUNTJNfVmvCO1WNUBZIepu3tkq8vZp4iBsrY0qnTfcbJoQg61awJRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MK6GlbVAhkFqi8kNEaM2r8FmUtF2Yas+HTzGHhKrx8=;
 b=HGwEY2rCcDYzRntElOIbeRrIZXpxWhW1DDMqWsDulaQt+nGJii0FbezLP8jRmifjwmSpWZQ30GpUpgKEuUngncH3vfJoARCy4Yyq8f6q0NPvhP7iTyg5qy1aCF4v0nk34+kqQdnKGFClbjf9mqX5Cxx09tK8mTACCJeac0UY1h4/qYu4PY04wloDjJQ0f2iNs1gujSL4V/fTF/AC80uebRDZDU6JwtyOIJzGBUw21J6J4bMz5fbNo4E4mhBKctfoAPpFz7axR1XGof1zhu35yAxDrKBlBh4Djhmx/XJwIy2UBoHWNKUmqewulPpPPtovk+s0C42v1SAhHRH/XAxASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MK6GlbVAhkFqi8kNEaM2r8FmUtF2Yas+HTzGHhKrx8=;
 b=lBvKBoiw4lJ3hgrnVD3uKefhPVP6uVSUB6o7HP22gRpC5EG/WxqIg42eBq1E12ajKbT59cg7JPeOqIOzZRlVKubX7IyhhSnNu50bTNz4waKKBsT3NloU0qoUv4afXB+fZa5zhKEzeC79sbABEWZ+injlkefSvhLOrFJNgZvdupzg3wDyg8/WClrOPBqvZXRHlODuvE1XdHmdnIOtnO+mVuV9oBHRi2AgpnDSgiVlsirNCHD7O2fit+Po9Jq6tKN86n40L1qIhnwWhsVInw8xYU/7LKKAEdnZG5M6rjqwQc3c04MlJiYpNBZlxCT5Cvf0MA7jzomL7+8SHgxCgkbiDQ==
Received: from DUZP191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::27)
 by GV1PR10MB6417.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 13:14:38 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::5c) by DUZP191CA0035.outlook.office365.com
 (2603:10a6:10:4f8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:14:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:46 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:36 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v2 00/13] media: stm32: dcmipp: add support for MP2x pixel
 pipes
Date: Tue, 2 Jun 2026 15:13:57 +0200
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABXXHmoC/4WOQQ6CMBBFr0K6dkhbWwOuvIdhIe0gTYSWTiEaw
 t0tunDp5ifv52ferIwwOiR2LlYWcXHk/JhBHgpm+tt4R3A2M5NcaiFFDZSGowRrBhcCBPfER86
 ABDSH4GOCVslaKsNbhZrlMyFil2e74tp8OeI0Z1P6lb2j5OPr88Yi9nY3nniO/8ZFAIfKVlaLT
 iMX6tJ5opJSafzAmm3b3oM+FWjnAAAA
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sakari.ailus@linux.intel.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|GV1PR10MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: e9690ff6-7cf6-49ed-f2cc-08dec0a8e5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|30052699003|1800799024|82310400026|56012099006|11063799006|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Hbx2JoSE4L8ipfURBxjDa6EZajbxdPoYbemTwl1ehUnThm/2MNmhNcJgT+hxwvCnF5UKNfkPVDpjOh/8ifvKKo6oYwWM4tyYZ3d6EcsYwg5x0N12fxBOBFa+hkY1iTPNMIifWsbGZlyeCfRUuea4QKdBl8wpx/q5SHhhVYBxUmjXHxnLdVfudGQ5ucFt2U9VEsEeqFjKOC4nNf4pUWm+OFQRqSAq9b9YR3eUNsGZ1s+S0WvbplrONHlQieFd8+RFt+9oG3z06wr3wYBYPe8jsuBqNbdBuvo4PUbiTiotoAkxoExDLlZTrWoum/aWBc71tYU1KlpAYsAd0Ubq/23LoEdDB4Mybni+wbefUvgVYg/vFqF6YY1V0mH0nlPoR+05bd7VziCBiY7FwKZfBlrg4zW7hIjNvTwmjPxv5xq5eSRQMjcFpJtWWFFZF7kdRlFGSaZVEKi8zAFl8nxgMrSDFsnOleFdUNLnLH1q9NbKVy6ijg3Q8pKa6rr6OjZGPmzrRY4YazK0U2xC52qF4IYLLeDcUnTwlmOZRNrn/bH/KlI6jsbQOj0bH0EWs8qZio3Fdalw6i6U7kKtFZ0d/VRR6e5vF/IcwNsb/MORBmtCBHIHkUTQCyVWAckbx/9NuqBAylhWrpadjYtfl6yipjd4KeyiIWN7U/r8Mm2ObU5xq4xKzXr3yYe9Jt7VRzBPCSew2kWtcreSncPxKVqb/wo5I9I6WNjI6whVybtunfYXxbM=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(30052699003)(1800799024)(82310400026)(56012099006)(11063799006)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0NESGk1lQ9ix1hfq6jUr609/wYIyV3lJPxEOAGQhXO1+CF9zUYXlO+YxqLP2zX3YStAcDb6CvAsMZPxtjcdunJLHSCUcmbM8vukqmrTKWvcGhkAbWR5neYleabg0bkwdB7cl1K43kNLx5SJj8nh0JU86keDChbJXMFpzKHs+sZljg6lcDgY8pf811OqgQIBpQBNVcZt2injIXMTKdrH3D32hKkHJ71zl3T1IjvpD9wg6NoERisdra7nzYHeeLpztIHFWOEn1rE8TzbWVTMb3k+s0fRsSl1scps233LDB93hNCWmtj7oLGNjz2jKudniNc5tr7mdDXBjWDHJ0VCHFeNsp07FMh2H4GoCHvknp8UmLfoImlIuGz0vbUa5LeJNc0hKEmuccvaEODeoiKQnxfgEmga4alawsd3Z3h8tOb1Wj/yMoDpZpl4AUnz70ohUf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:37.6510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9690ff6-7cf6-49ed-f2cc-08dec0a8e5ea
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6417
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63378-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:from_mime,foss.st.com:dkim,infradead.org:email,st.com:email,stormreply.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2C2F62E6B3

This series add support for the main & aux pixel pipes
available on the MP2x. In addition to the byte pipe
already available, the DCMIPP is able to process two
other streams in parallel, including ISP operations
such as demosaicing, exposure etc, post-processing operations
such as cropping, downscaling and various pixel formats
output.

This series introduces the whole DCMIPP pipelines including
static configuration of the ISP part (such as demosaicing).
Dynamic control of the ISP as well as statistic extraction
part will be added on top of this serie via usage of 2 other
video devices (input & output) for statistics extraction and
dynamic ISP parameter injection.

To: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-media@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Changes in v2:
- Rebased on top of kernel v7.1-rc6
- check-patch minor fixes
- replaced kzalloc(.., sizeof(..),) with kzalloc_obj
- Link to v1: https://lore.kernel.org/r/20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com

---
Alain Volmat (13):
      media: stm32: dcmipp: share struct dcmipp_device among subdevs
      media: stm32: dcmipp: make dcmipp_state & cmsr2 read common
      media: stm32: dcmipp: bytecap: protect CMIER register access
      media: stm32: dcmipp: move common structures in dcmipp-common.h
      media: stm32: dcmipp: correct swap in YUYV data with parallel input
      media: stm32: dcmipp: configure csi input of all pipes on stm32mp25
      media: stm32: dcmipp: introduce a dcmipp global media_pipeline
      media: stm32: dcmipp: add pixel pipes helper functions
      media: stm32: dcmipp: addition of a dcmipp-isp subdev
      media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev
      media: stm32: dcmipp: add pixel-pipe support in bytecap
      media: stm32: dcmipp: rename bytecap into capture
      media: stm32: dcmipp: instantiate & link stm32mp25 subdevs

 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   3 +-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  27 +-
 .../{dcmipp-bytecap.c => dcmipp-capture.c}         | 590 +++++++++----
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  98 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 124 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 113 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 482 +++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 ++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +
 .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 935 +++++++++++++++++++++
 10 files changed, 2318 insertions(+), 275 deletions(-)
---
base-commit: 6f3ed7fec72fc8979b2a8c7219c0a9fcfc8d07b5
change-id: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


