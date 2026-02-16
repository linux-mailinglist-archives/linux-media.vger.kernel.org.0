Return-Path: <linux-media+bounces-52923-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPShJqttk2kd4gEAu9opvQ
	(envelope-from <linux-media+bounces-52923-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:19:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F35EE1473E9
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81653302DB44
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 19:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F11D2EAD1B;
	Mon, 16 Feb 2026 19:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HLIUBzK3"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013039.outbound.protection.outlook.com [52.101.83.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CB2E7BD2;
	Mon, 16 Feb 2026 19:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771269538; cv=fail; b=poxICRq0UtyTSMC7YvdCNbNuOx+HLi3JxJqI9wbzCQ4hoYyXh9q4cjlbcTw6vWmsAcoIUHMKMwLZbKNwvNBcV4BijbxETyW/5zIuYeMHwWrybAki2qHQImgOX6J199skFnSP4niamrmhQ+CAA6si8Rn2Cc7gr67/kaaVr6akV3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771269538; c=relaxed/simple;
	bh=K6VSUzky08N7jd6wNgkNb9KNQx6uSrXfpNAXwXWqTNs=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=nFfBMWOygK2eoYTT+nc6e7+Sjd9Xlq5S970hZGYNBcHlMCSZxqhyPN/L6DeIvPSB6Lsz0KVwPs8udK4t9VeWhR/mvIlpUa2cxNJyg0/QT3ib+kU/fY6AljOTpER3iUw0hwbaVQLecFSDlzoJnEXemgA8aBn4DUFEZP+/KLKM7nA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HLIUBzK3; arc=fail smtp.client-ip=52.101.83.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APXmWSN8q6XbdZeW7tO3WaPX9G7nAqzXbvP3l6g3IADDwS772AMfr8XbY5P1FnCUwCwOeJE07HGY8o64qPWlJZHdQBy0bhwqFC6MQ9qwOEdSUNkLows0uczZjBCBH9y+TcFDo8B3+o03y3LeThoPBJscs7hfh5G4UnvkSwLXNtZq/CPkYncDSrRlPVuNkPezmk1Zr7z0OLHu/PrtzAcRAM6b13Rk5xjJTZs7uC81wwyPU7yEhBmux7R9vH9AzC6dq6WfmSufEZ1pNcMXEDSXqHZ/MG/vKYazlDfbmexCwlMn0vcY3IrgcJG0spW/5Y1xtv9XxD0sb4yfS/TS2/HiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gNqffjcGkn5cvmDGDSfGoKiew/qS2+FfzCNwZskS/M=;
 b=KxHrZnIcfglbsvIXpKVmwFK7p083KB7t0nfNqoMKi5mWuK/DvonwKOL5Pf47VADNp/umNgwFNSO6mzyxHn5x8zoildJl0nx5RSrHOua/P1/T/IBJ8AxFCng0hr5qYhqlnitUqxj/k1eGH85dxkLQYRV2Z2tFptXQvjMKkucNpmKZzzsj+f5RLN64YLlLrwJwLU//KaSNg7nxrHJ1CDhLoCu76K4Of0a8oJ/PDG1JIlcZtTF6H5MCsL9UJ+YkyVmxZS1fKK0w3S8ed3h2sKoVdlLVAwEt4B2IUfgv7OLE3a7Zexr+qkJniXs5sEG5IWpiKppkfhltTCx/aj1kvV9vQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gNqffjcGkn5cvmDGDSfGoKiew/qS2+FfzCNwZskS/M=;
 b=HLIUBzK3h3p6Q2cyIRcqSjPRis1o4mzANAPjrFnVIWQJjllnkPCm/EqZPKl6VRWo7mdlRrNDjv+PRKqc0AxaLEDk7sFvVArvHYNEooLNq0M8vYLtNLuzep7TvxYUuJcuF6K/g+JadksP6DMs8Kw2KFpDI/RRUU5Ui8twxU6Q1U0XHcR4rpuN8w0s7kXe7wiC3jlGc10VGHTo6g97/0mM0IdS76FI8Jsxj71ffGp54FVEp0GO65+9wFvdPPvpZdgDPxTx3+ZJWra9+wGZ+lTzDIljL3fqml4Bmqx0aHZLH34limVWuxyXAOHyTiglVqrBW5HaVi/NYQSoU95ciwzqwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 19:18:52 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 19:18:52 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 0/6] media: synopsys: Add imx93 support
