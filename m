Return-Path: <linux-media+bounces-45731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 926CAC1303E
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 06:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 811D24F3E3B
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 05:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A131729A9C9;
	Tue, 28 Oct 2025 05:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gcaTxc4v";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PHMXc5Tn"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6031D516C;
	Tue, 28 Oct 2025 05:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761630455; cv=fail; b=rGX6vi6ErlB+OLsg6mctpLQQX0OmfgiQ9EWbxq7TmnEetabCe+it5d3H0oRhUpQSqzVJXE/XYiHxvJvj3xxm2JQmdk6khxWC4je/IK4POWLyGekwwiojLfeDyoCQDe0Ab//dui9BqDjSlwHhBo0FaOcXSY1z4w9xqNNbNtYAtNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761630455; c=relaxed/simple;
	bh=9fY3KKfd9fdj1b6ZGOgGEujtCv3YGG0Nvt+6uBTqBwM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RH1TOJ5U8fYQVGgxW8ZDsbBhhNdgd5L+2ZJVIw3cQoekepSSN7UwMVwe1U3tQBIhpki6yOmBbwgiY+BHNcH172rbOG63FFlmljMnQR13HDZmAAIkPQmdoN6rQhQALMIhUrLc4awDmghfNVC4ToVZpAfOncOGL+X3I03kjiML4lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gcaTxc4v; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=PHMXc5Tn; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 972ad268b3c111f0b33aeb1e7f16c2b6-20251028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9fY3KKfd9fdj1b6ZGOgGEujtCv3YGG0Nvt+6uBTqBwM=;
	b=gcaTxc4v8EsynDaP6xSMSTS5Fzj/exDwEOYuoOkJ1jsC40AlsD9ixV/2hJa0xzAhtQLjk+/exYeTOz7kdVHl/6KnqLV2gCSbG+h+5RBQhD9HQ0dt2sP1WqRYTUBS5HfosUvfmqmAPsGyEZ9oqUi4fhunoA7xj0q7+FThUS2IOYE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:76a17c41-31a1-45a9-b73d-810c995f36c7,IP:0,UR
	L:0,TC:0,Content:4,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:4
X-CID-META: VersionHash:a9d874c,CLOUDID:9d101bf1-31a8-43f5-8f31-9f9994fcc06e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 972ad268b3c111f0b33aeb1e7f16c2b6-20251028
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1396784529; Tue, 28 Oct 2025 13:47:29 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 28 Oct 2025 13:47:27 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 28 Oct 2025 13:47:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmaN86McF9oKPRIFyP5jTsqVoFa/x7IWM6yprvrvwWENSq3iOF68kzVWLJbSV8QQUXf4RekQTG5yVBt4mL634cqRwCKRglO50/iziDB5O9BLen/j0YlXYHY4KxupKb6Bkf7qnXsggY6SYrMsuGoWST9QPxqlCHtFn+/UhdO6Nw0S6dpVEL29qSUtR4l8x5Mnw7b6db9iDrBoruoK8BxDGQf+xxfKR8p6qMtwxjUYEPQuqOJXj/ecJ9lgIfM5aTiWUSRXQ9yCJcfF3b+/ttGL0Du6jx3uzaOA7vB88txOhnnFjeTaKTcT7IWiVGnbfxD1n7VoumEVEqeKzVS8pqk+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fY3KKfd9fdj1b6ZGOgGEujtCv3YGG0Nvt+6uBTqBwM=;
 b=HyrkwkwrnBJoIfjzpJ/f0sVj2j4rQd7uWxRI07UlW10qW7DqbC3U9ZI/HOdHgN7aBncy3hR9J88nMHvYtgGkv8aO8NaVx2PuDPylLYLZrWip5crcHjbmtJcTj4Cfhod6Kp8zRIAaTrsUMf0HNm0CNNioPRbi37/e0AGOxYD8/W2RuvgKfdW4lmYDEnu2Wp3DkoZQEBa0PYm/SFRxUSFTocMuA3gjjA+8h5c+Soz1u7x2baSPnV0HavuAx8DuWB1KtNBNd6Ugw9TJw4v/C3552BlxBJzzOPIgqqslq8OV/vB2WqUDUJPUo21jY1qiHM77AmU5bcYr2pdC84ygFNdMWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fY3KKfd9fdj1b6ZGOgGEujtCv3YGG0Nvt+6uBTqBwM=;
 b=PHMXc5TnSMM1Ozy1DSgQiQlgpMxsiSPGcS/sA3L+XVQvnU1EEp9/SV5rbkKt3st9b97jvnStozUiinkrOcIIjDKKJ2TtG34uXhp4EW599b5Bmz+B0Q0iZ8igTcJW+mco6QDg01CRUW5KQ3nCEQjUwcVghRoQkBA7p0xtszpCg+o=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7760.apcprd03.prod.outlook.com (2603:1096:101:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 05:47:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 05:47:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
	<Paul-pl.Chen@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v8 13/20] drm/mediatek:Use reg_write function pointer for
 subsys ID compatibility
