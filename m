Return-Path: <linux-media+bounces-39173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F4B1F0F8
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 726657B7AFE
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3782298981;
	Fri,  8 Aug 2025 22:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QJ2pX+dS"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011050.outbound.protection.outlook.com [52.101.65.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6F42989BA;
	Fri,  8 Aug 2025 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692926; cv=fail; b=L0wqhCt1ZC5N9SDyPnKVnL5dG7Dk5zW8zQQNajlYj6j8uQgT8hrqnPXrYjHF0vgwgx/99Un6a+7yK0ykAs91zFAZJpzUDjbLbv47qxd4YD8Gj8BhhKCpKNAIHwXHpXefHO/iAUumPfhn4mDYJ8dGhDEruLblRCjCvnQgTsldBMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692926; c=relaxed/simple;
	bh=GfH6aNEpqjEh86/SmVej0OoWoaACdBfdSBGBmRVMRUE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jMsJMSAo5+hGxHBCeK83GnyKyH3gktboTLZZA21WxHextlOHVFWPmmqCCtmZxoP3wgXWstScbyQdsC4neO4epa2usyMnBaoAVl0kxJdnPTw3VoSy8St9+qBkMep/oQiIUYi0Su/0yzGCEkGTKuVqSIy0eq1HFJ7NbAbi3ZPQgM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QJ2pX+dS; arc=fail smtp.client-ip=52.101.65.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1G7XbUoYyDBjFIxwYaJewBoNMSCkkXU0f+86rU11PtGeHZXjQe+tw6Z/2ZKmlRLOxfgzT3P3yIKZ43uK9cvQeNUReScUKOC2QjweELONcNGD6gDARyhWGTE6vACtBL+lMSMx5sOYDLV3hLu/34fxkz/a58XqqF/Z+atSS0jZWvpUG1ckiHC/sN/mIlgcYXED6GV16FDEzWGuXei6U7ULG+TJEh6H6Xnc+zvOfTSDZdgCGAjos8IzhnMVaAhjCMCn3QGzgcRCJIOFvHDyXOsgSiyr4jBoZsbeqXY90DWXAnQEvbLN9d6wzuXx3nQTBGsXXVMwYjfGdbimm8XpZ+M/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mtLILh1QQSXxTQ/+pq6fvbSsi0tZrBZjLB7nEtdfps=;
 b=AReKpEZrjNQkNsl1KdWt+q8UI/dehWaNCZIqLVC1IisrwJBRIeKflK4AxcrWZWB1Y0Zxhd9es61BF4y+z/kT+hI0YcVkchmj+8PnukJ/PrRAMJWq/JsX3bExUYU7Zenu9HP1DG6aOf8a1iqXlT0nqAHh0UR8CFLsqrjcaPPme/Rk1QDcbOlaQRNIzZMB18VQrc+YSEAk0pdqNf6D2W6FDx2lPO8nA5YccKjVO3ydUWDRJcGTCGG7h8TF+bfy7rw/SymIotm7CDFDiSUszsWs8oxnFEnwEKxAF51S9EPpCbpW4jiSPds/cAufzRVX9HPt9EkqD2xFgnrWF+UK0EuGag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mtLILh1QQSXxTQ/+pq6fvbSsi0tZrBZjLB7nEtdfps=;
 b=QJ2pX+dSA25oj9jmN9WrsXXGqaeb5jOOzDKzrl0FktLqdVUfyLz1lqqmWLqtIsZ5YnbgVT2EX1cpVqR2S83eTGYMmXC3WdN4AQfcrVKB0UlKYSGAgS6K79hBJ/FEuHa9/rSrPes+C5rVApGz4USfApzIHjWJuGljV2x7Gv1D5BKOq04Zv+8pLcjaDXIpfawIcR5Sg7c9K+1qompvFeamjl/XIzgq7puMRj9/mvF1fCCIrKIlizK2Boq6KMi/YbzUwhAzUA4i7yejuzXtr8r9JgyUol9J/fNED4ix9djGPOvI+1+PPejP2BoOwVn6iyRPaVxqY0fkjDMG4E/r54JQyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:42:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:42:01 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:24 -0400
