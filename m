Return-Path: <linux-media+bounces-59780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEhjAs508GkMTwEAu9opvQ
	(envelope-from <linux-media+bounces-59780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:50:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A2480951
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9792E3091DDC
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1F03D5663;
	Tue, 28 Apr 2026 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="etZHRHWJ"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012014.outbound.protection.outlook.com [52.101.66.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032FD2DCC01;
	Tue, 28 Apr 2026 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365667; cv=fail; b=bRXCZwn8sUYJzcRYfnrJZbPSK2P6EY7K43NY3y3jwJkzarpbUB3QvCJ+RJrW+CckyFMACuA9EtlFBi3HUEVqcLEPofarwuqWpWVja6Jgu/FrVrI0QyrmWt8fosoje6KiWpcZZ+QVxrz+EsL5K5J5puEvSahfq6pZw3tS54ALAZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365667; c=relaxed/simple;
	bh=kilHZ0x3ScyEtUgGi1wLSklQthfNdlNvNMHBH71xiIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=niRN/wxPw9sI+4BDCdDts4lyLUQZ+zZor5qyhFtShIXhbMf8iW2sjQSKvIypunqAmce8ZDFECVW4ovu05XY7BjA6huRapovxDAHV8HFQxG1f6C7SCmV5030iRF2bMg3YwG2uXHkE37fBm5gv1zozzE+GECk7KNpdgt+HYA669/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=etZHRHWJ; arc=fail smtp.client-ip=52.101.66.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLxiAd3zUdBuDh6hECil0+y2uiVmumo2JF/uyPJ0KOG4/UrU9CphcCzPuGxN9nADEK84G3CRysfyZrUHDfq/L27wYu7+gI58InhXQefTJUCVSKPas33WjM88BMFHZ6+vaztbje7dVfjs78smp0DRUYzQsqM8EUBcW5S+Q1J2rM99KPPKfHzJ6uv5c9NcYYTf6UmKPL/w+EfGRqSc/0DKOgnvct94ujA0T6JXYlAL3qMGz+rgvUJg54XaqNPCjunSdacZHsKIC68/cfGgPKRs0qUzg4Zn+VEryqrHX+MGdnhB51BqYCwvTi4AMmLGp+OD/JwBw5vBjdjsKxm5cunXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rboA/EhHDCOnI9zRFirCKI20oVezFDqNeIq9dIOVQ6k=;
 b=LMs80uR5r72C3p1MqkVphw8tvVGj0bEsWRSk4VDFy2VfZDtGA2PZCjVlHqsR6n4x6wTXmeOlvAheu4yZG1fHfpJWOLDBYLyRpy6Nvlo63RJ0ezN1MVEePY+mAhh1/yVFx5XYXiibRx8WzXJIfmc9WYGwpOPRPp9NGJg1ttG53/TacSevGdgRXDpFiCzonYkDz8JI1XP7IFZQF2OlnKPT096iYhJGIOapkKKFPnkIeuzkr8LgZpRl6kRtPoFEEqF+gX8Ycm5TupKyVOzoo/EgQTjGJcRvKSR2pR8Fm3EMXfAL8FA5C9qhpUCXMUj4XiBubiu2SH7evMWOFn+IfwTjNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rboA/EhHDCOnI9zRFirCKI20oVezFDqNeIq9dIOVQ6k=;
 b=etZHRHWJHt6A96qsS2HpeyRrERTvZ4uKNbv2YbIQy+T6ZRTOeexsUq5OdUC5ZSEcvkgMK4LlYPeZiRgCooRlXMUGXSM7b6sN6PlwEudRNQGCi5m6aO47116fQt/MqFyF5BohvfZIgeNujIOWtxq5RXA0WXXpbWE8tqNmWS0hLtwIb1jeBWHUmoJOKlB7DCVfBaQgDZyHY2qfB03S+MloBPzJ7nY4amCiWK3PNT0bkv1ClnTofiHOnVMOg5oHbEB2jYHlHrQxdaxbkKE8V9M/m5Pgv2Oh7+jfGPWFPSGyvg3EG1a24i/6rmwOqkdcrhJbeP+uz9eoRUECk4JZsHY0FQ==
Received: from AS4P192CA0014.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::14)
 by PA2PR10MB8942.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:416::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:41:00 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5da:cafe::fb) by AS4P192CA0014.outlook.office365.com
 (2603:10a6:20b:5da::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 08:41:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Tue, 28 Apr 2026 08:41:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Apr
 2026 10:44:12 +0200
Received: from localhost (10.252.13.121) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Apr
 2026 10:40:59 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Tue, 28 Apr 2026 10:40:57 +0200
Subject: [PATCH 3/5] media: i2c: vd55g1: Fix manual digital gain on color
 variant
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260428-vd55g4_and_fixes-v1-3-4f745a83b87e@foss.st.com>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
In-Reply-To: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F97:EE_|PA2PR10MB8942:EE_
X-MS-Office365-Filtering-Correlation-Id: 496e8243-9396-4305-2145-08dea501e01e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	k/3CRTE0EvO30Jjy0AFhWXPRW80cesrCHpI8Fw2JCbqL9Iewwffartff6iHyWJnN9mFa1VBpga6ir+Mgg+ztXsjIWwF2BrTzxHqLUC/ff0RVMJKv0D49rOJXPPKJKYvQQ+2XumZV24mZ1G0ialHbMMqdFENHEtZADtkQWWi3z1MkihZUJrb1ydQBHMReZKdGOe7NUfHv5kKaRYdnkiwV94bdOIpKc8bjLvf7WnFV6wvWLYifE9M/sF3rHJjCe2xH/AD2sR5E6fGLumZG9e4FPRzRY8f4trzaJ+YRIEM15vbSGBFlWHqT54NesWOpYPH8l6/nawFcTZdEnYjzIl+9YugP0vBUToYISV0feH+nA3M3NQHp2sPC9lbMdT+LdJvTrU7+2YmTWJ2E31AtWirmsMTL12qdmxRbpuyf+iH7J3utS8qhTdN8B8oFrZi93PiCfMu+tEKjKoIHErbotgztxXOc+wxNU7HKH4hHeU0lf8b/YfdDbZfr60UjVwmf/zIe3LbDbe9UPKMbpHLNahKoJNOJ9PJbVnYnGgsae3/kFppyoYkM4LX27D7T6jsXfooMQU2TM4Q6nJQGLr8Z5CCZnGP4unID4ctu+qD23bHsv9Dzf39CivEgbSHtssCfTlnp/afrZ5Mq+4u8bnKq/LIjLa9+HAmvAnNrBkPbcH5G00x6CIfs476Km3EoEQAYIrzoZ8yFdLyN+FxI/qNAuj7lhNNlO+yz6ytCeajcqP5E2YfkoKqQxzg2cdGIsdgw7dfAfDk1hGoPMZ0fsVlwVGOoTw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5r9cfAwwJLObTTs2EcR7XLalLCgrH0DEgh2Ls6d1XYrvNMYc93CWBG81HWLb1GDnpM3+xby02H23dMnaKzHt/0XvA5aInLOStajUpH7sCI2plrbJDwwNc505NC2VKtUJ/AV0N2gMnsVMx1dQZNUcBkM6ELCid0L9r3C+/6aOM0qJ+l2M8ajd8JXrxlJIhlV5ZXSyPIcKSDlqGoZ/PIE6QhSNNZMTLVj00OTRaLyYQb2fQ54jJMSqzw5Jnyu9U/nLWmoJ8n4h5YS67t23y7ODiin+ktJPybT3KOdoGaE9hQKUcWH9b+A8r6wcKvm6gUywJ6Yl+2d13YRgoGobPcVqHf7ZhzspUFoTsmJMUuQQQedQeSh6BcQi/k9AB9aeg66+99ZnKio7UI8+etgySPDCAGwzFg4lxbcWBMPXH9oljleY9yVZjYdL3TnSXOWYaHTS
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:41:00.5946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 496e8243-9396-4305-2145-08dea501e01e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8942
X-Rspamd-Queue-Id: 876A2480951
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59780-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:dkim,foss.st.com:mid,st.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]

