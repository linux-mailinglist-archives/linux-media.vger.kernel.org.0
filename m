Return-Path: <linux-media+bounces-39161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6049AB1F0D3
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D1CA1790BF
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CB428FFDE;
	Fri,  8 Aug 2025 22:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n1Z/+GAQ"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E787828F95F;
	Fri,  8 Aug 2025 22:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692856; cv=fail; b=f+zrhl+In8LjIoM193Bsfvrq/LOCPGDFaUsFKVkHJ0kAHATsGvHKRMIUntDoCJYOIf42O2CXfg3r0dwnrFmG0yfns8tPrHh1qHnElKndnsR4MvFisGQU3LkeOEMzaC8SwM7bsgZsfpWq3sO3Pp72ysZASxWIVQHt+0xLAsaGorg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692856; c=relaxed/simple;
	bh=80Kc/JaYoLh8NAhfVYPUJLhOcXHFe+a7KDEonGqO5KM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J9Ld6+bauXe4n3eBIRzmDfGhxOvsYSNq4/YQY1sRFqmKMU7BMYGKcAdxRyp8pfumeBP0+InDOR7gobwIpcIeXsA9JeqVw4Hvzm8v8fIDBgmh3LbPjfmUT5g5ha9wupS3NJoNaNAZWIJk5aiYXq3UcQUOjfaPsTyeiCJxSebbnFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n1Z/+GAQ; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2Sb3BkpOe2UjtGnNPq6BUFs9/GjO8wk5U4+2VlE13ojS/XIjqmBK2Gw4sqXO5eiwzZDVPnEayEiFzeQC6R/JuTMnRgIMxbhvAosw1JnYuDJfUlcC8gVv4I9JXvEBTtvU2gYxD6ZOlIvdDqhZi9cSHeX2SEWxGJ33hcq+fCbUheFAL44OvrGOjM1UsJKol4DHPqHlyZB/Fu0loDSBxSkVcmPWD0on2J55TfmNiqUQD6n6GPmXOaepHmvkwmtX8uKNeHpl0M6240ObyNU9i4a4dWiqh83tRTUfozfn5jJ9vsPiZg/ajdycAZDCE/rXWCG5fqWt/zJrdNA+YIjtbiX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibLR++eqB9BYoACIESJCoxoe7JTSY55GVoaKRMpdKOs=;
 b=P9wPBnI0go+JTu9xLJt86vKMbce5V9ihW2+2fjSnejvO4/9W8c5exy4H+7sYZHnXZYWhTC2L9t6yhvjb8xvsfMBOuQP0hdlFNfS7stJNLcQP74i2y1TmSmX7e+VVt9ZAK6ZzdSoF6oz3sCSYrnKOUyJUyX0qDtDVgMmiBgccltkZO2LFK/IUCSQdtsgSZf1SZJxrwQ0+Z4fE6VGmlAFtBY2khACIswfawnJcWB229+9rlEY0DzyunJOULTk9PrE9RvlasVulYjP6fGPk+RIw6up5zEm7y7ahGZubT9MN98ji8hT6TXeto/EtikckSSwWATxcPh2PloKeeqOF2E4sBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibLR++eqB9BYoACIESJCoxoe7JTSY55GVoaKRMpdKOs=;
 b=n1Z/+GAQzFFerF2jXVRsnFSdq8v4z9vop9sbJI4OxAniyN1cGWFeBDfnZz3c+c35hM8r+dXDOOKwhtEgHGF0HH9puOy8AotlevlTEdkO+EJ1jYVG7aebJ8yH6ClF7v0M5WnwtEGJYJoYnDg7fqM1OxhsbkGgxk/dXoiswBFihoutYpvGs2gZSdh1hd6INx77+QBPBcXzp6piJ+bJtETTp20pqKH/49lW1wN00t7OSH6o04jhFy1wxpAUvXEEAl5iINtMUn8S3V+5/qfSKEJHxD8BpCt49/ehCfeDxaBm9Bz8tTvhoucx5LIj/OkbUtLiik8XHDk9zr1nCv4Dmb3Diw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:40:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:40:51 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:12 -0400