Subject: [PATCH v2 21/32] media: synopsys: csi2: Add basic v150* version
 register
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-21-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=2430;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GfH6aNEpqjEh86/SmVej0OoWoaACdBfdSBGBmRVMRUE=;
 b=dYagVoQJQTmTAd52fwJCRwaxY0L66+tCmuylGeaHBWoh07bu0bFf1E3KyZWzwtJ/6NTckXpbh
 dD4b/YyC30NDNRSsMubc7vYt6+r3G21AgagK7Eflq17sJIS7tWee04p
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
X-MS-Office365-Filtering-Correlation-Id: f1beed9c-cfaf-4b1e-0b98-08ddd6ccca59
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?L01sQy9icEJEZ3lFVnRrRUVFVElMSWFBdnNJcVRHQ20vUlR0T1lGSUMzNFNz?=
 =?utf-8?B?Nk5WeDN2L2xPd2JnZkJ6eWtwRE9GeFpvRkR0TzFsamZwSGxBVzFQNUJSYTZO?=
 =?utf-8?B?QS94c2VNeFcyTzRKd25EaWhLRTltNXhHWHprTUVRcmMyY1BRM1VjSVB6NWZz?=
 =?utf-8?B?SUJoNFBPVDF3ODRLVkVaUmtmWmI5Rk5HVkkrbUJnWnB1clRVbHFueUZRNHNX?=
 =?utf-8?B?aStFcjQ5QzlnSGFISzFhWEdQaDRnV2p5SnltczBIVlJPdUJxTjVmblN3V09l?=
 =?utf-8?B?OG9ZY3lwdjQ1WTFRblJXRE1VYXJjU3VJbW1YWllOMEhnK0FzSWxINkF1VzN5?=
 =?utf-8?B?QXk4OTR1WjJaeHovQXlXUHdFZ3hURDc5Y2RtbjV1V1JMUVVKSDJmYkpCQ094?=
 =?utf-8?B?UTlRb3lrVi8vQmZFekFialN1bjYrZ0R2T2FXNWFFa0pIWG44enFOM2toWHVC?=
 =?utf-8?B?TWlwWkZWSXdMR0RxeGgyYi94dkpMR2RBeHFMSU41V1NRWlpKb1dhU2t0OXE3?=
 =?utf-8?B?UVpkdFVQcDN6ZkxBbzdqNENHbzNpNFZacHoxWlFJOUVMUENva0JHUGZNNTZv?=
 =?utf-8?B?ZFAzZHg2UFRSVTUzTTJYTk13bHk0Nys2Ykc2WUlOZnNRcytpZHU5Z2ROa2pn?=
 =?utf-8?B?aGFQUVJZU0hTLzhnUWxvRmhPc2FjN09jUHVpSXBBak16anZwbXZmQWZDeWFw?=
 =?utf-8?B?OEMvT2IyL1pvNE16amJaeklLYkpobmhBVzVpSXRtUE5tUnErajJkZHhITTBI?=
 =?utf-8?B?d29rQldLSXNTT2FQRDlZN0FCUXd4WDU4L01DKzIwN3lCc0xZZmVuSzk1ZWNH?=
 =?utf-8?B?ZHRPYW9SNEFzWHp4MmJTZnE3K1NMZjNSbzk3MmtTdjVjKzhzQW5mcnQ5VkhQ?=
 =?utf-8?B?TEp4Y2wxdWpMbm9uWWtQcDlJVzFXMmJVTjkzOUJFM2kyVHVwNEtmeTJkTUNT?=
 =?utf-8?B?dExSeHRQRFd2d0xBUmJySHVWcHo0blhJNGVBVnVoQ3QxeGxPMS9ZcHArRHhV?=
 =?utf-8?B?emRRV0s1Q2ZwK0F0NVVkMzEwUUtxUndUOHM0Tkd4ODZML2FTVUFDbnpyZE40?=
 =?utf-8?B?YXFFS21RNWdreGtUWWFsQ0JycnJXTnFnalBMNnZlQWdqdWtLU25xUGlpdkQy?=
 =?utf-8?B?WlZNY2NOTGY0L09CWGtPMzNRZ1RKNWRmZFVWZWtVYm42bUhtVUhvQ2Z5UERF?=
 =?utf-8?B?bXNKUzVYWmxuZ3M5MXRnUS9YTGdGcTlwNFFUTjhhZThQK1RGbGczRElVVmRI?=
 =?utf-8?B?RnpFYkp6NUdiSjMrRDcrN1hPaUxkOWtaMFFtNElzSnl2S1RKUXJrS0lWLzE4?=
 =?utf-8?B?dGtoWlU2U2hnTWhNOHlmcXdXYU1vMnFSek0xSXlndktoR3JtWjZ0WUd1T1Bj?=
 =?utf-8?B?bTc5d0hkeUsrZTgzdlNKclJEMEwzcDR1aUlybU9jVVNIaEVPenUrbzEyNFVm?=
 =?utf-8?B?Q2NDSm51dGFpVnJpbjdaQUsyK3FPMXVoQ1NuWkJCa2RkNDRVYWsyNUpEWGc2?=
 =?utf-8?B?TmpKdDl0c1p0bXpsR004ZStXcUErVVJ3R1pDVzJhcDRtN0RNMHMyL3Vnb0sv?=
 =?utf-8?B?M3dGS0srTElQMGNDU0hBUXJWbmdQY1JLVDNVakFSdDV3RGhGR25aOWNhL2Zn?=
 =?utf-8?B?eFppVGRZbWdTNEdWcUphRzUvSmVEZ2pYeTNFRjg5SXFCWFlOMndUUVdXRStY?=
 =?utf-8?B?clE4MHJOM3RYNG92M0orRG9ManMxQzU5cXUzNFNwNW80anB4aFZJMENoTzhx?=
 =?utf-8?B?OGFUYk5SVzQvaTQ0cUdFWUZ4UEtEUlUyNHRJUlp5czF6MkoxODFmQy9nWWVq?=
 =?utf-8?B?ekg0a0MzZHg3eFY0UUs0bThlbm04LzJxdFdiZDBpTmhqUlJlTFoyZzBkRjZN?=
 =?utf-8?B?b1R2ajhOdGVoaUxROTIvV3YySEpyRmVodytsak84R0dPZ1JXcU4vUFRpd3U0?=
 =?utf-8?B?Z1d0aFZLdW05VndFT2lYTG9FbmlzUFJwWTM5Y3FPZ3grR0hVQm5wZ3pZSVNU?=
 =?utf-8?Q?dSxBR3IJKs4ej95vHiEmpK4/oFPNIo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Z2FORERYVjJ0TXFHNVp2QktiUU1EL1VCek9nQmxIblZzekFONzIzelBhZ0hs?=
 =?utf-8?B?Q3crbklPbVRuNkRyMHVnd0RSc0s1aWpKYmVzZ25GZEtPNUkyVzNvMkJyNWFM?=
 =?utf-8?B?akZSNmt6QUpmWlc1clFYRDNxMWhHc2tsOUJVcUVuanVGWjdGM3AyYzJrU2dr?=
 =?utf-8?B?V3lFc2RmWTBkZ0xKL3dzc2pnRFp4ajJ2RTl2OVRYU0ZaRVJZcDAzSWFIVzlh?=
 =?utf-8?B?M3ptSytOa1U4bFhrOHFxTlhjcGs5cDIzRjVuY21tQXMvU2o0Wks0ellwWFEy?=
 =?utf-8?B?UU52dDF4NjVoN1JPRzlnNmJhaHY4OEVWR0NRQzBlT3R2S3A2elpHR2ttbWR0?=
 =?utf-8?B?RVNyc1R2S1A1VUdsR3hvMFlmOGJDb1JLUmpQVXBkMUROaHRkQWIvT3lZN29r?=
 =?utf-8?B?MlpzTG1ZMFA3MHo1WlUvajN0NjFPTEZObDNtUlZ5R3JMUTA4THZRaHFGbnhP?=
 =?utf-8?B?QlNBQjFvVTkwSjFHOEFhejNrbDkrK2VpNWl6VlZHRG4xdjljbWJoVkNHYVg3?=
 =?utf-8?B?VkFJdmtOUFRLSy9DYWJDbk9Kc2pjUUVmZUw5WXZ5d295UVpueTNqM0tVS0VN?=
 =?utf-8?B?RzhpMm9aSWpZdGZZaW1NWDc2d1JPT25FK3FyOTJWN1YvTDZCaU44V3ZTVk9h?=
 =?utf-8?B?YURWMnRNSlFuTnBOUTZPd0lYcDNEaC9ZODFZVXU2QzI5TThncXMzcUVSMjhG?=
 =?utf-8?B?WFVHRGdtMnFocWlDaGJycG9kMFMrMmdNU1o4MWVDWlNOaGtIc29Id1B5cUww?=
 =?utf-8?B?VnNVRHRPSlY1bktNV3B4ay9sUGhYOHRkVldxUzZYeXEzZHRYSXBzZEVmWnZi?=
 =?utf-8?B?eXFyOGNJNll3eHJRTjRwODJ5UHNvd0hncFkvd2s5TGd4a1U1NTV1RFEwZ3V0?=
 =?utf-8?B?Uy9IRWFBeS81UFZiM3FuMEFyV2pSSjNVMCsyL0E2VlJSclFKYWxtZHlZZjYy?=
 =?utf-8?B?NXJPUzRQd3lrZ2FIZHd6cHJpMDdGWWxWc01CVHU4dWlVems5aHFFU3dQVEMr?=
 =?utf-8?B?NlFOTzBVWjZjR0FHN2N6VnJqQVdJZ3YxZzIxVDBrcWIxa2ZUcy8wSC9BcUtT?=
 =?utf-8?B?a0JaYzhQQXB3WlgxRkQvc0MzWHRzY3hnWmxoL0g2eUNMOHR4M3RKOXBNelZB?=
 =?utf-8?B?QXlLR0xiSVVxY3poenNrbzFJMWxEVytsOTQ3ZWxyeXovTVZKQWUvSlRCZGtR?=
 =?utf-8?B?NXVEcWw0RzdIWXdURi9sa1FJSkpPdXN1THppV0hiWXROY1ZDNDJ0UXUxTllo?=
 =?utf-8?B?UGNYRzhvbkVyeklBN29kQ0tucmNEZTNyMUlYeUNWeHAwanV0dmp3TEswTVN1?=
 =?utf-8?B?cWYxdkxiNEFRcWRGeE81cTJxWW5LWW5ENlpsdFlBYU1rc1VxU1NhdDMwb1ZD?=
 =?utf-8?B?a1VtT2FsZVVleFlnTDczZld4bCtFdzYxempPYU9TU1NMckZaR1d4ejVGSTB3?=
 =?utf-8?B?NjFkb3VqaWkzaUsxUjVxM3BZYnhqdTBQL2JsSEk5TEp4MmVVWVZDamlscWNw?=
 =?utf-8?B?cnpEKzdXekV3SDl3b0ZxSWFyRnpzaDhqbXFKQ0ZVYURWZnd4djFVYTltbW9B?=
 =?utf-8?B?QVE2RHlTdm1zRTdYSnFrK1Mza25DbTRZK1BYSzRFVy9UQkdhMklQSmU2dUk1?=
 =?utf-8?B?SDZBY1UvNXkxVHJYcVdLL3drQXpTd2hINy9hWXFTZHVqZjMyTUJabjJ6Q29Z?=
 =?utf-8?B?dDVIcnJQODAzUU9ORDhQVE90WEdRR2FyVy9CeXlMbGdkQ1hlK2s4NUEzSjlS?=
 =?utf-8?B?ZGFsYUsrMW5jNFNuY2wyc2pXK3V4SmoyUEVwbE1sZGtGbjR2aW9oM2VKcFJI?=
 =?utf-8?B?TWhsUG9lL2tiUlZPNXlYMUNFeFdnVjdOYW1TbWdhUCtxbUdZcVlodmVxckxs?=
 =?utf-8?B?ZG81SUFUSjBzbmM3a0ova1A2dWVCd1htRGNDa0pSdFM2L1JkM3VuaGhlRWh2?=
 =?utf-8?B?QWN2cjlENUJ0VHYvK0dRN3ZKdlcraVQ5NXRIdEY0cGdjK3lYaUhjVG5mcE1G?=
 =?utf-8?B?UWsvRzRybkxnTDRpdkVzNXFGTTNXQzhVZFdrQjZ3bjM2cG9waW50Qi83UUMz?=
 =?utf-8?B?RkhlcGZTN1ZNYjc2b0lna2o0MEZuMm1rNnUxajRWT0tmcVFibFNNV2F5MkI3?=
 =?utf-8?Q?gBuDrHoF+fWrD1EAxOLXsetFl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1beed9c-cfaf-4b1e-0b98-08ddd6ccca59
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:42:01.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0x1pWjvBdvG3sSG0ryKXdyCA0PfFZRuCGgXMNHsYBncPd6hx4euvn7cC6VmHZcCEUvWglPGNvX7Yq2jV5B/Yhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

