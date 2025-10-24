Return-Path: <linux-media+bounces-45479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD26C05697
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16A124EDB94
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A8E30E0D8;
	Fri, 24 Oct 2025 09:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YrokGKzF"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D59A30DED9;
	Fri, 24 Oct 2025 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761299213; cv=fail; b=HlLnORw6nPXuAbjvUdqiiNmY4qwAC9Ls9l5MNMJLfX5TuM7xpV1A1SMkuCn9Quio1J4KDSScvijAy3aP825fJXLJsICKkhRDSZKVlODcgM25Xfvj9BU6i4RFt7i848FaBU/gYp0ZvKQirH1kXClzukqrU1eNr0saqoYcOK60KaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761299213; c=relaxed/simple;
	bh=LblHI0kLgtlzpbew3ecEp3wXkW1OVYG2+xp+zgiT9js=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CuknHJ5EbJGL6IHg3Z4x3cj2FgjoK/hdmSGpMvSZVXPzxlVOsOKGA/1E5oxVK1MJgrZUZowpsMHOdYk4MVxVhdm3wUpbnK7l1riOz/gkToH201wIEL3678piUNbL1EfR/DTkoiW7qmu2SImITJtxecHvuo1pSjqzqOCsHo43yes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YrokGKzF; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuJVEtfWX8h0F7tcAOFCy5LPFEbyebQZhx5/sDAHXDAAHYEBnQKjQedzEQYxmunbrlkXH8i/X1mBVBTj8LaXrnDfdRXBi/a5o2OWInKKzgmXiO5B8RavnsXyyTgUCjM4gElkbfG+xjH8uCCWYDOrbL6PXQdkd3pddWoZu6Nn0TJC9WlGvHTSxAfBJ/hfWabvhq63FMo+xKnm5+CPL5VIJWpHN55EUb8NHy8VDN3JTJdCW2WS5Bh5Lw4jeWIN77IfcXux6RoMn5hq/orRPRfO3K8tsGh55x6hzGoEWR+8XKahezcj79YWAAQsv18JmDeuMqT0sLju1qMZ4BghsiKKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2ZNEupm6yJB39nmQATi7nNZQSatG01mtf7a447nYBM=;
 b=STGHnwrYw5NkSX5QNVugOij69WkESLtRegG+Rex8LYvpp6IceIPfkzo3VD9LzVDI3bh+UM8+6oD0J66VqVSwGevZaI2UPyEGcLlcnLZ7SCZFFqn/JM4lcU/Q3qCvW/0UlQ8tOceRduqL3DZHilQEUuOaUWmOo3/VywLd6HHkcqTf3qbCpfH0J/Q2aLiw4cc/zpWnq7jQe2XPrbD/O7JtsXdtqsCAnDQP43fP4jucf8pVVzRpFm8wC3qgZY3FouZijPtmWsnHFpmhT+ohQYMWTwGTs0JtPy6R9rLTbP+oj4My1lYQ5XfCghQkLFXiehs6i9LSc/e57gpbLKktP9r7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2ZNEupm6yJB39nmQATi7nNZQSatG01mtf7a447nYBM=;
 b=YrokGKzFAZetJ/Nmljdb/u1VeCQBFQwhY6JEfLxP2criZJnuQBp09IRU1HwOWLy+dmcRotohUmyEzak1uomWsLaJRw5Yskj0tMkQP2Tm3GzOKOsvgeVfrzahTnnkIYjVyYIe9v6BlgtowRROBK4wDsLPevQ33jCniIeE3Y4OJv339qjY7Ll0/9+g3DHB0XBsnyGC3cwHeMx4k93BdBtDPk2ws3ALs1LUEw5iYu/iDADCdTY+0S7TAuxcI8MnEN2thgns82UVV4w9EyVuvhjgim3zamAH6q3e5OjfvlwmF+XUpYE3hstI/JWZ/DyeOOFsy5Av84AJKiIn8PxeHipKYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by DU4PR04MB11361.eurprd04.prod.outlook.com (2603:10a6:10:5cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:46:48 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 09:46:48 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 24 Oct 2025 17:46:53 +0800
Subject: [PATCH 2/3] media: nxp: imx8-isi: Keep the default value for
 BLANK_PXL field
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-isi_imx95-v1-2-3ad1af7c3d61@nxp.com>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
In-Reply-To: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761299238; l=1770;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=rMNTGBx6Xfb+9xpMTK+BRQixwz4tYD4i8428J/mEGbU=;
 b=mth6P9Iwvgzb4HFT3LkO1R8Rqyilxxpj89IePjajlOxUsT/w5iu6op8ajyvy6XAwjX76TpCqg
 IasBCPLJQz+BRlFaSe9pL+TNAirBd1CsrMicaMmrAjANmCbK0yzV/DW
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To PAXPR04MB9089.eurprd04.prod.outlook.com
 (2603:10a6:102:225::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9089:EE_|DU4PR04MB11361:EE_
X-MS-Office365-Filtering-Correlation-Id: 8207f0d6-c743-45b7-6e15-08de12e24040
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|19092799006|366016|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SUxLR2pZMXd6M04yT1JrSXFFOWgzVXkwck1CcVRlS095MVFiV1RwNmMweVpY?=
 =?utf-8?B?NWdDUFV6NTNSM0lZRzVUbUU4WkEvSVBkc2tBbWVkSU1tTzh0cjNzdXBFY0po?=
 =?utf-8?B?bXU5VUtocGRPaWI0NUZVbHVXUnI3REtML3Joays3clhMR1gyWVJnVi9EeGtX?=
 =?utf-8?B?NkhkdWVZNnZmdmQ1cmFMWVc3VHg0S09VRm1VWWpVcFVDVWZHRTczUW5jNVJ1?=
 =?utf-8?B?d2RXRmxMaUIvMVUzdk9ZclY5cEJ3cDdhR2Nic2kzNVFIT1VJQTdFUUUyQ3Mr?=
 =?utf-8?B?SnJrZGlIVk1aLy9lYmt6UEdEUHI4UFFYckdDTkl3akVIS043WmRBTGU0UjIw?=
 =?utf-8?B?OEpBYjNYbzRHMDZyU3d0U0RoU1liOWhQdjBTbEF3SDJxcUZ1UXhrODZ2a3g0?=
 =?utf-8?B?THNRSFhhNlpnV3JkcWVnRDQ5QlYxMUlNd0ZsUGtta3Y5QjJ2Zkh3R3cvSlpl?=
 =?utf-8?B?OTFvRnlWL1g4cEYrcEJVcWZhMlZqWjdXemRsN2luMHF1OXJzZWt2VnduNWxp?=
 =?utf-8?B?Zmswd1JTeFQ3MWJUZGF3N01HT1FWM0psU0M1dkc3dnhhM0VIcFplaWo2N29a?=
 =?utf-8?B?NTBiaFR2SHc3SzRwUmpQbzBTWC8wTDlzWEhzc1R0alQzcWVzR29OWnVKYVN2?=
 =?utf-8?B?eHp4bGFpZmZpSDluN01WVjErRVQ0cFQ3NTNYNVRVL1hlRi8vdFFhK2JKMUVr?=
 =?utf-8?B?cHVjeDNxMjlscHRDSlJOQ2hkZWtOZmZrOFB3SFU5RkloaVVraFhsNjBZcFdk?=
 =?utf-8?B?b1RjV2lYZW5ucTYva1FsUVRRWlF1MWxjUWJCS2lBVGFjYUV5dXVGd2lndUo5?=
 =?utf-8?B?NEhob3Q4MjRFVjJtYStSVEVsa05iNS9JZGxqbitlWXBoWGNGSXhDb0tWUGI1?=
 =?utf-8?B?WXdNZHdka2VYRXFIeW11dlplWkZGMlpmSXk1NVR6KzhRSFoycERDQXo2RUpx?=
 =?utf-8?B?Vm9UL09WOFdQUWU1blJNeUd5ZkRrOWV5Q0c5bkZFb1FJWVdCdEVOUjZUdDhZ?=
 =?utf-8?B?SG1tRDZwSmoyTjVXb0tOQTMwVEdlUXN4dS85R2xCbWVqNlNybTBxaGdOTE5Y?=
 =?utf-8?B?ZWZMSzFjVjJxK0tabDVZV0RBYlovaStXMjVqYjlXcHN2NTZxWGFpOFZhSUNm?=
 =?utf-8?B?dmZTVEdXSDZnbCtLenlFRkFmc2xsZStiZVRyMFhINTAyYnRaSmNvbWxpeGFv?=
 =?utf-8?B?bDk5Y0VLZlhyQzhJbFpBUTV4ZXg2eFk4WWpsU3UrcERSbjNtbTFibVFOSUVD?=
 =?utf-8?B?NGs2T3I5REVZZ1QwMCtSc01UTEs1WG1URm02RUNZRWExRzBLY3htRzZ4bGty?=
 =?utf-8?B?Wm9YUjdLLzJjQ3pza2VGZlg3My9LK0dlYndHVWppL0Ntd1RydXlsZjFWTDlV?=
 =?utf-8?B?c0JDTnFhQUkwNlhLWjE4SkVWOTdmOFZXa3prVGRwbXR5cWVjMTZ0ZXZ2Wmtp?=
 =?utf-8?B?VCtiU3FESWRSTDFlQ1Y5aVY2RFl0VWpBa25MOTM3VmNhNkluemRIQXhmUUFN?=
 =?utf-8?B?b1ZJeHRkMTlwcXZFRUFOdnU1eGFWR1VWRDdLSCtQNlpjdVlkV1B4aWlUNmxm?=
 =?utf-8?B?YXRyc2pVbXpKUTJxU0RYcVU0SVY2cEdSUkY0U1poenJDYVl0NURETGdMZW5q?=
 =?utf-8?B?MG9Kc0Z5S2h1bkdPT0dMenBtd2V0WXQ1R1I3WjNiN244UWpQYXBUL3RWK3Q3?=
 =?utf-8?B?dlhXVll4eThPYWR5TUp6bS8xVEMzRWhaT09iam1JRkpuVzBGbGZ0SDlhK2sz?=
 =?utf-8?B?dUdjeGRnSHJDZm1OWUN2OWkrUkw4cDRrckJjUXlCY1VCcjZPRG82UzU1eGFI?=
 =?utf-8?B?QmZNQm16MW5sZ0M5N2NkTG9nWTdkMmowd3R6clZTNWNFNTh5ZGtMMlJ1ZVYv?=
 =?utf-8?B?TmZITVBSRlNVaHQ4aGFnanl3SlNLbXBQVTlnZ0xhOHdTTWNSS2ZUUE54czVD?=
 =?utf-8?B?dm4wRkxadlBRNXg3a1M2Szd2SWtHMFV3WjdiU1o4b2FJUTVhTmpnSmRGekk0?=
 =?utf-8?B?WG5vYTNzQjVZQUsrSXMxWGhUT0xQcnJVeVhPamZMcHlrQjZjNUFzUTVibmEz?=
 =?utf-8?B?UmRPYjZ2R3V0RTFYOFVXWTNUejE4VHJQOHZoUT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9089.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aStnTktiazQ5YVFjOWJNWWh2SmhZemtUZFdzeERJc0xhRG1KN2JzQzI3b0tk?=
 =?utf-8?B?OWpaWWNJOUk2aVo2M2xaYnZHOFEzQ3RIdGxRd1BpbkFEc0hTc3orcFJIWEsw?=
 =?utf-8?B?bWFvc09BZitPK0FYWHFMdTdxclloRG9CTjIzbkFGendKU21JL1FjUHJRZ0Jh?=
 =?utf-8?B?OTBoQjZRZEplcVh2SmlQY1BwRkNyaUhDUTlUWG9odHJiVi82K29rVS9ydDN6?=
 =?utf-8?B?blA3ODBSc3RiZHFuZFE2WCtsMnBOaTJ0K2lFVzdCZHZHcm9Ca204cXZ6cktE?=
 =?utf-8?B?bFF0L2t1dCsvcTlSRzZNZDhtS3VjYnJrVlYwRXZ2UjlVcVZSSE9RM1BCMGhl?=
 =?utf-8?B?OEhHaXdwbEtGVzdkdlZmWEZrMVZ5NENaUzF6VGNtZ1BJb3lBTzc3UHhVOWZT?=
 =?utf-8?B?ZEc5dWJzamg5N2lPRWcrZzlrVmIyL3lYWFd2Vyt1RHdqU3p4UDVLdWFSb2dv?=
 =?utf-8?B?UHg0N2pla0F6QlJ4L3E0QWZ2Y1haakdCa2MvZXNEOU9KMkxiNXZNMTdhcjVn?=
 =?utf-8?B?V1AwakxPVUhOamZDTmhKeTdHRXdMMWpTUmFtSXhjOHFLZ241Q1FpT3FFL0ZW?=
 =?utf-8?B?enorT0pwalhya01rMmo3aEx4czhsQnkzUnhKWUhad1A3Q1VJS1BKb005bktL?=
 =?utf-8?B?SXVObGp2cjFxaWs3NjhJLzkwN0tROTRCbEZ1VjFNQURGVStqQS9JNE5HZ3pC?=
 =?utf-8?B?WGNTSUw4YXo5Vk9TNGYydnczL01rTlJ4dHNXRzJFSmo2NFZZUkxpZVRwOHlm?=
 =?utf-8?B?OGsxbUVHOEdxZ3lDNThFdFFHM3U4dUZCL0xweFFlSWsxdkI2eFc4dWNUend2?=
 =?utf-8?B?WXJJazUzS21kQzNsU1VnZE40S0xZQnBJSkxPT0FNNlQrT0tMa0ZzYTZxVmJj?=
 =?utf-8?B?MWswdmZVa2F6RlZDSXpLM3ovdkRVWnVvY3ZSQW82MXNZRDd1RjJiaEF1c2Zo?=
 =?utf-8?B?bFZ0UElBNllxd3lBMTdxR01BUEJSOHQyd0lVUmtYVXFuN1dBdnRUZHcxekZ4?=
 =?utf-8?B?YzBoUTVQaWZ5VHBsUkxNS0NQTXpJS3VWNzd4VzJBV29KWmRxOHZJQWRhaHVC?=
 =?utf-8?B?NDk4TUZTdFRJNVljbms3WUp6bUtuV0t3WmpIM2Vvd1ljME5ubU9qbWY0c1Yx?=
 =?utf-8?B?TSs5Qkp4RzlEZHdDMFFFTG4weEJIaUhYbFJJZWhqaHpEdFl4R09uZU9Da0dy?=
 =?utf-8?B?eWJKSGFTZ2FkcUpQa21uSUJNNVkwL2psWUJBcG5vTGJ5UG1rN1lSZ2hOVzFC?=
 =?utf-8?B?bWVKdlMrWHE4OXp3QXJGSEtNSHJhYjZINXNJTkFOcEFVWWlmRmQ2T0dVdGRn?=
 =?utf-8?B?ZHlIQU5KQzBmdjZrNE9TVDdnKzVBbWpqNURRb0p1ajlPN0hSdXh2dFkyVnNW?=
 =?utf-8?B?dURWaE1hZEhUU2NlaU84NS9yNWZxM2JNT1VXMFU5V2NzeUZxOHVvK090Z0ln?=
 =?utf-8?B?c2ZwUmc0RjZTUHRDcElrV0tURm92eFhlMjV6MDBLUnMzcWNrclg0eFdkeGpJ?=
 =?utf-8?B?aTE5Lzlpcjc3MTNWZWIxV1NDWkp0ZS9rRVRIMUpsQk5BV1dPMVVobUVqTThy?=
 =?utf-8?B?WWJGdUxpTGtXMTZrNjRUTldyNmVhWVpKMEdGbjFFSWh0MXBKUUE4SzVqVktF?=
 =?utf-8?B?SWJuayt6QnZ2SXNhcWd6OU9LRG1XSXAxcWJ5bHJYdG9VbjkwTEUwMUp6bTUr?=
 =?utf-8?B?NVJNc2UveUQrT25BZzNaOWNNMFJRd3VaNVl3UTd5RlZFNFloUkRROTJpTUE0?=
 =?utf-8?B?R0RZS0FFZTBaVWovMVgvMXVzQU0zcE0vbHkvUUVzcFNiWmRDWlQxZ3Jya3lF?=
 =?utf-8?B?bWpHWVpNdTJpd0srckFRN29zaExaWkU5SnZuQmNQQVFNYnA5dDRhL0g5NlIx?=
 =?utf-8?B?d2hBOUVsZUIzRDlZK1VnQnRObFRROUtHZi9NbkZhaDg2QmlHR0Z4QTVMQXg0?=
 =?utf-8?B?QTRBdHNwQ1RUMkttTWh0dWNGWndQcFRsQ0xvTG9kZVBPVHZQc0RlUm9rSVd4?=
 =?utf-8?B?NzhJSGVXaGZ1Um5sbWZSRVVxRjcvd0o0UjM2ZGV6dXJQUkR3b0w0R3h1L3NF?=
 =?utf-8?B?eWNkbjF3OUpHdFJjNVp1YTVUZWlUNjFkNkh5STdvUzJNd3pwOG42SW5mYWxn?=
 =?utf-8?Q?2/0cS9bDN8VtKq8OAdDzOqwbz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8207f0d6-c743-45b7-6e15-08de12e24040
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:46:48.5143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKPUjXyF2zKMqzg34G0nRxBJpZ7yfcXXyk/ydMMAScKQ4+ZxgDSc059wuRfzul8jL/RUCiLcKS77KygcKZcLwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11361

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The field provides the value of the blank pixel to be inserted in the
image in case an overflow error occurs in the output buffers of the
channel. Its default value is 0xff, so no need to set again.

Besides, the field only exist in i.MX8QM/XP ISI version. Other versions
like mscale series, remove the field since it won't send data to AXI bus
when overflow error occurs and set the field as reserved. i.MX9 series
use the field as other purposes.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 9225a7ac1c3ee7e42e64983982eb4b6c27e356fe..0187d4ab97e8e28fca9013f6864a094e08f2c570 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -309,8 +309,8 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 
 	val = mxc_isi_read(pipe, CHNL_CTRL);
 	val &= ~(CHNL_CTRL_CHNL_BYPASS | CHNL_CTRL_CHAIN_BUF_MASK |
-		 CHNL_CTRL_BLANK_PXL_MASK | CHNL_CTRL_SRC_TYPE_MASK |
-		 CHNL_CTRL_MIPI_VC_ID_MASK | CHNL_CTRL_SRC_INPUT_MASK);
+		 CHNL_CTRL_SRC_TYPE_MASK | CHNL_CTRL_MIPI_VC_ID_MASK |
+		 CHNL_CTRL_SRC_INPUT_MASK);
 
 	/*
 	 * If no scaling or color space conversion is needed, bypass the
@@ -323,8 +323,6 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 	if (pipe->chained)
 		val |= CHNL_CTRL_CHAIN_BUF(CHNL_CTRL_CHAIN_BUF_2_CHAIN);
 
-	val |= CHNL_CTRL_BLANK_PXL(0xff);
-
 	/* Input source (including VC configuration for CSI-2) */
 	if (input == MXC_ISI_INPUT_MEM) {
 		/*

-- 
2.34.1