Subject: [PATCH v2 09/32] media: staging: media: imx6-mipi-csi2: use
 guard() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-9-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=3565;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=80Kc/JaYoLh8NAhfVYPUJLhOcXHFe+a7KDEonGqO5KM=;
 b=E0/ozrr8qCl0q4RH1/3CeimgBNSrHewTGBbqJjGUxgmp/d+FCPkq1owxNpO8owmSCam3ptYHd
 k2mRaqVtp5zAHpvdzHkbxfYjvfJQnJYG2zPhkG8sKVNI3LCUKvSPM2y
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: bd933378-9cf2-4973-d67a-08ddd6cca053
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?OURDVHN5d3kwRGgwMGxUT2k3V1hxOXBQVDZnZjlYdGZBM1p0UG84NW9acXBZ?=
 =?utf-8?B?WUl3VUtYZGI0NFFIVWcwVCs5S3ZXellvcitqTzdLcGFYL214SThKTGNPa3pu?=
 =?utf-8?B?NVU5cmJOWW5wMTJkdHlacmwxS3cvMDdpak9nVFhMclFWNC9YVTMvYVM4NXFu?=
 =?utf-8?B?NGlnVXlIOWhLRHMyUm8ycUZNYVJPYUs1ckNQMjlPdWJGU0ljenZxNUgySFVn?=
 =?utf-8?B?aGt5MUpUOGV1RUJKL2dReWtMbW8wLzJzYThtSXRZY0dxRzBNblRNUnBsOEZz?=
 =?utf-8?B?OVRnMkpycllCNk9ucGkrUkw1bzBqbThQaE9ZSUN0TVNSZjdyait3VnE4SlhF?=
 =?utf-8?B?bVc4WU5aODJWbVZtVkxYa2tPUDh5SlhOU3RSbnNFV3lFdmlaS1FyUGV2Z2lB?=
 =?utf-8?B?R0RVb0pIMmkwWitwYm83Z0JlOE03QmNKd3lCV0NGQXlEbDZMWHNPT0VlSDBG?=
 =?utf-8?B?R1NUVEVhY1VFMmQxQVdqWDJXK3d6TG5MMytzdE96a2xXUElQbkwraUdTNU5v?=
 =?utf-8?B?ZWgxblpOMmd1RWRFVXk1T2c2TXR2OWxNNWpnVms5d2RlRE1Ka256ZGdKTXN2?=
 =?utf-8?B?NW5wdmtoV1J0cGNISm8xdnNrMExiQ2ZncU5raU1uRmlrR0xFdWJTRTREOTl3?=
 =?utf-8?B?aUhTWTZveU94S2J0TG9leGdlb3Nmd3FyWVd3K1FLRXUyQWpsNzNPQkZtVGo3?=
 =?utf-8?B?c05IVDBxRitzU2FqaGh0aGEvOWdhNFRod3doQ09pOGFXQ0xMQm40Z2JwSWVW?=
 =?utf-8?B?Z1BzUmluMmFCY3hVSFQyc25mYThSNjQ0L3RBVm9IcHh2aFpPQmFDemxaNjl2?=
 =?utf-8?B?SzQvNWpLOEJkaHJDMjUrb1d5d3BNZkJOZlZOYnNqd2RMSTRDT1ZxRWFuODFM?=
 =?utf-8?B?VnpRNkI1aU9yb0E3YXBhcjRxbkswVElVbmlOT3JUNUlJQWt0UVhrN3VqTi9H?=
 =?utf-8?B?RUV4ZldvQ2ttQ2NsM25BaitzcXRqV3NQN1pTU2RnZGJSU1ZrY1pBdGlscjdu?=
 =?utf-8?B?Y2x2dDlMZE5ETE9TQW9heG9abUlLMU9UUHYxRmRtRkhjL3hoRnJZeklGdWNH?=
 =?utf-8?B?WmQxVHVXbnNQSzJjNEdZK2VoQTBVZEg2cWVSL1RTSm5WSGRpSUx0ZzZQSFZI?=
 =?utf-8?B?aTA3OUxVZ1BLWmpXaXhmaVozWi9hbnByZ2QwQ1FGeDdNSFZCTDdLanFrdVRv?=
 =?utf-8?B?b3dVMTFYSXhTUCtCT09odkRDMllRTHZJNytEdWxQZzZWc1Zqc2taM3dvQjl5?=
 =?utf-8?B?MnRJQ0pKQUxhRm5wQUVwSUV6R3FlTHlscFV2MTEwWGZLZWxkc0pUVXV3K0Qz?=
 =?utf-8?B?eTQyMVlKUVhJd0xWMVpUYXJiM3FKb3Y4TnRVQkZlMW41bUk1MUxzUXdrT2Y1?=
 =?utf-8?B?cis1VGo3Q05FSzRiVklhYXdBbGFubmdsQnlOcXNIVW53N2ZraGppdHRKa0Nh?=
 =?utf-8?B?NGYxYnBzZXBUdmtFamdZYXhqOXZuY0xZbndLcFQwRFo5UmI0WXUxUFBqZHlr?=
 =?utf-8?B?MC9TZDVGUmxQT05RTENjNWE2SDA2enZEaTdhdG82dEsvNVdNSVpmWUxUUjNx?=
 =?utf-8?B?UFBLU2ljM0VGbUw2Rmwwa0RTZWM0OGVKeTl0UURxZythclYybmtFSHJDSko5?=
 =?utf-8?B?TmlyZVJzZHQ4STZXWmFFK3AweDBkeXpkSEV4UVEyOXRLRkRqTmUvcFhIejVD?=
 =?utf-8?B?UDV6Y2Z5ajFUL05jdUVyUG15NXRpb3lPekhHS0lDVXEvcW9DVWtEcHhKSG9X?=
 =?utf-8?B?L0FvWlh1cll6R0MxRmw4WUk1VDdNZ09jbkZIN0RkUlZZa2k1YThiaHUrNU5j?=
 =?utf-8?B?eU9NZ0lKYkVVdUlGdnRHSHVZL1lTcy93Uk55VE9ObzVITUhDMyswMnRkTEps?=
 =?utf-8?B?bHUveG9DazBnZVQ3cEl5ZnNxRVovcGo3VjdTZmZLSVVsdVBQZnc4TC9XSkNL?=
 =?utf-8?B?bjFOZ2s3bEg2NlBsSUpjQ2lOTUxvY21GWGQ3Q1NFWTFDNnBDb2xqcjVDWUMw?=
 =?utf-8?Q?0FgCAHTwdYfUEhrul9NSuUo3CHrMo0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UGgzVjNDaGlJRGtHNnhqbGR5QTBIZHNOUDJidDRUZTFzMnFpdlpCSzE3azJY?=
 =?utf-8?B?WjhNNlJOUzNaZGdUOW9NRXVMdlEzNnZQWWx0Z1gxRk9udE5BTmZUYmdNR1Nm?=
 =?utf-8?B?Uy9NQ2lSODZvbXdKUXVHeHJEajlRY0w1MS84TCtNdzdRZ2g2dXp2bDJ1cEJy?=
 =?utf-8?B?a1JzL0x4ZTJydXZzZm9LN0c4R2syZWRiV2hTL2kvWHFaY2p3dXgrTXdQcUxx?=
 =?utf-8?B?RncwT0NlZG5ERVlqcHRuU2M1QnR6Nld4Z0RaNEJjTTF1VmIrMHBtQVBVRnNn?=
 =?utf-8?B?dXB1M3lBM0NlYUI3bUlmSmtZSnlSVkx4MktYV0srQWFKMmR5NGpwaWdXTWtR?=
 =?utf-8?B?cUtacm92WThkOEV5bUdwaXN2ODUxSU4vR21EYkdxRmE2UTJDVnAwbnRQeGdl?=
 =?utf-8?B?MDVrd1RzdXdTYi96dlh3Smt2ZFVUK091cmF2dUhvYkJ3YitZN2QzSUNkRVlC?=
 =?utf-8?B?T2ZmTVVEVGhlRC91WHU4MklEWDJacjRVR3VFR0F3dktMTEx5Zzd4MEpNWFYv?=
 =?utf-8?B?K3llTTd1YXFTcTR3SjFDejFIVmk4SEh1VDBvSEpJV0swNnVhcDdZSVZqT3di?=
 =?utf-8?B?NHowRmh4Q1VKQ2haekQ0eEMwNEZKSmpmQk1kRUtvajRLWnZ4TUYvMFl2ZEFK?=
 =?utf-8?B?S1BNM0VMNDFPWjBwdEg3dzBuZjVycmVGaUtIYnROTGtGVENGaG04dEx2RWc1?=
 =?utf-8?B?aytYY3VwOWN1MDJ0RjdGVFlqSTFVZ09NbGtMT3Nnck9PS0V3TUd6UUJIR0J5?=
 =?utf-8?B?OGo3ZndlUWFJRmNiWWVSc0VsSktHNzhuNk9lWW1FMGFBendzYUVMaWxoc0hx?=
 =?utf-8?B?MGJ0NCsvNXVMNFc3NXFtTVh2dHZ4T2lkdjZ5QlhEUmI0b2Z0a3krZUhwa0JU?=
 =?utf-8?B?dURHREhUNFhsSmE5a3RyNnlrbXlRL2dRbFNtSHp5Q25NUytFdmRib3o3ZXVy?=
 =?utf-8?B?VG9ERTlRTjBXbEQySjhoYTMva2gyUkhkRnpscWRNVERsVnVRZnVONGJpYlpp?=
 =?utf-8?B?cnhwMUp2cEEvLzA3TittMHJtMU1HK01HNnlXcERZU0ZJTHJ5SnFWVlA0TmFo?=
 =?utf-8?B?YndIa3ExRkd6MElJRWkzRXZ5dmVqdkpLMmNGeHh1WFpZTHA3WFlmSlgzdkEw?=
 =?utf-8?B?Vzl4M25qNVc4YU0vdC9KQVpuV080Z0ZVWnVhNFZlbExibXpmRHRLUmwyZXBi?=
 =?utf-8?B?dmdRTklZdWMxaUlpYzMvZm5qVys3bzFsR09GQno2TWhCTGg5MGM3bFpYZ3BW?=
 =?utf-8?B?NGZrS3BmZE1BMnZXUzZETDVoVnVKOTRCbHBuOFlaK2dIaTVhVm1mVDR1bFF5?=
 =?utf-8?B?NVBLZTZVN2NlM1hCS1ZBbC9oN2xSbUY4aURmVSsvRnFIaWF5a0xEZE44UHEw?=
 =?utf-8?B?TmZXVWZYUis4cDRUeWEyRjJOd0hubmx6SzNIY2xzVWx4M210VXVqVTFjcmxN?=
 =?utf-8?B?WlY0UGUrK3hwQnRGaksxeHppSE5FOWRneHpzSldMRDl0UlYvRklEakhBdGd3?=
 =?utf-8?B?UWI2ZEQ5L2VFQ0JtVUhoUW1ITFFkYlB1b0NpVFI5bEZlZ0UzQzdxZ2p1aFIx?=
 =?utf-8?B?b0ljOUM5a01XM08yS3paT1pyNUlxWnJWNG5NTHRmRWFUbTBmOE0rVXJTYm0w?=
 =?utf-8?B?OTJaRExXUjYzTVdvdVJpNVR5VURIemdTMURZaFZqQThLVHBuZmFSQXBsU1E2?=
 =?utf-8?B?TS9VNEc5aWF4d3ZsT2xvZjZTWUtpZW9mU1Rwc041TVQxVlRIeUwzQVVMcW5m?=
 =?utf-8?B?Y0xjNnhQZndGczFoSUFnTDE1L3B0KzFQYUNkUWVkc29idmM4WWxSaXBNT2RY?=
 =?utf-8?B?MjZKZWlMN2pvZXYwc0QrcU5kRzVQTEZaNFhhWkphbUpGbDFHNC9EVERhTkhu?=
 =?utf-8?B?bk1tVmFOMHozS3FHWWZWT1NnUzcrWmRKcDNhaFpOWkdQRHFTeFg5TTlQTWZw?=
 =?utf-8?B?OG95N2JnTlhMa1JLbmlUTDhpVVpMRTZwNExBTGRLbFhkbEVjOVQvZ015ZGU5?=
 =?utf-8?B?elhuUW83cGlNNFppT1VEQnh1bk5HTVJ4T05zUXRoZXcwajhjYklqdUZ6M0tN?=
 =?utf-8?B?TXIyOVdleDFmR0FSdWVDandKZjBZYTU3MFNJMDBkdmVDbVhNLzJyVDJWOUVm?=
 =?utf-8?Q?6sAhy9DXZ8r4EskpjoWSl4qtX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd933378-9cf2-4973-d67a-08ddd6cca053
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:40:51.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmD967QOQTcXxv6UJfkLbpLqw6TC4yE2/K8/EjpLo86Jk7/JeLhpLNHNohAJ9KzVyiEhMgiHiK0RyvpMlDCNzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Use guard() to simplify mutex locking. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 54 +++++++++++-------------------
 1 file changed, 19 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 72ede5ebf4d4c426e62cf288225a2b2dd7cfe1bd..73278d9ec2d66afa33b2bea17f2d56bb1391108b 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -413,21 +413,17 @@ static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 	int i, ret = 0;
 
