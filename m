Return-Path: <linux-media+bounces-39171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6259CB1F0F1
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72BE217820C
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E33298249;
	Fri,  8 Aug 2025 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g1f4LWS0"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61072980A5;
	Fri,  8 Aug 2025 22:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692914; cv=fail; b=gVVEaDumfOAbW4kyXiK+qUHBkRSIuD7msGwJLQPy4NzvSwjz4jY3SKePgzFfd90qTx9ovettDQu2XNrMO2t6qNX6p6ZmYH+yIH4fAyNB4DZTQcy6DdiS6m/dLSfo9PhjOjzKAGwmVTKVUAvv6oepRBt+t0hzosPHftz+qEzdiro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692914; c=relaxed/simple;
	bh=kOXpbinYmyx0SjmhE+5WDOqc7QWoP5IWn4QvRxdiH0Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EA7/DH1i/imN8CUYIbu82iB7TZM2Ne9EUXq/AoUDR2cfTbFLhzYDOZ7g4wfEEmPXg2xTKqghGigFpXpEIrs4p5RCY0UO8elU3+iz+NDsL6Q99X8pu3Mb1TMKcjYyLPQZD7K8w+LVRgL7z+2DkuW9oEhB2iqg0uUn/bpHKDmZzks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g1f4LWS0; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVj+7n/HzS1yOGnhUwID8u3O2K1Snq0weMptvB9Lk0rdasc+xpTMBU4wDAIYIZQ44NT24v6CLwmcvxNJD06BKJIurovCijNlCcRf+K3uVoj8LvEKNlw6/aWXMxs/wfNle4TjL5eyCWZ9NwYg8ST9SmN/Yvm+LbG7BPcW3lMNE0EqVombBvvqU5ZMgJT7BGMqr8ff1bYp5GzMMB70CbcU/plw8yart3V/SUFKV8PG8vL7Pxyy9Y0OD1KXN3VxdfjjLvQzxGJWH7g8BDvBjzeydXHyWnKX2JN9RnivAqdR9lyRupcL5gfhMejHE3IkHJRRcLmo6F/03AS96cWBWzvjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68kNuKn1+5kACtRa8tnxy5OuInMIwGVZKjw/AJWt+uA=;
 b=NMaRvrGw7E3UBR2EEbqcaewU2QQnVjUbPFr5hj3EMJNE6P5CFk6kdZZc33PH5MOJqSVBrJrLk8BmOfJdtP7pXreocrUqQE4qfJYX0mVIUkI9Lg5Sdhf65phI+WYuJvf9Tbc35Nj6RUxmIzorrdU1AdejNCdQG66bDLGbbqK2L8fQzOX8w5ZDyuCu4CYYwbaUGFoVHR7mNEFDLFD8SwGI2SImF4AXSFutjWhOxtAeugB0aXz3Twhm+GPWROuBDdb0Ynxbomts4xpFL4aZxvVPYHckFt9QsAd3cmsTNA028whgzEw5M4Gcjealr39ZfFclp48wm3a7aNoxSIv7D/tYzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68kNuKn1+5kACtRa8tnxy5OuInMIwGVZKjw/AJWt+uA=;
 b=g1f4LWS0uGxbnin8F+N+zr0pPzbzP9w6ZsQSJ4zWaJJYf4AS92YZ/fKAxboNo39cnF8pUneOLC9SCzh9LCACmg+2Ul03BDZuqVNb0XAyMzJSii5yRckSmh6hoZbV8Xy4GYPJWNmqQ79C6RfDKqyI/U/R/GZkJOGc8e+23ZZVviPPOfQB7sWUgVScJkxUeyBwRPdMoBjhcCxMCkhaeZlAIZMOlObLLl7vRcYIbJvyHu9ez4KFlXYtAvvccp6KTVFjKpf2F9BZ7CIobD71SUiUeY2BrphS17csF/PnBlEepLdfGdEGYvTn3564jbC+oqzhT0sf0b7GmC1gnHWnMHwNug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:41:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:41:49 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:22 -0400
