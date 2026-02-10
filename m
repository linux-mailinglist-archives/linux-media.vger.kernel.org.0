Return-Path: <linux-media+bounces-52534-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOwqHPxni2kwUQAAu9opvQ
	(envelope-from <linux-media+bounces-52534-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:16:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 312C911DC4B
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4A3330B75C3
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 17:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7998A38B7A7;
	Tue, 10 Feb 2026 17:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bN+zyKuZ"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DACA38A739;
	Tue, 10 Feb 2026 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743575; cv=fail; b=Z10GLr1O7z47IGDr/dykgVYBlIGuV1sT7tLax4KNFhMv2PUdjuL/re+yqUZWqnBf/dQFTx1n0O7Vg6hm1NtotvDzlTCso63Da8erbJYjejXV3E23REiX/ddT8Ar++CZAN9tW68IeOBlIagEvAD/vV7rxBkDwKH/h7RdyHtUdkTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743575; c=relaxed/simple;
	bh=LpVgh5SrcFhWrV8HZ6ko8hSDTDTdqGpMXnP4KHuNGXM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bfVGlVy0GmewCM2DstX1Z5YSQo6tAhBMLtEtewS4Xej5Is/B1zsWNzqrGt7w8APr2Oi94fYgDPo9QYVMSKBm8/rf/4Z2vlLo98tljnukiSOwMqdmCpLg86m+Qy1nRHEJd1yXs0nZOzWkNeg/hM8ina59/xVjnZen9HRckz7imRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bN+zyKuZ; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEVAoX6X6wnDRkCRPnrnTgTXM5jRf08hMod83FzIvh2cTCt/ery0qAMSLODuHIpHHub5cr8IaMeTjrgMXyofoiscwKYZuc1KAl+Cz3+UsONQY/22XLl8qqXWLoPcAIx28GoLxDFseEty4zCuEoHUxPBYCwk8hba+MYnjLl0fEAwJpTVgxJL1HfT1YI5LGhLFkUgK/kMPdm7VbzzfcmloRuJRRyq00fm1nBSldp4NHqX+xP3vxYhRC+j2sBoVNMgC33giA9nYiiHRLQFOayzl+4Ygcg0OKRSAkLyLExUogGwBIDHrp6j/1KhaOPZR6avh5/gb4XjqFxI7Dc50A+ZcBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biqtHjCG/ruYkHXIUw7k/+Hsjc4D1yDc/8Qg7Ej6Isc=;
 b=fFLH5j25bMEyi87inp30fdcA2S6ML2dzbV+Jc0IIX7oTfKx141iLIKYh4nU/e3a/LtMfWh28J4jhU2ql5X1fICbCwcnTtOHQPLLtE4TzHW3fza/JqR4qxfR6QNhR2RRv60DUVc2n80+tn/ZoeLjWmY55FI1HtfWHuEni5wLIym3qPbmx8YG0bkGrqoFCJq+MltTnBlNGcwUgqeWNLUB5SWGWEdy8dHOHvyS4q6Xg7ozDNVJ5KUV+lCfiJ3ymnusJZywk4BZGaRZaWOHc/ds74f5AADrXN2N6ZSGwaSV5CLjq7biBy2Bk43VZRGcbvOAZJ8BgwWz1uuzRXWNeZDeHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biqtHjCG/ruYkHXIUw7k/+Hsjc4D1yDc/8Qg7Ej6Isc=;
 b=bN+zyKuZryUTWcdLqNnfGcPEygCAiWQMq3DNAo8FZepL0b89KqaAtHuB4GzIzpu894SaYcdTM0qWwy0lD9Q6At7z/Pv/ZL6gAjkFASHzAHE7kf1e3qFcnQVkx7JfnmjUAA0TenLB1U6o3oApqLu2/xvw0QXoalyPBH1BUnkRg211DxG1svFlHaPN+CxFAnhxGHo2imW169Hp1AIyw2CYdaCk3xqjW6LD1Zx9MD4VyQxqq1oJmi17hmSpu7RiKR0zTKodYA2DdDwbc15XH8cNRa/qX7GYEdGz2O4GL3Z1FoaD9pvXUMye2+hWQtxDJZfO777lp/KSk987yDXI2Eof2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8428.eurprd04.prod.outlook.com (2603:10a6:102:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:11:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 17:11:48 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 10 Feb 2026 12:11:13 -0500
Subject: [PATCH 6/6] media: synopsys: add i.MX93 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-imx93-dw-csi2-v1-6-69667bb86bfa@nxp.com>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770743486; l=7144;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=LpVgh5SrcFhWrV8HZ6ko8hSDTDTdqGpMXnP4KHuNGXM=;
 b=PXdhSuGGJbZviqCRdDO4NfhhUXLF/DCQxKvPPLrX/4IjjX2vhcDjKFJzPFA0rHhAPTpAwUSrD
 fq07FRr9flHB2HgM8IKfozSWrq/eUoQu2u72/31G1iSPWWCvEFpC6ai
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0102.namprd11.prod.outlook.com
 (2603:10b6:806:d1::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb15d86-86bd-40b5-177e-08de68c779c7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cHRNc2RGV210R0tvYm1mWkpJSkhmM2h4T0czcEFpaHlsL3VYc2xOSzIxdjA3?=
 =?utf-8?B?dHp1NmtTYTRSLzhEMVUzeHlJdk9nUkdBcVBNbEQ3bXZJL0tOQWpxN0tUdW8w?=
 =?utf-8?B?bTlpTDZTSDhQR1BMTDVZbHBGbnp0YjdFQmYxMklDbkZFWCtRR2kyQTFsSmVs?=
 =?utf-8?B?SDQrbmEwenhTRnNHQlpteHBZUi9KWnFTcit1cW1OellJdlNtR0Zva3VHYTlQ?=
 =?utf-8?B?K0RRS1l4ZHFuUWVyeWZGZWNWbmRMOWJ3SHptREk1S25NWDQ0cjhJM0NrQ2Jn?=
 =?utf-8?B?TDFqQ0NTVlR3YWx4NEZobDNaTlI2R2VZSEhNdURiaFVVS3loMmFSdVd3UUQ3?=
 =?utf-8?B?NjNaOGNtZGpVNVNVRit2L0h3Q0VDSThMVWdjWTRDNllqREZnd2ZPK3pISnJ4?=
 =?utf-8?B?WnNJbzM5VTlaRVJIQVBEQWxVV3FVNlkzZTRESVFjZ3lSUzlLNm5rWTJ0NlNQ?=
 =?utf-8?B?Q3ZJd056VzJSUzFzYzdYWlJaMWx5Z0tUY1gzZENLMUZHYmk4azhQbTF3S1Fr?=
 =?utf-8?B?SHFtcmlPWkwrcWlEclA5VkRBdStoN3RXYVFiWVVTWTQwQS9pdXRNbW1GQzV1?=
 =?utf-8?B?MGc5Vkt5MHViczgvL3VtSmJmb3N4K3kwb0swdS9xYUc4dXNJVStIUGNKZFZv?=
 =?utf-8?B?L0R0NHdnUlNBeXNHa3c5MlAxOWNZdXN3TUdBRXJHb3hWVWZzcWZOVjlkVURJ?=
 =?utf-8?B?NUVHU1k1aU9JUkN3b2xCRS92TFIzeittVExOTzZqMVVDUHhSd2d3ajU5elVO?=
 =?utf-8?B?ODV3eVpQUllnTDk0c2ZtQkVHOW8vclY1STFzS3psd1haZ1Mwck9UclBGbzVh?=
 =?utf-8?B?Y2IrUmRJQTcvRE5Mb0xNa1JiK0JocS9ueW1vVnpDNHdNZGp1bXNpRjVPZjVw?=
 =?utf-8?B?bXVzVXlxRm5TMFRDYzJjMWNVNGxoNlZheTR5STY2Y2RSaWp0ZjdkTzUxMVZR?=
 =?utf-8?B?T3lyMmptSUM2TnE3eEtCM1E1UFB5QTVMVnJkcWZERlgyVVJiajNDaFZJL2tl?=
 =?utf-8?B?UlRqcXd2SjJ3MXpTUEh4MU5GU2Zjd0ZEcTd0ZERNcVd2YTVMUjM5cWR2aE1I?=
 =?utf-8?B?UFpiRmp3MTRkSm50YjlUS1hkT2ZXWm9tNVV0SXAvUVlSYTNMWThuSHJjZGZB?=
 =?utf-8?B?T1RGa050dXlzazRQUU5sRDY3T2QzZ0U5dERXeVJkL1N5WU1VVUZiR2xPMHpM?=
 =?utf-8?B?KzdaUFNCOHNoSzRmUTVQVjV1dDBNOGZBMlgxczEzOWM3SDlERzZXekY3ZXJk?=
 =?utf-8?B?WlovdGlFcW5GMHdZcFMzdmtWQk84UDM0UkFVWUh2dkNKUHRrc0pHVG9DL1dv?=
 =?utf-8?B?R3lDTWtvMWpsd2dLNnlQOVEzUmlMQW5mdlB2Q0U5MmptODRTV2hyaWdDNXcx?=
 =?utf-8?B?aXk2U1Brb0lxVHlVS1B4MVlDeGxaekhUcWpYVFlTUjV4bHRLYjhsY1hVb2tY?=
 =?utf-8?B?akdXaU85M09zK2ZjS1FLSWQrekpHYVl1Qm9oSkxDUnJSMlEzTDNnTVJwa0tN?=
 =?utf-8?B?YTBlVE5yVWp0ejZGb3l6Z09IZko3Y3R3T1lBUHRoczhSUmZHY1JHYzQzUGMr?=
 =?utf-8?B?b1dmQXZDSFVGeDhnMDdUQ0F1K1BZbUUwVTdXaCtwcnFHNUZ0RlU2aHlXd2JN?=
 =?utf-8?B?amU0b2VSQkRuUTZtVDNnbVVsN1EzUm42RkJCSzJrV3R4bTFFSHB0bHplZWcy?=
 =?utf-8?B?YXMranJaUkVXRGxOTE1MczlMc0c2NGJyVHgxK2k2ckFFQ0hRVVJ2dE1OM0Rz?=
 =?utf-8?B?ZHpSTlhsNzliY1hTSlhSckVzMVlkZG9XanN2ZHRxTldBNzY4ZWNGbDJVb0Nh?=
 =?utf-8?B?cWE0OVNieXBDSXM0MThTWFZ0ODFIaXNkU2dFQ0srNFJaZ3UySzd4cGd5c0R2?=
 =?utf-8?B?djVMNnVxSEJySVN4ODBkKzBsOVlsR3ptS0o2djBLbUkxcHVmM2x5OWhLRnFu?=
 =?utf-8?B?eWt5K0RmWjd6cWUvVWtBWTJyUWE4Q285VDYyVmhMY3A5M05EUWFGRHNtWmhR?=
 =?utf-8?B?Mm95bkcxVkpsRkNxWnJhcSsvMFRLVWZKWEhFQXlHR1Z6eDJmYUZTbXh6T3Qz?=
 =?utf-8?B?bWRmeU1OMzVraTdGcTNGcTM2NlMxN3Y2MnFtVCtxRTRKUXVkQXRVSFZSNEFN?=
 =?utf-8?B?bHN0VVlMYUJvU0xIeUVlb2FGN2xvVi9rOHZOWVdPNXAzRzJJNEVEZUdFQkJI?=
 =?utf-8?Q?vMbCrzg/MuXbpIMK5aeF7Ww=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?S1lkaXFoR3prbzlYaERNSWhIb2RlNC9USG5nekhBajcyZjFVMjFWZlRtQm11?=
 =?utf-8?B?dGxhM2w3aGkxNzBERTZwL3ppMkV2Z1BLRTRtNGlzSHRsWEVFUE9vV3BkcG1y?=
 =?utf-8?B?TlV2TjRudXdNSmh1bk5YWk5aS0Q5NkVaUm5SdmYvcG05WUhmMFBSWm1LTHpo?=
 =?utf-8?B?SDNDVENISDdIVGZxVjFNS3paSDJHL3d6SXBwZUNLWEswVy95VEJDVzkvaDJo?=
 =?utf-8?B?Zyt5eHNXcVRwU2pIUjl2dXhXajlWWnh5cnRuZTZ2VTJybldiV0l5dUp4L09w?=
 =?utf-8?B?NVpGUXFJUm1xNGQzMFNUM0Q3REpPekFJWUpPaVFVTWhJTlYvejUvU3RuUVph?=
 =?utf-8?B?WkNpSDFjbm9rZ3VlcXQwZVlIT00vekNybk9hYjdMTm0wc044Q1VOL1NwZm9L?=
 =?utf-8?B?RFlhQW4ySTdCRzRxMFpyZG96YkVlR3hBUGdCYnFDdSszdEFUOGMydElLMU8x?=
 =?utf-8?B?V3ZOU2IwQ2l3VlRlenpYbnJuSEU4Y0pWR2FUajdNaFUwSkd3NWRsZ3MzM2p6?=
 =?utf-8?B?anA4K2FoZnJRdTQ3SzVWTFEreDVNQm5GUFpEQ0I3VEdRWmZLaVRjUS9xQVZ1?=
 =?utf-8?B?cDdHVzNjVlBJVFJraTdLRnF3Y2hhUTd6KzAyQkNkbzc4NG56VGs3VXRkNkZJ?=
 =?utf-8?B?NGZ2WHIvNmFXUWRrMkRZem9sSHJQT2ZCdU5GRnBiNTNGUTV1eW1KRmdHUTJM?=
 =?utf-8?B?VEVCRTRud0NIaVBqVUFsRjZHeEhPUzJ0MGU1OXAyd3U0dlcyMDlCK043amd4?=
 =?utf-8?B?NUNMcFF5RDFacEhFdUl1SGw3b1h3MzVyTHNTVnVkVEhNdit4S29maXF4bkRW?=
 =?utf-8?B?cWVuaDVaWVJtNmtON25tTjI4RUZEMURsd3ZEdTFZM2NCWVhMK2VzUjRlY2k1?=
 =?utf-8?B?VXlQWkRnY1FnMjZUR2YyWXFLZXlLRDVLT3R5ZktGNlVKYldaRUFub09hQVNt?=
 =?utf-8?B?b3c2QTB4bTg5eXJDcnNqWU9abitKbHM2SmVocXhjNXM3MVlJQ25GV2FwWGk3?=
 =?utf-8?B?VEh6alk3TExja255akl6RjRNRkZXNFZSVnU2ZEc2bjI2bEVVcnRQM3IrT0R4?=
 =?utf-8?B?bXllQ05vZXZYT2xRQVlVOUZNVXZRNWo4WEJGZGV1b2dVL0VGWmhOR2ZJWGE1?=
 =?utf-8?B?VW9ZdFBXQk5nL2J4NG5DUnNMMzBjT0NnMG1obU5ZbXZ3dnErM2NUSlFtWDhR?=
 =?utf-8?B?NzJnK1JnSkZvZkxqQklLMEtGQ0tvNjZ1VCtmQUpOWHNxbnluNzZmem51Vy84?=
 =?utf-8?B?d0gyNmIyeFNrQUw2ZHNlREZnbjhBWXdEOUpkUVRwR2xHLytuRlVsUjY2ckdO?=
 =?utf-8?B?QWl2d0tHSEtlNVB5N2U2TUcyRGg4bEFjY2wvcURvVDFUc2hPK1pKQ25Pd2ZX?=
 =?utf-8?B?eUIrS2QyRThYQVFjbHZkN2FQdUY5SkRvMGFoN2NIN2YwcEdXVGNISjgzU1Rt?=
 =?utf-8?B?bm1tN0dlT3lDS09EK002MzFVVDNaM08vRE1TNktuZWp5UmllNjYrem1YSWhR?=
 =?utf-8?B?SUpGZy9BdDlHK29aSEpJSlQ3cms1d0hUZnlOMm0wdXdxVnhyMk5BOG1PNXRH?=
 =?utf-8?B?Y0pMcEJWS3ZwMEJNTDJuaVVQSlpJRTlKMHkxaUJFUW5xL0hYRkRxalJKVEww?=
 =?utf-8?B?QkNPbVVma1VVM2gxeGhsTjVMRThsZjJvUGxDdURTKzg3ZVpDTmNGbkI0OWx1?=
 =?utf-8?B?UGFWWERRaU9qYlhEVWhJcjhvcmhsMGRjOE85K25odVNvNGJmcXUyeXUxWTR2?=
 =?utf-8?B?STcvamdFVlhpSDYyYVFGcDh5Z2YyeitOYjEyMkdkSG1jQjNCUmozVlY5dStK?=
 =?utf-8?B?WTlWQzZXcG1MNGVScUlscnI3NVhHdWdmR0d0NkM3ZVk3d3ZVVzBPZy9Bemd0?=
 =?utf-8?B?VDZDcWN3dVRYb3BSNXVxdDloL2RQb2ZUZWFlbTFGd2xrQi9iSFRoNkRmOXgx?=
 =?utf-8?B?M1pYZ2liTE9SVmM2UWhYdmNpNXFQOVFkME1yU0s0K20zV3ZaeFc0WFQvZWl3?=
 =?utf-8?B?VytGYzh1YVhDb2kySm5uTHVUdldVU0NpUXoxQzJOTHN2dTRES3QxcWJZS1p3?=
 =?utf-8?B?YTQ3WE4ycmtHcC83MWYzM3d2OWVFeUZLQzJWRDJKNXQrWFdzd2ZldUl1ZDZu?=
 =?utf-8?B?d1pRVmFoRGJJL2d6V25ucFo3VzQ5S3FzZytoU0kxUE85Q3lGdUFpd0N6WWhr?=
 =?utf-8?B?clV2T2trNHdhUmUvSUNmcW1Vc0FDUWlqdURITXBXMzhZclpQbGZaS1ZJOEEr?=
 =?utf-8?B?Z2E0Q016a1ZZVjEwUklkbkV5T0JjblVPSGNRSUk5R2F2ZnNWbzNkeVBKWU1F?=
 =?utf-8?Q?qU2+7CGRYKGvobDnW1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb15d86-86bd-40b5-177e-08de68c779c7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:11:48.6821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2R5DNx/NZrQ2XhnPml4p1gNAN5vEfYieNgTf4RN/YhJBMmNE2zKE0ShPL7Scy8NGbVVpKZ9tlo/MdxbGgKyK5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8428
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52534-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 312C911DC4B
X-Rspamd-Action: no action

The i.MX93 uses a newer version of the DW CSI-2 controller with a changed
register layout and an added IPI block.

The reset flow also differs, so add the .assert_reset(), .deassert_reset(),
and .ipi_enable() callbacks to support it.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 163 ++++++++++++++++++++++-
 1 file changed, 156 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 6a2966c9e3a2eac661fa1f8610c9f021d6e26cf8..5dc55b59d6aeed4b6cb207c8e2ebe0fb3c462644 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -33,10 +33,24 @@ struct dw_mipi_csi2rx_regs {
 	u32 msk1;
 	u32 msk2;
 	u32 control;
+	u32 phy_tst_ctrl0;
+	u32 phy_tst_ctrl1;
+	u32 dphy_rstz;
+	u32 phy_shutdownz;
+	u32 ipi_softrstn;
+	u32 ipi_datatype;
+	u32 ipi_vcid;
+	u32 ipi_mode;
+	u32 ipi_mem_flush;
 };
 
+struct dw_mipi_csi2rx_device;
+
 struct dw_mipi_csi2rx_drvdata {
 	const struct dw_mipi_csi2rx_regs *regs;
+	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
+	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
+	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
 };
 
 /* Help check wrong access unexisted register at difference IP version */
@@ -54,6 +68,21 @@ static const struct dw_mipi_csi2rx_regs rk3568_regs = {
 	.control = DW_REG(0x40),
 };
 
+static const struct dw_mipi_csi2rx_regs imx93_regs = {
+	.n_lanes = DW_REG(0x4),
+	.resetn = DW_REG(0x8),
+	.phy_shutdownz = DW_REG(0x40),
+	.dphy_rstz = DW_REG(0x44),
+	.phy_state = DW_REG(0x48),
+	.phy_tst_ctrl0 = DW_REG(0x50),
+	.phy_tst_ctrl1 = DW_REG(0x54),
+	.ipi_mode = DW_REG(0x80),
+	.ipi_vcid = DW_REG(0x84),
+	.ipi_datatype = DW_REG(0x88),
+	.ipi_mem_flush = DW_REG(0x8c),
+	.ipi_softrstn = DW_REG(0xa0),
+};
+
 static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {
 	.regs = &rk3568_regs,
 };
@@ -302,14 +331,30 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 		return -EINVAL;
 	}
 
+	dw_mipi_csi2rx_write(csi2, resetn, 0);
+
+	if (csi2->drvdata->dphy_assert_reset)
+		csi2->drvdata->dphy_assert_reset(csi2);
+
 	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
 		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
 
 	dw_mipi_csi2rx_write(csi2, n_lanes, lanes - 1);
-	dw_mipi_csi2rx_write(csi2, control, control);
+
+	if (dw_reg_exist(csi2, control))
+		dw_mipi_csi2rx_write(csi2, control, control);
+
+	ret = phy_power_on(csi2->phy);
+
+	if (csi2->drvdata->dphy_deassert_reset)
+		csi2->drvdata->dphy_deassert_reset(csi2);
+
 	dw_mipi_csi2rx_write(csi2, resetn, 1);
 
-	return phy_power_on(csi2->phy);
+	if (csi2->drvdata->ipi_enable)
+		csi2->drvdata->ipi_enable(csi2);
+
+	return ret;
 }
 
 static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
@@ -317,8 +362,12 @@ static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
 	phy_power_off(csi2->phy);
 
 	dw_mipi_csi2rx_write(csi2, resetn, 0);
-	dw_mipi_csi2rx_write(csi2, msk1, ~0);
-	dw_mipi_csi2rx_write(csi2, msk2, ~0);
+
+	if (dw_reg_exist(csi2, msk1))
+		dw_mipi_csi2rx_write(csi2, msk1, ~0);
+
+	if (dw_reg_exist(csi2, msk2))
+		dw_mipi_csi2rx_write(csi2, msk2, ~0);
 }
 
 static const struct media_entity_operations dw_mipi_csi2rx_media_ops = {
@@ -670,10 +719,110 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
 	v4l2_async_nf_cleanup(&csi2->notifier);
 }
 
