Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A905C36FE0B
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 17:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbhD3Pty (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 11:49:54 -0400
Received: from mail-db8eur05on2069.outbound.protection.outlook.com ([40.107.20.69]:57825
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230152AbhD3Ptx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 11:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMCfxMjOQuv01DmMoeP+WNUR6OgAEr4RCWORzGMcZ4s=;
 b=d8OqoxM7UWHuUn+nogaTSY56KCnGukMQDVeHVoF3uLH44UHEfpu6m/V9/iQY7GgedfOE9c/IjTLPtJwJyz3o1vzPpqTMa10fjrinRwB5KdTnzvsojOsWdfCZNZ2zOkc3Est9L/t2Z0DThXCHnU1+AMfBPaGy8f+HxMVfyyhBLsM=
Received: from DB7PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:10:52::20)
 by AM0PR04MB4899.eurprd04.prod.outlook.com (2603:10a6:208:c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 15:49:02 +0000
Received: from DB5EUR01FT003.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::90) by DB7PR02CA0007.outlook.office365.com
 (2603:10a6:10:52::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Fri, 30 Apr 2021 15:49:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topic.nl; leopardimaging.com; dkim=none (message not signed)
 header.d=none;leopardimaging.com; dmarc=bestguesspass action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.81.10.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 DB5EUR01FT003.mail.protection.outlook.com (10.152.4.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Fri, 30 Apr 2021 15:49:02 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (104.47.0.59) by westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 30 Apr 2021 15:49:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+f0DLU/FrgsFaD3tvelXqb4rAUgdGrsKdx+9ByWNr0fTE5PHEFcGnz0OV/drymkb2x2XUeqrSjtOhdublp7iJO/vetXNdov8BvQ8Emr55SDWMVN3UFtVRVPFUWIOr+5Ww/HuNzDtkctMT2BT3tdWdJI9Tt/OLo146lpA+2GxRmFmpt9wnPmj53T4azicbuGN+dBhmcJcH0JZENyZLbEQFlzqSf4TV7L43tqLa3iiElLKyc0cGnVemi/5pLnw3R36m2eZxSypAEnv0EBi4umg7lm0kppvItGX9unrFHa7r1b6r8dXXU4skYkKA76KuJ2uE8IqFEt18Dq5u0MNpAOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxfovNWdQa/c/QNeUHb4Ceqma1G0puTJKR+GR214xIo=;
 b=kWq4un9CYj2pq2UDb4l5DPvfijNMeZnN5cVEL70C+Kw7ZnyPzY7faMmsQ/pS7vydXe0DE9PMVCts4qSGF6Kzoz8URgd4/RpihLT1mQdAhJ7cMx7W4903j6pFplWNt8j3FwxDZ/5H4g53mEEsPpZLSzS1y+mHuF1ugdMezr2vfp1KsZxkTIrnnUgMpXcwlOarGrSvngJUnzqB7ZoyyHRccsaoqJDhSvyvC4sTWpj/QE8q6KkJRK4hXjz/ak6fuOEoR/MHctRYRJEQIE6Q97ocxxToNC4zErc8GHXY/IIdMG/Aw7UXrhK1gOPnGqRTxlx2m4fA+trxNa63PleWkN5Agg==
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
 2021 15:49:00 +0000
Received: from AM0PR0402MB3444.eurprd04.prod.outlook.com
 ([fe80::8175:49ba:9d62:1d33]) by AM0PR0402MB3444.eurprd04.prod.outlook.com
 ([fe80::8175:49ba:9d62:1d33%4]) with mapi id 15.20.4065.028; Fri, 30 Apr 2021
 15:49:00 +0000
From:   Bob Veringa <bob.veringa@topic.nl>
To:     leonl@leopardimaging.com
CC:     mchehab@kernel.org, linux-media@vger.kernel.org,
        sakari.ailus@iki.fi, bob.veringa@topic.nl, mike.looijmans@topic.nl
Subject: [PATCH v2 2/2] media: imx274: remove imx274_load_default
Date:   Fri, 30 Apr 2021 17:48:14 +0200
Message-ID: <20210430154814.2606-2-bob.veringa@topic.nl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210430154814.2606-1-bob.veringa@topic.nl>
References: <20210430154814.2606-1-bob.veringa@topic.nl>
 <b236611b-3635-40c5-988a-5c9e9fae4458.949ef384-8293-46b8-903f-40a477c056ae.7ada8766-e574-43c8-be5a-8e125f50129e@emailsignatures365.codetwo.com>
 <b236611b-3635-40c5-988a-5c9e9fae4458.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.8d267dee-adde-451b-b0eb-01739adc96f7@emailsignatures365.codetwo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [81.173.50.109]
X-ClientProxiedBy: AM0PR02CA0027.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::40) To AM0PR0402MB3444.eurprd04.prod.outlook.com
 (2603:10a6:208:20::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bob-OptiPlex-7020.TOPIC.LOCAL (81.173.50.109) by AM0PR02CA0027.eurprd02.prod.outlook.com (2603:10a6:208:3e::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend Transport; Fri, 30 Apr 2021 15:48:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b02f1e8-fdab-4e5d-5823-08d90bef7a29
X-MS-TrafficTypeDiagnostic: AM9PR04MB8081:|AM0PR04MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4899367A577D886F23F79509965E9@AM0PR04MB4899.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: RUHfKGachG3HNnGAIOsHWN115iEwEJpvkq+Cs44ngGXXLWP7Y/krJ0h2QjHanK0Xjyu0jC9dyNm+D22SAO3UpPQbS4sny9zyWcLUYs5DZVXMwfJ0ZN6wepbLABjIWm2q57B/nnXhZHE8ldHEWqPXCmlkA037oLJK/XbdAAq0EnF4j6Q4h6OfmuBxe6iwG+dF5hd8SuKHfWFRiUUVYkQbQiw2bG9S0DZ7dZlaZ58S4bVbXIm1pxNfthc6zhGrujsvvQJZqIYQVIoahrwz8HoZ7HSuBftXbkD6QFUObFhMn1NVm/hnd6XT8SsrR0wlyw/S2dbrCvissvy3Vlgd0TN46cpSKa6tJfYjzMKth9lJdKkyin5/qhwpGOc8t0WX5ukEU5W24p17eB/Jy9A1c34WqScgp6N822a/VPEUbwi9zhv2au0y0emR0ypz22NSiicJE1cOzIQEd1N9rANVzIXKr7uoEZi6Y6r3CoH9sV3F+d4CQBo/Qm+CbBJGlffQVA724QiK4bzYxpKcOtRwex8SmsXlilKikl2Be1aFF5mCHJZxwfhkkZlBEwy20WlZ1jqPAkXoD9tFlqXHwxfvEXTUOIp1lRw+2gEBdjKZNZzGIXuY7OWtkPLjTGLVrnlgOPbtWP/7RJZhiD3cvfy57bhBgugQyHA2bKcSFMueKIaksvo=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3444.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(376002)(346002)(39830400003)(8936002)(316002)(6666004)(5660300002)(4326008)(6916009)(2906002)(956004)(6506007)(66946007)(66476007)(8676002)(83380400001)(2616005)(6486002)(186003)(36756003)(66556008)(478600001)(38350700002)(6512007)(86362001)(52116002)(1076003)(38100700002)(44832011)(107886003)(26005)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zd7HDdzqBS077mRos+JVU8bYavI7pvQiSPoC9Lew/iauw/K9SHhjoRBvhkVl?=
 =?us-ascii?Q?zSidiEnITyAnuwHMb0OjU9yG9kWy54tPsAjRMvNbLtUCgep+I0bwETHFUSC1?=
 =?us-ascii?Q?a4TWNbsWpF2B4QizasH69qm/6ZJsL1f64uTA3ykMsiteFxahHqnQ0ImSwckH?=
 =?us-ascii?Q?cxVC/27/TDWfGoAJmeKFzpYwjhvDZa1RJXsG4aQWKmKHTTRaDcHCzfKUEvwX?=
 =?us-ascii?Q?4VMkX70eRI2hdSN8v1ZktbTSbVaLQlapgkb/HZA40vdNx7fr8JPZHuMIUNKw?=
 =?us-ascii?Q?rVWO9zHAargRBrAQ2a9UpIo6QQDvA4CBWNXYX9ryLWCYac3DahCfZLK4fKYd?=
 =?us-ascii?Q?0ZaKMxNGp8P7LbBkCIzW4FAaTW4MN2e1hiGkTgEJuT93VUt+o3J8bMWRkxJL?=
 =?us-ascii?Q?dmkHaUqcCZCKSbYdBIhGqOMm8TqKR9kEIBcO9ztOBTFdnirCmJ0Hb6d43fGm?=
 =?us-ascii?Q?kvzDjdf1VSqDbo/er8cU6EGRWpTgopK9LvqUoD+lfl1j7RG613FB8nsRHzNw?=
 =?us-ascii?Q?zuhQSBZl04LSK2CVfQW2VcW1uta4UA9ucpi1U1BGKwn7J5PaRfdIX4/RjOzh?=
 =?us-ascii?Q?4NoRtoBTaumI1+p8fBxj+/8t8yPLR7rKWwSry93OqDjR7//z5ZpiA6I3g17J?=
 =?us-ascii?Q?NB9/HJ/mucpONB7X4aEiTfhhWCkcdAZ1vo7akdY1kkHyNvumqqi/+Y1HSng+?=
 =?us-ascii?Q?iO4Rn72FGkCHb6cgYeIZsxln7zuYKw4KDAEOo5fO8uez1TELhd5wNZoiizk7?=
 =?us-ascii?Q?VgoXjU1FSQIATUnsxIq+0Remy6zA19iyb9wtazOIp94PhvRVo6HfNRQDcOoy?=
 =?us-ascii?Q?TeQGpQew9blwK9RkqZfI3FpevAKbs4BqQgQ6mTNp9IbYevCLGDw30vVWwJd4?=
 =?us-ascii?Q?0I8am5dAtLjZ1Q5pXvtw75vEb87VmTpdcmYsSXi+HPWODn/IBO4DQkJmpASu?=
 =?us-ascii?Q?Xs0P2XHLZCo5KpsI5Y3aWR99bvDIvkWn1tnn3LCaJ7AEsK++Jbru1e01x4KJ?=
 =?us-ascii?Q?FS3yObpEGzPWtijTSFfw/8a8ciq6Zx+AqH3hXA1MA/NgpIRSVA6PK1GBXTWO?=
 =?us-ascii?Q?TeCBtMNKytcdQdwuF9HHm3K1doyUzY/XpCja1xjCCffUA7xBSCi2CLa+4w6Z?=
 =?us-ascii?Q?TZYKBlcR5KzjRbYc0LSF8GQbdANpp2hFideZhxu8bD3t90aFWLnay3eT5rCY?=
 =?us-ascii?Q?UGZVyPIr7I/PI56obMwP6ykYbwLClj13+lKI/lW5yAtEtLKHVyNg4hUuR5oe?=
 =?us-ascii?Q?b5591gPBMldaRni1zG3CDjy2Gv8TlZs/EE3bJ0HJHZ0dDSnMNQyudDsQ9kzh?=
 =?us-ascii?Q?S8QWXbwo+NTB3laQN3sgwq0m?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081
X-CodeTwo-MessageID: 4e9e9fa3-dc90-4ee2-9137-7b1a6ff436fc.20210430154901@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR01FT003.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e50316a7-4922-40e5-1e94-08d90bef78ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3g5fHbc+fCy4HVh3GWL98N6ARbcf1bzA4r8CHRE6xTy/1z9yN9JNiKcnLOqcuxIjntl+j9kOZdJ6njgLf/V8vgdjBjPZxT0nXCd0EnFh/cNrIAIVo9ypBcyzNaptXw5cqhz8HNkurIuhOkS4WVhpqNBRb+NfNcYTkelH/RaA9Po0aV2iOpdI1iNP3jaAIiU1NoidU+bMyf4FoXaxKPWQAFxWZna+U9P0SHApJgwhAnfr7hAcqPjcsRKHuM1a8ydYcCHs4YlsB53D8fsOMw/nDRAXRRjvtb8cFR1duE5H611JiI3n2RR9q7x1v/L7s8s4OjfuDGoDTLGebjg0nNRiwqqxreo0eaUZaHDtdwssdmDRXmRLYjOfbje4r2AKbg7up7cdcDzTYE0UfUa/aVRqPUXRUMhVd8UDEwjEH2fDyqLZ6M405+CuQSZdS+ATIsIE+Ph0cZj1Mh6V+z1t0sUpqvELDhOA3W/kLdYsktCR7aT79nOgqoLBF3+o2aUJT+CKrzsF16lxEIsyrom2XZlMAMbdK4uaxkk3NTO9obRvjWjAaRi3dbhobwUlsjM0qP3uRI25f94aun4T89PmAsCjGANJwqRMbLfSNDAmhTPW5OVsRtDBFaCAGeWiA+XnITVtx94CUzpbFi/Scg+GtEXwhrqAq8Z2bBRXnSSCpW90jJGAvW4fBbHrUuG9qWKiLYHAHkQdLrISnJSxRcszltchS0qHuMXY837sinULhj7PoFY=
X-Forefront-Antispam-Report: CIP:13.81.10.179;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu13-emailsignatures-cloud.codetwo.com;PTR:westeu13-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(39830400003)(396003)(376002)(136003)(346002)(46966006)(36840700001)(15974865002)(8936002)(336012)(44832011)(7596003)(107886003)(316002)(4326008)(2616005)(8676002)(36860700001)(7636003)(356005)(6506007)(956004)(83380400001)(86362001)(82310400003)(16526019)(70206006)(70586007)(6486002)(5660300002)(36756003)(6916009)(47076005)(6666004)(26005)(478600001)(186003)(1076003)(2906002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:49:02.3255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b02f1e8-fdab-4e5d-5823-08d90bef7a29
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.81.10.179];Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT003.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4899
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function imx274_load_default no longer serves a purpose as it
does not configure the values since
commit=C2=A0ad97bc37426c1eec1464 ("media: i2c: imx274: Add IMX274
power on and off sequence')

All the values set in this function match the default value set when
registering the controls, except for exposure. The default value
of this is set to the minimal value for this field. The result of this=C2=
=A0
is that the output video is black when exposure is not explicitly=C2=A0
set by the user. By setting the default value when registering=C2=A0
the control to the same value originally used in the function,=C2=A0
this issue is avoided.

Signed-off-by: Bob Veringa <bob.veringa@topic.nl>
Acked-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 drivers/media/i2c/imx274.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 52ca9bdf0066..e0fedab267c1 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1461,23 +1461,6 @@ static int imx274_s_frame_interval(struct v4l2_subde=
v *sd,
 	return ret;
 }
=20
-/**
- * imx274_load_default - load default control values
- * @priv: Pointer to device structure
- *
- * Return: 0 on success, errors otherwise
- */
-static void imx274_load_default(struct stimx274 *priv)
-{
-	/* load default control values */
-	priv->frame_interval.numerator =3D 1;
-	priv->frame_interval.denominator =3D IMX274_DEF_FRAME_RATE;
-	priv->ctrls.exposure->val =3D 1000000 / IMX274_DEF_FRAME_RATE;
-	priv->ctrls.gain->val =3D IMX274_DEF_GAIN;
-	priv->ctrls.vflip->val =3D 0;
-	priv->ctrls.test_pattern->val =3D TEST_PATTERN_DISABLED;
-}
-
 /**
  * imx274_s_stream - It is used to start/stop the streaming.
  * @sd: V4L2 Sub device
@@ -2101,7 +2084,7 @@ static int imx274_probe(struct i2c_client *client)
 	imx274->ctrls.test_pattern =3D v4l2_ctrl_new_std_menu_items(
 		&imx274->ctrls.handler, &imx274_ctrl_ops,
 		V4L2_CID_TEST_PATTERN,
-		ARRAY_SIZE(tp_qmenu) - 1, 0, 0, tp_qmenu);
+		ARRAY_SIZE(tp_qmenu) - 1, 0, TEST_PATTERN_DISABLED, tp_qmenu);
=20
 	imx274->ctrls.gain =3D v4l2_ctrl_new_std(
 		&imx274->ctrls.handler,
@@ -2115,7 +2098,7 @@ static int imx274_probe(struct i2c_client *client)
 		&imx274_ctrl_ops,
 		V4L2_CID_EXPOSURE, IMX274_MIN_EXPOSURE_TIME,
 		1000000 / IMX274_DEF_FRAME_RATE, 1,
-		IMX274_MIN_EXPOSURE_TIME);
+		1000000 / IMX274_DEF_FRAME_RATE);
=20
 	imx274->ctrls.vflip =3D v4l2_ctrl_new_std(
 		&imx274->ctrls.handler,
@@ -2128,9 +2111,6 @@ static int imx274_probe(struct i2c_client *client)
 		goto err_ctrls;
 	}
=20
-	/* load default control values */
-	imx274_load_default(imx274);
-
 	/* register subdevice */
 	ret =3D v4l2_async_register_subdev(sd);
 	if (ret < 0) {
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
