Return-Path: <linux-media+bounces-48119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 345B6C9DED0
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 07:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 922623497DC
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 06:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B43298CC7;
	Wed,  3 Dec 2025 06:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oDc/g3t6"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8843B2980A8;
	Wed,  3 Dec 2025 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764743363; cv=fail; b=S0QOpOb54P7ssFEEf1E0ep8ATr9+Gj98wQ6ig+ONtPei7tnE4YgoU0T4eeCB5DuGn4MACuB6pWZA/17u2kUB0o6Qa+o7bTPWOTVqZmxaVbpYY0IqDxEU3HAQY3twADAhMJWMMNwctYlMZpqgUHaglPLtECqX2jfAqd25z/z+P8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764743363; c=relaxed/simple;
	bh=QUMS3dnrJMLEHXfaJ9rNMqIcVZb79HT0GP2ANb4v7yU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=jZt+ljxgrXC2ged53kciXzqAxN0qLqS77O4HvjVIZeGx5um3gZgy3ilNX8MwQwDZ6Z9XOz+Zt2i5qarKpuj1HEVcE5VyX64AFjNfhkKwXUrkL0PjKSbpieU1spLmXbt9R/svihBzQJA5WRntaJ/f2gUYn1qc/Oylf4inHIN8j/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oDc/g3t6; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BuhTeD7uepCVs+0CIMrHcGYEYUlCg39z7djlea580JApoa8zp6bPPTQ+BVRFkFpMYoX6hRUedky4kyXrYqDyCCjlJB3d6qmbp5mlMVdAAtkpCVr2lm24zYXwo+LdSkTEYE+N2OWfGdUzB7cTDpYtRIdkuDC/NMQC2900dSVPchmYLYMSyC8YKxOs2PWwN9FHaETb6cF+29PH/OuW9z8Iey+jl2stefrffIDGaAC490IYEqm1+XzdnbE5cbaAyndZmvesdkc4ylPR4Ug4H/up/xOwFEZCYc4zXSekhf4EAa2fCjv1TWSXgdOXI//AfobnPIhrLAEi5CIpj8a7lAYHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbSFecq4huNqK8dpwzZR303eBCBPF595HxtbJUn+mlU=;
 b=EuGCrTvrm0gDpCYKP/vOxEQvzmc7i9NZr5GAG6b9GwfmH2OURbLVptZcW/WudkZ2Y58UN6hpbu7GH0zME/rT841je0BWx3eUEQVk0PyqUjKUXeJmM1gXJcin+0bFh1fNBI+C4Htxful5rhIqTXFM3/9NmGzpPKbzLl7iH1Zy+81HEwAgoleZMPv7Nr8CmYQCo4x0+tvsc8sViya+R2wwDNnJRuSiK9j+ZQEWhzvCUpW1exaP6GEQtbUaRSWGKFZ4zhNFW/xpNvyxWk8F5sySs+hgeBdsLwYjdORDLESpOK3uPZ+gw4pcYbjRfJy5e2XiCZ5+FQem1Wi7zK8O3YCAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbSFecq4huNqK8dpwzZR303eBCBPF595HxtbJUn+mlU=;
 b=oDc/g3t6fCLYNbN3gXn5ut/9kj5vDqToPiVUxmWER4runpnm8w9uMjLrA72wXy2ZwJpOMLt36FFT1XahvoCD0+IiFUnmvCKXsPTzeoKlYRR29MasRgLI49yrEDkuuk9TJ2cKKRh/XXKwEk8NQpoCXx5XQpkyPlMYtIJ2a4+v6YAGQW0DAdiHk6qNvydbGnrd73s0+o/XaaO76JRbFRt2CJckjoOSTRZtFF1gpMz1zNzzwYnf8Cq6nxhejkpP6IONofW1CVjVhyjQIpug4u9O7UncsxYlpG6suxiKJzTQeZkT6r0Jgcj4ZoekC+/J6EwgyX5268e9HIqZ2cLp7iu6Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PR3PR04MB7451.eurprd04.prod.outlook.com (2603:10a6:102:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 06:29:16 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:29:16 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH 0/2] media: nxp: Add CSI Pixel Formatter support
Date: Wed, 03 Dec 2025 14:30:01 +0800
Message-Id: <20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOnYL2kC/x3MQQqAIBBA0avErBPSUKirRIToWLNIY5QIpLsnL
 d/i/woZmTDD3FVgvClTig2y78AdNu4oyDeDGpSWUmnhMm0h8WlLQRZovJpGabxDA625GAM9/29
 Z3/cDVhTjC18AAAA=
