Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C665A6BC1A9
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 00:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbjCOXpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Mar 2023 19:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233108AbjCOXoz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Mar 2023 19:44:55 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2070f.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::70f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBE351FA6
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 16:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOKyEzEnfBKAqbNKKxPwbYb/5IPDfIYAZZabzhZ9uiG8uMXUbrVqEtfx3z4HViZIoWSk/auV9fty+0KhiRs3Ioxu4R2e0zUfeLsqX0evgnQvPO/9AxQMqFndXnZqkQkFlNxWaNYN2iT2ebrIletweLCrEXveLF/NzYBYmpBE6iL5+t9rJ0JURDZjjTEBk1JgyoC1f0DhTdaip8mTM9eaKHexR+IccS7zlTrPbKrvyftdROaLGZ6OxZqrRDxt2tMNxXawmbhWSNASP9JLIvxe6UszZMBvx8PEBnbVLkFd1y6eEJqNog8WIrFKYLeFbt1TI/gA4PFqdnfXSnEQsTg2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egCPtQeRckyDu9zaf70OdeqgPOLRzsClD4tB1NVPG4w=;
 b=ixrSjs1oPYdmuJsei/w2xVaqFbGjem5/ZXgfStjJ8IoS9PwGElwTn6uQEYaU+uqg3xp0+DElt7ofOv+wD/r6apKhLPOmy2dJi+iv8cb7LpSt2FlIxhiMoZcqZUYR0QIVFj0e4ryVpO1QlAc6J6tpeW+vexje0DpWFiPqcQpPfieiSr8AncWuFiJb8LrkFlKXTPZEocWKOV4P0nFIY9ibnss4LQUMGbH0IafnNHxAsC/pPz7n6mCK6Tqs0Gh5Q50MAv27YLuYFxV2G+j3koYRsnSWxWAdGHRdf6AM7SpthDM20EAVf8/d4x8ZRGhv2hz32Wi4ouNEXz0um/tNZU3qdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egCPtQeRckyDu9zaf70OdeqgPOLRzsClD4tB1NVPG4w=;
 b=hV8w73+mJyb5/8JtbG0++MwQ3ff3Lfs04T4vlsHx5SlYsgBunOwa9ga0apwT2x4ry1dgjPdnKmnE3wMrIGB9nW8LIXAsosRqoPInR2fh45MBEXJvHzgcTqq1hyMraKPagsJBPwB7E8CvpmFzU1x1aCVlnM/15Zppo2f5Gr79sBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB12049.jpnprd01.prod.outlook.com (2603:1096:400:408::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Wed, 15 Mar
 2023 23:38:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.031; Wed, 15 Mar 2023
 23:38:09 +0000
Message-ID: <87edpp1t7j.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] media: i2c: imx290: care CONFIG_PM
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 15 Mar 2023 23:38:08 +0000
X-ClientProxiedBy: TYCPR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:405:3::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB12049:EE_
X-MS-Office365-Filtering-Correlation-Id: cec8ede1-9e7d-4ce2-7ce1-08db25ae5570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8W+rkESsQnZWybezWpPhGB0gqhyGRCcgYbJXmV+An1gz6T5n/+0u7NFEDjNvI24P5mHhDVRvjZZFlpE/k/epYl/PQZ2nqpmgoKLDD9adGwLwAi82680hvMD7c78oAwbZeOZJGp3V3b6Nka5TGbB3l+5dUec2JljB7p9VPIvy/cPw6gR+O7wg98YXp+Apg7rVQaM/DoLhDQtVL4G3tlDpJVA4lhk7wt3Uizc1164gzQ9YCAHobWHBV5rjSEkpapjDkLaQt8HNMDohKrth2PYXKE40vOs82PolSJhvb9RVo6Kp9iQ/whsgh7WlZQAtEYYeO7/0CCvOAxQ3UPdSDniObhNrTgPT0iMjqK6MGtO6gPNYxT2t8qbF0d5FqHqFB2gh6fkagpdiWOY6n8NFVIWmjmBSYhrIEKNHTx31BvJkiUhsyrVaAutp6xbzm/WcSzg2jYHfJEi9qiQO3MYyaawCqNKF2DnDDgKWroaZ5wz5HVGa/uOWZMRd7nThEWdnfR3Oo4JVgIVe1oHv056/3Gs6GmCERJUzBO8ywIheOK7k6/kqvuBM5lNGXMNiMa1gq/1hhjWUk3ZSiwWODtAHdB8Y9toCubWBWgo+SPG9Zl6Mk/EdqUg3ZyjvE+GI1tEBiZ8jQ01qSfyzwepnBUielX0zo6eA3QS58GegJLgPacNd0W7uFFH1fwqO9qz5ejUfx7TZEjicpYlZf7QchRVmspNIJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199018)(41300700001)(5660300002)(8936002)(2906002)(38100700002)(38350700002)(36756003)(86362001)(52116002)(478600001)(66946007)(66556008)(66476007)(8676002)(6486002)(83380400001)(4326008)(110136005)(316002)(186003)(2616005)(6512007)(6506007)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l5I2WOEH/eQoSV1qsh1x9fAT7fK3SNIIgXhsnIi85NlhR9GU0H+B7RbmRRjv?=
 =?us-ascii?Q?/whyUWTy0CZTE7WB2ewDUyqFq1XH0ztNY0fAg58cdtyK8uf556zkRfYrlL4v?=
 =?us-ascii?Q?rkFt5rNWzCtaOD2/gvqAVbvC1kqPPi1AbbScsOUNd0rOdKgTQMVa7jZrmjl2?=
 =?us-ascii?Q?WexV4Jrk+FEjC7loqGqM368mubnwp1ZKJ3tREjcVU/KoyfHnoa5BvZx9CwRn?=
 =?us-ascii?Q?ggwDPL3JJuTO3kkx+797BFBWOZ/fixZq9hNpTtqg5mNuJ7CI2EpmC3u7Oqvq?=
 =?us-ascii?Q?pddC9h2PQToFg1IROyDLMhQ1dY0IjjxUjPgEolxeT4h6JouYYq9E933bGkRq?=
 =?us-ascii?Q?SSuUXh3e1Qt5RCfDYdx5Ke3pKi4wfjTycTaxTdfFCvDMpJ5iJo6701/Pk2AV?=
 =?us-ascii?Q?qayAUuoduDrlUSoVdq6WpYTqeN4ghvEc3bovw0BkfrSokUdGh1JPeo5n15DJ?=
 =?us-ascii?Q?UJbxI+x2gjbUduJftaufv+aG9KpvhFB8KD/0siQF35K6g6k/ucIexOU2pAY5?=
 =?us-ascii?Q?QDX5GYmREmBz4m8JcbH23Zs432sNmCNkrMkvXt7pFTPJKu5taJ9W5UCiqj9i?=
 =?us-ascii?Q?xpTGKTeBn/HMBShCbLBu5DFAtsJotWW709SyKJNl3SVOAQGfF9IoIIlZzEtx?=
 =?us-ascii?Q?b5frusS56BPqU+wHXCl+rFGFoyzGjS/L4Y93LCnC0JYOg1RXgd7Ei7dD+bag?=
 =?us-ascii?Q?kinzvEP1BWRcY6KvFTXYyaT/W0nTR2R3rcZhJkbN7sV+l3iLrC/ihHhik6eu?=
 =?us-ascii?Q?ufd+LhtmYLuhw++UIEPEfcQ6U92q1TvFdBe6DnEgJ2KSSPSenmBh9J0HWEZA?=
 =?us-ascii?Q?EindAc0DJyFIijq3YPkntcrLPEUzb131p1xqmWlULD9nqf6V0NdAxvsuy2jT?=
 =?us-ascii?Q?Zow6lloj9f4dYOPe6/elJekPkNnuvkfxQHo4YHtRDXTvRmoXD8kjTfoNynvN?=
 =?us-ascii?Q?Y09bTnLSRT9HnKgdN50eW3+iOTqjlDkTxjrlW4b2tKL+WGla09CzXHTXMOPd?=
 =?us-ascii?Q?DwNrSVjDpLZ7n42ATRQLyOAfYrWlhkMKBv+5G1AGql4nIcqZ0dR12bY3x5oD?=
 =?us-ascii?Q?KPfXuXBTn2Nakwi8lu3pSea5+3FAvn/PxQYPtYfHlXvQPWYpaiC46BBKXJlY?=
 =?us-ascii?Q?HenjKS1rJgVucVnOdHUgAVX9Nuiwdm28FatImjGxr0fA/4kIzHcvTiY+qP8W?=
 =?us-ascii?Q?YrRHXv5MRzfAOHWLDl5WugC0wUVEjy+HtLmByTJP6F5UtPuuTdxQuViMHBzF?=
 =?us-ascii?Q?0e536kj5KHv3NHS4nmSkpHOBSou2/iqhm0Z+mLX7rNyyjYN1ycvXgoOrQI5y?=
 =?us-ascii?Q?kdgILJrbfH878T79xlsYVt33n1eEXaVhAiEDSoKhrn1JqR/RjnGFN1reY0J0?=
 =?us-ascii?Q?yiM97SQcDEj0ewSoxhS+q9vj2HSd2usO7A5VrSUnqI3+NHqxpttg5p39T9p3?=
 =?us-ascii?Q?vOpn3ZVRZLnWyJgUGGbAUCk52EoCVcZpyNhN3M/7icmudirRvoOSRLsRSvQA?=
 =?us-ascii?Q?x66mL2ixhIuD6s681SufMpR9acC0IUwU607jeMrUXrHIlMrdfswiAzubWOmf?=
 =?us-ascii?Q?cFvzilS9hDNvAldLjaUfRp3ihnge5FSFbW2qpqKL2o/Q/mRVk1ckdJfEJ6x7?=
 =?us-ascii?Q?BJkkHMnvBGwrB3ArMP2BJRs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec8ede1-9e7d-4ce2-7ce1-08db25ae5570
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 23:38:09.1967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZatcSmX3t5DsyZzb34aPCM1YwmAxfBnZnKpPt8C11/XZwOF0boLhpxSt8ifk9hENJerx4k0r8p1cxEAQ9IApW03nYEbp8PepDd8aXVCh5AfltCNrIQxE6j/+rfgiXt//
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12049
X-Spam-Status: No, score=-0.6 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is using SET_RUNTIME_PM_OPS(), thus we need to care about CONFIG_PM.
Otherwise, we will get below error without it.

${Linux}/drivers/media/i2c/imx290.c:1090:12: error:\
 'imx290_runtime_suspend' defined but not used [-Werror=unused-function]
 1090 | static int imx290_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~
${Linux}/drivers/media/i2c/imx290.c:1082:12: error: \
 'imx290_runtime_resume' defined but not used [-Werror=unused-function]
 1082 | static int imx290_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/media/i2c/imx290.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 49d6c8bdec41..5f15b51dfdd3 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1079,6 +1079,7 @@ static void imx290_power_off(struct imx290 *imx290)
 	regulator_bulk_disable(ARRAY_SIZE(imx290->supplies), imx290->supplies);
 }
 
+#ifdef CONFIG_PM
 static int imx290_runtime_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1096,6 +1097,7 @@ static int imx290_runtime_suspend(struct device *dev)
 
 	return 0;
 }
+#endif
 
 static const struct dev_pm_ops imx290_pm_ops = {
 	SET_RUNTIME_PM_OPS(imx290_runtime_suspend, imx290_runtime_resume, NULL)
-- 
2.25.1

