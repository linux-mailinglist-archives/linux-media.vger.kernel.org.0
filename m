Return-Path: <linux-media+bounces-39182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 496EAB1F116
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF4257AC262
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FBB2BD02A;
	Fri,  8 Aug 2025 22:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MJdII+Ut"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB40128C2CB;
	Fri,  8 Aug 2025 22:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692977; cv=fail; b=o/kjyT950y+1xS6h6tL8BdBUvZy5UfAHorWaU4rhFRwQQBDgRnV6AI/aPsNFf7Zjb8RI2x9kftB2MZ4SemVifT2Uof53DW8+QrTc0WCFOVVFSiPErXs+BfOE9rvXrhYAmb8dO/rXWoF9OXKidfsXUunMSeLoWX59gaHPcG4zYQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692977; c=relaxed/simple;
	bh=vRlCxr2cMrjg6hrrOpeOo9CoaUCU19lVO/oTAlkOy3E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kw93BdGGOCKt9khoqkZE9ZBEJ0JZdnIbOdLW5GjA9+TnOag5CrM3l43M7nOsqi72yEfNFXc13ebTJ32DzD+I2K3iWu+fvOe8NYPmF1zFVp13IZU4+bAiGZo9gG3OOjNioaj0xxaNb0I1BLutlhc+ry8tqibiis//AFPRxQcrVW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MJdII+Ut; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7FjByM1gftoT70X09if7RBdaZvF6BF4bFzdKogNmDB7YpqV/p6Pz5xp8qn1xPHbjZ885yrLQu/zMc4ImnC0YuZ1Gt/hvexrAzaohf5F+5Q2aS9HxbK0vojK8vtU7v2poj+KR3lX0m4tblWrjzCzdR2N9m0xjzltfOJlirKf+WkZqaL0BJPoXRWzo62vGsutpjG7MXgquCabV31IMQlq2eeAK9KE67MYldwpQMfMgmTjvkQ3gwT65i2A80Uj9GnPFtMZYZxVlFU8hmxenP/x9+YC4vvEU1jMfSzqEcZmD1ktciFPd62lA8uuqdn+ia7R8K/6eAN3eU9h/tXlcgYCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIiIgt75Mt21NXSfpZtspHDpXYxKyBCQPL29KM2FlRQ=;
 b=qPGBVf9Lejg35na8t2g63WEcPtH1avyBlYv3XKxVhQUZVdF0ePwK0aNkofzKhYbBeyzAPhVT+cpeQwnwsQ9zQS4kwDEvdwkgrIVix2CUjJdVybVM9qKsW3khp9isWyS5x6gpyiWUHujT2vehwEYJVWnCrelARFEcqTYuZ+N2qpiwkMp3WPKPtJxw2WBubsDwlS3L8iIbuGdUsQB1h7VX6Ex6UZo/UkGM8IsKWvLXdUO4+ptS3RG5518NLnHj5iQE27jWF1bVNB8RYlKyR85UKK+JBKxZxmOp+lGUEgPHLee/3NgjxVb08O8KxHW3teRoMs4uHiPW2eucixhoKEzLyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIiIgt75Mt21NXSfpZtspHDpXYxKyBCQPL29KM2FlRQ=;
 b=MJdII+UtXZxRrIXi978kVUYqTQJzXTZ88va7rGSgw3AOHTGTeg2RUHBEbjcm3MaH7Xp2eh8NF9LENzAvr39GJe9/2jJaEhoOlyoZXd58QeLwYayrWEM5GHkxT53hFHDTwyiEX7y/uwJ4RDX1LM0l5rAXO3V8rRTrGuDxlYB+VIE5K9bj5rpRfw0kSj8M46OxUKpIgPuWeO66k+iBSvkpT8UUdm1nxd/Iz4Nc0YgfM8A6ufrF/2tTbB5RBPf9GCkzUQFymjXNVRylTrfIIxbblMeE9gKt4QjoyiRAPYc5mF9ZEkYHrj8In7+d/2k1ggwBxxGJE3GjFkCP5AmAqfzaHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:42:54 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:42:54 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:33 -0400
