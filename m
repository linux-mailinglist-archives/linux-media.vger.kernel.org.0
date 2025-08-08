Return-Path: <linux-media+bounces-39165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80377B1F0DF
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9667D168EA4
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465DD292B4D;
	Fri,  8 Aug 2025 22:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KAdohx+x"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013002.outbound.protection.outlook.com [52.101.72.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2465B28B4FC;
	Fri,  8 Aug 2025 22:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692879; cv=fail; b=c3ugzhtLMydE05Zp1TgG+RdcUGGFG4lZwkZFTn13QU/S6+n4kNHIPkF7bBxfbT68vXuxQcql+TTiD1FIsCaAAJpxJmtdwoFqrnfyrUnWClwA8tPMSEvWMnbJ971hdwzmxOerCkw+XLJZLExoCzvFXzRhpINRGGOVBS18JAX5QTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692879; c=relaxed/simple;
	bh=P0cWY33axrAbWjPnoh5JbJ9affskFSGaZn7Cx1phjhc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Q4YxU8BdJ0Ut8O+mC4AGuWpIZkm1OI6NeZsqlfonOVVAfKa2k+Q3/qIDY4Z6pHPDejY9zueT0ygkK3ZqMDtuj7kBas9F3IM40TakLKJUTq9sPfV2Jwxdb/L4kkRspwpslHQevvD09M0fWwMCe8YeVghNHSjbnMY821bTnaNztdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KAdohx+x; arc=fail smtp.client-ip=52.101.72.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/QqxwJgpzM7N84Hi4VHGrrDaPf+4I6iUL+de4rnZZYop4lMem15ioukQ0k5F1Fgw7Bt8Wc14RFlykWWAlzl5b/shaB9Ai9Wy7xXNh6nMjpJ5QZ/SDaTRyb+nzrXN/IshKCgPz5xd5dx4pJgJtghLehkAyrqltb2xLxwfvbYWl4yJRzSpj4ZHD/Txt/PSd++8tsWw7x8uBkm2m2Tz37BPCJ5L68cSIwg0bgNfWICvJHT5PbT5F3K60f+Scsf9p3G0A5BGCpffsEL5LL3o2UjWNp2NDMOV4GWLyx79W3V8Ivmw2TtYg+Y7FBdm+eS56GxnryAoOJ36JYbJemVtQjwfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2UzCjH/EnDnKxw/6VOmd7AP8mxTGVNNFEuwqurMA8E=;
 b=jY7aLvwAhX8ORkaTq28pMz/LylqYwoJNvGy1MI1zOJO5ePSGyBt9fjU4RoDk7OAk2ykRZT+8RX34jvbbPLXyGtDR3U7VLV42ZcMxc9RBkG17cC5HEv1667DnmzCA1LQXRwfrg98AAPsOvoQIQaf78fHah3WCVEuxkzYyLzyTFoQbrzPHWIJT6UjZK6drrqARTt1F15eXmfPkx8A2HJnrL/TPe7s7Y0Dkgm4nt1W0yDfVVMRQ65rt//TxrTARLfjG4g07boDaqfYuqxlSd756czWpaZQ47zkoCPXK7CjYiZMtyhc9cXLDNEby8ZXNkJmT61pQYzE0SbtWPZmgNgEJrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2UzCjH/EnDnKxw/6VOmd7AP8mxTGVNNFEuwqurMA8E=;
 b=KAdohx+x/ddE2Vm7htVeSEcSg6pzWAlPojdGLnvRHrnUzCbzR6//cMLS/QLd9ioHKT8jeiG+dPB4CSTGrsniCnVqRqU/Xwfs+WuG9ib96R8Wuk/r2aP4vx26gx2SyErWuRXbQS388dwPmTUzXHGcLy1nPvQ0iucBSrxH68VTr3RKne7aZsFWMXfA8CTBTG1X8ZDgiflA6tmWqOWTvEUtIDu2RindZFhTVZ8dFYMPnanUsa65jUpspOuv8pBkesO6my3XVGZ05FBDS1BEoYh4sPaisSoAWIlGYIh1fEjV1GYHnfOvOnUWiPQ0Sdq97x4atPH1Lqk/fn3dglVTd6LwjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:41:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:41:14 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:16 -0400
