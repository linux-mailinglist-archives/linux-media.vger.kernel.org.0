Return-Path: <linux-media+bounces-11887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1166D8CF4B0
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 17:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 297F21C20B29
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 15:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1135717BC9;
	Sun, 26 May 2024 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LhqTNn2C";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Ruw09VBU"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C51BBE5A;
	Sun, 26 May 2024 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716735868; cv=fail; b=oVESNu3Nvd9A9rKsdknceB1S3WgjaxTwb44eE67b97aQRTXN1n5Kbs0KZlTCgaDiUDq3t1LqhdH2uIsjYc1/OnQ1fYVQiZsNr2Qv6GwBfUdOwOyU97Urh9Tel+Ir7RjmfuHI5jpZavJ+B0XMoB8ijXohJTi3aC1+D8X/hCFDXIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716735868; c=relaxed/simple;
	bh=6YcqYxniIGbzMpZ08c6pZiMtS4wE4aOGTHYw0oA8+XM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tlEA1Zs1V++Wv+hXUuXGAtjK9ioVZqh+Msj5UYXjRRRcQNooHfeA6acuaLso2XBbp9w0OyIcJCdGh8Kz8bKaF2p7yX3xcqO4ocL+HJT+1hxqVg4opV/V3+aTKuvRY/984X73tfQVUaO+ry/J4V7cc4JJij0JLI6r/KMy/nlzM9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LhqTNn2C; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Ruw09VBU; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 39530ca81b7111ef8c37dd7afa272265-20240526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6YcqYxniIGbzMpZ08c6pZiMtS4wE4aOGTHYw0oA8+XM=;
	b=LhqTNn2C2rSH5/aExgCXp9icJ3Z6zksqaHB4fcOG+8vz6Ofor1SGRmMyuNB2gGH4vxzbh9HscqbnA9iF2jg2pI5jcVU6ueFD/iQsYotqBeuypwghNBk2ytNCm7BD9viOG4e2s+Sx87mYsDULZC+3XVsy8iGx1Mr0emWw2Oa8qys=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:f4c81945-ac11-4d79-bd40-c2d60f9550b6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:fad1d387-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 39530ca81b7111ef8c37dd7afa272265-20240526
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 479988454; Sun, 26 May 2024 23:04:17 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 23:04:16 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 23:04:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epL+3x8vmRqlp/1C2DnzgF777VVgl4GO5jvkbdPjurfpC+/mr9ca8G8zRn8Npbcec6ROvRjzrYOBLPtr7Egqk5bsOsfVY5UVc2Zdhvz2h9GSNkYOWmRFumdPk34svNVPaPCPimg6N6QCUPdGVwolwWVK3SPyWx3PsDMQ3/Smi9cNzvu3Q/oMxpNx0wqmKdhLOhQXxOm22aSEXWQ8RDcTJmcKzTPVWm5k2Rm3/Ol+oOIFKfZxOYTjpsmQZhY7Ury1Ds09pxfw+wnHIYcnGW1ZRyl9ZlnUMVK7UXKvWD/tTRdaFQb7cogZK8SvajhogdadVV1U/wxUrmTgRhUnwHGuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YcqYxniIGbzMpZ08c6pZiMtS4wE4aOGTHYw0oA8+XM=;
 b=AMZtsUcT+9aNNMXbyZNF18Zk1sLgfAeYu0SyHQ43KjpnqHbQbaFDDzKhHxwHcVaDRS+9P0Jqn9pHUBFkfdxpuFRlW7n1Nuw+Fr6l3lTtXtuppiG8orfHigkWUDPq0bckCkyqeNGPm/BlG1db7TwgDFgkaCFGGxdQAdIuOSYgMTUPCBjBaHLlPA5H8gU870USBEZP60SAzFc+CPNSXxIaOEyzls6urNZxEgpaJADbo+kcDuHKenMbMcRSN9kFgN/Js4fj05/AbWbvwZj3yG4Wzapy5Ihdkic6yjtcAzj2dVrt6YUvdv39hZvzzs76LfVSmRJn2OWoxjfzGkdyKtD67A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YcqYxniIGbzMpZ08c6pZiMtS4wE4aOGTHYw0oA8+XM=;
 b=Ruw09VBUDWNl1/5SUA6ecqfPanAmn0nXzECzvp9yl//Lu30zyP3fjcJapF9i3W8WTmQkovdYsCV3abH2WQy0lx1dzaR1xT4daEn+EvdyoguRwKZGfvuIcAyoSqVSjwjBepQTqzkqHS0HRhjwpkO8v7EJgtjnQd7COxfyPtHtMxs=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB6667.apcprd03.prod.outlook.com (2603:1096:101:7e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16; Sun, 26 May
 2024 15:04:13 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.7633.001; Sun, 26 May 2024
 15:04:12 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fshao@chromium.org"
	<fshao@chromium.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Thread-Topic: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Thread-Index: AQHaTmLiMoH4NLRf/EqMjmvpP6g6fLDoqeqAgMG1PoA=
