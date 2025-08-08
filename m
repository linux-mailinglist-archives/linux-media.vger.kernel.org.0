Return-Path: <linux-media+bounces-39172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CADB1F0F4
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A1137B79CE
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4892989A4;
	Fri,  8 Aug 2025 22:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cg4Esxfg"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE3629826C;
	Fri,  8 Aug 2025 22:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692920; cv=fail; b=sUYrGBPEdFT2dhSUk8s9/dfJsvKYIQhzivpVWQkLP3sWas9keWRtNo3/XnKE+DfErvLAijzJqUrIlskcgTQhjBhB9KTuMmpLZ25YKgW7h1nCYxsCWZ3syohSrQa8aJdJmSGuBdwo01dLkTz95caHsrbGKZKoLJri7vuOk5tRVwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692920; c=relaxed/simple;
	bh=pognmPfrjsoQM9Kf94YwQadt3s3m47OyeZRCg7PvFhA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UjPv4F5wTtDbTEmls505WKLqOpZ89qVbzsdO4vAQzSQWGIkAOnGkYMs4BaMv0SYy1iCsRV2o3EcD8CcBt0fvm5BbWGVRWmqB6LL4JU9WFq+6fXHuKhHVdfvXBHYfk9oXcQ1M/q3rT4kKPb8CudqcVUFswzeR8itTN8b8o3Q5Fec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cg4Esxfg; arc=fail smtp.client-ip=52.101.72.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFiXKjLW58ZIhI5IHCmPv1HSj7T4IVdvApwPAdfkADKvgfJMM48QNOg5p1+QgvxlqEhbU/5Z9tiKPmqcU/Y9zcm8C45+lNcw8TmWa8nwN/JMjQCK0usfgploH5f74ECayHXyEBIIFsb6pXNI4p5+F8sy1/IsDNqnaNFyRyWIdg0eJAiKZKjCh6S5SUDthGhUhhmHWDPqhFhxXFkB9J5HfXBzQcP5nBQBgbWIKy0iQstyY72XsuXNGLPQeqxlzwuiMEh9SeqxOCvvQaadZrDvPLgturSPhoLRIFh0sbDNMGK3lvhJaL6ZrZnELMCL5LjZZWoAltKneJKpy0WkNJabGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkmmSy53dSLqNBg5C6mgLcuoLlQHSQ9ou2mktohZLso=;
 b=eEzkTPj5mUIuftkOlbcRyzRhibNGy+AW/LAS5AhyKqiI4HjsEr/8UEmb8UtJsSUNks7a2WTdZOifdmMB1RpQqoKCWzheVI5uzIkEVY62focmDmVg6vvGiN3gCxcPgsMt5o5ds+J1TRyfZ21D4OVCEsF9MWRGhllBE44cKHoNtTQT3MIs+bSShzxXdyc73pWDy2U/ypVd1Uh5bai98K1YZpqhPSycHGG6nDnUfqe1sbj5m7GE9uAmqbbslZcRWHAE3JHjU9Wh2zQagH6sRM3SQz8ulMdgxxaWXjnIbIFm3W3RKhBoPkes1E+oLaaEUEwxF0PvbVnw/hi8plZg9Hm2mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkmmSy53dSLqNBg5C6mgLcuoLlQHSQ9ou2mktohZLso=;
 b=cg4Esxfg2UliY6FPtMPEWSMrbyEB7gLmGo3CoT6HxS5jDovKwmcL00PUsiurw5cpEkHTHEshAQkNEZ++4RlwIoLhKjvJq/RMquglvb15PeJRpW6EcDXboqL7+8B3vLbDKG3u1XcW1Mlv0FoLUsgePS1ACF77/FhJqEUabv4saycSKx0Vjt0R/OUfHGTy9eRqu7tJRHbyim2YUkYQGFW98yP84KDzj8tGE32sCSdo6MHe5RRAAx4MGrS6DCP2fg0/eh5Ncy1z/3a+V5xMivzQqP4b9o7eHVw++qzm/sfThqF1tcz3i6dZ+CTid72DM4ihvA+nhe7ag7Ghrn12tYpldQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:41:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:41:55 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:23 -0400
