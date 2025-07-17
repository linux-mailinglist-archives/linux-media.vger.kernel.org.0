Return-Path: <linux-media+bounces-37926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CD0B08307
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 04:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B6411C23A8B
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 02:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926971DF968;
	Thu, 17 Jul 2025 02:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qhVffOmn"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00B9194C96;
	Thu, 17 Jul 2025 02:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752720094; cv=fail; b=KutrKjvOKkqHSPKu+ADP8Kt4SQ7fu+2SZqU0rwkkUmlikaVrTPw3OFLVtY28kf9zQShoL5fUeAGdyDfRS/FSZ11JvZGNAqmWjsYNLLs1u+fHYNfg8bkZAZo8Z//Z33WGB1GIbSca9kbSRbk2Biht89bB0QBvBIe0c6jEnw09Vyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752720094; c=relaxed/simple;
	bh=swXJ49mWXf4j1F5Ec1D/97rMYfDiu1u1q3eKRypWvyE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BqtaWkte0UqJa/8s9tMnDsWwXCelXX6L3ZgLJ/X1RlkNDIMmSZp/JdaD+CcCM0GVRO3jY3e7xrqN+Ctk8NYxujh2/zjqZ9BO68XBz0uAi8hMmxLGEcD/Ykfc1J0kav0dNBlAjts5B89Mh8zjyIVV9cQ0NlPlTZM0yhEphxtvYCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qhVffOmn; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXYNZh0ksk1o9i2GVY6BDkcy1iIGHeTrq9JOqOvri7acilAR6MHlHuFlC/7w0jP+m5LZ3u5oh2EKIw5a0MbUMFDCuF09iyuPYV1Ar4tmj1Je/3JKi8Gg7ifvq8QqWApfiu6tURyuOl4lXfBc23TqoauJUB+tPDp538jfwX1w2tqmqrLZjW/7LhebpuooPEOdZVeOo7IAnovlgMLFMScrX4fKLPUwkUUFEWQkGERiaxW4YAvqACDcWwqDL8rjfhSSqztLDGzzx8aITT+HzaQWIoUnaCP/b/037LBjPBveoZnIzVTNsrVMqzz5wEgLt/j96sB5QE9m1VSuxFTnD61sBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RVjVpoy5HBT/nOoQszgrCMLTWNs/VIR+AaoyzsWCTM=;
 b=IJUkV/YgDb11gEcXgw19c1gyUBXfiGVPspEgijsd//EcyJLC0d3wFgpHE7r+y6WmCeas374cJasCR4XzKAI3hf2qyswwOHzS1GNTwRQDF31UyRriv2bLMDddKZsZbjdxBvSGln6002uuFD9HKFtrQjpxSgnFWj5PDKNEOa6XvAM7450kQuHyqF2BRlD/L1DSNgP4G7WhaIcIe8LFVe6m0EZis4RlujL2atC9e+R9kU+2CIFiWML7CggdQDcUzfoq+wGHeQ64Z0Ltmt4CxB0xFuFuZmYGACNu4uW9WprMne9/H+JsVf1BUzMBmQ5gl+05bB3FYdJfCKveBOU2zi+t2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RVjVpoy5HBT/nOoQszgrCMLTWNs/VIR+AaoyzsWCTM=;
 b=qhVffOmnWYjkH+tO6jigR65MnD+Ewl9eBhaq6dWmcmo7mxVVIF2vMngZTMgP2LmQhp0W1nm9qHIftHD8lgI6Uvo+HioZtMqQuw7bCgxbG6Npn7CvqWDmLrlOqtfLYWuJpjn1YDsAd5gfycydn96VZ4W0puZznI8wafxGcfC19/G17IIe1qDeUEJkOKRoZgBip5AaiF9Zgsdw+nojqlBZ6Iyo/wQltqihJcAWLBaOfNrmgsbj6ohnQsJfUBcMugQhUaQQAWj5HW4p1A3qZn+jdAr2+f/sW3zr5sJESKMbuMf8rCswfmv+9KUxcaAqhNOF/6zTmef4CvpyHUjUQOl7IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI2PR04MB10092.eurprd04.prod.outlook.com (2603:10a6:800:22f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Thu, 17 Jul
 2025 02:41:28 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%2]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 02:41:28 +0000
