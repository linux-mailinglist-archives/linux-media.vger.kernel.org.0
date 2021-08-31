Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0779E3FC0FD
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 05:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239502AbhHaDBJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 23:01:09 -0400
Received: from mail-am6eur05on2089.outbound.protection.outlook.com ([40.107.22.89]:29344
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239449AbhHaDBF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 23:01:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfUA4u2WnPNPOidupIhgmYorVRRyGcfVuSH5XlBn7t8UK46EAb75qNpMoRZJS5Okb592vS1o/nYy98wlRj3RmZvys9A0cVYqOkMHgQZnhCJRU2mFDFZDczWgQt4Qq36faOMFNpzPoq9eHWVrBsev5DjVxoFc/hTPceCkxKJ1xTF6TdlDW05rmCW5nvc87CgTOprH8Eifz+G130q0DjeX6mLbxf4qPklUnosSd8e4xIVugimeKhaDQhOG2rIrNlBnhe7T3mL6oWGqfZEMkpdH4bfS3mEEacEreBucQElKqThGMKojKLZytOQkDuEOkhwNTz0WA5w77XVEUn3raXhMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuGAhvg+ZR0HNx8MmJlLyP+rZrtnojGtIfP4DZRJkyo=;
 b=NmBQ9lSWtMG0VVCEgk+r0hOzPjPO90DRdr6cyTwNQJxkRAYHXxFQT7jFmcq8daYDK8wm7vPrlBXb9BWdF4R/jtYNKBtOgQnsKxxjz5jDkWi1MNvY8XDUQAkatPN7JxoOkUihDFwm1ZkEg0o4NIy/TO6wJuxUKctSHfpoVnS4Nrz2X+nzdjBsCRpKHY6PNdEZs4njfiJh3Ax4EYIaCcVtI4D/gJO+dqVZsAq84U7EGSHbhUacsbZVhumgon9L3m5dhDQFJkvZBwE//CrQLF6vLbrI8Q+uUNF2rPkcBHxePkS/ikxNc0aQfWuQNbAEFStOzvs+PdlAJ08053tC6FXRXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuGAhvg+ZR0HNx8MmJlLyP+rZrtnojGtIfP4DZRJkyo=;
 b=hGxYbfZRZTeyLpZ0uVmRKF60cp1ImLYY8aOyStVr0/XijKyiHlBmS1GihB9GED5rZXoZN43M5VogtT1S2h6D3Yr29kte5bg34ibw/JFkXAGMjEAhwzvf5le8JR0NykYjwsPU3I1+jP6pC8NiWPeM4iDr9+HHn+CjDptJFybsjCo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4888.eurprd04.prod.outlook.com (2603:10a6:20b:12::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 03:00:08 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 03:00:08 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 03/14] media:Add v4l2 buf flag codec data.
Date:   Tue, 31 Aug 2021 10:59:04 +0800
Message-Id: <be578f1a32a47d24c03b9640c6a924b2a6507708.1630377507.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1630377507.git.ming.qian@nxp.com>
References: <cover.1630377507.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19 via Frontend Transport; Tue, 31 Aug 2021 03:00:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ab97d25-8919-4fe4-d29f-08d96c2b70c5
X-MS-TrafficTypeDiagnostic: AM6PR04MB4888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB48883463091BD094D14C2F93E7CC9@AM6PR04MB4888.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nat1aPb8x7Ba+hSCocAnau3bQQOJw774cyuS+AQU7xCzLF7vt1RBVpIPRQuzKQCsB1CCCH7GrueZBc0IF8KTLv1HeHpeu3RJ8iXsYWXvYrBMXQCoLmxTHPdkspGzndjh8wSHKSdfN7svIbu6ppR5TXa0cCnnSbanPXC8mk1DejY3Q7gRgbhHRwQuGrctOvMFyVp7uSjtYfIbJlZWD8+oDIJo9NScjQb2CdhVESPUwDqfvjF4lJX9CkqBVns7pyERtTCpNqKXyqa3rgvdv8OLWaOri8ZoTGlTXMS4hXxUxhc2S0kHd31PLiJhhpbA1dXp+oythOH0XfhOtNGpAs6iLJcHHU2Sp1n40AbvxaQZt4JSgm6AuMsg6eCwXLmHj67T1hCwGpyF0k6KfcVZP91RWS78uFjuZPn4ru1MhJuik1SMgEPMwkF0Oo0yCNYmOPpYNpTviJ36LhPWx1yrgIAUiWzRoFXWpsZo6GYD+6mYrjyLe9jeWZ0JIEMnDPf5YAXAOCIb5NmaS71DKenfzcbcUnzphUsmi2b9EIyknrbrT+TtZE+BXM8es0XoO7SCqAvRXILogYO2H5T7d2oOTYe2WFFaNFF7NjVwSWF9pKbko8RXZDtoprLJU8qpiyBQRJ/83M/t9iukGhKF9XkrwXuUe+/LlQjNGsjJgi6XCdzaODktqwDxet3ZRWUnqQrJwFrWMOwtNn7oTdp8TGj3Xd8kVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(6486002)(36756003)(8676002)(2616005)(186003)(38350700002)(38100700002)(2906002)(5660300002)(8936002)(44832011)(478600001)(956004)(26005)(7696005)(83380400001)(316002)(7416002)(66556008)(66476007)(66946007)(52116002)(86362001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ExRrSqflh80dCeoGU9nXRzB43FAzaPCE2ENHlU8G0EPitV/K0IWHNNA9QRk?=
 =?us-ascii?Q?gMxqMCSe7F0weH0GWiWpg1bsDjoRNtDdvRGtnHYRuli/9397Ac7hSUNQiVE9?=
 =?us-ascii?Q?CnPf2eENzsSSLQS/1wKRwACM9Dh9o5Pjac5KJT705pLQpFJV2nvM4jBGStVF?=
 =?us-ascii?Q?CdjdZ8rFsOE5PEuT1ak8EaWI7xB0JdjArWmx/V0DTBGCEC3z6cSldRTiYZ95?=
 =?us-ascii?Q?9eHfPmVbBU/m5liL80SMo7B3AFndJxcXyS6HFJ6iDVLC74eID2rflVP60rR+?=
 =?us-ascii?Q?cjSFi0Yfc1esBRTC5/3mWQZkXI6I8mM21Vrp77E7zgiMtx3nrvTfSULvK/Lb?=
 =?us-ascii?Q?XZXz2/vvRC1FydkEas90MbCiRbgXasgmPX4MEKxQZC0JIZhkcqy5WuR+phTi?=
 =?us-ascii?Q?qr2prk+svF7h3VY8uYcc41hycSIUAjTrjut2lFBcugAeJtN1loG6209KSLh6?=
 =?us-ascii?Q?ZEx0vV4rHjjsMTO3w3cwUrKL5zqJLrtdqhM2nQ9fg5VLYf5cKSpTR1WrvZLU?=
 =?us-ascii?Q?1LiyZikaYqEVgOBoPeP0uVLn2iD8LrqcU4TpK3Sge/dwP35oh10hpGDkHWse?=
 =?us-ascii?Q?k/AzjzbfmbKDkej7UY2+X3scRhF9gylch08bd6+/vRZxGVSc7nkR7ReUqKDQ?=
 =?us-ascii?Q?V2idMMW8j8HIdF4hBpZEsRBS/ioXJ2oimWsHvW/03zg8GH6aXU9ZltbNc8Q1?=
 =?us-ascii?Q?B1jv0V1bKGEW3Hy65EJ1HSgL9g/f7My0fdqiTA3PE4PSneZubcr76iBahGjW?=
 =?us-ascii?Q?ts5WlRzOj889vaUOKoljL7rwUUzhr7HxX6VtsS8Vv7T8B0+/uLcRl1DG2aNy?=
 =?us-ascii?Q?+E6VSMm/XJXmI9xvttqWaTgBw0dU48Mjx1Jr5U4EQS+3ka/1ggZ7XM/M95KN?=
 =?us-ascii?Q?yunmX6R7DQ5P72p9G/5H1hbd7HU+pa33w0qTzglvZE2yW+M6KpLEgEhtzsAG?=
 =?us-ascii?Q?jV1btudfuTzCbwM9pyr9lvOdlWj5MeCwUJDb5jJNjs2WvnUucd5C4TMDXfOT?=
 =?us-ascii?Q?NJ37xA5KOqi1r5kHOUuXlsrM4zHE+ZlNWN93yV4lkpw1WvRvs9by3Rfs4hDL?=
 =?us-ascii?Q?nrOaiOw30SW3aDVmvnSzt45ij+7su0Y+PVk4XwmUwxy0O5+678MCVVWAsT/x?=
 =?us-ascii?Q?OEZVyiMHaVW3WGN3AAyhBK+p6T4lbhsa1rVFZSHUrXbU0UhxjjE4ZJhHB3o0?=
 =?us-ascii?Q?aHlATjw64PF4ASZ49axuzWcJnpgP2APW8iYWyC/kaAn45OIm+U01aTlQxSJ+?=
 =?us-ascii?Q?BgDS1dxxdR24td2k+vWe5gLwA+L8FmHS5ouBWMgPPRAu4Zb69lfb/+8jxNHs?=
 =?us-ascii?Q?rqZ8hkuyZA1NqD/hJIEtymFn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab97d25-8919-4fe4-d29f-08d96c2b70c5
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 03:00:08.2711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsnDoLgOgJqbi1LZwm+pOCDG78syH382GdfcUWficX6aT2kOnbhvs8RjZ01xcFHks1LZiop7fOG2K9COsQwKrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4888
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

