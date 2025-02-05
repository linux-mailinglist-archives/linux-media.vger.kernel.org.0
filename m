Return-Path: <linux-media+bounces-25687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D98A29722
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50BD23A884D
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5576C1FCD17;
	Wed,  5 Feb 2025 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZYf3tJPE"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583601FBEB5;
	Wed,  5 Feb 2025 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775943; cv=fail; b=Gi/ICDEmlbCCbrqDY22+HZcXLyJaMDaWxl+Wqje95eh2/MrhUkZCuhKOR4LimKpfLMC+MW5K77GoRVRlw33MB1SwVxFKOcMHU8tOz0t60h7YtOYCvv9ZJasfEMJWKOhX8Gg2s0ksd/mvpcCOnUDwEsDeWD2sBXxZt1iHA6CYnKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775943; c=relaxed/simple;
	bh=rWhaCHE6R/z6MsGEbw/8fr0AhfVz/TD+W3KlZjzV0JM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=amIMMglndQMFtW5KvumVV0tqzkYSuyTHbGVUgXM/Nbr4nFAAApW4dV0vSWDjjp/Ef4BblmAmHao6xjXndpKCFoe8JeCRazamZ2EwOx0pWDyrjfaY2d/h3Umna/msBBOJzefRBLTJphqFz+t6jq7mjwozWx5tGZNhvqn50AoqXFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZYf3tJPE; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouqWX13nrIGtwf1oPX672lg1ctGpY8Zluz+sao68H4e1Y8OxsK4h80XTh/YXckJhRC6DofabilBt7VI9jjET9AkCYxstN/IvQ+QiFxwKDmhYtVEP1cQGMNGURdVexPfFwaLdTLf752qH9IqyEosnuGHq/lRBhxQcm16Gh0WpECCPW7tJvo4CHqA1PE4sSYp1mWIMz5OfRE/Uj5qLqGbN+V07CwCuFAzIKoqbcrZ4XL4Jug9zS7Zjd4bqWqj1CjpwCiypOXq1OZ1/7eDwoax40OjKk2+VNnw9YJpl+XQCx3q2g3L8jodA1vySiGUaZjNlTwHqnkxGUnbRHeUMB03yfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrNl7NG9xgnd9fOO6wDjU0zmVk5wr+zQtKatUgDJiFk=;
 b=A2LgFj4UTcJq7uJH8YeYBJy3yYYg0OHl/9T1jUDDy6tIKQVtNq/iVBAdxmCp94UVDZHB7G+DRwmP/3kjqN7mm4R1SDu6BBOK0cp3lMyPD/JeSH/9fuJ5fFnmqsl+p946rrXhrG/0ND68HttCOqprU1F2XaEsZLOvOJiV9cxLiF5EGIZ/zgIg+JTXxhGZYYUD9Xx3eg7818oYgktXIDB6Jq+aEx6N6I2+kS80BtIa4BFV+3ZH/MKUWxjLD1SpJPWR5u/fAYSnzz/HLvVEtaDlAKfAImbqq7TKir3hqaJe/TwUigwLWkBRcqqU1LKiRDpId1mYrxeknd9LOCvr63PPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrNl7NG9xgnd9fOO6wDjU0zmVk5wr+zQtKatUgDJiFk=;
 b=ZYf3tJPEhFzbXqKyxRBP+D9flGMsLKZf9lk+o077yrHlzHdgTHHbRr2dJSC18YWpdr5ONCJp9YYtrxB2fmSL6y0rVnBhCpjcW5dmtqddlGH4ikPEfByZ+y31KqYA9agfJAbnDslCNxcJ68NckTRAv/YcmJQknc6EdrDcX5XAUs3RTpPvM/DiM8iWHw6GhhDAVgjfRC10NL7SZky5FbIxfohNs7o/sAAyN8+plRX+4cF8xrmT+D5246cn1lbDyF1EEOacySCVO89sKC4iPrKx9dWBHfgevbqm5JWPZyNXUyBEm0g9Jjfs1UXr2pTZshsW3pSQe/OgaUglJaZCR0F2YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 17:18:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:18:58 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:11 -0500
