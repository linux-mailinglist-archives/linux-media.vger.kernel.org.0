Return-Path: <linux-media+bounces-39184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66768B1F11B
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F8571C80E2D
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F81290D9E;
	Fri,  8 Aug 2025 22:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i9jZg0i7"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013006.outbound.protection.outlook.com [52.101.72.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A3828C2DF;
	Fri,  8 Aug 2025 22:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692991; cv=fail; b=jHBaSCBLiCVfRJ/g1E69RW/qKbrjVfGsqd+v1MV3WU/jdjZIdDhB/i1NE9jHkSyCYwVfv9rDdFQS6wBfMA8xfCrcf83QLk9HfoKiPhU2jfY6CZXUvucqyC/gy73P6s1pwqxU4BCReD24sFWkNfOif1kTSjt8SKSwo6fGqFlrVxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692991; c=relaxed/simple;
	bh=fD21Z3IgVL0OGV5YERhYs5cobWtYWhxXIA6MKxY+wn8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SlpRQkkX81KvXCpz7TrCsmDniks0E3v6OTfTne+XqYxJmi7LDT5wA4Cpy1b0Kk89/pvh5BUUP7RfkcNthA4zQvuYtfBHIVR6YXBVa2TSe23ag8IohDr9gb+1SR8AuTSvGqdXugUDT8uIvPw19C6aCu8CO6X2ufVSSYzeqnrpco4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i9jZg0i7; arc=fail smtp.client-ip=52.101.72.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czlxipHtjZM0iymUFGv/kQNn9bX69lcfc8pVhiRt0mN821Qnt+8HToAucS5YdUncZ+5PPsCilWh8eXeBDkLDxQQjNihConmtp8tlTMgdB4Si5d+92R9pG8wiEBr2BLltHT3aiDXZyAbYZRCK0Lxn8UmPSOvaTYhAsw8K0vOzBqunWKtRICdiisoH0Zj+viiL5yY1CTX8FSEhbnvgFNWkdEiKytfBflvmQSUbEdfoMgLN7btEZm/Vhd1tR/hUvRnsDd0Pyc1wkgjPPqI2rL/X5jhBk7dtNOErOBJx7+I1ArndVMampFC+48Ccg7PnEz4r+TBrYJ58V1W2Z6dQ9ogPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtHV5L8M8LFyWPc3pCifM4QbaguhIEhwQRHvvJE1tsw=;
 b=ly897R/CXeoLaHBDQF+mI8OZGrSCfGLPDHduIZ4c3bZIp3qRDGkpZbb+DQICf5IPLeARoXfUJrkVlS7k5h9rIkX/00OgmQKaUlo33Br25evkqRtjls6Cj4TvrRdNJ/Nnf761rzxq38NOIdnlgi6+gxaEShNxKamPBJn21pqz6NKBnPOMmdPBrjL0IkxLuEKgoqp4js+1a+SZ+/wB/JLfdBL0n/J4My8dpeNFPIn1gFzcEmmcXlioOYCvi6sz4lYewTLRh+ocpaedWnTD7cRKX6hOpNmjqmMwnnFoGJt+l35doma6xePI5HvSTLAWpJWHcdRwCSzmmtXnmKobujej7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtHV5L8M8LFyWPc3pCifM4QbaguhIEhwQRHvvJE1tsw=;
 b=i9jZg0i7l1f9/BaYbOvoBtmJxWiMBohB4tgHVi7ERGyZrYBQr7Hhb5qASeOHxA29sZhMrFOox5cPoLPjIJCfaZWagyCpkAtwSp+Ia1pP+CCunaXATVh3XKk4aHWZ1E6betqSx3s3A7E2UDyTgMKAjbo89BUGDwaOENV0u9qBo6fdFT0yMb5NtjZbvazWMXttlOpmIMTs+oaqlBB4lBMWxmSs+qKjYSkcBK1S1ro6etktt4YMnpikPe/uZADYUcwBEmIBKs3oTVu45R9yZF/P5vvIfsYDFir/u1JRWuZ1ZsMxzE5CrJLTMxO61uH8cYcO4OxyR+QgWAfS+pMlH6K+gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:43:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:43:05 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:35 -0400
