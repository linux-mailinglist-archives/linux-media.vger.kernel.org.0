Return-Path: <linux-media+bounces-29683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDE5A817F3
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 939321B686EF
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E873D2571AA;
	Tue,  8 Apr 2025 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cOrYo/4J"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E05D256C8C;
	Tue,  8 Apr 2025 21:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149260; cv=fail; b=to/5ix1s/noEMEPE7ZXRcZysj0F2UEpD2GTmiqenCTirJ3HqNSRFugZluWYBGOCpgDiD/213ChOohpYoor4HD4vTxT4wlRWFVoUKzR3iHKPO+g7pbCP5X18oWSYjOZp0iZ87dFQkUK1qZhHUPBWxwkvBKR/3HkqWJLexsDyQ+HM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149260; c=relaxed/simple;
	bh=IkEAaXIvaucb1utJPWn/OOEay3TWubA/0duLEbKaCEs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jveIoklAsVCMY+UhR/bEXvFPRVf5/7K0MfqhaNpPPxAusFSMKo8X3kvFeM/tYKBzqpVjdtMEQEs3Lkt/BuEbLuBZFT5spMjwAA7Yn/uitRoNIyxMBDltyCktLwLFDsM+LDAgjhj8omjcCAvXPwZTWwnP3DOFmfhPR7eSu4JqOmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cOrYo/4J; arc=fail smtp.client-ip=40.107.22.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARLqkb2HdxZFbEM1+miFvVBpS/8CVq56LfqHGPqhf/+o9uX0owVLWARNuA5gUduoNL6hySaCEa/nb9FTQhYmNXQ8KWKVAdubii9TY8xJu97MVVR/hBMqB2yyZp/1zZWvfp9ZwzbL/gMsmp1y9WV9bDUOVgLP7YB87U6c/VCW1jwanGvN85ThSyqFoqDi8dhtxJMnrJsQCaZhkvTZYm+pfGlftQbqqHN6cSzzCAXhuWl39V/w/XOWGyx/DJVB9HeVoWR9OmvKZyWnV8PL11wQwnbQCRUiDm4NAMazkVe20gWA6+PUsJjTow6GkjcHRlmYf8WhMEAuYrpgii5WBgMlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duyx0+ALz8gkTQnbJkTxbICnPUi5pZZGzoIPTth4aeQ=;
 b=Fdz+O95PTpZv6c67dBVfAcdT+EcB8GIzedYs1klP2ExHCIeOEBZWoY03N3CHOghsYPVogkZNy3PUY+3ZyX6HbtBc6EDmhFi3jvHMuoJ6N2HOSpiAf2HLjPU8wwhSqSbPtT9xCazoO6VuvpiEwsp0IkqDw4w1IZxAi0KmmHeLtjGSFQfkwmlbkWLYPe8IiBLmGEdZDRCxLHqtjdDSWZmH2vn+Z/vOLbM6hMJEGSUK2BgIQj9Zc1gORXxVbwyL4GtiaZ+r5yiZjaVi0GSneZAX6SjeOLcgeo2guTvy9vivtAlRQEu+HTBUznrDgVMQoNzjqmD5/m+L1MevoVTPDc1qSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duyx0+ALz8gkTQnbJkTxbICnPUi5pZZGzoIPTth4aeQ=;
 b=cOrYo/4JMYdV3pyeZYWoLzWd+Gx38Z5BJovSMDu/OK7fb1k8Yhj0bA3yj3LciiFrMTmadHKIntAyXChWAqHZM7ZBjzydUH+RDPNhYzFlA3jBjQscGeEYjdwDxQJkp/3L/NiDwE0RQqe2u5O2RYyqYAzADDVwP5+yzTEj5pOZDUYPgyd7VEnq8oN7CYfYDF41eudB2TLIV//JwdM3g1Y6Q4QvZlcwsjzViAHjtIll/9F3Z6WmMjd+1UzSJbqvyUPcNcjIFBdGblHekENI1hQrMbp9NeezEd15fWQnI1wuEKSOa9VeHib5etnvHoHVyE9CIpv6dTbFCoVVtFO4aeGl5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:54:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:54:14 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:53:03 -0400
Subject: [PATCH v4 05/13] media: nxp: imx8-isi: Remove redundant check for
 dma_set_mask_and_coherent()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-5-ef695f1b47c4@nxp.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
