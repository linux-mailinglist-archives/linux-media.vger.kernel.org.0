Return-Path: <linux-media+bounces-36088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3FCAEB427
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 12:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE849189B0BB
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 10:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF30729CB32;
	Fri, 27 Jun 2025 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RlL8Rv6Q"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D41729B8DB;
	Fri, 27 Jun 2025 10:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019448; cv=fail; b=lmDSWJCFg/Arvzy3a5KJIIyCOC1Y7frmd3PDFn8vJac/sGhLeQcrnLX7nhUcLqvA3jCQn4yKCLKrN1p+whcR93HmyS0UbePjkxWm/114IgBDxNx8thKe0DJ/OWtYhLr16dCzEWd1RaumNAHfxAXn7f4blTyqLTtj24FgJCIoNnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019448; c=relaxed/simple;
	bh=YpD+00G5mUuK/2EL9yntFNVXOVKYLCIE2bQITaOmDzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RsDVVj6ChT5T6bA22qp5Jxkgc6CK23qaUk5wxPxW30MVXTmhNArRXTrRDCyuVmRmCwgLqVr59c8q3jnRMqby8fcoBAwViQv9mWEHEM3BoWXrLIlz+9U5CkS7CS3gVvmQyWsewPdulFTWRgj1aYbUpmE5Rt4rT4P57dkqCuNeCD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RlL8Rv6Q; arc=fail smtp.client-ip=52.101.70.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1h/e3J+OkIQeYMKGN++HCfU++UQnUVnZCtMYidtp7AfjJeq98+fPUAJU0tdViwGL1xq41m9HJBGLEPrHigiCjC2zpckb+wPkHCKkkgpJxcXs8lZkRGr5lrqchuRJMaQFhj0Il5wIKDTFH2ejBHRiZuQLEWH0OFmQqjDqYlkL64QNvmS4lfkQoJjiCDyDRq3Bq3s/Fo+03FqGNdfm13THKtBbzdCz1e/g0JaNng/gXojIki90/sZ0Dms0IvPVaJSeRS+rP7PkSJfoqtd7VJBsLd4r/a7yynQVhzYDNsOTmPsmudFpcsKXUfIsGcRFhs4wkrGYiVeKY8JdxKn/LXNog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2yp9oOfAcD8c6c5qggGE9YtUJ3RQ6FOQ4jo9plSIwI=;
 b=pvcyQXz9sLdmmepBN+uP+q62KoRKijtm7Fic0pZtE71UFzIDjEO1nNmyWIbXhlgnNIvG5k82wP8/PYmQTDibmzShi7gJYMIi8ZRnzVWFf56q6vdanybOGiI7QZ9wejoosMGw2pHYojmDe5st+NnkT9TwXOT3gHN/uyP0Wy5YcxauqYaLZEFloNBdJ4uJhihMUpplnnSXBE/mSJzTphQZfYSqOF8K8g1fWpW1yWZKD/imBuaVW8mmGKtQi57X+h2JAdiDnkX8j3REmCr95mg+r7/De9PiAILdY2T0rM83B+GCGtjsQOD1mZZJ/+NgVcbc5Pi3hGkeE38HTE6WbsvMEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2yp9oOfAcD8c6c5qggGE9YtUJ3RQ6FOQ4jo9plSIwI=;
 b=RlL8Rv6QC4Th/D+47LT34BVmLQa2vRD4bMlBbggX2TdrjeaZYw1CFmLB1C4+5CddRBLSYV/DG4RrTHw7DY8di+DCuPDakkTAc12QIUYH7mDy0WFCS1o2ESgztyQctb01IN/GkjW4R2M6fQbkuCMiQm23s9uEZ53t6HHcfEANik0zpMe1Vmf7pNKdAxAfVTMjgk0Jpldo4SnUmmO7yq1fKVgSAUb7bJoNZj9P91YIkbdjbrjQfpm54NR2kEQ2XeTsZ4Yj7apMWOay3LJice4wmNykJhsrnB2nipQGfeFizAiKNgl0R9paOkB6kv33OJNXyX9Xo53807JZ/spvJlcwIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI1PR04MB6893.eurprd04.prod.outlook.com (2603:10a6:803:133::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Fri, 27 Jun
 2025 10:17:22 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 10:17:22 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	gregkh@linuxfoundation.org,
	xu.yang_2@nxp.com,
	mingo@kernel.org,
	tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 3/3] media: stk1160: use usb_alloc_noncoherent/usb_free_noncoherent()
