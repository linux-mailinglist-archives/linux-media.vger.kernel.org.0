Return-Path: <linux-media+bounces-65898-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id spAyNyZPQmpC4gkAu9opvQ
	(envelope-from <linux-media+bounces-65898-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:55:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CF46D91A0
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:55:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=WFWvl6iY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65898-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65898-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C294C3002F43
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464C936C5B4;
	Mon, 29 Jun 2026 10:55:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E103636C581;
	Mon, 29 Jun 2026 10:55:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730510; cv=fail; b=ZZK7LDGL+4FODp735HTbPN40nMtHqaORWPcuikowl9PqaXoUkk3o2O8b4oInta2tH+sB4aJBEr4e1DX43oagDbGdVIYmaQJg7RH49QUxNZevX4Mberk78XMD5zoLaO4Xyd4tFPi99aWdJWO8p1zFgPA3eAb1bgHAhf67u8qtt9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730510; c=relaxed/simple;
	bh=s1LgoL6uwv/5IqXhZXbEREBzDUkAhDRb6kkOG6uH+a0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NkO4TeWHUfEzY1byMDuNXPGDYJN2IT50pTlCMIm0L8QDsj6EZOHoIKczo6nay+Zo8sm/HJfH1hqaVXQZEzHAL3lomFeKr/O9uM5010AEfjkhoPEAjHRMoD+fc0QSHPkZbL65VlqgyarL55olR3ALy2fyc+FqXiGzlwseVdLOyvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=WFWvl6iY; arc=fail smtp.client-ip=40.107.159.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pc/lCfhGwGasinOmU63NWKc4Rdz9Cw4l+9PeECFGb8YOFZCK7leBsjPeoYq/WAA0wQLwR/tnZrAbqSusOSqyT3NR8GzxavdanMML0SGeBYNNR/zjW3oGIOmxAIyzc+V3Nbn8ywZZPnWvRwzdYDjeSH75xqYvx95GdDdet8eyVVpl7PlJHqFf2ydnNFdJ1/beNmS5jxpIaIqpvF3dYNhXi/pHFTl0Bcg3dYWCfFw4rt05MH/pBGYdeD7XNTAc7UNIx5ZDgjMC7INnCKWX/hdp9PXMhz8EAvMOpZwfB3dxc3IQc1FwzXZfjOJMH1iOLw9k5ZQ03bBb3jN5uz0ON4/xuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYKEFgf1EibGKZoStYZWGhnMgeYNtNC9RcgqM28v0hc=;
 b=L0e6ZirTcxkgW0LX+jxk4qSsHBmrPC8m+J0i+pFZTnXHgmx3MlGRFAVVAG8DMuA80mesmcjsR85m7Ff9GHmUep+OsebRPlGq4o0/9dCHX7s77WgdLrujNDkgL09B6okw17Qncx8JdjTgE19qJIDtFpZELDHZQky0ehjNgWRBZ5lMUXRIsC+UJ/DqjY5wKA9DOTfZKHTPJJtbUJT+ozV1GgyYGvSgpPDikoTPU2+jZaoGP/DHaYGc+DOcvVLOy6o6wr+rSqPmM562QHGJNb2mOMPPo2JJoOa2GM7qZ0FyXh+X6O7hokDOo1cM7RfRyoV0pOqwlVkO1a6vOOMQbK1qmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYKEFgf1EibGKZoStYZWGhnMgeYNtNC9RcgqM28v0hc=;
 b=WFWvl6iYERtKsGmxSPIwOVkb3bSS7ptZGY7wnq4ln7IyrtJdQI89n24HALi1Ys6A8UtusIO/up+VtXKyiph8GtlVWmuI+0Tls9x7GV0rJSfU4x5WJLHxm7n3YZk+6t/SxfedCR1WAVndAk5ub5NCdrTMTJ9lYJsBmqpm8pIzoHhyBjSMeA65E5tNkQAAVfu8pGvfGvrWlbT1MI+UB2pNQ4OAKf3fCGSquZEdP9cvS07zJRaNxaEQ3/BzFFTyDezGdXSyEtFqSdGvHP7Ne7zKnt7yOJwWw2e64pDwWnW/+KCPhk1eETeqNREkYF/NOH/8TGc32835cQ5T0mvT/7AfmQ==
Received: from CWLP265CA0498.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::12)
 by DU4PR10MB8513.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:561::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:54:58 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::80) by CWLP265CA0498.outlook.office365.com
 (2603:10a6:400:18b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:54:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:54:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 12:59:41 +0200
Received: from localhost (10.130.78.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 12:54:57 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Mon, 29 Jun 2026 12:51:48 +0200
Subject: [PATCH v2 3/5] media: i2c: vd55g1: Fix manual digital gain on
 color variant
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260629-vd55g4_and_fixes-v2-3-ea0a7cf3cd66@foss.st.com>
References: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
In-Reply-To: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|DU4PR10MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b353ef3-25f2-49c5-8996-08ded5ccdca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|23010399003|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	J7GjKQU5y+any46l6a1JVEtdl095NcwsyyrDGpK4+Xnq/U93OWCd+C8GotSGn0AdOA5+QuTOvd2Q4Nwzr/aQPNReUXn3zNRcNyvPBLEIKP+ZkptH2/W1RiL6njncQlgOzOwqgTOuDid1v7WeZ9iJ9IRFbgaD3cIZ4YmqZzqjbBGabaly8xapKjh2WJw06TvXQuTxbyuFM53F/ogV2wIs2V02FJeFvMxj8CEuCLl9zfZW/NRLeFs2vkJ72sUYAaGwYjEqkSu577ZnOQg8GadIE9VUbxWP6uW1VHWFeFHhS1O5BaRy4qvUpUvTXkNbbhZhK/2dsJUjvHLiB0YCDCLAHMW4amISKxqsyf2/qJ6OZuh0jqF8D2tbs9NGETFAKn4KnNioZ58NhT9dqOL6SPnMQRLuZ/ANxsi/PFnnkexLcEoKj4rZX6Zvb6YOj14/6WqLJEVOhbkc+PszhJjYZfMhi8cff0XoJsqLWQOLNwK4HNudj2Iw0aF/G4Jock7DPd+0Ym0FAnSzzSwXyyOwBs5tA0CiIurOfWGzzEqAY3xmjBu6LwwtgWf6d2dAVcnKSrpAgmpYXnMpEeWpl3lz10tG+Bdw3BHX6VsEpSRV5xYfb2t2VhEO3ya0slGkG+VzRMDik0VaJ1CrH5TK65Ow6qxURu1MyVblEqajZ6z8qbS3ttq6m3j9euhhv2BqQhJ0WFw5amhnJFWnegak01H1NzAtHQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WhUANMp8NBqAAl85OMi6XKx39YPEUjHwssW/jSa9wJ/lgQxlqbLJiseB6/EG5x2nevYsT68qOfzJ/nwh92AYCZsafhvEfHbnjb3lUaBB01R0XDxL9wKRn7ySQO5Blrgw+/wvNCcx7Q5o8nwSmENQNoexLOOnsKqhDz+8R8FoYE5WyHwOKmMFeDFh2AvgIjIijVaHhFHT04mIQvsII1OV1NTjssi2RVi8WctkIQPixNffWhUhoQKcl4m8RHLSi2qWCYzmgjsDCyxkcH8EB9leSPrOIeILDEXOucSOuC87owauupgB/vN9Cx7ocJqXkCw6gIX+NrvQAuB1oyFQRy22s3pLJEIbpKnLN2m5FHl1gmKd74z1q01ivgVTFZR0djQQ8aCZEckAF1nN+GGtWGrhKFi+GFjnyEVaKr/yGtbTe2b42IDEDHB2lamaXYmaJxof
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:54:58.4134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b353ef3-25f2-49c5-8996-08ded5ccdca5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8513
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65898-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:benjamin.mugnier@foss.st.com,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,st.com:email,ideasonboard.com:email,foss.st.com:dkim,foss.st.com:mid,foss.st.com:from_mime];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4CF46D91A0

Apply digital gain to all channels, each channel representing a color.

Cc: stable@vger.kernel.org
Fixes: e138e7f00042 ("media: i2c: vd55g1: Add support for vd65g4 RGB variant")
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 22464fe31562..37d44abd1435 100644
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
@@ -849,9 +852,16 @@ static int vd55g1_update_expo_cluster(struct vd55g1 *sensor, bool is_auto)
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


