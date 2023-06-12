Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94E5272B574
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 04:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbjFLCi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Jun 2023 22:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjFLCi6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Jun 2023 22:38:58 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9720419D
        for <linux-media@vger.kernel.org>; Sun, 11 Jun 2023 19:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArIEJ9i5lqfYSacCrqQ0TusWzS5Sh3ImyUUxEDoVZMpe93MJJ+qFJSOuJylqqMAJ0pv4PL1Xw1yZwcEZOCzUpmTsQO5ZhAE5sOjqIJsJakqwW9qvoDvMk3TBwTBx+wWemzjfyjwoqR89dACw4GUHcBIho5OrW11dhaIPbZVJNF6hloi3j2OAtVQA5HD62iIsnZG0BGheL3lW9oNgbRdS0x0s2lc/rtiwHlzLOwKJzNzd5hzRJl82ZC1pNSRigTaAw4mfopyeUiQJqx/zc6N1gN6EaXZdgKp4mAxB6Xv97vPRAJT38UmK/Qyot3M6MMLkjIQh4v75vD1XHofHaRyroQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cvvUr4hF3aPKMksE/iYI5QS2Y682gpZqz/AcwcxUkk=;
 b=JVw5B9CCjr6C1KMftsKbDfzhy4pj6nQbgc23tdm/WIu2iJ+iORL0vI4G4ZRwO7MH7rU3Cukq80N/LlsSDuCQjY1FKJH7wgHGZ2PfrxGMKXlMzcZRiYBPBwpk3NRiDY+mcE9FBPikPCsX4Xm6DVrnQt5IAyBT3/AUE4UIQ+EDrpwViXSV22htCCQE8+r+HaVxqOSsdJOf4r5JltM8NVrMuTFaSsUDtShwEWM0RDABCXj9pyCPfotsVZRpuue4k18zYRyUvnu9RsuGPN0TkUvUrehT4khiJXibdoC4r7c8qn4CFlbAtJVJnSmBkfWBTb6oJdDF/VozhQrqJeIGHIHc1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cvvUr4hF3aPKMksE/iYI5QS2Y682gpZqz/AcwcxUkk=;
 b=ikTs/f7ooc96lb/bKQGkOiWkvWMvF2jug94LCMtXc2DvZIk8wPhCtGKKIFofsRGBxFxGdR+YUrmwxXDUmL83yMq3uAPf+IYHuvGrkx+C8lWR7Zb6CXgppfNnE3eOMO1r1U6l9sv0nCyFCv1mY4ipTupzf7/wHpSrJVZn4QbmuKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV1PR04MB9152.eurprd04.prod.outlook.com (2603:10a6:150:27::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 02:38:52 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 02:38:52 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Cc:     mchehab@kernel.org, slongerbeam@gmail.com,
        laurent.pinchart@ideasonboard.com, jacopo@jmondi.org
Subject: [PATCH v3] media: ov5640: fix low resolution image abnormal issue
Date:   Mon, 12 Jun 2023 10:43:40 +0800
Message-Id: <20230612024340.313662-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0214.apcprd06.prod.outlook.com
 (2603:1096:4:68::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV1PR04MB9152:EE_
X-MS-Office365-Filtering-Correlation-Id: d7996bf3-85e7-4467-84bf-08db6aee2881
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sfFoxW+pKCi0dnFXiY/HT8s0OyRT80XP64Oi8Q+vo+TSCKIo5iiFz2yDKjWNnR4cSnG6m8Uv75i7RjIz+ydLucvciVyku1WfnNvhq3OizxBRl/5nJ9I0uYIPlEygVjPBo1SIeJ1usQwBbpiqBUzeY1uIVtyUCOGC3uN78QlmKvLQK/u1s4nnWtBYqjDeJRYimBFHVTgJQNAVxz/Gh64f0TO29WDFaHmrCAFm1BaDZeOWIhybkXNX5aaGLbLYzq0pC982ShDya8zqoezM9UJlrdxTD6zLpjM99aCbUY/XVDbbQcHNMZtdnVI77e5cQxdzG5qkGXYkHhmM/E/HzNipjNwEz9zMOrwIdajDBuRuaNfa9ePYonReCbBxogkx60kfYhfnVXvXpNSb6/hiihS+HeU7VRfjbZM0PuJp0PhCWoGWLL/72j+8Bcqz99dtfl27+5CvDO6WHZBjkKzkCwvpndPurBc2onQE/1E9YiKw1KoM8g7aV35nPIixklOvuF/NP60janyZv54jZZcJ+07vno1VovFYdNWBAVnRtOOE2bwypCz70gIWWn6KQNrtWEqZCLy1WVX3K47LsW1lqfj27tMPefsOjsdtp+JfQZwg8UxFxE6H7F3tvx9aJP66Q54T
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199021)(66946007)(5660300002)(8936002)(8676002)(4326008)(66476007)(6666004)(66556008)(478600001)(41300700001)(316002)(52116002)(6486002)(38350700002)(38100700002)(6506007)(9686003)(26005)(186003)(1076003)(2616005)(83380400001)(6512007)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q1NePmqc1GXCKtKY8Mydh8kHxf8PtY9rJAMmaQXvyiVa+qiBPIz5wdZWZOao?=
 =?us-ascii?Q?7TMm4r5jwUp/XNMm+pmZOYA2Mjr18Qs7Bo9lWq+YERi8Uk7Y9rKrIBkObAFs?=
 =?us-ascii?Q?na4O/6q2JapKF+3Fh4FqA+pJbSBvQTl+7skFYAKEp1n0jDycZeAfSZcPl+Fe?=
 =?us-ascii?Q?/HnUULSRmK7dQNApuf5jCV6D0v6+SX7DDtK0k+hXj0DDDGutJZyT/rSLPSbq?=
 =?us-ascii?Q?mBxARF4mzaLTrpIt9NoWfXd3EJebKsP5AixpkGLx2QewMlkWGnKkKAepMaCc?=
 =?us-ascii?Q?1Yclvz5DdoogWT3SAuwBOx/Jla2asoHtBL/R1r6Z1bQTtVlLddHGnz8Eeo9E?=
 =?us-ascii?Q?5Yl2IAPzs7Jq3bBUL+TUROUoTUty+t/0CYmUMzkPI+UG/i+oadN7+HYOy/L0?=
 =?us-ascii?Q?+nbq86rKrV2xQZI5mCNASn/YwFk4Zw6DAmxLUn1TF82rAswSBh5S4T5i5PQ3?=
 =?us-ascii?Q?qNNFBdDez4RiciG9UbxjXwzblYJG471XSoAtgW3CLMMNOtXKlUlNciN4LeYB?=
 =?us-ascii?Q?7O1grzNgAjDP9FcgM9+l4x0jsxTZhEBO/S5SpnQ0HAn5mk8j7a4Whi+udZtn?=
 =?us-ascii?Q?v0hY/QRcArBcvsWwAuFufH1lMl4d/zB65NCsimCE0z9Lkd8HdK/uCoNmlrP3?=
 =?us-ascii?Q?LiyLfBU2olh++VI3nH3NoRvXmf+ghYN9uRtuq32thRe/GZaOL1XYTEVAjkJA?=
 =?us-ascii?Q?81m/BbjuRjJyj1+jH44KXmQvwGz2T/wEduLMXgMxmetjRo/iFmDiv/gS445L?=
 =?us-ascii?Q?vsQB1HY1Rna7XhXfW93+/UmrzwmjN3DXqIIuyjeAfsQhM4rWz0WsAR9NdRWK?=
 =?us-ascii?Q?TQHLES4L5F2bIVYImU/MRjR98NLqOIiSSYSgNnASjjYfrEfjtc/hJkzEQzfk?=
 =?us-ascii?Q?nDrAydKhLS4BFAKohVdKtuhH6lolMXK528u8aMxE3YetwwYZhiWyJgo5mqZW?=
 =?us-ascii?Q?cbA7ZreBqYUIPKZsjndAF3IgP2mcADehKnOiLqJxwv+F8SYf3GlYbOnJTWc2?=
 =?us-ascii?Q?1JJIgeiwynR/leWVaV42EwJ4PNZ67xEn4WankjdRQ6UXPRIMU/VTTdNV1Q9Y?=
 =?us-ascii?Q?LKRs6LVHtpH+vnsFDqDW2/evepX3Vk8PdagffE8LzgLBtROZxW9sSy5fgyOY?=
 =?us-ascii?Q?6oPN0OckAdpZjHWnfCuQNRefsOW4xUQE5enXMeblIs9iZDAs5rFk1NcEA5x0?=
 =?us-ascii?Q?teSOvuc/8GXccIfmkAAsZz7d6idsAi1+xnPFGQh5HeSfwKf7y/BBDGxqjE0H?=
 =?us-ascii?Q?mEKo38zRejdXSm1JHZpJzL0Mv665DlwqJ9IltBR7jRHCRsCCvfkA+YVBqSd/?=
 =?us-ascii?Q?3aN1tkCHjyKzbrMXYJeOzqSE9KM5E9jxgdCWIGqAYkhxHSdROYHxlIBIm3xN?=
 =?us-ascii?Q?5roEczXKZj5K6X+PmS0zjW/rF6RNHQp821LDSt7udzBsphmVMC+KwkG6tl3F?=
 =?us-ascii?Q?FGq5p+qUPtdui9mZ3N4Shvyqqx1Xy9TyvZpOkiyTAFidaHRhvG+dyPf5BMIv?=
 =?us-ascii?Q?4/g+WCko783PWG4gCiYSErrqa6tWbqN30TS2yQ3AS1lGGHldIxptv5VxddqM?=
 =?us-ascii?Q?+LPx/cAf6cJJtgz4j9SZwuYWZginks9ytUDygrFM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7996bf3-85e7-4467-84bf-08db6aee2881
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 02:38:51.9310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YuRv0SaHmW2vsK8bn4QXnMP50+JE+f+14BFe5mijj0Rgiy/IXgyYnSlmynQx6pZp5yFs4DOVUpeSQzJVAXjFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9152
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

OV5640 will output abnormal image data when work at low resolution
(320x240, 176x144 and 160x120) after switching from high resolution,
such as 1080P, the time interval between high and low switching must
be less than 1000ms in order to OV5640 don't enter suspend state during
the time.

The reason is by 0x3824 value don't restore to initialize value when
do resolution switching. In high resolution setting array, 0x3824 is
set to 0x04, but low resolution setting array remove 0x3824 in commit
db15c1957a2d ("media: ov5640: Remove duplicated mode settings"). So
when do resolution switching from high to low, such as 1080P to 320x240,
and the time interval is less than auto suspend delay time which means
global initialize setting array will not be loaded, the output image
data are abnormal. Hence move 0x3824 from ov5640_init_setting[] table
to ov5640_setting_low_res[] table and also move 0x4407 0x460b, 0x460c
to avoid same issue.

Fixes: db15c1957a2d ("media: ov5640: Remove duplicated mode settings")
Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
v2->v3:
  add "Fixes: db15c1957a2d ("media: ov5640: Remove duplicated mode settings")" in commit log
---
 drivers/media/i2c/ov5640.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 1536649b9e90..1bc4d72a906e 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -568,9 +568,7 @@ static const struct reg_value ov5640_init_setting[] = {
 	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0}, {0x3000, 0x00, 0, 0},
 	{0x3002, 0x1c, 0, 0}, {0x3004, 0xff, 0, 0}, {0x3006, 0xc3, 0, 0},
 	{0x302e, 0x08, 0, 0}, {0x4300, 0x3f, 0, 0},
-	{0x501f, 0x00, 0, 0}, {0x4407, 0x04, 0, 0},
-	{0x440e, 0x00, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
-	{0x4837, 0x0a, 0, 0}, {0x3824, 0x02, 0, 0},
+	{0x501f, 0x00, 0, 0}, {0x440e, 0x00, 0, 0}, {0x4837, 0x0a, 0, 0},
 	{0x5000, 0xa7, 0, 0}, {0x5001, 0xa3, 0, 0}, {0x5180, 0xff, 0, 0},
 	{0x5181, 0xf2, 0, 0}, {0x5182, 0x00, 0, 0}, {0x5183, 0x14, 0, 0},
 	{0x5184, 0x25, 0, 0}, {0x5185, 0x24, 0, 0}, {0x5186, 0x09, 0, 0},
@@ -634,7 +632,8 @@ static const struct reg_value ov5640_setting_low_res[] = {
 	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
 	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
 	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
-	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
+	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
+	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
 };
 
 static const struct reg_value ov5640_setting_720P_1280_720[] = {
-- 
2.37.1