+#define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)
+
+static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
+{
+	u32 val;
+
+	/* Release synopsis DPHY test codes from reset */
+	dw_mipi_csi2rx_write(csi2, dphy_rstz, 0);
+	dw_mipi_csi2rx_write(csi2, phy_shutdownz, 0);
+
+	val = dw_mipi_csi2rx_read(csi2, phy_tst_ctrl0);
+	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
+	dw_mipi_csi2rx_write(csi2, phy_tst_ctrl0, val);
+
+	/*
+	 * ndelay is not necessary have MMIO operation, need dummy read to make
+	 * sure above write reach target.
+	 */
+	val = dw_mipi_csi2rx_read(csi2, phy_tst_ctrl0);
+	/* Wait for at least 15ns */
+	ndelay(15);
+	val |= DPHY_TEST_CTRL0_TEST_CLR;
+	dw_mipi_csi2rx_write(csi2, phy_tst_ctrl0, val);
+}
+
+#define CSI2RX_DPHY_STOPSTATE_CLK_LANE BIT(16)
+
+static void imx93_csi2rx_dphy_deassert_reset(struct dw_mipi_csi2rx_device *csi2)
+{
+	/* Release PHY from reset */
+	dw_mipi_csi2rx_write(csi2, phy_shutdownz, 0x1);
+	/*
+	 * ndelay is not necessary have MMIO operation, need dummy read to make
+	 * sure above write reach target.
+	 */
+	dw_mipi_csi2rx_read(csi2, phy_shutdownz);
+	ndelay(5);
+	dw_mipi_csi2rx_write(csi2, dphy_rstz, 0x1);
+
+	dw_mipi_csi2rx_read(csi2, dphy_rstz);
+	ndelay(5);
+}
+
+#define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0), (x))
+#define IPI_VCID_VC_0_1(x)		FIELD_PREP(GENMASK(3, 2), (x))
+#define IPI_VCID_VC_2			BIT(4)
+
+#define IPI_DATA_TYPE_DT(x)		FIELD_PREP(GENMASK(5, 0), (x))
+#define IPI_DATA_TYPE_EMB_DATA_EN	BIT(8)
+
+#define IPI_MODE_CONTROLLER		BIT(1)
+#define IPI_MODE_COLOR_MODE16		BIT(8)
+#define IPI_MODE_CUT_THROUGH		BIT(16)
+#define IPI_MODE_ENABLE			BIT(24)
+
+#define IPI_MEM_FLUSH_AUTO		BIT(8)
+
+static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
+{
+	int dt = csi2->formats->csi_dt;
+	u32 val;
+
+	/* Do IPI soft reset */
+	dw_mipi_csi2rx_write(csi2, ipi_softrstn, 0x0);
+	dw_mipi_csi2rx_write(csi2, ipi_softrstn, 0x1);
+
+	/* Select virtual channel and data type to be processed by IPI */
+	val = IPI_DATA_TYPE_DT(dt);
+	dw_mipi_csi2rx_write(csi2, ipi_datatype, val);
+
+	/* Set virtual channel 0 as default */
+	val  = IPI_VCID_VC(0);
+	dw_mipi_csi2rx_write(csi2, ipi_vcid, val);
+
+	/*
+	 * Select IPI camera timing mode and allow the pixel stream
+	 * to be non-continuous when pixel interface FIFO is empty
+	 */
+	val = dw_mipi_csi2rx_read(csi2, ipi_mode);
+	val &= ~IPI_MODE_CONTROLLER;
+	val &= ~IPI_MODE_COLOR_MODE16;
+	val |= IPI_MODE_CUT_THROUGH;
+	dw_mipi_csi2rx_write(csi2, ipi_mode, val);
+
+	/* Memory is automatically flushed at each Frame Start */
+	val = IPI_MEM_FLUSH_AUTO;
+	dw_mipi_csi2rx_write(csi2, ipi_mem_flush, val);
+
+	/* Enable IPI */
+	val = dw_mipi_csi2rx_read(csi2, ipi_mode);
+	val |= IPI_MODE_ENABLE;
+	dw_mipi_csi2rx_write(csi2, ipi_mode, val);
+}
+
+static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
+	.regs = &imx93_regs,
+	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
+	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
+	.ipi_enable = imx93_csi2rx_dphy_ipi_enable,
+};
+
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
-	{
-		.compatible = "rockchip,rk3568-mipi-csi2", .data = &rk3568_drvdata,
-	},
+	{ .compatible = "fsl,imx93-mipi-csi2", .data = &imx93_drvdata, },
+	{ .compatible = "rockchip,rk3568-mipi-csi2", .data = &rk3568_drvdata, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dw_mipi_csi2rx_of_match);

-- 
2.43.0


