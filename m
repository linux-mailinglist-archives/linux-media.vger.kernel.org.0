Return-Path: <linux-media+bounces-39179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD09B1F10C
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 047EF626A29
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B6028FA83;
	Fri,  8 Aug 2025 22:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hSEp8ezW"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327B229C323;
	Fri,  8 Aug 2025 22:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692963; cv=fail; b=OTy6a421EgqehTkJ7h0AHoW19nRNg3HZV0JR7RLqXBm48T4zKXll7Etj0VE8sA8JSm5pb1cC5nUqWWkplsoMc21NgIzoIA6bupc24bDsj6josVSsdZpTkJ49WIZhT1We38zyZHxJJzuJzMfdzN+wHGpMkSyN6w/RUxIONuWZZe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692963; c=relaxed/simple;
	bh=iodxMH0g5ztY4Rs8TTLdWOrjddMSI3gsukYzQU4vkyw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TsxY0R7stZoy4q33JykdCDbnWMigXRWpVs9h9R+O/PyDAwQYFjYz0lo2d5yLB3AHf9yhc59WucpGiE8/XJ1fAOsNHK6vSO4V1VTpQ7quZwEQwshkz0Juvv7AZcewrbj+E+mRPCOJDHj1LO0eB7N5xeoM2k9XqRMuNfo8WsmjbrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hSEp8ezW; arc=fail smtp.client-ip=52.101.83.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTccZwV/JBEhiGm1cM/fPmRsaW//HrSPqoFttcJ2RVRMRNFMIzK/vxRbmhlvMKJGxYd0Hx98Ld/eT1Y3Pzgk/UyF2GwMQPGx9HzXR1fKXi2OINjBctAuO4eK3w/qTFMq6IzUKyiMPml7i5sD6p/KJSTD1oEtOZ8wYKJDWB4BOYM0N00YDOap+Ai3CmlzUwxY3BZUrlsR++4yeF30rUBVnEidIFo1u99GS8WNBrhYqFSPiiMB8lMOCrbtEOSwxcRQGLBy3dOWBcmJvqusXlaZvAshGC5h774EJgRPCoemxwlHJFGT7Hhq6EbO3PJR+XhT1qcNgJbYMRlDZSQDUQ9Vlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yovxt86xI4JiPytFOc1hM3hAxndWtE2NbiPBk51/Ngs=;
 b=Gsv1xJ4eXhqLeQvnoIgyZcPt/VrWpXKC8z3L0lw0Amdd6On/KQ1nZDLBn834a9j6A88xo4I4O2v9hFxo+VhHvgM23ZGEUEW38Ftd4bqmfBEjVNJvP5Q1vdg5INyuNOy6jWmq8+GFehCM7Q3MPU9A9L6/7lKdA7obYpYRWWK4I5yiU1Kkd3fWaOookGkNAFr6lhTh8eWiYiuVoH/acozgeQCtVHVm1w3XgCFPdgoe1JdSJA5/DfArXPUK7k6YMY0wN3NAIPbzlq47JbxNx3kPT03I9gY+Jjy/PGJnLk9ZB/vQ3kNiz6xxU3yKlTAMAVEdL7XZKbEKe4q41bOh97Zn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yovxt86xI4JiPytFOc1hM3hAxndWtE2NbiPBk51/Ngs=;
 b=hSEp8ezW8tpfeHFlAqfyfNJo/SnDHytK+ACzInQks64lH6hC7Tolj7V9njLOyg1WfHuopVvffZBw35mqrskGDvg27cEemjEZh+wXP7gwFSovb9TsoecZRTPfHYE5ZgT+F7K3uDPYDTCBZTWmoOnRi4dZOjiDONoIoC0MdRV7a8fxY1s29j7oHm10c7svCE74/CYt8qFkt1NBC9j/5g3m/gyDCXdIfTz19ddo8TesCX/8WjdLQ5qJcsuisrCTK/4Pz1pz72vJv8+cFjvRma5AtVaiMK/dDspqep504u7t7YoS0gBdpmMYO9d560A6mMAVxJbgtYbzmJrNCitrNu/o/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:42:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:42:36 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:30 -0400