Subject: [PATCH v2 19/32] media: synopsys: csi2: Remove deprecated s_stream
 and use v4l2_subdev_pad_ops
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-19-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=2902;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=kOXpbinYmyx0SjmhE+5WDOqc7QWoP5IWn4QvRxdiH0Y=;
 b=kB39ENaKqX9tLIvFXm11SacEeCCKJQQokzK1mTHiOiwEUmoqEpTEY1JMgtu94tSfKqm15sbBN
 oYJ5bcBih9rCnyFve8ol4XyNG/oFG3T4yuSv9PFDHTERaj6kVIk+irb
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
X-MS-Office365-Filtering-Correlation-Id: 0360e12c-2643-48bb-dd18-08ddd6ccc359
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?U09hK3pyQ0hiRFN4VmhMeXJYYTBvRVloZEQ3VEJ4ZFVVOGJOc1VnZ2hieDQw?=
 =?utf-8?B?WGJqUXgzQ0tyV21HamNFSVNSM1RoRk9zTHhaRkZiMFJjUUU0L2hnbFJzOUpy?=
 =?utf-8?B?blBNbGkvTnhUNWtTNERkVXF0Z2tKRzE3cjIwdTlKK1RreExlbURRanNpVjVS?=
 =?utf-8?B?YUEvclFXS0ZmaTZMVzl0ditkbHFUVEI1V2ZhREkreTJGWTd6clovMmJpNmM0?=
 =?utf-8?B?WWJJajMrSjIrZjZFVnhseFRYMzBFSUR4alBDU21Na0NSMjMvU0FHVi9Fc3pH?=
 =?utf-8?B?YXYvRVE2blNRZ1J4QmFwbHRVOVk1amhJNGZkaGVhbko2Y3A4aEdIU0NzRnpy?=
 =?utf-8?B?SFEwdEdURm1Ra29sTzZoZHRYc24wdjR1Y0l3bTYxcGkvcE5wTXZDazJyeHVV?=
 =?utf-8?B?aHFmczYrclZwS3V5NnFUWUZuMXRLWU9ZZm1BZGUvSTBYbUJoeE5mVDVHMEdm?=
 =?utf-8?B?cStFYVpVbnNTYjZHSVloUFh1UmgxaWRhYlZxNGZqZmhPTThVeXlLcEN4UjBB?=
 =?utf-8?B?d3hxblpDUzNTQ3pkN2x3ZGx4Qm51WlpCQXJkV2RQQ0lORWFiZGpVV1NlT1JE?=
 =?utf-8?B?VWxKWXZuaDFYWE9CNUZEV2crLzltM2hsdWVXN0NvdWF6L2RHQXl3cWVXRE9F?=
 =?utf-8?B?MkJQV3JsWi9jOTJvM1prVmNCZ3p4czlSNENFam1EaW5URDZ5amVXMEJCUHpz?=
 =?utf-8?B?M2NLaEttN1h3WjBESjVTTnNycXNiV3l0aWhOSkltbDk3WTJGQUhLTEhDbjBX?=
 =?utf-8?B?L3hMWUErdFJFV05WRCtqWlpBUkY1QmZyYUNJQ3diWjlkYnh1ay9mc3BEdThz?=
 =?utf-8?B?M3dlRlFtdmpoTzcvNiswQXdkN3htTnBwN0ZETnBmd3VoRzJHUlNkcGNkdUtM?=
 =?utf-8?B?WC9qNXlYK09yR0QyMVRnK0Y2NU1ZemdBSDFiS0ErNEtiT0VFTndHSFA2dUxG?=
 =?utf-8?B?UWRxT3BNZDNneFNIQTRQcmRRcDF0VGVFVGh0ZnBsalNkbzV1Vm8zRW1ObTNk?=
 =?utf-8?B?WUxEMVFOSGxNWEFvVDVqRUZ1K1pJWjV3dFEycUw0WG5VbG9rTnZqRjR1UlFN?=
 =?utf-8?B?MFY3dzg0RmFCVkhVZlA3RVIvRmZvK3hnMWVnU0QxYVYvaEdXNWlsMXZpVWZP?=
 =?utf-8?B?VHZOdkIyR2xRM1NqbThHUk50TktvSEplSklkOHIrYWM1d3h4dW8rR1Jvb1dE?=
 =?utf-8?B?eUlwZWtyWlBnaEtxYWIwdHI1WnFCVnRPREc5TkNrTFk3NUQwaHFDTkJjWWZO?=
 =?utf-8?B?MXY4TmZzU2c3V1ZTcVA2bHp4K2dMd3JlR2ptaEQ4WmJsaWszUDlMVjRMWTBt?=
 =?utf-8?B?T2lGS01yVFJyZjBHMVJ4VVk3ekJrc01WMGQ2STBPVFoxRUhpVlc5bUdJaXA2?=
 =?utf-8?B?dzNoOVdSbkdIOHB0alZlYkp0QVNzUTRkNzl5NFRoQUF0T0NXWGNwMmRiUys4?=
 =?utf-8?B?eTVaaFFsUnhMUmVFbmdsenFHeWg3dFhqSU9JTWtXWWR5MVBRY1R1YS9mREZY?=
 =?utf-8?B?Nit0Vm8rY0M4RDNhQWowVE43d0V6YnB4UGEzL2wvRWZuOXRDemZxa2srUEZR?=
 =?utf-8?B?NEdub3Ird3F4OXI4YXZPdUc2SkdoUkxFbjFPVFY4TTgyVWNsWm1PKzgvUEc5?=
 =?utf-8?B?SUlOTkNRRll1dGlubzBWbW1sWGpnd01pNE4rSFNBeXVmMWFLQnZraXJUZ0wr?=
 =?utf-8?B?Yk83clkyQTQ0RE1Ba0VFSExzYzNwbThkbDBKYmU0SDc2ZktNcnk2NXNKb00v?=
 =?utf-8?B?dmxGMkt1TDNmTzg0eFdtWDdRMkhGTTMvYWJaU2lZblF2YWxTa2w2aUxaNG1y?=
 =?utf-8?B?YllWSzZ1bUttZFQwWVFXTWFQM2dHNEN5MCt1OGlncisvbWVxY0hFRDI1Tnpi?=
 =?utf-8?B?WGt0QWlOcVloZCt1MUo3NU9hVEhoNThGZGJWdHV2RDRxTHBmSmNsaC9Fdks0?=
 =?utf-8?B?aDlMRVEyK0NpSElJUlNhVWJEVE1QYW5GaWlOWmMrODRDRk1UQ3BhSmtRd2tp?=
 =?utf-8?Q?aDcQRgxL+fMGk3qiIT9nhKZgz3pcXg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NjVqY1Aya2ZPYjBhTXAwc0RzUDQ0WUJaUzB0empHeXVCZXNkQkxoV3gvR3U0?=
 =?utf-8?B?NmtJNlBsOUVWUlRudjZCNUo2enZnaWVIb1VydUh2WnBFUUlkSzBOSHoya21p?=
 =?utf-8?B?R0FHRUpHRFpyWklISThJckZONmhYeUxBa3hyL0s3UFE2RWh1SnZZeE1JajVT?=
 =?utf-8?B?czB6NTAvL2FPMk1mMHlFbVk1S25Zb283cTRLRWxNTnhrMlE1T0dMZ3ZZYlRx?=
 =?utf-8?B?UmM2SmVhQ3NHSElxMjJqd2ttUjhLME96eGhSZ3hVYWZ6aW9vcWhhck9wQnMv?=
 =?utf-8?B?V1BXZGJIcXQ5SkFpVUloWXBhL2hCVS9nK1lOeCs1RGNnWGg5WXNCdGowL0ph?=
 =?utf-8?B?Ry9rbEpNQ0d4bnBvb0VuTHJjeFlYbWpGMW8wRTVDWWRaQ2N0T3pURGhqbTU1?=
 =?utf-8?B?NzRiUGNuRDR3M0NEUWQwR1YyZmtCWXpRMUtwaC85RkZvK09ka1lkbzFCTmJC?=
 =?utf-8?B?ZGs0TzdaM0p0KzlyRVNWaUF5OTZybFltNEJ4OC9Gaml4TXdDUDlSRkJjdGZh?=
 =?utf-8?B?NWxPU21OajhYQ0o3Vi9GQmh4MGdsb2FIcW9DUmY2VHFLUkNWdnJBNFVtVWJy?=
 =?utf-8?B?MkpEbHRDNDFPSHU4OXRDOXNlOFd2dHZjcDc2bnhNcWpUdDVYNUJEZWdEMXBZ?=
 =?utf-8?B?dHpydFNnMS9CcHZHTUZMVGcyejc1VUFyVHcyZldxWTF5MzVscmtQMkkvdk1Y?=
 =?utf-8?B?Z241Y2tlMXVTTDBFVElpU2EyNGwwU2h4REltZ09Fa3M0eiszOUxEY3NUNk5I?=
 =?utf-8?B?MnZFWTgwMW93SlNrMkpJTE1CbHZyZFUvaWN0SVhuQUo0VUJxemFjM3duU1Jl?=
 =?utf-8?B?NUZXc2xIeUVSTWRTSGtKOWZIZVhwV1YxeUpVTHpJV2dlQmFjbmluTU9zOUwy?=
 =?utf-8?B?QllvaTNQVklYL2k2N1lWYkhyLzB3SkYzZUJCaUdMcmVqMjFkbGpOSHZmTjdw?=
 =?utf-8?B?ZTFLNTFTMUlDQnpUMHBsa1Avdkc1OXJGNHh0Y04zMW5KWlBnb0pkWTk4M1dR?=
 =?utf-8?B?R1gxVFdzY3hFeTMxMS9yWU5BeGxXN3VnSUFRYXo1dHBYaTY5ODYxdE0rdWpC?=
 =?utf-8?B?TVUvNS9lK0ZZeHFIMWY2SHU4cHhwcHNJSitaMkhHZU5qVWRHL29SYjRKTDNy?=
 =?utf-8?B?TG5oSHVxUWwzd2QwNlNXRzFSNmtRb2l4cHhFY3dsVVlrVXJYYW5lUHZMWG0y?=
 =?utf-8?B?OGx1TGVrelRTNDlqdTBqN3FKcXN0Y3BaRUV1QzI4SExpQnoxTWRvYSt4ZUoy?=
 =?utf-8?B?WVZrZTIwSUt1ZWJPNEpGTHB6MS93V2l5dkdJdXczUlRXaWtwck16Ly9QVFlu?=
 =?utf-8?B?SFBpc1IweURJS0NXWXJLMFcvRFlUMHdQaHVzaVE5dTdmWGNEUFNBSDRPL3NK?=
 =?utf-8?B?d1ZPS21UTklQZS81cU9VQ3lCU1h2d2czblVBYmhUcXNEbXlDanlxY2VOSm95?=
 =?utf-8?B?OWM2aEZJL0h3aXc5M1V3M1piQmVYalZVSFB6VERGWnFISnpKaXRpa09ncmNz?=
 =?utf-8?B?YURtMjZYblF5ckw2YmJkMXNYb1VMQ1BEWTQ4WXJEa0pPKzJCckhleFd5RVNO?=
 =?utf-8?B?SEtjOTJsTGxobjBSUXJpdVl6OXRSUExTaW9mY0FOZngrUkFINXlVUVdjZmhN?=
 =?utf-8?B?RU9Ma1ZsWWZ1cXRmRUxhZ3lWSktNSGFPdSttUzBDVWZ3NHBGYlczMFpNZUd0?=
 =?utf-8?B?UDA0cU9vTWxKMGVKbEF2SnpOUW9uNVV5NGk5bU9OWlNJMjJNcXV4QkVzamxY?=
 =?utf-8?B?WDl5ZU5hSWJrdEdlMXVBUitEbHJidmhZNGYyd1ZKZ2FaOUZCWC9ZVXBZSmlZ?=
 =?utf-8?B?UWdpRktiekk0K0Y0aGtWeGhKSXRiM2Q2OFh4ZWVHV3hZVU9CemxSY0xvMlA2?=
 =?utf-8?B?TTZqWHRMVHdiMTNncngwNDVrdlNtU25qK2lwTnI2aTZHQTRtTXk0L1lqb2NM?=
 =?utf-8?B?SkFSVWpFbmF4bFpZUk1mVHN4NjlLOXJodVdMZUl6RDdNQWJWL1V0S25qVGsw?=
 =?utf-8?B?OXJqNHNYaHRpL3FuRnRKendXa3ZseTZYV0NReGpMTGJjS3h6cWhtMkJLY0pD?=
 =?utf-8?B?WUltcnhkZDRSVUlzT21NVzB5dUZsYjVBNzl2aGdCT2xxdmFRRDBmSXI0R3Mz?=
 =?utf-8?Q?R474TqheOnnCjjyTVRctn5hAQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0360e12c-2643-48bb-dd18-08ddd6ccc359
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:41:49.7512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: om+U8sTq1EKdV60p0o61Sz+YAVpsV3J1yhFukTdHXWp+lEPBUANxRaxdMLGOMEKF6QYCD+QfNDFHrdUoD20Mjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

