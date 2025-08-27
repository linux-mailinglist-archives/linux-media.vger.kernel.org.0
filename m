Return-Path: <linux-media+bounces-41145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47007B37F51
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08918460C94
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 09:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3D52FA0F3;
	Wed, 27 Aug 2025 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TxwopkKV"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C452F49F2;
	Wed, 27 Aug 2025 09:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288466; cv=fail; b=T9BxN5ZEUzWEqOeKbCqluw92EjQBkoQjYOOWSkK/G9+3Oo8voqEe3U15Mh5g3SM+q2G36I5kBNiZz8Bvs6vWKEjuUZMTh7l2TuSjvNllLQOFyIo6m2WpZ1YO0apw3UVvdregNSMStuxTaJW2oGMZF3GbtrAhrriw7igTQZWfSlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288466; c=relaxed/simple;
	bh=/+evel25fm5XxLwJOlK6O37rsx2U5TNUHpvslhxEjGA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=NHu6D8Ss9D+uTDjmgXndsZRlipzW969NC1a60t1NB+geDRmM9nnQFwiFibJMt3bZfFP5TYdtEEPcjdijKKkD/7neodXhjWRd8irwRUUAK49vNTKK1f9j+09SnSUauhq6dM/6/13wPa2u5PWZbo3KRxyrF+T0lI4mBHfXtoKYDU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TxwopkKV; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Siq3v+06zBkMeFq1Lfx/LCIQTjMZjGHDPn0VBC0KgQVFJazlrI5Z4svzL+lvuW08HfvtSprsyA2u+uXQ/Z5vHcsEQJONksntMlfHH2MCE+1cApHdqRG3eKdTUY7IzLDK0LJeNyhAd7ZVXBuSkwubBUfhYiJItGSM5QFN70xsAkDb7uktAj3w0gJk6NLDPdbXI8yXOfMYTY6vRhCCJJLPUJy5xOGc+N3kKWouykzqeBkTSfubptbOiEFEGnG7VboBOJnARRm4ye9vnw+3fm8zxzDX0l3SHNyJor3ZIl7IZr5Ea68F/FKSPrQaZ90I1P4P3USsBB6dmKVg2s5U53Z15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2zK6Z/60iloobm8wyW1g4eV3a8kJxwSOyVkWooWI90=;
 b=Se7L/lSSydTTM+Gyllf8bOneU+wF0lvVo3sKCvjbcfLaz2mFy6bVCuB3DuKSw9u0P4A7JExJ+P0qlXb6Wt4nTQsspbK303TexZzF1vwVotjyb0/B5SieBVZsbI5T+sTy3jeRLgHf+iJEtaPLfRCzUDlRinfr4qj+Zx5vAyxxope84AuJu5naWZ4A54Iw+YdKBUAI7K2cGTsAhCsZ2agjwSgGiucQJkA/dad5gtHlJb1kEta8/gwn+bzONx03RGTtVCt5SI9BJpQaPwAUQo/5L8nDXSpTogPxyrV+FMnJvk2y9JrzknwBDnPNq+K7eTeOQqaN1L3wfVNC+blJjSeQtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2zK6Z/60iloobm8wyW1g4eV3a8kJxwSOyVkWooWI90=;
 b=TxwopkKV3kPVnD42J08o1NsVTJP8YLERAJHSteSIcbmZ+lZG33fyJ36W0UyiMwKt2xMah11FJ2dFFjuOQ9VK2rJeNt5rZkA1c9EVxBd6NqMqkpNeHsTpEgjplOg6vtrcO42QkEZoQBEMSX/qIR3R5AsvgiocTuBOyetpxQUsz/pv90oA4cSiRet9PaBzJYejSpmKnt5bBnDNa+LKAxNtFaoF9NaZiMcUuvA9VTKO0wyhBKQVEZ1yRCL0cLe2fy+hSlsnXe3/Ymid7qfSIHhqZcPb/f3hmLLgvyEm89wh+rQ2O4YnlsJDNYkIAN75iGbaOjwtmiwCDLWhWo7URNnnfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8839.eurprd04.prod.outlook.com (2603:10a6:10:2e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Wed, 27 Aug
 2025 09:54:19 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 09:54:18 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: [PATCH 0/5] media: imx91: Add ISI support
Date: Wed, 27 Aug 2025 17:53:47 +0800
Message-Id: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKvVrmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyMzXaCK+MzcCktjXZNEU0sjC4skY+NUEyWg+oKi1LTMCrBZ0bG1tQC
 5edu7WwAAAA==
X-Change-ID: 20250826-isi_imx93-4a59288b33e4
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756288458; l=1376;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=/+evel25fm5XxLwJOlK6O37rsx2U5TNUHpvslhxEjGA=;
 b=Ij+YPp8oHHPfL/lwjH5vOWamIGv6lhTOU4r3vpDUYrhlOaW0ovUI11JopgKWZQL9fwZX2a5ff
 g9jv/pF9akFDiP9/flLroLI0OPeleObzqkVXYGAhsXiIOxoCYjr0pAy
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU2PR04MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: b57f9dd1-6310-4bca-85da-08dde54fb0b8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|366016|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?V0JzL25uSEkzSDFIREhMbXluTk1NVFVxOXN5ZE1nV0F0NGxsVXBScktBSjJC?=
 =?utf-8?B?WnBKR1RaUlFXK1NBSUlQQ1VNMHZZS1E2WVg2ZjJEVnFsQXJmNWNKbkdaSHZM?=
 =?utf-8?B?OXlYdUhnS0dOSHFUdG44OTB5OEdtTXlFdmt0ZmV6OTdlL2J3MUYrRlRmc1V2?=
 =?utf-8?B?ZEI4dUNwTnBSWmRyODBGdytxT1BRR0Q4SkpWSG43NklxQTZPUE8vRzZjdmhZ?=
 =?utf-8?B?dWRDNE54bEUxcWxNSXRwM0ZqQnZJbklMcjgzZ3lsSFBlWHdRUk10SDV4eWQw?=
 =?utf-8?B?THp0Wm5JWEtEUjVMSXAzZjRjckxsc1Bla2Q3Y1NqMmt1WXZRcUFmQlczWTda?=
 =?utf-8?B?UFNSd1Q3YUJXc1VsNFBVMFA1T0hwYnNjcXRkZ0tWVlIyOVRFR0s3VzllODZq?=
 =?utf-8?B?WTVjWmJzTHFFNVdPMUhPcmZtbC9raUVFek04MUNPUjJHVzlHS25najE4c0Jz?=
 =?utf-8?B?NUNmY095Uy9GdWVkUWZpKytoY3Ura1prZ0VmaFdFaFRwQlhXNnovQnBXL3E0?=
 =?utf-8?B?QW94WlBHalJVVFQrRDFlZXFKOFVsRUJvZFZTS2VzcFpUKzNTOXc4bCtEWkFh?=
 =?utf-8?B?QXYxdWl3c1ZNOC9IV3dQOHJndHU3ZHNHSnZpaGZpc3JvSjQ1YldlYlpzVVQx?=
 =?utf-8?B?bnY4aGhaM1hwY2x2RU5YWnVLMnBOTVd2TmhpamdGQXFDRCtEM1RIUERtclBR?=
 =?utf-8?B?Wi9qZ2EwakNmbDh6anVWa2RsZC9lZ1dEdDBiaGtQNlJxV3l6eTZCYzJLR1ZT?=
 =?utf-8?B?RVdXQ3BpdHgzbVVCckFWT1I4Q2dtY0t5aFNyR0RrTyt3UnBpWWdqUThlRmtl?=
 =?utf-8?B?VjdlOU1leXIzbFNINDJ4U0dVdlh5aWo0WFYrMGpJZit0c3FMcXRXcHVUWWJk?=
 =?utf-8?B?ZDh4R0VETDcxcVh4R2x3OEQ1WFhoUzFZZ0t5MWp5R0lXY3VmamlqTlR2YzlX?=
 =?utf-8?B?Smt5dWp6N3FtK3p1VXI3OUp0ZEg2ZStXeWdIVXFCZ1dWTWQ1clBWWUhqRFkw?=
 =?utf-8?B?cjdmQUF1ditGdFhmQVluaXRBQ1EyUzJBdjYwSExBRmhPb1dzS1BYU1ZpUFVR?=
 =?utf-8?B?S2ZkbTBDaHlUeUxzSE1zOGRpV3RBa1RnbnJSM015ZXRqOWR2T3RmMjUrTlNK?=
 =?utf-8?B?RTVVZis4dWo5aExPU1l3bkhxbHRNZEZOZ0djeXRZc3hWcGZYdnd6MGp3ODZ1?=
 =?utf-8?B?Y3dXZU5tbHZnN3pLRzVESUlueWdGVm0yOGVIVFJocWpLZTRxZGZ3d3IydXVq?=
 =?utf-8?B?bkVvZFQvcWNEY3N4Uk1sTW9kUG45TkNGVWxTS1gxblJXZnpFQ2Y2OHdMWkVt?=
 =?utf-8?B?ZlFlMmNKeXp4aVdRU1M3YTFzZjFoclJ0M01xeXpHYUpjM3o4aFFxWVUwc2dQ?=
 =?utf-8?B?N24zbTNEMFdxWUp6ZTVHWVJoM21pQTM0Nm1yU0RpTjNLamp4TkJONmh4M0l2?=
 =?utf-8?B?Z2xYZWF0dXdpeHFGd1IwVzJCdjZReFNrbDd5RFUvY2dYaEJVcUNLMFFpY0Rw?=
 =?utf-8?B?Q1dkM3lhcnZmSXd0UjRwclRQQkNPbmhMUldvcEFzRWlPZVdYdTRHTEhxOGdp?=
 =?utf-8?B?LzRYRUsya2kzbCtadzYzQm5JTkd2UERIbk1jU3N1RUQ3VFQ4ZEVsMjRBSFNx?=
 =?utf-8?B?L1dEMGNDU3VlT2JXbGtpSFNoRXRIck5MT2lJQlYxN1NEOU9IME9hRDRMa3Zy?=
 =?utf-8?B?MnJOY2tBMXVYM1BkRkVoQjhuT0FnZWt2UU9EYmR5akpLVjJDdWpIcDVLMDda?=
 =?utf-8?B?V1czVmc3WVZnYVdFaC9SUzdiRnZCM043UWpFOXp0R2J0cXQ3QUd2ZGF1WEtE?=
 =?utf-8?B?SzQwd2lreTdYZ0t0UE5Ja0ZZQkIwbE9ydHc3QlpvNTVMcjhWUm9aSVQvS1pP?=
 =?utf-8?B?MG9wVWZjNTdSQjliQXgvUGJzUEU3dlVZNG9ZTWNmM3QxRms1RWhic0hHL1hX?=
 =?utf-8?B?K3Rwd2EydzBjL2JnSjhkUWFicTkzaHRwK2NyckJ1eXAyUWNGS1ZpL2xpcHJ5?=
 =?utf-8?Q?n0ULlp+DsAzsudQ8bBJywMIEA5KSLQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dnAxSDVPd3hnVllPd0ZKeWY3K2tiWldNeVlxbWF1eG5mREV4OWVEWXp5dzRL?=
 =?utf-8?B?dEtkV0g5cGhEdGJGalROaEcrS09CeFVhRitTYlpoSXJOd040NCtzME1BdjdW?=
 =?utf-8?B?cDZaK1lGUEpiazFjY1ZXdm5IVXJMY3lWdlVJeXZrNEZNRWhxU2JqZSs3MGdO?=
 =?utf-8?B?MWJBOXlBV3JMNXhHMlNlMFpiUEJ2dCtwM0dYT3M5UTJBVk5lK1JHVXRvUlJx?=
 =?utf-8?B?MkxCazhCdnJ0UXU2RUZsSTRrc3hYRlV3RGJzV3hmdFhsUSttMm5MWDVSTS9G?=
 =?utf-8?B?MER0VUZMeW9RMXFDUHNjRUsvTFFrYklTa3NqRUFjaStTUkJkTkYwaW1lSDh3?=
 =?utf-8?B?U21WbmhCNkRWaVVXamhhT1hBRVJwU3VpWWdpTitLNmlJVmRTNmErVEFGb3pW?=
 =?utf-8?B?NGM2VFZDS2lkUVRxSmVSL0phc2lYb1JlQWV4VTVuZDlaQ0xxWWprbC9SWXQx?=
 =?utf-8?B?dE1ValBTL2hOdWV1NGYzVkgyUkhObENjdnd2Nk5jbkVVNU1hbTNpbjJPcmZn?=
 =?utf-8?B?U252NWFmUjRTVjh0NG0rVkZiSHFwZnlMUmtaVkowN0dlVmdycWpJelJmTnRZ?=
 =?utf-8?B?NTI5bVRqZklyUURzUkJuS1FUUlQwWW5EOHJ3ZmpqYVdiaEJqYW1oYzZuMkJn?=
 =?utf-8?B?SHFNazJ6WEp2QzRwMEV2SUl2NXVvYmoxNUVOR1lWRGRVM0NZOHZjUGkxUmZs?=
 =?utf-8?B?YVRhQ2xqZHdNdzIwWll3SmFMYngzcy9VeW9QN0hFZTg2YnJ1dlBGRnVSY2FW?=
 =?utf-8?B?WDRLcm1vcENoMU40MW1LM3lKWlBKY2dSMmozeEVVLytuaUZmcFkvVytsdXZ1?=
 =?utf-8?B?MC9OTDAvM2I5Z2prbk0zYlU1aXpYcmFwcXF2c3REWjZkcUI4Wk5Jakh6UXVG?=
 =?utf-8?B?VVFoR3J0TzQvOUFnTE5uYjdhd2JlN0w1NC9vaUdnRVpMRldTeEI0QmVkVlFT?=
 =?utf-8?B?SndacmVvc0VXOFBER0dWUUpSNXJzTnNSZjN0Z2tsb3hla0dncC9jRjNkaG1v?=
 =?utf-8?B?R3A2L3Z4WUJ3UzF5Y2cyOE5xWU5Kak1mdnM0M0phRVJXK3Nmd2YyZThlL0VW?=
 =?utf-8?B?djg3ZkMrNU9LL0hBektRd2xBT2VBbGYvZ2FIVHJ1OHpMVnI3aVpYZjNIQTAy?=
 =?utf-8?B?R21oRDR0aitqL0oyMWVpd1VHdjk1N2NrYUpYMWxWVWtFQVVWaU5vUmRHTFpB?=
 =?utf-8?B?TGxiQXByaElCWUdvVHF3VzRJMGhudktPSkZaR1B0M0MzSk82VjJKM2hWNmNi?=
 =?utf-8?B?dnc0RmRlcnJlYUNJaGp5MGh6SnBpcXl3ajNKdCsvMGt2aGpRWHIyWnl1R1NR?=
 =?utf-8?B?djA5OUcxd0VBVGxTSFV3ekFGV3Z4WU1PTmtoUmg1VEtSU0k5UURFeWR2WVd5?=
 =?utf-8?B?NkNKbUxSM3h2UGFjQkxtKzlMY0lpNHNvc3MwVDNoMm1lZkV2KzlYeUdVQmQy?=
 =?utf-8?B?WkU3Z0tYckkvNjJ3MTdMaFNOSFpuS0k2M09vVTVqdENFUWxIUWVlVG5yT2x1?=
 =?utf-8?B?SU1hV3dEZWpTbjljMExoZFJsbHliMnJiUG1TZmMzVjkzNm96bzhQUmxGbGdD?=
 =?utf-8?B?YWVDYTk2cTVtTy9sd1FmSE5OemdoSXFoOWRtd3JsWmNnSGxkRUdUeER2a05R?=
 =?utf-8?B?VlpjQkhEQU9IbTNPcHpqbXQ4S2xPZDRvTlBSS0FESzlDTjJCMGZZUXFOYnFm?=
 =?utf-8?B?c25pSEdvdmZjbmhaRUNmU1JJSUdzZ2l3RUVyRWlibXFsYUlkWG51ajEyUGpw?=
 =?utf-8?B?SjRxcTQ4NWxTZ09nK29MZHdBdjFCaWxNdTg4V0t0amNPbDFadndDWis4Mk0v?=
 =?utf-8?B?QUVyZzlyUEhDb01sc1c2d3BkVFd4WCtCVSt4K2hsYmtFV3BvOWdHM3ZWVzBD?=
 =?utf-8?B?NVdGbW9aWTFkMXlwTDJIRWRzMXRVb1U2ZFQxUkVxbEJ2SFRQUG9lcGJKMml2?=
 =?utf-8?B?d1VCMUhXYnFIajNPT2Z5WmRIUGNQdTBNYSsxaTA5cFVpbFpMRHFlbS9nZFEz?=
 =?utf-8?B?Y2FuSm91YUxnVVcrT1VsaHFkVy9WTnlCY0pRZjZNTkdDNFFDb2NDNXc3SjZj?=
 =?utf-8?B?REJXVWlrRUdJYmhtbisvVkZFV1RQUzF2Ym82ck5aRHlmTEJyVndveERVOVlv?=
 =?utf-8?Q?3jrjkcHz7jlYzaeGdvwfLtEYr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b57f9dd1-6310-4bca-85da-08dde54fb0b8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 09:54:18.9002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZtZFbetDy1jVbK+mmkS0+IyLX3fxdqt6hAu4QsrRlrDR7LCbc3zSfc6lwwE4iL7SVZa1X3RdnYuS7bpDgnz4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8839

Add ISI support for i.MX91 chip.

The bellow patch refine code, no functions changed.
   media: nxp: imx8-isi: Simplify code by using helper macro
   media: nxp: imx8-isi: Reorder the platform data

The bindings and driver patch for i.MX91 ISI.
   media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
   media: nxp: imx8-isi: Add ISI support for i.MX91

Add parallel camera input for i.MX93 ISI.
   media: nxp: imx8-isi: Add parallel camera input support

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Alice Yuan (2):
      media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
      media: nxp: imx8-isi: Add parallel camera input support

Guoniu Zhou (3):
      media: nxp: imx8-isi: Simplify code by using helper macro
      media: nxp: imx8-isi: Reorder the platform data
      media: nxp: imx8-isi: Add ISI support for i.MX91

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 13 +++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 50 ++++++++++++++--------
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
 .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 16 +++++--
 4 files changed, 57 insertions(+), 23 deletions(-)
---
base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
change-id: 20250826-isi_imx93-4a59288b33e4

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


