Return-Path: <linux-media+bounces-45358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16092C00376
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCAE61A647F3
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 09:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FDD3074BB;
	Thu, 23 Oct 2025 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jritl1az"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013069.outbound.protection.outlook.com [52.101.83.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AE330749B;
	Thu, 23 Oct 2025 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211201; cv=fail; b=rQB38nvQaaHGwd6DkYcJqkgKF1EuXjXXDegAG1wH8rtD8jev7ZrdWsP32knC2g2P1bkdQzXaG8tUNIJqXiKHaNdNdYSLfXczZEeyk6oYgAeLBcKblhY1r4U3m/wWl0z40aw0a9ufJp+OYiwN7/UCBO9j2ncS8bV9xqeLKZ2TKTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211201; c=relaxed/simple;
	bh=CjBiz/zhGKKntbWFqQRieciCL7eIWeMWa6L+hEKNnMA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lx3UIsWN8zB1B6sMaizZ4qRiBTe3JjjGNTPOx169rIaW0i9N/T4+rigroRGe4fh5kCC6gxZypF4HbM8nFIieIF/G7ds2v+FPhuesuxK+Rh9IA2DUtFYN+0YiD0U5UkfUR1UujJuMW8nf4LSHp/iHWaiZM3XLW7UZito1W3/pY+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jritl1az; arc=fail smtp.client-ip=52.101.83.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YB9qR/oZp2MVQBpZIbX+45BvTbMyLLylHqOl6X0geR3EeJ1IA+k2n5bMqp7VbPHQ/TS6UDAajTC4KwaE1t1mUMrBBG7TOkG70vTVFkt/qIILe9HLqd7co4d8MP/wBiPHAk52znBZJRWQxEs5fKvRlq+j+pLqec/sM7UHCy7RLAD+Hm/8ougJ98BR+HiRTy1oggoxSCfFJhItBT+SkKuaDM6HjUNOuhtNcMKAfbzlCWKtBLsN+5LwvYa4YbqOlFqNDTHlZJIpO9NdZr640qVND8sxMR23rs7O4cbMoTV+xLL2AmxF6oEwSK5Z2WzzAclH3S+W4eVVRuctfVshhCoUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM4b3TZ450YnhI9AeyN3z8OkV5WFCe3oO+jDmpZcc1U=;
 b=KykQJRaLmCCCO84yZaqZ9Ukp4z+mU65TL7CVNCleKDkN4AbsmRmDkdbSBmlzcdHkDeHPKXJEkmOsAlYlO9K/CimPm3EYrXMeiz0EtAwE8dORx3aLgHdpM58vnn2D4kWESkfTq7UsyN3nIix0iG7ZCzRI6aTJbxqNEd/xtDuZHrQYbpwP8C9gqCkCF6XHRKQLkGbPwyZw3ppSKqhnP6SQQuPBVBCuS1JApKEa+2fT2OdoHIt13nBv6su8YohymbJBw8xNI2J8Q21TByVQ2uyJSqTetFID08v5HsZCFzH0E0ZsTrkqzIEHD5WIUOCYR3kupzHy6ers7mxEhA7+OKYdfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM4b3TZ450YnhI9AeyN3z8OkV5WFCe3oO+jDmpZcc1U=;
 b=jritl1azvEEBEIT+mN/n30m2yuGCDlc+R7LA6u/JolLd1CV+d8gw/YeNICcQHbL/XZqOOIn+0DQIP55Zfyw9x3j2CA4iLnH/d6k0rZ7CeMDsp8SjoCShuF8IH6Qcc3m0264rHuoCo2Hc0MKz6iClUSIgx/qQUjdarcWKG3opqWQMyut14bzEHs7csqic+gfLv3g0xGEGF6+2ErrEhoTxg6Pv/1rFbU6OEmywKvBnMfqNtP+9MPp6Reugeq78ERSc43KpLNGyxswRWUp1pI75V86rnGWTKEZj+vwDFHffPyAUDyKoW8Eqlwjs+EjmwWiPUxV84RtUDHOtOsPTYvKF9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:20b:44e::21)
 by PA6PR04MB11946.eurprd04.prod.outlook.com (2603:10a6:102:513::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 09:19:53 +0000
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798]) by AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 09:19:52 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Oct 2025 17:19:46 +0800
Subject: [PATCH v7 5/5] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-csi2_imx8ulp-v7-5-5ecb081ce79b@nxp.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
In-Reply-To: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
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
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761211202; l=3008;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=nA5cy/wcos0mCTMHP9Jtnsd7cdC81n6TAw63/g+dYUo=;
 b=iNMKHGYI81T/ya0ZXI18lkxm9BS6OF0dWsIQKcGkxpgy04HCHbp00AgCEmAw8cwYZnSuCSYjV
 YUlPS/Ssn9vBQvq+lImmgfThgwDXy2NLzO698UDAkYuISXXFBhwKzVB
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To AS8SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:20b:44e::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8SPRMB0023:EE_|PA6PR04MB11946:EE_
X-MS-Office365-Filtering-Correlation-Id: af5e1383-f01e-4712-374d-08de121552ec
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bEFtL3JBTVV3ditsNUVJTFVFQXhzWHRqc1NlQ1NxajlUcU90QmpOWDBWUEVk?=
 =?utf-8?B?Y1hXamt4Z05qWVp0VFdYRzhHb2NmUExmRjNDTVhEN2pWeFlMcVBqRVdMbmVm?=
 =?utf-8?B?bXhNUE44M0tNZkRFbHhDakg4b0w5YzJPUlJJTitIRzhxc05qOUZrcUhVWEFr?=
 =?utf-8?B?UlJyNmZzRHV4cTE3QytCK3Q0ZzZFVmo2QXUzQ0ZyMTNBSkRVZ1V5ZWcwUG9O?=
 =?utf-8?B?MzlKcGZMYnNDVW9nd1kxMElpYzBvOGtKNTJLekRiMUh5N004c3c4UGRBb3ZH?=
 =?utf-8?B?UXpZYWRxV01wVFVNcmk3eFhmcmpUMlMxa2IxRU1YaFY5b0ZZK0gxTjNNVDFz?=
 =?utf-8?B?SjFGazZma3pSOGpUNHVKeERkRHN2RkdjbHlPaGZIempQRWF1Nm9wVFhDY1Rk?=
 =?utf-8?B?Mk9tSDdGeGt1MEp4bHNDSGpsNUxvcThqbXNZbTI5UnVmcGtxMUNXdE5vWExk?=
 =?utf-8?B?L2ZjYXN3SjhkYjVXSEdoNi9QZGc0Kzl1bzVlVFBxL0dDczRuY3ZCV0FBaEtl?=
 =?utf-8?B?OVJSOWJ6Q2s4dlZLZFU3N0ZkWHhpMjlYVHg1SWdQWXNFdjd6N3NTZ0lhSXZ6?=
 =?utf-8?B?dEViL2NYNVVvYUJVYXZlOTk5Tk8xQzdyTjNjNzJsSDJUbG5QK1ZBcC9iZlR3?=
 =?utf-8?B?VHNJSWJSbk1WZWdTS3Q4R2hsdVNvZlZmMHlvS244eDAxWGM0MXBpQmlBZmpo?=
 =?utf-8?B?UGJCT3RlM1I1SUxuZGEzcXdoWTZIV2hrZm9JbEFIRmJ5dWxhOVRWOWpHKzE4?=
 =?utf-8?B?SzBPaXE1MjM4MjdhMjBNSWRVZU13d0NpUWhjWTMycmgzdWNBZE8zNVNpOTIr?=
 =?utf-8?B?NWZXZXlwa3hvdzFlVUZqMk5lNDFGT051K2JPcE5ISmVrMTdyaDNVQ0VQM3d6?=
 =?utf-8?B?Z3A0QWNIMnJ0NHhVSVAxMTQ2QjJodlR1S2hLUzR6Y1hZc2ZvSU5CbmxWKzRG?=
 =?utf-8?B?VGhacnNEN2lwdXlVZHFjZkdxMk9XMTk0cVBTZkxuOFhDU1lWOW0yNGYrQVNV?=
 =?utf-8?B?T3o4TEFlb1dOY2MyQXRLL2E1ZW91cHYzencvelVwV1REZ2daMkVnM0pMeDNJ?=
 =?utf-8?B?TXFGSVRYMnlycGFzUUNYa0dZenJyNzByYWlBemJPaXBUL3h6T3BHc0VtdmV6?=
 =?utf-8?B?QitxbW9rSkNuSmE4cFVzQXVxSE1nZ1dpNzA0MVd4K3I2MlZtWTM3NHE0UkRO?=
 =?utf-8?B?cE9RVFVkUzJ0UXVDeG9FbjlJTm94ZDdLdTUvdE9vU2lqVWpiQy9QdCtZZ0o4?=
 =?utf-8?B?OFNQR3hWb24yNlUxbGFiYkdtTmViOEh4d2QwemtlUGdWempPZUtHazdsVzNC?=
 =?utf-8?B?OUZIRzh3aDl2UFZTa0w4L2o1SUZvaDFnRWN1d0gzRGUxZ09HK3lOaDRlekpn?=
 =?utf-8?B?R1dsaEp0cURuMFJvODlDaDNRVWU5TVlVYkhGdWtQME4yK3g3UXQvaGV0Vklj?=
 =?utf-8?B?ZTV0b3F4b2xmWTV6MitjMnpDeHFtUEZVNm1Eekt5Qk11YVc0aVBPVHVMbDhn?=
 =?utf-8?B?ZTE2ZzVLRmhNNTNTT1N1RlV2cGhEaE1aUllBdUo0RGtRNWxWVmVWWTI4T3Fy?=
 =?utf-8?B?OVQ5a21wTlE4U09KVkNqWFZ6TEYrdG9IQU1aTUFTWVhDTkpHS2lVMi92dVdk?=
 =?utf-8?B?cmExbjZRaXNJSitVYUFFZGNFZDY1eHAwRnFFcnErT2J4RFNyWmhUdVZhQkZ3?=
 =?utf-8?B?K1R5bjh3Um0yaVNXK0NGNG5HV2owc0VLT3lqcGR4WW0xRGwrcCtPcEV6ZVFK?=
 =?utf-8?B?ZnpleTZnSWV3cmduVVVzYzA2dFNmbGRKbVIwVWlLenhWQ1lmbGU1QmxYZmN5?=
 =?utf-8?B?Zi9iZERhMlRCSVRScXRYOENkb29qRUFaY0tNQUxPRnU0b3I4dEV1M0ovNm0v?=
 =?utf-8?B?NFpsdGFtRHgwN01tSGJEVkEwdStKajZQeUFmd0RVblZjT2h4UGQ4cEdHRms0?=
 =?utf-8?B?Q0F3U1V5UXpFZElFeXIrRlVib0xNT2VnNGdENUhITjE4OEZ0NWdxckg4V29G?=
 =?utf-8?B?OHlGaUNVTUUvRzAwd09OQzd3clpub0NVOEhhUzVpa0ZIOU9sNnV6N0haTGJr?=
 =?utf-8?B?akJvaU1Yb3YzT0dZbW9RcWJ5b1VDbnZjNXVsQT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ajJFc0wyaFlETzJxY2ZkUkM1N1VEME5NekVQSVRSMW1Lajl2TWxwdTlaUWdI?=
 =?utf-8?B?SzhNa0pXN2ZNTGNGejhqN2k3THZlZ3N3RWVLeEhqQWpXWW5rU2lxM0ZLS0F5?=
 =?utf-8?B?TGJhdm1CZUExcklOVlZFOE0ycGlxeFlTdXcraGxwdFpiNWcyMmJmVEMrVjVl?=
 =?utf-8?B?L1BmUEZHcW0wNDUwVE5oc0V1U1UrRDloS215WkM2ZzlJMzlhQWt0WkZaWkJw?=
 =?utf-8?B?UE5MTXFPWHFKamlTV1g3VGo3eEZhUDRXK2dXMXlTbnBSVUFuYlNmdWdDTzRV?=
 =?utf-8?B?L1NaQnYwa2xxZ21ycEhTZGlyS1E5ekt3WTRXMXplcjN5S0RScmF1cXpxWDA1?=
 =?utf-8?B?OUFQekxwSjA4UXYvMXljV2lDTzBZWTlmeUVxMkRDenBhR0VVRUdOM1VwVTRo?=
 =?utf-8?B?OFV5NmZ5Zkp4ZEs3RmwvQzcyZWY3WXhmOG50bldxOVlMM1RoK2RhektQTjVC?=
 =?utf-8?B?cHY1T3BZZFNBZ0xXRE1YWUZBQUhCRml4ZjVDOFBjODJ1bkxFWEJrRDlRMkpQ?=
 =?utf-8?B?eTRJK3REbzgwWUZzbUFvQ2E4bnpaTVVKUXdMWVVHTXYvaHJDVm1mZmpRV0Fy?=
 =?utf-8?B?emQ4K09HbjV5SzFiRUJ4bkpEaVluVHZaa2NUNk1SUUQ3NFVaODZleUZNMzRE?=
 =?utf-8?B?R2dXcXN4MXhIajJxUDhqTG5oaEhnRVdrcmF2c2ZsZm5tR3h6YkZqN05jQ3p0?=
 =?utf-8?B?eU1IeTA1d1M2NlRCeFNlVUdxb2NkZXl5dkI5bHpLMFJxNnN2elBVMHVONHZk?=
 =?utf-8?B?U0FZRDVoREo0aEorUi9yMFVTZExZWHpISzBLMnRmU0FrNVJyQXE5OG1LUDlZ?=
 =?utf-8?B?QzFNSDd1K3dYd0xCcS9UV1h0R2t6a2huVG9MVFJNWE50VFBZWGt0STVUdkFy?=
 =?utf-8?B?NHFCWVpKZVFZQ25PcGR2dFBnQ0dtSy9nUmtXUjFiT2ZMUmx4N28rYWdaWnhR?=
 =?utf-8?B?dHFVb3pKaEdsTkFKUHhpQUVBcTAwR1BLTzQwQVVXeUJOMm9ucEt2UzBPaVFi?=
 =?utf-8?B?SmdYdkpKeTR0UzB6d3d0Y3Z0cE1mMi9IWTRONjlyVGYwV0Z2a0hIOFc4Q1Aw?=
 =?utf-8?B?L0VvUU1qZkNhWlNjbXR5elJaOTRMMjFjZTk1R3pjZ3FRSGR2WGJFb2x3VUhh?=
 =?utf-8?B?QjhRcjhsU3M2Vm9lSDJiRCtYRDJjb1NvdnhBdWJGWjlpcmtuMzNNYVdPWEJG?=
 =?utf-8?B?VVZnRStOZ2RGVHNlRkdMVG9FWFl5WmEyTEVGS25PYnVPaVN5ZmdYT21YcFFn?=
 =?utf-8?B?YnhNK2cxUHVzUVMwdm8xMzJ2THkwTitmY05wbDBPYXNWcmFlRFpuQ0l3SzMz?=
 =?utf-8?B?T1hveDk0MFJFeE1oUjA4Zm1SdHZxd0FwZExhM2Q1ZjFJNW1kL0Q0SkRmb0Vw?=
 =?utf-8?B?M25wS0w5dzM0ZjNSaDV5Zm5oYW4xWEswbHA1M1dPaUpWSXJYdFFIWWNhaXV2?=
 =?utf-8?B?bjl1TUkvM0JQYTB4clBYcG1qQTUzT0trUDZSN2J3b3Yya2Q5eGdiMEdCUlc3?=
 =?utf-8?B?RWRodGFJUkZkVTV1MVJZMDlZSE9JNXNiNzhsRit5M1hGWlNJdGlSUVRCaWY3?=
 =?utf-8?B?azFBT1FRVllyRS9FMUQ0bE1OTnA0WDVzR3p1ejZtN2xuMTFHLytPZFJ2V09T?=
 =?utf-8?B?OTJqQzcwbUNmQ3V6amJoOHl4R01hMDRLQytZNEI3eXp5Z213K25zSVNoNllG?=
 =?utf-8?B?UXNRSVh3YWJrVHB1ZWJ5WEM1aFZjbGlUMVBvTHREQmhkUHBiVEZURzVJSGY1?=
 =?utf-8?B?THNtQUZ4YitmWXFHSmtaejRwNzJub2tLWUsrVENybWhIRks2UkFaei9RM3Zs?=
 =?utf-8?B?WkhPRDE2WG15ZGlnUkp4c3RKRHBLa0Zhb3p0R0VDUlN0bGJCUzZYdGxWeU9G?=
 =?utf-8?B?V3pQMUdvTVpXbERkTGIzNlZ2KzdkVHV1U3F5OGxPYzhBVjlIUXZqN1V6RHRr?=
 =?utf-8?B?VmZjNE5iRTdxSjcyUnhuQ3lwSzdHbFZGVytHb2dJVWVZUk9QWnU3aVhMSjdW?=
 =?utf-8?B?ZDRuVG1LTlNrNmE5c2RMbHE3bCt0UUdyMGZNL3REbk9DbHkvKzFvTnNMalRo?=
 =?utf-8?B?NXQ1SXlvSmlKREtVN0I2NFBtRFNPbTg4TjRGRWFWVnV3dDdwYU80ZGJSSGFj?=
 =?utf-8?Q?tBmf0Bg4dK7nAeyxgTGHtzQ69?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5e1383-f01e-4712-374d-08de121552ec
