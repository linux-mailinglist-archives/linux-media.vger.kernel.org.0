Return-Path: <linux-media+bounces-59784-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kINNHFp38GlgTwEAu9opvQ
	(envelope-from <linux-media+bounces-59784-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:01:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D1F480CC7
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6688F32FFA69
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FB23D524E;
	Tue, 28 Apr 2026 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="VCj/6o9z"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011049.outbound.protection.outlook.com [40.107.130.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4406A3D75A0;
	Tue, 28 Apr 2026 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365670; cv=fail; b=eVv8oj4+pdnZDL7odUyB4Zc1mYkkPyi29jb7ZMt9/CEkpWsDz359rmpxN8jwf+PmQTiHPQmyxHw2Dk8wp2HgvHP/XTLQT8NkdX/cB84m6KY8Kfl4LhOStr9EbY7XME9pOE0KOpgRL4grQptGinZOUIvBbLZ57QUE7YjX57PyYIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365670; c=relaxed/simple;
	bh=thoyuZdo9XWEOUcYnNU2ur8iLcBUTTqYQlBHMnjtnxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=U660kKfI6SJZCZG39I1c0FdRPGVmfYg+dv6JJMCX2aRY06yQNyAZdzv51CxX3wzmYhYI+09ba+Mtw4U1oCg63taxRIIFRvDC1k8Q6a8DeOs1n5MOE7mLntSwybNdE9+5/C8yTFT1Yuex4/NfokV1fWR6idkt5+O/OYqe8iLvUZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=VCj/6o9z; arc=fail smtp.client-ip=40.107.130.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekQ6Nz1ebHApFbo4lcEOwNcJP22KL+Hve5gUBdq0TWB5Ne3gQ7xjckF8MzC6oW7vOnK7LqX2VCU4K2LaVA72jDkrHpoAB4NbITykQS5oiuAOYfZ+Jm2OG2Tuhmk+S1aUoECpwI9NvnhRnxQu9q1vvcfRXwZzhbwI0qwXwb9jdobE50j4iLicM6WXdrNyjYNdkp4AM+jHPy5Mo5KLKgBIB/WR7pK6cE3SUY0hkdjSQqzKqWRiHYxgD1FOAYuWr8E93VyaWnRkM1ePbfJdsbyMpd3whpzO1VfyPwWm/VKwddDyQTeFCc1maat6oX6P0FmYvPWcuaYamv/1A8g1pP/fXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q76Er9P3YRyKzyVRjXRi/XfOaU125s19oTDyyv6CaVY=;
 b=ZUOwEKQjqC+mQMhmx+LrlFMdHVgpW2FkI/MC/HXBYlF/RYs6LFYORxRwKWIoc+1xJn2H3qh+e5IXr5xN6CKDlwL3H5vtmjM009754B+KljeOn0v3du5vAGUEcuwWVCUF4r3isVg8qZQg1NnSJ9HzbZ5x5TCS7oKGEY74ws+AMHU09qlVQa0pbd8p8Mcnnufe2Eed4TWsJziorJqkTR9B/OVbROxgbeYL7BXSyLJiDCxh8KVNKldIK26bh48eYYAu4ym288lCoLavGZ9mI29L9bqq3rSgOIIizi5OuYaeElvFw6tvEB5khhSsZWGTRvBCKgva0THs54g68mhJJL4mRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q76Er9P3YRyKzyVRjXRi/XfOaU125s19oTDyyv6CaVY=;
 b=VCj/6o9zFV90w81gW8m5/q1FGRT8keoyk+EiSihw0nrk5B6iJ8fZicYJ5B0gKkMhp8ZMASvWsXsvEalQLfOhowgLK2/OB5b4BO9kc+fToREb34tu6o0rSrXBfAn47sWrMoWsGfh+LIaU4/tySVFfmszYldGA0yy6DJdN84cV6PA/b5KteEyTpAc3OXFnHG9TDpjsejZBct7bMqjlbm6KK2XCXVURIsUrkvtAV16fVEV3K0c6XvCuy5TLbOL5mAT9O5clIcYC6pR6dW3QmZvvW5d7E2bZj2ETKeGwW54jSBuia9s3bwlrJs5H6vSEgdcCm4gAL84JWW7+kjmyDlWTHg==
Received: from CWLP265CA0406.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::9)
 by AS8PR10MB7157.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:61f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:41:03 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:400:1b6:cafe::1a) by CWLP265CA0406.outlook.office365.com
 (2603:10a6:400:1b6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 08:41:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 08:41:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Apr
 2026 10:44:32 +0200
Received: from localhost (10.252.13.121) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Apr
 2026 10:41:01 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Tue, 28 Apr 2026 10:40:58 +0200
Subject: [PATCH 4/5] media: i2c: vd55g1: Add support for vd55g4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260428-vd55g4_and_fixes-v1-4-4f745a83b87e@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B6:EE_|AS8PR10MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cbc49e7-bf0f-4310-e9c1-08dea501e0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3iJ8UtEFJnv5XuV8jr90KLiXTvzKD2299nWcOIyZc2dvdykkCeQTmw83e7hCmqreaGLtZisDCz6ruEPV0g/ajOxxCCkkl8jDo/T082bwJe9OMHmxGexoG59tDMJr5b8QZnmaT/AMSo8TIEjRCZtMvdHtVzBIkQu6KWd+7Ba7UP7DaxAjgpeQGVx1kNP43ZIumw5SAOm+G2EWNTsgzf+uVvdFQgwmzyCqDkuqWycxJjnGZ3ac7hwIn8GEtPkCzxob4GO9PXxm0bCyMHqChZ/iLz+pbR7L+/Ty2dGFeOvWs1xOXlvKb2KpVjftr3ILZiOiEEx9j7ASNHtqJPJx+Pe0MFcWeeiY+TsSiXlB8WM9tzOGAUzuxnV1EMzRASzRlvYUenAep2rJsMhIziEmGDYd/qFzzSKBVxC9mF68VD3NTnSMZ3n+YG3cEbGJXt8ZyIQfje7HZQ0lWtCqGWysNw2WRlfk3tDJNKuSjYZU5voe14Srz7IloYF8VR9yugFwI0o5YCI+bmKOzSsc6J0oUL6Yah8EGzvFTTKyOtJHJZ5CCA6G1aBw54S9UFpe5g0yoawCL7UfBAoPx9WZMU0wpreRNTvOTZK2MlAQ2KU1zM8g/ypqwd0456cLn9g/gQYkG9/WRXY8ffzHbICu4BSW15Q4aGH0dOb4UwYz3837H3oZG7toGNV5NG/pNWi14SjlVP3HHotbs0y7t/yT0VSqGU11EwfkqAIebdlArwJJUM8nYpn+rY27gvaVL1dnvQ/UtGeT58ZRRDshAppzQxdiZJHP9w==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cdmtuhUOIuR5UGsYMzzLyg/JumWwKQpljq4kUG9t+w80jQY+fW4zOFmfgiJUaiv8GZgs8hx5qjGi0CEs9OLZbj5k8/oNQ9cBDwCbvVY18A/Vb4jN1gFWRULJBRReouY+MjjTp2v1F+5dpuKscAhn5A0p+aesmXjjNHM/x9fXTx+FHE+nGf585NAGKTJfbb1FMR51zDUtdgsxrEPklBhHTxljF6cqZwWldtIxBfHGBeUuhbUzhgcqFe+Jyx2t2cZjK4Bq3s55iQZ6arpbdaJBTw4O+9UrMKZk0u8HSKb0fEG01WhPs9hWmIsxmx4lB2NzNwNowTwjKcKQ+KiKbqRvX1sIV6L9ji9UQp9ldzV9BctRWxBIuBAZJa80GhmceaHgJeuCMbFnEJwYS9JAYzznKx+u/EihObbMP/vei0oh32G6CPgbPXpeoe2WeaT9jMFZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:41:01.8400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbc49e7-bf0f-4310-e9c1-08dea501e0db
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7157
X-Rspamd-Queue-Id: 68D1F480CC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59784-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foss.st.com:dkim,foss.st.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

vd55g4 is the same device as vd65g4 but outputs in monochrome instead of
RGB. Adapt the driver structure according to this new variant, and add
its support.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 110 ++++++++++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 36 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 2c962fcb41d2..9f62fc0428a1 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -29,11 +29,7 @@
 
 /* Register Map */
 #define VD55G1_REG_MODEL_ID				CCI_REG32_LE(0x0000)
-#define VD55G1_MODEL_ID_VD55G1				0x53354731 /* Mono */
-#define VD55G1_MODEL_ID_VD65G4				0x53354733 /* RGB */
-#define VD55G1_REG_REVISION				CCI_REG16_LE(0x0004)
-#define VD55G1_REVISION_CCB				0x2020
-#define VD55G1_REVISION_BAYER				0x3030
+#define VD55G1_REG_COLOR_VERSION			CCI_REG32_LE(0x0670)
 #define VD55G1_REG_FWPATCH_REVISION			CCI_REG16_LE(0x0012)
 #define VD55G1_REG_FWPATCH_START_ADDR			CCI_REG8(0x2000)
 #define VD55G1_REG_SYSTEM_FSM				CCI_REG8(0x001c)
@@ -138,8 +134,39 @@
 #define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
 #define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
 
-#define VD55G1_MODEL_ID_NAME(id) \
-	((id) == VD55G1_MODEL_ID_VD55G1 ? "vd55g1" : "vd65g4")
+enum vd55g1_model_id {
+	VD55G1_MODEL_ID_2 = 0x53354731,
+	VD55G1_MODEL_ID_3 = 0x53354733,
+};
+
+enum vd55g1_color_version {
+	VD55G1_COLOR_VERSION_MONO = 0x0,
+	VD55G1_COLOR_VERSION_BAYER = 0x1,
+};
+
+struct vd55g1_version {
+	char *name;
+	enum vd55g1_model_id id;
+	enum vd55g1_color_version color;
+};
+
+static const struct vd55g1_version vd55g1_versions[] = {
+	{
+		.name  = "vd55g1",
+		.id    = VD55G1_MODEL_ID_2,
+		.color = VD55G1_COLOR_VERSION_MONO,
+	},
+	{
+		.name  = "vd55g4",
+		.id    = VD55G1_MODEL_ID_3,
+		.color = VD55G1_COLOR_VERSION_MONO,
+	},
+	{
+		.name  = "vd65g4",
+		.id    = VD55G1_MODEL_ID_3,
+		.color = VD55G1_COLOR_VERSION_BAYER,
+	},
+};
 
 static const u8 vd55g1_patch_array[] = {
 	0x44, 0x03, 0x09, 0x02, 0xe6, 0x01, 0x42, 0x00, 0xea, 0x01, 0x42, 0x00,
@@ -535,7 +562,7 @@ struct vd55g1_vblank_limits {
 
 struct vd55g1 {
 	struct device *dev;
-	unsigned int id;
+	const struct vd55g1_version *version;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(vd55g1_supply_name)];
@@ -628,7 +655,7 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
 {
 	unsigned int i, j;
 
-	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
+	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
 		return code;
 
 	for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_formats_bayer); i++) {
@@ -1183,8 +1210,8 @@ static int vd55g1_patch(struct vd55g1 *sensor)
 	u64 patch;
 	int ret = 0;
 
-	/* vd55g1 needs a patch while vd65g4 does not */
-	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
+	/* Version 2 needs a patch while version 3 does not */
+	if (sensor->version->id == VD55G1_MODEL_ID_2) {
 		vd55g1_write_array(sensor, VD55G1_REG_FWPATCH_START_ADDR,
 				   sizeof(vd55g1_patch_array),
 				   vd55g1_patch_array, &ret);
@@ -1256,7 +1283,7 @@ static int vd55g1_enum_mbus_code(struct v4l2_subdev *sd,
 	struct vd55g1 *sensor = to_vd55g1(sd);
 	u32 base_code;
 
-	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
+	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER) {
 		if (code->index >= ARRAY_SIZE(vd55g1_mbus_formats_mono))
 			return -EINVAL;
 		base_code = vd55g1_mbus_formats_mono[code->index];
@@ -1372,7 +1399,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
+	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
 		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
 	else
 		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];
@@ -1659,38 +1686,48 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
 	return ret;
 }
 
+static const struct vd55g1_version *
+	vd55g1_get_version(enum vd55g1_model_id id,
+			   enum vd55g1_color_version color)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(vd55g1_versions); i++) {
+		if (vd55g1_versions[i].id == id &&
+		    vd55g1_versions[i].color == color)
+			return &vd55g1_versions[i];
+	}
+
+	return NULL;
+}
+
 static int vd55g1_detect(struct vd55g1 *sensor)
 {
-	unsigned int dt_id = (uintptr_t)device_get_match_data(sensor->dev);
-	u64 rev, id;
-	int ret;
+	const struct vd55g1_version *dt_version =
+		device_get_match_data(sensor->dev);
+	const struct vd55g1_version *version;
+	u64 color, id;
+	int ret = 0;
 
-	ret = vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, NULL);
+	vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, &ret);
+	vd55g1_read(sensor, VD55G1_REG_COLOR_VERSION, &color, &ret);
 	if (ret)
 		return ret;
 
