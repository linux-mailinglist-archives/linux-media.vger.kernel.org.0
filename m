Return-Path: <linux-media+bounces-25694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C71C6A29743
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A7443A8ED4
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13801201019;
	Wed,  5 Feb 2025 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Nqp3Am+t"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A871FCD07;
	Wed,  5 Feb 2025 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775985; cv=fail; b=LqdKwboBIBb6BbzXCZoFyQeOT1Y/qAcBaFKP8IT0dJYHFLiAWxm3ixmZhd8ClZbxWP7rFBeczZ9P6UHakQEpidD1Th4mwjsPNbsKuIj/IHVFk3RZciTU9hUZIHwrn+nsSDXxIcEcn24fCqhaECKhjSV5exyfDrHgSAfg47bRGzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775985; c=relaxed/simple;
	bh=XuRbiz9HeB6kBMiwJf843iejlo92W/EqAuzV4Slf61U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=acy5D/tobmbg5Mc9LwHO+wDeUB42OK8HmUtp7bmhxHsksACsFCElhlZeNA3QYczB3WvHSVepXQFHGiTdJWjpPgwNmVgztqyeJhmaOzaERXGjuvcVLiUH/4CAa8BPfxtJm0qv1fnLB7bSPVjQrbQbupYF9+FCpS0IOnhFH5excJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Nqp3Am+t; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpEinIjaG+58qzpFEI5O+/jQ6L9/n0e5bBp4+08CVwPo/2RwUsPWFwhKu0P+9umbrfMhJvAvaentK7Il2z5oJjIgO6Or6CJC+9+iCSUBwXByQx5IrvUEtTTPvsdLojkGHp0Fvr833FVxuA0S7fOOfzQIWwozE/lcImAgXUcghR3IXhpTKniyaW5tfHv/16L4H0IyETc9zwzl/JDPTc38Lrze3lZjBZiCg+D4GC4xTXryzDRntL9yplWdT6wSzusSwMY/Kqsg0mZimz/0bJ1ZWa2oaqsoOHs5XR7odHCgZCqGcYglzNEj1a+y1bj3inZcO89f4UxHNx93hHdOdmSLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLYQpgbqRrB2sU9ONr/bcsAzXEpl/mMDEJoJ9w1Acb0=;
 b=VjLw7oeYDdb9a4qt32ZIjsTetbu0NCCuLf6jlBYGtiFmu3ze7Au/em8x2ifPGoez8g+P5fR3tgDbhDvRlCxxGwy7TEfdvoe0HwkYT/3pB5gLebIfqkr+Tqq51vhO9b53lpmJAGrGLmbmy5vRjr6pUPhyS7OW8OCp5Mso4jmiifJLxhKaV2NbL1QG+vdNZzxTP9IDSbODKOIFvwH5i0GOYQVoVsLn2VwsR2RGdHp34eEfd66zCunLAurMke1Xy6nI5+y3YIDufbQcTYQxAY8D2N54HRtFF6eTkHYcjXQpLQss6i7Y1bcyP+MVOYhBBD+hPujYA05wbpHBeR1ewRAl0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLYQpgbqRrB2sU9ONr/bcsAzXEpl/mMDEJoJ9w1Acb0=;
 b=Nqp3Am+tDg/uIFuWncyMVjPR3GjyKO3V5EFrDwiAlMc825wT+wcqHvKBb67IZV0xq40I+/FrW8fU4K/4uDaJAWrGFwac5MLzhE04H1ie9LuEjW68L9sawfDIpN8uDEkPfEtIPNV3lztKBDW25+oLRL7Xx8optu3C9839E2AWsDnRDStwEug1pxk6bJ/2+/0VGBGBgOoFGXg0q9EJDjkoBh04xOnyz4UAvrR51sRiVyJ3sf1D76738QJJ675EsxyKgAh/VdTvA0bVifhz5qNUngX31rvJX1vCkBdi8Fen4x/VR8BDK5GlO0mYlhFrphRhyWD6Ej9sqdzrprIOOxBINA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 17:19:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:19:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:18 -0500
Subject: [PATCH v2 09/14] media: imx8mq-mipi-csi2: Add imx8mq_plat_data for
 different compatible strings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-9-731a3edf2744@nxp.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
