Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40793D6C82
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 05:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234844AbhG0ClP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 22:41:15 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:13829
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234853AbhG0ClN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 22:41:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/q/tANasdPFskfLJJZtT5JirLPA/iuUOdVkLXP2Y+XSyn5Vny+B//ojhXxsY7U1ztc2kaeCObqJTMPHVx4vVrExUk6zN8VQJjD2k89TSdzEB6tKcn1onYKeLS2uHThNpN665swtFW0SBU1HaYD/p+PpJqVLLwqSSTmQY8dRrgR0wzxZlTz/uS2nhCxshkAd5NK+DA+qibHD/jsnAlFGMkbH2qU7OBHf+ZUTlzljEuzci8rf3UktBVTy44dr/d/5QC8WekfDC6FzWhjQIv9fRCF1L6QXnHP/tA3ZWfJ318OlHguBYcpdK20j0Gv3damCsr4e+VGhmkCj5M0rDKe0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HW47waL6NV5P6ETFEgKflVw4mHSlkW4LPCTJWycq8zA=;
 b=YbAXomtWptIeIHjA8nkXGsRPLhrAjftZwvUzb9B2jTaDVeuajomhhs6A0YXLkMDf+1fRjHavQkUZ6orjzPysZnz2tqIc+Bp6tWp+d3hhn0XbuUeKnr7OR1jdrPgapHcPsuCW4qoxkjjYnDOyRz7mNbNzzhDhLQACODnko/mN1mavJdEX3YKVdYmWmwY4emSoDqdnqkG6w2hSrUTqrh5GaZ5JdwCJmvL2QpZnHt0Wze8LFVapCG9sQl3z+rnnxwuFle/2d86y0TarYuLeRJbyVxS7WZmKjgASoErfqWdqX7RutI2mzO1zqVp6gAM22PS5HqqiFld4G5nypikv+RIfEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HW47waL6NV5P6ETFEgKflVw4mHSlkW4LPCTJWycq8zA=;
 b=cIXupdZn5L+AzESx4O/u95fE9wzSKPkcl00ag8+cFTUWq/d/h4NunCs98GfVzRwscwCN0DqHBhoJsnyE70phQrP6tbrobHhwagb2afW5j/NzI7eq0LVoqm4+kkHPKyN7Xw5YDYrLwjA+FY7Es8C31Ts+Y28O4ixRVrNC+WdDBXY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB7640.eurprd04.prod.outlook.com (2603:10a6:20b:297::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Tue, 27 Jul
 2021 03:21:38 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 03:21:38 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 03/14] media:Add v4l2 buf flag codec data.