Subject: [PATCH v2 32/32] media: synopsys: csi2: Add simple synopsys
 platform driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-32-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=4025;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=fD21Z3IgVL0OGV5YERhYs5cobWtYWhxXIA6MKxY+wn8=;
 b=CI5LAFUn5QhSCaeAWE3FlWfGnUtGEWkeU9SPE5u0af0NS+JiwaLTUSgeKZhn5hSacWY9BwIOS
 Zs7nKAg81e6BU1IQYI16zaET886OJ7EuHCdbRg/O+SX0nijoyfE8g2i
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB11346:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e855a7f-8183-4d83-f63e-08ddd6ccf080
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Vm42VlRSVGxLcnhJTExQVHprMU10U2hWNnZnTWhJYlFMVlBLVlVjSEtsK0Ir?=
 =?utf-8?B?R0xGeEpCUlg0eW85SGt0N3ZicmhkQnNqNlVDZzRMRlFTY2JieEpkeDdSMGU4?=
 =?utf-8?B?RlZRcnpGUVhTM2tMRWsrVnpSSVhTODhrT25XbHFmdEREWHJwc0V4SUNadXdh?=
 =?utf-8?B?RXJkUis5WmxPaVFoQlBiMVBlK0FuTEp6ckxFeEZiWjVqRUx3azRNekVNZnRQ?=
 =?utf-8?B?MGJpTU5sSWdpRVREZENvMmxONTJVRE9OMGdTSCs5Ymg1Ykk0bmJnSTNNdG5p?=
 =?utf-8?B?amh0NWVuZVlaalpVS01Mc2ZwTkoxSU5qQTVnUGwzbU9YSmxROGpseTljTmVZ?=
 =?utf-8?B?OHlWTDFpN1Fic2daL1gyb1RKRVJXbnpIRGx1MGtNRzR4YU4rbUdpNWRCR01r?=
 =?utf-8?B?djY4UkRzUVFuNFJjQ1h1UlErSitQMkhSbmt1YnVLY3VtYnNQZ216OFptOFBK?=
 =?utf-8?B?RGVFZkp6VHBwSktiMXYwMHFWbGR3Yy9KSGpNcEtMNUl5QUY3NE96REdlVGNW?=
 =?utf-8?B?NlNvdkQyblptN1VJalBsYWhjMFZadjhuNzdVTXB5aEl0Z1pwNEF0ZkVTUHZw?=
 =?utf-8?B?UjBjeHp0NlJIK2I4SHlERGVXNm5TK1M3OCtOQ2Y5NVdDc0lCTGFFU0JKR0ZQ?=
 =?utf-8?B?cXcxdDRGNy9mZ25aVG9jZ2Z1T0RrWTladjIvTHU2YmpEdGFCdERKUWFwVHFu?=
 =?utf-8?B?a3JlYlB6SGFuYlJKYndic0NuQlNqK08xU1ljc1NTcUVYMTFXUlp6bFdiNDls?=
 =?utf-8?B?VThCMjJ3cTdxVHZSRVpDbUFDN1I1eHpIMUUvamxrcWhaMXZJYnErZ3g0SnpB?=
 =?utf-8?B?U09aOVl4aWdyY3N5ZzRNU2dvN3FWQ2ptNGhJY2tFV3pvOFVsSTlHeEM4ZU5V?=
 =?utf-8?B?WUZIZEozcDFnSUlLZktMdE5QNktSa1RiRVllWW8vcCs2QWEvaU5UcDZFRWkv?=
 =?utf-8?B?dUJGUGdINDVTallNL1pGd1pYWmpSMHVHQUtYNHZDNzd2S2pvSmVQSitTK1Ax?=
 =?utf-8?B?bnoxdDVDaDMzeVBqc1dzNGpuQnRtQU1mUW1mcERKallwcSt6TVZhK0djZEhn?=
 =?utf-8?B?RTZra2tONnlEUmhleWlrOTU5ci94eTdtTmtsNTR4UTdZdkxWcmhPQnp0d0xW?=
 =?utf-8?B?QzNXdTFkNFIvTjJlUGZscDlsUkdveFJob0o1UXlWT21nbGhHS0wzLzFyYWpQ?=
 =?utf-8?B?TkVZYWI3YjByb1NiOUhldFI3WVloTEJnS2tmTHNQQjNLaUp0a2xraEFFcFB4?=
 =?utf-8?B?OHpVdjdrZ2laNmJ5SjZHSWZiK2EwSXU0U21DSGd1N0h4NGZxMld2QW83cVFI?=
 =?utf-8?B?VW9yWDVaVlBYYlYwMHVrdno2ZzFWdXpNWlJoOFJoVkd6K254WktFRWVIRE1H?=
 =?utf-8?B?bEhnVHk5VW5QWFoyRHk2UGdzOEhhMXhSU001aDErOGpoUGFoWnRkUjlGVXNN?=
 =?utf-8?B?UTAzNkVsRFUwT0x1d2Q2WVNLMnE4dC9INWxOMmpUbmRPc20rcnJUaUh0dEJt?=
 =?utf-8?B?bmZCd2JrWk80YjBqa2Y4cUNCc0Uwc1Y0dXFNdExvb1pVQWZ2WVNDbGMrbER1?=
 =?utf-8?B?OHI5LzBuUjkvNzUzVXpvaGZVbW9lU2FOOG9DbDE5QXBkU2l6bTd3RlJBaU5C?=
 =?utf-8?B?TWxOWXRNSmlLTWl6eEk1WTk4cDB5cFowVDdYeExGVEdRc24yZkQycW5QVWdD?=
 =?utf-8?B?LzRqQzZNeW10ZHdUVzJSb0VYeXV2c1JNek1YWGRyN1JxOHNpQU45OVlDcVlz?=
 =?utf-8?B?Q2pVV0htWTdjamZnMFlBeW9rY1dOT3FIWlBmNHNnZnBzWkFibEVCbi9mNURI?=
 =?utf-8?B?SUluVUNuSUVGUzlYRE1xZm5QUXlqOVIrTmRwSWZScVRRUVl6bStVNU9vSnBV?=
 =?utf-8?B?SVY1S1BpVllnd1VOQ0lFUWtaaG9La0U5enZIMWV2RmcyYWJDb1VXSDlqZEJ3?=
 =?utf-8?B?OHhBL2lpazJhS1c2WjdFNkdacXFJeFp5RkZYQUFXU2NtSkdyL0MyTExsOStK?=
 =?utf-8?Q?LIjhpQVrfqjDXsuhHsEZtjvYsxdb2k=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Rm15QmovQmVXMmZBZG5RcjdCRjB6STI5RzI2RVhoRUFsQkhWUDNDdkY2RDls?=
 =?utf-8?B?Vy9iajZXaWR5MUl6MUlucDJydWExYjVJK1ZiOGhJMElwNlhJUjc0cUJPZStZ?=
 =?utf-8?B?Z0pJWXJ0TFlIRGNxdTRTbU1VRGR2ck9lUHFhaGxXYVNpRG1sNHdqQW9BWmRD?=
 =?utf-8?B?akJSUHVJNUY0SjBIajdWaEk0eHRSN01IM2RNMExBR0s3RG1JdWF3akNDSmhJ?=
 =?utf-8?B?aEJ0K0p5TzF6TURlK1JyNU1sTGVTMU41ekZQSlV5WG1ZRlArSW92R01GZGJW?=
 =?utf-8?B?U2VyV3FaOEU0WjMrSy9aQTBDRTdDcmJqaWhCcndDbW1OZUFucVo0UGZjOW5D?=
 =?utf-8?B?YmVRby9FRmc2L2J1M2FVWmNSQjl1NGRYYzE3WGJubGFPSG80LzN4SGJIVlZD?=
 =?utf-8?B?VEFWRGxQeEJ1WGhxQlY3WGs1Wm9GZ0lNYnZpeWUvcWl3RGxEUS80S3hjL0sr?=
 =?utf-8?B?QnkvN2RMYXNMdDVoSnQ4S2oxS1dVNWQvTkt2bU5ya0FrclQxQnZKbUE1MDlk?=
 =?utf-8?B?bmNDYWlnUzhuZTJsMjhkcWVIYTYrbkFEUTZEdmxQZk9haEtvSG5rcGd6OTJM?=
 =?utf-8?B?K0x0MHowdEdnd2V4L1BqMVl6OWxoL2hTVm9nQ0dTUGQ0c3QyemJ5MVRWeDdF?=
 =?utf-8?B?aFQ3amhQeE5taXNpTThMZ2tQdzBsWHlob2g0YmJ2NkhTN083bGVXVEtnOVI5?=
 =?utf-8?B?R01sem9FNHg3RGM1VlFsbnlQMnNPejdFL0hpUmF1a2lqZlNnMGpIcnJOdEpR?=
 =?utf-8?B?RUZDYU1nUXFqcytJR3NIRkRGY0RCN0JzdS9VWTFxWTNoU0VqMitsVTRMcm1U?=
 =?utf-8?B?N2REcTUzQnNlNlRyRlRxMVRuajhmV1I1bDNIR1FrRFJWYWltdFMxVWVXTTAv?=
 =?utf-8?B?Nkt0dGlmM1o5a0lHdWl2WmlhSStNM0RQMU1PcHQzUzl4L2M2TDdPbUk5bDFU?=
 =?utf-8?B?WVFRK3JjOU9qSitQQjVjV3hoS3I4bzl1UFNsdFNRWWhmTFJUUktaSVZzYU93?=
 =?utf-8?B?WWhNbWx1OTFkVDBXYm1XVE5KL0hMY3pNM0hzT0lSUERZMFVycGd2b0NxUk9D?=
 =?utf-8?B?ekZqUGx3TmtzVkhYeWZNU3FhV3F2clJMVGwvcWc5RS9XWFNldlM3UE1jcFpT?=
 =?utf-8?B?RCtQNStIa0RZbnZFTlZDc1JVdXRsL2x0WWx6dHVNQzJKRXhWVHZhb21lZlEw?=
 =?utf-8?B?MHJvSjdsOTBhVmtRNy9GbjZkWGx2b3RSeFRvbDN3c3BtWjY4Z01ZaE1ISVVZ?=
 =?utf-8?B?Sm5JdUlrd2lGQklGQjEzS3lma3hUU3dWK1dvSkVlN0FmR2NEaWVBOXNLd1E1?=
 =?utf-8?B?KzZaTFZOK1pFRC9tSGdobnp4anhNbDl5eDQ5a1ppaTFoT3UxdjlCY2kzT2px?=
 =?utf-8?B?ODlzVGRobzN2Ulk4aHNyMVRvZkgxcXlFM29JOHVJQ2xzaTVHb1JYZm1IcEZz?=
 =?utf-8?B?T1ovaUVhZUJSdG0vYUl0N1BNaS9ta1hHbDh1N2hWME9NQXlJTi94WWE0K1ZG?=
 =?utf-8?B?cktUWDlYQWJFQStBaFlwNXBlQURKam1mdVM4K2s2TXZBdjZ3UjBzL2dlSkNL?=
 =?utf-8?B?Z2pDRXNNOUdvL1gzenRqeklocFZXVTYyS3hiZVo2ZEhqaERMMnVZdFUwemJr?=
 =?utf-8?B?NWpGUDFzbytsNDZvYU1TTmJIMGxEam5UVXl1VFhJeklKN2hYVnZOR1l6MjJJ?=
 =?utf-8?B?aEVZeU12eW5tdkhpbVYzR2lNdUZrUFI2OFhWdFVmU2NrUnZZWnk4RklNak1y?=
 =?utf-8?B?ZWpZek1pTTFVNlJzbGdyUGwrbTZBRE1pSmtFR2NObVpnTU5XQU1jejgwNFNE?=
 =?utf-8?B?d09rV0RmTlNYVk41WkhpWG9YTEJ0UnJma01ZUVdUaUJyVTJkOFJ3VEN4RzVV?=
 =?utf-8?B?WGQyQ0k5MkorVDcrVWI5eXMvbWN2NVVPTFN2V0E5ZkljblEvLzNMSkZoV28y?=
 =?utf-8?B?TWxRVmVXdlExNVBRZ0t4eldad3Q3S2pNRE9kS3QwR3I5V3ZqY3ljZUw3NUNQ?=
 =?utf-8?B?K1EzQ0VYTWpvTllob0xyalpEbEcrTDV2MWVjTWJCaStrVjJ4UVc0aExqcGJN?=
 =?utf-8?B?V01LQ3MvaDl6dkpmQWJrUzVSNk1SUGpkcHpHOERmUGxRZ0hWRUtzM3h2djVj?=
 =?utf-8?Q?p8V0eN1CiVPxXIKPm6D7Cvmp7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e855a7f-8183-4d83-f63e-08ddd6ccf080
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:43:05.5359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vS5QavI57E7Fr6qNWfgoLr43856rH65RVBrS/cYD1Et5VEuvy+S3XcAxXH735RdVbj84L6NnZCFbi/amM9e7Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

