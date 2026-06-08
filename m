Return-Path: <linux-media+bounces-64199-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qzkXDh3XJmoMlgIAu9opvQ
	(envelope-from <linux-media+bounces-64199-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:52:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A78F6578AB
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:52:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=selector1 header.b="LG6/RmwI";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64199-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64199-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E97D631D087C
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379CD3D16F4;
	Mon,  8 Jun 2026 14:29:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361893CDBAA;
	Mon,  8 Jun 2026 14:29:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928953; cv=fail; b=k9m0r9gDULX31D17aFRAi3VB3EhAFd43LP9aUoWH6ndY3pVhFqWyXlLWRfEMIUg1KYgEfekzU5pl72BnU3hHwrbjISUCPH9c6Bp1oP4y/vRUFI0KX/UoVGWsBxjeYhM2nVB0MfZyDtt98gAqcl1OJChJvExM6rcxI0gskpm08TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928953; c=relaxed/simple;
	bh=ihIjYekTERBLXDwYon1aMsAPVM1SpXG3A+jrxK+6bnc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P45oS2//A11lAnM4/jruBZrndbAn3KK2L/pRevQ9FeDCyDQq4QlM+rZ1it7zBm8hVsIo59pnIVzSNvepNh7iRqxCCkBjWGrbKjOrd/tZXhDia50uYqh/kZsH1RTHwY5Q8Ow+uzT86eu8QOLwD076Mx0Nqgs0LntnEqtWhorKPDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LG6/RmwI; arc=fail smtp.client-ip=40.93.195.55
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khcfsyuBMDTptQzsZ2bHcF//16hVbwZdoV/Ydz+MlJBcwWY0e4T9o9ld+4SOUTBK781/g9c/cv0uoGx2x5WK12uJ5dM9MuMdnIBZ4WHG8NogU0J3djwdRlUGqhDQWdOFxQCRitXZAU1yA4TZGXlY6jOGfsJlZpvT6OuCWTz1ioy0UtOHWtxd01yBLx36WZj3vl7jWfrFoD/gV6V7N8bZmtJk3kDujRvUzMR3i1uwpwiyI/UU41zfbRf3qc2LO64H5L+CXwLht+22JYLbOiV40/W7aVYSJqOTwu3vUoDfw3GAaiEelDnTbC5PBa/PR1QXqvB9Vb3Enm6W8jPNSJldxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nsypIxkl3wh1TwYFLY4riDZ82BhRN8v+O6aZOPmQkE=;
 b=A3bhHb5MLyatbV3VdMI1DkQRw2+Juq+GwUNolaQQSQ7Z49Mumj5MesXl4LYzRDboLDOOGWtSUiZ6XUDK4PU/0A4O2gVrz/ZZwTvG0p6k5Jum+fV5warI9zeSgs94vGYNXZxbPfDn8h5c6EC5aiYIJ/IYfLQWi8Oim9x9Zi3DWCkCW7FvLKd1XDZECiOlKSrnjtlOHugbENNrlVEQBKpiEN3D/plWyI8P/iqs3E/RE/HYRFot797C6KvpfurqhDoZRlW/kG3IFyHVAXSI75e9IJwF5jHJmMSzPBq1m7qO0X5FSbe/aRNsfhuyViVrsjfJ1Ta3hLso+hxGqNEvAg8+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nsypIxkl3wh1TwYFLY4riDZ82BhRN8v+O6aZOPmQkE=;
 b=LG6/RmwI8BqEn/Kan1nL6tNZXBKsOtwLHPGSewA5MPXkmedTsQiSoQuKnxkO9QpQoOHgExUbmlznCStmZPWc8TpePOSdEeExh/rAosZwk/V1tgfihmo0mWMq+Oaf/EYC1X2v4hBweY0cqJUMHIM2elkOuFuKOZxuCPkuTj1ZdP8=
Received: from SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7)
 by SA2PR10MB4521.namprd10.prod.outlook.com (2603:10b6:806:117::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:29:10 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:20:cafe::72) by SA9PR03CA0002.outlook.office365.com
 (2603:10b6:806:20::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 14:29:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 14:29:09 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 09:29:09 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 09:29:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 09:29:09 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658ET2bD3251356;
	Mon, 8 Jun 2026 09:29:06 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <tomi.valkeinen@ideasonboard.com>,
	<jai.luthra@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH 1/4] media: i2c: ds90ub960: Enable CSI TX1 port
