Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C897E3ADA69
	for <lists+linux-media@lfdr.de>; Sat, 19 Jun 2021 16:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234128AbhFSOiv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Jun 2021 10:38:51 -0400
Received: from mail-db8eur05on2076.outbound.protection.outlook.com ([40.107.20.76]:64174
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233240AbhFSOiu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Jun 2021 10:38:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeCeaT3jWqYYBNUyhupNcI6lpxbDlZdUMNjGsgPvdXQUXt+CDsuzf3gPcBAfrnzUZSZbYvzvv8aOTP7yuB7zf17GSXMDHAw18XDNHqeLMCIRbsCAgup11AcsagudOjAN1h3EN8QcbfktS90rcdVyS/9bHnRA4raI+9DCOXMp9gUbPpON7h+Y58AkblnNBGxcQZtduecy6cY6SM/TrIlSt+XUp8wYFXjVpbSI2+roBtDvKuCzwtlkatNZCLin15h5UwdneO3IYSX5VrsxC6h9K2mDjWDXr3gk/3UEh7QtUvhAwpGPWAsOmDvtZgW+jqVx+ZklVPf3hk3bOP8NpTr18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaf6MbTmY+gflj1LQV7cmC4sWYbAf3syk+1Z0gymPek=;
 b=J6/gv/QReZ0bQf8dOFGHsvtBLBxb3wQuwG66JaJcbCgVamBN4Dv6K8OoXlpYPGkxGxTp8GoYRlbxzfDmLfj7xaCnTv4i7mRhJQIsqw9ANCB6gx6x+3d3t2i+SNRUtq9w4dHT0piDWLCpiW09PJpVN12yjHpxQQxPWAy52PkD5db+Q2ndnjGnF4jHZRTegLcXdNMtdr3st/TSZvsbeiDorbAw02AxGrrfAKsWLp++LnXQdsrjZHHiczIIdRKpNkKU6W6TDuLlWqca8qjXUJqB/N4TX2HXpPvA1mPQEEvq+u98o65+fMQzxmrHdy0MX8WqJw+bqS13Xg4RXD8Kdd5Fnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaf6MbTmY+gflj1LQV7cmC4sWYbAf3syk+1Z0gymPek=;
 b=PG4S73Z4iiWSWK21CP5wvYpZzX0va0tXyYWaqbLvIqgkthxWlv6bbv8LYKROeXDNp5xtFfZZBUQK0hkK5bE6FFgsOcnCSpZX2Yy1q8WJAyXT44Cm+CDR+Dmt0Ulfb0uLVhkIAk+0OkzrzFUCMggzSYgrNiTAPNFMKNmMsrfVsQU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5093.eurprd04.prod.outlook.com (2603:10a6:20b:4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 14:36:37 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::bd06:5847:5090:2a21]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::bd06:5847:5090:2a21%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 14:36:37 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, aisheng.dong@nxp.com,
        guoniu.zhou@nxp.com, linux-arm-kernel@lists.infradead.org,
        mchehab@kernel.org
Cc:     peng.fan@nxp.com, s.hauer@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul.kocialkowski@bootlin.com, daniel.baluta@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        p.zabel@pengutronix.de, ezequiel@collabora.com,
        kernel@pengutronix.de, Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v14 0/2] Add dts and bindings update for i.MX8QM/QXP JPEG codec