From: guoniu.zhou@oss.nxp.com
To: laurent.pinchart@ideasonboard.com,
	rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: nxp: imx8-isi: Add suspend/resume support for ISI mem2mem
Date: Thu, 17 Jul 2025 10:43:54 +0800
Message-Id: <20250717024353.1811576-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::19) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI2PR04MB10092:EE_
X-MS-Office365-Filtering-Correlation-Id: d336216e-3ac6-4185-f2cc-08ddc4db6ddf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?elF1WmZpM0tRL1JKVnN0eFNuUjY5NEJONkFuajVIcVVhcTlxZWpDOWV4YUpC?=
 =?utf-8?B?RnlMSkc0T2VrTHlKQ1NnemczT3gxM0NzVnU4bUtLQzl4aVNOdUNEdTVlRFMz?=
 =?utf-8?B?OU1kMlVWRWJJT3MyQlgvWkxQOFE2NjB5RDlUU3pTdDZaWmp0SDNCaU94UGNY?=
 =?utf-8?B?NC9Xc1VVT0RaWUV0QzM5SWk5cEZsZWlCdDI0cno1TndpZlNSQ2U2dTNQeDFX?=
 =?utf-8?B?aUNCM0ttaGphYS9oNjBTaWdoWDhoZy9EcU5ob0hVcnBsMW0rYWhDcDRNNEs3?=
 =?utf-8?B?Y0w1VG1YY0hNNUZHTmNDMkx0VkJJK0pYTE4yQWl1WG5sZ0U5SXY2TEhiWCtG?=
 =?utf-8?B?T0tMYS8rRytUVVRyanFjT1ZpenRCdDJCbzd5UThPamNTdktLVEdKaVBDbWpF?=
 =?utf-8?B?VDE5dkJxQkRBT3lyVVlVTVZTdjRVUUZYQnk3ZC9weFREUTNnMG9HSi9oaWVM?=
 =?utf-8?B?VDNNc1F3OGtlMHFBL0hNeTVKYmR5WFJIRG1raGtXQm9rVmVzQm5qMUQ5ZFM0?=
 =?utf-8?B?d0JOaDhrbUVQQ1BJMU40Wnl4VngydlVvbTNiKzBXTkpFL3paT3FRb3U4RTZj?=
 =?utf-8?B?cGJTM29uOGN2RU1Ja3dPdVE2RGYwSm5MWW1zbDlJK1o3WXN1SnlWNFI0UXdh?=
 =?utf-8?B?d2RYNy8wMUM3UldsKzR1SGhhOXdEYkhwZzVvUk1ISjVMZS8reWhQSmwyaGRN?=
 =?utf-8?B?U2ZueVpEVytJekpMSFJmNktJZGp4NERLTUNNNXJOM2FXZmZWc205WGxiR2Rm?=
 =?utf-8?B?MXh6TkhsdEZxamZ6eWFpb0RNTFVWRGw5TGpUck5rQXlZc3hCVWVDc1R5M3NE?=
 =?utf-8?B?MGFyT21rVDhrdVhhU3JCbE9YeDY3QmdHbHBIZmJEekFtRXBPRTNwUEFwTTF0?=
 =?utf-8?B?UWVRUDJFRExXa0ZJcVRtdlJja2NMU25RTmxadXNTVHJiSmhjVGVPZFFiTnYr?=
 =?utf-8?B?c0lqVm9RQ2FmRTg0eDBVRTdYSElkN3ZtWW90SzZXOHM1azhMYkpZTFVVRlQy?=
 =?utf-8?B?QjR0OW10RTQwOCtXM3hRSmZLZjNCYkI1LzRkT2p6M1l3Um9xSWY4S1N3em5D?=
 =?utf-8?B?YnpkSHpueDd3RWVQdnlLQngzaWZFd0txZC9iV0tDbHVsUjFMYTRVTVhFVkYy?=
 =?utf-8?B?RW9pOWdpQStmSVQ5RVVFbjJSNm14eTlOVk9EQ0l4K2F1WHVtNDJlaG1XdzYr?=
 =?utf-8?B?WUhidEVkVVh4bSt1NzZUZlZUYTg0a001R1h1OXdYTDUxaS9qOE9jT0pveUpJ?=
 =?utf-8?B?bHM2dVRsUS8xQUpFaWVUSWI2RkZnUXpabnVMNi9wV3F6MTRNSDF1aFVHcUJv?=
 =?utf-8?B?ek55Y2dRczBacUp6eEh3OFhqVUxyZzVvYmpEalNpYlEvc21qdWp3bFhNc2E1?=
 =?utf-8?B?M2E5eWVxbXVLbWxqa3lETW1KN3Urd0ZwTHlCT0VzRXF5ZWhhTW5VVUFnejg3?=
 =?utf-8?B?aHZJNkVVMFlFS0NiN2ZBY3FLcUJSQlEvMjg1ZUliNVFnamxkVTVZbms2YlZF?=
 =?utf-8?B?SjQxVWNaSGozalNsMFpWc0RNYjZoUlo0OElXM1lobDZ3OHFyQWNHTXU0c05V?=
 =?utf-8?B?YnR5Ujd2YmxoUDZ2ejVNQ3Y3RHR6eGU1OUtvblBJaDNvQld1cUFQakNnTmZa?=
 =?utf-8?B?Qml3TUhvQUtNNzJkdVJJUk9zQkt4QS9ENDJpdGdGdnZTUExsT2diWjFkcTZ4?=
 =?utf-8?B?WVpxbGQxdHlCK2VWYm5TMFU2S3VVeEtGV0k2MlVvZVY1TG5qSnhkZjhkNFRL?=
 =?utf-8?B?aU5udzBHSTFRcUEyeE5YUlcxMVEvcVlaNU1abnpIRjFSZWRJbTNEcnJPOWlv?=
 =?utf-8?B?RlQ3RjhFQWlwTnJYdTNWZWZlV1E5Z1VFanBCU1ZiOFJsUXFXZDNrcG5pWEc1?=
 =?utf-8?B?VW9mQXRlQ0xBRWJTRTJiVUNSQ1lxVUlvNDBNcDZXT2V6Qzl4MER2L3FNcnBN?=
 =?utf-8?B?VHVhd1RuWlptdGlYZWxUVUk5aVFDSWtTalVhRUVqWHFTRzlEZEgxWkJjZFhG?=
 =?utf-8?B?UEYyNUNvSUpBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?LzdzZ2JCNnFnWHZibDVTZXFwYnFSQkY0ZW9oL0JLU21tYm9HWTFuanN4ZUlw?=
 =?utf-8?B?cmRJRi9CaVU4RWZYc3lCUEdpQ2NLbGE2VHpkY2VOR0pEckYxUzhYaHN2bnRR?=
 =?utf-8?B?Ti9WRVd2eEhkUDE2M0d6ZXNPWmtUbjE2YTk3UFBtOTlRRjhvU2FpT0xRVi9O?=
 =?utf-8?B?Sm9iZ1pmMWNYOXFPeHZEbFhqQjJTSFVDS2RZT1FZQ0hGbGpJb3REdTE3K21x?=
 =?utf-8?B?Q0NyREkycmpQTk9NbUg1TnA3UkxqNWEzbncwOWoyZmRaS09iUW1RRzBqdUFI?=
 =?utf-8?B?ZFFmc3ArRW1RVTRnYzU1bUhOTGZKbTJZa1BPSjNUUHBOZVVLWGNTbFYwREsx?=
 =?utf-8?B?WnVWOVRBQ1NRSVhFVTJhSHV0YWJWOU4wc3BYUGM0SHdKYVhUV05CalcxL3d4?=
 =?utf-8?B?amYwVE1jNE1iYVNKektEMGsrcHNSeGFDc0pXd3lTa0tRZ3VVak1oU2c1UWY0?=
 =?utf-8?B?S1pOWEpKbExoWmlyRmJvQlBYU3ZMSEhoLzZ1T3I0dE55a3A3bkNVeVpsNjRt?=
 =?utf-8?B?b0ZwWDFzU2NnTFFvb25qSWV3K05NdkJZeXFESEVFeDJFSXRXdHZzbUx2VmJm?=
 =?utf-8?B?Y29sTXRucGFHYXZNRlRRZkRGVEdLcFpHVkFNbDlzZHdnNHpSelRLYnZyZHNO?=
 =?utf-8?B?Si9FYlg1dXNPejR3eS9JSS9Hc0JJdE43SUhKNGdJRU9pVThweklzTmE3MnRP?=
 =?utf-8?B?TWltOE9USUtRVktTc2ZPWDhBYXJjeWFBcW9sUVR6NkYzeERQSjY4aUFiTFpU?=
 =?utf-8?B?KzdUSFA2WTBZclJMR1dCN2xQU0piM1AzamJlOHE1R2pmZkIwVlZTd0o0aW1H?=
 =?utf-8?B?NktqRU1oWWxrUDNzU2RhengyTExQQlkzckEzTnNrODdZMEw5dGpmRC9tWkx4?=
 =?utf-8?B?bElkRmFUcEovSTJXYS9KUHhIWm0vOVV2SEltOEhsLzJsR0hHRWRZbG1yc2sr?=
 =?utf-8?B?QnRNYUF6T3ZnOTByWjZXdTVBeTBvR1dvQ0g0NzhzNUJDSUcvQldMS0h0dzNC?=
 =?utf-8?B?Nkp5ekhDOWdEVnd3WVdvQmllMDBjSjJuUjg5VGpHVUNNT2RQZ1VPTXdIWjJ1?=
 =?utf-8?B?VEtEaWRPUjZzejNLcElCZGZuVFVlajhNcmxxOURaWUNNV2t2Q2kwSGN6VDFp?=
 =?utf-8?B?U3JFODRTMjljYW5yUVRZNFhZaEMzTjNKbUNzeWxGd29qV2JidE9RaWtEZnQ2?=
 =?utf-8?B?dEUrR1o0bWZ4a3VvR1ZYbWY3NFNwdzlWaG5Gd0ttMFpDd0xUTXEzYStWWlB4?=
 =?utf-8?B?WnRidG9oZEtVNHFCbnkwSmkybjdTZmZ0bThCNEd0T0ZIZVlSMmwrNEFSSFJZ?=
 =?utf-8?B?RGZ4UHpBYkRhZlFEY1FqTFJ6L3lua2l3Ums5VlFqSjdMM3BIMTlJcEo3Nmsw?=
 =?utf-8?B?Rnh2NUVoUmF5bnBjRXU5cXBiR0k2MzlSUjlvMVZjeXJrLzRybElENjlyWGdi?=
 =?utf-8?B?K2hPOU1LYml3b0I2MFRDUDEzY2t6QkNidE5Hc0ZvM2VzR05TNi91VWtLRlY4?=
 =?utf-8?B?OTBpQllucXFkcFN2T1BkZ2RDdnhmNjY2MFIvbzMxVmxjRjdQRVo5UFFzTy96?=
 =?utf-8?B?MndOcXRNRlV5OE1TdHV2V00zR1hZOENxNkd0RzN6MUN2cXZreVRjMW81NVIx?=
 =?utf-8?B?LzdSV2ZhdEljUk13NldCd1FpNU1LeDd1QjIxSFhMUDJzY25EVlJnbHVhSDlT?=
 =?utf-8?B?d0t5cTR4ZEpjcGQ0aXJZRElzaDhRSGhwamtVTWdaWjB3emhMcGhHK1VBWmIz?=
 =?utf-8?B?akVFNFRKaDl1S2EzZDNzNjFsSXVXbmVHeXJZL1M5Wk1sZnZpemx3Yy9na3Vr?=
 =?utf-8?B?T3FMOU9qVnpWY25raEdMeXNOdlo2L0xoNU1BMkRkOXhoSGpPZllOTGdUMnpV?=
 =?utf-8?B?L0dKVE9lR3diK0hxd2g0dmZaSjU1R3RaL2JLZksvanQxc0hLeUtINlo1YjdC?=
 =?utf-8?B?bFg3RHhoR2t3Z1RFMmo4UENaQTlmRlBOMXpNRjF2M1A4T3RsdGJVOHlHUUZM?=
 =?utf-8?B?V2ZsWnhVaDZ0VnpjNXRicmRXaDBIcFI5Y0tDdm9iRTkyVzgwWnZYTkVja1VZ?=
 =?utf-8?B?V0R0QnA4VjU2cENHL0ZTQ1Vuamd4Skp2WlRHazYvdjN5RlpMTTVpQW5Fb1Vp?=
 =?utf-8?Q?lQklrM09wsswulD+EtkzlPPaa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d336216e-3ac6-4185-f2cc-08ddc4db6ddf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 02:41:28.1035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcLaZBw88A46V/t31cN/36iAkPTBjxzdLv6tXZusIqyjzO2C0B9VE6XdBTjuwDKnRSHLnwtVqWwRp1yesZBVRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10092

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Add suspend/resume support for ISI when work at memory to memory mode.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-core.c     |  8 ++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h     | 11 +++++
 .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 48 +++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 981648a03113..6eef45302e6c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -372,6 +372,7 @@ static int mxc_isi_pm_suspend(struct device *dev)
 		struct mxc_isi_pipe *pipe = &isi->pipes[i];
 
 		mxc_isi_video_suspend(pipe);
