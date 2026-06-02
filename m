Return-Path: <linux-media+bounces-63376-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y0zNDDjYHmq0VwAAu9opvQ
	(envelope-from <linux-media+bounces-63376-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:18:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE4F62E694
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:18:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=CfxZIXzq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63376-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63376-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5E2E30C181E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B171B3E7BC4;
	Tue,  2 Jun 2026 13:14:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CB93E5A13;
	Tue,  2 Jun 2026 13:14:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406086; cv=fail; b=jdTNp9dVC3aBUSpyRHd5EIHzPruD2Jloct05YjSNn3GT0or/OGsRxqO6GpFcG278zjQN3bCD8K80LX5Gl+aUbyrxnIGia7fYdogI43CmQakqys4ol92y1yeDfCzcOqJvC1PbGzBY5Zn9vqnHOhIzZv1281/vNsU0qfj+RLGciig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406086; c=relaxed/simple;
	bh=mxRnRGocn351sZ3MLqQ9FRO4b9+WhaXrCMM6WV4SoAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pomqHbL4Uv2a6LqY5+IbmnpZ2XrLJxhMLJj9nqCwaX7/YPhNtfdCgdozNQxABI6pujxDxgb4BwSy3kPfarcA7lm6hTtEftADiz4lo3rrywVsEV1yjRGSd8nyzRiEthcW3OIJ5YVOE4OehCko1VUOLUwSVZMkvz13v0WD5Xk8Kus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CfxZIXzq; arc=fail smtp.client-ip=52.101.84.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dynWE3o8fyFCsBEuflRT1dn00Str2knDMtGA482D17ZTQL5TJUf0pjwfRgWGkaUZuxLmlXG4CvX3hpdk390lbnvTYXzP18Amhwo5P213YbzX1ZmZmAToGcpT4DTh8TwtZWsdFYM82rmFfNQNz6gZ3UEtXxjj39rd6zIThubHlUNMlLEZeq3tI2fnsqEHIkmSEKyKNT9u7UKsHG3iy6/phF/uo34EyyXePs6CSyEUklfoFKAAEpQzrm/wzRgPwYa3HDdb95JimN4C5KVgRrzgU5aSu+4eWxc225TMARzEAS2TkIx2NlpltKU6wCMAtH1BVrk8Ifh47F9CyH9iTBCQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63zYVtF5DKtPti/bFlJoQe+s6H4OHSGU+zqc78T35sY=;
 b=ydiGhKrSEvEGW1TQpvqBr3BWZYzXKrfraxHbmGH6dJA3hu6uX+QLpICCjr05W+D69iVF1yM7Y7xxXwwd8c+AwrQUP7NCCLd/XKfCBXu9MIVWwS38UkMHdY8DJLPycAkTOcLNyAJNpklJ8X+Sq9MtR/ghCP+MQKpFOoZhjitwwILE5yX96w5Uanj+w27RST7bj7qaOxHYdBGWaDYosxJjf+KnvGUdqByJn2NvhobKajYnQUXOSP6k3mRnyLRy5HJlfA5P2UKIh0NMXpFW8wmTYByWSHtSEkqXCwjb3US/mQ4TZNW7tK/6R2zs7Fzq0632t1svll48djixsZzJP3Db5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63zYVtF5DKtPti/bFlJoQe+s6H4OHSGU+zqc78T35sY=;
 b=CfxZIXzq1unrddFIx8VR/GtJEJfFpoo/t9bBgBFmS3mVcBKPIBa2nTc5VpnHYKziJVDloY7r9S5n4TywKY/82eStfsOumoSlGlIL/qrbhgOHMWtLVXkpw4Dv9zwXAAw4GcT4mAwfMO9DaJNyjvkvAPmUxYwrCkTPsWH3thYkIc1F6174t6gGegCQHhs2tVcljA/H1VV14ROsQK6wAxiytYBB+W6eR67PjpLSbfE7H6aDSDcuZ99EOu6DaEvR3dRyjeqi6ZA17OHTCsKpVJ7Gacq4UnheN/YwUFF1aLk8HkJcleq8oO9EvbKpP6Rqt1vWYtL1uB3yzq6NQMefDZRAIA==
Received: from DU7PR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::11) by DB4PR10MB6216.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:383::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:14:41 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::61) by DU7PR01CA0033.outlook.office365.com
 (2603:10a6:10:50e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 13:14:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:50 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:40 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:03 +0200
Subject: [PATCH v2 06/13] media: stm32: dcmipp: configure csi input of all
 pipes on stm32mp25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-6-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|DB4PR10MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 94965a0b-74a5-478b-c8b4-08dec0a8e807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	W88pQbwvcML7pIm0eRbz0PjtC6odwICf13ECop18Gba/hsuY2t3fCXccGthYSn9cZBUPROXTLw9U0yWXpQsE6eu+w6roq9Q2CPkieQ48wpZbCapXeAX9Kr3FensAGytx022d4DXmuc3djMa73YWX8XnIDf+ya0faL0UusyH14fa/TIiOcy4UX8ZPFGRbqYEG20xzhLjev25vy+KbD80d47kEO6vdB9JKU8hX9on35mtwJAaEnrzYFSm8bYsgpjQxFNaclZnw5D3BmoxcvK2TC6LaJ3ZDPZnhmez7PWTaUWTDRasSHcX7i7Jz2vBTp2I7ASap7/IgSP2TRpQu7ChowAsZDDCxuas6+ZEmwgOE97C/s4ewtWsinW5xUvm7Hb4/aOR3ZVQGYgzlUioO1QZmrYutVDfczD/GhJH8qhHMEBRigUImb4LDOSrXuks5zZF2GzVmekxDpXB54wS3q+hGkYUUu2X/8Nxx2W94YIUaOnfp9T0ml0owP8x2pffdhI5VTXm7HKRC2CXcfS2XqQbRy1ThqkAJ+L5QpMS5uXcTo+l4s53ZExx02HhjT+M3NzSHV1FVoowsbiOrO1vx45/VjhxKT6WiKfU1leTXWxS91tTolbhW6DjX2nz8HmWeAJSaSkk7XjFqBdSL77QZpojQoF2N0lLtfin6ulgnleUN0hS0Z6EzWN4nanejKX0pykpIasQHJy1Z6xuOMmhKwY0VH1R1aEif7rxa+jgCndnnoXY=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W7kD+Ipfa1VMHLHY2CElxQI9jYbLMvkQo8SjsrSqqZq88ZeDqG4DwMvLr/ZIm8xNqVIfZAqo0W5nxpZepZyOYMr1RFAqcvQbUDuSdmmZfxgvUkV0O8hAPpa1X/LBwutBf2R3rPcmY4FsnJpG5BnYhPmpeRNH0jOvQwrO2JPwu11VnbXi64gbAnM+cwUOoZtsQzCo2cIA/D9TLVmHSHVuGL8G7IeBp8poAuBhb8p4uzPyDSnxVl4E/oVhZSWCH/nDB2WZpKwdR1FYgdvGSooMuPgTEk/IjUmA9phffEYzGE4qXIxCMQ4Rdv5QeiCz/yU8Ro7f838rR+JWoZwaLeDyfyZhkmmdUCJT/m95wt77dueXL8KBhMX6Q2mfzwEfBeeALAWpuIDj3tHoAcWLsytyGYiFZZ4Ejk1AxO8NkhxxbPmTGSQqLrfMue9uJivpmsmV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:41.1914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94965a0b-74a5-478b-c8b4-08dec0a8e807
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6216
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
	TAGGED_FROM(0.00)[bounces-63376-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,st.com:email,foss.st.com:mid,foss.st.com:from_mime,foss.st.com:dkim];
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
X-Rspamd-Queue-Id: DEE4F62E694

The STM32MP25 has CSI input and 2 additional pixel pipes in addition
to the byte pipe. Each pipe can select which data to receive based
on CSI VC/DT selection.
The multi-stream support of DCMIPP will be added in a future commit,
however, to start putting proper control method, the input subset
has now 3 SRC pads, one per pipe available.
Currently, and until multi-stream support is added, same data is
sent to all pipes.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 75 +++++++++++++++-------
 1 file changed, 51 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index 75421035cfad..3fc859f1cb14 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -43,12 +43,18 @@
 #define DCMIPP_CMCR_INSEL	BIT(0)
 
 #define DCMIPP_P0FSCR	0x404
-#define DCMIPP_P0FSCR_DTMODE_MASK	GENMASK(17, 16)
-#define DCMIPP_P0FSCR_DTMODE_SHIFT	16
-#define DCMIPP_P0FSCR_DTMODE_DTIDA	0x00
+#define DCMIPP_P1FSCR	0x804
+#define DCMIPP_P2FSCR	0xC04
+#define DCMIPP_PXFSCR_DTMODE_MASK	GENMASK(17, 16)
+#define DCMIPP_PXFSCR_DTMODE_SHIFT	16
+#define DCMIPP_PXFSCR_DTMODE_DTIDA	0x00
 #define DCMIPP_P0FSCR_DTMODE_ALLDT	0x03
-#define DCMIPP_P0FSCR_DTIDA_MASK	GENMASK(5, 0)
-#define DCMIPP_P0FSCR_DTIDA_SHIFT	0
+#define DCMIPP_PXFSCR_DTIDA_MASK	GENMASK(5, 0)
+#define DCMIPP_PXFSCR_DTIDA_SHIFT	0
+
+#define DCMIPP_PXFSCR(a) (((a) == 0) ? DCMIPP_P0FSCR :\
+			  ((a) == 1) ? DCMIPP_P1FSCR :\
+			   DCMIPP_P2FSCR)
 
 #define IS_SINK(pad) (!(pad))
 #define IS_SRC(pad)  ((pad))
