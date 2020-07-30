Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B560233BD7
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 01:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730786AbgG3XC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 19:02:26 -0400
Received: from mail-co1nam11olkn2089.outbound.protection.outlook.com ([40.92.18.89]:48096
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730770AbgG3XCE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 19:02:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6t+tJROmpXol7kejzNBPpdvwjjoxV6yA/Kla5FMK2FB9/8W3xXXxkJafVoAi2r6hh4aT5ELtD5NYjWYR/d+kNb0CjDPSkJ9Mtx/7qY2Kqr+GIl1kL4DFbA0LGiX5F6yzptPW3ze23SKj/zzPQt0kvFg5e2r40h9KQtNgzuGvT4V+RJu92ATs+k6N270bQYNrAGvaCBv5W79UNJAF0/FdB58u2yvi6bEyJ3fJ/a/YYVTAqfB+RckKW7vqz0pRUPG4u0E/RqyDKQZjl8YRUGbDBNiFolwjm4BsinzdyU4+YCearEoxYTfe3AizDR3xB1qa9wGZvfut+V3uFfhFaRpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pJ6xJQhePW4eETLLlJKJGjutRhO0/Rc8Esmkoshk5s=;
 b=S+2UQJba76GrvFrt3FLlgCMjK84lfPK+IIkDhmQQTXLZJM+0Qjvn5HU7M3z3jlhVMoy7uLKBsjWmc9/v2E5B+I4J1CzqyXPUwKiKJG2KKwylkZ7L6VWxUAlQW+37rzDvmImDB6V9Vo0foHIkYg6urQzytPM0OVzf6lGLzk/D7bPT1GkEHtHnSCmK6FKUeNHSUzkA2nIdOCXzD5SK5bBdYUnMzLPxT+V1OfvIRr9zZn3l5cXrfPvmTwliOFguik9drhBDGXD6A3rKpjTIo+selT7h63CdjEtP5QKqKetw5nadg9yivdzG2oI4Wes1GtLSnnvXSI/Zvskj7R3i7UYqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::45) by
 CO1NAM11HT133.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Thu, 30 Jul
 2020 23:02:02 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4a) by CO1NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:3861::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend
 Transport; Thu, 30 Jul 2020 23:02:02 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:22984D4AC8BD4FCEA25A7B65AFA40CA7A2EBD9C78C1223786523D479F330E945;UpperCasedChecksum:134294722C09C000F6ACEE3BBB1E529F04DE0C8A6F6FF0B70C9A587EC48BD131;SizeAsReceived:7912;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3239.020; Thu, 30 Jul 2020
 23:02:02 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 08/11] media: exynos4-is: Remove inh_sensor_ctrls
Date:   Thu, 30 Jul 2020 16:01:11 -0700
Message-ID: <BN6PR04MB0660A067E00EEC583E9C718FA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730230114.8572-1-xc-racer2@live.ca>
References: <20200730230114.8572-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200730230114.8572-9-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 23:01:59 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200730230114.8572-9-xc-racer2@live.ca>
X-TMN:  [Mg/ZFCpLrxkWYy9upa9oNV+bBeZCE0wJaDtq08CU5OCCzmMNLfCN+/Y5Z2zfV++L]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4fdd141b-1242-4ba5-efa9-08d834dc91d7
X-MS-TrafficTypeDiagnostic: CO1NAM11HT133:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eFR2PgS6y7n4HfgDdMmfK7mI7/FlEr3WNaVOXft2metJt0ZsOGpIOXzOjvLbOve2jMI8/fYnnuADJ02eVSzL7FWwx2HV6JIc2AzvAreQyM9PdhPkRjznifvRH6CZh/wa9OHGyLBLOoOr3zguxNXk9hjys+bJ3W74B9SqupaoZ4NRdUMQ92sZY2YEWWB2ESxACQtjrQ32LKyg0k/plGUALg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: zIEFU3O3E1HYVHYqxzmkakHQ473vtdu5dRE80GDyPCGliiYvBof7vkfaqHKZviFEi0HChGZ/dCsW7+QQSkeiLuWk9ZJJGx52JboM586b2g3uvXeyHN0WRK8B5qDpTQchvyftM90eEuDX/81ECJ3tuAkRpWmifxlvLWkkyV96DePAjtaTvVrS8+2D6m8nYBzCHASjJHhW2wQi66crMn2Twg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fdd141b-1242-4ba5-efa9-08d834dc91d7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 23:02:02.1020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT133
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a no-op as it is never set and is a remnant from non-DT days
that can be safely removed.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes from v1:
- Added R-b tags
---
 drivers/media/platform/exynos4-is/fimc-capture.c | 13 +------------
 drivers/media/platform/exynos4-is/fimc-core.h    |  3 ---
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
index 82f051f6b816..e70785d8a809 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -492,17 +492,6 @@ static int fimc_capture_open(struct file *file)
 
 		ret = fimc_pipeline_call(ve, open, &ve->vdev.entity, true);
 
-		if (ret == 0 && vc->user_subdev_api && vc->inh_sensor_ctrls) {
-			/*
-			 * Recreate controls of the the video node to drop
-			 * any controls inherited from the sensor subdev.
-			 */
-			fimc_ctrls_delete(vc->ctx);
-
-			ret = fimc_ctrls_create(vc->ctx);
-			if (ret == 0)
-				vc->inh_sensor_ctrls = false;
-		}
 		if (ret == 0)
 			ve->vdev.entity.use_count++;
 
@@ -1408,7 +1397,7 @@ static int fimc_link_setup(struct media_entity *entity,
 
 	vc->input = sd->grp_id;
 
-	if (vc->user_subdev_api || vc->inh_sensor_ctrls)
+	if (vc->user_subdev_api)
 		return 0;
 
 	/* Inherit V4L2 controls from the image sensor subdev. */
diff --git a/drivers/media/platform/exynos4-is/fimc-core.h b/drivers/media/platform/exynos4-is/fimc-core.h
index d130f664a60b..31f81bcb8483 100644
--- a/drivers/media/platform/exynos4-is/fimc-core.h
+++ b/drivers/media/platform/exynos4-is/fimc-core.h
@@ -299,8 +299,6 @@ struct fimc_m2m_device {
  * @input_index: input (camera sensor) index
  * @input: capture input type, grp_id of the attached subdev
  * @user_subdev_api: true if subdevs are not configured by the host driver
- * @inh_sensor_ctrls: a flag indicating v4l2 controls are inherited from
- *		      an image sensor subdev
  */
 struct fimc_vid_cap {
 	struct fimc_ctx			*ctx;
@@ -322,7 +320,6 @@ struct fimc_vid_cap {
 	int				input_index;
 	u32				input;
 	bool				user_subdev_api;
-	bool				inh_sensor_ctrls;
 };
 
 /**
-- 
2.20.1

