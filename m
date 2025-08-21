Return-Path: <linux-media+bounces-40669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B04E9B305D3
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8FF43BE244
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAD035AAD4;
	Thu, 21 Aug 2025 20:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mhRaQTdu"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79BB35AAB0;
	Thu, 21 Aug 2025 20:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807446; cv=fail; b=tLZ0zkve5p74Xb03oY75+HUIUuunD8Hhcr60wjbU8VnjXcQZZEMZRxY4iwij/w1w2CddiU9MHA7fC79KSnRx6VOFRLoeSH+ku3cf8VYxLbMP3uk+My+98KpaL7NSo4DzY6mxGnJdsAN73MOPCQ/Jh6zQhaSJawCvCWLXc4tHK5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807446; c=relaxed/simple;
	bh=8w79Wl0EyJKq5EFsgsdHKUY2U5V+ptzXonM7Hz8e5HM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=r1io9pa8pHqE1TAPHr8oi1qsyg9vFd009xi4DzTgiiaPxMdELSR+2DPQpM8vLTy56HXA8y+fhH8MXiMK49oDfBuI4ey+AbrVfFS+EFcwsFqP5C6+3rFjw5Rg7ujKghx8xTvuoXU2nhTzLtFbpQ1c0FHcIHDOvm7ZP3voc2Zq+I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mhRaQTdu; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk/rfwzUQWWA0bH3DCGDWXWwFG2NbUkZ6jtg3cTpA41V+Z0vwAbr+co3XNjxD2QlPYEawuD1gmnLMc291kw6Vj5Cfgn29Ze7Mlj/jvcyeKHOXy9poJIBPcw6oCnFQcXgvKuFS3eG0h1FLFe7PfJaAZcJI4GKDZ3XLpX5QK0maAutcfQcI3JhlUOAb68hfT0A/PWVEC1JifktDYN0MzsfEq7ZTImGpFJIjFJyQfvTV5NP+xlX2c0nspmjv+W7FLigpKtTX0M8V7GQz//xofACyX5AmECaTa4YjVFe0Y6xpSywTkuWvHaS2BK3RaPonSlt3vL2/fiOguicTMVUf7j3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTmTV1SQnjr8zHAw+ghWpz+KNrNzMjsQdl1eszcJT80=;
 b=OoEHVuNF2sT0utSYL0f/+rfrqNz4kted9CvnO6BZLdE8YlA3neFlYPPoKeMhxIYFa3Apg71IHMMw1jWAM7tTakAT9ESVteUW4067d2zLOkR/9GdrGzqiB/PYjRlFgLjtxuGbMFbLePeW/frn/4ACUue6p9y+XFtuo+EKVQ92DsnUMbVZ9SVeVWk57sf/g7NDNR3s90spoKpDsMZaZJCkoN9YJMfFdQ+6kNDIkVBZm7JuMTzr9jGlnje1LkJ6zFEwX408TjltWZpBJUJgskIUpRhvOKJe7ZA/PaCMkLI+5rimXS6dSVJrGZCCij2HXAvhvpPkx9eACex4HWBlOAMn/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTmTV1SQnjr8zHAw+ghWpz+KNrNzMjsQdl1eszcJT80=;
 b=mhRaQTduyMJP094uKDDQobnIbDGNqvol29H1vHDiSJ5p7CNFZSZu+LTsC88/as9Qcs4drUWSZAia9GdhNsmm54sIFqX4Tl+jrXcpCspG86RQpk79AM9944Z0Q9HPOlyVG9x4P91xK1qOzGbJkpiGF73fOcmyO/3RNmRcyE9Nf8+W5h/EO8ri2QC4zQNjRX7HJWTlbYs53ecOkzcljYp9D+DswHd9ImjLSw3lDJRA3fLiXZdPdu9qJcXLQo0Kl5iOSWy75G6i+BLr9JjNXd705cavtQy4q83lHAA6zN3XSfa8Vj2/0xnraxAEg5dmEixvtdlfReNnp3FohbPav1xW+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:17:23 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:17:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:47 -0400
