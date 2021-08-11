Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF603E8C22
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 10:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236233AbhHKIok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 04:44:40 -0400
Received: from mail-am6eur05on2078.outbound.protection.outlook.com ([40.107.22.78]:49598
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236183AbhHKIoj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 04:44:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzPzFmom2FEpzNv7/ETS2rS16gTdDvr+fkXovw9n1ulS7sHksvSf3SyOMPukUAGRjFMuM//TTwEQsPen4Tn543s931ED0u6uRFhuQ4+KNtrpWILfsdUt/lm/QgT4a1ta8KjxhckRP7kDcBOT4vW+uJgGrEAekCu3I816eRUrIRthn6osrsxeXDtn83Y3kZnlRSeTrCBSQHmWmMvRsIQygcwIrqSOabmIDSygYLoQoffDW71EOFj8XUVGAMaN/Q+Iahw9S8fFK7xZc8U4kFLMYC0W695WGSMGfKYUd4txlF3V+/v9xBNEHDTnhe8YKrOpRjYuZ1fifJML4yeiAtq9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuGAhvg+ZR0HNx8MmJlLyP+rZrtnojGtIfP4DZRJkyo=;
 b=g0T92MS9L+/Uy8ykg3C/Rh4bYaxiEj/AAHZJNGbcTp5Fjwcayx77w7Qk/pSUC8paKe9z1Ki2Accl0IVuvEhTAvsx6L6IlhQWpMp4qwJFY+3SzO4wLNBtTW/wEzwOU95xI4NQPE3MIkgUAadnUVDaHE3AlD/i7U9PsBOpaqPjb3Nmjxnx8rwJZkyw6oj+96oU87phF8NAGIHZYc/q0CJgdW8/0LgRgXJxL3gLjK9WRvsSf159QcDmHfMC8bmRRjUWI1xO2c5obXk3uhsO3mYgt7rOIoKosaLlAG/FXR0ElVg4Mh/ggrheJXudQKKK8fj4DY7jwEvyx9kMm85xvWI++g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuGAhvg+ZR0HNx8MmJlLyP+rZrtnojGtIfP4DZRJkyo=;
 b=RQrUulVfhtsVvmPGgA/GE01RDqHqSHhqcjrpZ36jvlaJDLhn0nqwn43Df7+2jrIX7D1FI7XGvLlHxCZe4LEO2e6zzDE/8u53HlKLQD5K5SiGtuPCAoJp3ahgR/Bm5vLK/QJxueiLt9Fd47u2qejM5kjniGQa9cYQ5eCIvanO5Io=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB5126.eurprd04.prod.outlook.com (2603:10a6:20b:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 08:44:09 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384%6]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 08:44:09 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 03/14] media:Add v4l2 buf flag codec data.
