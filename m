Return-Path: <linux-media+bounces-40666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEBCB305C0
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B2A0623592
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F4435691D;
	Thu, 21 Aug 2025 20:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K+q6IkUR"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15F1356908;
	Thu, 21 Aug 2025 20:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807430; cv=fail; b=t4Irxvh4wOo3smhm4URz566hLY5nqKrYMgUzUEXfbngbxtclieHPdgBIq4kfpTBAMV1Sb6IVvHT5/ivphm1cm7jEF/R4Vb7KFv6kE4xevd6HHr2v0ZauVjlzI+RdMl+uteWvrSD9KqfNSj1A8WktOd6yTZwn8sp/1hLrQuIS0fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807430; c=relaxed/simple;
	bh=3pDTYj54ZDo4n98QHzd+FXpEBsweRyFJ3wROB1HMjiE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IHFDvnc/iE2L7DxYq6eyG6qwhF666/+EwTbfLTrdp4vUNfwxWs5fpTMoZGKX8scO/opOM/lPZnugIppXFPXx1I8IKeJ5H0cc1rXvp488nVOAL8LV5ez++fl7I4T6JD3hpc1O8Jzdfql0dTejy63UFV6J7eMdxbdO5xOciB34B7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K+q6IkUR; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQh7FFoJ0spo1ABioZnA5AEFwz1g0wq4Z01HsRSTQVVwvGO4ZrU5LLma+gqJQ56d1fy+94+1OTKyMjhs9ZH45tj5Otlv3FwA1AzDatTKwyVHGzHQwgwQAQa92/D85AmxniPSKLJPrwQWLFISCZPSl2BniT9gjw69YfAJJKMHXsoBmwB3TZtWTegUHnTYlnSBzTwqqHjh29WXtcwIEy86Jt783DhuxUI4iUvF0Dgf0OdyIJTiJJIiTTkbmPWdaMjby8QrWwCQvTnxTJ0vRVjHRrvu1OQFgtconXswSgjPDli1fGVutLnSmBQM7oTqtf5V181paiCGUuk323M2e+e3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyiNTzVCgRpstN7QGs9Y1yoqXesRVoERKYbQPB5PhAk=;
 b=LkaQ1GklrWF8mZnBHwkN/BxyyvAaibwybTQT1pr2DjFzdv+z6RWLUHokKWTdO3z2zmHffuaP4A0wSfjRxlSelyqEtXu+qxlBxdR0k+JfFKqYQIUTB/NC2MNOsgrosG7calLJMyadJhMqRM5210mrNhExxfax74cdrwHoSgR9KlK5vLAieCBJVNTNs/TT5h661tbTx6YGfqoZl+8kcanwyw3igM/ET4EA0edUqSqFHUqQUYppluedms4h9DAsAPtoMabE5nJIIIIBS/XSCYVq652S6mD2o+Rx+6yRmV9mBeA4JgqCTRdinK9Dfmk5s0hiE6+UZOmrTF+zSCikQwPoug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyiNTzVCgRpstN7QGs9Y1yoqXesRVoERKYbQPB5PhAk=;
 b=K+q6IkURvwknTb+v9HkUzaQ/i7XGmg5jLakpmx1cusGNTQo6q65B75/zLBpBaxsfmiyW/Zu5/lQV6eEhpK6Qpolh4iiHmYVtWdzDfR7yrN+UMwhjStXCf6MtYX5oitGyE4PhfVgx4s4uKUXZ/eXq1Ticoxy8dADsQLoTqlwKyADVyb7QfsanbNpkLY3bv2+2X4zbN92iXErRxqTFdP1TZp8X+h8OX7m323x4ICCtH3a4VeYNYyTh8hw9JDJdjQa2dn6/Duh4IxbQF+Jyx8fdnXPt/beeEwBuVGMY6ILxIvoDZ37ZdnC6ahazKc4nmiLkhbGJ2GbYC9pzEhY+rIkdVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:17:05 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:17:05 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:44 -0400
