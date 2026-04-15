Return-Path: <linux-media+bounces-58775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICyODO0J32n3NwAAu9opvQ
	(envelope-from <linux-media+bounces-58775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 05:45:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E5D40015C
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 05:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4936E3031B76
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 03:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784593491C9;
	Wed, 15 Apr 2026 03:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PbWUnd90"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A3A32C942;
	Wed, 15 Apr 2026 03:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776224716; cv=fail; b=GKB8YlmoMGAf3HXbT+PRb5aV9RrrjKozpeFagHfux84nQlGyaA3OJozgB5ReIunnMQhwGyDh3oLZw2Slg/KuVCO/fXR6ycMjRWWwxlqfOG3YM1f8vJVZdi+/9Kx7wwNih52UEbXvxpN5qsU+7MJLpZEZxLb/Zl1wQBHyhxbPb9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776224716; c=relaxed/simple;
	bh=DHlJ4Y71TF+eJtEPtNGMJ8sUZJpN1Z0/Lpx40wPFtj0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LzJig+yZ9ChWYA/Q8X7gnDvdSprUr9HAAn7B9DwvCep9Enu5V2pS+MQOgsPiYKJ+qUmxrYKRlmHxw66BBewqyYWHheb5RYm0UC6t6NV1NUwou4SCmQIDwfS1fpJjoVwkVz8krOYn9UkotTHay/Y7xeoZHV6TEZb6PJVrlkqRZoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PbWUnd90; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjGhdha+QQZLbifT8dBF2OhjCrebzsSmJOEAIZLqXDM0J3NCVmKvDnH8vfOgDjP2hsBREW+zj3nqJtdWD5/LET/kXLFjOUwnlZZWHUliIOY1PH6FR9ryC5+Ingbvervig1W5xAyMM4QdVfiGsy20mQxwWb59iERbGVOFmYnh8A9kJn3wYlFss7G5CzXfDMm9iJVqzQciPcKkFhN2mvuWpKS52ViHphiJP2/Y1f+tb8hogN3dGarz+H03XAfDNzIVdKjfpEpVMgOBs9AP1FICS15+bzrMaYtPeZRTrYhUrcytuyc1ZsRZ6rvqTw91mNUxHzPoE1B4BUgCVugBIihPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ip/cDrAY+RzxIv0hfxKL7TNPl9r05ezQkWdZH1wfc64=;
 b=sGzHh2/0GMkDebq8hOF1VxNwtAg01GBua+KwFwG8YMIszEhDmsO1+QR3dwdFxIzbU09RYc/LkRruHykeWtVi3pW4YiDUJtAQ85VG0Mb0ay1XxiOlFl52uo1l977asltuvkxgcB8jJReq+y7oDuTkprS93DxR3Ui//49j9e+L7xae+yb3l8kN/+OrpAqHLlxSiOIzLuRXNf1UJXG9MtPiws0X2OOa2GqHENu/N/JZQhuJz5Jk1TiY1u0W5YG3lweUNnq0Nk9kbgEdMph2SR1U2fE2jryyV5Sgv+rrbw04BEzDhMbbHwhaWDPNnpNxzAMtSzFNEoTVxVTLxbDqb6LnJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ip/cDrAY+RzxIv0hfxKL7TNPl9r05ezQkWdZH1wfc64=;
 b=PbWUnd90fNAVBPD2bRIA9n7Dsm28D0S7xTlZeiaUNN+KyLMCfBFQ8C549BiBAHChH5SZItvfyMAzliNW/LwMRJGMPn/otDB6F9jv7ufZ+qWODTF4HO2XwRSCGpwqg8v4lScmB2fGuL0wNouq//tb8MkVomoItnzw2Dk2aVDfKOx3a3stpLD54m8iHBtNDZgAR31drQwg63QFHKEhXoFHowDgr0BxJNqSDF2MgNuMq/PFyuXlYHm7Aj5cyY0MZsLCBT/ctitFbPDtuL40RjTfv2Ay5aDZ8osK0OlMRGr3eKbFWtzSuPHNiaspS5iHFZb7+3VTYHjdfWtVIR/Ci1n8ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by AS8PR04MB8785.eurprd04.prod.outlook.com (2603:10a6:20b:42c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 03:44:54 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 03:44:54 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 15 Apr 2026 11:46:54 +0800
Subject: [PATCH 3/5] media: synopsys: Add PHY stopstate wait for i.MX93
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-csi2_imx95-v1-3-7d63f3508719@oss.nxp.com>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
In-Reply-To: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776224832; l=3861;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=DHlJ4Y71TF+eJtEPtNGMJ8sUZJpN1Z0/Lpx40wPFtj0=;
 b=q5vqUsKDQYqmXi/TbVXog6sPCP+uDQ4B6p6US0sBFLhAf2PQBgPwO/aj7ByVwvqQ78W4T1x14
 fiLNOMlAZ0JBWMU1/HCEKSjbjC778XJUBsCsEPi7Oe0Ge4xyQ2+IaiR
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0181.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::8) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_|AS8PR04MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: d2949e23-4aa4-4dd2-e2a1-08de9aa15b53
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 GlzeD9Lxf4lIJIJ9TUlYfwHD0vkGV5VAkQCR8BQyRReqTn8hpW2bKB7tDUuM56oKIOa5f3TyAkNIEUoVifkEm9huRYIsR4ddUM8mw+mzBm6u6roqOH+j94+xVdylm/c/Qy2AUof83M0wIK2NOyJ6DERSL11R1gkHUvyoRHlBUkeEE0pfSQ4vdVVgGsueKNCwEYkXivupXTTvy6gSLOi2lgmFn6dfZqGxMBdCy8WDv/Hhg6iODwJpeOhRn9suGuJiBDWAYU9P4HvK3GpeaKud3tbx+6YhlGeEu+6H4n0UX0b5G9TjA9J+y4RgO0/LO9vUIBMKXr432mhnMMkkNPZjrsw2AbZVbI7v86kTa93tNZjH6mI77NMQflPUOkP6EWRcvOom3IO98LpqHOXg+zqqKm85lqgfKzwfdGQIr8EfOUJi2jCcSYY8G8iQOL2IUdXhKOeWRj5Kbd8ABy/x1G5TLW6L5A5DqKdeCJsxrf3jkiswb2cIitJCwAdTcRYo161Pg3ZnnMxvCr99Sy7f0evIGT3scx+qa4Y1a4fQGCzbJUs6oG9m9VodgKk3k6jTEHTqP5AUbgjBmW4gnfCEBOH53GyGZRUci9vyYggi12DyPGWGA66YSZDrNOXGHlabuFxyLVgIg+ItuXNzBdlqF2ICAqkNcKrUXV3G4WE/1DtTDfHLuxD7EJImu3IxPWuO0KeRWD178XR/UPAf+N+7ffJMBPl+ee00tBzH7dIcBk++SJbYJMh7aW82TMbPLLyJ9xWLoRrDs3eUaodOIb1tptAnF8EVw8skp07Lldxw1DSaXW4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NWhESEtCc3pPVUFpUGRqWG1LZGwzR1VKRS9OUEdTVk1haUNWRkxCMjRENkQ5?=
 =?utf-8?B?Qm4wb0pzWEhDamZob2N3cXlNekh3MFBscE9XTU5iWkJqQUlNbDJCYmMyTVg3?=
 =?utf-8?B?blROMmdFaEpndUprdnRXakJpdFBmTFBkKzZnSmhtZ3F2N09rN1RVMUpJQk1J?=
 =?utf-8?B?MUw2QVFpT3g4Myt3YjlXM1RXZWpsaGUvRmVKNENYTkNQaTFVanMrdXNHaVd4?=
 =?utf-8?B?ckpabEZhaW1BY0Z3a2prTmJEdXZGaDMzeDdJWkt3TERyK05wS01wV0hYelFB?=
 =?utf-8?B?eHhlVURZbHVHZjUrc2hsMkVTUHpHbng1TEE4WjFNeWx2Y0lmWUpCc1d3ZG10?=
 =?utf-8?B?NHp0M2kwVWtsZExKVXd6VEM2Sm5LM25aQm9mU09zUWZVbnRwR09Ub0l4Wisw?=
 =?utf-8?B?a0lTWGczWkJrNmxvZ0c5MngvYjRFUmY0b0V6Rm14anRteDZTdWNNVzVNU2xz?=
 =?utf-8?B?aTlHbVYrOVlMbmx2ZHQ4VERJVFI2TzYvdElJczE3a3hUTzUzSHpocDlOdVNQ?=
 =?utf-8?B?Z2FWZ2tNbEpFYUxyVGRXZjNpZlVNR0JlUW1Uc2E0V3l3N2RlZW1tcjFXVVhE?=
 =?utf-8?B?YVlZTGN3aE8xOTlEbzc2SUY1a1lSSXNPSXV6aW5IbERNYlV6cGNsck45bCtu?=
 =?utf-8?B?U0VsZSt6R3BjbXFvN1RoeHhBLzlkbkFlQWxwMCtodmtKTGdVUmVlM3ByOExk?=
 =?utf-8?B?eHk4N0JVWGpJdHRyTXVCWkpwRHNuelB4VFJQZ21CL1Jsa3o2Wm9QeDdhVWI0?=
 =?utf-8?B?YU5RK0Q1d0tsSU43NXRpaFpNNkVjTUFma2ZneW9YSUVmdGNRY2hRdkxYZnVE?=
 =?utf-8?B?SGxmMm9HMEdKcDRaMFFiZkFDS0VTWkNVM3Bndnl5SW1tRkMxQXRzSEE3SWsw?=
 =?utf-8?B?M3BSRnhTdmdBU1JubzFXaUZZMDV4SUYzdVpOMjhPQS9pVkhHVit5UU1qV1N3?=
 =?utf-8?B?bSt2TnpTckJIbEYrdEFEWmk3NUo5bE1HaXo5aHpVaGpINWV5dW5hcXlURW1C?=
 =?utf-8?B?b25haWtCSmhuUy9KQzFhWFU2WVJjL1haSlB3TFRtQ0lhNWlPeUlZT09ZZEp0?=
 =?utf-8?B?QU9pMU5pUm9VbC9NckpOTnpOTzZSRGhaZ0NzbS9pRlhMMWhVa3VWSnZxYm5k?=
 =?utf-8?B?OEVqaW50bWVyYU9ZWkw1VUJxRERhd0hSSHhjbjVCSE1zK05hU2NOWEtvUmZU?=
 =?utf-8?B?blluTFU1WkNXZFpUbkhHV0k3OVlCRGF2N3d2RGNmaFZOdHBZVlpHSDBzNzFt?=
 =?utf-8?B?VDJtM3pLSkkxelNvNlJUY3RjOVBCdW4zYmhaTDNWOTMzbUNDM1ZLNFFnM3hF?=
 =?utf-8?B?Z3lHMVRIdDhiRFkzWXhKOUF6d3djcFRmUVB1RWNNQWJDWENwTlJRMnJiYUxa?=
 =?utf-8?B?NG9ZWTFmVHk3OWpEYzhRT0RKaHd3UVFJajBzSmg5SHlCYnBpZ2h2NU9nSnBt?=
 =?utf-8?B?ZkRNVWdBSTlkK2F1Rjhpbi9qazc5emxIOUUwTVVGdFdGK3FTS2ZXUjRwN25B?=
 =?utf-8?B?VndIVjRvWVNYWHlvV3JrV003Ly9HWE40d01hSGxES1VSam1Zd1BPYU5BQjZo?=
 =?utf-8?B?bE51blVmQ2pRVEpLZmhXb213dXAvWUdmdlJ3cjZXZ3dWd1I4ZHBjS0hUUFdY?=
 =?utf-8?B?eHZlQWJGdW9hdU5yVXg2eUpqcHRiNklxVy9jaVpWVGduQytkNkp6Z1JnRkh6?=
 =?utf-8?B?azY5TmJBNlRTLzhYVVZkT3VRNUJhREtKdkxxUFpVVENLY3c0TUsyMEltOXBI?=
 =?utf-8?B?ZDB3NkRtTFU2SHB2dGJCdTFLbnp0Q0hjSExzbVRSUHNPWVEvKzh3M1VLQ3pJ?=
 =?utf-8?B?TXh3Mk1od2tJRnp1RUlRZi9QaU9xL1Z6VFU3Si9DKzFiZk8vR2FBdWlYL2Ix?=
 =?utf-8?B?ZGJOQ1A2SDVDNzYxUGc0VFUzcmxHZ1R4SlhjNzNNNVRBSENjeG5JOUc1WGZ6?=
 =?utf-8?B?T2QxQVZyT3ZjQUI4NWtSa0gvNWpHbEE0V3lWaDAvYm1zdVkzVlBuTm5tMzR2?=
 =?utf-8?B?cDZDVnNHeHdLeFJETWlWcCtTdldhWEUzcWFYR0hLWExqcHlFa2tMb0Z4Smo2?=
 =?utf-8?B?MWZETlRvYjAwNHF3cWRxd0dHdUMyU3N0OFpZNjBUb0ZZQmxYOHk0VzNUQzFK?=
 =?utf-8?B?eElLNllnaDE2TGxFTk1RS2I2MmRGajRaeUVvbjJLanc4b2o3a1RNQ09OOCtq?=
 =?utf-8?B?eGJQS0JHc3gxRnk1S09jcXRuNU5RVDIzWkJJeWZQRkJJeGIwNUw0Zk5WakZp?=
 =?utf-8?B?NEV1azVheC9XTWU2emtGK0xKMVNpNTlCcHNGbC90NVMwbGNLWVg1dGhhOFFT?=
 =?utf-8?B?SHBXUCtLSFY5TkVCWURHYUEvRUNma2pVakZsTDNValZyaS9ZRGZ1Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2949e23-4aa4-4dd2-e2a1-08de9aa15b53
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 03:44:54.7208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAVB/iR8kl/NYCIKJVMWM3gozPdms3xEfMUqJdgdWwoA7q+hmu36p792EGuMJr+hW/diFMVZxyG35e94HYzE8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8785
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58775-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B4E5D40015C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement waiting for D-PHY lanes to enter stop state on i.MX93. This
ensures proper PHY initialization by verifying that the clock lane and
all active data lanes have entered the stop state before proceeding with
further operations.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 85a2a95bf080..27e4c1027816 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
@@ -35,6 +36,8 @@
 #define DW_REG_EXIST		BIT(31)
 #define DW_REG(x)		(DW_REG_EXIST | (x))
 
