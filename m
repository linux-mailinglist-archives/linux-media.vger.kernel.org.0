Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1193336BE0
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 07:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhCKGHf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 01:07:35 -0500
Received: from mail-vi1eur05on2076.outbound.protection.outlook.com ([40.107.21.76]:4321
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229854AbhCKGHE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 01:07:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfOn3A+dLE1x04Bz8tJEYohvl0mrd2+o2rZLy0pI8pObQkwRlFmYRUyL5qkqm8ekbu+s0Mo0J7RldKoWCpp7L1wgIHueeDpCwiqgzKF2C6n5ovFq9gojDSrrRrn4uUira7rtl7/61KnwdHAipueVq+tUCKhLSzotY9gAjA1zn17ByOVRCSHZF+IDRNuF+cttfU+S8P2ijOvgiBbMA/1sQ3o+2llU1xqObwW7eUEcKuTsI72UdzA242feyogU9P+FCYZv9Ea9emk05/QHI0z576gDhPMOBcwmwGOFOGb2pEWDz9dxeGBa9NxWO/t1uCJQ2GQV2mH420QASRZ8WUayKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fk9epxyytAneh5Y+KvaTJ102CTBHHhpnctUUPTVHAVg=;
 b=DmI596oCj67kOBXrJBba1rTYkttpY/SvqG0V+092NMc0Clz3gRcjkdeB65TZs3JMpRMTTIKkyhz3y0Zy9fwn+MizMVc5bNoY9BoFCzAaZGSEEiH8uYoLITVTpD1JLwDuZwTo6pQh0PKCoNNCKMrDpicVXu7x29TzEmhsxO1vOpI0ytFcRcgTkayldOBxj5KFweP9BNAm4//HZAvtiC1ej5+mxyDTV3jz1ALXHGCahGbB1hWavG6MWEnlDPy4sx8ceZiVEhxcLE7j4IFJzvYHNbak5xV90rx4xcX25V6gge9v/5riWRqbtQVSbP/0Ur0BvZXQPz6ec/8SIZ1WQ5f8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fk9epxyytAneh5Y+KvaTJ102CTBHHhpnctUUPTVHAVg=;
 b=GIpr3/n0ZE71oZa61VwqbHxwzQazb/A0m42bLzK8D32jTfCc7S5Ddcs5YOLds3dU6Y8lwJrNXh+dCfvqJkKGrd8SKD0q46POwvQTeoUeknvlG0YnAz9fR0k/Aj6XwQENHgk0DElIaXgzKzP7/7+Lkov9a+oQKFbkzED0O80czos=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6992.eurprd04.prod.outlook.com (2603:10a6:803:139::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 06:07:01 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Thu, 11 Mar 2021
 06:07:01 +0000
From:   Liu Ying <victor.liu@nxp.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-imx@nxp.com
Subject: [PATCH] media: docs: Fix data organization of MEDIA_BUS_FMT_RGB101010_1X30
Date:   Thu, 11 Mar 2021 13:53:47 +0800
Message-Id: <1615442027-16010-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0072.apcprd04.prod.outlook.com
 (2603:1096:202:15::16) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0072.apcprd04.prod.outlook.com (2603:1096:202:15::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 06:06:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 958daf2d-0b5c-4189-ee7b-08d8e453e275
X-MS-TrafficTypeDiagnostic: VI1PR04MB6992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB699236C15418784D46E85FA298909@VI1PR04MB6992.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ie8KsRGul8xCBwX3sAr/shxi7GBZB90+g3AnBOMH80TIu0dx1bSZxoikkMlSYMPYTRzgWaNyfgjM7xCwA4ZEvP7WfvVSqyJo0/vkZ6jTbNG3mN7fsZ8fW7DsWUJJMozBMirK2tXcuWj032fOj8CwDMCOmN2EceJLMrj+OYe2frchRVWYw9MZe8blBF18w3oged7U7BrXCIkPtATeOVua/1eCRk3fHq3YYTjfSAYb0+QwroFdNpDeQSVZglklytoesSsMSBAsNYetAOcBiIvsDJlYWJVwBXyMS9/6w0dMJqjqMX05yLcK2kg2qRzC6BbxgyjgIslHFZpVpMZ7nLmm/jhaJP6dbyIES/MasZ9NOLzINfSB6q5c9Q3gexhqQX504s2Of2UFHocT6IWM8a66olsjg68cri3JpR6G3qFq5AJ1oOTdNqnmIDgcN5lO7z5S2UKUocU3tVdDa7OA2UDEeLoBADoKF73laPCD7WIesqwAvBDRP7E3iCO1w8i2ZuZZHtq1uYGX6FVBzxlZ9Zb38zwrksuFoOy/MNqq2wtJkHvkRrMEJSVI6kcsYpOoN8LqoexZXRZpu4zeXH5M71vgQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(316002)(6506007)(69590400012)(6666004)(86362001)(186003)(6486002)(16526019)(956004)(66946007)(8936002)(2616005)(5660300002)(4744005)(66556008)(66476007)(8676002)(6512007)(26005)(4326008)(478600001)(2906002)(52116002)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3moanCiu0gDfG4sm+83Sqyrs9Edpyjvl/dzSP6cbHdcF5z1CKhkotWBK0PPU?=
 =?us-ascii?Q?9w29fVJ+Epseo04NryzW1r13TriG36SC6nj9IaVcgZmU37FZT+D51QcRsLBj?=
 =?us-ascii?Q?8Z06+fKymhOQ4969mBfZA/PBIAzIgboBqtw9tMeA7kIeWJtvxtMZ1yvGZj3N?=
 =?us-ascii?Q?9wmsVsEMSH7V06Ne/nENX+O9Ksp4ME3dQjVIQylHaasKA55qDCZNagl1hMre?=
 =?us-ascii?Q?WsMRET3X/ao1hY5tdG4mh6/zsDb4HcZxYRNv/3r1stbSyeyvdr0NFU9lLWpb?=
 =?us-ascii?Q?Akc0PiFqVG7LAj2IEotv87d8ThP9MVthjsfzn4kUNej1a7/fuYRyZgl8lcNd?=
 =?us-ascii?Q?PALMrenxw2XEw+dx1wIwP1KNCSyuyzSgR2lTytM7kw+DyxQUV4AC8QHDOQu0?=
 =?us-ascii?Q?wjPnq72x2iia3iHd1nwfGV+uqM/6Yjx+rbZj79C2THEKmifPss5rAOrc/xtS?=
 =?us-ascii?Q?h70DZwRGLZHNOsCt0Ug3bPpW0eqFkgiPz/q65KDVKFWh4fUBeyLrL4KXYoUE?=
 =?us-ascii?Q?pM0aQuNMPoQyf5Jp6bQKR4NR6U3ybOD23E6JfkwNFOXoqvOq7LueVC3JE2bz?=
 =?us-ascii?Q?07qQ8l5YxqsAqImyRUFMuWEEWXF3Q3ZT2h1/CSjpe3/E5WqrVn3q8wcum/DH?=
 =?us-ascii?Q?WVHfYrTREPLLs9ILSxzOH/AODf/rkdS5nGRk67kibOoyT3xtsu3GsZVZl5bk?=
 =?us-ascii?Q?N5xHzm6bF8lbUmm+ROwcE9MjXHqfjNmJDU/1QcI17oitnF+LTYVST6/LLwbk?=
 =?us-ascii?Q?B7xsfs99T1HIESklHQsPmzKGiZp5nRM09MvN9+H10YFA0+OgMpMLib99r3sl?=
 =?us-ascii?Q?7Wft8ZJD4CjkE6zYEVi03puVGmBnuyCbVyUsdYCziZ2VIrC5q4lJhlaLY4rw?=
 =?us-ascii?Q?xK2uYoTHFlgUFS/RKnWGFaqP6SVMm84fOoKqvZm/KCyTg7/oXySKydf96TqN?=
 =?us-ascii?Q?PxikjX9XuSz77jrslSYYQDw+NYERXWfpTD5y1yRYKej9dIcggrUOVXZn9HUT?=
 =?us-ascii?Q?k/5rWw+D7R9CpIw2FH90WoaG+7SQBIao9IY4Iwqz23yFXKtmUU4LLC12XVbN?=
 =?us-ascii?Q?4Jc3d/NaFBT1D5bjTLjl0XyLMooXGLkIdPyJEhI31RowqWC5flBSmUFrgJHQ?=
 =?us-ascii?Q?vtmWuOdUx5dTGiqfNiVSsHByafk3FyonMiywdqCeIDvIyeE/EaHLzl8w6r0Z?=
 =?us-ascii?Q?ybt6CP6BgRYaJ9ndKGI9qv4YXJj0B2GgUs0OSJMkcoGhPfuMhMnHUaz65Bjb?=
 =?us-ascii?Q?WMAsTol1QrkYVvH+b8UqiMbhctrzxmHnffqQJfqPX2HX+z65r7yNyAQdG+W5?=
 =?us-ascii?Q?dcYGbR2WvXXd41WjF+kq7vdg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958daf2d-0b5c-4189-ee7b-08d8e453e275
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 06:07:00.9840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFXv8YzYxflvG6nLilSmI9Z3fOhFsz2Udxz+cwnW/eI6eZm5mHyw2go+UMGsA6hQxI2Y1sAUMcqUchdhYQ68ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6992
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media bus bit width of MEDIA_BUS_FMT_RGB101010_1X30 is 30.
So, 'Bit31' and 'Bit30' cells for the 'MEDIA_BUS_FMT_RGB101010_1X30'
row should be spaces instead of '0's.

Fixes: 54f38fcae536 ("media: docs: move uAPI book to userspace-api/media")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 Documentation/userspace-api/media/v4l/subdev-formats.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 7f16cbe..e6a9faa 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -1567,8 +1567,8 @@ The following tables list existing packed RGB formats.
       - MEDIA_BUS_FMT_RGB101010_1X30
       - 0x1018
       -
-      - 0
-      - 0
+      -
+      -
       - r\ :sub:`9`
       - r\ :sub:`8`
       - r\ :sub:`7`
-- 
2.7.4