Subject: [PATCH v2 30/32] media: synopsys: csi2: Add Image Pixel Interface
 (IPI) support for v150
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-30-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=4156;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vRlCxr2cMrjg6hrrOpeOo9CoaUCU19lVO/oTAlkOy3E=;
 b=HPNYg+8FFW/EyOlYc2XYTGc3I8savWPV2NfgsK0N4FrJkKX2r8FdVewIxe7V4JrqYA2ofP76M
 PK/FEWOkPnpCSoyAil60Vk7S9nRXRhuCACjBKtqUaBdoPi+kH4p/D7p
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
X-MS-Office365-Filtering-Correlation-Id: ed610efe-207d-4687-3d0e-08ddd6cce99b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?U0I5RVJmMnJEZEFzTGVMd00vQlAvMHc3Y2ZkN2VHSk1LTjhlem9ZaGpYZUQ3?=
 =?utf-8?B?REhGeWpEby9VdklEYUI0SUQyYkoxTDRicVQ4Rzc5YnF0L3JMSVVCSG5aSWU2?=
 =?utf-8?B?NEpHT0RJN0l4bG5rZEhaazc5NytCd21iZjlnY25FNkc0SkI2UjEvZDg4OGl1?=
 =?utf-8?B?NHRFei9LSTBCU1VKb1ZmRkpXOFoxaGZPdXRHZkxVdGZxbXhBekEvQ1F3S0pu?=
 =?utf-8?B?WHR6NkdLVUYzY1FKWHpLWUNhN0hTc1ViOGgrbTNzajZET29aQTU1Z0NJVkNx?=
 =?utf-8?B?cFAreFh5QWgwb2dHNEdIZExqT1A4eFBEbHd1ZCtnMmNXaC9qd3lwYkRVUTNw?=
 =?utf-8?B?azZwdEdhVUVBcndPVk9LOTFxNDRqcnliQjI4RHlUT1lXcDJ0S0tOd0hNUnVW?=
 =?utf-8?B?eldNTzJvaW1EeUo2L0VoT3ZqTy9FaDVodWFJZjV0TkdCWDdBc09jcFhHSFhC?=
 =?utf-8?B?dWkyYWRseFNKOXBiVFU3Wms5Zkx3NkorY1ROYnljRXZFb3RnS3BselhTZ0NS?=
 =?utf-8?B?Q2tMRzNwUzI3RWZneXZNSjFRWVc5TC8rUDQyQU1yZkhKdkxnUG9tRGd4d3V1?=
 =?utf-8?B?czhBUGdJNHpZUE9ISVJleUM0ZDRzL0wwSld2alg5eS9RY1lHa1ByUkZ0bkpt?=
 =?utf-8?B?RUhrRzIzZUJkRThWUXdWZ2lwU0JuakMwN3Ixb1RvcVNlcVEvYlpOSjVUMTkr?=
 =?utf-8?B?MHREZ2FWOUwzUVprUzk2anUvSGxZeEpDcURUMGc0aVVhMVppU292bHJFNy9V?=
 =?utf-8?B?YUlXRkVQMzB6R0JsQ1VRRk9NeGY1dFVOcFhuTjdPL2ozcjZ6a1d5OGFqQXB5?=
 =?utf-8?B?eS9TS0MrQ2FiNHJZT3FPQm5aa05ncDBHT3RnWnM0YXI1YnV3MHEvR0ZIS0Mv?=
 =?utf-8?B?eVJrb2JLdW43OWVsWDBqbmF6WFZFd0pzUWVIOW1aZkdpVmlRdTZRWlJ3bWI2?=
 =?utf-8?B?NXBkRW92cndxYzJYYmhudExjTHh1WVBHZTU0bE5nOGo1c0J1d3dIUFlyWThP?=
 =?utf-8?B?Zm1adkNoNHZKMmhOeU5hdmNKZ1ZwRjR6dGVhZDY0ck5TNUpOSkY1UEY3R2xO?=
 =?utf-8?B?N2xJZzZ0Q1ZPRmxENVBlOHh1QzcxRGVQMHlvNUNsRGpkZkliWDVqaklZTGpM?=
 =?utf-8?B?Nkd0N2gwb3ZRSVRTNHd5ZnFSaEQ1YmwyLzU5OVdBOENuV2FTMElNZzRpWmRk?=
 =?utf-8?B?bTN5NjBISWtwTnlLNHZ6M0g3dlJpR1NFRVpMaGhZU1BwbUtDVXdBd2FKTTBt?=
 =?utf-8?B?WlVWUnRQRStWVzJxNmRadVNYT3JLelNDVTkyK2lRYVV5RzU0dkYxeVFpYUNC?=
 =?utf-8?B?VmxDYlRJUXVtVEdnclJhTy9IclhxTVJmVFJ2RG4ySWJKaytZYjNYU0xxcXRK?=
 =?utf-8?B?QkxMWnBCZjNOb3dSSGJnSFhnbWpldHQ5SWtpTW1GZmVkdWhWd09sWngyeXRl?=
 =?utf-8?B?T24wNlQ2TEd0cTVwbWRnU0VneWx4SDVDd1l1YVpXTkI0QXdtZWk3dTA4UUw2?=
 =?utf-8?B?UXg3UVBvZXJKQzVydjJ6aktQdk1tY0lZeUhxbkh1cnUxbExlWVJRUnoxdUhI?=
 =?utf-8?B?TGtWanhqZy9SZXQ4eFZ3L1hnaUEwQ3NZdy9JbWNGZzI1UWV3N09xUFh5UUZ4?=
 =?utf-8?B?TWRwTDJObGJ0cTRWU1RLclU2ME9YWXE1SE1aQ1Y4bmNJTkZLTkR6WDdLVGJs?=
 =?utf-8?B?R3ZZZkZpb1JQTzkvaHZxeWgwVENUK205OWRoUFl5ZnVWa2lGa2FVcWk0VXN1?=
 =?utf-8?B?d3dReGtaeHNVUTFYdHRURGlrOXlrOWpTMzFyUzFNa2Z2bnlqRGx5aXRpTG9T?=
 =?utf-8?B?NWUxbjRZVkx1OEErYjZxZFJsOHpHT2xHaG5rY0FRaGlxYStmS3hnbkl1ZS9N?=
 =?utf-8?B?K25xeUkxQVo1R1dDWUdHbjZzbUNuWlk2OWJML0lwcUtvNjVJNFpIckdVWkRn?=
 =?utf-8?B?ZjY2U0UzakhWUDNURm90QStGV21YdE4vMWZydnBwNDdSL21Oa3RHRnNlWDRU?=
 =?utf-8?Q?59soXpSHMwYgekwAMuRoC0wsus82Pg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c0FXeStLaHZndWY5RllCbnJxZFJwc1hQZmFSeitFTThvNjJpdjY5SVZJYVM2?=
 =?utf-8?B?UHhhcXJkMXBRei9UU2tDcEI5RExCcWdUWG5uQTFYRHM4SDZabFBteFQ2Smd6?=
 =?utf-8?B?N3ZYZVV4dzBXdmtqak9iQXlqY005eFlsaElEVjlvL2ttdW5QNWF4dm1DL3BK?=
 =?utf-8?B?MFVOcXhRM0gxeUdjdTdlRERSQWI1Q3ZqeDh0NUdYaUltc0ZSWENBa29maXA2?=
 =?utf-8?B?WkJXZUVvN2FNUXJ3RENGNy9oUFdLV1lOUFJiTE5ra0ZJenowVnF1ZVNJU25w?=
 =?utf-8?B?akJkMVdDV2Q2dldHRVlYL0ZXZ2pNMmRhSmtReDFmOGhvNjJ1ekJ3VlA0YXBh?=
 =?utf-8?B?QWVCdGMxc1VFOWM0WmdUK3JYMldkUEFjSElWU1hwaVNDK0lDT2Y5eTVjTWk2?=
 =?utf-8?B?dXlXS0pzQkIvVm10N252c0l0eXJnaThXOVI5K0ZPVm5vMUdaM1dKMXhLZm4v?=
 =?utf-8?B?bHdMNGw5NVdoTUQyd0RCOHRlOG9YeVNvSzNyYVBhZnhxbk84bEptUnBJcERr?=
 =?utf-8?B?WEFoSlc0ekNCakRzTGtjMmNqK2Vhc214MkhHcGFPZ3A4RlhRNXBWS0szOUZV?=
 =?utf-8?B?TUJSWEorRzkxWU5ZVDhZSVM2T09NQS9nQXZoZGhiVHl3RkI4elZCdWd6dE9V?=
 =?utf-8?B?R2RqTzMwVE5oVHpMSjk0NjQ2K1ZSdjhlRWpya2J5YkE5QURXOGpLS3NHKzM1?=
 =?utf-8?B?VnlFMWVweTVtVEQ5elowVGI2L3QzVEs3RXgvMUs1L0FrRDBldjZVdGwzLzdz?=
 =?utf-8?B?UTI1NWVSQkk1YlBNdm5Oa3F1cnc3YzRYMDB2R2hzU3IwQy9vUFBWTDZEU2x6?=
 =?utf-8?B?NDdGOFZLYzR1Nlh1SUNJWEtVNVJYQTQwMTJUSElWZnBobUxzTmxVWWdmU1Q2?=
 =?utf-8?B?aDZWcEMrZGtRR2VMUW5pQ1BReDNYeVl0YVR5b2NxblpRMEZsUXFWaEhiSU9x?=
 =?utf-8?B?U0w2NFhpQm9JVHdNMmx3TEx4bW14V0JDUjJ4OFVLQ0dnMGN5Tyt0SWJ0eDZz?=
 =?utf-8?B?bUJpQjhQdXJ1VXpkK2ttbzJwMlp5dnp3RlZuZGNuUVVUSmF4bEU2UWl0L1RP?=
 =?utf-8?B?aEU2NHFPTFU3dk4vdTRNMTYzbzQySG1BM1M2eHNObkphMitKQSs2NVZlYTNZ?=
 =?utf-8?B?Zm1HVUxoNTIxYWpsVFRxYUZvKzZwK2UvUzhkaGh5TEJQQ1hZV2Q1NkpMMVo2?=
 =?utf-8?B?QzkzSU5BVFlkY2hLblRaWmxDSFhrS0RhSlhwNmk5dWJTc20ya3dMSm1PMGlI?=
 =?utf-8?B?em50eGFsS25VdTJRZzd5bllpWW1FeWNGVGN4ZTBpNmRzdEhuK1BHTnhLTW9T?=
 =?utf-8?B?aHFpWnNjbm5sQllGSzA1aVJvZWtJd2ZmREN2eGtNbXJMRFdrNjArM0EzWUJm?=
 =?utf-8?B?VHdVUzlxZElUNm9VKytXZzdyS25MTHJOU1VmYjkzZjVBWE1xTStCaWltOERm?=
 =?utf-8?B?dVBXekRId2trcmtrR1YvMWZ5UzE0WExoYVQyRTFSVWVSWEl5UXM0azVOR1JL?=
 =?utf-8?B?QzJ0bVovWUVKWjBHbXZQK3BuWmR1YnhlcmxJalZRUE1vL3FRcUdoR053QWNw?=
 =?utf-8?B?eXdXVm1mVGU4NjF5cnFZN3Jjd2drWldLNmlZNTFhM2xDZHVaaTA0S3JjYXdj?=
 =?utf-8?B?bG5DR1BtNWVKK3ZDVmwyK1IzYWdNYzQzdlFqUFc2ZEV5bTBhSUtPVFY1TTl1?=
 =?utf-8?B?M0JRVHVjRlBxSTN1SmMzYlR5bTVTTjFwSTJDZGtmdEdmZTlLSGlLaTN0MUgz?=
 =?utf-8?B?dGxkS3V4cGNUVTdNTWg1NS9FbVFkVENlSU1jeUFxQVNVTTQwMlppdys0SG5z?=
 =?utf-8?B?VkppUlB4OHlnekJXV01ZSXdXekxJWE9WT0lMYS9KWDhnUUdITlV4My9UMnNG?=
 =?utf-8?B?MXNGL3FRNTBydEZIWEdoeHNTQTBab3daSk5iUTVlMEVKU2lGMk5mclI0VHZT?=
 =?utf-8?B?RGo1KzIyeW5SMG9wV2h4eWZ5TGtXVlRNL3gzYXZJV1VhREZMaThNT05PMkRu?=
 =?utf-8?B?NjM1YXNDSHNOelBzNmw0TmY3Wm01Yk9rWnRDTWd0M2E2eFRRbklGQlIrTXlU?=
 =?utf-8?B?WVZ2MkJTMEwxRzkyNE9VcUVWcm42Tk1nb0pDUkdBOVVxSVhLbWdWbFhUSkov?=
 =?utf-8?Q?Muirs23bR9c7hRGwU4Igoqnn+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed610efe-207d-4687-3d0e-08ddd6cce99b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:42:53.9053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qn37wP827V1u0oSk574spJOJ2lzXiwFGdY8gPSZ0hjI/gIlgYXA4sepwTNDTXgzvzOhN9kvch3TFNOGOSoiGww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

