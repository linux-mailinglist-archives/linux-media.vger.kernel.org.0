Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C31402662
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 11:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243094AbhIGJvU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 05:51:20 -0400
Received: from mail-eopbgr30072.outbound.protection.outlook.com ([40.107.3.72]:27145
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243133AbhIGJvP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Sep 2021 05:51:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THpW8fL8t2d1yE1uSdkcr3892QLDQEQKSWE25rd7zTHc9UvsydxfF3Lpy1lj3KEU/GOPNkErRnSwznyPvv7Y6if9ZxHukOXVuxWTD7P0PdBK6yN5t0xF48y1w1L1r51fVGhAeEaNukKIFhGubo03Q3YB0XHRFO912FptCGog8iQMYi1PHrXRjJvpwr186IZF/4vkCWtsBhU3Q8GDG5GLm8GY1V8JJKO7tLyMK3tyEAF863Du4knqP/gKDPVrEcleghMSA8P7VlH2NwBLGOITBghUzLmYEHfUp6A7Q5hpQJbu66wJcXCp0i8J1Bskk7zDv1QpkKOExke2ciaDHfEu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=d052597AGCCELEQYF2+mKPitdK/8vCDlxX5ASIY6e5w=;
 b=OYCxyacH8Rm+EuAU91ukSdUjER6KiW++4DHboAlKXm9irWRomjjpqJD5SKOExK5a0nQp4mOwYu56xWU3e8u6GCExGF31buocVW7Z9jX2Pq9VX8BkmRvazdGVNlasZRw7jfsv2nay3O1qqvMaYId39PBGbih0db9qUpmYxjrKK0Hi6wkclPu3PCdAo1I3f0LHQt++bOuQSRWTW1PtdjlxrNvFG2W8EhgxuzvmFX9istxF4a9xvSzr0PEOEd8LDBpe4RRXuTi5DC6tWraCw2g2bDEdSSmStm8zUD8XdkSDrX6l7bR6kUiET9A1xSU/KZUtFoo/Bws9kZlNFiDFFNZFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d052597AGCCELEQYF2+mKPitdK/8vCDlxX5ASIY6e5w=;
 b=XzddmTCPZ3aGT9R4M4GmZJcZAkNpq8U5I2JoE/B9ImODdEV6ilqyu2y5ORDxjQbmNNejLMbzEeceofli5Szg1W8CuMKYO0wIVWxJAdqv+FDA60hom7gvJXFi6iDqCuiXOFyo4wWjmsmMYsuYQrYGEwJ+sbMyC9IaHa/6q4JvyYU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB7767.eurprd04.prod.outlook.com (2603:10a6:20b:288::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 09:50:05 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 09:50:05 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 04/15] media:Add v4l2 event codec_error and skip
Date:   Tue,  7 Sep 2021 17:49:11 +0800
Message-Id: <647f84c1e7c2a48d6492d38fa4f06586235500b8.1631002447.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631002447.git.ming.qian@nxp.com>
References: <cover.1631002447.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0097.apcprd02.prod.outlook.com
 (2603:1096:4:92::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR02CA0097.apcprd02.prod.outlook.com (2603:1096:4:92::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 09:50:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00a46d25-a0f8-4c10-29b0-08d971e4de0b
X-MS-TrafficTypeDiagnostic: AS8PR04MB7767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7767E15697EF9D73047532F8E7D39@AS8PR04MB7767.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8vvaE/PkzOCP58/nDhvxGi3KHlaeRzyv1rV94HOD3JYO9z3Pzr+cgWgnd2hL08sKD1HSxmdiYHbx9sGfUFtWwl/6w4lRvhdLorCLQFGWH/Cxu4FBVKDbs2ZJGuQhq9d9VANfO6jlOhk+Q08f5WYT9ID0bqCeh6i1X44zmheO/xxxKkpDxycGhYNb7sBSMSGuvkNZsposj3M8/y06jiHTRP9HogsapSCxNj6mUo4mG/xTFWH/dalZHglVOnNEU5HY2p2KGL9XRpcLWH+XdHhO+56S+VUY+YBzJebr4igPUWHrxUu5l8Kaemf9CkZ1ScS4iKN9NCeMuSn/54Q+JmN3khrrNdyatyqCcxPunLmEAmj5KDV3XdPQu0lVfwGGeX/anWbD7n+3HN2KaKi5umRYIGVnmOySFS2v3mTrfyjg31PLegLGDKFYEbY/k9Y6nv3xJbnSrTsMfR1EnKJY2/b/gGGYYrl1No5C329h6T8Djrrupo7mcmp56uToWZqh1FcZn7zKeNUqExzTLWchEtfCDB/DwSsfd8p24UhwQQxyE7YCTFZUX/ehmbAAkD43abpBZet7Vgt3dsXKTLIR0LyioghuNz1FyHn8UnBG0GvpMMEOb7O96uwMwUAw4rlxQWSQF71i2VCrbl8dM/jCT6eYGtIOkkOYNo2NhpX7Svyt9RdtlD9pGXkgQwl5m1infiy9omCGyzVRc61GBdecdlt8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(4326008)(186003)(86362001)(7416002)(316002)(8936002)(478600001)(8676002)(6666004)(36756003)(44832011)(2616005)(956004)(38100700002)(2906002)(38350700002)(26005)(52116002)(66476007)(66556008)(6486002)(5660300002)(7696005)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tq9GnE5lZHZ0GgCSQCmDyeynvgAFbYE+wWn/6LEhxpLkMxQsiP+60NdMOQa0?=
 =?us-ascii?Q?DcW2ieXrFM68EmjE7ZR9uq1q3k8Pk8A+gFoa3hfF+Ac9wiJ7/50DhWdYgXui?=
 =?us-ascii?Q?VPlIFuLU2mgRBwDxPXlJU1C9MmKxmfc72ab/U+r1HAFm1AIQmC6ZKBdFzMmk?=
 =?us-ascii?Q?o8WSkkgrtw7OYKh4PivrUDMLOxPgEiA7DNsbYiVsUXcaBRNrIWgxfk9hlw20?=
 =?us-ascii?Q?0b61yTeZqdf+6zHMT6MouUe2gCCMgvZixRY04l2GCgpWgmskOm7TDE+2lK6N?=
 =?us-ascii?Q?jmR3eEq0WCpezxlEyKxx4p79nVxfLg6Cq/daUU42FWmr0etWeM2uLfE2QoUi?=
 =?us-ascii?Q?3IJRkse5lPA/MYZ9GbFTsS+tuJQ52VD+uhBrkJdDalhsZhg5x3scPB/hYnsy?=
 =?us-ascii?Q?lDWgHmrA21XPLyWIGEJUk3B+TYccj2acrmTjMl0Y92P4WvNjkc7dmr7TJoQL?=
 =?us-ascii?Q?4tUqTV+7AUCkXQPvABlOB6tbbpFEr0TYVkzZUOEGDk/XSNRB8vFebaz3dHBg?=
 =?us-ascii?Q?Ycgekj31r4W0+11wtHtSh/SKkbkln22YW7mfFtQtjGxpGpROWyK8Wzc5AaIq?=
 =?us-ascii?Q?Lp8ESdi6j1li5ZieifV609hK/98/imbKIjqitSipsm5rmDIvUO6Js/2OzdNR?=
 =?us-ascii?Q?w3qbPijWyp/uAPWf1Y08o4srULXCLgViFSk09AG7FSRC/8Ae4uJvh0JBn8Zz?=
 =?us-ascii?Q?YhupWeqzaYyLuBrw9kq/ZWA623pPGCY7yWyt36iWCHTpi57OIfactxkvGtb8?=
 =?us-ascii?Q?D2g+a3LlAWLE8p68MHTM98aNnhIDhie7k9yGE00alJ6z8zqgIOK1z4JIqgjl?=
 =?us-ascii?Q?hz8q/lN6Y7zljrjxjh3GCV/jIliTvgTHE9qaukGghoCjypnliIkR2n66iOZ/?=
 =?us-ascii?Q?i17N5rtWREJ8gcR1BcVNGhZVcjD0UsoMI5/JtI++1Eh2KtUzqrkVGDPmt3dA?=
 =?us-ascii?Q?xvRGRG40QYryT+1Jxzf+U1p2xlea1M/cduDSK6qq/2tq1fXsS9FiXC4PNY+S?=
 =?us-ascii?Q?AXy8/XxtbMnyMBhCuMIdeSSz2Ipl7+H6/cAJek1uLHG66r4ipqvbbqdM+WoZ?=
 =?us-ascii?Q?JqMxJub6w6GB8+IWEp0ubQsFVFzLDOvo0FhKzf1uPNVS2cY6m00AvQghIpgw?=
 =?us-ascii?Q?q5Nvwkuj6RzsvRXwvcWPNlv6NBnvgRdydraR0uNDcdyWKONGp3WHUFUvVVo1?=
 =?us-ascii?Q?M9AmTnX8tLze7x+NGPAJaX3hYtGrfGXfcoWR6ZkrCOdRo2Az9K2AXtvCxwcR?=
 =?us-ascii?Q?uDWCjvwS7IpMXt7jEsN3eZnXamGod94t8g3B8J+mmUqwZQSeE4UctrsGHLnt?=
 =?us-ascii?Q?QzHSgraRwRtFI120JpjKkbUD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a46d25-a0f8-4c10-29b0-08d971e4de0b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:50:04.4379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1iTdVNCWlr5hIy8Jk/iT6v0EhDCGprTNX1eJAXjAbx8k1A0xpKWOz82xncDmS0A80miK8n3LMYbTMzS/z3k6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7767
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The codec_error event can tell client that
there are some error occurs in the decoder engine.

The skip event can tell the client that
there are a frame has been decoded,
but it won't be outputed.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../userspace-api/media/v4l/vidioc-dqevent.rst       | 12 ++++++++++++
 include/uapi/linux/videodev2.h                       |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
index 6eb40073c906..87d40ad25604 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
@@ -182,6 +182,18 @@ call.
 	the regions changes. This event has a struct
 	:c:type:`v4l2_event_motion_det`
 	associated with it.
+    * - ``V4L2_EVENT_CODEC_ERROR``
+      - 7
+      - This event is triggered when some error occurs inside the codec engine,
+	usually it can be replaced by a POLLERR event, but in some cases, the POLLERR
+	may cause the application to exit, but this event can allow the application to
+	handle the codec error without exiting.
+    * - ``V4L2_EVENT_SKIP``
+      - 8
+      - This event is triggered when one frame is decoded, but it won't be outputed
+	to the display. So the application can't get this frame, and the input frame count
+	is dismatch with the output frame count. And this evevt is telling the client to
+	handle this case.
     * - ``V4L2_EVENT_PRIVATE_START``
       - 0x08000000
       - Base event number for driver-private events.
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5bb0682b4a23..c56640d42dc5 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2369,6 +2369,8 @@ struct v4l2_streamparm {
 #define V4L2_EVENT_FRAME_SYNC			4
 #define V4L2_EVENT_SOURCE_CHANGE		5
 #define V4L2_EVENT_MOTION_DET			6
+#define V4L2_EVENT_CODEC_ERROR			7
+#define V4L2_EVENT_SKIP				8
 #define V4L2_EVENT_PRIVATE_START		0x08000000
 
 /* Payload for V4L2_EVENT_VSYNC */
-- 
2.32.0

