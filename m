Return-Path: <linux-media+bounces-42613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 624CAB59296
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 11:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF3003A5822
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 09:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AF02E973F;
	Tue, 16 Sep 2025 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ei4Iz6I+"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011021.outbound.protection.outlook.com [40.107.130.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8412129E113;
	Tue, 16 Sep 2025 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015849; cv=fail; b=TTzMW9Ttd3YOHhQLTYdGF4jdvLeRjBupwhL1J8VSMP2+TTaft1OHKUBfQ0f+YdmKXRAiB2H9M1eB1StSl/Tp0y/UqmCZ2+b2dQisWneCY3x7MUIsX8gPxKV3J8POCLpantmwPN4O8sQqnkkwWG8hyiO20Tkx+tLMD9ZsyxtAIX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015849; c=relaxed/simple;
	bh=rdxfxsgiWldC3DGv6JGfUVt15CiWC/XBbmwd1GqtbME=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aR4bycwfbkcLwHUYtxQqv38UG7sIBT487ICum7H+fd1f1/t3gy5zW/rdFShNt20mnsv4NWr6WXHIPIfv6ZSPCFNlWeOrPNDW0o2GxfiuCcGFeeJ7HEU9OkLjrOmZ/CL9pGte+y95TdZ8iXy/mzSgVVoe9vOONfNc9O1xssztOzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ei4Iz6I+; arc=fail smtp.client-ip=40.107.130.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJKc2SCl35EKtiYevmhficVID2wk0X1kHXKTwgUzl0I0Nmp8YmIawDWneYeG5WVqoKU1IIqTXpzSlYF9Mt23H9QZNrpMLRv0hNjAgQLkChTqC3TReq1diQW0DCI9OLHXsx097f/asqXDl/R/ToGVnAem9ZUHo/F8l+BEVbrNQBF72CJx9Dvq38Cqu72VvCPdaZPy3r17aPRnJBR6s7wvZ8ZMWRtOtnxQmk88mAxb63790AueTmANEBCk1KAKDlC7Wcp/dZBQVT3Pn9CfWOgzIBmDn2rTqej5f4hQA9TSzPuatWpeZ0O/MeCEk8N3g6GCoOuYWUjltue5yQ7uV5zg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHuzo4SsrUu+c2l1I10qpiPh/wwkKlhCUSIuLASQI48=;
 b=q5D74+kizfzZkiwSl6EDskAD8UhQK807Cf/ki1HV2OiR1Tk3r0tc6HImufOwkr/q0o0a/PoV1KvjuPZgSgTd1MI4hA0pdFXUV8LVO8/ekf5Kk1PT85+2ZXwCmozYm/owggtXkk7soCQzOprNsU6jlD7JU+v8aScIQih62IjrEsQ8w05ckxo3Xlk8aLUe3e7wMqfqQctkZ4Pdc+FYo09uijYnd1uy4Y+RILsLr2Ae0OKuG4AFP6Qkhhu+3ufP3suKklfUSYtZGUKhi2y+dVwmxg3St/DsALJHiBRdJ0RkHo5PmNIOw/x71vJ0CG1L+hGEUM5yYnfpQTuxxjA22N62iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHuzo4SsrUu+c2l1I10qpiPh/wwkKlhCUSIuLASQI48=;
 b=Ei4Iz6I+SnoC+TRKJaml5CJ3qwKhET1aPm/m85viaYU0X+1Xr9Ws/DWSX0Tkh43M1fIDJqODTw6fFzWIx7WETollX8e6e/iCBm1/w6J+Pe89oo3CbudwLzjx+q+x3NbzNEnENKgvF/FWdmsxquTi0IVSfRlYl01FlIYx9LanTI/U6NZJ5D6E6K4ySpAXobu2+Xajn5Z//V/HpomCqnjb7JnN1JZr+XRYg670+dU+qjabMxLc3/GlHtlCfaGlaLHjhAQ3Qz7coar4rNwKFj5rUXBd5rQMJn1GXH6eTfPrWuueMgEE2PiAVvcMpeit+OrAimvMFHAvjqLMVl1pe+b0Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB6833.eurprd04.prod.outlook.com (2603:10a6:208:17d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 09:44:06 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9115.015; Tue, 16 Sep 2025
 09:44:05 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Tue, 16 Sep 2025 17:43:46 +0800