Subject: [PATCH v2 13/32] media: staging: media: imx6-mipi-csi2: move sd
 imx6's specific initialization into imx6-sci2.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-13-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=4741;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=P0cWY33axrAbWjPnoh5JbJ9affskFSGaZn7Cx1phjhc=;
 b=35KF+7h8gD+uPBq4T/HiMzUEda9azgncl/NJBWP3bcwk0SCN9USFkPK2PpwuWXBlCuWBdJT4x
 gWXdOzfKshLBx9TQq68TULokToHia3Ni+Uqy21osWoVdC+BwsGufhfC
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: 671deea5-015a-4300-e073-08ddd6ccae5d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bGRhQXRXU3BZejlTandWRTNpc29vMWdROU1PdVg0TlJtRXhaMW9zT2RscTNX?=
 =?utf-8?B?UlhvaTJlNXpaSyswK2VreWNBdGt2SkwxemoyUzRqYTB0cW92SXJ3d2pCR0x2?=
 =?utf-8?B?T1U0ZW82WWJKU2xaS014TkRvL0EyeGZxSjA3dlRWenJYUzFSMHh3RVRKcmMx?=
 =?utf-8?B?cTZRTzRheGJwaEdKcjdhei9JdmlQOG5aT29LcUZ0TFlWYjg1eUI5aUFLcStx?=
 =?utf-8?B?bnlPMWtmVlU0Y1hzVjBPMXhYcHJyTUpEZjdhZHJBZjVFY1FVVjNtVi8relpL?=
 =?utf-8?B?T1NQaSswR3IrbUxVVkUwc0tUUDhUZ09yRG9vRHpsRWlZaHNRMDloWlBBRTNU?=
 =?utf-8?B?Tzg2NHQwT3JNSmdjYWh1dEpLaGhkZ0JxRGtwUlVGSzVrbkF0V0JaM21VWk5u?=
 =?utf-8?B?QXEzUkJnSjJsY0xJalJVUHl4VnlHRnJXektzL3FISmRDZ0xSSnM5Yllkc1dF?=
 =?utf-8?B?VXQ3eis4ajBYemFobTRuTzhyV0JFTjJETy9CVTVCRUlNSXp6SW54SVltZnE1?=
 =?utf-8?B?b2ZBcXBJeXBLNUZQWWZpTU5XVW1hTUFQUm0wT25SbnVpTHhZM0NUOVhBQ003?=
 =?utf-8?B?dTRUUkZIOGxTTEExWSs0VEJoMDZocWNwSE1TaFhuaWNSMFJFQ2Nwck5rUHF2?=
 =?utf-8?B?Z2xoVjdjeUkwVGc1eHV6VjZkUERSN1NsdkJHSFEzRW0rYVFlMWlBR3NTY3NG?=
 =?utf-8?B?L21SaTk2TWdQak1yK0JsRzhvdW5PY0picDdBU1hVVC81U1VtNzRjNk9VSlV5?=
 =?utf-8?B?OG14c1djM0Fud2tmWHJZd1NLWnIrSVZLWjlBM0dvV2xJZkczbCtZejVGeElh?=
 =?utf-8?B?VlN5QUZVTzZITlFvYUw0dGJTZlkzelM2dVAvSzhvUGprN2NwQi9CS3U2MjhV?=
 =?utf-8?B?STBKcEhycXFHZVl4Z29zblA2WWIwUzJwZXJxYmdQcVoxQWs3N2FQQkJJT09y?=
 =?utf-8?B?UXh3YThMY1dvNFRNOWJRSDdwRGpBUVV4NUV3ZWdSWXlBcW9hNllUMWVwMUhI?=
 =?utf-8?B?NUYxMnMwTjRVWTZwMC82c1FUREd3ZG5YSi8vek9GN2MyNndJVXJhQ3ZBRWVW?=
 =?utf-8?B?cXBkWWI1TUZ3V2w0ZVFsTFBBbk5zM2EyZDBWZDl6dmNoVmdWemdvY3NBTHMy?=
 =?utf-8?B?UlNhOHAwR1d0eW9jZThhSkc3YXI4bEJ2SzVNVWZZbUhBSHlNeHJsMDhESGo0?=
 =?utf-8?B?TEduOXlZaS9HcFBkdnFCMEdkaGViYnpNUHlCRGVkRkVHK29icTBKUjdFcUk2?=
 =?utf-8?B?a2lHd2RaeWQrdXd5S0Y3clczM0h5NGE2WUc5bTZyVEw5SFhaRi95OWxFZjBE?=
 =?utf-8?B?WUxtNDUyWktkZjZOMndrWndIdHkycVVNVEx1U0tqekhXYjQ1ZjJnSDhaWTFk?=
 =?utf-8?B?RXdJU3A5WUhHS1VlbWUwTkt2eXBFZStRNG9HOUJTOVh0dWRBeWhUR0RvaDFM?=
 =?utf-8?B?dDVLdVRtSU9oRWtQTFBPK0RtWFJ0OTZYcG9pMFFiZ1liblZYQmlMc0FUOWpE?=
 =?utf-8?B?alJ5c1B6NnF3Vm5CVDNYYmxoYzRLTzI4anpIVnFqbHZXRHlmNkxGZTR3dEVG?=
 =?utf-8?B?N0JVamhRaHdHdGdBeno2dGxoVUFlS3FXanY3MkZiV3ZEMzJ2VzhUTGhMTzhB?=
 =?utf-8?B?Qk44SWdqd2g0K1hsTiszT1VRd3AvdHE1TXhnRU81N3B6MndFb1dzbDFrZG9z?=
 =?utf-8?B?Y1hnWFJhQ1p6MmtjNW5BeG9KYWpLRHBYeW0vYXhlYVFWUUordUxHdGJ4Kys4?=
 =?utf-8?B?SFA5UmpObFBNaG9RSkQyMzZTUlpQbnJEVFVKOVJlR3R3YlBVa1N3REwwbjVJ?=
 =?utf-8?B?VVZLQWFMSUcrcVg2K2M0ckpUdFpqTGhvK0dhN0JKWEFoZTd6QlpLQ2FEU0I0?=
 =?utf-8?B?cDlFUnZlMU9QOFZsNWpuNFg0eEs3ek5CeTR0a1dnWDViTUtHZnl6aWlicGQy?=
 =?utf-8?B?SjZINm9QTEdqK0RXeStlR0RQZ1o0QlAyNC9ZL3ByYWd3TTBPaHJ5STg5UXJE?=
 =?utf-8?Q?dlT6CXH9n0KKrj7f8mKDifOmaQe6WM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RVZGYllXZG9rQTBzWkRlRkx1akNLRXZIakFjUldTZWRJYUNvM2ZlaVB3QS9V?=
 =?utf-8?B?ZjUzRjVqWjE4SE1lSVRCYzF1bnVielZoMTdIbzlPRG0xUGs0RUdZejNmRG5t?=
 =?utf-8?B?MmVHa1FzbnFmR291Y01KVUQrTkRJbGJWano4a2V3bkZtaFNqTkRpOTVQZ0JZ?=
 =?utf-8?B?N1NxWTEwSlZyaWpWSG5SeGRRd25qTVlkNU1OK2tLWUdMcHRRVVk0VlV4cmtI?=
 =?utf-8?B?MGp6R1Q0Zk9DY25IQndqZjN5Nk1UTXFLTXpaWlZMQmZUSC83VVpGMWFkdTJw?=
 =?utf-8?B?VU5EaExDQXhhdmdETzFwTFErYzdsTVpEZWthcnQyenQ2ZEJRNGxPN0Y4clRs?=
 =?utf-8?B?aTV5bFd1QzhOUnNlTXpHUVJOOE1OalFmTi9EYmRSb3lWVnBURlN2MTZ6K3dU?=
 =?utf-8?B?b09scmphK2xQMS9HYVdqOXR6QURJYTB3QUhLclNOZVNTckpRazhuQnRpTnBn?=
 =?utf-8?B?UnB6NWRIV1NzZ09vZVJOcXdZQmYzem1RRmJLWU5pN0U4UDgwQWJEV3E2UFRT?=
 =?utf-8?B?azNzc2FiWmViT3Y1ZjZwT1YvUVRneUNPYmhCeUpaNnBJWlNWakg0MXJTeU1P?=
 =?utf-8?B?L0dUOWcxQk9udE9QNXdvLzlzeVJTUXhrOXA2dEpOTmF0ejNFMElMM3BwWmhz?=
 =?utf-8?B?NVU1ZEdPcG04WUl6UysrTXpsR0dxcG8yQkp2YmVWLzJtWGNoT2JWNmI2U0sw?=
 =?utf-8?B?WTRmMW9vN3FWRjFmazRyQVNMQVBXYlVMWWlSQzV0OWhyREJta0N0dlJIdURG?=
 =?utf-8?B?YUFxbS96Q2drZlVNU0xFMmxKZ1hRQlU0c3BJQnpVV0VWWXV0MzZqRnI2RWNW?=
 =?utf-8?B?N0tXZDlWODVKTm1kYmRLQjJYN0VpcDZJb2ZDWmVybEhqbnU2YlcvUkJIcXNE?=
 =?utf-8?B?WXpTdk91VWRNWlZRUWNtb2R6ZWVtemplRWpJRGxZOWFtUGdzWmJCMG96eGQ2?=
 =?utf-8?B?TTN4V2RVYUFOU3pFRWNtMlljbkJ2NkRCSlpvNDhXbWVhUG1EODg0Q2tHTHRq?=
 =?utf-8?B?UzN2d3JDMDN6bXh2RDJPb3RMKzVINk56Y2dOK25vVzlSTzFOcXlUMzF1NFZG?=
 =?utf-8?B?YkJEUzJTN0RGSEJ1eForUmI4YWhKcUVtME9Ic0lBUStQVjRibHc1RXBUSVdT?=
 =?utf-8?B?Z3JaeVNyVU5UazNoSmNEdWh5OUEvRE5SbkJ1UWwwVHFCVUpjRHJMYkxUMys2?=
 =?utf-8?B?N3p4TzRxNmpCSHo4L0drRXZ0cW41K2MrMXVucDN3NlBtYmN0TjZOcWptRFdC?=
 =?utf-8?B?ak92YlFOYjFDYUFTRit0MFJ0ZER0RzYyRmNQaFVRZG5nYVR6VWhPdTdYTFVp?=
 =?utf-8?B?dnAzUkYzbUdnN3NNVy9hTlhSSGhYUlQ3VFEwNDhMUlV4cEFpc2JZZXVTbHd4?=
 =?utf-8?B?YzI0YytJZ05DRENaNlpQRVJ0bVNrelUvamY4UjRGNy82dUhjZHY1UW12TzMz?=
 =?utf-8?B?dFpmcXoySWZoZExpY0Y4ajVaTHR0eUprZXo5cTE1bXRUNDlJak9mcWNMOGpz?=
 =?utf-8?B?UjNpT1FzNzI2TGlReGJ2UVVFUUdoVUxwa2ZoWVByeUhkVHdrWjFubkhpRU1i?=
 =?utf-8?B?OEZrRGRHN2w1cERtc3EreTM2dmIzU0VjZGZpMjRzbXJOU1lYT01IT1V5cHdX?=
 =?utf-8?B?UTRadlYveEhKUk1BdmRrYWFKc2RpQm5VclVUMFB3QTlnMW1pYnYyWnovQmVa?=
 =?utf-8?B?akZSOUsrQXBBUXBvd1kxUEg3ZEcrTDRva3c0TkNIdk1FVm9xL1B3bTVJNlFH?=
 =?utf-8?B?b2RJbzV3a1JTQVdrSUpUVWdGaENjZ0k1VVdUSnRSOUVWL2Q4SVJCakt5ZU1X?=
 =?utf-8?B?Z2x2aFlwQzE4TzB3OU1sKzNnUWhkNFE5ZndWdGZTeXRmTFZSSzlVZDVxZnBy?=
 =?utf-8?B?cDkvQTBFdDVLZHNLMXY5ZUo1QzJkaUlkNVJjQ3JEMkNoNWtheUR0Y1laSFkv?=
 =?utf-8?B?dDhwdTEzRFV2aHNtRVNxZFJIUG1QMDRtUVZuTVUxa0ZRSVZZOW1TbjNEV1Ix?=
 =?utf-8?B?UnZicGZhcmlSUEpzb0R0eU5vNWNweGF6WHJ3VVJIdWFXYXZZLzdkY0JmYTlO?=
 =?utf-8?B?RzdzZ1Z4OFVmempwZ3lncDhkbE95aUVheExzRGwvcDE3cWhSa3FuK1ZISU5y?=
 =?utf-8?Q?4OBJE83uRJMvKd/9bauXbknbS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671deea5-015a-4300-e073-08ddd6ccae5d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:41:14.5599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bgyf3F2PiOGOt4IDAUrxYndy/91DT84tjAXcnD5vIOQC0nkBasXQ4EuirPtWv4U6NOqpfSU5fEdA4VEEqERl2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Move imx6's specific sd's owner, name, csi2_internal_ops, grp_id into
