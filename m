Return-Path: <linux-media+bounces-39158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 952EFB1F0CA
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D1F57B6D6B
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426F828DB7E;
	Fri,  8 Aug 2025 22:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gxikaQUZ"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71D28B7F9;
	Fri,  8 Aug 2025 22:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692840; cv=fail; b=QJHDnJnCsnEJOFeekOllPjGf3TEBsaU6GmeDORwdFeFagxq9IpnpFUWGVmiKymyEhgUp5Mvq5Rrrfv2HDFEEl3lgs92krcXc5KJ6DGWB2UWelzX0PSiEcsn1FchtSnypMGnrJPD27HsIANDd2bnAH7uDexmHU3JvWmBMgu0I9B8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692840; c=relaxed/simple;
	bh=JykNP3Wr8V27V/V5mRXR63Vo77tMC6HLDGjlTMTwCO0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FmLynBo1gyWUoXGeYwZD2Kddjv94oi4dv81Iyjh5g+1iuMtqRDHeIVXNkT5TvyK/bftD+/JOuXeKMeyo5NNL3mAfdm0LFykD2i8hUE3kRpVIMXcQQQVrJ+VD7/cnCZ8DOSFF9ZfKbY7VLh5sLY7Bdbdyva+WpiYDGi/vhVfdzeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gxikaQUZ; arc=fail smtp.client-ip=52.101.70.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGb3NjEsesMgDea2NfI+OhyiVDTVNe64aqbwvGlLjij1NMKYVRPN58Z4Bq8eQuFbW88jP49RnM5QOZevpQ/Pl8DyNve7vcDCT0RGFP81bFONxG/uPiKa997/LmMOeUeXnlQQsTfxmRYfefRJ6Ho+MyAu1QffSyTtCmZIeDNoMb5DPY9zOXxTrUT/FVUcU8dS+G6aedn+nWm6m3ILNefWhi8h7Vax2V+E5DTaxlFMShWd+58jZuRE+IzUA012Y6vPjzwBfzOSaISN9/rkw6COUmL7xKtzwPnrx51nuf7wmgTGjVDQavzy/Yu/H+19e9IsjB6ShxXKEk78dZsSDuraYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16r7ZGQxZ/iSnep82FApZjOgA5LJ98oPP+SxebBXSDM=;
 b=r/mhCvLHis/CQGQ3nvS6TfT6QyZcXDXfN/CEwF9UK5GT40rTACQ4iTTpGvWwRL3xmTR6ECsAf53Sj2FQ0O0p9gOKtaHT3Ke6cWliQzWGkhApvk4xEzgWzqBt1lPc4VqTdvURNavpEI2Un1/e+F3a7GnNbLuU5Dk6QS/C67UWK2qTFbjmldOaQOjJ6bR4/Ia5owrQJuL3rK2boPA/YPxYslmfrAUHyCtntckLJQngkhyZMDuBKx9ngpC3oRAbDRR0MCY3m43lv2cr7lrGN2oxa8U7NXZLRqhl/7kXotuJ/Rh73eC8q+MyO0KNcHSscO4Md7D5ZxWhbESQMlDiN8AiwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16r7ZGQxZ/iSnep82FApZjOgA5LJ98oPP+SxebBXSDM=;
 b=gxikaQUZxjcUwgcwlsidqg5MZaKhaKPqNbstuCLk2gxSSqjOiXebHH6BSzka3IfDxEyUWnHKeo6/SPLqWC2V79WLza/SwJLPFeHbgaNzxZs3vHB16KredVgwLpHwJXwwBvAVA3ZYmc2x16cOT1PzpgSRjhObwxk3G6seidF3PPj3GJGgTNCf6sXdHUTxel0sKha8Wge4oUA5OSHBYylbY57JRQMIH2MG/OG0560wkhjUEghbw8X7CFSYbPZEiiaqpvW4thF8iaIBVbXb44mJhFklz4KMknpxMLbjoRI1pYGpr4mZobgi8waV7VEp0BcMbHaumj1qHaB/96N4m7jISQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:40:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:40:33 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:09 -0400