In-Reply-To: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=1059;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=IkEAaXIvaucb1utJPWn/OOEay3TWubA/0duLEbKaCEs=;
 b=Tabdn1ToWSVawSrC3OxWTdZ3DtSLV+/xNeRpF6qUjuMlus42kRlJZu61qnC53bKS9kT1U32/f
 rXXa3tafdiFAkVT3jolbDqHNjI1N5ZqrLfxQ9kNCCnA8bCX+Z/8/VRG
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:510:2da::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3d79c9-6f09-4784-fce4-08dd76e7e731
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZmhLUGxwOG5SUnU2c1ZVSXU2UGF4YXdoa1FZVG5ydDlIRlQ1dUthYlVXSThQ?=
 =?utf-8?B?N1Bmank2dUxKcE0yV2c0Ulh5TTlFbzkrVTZ0eFNFMUl2RzdVZmFyZ0lmQWRq?=
 =?utf-8?B?bTdidFRlNnlRNnN4VUp4a29vZmZyd1d3MndSblQ0OXVBSW1OZU9oODJKYzN6?=
 =?utf-8?B?QXAzK0Uzc3cyYXFpMEpOaVM0YXZJK1duVkJqUmJGdkVIcWJWK2JrQldPS2Fj?=
 =?utf-8?B?Q0hDYVc2bzlSM2xxSmQ3TFV1blVLYTE2K1VzY2lheGt3T3JzS0pSQjhtalpn?=
 =?utf-8?B?NWtXZy9lM0orZkFNMThNazU4ZlRXTGQ3ajMwNWxSdXB1Q2pEWXJHRVFIQUx1?=
 =?utf-8?B?RnozT0xYK3BqbllncFhBVnFCK1V1YXJqY0IzeWZsbzlmMCtXVGc1R2FrZk9u?=
 =?utf-8?B?S25OU1VCTHUzc1N1SXFKTU55WWhDeTkvbVUzYXhnNWc5QjlhdldYd1luTWxU?=
 =?utf-8?B?UzBSRTd3MlJ1YVQ4MWx1bVNHSVI3QlJWbzV5Y2JGc1FEZUNoZUpiOVdyQXRr?=
 =?utf-8?B?TnpVR3hVdVhKZDhLU3ZjSU1jMHE3MVp2RzJhZzhBcXBKQmV0Q0x2UHFzZmQz?=
 =?utf-8?B?SDJNaDRBSGV0SXVuNVV0YXY4L3ZjUlNBVEd2dTZSQmtnK0dBUHlkaFhBLyth?=
 =?utf-8?B?dm0zK3p4NXRxWUlkenA2eGs5TjI3NW9UUUh5eEprVVdNbGhYeHIxWllKRmt5?=
 =?utf-8?B?dnkwbUwxTllUK3pubHpNSCtvSUZ2Z25BYTNScHd3ZHAzRmlkU01ndXZ6QVRK?=
 =?utf-8?B?RktFSU1RQWFBMXk3UFFVQXJsT3lJRUZ5blNrenM4N1JRQmFTRnJkWXh3b1dq?=
 =?utf-8?B?T1U5Z1pTQ1BlQjlsTWpwanZPUEtpRFI1SkRxbFdmTkFOZzZuVTBCWlJZQ3BT?=
 =?utf-8?B?VkdpSDZPWWYxaElEK2pDVDA5QkV6ZTRJTjR2V0k3YXRBRDFuS3kyN0wyRUtY?=
 =?utf-8?B?NGJTZGc4cCs3MWxBSTVLWUtoY3hiVzE5bVVLalJDVUV2ZTFhVVk3djc2a0Rw?=
 =?utf-8?B?RE5EZUtPMmsveG1zT2EzVGhJRGtZTEFlVTR0c29hYm1BU0RwbUtjdThQb1A0?=
 =?utf-8?B?M1Q4MXVzU1RXdHRKNU1za0o3Y05tTHZreUZCaVQvTTVlUTlYS2JTeFlvMEY2?=
 =?utf-8?B?MTJmZDhmenc3aC9McWxSWVM2RnNFMVY5NUY3UWVSV3l0YU5vNUEzSmN5MVEv?=
 =?utf-8?B?L2czNjRrSEtkaGpoRHo1K1lsVlRZWGZWWGY1VEZ3Vks4eE8rVXJPY1VFTHdx?=
 =?utf-8?B?YjkyREV1eDVQS1BLNEdDTDJFOTIxY2ZPT1p5OWFxT201QWJCdmJHdUw1dEV6?=
 =?utf-8?B?UTREMkVERGp5c1IyQ3JEQ2pIT3ZlVHc1Ri9hLzh1VnZxSXNKSCtNd0ZqT0FF?=
 =?utf-8?B?RG5JQ2pJclhHelNVWVNyclpYVE9aclJSV2NON3BLdWpxWmtHaHpDd1hIam5B?=
 =?utf-8?B?R0lnajNVZ3llUDNBU3BHZkdhdGpDRjFMajVORDViNDd2Y3dHRmx0b01PMkZE?=
 =?utf-8?B?N0VaUWkzRGlxWGk2Y2NyRkhMdGJiTjRuNUxrNVVlVXAxL0JqSnZKbEZ4SEhk?=
 =?utf-8?B?RmxWT3Izeml6TSt0R0tYRUw1SVZGTVFyUEEweVh5dXZqa2lmeEpPRTExZmFV?=
 =?utf-8?B?WXRJT1c4bmhWWG0ydGxtZ0YxcEdZVEU3c21mUmE2RGFWS1VoWHdFOVJ6RExL?=
 =?utf-8?B?UmtKRVBxTEJIRXE5U2dONkE3UGlmb0NXMGwzMVBraWt0aENvMlF0WTNjQjZJ?=
 =?utf-8?B?cVprMHhvMUhONkFiUk1NTTlZU1g2eFl3RVpPY2hINDRTZTkwcVhDQjg3R1Z4?=
 =?utf-8?B?YXl0ZTFGV084S2dLckExcFFQUDdqa0YzSk5ybjNFSmVRRUdMdVBuT01DMFJZ?=
 =?utf-8?B?NmFrNTByY3pONmkyeHBJb2NUelhNR3c1QjBvKyttTnhwZjFTTFpkQXZsNjRJ?=
 =?utf-8?B?WjcxeTFQWmF5TzhlK0JBcWdMaGRZdThjVFZtMjY1QjlxSTlzL2ZTRTAxMHF4?=
 =?utf-8?B?bUpMZWM4VzBRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eGNJN1loTDZ6cTBvUHRRK05HbFhWWEV1M0VHbTJhTnNac3dzbWs4Nm5WNzVS?=
 =?utf-8?B?U1I3VHVFRWpuaXNjaDlkOC9BMjF4QWw2dnhKSmtPZzdldmdEcHo4U1FpdEtR?=
 =?utf-8?B?ZGhHRFhNWFhVK1VxOVduWHczdzh1SnlWWjRvVytUcDFqQlB5b2ZKTTc2NDVW?=
 =?utf-8?B?QkdFV3hXT3d4UGhrZE9yYWU3UmZTa29qVW1VMm5BeVB2OXRVaTBpanl4TXRQ?=
 =?utf-8?B?M2FOM2FOWmFQZ09jblRLVHVNb3o0d2VYQjg1Sm5sYWtVMFQvbC9PQlVYRnha?=
 =?utf-8?B?bGluT1ZZU3hLSVBWRHF6dExZOU13aTRUdGFwYnd4RkRlZnh0SjdqMnlWdWEw?=
 =?utf-8?B?WjQ2d0MvdnNjUldsL1U4RTIxd0VrZ1M5Ylpnai9MVjl5UjVGR2YxdFJ6SkNH?=
 =?utf-8?B?VTMxdjBLc0pWOWU4R29VWkxlZkRWRjRtUVpOREl3eEphdVNHTXZzeDcxeUU0?=
 =?utf-8?B?dWE3eXFJbWlMOGJlc1dZS2xOWm5JaDh6LzlrYjZwc3lSREFzZ0xRWTZNZk5y?=
 =?utf-8?B?NTRrd3JTQTF3RE5XRVRUVEI5RDZJNXNZOEtZWEgyNzdRampNd051TjcrT1RH?=
 =?utf-8?B?cDAzbEk5dXdMZHlvdFZqRGxBZDMyT0NHMk84UE8wVUFJYTM4Rm9CYTJuU3N0?=
 =?utf-8?B?ZU40eW5GUUwzL0l5SHdPaStQcmFmd1U5TW1td1RyaVF5cTdkSkxHU1F4eTdz?=
 =?utf-8?B?ZjU3Tzc4elhMSlhhZE9GaU55dDA4SHZXYXk5eFl1WTZ0d0Z0bzBCaTdkdGs4?=
 =?utf-8?B?L2RpcnVRZklKZW5lQmlvM1lxNTFCbHFIdEhCdUFxZzlZd2MwQXdFVlNqcUtm?=
 =?utf-8?B?VVdjYituTjltN05VcERxSWNPV3FmL2NXelZpWVBnSk1xTk84TXVsaFZiVHBX?=
 =?utf-8?B?WHNoS3V5SlFrU3Q5ZmhIT3djQTE4cVNrMHpDWFIvajFlMnE4V1VQNEVoWVE5?=
 =?utf-8?B?TkJsbjFiMjVGYmlUeTdCV3pyTUZWZ3NmZWdKb21kNWtzbTczWVVUYjFHUFIv?=
 =?utf-8?B?czZNODkvZTJJdWZKcThCdzBrOUZEU3hkZ3ppY2tUTFlVQ3h1UVBVM2N5TnE3?=
 =?utf-8?B?VVU4ak1QVVpKVzZlMmVzbW5SSnZ5OVlsT20vMHV3UXRtK3Rvc0d1ZXdXT0w3?=
 =?utf-8?B?YWZjQ3ZtNm5YaEVCQ01vUXJxRDlnT2hEcnB5ZWtzeDdnQ2VvakJ5Yk1YM0pW?=
 =?utf-8?B?WnhTb0tDczFZM25VYmFkUW1IL0hBQjFNYmdZWURRMWVldVF5Z3h0UFkvekZa?=
 =?utf-8?B?VTNWMEZCOTExUWZoUnNwUktGY1dnVEE2ZUpZTUlIMlN4SjAyV3d0KzZwMFIy?=
 =?utf-8?B?NHByMC9wN210a2tLV2FRVGNDZTFtRXE1aGoyZk5rdDFkYS9Rd0VYc2lML1M4?=
 =?utf-8?B?TkRuZkgvT0xmWEJ6MFVPQ2pCN2FSRmlpRUhkQkhCZHJMTk8xdHhjR2lzWlJa?=
 =?utf-8?B?dWZXNk5nNjZoYktmU0k2QVhsT2E2Vys2T1lvNU1lcnRGeDhQUjVwdVNjQlcz?=
 =?utf-8?B?N0FUbGxsUVk0LzE1Mmh0TGZWZExHWkVEcWZJMlB3Ny9wcnoxNG5UUGFWelNJ?=
 =?utf-8?B?czVVeDFwcHRnKzNCSHdTZTFxelRHNXZFRzBYWjJTV0dUVFZXQU82SWlvcWtk?=
 =?utf-8?B?eS9RL3lld3dha2VTdmdPczNveVdQcWkrK1QxUWpFMHJoTXBYSkF6UzFhS3VK?=
 =?utf-8?B?VGpRR3JEMEFPa1E4eU9oZ0FOU09Hb3piMzd4bVRxRTh3Nm9CVFg3N21KdENi?=
 =?utf-8?B?ZkdOanFCaFdWQ3RTZXRrQVlHYjV6OWlpZklXVlFYcW1QRXFkYVl3dVZZbUd3?=
 =?utf-8?B?K21Remd1RG9EWXB1WWNTYjFHSTlQZVJpWFBtemN2OUx2VlNVT3ZEcEhEbDRS?=
 =?utf-8?B?Q2JkNGNvTGREWnZ2NlVjN2lUMmVOenVQTE1TU0dUWnFpTVpSSlpNci9DVDlR?=
 =?utf-8?B?UmFtMVlXbnZVSXNjN1BnR2s1T3JyWEtxcHBBb09hMlJSRyt4WVM1eXE3ZU0z?=
 =?utf-8?B?d3RLV1dNTGNBTlhmU01EYkZRaDlKV0RkVzI1a1JVZTQrczlyLzZNQm9Fdndk?=
 =?utf-8?B?L2lFLy8renNaTFZYcWJ1RzBmWWNlelNyWjgwZUJ1Mk94ZHh5bXhRNmVxY3Qy?=
 =?utf-8?Q?jJJQor2FqJathUVuXSSibw4KY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3d79c9-6f09-4784-fce4-08dd76e7e731
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:54:14.6704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H781xgVTqk22X2WXE0l7o4I0xsoGc6FrGIOi8ydj+evIuoX7QUSVWZwzYPWbopTAKpHK5GMFyJZUy4pwil/35w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

dma_set_mask_and_coherent() never return failure when mask bigger than
32bit.

See commit f7ae20f2fc4e ("docs: dma: correct dma_set_mask() sample code")

So remove return value check for dma_set_mask_and_coherent().

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 015350c6f2784..073ea5912de3b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -444,11 +444,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	}
 
 	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
-	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
-	if (ret) {
-		dev_err(dev, "failed to set DMA mask\n");
-		return ret;
-	}
+	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
 
 	pm_runtime_enable(dev);
 

-- 
2.34.1


