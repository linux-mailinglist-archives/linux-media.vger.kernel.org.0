Return-Path: <linux-media+bounces-47420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF84C712BD
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 22:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B41A0350AA9
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 21:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B4B30B53F;
	Wed, 19 Nov 2025 21:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kC0nCsu1"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C392304BB8;
	Wed, 19 Nov 2025 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763588094; cv=fail; b=Wyx5krubjrDya/jDyoyuBzJ/s/Od8UnJ6RdaPrxXVSmMqyfzKrlJNkulGF04M+hQy4i1TetUwyfCMZD/LgoTr1aQZHh5hQbt5MHJ8Zvvk07LlbNP2XhpmtXCylS0S2tsMkOQLX12QfEykjZfKW0bFmYKGwo9/fn41B8zLisa+Qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763588094; c=relaxed/simple;
	bh=yPwnUBOev/x/308wqg/c0rNtCFlwwv3fG4kMS/h4VvQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gZ3uTEr1BOkTOijZl2Jr1d4yrkVexzHHo7eNt+NyBAlPvY1DjioTvUUJ/1e6oG34usaC18qtidpFsQo6L75QPE3wFeW84SxKeS+nDk+8aWcoWgut1XFhpej/JbgzPu/Uecn76VnxI4BaOzoX99HwvZ+oqCL28nAN6Pa0XS6rkoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kC0nCsu1; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6Mm7mJRInlVh4jjNqSnYdnpxamCkxuBAZegKW435azl/9RrFK0AMnGDDCrGoMywn9ssJxBBoxaOPsFfeZUrgDpyQdzws/9BO/OEsbiSaR6/xKE4WBNtXfin5dKccyTHaSZsxeumICj9zs7LHwA76H+uaV19IdezLE+EimvGHtfzg0INnCh2LUH4FHQAmdl8TZAO1TRBta4qScCJOsCbFJL085VuSfyuDXkA/VgT8iMtbcWK/m3PkTZVLjwWQ+cjAJm6vj/wGRq8jvE/yknKZ7PRWLAZX2aPfEtnx+BDqoPXB/dclt+pdLRwvlfrasQhO4VXualiN8jXwXI+2bN0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzPs5H92nXDeok0MjXa/DcPz5kXR2XdL8jcuKSirt3E=;
 b=HNVJQBbH2ztDel+bJUsVOrbl81ErnlaN21fIIOuTVhI2nNO+sZ37oS3cM8Y+kvPg/gPX1pXvI2B0gTDO1UlkiIPg7ECVN8UTs7/XJIuJYekb9J0DwMLmAYZJjd5ZQ/8RfDch4MHF6iRkcZI6Qzn6gj2kynVx1eoaE6ZkZ+gcnXODfhEaXkLO0mArTvLJTipKXT3WLUYHsbi2AMA6K3RN57vljVaaJ1ikwcvZv6pnDZAH2NBdq1o0t/KSqR5DtdAMXHP72etoYlhmCklHGs/TvTqBAoKwC1S8Xlkso1TjETFZ6IisePjw0c4CedLbFNETUl27LmtbGFhjg2EnBHg+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzPs5H92nXDeok0MjXa/DcPz5kXR2XdL8jcuKSirt3E=;
 b=kC0nCsu1QKQNa/vslziXtF9T8ZSuiF5YUMJ2OsTE7TsxMcAzFOUyeBZ3kmOIX1GBxzyEC2G9JX2lJjLSSSGVdBUIM7N2jHEfgChOrtmuiFw3MUje6OzTLpNl3HxftryfZdsHgib2P+Wm6yvKVcuVVJUCbBAUwSTMdU3DqlCZu47JBuopSoRv8Yc2z5gn91wqLqDqAr1Llkqd584Dm02UX+jP64O848u1Oy4dzKnVG74wM1S/55N8r88nZyhSUMeEjOdYzbKYjrPnepSOpAQmwF4B6a2xKWmFoHnxhepB6b7ZzcR0XUq+qwfFxTKECsN2fe95RQ2/ASvx17AXXe1YRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 21:34:48 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 21:34:48 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 19 Nov 2025 16:34:26 -0500
Subject: [PATCH v2 3/5] media: nxp: imx8-isi: use devm_pm_runtime_enable()
 to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-cam_cleanup-v2-3-df732cc83ff1@nxp.com>
