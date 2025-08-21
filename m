Return-Path: <linux-media+bounces-40672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B81B305E3
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3A1E1D2041A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F9E35FC17;
	Thu, 21 Aug 2025 20:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CmMqDVUo"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F9B35FC05;
	Thu, 21 Aug 2025 20:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807469; cv=fail; b=rriqFPvec3MmTQ7Dm8iUnYuFPPK6LzdtZN90KWeudnzsNfIUonhbyMtTwZm06zKG0Qcq5wyccy41fZ+cWPMgbccw3xyCVpeiRTC7aLkgClB8K8bNPnyw5UJNKF4Dmvdwyks7qbyEZQlFJZz74riTMfZgTuz8tqKuVQdcaJOS2sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807469; c=relaxed/simple;
	bh=O2r0DLpCKo0zS1uYMkQTsAeCRUOb2Rnw55ytXFmYtWM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UhPpyh0eozZy/v2335RfZUvY/Qi2wnOYcWFiUf9qpP1reInrNdvnZSc54fdEUrvgD6MMEiGlKFiMNKJa9tM1J5d11WjPEpzMQKSkfIW0Jm1EIEFmDvA8SD8V+h5+Mi/H46zq+z7WnXafe83gHuRpViVVLuPDXC5eQqlMjnXGkxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CmMqDVUo; arc=fail smtp.client-ip=52.101.83.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pI6mNOte2ZnXyxUTvCnEebRdfxysTbzep5TBTmmJ9CE0TuGTTzqRzG0bzYrwc/5QjtkaLUftmnl01tChxGNhuo3tb4tcSr+iQvoTPjtQNZDxfyW7Ze8UTxjvU9LpqE1Z9/w1HWN7WE40U+JNtoLeqV0QVaNTqYR07Yk3PTEJGDdhQ6t06NbaxkL+HrcRE3NucWtWDi7cDOMUDnTwyLc8H6bntLy7Va453aGFqybklfjQ8xeSt+kN4NcKUr1PAbsCvxMgmSanpYcW6dpHS4KsEvvixJ4U51fclsefg+OPFb9LPMbcJrlwSu0WMYkNo5/vFAulsOo4pfe/L9KFHuFM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSxOLm0rqTKeeONfHo14us2eFGPUdpblJT3Uj5AeO6M=;
 b=eov0zu7jIDkX/OolXWwYVX6A++jbKvRuSTVI9jUl3l967tIwmXT87yNUzNsnKTsU9VkhzQbZlozNJFWdNBZfHKkNfECJrAlHvduHtuoLwMuHfItfRoNHqjXpCXWInmb2BOqbRc49xTbVjni1fyx7uXL4pG294zPYmnqjktuEyFVrYZEUsSvRGYWMw8M8g+5ha7VqCULREpk+mN5uWH/cOSBTjGqxabNeKAgkqrQEAngOwGm8tLDPEO03dFK1CZ6J8057rujOShwEl/YMUVgKNzEjLGf8tGgwrBI1cSRjTfmqrl01cEC+3VXS7ExcLbADxyr4W7UkzPhWdkxv06B41g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSxOLm0rqTKeeONfHo14us2eFGPUdpblJT3Uj5AeO6M=;
 b=CmMqDVUosGT/KVssQQLhF8KgHFwfX0wrKO2JW1QlJcSkicX36q6B46qJnhjgRdgWq1Q+o7tQYSzY+lSi7hwJQhGO9uY6KRU/Db5DgF2M/IQhZAzB8+HN8nyfmYzJkJW0YJZy4JGh6VzeHrKI0/CAYubXHohSjEdB1I3GIbRyhBncKLXy63Rib2D4FzxC1/Es2LEQt+zpeNTODfScUzqsO4n7bt2jDGoxOzZI4Ts2+8N+58qyC3DCneyrGMdhd00fvuYf0dq+ZRp8UBfwf9mUS7bogjm/7O/undKd3qotor2FOl57RKX19LdU5Lkoo4f0mwfs1u+MYT4n8RkNW8hPUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:17:43 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:17:43 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:50 -0400
