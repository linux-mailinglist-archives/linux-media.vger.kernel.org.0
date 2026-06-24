Return-Path: <linux-media+bounces-65592-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k6u4G5lBPGoPlwgAu9opvQ
	(envelope-from <linux-media+bounces-65592-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:44:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D8F6C13DE
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:44:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=YX4Awzwa;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65592-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65592-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59B0F30D23B7
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 20:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFBE3E3D8C;
	Wed, 24 Jun 2026 20:39:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9513E2764;
	Wed, 24 Jun 2026 20:39:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333560; cv=fail; b=Y9QMRWIOlYp2NJny0Hv7hSwqmP1/zvPGRjlGjZ6Jc2zckcGdkxE3AyJt3pzAZ1tmtIC8sckxQfHTPKrLRnKyITUJwutzoo2inwzOABl5/RWQ7N7d5fM/XPOT4FbU67S2+YMVSd/ai0E0YWTlNzPdRoJNeGEPZwZBka3PUohIERM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333560; c=relaxed/simple;
	bh=QiugNJU5J08CcUxhZtkpqll3rpwMb+ODaZgYTjz1dHE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mmppITGIpCXyLhZBT1JCHXzI8yKy0P0EkSaitECRPYYtq5uezoxkWZu4LTHRMSB8tYkKzUYuXNEwFL4219UKe6ayUUycgs5WrTgCFvoSu5qPbkWAK/61100Qx3n9Bx4GDX29ZAQGuz08UnOCFh2RJXwXaldb8C8GXU/H7oNGxAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YX4Awzwa; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wn9GpBGsiOa/aKsf8+TdOSwB1pr4fSWoknm534savqat2D8fC5Ws9yiwt7DxrmWZTZv5R+2bf/6BUVXZV7Lq9mkIsSCdmPjloVA6S7YE6e7e2et+5tz+N8GyR+ERY3uXf87czj0leR7WBxZVZjcEy2G8XqJMxHmUIlmCGAlWvUICkkFSGM3Tx9IcAclDr5cWuqtJi95+j5Z2FVv4VXh1ob3IkvUzjpX0RwVR0iO/Ld+cQvKA77GC2OPMZr+ZL5hstfc1NiMxZZTJm0oSe/s7ae6fuc4rloryrslf7JXQ359GInayQYZSJfCt3GSXyzZSP8FZHtaUtnOz5MbjdNPonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+dbywrKvd0mc6L0O2Fhun18/1hMDwl7te7EJhD97aE=;
 b=rmSYWhQoeQucx9RG0lQH+DkklTURpzfykbPFWd7Xuw+VdyiHiFaZbRTkzje+iOFGHIP0bfSxDI48Df3TddF/Za0CJgZY98zwwjLYGfKjuZceYi+ws74OZwfCAWnB3lxIjwyuXAeCBNSbDfpioB5bZehvgAL7GaD3uyu+zaVMyY7evNQcO+1r8+4WYU8iNk5i/8MwYTz7Hxwe660X0mRHgYOk5VtvcwTrEoPo3j7DEd4qjbpW/Ah05dh9FrW3n2J3L8jzwxwAQ9L/mAzRqX4HLeru8kJbcJLUhaRMyHGyb+JNPa3Omyrg4WoKEctFc+h5DwHNC2DqCLEANefn6WTkiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+dbywrKvd0mc6L0O2Fhun18/1hMDwl7te7EJhD97aE=;
 b=YX4AwzwaRCUM4TuQLizSriSnPyCBdsiqNgFFLsxh6vxg3m3evh79CIkmvmsyael0vlICZWZ/aG9A6DOA1acVuND91ozlp5S+2E7I0Gle4FlZ6sL+JXDWzcs/drSwFePD/6W+hMlt5wJKwkSQNpqA3Dwx8t54xGiah76FDjMW4OnJn3McmUH+C1MNrxGWQ5v9xWxljD1c5lf48fBocZ9I2ZEMswAQ89bMVHuYPEYCee5jfcXyLKOX5C/VNQLZO5GEyoy0CyejpOS/fZ6dJkb6v/4tR9TNAmpkkpYMdj09J4he4POEC3HJmMo/16vLnzFxGN38mQvJwEzOQ8z16P0+mA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11335.eurprd04.prod.outlook.com (2603:10a6:102:4f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 20:39:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 20:39:08 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 24 Jun 2026 16:37:53 -0400
Subject: [PATCH v6 6/9] dt-bindings: media: add i.MX parallel CPI support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-imx8qxp_pcam-v6-6-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
In-Reply-To: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alice Yuan <alice.yuan@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782333513; l=5103;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=+b/aZLiEW6PzmugJsYAiILmqSJzumQpWQWK944+UONs=;
 b=bH9x7SSqTE0QdKl0gm1nZetqpTSgf/W2w5zDVhidk70sdzmNOpZkwfj5bXRQD5ahl2F5p+LeM
 +KKcLwZwL6dC1qdvGqKuJ29ZIgl/m/dEduHRYDauNTp07D2cd53q1lo
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11335:EE_
X-MS-Office365-Filtering-Correlation-Id: 2daa24a4-006e-4521-646d-08ded230a3ae
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|3023799007|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
 CMaY35UhlvLsezB0sUy5pZNj7PB4xexgLMOyGjLUIFH6PAA4gld4TjWa7MkRI4g+L4C52Nwr8TinxU9V7pwLE6GgSoQCrrDdkFdg6Jnic7m5ohlE6lLKQWf0bFsHhl+CjVhGeBPxAxUvl1BrlBfz7anhVqiiI7LxrFQni9xHXJw1ijL5ytboGNSqZL0JIqZlq1YcUNtqgVfZxEdc1cQM+aCtlOJYpZRAdPFVm+8s95ePBdv+WDyQ7NTN9beDvH/m28FB8sKjuFUfUvJNJVbw8Lmi7OVEPQcd/7/cD3V2o8SD2dAjCi8t8QBJ2GnPQ+RewbG4cHa/Iy3NUi2lNqmcQGGY9b5OY3mVR/U11ZJ2wQGGrny7Yh2BwJ2G4Tc6imdbHgjdAqMAoEb9uk2NXR/g9Ao/tSnDL+LagCsaHjqufCGpYAUL12gkZsg6okjE+JIZR2KRUdD2ii9GnY4+S4an8eES4OdBqJsq3Ilu9a4M7UwnU+g07aw1om5jDJUVdUyIuI8/i0zP97+sYNriH7wuCjpz8KJ+xjFuO5gSxfYBWWIJGmJWygYrNBwRDT6Cd1PKOnZ82xf/0VtWisFHO5PjHsp2SKPn4JpPx7nySys0NxDN6Cj+ay3wGDMmdHDRCxVscUwsUdcrla2dDMnZ4Gab49vQy7bJy9iEJPMq1n6SOhw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aGVXVzFDVmFGbXpVemQ4dE9yVGdlcGFIZ3oxNEhVb1N3UFJQRHZ5cWNKOEdI?=
 =?utf-8?B?emFnclRKNDVKekY4Nk4vV2N4eVJOdjVlajZFc29PajIyckNiejg4RUU5amk4?=
 =?utf-8?B?Sm5RQXQzU0tqb3BHVy9EeUc5WTVvaVBBZFFWZWhLOTJQRzd2bmpVeXZBRDhv?=
 =?utf-8?B?aWhSd3VSdCswR0diZ3pjTG5ycFpZZkVJK1FLUGVIeFl0aDhaMW0vZkpjNlJK?=
 =?utf-8?B?WVI0ZnNvWWRvdXJ3OFFIdElVMjJ3c005RGVjd29wRUgxU01xOC9LOVUwWHNo?=
 =?utf-8?B?RExwTjNsSldrK3VyUi9SUzRiZXBWQ3RyenBqOE9aL3dab3lCRHAwby9MaUVq?=
 =?utf-8?B?a1pIZ1hXcHkwVGFWZ3lkNGxmVmdsa0RvN044eVFmVWgySmtmeFZjeDlCaHF6?=
 =?utf-8?B?NE9iUnJ5MHVLMkZUSytQamxVQjBic0thWERWZUtFZlZYTGVpbHZEVFEvR0dZ?=
 =?utf-8?B?M0NMWTA0N2Ztcm1wVWNObEo5VjdIOXcvOUdQSkorSjRpV011ZkR2WVBvVmo1?=
 =?utf-8?B?TE9hV0NDQk9MMmViQVRjeEFNVEQ2MUcvbUVoSUdjTHFhZzBNNmZiWm9OeHFk?=
 =?utf-8?B?bDNaZXZEOXZvMEEwdC9HL0lIaCtBNHdVbUVqWWJSSVhFNTUzSFlhSktaak9n?=
 =?utf-8?B?bUxlcXdDVnE4d3VXMEUxOUUxU0pMUG9sSWJnY3ZzY2dRbWVmdzczQnNKc3dr?=
 =?utf-8?B?TFZaZ21zVGRyRTlXUDkwSFcxNzB0aWJkOWxyRyttdDZFcUVNcVhHcUo1R0tF?=
 =?utf-8?B?ZmlyaHFRYUgrR0Ezb1hIUExwb3BnSzVOYnBxUUFJTVVYTWtNM3V1MUxNU28v?=
 =?utf-8?B?RjVCZHhEdWdnSDJ2ai85YmYvaDZ5cHltNTdmYVI4TG44TXFUcUtwU2c1QlYz?=
 =?utf-8?B?S2ZxeG1GR2s3TE1zQ3dUaExzSUhVcWtTRE5EL2hYTmdidk9ESVovRXIyU3VG?=
 =?utf-8?B?VTB0U2F4OVVtdjQvUTdhNTdIUEVpTk9wQmVXL1N3a2hlenRObVdNMDFTbXhM?=
 =?utf-8?B?djJZQlpSZWgrREZQdkVJVStpOWRkb09mNEkvcktOUi8wN2s1L2ZiNUtFVHVt?=
 =?utf-8?B?aVZVamFTY2FyVGFzTU9zMDdVaDlMVExrOWkvdWptMmZqUHN1dk10UldkRTMx?=
 =?utf-8?B?RWR2bWhJaVBPUC9ReUE1TEp1czkyM0xJbGs2c0hVbExsa1NsUkFsT3ZuS1BK?=
 =?utf-8?B?U0dML25XZTh0NWp2SGd5ZUlLbkJ0WEJIanVQWUs2OVhuWGxhR2pXVVVsb1k2?=
 =?utf-8?B?ck9Oa2NZbGQzTm9odHlJTXRUYms2TW9NbWwxdFEvaFZ6YWpKQlVESUltZ3Za?=
 =?utf-8?B?d3FFZHAzb09UTUFGUUtJMVlEOHc3SFlTUXNzQWxkb05BdzcyVVNKeEJBWHZz?=
 =?utf-8?B?MmtiYU0ra0VtdCtpZW9FcDdLcXhjYWRVTjZDWFlBK1YzN1hGcWZKZDhvWkw4?=
 =?utf-8?B?WUNvblZHUVVQbE9LWTFnUm9HemY3cjc1dUdSTlNxeXp4U1R5YTI1Yk9GSU91?=
 =?utf-8?B?ZDhJY3JGNENoTHgrT09TK1hXcGxPMCt1TmUrVVZ0dE5yckhiN2FSVkVIN2Vi?=
 =?utf-8?B?WjIwYlduMG1Zc3dadFcxTnV1dnRYTlBoVENGajd2aVpDQ05NUEJDY3FtM3Vw?=
 =?utf-8?B?VjduREd5c1drQmlXVWRUUnltU0tCWFhhR3Frb0hnQ2JMaDlJZFlvNXFQMjJB?=
 =?utf-8?B?cWowMDQ1OU9xOEdmSm1QTndvbE9sL2ZrTjk1a3ZiY2FHbk41UWs0L3ZVUWZh?=
 =?utf-8?B?QktmSmFVY0ljTVNRbkhCZzdkbFc2S3U5V3NRSWEzKzZ6M3NIRllydi9IbDZw?=
 =?utf-8?B?MlZUdk1raUgrdTRaY2tNRUh3VUJiYTB6WEpCQnpYRXFkNXdJanUzSkxwNkVu?=
 =?utf-8?B?Vk1aWFR1Tm1kRzdPMWRwN2F2MUhFM0M0d3g4bEt4NTc0Wld3Q0J2TlN5TVJ5?=
 =?utf-8?B?K00zYmtwdjQwaUtOM3BtRFU4a1VkdmtHQ0R0Tm53UllCbUo5QUVPRzBkZTdF?=
 =?utf-8?B?VmRxL3hQRkNycU53N1pKdHcrTzI5RGVodzNwUE5haHRLWWkza1Y5WHJpY2FS?=
 =?utf-8?B?bUlxU3hnKytiNGJ6ckgzdFdFd21PTDRieGhrRUdackh5NFF2RHFPd0xReUJF?=
 =?utf-8?B?YUJvZnlETEgvTGVTQytua2k2OUt1UnBwSy9nM3k2NHVsbDVFNHV5aGc2Z2ty?=
 =?utf-8?B?NzhaTTMxSW5DSFdJSXE3TEN0dXpsemVxbVJTcG51NUVqK3d6eTQwS2ZmR21C?=
 =?utf-8?B?aDBhT2QyTTRLRXp6TCtSZmgwNE5UYlgxM2J1UStuMy9VQUIrWXV1SHRadm5s?=
 =?utf-8?B?VHExeTJzSFNldXBkbnFHRXZncGs3YTU3bVhlTlNMVk8vK05JNHZZU3FoYkV2?=
 =?utf-8?Q?7D8v2l4nVqzsTflEyLlyXP1bxq3QeiFzLv5jC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2daa24a4-006e-4521-646d-08ded230a3ae
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:39:08.1100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lx/txaYZAOFWeGf20kMGNHonnely81CBOb+v70nMoHToqLpwg4W2TSoIXWKtpHNSuiFbx3Hwy1sBYikjbHh0Wj7hxj9/3/bKOvdFnkMbEzq6TkO97Nzy1SYkZ3Wc7DXg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11335
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:alice.yuan@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65592-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,nxp.com:mid,nxp.com:email,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7D8F6C13DE

From: Alice Yuan <alice.yuan@nxp.com>

Document the binding for parallel CPI controller found in i.MX8QXP, i.MX93
and i.MX91 SoCs.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Chagnes in v4
- add Laurent Pinchart's review by tag
- fix $ref: /schemas/graph.yaml#/$defs/port-base, original is
$ref: /schemas/graph.yaml#/properties/port-base

Change in v3:
- use enum at compatible string
- add ref to video-interfaces.yaml#
- use cpi as node name in examples.
- replace csi (Camera Serial Interface) with CPI (Camera Parallel Interface)
in commit message.

Change in v2:
- use pcif surfix as Laurent Pinchart's suggest.
- put power-domains into required list
---
 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml b/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
new file mode 100644
index 0000000000000..9dd0331f6ef75
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx93-pcif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8/9 Parallel Camera Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  This is device node for the Parallel Camera Interface which enables the
+  chip to connect directly to external Parallel CMOS image sensors.
+  Supports up to 80MHz input clock from sensor.
+  Supports the following input data formats
+    - 8-bit/10-bit Camera Sensor Interface (CSI)
+    - 8-bit data port for RGB, YCbCr, and YUV data input
+    - 8-bit/10-bit data ports for Bayer data input
+  Parallel Camera Interface is hooked to the Imaging subsystem via the
+  Pixel Link.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imx8qxp-pcif
+          - fsl,imx93-pcif
+      - items:
+          - enum:
+              - fsl,imx91-pcif
+          - const: fsl,imx93-pcif
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: ipg
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Input port node.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                const: 5
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Output port node.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                const: 5
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx93-clock.h>
+    #include <dt-bindings/power/fsl,imx93-power.h>
+
+    cpi@4ac10070 {
+        compatible = "fsl,imx93-pcif";
+        reg = <0x4ac10070 0x10>;
+        clocks = <&clk IMX93_CLK_MIPI_CSI_GATE>,
+                 <&clk IMX93_CLK_MEDIA_APB>;
+        clock-names = "pixel", "ipg";
+        assigned-clocks = <&clk IMX93_CLK_CAM_PIX>;
+        assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
+        assigned-clock-rates = <140000000>;
+        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mt9m114_ep>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&isi_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 895a87b571c35..51d5c62e3fdea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16258,6 +16258,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	Documentation/admin-guide/media/imx7.rst
+F:	Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml

-- 
2.43.0


