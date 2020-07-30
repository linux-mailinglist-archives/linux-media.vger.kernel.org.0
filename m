Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A0F233BC6
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 01:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730837AbgG3XCV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 19:02:21 -0400
Received: from mail-bn8nam11olkn2084.outbound.protection.outlook.com ([40.92.20.84]:47840
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730797AbgG3XCH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 19:02:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4YGvroDTAT4al7kxZCoV5WNzn1ZM0QRDTnSL9U9xsciS6CZz4dYVQCzcp77AN2iDoUXVpl8LZ3TncGxUJYXItn6gOqaWGbKaYhjWb8MLGmiWNMEzgxiiruER0H2K+ItBHr4R6zvI4YOATy8wXKIB55csfIS35mmXqfDaZG/n4+Q5YZwbrxbza6P53bGekYafI8ikdydfUlFcPu0+xQOuq38E310pjCclRVrNkEvjx9WEwDkD/pCecm37XB4cYElgFKlLvup2nG39Gr0uGAk2cvsm5AJISlrC2hbDar9TytY4LbHF4PRoOP7qk1nogVaX/X/aRQk+r0e+O6voUHSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jD8XzNyqpPreDE2Rfv3VNrWOVOYt8tVX3RZODYw1pBQ=;
 b=Ls9BuZjFabJBJzD/WtTy8Zw2Mi94+/moPzMo2HoEaQ+IhK6QyUstiU41qol7+eSFU096MajVq/2ZmENLaVR95WR8qpjod8IMk0LCIfXzrZqNmIYc4tMYzRiZYQdVbZdtMkA3WqT1NvGqahCjb+5Oqv0LFqOT/JNysTyW9/PfSTusRIY7xwKFMeiI0Ay3ICJNGt/fpwRxiNrrF6NujY870WnlcfWzs2/Sln5w0mnOe2pNrL2bv/pH4ShSCFe9hF6A1wt+g6xwfcXfT80vAvp1Lha7YcvfFZlGWFjAhKq/u+h1pAQYddNo4iSkk8hKrZvnhaks0jxQq9inxjgjzmRPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::50) by
 CO1NAM11HT035.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::331)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Thu, 30 Jul
 2020 23:02:04 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4a) by CO1NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:3861::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend
 Transport; Thu, 30 Jul 2020 23:02:04 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:883F420810CBB5E7843D5AA634682D78853077D4B51FA22BFD96F3EC8E3B8020;UpperCasedChecksum:2B0059B2CC71C105466FD921049AB1735E2C44167B5712A8E7F315CD2C9DBF9C;SizeAsReceived:7939;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3239.020; Thu, 30 Jul 2020
 23:02:04 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 09/11] media: exynos4-is: Remove unused struct member input_index
Date:   Thu, 30 Jul 2020 16:01:12 -0700
Message-ID: <BN6PR04MB066023E5C2309BE21F82A516A3710@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730230114.8572-1-xc-racer2@live.ca>
References: <20200730230114.8572-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200730230114.8572-10-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 23:02:02 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200730230114.8572-10-xc-racer2@live.ca>
X-TMN:  [GYHsq9+Losd5LolH1lyGbfaaG4GRUxdCFIHv/0f0Tf1wVPJbesAJEryPD5TktRMX]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: a9abaa17-c50a-453d-0a8e-08d834dc935b
X-MS-TrafficTypeDiagnostic: CO1NAM11HT035:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IuyCEPITPm9L5UJpenW7Kcp8siLoSOBcyXTPkKs+H/2vpcBnZNZOav+NzCba4JHqEdaDhSqXQH/9ZuFRqR5t7/unWZbUnsO3eIPj70Gn7/fJBlLQ8KO0sXLMQbs+rPLlbRyMjgys0FFUWqewUyF1FZlJ6e7IZNIxm5+4Wqne+kKRPuXro3705N/23YzerxmBzm84xokm+yykosoSQwgkTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: yGfqJ9d3HLX7DhJzCG3vmxX/BLlMZepPu1F96I/7YH9zHDjCxwOSFB32cfStH6z5+cIPFJHL27uzUBJpxxmHHkmNDbazGihM1ZruWqSCtYmlVNt60kd6/FPcTKymbnWg/yvoAjgOK/tqvHKvn8DTxKjeYkrUz8o454g2FmTP6iDLFLtS9WG9UdrvXK2+Q0fwPUHqLvGxse2zTv8BXKzFcA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9abaa17-c50a-453d-0a8e-08d834dc935b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 23:02:04.6570
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

This is no longer used since the conversion to DT

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes from v1:
- Added R-b tags
---
 drivers/media/platform/exynos4-is/fimc-core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-core.h b/drivers/media/platform/exynos4-is/fimc-core.h
index 31f81bcb8483..e4a56232907a 100644
--- a/drivers/media/platform/exynos4-is/fimc-core.h
+++ b/drivers/media/platform/exynos4-is/fimc-core.h
@@ -296,7 +296,6 @@ struct fimc_m2m_device {
  * @buf_index: index for managing the output DMA buffers
  * @frame_count: the frame counter for statistics
  * @reqbufs_count: the number of buffers requested in REQBUFS ioctl
- * @input_index: input (camera sensor) index
  * @input: capture input type, grp_id of the attached subdev
  * @user_subdev_api: true if subdevs are not configured by the host driver
  */
@@ -317,7 +316,6 @@ struct fimc_vid_cap {
 	unsigned int			frame_count;
 	unsigned int			reqbufs_count;
 	bool				streaming;
-	int				input_index;
 	u32				input;
 	bool				user_subdev_api;
 };
-- 
2.20.1