Date: Fri, 27 Jun 2025 18:19:39 +0800
Message-Id: <20250627101939.3649295-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627101939.3649295-1-xu.yang_2@nxp.com>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI1PR04MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a999b1-044b-4529-fc85-08ddb563cdfd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?0Meud2lUOZbvRdpHNDqHIVYCClObBJtur3QixUrZpjzNtSkjpnLivceWU/g6?=
 =?us-ascii?Q?LAbUsRSN7Boi5B+HPLy27VrrIk9FCOHVPFdbP2d42r8y+J2LkKcUHI0hZEhj?=
 =?us-ascii?Q?pX1IJhYIZrQ9HFhqnkWRIsU1SwL7G9cwcohUHytYQ0711o2tEkLJeIGTdjqJ?=
 =?us-ascii?Q?s8DPOz4hahmysYPYK26zhnmdZ/1DGSDb5BZt/k9hWicHf4gz+GILYQ0gO2TT?=
 =?us-ascii?Q?8rrmhO2iBldPw9DHKLJtCe4bQoXbXb2K06nsmkPP4prjJlltrUsVfytlB4yq?=
 =?us-ascii?Q?smI2+tryG69UtM+fbbyiT+8j4S2/YgZTH8Q+KU4Goxjpsx23IfQnOZW8VIDb?=
 =?us-ascii?Q?RNgNYpk31I6c9B5Pkut15Ge2I0AL1yUD+MU2O/Ek1rbdPr7YdXcBbhzCVX28?=
 =?us-ascii?Q?1CnXOehRK6nTCXw6xDhb/1nS3L/SRM/q7suAfTlG1Lq8+0fWy5ghLvVLGZ78?=
 =?us-ascii?Q?T/iWFxAYWZTLDKCCl0cTiI2b+QzwXQBj6ujdZdI5TeadwAO+ey5MMHnWOl2F?=
 =?us-ascii?Q?rDBrKLaQneKTxsuxRVkbrLkhO+raJUwkaGDx+NrkG/DuuZ6IAhKaKvYSQayE?=
 =?us-ascii?Q?pOtWMTz5pJilVf5pIUwPX5z3yhrE1ZcTi7uA6yNCejag5cqIUYNDlzASFv+T?=
 =?us-ascii?Q?ax6nrwM8YjlvKDsfxER4gSckcJqVoul/9WODI/qkh0jPsXnUR+ZnlUKzG1Oz?=
 =?us-ascii?Q?/GzvzZ31wObcyTama4PqxngBW3rI0k50BiaOevyvHBtAMAbyl5YwMTYH8gkV?=
 =?us-ascii?Q?tFOCfZLfRb5rU+ght5Mw6CRaF3siuXgS0pxleJtCsKbMnbmPYRyod6gbR/2I?=
 =?us-ascii?Q?LfQiHs4vDqHKJZUkZJPY1GivtwXfyi/7QFGCVrgFoGTKeiv5G5fnxYpgGqEA?=
 =?us-ascii?Q?+CFsxOe6S3mVwM+TttdMdFbKguE8vsnZ5ukyirz6AZN2EXUh8QRVzCDpnc/B?=
 =?us-ascii?Q?z9183bfXYumiUBcn9Y8Bl8CAITvOyYM1KloOGUtxDvwurzA+PzclDuVJEIgM?=
 =?us-ascii?Q?la96qY7prqVadQjfD/FHUaX8nq6P+Z++N11jYSiEvaL/EOBNN0xWqSKzD8Vn?=
 =?us-ascii?Q?nOmL9iQ6JHwEj8c+8hoosT7ntZpPpinQFhaC3NJO0yN95z0wDqNzwiLRHyyw?=
 =?us-ascii?Q?umbdRWHNQAdM5r+KKuJVY4yijCVPWiy4zUUBL99e+4YwdBKkY88Ko1KCDJsm?=
 =?us-ascii?Q?i6+jGqSpmUbT0f+UemPnZnqN8a6ZCpPyR+I98H8Y6o5ZirbUMrW4MGsBhZiC?=
 =?us-ascii?Q?/Wbk5dIHh63p2rp9WA6ZrH6SbIcotylwOqCxrhY78QcfeAQxUJOy7f3GofLb?=
 =?us-ascii?Q?CBRdzp1WnHxRDZi8Z8w4nX5qR41mbmsRogxTx5GoCQhJgHXbk8Hq/1FMPKOn?=
 =?us-ascii?Q?g7rZWPN9twfBAcXYplzvnili5EE676YtiaMUcg3y/4T0zN1qDC/hmc+QcYnD?=
 =?us-ascii?Q?mnszXX633CKzk8Sy/F+YjtvIQJ0zqgJb5A3RZzRZ0arjjZTYVIlfv/Ptu2D3?=
 =?us-ascii?Q?m7XnzFTaYLKn7Tc=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?HMuWm2+lZ92xCnvXnpevk0fsaIxGVaI87dwSzK290ox94wnMcTXVP9xfyByJ?=
 =?us-ascii?Q?6DQrolU8SQlWaDfl30fCLKfDyNVuoWR8VaDYRntGiah1KYcX1cdScXUsFL7/?=
 =?us-ascii?Q?XYGpKKmFweHy+OfOI+DOwzGL1wZYw8bPoGCaVbTLt9Vw8eKlbw1ShoXhCnTC?=
 =?us-ascii?Q?NNhVV5HsVBRSu5NTMO4Fdmdx5Iqacer5C6LMlhuvRlQo4iS+u7jtTE7Rma1B?=
 =?us-ascii?Q?EasuK3H/CZFEheAHwIj+NNC573prCMDwU8tDqAvwbuqoPCEc+PWKkqw0IJiv?=
 =?us-ascii?Q?HVQOeFJyFWyb7GWmzljdDfYJWCWoOV/gSD3WNvgO2I9DWJ4AFyDJTpIjpJcb?=
 =?us-ascii?Q?5CDaE4dYaRnp1DSXOXAOymDTp2ntfPEr04K4UbSdkNQh1FcRv2Iyw24GCM9M?=
 =?us-ascii?Q?fFLvgGIiFi8H29muk/e+vpQt0N8wlk/+sZee1NStn71SbYN7o/qao0tDoHrF?=
 =?us-ascii?Q?N08pAL6dWYqEAYjz98oJpTuOgT1KuhIr6HH4xG4Tk4ERNzeT96yJ3ipebWw4?=
 =?us-ascii?Q?SDLuTh/OcGZwNBSxo38sgzNRBthVuZ9hxjZcbWyI5R3Vdjo5chU86RamYWI7?=
 =?us-ascii?Q?zD7PQxu1jbgQ2MwnwZLXBsPXp5ZCPcax5XB6T/4z4aezAbM884MJquzsf2qA?=
 =?us-ascii?Q?jOEdtjmxF/8a4Av8gVvAed+3MqhxeKJhiPiF+aUMXSbu070e65rvqNqZDL81?=
 =?us-ascii?Q?76qNP/JCQPJkMEKUqFLmiKMy8MD/o5rbdJCTFKtVKaLmiQXPZ4dIGmiKL0Y7?=
 =?us-ascii?Q?VUvUzm46erV7lIQdbopVszHOTWzLnSokr8IoeaNByrCu3GmtWY1sxg9Z6kso?=
 =?us-ascii?Q?r1KMgZtl0ersbyENNXMxZZsO+dMBsnU3An0/6HMqLSO84jqRrlIeaCZ9ERBA?=
 =?us-ascii?Q?ZGqS4xT4/QQnPTLt4Qbd3Cx0QFcVoJkCJt50cWu3m8vPxIWZ1TFJoJILsiAj?=
 =?us-ascii?Q?KYYVKK8TEV2WvPmHeMoDFhOoopX5z0lxmJvmwA5U0uxcumIo/srcUSWfT2qx?=
 =?us-ascii?Q?aCqre4kQnaW4w/iyXNS54NfYxbMF0l3M9AFNyYAn0a600a0rA6a3Wr2rJ2hP?=
 =?us-ascii?Q?ti05l6JkNiTd2h/IjSb28qlQP2F7awdNtCe7mg8vldZ6/uMcC+226UiFGPpQ?=
 =?us-ascii?Q?mVPE2ERlz8l5VAwjeXmuvd9p/L4JRGwPU17XOa4ZKewfMnHm4/VvtN1VWe6u?=
 =?us-ascii?Q?EkX+pr/jqKFvOCeKZtfriBrIwb4Rii6c07/jo+cH02lEyno+1ALPtdBFAyjP?=
 =?us-ascii?Q?I5x991Mysfmjrvrci2G4YFrKtN5S33H+ptAuwPVbzYFvFkCtlzqub4Y0vfzo?=
 =?us-ascii?Q?HKkaQzglZKZIVk/MkFJbCR7Lcmsb50tkoFSaPgXOYqunez2TDO0kmb6W+etI?=
 =?us-ascii?Q?17ivGiybgil84z1a44kOqRCzlHi34RjNcKMfN5p4BpCUlaogwJz9AswgLYQa?=
 =?us-ascii?Q?FvX4PmqIWXvdlb5+kb8x5sYEWqdW9o+RXN50o5QvP3FX3t5OHhprC7/ZNBqV?=
 =?us-ascii?Q?Ee9fZ6coJV9vK68rZhesRqaU9XcA+2+RWaEK70Z2roHEJgpormg4m7P9368F?=
 =?us-ascii?Q?/XMfarXiNFvKH+l90CiO32KbZlYr6erssl/hWaih?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a999b1-044b-4529-fc85-08ddb563cdfd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 10:17:22.1402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAX9cs6rnCrpfgs4CKsaWYIfApEtYDvC7pw6r3TPi4FeuK/MSqRmalNOhYzdK7Daef6208pA53cMCP3fX2X+Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6893

