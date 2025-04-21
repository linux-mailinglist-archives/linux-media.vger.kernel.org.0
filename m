Return-Path: <linux-media+bounces-30581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28163A94DD0
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 10:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EFAA16B1E6
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 08:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF15C258CEF;
	Mon, 21 Apr 2025 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VZhYXeZl"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013039.outbound.protection.outlook.com [40.107.162.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899D9258CDC;
	Mon, 21 Apr 2025 08:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223239; cv=fail; b=lAarArU48bIdFRX12ajYjFb0bFws2LQLy7irtSNxoy0+qbvZ8dcwg7/gsURNnHa0o3ApLG/AF8yctNTMiI9clC4d5qu1eGotHKRb2nJ4vUg1s5/lrX+56/1U4ojYyVxkiUI6iqcajeSsOBJpzPgMBa1UQXbiKt1gxdI7LayV0AY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223239; c=relaxed/simple;
	bh=IKZLNnuiujADU1LD7nJs3uPhFdQJLB+C78bqMOgDVfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WM1n9d84I/2k7GH5d7AKYff3UjO6VJMoJooPA2kAS/cq2AbQgtf/vqkQ36NFRl15fC0dHJDdVC+rLo5eXCJ7Zcqf3gS1P8hFlWtvk3dUeyyNdG53bxP+fx6IFO3+wfSMBc7Ul/7VXY1TwNDx6ayvwEflhSn2rVzkjk6dZ3153TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VZhYXeZl; arc=fail smtp.client-ip=40.107.162.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2MYK+4OCdcb/WwmTye16RDaKh9RwiXlkR2WcZrnTpguJht1i1H0VFDALB8C2I//OTKCaR/FRY6LikJoqujRD1CdXYBF75yeeixJwjCOi88uCfEfdEjW03ind1Gexjyn3Pw1nO4K9ta+WRA6OovIIukQVflTfxSQ7hZxBV4zFg9RVfGUaqD0fzFi4BZ8YBwU0fYXKfUhUtqH5//kdjUTxlTarO0d62xoL1uUHo/Cz+JV0V/f5bhwzSscW4fggLYTTNg9/yvmjp1e+fGfwc9t2Xx83MiSwPm3NzgpW1vxAzgVBYjLGZfJp/eJvlKXYc9rB6yFuwlDRbTUjhzTcx2HHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SuZn2zJEs4UAieTzxZrlJ9cHq+Gd3km84A9sWcpQDk=;
 b=VIN3NBRt125OxNB7qbJm/so6goDAMqGszESIawyibv9FQJS05Byj/Xq8BmpUScuOukIEQ1FfjD1ZjZQLVbjQExOrPA7QGzrIts/SJp+LSwE0Su9Dl7IZJObhVUr4K9Ad8XODzOAa7LFtpUn88J9gBSp1KdK1PgAZ7jVkN5sNmTYLOnlV1yln6mLCpWfsPzeH8GuatwAO5HdAusmiJWRjrpkCtMzegAls9HxOlblQauR4iU+wFGGKc7KwLyon2B4n5KCAj3VdoaCMxIfXzJ0GSJyoH8I32IDW2pKKLAeiRU/0ULrZyecrsxtmYaut5X8WqIQd4+u9kaoqy5sUfvnsWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SuZn2zJEs4UAieTzxZrlJ9cHq+Gd3km84A9sWcpQDk=;
 b=VZhYXeZlB8AO+zCPWQFUyMw7vVRj6j2V+5TwAXsuWk8KNH2BqRGgF8GPaTBXtSrq2UWmBYpTzOw6M7xbEhICfWdjnTT58R40a1JDuQ0Fj527kjPf36RWtIA/Vy4VfFl6ddahSST8NT78MEHncL9RVEQ1wH3ZdVNFCfZIJvH/5K99Cvot3SSqmk39wdEoy5o4SWRfPlDYpH962SEvFQuB6BMTCizQqfb07zghKeem0jwSo5w5voEVly+D3DZ0OBUeaa/iwIIDiVrTsYXuwZJdKYHI8iTemxPbT/mpqh2613QENbc4SsXdGrVjltExSNFT5NzGZ6FUGKBivqD0Hp+vrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10104.eurprd04.prod.outlook.com (2603:10a6:800:248::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 08:13:54 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:13:54 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 3/5] media: imx-jpeg: Cleanup after an allocation error