-	mutex_lock(&csi2->lock);
+	guard(mutex)(&csi2->lock);
 
-	if (!csi2->src_sd) {
-		ret = -EPIPE;
-		goto out;
-	}
+	if (!csi2->src_sd)
+		return -EPIPE;
 
 	for (i = 0; i < CSI2_NUM_SRC_PADS; i++) {
 		if (csi2->sink_linked[i])
 			break;
 	}
-	if (i >= CSI2_NUM_SRC_PADS) {
-		ret = -EPIPE;
-		goto out;
-	}
+	if (i >= CSI2_NUM_SRC_PADS)
+		return -EPIPE;
 
 	/*
 	 * enable/disable streaming only if stream_count is
@@ -442,14 +438,12 @@ static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
 	else
 		csi2_stop(csi2);
 	if (ret)
-		goto out;
+		return ret;
 
 update_count:
 	csi2->stream_count += enable ? 1 : -1;
 	if (csi2->stream_count < 0)
 		csi2->stream_count = 0;
-out:
-	mutex_unlock(&csi2->lock);
 	return ret;
 }
 
@@ -467,32 +461,28 @@ static int csi2_link_setup(struct media_entity *entity,
 
 	remote_sd = media_entity_to_v4l2_subdev(remote->entity);
 
-	mutex_lock(&csi2->lock);
+	guard(mutex)(&csi2->lock);
 
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
 		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (csi2->sink_linked[local->index - 1]) {
-				ret = -EBUSY;
-				goto out;
-			}
+			if (csi2->sink_linked[local->index - 1])
+				return -EBUSY;
+
 			csi2->sink_linked[local->index - 1] = true;
 		} else {
 			csi2->sink_linked[local->index - 1] = false;
 		}
 	} else {
 		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (csi2->src_sd) {
-				ret = -EBUSY;
-				goto out;
-			}
+			if (csi2->src_sd)
+				return -EBUSY;
+
 			csi2->src_sd = remote_sd;
 		} else {
 			csi2->src_sd = NULL;
 		}
 	}
 
-out:
-	mutex_unlock(&csi2->lock);
 	return ret;
 }
 
@@ -513,14 +503,12 @@ static int csi2_get_fmt(struct v4l2_subdev *sd,
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(&csi2->lock);
+	guard(mutex)(&csi2->lock);
 
 	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
 
 	sdformat->format = *fmt;
 
-	mutex_unlock(&csi2->lock);
-
 	return 0;
 }
 
@@ -530,17 +518,14 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 {
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
-	int ret = 0;
 
 	if (sdformat->pad >= CSI2_NUM_PADS)
 		return -EINVAL;
 
-	mutex_lock(&csi2->lock);
+	guard(mutex)(&csi2->lock);
 
-	if (csi2->stream_count > 0) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (csi2->stream_count > 0)
+		return -EBUSY;
 
 	/* Output pads mirror active input pad, no limits on input pads */
 	if (sdformat->pad != CSI2_SINK_PAD)
@@ -549,9 +534,8 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
 
 	*fmt = sdformat->format;
-out:
-	mutex_unlock(&csi2->lock);
-	return ret;
+
+	return 0;
 }
 
 static int csi2_registered(struct v4l2_subdev *sd)

-- 
2.34.1