Date:   Tue, 27 Jul 2021 11:20:46 +0800
Message-Id: <4998d30d00ccea83bf1570b511b22c63f12fe156.1627353315.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1627353315.git.ming.qian@nxp.com>
References: <cover.1627353315.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 03:21:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f59b4f83-903e-44a1-f35e-08d950ada558
X-MS-TrafficTypeDiagnostic: AS8PR04MB7640:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB76407A046B3DA794AAFE1D92E7E99@AS8PR04MB7640.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ph09I+IowsGapyuC7Gj9MBJ7onlxjvX4sqLwrlHkiaeBXIZDChmh6CaECTVAPfcDbuM/3NZV0YyA1KLxpR1K77YLuHFGpucUGAgxhZnt6+CT8H8G3i4+6iCJu0veQxCHQKfs+t8VyfhIii6LTaXHkLmWbRvTomU1sp5EBpqhxbwy6bDwRJT4AjFATp1EPra8NitpXsrlouBoWjwVt52T4VoJeDjRNvfLKFPkc/lhSaAriLRjKW4xfcMQlqp4QL+2YPPODug650at1V10h1n95g74LAH976TbfDdEARhzFIJLamZ4pfIben7nyaazIG5kCr6cou919IHWjE/WuscbfgqUxkW0dTO/ubrPliDBwCec6ugUVHxidGKtB41h04fmzrA+DiufGWJj0eukAmOEyHR/W4cpU8Mpgl/eYNTRsWsbjJWQSPTIfB7w3Ti7F9Hx9uUg9a1SyjJb4N5+3VTMG7jI5r308GcBIKeLipXGid4zs6/UDwsQ7KWsGz9XdT4q1ihZy7AKHbt9ur0bCPBawYTLYXIzPqRQve7wzm3qAw0f9rA2xQjYra9ef89IABY+Ssg/FjLegIJVHMzJv0xMOYR1btZIf5SpmpBrUkiBOX4/JbFf0gFWIXsUaC5sNgF1OF6cOG2f2R/yvV0uPLw7zA2Kvb8PBKvXDAN0rVhK/XlanCNNkOXGc6nGRKlNcUrh3VAXz1W49USnVz6KJP8JpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(498600001)(36756003)(6486002)(44832011)(7696005)(83380400001)(38100700002)(38350700002)(86362001)(8676002)(4326008)(7416002)(956004)(2906002)(66556008)(2616005)(52116002)(6666004)(186003)(66946007)(8936002)(26005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JPe2pHvX9nC299aWWTSLjJFPP8pnkRYfD9XctdxZ5yqzz72T7bCX1+BJneH4?=
 =?us-ascii?Q?DDnsP5vRr9jdusSOGXEEsuo+f1hoS15uGfmDK3t3BBNiuHU6LLg/doEHi8ut?=
 =?us-ascii?Q?zdETeLWBwI4di6FY08iVo8CXWG7xeYHk7DpDCPh8c6yDsxluBpWiQ6qm/Ea0?=
 =?us-ascii?Q?pPSb0KdHaqPweT7gTFMi3HFMn08f/QuvJlf4rfd+UueIRWH7ZlSxUs3vqKDy?=
 =?us-ascii?Q?cMQG/WrSIa35ASdpMEnkc8hOV2L2YCvHB75QlUAeMKQEpfqZnnFSHx9USpFZ?=
 =?us-ascii?Q?2L86KEkaofE2Sbf2WSJ431VGXI5JxDd9zOokIMT8u/FlmZkMXCYjJpTzirpj?=
 =?us-ascii?Q?bg9TMKKvAXRYk+ywlC0fV6uP6met2fenhAm1BjX34MF99OxiziB2iiZLLT5a?=
 =?us-ascii?Q?beTk8xYKKcpDmb4bJQoH/5m5TwnEKoAd2HgNoA5Y+QhLB9KwHgMSmCqvh1HC?=
 =?us-ascii?Q?TJMrAw6r3h8PO6zrD0uNEmSIB0ugvI7gYXSfFR3Mxrnoer8B90PACVVbDP6Y?=
 =?us-ascii?Q?g2DlOH8NhZP5T5lYXJ63UP51lqxsuvbuDB/hySPaPM9zZW0DNgV/l6Dts8kz?=
 =?us-ascii?Q?TbHA0a0MUWwb41Mar7iao+RABDd+Gv/PcUVrHFEmoIfb6ikEZEcP5dBoSmAW?=
 =?us-ascii?Q?b6GFcK3MF0djxKiNHO9qkje0kdjUW1tnTbGxxRKxEacw+j/ifuZRcqAS7maD?=
 =?us-ascii?Q?+XlzMAjdx8VeKD5acwBCaMmFHiOwckWDwQoxSHdItIEsslTCX5MmGe6x0gXR?=
 =?us-ascii?Q?UgkgvfOOPsub9qmOjKf8jyYK22cOibLIWjAeZuPiTNAIkzDEvXmeY6vdfbnj?=
 =?us-ascii?Q?PBSZ+EknLu1nUfjV6yTp3j0+xZJMRfrOiqRnC4O4eCFYGml/f1gbj8IiY7y9?=
 =?us-ascii?Q?W7Zpmeyx1cRxyXrVMa2fBGnV5Rjhyvsr8K1iO5PdFQZSZZDNaWSee+15s66m?=
 =?us-ascii?Q?UsFQS3Rb+ovucAX8wf4pviM7AXszbHge6420DnAMGVai1/lhx58GFU7V6qmI?=
 =?us-ascii?Q?b2dJMq2qqDU7K9bGYe62rvn3NrfyNKcw+oyJo5JXPDfOMJxMgIA0WqbD6p2Z?=
 =?us-ascii?Q?xlcRFzYEc4xVGwZ3lSwf4SL8/5wH5SEh4h8W7d/RnkCDKdAyMORNbbmK4uJW?=
 =?us-ascii?Q?L1NyjoCA1AqmnbaLyJaMrXkRTCGFyjhlk+hRldcMCdaewDq3uxxRuLD2Tn8e?=
 =?us-ascii?Q?tPHZQaVJb8vToWAVn8qEEVSBsdohrsgnnApA6GjSueQS/Q+ySRV4P2yEecfZ?=
 =?us-ascii?Q?LXC8Q/0AqKVsI/f6h+TUtwbLR+wYvVMZGDUruRAZTRSN8frQkssXb8705Fgu?=
 =?us-ascii?Q?siub1XDQT81jir1d30g/+Kcp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59b4f83-903e-44a1-f35e-08d950ada558
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 03:21:38.4979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtIrKSYK9QDbkKYwaYl/r8i1lRxBK5Vc9VAUIh6gxffq+/AJn3du6hv3vJbi0+BI/6vgfkd33dPQ/Tj++c1yjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7640
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In some decoing scenarios, application may queue a buffer
that only contains codec config data, and the driver needs to
know whether is it a frame or not.
So we add a buf flag to tell this case.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 Documentation/userspace-api/media/v4l/buffer.rst | 8 ++++++++
 include/uapi/linux/videodev2.h                   | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 4f95496adc5b..7f32c5fd6b11 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -611,6 +611,14 @@ Buffer Flags
 	the format. Any Any subsequent call to the
 	:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl will not block anymore,
 	but return an ``EPIPE`` error code.
+    * .. _`V4L2-BUF-FLAG-CODECCONFIG`:
+
+      - ``V4L2_BUF_FLAG_CODECCONFIG``
+      - 0x00200000
+      - The buffer only contains codec config data, eg. sps and pps.
+    Applications can set this bit when ``type`` refers to an output
+    stream, this flag is usually used by v4l2 decoder.
+
     * .. _`V4L2-BUF-FLAG-REQUEST-FD`:
 
       - ``V4L2_BUF_FLAG_REQUEST_FD``
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4836590a690c..242731cb6556 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1110,6 +1110,7 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
 #define V4L2_BUF_FLAG_TSTAMP_SRC_SOE		0x00010000
 /* mem2mem encoder/decoder */
 #define V4L2_BUF_FLAG_LAST			0x00100000
+#define V4L2_BUF_FLAG_CODECCONFIG		0x00200000
 /* request_fd is valid */
 #define V4L2_BUF_FLAG_REQUEST_FD		0x00800000
 
-- 
2.32.0