@@ -383,7 +389,8 @@ static int dcmipp_inp_configure_parallel(struct dcmipp_inp_device *inp,
 }
 
 static int dcmipp_inp_configure_csi(struct dcmipp_inp_device *inp,
-				    struct v4l2_subdev_state *state)
+				    struct v4l2_subdev_state *state,
+				    u32 pad)
 {
 	const struct dcmipp_inp_pix_map *vpix;
 	struct v4l2_mbus_framefmt *sink_fmt;
@@ -399,22 +406,28 @@ static int dcmipp_inp_configure_csi(struct dcmipp_inp_device *inp,
 		return -EINVAL;
 	}
 
-	/* Apply configuration on each input pipe */
-	reg_clear(inp, DCMIPP_P0FSCR,
-		  DCMIPP_P0FSCR_DTMODE_MASK | DCMIPP_P0FSCR_DTIDA_MASK);
+	/* Perform the configuration on the related pad/pipe */
+	reg_clear(inp, DCMIPP_PXFSCR(pad - 1),
+		  DCMIPP_PXFSCR_DTMODE_MASK | DCMIPP_PXFSCR_DTIDA_MASK);
 
 	/* In case of JPEG we don't know the DT so we allow all data */
 	/*
 	 * TODO - check instead dt == 0 for the time being to allow other
 	 * unknown data-type
 	 */
-	if (!vpix->dt)
-		reg_set(inp, DCMIPP_P0FSCR,
-			DCMIPP_P0FSCR_DTMODE_ALLDT << DCMIPP_P0FSCR_DTMODE_SHIFT);
-	else
+	if (!vpix->dt) {
+		if (pad != 1) {
+			dev_err(inp->dev, "JPEG only available on pipe 0\n");
+			return -EINVAL;
+		}
+		/* Only available on Pipe #0 */
 		reg_set(inp, DCMIPP_P0FSCR,
-			vpix->dt << DCMIPP_P0FSCR_DTIDA_SHIFT |
-			DCMIPP_P0FSCR_DTMODE_DTIDA);
+			DCMIPP_P0FSCR_DTMODE_ALLDT << DCMIPP_PXFSCR_DTMODE_SHIFT);
+	} else {
+		reg_set(inp, DCMIPP_PXFSCR(pad - 1),
+			vpix->dt << DCMIPP_PXFSCR_DTIDA_SHIFT |
+			DCMIPP_PXFSCR_DTMODE_DTIDA);
+	}
 
 	/* Select the DCMIPP CSI interface */
 	reg_write(inp, DCMIPP_CMCR, DCMIPP_CMCR_INSEL);
