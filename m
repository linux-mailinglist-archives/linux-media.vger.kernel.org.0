Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF19233BD4
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 01:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730767AbgG3XCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 19:02:03 -0400
Received: from mail-bn8nam11olkn2057.outbound.protection.outlook.com ([40.92.20.57]:12065
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730759AbgG3XCA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 19:02:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGk32Sw6be5mpPSNM8GYZb+mRoTamhUG6a/00/CL3mvj1X7Eqny+vjppiDJwPmln/81/4bCG0CIT+RqVhym7/lqNA5NuinAsJ4WbraGYNGMSkKq0I0RuFTQpHqqLOvH7kvZctX5TzjzFIgUw4Ayr+pnKASjqi2b8eADS6RfSJh0jGdVLdv4vMVDhpaZUdvd/KYHPT2MgLhHkO9sSXhU/kHElVL6c23a9fXixm2FsqVjy/lEHajRT7DFUQ6QuruWdIuPE9Ootk9AfRFbJFl+94chQH3d20pYBu6F+6yJz/7qHB1cdqZkdsdxByo9v8+1OHwHaN5UnjF1Fprp2MEH3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzV4jJ26gKp+YoyYh2H7zNySDRn/44W+1lg1EWI3eRs=;
 b=e+Oqe6RswafIcAZBIBO7w0A7m0ExykNBwWIAOjdYrFllZ9Bmi7b2P1PglmDrjisUFHI9DYFX5GindmhJ2WzAqS1wKxRbaxbJZ4VeXP0u2Uk6JFqhX9Cr31aZkADMwlHFcayioXaeJ3WB2jf0LdDwwQDeG82iL5qdDPeyt17N9IvlTf58lOQyo705SrQuOrIYe7zG3+5TRVhPRGKTMrxASqD1Jk3UTBmCWnHa5KHsL//FPCLJRu+pP7oY2h8xzke2kdsif0o57MiU+2zDGzjpzuaNSWwm2PXKgmTkYE7+roXsvO68JrzEKC2OWgFXh50PfRuJvdaWYnCdWy0UFTIPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::43) by
 CO1NAM11HT255.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::391)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Thu, 30 Jul
 2020 23:01:57 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4a) by CO1NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:3861::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend
 Transport; Thu, 30 Jul 2020 23:01:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:90C7DFD20FEE48D4A92D59C9E1AE01C5384C3DC4A9366603477D130A311D71C5;UpperCasedChecksum:F2D0D7A2362F274319A1DBAD0FEF24C064011A265C3A4BA6E4E386A0927F93C8;SizeAsReceived:7875;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3239.020; Thu, 30 Jul 2020
 23:01:57 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH v2 06/11] media: exynos4-is: Use global num_sensors rather than local index
Date:   Thu, 30 Jul 2020 16:01:09 -0700
Message-ID: <BN6PR04MB066025E2D254EF0E5383B7FCA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730230114.8572-1-xc-racer2@live.ca>
References: <20200730230114.8572-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200730230114.8572-7-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 23:01:54 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200730230114.8572-7-xc-racer2@live.ca>
X-TMN:  [eLa2Rbv6VCJG/Hsz7K+M81GItwGuTbRYFBXedc8GzqsoGD3qo0vzKhexeYG9l+V8]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 24082640-ada7-4321-2eab-08d834dc8edb
X-MS-TrafficTypeDiagnostic: CO1NAM11HT255:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LlNiGL7vAMnMC/QLUtVWdmaUobOPeADzz6pTrkmNKfUxxdY1GjZykuKhkgUMABYvzABzw1InrVSjl5EiKh9c1ITN/yfzM7aSJ48tXRj3jmkG2dOwzwcjJFdbjvw8a1Y0u54H+sVvGAbR5+nG6IPAu56h3KVzA1FOHSLQSDBbtVfptHhKHzyIf2CfAf3PrtATL/P+CzRngODaCTPUqC7ZPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 9A1Jzr8Ik4QXA+tC32j2M0a/+mhO09HjNPICDBL4FLDckfnT1BODCqrU+/Lew7kEE58RPeyO6B6ClvGcX9NO6X45SdfJpEdKR1Tu++GbQig8Z7k3REihh3Jf9jaanH0idPPrYIbe40os3PraAznHREqmx6DhVezCp4/zkkvj0WNa1nUdcubFnJWoAAO9krKrbckTUNLYFc314/OIqVJqnA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24082640-ada7-4321-2eab-08d834dc8edb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 23:01:57.1361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT255
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of keeping a local copy of how many sensors we've probed
(which may not even properly represent the number of sensors
probed if we have a port without a sensor), use the global
num_sensors counter that has the actual number used.

This will also make it easier to add support for multiple sensors
being connected to the same port.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
Changes from v1:
- New patch
---
 drivers/media/platform/exynos4-is/media-dev.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 5c32abc7251b..70b0a70840cf 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -396,9 +396,9 @@ static void fimc_md_pipelines_free(struct fimc_md *fmd)
 
 /* Parse port node and register as a sub-device any sensor specified there. */
 static int fimc_md_parse_port_node(struct fimc_md *fmd,
-				   struct device_node *port,
-				   unsigned int index)
+				   struct device_node *port)
 {
+	int index = fmd->num_sensors;
 	struct fimc_source_info *pd = &fmd->sensor[index].pdata;
 	struct device_node *rem, *ep, *np;
 	struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
@@ -488,7 +488,6 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 	struct device_node *parent = fmd->pdev->dev.of_node;
 	struct device_node *ports = NULL;
 	struct device_node *node;
-	int index = 0;
 	int ret;
 
 	/*
@@ -515,13 +514,12 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 		if (!port)
 			continue;
 
-		ret = fimc_md_parse_port_node(fmd, port, index);
+		ret = fimc_md_parse_port_node(fmd, port);
 		of_node_put(port);
 		if (ret < 0) {
 			of_node_put(node);
 			goto cleanup;
 		}
-		index++;
 	}
 
 	/* Attach sensors listed in the parallel-ports node */
@@ -530,12 +528,11 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 		goto rpm_put;
 
 	for_each_child_of_node(ports, node) {
-		ret = fimc_md_parse_port_node(fmd, node, index);
+		ret = fimc_md_parse_port_node(fmd, node);
 		if (ret < 0) {
 			of_node_put(node);
 			goto cleanup;
 		}
-		index++;
 	}
 	of_node_put(ports);
 
-- 
2.20.1