Subject: [PATCH v3 15/31] media: staging: media: imx6-mipi-csi2: move dphy
 init part to imx6-csi2.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-15-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=7975;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=O2r0DLpCKo0zS1uYMkQTsAeCRUOb2Rnw55ytXFmYtWM=;
 b=TIWjYs5giou28iOoe1skKmoEJQtJus4nHqE/ANxbalQeLdQd7R+Zi/CwaxH9BEenp5RIlnAsd
 K52Fgp3+WOdDtZJv73Q12PIyLcIZFbQahFolNMpiIU08qITeRAbOCIG
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
X-MS-Office365-Filtering-Correlation-Id: 3a250aba-32b8-47fb-8c55-08dde0efc8d7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SzBsREI0SVMwZUlCNk94cys0V1dLR0wxdlhiWTVRcVpSTHpqWDFHSjliZDh0?=
 =?utf-8?B?RkJDWWpjdyt3MEF1M3B4ZU5UUjNuMndmYWhsSkdmRDJBWXc1NElsR2Q1ZUFB?=
 =?utf-8?B?OWllckFUcEp2VkZBL1FKVzNZcXdyNlZnYzNmU0pkOEIrNGF0aVZQank2ZHQ2?=
 =?utf-8?B?VTRONEk4TG1TNC9tTnVLcGZFWUdEN2VLM0VINkpJSnlWNWJGb1Y3MTEyL3Zw?=
 =?utf-8?B?MUFkQzdYdW9OQi9BaTZNQXpreGRDcGpLakdqMzEyWTRqbFh6MXR1RjJCUFVh?=
 =?utf-8?B?aS9VdnRzRlZyWitWTjNGZkhicElzKytGcXBIVDVlKzdqTjgxMzZMWm16dTY0?=
 =?utf-8?B?dVkwYkk0QnJsWUZoZGE2YS81L1BoUXpxMUVkMW4vRmJncEwwWXR6UThlMkNn?=
 =?utf-8?B?TGdFVjdtNEs3WWJGdXNVSjVOeEtaQ1BYZGUva21MUHNpRFlVc1ZlNVB6ZFRa?=
 =?utf-8?B?dFVGSXBTWFpFK2tiY08yVWtlZlBseDJZR1A0Tk11b2lsdTY3aDRSVWkwOTJx?=
 =?utf-8?B?MWcvRzFYcjg2VEl4QVFqNlhMOTYzcHBORzRHS2I5ZHBSN3F1NEw5MGQwU1Fp?=
 =?utf-8?B?TWlrV3gwYjBwdGM3RHFUV2VWd1JQL2YrKzM4SFJKSFg0d1NUMGplOHVZL2Fk?=
 =?utf-8?B?dTE5QTRIWlRuQkhMUkx6VGt2N0F2cXY3Y05vOURCZHRXVk9zMkdTLzRwYkFa?=
 =?utf-8?B?TjlJbi94aTdJM2tBRVZ2MEJNNGhDdHZOY0RkcW9lb0VuaUw4Snc4Zy9HL3Bo?=
 =?utf-8?B?Rm55Q0FJZGt6cHN6dWN0c2wxQU1zbjcvZ3hlWnY4ODVvSkRWazRwcjF2YUoz?=
 =?utf-8?B?WU5DSkx4eFphKzJsMUx4RlNHRG40NCtIcHBxekZIZTFjZTRxaGZya0NQRDJQ?=
 =?utf-8?B?K3hDcTRwWG5lQXpvVU1OdkJLMkJsSVVRZXhxTDhITS95VGFDQ214ZFhnRCtG?=
 =?utf-8?B?cHdlc1JEb3NkMmJsMkc2RkNkRVIwOEFwdnVjVEt5VHAxOXFDclo1K2xyNTIw?=
 =?utf-8?B?eVpSN0doSUdwcUk5Nllvb1piVjg1cGx5K28zajNqNTBZcWdjcHRrWFZaaHNk?=
 =?utf-8?B?Y21UdGpTY0dBLzhLb1hnWkpnajcxaUxZSmlqOElpakJJZEYxMUN3OHF0R1pT?=
 =?utf-8?B?ZFZ2bHpXZzZ2Z2hhSTB5QTUwZk5XeGRJdVhaajZVM0dkZlAwaUxTdkVmSnJi?=
 =?utf-8?B?MkNVYjNsdXRvZ3JtcnpvTDZjT3BMQ0xKYTkraTN1MVFMRDNoWXVPVHNMYW1G?=
 =?utf-8?B?ZDhVV3hZR0tzMC8zc2UvVExGWEo5anJTcDdqOWtNa05Xclo2VjJnNHhXNm1s?=
 =?utf-8?B?Q3hGRnJFdWdKREo2MzYzRDFhY0RVRlgxOGdDRWlySTYyMFVpTXhhQ1AwZTM5?=
 =?utf-8?B?QlE2QW4yQzRKNE9rYjF2YmZCV0lxQzIzak4rN3Z5dXZrQy9VQ0NtZ3hBeCtH?=
 =?utf-8?B?eUMzSDY1ZjdweW5qalF6MVBXblFWeG5tcHZzVmZWbjQ1RS9ONVdJVXQwL0Zu?=
 =?utf-8?B?MkQ4QUNpSlBTQUg0ZUtyR21WaHZmTzdZeU5hbXE1QUxtZUtoYWswaDNZL3JN?=
 =?utf-8?B?RzkyU0JZdDRIa3o4cmhVQ3FqK2NNN0djMFlDZCtUK2JkWHlENDZkWXA0OHRp?=
 =?utf-8?B?MDNBMHpsSjE2NE5SSmZPUFd1Z2hpOXp5SDNuSHdzK0kwVCtkRFlQdG5mUWxJ?=
 =?utf-8?B?WXBEWnNYOGZpcTRkaDdWaDlhREhrS0xlZHFobTBJRW5leVorMzZaajRqeC9F?=
 =?utf-8?B?WXk4ZmoxQmhManJwaHIxeW1tKzcvMUhqbUpIeFVsdjZDNzJCVjhSNkt5VkIw?=
 =?utf-8?B?MlRsb0JsWHNsOTRYaEJEazhmUjQzZHdxdmRRazNkVVE3cUtpVWFsRHRaQ3pX?=
 =?utf-8?B?djdmOERDcERBQlplWEpzNm1nMTRhblRhbzNWQVdaVVFlaFdBZHE0cUEvZGJY?=
 =?utf-8?B?UFlnMk9qSjRaR1BLdEI2VkU4c002blIvVjhpcFYxYnkwUlZDRjRlQ28rQUl1?=
 =?utf-8?Q?1Hn2fguUYeEjvl/ol0FLdlgstwwAWc=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UWtLS3lvTXc5U0tlWHlmbEtmclA1ME0wd2hNMEVjeWJldjBuRjhQSnUrZmhH?=
 =?utf-8?B?SE5qYm56eCtldzBGS1dTb3VqQVp4bFVHU05mVHpRalkrV3lqWEE2NzVJRFZB?=
 =?utf-8?B?bFlEK3EyRUh6TnFyS05Kb3hDOXgyd1EwL21sMGkxclJoZVN3bG9hVjY5bG00?=
 =?utf-8?B?Z1RHMHM3cU8rS290Qm9yb2pUbUpyYTZhMEUrS2tpV0JqMEpmckJBT1U2blEr?=
 =?utf-8?B?RlNJeGZlejVHVUZKZkRiSmxPcng2Q3p4S2ZXSmJKQzlINVQyL0d1TkN2aXFX?=
 =?utf-8?B?T1lYT1lZV3NZWDI3OE9qZVRnc2p1VkZ6ZTFKYnRZbHFvbTNDSlFvelNGTFdM?=
 =?utf-8?B?YURTMGlRdi94b3dPUG8rWHh2VkRkZDR0WXlTTEo3UmR6eVlrakY0Q0U1OGxS?=
 =?utf-8?B?czFiK0dqT0ttTXA2VmRsb0ROSDMvUGRDNHk0MEIrZkNnbjhiQ0YxenlwL2dP?=
 =?utf-8?B?SHB0enVvMHVVY0FWV2wrNkx2L2IxbGRlZjF3NGJ5TU1NZUpiWTRnZTJmK3pj?=
 =?utf-8?B?QUlrWFZZeGJvSTBnZDJ5QlBGeVRadEpSWDR0YjBzc29TREJxUUZiQ050d2Nk?=
 =?utf-8?B?K1ZMU0x0eTVRR0xCM1pXSkxjL1JVaytPZ3JxRU5WcUtvbXZhWWpNRThPYmRM?=
 =?utf-8?B?ZTd3ZzByS3dZOEd5eEVydjliVjR5Rkh4MlFYUTI5RXMzQXFac295NEUyT2d3?=
 =?utf-8?B?Ry9JbjdqanhlU3g2RlUrbWorQ3FUMjB2UjFFWUFmNG1idnBlZXVoN2pSbFJ1?=
 =?utf-8?B?S0JHbEZhemRoRDFYSFFlZzUwdytZa29IN09QV3JINTBiTmVGY2h0MUV2YnIw?=
 =?utf-8?B?aUQ4UlZiQ0RPSjc0dUFFYVFtSkcva0dDT1VlWXJVMnVVampjUGUrdUFNTkZC?=
 =?utf-8?B?dG5VRDJZVDE4UjVrY21kV04vQmM3U1N2Sit2azcvclRMNmw2ejVwWThlaGY1?=
 =?utf-8?B?ZURwSjJrUlpQdS9taVIrWksyVi9zM3lzc042UDJBQmw0WlJ1anB5WXZsbE81?=
 =?utf-8?B?ZVVCZEJTNXBhbWt5Zkt3UTIza0VacDFvT3krd0VEL244aTFGWmNnampyWWNk?=
 =?utf-8?B?NnZnaEc2RW5NRDlEYVE4N3BNN3NMa0duSHl3VUNzbFB4ZXJwYnhYMzVCNHBZ?=
 =?utf-8?B?am5pUG02YTZjeXlSN2VRYWJGK2E1RnI2QVcrYmZaOTVabDNXUFZQc25WYVVn?=
 =?utf-8?B?cytXV054TTVHS0F3c1lvQ2lBd3NIMHRjUU5RZm15OVU3L1dwSjBjV0l2eHRi?=
 =?utf-8?B?bGZFVGlNYkdJY01uV0diczlpNzdGOGE0aHJXb1VFSXRQTTJTMFAwL241dXNM?=
 =?utf-8?B?M2IzQkIyK3J4K3drYXNNVklPWit2VHNwZUIwY2lKUXdxU3ZiVHY3WXBCRlRC?=
 =?utf-8?B?bjdNSnRBeXZqWWVuNUErVTc0Uk1sQVpKeUNWb0haWTM5TGhPOWJWT0ZtYm9E?=
 =?utf-8?B?SFhYaXE4YjR5SWFWUm1pWCtwNnV6SjBsbHgwVjZEUE9ZckVmQVdyT0FZYmZJ?=
 =?utf-8?B?NjE3eVBLZW9zdUhrVTc1ajd2VUFUTklhaXhTcDdRTTc0QnRuanE3cFBORVoy?=
 =?utf-8?B?Y2IwcElsUTFpWjNxYjQ1MVhjNVB3SDJ5U2oyckZ2WkF3NktXeHJYUWxTRVhG?=
 =?utf-8?B?MzhPSUt4K0toaVpQbXpBZjJ0VTVYN3VwU2VOOG1GeTlrVGNpaGtyL29SMEVY?=
 =?utf-8?B?aEJDWEF2ZXErM09ERFNGclNJamplTnAwZndHNjZ2TitYcmpNcE81eEI1ZDRZ?=
 =?utf-8?B?ZmFCOHFpV0lpY1MxaFdEYmpKd1ZoakROR3ROME1nNDhkejlMTCt5d255bTBm?=
 =?utf-8?B?VHdWR1VlMlVWcm8rc2QxUTNlVys5aDk4a2xmNXlmMEpGbWtHMVBiT2dzaE5u?=
 =?utf-8?B?ZGRLam5tb2dnUkJ3WVRBaFZOblFCRCt3d0RPZm9EbmlCODI5aFRMOURCTXZM?=
 =?utf-8?B?RVhFQ0x6WmpEOHhmdm9uaXV4WTFpY2JqSFFpZG9MMlBpOFY0V1dDMCtwcjg5?=
 =?utf-8?B?T0lKWmtEeWoyYXFtVW9ELy9mRGZ5WnNBRklvdTZUS1hlZmVRbE03NStBTm9I?=
 =?utf-8?B?OGtOaGRTOTVVWlo3cllPWG1nbkppTEhmb1ZLM29BVkRQOVk3Q0pKQnlCUU5I?=
 =?utf-8?Q?dPLs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a250aba-32b8-47fb-8c55-08dde0efc8d7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:17:43.0486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YC3VcLiAhSVMuhw3LotRB7oaHPNq2wAFOEJks0Ig3f+fGGhU/1F652raQrMEq/OqGb6tYlSzLSZJuUCmFhO6ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Move dphy init part to imx6-csi.c.

