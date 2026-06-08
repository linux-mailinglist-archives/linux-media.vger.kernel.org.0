Return-Path: <linux-media+bounces-64201-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gfwvJC7XJmoQlgIAu9opvQ
	(envelope-from <linux-media+bounces-64201-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:52:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 054456578B9
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:52:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=selector1 header.b=ipzCPyBp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64201-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64201-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28C62304E4DA
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B195B3D25CC;
	Mon,  8 Jun 2026 14:29:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B9637FF68;
	Mon,  8 Jun 2026 14:29:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928968; cv=fail; b=Qx71JfV+mVzZEjA2/7wcsknBt7kTusKu2dWuQoVyU5td/RNZ/wpyks/pl4Lk2RxpMtQjMjlBvbm4yMTiPXeDvQjWAUF9uxpulCTNg9HloNUGJOjmcy9CxV1N6j34HMxBFiU+1Pdb443DcNz/6moAvEVXReAtaf7kDI3AcveWyjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928968; c=relaxed/simple;
	bh=RgPLQ6gZiGDw6556ZdPlmli+vKVhsC0j7DZEq07NIPw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H3WPSgM2sg0r6vx+sfJfRaOhxMuoQaxmYNOgPpbngyUCL8vPkDiW6FJb4xos+mgrFQ03rHkd29RytK5eC4mGew4I2sTQL1XtA3mIWo5jEZ3jLJ1GRCC5TrdB+1Ex1ag1+KTrfUqeMDUKgQ1MBhk8uIzkOuyk2pslIWfVjRo/vzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ipzCPyBp; arc=fail smtp.client-ip=40.107.208.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd+ElaoHXuwH1mifhxIOw5wn2kgKYh1l8gQaHFFcEd/7iPzYD3lzNQAYHrkgLhUmkxzYhRxhRjnVO3t8q5fzTvvuD0YSzTfV+UW431HtuzK4y3KbgcsGpxmbSdU3ldDe3/1u/vYntjf5gntW6K6UMRDIdsZ+Mm3v4EBQmKjEIaDYBxFVI03MeghpTjudhCDyznnHDk/uxmghcXTWTLWxM0jEM5pRvuD/71WQda9WK7OmXYA8QwaVcHaJ+h+YDLW8LrF+KioSYCzGYZIi6XKSQQhsW0enhuDWodLXGL4Xyg4b72isjX+sGQ+dZ5IMTKWUIckWyOB9q3baa6mEVYUt2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHMcjeXfs/NzVuRr6EPGEpO7ZC+CEWFE6+Q8tARMUFk=;
 b=nflWsFBvXct91zSrH8E0U3hTX7d9yARtJEyu4FCcgRtmGeYrTDjvYMwazbJDX5ngRZy9sZA9ZgTO0T4KgYhQAnuonKEs1onBaLWMoeQXX6SDX/Nrv2IYyPMGdlRhvbT0pa8Kg0wNtIFB4qcb33MwhBeXvPfHX6SAUqDmUUURADYicixtWvWF5Ow4gah75xqf7iClzSv8/Wnw0CO77I23YomR/Csq/iwJCp2G6nPVyk7QSp2GsFrsaLwTmctUaAmwGI9w51vTOC4Xa1CQVklzPcLIj3nV8ae5XeKXe5F0T8RNeqKEcXBaFzajrMvrNiPGfTOeRMwINGZLNOcjDrewjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHMcjeXfs/NzVuRr6EPGEpO7ZC+CEWFE6+Q8tARMUFk=;
 b=ipzCPyBpwJVEyKr4NVsScXIPuPgInGweawyVGGqyrD2HN7lhp8DKB8Oa4HpoSdib6ZmuWFNHCkWoVRXhl9vhe3ESxVKxj+z4uCzYz5trNiZYKnsX31CdUnox406u6GVIJFSZNpjUeUc+F66fp8+nmmfINHq3NyTzB1qPs8Mh1r0=
Received: from PH0PR07CA0059.namprd07.prod.outlook.com (2603:10b6:510:e::34)
 by IA3PR10MB8346.namprd10.prod.outlook.com (2603:10b6:208:578::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:29:24 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::9a) by PH0PR07CA0059.outlook.office365.com
 (2603:10b6:510:e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Mon,
 8 Jun 2026 14:29:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 14:29:23 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 09:29:12 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 09:29:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 09:29:12 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658ET2bE3251356;
	Mon, 8 Jun 2026 09:29:09 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <tomi.valkeinen@ideasonboard.com>,
	<jai.luthra@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH 2/4] media: i2c: ds90ub960: Support multi-channel sensors
Date: Mon, 8 Jun 2026 19:58:59 +0530
Message-ID: <20260608142901.3971821-3-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|IA3PR10MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f6ca5b3-7d9c-447b-ed54-08dec56a566b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|3023799007|56012099006|5023799004|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	5NWCt85cG2HpHxJl5fD7m0SdowFw+s/a+OJn4sUhRDEASmEQjy22906TSKN9Xkn2hnB8/hnNEw2Di6MUOaZ5nzXA8gLoyX85Xsw4d6YVcIT/oEFjHm8su3NtZoJ/6Cd14V/gKRCSJUAw+9fJjNblAv9t4nS6HnsF62b9UiWMQryzmEsbQgcxC67It0JOXsHENzviCLkRZPIxyvkDau0gLGdBjIZ7UYsSeN7AwdBbqgQ/kaiWiAL13O0Xs5TNXTUtH+uAxpoSfGfoITxDo805SLHY7nXapVxk8Wh7/ZXGCnbjY7aUSPtx7RJgkwLVorcRIGDJw1oJ85Y4K2vuGvdzdn0cZM7U2kLsOERAYaW0QvgyDSFOIikgCyeYi/IKlJPdqKU2DmZJZpYmd5DN4j3EsG9UyA/A9HshB/Ne86iGBwrS9/Es4ZIQBTBFJxOsfip9BScMN6ShpGIN6WvB9Sfd45TwKS8NCPi+67Jm3u0N3/ONJLlyIbMd6AdH0bZxnr9XO3FchR/A6caJ8IjhHdiKZ9IRfDp4p4Njeq7deUZKr4DBvBsOpBQ5BJpsJUF2fYAouLoiy+9VGVKwYwQudBkf3q47CHoEIaO8r4o9smeRNqoUSIQ+n2OKU2AD28Fk3BksPrfsrerrBjXkKPaqFFK3EK3FpFSQwR3Re0iSEh3nR4I1rulRyps8+pWuJ1MdwJunxpqPvmzuKF/AySbYq6UZDg4B0jGn490rWIGECDvxUao=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(3023799007)(56012099006)(5023799004)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5c0Q6YX8xnrL4uE4yRggze3DaUQ6oPkv5IJj8tN/7uNn9yzNgsH6FrEpc25tzMswNVb397fC4R7pg2npLTqARVFIpQuXe0bDvNcEL423/0gWvZR1/7ek53FlrGhJOIzIRESouaAOB44lI4MEQ+CYhRiAteDsMozKcspAzx+6bd+qX4hRryNRzFZQYPKWmOXsco41Ny9cyeNEOBYgojFHsRPxzV4kAAPo9D92yYc7tNKjP77icoRkaxReS2uDAcBEEUXgBTVTzZusxC5GdBkA9v4qmkiUZvIM1zgFYuE+Q3iHPEC7Xq4UKjikECSslix6L6eQMAG7+Y5T6/FTZ5froGkpwpPlM4sfvl8qTl2FL2cVhUObGkhye1ACHbfVwUd7TGdn8do3SZxbh11Z5QnmK+L1i4oON4DY/3relNFYAInp8DKlHJbqMYBmF8fpe3FK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:29:23.9571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6ca5b3-7d9c-447b-ed54-08dec56a566b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8346
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
	TAGGED_FROM(0.00)[bounces-64201-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ti.com:dkim,ti.com:email,ti.com:mid,ti.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 054456578B9

From: Jai Luthra <me@jailuthra.in>

Before this, the deserializer would ignore the virtual channel (VC) ID
set in the incoming CSI packets, and set the ID to the RX port number in
the outgoing packets. This was done to support multiple single-channel
cameras, all sending packets with the same default VC ID = 0.

Now we check which (and how many) channels are under use on any incoming
FPDLink port, and map it to available channels on the outgoing CSI port.

Signed-off-by: Jai Luthra <me@jailuthra.in>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/i2c/ds90ub960.c | 165 +++++++++++++++++-----------------
 1 file changed, 81 insertions(+), 84 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 653dc7a4eee5..506b436fe50c 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -72,6 +72,7 @@
 #define UB960_MAX_RX_NPORTS	4
 #define UB960_MAX_TX_NPORTS	2
 #define UB960_MAX_NPORTS	(UB960_MAX_RX_NPORTS + UB960_MAX_TX_NPORTS)
+#define UB960_MAX_VC		4
 
 #define UB960_MAX_PORT_ALIASES	8
 
@@ -3471,40 +3472,76 @@ static int ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
  */
 
 /*
- * The current implementation only supports a simple VC mapping, where all VCs
- * from a one RX port will be mapped to the same VC. Also, the hardware
- * dictates that all streams from an RX port must go to a single TX port.
+ * Map incoming streams with different virtual channels from 1-4 sensors to
+ * unique VCs on CSI TX0. Sensors using multiple VCs will work, but due to
+ * limited total channels (4) this will reduce the total number of sensors that
+ * can work simultaneously.
  *
- * This function decides the target VC numbers for each RX port with a simple
- * algorithm, so that for each TX port, we get VC numbers starting from 0,
- * and counting up.
+ * The current implementation is limited to using a single CSI TX port
+ * at a time (either TX0 or TX1 and not both simultaneously),
+ * as that is the most common HW configuration found on boards with DS90UB960.
+ * For using both CSI TX0 & TX1 the below method will need significant changes.
  *
- * E.g. if all four RX ports are in use, of which the first two go to the
- * first TX port and the secont two go to the second TX port, we would get
- * the following VCs for the four RX ports: 0, 1, 0, 1.
- *
- * TODO: implement a more sophisticated VC mapping. As the driver cannot know
- * what VCs the sinks expect (say, an FPGA with hardcoded VC routing), this
- * probably needs to be somehow configurable. Device tree?
  */
-static void ub960_get_vc_maps(struct ub960_data *priv,
-			      struct v4l2_subdev_state *state, u8 *vc)
+static void ub960_get_vc_maps(struct ub960_data *priv, u8 *vc_map)
 {
-	u8 cur_vc[UB960_MAX_TX_NPORTS] = {};
-	struct v4l2_subdev_route *route;
-	u8 handled_mask = 0;
+	struct device *dev = &priv->client->dev;
+	u8 nport, available_vc = 0;
 
-	for_each_active_route(&state->routing, route) {
-		unsigned int rx, tx;
+	for (nport = 0;
+	     nport < priv->hw_data->num_rxports && priv->rxports[nport];
+	     ++nport) {
+		struct v4l2_mbus_frame_desc source_fd;
+		bool used_vc[UB960_MAX_VC] = {false};
+		u8 vc, cur_vc = available_vc;
+		int j, ret;
+		u8 map;
 
-		rx = ub960_pad_to_port(priv, route->sink_pad);
-		if (BIT(rx) & handled_mask)
+		ret = v4l2_subdev_call(priv->rxports[nport]->source.sd, pad,
+				       get_frame_desc,
+				       priv->rxports[nport]->source.pad,
+				       &source_fd);
+		/* Mark channels used in source in used_vc[] */
+		if (!ret) {
+			for (j = 0; j < source_fd.num_entries; ++j) {
+				u8 source_vc = source_fd.entry[j].bus.csi2.vc;
+
+				if (source_vc < UB960_MAX_VC)
+					used_vc[source_vc] = true;
+			}
+		} else if (ret == -ENOIOCTLCMD) {
+			/* assume VC=0 is used if sensor driver doesn't provide info */
+			used_vc[0] = true;
+		} else {
 			continue;
+		}
 
-		tx = ub960_pad_to_port(priv, route->source_pad);
+		/* Start with all channels mapped to first free output */
+		map = (cur_vc << 6) | (cur_vc << 4) | (cur_vc << 2) |
+			(cur_vc << 0);
 
-		vc[rx] = cur_vc[tx]++;
-		handled_mask |= BIT(rx);
+		/* Map actually used to channels to distinct free outputs */
+		for (vc = 0; vc < UB960_MAX_VC; ++vc) {
+			if (used_vc[vc]) {
+				map &= ~(0x03 << (2 * vc));
+				map |= (cur_vc << (2 * vc));
+				++cur_vc;
+			}
+		}
+
+		/* Don't enable port if we ran out of available channels */
+		if (cur_vc > UB960_MAX_VC) {
+			dev_err(dev,
+				"No VCs available for RX port %d\n",
+				nport);
+			continue;
+		}
+
+		/* Enable port and update map */
+		vc_map[nport] = map;
+		available_vc = cur_vc;
+		dev_dbg(dev, "%s: VC map for port %d is 0x%02x",
+			__func__, nport, map);
 	}
 }
 
@@ -3552,45 +3589,6 @@ static int ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
 				 UB960_SR_FWD_CTL1_PORT_DIS(nport), NULL);
 }
 
-/*
- * The driver only supports using a single VC for each source. This function
- * checks that each source only provides streams using a single VC.
- */
-static int ub960_validate_stream_vcs(struct ub960_data *priv)
-{
-	for_each_active_rxport(priv, it) {
-		struct v4l2_mbus_frame_desc desc;
-		int ret;
-		u8 vc;
-
-		ret = v4l2_subdev_call(it.rxport->source.sd, pad,
-				       get_frame_desc, it.rxport->source.pad,
-				       &desc);
-		if (ret)
-			return ret;
-
-		if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
-			continue;
-
-		if (desc.num_entries == 0)
-			continue;
-
-		vc = desc.entry[0].bus.csi2.vc;
-
-		for (unsigned int i = 1; i < desc.num_entries; i++) {
-			if (vc == desc.entry[i].bus.csi2.vc)
-				continue;
-
-			dev_err(&priv->client->dev,
-				"rx%u: source with multiple virtual-channels is not supported\n",
-				it.nport);
-			return -ENODEV;
-		}
-	}
-
-	return 0;
-}
-
 static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 					       struct v4l2_subdev_state *state)
 {
@@ -3606,11 +3604,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 	struct v4l2_subdev_route *route;
 	int ret;
 
-	ret = ub960_validate_stream_vcs(priv);
-	if (ret)
-		return ret;
-
-	ub960_get_vc_maps(priv, state, vc_map);
+	ub960_get_vc_maps(priv, vc_map);
 
 	for_each_active_route(&state->routing, route) {
 		struct ub960_rxport *rxport;
@@ -3676,16 +3670,14 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 	for_each_active_rxport(priv, it) {
 		unsigned long nport = it.nport;
 
-		u8 vc = vc_map[nport];
-
 		if (rx_data[nport].num_streams == 0)
 			continue;
 
 		switch (it.rxport->rx_mode) {
 		case RXPORT_MODE_RAW10:
 			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
-				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT),
-				&ret);
+				rx_data[nport].pixel_dt | (nport << UB960_RR_RAW10_ID_VC_SHIFT),
+					&ret);
 
 			ub960_rxport_write(priv, nport,
 				UB960_RR_RAW_EMBED_DTYPE,
@@ -3701,15 +3693,10 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 		case RXPORT_MODE_CSI2_SYNC:
 		case RXPORT_MODE_CSI2_NONSYNC:
-			if (priv->hw_data->chip_type == UB960 ||
-			    priv->hw_data->chip_type == UB954) {
-				/* Map all VCs from this port to the same VC */
-				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
-						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
-						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(2)) |
-						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(1)) |
-						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)),
-						   &ret);
+			if (priv->hw_data->chip_type == UB960) {
+				ub960_rxport_write(priv, nport,
+						   UB960_RR_CSI_VC_MAP,
+						   vc_map[nport], &ret);
 			} else {
 				unsigned int i;
 
@@ -3965,6 +3952,11 @@ static int ub960_set_routing(struct v4l2_subdev *sd,
 	return _ub960_set_routing(sd, state, routing);
 }
 
+static inline u8 ub960_get_output_vc(u8 map, u8 input_vc)
+{
+	return (map >> (2 * input_vc)) & 0x03;
+}
+
 static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_frame_desc *fd)
 {
@@ -3982,7 +3974,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	state = v4l2_subdev_lock_and_get_active_state(&priv->sd);
 
-	ub960_get_vc_maps(priv, state, vc_map);
+	ub960_get_vc_maps(priv, vc_map);
 
 	for_each_active_route(&state->routing, route) {
 		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
@@ -4025,7 +4017,12 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		fd->entry[fd->num_entries].length = source_entry->length;
 		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
 
-		fd->entry[fd->num_entries].bus.csi2.vc = vc_map[nport];
+		fd->entry[fd->num_entries].bus.csi2.vc =
+			ub960_get_output_vc(vc_map[nport],
+					    source_entry->bus.csi2.vc);
+		dev_dbg(dev, "Mapping sink %d/%d to output VC %d",
+			route->sink_pad, route->sink_stream,
+			fd->entry[fd->num_entries].bus.csi2.vc);
 
 		if (source_fd.type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
 			fd->entry[fd->num_entries].bus.csi2.dt =
-- 
2.34.1


