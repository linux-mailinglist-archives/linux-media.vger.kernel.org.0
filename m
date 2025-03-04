Return-Path: <linux-media+bounces-27492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76192A4E311
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 16:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D8D717D409
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 15:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDE1278178;
	Tue,  4 Mar 2025 15:12:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020134.outbound.protection.outlook.com [52.101.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE21278154;
	Tue,  4 Mar 2025 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101154; cv=fail; b=YbdTIIXBFpHzrOAbfzUHtJSFjREff1G+U9QH3o7JZCRqHWetdUoBKg3sV1xJ3ttrDxNGTM8wyySwXJ6urybns7MG7pB2wfz95QfEHxdB+Vygr95QMB52438tOz3NnLLEPNwXiu6S4PUVK74tALmc6D6ZOHFIj0aDwUUSCyiic7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101154; c=relaxed/simple;
	bh=mQZFYZ7V0keqCHZYfrILumihM/6ujrctllC/5SEg/Nc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tJsqFG+9I8f27sTCus+JgOIdwGL0/a3XlUh8zjBQZA9p5SMQH+VAPkCjZlVsL6/MNVJpb5zbozA2aFmhe++KRWgx07IC4t7i9nTXZL7p4KQEbOK7zspIEHoLsy/wrCM7Mdbq0AobeY+FgaqG9mJePmwoZ117h1ylHvrs8jHv1Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFp0yicvePvimdunx0MzUWvMMAeLOWTFf+y7kB4s2N06oJ9V5xMU9Uu6Dgp4zZLQQ92XnV+q0yOkUMvq44gGe9k6KY71NaffiMO+S3vzYgO7iaX5QgkW29pnV4X8wf99y0JpUvMuU2LuKCcSUVl4C7cuf7324p0pXq8AQ6jFRTQXhWPU9W/VL/jj5C5Y1FNYNH8tpcGDOgk79y79UxeDxALkDMjpH1FpHpJ/kqROhtQGafwRbXzHTkoQE0oKXFWMmVtWQb5gR5RVgxrqqCpAyVx7aVm87qHD0JLuwKK1Q6p2jcFfpQJoFkquli77YjNAdaSAzn9XefYDBG1IqSjnag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6BcHEi5C/yzaT90S+7HRhmmOECsb0B7nnIr4+9NwYU=;
 b=hSKC8Fn9MfJlnhaNyp/VDsZLzn2d6P/xUpyRqSF0W3I/mB2XmLogjpBvrmjbofqB8U2lYfiwSWL2Quv901obYdktv66UnVBfluVEZ1R9NLE+85zzo63VGDu6zeokimpnraShX2K3undfWhXF23GP9iCxMnSbURqXJhkIVOhJ/0FbwrlrzgfiYnan3k44RgTffdW0sOa7KL3QH50iA/b2TnFyt2bskVjVR/GLqHDSSJLSn/WV6cnbAFYRWiXv7miG3pxHDDUiW0La29XdTyZHEFXUGcH+6TagFa9huj/wDAb5rHRRWxmJNMC4n2s+8w7Nm6zMEW6u2S0R67ZJPFk6YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB1836.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f7::7) by
 PN0P287MB0672.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:160::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.29; Tue, 4 Mar 2025 15:12:29 +0000
