Return-Path: <linux-media+bounces-64203-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ca9vCEXXJmoelgIAu9opvQ
	(envelope-from <linux-media+bounces-64203-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:52:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9841A6578E2
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:52:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=selector1 header.b=aw7ihUU+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64203-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64203-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E04453040C4E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861733D45EF;
	Mon,  8 Jun 2026 14:29:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010061.outbound.protection.outlook.com [52.101.61.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92413D34A0;
	Mon,  8 Jun 2026 14:29:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928986; cv=fail; b=OmH7E72UYlljANhITXEnEY4HYBxndwPbc9La5bGmXpBovBA0a3dYXb5guInyZ/4ySDrtBfRS+opH54pjiXuqdAn/ET/pEkm+chxpkCCCIj1BC1iTEhQMBfYrpoCfMKxhRamCZvWIZk0ohWFwPldAmxUiVsWzYf4jRFRfRJDFwqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928986; c=relaxed/simple;
	bh=HTcM6ceHX6mGXMCxszD3xmeewFTn0Bbt6ccD7CWVV6o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ERVLgXdKg+Rrst95lEIkUeLKLZnafh4GuZqNmFcZq6mPH+5QJFfrIYA1wS8Z0kTs336IvcDjYPJfT+DAXAyMastmkeqnyGnvkOhW3wkA0dfYqQD1b1nIyUpeHuCHodmwSjUmVEU1ybMNUcP3UejH0QyEs3Wskp6qXikIuxi9QVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aw7ihUU+; arc=fail smtp.client-ip=52.101.61.61
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qo3QXq6FE/3Lt+LJMAtP5ESbnFdN8WZ8DOWjuNDqyzg2B6IejB1FRziAEz0T1+lMqrV2tHrT46BYMlRiJzKogrwJN79TR4HYMBHc3R+s2/JRmRoLSgsaa+XGjfZLYa9zO+nz3/xpYNiUSTFL6vCkymsXPMAFP7gMijgRCx39pclQQOZMa/RisCpSsVz12GLODa8b4CPesi+PKPEVt75D8No7lCgg2MdnP2ufgc0YB+cOc0ndZTqkV9/c9nL914wpGxeXSa38r+jNyLUrdSHl1B3Nm2NQkHGzY0wKkCbLCBLUbNwxmocNEBoFCpNKrKzkISuUfgtiPosR4Q0K8Rj5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiEtezLjnatAOWpbKGyaLEs6qfumHQmjWBWe+C97FN4=;
 b=kLwG2vyjwhAskR4x9y2PZ19I5KD6c0ds4+NCc5SQEmgrX3xpuE8Z7eAr/I1NK52AMRnQlpqaZ97xGgNvXkPx3ZKqs5vnPOSRQQz7I8XRAsXuZ7blEOkK5G+a7DTn2jSszpRKGBuMIyhsv0HbzKegKXSc1yC/KnLsLthO2lyp8gPiOVlBSisIbeEtKKIEeDjDhGmg4/qhNlmLsjizUYN3kUuG+az2dUM1fwzz3qtMZgaG+OC/CiGCZp79eYAZoMtl9uknBIzLE6x3fRTHjzb5xmJQ6qdOgcwBaK50Dcts6HYGtPe13XjYWINXP9D8ud3ukjgiJvH/G9FJPpqV0ogqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiEtezLjnatAOWpbKGyaLEs6qfumHQmjWBWe+C97FN4=;
 b=aw7ihUU+U7+yzQSy0xKFXG4Zt/qNHxzDtFieLreigqArl7aE4ivWTZbSMMNm2twCziU7p4dJil0umR+Eog1zejLmG3JZLTWgNbdJm2nMK44MYMTNhqO979mHgoBPPgoBhMCt5Z7em6vNLrSrIHqWXIgaevnhjYBGm7srCdveEFA=
Received: from SJ0PR13CA0141.namprd13.prod.outlook.com (2603:10b6:a03:2c6::26)
 by MW6PR10MB7613.namprd10.prod.outlook.com (2603:10b6:303:23b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:29:42 +0000
Received: from MW1PEPF0001615A.namprd21.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::f7) by SJ0PR13CA0141.outlook.office365.com
 (2603:10b6:a03:2c6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.9 via Frontend Transport; Mon, 8
 Jun 2026 14:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF0001615A.mail.protection.outlook.com (10.167.249.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Mon, 8 Jun 2026 14:29:40 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 09:29:16 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 09:29:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 09:29:15 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658ET2bF3251356;
	Mon, 8 Jun 2026 09:29:12 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <tomi.valkeinen@ideasonboard.com>,
	<jai.luthra@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH 3/4] media: i2c: ds90ub960: Fix VC mapping when ports skipped
Date: Mon, 8 Jun 2026 19:59:00 +0530
Message-ID: <20260608142901.3971821-4-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615A:EE_|MW6PR10MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: f36f2842-9274-48b8-2b4b-08dec56a609a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	V1HiuQGdodBtf4mqtytRe0ruXGzyoimtPp72Z5Z8FHKsBWW2CNORTCZGG/k3eLSUn9gcG8nBV0c+SQQUPbelnygHZfKxnhvqORt/rAFIhOSProQ8eAcTYyrMfQIcLDxbGjtgm2hDpHukUP64MuJOdv1zXhfNyIz2tj3nLc3FwV/H0yaM/b6QWywIB6ZmOiBbvIvk/TmdHJPEygvuEsxBZA/Lu3pJ7zwtYqzWqgyU3jPf0/a3RrCgiCXg8NyC33YSaWrFpZnrqhy9xIWn+Dd4LJAXtptujRIgNKGNLn/U314S+DSXT0vKvgROsqhpY+wAQ7Y5a5hxN1VgVEf/AtHaEaY5KV7Z3b5cSJZjzwtHLRy4hNmVRC8H4a/L7DbbWeKV+wXOc6f5wttEyQBFegjnuduB5FgqXL4tl4Dos7Nqt8pw96so2BtfQqw9zyw+G74Ep3xlSAW7BQWL5D5feaFVgQEJpOWtQm63ZVEB2DZPhv86uAJCiBw3fMczRpgpW3g2BT8H7UgO6C1In+Sk6yHxJmKYj7lE40niKyqlAdba84g6mKazk8Ktrzh71NdEQfD8Mx7KDnP7zX1IbxG8o+WQ5H8c8eoC+dG8d0WIt+lIfNeoyfF+FJ9HZq2vjK4Pn+KICn3g0fqEdbnFGaUHykKF8xET2f7yoX4vbytC3IJwsg4lfYsxuBt9Kd8bQM6CHGt84rAGfd9tDERyVmwcxaCoONTqJmIKNpvHFHwb3dfb7bk=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HufYLQdC5tliztusS5XJIZ/NtRx8wr67y/S3RIc116LwHedZAtY0yUTCX0IxMXMnrfpRBs72KbF1Xq7JDFs1h7hQGcIj3LTMqAW/2kYEEC9C++arV7QHyfyLm5wRpVb2ULOWWgVmHs+uIHr0+TlM2e1gjeY8racZdOsUvqbiyHAuMnXlh5XqxUW6Ip1A3xBdIrkKLcQK2m5hUYH3FISZoLkNTPA35kqQX6aQb792dJ+u8GmebLnK2FZPKc+lja0eRBIWrgiwMFoclA5ddKTW+46PdtMQqwfENni3lGNeTQFfRIYiLavc32FP6ZIQB593CsNeUT+Rg9u//M8SQU40T7df2ixx8Nlq5wKPqjNWZcM0H/Yr0tS65UkB4TjbS5cVhiLj0cHVmvH6xH3I+xlweRoKzdejR2pl2EF+ziqemIF/qPMrbGOGn4S4SQiGRNwL
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:29:40.9850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f36f2842-9274-48b8-2b4b-08dec56a609a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7613
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
	TAGGED_FROM(0.00)[bounces-64203-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ti.com:dkim,ti.com:email,ti.com:mid,ti.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9841A6578E2

From: Jai Luthra <j-luthra@ti.com>

Currently the for loop that maps virtual channels from RX to TX ports
terminates at the first unconnected RX port.

Fix that by instead continuing to scan the remaining ports.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/i2c/ds90ub960.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 506b436fe50c..d1597659639f 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -3488,15 +3488,16 @@ static void ub960_get_vc_maps(struct ub960_data *priv, u8 *vc_map)
 	struct device *dev = &priv->client->dev;
 	u8 nport, available_vc = 0;
 
-	for (nport = 0;
-	     nport < priv->hw_data->num_rxports && priv->rxports[nport];
-	     ++nport) {
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
 		struct v4l2_mbus_frame_desc source_fd;
 		bool used_vc[UB960_MAX_VC] = {false};
 		u8 vc, cur_vc = available_vc;
 		int j, ret;
 		u8 map;
 
+		if (!priv->rxports[nport])
+			continue;
+
 		ret = v4l2_subdev_call(priv->rxports[nport]->source.sd, pad,
 				       get_frame_desc,
 				       priv->rxports[nport]->source.pad,
-- 
2.34.1