Date: Mon, 16 Feb 2026 14:18:38 -0500
Message-Id: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI5tk2kC/13MSw6CMBSF4a2Qjq1pb8kFHLkP44A+kDvgkdbUG
 sLeLTjQMDwn+b+FBefJBXYpFuZdpEDTmIc6Fcz07fhwnGzeDASgkFBzGlKjuH1xEwi4Liuw1mh
 ZYctyM3vXUdq92z3vnsJz8u+dj3J7vxJIcZCi5IJjg1hpXaPu2uuY5rOZBrY5Ef5bdWwht7V2K
 FTTlaXBX7uu6wf+z9TG5AAAAA==
X-Change-ID: 20260128-imx93-dw-csi2-b472ddcb176a
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771269529; l=1944;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=K6VSUzky08N7jd6wNgkNb9KNQx6uSrXfpNAXwXWqTNs=;
 b=F2kuxcVMvC73iKFQ7LRRa12WUcioCONI0G9Wb3qaK9z4SI+bPnZ/8hlQU4mxO7oUXaup5J7b1
 RMVTEjT5W6+CyVv87mc6o3Igd9ujnMsjjUCARwstftaZpXxqoUJYF52
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f3ce26-ac3a-4bb9-2fe2-08de6d903884
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TFlSMmNsNUVuM1hoRGR6Lzh2TlJaYXoydVkyNm5VOXdwZm0wb2lzUW44R0w2?=
 =?utf-8?B?dWNGdEJTSXVmaGU5ZlZKZXZBNEZVUkQ4QTBZMnlYdEs3YnYwbzhWM0Jtc0ph?=
 =?utf-8?B?SUxSQ0tac1ZiRjRlZFMxUmI0ZmJ5QnVRVlhXQy81L2Q2QUxHMjBxdVVpTi9v?=
 =?utf-8?B?eElURkRDOHdqU2F6elByQWFDYVp6enNPYitwb3BtTU5xd09sV2t5TzBrSWIy?=
 =?utf-8?B?TFpZRC9WQ3ZJUlhpRlA5SE5oVGhNNmJKb3FCNE1oMkVCS1MxeXk3aThCc0hh?=
 =?utf-8?B?dHhGMXYrbGJ6ZkpIdXdVNFpLV3VRRk9NVDZweFp0WjB3cGZTTEJVSEtzeE9V?=
 =?utf-8?B?WTdkTkdpbXBnWUpreTFlSGtsdGV0V0QvdTF4c3U4Wk1XNXQweUZCZG4vWkFl?=
 =?utf-8?B?cW9WQ2p5ZVdISkNSZHlJakdiUEdEZG5oajExTWU2RFhmSVQ0M3hCNVBwenB5?=
 =?utf-8?B?U2haR2pKRDdDM3l0NjREQlFpdFltWGlrNTF0WGplcmxwM2dZaXBESVF3MENz?=
 =?utf-8?B?V0c1SWZPazRucEh0L1l0elBhcmRYdVdsUU5BbjU1STZyR2lLSjhjdUhSOGs2?=
 =?utf-8?B?bUdkNkR5dkt5cVJDZVlMS096Z3h5UlRRS2c4TmJmU2V6VkdqdWZkdUxqWEF5?=
 =?utf-8?B?NnBhNDJ6ZEdVeHJ6M0lOdG00a25EamtmQjVhcTR6dHVGRjhQd05rSG1iMW9w?=
 =?utf-8?B?elVJK0xCMU5MZjRmYmlZRllZTE1BbVZPN1VYNndlYUxKeDJBZnZkd2R6cGFs?=
 =?utf-8?B?ZHFQOXVsKzE5WnZoTmpFcnROTDVVT3M3Qzg3ZEVWdmtneDQzeVpKbndVYkFi?=
 =?utf-8?B?TThiN243aStFUFFXQlhSTE9HejQ3UzNDd1RkU2M2dVErd1FlZVAzUDQzOC9D?=
 =?utf-8?B?Y1REVGROQUlRSDJ3KzluaWVvQWltckMySVdOZFRhU0dhZkJadnNyVkJXOXNr?=
 =?utf-8?B?LzkrNi9lLzBteHFadzk0KzFrWU43c0NTcm0ramxIN1Y3aWQ2ZTlJdWZhSEZ0?=
 =?utf-8?B?SHF2bU9uSnlpUFN6YUxtL2RQMEZLVXkza2oydkMyMkhLamM1S0FRbjNtWjNu?=
 =?utf-8?B?UXFxNFlETE5xS29uWnNnNVFabmlmbFhXeFAzR3BkL2g1V2tUOEQ0N0NUay80?=
 =?utf-8?B?eSs0WG0wMFZZZ2Q4bDVMeVMxQUtqVE5UcWJNNnB1azQzSWY1M2I4cHQyZnVY?=
 =?utf-8?B?aTY4RWg2ZFlNZ1A0TDVJZXpBM1o5dDd4cGNPc2FKS2t2bzBZMTJoZ1VwMFFQ?=
 =?utf-8?B?OGwzYVNVRmFDUTEyV21FSUxPanB2K2FYUGNSWUp2VlRhK0xWMDhlMnE0bG5Y?=
 =?utf-8?B?Uk9yRkVmWkdUMktHU2JlQUtCc3E4L3hhcUhPZVBNV2ZMZW1rTEZsTW8vaWRi?=
 =?utf-8?B?YjJuNUgvL0dWSWVEYkZoemEvbnRmNEJPb3ZZSVJVNzNxMFpiZ2loejZPSVFh?=
 =?utf-8?B?MHJvWWhVMjhiZUZEcGh1UGFjaFdiSC9XaVVFNXM2cU5CZlZ5N0IyWVUxU25E?=
 =?utf-8?B?NlFGWXV5WUtTS2FFUmlGZVJnNDZ3THdCVXV0a0FwbUpMbWRhbFpMazUzMXc4?=
 =?utf-8?B?MHRMVk5KZm5JbDk2bW1jeW9EUVNseHNDZ0VPV2Q0Z0xkb2Z2VlduK0pGcjRO?=
 =?utf-8?B?aUg1aVZiOWJSWGs3d0RCWG56S1FENGV2SDFIM0hCa2s1Nnd3ZWEwazJFb2pP?=
 =?utf-8?B?aG9XZUdBbkhkU3diNDE4UVNwMGxRZUpGdHFBUnlYT2NZRDVBUVlHbkFmbTNI?=
 =?utf-8?B?VVFmUmhyYkU5RjROTnFSdDZzbmlVRkVEcm5pUDNPaVFKMERzV2VyV1FleVFV?=
 =?utf-8?B?QW1EU3A1b1dMdkdxLzFHdnVSTFFMaG9vdEMrUks2RGZXa0VGQUxKbHNBZnJ3?=
 =?utf-8?B?enFkRHhXRmwwMkpnN3ZNd3kxYjRCeXppeFhNQkcrbkc2c3hMbm12RkFGeFU2?=
 =?utf-8?B?VEFqcGU1WCtEc0Y5elI5M0JhRW9mMnpWQjVySWc5cC8rVGp2dVBOSVVWbXI4?=
 =?utf-8?B?aER4ZXJneGJKRklaeGtDRFg0ZmpxRjNSc3hjTlJKVFBFbUV4SzlYT2l1d010?=
 =?utf-8?B?T0dHS1JYOFhZbGM1YzZ4UUVNeWE5dEZVRUJhVzRnNVVVa25OVmtDN0NXRFpX?=
 =?utf-8?B?NTlUZlV5Y09nUUVvVGxvT2QyRHZDbzU0R0pLLzc4TkJKTFFmdkdKWFhZWXhq?=
 =?utf-8?Q?d853j+CS4gbRwiCNqQZ6qPY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TXRjWkJreDhLWXdQOEZuc3JRQ3VIR3pnT1VWblpwakhYblZQbURCbjZ3R1d4?=
 =?utf-8?B?QUcyblVLSVBrdW5KazVsQ3hSU3I1clZzbWVxL2xOMWJyR2t6OXhEaFEzODBi?=
 =?utf-8?B?K3N6MEI3cHd6UC9ESm84c044UEtTMkNocnJHOVFrellNVEM5b3kxUi9wQlgx?=
 =?utf-8?B?cEZvcGlqZHdKS2duejBNVXQ5V241LzBzU3FHcXFNUnJ3c2VkYmsrWVJaTFky?=
 =?utf-8?B?cVNQR0xxbFA3cmFMNWJJbzNHUmJGc1FGZ2N4V1ltOGhrNmdhU21tSlZzYlpL?=
 =?utf-8?B?VlhUN0RnQjNlb1NJRTBHSFVCSjZDUjRaSUREYTRsVGtwUjVqdHdSckwyYlpP?=
 =?utf-8?B?SlFKZURpR2w5V1hEaWNsRGx5ODFkNnJtaktQQ25vMy9YY0d2MndncWFJZXdk?=
 =?utf-8?B?Q21yT0VFWWxXOGpNMVM2QzUrRm5xcUwzeko2YlFjaDYxTWV6OWcxc1l4dWV4?=
 =?utf-8?B?cVVVTXcyRTNYUm9wM0tMRURVc0UvSy9VSG9MOWZLOERyeVBCaHRhWVJGZHpY?=
 =?utf-8?B?TDNEeUdQZVZWbHl1K28rTnhNUUJjS1hNdmRYZnQwOEU0Lyt5dGpQYm5VZWt0?=
 =?utf-8?B?UTdVa0V2TXg0a1p4UmlVMXBoa3R3K0g3d2RQVW9ZZDdNckh0SUJnQkp1Tmpj?=
 =?utf-8?B?cHVxSjBjUzVQc0NGb00zYzgza1ZMOFFvY1lpLzRwcDBmdC9wbC9PRGFRQ1FP?=
 =?utf-8?B?UWFHT2xjdWxqSk5VRUI3NWw0bjlFZ2tYZWJ2MzNsT09qSmhvZG1MUW9KRy9S?=
 =?utf-8?B?Z2NTdDNEa2RCQ3RwVzBkd1ZJamlNUjJ1NmphMEpVUlcxZ2hIaEdpd2M4Q0wy?=
 =?utf-8?B?NXpsakJ5VjJzMm1LaENkemRmTG1QTlFvRSs5SUNtR2I1RGRZbnVWQUx5eG9z?=
 =?utf-8?B?emYrQXlJYkh0VG1HOXg2TGZBQ0dvMk1xOUpYM3NQRkw0NFVuOERyeTR0bzlm?=
 =?utf-8?B?Q2pnWTR0Yk0yWlZmLzFscEhUUzcyVkM3aFRxNitSK01NWVNKUytDVmE2L3l1?=
 =?utf-8?B?QlpkL2N2MVRiYU5zYkNqOWcySkhET0RyWkhLS3VPOVllWTB2YzFWMWZra1VB?=
 =?utf-8?B?T0FPbnM0T2hjaUd3SWozemFrT3lJak4vbUtMWnhFZXhndmJqb2tLZmtsZ1ZB?=
 =?utf-8?B?WWVKRGhycUt5bXp3a1VuRUV1ektVbUoxZC9BUlpMVjJhMTE3bUVlajNlY0x5?=
 =?utf-8?B?ajI3dXN0QVF5U2trdTEwaEF4ajBucWlXdXpJeFVmVTZLWlVhRnRSK3Zzb2F5?=
 =?utf-8?B?RzFLSUN2N203RzdtcXdDNlVtVng5OUVKeVJ0b0FBSDFHUFpQK2dRVXNBUHpj?=
 =?utf-8?B?WHhiV29MMVRYaUMzZEQ3SklWbWhoQU9jTDVWMVNXQnEzMStTUWErU05hV050?=
 =?utf-8?B?cE9LT3lrb1h2N2h5NURuUElONExXMTFFdmswOExhVW5aaS8zYitqZUJFNzln?=
 =?utf-8?B?ZFlvL3hQSE56K1RBaExVdkw4NUluUGF0MDlUMEoyb0VmMk95VVAwTU5HUGtq?=
 =?utf-8?B?UmNucXBxaThBT2VCb2lxV2NzOHE5Ym5SRGpUZmR5RWgzeXphdE5XWEpycWpV?=
 =?utf-8?B?ZTYrdFFveWZWSE5Ed05pN0NhSms3bzR6S2RZQUtWUWJmb1kxb3JVL3YyMzRV?=
 =?utf-8?B?OFFTYW1raGpKdHp5TlVwWGV5SFA5ZE5aQXdNL3JUTjYxeW5GckNiT1Z2alp1?=
 =?utf-8?B?YUNTM216V0x1ajk5Zmlsc3VNQjMrZzJzM0loSlp3VGZDanduUEJmTEZkVVNa?=
 =?utf-8?B?aWlrM3NLajBjV3llZzhwK1VodGhWS0l0eUg3c0ZObFBiMjJtUWN6a2p1U2h6?=
 =?utf-8?B?NXFlUGJnL2x0MnBZVUNJZnVmNGpuWVJ1aDBzaDlISG0xa09wK2h0ak1kSkNB?=
 =?utf-8?B?M3Q1N3NveExsSk4wQjc1ZDVSSFREcitRV3pLb3RHNThVRUlYTzRYY2NOSEgy?=
 =?utf-8?B?T05tUG96cEluSkUwNmVrM3hSZ3BMYXAzUzNwbmlkUkRRVThBalMvZXBvNTNX?=
 =?utf-8?B?a3duV3AvMHUyY29VUHV3bk1qcmx4OHBSVDYyd2JGVzZoeU9zOEcxSk9vRjZv?=
 =?utf-8?B?ZHdaN1lNbkVQR3pxWENwMXNnMzcvSVlFZHYwNTRDS2dZWkxXR3ZvQnhLdXNT?=
 =?utf-8?B?OUVzL0NuY3hrQVRpS2pQSTk2ck1GUjk0UUNGbldpaXpoRnFlNGNmSlZwRmhW?=
 =?utf-8?B?N05pYnJIQ0VqNnF5MSt4NWZpZGNaMVJUVWhTN2YzaWpYa1VFcFpNOXBJR1VE?=
 =?utf-8?B?WlgvcG9kenRyYWFWTDQ2eGxDUmpKV3cydlMxZzNHQTFBVlNKcWRVd3RQWWdQ?=
 =?utf-8?Q?U/dtqYggxAm8zsppID?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f3ce26-ac3a-4bb9-2fe2-08de6d903884
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 19:18:52.6323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USS7sj7wy+OsanTkf5uedyQfak2wPFUfgb+6ZzzLXriO1i+2KBP8x1FIawb3jGI2fqLquCR8oDHlltr0sfUDJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52923-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: F35EE1473E9
X-Rspamd-Action: no action

