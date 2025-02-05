Return-Path: <linux-media+bounces-25695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E6EA2973C
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A7E51886979
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CBE205AB8;
	Wed,  5 Feb 2025 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fhQHVUlC"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F9B200B9C;
	Wed,  5 Feb 2025 17:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775990; cv=fail; b=tWs/99ZCAWToTEGuzPY+WoTWtzKPLjGCL+VXC244ORnOxGr57vyntHNnM1DZF4rws0cPW/y0/967zYlzS4ulFDg3V1ABm4TxxVjWX9SQJVt6JlIpJ2pWfxEUn0+W+rkt4MlNuTc+t3V8JTZMFSISe3DvD61jR24lKy4sunpDnlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775990; c=relaxed/simple;
	bh=ugMwhXKf0Tm63RDlxILbeXMabykj2jL37Gb3VZTUv8c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QNkq2yO7RRwBlz8G3DYVRaGlK0VXzMcSlEXBkFtgYWQcEd/3bkRftT4NcG3SresTuh2J4fNbQFDYeQjegDZvooGJviwC3HHgPfkCXI0Uj3wFWjmsnHYALR+oAOT50g1/CPHwpoiw8uWG5IfAa/nmPEdIfiHeZx+YwW6f6RaIZRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fhQHVUlC; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4PdFzkRJFsWr1G49WOhhfbiP6gd+ZiyH9H1kCgR+nP8U0cM04FfDJRTRMvmC+tZc7btH4rJo2uFbFD4K6H6wq7BB+fzvn55vI3bvFirzY5tUEAiea0aDtysDg5bT1JYLRzIcRtYExik/cHz1BjoBYrDNCVm1gg94ZFLrOxLZ8Wwt7/hXi8x8iScQLRjHDfzwocSdoCRRRoIHb9lEnWZZ5mtVhhbUfTz0ZtYUVDq3p7g+9vWF2GAGG4sAun5A2WiVMs0z+VE/3FnRhsxMY+YoyhNHgYPdmMKWKcbzbpV79cSzRRT+PqpJFxL/er4uK7YHs8/ClFEX3+54zYHO8wCzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4ChoGAN47AD/3d+866xQrb0UnyYmFctyuF69EYy2nQ=;
 b=VAYnTVee0bPiXAq4d6dpePcHuIwq3OazvBdGOBJCxf7VCDpvzBhCRtlOqQ+uPi9HJp/vDaosVJ/gWN+XCtvpkh7FjSM3Ay2qCe2xNiBvIsS1hoOeGFVZ82IWY6rbOypAO7DhU8L8aMruAgolyNyL3IAZF/AgCq/2qm8/ZWEW1C9KBgdfkIXv++m/+2VnuAjRuHSRFrT1HPM0MJquh/E6VVUq3bhfidMVrLs4RChUoc3Ym7i/9hfTo+UG6YM67FdhhuNOyqs5Bhcp/3kuqEAK9z1QLO+gZT8d01ZKfXIfYyUsAqvuO8OWKyhaG94Lj8acA5gA0B/skTOumbji2iQacw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4ChoGAN47AD/3d+866xQrb0UnyYmFctyuF69EYy2nQ=;
 b=fhQHVUlCHJVPY5vo2UZaR4A+aFTa5iM2709NDObfyEt+Zkl44iaTx3pOFWSDJ86QMs8lXvEOgkW4DlrxNM76CCrt38qS70kJmSY9n5EswcXqUda6DHvel6LaOkTwVs9+meApYUsJIBJnlOegPCd628uKveBfLUbKxKaNr1r++bUrBPu3xrLWIwS/1iuQtn6e+HnLCUpRapNzaKdFoI5fMoDiQ07OKuwjnCRT6vXGDBLdBsKtzF5ksxAemmY1vAnIa2urFO82bVJu445kEksqfQn8PFBVltvgL2buxPFgpPzV6FW7bQxbB3raD55k3T5gNKOUIyCfQzTlFW0PboDvhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 17:19:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:19:45 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:19 -0500