Use new v4l2_subdev_pad_ops.enable_streams(disalbe_stream) replace
deprecated s_stream interface.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 52 +++++++++++++++++------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 0c8022ecdc18d42fa038c721e0c0953e8eb9cd6c..9ea3ae22fecfbb66abc460c40cbbcf15e1a97494 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -342,7 +342,9 @@ static void csi2_stop(struct dw_mipi_csi2_dev *csi2)
  * V4L2 subdev operations.
  */
 
-static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
+static int dw_csi2_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
 	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	int i, ret = 0;
@@ -359,28 +361,39 @@ static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
 	if (i >= csi2->num_sink_pads)
 		return -EPIPE;
 
-	/*
-	 * enable/disable streaming only if stream_count is
-	 * going from 0 to 1 / 1 to 0.
-	 */
-	if (csi2->stream_count != !enable)
-		goto update_count;
+	if (csi2->stream_count)
+		return 0;
 
-	dev_dbg(csi2->dev, "stream %s\n", enable ? "ON" : "OFF");
-	if (enable)
-		ret = csi2_start(csi2);
-	else
-		csi2_stop(csi2);
+	ret = csi2_start(csi2);
 	if (ret)
 		return ret;
 
-update_count:
-	csi2->stream_count += enable ? 1 : -1;
-	if (csi2->stream_count < 0)
-		csi2->stream_count = 0;
+	csi2->stream_count++;
+
 	return ret;
 }
 