Subject: [PATCH v2 27/32] media: synopsys: csi2: Add v150 lane stop state
 register bit define
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-27-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=3480;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=iodxMH0g5ztY4Rs8TTLdWOrjddMSI3gsukYzQU4vkyw=;
 b=XcW6lmpd/EnO2gq5TWbBGwb5iQbAo7OdeDlwxpG4NQ1KdNHjhxFxJ8z7ojbjeegCDmulhZzjE
 z3aoeX31dJYB7MXGw/GCNVC+C/YsIT4vf3mRfq4bYcQ5YIVyCETnCcc
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
X-MS-Office365-Filtering-Correlation-Id: 9f374e6d-6ac7-4179-b26d-08ddd6ccdf25
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?enlaKzN2dWg5TERmWTZmeUs5QzRPR1U5M0I4bTlhU2VrYzJTbSs4MDRpMGlZ?=
 =?utf-8?B?ZDZUeE5PRm9rbEg4LzVFaUNKMms2S0RoN2JxTTgwcHJHaGRBSFFTR242WUxj?=
 =?utf-8?B?US9rc2s0LzdLRHVkSmNrYi9OUUtVcnk2czdBQjJSV3dqV1E5N2NxRkZkdGtm?=
 =?utf-8?B?MlVzVWFSek80RlZMdkhqK2hyN1ljK3pvS2ZaTEJIM2RqWlJBVkp2NWpxZGhV?=
 =?utf-8?B?b0NPbEhmVjEvT2pkd3BITVE5UkJKUm5NdzFrL0R4QjNyT3J3Z0JoWC96R1E2?=
 =?utf-8?B?YjUwMTVoQTVIaDB2dDdzL09zWkdxcHNXTkN6SGlWenBIM1Z3ZWxBQXNnUEMw?=
 =?utf-8?B?Qy9rM1Z2ekFaQTIxL2dQRkp0ZC9lZlhoV3ZuL2MvNXBwWjdlQk1vZjNDZEQr?=
 =?utf-8?B?d2UzaGMzaFFKTTFDK1hqeTZkeFNrWlZQQW11SnVidWFGd1RLSmJTcElQUE1O?=
 =?utf-8?B?QVpkOVpwV3NhSW1rSVAzL2Z0Wm9vMDhYdU5XKzJtRFhYN1NZb0dYTzNmaXAv?=
 =?utf-8?B?Skk4cS8yYXB2eHdYYUdqVEtQMzBRVlNLKzJkbDFaTklycE9sNnNVczlvNVVq?=
 =?utf-8?B?dUREbTM1M29qTWtlcEdEVEtZRm9VT3ZMUHkyQ05DNnBCNUpkeXhSckcwdGhv?=
 =?utf-8?B?YTZXMktYLzNCc3JjdkdBSHoyL1dmYmkzeVQ1Z2k3Y1E5UnI0c3hHcEhiWUs1?=
 =?utf-8?B?M1NsdytWV1prbkFkM285STY2OVh0UWc3WE0rejhHV1A2Kzc5bVM3TisxNFBW?=
 =?utf-8?B?L1lMR1NLK1BIWmlSVWF2blJOL3FjVzlKU1UyTS80aE4wQXV0akdOQ1ZCdDFG?=
 =?utf-8?B?TTRtTFFpUGVNM0NQWTZBQ1hWbkgvYW14WnkzWHpNUkFrcFRtd3NVN3RmNXNY?=
 =?utf-8?B?MWtORkNqM0E0SkpZUHYzRGk3UEtPSFVXTzJHTE5JSjNyazVKZldCNnM2VWtL?=
 =?utf-8?B?MXVyRy9xaGQ4NjduV0QzaXR2d3VkQkc1dmh4S0g4T0VHQnpRaVVNcnE0QU1B?=
 =?utf-8?B?WGxLNzlSc2loWi8xUXc3d0lZRlNzYy9KOXlrNGdNNldXT05pYnJ2ZUN5NUFW?=
 =?utf-8?B?WFk2RVdKYlY4Z1RGejBueFl5YUVaSWV3MnluWHFDNSthQXRwSE80bmlUNFJy?=
 =?utf-8?B?OHNocVJMRnQxR1Fsa3NiZ1dwUWJOUlRVaU9JZWdXbkRwNHRVcDU5UklpOFAx?=
 =?utf-8?B?WDk3T0tLWCtmOGo3eFpnL29uZkZjMU5pUlA5LzR0WC9BazJvZmV4U3FEVHRY?=
 =?utf-8?B?VlRBWEhMY3RZSmhmTEQ1R1JqTlByUzJBa2lFVFViblpqZVc1bWRRa29Zdm5x?=
 =?utf-8?B?a2JQbU56cDVmemtSbjRsc1FVVC9ORHpGaE5pYkphQ2hNTmRQeXZFUi9Fd1Jl?=
 =?utf-8?B?OHBGLzVRdmhzMHRQNThHY3J3V0hSTkV0WWVJQy82UkJDdXo5eTZHUmEvdElW?=
 =?utf-8?B?K3NKbEF5OVpNVWVRdmVmNmZJSldEcTNmd1AveTVuUlBuVGFNVk05ZHcvUFZi?=
 =?utf-8?B?bTljZDNRdStpMnRxbEJ5c1p4VXlwU2lac2RmMFJGZnE1QlNoa2h5dk5LZ0w0?=
 =?utf-8?B?Um1odVBvTy9Yc1hZL1oyUUx5cklXZmpXZ2FGcXIrTUlZVG5BQUQzWWROaXhJ?=
 =?utf-8?B?Mmo3RHNVUzhnZ3Vub0FHZ3prdVdKTjB5Rks0NzI1R3MrVk9rUVFUeGFNcEVl?=
 =?utf-8?B?VTJCd1RybThWd2M3VUlkQkppSzVPcnlySkdsZ0lCMmZyUjBnUnRkcGtGQ0ZC?=
 =?utf-8?B?R1ptbU1XT2xmR0hGSW1LNmNQd1RPZzZlOGtURzlTWVZiUk1QMnVUUjZTb3JP?=
 =?utf-8?B?QnJJWmVzM052MlJBdEIrZ21DZXhxU05mc1hWMlNUOFRTc1I1b0FIdFcwcVdF?=
 =?utf-8?B?NndzRzN3OFd3MkhKVjA5REdtSGtubWliVEtjRjJ1dy9lVzYxOEVua3NZOTF0?=
 =?utf-8?B?SnZvNnAyNGp4TDVFWjdnMTA5MU55ZnpJRUROL3Z0WXpKN3Y4eGIvaHc2L00v?=
 =?utf-8?Q?8Pm1KvAnc3mcX2EBfh0USHc0TXtfrc=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Z1drQUJtTVd6L0Q3cDY1UXhmWU8wWGhpb2llWkVpTUlSUk1jWGN6a2MxN01W?=
 =?utf-8?B?R1JXSWJnV1ljUk56QXNYbXVXY1o4ZVN3M1k0bmExQ3VwcHJyS0phTVNNSUJw?=
 =?utf-8?B?ZmJUNk1XT2hlRmRITURmZjdiQlZYZHV6S25wakhDLzcyWGhqZHRtVmtreDFI?=
 =?utf-8?B?aEEzeElmeGlnTWFTU2JpcjQxaTlhWmxTZ1JaY2o0ZHZyUlVqZzhiTFBtTERi?=
 =?utf-8?B?VEdnellMRFNNS05wV0FNSFRTUDJMUEpybFFjYkRIWndtVlBpcENrdlNaL0Jq?=
 =?utf-8?B?S1g1NXRBVGNSblRTbVJRVENwbHJnTDJUYTBzUUJ4cVkxeDRvSFBIQUhTZG5L?=
 =?utf-8?B?Y2RGT3pNcCtEbzJyT0dSNlUvcU1PNFZOeFYrQjNTQ0phU2F5RVp0OGQyOWww?=
 =?utf-8?B?WFU5cUJnd05xNW9hMklOKzBYSG42YkZ6NFVBR0ZDSTNMWVIxcUhiVnFuclEy?=
 =?utf-8?B?enE0T2QzbC90RXhPVXJhUFFWMERxY1VUZjhIQjgzdVp4Mkpmck1nYjBkRHNL?=
 =?utf-8?B?NGlTbWw3N0VicjRuTEFXZHhLY2Jxcjg2bGxkMGJsSERGSC9XZ0RZd0gzMHNP?=
 =?utf-8?B?dkVTSWFDY1Z1aGdEbzMvZG5qbUpvLzVHaGwwMkxZcy9NcWhKN0ttaEpUbTZM?=
 =?utf-8?B?WURBbWdWQnJsUTJkQU5QR1hCUUVMTmFoY2JnUS9JWUFuWmx6UVRnK2RTZHBT?=
 =?utf-8?B?alQzZ28vaW95L1FseDY1OGdyTUdyYkYveVlTNmk0TitsUWdzelV4ZTNvcExO?=
 =?utf-8?B?ajkwOU1pcUplUml5NDhHVU8rVHFvbWFyUndvdXNGSm14YkpnMWxSVGlQY25G?=
 =?utf-8?B?NWV3MGJpVWplNjZPZm1TVkpIbCtTY050dFcyVmNLRGFHZXh1ZVk5UHlLUzB0?=
 =?utf-8?B?SjJ1elhIaU90WE9aN0xiRjFmRVBxOHIzWDFydlg3dGZkUXZTMUVNNWJsUWdJ?=
 =?utf-8?B?eTlkQ0wreXdKMll0QTJIYVJrd1M3WVVhTlRlRmF5WmtRU1Rud3JLeVJYMnJY?=
 =?utf-8?B?emg2Rkx4UTU0aHQ3OWtZMDl0eThjNjNaZy9ScUgzNHZ6YnRmaFVUV2hZZ2RS?=
 =?utf-8?B?UVFRRHdLcGZjTnR6MHc0eVcvMjQ5V2hFemtVSEFFbHNGTkdxVzV0cG4vcWMy?=
 =?utf-8?B?N09YZGgwSFRsdkZ2RW9MaVRLV2JiWDNrUFZ6L1JSM0ZnbEpMTGFjd21OY2w3?=
 =?utf-8?B?ZG9Id0lCSzJkTTlwMStmb3RqVkYyM0t1SG54N3pGVU9mN2VuS1pnNUMzdHVY?=
 =?utf-8?B?NlVHQzUrbUFhRDBidTRpc1RWU1BCcitWWElDZllsaFhVQ2NKKzBqRk5Xbi91?=
 =?utf-8?B?NDMrR3BheEx3ejJQb0Z6U3BsZWkzemQrTUFVUEx2S0FRYnZNVGxxQWI0bFFn?=
 =?utf-8?B?OFJtTlprSUdzS0JnZExJc1FsQWdDbnYrZFFXWG1vUHhXZW5OaENUMVl6L08z?=
 =?utf-8?B?R25WK0V2alNBdk40ZURqSWlJbW9LMFd3N3l0SXFlSXJuSzkvUWhnTWR0bzd0?=
 =?utf-8?B?QjVqR1BWb0xQck44TCtrMmtmU2FZbEJSTGdFVmRMT1ZZaDhWQWtJb3ltME91?=
 =?utf-8?B?ZnFIeFVBOFFzZmhtbFhRVys0Rk5QM3g0SmJaek1DZUxEQWRjdy9nNGpSalM1?=
 =?utf-8?B?NVBSdER4dDFQaVQyZEw1NDA5RWlmeVI4QzMyWm5ybk9SN3RsVnhyUWxXV1JZ?=
 =?utf-8?B?cm1HV1FBMXZNSElJNEs1VXhzVVEzUmpNM3B0MDdyZ3VuM0hkcjFqZHZaSFZB?=
 =?utf-8?B?dHMrTlBXeitmcjJoa00rcGZ0VUZKZndGdmRSMEljSWdKOW03dzlQd3NGdURB?=
 =?utf-8?B?Y3p3dHplbEcwWEhwY21vektrVDJPYThNcUYySHdFSmVmZ3o1bFBrVGk0bFEz?=
 =?utf-8?B?ek9VZUJxQXFaeHU4RTNUYVp1OG9MVmp1U1NZYzQraUdBa1ppclh4SFlMbngv?=
 =?utf-8?B?VmFtSENjL1AxUVNHMVNKV1FzbHE0SU5Vd1MyT0ZJcVpVK3FkMEtxT3dlQnpK?=
 =?utf-8?B?ZEFJMGxrcmpVQWpkNFNiaFhyQzlTVlJDcVpJR0drWENnNUNEc1hMQUpBVmxh?=
 =?utf-8?B?Y05IRmY2UjNNNllBZUhtUjVBQVdwZU02ajI0N1IrOFRhUi9qNlB0S201UlhX?=
 =?utf-8?Q?wCSoP6osCItzg6GDWkJ0Ks7h8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f374e6d-6ac7-4179-b26d-08ddd6ccdf25
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:42:36.3548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6phFzHUQaucvStm19jVG0+1IRXkitXrymjooB3vUa27uTkgC0KzP1kMnzWIY1jk06cSRyLWD73OXS3qpe11OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

