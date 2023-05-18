Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0ED9707D7B
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 12:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjERKBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 06:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjERKBO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 06:01:14 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2041.outbound.protection.outlook.com [40.107.105.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042F5E54
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 03:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnCqf5S0WAkN83k3U1RuyF6q86X6XGjzn9a3g5Nld8+Ko77zZx+UumOqTtdvGJGqv+plbdbn/oiOHy9oIyi4Y5PDwQmQUklLBDt73j6lbEbBkdrYaUSi7tQjn5lL+ZldDfhqbErjVHuBEQj77ZcrhUzjUV6QIKbCLCtK0OogeqafRyEJX9pM9e2gVvI9mpvH/sTjRwxe5E8axniJBxvNMqP0EKjJZ9ztgjYRUM0+d0MxNmtSBc1TVwbT2QBA1EzjEqdcICe8Fo2uQ31SqYlZiTG173S6WiKCZifFZ0bPCcjgG7QxwfT7Td4dsqlngPDJiG0yEB3J6OcGBAXSKXDEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEjm2ho3r12L7Q0Fp8aV9965jJgp6pW33bVc7EZrwhc=;
 b=N2RtlYKXY9Jy/oHbUKRNZH+IOD8aKBEHDDPdLf+HXE84qvO0WqeuB6sINOArpWTZ/oEnYr9jgeHg67nCUN6Lf8M3RCyc+cKBIy23MsrOFoprMoX6fwfD3sRQQRzeI0GUxrIVwXRnU2OCcSij9HYw+d+p5jrgzoNl/PJRYZ+a4jD4RjJ+jlyU03rJEPjqvMSKF9tHeQa2NdDB+xBu/3sWrJGqLQr0i5BxpqPN24np+6nvzyelz6yRI4llPy9KdzSg9rYKYXJUUNWjlWbVFA43I3oR27aPdnTKxxFgtoUiIA4HsJ4Zrht2k2ntsFQ6vv3e61z8jf7LqlqO8/0bXB78hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEjm2ho3r12L7Q0Fp8aV9965jJgp6pW33bVc7EZrwhc=;
 b=X8cTm/esngF+jXocXuj6S7hU2Zclc+CCDvmIHGWIv2dptQW3F0oSXWEkkBJnememOzG3ZfxSS89Te8WSrLEb4cbq22Vc4ZTt7W8LVVjhwzlByi9K3ZztnIyNErIcHeuqt1LNoFa7JTL/3u9+gs0HBlvKaH375o/ZXxuSjcMEQ/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB9079.eurprd04.prod.outlook.com (2603:10a6:20b:446::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 10:01:10 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8%4]) with mapi id 15.20.6411.017; Thu, 18 May 2023
 10:01:09 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        slongerbeam@gmail.com, jacopo@jmondi.org,
        sakari.ailus@linux.intel.com
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH] media: ov5640: fix low resolution image abnormal issue
Date:   Thu, 18 May 2023 18:05:57 +0800
Message-Id: <20230518100557.2495843-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f2b23ea-e002-43a6-54d9-08db5786cdfa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wwgM1GHCNnfpbgAaFhd+elR/e5uFK+xifwAhweyrwg/hTnN2b37T/7Ilrky7xKyYqeiREviyQ4BJcDm9EMX+Gs2WJlHHUjYk2C54k4FhdyuEfswg3j8z2fMNm0kc+nK0BLY8BwUcvcmV+3d/0/kbj2SPOhosBYZPWU4ojEwUlDE+QRFGzHYgMha3KVteouJyqbs9yhRA49jc2FUaMh3Q7qKhJD/jy0nIGQ8gcqJnjBchn77IVbM7L8Xc3TPDxQw9vZpIU3CDwAtUNAyEPp2CG3TMK94EB7vS3QLhCeGWl0mgRmMtGGRxcQ6UmsEnEy1IYa75dUH453U25NiPWWrD+5GiRSiuWaeEAwSmAnINIzJMIouW5BJDIlaayhveFo13TBg7DV95D50HNXuvE06trdeyAC5btIRMtcmutKU8E0Fa98itQk4BJmIscMgK1sDoQf5m6lvIkdZlfRTvFiouKVSQVxevABMnzhM9i2kaULLEDdSpUSGb+N4fabdx5gnyw69cr6FX8aKjUCvVSlkiHWVP1LpBJzINZQluaIWM9BP8OLK/S6+vFWjJfh4Z/N7zWIRhO5uotfgDaVsCO0W1ZZgoaadPSv38ekgB1ev2laTHXX9FyvlyyWd2Xk1aHvJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199021)(41300700001)(6666004)(52116002)(316002)(66946007)(4326008)(66476007)(66556008)(6486002)(8936002)(8676002)(5660300002)(478600001)(86362001)(26005)(1076003)(6512007)(6506007)(9686003)(2906002)(186003)(38100700002)(38350700002)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aAdtjBMbKmD6+Ds7YZbAcZJlrrQbE7Ct5H/Tw7Ntgy+tJwSVISKmIaAKUjTT?=
 =?us-ascii?Q?cpAerwKMWFDRA3qhIhx94k3AfiHWxn/uwiojK76w2RfuMfAcFVKndBNAwQSw?=
 =?us-ascii?Q?KVZ0xFbBq+M73R5MBAnyQtjMVku5d92FljmvY/JzXKCa0AydfNkbpyFP1jxb?=
 =?us-ascii?Q?smLNjmQOfG2BNKSAbIzf0HW1tieVVvO5M+zERt3XrJf6pa1Po402OhmVazdW?=
 =?us-ascii?Q?T0pkVgqH9+6dfLtHp3xo1/nse9uU3o2rcGh8Woq7DKqGpY+W+QHUvWJRKCFJ?=
 =?us-ascii?Q?WsXenQfwOXKgjp+oVqQW6RUThVP7reu7x+0f1HpSXXfvOhkGBq3dAh3uS71U?=
 =?us-ascii?Q?KBFe38cvVCmGjbk4wimpNqJbMVYPDy1tWOwM9p/EKDTDPvMYEx3GuUOdLSQI?=
 =?us-ascii?Q?OfzimXyTQjIiV9fA1wxgsDixZVIzKeSq+u/NRqoh0Z8LySUNGZbooJBE1xmn?=
 =?us-ascii?Q?cGQnJEma1ZauV2kIMhncYJTkjkbCYLaA3crAEiqnJZmsg3JAaGp/BPlT7UJy?=
 =?us-ascii?Q?6YZ26SjucrulTyQB4tl9T9ewd9vR+DKvd6Ccdgu/EgThM+mKC42V8VSBRLUn?=
 =?us-ascii?Q?vh7Iy6UFz1VPvfJcIS+qA9WYf3Bah8N/WvWQUoKhj8UXybjUowJTOSYvB0p8?=
 =?us-ascii?Q?FOYbG+z/0bt+ThIkp8xQ5mbg5zXmUV2E0UjjdViomVvDejrYVwFzSZ2fup+h?=
 =?us-ascii?Q?iCZRMPb2erBIbR5BH1fElb6hCi6RrP2d4DYnKXZ5jcy8zOX0w6d4cbSmz0ds?=
 =?us-ascii?Q?im6EBw6Eap+2znzrmQxMdwzciyIpLdJzIq2ovKYuUSTAmrDeRIYK9L30FPjt?=
 =?us-ascii?Q?rSNt5Yz1pb4m0fkFe94LPIWH2JKngXCgEEXu906pY6l1vpWmOrGZA3GB9QhU?=
 =?us-ascii?Q?cZmk/Rxq5ASkuO0IETx8dzsBnE0ZJvMHd0PYi48iYI+331lMajBjmRHZGxGv?=
 =?us-ascii?Q?3pbDPE3HiaNYWwPrv8S+DIsg5CdU+IG4nE4dmjvYOxnCOZA3SDSugGLDj1D5?=
 =?us-ascii?Q?kicBRrq+GVIP8QSgJbD9B2yND3v2VJxQ94UeXgBxYBOf3CYo6o53VWeeKGNj?=
 =?us-ascii?Q?j0Y9K5HPA2pCexTp0D/wbHSwmv7ZyXtC0Ap7eazLkevAxgts6oRmes/TFSko?=
 =?us-ascii?Q?2BfsvkNiKbwYBNZnaSIY3YxeDbSlhVsLwZX3PE9aURfpMnafsdN96SN/2m39?=
 =?us-ascii?Q?XAXyghsnf4zjoP4XPTsmLpXg3Cb3EvrJDnCFuVrQEYW+9Yw9k1aKCiUXh/NW?=
 =?us-ascii?Q?tgwgrotXQw2Bs/hhbDaBE4MN4xLkrCaWR/tF9iQiMuoYjKM83OZt0Z1dSXPR?=
 =?us-ascii?Q?2kF5l7ZG//X6SOmW0Ha0YYFlLas6Ebm6YA9HrQ5v4J2mAvyMalaxE2S041af?=
 =?us-ascii?Q?MTzVUqNA6aoB+d3lkstadCrBiARiIN7WvjkEuTNeRuYC8xJn2LU/ktePDLmV?=
 =?us-ascii?Q?/cbnvnX4DjtmncVq5EOSR+x9YMOX/QLRHcGYpxWqLy6swCzlZ4zngtkinRA+?=
 =?us-ascii?Q?TPPpqJmv/EWFJu4S8tgXz/FqYVAquUsJiZiwS0H5tznN/ao6k5sR3fzvtgdp?=
 =?us-ascii?Q?/ZmpWix2DYaskyKdgVs82k7oubG9UXfmnmqk8bHY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2b23ea-e002-43a6-54d9-08db5786cdfa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 10:01:09.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDbaSjqmKYT/z5E+6fdkyUUMP6OnEoSghdce4bWd7jSHkHzQClgUbOLLIdcly5C7WAxz+5eZa7vIKrExWxcChQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9079
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
data are abnormal.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ov5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 1536649b9e90..b1a4565fdc0f 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -634,7 +634,7 @@ static const struct reg_value ov5640_setting_low_res[] = {
 	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
 	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
 	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
-	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
+	{0x4407, 0x04, 0, 0}, {0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
 };
 
 static const struct reg_value ov5640_setting_720P_1280_720[] = {
-- 
2.37.1