Subject: [PATCH v3 4/4] media: i2c: ds90ub953: use guard() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-ds90ub953-v3-4-bb7bc6545da7@nxp.com>
References: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
In-Reply-To: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758015845; l=3324;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=rdxfxsgiWldC3DGv6JGfUVt15CiWC/XBbmwd1GqtbME=;
 b=d6TsHj3gG/E4nWAPKnI5bKcuULrf5f0BEw+X8l0Xrq+0Ydr82OX2b01tAUQkcc2BzclO9hlzv
 JfVcIxaX443DQJtKUtQV96pATdywpL6kiGFkvd21AGJonZf8y2Q4QxT
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM0PR04MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 867e9f26-c909-467d-6189-08ddf505939c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmZsN0lDZ2poYzc4YWE5ZVVxcjdpWnphRUFXLzdpYTlBV3B2c0p0Q1dMTWJ5?=
 =?utf-8?B?b3B4dVExcnRmU1dmQXBCTWlUZHE5bkRQR3E3SmhlZkNBWGZKN2l1YjVLbFYy?=
 =?utf-8?B?Qkx6K3I2bjRhd3lKZkdyTmRvS08yM2s2dTRrL0dQY0NHbWdiQi9NZXkyaDU4?=
 =?utf-8?B?Z3FhQ3M2UnF3RFdIQ29pU0NGOTJtMFFVc1gxQkowZDRqNERvUEZ4R3Ayejds?=
 =?utf-8?B?dTFBZjV2OEJJQkFRMzdLeUJ6ZGN3Q3FpYWVtUzhIUHN1RmJZY0FkTXlyaGt0?=
 =?utf-8?B?VEdMMHV4amhFZVYrQ0hhVDlFdHJTNEp5VXJVZTdJeTlGK0phY1M5ZzR0R1Nk?=
 =?utf-8?B?aTJaaUZaTit5MTc0OG1qWHFGZFIzb3VoRVlrZG5VZE8zaldYV05yTEQ5UmNs?=
 =?utf-8?B?aTVveGhkT1lPS01ad21iMVlGMlV1MTRPdk9pVnBrck44c1ROdzRTYmtFWmJE?=
 =?utf-8?B?T2I2SDIzWmtpQVhiaEZ4WFRzRjdFam1RajVYK0htbEF4dFkrMHpSTHlGUnNj?=
 =?utf-8?B?NzVrZzY3cnV5TDY0VE1BL2Q5ZTRxVWFOenBab1hCNWxQMzI0cVo2QmFXRlpm?=
 =?utf-8?B?d2E0THVLQlZZSVl3VlRpTlk1Y2paQVVZcGdDK2Q1d3ljWHcwL0llSGdNS1hE?=
 =?utf-8?B?S0FETjE2cTZ3ZzhsL21ZQUowbGtxVkxzWkpJclg5MytKMzlBd2U4eExEN203?=
 =?utf-8?B?NU0rK2NmaUMybU55MkhqUjJabVZWSnluaEwvT2ZLVUtQbU1lYVlSdlpVL3FY?=
 =?utf-8?B?Z3hMNjlZc2NNQ0h0aXVnRTlKdVg0eUxyUmcvUGZRWFcrZVFNUyt4TkVIZGdi?=
 =?utf-8?B?R3I5MW45U1pwMWZxeVRCTE9rallRM3piODNkZkNxSUFWNWJDL245cjh6ZVVz?=
 =?utf-8?B?b0N6dmVjWVNkcENrUFl3ak1GY3AxUml2MEcvYVZRUnUrZ0lnT2x0cU1pcGFN?=
 =?utf-8?B?MmVjWjdJVFJtSndPK28rdU12S2htZVRSbS9aZ09FeUVMOWd1QnJmaVpUTWxE?=
 =?utf-8?B?VlJ3M0JvbUxHZFdBOUxZdUZ1UG5TUE9mSjVyTUJpeUJubVhLcnVJTmZVSkZN?=
 =?utf-8?B?ZGFkUzNPTmJLZ2NIdUtvK0hWLzNyWW9YdVpWczdiVTFLdDJIVnJlTk1aZW1k?=
 =?utf-8?B?bWhrUHJjcHpkQlhKUms2ZDdpa0UzaS8zY2lnNTFmUWZNL1JZTHQ4SXE5cmxp?=
 =?utf-8?B?bWhFZ256SGdJWVZwSnNZZWw4Tm5zNExBNDhmWjNTNitiNDd6K2l4SFBZeWtB?=
 =?utf-8?B?eHZNVDlDb1BIWkMvbkYzVVlkNkR2bERlNW04a2lHamMrQUFLcmd2UXhyZjJj?=
 =?utf-8?B?N0RDMW9qQmJiUkNlZ0VVdFJJMFFaTkVjK1lCcllwWGRvRXAxakJoTThLbG9S?=
 =?utf-8?B?cFJra1AyTDFZeXJ1MzNsckRGU1l3L2ZFalhSdTdtKzg4NHhEWXZMWUxRNE5u?=
 =?utf-8?B?N3FHUmVWMVorbG84Q1RTcTBMcGo2cWQ0dGx5ZUNoZVZaOWp1aTd2S2h4OU1O?=
 =?utf-8?B?OGRqaURFaFE5SDROdkh6UDltUlhiUkQvR041WThxSXFrdU4wYUVZYnJuT3NG?=
 =?utf-8?B?MWVlN3IyV1VaWTFDYVVEbmZzeElLUDFzZmxYS1NUcnFzcU5UenIrVjAyMGhq?=
 =?utf-8?B?N1VqZllSSStqOXZwZEUxS1RWS3JvcTFWeWZEV0p3N0JoU1ovTWJrWmNtd2JR?=
 =?utf-8?B?T3VwYnNaenRVVkxIZytaNmc2Z2JyZWVqR28vWW9qZ1BKRGoxQWxDOFNBZDg0?=
 =?utf-8?B?NXlLNG5JQStmT1YvbG5CQXlpV3ZaRVVqWmlQQlZRNSs4WmROb0RaUVE3eXc1?=
 =?utf-8?B?KzQyVWxUb0dBc0FtaXFnUjlYM3VGVkNTcHQ3SzlXYmVCNXo3Yk55YWUrekZP?=
 =?utf-8?B?R2NHWjNuR2RyY0RCaW04dnQrNHJLMmNudXdFaTdXdTJ1MWdrbTkxKzBHVkp3?=
 =?utf-8?B?MlUwY01yaVd6NEZLZHVyTWNPQ0w4QzF3RUY3NThabHlQT1prZkJFdWlieVI4?=
 =?utf-8?B?ZUxWczNBcEhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlliSzZUem04aHFQN29TSXdGb3BSVHJUSWtFc1FEclYybEZyOU9VVks3ajRG?=
 =?utf-8?B?MHNDTlFYVFRGaUx0ZnlodTZEcnVRdGF1T2d1SkpKV2F5dkVpZkxUT0NNK25S?=
 =?utf-8?B?VlhtdGo5R0dzZEdlN3NVc1BwZVdOUktXbEVNa0g5dGdrZVVGUmR2UDVPbVZx?=
 =?utf-8?B?QXNxU09yNEptVWJwUGlmd2ljOU1qSkxlWUI0V05nc21mN2puTDkrdFFaa0Jl?=
 =?utf-8?B?MnJFMFVpTFBrSUtsNDM1RXRiSm9kanhYZVo0UjdMQmxpOWxwWnN2U2hLU2Vx?=
 =?utf-8?B?RGljei9CVnlLZ25MYVk3aS9pZjFFWFNsSDNpT0lHVkxXSEFVTHZhWDUrWU5Y?=
 =?utf-8?B?U1dGd01SVEZLTlNUMmxyMjhKK0lvbXNEZk5WM0RrZ3YyMHV3QURQQmtwK2c2?=
 =?utf-8?B?WSthVmU3VWdpelZsSTNNbkk1WWhFS0JmczR4VVRtUmRHNloyWXRsMFlINjho?=
 =?utf-8?B?QjhuaXd2TVZaSWQ4b2F3Y0tBbzJTZGZxV1FTUGdUT0E0Rmw4UDlKWHk3NERz?=
 =?utf-8?B?M1FIRFp1ZzBMK0oxQ2VOdEtTd0dOTzJjNVpUcFlNSElNWnVTeUJyNElmKyt3?=
 =?utf-8?B?ZzZxdHhQbzNheG9MNWNDSEVhWXMwa092V2hhQndRL2FXb1FCcytRZG55aUVI?=
 =?utf-8?B?RFNvUTBXUHF3OG94TFBNM3A5MFU3MFZadDdpU21lRzFhTktpMGJ6ME4zRXpN?=
 =?utf-8?B?d29PNmZreDRRUng2UUswMk9jWG9FZ1JkN1plRi9LS2o0YmVOQ1NwcWhxTDRn?=
 =?utf-8?B?Q21wK3FuN1hyQ08vQi9jQ2l3b05iVEpKUmIydmZkcmxJeVN1MmhTV29ncWFm?=
 =?utf-8?B?U0JkbWVoc2NZM2hXOEh0RlVlN2c5SWlzZTdJWHpNM0RzN3BiSDJxMkhjUDVQ?=
 =?utf-8?B?ck9RcWNXRER0RGlBN2dvNTFDcEhxSzZXZ0xYek8vaHdHTWNYY0hwdmE4ODZi?=
 =?utf-8?B?Ym9VWS9rVVRKL1BxMW43TjNCYUE3QXpLU01KSG8ySnNSek91bTJ2NEdYN3c0?=
 =?utf-8?B?Sk5PZ1hOSWptVFRiODBQMkcyV0hrRzVCdUJ0Uk0wYmc1eUtTTjRVV3dBWHdP?=
 =?utf-8?B?U0lPSUZvWGRIc1ZOcEN4MXBUazdkOGNzdnhLaGhVcHJGRmVpTkY5Y1RUeVVo?=
 =?utf-8?B?czF2clJKNVJ6VTU2RVhCMzdKb3M3TFJSQ1Q4L2VKUnB3NUxkVjN0eXJSV0Zx?=
 =?utf-8?B?YUpYbzFWWmVBMmVWZmQ1Um1FY3dqckgzTlBqTm14YzdzZkg1bCtJL3M5U3dC?=
 =?utf-8?B?cE9OSGM2UzQ0TTZxSktSQnBjSzlMMERwdUxqc3BTSTh4UUlTTVRZTis1N01R?=
 =?utf-8?B?ZytmcUlJVnJ3MXpxTTBwYTNoYmpkdnBPQjlMVi9SY3Q4eXhvbHdyZlZkYTN6?=
 =?utf-8?B?MHcrMlJOOXpMMmNrOHY2VnN5N0I2cms1a1VOKzFKWk1iMUJFNG1RNGNacFJ1?=
 =?utf-8?B?VUVRODdVZUFOSzU5U3NpVWxqc2RtZnVXMEdWOThXL2hRdnREV2RjTG53OGVO?=
 =?utf-8?B?THJTT0xCTUxLcVJjT3JoTmcwMFd2R3QzQ01xWTdLS1JBTGVOWU1weWg4TTJU?=
 =?utf-8?B?SnZnVlJHMTByNzhiMFV3YndkWmdETDNyZXdYV0ExVUJabFZLSGozRVUyeURQ?=
 =?utf-8?B?OSt3WDJTQmhRQnIxcXNJZHlGRlBWM3JzenA3WnZzK05PY3p0Sm9udjNsYXNJ?=
 =?utf-8?B?ZmVsZjBENFhsdFBnZmFxNUZ5aUhJZHRDR2tuL0t0Rm5HeFBITDUxLzZLWGZu?=
 =?utf-8?B?QlhHV1JnK2JyUStvV1ZtMi9mWWdUS24rSjJVVFgxYkVxVFRNd1gwNUN0U05U?=
 =?utf-8?B?WmVlWmZiNFpnczNBSGhETnVzZlp6R3BqWmNYZkd3UlF6eklqdUFsd3J5bnY0?=
 =?utf-8?B?MVJIV2FnZlpVUFJneC9Sek5yT3JRNWhyVUFiRTRRTkltcTNzU2ZoTENldEZ4?=
 =?utf-8?B?cUZUblNvSXZ3dDNsNGo3dm1sY1pteUxzNlRlUTluc2RBbXE1eldUQ1NyaHJr?=
 =?utf-8?B?emxXcTJzbytpSkplR1RWRnVIbUVJSy9WY2tNMW9vU3UrZFJ2N0FoTG9YTWtU?=
 =?utf-8?B?WFB3NEI3ZXJxYXdCV1Z0dGdLclRYUTFIV1BzeXdhaFA4LzlwWE4zMUhRN3FJ?=
 =?utf-8?Q?Jcf3v4O3/pgxXSibFt2K8omzL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867e9f26-c909-467d-6189-08ddf505939c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 09:44:05.8771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zRisH+WQQ6tMCmrV3S+fmQawFlStrIrhuMcsnp9Q79mW3WkCIqqO6G2j5+ePI+8AHLFiGddZ8VGsk3nRhGTpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6833

Use guard() to simplify mutex locking. No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 47e7c0a5aae7737182e6a1f2797be01e7ecc8142..19cb353bcf3eb62d30e73b2f157f2a5838db523e 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -113,20 +113,18 @@ static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret) {
 		dev_err(&priv->client->dev, "Cannot read register 0x%02x: %d\n",
 			reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 
@@ -140,15 +138,13 @@ static int ub953_write(struct ub953_data *priv, u8 reg, u8 val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_write(priv->regmap, reg, val);
 	if (ret)
 		dev_err(&priv->client->dev,
 			"Cannot write register 0x%02x: %d\n", reg, ret);
 
-	mutex_unlock(&priv->reg_lock);
-
 	if (ret && err)
 		*err = ret;
 
@@ -185,18 +181,18 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto err;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
@@ -204,14 +200,12 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_DATA failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 
@@ -227,18 +221,18 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto err;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when writing %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
@@ -248,9 +242,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 			block, reg, ret);
 	}
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 

-- 
2.34.1