In-Reply-To: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=4273;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=+QBD0Mt4LREW8UDrP3CG8eTRiWihbUIT7EiPw6z+Q54=;
 b=SEhUMw0+mB9IJkxphEUK701tz+vHxLJIZbn87hSm6G4BbGM5KeQPzbD/Pzj/OoA6FdXFT7xRU
 FBAPz4/QLCQBKGEmazxbzqzyHK14WGcIdMcKGWZiuU1gccyBRQ6EFaE
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10546:EE_
X-MS-Office365-Filtering-Correlation-Id: d06ed570-0c24-4591-ed8a-08dd460945a4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TEg0NHJ3MVhiMUE4alZkL2MzcVVXam81TTcySjdXb1ppM1ZzZWhqQXNsWmh6?=
 =?utf-8?B?U012bEprNjR5RjFPQnVUbXB4WTNkMGVhNEhvK1doeFlNSUtCYkl6OGlMeVRj?=
 =?utf-8?B?Qzc3eHhJWThkMHFBM2sreWtEcGxpMVVKMmFEZHRpdG9tWThlOUkxaEtzNWRm?=
 =?utf-8?B?dVdtcEp0WVpLYW1oWGlZNkowODhjRkJrMStCay90dGhicEJuYVhGVWpTTjVl?=
 =?utf-8?B?NVd4K2dWWWxlb0lBWWgva29NWGgzNjBZbDJFbHBDQVpNNkZieDR4VkI5MzRC?=
 =?utf-8?B?UWd6THRoVzRMSUZGeGlmTW1DMTNObUJLMW91cnFuODlEdGFKdmJMR013NndY?=
 =?utf-8?B?YVFTK1VlRE9TTDc0REV2OXpwTCsxaUZ6Smh5a3Rrcnp0SWRJblJBMUM4Y0hK?=
 =?utf-8?B?dHBXa0NUejNWTy9SVzdodzJ0Z1NZSVBZbmRDOFozbDMzZko3aEZKN29jUVdj?=
 =?utf-8?B?K2hFSHorZXJicWZxS01SMjdrMjc0bHJONzUxREwwWDVUNWFsQUVPZ25Udkh3?=
 =?utf-8?B?YlQ2dWFaLytjcXdUT2VGWTgvK3BHdnlxRmtyU3gwaTgyb0E0T1QwTW5uc2VV?=
 =?utf-8?B?TENNaUJyckFMc3RFVG1KTWRYbjJ0YjZnR3NDZHIydWtESWg2UG93bUVOakxS?=
 =?utf-8?B?a0UrZC9JV0lBSE5OdFVRM3QzaXJDVG5WdjFJTE1RalpFN1FjSjAyQ1Z5RFlF?=
 =?utf-8?B?V2IxaTBrMWEyLzlUdE42R0FLOURuRGdtcjFnNE9BTVVpNjIvcmx2QS9VOXpT?=
 =?utf-8?B?Qm5nSVVueWZLbGtwNHU1S3NRaExEVElVL3EyZUc0cGlEUHJoNEE4dit6QWdI?=
 =?utf-8?B?cjRwTUtYTGlzMG93VDVqQno0VE1xRnVOT1kzL3owZEFONlljYVY3VVJCZGpa?=
 =?utf-8?B?TkdtaHEvQldIbmk0OUtxRmk5N1NRR09SaEJYZ0tyendNOTViMThIeDhkMmw0?=
 =?utf-8?B?N1FSZktXUzVYVVR2OHVlb2dyck0vQll6TDFES2ZVdVZTS09DVkNOcm1tK3pQ?=
 =?utf-8?B?QUl2dGVaK1JYb1lZVmNmSGN3b0J4K1RRU1BMK3ErQUtHZExiSnczSi9RM3Jz?=
 =?utf-8?B?L3lzdnZqdUY2V1g2MVZoNUs4YU9SL0MyL1pvK1NDT0xHSFpMSXlGeE9lUWtY?=
 =?utf-8?B?dGw1a3ZRRVFXbjF1ZzB5dWtzL3lPWlZKWWZ6dllPclV5dkxPdjNYdEdsUGFq?=
 =?utf-8?B?U3ZnSFAyL2dmM0dqLzdlY0xJL3hLRytZOS83Vkp3NTF0ODZxRk5zcnlBc3Q3?=
 =?utf-8?B?bkRqei9hRWVQNzkraUZGWFFzRzlhRE9BRzFTSVdmc1hNZkt2VXBNcGxITFZT?=
 =?utf-8?B?VitxN29tcHNTRlBCRDUxK21WcFlkbXNwVGFZaElHU1gyL0pMVG1iKzkxNkVI?=
 =?utf-8?B?NUdhQ1FSZytUZ0Q0SUgrV1luN2FjeldmNkNyN0tCSmE4M1JsM090bno5c3ZW?=
 =?utf-8?B?d2p6LzJpQ3BDOU54ZUhtaFdpemNhKzZRdzUyQzVyMHNaaGVSQ3dBcGc3cFoy?=
 =?utf-8?B?aTVlWkRwalZXK1JBUndCSktYVlFmRHpJMVUzRWZjWlJobVg0am41Ui8rRXQx?=
 =?utf-8?B?VytidDdWVW50YzgvanR4Y2QwemhTT1F3dG40NnhmTWNlVXBlMmpleGJSVE5y?=
 =?utf-8?B?eW8zQk9KUVFjWUFEbzVwTFBxWExBSU5rUExKcG82TlFzNW5nalpWa3N6UGtw?=
 =?utf-8?B?TTk1Y3FLdXJobHBhS3ZWdDRmR1pKYlhlZDI4M0owK3VhdzE3NFVaWWh6c2lF?=
 =?utf-8?B?dlQwL04wMUZMM2pvZ2FITEhRVXp6ejdLRmRZak12b2h2ZkpKS3VtOU5FdWFY?=
 =?utf-8?B?bU1mUlh3Y1pQUTdxbWtKZ0F4eHRzU3ZzVnQxNmFKQUdjNVBadTRTWXBHNHdk?=
 =?utf-8?B?YXN1TUkwWkNJMDNSWkNqOFJFOHE5RGJTQy9lbTh0Z2lVNXhqZnprOW5ab3FW?=
 =?utf-8?B?VEF4NWdJbFcra1FNSzEwZ3FWOVVuTW5qRFRSS2xVS2ExK3FVaDdsVFE4MFVs?=
 =?utf-8?B?S2JBZHoxcDNRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RWZrdjBiMFQwVWNDcGY3aTBsQzVLbVQxVWVzdHFvVk1uUGxCWmRBM0FTSWkr?=
 =?utf-8?B?UTZEUlVMdENIdnU3VXhhTHNaYW8ybjJhMjR4Nkx3YWFmSThhV2VZZCtvbE5Z?=
 =?utf-8?B?VjdtNkM5MUZ4WHVYdXZTQ0ZWd1R2K0RicEg2ZUh1ZzFpb25Fazg2SnZWQmsy?=
 =?utf-8?B?WDljQnlZbWRFOXc5RWNYd0N2T0IvcDNrbVl5Q0dpL0N2S2RJeTNOSnN0Qkl2?=
 =?utf-8?B?N1dUSGJLRlBsZU9KUGZDYXJPZW9MdytjYnlCeWwwMEQ1dDBrYXM0S3JLT010?=
 =?utf-8?B?ODJQZk5Md01VekEyY1BiRUx4WG0yWmFTWGQxaWNvWWNGaEJ3K3JwdzN4Unky?=
 =?utf-8?B?bmExQy9aN1VVYytGbzRJSm9EZExxK1F2MUxoaGhZNElOTytwVUNFVnFYMUFt?=
 =?utf-8?B?eW5Kb1J5SnNwbDlId0ZVeU5FdkRsU0g2WmZrMlYrdnYvT0I0RC9yYW1qalBT?=
 =?utf-8?B?cit6U1RkT1N1U3czc1FHTnBzVytNQUZLdzhLZUY4L1MxTlRXeHdpTnVYN0oz?=
 =?utf-8?B?Uzh5WnNaQVd1cmV6UVFuTG1LclVKa0p5WDBLVGpONTd5QmdoWnV6TDM0Q1V0?=
 =?utf-8?B?MG12K1UwaHVTTDg5Q1VGZDZzQjYyYXdCSnBJTGY3RmZtNUJvOWM3dUdEaUVB?=
 =?utf-8?B?Rmw5eE55NW9nU1FPNlNxZjFCT3NtNnVhM3EvemlicER6TE9aMGhVR2NUYWlK?=
 =?utf-8?B?ZStvelFsYlJ4THd5THpkZ3MvQ1QyMDl3NWZQcEF6eVpNZTlCNS9sRVNyNHAx?=
 =?utf-8?B?TngwMGlXd3BmWTBHaTd1Wk9VUEUwSE1mSmM2M09HOG1PRFpPclV1MjdCSTUx?=
 =?utf-8?B?NmVLdmxjeWNFc0RUNkRFZFEySmNvVkNrVStScmxUWkZ3TThoQ24zVmNCaXIz?=
 =?utf-8?B?ZmRPZlVJWURqZElNRWJyRGZBYkVFNFdZNWZLdWx3VnJCOEdxS0MyLzlwc0V1?=
 =?utf-8?B?UlBmeUlodE5MMUg2U2hHdnIzcUhSVnVCSFc1djJldDZ5L1JkTUlPTXZ4T0lU?=
 =?utf-8?B?NTdWVHpZN3NERzBDQU5qczljTGJ6SFNZSGVVT2pVQXVTS2hDL3BjQnZkTEZv?=
 =?utf-8?B?aXM2ZDVkaGFWbml0ajU4OVo2dm51YmVVS2dnQUNYNWpsa3pYOEJwM2pLWmNK?=
 =?utf-8?B?WmtmRzR2Qk1scFp6Q2JMSEtvdGorTU56YWVnaVpaaWJmZ0FDZGduR1ZpakNw?=
 =?utf-8?B?SmM0eGhqcWJkS2VldWFKRjhFSmtscUlRem1FTHlkU0FRazF5SG0zWTBwREFq?=
 =?utf-8?B?a1g2cEsyYi9IK2o2WVB4aXMxKzBUZEx2VnYyRTBTcjA2Z3BZdzl6TmwyOEh3?=
 =?utf-8?B?RUpJQUNoNjRYM1c0TXV6TmZLWVRKR056ZEVWRnByM1BvYkFzQmM1ZVhqc0l3?=
 =?utf-8?B?a3JQdWFVSDR3NzJyV2lRcFJHMkZuWXMxNVhSbmdsQ0QrOC93MnQ0SmdkMG0v?=
 =?utf-8?B?MWhlTnhTVlZ0Mjl4OTZkMmh6RmErR2JoRUVqMXNUWHlqMHVHL0xwOFJVY1FT?=
 =?utf-8?B?ZHV3bUhpb28rZXJsV1BjeXA5cEU1N3B3cU1hVFRqRU1MbGM5M0E2T0dTQjJQ?=
 =?utf-8?B?MHdnK3BZMXBWNTg5UnlscUFIdnI1aFNJZ3duYjJkNzh0eDNDaG9EbVpHaUV5?=
 =?utf-8?B?cWV1YkpTYzkzSmMxVm5INGNTNTFSMUF3bHcwOWxxa0xPSnA4SEluNE1GSHNW?=
 =?utf-8?B?RHBCTHlOQzE2dTBXclNWRDhaM0xyRnhwL2paMmVCdlNFdjBTaE82VUQ2WXZC?=
 =?utf-8?B?MElQMjhMNXhaTTViY2ptTjVBMENZTExrWXhSenhoZlZ5OGlRNytlSTJuTk9W?=
 =?utf-8?B?aDZvSk12eWVuWXY3Z2tZcTZTVkhqQm41MkpDYWR5Y05acXlWUFZqTlVPdTJa?=
 =?utf-8?B?TWdZRGRhZlloSzcwUHhlVjRLWDFKVEhuSHVzSFdpS3Z4WFk5REg0WjQzQkc3?=
 =?utf-8?B?NlBCN3FQYVdmMHgrUW5uR1pQcFl4aWIzOFlKS3Bmc3ZTeGRRdnEzcDFod3pK?=
 =?utf-8?B?WlJmMXFUdnRGN1lweURxQS90dkw2bmVJS0dabzhPMWVvUFRDcUZSK0xzMUtT?=
 =?utf-8?B?QXNWc3dYVTFhT0tPTllrN0FMNnBBWlVObG1WbFMzMjVFK0ZuMEIwUkd4Tm1R?=
 =?utf-8?Q?4PLaR92E+J5AaHrotYqclPyKv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d06ed570-0c24-4591-ed8a-08dd460945a4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:19:39.4754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pw0IDrQyfIkPguoP3hZXLZkzCCPFr34frn5F5IIh5p2QLltDHDIgs5yIFJmu3DFuUMzzWJzNe/HAnWVYnaXKIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Introduce `imx8mq_plat_data` along with enable/disable callback operations