Subject: [PATCH v2 02/14] phy: freescale: Add MIPI CSI PHY driver for
 i.MX8Q
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-2-731a3edf2744@nxp.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
In-Reply-To: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=7684;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=rWhaCHE6R/z6MsGEbw/8fr0AhfVz/TD+W3KlZjzV0JM=;
 b=QM1qP748O76Ha43e3+ITFbrNpaqnUAcuGtoKT5YHR0t+qnmtePBqDqeQiNfcEJ4lG2BGPcVrN
 /dvfytoMn1OCUJWl/YJh+t5v22TH6M9EGBh19H8+lxR7TFQO+T1SFBw
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10546:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e669b4-6b7b-45f4-8515-08dd46092d1a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cE02cmpKK0YvTkd5MkJ6ZVhJaTk5MjVXaVA0TUVOOEltQmVFb0k1bWZDS3Ax?=
 =?utf-8?B?djMrZTlNN3ArTmFTOGh4QlczMzN5WXY3bHNScHd1Z3N4R3lrZ0V6dHNTWWRp?=
 =?utf-8?B?dERDRjZORXZPckxtOEhWVXZRNTgreXN5bHFISEJKOXBUb3VmUlJIOWszcUFF?=
 =?utf-8?B?R2JJZDMwTUZwWjlzS2V0aG4yZm52SVV3MWFGVWMrQ3hJa1J4MWZZOG1MU1JH?=
 =?utf-8?B?dnYzY1Y1TEtUTGY0K2o4NzIwcy8wM0dDaEpIeENsN3ArNEs0OTJkbUorTnV6?=
 =?utf-8?B?OU10NU1xNFlLRk12aitzL2lZMTM1Y3BWaElqNFhHbFczdFhqVXg2SGhWRC9h?=
 =?utf-8?B?R0hQYzdXZWs0SW53Z1JhazZDZElpNXk5dEltUUttMHZ5Z3U3dVZ5eHN4WU5Y?=
 =?utf-8?B?aGMwcDdyOUg4RWJEMGsvZGtmMFZ5ZUF0VUphRmVFbEg4QkxXeEtjcWZWakpu?=
 =?utf-8?B?eVpFVnAwK2xRK25aUno2S3kxdU1LRmpTaUQ2MTM3cUgzY3FGMHRVOTVuRS8y?=
 =?utf-8?B?T05ESTQvZHhoc3VsOGljLzA3bWdWMFJEcEt0RDk3R0NOK0k3WHBRbzkrdCsr?=
 =?utf-8?B?RG92bjBpV2oweHNZUWdYVXlQekFFaHMwRlI3a0hDMkgwaEJTOUpjM3FiclBI?=
 =?utf-8?B?M2lCUFBEZkw2ZlkybGJTWFozMjhwVUl6TGFtQ0hSS2FaM0ZKczRZZ2tpbjhm?=
 =?utf-8?B?bEgzdURWQzZQaEgwV2p0MEtQZW1venRxaUNlUEZyS3I0d2kzc1E3VXNlWitL?=
 =?utf-8?B?cmpCQkZtNythaUZrTUR3Kys4bk0yc0NtSzZObzZ4cHlQUkZJSnRuaU53RUtO?=
 =?utf-8?B?Z2ZWblJUVnNuNjJQeTlWWmM4UkxHR0V6MGptSURWaGs4dVAwNFVHWksxZHVC?=
 =?utf-8?B?Ykw5amlMRGdQMnkxalNGQUFXMGdvZ29DQ1J3aWRNKzkvcEZaL1NXSXdNc2xQ?=
 =?utf-8?B?VURGMitkRzlaQU5KeGovYXZZcU9vR21RczF2K05Sd2ZtMHhZTzZLWXN3UThC?=
 =?utf-8?B?V2QxSTZrV0lnUDkweXY0L3FibzN0TEVZTlljMGJudDc4MlV0ZFhPWGJqRXNG?=
 =?utf-8?B?U1JjYmc5ak43aXdxckJiZEk0Q3dadlpUbzQrRWhsck1rRldheXpwanVjRlJj?=
 =?utf-8?B?OXI3U1VJWFQzMklnOGxTT3MxK280MytwS1dHNlZpWXV5Y2diRUhqN0d0SFVQ?=
 =?utf-8?B?dkNWbU9PMll3UDZWcC9NSjY0cDVRQ21UMmtGbGFWc0lJQjA1RlZGUng3Ykkx?=
 =?utf-8?B?bjd4cVF5aCtWbHhDTlQvRTVlRXJmMGpXV0U4c0Ztb3N0QVJoTkw2STNmSFNT?=
 =?utf-8?B?WXdvczI5NDBCSmM4MnBpWWJ1bDlLVkxGY1FIRW1oRjI4RTg1VFg5Q0JNQ29E?=
 =?utf-8?B?SDhLR3ZqL083UE9UYXJNeTFwQ0NHK0QyZGJNbi9rVmVmMHJsSnFpeUJwdnc3?=
 =?utf-8?B?U3dHUngwRzNPUlU3OUFtU3djQk9lRmNYRkM1UDl6ZVMxMjNJM3lnOVgvdjNo?=
 =?utf-8?B?K25QUUM5ODgrN25kUVB6U2V6Rmcxb2UxZHhNUHJaUlRlWmErS3RJZ0d6d0hi?=
 =?utf-8?B?WGxWZWhaZHhsNko0ZGptS1Z0TG9XWmVBci82aHl2N0tCTHptSHZVWHJIS28x?=
 =?utf-8?B?VVZSMXJwakdyQm50SDJKZHhILzRnNlFMaW1sK0pOMzNHYS9CUWxGY0V2VnJO?=
 =?utf-8?B?MjJKeVZ1aXF6SGRMamVWK3pGTHhkaHNqTjZRdTBTWmFsbnZzRk52dS9CalJi?=
 =?utf-8?B?SkpIVXdlSGVTS0Fscit0QUhXMU5SR05hUGdsQ0xvVjliOUNiejdhOVdRUVd2?=
 =?utf-8?B?NHJuY0pzd2EwN21vZ2Zkb1BsREtJQ0ttQUw5NHlFTHdnakdoVzBrTDBJRWFM?=
 =?utf-8?B?VG1uLytKUmxwNXR6M21iZ2huWHVvQ1dTWExydkNMTkYrQTZMVXFjMHNER2hu?=
 =?utf-8?B?WENXUnhvamRrQXJ6ZDhVajRGd1cvRkd5OVVIVFIyQ0k4TGs0dmtxZWRwVTdt?=
 =?utf-8?B?dnpNSUgrZmpRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?elg4cXR2ODR2dU5hTEdQZWQ4MnhiTnFNTlVleUVndWRlTSt5RC9vbTY3MXdW?=
 =?utf-8?B?TjkxZ3ZocXZtWEswUllRMnpad0ZGVVZYM1U3UVFaQjVWTDlacFpIQXJTZ2s0?=
 =?utf-8?B?NUJ3Ri85L1JVU0hxUnRRMHRkSENwVHVjR1ZtUERmNkV4eTdUQUhvaWxQdng0?=
 =?utf-8?B?UXJkaTFWMmp0N0lJYnQ4UHFjOU4vL1h3UVIyY3pMWXdzNUZEWmNCb0Zwd0k3?=
 =?utf-8?B?N25TWWNsZDBEbi9zMWppVlpZOWpaajJwNzlnZFlCT21La0d0aTR0b2Y4cGsz?=
 =?utf-8?B?Q3hXQTI0VGNGc1g3V3Nmd3dvd0lOS0tCeGN1RGV6WHlBN0c2NG8wOWFCMTN0?=
 =?utf-8?B?VzUvQ0lWYjhHbmZIS0gwMTdSdU93d293cVJiWG9YNVc1eEQ0YUdCR2FvMmZQ?=
 =?utf-8?B?RVAzcVlFK255U3cxaXRjNnJQUklHdnBaNThMY3J3V1pkUW10aGZrOW5hWi8w?=
 =?utf-8?B?S3dSVWRkTTAvMkFVVUJHMllvOG56T0pKbUd6ekRJeTc1Q1RsVW5xSUplRk9r?=
 =?utf-8?B?SEdadjhiUURseFVPRS94bEoyVmpWdnFaeDFvbVp6NHRZSVVCZ3I3YXI4dldI?=
 =?utf-8?B?SmM0LzNrMCtkRy9SM2tXMlpqalRqakZUUzZiYkN5SW5NOFVlam9DWlNYVFdv?=
 =?utf-8?B?WS81SE9WbkFoRU1vMkhkSVNQdzVtYzhTUlJGQ0hqR3EreEJMYXlURHBPTGpU?=
 =?utf-8?B?MDdnQWYvb1owZlFMZkdMUEJ0TXFvTnp3a0MzRnAxamNtZSs4clJyUG1Qd0RI?=
 =?utf-8?B?WGtSMXhHaFhwS0QrWGRFViswZnBOVGY4cEppUU9Md2RPcWJqdUdxTmcyTU8v?=
 =?utf-8?B?RTMrNUFwVVlodlNFWnI1VklpcmIydjdXYUxnOXR3WTg3dmVMcDdlQzl5cnk0?=
 =?utf-8?B?eXpuYktuQklYWHJuZldiVWpjOUUzTGdva2c4c3N1Um9rejI2QkR6b01wR2RY?=
 =?utf-8?B?M2czeUZXcGZBSWZGR3ZJcmdvK2J0OFJGdDAzOElnRkcwK2pxVm1VMDBOT1RY?=
 =?utf-8?B?ZHh0WHBsQXlBNG5qdXRTdXBPdyswQlJHL3d5elhNb1BRN3pxckx4QTNjYmtE?=
 =?utf-8?B?bE9YdlBTSGhWanJ6cGZGcU5CZXFzbXlmWDJ5Y1NpeFB0TFVyYWhLT3Y4S0ZE?=
 =?utf-8?B?K094U3hwVnNkQ0Jvc0VmRGFIR3lJS3ZZaW42eFFoS3Z6akFiK3NNR3JmcitS?=
 =?utf-8?B?dHVkRFNkY3ZjbjFsZnNZOFpQWFVXQ0lzLzBnbHVWUElTM2ZFb2NJZEZsc3J6?=
 =?utf-8?B?dUhyUzRWR21zQjFQaWlydGVkeE5WSjEvK3VFMy9nNjhzakVBTUI1VnRVN1E3?=
 =?utf-8?B?TSt6Qkc0d2FEZlB0ZWtqbGNMeTZuZEFDM1VnL0lsL0M0dzlKb0pRZGV4b1Nr?=
 =?utf-8?B?aThjV2pWaExXZkozTlQ1aWN4T2R0cG45eHI0aXpqQUFaUTAybWh0d2swelZo?=
 =?utf-8?B?QXhBS09kK1ovU3JTcjA1VW45U2xOL0RBeE5MdXR2TEhVZmpidGZubERET3Qx?=
 =?utf-8?B?dTFxZUhMckwwekhCbU80WS9PV1E0TkZ6cC91TGg5U2JZMS9MWlZtR1BIb2RU?=
 =?utf-8?B?eXRIeTdDR1JSVDdvbXhYUEJNQzR6N0pCZUJ0OVFTNHpqNHFjKzdiRytyZ1Zv?=
 =?utf-8?B?cVBtZEkyQVFHcmRNc3VLUnd0K3EzeEt2c3NZNnpGUytINDZEQUJ4enhMZG9t?=
 =?utf-8?B?VFZoWk5aV2dLSVNKcGxVdU9sS3liOVpLcTRFK3VrbHo0dnNqVFF4bnJYRmNa?=
 =?utf-8?B?dThnSVJwcjdtaWhtWERINFZtMFQ1dis1VDh3aHY2Z1kwU1AxNmN5RXA5dzQ5?=
 =?utf-8?B?NytSdGVkOExZejZxR2RXcUlNKzJIbVpGT0hIQTIvenRocHlreGNOdTRDYlNm?=
 =?utf-8?B?ejFZbkZWeWp1d0d3YVExaHNMVTVNSFJrN1l4REJpL081YVVoYXNZTGlzSkpT?=
 =?utf-8?B?RFRMVlBkRzdmbzJrZzlSNktVcnZQT1BFTlpYS0UzdHBBaWRUNXhsU09yajFr?=
 =?utf-8?B?VTlBdkdIYldOeVU2WmIwNmljQUZqeE1WRVZPclFTTHF1SndDWGhoMGdneThN?=
 =?utf-8?B?SWVpYm03TWw1WGVHbUUzUG1FYUM4Y1J4ekpYeXVuaGVsWlhmSHlOay8rdFdY?=
 =?utf-8?Q?53SzQbxWefo8KEpUdPL97S5bn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e669b4-6b7b-45f4-8515-08dd46092d1a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:18:58.2862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPoaqFahOfbJ7ldVLhFJ4mXos3CYJkKTHwxYH/ahUt9+zctNpqGJODbYB6Vb9yr+uwqcWQjcq4WNK864d8Q0uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

