Return-Path: <linux-media+bounces-62255-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A9SJS6kDWq10QUAu9opvQ
	(envelope-from <linux-media+bounces-62255-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:08:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC2658D4C4
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 145B830D0D03
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2E13DC4DA;
	Wed, 20 May 2026 12:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="S46t6rM+"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013021.outbound.protection.outlook.com [40.93.196.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2E43DC4C1;
	Wed, 20 May 2026 12:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278472; cv=fail; b=m1H8mkgdHNUnX7bmMrPZHJC3L6ZggOLgGWvV9ou9zsuZVQxyX9oEl5Xv1mP01QTM309XGGf7KAcOUQd+R/CQtlnkey0ttmm7nl3uL5zErbV0P91Jsxo0P7H3y9dKjsgOfAAzW0m6ms7GF2qe60bS0mcqlPSKjn+G5OhM3czuSTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278472; c=relaxed/simple;
	bh=hw5JhZlHziEirkNgBdc/dDgS0rf9IZ1mR8gJmD5u3OQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NII/atnRgzf0zl8R5hjmo47AIJyyDj/3farFJsCmbxpAJTVjYi/PSQJ/rPwcdiqxEK5Gmht9EpDdvpPyetlqM9gdwzSRju1W0iHjoGYB2SS2L47pwwVb9GIorE2nuRQEshB44I7wh1M0E8AaANJYoxKhV/8+lYnH+5+EOJxQG2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=S46t6rM+; arc=fail smtp.client-ip=40.93.196.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQxMkstEVtMeXNNaV1PdBHfxKNwezT5ykmdBo7FrWKb4ezi58UnSFqxQRNxAqM6HSuqIqhVsgb1zNLg9nLcQQlyA58V9qTWddlemBQNPnii1Q6ctM/uEIVXeGs5Znr6Fa88tMq9SQKzUyZPQEO0D6C5reeUQZ1+9Bc56aBDJkcVW750DcMDfc7Or3jCbkfZgLsqBDw+r9qrB9bA1yTPuUlwul+k3zFbk50nupZG41zx4ujQk8qnENk5Cm4Wi0PfUSFLqJhHZ6xJGj9qEZwHsGc2fcXzVlMwMtu0QBt5NnStHeYpBYgehfTHbtouj+GisJUcVL/GhFMTBwO1jXIWmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIf80yuDWfQ7C4GZXtuIRf3WRmrukP38CO88BRbEC08=;
 b=gSX1p27eLQ1o00Uy2NY/QKr84exJfi3u8QECvgUB2IwQZf2mH9mORst8YQ83/q+1lT0JHloMkUzv0hk5uBIr8DeGqIlgSWXbqgSzdC8sBqNm3OFcuPosyyseWsFV1ti+1R8hkAcQpZRID3iWzgdcX96awp47KaHajI1T5OErikuBQ1YqQoJb2nIC1/AUQvKRvgDRHLy/SErSQM5h7xJfsHD4p/9aHynHcLIugfDqbNiHGntjLscGH79W1mhFBacYcxzZLSnRzuap6TXKOBCG1GMOabyX1wHhQVIBMVWdXvgUqFy9keis6ULmvp63MX1FsHaTLc+CmaHffxF3ltDYjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIf80yuDWfQ7C4GZXtuIRf3WRmrukP38CO88BRbEC08=;
 b=S46t6rM+CpTgC05GVNK8qox1Q89wnpnfgpmQ8vSBTlOHjxyorprH50Dn94/kwjaOq//5MSOOiea5fVgRQ8W/+/yAEz6PmHV+OeMhQtsL41dAVKvcio3JVPtYzqp86pzec38tJbGKTVNxAZLZR9PzSTjNK3DE/s2qKOV0nEvBVJM=
Received: from BL1P221CA0040.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::15)
 by DS7PR10MB4909.namprd10.prod.outlook.com (2603:10b6:5:3b0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 12:01:07 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:5b5:cafe::6e) by BL1P221CA0040.outlook.office365.com
 (2603:10b6:208:5b5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:01:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 12:01:06 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:01:06 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:01:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 07:01:05 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KC0N3U1914726;
	Wed, 20 May 2026 07:00:59 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v13 05/17] media: ti: j721e-csi2rx: allocate DMA channel based on context index
Date: Wed, 20 May 2026 17:30:10 +0530
Message-ID: <20260520120022.539913-6-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520120022.539913-1-r-donadkar@ti.com>
References: <20260520120022.539913-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|DS7PR10MB4909:EE_
X-MS-Office365-Filtering-Correlation-Id: feecb2e4-0f29-44ad-78a5-08deb667796a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	LyeEvpDUtSTZXroR2tPVGHfPC8vRo21k5p/FYqV6R+r6sK1cnOFk1fI/2lhaa8FBbBimAANASC2K7t2KV8VnyHxM5o/0sq7bQFoFMDmwWnMahLCFdE1DIleVhxYiQLVzjjH9tke8lGkZ0VOoWoTwz3He3yh83puPYpCood/c6FQaZYSDN30s6GA9SVoF2YAldO+AAdoM/BwnCihf03k40WJjQ3juIADNQHef5LoRWDvdNTY38cC8CXvyNfx50bRYbTB5JD5zglpoAM+e9L+IKgQ/ahGMIXeOWUd5hULZvHQtuIrJxF3ladDumLp8v+4aH045kYxQ6rvyJGXlMSFC59ob8+O9vS2p1bVvOTeL+fi/4gS+vRBLdRIp0WRSmqWzuh4PdtBIMPy7JRDGUNRsoB8OlO6i+7KQ3wbDOpnZJywFzBBmogDepmpEZo6qinLK9Rgr6Hppyf0zgQo7YUQX95cvvlYfLWJ1HjICQILjxE+EXSlZHCbp1QO1zJmJ+NJjNP/+o6DSvBnk5M8ChRN/Ma9+cu9/z6h5WKzZiUC0MtWS36IEk34Xcc3Rw0k7T2XrikM8VgWbULGaKMu2k+ytaFRPyJCCV+gYAo5VDaqcaFjQHW+hFME6dXGyMgg9u19daP0CPzrD78CxrZLvHiCnHFghPdjIyG/qDnXVJIBnn6aycBgj09DLirRtqFpvHAhM35rTGgq2bFjPUr28Yb8pnX6DLpcaLF849aDL09wvCx8=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ANp04fVAfSjbLM+sNnxakT2JpVE77wyYbtqsdOmIcycrEDI6LI+ehe2Iboyw1HA0wnq01FV3lCwJVKS6jhCaRrWGFdDqqrdy82prq2hxdQ/pL/bnepAaBbyTcsmAlEuII6Enb1+0dmwix7SDZqIWbrDa47pzv8tDinsBRjim5RIKsv2NAHzJ6zMChWRbSbOdHlvga+XQ8e8ZDLt3VVCDgHtsn6P3/CLNb0KPmPyQaaF1i5/iN+DKuXgZPRcC5NQUBqQE6N65tDygPUDJXV9khZhVJykp8UUhhnRFIj9kxesFboPy71oSSeTW9Zhv0yWIXP77B7swGH8G2hipCm7lG/THv2M63aihRZG4t0GdFOlH+qBj4ou+Ce4vd06quYtSBN3J538FvhLYrbA6+1Cs51SlYBPv8ie8j5E4dvFYXeyWqAS4cbcXkNrVBwV/5rx7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:01:06.6809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feecb2e4-0f29-44ad-78a5-08deb667796a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4909
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62255-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:email,ti.com:email,ti.com:mid,ti.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0FC2658D4C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pratyush Yadav <p.yadav@ti.com>

With multiple contexts, there needs to be a different DMA channel for
each context. Earlier, the DMA channel name was hard coded to "rx0" for
the sake of simplicity. Generate the DMA channel name based on its index
and get the channel corresponding to the context.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 4adfae425f19..c781b312cea8 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1036,9 +1036,11 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 	struct dma_slave_config cfg = {
 		.src_addr_width = DMA_SLAVE_BUSWIDTH_16_BYTES,
 	};
+	char name[5];
 	int ret;
 
-	ctx->dma.chan = dma_request_chan(ctx->csi->dev, "rx0");
+	snprintf(name, sizeof(name), "rx%u", ctx->idx);
+	ctx->dma.chan = dma_request_chan(ctx->csi->dev, name);
 	if (IS_ERR(ctx->dma.chan))
 		return PTR_ERR(ctx->dma.chan);
 
-- 
2.34.1


