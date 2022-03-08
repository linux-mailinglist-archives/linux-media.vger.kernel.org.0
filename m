Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3FB4D2083
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 19:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349687AbiCHSuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 13:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349636AbiCHSuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 13:50:12 -0500
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50046.outbound.protection.outlook.com [40.107.5.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B85E532DB;
        Tue,  8 Mar 2022 10:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nf80L+dKgvbxXMnoHYFMP+UQ8vw3FvKfUPuwsnPLxVp6gwyKJ8Ds9qr3X4i/XCjN4p3f5n1DLxHAhB0fWyAB9jMwC0IFYKqp9DvjK2FK/KEoAoz4iadf6GRlc4hNsORqAEfX2q24i3gjM5UCOEF5d2zd5xyRjQYVVFWLxmxXFFbZUIX2PT2mTfFSYtHYXytbHbhZKujrFkJCf66OvkdHizfrCUHSz24qDUMHqjJln9U59CYu6KWgbJzysx2QVa9TTLuiYJbJ0QiW0dAymthzI4mVdCUBHQ4U1BpNDYCfTLlbiOLDMMlvRkJ5Ljrk7jzlRohk9SALloNqZ7KblWJwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qea06N2Ldn1/lRTLezuHfjQD34oHYInBj0aEHSeR808=;
 b=IPUo3sdT9dXy0JO3bj/wno1orLhHDuxdwy0fa3aIwjIb66qmXnoneOIJdvpwS+aW/XTd+h7IUZOLwnf59zd0nDiHGO1j44q7lkGgZbJq37aHofcT/H47q2I60zcsLBX4ablBZFjrM7xD3SA6ErK+3ZChwJpOGvlbi9YCMAjKFxSy+Alpx5jxyhKzpBfo/4c0a3jDbo4QYPpeutas1pN6jEWnLD41+vll0gOPTsI56mdZa26W2O9a4sRcppS6ywHQmKc6ShBLnDMh/WsT6W63bxt9grkG07JROZvTBma4SR8eMWp5ZHAEFy9QC3U37RtMxzhp1TEcYOWxvHwBZq7Z5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qea06N2Ldn1/lRTLezuHfjQD34oHYInBj0aEHSeR808=;
 b=LCmOqtQKqWjn+pztbo90GjGyBVElK3nv8MvNiouW5UtNmhmAkrP5DRhR48FGwaXD/PYZGi6bULLkuwwlxfads4gYEouqLRSKYP3nf4YeHpcklroHCziGFTkxzndYULFoRayOOXPtO+z/jmDafB2owJC5QtBRCHqnEnXqDUB3uxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM6PR04MB4311.eurprd04.prod.outlook.com (2603:10a6:209:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 18:49:05 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 18:49:05 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 6/9] media: uapi: Add a control for DW100 driver
Date:   Tue,  8 Mar 2022 19:48:26 +0100
Message-Id: <20220308184829.38242-7-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
References: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::23) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65b6b133-9762-4c1b-a468-08da013451fb
X-MS-TrafficTypeDiagnostic: AM6PR04MB4311:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4311639DFABAAE6516407E62BA099@AM6PR04MB4311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2FwnADSwZlU15OS3lBfaxTSVwUIWsc0J6G03l1jITYdzTkSR264tBr/mXq42GraNM/FLs5Mw5cnouWzM154oG6qhXhCbetVEzr7X8KPmz9sg44SuLYgyMxdKilkizsktg/MaXeiz+pfDMwxJyGa0Hu1Ew7vgMVlgqe5TXOr2Fsi9/CPHVeZwSkuTrL0sAWCVbrgijhwUxRbMJrxBvc5mrbzUUHDiBxLjgdbT0UHHj91lj3OtbfJKxrerBSMktW5A9QwXTC+MGSibWf0cdBQd2STH6VC5rjm5na3j7PCiSldHEItpQfB1ZiBho6wdm5FHYsEVRmrrW6RN1u12K2u/zv5iK0izKyVwy+IWq8IC3D5CcCVnjx6Wu1WJLtbM5+4xthVC9NJPsoZU+geNUueGTTnJ2aWVcPbNRYqsi8F6hC1WyGwH+ZGHtAAArK6CzBeMHnXSf6YmH+htrIN+FfVxXGjaYpOOSfUgZBdIgWOEz9OG9nhCBZUWWMzEkSw6Ce6+2PJbsEEezpoqxfJlC2X3+xvRGzAZ5I+oHvkRDioj5hrOxvRlHhRYY3cJg0XnvtT0fQeAmhwINOWTFBiLnIoCP38uU7ZpYSbw1Xu9/23yR/RaNvJOZNWzQn5VRgN65uxsbHurrq71vMKi1VROJQvjRXHCDR+aS+/raXxm/GOtBBkfb9Q4+8znw12q81LTm8cpIzoYbuI4LNXdom58PmgDJlsxYu+SOG/1saExJ8tjVSM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66476007)(4326008)(186003)(1076003)(83380400001)(6486002)(86362001)(5660300002)(8676002)(66556008)(38100700002)(2906002)(44832011)(498600001)(8936002)(6512007)(52116002)(6666004)(6506007)(966005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I8nCxELcfNCm81fZrDyyvmbJDL979hv0rusW7a+hPtRtKzL2OpBzH8QRdz/1?=
 =?us-ascii?Q?gkgr5LnawZikHPfmS0XW/pWNZ8XsOIofgmXj3mm16OlyASMHtesdU51T02U8?=
 =?us-ascii?Q?Wu6EBKogg05vchRtC6aa0PjGHjr6UQ9zio6P5l4ayH5bJ9nKwuZzeAlaB3XK?=
 =?us-ascii?Q?rfiu3Yx7731CiVUb1vlrWTjTbC4f5LbR0SKHxm1JGf/FhZfkw/EkCKYYYpyD?=
 =?us-ascii?Q?MDWXvude32mKFL9yeQijv8buq6nDx+8vzDRUNTjQFTnArp23I3NK+RBQYinr?=
 =?us-ascii?Q?J14OALrdqYqrRf0O4YduPYS/6ZTKwr4QJa0CJFA4ISd+kSEgjmsvECq9Vmhx?=
 =?us-ascii?Q?FC3sgIWPcoThnLhyYyw9oCoALhlwX7W0FnPyqhYROsqFj0WdS2HkZJ59Txs2?=
 =?us-ascii?Q?ZnqZ/nd70c2NPPakFZB/mMY8IxEcTSofeL/W10ZBp5dqBNkigLP4IwfMUIfE?=
 =?us-ascii?Q?54j52jsRNQVVIesnLh3f3Y3vmwpzMkjUTEaYiGu1GMMW3uSDPxtw9jfa/rcE?=
 =?us-ascii?Q?twJDNk9ko2TOmnd/beBQGVIhBm7EdZXlQzUx7otI2UBkYoWMK8e2sKao3SW9?=
 =?us-ascii?Q?JtZSg11Nsa0LhPwz41SjwkFxa8hNAMafU5OeBKfUwcwRM7Mik4gPUIhCTm5M?=
 =?us-ascii?Q?388hf2ca9gG/vEsZ8EW5CuwCzLkHLz8hn30XkcT9PFj0uDvYxgZk1ohRKqts?=
 =?us-ascii?Q?T2QZ31j+qzc8TfSSyImzJxj9G1FGcHCSgQ3oUjly/s18RLFmaejWCRIKOCqr?=
 =?us-ascii?Q?NuoZxroCUD4rLX+fkoJ2a7gFqd23M4QGJ30ZiaBK0zMdpF+oW37F/FwMq8al?=
 =?us-ascii?Q?kzvrelKTSXB9qD4EKtEzoDzKotDWWkMFc4LCScUONfUuCtEk77oyGUlryVQv?=
 =?us-ascii?Q?ibC3Ee7J2c5d9mnBg1vr3Tvw2hlEfM9jTSsmZ9aPVXavT646icIy6T6AGPru?=
 =?us-ascii?Q?N8yI7yhAI6Wq2q9xB0gwjrbcZ1IjitiiuxK8k+MYj4RXld8DihxE+ugphfCB?=
 =?us-ascii?Q?+6sQ70UbfxOcd1/vjkhJfn8XhuBh8lgsvDMnhAyzb7lFM161chNt2L4C9xLq?=
 =?us-ascii?Q?nxw7R85l/8X60zoWKrH4HOxSY+sgLl2+0Zy+ZZmySzf/fgNowRYDYE8yT0SR?=
 =?us-ascii?Q?qKMUFBRlthtiIWrHxTMjkrEMsWFAbBjmWUE9bH8bOLXG22kJRPxhLuv5w+bE?=
 =?us-ascii?Q?pPf8UTWYiXNHunfqFhOXn2wUFsuIPC3zD60A/LK4wg3eAMdkoFtgabDW4iDh?=
 =?us-ascii?Q?5aJaUEtulSVStDsB2Bp/IwXjJgAlLRcdtW67uv08f6Ie9qlzATQjH14PZxBi?=
 =?us-ascii?Q?3Q7/5IELRuqMAA/B6BCm6xTetyUEUxystwzONBgAy0A351x1YBSBdbAkGAcl?=
 =?us-ascii?Q?H8Q/y26jjuy2higS6PqTr+OuI/qk7/K9EXFBDm3bIjsb0S8tELbmzNMjJMsU?=
 =?us-ascii?Q?Y11zmD/etnAvN5OqL/yBRe97tK/OgrllYn04syxc3TOBnIW9JdRqRV41SRft?=
 =?us-ascii?Q?PerkSkaSRYTvORdkHE4wB2GXAHJU2LL32BsLFjm81rEo/NpT8lz0MDReCgNZ?=
 =?us-ascii?Q?k+yaIM02jGInWGlktaU4YTGDa4VOccoJDoxkvFyUqufP8hdXXvZTy/pjzzKp?=
 =?us-ascii?Q?4XtiqRpp+m9nHEbe1iy4dzM6jpygkmhI1en04sdZ+oQuCS/ZWk/AHmHKwkop?=
 =?us-ascii?Q?T3ZxAZVF75+Blo8x0qIx9wA0uF8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b6b133-9762-4c1b-a468-08da013451fb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 18:49:05.3126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6scR40vzZOHDpytBc+498or7/nx4KAB6xMq410o9vFbvvarUeJT0Mv9nJtf/3djiJh00Llvg/aRDUTozgiYHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4311
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The DW100 driver gets the dewarping mapping as a binary blob from the
userspace application through a custom control.
The blob format is hardware specific so create a dedicated control for
this purpose.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 Documentation/userspace-api/media/drivers/dw100.rst |  7 +++++++
 include/uapi/linux/dw100.h                          | 11 +++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 include/uapi/linux/dw100.h

diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
index 20aeae63a94f..3abad05849ad 100644
--- a/Documentation/userspace-api/media/drivers/dw100.rst
+++ b/Documentation/userspace-api/media/drivers/dw100.rst
@@ -20,4 +20,11 @@ match the expected size inherited from the destination image resolution.
 More details on the DW100 hardware operations can be found in
 *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
 
+The Vivante DW100 m2m driver implements the following driver-specific control:
+
+``V4L2_CID_DW100_MAPPING (integer)``
+    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
+    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
+    dynamic array.
+
 .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC
diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
new file mode 100644
index 000000000000..0ef926c61cf0
--- /dev/null
+++ b/include/uapi/linux/dw100.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/* Copyright 2022 NXP */
+
+#ifndef __UAPI_DW100_H__
+#define __UAPI_DW100_H__
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_DW100_MAPPING		(V4L2_CID_USER_DW100_BASE + 1)
+
+#endif
-- 
2.35.1