Prepare create common library for dw MIPI CSI2 controller.

Add callback for dphy_init in struct dw_mipi_csi2_config. New driver should
use phy interface.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-csi2.c      | 55 +++++++++++++++++++++++
 drivers/staging/media/imx/imx6-mipi-csi2.c | 72 ++++++------------------------
 include/media/dw-mipi-csi2.h               | 21 +++++++++
 3 files changed, 89 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-csi2.c b/drivers/staging/media/imx/imx6-csi2.c
index 062db72a36ef294566272d9f39d82e9414640e9a..696644aa04c83b1f2877b2b2315202627d927e96 100644
--- a/drivers/staging/media/imx/imx6-csi2.c
+++ b/drivers/staging/media/imx/imx6-csi2.c
@@ -16,6 +16,12 @@
 #include <media/dw-mipi-csi2.h>
 #include "imx-media.h"
 
+/*
+ * The default maximum bit-rate per lane in Mbps, if the
+ * source subdev does not provide V4L2_CID_LINK_FREQ.
+ */
+#define CSI2_DEFAULT_MAX_MBPS	849
+
 /*
  * i.MX CSI2IPU Gasket registers follow. The CSI2IPU gasket is
  * not part of the MIPI CSI-2 core, but its registers fall in the
@@ -28,6 +34,54 @@ struct imx6_csi2 {
 	struct dw_mipi_csi2_dev dw;
 };
 
+static const struct {
+	u32 max_mbps;
+	u32 hsfreqrange_sel;
+} hsfreq_map[] = {
+	{ 90, 0x00}, {100, 0x20}, {110, 0x40}, {125, 0x02},
+	{140, 0x22}, {150, 0x42}, {160, 0x04}, {180, 0x24},
+	{200, 0x44}, {210, 0x06}, {240, 0x26}, {250, 0x46},
+	{270, 0x08}, {300, 0x28}, {330, 0x48}, {360, 0x2a},
+	{400, 0x4a}, {450, 0x0c}, {500, 0x2c}, {550, 0x0e},
+	{600, 0x2e}, {650, 0x10}, {700, 0x30}, {750, 0x12},
+	{800, 0x32}, {850, 0x14}, {900, 0x34}, {950, 0x54},
+	{1000, 0x74},
+};
+
+static int max_mbps_to_hsfreqrange_sel(u32 max_mbps)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(hsfreq_map); i++)
+		if (hsfreq_map[i].max_mbps > max_mbps)
+			return hsfreq_map[i].hsfreqrange_sel;
+
+	return -EINVAL;
+}
+
+static int csi2_dphy_init(struct dw_mipi_csi2_dev *csi2)
+{
+	struct v4l2_ctrl *ctrl;
+	u32 mbps_per_lane;
+	int sel;
+
+	ctrl = v4l2_ctrl_find(csi2->src_sd->ctrl_handler,
+			      V4L2_CID_LINK_FREQ);
+	if (!ctrl)
+		mbps_per_lane = CSI2_DEFAULT_MAX_MBPS;
+	else
+		mbps_per_lane = DIV_ROUND_UP_ULL(2 * ctrl->qmenu_int[ctrl->val],
+						 USEC_PER_SEC);
+
+	sel = max_mbps_to_hsfreqrange_sel(mbps_per_lane);
+	if (sel < 0)
+		return sel;
+
+	dw_mipi_csi2_tstif_write(csi2, 0x44, sel);
+
+	return 0;
+}
+
 /* Setup the i.MX CSI2IPU Gasket */
 static void csi2ipu_gasket_init(struct dw_mipi_csi2_dev *csi2)
 {
@@ -74,6 +128,7 @@ static const struct dw_mipi_csi2_config imx6_config = {
 	.module = THIS_MODULE,
 	.name = "imx6-mipi-csi2",
 	.internal_ops = &csi2_internal_ops,
+	.dphy_init = csi2_dphy_init,
 	.grp_id = IMX_MEDIA_GRP_ID_CSI2,
 	.gasket_init = csi2ipu_gasket_init,
 	.num_pads = CSI2_NUM_PADS,
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index d591288d2240c9042851f3a862299d372af9775c..8a8741e1c688756ee755e9a13991ccca893e5b5c 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -21,12 +21,6 @@
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 
-/*
- * The default maximum bit-rate per lane in Mbps, if the
- * source subdev does not provide V4L2_CID_LINK_FREQ.
- */
-#define CSI2_DEFAULT_MAX_MBPS	849
-
 struct dw_csi2_regs {
 	u32	version;
 	u32	n_lanes;
@@ -146,9 +140,11 @@ static void csi2_set_lanes(struct dw_mipi_csi2_dev *csi2, unsigned int lanes)
 	dw_writel(csi2, lanes - 1, n_lanes);
 }
 
-static void dw_mipi_csi2_phy_write(struct dw_mipi_csi2_dev *csi2,
-				   u32 test_code, u32 test_data)
+static int dw_mipi_csi2_phy_write(struct dw_mipi_tstif *tstif,
+				  u32 test_code, u32 test_data)
 {
+	struct dw_mipi_csi2_dev *csi2 = container_of(tstif, struct dw_mipi_csi2_dev, tstif);
+
 	/* Clear PHY test interface */
 	dw_writel(csi2, PHY_TESTCLR, phy_tst_ctrl0);
 	dw_writel(csi2, 0x0, phy_tst_ctrl1);
@@ -167,6 +163,8 @@ static void dw_mipi_csi2_phy_write(struct dw_mipi_csi2_dev *csi2,
 
 	/* Clear strobe signal */
 	dw_writel(csi2, 0x0, phy_tst_ctrl0);
+
+	return 0;
 }
 
 /*
@@ -174,54 +172,6 @@ static void dw_mipi_csi2_phy_write(struct dw_mipi_csi2_dev *csi2,
  * https://community.nxp.com/docs/DOC-94312. It assumes
  * a 27MHz D-PHY pll reference clock.
  */
-static const struct {
-	u32 max_mbps;
-	u32 hsfreqrange_sel;
-} hsfreq_map[] = {
-	{ 90, 0x00}, {100, 0x20}, {110, 0x40}, {125, 0x02},
-	{140, 0x22}, {150, 0x42}, {160, 0x04}, {180, 0x24},
-	{200, 0x44}, {210, 0x06}, {240, 0x26}, {250, 0x46},
-	{270, 0x08}, {300, 0x28}, {330, 0x48}, {360, 0x2a},
-	{400, 0x4a}, {450, 0x0c}, {500, 0x2c}, {550, 0x0e},
-	{600, 0x2e}, {650, 0x10}, {700, 0x30}, {750, 0x12},
-	{800, 0x32}, {850, 0x14}, {900, 0x34}, {950, 0x54},
-	{1000, 0x74},
-};
-
-static int max_mbps_to_hsfreqrange_sel(u32 max_mbps)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(hsfreq_map); i++)
-		if (hsfreq_map[i].max_mbps > max_mbps)
-			return hsfreq_map[i].hsfreqrange_sel;
-
-	return -EINVAL;
-}
-
-static int csi2_dphy_init(struct dw_mipi_csi2_dev *csi2)
-{
-	struct v4l2_ctrl *ctrl;
-	u32 mbps_per_lane;
-	int sel;
-
-	ctrl = v4l2_ctrl_find(csi2->src_sd->ctrl_handler,
-			      V4L2_CID_LINK_FREQ);
-	if (!ctrl)
-		mbps_per_lane = CSI2_DEFAULT_MAX_MBPS;
-	else
-		mbps_per_lane = DIV_ROUND_UP_ULL(2 * ctrl->qmenu_int[ctrl->val],
-						 USEC_PER_SEC);
-
-	sel = max_mbps_to_hsfreqrange_sel(mbps_per_lane);
-	if (sel < 0)
-		return sel;
-
-	dw_mipi_csi2_phy_write(csi2, 0x44, sel);
-
-	return 0;
-}
-
 /*
  * Waits for ultra-low-power state on D-PHY clock lane. This is currently
  * unused and may not be needed at all, but keep around just in case.
@@ -332,9 +282,11 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 		csi2->config->gasket_init(csi2);
 
 	/* Step 3 */
-	ret = csi2_dphy_init(csi2);
-	if (ret)
-		goto err_disable_clk;
+	if (csi2->config && csi2->config->dphy_init) {
+		ret = csi2->config->dphy_init(csi2);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	ret = csi2_get_active_lanes(csi2, &lanes);
 	if (ret)
@@ -680,6 +632,8 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	csi2->sd.grp_id = config->grp_id;
 	csi2->config = config;
 
+	csi2->tstif.write = dw_mipi_csi2_phy_write;
+
 	if (!config)
 		return -EINVAL;
 
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index 12e1db1d149513fcd0db8c191c801cb144d18143..935c664440aae82d69f0253a551b91ec4ff2724e 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -20,10 +20,26 @@ struct dw_mipi_csi2_config {
 	const struct v4l2_subdev_internal_ops *internal_ops;
 	/* Deprecated, should go through phy interface */
 	void (*gasket_init)(struct dw_mipi_csi2_dev *dev);
+	int (*dphy_init)(struct dw_mipi_csi2_dev *dev);
 	u32	num_pads;	/* Max 64 pad now */
 	u32	sink_pad_mask;
 };
 
+struct dw_mipi_tstif {
+	int (*write)(struct dw_mipi_tstif *tstif, u32 indice, u32 data);
+};
+
+static inline int dw_mipi_tstif_write(struct dw_mipi_tstif *tstif, u32 indice, u32 data)
+{
+	if (!tstif)
+		return -EINVAL;
+
+	if (!tstif->write)
+		return -EINVAL;
+
+	return  tstif->write(tstif, indice, data);
+}
+
 struct dw_mipi_csi2_dev {
 	struct device			*dev;
 	struct v4l2_subdev		sd;
@@ -51,8 +67,13 @@ struct dw_mipi_csi2_dev {
 	struct v4l2_subdev		*src_sd;
 	bool				sink_linked[DW_MAX_PAD_NUM];
 	const struct dw_mipi_csi2_config *config;
+
+	struct dw_mipi_tstif		tstif;
 };
 
+#define dw_mipi_csi2_tstif_write(csi2, indice, data)		\
+dw_mipi_tstif_write(&(csi2)->tstif, indice, data)
+
 static inline struct dw_mipi_csi2_dev *
 sd_to_dw_mipi_csi2_dev(struct v4l2_subdev *sd)
 {

-- 
2.34.1


