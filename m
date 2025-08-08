Return-Path: <linux-media+bounces-39177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DDEB1F106
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC7563B71BB
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD29C29B233;
	Fri,  8 Aug 2025 22:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A4X64m/5"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F929B226;
	Fri,  8 Aug 2025 22:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692948; cv=fail; b=Xl+YyhrFEjzhxo8gS60+WnwrwyV0gP/FoFsDatLM/V7c8aTnAndicq1528liD+wzpMv5wwIxv2vzhLSNpf4MHCqsMGGnboSl1i8BysnmAUPdJg75ssBsRtH2a9zFvopQMpvx5TnWNw6IO3UqrTev179SX2Yg91xIqj8cxZzsw5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692948; c=relaxed/simple;
	bh=PBDNTvXIFEAjJxBHy9BBf9XDpOYvbsjSNnPeCEuBbXg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZqZPpUtSUyYjGJHjhpv2YMnXcLq4J+6RnkB2Fj8t+1CFIqhra7/jVZGesmZK7pQJntGz8NNsTo3B5CSqLehOQvxBtV7D8+PgJ9GzYWzZhIVhjt6PEwULm0aNo+PjTyXbG4dnxTxXo/FN6fZubaTA0C8+JBz4rZOjBfFHx0pkrWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A4X64m/5; arc=fail smtp.client-ip=52.101.65.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQO6qjz1cmorssmX4ACI1NrF6IfF4S86/kxyLslpUgc6InsFVjg10jRzbAj+gz7o8G9m+NpVkvnH/8fwBMs91BK4DnoerAf8vWXDFzVEE6cqId7cT8O4PxbCYQh5//HMx//0aMTPeQM1mjHKsEyIKCzSVzHDqyReSAsIuttOrBP+QF8Z+0R11wJXrEhH1syTuOBjXkGxcqtrQ6yOpe4yWOyg6YzsRlQNa9mPC0ZW6R3/VVFvbcm2UzR+xR58UpLmdWpvceq/hUFZPsYl/z1muiq+tApFAYbwNZtEotomahm9uItJ17nQyqChrBGNMqdNV/PCrDT9x8v4fWtdstQNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZkYPcOO0PhGFmlOWIDO64JalnVAdWR4JxyoZZ3kx0w=;
 b=n+R0ZaE+chG3/fLU8Ck4HGWmttMTgThTmTf9ormCGG9o+7wYB3zWomBA5Za3d9+uMOANNOoKBwLyURQp2QcGT2U1dxgbnfZdgupqCOxckdghi4lUYCmOzWcqBaxUoGvbeOn48amYI88IN+SdGnMbtTwatM6FFDk2mDBQfud+Fejnm3EJTtm6k2LLmIAxNTVHiAVX964drBmupaTNXOV51/jN7avfdrrA1SGNBY++8wNHSuAIEnuxjva2xoC+QjA5IQuFEFD8LDhpJRHHITkLFs1jskBYOVaqN/xWnK4a9Is/lRU0BqvQ5zUZYoEz/Hfm5k0mXvSdj0DBZlNRopC4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZkYPcOO0PhGFmlOWIDO64JalnVAdWR4JxyoZZ3kx0w=;
 b=A4X64m/5fAs2oL3dutrtRNRnJPPBle7LR1Aho2/mk9ZQufNjfUqY8SbfP5GKLLKZZpuzU/Cp/tJDS3V6VZ/Ut8BF59AX2mkqBj231L0Bp9JRLctfdjmWMYJOXACe/efGsL9bJAnduP8BFcgw1wm/NGM2e162ExNmgL1+gixrNzO+GgoO8h/4PHYM1mqAScoPB/oPO8dA92XFOe79sFmUc1fnLM83zOHUTzCy6FYQygha4zIlBr1Tm7PzCVfc2ePdR455OdriledlteDiu2OMNkVBVv15zPEcUgPz3QvqmKQbuqbjXQOp1Uh+Pp8M3eedtej+ywGHjtq9dEemBSU/dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:42:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:42:24 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:28 -0400