This 3rd time try to support DW CSI2RX support for imx93.

1st: Create new dw csi2 driver
https://lore.kernel.org/all/20250701-95_cam-v1-5-c5172bab387b@nxp.com/

2nd: Based on legacy imx6's DW CSI2 constroller.
https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/

Now rockchip create a common DW CSI2RX driver at
drivers/media/platform/synopsys/dw-mipi-csi2rx.c

This time base on rockchip's implement.

i.MX93's version is newer than rockchip one. i.MX6's is more similar with
rockchips.

But i.MX6 is too old. So start at i.MX93 firstly even it has bigger
difference.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- use dw_mipi_csi2rx_has_reg().
- detail change see each patches's change log
- Link to v2: https://lore.kernel.org/r/20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com

Changes in v2:
- use enum and array map to real register offset.
- Please keep the order:
 - #includes
 - #defines
 - enum and struct definitions
 - the rest
- detail change see each patches's change log
- Link to v1: https://lore.kernel.org/r/20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com

---
Frank Li (6):
      media: synopsys: csi2rx: use devm_reset_control_get_optional_exclusive()
      media: synopsys: csi2rx: only check errors from devm_clk_bulk_get_all()
      media: synopsys: csi2rx: implement .get_frame_desc() callback
      media: synopsys: csi2rx: Use enum and u32 array for register offsets
      media: dt-bindings: add NXP i.MX93 compatible string
      media: synopsys: csi2rx: add i.MX93 support

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  47 +++-
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 278 +++++++++++++++++++--
 2 files changed, 303 insertions(+), 22 deletions(-)
---
base-commit: ada3fa02f7a95623b724dfe300fce6f49cc2d75a
change-id: 20260128-imx93-dw-csi2-b472ddcb176a

Best regards,
--
Frank Li <Frank.Li@nxp.com>