v150 move lane stop state into new register phy_stopstate and field
position also changed.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 40 +++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 7a3776df3e074aa823ae89c824bb942475c95045..a9bf7ce57adc4d2b071f2f7c39f19855dc226a40 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -31,6 +31,7 @@ struct dw_csi2_regs {
 	u32	dphy_rstz;
 	u32	resetn;
 	u32	phy_state;
+	u32	phy_stopstate;
 	u32	data_ids_1;
 	u32	data_ids_2;
 	u32	err1;
@@ -86,6 +87,7 @@ static const struct dw_csi2_regs dw_csi2_v150 = {
 	.phy_shutdownz = DW_REG(0x40),
 	.dphy_rstz = DW_REG(0x44),
 	.phy_state = DW_REG(0x48),
+	.phy_stopstate = DW_REG(0x4c),
 	.phy_tst_ctrl0 = DW_REG(0x50),
 	.phy_tst_ctrl1 = DW_REG(0x54),
 	.int_st_dphy_fatal = DW_REG(0xe0),
@@ -147,10 +149,13 @@ readl((csi2)->base + ((csi2)->regs->__name & ~DW_REG_EXIST)) : \
 dw_csi2_reg_err(csi2, #__name))
 
 #define PHY_STATE_STOPSTATEDATA_BIT	4
+#define PHY_STATE_STOPSTATEDATA_BIT_V150	0
 #define PHY_STATE_STOPSTATEDATA(n)	BIT(PHY_STATE_STOPSTATEDATA_BIT + (n))
 #define PHY_STATE_RXCLKACTIVEHS	BIT(8)
+#define PHY_STATE_RXCLKACTIVEHS_V150	BIT(17)
 #define PHY_STATE_RXULPSCLKNOT	BIT(9)
 #define PHY_STATE_STOPSTATECLK	BIT(10)
+#define PHY_STATE_STOPSTATECLK_V150		BIT(16)
 
 #define DPHY_TEST_CTRL0_TEST_CLR		BIT(0)
 #define DPHY_TEST_CTRL0_TEST_CLKEN	BIT(1)
@@ -289,7 +294,8 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct dw_mipi_csi2_dev *csi2)
 }
 
 /* Waits for low-power LP-11 state on data and clock lanes. */
-static void csi2_dphy_wait_stopstate(struct dw_mipi_csi2_dev *csi2, unsigned int lanes)
+static void csi2_dphy_wait_stopstate_v0(struct dw_mipi_csi2_dev *csi2,
+					unsigned int lanes)
 {
 	u32 mask, reg;
 	int ret;
@@ -303,13 +309,43 @@ static void csi2_dphy_wait_stopstate(struct dw_mipi_csi2_dev *csi2, unsigned int
 	}
 }
 
+static void csi2_dphy_wait_stopstate_v150(struct dw_mipi_csi2_dev *csi2,
+					  unsigned int lanes)
+{
+	u32 mask, reg;
+	int ret;
+
+	mask = PHY_STATE_STOPSTATECLK_V150 | (((1 << lanes) - 1) <<
+	       PHY_STATE_STOPSTATEDATA_BIT_V150);
+
+	ret = read_poll_timeout(dw_readl, reg, (reg & mask) == mask, 0, 500000,
+				0, csi2, phy_stopstate);
+	if (ret) {
+		v4l2_warn(&csi2->sd, "LP-11 wait timeout, likely a sensor driver bug, expect capture failures.\n");
+		v4l2_warn(&csi2->sd, "phy_state = 0x%08x\n", reg);
+	}
+}
+
+static void csi2_dphy_wait_stopstate(struct dw_mipi_csi2_dev *csi2,
+				     unsigned int lanes)
+{
+	if (csi2->regs == &dw_csi2_v0)
+		return csi2_dphy_wait_stopstate_v0(csi2, lanes);
+
+	csi2_dphy_wait_stopstate_v150(csi2, lanes);
+}
+
 /* Wait for active clock on the clock lane. */
 static int csi2_dphy_wait_clock_lane(struct dw_mipi_csi2_dev *csi2)
 {
+	u32 mask;
 	u32 reg;
 	int ret;
 
-	ret = read_poll_timeout(dw_readl, reg, (reg & PHY_STATE_RXCLKACTIVEHS),
+	mask = csi2->regs == &dw_csi2_v0 ?  PHY_STATE_RXCLKACTIVEHS :
+					    PHY_STATE_RXCLKACTIVEHS_V150;
+
+	ret = read_poll_timeout(dw_readl, reg, (reg & mask),
 				0, 500000, 0, csi2, phy_state);
 	if (ret) {
 		v4l2_err(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",

-- 
2.34.1


