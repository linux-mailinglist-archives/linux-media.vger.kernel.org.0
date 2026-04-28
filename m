Return-Path: <linux-media+bounces-59782-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALjPCQ5z8GldTgEAu9opvQ
	(envelope-from <linux-media+bounces-59782-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:42:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCF84805DB
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B46FE303478B
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4213D47A6;
	Tue, 28 Apr 2026 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ghicmXqf"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013052.outbound.protection.outlook.com [40.107.162.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054AA3D6CD7;
	Tue, 28 Apr 2026 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365670; cv=fail; b=rBTYxHnqXbzPH/vbtYJeLX1Nua48CVw0mgiyDlJRuz4gNTgBsRGe6G7n2e8brZYionyig27AHGMwlJBpgjEAGndMF6w5MN/+9dEy6fUItBr+9OGFywchahpoqOP7GsGUZuAUi1TWg7Iv3VySfN7zCExjwZ1W2S/cZwYiqWKg7iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365670; c=relaxed/simple;
	bh=YRQUjB3hNBy0tlNuQvrfgkpNNwqaZ6as4ymESzjBLHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TN3SGgVsOlGNp95tXfN3ci5liOUEimxHLBGJ4hK3bxg+sQYwDXwwVsahUO6c85VpD0kancO2fJMHQkV3unV7n57cyvOUAtWISCKiug8isJxJcQD9PAs6Y69tzKYdLIkyR8S7kLzLYg2++Nbr9HsOLh5wYVvSkU8VklV5EsG69+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ghicmXqf; arc=fail smtp.client-ip=40.107.162.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7R7hiI/iher68JJvzIICOE/ZkHh2slVa6QUFWVhBhFKX6S8yj28Hp+wqOgQByo/CMpGWsdUqGZHbvMimL3ZzEZ3iV4APM0YqdbzCzIyXJfTi71bFInJveHzp0xwbsodbIvf896Pnv6K/JDdNKoGQuA81iGRwD9w4z9y/wYTjS09agFqFczGWbPirO0W4M3D9r06es1Uq1eivvNeoDIWaaU0APiDS8Liczr+9sEIKi0GqwRQxZ8NnGaCGPi+uIoPYFH812vuA82haXG7xp3W4zGc+xppJbLwsL1FN59mNU3cnoodFCpW3VDGgmrZy6vIrvm/zh34vQj2ostUi+BuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHhLpjDWbFuw+Xf2mKVpMATKMTSu6iay1Vcdo7ntAes=;
 b=DT6HvP9EiX3LMf49Y1J9/Z/OSIGUo6hW2Pw1+fgeoXI1IRTv7Mgc3vsTBbXLk+MDH7Deab+7yaQNAdqbyUirA7/cRxjR467O2E26zHznmwxG2kGo92pSkrYXEAALtYDkQtfZy981nUoZJNlXVcdIvKPjUYJY4xP/DTLmZW1FFTb7ek7A7neXA5xjA5/nONYDahHYY/xzQ3wE/kOriee1gM1uzCwam2UWiSn0QObM1NpM9/5fFytP8negS4htuUmodqaZF+WRnzwqkNRMZnWO4lRLyLBczUjIAeuIjJAU33hQQ5lYhYWh6TdC5G3JdjiO9ju+ec+0HyqzZgNNPUY/rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHhLpjDWbFuw+Xf2mKVpMATKMTSu6iay1Vcdo7ntAes=;
 b=ghicmXqfpj30pY2WVFqmqOZkw120lyT4IuqzF+d2YlVsHLNrw9Fz6PDc3OXElYubRepSD9MmFQuQdKRoz2Z3y/6l0ePSpPBbew+wE8H+qqWSBMfbFgLfk1jZHUWE8aAAzLwE1nVJD3PHm3mBmf3LBFhMCvzs3kB2pZ+TJ3pNqEVDRwQEuJDKanxjQM3Y1kfMVOCoBgebGVqxuC/n3Eye9Cx96cx0hDY4ZU3PFYVL2+BPzOT2NK+F5nyWOmm4It255Zb09ufPmhNZDjyl8Dt99W7ZWGStFIYo4kiORz1dTMK4olmieMybZMZP5WkAALyihsj4VAmT5K+S6kWLZ4RZ1g==
Received: from CWLP265CA0392.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::17)
 by GVXPR10MB8782.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:40:59 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:400:1d6:cafe::37) by CWLP265CA0392.outlook.office365.com
 (2603:10a6:400:1d6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 08:40:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 08:40:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Apr
 2026 10:44:29 +0200
Received: from localhost (10.252.13.121) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Apr
 2026 10:40:57 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Tue, 28 Apr 2026 10:40:55 +0200
Subject: [PATCH 1/5] media: i2c: vd55g1: Fix media bus code initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260428-vd55g4_and_fixes-v1-1-4f745a83b87e@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|GVXPR10MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b3ce54-44e2-4891-e545-08dea501defd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vhdZsa0GgYQ+g7cBY87WLXXACBrEZW2pIad4KQ7RXNwgLrgzL/VuCeAO5d/oDNENYIF5Zyy7a/tSstESfjdmzNU4gmqpUl3V1dndA3QuFMUoawzNKoo60bN4A4swatL7W1zcVvWCkVP2nMZN3OvLOn5hGMgKZ60lIA7H6zC1Vqi1DmvZiNhrTEEkp1B1SMGF4Vv9M5UU22I2hJNJOGrXFO4PaMmonArld+ElxUmpkUTTplV3vyvL5hBAg9+C+7LLvdnBzK7oSkW/cNYZMIuexPaiU2VEjWCdptaSTWuzwjWxqdZYOVY8uAlpdNqfQvfiFKYdAKGbskj/5LQ98QXJn+DXl+PqDqO2vgyynqg1cCfAXdpn/hbdSb5yAr4vKfgQll0pkyrEzc44XketATkBRWvfthp9NJd8boNDjW7M5Nl6xX94UITrVWrhCgX+w4LAFtKvD8RZ9l7XqPAQjSwAvyCz7HOrUQXUiYyKf/WPrPU+dzQtr4M8WfENPWq4ImlWbdmHv7JGOA1Y8FPHecVcCizYoWscpEzPjKbPCJBjDxHkLYka0kjDmpiGtwQAkBOwhd4Yy0KqRDe8nLem6P+3Gh07taL2VmIJs3dxbKvvkoFbTvXE0u67QUHIIgiZlKZennyYoctQPWAQQHhomvp+1QEv110XGybon0q/SXskLqKX/jXMx16+/WV3ZmCPgdW1rYt/J6aIX6HzceVLpJG0jIRhiEkQw9qJJFSFG5fgwflM2fjTygU5NYdOjxQp5nwDDYMMnT7zKChzdB9xCVhkOQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hX/7mtpnbEcvTK2hLZSXQd8cgZXAbbd4xl6rmPdvMD+HhZwZHspQJ081G3t5WzAycTo9B56mggiaJNpn26ph9dlBZV9n/nGFY886Ee8M3RVvbT5R/jeqbQJNQyfhKxviDB4l/7b9znxBcOtuTw7znJlXysBDQS1xf3Q8v6yI10z+NxFdTWNQUpKnmpar1R9wP4chBOn5IuKfvAx5XXap9+uy34B4SmRE0sRE14gvQzyE+wS9RGM2Lf8+pMG+ViBAcqyMQQGEOzqIzFgKPmpgfJ/fmuAnAdnPWBOZ8FnDpBLF/pY1ccFLu0IHdody4SMxtZGr0lLkkoMuQ/7WUcOCA2f87O4kNTWwwSc2l+mT2YTD4t4eH/hedNc4YcJ8xBchekvG/li1Tm8TaCPigp9i6YoaIuFtPLBqK9Cu+cHUYpp6VL6JmakxCNHZ9EBQclbe
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:40:58.6965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b3ce54-44e2-4891-e545-08dea501defd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8782
X-Rspamd-Queue-Id: 8DCF84805DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59782-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:dkim,foss.st.com:mid,st.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

In the driver initialization, the index of the default media bus code
from the supported media bus code array is passed directly to the
vd55g1_get_fmt_code() function instead of the proper media bus code.

This works correctly as a proper media bus code is set after
initialization but could not have been the case. This also resulted in
mutliple "Unsupported mbus format" error messages.

Retrieve the media bus code from the media bus code array, and pass this
media bus code to vd55g1_get_fmt_code() instead of the code index.

Rename VD55G1_MBUS_CODE_DEF to VD55G1_MBUS_CODE_IDX_DEF and
VD55G1_MODE_DEF to VD55G1_MODE_IDX_DEF while at it to avoid future
confusions. Display the guilty error code in warning message.

Fixes: e138e7f00042 ("media: i2c: vd55g1: Add support for vd65g4 RGB variant")

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 78d18c028154..1e9db21322e3 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -114,9 +114,9 @@
 
 #define VD55G1_WIDTH					804
 #define VD55G1_HEIGHT					704
-#define VD55G1_MODE_DEF					0
+#define VD55G1_MODE_IDX_DEF				0
 #define VD55G1_NB_GPIOS					4
-#define VD55G1_MBUS_CODE_DEF				0
+#define VD55G1_MBUS_CODE_IDX_DEF			0
 #define VD55G1_DGAIN_DEF				256
 #define VD55G1_AGAIN_DEF				19
 #define VD55G1_EXPO_MAX_TERM				64
@@ -634,7 +634,7 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
 				goto adapt_bayer_pattern;
 		}
 	}
-	dev_warn(sensor->dev, "Unsupported mbus format\n");
+	dev_warn(sensor->dev, "Unsupported mbus format: 0x%x\n", code);
 
 	return code;
 
@@ -1347,6 +1347,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 {
 	struct vd55g1 *sensor = to_vd55g1(sd);
 	struct v4l2_subdev_format fmt = { 0 };
+	int code;
 	struct v4l2_subdev_route routes[] = {
 		{ .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE }
 	};
@@ -1361,9 +1362,13 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	vd55g1_update_pad_fmt(sensor, &vd55g1_supported_modes[VD55G1_MODE_DEF],
-			      vd55g1_get_fmt_code(sensor, VD55G1_MBUS_CODE_DEF),
-			      &fmt.format);
+	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
+		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
+	else
+		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];
+	vd55g1_update_pad_fmt(sensor,
+			      &vd55g1_supported_modes[VD55G1_MODE_IDX_DEF],
+			      vd55g1_get_fmt_code(sensor, code), &fmt.format);
 
 	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
 }

-- 
2.43.0


