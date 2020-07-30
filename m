Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277EF233BCB
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 01:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730741AbgG3XB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 19:01:56 -0400
Received: from mail-bn8nam11olkn2070.outbound.protection.outlook.com ([40.92.20.70]:51041
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730722AbgG3XBv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 19:01:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=As57PK+A8bWbRZXOVwsn83Y7Va1yGuJqJUyySQBUma2iU+qPKTje0YFAQZMdLnvVv7h1rCtKDhvGGiNEoK4cy0pOFMdNW8a89uxUgnhes5wQcQ6J6VcLUNwAjC4dnpUA2nGkVxgPbroMcl0iKZk+nbjuIkULnrtnnqJFhvquqBHRbaYfMIenK5doG3Sw9Lj3qZu0SpY/TOSAGEfiW28JJ7bmYvCgwunc1gseuSeeAeXwWohzTpBXqVvSvC1J544wJmAQlBd9VakEkR85zLYUqzLZKFcsknLs9Z0S2mzWsmt9QQyKrm7CqtIXPu/tk2/RzYV6tYuey2ppkU0n0Fahow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFwcI1sfhl05Cfxb1Di5AA+LY2hFfLfRai16fbWZX58=;
 b=WnhXwiCxloxr3Sj6eAzsffkVXT6fa7EYNio1ep+p5i2Js0WwPcMnwDg1y5vAN7+uHJDbfSwya2XHxrH3CECiOjKWhVR7GS++2eLPpDKWgmsI3/M/i/Tjj57V7JXbVKUIRgr5MSTxFSbkPE2lZNyhTFqF6hAeDBNfoza90T6xYQXSBsjQE6t7IOy92Zdd9koozWrAFfopg52Ly6mjeSUWtnPZbG4dZT3tKcgfmAq2gm4wX0BoUN9gjvkMedIk8ECTh++LkUjZMHfE+eD8Zf7buGDusFkeV3PKtC+idfQ/JswJwSGD4VwP4WH4U5mTgW7oFKehleLTKiF4qqFDiaxwcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::50) by
 CO1NAM11HT035.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::331)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Thu, 30 Jul
 2020 23:01:48 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4a) by CO1NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:3861::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend
 Transport; Thu, 30 Jul 2020 23:01:48 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:33A44F6322D0AD2B83F43F8689C76C45CD5E42EA47158C51C25A6059191EF691;UpperCasedChecksum:D0CF47B78F902E1C38966E4DC74BFE8F4A91DB0BB8BB7896936D899EE9099558;SizeAsReceived:7878;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3239.020; Thu, 30 Jul 2020
 23:01:48 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH v2 03/11] media: exynos4-is: Fix nullptr when no CSIS device present
Date:   Thu, 30 Jul 2020 16:01:06 -0700
Message-ID: <BN6PR04MB0660EEE45C82219F3E002013A3710@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730230114.8572-1-xc-racer2@live.ca>
References: <20200730230114.8572-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200730230114.8572-4-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 23:01:45 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200730230114.8572-4-xc-racer2@live.ca>
X-TMN:  [5pTyvKD3uOwSfRd6igeVOCvD7KYa5IT+CI7MuP/mmKyP7C5Yjr67Dtg+vwaUTVjB]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 215fd480-fb37-472c-7bd8-08d834dc898e
X-MS-TrafficTypeDiagnostic: CO1NAM11HT035:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4AI5RBbwESGuvJDWsrExH7cLCrJWaMivl2C9UZXfNfaN8ltOkAqJSjU0TE7GMz50PfyFHa9DA8cS4bKgC3dkTQZGeDoFMzF9T0kYLZjcvsoyY2Ch8uEEFRwmZEUqXGpHJaGhx+f3RwPPT+oQDDxZD1LGZaCMjekYa1WMwi/isq8crxLwY2MFKdB8WM5prWY0GMtoXmmf3w192JqkUwDixw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 7kb0G2eI5B0JU/fAKFN4PAkfPk25wCftyzpqMxxu01/T/E7LXipeJfk83og3zQqfpz6bYST/9YmdXqlYfTG7AWGqTOWuY2Y//worAX3W83B5TdYrlGQgLaT6KrQor2iSN79wXi55q/hw9dXx6DQS9buYXBENzAJn80roruFYurWkANi/wOsHYzHPEW60ok9ZBUiCAAETc5r2Yw/jU8ot0A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 215fd480-fb37-472c-7bd8-08d834dc898e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 23:01:48.2189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT035
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Not all devices use the CSIS device, some may use the FIMC directly in
which case the CSIS device isn't registered.  This leads to a nullptr
exception when starting the stream as the CSIS device is always
referenced.  Instead, if getting the CSIS device fails, try getting the
FIMC directly to check if we are using the subdev API

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes from v1:
- Added R-b tag
---
 drivers/media/platform/exynos4-is/media-dev.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 9aaf3b8060d5..5c32abc7251b 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -289,11 +289,26 @@ static int __fimc_pipeline_s_stream(struct exynos_media_pipeline *ep, bool on)
 		{ IDX_CSIS, IDX_FLITE, IDX_FIMC, IDX_SENSOR, IDX_IS_ISP },
 	};
 	struct fimc_pipeline *p = to_fimc_pipeline(ep);
-	struct fimc_md *fmd = entity_to_fimc_mdev(&p->subdevs[IDX_CSIS]->entity);
 	enum fimc_subdev_index sd_id;
 	int i, ret = 0;
 
 	if (p->subdevs[IDX_SENSOR] == NULL) {
+		struct fimc_md *fmd;
+		struct v4l2_subdev *sd = p->subdevs[IDX_CSIS];
+
+		if (!sd)
+			sd = p->subdevs[IDX_FIMC];
+
+		if (!sd) {
+			/*
+			 * If neither CSIS nor FIMC was set up,
+			 * it's impossible to have any sensors
+			 */
+			return -ENODEV;
+		}
+
+		fmd = entity_to_fimc_mdev(&sd->entity);
+
 		if (!fmd->user_subdev_api) {
 			/*
 			 * Sensor must be already discovered if we
-- 
2.20.1

