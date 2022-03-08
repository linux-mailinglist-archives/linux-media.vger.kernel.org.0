Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED15D4D2254
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 21:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350148AbiCHUMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 15:12:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348277AbiCHUMJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 15:12:09 -0500
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00087.outbound.protection.outlook.com [40.107.0.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415373BFAE;
        Tue,  8 Mar 2022 12:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C14tv8uLbDChYHmVPNQpbrA8evo6Cn20fPsRj7Db77sM0Iw3nNtRwsi+1bUlhNlgygZd3ua7ULUWhyqhBSto+02Kc+Fq95iiaqcibO1rrn+RtpGBkWGscPoOpPygRT6LALiJZd31CMjkUwCnESXCsjBxb8u8MZ26i9Q+bMUhacXEWHQvFlyZqNbiO2eTaPE8+pK7qkONj+LSxrnXAq7hpk7EFhqeI/janU/4qghMekSiBtGBX3t154qFUhWBvgVf2DKQ/tBGTjPqXCSiRBbHhfgjC1945DxLUdrJCty+yB94br8gqYuo7ZhlKfoKDmcDLqL8nLrLwg/97KQnPAhBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEWICxvkMXk9UZaXFhcZPxKpqObekiOZnrQ5j8j03ac=;
 b=iRGvVyvr9A5yXx3HyBBJ9UE/vol6gHIT0FTVFpxKXgQ2LVrEJSIG2Rar9+TOvBbV7+POH1ABoE+AYbp5n/PT9e19U5BpHYoJbDkz9VV9hkBnKxBn+zqOAxI3SfB1mvv9qleUNQPEJcdBKixVa+kc13duoNrWOdn9ct32XVGzQoJuAi08kqe6g41xhrrEOxHCQgdNx3JqPeKThvIYJioKAQNDhNrxJwSlktBgqp0ruzVWgHnAHKkdbcy4sE7m5iXvztqLT6wspwLfi3fIR/2b+I96Ye8zD9q9KvMbVrdMkbLoma6KD/uoIZA+/7oQGbgvWnqRRg1gDm7jjosiasrHMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEWICxvkMXk9UZaXFhcZPxKpqObekiOZnrQ5j8j03ac=;
 b=XHWbFzvZwI+QSUGOhFKMDVk5Af2JXhJQYhOlx73Hf0yNl93Iy+w4LYARyIGIDLFv8AiwFxs8ywZWl4pOws7wWXoiUT9yngZEoCt0hxCuZu3swXBJWJZBiK2kr+FNmtLiq/0pc8lzjs0QolOs0ZhyJsDymg9kE4P3BJ+21nrBEXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4588.eurprd04.prod.outlook.com (2603:10a6:5:35::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 20:11:06 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 20:11:06 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 4/9] media: Documentation: dw100: Add user documentation for the DW100 driver
Date:   Tue,  8 Mar 2022 21:10:33 +0100
Message-Id: <20220308201038.48386-5-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
References: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9038409a-db1f-4df1-e010-08da013fc6c8
X-MS-TrafficTypeDiagnostic: DB7PR04MB4588:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4588F2466E2C824F5AF96B8DBA099@DB7PR04MB4588.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4T64aLw4KHiC3Sao5IBXjDit7ec5mEHy9uVTO16gaxR7VbbP6mo7+lZ5mYOqOzAEchvlx37gGID+QnD6Qok5SdrGgKrrMjZzTIa5JlIl/d1NagzSPZZlPUwhYf13BJtCwkPXY8xJpewWZwCkL5fnD808dkeoYxilAFj6yyN7K9BGZUWi+0Z/ZC6TrSV/tjOEccG0opsOaW7HOBynncl10/ynetK5q3i9TFERbrky6rvbGrV4OrjAH1VsLVbytxyWp+KVxQELcVOTgs6UPvFcMwZSKYS3ai1fZBt0uds8ZmUX20Avc0B70sMVUg43WBxMrYiYz+8uI0lwOP0fekMQoRDaDdgp62I9Kokh2jKoYDsHfmuWjzSo9O45hYQEW9oR5ypg6Xj35CrQYNxOn9C9BURN1OQiWh4igUqhDEFwN/KQQaBcX3e/0kU49SDMRouXCEhPiPsSrq/gLUVpt4Mp+mwVIeEHthJ+dOR4mepsUu/y7fjs+w8hlU3JYkoNDefMYpsQ2pjjPEVIKI7tpLfR0vKwkMJfDiwAF3Y1veiFesDvOilVhduqlb6XzkyRRAzW0ytWZkS8S1htA9GU2NPz9ya8ENGCT0Q/nzui2oKzNIV6tzCtp2mMcZX+jQ0kEboNniUdUwx2AfkglNIy6tELe+xp2DkqgrXsXkOhwZ74K5JuzlrZRBHk6t54zVXSF4QYkWhnoDYYCbiUKD77SuH6qJqXAr4ujljQTTx7Tc+pWaQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(52116002)(6666004)(4326008)(2906002)(6512007)(5660300002)(44832011)(8936002)(1076003)(186003)(2616005)(86362001)(83380400001)(38100700002)(966005)(6486002)(8676002)(66946007)(498600001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n1g+K2zOIXncVmVqCDHrf085zkTrWDmmJ+iyqGFoWOaVKpCj8aaXdvNmwcJc?=
 =?us-ascii?Q?yzoA/1QSJ6tWNVOLzwNWpavxsoy+QuA7Ttrc+uY8PbySQAe2YMbzwHY0Q9Lq?=
 =?us-ascii?Q?3NlmEWGeyVCTbL3AFSgWkOPKZ/NGP4MmaSIDfhlOEsaFKC80EocrnOpUtjWa?=
 =?us-ascii?Q?daoKLphmWTxe79EUtf9Ni744qQftVAZ4TsoT4Rm2o6B1V4NMCrl0SsxRm6Lb?=
 =?us-ascii?Q?cNOoap51jbJq1evqioqR/wf8fKQ/vwgVWkAhz0NdTdNpZ0ojDK31yqT2B3IC?=
 =?us-ascii?Q?9nbrR4nG7DQmWTlEeKQXhsvh7JZF2T5SMPni2PVkozXMeL48jQ9OtsxMeOx+?=
 =?us-ascii?Q?SMpS9GQhxQbZUVkNamy2wenBQqfXnROR0F8lQDMYhOE6ogKzKOGZAXVJl1vd?=
 =?us-ascii?Q?rDosBTEd9DGPwG86oBBs7x5yYYYNW8qlT/dyGfQGv01cmHPqQSQ60/lZwfYB?=
 =?us-ascii?Q?opKk3II/+M/tUjVLqnFcrrv4dQOGehSBYUvWyMjajwbSbYZHabd284EE3+Rf?=
 =?us-ascii?Q?UenjKRsHxRspr9iN0JDEWlxdxvlQosCdLO6CvpgNyvrjfQNPT7X/sHBQ4ixX?=
 =?us-ascii?Q?uykKREIAIybDG2lTYBcakpDMSUo3WRqjCuChynSwNrrdFRr4rcYo5IyGQ4ty?=
 =?us-ascii?Q?NNs+oYUy4hurMhPU4XLT84rHU9Vrpu3e2eK0RSF6lor9tY+ncP+mkU69dEMj?=
 =?us-ascii?Q?NJfqdjkgaAgjpDVr975jPw6IdpXzCafamIAm350SXIV+vaUcb/YxE5a+m8w7?=
 =?us-ascii?Q?dvczjLHzE6k0yKj4n9UIlX06mIokCL5412hxtGUnSOuc9viyGKAPxahAyGAM?=
 =?us-ascii?Q?08t+6NdVctEP08PgetfklUWzgrgd0Z93iKVRJ7V+e5vv/1J6tggldCmHOUeo?=
 =?us-ascii?Q?0ZazlszU//QIm2CJD0AS69dEH89EYdLkWNWRVdW4O2Az1JTzUUpvLS5l1w1f?=
 =?us-ascii?Q?stY2/TeJF86lr97ypDCFMRf6umRXGT/pXWyATVlScRyKuEzmmsHvNeUkSlL6?=
 =?us-ascii?Q?XA90mQppuHdnEp698O9ebuJ3fJFY1XWLFhy7x4YOqzejMwvxKeLykfkYSfSz?=
 =?us-ascii?Q?yqet+W37DeU86G28xicFOdSGhImIHuAEK1ZavhJQ1PqrsRlb+BJKrucM7D1I?=
 =?us-ascii?Q?xhGq5sUCt0nDRVXA6RCSecC9NSsV5xkMhb2N0+ez+MWq6XIy2hH/GL9CrYpC?=
 =?us-ascii?Q?0MNQlznOQj9uDk18slnrcPyOWjxa7H00/+QAgTQvfQgHhRvfYra+O1iYshHX?=
 =?us-ascii?Q?q/YPe0Tu+9hZqRoWSaZbX0qfXQ3z+ZiTUGH6dXiyLehl81AicJ8eR6Wl3I+Z?=
 =?us-ascii?Q?wgAaBdHatIImT3mKVHJdznTG++qTZTFIacVkHur73sYT1hm2YdTsfEW1yw6a?=
 =?us-ascii?Q?HdIGjGMmqD9YkltwQvBtMDMdZStP2BHhUpEnpIJAdUq0ztIccnC10CmeEMQX?=
 =?us-ascii?Q?n8UDIiB6oCbps7ptW5cu3At6balxhuDTCIrFyR+yk1AfMgY1RMMM5M9oRL75?=
 =?us-ascii?Q?7tqsCiE+bV+5KOwiyer6kbIWiFTptytEOHg5hUCyrXW5MOIMojZgr6cschXx?=
 =?us-ascii?Q?yS1S+tZiTopfXExVDwbTl+TP2N78lzVDx5OOzK8j9kKBFwpM296lOVkeQs49?=
 =?us-ascii?Q?mIzFY3IaVgoPN+HcMPNDX/1Ods84lCvFig6t31mrXbe52Sf4qMrkHXn4vdzn?=
 =?us-ascii?Q?9xODm27RuDYJuDCPpU1vB8lAQkE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9038409a-db1f-4df1-e010-08da013fc6c8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 20:11:05.7373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLcMOnROWOSQo4K6EGDWAULDIV3I9pTMEzF540UgMgiaM7cKnHDype2fopdqy154vj8ub5kmZIRGTlSBbwUpcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4588
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add user documentation for the DW100 driver.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 .../userspace-api/media/drivers/dw100.rst     | 23 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst     |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst

diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
new file mode 100644
index 000000000000..4cd55c75628e
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/dw100.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+DW100 dewarp driver
+===========================
+
+The Vivante DW100 Dewarp Processor IP core found on i.MX8MP SoC applies a
+programmable geometrical transformation on input image to correct distorsion
+introduced by lenses.
+
+The transformation function is exposed by the hardware as a grid map with 16x16
+pixel macroblocks indexed using X, Y vertex coordinates. Each x, y coordinate
+register uses 16 bits to record the coordinate address in UQ12.4 fixed point
+format.
+
+The dewarping map can be set from application through a dedicated v4l2 control.
+If not set or invalid, the driver computes an identity map prior to start the
+processing engine. The map is evaluated as invalid if the array size does not
+match the expected size inherited from the destination image resolution.
+
+More details on the DW100 hardware operations can be found in
+*chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
+
+.. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 12e3c512d718..8826777321b0 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -33,6 +33,7 @@ For more details see the file COPYING in the source distribution of Linux.
 
 	ccs
 	cx2341x-uapi
+	dw100
         hantro
 	imx-uapi
 	max2175
-- 
2.35.1