X-MS-Exchange-CrossTenant-AuthSource: AS8SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:19:52.9395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYBlgpid0DAjxJ0u6gDHgeyMN13ljiVlgvq00cslD+elO9I58xfmK7xeX7lvSjMVflsnIYCK6T6h2+Pu+ycCfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11946

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 in the i.MX8ULP is almost identical to the version present
in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
nodes and mark them as disabled by default since capture is dependent
on an attached camera.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 67 ++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4950c37e72e04f6bfb5995dc19178..99271d55dfb60ed2cbfe664d928be179eb257674 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
+#include <dt-bindings/reset/imx8ulp-pcc-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8ulp-pinfunc.h"
@@ -842,6 +843,72 @@ spdif: spdif@2dab0000 {
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
+
+			isi: isi@2dac0000 {
+				compatible = "fsl,imx8ulp-isi";
+				reg = <0x2dac0000 0x10000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
+					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
+				clock-names = "axi", "apb";
+				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						isi_in: endpoint {
+							remote-endpoint = <&mipi_csi_out>;
+						};
+					};
+				};
+			};
+
+			mipi_csi: csi@2daf0000 {
+				compatible = "fsl,imx8ulp-mipi-csi2";
+				reg = <0x2daf0000 0x10000>,
+				      <0x2dad0000 0x10000>;
+				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				clock-names = "core", "esc", "ui", "pclk";
+				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
+				assigned-clock-rates = <200000000>,
+						       <80000000>,
+						       <100000000>,
+						       <79200000>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
+				resets = <&pcc5 PCC5_CSI_SWRST>,
+					 <&pcc5 PCC5_CSI_REGS_SWRST>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_csi_out: endpoint {
+							remote-endpoint = <&isi_in>;
+						};
+					};
+				};
+			};
 		};
 
 		gpiod: gpio@2e200000 {

-- 
2.34.1


