Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A8E233BB7
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 01:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbgG3XCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 19:02:04 -0400
Received: from mail-co1nam11olkn2046.outbound.protection.outlook.com ([40.92.18.46]:27315
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730448AbgG3XCB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 19:02:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKE3Mf6UqFX5HD2DOyHl5bDRbRQeN+9TXN3UYi2nRBdMjETmgc7+0AHluAvtg88fxciTGsgaCkeJ9htzOUw2NV17vp7Ntk+RaWbdyHQrZ6XjV2LI8eAYpSw9k7nMiB5bYOPdRU4asoIq3lHlRQt2B1TObSS48XUGebkSdC+sqJ92TUsPLPqo2KhfXJS+C96MLskBmaa5Y6A/gfsFWQdbXhwRJ2wnLHGN3Fap8g5JWnAK9B5eL+J8GgLNRomO1IZQeqQPWgbHvZqkudcQMjKXY+dBZqOYux8DDd7Dn2v+HP7h5rs8oAIo3nCoC/iczeh/zuEH42/Z1AcVcyvvsLsvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JD5D/K+YOcaHEelvCtTtp3WVVuV1oKEaVPdLgu7VF8k=;
 b=DY5eWIi1kL8yo2BwdZNbEHFLwSWJglmVMHN2TCJQXrJMF4+FIR9M/+w8rvc+gbL5vXgFMSl5tjku2Uh+liFRNvbz4763kmemcehJ8V4kq3vfKuv+PR18S7cn5heqC/wftxp4nmXxNnLY4SILAo/6F0h3HbNQon0Qq3xuQ42VVbLpHx3BjVhVDf1uVnHzsbL2CwCiY+zEGC37ULL/At8PHDzIGR0B4IUEctBeE9tDaDLtUJYu552h9f57ybt+HuJdyLm7jB2dM1J4TI1A3eg25A6PAjcMzd2OXZV3+I139LTp3l6u9KG1Rtr59OHdWE7yg1IyFHQOeYxvB0j5ZZcBog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::47) by
 CO1NAM11HT248.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::243)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.10; Thu, 30 Jul
 2020 23:01:59 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4a) by CO1NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:3861::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend
 Transport; Thu, 30 Jul 2020 23:01:59 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:91B40D7CCB0CF246473237CE7063468868981E2365E6A229D029AAE4A81270B0;UpperCasedChecksum:27A67388A55D91C7A5DA75087D551B23173E720CEF8C3A7DBC961D1D488CDE32;SizeAsReceived:7874;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3239.020; Thu, 30 Jul 2020
 23:01:59 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH v2 07/11] media: exynos4-is: Add support for multiple sensors on one port
Date:   Thu, 30 Jul 2020 16:01:10 -0700
Message-ID: <BN6PR04MB0660571351D03A3A4FEDCD2CA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730230114.8572-1-xc-racer2@live.ca>
References: <20200730230114.8572-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200730230114.8572-8-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 23:01:57 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200730230114.8572-8-xc-racer2@live.ca>
X-TMN:  [JrF8oTi6rFTDZdf5fmmX6ALqLUqYrBV2AmSBzh+md3cYM8SZSL76vFqOPu4Nd9Vx]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: db38cafc-8b28-4935-e1a5-08d834dc9057
X-MS-TrafficTypeDiagnostic: CO1NAM11HT248:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZymLmPO/YonkdFjQPRNlKJ2UoqMOJcm5V5Wril5aZjUR+c1ncx58dEVSXi7yoM8efyEtHZuyKhOcMKsvaB5grqAbNwC6oKMWAVFYgqDeXvkiAW6g6TeTLw3fEr41UlFKBcPZbHDueXyQ9MQERhlUguOOio21obbo8mWiBBOfJo+kBEphjwTmqc4m4ISYru8vyAigFecJNzB0o6QPzTxdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: uChhgvxFYvgDL3O7FnZxkxOMS7TznRdNmdcSDvTzF4X7I7m2SZfrhhE1haYr6JDyDGMfW0dKUJ3CYoGQPAh0Jb100H0EQv2Dm47/DR/MK2GCiCWau17Xcn8midrhKluTHvmjRYLZ0J4AVpJS7D1zgpW7T4FspzPludfx+2f56ss8tMwoPD2LwoPubyPNPmuC4/E3PnnMj6DXvEdZVpqRZA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db38cafc-8b28-4935-e1a5-08d834dc9057
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 23:01:59.5691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT248
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On some devices, there may be multiple camera sensors attached
to the same port.  Make sure we probe all of them, not just the
first one.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
Changes from v1:
- Separated parsing each endpoint into separate func
---
 drivers/media/platform/exynos4-is/media-dev.c | 28 +++++++++++++------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 70b0a70840cf..6d9b8fe3ac79 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -394,21 +394,15 @@ static void fimc_md_pipelines_free(struct fimc_md *fmd)
 	}
 }
 
-/* Parse port node and register as a sub-device any sensor specified there. */
-static int fimc_md_parse_port_node(struct fimc_md *fmd,
-				   struct device_node *port)
+static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
+				   struct device_node *ep)
 {
 	int index = fmd->num_sensors;
 	struct fimc_source_info *pd = &fmd->sensor[index].pdata;
-	struct device_node *rem, *ep, *np;
+	struct device_node *rem, *np;
 	struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
 	int ret;
 
-	/* Assume here a port node can have only one endpoint node. */
-	ep = of_get_next_child(port, NULL);
-	if (!ep)
-		return 0;
-
 	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &endpoint);
 	if (ret) {
 		of_node_put(ep);
@@ -482,6 +476,22 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
 	return 0;
 }
 
+/* Parse port node and register as a sub-device any sensor specified there. */
+static int fimc_md_parse_port_node(struct fimc_md *fmd,
+				   struct device_node *port)
+{
+	struct device_node *ep;
+	int ret;
+
+	for_each_child_of_node(port, ep) {
+		ret = fimc_md_parse_one_endpoint(fmd, ep);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 /* Register all SoC external sub-devices */
 static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 {
-- 
2.20.1

