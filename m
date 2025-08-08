Return-Path: <linux-media+bounces-39153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A15B1F0BB
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 917F0189E357
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3B628B7EE;
	Fri,  8 Aug 2025 22:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HeiF7+ip"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013027.outbound.protection.outlook.com [52.101.83.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF7228AB1A;
	Fri,  8 Aug 2025 22:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692809; cv=fail; b=VHbP4h9TAhm2pPFUCYM248YphHMqKcQ9Rh+tiAUfBQLrp1ZSwSyd/V2MqlFR5RMu1qZFOJeNnAJnxSXA/xufo3mTdmT2mSQsYAsBTBhb6m3XQWjQHAagPQA+8r4nsfHgMe7gf5q9/TFY8SQShfDnKjNAtCt8jpJDejtPaUb/pdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692809; c=relaxed/simple;
	bh=YQt8GKYrU8xjOwqIc/GMq5Uly58ssQd5JAPfgY5OOY0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=vA11qdwxO44ezFZyq/t7l9ebAKO9GIBCC3b065OCTQADyA2dGRMp3MxkHtOZPb1oEOfSUeA48AZill2NIHJelGLpgTRZzPdqqlMXkIz7HLjnIlMhnvd23Or4hb9/Mpn828SgqgJKoPuDLVw3JcnJpxZIIguWkas9qV2lXBtO6Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HeiF7+ip; arc=fail smtp.client-ip=52.101.83.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nh3sg0nXs2blJplNJWkrjLaSTt5HpYv/7wrRvfddIOBXixXCc2ORqJHV7SYRwFfgR7UefXiDYfigCqQ6HWX6T7OwVFvJHJYyq99jNOEKZ5Uz4n7SDh30vQqHcNx8CXToQK+fb3ILhhNJ2oJCgaIoYMZbQ9Eb/6a+MNYCGLpuIhpPbI+riGgIYoaSlteFIh1sFO/BJIHcOMvSIFyHq2nQnhX8+oRr2Dqcrexvpigyk7233VeMjAZDupY/+wanXLgrhwnJFn8Gl/u/rm5I7pjzkPfOg7L+IIfMgBDlW/gRiMA4QzxamvK7GUh1M7Rharwlj7coqv0nVHW67PzoCJTBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXJdvOaQCammwCKW5aKA5iEa0MLxQep4S72/2oxwGXk=;
 b=taDqf7a/ho2Ih+aGUac4/fjPmwbx3AWChLu0Kqapl0dNGJZTuj6RU9dFsT3jDeXKPfNle4mLGc/IqCROxJWbk3sa8EfyOCCT4QZPbPThU1qRhk4ih7In/AEplhSCXlFlCDEs6xgaEwngOKPNxXPwIvuMuHWhVOo6tTmWhlzXPSrGLEHgoXpJMl5ZemSTLRmxf8bxjD73D4eRRUE4gdK62IVRCGzj6McUtVdIruIQU9pM/FkwdigMLsl/u+k3MNPZ5oHTfVMvxg2wM+vWCZTtbMr25Ecz0dl6T67gDcD7sCpFRyHB0ICHMvKGXYA/Xuw2M+IomY+19/WLGU56WUepVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXJdvOaQCammwCKW5aKA5iEa0MLxQep4S72/2oxwGXk=;
 b=HeiF7+ipRPNLr1RFNnAJeHTB4IdOrbP5SxOFb3rCeoSmVLivlVJHeYlMdquNlq1UJojX7pOKIXkiKtUYJ18ppNaxYXzZy7b0kerIlgpnDodgtIaHKOKwrU2OIgfBN12L5Uu7CvXK+ne6GZLrXVQ3/RowJGv9TcpyMM/iEkffhmgCsGX55a2v5A5TLsiPk/CCcnDrY6JRj4ohFKzttp/W4E11f3BbsSq1zKdPBnKO9FhzVOd4ff8qiba1qUnS4icAu8w/VsK0Ogc7fVlahTPwS+k5/FhVS9Va6nrGUqgOtbqt5NWabpU+uzr3pXThvZ5QdFj2LxfziAUrFOF7hQOsSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:40:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:40:04 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:04 -0400