Received: from MA0P287MB1836.INDP287.PROD.OUTLOOK.COM
 ([fe80::2f96:dc5b:f53f:b759]) by MA0P287MB1836.INDP287.PROD.OUTLOOK.COM
 ([fe80::2f96:dc5b:f53f:b759%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 15:12:29 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: "tarang.raval" <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: imx219: Enable runtime PM before sub-device registration
Date: Tue,  4 Mar 2025 20:41:33 +0530
Message-Id: <20250304151134.105771-2-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304151134.105771-1-tarang.raval@siliconsignals.io>
References: <20250304151134.105771-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::20) To MA0P287MB1836.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:f7::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB1836:EE_|PN0P287MB0672:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af725dc-abe4-4176-60ac-08dd5b2efae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AUzHM9RVCAe/InlVMT0z5muLUvFe5pvc18rRZ5YMaHmzKG+2nsTHF18PV6NF?=
 =?us-ascii?Q?Qs44MbpmcibJQJWDkof0KHuB5vcgC4uYrrZzGSkGMHmP6dKhT3IiVnQ+NZN+?=
 =?us-ascii?Q?ubQk8UsZb1MBb8qjUoIMHcqIJD/gAXh1XSN2m7maPbkt9dfiiFHRNmGM2IfN?=
 =?us-ascii?Q?l+PdLVKPpo24VBJirl6aiHuRCYMEhGG8VZHtQlI6qpaFJLoNLRQamR5nn1++?=
 =?us-ascii?Q?sRoVkh1W3lp76SlCbIiUaWxM6oYbocbIYaotdCwpLCfPl7i40Opv27uBEqtx?=
 =?us-ascii?Q?7oxLZqqPG3ftNXK1AudX2heHk2sJIU8TGRo7ff0bYxJSPQ+2uNXdeWUBA7PU?=
 =?us-ascii?Q?3ilB8NSf0pwmUBMDRKMvbOMiKMK6z6hOviBQTZuv/RpoKLz+dBh+CXRyEKW+?=
 =?us-ascii?Q?63CIgrIFLK+621sJdmA6LYNyjcOrfc5hjGzKThTwoue3d9jUcrk3OwTekCS0?=
 =?us-ascii?Q?voY3C1uRKH/dVZh4luigDr68pHTDIK+0JFCiOllElPhbQP7ESgfovdQSe0Lr?=
 =?us-ascii?Q?J90sWe16ugEEDLDE9J2V0TD3xOyTYtuAKwu7crS/ZoRowWKU6dn/RFUSGvqS?=
 =?us-ascii?Q?IaazbNSuR04v/+8Iy6qZFfn/YTXSF8uPvPUyScXebOBLDTgOs0mnthCthN9Z?=
 =?us-ascii?Q?HVlyk/t+SDAkGfI02h5rDac2A62dHa3u95wYUimscurabinYIm05FbG/iGDY?=
 =?us-ascii?Q?cU6dF5MUY0Icn09m28jZb02vYDeil1ZvqS9kcOa3HLvpf0hOQA/3dIjN2rMP?=
 =?us-ascii?Q?6oqSFoJ8pq4y3ne/ANDuOYqMYuBI5MtYXh+1rcmZUMwSm8sGOkWc005gw2DT?=
 =?us-ascii?Q?99Eaqa3EhS7IGgObo1j+Jysapf95qTEXqFsOU/Y4qkmeuL0Q1Rwlp0qjkqA/?=
 =?us-ascii?Q?t5qHybyDeNqlfIvVa09Q/QD7ZnLMrJw6xvHctlnd2e4QdB84JXqBIT9VJFUx?=
 =?us-ascii?Q?H5kEYbJDmWD6i9Q10ohOw9EssyEBT6wnKq6hvO+qKDBlkA04qSoS2XA5XQ2T?=
 =?us-ascii?Q?IhrTqaaewWEG9wpRsoBbsI4V/xyZaKdZdxtudtJ6fT885nhfid5kuyp6tMAP?=
 =?us-ascii?Q?ZdlUWxRxHc15eAvUPvLsA0r+hNZ10l0/EaCrittLW+kWSBzh3EaSmoMK/rtT?=
 =?us-ascii?Q?GzflBMy+uOdcDo2vuYfrup3ovIxOEz36HlPb1Dnuybv/UOyNwEvukiHgLiom?=
 =?us-ascii?Q?3g8Ar64HHiERVDatfeDSF3FeE9vKNTKiP4LAqW3XkbU+K9EPGnWdk4IxybCZ?=
 =?us-ascii?Q?v2iBM2eo2fMojq3Kvm7d6Yjc2esow3bsNLIFxYoaurS8+o6yUufvzEITFzUP?=
 =?us-ascii?Q?feb4eMPXLnoGbR5rJOexflQ5ZciYYMwXytPKO6Z6ZMWaPMFO1iOfU0vm8pBR?=
 =?us-ascii?Q?zl+3BwA++4DThnouHwUMOyq9TN6M/A2GUT52PNGL2bVlvzGSF+1L/3xtUSL6?=
 =?us-ascii?Q?LO+Sn7RcUdyqZvje1csBbN+0pUBaPWHJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB1836.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zLk/w6CHF9aZ17ahuHGNrRnsMMFKXHDJrdXiPwYYXk0XTl3pC2Qumy52aW+X?=
 =?us-ascii?Q?J+YA+SfWWPLHOGjKOO8fR3W0RE8T/WlAHoKVk7+/xY2L4QYk0+tft2qvJDEI?=
 =?us-ascii?Q?YoIIgcjATEpRYEOB3xbI0BqbRtk+p0cbYu0DCzDu/6rrvAQURw9ydB0Pbd4v?=
 =?us-ascii?Q?RgMAYDnrtNG4o6b8IdRvpGDoxEvYxnOcvZ/DUk7+kfUBYXrb0myEtOBrWSXC?=
 =?us-ascii?Q?wjm4ong04jDO5O3vP7AS8rcVRBlKlq0CQhG4rnnyKqeVhV5//CFOr9j1mQoV?=
 =?us-ascii?Q?w8zDGB06ZxWjjrsVrnC0L7wRRXSNVymQJDA1TxoBM3Zl+qGXVvW92SZx4LRB?=
 =?us-ascii?Q?a3X5Wx4vA2qQ+/shy6YoYyRfIk01j/fUR+c1okfAtdLKVz3rG1aocfRfDyiS?=
 =?us-ascii?Q?wXyPX9QZ7XnK1rKdTLKJhYJpW6z5dgWRetYSm5PFH7mpjn+P2m/5NSBNMZdn?=
 =?us-ascii?Q?2/LSAhAgfF9klgStFXMHFKHLhrIY5wVICU0Pv6R4nuPjXDfIe4SHY6s97by+?=
 =?us-ascii?Q?YF/3//fb6cDdd50CHK+JWa1nNhoJw5eixGGdMC2ICLd5VdD222skMQLctCGX?=
 =?us-ascii?Q?smYQd8nM1eIkbiSs8t5JwN9OWLCwo5JfGCyHlv0aQaJAsEIrwo8NjHtF55uj?=
 =?us-ascii?Q?+eNTXX586aqygmSkhzXRKGgPvDBVw3kjgDeso+qIj7CcnBgk1QXiJVg5Mrfy?=
 =?us-ascii?Q?mJvOWaJSWQsIas/pYjzityFWUFat+/YQ6RrpRCV6ZFFTVRbbUZvlMt0nL+LZ?=
 =?us-ascii?Q?vVA59sW0lLYRD+NEAMAy0TGRcvWKG3nlBypkhn0bogDY3wqZ4KpkU0WoGc0J?=
 =?us-ascii?Q?6vWgawEecNslwaeNut11cRCwLO7kyJcalPqmplcAVW4nat5QXcxhlKdg5TMA?=
 =?us-ascii?Q?vxgDiOOOQBWcZKNlCfabTPJjcTPIjsAAPNexGv4YDVRrQ+TXfFnx54/j6g2b?=
 =?us-ascii?Q?98KTqW21BvvF4xEzZLxKmK4FCRyJIrwrLJ+K02WBu7WUIxfJMx1FTOYVqPHv?=
 =?us-ascii?Q?RP8ibsDM5wc9qmFIZ0GzBAg9+4GSbrJL6CY7xIdPCFBOWSssc/rPb8ljYBsm?=
 =?us-ascii?Q?9J2UjdmWuPe/2bXCdgnJqoPbtWAky7ypSXpBNkGaKbHtzcKeEbdZXrqm4IPk?=
 =?us-ascii?Q?WzjNn71GdEQYOs0W/mKtVvdtuOXLlTMdkrfy68adieuaZxFoancJ75kc5gHq?=
 =?us-ascii?Q?qSSb9+OgXWe2rpUVFBo1vP2KFkvzFhQtCAJXgelRsiaWtOV2YQ9GFNoDPsQn?=
 =?us-ascii?Q?6PKKcv1xfAg7eSBf2JYxCsPsQWqAa2XEJlDoU8XTFICLRDYdb+dTM3nVYw0a?=
 =?us-ascii?Q?Ak1H+6CbCnjvMyC9xmRRwibouXv/mkMSY/kcPzYOvxoGPFmBs60YJ/SWIOAQ?=
 =?us-ascii?Q?rEiKwpbx4leaVugPIjOB/HspNE4hHD2vUQJ6+SneJh4XDjP/E3Wf4PjiIvFJ?=
 =?us-ascii?Q?mUNxZnT4GBAgY6uLgx/cIbE6deP6jtSL2p48lbdTbNTG52ekBmBBHQE3md0W?=
 =?us-ascii?Q?TJv4tOJQJEs+tIOr+LzuaNvYITe0IdTarQPfXxGHAwvyaVqBeHd3b3gBMLD+?=
 =?us-ascii?Q?vPIx1TeVf9zBrB34BS0I/pEEOgpBGeN/mE4mRse4xeKgIEkf5TjlRNQ8gnNQ?=
 =?us-ascii?Q?2g=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af725dc-abe4-4176-60ac-08dd5b2efae7
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB1836.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:12:29.4022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fx7gHx8j4CM82Vv1XtBWmPcg/+XBT6bAzGUpHdun8LtQdYG5jtYwZXvGtmQlSIvnQf0HQ5XFZcbluPbafA4ao3sB3yFiOZRtoR9eAHYkAbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0672

From: "tarang.raval" <tarang.raval@siliconsignals.io>

This patch ensures that runtime PM is fully initialized before
calling v4l2_async_register_subdev_sensor(). Moving the runtime
PM initialization earlier prevents potential access to an
uninitialized or powered-down device.

Additionally, enables autosuspend

Signed-off-by: tarang.raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx219.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 2d54cea113e1..bdb5fd5778a0 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1178,6 +1178,11 @@ static int imx219_probe(struct i2c_client *client)
 		goto error_media_entity;
 	}
 
+	/* Enable runtime PM and turn off the device */
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
 	ret = v4l2_async_register_subdev_sensor(&imx219->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret,
@@ -1185,14 +1190,14 @@ static int imx219_probe(struct i2c_client *client)
 		goto error_subdev_cleanup;
 	}
 
-	/* Enable runtime PM and turn off the device */
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-	pm_runtime_idle(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	return 0;
 
 error_subdev_cleanup:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 	v4l2_subdev_cleanup(&imx219->sd);
 
 error_media_entity:
-- 
2.34.1


