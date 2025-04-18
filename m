Return-Path: <linux-media+bounces-30519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DCFA9333B
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 09:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E1B7462242
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 07:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C084E26AA85;
	Fri, 18 Apr 2025 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iS0suIpl"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227CC26A1D8;
	Fri, 18 Apr 2025 07:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960185; cv=fail; b=FxgTYEgBBlwAhDbSZunYwMWjauzyoUsj9LjeoOYZLw2UJWJ9mhe/9ie2sWEUCbl0fFR9Hvxl+h2ENa4bq9PjmFX+cZaTfGrl7UBOVBYrO2QfWNTAqzDJfURm6G8cbF2MnuJxZlsXtCK7q5u/FW92qvtED9UiNyDUejuhzohmCmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960185; c=relaxed/simple;
	bh=M8EMYRDnf7IYuxSOo96fLIou7nDjqk5IwOHm0aaAhqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mHmjpwVLNkG3RaagNGCxeMro+3QIzUKq4ua0XYYTCqbAaeYT+oT5XC6B4d8rMldFuLd7hiB2OcGmHx1C094rK9thT/e8t25ZEZoThnrAS6aBrrBoyjKxlKYph4A8aP6OgSL4gFe74f5TONYgU7sgHifGBd04/L9Jxl/6lZPdgTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iS0suIpl; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCY3vvCParfI6B2DIp9Kwse6sIq8c8fqarvSOrZRG/YE2wcbZZjSaoU9anRJHh2ui4BXToOGrVc+19QUDteczhduZA/akH4ZRZX8RI3vjsoSVV5ZzfbWDfNbZxLZ97XjtYgNbDF+pbEIjg8SesgULFNspfauV0q49hy6eljHfxWiYqUIU/qdveOF8RzTj6X50pbDVWQrx8Ms4hq31sZSZlIOyaxTLyrRG9h+/Rh0snfymSAnrl+vSTHy8JbCvg6DdBvVQMa/2+mjghfHn9hGBlK3fDitTavh1oRzTk2/kCXkbNDzHh5N/CN9ehRP3WKT2AjgNetqpTgcC8pSDRuZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbBELgs77b7lIUpwOS421z6ZzsJBpZxVQvu+YxmPQvE=;
 b=wtpOt3XLIDJhT14EAYbZ781M1wlcSvvCeeDAE6C37SBwMTjiXWOvXIHzMURSrJZMfXt+uL7mF4tUMX2Jru/doqCrNaogyZ67/wyWGCu2025ii/41LyxqtCVjsRcI4iWhSOZZ7JWCZNzB5oBe7nNQ/IXMelF32vHM91OUQlKDb+PVVftvUOG9SsDXsxOBHwiS2jM5+U7GtK7Rl/8nGcAQWT0VEcsh9QDJdZWdgg9b00tU7UFEw+UdEssksNYVUEjsIrX/JIsbCLlg5JcNztdIRFZmtoB4Fq92AwY4lJTa2vCraNaSOH4d8RUON6G+KJ9wkdt/G8jd3BHOZVEnixzLdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbBELgs77b7lIUpwOS421z6ZzsJBpZxVQvu+YxmPQvE=;
 b=iS0suIpljWwvSj0HQzarbsSTmaXViYhWDZ6i8lip8P639Q9bGXgYT+qxasAIZwQ7D0H1bJenXAGNsgKSJybOZXBI4mtEmMUgQhwkrb9Hgew0hAiqqW2MYjs3sE5Qh7MiTSPBXztn4jkAT7rCiDy/NbG4w5ukfvssotMSWBOkr8D+5mZfShqJ+7TMlnK0xpd9Ae6IxYrM63ATJ05XjnBc4Sh+X1QSAQ88JwuQbbExIyLmsxkByJ3hZ5PsGtdDagl0JX3lj1kJS0vHLHEJEPb6cYKeam1rs8odR7GkLItNOcoxJH1MLigickZ1ATnzL+PC1aUQLjkxW6Y+x12zXI6H3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10160.eurprd04.prod.outlook.com (2603:10a6:102:407::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Fri, 18 Apr
 2025 07:09:40 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 07:09:40 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
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
Subject: [PATCH v5 3/5] media: imx-jpeg: Cleanup after an allocation error
Date: Fri, 18 Apr 2025 15:08:19 +0800
Message-ID: <20250418070826.141-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250418070826.141-1-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0174.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::30) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a74fdf2-b1b6-4e75-ceab-08dd7e47fc4d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3hKDIVVMV3cTjWlH9NGYkpZnHf5hHpC5Y/C9K0za7qj4KRERfyiQNENCEC5K?=
 =?us-ascii?Q?XRzfELa5OIoQhgHzBHVdp90/gBsHEx3id8ixcTYRRbw3nuvfhaw5a+13EJfi?=
 =?us-ascii?Q?WM3MZfI7YhFpTEWc4UdNzdP2CjGFzWW3VA1b3LjXt9FEE+HWwClBkUCInQGa?=
 =?us-ascii?Q?Yl5l8Yk/C81piP/0mER+EKROYi/TNzYaseXIuCSXKgM0ZOEsosqie3VaSnJV?=
 =?us-ascii?Q?fho+g3eTAI0+yl7qKYNvDxUEqZ4QMjPSfksyJ/2193AQw5JekoZJwlGuE8NA?=
 =?us-ascii?Q?KPUiOyBSTsG8Y64Fjq3jQ740Qi4X3Jtg/4PFf0lNaaMU55KRpKe3UYEiHZJv?=
 =?us-ascii?Q?v1J5fnAV4gDvhNz2ccin2wTbNALMUtBHlyL1hYkh3wBYkrIuCko+AxA+jYk8?=
 =?us-ascii?Q?ABs7bqq2lCSK0ED6CZ32dMFBnNZQ2HREo7VwkDGltyUZwW/MqE3gHf9JxZGg?=
 =?us-ascii?Q?tarIMmA1LNvQHf3n1SDixQdYRDdVmXfMx8D7HFt5li+MaT+usiAnfYRzQu2I?=
 =?us-ascii?Q?iJMnL1pyQ8kUqny3iNBxjW09kiPwnXMDuq9cBjkIbdi7V1qCoWW21xZRO9B4?=
 =?us-ascii?Q?rdcOInENBH2N6zoo0Vb4yTCtsS22bIn8LgeV7v7AYQY/G4vvPP9K8qXYPCux?=
 =?us-ascii?Q?IwOjJQArrgsprWW7olKRwcfy8xjY3Q2u4Ns/YPI4IspdehKhf0yCaQTOpiy4?=
 =?us-ascii?Q?687QkGNnhyaaQQDTi9WIXnSIk1ozrsKHKlM3jLIVgEBwxE3GlaogdB9i0UrD?=
 =?us-ascii?Q?yrl8AJmX6c7QHF1z3C0HwP4NHoRgb0Waa1lvXADQFXh7mjieXtqNqb0ybP98?=
 =?us-ascii?Q?f7KcstH5Hi78hbIFB8zmrrClekYPotav6W8U7/17UUDChpQoQvFAQDcaI0+B?=
 =?us-ascii?Q?l8ZztwkbyaZAokrBs4Xcmm1K2s+9/u5TEER8J74mDGaRGQKN8x97c2ycwIrx?=
 =?us-ascii?Q?AATwqQjN6yX1o+V8g3Yn5JpOtSFMsChsK5JW5z5ftNoGe4ios/F8Gx4+G0cg?=
 =?us-ascii?Q?pwBf/LOvOKn+tumbwvgb6P6GGAYkK7QiRchPF1ASBxdHyn8wic49isSblwom?=
 =?us-ascii?Q?HJdqhcL7H/PPVeFRoeEosYfPE3+wbBEn9xIvujS9y/AfZrZb56nJeRvz9stO?=
 =?us-ascii?Q?3YIrUWGvgQuYGKM6aqQxq4qZH4R1OzqIIZkIi7BRSIyR+06KpWSbS7tyvk+k?=
 =?us-ascii?Q?uT2E3EkP+6zfT7BuCLFvk9IfvS4DW9ZYxaqo6ZDyb66hqYlGVwu+qcfT++78?=
 =?us-ascii?Q?89IKpdDFEIwqkeq2qqsZwpPLqvXdkqczjutXrv6Sl5+wGqePxW0f7dwvSApm?=
 =?us-ascii?Q?TukQRNgsQVI0vZtYXcqRcAOZuQXoybyQkJI7nAruLhY2EmC5atfsBnGJ58Aq?=
 =?us-ascii?Q?qTjKO9npFrc+ZYOet8I1eAkXW3HHPfkotHkziXjyzQKBUp8X1c4oukRYsujd?=
 =?us-ascii?Q?RxWvKQizKDXnGfhq86atSlmCkyjLIUC+0rGIXBQrUQiz3a1DhIeDG7z/E3dt?=
 =?us-ascii?Q?lD4xGpgjkXsiWJA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GdMTp9TLewat0ClFgNF8XZOCl35VMBUHgyoimRVekIbqSfMftjge+JBWPy2n?=
 =?us-ascii?Q?NnpAFkKOI7C2NnPyiS4nIFpR1y9aAqWdEw23PYAQWxzcwy3BNRG1onCAOqMk?=
 =?us-ascii?Q?A8LJk20TdZvhP6hD/e8m3ZfBerIYInf9CNz0FmbTBHMhfdMYrt5WC7xuhY4T?=
 =?us-ascii?Q?VerPUwULkK793WKzEEsnqlTzGcWdg4EQzow6D0xR5lADBTCocGjVSz3S4MOd?=
 =?us-ascii?Q?DI9lL6PTR3PtO8whFG4v2oZ2UCnmY3GsLBa1QLTtwhBG193hB/FI+g189N7M?=
 =?us-ascii?Q?Fr8liCB7E2nX4fbz/7jCz4OZKlGUzLh694hqSxbl6+Uao5nLcfutrYcu76Vw?=
 =?us-ascii?Q?MGEDUdXVETbAB5FZYxRxjZqrQcLon9unovntNLBATVHP0rOYnSAwfTsQkYOu?=
 =?us-ascii?Q?YEphxxWq2R+HK1CUhK4MVeWKzPkeADym0lIcjCOk4eMkoRRi4isFfQMCyjHG?=
 =?us-ascii?Q?I+Ezj5Mu6gd4TzYDY/Mm62KzPP2UzE1sgdNd977VJEn5EFKttfWKTooUIuuH?=
 =?us-ascii?Q?+Gui270ZNw7wp660Y82qAfDD++6M1DrluMQ24KheX8KTjzW3Qw2ybXunqGz1?=
 =?us-ascii?Q?W27QoCzi1sXO6q6oveS701RFcwELTRISTqwGL0amLSR9n1H6O+y9AOSgne4z?=
 =?us-ascii?Q?/uRNKo9nHiYxiGclPggu7l0k8BGGkbBUSmueQK/A2+IpJglTW1I3IjSBkOSE?=
 =?us-ascii?Q?zN0CaAg523nF/BW9Sl/y7sv55dkI2N5/D6yAX2P1EjV4RyDBETtcSd8xDR0F?=
 =?us-ascii?Q?yRZPhk97HLNAywGsho08vV+3vg3NN/Zhj/jH8P2XeDEjg5CmkZVyIK842jJw?=
 =?us-ascii?Q?IsRLA8h3F7243XqGSWdF9MPHOq1P07UgDyMkOwn3XBK8I+CQjrUxDVkZhhal?=
 =?us-ascii?Q?Z8c0Jb646h+mHLRPM8M/y5YsJsSy8dXalerggsvj9Fp3qwSPYFmp0u4pZBkR?=
 =?us-ascii?Q?qEmUs3vxlN1EdiJaFF6oYKXCehl920h2TnUCc9OMGR6wG5D9d/omPXgjVdcZ?=
 =?us-ascii?Q?ivR3ILsvI0kYm+nDzbtITXRQWn7ofTPn5CXOSYznlWMT59gF8vcmBw75x39M?=
 =?us-ascii?Q?/+Vvchpk9paPNQE1/v6wK3b11p78QqDuwrDrI5W/FQAF8qUn7kl60wHdmo5O?=
 =?us-ascii?Q?Q34cz7yja5MRm/PyOwL9GfJGpsGhFXNC81gKQWJl5XGFRW29YaczLQ+HbyGP?=
 =?us-ascii?Q?l+GxsMRFi0tBD6KpPViJ8tv4kRTwMj+tSmGkEwQO6BSY4s3XEMDAK+kdgG+q?=
 =?us-ascii?Q?vq9oJ+TPQDMh6pApAs8Fz45viJJmdhGNcP2mCRK2S0uRtIeKiP2FjyvrFW3f?=
 =?us-ascii?Q?ttuPdwbvxxdbs4XM6nl/UKQYkt1zQYq+o3u2foIL7IjmuBt8VJJABH7LlWgI?=
 =?us-ascii?Q?W/yz6bR9IhOvRQK5tHkAZIu6fCE4PZHP7pmnmXUmQoxamlF3SkuQE79gyvHL?=
 =?us-ascii?Q?xdf9buU2cyiUgm91CU98MCiNc53RODkGbjqk8GCPPfHfMducYys8Ccqk4hqS?=
 =?us-ascii?Q?t3a0YhWJnv/0Sze/RYLunM2Y/S+fnuyH57frJ3gGJlgMmsDJSshgJXQ9FnrK?=
 =?us-ascii?Q?hMV/pKUKLD3FH2LAY6BAGaN2E5bfW8pPvlFZJIDM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a74fdf2-b1b6-4e75-ceab-08dd7e47fc4d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 07:09:40.2481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXEVUpukWL483kRXMklWBEcMMaXp+49rF+U97eXJWhKKtgQXH/2SiM97PMrvYnam2mjOCjCvZZYxQYoPgihEtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10160

From: Ming Qian <ming.qian@oss.nxp.com>

When allocation failures are not cleaned up by the driver, further
allocation errors will be false-positives, which will cause buffers to
remain uninitialized and cause NULL pointer dereferences.
Ensure proper cleanup of failed allocations to prevent these issues.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b2f7e9ad1885..12661c177f5a 100644
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


