Return-Path: <linux-media+bounces-20478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F5A9B4268
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 07:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50D80283270
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 06:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE0B2010FC;
	Tue, 29 Oct 2024 06:30:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2120.outbound.protection.outlook.com [40.107.239.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA69DDBE;
	Tue, 29 Oct 2024 06:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.239.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730183431; cv=fail; b=Qwx/L0gcQvkLWjqUTXI/C+7CKS0SBlBS/wix6sctAdwIzruYIFtjG4c+dfNYwr8KLk0RY/KkdZm7TonjVa1UoaUKJ58/DdLVMBeSXw0+CvPlI96zEAvpUBb7B7EYdv4mxv15eqSk2G0QMmNwSagNv/9ECfno/b8qrD6yt/v2Xxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730183431; c=relaxed/simple;
	bh=2Rgp0Hjdfxfq+IfwBsAg3FWUnOJpCmCXD4yuLrNxu/g=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=R+VtI/kVWArEIEa5y5oQnVr5pCl2qXsAzSEeKdZb5Vx8R8oL2Y7w5oM4A5JoqhOUpxiUVSNF/YwJscSZ0NT3UJGSK5Bh0VF472X7VzyfbXP539wS33lqC9Wt/TydblbKbmIE41myBKDTzPrPtl5rjdDIBYTR6hg47LLUcbXdCm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.239.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3GtPaxIzClv9lsdA+U0w6TJ8PqooF+nyUDigl0QxRxUCKxkbRNO3mO/bhdzK65yTMrsnhdwecPNxU1NkJCa5KUa772IzU0ryk+ienGFGwG+igwWEhwzTKUmhCD+VWdIjASN6/x7Pt2+aNgQF/8MRqL/DwJYZUPxxMsS27r5J1L8ws9kGWuHZ5coMgFAb59537rSkb6BZfusjpuy0c2muIgUTKwFkQclErpBMTtgmX59N4g2cnK7vu0EHOkU0uPksw3yr603oCJeQrwZJkKpeYgQmHWREmI6xwFtXKh1nHzFCfRhLt7nrw/C3mVXovp+osOieMyp5lVbkQ1YS/FFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2x4DrV74ZasV/i//G27trrM6VatJjdZl1e7a/JsFYkc=;
 b=bruu2w2qm3wFuoOv90eVyc6GO8GIaMMEbGSB5OKwMD4HFRw2WrZBqANjqZx7BL4WNGlYyd0F9DZHOgO+nn9/Z7lAqGmGJgWRyqdgh77GAzvJtMXJZuJxm09CayUzO4Qw78gqYRAWezoXA2Uk7B34haNTJJS9hHsqNnYtq6j7k/WIztPjtUdObEb/eqPGRwtVp/Kjv9+n9IlbGuSrI/rpl8r4ySsXD01OVwgAuSmzRBMHh54C2boUfR4TNhYrzw8hf4ExIxuA7irI9OeVRGIRq6l5RnyrCJAJKr/Gc4UJJYH1AXeqSPe20dDyQX8WqyaAvp5KeGyOKKk9PBqA7qFCKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0510.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 06:30:24 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 06:30:24 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: mt9p031: Refactor format handling for different sensor models
Date: Tue, 29 Oct 2024 11:59:16 +0530
Message-ID: <20241029062952.8534-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::23) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB0510:EE_
X-MS-Office365-Filtering-Correlation-Id: 1210b367-0939-4132-7e12-08dcf7e32ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S2rN8z0/cJ7qffEQs/to4kNWIBwNWURhElI2mRUbG7J4VAnWdnJhOvBTD1DJ?=
 =?us-ascii?Q?rj/dK2b/gfFVxfePjeGexALcG0qlGCHWB3S9G3uuyRC8UKalwUs0lvHTlyVc?=
 =?us-ascii?Q?zcoFQ3X7UbtM6usVYRYU6HOqi68P+TrKMW9AwIOItFIj3Hbc2fh7Le28ECpY?=
 =?us-ascii?Q?kYzw9XYvBPrpIY7vw7a1v6YWbO21VpmrAMWH/wiGvbXSKHAI7WfpSrDZicCk?=
 =?us-ascii?Q?hrC9XFOOSvFeX+qQtEAoW66yKNMFrNfq65Du5Gnjj10Bfcggh1Nqo8NCQFtr?=
 =?us-ascii?Q?min940BJOF7Fx498wsIZ8/6Vat59sQkvC5u3yFtrcjJP8fMPE5nIq5ihPwdn?=
 =?us-ascii?Q?vvEOA4v24hLHSrL8iwXoH5HYlu5yDj63OMY1gpp6qp8uBi37josFTx04xpCm?=
 =?us-ascii?Q?xoSZ0gxsgb2wkaEcIMJGRfLkLjJG/kqoGIaoTVXBpgL+FOwk9m0NF1Kvl7Tx?=
 =?us-ascii?Q?ZV8j1EO7VOVgDTzPXv5oouHrTJ7KiG/2lqFx5OYrpD+X4mVMfCiKcuXD7D3q?=
 =?us-ascii?Q?PYQx0NmyByVed5JLZVlZxVf90zFcfQin/aXthb4hw2dQZKTK6TdaqM3X7aJV?=
 =?us-ascii?Q?CP9HiRTbaSOYICBRLx4X/mtMaZqjGq9OrO8gRwQH0mDRPwSXuoyFZLKRHPPA?=
 =?us-ascii?Q?Kuvpbxeo+x2qReBuJJvFIjPYaUx8cydHkTl10cBAeD72SkfBjo5iDKhAf01+?=
 =?us-ascii?Q?/vBGre28JAsfgF8SiJKitIJkUPgx2qtT30EBc7Je7vHWkvMGpXeDtXMSeQgQ?=
 =?us-ascii?Q?NncLedriLHF7q0TiDgvGCcSVca0u5UIydEQGjvvN1yCO1iaS16XRQrWK4moE?=
 =?us-ascii?Q?+XUiY2Tz01OxSFnL53O9qI6ivl+2AcVeZRSK/hqMH+e2/sLPu2nnPzsh3lbd?=
 =?us-ascii?Q?XA4/lhG7AU2BXmvhuZckyM1AjNPtrLHgh1BYmsYiU6MdT2TWstS+Bn0fLQ9n?=
 =?us-ascii?Q?cmWUI9D7tlo0O8i9mUoLZx09aLmzapbQ7+E5rIu6uJF8tHACE0R2mQ15kW87?=
 =?us-ascii?Q?Kcz2REZ406oJX4fH+Njle739wWG2ct+ILy7IO57pbGAQ12iTS7I6Pn2L0+zD?=
 =?us-ascii?Q?oGxQilm0xIdCoqAwViL72KNHMyFlrLIFrqhWuwBviVHr7VJ8QPy4ZooxeTP5?=
 =?us-ascii?Q?P7QBZUvRluQJButQKb4/hWoQd39vKtoP9CmDYle3uvg9SFg4IgkKPtptlOjr?=
 =?us-ascii?Q?Qaol+rC9u7MFyYtkCwhMXCvuTOdT8p5pDiOvUM705OPwc4m0gOwENIS6KN0p?=
 =?us-ascii?Q?nzUNTGLbsw1yaErSlq9CA4Xk2RzTD/u4Z1mkWvIxgZn+fnpPqV6xTunVtWBJ?=
 =?us-ascii?Q?bYe1PLH2guDRkpS0u91ymCCHCrkqrOhPz+8By+f76nTmg4gXycid7cWO6seW?=
 =?us-ascii?Q?zp9+araoueWhL7YWbsvGCzvOBMB/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L3ZUIHPRREEc9FpGOayiaDGENIjtNDrvI9Qi4uSgsMdAJwktVI2CntGTp/mP?=
 =?us-ascii?Q?yDrAJlCm2Q5pQYXtHpbvlPlnEiYVZGVif0BTE+uVfLSwERhZZGxzcS3sPkqM?=
 =?us-ascii?Q?FpwH+X7P6p4ZStL8KMWVuPAlTb2Q/w2PwubJv7xX4ewtcX/LgypKpZj6Cqu5?=
 =?us-ascii?Q?ICd9hiK8iC8EB/9t+2fFahIIkurW7xtjZOJ8SLToojA2oMDcfNdAcos5UFb8?=
 =?us-ascii?Q?5SZiig8epVroJtLMbjfiuMH4VcY/mL2lqkZwffmD2mMW3LZ92GPn6D9XlU3M?=
 =?us-ascii?Q?Zg4NYumaxFYDRTq1tLG5bxFgwI6okfWUX2hRiKBJtJNf7Ewp+0Yxt9XfF/iR?=
 =?us-ascii?Q?rxLP0iMjQzoSKqTChovZzNN6c6kB5pvbWxxkPtr/5sOkxRDhMsmU9AlfUBga?=
 =?us-ascii?Q?33TpbW2YglvFSKwIngND8yKyfKIbFvg5u0m3kZreMTNxHbzEvEqRFACh9zrf?=
 =?us-ascii?Q?4kTFexAYNKTp3SIII+aoM8AvQQPNzdz9SnP6qzbRZmbi/7Bp0h1P/8nUCTad?=
 =?us-ascii?Q?OupsQ7d6RQa/SZ+60EVltOMNCASAdrWS6T+/LFVNr5/lGqSNcHtzDJH4x1hm?=
 =?us-ascii?Q?EY3+EkBAGI4PxiIIWCtIB+vBhdKc2+JDe6Z8TNaD/k6ePG4CGnvrKc1+rfrN?=
 =?us-ascii?Q?uOzglO0Wo16HqyuzPtBfpfLCyBGXX6sFy9ssF0NXgMlaoT0Krr+E21thRb5k?=
 =?us-ascii?Q?JgQe5BqT76ZN0baN0f9IUmBgCs3PVIQVYXEcuYBboAClbydPOewKTgX0o5XL?=
 =?us-ascii?Q?npVFGxv9wbE20eqRihXGhM81nBhpKO+XxuRkZ83cluMFL2eQA8UUNCLwy0gj?=
 =?us-ascii?Q?ILsWHN9zAr7tQ5oqXvlPk2fOPsqwve5wRXAHF+cA98pHaVd9fDdmcxW1ndru?=
 =?us-ascii?Q?92HBX+Typ2p9v0F8XbGGDhK+a6WdeTkyiZVdwuOiAMXy0GpSwR7ioxYjFKBZ?=
 =?us-ascii?Q?9KYBxJ9It0GZSsmjEZ9pa3/fKMzCIGD4cgB+uRTjRf9N3m8Ju/PtCSBfyUyG?=
 =?us-ascii?Q?T+oqWymKtU6laH+h2DamsLRVo5G6IQL/wSNuQkQyUMzcazNj41kM4JjBUt/o?=
 =?us-ascii?Q?9kmoV0TE7jlRIEQ/QvvVLeNXFHjJOeOK6lecnjAe12LXgOU8gXY/0aZsccbC?=
 =?us-ascii?Q?tpfd92r4R7M6Orrhxqmt3fFZHzfn2QXXDOfxMQ/EGESxxACIwgXuSR+Gn3QJ?=
 =?us-ascii?Q?O/EuG/cqNYqUJl66k7w7QcILi+ZLAJos6S/SoF3WYD0RTn5cW/yEr+6Xnm/z?=
 =?us-ascii?Q?RfT8u9wCUqyhf6HazXioDGEJtkKjG/i+H2SFyd+VJWvfJ7zWSVAfnfo+ZLTd?=
 =?us-ascii?Q?J0N5vX2aIcG+3XG1EQw6t+6gMA9x7qe2fK2dR6t4MFek0P5juv9t80JfePyf?=
 =?us-ascii?Q?x+oYvO//dgUfXOmtkulxg1g5sGm5cfuTwQvzcwEjWbuR2qQpk/duFdwvhQer?=
 =?us-ascii?Q?k0a8CkY7u1nTWPsWZPzPPb51oNfDE9kxfpz7dARojJQNn9nFLjLmbClVud8Q?=
 =?us-ascii?Q?gBjm1SZiHhRzqCNNQGuTQLk1pXiqrl0kQ5Vmh9N+jYD7wDX6S6I2sia+7dGg?=
 =?us-ascii?Q?eyiQAwZWdJbWSuexiOM1DO0E2ckPRhW49Y7UzOCb10ftgBAIt9CEK+Ho6AeM?=
 =?us-ascii?Q?+ILllEg0yh8XmgnxtIxM4lw=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 1210b367-0939-4132-7e12-08dcf7e32ba5
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 06:30:24.2992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AjcTUgcui+Ve2L7sbHQm3wSyfbQW7AtEFIgJuBwTuBYQd/arBDKE1squbE8A69h8iwghfqJ/ZbXyzC7Wwnu8DE7Z07j3wkBhxFOxjmvkG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0510