Add MIPI CSI PHY driver for i.MX8QM, i.MX8QXP.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- remove un-test code for 8ulp.
- remove unused regiser define
---
 drivers/phy/freescale/Kconfig                   |   9 ++
 drivers/phy/freescale/Makefile                  |   1 +
 drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c | 185 ++++++++++++++++++++++++
 3 files changed, 195 insertions(+)

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index dcd9acff6d01a..f412fa405b9b6 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -35,6 +35,15 @@ config PHY_FSL_IMX8M_PCIE
 	  Enable this to add support for the PCIE PHY as found on
 	  i.MX8M family of SOCs.
 
+config PHY_FSL_IMX8Q_MIPI_CPHY
+        tristate "Freescale MIPI CSI PHY support"
+        depends on OF && HAS_IOMEM
+        select GENERIC_PHY
+        select REGMAP_MMIO
+        help
+          Enable this to add support for the MIPI CSI PHY as found
+          on NXP's i.MX8 family of SOCs.
+
 config PHY_FSL_IMX8QM_HSIO
 	tristate "Freescale i.MX8QM HSIO PHY"
 	depends on OF && HAS_IOMEM
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index 658eac7d0a622..8ff72dfdcf654 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)	+= phy-fsl-imx8mq-usb.o
 obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+= phy-fsl-imx8qm-lvds-phy.o
 obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
 obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+= phy-fsl-imx8m-pcie.o
