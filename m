Return-Path: <linux-media+bounces-40685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA0B3060A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BBC95C512C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08DE3126B2;
	Thu, 21 Aug 2025 20:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lFW8I+Pe"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE136CC7C;
	Thu, 21 Aug 2025 20:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807549; cv=fail; b=Y6vWsxWB6SvA946eYUl/ppNIiJ657+5HnROaHUtpBNrj6cWoSDp0vOsMGbuXgUjbsIoNe0H4v1afSc/w/q1+C2n7Nvzm/GgmeGdyIvmlJ7KOp7niMG6BdL/713BxPUa4tr8l2t3e6/YGDA+nQnAkzJMaMpFNQgDPseUHmPc+mKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807549; c=relaxed/simple;
	bh=1WQVbR0QIjZlxpVNSYS7/UdcSVZpWqMWWVWgJ5hlf4I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mJ7RD2w8duuNHugHVz2uj5L7w1AEfDL5JKPyb6jxEiO3OswfKxg15Rl1xUQS2+2V0W+ZEnKs3IbWcrFOmDS6u/8anj9aAtS8rs93/xZDuzwErbZuGeoQP29IVQdHcxCAQd90lsa7RgaTv4ziAaADdoZBeu0nwJG9hWFf3ZqPzPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lFW8I+Pe; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghSn9yQ5D/CLcUQe5Qy8Td3hcuo3T/CGV0bMmmj6mogWCul6K9xPmUMHHO44O/CT4/dlMjoH0BhtdgLTL7V9dFcoX9AgpcTf3inFioLYMf+9makwqGbCHoOa8Zwu902dJZdpdMxISGHmFq5fqhi9Ca3fgRvG87E4UTh6nScpTppIFFGGj4dGlI4c1ynpnpM+r+EtNTS8/JpHxbQ0gdoukzcYT1LUv3Ks56ySfTJUuxCv62eEvryph9ZLNHtgrf9QMKcsBNnG4lcaYC/a/qdjOE5rQk7buhRjeNlpaNPjqqqW4s0AzX2apuZv330d2fqt1OpiGRKIQeTK3lP21bfOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bBvwMEBSuMgy6gHlgkcAQPLv/aQOcebBwUOsnNmAgM=;
 b=ehz/OybcyeQzeW/EUuXuQthjLsb1zlPM8OOBAkv5c3n3yGXlE3mLNTyjp71cFrmxV+yqDQBk5VVR4dTqGhgg8/G6puRRuj5HqGm8ofR9KKyaOfojvBDgl7axsmNu3F1uFPs+UwuWEfGmn3tvJhjB8Jk6DN5fJ/81qlSKdrAQwAW3aMo5/sG7rnK6j0ALbAYTapSkj1xJWn0/HgqVRoX2GqdpGiBNuGLppg3MNG/sRJip8CsoNy2a7H4cerUK5khWnR0uaNkOcKyg5MXn8t5lOnXThl6c8hMjhGUEaDub4ZhzvkIFtjT/aLpxMtE1sxTE7LvJRBEfNcfz5S6FoGy91Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bBvwMEBSuMgy6gHlgkcAQPLv/aQOcebBwUOsnNmAgM=;
 b=lFW8I+PeGV2gQoMCjypu0XwclK6S7KDEFMWt7FVwECCAPC6psjsRxpkDV+QsA0/sA+3UOm77l+TASMDQiEBl1qavRArmqnvj12MJeT9kzWOJ5/gFvX67dX0HzgVg0Tx6Zohl+YIhdgFXk97SG4+JnauUzrTQlBU0SAuJI4gIsfcd+yLr+8wOOwUyASHtgQ//au7AFajVW0tOxC+i/b4Sk+pGgjlOHScv2ZzQBIUZLUEAaj3fzwdFRVplX7YGgQ3af1O1xMLbvWGORrF+ZaYS4i1DVWRTIoV+OB7iaBs5ztlYO5nnGyVoLNRrFfsrbx9wXgb/bkcke0CbzDUBRx8+iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:19:04 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:19:04 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:16:03 -0400
