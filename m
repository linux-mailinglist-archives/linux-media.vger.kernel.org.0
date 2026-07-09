Return-Path: <linux-media+bounces-67189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PEYYMBbET2pBoAIAu9opvQ
	(envelope-from <linux-media+bounces-67189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 17:53:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 526C073326A
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 17:53:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=gjQ4oN4Q;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67189-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67189-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7615C30E8CE2
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 15:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A5A426EA3;
	Thu,  9 Jul 2026 15:49:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011044.outbound.protection.outlook.com [40.107.130.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049993019D9;
	Thu,  9 Jul 2026 15:49:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612142; cv=fail; b=BM7ZGEH0iz8yT6svPd/+FuRkE0d7d5gNgBBGuPMZlxqSuZ3dKDstXl20J9Ab3iC2JDsc9u1zP+P5c7YfVoc4ClUYKOcJmMGsqGLPNzZS8ppXfJpR9kkNsSa0mawBJvD8tRhJb7kJqr3Jb0tg+Wh0EgBski+xG7kBznVr8meL9+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612142; c=relaxed/simple;
	bh=93mgYucnzPgG4xJxLYADTtvWOSYApSaxvGh9W2xtzeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L6I9e6dOrx+Ac9fIMk7Yfia3ZpTXATfq2yoa2XvAShRP82ixfZ6GqvpV8teY96n8fB+/S8ktL5C+7Wlr3Gi7TXsBRahotbGgcpwRapYAXWdXv3zfJRSKKWkaQAAllFVurq7BXo1gobWYmpzOQAGEz471QQfr6y0HhC9KBvlFLiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gjQ4oN4Q; arc=fail smtp.client-ip=40.107.130.44
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCm2GriPcyEdZ0Y6cjVgAPSQLQ6GjZY+Jzrq5hcx89j8lD5TvYgr55aJ1FjL4hGyDXTbGlfh9MdNzVIftYxFxa7DsHmrUFD4Kuoe8oTfPN+aDxBh9IlQou379svIAYNdXfWft1/EeERmoWKLDMtI7/1uD+BZpUa7HpbqxVhyZeuCah2Zh23DlCI9g0ev5Me5EUuGY7kSNwGKjU3wC0xoSt3iIVBTkl3sESudGfo9tF66WDCv2lD/Lmu89wgRGTfisopDFL2wX2c+/3FpR1MoycVsGOrYUGzEqInzVQMAow0UOyxK4Ty85Xn3ZPbt65dZ0sCf+lBEO9Hbsv4lrvMGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=in84MNJ056J0Brua02VKCupPYCxcKTSD9B8CQgKzD1c=;
 b=WiGGc2XEiukO24260MdafBFxcsBE2WUSA992bxcULsGqgbzH6oZXE8IiHSPyFEL0kpg5Xp3TvwYUq2j0DRT/ypZgpPaVPbCONJC7vjzh/WOeu02ef061tq4oLjnOWIlKyzHrzF6gJYfpPAPY0KDSEeex0CW7OGvTSU8kV30QryMtY5gCaU8wfhMLopg/LXI6V32cvfOmMHnY3UKBsF3Q/JjOjrydo2Zq5N3bO2zIjBycpyceqsmS7bJM+oC9+co07wOchsYX32CZqoJKsMZ5MT/xMWpyCdKDGEoPw4dz1heyOxuojNA/xGi/xcScP62A+csRl+gdHCJw2j3E+dsJFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=in84MNJ056J0Brua02VKCupPYCxcKTSD9B8CQgKzD1c=;
 b=gjQ4oN4Q+3oBhY/frtDZBsbK1E6bp/qNQwGHWy3fXl2R/NytBoBAkgEkZB06cx9kcBry9nUNNy5w3kXLzVCX2C+zq89Lltzl7kEiT4AfNhaiqGzpR08S56CsoHOmAS1iK0TwD9APlYJu1SmMevRwvOGc8z8sHg5tue6UaLwP4kuXT65IcFsu6VNNyPwSf33il/2aubbsEvpqP9jSeVXGCjY6KJXpaQQr4QHkSRVaYLGF//eQZDSc16sD3cgfbI6aCI+GDgsRibm7VgIFhEhDAw3erWWIDHvedXJzv35GxcJCcR8wztvdqCDfDoxn67RKRSe4Hsana6pFn+KOoP1s1Q==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8612.eurprd04.prod.outlook.com (2603:10a6:20b:427::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 15:48:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 15:48:57 +0000
Date: Thu, 9 Jul 2026 11:48:48 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v12 4/6] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
Message-ID: <ak_C4BCzekUIdBwc@lizhi-Precision-Tower-5810>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
X-ClientProxiedBy: SA1P222CA0167.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a4ad449-bf10-4810-0e07-08deddd19619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|19092799006|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	YbttoWzmymMkYesr/m6isMIGOTJ2sVPrVQ3RYreDUGj5zJKqyh0FGtUYni5rPF1WnwFZCy7OGT3n0vQQ6kXpVqwGDBg4y5NeSvVj1RlK/3uo20Ov/3gYbvRsuvOdVeObK2n9ndkJdGoRO0ZJkikLXiRTL9Qcz032i73MkBIihKpm5Rz3JQduLOUbSAnB5s3tnDOOIVP90n7kQX2cMCC8XRhThah/fVkOdl65iJ5aSHYA5Tvj6I9P7w0DSKwmlxIKZeaWfLHwP1jbg30MEsdqUtK4rfj79UQbi51lP6MJEmRH6b4xTy47F3M5TkEWhz5VgRGwtYD38ZK15MotB/Wn3SPBt/LnX1oZe3Y1g4JtDy0R2ICBQBBPAZjU1m2BM9wuoncdRZ1gUYqEJxZ3G7JEzCS/rFmttPEQpDhzcAo3MhlWD0mdfOHkj741R9A/NeIhVuU8ZRAlc12g5hjtiHd76EMCifMmzjGbAk82z5Flk/mxI5MtNHXUVGS0xKCrecUVSJj1a5gXgWwPJkkkkS/TydlN9LMfkJmJ4B1Fc96rZ/8zZ08YI8AM/Dnt36l7HNCBF02AzEUetvY8WGZ4XYWIrrar0grtt6nPfMPQYnhDDGsOgLz9B/HK+/QQAq7ICa4Nbg/Zm0Up9X6orukYiTkYC9EcJyKevW9wKdDe9GhTDbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EB0f1eQqiEvQY3ltGGWNRbybZZne8fCASzdxdW54YkVohVR3zFYUoCFftXuB?=
 =?us-ascii?Q?/ZccCd7KgJ6sdHAuDyF1WYyO2orajRiSRkuJj6RXam0Vms24Wbc7nUkyuOiW?=
 =?us-ascii?Q?M6bjXNcxHDqcWR/toqPFVIJCodCb3A4hD9mIjZ/vxA1PVfO/RlOCknUqUyKs?=
 =?us-ascii?Q?oBlbNF9h/HbvswkIah+766/wCv8ooGOWBvcZo/oUp61OwBvAZbFjN80mPgBX?=
 =?us-ascii?Q?ufCpVkPZJUmVXOItMcYPYKLoFJncEGy2v4WYf78hgnYK6iJQSD+DxTBMG9mJ?=
 =?us-ascii?Q?XAKDG+cA+1wok90Eod5iehc3RTIeogR8rSy1RErCNCMif+Ptlg5fgN/S2Aqf?=
 =?us-ascii?Q?1R8yII530Y6gSRtvzO+pwarYqOkcP2gYygYIQa4AVxN/ftOrKyyu40Qlg8Zq?=
 =?us-ascii?Q?MQD0nF7A9iGAnzNdnNO8tThDTEj8jHWlyQW18L6VCCfrlm/iKxwtU2MeIP8M?=
 =?us-ascii?Q?tALfz5gxIUWnsQbr1rRFnvdKn9FdzWQqjDL0ENnbboE2aunVZoGFJ9BdzZFD?=
 =?us-ascii?Q?fvCdL2kHsEwelsCn2uRGuEri/G75u8yn7+CburGF3oHpxFfCjVtzRa87nOF4?=
 =?us-ascii?Q?WSiPtmFPuYYsy9X8W3yHq/sDT0a4u13FVeUvExesxfumL+Wjtn2h6uOAv9MB?=
 =?us-ascii?Q?qC3Ul2ZCQluS77/MaAdajFxZTxGa9wRLkYKF4ly7cL2LvTncz/wd4yOZPFpK?=
 =?us-ascii?Q?OcYxOvK1mDJp7XoR8FUymQRtTM3rAssRZBAO0tnTWOxz+TdEow7ddpkXYE0Z?=
 =?us-ascii?Q?siaYyxPwRERQ+T22I6VxnKPiGqyYlwxYF2rfrm6Q6mWedpw0qYNtECo0zRkv?=
 =?us-ascii?Q?pyfl8sfWTDb74tTYevzf9YSol9wkzVRkW1WF06GTU/bOHTHPvojsPM4Q1tOv?=
 =?us-ascii?Q?EX4SFYsDwBEry0Evc+hTf/cL2n9jQ6FvqWumG5U2sElyPfPMihMuA7BYyP24?=
 =?us-ascii?Q?nJGAOdaxL2wIXG4jMIcTxh5CnxWE8DVucGpTWDjg/FodiBEm8resxySiyCQd?=
 =?us-ascii?Q?twxWJJGbfoGrEozR0pS/AOwH3q/jFtJSED0BCRpcIgILts33vH+dh8NeuUZK?=
 =?us-ascii?Q?pZVbljZb6WYgOJd4tzUFem/2bQM02mC4ZqnA7PtCvCxbGDIMs5LyDddn9cSQ?=
 =?us-ascii?Q?LOk4AKBNViQTW7evys98tTwueTSHiH9TZZoOxNs6HiK3yDVmiOEDwlqvmTqi?=
 =?us-ascii?Q?yHiqZbwEghDTsEtQgy/81trxWific8DIniwuhL3QR/HntqnD/6enTSZqEF/x?=
 =?us-ascii?Q?o6Rb9AGP24S6LwHfoMuYiaNu3TxUeCxEM7xfOxStYGYJXvGCXLI/Gl7tKtb1?=
 =?us-ascii?Q?uvfxVuVKuOOuypvnDSgdlvPGx/IFe7FBX0f6ashN8ft1HwbIYDw+xlIr43ZJ?=
 =?us-ascii?Q?Z4odz45SBcj1KKkMl4JmnCva/FNrnWwRR3Ya8jRa2zbSj2988ilrj995zuxz?=
 =?us-ascii?Q?XEa3zJ0biCB4hadSaYo/m5rKxQ5QsoCL3b+q0T7Qz8hgfes4gDPI52aAP7et?=
 =?us-ascii?Q?qR7E8xZYmda5eaAuNfEHLALaUqzg/0f2W92JGOkOJqe7+bHBvEh/1UuMvCJs?=
 =?us-ascii?Q?u2keqEDDlG7ITyxZSDv2FDY/AciN4/Bxfp5FOwYRrpic8RfqlSoKSFDmkMMd?=
 =?us-ascii?Q?GVRZoB8GxCVs4qat9RL3TLBXVnKQBFwsiQ4rdpnxB0koV2S4vDBofjPEM+B0?=
 =?us-ascii?Q?BaFweTGq0DfKx8aXrwf4LZC8HeMJPvQd2QIG9ymN8boByaPQpiLXTJTTg8ZV?=
 =?us-ascii?Q?TWyoPU1YzwaCibjS+wwuIzpUWq0vS0ji49IEn4p1c/3XzFEDdPXZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4ad449-bf10-4810-0e07-08deddd19619
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:48:57.1610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEpvGjcs7uZ81xd92pggZOnDoawgjfn/1Ilm2d4njVNhAFCzt5T2E0HwxPDdASIz4n4rjRXcOAEWNgVL4U75XhHjHEpaxJUlPpqPLe+yGqjMUsYQNl3Im62gXvoN0DI1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8612
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67189-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email,lizhi-Precision-Tower-5810:mid,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 526C073326A

On Wed, Jul 08, 2026 at 01:06:58AM +0100, Bryan O'Donoghue wrote:
> Flag which SoCs have legacy - builtin PHY code. This will be useful in
> subsequent patches to inform PHY bringup logic if legacy bindings are
> available.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 95e655a8b6aa0..e814a96953b1b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5512,6 +5512,7 @@ static void camss_remove(struct platform_device *pdev)
>
>  static const struct camss_resources msm8916_resources = {
>  	.version = CAMSS_8x16,
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_8x16,
>  	.csid_res = csid_res_8x16,
>  	.ispif_res = &ispif_res_8x16,
> @@ -5523,6 +5524,7 @@ static const struct camss_resources msm8916_resources = {
>
>  static const struct camss_resources msm8939_resources = {
>  	.version = CAMSS_8x39,
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_8x39,
>  	.csid_res = csid_res_8x39,
>  	.ispif_res = &ispif_res_8x39,
> @@ -5534,6 +5536,7 @@ static const struct camss_resources msm8939_resources = {
>
>  static const struct camss_resources msm8953_resources = {
>  	.version = CAMSS_8x53,
> +	.legacy_phy = true,
>  	.icc_res = icc_res_8x53,
>  	.icc_path_num = ARRAY_SIZE(icc_res_8x53),
>  	.csiphy_res = csiphy_res_8x96,
> @@ -5547,6 +5550,7 @@ static const struct camss_resources msm8953_resources = {
>
>  static const struct camss_resources msm8996_resources = {
>  	.version = CAMSS_8x96,
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_8x96,
>  	.csid_res = csid_res_8x96,
>  	.ispif_res = &ispif_res_8x96,
> @@ -5558,6 +5562,7 @@ static const struct camss_resources msm8996_resources = {
>
>  static const struct camss_resources qcm2290_resources = {
>  	.version = CAMSS_2290,
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_2290,
>  	.csid_res = csid_res_2290,
>  	.vfe_res = vfe_res_2290,
> @@ -5571,6 +5576,7 @@ static const struct camss_resources qcm2290_resources = {
>  static const struct camss_resources qcs8300_resources = {
>  	.version = CAMSS_8300,
>  	.pd_name = "top",
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_8300,
>  	.tpg_res = tpg_res_8775p,
>  	.csid_res = csid_res_8775p,
> @@ -5587,6 +5593,7 @@ static const struct camss_resources qcs8300_resources = {
>  static const struct camss_resources sa8775p_resources = {
>  	.version = CAMSS_8775P,
>  	.pd_name = "top",
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_8775p,
>  	.tpg_res = tpg_res_8775p,
>  	.csid_res = csid_res_8775p,
> @@ -5602,6 +5609,7 @@ static const struct camss_resources sa8775p_resources = {
>
>  static const struct camss_resources sdm660_resources = {
>  	.version = CAMSS_660,
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_660,
>  	.csid_res = csid_res_660,
>  	.ispif_res = &ispif_res_660,
> @@ -5613,6 +5621,7 @@ static const struct camss_resources sdm660_resources = {
>
>  static const struct camss_resources sdm670_resources = {
>  	.version = CAMSS_845,
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_670,
>  	.csid_res = csid_res_670,
>  	.vfe_res = vfe_res_670,
> @@ -5624,6 +5633,7 @@ static const struct camss_resources sdm670_resources = {
>  static const struct camss_resources sdm845_resources = {
>  	.version = CAMSS_845,
>  	.pd_name = "top",
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_845,
>  	.csid_res = csid_res_845,
>  	.vfe_res = vfe_res_845,
> @@ -5635,6 +5645,7 @@ static const struct camss_resources sdm845_resources = {
>  static const struct camss_resources sm6150_resources = {
>  	.version = CAMSS_6150,
>  	.pd_name = "top",
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_sm6150,
>  	.csid_res = csid_res_sm6150,
>  	.vfe_res = vfe_res_sm6150,
> @@ -5661,6 +5672,7 @@ static const struct camss_resources sm6350_resources = {
>  static const struct camss_resources sm8250_resources = {
>  	.version = CAMSS_8250,
>  	.pd_name = "top",
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_8250,
>  	.csid_res = csid_res_8250,
>  	.vfe_res = vfe_res_8250,
> @@ -5674,6 +5686,7 @@ static const struct camss_resources sm8250_resources = {
>  static const struct camss_resources sc8280xp_resources = {
>  	.version = CAMSS_8280XP,
>  	.pd_name = "top",
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_sc8280xp,
>  	.csid_res = csid_res_sc8280xp,
>  	.ispif_res = NULL,
> @@ -5688,6 +5701,7 @@ static const struct camss_resources sc8280xp_resources = {
>  static const struct camss_resources sc7280_resources = {
>  	.version = CAMSS_7280,
>  	.pd_name = "top",
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_7280,
>  	.csid_res = csid_res_7280,
>  	.vfe_res = vfe_res_7280,
> @@ -5701,6 +5715,7 @@ static const struct camss_resources sc7280_resources = {
>  static const struct camss_resources sm8550_resources = {
>  	.version = CAMSS_8550,
>  	.pd_name = "top",
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_8550,
>  	.csid_res = csid_res_8550,
>  	.vfe_res = vfe_res_8550,
> @@ -5715,6 +5730,7 @@ static const struct camss_resources sm8550_resources = {
>  static const struct camss_resources sm8650_resources = {
>  	.version = CAMSS_8650,
>  	.pd_name = "top",
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_sm8650,
>  	.csid_res = csid_res_sm8650,
>  	.csid_wrapper_res = &csid_wrapper_res_sm8550,
> @@ -5729,6 +5745,7 @@ static const struct camss_resources sm8650_resources = {
>  static const struct camss_resources x1e80100_resources = {
>  	.version = CAMSS_X1E80100,
>  	.pd_name = "top",
> +	.legacy_phy = true,
>  	.csiphy_res = csiphy_res_x1e80100,
>  	.tpg_res = tpg_res_x1e80100,
>  	.csid_res = csid_res_x1e80100,
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 93d691c8ac63b..698694d3064ea 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -107,6 +107,7 @@ enum icc_count {
>  struct camss_resources {
>  	enum camss_version version;
>  	const char *pd_name;
> +	const bool legacy_phy;
>  	const struct camss_subdev_resources *csiphy_res;
>  	const struct camss_subdev_resources *tpg_res;
>  	const struct camss_subdev_resources *csid_res;
>
> --
> 2.54.0
>

