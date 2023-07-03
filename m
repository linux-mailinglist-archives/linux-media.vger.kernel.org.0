Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7266A745B2D
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 13:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjGCLdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 07:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbjGCLdH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 07:33:07 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2079.outbound.protection.outlook.com [40.107.105.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581BCE59;
        Mon,  3 Jul 2023 04:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFK1o7Ak/lU6o68Pls+ijIj/E+07a1+uNd1GI50sinGgdxqKedS0oVBRQwHC878hucyGzDrE/YCjRDX6JqLhX+ntRWPZzquQpFT6iVI1QuFfDuzcBpOXlH/aFED/cIXHEaKAEZ7jFKOfZ/OQbwHnGP9P4famuWppuXrnPBA1NaZ+FL3F9qAZUTK9smHD+kxAM81imw5M2xG8/kx1jd9bJjvk2MzMJLVtnNaCAWc8BP5vEr8Z7gveHcg1VaE+GD7XQFYnyo235m7Nj0THlpe0FA/WtYg/w5oGL8AYAsfc61UwvZcdbp7nrwFylztSTYJLBE7sNmZjJQt09iXKuLDh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOpryqmqQar6O6WWQRPFsHYityWNNjD6Y/c13ueTlPE=;
 b=Uhtn++WZZGww3E9wDDTsd7J9pgvGCNfudHLYyqSNiIttBnTq0qVQ2jyyiSVwPKtNd8giL9WVJ4KneRzYtX6UrJ3FzeJ5dM0nmAHKEazwNprTKbntYhFyML2oAwiwuhW76VPgA8QkPYjmkKp12NrkUBCBDjGHN4eXfSo8YbTvRbJlBAISRfYLUmufai1thzDJyN+zk2s0FNJCeCfM+6ACQbb9/ivF+L0IfdWiYfk6OS152QTPscSqaggZ1+1Tq4Gy+ufXPNK7uPGt7WjeKavPgLoHwPqUXXmDdQXEH3HCITObyclpxjjIvPPs+Rb1TClU1H0BCSunqzJ4AVwnmyHiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOpryqmqQar6O6WWQRPFsHYityWNNjD6Y/c13ueTlPE=;
 b=SBcMYKxI+YzFY0sOtFSZwoF7Bx7P4UVm0X2yTYQKbAKPS380XdVpvcSRSiTcbeYwnutm32xPYYyS07wWLilRPqOZSyu1pmgt7iRWt7c+emTBExG1Je3Y7SW911QjIkLlBgPVFJru1tqQbDxr538ELSJ9ogRaY3OLTgGdlUxn0uU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8502.eurprd04.prod.outlook.com (2603:10a6:10:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 11:33:00 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 11:33:00 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com
Cc:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jacopo.mondi@ideasonboard.com
Subject: [PATCH 0/2] media: nxp: add i.MX93 MIPI CSI-2 support
Date:   Mon,  3 Jul 2023 19:37:32 +0800
Message-Id: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU2PR04MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f4c872-ee98-4c99-605a-08db7bb94161
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZEkAcbJpd3qnIZvktgpUOnbWhHTNUoIejCKD3FABRm5ZYjbJaQI/j1pCUjKBjomZNaOERH2MLSfsCiNm18dINXUoHkseb+pa9EoHev/28ZEjMEVU70eVdkhXt4DOS2JQ9hcbDmt66xE2BG4TMkp9yAwgNznFEHnkPtTXRyOpu5ma9VsKYWnenzhqM+WD5MnhQ9fd1lyvPLZKmxiLKEJ9+lfusJsQOwRe03ldARRHfEoFc3VyBk6xuBzlfKSm6duQrESTHn2KBh7vfEumx/C5WDeFpRzzzAP6m1x997UKmSlgvB3d6N5/P+A1ZForl11yukO72xcwJ4g/1pMLIqiKltOp83FCNHfNfzMmPOSLA66LZRFkFAI2GwgtCc6tk2yN11i66+qZcTtvaIO9+LdQzVxpwQQ8WuL+k3MZyLLK4X2hrCyfG4E67iS7dteXUB1yhnVMDbFxV3T/5f0kDpseM9OKVBwO+i0W7qmLLhCCokpHcpSemb3V0Gry0WmnmZINry0zcneaQ84n7O8yLzTntCcwhATCQZptByyobX0rpKphOQ+C1jXrH8sdK/kQfwkMM7hnw5QqKmPCZyTueuRiTDm7OFsP+c8thJF4P3jCGR2DCFdpJctWsb+I+G9+mV9C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(26005)(478600001)(1076003)(9686003)(6666004)(6512007)(6506007)(86362001)(2616005)(186003)(38350700002)(38100700002)(66556008)(66946007)(66476007)(4326008)(83380400001)(52116002)(6486002)(316002)(5660300002)(8676002)(8936002)(41300700001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0mHkto4fKk77+2UnohbtcaS9gHCf2H8pNogWQd8hYgB06zAoZB3/2CLx3b0s?=
 =?us-ascii?Q?hHRoO/ywj1WxoeQZC5lLvE6cHlMuxcRz2YnmJ5okYIc3E1+3TAsoxYKGMI7q?=
 =?us-ascii?Q?IKQxFzSDKeEC/l+1SnvQKRIGuY9KZKRSjAyZkBWGPv84+VtBNnyq5q6mYNvJ?=
 =?us-ascii?Q?49CdfJWgTX8B8GyrtG4HQRKUL5KHTvYxpFuivNEz5geJARVj0+YZTE5dSQ3r?=
 =?us-ascii?Q?R3UM9Z9R8znuVZDPJ0B6Tg4s421D35RtHEEe6H87Ng9HrXUgDfEmbWyOaLL5?=
 =?us-ascii?Q?6xfr6ZrAAyAVVXJcs7YHdar5uNgsRdZ+Wpg1TWKoSTWDprOaQ9f2NYiyxmha?=
 =?us-ascii?Q?cQmqsSAohBYduhZtoAbeSjK3AAcwT+2m8ZGN6njqQKOusw7D63c1nwdNzPVE?=
 =?us-ascii?Q?dSesLkxV/mygHguzf6iUqKP3hJP1kOQSXZ4MUJDd98VBGYtIM+cbu4Q3+Emj?=
 =?us-ascii?Q?Fw/zaIREUtyHaon9EIRrUEyetU9zfz3mnXeXMYH5TC2ppI0BQtumm4qDQQSE?=
 =?us-ascii?Q?bqg5bw2ibXex4jMp05iSbMYqMVKpTqh0q7y4zmbMxDvA/VhINbyRoz8yzCqB?=
 =?us-ascii?Q?DAFuBo87RwAehUgwmLLQW/tk2BNzkFHlyqqKIk8sfNVFD/q6P4YwxHdIzbPo?=
 =?us-ascii?Q?9z9ZOxVFBGBnsDFg4XrSRkWnVYRdcWtLRGwdPjspOk66oQSc/GTakcV4WxAO?=
 =?us-ascii?Q?lmPOdp0u/8iC7qdfJngPI9qJBDvx4biZDxXbkdKVQdFhzcCKY4+nCv6CAB+y?=
 =?us-ascii?Q?yxonYDv7fEbWzb3s9Gu+FUH8iHp+0KO+wDPFDKFjxc6Lpg0fI3FhFxNEK7pA?=
 =?us-ascii?Q?t2TuU5voFKmzvlP68sBXbLYgF1VjzDTyrL9kzjkPnHMhMbVjaJFIqrbGiczF?=
 =?us-ascii?Q?au0QqXblSNx+HrfnetNFrBqJR1EekAI62M5+b2tOgsnc1fMbmho+lqfMNoa9?=
 =?us-ascii?Q?FQvfBkbAfBW9Q1NeqLlPlGI6d4J0HX647OiVlKv/fHG2p964q2a0nGuSnkpp?=
 =?us-ascii?Q?k2LBPidgJ4EezSdG0Uln7n4H1oxp6J1iVgShL2PzGmDnHYA3LAXQN8rnkx30?=
 =?us-ascii?Q?WS6T9UUVLE4LJsQuIeqBY0RaHOG16towKBX+atCd+je+tQAc9lczUy/tcOlO?=
 =?us-ascii?Q?QYixvHJq3lqSjzCnvU7h5uDLXh+iPpblFhuY2bXajz0nitdp4Dz6L2EMfTeo?=
 =?us-ascii?Q?ISG0ql/jkGcAfloz3tn3cRQuI6FlPbrruIC/om2rAPUidc3oYMZh6Av/yr8J?=
 =?us-ascii?Q?7VF/UApkma84HD3A92lyZdzSpImhUyapf+NW9iSJ0RR9fGLbqX3hZ9ZJGred?=
 =?us-ascii?Q?+9ProrXDEJIJYC9rFUcEP28W9HHDhZwnXOSybG1pB4YoCHs8eXKH+ZJnEm9b?=
 =?us-ascii?Q?h/fRE10vYg1fJtQ116DSJJgZhj/31D++/mXPQ5mOzDbtOOys/nmOWEKtYs95?=
 =?us-ascii?Q?hb/9U4grTsX1s9WGwDfQyOcLV7SRN793SCDthoB4x2SVR1c6gMN19nrFg8XC?=
 =?us-ascii?Q?isCUEXKOGsI4Zy2H7gg07MGV368NFPlS22+WifNNAntVRfNbnFWFEK2R9HBI?=
 =?us-ascii?Q?taGH89Th3mvEDMF244vQPKvu41QUpZfyItkTZDiZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f4c872-ee98-4c99-605a-08db7bb94161
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 11:33:00.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EXzK2Zx/OiF8bzeVCmo2ZfDDlNkhJSg9TmvifWP+8EraEVa1AUrJs9B8MDj+oImRIg04PYuzIROVGBi0mSHkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8502
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Add MIPI CSI-2 and D-PHY driver support for NXP i.MX93.

v4l2-compliance 1.23.0-4996, 64bits, 64-bit time_t
v4l2-compliance SHA: 9431e4b26b48 2023-02-13 14:51:47

Compliance test for device /dev/v4l-subdev2:

Driver Info:
        Driver version   : 6.4.0
	Capabilities     : 0x00000000


Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev2 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev2: 43, Succeeded: 43, Failed: 0, Warnings: 0

Guoniu.zhou (2):
  media: dt-bindings: Add binding doc for i.MX93 MIPI CSI-2
  media: nxp: add driver for i.MX93 MIPI CSI-2 controller and D-PHY

 .../bindings/media/nxp,dwc-mipi-csi2.yaml     |  140 ++
 MAINTAINERS                                   |   10 +
 drivers/media/platform/nxp/Kconfig            |   11 +
 drivers/media/platform/nxp/Makefile           |    3 +
 drivers/media/platform/nxp/dwc-mipi-csi2.c    | 1384 +++++++++++++++++
 drivers/media/platform/nxp/dwc-mipi-csi2.h    |  289 ++++
 drivers/media/platform/nxp/dwc-mipi-dphy.c    |  195 +++
 7 files changed, 2032 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
 create mode 100644 drivers/media/platform/nxp/dwc-mipi-csi2.c
 create mode 100644 drivers/media/platform/nxp/dwc-mipi-csi2.h
 create mode 100644 drivers/media/platform/nxp/dwc-mipi-dphy.c

-- 
2.37.1

