Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CA23D6CA1
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 05:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbhG0CmO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 22:42:14 -0400
Received: from mail-eopbgr50057.outbound.protection.outlook.com ([40.107.5.57]:39437
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235034AbhG0CmH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 22:42:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJI0ROITKiK5sT/hpwszEevryvJ1OYHeAtV6TwZ07diCm7GD0tabX+cqH6QrkdqVtk0lTqEQbQdfAadKs22uZRWmdIAX15zKkWwCOEPFqywE0EW/fYEJLD56xge6X9EiD6UkeFcb8+scMCUHwbEALxgnj1m6YuPil7XGS3AE4W4P1bpSTRJsSv/Q6CY8rNHXpoHY3WM7o116WDyOqh6XVoQVaTSRh24riOa+OhPKjR7GBspSGISsryriFKZEyeO7P9jqL1RsBQR6I2ak1zn+WL2vbev0XlS6TS+UMB69KIHAVZTShrupw34Id5sg9pwutiaJ2KLqZ7pb55ME36UUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2AFHzhh3/QpoqVOQXiVzYQ8CMWbBK+s8NXbBzE9l0g=;
 b=egoVYZeat1cabJhUE/G9Odo1nDjtMMCYubWvaFSBRAsbUoNOApjeRB5EJ5cL/N8Pd8ccz3evEd0KkFQmOL71Bqpobkd0NiFqyuFuAXyrHRcmDJ4wVtPJFAPV3Q5+ADzBBKovGOUacM7JqoQDXd6OJRK6MMLiDAKQgzhPKpcm6D5Wdk7351F16BgdwWmCuE2qn4YCSs2PqpqPm7RYdpTAp5TzZUPNBOoYfThS1Lyx1R3VKMwH1jd05ys3/7yzbFe+Q2YcZtwqSONI2e9MNlyM92HSbDTN8TIv3gmKipFI1fIi+RA9mypu1H5bsaPVurdpe+3+9vArDKgRR02sp7ExHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2AFHzhh3/QpoqVOQXiVzYQ8CMWbBK+s8NXbBzE9l0g=;
 b=fwI9i5fVjrBd3PilB5UfLzjABIB8NLfg8nMG8ORmc9801EMCeMjz+q2ZyY67PXbAVPSgDSZJ1HJtfVQnPhIhTbv3VRKjlNIrg7artfHfDGukZ+0L/cl6w18OsdVgs0f7iqQfAvzwriWGtEw3Q2vKBEGfYibC/NIeLtGAoZtglNs=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2660.eurprd04.prod.outlook.com (2603:10a6:203:3a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 03:22:24 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 03:22:24 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 14/14] MAINTAINERS: add NXP IMX8Q VPU CODEC V4L2 driver entry
Date:   Tue, 27 Jul 2021 11:20:57 +0800
Message-Id: <6b6a77088f2bfc7ed6ca7418ee0c029fcac8ce96.1627353315.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1627353315.git.ming.qian@nxp.com>
References: <cover.1627353315.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 03:22:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b33ad63b-1b60-4e5d-9f59-08d950adc065
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2660C35B2982DAAF9360F91EE7E99@AM5PR0401MB2660.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: we1IEaPTFshivpGriPaUt/eBbFsrJZzRDJ2lowCHr7S8j9Y8lkv5GpG+TaNT8o9igw5rO1rZRaTKT/bfIklg+7gc5SYkP6ZSsMxeWDumGWvWTHZqCkbHYmwshGX6vQic+OSJzJZ2MdVqkBJT9hWMDf9KwSgNlgmKrO1tC3jrUCQHSCkD8p5qNrjh49uX7ivY8Hd30HS4e9IPmJ2+OMG//H/guTI0kXqBW77sfEeTxGdUY6eSJ8v5y8BT7s2rY++0EtsGH0TiWdANW7KnMyHIJazvKvBkk22A3VCrJ1w3IzN1qqVxeIlHvEIi03vMN+KHJLz1P5hJ4WM2ldw49G129J3QBcoMDbmUqT/YVF9aBFCxXP8yPx9MmKUEmjAGH8CViTSX9oOW3arru9lkI7ZA+wF5t2QRKh+d9du4DCTIoKJMM5NRSva+MMthsGxhgP8oAIUvUfjRJzraKR+1d7W3opkwOREwESJLhZ9l7aSSw2Z/BdDSwJ76QAm4qxmgssOPfOailiFPH96no/+W1UgaUBl5fCTqD06Yw8tPT8UFyYLD464596jUek+FL8ySKH+FpnZwXX6T8nYFmhC9j87MotAmQjdYvaKlMtKbmcMoKtbgRtmaR2G5guUoJe6m18uUQJkjL58yp/DvBnEqMsYW7p9DtUWHtFhx6BN+Vf7Kh9jSRu6z/RE3YXmzMIbSB3fe2x3PxumVcOSgMrwyZMsmgolT6xKmOQa8KAAsNnvwgIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(4326008)(7416002)(66556008)(38350700002)(6486002)(8676002)(956004)(186003)(2616005)(498600001)(66476007)(52116002)(4744005)(7696005)(8936002)(44832011)(86362001)(5660300002)(6666004)(36756003)(2906002)(66946007)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rxz87oLX/pP/MheIISwZXbdf42/vjwZWZXceuXZTgabPtTGoQCsw9hc3pKIV?=
 =?us-ascii?Q?5gmgM3R2VX4o+tP+Lx+t1nnnXDxFclAWSgAZUvE2w6AIcNBINdaU8zlh/DPN?=
 =?us-ascii?Q?SPWpiQX+1xukA4ugy+WYdOTpdBArVIqUZeFc4LN8IKXPRMWfQi+0SzjqaQ5k?=
 =?us-ascii?Q?ynqcZFZI/gNFT0PMNNpKeil/H6ZDwbzW/6Rxt2iudaDN+N3P3cMLQynx3p4l?=
 =?us-ascii?Q?O6pFxp4Qd8m9Wnr+4g2S1DV/yhDJD88dA/KBunbqjdoAXEIg6WgmOz1ROoYE?=
 =?us-ascii?Q?8ClqRWaw+TuAGjnDjh6Gw3IQaeu0ZM3DA1kDcIQISbOZmvLIAmTCHOB8qo8e?=
 =?us-ascii?Q?xAd0cRdtLEiosmYUyRZPw1Ec/mPFiEdy1ET9uPhz3Ov9uomXuLQDD+stzTP4?=
 =?us-ascii?Q?rzXAdFuYc55bMia7o9mRfK+V9S0HwpxYci1Qd76B52HtVAjOB2O5a2K3xaJm?=
 =?us-ascii?Q?JuRqQ5b6hE480852L5ye8B9i6CTlQW2BhN62ul6rGFKBliYdabn7q0dFF/o0?=
 =?us-ascii?Q?55fdoy5hKY0iZg0TJPIRz6RiEY44TMBoPpk6hJon2l9o8taIGkU4zdYJANQ1?=
 =?us-ascii?Q?FmmTHGOg/ttNPpaCwHpZJ+9iVXA38sS3mog0mJPkJUG6cXmbBiMRXK8RchHh?=
 =?us-ascii?Q?fFn2CpsGcRjNqfQyJ5Hl3I55B851+3TkN73f/pWajFjBynkqVHDo888Tap5g?=
 =?us-ascii?Q?6hSlPmeZ+IA2ML7NjFuOU9yg4UEmwAVhLjlwBK+vLOUoePdudZ4VhY3iv0V8?=
 =?us-ascii?Q?7QIWCr3rZVbgwy64e5fni/0nAaw5flB536NamzunFDhRCEGsu/UrBOcPm4z+?=
 =?us-ascii?Q?Lz2PLBswAPS2ybzsHDxDY3i+ubt1ahJ8iFiMM7RW/D/2q7ieOsqPR3oQ9RtD?=
 =?us-ascii?Q?OvDeyUtyxUIEOu6wM3jik4v8Dy3gtNSP7U3A2a9hQEIUZHjg/fV0xCGJ892z?=
 =?us-ascii?Q?btC6anis9XpKqXfAyYFncYay1mX0xwGwwkzb8eojY/78YWw6f4FyY6rQhB2l?=
 =?us-ascii?Q?NMGpK135zSKto8kpS6a2uvg126qKju6e+2S34HnJegpqCJ6w9Fo/YA+o+yUd?=
 =?us-ascii?Q?9wNCQvaywg4cM+7F50lcDD7hrDga7R+C9tq9GIu4EZOkm9Vrw0P2dThR5UFC?=
 =?us-ascii?Q?ywwUaTWixyTDzy5WawrWvrVMgwXrnCK+Z6jGz1NWKCra9iF7kB+hFm7SBhfH?=
 =?us-ascii?Q?8JWZwLy8jOoYyesY6/xAxNTnHi4DqQoKQjjufUVDyvi6zd5N5OmIDxN6qhlU?=
 =?us-ascii?Q?E7f2ZXrKTE28RR3FsFozkQSp/3FNL2QT2062ZyMMvpZZAeMKV5wmRjIa3w1I?=
 =?us-ascii?Q?DRB5gOWUSZzexgmpIuBJ1nPx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b33ad63b-1b60-4e5d-9f59-08d950adc065
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 03:22:24.0043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJ1s7HEaoRm1uFyD/xnzPC0uSLm1TtlA0qKTJFn+fCdi4v4cCL1ZDxwuqoVTfzCXBzr5JoiHlL1pPnT4yiIFrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2660
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add NXP IMX8Q VPU CODEC v4l2 driver entry

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f59b0412953..b88f6e650fab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12600,6 +12600,16 @@ L:	linux-nfc@lists.01.org (moderated for non-subscribers)
 S:	Supported
 F:	drivers/nfc/nxp-nci
 
+NXP IMX8Q VPU CODEC V4L2 DRIVER
+M:	Ming Qian <ming.qian@nxp.com>
+M:	Shijie Qin <shijie.qin@nxp.com>
+M:	Zhou Peng <eagle.zhou@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
+F:	drivers/media/platform/imx/vpu-8q
+F:	include/uapi/linux/imx_vpu.h
+
 OBJAGG
 M:	Jiri Pirko <jiri@nvidia.com>
 L:	netdev@vger.kernel.org
-- 
2.32.0