@@ -432,20 +445,24 @@ static int dcmipp_inp_enable_streams(struct v4l2_subdev *sd,
 	struct media_pad *s_pad;
 	int ret = 0;
 
-	/* Get source subdev */
-	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
-	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
-		return -EINVAL;
-	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
-
 	if (inp->ved.bus_type == V4L2_MBUS_PARALLEL ||
 	    inp->ved.bus_type == V4L2_MBUS_BT656)
 		ret = dcmipp_inp_configure_parallel(inp, state);
 	else if (inp->ved.bus_type == V4L2_MBUS_CSI2_DPHY)
-		ret = dcmipp_inp_configure_csi(inp, state);
+		ret = dcmipp_inp_configure_csi(inp, state, pad);
 	if (ret)
 		return ret;
 
+	/* If there where no other pad enabled, then enable the source subdev */
+	if (sd->enabled_pads)
+		return 0;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
 	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
 	if (ret < 0) {
 		dev_err(inp->dev,
@@ -466,6 +483,10 @@ static int dcmipp_inp_disable_streams(struct v4l2_subdev *sd,
 	struct media_pad *s_pad;
 	int ret;
 
+	/* Don't do anything if there are still other pads enabled */
+	if ((sd->enabled_pads & ~BIT(pad)))
+		return 0;
+
 	/* Get source subdev */
 	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
 	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
@@ -533,8 +554,10 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(const char *entity_name,
 	struct dcmipp_inp_device *inp;
 	const unsigned long pads_flag[] = {
 		MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
+		MEDIA_PAD_FL_SOURCE, MEDIA_PAD_FL_SOURCE,
 	};
 	struct device *dev = dcmipp->dev;
+	u16 num_pads = ARRAY_SIZE(pads_flag);
 	int ret;
 
 	/* Allocate the inp struct */
@@ -543,18 +566,22 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(const char *entity_name,
 		return ERR_PTR(-ENOMEM);
 
 	inp->regs = dcmipp->regs;
+	inp->ved.dcmipp = dcmipp;
+
+	/* For DCMIPP without CSI2, there is only a single pipe hence 2 pads */
+	if (!inp->ved.dcmipp->pipe_cfg->has_csi2)
+		num_pads = 2;
 
 	/* Initialize ved and sd */
 	ret = dcmipp_ent_sd_register(&inp->ved, &inp->sd, &dcmipp->v4l2_dev,
 				     entity_name, MEDIA_ENT_F_VID_IF_BRIDGE,
-				     ARRAY_SIZE(pads_flag), pads_flag,
+				     num_pads, pads_flag,
 				     &dcmipp_inp_int_ops, &dcmipp_inp_ops,
 				     NULL, NULL);
 	if (ret) {
 		kfree(inp);
 		return ERR_PTR(ret);
 	}
-	inp->ved.dcmipp = dcmipp;
 
 	inp->dev = dev;
 

-- 
2.43.0