Date:   Wed, 11 Aug 2021 16:42:59 +0800
Message-Id: <be578f1a32a47d24c03b9640c6a924b2a6507708.1628671163.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628671163.git.ming.qian@nxp.com>
References: <cover.1628671163.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.4 via Frontend Transport; Wed, 11 Aug 2021 08:44:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8115f49e-e23b-4957-9192-08d95ca42f6b
X-MS-TrafficTypeDiagnostic: AM6PR04MB5126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB51261187B232A4A178EF6B6CE7F89@AM6PR04MB5126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CkbGnIrcSpWwHQ/G8Y+AusfAewtU3InLItemp4xcXVGMFJsByKe51FEMMujP5Rl0RxlQ3B/rLK1Ohk6WMypPu7V9+uFUgyJm26ADOb8ymO47UzaeLkMRN6E9dC4021/A1kxwb/kpVUDCdjDpTltZlHqIwaCeZIpifru4CXGoDUuEjwfNhzAhDWziGXRjglIctYi9EYEEJ8w5MvoDX9XDXwz2CnffJLSqojXQyfEiDaFXek7qcGdxoe3sR54aBmQW6kPx8M3Fi7jpPSSw1o7lDg52GagEOwWAB76pEQp+GHNu+LZ7Z3P+lLJhbNkcgy2HyFf6uTTTO+wAkBGO8MdyjVqhsL0cN2SBqvYF16S6X4Yl2TZLwn++jJ/oLcmU0ovlPIx5oqeSPTWIj8gZ1oqvuubFG04Z6u4uHJxmeFAiIHzG9/GKzdMZZgcxkkhq7ZeZQFJBWvAnR1Mru4DIdgTde1qWIFcD9ZUMOmT3h9pZ/y/u56pn+1nU/HJlfeds8BvzpNLPcfBpw+aIFioHzYrAFAf8+Mon5eec7nKZdzvRlUMJNby4kQBlti+QsA22FB/zahFajXafLRlM9mZC3hV4dFkGUwkaFoNtShkwl1+zAqQ+tPgzQA96IRZzKEJxnRXJ82QdsVWgdokHY3q8Q0t7VsvDKw+X+hjNjU0tcjhANKfiShbzVlM7TtjaHpHJMAOVB1/2o9SNwTI1y0T1INXSgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(8676002)(4326008)(38100700002)(2906002)(6486002)(86362001)(6666004)(38350700002)(8936002)(478600001)(186003)(36756003)(316002)(66476007)(26005)(44832011)(2616005)(66946007)(7696005)(66556008)(5660300002)(83380400001)(7416002)(52116002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UFRGzuRtHgnCKy39UBC7ZueOtDmsU2bBJ6subGOcsVG3F/TNiWHvevLEvyq3?=
 =?us-ascii?Q?4HkRcULCuszN2fBWA8fT0GGr3X3TfWdjHnC60FuZo+EW+5pKxdBAQLZmn2Lb?=
 =?us-ascii?Q?Bw7yBiylJ+asGtuIVUpiZ2wcgfJ7RgRbVyMyPYcWyFQmjyf0rPlkeBDaUwuN?=
 =?us-ascii?Q?rf3mGAgSUrDWiNur0Cy+jqBeX44Fw+SYUOgsr+ZwW+38sJsQs5qz9SxTJkI5?=
 =?us-ascii?Q?3FGf7PkqdCq7wTwNV2OlzT5oqIzWUruKCRNWWPbMlaxy6BxRsa2uRlyOR6GY?=
 =?us-ascii?Q?EhjHWTKuYCneqM/x0xqq1KoYlL63Zu1CmWwewyi9KtlMvNtRu1S2mH1DrXK3?=
 =?us-ascii?Q?qsOxyip62IS/kyecyus0DVDPwwe34Dh47GYstpDnEncNOFApXVkkWnHsscgJ?=
 =?us-ascii?Q?K0N9Wt0X5VTbyfRN+0u+XNAd0pYbDRFnvOyD7jTUuCaO81EBX+KlPc1JbfOh?=
 =?us-ascii?Q?M9JXTlbocWxSSfoa3u4QgKUdBi5FYiztTCDkAhcLqIEciibZn0gHJmHg9TnD?=
 =?us-ascii?Q?AQeJFDk0nbBVsZMBLuTUQgyN5t7PsLsYPRFBUPqrVWn/mhkUEctb10kkqVWg?=
 =?us-ascii?Q?/aWgR+GC1kzS2o5psuaN5wtxLgzwfY+POloPUVpDEnKvGJmVuUcfrXTuJy18?=
 =?us-ascii?Q?TqblHIDpe0H0CF9zlizmC48MaR6kUgqXJZfX6DfAXOxdY7Bv5CKZ/hjaf1fn?=
 =?us-ascii?Q?N8lVoHXANb29C+vlWgpaXoNxZMobBvYJL03jusNYZCD2EHPlI3qizAWH1buq?=
 =?us-ascii?Q?8K6RoD/wyCp41wmbrWdcLurbcgFj+jqNvqaeQNmjQ2wI4PWqgtt4nkH9LN8A?=
 =?us-ascii?Q?8Lv29rVXItWSByJyJC93r9G1SyAXwYffOQAX9pIcslKhreSOMlrqe8I+HRLc?=
 =?us-ascii?Q?9lAPE/cigihkNvtsxspCGpobSaDRpUSuq2CJBvqu2GspgWoCj7zHGy1Z0KJg?=
 =?us-ascii?Q?2H8gTxFgzQUKfHAmAhaJ0y0BiNZkI7PWFi2r1PXM3txIG3bQmswjJwoic16l?=
 =?us-ascii?Q?EpJdJoRZu/CEPMIdN/ll5mCrsR3NqXGFubRJcqiqeqjYAcqHxIITSWMPOjHZ?=
 =?us-ascii?Q?QHhqaRqi8gaYaQp1zzZXrkplJ5YZuESvRxxYQestE/sHG6hXhNDqXktuWn3s?=
 =?us-ascii?Q?Vu2Mm6hmMG0ZoX1vqdxOaAEABbp11e2bH5YJM+SKdhe3+03l0QZWQgWcg5ki?=
 =?us-ascii?Q?07U0BQ2hrTOR/QDldrTjiuaM7pGtD/T2k0YxmNHf4niEj1gi6zwMqAFIn+v1?=
 =?us-ascii?Q?M/pFCsqteD1yToJVBzJ9OIQIwunS/DExOM44nGcGWtHtfheQus7DsImm/g6+?=
 =?us-ascii?Q?T1tiK13oZu9YErHfKnWn64u+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8115f49e-e23b-4957-9192-08d95ca42f6b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 08:44:09.1225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnCRLslz9ddZGsXaFG8MgYxsdwtEo4NqGfRy/RTQ50NqUgyvm0GLzrjwX/jM3xhWNfN+whR+2D01y9mF1xV0oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5126
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
 Documentation/userspace-api/media/v4l/buffer.rst | 7 +++++++
 include/uapi/linux/videodev2.h                   | 1 +
 2 files changed, 8 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index e991ba73d873..11013bcf8a41 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -607,6 +607,13 @@ Buffer Flags
 	the format. Any subsequent call to the
 	:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl will not block anymore,
 	but return an ``EPIPE`` error code.
+    * .. _`V4L2-BUF-FLAG-CODECCONFIG`:
+
+      - ``V4L2_BUF_FLAG_CODECCONFIG``
+      - 0x00200000
+      - The buffer only contains codec config data, eg. sps and pps.
+    Applications can set this bit when ``type`` refers to an output
+    stream, this flag is usually used by v4l2 decoder.
     * .. _`V4L2-BUF-FLAG-REQUEST-FD`:
 
       - ``V4L2_BUF_FLAG_REQUEST_FD``
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 167c0e40ec06..5bb0682b4a23 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1119,6 +1119,7 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
 #define V4L2_BUF_FLAG_TSTAMP_SRC_SOE		0x00010000
 /* mem2mem encoder/decoder */
 #define V4L2_BUF_FLAG_LAST			0x00100000
+#define V4L2_BUF_FLAG_CODECCONFIG		0x00200000
 /* request_fd is valid */
 #define V4L2_BUF_FLAG_REQUEST_FD		0x00800000
 
-- 
2.32.0