Add Image Pixel Interface (IPI) support for v150. Check the ipi_mode
register to determine whether the hardware supports IPI.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 82 +++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 8051cfcd8ee158c5efccae9aff124c01a878e916..48ae455a77b2365b6df8a79a366b37c7f1dfe590 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -40,6 +40,11 @@ struct dw_csi2_regs {
 	u32	msk2;
 	u32	phy_tst_ctrl0;
 	u32	phy_tst_ctrl1;
+	u32	ipi_softrstn;
+	u32	ipi_datatype;
+	u32	ipi_vcid;
+	u32	ipi_mode;
+	u32	ipi_mem_flush;
 	u32	int_st_main;
 	u32	int_st_dphy_fatal;
 	u32	int_msk_dphy_fatal;
@@ -90,6 +95,11 @@ static const struct dw_csi2_regs dw_csi2_v150 = {
 	.phy_stopstate = DW_REG(0x4c),
 	.phy_tst_ctrl0 = DW_REG(0x50),
 	.phy_tst_ctrl1 = DW_REG(0x54),
+	.ipi_mode = DW_REG(0x80),
+	.ipi_vcid = DW_REG(0x84),
+	.ipi_datatype = DW_REG(0x88),
+	.ipi_mem_flush = DW_REG(0x8c),
+	.ipi_softrstn = DW_REG(0xa0),
 	.int_st_dphy_fatal = DW_REG(0xe0),
 	.int_msk_dphy_fatal = DW_REG(0xe4),
 	.int_force_dphy_fatal = DW_REG(0xe8),
@@ -115,6 +125,31 @@ static const struct dw_csi2_regs dw_csi2_v150 = {
 #define INT_ST_MAIN_ERR_PHY			BIT(16)
 #define INT_ST_MAIN_FATAL_ERR_IPI		BIT(18)
 
+#define IPI_VCID_VC(x)				FIELD_PREP(GENMASK(1, 0), (x))
+#define IPI_VCID_VC_0_1(x)			FIELD_PREP(GENMASK(3, 2), (x))
+#define IPI_VCID_VC_2				BIT(4)
+
+#define IPI_DATA_TYPE_DT(x)			FIELD_PREP(GENMASK(5, 0), (x))
+#define IPI_DATA_TYPE_EMB_DATA_EN		BIT(8)
+
+#define IPI_MODE_CONTROLLER			BIT(1)
+#define IPI_MODE_COLOR_MODE16			BIT(8)
+#define IPI_MODE_CUT_THROUGH			BIT(16)
+#define IPI_MODE_ENABLE				BIT(24)
+
+#define IPI_MEM_FLUSH_AUTO			BIT(8)
+
+#define INT_ST_MAIN_FATAL_ERR_PHY		BIT(0)
+#define INT_ST_MAIN_FATAL_ERR_PKT		BIT(1)
+#define INT_ST_MAIN_FATAL_ERR_BNDRY_FRAMEL	BIT(2)
+#define INT_ST_MAIN_FATAL_ERR_SEQ_FRAME		BIT(3)
+#define INT_ST_MAIN_FATAL_ERR_CRC_FRAME		BIT(4)
+#define INT_ST_MAIN_FATAL_ERR_PLD_CRC		BIT(5)
+#define INT_ST_MAIN_ERR_DID			BIT(6)
+#define INT_ST_MAIN_ERR_ECC			BIT(7)
+#define INT_ST_MAIN_ERR_PHY			BIT(16)
+#define INT_ST_MAIN_FATAL_ERR_IPI		BIT(18)
+
 #define INT_MSK_DPHY_FATAL_ERR_SOT_LANE0	BIT(0)
 #define INT_MSK_DPHY_FATAL_ERR_SOT_LANE1	BIT(1)
 
@@ -449,6 +484,48 @@ static int dw_mipi_csi2_phy_prep(struct dw_mipi_csi2_dev *csi2, int bpp)
 	return ret;
 }
 
+static void dw_csi2_device_ipi_config(struct dw_mipi_csi2_dev *csi2)
+{
+	int dt = media_bus_fmt_to_csi2_dt(csi2->format_mbus.code);
+	u32 val;
+
+	/* Do IPI soft reset */
+	dw_writel(csi2, 0x0, ipi_softrstn);
+	dw_writel(csi2, 0x1, ipi_softrstn);
+
+	/* Select virtual channel and data type to be processed by IPI */
+	val = IPI_DATA_TYPE_DT(dt);
+	dw_writel(csi2, val, ipi_datatype);
+
+	/* Set virtual channel 0 as default */
+	val  = IPI_VCID_VC(0);
+	dw_writel(csi2, val, ipi_vcid);
+
+	/*
+	 * Select IPI camera timing mode and allow the pixel stream
+	 * to be non-continuous when pixel interface FIFO is empty
+	 */
+	val = dw_readl(csi2, ipi_mode);
+	val &= ~IPI_MODE_CONTROLLER;
+	val &= ~IPI_MODE_COLOR_MODE16;
+	val |= IPI_MODE_CUT_THROUGH;
+	dw_writel(csi2, val, ipi_mode);
+}
+
+static void dw_csi2_ipi_enable(struct dw_mipi_csi2_dev *csi2)
+{
+	u32 val;
+
+	/* Memory is automatically flushed at each Frame Start */
+	val = IPI_MEM_FLUSH_AUTO;
+	dw_writel(csi2, val, ipi_mem_flush);
+
+	/* Enable IPI */
+	val = dw_readl(csi2, ipi_mode);
+	val |= IPI_MODE_ENABLE;
+	dw_writel(csi2, val, ipi_mode);
+}
+
 static void dw_csi2_enable_irq(struct dw_mipi_csi2_dev *csi2)
 {
 	u32 val;
@@ -583,6 +660,11 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 	if (ret)
 		goto err_stop_upstream;
 
+	if (csi2->regs->ipi_mode) {
+		dw_csi2_device_ipi_config(csi2);
+		dw_csi2_ipi_enable(csi2);
+	}
+
 	dw_csi2_enable_irq(csi2);
 
 	return 0;

-- 
2.34.1


