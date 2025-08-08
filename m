Return-Path: <linux-media+bounces-39154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA522B1F0BE
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F9363AA207
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67E928B3EE;
	Fri,  8 Aug 2025 22:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PBLRpYXR"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013001.outbound.protection.outlook.com [52.101.83.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3461728C022;
	Fri,  8 Aug 2025 22:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692815; cv=fail; b=M1oxIR96NYTGS2DjhJZN6u8WUBBEHdswOu5ypJOMhxvQOXMRh096tZC1EjTkpEPdFu4qoQsUMzXufRDUtum8j48zfz0T7VDVO8TEw+KnJCtsibE59DlQAB0W/z0TvtEp+ABY2s3kJkoTM+y80OWAC0GvCrGXn0TH1g+hW3kvjqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692815; c=relaxed/simple;
	bh=tHEvKeBXgs8vO+tzMnnh+R0CSMTmrZYJGPxhYU5qH2g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lMyp4FX3zPJfhz0SNES+Zy81eXKh8jV1TufJKJYSVT4wIYoOD3FX3mszIL1NAjYMa3Va2iZr+i/FHJ+mLq68eTvpWOmuZav7kog6FomIZoZ+uDJz2UoPlXNpKdXRzzD0Y29FzFBvly2yL1FZTmcU84E69/9LQdKL/IW+7cRYFtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PBLRpYXR; arc=fail smtp.client-ip=52.101.83.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khGnbqqcQvMpobojDXu3mDIT94zJCOApfp82iy34HKV94tEDxKK5WxkLcO5a54bc4N54+rY6Y//iA/f3Y8o10VQBW85CIuavepDMpOgoPKmVbIpD96ZiJNEknUIMhAlAmUXaesii3XbtsQxvVfj+fpg+ce36vWmVxnnMm5HaAhEvQ2ecf7WIRf261qvF9MKObi+DJQIcR7u03z1p/gvIZvQvVwQm9YHE8o3EV+7eswXCw8CP9BBhk4J/TI2QTb9k7rvYGYpSUEd6xcEWROlU9SHmyA3PffG9BZvo+UUtU00bjypifnM0Sesfby6ui/pZ5UvLF9Oib73OlKPJP6zdPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRvN5RgF0eA3pjxu2du2u6FfrqEJs0q0KJldTMM+ZPA=;
 b=h1jeVYXZo34tc2jHpOrPW3+Q1t4q2G+PnWW6v5uo9v9b2IvTBm4dnHOxxl9RRvwLfWW61DO/UNHLz4tlWEoGq/VnH6tVOHYxeQtDhangzd9srS0+dOie4Ov2/jWer86Zn/Tjv+Qhv/dXVskDUn9LJnTm4p0jsvJhXZjpKrbSCTHgg9TuJ+WqB1CiLrYtxYf/B2/30amWwES8t9lWXbdZF5r1jYR2ThS7DVlwgWdtoJuBpjGxqN9d4XQqAuZOnP2uQXrfLBN79bikMcukg1cZR/sdtudezBshsPUlj4f0SwY//xnUoCKMVt1AxsBQ9ylJN8k6jdlfIH6ns+3gZe1SJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRvN5RgF0eA3pjxu2du2u6FfrqEJs0q0KJldTMM+ZPA=;
 b=PBLRpYXRHTIzF+lRnoa1lYPdFyjygyhg/vtp9nLzLCLmiTwHaCIsMhe89VSyw+6rOylobYOYEGxR+O/SVJUe0+lE/JlHFRbS5Gui2LRXrwB3koXzQPl4hucijbqW2A9UKpXRZd/Fv2tmlgKeROkXsX/Et1ooIoP30lQh/M0BwCDcbPFQZfvwIXH2izn4eBLpvah8LwjBNmVrKr/W8XpGe0j8Rg9vf2sjkIlki4KCpuy7suqn/DzkV1PHp0KtHDIfP851M8+DnokIliqlaRZSXrQc1KbsrVXS+Sb0IdkvjISI0a0AddZw57oVt96szTnCCIbUdqJROD90iJR0MSmTkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:40:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:40:10 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:05 -0400