Subject: [PATCH v3 12/31] media: staging: media: imx6-mipi-csi2: move sd
 imx6's specific initialization into imx6-sci2.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-12-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=4741;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=8w79Wl0EyJKq5EFsgsdHKUY2U5V+ptzXonM7Hz8e5HM=;
 b=LiMh2X5hYCVHsMeRYnixCNN8QC0gXA5jUlSwRes83vd5flEERZ8MWrnsENAf2GYR273Yhd+IM
 /Pn8cWj9PY6A4xGpAkOHyOWiothQAm9bY0NzR3saT/uQZ4xUhmCPh4x
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
X-MS-Office365-Filtering-Correlation-Id: 9ebc50fd-f88e-4b4f-e9b0-08dde0efbd3b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?R2YxZ3pBV3dIc2p4Q2xDRGZwNm5FTWhoUUNXdmpicEdZcm44aXJSSXRLU3d4?=
 =?utf-8?B?TmhnVnNTOU5SN1R3cmFtdVpWTnRENDBudUxMd3NUd3I0YkhRMzB0TFhnM1FZ?=
 =?utf-8?B?cUcxSGwyRUhGa3RiZTVCbUx0VkowZGgxU2R1WnJhamtsem5WRWoyU2VuanQ1?=
 =?utf-8?B?V3FUMXlxWVBRWDZJTXlwYXJzZTJoK2syaHdIVVpULzRDbUJqQjJ2bDZmRWZB?=
 =?utf-8?B?cXJ0K2RHWCt4RmNBeUV1Y0pHcFh1ajU5dis1eGZqenBiYnhwbWhTMFpMc3dj?=
 =?utf-8?B?anlEMnVvOFRyM3VLSkFhTXAzVmtTbFVQS3g3WDhHNUZoQ0xiY2hSQ0I4UnlR?=
 =?utf-8?B?TUZISXNJdGV0d25rTktzclRIb1BPeU9XaFczTnVKQVlSOHJxTzNxRTFIWkhn?=
 =?utf-8?B?SWhTSHRvMHBoY1kvZmErc29lTDg3VFRNMytsNHZ5WEdad2ttbVFZN0NNL29P?=
 =?utf-8?B?VGlnWmlKajdLYkU0TUgzbmc1dit3dVJXOXovNG1RaDM3eUZBdE92UC9lMDMx?=
 =?utf-8?B?bTVrYW9UTWZxdkJoNDRiVHR2aE9HdHhjYi9zdm5rS09rN2FpMVNLTjBLbUhE?=
 =?utf-8?B?OFI2WjNMVXJFYWl4ZHJud2JhYndVVmpNaFBKRVlOSmlpUER6VFB4ZGlQRjM0?=
 =?utf-8?B?TG92QloxMkJ3eVJpckdxSFh3TnA3bHZHRWFZWFRUaFk5ODhJd3lLN2FWNm5n?=
 =?utf-8?B?cUd3dTNaZDkySXV1eU03enlwK21DOTF0eCtTU1Q4R0MwdFptZnp2VE1YNVV5?=
 =?utf-8?B?NytXRGVzUjRkNkdqTHdkeGZJRDZZRkt6LytHL25tcENiZ0R5ZGM5Z2F6elJs?=
 =?utf-8?B?emd1U0lOMFdLNGFESmRKYlpqZnNkWFdrWXhnVjNTR3U1MDVJWlY0aGoyZWY2?=
 =?utf-8?B?ZTdVSzN6MnJBMk1UWUdweW45YUZLYnNuUkZXREh0REw1S3FxYm9uZ21aZGFa?=
 =?utf-8?B?cFhkdjl4Q3k5UjJQZXA3ckFmVmlsaUpJQkJNWWlkd2JzRmJZaTBXcnZ6aVEr?=
 =?utf-8?B?Ui9uQUtCaU93K0tLaTVMcXZYQjE0WFlaOG1SdWlGWlRDckNyQk84bU1vRkh6?=
 =?utf-8?B?VzFkM2RxWlo1MnlVandNbzdOdGRRTTYzZmU4OUxlNk1pOG5wM2VYZ0RQelB3?=
 =?utf-8?B?dG9nOVN5dHRsSGttYU8vc3BHRDhXNU1ZSW9RdWxyLzUzdzRYNGIrdjl4ejRH?=
 =?utf-8?B?U0dzY2p3Z0FVWDBjOEh0dXkxbXRPMTNPRzdBNEtid2NuMzU1cXJkSGhXL1Uw?=
 =?utf-8?B?OTVWWWlJZXA5bXgxbUYySkhLdFkrbTVyREFZU0psY1d2aGZMOXY1bWNEdmhz?=
 =?utf-8?B?ekpkbDdsWnAxNEplellPd3F5M1diMEpVY2R2UExpaG4yZTdqVE1BQWpOc2dY?=
 =?utf-8?B?Z2MxTVQ1ZFJ4QUxObGRYSjZDQlFIME9saVJmU0V2Uzh6YlpPYStsNWl1dkVi?=
 =?utf-8?B?ampSTkViVHJobW9uZ21IUUNjODloeFJndE1oYW9ENTBqRzJUK2VnUjErZUhx?=
 =?utf-8?B?ZUd0SGpxcVdZWmtrVWcvUUg2ZmRzdjc0ekxLVU0xcTh1cURTdWM1VHVLbU9j?=
 =?utf-8?B?Nnl5OXROdVVtV2pHcHprZEhYSVVRa3A1dkRoWHEvSTEvM2NhalU5VStQYThV?=
 =?utf-8?B?NkFJeTNwTlh1TTVWZmFkblZrMjBXTmYybW1XaEV1V1V5NFFqd3NJRUhldVBZ?=
 =?utf-8?B?cGFJODhTMXNlT2w4RVh5TWpqVXdQVFJnQ2dNQ2plQ25ZcUVUVVAySzN5Z3Vw?=
 =?utf-8?B?YVVqdlFQenpmSDNkK3d6c3NHNmpqdGZvNFRwcTVUbVFHNzgydTZkdGhUOHF2?=
 =?utf-8?B?TUtWMm9MUkNKQjZFcXhaRy9DRUtCSDVGempaYXBXb0E0dFNzSVdqc041VU5q?=
 =?utf-8?B?Mk5Cc3BZaGlaU0daNCtPVlIza2xFM21ROE9IOWMyVnk2dnczeWhJSjZHTjFD?=
 =?utf-8?B?aFl4RG9vZm1wUUhCUUkvcXRmU3hZdmxhNUkzd29HR3BYckpWM09pc3RWdlF2?=
 =?utf-8?Q?oTD4YtCcyHxuL8RFXqPotm/I8lrG1M=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SmFtRElUcU9uQXh3MC9RazRhMVFKZE13NVlkYmFpbloyVDVjMllXMnpadTR2?=
 =?utf-8?B?MGlhQjB2b2pWUk9LQURWL1VWY0pmNEw3em9ZV0NrVEp1Q0w2aTlweGIyREI5?=
 =?utf-8?B?TnVsMjhyby80MXFqOThwNDRDSWZQTjZVOURwUWMyM0pUTStkNjhCRnlkRHJm?=
 =?utf-8?B?T1JXdEJLQnJOeGxRdUE3ZjhiQXhzUFpKKzZRa2VWaVhsdFl0UXNLL0xJT1RL?=
 =?utf-8?B?RDlHZnM0eVc4L3daNDdoSlZzaG55Q1dJck9CMmlyZ3VjT3dRaDZqdXJzYWpt?=
 =?utf-8?B?Um9ITmNJbWliVkdCd0dYWEliYy9tWjB5RHZ3QnIyV0xXcnZrMDdLNnRUREhr?=
 =?utf-8?B?dWF2M1IwWTVKaFMwZVpob3hjUmtPcCtQL0I4UkFKbGpmaVc3b2VSbEVoSXFk?=
 =?utf-8?B?WlU5UktlTFVLR2dIMjcreGVvY1FwY05Fd1ZoM29QejU1UVB2RXJ4YWcwSjVz?=
 =?utf-8?B?RWx4K0dUbkh5NGxpdGtzZFRPV0N2QnFjdVZMdkkrSVNFNzNIMFdNSzNFS2dr?=
 =?utf-8?B?TkNIeDAvZHR3M1g5ZXdCOFBsM3NybE9UMVUrTEhOLzBxemVmM3ZBZG1ENksz?=
 =?utf-8?B?WlltczFNbmhpdU1EMjZ5QUZLQTI5aUVKODI2TUl1M0dZaFl3WnY4RlZyalNR?=
 =?utf-8?B?Nm9rcWVvS01FcnF4YS9seklKTWhmby9yUVYwVWkzZ1BPTHM2RHlNYWl2eUpN?=
 =?utf-8?B?cGNtOTFhcHpTT2JjMnFKaGhRWTJ5ektuRjhOcEhvWkJtZXlTbHZtbkpqbmJY?=
 =?utf-8?B?SEZFY0k2dFJLcDQrTncxOUNzRkE5SUU2c0hsRllWaHBuUEVLVzVWeDRJWDFX?=
 =?utf-8?B?ZWkvbGhjVHl3ay9CVVF3RVowc1VRZmhBc2RFZmZPM3ZIb2lzQkxZallPUzQ3?=
 =?utf-8?B?OVFQVk9EWlh6YUZPTTVPUjBPbXdIdlIreHJrSU9yTVNFNDFTODRIOU1CSEg5?=
 =?utf-8?B?MUZneU5NK0lzOVRzYVFRV3dsSjBIZFNMcCs1cEl0RlpGT0pMQXBPRlFoa2V0?=
 =?utf-8?B?alFvNE9TK0s2WUxKdlREUGVEbThUTTkvdGtRd2JibXlOaUt6MkQ3TzlBZFZ4?=
 =?utf-8?B?T25rcFNRQTd3dDl3VmZSNlJoNDZ5R0hhQXhpV1UzNDRwbGRqQzN3aTN1U3lZ?=
 =?utf-8?B?SHdVZFVBSzlSdVRWNVlQSzF6V1hlNzZwb05TamMzN3ZhTDZud0F2VE8xTE52?=
 =?utf-8?B?VkdhK21zQmtiUC9MZXhKaXdZV2lJUDUvWnprK2FCckxFZzBZazdRTDZ3Y1dX?=
 =?utf-8?B?OFlLdHpIRWJhR1V4U3pQUVJLcjNwN0hOdHlGUkdwZUp0akR5ZnlnRlFYMEJq?=
 =?utf-8?B?Mmt1UmVYYThBbkJDeEFFTkd6cEh4TkhTU1o2dzlFYVl4TmtzU25jSGhnZml1?=
 =?utf-8?B?VmY4ZzJTTkw1RlN6Nmt0Z1FkWlFQUjdONnh5cGlOZ2w1WUMvNkt6RzBBQWs4?=
 =?utf-8?B?bjk1RGwwdWVrNW5QWXY3QXY3c2RibHlEaGdBUjlhY0FIMk81YVpkNW0ycHNu?=
 =?utf-8?B?NlcyY1ltZ0szaGxUZ2c5OU82SmtBQm1Ea0NsMVU1VmVDZHhrbExKdkNvQ0Fw?=
 =?utf-8?B?NmVNN0pNNGN4L3I3NzlMc0Q2QzBIMVhYdUN3Uit6enJHaU5TOXQ4OHVZTTd0?=
 =?utf-8?B?MmJvcWgzTGtKaWR6VnpvRWRMblVyTUpYZGJnUUJ1VHgzWjBHTmxOVmFQeDk1?=
 =?utf-8?B?b3N3M1VndDdkQWFsR3pqYXk5MnQ4N1FhdkNtZkJpdFVLV1huLzZTMVBveE8z?=
 =?utf-8?B?dFZvWXZXbC9YaHQwWHpML1FLK2paRXR1NGRlQWdWZXFkTVhOWmoyNTJ1UllX?=
 =?utf-8?B?SDZkVHplSHMwajVwOEJ3M25JNlEyVVlRTGxFWkNWZnNzdW5CYi83ZlQzR1dU?=
 =?utf-8?B?V29MckJWZk1LUUZDWDhHY3Vyalc3eUNKZFBJa3NJaXdSZmZxTVRvcVVUb0N2?=
 =?utf-8?B?SnpzeEpZLzA3SVFIMVdwUkhxS3dZNTNYcHVVcVJjL0lMUkJKWWxsTjd1MXJu?=
 =?utf-8?B?Qis0cDR5MHcybG9ickVYWjBVM1VtNGNwRzJHdXlzNThScG8wbjIxQWN4TSsr?=
 =?utf-8?B?Qy8zZVZzYTh4bFFwVnNnWUNwOG5zTkY4Y1BHRkovQ1Bqa3ZPTWZFM3Y4cEYr?=
 =?utf-8?Q?ErYk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebc50fd-f88e-4b4f-e9b0-08dde0efbd3b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:17:23.4852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lwv3y9AQbB9M7WY9XD7P7vXnZysvS5Z3qL55XbFAwgjBd3G9s/RbTdNT9PtvcpnNYb6V3+LNTCKSP9jkXEjZjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

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
index b5911a37972be868e10c115ada1910fa04b2765c..ff06a739b957b305625d145c04c06999d0c13cae 100644
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