References: <20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com>
In-Reply-To: <20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763588074; l=1806;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=yPwnUBOev/x/308wqg/c0rNtCFlwwv3fG4kMS/h4VvQ=;
 b=CNBMrqSZYKVDbwyhRCzTnshMjwqR1PYrZBm7b6/3pCjn9Wwi7K1+kkjvJ7/6acF2+H5NrZyLb
 /DNuAilzAxcANLXSkEYNh6nqOnlsejuERIHHE9GKcV1Hs+ZvdjFDYaE
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0043.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::12) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VI1PR04MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: fd841d85-b73b-47f0-58c4-08de27b3770a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UmpuU05zWkhzY3RBRVFsK2JxN3RCbW9QcXhkdXRBUlpYejRuOTRKSjF3MnJL?=
 =?utf-8?B?RHhvS2d1amltSEV5bDdiOGRhcjBGWXRRUlhxUG1WeEY0V2lodTlsYmdqc3p2?=
 =?utf-8?B?dHRwYk9yc0pSZmFlUW1FMmtzUklhUzU5Q0tqdStDemNySjRqemNYcUFpN0tJ?=
 =?utf-8?B?c2xneWErbUY1V2tHSVZNd0VPWnFQeVNVMFh1SjZuL0syYXFmU2FjTDUza09w?=
 =?utf-8?B?TzlBU3VyMUFlaklDT3JDUTJkYzZqRFdBc0sva2ltbmZIZy92VUs0aDVvODgy?=
 =?utf-8?B?aUNSbU9OUEtrUko1NlcvRWliekw0T0Fpem9qM1VTVEljL0RaVjIzdTBrZW9C?=
 =?utf-8?B?U3VneFhYckRLdkZJOEg2Mjc0WkV1RHlYQVlMRmJPQ3pIUUp1enovdEFFUnBP?=
 =?utf-8?B?YTZaN3hGcVJ6bDJwa1pEVFpDMUJnWDhOdVpBTFlNMlpwZ2hMTWhRQnVIL0dH?=
 =?utf-8?B?Zmt1d3RNMlByd3kyVTFEUnJaKzVocWxPZ041d214WjBndUVNVXMzTy9HMUFD?=
 =?utf-8?B?alVxdFRObjE1bnV6SURudHI4akxja2RQK1NsNDk5enpWU2QvVFdsSWdYeU5G?=
 =?utf-8?B?aXA0N0I0Z3h2Z1RMN09JT3pSWEdESmVvVjJjU3JtUkdnbGNXS1V3WVN5RVY1?=
 =?utf-8?B?Nkp0bG1EZ2RXYWxrS3duVnBHbFIrSkNNZDhVaUVhNmxjVElKL0pKOUU3Uy9t?=
 =?utf-8?B?bUJzR2FFRUFaY3JwTVdUbjNxQ2tHdUt6aFoxa0loSk9mUThUN29kTEJEYWtx?=
 =?utf-8?B?MXZzTk5PZElXVXZ2elpLazg2M25YMy8vbjg3RXlrbi9mSlczYmVyS3FoSkJl?=
 =?utf-8?B?bklZNGJiaFBSblNwd3d6L0lEZmZRMFNxTlhXUlBreE50a0gvSFlnMEpVZFNR?=
 =?utf-8?B?UHpQUXZRVjRGbldQdER3Skl1M05lRE95VWpkczFOa0NWdHVIWGZVY1BwWWJJ?=
 =?utf-8?B?dkhkSTNhMndQWW1xYkRwNkR3VUZJMms3NXE0VnFkMjZGVURKT3FFZ1RleUEy?=
 =?utf-8?B?UnY2eWFRZVVRSCs2Um5iUDN0TkFKMGZYZDA5cW56N1dqOEdySzNHVXpZWGk2?=
 =?utf-8?B?NWRyOFdkL0lIMnZyY3doVVVQU3M0VTFGUk9LWHBhT1g2VkMyNGpCd0pWNHlx?=
 =?utf-8?B?eUtWSzBMOWlwR05KMjk3Rlcza3A1azhpSFRlakVMNzdNbmRBUm12Zm9UUEJ3?=
 =?utf-8?B?OXB3NFpSMmNycVIzQndDZTlUWXU4d0VybndMdXVhM1lSNDdVcE5nQ0lqWnE4?=
 =?utf-8?B?S0JwTUlBaVBBZ2pHU3NBd1ZFVlhrTXIreTh3K3dSQnhDMEdkb0tiUnp2TzdO?=
 =?utf-8?B?b3VIZjcrbWdnMUcwRnlhWUtSNDBtYWIxUmVuWFFQQkwyeGpXdlRmY3lzSm9w?=
 =?utf-8?B?anJBLyt0Q0NOMFZxQjQ1akdCQWUyNnhIeFBpK28zOGNRSkEvSStENUZMZTND?=
 =?utf-8?B?TXJnTDN6SlRjMGRING1lV0lBQXBzQ1pnQ1pMY3l5bkNMUFJsQkRxZ2hIVDVR?=
 =?utf-8?B?Yis1eXFNQ3FuVWxlMmFUTzZYbGw3ZkJLQ29JMEpzd1lZMHJrZzdBRGpxRHNZ?=
 =?utf-8?B?TzdNRjJMd3k3KytrOXo0d0tHSk9ocDRDRkZqSzVDemlDQXVkTzlMaUtGUUpO?=
 =?utf-8?B?Kzl3QUdHeGtKR0NCcHh6RDdOaUwvQlJMQ0JXc1Jza2hYaTF6V2ZCMmtReUhX?=
 =?utf-8?B?Q2JKaDUyTUtrU0FnYVVHa1BLUFlpeW5GY2ZYRWJJR2EvTHhGaGlHdncvQkdK?=
 =?utf-8?B?QUUzMHhKMDJmSm9UNlJKRjduVjJKaTc1bzREREpaR21BSlVmMVpyTHY0SlhG?=
 =?utf-8?B?RTVyUWhmTGEzMTQ4OXVJYjFhaGhxT2lrcGJPM25wNUsycnVOVW9Oa2l0Ymln?=
 =?utf-8?B?MlRhb0tTbG5wNi9RWE9MYXpsMDhacVRPNlIxQ2MzajBaTmpvTHREcDk1REtQ?=
 =?utf-8?B?SW5jeGE5Z3FnY0VaM2dyWXZUSUFwODhqcnRTSFBXN2QwQW16S0pvNHpmYUVn?=
 =?utf-8?B?cDJ2NkMxYkJDNjBGMDZ2QWRXU1RENzFuT1FTWVhnVlAxUWVxaXlvb3ZMbTFE?=
 =?utf-8?B?Q0lDTHBHS3RjV2NLYW9oeWxuQUY2QjF1VTEyQT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bzNZSFgvRXRUOXlnWEt2dWNjNFRuMS9nSW1wTzRMRXVkcjdmeDNlOXh4UHFS?=
 =?utf-8?B?YU5YcE9Mc09pZ2c3Njh6MnJuS04yQnowNHBFbGpFK3VDRzNOSUVkRzJYOWFo?=
 =?utf-8?B?dEJWMGNKWlQrMGl2OVRham9uVWRvVC9uSVV4My9MV3ovazJ5SThtTStrQkdK?=
 =?utf-8?B?YUxJc1VLOUgvaktUZUdRbC9xc2Rjai9wUmZ4UUsyRlJ0S0djc2w1cHEzeDdP?=
 =?utf-8?B?ZUlMcFVpS0toSHhQblRHbS9LTnBLYW1VejZuaGNERDRKQytNY3JMOWZYMVo0?=
 =?utf-8?B?MHlmOW0zMnVqclJuZ0hHbHY2VkRFbWNDT015STU3cVkvYlJIZHFiUlV3dklp?=
 =?utf-8?B?UlBrU0w2SnFuZDBNR3pCbUZmOGlic3k1LzA5ZnBGWVlYMTErSmhtNW1WMVhW?=
 =?utf-8?B?b0IzdE94aG9QVENHQUI0d25waDFlRHZqNWhsVXErdDZYSnU3ZUkvVmljOEcr?=
 =?utf-8?B?N0RNOVk0cm9RUjFDUXdJZ29hS2Y1OVhQakFBN2VHOTloQlhsSHlTblp4SXBs?=
 =?utf-8?B?Wk90N3E4cHhrazZjVXAwZVpqYUtoYW91RnBrejZnSHRGRjNoV1FIWGhDWXNY?=
 =?utf-8?B?Z0tabTFtQm5zREZGVDFRNDErcktaWUxxVDVHZnZUeFJ3UGpHVWRQSnd1TWVt?=
 =?utf-8?B?MHRXQ3ZqbTZObXVzNlVDVGtyVjYxcGRlWnZpUnhrVlo5aU9FV2VOaHBTVGww?=
 =?utf-8?B?bkhJYlpYRy9pT25LbG94YTZnQ2N5bjFPTjd0aUZsaFB1UnlRMmllK2M0b0ZX?=
 =?utf-8?B?dUZ3T2wwaEpUWkhZSldIUGd1VEx1VHh1V0hpekZYQ0NKbFF2ZVVycm5Gcjdi?=
 =?utf-8?B?Sy85R3hHYm92OFRtUVNrSGR2d2pkRloxSEU5aTRuT29GUThvWlVNUlFvWHBx?=
 =?utf-8?B?bjRKZ0dZLzRBYWFHbjYyeDI0dzVQd3NhTlRsdzJtTjFOZ0I1cHVtazZtdmRI?=
 =?utf-8?B?Qjl3ek5tanJwNno5UENYTGkrRTNYK1BGV3Q2T09qQ0dteXRiUjZkclVZRlJr?=
 =?utf-8?B?akttZUZTdi81UlJpVWlzRDlxTlVhNnJwbEtTOGF1THJWakdhZHZQVmpjT2tD?=
 =?utf-8?B?NmFHa29uY1podDMwcXJEWmFNR3FCTms1dXZZbTdPT0JyR1RYb0JpclFVTWRR?=
 =?utf-8?B?aFRRdkFYT3ByTTZTTTU3eWpPbnFiNG9xSktpbk0yUU51bE9nSlR1UW9FakZy?=
 =?utf-8?B?VThBeXdJRDB0V3pERW5kS0FGTVRtN1lsZ2Y2L2gzNzU2eHlKeFl1eVFJRlU2?=
 =?utf-8?B?QUZ0R1BWM3g5Q3FveVE5cXZCb0pxRVl6cGlHQjhURGUxYzdiWXorQUNaNTVl?=
 =?utf-8?B?TGpLRk9lVHlITjQ0TFArRHRrVHhoY3VXbFdCL3lXOEM1VVhzQy9mQlpGQ3dD?=
 =?utf-8?B?QTVSNE1oWGRSbys5UHBhVm0zWHY3SHhzeGRIRHN4OFg1OUJaTk1sQStYayth?=
 =?utf-8?B?VGp2RXo4VUZaQkRZUWdnVFNSNnRjTHk0cktUNzRzTHVJNGJlejV6UWpGYU05?=
 =?utf-8?B?dWdnYTZGZkZ2WEU4YkVlTWNmcHhwK3NCNCtHWXRkM3duSGNKQTNEYlhrUHVa?=
 =?utf-8?B?NHlPdjd1VytQZTRLaHVXaGNjaWhXMnF3LzhLTG9QS2d3ZE1LRmp5dytnRUVj?=
 =?utf-8?B?OUMwaWdaUFNiRHA2Y1dtaDVpRitSREJFMW1XSFRFMVRFQjNLQnBERWtVblF3?=
 =?utf-8?B?SVpyRlpJcS95WUx2M2d3K09jR0tyR2Z6YTRYYkhFcEZxN1djdUt4c0VEbVRq?=
 =?utf-8?B?VG1ZbUlYczBxbnlUTkNpVHVoaWJ1ZVYrTlQ2a2NWMjlPQk1iZndIUWNscE4z?=
 =?utf-8?B?SnZ5b3hDRy9rN0ZkdktiLzFoV25uTDJtZzArYmE2K3VtTEgxRVl6UmltL0Ro?=
 =?utf-8?B?ektQeCtPTitMOWMrVUVTTXdZVXRJempBenFGL2VzK3Jmb1VuVlBvVTJxNklK?=
 =?utf-8?B?MDNVM21wbzdWYkNNTVRyb21HdXh3d0JxUUd3bkYrUkRtN2c4cnI5RzZlaGJt?=
 =?utf-8?B?Q0Jmd2kvcVpDLzY4dW1zM1gxUkFhMGlEMkhRSXZnWFJQUnFxdTFaZkdrWW14?=
 =?utf-8?B?LytDRWlXeG1UU2ZUMzJ5VW5pYnBYSU1PMFM3bVo3MG14YUMwYlVSRFlDaWhs?=
 =?utf-8?Q?xoYKCMh49mIU4uzr5MrwyTrFu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd841d85-b73b-47f0-58c4-08de27b3770a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:34:48.4024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NX2m5avLPtXF4ZM6c3DL5dDKZdOfDsiGvf80luUVvGNqeRuLgHiOpAaIr7Ye1k3X4qT7BpMQVa9XYhHB6sk7MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7071

Use devm_pm_runtime_enable() to simplify code. Change to use
dev_err_probe() because previous goto change to return.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- remove error code print at dev_err_probe.
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index c3d411ddf492eb27b372763ce5d344a90c6ec524..486092511d1f9381c250ddcf844fc74c61a789b7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -499,13 +499,14 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
 	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = mxc_isi_crossbar_init(isi);
-	if (ret) {
-		dev_err(dev, "Failed to initialize crossbar: %d\n", ret);
-		goto err_pm;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to initialize crossbar\n");
 
 	for (i = 0; i < isi->pdata->num_channels; ++i) {
 		ret = mxc_isi_pipe_init(isi, i);
@@ -528,8 +529,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 
 err_xbar:
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
-err_pm:
-	pm_runtime_disable(isi->dev);
+
 	return ret;
 }
 
@@ -548,8 +548,6 @@ static void mxc_isi_remove(struct platform_device *pdev)
 
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
 	mxc_isi_v4l2_cleanup(isi);
-
-	pm_runtime_disable(isi->dev);
 }
 
 static const struct of_device_id mxc_isi_of_match[] = {

-- 
2.34.1


