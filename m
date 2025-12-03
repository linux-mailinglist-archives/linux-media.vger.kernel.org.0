Return-Path: <linux-media+bounces-48120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF1C9DED9
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 07:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4CE9D4E025C
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 06:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253D2299AB5;
	Wed,  3 Dec 2025 06:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wYLty/Hf"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B232989B0;
	Wed,  3 Dec 2025 06:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764743365; cv=fail; b=QauWnmQc0Ghcq0EeW4tkwfz78sup0vr9aEPaz/Zkou6ZSmdlWfOjFrZNM1XESIf9PrtgKbCYQzImujWG3RBqhb6ZKn3XzKHuUUg1HUMl9EzuHw49J1xyV4Pfs3c0a7DUcNX9N6LTfh347kw1p07oAgS7syJMGGRxPwDlph8qAK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764743365; c=relaxed/simple;
	bh=0bJkJXYbfWA46+oc8iQ4nnIKaAzVBmQekfB1d/8eoI8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bQZhOXgTlG49yEhrigGjeJk2ej+HBveDgvcBORPszzXhGFKl4Wkh5HSMKW72Ynlm07Ir44Xqd9nXY111Y5xOJOBquEpnuxOxfcoNNBZdrvmZhHqvXOiMHDUzlfv0eOhL0dCmwA+BPjnyLXssqwKFi8deibasRrzitkfEXqPg/cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wYLty/Hf; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCb1GkhVex/2nguds5en3RirGrgOYSCHIRXtFuoDKZ8E07RTx6KzLIbIQizOm7R8bkNdtyzZ12U/sceFX+JgchVRNs78/W0av5iTRlXFnYrWmf7q/BdO5Z70k2GACsunzJFnhld3Fl/1w4Da/PoYX8unE2sXOlhXWBiVtiVZG8dSfg9wyXpCmq7iSnM5kHPzxMzLWU0HC7y4NbkJZ6P2U/vG9GPl5HYiceCGYJgOuSbquXxnqctYQ8NSFxYfEWeMxnOgeN0U2sShtusf6/rVABiOaeL7OQRbZl5GcYF3bPTDVoUeNDi0pgrDSeptXGuhuFX0yVeSc+QvEsrJRlOrAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vf2jfmRay5tcE/fPdnAmOWtddVWtPEfan0VOHO2h+nk=;
 b=NP9Gn4PeFWEj1z3Wkqyj43FSvzkq6B4J6aufkmUZ5i0kAMTKq3PL0r9vo/WrVo5yWYqiXBHUvzlheQPTvuymzk/gG1J0EPyXg1smvn6i1OlOVsh62HdcXS0GyyA08i4EDDgo9c/ALTMLmh9YsUtJgsySENYNmYV0fd+c1If/ViTBpOf2JiTRVLREKmm2CgitN1QJot675Vzk9yyR8/03Q96QShT0TaN+HstP+znA579DpBi+xyCn3uRDZW/P4zo7LEXuZxRu4lAvmPfuE0Q+NGwe/psou86DKlpldNG3hO8IPm47XVremyKTI4uKOLrKCg927to2ieRw0xzccCiNPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vf2jfmRay5tcE/fPdnAmOWtddVWtPEfan0VOHO2h+nk=;
 b=wYLty/HfoMTzcR4arSVERu5GlMecqZSIUf6IDm2Q04oF7rlTb7AVTmmpi5IgJPt0aMIOVz607gJ0SLBDBrO+FU9CuFGpuyTrAHy5jo2EbzO8pZXIJDAHCK3pYlkLZFhHb5lNbTk3aqTdPU3izzbynLZ18cj0eg7gebBlLylkuP4f4OEAYRlOhbHWmIIUXwqF/T/sneF1SpIj/yp4oPvGNGnjVcXhAPYkOVhXe5l3og4POyyZ9SXgIvjiMAVbGmITRWahSZj//cXKwKqgRcm5JIoT08DITLZRUhneY87Sck7iRU2ig088pa0e5LgZbeCCUVrU4NRuulkMRFKn6GhSSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PR3PR04MB7451.eurprd04.prod.outlook.com (2603:10a6:102:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 06:29:21 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:29:21 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 03 Dec 2025 14:30:02 +0800
