Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B804A728F5B
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 07:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237066AbjFIFko (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 01:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjFIFkk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 01:40:40 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2077.outbound.protection.outlook.com [40.107.8.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1CE2D7C
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 22:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOkpVAbaFxJyo7etFJDUOLBWBXTpG+H044haTZiJTK/gPl0TxpEu0y0egKoz5BqpC1+4WkTyTO98RYyslZ5Fswtx8/y9Zfw2njb6Yg2v53oCqZmuLfJlgXm78xgLTsb9ee0i5mHhJdAb6Kz2jxgdgKMAOuUfjQC9qc3e4R3/98BlEpWtCsM6Y79QxAEXiimibThKc8p3RFaQZRp6TuhJjLSn2YGqUEDfsVSMyYIAK5mKIi9+rh/YnZIzcBM296PHD6JmDPFKCaVPlpc+juV8mkPWGXmg6SDSEc/bcex0qR7K1inBRQjlmyPkiGIusAW0qqWeDW70w95KEUBxEou14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eZKymzF+Mmk96FM/uniNFWiVpD6qX4GA+c+hlSLr8A=;
 b=Hsq+wdbrpsqmvW5cGpkNY/Gj5LF9K//h7OZTTVKQoQQ4lg+paIe1wA41zeojltgVxRseu6P6+EcXJQXCwEein8KGcX3fMlg36/MzagfOq+FUHl5dZ6xVdPPlBC0Yz8+RP4NQEhhqzIlCwPfezIxgpypjtCrwnlUlBYFjTXrPVa1kQhBoQDuX9WSS6L4ZPQO+zn0KHUi6hF4gRJfoJ2dzjMYhAP2gQ5LSn32b2Stv4AgJTXVay4XhNNHrqIZjSGyVRwQe+PxEHLBwloV+HeS2usqtflMuOalWnHvgB3q3Y7cC99cQwlrzkZ9kGh+cuH5jhJ9A1nRZg2oI9AOePopKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eZKymzF+Mmk96FM/uniNFWiVpD6qX4GA+c+hlSLr8A=;
 b=NVGzedrfTFpS8J6KvQgMcKKNbe4X7llfxEKuyBhRLPWcyr4dBotjuAYy9PS2mA+Eqyc1x8FOtLecU2DlZYPqBuxcj4cuTbzet/huL+uawQuA57m5qJcVuPSbFFdhdVmn1bvd2c2JpjEXoSZ3Uf3jhnIzIuHk6e1hf1EwI4+gjtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7770.eurprd04.prod.outlook.com (2603:10a6:10:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Fri, 9 Jun
 2023 05:40:35 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 05:40:35 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Cc:     mchehab@kernel.org, slongerbeam@gmail.com,
        laurent.pinchart@ideasonboard.com, jacopo@jmondi.org
Subject: [PATCH v2] media: ov5640: fix low resolution image abnormal issue
Date:   Fri,  9 Jun 2023 13:45:25 +0800
Message-Id: <20230609054525.4067113-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0195.apcprd06.prod.outlook.com (2603:1096:4:1::27)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBBPR04MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: d1969a13-f4ed-40fd-352c-08db68ac0c06
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hKYDFAQF453OfeKaip69b+JpGzLUiLpRj5aDDl4W3KPnqcynBSy+/UcSx03D+uDlBHa6JF72BdtTKzANW170hrM7GmnlPg+bBNi1jTptbXKY8hT6sNsvskl3kn7WzQgL/oXmeBqRbQ9qyctOwUWkzRm0Xl5EKJQi+i4OyP1wW8yoiLRvpLBSkkMhZX0bR9V2+Hl91IOaIT+w/ZNEoX0eJUBux080NQPLurvMU8W8NtHPeJ15fm3F3vSmTig3Bs425Ahg69xuL2ykKR1rdwWq67uPSxgIrrSwxvZ1dZlXEJjqGX8CuYLbwbRbamyA822fln8yWKs9/Cuz+vfghJyUtUEHpp0Bwgv8TXa8SkuoqUFSYoV3cDdWit6+cko+j2rXhqnWK47FaQghtG7TuJiHpCrSqoZPs0yKyrO3dLUEtADeWKon3tKcchsOoSN9EpBUMFqBBmenKNcxvDTXgWH7p1tDbDiwZLFmszV9rdmrV6mXlWbbByCl1/D+FMy1s1oFAQO8iJ7KZfVozXJELnlF/CqYkNHVqF5CoCuNtHZ9+6IHeZJg2to/6T3Jfn2ufmndP1aMZILfCskgVegNr/2Lb1DFUvsLiIliKh8qoy1/hy9/kmP3Y2cZrujizQl/WaX5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199021)(2906002)(86362001)(5660300002)(6666004)(83380400001)(52116002)(6486002)(186003)(26005)(6512007)(1076003)(6506007)(9686003)(478600001)(66946007)(316002)(38350700002)(41300700001)(4326008)(2616005)(38100700002)(66556008)(66476007)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mHZ/1Mr1mOmQ4/F1LK7jqOqd3D3Reb+HAHMeE5nf4DJBZ0tnEI7UTOwfml/b?=
 =?us-ascii?Q?52fph9eknEmBs6hT+dxZ6Z4lwnn2+KmcuMUKgTAARIspwYipHJk4WhtcxqZ8?=
 =?us-ascii?Q?ttozGqW4T3d5qJLCCCj8ROBIXU6ptejejJgiFDULVSx2MFs4+6dBa16BBCwd?=
 =?us-ascii?Q?Xp+b4LTTpKkSEaTZePZGcZUlP6axIesKRXv0G8ic+oCNFVup/fmg23sXIe54?=
 =?us-ascii?Q?oVSSblAa31RLKxcvpa38S3UnTzfZe5/HWLcgqEZDEEkiSv107wBx7lY3i78+?=
 =?us-ascii?Q?9s3urG9Fco6IfP/5UdKbOy0OhTtBE7/AdpQajI1oeGPSKFHf6rp7acOz8BTS?=
 =?us-ascii?Q?5rNj/Vu9vctb1886K4yU4LBetpIo12KK7qbjFVjijiazJVJ75kiS9tUjbyFp?=
 =?us-ascii?Q?xkz+8BNQF+rCOgZKogk2tKVHVEbyVY9PzE2JrpfpUTVHb63wyUBAksi+XDtI?=
 =?us-ascii?Q?lWXO13Y9A+imWny9G+SqaX6CpoinmCeHfh8vsKkZpcAsfrQ9Vv2sit/Pmiea?=
 =?us-ascii?Q?FHldhh2qE1kARgUWyOsESRmt+DWUFz4d88kE7xcf3cQIDysV61l2QfjlnZQo?=
 =?us-ascii?Q?UgZ1N9aji+prqab8i1zkwj4KPY07gNdKQ5sWnUxytYTtqP/vL7Gjaf+gB5FC?=
 =?us-ascii?Q?C7XmQjaebroqmL5k/7XjzteeD9DItWYoOn+ujeW/qTQk/o2xKpVBuOic6XWV?=
 =?us-ascii?Q?ft+7DQ84dmKzg3F5qsPtD01pXH6TY+og6u+eZ8qd9ksnCyPWE04fiuZay18S?=
 =?us-ascii?Q?rQh/E/E4LYQrhEi7qenL3SbQe6638g7IcjunpumgL52W9c852C7opw3lS7O7?=
 =?us-ascii?Q?2EY82DJDHWvFkK3C9XIbnthmhyFeMONAJNN3G5HJLCuRhnti7iaQXD5TQq7G?=
 =?us-ascii?Q?+FIgz+4THtuTf9AGMGQ+mD4Wq+3YFmfsvXnTNcu85Z+mbJBp4dys0G2bXFt1?=
 =?us-ascii?Q?Xophxdb107qOzt8VpjhM5nGlxqetsfUTRGb77iwAbhZ6hPHuK9HiQSaf4d6a?=
 =?us-ascii?Q?HbuUHJ8RhhibzxbRjGJTePExtcuarbltBVOqjYz4KjUIB6a3ZXWhwY0Og4aI?=
 =?us-ascii?Q?98M4cAhq8kGX5XaVL4gqjc4I4U2M3HV2fN0+KFsExav9aY5UKhJs7R/oK9g8?=
 =?us-ascii?Q?FNPVz9Lk9HSy7gZOzV81+B3HDw9VI6lrk8clHQesVG7ErXWBY7LHdX43SEXL?=
 =?us-ascii?Q?YBH6bG5u/H1a+5iiCPJe+Foa9sC63Qn2zYvYjXMCS63nh02n40k3wAwjDAme?=
 =?us-ascii?Q?Z6Sfxup29wfLezQI677qTsWapbNV4skgGR8gquHkMHBxjB5Psvv0v0h+S22v?=
 =?us-ascii?Q?Gyvrvc/tnCAd47MDRhCJBO96/xdvaRGlDuarXbiyBQkth+jSle2dlivVV0JX?=
 =?us-ascii?Q?ulZSSAl/GeYc8r2MY9j9JV75M5MBuyDc6luXVgXLyIUGdpDLYpD6jIUG+Kcl?=
 =?us-ascii?Q?vVCysuv4kMBZuBIxIg6DMSP0iKdBSTRKEzMpkIttsO6rfbWfeAPVVnfxmRbu?=
 =?us-ascii?Q?kLtc+TEUTpmoQRRd4jwi6WrP9Gk8L8RPBJV/kr1Es0+rk3p+RsvfGOiH1mbY?=
 =?us-ascii?Q?XT1iqT41jZF8c3saimxA/bYWF0aUIoQvgtcajb3H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1969a13-f4ed-40fd-352c-08db68ac0c06
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 05:40:35.1140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nsk0zvqPTzFoYybq8H+1XvLpiHjqoTHicE9JVS6aL3ztP2epXMX/CqjO4ANXbbYQIhEgrvDR2adv8RR7WrokdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7770
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

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
v1->v2:
  1) Move 0x4407, 0x460b, 0x460c from ov5640_init_setting[] table to
     ov5640_setting_low_res[] table.
  2) Add mode switching test from 2592x1944 to other resolutions, the
     result is okay.
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

