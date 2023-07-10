Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1082174CC7C
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 07:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjGJF7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 01:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjGJF7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 01:59:23 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2073.outbound.protection.outlook.com [40.107.8.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C492CF9;
        Sun,  9 Jul 2023 22:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hk51H/bOOwmUVysJS1+bAtRGcFapvffOwTHSZyd4MDBkmNGxYAajaK2oRRtrnpeE426evLypLFudhzbALUayk9zbutGPRgYpGMj4ezDbAMFgxmcUCKCVjRniJSNmm9ammA8O2wU1KMZ0Go+UUYdisMZmzuGnbZEZRlTXw6noYWf1HKH/H1/dLdAn7k9jB60Ljp+vze9CUfdxBBHP0s4fVanuz3cxAL5pboIbCRFi888nCrRWb5ARPQdSNgNGJAqWAElvs8nyn3q70tYzxYoos0KYE9BSg/21KAR4y6wFD3n34Ocjfydv04ga1C6t3JLxF9w6tAvwuvgi4QfHr3FgBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jj1FaKeoMLzJFvs0qSM0oRymD7IV+UuWawz35w0cPwo=;
 b=K+jMgP3Cpyohir7/2iArS6WVWr/9HWFhkn9V5T077s17oC306sTj2hnVWii/87bUvDP1PF41uyWHKwzGG7vRJKouu4u9a2kDM/QkBpSoCj7Jy98UEoy/CwzdnvosJT0aqdpVQ/23SSJS/QyZLOPWe9UfSywyeZAB+xnzzHPrO2AJRi86xjRCH1N72KIkPrxW8D0ks2rXfdtM77rZcGuxHPeSCKFl+W3ds0MVPn0/QiLeXeqN8Azvvt7/5STB5hMfKr4QzhvKuXYhCAAK9jIpqFOtiNGGCEiQEdEcmiDierVxJkjjSoPcXE3hkumXCzxs62mM+maHFr/lTdqOIZhBKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jj1FaKeoMLzJFvs0qSM0oRymD7IV+UuWawz35w0cPwo=;
 b=BTx04/dT+P8XaeT16tNsn1MiZQiTTVj2piwiXNbdOsFoVU6l1B0kj/mv/eqPA+QAVN4QRM4CHY+rgQt6m624Jz/jA/xBLU5fWys6bW6rOm0Hjt7EIag6YfE9oFV0Da8P2gJ4omtVIQNlki35lEf6hcgTG0rZBdMH2oTbW32YnHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB9192.eurprd04.prod.outlook.com (2603:10a6:20b:44f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 05:59:17 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::6811:d7ba:d425:1d70]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::6811:d7ba:d425:1d70%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 05:59:17 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com
Cc:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        alexander.stein@ew.tq-group.com, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, conor+dt@kernel.org,
        jacopo.mondi@ideasonboard.com
Subject: [PATCH v2 0/2] media: nxp: add i.MX93 MIPI CSI-2 support
Date:   Mon, 10 Jul 2023 14:03:50 +0800
Message-Id: <20230710060352.584286-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: 8146c224-3fbb-4476-78d6-08db810acba0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UpFK45T05q8Ch/4P5IVFsFoDqJhSi1Yn1OM7Yi9jS9I53/tIj0TetAIYq2uERxQRnVMdPdMa0c5cn2L4UajIXiu0GhjPxf++cpCXlSiMb3XcX5EVfKJ4eyubXtCipC4FSQTmfV7Bo2vQQ8ChLS/kmICAz7lEIM1guBViKZ2FMfz4EoAwHPtNkmDty9UaOT2gQzHmsgtjQ4aTzqtOABJQz5aU4LMd5YYR5z6jd1HVCeAsSzA5k6z+Y07mhreOLzDRCpqpKz+es2m8UL33CWFbxTWNzDjp9iBekQ9/H7Ya639BHzNnNhBg+w1LswmwbuiWAsAqMS5w8puw4B1Vv1jWt32QEBcSancRYh1ptODT/rIk+r8thzEGvUu3EbgwLIbklIo3+t8fp72+lVCrDa2NgSyH27I7rwfk7yY7U6X1iHEZ5A+u/boU39cNxD8OqZxKeMdBXS6pvIUJMhI1koA9vXImS5IhvwfWALP/r/PS0X5RorO9d/0Z5wdpuAa58LIxAN2PbjiU5dcNs4L3t5NwAU7uooPHxuqG//CNUJkpYRnke1q0H1ahLFPkn+Tt1Psnw6GCkCLkBk+pACJq94h4GeSDQhDB3USV0+dEUJmt0TGPnN1P5r/k/PTpZJDO+pnZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(26005)(186003)(9686003)(6506007)(1076003)(2616005)(6512007)(83380400001)(41300700001)(4326008)(2906002)(66556008)(316002)(66476007)(5660300002)(8676002)(8936002)(478600001)(66946007)(6486002)(52116002)(6666004)(86362001)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GJbzexXltbmI0kJcLmNh+LvNgFJHNx7AtpAk0zNMWvrqId38l8vIINh3PbBZ?=
 =?us-ascii?Q?NaOO7mWzi1ATRTgkgSK/71BweWpSaoUgYbpxVx48a04K7MFTcyaw283r30ek?=
 =?us-ascii?Q?1cjZ5JqR/hX+cTcdEF5T9rOYdl9BYq3+gmKGEFa0WhwxUcBUymOEeL/r2Cf2?=
 =?us-ascii?Q?Dl+W5MAVFM3eLPUCfMzHU1IGSkJoZJPj6m3DVOtcQ57VzM0hysnTkCg6MI7n?=
 =?us-ascii?Q?8X5nq1kMDBI/ecupTuF6FNI0SbB0l3LNn7XSxkM7BHCIxxAcZVA9lJdE/UXc?=
 =?us-ascii?Q?sWq7SphvU+5Wj+gPrqzZxL+baUi3IDdxCxRLL98lZ6k17e0PsPXeJJx8v4E0?=
 =?us-ascii?Q?Kgx1DWPs1CEFod41Gm3Xv+gaQUq4TQhRYOgil4WmB9Hl+IIrRGJ/vU5RuVk9?=
 =?us-ascii?Q?RMBqZuxpDEmk5q92OydUg+qZZjHrBpkm/y4Gz2Ho6KkD/6m0pKlzcp8j1e2j?=
 =?us-ascii?Q?YBJltbNTQRx2VACMU7UxHqAkGtr/g9TOYQfd9a9pq5OmAG0XGg4b5se1pn8M?=
 =?us-ascii?Q?PDc+vfs8OqrXSLQj7/aa9s1ujC1Noa0n8Mobdi8HbCTf7CaIy4eyAl4gOX0o?=
 =?us-ascii?Q?eW8CZJD3wI0VLZARiuzU7PzRF4qYFeVzZaLRahQfYInFHOqHy5bRp2nLORFI?=
 =?us-ascii?Q?Cn4pFzSVRP9CNd6sGLMMLMvrOn0cWCJx/Unvj7GzDXYOn/M5Czwd274ohQes?=
 =?us-ascii?Q?Dpf7GXF++GseaJMXv9GQeFsgPVfpD+bN19rkKn7Qllrvm/Oa5MsLNe5I7dj5?=
 =?us-ascii?Q?MCT8C+2qJLAflkHLamJiMXlim4sxPIaLPza5XfJ7m1g/tOAdCOoOVhCDpbMx?=
 =?us-ascii?Q?PKlgupYai13Scxm73sNsWNtCiBS2+mjwLzWJXX+bpb//oEVp6xBfY5SMj9Zk?=
 =?us-ascii?Q?x+rmrEJX/z3E7rSGqCvuQopuh3kK7dSqUd69MMPmQKSz13pyo1wDhH7Q0sIK?=
 =?us-ascii?Q?oorY7HrrwUX2SJnxvCqllkk9T6WHNavYVjdbCM5za+OE+oFEJmawbWgVlfaa?=
 =?us-ascii?Q?JzlpU7wW91g/eQp9CHoy4dfB/z2WhbYhEb+5TtGBIM6Fy5lnBMO5+hyBdUYA?=
 =?us-ascii?Q?3prYQjxUza7voIf0t2z9tX9BHCNm40Dcs0pxwrVwKs4tg8lv4strf8SK2/hy?=
 =?us-ascii?Q?lSFqVtV5ho46GZMVQuBPr8kGxDmg2hacATqLv+/PEMnclMJ6er/zb2jzMiL9?=
 =?us-ascii?Q?Q690bzJWggNTEnm8Pg3Z5P1NGHiPE1mkawglbum6H/wxXJKE1TBCnT0Vsnqz?=
 =?us-ascii?Q?eTww9D/f8Kvau6CmC6EgO25i4Rd7SgZlgSnrQXI2/auBL5RqUyFxUDXak9Bi?=
 =?us-ascii?Q?tjhe+ZwabjUFz3MHugnpADH9ihaUhePMUciIJ7F2jzSnEq2nsxNkFhUZpyJ2?=
 =?us-ascii?Q?uTQgqXOsiNlqlHlAOic5e8CBAkzkmNwQ2O/+5yHYGzKQPyCNbjIRskxYS3oa?=
 =?us-ascii?Q?wfZTyW8ozRqqow9d96z5+gYc8sop9ButYvxdGFfnDIb4tiFKivtlt3aUVEIF?=
 =?us-ascii?Q?IZmAV71Ky9bdUoaDi6OvcX0n1Ufd9XJHslirbkRzuUeW8w/Zo/nUEf9SUoNA?=
 =?us-ascii?Q?FbSI8+5ZZsSAfBYHDADwo3xUr9DKO/oXd7IzQQlP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8146c224-3fbb-4476-78d6-08db810acba0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 05:59:17.2001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8a3ntQMhzEe59yL+Rk0xq+nQ7cFZ/wodotYAzTRwI995StLWl93aLJxv2txtOof1Lfe8lpQjvr0yrt97HocXrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9192
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Add MIPI CSI-2 and D-PHY driver support for NXP i.MX93.

Changes in v2:
- Implement test pattern by V4L2_CID_TEST_PATTERN
- Remove fsl,hsfreqrange property and get hsfreqrange by LUT
- Add subdev test pattern event handler callback to pass v4l2-compliance test
- Add spin lock initialization

v4l2-compliance 1.23.0-4996, 64 bits, 64-bit time_t
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
	test VIDIOC_LOG_STATUS: OK

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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0
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

 .../bindings/media/nxp,dwc-mipi-csi2.yaml     |  130 ++
 MAINTAINERS                                   |   10 +
 drivers/media/platform/nxp/Kconfig            |   11 +
 drivers/media/platform/nxp/Makefile           |    3 +
 drivers/media/platform/nxp/dwc-mipi-csi2.c    | 1354 +++++++++++++++++
 drivers/media/platform/nxp/dwc-mipi-csi2.h    |  299 ++++
 drivers/media/platform/nxp/dwc-mipi-dphy.c    |  295 ++++
 7 files changed, 2102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
 create mode 100644 drivers/media/platform/nxp/dwc-mipi-csi2.c
 create mode 100644 drivers/media/platform/nxp/dwc-mipi-csi2.h
 create mode 100644 drivers/media/platform/nxp/dwc-mipi-dphy.c

-- 
2.37.1

