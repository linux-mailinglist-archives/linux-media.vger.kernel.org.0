Return-Path: <linux-media+bounces-65576-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rwu2EUENPGo2jQgAu9opvQ
	(envelope-from <linux-media+bounces-65576-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:00:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0916C0322
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:00:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=DC9qkhtH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65576-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65576-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 638AF300E016
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 17:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3ED2356767;
	Wed, 24 Jun 2026 17:00:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD3335AC12;
	Wed, 24 Jun 2026 17:00:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320442; cv=fail; b=JqYRYgmaS080p2Ioh4A8C/aWL5LhSv4dmoLg2yDTS08aE6Ttwib7u9FyDQ+FZA+mVqrSnKndYon0keMCMGvd1BWi5RK17Z8OJ8k7S/8/dQ9mu3q900R7vHD1GlMkxFtulZjPoYFmrH10/ts0U3h4AgTYo9Svc7dR0PtubjCwhWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320442; c=relaxed/simple;
	bh=S0mF3hEyEFMfnQT8Qo+SYiPxQnOO7W519YOjcW9dWak=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BRoRwba8/vU1PA/Lhuw4qAFhPZoYmmFC1pChQJaJHv1aqd6NKUDqNFlEZ8fMIvC9kL9Ay4KHkG8N0h6zdpT+d/2UFehm6+9oiF9Ymrecw2RuWpeegaMoRLaGQ8Om45+XGp3LY7WsUqPKRRQumw7P7fnxc3nvPB3EspNWO9UYvAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DC9qkhtH; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P57HZTFPPtIwJUEL6s+Aa60L7T1hCK0acQA+Kg8f5IkBttDDY/Je03tFugEgULMXyDUUz14OWWsHW/uH+PYt7d7GYENKhEZb5uf+4V94cmPvHYo3sWkABx5g3VmsO07/s9i/jbIRr+MJ/i29DJw/d6R4bg/Mjkol3ktTDqGOGGIYMeLVQF8glVKFCm0DvqDBguB7TNjLRQpfJ3Lt3wo6MSIvNZPEsHBxq6VDZuMrvJAIY3fTTOiBO9g6yPLZP3rjcucZFZf7O7HN5tR5Fkc6B1wTJ4e1gdUjLuucAuDEBdR5yf/G1RoO+hXSscTKaR84nPtUVIbJ3WA4M9JR4phvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NT35tx5tBg2orel4ZJ5b6V+I2paVtZE1Mchp+qSMXJs=;
 b=arYWi6Wi6AiyqnQgWfK5MU5eS/bFW6FRSJFOv4UDBUO8ZWp30+x3pAC2EbcXadqCdUhZ85j3xzhkjPSnD5Acm3m88vu0FkWZHkX0SDmbYVGezOTzkVENdKHfw/GLY+X2plqP8UlM86OyMfKjPCHBAaJR9OAtXJzusJ3/S+TvqUSR1fYg/XNALQPhAEHjeW0tT6c7a3JJyFSCJlJXxwF98fw616mDQYGcN1Nq/qT/KMO2PSmfYSfL72d3y687eGF77ct6tGluD18Kpg5GiMnxo9J3zE6sD9bHwsPrKWde+KVt1IWBx9KTg+PKWI13syUzHXLiVXGjy/39Rp343oJSJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NT35tx5tBg2orel4ZJ5b6V+I2paVtZE1Mchp+qSMXJs=;
 b=DC9qkhtHzPMYqF+6OK8jtaHVNE2HzJ4VGT4Hb8hvNCcjAtoMmKRfgE3A7CBLESJdjzGYBHsWSWaF/oPYQRbsNXkVMjaU7Sgv+h7ZPPUNd7fOYNRJt/HKRdTOHPsfCd5JtIDjyas7amyh0n3zrbkTGCMw/OqTUgAouDrApiFEau0pDAlY31vq9qPiPMXnohbFMCxvH2hVog9YFgq8N+OS3AxPi2z18etE9KQJN9Yte8mJjgMS2LVJ11bZU+a3oHTvUIGD3tbyJplwEEcck07tnUZAVKInDWC2XbMuLSd7cUsrcFMDrNTUKWFciTnIaVnDI8ABaufY6u4lZIOXn0lfSQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11642.eurprd04.prod.outlook.com (2603:10a6:800:2ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 17:00:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 17:00:37 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 24 Jun 2026 13:00:12 -0400
Subject: [PATCH v2 4/4] media: qcom: camss: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-fw_scoped-v2-4-0a8db472af4a@nxp.com>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
In-Reply-To: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
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
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782320410; l=1642;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=p5CsvcucDJKP+X/qMoI4buvh1AbC/GhjiF6tsE5ViIs=;
 b=Uq/fnlZFzHmYW81hIL5ry67kI6ZCjUauOntrCwNKvAuesaQSLu9W3rbpXMEir7FLyoiV2DrVG
 t8+hW58sZ/dCm3v4ylkVW/o9RJqZZuSbfQ/RzXJlu95l22lFYggwOik
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11642:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e9bed3-24a0-4a7b-25fe-08ded2121d2b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 E5X8g55nfjmsZ1bxZIiunM6PvfrRatRLB7LiYnA+QJbBy1esK1b1FexqQf+C/hIupsIsYl8Sz+lCHef9tl6jbama40N3LSztpgXNrjioZZfWkUyRWKdqegohg1bA3TE/91XhKptqoygO8eX9lnhHG6JqHxdGHt+Gtmhz4w9mAJqvwXvT8/6YHkjmVcIHtl07YnA2vTIHpMGd0C7OZB0/5pjJekkmU3w1GX08HdyypVMNQwhVVkOiGfOcJzOD6s/Acz3PKdxttc2T/xcsG/gAtetdUFZqqsjFeo2S8KBPtYGVC/zZuf/JRd6VQs1PplwbP77F7LxE3apeg4fV9BD128Wlm2vPdFC0hig96CNxa1CdA+XfBJOuVMjdJMZEemBMkjAvtg3h+BL0AE8kK4DWBw52t64xhnQVs1Ln4VlnjuE47xn35bAxAyf2mBS+auZSR3auBPtX4YtLImUQq/vQP4sE6P0XOA9/HCO8GvuHCk+mx3/CY2hinJPiwJH4LahO1AKmDcw+zbPHzf/SvzaGPxmDwZ7R78PI0ym+dbxPP/kotIQGQ1Xj7EWgNKrDJ83PXpKBDYEWXsgw+9xrAad8QPtPmBill8FDZPqPNQB2hxliQ6SfejHHGf6+nQ2daTYwK32Bm66gVmXw2OCV3zRauTMYC6FjCR69QrDNrK6Ottorhs3844P6bNzA96E8f7uPZ+OEVSDb/rQr3y1LmccRIA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?L0p0YTdLdEFrV0pOMzdwWkM2Q1lmWFZwdE1QQWc2TXNoTzc5emh6cUxndUtR?=
 =?utf-8?B?K1hjQ0hkOGhVMFZvc1pMcFA0MEs5TG9ERFFpakt3WVJIVGR6OTlpUUVLY1Y0?=
 =?utf-8?B?bDdHdldubHZBT3RHSEVjbWRYUVgwcWtxQ3Y4UFVVWGRnSXNZcWdMZ01mRlo0?=
 =?utf-8?B?RVR5ZmQyLzlmdnBEVVRPUU83Y251WTJMMEtLQ2w0Vlp4VFNKWkgvT1oxN2ZS?=
 =?utf-8?B?eUFwTU5MK0FReHdPOUppTkxKeTVwbnZNZTdaLzRvRHYycVV1VnZ4OXkzQ1U4?=
 =?utf-8?B?ZnYzQXMxRmUyVE01Y2RVbjNISzZRVkNGQ1pZSENTcHZkSGt2ZzljZXA3UExt?=
 =?utf-8?B?cXkxbE5nSTNuMWJtcUpkK29oUUZFRzY4UFVoL01xZktIbzl1dklHSmdDczBr?=
 =?utf-8?B?YmhTUlBya1Q3SzNIaklUd2xlUVIzZ3FLSGsvMCtKMGkwVUdIZjZVaGExMkxr?=
 =?utf-8?B?YUQrRG1Ec1IxTU4zNHBRQXliVDRMZ2djdFZQZ2l3WlZ2Uy9qNzJGRTZqMkdy?=
 =?utf-8?B?ejRhc3R5ZUhpblZuOXMxZzNtUUxTenZ6b1k1aDNybHIrdTZXdnJnTzc2cmR0?=
 =?utf-8?B?WDRDcXF5ZjlyN0ZiTGxiM1ZhYTFxbXVSbTVCSFVsckZUaXlVTmJsV09hOVl4?=
 =?utf-8?B?aWczK3ZveVdJa281K1ppWFY1Y0VSYXZVeDE5MDhZSHhYVWpNNitiSmRVUmdw?=
 =?utf-8?B?RUNOc0ZvUkcxZ2laWWc2VHVpVHh0YmE1TFNWcTVaKzJqY0ZBUnl1bWpRei9K?=
 =?utf-8?B?VDdnV3hPUWE0UWpaSE94bkNIVUxiTndldHdGT1BSZk45WlY1UUpXMld6WWlr?=
 =?utf-8?B?MitVeXM4RytRTWk5UVF1M3FOWHlndlRYNW1pQ1I0NC9RMVF1aG1YYXlxdkJa?=
 =?utf-8?B?SWgrUS9WejhRTHVwYUlybDZjdll5NHFGZ093WXgxaVY1Ty9VUG90UG96enRz?=
 =?utf-8?B?SWtZZlhjcGpoWDdHWTFqclNIS04ySGhpWE5vUlJkUDJYbzduZW5LL2FDekJx?=
 =?utf-8?B?QnNNZE9MOGZPcmpvd3AvOEFkQXdCUkJrKzFpSjZhNGFhSU1neTZJNktWUkdv?=
 =?utf-8?B?YTZqUTVHMk91MlJLandnYU0zaFRqMUo1RS9hR1ovTTc2NkZWcHJPbHpWSGE0?=
 =?utf-8?B?QnVmWVF0a0EyMEk5RUw4cmlMQWE3WFZzNkxkWU03SGJZRmdlSzVvYjY1Q2ky?=
 =?utf-8?B?WnVuQnhpODlZNFZPcnFQRGpqN3FBcy91anMwcFRRMXRJNmNZbVNBSUtYeUdt?=
 =?utf-8?B?Kzl5RUEwTjRLMjNFajY5VWdTSXN6dTFNNm82VWdtMGUrbFpLUVdFczJ5aUt6?=
 =?utf-8?B?YXhFU1RSNWpLL05WbWl0VERZNTMzTTdTMEp4cEpzQnRkRHJGaTROSHg0YUlk?=
 =?utf-8?B?UjFDNTBjbTFVajRsdzc1OW1nZjdSSWwxRzlvRCtmaHd4WEx5dTBjVGFvak5n?=
 =?utf-8?B?L1Rjam9oVmQ4djVNYVNXWTZtd1ZqeW9vbmZrYWVOS1RNcEVYUnJ3MWRXaXkx?=
 =?utf-8?B?enZsdzJEQWhvWjlCRVdsN0h1RjMwekI2RVNmeEFkMXZkeC9XcHo1anEydzJL?=
 =?utf-8?B?SmNObElNc1ZjUVVWZVNiUUh0dXk0TE9YbTUzd0lrbURselA0U01ZL2NGdTFY?=
 =?utf-8?B?djdRRS9HUVBXTEdZdFR3eHRSOFVkOTU4MjhYanhZdXE5MVhDVlNXTXRWUyt3?=
 =?utf-8?B?Rys4OHVmWnVBS3d6a2lMQlZsRmMzRkx5dWhCcGlsZTF4VWN6a25qalpCRmJU?=
 =?utf-8?B?UGhsMHhFQU80eEVMZEhGdkJ6ZkIyK3VCWWUvb09NUHhKd1dEOHJNVVM4V1Zw?=
 =?utf-8?B?WTRRdXZCeTNpZ2thVE1WdmdkdVBQWndhMENEcU5oZTIxd0Z1dmJ2SFI2MVQ5?=
 =?utf-8?B?VkFBQWIvVTZZbXVsdHF4SUg0V1RhanNtS0pqcnN0YkRnaDRMYmlCUjYyNVBq?=
 =?utf-8?B?cFVyTFdZMlk1bXg2aU1jN05hamNQM2kzOWxWSUQ1eW5kNTIwTlJJSHpHZGpq?=
 =?utf-8?B?NnAvTmVSY1ppWWdzMzhuUDd6aXFSMVg5ZVlCWFMxeWVzUDdPeTc2ME1ZVlZx?=
 =?utf-8?B?RHhtTEZBSXJRdE9KNk5nRHd3MzljdUQwLzBGTDd0QWJwTVJTanRxNnJoS1l1?=
 =?utf-8?B?ckhJbXlybW1vMWx2Q0F4QWxUUHFHY3YxTHBOZGw5aXg4MGZycWNMYTZaNzAy?=
 =?utf-8?B?Z3hDbkVBUmE2LzBqcjNIbXNTa0hlLzV1UmZ5T0NkM0xtOHUwZTZta2tNamxR?=
 =?utf-8?B?WVQrNXZzQ2ZLNDlWM1VWZmdENkhRTmE2U1dweUw0N09FVUFSSjRKRzlrOVJ6?=
 =?utf-8?B?WHVzcUhTZ3JMOE9EZi9QVkxIaFdDYW9MVkg2MmJZN29WYUwvVmFsMjhyd0V2?=
 =?utf-8?Q?TdA4geP9AESH05TY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e9bed3-24a0-4a7b-25fe-08ded2121d2b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 17:00:37.6989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVZuykT+lTio550cCOFUmxOm5YoZvqZtiE7ALdt+ak08789AIBpWCm/0YpV+49G4NKTqqtZav+SSwUcacxCc/JdmTKa2oHkJorJHHqneF1IMq70pAZxckjCmQggOlxxJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11642
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-65576-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,nxp.com:mid,nxp.com:email,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF0916C0322

From: Frank Li <Frank.Li@nxp.com>

Use fwnode_graph_for_each_endpoint_scoped() to simplify code.

No functional changes.

Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


