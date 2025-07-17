Return-Path: <linux-media+bounces-37947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78456B08648
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 188CB175F85
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 07:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CC021D5A9;
	Thu, 17 Jul 2025 07:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mxkmMKFP"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012005.outbound.protection.outlook.com [52.101.71.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B21B21CC58;
	Thu, 17 Jul 2025 07:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752736325; cv=fail; b=K/6stFMupQPTRl30pjsTseTIrE5gucVLkgjd9/jsxaGgLMzkqtY+53oTe79W773RaasBHyMTC7SjfrG+24ywAFoEVQR/peHPlEn74/CXIXHx5hVYK9q9WqQaRSsTQUOrWqt016HlOyrk5BUq2f5n2bPP32HB394EnRHc7kuNLUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752736325; c=relaxed/simple;
	bh=sGLXp4rCK+VWVGiC6CkGdpQgOo2WBwcWlpc8qkOXr/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SkzMwO1IBqIjhAC9Wlq0K2B+emhCuCB005x2BJmIk4Lev+QPns6LIm+2N9MX/0qjJId7WcrCPwRLzQYr9dq762BiTM1HKHXcooSuIEMvqf+TLHrJWlT3wVbjPMn3G1e4ikdFMCcsmMkbN3UKWsJ2d3pLAuJM0w70xY3EeldxaYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mxkmMKFP; arc=fail smtp.client-ip=52.101.71.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZVbX+BB5lvOJOCu37VdUcPbrLFd1tt9RBEScDKRFtJ0iQ8KxescaZAci5iYry2rLNfsGnU3vOCmxcu1bCFeMo+LV08A2zbwpL99KUMKioNSkdHrdze1lFFGJPqrXys5BtUjXYXgxYBF3ZJp0Ai1D1u/Fg+mMQTAtpQAWJ83m2ZkEGOX83+nfkvzdwpUI3+bIvsF82cWnlMqZP+Je/SREbXDBEAdgeXF6EQHErvFKkhchyxWixCMd2Hdm5QcNCKpNgy7rm7SnPq2hYeeSN+hR/gOUPDiIHESd1Idx1pglCby0skIDa1DvScIcavNJMPFPKWuo54oZbQ55WbExuvPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qniXkn6x2md8veSXoksbwOnsXkaX1w1Hm7pK5nOeRIA=;
 b=Zeld5I32UmL2RGEmp5WQeZ4QjaEzlNtEpqYi8rbzgis/1K/Kw8lhi/cRMgIYUq/fAOuuhFFYGew++Uek1itzXWAsLCOJtJ1fQUeKp66nahQZWneaIon0l4gt61Z+tYtpazj2lt4oy2GraOStYOyGyl52QKT0lz32IN6TLSLMszb/j9ovZJt5zqOIAWXpbQgvBH0jEBA/AHlbk6xdIiPW4uP3Mr0IUpeuQy7ySTTlTolLBCZlG8tN6u09j+axBk0sSRNLZwIcQGyn4ng3Cbt4EOnA6RFAiuxmM6IqdneWfvAZB2DgG8aLjH50t8ZQqspmjilEamhM8RyTuJVM4NF+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qniXkn6x2md8veSXoksbwOnsXkaX1w1Hm7pK5nOeRIA=;
 b=mxkmMKFPS4lnGLzn0X6AuLuXx3bhfsVgD8WQ/BTSHK+I/FzHwY5ClcSdIGV1CWdClOcvSWzD/1TJUmCKsBitihRxsG/taR89lnU/CLPRTSbl7ooAgDgGJ/RNqSnIq54nAekSr4FCj4s5Qb2Hw2zsSQZiqcf8aQ921e7nI+oZ6FrlZNfSswcz1MXM3+6fvZtZjvMBxl87oHqp1nBPa6RtYqjUDYWHSAKoRKwluKJe051eQdwnZS4CBrKslnEpDm+tP8Qy+8uNV46Ku2kLNX0wuaDaSMxOhAxeRZwg4ZSphGB+0JkmbtbnPvcAnp97t/4qM2YjWsWr9w6swmsPOESNWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB6942.eurprd04.prod.outlook.com (2603:10a6:803:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 07:11:59 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%2]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 07:11:59 +0000
