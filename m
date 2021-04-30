Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E46836FE0A
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 17:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhD3Pts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 11:49:48 -0400
Received: from mail-vi1eur05on2071.outbound.protection.outlook.com ([40.107.21.71]:25313
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230152AbhD3Ptr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 11:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkLKFnQgjUqiz8Rs97T2V3taAUUDbyNRl3rsBtMQmH0=;
 b=cO97xhfn4PeB4IVRnsT+hkNloQnR4NohuryBRaYLxQ+Y65+W8RceI38HKHM5+Dw1qwz47PmuICHg3A9McRXEqP7Nmwv2DyAyCFu7aGHtUnOPoSaB+6QdOMt33cthiUKZIMf/HXYKVZhQzHPA5fSLmi+LyG9KMSukdsErVSf7xGU=
Received: from DB3PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:8:1::38) by
 AM5PR0402MB2769.eurprd04.prod.outlook.com (2603:10a6:203:a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 30 Apr
 2021 15:48:55 +0000
Received: from DB5EUR01FT053.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::23) by DB3PR06CA0025.outlook.office365.com
 (2603:10a6:8:1::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Fri, 30 Apr 2021 15:48:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topic.nl; leopardimaging.com; dkim=none (message not signed)
 header.d=none;leopardimaging.com; dmarc=bestguesspass action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.81.10.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 DB5EUR01FT053.mail.protection.outlook.com (10.152.5.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Fri, 30 Apr 2021 15:48:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.107) by westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 30 Apr 2021 15:48:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyL0l933ZQOBjrnCS1UzhEwdTy/3Zvm0s9/u3l61C6TE3srjmYL2Od2ohoptVTSNVGvjz/dixSG/RYAaHyv7CHvBaq2DbxjSlj5f+vKd9ouOj+1BZw6tRoUJmi35SKrq2lRPrq1HRL/gLXdydAbXE42JRJYzdpOqMQFMkQ4Y7aRXt9wUmhKuELoeoDrhCIHJDzcvXwgN8it1iG87titBVV9ZZ6tfg1afeE+dMSDpgmTNDumk0A5NSIj8ePU2qCkisZsf02CAwQly8FRtAGVc9amQE5AeO7zBhPtb15VP1IBoAPiWZ9W23AJeTM/yzaCHJTWyaxPPcpTpYLILDrj+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWdI5HoG/JchxWM+XCOjyChtJFuXAoHiwYS9SkepW/w=;
 b=crosZkXCskIaPNiOAi7Q+sOuL9FZLAujSQ6BGea5AkG/vx1xay4lqwG+ozOsSxFbyS7iG88tPJU12b4DeAl4FCP5qfeAnEgbthKtDfk15+lwFzb+BvylKegwHORR0xpssZrpxrXorCrHB1Mkje23NOQMw1oIGwSr4T7rNRZSr5EaGNnU6pHwCDXlElU0r78GDaOWzQa0c3w31CXhRKNK3s+00IQbfKwz39QZ0R7gtxsG4tTXkazmDmYKZB7lfsK5HxqHA3ouWE6Q7ZjGVnOr46wn3kDSzgF4gCG+YTW0ODJfQgAjYC5GAFsuqlL0ZUZigdwPlaM5ZmKdNSk5XuoNMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: leopardimaging.com; dkim=none (message not
 signed) header.d=none;leopardimaging.com; dmarc=none action=none
 header.from=topic.nl;
Received: from AM0PR0402MB3444.eurprd04.prod.outlook.com
 (2603:10a6:208:20::16) by AM9PR04MB8081.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 15:48:51 +0000
Received: from AM0PR0402MB3444.eurprd04.prod.outlook.com
 ([fe80::8175:49ba:9d62:1d33]) by AM0PR0402MB3444.eurprd04.prod.outlook.com
 ([fe80::8175:49ba:9d62:1d33%4]) with mapi id 15.20.4065.028; Fri, 30 Apr 2021
 15:48:51 +0000
From:   Bob Veringa <bob.veringa@topic.nl>
To:     leonl@leopardimaging.com
CC:     mchehab@kernel.org, linux-media@vger.kernel.org,
        sakari.ailus@iki.fi, bob.veringa@topic.nl, mike.looijmans@topic.nl
Subject: [PATCH v2 1/2] media: imx274: improve v4l2-compliance
Date:   Fri, 30 Apr 2021 17:48:13 +0200
Message-ID: <20210430154814.2606-1-bob.veringa@topic.nl>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [81.173.50.109]
X-ClientProxiedBy: AM0PR02CA0027.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::40) To AM0PR0402MB3444.eurprd04.prod.outlook.com
 (2603:10a6:208:20::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bob-OptiPlex-7020.TOPIC.LOCAL (81.173.50.109) by AM0PR02CA0027.eurprd02.prod.outlook.com (2603:10a6:208:3e::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend Transport; Fri, 30 Apr 2021 15:48:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac40977b-892f-4a9b-1b0a-08d90bef7625
X-MS-TrafficTypeDiagnostic: AM9PR04MB8081:|AM5PR0402MB2769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2769393A43510B175216A192965E9@AM5PR0402MB2769.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OAlUhpB/ZiZ6N7fSXHqz7Ymmrb/nsTvSrd5t9Ul1qF00fYGiylzz4C9j0iMC0F4Rtv6/tTMlU7LmLU36hRc+fdaB5pOeIMw8s4wseDM0RlEZu2xtIzSkqzEDKOWqjD8rCKLi7PWg+cB7hKQlVTHKxmAn1Xn4h5MQBA0SaAHO46wX4d6qWJJNgJdGJC/pU64RNgnv9ftNQJElMB2JqOb8DbeWJME70GqNq7ghbirr/Pel6h7yYukVR2wqld3Wd/ekK6dpMdeMSW33fZqhANpBkEzF/AG4HqpyuUsD9KjLGY2k+5t1VD6wy6Dgw5QmywbtVMtWFzjqI7r5xAB7F1qZNTy3b+NWFg4WuFbcwAikWFN3ESDTREHOh7fN8jX31oqzqTwCCT4f45SNhS9UIbr7RnheZccBHEGtAIKDBv7YacYfvPBDd31TuwwrGELflhkmJ2KsUzCWvI9Pn/ce5F91ralBL1tD7fPwNU+Z+qvvAxudjey+I5OTO6m92qiW8Ruw9PKcf/cvccq1NXvKDLUPjvo22p/j//yZrZ60DItTIv9QoOMBfbhS6qQvp8YhXTVIYDkGYDSBb+6HxDLytFAjp25FPr3KSogMXjDbTcBcvvcJVosQMBLFcljEsiqgbH6/GPTaZbGkerLOS74eEO38/A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3444.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(376002)(346002)(39830400003)(8936002)(316002)(6666004)(5660300002)(4326008)(6916009)(2906002)(956004)(6506007)(66946007)(66476007)(8676002)(83380400001)(2616005)(6486002)(186003)(36756003)(66556008)(478600001)(38350700002)(6512007)(86362001)(52116002)(1076003)(38100700002)(44832011)(107886003)(26005)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?U9/3dVL6IgJptpN1ayGrbS+ZlswWrao+hHpRpS1XsO3VyBxI89zCi9Gbbpqy?=
 =?us-ascii?Q?rXt4/hmYbda2P2Z0nFqbjuHN9DZwDpOAfA9G5JAvMF5PhpyQty1miLRngVCI?=
 =?us-ascii?Q?lg90Ww7k35S5mzhk6ZYcRpyKgCNYcIUzPosaXCAhsHzkclZS/gRDkHRKQwoJ?=
 =?us-ascii?Q?dazXLwd0PMOttZC1hXggnVETdqh+0H+Zfh7zrxDXOvrucWp5q5Gv8nZwFPPX?=
 =?us-ascii?Q?Cd+NKsKIebqceN/wJ2mmPAsYzD5g66BQzw0GyZFr2QHx7ogOBOfr8JZUusBV?=
 =?us-ascii?Q?aNQSAYpEd/HG32VMJpmGzQp2cyQyROVqyQjd9zIw2YN6QPeSvildI06wV8lh?=
 =?us-ascii?Q?P219Txszz/8gGt2znFijER1MQhlHCw7ZQX2vrWZTDqlKBmlmFWQKGUMxLibK?=
 =?us-ascii?Q?akxSxjFcUzvzGkR+VHQKtxn0NBOPBGDbBfcktfAUzoKoNQoKrpnLgvEJ6ZmI?=
 =?us-ascii?Q?pfgj4y8yabEXEGfLPdltHgWILqloT/KhgN2MLm8WYEq6OZCGWftu1ecYDOTb?=
 =?us-ascii?Q?2I4IQzpdN8bs65Ca/2ekJCKAM4Fkl2styTytu1+TQL4FyS63dgZlfIcGdj06?=
 =?us-ascii?Q?v23wm2/SgkMrQZj14RycgN26QefvPprOgomjku/EZjbAuoN4NAgk5ZQxmFE5?=
 =?us-ascii?Q?xfLulz3hHuySKivZxjmBjF0cG60aALzFqZYrKBPExTEnLmQDlDnlPILYwy6p?=
 =?us-ascii?Q?R+/eQRORLq0F/C/CwMPTIWc9inryrmFHkg3Fuk3h/uK3WwYzZ67soHfPArYN?=
 =?us-ascii?Q?zvpfrPBl3Xi1lcaQtUrA6jxkW+FfJL4WUSIzzx3fw9VdqR7phuHHrdScsM2U?=
 =?us-ascii?Q?69oeeJ/JmJn8QkelvL0Jyte1uA+FpRQx5Tz6MlytzW4iG/5Bznoj6aid172Y?=
 =?us-ascii?Q?lrZe+Bcyk8GQejzZeKGKUM2I1j376Ha+f4erBEh9dVodZUGR7oDcFqS3Xhkl?=
 =?us-ascii?Q?+c2pKn143Ub4hCxgpYQXNPjlEFYZCZjnjiG//qYqIl8tUSb9yQiTvOC2qe23?=
 =?us-ascii?Q?D4vOBvsQDv3x3vHAI9d54pGyBRtTFin9WhFT2lY5uQwyxM6BMCZAZFXDnHqe?=
 =?us-ascii?Q?0tqmT7DXCah+1at64ah23O7KFR0K7hyMA6s/zF2HaanUdDbiXDpuUKqMhvRz?=
 =?us-ascii?Q?CVuHAhbciTCbXU3lQ4mPuJ3KXpBl7HNh7se4oTNND6q5Z8hL/77Am66+HwLs?=
 =?us-ascii?Q?GNOPgkED6xcERCvJC30QayyCOirKFzF7OZ6Zj1LzjDXUie20vA9HCArbR7Rd?=
 =?us-ascii?Q?8SlKO36VvyFpbGMMo0/zfSfY+G5+WCFwxgNw/uss9qTtvD3MyYaty+9AsrjH?=
 =?us-ascii?Q?6MrvfSckelUanGEpoAtr+RHE?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081
X-CodeTwo-MessageID: 29c14f80-609f-4d58-8754-12028b5ab5fd.20210430154854@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: <b236611b-3635-40c5-988a-5c9e9fae4458.949ef384-8293-46b8-903f-40a477c056ae.6d77ed7c-4047-443c-80a8-c6edbe2c7d5e@emailsignatures365.codetwo.com>
 <b236611b-3635-40c5-988a-5c9e9fae4458.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.7ac37a2b-d741-4582-812f-5309f21b4535@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR01FT053.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7fc64405-1225-4590-754d-08d90bef7388
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zk4Lo0gUFVAZvGWXpxE5/nAPP8O33PPOPPR4IFYssQdXJQM6qZWDMMKBtu5hLaLdu2QHDWp3CFwRFrjm7TgOx+wpnA+ZlRl/m4w4aasxki5sfR6071YFDUwWjhF7o4WraFz7/RPbiGWX86LnEI/VVd14tBLPvmrTv7+cQlD5fVLsc03AJcR0tzlyWobe/HqxVO3eLQKSQexsXjjfbYp2A4eGJkRp3TJNke8TdEzfPN2AYCC2pd7A+EG3mYiO6gk9hY+sZtbMzloHCj4lVYtYEbDtf9sBRnn3XubaVj7o7ufQAzdfWfk1UvTz5KY7dbIGk0sWNIjh0uWtFknpS3Kx8vf/7s350ZnA3ie7liTaYthnVi6naP9XSTbN5OlibEhgVAFpixD2LWJsrr2lLfD0ge8nWCenhKzuBitMeqfi9NYokGjAOoWDEjE6TuDFsM5Jzk1OoyqqVlZF3I9CyjOpCLCVw6wUrKLFCtJIu200RtVd1DEhowyXERGxKjxPe0eLx8w/KRGi542UCCt8ZPQVHUccjw/qucT8vShK+wNcKAQpfDJoSMeQ1WypxAXy8WAKIaY+2xhfJ92uQmqskWVWx9fv8lA21mYIx4BvwgvgsnWEWB/f2B7EtVTrj/X64Bls3Rf1qZ7LvgQMfrJcpJ2JAKdPELPC+HAp795PZHqfPEVPBgbZS1Bgy9pCbdmeAKFdYtWM3jl8VfW73E4abCtuIAm2/EPbv7JThtuPq8RR2pA=
X-Forefront-Antispam-Report: CIP:13.81.10.179;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu13-emailsignatures-cloud.codetwo.com;PTR:westeu13-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(136003)(376002)(346002)(39830400003)(396003)(36840700001)(46966006)(86362001)(44832011)(6666004)(7596003)(2906002)(107886003)(6512007)(8936002)(82310400003)(2616005)(36860700001)(47076005)(4326008)(6486002)(70586007)(15974865002)(83380400001)(6506007)(316002)(478600001)(1076003)(8676002)(16526019)(70206006)(336012)(5660300002)(36756003)(956004)(7636003)(26005)(186003)(356005)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:48:55.5900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac40977b-892f-4a9b-1b0a-08d90bef7625
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.81.10.179];Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT053.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2769
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

1) Fix incorrect return of get_fmt when fmt->which is set
to V4L2_SUBDEV_FORMAT_TRY. get_fmt always returns the active format,
but should return the pad configuration when V4L2_SUBDEV_FORMAT_TRY
is requested.

