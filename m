Return-Path: <linux-media+bounces-41216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFABB394D8
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 09:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBAB9179F10
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 07:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54DD27A477;
	Thu, 28 Aug 2025 07:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m5dJhACe"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D169430CD89;
	Thu, 28 Aug 2025 07:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756365516; cv=fail; b=Yjvongnjswi43tmgMBFipiC7fUBDSBHdig8IxO9pvB/z66LmNSJXcW3kN2eoL3Gg+An4m+w8M159Az1QL3J/bpfJ+fpJw8iT+MfAzrPQg6cRrgD3fRwpUSClOyElOJnHDe7/dCkvt+wbK+7AGmk7dCSKsfq+ywB2PYdZ1SwlftA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756365516; c=relaxed/simple;
	bh=a5K7/d0VITyEGGUvWD/ikNwgKr79tSW5x+AyR80kuvY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Tjl6Uta8/R/PVvE5T4z6D/lE+aC1gb9J0OCQ/WRVaOWBc+SVnzBV1oOeIDAesY1PGOVESz8hpvsaFJ44AK8m6luqM4ooFjMmOp0TmHhwokvjfsKMRvkVrF+OeeTfhEx7CAgqvvYYUVCh3joASbYY7SoJzZ4LT9YgUSjHy7K9NyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m5dJhACe; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tj4xnlFI3GWO5eUxLcAD0B8hUPptWtsAL5gnhw05lFRNTpvdHppgSgnJjOA70en9PLX5rLrOh0NUW+92YI1D1sPCx6GMdmGFJ21EHFhgmser+z8omxNWoqj/na4b4BpiQgrcL17xDkx/bxxAYjynVy4NBKEiKl9Lk8VlwP8KfVLJyXNINqGCddPsK4pj0m2H8+Wd9wMx/KysoRJvarWTqIzk5COzyb2oLebTDVHkX6Gem7Ay6YedTWKP/wzFEHaXdHQcoEpzXK4X3+gIKwtxD2FZ9rL2N5+YNlTahxU/a8qnxP0wbHh7ceKVVQ1Fq+NVneNeBmQADwILucC49dc5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbveS0cd5ZPvPtW8WuK87Ns27nhvSY5P++Y6lKOeZ78=;
 b=h25iGeiL7WTgAwUmhI+wQu0bN9nGGiJwflC7za6Ppr2jYdPfhtlTap+XipV8khtXcV13LOHiqQ8dJ+IzFmlPDHiGRxidNvdlrqlGiyN2KTJdGbS3rTWaB9Y9zNO6Iid6Szlbt0NzBONET8EQBb1yzdlsO2OHw9v5vPYWokboNr0WtJ4QBNHgpILfpGHutVeckYMRdPOUlfQ0sXQ+lvJUQ26DMO7+ZK7kPtZf9bsLFelvbod/+VP9BgGnVl3wjXG6TP+DD0+Rvs3TdJMEadiE6u05YJ/veiSVK6u/3IJ5N67djbamXinmkV718AOz7o3oMO4akrhe6GD1A0GFSHcHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbveS0cd5ZPvPtW8WuK87Ns27nhvSY5P++Y6lKOeZ78=;
 b=m5dJhACeZnKtpx/tRM3hx0gg6mOUx0Ix+5oDAeokz983rfmXCw7BqTumLHNT19YDK8ASHiAsOMPRhvEmY9Bl1KKp+FH4PKuZnMq6cnSBb8+v2SOuLA6258Bd+20TVRjqItdUtyFW7pi44yxrjAKff6LEs43ZYr+n5/ZO1mEoNm8A5NXZZ6HEEZEMBj8apt/WuijTUhYChQ/TdaW4FE6CMK8GzCC1BEyQHBjC10xnVplkoP+zDzt20ibIzeLsmlIwLvLLO5lBGz5eaWku20qZs0nroe06szqVKkujcPsm9JlKxCLmS1FQklLnPX3l/8YYUPHm54aV8ALA3TI/0FbpSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB6785.eurprd04.prod.outlook.com (2603:10a6:208:189::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 07:18:30 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Thu, 28 Aug 2025
 07:18:30 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: [PATCH v4 0/4] Add MIPI CSI-2 support for i.MX8ULP
Date: Thu, 28 Aug 2025 15:17:32 +0800
Message-Id: <20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI0CsGgC/13OSw6CMBSF4a2Yji2B20daR+zDGFNokZsIJa0Q1
 LB3i9H4GJ7B/+XcSXQBXSS7zZ0EN2FE36fBtxtSt6Y/OYo2bQI5iFwVmtYR4YjdrMbzQLWtmJL
 Wyso2JCVDcA3OT25/SLsJvqOXNjjzjcAKAcuKvNCMC1rQ0+h7HLNb68fSx5j185DVvlvJFuPFh
 +vz4AQr/GIAfr9MQHMK0nDOmeZaivKtrE8m9p2Kv5SllAmlhKmMhKr+pMuyPACrGX74JAEAAA=
 =
X-Change-ID: 20250819-csi2_imx8ulp-9db386dd6bdf
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756365509; l=2073;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=a5K7/d0VITyEGGUvWD/ikNwgKr79tSW5x+AyR80kuvY=;
 b=f8x/zKubFwW14X6G85snj2cyvMPTsDBe471ocuiRK77QrTDIKAX4vfL+mFJeUFgJkT/Uzgdxg
 302amCOFrAaCKMOQWg3q/aR4jJLRSzUfApIVsQ/3gr/1JmJTARvjrkA
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM0PR04MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: adbfca4f-7636-4128-7077-08dde6031704
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SnJsSWt6ZjBXYkJlYzJSSk5RaSt0N3M2VmNZL3BHcGZ0K3RsV3BvakV1VEM4?=
 =?utf-8?B?NkRZMlNtWVl3bmVCeWZ1dkQ2cmN1RmRNNGwzU2VWbjVVQnRwWUo0Rm5GRTNn?=
 =?utf-8?B?TGNpNENBTWZidG5WWm1qUjBSMHBwOGtLZlMwYS9zRnNGOXVJSXBFbHhWNFJP?=
 =?utf-8?B?dW5ybVhnSExKY0JWejJLQ1o5MHJFaExQRzdtRDJhSXpjOVBSZUNRdjBCWnpW?=
 =?utf-8?B?ZUM2Y1AzM1VGNkpwY3JWVzc1MkdUdU1WOWQ1N1hPSmFFWnJyNlE5Q2E4RmVk?=
 =?utf-8?B?QmxNd1dmRlZ6MWxqbysvK0hQbytwbXM5SktuakpUOFVkWkduMGtHSytBQVo2?=
 =?utf-8?B?OC9CbFh0bFovUWNtMExWMGZyVVNrUG9OdmNVeUcvUXNVTjJ0bkVlS3J1R3hZ?=
 =?utf-8?B?dU1BWlJlbzRla2xMdzg0ZjVVbUdadGZCM0pybFI3WkwrZUpmRS9zL3JJYk01?=
 =?utf-8?B?ODExa3hqS3JTR1NZaGlYY0pndmVURVNZZXppVXNEY213bm16d1dEc09VVkN6?=
 =?utf-8?B?aDVpZGhzRXpYZ0JWbUNVTnp1cEJ1UFY5K3R6cGpscERMV0kyU1hTQmpyays2?=
 =?utf-8?B?N2NWNEduTmt1MzNFMkZ2QmQvaUNZOFNaVDY4aDNOQjhoMG1SRUlGL1pLYmFE?=
 =?utf-8?B?MnpydTRMemV0M0JJT3hyS1k3QVRIakpDVVZCM1FQT0JhOXhEN3Vqa1dCKzUv?=
 =?utf-8?B?ZjFCZmhGR0pIZkl4d09XanVEWEt1OFRKd3lXcXc3RFJaU3dqY1Nyd0JVUnl6?=
 =?utf-8?B?WFVaWmVmeTBZZkx2MDBrTzdoc2VpbDBSaHVPUFU4a0Y1VXltdnQyeXJsY0xR?=
 =?utf-8?B?U1NrSHhnYW5EOTZRcjkzbGZRaktuSW1DQ1pGbDNLS0p1dnN0NURHRkRPUGI1?=
 =?utf-8?B?bDBKQTBYYUxzR2tyZDRCZUE1L0ZYYU1zL28yQ2toSThOL1dTaGpzOWpWdG5L?=
 =?utf-8?B?Y2w0OWFwVFZhbExtdEJzbVVQd3VhbmNhNFlLeStWaU5zTTlYTDFkQXhCSlFk?=
 =?utf-8?B?bEZUeU4rRkQ2UnBIb0pWcWxaYVhoSGZodklDbVcrc1VweEp2QWxyUHJ6RGNj?=
 =?utf-8?B?L3k0VllkTGQ4a1JuQkVReXNKTTVpTzE1ZjZnV1BsYy9RcWNTYzNQZTNpZ083?=
 =?utf-8?B?anM2blE2WEF4ZForV3psWU5DMTBUaGlBTkhUQUhmY3hLYnU4VEp5dDYxa0FO?=
 =?utf-8?B?RHNuZ1RGWmNtZjlwZWQzUkdrbmtaSzBibnR6ank3SCtWWGhTdEY0eld4bGpn?=
 =?utf-8?B?by9pWHg0bDZUVGxSMUFGd3h6bUIxSnBEMDRGT3lrU0JuLzltNkRFV0Z5aWNJ?=
 =?utf-8?B?MjBZVnJ6T2E4cEY4SHRBZGNIQmZYQzM1WnNzZUp6bzhsK2JSSFYwdDlFekRV?=
 =?utf-8?B?K3gvcDlQazNzSURzZGhObzRkcjNIdXUrYkR4VkJVZzNMNzRqTmFvVzdZTDds?=
 =?utf-8?B?S09lSHJ3MXNBdDU4dlp5VXAyTGswNzBJZWI4eTVPM08rM1Byakx2TnFldFh3?=
 =?utf-8?B?SE51Z2srcFRlTzBKa0FQT0FmUkdIeC8zVFBuY3l2Umk0b0hZQTJBYVpzb3JH?=
 =?utf-8?B?MFBvREczNDlvV2hQWFFKM3h4SU5uMHhXaFZ5clJ0T2ppQS9EVXA2cUpaRXhv?=
 =?utf-8?B?Tnk0NEVIUTVlMjl6Vk41QWVQUUZNejhQYURRcnpkc3JIYmxjV1d6N3VWek5S?=
 =?utf-8?B?WFA3VXpKMjRxbC94aEptS29hK0FjVHhEVWkvQXF4dE5Vb3lnSWw5R0tUK1A5?=
 =?utf-8?B?RGphc0NYV3FpV1VUUGVtMm1lNVhKVXgxWjNYUnRmVWFrNzB0ZlVkWG5GYi9s?=
 =?utf-8?B?Zk9oS1NtSnZUY1FlSkJVUFZMcGw0S2NkOGhrdWU0dG1BUWwvTUJLRlNwc29r?=
 =?utf-8?B?NlpoT0o4ZXZPQ1Z4Y0MvWTd1dlpMZ0lKeHRSc3Z2bGxOY2Y3bTRXYUtIUDVF?=
 =?utf-8?B?bmVFNXNFSXN6OWk1MzYyaVdjU2p2UVZ0NlV5cGxpRTFoYTZyY1hDYXJoVUNK?=
 =?utf-8?B?RzhpVFlJMHZvcWtKaG9LNXBMMkdlV2s4SCtDblpHWFVMZmlSbDFURmg3VGM4?=
 =?utf-8?Q?vSkqeQ?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RU1OUFhUdXpWSlNpblB0YzFUNUIwMjZBeU5aclEyZmFIaGNodU1ScjJHWkwr?=
 =?utf-8?B?K1E0elZUODBxYTd4U1lBUXNJRXp2ZE1pM2lzY1dydUx4SEhhbDBUWWNmSTVE?=
 =?utf-8?B?dzdNNnI5L0ljdWxYdjdCMjRCVUpUZXBSMFQySHZIdStkcUk1QkV4dnZQeUdK?=
 =?utf-8?B?bFh5UjZnVmU2dW9yUjNxcmloZGVtTWJjcGNKbm1GaGQ3YllISi9KT0h4Ymxm?=
 =?utf-8?B?amZCcDh4elpoK29PWGxBL2ZoSjJodE8wNDRkL0g1Yms2bWw0U21CY3BGQlJ3?=
 =?utf-8?B?M0JmT1dydUZRZVY5bkhDQTg4Y1JlNFFFZzE4UHVaVGFpUktuT0lFVStTbFps?=
 =?utf-8?B?aElRRm8zS0kwbWJRdGJLc3l1MDNYdksyL0RxV2RhcUxjS1hNQmZSZlBNdno1?=
 =?utf-8?B?SUpESElRdUdyZkloakJmK2Vsbnh5clczL0VSQTBtWU1DZ2tTRmRsbEpZdHZz?=
 =?utf-8?B?dW9OOG1xU2xTT3FQS2k5Qm5uMDc4bG5TbUFXOG1BUElkdGZrL3BoK3ZYT1N3?=
 =?utf-8?B?QTV3OXZHaFk1V1NmV3UxOVY0ZHNlT1FOMlI1OHFnY2g4SG9yQVQya2FYRkQw?=
 =?utf-8?B?a0NjUWYyVkp3SjdwU3Uvbk1uSVhiMWxzVFdpWlVBVld0NUxEK2RicE1lZVJX?=
 =?utf-8?B?ODBlenhXZ2QwK3ppZWp0NXFBZExvTmtmbHN4aEk0WmZ3UUpSUDhFUGU4M2hz?=
 =?utf-8?B?TnpmQm02RkhXY3BlMmdUY1F3eVR4MUNzaStZYVdxRnlNbnpXd3F4QTU4Mzgy?=
 =?utf-8?B?TkZ2VE82TXRJUU4zRlNkT0k3RlRPNFNqQW9RL3dDSUNHaERCWjJBMS9rMmNm?=
 =?utf-8?B?SHBQTmsvVm5zY2xQTEdON24zenM4WjhQOWZDajUxUU1MdDdRaTEzd0FzWUNI?=
 =?utf-8?B?MjF2cGtwMUVzRERhU1dKcW1DVXZQaEhISHI2WDk0clF5S3lNWlRXSVhWZWpD?=
 =?utf-8?B?M1pUM09KV25GYllLMWVCMUdhdGVxR0MwbWFwUjFNSlM2am1rL2twMjAzcUZ4?=
 =?utf-8?B?Z1l0bndDYXBxTjZBSXVyVlozYmh2NnpmNloyRG9wcmxBSnZPUXZ3ckEwcHlr?=
 =?utf-8?B?OVNqUkRNN0FZeFp1eHhZRTJhLzB0NC92c1ZIWC82cW5CTUxiNE4zTXFseFJD?=
 =?utf-8?B?dzhkMG5PUTV4Um1IeGRWbjl4TkRPL3V0Q1U2MEdCV1h0YzlrblpOaDdQSnJr?=
 =?utf-8?B?aUUzOWViczl5ci85MG8yQ3BpSGNsbUoyN0YwcFpKbUZLN05TUTdnazR4T3A0?=
 =?utf-8?B?eDNzdnhhNXBBVGxsWnFMREt4RWdBZlFONTYrWk5pNG1xaUpSRERhbyt6TUtE?=
 =?utf-8?B?d0QzYW93Ykk3RkU4bTZwMFVvaEEvS0xrSnpvZXRrTDhnd1VrOGtFQ0lCWkh6?=
 =?utf-8?B?QlFBQXFNZFpTbzBlQmwxcjVKWXFrTGY3UGhVVm5XY0Z4R2Z3RlFaS282ajFM?=
 =?utf-8?B?OU9ER0xyV3lSeVVFSWYzc3k2WS9PRnhHa2NDdktjSUNYY1YvamFoNDhpUnlM?=
 =?utf-8?B?TEdQdTdwekpoVkRxMDRJY29QeFB3eWp1d3FxVXoyRm5EUUJETCtGc3ZkUEZj?=
 =?utf-8?B?cGlGczUveTlFTjlsY09nRDN1RWRFV254Vi9GSUNIcmtlTmxiM1FScVJVVDZD?=
 =?utf-8?B?Sk5rQkdNb0duMWJidlB4aDFIamFIcGtGdkROdThZaTF3UGdwNHRCYm1henhl?=
 =?utf-8?B?b0pnYUdxSkJZUytEcEl2bXJ6OEpvK1VlZ2RScDhWOUpuR05wZjY1Y3NwTXUv?=
 =?utf-8?B?OGtRTytuRTZmTTBWS09WN2xzaDNvYldZM3ljb3lHeE94dlVEaHFNMDJrUmVH?=
 =?utf-8?B?QUY5bFlZS0dtcjNqdXREWXZkZXM2TlJFa3ArZUcxWTExV0lDcStzTHZnM2tV?=
 =?utf-8?B?Tm9zcE1mRkd1LzJYWGhEYXRLSEdSY3VPRnJsYkptV2J6TG1MMFNOS3NVa3Vv?=
 =?utf-8?B?VlB1NDVoRGNOaE1UbDd5R2paajhDcVRuTEUrNXhiMFRBd09wb3k1TFdtWG9v?=
 =?utf-8?B?b2ZOVTI1bTRCcUowbmJHQ0l4dDNJc0tIM3VNS3dxV2ZudmNpbmFrckkrU3RZ?=
 =?utf-8?B?OU9oMW5OL2NSc3V4T2FyampxK3I2ZnNmdkNUTlFSR2MvOWtPMjhKV2NzTzRO?=
 =?utf-8?Q?GbNwwFxzAoroUCNZ6b82aPKMW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adbfca4f-7636-4128-7077-08dde6031704
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 07:18:30.6592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzwpeeBnBjnjTRu6wYxWVpeGuVTSjH0XC6ua3bBwk8mt+y66Hb8QyjK4cFn0Ov0ZFK52Ix1VuFhYPR6/p3WHtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6785

The serial adds MIPI CSI-2 support for i.MX8ULP.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v4:
- Change csr clock name to pclk which is more readability.
- Add restriction to i.MX8ULP and the other variants remain the same as previous versions.
- Update commit log in patch 1 to describe why add new compatible string for i.MX8ULP.
- Link to v3: https://lore.kernel.org/all/20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com

Changes in v3:
- Correct the order of "fsl,imx8qm-mipi-csi2","fsl,imx8qm-mipi-csi2".
- Correct the order of minItems and maxItems.
- Restict all variants.
- Change pclk clock name to csr to match IP port name.
- Align description about csr clock with IP datasheet.
- Add reasons for adding a fourth clock(csr) in patch 1 commit log.
- Link to v2: https://lore.kernel.org/all/20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com

Changes in v2:
- Add more description about pclk clock.
- Change minItems/maxItems to 2 for resets property.
- Better to handle "fsl,imx8ulp-mipi-csi2" variant.
- Move comment to the top of reset_control_deassert().
- Move dts patch as the last one.
- Add "fsl,imx8qxp-mipi-csi2" to compatible string list of csi node.
- Remove patch 5 in v1.
- Link to v1: https://lore.kernel.org/all/20250812081923.1019345-1-guoniu.zhou@oss.nxp.com

---
Guoniu Zhou (4):
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8ULP compatible string
      media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all() to fetch clocks
      media: imx8mq-mipi-csi2: Explicitly release reset
      arm64: dts: imx8ulp: Add CSI and ISI Nodes

 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 46 ++++++++++++++-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 67 ++++++++++++++++++++++
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 60 ++++++-------------
 3 files changed, 128 insertions(+), 45 deletions(-)
---
base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
change-id: 20250819-csi2_imx8ulp-9db386dd6bdf

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