Subject: [PATCH v2 02/32] media: v4l2-common: Add helper function
 v4l_get_required_align_by_bpp()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-2-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=2204;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=tHEvKeBXgs8vO+tzMnnh+R0CSMTmrZYJGPxhYU5qH2g=;
 b=V4TfdNvhIbqNtlwpbvSipN8ZIiRWYryY97KWrhw+o+OSwsIxQBvbWvGaMkHR4151+AFIeHUFW
 ri3f82hVjkWA1o7ZfmHstjIhNVh3XvFchQBgozrycR1NIPRzkR+5l8G
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f71ffad-3578-4fd8-4f5b-08ddd6cc881c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VnZibTFLZTc0OE1kd01TVFBTT0hnNnNKY0xiK3lQNDVmNjNsc1VSQmpmWFFH?=
 =?utf-8?B?dWl2VEY1MU93LzhQdnlKZFFQdENoMWlSaWJLVzdIUHVjU056aFRkdC9yL3ND?=
 =?utf-8?B?ZXJOdnJ4S3d4T0oxdXVjTVRyUUdOYWZNcDhjSDRBbEsxdzFiNzY5SlhmZ2Vt?=
 =?utf-8?B?SStCYlVya1dHRWZja0FCaEJPUVBNaFBIQlVzbGhpZFhjMml4Qmx2ZmxHbFNO?=
 =?utf-8?B?WmQ3bXArT2hrUTMyRUhsZjhpRXo4NWdsTmtwUzR5L203Z205TVdnWXBYbm5W?=
 =?utf-8?B?WnNwRXJua2g5dU1QYkdFQ3ZFUS9uRTBhcGNwYnhWNFpReEJsUDdkeWVjTVF0?=
 =?utf-8?B?YVR4MmZvUjduNmhTTEh2d0FRdWhkdVFQZzVLWUwrWlJRTFkrbjBLdzE5aXhp?=
 =?utf-8?B?M01CSXRsWEVkc3E4NEIxSDRMMllCYTdrZU5lM2R0MkJrTVpkSEJVdmNFQ3FO?=
 =?utf-8?B?WVVMc3dlaTBkK0pNK1duM3lRK2JlVGQvWGpWd3BEYzBhZGZ0SndOUjQ3MWFr?=
 =?utf-8?B?bklWaGhBclphTHFraU8vZ0JsdUdic1BNQTBvd05hU1pCRDFjb3gzUGdsdzdt?=
 =?utf-8?B?TG1sZ0o4QktQazRSNEVtZGNPeEt3RGVsaDBoelFvUXZsYjZSdnZZMHhQVHp5?=
 =?utf-8?B?ZVNNN3ZXWjR4M0dub3VuRHNvNUoyKzZDcHJrTmt1T05HT0M4SWV5clBzNUp4?=
 =?utf-8?B?Rys4amZPVmQ4M254L09vSWdwVzJhSGpQVVdDdGJSTG0rdmhJd3dzUS8zanRq?=
 =?utf-8?B?U0xFQVp0d3FsOUVNOWJjSWRyYWdOam1RMlhZTnpmaERJY3E0TGoyYjhzWTBx?=
 =?utf-8?B?ckxXNlhRaFhQZGlSamZ0NXpBTm83S0JUMmNyRkUwQjRraW56MTNlSDRSQ2ZQ?=
 =?utf-8?B?N0NYRkhzaVIwODQ1T0drM1FUR29YZzlhVU9Gc1FVOEE0SGNZWHR1SStOS0ZC?=
 =?utf-8?B?Q0ZndE9lTGFaTEdOTXdPL1U5MlJXd0pLV28yMVEwUzZRc0s3a00wWURkRER6?=
 =?utf-8?B?WmlZckVJSCt5OS9qM0RnWVZnNDRwY1FhcldYSWs0eEphU1pKVjJKMDNVODlT?=
 =?utf-8?B?dDlSNTZkQXkwVzRPTXlRY2RpWmNQMC9ZdE9udy9aSkFaR2ZHS2N1RUxyTlI2?=
 =?utf-8?B?bWZ0dDYzdEZEL240YTFlRm1Jb1UwNWl3VUwvVHVDeUVWaGFOU3JCL1Y1bnJx?=
 =?utf-8?B?Ykt2anZUMlNYQVJKeVI5UndPNXpwUHZmZHdFNmVOciswNmU4bUZiY2lnU0Fw?=
 =?utf-8?B?ZmMwRmNRSVRWN0NpeFMwUnpUVUFkeitPdUdoVWJDYWM0eGpMczMrUktIeTRv?=
 =?utf-8?B?M3BON0ozU0djNmJTb0VrZEhqcXEvOWY5Z1l0ci8rTVAzTlhhYUorcW0wajFG?=
 =?utf-8?B?SWoydXkyT0NkUHkyVmZRZVFCNC9EcmVRam5uRUV6ajF5cU53NDNVaUV2aDQ3?=
 =?utf-8?B?S3I4RFQ2TVQ4Ni9JUk1GYlFVQkVtaW1udHpnVzlpeE0rQnlYMjYrVTZBaUlU?=
 =?utf-8?B?YU11S05OaS9NL2JSMWI2aTFoNVp4K0RUQVU3ekdVYUYzSGtpSUU5enN6eEFW?=
 =?utf-8?B?ek80ZmF5Vjdid0xwak1LTkVjdStacGJsWm1HdXBEL2JJeUhLTlJ2U3ZvWWlw?=
 =?utf-8?B?c0JETGQzdHNHMElyZXBUYXFHUStOaVlTRUc1Mit4aXlQNkprcEZkSWU0Uksx?=
 =?utf-8?B?YWhzcVJ6eW1KUWlhOUx1QXdJVzREWWw0SlJ2U2U2THBIWjljR3IrNVcrNzFt?=
 =?utf-8?B?R1hrSVRVdkI3ZEl5bmQ1TDREWWdmcW84bHJXUEdGNXdWWmN0cWFlQW91SW85?=
 =?utf-8?B?UUMxUmtYTzlvcVpIVUlIbmh2VU50ZVZaR2pLMklWNFNqbTRLK2M4dTFpdHBT?=
 =?utf-8?B?TGNLYlBHYlNPbTlhSUZuRElXbWNETkNWVGQ0ai9oRm9tVlZsRm93TU1Gell0?=
 =?utf-8?B?aUcrMUhZY0JHTXhSdWUzeTBpQUxsajhPOU1iNkN1Y2dHQ1VLeEloZU5RamNs?=
 =?utf-8?Q?N4Bm5DoR+ktTmgb3+dNQCE22Yx/FtY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WXY5eStPcS8yZkVSb1prekFtNVdyK1pyL0xVY1pqU2lQeEJvRXFLdS9kdFVL?=
 =?utf-8?B?S2VCS0xwWXQ0OHRKRWtuSm54OWNweWFpcWhnYlJ3RCsyRXFjVktUOGl5SHd5?=
 =?utf-8?B?eHVFVzlNbXQ2UWJGTzhzNEgraUFHejFiSk5QcThLbTdiU0hyY2VxNGxTSXEx?=
 =?utf-8?B?dEl6SE9aTW4xTUFyZTk0QlZJVWx4OXR0bHhVOFRqVnBseHlpNXpLcmRjNyt3?=
 =?utf-8?B?TEdpaVNUOVlubWlWTnRLTUlpUk9sU0toOFNUclhvb1NIRG1wZDh5WlBHOEVK?=
 =?utf-8?B?RVVoSHltMi9sZ0xmWGFmMTNnVTdvTExwUEtOOXkray9JRkJxdERXT2Qvb09M?=
 =?utf-8?B?WUh5QjhLTGw4Ty9QVnNwU2Uvc21oTjQyVVM4aC9UNG0rTTRDb3YxNjVlWlRY?=
 =?utf-8?B?d1RTSjIrSlk3cFZkOWZGK1Q4akx3czQwekxacUd0SEUvUzlrTDdOY0FmSURr?=
 =?utf-8?B?VXlodzQ2bXJ6dzNsOVRENXljaklDWGhOWTllQ1gzbGtlUmwxakdibFROYzNZ?=
 =?utf-8?B?cmpsMVFVQUJBU0xHZmhEV09hRy9LRDRWYU5lc0U4V1hpUXNEMFh0ZnlCZTFL?=
 =?utf-8?B?S2RQRDJGaE1mMThGU0pTS3JvZW8wbkxEWXFlUkFEQzRhNFpzSFV0Y3c1V0Qx?=
 =?utf-8?B?QVdsMzBkbUJrcW9BcnluUlk1andXNEM0bU10Tmg3MUZPcGRtOTFlbnF2QTZx?=
 =?utf-8?B?S1RoRzlnRjVFK2ozeHVQUzFHN0xMSG5DTXlFTGh6WFBmSlA1VzFCOUxGMC8y?=
 =?utf-8?B?UU5CMHVaMjIraEVoT0xjZXBMM1dFZ2FVekFqZWZVZnlvZkUwdktsZ1Z5T3Ji?=
 =?utf-8?B?cEJNbURPaFN6ZmZtOUFWMU52SjBwRlN2cWg4Nmg2UzJGUmEyd1VCLzB3MlBF?=
 =?utf-8?B?K21XK1o2amZhN3pPTVZGN1ZCZUNmRnNPcjZsaWQ1K1I1MTVVY3dhRmx2Z3Qr?=
 =?utf-8?B?QzhWNE9UNythOVFFN21TS2Y1VDZrRlZKNkN6Vk5BYzRxNVFaZWlaZDFGdHV4?=
 =?utf-8?B?Q0c2Z052Q3czeEl6R3ZRQmJvNy9QVDVzN2lYZVFYZ0t2TUZEeGhXdXVkY1Ax?=
 =?utf-8?B?WHN0anZHWDgxUzRwM3laRWNVZTVNQU14OGNQSEhmUXRuU3FDd1E1MkpidTJn?=
 =?utf-8?B?TktCeUE3Nmc0NE9JU1h4d012ZnZYbUZpa0ozT253NHBjZ3E0c2VuVG11bGV0?=
 =?utf-8?B?R2tNYXlhNVdnUFRUeWwwSGpBWVV0QlRwbE5ibktFbWpxdGN6U1R4dENXdjFJ?=
 =?utf-8?B?dEN0SGMwY1ZMZkRyVVByZHNXTzRXM0EyOHlrSjZzMFVqY2lOUTd6ZEI0UnNv?=
 =?utf-8?B?SWFjbDM0ZGpPUzlOVlhDa0ZJc1piekdjbEJjWmpoZU4wME9LeDVjSk5nK1pN?=
 =?utf-8?B?SThId2Q2VG9wQWpZQ3BhbU1uYjRwYk5CQWx0SUh4SFNxUEtnS0VpNFlIZ0dI?=
 =?utf-8?B?RE1GN3RENjQ2anY2MjZCMXJlMHgyc1pBZUwwcHIxWURNekFmQkNuYkpCUWNt?=
 =?utf-8?B?Y2t1eGlqZ1ZodW5hc2lRMFRiZlJGQzZnU2Q4QTkvK042T0xBK3R6bWtUcmY4?=
 =?utf-8?B?d3pjVGRZMnpkN2JiMU5sc1R4RkhlS0JnV1luM0pFeGx0WTN4ZzZHZVBBdThR?=
 =?utf-8?B?ZEt5NGJTakx6SllzN2dFK2NsaXFUdWNlN3hMNytPYk5HWVZYQ1lLa3RwSmp2?=
 =?utf-8?B?M1BWNDd5cDBURXRzME9MdVN5U2xOazFXTURyd1ZXcVQybVRLQkF3MDdRMHU5?=
 =?utf-8?B?L25CWEYwSTRjT0pRYmNONk0vM21BbjdndjA0MnpKYTlMaDVtN2wzSUdVT2pk?=
 =?utf-8?B?Vm14OEcwQncveDF5RHhuRVFrTVRwalFjQ2E3cjhRMVVTcU5IY0g1QlN2ekhQ?=
 =?utf-8?B?b21CMHNKNXJ5YlVXNkJ4REVuUno0NHNDRnZFZkNSWENuTnpMYjNkQm9kcklY?=
 =?utf-8?B?T3UyMU5hVU85T29kMHJEQ2J6TEpTWWdwVTNHeXBxSXlaQmczL28wTTZrSWRT?=
 =?utf-8?B?YUJFOG9jT1g1REsyRUdvRU5XYkpVK1NqN2llWEM2OFU4NFhZV3hMcm9jYkVr?=
 =?utf-8?B?ZTV3cy9heWwwV0JmT2hKSUF4Z2Z3dVU4M0UwaXF1b3V5SFJmR0pnZ1BBWmgr?=
 =?utf-8?Q?z3tqzkvk8eIKTCOySpqHp7Mp8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f71ffad-3578-4fd8-4f5b-08ddd6cc881c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:40:10.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1A2Uir0D/L3CCTkIDvl/EGsHuGPTHa0C0sh8qXzwsBN6ISh6SUqpUpMdNC4lCgr1lh9Cwnf1PUbpFoXyEKwEcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Add helper v4l_get_required_align_by_bpp() to help get width alignment
