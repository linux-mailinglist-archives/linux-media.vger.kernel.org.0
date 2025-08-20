Return-Path: <linux-media+bounces-40386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB58B2DA83
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C5C35C6F91
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E542E3AE2;
	Wed, 20 Aug 2025 11:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SR21vx8H"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012038.outbound.protection.outlook.com [52.101.66.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B052DEA9E;
	Wed, 20 Aug 2025 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687925; cv=fail; b=P+1Cv6I631jDNifVlKx8O/am2MHfXNlFgTSFxKxQxBLJyLiKFclM8kRIlcHHd3Uk6pMn+6sg9o8MS98p//JBXIumfxYEkg5dtelACMNkOmgbn7RsJYdbG03krzBvdAmT6AdLCOOpsVlTuueX4yhesdTQgvZxw6j7PLbLrr73GxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687925; c=relaxed/simple;
	bh=xYUahwqOMZrV1mA/h4VfHlmc/xWoWjYA4NvSDVTgbxQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=C0g40BLPHn1sM06w6IDP7L/uykozcfi/lUZ9c7HpkrVBDM/Wm9U2nCEUzb9Wk279vtyN19ANX+cMypEr1roFCy3Z0xloyzu+TMvDxW/UC12kPfvXODGEj10zn87SjewOwfuq516UhN0rWfozb3ZFvebRwy7BnuQ3Pq4a3kmj2FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SR21vx8H; arc=fail smtp.client-ip=52.101.66.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmyalvTC1DYDwKZYJEg/l6sPtT45tHnH4FrQ9/Im/pP6Yt5QMQqbDzUIztAqr56YdocqoLZ9Sqj3JzGqhxUd2gt6up1z1zPil7BEn8Cf294Bqtopq/L7PAXE/nQ5ugou92H0Sz/39ui6IQI11eWqq88V8N+S/Elq+FoKq4VW8hBgr/cn+z2CHIc0ChgmsL1C8gwiySGVVQg68erDgAW6pKxn7rRgr7LdGU5vf8VdByut+TjlImlKhPUWKWNiby4JzP4gBJRz98agOJweHbb8/0xauSQ3VcdZuS6+9Fm3Dbsy2UBYckh1/Lz2e935dOJEvtIuCSfGdRTPoy9o3BsH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoPC+MOl79ZCB93aPt8pNHRHXA9c5uphZDzqri69c40=;
 b=TApUW68DLMw1W65EVSjbTwiU4nMX7CAl/lvoDCckJ9zQ5IfRwjG7YsBkT1p151HycLzOKVHmb36RaDZ28+hQh7zR+HIiaU19+Q+XiggeMlah88+XSlHqleYjONkbfzFREKtAvsyI4LO7Ivbsa7b8tr2zKNsex3c7PoXHwVnPJLzmb2Xmn/yIPNpSy6lP0AVCsKberNmQc3wxEoURJ/AGPUxwyf5OjQHKI0omXPvv9wh1LXcVM1rXPODlRalBGslDk8VrJB9Gk3EFgsleJ8/bGl7GizjuJtC4ZvaYAE42Ag46vNBBhYXN11Tn2L3k9bQUipXHWr7NecssSzqbpKZnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoPC+MOl79ZCB93aPt8pNHRHXA9c5uphZDzqri69c40=;
 b=SR21vx8HDiOJiuxXrvPX1697LiOS7IEffII+h6Fu4wJJl5/GfGo/QOcUv8dvZ/EQjxfqgW+OVqltuGMCd8chqB2uBuoZoW+8jaBQZLWLM3fZNCVn7ntqa2xreTBrr8h3PDORYNUe2a+H4sFDRwvDSjhOameSTz4ov/nlyOu3iir2kn/cJaUT2D2niyqrqLQ2Va4jZCZuFH5k2sxKNOtXTkJRO+FjqPzQb+BLD0lBlQNqMduSZHUnjte3hN9RsOarP+p11ZE1dC07YhCO2aXqzB4YxeTKTUSnqQ6b4ZJFUA9XN3EtKU5zzp/7Pa+zSpAlPpdel3/2+1Wmxe49SslDbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7594.eurprd04.prod.outlook.com (2603:10a6:10:203::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 11:05:20 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Wed, 20 Aug 2025
 11:05:20 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: [PATCH v5 0/4] media: imx8mq-mipi-csi2: Enhance the driver to meet
 more usage case
Date: Wed, 20 Aug 2025 19:04:55 +0800
Message-Id: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANerpWgC/32Qy27DIBBFf6ViXSwwDB66yn9UVQVmJmbhOPFLa
 aP8e4mbvjZdXmnO0b1zERONmSbx9HARI615ysOhBHh8EG0XDnuSOZUsalWDQo2ynXL9mvsz9ic
 J3joL3iNgFIU4jsT5vNmeX0rmcejl3I0Ufjtq5TWCq7QyTjdKarlfhkNeqvduWHbDNFWH87Fqh
 /6uHOm0lF7zp1ccw9x2pVUpqTDWENkpzXVSzrN2RR1aa7G2xDWRaZOFzfNNYbQqcrIBOTQmmnK
 fwKDyjFiMAUKypmF9o2KYSJYmfZ4LyBDIqOR8asAaIlKpUQpNCmwTIZOGBAjiNr3L0zyMb9tfV
 7sVv8/3f164Wqlkq13UCUuB4Hdf42+WFf4hoZCOVeBgyk7mH/J6vX4AvYq6s9kBAAA=
X-Change-ID: 20250818-csi2_imx8mq-59464599858b
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755687914; l=1902;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=xYUahwqOMZrV1mA/h4VfHlmc/xWoWjYA4NvSDVTgbxQ=;
 b=Tqk38Kv0Df5lNS/ZeZX8dgCsfZohwK+L9S6YnJRZABUdLuBxKsWsMg6VQTTdYeEe0hqA2DQle
 H8fQG+HX7VpBUAhaTLITPXbyvvawiz5dT+khpHL3/CbbPW1fUGPLMeS
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBBPR04MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c67ad3-5d6e-4f3a-3e5c-08dddfd97408
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|19092799006|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MnZJR283N3lYTVFTUXZ6eDJYM1NsR1pCeE5oYXRvclh5eTJ3QmdWN294QUM2?=
 =?utf-8?B?YnBHS2tBdm54S3NETzVsTjdKTXlXbEN0aHdqVnRuMzh5NFdUaWJCd0Rxb2lN?=
 =?utf-8?B?ZWdGT2V6WFNsUlhUTFhrWjVvTVdFbWl2bFRHYlV6dGgvNHJHOCsxeERPWEg0?=
 =?utf-8?B?R28veTljVDB1RXMrSVNiaUlZVGw4SGNXSjRNOEtlbWpPTzdUY1pYS1hJNXRq?=
 =?utf-8?B?aGh1OWIrTER1ZkYvbjJPWUE3b0d3ZFNaK2l4emhjcmlFcUhuT2R6YnFPR2RO?=
 =?utf-8?B?c3pWbEYwY0c4V1FTNFpyMU9wQTF2WHhrYnJwb0Uwbnd5Y21sUGtQZGQrbWZH?=
 =?utf-8?B?TUxQQXNsNHI0Q3lpMEVKV3BndFoyTXpqRG9DYURwNTJyeld3ZVNaSUdkMzJY?=
 =?utf-8?B?UlE2ZjRwR002dmhGc3E2L01aVlFhbEdENTNNSDcrV2tpRUVCU25XT0prUWxl?=
 =?utf-8?B?Zlo0TWhMTm9veU4rajk1VDJqYmdJK2pkV21nQ09oRk5ybTN3N0l2RFZRK2Nm?=
 =?utf-8?B?bW1RSlVramgvTm9ONUUrd1Fia29WSHlIMnY5UkR5VXArdzhSbk80NGJjMS9S?=
 =?utf-8?B?b2htSG9KaTE2YTFJK3ZuSzAyZ2NoWjBmL2FnMHhqeWpiRjkzdUQ1VkF0eUdp?=
 =?utf-8?B?bGU3cVk5QkpzQWdCOVZWYjZsOXNiVGwweHBzdUlZL3lhRU5kZzRZOCtob2hS?=
 =?utf-8?B?QTJZY0pwR0ppeHFYaW5TTU1KdEdjNU5FMWxkWXVTSVNhNlVlTVU5bFY4Q29Q?=
 =?utf-8?B?VmFtNENGRWluamt6T0orazZlOTZDTjZzVlBYR3NjdVVETEJkZEVpNU9yVURz?=
 =?utf-8?B?R3QzVk1BczgxK3FZcmZmeVBOcloveWpnQmx6UjhaTUlHY21uUmt5bVJDVHU2?=
 =?utf-8?B?TnNpNXQwWWZ0WDk0dlZzcDN3R09ZNGNpVmZiYXNLOFRiQllLL3NaYW5JWXBm?=
 =?utf-8?B?WUtocmROL05LREdYb3NuUU1hbENka0pqVVBaakowMWlEbnAxa01LV2MzWU1C?=
 =?utf-8?B?R2o2c2pOYWhUMU5YZWROa1RiVTFraWYrNmN5bFAvQm8zV2VDR01pSmJLeU9v?=
 =?utf-8?B?YkduRjVaaWNlSG5FMzBpWkR1dWJWTWxrbVZtN0xrK1I3ZDlpMDQyc0dzdHVo?=
 =?utf-8?B?eUtZYlZDdHQxNDNVeG9OWWtQdmVTQ0loN1VWbVBER0lTRWNQOThlK2hFb0Vk?=
 =?utf-8?B?dWdDTkxBV1ZQS3pvYXA5UkZoWndLa2l1OEVDMG1ldllxYzVLT3p2MlMwMzhu?=
 =?utf-8?B?WGtJT2VnY3NIY01HU0lEVnhPdWZHMFA5Vk9PQ0dFRkk0SFBZYmF6amdvalY2?=
 =?utf-8?B?ZTg0TW8zRjhRaEo2SWpIOXlTV1Nzak1zTVpnanV6YmZzY2dUa3NnZjJDVFF3?=
 =?utf-8?B?R2dSV1VFY0dSdGdPZUViblI3UnBGWHhWWWk4YVkxWmI5YkZPNjk0VXg0QmQv?=
 =?utf-8?B?bEc1WDN6eWdzdjFJc1JFZ2ZCb3JJSktwNzhadmdoajRldEdWVTBTczUzVEEr?=
 =?utf-8?B?ZllvZWMvbU42a3Y3cHRoTzRzUkgvMFNsSmtKVndtT0ZNZE9hQ1M1RC9pUXJO?=
 =?utf-8?B?a1pvOC9FZnhvZmFoVUtoajRxSEw4YjNpRnEzWEVxc2pXekVHY3Q1dmZsTnlv?=
 =?utf-8?B?U2dhVHMydU5lK0V2NlNVQXBpRTB0OUh1TGtNSitzbWRmakJ1Q01qbXJtQUda?=
 =?utf-8?B?M3FFMFA4UWxGN0pmYmJkQWVzOTV5QXNySm9VOTBNVWV1b3dnUFJjeVBSRVlE?=
 =?utf-8?B?Z0czZU45Q3kwMXFPZThmOWRnV1BqWWJQNkh2SDR2VmJidUtSaTNWd1hIWm40?=
 =?utf-8?B?KzM5Yk42ZTg1NWtkN1lXQ0ZBTEhqUVZTRmQxVWVWRWJzSytEdjdKQWZkQ01q?=
 =?utf-8?B?VDdGQ25GeC8wSUpMUGJHaXVOUEkxSHF4em1sMWZJaU11di9icnpQdDA5M2dD?=
 =?utf-8?B?ZXVqTVp6dXN6TGpGdnh2QWpieGZJMlVCUWxLaW9QdVhCN29uZ0RkRTBtb1RH?=
 =?utf-8?B?ekdrakQreEdhTGd1eGw3WDJ3WTgzUmxBN1lxZlc1WlRGelhCWVd6SmlZaUk3?=
 =?utf-8?Q?oS5lJ7?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(19092799006)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cklpSXh5Tk1jT2hjTzU0M09PUUZnT0dkWjRhbFFyNk16NnQ3dXZ5cHdwNVdH?=
 =?utf-8?B?cSszK2xTOUEvNjdZK0VRcWNwYzdCVzZHMVJqYlJvbkpTbkJURUFYNUtGQ1pM?=
 =?utf-8?B?TGo0OEFTU2x5Z2w0M1FXZlRiV2NlalZPYXhOQUREZXJRTHJaNnZOUWVJdnpF?=
 =?utf-8?B?Vm5TUE5jT3ovKytJdE5HbENGK0NnM3VIZGVmcFNXejhOOFE4V3dVQ2ZSdk03?=
 =?utf-8?B?NDltWTd6Sllxd0FYU0ZEYkZMUmtrakRJaHpCOUVLZ1JEd3VjVTQ0RU1HQ2Jl?=
 =?utf-8?B?WTd6MXNRMUpaWmMyelErNVB6OFVSdXpwTDZNdHhQUHdwTGtZUVF3MG1TT2pI?=
 =?utf-8?B?OVVMUllaaGxSZFYya3FaRXJXYkNBNkVVTTd1c25iSmRSaFZ1ZjJKb0NWSzJw?=
 =?utf-8?B?U1d0bkJjM0o5WGJSNDNTMVpaZm1XVE4wa0NFZktveWJmbHdyN3IvYW5jRjJk?=
 =?utf-8?B?YmRGMjZyeDlWaE0yamEwSDdoVW9HWGRScjNIL0ptSSswL3dxNFVacUVUcnFW?=
 =?utf-8?B?cFRxTTdLSi9zZ1Qva2V0SldBTG5TcjNwR2ZFZytEL0FYMlkzYm41eWhqZXhr?=
 =?utf-8?B?S0FjcVYxL08wNGFXYVQrcFRiNExESkM4cEZ3Y2g2QUVqWGlhckdqV1Z6ZmRU?=
 =?utf-8?B?N1NYN1gwSkVDRVhPc0JhbEtuQktlQnpoRnBFM1ZJeGJlOVVyc2RCRkhaVG1H?=
 =?utf-8?B?TElyWE9lekRzdk0yRTJVNWp6UkdrTXZDWi9ZYWFqdEw5NUQ4dXVPTkdLbk9y?=
 =?utf-8?B?Nk9xazlROExYemE3bm4vT1VNeGVOSkw1aE9VR2VBR0hRdWYzUVdiOWt5ZHhs?=
 =?utf-8?B?WG4xNXVoQUU1VXlmT3BJREdScEJHV0ZzOGlQaldGbncybU1EWFMwbjlnNG9P?=
 =?utf-8?B?ZTJrdVAzcDlaZ3Y1aThNb0ZaTW5sM1dKQkdlOUx6MHVFKzJ6eXFKYk5rc2cz?=
 =?utf-8?B?TVN5RW1iRTFwb3E5ZlZsaXBCaFJsbXhsWEdMeHNsZXVKNWV5bGk0eG9zcm1T?=
 =?utf-8?B?Nml0NHo2VVM2NHhjQmVKTnpRVUlWM2V3L0xwOTVKbFVSTzMrZmlBTmR2YmVT?=
 =?utf-8?B?bDF6cWZNU0dweG1HS21wV0ZsYXVjdUVObmkxYTQ5T1F5Umt6cVJoUXNiMUF6?=
 =?utf-8?B?a1ZndGM0NmNOanpiV3NocU93OExKZG1oeG9OYTFObjIzazJlbG9pTGR5Uis4?=
 =?utf-8?B?T21YdVN1dHZQM3dDODAvWGY4Qm45ZVoyZFYveXVZU2k5SWNnZ1VVNE10MGkr?=
 =?utf-8?B?dUlIMWtWWlZDTXpqT3liUktvSDBTMWVvcVN2Znk5cjFKRTA4Z01qZXI2RHRE?=
 =?utf-8?B?aUdIbnJDdnNlT1BLcTg1STM3UEFBWmlzSjdFMDYvMlc5Y1M1OGREOFpTZFFV?=
 =?utf-8?B?Ni95Y2V5MGMyMXZJcUtVdzdObFdzbmo4NnN2T01Dcjl6M3lZaFFxdmo4WDVS?=
 =?utf-8?B?aWR6c3MwVmYrcmFyYXA1c3c0akFaY0d5eXlTcEZJOVM3UXNyVko5SWkrZkdK?=
 =?utf-8?B?eEZIeFp2cFRjUTM0aTJxUjVPRnJLam5acHFWemk0NFpwSGlnZ2Mzcjdia1I0?=
 =?utf-8?B?SHBIUjlINzJCQ0N3SEVIRitjdGlvbURxUTY2bjJHQTE3U1BlcVg3TlBCNXIx?=
 =?utf-8?B?NVZ5Yk1oVEZrQ2RPbTE0akEwdWx3MVFJVW5iTFVOcCtwdWJiUWZPQ1NYbTha?=
 =?utf-8?B?d0VGYnRHQy9IWFUyVUppY2lQZ0R2OWw0L3FjYzlCV0N6RExMRHV3QzlFSE9r?=
 =?utf-8?B?UWxMWThKOFR4VzkvY21jNzFOQ3g0SEtqTmdBeC80Wjk3RkpBRjNJcXlKQVNh?=
 =?utf-8?B?UHQxN0lFejhCMXArUERrVTF2L3ZrVTRnellQaVpETGs0UHRPMWZleFRzQzBV?=
 =?utf-8?B?bnl3OTRiM0c5YUpOb3Q3SkN6N1Juc0dlWEJxUDJweHRIbm5YY1h0L3lJbTFX?=
 =?utf-8?B?OHg3MGs0U0RPZFpaT2VEa3hBaVpaTmpLa1VTY0dhSDJrREJNM2lGb2NCVHp2?=
 =?utf-8?B?RVdkd0R3TWFlZUVjMGNpRFV4K21NYzhINWtNMWFXNFBJQkpkZjhhOWF4dVdY?=
 =?utf-8?B?dFFHMkFKZEJGK2NubXNpZ2dGUGNiUkRKNkx1UHhEVTI0UTN2bW8xZERtQjNO?=
 =?utf-8?Q?DyDmWQomzPAOMB3s2yAI5Ny/Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c67ad3-5d6e-4f3a-3e5c-08dddfd97408
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:05:20.5936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Asf8Tt5P6spWjNtZWsfsuuzFKcFVAzV3NjElhmXqitfhTVCPdgva/6JnHx3LI4tfg2x1lcDqb4lcN7TCyGjMyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7594

The bellow miscellaneous patches enhance the driver to meet more
usage case, such as i.MX8ULP.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v5:
- Add dependencies for patch 1 and 4, as bellow:
  Patch 1 depends on https://lore.kernel.org/imx/20250808-95_cam-v2-3-4b29fa6919a7@nxp.com
  Patch 4 depends on https://lore.kernel.org/imx/20250808-95_cam-v2-4-4b29fa6919a7@nxp.com
- When .output is 0, treat it as the same as .code to avoid dupicate data.
- Link to v4: https://lore.kernel.org/all/20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com

Changes in v4:
- Remove patch 1 in v3.
- Add two new patches(patch 1 and 2).
- Use helper function media_bus_fmt_to_csi2_bpp() in patch 1.
- Use helper function media_bus_fmt_to_csi2_dt() in patch 4.
- Link to v3: https://lore.kernel.org/all/20250812091856.1036170-1-guoniu.zhou@oss.nxp.com

Changes in v3:
- Modify cover letter file to include history info.
- Link to v2: https://lore.kernel.org/all/20250812090843.1035800-1-guoniu.zhou@oss.nxp.com

Changes in v2:
- Remove duplicated Signed-off-by tag.
- Link to v1: https://lore.kernel.org/all/20250717071359.1910515-1-guoniu.zhou@oss.nxp.com

---
Guoniu Zhou (4):
      media: imx8mq-mipi-csi2: Remove width field in csi2_pix_format
      media: imx8mq-mipi-csi2: Add output filed in csi2_pix_format
      media: imx8mq-mipi-csi2: Add RGB format support
      media: imx8mq-mipi-csi2: Implement .get_frame_desc subdev callback

 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 72 ++++++++++++++++++---------
 1 file changed, 48 insertions(+), 24 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250818-csi2_imx8mq-59464599858b
prerequisite-patch-id: 508b25bf601f2d069f16918ac44824ef2ee3cd45
prerequisite-patch-id: 8b40bfd4a8fa73b38acd53809f88508a5ad437f1

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


