Return-Path: <linux-media+bounces-46172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CD4C29D72
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 03:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 952B53AB571
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 02:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FB527F747;
	Mon,  3 Nov 2025 02:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JnTGT0xz"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7C29A2;
	Mon,  3 Nov 2025 02:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762135419; cv=fail; b=QCB75yzVamFU/5zgVjWCSvB4o2eJGUJ3d3ymNfganlDws4Ivv+u015nRYsNejtVrXhmj/105YB2HkwAhDCTUHkbVQxHEPg4MDWp/HZ3qoiJHPhffDtc5RaKLoHIWXg9BYXSDPs3ov1xVtQMS6RptQ3nM8URmpz5Ld6rc8NXie4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762135419; c=relaxed/simple;
	bh=uDH1Sh3T6PHWq1V5GCTrZZzvMmDyuzymxBBvgPLt0nU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jlxvm5tgx/iVs+dbwWyPhHZPoZYq00rhB4gn43+fiGaa7gYnzuVKKTHXacHlqjtU1sIzlA6XCRmMC4Kv1L0OykNQ3t/2CFxvjQnoMtoRmm9RW/SdqsxLDUyhg+ft4SYTIS9bhP998D8xI7l/fYNVuN+CTLcfA9tCMg9t0W9KGlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JnTGT0xz; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwZ1ctlprjkmsuSnDYFnUk0WbgcD0agjaR2YIL/tuuzknhcJwjs/TyZKIjkDyGR5AreUwxSXZj6nApmAL4k/MzLbDN8CxabZs1/E0CDN6lajv9uHr4uzE6X9ZexvP39egUtKvJFaCiqafg9rP1QYk7Fguw7Vylpge5qr3qWt8SIKsltnkPPrPGE5m3G/zj1Ata0cO1wIx/gLs7+fLFUqwWRAGGptUS1HbCNaAKBmwZPgdtEZ5V0WKU2TWd8LN9F+OF8svyWQM9QSHTG0gRZExg8KjCZ8yeJph+d2FpLWX+VP+2+jOz/JPqUFVLV8RJd6IzMcEthLWtKqgL4fvnn7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDH1Sh3T6PHWq1V5GCTrZZzvMmDyuzymxBBvgPLt0nU=;
 b=QrfY1Q92asLsP4wUnrICScKcKOSZ4Z95vKU4pBmW1Tov1GB8cpQEfIvrhj2jKGHEz5/XMI10/PQKXyxPHmnuK6b4JZg+5AuIfIIPP3GL124VumThmwTjA7shiN6XFKiMnU0iXCdjZqp34VOBevigv2N610AdOHbesLCZwys4z4uWOGxtG+H04udIM8Qk15XsG3B27XKDeOWLc/JHIgySq19Joqpi3mmma48RUBSP4zpKI2D3hqfXDs6RJsVb+PLYbcrewdRaqZIDyQVLU24UWXBWW9FDOprYmCb2NgkIibMhUrT1KKN41O0//8SIDpmZxJ/jYCE+brrDgcZwfvcDVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDH1Sh3T6PHWq1V5GCTrZZzvMmDyuzymxBBvgPLt0nU=;
 b=JnTGT0xzfG3RRtOhjJCAgXtQg7EQru5XQQMiqF8rEhEcMkswhHgSR9CAt7DiLR5fQken1RoNQXB1obJlVX7D+iFEleRZO0oVJC/CMiLOnybVvtrEL+AbDHiShJvM6GYZHWN1OOPmOwN/p+16AQV3fAAIyHJLQzTzugt1GJgnx6QrHxBYocNdUGPmQUZqFFPheEqdvzOL3bpHg/ka9dTvcdBF9F4i58tdAGpkDKO3YvY/Y2sJYsHpHlm8LrqXqeu1/lXQAD5OwKZQzh3SwCY0mxG90fIJ1R+xOiGL4be19NoZ2KP2ZtgVwg/IeWbp8dHpo9npMxHIPr5ylzjAJ4mF9g==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB8452.eurprd04.prod.outlook.com (2603:10a6:20b:348::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 02:03:33 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 02:03:33 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v2 2/5] media: nxp: imx8-isi: Simplify code by
 using helper macro
Thread-Topic: [EXT] Re: [PATCH v2 2/5] media: nxp: imx8-isi: Simplify code by
 using helper macro
