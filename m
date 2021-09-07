Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9969C40265F
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 11:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243285AbhIGJvP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 05:51:15 -0400
Received: from mail-eopbgr30072.outbound.protection.outlook.com ([40.107.3.72]:27145
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243115AbhIGJvO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Sep 2021 05:51:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLLtZNq/j6hR1+CtabLZ5z2VOQnAuCZ9Pue5PYMJbHXIiMdPURyZyBibxWyeUUCoh9nHobbNfxpUCBGDY8xaUMHJLeKY33K3/mIOxNW3ACyHtadEhpsHdTC4d7ugn/23xfPp0Gvm1/XmJn3iMVzmENBpe08Yr7d1DWazW2Q6D3TLVgq+dLfHepPA8FjpxwiqUvUqvWhhP6D5O75t1gLCz1AOcH5ZjQgc6x7G0NqOWDKSzTLJVJrWA9RVJsctgvMLG2PspKZu0sf+yiuOuwC/v4WeU/KqNLZ1Zv6ETVui140HpFjZprpCB8La32hjIATbS71ydtKd83g3ggKg7Jed5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nuGAhvg+ZR0HNx8MmJlLyP+rZrtnojGtIfP4DZRJkyo=;
 b=npj35V3hqsgpJUNEoWk+6bu4QSezEvGK7WEJ4SGjolXG3K14N58wIKwXVepKvDqNQojTwe1iAHRtUCTIDWmQzE479d7RCvzNEPvEO5eJSDP3c8T7S9EbfzlsOoC1CraqLdVEE9cfNdLfLZ2r6/t3ubYRUJiSP2TOCAos/wwlLMndBNajAKWWrZNm3bxloAV/zUF9e11s6czvstyMuVS47RUzEYiouYEQdUWNjYmFOBs3FIvsviJajJgwosbQaXmxhHn0LkL2RSS4DOyWdAD2FKVnFkvVzEvnF9kKff9C8rrXIlAfvFOaZ56H6tc4AwPPcHspoB7Nz2R6cAXFgZoJFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuGAhvg+ZR0HNx8MmJlLyP+rZrtnojGtIfP4DZRJkyo=;
 b=EJl9wzT8zmny3h+G0ce7v0mBggB2qwtFG0/5xx+zNBa1cMTIEvT0sT8YMu/sW8tc9QmsIG7nWBy4cSyELtWd0X1jqaJ6FUhw/Z56PVAx88KveOhSyGAYJwZW1V33diQh3mVo0JckcFg0wfNRqIs1rWWP0muav5cPOB6IwlUZXyU=
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
 09:50:00 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 03/15] media:Add v4l2 buf flag codec data.