+#define DPHY_STOPSTATE_CLK_LANE		BIT(16)
+
 #define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)
 
 #define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0), (x))
@@ -65,6 +68,7 @@ enum dw_mipi_csi2rx_regs_index {
 	DW_MIPI_CSI2RX_PHY_TST_CTRL0,
 	DW_MIPI_CSI2RX_PHY_TST_CTRL1,
 	DW_MIPI_CSI2RX_PHY_SHUTDOWNZ,
+	DW_MIPI_CSI2RX_PHY_STOPSTATE,
 	DW_MIPI_CSI2RX_IPI_DATATYPE,
 	DW_MIPI_CSI2RX_IPI_MEM_FLUSH,
 	DW_MIPI_CSI2RX_IPI_MODE,
@@ -87,6 +91,7 @@ struct dw_mipi_csi2rx_drvdata {
 	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
 	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
 	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
+	int (*wait_for_phy_stopstate)(struct dw_mipi_csi2rx_device *csi2);
 };
 
 struct dw_mipi_csi2rx_format {
@@ -139,6 +144,7 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
 	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
 	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
 	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
+	[DW_MIPI_CSI2RX_PHY_STOPSTATE] = DW_REG(0x4c),
 	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
 	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
 	[DW_MIPI_CSI2RX_IPI_MODE] = DW_REG(0x80),
@@ -410,6 +416,12 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 1);
 
+	if (csi2->drvdata->wait_for_phy_stopstate) {
+		ret = csi2->drvdata->wait_for_phy_stopstate(csi2);
+		if (ret)
+			return ret;
+	}
+
 	if (csi2->drvdata->ipi_enable)
 		csi2->drvdata->ipi_enable(csi2);
 
@@ -856,11 +868,37 @@ static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);
 }
 
