Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488B21B8B35
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 04:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgDZC1u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 22:27:50 -0400
Received: from mail-bn8nam11olkn2065.outbound.protection.outlook.com ([40.92.20.65]:18845
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726414AbgDZC1s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 22:27:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccp7Y2n/+SP9GIHpxnufbyN5KVUfXAd/Woo71dfp6oFOmGuU2YP7EIFc16agF2Le3IGpJWaAI8pY8xx6JbEecsxUCEQ/pKL/H9SrTzQ+LsrycFHNWBHmiea6VcgpjE5QJcYcyszxN+7d1V5XevWYQXoh/5r1KJ5npnAMQX5vBW3sNs5EAQVTOwqSNbRJm3JJPvdN9MCo+lU9wknkBY1ofJHEokFdmoK9PZ7ykNluXtoXox7MP4ycD4uqX83+ZaLmNp65wPjseR3s8whpnv6k356RSyg1DJLTuyhQNgoJI55POfLrCZSOyIjh756mKc25Q9iN+zF7R125c4/x96k/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqQmCHp8k6z6Z5zFHbV69ZkLYMboQr1394DjLen2RrA=;
 b=epCcOwYBE2QLeyrjXuugNjCfuXFgOPxgpmAR6hvNjQLnIy8msyiAVHczZEYr8tU710heKWgjTKb2xeU3qCYTiWuZRHgiNp1sRrgK3sUjLEn5A5qwiTuFtm0v6BFmwEo/z6Y/zCtDh6ti6ZXKJ4TFXU5+jtZ3pspEuKye1xkLyX9m1Sje4INXbSHFRmuUY1J3O1U1kxa9jtMcp2J+ah/edR7+2JFU1uHHOkVekW2r8+Wcx7ado0TQx4b9wi2bgrIPijg3NqCF+kPu+oDTV9Dz1f+G2pJnsicsVl6PnAZMvLwIvDR8qNOH0jzp7BU9crRdn6E2/6t7o5k7OOoQnE+Aow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::46) by
 DM6NAM11HT124.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::163)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Sun, 26 Apr
 2020 02:27:46 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc4d::4a) by DM6NAM11FT041.mail.protection.outlook.com
 (2a01:111:e400:fc4d::98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15 via Frontend
 Transport; Sun, 26 Apr 2020 02:27:46 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:9F16B53EB530B8F4AA21623F91F5805BC2154B56769B8FB9CC1E1BF60C9317A7;UpperCasedChecksum:C456189A47C3FF523D42548E67DD9EB00660FD6F0ADABC04B777C32F03677050;SizeAsReceived:7871;Count:50
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc%6]) with mapi id 15.20.2937.020; Sun, 26 Apr 2020
 02:27:46 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH 11/11] media: exynos4-is: Correct parallel port probing