Subject: [PATCH v3 09/31] media: staging: media: imx6-mipi-csi2: use
 register structure to match hardware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-9-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=10227;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=3pDTYj54ZDo4n98QHzd+FXpEBsweRyFJ3wROB1HMjiE=;
 b=ojTUAaJimF+Sofh4Dt2/VKHqTvM5vIreAz/O3G2BuPLduq9bzSmmP04ASUskfB8msyX8pP74k
 mPtGYEG2p92AqCCFEcGB2TggE1mDA0CGSRBy/sGMnrCMxRvjAYoGxDy
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 719165ad-bd7f-49e8-61d2-08dde0efb231
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WEFZeGhJeDNhb2g3ZU5NYWcvMXZWcFdQNGx4aTgzVXNUUEhJQ2RzWlRRcW11?=
 =?utf-8?B?NTRtaUNtTXcwRTFvcURuTFZQSWF0dnQxVlNpZ2hxakhCL0gwWW9BZ045T2Zp?=
 =?utf-8?B?dFRDOEUyZnVNNDNHZzhnSnp0a1duQ3dyUmw2UkthS3djUTNRRTZrN0M4U2tj?=
 =?utf-8?B?YSt5V1RxdC9NeC9GU1FjYzdLVTdKaWxmMUlKK2tmWWVNdDJ3NzdLajZLWXdV?=
 =?utf-8?B?Q1ZyY2tqKzZ0Z3BEeWsyQVNXNjNicCtsSG0waU00Y21MaUlHRnFBZHlXbEZv?=
 =?utf-8?B?WktzemFHSWtRTzdpSDVpUmZpK0llMU42Y3IyZVFCczhEN010RWpaMjBUdHlS?=
 =?utf-8?B?d200S3ZIU3gzMGE0VEQ5U2h3N1RBbU5pRFdOU3FhQlM4N0dVYjg4QUZnOU9D?=
 =?utf-8?B?NFk2ZjNRTGJXWElyczY2dnZGeFdwd2EwY1JtSXI0OEVYdHFVR3FzNU5HR1JG?=
 =?utf-8?B?QkdWODRFU3B0OWFnSk43RWNLKzRhcE1PTEtoV0VsanBobnVPeHZGSTJXaERu?=
 =?utf-8?B?N1c5NlV4YTh5b2o1Z3d2TWFnZExWdXUxa3NtWC9HbUFTNTR5VXRqUlA2bWJ5?=
 =?utf-8?B?V2lqMG53cjlvNGtVYTcxSU1jZDdYcmV6ek96cFFtbzArd2FBM2V1cy9WSnR3?=
 =?utf-8?B?SnNzNnhHUGRld1pqa0cxK2VEU2M3ZnY3eFFiYVBxWU9BZ0M0c0pvUFljMm4v?=
 =?utf-8?B?QnYwTDNIYjhYYUpjRzlsQUdzRFJVSjNmYStoV0VWOHJlTi8zWFdTN0t0dHlU?=
 =?utf-8?B?NDRZQXE0Z3ZwYlpiS1p5cUl4MU1RVmVqS2R6T1lVUDl5QkFNM2N1ekZnRjcz?=
 =?utf-8?B?aVd4ZHlkQnNkYk1CWXhXdWxCaG91REZ4NXpFTVRESGR3ejB6WnhSNXdWT2oy?=
 =?utf-8?B?Vkx3NXRuWmloZHJ1NVNPM0xRZWVmODNKVEM2cGdob1RydEtqR2l3azVGM0VW?=
 =?utf-8?B?UWFYT0dWaTM2T1JTN1VFdndBcUFSQW83anJOeU1lMlBpWUhSYWVrYTB4d2tr?=
 =?utf-8?B?ZzV4Mm8rR3VjZjN6cGZxVEo5MVNnREJ1TnFaKzVDOE1xanRVUWNuT3EyRmk1?=
 =?utf-8?B?TENQb2ZwSVIrbzI4TWc2NlZGZk5GMGsvRkNyYThPT0d3bWhFaC9OUU5IUi8y?=
 =?utf-8?B?RmxKNFFpT3hoUm9sbjJiZUM3YkphaWxOc1J3L3RtNjdSMGhqQndIOS9uUUpQ?=
 =?utf-8?B?YWlHRDQ2SXlvRUxkQWM2S2E1WSs1VUEySUVCY29YaEt4SUZJWldJeE5MVlFi?=
 =?utf-8?B?M1F6cmc3bWg5YUMyQ3UrSTNQRDVnUjNMakZWWnZ5M1Z3eHBianRPaVhoVjBT?=
 =?utf-8?B?YmI2Qmt1eTNkeGlqQ3EybkJJQTg2M1Rqa3RHYXZSbXV1MXhweCt0WTlKaFlx?=
 =?utf-8?B?OGV3YytBRXB0NktyYTl0V0FtU1lINVNobFJFekRlNVNCLzM2b1BOSDhnRHFx?=
 =?utf-8?B?TjdVRlllWnQ3dXR2dGlvZjV6ajNWenlIQldFbDkyaElxMVc0dmxDOTl4a1lm?=
 =?utf-8?B?aHFpd2RCK2VtNFhkenk4V3d5ZU5kRUF0clc2T3l0UnJCWEFZT1YrSFE2UjhZ?=
 =?utf-8?B?SEdSZWN4dWFiQjBraWJLL0E3OGtoMlQ2OGFnNkZCM20wa0VSZVFGUmhpdDc0?=
 =?utf-8?B?NEI2WlM0dUxmaUFIWTdzYW53NDhnS05iOVFnMEh1L0xsd1ZrcEdKdmJra3hM?=
 =?utf-8?B?bmZ0V3phUFAvS1BnS0NuUnYzUTk2TmpaUGdpU0YxUkpZZXhzdWdHcnJVQ1Zm?=
 =?utf-8?B?Z2pBckxRKzBpWTlXblBBM1BLTDlXQWR6WXVPNWtsb0haZll4cWxBbEdlaHE2?=
 =?utf-8?B?MzRlNlU4YXlpSk5wMmtvUTlNaGZ1MFJMNUhVOGFweHQ1SG96YmxhOGYyQmw3?=
 =?utf-8?B?Qk80ZURVTVJrTTY1TnRkN1NzY1JtVVg2L1dRKzZEa2FhdHhwdG5TeTZaVmJy?=
 =?utf-8?B?RGpNL2Z0Y2ROTlF1cnNNdmxiOXNjRDMrV0JJaHhCSldFWXdJaFM5YlFPYVFZ?=
 =?utf-8?Q?gMVl5mKlTevnxKwvndFDjQFdn/Xpo0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VmZGQlJyMjlVTjJUYWpmaE9FVzI2UXRyS0Y2N1JNbVRicGFMcDFURkdybWhv?=
 =?utf-8?B?TWh1OC96NVgrc3dBclM4SEcxTmFMWjQyMEN5bUsyQVF6dUFZQ0RGVDh3cXVQ?=
 =?utf-8?B?U2tTSEZHZTNxd25udGwxUjJRdU44ZUM4K1hXR1dNNHhzWExJdTFTd3gzK0kr?=
 =?utf-8?B?dkhHbTdsZ1E4eXJoM0RkWGsxWityQWViakhNaDJHajBWZE1uU0pFS2J3eWtJ?=
 =?utf-8?B?V2lzd2g0UVJ1cDczQ011cWFsYklEY2hSRFdlOVVLMndDT3VTVS9kY29Ndk5l?=
 =?utf-8?B?OUJVd05TQ0dhN3ZPV0hLYldib2ErV3FyYW02OThYZmpVUDFxcWNEV3BqYVh4?=
 =?utf-8?B?LzdncGtWM0VaUEtUT3prTWxhNE92MWZSblE1NU1lOGtBWkF5YlBzcVlBWkhH?=
 =?utf-8?B?VUlUSUVjbjkxUy90UkVIYzNOaTNvTXozV0JpNDR5azdRSld5SWRtZGlicEN6?=
 =?utf-8?B?Vlp0eFdNZjFIN0NMSVFxN0RpcEtONHgvejhKc2pITVhqTXhJK253SGR2dkJN?=
 =?utf-8?B?SGlpWU01TllZZW12Qk13V3dZUjhmL2ZOUkF2TFB1dFgwN3oyN0h3SUxHeFhs?=
 =?utf-8?B?V0RZdmR1bVFnTXhpTWpDaDhQakhqa3BjSlRkNjJvZWo0SmRYakMyTCtENzNU?=
 =?utf-8?B?N29DNzBMeXV4a1NYbDVCQTU4UEdZVGh1a05LWmplMUFEWVZyODhqdUJYN1Ja?=
 =?utf-8?B?NzMyK3VMazFpcGhBdzI3eTdCYU9oQyt4NzNzcTEzNG1pWFdZbkhKS2c5ZzM1?=
 =?utf-8?B?ekZ2dzYvNDUwUHFodTlKYUphZGRxMHpvWUowQ256VkhKaDlnNExxUFJEK0h1?=
 =?utf-8?B?QnBMWWV2RjRTVHBlL216T1FIOW9oSGcvVFBha3BUeDdUQWV4c2RqZUgveSti?=
 =?utf-8?B?MkNvajZuc2tRQTlQVXZHU1dyV3FkdWtBM1NHc1g3MExuZ3pwdlJvL1NaK045?=
 =?utf-8?B?ajNrSXFRakF4YTlzR0NaT1hEcXJQNWt5bEliS3BQTEoyZnlQK2RKaHcvQ0RW?=
 =?utf-8?B?Qm9mZGcxRDlVR0p4ck1oR3EyWlMxTGxsWWt4dWRDbXJIS1FNWjc3TUZFNzFB?=
 =?utf-8?B?ZlBxRWtMN205WE1LTHJqU2FlS1dqNFlyVnNEUW5EYVRqR3RQK2VPU0tRSVNj?=
 =?utf-8?B?YjNDUnBxSUlSNWxBUnYvdUI3bGo0Uld5SzBpQkltaTVBV3hlR2p0Rk9ZazVP?=
 =?utf-8?B?K0UyazBqZCt1Q0p5bkpCMzJKcWVOOGlzdG5OaW11SmZ4bEdiU1NjVHcxUzJC?=
 =?utf-8?B?WmNnbXVOZysrNnZwdTJrZUl1dU9YVnFqNEFZQ1hzY0t4bCtKa0FXZFVFUEtq?=
 =?utf-8?B?MEF6aFZSc3R6OFVnSUFSdUp2elV4NUxPejA4WXVCdWo4ZFJ4c1hERiswNXNF?=
 =?utf-8?B?N0VEeXliUURLSkcrRkp2Q0F2SUlvajdpRGM3R3I0QVJtZWRIdHh1TE9ncVd3?=
 =?utf-8?B?THRSUE1wTHp2R0hyZG5ZNHBEZ3ZJNWg3eEJ3SHplRmw5TzEyZXBxUjZaN2tp?=
 =?utf-8?B?MUhveUlkNzNlQ0dYbUJSdjgySFpEMXJLbHlXOFlZMlhUZldWaCtOTzNMdXc1?=
 =?utf-8?B?ekpEYWRlTDlOMkhmRGJUOTFkRjd1NDc1bGpBZjg2TkFwNDAvMURhVXRLblFo?=
 =?utf-8?B?dFVDNC9kVm93bG9JbmNOODhvamJyWWVHbTZWMGVsZEFVdDhLSnVTaXdobnhP?=
 =?utf-8?B?di9GRW1KNGQzaTZMNm42R01PVUJWWEZuLzFEV2h5b2lqOExsWVNJWmFqVWZz?=
 =?utf-8?B?OEY1ZzQ4ZTliaFNUODZCa2VTREZPRk9wRkRXVDRCR2ovWEVKTDgzRHE3dG5t?=
 =?utf-8?B?OVRUTThvdkRJYVM4SUlEQ09DWE1tekw1Zy9BaWxpdEFzeTBoUEtCNkZXRVNU?=
 =?utf-8?B?eUN1NllocU9CU0tudWdPVDJaT0VRZm5QaTZjbm5SYWFZbS9JUWdxdlk5N05Q?=
 =?utf-8?B?WDhyUTRLbWZpZjlCdklJYWhiM2c2TFdhR0xtVUtCWUo3UGVDdkNKdXF4bDNo?=
 =?utf-8?B?YmtnT25zUXc4Y1pmSXlYNVVzNXdpL3ZuM3o2UDFJNlZNeUwxbmRGYTl1eWVL?=
 =?utf-8?B?T0ZiU2dSQUMzMVBFMzRpMFIrb21LeUJ2YWZab1VqcnJpMUs2Ti9YMXVSSEFh?=
 =?utf-8?Q?hLjU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719165ad-bd7f-49e8-61d2-08dde0efb231
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:17:05.0185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8laeaI+flk5pIsqrHtaCUG3ju/iefwp/WBXNvdEJbHjWaVlnwr/G6FbPgd3BY8XFxjacCz9ogsLwyNI6ZlQz5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

