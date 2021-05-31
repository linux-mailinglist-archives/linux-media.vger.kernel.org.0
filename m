Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25DB395404
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 04:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhEaCxr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 May 2021 22:53:47 -0400
Received: from mail-vi1eur05on2075.outbound.protection.outlook.com ([40.107.21.75]:13568
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230085AbhEaCxo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 May 2021 22:53:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ab85+Wp6qE7SR0DO/SjAInapd3+311v757ivUFWABjS3NN/JP/XCh2f6F1YXDOnQmRnCg4pt3X6r6qRywgjXD86JiVwFM5q8pqJAQpAbxIlEghic0M7cgQk0uy0GgnH6YZL7CnNZICj5CorIgFzivUL2ZlhrIa3O1of01rPDpfABZY87uTYopNP0S4swDeB9dt9bc6F4CCVOY/+Op+GPcAiC0zkIGne85kR96AOj6uFA8p3nZYa5byuV91LojxSBXGT6WV+rv4LuQqFbG3s/H2wL4qSaju6zCXYLG0MTQErw+OYHxxMx0ybEuccIwKBNkQFJ1jqMtLFAfDUwDkg+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kMq5OJobJpmW7pcbyxi2TiLm+qcfjLn1Zz9F458vq4=;
 b=BUkj8ZhP2FQcuhOAyKAR+/SJwp3QPO3c1aV7vYhjKC1zPpZZlja++qFKulqFbBwa9NIV44KAAyzlM1R4HJ6FXhr6B/dFN/YTZ4lE9e/P7pt/IYRGspXcKmBfIOSShTAoCD92Y4+fsUigHbahzcPDqLod0gB56edpXfXHdfRX2Otzp5q5ewpxeTZDj+Pp1jC1rWEcF1XdE9V+wCG8lBmUEoIgQE4U4C11aME/Qi/VjY4qJgqf0mrmYddr+j+dKS0vQZC86+QXPasAuxSH8A32soLD93EmXwT1fFPtVi+KY0G8RCTiY9KA0RPwUL7vwDCSyumurWlJSphDlOWlM2Ip1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kMq5OJobJpmW7pcbyxi2TiLm+qcfjLn1Zz9F458vq4=;
 b=rwlbGyt34crIVJ1JIt1VEssGHEeJC37c46weKAwlPZWiW2lyeFImtV5wgHRHAbAKmo6aW/fK9+z0OF8/wnwM3cc34A/3/QxTPKYIVzE/g/iShiM4gv+geu9JRncDq3r5knPOYfljjdHOfHfDl5e3fgAF1QSY5Qd+O79ckhgE9lk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2546.eurprd04.prod.outlook.com (2603:10a6:203:38::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 02:52:03 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 02:52:03 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] media: v4l: add some definition of v4l2 colorspace/xfer_func/ycbcr_encoding
Date:   Mon, 31 May 2021 10:51:10 +0800
Message-Id: <b53c651305e2b1351230f73d6abad03b9de49e52.1622429026.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622429025.git.ming.qian@nxp.com>
References: <cover.1622429025.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::30) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 02:51:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b496c33d-2e8e-4119-5981-08d923df11ed
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2546:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB25469034A8D76407FEAE4583E73F9@AM5PR0401MB2546.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HDZkItnDiLI8MlTV3CZpK+0Du74cff4EeeWqKu42hucyj/E9uTsJDihsmhVuUiD1Nyfz5oTsj1oHhkNSZqfvRHgsAlMngB6tWiJch/+7yc1UzjNfnxqk/mAOth6ARrBiKs2claHnFtqVGBzBSzIp2dxF+x1KvOS9n8GDEXpeyZ6AjnFFxgtj5PAsZNLOqsYKtTg3/aJkH3ND4OnLPZhex/Z9Y4nQFb8Ewe0QGAUXQFVQcTK4jGJKBlR8DTJpl3s3R5lDhqPJF0iy2zMpTGW7Dgg0TUPzZTQWCrNZ4cNh/3UoAtlth0e4GyyEEfV4UVNbulfaFCT+6106mE8Y7ppb5b77A1J3ppPbRxO0P8n4wuZOHwHnmBfFl0bunEUuUraOH20YX7vv2lTRnFKdGci6dFhIUTw4GbM3yPCVaAHNlEZPmK8xKgdlBPFeIvmytlOvMGtmLD0LQzxln9tioPOJgDUK/P53BfIHqvepZ76aJ9evGUYapWIFDklu/74ePMPFcErwuVcgIGx3l5MUZ96wWLzhQxtYWue5nJM01JvYrayETkDOT2otw2Q+DeGx28CMs/bTmvqlQ8gwXdGgAQYskTr+1DOoFasyedVVHdyXZDbFe+yZcVeCSo39w9KcUySvBdGU2V3LwcF6/K9SdrM43Gfzhe1CJwIeK17T+9DjicU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(5660300002)(4326008)(6666004)(36756003)(16526019)(66946007)(66476007)(66556008)(38350700002)(86362001)(38100700002)(44832011)(186003)(7696005)(2616005)(478600001)(8676002)(6486002)(316002)(956004)(2906002)(26005)(7416002)(8936002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Tnv0tAb8CsjqOH0m1Wh9Ef426uLdPVBLj7nkzwfXI5GUoq8vBEK8W3fJ8QgO?=
 =?us-ascii?Q?XgwfCDzu9y1pVXia8OOTwhSEoOMvZQ2/CMgssveWqq6Y6U1I1VBmRfTaDaLy?=
 =?us-ascii?Q?oPFIcir44VZ9PS/1Y7zyzVK5heoce7WitkDpR7mIgD1AI05tG14Csd5mTJ67?=
 =?us-ascii?Q?c4y5yy++74aVKA0cfquoujlc35Du7DSF4jDMIxAy3cTdHwgCUJV3/0itF1Am?=
 =?us-ascii?Q?kdveglGiIcbBehyDLcEycgS8RtGDbG16JVf60mZmz+zB1cM1o+2ynjKR1Ycv?=
 =?us-ascii?Q?v8hiWiu/BBcEoR/M1eh1wj1Ckoww8VwcNnpTo2lQPvIE61kePnyfz91P+Vyy?=
 =?us-ascii?Q?z3IqpolPxiin89uRiDjsE6jVTLHiiB2E0EpYngpcMPzFqTNubNfLOX3+X9Bh?=
 =?us-ascii?Q?T2Toie9WAblT3sXEpnkXW+eer1mchyQViVtGqODChgGHGmmBDEPi4RMECkL6?=
 =?us-ascii?Q?HDxh4ggnF2+vuebf4ZJJaMe0KyuElWK90AidFHOSvSAHsIGzbAuFS/tHgGMJ?=
 =?us-ascii?Q?dyCX8XZEnO+Qg7nhqFx08McZlXa7Y8FuJRhHfO+V8cNYzium7WOiL+9GmGS9?=
 =?us-ascii?Q?Cda+SLHQl0/oviVtpCW4jl1HbingsI8C5qf8ydUBSAKWwaZ2Jv82vSLJa+7G?=
 =?us-ascii?Q?SAPoFo6IkbqiF67LKmyRsjV7ecZhqnj6bbdwlyrc3wLVBeMgFQbPRU4dM3l0?=
 =?us-ascii?Q?YCHbCbJzt5mu07vaIFPgZg7clvjTulEbpSLoIq7/3lxUJKzdsjEQYj7bG7ym?=
 =?us-ascii?Q?diaVLTRxEcpRtMzf8WFIxwOo1032GzAZykJ09nMLSOm1CYXYEHLw/JzEUB1P?=
 =?us-ascii?Q?AKo4qRhYpMdiexGr9Gwm/BRvSTYOPtld/hAWVWp6eRhsaac/KaRmexQ797qp?=
 =?us-ascii?Q?WTD6MIZucA3alKvYWVF2whmJTAODxIaVWuhUK88f5BqFKuJ0f5fYakwT06DU?=
 =?us-ascii?Q?Xy3c8ahOYai7OWFt33Gn9wwZoNqoPuSnNTN0iuPucjVpldPgyw3zi2yZGvB4?=
 =?us-ascii?Q?U2fOEQ3Ia/UY8jk1eD0Ruh/hy+b+J2FFWJw2rdOVpDdAKZdFp55XIl+1ZDF3?=
 =?us-ascii?Q?9fA+dEh5FO+TjHHLEEv96tAlVrJjILtZv/Jnu3LHecyK4mUogZjd3+jQGyxN?=
 =?us-ascii?Q?lPpC7nQHGvE1z2b+YnwUrioqJ1/UP/Z82ThuffN3JallwId07j6buXSgtZo6?=
 =?us-ascii?Q?ERFnCOT6bhP2Qb1qpOiIoTwM0V/eHf9aCaCxotxzombUiszbOAHUMfMqzA3F?=
 =?us-ascii?Q?6NZoXScbSIQaPrgRppdJ91sQU92gJHsBAH41V6MlS9bXM3brC1giUxwk1QtX?=
 =?us-ascii?Q?UKWXAgTWAKLDiTcWU5+LI9kQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b496c33d-2e8e-4119-5981-08d923df11ed
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 02:52:03.7301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: me+5TxSEP6BycPSD0sM3EBQUu+mqN//OXD65Rw9qTHnnDS/LnSvOsiHnYKwA5Vhn0YjClnUdpZNuk8/hlE+eSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2546
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some definition of colorspace/xfer_func/ycbcr_encoding
are defined in ISO, but missed in V4L2,
so add some definition according VPU driver's requirement

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Reviewed-by: Shijie Qin <shijie.qin@nxp.com>
---
 include/uapi/linux/videodev2.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 534eaa4d39bc..545f2c329bc9 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -247,6 +247,12 @@ enum v4l2_colorspace {
 
 	/* DCI-P3 colorspace, used by cinema projectors */
 	V4L2_COLORSPACE_DCI_P3        = 12,
+
+	/* Generic film (colour filters using Illuminant C) */
+	V4L2_COLORSPACE_GENERIC_FILM  = 13,
+
+	/* SMPTE ST 428-1 */
+	V4L2_COLORSPACE_ST428         = 14,
 };
 
 /*
@@ -276,6 +282,20 @@ enum v4l2_xfer_func {
 	 * V4L2_COLORSPACE_RAW: V4L2_XFER_FUNC_NONE
 	 *
 	 * V4L2_COLORSPACE_DCI_P3: V4L2_XFER_FUNC_DCI_P3
+	 *
+	 * V4L2_XFER_FUNC_LINEAR: Linear transfer characteristics
+	 *
+	 * V4L2_XFER_FUNC_GAMMA22: Assumed display gamma 2.2
+	 *
+	 * V4L2_XFER_FUNC_GAMMA28: Assumed display gamma 2.8
+	 *
+	 * V4L2_XFER_FUNC_HLG: STD-B67, Rec. ITU-R BT.2100-2 hybrid-log-gamma
+	 *
+	 * V4L2_XFER_FUNC_XVYCC: IEC 61966-2-4
+	 *
+	 * V4L2_XFER_FUNC_BT1361: Rec. ITU-R BT.1361-0 extended colour gamut
+	 *
+	 * V4L2_XFER_FUNC_ST428: SMPTE ST 428-1
 	 */
 	V4L2_XFER_FUNC_DEFAULT     = 0,
 	V4L2_XFER_FUNC_709         = 1,
@@ -285,6 +305,13 @@ enum v4l2_xfer_func {
 	V4L2_XFER_FUNC_NONE        = 5,
 	V4L2_XFER_FUNC_DCI_P3      = 6,
 	V4L2_XFER_FUNC_SMPTE2084   = 7,
+	V4L2_XFER_FUNC_LINEAR      = 8,
+	V4L2_XFER_FUNC_GAMMA22     = 9,
+	V4L2_XFER_FUNC_GAMMA28     = 10,
+	V4L2_XFER_FUNC_HLG         = 11,
+	V4L2_XFER_FUNC_XVYCC       = 12,
+	V4L2_XFER_FUNC_BT1361      = 13,
+	V4L2_XFER_FUNC_ST428       = 14,
 };
 
 /*
@@ -345,6 +372,9 @@ enum v4l2_ycbcr_encoding {
 
 	/* SMPTE 240M -- Obsolete HDTV */
 	V4L2_YCBCR_ENC_SMPTE240M      = 8,
+
+	/* KR=0.30, KB=0.11 or equivalent */
+	V4L2_YCBCR_ENC_BT470_6M       = 9,
 };
 
 /*
-- 
2.31.1