Apply digital gain to all channels, each channel representing a color.

Fixes: e138e7f00042 ("media: i2c: vd55g1: Add support for vd65g4 RGB variant")

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index e44174056ace..2c962fcb41d2 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -60,7 +60,10 @@
 #define VD55G1_PATGEN_ENABLE				BIT(0)
 #define VD55G1_REG_MANUAL_ANALOG_GAIN			CCI_REG8(0x0501)
 #define VD55G1_REG_MANUAL_COARSE_EXPOSURE		CCI_REG16_LE(0x0502)
-#define VD55G1_REG_MANUAL_DIGITAL_GAIN			CCI_REG16_LE(0x0504)
+#define VD55G1_REG_MANUAL_DIGITAL_GAIN_CH0		CCI_REG16_LE(0x0504)
+#define VD55G1_REG_MANUAL_DIGITAL_GAIN_CH1		CCI_REG16_LE(0x0506)
+#define VD55G1_REG_MANUAL_DIGITAL_GAIN_CH2		CCI_REG16_LE(0x0508)
+#define VD55G1_REG_MANUAL_DIGITAL_GAIN_CH3		CCI_REG16_LE(0x050a)
 #define VD55G1_REG_APPLIED_COARSE_EXPOSURE		CCI_REG16_LE(0x00e8)
 #define VD55G1_REG_APPLIED_ANALOG_GAIN			CCI_REG16_LE(0x00ea)
 #define VD55G1_REG_APPLIED_DIGITAL_GAIN			CCI_REG16_LE(0x00ec)
@@ -850,9 +853,16 @@ static int vd55g1_update_expo_cluster(struct vd55g1 *sensor, bool is_auto)
 		vd55g1_write(sensor, VD55G1_REG_MANUAL_ANALOG_GAIN,
 			     sensor->again_ctrl->val, &ret);
 
-	if (!is_auto && sensor->dgain_ctrl->is_new)
-		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN,
+	if (!is_auto && sensor->dgain_ctrl->is_new) {
+		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN_CH0,
 			     sensor->dgain_ctrl->val, &ret);
+		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN_CH1,
+			     sensor->dgain_ctrl->val, &ret);
+		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN_CH2,
+			     sensor->dgain_ctrl->val, &ret);
+		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN_CH3,
+			     sensor->dgain_ctrl->val, &ret);
+	}
 
 	return ret;
 }

-- 
2.43.0


