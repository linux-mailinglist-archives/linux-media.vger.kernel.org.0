Return-Path: <linux-media+bounces-23285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0149EE4F3
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56668281CAE
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36951211A1A;
	Thu, 12 Dec 2024 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bMQKDBYD";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WQ7NHova"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143821C5497;
	Thu, 12 Dec 2024 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734002714; cv=fail; b=E9299m+Ogt+J2ochZ/mUfK1sUFaN7Orn6/F8ECTnAhPuVTR+iytP1A8q2V2HzPC7yCR6f99eNEaztYWvuU2iUpO2+roM4iEXqzO/7ZCbQfk8i3IdwxO4gTSmYDKZPpBvcVNIu8QCDXcCCQxe7Hn2HCybLZF006lMnXQzI/oC1Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734002714; c=relaxed/simple;
	bh=VW5fSrw+9VRVX/PO1sNLi6C2dU4PK2H/ixQd/VoIupA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GIFmtNbbfqOfKpOZTKzPgIwhqTRqxZNSNW5oUudV6OabhvCrDvlbq8O2QbekXQohoP/+404J6heRBtVcK9oNIoDUsWcDowF8ip+FF1QuBHSTwF21X/GVuXO3YHr6wxHT0AgvfbF+YPNoRqwLugExxnzASMEgwdrWTqKxFXo0RFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bMQKDBYD; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=WQ7NHova; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: bd529792b87b11efbd192953cf12861f-20241212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VW5fSrw+9VRVX/PO1sNLi6C2dU4PK2H/ixQd/VoIupA=;
	b=bMQKDBYDmUfCBadADyd3Eoi0glFxoAFn4vehOqAOrCEECLqy/yUTMl0iKi4vg2mqDhSL+MGo2ruEtv/k6PawKHh2EHQmVvI281lKuuZlhOyE6Du0xXsuPwsDq42+TbFpJx0DYPDSOwqAYkbzgqKn/0ctGKZSVTjnfNcvtXvjU5Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:82867fe3-5f4b-4159-b8d5-3a13e2cd97c9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:f5f16928-d2eb-4de2-b5c9-495d1bc17256,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bd529792b87b11efbd192953cf12861f-20241212
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 288686808; Thu, 12 Dec 2024 19:25:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Dec 2024 19:25:05 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Dec 2024 19:25:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXo5VEigqcnLVYkzjebYsWO+/DMF7022ARtf7I7Su947WZrU2AFXpRW2DV7IJRZdxRdYQwf+6Dx0m317HhMSSP08mWGoVLYcHbrcf24Fzyh5lxtOYJXY6bDL4u9d47mYpAAQQRRh5/fkV3hbNK6SbMkUnFYHA2P6A3yqJ4yFo7BBoKoGKTqYMYFE2VHXF1q6KEH40zvcjH39vXC+OCbRDShaTLxGhlQkoMQtODBtzomjkFkky5MSYpQ1cAo8Bj6DMAyb3WwuQf9aWloTv+R1FsnnJG+PYYUeSCVGF/V8z1KycFVyITCTiOAVsDRmWfylYUh+7pXJh2THcoQaMXn1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VW5fSrw+9VRVX/PO1sNLi6C2dU4PK2H/ixQd/VoIupA=;
 b=fjl6MyFPwFu3v6TfWv0JgU2cD1I/e8C0jFpIGrlNgVmo54eKIOE1rVsAoWGgjmmTtTyA/r//df9y1BWtX876ex8m1mO+gY5IHH4PPO7txS/hEHiJVdfwM41y8YAoajJ+LcNbQU4akKjWAUHtASgjjo2kvuWyBTpRXtYD3TA/unus8kTE9cIGoEp9GQrMlh+cVA4W9EtbtPk8oIX1IjpMoWmErIvTT24VSxokOmI/LiDF7MejURko/zgGXOyUcbHLn1CHAC+SmdpbUZ7/ih5UdmV+874QDsm7theO5NC+Vd2R4J0TPiYZsSn3U18HyUk5KCp5ZQWXKFqtcpkOOGiwJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VW5fSrw+9VRVX/PO1sNLi6C2dU4PK2H/ixQd/VoIupA=;
 b=WQ7NHovanrWUBmajJyxxAGHfFXkcCeTZyIUAAOeEs66Efuma5l6Y4w5k322tkDMqa5DGrg1i9L6Rfphmci5wIUOj8k+/9SULbNyRl6Q3wJlUuY6MwWytIQ5rMRLBwXo2NEvqGUUTZNjiMSulcuqnnd197z57WhtnWSKPVWEsYcM=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB7748.apcprd03.prod.outlook.com (2603:1096:400:427::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 11:25:02 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 11:25:02 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"robh@kernel.org" <robh@kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
	<Xavier.Chang@mediatek.com>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: mailbox: mediatek: Add MT8196 support
 for gce-mailbox
Thread-Topic: [PATCH v2 2/8] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Thread-Index: AQHbS3wkCctCpYkZuU6w25zo1OjrvrLgyhqAgAEuZICAAD0NgIAARHIA
Date: Thu, 12 Dec 2024 11:25:01 +0000
Message-ID: <421a353d33b3cb2800fa7ef022553a4f05cb2ca6.camel@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
	 <20241211032256.28494-3-jason-jh.lin@mediatek.com>
	 <yhfxpflyumevs66sdwgiiyuablpfxfxw3e7ybrxju7ssicmnu5@truuiuvxlq6e>
	 <64326843358d450c9172f3dea1c85e7422e20430.camel@mediatek.com>
	 <8cf7e03a-7994-4dd5-b496-e00b4827ee22@kernel.org>
In-Reply-To: <8cf7e03a-7994-4dd5-b496-e00b4827ee22@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB7748:EE_
x-ms-office365-filtering-correlation-id: c4fe3cd5-0302-4610-ef0b-08dd1a9f9e99
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bTJtOUtTTkFFYTl5WVRVUldOSS9Id2VnelltK2tUZWgvUGtqdHl6U2kzSGJD?=
 =?utf-8?B?M05STVExbXhHblpEa0tqbEFaYTIxVzd0NXNUd3prQVR4SHBMM0RMUC9RKzFI?=
 =?utf-8?B?NXJGQnJWcDRGQ043N1pSaEcvaGNHRzkzanFHV1dzRnJKRVU4cU82RkJtSENR?=
 =?utf-8?B?UWxLM3RiKzRTcCtJY2RhNC9idFZ0UmhmSmFKNmhtSjI1dy9uc1BLRVUxN0l4?=
 =?utf-8?B?N0hyMCsxOUk2eDNSM1hiRGxmUDlLVHVxQ1gzWEE4dnFXQy94SVo0YVV5RFUw?=
 =?utf-8?B?OFRrbnU5Vis3dGdKYk0yUHRYMUQ5aGwyajcxSFVJbmdqV2xCWWdaQmhiWDl5?=
 =?utf-8?B?LzRxK0VpRFpqaVlUM245Q3AwSTBoMkZEOHdQaHdFUGxqdEFuS0o5cW82UWFr?=
 =?utf-8?B?MmhDNTVaVFU1UlUvZnE5UWFCV3R4T2ZvV09IVG8yZ01XNGV0MnV6VG1hUmJr?=
 =?utf-8?B?eFc3YWNzVmQ3Q2tuS2J6T2ZoSWV1dFY3UTZ1TlpQVDhVakxMWXdjRzBZaTJ3?=
 =?utf-8?B?Rml0eXVmTDF2bEIwVGhRU3ZrUUc5Q3I3Sm0wT0I0UHdxbHREUE4rRDd5MjBi?=
 =?utf-8?B?aG0zZFlLQTRNTCtCZi9Xd3plZER4SE1hdWVSb0JVYml2QVVPUXUvM3o2RURp?=
 =?utf-8?B?UWdXZXNqV3NISFp2b1VRcGRaU0ptODVQSDRad1J2TlNONDZKSlZyeVJtVktZ?=
 =?utf-8?B?cy9Pbms1U0F6YjA4cDlITDhoSGloQ21maEoyWlY4dzEwMEhXTXczVUNvVjQr?=
 =?utf-8?B?Z3VOYW9GNXlDYXo1WDVRSEY1bTV4VklDdXErQjFMNjdWTnNnMHNhejJIK3RG?=
 =?utf-8?B?R1IvRjdjbm05Rng2NHhxY1A1b0xneVM5YnJRRDJpekZrOWZkZnZkaHMvYU1X?=
 =?utf-8?B?S0d2MnpENVVybC9rTjRLb0xHWmZRcWFpVGdWNzFhZkJzWVBZVXg2cUZrUmxh?=
 =?utf-8?B?cHAxQTFCUW1MQ25vd0YwaFk3QVR4SWorbVZOdE5lUnZUK3pEekFQRFBVRWNm?=
 =?utf-8?B?VnBzWEY5UDJ5aHVDaHRRWHVNNWVCRVFlR0xiS05xVWEwUzM4b1ptWmE3Ykt6?=
 =?utf-8?B?MUllb0RBRk8xL2ZpcDBxWklpRVNoN2xjNW9sdVprMzhrdUtoY01SOW8vWnZR?=
 =?utf-8?B?OWpocXd1bXRlYTZuVy9rMlcwaDJERWhtWmQ2WW9aSGc2OVhhRXZiY29DQWpx?=
 =?utf-8?B?N2dBbDZaOU9tNURnYkRXc3AvMEM0d0M3U1hrbnNnbU04QndlL0llWU5KUmlD?=
 =?utf-8?B?ZHVUb05UK1hudVRDOVVORG5USTZVWGdHeHg3eEgxVTYvZ1JQTzcwdHNVclh0?=
 =?utf-8?B?dFlXa3FvMVJwSlZKK3lYWXFNNFNIWDdZbE9KMG41SHI2VzVaNXp0Y01SS0Rh?=
 =?utf-8?B?aThSQmV4b3VBYU4wNWZ6NUt3ZGkvNmdaWTNpQU54UDZsajFONkRhWTdKZnF3?=
 =?utf-8?B?cnZKTERKakZsVTh2S3E0emFCWEEvN21BU0Z1TnhLQUZpRnNmMC9ydmRXanVr?=
 =?utf-8?B?YUdlWjFrUmd2cUhZa2hnM3YraEVoQVBrTXN0MW1WKzdpWS9uR0JsTURBUlpE?=
 =?utf-8?B?VUlraVhmR0NuREJLRUpDZExhZ0VENDcxSGhpcXVsOGtuRjFoOEpzdXhzb01S?=
 =?utf-8?B?YXRQeWdGMmlhTUtGQUU1V09SVitDTWhmdU9hdUJndW10UGIvT3JteEt4M2Nl?=
 =?utf-8?B?R0UxQjJCVGtrdXJ5UnhqY2tvMGhKZnFYUU9xZHpvdnFsRnAxQVVXck9mWGc5?=
 =?utf-8?B?N2I1UjBhYUlmNzl6Z0RDR25uMERhdlVKTHRycEYvQUdKUFg4MkJuRW9kSmIy?=
 =?utf-8?B?WWY4TGFZZ3gza1g2aVRZNFBOYlRlMGpvdTBXN1RrMmtQcFdna3Ixb3VVM09D?=
 =?utf-8?B?SCtqMHNjNzAvaHpRNHBoUmpXbmJLenVyZFdhd2FQTFdlVlF5RW9GelVaQTZO?=
 =?utf-8?Q?ccOYVD92iR5AuULFngIChioG/JRD0Axg?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDBEbjV1U0t1YUtZenVRMWJITUo3UmtuQjdWMGJja2lZMjhPL0RGTTRHM29s?=
 =?utf-8?B?OWc0eXpDUG56WmJYSmhJUWJINUhyQ1FzR1VMTXRqSHl2QU02RWd2cS8ybTlk?=
 =?utf-8?B?N1g3SkpNSXorRk43MUR6c3kvTlZhN1I2ZkE1d2t0MFhCRTltbUliZklFZ25q?=
 =?utf-8?B?MExQR3p5RE9OU05LdURRQ09wYWhEc2VjWEJkVlVjblpIV0V1dXpwYU4vMmFC?=
 =?utf-8?B?eC9UbHZEZEVyRmFOL1pxaGRrQ2JhSU1Dekt2TFhxMEkrcmgzZnRQM3ByM3lD?=
 =?utf-8?B?aWp3R0RpQ3pGVDZMSWlSbTFSS1FCWDRoUU5qcWlYRDJlYjk1SzZWVFB4bXE3?=
 =?utf-8?B?NmlWUVRDakRFODVGL0J1YnVYMW93SitFNHVWTVQrSTBsN0dtVW4xSmhtWWkr?=
 =?utf-8?B?dFJ6c3lKbUJXc0VOT3NQQjZlSXBobnQxeFBxRlBXRlRWZHdKVmY5QmJnTkYw?=
 =?utf-8?B?U2hPZmdPSlEzN0lUamFYd1VpWW05ZXZBeEJEeEROam55bk5mK05aWEhBZjVV?=
 =?utf-8?B?dnEyTnpOdStkV3UxUVNobjZEMEJIcUJ3V0VDbkFMck4xY0lOMTdUazJ1QVQy?=
 =?utf-8?B?YVk1OUZ0YUpnNnJZbkJSWm85TGNnNHZ2QTR3U2JFQ3FKUHQzTWJlbW5qNmFq?=
 =?utf-8?B?SXF2dTlNS1d3MlgxOGRrUjVGaTZtQkdMSWFzekVURDFCZUY4L3lncjE0UE1l?=
 =?utf-8?B?Z2o4cmUvQXdoVUlKOFhGQlpnTi82ckNDRkhsVWNmVHpBbEVkVFZoTHlLcmdU?=
 =?utf-8?B?YUVkRElxOGJPSjZ5cjF1dC9icDQ4Um5JaWZFcjB1MVYvb1htVmNub1hoWTMz?=
 =?utf-8?B?Q01YUTBaV2V2ak80UUkySTBEbG9rbXRIN2dsb0xOQ2d3Y09lV0NOQmVCNWxs?=
 =?utf-8?B?ajREaFJDN1Vnb3p2ZFRiVjVBd3NUOW15U0FCTVROcXJjNFQvNnVMaUk4dmhv?=
 =?utf-8?B?TndDM3VTejNFekZrbFpQSk5IMFlNWnVMTlZyelB5SmRRNHJRN2xtTkdGZUsr?=
 =?utf-8?B?OVBtRnNmVnhiNU4yNytEaGlyekRUeUxEK2VuK1NBamQ0cnBqcXl1UEJzamFV?=
 =?utf-8?B?K3hNR2tyYjZrSzVBVWczS1Z3U0Y1K0V4M3FmTlVUdHNURWtZaThKczBVZ1Iy?=
 =?utf-8?B?c204MHJXOEhJMGU0QStDVTd1dnVUYUZzcklFUFd4WkNVckh5dVZxaEZqWitn?=
 =?utf-8?B?aE1XYXNGWGVjVlBqUm42S1lWQW83ZkxpcWNGY1M4WW5FVTd3YW9WQi9QeUlE?=
 =?utf-8?B?Q3ZBbSttWWJKb1ZhM1NkNW9OV3BFR1BuaFhzRGV1SUlEM1pJWVRPdTZnU3lt?=
 =?utf-8?B?VEJFbVJkbWRsd0dUdGYrL0djcHBieWx0QXRueUVXcVJPTUF2YlV2NU9ob2p5?=
 =?utf-8?B?UUh1TStuZkJtY3pZT1VscG1menJ0U2dzbm9Sa01MU3g3NW9KOWpWVUxOVnM5?=
 =?utf-8?B?Q005RTFKRm5ZT082VW5aMGhOTTN2cVh5TXB4NzdPckNBMlpYOFFaVnRYZjRT?=
 =?utf-8?B?SW1NQWtrbk5YN04xWXhCbjhsSXBpY2hvSHB1eWFGd0daTkZVeW1pdWx4Y0c2?=
 =?utf-8?B?Tk0vOVR1ZVdSNE5PenpkcXViakxhV2VHRldYeDA2N0pGSWtKemVtOVBsSm9w?=
 =?utf-8?B?QVJ2Q3l6a2hjL0puKzNiRWhLUGhYSUJHRmhVb0huRXFJZy9BeDBTWFJvUUhE?=
 =?utf-8?B?SFpNNmplYWUvem5nb3FPL1JJN1JJTW85eEN1ajZHVjZCYk80SWtrL1ErRTZG?=
 =?utf-8?B?Y2lYcjd1ODczd2UrNmZQTkh4SHN3WDlKcEh2cEpDUDlKUDhQMHV5SFhaMDA2?=
 =?utf-8?B?NDJGZVBrTTdWd0dCcGR3aDNEazNYckl0OHpFK0dESkVOb0dBbVZFQnZWV1h0?=
 =?utf-8?B?b0hpa1hRNmcyL2xQbDlKUFhuZWlJYW9yTlczRFhhby9RZ3VNbDJwclhjdzdI?=
 =?utf-8?B?L1F4WndyY2grM3VsTVlHQStQQ0JoVWhTQUpzbm9KbzJHZnFKZGdSWjRJd25F?=
 =?utf-8?B?SEhyQzlnU25ueUxiTm9kQ1dPSnJURjVkQ2RVTkF2bEY4WWFZNzVBTVdiS0VX?=
 =?utf-8?B?NkhqUnJaOG5JZXdIaklTd0RxejczS2o4NzhKaGdhc1padnNTR0RLbis3bmx5?=
 =?utf-8?B?RS95eldEUTlDcnJQNjFtbDVHZ1QvY2xkZXVJbWtFODF0L05Od3ZHVnZ3akVH?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92BAA17A96528C409EB9D29934C7779A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fe3cd5-0302-4610-ef0b-08dd1a9f9e99
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 11:25:01.9210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j5f9ODwuOgZ5a1FuMVcx7Zzmqd0NL68ivEeShRPeTQsxeinFoS6GeVm1ekKxtaps2OLkuoKCJN42VEYmSUJfr5Dtu2jMly11a6u+tZ4G0vE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7748
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--18.987600-8.000000
X-TMASE-MatchedRID: 7ySqCuYCpfgOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0rbaVyalxbpdBgZ7Tcj60QbaNnyr85zWcCwR/wKmchi2d9RlPzeVuQQ0Vz
	rGplW0Y8JUt7WhsuKxUp9V9TAJNdQXPp/9DcY6vOeAiCmPx4NwMFrpUbb72MU1kTfEkyaZdz6C0
	ePs7A07QKmARN5PTKc
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.987600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	4F61FB278520F5545E39DB5763117AB8F14687551825D40B5C84D2313B940B4B2000:8

T24gVGh1LCAyMDI0LTEyLTEyIGF0IDA4OjIwICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDEyLzEyLzIwMjQgMDQ6NDEsIEphc29uLUpIIExpbiAo
5p6X552/56WlKSB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4gDQo+ID4gVGhhbmtzIGZv
ciB0aGUgcmV2aWV3cy4NCj4gPiANCj4gPiBPbiBXZWQsIDIwMjQtMTItMTEgYXQgMTA6MzkgKzAx
MDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBs
ZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiA+ID4gdW50aWwN
Cj4gPiA+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4g
PiANCj4gPiA+IA0KPiA+ID4gT24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMTE6MjI6NTBBTSArMDgw
MCwgSmFzb24tSkguTGluIHdyb3RlOg0KPiA+ID4gPiBBZGQgY29tcGF0aWJsZSBuYW1lIGFuZCBp
b21tdXMgcHJvcGVydHkgZm9yIE1UODE5Ni4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gLS0t
DQo+ID4gPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L21lZGlhdGVrLGdjZS0N
Cj4gPiA+ID4gbWFpbGJveC55YW1sICAgICB8IDQNCj4gPiA+ID4gKysrKw0KPiA+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gDQo+ID4gPiBIZWFkZXJzIGFyZSBu
ZXZlciBzZXBhcmF0ZSBmcm9tIHRoZSBiaW5kaW5ncyBwYXRjaC4uLg0KPiA+IA0KPiA+IERvIHlv
dSBtZWFuIEkgbmVlZCB0byBtZXJnZSBbUEFUQ0ggMS84XSBhbmQgW1BBVENIIDIvOF0gaW50byAx
DQo+ID4gcGF0Y2g/DQo+IA0KPiBJIGFza2VkIHRoaXMgbGFzdCB0aW1lLg0KPiANCg0KT2gsIHlv
dSdyZSByaWdodC4NCg0KU29ycnksIEkgbWlzc2VkIHRoZSBsYXN0IHNlbnRlbmNlIGluIFtQQVRD
SCB2MSAxLzhdOg0KVGhpcyBnb2VzIHdpdGggYmluZGluZy4NCg0KSSdsbCBtZXJnZSB0aGVtIGF0
IHRoZSBuZXh0IHZlcnNpb24uDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiBCZXN0IHJl
Z2FyZHMsDQo+IEtyenlzenRvZg0K