From: guoniu.zhou@oss.nxp.com
To: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm
Cc: mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: imx8mq-mipi-csi2: Add RGB format support
Date: Thu, 17 Jul 2025 15:13:58 +0800
Message-Id: <20250717071359.1910515-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717071359.1910515-1-guoniu.zhou@oss.nxp.com>
References: <20250717071359.1910515-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bf36de-cc62-4bae-a182-08ddc5013899
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?blRQSDd2eGpIb0dkN2FxZjRIcVJwVUJ3UDlXK2RFaExSSHdGbVZpWmJXVFlw?=
 =?utf-8?B?WStQTGk1cmptS2NWbitpVWxvb3dyMWRGN1BtTUhuZXRRcGFJRTNrZThlcFBp?=
 =?utf-8?B?TlB3WlJkNG1wbWk1Ukg2UTBFaWRKdFB5SGJWUWJHZU42RVZsREFBTkZlaE1D?=
 =?utf-8?B?dXhueGNXY2hTQmt3clc3WXpBTDJzaWFEMlIyMTlCaWUyM1hXVVRkMTVTY1F1?=
 =?utf-8?B?V28zSWFuYml2MHFYeGZrRHJBZDB3ZkFmOHZvYnJqbHRsQi9nb21QeU5pUjZF?=
 =?utf-8?B?OFhHdFpGc2pqWmZ5VGJEaGc5VjVleDBZSWxMUU9kQ1BOS05lbURKdnU4QUxx?=
 =?utf-8?B?N1NORWNXa1huTjk2Mkkybk9wWmdIU0VJMzFZUklYdE1SSVZxK0o3QmhrY1pW?=
 =?utf-8?B?d0ZLY2JrZHJZSFAwbVFHRStDOEN6Z2RkZVpxWmoyVmFpTUpjckpkeDQvajls?=
 =?utf-8?B?NFJTL3orWTB1ek51WWhUWXpHNUhPZTRZVE94S0RVdVJSZ0hraXFFQ1ZPUng3?=
 =?utf-8?B?bC8rMExkSnVuZm9ETm1MOGVGUUdYenFEWGhvZGFhZlpnbUdJOSswZ3Z3eDc2?=
 =?utf-8?B?Sk4xT2RXVldIL01STTlHTlI1bzhZeWhUSWVLaDJoaFEvTUR5Q3IxSTFJTm1y?=
 =?utf-8?B?Z21ZM0h5S24vRlgrT0Q3cytxcEFCam82VWNwajZic2h2YkY2cS8wSFZ4eTdK?=
 =?utf-8?B?Sk5iYzRWOWFIQ296bVR2WHFraXA1eGM1YlJLOERDWGhZSHo4eVY4alV4aDMz?=
 =?utf-8?B?MUxRTS9nTGdKZEVjRjJTYzRaa1cvZnAxMHMwbXVNUmxSdFBmVDJmYnBzSDA2?=
 =?utf-8?B?RFYxZStXRnFpeTNFQWtLaGs1YmN5SlFpRUgxRzEva0VQS0JqR2pLbko1RjlS?=
 =?utf-8?B?N1ZWNDI1SDlvTVpWS2pXbnpqWmVmeUFycG5GejhvaFExeE4xcy9TTWZlUzlZ?=
 =?utf-8?B?ai9EalIxQkxENVBXeCtoUC8zNVdIWnRMYTVVUjU4cEdLTENrV3dqVG1icnJt?=
 =?utf-8?B?R3kxUFE2Sy9TTkEya3UzcFJnbWNjZHpGZDNVRTdHT1dCWHoxNnB4NjRzSVUx?=
 =?utf-8?B?Y1ArSmErbzh5cmpPdGlrOVZIWHJkMS9BMEdDdndvN29aWERxR0F2cERvOUZT?=
 =?utf-8?B?MjBUai82Q3RtRnF6UWNMNENpZWFpbE9LQVBwQmtIZVhKTFFIRVp3WFMxZ0V5?=
 =?utf-8?B?a3hnMEdKM0JMc3ZZQWF3VnVTVGpta2E2SSt5M2xBdXBaVWx2NzdRK1hkemZ2?=
 =?utf-8?B?V3A3dmVTTGtsMEY4MEY2TlZLV2JQTDM2ZDZya3hHRWpFVGRWU3pRQVVkeVBq?=
 =?utf-8?B?b3NwSFFpclpRcnZmZkQyTzROaGdleTAwT0kySmRDWTFOTjZFcVZ2VFJIdHJF?=
 =?utf-8?B?c2w1d2lYQXhTbDNXMjc3UGhNUTE2WDBqOURaOGdvNVBKZ3l2Z1dDVDQwOGcw?=
 =?utf-8?B?TW9PdHQ4cTRLdE44dFBZNm5XNTQ4YndhM3I1VGwyaVNheHRCbjh3OFh4cWhL?=
 =?utf-8?B?ZDNGSlhVZlhCd09UdHhvN25PTS8xSjVtUjdRRmVkc1NkTkdTQ0tmdjdNTzQ1?=
 =?utf-8?B?OFVJa1ZPcjBGN3h6b2pHRjloYi90NnZDTXlIdng0cTRuaDlKRGNEWkEvTmdW?=
 =?utf-8?B?SWVSOElMMlAzZ25EWC9QbHJsMVJVakcwckI3Tng4dDViWitSOFh2NVdkeG1v?=
 =?utf-8?B?ZW1Kb3g1UlBvTnU0Z0hjU2NtQjdpMlUzaFhlSjhkRFJ4MnU3T1NuV3RuWFA3?=
 =?utf-8?B?WnI5NzRuQ09pLzhYQWZpdVAzRHZoajMyT1FPRUdERm00WXZyMW9hREhBZ2Yr?=
 =?utf-8?B?SkVXQTZVcDNjNGJ0Yi94OW1qbnZBQ1JVSWM2Qy94d3F2b01CRTFTa0k4V3FU?=
 =?utf-8?B?TWZEeXN2U0d1bFE4NlVTQSt1N01jRnB5Qk9yeW9ianB3dGRralV6emV1UFZy?=
 =?utf-8?B?NGRrRlFsbEVKOWRtcHhhUWh6ZUQ5dGlvWHFTOUs3S3Y1VXZNZUxRNXE5Nkhh?=
 =?utf-8?B?cjk1R3hIUW5BPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RDFPNDJUaVZIVVZzY1JmdFhRK040emhWQTZGMFNaSXdyb0dPN2YxQkVsbGIw?=
 =?utf-8?B?VXRJeXYxcGsvS1dOcHF3aC96eHUvcmkvZ0w0K2dTZUw3N2xVdzZJN2NBWW9z?=
 =?utf-8?B?OE8wek9XMXdWSTRJOWdwalNKK2k3QWFUY0w2NEFrZW80cXVrUVhYWlVsbS92?=
 =?utf-8?B?RVNyUUg5ZHZaNWprNExrMWZKcnBXN1kyVmJSc3hJYS8yaUh6N24xMnd2K2xC?=
 =?utf-8?B?SUlueUhHck5wb2JZbzV5aURJSnBIamNabGQrOW84R1JVbXZpaVErUGN4UHRX?=
 =?utf-8?B?YzRjSUZqbG1XTHRYb0llSFp2ZDY2QkJHRDlmUDN3SlBPNnlBUmY4ajArOTVy?=
 =?utf-8?B?RGo4blNFTnJFSE13ZGJ1d0R1cGcrM1NvVUhRb0NoQnFvampGM09xVS9VVXRP?=
 =?utf-8?B?UE1HZTB3WDlqSkxnTmxDbXN6OElqTExzelBzMU84ek1sMEVqMUdHN2NaZStE?=
 =?utf-8?B?cnRQbTlyOExIaWF2SnllK2lxdkp5Vlc1YnFLMXRRaFBOelZTd2M5RVMzazBN?=
 =?utf-8?B?WiswVnRtVHBHblMxNDFhSU5SS2xaM2tRZkVTQyt2RkZCTndlMXVBOGJXend4?=
 =?utf-8?B?c1hwT0tLa01XaDZZLzJHU09GUTVxUTVtVDJYNUNFNzVKeERodzdCS3g0KzRk?=
 =?utf-8?B?cWcvWjMycG5rdnhCQnFpWTVpbm1Fd1FPdTRJZ2szN0h2blpVNGRlU1ltRnZJ?=
 =?utf-8?B?ZWU1RFNDbVEwWSt0Y2pzdHJib0FIRTNqS1dWV0xCWjY0d2cyNzFMM3lIY2Jl?=
 =?utf-8?B?aVJjcFJmQW16UkUvc21NellGZWQrQUFIR1BtUTFlV3JPY3g3Y3JUTk9COVoy?=
 =?utf-8?B?Y1NEWlZ3bWZ3ME5FSmx2OUxaaVBrL2VjMFFTRDVJNXpEM25CNzltanBXY05v?=
 =?utf-8?B?NEtWTmVoOVlYOS9kbjFBTk5SejB6Z1U0ek1Ic1FQaWo2S0MzSWRFbk0xdmtB?=
 =?utf-8?B?SC9SMTBtVVJsRUdETU1NcEo0OGlJTVlUdk5MOVRUQUpPVFV3QmZwVStsRkNv?=
 =?utf-8?B?K0NUOWxkQ1FwQjAvWENHS1pGUzlCelRyTDg3SitMNElTSUh3Rk56dy85ZGxm?=
 =?utf-8?B?MnBWZXpUR2lOU0pBQVlFbmJ5OWcyU2NjNmN3S2tLOEs1VDJ4R2RoVEthU2NW?=
 =?utf-8?B?L2VMYlNjVFV1T0pSVjBxYkhQQmJ5dnA0cTBmK2xEL3NUYzhRS1NoVnZzVzZG?=
 =?utf-8?B?QzJpSHpHSWhiYlNRMFNpakl1Z2Z4NWxsUlg1dzJLSXlwQVV6aTRPNEhpRXBx?=
 =?utf-8?B?WktMNGxuUHJFZWZoZ0d6Mmx2T2M1V2JzMDlTYTdJMEhaL0t3Sm1WR0prSTEr?=
 =?utf-8?B?YU9WUTFYUGtnaWNRZFVYRnFkTWpLYXRCNTFSekJaRTBsc21IQ1IzL0JZNFNE?=
 =?utf-8?B?Z1NBZ0NYOCs4OWdjeXV5SVA4K0cyNkoyZ3pjTktBalVtL2piZTRjdWd0eUoy?=
 =?utf-8?B?Z0t3UnZ5N1ZzSlovMzJZdXQrcHkxZG5pZit4SC94b1ZXTEFNL2gvZk1SeEtS?=
 =?utf-8?B?MzhmN1N1SHdNclJTYUVXRWFWaFViSFdOSEkzZi92RkhpTUlWU2x4VjJINFFZ?=
 =?utf-8?B?UFhEb0p1aEMvbHlYUlZiWHJZc213QVNtWEplL2RycmZsWWhWekNzNE9MTVAz?=
 =?utf-8?B?c2gwQVhnZGVhZlY0cEU2RG9NdStzdkhNYTZnSzFERDdMWVU5V240ZDVhZzZ6?=
 =?utf-8?B?VmxSb21SQkVzd29kU2UwZzFDa3UwQUxWaXI0L01USW1ERUkzUlRlVEpRdVBt?=
 =?utf-8?B?TTRmWkt3MTdzdXk3MmMyMkt3R0xjQmRmdkt0RjIrSzVmSmRqR1drWFBUcUJM?=
 =?utf-8?B?bE1CNVJXaXNIQ09XbGUvQ2lLWXlRai8yeEdMaDQ1c2ZaS3ZxUnJRWWNseGU5?=
 =?utf-8?B?T1FvcnpYa1l2VXBZdk8yZEVhVHJsWlc3UU0vU0xncnkwZnQwRHpGL2VHUGl2?=
 =?utf-8?B?QzFvZ05LVGZjaWZ2Sk5xekRBUUt6NGxNVjZpWTVCS2E0elYwaFlCSW9hWTBD?=
 =?utf-8?B?bXo5cWtaVGFqK2IyRkRWS28reWt2RHRjN0Q2SDRQUjk1SlhNNkVwS3dBTTNN?=
 =?utf-8?B?aitZYmZJZHZQWjNSTVEwYTNPVDZIM2dvVXZhWTBWbG1VcW8rSEdKSmc4L0x3?=
 =?utf-8?Q?bCkZe6fc1IzeDx/2CtFQI8vP+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bf36de-cc62-4bae-a182-08ddc5013899
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 07:11:59.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZEW7gwvZCLzqrZXdS0MJw3uiAFxblQIB5kO2K100cDmA4adMEtKdD4TmuL58ENuqDo9TVrZZmQD2KPGNPCCXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6942

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Add format RGB565 and RGB24 support.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 7495400adc22..3de9007ad122 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -348,6 +348,16 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.data_type = MIPI_CSI2_DT_YUV422_8B,
 		.width = 16,
+	},
+	/* RGB formats. */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+		.data_type = MIPI_CSI2_DT_RGB565,
+		.width = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+		.width = 24,
 	}
 };
 
-- 
2.34.1