Subject: [PATCH v2 06/32] media: staging: media: imx6-mipi-csi2: use
 devm_add_action_or_reset() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-6-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=1965;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=JykNP3Wr8V27V/V5mRXR63Vo77tMC6HLDGjlTMTwCO0=;
 b=n4hxVX6H5e+cSNCClzne9kbRJAI3daVJyEBm66QF5sRBdkU73QF0dWSvuAapEAz4gtzVvDen+
 9MxJbg9DYI/DoKpemRvXkXXtkXMgJQPqHehshyIkVgNnKcgyrOUlLtl
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
X-MS-Office365-Filtering-Correlation-Id: 304d753a-6fa6-406d-1a61-08ddd6cc9602
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VzZpQXVmdzVQMGV6S2laR0dscVRuYmtUcHhyRlJiTWxIWEUvd0d6R1lDaXhS?=
 =?utf-8?B?Z3ZEazd3bitaRFFzREFjT3VrcmkwcnVPY2lDTitzS0ZyaE8yTTRhZSsyNGIy?=
 =?utf-8?B?WFNLa3ZxNHdIcldqZDlBTzZHSkc4T2R2YTU5VFJtWFhmbW5IWkZCd0hJTk5S?=
 =?utf-8?B?QU9uQXhVaXFqaXNGa0FHQ2Y3VXN1TnhTNVI0V2N1S2l2cE12TFZuMUUwVHZw?=
 =?utf-8?B?OE5wSnBQWFQwdXNtc1ByYVJhK0w2OW1Mb04wcFZiWXV0UFFDTU5jSytDUWNF?=
 =?utf-8?B?RmtYVzJGODFkaXBFMVpwcXpTSUFqQlh6ZS9kNXdxaSs3ZEcycXFGU1V6WENE?=
 =?utf-8?B?YXRSZHh2STBTY0k1VEV3MEFwdHM4TEVVYWdHcytTQ2hZc3dTOGhwMDc1cW5M?=
 =?utf-8?B?bEZ2dENTYkZkeGJIU25rRU1iWHZLdXVoRmNzWUpWUlZycWVyVFdDaGNIN2Fx?=
 =?utf-8?B?OG0vYURsbEwzQjZ4eDZ2NVZXSmRLaXViNVdabmt0eFFWVUl4RmxwVStqYmJs?=
 =?utf-8?B?UnFrZGVWaUcwUVh5bmhhTkdTbVY1c0pzd2N0SkZ5R05BVDFKZUZubk1GazEv?=
 =?utf-8?B?Y3Z3MU94eW45eVc4d0pXeTRLNkpiTFFpNDdRYWp0RWpsU2E0bkxqOWJKSTlT?=
 =?utf-8?B?aDM2cXJBVkYxdG9LeHFhR1BRaGJnam52T25MSjdyK3NUZThNT3NQdWMvNVFI?=
 =?utf-8?B?YW5rYUxqRUl6TzRka0tHQTh1S1dFaWNrOXF4MldpZWZDaHhNR3VGd3NqV012?=
 =?utf-8?B?cFZlN21kQ1JBQVVwQ1FiTG84RzBhdW9USzBLVHFYRG1QZ3BnRFJZU0EyR3FW?=
 =?utf-8?B?eW1WeEFGb3FvazFOWk1tUFJZWUdFUi9vRnlmbFhZY3F5MXdpcVZwT0M4a3V3?=
 =?utf-8?B?YkYway9PMFNURjFlYVVReFYyM2ZvK1p1dDdDLzhnbkVGNzRmK3pTY1l6Vjl1?=
 =?utf-8?B?Y3AxN0c4dS9RZER0NzZ2dkxwaTd5dVFaUzI5eW1IYWZORFY2K095K2ZMVGxk?=
 =?utf-8?B?Z3dqNFJrcVJPT1Y3T3Q3UUdlSVdLcklMZ1pFUG9QWVlvRUlGT0RYa3JmZTVw?=
 =?utf-8?B?bCtEeTl2NlRDaUdNNWN3K2IwQmozSmZPaFNjVE9pUWFhcG1QSjFDZHpzQ1Bw?=
 =?utf-8?B?TnJhQU03b29XQkU4R25GNklzMzh6cU80QlVQRnhqVDJ5UkM1NW5DQVFtY3VV?=
 =?utf-8?B?VTFTcit2YllVSExoaUZZU0RkS3JsTXhaRVZIa3h4cE5IUEJaOW5oeXJtN0hv?=
 =?utf-8?B?OUNSQ0Q0cU5vbXFkR1NqZlAzbG5wTlB6UkxELy9JWHNQdUNaVHJYSjRVdlk2?=
 =?utf-8?B?REhUZkFtTS8veEgxSmE5SW5LdGxFSm12N3B5Z0dQSGF0Z0dtcThmRHdvNlZD?=
 =?utf-8?B?SC9oK1lmNEloZG94ZXdFcWRVaE0zeDArMWxXdm9pQUYxVTRiN0lOalpERlR0?=
 =?utf-8?B?WkJidWhPUHhkZ3BDYjNtNWlhMTB5V2pjZVIydTFFWVp3TkE5K3YzZ21aZXFM?=
 =?utf-8?B?azlRVjRaM3VPOXpoR0R1QU11OTlNZDlTbmVWVEJibUIrTlJ3NXprNE1VNXkv?=
 =?utf-8?B?UU9RNXhaeEJENmJUakx5YlFXUldJSWx0S1QrYnh4eUlQanVoekZGSzgvYk9r?=
 =?utf-8?B?aXRtWTRFUXY0VmM0VFN1cy9DRWFxTzRLWVU0OTM5dWFwa2hjendpK0w0VTVK?=
 =?utf-8?B?N2RGR2Q0eUZLQXBXN0dxamJQVWRWaUREOGZCK2FIdVZ3RFBYa21iNThSc3dC?=
 =?utf-8?B?aG5ZejlSOFdsYlRpYm5wS3EvTEtMY0c1ZlBRNmE5cEQwUElTeHg3QnY0cXBF?=
 =?utf-8?B?WTd1TXRBcW1OaU4rU3h6MWZrbElwcW5QeUR6ZlNvVTNmcHJZaEo1Q0t3MWlZ?=
 =?utf-8?B?QU40TmlCZDNUWTBGMHQweDB0WXZUUXZVNEkzR3ZqRys2czRmTHNGUEFoSkFB?=
 =?utf-8?B?angyUTRGc2g0MFRVMDZLdllKR3lkUFRuY1pRTjZneml3Mi9yYi9VUFp1VTk3?=
 =?utf-8?Q?2r40EZiAe8tAknpz89AbtF/58yVVRk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Yk5DL2hBczBTTm5LS3IxNFBXVGIyMXEzMzN3UkRUakFkVVh4VVppM1ZNVG9H?=
 =?utf-8?B?WG05ZEF6Z2ZsemxHN2N3bkVSek0zaTN2Sk5lVHl3ZGJJQ0ROS1A1cUVVRmJh?=
 =?utf-8?B?bDlFR2tVTVZqenhOZzBHVDJvYW83Q3lpdm1wVThoSDVYVzBPR3RRa0tRM3JJ?=
 =?utf-8?B?LzRNc3dyVTJWaGFxNEU0aGh4QXRwbDVVSnNyeEVjeGg4RHlPaXdyQ0k3a29K?=
 =?utf-8?B?RjNMTFcxSEx3cnQ2NmU2QlU5cytzS2NjSXBYSm8xSUNQSDhLMzN2SHZmRFBQ?=
 =?utf-8?B?dUZQQWlKWVE1M3JSNzlPK3BIT0N3eVo2UWljeTZzeXdjaGxlSGY4bm1GYTFq?=
 =?utf-8?B?L1k1T1pxT2NwVmpsNDhVSjNtTmJOVzNidDNRRTZxMHVDZXBpRXFidVFvZEYr?=
 =?utf-8?B?NWY3bk9ta1U2S2Z3ZFNRSUxITDJVYUNFNmhwbWtud0sxNWM3WmpFeFF0ckdX?=
 =?utf-8?B?OVl5Vlpjbm5aZ2VXdFVsS2NHWTVIdjMxdC9hMHVsUTJSdlRKdHROVEJEemJa?=
 =?utf-8?B?SjF2Z283TDlBc1czRjBFdHk1b0pRQS9sS0swODlCYThpM2kwTjNQUGowUUZL?=
 =?utf-8?B?a3hLeHp4bXV4UTUvaVlmQTJnNWI3dlNQOVNrcTNnVVJBNm4zekpmR3JMRzJH?=
 =?utf-8?B?V0lhcDEzQkZ4bThrQjI1NkZidjF5cjVQZWxqalVJYVdScUpSc045aEJyU28r?=
 =?utf-8?B?YVVVR1NHSjNqMXM0OW53VzJkNDlwMHVwMG4vV2pGZWJTNkplN2F1bDVETm9w?=
 =?utf-8?B?dG96SGtFNVZQbTdtK056MktlMjQyNlplcWdNUE01OS9zRnBUNGFNREx0Z2c5?=
 =?utf-8?B?T0RXSlJBT1hLMFI2bks5N0xDOUdGK0swRXFmNUVKT1lEcGJySnNRV004WkVh?=
 =?utf-8?B?Q3BPQ21BeTk0aEdlL2hvbERCUjQ0SHh4cG9sL2tEZEJJZ0M4aEtMbFdESERa?=
 =?utf-8?B?RGVtV2x0cHV2UlBwOTdiTGhSb0ZEc0Q5b3VWNkZpemVnRUhudzZ3REVDaFFD?=
 =?utf-8?B?TUJqNmVpNC80Zkh0SktPbWJQem5FNFBuUGkzN0syMkVtU0FIMHA0bWtHUU44?=
 =?utf-8?B?VFUxTEJNK0FiZk9xbGtabHJydVZxbk85RU5jVnRDcGE4T25mSmR6SEJlRlZ2?=
 =?utf-8?B?SDlJWEtRWk9RV1RYRDl5Y2E2S2tUNUFiNGYwR2UrbE5ldktwUUdTMG5GajZj?=
 =?utf-8?B?UXlvQTJtWHFDZ0RYUm5yMEpoVTBxcjZBRmhJcjJOdUpZS3RSbmhCdENYeVJt?=
 =?utf-8?B?ZzFSUmV5Nk1pcjRRZ0RLK0lrb2pwMWIxa0xvRHhxeEE1cHMzSHlJMzZIUGJq?=
 =?utf-8?B?NzhuQmR6cXM2RVp5V3d6Nk0yM2xYOHp3WU81ZFU1Z2hEMU9sR3k0YXMyaHdQ?=
 =?utf-8?B?T25ZY3U3VFpvVlo0cmxWZi9zbFFPU016djVBblVIODNiUCtxVHRvMit4VEVR?=
 =?utf-8?B?c0QvYThpTnJMY3NLNzhUU040ZWwzTFUzYnBscWxpbzQydGxJT1djc3JwenBX?=
 =?utf-8?B?aWFFalpSN1IxZ1l1dkRGa2xWcnNPYnE1R0xaRk0xVlFPMlViazR3RmtQSUJa?=
 =?utf-8?B?MWpHTTY3a1JxVmNBT1RaZWZXZVJGRG5LZDVBa2NZZTBRTEdLTERkeXMrSVM1?=
 =?utf-8?B?c0s4Nm44dWZidDRvV2R0dXhHckJUS01CaXFucFlZQ0Uxdmh3YUdjZFgyVGJX?=
 =?utf-8?B?SHFJeDQwdXZNdzBxWjF6dXBiTFVZd3ZkSGZPcDNKRWd6Q2tJVHNMUUhDTit0?=
 =?utf-8?B?LzM5Z29GUzg4NDRTK1U2TUp0YzZheG1PQ29sNTY5ZlA1S3o5L1l4Y21qem11?=
 =?utf-8?B?YysrbVo1bFYrYWwyaWNQRGtYMWt4ZkRxeHdnY0QwNUs0eEg2U3BYbmhDQUZm?=
 =?utf-8?B?ck9sTS9aYjVsNE8xVS83R2VGRkhQdEdnekpOd1daWE0zU1N3TW02YUw0Q2VG?=
 =?utf-8?B?Z1VrTTJNNnNSZ1FKU2RQOWxYb2svZXdwbmdpWUIxcTZkcTNRYi80cVpJUlNh?=
 =?utf-8?B?c1lWZW9wU0lFOW9GOXM3WUNkS05ueE9iL0pTOEhFVityeHQyVlBndkt3Y3Zl?=
 =?utf-8?B?NlY2VlNoVlpkSW41cEdod2lFNkk2Z2Y4Q0tPdTc0UHZBZXNSMDlDNUVDYzcx?=
 =?utf-8?Q?1laJrgKaHtfLXRWd8JJsftpqt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 304d753a-6fa6-406d-1a61-08ddd6cc9602
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:40:33.7144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KI6mpgyY9rdOBH41eG4uCyHz+ndxJas6NbAPAwZ1EcOyRao9SacyDnldCiZxGSVJCkEL7rI2pQqCiiXhrPMqMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Use devm_add_action_or_reset() to simplify the code. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 42256441b881d9f132ad7ff899d6f1e35643b4ac..eba9a650030f5e380aa900b94728ad375171c6a5 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -716,6 +716,14 @@ static int csi2_async_register(struct csi2_dev *csi2)
 	return ret;
 }
 
