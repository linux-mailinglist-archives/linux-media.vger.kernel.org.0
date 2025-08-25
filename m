Return-Path: <linux-media+bounces-40996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80156B33C3D
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E42A7AA4E7
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 10:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DBC2DBF5D;
	Mon, 25 Aug 2025 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QEv/9/zK"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013021.outbound.protection.outlook.com [52.101.83.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAE42D7DDE;
	Mon, 25 Aug 2025 10:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116641; cv=fail; b=Um/41uDQZjOmzIbYHqiuYD8fhkaDuF86p/wwqukQPOp1+X3ZmwK55jdvkrJ6zo00lMjT4i2Td0VMRaT2OioMSV0K5esMTfKrKAXCSz6NFrfcOunVyfnkwVrjHmEDsRARJkmm+h9+QChZukMGYSzlvzBu6OAlDsWvdnaCpmaAehg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116641; c=relaxed/simple;
	bh=Dp6PLtJ0T36bxg7x/6NFBi/UbHyXqHIfiOYm2cPgfYA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=d47B5ZTKyCb4AcRgXTKHr/RuisaNTVgsmaS9ZxyvCNk6RgK1RYRfduvkJzQCD4OMXIQag8yVpu9m4vf+E/x1EpnXHHOX/rDWjnpqGfgwglCHPs9HRzYXlnPyWidRh/M8O2pUJbOzcKRhX1yF5vtoWDn1bdcdDUZWAWigi1WY4eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QEv/9/zK; arc=fail smtp.client-ip=52.101.83.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chkMgtNpphI8K3wXh+3r3zgX7fodt/voU16Bs7qAd0ZMdfeZy3nM7Nuh7Ybsg5vHaxtrLfAVXOo7vY+wComscjwMhL0NiUU3780m8ePw+6Ca6G1nBBABi8A3wbpicul0WoRn/VqCjyyNFCo0xmMG5jjWbbfvLAFHNXLJa0iBsr0lRu4K7GQc3CHmxXDE1+rRkFUiy/caNxNxS8oK202yisheOukRumKI993xAfSLf+RSgkXk+vHmtvmNTwHjh5G82BDA86RR+epCHfdxUQfMZEUfB8GIYUxYUZD6/dC1Dt69U9OeRVJc+4XAdrlxVHJLBkVOI4Vm2QIx3+CHj+OWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liaPItUb331/0s6pEGu5oUltmJoOr35WN+GVteyWn2Y=;
 b=rqP64l3zy3+3wISuWcxoUx5eHLyglsM4ImJ+HvXDXyGBQR5ujD8ZqBQ/nsIRrsrSD2uLdwA+MyAWyk0QHqzmrtFG53E/PPnQqzBbP9l17oF+KIjhXNMM26pC7Q6H28cvOmWJ2o9bzt1FTzS2kArym45S/vNtj11V9xvVOcaCWgPrEu8LNKxtr8nKRuHv3Tms0SjHYvjd06I2CmhuuewKns2+dXhq+hWFde0lu4RxB6gg0NdLPuq5xT4A4260eeqC3z+5UmZbOcRmWn4AKDUedbkk7X+fCmofQPdzg7A5bktk77gw9OaGziw5HIae88Tx1qVAbBnWBlwSP2ky9Bhi9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liaPItUb331/0s6pEGu5oUltmJoOr35WN+GVteyWn2Y=;
 b=QEv/9/zKmyVjMmFX0igqnYnOsdHPTWTeCvNFf8QUj2YZa1gOFGbfFTgxR7FcQQzIlQK6wZOwNWq53PKvgIbHeSpXQN5Ry0MSOBERlWr95wjQUl5IDPXm+8bJkKsPra9kmucNoZUs24kFzHVX85NeivKcEjuau+Dh6wXVnLY7FLHkG9wVDY/xDFZ4vh8gy3ZMh1ZqTlr2fqXGc8lrF3iGrLC/dix8P4JbxZCvGLn5W1ywrVbRoyaH35pBpaNw8qSWYF1gIa9dH3RYbyfRtZIhRIBu3u0estEzUVJC87RDNboFAx2CRC7PJotELa4zdtAsrkVfFoAXpZ2z+1//m0ne7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10639.eurprd04.prod.outlook.com (2603:10a6:800:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Mon, 25 Aug
 2025 10:10:37 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Mon, 25 Aug 2025
 10:10:37 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Mon, 25 Aug 2025 18:10:10 +0800