+static int imx93_csi2rx_wait_for_phy_stopstate(struct dw_mipi_csi2rx_device *csi2)
+{
+	struct device *dev = csi2->dev;
+	void __iomem *addr;
+	u32 stopstate_mask;
+	u32 val;
+	int ret;
+
+	if (!dw_mipi_csi2rx_has_reg(csi2, DW_MIPI_CSI2RX_PHY_STOPSTATE)) {
+		dev_err(dev, "phy_stopstate register not available\n");
+		return -ENXIO;
+	}
+
+	stopstate_mask = DPHY_STOPSTATE_CLK_LANE | GENMASK(csi2->lanes_num - 1, 0);
+	addr = dw_mipi_csi2rx_get_regaddr(csi2, DW_MIPI_CSI2RX_PHY_STOPSTATE);
+
+	ret = readl_poll_timeout(addr, val, (val & stopstate_mask) != stopstate_mask,
+				 1000, 2000000);
+	if (ret)
+		dev_err(dev, "lanes are not in stop state: %#x, expected %#x\n",
+			val, stopstate_mask);
+
+	return ret;
+}
+
 static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
 	.regs = imx93_regs,
 	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
 	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
 	.ipi_enable = imx93_csi2rx_dphy_ipi_enable,
+	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
 };
 
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {

-- 
2.34.1


