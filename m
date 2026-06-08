Return-Path: <linux-media+bounces-64202-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uBrcG3/UJmpSlQIAu9opvQ
	(envelope-from <linux-media+bounces-64202-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:41:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1267A65763A
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:41:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=selector1 header.b=mcn8afRC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64202-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64202-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FFD7306EB05
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D243D3332;
	Mon,  8 Jun 2026 14:29:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012054.outbound.protection.outlook.com [52.101.53.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4116737FF68;
	Mon,  8 Jun 2026 14:29:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928974; cv=fail; b=JseUDDyFgkjJrgfTEoAwNAXgrNO10g20oVdXtWCYieY6M4NeDUDxlqkCrTWN0BW/dInbACFt6Zl+6XqooKhOwRIpZKwdRVq5cC1NDpqv1w30o12VFejDKf0uYn5fZm33yQ4+dvEfae3s6JzEnnh328pfD6z/KcVjDQfy7oI3+TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928974; c=relaxed/simple;
	bh=wo9vhR5S6W706pOoyuvcFyIuF24EwWctqIej28klBsM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HyYiG96KZhmguUGGnAJB9ElHTvBMxSAfFwr6mM8LdaPg8sLoTPAAp8wqCiJTKhqdF6YIB6oDbFEs7I8D5sRJtoanUL3TV/e3W2hOkYjoyFYEza8T8vlSxWtolw9jer9lC0MxXJW/o1sGcagmWM0HSXmQ6ZMxOswzS4wwjt2IPJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mcn8afRC; arc=fail smtp.client-ip=52.101.53.54
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5FGZ4MxVGLtbXXs+9guDNZTAtKnAMJoq7chQtmLMJXJ2z9EJeR1dI+nI/JYnDU2x8x5bkJ2PDEgm5O4nBLY0wrwYjQrZhIPLbhu5nFSnqk7QVyT6cscrr8nYQbf0lLDHk7/PHSFRG/TlBdlV3Tk5H7ZpQjYleXNaomPqU26E9AykkjL2jBTtppOKYaDhFzyeDCQqlpsorM74a+OrZ+6a9Fp3EX61jEjU0k3BeTp8dIsgwPNhbGdzJUx9Ho3j/NpUJfcge641ZbS/bfG24fy7s0aTAjnf+TcEtnUaYo1/WKrl1YSpmfXkcgxtJY8Qe5BiZiC6dnfD0ZSShvjPYrryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3BAkhJwcGh2xQQYrNdxndiS4A7K2siYNxRukpXrxyY=;
 b=u8XCgu8+8bN3U9NUaBioUzyB9IWXKJ9JK7XG81scqDoLYxcnLH668agsgjs7RtizvNvY/WzU/EdUtlqmTd8v+lpIC1n5eoU5naKCTxmSp5mRnKo4EjF9997I2ozF3t4w1gsJimgdWc8DmnwvS1pYtT/ZFnBCMEUJiYG9DHHrNgHyutC1aIVKPzyUDn5VzLlD4iTkvDSIyEdtflgRECgDbGPxTxfm8s5FD3YzEUFCDIIbMzHODhwrSaHN8Ld+RCRA7Z+Cn0ALj+iLsN7aKQA3kczx3l3CqjjVoU9EyEf5L8ntle1E4TsfJ5ODOOTmvN3UWT4QfGHsLJt7nAIlJ3lXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3BAkhJwcGh2xQQYrNdxndiS4A7K2siYNxRukpXrxyY=;
 b=mcn8afRCSnQDTZMi6x3/U1ili5kX38CypPYcS3fNuJyhriU+dGWUXk2bPQkCr0V3U2uZtEGe+AxNFjoqPq+aH7flIXfO9k9K9WGdby3XGaW5NcYd9h+HKOglywI0xqdWQJQtsdi21yyJKG1lS4CtUl1eD1HACduPCtapc+FhYTo=
Received: from SA1PR05CA0014.namprd05.prod.outlook.com (2603:10b6:806:2d2::23)
 by CY5PR10MB6214.namprd10.prod.outlook.com (2603:10b6:930:31::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:29:28 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:2d2:cafe::67) by SA1PR05CA0014.outlook.office365.com
 (2603:10b6:806:2d2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.9 via Frontend Transport; Mon, 8
 Jun 2026 14:29:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 14:29:28 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 09:29:19 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 09:29:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 09:29:18 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658ET2bG3251356;
	Mon, 8 Jun 2026 09:29:16 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <tomi.valkeinen@ideasonboard.com>,
	<jai.luthra@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH 4/4] media: i2c: ds90ub960: Use VC mapping specific to ub9702
Date: Mon, 8 Jun 2026 19:59:01 +0530
Message-ID: <20260608142901.3971821-5-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|CY5PR10MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b536e6-b211-47bf-e99c-08dec56a5931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|5023799004|56012099006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	n/E+5HRQYOOnznmXHNT6VBmCo3dvUxCLeJGWd4AQiwKI56C11ZaRw0rP2aLO7ubVNuq3MPoi0NUIE36CWPBYKEGJ6SP5xKVsiJoiVVogBD6K5eSLZtooPLh1VmpEyd81isSU3hZ31UCkrOyobKvzxgy4JH9jiySiZytV6NTe0JWDUFY3G/BeattlIUK32tDdPMF3x9OiPVkr5+iDEMtNksvheFuspkNV6lq/E2Nb1HGnOcW9ZTTPIBEuq+6lU5KiM90odfbUpTjUCgtcti9w5hGpwt01Y7dD+GDy8jj4ST8C56jH3eqx3jXgDys0YAwOylXsNTKSUFMtgzGGXGaQbDPtswjpgYETx3zCKgOYoKeuMRWWc117LCxEBAvy5d9eEZKWnxuo0zfiSs4RnbBEpVSnMwDSi7POZHaandjMcv6tTm9NJWFVNebJpvhcQI8RbMVAFWdA/9C39qhloUyaVpyxfOw9K0mN+jJBduk9Rc/hQlg0QxBZCvKktoCYKhYR/vegmiOhFoQvCGCemE7hnWfuBRIy2N9h8fY8+WC+f3dEXAROkM6t7Tp2Oyf2sfkTb6G1bTkOn72Pux5jdqJChbCBsR2E6oO7WHz1PjojQ/Jbm77Ea8rU8gsk+pUWNkDCYJz74lI4CkRiENgnZ4Di0soA9G9qqLhmI0kbB/mQCC6cWWY+r/k0PjulD6bQ9vSHPQvFR4kdh3qvAosAtP2rPTiMo2RLqS3Tn8aN5uPWIlA=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(5023799004)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EPbVtecc7qQv4Oof9xT2MJVgEjRXhnsy5xNrk61sPujKRzwIekt8raameKr6H+iqto+7uHTHylpMIXgnGhDjIwiEExDtzqEluGtx54JVIQ6LTBbmoeRlIAUJ2E4VuOe5N6cgBBcPi+0j51NAErnDVUVI6DsezB4sGKZaizQoODllqA205DTGcUc7gWdn+MuMxrrc16cqtPOBrEQOO8uME0RXPujsTFUSg/+fJZB6JEwSlQktHseJ2x7kvTrWxxMxwoKBHBswNxlvx+s3vVF5n2ALkUxA6PSKtIHLl2pbpo2GnrDmBHmB98L58QJxfp9mbfUUY2G7uDewvhJUwhaHVAzVL8/0AGq1MKZo32ytR61yGS8AhtJIAejSc4oR/QSak6f9gQceot6YT1CYmvKAqsOZfx7aEU83MN3yPtG1ZptBLUQwGH8INw9fROMUE5m7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:29:28.6043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b536e6-b211-47bf-e99c-08dec56a5931
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6214
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64202-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ti.com:dkim,ti.com:email,ti.com:mid,ti.com:from_mime];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1267A65763A

Add a dedicated virtual channel mapping for ub9702 deserializers which
require different VC configuration compared to ub960. Update the
configuration logic to select the appropriate map based on the
deserializer type.

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/i2c/ds90ub960.c | 44 ++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index d1597659639f..9ce6d9e6e3e8 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -3482,7 +3482,18 @@ static int ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
  * as that is the most common HW configuration found on boards with DS90UB960.
  * For using both CSI TX0 & TX1 the below method will need significant changes.
  *
+ * VC mapping differs between ub960 and ub9702 deserializers:
+ * For ub960:
+ *		- Each VC uses 2 bits in the mapping register
+ *		- Supports up to 4 virtual channels (VC0-VC3)
+ * For ub9702:
+ *		- Each VC uses 4 bits in the mapping register
+ *		- Currently uses only 2 virtual channels (VC0, VC1)
+ *
+ * The mapping registers determine which output VC a given input VC
+ * will be mapped to when forwarding data from the deserializer.
  */
+
 static void ub960_get_vc_maps(struct ub960_data *priv, u8 *vc_map)
 {
 	struct device *dev = &priv->client->dev;
@@ -3518,14 +3529,26 @@ static void ub960_get_vc_maps(struct ub960_data *priv, u8 *vc_map)
 		}
 
 		/* Start with all channels mapped to first free output */
-		map = (cur_vc << 6) | (cur_vc << 4) | (cur_vc << 2) |
-			(cur_vc << 0);
+
+		if (priv->hw_data->chip_type == UB960) {
+			map = (cur_vc << 6) | (cur_vc << 4) | (cur_vc << 2) |
+				(cur_vc << 0);
+		} else {
+			map = (cur_vc << 4) | (cur_vc << 0);
+		}
 
 		/* Map actually used to channels to distinct free outputs */
 		for (vc = 0; vc < UB960_MAX_VC; ++vc) {
 			if (used_vc[vc]) {
-				map &= ~(0x03 << (2 * vc));
-				map |= (cur_vc << (2 * vc));
+				if (priv->hw_data->chip_type == UB960) {
+					/* For ub960: 2 bits per VC */
+					map &= ~(0x03 << (2 * vc));
+					map |= (cur_vc << (2 * vc));
+				} else {
+					/* For ub9702: 4 bits per VC */
+					map &= ~(0x0f << (4 * vc));
+					map |= (cur_vc << (4 * vc));
+				}
 				++cur_vc;
 			}
 		}
@@ -3705,8 +3728,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 				for (i = 0; i < 8; i++)
 					ub960_rxport_write(priv, nport,
 							   UB9702_RR_VC_ID_MAP(i),
-							   (nport << 4) | nport,
-							   &ret);
+							   vc_map[nport], &ret);
 			}
 
 			break;
@@ -4018,9 +4040,13 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		fd->entry[fd->num_entries].length = source_entry->length;
 		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
 
-		fd->entry[fd->num_entries].bus.csi2.vc =
-			ub960_get_output_vc(vc_map[nport],
-					    source_entry->bus.csi2.vc);
+		if (priv->hw_data->chip_type == UB960)
+			fd->entry[fd->num_entries].bus.csi2.vc =
+				(vc_map[nport] >> (2 * source_entry->bus.csi2.vc)) & 0x03;
+		else
+			fd->entry[fd->num_entries].bus.csi2.vc =
+				(vc_map[nport] >> (4 * source_entry->bus.csi2.vc)) & 0x0f;
+
 		dev_dbg(dev, "Mapping sink %d/%d to output VC %d",
 			route->sink_pad, route->sink_stream,
 			fd->entry[fd->num_entries].bus.csi2.vc);
-- 
2.34.1