Add basic v150* version register and auto detect IP version by read version
register, which located position 0 for both version.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 37 ++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 610f2debbf08f571a47f5372853d5ef10a6add52..0386d91522ec7b41694ac9c36ad0c3c37b1e68b3 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -61,6 +61,19 @@ static const struct dw_csi2_regs dw_csi2_v0 = {
 	.phy_tst_ctrl1 = DW_REG(0x34),
 };
 
+static const struct dw_csi2_regs dw_csi2_v150 = {
+	.version = DW_REG(0x0),
+	.n_lanes = DW_REG(0x4),
+	.resetn = DW_REG(0x8),
+	.data_ids_1 = DW_REG(0x10),
+	.data_ids_2 = DW_REG(0x14),
+	.phy_shutdownz = DW_REG(0x40),
+	.dphy_rstz = DW_REG(0x44),
+	.phy_state = DW_REG(0x48),
+	.phy_tst_ctrl0 = DW_REG(0x50),
+	.phy_tst_ctrl1 = DW_REG(0x54),
+};
+
 static int dw_csi2_reg_err(struct dw_mipi_csi2_dev *csi2, const char *name)
 {
 	dev_err_once(csi2->dev, "access to unexisted register: %s", name);
@@ -697,13 +710,31 @@ static void csi2_nf_cleanup(void *data)
 	v4l2_async_nf_cleanup(&csi2->notifier);
 }
 
+static int dw_detect_version(struct dw_mipi_csi2_dev *csi2)
+{
+	int ret;
+	int ver;
+
+	ret = pm_runtime_resume_and_get(csi2->dev);
+	if (ret)
+		return ret;
+
+	/* version is first register for known chips */
+	ver = readl(csi2->base);
+	if (ver >= 0x3135302a) /* ASCII "150*" */
+		csi2->regs = &dw_csi2_v150;
+	else
+		csi2->regs = &dw_csi2_v0;
+
+	return 0;
+}
+
 int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi2,
 		      const struct dw_mipi_csi2_config *config)
 {
 	int i, ret;
 
 	csi2->dev = &pdev->dev;
-	csi2->regs = &dw_csi2_v0;
 	v4l2_subdev_init(&csi2->sd, &csi2_subdev_ops);
 	v4l2_set_subdevdata(&csi2->sd, &pdev->dev);
 	csi2->sd.entity.ops = &csi2_entity_ops;
@@ -763,6 +794,10 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 
 	devm_pm_runtime_enable(&pdev->dev);
 
+	ret = dw_detect_version(csi2);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to detect IP version");
+
 	return csi2_async_register(csi2);
 
 }

-- 
2.34.1


