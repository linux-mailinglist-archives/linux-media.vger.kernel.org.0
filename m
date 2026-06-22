Return-Path: <linux-media+bounces-65342-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sYEGGAj6OGqIkwcAu9opvQ
	(envelope-from <linux-media+bounces-65342-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:02:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8406AE078
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:01:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=igS0ptEh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65342-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65342-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2709630512A8
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 08:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9947393DF1;
	Mon, 22 Jun 2026 08:58:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE1C395AF6;
	Mon, 22 Jun 2026 08:58:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118724; cv=fail; b=pUebBWkGgaVn3Npqm12nUNXQYe2r9TxMp4RVNv1bVqKuRBMNXC3dyTP53Aoz6OQ4nxUtMW0F14+FPyJgFg1wclomr9D7El2GSl0dvtt/TJ4H9rGuBU/gFfHJK/jO4mxfkXDvtwWS5rZHpuKsFRzgeC1gQa6Y2Nb+nfS6MIBaHqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118724; c=relaxed/simple;
	bh=zZnsBlQORplLuHLwMEovSvr79Y9QwHnSe4tKen3JyZU=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=N+eXhnebU03m5TnmudxQPdSvlbU1HtDA2DfMPTAt2pthvlgYqyE7uHVe9NoZ+LisrnJeNnYNmMMpdBp6aVxjGHwJ/J9tecx+a6wxuGHaKaa0D79wooYHROTfqCx+b3VaEOtofidLj/mQXs2rgXQfxiOFOWOqjrexd3E9/PR7c8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=igS0ptEh; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDuCy6PLzobyYH1bnnqN6L4xhFsi8F8qERo2uYshEliMHVMztrrtOfDmt9bUf2K0GQlS3+/Blaz/H0hDPe4A5DSrZn/fjmWkdrgR84nFZBJk8KU/i3Xs9RuB+MM90XDmbtbut45HX6cRpx98k++f4UB5VaA1QtMeLADTCNjIFHX2tKiAlgHGSOOXVl6/UTDwLMg0MQ2MyNeqH75xwkS1FMhbX3HYDBA9egXRf2yXUCUM60nJWq60GY+nQmY8RtnBRJX+l44GhH94WkdiHJEv0TS933HA08dsSh68ciCPaCeY2bzvN55JNGgW+FIced4WMCaN1rGJwUOJdcMNF1DKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrjP+6rUs/7WNlUngpuXPLnG8t+Rbzmg4B1A++kqJiQ=;
 b=MQe4pwmwbeYI5c2ux/ucyt9IfYIOEgaWRSXCpRhaRBmMxR+duPQFmzrFipbPAbtpKdlIM/q8jU+K+36Kuma9xKhWKRenYQjMAAALjv6ZEOnp12DEdQJF7xmWLeopjGj3D0gYg4y/e5FtCh7JmWu6GHaLaE1r6HpaWigfW3moKC3soqV03Frhcjssr1P+wbzpCgFg8VSwgTbgas3O9hDrS3iAGPAMxG8Hh0X1UVZuvRB9r/DszuPiuIpwQ0hMqgg7xEkyuN2/k5+skvwyPFxrOb8q6dzj9AKgBpp2TE+Xrdx1RrPrS8hHQI1a22FdvyCof62rcQpUIOdXaqw/Fx1D6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrjP+6rUs/7WNlUngpuXPLnG8t+Rbzmg4B1A++kqJiQ=;
 b=igS0ptEhV3Zv/AQfKQUQLlFfLFE704/DL/FQ6itCjNvp+pfwDDwEE+OfQiFfBJROnhoY8OBANQD184cCWSItXzgQPdJdybIJBJ6ASo3DoFmFufD0CdSNj3nDIEmjxqTuYSpW7CpDKhNNl11pR6zFAgW8/+1R2mNJZQqhbNNM5Ys+vJ+MgChBqc/fqTH5V09SIeTz6pYHeKVIOJchGRoIfzYHxbEmZGUkS7ed74osYe+pvE/Jb6D3ez4aCK0glbqgAJwDr4cmaxN2d575AzunsHzmzPjXt2V2NM5kQo0FkM1yj9KmKa4r/n63i6hOHdVvfhcw3YSmUumZEdBxcdzwoQ==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PA2PR04MB10088.eurprd04.prod.outlook.com (2603:10a6:102:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 08:58:37 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 08:58:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 8/8] arm64: dts: imx8qxp-mek: add parallel ov5640
 camera support
From: guoniu.zhou@oss.nxp.com
To: Frank.Li@oss.nxp.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260617-imx8qxp_pcam-v5-8-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-8-7fa6c8e7fba7@nxp.com>
Date: Mon, 22 Jun 2026 17:01:14 +0800
Message-Id: <178211887405.4030874.10964807720406733748.b4-review@b4>
X-Mailer: b4 0.15-dev-0e760
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782118896; l=3599;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=zZnsBlQORplLuHLwMEovSvr79Y9QwHnSe4tKen3JyZU=;
 b=mKwyTBf3GZg19H5ozDqUYeMZxIIA1HFHHA6pDVubdUmfX3cr6MZBBwAYv2moZ5l9pDVFfjmU4
 0xiT0QVE6eiDfXKLpB/L6gidWLbA2DGV8n4sut9AzP8OV9Miw5m0mCJ
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::17) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PA2PR04MB10088:EE_
X-MS-Office365-Filtering-Correlation-Id: 016e4230-8f92-4cf7-ebc7-08ded03c7244
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|19092799006|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
 d24BFKteNUVK1EXdtyUWuno7x8zHtryspmWCYk8anveVpgsaC6ucOMdbiFt7k8f12OK407QRNkpx4sRtGVZvxt0kKg3lGH8nz2YlCNcN3llxG8W+JDMaFTYaIPbMd7YorFXlCa1s/gTztTuEZItLooNKI+xQYcwIom1etBN+juKjt4FOuIFlSESVOBTuYs7U6r/0fO8BCqRedWOWTS3Saxxqbv+GX/jHTe3wXCWbW9K53BKq8k10su0a/UV32RRNOQJpmUjohDmjxFgN5eFyW2cKGFxx8qkYwiU4itVliTYb2cE3LJz2iZfTgPjo9I7EyCyh6vOMCU1faojTX2H92VZlSnT4D6O4Had5yDcREKs0GfVFXTypMbOmeO4CODa1bjEVHePWUXk0uyQy3dTauTScqpJOYCQ4Lyqgb8Upgyb7FbXUloQ7/ZLGDpE63fw8zEkVxY8JVYwMZInao81PyTSFEqURL74ORQ6/QRc9HVIwooxOt+xoy38mWrTod5e6moc5mXum/VDAnfLWIsATWUL8yD6m9bZIL2kROWTLuxT27bv9+IOhCH47p1wkOfQRQ8JOAQq7mJ/NQ93ULLb+QTtvcVcz+Wuxi+OU/uCoZYRIl1zSWXZrndkxUU6vjXjOPLOR+ux18I3TTfjV/uK6sK6DeKs1IzVWe7AeEU4jueg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(19092799006)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dDVDVS8zcnpOMU5aVllDQ0xidWIza2YvWmFVK1lZY21hUDIzdzR2TGFWaGRG?=
 =?utf-8?B?OGpmUVVlU3BydHVrakVWemhUREN3VGIyWGNSbXA0KzJJd2RQQjFkZXFhT1Nn?=
 =?utf-8?B?WTVoaXN6UHlBN1FZU01wQk9FdE5CMUQvSXpSQ3B4b1pqOUFKUW9XR1QrcHQ5?=
 =?utf-8?B?Q0I1dEVNVDFDYyszUitzZnB0SVg5SFZqS0xRWmIzNnJSRVJKVXlhVFJEZERq?=
 =?utf-8?B?RHVQaXQ5cmk4VSsrUEt4ajZueUtaeHdlNjBrZUlyeXNzaWE0VXpFbHFBSVdU?=
 =?utf-8?B?cXZSMEE5Sk1SMDhxOFk1RWdwRFZxRnZCNGI2U2RsYU9RM0owVzRkWCtydnQ1?=
 =?utf-8?B?U3JHdytjM2tTakpkaC95VnBUN05Ca2ljeVRYNnlTZnF6REljMmlGdGVCRS9w?=
 =?utf-8?B?cXFINWdMMDNVRG9EUHdrQW9lZC9EZEdvR2FZVk0xc2Z0Q0pBbVZGV0M3L0ht?=
 =?utf-8?B?S0daTHErMGY0QjB4WWhsbmQ0Uit3dHFyYUtFSjdNY3JxaTRobDdjTUJVNXAz?=
 =?utf-8?B?Q3E5YzZPR1ZjRFExRzNIcGNiaGx1dEk3bFVoK0xqbkNibHlIZHIyT3dJTXlP?=
 =?utf-8?B?SmxiQWQ4a0tGZnU1Q1BrODg1N2Z3T1kwVk1EdmZJMHVuRVVZeGswQ1RZdDlF?=
 =?utf-8?B?T3FkOHVReFBoaTdqV3lVQkM4RHErZ1RqUkNONi9LdU5jZEY4VUhzY1pGcWVO?=
 =?utf-8?B?RUl0Nm4zUEYzZzg1ZzR1WisrZTVyaDNGRnNFOFA0NlVIYUdNcTRLSzlsZWVN?=
 =?utf-8?B?OHJtQlA2VS93Y3lGb1RFZGlLL1NvVnlSZ21ycS8wRTRNU0Q5cFRUZmNUbVNL?=
 =?utf-8?B?bzZsdFVEOENiVDB3Mi9qU1ZPeTVpNXhUOVNMZnBvZzZPdE1WTER3d3IyNm81?=
 =?utf-8?B?aUh1amhzTUxuN0VrVlVIcWMyQTlHYzlLakxEWC9LbWNiMXgrK0ZvcERPbmlB?=
 =?utf-8?B?TGYzOTJ1d0Q0QSsvcUhWTkFjNDIvcURLN3hOMEVoMlVETGo4b3Axa1ZoclZ1?=
 =?utf-8?B?eXFVamIrU3J2RDVJdG9KWWRLMHM3ckI4bFJNVHh1TEx1Tk9wVVJlYTNTY3hC?=
 =?utf-8?B?NXMxZ29rYXA0WFVzMEFkSnA1NXpFRGpOc2kvTldKeld5a3JZYlBPdVFpbWR3?=
 =?utf-8?B?d2VMYkhDY0tRdW82WXhJckNCZExpbHBXdG9qbjJmWU4vUGNKVXBwdmFaUzAz?=
 =?utf-8?B?YzcyY0Z6bzJVR1NBdFFMOHVnckRLVytyRlZvN0g5MUk0Z0hFVGs3VXhueXZ4?=
 =?utf-8?B?bzJla0dUZFQyNlpyTzFxWnREdUFYVFZpdWIybTY4WUFLSVpBZXl5eHV0N2JX?=
 =?utf-8?B?VUhIWUNSVFF4QVl0QVQyNTVpa0cvcG5KZmI3aUlQWXdpY0cwRkNFbFhYWUlm?=
 =?utf-8?B?UWZydDBuK2NOWW5hU2VOOXd3cXFuKzlUek5YbERuNmNtaWR3OEJjSzJXcEgv?=
 =?utf-8?B?ejdPZkE2YmpudnJFRlMrMW4rUUpGeEtZL3pGNUhoclp1WVdiR2p2VEIvMWdJ?=
 =?utf-8?B?dnQ2RXoyMHg2TUJ2Y2VSSHFFRWZEK2p6MUM1RENFUkU4blB6Ny9yR2l4clRy?=
 =?utf-8?B?Mjk0Y3JPVDJSdkNXZlZmdXRyL053RWRJOTJJN0ZmbEVuVFdWZ0NFb3h3ZnJG?=
 =?utf-8?B?WkdHU2N4dEtqMUJNU0gvYzB3U2ZLbWg5TnZ6SG9zNDQzODduaWJ3emMwbUUz?=
 =?utf-8?B?NjVUeTNnVXlhQnRkR0syRkJxYnozejFLc2FFeDB0VnBwd1pPR2c3ejMwN1gz?=
 =?utf-8?B?MlhuT3poQnFtcGpkSkc4dUNiMkNBZW5SN21GblZWTm5BdWQ1VjZjbCtIV2Vl?=
 =?utf-8?B?OWJvcHQ3dnBVa3BwcFE3bXF6MExrdkhUTVNVTHBxUjRhWTlvazdTMlh2enQ0?=
 =?utf-8?B?bmhMS0JKMHFjUTNLL0djQ3R2dXVDRnZweVYza1R3ZDV3aXdMaUVZV0xSS0k3?=
 =?utf-8?B?VWFzTFljUTRMeXlieDk3RXdOeXd3R2tpbkdsSng5cGV0SzYzYWtKYkxBcWhj?=
 =?utf-8?B?SVVvMFFaaEpSR0NDR3oyczZkUlVDazI3dUZEMVhiTUtzTk5PMThSS0dQVU85?=
 =?utf-8?B?Vk14S3FKbTNMR3EyU3hFOGZJOWxpVjk5Z0pMU3hhc2lyVEpuTFNtN0xZbFY5?=
 =?utf-8?B?Sk9JTjYvL1h5Tk1UQ0lQTWhOV0t0Rk1KU244SUU0eitxS3d0aCtabzFCVUlo?=
 =?utf-8?B?V0ZqMU9TeHE1M0Zkd202VGN3RFJmT3hDa2VMNlBETGhFVXNBb2NEWGdCYU5Y?=
 =?utf-8?B?VXdSOEtKVlAwQ3pQdDVuS0hWQkkrZGc2bEc3U1lrMHJjUms4V3hUMUtJUlpJ?=
 =?utf-8?B?QVh3TjIyTFRYVkx6bndHTEVVWHpaSkQ0L3ZyMThBd1ZrZ2NZU001Y1cvUGFi?=
 =?utf-8?Q?3rnq5lxsYB0NXXPoICHmQJSDuFXNFglzWZAxj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016e4230-8f92-4cf7-ebc7-08ded03c7244
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:58:36.9444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAECfGDxZL2R/KV4rdY0Kvg3xv58vO6b32EsX/oWP1YzmYEb97DS2/FV3d9tZuVbf6jdVEfEmJn91c8yD2WS/cwBqv/Q5nvCtHVLfvMMH+W+QtDnLiLRcBlOGYy9Pska
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65342-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC8406AE078

> Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
> it because it can work at two mode: MIPI CSI and parallel mode.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 711e36cc2c99..f54fd4cdd926 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -434,6 +434,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
>  imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
>  dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
>  
> +imx8qxp-mek-ov5640-cpi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-cpi.dtbo
> +dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-cpi.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
> new file mode 100644
> index 000000000000..9fbdd798f17d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/imx8-lpcg.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/pinctrl/pads-imx8qxp.h>
> +
> +&cm40_i2c {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	ov5640_pi: camera@3c {
> +		compatible = "ovti,ov5640";
> +		reg = <0x3c>;
> +		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "xclk";
> +		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
> +		assigned-clock-rates = <24000000>;
> +		AVDD-supply = <&reg_2v8>;
> +		DOVDD-supply = <&reg_1v8>;
> +		DVDD-supply = <&reg_1v5>;
> +		pinctrl-0 = <&pinctrl_parallel_cpi>;
> +		pinctrl-names = "default";
> +		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			ov5640_pi_ep: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
> +				bus-width = <8>;
> +				hsync-active = <1>;
> +				pclk-sample = <1>;
> +				remote-endpoint = <&parallel_cpi_in>;
> +				vsync-active = <0>;
> +			};
> +		};
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_parallel_cpi: parallelcpigrp {
> +		fsl,pins = <
> +			IMX8QXP_CSI_D00_CI_PI_D02		0xc0000041
> +			IMX8QXP_CSI_D01_CI_PI_D03		0xc0000041
> +			IMX8QXP_CSI_D02_CI_PI_D04		0xc0000041
> +			IMX8QXP_CSI_D03_CI_PI_D05		0xc0000041
> +			IMX8QXP_CSI_D04_CI_PI_D06		0xc0000041
> +			IMX8QXP_CSI_D05_CI_PI_D07		0xc0000041
> +			IMX8QXP_CSI_D06_CI_PI_D08		0xc0000041
> +			IMX8QXP_CSI_D07_CI_PI_D09		0xc0000041
> +
> +			IMX8QXP_CSI_MCLK_CI_PI_MCLK		0xc0000041
> +			IMX8QXP_CSI_PCLK_CI_PI_PCLK		0xc0000041
> +			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC		0xc0000041
> +			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC		0xc0000041
> +			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02		0xc0000041
> +			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03	0xc0000041
> +		>;
> +	};
> +};
> +
> +&isi {
> +	status = "okay";
> +};
> +
> +&parallel_cpi {
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			parallel_cpi_in: endpoint {
> +				hsync-active = <1>;
> +				remote-endpoint = <&ov5640_pi_ep>;
> +			};
> +		};
> +	};
> +};

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>

-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