+static void csi2_nf_cleanup(void *data)
+{
+	struct csi2_dev *csi2 = data;
+
+	v4l2_async_nf_unregister(&csi2->notifier);
+	v4l2_async_nf_cleanup(&csi2->notifier);
+}
+
 static int csi2_probe(struct platform_device *pdev)
 {
 	struct csi2_dev *csi2;
@@ -749,6 +757,10 @@ static int csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(&pdev->dev, csi2_nf_cleanup, csi2);
+	if (ret)
+		return ret;
+
 	csi2->pllref_clk = devm_clk_get(&pdev->dev, "ref");
 	if (IS_ERR(csi2->pllref_clk)) {
 		v4l2_err(&csi2->sd, "failed to get pll reference clock\n");
@@ -800,8 +812,6 @@ static int csi2_probe(struct platform_device *pdev)
 	return 0;
 
 clean_notifier:
-	v4l2_async_nf_unregister(&csi2->notifier);
-	v4l2_async_nf_cleanup(&csi2->notifier);
 	clk_disable_unprepare(csi2->dphy_clk);
 pllref_off:
 	clk_disable_unprepare(csi2->pllref_clk);
@@ -815,8 +825,6 @@ static void csi2_remove(struct platform_device *pdev)
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 
-	v4l2_async_nf_unregister(&csi2->notifier);
-	v4l2_async_nf_cleanup(&csi2->notifier);
 	v4l2_async_unregister_subdev(sd);
 	clk_disable_unprepare(csi2->dphy_clk);
 	clk_disable_unprepare(csi2->pllref_clk);

-- 
2.34.1