imx6-sci2.c.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-csi2.c      | 23 +++++++++++++++++++++++
 drivers/staging/media/imx/imx6-mipi-csi2.c | 29 ++++++-----------------------
 include/media/dw-mipi-csi2.h               |  4 ++++
 3 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-csi2.c b/drivers/staging/media/imx/imx6-csi2.c
index 72eff685fad99b3def46cf2866565191b7de9a8b..66274d8d73b67b35682bb82a9eb745bb24da7ae4 100644
--- a/drivers/staging/media/imx/imx6-csi2.c
+++ b/drivers/staging/media/imx/imx6-csi2.c
@@ -19,6 +19,29 @@ struct imx6_csi2 {
 	struct dw_mipi_csi2_dev dw;
 };
 
+static int csi2_registered(struct v4l2_subdev *sd)
+{
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dw_mipi_csi2_dev(sd);
+
+	/* set a default mbus format  */
+	return imx_media_init_mbus_fmt(&csi2->format_mbus,
+				      IMX_MEDIA_DEF_PIX_WIDTH,
+				      IMX_MEDIA_DEF_PIX_HEIGHT, 0,
+				      V4L2_FIELD_NONE, NULL);
+}
+
+static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
+	.init_state = imx_media_init_state,
+	.registered = csi2_registered,
+};
+
+static const struct dw_mipi_csi2_config imx6_config = {
+	.module = THIS_MODULE,
+	.name = "imx6-mipi-csi2",
+	.internal_ops = &csi2_internal_ops,
+	.grp_id = IMX_MEDIA_GRP_ID_CSI2,
+};
+
 static int csi2_probe(struct platform_device *pdev)
 {
 	struct imx6_csi2 *csi2;
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 29b27a58d9bcaf882d7f434605ee7b424b2588bd..40a146faaa9c79304b1e1f16e608b3b10eae6c80 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -15,11 +15,11 @@
 #include <linux/platform_device.h>
 #include <media/dw-mipi-csi2.h>
 #include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
-#include "imx-media.h"
 
 /*
  * The default maximum bit-rate per lane in Mbps, if the
@@ -44,8 +44,6 @@ struct dw_csi2_regs {
 	u32	phy_tst_ctrl1;
 };
 
-#define DEVICE_NAME "imx6-mipi-csi2"
-
 /* Help check wrong access unexisted register at difference IP version */
 #define DW_REG_EXIST		0x80000000
 #define DW_REG(x)		(DW_REG_EXIST | (x))
@@ -544,17 +542,6 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int csi2_registered(struct v4l2_subdev *sd)
-{
-	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
-
-	/* set a default mbus format  */
-	return imx_media_init_mbus_fmt(&csi2->format_mbus,
-				      IMX_MEDIA_DEF_PIX_WIDTH,
-				      IMX_MEDIA_DEF_PIX_HEIGHT, 0,
-				      V4L2_FIELD_NONE, NULL);
-}
-
 /* --------------- CORE OPS --------------- */
 
 static int csi2_log_status(struct v4l2_subdev *sd)
@@ -605,11 +592,6 @@ static const struct v4l2_subdev_ops csi2_subdev_ops = {
 	.pad = &csi2_pad_ops,
 };
 
-static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
-	.init_state = imx_media_init_state,
-	.registered = csi2_registered,
-};
-
 static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
 			     struct v4l2_subdev *sd,
 			     struct v4l2_async_connection *asd)
