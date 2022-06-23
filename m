Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFA8557DE7
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbiFWOcj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbiFWOci (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:38 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7654578F;
        Thu, 23 Jun 2022 07:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSHcRzYDMRKUJ6Zaa1cWqkZcSFnb3+g1yVKxOUECviT1haWAMV8OD/gy306cnAm629/ocEV+4p7r9QCvQFRgimF56BxHQiSzbhrMy0K8QukRhB/ie0bQitjq5IBLi9iuU9xTHG3fs6wFzTgwky3cpN2Rs+6cBMVwGOILZNFarA5OPrCqtCaWwwicTnMnoNEU1ovJdJIrtqr5T+KxaUEAFB/5HLt9wfgChFqtBKPmPq6oD62dNy6+0G4KlKsp/KwsMfMoYEZDvk8vS/YTc6efQndX2AMJWKGHPvTMj7vwrAlZM5D/bsK6B7MzCjUPyu5RacsRnjRP75PJiLlOwlNVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULeSZlXrL0YNE2ENtNtpWOEKX6Eein3Ov2R7ib1O4KU=;
 b=AyZj8HkwJNNl8b2NyUaGUYomevoSiPW/jv+LqTamA19B1yJJQzoDk5ulmIqihQ8i2QrYNF7AkICiuZbTWveicgzQrmjsSCSR0WOLLTXC3yjKrCSNSkMYdKbYvK496dfbpfQu3A9zBY+4CgVu/r7rhzVVtBq8csqJZwaja6KpdSMmzfBc+Sv+wnYh5aBWv+tcD2qkItVsjVUIPs2XlMN9KHeyIVGcIdIdkpVn39imTOwsmAfvaEkIoH9vEIv65sphY0IXnB8d1NQNYT+iYpE/ukQQKoccou3FEMyHjg+By/weFu2csaMvcsH3gdUSRdR9tMt811qjBWKEibBM5bdgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULeSZlXrL0YNE2ENtNtpWOEKX6Eein3Ov2R7ib1O4KU=;
 b=LAn1xhU3z88ntNgp1/KD1qlzCQOWYru1RUiqXC1OGt+W3hxAGS0J8dMAFzvmZABb9iPTVVN+Izi2G+V8Vi6F9fNNOTtxB6yl8fhLHtllsMP36uUjj/lZKh7nb+jjoEifA+Z9JX4mSeYZUEqXZgkvA5JOI6DSYUfCrOeIdl44VOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB8PR04MB6505.eurprd04.prod.outlook.com (2603:10a6:10:10d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 14:32:34 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:32:34 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 07/14] v4l2-ctrls: add event
Date:   Thu, 23 Jun 2022 16:31:08 +0200
Message-Id: <20220623143115.3185297-8-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
References: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::14) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: facf5141-af7e-4692-406b-08da552536b2
X-MS-TrafficTypeDiagnostic: DB8PR04MB6505:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6505C99BA50159C5C905823ABAB59@DB8PR04MB6505.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MH1WG4CisE0h5mdJ9fnBLJPIjE+gm+ijeQAXBhEML5dHKswefzmNd4YvLaHKrPmnCf+gdeepkF58MWr00Y7e4bbbHu9WRzkui3WDNk5EyMK1KJgt90Ia0822bNhtgxz7Fopao5TxpOU1Eisu9YEJk3nCzqyW2ymWP/fJnyM0VL9x2PZRugdU0nGBWe/6t93HuES3Sduo91I0WsKi7+Jv+t70uoYroNYUV0JmbkD7mkWC4zMnr7iZdMaThJ1mkNFtPmQzd6n6E2b3E4QlDVSaRZ0ahGXjKDIb27haN+lekqjTJqGoFK+Y5XFvuiwsUTwGncZgN8XDLWyHhNLskckALSk3sIHlf0T+gfQVBgBiLTxFNhdI+G2g7ARxwec7xXuaEyVl9OISpukzt3HUunGxPyCy8yqjbSw/6/AXPzb8m3V4mULbmOGdk/MZnOmLEu7/3MQM5CaRHnNh8Do8oBkpmNwvnWyvY0hJ/h0Pt1PfYGNlhcb9as20TFMQc9hXmd6eoCG7slu4VqLc+ldBg0Fe93AzOZaBjvBdQFAlIb9oDsAF9ZXo3eEpwvG+uWlMdI17ktwenlw9edGpxYz+KTqHqOmMMdwQ0BZBef5K/qD9be55A5sF/QwGu1k/+2D7IpvpqHIoBNz3Fgf/4hamQMG2ESQRfEe6Mk4G7djsmpl9UU54iCMk3zljU6fiGqfMMj38P2RG7R5JmAdMgElgGUP9iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(2906002)(38100700002)(6666004)(66946007)(86362001)(1076003)(66556008)(44832011)(8676002)(66476007)(6486002)(316002)(4326008)(478600001)(6512007)(5660300002)(7416002)(186003)(2616005)(52116002)(6506007)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ob+pt5El9u40eo6eWf/pGpMDFv6P0MqdwVTJIEDE5beDbMG4tC0O7+6Opeu7?=
 =?us-ascii?Q?mTcotDE5g+B1ILN55Bo7ogNq0nXyh9e126n6mJnUhip8cTexkdlypO4ReOGI?=
 =?us-ascii?Q?q3mSMVeEj2FleiYabW8cxbxbtmYnj2rch0TLSIBtzvCeiUpWBu6ujKxw3nHH?=
 =?us-ascii?Q?qu1jnWbjCt/eWK31o/uxVEC/24KuuVFE5VAWIQS5MBM0TjwNEM3GDw7xNXBd?=
 =?us-ascii?Q?0dWI1Lw9QjC57W4n0iOMw4SXmam0nh0xl+JUoI/S6qrMgh2mRbGdwwf6YUyK?=
 =?us-ascii?Q?zsSNMa5rBg4SuUCb4vwXEverRcC0f6oivdxG6hAOmb8jlfmprcBo/luPe254?=
 =?us-ascii?Q?yJs8eqlxukVUoZU2tnCZ9scvvkSwvqAk47zEv4t6O/H154Cdnwf4rqr6I6mu?=
 =?us-ascii?Q?p1w6fSmy4M3YLJqGaNG7/wvgh3wKAfBlmWrcUx87kDdGF+HeRyAg9UqvQrx5?=
 =?us-ascii?Q?8iYDRlM3un+hnq+NreR70h6I9seCPCbX7DwvUB14Y5i1gg83LvsXFTYwNo/3?=
 =?us-ascii?Q?5N19WwAaO1BihQkpSRLkE0cBMCCovAguEb6vhg/7wOzI2F2CPUUOerfIYVuq?=
 =?us-ascii?Q?rpcLfbvzqwz5ZQhYwUhRepCigUjfgRIPB+SZDYxd8IpGRopVP4orQzUjz2Am?=
 =?us-ascii?Q?J9XUQR9hMV+EeGCIoAc+KwPjFUBFt1b3VbhAadt7OKFkp9h90d1nEei1SLCE?=
 =?us-ascii?Q?0zxpDi1DXsv1qlZfqTYDaMTpLxi42C/W+g+jwtWg2aw48H5+nMSAnBBij3PS?=
 =?us-ascii?Q?wyxxnP5jnrw5Y6wbZuiaJzFM3Txs/OnE+yUbYJVcJwU8hjSzrq+O1AvbIbCu?=
 =?us-ascii?Q?iS5qtyn850ANFZvJd6NEf8tBcL3v/hlUiPyRydh48YcDQiZ7Dw26y97JpHU2?=
 =?us-ascii?Q?wZNQXRZcgod5K9nQKzANI/FeY9go7QbymOX1+q0l9wShXnGpqjqbUOh6oItL?=
 =?us-ascii?Q?HtXeNxP5Z4c81Qffj9iIs8TM4fxuOovsSKlZioSIkC6oLk6xwsggqA3SuRkP?=
 =?us-ascii?Q?+EA99bpwL7dmghgOzOJhhQLHT66CoEHrxyMztyPkwhRKtGLkRgHh6lNyceVB?=
 =?us-ascii?Q?DeVKg36WHn91+vEAZYR1oE54sLdSaZTMM+pjnjMmf+EAtr9CdlJ6Ern5Oupy?=
 =?us-ascii?Q?GPXX+Ivqr/X3CIAWO3FjDRGPpXcbjN9cMufmMhLKx97inTv5m6/aDTY/Q/sk?=
 =?us-ascii?Q?AXPIv+EiUEMQqFqj0l/ecTbZHqVIJ+si6fUxil1/EC312k8adsUjqq69g6zF?=
 =?us-ascii?Q?/CuaIcNk2SFOfpukZdMr0KB0ORVJ2h9lbzJXYR/x8wk2kl+Z/jwoRAz8GQhU?=
 =?us-ascii?Q?f6bw1uT4Gk4VSYx1gVTSvn2BJsb7vEzlTP5EsCobDdQroFgx7uTBxcWn89DS?=
 =?us-ascii?Q?JGDXCkfBpm5vhPRD2xEtVb7QScF3k9BA8eESn70FVnvJHsrcXPUSJK2u3AdW?=
 =?us-ascii?Q?ENZgoFALnkYjDl8ZiZYD7BpXmkpJtixLZY7RF/E5/QpAfETQTIQqrXzwMhPS?=
 =?us-ascii?Q?dO1MipupMzj7LFCqeoAkdgvu4uGygY5aoq3UbmW6838Y+2YniPCWTwK3cTzk?=
 =?us-ascii?Q?U1/O0p6K5oP80mYnZdWDTW6wHEj/qEk3dy2nv9nAQrhe35Qo4zrzJdQ+I19G?=
 =?us-ascii?Q?WJdeLluKvH4YQqx6PlDAjJ5UFPw0mz+yEdLUwv0ayQU5bGMTntXXqQjzVyne?=
 =?us-ascii?Q?rOp4W37CCCmiVGArINz+pCRFf8iYppBR4tqakIp89hmXB+D0mrgwVeY76Iy8?=
 =?us-ascii?Q?EUX5Me6AfwHJgSyN8InYGyqgjmxC8iEPXEL+h54dgte2A0w+8FDFTZIYLq4K?=
