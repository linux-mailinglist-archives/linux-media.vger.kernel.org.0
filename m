Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D14442119
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 20:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhKAT4A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 15:56:00 -0400
Received: from mail-eopbgr140082.outbound.protection.outlook.com ([40.107.14.82]:8006
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229560AbhKATz7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 15:55:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkQmn/ggnF33448y9ow3k0OG5hWS+LOC0bO+h/ZA25JW6tGoToArkN8J+a1wK/FmMrnLEXOhzks0IhR315YrH4zm+WgrpoJvTHmzojhlcVYF1Ol23qW+oMHMnSk4C/aRbmT5Rf3qpCVr9hcQ0KcMFs0XX8s8CliOO3Fm3Fg0tmLAozbQRQD/UqPHOUc+EAXDKuAqKduveUYC1v4e4yVnJ0Mo5he3i/N4E0VYUd1jhiJAlAoqPxOqdj9vY/7mXCEn1sj2mwmY3/l+MHBErdwHk47/KSV1sGer4qX1SJ5/lBdDZCVqMKy8Ujm/VCnmeQ/bUvsm+0S7IgioLlztYHfqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=443ckIL0ZAOhjdzSKZ7CmfKef2u9v4xrWU/G66y+KQ8=;
 b=FcHEzc9Pu16HXbfmR36aNscybuNsX8CaPL9kbxy5ll1ZUd9HlzJdpan8hVOHhyHZdgGAnVPLFbFrjR1LlpAmE26GHsVkk98Lm+zy+Hore6F65mFGhWH9e0Wcwm+5Yl8cFUBHDu712UgQ/W2gCL/IGntl7h+u18L8M32c907F8h3nkSFlNpPgk4kjMjyV0cJy5g9VrSWbO7R6Jz4oep53q8rR6lfm0+fQgOCh5fsS2Y1U0UWCDVNfxKOlSUguRDTnELqIP3BMUDbGmj3jEyF9uhpq2DqUDtMbQXFow7+vVgwwLr5EKwMw0FWg8TAx4X/t4/Es66D9EQek+BmXeAL5bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=443ckIL0ZAOhjdzSKZ7CmfKef2u9v4xrWU/G66y+KQ8=;
 b=XCMszRgfROLrxjx9uGY9WAVA8iXNbOYveIafxj3+bk8g/JIJAKOoQ2VFbczx6g1gn1gwVLp+KxJdOpV+jgRzXBhTyll6iY4kI3Iu7Yzt68bjN72Nr2n0B0GbrnQxpq3Dlms77Gi7NZt/0fvPEhnxHQ9reDgeuIr5AlwlEabdAhY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 (2603:10a6:800:52::15) by VI1PR04MB5775.eurprd04.prod.outlook.com
 (2603:10a6:803:e2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Mon, 1 Nov
 2021 19:53:22 +0000
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::ac2e:fc4e:176c:f891]) by VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::ac2e:fc4e:176c:f891%6]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 19:53:22 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     slongerbeam@gmail.com, mchehab@kernel.org, hugues.fruchet@st.com,
        jacopo+renesas@jmondi.org
Cc:     guoniu.zhou@nxp.com, manish.bajaj@nxp.com, robert.chiras@nxp.com,
        xavier.roumegue@oss.nxp.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH] media: ov5640: Fix set format, v4l2_mbus_pixelcode not updated
