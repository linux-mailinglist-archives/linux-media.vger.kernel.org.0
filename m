Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C29D3321FD2
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 20:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbhBVTOk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 14:14:40 -0500
Received: from mail-am6eur05on2053.outbound.protection.outlook.com ([40.107.22.53]:59872
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232902AbhBVTMG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 14:12:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njUB281lBQ4bI0T0lf9q0ahDJ+psoy16KsFWs1DoT1vFeIlUO1ZhfqcIA5ezpwrVX6W5j4Ggrb8NsLo/lRB7LbIxknAtoZUIkUhD1wiqA9JtFteqyd8hqUCTaeTza5L+I177JiTM9xeHQLi+FtfMnbGNFsuxmiCZ5d20Xk3lkUgRBHVM8s5J3NGdeh0kcsq2ZUh9fbyACG596o8XkoGB9oe4amp6QCuQC5wUK0bVNb+FApBZofPZs+dEwCp7pL+tMwhppiZnrPRKMJYA55LKNPn4Z7sMfmADeJPUARsBkFY4WMFeJF/Y0f/pRp97j2neP2OcKDU4pZEcalHRlYZGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDKvzVdjGbMHVD1Z3uuw1Yz6DtptNqT1M4/zA6HEkfU=;
 b=MM1TvU1NBRWNsO/umhhDGi98ED+vZeiG9PPGYeuX9Hm+5Fr+YIdIyvd6VWBcC6AHLs4w+ryWi96paRdTHYeFAEiCId9HX4+Bz5QHcoXDWT5sH5DXKxaxukjnCIOpu7Tq4RjsQa/LFEY9+1NXaJ6mnwRGtlEu0tHoMpZtr0n11ps7dXQZkCJ5EONPaNZs83wH+zvitPyy9qsURa/mD2kOgpqGP9jrfjMMIYZGnmgVWjcucAVZ5P5mMuZNyB0gwrLWU2PeoRob3YuihnkJUJLgwaAn6uvtqMrIwXuPemMBqSXElQjnKWlkLUYORZHwtZYLzAhbwM8OeKz0PfdmsbcmlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDKvzVdjGbMHVD1Z3uuw1Yz6DtptNqT1M4/zA6HEkfU=;
 b=gmCU6RZYzVsgssbPmbJLwom0xyrFZniErwmDLjPMNhN3SpG6xrLpp822iHPLQu9O2xUiKyePBK1ohgOfMj096zXsPXSQO3Js8oiVl784Ivdc3FydVGtxrL9AZ5ZyUsxsrYQdajxprXUDyrmv25J6t5HTK/taMX9s4CKTUwIvxkw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7591.eurprd04.prod.outlook.com (2603:10a6:20b:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Mon, 22 Feb
 2021 19:08:19 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 19:08:19 +0000
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
Subject: [PATCH v8 8/9] media: Avoid parsing quantization and huffman tables
Date:   Mon, 22 Feb 2021 21:07:37 +0200
Message-Id: <20210222190738.2346378-9-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
References: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (86.124.171.30) by FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend Transport; Mon, 22 Feb 2021 19:08:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f0854a99-558a-4cbd-2e2b-08d8d765373b
X-MS-TrafficTypeDiagnostic: AS8PR04MB7591:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7591C70B2F318820C58F7E5CCE819@AS8PR04MB7591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lW6V6aAjnLRDD7Gk/rKjxR97T4c/VcGDihIANQ7xyKFnxGXC5+NXjXHLvUuPAnmkqv0sstx8iO3B0Wwbx2GC1Q9u16d3jBi+o2gdsIjFNzAV8nmqtbRKTM3NIoDlq9mqAG6DnaeIjotXVMiSBrWy93WTYt95humNNZn2auevyCvRDrvVy+Xx00JlDLBQ4GO/5dsxz2zFDpqmQ4kC5wbAbt0MIA/9DgUvoKeu+CRDv38YlzMMX/39fdDJOqscEn92DTxofF0ZwFuNnNUWbjfksn1Mx0sxP7fv1vMTVIni9lO4ykFtRyEkDwfO55gmG3XQsQniTDFsiJ0kf8db+TPil1+EvwxBbtyoj86+YlAEQ2zqZ/2qUJMLm6/5o5QQvPjHcDV2rtp/E8UxOtVx2bGdaCWVzlhAM36EWNL9PQSwFmqtZ94wLFQtiiZXoMd5NkFPB2RiwgGEzUafWyH5aF9htuVohZ5s3FUYMZd1yzpDR7JxYw1FjoHZ7hY8k9T7xjfDCi+6WFzc6AFd9PQzQflS/37WRe9CzJ2mqcC0Qpbt0vu/nXMB8JRPh1xgRjG5sLd8xnr0JUfmowsnDDP7A7O/Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(316002)(6666004)(2906002)(83380400001)(956004)(2616005)(52116002)(8936002)(186003)(69590400012)(1076003)(66476007)(6506007)(86362001)(44832011)(66946007)(5660300002)(478600001)(66556008)(6512007)(6486002)(7416002)(4326008)(16526019)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VE8dAb+VXi1hi1URLIocirsMhig2qtf3Z5slRMMYvmK3U8qjZgfteEEJ46R9?=
 =?us-ascii?Q?3UVjLJkNOypwZUfeSl/0Fb8X4LhYPaWYO+C+hnjsEIg3a6tTnuqE6eGPPcyp?=
 =?us-ascii?Q?UMa5rLhe6Xo5l0poW4tTAz5EKmZ5/5tM6W2C0qggot/cA2d0HOyr/+MSgIQu?=
 =?us-ascii?Q?TloCApHgmxCRveAaT9mQPCf78u67huoORoN4kAVqbqukiL7dRxTh7GJQlxVg?=
 =?us-ascii?Q?ktLF0aV6vi7XyW3QKzDRhljUDSYrEyI/wRWBF4m9BmaGbloHiqYEikxIo2Vi?=
 =?us-ascii?Q?6AyJ3TD0333vHNoSVpYXHOLOnjX44OBQdrkdC9lI21vbOq/nJR8RjyUJlrZi?=
 =?us-ascii?Q?xx7Z8Uc8K5VTshaH811jW6c8QszKFKCYa5GaAfGThYX/O6njf2LlHuh8dNDm?=
 =?us-ascii?Q?nIjRWy6Q1eR8da606D0ZjJYXmdcjc3NFB7NjbzyXdgBEwwIUGUlyO2p7b+oW?=
 =?us-ascii?Q?5a2jjrHq9tTujZMSCmI9ed0gpbvXNaFz9Qn/wU3bZ31F+3fa7esmUPEdMun8?=
 =?us-ascii?Q?23+SU3CVcOkb9Ay5R7LsyvUfqdhAvHhO5CEneTQA5DJdGpigs8SExEXCE4yq?=
 =?us-ascii?Q?5nhwR6+f1CBhqubV6RXqzf2NtppCDJLX2+DgFQHmXr5sHJDHZHb4WNxexkUk?=
 =?us-ascii?Q?yUP/5UreCllNRYC5kb+HIWZw+NWv1AIRciT0kC/tchOkkf3xOG/hLiMZzuxv?=
 =?us-ascii?Q?kjrvy9okwXiJvb3dsJTVIAmCxcdMbzzaHKh+pLh2CtB1WZLiUmi2ngJTKadW?=
 =?us-ascii?Q?2j+PJyaLNZNeA0Xhta0JJK92U/NhtwNCw6yoonMVq4KIHrV0uLqHXv2+KOae?=
 =?us-ascii?Q?3j4YRg5vS4pq5oRwVdVVnRy4JceaKX/V1Zkujr135hDZnUOxokmyrPXqXmqz?=
 =?us-ascii?Q?59mBv6fhGQjopMAbHpCM6b/o5jA+R417YOrVm+Gh5zPbRwQXP7ANN9whckwe?=
 =?us-ascii?Q?CH6EQb6FN0iHvVBtFc29vtcWKkc/s32RJWsZb91agQDXU46nyvijRzlV62aJ?=
 =?us-ascii?Q?RqxTgWm+nHRfDow7yALv1eJEKIm50/wRCF/0KgoQiOYozm/E4g+M5oSMomK5?=
 =?us-ascii?Q?pj8iAMEXs0n2zcRhSHAb2CBL4/FY3LDjIAcJBDhJcfkgxS7f+Q+moY1wiHWI?=
 =?us-ascii?Q?nkDjEXvfeJGrgQKp/7bgD6iwpVOa4FnZIOqLjBkAX8o3BEAQlFFG82jYzA2T?=
 =?us-ascii?Q?e849Gol1uq5sBDPOxgXr1S3J9ILemQkc51k/9vIZwvsnJHYO4R+1LCF0uJMc?=
 =?us-ascii?Q?O/pdoloWpyO2SS6xmnFRF3c16sJY7r/XckDEMQ9hERdug/97xFNpkZpPW3ZJ?=
 =?us-ascii?Q?PeTYpHAKfat678WuGRrVJWOVPtiRhKOh1+QB501i+FVcQg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0854a99-558a-4cbd-2e2b-08d8d765373b
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 19:08:19.3068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGX48Xd+XunD+i2XOdBVr48DpdEoCuyPcwtVGrGwHoPl4VaexIWdHso9ce2ZjUdGruWxtzXNWLO3DQfQD8Jr8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7591
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
 drivers/media/v4l2-core/v4l2-jpeg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index c4c0d6dd4577..c2513b775f6a 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -537,6 +537,10 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
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
@@ -545,6 +549,10 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
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
2.25.1