Date: Sun, 26 May 2024 15:04:12 +0000
Message-ID: <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
	 <20240124011459.12204-2-jason-jh.lin@mediatek.com>
	 <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
In-Reply-To: <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB6667:EE_
x-ms-office365-filtering-correlation-id: f68756ea-0d4a-4e6e-b399-08dc7d951a85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Unp6RjZCbnVHWGkzNGlSZFhOU1BkRE9EOXNMMVhXTjVoM0dRT1d3VUx4RGJO?=
 =?utf-8?B?UnJrRXEyZGZjQmtaTy9jcmdjcmRqdnlGV09oNVNGK0FHemQ0N0ZnSHBhNmFL?=
 =?utf-8?B?YzZMYjdndUduaTl0OXp4aitkYTFMS0tkUXZxMWJhcEowS3FEM0hTdVo5WFFW?=
 =?utf-8?B?ZE1SdjhQRDZCZXJnL01HMmg3RnVMaTRURjRnR093V1ppdk9KSEtGY054dUJi?=
 =?utf-8?B?c0hqWmdSekpKcWdWbVpUTmVIWFplSUQzVXhwZ2ZmVFVjdUtjYjI1dE1mdWxP?=
 =?utf-8?B?cjNOTjY4OUVVNU1FSU9MVUpGcjM1OUZ3NXRPcmcyODFtTDAzeFR4cGk2RFpI?=
 =?utf-8?B?c2lWcjZpNXlqaWxBdzU0TTlFalJpN1c2a21iSW5LZFd0enRaNTQvUGQ5cnd0?=
 =?utf-8?B?czliRTMvZHFCVDRxaE9mWVVNNW5lZkVrdlZGOGVobjBKeFU1OTF2YjN6RVBq?=
 =?utf-8?B?MjFqbWJTU1Y2Ty8yNTViSWtnbkZBSnJHdXp6WGdpZUZlNW5xbkw1M2lIWmt2?=
 =?utf-8?B?cy8vd3dtYzRkcXFEQUdoaGlIdEZleFd1Z1pCNG1FUHB3NUxTSjBkNW52OGZz?=
 =?utf-8?B?NzRBK1hvWWVTYTN0N21JSXNKQ3BrSElBRUIyVkZGc2JKc0ZlRTVTbi9ITERC?=
 =?utf-8?B?ck1HWTNlZzJGQ003RTg1YlNZZlRNYWNkVUdFRGFjR1ZpdndncXNhQUZ1RER5?=
 =?utf-8?B?Q25BOTZwaVZBbUJid2NCaUpSTjIzcitxUVVOWFI1TTlQWGtWamJLcm5xYUNu?=
 =?utf-8?B?cnkyTUdXK0MvaVIxRzZFZ001VHA3NmJCUHN5TFpMVXYwbWVDSk0xZEp2MGRC?=
 =?utf-8?B?M1V5ZGhoQVptOW5jM3Q1VlZmc2FUNjFiTy8vK0kxejIvZFdIQnZZT043c0Fj?=
 =?utf-8?B?SVNJY1EyUnFSL2JRVzVHT0x2UWlJenM4R1lGdGE2YzZoOU0wUjRuZDRONkZQ?=
 =?utf-8?B?SmNRWVRSVFNHbVJpcERqdUphZlcwM3RFN3p6d01uTmlDemNIVjRRSFlGRFZr?=
 =?utf-8?B?ZmozZnBBNXBlOEVWa0JqbHB2emxtWGZrV2lGeE1PT1pEMm1CV2VNK0VLMWlS?=
 =?utf-8?B?bFBwbi9pRy9tempKM1RhL3grZkhkNXZSd2c5NFIwaW1ZdjBHeDBvVW5pNFBV?=
 =?utf-8?B?d0VINjl3QUJ3UUR0ajRiMU0xazJESElEbktrMzQyTURIVG5KczUrM1FvRDRH?=
 =?utf-8?B?bUZUcWo4alNFb1pPV3RlZUQ1eUx6blRtcklsRHJOWHRuamtRVzFlZ2ZNVTBR?=
 =?utf-8?B?M1lDNjNhcEw2bmx2cm9yYndWL0lGdCtHdjlaRTFmNHY1bTVxa0t0NU1SQkZy?=
 =?utf-8?B?NVBvVjFxakpkRDNHVENPNlB3bnVuUldNa3EzQmFHTzBPM2tieEpEOStVdmhm?=
 =?utf-8?B?WjcxNEF2UkJ5Q1FqMkhTSmJzT2hBbDZUUmg3UlZqeW9BazBqODF2REhLOEox?=
 =?utf-8?B?MlJ1VG9POHY4Qk94V2F6K1pKdkt0bDFoR04rcExYaHlmVHpobVNOcUEvaTJN?=
 =?utf-8?B?Ukg3VmVhL1d0WHU2aThHYnhmbWlpaldmUkRSc3pZSGdidGRSY1M3VWJ0NFJN?=
 =?utf-8?B?Ylh0RE9CZmZtS2N1bHFNajlaVWFHOEt6V0FuU2JIZ2t5aWk2VDRxSnlMOWVu?=
 =?utf-8?B?TFBJcE1YbklOS29rbVJZZ0lUM3NId2NXNWtiS3duSkRBb25ZNVVpdXd0UjFN?=
 =?utf-8?B?TVlhd1FiOVBxYXQvL3JFZm02a0QzZmtVclFKY0pMNW1iZGpmODh6Zk85NHQ5?=
 =?utf-8?B?b2FCckZwbGhSL3BWb2MvRnpnYUZVZ3I5QzZyc0ZaMWFzTVhkVnR3MnZwUHow?=
 =?utf-8?B?cDU5RWptQWlSR0YzSjlPdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STlBalg3MXBzQzhmMFhPNERWYnBQYXRzSDZBK3ZPYkJMb241WFhWOTc2TzZr?=
 =?utf-8?B?ZmJQRUpTNzcxMjdqaFJQdXRmVGcweGxENlVLS2xUc1Bldm9QSnNhOE5kSlBE?=
 =?utf-8?B?Y0EwVUtMRXQxY1Q3N1J2SmZjZHZWTnphTFBWa1hBRVRJOUVxK2orbmozYWpv?=
 =?utf-8?B?SGhVM0xvR2R4M1ZYdGh6S09jWFVVY1ZRU0dpTnpMY0w4cHRrRnA5M1BYYlFF?=
 =?utf-8?B?bVR1dGNDV28wUlk4d29OUmhCMkdOcnNnekd4eEVPNFZKKy94MEwvM1lydDRJ?=
 =?utf-8?B?cEVtMGJ0UTBJMHZCWG5mSkJmUzY1R2tsSU5aRTZNMGNGd21qcmdNRmRTZ2ow?=
 =?utf-8?B?WjFWQ1lPZTZKM2pxOENHaHJMekVvTlpGWnJWZDdmZWUwQVRGaUtCWkh3Nncw?=
 =?utf-8?B?TWxKSWloSkY2SjMzRisrNTI5WUxPbTErTHZjTHB0R0hXdWZuWmxyQ0NqQUhT?=
 =?utf-8?B?ZU4yMStWWU0zZWN5ZFBtRjVkNmwvUDZxUFFPZElnVGhKMDJtWmdzZEZ5ZzI0?=
 =?utf-8?B?YUgzWXRqV3loMWpUQmw1cFNBdFd1Y0VMcC9WZHlBRHlsNDA0U2lCV2lwRU1i?=
 =?utf-8?B?ZStlTjU5OUkzMGUydVpxOWIvajdrQjRRUFc1SUozK3NiWk03RXhtRzdVbURw?=
 =?utf-8?B?eTV4VjNHak4wR09WaXhFaitMSC9zQS8wdmUzZllYMUpNbUNjTm9EeGFGcURs?=
 =?utf-8?B?bTJSQzRWRm5kRVRwSHZRaVdLdHUxZjU3WGN6bjRuS0ZRVFgrSmhJdGtqU1Zo?=
 =?utf-8?B?M2lSMy91MlBrR2k5a0RsRmZOL1ZUMGtHWU4xT1dGRTBGY203cW5IbitsNGU0?=
 =?utf-8?B?d0F6M2JoY3JsV0Nkb2hreG96N3IrUG52ZTBtRzgvR0dpYXByQUtUZEIvbjlQ?=
 =?utf-8?B?RjRFc0NwN3dGdW9TanJBbC9XRmZMRndaZ05GTnhLVlNkK2txT29SOG41UkZi?=
 =?utf-8?B?R2R5d1NpRit2V3BKUDBPVmhKNlorMWpTeVYwQ1EzNjJsOStKNHJnRnFJY21n?=
 =?utf-8?B?ckxXUVRpMnFQS3FtVWY5b1NnMjg4d2Z6ekxpK0szRC95YjJ6Y0NFMkNWaGlw?=
 =?utf-8?B?ZGhYMmJ3MUVKNkRVOWNON3ZEV2c4SzgzV2hYbEczMzlYcmxhaFlOLzRSWk11?=
 =?utf-8?B?alU0U0ROK0tUVXBCenFEbXFxbVBmTGQvRUVrMnkrUXdURTBLTkZkYTc1M2I3?=
 =?utf-8?B?T1NvVS92SDFEQmxFL0MvaWUvREdQTzRyUUdJR0YyVHkvNXFtbkFXYU9lTlpz?=
 =?utf-8?B?ZTQ2WVBCa2pOK2JzZlo4a3dJMjUwNnRLa1hpK0NjZDY2WFFMNFhRbmUzZW8r?=
 =?utf-8?B?U1FkaWlQUEVaZjRZOXNDZHlEdHFKbUZJYUt5RWsvY1JLdnZyLzNoSmk4ZnMx?=
 =?utf-8?B?TU5ROE9hc2pnU2VZbTUvMmZZTUJYNnhxV1dMZ05DQ3N0SU0wS25OaXBQcS80?=
 =?utf-8?B?dkRoVTFSb3ZSSEljUzl4VkZDYTh4YU9jSm9RNms3d0RmNW93d1FIV2JXNE1R?=
 =?utf-8?B?aFNmN2t0Z1luS3kySnlnNkY0cFRaUFJOL1o2ekRodXlIRnVNTlhQVFhOSlBu?=
 =?utf-8?B?c1YzbGxzN0tDMWtqTUdjNW1rOWpibkNwQ0YzUzcxb3U0VENvWk5sajAydG1S?=
 =?utf-8?B?aW45Z3FRM0E3VHdrVEtwZkMvMm9XalFtQllXdlo2TXhrNGoxQ2R2dTlSOUxx?=
 =?utf-8?B?VDdVckF4QnhINlpmK2xQTFM5WGN3T0FZNG45MEZISnNoR3NwNFBNSm1IUjBN?=
 =?utf-8?B?U3FNNTJKaHlFT21udnJWWmFzaXhFcmNIQklqZ1ZjN2I5bktzSmM1am9VUXc4?=
 =?utf-8?B?UXFnL2ZhYTVHNHo0TnpXUjM5WGxwWkc3L1hUWGVuVnRXdDFsOXhrejdkYVJt?=
 =?utf-8?B?TWpyeHdFOGRPYmo0bC83SHJzRDgwbjRmUDJjbHRaYmE0bWJYeCs2RWNlQkp2?=
 =?utf-8?B?ckxLeGdSRmNlSjduZ2ZOcXRvQTIwUFFTemt1QloycWZuL3kyZmZ4S1BrQmVj?=
 =?utf-8?B?YW45cU0yMlBjVFpib0didVJWS3dYUE1MY1hlOS83MC9aMG93T09pbUQ1UjdZ?=
 =?utf-8?B?emMybFphMFdpNjdZajQ2ZkU0bU9SN3FwcFNibDE1b3JhYUtGRmpRNm9PdVlE?=
 =?utf-8?B?STV3MlBaM0dsS2VRVlpWdTc1b1dGaFhZNnllYlJrY1ZYeVcxSjBIVkJuR0xU?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C35E577F20E5A41B68F583BC84EE9DA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68756ea-0d4a-4e6e-b399-08dc7d951a85
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2024 15:04:12.7911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ireoFN4HG8M5PFvU0V2v9J1Bwrxp72NenUpOajv9X+sTnL4tdSXEyORJY7l9e/qu2roao3VusdFsUciUO73zyI1iINAgJv5OPNBK0pD0bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6667

