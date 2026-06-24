Return-Path: <linux-media+bounces-65588-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eICOLGFAPGrOlggAu9opvQ
	(envelope-from <linux-media+bounces-65588-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:38:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 462B26C1377
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:38:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=sFQKfKQP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65588-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65588-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72B813024E4F
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 20:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015D33E169F;
	Wed, 24 Jun 2026 20:38:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B853E122E;
	Wed, 24 Jun 2026 20:38:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333534; cv=fail; b=djF4L8K+yUbZ2+dQ0KRbMQMvL5P+fsCpiNdcqJQl0ZZuF6D1qSwAAuSJ/OC64+OyD5BXY6BUUcUweMmNVp3vAR9kWAnniWtwizJWOAp6ZHy+NIOTchhj5No9m96yDTgs0YFii7jDJp9cWmMBXCbAGrbLsaFLKYDWq2cVZ4LQU/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333534; c=relaxed/simple;
	bh=435WVChFl0A3FK7+sZG/AKkcMOg7ue0qkMceJDAmux4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ip4IDqVNVSmS2x/RVk9f7clgI8dkkXTHpavBG9OvTWSp1vv/bAIT33f1X1AXDSqhNSmegM9O5IKucpsuexzllrWUlJwWGAGUsxKEFVEa+mSe+q/u/oL/G72zdqhCFHtZa+/RDw1c+IHYC3Q1dMcn/7fgKNYlLdlM0Gwf+BAeBr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sFQKfKQP; arc=fail smtp.client-ip=52.101.70.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sc49YYxZhv2Y2WxIBwEpzeuCADaeGI4iot7iVFD88ZFtOPnTvMvcMoyyeOg6VIHg4NQT+7e2SO46Tk6bQ8PidjlmSjssWfZo3QNjJXx5ufDxShiis2iqfw28715KYWxXVdlank5ZefroYTQEj49x7jOU7eWJ8rrpC5mdI33itwgsj8cCbcyI2tFmgX8/jvUhlOiFksLvKTeW2fwyA8FZSQgreRhMCVD8tGeOIp9GCIi8m6bahfl+Krjuql6llH8AIPw+HJO4INFcI9fyoWTDde7eCHjRD0YfjyqWu7OmVuTMC4b6kr5QU4GtvlfK/VCVneovvx8wCORabBFFyArOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri7uRTE4OgQJ9KnMdsrH9Bk+ocvdn2JGgwiCuU/Ycz8=;
 b=UBUiV9V6nHzaGSdiHxFjmfOFzfAnquv/+V6Q7q6dHSWqETKYxEB8tvzqUsxUjb5t45mAMsdAlk0OMEPKehm9MMnV6VbdjBE67mphkFOzCGeInJmxNxADvMPy6uuzmCrEP5Le9UsUuch0aHAm+yXsVMU7DUhxVN2Ke740em5G/HacA+TCJoA2GpCyWUf9iu9euYj8cJOdDQVLFndiqkNq2W/CQAvL5glSeVcYey/G4iDPO9OOqKN2358wR7p6T5ywdRzZZsZPNEi/0a7lUCfL0Feo3xZ5T9rckADL4a8Yhy1k/mrYzlisYWwHTlA1HX4uh49BBX1cSWFEM7LKx9Nq+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri7uRTE4OgQJ9KnMdsrH9Bk+ocvdn2JGgwiCuU/Ycz8=;
 b=sFQKfKQPFeschmp66/6L9n0ccWTn4Z9KpWo96VxgbjaoyxhnULWeO9C4m2a0TvpJ25i85kUM/5kJ/Qd0mdc8C7/8c+jsS3Ha7/XeiHZ1sbWsPVpLVZGo2UnS3l976erYj28zDDHZAelUqg3mosK2h/y3Ha7+r9qL/PhD9kzm9XSuAVKp3YME6X9uvge7lqOI4n5MG9BJLEObTp/cjMAq/VEAdtV+a/PS5mRF01Ggrgfm0UdsL7lLprtg2rm6AvnfuXX2MxUHrqugcoHK16oi+N1csWsxsNd3DaTX0L9WcqONFa0BjpS9NNX24p+tX4pujs/+ihRaRNYD2UiaL10nKQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11335.eurprd04.prod.outlook.com (2603:10a6:102:4f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 20:38:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 20:38:47 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 24 Jun 2026 16:37:49 -0400
Subject: [PATCH v6 2/9] media: subdev: Add set_pad_by_ep() callback to
 internal ops
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-imx8qxp_pcam-v6-2-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
In-Reply-To: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782333513; l=1754;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=/qaloPIgAOcAHx/+tY6miUuXAEETkb7RcaudhcrSuLk=;
 b=25ZK1x04AgZbxGlRBG58pdvtK6oA0V4361q6Za8kPPZpsxoAqrdmGkoKnZfPq6NNW+Ma6xzIv
 H+4jy703viQCD35DBQNX7wNaiDd2zcMb9+35DZwVTbuli/pby+VUAU3
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P221CA0043.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11335:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b5ec58-d61c-437a-6fd6-08ded2309788
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|6133799003|11063799006|5023799004|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
 2u2kkSThO734KBKy6nZauclbHnW1b1AWWqNu6tDjTuRjkfld2RaoMXSjmBqMcLQzSvXLOO7Fmzt+LRzpPrRXF7gGHCjZGahW9lwPaSoknbIw2Ef5BOIUm0jmrVVGeb5N5n+JTau1+zhqRnB+E7iUyV5AHMty6jzlztTAiy8lV9pln5ZQfpH4c3DN6rqN7Oj0mJTZMDVUJbatqgeOnAXd163rBopZQHM00fPNYFwvTyxb+9K4ks2h/pXqWBPFMtFELmVEC3rz1qWBakPOeUYV/0SY6OSWbbeNqT77EmzqEVw0eq8m59GuiJMhKvy99Johgcu4kJVIKDLbSELBIJa3sx9OvpjMQZESoh91Qy7f+d0JWzvCOoTcr9z2NOqyySnTtPKuW+DQ2BQi7I2w1BXWvNofgbHPir8/q9FnFIxTKqBUrSujCa6Lbsk1fmcwVX8Z33IP6mi8wtrC4BZlF8QXiHvbf0L38oG29YKFQWKTBGSVkhIZEUeJYlNNmJ43h7SWBEGFP8W/17b0XB7atXJLlpbPS2CKH9/MgqfrzA7pXIpvcGyxL2HxstMgCWkSTPBsNLb7Xq1mLqzpUIFlP/z/GWj67Onny+YFi1ImSWmoLypIJWO/2uEb9VeMhd8NrP78HQl7Bcpr44U1TikFn2XGvkE8D/7uj1ikD3+vRLM7TWSDbLIBMzHm10rEy8/ECH2gcbqi7WbGAhdE/34XecR9/A==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(6133799003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YWVMUENkakxrOWFuOUU0V2NYdnkweFp4cTlHY0RySW5ITGV1TVh6VkNXT2JE?=
 =?utf-8?B?ajNwT05PRGhRYUc2VjExTUhHY2xWeFo5U1RrMUVyZXZ5MHlROUYyaHRWVXBx?=
 =?utf-8?B?RlZPTjhuMVVxUndCWHZReEl3OUU1b3QrbGxROVdEcXNndnhPTFF2emtLUFFz?=
 =?utf-8?B?OExRZWhhbDhOV3RCTStpV3NyVGdEeGllSjVwNnZWU3hncGNXZFJHVDFnb1Qz?=
 =?utf-8?B?bFV1SEJCdlZiRUs4bVBVYWh1cEdHcGdOUTc1TU0zaFJpM2lOS3lOL2VPNEhI?=
 =?utf-8?B?Q3ZEWHNPWTNvMFZmT0tzQUxmWkxIeVNuQTUzdWJuQ1F6dFJmSXNJNGNWVFFH?=
 =?utf-8?B?SXR0S3NvYjRJZndYOGJ4YWpUZHhhN1BpLzlpTVVHK1JzRVlSVFhWbHBza1hz?=
 =?utf-8?B?c2JPUmFSQlJsSmpoM0dhNk01SFZkaHVHT0dpS3pTaUV1MlVxUlFlL056bW1x?=
 =?utf-8?B?T1VnaG9YeFlSenRhOSsyZ1lYcVpUaWxKaVNUUkV4ekRzenBkM2xMa3Rib0Ji?=
 =?utf-8?B?eHhGbWgwUTBSNDBhSGdSMTZ5QmtZbnNnWjhnNTVFdm9PSU5pTzFxWXJrYmFO?=
 =?utf-8?B?bWNjdlRkZkVDbTNPamNobjNxaTdUYVdPc1lmV2dmaXBtS1hGK3JQVXdxTG9S?=
 =?utf-8?B?ZXNVcFo1K29UdHVDUHV6QlJVMGs2a3FkWkdWVnk1MElwdWtaMlYxVkJucGlw?=
 =?utf-8?B?b0hLUDFBR0dsZ2wyRGlmTHUyazA4YXlLakRIZnVrRTRKWG13OE5EekU1aUhk?=
 =?utf-8?B?dGkrTStvS1ljcmcrQi9wU2hHRkhNOVlYaml0VlFSS0lKTkErT2lmU05wR2dy?=
 =?utf-8?B?ZGpKV2ZyNi9lYzRMUmlZSlNocmx5ZE1HcGxDUE1pZ1FzVXpzNDdPM3lScG5z?=
 =?utf-8?B?UThNSmViUjNIMHlERGRWOG5Yb2J5Uis5eDV4K0lTRllqZ21CUE4weDdHVmxk?=
 =?utf-8?B?bElTRE50eWZuRXRRY0ZLZFdKTHNQTVJKalhDcFNQVXVtNC9TbGZqWEl0U0pQ?=
 =?utf-8?B?cUg4UUdiZWY5aisvMmVlNU1aQ3pUNFpxOEFMdWJNejNZcTVjVGpoYklTa2px?=
 =?utf-8?B?ZUlHMXczeG41Zzd3OXVQbGVNbVVaUHltMHU5M0xOVVVRZFoxRkZtanpUTE5P?=
 =?utf-8?B?SVAwOFFjRWptNjJCZDlkWWV3ZjlIVEJWQWFTVWcwNTE0ZzZHMEFzeG9hK1JI?=
 =?utf-8?B?Yko3b0l0d2JZK0ZOT2tCb1drOFJxS0tCUzBVNkkvY3hzY09aYXp4amNINEUz?=
 =?utf-8?B?ZWo3bGkzTTlFRVcxOFcyVEJzc3lKbDNSY0EvZW85Y1BhUllpQmpVWkp0eTdU?=
 =?utf-8?B?WDlKTmlYQ2ZjeUNRakFPcGdOMmFmYmJ2RTBkYWJ0WE5FNG1PNUZxUm5jZkRa?=
 =?utf-8?B?aEliRlJLNlByYnhRYkZKdUNRVzNpakV0eXlxTXgvS0lDZWVNamZ6d0J4b0Vn?=
 =?utf-8?B?dlNLYzBkbDFNZkhvbVgvUDNJYTcwbkJDcDdEZnZYZTVSbUlpdGhzR2lDcmlu?=
 =?utf-8?B?b1dha0I5YkhSZ1VNbmRZSGd5Qzc5MmpyVVFVNkFzaWRXdlBpSTNXOTEwSE1q?=
 =?utf-8?B?d1JXTlhTcGt4TkQ1ZzM0eXZOS1BwdHp3VkphbURYendhZHUrcFdsRTV1bENs?=
 =?utf-8?B?alFoemlwOVk1SUw0SnQwc0NJTE0xYVhxVHJhUUF4OFdLNEkzUzBHZ0JCNVFy?=
 =?utf-8?B?VUx0Z2tZazNoVkdSaTVXaERzMm01UnQxMlJzMDByRGVuWVZBZzhBMlduMDRz?=
 =?utf-8?B?VWlDUEIvblhhUjJqTlRPR2tjbWVnY05Kelh5RzdDRXFMY2lsbUEwUXdwdkU3?=
 =?utf-8?B?bndGN0g5RWRTRnI4U3pTam5UOWJucEw5RUovNHhzMFdQUm54WjlJNlo1MUpz?=
 =?utf-8?B?UVkyQU50azlJcDlHbTJXcUtMSlM5dGkxNDhGdUdYUUZYTGhOWUw4V0Y1RlhC?=
 =?utf-8?B?b0dOaDZmR0RUOTc4UHNlWms4V0FvTXFObHVOMC91dVkwUHpmK3VzTmxYZWlP?=
 =?utf-8?B?ZWMvbndCN2VLRUQ5WWV4UWsvZ0VkK1czV3kwVnpUNWpSK0hoOUtpdWY3bUNO?=
 =?utf-8?B?NDU3VkJkOWJiV3g1bmNLeWh0VVA4dlVYODN6ODdCT1RSdldoK2lCRldFS3N6?=
 =?utf-8?B?VEdzaDhGTENnM1ZLZXZ0Um5WRTVwOTlmbDRMdThKZm1HZTRUOEQwODUxaCsz?=
 =?utf-8?B?QkhMUXBPbVJXaHJKdkdSK3Jhb1laMjRxSXVPbjJlS0Rkd0FxV25mMzliNU9t?=
 =?utf-8?B?dkxsUDdjcXI1VStzN05BU1FSS2ZuOG5DMEZwTTR5ejJOVjVuTzcvVFh4VHNB?=
 =?utf-8?B?ZWNKL2hwNVVWaUMzcTk2TmljTlcxVkRGUzNLZWN1aUpROUthNUtPMmVyZzZt?=
 =?utf-8?Q?K9zX+ba/ayr5la3YJiJYYvdHCn30cQ8fLUKc3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b5ec58-d61c-437a-6fd6-08ded2309788
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:38:47.7288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Z15UiYUcfAMCLnaDADbLEDOJwBlUWdqNABnHM83GAo5Z0hCxXqYULUjguDaGlbh0PSo+ulrFjvBMa5Da/B/JVXOE+/RLb478rz43ilmEQlTbdttnhesGx++SHn0sQxb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11335
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65588-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 462B26C1377

From: Frank Li <Frank.Li@nxp.com>

Add a set_pad_by_ep() callback to struct v4l2_subdev_internal_ops. The
callback is invoked while parsing firmware node endpoints and allows
subdevice drivers to configure media pad properties based on endpoint
information.

Typical uses include setting media pad flags according to the endpoint's
port number or type, and validating that the endpoint configuration is
supported by the underlying hardware. This provides a common mechanism
for endpoint-aware pad initialization during graph construction.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v6
- new patch
---
 include/media/v4l2-subdev.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f848..eb652eb76d33f 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -935,6 +935,10 @@ struct v4l2_subdev_ops {
  *	the v4l2_subdev structure. It is almost certainly required for any
  *	sub-device that sets the V4L2_SUBDEV_FL_HAS_DEVNODE flag.
  *
+ * @set_pad_by_ep: Set pad informaiton by fwnode endpoint, parsed fwnode already
+ *		   saved into pad->vep. return < 0 means can't support this type
+ *		   endpoint. Set pad->flags according to pad->vep information.
+ *
  * .. note::
  *	Never call this from drivers, only the v4l2 framework can call
  *	these ops.
@@ -947,6 +951,7 @@ struct v4l2_subdev_internal_ops {
 	int (*open)(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh);
 	int (*close)(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh);
 	void (*release)(struct v4l2_subdev *sd);
+	int (*set_pad_by_ep)(struct v4l2_subdev *sd, struct media_pad *pad);
 };
 
 /* Set this flag if this subdev is a i2c device. */

-- 
2.43.0