to facilitate support for new chips. No functional changes.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- remove internal review tags
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 60 ++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 1f2657cf6e824..b5eae56d92f49 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -62,6 +62,8 @@
 #define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL	0x188
 #define CSI2RX_CFG_DISABLE_PAYLOAD_1		0x130
 
+struct csi_state;
+
 enum {
 	ST_POWERED	= 1,
 	ST_STREAMING	= 2,
@@ -83,11 +85,11 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
 
 #define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
 
-#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
-#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
-#define	GPR_CSI2_1_HSEL			BIT(10)
-#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
-#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3f) << 2)
+struct imx8mq_plat_data {
+	const char *name;
+	int (*enable)(struct csi_state *state, u32 hs_settle);
+	void (*disable)(struct csi_state *state);
+};
 
 /*
  * The send level configures the number of entries that must accumulate in
@@ -106,6 +108,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
 
 struct csi_state {
 	struct device *dev;
+	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
 	struct clk_bulk_data clks[CSI2_NUM_CLKS];
 	struct reset_control *rst;
@@ -137,6 +140,35 @@ struct csi2_pix_format {
 	u8 width;
 };
 
+/* -----------------------------------------------------------------------------
+ * i.MX8MQ GPR
+ */
+
+#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
+#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
+#define	GPR_CSI2_1_HSEL			BIT(10)
+#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
+#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3f) << 2)
+
+static int imx8mq_gpr_enable(struct csi_state *state, u32 hs_settle)
+{
+	regmap_update_bits(state->phy_gpr,
+			   state->phy_gpr_reg,
+			   0x3fff,
+			   GPR_CSI2_1_RX_ENABLE |
+			   GPR_CSI2_1_VID_INTFC_ENB |
+			   GPR_CSI2_1_HSEL |
+			   GPR_CSI2_1_CONT_CLK_MODE |
+			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(hs_settle));
+
+	return 0;
+}
+
+static const struct imx8mq_plat_data imx8mq_data = {
+	.name = "i.MX8MQ",
+	.enable = imx8mq_gpr_enable,
+};
+
 static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -364,14 +396,9 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
 	if (ret)
 		return ret;
 
-	regmap_update_bits(state->phy_gpr,
-			   state->phy_gpr_reg,
-			   0x3fff,
-			   GPR_CSI2_1_RX_ENABLE |
-			   GPR_CSI2_1_VID_INTFC_ENB |
-			   GPR_CSI2_1_HSEL |
-			   GPR_CSI2_1_CONT_CLK_MODE |
-			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(hs_settle));
+	ret = state->pdata->enable(state, hs_settle);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -379,6 +406,9 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
 static void imx8mq_mipi_csi_stop_stream(struct csi_state *state)
 {
 	imx8mq_mipi_csi_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, 0xf);
+
+	if (state->pdata->disable)
+		state->pdata->disable(state);
 }
 
 /* -----------------------------------------------------------------------------
@@ -869,6 +899,8 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 
 	state->dev = dev;
 
+	state->pdata = of_device_get_match_data(dev);
+
 	ret = imx8mq_mipi_csi_parse_dt(state);
 	if (ret < 0) {
 		dev_err(dev, "Failed to parse device tree: %d\n", ret);
@@ -946,7 +978,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
-	{ .compatible = "fsl,imx8mq-mipi-csi2", },
+	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