2) Fix set_fmt not functioning correctly when fmt->which is set to
V4L2_SUBDEV_FORMAT_TRY, by implementing 'init_cfg'.

3) Add support for enumerating media bus formats
via VIDIOC_SUBDEV_ENUM_MBUS_CODE.

4) Add  support for enumerating frame sizes
via VIDIOC_SUBDEV_ENUM_FRAME_SIZE.

5) Fix v4l2-compliance error 'VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL'
by implementing v4l2_subdev_core_ops struct with default functions.

Signed-off-by: Bob Veringa <bob.veringa@topic.nl>
Acked-by: Mike Looijmans <mike.looijmans@topic.nl>
---
Integrated feedback on the previous patch. The init_cfg method=20
has been implemented to configure the subdev pad config.

 drivers/media/i2c/imx274.c | 77 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index d9849d34f39f..52ca9bdf0066 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -28,6 +28,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-subdev.h>
+#include <media/v4l2-event.h>
=20
 /*
  * See "SHR, SVR Setting" in datasheet
@@ -72,6 +73,7 @@
 #define IMX274_MAX_FRAME_RATE			(120)
 #define IMX274_MIN_FRAME_RATE			(5)
 #define IMX274_DEF_FRAME_RATE			(60)
+#define IMX274_DEFAULT_MEDIA_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
=20
 /*
  * register SHR is limited to (SVR value + 1) x VMAX value - 4
@@ -1072,11 +1074,23 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct stimx274 *imx274 =3D to_imx274(sd);
+	int ret =3D 0;
=20
 	mutex_lock(&imx274->lock);
-	fmt->format =3D imx274->format;
+
+	switch (fmt->which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		fmt->format =3D *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		break;
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		fmt->format =3D imx274->format;
+		break;
+	default:
+		ret =3D -EINVAL;
+	}
+
 	mutex_unlock(&imx274->lock);
-	return 0;
+	return ret;
 }
=20
 /**
@@ -1274,6 +1288,53 @@ static int imx274_set_selection(struct v4l2_subdev *=
sd,
 	return -EINVAL;
 }
=20
+static int imx274_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	u32 width, height;
+
+	if (fse->index >=3D ARRAY_SIZE(imx274_modes))
+		return -EINVAL;
+
+	width =3D IMX274_MAX_WIDTH / imx274_modes[fse->index].wbin_ratio;
+	height =3D IMX274_MAX_HEIGHT / imx274_modes[fse->index].hbin_ratio;
+
+	fse->code =3D IMX274_DEFAULT_MEDIA_FORMAT;
+	fse->min_width =3D width;
+	fse->max_width =3D width;
+	fse->min_height =3D height;
+	fse->max_height =3D height;
+	return 0;
+}
+
+static int imx274_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+
+	code->code =3D IMX274_DEFAULT_MEDIA_FORMAT;
+
+	return 0;
+}
+
+static int imx274_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg)
+{
+	struct imx274_mode *mode =3D &imx274_modes[0];
+
+	cfg->try_crop.width =3D IMX274_MAX_WIDTH;
+	cfg->try_crop.height =3D IMX274_MAX_HEIGHT;
+
+	cfg->try_fmt.width =3D cfg->try_crop.width / mode->wbin_ratio;
+	cfg->try_fmt.height =3D cfg->try_crop.height / mode->hbin_ratio;
+	cfg->try_fmt.field =3D V4L2_FIELD_NONE;
+	cfg->try_fmt.code =3D IMX274_DEFAULT_MEDIA_FORMAT;
+	cfg->try_fmt.colorspace =3D V4L2_COLORSPACE_SRGB;
+}
+
 static int imx274_apply_trimming(struct stimx274 *imx274)
 {
 	u32 h_start;
@@ -1903,11 +1964,20 @@ static int imx274_set_frame_interval(struct stimx27=
4 *priv,
 	return err;
 }
=20
+static const struct v4l2_subdev_core_ops imx274_core_ops =3D {
+	.log_status =3D v4l2_ctrl_subdev_log_status,
+	.subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_pad_ops imx274_pad_ops =3D {
 	.get_fmt =3D imx274_get_fmt,
 	.set_fmt =3D imx274_set_fmt,
 	.get_selection =3D imx274_get_selection,
 	.set_selection =3D imx274_set_selection,
+	.enum_mbus_code =3D imx274_enum_mbus_code,
+	.enum_frame_size =3D imx274_enum_frame_size,
+	.init_cfg =3D imx274_init_cfg,
 };
=20
 static const struct v4l2_subdev_video_ops imx274_video_ops =3D {
@@ -1917,6 +1987,7 @@ static const struct v4l2_subdev_video_ops imx274_vide=
o_ops =3D {
 };
=20
 static const struct v4l2_subdev_ops imx274_subdev_ops =3D {
+	.core =3D &imx274_core_ops,
 	.pad =3D &imx274_pad_ops,
 	.video =3D &imx274_video_ops,
 };
@@ -1968,7 +2039,7 @@ static int imx274_probe(struct i2c_client *client)
 	imx274->format.width =3D imx274->crop.width / imx274->mode->wbin_ratio;
 	imx274->format.height =3D imx274->crop.height / imx274->mode->hbin_ratio;
 	imx274->format.field =3D V4L2_FIELD_NONE;
-	imx274->format.code =3D MEDIA_BUS_FMT_SRGGB10_1X10;
+	imx274->format.code =3D IMX274_DEFAULT_MEDIA_FORMAT;
 	imx274->format.colorspace =3D V4L2_COLORSPACE_SRGB;
 	imx274->frame_interval.numerator =3D 1;
 	imx274->frame_interval.denominator =3D IMX274_DEF_FRAME_RATE;
--=20
2.17.1


Met vriendelijke groet / kind regards,=0A=
=0A=
Bob Veringa=0A=
=0A=
=0A=
TOPIC Embedded Systems B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 79=0A=
E: bob.Veringa@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