-	if (id != VD55G1_MODEL_ID_VD55G1 && id != VD55G1_MODEL_ID_VD65G4) {
-		dev_warn(sensor->dev, "Unsupported sensor id 0x%x\n",
-			 (u32)id);
+	version = vd55g1_get_version(id, color);
+	if (!version) {
+		dev_warn(sensor->dev, "Unsupported sensor version, expected %s\n",
+			 dt_version->name);
 		return -ENODEV;
 	}
-	if (id != dt_id) {
-		dev_err(sensor->dev, "Probed sensor %s and device tree definition (%s) mismatch",
-			VD55G1_MODEL_ID_NAME(id), VD55G1_MODEL_ID_NAME(dt_id));
+	if (version->id != dt_version->id ||
+	    version->color != dt_version->color) {
+		dev_err(sensor->dev, "Probed sensor version %s and device tree definition %s mismatch",
+			version->name, dt_version->name);
 		return -ENODEV;
 	}
-	sensor->id = id;
 
-	ret = vd55g1_read(sensor, VD55G1_REG_REVISION, &rev, NULL);
-	if (ret)
-		return ret;
-
-	if ((id == VD55G1_MODEL_ID_VD55G1 && rev != VD55G1_REVISION_CCB) &&
-	    (id == VD55G1_MODEL_ID_VD65G4 && rev != VD55G1_REVISION_BAYER)) {
-		dev_err(sensor->dev, "Unsupported sensor revision 0x%x for sensor %s\n",
-			(u16)rev, VD55G1_MODEL_ID_NAME(id));
-		return -ENODEV;
-	}
+	sensor->version = version;
 
 	return 0;
 }
@@ -2048,8 +2085,9 @@ static void vd55g1_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id vd55g1_dt_ids[] = {
-	{ .compatible = "st,vd55g1", .data = (void *)VD55G1_MODEL_ID_VD55G1 },
-	{ .compatible = "st,vd65g4", .data = (void *)VD55G1_MODEL_ID_VD65G4 },
+	{ .compatible = "st,vd55g1", .data = (void *)&vd55g1_versions[0] },
+	{ .compatible = "st,vd55g4", .data = (void *)&vd55g1_versions[1] },
+	{ .compatible = "st,vd65g4", .data = (void *)&vd55g1_versions[2] },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);

-- 
2.43.0


