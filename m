Return-Path: <linux-media+bounces-65652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5WLBKC46PWoxzggAu9opvQ
	(envelope-from <linux-media+bounces-65652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:24:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EF96C699A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:24:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=rYZtnnD3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65652-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65652-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 116133151A3F
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 14:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8199735E1BF;
	Thu, 25 Jun 2026 14:18:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E551E369D4F;
	Thu, 25 Jun 2026 14:17:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782397083; cv=fail; b=mpugGCRRnNBKbXgPD535sxStSJRDvji7BFRkjkOnC5ocj//1f6ohY1hMVZwXxSfGh8Zc2QmI/w8OA1tg2xdqs808zLYkN8jcyFLpSgmZOPIMGPpaNrx0EdUdlV0I/1EUZeUlStk7FOF8n77CsTYbdljZWAvH/fEmzwl8vSrXXkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782397083; c=relaxed/simple;
	bh=Z1gwy2LcKdr4aG8G7ffWQDBrM//VneGzCS2sqx/Cu2U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TgUZUCSqefJ43OnKOSy1BVNwUq8LqNRBVQAuohFSR50S0H07yne1YMCUnO++nIelCT6UmldcYbaOGQm+Qo+QtiY9h6vulf8OzujR2RJ2qbFlbmpSV165nhOYuBoZ/YeB5hq651htr4jghFTErOz/gcHyCPxUfbkkUSnN4XxpxDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rYZtnnD3; arc=fail smtp.client-ip=52.101.70.59
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uX+PuP/OMvmmfwGKMOQhiptPsMKmijaqn6XcVoK/V/TCa5wRC9/EbTgeg0z/mnUOF3f6qiAReFASiyGKxySe0uFEPbIeDKXoFIyHw5i+n+9dT3HcPvYMf+fMLFmVxNQ25HW5ikru0rfpMfUANULFch0GAVo+vqnwYUJIUV/WBwUVou2QSuHxHskOiDNIs7W8P6K0hAyrshHB0m4fgQKw8+4MLkfHrBJ2bzCLY6aYyby9fo9Mr8hpv+I1PLfk+H247L1MohMSHvcaBwtnk3TwfV3FO5UMhjMhJCp/zUGHZgEDE6LOWjOYxz8fsGya7Xxr9FumCY1iCrbwS7ylH5xDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaFfjrr6GCQ6jp0uGNrIUHggC5BKy9L0FwI/YvmNIxA=;
 b=j9fOthqfnWS/Oi0KEgsT4u363blDvfamqDM80EUpUlEmzWI2Y5+O5qn1LSYeUfbw/e9Vz9BiHvvVQTt8DVdUVCHh+ejlflv4GsPJEJM64b8THg024Um+zm+OUGwFEZUMTXj2D85uAs50eUqQMO/WejuDOQ7c+6F6v4pETMtZg1aZvdwBdmTUWJGQqGWnDfWVOCR+aUOR8ZJ57mNN1G3zpei5LB21wSKJCELIonZcgKwoG787jyRz7vGlb9HxbE6NiIt/dEY9vp9rSmb2doQ+SryrNwIKnHlnfEvK6PyxnfU2g74yOUTPyYzZsJYvwtkY99ct2IUkti1+8nQw88BhKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaFfjrr6GCQ6jp0uGNrIUHggC5BKy9L0FwI/YvmNIxA=;
 b=rYZtnnD310G0OCERLOj4sMOksV/B2z/2K9M2p4Kk9dMpKgIHaYlOchNUN4X2ZlyqL4lqJquYyryR2MOd1Yi/HHnsm2ivPk3sAP4xwABOv4S6PU4nCiI/5kO9HOovCWLglHZWVthfFCLWt14SNB4ZFGLAf5ND5PIovucoo4ZtRNVB9RMDsrFw2V6Zpgi9ItyxeFn5LSOw+TEguBg603cDJBpX9Ndb/jOopQeeP2CAwp5ZS6cWpuzMmjPHjH4EBacAe8jK2LaZFcrLFPwTTAds2K0254/tAXXQP6o/C2KgEjXFpyNHYT+DBmNReooPmvxeBbhLw9FmqOoQOFeMnLh/ZQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11888.eurprd04.prod.outlook.com (2603:10a6:102:519::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 14:17:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 14:17:52 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 25 Jun 2026 10:17:24 -0400
Subject: [PATCH v3 4/4] media: qcom: camss: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-fw_scoped-v3-4-ffd0868e498d@nxp.com>
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
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782397047; l=1717;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1os6b1kdl7EAyNpVa2cPbVNiZX1xeIeg94MY7Wu5uWg=;
 b=2Jjo/DBY/GNjrtTv/GIEQ3YgihUpV7YBJm+v+xJ+EnJPPHGC9Ia4bELMzIWWKPs0HzoBfhYZo
 gBFjToLTAj3DzLD+LPBYvd9/xwF+h0MKkiludqJJ2+MrEslMAmJ3JEM
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7PR18CA0009.namprd18.prod.outlook.com
 (2603:10b6:806:f3::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11888:EE_
X-MS-Office365-Filtering-Correlation-Id: f85f10aa-467d-4cfb-6a88-08ded2c48adb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|19092799006|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 THXvpIJWUMBJI/qPI4X7WnIbk/3aFTtCIFBbuJANrw3ZYTOtMhZUw8v3UcIlcBYF/M2lXl30yYzORcUm/HA039KnIJRLPzgidkhTwSAQJgqDl1dog4YEEKQnPVG9q7+vCMIyTrnnuGKOzqq3cxQOgjhpgFWC6RdrVrHx3bOQLyn57T6780RcBoi4R5X92i1fBjdHLfKxmwn4nf+l45o2yoh43MSOKjJXwQlEQdjeMmv/FAMLXFz240nndrP0eOtnnbhCzsc/3dneJlzZTDlwUis3ZrtlY9KjcHOa0gLZ2kDmOS/Sjc6M4C9IkrIEMhmuKW9tOXU7JyeJtZLietDff1jXc0hQO+9XNg3/otfDS8PurY3d0UjuLnsl4sgtk4j1StOMnFTLNccgqQlMlJRdt7y1+FtQUk9qr192nX057m1g3ntKb3RJvbvpNXPWmTqfODBjQ0xgCWzq1GcYFn2+JXNDCkrK0FTAthH6qcIRoh2Iu7R7zzKr8Et6qBYoJjExZA3xZJ5g2u30/4uDtLn9zG8prFRbB0+YWJiUDCMj72gQdFLTiCqHz6gqkkoVD2lHSn0IdSD3T4b/6CGCxbH2Padu5XKt521OWEgJ3nn5Y2gKy8j4ghRCJadkBCdQ7QvS1wchwKiSNGedCZvBRsExQ/0T2K8YJWHd4KPzKyCsBqD1sOKuyl/XMqtY7affivmYrSsMILtAPMFxsHS32JnHgw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WkFqYVJ1d1lUTVNRa3RSMjJ3OXROM0lUMnNVWVNCUHpqMVR0ekxRVG53dGpa?=
 =?utf-8?B?WFJaR3dmUSsxRW9IYnpyRkpwQkdFL0ZWY2lPNnV0L2lyWUdTV2RQdXMySkhx?=
 =?utf-8?B?SFZ0M3BrR1lkazJIay90QitDRnpTYWRHNWltWXFHblRzK0M2VjFmeXIwWHFj?=
 =?utf-8?B?SjVkcUtPWlkzU2QxcDlQek8vdnV5ZXRIYUhMdm9uTEZPeWRMQUhTTktUbHRu?=
 =?utf-8?B?bllHOVJLUUVNWjJvUC8zNU80UVZkaVNrWmF1cnkxeFVyeFhoeDFJMDd0V0pQ?=
 =?utf-8?B?NGtUNVV0RXBPcHI1eDZFTGNob0F2Nm1jQjk3ZnBBRm5pZS9QeFRmNW4veFpD?=
 =?utf-8?B?Q3dYdWVMRS9IVUhZZ2FHN2Y5N0tjcnR2ZC9abDVYT1o3RUpBM3IxOW41SWZN?=
 =?utf-8?B?NVdkUENOQ2RHQzRnaFdwRWFNY05SYU8reEpJZFJ4b0ZhTm4reXpDUENBQjFJ?=
 =?utf-8?B?SWprdkZ6TUErVlhGdzFBRWtUaDBlOFM1OHNGQUxBOTZvR0hEc0xsUHBoUHR1?=
 =?utf-8?B?V2RXVUc0SnV6OTZaV1NiY21WT0VqNmhHa0hqQndoWitPZlF0cHZ3djBVUHM2?=
 =?utf-8?B?S0ZlNStoZUhOMGw5LzJpSkZZOHBYZ0RyYUxYMlRrSDhTWWsrdVFabWJweFVS?=
 =?utf-8?B?emZVRHRlcEtTcnFDMUFDckgrVTNpaGJRZ2ZkdTZWdGJCTkxKQk96NGYyRmRD?=
 =?utf-8?B?eWlJdFpPKzJUVmlReVhUcThXMXp4ZlpNLzZMTk55OS81NHUrK2ozR3dVM2ZG?=
 =?utf-8?B?WmEremllOG1yZ2NCUCtSa011VFZrR3lpdFNvRjgxQTE4SUx0WVdqbHVieFgy?=
 =?utf-8?B?YkJJNzJCbUlOMS9zM1dwT2xYTXlxbkMvU3BMWDc0NEd1V3JxbitnU1I4QzdW?=
 =?utf-8?B?MzVpdktuUEFRZmNhd3ZXR0hPcnlKNWNJN0xoV2k0K1ZxMXlzaVVwajM0dnBv?=
 =?utf-8?B?U3ZxVGF5MTJDNVRnYXVOYmJwVHhpN2grcU9JWEwweE9HSCtrNmw1cDJCdmpw?=
 =?utf-8?B?dDZveG9LY0g3U0FFZDc3bUZrQUFVeFU0L2FqNytwMWRwOW9iWjVoYmdrQTUx?=
 =?utf-8?B?SUJxZkgzQlJBb1NIT3dkK2k5T3VZSzBZQjNLWXQ5MFNiVWFORXhBYUd2K21x?=
 =?utf-8?B?NDIyMmdqMzFxWXVNbzE0ZGFmWWlyT1R4VFh4S2VZRXZ2cGkxVHRUN0tRMXdH?=
 =?utf-8?B?WWlyM3hsbW1kMENXcEJZVHduckRmYXlwNkMweVovZkJ2ZCtIUlk1blk5b2dz?=
 =?utf-8?B?akk5NXd3eDMzaE41UTZ4K1QxWWk0ZXhuSUxhOVRtZHFTTk8ycFJmcE5JRkNj?=
 =?utf-8?B?RUN0VHg5VGZBRE1ad0V0bHI5K1ZrY0RyU2VFWjh5R05uNThkK2VxdGZIQ1dk?=
 =?utf-8?B?dWVKbjJGWlFvUGdiNHV4NndSdWthb1MxQStRT1A3VlBJd2s0bFMxNCthQmRh?=
 =?utf-8?B?U1RXTGlxSWR6ZTVLY3BEUkNNSkFqVWc0cnNRK1c4YkFOV0lEdFpoUHRvWHli?=
 =?utf-8?B?V2xTb0hDRFlFQnd3eThqN2tQV0YrNXpiZ29iekpHTDRYQzl0VEd1T3ZQZ2NX?=
 =?utf-8?B?Q2sySFM0akpLR244Z2JjYjFuN3JvZnJBSXQ0QmR4WWE5eVgxSTJBMXB4WUdI?=
 =?utf-8?B?UXdYTlcrYWdVUGdtdlJldXc4Mm9NYTlOQ2liV0pYaHNUM1ZYM1diR0U4K3Iz?=
 =?utf-8?B?SDBIYkdNMTFHOVJteFlPVEEvbHBIdWNVbWVUdFgyMzBuaTErd0haYmxhOXRt?=
 =?utf-8?B?K2NJajF4V0ZjeE1tYTlnRFoyZW9mdzFJQzJqNjQxV1ZVYy9jT3lpcW9mQXhG?=
 =?utf-8?B?YytKaEVmZ0pOLzNsM3h2bnZMT2Y4TUFrVzBnb3Fma3M4U2xQeXkxTXhPTy9m?=
 =?utf-8?B?Tjl6Z1E5MHpSbVBLSGIrSXlQbUYvNTlQeHp2NVMyTnVTV0dhbUZiM1IvMGtQ?=
 =?utf-8?B?QmNkcXlzYWFqL1p5S0JwU1hQWmJqZk9RVms0NVFyazhEcDlFRkNiMGVhQ1Yy?=
 =?utf-8?B?S01wcVg4dkJxMlY3NE5ZYU5xTFBYbXp2b3JtVnprbGhKR1BxNnd6WXRORmlI?=
 =?utf-8?B?RTFkaWdFTjllbVl4SDgyaEtaNElrVCt1eVpFZ3N4K1d1dTJpT1lnUE9PWjk1?=
 =?utf-8?B?d0VOWmJJZVBHK3RyMGQvY0F5U0pxM2tyRGFkWFY0NmxJVGx2a0xOa0Y4aDZn?=
 =?utf-8?B?aEgrazlram16YXhzdVM0WUd0ajZvNU1KQTYyelpEVmI3eTBBZzNodHpZRFdH?=
 =?utf-8?B?YjZrSHlQYjgvUFZsNzM3VEYxUDRNTk5tYzJ6MXRpcERFWUNQTFRaNk9mSGY3?=
 =?utf-8?B?bnBVaEIxQ2ZkanhxVTRHQ3VRQjZaSENrZXhzUG1NVG5rUllJVC96b21lSGpi?=
 =?utf-8?Q?Euapa+apWQ656ASJoDzIZJ9UyAQubrOyxUjro?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f85f10aa-467d-4cfb-6a88-08ded2c48adb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 14:17:51.9921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJ2/YV5nvKCgL+5PI1VxX1QGlCOmCbZawWVADGC1VfOY6juEOYCF6iT5O3bJPEHQWqzGIRwa+un+YL9KvBmijQTTRU8P5y9nRd9oJUTsD3LsJxOwlD0GeCj8AmZRKz6b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11888
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,m:laurent.pinchart+renesas@ideasonboard.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65652-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,ideasonboard.com:email,qualcomm.com:email,oss.nxp.com:from_mime,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0EF96C699A

From: Frank Li <Frank.Li@nxp.com>

Use fwnode_graph_for_each_endpoint_scoped() to simplify code.

No functional changes.

Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- fix typo simplify
- collect andy, gouniou and loic's review tags
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7..23f3cc30a15a5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct device *dev,
 static int camss_parse_ports(struct camss *camss)
 {
 	struct device *dev = camss->dev;
-	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	int ret;
 
-	fwnode_graph_for_each_endpoint(fwnode, ep) {
+	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
 		struct camss_async_subdev *csd;
 
 		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
 						      typeof(*csd));
-		if (IS_ERR(csd)) {
-			ret = PTR_ERR(csd);
-			goto err_cleanup;
-		}
+		if (IS_ERR(csd))
+			return PTR_ERR(csd);
 
 		ret = camss_parse_endpoint_node(dev, ep, csd);
 		if (ret < 0)
-			goto err_cleanup;
+			return ret;
 	}
 
 	return 0;
-
-err_cleanup:
-	fwnode_handle_put(ep);
-
-	return ret;
 }
 
 /*

-- 
2.43.0


