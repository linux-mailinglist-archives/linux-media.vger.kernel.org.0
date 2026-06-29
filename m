Return-Path: <linux-media+bounces-65899-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B6aBM1NQQmqu4gkAu9opvQ
	(envelope-from <linux-media+bounces-65899-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:00:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 161FE6D924F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:00:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=EqNAkbNx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65899-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65899-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6807630AE347
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4959236C9C1;
	Mon, 29 Jun 2026 10:55:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E3B36C588;
	Mon, 29 Jun 2026 10:55:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730510; cv=fail; b=E2JjpwWtJEvJ2zkrEwcNxJvA9/DUL/YxfaL/urJ/g0zO0/W6hjBcX8U9i1sAb43mlNRyNFuulTv644DirZqC3wHpd34Rw0jjhSvbSePgQZ3rXhytYrvrKn9AEQIjeMkGqNtqJ9opQvruwNAMWl1+mEJlPOBpzrkEemx/O2SvsDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730510; c=relaxed/simple;
	bh=lkPmiq3+XXfd74xjVbMz1P49KcdtuYC6kGdtV9D15eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=b/eZg1esomhsgF4tYS6AR80nLFmL8RxbBNNnm3PQbnllLRFvSRMYGaOtgVfa+LVrR/09XcjVXodZSmJA8mzRjlFUcw4ty8Kw1o1LK2T12oCAocmMPLzvM0uyQktPycc8cznAk/MV3WC17k2mqVlXHhfWhL2jgWHymMyofGGFvPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EqNAkbNx; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkMYzuP7i4AXxs+gLI64VKEW1B+QnCunsnL5Y4Z3Ij4kTSKTPIkfG64FlmKaojF9qN5zCkV5pl126a+Y2LQ2JNl82HoRasbP06JYZvoS3+QdMAKS+TzwtjzWM9XsjE2GXLnOakJANCWLu+Xw+joBzLgw7Q7mcCmEWOzOfrc41QzzdW7OuFescAadXIIvYwtDkMq33hiYHvKEg3RAgdeWpfPM44KxBVWgmErpBLyuNYajYUCbhrwM0fjNr3PccwTjNOg9uWM9s8eB7PwJylMcvNyuXwGkCP7nMKvyynDqH7tqDk/RU6finKBm8hNXckho9WxaC1Yt3TiMamGZBwiEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MwW7F54P+l1UEyy+tF9IjCPNSYdgc2Te8wV3fBCPUI=;
 b=jN2Hf2rqzPUPiJlv493Galy7dsmYQMdVFRNdo6iWPXjExFRkGkO2vKu4aBhi6mvPdqw1tPg6CpXs4TOlCU5o9uOsrw/Dby+fD2umpTfjRCyKZeCMxcwOJekmKO+EGelz3lRQmw2Gj/UGZaCkfp+ORnZB+wD4+czz+aTjs1gcqFhOVC+/62NDDP8RJKOCTYNC1h7CkFuPhWai9CA835eJ4m4mKSwDWvjTUGsJ5cnDJkiY2A2DmKTB6gqRClWmWVLfDz93ZWy82XyG4t4Fk7SkORzxKI9fxijXWt3arfLeyDGbki1cWv4meLHA2/21Y5a/0dQRfhQas/Ry19LsETR38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MwW7F54P+l1UEyy+tF9IjCPNSYdgc2Te8wV3fBCPUI=;
 b=EqNAkbNxnVrbnuWYH7zQokQCMBmwuyr00415/MTr21z7vcYEBJ8iYgRqEvLaR+jxLFbZcimlauAd7Jo87aM682hAOsVYiM9Zz/t15/Y0eZw3qbolkjkzCA6VLQD1HnsXzvsVuapY1n9N82TWkmA4EfErV/Ue83HL+aleZhEsYYyPHiSFiL60NAm8P6yqSCS6IYtY4KEMLw10YppSS6raurTWPxOMk4eOzxb0LCP5JB6ElN/KQ4dNMNwkZtmL/Yfk4V+oF7bUBbV+MEUc/N4PL3eMH2DO9aFgd25t5kEzbkUFmfIhGy7Rl/8WagwKS8sORdMSiCYZuSIOFYR6DfAz8w==
Received: from AS9PR05CA0274.eurprd05.prod.outlook.com (2603:10a6:20b:492::16)
 by VI0PR10MB9635.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:325::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:54:59 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:492:cafe::71) by AS9PR05CA0274.outlook.office365.com
 (2603:10a6:20b:492::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:54:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 12:59:14 +0200
Received: from localhost (10.130.78.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 12:54:58 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Mon, 29 Jun 2026 12:51:50 +0200
Subject: [PATCH v2 5/5] media: i2c: vd55g1: Add support for vd55g4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260629-vd55g4_and_fixes-v2-5-ea0a7cf3cd66@foss.st.com>
References: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
In-Reply-To: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|VI0PR10MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e34885a-ff93-4df6-8367-08ded5ccdd5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|7416014|3023799007|22082099003|18002099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	DtZ/fDUSCeJS3wyU+pmvYm+Whb91XfWpv8Z3pqsV7ILLUtoNhyy5E6f4+98wZUcdvNcpxfu/8t8ds18pupqdmAlLTDkE6Hvy0UQwigMue8jJ+T+JlLI/N7msDbAAA219rgOp2czZI2yO8XxhCkQXrz/3Akla6qFFQ4y1lJoSXV96AJMHcbfxrZ11GUB2wWWMKWQL5sRF6iQIoWl+MCvbZ3MgsWjWh+OqQFoS+zOeU9hg5t8RAzYiEKgVs9zqzy3tBMiHfQ+25b/5VUq1Guvm6Xp99LkMx9SUIEA6IyWjPJRlSrxsGzdqnjQfApv4uF+2SaqXLJJKdtRNFLl9eFGtujkg/m83qdYLlPsf5aD7KGrxlEdMBZgiytSH0PrVb+OnY5WJN/X+/MJko1QdWtRfBtsInRYwwDDOMSr+u2vchFSiL/Is7C9Plb1+KKcu27Ws2EPpsJveDN3G4BD9x1zbcyUk9UKOdoFHSgWXNyALSBHtxDzI88kuk+x1zGzrH6hfjGlwUXzMkjHkbpfM4XsazF2IwaDMQ0MDgz/ExEY/PG95JTxgahiuwN3EhbJ8/SfDY+s9SwBJLTuPz+VpxXTHaPAhCEZ9JgglcIW+61wQqLjvuGoIhvKBBTPdYxf/pn34+aNuvCqh5pYZi5KE88KYIj2Kb26GzxTL9nKP9+ZZDTh01e05OegoyJ4XPyWe9XZJZtCuON1XbQU1vgK5L2NiSw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(7416014)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/4L6h4GfK7w0xgCa2YjryFLF+AlTxUeZQkiHrq+e4biy2Sh+ZSGhUo9hCXNxuk0/P+f9qN0eLFNal4ur8sGHMQKeTttCWnok9FzGyIbsMhtsnq9Gg7dEBgc+a/qHk72TheEjw+q0g9UubPynJwZTJB7JXew/waF3Ib5Vc/gXeyVeCUb/mDCnDhN2MQweVTcXCzTZujMETRe61PkWmp35Aqia23pukLpWwNzXeYLPvx6TCo36Aqq7D90BDTFNswkA2xJP08bfbQd7YLzS/lrZKKvyK0J7v4qf3EBv4obLUWKI6b4TM1IwLZTLNCswO5jCtbXYh+CUV1zHZrZZgP1JzQBIBOFGxwhz+ueu9mgXd1xVew8jdGIirkWXXhWYmJqOkJzlau7dpy3wfXA60DZmrKcX84h1wZy9zSQ9t5xt6xN6M5TwgaywUOxCmF8SP4PL
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:54:59.6389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e34885a-ff93-4df6-8367-08ded5ccdd5e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9635
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65899-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:benjamin.mugnier@foss.st.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:dkim,foss.st.com:mid,foss.st.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,st.com:email,ideasonboard.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 161FE6D924F

vd55g4 is the same device as vd65g4 but outputs in monochrome instead of
RGB. Adapt the driver structure according to this new variant, and add
its support.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 130 ++++++++++++++++++++++++++++++---------------
 1 file changed, 87 insertions(+), 43 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 37d44abd1435..c4142d771e7c 100644
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
@@ -137,8 +133,39 @@
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
+	VD55G1_COLOR_VERSION_MONO,
+	VD55G1_COLOR_VERSION_BAYER,
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
@@ -534,7 +561,7 @@ struct vd55g1_vblank_limits {
 
 struct vd55g1 {
 	struct device *dev;
-	unsigned int id;
+	const struct vd55g1_version *version;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(vd55g1_supply_name)];
@@ -625,20 +652,28 @@ static unsigned int vd55g1_get_fmt_data_type(u32 code)
 
 static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
 {
+	u32 fallback_code;
 	unsigned int i, j;
 
-	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
-		return code;
-
-	for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_formats_bayer); i++) {
-		for (j = 0; j < ARRAY_SIZE(vd55g1_mbus_formats_bayer[i]); j++) {
-			if (vd55g1_mbus_formats_bayer[i][j] == code)
-				goto adapt_bayer_pattern;
+	if (sensor->version->color == VD55G1_COLOR_VERSION_MONO) {
+		fallback_code = vd55g1_mbus_formats_mono[0];
+		for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_formats_mono); i++)
+			if (vd55g1_mbus_formats_mono[i] == code)
+				return code;
+	} else {
+		fallback_code = vd55g1_mbus_formats_bayer[0][0];
+		for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_formats_bayer); i++) {
+			for (j = 0;
+			     j < ARRAY_SIZE(vd55g1_mbus_formats_bayer[i]);
+			     j++) {
+				if (vd55g1_mbus_formats_bayer[i][j] == code)
+					goto adapt_bayer_pattern;
+			}
 		}
 	}
 	dev_warn(sensor->dev, "Unsupported mbus format: 0x%x\n", code);
 