Thread-Index: AQHcHjIzAx8GBuTeC0eoL870oKvfoLSeTYGAgAA8otCAQdZmAIAALxJg
Date: Mon, 3 Nov 2025 02:03:33 +0000
Message-ID:
 <AS8PR04MB9080F97658FC324261575C40FAC7A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-2-37db5f768c57@nxp.com>
 <20250921221325.GB10540@pendragon.ideasonboard.com>
 <AS8PR04MB9080158655C3EA188BE7FE7AFA12A@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <20251102231440.GA1933@pendragon.ideasonboard.com>
In-Reply-To: <20251102231440.GA1933@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AS8PR04MB8452:EE_
x-ms-office365-filtering-correlation-id: dc710255-dbd4-4680-8a65-08de1a7d3160
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SkhHdVFsT2tsYjlJWUw5S2NnRkg2eU12ZDg5OTUwK3RPTnVNTkQ3L2FvZVhm?=
 =?utf-8?B?clBMUlg2TXdySWl1alVTbUwwanNQcm13UWYxRldMR2lKMUxIZkN2NW83RUhL?=
 =?utf-8?B?M205WDBiZ0RvMURDUjk1ODFCOUR0YU9rVUt2NXQ3bmxPWmpQRFM4QXFsYnBq?=
 =?utf-8?B?ZHVSVVlpeXlDSE5qMnJENWRDdFpvNFdFOGRhaTNDUC9GcWJRejkwVGkvOU56?=
 =?utf-8?B?QlBCOVpvZnRyTzJKNjV3SmZKalFHMms4MzF5ZDlHWHBzQnZLMkprNDBlc2FG?=
 =?utf-8?B?bFJCUTAxaE05Y2FBL2g2eHpCN3M1bXR3RnhSaWNYWk52V01wdzh6TmV6ZkhS?=
 =?utf-8?B?NGQrU0ptbDk3TmlqWGpIdEJ1L2wvWWR1SXQ2NlRDd3hLeXlmOThEWXpicXJQ?=
 =?utf-8?B?eWZZNTk3ZlRVcXAyamY5TkFWeFoyd2ppQ09hRjVxSSsrSXBtSmtUcEdJSlJ5?=
 =?utf-8?B?NUw3SjRPR1FtRDdZdTQvclNBekFxejh4WXJJOGpWQnZSNHBTTk8rcmVtTEtQ?=
 =?utf-8?B?VFZiMWkwVnJjbTFyekZJS1NHK0R2Z3g3aFVyMVhLODdHUDZTWHA2YVptZXY0?=
 =?utf-8?B?OHgwcEk1azI1ZVd1cXNLcWNSZU82d21hd2RnUnZTaFhmNjMya3dDQmhhaHVw?=
 =?utf-8?B?NStuMnJTSUwrSFR2VDRFU1lrWithdWV0TFRRd1dmMElHcDA0UVpIWlFSeFg1?=
 =?utf-8?B?RXg4eElzdGR3TUlIV29kNUNQS3ZpSzcwNFppVS9tWTNPbWpZaVhROXdFQkNL?=
 =?utf-8?B?bWhtWS9YcHJZZXNsT0Yzc0lqc2VRZEVWRTJXK2hIZ1AzR2Jwa2dXdWtHclZv?=
 =?utf-8?B?VGsxYjNiKy82dTV2cEJIdm16UldmdFhBQlhjdDJydXBVdzdZT2xobkFjL3hx?=
 =?utf-8?B?Z3Y1L2RCeVFtTi85MDN6WlJTcUIyUFJ6dy8zNk1wSDNZdmFOTXNRdHdGR0xW?=
 =?utf-8?B?amVOMEdEWElmWCtMUFJFTFdkS3NnSURYOHdFZlNLWktZVWdCemREQnUxdXFF?=
 =?utf-8?B?RmVubmhHa28yZTZaRkQybXVXaXYvV0lBaXpzcE5RV1JTSHhHa3VvNnNSY09p?=
 =?utf-8?B?ekZTYW1rWUkvV0h5VDA5bGppQ2JpVVQ5dVhma0V6L2dRTjZ3WHhmSFF5cEJl?=
 =?utf-8?B?aXluay9rTlp5d3hhaDB2TmJRNmFrQXRVMjd6WHJVelpOWlpqMGo5MlR2VGlQ?=
 =?utf-8?B?RjB1Q3BFWHVuVGc5S2haQjNnWHl1cHEyN3djTEJuT3pBNXlNUitBaUlRcEpi?=
 =?utf-8?B?UVdQWXhNUEQraVNzTTloS0VyeWpOM0lmN1NSdHdscm1uU2d4TzhqbTVhdnJK?=
 =?utf-8?B?Sjlra0t0RkVyeUp6L3ByZHJ5NUF3WGhGTTREOUkvR1ZaRk45WWlCMjJGblVO?=
 =?utf-8?B?TVkzMittaGh2Q2NDZDg0ZzE0dXFPS3hRSmZkQ0VKd3lkbithemc4OXIzZDM0?=
 =?utf-8?B?WDZKWG5MWVlkdG54NHRXY2pRSDFwdGJzeDJDMXA3SDBIVWxRYW5UejZmcVY1?=
 =?utf-8?B?SlZjNXFiMkR3bUJLU1AzaHRWZnF5bWFuQmVMV2FlR051SHltV1g4b04xVVd1?=
 =?utf-8?B?YU53Rk4yNVVYV3JTMXVlbFFWQkhzVnN5b0NtN0FWNjNBcHdmREdpZHhlYnVO?=
 =?utf-8?B?dnN0aGNWUFRpNUNIUG5LRXJYMjIyZXZ4K0grYXBSZEV4VmZoWG9XQitsNzNS?=
 =?utf-8?B?RFdFMU5XRkxsMTVFMUhsR2NZN3RSLzU0SE43cVhSS0dSWXFuN01XOWdmM21X?=
 =?utf-8?B?R2sxQXg2d1lkanREajRaNEZNWFphVk5HTzJXejMyRUpBSjRla2szUll0TFZV?=
 =?utf-8?B?N0pLQUcxMzVqWWI5NUNNUGU5K21aSVVsMi9RVkRuaGFGay9wbkRCNTIvZE0y?=
 =?utf-8?B?elNvSG90eDhTMTBsYUdTbEtKTDhzMW9pcE1SZ29pemNhcWRXVkZoMmZSU2Rq?=
 =?utf-8?B?dzJGKzF1MTE2bFFuRVhjcDFEU3oyY1FDNFBpMjlHRWk1elhmd1BkamQ2Smt1?=
 =?utf-8?B?THBDclEwcnY1MFB3RzBBL1N0djErM0liNDZSS1kwc1puNzRkcSt0alhjZ0tU?=
 =?utf-8?Q?ifBIso?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3hDMUUwVG1DOVVxbVVDVjlEVmZJQW5DK1BONkdGS1ViQW9DbWdNdG13aHlk?=
 =?utf-8?B?cThRK21scmhkVU9LWi9TMEdISEtXMEdqU1dkK3EwalZFeWo0K3N1V1lxMlRs?=
 =?utf-8?B?ZDhraGFLQ1hZdVZRQ29qUnZPTk9ZeFdyTTgrMEMxTTE4Nnp3SFBPeGl6Rjln?=
 =?utf-8?B?WlBJZVplVC9TYk1ieFhmdVFpcEdDc1krUDU4ZjdXZHIwVXBPUithWUJTWGpX?=
 =?utf-8?B?T1J2T1lPTjF0NG9PSkFGMEorZDR1bE1tK3ZuQ3FLUHFXdWI5ZTNWYTJEYXhF?=
 =?utf-8?B?WGxIUXRONzFsaGtIdFZHVEpvUi9VYjBGb1QveGVJenczN1FiZlpzSUpiNlVR?=
 =?utf-8?B?MWhEb0FPdVF3SDNoblNoL2grdjFxbGcrTkRNc1JsUzg1WGNyWWNCRmVBY3Bo?=
 =?utf-8?B?Zk9vcTBRSlQrSi9td1h0ZlM3b3JuMW9pY1BuNUh1SWkxQ05iVjJJUnhFY2Rh?=
 =?utf-8?B?ajBRRW5SZmVEMFJGWk1XR1JrY3V2TmZJZGNFVHd6c1NHS0cwTXEyN1lnSERz?=
 =?utf-8?B?M3I5amNpdWZEK3dHT1BCNzNhZVl5MFZFTUJkcHJaUVpjOHA2UnhGQVJVZ285?=
 =?utf-8?B?S2dGeFR6bnNyNnZSMVdBUjUrTndHSXRsSDdtTkNCR1p0SnQvNVZpdDdaRUE2?=
 =?utf-8?B?S01JY0EyYStJTk05Rm9BQ05qcWNCbXVtWFNCTUdabDJCREhseC9LRXNIWWtO?=
 =?utf-8?B?RnJGOXgrSjdoWklWRHBQSnFZWUdBVFo3SjBDTXlMSlhRSDVEeFIvRG9RV2Fp?=
 =?utf-8?B?VldUSjNFYWgreENJaGkrVGthMHZoLzJrZkUwTHhRK2tTTDk1NHZIRXJmeVpy?=
 =?utf-8?B?dFhJQ1kwN1FjSllydXZVczh5TUc0ZTh0ZytoV0ZST2xNczVIZnJWYUpTaExm?=
 =?utf-8?B?alRET09xTUIwUDlNOUgyMEVMQW1NbkI3TzdLS3JwaEloMG1HRUhXZEFXZUxX?=
 =?utf-8?B?Rlk3R0ZQay9hT0RnR2hUZk5WK09wK2ZBRWQ3Y09mTU00QnlLUXNTNzNQSENZ?=
 =?utf-8?B?YlUwQVM0WWMwcC8zNjI2SmVTMlBVV0tYYW1rZ2ZVTWs0Q0hJdVkwVFExR1Qy?=
 =?utf-8?B?aG4ycStodXEyVmY5eWpuR3c4Y3NROC81SlZjbmhUQTNZclRQeXUxS3B6YVpK?=
 =?utf-8?B?Y250UmV1QUh2alRZVWQ0dGt3VHRpR0g4T05kZzZLZHVzS3lwNnhzcFVMM0RB?=
 =?utf-8?B?T3NsbExJbVlZQWpxaTZtZ2ZpQm0yaGIrVE55RFZtN0pDK3FsSlZ0VzRLaFJC?=
 =?utf-8?B?c2p2TmwwbnpFMzRXNitMUHY5RDF2U1YrbEpEaFhTTEF6MWN5V1BmWWRPdC8z?=
 =?utf-8?B?ZnhJRzloNVh4TmdOQklMajkvZzlVcG1BQ2duS2F0Y3ZhUEVobHJMUWV0c0Mx?=
 =?utf-8?B?YzFqNDJzamVxV1BzZUNHYlFJdXUvNDNUdGFzM3NNeXRIMlZRN0VLWGw0V0Rl?=
 =?utf-8?B?Vi9BMXdCNHFwUXpRYWh1amlwMlhkWTV2dENTM0hwbm9hZjAwZUFtV2o1a3lH?=
 =?utf-8?B?MnJwUUkwUWNtamM5bk1WUVJxYUdhRjZCNTBSdWF6cDkyMGxEaUhTdmNRR1F6?=
 =?utf-8?B?d1JLMHdBMStEN0xkTGJWVXMxRVRLWEVEbFFnOEl5S1p0NW96cklIZ25VMVV5?=
 =?utf-8?B?WnBxVFp4LzFaL29vemQrYmNQTEhSWFBqVWFpWE42YU1qT2xaTkpTN0xpQVJz?=
 =?utf-8?B?NC9OTCtNMnIveG1JQS9ZRGNEYzRRbSt4ODZkWTlPaklHTXdCanVYQXcrZkFi?=
 =?utf-8?B?eTZJK1NPbE95WFJTTVltM2xEeEs3THRwcmdmeE5iUFJPeWx2eG81Mm9lcW1X?=
 =?utf-8?B?NFcxREltNzR5Yit6OUVwUWdxWUZ1OEk4b0cxVW1pZkpQd01lY1ZubFdDNVNo?=
 =?utf-8?B?QXVLdUY5NjNDVnE2TzJXU3RzRkdzTERIRmRsYWkzZGdZY2FhYlBtaUx6b2RK?=
 =?utf-8?B?citoM2VNd0R2UHMrOXhvTzBlNkJWTzZ2RGpxNVQ2RlBmK2ZYMzh0NGswenk3?=
 =?utf-8?B?TEhoZlIwTXZUZjdsMUZ2Z0JSSFd0VjhnQlJyREVoVFNOcTEycWk0dU03bnlu?=
 =?utf-8?B?VXpCV0xndmtYblJUM0dNUGw0TWF3OE14OGZhcGNWVjQ5TytKb0paeldDdi95?=
 =?utf-8?Q?PGPLXIoE/2aR3U5z1etz7KVYs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc710255-dbd4-4680-8a65-08de1a7d3160
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 02:03:33.3889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pIYTuTRlbGvhOL2GPMY4U4ay4/4PtDlmYeohWjL3l7paYMDbNLEZeMfNntSRyevkGTdw4QliInAGZvnHcaX77A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8452

