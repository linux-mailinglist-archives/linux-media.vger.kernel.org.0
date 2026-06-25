Return-Path: <linux-media+bounces-65651-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NltII+A5PWoLzggAu9opvQ
	(envelope-from <linux-media+bounces-65651-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:23:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5246C696A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:23:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=OZ7QBkaa;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65651-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65651-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F041330EB036
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 14:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8140236827E;
	Thu, 25 Jun 2026 14:18:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C537936D503;
	Thu, 25 Jun 2026 14:17:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782397079; cv=fail; b=h73DhY38xxbf4SSMvIfkt0klI8XIRVnmr8ynKTWozWeQ69nHGjBw3HtmmE45oE6Y3vJjm0aLIT7bSVVi4DVs8uRcM1nttxLBJwEP4deJyqcvGBKOX/q26F0WxgTF4GIMOXZy0iPgXW/n4b9DSGzjKBQiveq2L8FuGGiIPkRz3wQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782397079; c=relaxed/simple;
	bh=Jm0pIsoKoFdqdhHf83bzfUcC8tyRS6cFRTT0/n6Ww08=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Sg1sj9XY0ehKfBTz0fcfqVOEIwpSSHEIARevH+b05qZHGwOACrjXkev5Ud2n/kmV3cNX+e9m07pNsj8g6mq+bntPhY4iqUT0cPVD9ItqaFsabjGCU5fytcYYyY3bkT/R9c2V5GYHZyWm5arx2tLbvF48WXc/2nBA7VLPmpn2my0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OZ7QBkaa; arc=fail smtp.client-ip=52.101.70.59
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3XXIzGm/C1cdAjl8C1B2MWTUesjXxh5pV9kDew/QjFuCch5yeBO4slrJGBUxNGLq4+Apik1f7zsnb3Goi/r6y9wzGjCJ74az5vT8v7aCmUZsrLKpU49GSN6d1Cqzb1VdyjoBY74v/LTN+V7ZutQEqmNRyeojV7dnApQly95nZQ66QNDZGx5pgsd6VVC6/0GarjFBw1sRiriThHULC8MBA04nNremyeq6Rv05zhFbuA6R2MlHgBQ4z3U0LA6v8NBZhADOym37jEtFeqIUapic8xrbneH3f7We09pQ51bI5LbFKSdeLP49BZVcVv6L6X3L59bHB/MoUyYkNECyrhX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2e/zy6SS5Z/gycpKzq1JxoSoj5Gv4hourj2mkfr3QGY=;
 b=VjQGxVrVeGsYlExOVvkc/bQxS8PCbsGnUBnuhz+9rzzK7bMo2S3Ulk4TXr3jpGpQInP5Lzqo/eIpzH8f2ZyQ0VcuYxsJqWnSSpIAROtbdJyTRLgHXQFxrLvrb1KkdoGiwD89UzIGV29d0YTF2oU/GNuPIgmrV+utRGBvQm0nVAdsP1Gx6Q07qNZcVE4CrHr+pdPUac/QE7KM0GRoOfMdco2KXmmbCsjpRJYo3sDax7HracazgqsqmnBTj4gSQ6FburTFAUH6/LNp2mzp3py0CIG34SJvkpQqg7aD/vKxG7Lpd33vUtwZdwbycCQ/1kaPOKoZVzH3A/WXtpFBys84Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e/zy6SS5Z/gycpKzq1JxoSoj5Gv4hourj2mkfr3QGY=;
 b=OZ7QBkaauYIq8j1aWLU90HsZcRaVbULb9GfqwQdS5K8IKK4ceuImhcle3UP4B5LpUQ0ZFnexs19JojqZ0dYgTVsZbN5L9Gi0kmcRzm2yn8OAHYqqh2g/O2B4DaJ2hVnnfJTGjmCNzwtzl4mGjkBtBijO9Wi4rIf2Ao+zlgpdw/uECcEl9qSsxuL3fjGkreKfBTgNRhI+9WZG9CjiUk0n/uSVxCZp9+DZt48aDrFNLiCLcHqsINciR81TLKMMpwbMEXxYkGqj6BOKBIgrA+8B8T7gUvH90vcqxDopaMH4TjY6n8pp8TgtG9ykdH0RtzTU0vFxMZkwuRHdmlk6rXXFqw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11888.eurprd04.prod.outlook.com (2603:10a6:102:519::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 14:17:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 14:17:47 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 25 Jun 2026 10:17:23 -0400
Subject: [PATCH v3 3/4] media: rkisp1: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-fw_scoped-v3-3-ffd0868e498d@nxp.com>
References: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
In-Reply-To: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782397047; l=1676;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=0i59WvoECstj54olJDnIyDqqwQWlnCf2Cjsfj6kMiJk=;
 b=roLKQxulE1JqtOFh9Iaq6ltIGRODjABZ4gUcLgL2bCLcacWR0Jd3eqkuaOg7XdjVwlaK6ufgF
 W94vG59V44ZCQsPhXuiw91EpKeOCXjC0q+XS19aVRKrb3CZBrVzrOmQ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0098.namprd11.prod.outlook.com
 (2603:10b6:806:d1::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11888:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac5b99a-3240-47a9-2b81-08ded2c48813
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|19092799006|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 sHeK8SceAu26s3bAN8tb9edhqOen/VnhJSZVZLrsNIdbaBPlgcCQql25DKuOq55jBbFdJP+KWPtN8mAVJqz5cgRZ5YLp1O4TIERp2x7R4uP9oC8xRlzw7MqAGxde+jaZx6N5nI/fAtlfX89QN6Ze79MqF2PCfXX6+Fo7i3YIhVvigEL2OiJtg+grh/pjcqx0igqgasfVtpu8xrPxrHDkSG05SRRzYzmvI/g6tfTwS8zFLdrMjN7igf6Xwv9ehb2bgRxlG8BDEC72t4WGZOxBI33ygPAZ+51b16c7UYyn9KnhC1gAnxnQXAu7yZEVNOWtJUo2/9qU5+UjD8ziv1Zmzk5+L8mp9bVToh8fwPKD8Xmvh90GjFQO2Gf3fo9YdjPdqvHAmNW2ec/rhX89dLs5JFdRpCTjn/tbUbvfZ/0stVvm4Az/euAu6PlKLmttWjzGcQE3GLeLQmaVsvGQcH0URzzbhdPZl6gy8IX3wqDS3rQRJi+P9qdJfd7P8ERjnfBceSQCQeoy5oOr6x9gt5Os5ZuJ8IkhGKbWE1B+jLqjwMrhYgirHGlTE7Rrv/jWFOUzKHnEOS8J+5784LG3SMGcGJUOp/P+7fi0M/qOXSplDcR6oehk2ZJAa4H5OXRngfVhl3lrDYa2twYPoWraUBSPzmVaD3//h3nIgAErk66wkJFl97JJAfFfTXbDtiNTVUuRyNGyW17ZoEVWOiHJmiNl/A==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QW45c3p5cktLWWV2dzhMejMyK1dmQXJPUjZIbjBTZDFpVTEvbUVnWWtmU1pk?=
 =?utf-8?B?ZS9YeGdjeDFPS3ZrejN3ZnBGbHZYQ1NLY0ZTUzQwYndPcDlSNGdBeFBPVjJq?=
 =?utf-8?B?QU1iQndobEtxc1IxeFY5SU5TZzcrSW5IWkcvbWJjaGIzUnRBcWRuS09rUEcv?=
 =?utf-8?B?NnFpMEh5NnBZR1BuYVdOeWZmYnE1UDk5ZFBmSW5XRTRSZ0s0K2JWd0hHTUtE?=
 =?utf-8?B?MGlNYWc5SjBNMkZJM3lJNDU5MDFLVVYwMGhJcm5aeHRybUpJaW9VZkJ5bTJO?=
 =?utf-8?B?b00rZkdQY2dzVzFGTXlQbGllRWxLcWpXUmMweURiSWRxVGh6L2hDeWJJQ01j?=
 =?utf-8?B?azZZclNzdExIYVZrWVdWeGdaODdRWnluNHBjb0NYZUt5YnpsNktoRklyV2Rh?=
 =?utf-8?B?NFRWYzYwaWNmVkUxN3F5MWtoL1RsbjJlcDk0UXVvVVlRWmNTSElncmU5Vjkw?=
 =?utf-8?B?KzB4d3B3S1FQcXhpNUtMVXROT1ljSW1ib2ZZMGlzeWdrWFcwRUptcW9uT055?=
 =?utf-8?B?YlcwY21reWFHSzlSZDFhSlhRaWNUbWlsalpxeGtrWTVOeVVhamtrMndxV0V0?=
 =?utf-8?B?OUd4UjZvZG1saFd6UU9rTjA3Rmt0Tm1EOVByL3E5aTR5dEQrQmgybzE0dFpi?=
 =?utf-8?B?TytWbzNSNVZzT3lzb2UxUEppRVlhYTNXTGdnMUhxVGpEWXp0WU1zL2t2Rk0y?=
 =?utf-8?B?dEdEdG10cEdPTVJWRVpYYWFhUG00YUtyQ1FRWVlsZGV2dGVKMExrOWNHbU5Z?=
 =?utf-8?B?UzBMVE1NNWFEMUhraXdmNE5yZUNRVnZWMXFtMUpSRFpOdmV3N1NPRGovUTlP?=
 =?utf-8?B?OFM1dm1iQ0FjeXFDSGJFQ0t0UXF2dkpaN0tGZUZESDk4RlMzaUZxWE50VDdw?=
 =?utf-8?B?N3dnN0c5UStMcHBvSjVrZ293dUR2ZGYwbDZZcVZNSmdybGpNZXF0bUFRQkJD?=
 =?utf-8?B?L3pVaUwzdDlJNnRQMFFMbU1uOFBUdEt1QkJMRFlJUWRqZm5ock9OeDgxY09W?=
 =?utf-8?B?NkpqWjgwUjNTR001dEVoVGVJbXdhOElrZEZwbTNiNFdNa2hPeFB2V0ZLUlVY?=
 =?utf-8?B?ZnJLb1EzaVVvd0Q5eEd4Ym16Y1pEaVJhZGhvdTVQeVZVb080YzBpOU52TWpo?=
 =?utf-8?B?bkRJNnJkaUxCdXd2bmFlZXJhS3V0Z0NnYStNTlNGOUN1YUlqWTdjcXBPbXdS?=
 =?utf-8?B?Q1JDWWFQa0x0QTZrMGpsSUxmRlVDUUNuZVBxY2lFTEtUMlQ5SUtpY1hFOVFh?=
 =?utf-8?B?RXhvWUpnQ1hWVmVnY3BVMUkrUVN0NTVlQVM2MXhvZE9aVEhNWUV1Rnd1RENX?=
 =?utf-8?B?Wm1pQlNLTUd4cDlrMjJwcndJNU15elFwMW1aR2VCOGZOeTE1Rlkva0Y0SGJR?=
 =?utf-8?B?Ri9ZZTR3UHBxZHNSaHVUQVh5WE40NUdHUTNhdHJHQ3lPZDhBS1JsVVcxQXNp?=
 =?utf-8?B?R2w4OGY0Z2VFbitaOXZPbHZwQURQWjgwdFdBc2xldm9WNkxTbnlxS1JYbEc4?=
 =?utf-8?B?VXRYNmR3RHFHVmFjOU9qS3JmV3ArS1BIdGFFNXlxMm80a1JPQ2ozRlIxVWVz?=
 =?utf-8?B?dDB3NWRmMTBSdjVuTlVhQS9Va21VOG03aFh1Y0wyeFVwcFBWRUt2djR3SXdh?=
 =?utf-8?B?RzhicXVtSVFsaWtra25LUm1BSkJhWWMxVTVCV2psMm91L3crY2lPNXY0T1NB?=
 =?utf-8?B?RnNQZnRMS0NNdlRCZGlzaWx6a1hIZXJpa2ZOb1VjSHNXWWQzcnNITEZsUG5h?=
 =?utf-8?B?OE1ZU3YwQ0FRQ1ZIRzZNZUR2K3VBMzJyWllPRUxSbXVNcmlWRkpCbUhhRHRI?=
 =?utf-8?B?WkxaRnRRbE9qOGdMdmMxM25jU3ZTdHBKZHZ6cWgzS3VZdzRGSnJHc2Z6K01F?=
 =?utf-8?B?eWJsVlpPaGRtZ3JaNUVQbVozRXo4eGNaZ3BYK0d4SWoxTzJ6T1lWRExtZWVh?=
 =?utf-8?B?Z29ybjB0NXgxUFR1OE1EaGwrRkRFV2piRWxOZzEvZ1BoeTM4blkyYTdtMnhC?=
 =?utf-8?B?ajZtelhFbjdLOHZnUXhSS2lKdWFWUmxvNW56b0FzV295dnp5MEd4T1JpSkpL?=
 =?utf-8?B?VWNwOTZiY3BVRjJpdkkyanpvVERkOE1nbDNHQU9nbkhsaXdJNFRuMzF4Rm1l?=
 =?utf-8?B?L3JTelN5aE1YbUJwZmJKSmFnNDZqb2M2Z2x0MGprWVRRem9zd2d1cFZPNWFX?=
 =?utf-8?B?SkR0NnRvTi8vbkpxdHdQbnR4clVadGZPQmpXL0d6YTV3MlA5R3RkcDJzNGRu?=
 =?utf-8?B?UEQ4ak91MzYyV0pwaU1ya0JMSTdKeDFGTUxUcExnUzVldzh1dWp4OTVkd0VK?=
 =?utf-8?B?UWhoTTNncUNMUUM3QzVGUjZVeldBeStVZnRkSXV3REhqRGlVUWp1bVhhMDhY?=
 =?utf-8?Q?2NKs5smAT4vXXIqpbwkVsPEfhKVGShO+MlF+0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac5b99a-3240-47a9-2b81-08ded2c48813
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 14:17:47.3300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SudXJSAbuAuLWXskKR8D5bfus4aM1IhmR7qoByxzBWgroGlahyo33ueZHVBtD/yFMy0GyJQha0LZQcxEnkHYARHrLIQkYqWMw+UVkYlj5wPFXEBNmkhvvDjFj9boSS5f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11888
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:laurent.pinchart+renesas@ideasonboard.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65651-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,ideasonboard.com:email,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED5246C696A

From: Frank Li <Frank.Li@nxp.com>

Use fwnode_graph_for_each_endpoint_scoped() to simplify code.

No functional changes.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Andy: Keep original code because too much break. and I am working on more
generally solution, so the whole function can be replaced.
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 1791c02a40ae1..f90e01301943c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -187,7 +187,6 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 {
 	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
 	struct fwnode_handle *fwnode = dev_fwnode(rkisp1->dev);
-	struct fwnode_handle *ep;
 	unsigned int index = 0;
 	int ret = 0;
 
@@ -195,7 +194,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 
 	ntf->ops = &rkisp1_subdev_notifier_ops;
 
-	fwnode_graph_for_each_endpoint(fwnode, ep) {
+	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
 		struct fwnode_handle *port;
 		struct v4l2_fwnode_endpoint vep = { };
 		struct rkisp1_sensor_async *rk_asd;
@@ -286,7 +285,6 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 	}
 
 	if (ret) {
-		fwnode_handle_put(ep);
 		v4l2_async_nf_cleanup(ntf);
 		return ret;
 	}

-- 
2.43.0