-	return code;
+	return fallback_code;
 
 adapt_bayer_pattern:
 	j = 0;
@@ -1182,8 +1217,8 @@ static int vd55g1_patch(struct vd55g1 *sensor)
 	u64 patch;
 	int ret = 0;
 
-	/* vd55g1 needs a patch while vd65g4 does not */
-	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
+	/* Version 2 needs a patch while version 3 does not */
+	if (sensor->version->id == VD55G1_MODEL_ID_2) {
 		vd55g1_write_array(sensor, VD55G1_REG_FWPATCH_START_ADDR,
 				   sizeof(vd55g1_patch_array),
 				   vd55g1_patch_array, &ret);
@@ -1255,7 +1290,7 @@ static int vd55g1_enum_mbus_code(struct v4l2_subdev *sd,
 	struct vd55g1 *sensor = to_vd55g1(sd);
 	u32 base_code;
 
-	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
+	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER) {
 		if (code->index >= ARRAY_SIZE(vd55g1_mbus_formats_mono))
 			return -EINVAL;
 		base_code = vd55g1_mbus_formats_mono[code->index];
@@ -1371,7 +1406,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
+	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
 		code = vd55g1_mbus_formats_mono[0];
 	else
 		code = vd55g1_mbus_formats_bayer[0][0];
@@ -1658,38 +1693,46 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
 	return ret;
 }
 
+static const struct vd55g1_version *
+vd55g1_get_version(enum vd55g1_model_id id,
+		   enum vd55g1_color_version color)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(vd55g1_versions); i++) {
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
@@ -2047,8 +2090,9 @@ static void vd55g1_remove(struct i2c_client *client)
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