Date: Mon, 21 Apr 2025 16:12:54 +0800
Message-ID: <20250421081301.1304-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250421081301.1304-1-ming.qian@oss.nxp.com>
References: <20250421081301.1304-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10104:EE_
X-MS-Office365-Filtering-Correlation-Id: eac0a922-239d-4536-0deb-08dd80ac74de
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?81wt0l7stscGrmdz9EbtMbnBeawYNLC5egJDCsbMuYoHq40kXJZMBzJetbRS?=
 =?us-ascii?Q?K2L2urAKLG3VLb+aIXbZgTgT4x+SGBw7uNzp/axd9QdRM0GJ+FsL3v0AK5JX?=
 =?us-ascii?Q?I4EOIVoIZCOrT/ZFYRH9qn1K4SVxxKR99o0UT9gL3A1LJYo4Wk+ghoKZpP9y?=
 =?us-ascii?Q?OyZpTipxx0uJ7See8Qu6LLTTYmL5cva0mRbjFKjhEcZ8LCppL27qNyAmYywP?=
 =?us-ascii?Q?/lKcbquNoZx4CYSpbNYxPLiA8CD326UDj+4XJhbMIl2Rr7T2Gbyhx3HUE4JS?=
 =?us-ascii?Q?NY4RAAMlCrN6cVKP/lrYFpZBrChv4Z64sX5m6VIn9xzC+hbkEi/Bm+OIaNBR?=
 =?us-ascii?Q?KAFBNCn22AgyvbZu5CDeSS2VV1G0ZiNEasuITKIGBHRlRM/fxYA7I80ApoVU?=
 =?us-ascii?Q?AucZ5++eTnxaTWzWyabipfCt6qD/8AO2cfld0z5PaxLnzTc51V21rsnbrrvZ?=
 =?us-ascii?Q?Oo4z12hwBnr8KZ3Ob+H+FEmDnaVRaKnAG074uEde5ZFZ7mU1T8FO9nDe+Xqj?=
 =?us-ascii?Q?88fb5m1fa4BHSGyRmSOA8EFKOlCXOK71O0Qk9bw/nfZt1wsPsB/Zw4qyhVL2?=
 =?us-ascii?Q?xNmp4yJrDdlynmOOCPDqVO3Ikj51pmKtmywsHoZIC+7HPONnQCNj31Pv3eFR?=
 =?us-ascii?Q?cEDWqBE5Eirsnqk1Ifd6MwVvKclHVXuswgsmFSB9jKtJx5cnK/VaM8mAt/XB?=
 =?us-ascii?Q?2dSbHEnUsT/Op9EgH/qcdiLCo0d4kniGEZ0euIleXDlKwMqHkhantIpKaVZm?=
 =?us-ascii?Q?lefuf6bLPaqX1QCAztMmfav/gj41y4ngso8eX1N0jzPfJ6wt0LOUrvyvV8dB?=
 =?us-ascii?Q?Cnowe83+K2ACxUHAktNn/7tXbgkWtBc+HQG24vqycAdE5KdGPjH0EillANbc?=
 =?us-ascii?Q?pZ+Wpy0SYt9NqOU8G2STmRVPEo8XIiS2EhdNjkxtbNKL8xOWaTi2Mt/cTQtV?=
 =?us-ascii?Q?hl1Z2YNJME5l91pl5eJi9j4DVv/HWwkwTU3PUB+2HiFPtCtdY1hXu0hPJKAt?=
 =?us-ascii?Q?lAgLWsiKW6cWf770qje+43aIVAH6yht7S5Erllzmw8m82ooWsHb6Emoj8/7Q?=
 =?us-ascii?Q?Nko+LrZ0Pt5nnq61/j0P9JFURr2JvzeFHTjbKx9DhXNpRlPctl+eGfbd0s1W?=
 =?us-ascii?Q?AT4EVpF+VmfyM5DREEGIv94xB4TweOIzRU1n1bFpTmoNIU1zP0bqiGu7Hq1P?=
 =?us-ascii?Q?hTkc5ujNZL9I7lKnClk1qLKhpCiGMwBVRyEoC/T7S/nFej7iRf9jhaeZFMnP?=
 =?us-ascii?Q?AGxPR18zQ98ZA3wFOGINWtj5NZB86iT5rnh0h/fxDZiY4DQFT5OmFCclpGpD?=
 =?us-ascii?Q?vFgLTnv1LBIwyITlDtVfjsw1Vy+vYVqRZ2tJZe9baVOxyw+KHJBf+C7TmasN?=
 =?us-ascii?Q?ZJb1v+gAVzsbycFzUDinBKMqZGymauuaUyI9sUS2bTmcFyWs7sJ7udk8Xh+Z?=
 =?us-ascii?Q?1BJ3n+5YPte9zmd07QHrIJkcXKNcnvfUZ8KnHQXE6H9zCeajmSRpXrF6UTuF?=
 =?us-ascii?Q?+fvvaD6zrRhO/xY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1UKvP4Zv5UW9Jd1c9P/xAy0EUbUyvUg12M4lxx2+NNshwVYNa3ojLJKNvk1a?=
 =?us-ascii?Q?aAH0znTMqdqVWEoSfGLz277KOvHYIQjtROkCanPGCaynx6nXOLZeivVVuHq/?=
 =?us-ascii?Q?7jip1BnPjhydIn7MfCUF5bUpGaDD/bi3crEQLI/9P7zhLoQ35m+BfbvKA+FZ?=
 =?us-ascii?Q?OPdoR9Acm0iztiINbLUwNJO3Me+XaFe667BdF6sDPC9M+AwsdKndHMdXm9Xw?=
 =?us-ascii?Q?BOhORYxeG/fP7lProjUBC/fnljyh697rN4oblmP5ItD2vbAt9KEBUVtwuJDO?=
 =?us-ascii?Q?pYxuuR9IiS1kSJiAw2H5iiUu8mYZUMACvTcv3PnqSTdaD/bM14QyPPGTeoWL?=
 =?us-ascii?Q?7XTf6pNJn6THDCi+W9pRZOO6f+VhSWh/zHXsQY9v9Wdqu0xpmpZWdB3WAFtN?=
 =?us-ascii?Q?GwTet1PeEgLMBEsazUgKiJekETX5Gkf5oWppJu1Bm+PJjtBXFFuItwa+8Ym5?=
 =?us-ascii?Q?NFsxSBtVfNNYUdPWMs8t3DcX5vqKSsLfjY+q0ti3q5XHJ6lqnuFbQXEGR0qR?=
 =?us-ascii?Q?EmVRBpm1mhYTLQTN2MqlDi14GzCgj11f8MVfI2kxv9dCPNI+80AcjytgPm3B?=
 =?us-ascii?Q?gJzo7DEg+lH1MvPqOTv9Dr2Nu3RxpCM/yGrbmUNXf17BRwKnPINWtArFc37k?=
 =?us-ascii?Q?p74Ey/oAMvXkcM5SMp2qcu4wqY0AgrEKour5Yo44+zSLMhO3HDn4ln7lsb+B?=
 =?us-ascii?Q?V4pfBjpU0hPqMVlY05xgk5v5nlMR2iMn2vrFSjyxfMzX8xHfb40vr0mB+P9P?=
 =?us-ascii?Q?WdVB7yj1gay5K04cJUGx6sJ8LaxCwOmDhAC5ywKr4hzFdKANNMXycAK/MgyU?=
 =?us-ascii?Q?x7A+cJdeFTYJzfp5SEJQ1SIlsoRyVcXdWWGMh5UDqro2TXXHARDac51b++Ew?=
 =?us-ascii?Q?8GTHVg7tr3cTH8qWbaZWnIhdRpvHm3XBBUAacwQ22qpYLpO6DUiwsiXa6TXO?=
 =?us-ascii?Q?Qc1+hLuaFCnY/uvntYlAK8Dr+sxJVKCaRcQa7+3qppASoFT1VdE7eD2l9MH0?=
 =?us-ascii?Q?L+Bvt+Nf/RPPeYNmlgfNn89FQZYb2BPwNpHmRlN1GMfSs00iQ3nF8INsfN1L?=
 =?us-ascii?Q?tWQE4RFMDrx7XdQEiMXZVRqUo18UMSSsDJBOYEMLqhl7ZV5PlHMTEo7wZOgH?=
 =?us-ascii?Q?GoqlTdlyNOMU3b9tNa2RuGG0DOkaxyulsIhBdaQ5Sdi3v2lodoCb3jPcfus1?=
 =?us-ascii?Q?vJSX/sjFPHKPVkCn28UtBI3IYNYleDsQQOscKZKzSP5p7MgRdxbyU8el5iIC?=
 =?us-ascii?Q?L9xhsC9aZgS/dqsb0rluTZXfmZDzYrHE8ZcPs3O9DAntyyDLomZbo8LqKWMY?=
 =?us-ascii?Q?SJSOSCraUIoBlsmOZtH4VgU3GdGn8SRS+0/6VbP9H9yLGn3YWYMx6XBDOz4L?=
 =?us-ascii?Q?fNFgSknxZWJiPmq5iVbW/jxhcwFoeHeUJAvNL4O7UssZg1lllvjT+AUt+01R?=
 =?us-ascii?Q?6AB0yU+I9y+8lX7jPLvoPfqDqllkcITYOX0MuMGb5u+3yNgINv/P5w2qtbWS?=
 =?us-ascii?Q?jTPNhST+YM1162r9G8pYuKkXXiVl18auyd0owlkzVvTRJzndHKqel2ZLi/GX?=
 =?us-ascii?Q?9cBwcsnYuYO2MOkJakg4qssMvefjXEwNpbBWjwcJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac0a922-239d-4536-0deb-08dd80ac74de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 08:13:54.2940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYHPLrzfkRXaEJcQn7PynUTIxZASy/V5jQxRZb1VCAvqKSftFxC/a6Wze5AbwPnyn6Ibg/jaeomSRfdI8dbl1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10104

From: Ming Qian <ming.qian@oss.nxp.com>

When allocation failures are not cleaned up by the driver, further
allocation errors will be false-positives, which will cause buffers to
remain uninitialized and cause NULL pointer dereferences.
Ensure proper cleanup of failed allocations to prevent these issues.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v3
- Split the moving of code into a separate patch

v2
- Add the Fixes tag
- Improve commit message
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 29d3d4b08dd1..8a25ea8905ae 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -820,6 +820,7 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 	return true;
 err:
 	dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", jpeg->slot_data.slot);
+	mxc_jpeg_free_slot_data(jpeg);
 
 	return false;
 }
-- 
2.43.0-rc1