Subject: [PATCH v2 20/32] media: synopsys: csi2: Add phy interface support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-20-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=5413;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=pognmPfrjsoQM9Kf94YwQadt3s3m47OyeZRCg7PvFhA=;
 b=Zln4CJ2cHGXILElZL+cCUiwNrwlZPCXMBs7Q2dHq+xymqvAeetvHTjWBqvb9PGzqHaCKsDg4R
 2b0S3hgK8b9BGxM52g6kO+tzXY1/+q0Swyh9m68eBqnvtRPHXO7Qif6
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
X-MS-Office365-Filtering-Correlation-Id: 6bc77383-5059-4fa6-d72d-08ddd6ccc6cd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bUpseG5ydUF6NGhkaXZtODJ5U1dnME02WVIwbjBwSWdlRmRPbjRid25Fc3Ri?=
 =?utf-8?B?ckdZT2h5dXBqa0tNaWtpME83NldYQkRFVS9mODR1TlZrTmw0NjlqL29DaFd3?=
 =?utf-8?B?MEd6VDl6TFMwdGREWng5ZWlaZGgvV2N1MXEvQ0dPa3dyUWRnY1B6UG0rRDNn?=
 =?utf-8?B?QlVBdWNJQjhmUjVIeDVydGx5MXVUNW9tV0g3dUx4bUE4bEFPVmNhRXJMRFdT?=
 =?utf-8?B?UWNCWnNhU3Fnd1doMC9HcnFvTkNRNGduelFxM0pHbTlrdlN4d3JVeDBWTjVF?=
 =?utf-8?B?M1BCVFYwZEw5WW5XTytOclA4SzRNY0wzdVV1aTY1OUFVdjgwT1hKdXJBSnk5?=
 =?utf-8?B?YndYMmFtbmg5SEhweDN2M1lIby9rQWkyTndFRUZnYnRONUp3Y0dGV3dBSFdU?=
 =?utf-8?B?YnplWk5TQU5LNS9DR3d5UnpYUkNrdmg5WXJtcWIwcUFlZ3ZhSHQyQkV5T2pn?=
 =?utf-8?B?UkV3M2EzWU5sWnZ3T0VOS1dmcTJ6d3krVDJtT0pIYTNITmM5VmYvaHZxdm1M?=
 =?utf-8?B?bC9NZU1wRmtrNkFQSE5EWWwxNGhiUStSb0tnZGVzdThqU2ZZeVM2bDd6S0x4?=
 =?utf-8?B?VStxa09uNzNPelFPNTZXVXhUNzRMVThqdlhRSEdNaXJERmozR3lRaXhpNjg3?=
 =?utf-8?B?eE1IRDVwbnVvNkpmTndqWGc5YUYyU0s3MmIvc3ErWk1LS2dSMGk4WklkU0dH?=
 =?utf-8?B?aFFiT3g2ejZZMzFDc2IxU2dxejJzUGcyTE1WWk50Sit1MEk3WEwrQnF6SVRT?=
 =?utf-8?B?OHBHeTVxRkloSUVILzRuTzh2WFM0bDhGK3RoT09PV1E4OE5aUEJja3B2dGZT?=
 =?utf-8?B?bG5mbWNqYmJDVVNTcFZjcDR4SkFiU2RiWFJ5QXJUajI0WkJ6UEYyOG1nZmZT?=
 =?utf-8?B?LzZYODNqT1FvNi9vbEl0cDZMWTRpaVNSZ2s0dVVTYk5adUxTOUQ2ZHI3R2hV?=
 =?utf-8?B?RjNWYjFhRDlrRFdsMEt3WXpGV1JpSkxaWWt0a25nUHlkcW9nM1R0ME5MV2JP?=
 =?utf-8?B?Z0Nxd2ZMVFF5Z3dOZWE4QlhhOXJ4SkNFWnVacm5LSWU4KzVyZlpNU29PZTZq?=
 =?utf-8?B?aUJiR2JKUTYySEF0K0dCaE1IVnhMS1J3TUxFOFNUT1ZLM2FpZXY5SkovU1JG?=
 =?utf-8?B?QldvSDRCRDZHZE4xV3hwV2hPNmYrNEdHZExjZWZqNDc5aG40WHZHRkFRNW9F?=
 =?utf-8?B?SytNc1MxaUdKVG5LQkh0OUZRM0wxdEkwOTFaL2paUjl1MUJDdnhMbklTenNi?=
 =?utf-8?B?Z1R5Vk9HWUhTQWhFTzhuTTFyT2hXN3RuOUxIWEhHNitEVWdycG4zcXFLd0Vl?=
 =?utf-8?B?bTNwaUwzZTJFeGxWenI1eG92MDBrcHhkU2V3MWptVzJoL25BdmpxQjN2cFAx?=
 =?utf-8?B?WDdUdGJxZjMyYU5nbjlBUytEMjV5MUtxVlZoRHdCdFpMMzdoNXZ5V0ltMkZo?=
 =?utf-8?B?emxDbmlMWUwvSW13d0ttQ0hXTEJzQkNqZHdyTUtmVzZUVmUwUEJjYlhHMkhh?=
 =?utf-8?B?a2s0UFRyUjRPTkJkVS9LcHZnK3pCYnlnS1A5MmQwYjVXdzRqa1F5YkJFR1lz?=
 =?utf-8?B?RzkxRTQ5WFc3WVNSZXNiSFZMQjI2WjZuYkJmNjQ4QnhpMm9qTlR5M21qRjJx?=
 =?utf-8?B?YTN2T1laQXVMbVk3cXg4Q0tZUDdJTjhyWWI0eTZnYUFMekErTUtxSTlNWGxI?=
 =?utf-8?B?b1RCb0dRZzIwTVVYSnp0Rk9kbDRFU1VWYlVxSFg2TjRPYktjZFJUMjVDaWJS?=
 =?utf-8?B?SXpmU1RzdmRsZU5EcktjaGpxcmtjTzg5QkF0U1l4d1VNcWpKMmxsMG5EVith?=
 =?utf-8?B?WHoxQUw3UlFCRmlpS29DNUxOQlNGMXVHM2hiaTFIWDNNalJ3a1FYVEVvTVlx?=
 =?utf-8?B?OHdFWnJQN2lMcUVNdFRzdHpKcmJPRm5JbkNGeXBsRHhZUnVEQW8yT0hQdHI1?=
 =?utf-8?B?RHE2am9vWGE5MG1BU2gvK3lhaEZRZ2lqNXhMc1NOMk94MUpZbUZsN25yMHhZ?=
 =?utf-8?Q?ARJEElID9yIwEz33tjsUSgkzzFU1qM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VUpJSkpobjMvREo2Y2krQ0dPK1Z4cnhsUWpOcVhGSytJVjNiZ3l6UTJHRnF0?=
 =?utf-8?B?amtuV0x0TGlTMHgwemd6cWZHeEJqbzA3b01GN1UzTGRMN3QyenFwYmhMQzYv?=
 =?utf-8?B?ZU1xVlIyVlBKZ1Fjcis1VTN4eEVERW90K3cvbTBTOExjSzNPZGNJZS9RN0Rh?=
 =?utf-8?B?eUFMNC90UlVIT3dWVDdzVEhMUHNTSmtTeWUwQUJvMFRYOUxOdGZXYTBOK2ZI?=
 =?utf-8?B?QVNiaGtRbGZ2RkRCejhXVllxNVVsUEFUVnFSMCs0SjUzTUgzR25jZzdMSVYw?=
 =?utf-8?B?c1o0bnFXckptRVExYlhUY0JOWWhzd1BObndZYW1ia0xTczdCMlVVVk5hcUs2?=
 =?utf-8?B?Q3p5NVl0OFdic2pHbU9vVC83QUxuSXNRM1N3SEIyTFhGTTEwZG9GRG01TDVI?=
 =?utf-8?B?ZzRIS1BQSUhoT0pUYStFdUttQmdsRXJnNWM2ZFkrT0dtWDE4aG5JR0JWQlgv?=
 =?utf-8?B?cXVFN1JZcXhOM0tPMzhLS2FQekdFVi9MbElCRnpVN2V2dFVEcGhaa1ZFNmI4?=
 =?utf-8?B?eEFnd2FZVjM1bHJhVjZtNEEwZmZ1TnVIUjRrdnBjSWxud3ZZQWlEWndkU0JR?=
 =?utf-8?B?bjF6RlVEVGgrSWk0WS9JODZodnNDOXFNZzZLVFRVYU9lZTk4d0E5TFk4eDhz?=
 =?utf-8?B?NmFqOTBoN2hBaEwwb2xqUlpkRmlMWWZxNGdUZjE0YkZyQ1FQMFJtdFB2L1ln?=
 =?utf-8?B?SlFjTUpBRzVrOFVLZHZUYVhNS3ErelhUUTNmSklKcFBreG16ZjZDTWdycDdk?=
 =?utf-8?B?MjJucjl5Qk9YMHY5T1QySkNtRldBYVMwVTdmdktnUWNuNTdETnBGalErTzh2?=
 =?utf-8?B?RHU2RFJUN21ieWp3WitJaWJncklWd0xrRllKeG9iRzhOZHh3djF6RnpubFBp?=
 =?utf-8?B?YktWSHk1SUYvbGpJUnBQQTM0MjkxaEYxVHdmOUpDOGozMnJQMTNjQnNyMmdX?=
 =?utf-8?B?TzMzRFF1NEwrTHd5a3NUNGhlYmNtNytrdTZ6VzY0RGczS2FpNWRkcTgzaERZ?=
 =?utf-8?B?a3dUbXVrMEZ2bndDbFhMRmltNUg5clZ1aUV3WElTdDdLclhBbFR2a0Y3aXdN?=
 =?utf-8?B?b2VBdTF0YnpoSWVQeFYwblhuN05uYXE5MittcGJpS1gvelgvQ0JIL2JhN1RY?=
 =?utf-8?B?WXcyM1RGY2ZDUUkxT3ZMMTBCOHhYVldPWEEyNnlYd0ViWFplbGNPc1liRUFh?=
 =?utf-8?B?cGoyalRnZU1pTUsxaVpYaE00MDMxWUQzR0FrZHE1N042QXlHeXJMeU9hSEJD?=
 =?utf-8?B?T1JSaGJsei9WTml5UTBuVFMwYzZDei85d1BaK21CL3dWbjdacy9SemFRTDNW?=
 =?utf-8?B?NVBaU0wrU3M5TTd3RW4rcEVFc1ZPL05DNHZxeS83NmNkL2Nkam0zdkJDWGdQ?=
 =?utf-8?B?SHgxNkcrelRUQ3pBakw5TUs5aHpsQkRKTG04Rnd4UGRIOEo0bndGdVRHZ3Zw?=
 =?utf-8?B?Yk1wN1k4OG1lVThpaUJoZldQc1hiVElLK3ZNbDE5dFhIa1RhYWoxelY2YW1S?=
 =?utf-8?B?YVB6RkZKdEJTVmg5NldTZmdTYkdxOFFOZzh1a05sVXFWdXFQQWNJMmxMWG5k?=
 =?utf-8?B?MUZwUUxSc0xDWXpXSzA1RXZGQnZQV25WTWo2c2xsY3RUM054ZFlDMzhXM3VT?=
 =?utf-8?B?UTFUR1kwN3NmeDQ0TEorSWlOT0QwZWJDck9BSkErUnhzSm9HaC9DVVhnMU9Q?=
 =?utf-8?B?OVgzbWhJd05LYUJlK3RrVG1TTFdWSFJ3N1JXNWROSXd6Z1cwL0I1QTZlWkd6?=
 =?utf-8?B?Sno0RndqMi8xN0RXRTh6T2pUL2hMbk5VZGttalJnU0d6NjZ5VzJ5Z0o0dGQ5?=
 =?utf-8?B?YW1uWGQ1VlFFNzI0Q1JTdUtlL0ZjNmRid2JWK1QyblNjNHBtdVBxd3BiV2NV?=
 =?utf-8?B?MWNyMjA1VVdVRGRnQ2M5S3JhZVlqcG9INk9PVWk2YVdrL2tGQ2o2d25PeUFl?=
 =?utf-8?B?ZG5lVkNQcnZRc0RyeHd3aWhaTk05M3dYY05Cd3orY2lBT2MrRTkvYmxCQ1Z6?=
 =?utf-8?B?dGNQd3JUTzZFSDJzVk1pYWpPQmxENy9ES0NkNDZtTWZ4bzYya01ZYlA5OVZy?=
 =?utf-8?B?T0huVVNIU3dLS2hYN2FHUmhKQmRzOGxkTUE1aXJqVGZadHZ5TVZJMEtPUmxM?=
 =?utf-8?Q?uiwTv2sc1fpP73UoE7l2m8iLk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc77383-5059-4fa6-d72d-08ddd6ccc6cd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:41:55.7192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+iOawIrxonlDHV0OVtNlgdA/nkDHrWSmDMzfi0UggW3VAjVzz4sEwNCFgNhykmzKWluEsJPOz2tVw9JXBAz0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