Thread-Topic: [PATCH v8 13/20] drm/mediatek:Use reg_write function pointer for
 subsys ID compatibility
Thread-Index: AQHcPzKHazCrqxjo5EajBwscrx4B37TXHkWA
Date: Tue, 28 Oct 2025 05:47:23 +0000
Message-ID: <f4e118328e313e7a2e55a8c1f8736d51d3c20af7.camel@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
	 <20251017065028.1676930-14-jason-jh.lin@mediatek.com>
In-Reply-To: <20251017065028.1676930-14-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7760:EE_
x-ms-office365-filtering-correlation-id: 581a35ae-5d5d-4c31-ebc2-08de15e5782d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|42112799006|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QnRBUGllYlFMd29oM1pVNkF4Ym1zMkwzZVRBcGFPbG9RUVJXWVRuVHVvMm5n?=
 =?utf-8?B?S2hiQ3JUdGM4eUp0dEFvbWxvM2ZqdkdFc2tJSEpETFhrYW04WklNQXhQcitC?=
 =?utf-8?B?cUxjZ20yK21OdHo4ZzdLdCtFZk5sZ3JwdzREcTByVGlTKzZtSVlsYjlCNGFv?=
 =?utf-8?B?MkU1WGNrcGQwclBNTThBcy9PWDhBZzQzNnBtanZLSnZpODlYWUY0T3UwaXBI?=
 =?utf-8?B?UVJWSnJ3dkZiMTRyelZpcVFIZ0ppeTgvZVJmT0lXY2pORGZ0VzVORldhUk1Q?=
 =?utf-8?B?dTAvSGMrd1U3Rng3U1BERkhHTmlyTUxMNGxhbThvTERpY1FPVVVWcmsxQzFL?=
 =?utf-8?B?RCtKTVh2eG5SM01YNDdyN0VlQ0xSM3ZjYXJ6cENiVG1xaXZ5TTlOK2ZkbTFu?=
 =?utf-8?B?QVpacVpxUlBKbEZydThFMFd5VTV3K3N1ZUJLVXdxR21iMVlxeGN2Um9hQmtR?=
 =?utf-8?B?cEt5SlJDT2c2MTRCZVUxTGZ4RThxWTl6dDU4bnNibTJBdkpIdGF2akFLdFBI?=
 =?utf-8?B?ZFhqaHhDUWV1SHNjbmVrdS9hZndlZGJSM2hsT1FiNkFhbVFDeHRGdjh6WExV?=
 =?utf-8?B?bTRHUE1OeUVwQXZDK0JzNE94dk9sYW5FeWMySHZjSnprR20xQkZRZTJrbGlO?=
 =?utf-8?B?WXYwNGxhTUZUTG5XRXNWTnJIVzFKY1N6cTdaNzI3Q21XMWlJV2dKdXhRSjg2?=
 =?utf-8?B?NlZRWVdJU3c3MXQ3cWM2MzFtTHVGOXFYNVRFWkJtMk1rSFNqWXNna3YxZWQv?=
 =?utf-8?B?Zko3UkhxVXpiQkFPVU1GNmppdHlrVXVHcy9hUk5SUUVQNEp3UFkwb1VwOVJq?=
 =?utf-8?B?b3BoSDJyR3Jkd1pQOUYyUWJDaEZrYThSaXU4MjVWb21INExiK0NaTE9BZFVq?=
 =?utf-8?B?VllXZy9wMCtYdlcxWnVwRUx2ZmJWMENZYWtUMmQvTEd3ZHNZcjEvR2QzeWI1?=
 =?utf-8?B?UlpITzhIMEQyZVhieklzbFdjZ2U3VSt5WmlzQjBVZjArMHdNeGFsQ1dIQmky?=
 =?utf-8?B?Q2pCbDNQOUsyYWk5NG1nazdwVWxrOFJMKzdFeU03OXJBMk4rK08zRDJjUVRI?=
 =?utf-8?B?ejdxY2dMdUFVTFgzM1d0VnNLK1RzR2NhYlVmdkFxbnVQSDlmM2Z3MENVUmtM?=
 =?utf-8?B?WEhra0dnM1RjREl5WFJvU3BaTUN5dVlBMm1lTEdma0dOUEZ3SG0zT0NvOEJS?=
 =?utf-8?B?TTg0U2hDV00yanROWVUzd3BLOWgybFJWd0pZbzU1V29CRWVWOElpOEtUZDl4?=
 =?utf-8?B?ZmJNcmozY21QUUFNdWdGeE9wVkFNc2JqcDgxWC9nQVNkY0Rmb0dSeHJWUUVJ?=
 =?utf-8?B?dzlIaVZjdkdna3VPTDhrNFZ3NGNtTkVXQ291a3NoQkhLVTZwSCtZVWxUQmpa?=
 =?utf-8?B?TkhRTVVYUSsyQTBERUM4RGw2cnpTd2FyU0JJcEpqZ3lOdjgyY3ZsNFFGL3hN?=
 =?utf-8?B?cjM1SzdoV2JsdCtQa0kzVzRoSy8yWjlYU0I2T1A5ZEsxSWg4bUUwUDREOUUv?=
 =?utf-8?B?YldHT3R4T0ZuZGhWdXFtVjAxdWRoZXZ1T2lCcWN1TWZNUlNEdjROOWRkbXpS?=
 =?utf-8?B?K3FycGYyM090czIwLzZLQlVUWnFvNFdodXhDSWdKRGQxY0dzV29aQ2xFTGhp?=
 =?utf-8?B?a09LcEUyVFB3YVc1d0JJVjVVdWpzUlA0cnFFYzErcDdENGFrdmZtanhEMkZS?=
 =?utf-8?B?YytCNnk1S2dySnRyck5JWUxOQnZnaXBhMFVvbFZVNTFoUXROMGRzVDc3clpX?=
 =?utf-8?B?eUpBVnZCbUR1Yi83NkJIdHVzZWs3QnRmc2w0K2lMRzhTdkJMOXJTRG5ZRXEr?=
 =?utf-8?B?SndycTRvQ2ZndDJWNGpsZWN3b3F0WVdYd2IzVTIxZmtZVFYvdUI3MlZUTmQ5?=
 =?utf-8?B?YXhoN3M3b2lucnA2a0ZYTmVBdm5EMG5TUFVwa1JjYy83MHEyN3dod2JuWGo3?=
 =?utf-8?B?VXZDRzEwS3ZBSVJJU1c1N3dDRmp6VDFJQThIMUZ2K3lJV0dMSVRIUEFMUldS?=
 =?utf-8?B?TkJvRzFlbVlhWWlQZ283RFBJY1lvMmVSTmw1d2RKanZvLy9UeVpmTzF5cXp0?=
 =?utf-8?Q?+Bw5lq?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFhiRHN5SFgyTHUyWjRMSnVvbVpvcFZMQXhkclRvUDhzSHpJTzBJNWxQREF3?=
 =?utf-8?B?WXNLL3NWdUdCTmRYYWtFZlljSWFJL241cWhjOWJyR3BzVnoyWkhuZlMrWDhr?=
 =?utf-8?B?VHlZa1Q4cFBDbEFWVXk1RndNaUw5cHQwZGZqaFVZVm9iVWNmazg2YkgrdjNy?=
 =?utf-8?B?dGxOaHZndC9NcWtCQ20yRjZ3Y2szbVBEd3hBZEQ1RjlFdWxDL0grN29CS3dL?=
 =?utf-8?B?WVJuRUhpN2tGcUVGc1JqeS8wRVcxcCtDZ1k0VlJFVUhGbjJrbFFtZ3MxQzdU?=
 =?utf-8?B?cDk1MGE1VGlKd2xZQm5JU3hNUDMrSlFQTHYveTYvYlJUazV2SWtlQUNUcHJQ?=
 =?utf-8?B?UjFPMEdORGVYU3lsSitGR25oemVFQlJqTzZQUEtCK2ZRYkZmWGNDN3lURmNq?=
 =?utf-8?B?Z3kyK1hJYklTWis3WVNWUkxiWDFzTEc0Z2F2VDJBVFhBRHdIdHVZMmR3RXVz?=
 =?utf-8?B?aEVOYkRLSjNwMGo0U0RHb2RheDlQR1pGZ2tISExxUEJMeTJoM1dwMkE1Nm5J?=
 =?utf-8?B?a3poQktWbmVhNWVlVU5ZVlFuL1UxWEJiRWhocko3eFVadXgycEYwWndwZ0gv?=
 =?utf-8?B?OXU2NVpBVmpkZXdYT1pOUy95MERyZ29kSzQ0eW5YK3ZOOGFjVTN0eXhoZXd6?=
 =?utf-8?B?aHBZTjdPT2xQNkVHN3NjVFNaM2NTd1c5eUNCS1NMdlNuMDIyYjBZcHlxcFhp?=
 =?utf-8?B?bG9qTE5hdWRVNlpCLzZqc1VBOUhVaWtyQVF5WEhLVng3Mjcwc09BQjF4QzdE?=
 =?utf-8?B?cGQrNEZjQWhmeFUxR3F1M1JDaFl6M1htTUFLc1ZaeGFrSWxla2FrRFQwVnFC?=
 =?utf-8?B?aUphVE9kN2VpZVF0RDkvWmJ0Z0I5cGd0ellxNVpuYkEyc1ZxcTFjRFJkSUF2?=
 =?utf-8?B?WU9MLzlUK212QWRoYk1oclZsOHNEckVmcEF2aVBNS21VYVJkdFd2QTlFRzNF?=
 =?utf-8?B?eEQ5Wmd0YzdnS0FaVXBsMlFrcnBUT2swQ2RvcERVTUNUZVh4ZTN5RnRFYW5p?=
 =?utf-8?B?ZWJOR3NvMVVhTHdXeTJoYVJ3ZkhMTlRsOVY3ckhGdXhMaksvY3FZWXRGWE9I?=
 =?utf-8?B?OTl4YlRoVDNIa0NUNjFUcmtNNzNQT2RqM2NVV1VtTEpIMVJnSVdYRHdjTExv?=
 =?utf-8?B?ei9VYnVVbzg0Q2VqZmYxUUJrR0czUTBvK3V1dURBaFpKU21ST3gxU3ZLRU5q?=
 =?utf-8?B?eStSeFF3Y2lHcWZMMytJVkdRK0IyVXpMOWVyWWw5cW9VL29qdmQ4aWM3ME1u?=
 =?utf-8?B?MFpVQndXd09sWXZFOXRiZVY1cHJrSkhFVVBtdG1SZ211OVFpVitYS1AvNElz?=
 =?utf-8?B?R05CZzVuL1RhazhpWDFqaVJwQnlYVHgxNERORUhGUklUL1RBUEo5STY5eTI4?=
 =?utf-8?B?TVJiNkdmeEM4TWFTeVN6RVZuUnlpelVXODdwd2VOdDZYNFlpNmdBNlJ4VG9H?=
 =?utf-8?B?ZFZXWUUyU0VqcmtOOTRtQ09nZzlTRVFEUlE5Mm1MNVErTktzMno2VXdKOVpo?=
 =?utf-8?B?R1VJV1ZDeWJBWkwrOUpiU3dNOVRMVUtURUpyWHQzL2o1aG1PNDRwak0zcEJB?=
 =?utf-8?B?OGRzOFJmNERUR2h1MGFSV3B3ZWM5U05DdVQwVFdtZ0o0M2g2cEg2U0hlNURL?=
 =?utf-8?B?OWtlTGVHaWVGT3A1V1JEbzFRWVhoS1REVnEwUk81MlBQRHIrNUxGY3NzOGdV?=
 =?utf-8?B?dVF0U1dqZ3JFVll0VERLYjk1QS94SVdNdzc3QjlqT3oyOXB4OFgzeE5TYWpx?=
 =?utf-8?B?V3NPZVhUSEhwbGJoV3JtS0t3NHFvcHBzZmhleS9laEVIVlFjLzRobHd1QjJr?=
 =?utf-8?B?K1htaVJENGsrdzRkeU1EMHo3c3lhaVFBRG1tNGMwU0gzdlBQK0dGczBZVFk5?=
 =?utf-8?B?QTdKMWl5TVdIcWRyWXhod2F0UGxMUUs1L2EvbXMvOE1nL2thOGlMdHU4MnlK?=
 =?utf-8?B?YTRVYkNrVnphWkVBRVhLWjUwMGdVaHc3N09uSFlOZEdMOXorWHZ0RzAxYitm?=
 =?utf-8?B?ZmhEcTQwZkl5NEIvbWR2N080bXB5dWswSFp2Y2NYY3dJaWw1MXdFMHBXNFFa?=
 =?utf-8?B?NTFDSk5XeWlneWJlcnhFcDZ1NEEzT3JMVEpwY3BHNC9GbTlvNUFKZ2E5ZjBV?=
 =?utf-8?Q?oyB21W5QE7Q3oIClXzlbavaK7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97032BE1613FD64482F727ADA38814C5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581a35ae-5d5d-4c31-ebc2-08de15e5782d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 05:47:24.0218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XblIvwgAIziv8elFaOkNA1HCHVRd9H8fXbbImHSULFfQbsmjd8T4xZ3F/0iw4qgakW7tdI9tTPibcAIlm4YstA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7760

