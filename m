Return-Path: <linux-media+bounces-59370-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCQZHe7W6Wn3lQIAu9opvQ
	(envelope-from <linux-media+bounces-59370-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:23:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E80444E7BC
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD4A1305B589
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 08:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18DB3BE622;
	Thu, 23 Apr 2026 08:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y0gnlEwf"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BCB27A47F;
	Thu, 23 Apr 2026 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932494; cv=fail; b=EDaNyyP4ORHcyC9YNUkptWeqmVLNLNtLOaYS8aEiE2MtBrM7/zrGSep7hH5C253fOkGHIc0d5jgOL0KUKMptdPEGwydPuNGi90bLmNJeFE8FH/PrwieW7TOd6KpMCwzgUtAUa0EUxahdKT48NicisdylwPPWRhy5UoUFgF/aeF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932494; c=relaxed/simple;
	bh=r8/7uwGIS/NH48VHg7hb4l+lDQmjYcBImbjDcqBaESA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WAbEmqY6mTbSLYJtJIDxjYX4l7ZsIulPcRGU2D5LULWs5Zii8whHpIwNpvebD8A5sf6qCLljRMDD9LEv4LuSvGwpN156jPWutk82BIgtRwliuclSZU9ooSx0gwJVZZuerkcown8miDXnpi6oa+uEvTafssqgvJKTFpOs8A8M37k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y0gnlEwf; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dy5wbJpD9jdtyJ7ijFCm5K/i/hhKgZqpgNSuRu3sTizDRdevVLMPw5HAD2KOFS5jzdjsyb4ghrBuvGEypRHFQ2Dz6sc+W5PGg/emHJ7VzIqlRGSHTerccXJv7BKWnfmSLA2oI5vg9uCMqcZXGKuwVga1RNPJ4g7SUPvhqVMWn8Xwas28ftLQe6xC89tGMzdkBQipnZw4yKZThjmXaPGqBeycWIHNqZazLzmDDzbk6F6WN8FhZl+V3cYq9ORT4xUCCf04/TWjXtId85uGBWuSs4hGV8OlhNpK+bGFz/gAoIIROEDQZ1fzm7PFwn7jWyqSv6s+5+qqusrit41Dihxi5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jncWzWtq77nPl52vR7VB694dzelEO11XE+BUogbecPU=;
 b=wbKAT65g+VNoan8gWDePpoNq1Chd28VFSVGzvEidJ55bhUIv3gix0f7DW7fWIO3Kk1MNOVrWit/CMloeR+sFuQcWbnIR+7bHAFePl8lpWY/NDS7KdIqtWlkThiS+Y2EfRgLkFY7t4DjIt1OvbaAzK9UTKgjs88TcehGMuvYjhFvC65hc8a1KrnPdcs//Uo7+K32CWu9M6ru6rG6yta2FYG8GSYiO30aAY5z8Ll+f5jirV9ueOiBAfS4jONoQAAbLdLWnUOkKk3QVitrJl7R37rPmw8vuNA2Gjw5lIO77u5M/YDejKIpqOC3F7ZbNWfhjw8W7KWwLDWFrCbKoGjGwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jncWzWtq77nPl52vR7VB694dzelEO11XE+BUogbecPU=;
 b=Y0gnlEwfgN07VbksfIvPXq98gwjjnE482mnnEFms46pziTx3hluwf06LPhO6DvLUhSyiMOJwc9f8rpZ2kKZqoB48V2Eu83meiH1Hu+Ei2nFT5l5k4lKtlE96F/ywtro8NOFiRRSDmrwuiVt2tB/lT9S1MVzAGl3tTLAhcnrHvd0Nu1cgmvsr2fS2MRwI3ksFud4WWMN3QvqHThAnnt5xc3SrvmNv7cupQBzCM7tfAhb5W27XwNR8KpX95TOkfEY1gnfByZUN3Iy0sSxnLUXHmbcWOkrOwBhbq7BAoUOIUMDRHFa/opsvIu9ZtRCEc9a4iK1ozK7N1JNEmipvz1pCDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8876.eurprd04.prod.outlook.com (2603:10a6:20b:40b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:21:30 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 08:21:30 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Apr 2026 16:23:00 +0800
Subject: [PATCH v2 5/7] media: synopsys: Add PHY stopstate wait for i.MX93
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-csi2_imx95-v2-5-934c02f3422a@oss.nxp.com>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
In-Reply-To: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776932600; l=4298;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=r8/7uwGIS/NH48VHg7hb4l+lDQmjYcBImbjDcqBaESA=;
 b=761Wir5z7LEMgK4qMaNGqqzIVfDXTjrorviYkptcpCZ+sjnnh6pSfnhylOFs0lZxS7d776dlN
 ofJEnn96MLxDfY9xwy6vLWrurBfM8HbsJp5F+MuzV38nubQ/iIm4Wom
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eebc18b-31bb-4cc0-2d56-08dea111521d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|19092799006|18002099003|921020|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 IwWqv5u87RldBInBJ6nzrUA/+CpxK5FymV04wl/gboxIIYLnEm10Q8xr2+tWuM/MSz/qZrWye5EKcy+5J/NvN7IDchQGnbXrpFWyKBBYTypslCKhSz9f9tJMFCoXmJvXdm8x3yAslfTAOPRUxA/HuVTEhdbcau8zX3EI3xaw/MtMm3kdTX48PRZs2KmNjj058JKaNf3ndwG017sXy/0LGp0ymX15h9TpOmS8HWxos0Gqyiy6HK3sh8s6p/wr+11C26hbUb4cKQsfAATCPsfifRc5bwkca0fXkwP9QmHDDq809BYwoepR+Bm34rHmDZNHa/l03c5M/8dX64r7TsTK79pgiyKlyC4MuGatSXxCmEoJOPiSlNwS42BQMXk4dOFChIYCClDsRA0G9Ndk4PT9wVPwhfUDCwri4+1p7fRiD1zZT5w0MuY+dsGYCn7QRSSG+8ZHMXVTJ4Reof98twfw1jQOkKMXGI/HOsd0LiW4F3uUtcu1/i3AiAwYgt0VsVm9e62SrIjs27hKj1YrS37vLATMzM61DHWFaE+b6je8QCiVynZJS851ykrLRr5oeL7UIUx5qfb1IklJRvKM2oNTNDsjk/HoKqyZHTTKXNWQqlkm0v5r5zlFd8iSAViZzLGQb2eMKZJBNnNbvGZ+F9rz4L4hmJJaCEPiGQoUDoZrCsu6X646GUQN2ZPXw5lBuLPh+C1IWS05UaqU3MnQB6XQ+mmOVSJQ5QvO/vBf2B2YcL1kO2rVzxuWqv25lyme2RKkz/C5GBP+wWXLBMdDWfwmZq/fE6eS493bMR0k5U6fVXjs1IpxZXzxBV0QQ9dfcpTr
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(19092799006)(18002099003)(921020)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y1dXdk8wV0ZwNmwzMjhFQjcyNDNZcDVaaVdWQ09tOXU1dVRZWm42ck8vdWxI?=
 =?utf-8?B?Z1VteDhzVzN1elRTcVhHOEF2NEtNMytoYWRkQWJtM3Z5UHByMzg5NmNnL2pv?=
 =?utf-8?B?SjRhWHZnS0pzclcycVM1M0xlT3pMckFRNnJodW4rQ2lpT0R0TmkzVmFWNlpL?=
 =?utf-8?B?WWlsckQzYmZWclhPdlluTUcxZnlHY0lSU1FTU21CN3puV2tyWEFVcXdGZGxC?=
 =?utf-8?B?Y01UTVErZklSdmFUaHNCSGFyV0tZOEppZGY4OWhickhYUCtGeFd1ZVhHc3Y1?=
 =?utf-8?B?Ny9MclFoV3pLaGE5MGNUNlB1SVQ1SkhOQVB1dVpjU3RidEdkMVNuTUw4VUhK?=
 =?utf-8?B?Z2xIUUV4UkZLbTBnTEh6RHZYakl0UGVPN2FDb2owZlZHWTQ2NXcydjFaOGNF?=
 =?utf-8?B?aUg2eGRnSmtQeGx3UEFHNm9Nd1ZpRlpvU2dIWHQzaUlFaEc5YUVRcE5yWGdS?=
 =?utf-8?B?L285b0t6NElRS0VBejdMbWFvOUt5YjhSWVc4TEFQcUdXdDZGRWE5dHFQZ0pq?=
 =?utf-8?B?bzZvaEhPVU9SdytoVzIzV0JCQ0ZOVmtnSFZxd3AyS3RrMXJjSlJqSW41YlVH?=
 =?utf-8?B?NzJuK1JNV0FsRkpLdVVWZy9sUjdHZmU5dHdUeW9ITGtjeGhBU0cvWVltaGY2?=
 =?utf-8?B?cjY5THp2SGdPOURJbGc4TjR5WDBNM29hWkJIT1JrUkRhMktHRzE2dmxObmVM?=
 =?utf-8?B?ZGlicXMxay9CSkRIbTFla0VRWDJxSG5uRyszdjQ0eitpeDJ0QUpJRmM2THdY?=
 =?utf-8?B?dXZ3RGhXUkF5SnR1MmhvQjY1aWwxZzU4eGhPOXA4dE9tRGlWL3pWbXFYR3FJ?=
 =?utf-8?B?NUVhcTRLYVkwZlVlajJhSGJ1UUtnQi9JS0ZzYytseTRqSTF4S2NKVTJrSDhV?=
 =?utf-8?B?eTd3UER1TkFXeVd4UzdkQUROL0hFUUh4RDc5aWIyQVVONk0vZkFQQkxsVmds?=
 =?utf-8?B?OFllM0syTVcyb0xvYmxHNCtQd1RRN2JQdGZWNDNsSHVnTC93OWdhQ3AzZWFv?=
 =?utf-8?B?YTd1YldYcWJwSEJOUDlMdUtEU0RkeVVvVGhtUkpnVWE0MCtaN1dtZ2E2VXFG?=
 =?utf-8?B?RE1JdS9OVTV3Nlc1REhaMEN3VDV3ZGU0b1ZPQmh1MlI3OHptVlRvbkZkYXN0?=
 =?utf-8?B?VWl1R3k1T1VmcStxcFpUZzN1TC95V0R5ZWxmL0cxRE1GMVFrUUp2M054OFVU?=
 =?utf-8?B?eDQyN0t3ZXYxQmlTRnNnWHRrN1NvK3d5NzZkTnhFZzV4OVd3SkJ0VUdwN1B4?=
 =?utf-8?B?SllJUzBmOXhhZnBSeHRHd3A0aHpyNkZkd2JsMm80eGxUTWdQQnhhSG1rRFR5?=
 =?utf-8?B?MmM1UUtxVjV2T2RJWS9pcDJTRGF3SVNMMDBvSEdMcTZIK0hjZHl4Y2hxN1Zw?=
 =?utf-8?B?R2JDbTdNa2ZURU9VekNZNG83THM4VzgxSGZLZDZMT3pDUW1VaXNQRjVTTnNO?=
 =?utf-8?B?Rm1zSTdKY2ZLQ2xyTGhNUmN3ZEgxMGFad2c3YXo2MWdBMWJzNFZENzhXRHo0?=
 =?utf-8?B?ZmV6blFrVDd0a0hRdVBxeFlNcU9CSHJWOE0wdHJMejkzekVucE9PUmtHQlVo?=
 =?utf-8?B?aHlhaXFrMXlJdVJMRXdLKzRBZ3lqTlcvd2FyYVY3bVc0bS9Ibm0zVjZVY01S?=
 =?utf-8?B?MVJRNkd2SUs4bVpLVGR0ZFhuM2o1N0lVRTJtTTRRcG5CbXVSeDM3YzVwQlFu?=
 =?utf-8?B?Vzh5cmRXUmFhLy9UT3RsMnU0YVZWQ09WWlpOZHFiS3N2eEV4L0wya0k3bjBE?=
 =?utf-8?B?U1ZQYTJZTUpjbERQN1g0SGhnVGdkNERvQTRYVUJmYWs5YXV2SmtEM1hGMVIy?=
 =?utf-8?B?UWNSY0pnK3Y1R1VIQUc3VkxRYndHSXExRW5oSllFa2gzcHJNbDltZGdsMmFE?=
 =?utf-8?B?WFY0UCs2QUhFNWRUMUJocE9vVEFTcWFsQUpYbE5oS2RtRGNKN2ZlOEFQMVYr?=
 =?utf-8?B?K3UzS1IzNjdMK0tCTGtqQ1JXSGl6MGJGYU9hcmczTGZpYk9GTUVSK0ZqamRu?=
 =?utf-8?B?SEhNS2JSZWpjU2R1aHpTNTFvb3c5YUVoNGo1VDJHUWI4TW1SSVJlN3RzU0wx?=
 =?utf-8?B?Qjl6WVQxUUhYSnNuUWhCUDlrMVVRR09kS1FUU1MxMWtQc2liTGsvd05wZGpB?=
 =?utf-8?B?K3hkeUg5RkJLeGlJU0xFNFVzRWRLRC96MFN1K2MzZEk1d3ZJYThwUEhkZHQz?=
 =?utf-8?B?N1oxREZBMzZVK29kdlFUaklIV3ZxejZuaWFpSFd2dGZ6ZGlvZmJYVk50MmJM?=
 =?utf-8?B?U20wRCs5UjlMSkxJc1k3Vis1dWI2bzdnRmVFTmFFZjBGWitnNDBBdWJYaEpH?=
 =?utf-8?B?TjJUSExGRFAxcHdrOGl5Z01FWkl1OEJCdHU4Uy9GQjRUZ3dXb2pwdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eebc18b-31bb-4cc0-2d56-08dea111521d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:21:29.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFh/ZETQR8zuCeViFpk80DSSEIiouzSSgqniXBAlnSI/qljsdUX+p9Dca7k6PbUk5v6f/twqCwT+Y5RVGeFYGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8876
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59370-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 5E80444E7BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement waiting for D-PHY lanes to enter stop state on i.MX93. This
ensures proper PHY initialization by verifying that the clock lane and
all active data lanes have entered the stop state before proceeding with
further operations.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Removes redundant register availability check
- Uses read_poll_timeout() with dw_mipi_csi2rx_read() instead of
  readl_poll_timeout() with direct register address
- Fixes stopstate condition logic
- Check PHY stopstate after sensor enable instead of before to ensure
  correct timing.
- Optimize PHY stopstate polling parameters (1000us->10us, 2s->1ms) to
  balance performance and responsiveness.
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 5a2e74d055c0..8c38fe8a3f06 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
@@ -35,6 +36,8 @@
 #define DW_REG_EXIST		BIT(31)
 #define DW_REG(x)		(DW_REG_EXIST | (x))
 
+#define DPHY_STOPSTATE_CLK_LANE		BIT(16)
+
 #define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)
 
 #define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0), (x))
@@ -65,6 +68,7 @@ enum dw_mipi_csi2rx_regs_index {
 	DW_MIPI_CSI2RX_PHY_TST_CTRL0,
 	DW_MIPI_CSI2RX_PHY_TST_CTRL1,
 	DW_MIPI_CSI2RX_PHY_SHUTDOWNZ,
+	DW_MIPI_CSI2RX_PHY_STOPSTATE,
 	DW_MIPI_CSI2RX_IPI_DATATYPE,
 	DW_MIPI_CSI2RX_IPI_MEM_FLUSH,
 	DW_MIPI_CSI2RX_IPI_MODE,
@@ -87,6 +91,7 @@ struct dw_mipi_csi2rx_drvdata {
 	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
 	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
 	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
+	int (*wait_for_phy_stopstate)(struct dw_mipi_csi2rx_device *csi2);
 };
 
 struct dw_mipi_csi2rx_format {
@@ -139,6 +144,7 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
 	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
 	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
 	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
+	[DW_MIPI_CSI2RX_PHY_STOPSTATE] = DW_REG(0x4c),
 	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
 	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
 	[DW_MIPI_CSI2RX_IPI_MODE] = DW_REG(0x80),
@@ -550,10 +556,19 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_csi_stop;
 
+	if (!csi2->enabled_streams &&
+	    csi2->drvdata->wait_for_phy_stopstate) {
+		ret = csi2->drvdata->wait_for_phy_stopstate(csi2);
+		if (ret)
+			goto err_disable_streams;
+	}
+
 	csi2->enabled_streams |= streams_mask;
 
 	return 0;
 
+err_disable_streams:
+	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
 err_csi_stop:
 	/* Stop CSI hardware if no streams are enabled */
 	if (!csi2->enabled_streams)
@@ -864,11 +879,32 @@ static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);
 }
 
+static int imx93_csi2rx_wait_for_phy_stopstate(struct dw_mipi_csi2rx_device *csi2)
+{
+	struct device *dev = csi2->dev;
+	u32 stopstate_mask;
+	u32 val;
+	int ret;
+
+	stopstate_mask = DPHY_STOPSTATE_CLK_LANE | GENMASK(csi2->lanes_num - 1, 0);
+
+	ret = read_poll_timeout(dw_mipi_csi2rx_read, val,
+				(val & stopstate_mask) == stopstate_mask,
+				 10, 1000, true,
+				 csi2, DW_MIPI_CSI2RX_PHY_STOPSTATE);
+	if (ret)
+		dev_err(dev, "lanes are not in stop state: %#x, expected %#x\n",
+			val, stopstate_mask);
+
+	return ret;
+}
+
 static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
 	.regs = imx93_regs,
 	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
 	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
 	.ipi_enable = imx93_csi2rx_dphy_ipi_enable,
+	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
 };
 
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {

-- 
2.34.1


