Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79DD1233BCE
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 01:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730736AbgG3XB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 19:01:56 -0400
Received: from mail-bn8nam11olkn2031.outbound.protection.outlook.com ([40.92.20.31]:37217
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730679AbgG3XBy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 19:01:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qn+NJ3pwYbw8TdGyGjfZ7pq19qFrBlWe9cYgBYOi4jWfdjkudrLwsN1nrIJDfS6z0ASh1LdGaJ+o0PhTaONW/8tmoo3h7xf/hV9jwr6PxgYOGdf+6nDEd0aNu2gkt7TJ/8kDsu1tmSbQ6WHb0m4vhzWA2ZALPl2VZT2j0NLwBtjsOODLN4byUfnYfdIy48EpIkhD/TSvMSq2Kxof3usD7CNZfNhkL9E2P+uEcWatdFusx92g4x/Fy3hFwXPwQYJEut5cf6bgpxIOMmfesC88afSMh4lssmAD13K/2lVRgldbFjB13rd13QuxpzSnMgM2bCm8qcxLimEvnWFh5m7gQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzg4p0YpzGXpf7c5aJJBP2/5PAd5jC2Q8FULLAgJgeM=;
 b=VtBsHZyofX+RWAQuQ19hwYGOrvei0QyV7MW8fGwXA1Ow/o+uhpEEb5UNBrRdiSIX4UYgl7kMM5sn0gdvyDQQwcd1owsnZQ9MgVQfoi366zBMAHWX52nmKJZANuM7LVBJRdBXr4n32SzDNzdsEC5jZP5C64F5YTb3I5fCZJnfz2CeaxVN89+bpxZl9F9/rbVYH9RY975YMYdAFpr6wslCPjB9WMjW/THQN9Y9TntNFJbKw+sEBPft+lmQAAXwk1s8VWyX4Rh8NnEhCW1f+Kjzd3G2Vk1BS/Nv/ygWrayUVjdyGZKItq4Nprsa9aEsJrw2SJXpKGSI6AeNU2Oo44o63A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::4c) by
 CO1NAM11HT140.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::262)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Thu, 30 Jul
 2020 23:01:50 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4a) by CO1NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:3861::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend
 Transport; Thu, 30 Jul 2020 23:01:50 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:930056DD45444DF0AC78256E6DFA894564C3A9184EBDBD6DD92555D32A7F8682;UpperCasedChecksum:824827314BBC270D468198818A60EA385CE1CFD2F658A6645D723140B0A60A3A;SizeAsReceived:7885;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3239.020; Thu, 30 Jul 2020
 23:01:50 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH v2 04/11] media: exynos4-is: Correct missing entity function initialization
Date:   Thu, 30 Jul 2020 16:01:07 -0700
Message-ID: <BN6PR04MB066098E34801126939AB0EF6A3710@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730230114.8572-1-xc-racer2@live.ca>
References: <20200730230114.8572-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200730230114.8572-5-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 23:01:48 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200730230114.8572-5-xc-racer2@live.ca>
X-TMN:  [Sa45lLcPFhOwcEnF5E5Yb3IoYxNJ92gRTGfPqX30OqV8oD48i2Hvw64Ur5z4kkVg]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 445a7fea-0c28-466a-c284-08d834dc8b06
X-MS-TrafficTypeDiagnostic: CO1NAM11HT140:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFUHIckc20eIyHlThbpMTM/up2nJleScSkNxHqC9/LGKjyMh+gRQwNC29wrU9mbtrHDnYFtBbchbEtI8ac/fqdNPYi4LKks67xGVE0wYdOD42A7AWpaa72rBOBMWRDWpW7TsVwhBoe6Lx6/2ar4yVUJ0WBuJwjXa10sPQ0mUEUGicuimtJ5IXc+N1p6URPWIZljJ0KcUtUJLkPS9ahU67A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: v2HlyQ9hR2O0LjT7FhgKOJfrPChCNVvEUgoUdFMsRuuxjzSUOt57w46ismZY/yO0dxDxmU/Z1ZhA2oyfwP6HMmtBeIB9mNnwnbjKko7j0MTLqMfrum3NJK+1MQ2h6VWYMxq7pkP/bPHP0WgWRKApeEJ9PuAOBjjZeG55lDI8/lddnH3hlQrHDIbXZw7CIYhoEQXAVOjQbBE5Z/phuMLTPQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445a7fea-0c28-466a-c284-08d834dc8b06
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 23:01:50.6998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT140
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit bae4500399c4 ("[media] exynos4-is: Add missing entity function
initialization") tried to suppress the warnings such as

s5p-fimc-md camera: Entity type for entity FIMC.0 was not initialized!

However, this missed setting for the subdev.  Set it now to avoid the
ugly warnings on boot.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
Changes from v1:
- Don't remove the function from the vfd entity as it is distinct
  from the sd entity
- Re-word commit message for above change
---
 drivers/media/platform/exynos4-is/fimc-capture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
index 705f182330ca..82f051f6b816 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -1898,6 +1898,7 @@ int fimc_initialize_capture_subdev(struct fimc_dev *fimc)
 		return ret;
 
 	sd->entity.ops = &fimc_sd_media_ops;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
 	sd->internal_ops = &fimc_capture_sd_internal_ops;
 	v4l2_set_subdevdata(sd, fimc);
 	return 0;
-- 
2.20.1