Add standard phy interface support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 91 +++++++++++++++++++++++++++--
 include/media/dw-mipi-csi2.h                |  4 ++
 2 files changed, 90 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 9ea3ae22fecfbb66abc460c40cbbcf15e1a97494..610f2debbf08f571a47f5372853d5ef10a6add52 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -14,6 +14,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <media/dw-mipi-csi2.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -268,7 +269,63 @@ static int csi2_get_active_lanes(struct dw_mipi_csi2_dev *csi2, unsigned int *la
 	return 0;
 }
 
-static int csi2_start(struct dw_mipi_csi2_dev *csi2)
+static int dw_csi2_get_dphy_configuration(struct dw_mipi_csi2_dev *csi2,
+					  union phy_configure_opts *opts,
+					  int bpp)
+{
+	struct phy_configure_opts_mipi_dphy *cfg = &opts->mipi_dphy;
+	struct v4l2_subdev *source = csi2->src_sd;
+	s64 link_freq;
+
+	link_freq = v4l2_get_link_freq(source->ctrl_handler,
+				       bpp,
+				       csi2->data_lanes * 2);
+	if (link_freq < 0) {
+		dev_err(csi2->dev, "Unable to obtain link frequency: %d\n",
+			(int)link_freq);
+		return link_freq;
+	}
+
+	memset(cfg, 0x0, sizeof(*cfg));
+	cfg->hs_clk_rate = link_freq * 2;
+	cfg->lanes = csi2->data_lanes;
+
+	return 0;
+}
+
+static int dw_mipi_csi2_phy_prep(struct dw_mipi_csi2_dev *csi2, int bpp)
+{
+	union phy_configure_opts opts;
+	int ret;
+
+	ret = dw_csi2_get_dphy_configuration(csi2, &opts, bpp);
+	if (ret)
+		return ret;
+
+	ret = phy_init(csi2->phy);
+	if (ret)
+		return ret;
+
+	ret = phy_reset(csi2->phy);
+	if (ret)
+		goto exit;
+
+	ret = phy_set_mode(csi2->phy, PHY_MODE_MIPI_DPHY);
+	if (ret)
+		goto exit;
+
+	ret = phy_configure(csi2->phy, &opts);
+	if (ret)
+		goto exit;
+
+	return 0;
+
+exit:
+	phy_exit(csi2->phy);
+	return ret;
+}
+
+static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 {
 	unsigned int lanes;
 	int ret;
@@ -277,6 +334,10 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 	if (ret)
 		return ret;
 
+	ret = dw_mipi_csi2_phy_prep(csi2, bpp);
+	if (ret)
+		goto err_phy_prep;
+
 	/* setup the gasket */
 	if (csi2->config && csi2->config->gasket_init)
 		csi2->config->gasket_init(csi2);
@@ -285,15 +346,20 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 	if (csi2->config && csi2->config->dphy_init) {
 		ret = csi2->config->dphy_init(csi2);
 		if (ret)
-			goto err_disable_clk;
+			goto err_dphy_init;
 	}
 
 	ret = csi2_get_active_lanes(csi2, &lanes);
 	if (ret)
-		goto err_disable_clk;
+		goto err_active_lanes;
 
 	/* Step 4 */
 	csi2_set_lanes(csi2, lanes);
+
+	ret = phy_power_on(csi2->phy);
+	if (ret)
+		goto err_phy_power_on;
+
 	csi2_enable(csi2, true);
 
 	/* Step 5 */
@@ -322,13 +388,21 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 	v4l2_subdev_call(csi2->src_sd, video, post_streamoff);
 err_assert_reset:
 	csi2_enable(csi2, false);
-err_disable_clk:
+err_phy_power_on:
+	phy_power_off(csi2->phy);
+err_active_lanes:
+err_dphy_init:
+	phy_exit(csi2->phy);
+err_phy_prep:
 	pm_runtime_put(csi2->dev);
 	return ret;
 }
 
 static void csi2_stop(struct dw_mipi_csi2_dev *csi2)
 {
+	phy_power_off(csi2->phy);
+	phy_exit(csi2->phy);
+
 	/* stop upstream */
 	v4l2_subdev_call(csi2->src_sd, video, s_stream, 0);
 	v4l2_subdev_call(csi2->src_sd, video, post_streamoff);
@@ -364,7 +438,7 @@ static int dw_csi2_enable_streams(struct v4l2_subdev *sd,
 	if (csi2->stream_count)
 		return 0;
 
-	ret = csi2_start(csi2);
+	ret = csi2_start(csi2, media_bus_fmt_to_csi2_bpp(csi2->format_mbus.code));
 	if (ret)
 		return ret;
 
@@ -680,6 +754,13 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	if (csi2->num_clks < 0)
 		return dev_err_probe(&pdev->dev, csi2->num_clks, "Failed to get clocks\n");
 
+	if (config->has_phy) {
+		csi2->phy = devm_phy_get(&pdev->dev, "rx");
+		if (IS_ERR(csi2->phy))
+			return dev_err_probe(&pdev->dev, PTR_ERR(csi2->phy),
+					     "Failed to get DPHY Rx\n");
+	}
+
 	devm_pm_runtime_enable(&pdev->dev);
 
 	return csi2_async_register(csi2);
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index 3d70c1f4f38e7d663f9b043d8903ce57d630d1b1..14a80c09fd273c334f91ea70d955dcf92b6646ce 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -3,6 +3,7 @@
 #ifndef __DW_MIPI_CSI2_COMMON_
 #define __DW_MIPI_CSI2_COMMON_
 
+#include <linux/phy/phy.h>
 #include <linux/pm_runtime.h>
 
 #include <media/v4l2-common.h>
@@ -25,6 +26,7 @@ struct dw_mipi_csi2_config {
 	int (*dphy_init)(struct dw_mipi_csi2_dev *dev);
 	u32	num_pads;	/* Max 64 pad now */
 	u32	sink_pad_mask;
+	bool	has_phy: 1;
 };
 
 struct dw_mipi_tstif {
@@ -56,6 +58,8 @@ struct dw_mipi_csi2_dev {
 	struct clk_bulk_data		*clks;
 	int				num_clks;
 
+	struct phy			*phy;
+
 	struct v4l2_subdev		*remote;
 	unsigned int			remote_pad;
 	unsigned short			data_lanes;

-- 
2.34.1


