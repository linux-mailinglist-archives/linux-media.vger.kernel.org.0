Return-Path: <linux-media+bounces-42268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC21B52C0C
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8B563ABC9C
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8EE2E5B1D;
	Thu, 11 Sep 2025 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HFEReM7O"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011042.outbound.protection.outlook.com [52.101.70.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868932E543E;
	Thu, 11 Sep 2025 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757580302; cv=fail; b=TAm3qYUuTaaCp55C+YBuwbUuf2rpJujUQ8Mn/hMTPC0Sk1j74ZSflktxdlzq5I2j0QGfll8uHw6ZiwKhjJFNLBI0Kz3R2ozsHv5TNAQFdjU7TljyXPxuQudr69khiCbDH68hOXOJi4fjkLyd9iJBC8kkGKhhHZvsTtNqohV39RE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757580302; c=relaxed/simple;
	bh=Bwqj4YwYWMwg7phZtPiHtVOQ2tNOzMvE/8/LxBoP3XM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=lvvA+POn027tniVmC0FebwAXbsYM7+0D3740ZBP3lC4ewK/AUILOfWmaTqDZH6hcxIP/tdZZpbWE8c0mKEdA5ODL6DiYep1qkjN+ENpwl46682CUhwyK/nhHagFVbWHViU6et3M7MaH5VHxBvnqxi9uZSgYtSco8WQhqi7jFmeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HFEReM7O; arc=fail smtp.client-ip=52.101.70.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5Vc8gof/TAbYffGv9lkBFIQcsy26+YbZfEXppB+4Egy916pqigbdHl9n4Z5Z5xePBHHqnsTVHMBRS0oG7zi6VAOZtKtoZhumliPArMgM6l9ByyqVdzTZzD/VwXziYafCpMfnNJ2jbJCVOzgt1aMNEplCosrTSS+/ad2Q9w41l4ZHuAJHQK7/QjoeSxIXNVoAiRYIKwCscl4FsAxKG1J7ll5RlmyLJIY2Q/sO3sA3mg/cDwOtdpUXbhPwVqSD4ZN5sYRqY/1NWS2vUDpzq/vpIB0I156iE+m4NAE5KTojHBdy8ZmXBdAHOf0i9q/FlPj3kTXId6fkkaNfwdsW3R+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnfmLLwZ9tmXohd8zcUtCFnZwnybJ/lrmnmTUoXZh6I=;
 b=eDwV/C3Sd2RzLbPxv6h7ovtIiDffQfPKAuuMRz8ROoOQChhUWFYlUYL1Z/QVYnHp9JjTHXC4C7BVRnKTmpmUTQ5QBw48d6KWfBqSK+7mmTtBcz7Iy/1hBFh5p0aI7moDUT3TeLMAmLNT2OHsR6ocvCc5VZLouCX1Iv7FHhIA4UtyiHuf3cZ9nzX7ddLutky9QjybjajKiXP2m/cpvgQtZ6kpuVSM9qr/cSYEQAf28ApPNAk91sdQjhiZWmt4rcaA7BWALoUUropBx6vTi7O6dT8A4TEIbF2XK+SM+rMttHSAK5dtl5Y6dz6i02Nip+KuNiB5zNvs2Yvg3nRkMRC95A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnfmLLwZ9tmXohd8zcUtCFnZwnybJ/lrmnmTUoXZh6I=;
 b=HFEReM7O6cp7rFq9H0wRZZv7Zhj5eN0Ltz35vv+KLp4w8eZ1CoCROPzrBeuLgJQuqU15lfSn0KQx5C8/NTJg+dltuHQls949HVSGX0TRBr2tOzMULy+prVSpWQU/fHh9iM/0um7PsY2wbA2J4ik8yMn9+6kAc8FKSGXoUdRxyH6vqInIJES7IuZ6qhkMZFfSUrn1JDh68Z7+KyVQF/+VxXEgqJianTnXHG2nEl3bAuG6WuVa7+/FW2FWmsAXl1Cp/2vw76959DhJ5ENY/N5xmI/nmx2Bp3qHA/B+4ibLqt9jXLc2+9qjhLKOs5Jybd6artsrxzk9FJHHI1ZfaH3ztQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBAPR04MB7207.eurprd04.prod.outlook.com (2603:10a6:10:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.12; Thu, 11 Sep
 2025 08:44:57 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 08:44:57 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: [PATCH v2 0/4] media: i2c: ds90ub953: Add back channel GPIO
 support
Date: Thu, 11 Sep 2025 16:44:21 +0800
Message-Id: <20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOWLwmgC/03Myw6CMBCF4Vchs7ZmpgRsXfEehgX0IrMQSKsNh
 vTdrcSFy//k5NshusAuwrXaIbjEkZe5hDxVYKZhvjvBtjRIlA1qJGGjxteom1pQq1qpTFMPiFD
 +a3Cet8O69aUnjs8lvA860Xf9KYR/SiKBYrgoqr0frSfq5m09m+UBfc75AwqHNSKgAAAA
X-Change-ID: 20250901-ds90ub953-168628c53a00
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757580308; l=1345;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Bwqj4YwYWMwg7phZtPiHtVOQ2tNOzMvE/8/LxBoP3XM=;
 b=YPUzxvP+ngpLAjiVp6pwq/UZBQXeg5Pz+PYqAXhwTiFshuvJtocunspVp9kRfr0SCLLuauhbU
 g0uFSGXCWgOC3Tua+bjzmiU76Jp5ya/rvsw7V2vc4VR2wrlbtpwd23M
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBAPR04MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: acb53eb2-8780-4555-642d-08ddf10f7c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDg2eWN5c1RoM001MnlPSHh3blFDV09wSE4rK1pEM25pZ0hQSkcrMmlVZkd0?=
 =?utf-8?B?NE9LelQwMXNXUUZPb0VtOGFTdWRIK0V4YXZrcFJ4Q29Jb0ErZ2MvR3dNSDF4?=
 =?utf-8?B?cnM4U1JzNWRyM1R4UFlyeGp5T2JncWkwODIyQ3M0N2dyai9vYjVVRjFjcGlD?=
 =?utf-8?B?SkgwR2lwYUtYUjd3a0I1K3ZVa3dWeFowWDFBV214RHROU0NaejVkOU5XVFJS?=
 =?utf-8?B?a1hneDF1TVZDRS9rM051RmRSM3YvVG1SUE5aUCs0OXNYMmpYR1BuVWc4UnlI?=
 =?utf-8?B?NHpGZm05cVBFSERZOXNWUnpVUUpCVUxyYzBycWxBRWVkeGxweUdYNGlDS2gv?=
 =?utf-8?B?Mm1DUnZ5Sm1sZTQ1OU80Q0drc20vY0MxbXdmUkxteVJ2dG9JU1dFMHUwUEQ3?=
 =?utf-8?B?TjdLYW5JNWwrZjc2ZWs1akM3dll0ZXBYV09abXVJSXhtaFVkRWhGUkFTMzda?=
 =?utf-8?B?M2lrTGt3YkNRcUFXU1JFRU1vODEvMW5rdC94Tm85TlVhMEhPVHdEeDJlQTFr?=
 =?utf-8?B?V0tSR0RYdVZTNit3WTZwTldieXZzVjF1bFpBL1JQMVVPaExFYkZZWUtIRzRK?=
 =?utf-8?B?amNZWDcxK1NpbE01d0g5eFAyUXFNdEVia2xOWGlhL3NFQytjOEYwdDFHMDM4?=
 =?utf-8?B?SUh2QXdibGxNaTRCZWlycy9xZXl0amNWYkJZblRlSSt0Zm0xTWltR3VHenlq?=
 =?utf-8?B?dWFRT0p1NWtyUjFoeU1wZDhQVjh5RjdzU1FvSS9qbWtMYVlJMDF6MCtwVkt6?=
 =?utf-8?B?T2pxL1ZxWmt6azNVQUtqeDh1djZYKzU5U0tVai92aFRCbForOFBOcFpHakVI?=
 =?utf-8?B?aUlFbldUcUhtcm1hL0pPaEY3bWpVZ1k3aCsreWRSSDBrNm8weDBwN2VzUXBr?=
 =?utf-8?B?cjFHbUNXMGh1WjlQMEJsY1A5TncwZUh2eGNrRW5qeXl4TjFoeWNIa0JheDVD?=
 =?utf-8?B?eGh0M2ZDaWtDMlNURW91SjVUdGxTYlB2SjBrMUNyUnZXcUhWeVM5YWxwR1lC?=
 =?utf-8?B?ZU5ZM1pwSm85V1A2QUlJMHdPYjh5TUE0RTA2eGVNQ0J2WnREUHM1ekRvWFo1?=
 =?utf-8?B?Q1NORm4vNEVpczhUejZSM2pxMTd0WUlmWXBidGZnOWtSUlNxVUVxMXU5VjNt?=
 =?utf-8?B?WUxZT3BVeE1jeGdSb1FLalQ2ZnVLdXIzbEthdnhVTlY4T3lRV0NmWlJ4cGtR?=
 =?utf-8?B?djZxdDdPU0Z2MUdqei9tTEhtL21xa2pkWk9ZSU5QdC9Oc21xY0hRekNmZlRz?=
 =?utf-8?B?M3VRdFBxb2tnS3FBSVNxcnNwTkgyTkVZQVArakE5QWxWTVVNa09zRS9wSDJp?=
 =?utf-8?B?RVh5VWg5VGpJN0NTdUNWY1BaUG5sNW1vb1ZRVXZ0a3JLUituanNFMkxlaUtt?=
 =?utf-8?B?eHRpT0ZkdDFxOEg0R0NCcjVHSVRseG9YcWpmbjdlZUJndTZwQ09Cd1ZmUjBQ?=
 =?utf-8?B?QjVxMUZUTkIycE5hNEhxVnROS05Gekt0ek9qTVVNZ3V1YXozb044K0RKWGtN?=
 =?utf-8?B?OUJSWnV1UHhwUmJzSVcyZXg2bWN2L1FoVDNyT3ZmNSs2NWs2eFo4a0VnVFQx?=
 =?utf-8?B?eU9GZVp3TUF0cGp2U1RSVzNPNUU5ZWJZSEJpVzV5QkFXNHlGL21NYVRmVGNo?=
 =?utf-8?B?Zm95WEpVVlp6d29NUEVDL3dkTTd1NEE3c2NYaWdGaWVqSURPaCt6V3A0RTNn?=
 =?utf-8?B?Q2JWeEJUeXBsNjVXOTlnQkYyTlVqR1NReVNOQi9UVFNuWmM0SndER2R1cEpl?=
 =?utf-8?B?YXRKanN4WWYrSElJZVRrVHB6MlNnRDJDT25CbjFKeTNaaUZLMGU0SkFIQlhG?=
 =?utf-8?B?dE9ySVVxU28vekUvQjh5Z1BPWm4rb1ppUmU2UkU4Rms4UTFGVWUrL2gwd041?=
 =?utf-8?B?UDI4OXJaOVNRMlZwR0JESGFad0trL1BoTGFtUlhMWHVwVGE0M2s5UCt2cHhr?=
 =?utf-8?B?WVBOYUpaMkJVSWN2MStkSWd2M09DNm9vVU1rT3hqY1RXRTNPSWxCdlFkelFJ?=
 =?utf-8?Q?es+Fu/yUSl2ul6xEGj26bAUuvsESSw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RURibG43b2J6OTNDWGhleG9MV2g3Mk9ORktDa3ZKNlI2aE9TTGJCeUpGZDVs?=
 =?utf-8?B?YXZNd2lUV1BhNStUZms4THA3Q1M0QmxMQmZGRjhycnhmTjZXcldkaTlqVXVM?=
 =?utf-8?B?Snl2S3k2eFBBcWlSTDlldnBoNEY1ZndoNms3V3M1QUJvaWVaMWVZUTQzRXVh?=
 =?utf-8?B?TTFsbXByc2FndmFYM3Urb3Q2S1FYbGJxd1hSUGlldXJvb3RLakcrbHJMZEtT?=
 =?utf-8?B?R2tFY0dCVXdoNDB4NnVFRjV0WXVPRWt2c1Rqb0dTNTBsbXFRZHdrajdNZzhP?=
 =?utf-8?B?TFZqRFZSU1lWVnBlY2ZvNHhkOWp0bHlMdjExczNZeWxYN2xZYVB3TXhFeHF4?=
 =?utf-8?B?NU9NKy9EZDZpa2I3L2FrdzBFZERyeUJYb2hSdFdhc1BKSGFoNnFoUllzMWZF?=
 =?utf-8?B?Njk4bnk0UW81QWZFcG0yOXJjUkFGeGowUVJON0M4UGFPRUtvcEFabi96VDEy?=
 =?utf-8?B?YUpQVXFHUGt6dlhGbk5lSUo2Ull4ejI0ZWZ0ekFLSEM3ZU5SMGZiMnhHNDc0?=
 =?utf-8?B?UWpVWnNUNCtYVmt0TUZaOVF5NFJldnIwMWczM2l3MjhhR0ZoY2RnZk9Tb1ZD?=
 =?utf-8?B?UGQ0K2JKdzV0b2ovdWpzc1ZZb2RSY3JkNVVSRVVOdi9iZzUrdzFRcFFhMWZM?=
 =?utf-8?B?NmxseUNWMHdqTlhVcGtheW9USUFxRHZtMlNvY1hwcHY0OE01Skx4enE0ekgy?=
 =?utf-8?B?VE4vd0xCQU05N0hScFFMRllSU3lPRE42dkpOV2NXWVVLSUFxWkdKZjlDcnpB?=
 =?utf-8?B?NDVOK0FIUkxxa1VCOWwrYTJKYndCR243YkducldMYzV1ZkI0a0djN3BwZXAv?=
 =?utf-8?B?YkNjNENnQ0FFWklvVTBITkx6OEVIeWNHMXlDYWIvU0poTFMyS3B2RU9PZjVh?=
 =?utf-8?B?T3FzbCtzMkt1amJITW04SkhGMmNQS3FCYWoreld2bHB2QStCdFpLQVV6R3lS?=
 =?utf-8?B?bkxsbG1saUVuVTZodXQwQ2VFSjQ3bXVFZTYxUTdQeFQ1R3RqcTZHbUdwaStB?=
 =?utf-8?B?WmNWbnBiczloblBxOUR2ZHhzNnZrSTlhaFYvQk5mZ3poRXJoS3Q5ak5xZXU0?=
 =?utf-8?B?RCt2YTd1dzhlOVQzZjdLS24yQnpGVldPelg3cElkR25oWmM3ZHBoOUVMWE5k?=
 =?utf-8?B?UVk0LzFpM1UrU2xCMGZuc3V0Vnd5Q25EVzhxSllnOTV5YjNxWWYvUU9hSHpo?=
 =?utf-8?B?OUhmZHAvS1VEMW5DZHhMVE8vaWN6NjlMV2FLNlNwMnlPU0tOSm42clN4OS84?=
 =?utf-8?B?SjY4anBBYjlBRXY1WEd1aUFRMERPR0FvbGRQVldDZGdxS3ZsWFpaL005SjVl?=
 =?utf-8?B?cUQ1cTZYNDN5RGozVzlwZEJIKzZZQXFvTlhhSHFhcXZJTk4vVUEvWUk4TkpT?=
 =?utf-8?B?YUdxV3g2ZFZvL3hwUUNmaWIzVnBNWmF3VHNYSGdkMjQwMi91Uk9RZDNUcjhG?=
 =?utf-8?B?ZlNJY0xMNkRCREVGakwwQ0h2NTJVN25yTUxVdDFiOGF0c3NQUnlqSytIUFdz?=
 =?utf-8?B?RENGRmZpcHV1ZThQTjlBdzlGTEZQcERaTUlXK2pWWFRFaVAzZ0k2TUZOM01k?=
 =?utf-8?B?OHlDUkdaSHIwU1pFRkxPUjJ0bWJGTmd2MUh1c0xQVHpTaE82ckRkVHpUVFVp?=
 =?utf-8?B?WFZrN0Fhai9RRFRtRGtRRjBZNjA3Y2FtUHR6ZmRpTDdVVzd6bmttUkFlYWV1?=
 =?utf-8?B?OTRtMXdDdC8xTkFsQ3BKSm1JbmN4aGhjQUFTWXlGeTFZOU1SdmNSczh2MXVj?=
 =?utf-8?B?N2laMkRkYUxEbnRPL0J5K2FlTEtkRUVJMlR3SVIzWnNEeU9PWXY0SmJDYVhO?=
 =?utf-8?B?MzBBTkRiRzBYS3M0R0JlOG9SOGRxV0R0bXYrV0pzblp6ZTdYeUl2M3FyMUk0?=
 =?utf-8?B?VHh1a0xBVnYvM2lhSHlOUnFSVzA3WUsxazZnZFdmTitDMTZVanl6aGpPNmk5?=
 =?utf-8?B?OGFoVU9MbjUxZU5NUFpGZEtFbnZEeGE3UEYraDdEMzFLSFZ6TDM1Z0tubHB0?=
 =?utf-8?B?Y2ZyUE9lQTVpNm1kUENiWS8xU1lndTlpdDRsVmxwT3hoUWZkY1Q2ZjJ2cXpr?=
 =?utf-8?B?cHR0azA5Y3VUUXZpd1Z6b3Vsc2FCNzRYVnd6YjduVmJDR1EydnFNcW1EbUx1?=
 =?utf-8?Q?SnWG1s/6E9L0tm7F9Nfp6qbOF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb53eb2-8780-4555-642d-08ddf10f7c8b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 08:44:57.4711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwpkKc9Fi3/GDIENj4iCScRbGdHuLqXPXOn5v63hA9vy2rzHEA5wOLFbFrvb7h8f1yyXYzrOJApJHWibrcLIFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7207

Add back channel GPIO support.
  dt-bindings: media: ti,ds90ub953: Add third cell for GPIO controller
  media: i2c: ds90ub953: Add back channel GPIO support

Use helper macro to simplify code.
  media: i2c: ds90ub953: use devm_mutex_init() to simplify code
  media: i2c: ds90ub953: use guard() to simplify code

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- Remove new property ti,gpio-data added in patch 1.
- Add third cell for GPIO controller to select GPIO output source.
- Move PTR_ERR() in dev_err_probe();
- Link to v1: https://lore.kernel.org/r/20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com

---
Guoniu Zhou (4):
      dt-bindings: media: ti,ds90ub953: Add third cell for GPIO controller
      media: i2c: ds90ub953: Add back channel GPIO support
      media: i2c: ds90ub953: use devm_mutex_init() to simplify code
      media: i2c: ds90ub953: use guard() to simplify code

 .../bindings/media/i2c/ti,ds90ub953.yaml           |  8 +-
 .../bindings/media/i2c/ti,ds90ub960.yaml           |  4 +-
 drivers/media/i2c/ds90ub953.c                      | 99 ++++++++++++----------
 3 files changed, 59 insertions(+), 52 deletions(-)
---
base-commit: 34837c444cd42236b2b43ce871f30d83776a3431
change-id: 20250901-ds90ub953-168628c53a00

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