This will use USB noncoherent API to alloc/free urb buffers, then
stk1160 driver needn't to do dma sync operations by itself.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/media/usb/stk1160/stk1160-v4l.c   |  4 ---
 drivers/media/usb/stk1160/stk1160-video.c | 43 ++++++-----------------
 drivers/media/usb/stk1160/stk1160.h       |  7 ----
 3 files changed, 11 insertions(+), 43 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index 5ba3d9c4b3fb..715ce1dcb304 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -232,10 +232,6 @@ static int stk1160_start_streaming(struct stk1160 *dev)
 
 	/* submit urbs and enables IRQ */
 	for (i = 0; i < dev->isoc_ctl.num_bufs; i++) {
-		struct stk1160_urb *stk_urb = &dev->isoc_ctl.urb_ctl[i];
-
-		dma_sync_sgtable_for_device(stk1160_get_dmadev(dev), stk_urb->sgt,
-					    DMA_FROM_DEVICE);
 		rc = usb_submit_urb(dev->isoc_ctl.urb_ctl[i].urb, GFP_KERNEL);
 		if (rc) {
 			stk1160_err("cannot submit urb[%d] (%d)\n", i, rc);
diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 9cbd957ecc90..416cb74377eb 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -298,9 +298,7 @@ static void stk1160_process_isoc(struct stk1160 *dev, struct urb *urb)
 static void stk1160_isoc_irq(struct urb *urb)
 {
 	int i, rc;
-	struct stk1160_urb *stk_urb = urb->context;
-	struct stk1160 *dev = stk_urb->dev;
-	struct device *dma_dev = stk1160_get_dmadev(dev);
+	struct stk1160 *dev = urb->context;
 
 	switch (urb->status) {
 	case 0:
@@ -315,10 +313,6 @@ static void stk1160_isoc_irq(struct urb *urb)
 		return;
 	}
 
-	invalidate_kernel_vmap_range(stk_urb->transfer_buffer,
-				     urb->transfer_buffer_length);
-	dma_sync_sgtable_for_cpu(dma_dev, stk_urb->sgt, DMA_FROM_DEVICE);
-
 	stk1160_process_isoc(dev, urb);
 
 	/* Reset urb buffers */
@@ -327,7 +321,6 @@ static void stk1160_isoc_irq(struct urb *urb)
 		urb->iso_frame_desc[i].actual_length = 0;
 	}
 
-	dma_sync_sgtable_for_device(dma_dev, stk_urb->sgt, DMA_FROM_DEVICE);
 	rc = usb_submit_urb(urb, GFP_ATOMIC);
 	if (rc)
 		stk1160_err("urb re-submit failed (%d)\n", rc);
@@ -365,11 +358,9 @@ void stk1160_cancel_isoc(struct stk1160 *dev)
 
 static void stk_free_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb)
 {
-	struct device *dma_dev = stk1160_get_dmadev(dev);
-
-	dma_vunmap_noncontiguous(dma_dev, stk_urb->transfer_buffer);
-	dma_free_noncontiguous(dma_dev, stk_urb->urb->transfer_buffer_length,
-			       stk_urb->sgt, DMA_FROM_DEVICE);
+	usb_free_noncoherent(dev->udev, stk_urb->urb->transfer_buffer_length,
+			     stk_urb->transfer_buffer, DMA_FROM_DEVICE,
+			     stk_urb->sgt);
 	usb_free_urb(stk_urb->urb);
 
 	stk_urb->transfer_buffer = NULL;
@@ -410,32 +401,19 @@ void stk1160_uninit_isoc(struct stk1160 *dev)
 static int stk1160_fill_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb,
 			    int sb_size, int max_packets)
 {
-	struct device *dma_dev = stk1160_get_dmadev(dev);
-
 	stk_urb->urb = usb_alloc_urb(max_packets, GFP_KERNEL);
 	if (!stk_urb->urb)
 		return -ENOMEM;
-	stk_urb->sgt = dma_alloc_noncontiguous(dma_dev, sb_size,
-					       DMA_FROM_DEVICE, GFP_KERNEL, 0);
-
-	/*
-	 * If the buffer allocation failed, we exit but return 0 since
-	 * we allow the driver working with less buffers
-	 */
-	if (!stk_urb->sgt)
-		goto free_urb;
 
-	stk_urb->transfer_buffer = dma_vmap_noncontiguous(dma_dev, sb_size,
-							  stk_urb->sgt);
+	stk_urb->transfer_buffer = usb_alloc_noncoherent(dev->udev, sb_size,
+							 GFP_KERNEL, &stk_urb->dma,
+							 DMA_FROM_DEVICE, &stk_urb->sgt);
 	if (!stk_urb->transfer_buffer)
-		goto free_sgt;
+		goto free_urb;
 
-	stk_urb->dma = stk_urb->sgt->sgl->dma_address;
 	stk_urb->dev = dev;
 	return 0;
-free_sgt:
-	dma_free_noncontiguous(dma_dev, sb_size, stk_urb->sgt, DMA_FROM_DEVICE);
-	stk_urb->sgt = NULL;
+
 free_urb:
 	usb_free_urb(stk_urb->urb);
 	stk_urb->urb = NULL;
@@ -494,12 +472,13 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 		urb->transfer_buffer = dev->isoc_ctl.urb_ctl[i].transfer_buffer;
 		urb->transfer_buffer_length = sb_size;
 		urb->complete = stk1160_isoc_irq;
-		urb->context = &dev->isoc_ctl.urb_ctl[i];
+		urb->context = dev;
 		urb->interval = 1;
 		urb->start_frame = 0;
 		urb->number_of_packets = max_packets;
 		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_dma = dev->isoc_ctl.urb_ctl[i].dma;
+		urb->sgt = dev->isoc_ctl.urb_ctl[i].sgt;
 
 		k = 0;
 		for (j = 0; j < max_packets; j++) {
diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
index 7b498d14ed7a..4cbcb0a03bab 100644
--- a/drivers/media/usb/stk1160/stk1160.h
+++ b/drivers/media/usb/stk1160/stk1160.h
@@ -16,8 +16,6 @@
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
-#include <linux/usb.h>
-#include <linux/usb/hcd.h>
 
 #define STK1160_VERSION		"0.9.5"
 #define STK1160_VERSION_NUM	0x000905
@@ -195,8 +193,3 @@ void stk1160_select_input(struct stk1160 *dev);
 
 /* Provided by stk1160-ac97.c */
 void stk1160_ac97_setup(struct stk1160 *dev);
-
-static inline struct device *stk1160_get_dmadev(struct stk1160 *dev)
-{
-	return bus_to_hcd(dev->udev->bus)->self.sysdev;
-}
-- 
2.34.1