Subject: [PATCH v2 01/32] dt-bindings: media: add DW MIPI CSI-2 Host
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-1-4b29fa6919a7@nxp.com>
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
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, 
 Luis Oliveira <lolivei@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=5511;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=wwE8z0liZs2UGRXq0gzskER2zGFZ2IpazACIpxwbIhI=;
 b=xlsVOTEkqpuai9cL4CqRFSGcgszitQS6Ufykb3YYgvrqIe+gSjEyq35QjwK6g3o2n77Jd+4NW
 vpWzxp+11XXCk9riJHin9nUSbfFTQxMojblPOQcvvmfqz9keeSXGe4n
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
X-MS-Office365-Filtering-Correlation-Id: 5107dbea-717a-4ac6-553d-08ddd6cc8484
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NjVlRW9pK280THhCZzdBOHlBZXpYc3ZvNlRDUVFJaStBNVphRjFNVWo2NElw?=
 =?utf-8?B?djJGYVo5QUhlUktkcGgwc1p4YmlDTUVkVm13dWN3eTRhaHpvcWI2TWZkcGZk?=
 =?utf-8?B?YWlBYTNyL3lETHk2U0RlSVJrRUpZR1k3NDJmekZRNWhHRS9JNXBMdktld2FJ?=
 =?utf-8?B?THh0Um1FUjFuY0VGT2lmdURpcTdJUGpzYTQxY0x6Ulg2cnNkY1NuRGV4Vmpw?=
 =?utf-8?B?Zm1KWTczMEtqQ0x0VDNlNDM0UkNjSXM2RjlwNGlxZjAyZDZJend1ZVRnNnJT?=
 =?utf-8?B?bnlVenJGY0p3Z3dPTEJ3bTNQSGJYQjRJSzNhRVM0bkVTMitZaXJMRlE5djJh?=
 =?utf-8?B?S3ByK0F2R1l1cm5MTWgvL2N2eEhHTXhaQUVqOVMzMWxlalpwbzZEUERMTGZi?=
 =?utf-8?B?UDZua2NBTy9sK2Z0SmdXVUFLdFoxeG5oN1dzSUljSE5rMnZEcGF4dFNHTWN4?=
 =?utf-8?B?a0VhaUxhaksvWUYzaU1idE4vUjlwRnpBNTRXUkVBL3FtNVJob1lvUXQ4Q2pC?=
 =?utf-8?B?dGE0NzZ6aUszQk9sMFZTY1ZMa3NSL0FCY2JBZDh6WnZXNE1CVVFUamlBbk02?=
 =?utf-8?B?eGZsWFg2R09XNnJmNktlRzFXcU11bUxqOWkvOWdITmdGOEJVYjBZSmk4eHo1?=
 =?utf-8?B?ZnRiQ20yb2J3OVhQaDJzMXZPSi9NYkZ1T1lHR1hOd1MxSWlxNVRNeXFQYWZL?=
 =?utf-8?B?TWY0Tnd2YVBXRHcrUXh4UzBEbG5GR3VDVnRKY1g4QlFGdG1iMkNBenB6c28v?=
 =?utf-8?B?QXdxSUlJNlBoUTF2WTRDMUVCQ0plYW5pOGU1MnBPaEtKZVlqcitVR3RENlFm?=
 =?utf-8?B?Y2xJN3QySk4wWld2WFc4ZzVjWXJzMEpYR2ZhbW5YYXljWWRkbW5KWlcwVWly?=
 =?utf-8?B?a3pZNW9vSEhoZUdXQnNQdFlHblZPWU1PdlFCVDRQQTV0S09BbzNtdWI1bGR4?=
 =?utf-8?B?T014eXlydFJReTlKVkhJV2tld2RBaVQ4Tlc0eGxlNlFxWCtBczVMNTMvdjJY?=
 =?utf-8?B?RTBxWlIvaGkvTjBlSVlTYkZJRUtJUFNvQ2lxQXJLOVpiRTNwRXE4V2d6ZDd5?=
 =?utf-8?B?OFhxcm1CN1hudGNwK05VY1Z0b3R2Nk1SbmgwMkdaVUx3MTN4UXA1SzhPZERZ?=
 =?utf-8?B?ZU54LzFtN3RVb3YzQjkvUk1IYXBNZjdxdXE0R2RrSHQrUjk4b1dkbG0wNysr?=
 =?utf-8?B?MW9FcDYvRTJqMWs0SHdvSHV1dEdKMU9VOUxaMU5qa0QvSnZNQTBPK2hNakQv?=
 =?utf-8?B?WWIwRndEUkdIRTljL3hMcjBSdEhqVnVXM0FBejFlbGMvZDVydndaUzk1cnhl?=
 =?utf-8?B?RnVqZHRUWTZnWkQyL2MrY0F4c0pXNGtEOVRnSlZhZi9pZGFoU3J4bTArcE5m?=
 =?utf-8?B?QjhIL29Pem1DNUMvV3JpTzliNkRKcitmYUVJc1lQZUlhNmpJZ3pkb3o5YXBv?=
 =?utf-8?B?Tkd4V09tNFJlTzZSYkh0eWdPSzliTHpWQmM2UmNjd1AzUlBHc1VmMmNpWkI5?=
 =?utf-8?B?QVJCOHVOMnp2YlVIRkxhc08vUmh2bkNkS3JqQUVxa3RwcGJSc2JNQzJON3dt?=
 =?utf-8?B?YTN2TjY0UUFSQVkyU04vUmJWL0xVVkJwb29GQStvNVlVa1dsWXpVWWR5VCtZ?=
 =?utf-8?B?MUQ2YlpHY2laUGN2Y1pYUDlIRjF5aFAwcW9wTDR1WFRQSlJEV1JqVDloTWhK?=
 =?utf-8?B?d1Q1NFpIRXhvd0dOZGkySzI2SlBacWgrUEdkRHZGNE9nYzVzcmRnSzQ1alNv?=
 =?utf-8?B?dGJpNEdLYTBhaXkxVm5GUG1raXhZampwd0VCOWFTWUZBYVM1QXpXelBoWVNQ?=
 =?utf-8?B?UjFlbFJtYUJZbU0vVmM5UXRVRGFCYlJQUkpRQ2o5QVlzMVR5Nm94ZS9MNjF6?=
 =?utf-8?B?bFRLejN6WTV3VmdDMnB2ZFpRdG5IL3FQNkxSR1NwNC9mdHAwcHg2ekVZcjM1?=
 =?utf-8?Q?kU3heZyiaQ+3vzk1Uh7YeidFQM6i0trD?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dllRWGU0SStJSmF6aHNzbndOek90ZGZoTzhHWkV0b0Y0VU5ISVBicmo3VlVV?=
 =?utf-8?B?V3AwNE9JcU9rYXdxR05mNzVRSGtJY1h4WXIzVXgvdm9LZEk2L0YyZnIvMTA2?=
 =?utf-8?B?VnhzUWVBYVNlZXc4dzVaYmJURUMxOC9Kak50S0xBSVJwbHU5TGdqVHdLS1dQ?=
 =?utf-8?B?QUVBdkM4Yy9wa3UxU2hPYUNPMmtSUU05TU9RRTBHc01vOUovb25ITWcrVmIv?=
 =?utf-8?B?R0RxVU5WWC8vZ2JNS1ZLS0l4YXl2R2dmSWJPWHRIU0NLdU5LNzJaSTJPTGVh?=
 =?utf-8?B?RlFKYzBxenRpT1prTzk1S2phMEkzN1Y1RUVIUWM5dWkwdVUxTTBVTzBGeXV4?=
 =?utf-8?B?L2huRk9NYnZnWStLd2wwQTlocG1KUHNxNXhoSlpZSVlvN0VrV2w2Z3Y3c0t2?=
 =?utf-8?B?Zm1KYW81dXYrTFlLYUErL3NuZW9CQzhmODhHYTJELzEzTlN1Q2ZCa0FxeVR0?=
 =?utf-8?B?WUVSUE41V3pmN3crVkVEbktBMHQ0dEwvTk4rUTgwS2dKUTZ3dFhOMHVuNkhO?=
 =?utf-8?B?dDgxdE5EL1lGQ3JBbWNVZGhpaStSUm0yNFErcEd1K1UzTDZtNjNSMmU4am5l?=
 =?utf-8?B?RGZEQUc5NnRpUmNRMzJxSXh6bXdGQnczN3F2UVI1YzFDVXV4eG1XcHZIWHB2?=
 =?utf-8?B?bTV6V2ZtNm9CSUtsQmgxUDVuNFR4Z2ozc1FjbUd2Szl0N2lrcFhmOFZHUnJS?=
 =?utf-8?B?clFqVnVBcFpHRkFFYXUwZHFpQzV4K1lFUjhyMmlhazBOY3lkRUlUVWo0azBN?=
 =?utf-8?B?cnRnNlh1ZWNYNm5aWkdWc2lYUmIvdHdLbm5hcUhkVVgvVnlYQ25hbzZrT2hE?=
 =?utf-8?B?MFFQQXRneG93N2FmVkh1VmE5ZVhIdERRVWJsUVkrSFVrdjJxSGdHV1dDOWdK?=
 =?utf-8?B?UWtINVpiVnA4Q2FySVFDZCt5MlFYVE5RcVVGNi9IRDdQQjBkMGhNeVRxTmxq?=
 =?utf-8?B?QzZ6emFRcTBlU2duaUlYTG4zZlZUMytmcDBFdWVZUEJUUjlYaVZSNTBTQVBO?=
 =?utf-8?B?UGNYaHVwSVg2d0l2TlhGYXdndEQzSE5GdUN5dVJ4R1FRQVIyT3BvSEE0QU84?=
 =?utf-8?B?N015YjFmZnF0clJyQ21WdTBLVkNpYU5DUCtGTmxIL2dXZm1tQWdwc1RuZHFk?=
 =?utf-8?B?TVlWR2thd25wREJzZFJ0R21HKzgxeHVrdGxKVTV1YTVqTFFJK3ZZVXJORExm?=
 =?utf-8?B?YWMvd1B0V0xjUThvZW04WjBXbVEwaW8yRlNNYVp5b1lJNTI3RzdrR2JuQ2No?=
 =?utf-8?B?d29jcGtmZmlWbmJUYjVtTURxajFlTGR1WEpmeGVsbEpBSk02KzhjTFVrY1RW?=
 =?utf-8?B?TVozd0ZFMEdiUW1DTFJnOGo2Wm9RVUlUMkZpakwvK09IelV4Slp1TmNMZU56?=
 =?utf-8?B?c0RpQ0R3UzN6VHBTc2htN3pIQ0NPUFduUElvL1pxR0pidDZiTk1HQkJUMmVo?=
 =?utf-8?B?U1pTcnJLMFFmdGMvSGVRRmdjVXZTZFdJSExsTzlBbVdrUXZIcnNBWXNoTTVB?=
 =?utf-8?B?Y1JaTjRwSDJ5THBFRW1OOXNsQmxwczF5ZUtOR0xsdHJ6WFNaZ0ZCZkJkVzQ2?=
 =?utf-8?B?WTlQWlcwdGtNQWdMZDZqS2xtMFBvaW8zNjJPZFp4cy9wU3hGMDZRTGF1a2Ey?=
 =?utf-8?B?cXZvMFdySk1WYmJLSmdyRnQ2TXBUUDFVOFBJemxrdm5LcUJJTWI0aVcwRk9N?=
 =?utf-8?B?ZktRd0NWR2pGTDJsMG4vTUNYZEJMdFhUR3A1U200dy80Qkx0TWdONGtvNU1p?=
 =?utf-8?B?bllmOEhCa013c1FHL292QnFNTlk4aDh5T1hNeS8wdFM3UytIUXJMMys0Mldi?=
 =?utf-8?B?MWJXQkd4UHYwVVlQVzY3RUE5TmcreHBEZjlubEkzR0hsY3pUV0RXamh4Qk5k?=
 =?utf-8?B?WHpxWVRhVzBtckhqVmk3aWx3dmw0S0lqRnozZnJUMitFeXN4eG1vVjFBT1JW?=
 =?utf-8?B?ZnBPbGU4eWl0YXJjSlpEYkowSzR0dEdWVGlhU0ZDdldFSWNqNzcwNC9LQmpl?=
 =?utf-8?B?L2EwbE81TzZ0ekJhUVMyVDZZNkFuQUdrYmsxS2QxRlZwbmZXSVBxSGtMc05C?=
 =?utf-8?B?K0RoRE13bS9XY1kraDN5NWFNb0dhWm9lai9mTk1SR2toUitEbkFLUGxPamJx?=
 =?utf-8?Q?mU2lSb8Cc6fDNOHaaWvgw5kkn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5107dbea-717a-4ac6-553d-08ddd6cc8484
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:40:04.5087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygyU622SlLYMR7q+WWVmqf963n6bB5ixCDMgMge5oyHun4uoV3b97ulteju0+rtiVAI1i7zj7/bbOvZKytTEpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