Subject: [PATCH v2 10/14] media: imx8mq-mipi-csi2: Add support for i.MX8QXP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-10-731a3edf2744@nxp.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
In-Reply-To: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=3332;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ugMwhXKf0Tm63RDlxILbeXMabykj2jL37Gb3VZTUv8c=;
 b=A71NdOmnSeeXjn61Yb5oFp1gUW2MVRIrF9dalVaBQAX7uZ2TfMmjJX9bszv+4uEUUtNpV1Xge
 44ojZQriteMAb2JZhWRYNj5lJS4kGQtsquqVMpsk+kE31aQHBztIL5H
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: d3444c67-1b34-4495-3a99-08dd46094948
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YytpemRVWWVvN1JwSjQ5QW9VejNkY1V5d2lrWU93bms3NTdUVUJqQVY1M1JF?=
 =?utf-8?B?NFd3Vk82aERqNzFDbEdvN1VKZkltODl5QU1YZTNKYnVUeDJUakpoRDFuQ1Jk?=
 =?utf-8?B?RUR6bWhxUWM2djdJc092WUVLdFVwK3MwTWtmUUtWZng3cHk2RXgxTzBJSEVE?=
 =?utf-8?B?SDdsb1JsU0JiUzEzQStwWm9sYm01YURld2JMMUx0Q2FGUVh0SmFhNnI0bE5Q?=
 =?utf-8?B?eXZVRU9ORklWMEdlZ2YraFJmNU04bExydjVmZEJxMHpuMTlLeFRVNWxQNEI5?=
 =?utf-8?B?dXFRRjl4UURXWnRMNWorUGZ1S0ZSVzJwNGRUR0RPcXdVczVsbGdWMng5emc0?=
 =?utf-8?B?TWJkMXpqTlhvMkw0OUFrSTgzakNDSWVHdnFwUzBQVEdaK1pXWDMybGhiTFBK?=
 =?utf-8?B?STY5cDAwRkZ5OC8wSHIyTDN0bHpSM3Q2ZFdWeGRQNzhORElGemVMSW1aKzZ5?=
 =?utf-8?B?QlNtRElvY2lsMFI0TEZYZUMwQmsyd2lSS0RsaktZTXVlTXBJQnZtSnEvZVdS?=
 =?utf-8?B?Q0ZSalhsSGZILy9GamNjZjQ5RVNQOGxqMGp2ejdiL3d5S1VoNjV4cU5pN1NQ?=
 =?utf-8?B?ejdlUDBtSy9CQ0t3TnBqZmZOVDVSYkpxWWRybTFhMlhRUVZkWnM1WEE1Vlh0?=
 =?utf-8?B?ZHZuZGFVYzV6ZW5peDVLakJpWVZpc2NiSkExUFE1NElIY2JLMEhQSzZSSGZW?=
 =?utf-8?B?Ly9uSTdlemJNQk9NaG10Mi8rSjU1U3ZCcHd5UCtTaWU1MG9TYXJpVlNUZWEw?=
 =?utf-8?B?Qm1wQVczT05IUGE2Q0NvR0owbm1IVytKU21qSVF3Rm91VW5sRW95bTJ2Ym96?=
 =?utf-8?B?aTNWNVJMVjlFY2h0KzdqNHkvbHJQVmZXaDc5RTg4TTVqV3pPY1RQQlFOVDlu?=
 =?utf-8?B?OEhxOGhIL0l6UWR1dmVpYjUxYlhuL1BIUnVDRjFtV0Y1cEpOUFVFZ2NMMXQz?=
 =?utf-8?B?N0VxdUVabHBSTGMxanFwWUFHVWk3LzZ5WWNqQUZMeVpzYVg0azBBaVpqTGc1?=
 =?utf-8?B?R3JaUm82ME12Y1BVT1I0VEdvT0t3WTcvQWJtMzVKakFCR1pRYXkyVUlEU012?=
 =?utf-8?B?VGJPLzNoNGx4WHdXWmw0VFNZUnZrT08yK01TRXZFYTZVdzhha0FEZ1pKZUhh?=
 =?utf-8?B?WEJEM2pGWFVxK1Y3aVczbWlqZlduMStqeXUwZTBPWHJyNDBFSUJVYUN2amtH?=
 =?utf-8?B?YnBndjNNam5xNThRV0Mxc2orbE9lU2Qwemk1eXFlRFFxaTZjY0RDbDYvSnFu?=
 =?utf-8?B?NEVPZUNGNUN3LzNJLy9QOTljbndxeEVCVE5YcXRrUVFJR0dMZGpnZUNuMHRM?=
 =?utf-8?B?QzdYMkpBSU9wTVBibGpjcytNaEg2UGJCajVSdVlqZjlwM1Yrem8yLzRCYXNj?=
 =?utf-8?B?ZnEvSWdzc2llTjU4WTg5ZVYyblNmS3l6RHJxdTZlYUNXaEhvT3FQMG1GV2VD?=
 =?utf-8?B?Y2N3ZnBsb0Izek81M0VOQ0QzQndmbndSUzlPT1JBMEdQaGFEc0NpbjlsOEFh?=
 =?utf-8?B?MEZzRmNnVWxrQzFpY3BqUUlCNzhzWXNRUEx2bkM0OG5jeDdoZDFEVzJ0TjND?=
 =?utf-8?B?RFpzWmlEU290WkZQUjd4VkxESkpBYUk2RitCWDlpcFBpTExocWhwNmtEWDRI?=
 =?utf-8?B?QkNzY0FET2xINWxsRjV2R2tVdXd0ZCtSaXRndThCRWVxOWdlK0tqMmZOZ3N5?=
 =?utf-8?B?TlFTQWFsaExJQmVNOURlQVBVY1dWY2NIQld5YkNjSFpSaVNqc0VYYldqeXcw?=
 =?utf-8?B?cldoaGE3MEszd3ZpYUY1UkwyaGlZZ25vc093aTdoWkFicXdMM1R3ZWdXUWRV?=
 =?utf-8?B?aHlYemNHSFZ5cURDanF3V1UzalJTNGJ3ZC9seHphREpCSUlPSy9reWJJenIy?=
 =?utf-8?B?enJpNDBTaFJDcXgwS3hES2ZRSG1uWVM2b0UrdVA1MzRzdTNnbXRnVXJWaWpV?=
 =?utf-8?B?VUw5V2x2RlR4MzJoOEtBR21BUU43NjdpY0pEaExVQjg2dFROT3gzSlZmeStz?=
 =?utf-8?B?ZFdGUk13RnZRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OGtrNklCMkRyUUJ5TjYvK0d0VzYrQ2wrVEVnWEtEbHQvelpJQ1hEWUJvUVk1?=
 =?utf-8?B?VVM0WHVEbDdBaTQ3OU9vNmhnQkZKaUpYeUc0TE1hd0dKR0svczBiZ3h3U2J4?=
 =?utf-8?B?ZG8zd2FjVU9wNkhzZS9DSzlCUWtLYnlQVkdycGVicTBQck5CaW9SMjUxaUFq?=
 =?utf-8?B?amRlclhmMHlmMXk4RzNQNW9lQVpvWEY0UWNoblpuL2RMNGhBTkJ0aXMzZ1RW?=
 =?utf-8?B?VmExTGRXUXNPUHlrZUl4dk9oNHZwVERFVDVPT0UyZUd6NnpJamVsZkJIUjcr?=
 =?utf-8?B?blB0aVM4b0RBQ1ZYUWJOVnUxVmVUblZYVS9sa0VuOVh1WWt5TDNRTnJTMTVa?=
 =?utf-8?B?Mk5pQ09UZkdKeXpTMHowRHFoV0ZPVG5yMW1QQXA2STdFWmJ4SFhBdi9jbkNx?=
 =?utf-8?B?UWJuSXF1QUtNWGtvdnNobGZTbmpTRE1aM01VUjhzVWdRUEtRNEhsMlBBSVo1?=
 =?utf-8?B?RDNTd01SazJZaCtRRVM1V255UkM1eGVSajNwNU5qc2lXODljSkR0b3JHSGNl?=
 =?utf-8?B?dHBKVy9zUDhBTkVDZDgxUXdUdmZwMWM1QTJhS2l0SUNBdXIwejdrSUovQ2Zh?=
 =?utf-8?B?MVIycm1wSUo2N3M2OGpzcDBZdDU2eis2SWlOOU9KSWVWZHJIcWtMMjVjMDhC?=
 =?utf-8?B?NWkzc29adTdFU3ExdDkxZDdsV3RwbElpaTE3cElGay9jUk0rT1RqYnFUYWtN?=
 =?utf-8?B?akNFQ2xpRTl2ZXYrV0g2V2VaMnJQM0FPaWx3R1FEcFc5TUNlZ1drTmJjbE53?=
 =?utf-8?B?VFdPWVR2V2V2VUxiSVUxdzZWM1lFOUp0YzdQOFJOb0psK0cvV1Bnc2pnNjFj?=
 =?utf-8?B?cG9Xa3BVT25hRFV6SzFFaTVuWUZ4c3U1N1IxU2IvRjFxS1FlZTBJSGhPZUFT?=
 =?utf-8?B?bW1rTnJ6L29EVFQxSXR1UGJjUWhKY1BnK25pOE4wODFiQXFicmFtZ3BCOWNB?=
 =?utf-8?B?U1BTT1dzN1NtbDhWVUh2bWF4ZURrN2ExYUVwQmRYV2NSSFpuWDV6ajJUbkRM?=
 =?utf-8?B?VlZxcVVYT0JEclF6bytxVndwWEtmVDUvaWJpNU9yYmdFTWdSeXczS285Q3JT?=
 =?utf-8?B?T0cwR0JKOWFqaFpYaTg1Si9SVDIxRGVSdG93a09hdmFPSm41VVFQcXNGOHZL?=
 =?utf-8?B?dUpHOTZWbnZEaUtSbzZjdmg0REhINVBDTHJJd3VTWW5QZnRXRTc1eWdTNEdD?=
 =?utf-8?B?U1dMZGp4WDh5TDVBU2U2bUVUZlBsWmVGMGlMRkY5WEFFUlRzSzdhTnpaYy90?=
 =?utf-8?B?dDRTUElYOE0za3hKN20xUmNsbXA1N3Q4eWtUbTh2Y0owUFNacXZac2JPdklD?=
 =?utf-8?B?TlU2ZnpSaXdNTE1WUlBSY09EYXRzZC9LK1oxekx6WW9HL0diMGRXaVpJMEdH?=
 =?utf-8?B?Q1pOaVVVeG5LalhySVN5dkhrMlJQRkFnbXgxWnVIa1BkNjBTSFNYaTd5Sm5M?=
 =?utf-8?B?Y0lZdWlBWHdGNEJSeHM3blg3WEF5dnJIcTlRRDlFYkhXaTVBNUxraDBoZEg5?=
 =?utf-8?B?UGpFdExoVVowZStrMGZRYkxPRUYxNXJUMkRUdW5GWlkwekdQQWxUMkNPTWYv?=
 =?utf-8?B?TnQ0N1A2MlNnN0pzK2VhYlB3VmVvMnNueGtXejZkN3B3VloxcDNUdWlFRzFT?=
 =?utf-8?B?RFU2b243ZXJ4WWRxQThlczRuTGVYUlozY3hObStycEdzS1Rsa0N0eWplbGI2?=
 =?utf-8?B?RjVhTEdPMmFQVXF6L1ZSTVpEY2dFWUFWVTdRMmlnVy8vZlFuNGZIU08wK3Y4?=
 =?utf-8?B?RkprZlN5ZWh1dk9HYWlWQThXdjRRN05WdDVTSGFUZUhPSnIyQkEzZXRlQ2Rt?=
 =?utf-8?B?aTRMUVpLU0FWRXkvUk1pQ045eHZtUkp2WDNiRlJmREJZUlJkWmtlK090QUc3?=
 =?utf-8?B?TjJUSzRmeTQ1REdWdExQalRqOUNzMDV1UGw4Zy9USmtlS0E0ZmJXSWNGeHA5?=
 =?utf-8?B?OXNKRkQzMEw1UnYxQWRjMkt4aCs0N2pwNjhzQXR1KzhQUGNvd3l1VVo4NCtu?=
 =?utf-8?B?TWh4QU55WnJNWFY3WGZwTmdYZTJJdFJPbUNad2pnVlhWMzlnbjU0VDZ3MTJr?=
 =?utf-8?B?a0ExaXViajgralQrZnYvNlJ0L0c5aUdUb25lVXJWQnp3M1BsWTkyN3FUOGpW?=
 =?utf-8?Q?D7bGIyHroKRadad5MTkLugV6a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3444c67-1b34-4495-3a99-08dd46094948
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:19:45.5612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwqHvNAuyLH9VOS4cHGSFC8CbTrFfFp1Kg3lFwYaq+3eICtsYB6+a6WyvkweDA8Rv4bYL5cWziDPApI+HsMntQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348