Subject: [PATCH v2 25/32] media: synopsys: csi2: Add need_dphy_reset in
 config
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-25-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=2901;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=PBDNTvXIFEAjJxBHy9BBf9XDpOYvbsjSNnPeCEuBbXg=;
 b=t5TrxcsLsgnNLCrZwPBIkLy+JPlY+QND5p2zKkfpYoSm1DpfXcDtfEE/A/gV4ZtT2hXgBu/D4
 oDyed3T5KfSCdcS6r7/a/EJcR7AnJTDOJcsIgp+GwaKXoE79ANYzvQr
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
X-MS-Office365-Filtering-Correlation-Id: 39c52d6f-8f6a-40f6-f758-08ddd6ccd835
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZTJFYWd4OTlGRHVtUnV3RzRnV1Q2VVpJNGNDYXBKbWpzVStFeklpenBHTVpI?=
 =?utf-8?B?YmUwc3kxTTRqKyt0ZVRDdGNERGdtQUMwWnF4SXA5YlNySjZkK0dzdis1TGJS?=
 =?utf-8?B?TG92dkR3TjluRTMzenVrWFhmS0MxQUlZVzhORUV4VWpqUmxveFk0RjMzYVNE?=
 =?utf-8?B?cEx2SFVpRk5lRTNEL0FuQWFqS0Jia1FYdGYzZUtkek90VmFwZzlqRHo0RmFO?=
 =?utf-8?B?Q3dKbEVIU1ZSZW1rd3d0ZXNVUERyWTg2QytDcVZ4MEgzMmpHZXE4NThRZzkr?=
 =?utf-8?B?RDRlaWJGMnJkZmhWQUwwcTZrOWFrT0hRR2o0bURlWlRHcElnT0YzUTRHSE9V?=
 =?utf-8?B?OWFmQmgralk5RllqQkNTcUxtRTJyRUUwVDE5UmpSVGFVaW8xdW5Ec2VmK3RK?=
 =?utf-8?B?NUx4SE5zODU4bkVkYTJSN0MxVkFrS25ZeWxzaG9ITmdtU0Q4M1FwcVlyQVJl?=
 =?utf-8?B?UDZLNGd0SFN3aFdCT1RvTW1BT3V5TmhJYTYxK1kzYmZSdWs4aXl5TWxzOXNz?=
 =?utf-8?B?V1hEcXdRR1Z1TThSTXlPSjFBcTBSclR6L2oxR3lMRDYwV0UvR0gwZmNWZmph?=
 =?utf-8?B?UmNST25WYy9KOFVGMitnVUd6ZWxwekROMUNjeXV5NlFXb0NLVWFsMDV1MGhD?=
 =?utf-8?B?S0hta0lRSGtTNW1jb1VlMmJYWFdDbUlPako4RURCWFNuSHNhMVZkL00rcDJx?=
 =?utf-8?B?WkVGc2dHYkw2TGIyeE04MHlnQWxWeWRwNmRMblo0aWFUSUc0dm9NaDB1cFhS?=
 =?utf-8?B?ZWdsTU9KeUtKeW1aM3pGdkVVVXd3K2xlcXB2OTNWUzRSSUZEOUdrdzkyTkRE?=
 =?utf-8?B?Z1RmcDNTOUovdFRoMTU3NWo2WVd5Vkt4MkEvNWJEcU82cWE0U0pKZFc0eU43?=
 =?utf-8?B?Q2xkNEt1YnY2dkYvMis5Z09UejVNYW9MaFhBU3c3ekpoa3NnbVlVaHNOenJj?=
 =?utf-8?B?K0FPRlV0NzZyelpRSTM2WWpaVzg4SDBLMm5xc2x6UTdveG0vYVVLNTFDOVVK?=
 =?utf-8?B?UmdjODk4bm05RjV2MFZFNElXanBlZUxKZjBlNE52RTQxU1E3cGxXdnkvZXA2?=
 =?utf-8?B?VSszb0gyZTI3Y0JCR2NJRFBqZDROTlBPQURWUTE1NndKVW1aanJBSTVLbW5F?=
 =?utf-8?B?NVZ2OXdDUmxsbjZ3Z2crcUhOVlFVSDhTSmpBbktpWHJ5SFg1MUdoKzAvU0RN?=
 =?utf-8?B?Y3JMdnlKWFM4d3E1TS84NWlLSDBpQXJRSTQ5azRXQ3JRd2dVR0lxV1NrVUky?=
 =?utf-8?B?N3R4YzFVUDJTMGJveUlkM2krQ0VETno0WXBzOHdoOFdtUDNqS0kwbG5PdWds?=
 =?utf-8?B?aHZhWk41R1hQcnlRYnJaNDR1OUFIKzJGUXJlWnQ5ekFmeFNmc0NrSUZaVFli?=
 =?utf-8?B?dXppcVNUTUJ4VWVOSHBQb1Z0YUgxblRxeGo2cFlTWThxM0VnMjF2TjV2MG9W?=
 =?utf-8?B?TldaVFJmckt1NXkvS3RNdSszMjJ4emhZV2JOK1dhOGZCemVYWW1RQ2JPdUFk?=
 =?utf-8?B?dUlsRWlCVXZiVWh0TWZzdnprSnZiTmRmQm1ubUxCRnFUSzhSdGUwejQzOTlC?=
 =?utf-8?B?REtaVUhsbGlhSk5LT1dFdEpkQlQ0V1BFSGZvdHloTWVpdFJacEZvbUpFSWxE?=
 =?utf-8?B?c0duOGw0YktHcmg5Q3B5TSt0V3ZhRlkvTXIrcFkxbmJ0RUg3cWVER2NNUlJN?=
 =?utf-8?B?Ty81Ym8waUhOVHBnUTc1N0NTMzJnRmo4Q1ZJRHNqS3NKZWFyaG92b0E3c0g5?=
 =?utf-8?B?NmlGRE9KVkIzcldWS2dYc2Z2WDN0bFBCd3JUV2NvTi9iRHp5cm1qWlNobVBC?=
 =?utf-8?B?L2YwdDRsZnpWYWo2QURaekt3UXYxdWdTREozZ3JBclFLSTlaTnB2dlhMcDRz?=
 =?utf-8?B?cmRDS1ZoSVZudWdUdFVObGdsMW5WRmxndnVHSWFIenVRSC84VHFKQnhCb3lx?=
 =?utf-8?B?NkI5YTQ1bWtFTXR4a041QVMrTTRVWEE5TmNTN1NNWENrWndra0QxMjlaV1JH?=
 =?utf-8?Q?UF4esr7S/KPIcZ8xUqfHMgbNo1HxKo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MGJjdVFJbUdsN21DR1hpaVpLblBWZkxTMGVPOVZMNmZNSXhBTFQ4cTBXakxC?=
 =?utf-8?B?YnlLVkFIOFhKb1JRUWtsaVE0Y2VrNWc0MHZGelN3WjB4RzYwNHFaSHhOVk9U?=
 =?utf-8?B?V0JnU0hYclRPaXZYc3gxbU1EazhEeHFsbTR2K3hHRU45bG9jTkRaZ2w2Ti8y?=
 =?utf-8?B?Zmcvc2R5dXRLTzd6RVNjUGFyZUpvRmF5eFBFSmVpMFgxNHRtME5Vc0JhVW1W?=
 =?utf-8?B?NVF2b2VwL0IwS0RiMUsxYktNNEpYM2IrellWeVkwN1lWL1ZLME42Wm1ubHBB?=
 =?utf-8?B?WGcwbFAwOS95dHRuby9qWEJSdmpDTmxaenF5K3ZnbVhJYks1Z1VJaTNMWTNp?=
 =?utf-8?B?bnRaVnBQbW13Q250d2xNdjV1ZWRQWWJIWW9WdHd4MTYrN09TRFA1WmNlcitS?=
 =?utf-8?B?QlQ3dFdISDl2S1ZERmZFblh5dnpYMXJnSFpSVThWcHQyUllvcmRER2V0TkI4?=
 =?utf-8?B?eitxUS9Yc1hBSlRUTldJbFQ5VGM5K3IvTGc0VGMvSUd4dnBGQXB0MVpLUlNM?=
 =?utf-8?B?TWgzZmsrMm9pTEE3MnhOS0tmazlHUnZYa2tCa2cwSDFka1pkMEpxczVIaW5E?=
 =?utf-8?B?TEJZOThiclM5MEl5Uk9lSGE1Si9GZDhQbTdpcG9weWZMUHEyVFBHWHVNUkRE?=
 =?utf-8?B?blJHVVE4S3pJQUoxY2VTVDgycTU2eDVXd0tXejhSaFE4MmNCdGF5eXhrdldE?=
 =?utf-8?B?TmV6ODhoMGM0V0I3MTE3MitnRjRldDZ3RXRTd1pWZnBzYllndVZwN3N2Y1Vy?=
 =?utf-8?B?YWY5bTVURnR1MjRnb1lTS3ROQk9OdE1qei8wcnlWNnU0Q3dNNHJ0Tk05WjVM?=
 =?utf-8?B?VDFUSjJQd2tvWmNDT3lReE14WUFldXIxTXBRTFdxTDcxQVNsd3UrT01QZWtZ?=
 =?utf-8?B?L2RpUkRnN09VcmJBaGhuUVFEcFhJS2ZObGFKTjlXY2JvbzN5amtpQW5ETTBZ?=
 =?utf-8?B?RmwrNXZTY2xtNHNNTm02L2VOM3liVDArTWMzbmJCVXFvTHU2VFRaandCUG5U?=
 =?utf-8?B?bVkrNzk3R2JnR3ZQb25XV0dGdlV4N25yYVpxVmY4aThoaThaa2FRNFArUVJ0?=
 =?utf-8?B?N1NRZC9JcllWOTVvYldkMjlSM3BTNGtlOGJvUnl2UTVQNUYvQURjMHhJb1FT?=
 =?utf-8?B?elNkZ0tiR0NGMVJhU21zS0x4RllwV3UyZ0t5V0xMWERUOVJVeW16STZycjBP?=
 =?utf-8?B?WDB2eDJWMkZKT0gvdHhxNFhWS2JGQXdvR2xQbllOcUxoT0JSR1pFdytPRlBl?=
 =?utf-8?B?NS9iUUx2NlhUNkxWajVWYTBTUDBYMlpiN3QvZEpEdkxqTGNQd2hZa0V4bFBo?=
 =?utf-8?B?TFVpbkJ1Y0o2V2pDZ01MVzlvUTRFaVl2aGZqYTFPT2RRYmNLZUhobEZXMmhT?=
 =?utf-8?B?cENIdjA2a1F6RnptejdFR1NiV0YraFQwVXFHbm5Ic3h3c0Z5U1NzQS9hNFBQ?=
 =?utf-8?B?cTNPK2tJTnBtWDhGTzB2cEZIbmlrc3F0Zi85OEtrVS8vREYxN2E1ZEp0c2JJ?=
 =?utf-8?B?Y28zaVhvM290WG1KclhMdGRGOFZSeVgzbFA0dFQyWUpaVGN6bFVpMk5CbTRN?=
 =?utf-8?B?TkdpRkhSd2FCcmMxYmxvUGZxdG9NN0tYVHJBd2hQckNOb0p0M2FGbHYrQi9m?=
 =?utf-8?B?eXBJbTY4TEtmSDVBZUE1eUdxNnhKOGJKaXZtK29HMWVGNmxsbmtqajJFYUwv?=
 =?utf-8?B?TnFzTGNYa0I3N0VmY0VqMXRTVFN3dGN3bUErcHVwSGl2Mjg2aFJGakxjU0FU?=
 =?utf-8?B?NWRiM01FNlQwQlkySTlqUGs2RFhVREprVGJLblZOZW5tbWczV3A0UkNpQUxk?=
 =?utf-8?B?MWI2OFdLQmwxWFJnNGNMSHBweUF3Z1VmOUJUWWhqdVBtdEl4VUJtZkJ2bFdm?=
 =?utf-8?B?Yk1CNmpkOUwzUW9VWGwxRUdrQm9ZT2tBMUJoV1lLMnVLYkkzMTZzdzIxclly?=
 =?utf-8?B?V1ZkQXFScm9xTkw3RkIyanMvUDN2dCs4aFhpTmhFUUIzOXlGNi9kcFVZRnJM?=
 =?utf-8?B?WlFKekFuOU80S1VOYVdSOStmdS96ai9Xanp5S3V3czhuYkthTzVPR2didmNz?=
 =?utf-8?B?djg0Zm4xY3Q2NUk5M0Z4R054OU1xd3FQVm40ekFqMjh5b1F0WkxPV2R2YXR5?=
 =?utf-8?Q?bY9bjeylgipru3d67JdmJohPw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c52d6f-8f6a-40f6-f758-08ddd6ccd835
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:42:24.7895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duAOSc8/XmLRerWxqYcNnAoTSaesAZqn2urPqNFZPQL+gtMtmeKN0EN3pbi16ylt52yv4R7GEaDHgnrbfV27Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

