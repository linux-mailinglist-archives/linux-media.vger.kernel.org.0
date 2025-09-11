Return-Path: <linux-media+bounces-42269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1ADB52C11
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F38B51895D44
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DC42E6CA8;
	Thu, 11 Sep 2025 08:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XQPc45gU"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013034.outbound.protection.outlook.com [52.101.72.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD452DF12C;
	Thu, 11 Sep 2025 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757580308; cv=fail; b=Av3CY1ywBPnwdb6lWR9MCcHax1QRqIaP++MwKNG2m8K6KGFDs0pORJyibexzbmBdPr3Qcx4H0K+0KJzk3kSEzCIPTlAebVzPLLxM72L4y/a0LPfQb+Pu1DY4nkXTLToBGWRuV5C+DLkj6zujIQSAMYyAKkFyQIXL3H9yVOzC8wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757580308; c=relaxed/simple;
	bh=vnNqjrorFqjiYR0OEX2t6f7x5OyXLa4flu/HsqOKNEc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eFSdjM/5t0sEVTJQnyZ/ETxIdC/TkBEAIBSvgWmhLfVC/ZddDTI0Jv/o76ofyMX5Ytng27zPICKos3s+fsCAvGci1wTzEGCH5rzWP6WureS/QfsRS0DVphn++YaGssXwKSjYA0Goj+O9X3vSRRhzWWh1unVCbU1TmgLubL+E3wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XQPc45gU; arc=fail smtp.client-ip=52.101.72.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTM3O2Kgfo/rp8UywOWVY7lJ2dZj8TTxmFlq1CSAJ6L52yVWuffUQxg54viq/vVvuVEDbX7pHg1fXBV++bwNaeACKxAfJt3sCb/SbivAVGwFlHTlFUOdVppuIv03VlejAQ0itdgCxxwKXFsKffVBVVl04WGXTw+FcsPL9Zg9Gsr+dFdd5mcuITjEYDkYijzYEQTePCWcTKUkS5SLxIGFXcma0qO8fkr3LL9dqP7vCyjew1f+ixqGO/eUnzJUnO7Pc7In+grSzNUfCwy0TTu1en2IBB9zDylgvddV0VJOa2pLixKeWEY2nBAdaXX0l3pqnNdQjFO6gOKEw2p2NsPSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6k8N54HFsrN90uPIvk4JVBaqu9mWtjHVkVARcU7n588=;
 b=UX+lZ81g9KXeVHitbzLfeIxVRWTHv//s85uVasuw6qzwxtaoWQ8y5cdHu9Zif3jzutuJ31EGattSvJrOGiz2KtLRHgMWl5TFIZEZ38dKYJJFrVIJJCtPGdRh1nLx5CRTXv3lUeYu+09a1zRh2iWC4gboh7gyFuXyir2KA3vW0SaaO1LGniZK//6CpGyQ6dScjKsAxKSqdHZ85brWoqOabWssxwaKbsffdfvye1ftbjsNy+AmwehHdfZ3ajKCCp2fE9nxGuk01/6SkwJ1go+5MafJ1c8NkM4oNIjL4pqcEnPGmbrCY3m2e6qdmC60xYEeW2Jc+Koitu5N2ARLY6UsdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k8N54HFsrN90uPIvk4JVBaqu9mWtjHVkVARcU7n588=;
 b=XQPc45gUAfwPrSWm3iAUqj04LKSeGpF9fTPTi69b4hpBOfeR6NJcbnin/uAAeAC9GpgIx3UMT6vHI7Lxuxz5O0b2zu1diSNA3r8DkOIJN4adXYXdaFvjZGmOEmA0ukhoZ4QlbfH42PXh21pJ8VKWDk+WugXBjeMiPOeS4SbzJCp4OQ6OVBTldSf6h/AlB5m2Ap8zsRir4kuXavm4/QACuDW1Gf+KNApkP4UTNlhbtJmvoIa5ZBKlrGOpSlptUQEfxyRW77mhaLKOj3WBwEbqLLW+pnZ2SZ2Evs/KUqixx6si/q02BgXTGKxO4zAvbptSbFMMF6F4wBuPK5zRrU66Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8287.eurprd04.prod.outlook.com (2603:10a6:102:1c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Thu, 11 Sep
 2025 08:45:01 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 08:45:01 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Thu, 11 Sep 2025 16:44:22 +0800
Subject: [PATCH v2 1/4] dt-bindings: media: ti,ds90ub953: Add third cell
 for GPIO controller
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-ds90ub953-v2-1-03ee76eb6b59@nxp.com>
References: <20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com>
In-Reply-To: <20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757580308; l=2656;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=vnNqjrorFqjiYR0OEX2t6f7x5OyXLa4flu/HsqOKNEc=;
 b=WSZI5upBwxqQ7lr7MIn1tYlYh/owR5V03FPfO84lPywII/ZngDkPOqJ9ccWZbVh9WSvOQ5U8+
 qSlis3jK8fDCKB6VmSKTyezEvaQ6i3R3hyRAv9209+nRrmLf3Vrr3gv
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: fa33dbe9-98b8-466e-2a0e-08ddf10f7ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U29Sak9ZUjJqZVZURU14S3ZkQkwwTzdwdWhUdDQ4VlJzcjR2bU9KbCtuMi9w?=
 =?utf-8?B?cjVoWG9lTzBnYjlUeWd5bzRIM1dwWWUzY1h1TWZDYVhCbTRjSHZqZURIdWR1?=
 =?utf-8?B?ejh4ODdlaGI5QmZWSUhUUFpJWGFiVlZPcWFLSkk3elhodVU2d2RPS2haSi96?=
 =?utf-8?B?eGxoM05LKzFDUnZSREJGQ2kyRW5ZaWQzdVRzWTF6b0UrQW9FTG9GeERidXhs?=
 =?utf-8?B?ZFMxRUx3TDZwRS9TdEc5Vm12TjErU3h2NGNOTWV6VFNQZWwyN3h3TnNZbmE1?=
 =?utf-8?B?T05iVE45MmMyWlY0aTdNVnE5T3hJOCs4enhTT0h3UmdkK1QwNDZFc2RHbmt6?=
 =?utf-8?B?ak5qRGpxTkRyelhxaGszN1BTclVmRVgvL0lNbkcyK0M1eGRkSGdPMjQ0SFYz?=
 =?utf-8?B?ZlVWK0EzaFducVJudUMzendya0RNakpTUG1UVnQ1eE0zaUdMdjRCNXMvRE1S?=
 =?utf-8?B?QjE4NzUyc2kxYmlWa2hlM1RtY2VlN1BWUTNSSDRpL1krRGlzNEVnYkc1bkM5?=
 =?utf-8?B?L05GbjFZVERkMlNjNTltVCtOSjdKQ3dMeXJNa25GSVpJS0cxTEFCNDJkb1Jy?=
 =?utf-8?B?d2lXNWllT25hSHhHOVMrK0o2ODh1Z2daSWRaS0dtVzhHNlhidDFQTVU3R0d3?=
 =?utf-8?B?SDFxZUhIU25ncmFPZ3pCUFhsRTZIZWdycE5zSXVOMnI2bjcvMUZ4dklBckZC?=
 =?utf-8?B?ekQxQVdEM2E2Mk44QUFyR0RlaTBIb254c0hjZzBUM0JKVkpwd3oyQ014aER3?=
 =?utf-8?B?V29qTGRLa2J0clBVOTZHdDJOK01XSHlZelRsa0FhNHZsZFhKZWxNVThlYk5E?=
 =?utf-8?B?K242NnZRNVo3NXMwV1h1OWdWTlgwbG9RTUFRenVMWUpQbFczZHB4YThFUWpZ?=
 =?utf-8?B?dy9OZzFLeExlZGY3RW9pRmpPTmxiTWVMYUcwTUdIREw5cGJmTnpIbnZxYll5?=
 =?utf-8?B?eFRwV09EdDcxWkpxemszalhrWWZTKzhmeU1ueHVmdnhNdzFsMStzNTM0bnFw?=
 =?utf-8?B?c0RZR3BXZFUzMm9WRkRSVlQzaHIxZUsvUnIxbFRDNk92dkljRkNlb2kvWVBl?=
 =?utf-8?B?OHJSME1KdHMvUnd4VlhCbFRFQVd0dGYwZkZWbzMvSS8zaHdvTXA0UHRxT0xh?=
 =?utf-8?B?c1Jnd3E2Rkl1M21iYXl6bEZGWTc1UkR1Yk9kTnhralF2aGduNFpxYjIwWlpk?=
 =?utf-8?B?OFRIbGJHSlF0TXVXRTgrbUhkaHlSVU03TThJaEFUYU4yNmhjVmJJZjlQWStW?=
 =?utf-8?B?cVVGM01NcGwxMmc3WGlLMkNMeHhOUU1jaUQwT2ZEU05Kc1VrUGorSkFHV1Iz?=
 =?utf-8?B?STdpUHQ2OEg5TEFIREprcy9KWFF2aGlJY0kxQVE2YzkwNnlsYzlvUTVyQnpS?=
 =?utf-8?B?bTFReTNab3pwamovQ0ZNQzFQbTVtV1k4T0RSdWJOV2xTekxidkZiRXpDZFdD?=
 =?utf-8?B?ODZIcTM4d1NRT3pDcXJlY1ZzZEcxT2hWdnFmL1dVZFpONzk0aTFvTlo3NWNX?=
 =?utf-8?B?b1RweWp0VTduTVE3SXV6N2JSMmxBRWI2NFJFVVk1ZzdRNG5LdEsyYW9ncU85?=
 =?utf-8?B?VVBHSHpySHQ1SFcwbDJkRmZUZ1BiUUp4QzcrdVJPYnV4YWd4emtodWZyNjdB?=
 =?utf-8?B?dVI0ZWZMUHBOcEZpZEZHUXpnMFZtb0hVdU5rUXJaTHY0QUFwTm5GU0JocUlo?=
 =?utf-8?B?dzQwL2Z6NzNFZnhxczhUUkxMN0Y2UTE4MVExY2d1QTQvZkd1SENTdGNUdmpN?=
 =?utf-8?B?eVI0WEU2RE52N0x4RE1ZOW5BdmtGbnJkekRQbmVDcXlUK04zSlRFSll6RW9u?=
 =?utf-8?B?clYxUmhHRnZZTGp5d0s0ZDhhVjJMNkE3SXg3TXdZcTVqZnp5MXFBQ2lzYUZC?=
 =?utf-8?B?cTdqZnpEb283bHZXODQ3ZEp1MVBEZVBlVUF5SDc3dUpKTlF0OGdpQU5IbUZj?=
 =?utf-8?B?NFFBU2xydmQvbjZWSS9DNEwxUHJJZm9IMXFEU0NreU5qMldvdXpSOElFVDFR?=
 =?utf-8?B?TVVKdEVsbzlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTBVT095MVdqTi9IZDMwYjFuTFArZlI0VEEvL3UzQWxoSWowSytFLzQwelJF?=
 =?utf-8?B?VWFLeG1wUndzd3NjYkdxRmpFbFZ3Y2p0L21tWGRRaTdIZGlPcjU1V3kvdkNh?=
 =?utf-8?B?L1o4WmJkdDRBdkpGK0FTWXZZNk9kemVCYnVURm9rZFpTeU1nSitoaEl0dk5h?=
 =?utf-8?B?aWUvYVAxMzA3c29ReDYxMnVZUmI0ZmVTWXJ5Yjl1VmZieElCZ2FPdEhhZjNH?=
 =?utf-8?B?Y0duQnl1RCtFRm13bmZxNGgvY2c2eWF4NGNJN1BXL01uQ2Fmc3lqQzVxaW1K?=
 =?utf-8?B?dE1MTVBWdDY4dU1vRUxJclRMdk1FeVhLbjhOT2JQODFldDM3VmI4U0VzNStD?=
 =?utf-8?B?MjhNWEJ6UDZUcVVTeG5Tb09xeml1TndGM05rdVZJYjJvbmdNcTg2eVlWUjIx?=
 =?utf-8?B?OGpUQkxzL25Ha1RCT21oOEF1eGIwRzkwMDRiNTJRcHIxZmpORDYvR0ZuYmpt?=
 =?utf-8?B?L005Q3JDeitIY2pPRUZJZjFtRFhoc2VVMjBRZEQ0cEF6anJNazJuS0NwRFFm?=
 =?utf-8?B?a0tadUx0WHRSU09EQjBNb1NSZzZWOWpHcVE1cWJOODU0RkJnRURFT2pPT2Ja?=
 =?utf-8?B?bE5NSEI5ZkNoL0hrb1dkdCtNN2VJaTZNSGVhZ21ZZVFlSURuMnNmeld5cVJ2?=
 =?utf-8?B?cG5Wc21BUml5RlE4RjVVRGpYaURjNlBhUmVNRXNuOXlmR1RQYmRkR0R6SXdy?=
 =?utf-8?B?TytYNGZXYUQvQ2cwZWljem9YTVhhdlF6SlozSWVpejVad0huYnUzZ01ablJJ?=
 =?utf-8?B?dmxONVBLalVsak1oRGZrS1RTYm1TT2p1RTlVZHJSU2hWRnFmQ1ZhbGxwUDJR?=
 =?utf-8?B?VmI4Y3RTVnVaQU9YR2NjQm50MWxvSHhxOVB5TmJ6a3VJL0xvVk5iUlNhT1Ju?=
 =?utf-8?B?b21wbWJZNVlIaEhOY1MxV1AxaE9GZ0dVWlhkcm5wdENmZkxhTk5wY1pMc0I1?=
 =?utf-8?B?TDdqb20zZnZIMGQxU0pFbkRYRU5lV0RZUkQ1VnN3RVFjRGo3K2RVZDB4NUp4?=
 =?utf-8?B?dEJ0VHJBdGU1MzRZc3pHL3ZaNS9tTHV4WWRBNU9MMXUrbUdKNzFlV1NDdXFF?=
 =?utf-8?B?UlZISTNleTBEb0tlSUlMdnpzektIekc4ckl1NkxRamYzVGlWKzZtTmFNY3hW?=
 =?utf-8?B?SlhaVWJFRmJ1N0s3NC9TRXJTNGUxWVJ5OHZJZ2MrVTgxcWN2MFBTU1lyUndG?=
 =?utf-8?B?cC9HYnV2OE5GU24rMUJqdkh5dCtKSGRBMkxUZkdnQ0JsSEZIVFJxWHZkakJz?=
 =?utf-8?B?U2ZIb1h5V2lVT3hUQzBuZWRoVStJSlpnWUs1VXNhRzg3dVFxVVlWOXdrYTA1?=
 =?utf-8?B?T3dtaE9td3hidmJ5TkM5eDlGaTAwMDFWTkxhK2krSFdRbkN3RWxKZTE4SnJG?=
 =?utf-8?B?QkxaaXloSWJlUnBJTVJRYjhsTTZCSkg5aXhYRlYvQ1lBRUNYRVh6bEp3SGN1?=
 =?utf-8?B?WExCbDlRMkhhRytlQjBnZWpOdm1RTU90bHF6eUNTZnluM3lQMlM2cVNmaXFY?=
 =?utf-8?B?WStDbUZPK0M0aXpPR3dNU2tsU2c5TFl2dUJNNDNFa1ZHVTZCZDdZMDg2M2Ur?=
 =?utf-8?B?cWxQM3ljUUwvYmNFTFhua05QVkZiSzlsT0ZSMStMZ0hoSmJTUTcwMGw5NUM4?=
 =?utf-8?B?bXlvN2VZQWppemtaV3p2ZExQUzB3ZHE2UVNZTzdiU1kwUGJZa25qZHJ1Y0FF?=
 =?utf-8?B?bFcyTTNzUktvakpZVDNSV1lzcUgyUXFGZzVmMG5LTld6TzVCNnJDYlFWajVp?=
 =?utf-8?B?MVVvTVhlQitMZVcxejNUSm9CWVpIZUttb0Qxc21JUlZkTDd1eFFNMXh5SzdC?=
 =?utf-8?B?NCtpaDZ2cU5vSUNmMEdyeXRPL0ZzZHFWR3REbjVjbkxaejRaS0lySnArblI3?=
 =?utf-8?B?U2pxdXVXNE03ZnR5T2ZXUXNEQmI0YkgwWFYrcEdXUG5wSG9TcHZDVXZGWWZ3?=
 =?utf-8?B?SU8wVjZUVGZEcGYzNzk2WTJvd3lNZHRYY2oxM01TMEVFc1crelh0ZThqWU9O?=
 =?utf-8?B?eWovTFQ2bllpc1U1c0VBcUk4R2Q0VlBxRmtOOXhxY3ZFMy9LOXYxazd1YnBB?=
 =?utf-8?B?Mm1KUllOZlJsd3YwKzhmRUxvY1VYOExEZ1J0WDlEeGZjVHNhaURDQ21rejZx?=
 =?utf-8?Q?oP3GfOAhh6PRkXRkGXu9jK8J/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa33dbe9-98b8-466e-2a0e-08ddf10f7ed5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 08:45:01.5242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msWAGYqnKiJtqYbAzDhC1VoDn4L76yRnAw2PBxecMQyRSkh4RrocYg2QX1WDcGy+V3zfl29C/E8Rhc8JqRUDow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8287

Add third cell for GPIO controller to select GPIO output source. 0 to
select output source from local GPIO data, 1 to select output source
from remote compatible deserializer GPIO data.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 8 +++++---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
index 2e129bf573b79e0ca8f25b4ec5fc6ea76c50abd7..de759413a36060d3be6f2c3b67de48ee6e4d29f2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -19,10 +19,12 @@ properties:
       - ti,ds90ub971-q1
 
   '#gpio-cells':
-    const: 2
+    const: 3
     description:
       First cell is the GPIO pin number, second cell is the flags. The GPIO pin
       number must be in range of [0, 3].
+      Third cell is GPIO output source(0 for local gpio data, 1 for remote
+      gpio data from remote compatible deserializer).
 
   gpio-controller: true
 
@@ -97,7 +99,7 @@ examples:
         reg = <0x18>;
 
         gpio-controller;
-        #gpio-cells = <2>;
+        #gpio-cells = <3>;
 
         #clock-cells = <0>;
 
@@ -130,7 +132,7 @@ examples:
             compatible = "sony,imx274";
             reg = <0x1a>;
 
-            reset-gpios = <&serializer 0 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&serializer 0 GPIO_ACTIVE_LOW 0>;
 
             clocks = <&serializer>;
             clock-names = "inck";
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 4dcbd2b039a58edfc57c5cc0bedceefdf158bf0c..4af5e0e3b413a64a4b61344f1da63be7e02a1af8 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -328,7 +328,7 @@ examples:
               reg = <0x30>;
 
               gpio-controller;
-              #gpio-cells = <2>;
+              #gpio-cells = <3>;
 
               #clock-cells = <0>;
 
@@ -361,7 +361,7 @@ examples:
                   compatible = "sony,imx274";
                   reg = <0x1a>;
 
-                  reset-gpios = <&serializer1 0 GPIO_ACTIVE_LOW>;
+                  reset-gpios = <&serializer1 0 GPIO_ACTIVE_LOW 0>;
 
                   port {
                     sensor_1_out: endpoint {

-- 
2.34.1