+static int dw_csi2_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
+{
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
+
+	guard(mutex)(&csi2->lock);
+
+	if (!csi2->stream_count) {
+		dev_err(csi2->dev, "Error: csi2 enable count already be 0\n");
+		return 0;
+	}
+
+	csi2->stream_count--;
+
+	if (!csi2->stream_count)
+		csi2_stop(csi2);
+
+	return 0;
+}
+
 static int csi2_link_setup(struct media_entity *entity,
 			   const struct media_pad *local,
 			   const struct media_pad *remote, u32 flags)
@@ -507,18 +520,15 @@ static const struct media_entity_operations csi2_entity_ops = {
 	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 };
 
-static const struct v4l2_subdev_video_ops csi2_video_ops = {
-	.s_stream = csi2_s_stream,
-};
-
 static const struct v4l2_subdev_pad_ops csi2_pad_ops = {
 	.get_fmt = csi2_get_fmt,
 	.set_fmt = csi2_set_fmt,
+	.enable_streams = dw_csi2_enable_streams,
+	.disable_streams = dw_csi2_disable_streams,
 };
 
 static const struct v4l2_subdev_ops csi2_subdev_ops = {
 	.core = &csi2_core_ops,
-	.video = &csi2_video_ops,
 	.pad = &csi2_pad_ops,
 };
 

-- 
2.34.1


