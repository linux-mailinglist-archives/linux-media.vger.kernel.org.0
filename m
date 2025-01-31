Return-Path: <linux-media+bounces-25508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 925C9A244D0
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08CE71884C61
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262261F6687;
	Fri, 31 Jan 2025 21:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kq0Y2c5k"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8AF1F63FE;
	Fri, 31 Jan 2025 21:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359303; cv=fail; b=RRGYwswrWqAuQaA7ueX2oHgeIAIhw95YI6geTZ+dMdJubWIggkdJq8nCfbBtUblHz7Oae9SF8vUmeszdq11icrJ3QP5NCOTU0FhS0H4Ngr3X6xjJYicXV0Sqzqe+7ih/8F+oeulFt9wAi+K5/00yAvDU4HpedIfVHhKnYy1ARPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359303; c=relaxed/simple;
	bh=1oLpwAyrYNf6Ig/blWTgvYhrlicXZ0tTYOH1sW3sX70=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Q4ijiDqaMPndGoKEwpQGtZnXWoofba5Hyog5us7UluotWqOLtr2sVpa3q1eo896dnFQgws1uY1ddk8L4talNt/vvmH7rHqOhNh8bM1FV/uZa//h+XYmLrfe8lx+oKNW7Nsv8hK8246M1er+G+QZrzssPOpX+HDjtF1jhEaCQ7ZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kq0Y2c5k; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iE4mNMfqVa50kRh2h0+9edgHYPadvYemjnjDUaQwl/JudWB+q9M3jtC25AF0z2T7TZR1MStW9r08rW+2fAMo8ke8ERBMIk95F69CM1TE/iUkfPCUYJE9ZtNd4JRvkTptkIYfzwU0nEQYwWAq3tcbfjqPjj0a2CI0mBk78KBOdiwjdL/G63GfYugPXd+sIypDH6jhxwNSCcoFQoaAEboS6Et+QiRzWkdU9AhuZcFcXZlzyKbsakKj83k+haK7wNuDkTTsaxEjr96enQrCnCXsKdi/LapEb0RM7s6QvdB18fjtBXCEpubxgH07xWh9Xx5RBTa9Y+bM9KTRa3iRqmoU/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2VwGfFdXjpracPZASbDZNkCa9YmcKdmrQin11NIj+I=;
 b=ynXC2K9yu8Olpx0u3ANunpj/u9hyndIn6+JOzjCFEbCiPr2VFqn4sSEikwESjADSiV3NlDlj+UQ9wc4cegcBqtk4MBbqBd+QMyNAHhBnnqXREtnkLJqyAFx1xIM2S8jvnyT6zjApxXTwgfJ4OwBcRdog/RcPD3kuv9GaS1R7jEBG7h3rbcxcQl+X1SflxNHFWcss5JkNw5S9OImL4wJ7qUsvdKJx+nb46XkuNpLyWUH25WpgmVfLa6KtGL7o90LqjV1xN2/ODoEW89cVS5B+J4nxdWmXdRfW5o5Ci1xmtxyvkys0LUO8QIulGglhW7jp1128x6f5EZh35pl3PKdTIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2VwGfFdXjpracPZASbDZNkCa9YmcKdmrQin11NIj+I=;
 b=kq0Y2c5kGHxcn/Eowx/mYzRFJLPLTFQGXbnkdOT0/o4aFpkqdPVDjA0rQVObvPSH6306sdlKoEysjaCKz4rNpqCLFTIoV/6teGeu4ON8zuhj72zvyojOrqdH2dWVNeSmtZ8/jT7+0NR+KoE0p+yPAUWau2S5XQ5bG673I+E1fEx9ki9ve67byjQIkVejFXGZXxGQB0ThWdgMFhsNBzjP61hwig6oMMj31v5qRgfX3zEeYDso2qVxV9VI+baIns2ZewGFlbmVgEkhEd5YNUDu/co2nt+wAoadOgrMLgP8ICrKRHWl2Bz8TUsqf/PcfPPEtlKE+QuvbXNPXxEGloFm6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:34:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:34:59 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:55 -0500