Date:   Mon,  1 Nov 2021 21:52:51 +0200
Message-Id: <20211101195251.700674-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:208:be::23) To VI1PR0401MB2495.eurprd04.prod.outlook.com
 (2603:10a6:800:52::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.168.7) by AM0PR04CA0082.eurprd04.prod.outlook.com (2603:10a6:208:be::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 19:53:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ecdb94d-3065-40ea-f497-08d99d7142a9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5775:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5775DF146BF426D58BB2D477CE8A9@VI1PR04MB5775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GFiVFAKxtYj4OGG6zFjLwGYgjEbHh57ZdZAjwx69qYXRha0syvE9OA4W/wSyfUO/hVTZtgBdxqoydeX3mjaYvtCqKkijqkA01MnrniZSBiGyKV+QueyVWQ0s/t8NcfthoT5AekhZCTio00+Nxi0FwvU99Q6BIr8YuRHbX5O38fY9aaTF7gu/KfJ8HZTjuTn1WCpurFddByQ7o/P26LpkpYp0bnr3iZkRTZxgBH4jEazZeZjvCeK9SuYFAGw/Edb1R2YqnjlRbLXDL5Nmtrf/UyBKTHRE8RM7LKatX2NMxYfn9JvZkI11qbdbRH/dge5fT36gq845CE0bYbRKSy9e+mI0/VIJyLZGb2mVxV/qHBc1lBtJvkj9Zy199dmu0kGoXxL7OtcQfsVqoCtTi9Recz8qWJo0gitET1A6n0cSxJCMrv+0Ukl0Ca6eiRS5XsmPuebbsKOyZPSlrPuTqG7ffNwquEWaZ3/t3ON2gy374N2R0FVmxy4X8rk532IaQ170z9Z9yQsU3WwC+ybg2hrMI/xJe7yjzWtPW4hdA087mNUNzYIMNnK21zMEolncrkBsslaRHwnX2yYEy433h50Xx2RE6rV/JqpwyUEcnjPNWgBREOjB9xEVzRT+DZsk55YhgGE00HGGDQgYoIjt3/GnitZQqlwEnEQUE/ykxFz2EPUs8Y6teFdQjGJbigSY00jBzOMq5xmHboWChK1V+OY4BA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2495.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(316002)(66946007)(52116002)(83380400001)(66556008)(66476007)(6512007)(8936002)(508600001)(6506007)(8676002)(6486002)(6666004)(1076003)(38350700002)(38100700002)(86362001)(15650500001)(186003)(2616005)(26005)(4326008)(956004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eqJkRmjLF2gftZv7tqzuaBXkFGyOkaMxNzFMYGiYbJDuECn97FPgwF1mXiTm?=
 =?us-ascii?Q?q0xSCROde1R/CoeAZxebkP3x8JC0SGPyxzNMkaPKH3jtBhwMljjCaV1EZB11?=
 =?us-ascii?Q?f++tCSyRkWHsCGiz/1eEFQdrD32PEILNMXapS4Wxsh06roX1l2DP691Vx+rl?=
 =?us-ascii?Q?P7aKIpd5prsEt5D7NxskFn+H80oazFppRS7wOOHmiThRUvaeXarDaE5sW+K0?=
 =?us-ascii?Q?xRyKQ5EAf6yyvl6ohRho3atm9bJ+wjnM2GaeCXr1XRR4luQLAmX+Ig52a61y?=
 =?us-ascii?Q?6vt37jiXAjPmdgCXhaeCvZeMeeTUfkJuC60AhQhBtxuoUXByOLxMYFvkAUWH?=
 =?us-ascii?Q?VuJ8XMlFLJcG/nuYj35NXkfOO2V5AHWKCCkxnaLiUv/g3F9azMJqBWuK6RqG?=
 =?us-ascii?Q?EkbflpN022E8hiMBZy+ntxbKzwNq3rcXgDxgIDPfHVs70+fgmvDaUXq7ecEG?=
 =?us-ascii?Q?XvrT70MvpHUmg1nu1FYBMsDPPaopnY8nxFXxwonW2PWCcGTvvY/Nas0hJPqs?=
 =?us-ascii?Q?wxss+RBSPaHs3WAyzYJImubhUyPYTgYk7JcI3lC/T8uwe5AlPZMi8wySBY1g?=
 =?us-ascii?Q?MI7J48OcO9ejCH9uqPXGSkO8pnzixtb8VUZO2OXT0P1KcCOA1dvsbXo+FZ2l?=
 =?us-ascii?Q?o7bCpSSSxkz4d4t2nWLCrt3uy1u+VL72Ndd33NpVcid+ACWmOxuVN4aSm7ES?=
 =?us-ascii?Q?XAHafu3QzaO3BDQ+DoXx/QJVe1k08SiajFPFJq+6hqg9KMjRkQoryLLHChsR?=
 =?us-ascii?Q?g8uFh5XF8mfe5DwEoDPYykKJ1QbPksLKSgJJvjTqmcxZg263UXt95WvENo43?=
 =?us-ascii?Q?LQMI86v4kCOw3isuyVH5iihr3t76RTmSpr5j6m+Bpblke9MLqhByLKYCrAS7?=
 =?us-ascii?Q?eZFFtybOAlqvL9rD6A9ZFQTrIdlQHSqrwsFAgheZuGGfADtghuVmyRdk5bIB?=
 =?us-ascii?Q?cwE/z/WzdF7AXOZNvTFdu3v0OHSAZ0FTTuliLU4lIaVxbYalKRZGBXecAxIx?=
 =?us-ascii?Q?p2UNbatbC/NJgP9Wp0GpNGqO+Gy96oQCEpgTgCrrnZxuvnCyckle+VS2E3rA?=
 =?us-ascii?Q?d/hGR8fz9drRg1OHRXTLLw6JHkPhq3J1bK8/xrizFXYjX+gt5tCWN/hPMDIG?=
 =?us-ascii?Q?hEtP50FXcROQfb9BItPVeEgeSPsqY1mywQHcUdPBGCQ35/PV8zg8NL0ji8bB?=
 =?us-ascii?Q?ahysyGd6xRFR1tBe9o6qbyOVEKF/l2wf++Pn8f6pLrtZivQDJi1a6Ud3Fsu4?=
 =?us-ascii?Q?Q2ybWt/6aLr6iVdVSJlFWKRPoMmY8GdIue5AI+rAi3R76Mn2LMzjFqYetA+N?=
 =?us-ascii?Q?w9vBYT0FX9jEGGWv79OxJ+jcFSgu8yP8rH6TzUxVmEvenlnuYnRfgslaaKh9?=
 =?us-ascii?Q?5xH7LfHPB5qRgrlKLhWWK8naH0djUAal1tTMeN3HjUtJCqJ4AMMMPMWFQtK+?=
 =?us-ascii?Q?RDkuJpaE/siEk8cGKgJQSzSkzLtueolDeX2jgIcqI2mp2V3p8XIXf/C5LU45?=
 =?us-ascii?Q?7N0aKJYoSN7QSbEovSNpEu3ESuv4+2M666Fidwa0ufaJoJnfSCK/iOnBvn4y?=
 =?us-ascii?Q?9odK5XdTIa7vodZDV9Ik9K8kTIuxKCFGyDtmKELYoe0Hi+mbkjPDTgDee453?=
 =?us-ascii?Q?Bqt9bRWwj8rNre5uAGpKvt8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecdb94d-3065-40ea-f497-08d99d7142a9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2495.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 19:53:22.6744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzyT1UuT2VGw1oBI+UEeBcmEAfd1SfWTQA/2+gYATLMS8fcNyW7JmujCuiYcZdsQP2Iasg9kCuoSqibZ4XuD9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5775
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

In ov5640_set_fmt, pending_fmt_change will always be false, because the
sensor format is saved before comparing it with the previous format:
	fmt = &sensor->fmt;...
	*fmt = *mbus_fmt;...
	if (mbus_fmt->code != sensor->fmt.code)
		sensor->pending_fmt_change = true;
This causes the sensor to capture with the previous pixelcode.

Also, changes might happen even for V4L2_SUBDEV_FORMAT_TRY, so fix that.

Basically, revert back to the state before
commit 071154499193 ("media: ov5640: Fix set format regression")
as it was more clear, and then update format even when pixelcode does
not change, as resolution might change.

Fixes: 071154499193 ("media: ov5640: Fix set format regression")
Fixes: 6949d864776e ("media: ov5640: do not change mode if format or frame interval is unchanged")
Fixes: fb98e29ff1ea5 ("media: ov5640: fix mode change regression")

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 drivers/media/i2c/ov5640.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index ddbd71394db3..db5a19babe67 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2293,7 +2293,6 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 	const struct ov5640_mode_info *new_mode;
 	struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
-	struct v4l2_mbus_framefmt *fmt;
 	int ret;
 
 	if (format->pad != 0)
@@ -2311,12 +2310,10 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	if (ret)
 		goto out;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
-	else
-		fmt = &sensor->fmt;
-
-	*fmt = *mbus_fmt;
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
+		*v4l2_subdev_get_try_format(sd, sd_state, 0) = *mbus_fmt;
+		goto out;
+	}
 
 	if (new_mode != sensor->current_mode) {
 		sensor->current_mode = new_mode;
@@ -2325,6 +2322,9 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	if (mbus_fmt->code != sensor->fmt.code)
 		sensor->pending_fmt_change = true;
 
+	/* update format even if code is unchanged, resolution might change */
+	sensor->fmt = *mbus_fmt;
+
 	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
 				 ov5640_calc_pixel_rate(sensor));
 out:
-- 
2.25.1