X-Change-ID: 20251125-csi_formatter-e6d29316dce6
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764743424; l=3906;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=QUMS3dnrJMLEHXfaJ9rNMqIcVZb79HT0GP2ANb4v7yU=;
 b=9sInCqiJSfAB1P+Poi+pYL73XRaLVDaLZNteGG2IIHI5wlzV/pMlRIdMWeFSIT1s8x6zB7hVA
 vJOO4VOu4+2BXFDo6NHpSuFU1GqDNR3kUC3efU2aWXHzf8pknDahIvC
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PR3PR04MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d9e22c-5faa-4749-472d-08de3235482f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TEFka0ZTcUVBZ0Q2V3Y2MFc0eW9lYTFKL3BodnU0MVpkNnhidVAxMHZFUjNl?=
 =?utf-8?B?WWo3ek84M29ZTGpFU1JHcWZ5YnRYR0xJK2MvTWFVdG02QXMrSFZTK0phdUpK?=
 =?utf-8?B?U0tuNC85czc0OEJMRXU1MlBUcUFIaWk4bjFpZ1UzQTlSUU1DUHdqNnpJaTJy?=
 =?utf-8?B?T2d2V3VjSGEzVW9VUlZ1S0lUbjJkTHVQQ3FKNkR5YzlyM1BpdmpLdGhTTDJi?=
 =?utf-8?B?RXBZUUZDajd4eEMyTlRtdGt5VmNkUndoK1RBV2JSazd3OGpYQlplV2hBY1pq?=
 =?utf-8?B?UmNHcmg5RGhlSHgxTEE3dTkwZ1VNb1BBSDFWMHJqSENLcGlEUkNEKzF2M3N5?=
 =?utf-8?B?ZDY3LzlrQ1kwVUltOTc1b3duYkdjUHFucEp4Y3J2L2VIMDRNVWtZZEZuTjEy?=
 =?utf-8?B?ZXk4WU52T0lleGF0c1c5QnhuMGJqcmJFUDRTYVRRVGdBOFJjS1l1U3RWdUFw?=
 =?utf-8?B?Wk9GQm92eGVXTkpwQ2ZqM0pBcUZMUTdKQmdRWmNQeSt3Smd4aG04eU1IY0pB?=
 =?utf-8?B?cDN4Ylg2c3ZTS2pIRllZdlVYQWFFUTNlcERPbGtoSUVpcEpmQWljbzcyYzZQ?=
 =?utf-8?B?cTVWSnc2WHZMRDdxNitzb1p2RzVFYWh5d1lNVWtLcUV2R3dadi96Y00ybXZk?=
 =?utf-8?B?NEZ0S3FKdEQzY1Z1Qi9IQzEvMDlFYnhSODkwaFJRQjRlais2eEY3R3VEVUFD?=
 =?utf-8?B?OHYrWWxwMWxNbG5UV0hQK0NEZ3RpSFc5bTF3RTJOYUd3OG5hNFlrQk9WOE5E?=
 =?utf-8?B?dTA1TUlGdWlxWHRzcS9tMzhib1VHZG1vWXRmUSs1S3FuUDNoZkJZWTJhSCtP?=
 =?utf-8?B?NzBVQWFVTmR4c2cyb2xNbnNXTlRGWkc5VlFEZlBETjhzcWZnREdLQTgzV1BS?=
 =?utf-8?B?Z2haOW9lN1BldUU0LzEycHRnRk9RQml2M1NiRXhOSnFicWxSYnpPK2FFQXZn?=
 =?utf-8?B?U0tXVld5UWsvNkVQd3BXNnAxRFIyMHdPS3pFYStGVEgyRFRtVWxONVIwOWNN?=
 =?utf-8?B?cW02a0dhWnFSQWNBNE9yczFTclFiOG9nN3BIZGtPcXl0Q2orVnpPZkVlTFhE?=
 =?utf-8?B?OVlNRUJpOUN5NmpNZGgyRVQ2bDFLUWdTZmhJSXdkbU9SeHpaY3J4Y1hKaExt?=
 =?utf-8?B?Z0VBYlI2VytkK1J0UFZnOGQ4c2hUUWp0ZHFBTEx5dWJ5Vnl3OWRoeW94WEho?=
 =?utf-8?B?emlNMDBndEEvYmhyYU05U2srUUNkNmdmZDF2bXYrNk0rUmt5Z3Vha1hIaWZM?=
 =?utf-8?B?Rjh4S0t0czlZU2RFWjZ1Y2ZvbkZFVDZrQmZmS1AyTFRaZlYwTFA0N2p1dTZl?=
 =?utf-8?B?aGV1Q1VUZnh0cEUzYWFydmdqWjhGN201cDhDSmFqSzJRUDMyQmZzdWlLNGM3?=
 =?utf-8?B?ZGVVTUErRklCdXd5d2JpQzAxSjYyeUNqREE2YlVtTWNUWFVPdkVuaWdjaEQ3?=
 =?utf-8?B?VHk3ekE4ZXdhTXlLc2gyV3VnKzVvbEFsNmV6aDlOWlFvMFo4WWJTbVU3SnZp?=
 =?utf-8?B?Q1llM3NlVmRQQ0JDOUR3SWRWMGJ4aG1KL2dGaFNuY0Q1bFNVZ3NCWVR2Mytt?=
 =?utf-8?B?K0hQaVpvVVo3ZkgxRngvL0JaMW9iZmlOdVVuWlZJcEtsQmYwaHVnUlpMOFg1?=
 =?utf-8?B?bllkRjhZZzRFSnVLUy9XSHZCaGVFaGRVemgxRktaeDQ0L0lkUU5oTUR1OHZh?=
 =?utf-8?B?cC9QalhoSmFpdTIvQ3BYZHZLbGFILzE4S1hiSlpNNHRvVG0zSUtJYWRqRE5v?=
 =?utf-8?B?Z3p6UFZYR1NaVkVmUitDdHozRG5SSmoxMHBjL0JKSk1ua21JaFJDbnBPeEFB?=
 =?utf-8?B?Z21oZHlTTkliV3YwK0N3SkZybFFvak1MUzBmNFhPRFFSRVdBRzJxNElHT2t0?=
 =?utf-8?B?dUordFVvZ1dQaFd0QVA5R1p4RnYwR0tSeWdLaHR1L0haR0NaZ01NeUFscTFT?=
 =?utf-8?B?c2I5bmxtN3lvb01oNUU1Ulpiam5ic0l5dkhkbDROZVBobVRvemNFMHZnMEoy?=
 =?utf-8?B?NUNRbFJycXJhamEyMTV1dWVwcXNDVmpQZFh5QmVxYmtCQVZFTnJLRk1NdSs1?=
 =?utf-8?B?Vkw3SWRmZytXVXZodnp6SjZPcmlvQk14NDFiQT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Ty9na3BEMHNWY3ZNUjhwSmJrTEJOYkE1d2JzT2hReUM0cW1oSm0yMnhXck90?=
 =?utf-8?B?ZEZFWkxVWWxES3NzUkJaa1JhZjFkYUpJb0EwbjM2MW5aRldvRTZWa3VMR2hS?=
 =?utf-8?B?QjVqd3ZFdkh6NXN4aXB1aFlwRUxIS0NGWWR2TlpQcnB4Wi96dGNiUzQ5UXRZ?=
 =?utf-8?B?bHNzcngyREJHYW1QU2J2Q3RDK0V3UGM3TmNqTEJ0ZWVmMzNmZzNPVlJXQmhU?=
 =?utf-8?B?WEtXNnd5bkt0d1N3cnV6Wk9NejhKSG9uUkFsbG5kN2poSXZ6SlUrTEdobmhO?=
 =?utf-8?B?WEVSMHczN1VGY1hXVGJPcUl0ZkE4UnZxK1Z2dmhLeUNQQm45VTZ2dGZMMjZM?=
 =?utf-8?B?VVVJTDhPR2laVGxMUFBBMTN3aWRoNk9rL1JPK0p5clQ2T0NyNThqcy85a3lO?=
 =?utf-8?B?cXB0T2JUUlVieEY1em00UHptcGtnV1hjWVhEdHJiZ0lzOFVlR2o3YjF3ZUtt?=
 =?utf-8?B?RUpWRkFkQVpLbWZvcElzY3NqVEJPMFdWMmszTEpUV0JCNUsrMWxNdmFvN1Vy?=
 =?utf-8?B?djNFeXl3TXJjbmVuME00Yk5DbVJGYmJnUVpSVFN6M1BJK0lCTy9OM1oxRWdM?=
 =?utf-8?B?eWd1YkJ2YlJDOE91Vm92KzNKT1J0ZmtvNVZHaGpxeE5oOTEyOC9xUW1nOGlh?=
 =?utf-8?B?UkZ1Z3k2YTkzRDc3aEh0SzcrU20yQnBYMER2WHZtNUVNaSsvS1I0dVJITGlH?=
 =?utf-8?B?eXp4RXFVVngvOVRKbDRwUzUrZ1BzK3VSTU9xcGtGaVV0bGZMcFZHS3NOdXl4?=
 =?utf-8?B?c3JXaDV2MnlPUStMZnVEc29pSVh4WWNCQnBtNTcrbFc1Ukt2UzNlSEpKek9L?=
 =?utf-8?B?VUFzVHNHWW55UUZGcWF6K1RTMUFxNGFmeFVucEZrSDYzVVVZR3hsZmF0MlRW?=
 =?utf-8?B?cmYreVJmVnpVY2hQdHFFTnRMV0tKUHcrSVlJNEF5VTV3NnhQT1haenZVRWF3?=
 =?utf-8?B?NHpubmFSTTVIblNuVjl3RVFWV1hUV0xYTnRCQm03T0plK2VqZy9CQ1UrM1Uy?=
 =?utf-8?B?VlFaQ2dnTTB0UlNJb3pjOGMwMUZkMnBuSUNhSFBvUmVJZndEVDNzTGk0OUtl?=
 =?utf-8?B?K3hSK01JRVJ2clRJUDU4Z05nelZpdUlwRm9nUTQzaEVzNmxQRTgzMTlBMnVD?=
 =?utf-8?B?UTg0ekRZVzczMkt3Ly9lQnExaThEamw1UkprYWtKVVd6dEZYVDNDS1BDTmtQ?=
 =?utf-8?B?Y0M2YkI2aHRWNTdrMHlROVNNNjRqY0ZPbHBCT0t6dUN0eW1NVmM3L2Z1UDFa?=
 =?utf-8?B?M0h4L0JhWFVkNmdBazgremRzTkxrS0Y5RjN2NDRhYmVMQzl1dmkwWHFiL09B?=
 =?utf-8?B?S1NhcWFHN0dMODI4Q2kwS1d0eWMxY3MxbjEzTWZHNFkzckdxMXBpOWJKcDBU?=
 =?utf-8?B?aDhkOHBPK3NVZFVqOGVJbkFLUEwycFdMV1g0RFpxeTR3UlYxYmZiOXh4a1lY?=
 =?utf-8?B?TW1BL21kRjNVbHVrRlBWczY0cGpSUHc0akpJV1VIY3IranVydkFiYThPWkxZ?=
 =?utf-8?B?WDE2RitpazArek1VTTRnU0lrcGZmRXJweVlIOVowb2VpcktGL3hQanZkUzlh?=
 =?utf-8?B?WDd5b29tUDhxcFltcXdSK1kzYmRNVU1kd0VKRnpaVS9vUHc0N2tGZkV3dmR1?=
 =?utf-8?B?UEdOSlMzUGR6cGVvdG0wK3cwMDJXb3pMeWpQclFCZDM0Q3RrVVRFaTF6c0g5?=
 =?utf-8?B?WHBYLzlZVHdMQkxvQngrTWFja0ZOaTR4TzMrNU9HSTZ3bitqYXRaVmZWNXYx?=
 =?utf-8?B?K002UVdyNmFnbzZYbnNDbHVlRmwvRU5aekszZWNlNDBSSUQwMkFrZkZNRlJR?=
 =?utf-8?B?SmRJNUVTcEF3ZWNsTVhXVCt5OGtaOXlpM0Naa3RkOHJPMHhYOTRMTno0VHY1?=
 =?utf-8?B?UTdkRGF6aDhYTFVER2dpSENqakxXU3hDT2FtYm1oYVhZQWlteSt0a2l3aXY2?=
 =?utf-8?B?NldhWUhqR3BNQjJ0SzJ2RGs3YjNHeVRETVVFYVQ3VzV0YjVrZHdHcTkxR2p6?=
 =?utf-8?B?Z2x3SDBrdVVOUE1IMkR4bSt2RnVEeW00MmVaRHlxa2JuNDN0cS9zY0FKTDk5?=
 =?utf-8?B?NVA0TjFRRlMwNzljVjUvUEl2VFJjUVZydW10ZmFDNkZtanFSOW9NNHM5VXFE?=
 =?utf-8?Q?kW0W0YhjcwQ179WhCDSI5W/AK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d9e22c-5faa-4749-472d-08de3235482f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:29:16.1850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vh+vR8cn5GHnxH4iZfW35fh1RbAF8gtCh0X4v/OvEPp+mpf0Sp/UueVMnOWx7PCmZhwPwVPLFtrKU55VYFyLdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7451

CSI Pixel Formatter is a module found on i.MX95. It could unpack the
pixels received by the formatter and reformat them to meet the pixel
link format requirement.

This patch series adds a new v4l2 driver for CSI Pixel Formatter.

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev9:

Driver Info:
	Driver version   : 6.18.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev9 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev9: 47, Succeeded: 47, Failed: 0, Warnings: 0

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Guoniu Zhou (2):
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

 .../bindings/media/nxp,imx9-csi-formatter.yaml     |  96 +++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  14 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx9-csi-formatter.c    | 894 +++++++++++++++++++++
 5 files changed, 1013 insertions(+)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