requirement. Basic replace below logic and enhance to any 2^[0..31] in
drivers/media/platform/nxp/imx-mipi-csis.c

mipi_csis_set_fmt(
{
        ...

        switch (csis_fmt->width % 8) {
        case 0:
                align = 0;
                break;
        case 4:
                align = 1;
                break;
        case 2:
        case 6:
                align = 2;
                break;
        default:
                /* 1, 3, 5, 7 */
                align = 3;
                break;
        }
	...
}

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
The same patch will be see at https://lore.kernel.org/imx/20250729-imx8qxp_pcam-v4-2-4dfca4ed2f87@nxp.com/
dw csi2 patch also this
---
 include/media/v4l2-common.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 0a43f56578bce1896cf63e29dd19f58ec0c46bed..a861d83bcd835dc854476b25919383415e5d434f 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -669,4 +669,34 @@ static inline bool v4l2_is_quant_valid(__u8 quantization)
 	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
 }
 
+/**
+ * v4l_get_required_align_by_bpp - get align requirement for
+ *	v4l_bound_align_image(). (bpp * width) % (1 << align) have to be 0.
+ *	given number bpp, get width's alignment requirement. For example,
+ *	if align is 3, means require bpp * width must be multiples of 8.
+ *	    bpp     return  width's requirememnt
+ *	    0       0       none
+ *	    1       3       8 (need 3 zero bits)
+ *	    2       2       4
+ *	    3       3       8
+ *	    4       1       2
+ *	    5       3       8
+ *	    6       2       4
+ *	    7       3       8
+ * @bpp: input bpp
+ * @align: expected alignment, 2^(align).
+ *
+ * return: required alignment.
+ */
+static inline u32 v4l_get_required_align_by_bpp(u32 bpp, u32 align)
+{
+	int pos;
+
+	if (bpp == 0)
+		return 0;
+
+	pos = ffs(bpp) - 1;
+	return pos > align ? 0 : align - pos;
+}
+
 #endif /* V4L2_COMMON_H_ */

-- 
2.34.1