R290IGl0LiBUaGFua3MuDQoNCkJlc3QgUmVnYXJkcw0KRy5OIFpob3UNCg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAzLCAyMDI1
IDc6MTUgQU0NCj4gVG86IEcuTi4gWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gQ2M6IE1h
dXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgUm9iIEhlcnJpbmcNCj4g
PHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9y
Zz47IENvbm9yIERvb2xleQ0KPiA8Y29ub3IrZHRAa2VybmVsLm9yZz47IFNoYXduIEd1byA8c2hh
d25ndW9Aa2VybmVsLm9yZz47IFNhc2NoYSBIYXVlcg0KPiA8cy5oYXVlckBwZW5ndXRyb25peC5k
ZT47IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBG
YWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBGcmFuayBMaQ0KPiA8ZnJhbmsubGlA
bnhwLmNvbT47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc7DQo+IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVj
dDogUmU6IFtFWFRdIFJlOiBbUEFUQ0ggdjIgMi81XSBtZWRpYTogbnhwOiBpbXg4LWlzaTogU2lt
cGxpZnkgY29kZSBieQ0KPiB1c2luZyBoZWxwZXIgbWFjcm8NCj4gDQo+IENhdXRpb246IFRoaXMg
aXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5r
cyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1l
c3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQgdGhpcw0KPiBlbWFpbCcgYnV0dG9uDQo+IA0KPiANCj4g
T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMDI6MDM6NDRBTSArMDAwMCwgRy5OLiBaaG91IHdyb3Rl
Og0KPiA+IE9uIE1vbmRheSwgU2VwdGVtYmVyIDIyLCAyMDI1IDY6MTMgQU0sIExhdXJlbnQgUGlu
Y2hhcnQgd3JvdGU6DQo+ID4gPiBPbiBGcmksIFNlcCAwNSwgMjAyNSBhdCAwMjo1NTo1OVBNICsw
ODAwLCBHdW9uaXUgWmhvdSB3cm90ZToNCj4gPiA+ID4gU2ltcGxpZnkgY29kZSBieSB1c2luZyBo
ZWxwZXIgbWFjcm8gRklFTERfUFJFUCgpIGFuZCBHRU5NQVNLKCkuDQo+ID4gPg0KPiA+ID4gSSdt
IG5vdCBuZWNlc3NhcmlseSBhZ2FpbnN0IHRoaXMgY2hhbmdlLCBidXQgaG93IGRvZXMgaXQgInNp
bXBsaWZ5IGNvZGUiDQo+ID4gPiA/IFRoZXJlJ3Mgbm8gY2hhbmdlIGluIHRoZSBjb2RlIGJlc2lk
ZSB0aGUgbWFjcm9zLCBhbmQgdGhleSBkb24ndA0KPiA+ID4gbG9vayBwYXJ0aWN1bGFybHkgc2lt
cGxlci4NCj4gPg0KPiA+IEhvdyBhYm91dCB0aGUgbWVzc2FnZSBib2R5IGNoYW5nZSB0byAiIE1h
a2UgY29kZSBtb3JlIHJlYWRhYmxlIGFuZA0KPiA+IGVhc2llciB0byBtYWludGFpbiBieSB1c2lu
ZyB0aGUgRklFTERfUFJFUCBhbmQgR0VOTUFTSygpLiBtYWNybyIgYW5kIHRpdGxlDQo+IGNoYW5n
ZSB0byAiUmVmaW5lIGNvZGUgYnkgdXNpbmcgaGVscGVyIG1hY3JvIj8NCj4gPiBJZiB5b3UgYWdy
ZWUsIEkgY291bGQgYXBwbHkgaXQgaW4gbmV4dCB2ZXJzaW9uLg0KPiANCj4gTm8gbmVlZCB0byBz
ZW5kIGEgbmV3IHZlcnNpb24sIEknbGwgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSBteXNlbGYu
DQo+IA0KPiA+ID4gPiBObyBmdW5jdGlvbnMgY2hhbmdlZC4NCj4gPiA+ID4NCj4gPiA+ID4gUmV2
aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPg0KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBHdW9uaXUgWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4g
PiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1nYXNrZXQu
YyB8IDcgKysrKy0tLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWdhc2tldC5jDQo+ID4gPiA+IGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktZ2Fza2V0LmMNCj4gPiA+
ID4gaW5kZXgNCj4gPiA+ID4NCj4gPiA+DQo+IGY2OWMzYjVkNDc4MjA5YzA4MzczODQ3N2VkZjM4
MGUzZjI4MGM0NzEuLjJmNWU3Mjk5YjUzN2Q2MTJmYjFmZTY2OA0KPiA+ID4gOGMxYg0KPiA+ID4g
PiA3NWJmZDJkNjA0OWIgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWdhc2tldC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWdhc2tldC5jDQo+ID4gPiA+IEBA
IC0zLDYgKzMsOCBAQA0KPiA+ID4gPiAgICogQ29weXJpZ2h0IDIwMTktMjAyMyBOWFANCj4gPiA+
ID4gICAqLw0KPiA+ID4gPg0KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+DQo+
ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvYml0cy5oPg0KPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4
L3JlZ21hcC5oPg0KPiA+ID4gPg0KPiA+ID4gPiAgI2luY2x1ZGUgPG1lZGlhL21pcGktY3NpMi5o
Pg0KPiA+ID4gPiBAQCAtMTYsOCArMTgsNyBAQA0KPiA+ID4gPiAgI2RlZmluZSBHQVNLRVRfQkFT
RShuKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoMHgwMDYwICsgKG4pICogMHgzMCkN
Cj4gPiA+ID4NCj4gPiA+ID4gICNkZWZpbmUgR0FTS0VUX0NUUkwgICAgICAgICAgICAgICAgICAg
ICAgICAgIDB4MDAwMA0KPiA+ID4gPiAtI2RlZmluZSBHQVNLRVRfQ1RSTF9EQVRBX1RZUEUoZHQp
ICAgICAgICAgICAgKChkdCkgPDwgOCkNCj4gPiA+ID4gLSNkZWZpbmUgR0FTS0VUX0NUUkxfREFU
QV9UWVBFX01BU0sgICAgICAgICAgICgweDNmIDw8IDgpDQo+ID4gPiA+ICsjZGVmaW5lIEdBU0tF
VF9DVFJMX0RBVEFfVFlQRShkdCkgICAgICAgICAgICBGSUVMRF9QUkVQKEdFTk1BU0soMTMsDQo+
IDgpLA0KPiA+ID4gKGR0KSkNCj4gPiA+DQo+ID4gPiBJIHRoaW5rIHlvdSBjYW4gb21pdCB0aGUg
cGFyZW50aGVzZXMgYXJvdW5kIGR0IGhlcmUsIGFuZCBhcm91bmQgeCBiZWxvdy4NCj4gPg0KPiA+
IE9rLCB3aWxsIGFwcGx5IGluIG5leHQgdmVyc2lvbi4NCj4gPg0KPiA+ID4NCj4gPiA+ID4gICNk
ZWZpbmUgR0FTS0VUX0NUUkxfRFVBTF9DT01QX0VOQUJMRSAgICAgICAgIEJJVCgxKQ0KPiA+ID4g
PiAgI2RlZmluZSBHQVNLRVRfQ1RSTF9FTkFCTEUgICAgICAgICAgICAgICAgICAgQklUKDApDQo+
ID4gPiA+DQo+ID4gPiA+IEBAIC01OCw3ICs1OSw3IEBAIGNvbnN0IHN0cnVjdCBteGNfZ2Fza2V0
X29wcyBteGNfaW14OF9nYXNrZXRfb3BzDQo+ID0gew0KPiA+ID4gPiAgICovDQo+ID4gPiA+DQo+
ID4gPiA+ICAjZGVmaW5lIERJU1BfTUlYX0NBTUVSQV9NVVggICAgICAgICAgICAgICAgICAgICAw
eDMwDQo+ID4gPiA+IC0jZGVmaW5lIERJU1BfTUlYX0NBTUVSQV9NVVhfREFUQV9UWVBFKHgpICAg
ICAgICAoKCh4KSAmIDB4M2YpIDw8IDMpDQo+ID4gPiA+ICsjZGVmaW5lIERJU1BfTUlYX0NBTUVS
QV9NVVhfREFUQV9UWVBFKHgpDQo+ID4gPiBGSUVMRF9QUkVQKEdFTk1BU0soOCwgMyksICh4KSkN
Cj4gPiA+ID4gICNkZWZpbmUgRElTUF9NSVhfQ0FNRVJBX01VWF9HQVNLRVRfRU5BQkxFICAgICAg
IEJJVCgxNikNCj4gPiA+ID4NCj4gPiA+ID4gIHN0YXRpYyB2b2lkIG14Y19pbXg5M19nYXNrZXRf
ZW5hYmxlKHN0cnVjdCBteGNfaXNpX2RldiAqaXNpLA0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4g
DQo+IExhdXJlbnQgUGluY2hhcnQNCg==