Date:   Sat, 25 Apr 2020 19:26:50 -0700
Message-ID: <BN6PR04MB0660A14860692EAB2A658AEFA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200426022650.10355-1-xc-racer2@live.ca>
References: <20200426022650.10355-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR17CA0086.namprd17.prod.outlook.com
 (2603:10b6:300:c2::24) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200426022650.10355-12-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb67:7300:9f89:4b96:de0b:cd14) by MWHPR17CA0086.namprd17.prod.outlook.com (2603:10b6:300:c2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Sun, 26 Apr 2020 02:27:44 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200426022650.10355-12-xc-racer2@live.ca>
X-TMN:  [d1pbhGcOX0gErHKuF4yTox57by75oumk2nYR0eEHvuS91abl/QNQEoAZxJTXWQ/5]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8f027384-48d8-411e-38ce-08d7e989680e
X-MS-TrafficTypeDiagnostic: DM6NAM11HT124:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ke1eKLhxxd7nN15m+8rV5oTdyjVLgTmJuKevL/xvPO7La8WycAijYJCZpMXTKAkY6abicD7bQeXVKypLtZAZwhI1g0hy0KEIzPq08PR7c3gyJGvimZjeOKv8Axz9tpwmZj3Pd9AmR8qoKWL9gsnAYgn2i2V7AdCb+I6xaFuWQHZaHNaB5FlO/66oUaclnDzRxNJHxJzpZmAns4LtFq/Kyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: KLssGpEm1qIWktO2zFfir+nGfT9NBXzoVOoyjMKwP3PjKnpNO5juZoh1Ax7GNaFE7IR2H+tqND61/S+8nWMs4pLMwwWJFDK7JWa/gyn/pnjZ05sdfJENOaIpTJdpKwRm9/J2fVZ2UetjSHhZfsI+0/uqHg1paeR0ar9AgBQUX33rUexwfm6uf6pyYr/AhcBXlzk9L7fX3ppdrr53b+xC9w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f027384-48d8-411e-38ce-08d7e989680e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2020 02:27:46.5207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT124
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the binding doc[1], port A should be reg = 0
and port B reg = 1.  Unfortunately, the driver was treating 0
as invalid and 1 as camera port A.  Match the binding doc and
make 0=A and 1=B.

[1] Documentation/devicetree/bindings/media/samsung-fimc.txt

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
 drivers/media/platform/exynos4-is/media-dev.c | 18 +++++++++++++-----
 drivers/media/platform/exynos4-is/media-dev.h |  1 +
 include/media/drv-intf/exynos-fimc.h          |  2 +-
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index a87ebd7913be..9c4fdf726b92 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -418,13 +418,21 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
 		return ret;
 	}
 
-	if (WARN_ON(endpoint.base.port == 0) || *index >= FIMC_MAX_SENSORS) {
-		of_node_put(ep);
-		return -EINVAL;
+	if (fimc_input_is_parallel(endpoint.base.port)) {
+		if (WARN_ON(*index >= FIMC_MAX_PARALLEL)) {
+			of_node_put(ep);
+			return -EINVAL;
+		}
+		pd->mux_id = endpoint.base.port;
+	} else {
+		if (WARN_ON(endpoint.base.port == 0 ||
+				*index >= FIMC_MAX_SENSORS)) {
+			of_node_put(ep);
+			return -EINVAL;
+		}
+		pd->mux_id = (endpoint.base.port - 1) & 0x1;
 	}
 
-	pd->mux_id = (endpoint.base.port - 1) & 0x1;
-
 	rem = of_graph_get_remote_port_parent(ep);
 	of_node_put(ep);
 	if (rem == NULL) {
diff --git a/drivers/media/platform/exynos4-is/media-dev.h b/drivers/media/platform/exynos4-is/media-dev.h
index 4b8f9ac52ebc..7bd93fd11b33 100644
--- a/drivers/media/platform/exynos4-is/media-dev.h
+++ b/drivers/media/platform/exynos4-is/media-dev.h
@@ -29,6 +29,7 @@
 
 #define PINCTRL_STATE_IDLE	"idle"
 
+#define FIMC_MAX_PARALLEL	2
 #define FIMC_MAX_SENSORS	4
 #define FIMC_MAX_CAMCLKS	2
 #define DEFAULT_SENSOR_CLK_FREQ	24000000U
diff --git a/include/media/drv-intf/exynos-fimc.h b/include/media/drv-intf/exynos-fimc.h
index 6b9ef631d6bb..5a07576c378b 100644
--- a/include/media/drv-intf/exynos-fimc.h
+++ b/include/media/drv-intf/exynos-fimc.h
@@ -44,7 +44,7 @@ enum fimc_bus_type {
 	FIMC_BUS_TYPE_ISP_WRITEBACK = FIMC_BUS_TYPE_LCD_WRITEBACK_B,
 };
 
-#define fimc_input_is_parallel(x) ((x) == 1 || (x) == 2)
+#define fimc_input_is_parallel(x) ((x) == 0 || (x) == 1)
 #define fimc_input_is_mipi_csi(x) ((x) == 3 || (x) == 4)
 
 /*
-- 
2.20.1