From: Eugen Hristev <eugen.hristev@linaro.org>

Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
and i.MX95 platform.

Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v2
- remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
- update ugen Hristev's s-o-b tag to align original author's email address
- remove single snps,dw-mipi-csi2-v150 compatible string
- move additionalProperties after required
---
 .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 158 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 159 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fc1b167d6d3b142a01e2ea7f04230934260a05e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/snps,dw-mipi-csi2-v150.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare CSI-2 Host controller (csi2host)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  CSI2HOST is used to receive image coming from an MIPI CSI-2 compatible
+  camera. It will convert the incoming CSI-2 stream into a dedicated
+  interface called the Synopsys IDI (Image Data Interface).
+  This interface is a 32-bit SoC internal only, and can be assimilated
+  with a CSI-2 interface.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx93-mipi-csi2
+      - const: snps,dw-mipi-csi2-v150
+
+  reg:
+    items:
+      - description: MIPI CSI-2 core register
+
+  reg-names:
+    items:
+      - const: core
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: per
+      - const: pixel
+
+  phys:
+    maxItems: 1
+    description: MIPI D-PHY
+
+  phy-names:
+    items:
+      - const: rx
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node, single endpoint describing the input port.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+            description: Endpoint connected to input device
+
+            properties:
+              bus-type:
+                const: 4
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  maximum: 4
+
+              clock-lanes:
+                maxItems: 1
+
+              remote-endpoint: true
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Output port node, single endpoint describing the output port.
+
+        properties:
+          endpoint:
+            unevaluatedProperties: false
+            $ref: video-interfaces.yaml#
+            description: Endpoint connected to output device
+
+            properties:
+              bus-type:
+                const: 4
+
+              remote-endpoint: true
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    csi@3000 {
+        compatible = "fsl,imx93-mipi-csi2", "snps,dw-mipi-csi2-v150";
+        reg = <0x03000 0x1000>;
+        reg-names = "core";
+        phys = <&mipi_dphy_rx 0>;
+        phy-names = "rx";
+        resets = <&dw_rst 1>;
+        interrupts = <2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    bus-type = <4>; /* MIPI CSI2 D-PHY */
+                    remote-endpoint = <&camera_1>;
+                    data-lanes = <1 2>;
+                    clock-lanes = <0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&idi_receiver>;
+                    bus-type = <4>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index edfcee622f74054f519336f0ea963e7c8f2f6add..385b797c1e29c71fb89a908d543cc60806aaa978 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15193,6 +15193,7 @@ F:	Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+F:	Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
 F:	drivers/media/platform/nxp/imx-mipi-csis.c
 F:	drivers/media/platform/nxp/imx-parallel-csi.c
 F:	drivers/media/platform/nxp/imx7-media-csi.c

-- 
2.34.1