Date: Mon, 8 Jun 2026 19:58:58 +0530
Message-ID: <20260608142901.3971821-2-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608142901.3971821-1-r-donadkar@ti.com>
References: <20260608142901.3971821-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|SA2PR10MB4521:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6f9849-1b00-4ac5-e4f7-08dec56a4de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|3023799007|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hkAk14MdyhpEUbM0Tw6kXcxS1xlDNN/GlAWOuQW4QIa62ajy1XlRJakaS+868xynaCay3HG9a+1NowxWlgNrFwQycWpfy17aEi40fVuyKBmstvh9vUGC2+ZcV+pAn/uT70YV0j3+tpKqoJcLE0YHTLTMDgRpl0u2n3jFqY4Veh6yqJkJl8HJ2tA8K6kIJ0A+3wj+bEgtSkjo/d+koHf+iNBVbSIi5mXjhLwCbqNT3dzcjjHqYfYyZFObD2ePDfw+yf8IAbKu0fRe/+JipQ6dKM3n5Uxg8mILqNmFFzgf5nFLPKZW8PP2w9VXg4yJkHiTFoE2QQ8P/sLXOXJhSMx+62RArwgLhcdigGlk+iV25YpaFbFV18jtXEHiB0oUrNVlJZrP07xGtPhUaF2D58ZS34DE2ZB9x3sI6f1jhg0Vg8P38GJnHKcQlGKaZRRoXDHA6S+VsII01nEEkDDzx5vl9hOVq/lSFADs7w9fKaZGBbg7GQoEOkI1BpQGpSR6Vgymo82FSKRLme4R3yJ6xXdSiUYcpqGD0ks59UZHE1CxrB6wRZ1HxLgrFvEhjEGYFz8cBWSYXn9Gz7wce+z4TEZ9GF/smwvtsheNIme983KeRfTAly5DDEzFsWA9kY0k3+Rw88aTU8IEFSgour2NzdBKzJJB3lMdVVfuV/Or1dAJOCBOOmK4rj0t4T/HtmT8J9kCyjs8zYugyvtjvVq8v0kKM7nhY2i1bgtRmJLJb9GPPNs=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(3023799007)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	enGb601N5W/sV6ZHazaLoyNY1IIqwpBDupEL1lQQfDpc9rxYOo7+ldO0bbxHWRlwNrCQSir5ZBF7aYa5sCJIprrb/Kt0uuAhLUENPDE4oOMK6l1btzjX3AfmmNcOzz9eiQeGQCE/W6La3/ZX0prgw1F6u92ZTXtGqLf0NKb6GCYIQbI34c8UdMj2oGKi4TpixNU0gJWfv8L1pQ33WtazVg7UiDybdMyYCfdZF14bUC12/fi4qraZauwKbD9i/cI+l/UhaVF9+iDrguI8rXLfZfwBriPK+UemZKjFUKcizY8fmrmavVi6ZnqhFWQ9E8LhOr64AqFCmlIgyDYzua4tmllezAxnloGAeGzztyy6iS63DVJHoCUeZIxNSrKqNg+uGUUvDZBD0kpGpPs4QyOB3oOuME46Kh9zxbsYbUxTr/H6bKYHjuGvpb/lCKy/imPk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:29:09.6891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6f9849-1b00-4ac5-e4f7-08dec56a4de9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4521
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64199-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@linux.dev,m:r-donadkar@ti.com,m:y-abhilashchandra@ti.com,m:devarsht@ti.com,m:vigneshr@ti.com,m:mchehab@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:jai.luthra@ideasonboard.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ti.com:url,ti.com:from_mime,ti.com:dkim,ti.com:email,ti.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A78F6578AB

From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

