Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817DD233BBB
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 01:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730814AbgG3XCK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 19:02:10 -0400
Received: from mail-co1nam11olkn2080.outbound.protection.outlook.com ([40.92.18.80]:59949
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730803AbgG3XCJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 19:02:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqfxwtKxTtRceuNSISz4pyxUoOQyQmojEq78+f9j7JmgcCaAn9QHS9JzkgYN4zM6JNBPwRsNvNUZmq7FyHa5YzHqaaZ/KfU6s1YCKnWyywbMASE6gyWUcCT8ajbLWaG9XSwoldUqIRQDd4VcpsyhaUeuduEGCCDIgebwnLyRVJtEJLGmzztk4MpOCQwUxvBS7YPnyF1TdoPmUQoZIeXgz3U1rlVs+6brSOS2X+Io2+4ikE9TYLinwUvcWWM6mcEISziED9jjFYK0fq0MnwnHU+Z3P8qCf9ZgWr7cn8/4zOmh5ufXiVJO/9M0Y4C7QH1j36oNGEJmSO0WYc6bROGTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KdOFWGq2tYRemSvmeE2n74vkpSZ4QQdHGcP2pMuyws=;
 b=S736WyY5YNjbK9CMV9VtTXSnO/BbjayrRclrw4BoMFsIrcYlnq5f/+unfOMME+Z7C+bYRsSRHyU+jJQ9p66Un+YxLc+UaihvYe9P38UUJZndurd/L5WnV5c9DY2T0jdSvXyUP+4Kbe40Ni/fW0dJxqlmWFmzAypEtYMeRGwI1cONcDnvgWZuTQscoRyGBFIH2gxUFZhn85o0+0AioqCPLrvv4qWTbcQ4CqjljTG9OjYb2HzeTm04+Cdakpd1e3jbR//o/sS8yXhq/EDmb/AX6dWTZF25lGWnzMipQNnAAzUWYs/SOzeDHJSWE9K/GWaVfSwxqvvxvcVHHvqlASR0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::4e) by
 CO1NAM11HT018.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::145)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Thu, 30 Jul
 2020 23:02:07 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4a) by CO1NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:3861::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend
 Transport; Thu, 30 Jul 2020 23:02:07 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1F475629DDB68A38DFC130CCB8F1FAE8943C57822EFEAA169B5DBFB56D0E5C8B;UpperCasedChecksum:FBE681A75446489C350865897E87537F9731FFF3392C6B7150C1AC289B7E5F0E;SizeAsReceived:7873;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3239.020; Thu, 30 Jul 2020
 23:02:07 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH v2 10/11] media: exynos4-is: Handle duplicate calls to vidioc_streamoff
Date:   Thu, 30 Jul 2020 16:01:13 -0700
Message-ID: <BN6PR04MB06606A36716392E7634CF8DCA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730230114.8572-1-xc-racer2@live.ca>
References: <20200730230114.8572-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200730230114.8572-11-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 23:02:04 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200730230114.8572-11-xc-racer2@live.ca>
X-TMN:  [NVzrdjcbDFmjrKPwmClgs53y4e5yhvvtuJtIwpLttDdmQ4zC7eQVZCBy2GOMpqMx]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3dd7da9f-7c1c-4eac-443f-08d834dc94d0
X-MS-TrafficTypeDiagnostic: CO1NAM11HT018:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 12XirX4/pP+7CFneqKLp/Sh3GB4hdD6DC02sAuR9TsRz+T1Rkx7315O38DTXxXaTDSicMoy9v31CTGXPz8NyqkoRP0U+pi+NANuwrsZvS0HYJo0/t40h/Wkz7wkSosqPJoI6CGs6m4FkyD6YATE2IS39zPKFSBssxaoP3koCbFjWDq/1K6p32iJIyIY4RtwDRLf8UVc+NRgoIFs7D9n1Iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: W4whD87R1QqxYiP2vR0N6kdSkIFvPiVu+52/j1CdL3XOjqf9tNk6igGUUs1dstP5c54SMqihvF/0wn94dpn6fTZJieE53h3eiWNJZ2JTZhJjhgMwweBLmaMOctzW3bTY7cZ2OMHwUbYBzklWDS3I0t1iY4nyIN5fNrCza+BQIFCoWsB1rC+I4a8bcmlXpuj3gOXRu3fU+XRZ+t8F+1MO8g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd7da9f-7c1c-4eac-443f-08d834dc94d0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 23:02:07.1959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT018
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vidioc_streamoff can be called multiple times from userspace, but we
should only call media_pipeline_stop when we're actually setup.

This became more noticeable after commit 2a2599c66368 ("[media] media:
entity: Catch unbalanced media_pipeline_stop calls") was merged as it
added a WARN for unbalanced calls to media_pipeline_stop.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
Changes from v1:
- re-worded commit message for a better description of the problem
---
 drivers/media/platform/exynos4-is/fimc-capture.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
index e70785d8a809..887a736b2e0e 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -1232,8 +1232,11 @@ static int fimc_cap_streamoff(struct file *file, void *priv,
 	if (ret < 0)
 		return ret;
 
-	media_pipeline_stop(&vc->ve.vdev.entity);
-	vc->streaming = false;
+	if (vc->streaming) {
+		media_pipeline_stop(&vc->ve.vdev.entity);
+		vc->streaming = false;
+	}
+
 	return 0;
 }
 
-- 
2.20.1