Add support for the common PHY interface to enable and disable the MIPI CSI
PHY. This is required for platforms like i.MX8QXP, which rely on the PHY
driver for powering the MIPI CSI PHY on and off.

Add reset delay for i.MX8QXP. It needs a delay after toggle reset.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- change 8QM go 8QXP, 8QM will failback to 8QXP to keep consisense with
phy drivers
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 46 +++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index b5eae56d92f49..5da9dd0f1eec6 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -89,6 +90,8 @@ struct imx8mq_plat_data {
 	const char *name;
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
+	bool use_phydrv: 1;
+	int reset_delay;
 };
 
 /*
@@ -125,6 +128,7 @@ struct csi_state {
 	u32 state;
 
 	struct regmap *phy_gpr;
+	struct phy *phy;
 	u8 phy_gpr_reg;
 
 	struct icc_path			*icc_path;
@@ -169,6 +173,37 @@ static const struct imx8mq_plat_data imx8mq_data = {
 	.enable = imx8mq_gpr_enable,
 };
 
+/* -----------------------------------------------------------------------------
+ * Use common PHY interface
+ */
+static int imx8_phy_enable(struct csi_state *state, u32 hs_settle)
+{
+	int ret;
+
+	ret = phy_set_speed(state->phy, hs_settle);
+	if (ret)
+		return ret;
+
+	ret = phy_power_on(state->phy);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void imx8_phy_disable(struct csi_state *state)
+{
+	phy_power_off(state->phy);
+}
+
+static const struct imx8mq_plat_data imx8qxp_data = {
+	.name = "i.MX8QXP",
+	.enable = imx8_phy_enable,
+	.disable = imx8_phy_disable,
+	.use_phydrv = 1,
+	.reset_delay = 10000,
+};
+
 static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -273,6 +308,8 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 		return ret;
 	}
 
+	fsleep(state->pdata->reset_delay);
+
 	return 0;
 }
 
@@ -860,6 +897,14 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 		return PTR_ERR(state->rst);
 	}
 
+	if (state->pdata->use_phydrv) {
+		state->phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
+		if (IS_ERR(state->phy))
+			return dev_err_probe(dev, PTR_ERR(state->phy), "Can't get mipi phy\n");
+
+		return 0;
+	}
+
 	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
 					 ARRAY_SIZE(out_val));
 	if (ret) {
@@ -979,6 +1024,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
+	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