The DS90UB960 chip has two CSI-2 transmit ports (TX0 and TX1), but the
current driver implementation only utilizes TX0. To enable TX1 as the
active output port, the I2C Bidirectional Control Channel (BCC) mapping in
the RX_PORT_CTL register must be configured to use I2C Slave Port 1.

This patch adds a new function, ub960_parse_active_ports(), which is
called during driver initialization to scan the device tree and identify
which RX and TX ports are enabled. The function creates bitmasks
representing the active ports and uses these masks to correctly configure
the RX_PORT_CTL register, ensuring proper port routing for whichever TX
port is in use.

DS90UB960 data sheet: https://www.ti.com/lit/ds/symlink/ds90ub960-q1.pdf
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/i2c/ds90ub960.c | 46 ++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 15a9797b47ac..653dc7a4eee5 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -26,6 +26,7 @@
  * - i2c-atr could be made embeddable instead of allocatable.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
@@ -76,6 +77,8 @@
 
 #define UB960_NUM_BC_GPIOS		4
 
+#define UB960_CSI_TX0			BIT(4)
+
 /*
  * Register map
  *
@@ -114,6 +117,7 @@
 #define UB960_SR_SCL_HIGH_TIME			0x0a
 #define UB960_SR_SCL_LOW_TIME			0x0b
 #define UB960_SR_RX_PORT_CTL			0x0c
+#define UB960_SR_RX_PORT_CTL_BCC_MAP		GENMASK(7, 4)
 #define UB960_SR_IO_CTL				0x0d
 #define UB960_SR_GPIO_PIN_STS			0x0e
 #define UB960_SR_GPIO_INPUT_CTL			0x0f
@@ -589,6 +593,9 @@ struct ub960_data {
 	u32 tx_data_rate;		/* Nominal data rate (Gb/s) */
 	s64 tx_link_freq[1];
 
+	u8 rx_mask;
+	u8 tx_mask;
+
 	struct i2c_atr *atr;
 
 	struct {
@@ -2538,7 +2545,18 @@ static int ub960_init_rx_ports_ub960(struct ub960_data *priv)
 	struct device *dev = &priv->client->dev;
 	unsigned int port_lock_mask;
 	unsigned int port_mask;
-	int ret;
+	u8 enabled_rxports_mask;
+	u8 enabled_rxports;
+	int ret = 0;
+
+	/* Configure I2C interface for RX ports */
+	enabled_rxports_mask = FIELD_PREP(UB960_SR_RX_PORT_CTL_BCC_MAP, priv->rx_mask);
+	enabled_rxports = (priv->tx_mask & UB960_CSI_TX0)  ? 0x00 : enabled_rxports_mask;
+
+	ret = ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, enabled_rxports_mask,
+				enabled_rxports, &ret);
+	if (ret)
+		return ret;
 
 	for_each_active_rxport(priv, it) {
 		ret = ub960_init_rx_port_ub960(priv, it.rxport);
@@ -4789,6 +4807,30 @@ static int ub960_parse_dt_txports(struct ub960_data *priv)
 	return 0;
 }
 
+static void ub960_parse_active_ports(struct ub960_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	int nport;
+
+	priv->rx_mask = 0;
+	priv->tx_mask = 0;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports + priv->hw_data->num_txports; nport++) {
+		struct fwnode_handle *ep_fwnode;
+
+		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), nport, 0, 0);
+		if (!ep_fwnode)
+			continue;
+
+		if (nport < priv->hw_data->num_rxports)
+			priv->rx_mask |= BIT(nport);
+		else
+			priv->tx_mask |= BIT(nport);
+
+		fwnode_handle_put(ep_fwnode);
+	}
+}
+
 static int ub960_parse_dt(struct ub960_data *priv)
 {
 	int ret;
@@ -5162,6 +5204,8 @@ static int ub960_probe(struct i2c_client *client)
 	if (ret)
 		goto err_mutex_destroy;
 
+	ub960_parse_active_ports(priv);
+
 	ret = ub960_parse_dt(priv);
 	if (ret)
 		goto err_disable_core_hw;
-- 
2.34.1