SGkgQW5nZWxvLCBKYXNzaSwNCg0KQ291bGQgeW91IGhlbHAgbWUgYXBwbHkgdGhpcyBzZXJpZXM/
DQpUaGFua3MhDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KT24gV2VkLCAyMDI0LTAxLTI0
IGF0IDA5OjU3ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gSWwg
MjQvMDEvMjQgMDI6MTQsIEphc29uLUpILkxpbiBoYSBzY3JpdHRvOg0KPiA+IEFkZCBtZWRpYXRl
ayxnY2UtcHJvcHMueWFtbCBmb3IgY29tbW9uIEdDRSBwcm9wZXJ0aWVzIHRoYXQgaXMgdXNlZA0K
PiA+IGZvcg0KPiA+IGJvdGggbWFpbGJveCBwcm92aWRlcnMgYW5kIGNvbnN1bWVycy4gV2UgcGxh
Y2UgdGhlIGNvbW1vbiBwcm9wZXJ0eQ0KPiA+ICJtZWRpYXRlayxnY2UtZXZlbnRzIiBpbiB0aGlz
IGJpbmRpbmcgY3VycmVudGx5Lg0KPiA+IA0KPiA+IFRoZSBwcm9wZXJ0eSAibWVkaWF0ZWssZ2Nl
LWV2ZW50cyIgaXMgdXNlZCBmb3IgR0NFIGV2ZW50IElEDQo+ID4gY29ycmVzcG9uZGluZw0KPiA+
IHRvIGEgaGFyZHdhcmUgZXZlbnQgc2lnbmFsIHNlbnQgYnkgdGhlIGhhcmR3YXJlIG9yIGEgc29m
dHdhcmUNCj4gPiBkcml2ZXIuDQo+ID4gSWYgdGhlIG1haWxib3ggcHJvdmlkZXJzIG9yIGNvbnN1
bWVycyB3YW50IHRvIG1hbmlwdWxhdGUgdGhlIHZhbHVlDQo+ID4gb2YNCj4gPiB0aGUgZXZlbnQg
SUQsIHRoZXkgbmVlZCB0byBrbm93IHRoZSBzcGVjaWZpYyBldmVudCBJRC4NCj4gPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+
ID4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
DQo+IA0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdl
bG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IA0KDQo=