Subject: [PATCH v3 28/31] media: synopsys: csi2: Add customize
 get_frame_desc() callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-28-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=3176;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1WQVbR0QIjZlxpVNSYS7/UdcSVZpWqMWWVWgJ5hlf4I=;
 b=31475ugAfWpyk2RZqIcHvq4YTwvNBiqwEplWufjE6Mmz84eGDketNnRHF3f6ZITkiX3Bo1548
 GG++bTkVLgLDlCoeLbPP7C+VT+nriNK7ngk3s3zHxV0Q6B05W/MSTXg
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 57365169-a6f9-40fc-5743-08dde0eff92e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?b1AvQ0FUb2hRSm9FbEtjMFRxZmw5OWFLZTlrd25wQTl5NHhHTHU3TkFTZXZQ?=
 =?utf-8?B?NDBEcW16T0dUWTJMZHZHOWwzdUI1WEc3SzZtV3AxOUZ4dm9RRzB6ai8yQlpi?=
 =?utf-8?B?aHprWVZlMnE0UTVhZFlXYzhzR2JLRE5Ud1J4aU85dXNVVnZxYWFIb2N4SzE5?=
 =?utf-8?B?TEZNMDQ5L3EwZUFSa0tvWWxXS09LZ1JtVFBrU1ZoMFhoNlZNT0VscTJNMExy?=
 =?utf-8?B?QUhGeHkvSmVEdXNvWjJhRndBVi9PMUV5OEtadDQrQVJCY3luTkZvUjV5WlZo?=
 =?utf-8?B?cCt5cGpubVp6bWRPL3lDaGhlR3NCTEhOdENVTDdJUDZ5a1B2ZFJyUVRuTjFV?=
 =?utf-8?B?S0l5ems0QTNZbFdNZGZxNlRteDZGQ3hDTkI0eWJBYTZUQW5SajVpMUY2TXR0?=
 =?utf-8?B?ZlZMdVB2ZGk2OExaVmQzV2M1S1k1V1c2VDV6cjFRZVlJeEdHbGp0K2NGaE1L?=
 =?utf-8?B?dWEyTXdKTENVS2JqcFEySEM0OEh6TTZaU3lKZFhDSnlFdEVYWG5zdzhnejFN?=
 =?utf-8?B?MFhYcTZmUEN5dHZBTGJvTVNMUUlFc25uTURBUFdUWXFqYlp4emdlMzdLOWZr?=
 =?utf-8?B?dHRlc2xJR1AzcTRHM0RaUk5ZWGVDZGpmdUlta0NlZFNjcEdhcUFVWG5Ednlx?=
 =?utf-8?B?ZkF0QnA1L2ltcXZZRUVBYU1IMExEZ0RFRXJoRTNkd0ozeEdFaW0rWGdFR002?=
 =?utf-8?B?NGpBODU5M25BZ05tZ2pGKzhtOWRtWEtZTFB6Vk5zUEtvMVZpUnVBZnVER08z?=
 =?utf-8?B?dWJ5eS9qRHBRVlNxd1k5N0U2U09JT1ZVaHppSnlFMzZyTVFrV2l1bC9yL3hi?=
 =?utf-8?B?dzVEbGVpUlc2dUVKM1IwOFlPNkVuUVpOdnQvVHA0d1MzZ1BMeG1RR0lRTmsy?=
 =?utf-8?B?ZVJ6ekFPUjJ6dXRNT1RlVWVCT0pYczRJTGpMWWRaZDdQVjFFQjJ1bmZleURo?=
 =?utf-8?B?THdnU3dVRXBpdHNMSWtmVit3dkZSRVN3T2RSeEE5OGlJalJoOC9tTFB1ZzJs?=
 =?utf-8?B?cnJ3SW5DVHIwck90bVlTczZFRkY2YVFBbTRzUk52OWFNNnQwWkp1RlBqcHRq?=
 =?utf-8?B?ZFpMUVkvaWxpMlpUZnRrNk03VHZ4RGt3Qkg4ZXJJUk9CcTdqUW1lU1hBVGhw?=
 =?utf-8?B?Tjd3U2RCRW5UQ2R6MXlzc0NlOGZicDQxemJhdVcyRGNUeVUvUnIzMGhXS2Qv?=
 =?utf-8?B?SzN4YXJZdUJ4cWhRaTdwQ3JFUlNkbmttSzFnQXhHTkpFcVVVSktsODFUdy9t?=
 =?utf-8?B?MVkvZnM1alFCa01oeEhsOHNvdUNZWDVHbkh0aE40WFdtcWNaY0s4aHBoTm5T?=
 =?utf-8?B?Yzg4dXo1OE4vYXFQbUhDVjJaNy9HVzNCTjJUMFV6cGk1aExhbEZCZWJYMkJu?=
 =?utf-8?B?SHpyeXU2UnFEb3NObXlNTWlEbDVmSG5VdkZYY0UrdjFDeWplcWtNV3JVeFdS?=
 =?utf-8?B?R3hZTTVoZlFQV0xheXpsTnhEaUhvbFR1UkVzZlhQR21vTWxqSHpqUFNLVDkz?=
 =?utf-8?B?M0NnbWRoOWozSDlvc1dNaWRDZ2tiaFoycHBaU1dLL1ZwMHFSSTdCMVJPeHBu?=
 =?utf-8?B?TDF4eEJlWVp1a0VpNUZjcUZBdGFRTGtMcHBaOEpNUi9zUU1CZkd1Nkp5TkdU?=
 =?utf-8?B?TTlyekZvK0Npdlo0cFJ2aCsxT3hxWWhsV2s1eml4NjJiRlZ2Q3BUSklPcXRW?=
 =?utf-8?B?bzNGczdoeDhydW1scXdCc2lOeWlzSk5jcVNKQUFTbUtDTjdPQldlZlhQWGJi?=
 =?utf-8?B?c2tsR1BYVFk1WTZtMmkxMDBmZ2VESEVyS2FqWGU0UGQvTWFkV0dkdmk3QUQ0?=
 =?utf-8?B?MDIyS240VWhJUkh6ZFlqZWgzaEdxZ0pBYVFWd3VOOGFmQUo5cUNsdElyMmp1?=
 =?utf-8?B?WUZ6Tkxpak5RWXM2RVFTY01OdzNSaUtGTEQyNkpxd21zd3k0YTRJbkNVeVpR?=
 =?utf-8?B?WWxUZm5jdnlqUTdma1JZRHhKUE1CTXJOdEJCejdtWGVqSFkwMFh2bi9PdGRX?=
 =?utf-8?Q?D1L8ISu5x2cyOScNljkHZRLBi6Lux8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dTkxdC82QTFnMXFyL0ZicHpyb2Zod05mcG14MG1ETlJnV2Q5YUt1UG9WUXBx?=
 =?utf-8?B?cGdaSGloSE12bWNVM3lhVURzalNYdDhkbGxITHBCc0lCMEJBdGxwbndvT3g1?=
 =?utf-8?B?c09GUTdxbjVzUmVXWmFVZmhPRWxjQlZ6Wjg3djFzVWMwU0hqTU5qUDZtN2RY?=
 =?utf-8?B?T0VEZlJ1Vm90MGFsVnNiait4Q0NaQnJVZWZXMFZHT05vMXhiM2NkcXpUZm5D?=
 =?utf-8?B?SmpEbUVHWTA3a280UWljSy92aGt6VUVDbEVwUkVVc3RMSmUwV3ppTk13Y1pH?=
 =?utf-8?B?dnppTDZRQWxSS29JK2NNellvaU9UMStvSkRoVmI4RVFQeisyL1JTeEpydkg5?=
 =?utf-8?B?eUFHbExTL2xYS1JUREpIRURQRHNaVWlFeXdLd0QwQU9jM2E1cnQrL0hvZnpq?=
 =?utf-8?B?bXRuNSt0M0VicGxmall0d3N4ODJHQmVYY2VIRXJuTzJTcHczWlpGUlJGeitF?=
 =?utf-8?B?U3NTb05OZUhOQitwYU1SdU12VWdINE5SWU9SM1JMTVNRc2pJREtxc3QwazZ1?=
 =?utf-8?B?bndCbytTYURBNWZYQnl1OVhEOEVTYjZPVUpzSFFzZlJtemRDWTdnRGNkdTI4?=
 =?utf-8?B?MGxCQjk2UEd0djJDVy94T0RldEFVZXk3bG5vdk1HNW94ZDgxRjJjOUx6L21k?=
 =?utf-8?B?SmtNUlQ0R0duVmIzbHk4a2V2T25HZXBkM1lnRnk0dGNFRHI4RWdKYTBoN2N6?=
 =?utf-8?B?ODdSTm84b1VhWjVId214ZXFjcUE3aVlHczVHMnBVM3NNUWsyRzY1cFVzVnVX?=
 =?utf-8?B?cEFBZmpBRkNDekcwMjNnZEhtczlndXhzdWNZUDExZzVsMEFsQ2JreG5EZXpX?=
 =?utf-8?B?REJXZTg1djZNZGRmSlZMcDNsdlkwV1NueHA5MHdYRGdmL0YyVEZ6WEhDODhX?=
 =?utf-8?B?dk4vcGNTcG5SajRzN0tLVFhteWJIMVlnV0ppUkoxMWhqRGJDTHZYQmpNK0pG?=
 =?utf-8?B?eWt0RWpsZ0VwaFp6Y0pibHoxMjdUSS9TMDFWN2h4RUtyeUQwT1hNNTMxSFd2?=
 =?utf-8?B?Uko1N3Y5RE5HUWhLMmhnUkNwR3ZZdlF2bjNueHRoc1BJZm1HS21XSklGSTFM?=
 =?utf-8?B?ZDQ2MHVScjhhb2lZUUl1UWRVSmFPUHNFOElzVi9zYk5oYXFHSVZXaExjdjFO?=
 =?utf-8?B?d3BWaEIreEw1NWptWXBxVmJpRFJEWVlDNG5VdHJOUU1xWndOelhkTGxlcktx?=
 =?utf-8?B?aHg3Z0M5SVZ6NWQxKzhsdUM1dFdLdDdGeStCakNMZ1dDVEdFZmhra2tGSS9P?=
 =?utf-8?B?U09DUTNaMTM3OTg0RVFSeEQ0ck1KdjBad1lMRmdDM1JOVktxaURUTCtSYldk?=
 =?utf-8?B?TjVRc3AwSUYveHZ5a1BVckxDa1oxTnJOTHhKSUNyK2VmVDNSaCs5RjBPSnFN?=
 =?utf-8?B?djFURm15N3doN2wvU2xXZGsrNTJoMFp5RnFTYnE4alN3WnhKRTRJTU9JQlhS?=
 =?utf-8?B?ekYyaCtxZ1FxcDl1UHpFOWhuNjFjVURxdTV6dEo2VmVqT1g1MlRFK2lhWE5N?=
 =?utf-8?B?RUVUUjV6dHAzWk9aaGE0Z0RwUThySE16YU5BZm9udFJkNW5PY0VFZU8yMTc0?=
 =?utf-8?B?d05PTVFrUXhOMENOUGUrUzdISzVzWjBLOVJzRmM1SytzSlErSldPYWFPY2Ro?=
 =?utf-8?B?Y092VmJzV1BxOHEyUFJJZjVnRGJ1bmxEbDZZeThmUUxYais0RGJ2aThxSVJQ?=
 =?utf-8?B?K1FPZldCTGR1dCtyWjc0eTZncms0TGVYeXp6U1N1ODFMS2JMaklBNHdPM0Iw?=
 =?utf-8?B?MENGTm9UakFOeUF1ZVYwb0NFL0ZTcloxTDJDRUVxOWhGelBlSVlNOTBxSDFU?=
 =?utf-8?B?Nll3YlJCT0d1amFUN3drSGxGVGV6cGJJRTZWbjlPdSs2WUpUTTYrR3hUSGVZ?=
 =?utf-8?B?aHNtRyszQnZrNFFEaFNXcDhmMjJXbEVCNTJaZ3pkZXBpNXZFcEgzN1FyWHNT?=
 =?utf-8?B?Yy9IZlVTL1p6RXczcFRzOEEybjNFSUVUQnozWVUxUURRcE5PNitPWEQ4R2Jl?=
 =?utf-8?B?ZTd1cEtxditjUW5jSW93SUhQSVZpRURVdWNKWUxWWVlEMHRxS0UvbG1HZGZQ?=
 =?utf-8?B?Ykt2dDNoQnR2aE56eHkvWnBtOVZJanRRaTVIbjRGWlNoRFIzUUJsaktNUUoz?=
 =?utf-8?Q?5lCM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57365169-a6f9-40fc-5743-08dde0eff92e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:19:04.0442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ph4QM4H5MYvc3ED/27nRHm/Y93h09a5tzromjDVvT/CVZfhDLSKewoCg3lPafSEbVGWE1PnuS283/uqzkerpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Add customize get_frame_desc() callback to work with existed isi drivers.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 73 +++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 5ed65e89d4d9a75b245ebc6f28df989dcbd00b7b..695159f463f872ee0775c271b8e1c4e1d289de20 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -761,6 +761,78 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int dw_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_mbus_frame_desc *fd)