Date:   Sat, 19 Jun 2021 17:36:09 +0300
Message-Id: <20210619143611.17280-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1PR07CA0214.eurprd07.prod.outlook.com
 (2603:10a6:802:58::17) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1PR07CA0214.eurprd07.prod.outlook.com (2603:10a6:802:58::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend Transport; Sat, 19 Jun 2021 14:36:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dd5c88a-1638-48a1-5af3-08d9332fa4b3
X-MS-TrafficTypeDiagnostic: AM6PR04MB5093:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB50936B517C6093AAFC171B56CE0C9@AM6PR04MB5093.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tu7X3aTLr5f3JQm3DWENfAuoNta7AFd6AN7PDrdH+lWnbD2DVNFztn9LUQ1s3HOQbNGe4SF9AABjKJJ0+aaW1F7mAywzL6N520GFeDrx7iZKtGoD9xMXq09ZNR+G+MJuuNKaWJ5GSdT+nfivZaohqHhtDdwrzM1NQE1vKMdqOcbueWtbAKvSMUnbKodtymozS7oFQz10dXYDdNSj/mAJkMYZNYCYVyJv1kaJFHjxeL1Pcmdi6GyriB9cGLJEpZYVeyJtCZrrUo5aybT+N7M1qDI5y+vPJCPe0pyIsRRB3WP9A9QPb+FLHF2x5ZTs0kuaNPYAfKjSa1B7/q8utiZ4t1zOpLBcW5tqQ6oOnDE/hy900smUPGIzb5ZeVjMGh6mnMKGeNtEXRO56ZZ3I412k0UzWGjKkchUJwArBTVxPDOv9aa4pmQjKLOtVEmIvUzqJSNhUVdxPzu1eCUMh4N4/MNKKf9pASfY32kyfJmkT8UR3UTE5Heytx86gi46H5wtrDOh2OX0aalRGHHBlO31z5zM3uBEFDPsWoDqNs304exGSCsqnN3Q5rZRA3qs+URLsA+DrRmbRulyXeHxT35wUa924g8+YaOUkP6avKCFHBQQ9ocHqpLR1yc1erTSWNcfwIHOVJtaVML54eCEs/t8r/ZGfOLAuPz3wYOIrQRlt31E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39840400004)(366004)(346002)(396003)(26005)(86362001)(38350700002)(6512007)(186003)(38100700002)(316002)(478600001)(4326008)(83380400001)(16526019)(6506007)(6486002)(52116002)(6666004)(7416002)(4744005)(66476007)(8936002)(8676002)(15650500001)(5660300002)(66556008)(2906002)(956004)(66946007)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/7lo+j0/bhAW1cub9NL+9t8ckiZYTPPmt7W5BS9/KM11SngVFg5OIvDRwgsA?=
 =?us-ascii?Q?rbEGDzZp3zxidDru95WxKxiGvFhp5HDrpTkWMTvlFX7ipEDk3vpq3uNePGj3?=
 =?us-ascii?Q?9K0/9zxQPOT4OcpuHca5waEgGmyVRTgmWAO/Ddz2qw+zGgGLcms7mRddnqqJ?=
 =?us-ascii?Q?X8UEKjlwXd9ClPXCWYSR8H3eCAdKvMp35pRSJPYFC4SWXvVVgrwiRW96ljGa?=
 =?us-ascii?Q?Yrox53NOFnd2JZQbmvMk6mqHWQfhPbOI9Ja6Rj/T6ph4qJytwmi9KFoKn+rG?=
 =?us-ascii?Q?6NH3+GubQv2itTIQfk67eZKxC8vgkVgJQFJhi5z89DQiM9l6WvMiO1xpe9M8?=
 =?us-ascii?Q?dxsXaBgGyGWZqcRL11+NnLsVROQtzf5nrSpRotkOPceCuLHw8OHxzT422wXB?=
 =?us-ascii?Q?9BJA3O/KeeFBYDZKV4zWzfGn4V4XeZK8V4KpLHzBkSS4GbNdIpQKnFq8h/hw?=
 =?us-ascii?Q?nIdgdcxwZrrXuOqxXZQLQtCa3024C3YXGfMYsLsKDJyvrphXzdo/pF3R0Trv?=
 =?us-ascii?Q?zHnch42x1yiy/BVMkdwrUNbhTjm832SxEcGqht2frlGP2ru+KJpbGnc9os08?=
 =?us-ascii?Q?yDn53gQE1/A03+vc+1FxLb2teUceYTqU3BPH7ttQodZo0VlSJ5kmRqAuFUAR?=
 =?us-ascii?Q?SRJf9vFNm/mVLDNGkrEXcZaq6VQ6yXFNcX1io9i2huUHwVXkbPdIW1Hp/Jgh?=
 =?us-ascii?Q?bTv7d4JBy/zrAc0dxyoFr8/zz5evgVfniyLd/mkPsq8wNUKj6ZcAgXJFrwC9?=
 =?us-ascii?Q?1M47gcHQus6ELnmo6FPrstHh3jsh7HkSCS04afoqZ8s/DvNIf8Cn0M7lFCBN?=
 =?us-ascii?Q?dfyJ9XQSRRCu7b5XtjNuB+AwT2V7Gudrbj9uuhZe/rHKfwi11qu0JHhudnf8?=
 =?us-ascii?Q?4lPWAnJAG5IDBku9LQrglnz5/p3BmaRoaAZfpTLG9cJ61DZRnxQwEO3kstVi?=
 =?us-ascii?Q?WQxRzUU/hSk8AHqFvkMzdVqy92fApocbA7nvFkvrrkMKK/uRGZmFGMAK6c2k?=
 =?us-ascii?Q?K8vB3cwHuMHJ0e0LtxjKS5tnoOIOq+OWXJJX9RJeKbsft630ob/iSNlpjfeo?=
 =?us-ascii?Q?ap792OiU5Ay+DEzSNtpEb7OTD48etAGJ6Gd+nFcH+zuUoWJ4hT8n5wIHMbl1?=
 =?us-ascii?Q?kymVtKckvTHkuDii6TuB1mSkkIVdF+9Uc6sRKQc4okV383shgwksW2ji8fCx?=
 =?us-ascii?Q?pSWv40m48n8p2UfZqabDS5hJnU+hebcQxCTBScR5WzACOPO2NJty8ugkBFut?=
 =?us-ascii?Q?Txj9Xxt1v0ZqdSw6ZjG0RwYJ4E8VxtMFfwA30yWmLpbqtpzeKwMFzKHX8IFh?=
 =?us-ascii?Q?mJCirklsnlaWU2+wEF+HVBbl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd5c88a-1638-48a1-5af3-08d9332fa4b3
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 14:36:37.1301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlRUSLjUBkBRuOWQCN/KOn3m0qAyGbHobHqEpD8dlwT6Sl4d1JcEq+mqy9t0zqsNQ3ta5HpajDll8QIXgC4Uaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5093
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add the dts files for i.MX8QM/QXP JPEG codec.
The bindings for i.MX8QXP were already upstream, only update with i.MX8QM compatible.

Mirela Rabulea (2):
  media: dt-bindings: imx-jpeg: Add compatible for i.MX8QM JPEG codec
  arm64: dts: imx8: Add jpeg encoder/decoder nodes

 .../bindings/media/nxp,imx8-jpeg.yaml         | 19 +++--
 .../arm64/boot/dts/freescale/imx8-ss-img.dtsi | 80 +++++++++++++++++++
 .../boot/dts/freescale/imx8qm-ss-img.dtsi     | 12 +++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi     |  2 +
 .../boot/dts/freescale/imx8qxp-ss-img.dtsi    | 13 +++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  2 +
 6 files changed, 121 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi

-- 
2.17.1