@@ -709,14 +691,15 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	csi2->regs = &dw_csi2_v0;
 	v4l2_subdev_init(&csi2->sd, &csi2_subdev_ops);
 	v4l2_set_subdevdata(&csi2->sd, &pdev->dev);
-	csi2->sd.internal_ops = &csi2_internal_ops;
 	csi2->sd.entity.ops = &csi2_entity_ops;
 	csi2->sd.dev = &pdev->dev;
-	csi2->sd.owner = THIS_MODULE;
 	csi2->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
-	strscpy(csi2->sd.name, DEVICE_NAME, sizeof(csi2->sd.name));
 	csi2->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	csi2->sd.grp_id = IMX_MEDIA_GRP_ID_CSI2;
+
+	csi2->sd.owner = config->module;
+	strscpy(csi2->sd.name, config->name, sizeof(csi2->sd.name));
+	csi2->sd.internal_ops = config->internal_ops;
+	csi2->sd.grp_id = config->grp_id;
 
 	for (i = 0; i < CSI2_NUM_PADS; i++) {
 		csi2->pad[i].flags = (i == CSI2_SINK_PAD) ?
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index 4e656f09c81db9dc9f232ed061f70803a5478c85..dfd25e23ea93fd53b064471b6a9557ef9c070fe7 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -10,6 +10,10 @@
 #include <media/v4l2-subdev.h>
 
 struct dw_mipi_csi2_config {
+	struct module *module;
+	const char *name;
+	int grp_id;
+	const struct v4l2_subdev_internal_ops *internal_ops;
 };
 
 /*

-- 
2.34.1