+{
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int data_type;
+	int ret;
+
+	if (!(csi2->pad[pad].flags & MEDIA_PAD_FL_SOURCE))
+		return -EINVAL;
+
+	memset(fd, 0, sizeof(*fd));
+
+	data_type = media_bus_fmt_to_csi2_dt(csi2->format_mbus.code);
+
+	ret = v4l2_subdev_call(csi2->src_sd, pad, get_frame_desc,
+			       csi2->remote_pad, &source_fd);
+	if (ret < 0) {
+		dev_info(csi2->dev,
+			 "Remote sub-device on pad %d should implement .get_frame_desc! Forcing VC = 0 and DT = %x\n",
+			 pad, data_type);
+		fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+		fd->num_entries = 1;
+		fd->entry[0].pixelcode = csi2->format_mbus.code;
+		fd->entry[0].bus.csi2.vc = 0;
+		fd->entry[0].bus.csi2.dt = data_type;
+
+		return 0;
+	}
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *entry = NULL;
+		unsigned int i;
+
+		if (route->source_pad != pad)
+			continue;
+
+		for (i = 0; i < source_fd.num_entries; ++i) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				entry = &source_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!entry) {
+			dev_err(csi2->dev,
+				"Failed to find stream from source frames desc\n");
+			ret = -EPIPE;
+			goto out_unlock;
+		}
+
+		fd->entry[fd->num_entries].stream = route->source_stream;
+		fd->entry[fd->num_entries].flags = entry->flags;
+		fd->entry[fd->num_entries].length = entry->length;
+		fd->entry[fd->num_entries].pixelcode = entry->pixelcode;
+		fd->entry[fd->num_entries].bus.csi2.vc = entry->bus.csi2.vc;
+		fd->entry[fd->num_entries].bus.csi2.dt = entry->bus.csi2.dt;
+
+		fd->num_entries++;
+	}
+
+out_unlock:
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
 /* --------------- CORE OPS --------------- */
 
 static int csi2_log_status(struct v4l2_subdev *sd)
@@ -799,6 +871,7 @@ static const struct media_entity_operations csi2_entity_ops = {
 static const struct v4l2_subdev_pad_ops csi2_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = csi2_set_fmt,
+	.get_frame_desc = dw_csi2_get_frame_desc,
 	.enable_streams = dw_csi2_enable_streams,
 	.disable_streams = dw_csi2_disable_streams,
 };

-- 
2.34.1


