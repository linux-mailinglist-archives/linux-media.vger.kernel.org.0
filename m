Return-Path: <linux-media+bounces-36477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E8BAF0633
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 00:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0136444671
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 22:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A86302CA5;
	Tue,  1 Jul 2025 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KRR195a2"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79322FD882;
	Tue,  1 Jul 2025 22:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751407600; cv=fail; b=tgxfm+dyW7zSbsmq2mKZHG6uFfCZX/xKEGbRgm8ATA2Q+3JOi3iKUebw9clOD9GFNS5IByUurjM2tKghobFRAf+N1dDgBUZgetAf+w0nyUC2rukhtLPTvKa0e6LtjRmIVBQQNHwo6BTc1dt7ufdHZSdVO6Zy3yMyYz3GA8FysOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751407600; c=relaxed/simple;
	bh=PfNzXdKMFrUJemPdfK3a3PXNTERNfwqFKLZbuIQKX3M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UHURaHJOL9tpRdf6PGolWQ8ID9AKkfQ/WnjY+stVbNqHKQ22xgU9Ik0Xi4KBj3aS9XB0FlKFmDTOXCeOGkNSZRW+BDQ+StBrXMLRRfKkSIhhAZyIbHrvPACdh/SDQilKCK0MudcRR/gJTiFeBH0xQtNkmpYQiFYbvE00mFw1hgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KRR195a2; arc=fail smtp.client-ip=52.101.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHwAv12MJ2rVQshly9zOcpKx/s0nEnYBCXjhdC3BzHWegXBXpYnEVovjkhgKIJmU/MIe9ZhCoKHOjehTxIc4LS5DExeqUfOXc+FtklQwrEPbmpMMl0b6Vlau+QGzRtUvdHOy2OBUnf6lcYeLj+og98vw3jHwZtvXtWvvYHhhyK40WLGYzOQt9X8BHjl23X0MJeXy2tNHobxtXKYeDrp5oyQ1ejbpaDtFqwNlA5828qZ4W+qxn95N6WjJWW8pTgVQJThxTgyWr7EtTM7ZdZP41AQ3oO5pzm4W/esnoXS8K5z6fty50FGQ35C77JLMpujgznANmhOZ1wiR3I1T6N/d2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJPBeS3J7bnOdbZf1/iQiE6bdXKyCFIIRD7l0e9cQuU=;
 b=RwL+zHQRHWVdma5LybV6QiCBsEErvabPlzYD3ANK1ycqgUeCsqMK0VvbOmm76BTs7ZJgi9OHDGAsnaQFUXs8UU7whdSmSL5u9pJQR8H6aa04Hrpn6PQo+GajBbVgdJW7UajG0lAMahoByMC98TrNDb5Qv4IkP/YlbHGW4u6WJssZUCpAiZet8tkVClwNoxl99aMLVKHvi4tPtfIUXaa0gn1gI9H60eqXsf/HMrAfZSpjS9ukmXWrjtmzFMf0y+vI+t8rBnDLW29skPpraV8u/u4NuNWe4S65yJKCngFrqBle7naUYzVbXrk1/ApEdFCaDORLvQM+Hz9DMn115XUXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJPBeS3J7bnOdbZf1/iQiE6bdXKyCFIIRD7l0e9cQuU=;
 b=KRR195a249yrRJuDOKfGls33fYRnp5zPlwYQBv9lYC19QnCGQSG3TDqlfBHmZ3LcRV8ufWnJbUkSaQARulay/s6Qi+V2QhTiYZ0GP/xh3KM/pv06ZDXQexrH2KBRJ0Dv9IkopOw3dGjBX5Lx2vuitrg/VLLA5EiYBXGaxx5zCBA6gD1F/uE9BD2qMULMEE73lTp2Iy65hQhOGCXzCavi/ksty3AOUDXHuKhS3lVo3Q96zoNNLtC+gd7fnuVBZccyPaLTMJiexiu0pzCoPpRvjKZZJBGGwxUaBswYO530voy4IOg8l4MThjGiSTHJxitIsZOwXiIcjqEL3EmY9Aea3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8843.eurprd04.prod.outlook.com (2603:10a6:20b:40a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 22:06:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 22:06:37 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 01 Jul 2025 18:06:06 -0400
Subject: [PATCH 1/7] dt-bindings: media: add DW MIPI CSI-2 Host support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-95_cam-v1-1-c5172bab387b@nxp.com>
References: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
In-Reply-To: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
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
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>, Luis Oliveira <lolivei@synopsys.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751407588; l=5644;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=19yk0dMzXlBZNGVaRoqoBXO+PAL+XkDyyZa0sTp9LUQ=;
 b=7769/hkSijbCnn2ZugszPJRsUuddMVrRWO1ZWfuv1JfHtdnvhwyPtLhPi2jxvkcWDiVsUcrqb
 y/6QQE8kn04BHGF1596xlaMk+6ahOFNdc4AffD1LARc4YCpVsOGeq34
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM9P250CA0027.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 575f1aa9-9a51-46b0-4291-08ddb8eb8cc3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Z2JSQ0FzOTQ5Uy9vbmtQc3N0MkwvZ1dnMWY1enlKNVJXRkF0RXl3TXRrODUy?=
 =?utf-8?B?MTdNRzU1aWlIS3pBUVVYVGJTRHorMXM3SnN2UDZ2cjBRUkVYQlVvbDVTa3lo?=
 =?utf-8?B?TXZYelQzazBkWWFZRmNPc2xLUjhQejl0TEEvRDFBU29aVU1qbUN0djlLcEFq?=
 =?utf-8?B?TWg5dzlvalZ3NGZLRmlIRi93U2o4R2xhQ0NYY2RBKysxL2JoWjl1dVFEMmtW?=
 =?utf-8?B?bHc5bzJBaElmNGQ5RTcyTjd5Nm02ZnkrRDZzRGFPZFRrZVo0TDlVOERMVUZv?=
 =?utf-8?B?RVcxekEzL2NoY0ZJRGh1VkIyTkd1SWRqTVpMYVBIVlFjOVVtRUFVaTBpWWJ0?=
 =?utf-8?B?YVlsQ0F3OCtXcDJWcVlvUXRPQVZiaWYrRG9hZE9DbEVwTUY4QXBVVVZIb1VF?=
 =?utf-8?B?MFljRG1GU0hqTW5nUDhuSWladnRIdVZFc2Zad2haZWRCcW8rblBzMG5JT1dT?=
 =?utf-8?B?Q1lheEdaTjVEVktrcjFTZzV2aHZUbVBJTnZOZ3h1VnhJUkdXNmVQMmRSKytM?=
 =?utf-8?B?NHYyTmYxUkhpM1NMZ3lVTmtXN2grQWVpOFBGS0lyQ29odFJGRENsbm9BenhT?=
 =?utf-8?B?UnlocmZHN2VWTGg4WmNPTzNXQm10VGw3ZXhkU3E0bVpjWFQ3eWMwS0htT0RD?=
 =?utf-8?B?ZWcyV0dJYUxzWUUwN3dLVStqR3d0anM5bllMaVVnd0V5OWtZK0pTZXpKV1hJ?=
 =?utf-8?B?ZnloN2E3RlEyQnk5SE9VOVhJUTA1c0pOak5JOTl0TytFcjgwdm82TGdLZVVx?=
 =?utf-8?B?TkwrMFZ4d21oZ2xwMnRONVJWTndGQzVXSTM3ZVNMV0xSOFhSTUVQc1oxeFpy?=
 =?utf-8?B?alFKekZybjJXMVdDNi9lejYzdWFicHgwL2o5TWZqWDl0U2dXWVNyNmVCNW5i?=
 =?utf-8?B?NnhlWHpRRlBMMHYrcXJ2TFNzME1hc3Fpbi8vSFRlTWQweFdnd0FUZHZJbFZI?=
 =?utf-8?B?TXVnQnlLNnlsNmxmcHhNUW45LzFtcmZ3dy9UMEhWbmRoemVQUlFJclpDa2c5?=
 =?utf-8?B?N0o0MHVTT05TbmdoQ3ZHUUxaRVRyUVl2bjVSNDVuUGkydXFFWkpadkNodVIx?=
 =?utf-8?B?MjNnTDlPa2FhdThmZkxNVERYazZ4aEN2VUMxa3lSRGxrbis4b1N2Zy96b2Vi?=
 =?utf-8?B?VUdId3R4WWpGam8zY2NocmdXaXRYNVNrRlRGeWJFTmg2OXZPT0RXVGMyQ0g3?=
 =?utf-8?B?bDNadWR6cE9QbTdBQUU3SzN0cHNJWXNpaXh0ZVRFTlZ0NW9HcU16Q2ozNHEv?=
 =?utf-8?B?alFtb1pMTlYvcS9veWhMVUxNU2hYQ1dEQWd4QjB0Q2U4d0hBa3FBYU5iRFpP?=
 =?utf-8?B?ZG8xSTUrNWRYM1NtR0w5eGV2ZUgyZ0JiZWtjRzBjSmt2cXIyWGx4c3RBbFhQ?=
 =?utf-8?B?aVZVdjdQRXNIdzJIblFGdTl1YXRLUHNBTEp6YzMrRnFYMjM1VVpuK0lvTUVZ?=
 =?utf-8?B?TmlaYmxsMGRzOGlLMnoyeFhpUFhqcU5PekpQazVRaGQ0bnZLUWNzdUgzWEtx?=
 =?utf-8?B?VHpjMlpsZ0E0czcrYnpQby9NQnYxUG5RMjllZS9NUERUNnkzbXo5bmdraTJt?=
 =?utf-8?B?QUViSmRQQzJwUjd4V0crd2ZWU0Fkak9hZGN3M2s0ZFM0Y0NkR0MvbUpXQWhF?=
 =?utf-8?B?bjA4MmhWekQ5VGlyVnJqV2hmSFJiWHhHWWs4QjhlWGw3OEFEcGJBUXE1U1VX?=
 =?utf-8?B?Y2laYW4yT1E3SSs0WEI4c2pEeTRmSXprMTRPZE83blBLV3BOMTBIOTRpeURr?=
 =?utf-8?B?TUFhcGdCWXRScDY4SjVWQk5qSG15OXljOVFEdkxDbGFyVGZMUzBkeG1Jd3Yz?=
 =?utf-8?B?djBUNmExS2FMUDJ3NnVGd3l6akc0eXdRQ002L0hzVE81N3VVbGZqM3VPVFUz?=
 =?utf-8?B?Q09rcVAwL2Fyck1SbU1wanY4aGtxVlVlSjgrTzhCellvQlBXTFVvbnU5Ym9s?=
 =?utf-8?Q?jWoQzFuIjGHX/KkI3jF/r61oItFk6SNb?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SG56dVRtSkFhVjBSM0N1QUpxejJTZDdHWGdmelB5YTJQMTJ0RFJoOGRkUnUv?=
 =?utf-8?B?ZFdBSHN3alZpSk9HVHhtaWFBQ3Y0UXpQdnFiUkJvcWwxQ21QNndqTWM3ekhL?=
 =?utf-8?B?bm40Q0dreW1BRk9NeTNlRS9GS2crTnZpcWJ3dGVzWHMxTHhRUy9jZllTMzMx?=
 =?utf-8?B?UVN4MlVGVnVzbTdhUEswWDVSdEpUY3NnSnc4dGdqaFhNOTV1TlA2a21LamJH?=
 =?utf-8?B?c0VEZ3UvclVNRVpGMVFObHFYOXh0dDZ1VCtKQjZxMnM0L2R3anZLQjZVc0hI?=
 =?utf-8?B?ZHVVWjQrenJSMS9pVmM5WlZJa3RUT215cGhpK1ZVQUZxa013QzBzLzBNOEZI?=
 =?utf-8?B?eW5tQ2FOMW1WVkR2b1RHa2dHRHZjRVJVVkt5RGg5YmpwMWllc0VQQjdrOFpz?=
 =?utf-8?B?akpGRkY0S1Q1UDNtK1lPMitUU09JMXdIN0VISkhhMEdYUVV6THhEbVBIYzd0?=
 =?utf-8?B?TW0wWHBacHNzU1ZjU2t1STBwVWhjbVF2a3V6Sy8yYnYzWFRMRzJuT2lBRC9x?=
 =?utf-8?B?VVhHY2kvUGJXdVR3WnFvME9Rbmp2aEY4empGRzQvbHo2NHNUeGVIcUtEZDAw?=
 =?utf-8?B?VlduWVI0Q29zVlVrWkh6dDhpbTVlRW1PZWxDV1FlVXlzNWJ4Uk1pazIyZE82?=
 =?utf-8?B?MkQyczUwUmpFWVJuMVBGREZOa1YzZFVuZkR0Ti9rNFZJMk9NL2lkVFBWYnlR?=
 =?utf-8?B?T285bFFvWHNmeld3T1ZnVkc2dVpBQnZtY3dKMnorandWZDIvTzJtSzEvNG9n?=
 =?utf-8?B?cFJJV00vbllOakRlZy9CTW5WUUZHV3ZFVlEyYzJMUTl0K2ZzV2kwWWNyNEky?=
 =?utf-8?B?cHpLT2E5ejRhMzNMWkwvZjhlS3l1VGZKQW5QUUpRV1Vlc0pSOXA0N2UzeUFT?=
 =?utf-8?B?bE9kVk1SZ1hORDZqQjhjeU9VNHZZcEhSVFdrcTlXR1RNN2ZkSStPR0dmWVpN?=
 =?utf-8?B?MWhuS0swUUJLVkhjSjYrUDQ4RHcyYS9ZMmFLd0JFRlIvQlNTWTdrV3M4anR1?=
 =?utf-8?B?Ny9kK01hakI4cHk1SXRHZHh6OXJGQ1ZXRHJjWisza1crek9ZYUFwTlEybkl3?=
 =?utf-8?B?b3hQWnBTYWtyN2tpdXhoZEMrTWd0Z1JFMUk0ZThxZ0IvODdZS1duYTBzells?=
 =?utf-8?B?aHJQa3JzaWN5cFRRajJVMm5TdklHOWpQMVZmMTdUWC91b2FERlBpWWdjbjlq?=
 =?utf-8?B?eUM0b3pRQk9KTnhXUjkvRHFjVGdxeDluL0U4WVh2Q1ZjeXk2dzJ4eVJnUXhE?=
 =?utf-8?B?VE9iRFVueHFhR1hKbVpndWxqc3lHUGhQY25LTG9zdElKRnFSL3VTUHQwYXkr?=
 =?utf-8?B?bG4rTHFMcm9oamVnQmwvR2NPek9OUXNMZjJiUi8xL3preXRLZ2RIN1puUHVm?=
 =?utf-8?B?TlFZalArVkJQSVBtLzZ1a2JDeDF3WC9ySU0xSC9aeGozZ0c1NGdPa3Z2QXJ4?=
 =?utf-8?B?R2JtYUpacXIvWWZBYjhvNFhEMkpMTnpuc1p0QnpYZllndnVTbzFpNjRvMnV2?=
 =?utf-8?B?VkdVQUJ1TFdObnZhamNPRnRSUlBvU0FYZlh1MTBNdU12QU9UVWtjTDlrSlIw?=
 =?utf-8?B?a1ZnYUJtajlUWnBIRzk2aHZRQ1kxTUs3THF1TG1BbE11cktUenNGVWtkNmhH?=
 =?utf-8?B?cUFLb09hSFRHMTFyTHd1dHhydFhOLzRwYmdwcHVURjlhN2R5N3hURXp4Rmw5?=
 =?utf-8?B?cUFKcW91V0w3ZEtBbFV0WVdPQ1E4MU13SzRkaDM5aHZVcHpuSkhiYWRvb1BO?=
 =?utf-8?B?cG1JTGxXRG1OWEtPUGhQT0hKb3d1UytEMnhRRkVjNU14WnAzWjg0MjB0ZEJZ?=
 =?utf-8?B?YUhjVXlMMVl1eHlSQ2JPY0RrQmx1NHpvSWpXcGFrQlZiMGFkOXRsNkdxOTgy?=
 =?utf-8?B?TXJKU1EvdWl2MnlsWjRFTXh6V3Z3Q0l4T0Z5TjRmbmcvU05neklHdTNxTUs0?=
 =?utf-8?B?eFdmaW5VZkNyUkFZK2draW9DRldXV3lXcFBtbU0rZkhtcWRySU5aSmFHemlG?=
 =?utf-8?B?SGxkbks1Y2szeGxHZnVSa0V2Q1lGb3pDZDZCNjBuMktBbGluUG1XRFN6bXBk?=
 =?utf-8?B?bFRoS2l1SjdOOFNSbEE2djNHQVhFWE85ZHdOT3pqWDY0ZkVwTEVob3ZySUcy?=
 =?utf-8?Q?1yMe6FOzI5oL5pzInjq5+JNKb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 575f1aa9-9a51-46b0-4291-08ddb8eb8cc3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 22:06:37.6380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1urvnpaZpZwuhIkWsqwWT6/QvyXFd56nyRw3d0/VM/BfgYgxNT+geMXtRtk/XPOzteh/050mtwSZDJmcri62zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8843

From: Eugen Hristev <eugen.hristev@linaro.org>

Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
and i.MX95 platform.

Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
This is continue previous thread
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221216143717.1002015-2-eugen.hristev@microchip.com/#3023663

change in v1 (compared to previous post)
- add reg-names
- remove clk surfix
- add imx93,dw-csi compatible string
- add dphys subnode name
- use compatible string snps,dw-mipi-csi2-v150 to avoid use general fallback
compatible string.
---
 .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 161 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 162 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
new file mode 100644
index 0000000000000..2a93bd72498f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
@@ -0,0 +1,161 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/snps,dw-mipi-csi2-v150.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare CSI-2 Host controller (csi2host)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+  - Eugen Hristev <eugen.hristev@microchip.com>
+
+description:
+  CSI2HOST is used to receive image coming from an MIPI CSI-2 compatible
+  camera. It will convert the incoming CSI-2 stream into a dedicated
+  interface called the Synopsys IDI (Image Data Interface).
+  This interface is a 32-bit SoC internal only, and can be assimilated
+  with a CSI-2 interface.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx93-mipi-csi2
+          - const: snps,dw-mipi-csi2-v150
+      - const: snps,dw-mipi-csi2-v150
+
+  reg:
+    items:
+      - description: MIPI CSI-2 core register
+
+  reg-names:
+    items:
+      - const: core
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: per
+      - const: pixel
+
+  phys:
+    maxItems: 1
+    description: MIPI D-PHY
+
+  phy-names:
+    items:
+      - const: rx
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node, single endpoint describing the input port.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+            description: Endpoint connected to input device
+
+            properties:
+              bus-type:
+                const: 4
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  maximum: 4
+
+              clock-lanes:
+                maxItems: 1
+
+              remote-endpoint: true
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Output port node, single endpoint describing the output port.
+
+        properties:
+          endpoint:
+            unevaluatedProperties: false
+            $ref: video-interfaces.yaml#
+            description: Endpoint connected to output device
+
+            properties:
+              bus-type:
+                const: 4
+
+              remote-endpoint: true
+
+    required:
+      - port@0
+      - port@1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - ports
+
+examples:
+  - |
+    csi@3000 {
+        compatible = "snps,dw-mipi-csi2-v150";
+        reg = <0x03000 0x1000>;
+        reg-names = "core";
+        phys = <&mipi_dphy_rx 0>;
+        phy-names = "rx";
+        resets = <&dw_rst 1>;
+        interrupts = <2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    bus-type = <4>; /* MIPI CSI2 D-PHY */
+                    remote-endpoint = <&camera_1>;
+                    data-lanes = <1 2>;
+                    clock-lanes = <0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&idi_receiver>;
+                    bus-type = <4>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 01d2aa62045c7..e208c91f1405f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15021,6 +15021,7 @@ F:	Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+F:	Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
 F:	drivers/media/platform/nxp/imx-mipi-csis.c
 F:	drivers/media/platform/nxp/imx-parallel-csi.c
 F:	drivers/media/platform/nxp/imx7-media-csi.c

-- 
2.34.1