Subject: [PATCH 10/14] media: imx8mq-mipi-csi2: Add support for i.MX8QM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-10-319402ab606a@nxp.com>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
In-Reply-To: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=3213;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1oLpwAyrYNf6Ig/blWTgvYhrlicXZ0tTYOH1sW3sX70=;
 b=2oKEwVa0aL78BBv7CBxujsD+7GzrfomFN/iovpE26hG8HGvSkETKTgyIfGiDGIPXEtAzRgE+d
 /bsrx/ZkJEvDM4IQPYeAdz+SNim4Vc1qHmv5xA0gz1ngmUaC+M8H1jm
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9d7df9-b9fe-4f98-d97d-08dd423f1cee
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Z0VIcWw1RjIyMUdzdmk2TVZRTkRtbDJXNk9lUFA0RTFlWHNiSlNjOUYxejJo?=
 =?utf-8?B?YjF5SFZhQzZYeUZNVlZqRTJycVduK0NMdjZVaStQR0tJL0x5amZwQmhhb2xl?=
 =?utf-8?B?TE1JLzRRWm5kZWk1UVZyWjFWaHQ3QXhMRHhEK0c4NzUyeHU0c0VKRTd2WGs3?=
 =?utf-8?B?d1Y2amVxS1lTd1pja1dBQWJlZWhzZG5zYTdjQ29KajBjOWw5V2RlaEc0dk5r?=
 =?utf-8?B?dWVlNzJQNWxUWlBza0s5WXRPODV2YVVLcUNVWkRGdXY3ViszYyt1OGVaYkMx?=
 =?utf-8?B?VmhjeTRmdUlZM25tZnp0aWJPNFUydHlIZ2FNd2dRS2hKTDhSSTdSK2dVSzZQ?=
 =?utf-8?B?RWlzYW91UFpSbjc1UHdGUFVIUXkxUnBUSWVhKy85M1RITGwzZlMvUWtxRFhO?=
 =?utf-8?B?MUd2bnBUSys5Zlk1NVI5ZXYzVXlhQUZWYTczbHdOMm5sVVdWSmVXVndxVE1j?=
 =?utf-8?B?aWZWd1RHTVRnSWV1d0xva0RjWjJTL0k2UTVVcWkrN1dvaURta3RrcTY2eFRy?=
 =?utf-8?B?V0t1NXRERmMrcDJGTXhKMkRvSGZJcXpTRkErM2NkRGhmSmlFdGU5azVPRjE3?=
 =?utf-8?B?N2xHdWkwNS91eUhyVzExZFk4L0JkK3FTQXBZTW5CdDRGdzZ1dEZMZHozUVJN?=
 =?utf-8?B?d1ZLWDg4YWtJd1lKWE5GN243d3ZtZzQ4Q0MzeFlSNEhIalptU1RyRXhYOXd6?=
 =?utf-8?B?VUh2VXhDcXFzRmhOMUhNaTJYcDB3VjdWcmo4ZUpULy9hYi9WZnJIUWtBSnVm?=
 =?utf-8?B?ZGJNQlNNRnl0RWk0c3NnZlR2WnFmTC9FZ0NhdzBqQW94cklGRXl2WGlVaXpw?=
 =?utf-8?B?VmdBeHhPUkpGNHJGd3RBTy9GKzIwWU9GejU1U0UrV1Jqak1NOEk1OHU4eGhX?=
 =?utf-8?B?UkdweDM5Qy9CYmtkUCsyMktucmMxTVlOUXBkOGE2elpIbkMwUi9FYmVhOGNq?=
 =?utf-8?B?a3JCN0pOSWhzeVQ3SU1UZ25FNy80dFVRYUJHZmw1SVhZV0p1VTJrTS84K0RC?=
 =?utf-8?B?RktHS3VkRHBGR0hKQkgxcnJPcXZwUzRXV21BT0RhdFRoSitvMVJZVVlRakVl?=
 =?utf-8?B?ZjdZZjJwSVdrbGtuTitseUg5ZGRKYkN5eExrZXhlUThXUng0VStmT2NVU2NL?=
 =?utf-8?B?MkduZDFaVkN2eWNBalVSWExWUG1tZ1crNWt0a3crMDlMZjBvaGcwL2hmV0NV?=
 =?utf-8?B?VUdnczQxNkpPT1Z1VHc1S0NOd1ZrRURLVWsyNGRnQlBuRnZhVFc4YTY1Q3E5?=
 =?utf-8?B?ak4zMkZuVHZLSVRoQXJqQmxXWFJBTkNCaUk0empGcW1VakgxYWJGUk1wTFdx?=
 =?utf-8?B?RnlsSkY3aG81MjZBaCtvaXhpWkVKVXVvY1g3a2xwMVFaVXl3MWtzeStsV2Jr?=
 =?utf-8?B?SWE4T01VQzYzdVd0bi9iRlJQYTFUeitmNHIwZUJ3TkVITWk0cndLZXVqR1NP?=
 =?utf-8?B?OXhSNXI1elY0UWNhdFgvcFZZMUl5anpBSi90WlpDaDdZaEd0cGcyYUlya0h4?=
 =?utf-8?B?Z0xJUGJRZldPT0dBVHJoRWc0RGFJbnBHVjFsalhSNzlXSExpZUpVMkRFM3lX?=
 =?utf-8?B?N0VEKzMyN0tzMUV0a2hMWmk0cE1pS0Q3SXlYUU0rWUhvOGVXdzhMWEdZRmht?=
 =?utf-8?B?ZzArYmRCNk9jUnpmd0YrcVF0SDZ0amI5K2hDMWliRDV4RW9aaHVoWmJqOHZP?=
 =?utf-8?B?ZmJ3bVpuaGROV1NrM1ZDbDh4S3VYRmQxSEtUNUZWSHlhTWRRaTRFUm5Dd295?=
 =?utf-8?B?YjErY0Y1cXByRWlYQnh0TWRsUVVvU1p5ZGVBb2xLNlZ5R0ZGTFM4R2tWaWx5?=
 =?utf-8?B?UHR0cU92WHNLcmlNYWxZbWhBVk5KRGJ6RXJqMnJwbzBKTllnVVg4Vm5EaUZL?=
 =?utf-8?B?VWVxc2F4VXhGallLd1dBcXJkNlp4UkV6eXUyWUtZS1ZRVDk1dzhBa09JOUYy?=
 =?utf-8?B?SDY4bFRxWHBHK0hRcWFDVGc5czBmTldBdzl0bldXMSsxeStkY0R3Mm9acldN?=
 =?utf-8?B?WHlodVE4K0dBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VXYrckREZmJseGhHSWRhQTJpa0J4Ulh5OS93UG1TSXk3ZTN4OExqRFpGQ0tJ?=
 =?utf-8?B?cXlmUFo5ZnM5dSsyUlhjL1dqNlZ4b2c2MG1Za1Rjckx6SVVIK1diS0R2RkxG?=
 =?utf-8?B?UHNpcVVGbXI0YUJNNmd6eWRPUjVpaWNFNk1ZYWFtUVZOaTVBaGlMeG5jaWsz?=
 =?utf-8?B?U0lSS2ZDNmVSbWlLcHVWV1FlWVZBNTlUYWx5NXhpNWVRNEU3VE9kWFhXbytT?=
 =?utf-8?B?MVYrM21uYkxxSFd3TjR0Wmk2Nk1jVlprTVdIY2dBY05SNlVSdzJHMllScGlh?=
 =?utf-8?B?NGs4V1B4R2V0VDlqcUdkV1FRanFVeGl1L2g5OE9lMGFuZUJJd3VMazZvWDdY?=
 =?utf-8?B?LzZsNVg3dDFVVzFUaVJnK1hhUFppYjNiWHBHTG5hNmZvcm1TbW9Zak9wUldN?=
 =?utf-8?B?Q2p2OTF1cGUyblU3bkZraFlNZGhKL2ZQWmdZdUlTVlZKL0EzaVN2MG4rTkZy?=
 =?utf-8?B?aFMvOTAvK1Jjd2wrZisxczYzU28zbGUzNW9SdUt1ZGdTT1FEblVSNFFPQjhj?=
 =?utf-8?B?N3l4a0EyeE9Yc3Z3Qmw1QXdVL2ZwbnhSdDJsY2ZpcmhGT3ZwajAxcXo5Mjhr?=
 =?utf-8?B?Skx1U3JOeG1vNm02dU4weXR6N3g3Yy93VFlSdVRlWmVLNFJhVkJCM3d4NnFn?=
 =?utf-8?B?ZTNDOW9mVWtCa0N4eTRhb00rNDNTbXRTbzkxTG1qUHZkMzVCVVpaMTRyNGps?=
 =?utf-8?B?aFRPVEZXQlJWWDdZTXMrOFk5UnhlNnlReTBEZU9lZ2wwdDl1MDhNdzVrV2dr?=
 =?utf-8?B?MnI3ZkVPa2krOWFBMjU1QlJ0TURkOTNuaWNzczZHV3NVWmtlbTVLcEw2WExt?=
 =?utf-8?B?eHNqeHBzZTdRLzZLR1RqMG1XQ1JCeUphT1BCUC9UWjZpUHR3Y3JIN0tDVTcz?=
 =?utf-8?B?MU8yYlNYSUpBaTUvQ2puNXQ3OUdtRUozWjBTWitqZ25qay9hTjVqZkZIQkpZ?=
 =?utf-8?B?TXo1aDlwbi9Fa0hveGhhTCtkNG1KRDlFV0FnY0h2VnhGL1JQb0xma3N1Q29L?=
 =?utf-8?B?MGdFbzJpdkJSSEYvR285UDlDcVR6SXo0TE0vOS82U3g3TlVCT2syaWZ6Y2NH?=
 =?utf-8?B?SDV6K2lKOWFuQ1lSbXIvYnlpbG1NTmFkUjZwdnNrS1lJM3N6YWJ1cHhuY1Za?=
 =?utf-8?B?dWd2NGxoK0pSMkU1NExvWGRpWmVVdTRWUU1KaFFTN0R0Y0tBN3BJUkVjbzRE?=
 =?utf-8?B?YStZQ0kvdGRCNFFHY0xWVGxmckpVeFZqdE1XQkxBWkp4QlhqYWZEOVBva1RX?=
 =?utf-8?B?ZVJORytCVU96VmVLeVpQbWo2QzRzbG4vSzVDcjMwV0RQTEpRSzA0a1hjSkpV?=
 =?utf-8?B?TzEzMHZ1KzdjbWd6RUxBQThBT2pkS2tTellGUUdsL1I3b2ZobWhmRnJpcitl?=
 =?utf-8?B?RjVPcjNSOHZUTTVVQzBOall6TnFrZXBqdHJrRmtZTVRFZ3dmRTBVLzlxSG1M?=
 =?utf-8?B?VU1XcWNvUzZPYzJCYUZBOUk5TEE4aGtrRjVoVWFneEhPejVha0tKQm5FZjlG?=
 =?utf-8?B?OHNNc0JJb2lyOTIxOVVXa1NTdmdqcnhRTlZvZmNtbVc1U3JTdldGV0tZOWlq?=
 =?utf-8?B?eStJbnJzbHREWVkweVQ0SWYzOTBMZ1FCQVdCaXlCMEM4dG9KYkdnQU5CY3VL?=
 =?utf-8?B?Vi8yd0FqTWhJWXcyRURaR1RYSU1PaUVHT1FpNzNkYVFmMnFUZWhCaXB5Q0dO?=
 =?utf-8?B?YUtvRDdJWEpwenREL3BEYXYrTG41WDFFQWxlWXNuWGV3dUxtUy9iTW94QlRO?=
 =?utf-8?B?eG02U3lTMk1uaFNxd2F4Qk5Ibm9IKysxUFNZSlV3ZDN3OUVwdk1LTWRaVmhw?=
 =?utf-8?B?TmR1R25FZVYrSVBEZ1libkYxakZNTExDYWtyWkhrczZ2bUFyTkRmbnJqNDZC?=
 =?utf-8?B?ZVNQOFJFVFQ4SWVhaVFNY0hRSzZ4ZS82bm1kY3FGWTlKTnpBQ3hvbzNoeG5R?=
 =?utf-8?B?R0NvY1pIMnBEMDRMMVVqdzdUMSs5UURBbnVrMzl6eVlIV09YQ3NZQTRRUmZn?=
 =?utf-8?B?Smt3ZzllNm5tNzJXV3JSMXEzNStKWTVPUU9DN2FQSFVXNWprOC9naEd6S2xq?=
 =?utf-8?B?YlZJWWx6V3lsVGZnbjIyOHdYa0VCMmQ2K2xpbmJsTzRxVG9Sb3RGQ1AwMnJy?=
 =?utf-8?Q?UR5g=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9d7df9-b9fe-4f98-d97d-08dd423f1cee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:34:59.3396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3gojYEZ9USqHgOMDNc598AWCIGcFgthJl1Zg/NMx2eOtbZjNIVrE0miRXmZE0ZO+7K6Rtvv3KWBhjctsShFAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

