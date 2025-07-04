Return-Path: <linux-media+bounces-36824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51755AF8F46
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3709586918
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7372F2C44;
	Fri,  4 Jul 2025 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CZUqtTD/"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010071.outbound.protection.outlook.com [52.101.84.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A102F2724;
	Fri,  4 Jul 2025 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622937; cv=fail; b=gtuumvjDULLFTB9qcpxfjBUA9nEGwL9ZcEx4mx3FUqWctkhRvNX4CMT/mKv4TgloBpvLwiqIUyk8VfS/TdchrA7tAXDtk3YxlF9M6IBff6qXi6AbDX7nks22FHpcDTjQbe1qRD3zv70hsgXU3NoCFTiHCqJSTUnLcqighqBCKN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622937; c=relaxed/simple;
	bh=WeiWiZBtNLzh4PO9jwnq/9MP66R+GIHYAYmGbMI++RY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WXGiCuko+HxTPRkxMdFOav6bSKpLilG4jA8+S8qXrcWC/4+BL44C6iTp45ApfWrIZFNluQycMUOi31RFJl5FtPzbeGhUddA1JyCK73Am8zsOlKNRZ2xpB7WZaXPzUuzgkWXfF2nvt9ufR+N+uL6S9LkbZAWMUWCjmTUw7ms8xjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CZUqtTD/; arc=fail smtp.client-ip=52.101.84.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBU3Ud8Z3kA1VcO7JyCFcg3gizBgYH5ORfqzeyifvhxECelhP5n2H/DQ9sA/KVD1BHJZFhFmoxpIZgaSSim18A16+zX3Ze4cSAHAV9sc1nOTRFqU30W7WsrNUx4gaM8wx2YZWQtD2/Oq/IG9GeTJam9odpQuBg1wLWESO+Axs3e3obHyic8K1vBfGBcCTldwmsuCzuEtMJW6OIOABSvDUUtr0F1y2wDnWutLnZSgjUYGX0IBX/KePaG1+3+0wu17YbhF7tskEODI4cpwaLYdOO2R396IIbawr/2zgsGWWhElBBTfRfwBaxOkApYKzZLx9ooZudBG44IYeSAXhrixew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AQNoBBTF73pqmMZ7WyxQ7wKSap/ElP4kPcafpuo/a8=;
 b=RiqMQToC5jPKsmCson4jgID6y7QWAJ+fEDUN8R77nJUVF43XTYJpjIEDHh7QsJCR4ZdxCxQ00ULqK9SZcXgtX29udpnB59YnagG1LSLn3ttKp76Uc6eWmmQqZL7XbqZ5LgMsd1yo2Xe7df51AsZLTKvxiJBBjZ74Ut35SpKBOkjm5ukxyf77encCGbISboLmMtdttkiTX5ncMexZ5rmjwhP4Jlfs+pL7++swPDaXWj9vkeecMd9yw4i1seP5pFgCkP4XrjLS30VjqpwjNGaJHAzYXMB7qsb83HzMKFDSw8rxsvvTwEjMynx2fuV8A2WzLY5wpJ+dyt5UjAr3RDznCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AQNoBBTF73pqmMZ7WyxQ7wKSap/ElP4kPcafpuo/a8=;
 b=CZUqtTD/gHp74eFDAP3mpqFuZ0OuXcppdHZ6eG6OSgJIpiRhcM0j3Y4Ht0vy9ylR48uhfioRKKZaMznZjrA4owb7G6JPmo/hmYUOmrVfUtORZ6LG1EmOV426zaqtGJEXwfYkuCXKmU2r1RDHPjwnNMsPub2S/VOCgzi/HRokenF7k9L5J8gyInio8tF/V+yr5V9G72J1auqLrOOAHFm2fv9KXkemsfFccNtz2j+LzoboLwAlSdTx2LBeiYGpgag+rKZEtd2z9XIGrfxsDv2IN57negDuBkIPg3NOTxNgh800uFjYxbiWaJe6W4W1JMDX24dmoX4mvN55s/LSDoH9xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7834.eurprd04.prod.outlook.com (2603:10a6:10:1ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 09:55:31 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:55:31 +0000
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
Subject: [PATCH v5 3/3] media: stk1160: use usb_alloc_noncoherent/usb_free_noncoherent()
Date: Fri,  4 Jul 2025 17:57:51 +0800
Message-Id: <20250704095751.73765-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704095751.73765-1-xu.yang_2@nxp.com>
References: <20250704095751.73765-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 764fa4c3-3a11-4aae-a9f6-08ddbae0e9d5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?CxD+A45dR4UlJB04UryKtFZ2AQY4Qx8ov6yfv0SnWnpkD6iheY+4SLyWXCos?=
 =?us-ascii?Q?jGL60pTJG2W2cEqx81CBgz345rN7p5OFkvEqggzAUWesZ59ia7Oo7Yw771RE?=
 =?us-ascii?Q?0A5lF7WK405AvAyw9pZ6XOM45JoB5uO9bxufO1x68AtUG47DsqO3t7jY9EcW?=
 =?us-ascii?Q?9wdai7WkBF5+TMIs7tUgu9aBYVXA2yKU8n7QL3f7Z0/oGq3bECgG9clmbyQx?=
 =?us-ascii?Q?pnpBVe6D9J86wGoQ5EMMdIeO53ycIIQc+93v/vwyLARip6A9f2zU+bweICaJ?=
 =?us-ascii?Q?o5r+ZVw5bUhTjAB4tb56ybNTTZmcF+NDULXYUTf4SCwLY4HyCH94XT+8mE+h?=
 =?us-ascii?Q?jxBFow9fRXy2k4Y+7w4Z5X3FMA+75lNMiTFxk9W5z8vEPoiIL5zpWnsQ3Air?=
 =?us-ascii?Q?sKyhKHrRu2nG/Abyrxg4v/OgXnL1put7LhA0fqi6hQvfs0PEgrbOusGp2aPn?=
 =?us-ascii?Q?V938LrWCqq84I269u5YRGcJxTnFZQn2XN9vgOOvhYW4Y0ewZstq+fHnenM+i?=
 =?us-ascii?Q?GtHXo96JUE+1SRKA1psK3wWD7xhtVDUQwovHje+uGcb61iR8xqCXZQpbpr40?=
 =?us-ascii?Q?6Vmb6wF3I+a+mUWnAq4HYt0dvRhbBKk75NTo4MD876VHbN8lv6yrGzqsCTiB?=
 =?us-ascii?Q?gk+eEEDO/hd1nkVeQmI4yVw7u37wDolDLOPW5n/lwq0kL5yrYBuGidCYx27n?=
 =?us-ascii?Q?DGOnAJ7l5i9Ly3z2XzuooxqAXYXjuv+jzIn40DB6ZbS8etMPApf25XpMs5O5?=
 =?us-ascii?Q?W2n52kYa+Wp3I2xjCb1aTASPo/BDZFFC6A4CcNZ/Bd0D7UF48p+4b6uUJ1MM?=
 =?us-ascii?Q?WaF8kqGBonj7dFLRm5veLBuyorNHXIvkGJFleqWITYVfjOtKbR99unBLpHZZ?=
 =?us-ascii?Q?tu9A3Tc8E/XDMlZJO6Ba7WPE2AfbgvKY4UVihrWKDOTiDQefkE8bRZEPDnck?=
 =?us-ascii?Q?ohVioAqOawtM/A+o+fX+LjSqiC/4c0ipPTlYZu8tb8vGWp7hlkIJUKLdu5sH?=
 =?us-ascii?Q?jS9TOBxHSfRuznQBNNQSXeXjVKMiqG+auMql1HfTdoRTq0cm9ZAujYPhknNY?=
 =?us-ascii?Q?swVTJk/tFVQQ0ClVFgdD/K8eZHVXAvs8xK9dS+3rT4zInNhWV5kde6V2Ce4y?=
 =?us-ascii?Q?jhmJpK0Z/w/GXUT7PnEBXYhTX8mOQsfho/x7z/FPMsodgj06KWEru5xddPM0?=
 =?us-ascii?Q?/1+YmJTekLDzY4KAyOjrqzznIpEy90l4GQoilu/hWMqfId3P3awgY68acIc4?=
 =?us-ascii?Q?xrUkjbj1IbjiMBRJZ0kwfqPHfaqAQKhFEfBq/t18QTyt2mDoRN34H4gcYXXR?=
 =?us-ascii?Q?PLBiNNNYZUeAIZtPJ3oP9EKeJ6ARFP/Q0ZcCMkfvujeq4Ne/rthmr7dHJf0N?=
 =?us-ascii?Q?3794Ukjkj86Sbt7NGYigKvA+8VwEpimcfJ8QMOFbBBW2O49/tEw4lrPd0eXb?=
 =?us-ascii?Q?MRNVL9HjZTlVRM+0IjM/43MK1jpyUwYwv+/XDZ1+k4B36/ycPBHmFHzPQqtG?=
 =?us-ascii?Q?mTEgHPXUc39OCaY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BG7QacpHuFqrTWX1qu3CUSb0TaFxOGpMISXzYghCO1eIBdqBO9XN4zX5WvjE?=
 =?us-ascii?Q?fnX3Gfg3wON0m0mOCBsiD0s23+yYoj13IFgxuCSYoKJ7jeduCGC48MDHYvhV?=
 =?us-ascii?Q?vLtrwfdKXmn0qCCW3PnpwWZWFdPFIO1WFOk0JscW/vh60ZvnnWsSk0767QPQ?=
 =?us-ascii?Q?hRx/xlHIrPdPIo3s2nwEv6SpF3rkpQOUL4VHrzFB5qCQEqaJarSaFmnXHLoR?=
 =?us-ascii?Q?dGji2j8uPvJ0PC0lV/poLyBZDiEh3Jnzds2O6Dt4mFGt84wZvbgRbaoH77dM?=
 =?us-ascii?Q?yFn3/9jsmAkfNRXWg/2qg4fhiSWTenryFNNZhafRFpco/wjBrrVmT0XTmo2S?=
 =?us-ascii?Q?RFA4Gk2cdok+UjG16rXS802Idtl3ZWnxOOWqTjR7ezn0FlO3ozMdYiMBLutX?=
 =?us-ascii?Q?y2jgagCio60wI7rSf7fanwHzKqIeu/gkZG1m3iaYq1xN84nb//DiC8Bbbk7u?=
 =?us-ascii?Q?iMLPRVDW+tQIUa3jeDJSIowN0HTimaLNZ4lm6rwWkUp4Q5qtxfGStrEQUEV4?=
 =?us-ascii?Q?A9WZ/ySAlTWFfmig8c8tboLQ/fT04DR6F7IiqkPMoxgzcgHfNXmcHQBLDCRR?=
 =?us-ascii?Q?61mBSdm3XHn5VSkSpYo55mG8xcud/JYjtaS3/w71bMHtP/bT3LP2uD/iW0sM?=
 =?us-ascii?Q?KQB4OvtQAYO88+2U35/AbKrwbtuMQbsYO0Hwbz+6mNKlatSV6QxCCYntJuEK?=
 =?us-ascii?Q?Pke3OZQEy1MmaWSaFr+Mb/ConXfx+vd7G/3CzkeXOBolthyYav9kbwb9ScJb?=
 =?us-ascii?Q?mNJQe70MPOQOV/rpRGgqHo592AHqy++8CvcnwScc5qmpyxCcTd2gihqquCB7?=
 =?us-ascii?Q?h4ll6yq/FY5qVgsIDg/xjAo3SiRfvzJc+PZC79cq+Sz0GxrmSwewTtM6qOhK?=
 =?us-ascii?Q?1s99eDgfwxHKKUrQwY3Dz75ZAuAshTYG3Ks6MHPcwVEP+w0YMad/KsutA0/n?=
 =?us-ascii?Q?Sg+E5hHyEkXK5Ok98L/zgBAot4f3HxXGC/NykhYfN/y4nckEL0PeBbomze8x?=
 =?us-ascii?Q?B8qBYbGmqeJ6hDnB+NFL4e7Tfa/rLABQnIIHAtLq9IzeXjKNWjerihd0QnKr?=
 =?us-ascii?Q?h5wmYLd1i4YfnPKq1yLZpmQGdSXDE0WUf6KQxzRHVQUv98V0AS4rYIuq9s5z?=
 =?us-ascii?Q?aQU4qbox8h6+bwcZsbr7CRB1GU4NsKDw7oWKPsIDwpQd9jnFPU/lsCeqbqsG?=
 =?us-ascii?Q?WQv2vDB9bNTWz2IJ6sVX4Qm4fXswFeU6bPAROEcPmcMVyK2l+g0qqUWnnSSA?=
 =?us-ascii?Q?eOaK7tvoFmMuBiIr/GrcSURx1aX4aipNkZMw4aGCQdTPNN4T+V5R8HrNiL9J?=
 =?us-ascii?Q?IAK1jBFDKvy4nC4ys/uOFwqdNY/O0qcjUdxyCE7ENhL+qAUzJV9099KFbZq0?=
 =?us-ascii?Q?X5wIZKWhoUF0klzVuHzItbYqVC2S+ni1ZbkXJGd+PJY2yGTVVtGJwcg5anlO?=
 =?us-ascii?Q?EwUgWdHZRS5/T1fm1TbojCL1+C6gPTuC2HWlezNYiA3dSzVPsY5VZ+kN3YaX?=
 =?us-ascii?Q?uvuOYZmvD6LBcAzBpSC4hsBPgQ+gtO6Vnq31RpHTN/hL7ONv+i7kG2xWS44F?=
 =?us-ascii?Q?hQ/lMBugncxpLpwpHteXWDbw2XsyLZHJr/p6lKeU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764fa4c3-3a11-4aae-a9f6-08ddbae0e9d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:55:31.7102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOhZwxAmesKFYqRbcwpK3UZXFZfU0CaVzV0S/GdeZRiIgLAcr7WgVI25y/fXVixYdTqUuHe1Urd5wRi+OHldYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7834

This will use USB noncoherent API to alloc/free urb buffers, then
stk1160 driver needn't to do dma sync operations by itself.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - no changes
Changes in v4:
 - no changes
Changes in v3:
 - no changes
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


