Return-Path: <linux-media+bounces-48304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD74CA6DC5
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 10:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93C12300E82C
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 09:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51413168F5;
	Fri,  5 Dec 2025 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EHmUJjE3"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3FC314B69;
	Fri,  5 Dec 2025 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925664; cv=fail; b=uWBeCUHgaSYdfhnluBN1aHSfXhnZnC2Po3eAtIndVymbbf0VpcnW8Ov4yOCdW7E/TGMrDY+d1Gaulj8q7sULzeykebMxPDD27vpqUZzp6iKOQap1+WKO0PYWtra19NcOesYmBBd4e7SSPJbrgQxD+qMzs7HK51yVrL03rXi8u10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925664; c=relaxed/simple;
	bh=2CimTnz1Nd3csVvlCKC8T1GEFkaFhxB5icEMykgw2AE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YbECbJwMjoMPyuxCDwa1uSjaq6GufRYeNJrJKSQRCap4MWA7gd9qQ5ChKXi4vu0SWGjO9fBLCWeomNl8Gf4uYJ57XSu2mP18yXWcG8sOkavcYivgZQKVaUOmUP7WWDllXIccrbEdw+WPoecpFy9EDAv8o597YNZ4EPXdKiq8XVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EHmUJjE3; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHBY408HZRPDYf8G43K2aZdhmM5kcDfvvrINAPM/MD3xKxf64Jc8t5tb9nkroZPJxXCefffIr4rqyAJ/8G6u6yKO/DV1brxM+JUY4Orxe6SVC9DjP2Xo9kU6+Zs+y2xczYKbzTieH/IRjgwEKL0+HfhG326+VjXfrIbNKj/NDP+JJ+G2t4k1QvE/tfI59EjHt49lb7tcNHo0DWo7D28QhRKTbqGWfw/kc9KTRT/7Tp99dvP7WLG5r1/3wm19mp8MqYanyET2scgv/x+AG0OnVdaiMCt6XzAk2stlD7yo2EMzDIHtoD8zjYLumOKRXaqU3mG51KcdBiCObBpRJKHvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCB66I/F3mFfDiW112Et9MaOWRJnddQU3vxOshI5ouM=;
 b=IUIfuQPBFWoxQmi2lnyNVM9PxXt9YpGzhiSkRxYRamvklm6q/95NiRRBgW/l2D1MMJ4CAtFNdZmoMFpmJ5/zpmw70zYMCe7ws4MyMcS/nAeO0bq6xqU9Mz2uIWcndf3wjlUfmRosIRs2VWoUZMQazoyWY/v0bzBrpshpkqRzBQvXJOA2sATKRSqVWiXHurkWl7T86xeHY7UhhRh7dIBtfqQ0vl47AP32mVG/KTifhcDMqHbyWheaA6zQ4vHzSiKyytn/OF3pwjHF770WqJG8JM84Yh8sUaHxa/kfdA/bVdlsdJZDXkkIfqPO7Jk158YkCKaF8DgWdihuzQpCMA9Csg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCB66I/F3mFfDiW112Et9MaOWRJnddQU3vxOshI5ouM=;
 b=EHmUJjE3ghVaH1zQpZBO6Ou9FczjSmEEIRjauNfV5MNq5ULZHvbnPgxPCfP0WTdrAPuQDI3wlvB3+UGw79pHmabsZkWN1ij1oQxxiNacNrkDKiWbFua7Go3cfQw5+gM7xbA8BFVTZDzyLX7ENqStuZUrvjXYYkWHJhG9vRsoG+x72Ch+jOCZ80+y7JP79WgMVrbocj5YilZbYzS2f82e2KdmOlwWZM7UCy3I9Wl1cxjU3Tjtlhi/+FEvi60fHVlrVOkwdTTKm62yV4y71HD8GqOsS4i8Q4yTrDLcGBmHFyUwbbExvqpHprAcWmgaqz++RortZZ3KX31JjjAdAdW8zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB11042.eurprd04.prod.outlook.com (2603:10a6:150:21f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 09:07:12 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 09:07:12 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 05 Dec 2025 17:07:43 +0800
Subject: [PATCH v10 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-csi2_imx8ulp-v10-1-190cdadb20a3@nxp.com>
References: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
In-Reply-To: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764925695; l=3062;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=NP4K4kzXlsKcowmJJhTx1ZLEzcgAZm4BdbbBYySKyt0=;
 b=tZyaqJtgEnH/+fzJOEvVxcICEZ94+NCVHjsitweviJFnl60pNMpqRDHuJKeQ+aqsHXc+78wdz
 7u0XJ6sYbonCHbqCd29yvinfucOqeCONJ6zbm5D50bsCdyHwuhJK13R
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVXPR04MB11042:EE_
X-MS-Office365-Filtering-Correlation-Id: fb89090c-7f67-4fdf-40cc-08de33ddad5c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Sk0yaW5PYkR4UElaZ09pRHBxbEMzUDNaQ3lXRktIaDMrUjJ4R0tvV05rbDB0?=
 =?utf-8?B?a3B2VUxNRkhoQ0NJNkdFWFBMWEJad283ZDZZWUdTc1lNdUZ2RmxLNENPNkZ2?=
 =?utf-8?B?SEpVOEYzU1NscjJTNzE4NjJIK0l4RnA0TW9FYmpySm15MU1SdUFaSzh5NlZH?=
 =?utf-8?B?VTlXaDg5c3dibTZPM1BnUUliclBJbkp1WVlaalJqZVJjREdqSTlTSHBUWEJP?=
 =?utf-8?B?NkJzeENFcmsrQlg3WXJ1TmdqR2dMWWlsZHBzWkFkUExKeFUxR09JM0llRkVR?=
 =?utf-8?B?Nnl5UVIvMmZ0ZFJ4eUhLUS9WK3I4NS8rZkZ2UG5JZjBtZHlpaFFBbjRyWU9p?=
 =?utf-8?B?UGgyNEJtbWx1eHp6aHF6bUo5U3VHY0xwSkxIOFBqRHZOMHcwa0RWUkhTMk5V?=
 =?utf-8?B?ak1SbnRCUkg4ejYrOUlGbTBORWVOcTVQUWZSbFBvQVhSaDFlWTI3SGpPWHIr?=
 =?utf-8?B?MCtESVhqVzFBZnZMWm9qdWxhVmI3UnAzdm1GdThGZDROZ042QkZmZWNCMmVD?=
 =?utf-8?B?aHJtL0MrSHdOMmdnT0FFc1ZyelZGQ0o1K2FtYWllR1JPdUxXcVZZQTZkYXBa?=
 =?utf-8?B?VUs0Zk05R0hCclI1dG9EazRkamN0L21md2RsWnozcGRNNXlsSm5iMEorRld1?=
 =?utf-8?B?NVU5eWF6a3dzQ0NIelRrL2U3Q1BiTVhxdTF5WEpNYUxUL1ZhZExKZ3h3ODhI?=
 =?utf-8?B?WXBCQWExMnpnTUoxbjRkcko0bTVmZ3dzeHdOV3k5VGhXQWJQTXZINXd6WFN1?=
 =?utf-8?B?eitpbHB4cEJMUDdOeC8yWlZJNVpBeEVUQTl3WTdhbkNMUDRiVVFXdU9WR1JW?=
 =?utf-8?B?VUxHQk93eWYxcWN0T04wM1RoTkQrOVZCSS9GWDkvZ1JHNUFDUnFDL3hZU0sw?=
 =?utf-8?B?R29pVzRlOGVKZ3JVQmsvTjJ6REdwRC9odWpFdHVVdDRXU2NDUEU0eGhzZk1B?=
 =?utf-8?B?WlJYNWVrejE3OFNGQkhmSG1sZGFsZE80c3JNVm9hejlWdHlNNlBuelR3VHNZ?=
 =?utf-8?B?dHMxaC9Ec2wrcmVHeTJJUUFmSXNVTjdpMDFpMGdsQmJxOUtBSmRIT01wYUx0?=
 =?utf-8?B?MVRKNGwza251RlNtNXVFb2NCS0pDUXNVYlBVeEkrdStIN2lWUDcyYWUwY1U0?=
 =?utf-8?B?b2pZa2ViUXlGWEpjREtpNUpMRzgvbWxhMTNlTVUwemV0TnFVWWJpa2ZMbDdu?=
 =?utf-8?B?Z0RlTXBVVERFQ3JnbHRkdmdkZkdPOXpFM3pPL2YwVTRRR09UTXV6MzU3aEV5?=
 =?utf-8?B?SC9XQm9Hbm9BZmpWZHcrMEhzemZhczBzeUFSWnRTdDBqVDgyUFBuaVpQdjRI?=
 =?utf-8?B?UmdCYUJZcWk4b2h2R2ZsSmg5R2p1MEVZSnRVUjVRMDI5OEQ0RTJBQ0tSUU85?=
 =?utf-8?B?U09VTzhjZDBmM0VkT1F3aG8wZFVaampTYmRTWW93UlltbHJrb0xuSEJia2RX?=
 =?utf-8?B?NGVQQ3hEbmRReWZyclRsd2V1NHJWTkJBVmg1TEx4emcvZ1BDRTlRUjJockJM?=
 =?utf-8?B?eEwvRVduL0x2K0QvV3pKdjk4dWQvTWJjdEUwUml1UHh5N2V2NklHRWIwUE5G?=
 =?utf-8?B?bzdBRVVyUHlWcmdzM3RMTkg4dnhVVC9jOWZZNG16ZmgzUVNlRmhKSUtHcG5M?=
 =?utf-8?B?bW1vd1JXSWh0YklsM1h3RXp6ZnZtSGtLQlZKUmNRWFVUSCtOcmJoUXBDeWRs?=
 =?utf-8?B?SnJhZlAzZkZoSHhVdUlsczdXUmtOSHMvY1N6Ujcyc2RidkdJcmlJdlpTYjBP?=
 =?utf-8?B?amdYdUwrMDFmNHBsRDNtbDZBUHB5eDM4U1dpcmdtWmtrZEJPa1dGNWJWbU1L?=
 =?utf-8?B?a0FjZTBnVjl5SVZOK29NdmN0VjJMSGZrc0dyUDRRbWZsWnpuTGdtYk1zZGR5?=
 =?utf-8?B?Uzd1WGxIZ3ZFU1NPK29EUmhyWjdLVFBXWHpMM3p2QjNRcHpXbkxDZ0V4V1l0?=
 =?utf-8?B?a0xSc3ZNdnRETk00Z20wV2JSQlRSVm9Kc0VGR0pid3NtTTJrKy80dXVPVEpI?=
 =?utf-8?B?aWFOSExMSThZMXU3NExrdjZhdUZoclVrTWZtOFJxSkFaNFdkclAyWUkyZ0RN?=
 =?utf-8?B?KysyU0JqaFZRMytYZTg2bW1xRHBJOE9ucFVZQT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cnpWSkhrU282MVk0NWNaZjh1YmhBVnppbTh3a0g3YjRUVnc2SGhkajIwOEpZ?=
 =?utf-8?B?Y3BzUU8yQUtjTnppS3hNcVhGbVBNQkJHWks0aXp4NFNoNmsvbnl2YitEcEl4?=
 =?utf-8?B?dnBoQlExTjU1ZUVCeS8zRGRZOVFjWmFOV3JXU09SWFIva2tGWkxqZTlnZzVC?=
 =?utf-8?B?Zy94T2doK0ljdmNqRHpIdmpRK2FBRnRodU9FcTlDWlhmVWlXNDA1Mk1xTUNE?=
 =?utf-8?B?WTI1R2RqQi9IdHpHZmNocnZnQjM3VmM1MUxqdVdGRzVkR0FkUTEwUXRERFpj?=
 =?utf-8?B?aVUwRmxQQ0g2aDY4VElXWWY3d0NlTlltU3M0TzhEbUVIMkJoMGtQOHUyNzhV?=
 =?utf-8?B?bjNjR1JDQUViMmpSdGhGaWwxb2k3akhzY0pMcERCaXpMblBpZmJVQUhzMThK?=
 =?utf-8?B?VzluUjJLTXc2TkZDZ1BVSHpFMXUvWVJWYnFwWDRXc29yRnhqUG9hVzViZVNL?=
 =?utf-8?B?ODVBbjgyWFVWckR0TlIvdVYvemV5RGdnbmt0d2wxdjBvQ3hYY3NEQUxrK0R2?=
 =?utf-8?B?eDJhYUg4OVJTTThHclozZVZnMW9hVktyWnp5RU1EZHcxOUZHKytGdCt1V2Vs?=
 =?utf-8?B?NnV6Ny9CcWx6MkltMHFCQXVZRVQzN0VrMVM3OFZjR3VyR0srQm9xam45dnRY?=
 =?utf-8?B?NHhMNUg0a3JGbGNLTUkxM3hIN3lrdUFjWDhLTEJXUHA2QjZKVTlnQkVObkFp?=
 =?utf-8?B?LzlkVnloMEJYcUlaT2NrdDRLL3RsVFRHWjBEUjV4bEtxYWJFN0dyS1FFMHNQ?=
 =?utf-8?B?Vmt5alVTUWNhVEgvWUhSTFpGNzQ3NFU5MkFrRGpYaXFRQnBRU3JDRVlodFFk?=
 =?utf-8?B?VkNMS3NlWjdVc3JHUVpKbkZmOVM0Qy84bE9ZTWtOT1hPRGJ2RlhBQXVJUFJa?=
 =?utf-8?B?MU9OTDRjOWpGUFZja2U4SjBUNWZ5WkRHSjVFUnAvOE1xVmdaMHd5bVUxOTg3?=
 =?utf-8?B?Sys0Y1crV3dkaVJXQ2xUbHplcUw2N0dxNVJ3dHAvRjZpdm5aUUdPVnAySFgx?=
 =?utf-8?B?THNlRzBuUm9ObVBsYUo2NjJ5TUxsVTVoQ281ZVpTc2o1WU0xNWhZT1AvMXhP?=
 =?utf-8?B?amRuTHpYUTFrQ2lta2paZi9aRWEvTlRvM0FMQkxtWFRJdnBCQ2N5NXl0UmV1?=
 =?utf-8?B?c09IeG5Td2x5Q0R3dnY3bHpMeGYva1BFa3U1cWVFeVhhSnFqeml0d3Ztc1dy?=
 =?utf-8?B?VHo1V3BkZmU2WjJlVEwxbmhhMGdxUSs3MFI0cTB0cUFyZFlwQ0dvcms1UWFn?=
 =?utf-8?B?RnhKWjd0N2ptKzlvNm1rZW5waXMxMFprU2x2ME53QWhSd1cxS3BRdS85UFRn?=
 =?utf-8?B?dkVwVis5UEYweUtCWjk3TG05eUd3Q1Z5TGpiRlUwYUVydDd2Y1k5dW1rZlpM?=
 =?utf-8?B?ZW5ER2dvSlN6ZGVtaHFJSU9LSkIyak1jWnhlMnhUeVY5Rkx5RG9jM240cHc0?=
 =?utf-8?B?OFRXKzB5SEl5WC9DemNjdGVWZGZZanpJT1dULzJHdDhwZXF5czcvaFJCNmVI?=
 =?utf-8?B?OXNicGNqcHI4am5jYmxKSEZ4bDdoeGo5cG9tZVp3ZVo4eFBjZC8yU1RZT25w?=
 =?utf-8?B?SUlyUmRoVFRRRjVNcTFSVUcrMGZIc0xjQmwvODlGbEpwVVBDTDRyZFdFYnBZ?=
 =?utf-8?B?OERSTEl2enZNWjFUYURPbzhHYVZ3VjJWVDBVQkJlZHM1c2o3Q0NVRXJSZkhL?=
 =?utf-8?B?NkFFMFNQOS9hMWxrZWkwbVpHK0JmQ1Fxd2VGQkswZDFPbWg0S1kyVks5V0lj?=
 =?utf-8?B?MUt0eG9HWkY2WXFCVE9qc3J0Q0EvRURXV1Z6c2krcGZVL0ZOTGZNZTZxbmpZ?=
 =?utf-8?B?YUNIVkdpSVdhUUluSGRJRnJpeEVaUk5HeUw1WGJhOFV0ZW9WSkRJOVBGWEF4?=
 =?utf-8?B?VldGUzdwYXVVc3hJQlpzQTlhL0Vrc0kyMmVZVHNsSm5ZSmt5dkE1cGFDc0tm?=
 =?utf-8?B?b2ZWSys3NGFqYnFNM3NVUWhWdERSRmQ2MUV4NmZ1Rnk4N2E2YUc5RnpZUGd5?=
 =?utf-8?B?ZWVucGpaUDVyNmVmdGJkRDJlNnpXbWRMeXBoMkpnUzl3VzBUSVgyWWFBUXJ4?=
 =?utf-8?B?RFpoV3FqTXU5WmN5NnhDcDgycW9SbTdteXBzTEdpUkxGQnZUME1lOVVxUmlt?=
 =?utf-8?Q?bB6+vrFJOzvydAT+puaMYPNpn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb89090c-7f67-4fdf-40cc-08de33ddad5c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:07:12.4087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tu14CAsbkzBdUGPJeeHau8fErbxA6/qhVGgzh+VTg9KvPeXW5Yd1Z5bi+ixblUSDGrQOx25hYqkhakrZvqg1fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11042

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 receiver in the i.MX8ULP is almost identical to the version
present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
clock as the input clock for its APB interface of Control and Status
register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
same restriction for existing compatible.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 49 +++++++++++++++++++---
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 3389bab266a9adbda313c8ad795b998641df12f3..4fcfc4fd35651e0cd6e80b97cc0b12301b65b684 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - fsl,imx8mq-mipi-csi2
           - fsl,imx8qxp-mipi-csi2
+          - fsl,imx8ulp-mipi-csi2
       - items:
           - const: fsl,imx8qm-mipi-csi2
           - const: fsl,imx8qxp-mipi-csi2
@@ -39,12 +40,16 @@ properties:
                      clock that the RX DPHY receives.
       - description: ui is the pixel clock (phy_ref up to 333Mhz).
                      See the reference manual for details.
+      - description: pclk is clock for csr APB interface.
+    minItems: 3
 
   clock-names:
     items:
       - const: core
       - const: esc
       - const: ui
+      - const: pclk
+    minItems: 3
 
   power-domains:
     maxItems: 1
@@ -130,21 +135,53 @@ allOf:
         compatible:
           contains:
             enum:
-              - fsl,imx8qxp-mipi-csi2
+              - fsl,imx8mq-mipi-csi2
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        resets:
+          minItems: 3
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+      required:
+        - fsl,mipi-phy-gpr
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-mipi-csi2
     then:
       properties:
         reg:
           minItems: 2
         resets:
           maxItems: 1
-    else:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-mipi-csi2
+    then:
       properties:
         reg:
-          maxItems: 1
+          minItems: 2
         resets:
-          minItems: 3
-      required:
-        - fsl,mipi-phy-gpr
+          minItems: 2
+          maxItems: 2
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
 
 additionalProperties: false
 

-- 
2.34.1