Use register structure to handle different versions of the DesignWare CSI2
controller, as register offsets slightly differ between versions. Add
register existence bits to detect invalid register access when using
different versions of the CSI2 controller.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 165 +++++++++++++++++------------
 1 file changed, 96 insertions(+), 69 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 54e9491d3428686288a5bc9bb58a5a0a25aca696..b04c1b98c088b8bfa66eb3f61cca8bb735b7eae4 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -34,12 +34,30 @@
  */
 #define CSI2_DEFAULT_MAX_MBPS	849
 
+struct dw_csi2_regs {
+	u32	version;
+	u32	n_lanes;
+	u32	phy_shutdownz;
+	u32	dphy_rstz;
+	u32	resetn;
+	u32	phy_state;
+	u32	data_ids_1;
+	u32	data_ids_2;
+	u32	err1;
+	u32	err2;
+	u32	msk1;
+	u32	msk2;
+	u32	phy_tst_ctrl0;
+	u32	phy_tst_ctrl1;
+};
+
 struct csi2_dev {
 	struct device			*dev;
 	struct v4l2_subdev		sd;
 	struct v4l2_async_notifier	notifier;
 	struct media_pad		pad[CSI2_NUM_PADS];
 	void __iomem			*base;
+	const struct dw_csi2_regs	*regs;
 
 	struct clk_bulk_data		*clks;
 	int				num_clks;
@@ -60,28 +78,53 @@ struct csi2_dev {
 
 #define DEVICE_NAME "imx6-mipi-csi2"
 
-/* Register offsets */
-#define CSI2_VERSION		0x000
-#define CSI2_N_LANES		0x004
-#define CSI2_PHY_SHUTDOWNZ	0x008
-#define CSI2_DPHY_RSTZ		0x00c
-#define CSI2_RESETN		0x010
-#define CSI2_PHY_STATE		0x014
+/* Help check wrong access unexisted register at difference IP version */
+#define DW_REG_EXIST		0x80000000
+#define DW_REG(x)		(DW_REG_EXIST | (x))
+
+/* Register offsets for v0 */
+static const struct dw_csi2_regs dw_csi2_v0 = {
+	.version = DW_REG(0x0),
+	.n_lanes = DW_REG(0x4),
+	.phy_shutdownz = DW_REG(0x8),
+	.dphy_rstz = DW_REG(0xc),
+	.resetn = DW_REG(0x10),
+	.phy_state = DW_REG(0x14),
+	.data_ids_1 = DW_REG(0x18),
+	.data_ids_2 = DW_REG(0x1c),
+	.err1 = DW_REG(0x20),
+	.err2 = DW_REG(0x24),
+	.msk1 = DW_REG(0x28),
+	.msk2 = DW_REG(0x2c),
+	.phy_tst_ctrl0 = DW_REG(0x30),
+	.phy_tst_ctrl1 = DW_REG(0x34),
+};
+
+static int dw_csi2_reg_err(struct csi2_dev *csi2, const char *name)
+{
+	dev_err_once(csi2->dev, "access to unexisted register: %s", name);
+	return 0;
+}
+
+#define dw_reg_exist(csi2, __name) ((csi2)->regs->__name & DW_REG_EXIST)
+
+#define dw_writel(csi2, value, __name) (dw_reg_exist((csi2), __name) ? \
+writel(value, (csi2)->base + (csi2->regs->__name & ~DW_REG_EXIST)) : \
+dw_csi2_reg_err((csi2), #__name))
+
+#define dw_readl(csi2, __name) (dw_reg_exist((csi2), __name) ? \
+readl((csi2)->base + ((csi2)->regs->__name & ~DW_REG_EXIST)) : \
+dw_csi2_reg_err(csi2, #__name))
+
 #define PHY_STOPSTATEDATA_BIT	4
 #define PHY_STOPSTATEDATA(n)	BIT(PHY_STOPSTATEDATA_BIT + (n))
 #define PHY_RXCLKACTIVEHS	BIT(8)
 #define PHY_RXULPSCLKNOT	BIT(9)
 #define PHY_STOPSTATECLK	BIT(10)
-#define CSI2_DATA_IDS_1		0x018
-#define CSI2_DATA_IDS_2		0x01c
-#define CSI2_ERR1		0x020
-#define CSI2_ERR2		0x024
-#define CSI2_MSK1		0x028
-#define CSI2_MSK2		0x02c
-#define CSI2_PHY_TST_CTRL0	0x030
+
 #define PHY_TESTCLR		BIT(0)
 #define PHY_TESTCLK		BIT(1)
-#define CSI2_PHY_TST_CTRL1	0x034
+
 #define PHY_TESTEN		BIT(16)
 /*
  * i.MX CSI2IPU Gasket registers follow. The CSI2IPU gasket is
@@ -132,42 +175,42 @@ static inline struct csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
 static void csi2_enable(struct csi2_dev *csi2, bool enable)
 {
 	if (enable) {
-		writel(0x1, csi2->base + CSI2_PHY_SHUTDOWNZ);
-		writel(0x1, csi2->base + CSI2_DPHY_RSTZ);
-		writel(0x1, csi2->base + CSI2_RESETN);
+		dw_writel(csi2, 0x1, phy_shutdownz);
+		dw_writel(csi2, 0x1, dphy_rstz);
+		dw_writel(csi2, 0x1, resetn);
 	} else {
-		writel(0x0, csi2->base + CSI2_PHY_SHUTDOWNZ);
-		writel(0x0, csi2->base + CSI2_DPHY_RSTZ);
-		writel(0x0, csi2->base + CSI2_RESETN);
+		dw_writel(csi2, 0x0, phy_shutdownz);
+		dw_writel(csi2, 0x0, dphy_rstz);
+		dw_writel(csi2, 0x0, resetn);
 	}
 }
 
 static void csi2_set_lanes(struct csi2_dev *csi2, unsigned int lanes)
 {
-	writel(lanes - 1, csi2->base + CSI2_N_LANES);
+	dw_writel(csi2, lanes - 1, n_lanes);
 }
 
 static void dw_mipi_csi2_phy_write(struct csi2_dev *csi2,
 				   u32 test_code, u32 test_data)
 {
 	/* Clear PHY test interface */
-	writel(PHY_TESTCLR, csi2->base + CSI2_PHY_TST_CTRL0);
-	writel(0x0, csi2->base + CSI2_PHY_TST_CTRL1);
-	writel(0x0, csi2->base + CSI2_PHY_TST_CTRL0);
+	dw_writel(csi2, PHY_TESTCLR, phy_tst_ctrl0);
+	dw_writel(csi2, 0x0, phy_tst_ctrl1);
+	dw_writel(csi2, 0x0, phy_tst_ctrl0);
 
 	/* Raise test interface strobe signal */
-	writel(PHY_TESTCLK, csi2->base + CSI2_PHY_TST_CTRL0);
+	dw_writel(csi2, PHY_TESTCLK, phy_tst_ctrl0);
 
 	/* Configure address write on falling edge and lower strobe signal */
-	writel(PHY_TESTEN | test_code, csi2->base + CSI2_PHY_TST_CTRL1);
-	writel(0x0, csi2->base + CSI2_PHY_TST_CTRL0);
+	dw_writel(csi2, PHY_TESTEN | test_code, phy_tst_ctrl1);
+	dw_writel(csi2, 0x0, phy_tst_ctrl0);
 
 	/* Configure data write on rising edge and raise strobe signal */
-	writel(test_data, csi2->base + CSI2_PHY_TST_CTRL1);
-	writel(PHY_TESTCLK, csi2->base + CSI2_PHY_TST_CTRL0);
+	dw_writel(csi2, test_data, phy_tst_ctrl1);
+	dw_writel(csi2, PHY_TESTCLK, phy_tst_ctrl0);
 
 	/* Clear strobe signal */
-	writel(0x0, csi2->base + CSI2_PHY_TST_CTRL0);
+	dw_writel(csi2, 0x0, phy_tst_ctrl0);
 }
 
 /*
@@ -233,16 +276,15 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
 	int ret;
 
 	/* wait for ULP on clock lane */
-	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
-				 !(reg & PHY_RXULPSCLKNOT), 0, 500000);
+	ret = read_poll_timeout(dw_readl, reg, !(reg & PHY_RXULPSCLKNOT),
+				0, 500000, 0, csi2, phy_state);
 	if (ret) {
 		v4l2_err(&csi2->sd, "ULP timeout, phy_state = 0x%08x\n", reg);
 		return ret;
 	}
 
 	/* wait until no errors on bus */
-	ret = readl_poll_timeout(csi2->base + CSI2_ERR1, reg,
-				 reg == 0x0, 0, 500000);
+	ret = read_poll_timeout(dw_readl, reg, reg == 0x0, 0, 500000, 0, csi2, err1);
 	if (ret) {
 		v4l2_err(&csi2->sd, "stable bus timeout, err1 = 0x%08x\n", reg);
 		return ret;
@@ -259,8 +301,7 @@ static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2, unsigned int lanes)
 
 	mask = PHY_STOPSTATECLK | (((1 << lanes) - 1) << PHY_STOPSTATEDATA_BIT);
 
-	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
-				 (reg & mask) == mask, 0, 500000);
+	ret = read_poll_timeout(dw_readl, reg, (reg & mask) == mask, 0, 500000, 0, csi2, phy_state);
 	if (ret) {
 		v4l2_warn(&csi2->sd, "LP-11 wait timeout, likely a sensor driver bug, expect capture failures.\n");
 		v4l2_warn(&csi2->sd, "phy_state = 0x%08x\n", reg);
@@ -273,8 +314,8 @@ static int csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
 	u32 reg;
 	int ret;
 
-	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
-				 (reg & PHY_RXCLKACTIVEHS), 0, 500000);
+	ret = read_poll_timeout(dw_readl, reg, (reg & PHY_RXCLKACTIVEHS),
+				0, 500000, 0, csi2, phy_state);
 	if (ret) {
 		v4l2_err(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",
 			 reg);
@@ -556,34 +597,20 @@ static int csi2_log_status(struct v4l2_subdev *sd)
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 
 	v4l2_info(sd, "-----MIPI CSI status-----\n");
-	v4l2_info(sd, "VERSION: 0x%x\n",
-		  readl(csi2->base + CSI2_VERSION));
-	v4l2_info(sd, "N_LANES: 0x%x\n",
-		  readl(csi2->base + CSI2_N_LANES));
-	v4l2_info(sd, "PHY_SHUTDOWNZ: 0x%x\n",
-		  readl(csi2->base + CSI2_PHY_SHUTDOWNZ));
-	v4l2_info(sd, "DPHY_RSTZ: 0x%x\n",
-		  readl(csi2->base + CSI2_DPHY_RSTZ));
-	v4l2_info(sd, "RESETN: 0x%x\n",
-		  readl(csi2->base + CSI2_RESETN));
-	v4l2_info(sd, "PHY_STATE: 0x%x\n",
-		  readl(csi2->base + CSI2_PHY_STATE));
-	v4l2_info(sd, "DATA_IDS_1: 0x%x\n",
-		  readl(csi2->base + CSI2_DATA_IDS_1));
-	v4l2_info(sd, "DATA_IDS_2: 0x%x\n",
-		  readl(csi2->base + CSI2_DATA_IDS_2));
-	v4l2_info(sd, "ERR1: 0x%x\n",
-		  readl(csi2->base + CSI2_ERR1));
-	v4l2_info(sd, "ERR2: 0x%x\n",
-		  readl(csi2->base + CSI2_ERR2));
-	v4l2_info(sd, "MSK1: 0x%x\n",
-		  readl(csi2->base + CSI2_MSK1));
-	v4l2_info(sd, "MSK2: 0x%x\n",
-		  readl(csi2->base + CSI2_MSK2));
-	v4l2_info(sd, "PHY_TST_CTRL0: 0x%x\n",
-		  readl(csi2->base + CSI2_PHY_TST_CTRL0));
-	v4l2_info(sd, "PHY_TST_CTRL1: 0x%x\n",
-		  readl(csi2->base + CSI2_PHY_TST_CTRL1));
+	v4l2_info(sd, "VERSION: 0x%x\n", dw_readl(csi2, version));
+	v4l2_info(sd, "N_LANES: 0x%x\n", dw_readl(csi2, n_lanes));
+	v4l2_info(sd, "PHY_SHUTDOWNZ: 0x%x\n", dw_readl(csi2, phy_shutdownz));
+	v4l2_info(sd, "DPHY_RSTZ: 0x%x\n", dw_readl(csi2, dphy_rstz));
+	v4l2_info(sd, "RESETN: 0x%x\n", dw_readl(csi2, resetn));
+	v4l2_info(sd, "PHY_STATE: 0x%x\n", dw_readl(csi2, phy_state));
+	v4l2_info(sd, "DATA_IDS_1: 0x%x\n", dw_readl(csi2, data_ids_1));
+	v4l2_info(sd, "DATA_IDS_2: 0x%x\n", dw_readl(csi2, data_ids_2));
+	v4l2_info(sd, "ERR1: 0x%x\n", dw_readl(csi2, err1));
+	v4l2_info(sd, "ERR2: 0x%x\n", dw_readl(csi2, err2));
+	v4l2_info(sd, "MSK1: 0x%x\n", dw_readl(csi2, msk1));
+	v4l2_info(sd, "MSK2: 0x%x\n", dw_readl(csi2, msk2));
+	v4l2_info(sd, "PHY_TST_CTRL0: 0x%x\n", dw_readl(csi2, phy_tst_ctrl0));
+	v4l2_info(sd, "PHY_TST_CTRL1: 0x%x\n", dw_readl(csi2, phy_tst_ctrl1));
 
 	return 0;
 }
@@ -719,7 +746,7 @@ static int csi2_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	csi2->dev = &pdev->dev;
-
+	csi2->regs = &dw_csi2_v0;
 	v4l2_subdev_init(&csi2->sd, &csi2_subdev_ops);
 	v4l2_set_subdevdata(&csi2->sd, &pdev->dev);
 	csi2->sd.internal_ops = &csi2_internal_ops;
@@ -776,7 +803,7 @@ static void csi2_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id csi2_dt_ids[] = {
-	{ .compatible = "fsl,imx6-mipi-csi2", },
+	{ .compatible = "fsl,imx6-mipi-csi2"},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, csi2_dt_ids);

-- 
2.34.1