Subject: [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-csi_formatter-v1-1-eb9e1147b49e@nxp.com>
References: <20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com>
In-Reply-To: <20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764743424; l=3038;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=U327NKvAOECyiOwDo9eHaaI2uNDRKAGP1ytQI7IIwEU=;
 b=s1lHENGJMimiqSIZIimGMeSMWEzZS+M0NtPkkfSjXu+ZoCEC55H8QKDGSC35N+mmvo+y+s7j1
 Aj6/jnUGVT5B2vWjlsXUaVuS81QP7wMuAaQq7KkyrPggRYCeX5jy4To
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PR3PR04MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad3ce9a-501d-4475-642b-08de32354b2c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?d1grdjlkSW1LYm9tSStMQ3g3c2JBTVh6am50bHQvRUg0K0k5L0VENkV1ejBu?=
 =?utf-8?B?MFFtSm9iZm9EcUVqVGMzdUt3VEZsNXFKZlZmeno4cmt0ZFU0bTY4RUpycjFp?=
 =?utf-8?B?WWpPb2VPcVZoQlJkbzMyMXVUTXAyemJGaXpTaHlOdDJjeXU1U0NDanBtejI3?=
 =?utf-8?B?blllMFRiWGQ3bURHeUZDMk0xS1VlQjY5VTZCbVM3ZmdNVGdaUlcvV2wzU2hr?=
 =?utf-8?B?eXRlVEliMXJWdHhXNGtCU3crTVVWK2QvWGdoalR4WFR5RFJRUTRvZm1MWG9Q?=
 =?utf-8?B?Z1AwVDBLVWRkdG5pa0crUW1nbm1TamdpUlFQY2U5bTRTM2tOL2s2U2p6Mkl6?=
 =?utf-8?B?amxBWFd0My9vbHVST2R2QnJGS2VnWWJDdFRRZHVmaVJsazExRFhKUzZGMll4?=
 =?utf-8?B?RnFrL3ozNVpmUE1kZG4rdmVEYVF2SFBpczVkUXhpeXlERGVtdm8vM0w2eDdC?=
 =?utf-8?B?RTAzYlF5Z0JicnY3TFFpejY3cW1QeW9DWW9sSkFUdmVXa3plb3RtMzNvUStH?=
 =?utf-8?B?Y3FWNHhUejh2MU9zTmFlWWthRTkyQ3VkVElaclo2M3lIekFoVER4c2Q2NkNo?=
 =?utf-8?B?WU43N20yY01PS05aY1EyRWI5Z1JsbkUrLzQ0SXdnOWJQYXdhNEpKVk1KZXNS?=
 =?utf-8?B?azI2SFlDZGNhcjV3NXFma2FmTlRRWkJFRzlIKy9rT3hzY1dJa2pqa3BtRXJQ?=
 =?utf-8?B?RVZkVGgwekdPOUdnN3NySUhRNENMNEIrNXlBbE5UU1kxMXF3RWJxUDVwVVVP?=
 =?utf-8?B?R2loVjlTWWFQbFQ4YnM4aFpVdE9RRUJzaEtYZ0xDYVB3eE1iSGlqQTNEWGZP?=
 =?utf-8?B?UTFOS1R0cW9YSGcvakNvdU5vbGE4ak4ya0NhWnBBVWdBOG9TWTBqaXgydUhZ?=
 =?utf-8?B?ZmxwUjRYYXR5N3Iyb1MzT0ZVTGRNM0ZLZjFnWk9qYnYxSnY4aDAzeVYrM0RD?=
 =?utf-8?B?QXkzd2ZTRGZHZDBKaGFhQlN0T29rWXNuSTVQMmVpOXBWd0Z4MXg5b2ZvRDlI?=
 =?utf-8?B?bFV1YXlpRzZWZm1wenFVejVEdEsrT0VFYlArakdOd2hvRDlCTFZyQTY0KzYw?=
 =?utf-8?B?L0dMRjRuajRyU0JmVUdEQXlSRVl4Ykk5SE5CY1Y4MlZJWGphMU5yaVRzNXdT?=
 =?utf-8?B?WG94dnI5WDMwMlRQQTh2ZWduSjcrN3pFakxTUWpXQkJLUE5GS3VkSVRSVVpN?=
 =?utf-8?B?b09scnkyaEdHenFxamM1VHd4eVRJWXRUcUViTEM4cm91bEdXdHVjVzNQd3Q5?=
 =?utf-8?B?YlZHL0lxbDlXTDcrSWFKa3NiSktqb1Rhdk9TYlpZUlNsWGlDYXZVYmMxWWZI?=
 =?utf-8?B?ODZoZEZ2MDZpYzFkUXRkemREeElWRmVDcGFmVVcrUHFSYWRXSzU0ODgrbWdh?=
 =?utf-8?B?cFZVZVo0UDFWQytudFZ0NllvdmhXVmN1dk1tWnhWKzg3ZDdoUmhWdHdhdEZW?=
 =?utf-8?B?UWIvWXZZY0d2dXJ4TmZLVWFEcVZzWFlZYXc3NWxVcjkzeHppR0lEdHhKMy8x?=
 =?utf-8?B?OFpPRUk0UmNVaXBOSUU2cWNOSUU5K0xFcmp0ZjQwdW9TM21DOGRNQWUyNHVN?=
 =?utf-8?B?c0xwSmM4R1kyZlN3YWJtR3JwT2h4cjdCWW1OejgvTEMvQzFTenZTSTdpL0Vt?=
 =?utf-8?B?b0pxNWtOTHZrZnYxL2hzLzBwUzlDWlAyMDFlR1BlL3JoRUtGaHhCU0JtQ01n?=
 =?utf-8?B?THRYam1BamtOYzVNK0U1Qk5sUXFpMGQ3VUF3WndmL1pGaHkvcTJBbzRob295?=
 =?utf-8?B?Yk1Ba2pxVk9uMkRsSTVSNzhhdzgwLys0QkRkVjVvT1ZCL2JDdzRxYUJEZ3lS?=
 =?utf-8?B?QzdHSlM3SzNPMTNnM1EvU1JDaXd1bjRyUTU3cU8xdkU1bk13aTUzRDlWNjho?=
 =?utf-8?B?bkswd01tY0FSbENSZWx4MDFiNUtSTTRPQ3drdnlYdHhmSEFWWGZwVEdNQzZt?=
 =?utf-8?B?L3NtT0tkaGx1TDhFWk9hWUIvcVhSUy9neVNEd2VGZUtTUTk5UktzV2dpQUFZ?=
 =?utf-8?Q?0feGBBQvtasKqrX+fJMlJgBwBNYKD8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?N3dHQmoxODJxSEs1Q0sxbDVOVU9uR2o5ZTJrTGEvZXdzN2MwNkI5ZkRCNVFo?=
 =?utf-8?B?cENjU2krSTZmL3oyNVovZkU5aTVTM0RZS2VEUGYrVVppem1rSWdiZ0Jyd1Fr?=
 =?utf-8?B?blgyc2thZmZaM01rTUNuQ2FSSkZzNzI5a2pPcytyQ0FKNjVUU3RSejJITGkv?=
 =?utf-8?B?TlkyRDBrSEZJMnJ4RTZrMnBsOHJBbU1LNUQzSkpLbHpZSHhRSzE5NEw3dysx?=
 =?utf-8?B?eGF5c2lOdFR2QlM5TFFlYWlzbVhKaFZNb1ExUWlnVUpLc0FDdUtpWG5BbEw2?=
 =?utf-8?B?NlFLeGlMbVZrbVllYmRiYkNlU2ZCemxiZC9SQ21RTktYTnBORmhOWjMyajAw?=
 =?utf-8?B?V0VlMW1QOGkwUzdkVW5lWXYwVVRoSEFtdFZlQ2ZCVG1tby9lbkE2N1hqaU1T?=
 =?utf-8?B?WnM3eTd2VnJrdllpRU5QanM3TFZkNDVQZDd1VjdxMEtDVkIvR05BZHRGZXRM?=
 =?utf-8?B?WDVqOTVOaVN1bXBLUXpDK1JaMm5iWHJzd05BNWFjbXFUWGZYc2ZvNDBoYkgz?=
 =?utf-8?B?V3BHeXdLT1hKbVFFR3dXREIvdFRGL0dkR0pNS1lHVEp1MmcrcExBSWd4TnFM?=
 =?utf-8?B?WWUxWG91RURFTkluQkd2Zk9Cc3RXNjl2QjFrWU9LUmdOdm0xOEFaYmRnZjZ6?=
 =?utf-8?B?czhVZnVLUEVSbzlCTkdBbzF0V0RVSTZ5SWRPNWlXR3lzWmxBUjh6SE02dVNL?=
 =?utf-8?B?azFnQmFFWUIwaDAxaXI5ay9DN1d2eXBJNTJOd2RCZWw4aW83aVZneWZJaFdP?=
 =?utf-8?B?NEUvcmg1RTJsampIVnJNUmhPWkxIeWZpT0tjRlNHME5uZ1pNN3NaTU5yOUhB?=
 =?utf-8?B?K21XVkZWZVlRaEpWVytmTWJORUlTRUtrem5IaUJnU3Rjb29aR0NSbHdlMmxI?=
 =?utf-8?B?enhjcG5EQ3RrK1A0S1FpclNoazM2T2JWbGRzQUVsK1VMZ09ScjVjUyt2ancr?=
 =?utf-8?B?Ty9iSlcrV00zSzZmZFQ3cUxjS0xtdmkyNGo1Rnl6OXlRRVJncXhLZXNSRTd2?=
 =?utf-8?B?c1ZSYjRPT3ZYM1hUd3B6Zm9GRDl2YmpMOURweFhmdGxwZlJsMlRTOWpBeEZO?=
 =?utf-8?B?MnhnOXQyUVdqdUcyOEwzQm94anc4QU4wSkwwMndEMG9CbGdNdDZwbVo2WEtH?=
 =?utf-8?B?cjQwMlhCNUgvc09wVWowVzkvWTBoTVEvbytBN2t5cldhQ3dQSjRZbU5zQ20w?=
 =?utf-8?B?RjR0aFAxYnh6SnRhZDVQdkc3RFIvQXpzSGR3ME5Jb0w2LzlJMDJ4Vlo1QmdO?=
 =?utf-8?B?VVM1aDl6aDQxdmR0R08xcGMwckUzeXptQmtkTURnTHdvY0RsWGpSeEZCSjVC?=
 =?utf-8?B?dDZqalBiT3FNR2w1blVGajlOMnBWNHF3UVJ6L09VTk1YZjZFUEpoeVVKeHU2?=
 =?utf-8?B?MzJVWmlWdldaTnFXcjZDdk55bzVJeXVxNHRsREFxcUZRZzY5Ym01N1BpZFBU?=
 =?utf-8?B?R3N5Q0Q3MFZUWUxHWG1LZGQrSVVFS24yZnltNjA0Y09zcDFYcEFFMGZNWHd1?=
 =?utf-8?B?SUQzN0F5Nm1mRjQydDYyWUNaRm1qZk5ScFJkTXU5ZWpaN3htY0JTb3dINnRo?=
 =?utf-8?B?UlZQd0pneWRkdGJHYXlPNU9xTnB4Uit4WVJnMjZjQ3h2ZzYxNkVmRE9CYmFv?=
 =?utf-8?B?TTI4ekpLa3ZXWFpiL3B1b0VydXdRaWx1SlpwT0cxa2NCRmxNZFVkUEpUYnlC?=
 =?utf-8?B?WEU0YkE2TzZCU0Z6elorUWpudEc4WVlHZmV6enFHUmxtNTlWc1llTVVUcHRM?=
 =?utf-8?B?dkI3NDNyVGVPV3lHMjk2blpMOFFNaWpsNllaRTk0T3ZTZS81a1BBd1o1YjEz?=
 =?utf-8?B?a3ZlWGtLTVJVYkV0RTBSb1BnMnU3RlpmTHJWM3g2MElDZEltdGhSRDk0UzdG?=
 =?utf-8?B?YStocTVCQVg2VnFzb0FzeFF6Q2ZiREhxNmJiRmRNeGlLem50bkFHcEpjSVZF?=
 =?utf-8?B?WkVLejBaRUhZbC9GSXd4aE95MzEzWmNhc2tiNGZDYi9FQWRDcEFhUm5BMktH?=
 =?utf-8?B?Tjc3eWxTQlIvSThNc1pwM2kxcTNtOW1sRVB6S0ZnL3R6M3VOWVE1bWZNQ2Ur?=
 =?utf-8?B?QW1UL2Nwc0IwaGt0OGFMZm9OQTU5YWVuUmk1VEFnQk4vK01YUENNZHpRbXEz?=
 =?utf-8?Q?kPfxFNvTLFHOsA6lvIr19vyNq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad3ce9a-501d-4475-642b-08de32354b2c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:29:21.0514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uInmuM9Hpr/m7mX/TYir8eV2M7XBbWnfLqiG9mPIq4XsW1vFjDKQ8gQngJGd9pw0YWfjCJMd0SxoSFFrkkLCPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7451

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX9 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/nxp,imx9-csi-formatter.yaml     | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx9-csi-formatter.yaml b/Documentation/devicetree/bindings/media/nxp,imx9-csi-formatter.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c992a2a225519d3b7934f48cf1646d2cd7089319
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx9-csi-formatter.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx9-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX9 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description: |
+  The CSI pixel formatting module uses packet info, pixel and non-pixel
+  data from the CSI-2 host controller and reformat them to match Pixel
+  Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx9-csi-formatter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
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
+        description: MIPI CSI-2 RX IDI interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Pixel Link Interface
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    /*
+     * Power domain definitions from arch/arm64/boot/dts/freescale/imx95-power.h
+     */
+
+    #define IMX95_PD_CAMERA		3
+
+    formatter@20 {
+        compatible = "fsl,imx9-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        clock-names = "pixel";
+        power-domains = <&scmi_devpd IMX95_PD_CAMERA>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                formatter_in: endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                formatter_out: endpoint {
+                    remote-endpoint = <&isi_in_2>;
+                };
+            };
+        };
+    };

-- 
2.34.1