+		mxc_isi_m2m_suspend(pipe);
 	}
 
 	return pm_runtime_force_suspend(dev);
@@ -401,6 +402,13 @@ static int mxc_isi_pm_resume(struct device *dev)
 			 */
 			err = ret;
 		}
+
+		ret = mxc_isi_m2m_resume(pipe);
+		if (ret) {
+			dev_err(dev, "Failed to resume ISI%u (%d) for m2m\n", i,
+				ret);
+			err = ret;
+		}
 	}
 
 	return err;
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 206995bedca4..b979b79b5525 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -343,6 +343,8 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
 #ifdef CONFIG_VIDEO_IMX8_ISI_M2M
 int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev);
 int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi);
+void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe);
+int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe);
 #else
 static inline int mxc_isi_m2m_register(struct mxc_isi_dev *isi,
 				       struct v4l2_device *v4l2_dev)
@@ -353,6 +355,15 @@ static inline int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
 {
 	return 0;
 }
+
+static inline void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe)
+{
+}
+
+static inline int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe)
+{
+	return 0;
+}
 #endif
 
 int mxc_isi_channel_acquire(struct mxc_isi_pipe *pipe,
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 22e49d3a1287..fe9d85335b6c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -732,6 +732,54 @@ static const struct v4l2_file_operations mxc_isi_m2m_fops = {
 	.mmap		= v4l2_m2m_fop_mmap,
 };
 
+/* -----------------------------------------------------------------------------
+ * Suspend & resume
+ */
+
+void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_m2m *m2m = &pipe->isi->m2m;
+	struct mxc_isi_m2m_ctx *ctx = m2m->last_ctx;
+
+	/*
+	 * Check pipe for ISI memory to memory since only
+	 * channel 0 support this feature.
+	 */
+	if (m2m->pipe != pipe || m2m->usage_count == 0)
+		return;
+
+	v4l2_m2m_suspend(m2m->m2m_dev);
+
+	if (ctx->chained)
+		mxc_isi_channel_unchain(pipe);
+
+	mxc_isi_channel_disable(pipe);
+	mxc_isi_channel_put(pipe);
+}
+
+int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_m2m *m2m = &pipe->isi->m2m;
+	struct mxc_isi_m2m_ctx *ctx = m2m->last_ctx;
+
+	/*
+	 * Check pipe for ISI memory to memory since only
+	 * channel 0 support this feature.
+	 */
+	if (m2m->pipe != pipe || m2m->usage_count == 0)
+		return 0;
+
+	mxc_isi_channel_get(pipe);
+
+	if (ctx->chained)
+		mxc_isi_channel_chain(pipe, false);
+
+	m2m->last_ctx = NULL;
+	v4l2_m2m_resume(m2m->m2m_dev);
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * Registration
  */
-- 
2.34.1


