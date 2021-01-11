Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FCD2F1F7A
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 20:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391179AbhAKTbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 14:31:41 -0500
Received: from mail-vi1eur05on2062.outbound.protection.outlook.com ([40.107.21.62]:26273
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391172AbhAKTbk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 14:31:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgQeWXnQrNRK89ocyIr+fmd+Qil9MQH0tkur8UVE8lxSZ0YlfZnWsEQEZpyQ43lrPspeu6MA7KqYaoET+528TFx9nyyS6P4nIbXFy8GcEcJXyejpAjCpMBT0VRglCGTetybDm4uOi5igZV53HRwUz5lSAyFRE6/qCP0lbMraC4CIMxZveD8eh/AR9MqXKo7mn8+vI3vYVaeOK6sYgENbaYd+BzZ2yAFoyTqPrGwX0k+UYvW2GNZhP0yKLnhgbr7PO/47TJiu2WDCn/rhftFpihv2ry3IhJ6y78hre1SlRtTfTQE/yN7KlRFRDF9eHOUCO+f9MnJiRySi3gGf9yUteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPUJhXxq0oZnpKzl1jYilGueRk3Ppb4uASFg+Gc1u8s=;
 b=lyD74JGSiDJmPEOyA4fiKLkkUNVo2Jmr7p58Gssel4s0jUdLwskl88oYrDRevyBi7RmcjR2J54UhO58f5HI//4K1O2os0U7zJFcscadx1MQWJXMgWZSaTRyRSbTOtFClN8zO28YiqKka+lMegGfXWVMQm0hHX49IkItQ8fsOnSO28FEUPdp8P9q79tDXnPeCoK9sEKctli/fe/FxOOUXumBS4uB6wlqMzUjZYJ0jUJkpfurkDfJotLIZCto33zeLykkq9ZZIeH6Fe1IcGA3RG3K9m2O7JPfqBB45lRCQx0XELVEOLZLIJGP/OkGxlvJ7qlEj4OhK9pcSD27XIzXmdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPUJhXxq0oZnpKzl1jYilGueRk3Ppb4uASFg+Gc1u8s=;
 b=fApQQlli/bI4U2DY7YoMBwQqlfEr6tpMmne/VGOe04nZtFYvMRziBtz5O/YzLmAV1OpW6ilawjlqIv7Koa3crIK8jJSG3uw/EIgQki0/FCPH5DIdP60sISpBFucln+EGVHWwmGx5MiQBJpa9BI+dxyzwDYQX5D5HgzuIs9jjSnA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4424.eurprd04.prod.outlook.com (2603:10a6:20b:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Mon, 11 Jan
 2021 19:29:05 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%6]) with mapi id 15.20.3742.011; Mon, 11 Jan 2021
 19:29:05 +0000
