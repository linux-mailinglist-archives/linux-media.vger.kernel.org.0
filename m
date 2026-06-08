Return-Path: <linux-media+bounces-64200-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IwxjERzXJmoLlgIAu9opvQ
	(envelope-from <linux-media+bounces-64200-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:52:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF9F6578A6
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:52:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=selector1 header.b=UgISZp13;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64200-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64200-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6355031D086B
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4445E3D1702;
	Mon,  8 Jun 2026 14:29:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012021.outbound.protection.outlook.com [40.93.195.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479B43CFF58;
	Mon,  8 Jun 2026 14:29:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928953; cv=fail; b=Xii1RPnaf5hccS3zxz3bI+SFEFWmPodH1uqYo1j0xkf9TM5NMEkBXA3/NfNUVJBrCdIVFKzwuF2U8uCY5K5ptkyJp6URxJ0Bp4mMEMUCF0F+3lpMrsahluZWvAPg3CPqWMNHXznfASLUX4PPl9veE6sceWPUQkGou5Mkd+G73io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928953; c=relaxed/simple;
	bh=OBC2iCXNhBRAkNrIR57e1zHQId5WRL8uIqa0I7I19Pw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GA4bRTgKYYcOjW4lsMDjX9y6usZiYQAVCZqgYjx+uiEwgC0pgVSahLltxqPW4z4uMDoUw1BlZ+W2OqaZYzk6bcMLYtQ3A2QYAmiqs97LPBcU2M7JOZH4SSOUKH/5C8zzwjS6dgeq4IOlFQmWh8GLt2rdxg5YT7A7kKKDHmSQ8a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UgISZp13; arc=fail smtp.client-ip=40.93.195.21
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jc1v0SP71E0e86djpu4wKIKC7yYHvwGQKsGeZPYvKZQlLACWv5ymJwGUbezfxaImvc6qg7x73Azn9Fk0uJ2qbywzjpTgsxvx3p6F8/CqdllpCbVTZkzrQMaJ8suq1PLNL/D1VxaQ9pICZjKFRU+zT461IKHz9sEx0BPhv7G8VBZ7QBuT3UbOi+VwJWdwe86hXsqcsSQmsKtfoYGO5BHR47hiGPMwuluYMbTQoy3kY6Jm26sfmESinI3mAt8AoMgZ8/A/jgssMymQhDYStpK1q63di7y0ZMMMxfGfMvGHqdoBv2dQpPSUTMW5ux4tTyqQxKLckkRjy1hKoW/DrIIvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmHKv04+EQ2XfVIeca9iFSTEXHKYflM81KtnQGkaSbk=;
 b=qBn/+cDGM1wf+nsWmCuNm0jRpFrmMxvnr6C1PaSM9HsIpg0u6tw7hTKtPMYQ3SW40laN04MQcEme/EpEjufInfDnp313oPeVk3Mbr+UrrkP8z8t4pvlMMvBp4Jt9hkSRnoScNTw31wqYBJoHC/KfZYyAH5BhRAo5sMc2p9ngqCByLbuZyxipxGP17QHkRTmZ4FUnyE7fLvQ5c1M4vWPveBb0YzXQfavPAzWvh+AZ8VmurzmCHyPQGKyQYX8pcjVqHujwmcr3bTnakaJnsckOj2jiTKoBd2fM1X1uuQ83PgsKr41WjJNh38w84gzf1BXQPEH8lU0lGXllUyVvSltkkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmHKv04+EQ2XfVIeca9iFSTEXHKYflM81KtnQGkaSbk=;
 b=UgISZp13q6jhQylahnubvK9SEXsLkQZnYGidHrcJOVvBPCdfbyntUckBdmEkp4HCK90bv72Ra0zrAyEoEixhM4kqb7KD/An6hhgdufRBGUreccHP0c4eA2ESDaPFOpPxhSl1bQKZzks38G2jh3R3LLSqzIzCYs/nw7yTNtSQuYE=
Received: from SA1PR05CA0024.namprd05.prod.outlook.com (2603:10b6:806:2d2::27)
 by PH0PR10MB997781.namprd10.prod.outlook.com (2603:10b6:510:3b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:29:10 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:2d2:cafe::4e) by SA1PR05CA0024.outlook.office365.com
 (2603:10b6:806:2d2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.9 via Frontend Transport; Mon, 8
 Jun 2026 14:29:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 14:29:10 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 09:29:06 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 09:29:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 09:29:05 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658ET2bC3251356;
	Mon, 8 Jun 2026 09:29:03 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <tomi.valkeinen@ideasonboard.com>,
	<jai.luthra@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH 0/4] media: i2c: ds90ub960: VC mapping improvements and TX1 support
Date: Mon, 8 Jun 2026 19:58:57 +0530
Message-ID: <20260608142901.3971821-1-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|PH0PR10MB997781:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ccb551-63db-483b-8fb9-08dec56a4e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2JRR+cvg6UlZV8Id2sA6WJ7t0t4W5pTHmZlHJT+Stf9hgyN3SB4cegssvX7LZ3gZZ4ZnLE1jS4llaHoW1s8z84xUOrk5Dd6BnRe70oezbhhiYKSWwLT3c6lWalNQDQ6Xd9M5bPE2xF8FjdP6M39G1+iU6u4uzUuyp9o1xdLKP0Lb6icK6iRJ1puROlNyuXnLhRpIP6akBAuoGDquPfKEIh87sLd/E8wR+m7AtFfJeZZJ8Q17BL0KqZsI5vvNFJfsue6YTwIXbLiiUYYR+2eGCkf8jZ9Ap2/l2SzWA49+020v2Oh5XmLawKWE8ohUimWLw2DyhQuCa2CLOfl+SrGLUv8guZdg6wfKku4IbcTlsWnyKOQ+nca4SOymohEW5yP6P2vpVA5koIPZFtXdzmqfSnHTHjtiKdyZLzxWQMBo6dHj2WhP1vg79Jb7XBxCw+gHJxLhXTnGGGo75BZRAHnwMXxuDeo78a8SUpXJT8hH+HvTXhbP1JZxnsT8yAQXYYiom+oKSCwp7NDspd3fqgcgadjgxBG9I9380G1ZAoOI8dxGSDtawYMbUsoiIy3olhVparvWRcBPXuWG8mMJP/MK/AwZTm5Dkz8sp/GDcI1SqwKhsfVnQD0w13KWzbBReZThU9+A5oyDK/qqv2n4vEN8lghLddyHibB/II6JMRIXDpmFqo8ZUesXKTgl1D3zQigF78AnjKQ0AWvqV9VHK+cJPq90vtwsu71+b3rLMny6OqU=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8uAOTE0LmLD/sU06UExWEjP94s9j6OGDqlGrONghAMpy8xH7flVkAa7pma4aG4VIKZJYyNLOUswHAz7ZB2PQdcVSLTHEz2wflrDUFkREE0EO45ofDwRJ1yKQCPoqCuiRd38xczpYvLCjAnt9/ZUB7U54NWUPgajcCljTMFN4gSHhaWKWJecBu6hetTMqbx73bxvW9el0d4AGllhRhoDfOE53Z5Da+I2MlEpk2pDsNzRxsX3K3tPNyuYMDRuUt+XX4kSCAITLhjMMWqdlLat0uimqLbPCIAE8IuBoMt1HYelKfg6PeOuizNjszzKMsgKt4ktxu4/E59DeMkgcKqFpriKJ5xSqdnME9ti/zl06xGigFiEHPEthpbE9HAbbAwcoLMAZYOh2H/27SgazgutkbbSNuv0cYGr7NXXyap1cvVB7XXGYNisty6NoUVDZ0GvF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:29:10.3066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ccb551-63db-483b-8fb9-08dec56a4e4a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997781
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64200-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ti.com:dkim,ti.com:mid,ti.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACF9F6578A6

This series improves virtual channel (VC) handling and adds TX1 port
support to the DS90UB960/UB9702 deserializer driver.

PATCH 01:    Enable CSI TX1 port by parsing active RX/TX ports from
             device tree and configuring RX_PORT_CTL BCC mapping
PATCH 02:    Replace hardcoded VC-to-port-number assignment with a
             proper per-port VC map built from source frame descriptors,
             allowing multi-channel sensors to work correctly
PATCH 03:    Fix loop termination bug in ub960_get_vc_maps() that caused
             ports after the first unconnected RX port to be skipped
PATCH 04:    Add UB9702-specific VC mapping (4 bits/VC, 2 VCs per port)
             instead of incorrectly reusing the UB960 layout

Tested streaming with the following configurations:
1. IMX219 + v3link on AM62A
2. ov2312 + v3link on AM62A
3. ov2312 + fusion2 on AM62A

Overlay and defconfig changes for the same can be found below:
https://github.com/RISHI27-dot/linux/commits/u/ds90ub960_mcs/

v4l2-compliance results:
https://gist.github.com/Rishikesh-D/0f5464617849f228699c525c47b4c785

Jai Luthra (2):
  media: i2c: ds90ub960: Support multi-channel sensors
  media: i2c: ds90ub960: Fix VC mapping when ports skipped

Rishikesh Donadkar (1):
  media: i2c: ds90ub960: Use VC mapping specific to ub9702

Yemike Abhilash Chandra (1):
  media: i2c: ds90ub960: Enable CSI TX1 port

 drivers/media/i2c/ds90ub960.c | 240 ++++++++++++++++++++++------------
 1 file changed, 154 insertions(+), 86 deletions(-)

-- 
2.34.1