X-MS-Exchange-AntiSpam-MessageData-1: CaILAGk62DIgkICwO/ffMCuDVNHrydllJ4s=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facf5141-af7e-4692-406b-08da552536b2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:34.8179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NahM0AWjCfql/e/0ny6cGV6anCw/MyOW2MKuyOJwl90F4xU+fgxhg30IMBiAB8fZ/eVB/bMbd2K440288hGtQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6505
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/userspace-api/media/v4l/vidioc-dqevent.rst     | 5 +++++
 Documentation/userspace-api/media/videodev2.h.rst.exceptions | 1 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c                     | 2 ++
 include/uapi/linux/videodev2.h                               | 1 +
 4 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
index 6eb40073c906..8db103760930 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
@@ -332,6 +332,11 @@ call.
       - 0x0004
       - This control event was triggered because the minimum, maximum,
 	step or the default value of the control changed.
+    * - ``V4L2_EVENT_CTRL_CH_DIMENSIONS``
+      - 0x0008
+      - This control event was triggered because the dimensions of the
+	control changed. Note that the number of dimensions remains the
+	same.
 
 
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 9cbb7a0c354a..3597a354dc25 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -505,6 +505,7 @@ replace define V4L2_EVENT_PRIVATE_START event-type
 replace define V4L2_EVENT_CTRL_CH_VALUE ctrl-changes-flags
 replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
 replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
+replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
 
 replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 8c49961c47de..77d25003ddee 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1017,6 +1017,8 @@ int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
 		ctrl->type_ops->init(ctrl, i, ctrl->p_cur);
 		ctrl->type_ops->init(ctrl, i, ctrl->p_new);
 	}
+	send_event(NULL, ctrl,
+		   V4L2_EVENT_CTRL_CH_VALUE | V4L2_EVENT_CTRL_CH_DIMENSIONS);
 	return 0;
 }
 EXPORT_SYMBOL(__v4l2_ctrl_modify_dimensions);
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5c45ca18fac9..bf2fedda32ec 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2397,6 +2397,7 @@ struct v4l2_event_vsync {
 #define V4L2_EVENT_CTRL_CH_VALUE		(1 << 0)
 #define V4L2_EVENT_CTRL_CH_FLAGS		(1 << 1)
 #define V4L2_EVENT_CTRL_CH_RANGE		(1 << 2)
+#define V4L2_EVENT_CTRL_CH_DIMENSIONS		(1 << 3)
 
 struct v4l2_event_ctrl {
 	__u32 changes;
-- 
2.36.1