From:   Mirela Rabulea <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com
Subject: [PATCH v7 8/9] media: Avoid parsing quantization and huffman tables
Date:   Mon, 11 Jan 2021 21:28:21 +0200
Message-Id: <20210111192822.12178-9-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
References: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [178.138.194.64]
X-ClientProxiedBy: VI1PR07CA0296.eurprd07.prod.outlook.com
 (2603:10a6:800:130::24) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (178.138.194.64) by VI1PR07CA0296.eurprd07.prod.outlook.com (2603:10a6:800:130::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Mon, 11 Jan 2021 19:29:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cd06c2a5-588d-4936-58c3-08d8b6672882
X-MS-TrafficTypeDiagnostic: AM6PR04MB4424:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB44244738DE39A61810F8A6F5CEAB0@AM6PR04MB4424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Wo75NOef52zc/2s/BiJ7LeKOVX2VdUJ6uaHV4JTlJvQhiN8EFlQ2ur+ZPof3szJPLGEt12nIAF7TTpWiCKv24/CJSAdyseopx8Ky2bVFOH9KHAnVpuZkNk22oO3JlnxmMGYoGKj2WnvhYm1c3EiURP4UmSn3nQMwOWS6JwhmJdr7dPsiaol+HEr3G/UgKd0UzsY7Smd+/4+4nZYe6Y7ZCoTN1/ELMoRC05xoK2dS5lpwndrQMAY/LykZbM8FPyMFNxcvanXkHZ1jVsymIV5pSJWF+ZElASbDlkyy4tvTVxxlzr42pDN7IcXZHN0iom6JI8sJsXa/NvVglxwGa2/ZLGze1AoNxhhHCXTD4PLiaP8eDVp90CyhjZN+dTF9nh8LfJ5Dqk9yRCyJOGQ3+EjxGQhjo4CkDc+RN487rkqfpj/7913Uq62dypCYQtQ7a57z9BqBB5/MS1m4LAmf6j+Zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(6486002)(6666004)(7416002)(5660300002)(52116002)(66946007)(316002)(69590400011)(478600001)(4326008)(66476007)(66556008)(1076003)(8936002)(2906002)(6512007)(2616005)(956004)(44832011)(8676002)(26005)(16526019)(186003)(6506007)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?A5UI7drAvMSvk5g1WSC6Y9StHjn6KMiGAlTbPfF2AynyFW56ExvcNIZh8T/X?=
 =?us-ascii?Q?4f06BpkiKmpK7H6YZdWtOLX8yFnB8ZV41XTMJ+YCTEpgR63M9svV3WfEWBRs?=
 =?us-ascii?Q?JnMaL5BEAMGOcCLJPaAS3cgO0kOZ9f9xUpxHrX3qtuBHfI0ztpgJ1UxsSFRl?=
 =?us-ascii?Q?fHNmz9dkwukP8mY4Iqt3tSHNjxiIEAK2Y0e5mbD2cIHlh2Ewufhj3IYURDuP?=
 =?us-ascii?Q?oJgu9PACYrkCrlthuqqRe1ApNpvmTcgcNkrboN7s1PUiEE/0V93YQ/lfza9g?=
 =?us-ascii?Q?AEtF5Sk3RfbptQSYFPlwE04SvcOIAp87Jstl6WDzmjDhhE7Hdi+566My+fJD?=
 =?us-ascii?Q?F5LgGcH2UBDYC+J+c3L15JhrChq52dNWex2NeMFKe0Dru//TQco0BngiHDfI?=
 =?us-ascii?Q?97W/6l6YQqv7joVsWr9X8cY5DU9O52lwqaJKHTG8cDaCVD7vwgyGs+DGdYdB?=
 =?us-ascii?Q?SAJ0hEVcWRAZ/KHAyE4FdgD8nFooh5es3udB/9HifZ/FkalvcArh+7GiJNFZ?=
 =?us-ascii?Q?IKgp5K+J87kDI+2lCpqq72uZyEkEUvNTvTkhLmyGTpjs7wavJABHn5WhUUQR?=
 =?us-ascii?Q?THVQdKyxYUcneQQWOenRJw200rcGk15ZWW9jzK+xnbgcxhHkTgApBwnzIT5j?=
 =?us-ascii?Q?QgWK1ky1sjoICL8ymUVrUontsSCZYrHdGr3wrNkncVLSBhWqBIoFq95evrZ4?=
 =?us-ascii?Q?4Pv09NDOvfma/3rkZiQshJHZSyQlcSv80nRJgG1ZVb9WF+Ri7GJAn5pnntG/?=
 =?us-ascii?Q?UJyshydok65r0vDP0ymHvEM/qumkbF6ucJV7qcBVjxuAuY9YdsOT38IDZltT?=
 =?us-ascii?Q?yYiEG9I1saWRudvveqn5yp5SqbWW9D2mkb3jncyCvx2hJWgQ2PfDkU3nurng?=
 =?us-ascii?Q?REViKimtrA3x0TjA0VpkoRJSa02Lx3PHQStI50bm4LDfrOtPbJDQMtnMFQ8g?=
 =?us-ascii?Q?xbdFSKpmto44jKiS8/TWS3QD+gbr5jp/82OsWqFb8vwIRaZgVZVGjbbuoEOQ?=
 =?us-ascii?Q?DiPG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 19:29:04.9335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: cd06c2a5-588d-4936-58c3-08d8b6672882
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTUlaH598ADilBHDOzeSOhTp+H8GBlDQOxbxMjY46N7iNQ58WD/lQZWQ0EB7J5VNKrq+f5YI3d447gi74X5fPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4424
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

These are optional in struct v4l2_jpeg_header, so skip DHT/DQT segment
parsing if huffman_tables/quantization_tables were not requested by user,
to save time.
However, do count them (num_dht/num_dqt).

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v7:
  Added Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

 drivers/media/v4l2-core/v4l2-jpeg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 42aaabc71b7a..4b008d630252 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -540,6 +540,10 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 					&out->dht[out->num_dht++ % 4]);
 			if (ret < 0)
 				return ret;
+			if (!out->huffman_tables) {
+				ret = jpeg_skip_segment(&stream);
+				break;
+			}
 			ret = jpeg_parse_huffman_tables(&stream,
 							out->huffman_tables);
 			break;
@@ -548,6 +552,10 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 					&out->dqt[out->num_dqt++ % 4]);
 			if (ret < 0)
 				return ret;
+			if (!out->quantization_tables) {
+				ret = jpeg_skip_segment(&stream);
+				break;
+			}
 			ret = jpeg_parse_quantization_tables(&stream,
 					out->frame.precision,
 					out->quantization_tables);
-- 
2.17.1