T24gRnJpLCAyMDI1LTEwLTE3IGF0IDE0OjQ0ICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IFN3aXRjaCB0byByZWdfd3JpdGUgYW5kIHJlZ193cml0ZV9tYXNrIGZ1bmN0aW9uIHBvaW50ZXJz
IGZvciByZWdpc3Rlcg0KPiBhY2Nlc3MsIGVuYWJsaW5nIGNvbXBhdGliaWxpdHkgd2l0aCBwbGF0
Zm9ybXMgcmVnYXJkbGVzcyBvZiBzdWJzeXMgSUQNCj4gc3VwcG9ydC4NCg0KUmV2aWV3ZWQtYnk6
IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29u
LUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMgfCAxMiArKysrKystLS0tLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jDQo+IGluZGV4IGFjNjYyMGUxMDI2Mi4uYWEy
MTdmYjExZmQ3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rk
cF9jb21wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5j
DQo+IEBAIC03Miw4ICs3Miw4IEBAIHZvaWQgbXRrX2RkcF93cml0ZShzdHJ1Y3QgY21kcV9wa3Qg
KmNtZHFfcGt0LCB1bnNpZ25lZCBpbnQgdmFsdWUsDQo+ICB7DQo+ICAjaWYgSVNfUkVBQ0hBQkxF
KENPTkZJR19NVEtfQ01EUSkNCj4gIAlpZiAoY21kcV9wa3QpDQo+IC0JCWNtZHFfcGt0X3dyaXRl
KGNtZHFfcGt0LCBjbWRxX3JlZy0+c3Vic3lzLA0KPiAtCQkJICAgICAgIGNtZHFfcmVnLT5vZmZz
ZXQgKyBvZmZzZXQsIHZhbHVlKTsNCj4gKwkJY21kcV9yZWctPnJlZ193cml0ZShjbWRxX3BrdCwg
Y21kcV9yZWctPnN1YnN5cywgY21kcV9yZWctPnBhX2Jhc2UsDQo+ICsJCQkJICAgIGNtZHFfcmVn
LT5vZmZzZXQgKyBvZmZzZXQsIHZhbHVlKTsNCj4gIAllbHNlDQo+ICAjZW5kaWYNCj4gIAkJd3Jp
dGVsKHZhbHVlLCByZWdzICsgb2Zmc2V0KTsNCj4gQEAgLTg1LDggKzg1LDggQEAgdm9pZCBtdGtf
ZGRwX3dyaXRlX3JlbGF4ZWQoc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCwgdW5zaWduZWQgaW50
IHZhbHVlLA0KPiAgew0KPiAgI2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpDQo+ICAJ
aWYgKGNtZHFfcGt0KQ0KPiAtCQljbWRxX3BrdF93cml0ZShjbWRxX3BrdCwgY21kcV9yZWctPnN1
YnN5cywNCj4gLQkJCSAgICAgICBjbWRxX3JlZy0+b2Zmc2V0ICsgb2Zmc2V0LCB2YWx1ZSk7DQo+
ICsJCWNtZHFfcmVnLT5yZWdfd3JpdGUoY21kcV9wa3QsIGNtZHFfcmVnLT5zdWJzeXMsIGNtZHFf
cmVnLT5wYV9iYXNlLA0KPiArCQkJCSAgICBjbWRxX3JlZy0+b2Zmc2V0ICsgb2Zmc2V0LCB2YWx1
ZSk7DQo+ICAJZWxzZQ0KPiAgI2VuZGlmDQo+ICAJCXdyaXRlbF9yZWxheGVkKHZhbHVlLCByZWdz
ICsgb2Zmc2V0KTsNCj4gQEAgLTk4LDggKzk4LDggQEAgdm9pZCBtdGtfZGRwX3dyaXRlX21hc2so
c3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCwgdW5zaWduZWQgaW50IHZhbHVlLA0KPiAgew0KPiAg
I2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpDQo+ICAJaWYgKGNtZHFfcGt0KSB7DQo+
IC0JCWNtZHFfcGt0X3dyaXRlX21hc2soY21kcV9wa3QsIGNtZHFfcmVnLT5zdWJzeXMsDQo+IC0J
CQkJICAgIGNtZHFfcmVnLT5vZmZzZXQgKyBvZmZzZXQsIHZhbHVlLCBtYXNrKTsNCj4gKwkJY21k
cV9yZWctPnJlZ193cml0ZV9tYXNrKGNtZHFfcGt0LCBjbWRxX3JlZy0+c3Vic3lzLCBjbWRxX3Jl
Zy0+cGFfYmFzZSwNCj4gKwkJCQkJIGNtZHFfcmVnLT5vZmZzZXQgKyBvZmZzZXQsIHZhbHVlLCBt
YXNrKTsNCj4gIAl9IGVsc2Ugew0KPiAgI2VuZGlmDQo+ICAJCXUzMiB0bXAgPSByZWFkbChyZWdz
ICsgb2Zmc2V0KTsNCg0K