Add simple synosys platform driver, which use standard PHY interface and
only 1 sink and 1 source pad. No format convert between source and sink
pad.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/Kconfig            |  8 +++
 drivers/media/platform/synopsys/Makefile           |  1 +
 drivers/media/platform/synopsys/mipi-csi2-simple.c | 75 ++++++++++++++++++++++
 3 files changed, 84 insertions(+)

diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
index e54dad835349d420dead6d5313c0623567c28c0b..642b7dcd8dfb1bafa3b6dbdba1a1d99559d3c01a 100644
--- a/drivers/media/platform/synopsys/Kconfig
+++ b/drivers/media/platform/synopsys/Kconfig
@@ -12,4 +12,12 @@ config VIDEO_SYNOPSYS_MIPI_CSI2
           To compile this driver as a module, choose M here. The module
           will be called synopsys_hdmirx
 
+config VIDEO_SYNOPSYS_MIPI_CSI2_SIMPLE
+	tristate "Simple Synopsys DesignWare HDMI Receiver platform driver"
+	depends on VIDEO_SYNOPSYS_MIPI_CSI2
+	help
+	  Simple platform Synopsys MIPI CSI2 platform driver, which not format
+	  convert between sink and source pad. Only 1 source pad and 1 sink
+	  pad, use standard PHY interface to initialize DPHY.
+
 source "drivers/media/platform/synopsys/hdmirx/Kconfig"
diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/platform/synopsys/Makefile
index 045ed3177738e6d28aa223804b79e6774e141dc8..cac610c8e08abeebdbf14157d8edcdc5a635dd00 100644
--- a/drivers/media/platform/synopsys/Makefile
+++ b/drivers/media/platform/synopsys/Makefile
@@ -2,3 +2,4 @@
 obj-y += hdmirx/
 
 obj-$(CONFIG_VIDEO_SYNOPSYS_MIPI_CSI2) += mipi-csi2.o
+obj-$(CONFIG_VIDEO_SYNOPSYS_MIPI_CSI2_SIMPLE) += mipi-csi2-simple.o
diff --git a/drivers/media/platform/synopsys/mipi-csi2-simple.c b/drivers/media/platform/synopsys/mipi-csi2-simple.c
new file mode 100644
index 0000000000000000000000000000000000000000..bf34a515b41290339db06d74d7135c575a8bf031
--- /dev/null
+++ b/drivers/media/platform/synopsys/mipi-csi2-simple.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Synosis MIPI CSI-2 Simple platform driver
+ *
+ * Copyright (c) 2025 NXP.
+ */
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <media/dw-mipi-csi2.h>
+
+struct simple_csi2 {
+	struct dw_mipi_csi2_dev dw;
+};
+
+static const struct dw_mipi_csi2_config simple_config = {
+	.module = THIS_MODULE,
+	.name = "dw-mipi-csi2",
+	.num_pads = 2,
+	.sink_pad_mask = BIT(0),
+	.has_irq = true,
+	.has_phy = true,
+	.need_dphy_reset = true,
+};
+
+static DEFINE_RUNTIME_DEV_PM_OPS(csi2_pm_ops, dw_mipi_csi2_runtime_suspend,
+				 dw_mipi_csi2_runtime_resume, NULL);
+
+static int csi2_probe(struct platform_device *pdev)
+{
+	struct simple_csi2 *csi2;
+
+	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
+	if (!csi2)
+		return -ENOMEM;
+
+	return dw_mipi_csi2_init(pdev, &csi2->dw, &simple_config);
+}
+
+static void csi2_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dw_mipi_csi2_dev(sd);
+
+	dw_mipi_csi2_deinit(csi2);
+}
+
+static const struct of_device_id csi2_dt_ids[] = {
+	{ .compatible = "snps,dw-mipi-csi2-v150" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, csi2_dt_ids);
+
+static struct platform_driver csi2_driver = {
+	.driver = {
+		.name = "dw-mipi-csi2",
+		.of_match_table = csi2_dt_ids,
+		.pm = pm_ptr(&csi2_pm_ops),
+	},
+	.probe = csi2_probe,
+	.remove = csi2_remove,
+};
+
+module_platform_driver(csi2_driver);
+
+MODULE_DESCRIPTION("Simple Synosis MIPI CSI-2 Receiver platform driver");
+MODULE_AUTHOR("Frank Li <Frank.li@nxp.com>");
+MODULE_LICENSE("GPL");

-- 
2.34.1