Add new structure 'mt9p031_model_info' to encapsulate format codes for
the mt9p031 camera sensor family. This approach enhances code clarity
and maintainability.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Change in V2:

- same entry for both the MT9P006 and MT9P031
- use enum mt9p031_model

Change in V3:

- Instead of using an index into an array, use separate structures

---

Sakari,this patch is on top of series "[PATCH v2 0/3] media: mt9p031: Drop
legacy platform data" provided by laurent

Link: https://lore.kernel.org/linux-media/20241028204443.22426-1-laurent.pinchart@ideasonboard.com/

Laurent, I dont think so but if a v3 version of that series is needed, you 
could add these changes directly into the second patch of the series, 
"[PATCH v2 2/3] media: i2c: mt9p031: Drop I2C device ID table." This would
simplify tracking for everyone.

---
 drivers/media/i2c/mt9p031.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index da1b90f03253..29af1df3ac46 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -111,6 +111,10 @@
 #define MT9P031_TEST_PATTERN_RED			0xa2
 #define MT9P031_TEST_PATTERN_BLUE			0xa3
 
+struct mt9p031_model_info {
+	u32 code;
+};
+
 struct mt9p031 {
 	struct v4l2_subdev subdev;
 	struct media_pad pad;
@@ -1204,10 +1208,18 @@ static void mt9p031_remove(struct i2c_client *client)
 	mutex_destroy(&mt9p031->power_lock);
 }
 
+static const struct mt9p031_model_info mt9p031_models_bayer = {
+	.code = MEDIA_BUS_FMT_SGRBG12_1X12
+};
+
+static const struct mt9p031_model_info mt9p031_models_mono = {
+	.code = MEDIA_BUS_FMT_Y12_1X12
+};
+
 static const struct of_device_id mt9p031_of_match[] = {
-	{ .compatible = "aptina,mt9p006", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
-	{ .compatible = "aptina,mt9p031", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
-	{ .compatible = "aptina,mt9p031m", .data = (void *)MEDIA_BUS_FMT_Y12_1X12 },
+	{ .compatible = "aptina,mt9p006", .data = &mt9p031_models_bayer },
+	{ .compatible = "aptina,mt9p031", .data = &mt9p031_models_bayer },
+	{ .compatible = "aptina,mt9p031m", .data = &mt9p031_models_mono },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mt9p031_of_match);
-- 
2.43.0