Add need_dphy_reset in config to indicate need keep dphy reset state during
config dphy because some SoC like i.MX93 need it.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 45 +++++++++++++++++++++++++++++
 include/media/dw-mipi-csi2.h                |  1 +
 2 files changed, 46 insertions(+)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index df19b960d33681452af49dad5e6bbb94daa63489..d1f08c8384ad45d47ffe81b6dc5f225aed43e21a 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -447,6 +447,45 @@ static void dw_csi2_disable_irq(struct dw_mipi_csi2_dev *csi2)
 	dw_writel(csi2, 0, int_msk_ipi_fatal);
 }
 
+static void dw_csi2_dphy_reset(struct dw_mipi_csi2_dev *csi2)
+{
+	u32 val;
+
+	/* Release synopsis DPHY test codes from reset */
+	dw_writel(csi2, 0, dphy_rstz);
+	dw_writel(csi2, 0, phy_shutdownz);
+
+	val = dw_readl(csi2, phy_tst_ctrl0);
+	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
+	dw_writel(csi2, val, phy_tst_ctrl0);
+
+	/*
+	 * ndelay is not necessary have MMIO operation, need dummy read to make
+	 * sure above write reach target.
+	 */
+	val = dw_readl(csi2, phy_tst_ctrl0);
+	/* Wait for at least 15ns */
+	ndelay(15);
+	val |= DPHY_TEST_CTRL0_TEST_CLR;
+	dw_writel(csi2, val, phy_tst_ctrl0);
+}
+
+static void dw_csi2_dphy_release_reset(struct dw_mipi_csi2_dev *csi2)
+{
+	/* Release PHY from reset */
+	dw_writel(csi2, 0x1, phy_shutdownz);
+	/*
+	 * ndelay is not necessary have MMIO operation, need dummy read to make
+	 * sure above write reach target.
+	 */
+	dw_readl(csi2, phy_shutdownz);
+	ndelay(5);
+	dw_writel(csi2, 0x1, dphy_rstz);
+
+	dw_readl(csi2, dphy_rstz);
+	ndelay(5);
+}
+
 static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 {
 	unsigned int lanes;
@@ -460,6 +499,9 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 	if (ret)
 		goto err_phy_prep;
 
+	if (csi2->config->need_dphy_reset)
+		dw_csi2_dphy_reset(csi2);
+
 	/* setup the gasket */
 	if (csi2->config && csi2->config->gasket_init)
 		csi2->config->gasket_init(csi2);
@@ -482,6 +524,9 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 	if (ret)
 		goto err_phy_power_on;
 
+	if (csi2->config->need_dphy_reset)
+		dw_csi2_dphy_release_reset(csi2);
+
 	csi2_enable(csi2, true);
 
 	/* Step 5 */
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index 20ce6a21f0674cad54f01edb508dce14cd07a8dd..d1afd8c6d95457c28d7e1de6935908437372572d 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -28,6 +28,7 @@ struct dw_mipi_csi2_config {
 	u32	sink_pad_mask;
 	bool	has_phy: 1;
 	bool	has_irq: 1;
+	bool	need_dphy_reset: 1;
 };
 
 struct dw_mipi_tstif {

-- 
2.34.1