+obj-$(CONFIG_PHY_FSL_IMX8Q_MIPI_CPHY)	+= phy-fsl-imx8q-mipi-cphy.o
 obj-$(CONFIG_PHY_FSL_IMX8QM_HSIO)	+= phy-fsl-imx8qm-hsio.o
 obj-$(CONFIG_PHY_FSL_LYNX_28G)		+= phy-fsl-lynx-28g.o
 obj-$(CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY)	+= phy-fsl-samsung-hdmi.o
diff --git a/drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c b/drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c
new file mode 100644
index 0000000000000..3137c89eab057
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct imx8_mipi_phy {
+	struct phy *phy;
+	struct device *dev;
+	struct regmap *phy_gpr;
+	int speed;
+	const struct imx8_mipi_drvdata *drvdata;
+};
+
+#define CSI2SS_PL_CLK_INTERVAL_US		10000
+#define CSI2SS_PL_CLK_TIMEOUT_US		100000
+
+#define CSI2SS_PLM_CTRL				0x0
+#define CSI2SS_PLM_CTRL_PL_CLK_RUN		BIT(31)
+#define CSI2SS_PLM_CTRL_VSYNC_OVERRIDE		BIT(9)
+#define CSI2SS_PLM_CTRL_HSYNC_OVERRIDE		BIT(10)
+#define CSI2SS_PLM_CTRL_VALID_OVERRIDE		BIT(11)
+#define CSI2SS_PLM_CTRL_POLARITY_MASK		BIT(12)
+#define CSI2SS_PLM_CTRL_ENABLE_PL		BIT(0)
+
+#define CSI2SS_PHY_CTRL				0x4
+#define CSI2SS_PHY_CTRL_PD			BIT(22)
+#define CSI2SS_PHY_CTRL_RTERM_SEL		BIT(21)
+#define CSI2SS_PLM_CTRL_POLARITY		BIT(12)
+#define CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK	GENMASK(9, 4)
+#define CSI2SS_PHY_CTRL_CONT_CLK_MODE		BIT(3)
+#define CSI2SS_PHY_CTRL_DDRCLK_EN		BIT(2)
+#define CSI2SS_PHY_CTRL_AUTO_PD_EN		BIT(1)
+#define CSI2SS_PHY_CTRL_RX_ENABLE		BIT(0)
+
+#define CSI2SS_DATA_TYPE			0x38
+#define CSI2SS_DATA_TYPE_MASK			GENMASK(23, 0)
+
+#define CSI2SS_CTRL_CLK_RESET			0x44
+#define CSI2SS_CTRL_CLK_RESET_EN		BIT(0)
+
+static int imx8_mipi_phy_power_on(struct phy *phy)
+{
+	struct imx8_mipi_phy *imx8_phy = phy_get_drvdata(phy);
+	int ret;
+	u32 val;
+
+	/* clear format */
+	regmap_clear_bits(imx8_phy->phy_gpr, CSI2SS_DATA_TYPE, CSI2SS_DATA_TYPE_MASK);
+
+	/* clear polarity */
+	regmap_clear_bits(imx8_phy->phy_gpr, CSI2SS_PLM_CTRL,
+			  CSI2SS_PLM_CTRL_VSYNC_OVERRIDE |
+			  CSI2SS_PLM_CTRL_HSYNC_OVERRIDE |
+			  CSI2SS_PLM_CTRL_VALID_OVERRIDE |
+			  CSI2SS_PLM_CTRL_POLARITY_MASK);
+
+	regmap_update_bits(imx8_phy->phy_gpr, CSI2SS_PHY_CTRL, CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK,
+			   FIELD_PREP(CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK, imx8_phy->speed));
+
+	regmap_set_bits(imx8_phy->phy_gpr, CSI2SS_PHY_CTRL,
+			CSI2SS_PHY_CTRL_RX_ENABLE | CSI2SS_PHY_CTRL_DDRCLK_EN |
+			CSI2SS_PHY_CTRL_CONT_CLK_MODE | CSI2SS_PHY_CTRL_PD |
+			CSI2SS_PHY_CTRL_RTERM_SEL | CSI2SS_PHY_CTRL_AUTO_PD_EN);
+
+	ret = regmap_read_poll_timeout(imx8_phy->phy_gpr, CSI2SS_PLM_CTRL,
+				       val, !(val & CSI2SS_PLM_CTRL_PL_CLK_RUN),
+				       CSI2SS_PL_CLK_INTERVAL_US,
+				       CSI2SS_PL_CLK_TIMEOUT_US);
+
+	if (ret) {
+		dev_err(imx8_phy->dev, "Timeout waiting for Pixel-Link clock");
+		return ret;
+	}
+
+	/* Enable Pixel link Master*/
+	regmap_set_bits(imx8_phy->phy_gpr, CSI2SS_PLM_CTRL,
+			CSI2SS_PLM_CTRL_ENABLE_PL | CSI2SS_PLM_CTRL_VALID_OVERRIDE);
+
+	/* PHY Enable */
+	regmap_clear_bits(imx8_phy->phy_gpr, CSI2SS_PHY_CTRL,
+			  CSI2SS_PHY_CTRL_PD | CSI2SS_PLM_CTRL_POLARITY);
+
+	/* Release Reset */
+	regmap_set_bits(imx8_phy->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);
+
+	return ret;
+}
+
+static int imx8_mipi_phy_power_off(struct phy *phy)
+{
+	struct imx8_mipi_phy *imx8_phy = phy_get_drvdata(phy);
+
+	/* Disable Pixel Link */
+	regmap_write(imx8_phy->phy_gpr, CSI2SS_PLM_CTRL, 0x0);
+
+	/* Disable  PHY */
+	regmap_write(imx8_phy->phy_gpr, CSI2SS_PHY_CTRL, 0x0);
+
+	return 0;
+};
+
+static int imx8_mipi_phy_set_speed(struct phy *phy, int speed)
+{
+	struct imx8_mipi_phy *imx8_phy = phy_get_drvdata(phy);
+
+	imx8_phy->speed = speed;
+
+	return 0;
+}
+
+static const struct phy_ops imx8_mipi_phy_ops = {
+	.power_on = imx8_mipi_phy_power_on,
+	.power_off = imx8_mipi_phy_power_off,
+	.set_speed = imx8_mipi_phy_set_speed,
+	.owner = THIS_MODULE,
+};
+
+static const struct of_device_id imx8_mipi_phy_of_match[] = {
+	{ .compatible = "fsl,imx8qxp-mipi-cphy" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, imx8_mipi_phy_of_match);
+
+static const struct regmap_config regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int imx8_mipi_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct imx8_mipi_phy *imx8_phy;
+	void __iomem *base;
+
+	imx8_phy = devm_kzalloc(dev, sizeof(*imx8_phy), GFP_KERNEL);
+	if (!imx8_phy)
+		return -ENOMEM;
+
+	imx8_phy->dev = dev;
+	imx8_phy->drvdata = of_device_get_match_data(dev);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, IS_ERR(base), "missed phy base register\n");
+
+	imx8_phy->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(imx8_phy->phy_gpr))
+		return dev_err_probe(dev, PTR_ERR(imx8_phy->phy_gpr),
+				     "unable to find iomuxc registers\n");
+
+	imx8_phy->phy = devm_phy_create(dev, NULL, &imx8_mipi_phy_ops);
+	if (IS_ERR(imx8_phy->phy))
+		return PTR_ERR(imx8_phy->phy);
+
+	phy_set_drvdata(imx8_phy->phy, imx8_phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static struct platform_driver imx8_mipi_phy_driver = {
+	.probe = imx8_mipi_phy_probe,
+	.driver = {
+		.name = "imx8-mipi-cphy",
+		.of_match_table = imx8_mipi_phy_of_match,
+	}
+};
+module_platform_driver(imx8_mipi_phy_driver);
+
+MODULE_DESCRIPTION("FSL IMX8 MIPI CSI PHY driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