Date:   Tue,  7 Sep 2021 17:49:10 +0800
Message-Id: <7ef1840137417c33f5ef7ca611c90fc274926851.1631002447.git.ming.qian@nxp.com>
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
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR02CA0097.apcprd02.prod.outlook.com (2603:1096:4:92::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 09:49:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 545d7e14-64ff-4ad2-944a-08d971e4db9b
X-MS-TrafficTypeDiagnostic: AS8PR04MB7767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7767E5D56097108DE3E683EDE7D39@AS8PR04MB7767.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VYvssJcrppMKv7YR6ci8IOn2X9qVmIIyUBRxnKPLOoW2VOVacvLdMycUD6ToLfPl1YkW1Q9i/rIk54/7tJ6o3/1iHCI8meLjIv7dZ/+OiduRrQr420zHxwsl5ozbr52TR8S0LG0npwJWDFgsdfo3yxxD+Rmw6l92ucP1A26M97f7WeUQWyZt6R2gZEuCqIiWro2nH61hMERZXxIJlyv6of2Te1+eauvKwPgh+iCIzjIszRqPhPj80W9TWvXzY4/d9dCHdx7Of0aSj6prjLt87zim3zYdSxWLeXB79tdQScmtuTz6YRjnsKF+WjOzLq8zL72tJ6ZaYMB9x1dlWzgrN3CfkKf9llSAk1hMQNO+JBC9MMvIYG+LBj7aGigVTk+BiRfrLuLD0OKw4YpGncSYNuNHLbC/lT1T/hAuzN/TNkHHhwoCQpwToSypctWhKQLGBnmV5BG6prx7QNYQBKuyYKLgFaOoQIiXt4OAc/F+Z4jRUgLURkG25fj0+di4t8Ha87JKKuJskesaDRX0lNFeBi7CxRGohgATF3KxvHzH6GdxEKL/cmwiITj4ISC+Xa2HIa/xntpxSoHlRjPEfToulZQAaedj6cwIaz4pU4Wcx8wi+Ynwmr6sh73+WdCRmkG2FntRMmUwU44Nz9Ycpg4UE8GM3TJFgXjBf9qGcPf19QFa6IJutEbjGBiDdmoWXcOjYhGNBKsZLoB6BY/wCW8r1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(4326008)(186003)(86362001)(7416002)(316002)(8936002)(478600001)(8676002)(6666004)(36756003)(44832011)(83380400001)(2616005)(956004)(38100700002)(2906002)(38350700002)(26005)(52116002)(66476007)(66556008)(6486002)(5660300002)(7696005)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N8nH+9JU+RM8axSkuGP/GwmmM7OHnWNFwUtL02FFgwjZqpHB0FCsjb/bM84h?=
 =?us-ascii?Q?cR6uBsvaPO0OB+3D+X4RDXQML/HqXY2lpk3bWvLSiZHXrzgHmZweptm5qeof?=
 =?us-ascii?Q?QwGWkFPBDFT29xtx8OJ/B69vk3jzVCps58YySU5WmMiTsMXierL4raZrjicI?=
 =?us-ascii?Q?Xh06dLQTS1GDw89PbAmKH80gg8XZK3RbNas+VcEsZTFgLnmMvR/ZhwItUooH?=
 =?us-ascii?Q?3DYZIkNS1lXnkdLasBDzfi5HarPryejQUOxroiaeavTEtscz+Jz6933WKL/c?=
 =?us-ascii?Q?RAz6ga0uNlFTw4reto8L1BVtGFVvSjAPuMgr8pslbPHPaVpxhgQ2Z3CB921+?=
 =?us-ascii?Q?LCsF1gAvNfaDeI9JVnixPUHL4zVGTX0hT9KSqeuabz/g4OF4IOlmF9Y2YG9w?=
 =?us-ascii?Q?QU8KV1I6S9ojnlP0jyNWnldOQhaM/QrD8DZ3mVdYR3NLt0y+dDvr2q0XOTRX?=
 =?us-ascii?Q?uRGLcfFvtndrEcPeoaCwNVVhFSYKa1tUOlIc/mtLnEULmdX9jpBkQgtn1yxk?=
 =?us-ascii?Q?rVFlPDSy6bt5jOFO6DeR9UJ/0vWhD5E9QnIx11AuLKp9nmBR9dH0ljldukB+?=
 =?us-ascii?Q?V4muIoKyHJAC+o9Aq1YYAPCykeIYwqSe5CmlHoQkRXg2mza7gWzHbWOz+FUN?=
 =?us-ascii?Q?PyQlybmMfJm5UhEZZyq+mDmZkOXZg1kSa3abDINONDAAaDUaYkA2SiNVFeR4?=
 =?us-ascii?Q?Kd0ED/PjrK21lPyCbmAbePV3noN45CuO+m8HwqGSZiW5c3OyozCL5zgqacC7?=
 =?us-ascii?Q?F2vFXig2PS5GFGJUqYcyKvMCwck5mJwunhJYtKx2MuDQlqMTkGChleWod/JL?=
 =?us-ascii?Q?3dHyZ63w5Rkllx4qJuBF/5//YWo4sDfGxtB32R3MzVzfy6bYSLKi1OyCFmNd?=
 =?us-ascii?Q?vGLh8dzgceZMMCABnP2iEyYdSIRXinHzkjTIaxXSe5+foD/CJpWLg9EowF2C?=
 =?us-ascii?Q?ZIuXzL3MIX7OV9ygU9FEpFp3OG+lXnMslbTkIwyK9Vuq4gaBzyf3EHLmqXNP?=
 =?us-ascii?Q?C0bQ1CzNZqiYNVwL/mrhktkfCV25i7s4Ws5pinpT+eVsqsBtIOUcDrw9qVmW?=
 =?us-ascii?Q?pP7ELv7MV6Ke/asfxA6s3zb1lpSRKMvbIc/SpSr6CZBKAwI7ii2YGJFOV3t9?=
 =?us-ascii?Q?wQbis7TeVYXKiJx4OBJnV6DTS+O8Q4LktuTrrnIpBOu25wLF2so7FW9D5uAf?=
 =?us-ascii?Q?pyEdhBfwQOSZnff4RnkOwwp3sHH+8smfHDGeMis4OHED6IbMkgrmXAxDFNzP?=
 =?us-ascii?Q?Z7JfG7MSQI0h5GRHGsantWMG81VdRQNQPx/FxYtm9BNQOufexm02cZy1Y467?=
 =?us-ascii?Q?CGbkbYBWGPJDGrOWhab5oqrr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545d7e14-64ff-4ad2-944a-08d971e4db9b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:50:00.2613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8B6Q1jHr3aPUI6Ok3VDVPjv/PZrx0QKGxXgjLi/bPUBynIkpgkWad9Mn1m5XSr6vb1J5iPR5y07+3FB2S35IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7767
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

