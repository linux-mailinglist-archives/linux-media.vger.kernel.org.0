Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB14C44FEE0
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 07:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhKOG6S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 01:58:18 -0500
Received: from mail-eopbgr1320109.outbound.protection.outlook.com ([40.107.132.109]:17046
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229780AbhKOG6Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 01:58:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz6f8jL9B/UXRfQCrer+CBJSVfb1eXSbAwhYQM9WUCu5VFdSf25/X3x5NME1s2BueEyu1OHAb829yZnAdpl2iOYTjwzzyelCAsbMLTcv8Os+QVEskYF712d7YSX+4/B9qdN3rdciNJ17jwVXWjlNrhhNDPnxYbRh+g1/BfjMOYQMrS9VLZ9bxkFWGWlquDL39qepk/j1gE/63+SZHTVAsAlTkMqBjqbWMxfsZeBbZdhbARpsg4XjFjQyOlMOh6/FrsYgURpNhVRF6SbSEYPUocL7K7CAvdv6dMY7CFiLHL3F4c517RtOxGBX85g8I0IAO9mgHZdh9wAudQRzyB6StA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/JQvz0+9LjG23flhFj3aYioueaP/cfCarSyi3F655U=;
 b=kpxwW2luBiET2wd0wicEgR66b64nUmlZUXUH9E5aNXFeu/QMDFyLDtBnSsXqkfQPm7aPwtGfIqHX0mDXZUEeD4cRABD/YSkeKX6aWLhgY5sLXZiqzg6Q/WeSh5IkEBab0GO53lEyqRhpobXww1y2EATL4PNAKl/XnfYoZyGLKhaCOsIAI7Z14MJ9Rve+3AwgJjXo94zGs/Xnb7wZCObQWEoDGURB1a23Gt4oTd/rFGlC3Ti/eaR11G9vc2teDmULXWBNa0/bNbasJ4gCVlGKashdiwbm3sc0tuIvpsvWDc+VuK0GMRrD91c713Ucq4RuDgNYovB5bnjvJBwd8/8xGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/JQvz0+9LjG23flhFj3aYioueaP/cfCarSyi3F655U=;
 b=HicZL+tRmnjveBsR5iIgUIJrQx92K4bxWCvITnynmcY8v147FCI6Gm1ZvxTgUKz/8wa1aiOQYtDMyUwX7YmI1KVocivX9n+yBoHv8QhjpBRlawK30bjrelhQYRpXaGJtD4wkSQLFkIostfRB0oMQwT+NS8orx0p31wm1WMT5DN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by HK0PR06MB3731.apcprd06.prod.outlook.com (2603:1096:203:b7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 06:55:15 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::814a:4668:a3bd:768]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::814a:4668:a3bd:768%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 06:55:15 +0000
From:   Guo Zhengkui <guozhengkui@vivo.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     kernel@vivo.com, Guo Zhengkui <guozhengkui@vivo.com>
Subject: [PATCH] media: imx: fix boolreturn.cocci warning:
Date:   Mon, 15 Nov 2021 14:54:58 +0800
Message-Id: <20211115065458.6601-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::20) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
Received: from localhost.localdomain (203.90.234.87) by HK2P15301CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.2 via Frontend Transport; Mon, 15 Nov 2021 06:55:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 557c29dc-315a-45ea-a17c-08d9a804e0a1
X-MS-TrafficTypeDiagnostic: HK0PR06MB3731:
X-Microsoft-Antispam-PRVS: <HK0PR06MB3731C3DEF079EB59DA6C6C62C7989@HK0PR06MB3731.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kHj0r49Gf0+rf7FsumaxSnoGRHyyhFh8iIvFaBGsvxP7yi1AjQX6ZPxLjhLvGCNE154PFe5xapb7OxDgRqjq3/sablJ6jUiNiXuwlujFsvfLgQ2V2SmRAO0OskIgS6ZiV+5aC5ACgfPNnnqa6Q2WGSaw1QOsTFJzHlYAf3S/i1ylIi4KSzxZfP7IX+iLxBQpUhfZ+T0aRHqC0DR9NbjZyBcico1oc+6EKHcqd10alpugA5BkvdIDo+CL1uyJFh6rAyse3o2CQgH6uRlS9Kf/NPXcZvAZIlI19RpJ8YLQwF5Yb/UP+AKlr5HvxgVfI6WY1Xk+efdAE6wTM2BRGbFwukK0Z3lp/OJ10i40y3cTliBakotKAo7cWMyQ2hf9vS0AXtoYTHMkQYJ6eqwwUXnNXq9oUhqoxgb8BBKFSojvd7NEXPA+5mIfVDiDSTqwQxen1deBJMDm4ezzeZ92s/j63RB/Napf+VQYfWdtLp/K+UEcD+7QCIm4sg3yQrUXpB1crrTIwlobktw/q1OqrPvVvIPR9wGoCWLbIOUMgEqlxGRNYoGGIKRdAuVDO/4W1G++UyDv/ur+Kb4Uz6Y66hbIKFAFKF4IGN9BmuiJsnpbr7GbKoo1nak/q4CaknRYzrylfjudqbBFXdOHPt2umTeV2kvfFHJnns+tgyg/gUTSs0lluss0SHLj5/aId9S+gRHuxpIDl+pQSp9Bq3P4xWeWgjnXlcrnSnVPK9C5HZP6MYk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3492.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(38100700002)(38350700002)(66946007)(4326008)(52116002)(316002)(6666004)(110136005)(66556008)(66476007)(1076003)(956004)(2616005)(5660300002)(7416002)(4744005)(83380400001)(8936002)(8676002)(2906002)(86362001)(6506007)(107886003)(921005)(36756003)(26005)(6486002)(186003)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nqNy2od+SZvBtqU+UAxTaTV0iXFJfww5QmiZNJjmZA8ZWC90LAdWBMJwoWaz?=
 =?us-ascii?Q?z+57h8LynJNIgogdO86dPUr4yStIeFwHeJ/fxQEjGTQ3R7z6b1/Sj89yUoPr?=
 =?us-ascii?Q?/NyLHchlfkmVOiBWucFmTEonkYDKAtCVqG19avehJDoJUMBQ/JhGizYCPdx7?=
 =?us-ascii?Q?EDW7tCM+AO88tcBNg/7L69u+WaFD34j0PMtf2nduYQrisbZipFMJ/rhoV/5v?=
 =?us-ascii?Q?fngHoMM+CXZhzWkKeykZ6EmKt5j3U+fE2g02Z0F9Z+ZAnVb1M8Y6acBrLDM1?=
 =?us-ascii?Q?hrFem+PIYKerlY98dIF+cagtENAFN7432tZhqp3G0dXWVsVilhql6A3PkfPi?=
 =?us-ascii?Q?cFaDoEOxpNVWclqoLQ8vicwXh3A/DKf9OVOVadFMoY8SOwTINLUiUhR2iM8Q?=
 =?us-ascii?Q?CYPdcH7PcfIVAfj/xiqR6DScqOEYOLMW/q/5tjjxlAEPFXRNzjDyCQCFudqD?=
 =?us-ascii?Q?4rP+A/iXil/FcEuX1nQwJ/HVb7OXrv/AN0MZuUBUujVP0SJFJRvezsVC2OYT?=
 =?us-ascii?Q?bbSUEsOf5VWsi1NzBOmMOr77O8ccDDBqjKrxgXW4BKY+4nBnyU7E3QDmeD2l?=
 =?us-ascii?Q?mc1A+HxYOWYfB/rSA8fbsttFkzP8dE6qCCaeluW4cf0ooFRjH+nyfqUkaSao?=
 =?us-ascii?Q?VCBAS+xRnu+BvvvFVd2s6JhQ1338278awSQUwjpe0kaQVnXzyqlBI116pUyi?=
 =?us-ascii?Q?yRWh1PTkelik3KWGaA5jDLly6kq1O6rl5AT/O546cGbMJFRX9fJhqtKp6QpA?=
 =?us-ascii?Q?uhJUhGPPzJ6ZPXvSyJIkX9ddb1d9dp5yXHN7TN3YQomgeMIJDIFvshGqXrGE?=
 =?us-ascii?Q?xjWrXjVq6vZC/f5Kwtw2aTfecdsPyIYHfvl6QFOHzBLSzNcNgaKrK44Jygpu?=
 =?us-ascii?Q?rGOhHBP9iNqgZQzaf8hryd+jfIyZBKow4Nc4s8K2iuhauvuRSi0VxCCccEb2?=
 =?us-ascii?Q?6zgQRuIDqu3Cyb9WrlDwJXkyrzr+n1xlEAjDhQiMg/JRNIzBYMzKzlEliObo?=
 =?us-ascii?Q?BjbtvQhaJZxXCxUPLCz3460fBXI25d9OqVzlNPzPajArXxYhW1lKCAK/MZYt?=
 =?us-ascii?Q?N2HNdjXQXQgjrpEFXe7jGQ3k1tKQlWBHnWB5c3rVh3nZr7qUo+gBauyuoa1q?=
 =?us-ascii?Q?wdPIx9RYVrAvm2PVNfTUAXH0+Pq1a21nOfGAb7Ydx9S3nqfZXgRdMfKEFfg3?=
 =?us-ascii?Q?NYsLBFlmPL/NwFksxk9WhgaLFiFaZItGalPbcUy+tv868CiPczwf/JUCmuPQ?=
 =?us-ascii?Q?3opn2EhpXNnMsYvGnKuqK0VjsQJ2BzJqvvn1a5ZOmE0MR0+p36tqC5WOM8W0?=
 =?us-ascii?Q?vMjvrgjohR8YP1bp/dKOa2ks+Ede9Djs7ltO5mnL4lNak3H6qenmqUhp7lU1?=
 =?us-ascii?Q?NaTUkK6wVCw8OHBDLXqjoMLU2DVkRu4OaXy79qoFvivjsFslQvBx2+xP2FgR?=
 =?us-ascii?Q?m44FQf1p/LUckpPsMtPpKxFwsNXWep7ZW+3Oh0zJYldA9LwrzeUJhdh49ME2?=
 =?us-ascii?Q?ueFWZEz8QXU6wg1DF1CCGJKwb17QpfU1QSw+/dMUQHDHOf2fLI+8PWD5pwWQ?=
 =?us-ascii?Q?b7ofEyS8Kg/eo3IeyoqncjB24aO2CYX+Ds/ZVpICaY05pQZZH99e1NsesB8Z?=
 =?us-ascii?Q?TxDjrvb/DgCpxrkjif6w9XE=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557c29dc-315a-45ea-a17c-08d9a804e0a1
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 06:55:15.3209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7eQ9pYqa4IScYFTX1ZHjRjuYYDGfe5Wa0tvxg43yCbo2pA2t1oWYRau0Txn2GpVkYq4DBtB28bxnJC6Kg2Tdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3731
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix following boolreturn.cocci warning:
./drivers/staging/media/imx/imx-media-csi.c:153:9-10: WARNING:
 return of 0/1 in function 'requires_passthrough' with return
type bool.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 1caa100be33d..bd7f156f2d52 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -150,7 +150,7 @@ static inline bool requires_passthrough(struct v4l2_fwnode_endpoint *ep,
 					const struct imx_media_pixfmt *incc)
 {
 	if (ep->bus_type == V4L2_MBUS_BT656) // including BT.1120
-		return 0;
+		return false;
 
 	return incc->bayer || is_parallel_16bit_bus(ep) ||
 		(is_parallel_bus(ep) &&
-- 
2.20.1