Subject: [PATCH v3 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-csi2_imx8ulp-v3-1-35885aba62bc@nxp.com>
References: <20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com>
In-Reply-To: <20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756116629; l=2903;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Dp6PLtJ0T36bxg7x/6NFBi/UbHyXqHIfiOYm2cPgfYA=;
 b=AkN1VMfvtjh1QGNSbI2N+p8aFy8OoKUduNS/zxuogysEAjzLNd7Vayvy+P7XFK5e3izJljHVo
 9VuZfqYxCQgBPk9fpcHUVr1d+3ABxOdO6ZTThk+OBRRASa5f0eC1fOq
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0105.apcprd02.prod.outlook.com
 (2603:1096:4:92::21) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI0PR04MB10639:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f9bb51-b23b-4c7a-0ca5-08dde3bfa326
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MUswYzZmcFFTbTBDODVneW1GaENsck00cllOK01CSFpxT09HSDFRVGpUTGdF?=
 =?utf-8?B?YTMvL0JvS3JwSUlSZCtBYysyQzRXWUVxS25qcWpqaTlsYnBSL3Mzc21DWksx?=
 =?utf-8?B?am9hMnJCbDhnSmt5MW1aaFBlV2w3cm1xUFgrR1BJS1M0cmtyVFhlWXliSTZQ?=
 =?utf-8?B?K1BhY2t4YTNiOEZ5OHpvRDVZYmhtMDQ4TSs0OEdiRlEraFo5dWhnb3FjVkJB?=
 =?utf-8?B?dy9RcktRSi8wbW1FVnVxdm00ZldrR2dHWnoxaWZPc3lxV2tLVFoyZGJHdll0?=
 =?utf-8?B?b1dtVkdsbmpOSnhqM2p2S3ZxNWRkQ0pCN3BQWUY0TlhKTUJBL1NYSTZrR0lU?=
 =?utf-8?B?dXFLS3hwSVJnUzBjT3NCZmdqU1EwTWVzTHBoZk5GYWNXczkzd1pJQ0pFOUYr?=
 =?utf-8?B?NURnR2hSOTQ1alBUNG5NQWhVWXRqT3F1cGpPQlFxSHRlSGtmSDE4ZGlCSXov?=
 =?utf-8?B?N1ZQWk5WLzBKanFlZkxzUTd3V3I1ZkFrblpldzY2NU9pZVFTcTJwNy9JNDQ1?=
 =?utf-8?B?MEFqUE44ZVVheVFEZTMrZENFeHl2aEZTWkVnYkY3YWJ5QnBxY3FzTVFHOXF2?=
 =?utf-8?B?ckk0Ylh2NnZtZ0JiMnFtcU9la0M3K2pOWlh3WkhmaGFWSkJvVTNLL251MTJh?=
 =?utf-8?B?TldsTXBwbWJBM1VES0wyaUlBbXFwTGV6K1V6UlZxZmNySndLMzhNakdFRVkv?=
 =?utf-8?B?eURSU0l5T1FtWjEzYk5GMDg1TkVzVjFsbGVQQ2ptNFJ3TWllRUN0NlpPUWla?=
 =?utf-8?B?S3ZkRnhSTVBzVDRkTk15cmxFT0RuVGZsamFZNnU4S2lJYk4xVllLM1FjaFF2?=
 =?utf-8?B?dDlWUDM1L1JxUmdMQ2Y5ZWxQSG5oWldkbXRVVU9HZjh2OGd2ZmlVVWdYRUpr?=
 =?utf-8?B?bFRZaU1pWkRJRm5PV3lIVURSaDVSeEtQMkYvU0NTMXEyYjRDV3R3eUpIbWpN?=
 =?utf-8?B?aE5EUTdFbTF3TEZmU0pPR3JIYWd2bEFITGt0NXZrMTNDZDI3TTNtSWZKc1RO?=
 =?utf-8?B?VmJuTzg2cTg0ZmhqRGs2NVVseklJTWpGbFJxOTg4SmxEblZOTExyVjhlTkRp?=
 =?utf-8?B?SXdnZHNaN0ZFWHlSS1p5MHEzRkpXYWIvWm13WVdpUUVTYVBESVhZYWJlSXR1?=
 =?utf-8?B?N3NqenFJbzZJaEtVK0tzdmhyTCs4ODVDbG41d1RZVUswcWtqVjFMelZwVWdT?=
 =?utf-8?B?NzYzc0R2SFVPRlJ5WjY0eFJQTHEveFBHbEUzRTdQT1BFemRyRmRYOEY4aW52?=
 =?utf-8?B?ckpUbmZoOHpqeFM1VzF4SWVYcjVnQ0JvQ0hSNzhJcWU5RFN4cEVpUE9DSDdB?=
 =?utf-8?B?T09KTFdQOGk1MlV4T1hSUUJjWUJaRFVkRjlZb2RCbWpaUFB5RWltcjNIVWox?=
 =?utf-8?B?UHJ6a3doVTlDSkIxdjliZm5BbDJRWkF2ajRkby9lMUpCcHc0dTVYa24xSzlt?=
 =?utf-8?B?V3dXS3JVdGs4Rk9PWFNSQ0diU0tFdU5iWXFhbVBDNk9LNmJZR2RackMwMEdM?=
 =?utf-8?B?eEFIYTZiOTJ3T3paMmxZeVVFS05JSmJva0dzak8xbU4rNG1WR0Z4cnZCTmRZ?=
 =?utf-8?B?QkIwdGxaWk54VUY3QWViMHdSbGZJdVBIdlpHbWhuNVF2R1haZUlpM1c1UU1H?=
 =?utf-8?B?ZnM1MzFOOTRlUHpWRzdVQjZSQlZTVW1lSjRxcEJJcFBuKzduOGVtaDYxU3dH?=
 =?utf-8?B?b1NEOTdHZzRwRGZqd0xPMUFNUzZweXZ4RHYveTBJSlhrZTBHemxKME9uN2x6?=
 =?utf-8?B?clVoOE1RWGoyakJYYlV6NlhxZ2JIdURuWFpSeTVaQXFSUzNOSmxCRzFOQ3pp?=
 =?utf-8?B?Q09OdEJIb1k1dHJwTkhKdUdTYW1ZTnhMS203VngzZk4vbVp3QWVpL0NyODdK?=
 =?utf-8?B?VXFtSzkweEY3dUVjamEzZGdZNmFZaWtrTCtBK09FeFJPRHF6THJRWkgvVTVO?=
 =?utf-8?Q?FQog06lb9IaDZYL9Zs3optwXQoLoZ1Dj?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UGlZZUwvSTlNSEZobTJMNUVMczRmUnF0d3c3Z1cvNjgzc25VdkcwN2tUOHVh?=
 =?utf-8?B?NmpZZmUrMk8xY29wdFlxTkVQZXFLc0hpVW8rKzFUbXVmWlIvRmRjVXpyazU0?=
 =?utf-8?B?bi9QVzN4Z3Z1bXpjbjJEYkNUWlIvNVgzWXFpaDUxaHpvMHFJQlBTaTd1ektD?=
 =?utf-8?B?OTYvdUNuMXE5b3A4aHV1VUFCbUdJWUEvZkJIbHBacWR0NWN4TzM0QlJvZUJp?=
 =?utf-8?B?SGx0eTBDQXpLMlR1ZHh0T1hTWkI4WTJ2c1Q4UWp0bFBKZEFMbDFXMEtVQ2Nx?=
 =?utf-8?B?bnlVNjB5VVdrVHI4STlDejFsam5qNXE0MlBFZGFHZzM1amVDRWFmL0t4ZnlB?=
 =?utf-8?B?OGliV0J2eU1SR1JhNWRqSnBSdVFQVnY1THMvUHNqUmpQVjU1WWpPL3Y5ODdV?=
 =?utf-8?B?dWR6eVRibVBiUTF6bGNPMTdIdUlJQ1hNeDJhSHlyelUyZnBXQW1GSy9VTmM1?=
 =?utf-8?B?Y1NGdWd2TUtCSUJiQ29CMjNnUEVyYWxaTUQ4K3dpNmI5NUs2dXp0NHNWS2Z0?=
 =?utf-8?B?OVZjYVcwUVlUQmoyUW1sSCtZdUNBZWdFMGx4dVl3cS9mZnd6c0tjUjFGQ2tK?=
 =?utf-8?B?TEFNbDRIcUtCL29WNldLdGZFclkvTmd1VjRBK0xzL1pCQnJ0Vk5lcjF3VUxa?=
 =?utf-8?B?TzhXa3FnaUxwSEo1Tm16MEhKSXQrMGpEYkUzOFV0a2xrVkhrb0wzcWYrem0v?=
 =?utf-8?B?aG4walFwcXJycWhYSHhnd1dsQkRjS3NTMy9CYjRrSXVtZDJhSUhoNU5RWEE5?=
 =?utf-8?B?c1huMFRhbGhzZTdnU2lYWnRnV1JVcFc3QnNYckxyQXZnenEyeWx3Yk9kRXZq?=
 =?utf-8?B?K2lGdnJRTEN4MGtmWWwzMWpNdE1VVERvRUtjZmREZXd2dGpWRE5MZFJYbWFr?=
 =?utf-8?B?MGZoUGwxR0NqRWk1VlYzYng0TGJTVFRaWnY4RlFub2F4VjNuYWRsVmYrMjlL?=
 =?utf-8?B?MjNaZjM0ZWc0a1JONWlxdlNYcWJwcjhmV0YxZlJ0WXZ0WXpPSlRwYU9EditS?=
 =?utf-8?B?MEJuTW1MK0p2M3VxSmRBOUJSUSs5M21zcm9Pa0dOVTlFbmtWNjdzT2pQOGRa?=
 =?utf-8?B?TUIrRnBtYVFidWlXbWNWRmhBM2VjckF1YTJDVEh3U05mbktXM0dSWFZsT1g1?=
 =?utf-8?B?dmNsVnU1ZEMvNGwzeWpOTWJvVExvc25OOVVPS2pOaU9oOVBYKytlN0U2T1Rj?=
 =?utf-8?B?UEgxMUJEcjFjU1NEZTJ0ODc1eVh4aDNkT2MxdE1zUFJKdE1qbTFMTW13bmoz?=
 =?utf-8?B?aWcvM3c5TThwVXZnejBtb0RnUHhXY0xDWjByeElxemI1Tzl6VmpOU3dneWJI?=
 =?utf-8?B?elpvUjNpbGxtT0JITU4ySEtYckVSVHlKKzJvWXhXZHRFOXhYVStObWgwQi9W?=
 =?utf-8?B?Z00vRmwvVDd6VXdlbGNieCs0Ni9KSlkyRmk1OWlUcFZuU290cXpydUNwZVFy?=
 =?utf-8?B?NE1tS2NiU1JtV3FBR1NvakxKSFVtVjNZYzBCeVowZkNxUUsvZ0JpRnhQTlh0?=
 =?utf-8?B?RUhiSXYzZzNXTUl2K29PUktMTEJGNVRQeEw4S2xQTy9qZnRtbVd5TmwyNXdD?=
 =?utf-8?B?NW1PYlJhOXMzcG1KRFRlekNVd2tqeGlJTXhDVVExN2lwdDNLVnhPSHFhYjhj?=
 =?utf-8?B?L0lySytlamRzUVM4RW1QV1h1UDJ5ejNSYTlWZ29obkxJRTNxMkRCOXNFY3Rr?=
 =?utf-8?B?Ty9SanUwR1NFY2xVVEh6b0wvZGVsUUJmNHBTUVRyQko3WnIvcjc1UEp2WUxI?=
 =?utf-8?B?RU55QWRKU0ZqUE91MWM4V1AyZVRvNFYzelhyOUhDelR2ZTZ1dWNxWlJ1d3Nu?=
 =?utf-8?B?MEtiL0lNSTYzQnV6azhvc1J1OVBOanNZRkJBY1hqcVpyWnVtT0dOZHQ3Y08y?=
 =?utf-8?B?eUZEcTRFaEJodjVKS01pTWdBNWl0dzM3QVFhNW8zSHJuZWo2bjdzQWVjUGFH?=
 =?utf-8?B?R054SEFCN0dLZEdTdmdYS0NQdEVGUzlFajZQS3hIbSs4UmZhOUo0SjZLWDl4?=
 =?utf-8?B?RmNjb2x0Ry9oSTJsRzlJMy9ZV0haZEhLRlZFTnZPaURrWjRKdUNhb3NMUVRX?=
 =?utf-8?B?blVyT05GU2pUM3YvYnN4Q2RQenVyUmZkejMvUHdrckgyeE1ZMnRLS1AzQTlp?=
 =?utf-8?Q?0BIMYN2Gb71A5tV2aPeAhDAX7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f9bb51-b23b-4c7a-0ca5-08dde3bfa326
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 10:10:37.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbi8XSDWSA5GJs9IoF6ASw/3WJDIPAk+akLBBu3bG87e8W2kwCQVzr/oXy5ib99UhuIsjgiodipEHopUA/RwHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10639

The CSI-2 receiver in the i.MX8ULP is almost identical to the version
present in the i.MX8QXP/QM. They both include an optional Control and
Status Register (CSR) interface. The csr clock is the input clock for
its APB interface. For i.MXQXP/QM, the clock is always on when system
power up. For i.MX8ULP, the clock needs to be controlled by consumer.
For i.MX8MQ, it doesn't include CSR module. So add a device-specific
compatible string for i.MX8ULP to handle the difference.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 40 ++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 3389bab266a9adbda313c8ad795b998641df12f3..0bdd419a7ea12651bd514b6570fe208a99f0d6d9 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -21,7 +21,9 @@ properties:
           - fsl,imx8mq-mipi-csi2
           - fsl,imx8qxp-mipi-csi2
       - items:
-          - const: fsl,imx8qm-mipi-csi2
+          - enum:
+              - fsl,imx8qm-mipi-csi2
+              - fsl,imx8ulp-mipi-csi2
           - const: fsl,imx8qxp-mipi-csi2
 
   reg:
@@ -39,12 +41,16 @@ properties:
                      clock that the RX DPHY receives.
       - description: ui is the pixel clock (phy_ref up to 333Mhz).
                      See the reference manual for details.
+      - description: csr is the APB pclk for CSR APB interface.
+    minItems: 3
 
   clock-names:
     items:
       - const: core
       - const: esc
       - const: ui
+      - const: csr
+    minItems: 3
 
   power-domains:
     maxItems: 1
@@ -125,19 +131,49 @@ required:
   - ports
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-mipi-csi2
+    then:
+      properties:
+        reg:
+          minItems: 2
+        resets:
+          minItems: 2
+          maxItems: 2
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+
   - if:
       properties:
         compatible:
           contains:
             enum:
               - fsl,imx8qxp-mipi-csi2
+              - fsl,imx8qm-mipi-csi2
+          not:
+            contains:
+              enum:
+                - fsl,imx8ulp-mipi-csi2
     then:
       properties:
         reg:
           minItems: 2
         resets:
           maxItems: 1
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8mq-mipi-csi2
+    then:
       properties:
         reg:
           maxItems: 1

-- 
2.34.1