Add support for the common PHY interface to enable and disable the MIPI CSI
PHY. This is required for platforms like i.MX8QM, which rely on the PHY
driver for powering the MIPI CSI PHY on and off.

Add reset delay for i.MX8QM. It needs a delay after toggle reset.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 46 +++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index b5eae56d92f49..df34caffd4a3a 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -89,6 +90,8 @@ struct imx8mq_plat_data {
 	const char *name;
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
+	bool use_phydrv: 1;
+	int reset_delay;
 };
 
 /*
@@ -125,6 +128,7 @@ struct csi_state {
 	u32 state;
 
 	struct regmap *phy_gpr;
+	struct phy *phy;
 	u8 phy_gpr_reg;
 
 	struct icc_path			*icc_path;
@@ -169,6 +173,37 @@ static const struct imx8mq_plat_data imx8mq_data = {
 	.enable = imx8mq_gpr_enable,
 };
 
+/* -----------------------------------------------------------------------------
+ * Use common PHY interface
+ */
+static int imx8_phy_enable(struct csi_state *state, u32 hs_settle)
+{
+	int ret;
+
+	ret = phy_set_speed(state->phy, hs_settle);
+	if (ret)
+		return ret;
+
+	ret = phy_power_on(state->phy);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void imx8_phy_disable(struct csi_state *state)
+{
+	phy_power_off(state->phy);
+}
+
+static const struct imx8mq_plat_data imx8qm_data = {
+	.name = "i.MX8QM",
+	.enable = imx8_phy_enable,
+	.disable = imx8_phy_disable,
+	.use_phydrv = 1,
+	.reset_delay = 10000,
+};
+
 static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -273,6 +308,8 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 		return ret;
 	}
 
+	fsleep(state->pdata->reset_delay);
+
 	return 0;
 }
 
@@ -860,6 +897,14 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 		return PTR_ERR(state->rst);
 	}
 
+	if (state->pdata->use_phydrv) {
+		state->phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
+		if (IS_ERR(state->phy))
+			return dev_err_probe(dev, PTR_ERR(state->phy), "Can't get mipi phy\n");
+
+		return 0;
+	}
+
 	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
 					 ARRAY_SIZE(out_val));
 	if (ret) {
@@ -979,6 +1024,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
+	{ .compatible = "fsl,imx8qm-mipi-csi2", .data = &imx8qm_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


