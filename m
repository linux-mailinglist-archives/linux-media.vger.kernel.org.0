Return-Path: <linux-media+bounces-40680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1121B305FA
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F1E8622BFC
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C8E36999D;
	Thu, 21 Aug 2025 20:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="afOq7aHV"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013023.outbound.protection.outlook.com [40.107.162.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEFF369988;
	Thu, 21 Aug 2025 20:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807517; cv=fail; b=crSY5cE0BgK8BiY0+8Sf8LBZ4ZomNPzlr7YxEXvJRWeg9DUvHXrqTcDdWDls2xUvIiXi0f0HMRmZ14C11rNm5TM56FrIk3Jp5h3vONPEpVDaCqf+pgBGTNka2t/PrmuwCN8sVQ3QJOa3n2mP8/yfNS3B3jY+6WyWq+3FUH9Afkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807517; c=relaxed/simple;
	bh=5kqSnelcPgKhX2J6a/IjoI1ZCKvGsanz+HaLu0mjmpo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Sl8qANI6ZYSbaLen67jWT5RApxXaLNm5jr559OEowSDkvmW89Stlo3wUIfwOBi4RBJ2Cmba6GOmXrpZoAxir1vF/nWrvdChMzlQaquFveM8J5wX3LC7/EQ2bKGTdsOTx3KJuImOVE3vpxvOw+C4PYuloTtOVN84rBETZaS8loco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=afOq7aHV; arc=fail smtp.client-ip=40.107.162.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6la58ZwpTad9D2T88ogWaOjaFtx9m+Ox/bVVywxCTQoK3P7L01WNZufTFJFPCkHmrBwYrkl37rbAEn2THZLNr9xYyQ5VH1juWfPEo0hj0yGmpjwepQB0HXr09ikHk8tTC5VOS2OcWP009l4BdWJRRt7B67ga75eq74T0uXNO2+kBWiu4LKRm0m6lqYjdDTQUqiZfB+9RoLAgA3DH9lxw3oTVKQNxT7vLPdcQezPC12hRBPkBORpapf0q20TrBMte+hE75n7S6KlnBaI7jBSV4sVncPcS5NFBRnjsyqwccze1xck2CTJQ6LTAD5hUSMsWyM2uVcXvZE2Oxm59OwMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnyOTOJYBWH1O1vTqnrZOqOuXkDiPrTzXn1me+EHktg=;
 b=KjWW5Ah0aGbogm+wOJsTOdalTuMPpArJfiFA4pjZQmtTXleR6t4/yVUm8j+5kkqz3LemA95Q8sS68pBHc1gfJJSemvor6R/4WhPELvpgAmGrRdjG/aXikFMkBslQF4SYD/RxbDyJzgO652db03z9kZlnEUUWXqfbFSzELBcnUvTftBbIWXay5MlVnX7CPJXqpMwxua07oOnDTFY1YMWh61subaHbj3KfuLIatZAI4gPZ9Ci5zF8+6JCrW9Tt1EPdOyWV3cmMDYmWiZwtn9UxfZgdP/shJik0zbaFBPeh6KmzBs/XA6yvg8unxzcGUWOaazAET9b42xtB4Ci7/+PwQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnyOTOJYBWH1O1vTqnrZOqOuXkDiPrTzXn1me+EHktg=;
 b=afOq7aHVAzTQ+f37RXh5+QrO31M9zvcoCFZPtGSp+dE+XHPzwiEbtyGjKdGS6qWGoe6/tsyjcsxsqyqNeqEERvS0mGoeyduJKiRpu7zw4gmrz2DBiaWz5F1eahWAgAEmbzTRZUeLYdEfNQQRe+5HGwNvL2YxnlA8Gq9j0qA5qafFj5ICKCfqUsRrOCHcBEy+r1ZTkfB2gPo1f6CSndq5dTtz+sPPAWgXXlcPBU9sUaXmC0s3nnXy1l+npkM26aOauik/p2hS5+pllj1sDljO7TXltojtC9oZE8l7fyRq3xzTx4Rag9bTlsHfTxJ5+qVnWoMygsDXXG5FymBsMq1NJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:18:33 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:18:33 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:58 -0400
Subject: [PATCH v3 23/31] media: synopsys: csi2: Add register prefix to
 register field definitions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-23-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=3789;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=5kqSnelcPgKhX2J6a/IjoI1ZCKvGsanz+HaLu0mjmpo=;
 b=ZrtRDewZHHUuuIfK1hMw1JB1F/YRmFoo8jLLHzr/lo6YDA3xUlJ5aTxSNU2EcMb/c5SNXwUdH
 NDSjGxr7J7LDtofeITGfZSvV2v7KrVUPMSauYYMk5etXw8RhdDFLW75
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8ca6eb-9122-4478-847e-08dde0efe6be
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dDdpcXdGMUVQUmZCV0RwcTJ2cVNqd0hmUm8vdXdSVzFXdWtGcjIrVlF3YkNV?=
 =?utf-8?B?NTdhTVdmQWV4bWlqZmgyZ3JWSXlqRktDRmhZWHVKOUNpcktnalFOR05rVFdK?=
 =?utf-8?B?NDdNZmNZakkxRkhDWHZEODliY1Y4d01VMEdaZitLUzdNd0hiSGx0Q3NHODZx?=
 =?utf-8?B?Z0dKU2gzeXlDTFZqQW5RdDdBNVRhSzhWN3RlaVhEeUlKR0xleEZzOHFtRXhE?=
 =?utf-8?B?OU9CM0J4ZjZ5ZjhUcVVSc1d4dGo0N0UxZlNXK2NDNXZNYVZRS0JEOGV0Sitx?=
 =?utf-8?B?aGkydDBQUGl0L3F0cy9aQVloWFJGUmwvK29KWWZMejhWNEhscmNibVVyQVRV?=
 =?utf-8?B?emppcmpMRkdtOUtRc291MDYrZ1JqczRVemtibEtTb3N0U0ZrWXR2Y01mNGdO?=
 =?utf-8?B?djQxenZmTTRmN3lDeFVKUzRMc3FTV2ZlWnlzaUNiVFRFaUwyR1hGUW1lcUZT?=
 =?utf-8?B?cXBabU5Sby96L0p1cGRZaTh5VTBnSVA5VGZUaHdvY0pyamZNODViYjBFcHE5?=
 =?utf-8?B?TkhBRkcwR3VSK0l3dmROWTF0enBuVlM2SmFVUEtlb2ZwcjFxZUFlNDJiSVpl?=
 =?utf-8?B?M1pxbkhKbXRRK0RRYnZOZ3F3YmJRNktPWCtaRnJZdjhEU3dheFBVUXM0N3dn?=
 =?utf-8?B?VWllQzIwdlA2S2U3NGhjWUo5aytYbUp6V3puNFk4NVdSUDRrVnptV3IyMTdj?=
 =?utf-8?B?aXZQQVVZU3ArUlVVaWpKK1lvc1h0SGZzZytSMFlWREhhOHZjR05FSnp4UlRJ?=
 =?utf-8?B?TlBxeG5nVHY4M1dnTENMSFZubHVKelZrY2hCWGhxbXhvei9qVXVtYnBRcHJ6?=
 =?utf-8?B?UXhvZnIraHFtRi9PUUVHZG1jelJ5UmkyZkpkUExiYVQ2NE5CQzM2Zzl6YkJR?=
 =?utf-8?B?MnViM0VBYjczakVDazFMSVpiV2FoTm1Dajh1V2tXdWNwSVU2ckdXT0RiQVdH?=
 =?utf-8?B?S25NQTVvSUsvM1Fsa3NMaEpnVXdIR0VoYnNuTmRMY3duM09ta20zRUpkS0hk?=
 =?utf-8?B?UlZmbjBiTHJQVUdvaTBPRC92K090UGF5KzhGM1BmZG05REpPeWF4MXRDU2dU?=
 =?utf-8?B?TGZGR1pLdEF3ZXBRdHVSY1Q1T1YxbTZyREl3MmRSVUZRMTg0NnIzVklDSW9n?=
 =?utf-8?B?Nmk0SzNpL0VvWWpxRk5SbW5kS1dCeXhFRXJWOXpLeDhBNGVtTFZwdXlkbUJQ?=
 =?utf-8?B?T3l2TzYwbTAreXo3QXlHbm8vSURXT1pKZWVzOHpJWm1LcUE4alpnVm1lQjNP?=
 =?utf-8?B?QVRFbThpQnlnZWRvK1FTSFROV2NLdGc3OHFqQTdIaXRDN2t5Nlh6YkxZTFBr?=
 =?utf-8?B?bEViaE5rWjEzODdvUlBlOUM1bkZGWkVITmMzSWNpWEVmOXZ4elJlNmpIRXla?=
 =?utf-8?B?d3hoUFFmR2pObk5oNVJheVNkMStHSG9pVzRBVHZ3WSttTkRUaFNjUDFMREEz?=
 =?utf-8?B?TGJ4Wk5aT1VSaXRWWG5Mc09uSTFnUVlHMUxtQTZpOFJudXVYV2RGdThDY0w1?=
 =?utf-8?B?T3NYcDNrYkk1SEpSL25sMW5xdHFyT1hJVzFGU3ZpYUZFbDUwTG5qcXJrQU91?=
 =?utf-8?B?alUrWnlGbTkvU3o3RGV4RTZoSGdhOVdwc3hicVJwU2NabVhhOXc3WWhYMncv?=
 =?utf-8?B?M0VWS29JSjJqVDErUEVIMVNOZGFtMDBZcFNUbmVwRm9OU1RuOEc4dlJQc2Ry?=
 =?utf-8?B?b1VlNWZxbVVJZlJJQnpJVm5TR0JYalhtRm1kZEdJUFR6RGx1UDlKS3pDNXFK?=
 =?utf-8?B?b09OaGlNditDb2VxTWVIa2tJSXVsbWNqblNURGJkbUVGRXdvSElsVlBVN3hS?=
 =?utf-8?B?R3FZeURvQ3k3akorZmhhdS9aeGQrazZaQXBCTCtpUFhDQVNucDMvUEV4ek1y?=
 =?utf-8?B?LzZGMVY5clQwTTNVWHFHQlc4MG5uU0JNN0RjOVE1dkdTMHBPT0VwT2lPdmx6?=
 =?utf-8?B?aGI5VDVLSy9QU0FBWUlwQ2FDOExaZ2NhcCtSY0RZSU4xTkNGNjNuSU1RVlA2?=
 =?utf-8?Q?GQaYz3Oy5I0yDZhKTYRMvQ5RSZ8CCY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NlNpWENMSjBsZTh0dWt4WG1oSjZGVzdZZTZzNS9iaFh3NVliMlRRTmlWVGx6?=
 =?utf-8?B?ZTd3R1dYeTNyS3I5MG5FK1dVLzFOK3lEOTE1NkFWWStCTmxUZmlLVkVJR2hv?=
 =?utf-8?B?a1pLUURxN0FuV2FHb0x0dFI0M2pLUHl5dHYxWGd5Z0JyNHRrVUNwUG1yWHhl?=
 =?utf-8?B?cTljUUhUdUx5NGJBK2tEWTd5aUpsRDFHbXR6aGhBRFZrWk5VelVpN3I5aGgr?=
 =?utf-8?B?ZFZkUUxDZkJOQVVJa3lkK1RwN0RRVlNaSEVEa1dPZEc0c0wyajdmdVFSNG4x?=
 =?utf-8?B?SURva3pHN0Y2TlRTTmY2K1hwZUtXY1F6cEszTDR3S3prNXZOU3g5SFBWOGRT?=
 =?utf-8?B?aENSR2l3NFlzeS9tWndVQ1NyL0ZnS282WjRoZmppSmRLSHdVS2xDbVQ5SmJm?=
 =?utf-8?B?RnNKbkZZcVl2eWhRekpJZkJlQUFzZzFHNHE0YStZWHB0OWR4VmtGelhDS3JE?=
 =?utf-8?B?NSs0WFkxbEdPUWFUSGg0S2I0Z1Z2ODVFV3JEVmU3MmpJdDlhWkdmS3dOVHM0?=
 =?utf-8?B?OFVlbVhvaGduVEJJejZSMWpLemJBTHVIS0Vsc04vckJKNDJ3d2N4QlAxZUJT?=
 =?utf-8?B?NDlPOTgxeVdOMWJyaExTQnJzd1NYb0pPL0tHbW1QNjVGbWRRRTIxOTlSSjdu?=
 =?utf-8?B?dm1WWDVKNk5RL1dBYnE3Qmw3RHRpWGEyRUZVb2pqRTJXRmNsUGtSSnZha2Ri?=
 =?utf-8?B?eDdmcGtTQlNyK3FwOU5jbEEvWm9iRjVMRTdjek9JaCtmdE5nVXRvaFFaaHZa?=
 =?utf-8?B?V2k1VHVGMEtYdjBmeUxqU1ZCYkptZjBMVHRyRi9OVllCQVZ3NGNNWlphY2lW?=
 =?utf-8?B?REgxVzBidXk5K1Z5MWpaVTVBbTEzSjIzb3dZaEwzU3BUNWJUSHdsK0c0eHNm?=
 =?utf-8?B?emlwWEljaUNhNXJET1huSFVBOGRlOWRqaUVqOGwzS3M4TjlSL08xU0l6b0Fv?=
 =?utf-8?B?QWJvK3BZM3ZLT1Vqb2RWTXllS2xab1hRYnpwR0VpTVVQSnhPQ05kNXVZWTlp?=
 =?utf-8?B?VUJnWU9pUFNZd2xVQ3lRM0dFNXlIdG41VENGU1BtaThOcnNsTzlaSG9WMTBC?=
 =?utf-8?B?eVVoMm1Fb2JVNStzM2Jud1FidVZuV2I1eVlxcE9oRjN4YitaWWc3WXBIT2d0?=
 =?utf-8?B?STJnM08rQWlxSjdxV09Od0RWN2k4bzdMMDNJWW9xank2NzlnNHNNK01Gb1V1?=
 =?utf-8?B?L3BXdTJPVnF3MmdzeEtRSitRb3hMMGoxeWU4cmNqRWxkMWJjNXdlOU9UZ2dG?=
 =?utf-8?B?RUprbUZnVGR4T1B4dzdRbEhPUUVadFhwYXBUK3BtMGREZzZHUHZ6NGc4Rm9t?=
 =?utf-8?B?cmVsdWk2VlJqSWhVTW5INlJaNDhlbEovYTh0RmNpb1lCaGRnNlVWWnNyMVFt?=
 =?utf-8?B?TzlFczU1WFhJbmRKcDJ0VFAxekdHUW96TUExYXo4TFMyckljVWQwUi84R09K?=
 =?utf-8?B?WEFxbnhiOTVPUGdZSzJuRGFjYVRLdCtZVFFxNlRxRWdTQmRHTUNXWk1WZGll?=
 =?utf-8?B?R3pPcVppcVZhQyszVWpNSm02b1FkNCswQkNGTGtxS0psK0sxZXhwd0Urc2FC?=
 =?utf-8?B?cE52SXF0MEw4aFdYaTFPb1hZUUovRjVCWWQxL1gvU2xQN2VaWUM1ajVpbS9x?=
 =?utf-8?B?WkhIbVZheGFjdlhCN0VUL1IzUTZtTnZaSmRuYVZ0a0xYS1JoWmcvZGEvSS9S?=
 =?utf-8?B?L0ZLa2pyaDUyVFJwNHhBdlEzS0xwRGU4aEFhSUQvLzFneTJLdEU4TlRLUnFL?=
 =?utf-8?B?S0o5VjZSVUxYT0hQVlFsRGJYOEkzZWlZK2FIQmU4Z2RFWmV0aVFzQVNudzJZ?=
 =?utf-8?B?a21BbkF3bHVzSE5SblFaY1lnRVd1MVdrbldCeGczdkkvaXpxVlgvaU5LVEZt?=
 =?utf-8?B?S3hSMjBYWVlwWlhRcVM0OU03U2JwWGdsajlCOUtQWUVPaVQrVERlWStzSUFB?=
 =?utf-8?B?SU9qTmswejJwdlBkNXFvSytTblo1M2pRU0lXTW1BcGJ3dnZZVS91aEdjNFRr?=
 =?utf-8?B?MlZvZzBjR01TMnlvdGhrMEtzVnFhNXBOMm9yUytud0pOZXdMWm9NR3dLNVNB?=
 =?utf-8?B?Y0VIVFpHUEh6NEVsbzJuaitjOERYeHZxcEhNdFJ6NFFmaTk5WVg4MlBvdXF2?=
 =?utf-8?Q?RPIU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8ca6eb-9122-4478-847e-08dde0efe6be
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:18:33.0988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhOzDGj4knROWOaqocUlEB0MsCTm+WUCXtYQnIykjj6thuh9Ki6NeeKaT8frpyIoPICcCDJEm37wKpKFOwAPIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Add register prefix to register field definitions to improve readability.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 30 ++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 5435b58de55d21aa957fc635c950ba2ae25a8dcc..d6eb666646b916c2609a279f8badc1e8af557121 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -146,16 +146,16 @@ dw_csi2_reg_err((csi2), #__name))
 readl((csi2)->base + ((csi2)->regs->__name & ~DW_REG_EXIST)) : \
 dw_csi2_reg_err(csi2, #__name))
 
-#define PHY_STOPSTATEDATA_BIT	4
-#define PHY_STOPSTATEDATA(n)	BIT(PHY_STOPSTATEDATA_BIT + (n))
-#define PHY_RXCLKACTIVEHS	BIT(8)
-#define PHY_RXULPSCLKNOT	BIT(9)
-#define PHY_STOPSTATECLK	BIT(10)
+#define PHY_STATE_STOPSTATEDATA_BIT	4
+#define PHY_STATE_STOPSTATEDATA(n)	BIT(PHY_STATE_STOPSTATEDATA_BIT + (n))
+#define PHY_STATE_RXCLKACTIVEHS	BIT(8)
+#define PHY_STATE_RXULPSCLKNOT	BIT(9)
+#define PHY_STATE_STOPSTATECLK	BIT(10)
 
-#define PHY_TESTCLR		BIT(0)
-#define PHY_TESTCLK		BIT(1)
+#define DPHY_TEST_CTRL0_TEST_CLR		BIT(0)
+#define DPHY_TEST_CTRL0_TEST_CLKEN	BIT(1)
 
-#define PHY_TESTEN		BIT(16)
+#define DPHY_TEST_CTRL1_TEST_EN		BIT(16)
 
 #define sd_to_dev sd_to_dw_mipi_csi2_dev
 
@@ -235,20 +235,20 @@ static int dw_mipi_csi2_phy_write(struct dw_mipi_tstif *tstif,
 	struct dw_mipi_csi2_dev *csi2 = container_of(tstif, struct dw_mipi_csi2_dev, tstif);
 
 	/* Clear PHY test interface */
-	dw_writel(csi2, PHY_TESTCLR, phy_tst_ctrl0);
+	dw_writel(csi2, DPHY_TEST_CTRL0_TEST_CLR, phy_tst_ctrl0);
 	dw_writel(csi2, 0x0, phy_tst_ctrl1);
 	dw_writel(csi2, 0x0, phy_tst_ctrl0);
 
 	/* Raise test interface strobe signal */
-	dw_writel(csi2, PHY_TESTCLK, phy_tst_ctrl0);
+	dw_writel(csi2, DPHY_TEST_CTRL0_TEST_CLKEN, phy_tst_ctrl0);
 
 	/* Configure address write on falling edge and lower strobe signal */
-	dw_writel(csi2, PHY_TESTEN | test_code, phy_tst_ctrl1);
+	dw_writel(csi2, DPHY_TEST_CTRL1_TEST_EN | test_code, phy_tst_ctrl1);
 	dw_writel(csi2, 0x0, phy_tst_ctrl0);
 
 	/* Configure data write on rising edge and raise strobe signal */
 	dw_writel(csi2, test_data, phy_tst_ctrl1);
-	dw_writel(csi2, PHY_TESTCLK, phy_tst_ctrl0);
+	dw_writel(csi2, DPHY_TEST_CTRL0_TEST_CLKEN, phy_tst_ctrl0);
 
 	/* Clear strobe signal */
 	dw_writel(csi2, 0x0, phy_tst_ctrl0);
@@ -271,7 +271,7 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct dw_mipi_csi2_dev *csi2)
 	int ret;
 
 	/* wait for ULP on clock lane */
-	ret = read_poll_timeout(dw_readl, reg, !(reg & PHY_RXULPSCLKNOT),
+	ret = read_poll_timeout(dw_readl, reg, !(reg & PHY_STATE_RXULPSCLKNOT),
 				0, 500000, 0, csi2, phy_state);
 	if (ret) {
 		v4l2_err(&csi2->sd, "ULP timeout, phy_state = 0x%08x\n", reg);
@@ -294,7 +294,7 @@ static void csi2_dphy_wait_stopstate(struct dw_mipi_csi2_dev *csi2, unsigned int
 	u32 mask, reg;
 	int ret;
 
-	mask = PHY_STOPSTATECLK | (((1 << lanes) - 1) << PHY_STOPSTATEDATA_BIT);
+	mask = PHY_STATE_STOPSTATECLK | (((1 << lanes) - 1) << PHY_STATE_STOPSTATEDATA_BIT);
 
 	ret = read_poll_timeout(dw_readl, reg, (reg & mask) == mask, 0, 500000, 0, csi2, phy_state);
 	if (ret) {
@@ -309,7 +309,7 @@ static int csi2_dphy_wait_clock_lane(struct dw_mipi_csi2_dev *csi2)
 	u32 reg;
 	int ret;
 
-	ret = read_poll_timeout(dw_readl, reg, (reg & PHY_RXCLKACTIVEHS),
+	ret = read_poll_timeout(dw_readl, reg, (reg & PHY_STATE_RXCLKACTIVEHS),
 				0, 500000, 0, csi2, phy_state);
 	if (ret) {
 		v4l2_err(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",

-- 
2.34.1


