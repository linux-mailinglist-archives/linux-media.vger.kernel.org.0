Return-Path: <linux-media+bounces-23242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E249EDE05
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 04:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13E5F1657E8
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 03:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F291547F5;
	Thu, 12 Dec 2024 03:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="plKnzfui";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="f1p5/gdE"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C549857CBE;
	Thu, 12 Dec 2024 03:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733975305; cv=fail; b=sumXHENV+5VKw4/zlzJZ2rUOD/Kiqyb9LyZRALRH2TfhSMw1RbloqU7gLhpMNfJKtbPVmZ85glA/SzwabzTDxrPaZ+K/OWtUn23dYLUYlcFANbGgFTB3G7SJJ+m66KLo4TubwwYhBlyYU0qHxRvW15kdpojyy4JXtwaFg3JYhIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733975305; c=relaxed/simple;
	bh=wAphRreRESWICNYF6RTlBfQqFOO8Coy0ZkMLMgwrB4k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LvtkOuuMOkZfTRaRz69Ahm26P6n3saRX+++gwtWFAxEdLpBKc6uVBQp/8GuiY2GXb5hKzrCLN+SvgUUCT1TrIsvo7yK8HcIFZvScy/+qZpp3oLM4ijiDybXb3nXHDEfohaWE9uc+hGfqgYSdML2iqLijQaiV0UUfwh8vQDOgGgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=plKnzfui; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=f1p5/gdE; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ecf635cab83b11ef99858b75a2457dd9-20241212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wAphRreRESWICNYF6RTlBfQqFOO8Coy0ZkMLMgwrB4k=;
	b=plKnzfui10lvmAdQYLP5Iof5XTWRoxWvS2lWoPwF7+KHu5lnkMfl7CQApPVmVSV16Y/N5b9CXZ47dQtDF5pwSF83RGzfS9GgOlt+VfqiuW93vT3ildubemrOGApKRhTnvwWvENph1/Y/n4TGH+eguDgmlMlnXMR560lPfa/cgCc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2cab65c0-066c-4af1-a2a2-831891c4d131,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:1d2a0013-8f5d-4ac6-9276-7b9691c7b8d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ecf635cab83b11ef99858b75a2457dd9-20241212
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1348186328; Thu, 12 Dec 2024 11:48:18 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Dec 2024 11:48:17 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Dec 2024 11:48:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqWubHwDgjqWCmb46psPBPX4wwcG2WId7oUqMGMsPcfRotMlTPmyMLjBshHLP87nsKpOKzm55tL8ywHrVsZG2eapjDwSF0SPTnRzwHo4ZU2EVLZGfxZcJ7gKenYapou0+0zM3iaPYfsKA6NQIe44T6x8TFZx/XbKbr3XYl0Y39szdyVSd20CWuDEUSB0yFIQ5aZgbn6K0l7RbE91FVKRgq4BwUktPytLzQ1FPcUr3hbIg37hSTmyZPmWH7VQgXK7CeR0XITBbWPygplMxSvcesQEo7Vhku6bHf5l3S0aI7rVfk8vVadDIMgteBqzsC5PWPaGCW6yMGzg4O2copschw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAphRreRESWICNYF6RTlBfQqFOO8Coy0ZkMLMgwrB4k=;
 b=nIiXoSsH5ia9v4nd0SC90cz8lugMBa9tR2mFD0dPocCpVLf0ke7BMnD8rTiSmSxGliEg6iSHZpxXA0ljYb5mjLpoTPJXf8dsWCw3utBT663HYJoeDKIYDi7lJcIqODGLZcTgPp1HMWHW7if4Vm8AJDadA+4q0Vcg9njCc+HZI7V+MI8oKo+g3sQu27rubowbEUU4Jey6vpGsCxE+QxqXV5/Yh2y/hmcW7vhiiQvJmjkewrN1GDBoBM7TGKcSvoXfvEp8r90AW5w6W+bzD43IuqoMZ4FEoCLjiW3JvxGJm++xlXD9PYWM4ZWIaYnmuFt33Dww0NrKiqJhHZS7idXYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAphRreRESWICNYF6RTlBfQqFOO8Coy0ZkMLMgwrB4k=;
 b=f1p5/gdEm9pRrQEMaoSPaW7JoMId/qLOdL2ZOqtIML29Avjdr0qqpvlbPTijdHEq/+UkyziW+KiPyEnFLmlC4BlH4F4wA3dyNJErPdvF3mg1peZIb1m0L88rydemY8Gc+MKIWMGwNz2pmF22BlZRK1aZZo4Y1JN038RMALboqlA=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB7553.apcprd03.prod.outlook.com (2603:1096:400:421::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.23; Thu, 12 Dec
 2024 03:48:15 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 03:48:15 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
	<ck.hu@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
	<Moudy.Ho@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH v2 7/8] drm/mediatek: Add programming flow for unsupported
 subsys ID hardware
Thread-Topic: [PATCH v2 7/8] drm/mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Index: AQHbS3wl3fAvI90SjUi56h2WncZkS7LgZ4kAgAAFKICAAY2uAA==
Date: Thu, 12 Dec 2024 03:48:15 +0000
Message-ID: <5954e33f25cb2bb4e1d369ff174bd8d574accd55.camel@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
	 <20241211032256.28494-8-jason-jh.lin@mediatek.com>
	 <761ef6ecfe8298f945e6627aff29f864fcf7b9c0.camel@mediatek.com>
	 <4e10e2cd5d58321bdd7e5dabf5fb70702f8afc92.camel@mediatek.com>
In-Reply-To: <4e10e2cd5d58321bdd7e5dabf5fb70702f8afc92.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB7553:EE_
x-ms-office365-filtering-correlation-id: 1215b17b-c358-4377-15cc-08dd1a5fced6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c3lScTFISGVEa1JLUGt4cGVJWXN3VVpWbzQzODBQU3hwaE1PTzJJcnRibm9Q?=
 =?utf-8?B?SnZ2cWFFbGptVmowK21xc1RxdG1sZ1RTNUxBcVZGeUkwMHdIeUZ1UG5Kd09t?=
 =?utf-8?B?L1FScWRJNGlhdWNsMGw2ai9FenQwcFM5RzBMdlhIdFZldFNiL0EyZmNLWHgz?=
 =?utf-8?B?dVFlTmpGSTJRVlFTUmhSNnRDck12VldhUXVmeUdDQVNFSm9mNGVtem1mams2?=
 =?utf-8?B?dUNWdFBBeDVlVHpZQTFQYTVvU05PYUdwTW9hekp1aWE5QnIwcHFjQ0xxQ05R?=
 =?utf-8?B?Y3FDb0ppUU5HRThUbnpDTFFsNFFENHBoRXFNRG9zTm1BNWVrR0VHOWh0VmYr?=
 =?utf-8?B?VXMzMHJOZXpjdGdoVXdKaVBoK1MySlovVGNJTUtiNzB3dGl2ZXBwTUdHVVdv?=
 =?utf-8?B?aVVFTTNFU012b2FhVmRmYW5wYWJhbE5ZMy90b21yL1VxN3FKSVNITFlYK09n?=
 =?utf-8?B?RlpsT0hBcWNFVTQwcTJXcTEvN0h1cHRoeG84dHNIVWpOM1VEdVFpUUZ3L3Bs?=
 =?utf-8?B?MDVQL0NYTCt2ZEJzTFE5ZHVUb1BsUjFGU3RjZUtCVkkwQXZTMGZlc0w0bTNr?=
 =?utf-8?B?QVVBcmhnYjRNY2k1TVVHbXFLWjJjVktabzJsZm9sY3pweE4xeUVlK2o5SDE5?=
 =?utf-8?B?RVNkSnVLN1FKUjBVMVU1Y2FVRDF1cCtycDBQS0t5Ync4clhZbms1b2tsZTBj?=
 =?utf-8?B?dW1WSFVYWk9nT1BkSkI0VEtrT3VrQ1UxSjhuZEJPNVhpc1RRWlFISFRUNklr?=
 =?utf-8?B?Mm5ZRWRLeXk0RW0zanZhdmFOV0kvb0dvQmwzZDRUenN3YVZaOXlSRE9oNFRs?=
 =?utf-8?B?UURCajJLYXdKdDlTbEVFVXNzT05uQnB5QXZRU0IxM1Jsd1BHWlc0ZjZ1VEhN?=
 =?utf-8?B?V2VEWThYS1NkVWxxTmxwdWl6Q2xQL3BUTGFLTmdzNVZsN1poWGtLNHlSZFlX?=
 =?utf-8?B?aXFRUmsvY1h3SjB3ZXN4ekZJdnFNVFZkUjZSb3VSSnFvNVVnR2tGU2xjWW8z?=
 =?utf-8?B?YnVLelBBY3NYMEZlMnZpb3Y3SGY4a2pEdlpjSVltVzM0MU5KUktjTlZNbERt?=
 =?utf-8?B?aGlRS29tNERhdWorOHlmdXBNclY1WkZJMDhXMEtKQ3R1djZWbTYzd1cyeUdn?=
 =?utf-8?B?MzZHcVhYYVFKbldLdUd6NUFpV2UreDNxQ0pqNmtRd1FIa0djTTJNSjB6K05Y?=
 =?utf-8?B?VUt3R1RPWFY1dFVyZktzdzRPb1h2dGE4NVhYUlNlQWlCZ3JhRHFORm41Z2Qz?=
 =?utf-8?B?NldDa0VIS1pUQVJoaDZxTm9xaGNTdkp4d0t3eGJZSVJKbkhiQldIbkZSWVVZ?=
 =?utf-8?B?TURlb2Rva1NXc1RrMWNtRnVYVGdxcEI1UVF1R1prbE80WFhoTmR3Zy96M2pr?=
 =?utf-8?B?VHdieG1LdDVvSyt4S1JFNG1FZ2FtZkl4M0w4dllqQnVDMjBrRTRpSzlJMWNN?=
 =?utf-8?B?WnlvTmNPT0dNeU1CNFgycnNqQXJ4R3Q2WW9iYTgxTStULytqV3V2dTMrand3?=
 =?utf-8?B?WTlxOW1EWmdPMkh1UzRQUThPd2hSQlkrZVJDVEtvRENMMG90QXhuNmxDZ3l0?=
 =?utf-8?B?R0d4aVpVSXpIZENPYS9ONUl0dXZETFpNdmFRcmtPRlJMWGljTXhxblRwakIw?=
 =?utf-8?B?KzZxbFBFcmRkV3ZRZGVJMk93T0d6SVo0clpQVXhCOGluWVBsMUFjUTJGcG9m?=
 =?utf-8?B?cXZYcis5SEJXMWlreENMQVRhZ2cwUnNrM0dwZDBKQVk2T3AvMHd2SzVHejVv?=
 =?utf-8?B?ekpiNG02Q2Z6TEpERUN5Z0MyWjl2a0JhOTRKZ2dvdER1bGs3TGszTDRLcldw?=
 =?utf-8?B?ZjdxU0ViNnM5bFVTbjBBUWVMTFJrRE5RZktkamZrMFBuL1prc3VNdjdpRmlB?=
 =?utf-8?B?LzJzd1ZzejlnV3BNUjRjTXAwVkJMOWpBb2RnOUMvMlB2ZUJ5aEdvR1FXNU55?=
 =?utf-8?Q?r0XDBzWTFKAO1rmsn/h2RzmwYCD+3x+k?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2lQQnU2bzgyK2dDK3JjNUx5R1dWVlRrdXlaeW5Jckt3K3Zxb2hmOXlTaEdX?=
 =?utf-8?B?ckJzSzhjSWZSZTJlM0M3SEhtelRqZWwyblViYVpBc2hueEU5RnFFQUJwM3BG?=
 =?utf-8?B?Nyt5Yk51cy9QN2pzY21hcTByV2MzQmFPbFJpQ1hDVDJ5MkFSRlJDR250Sm0y?=
 =?utf-8?B?bUpoaisvcXFZb0p0VmQrbW84UlhOWTBGeWU2by9HVFhra3NVOW9vQmFGQlk5?=
 =?utf-8?B?cHhNcDZyS2JhK3c1RytzQVdvWDFycXM2bWRCLzhiUE5hNXZlY3RLS25iMmt1?=
 =?utf-8?B?NG1idStKMlFSbHBQVFRXOXdUMjdPODZLYTl2WnljaGIwYjIwUk5GOFFzVmNu?=
 =?utf-8?B?RkdFRERUNHAySmc4ak9RbGRyMDY5YzJOUGQ4R2ZRKzNqNDNBS2I4anJ6VEpk?=
 =?utf-8?B?NXpScG9RdVc4T1lzM0JSbWcyQXUzclQ2Umg0ZGd5QmhabFRxQlF4bjZkOE9H?=
 =?utf-8?B?d1dEdDh5ZXozUzBNcFdWUEpUY04xYWl3bDBqYjc0b1FienRZMVZyLy9WOUFx?=
 =?utf-8?B?QUt0YU9oYmN4SXphZWRaK1pJWFJsUEQrUnZLNDJEblhqd2NkTlovTFJwUkJT?=
 =?utf-8?B?UkZIM1BLSS9sWi9QZVVMWVorQU9wR3ZuRjlRMG1aNjhTYnEyNERma2hicXQ0?=
 =?utf-8?B?NDZrZ21sRFpzWklYdVBmSjVwR0FDTTN2UVQwL1h2aXBoN2gvODdLa1AwcHh6?=
 =?utf-8?B?d3VMSlZrSDgvSGVFR01sTzlvT25PQnNkZVJzRjRiT2tiRmNWSmtDMnJvME5R?=
 =?utf-8?B?NFVzcyt2blVWek0yRVlxRXNTY2M1eWs2b0lxbFdZam5qL3M1WWxFZ3FKeE9J?=
 =?utf-8?B?RWtMNzZsamVXTmo2TDAxOExDSnRxRXo3SjNOMXdyMEJMWUFoWS9ya1NSVEQ5?=
 =?utf-8?B?cS93emtHekNXbDBOMWRjMHE0eG1aRTM0QTh2eVZPak9oYWRKcE1pNE5OOE8v?=
 =?utf-8?B?NWtxcGRPMGpRSXhBbytJekJBWEhpdGRHazlVSUtmamU4Z2xabzNRQkFJeDIv?=
 =?utf-8?B?TFZoeGdCSVk3WDNpSHBhZVJGeU02ekdTK0lQM1Y4cjZMSThQaElJbG9iZCtj?=
 =?utf-8?B?WkVUWnFqdmhQSFJhSVRGTEpZM0hrTmlITEhRNGQ4N3ZtUXV5RjZwd0NlUG95?=
 =?utf-8?B?bG4zRUo4eVZLaVdUQmxKUkg1eE1sRkh1Z1hJWGdRclEzZU93Vkg3Z1k1SXhD?=
 =?utf-8?B?TnpzUXNOT3lvUmc1ZFkzV3hXbXQxVjlReTZsdk80SnQ2MUFUbExBbmtodU8y?=
 =?utf-8?B?WWV0bytGWHFqNVo4NE9vd3F0SGM5YTd1WmlzdGkyc1BBZnBjRzZJZHdETHFu?=
 =?utf-8?B?SEYzR3loMm1WUFBHQndKcW9BcGVSdllQWEt0R2o4Z3RMTGpveXRJZmpwWllv?=
 =?utf-8?B?blEyMi9TOEpDK2Jrdzg5VFJsWXdzNTg4VHM3UUFUZllsRVhqN3J3d1h2c1JO?=
 =?utf-8?B?QVVnQzRURGkzNXNjWDJoSWk4d1QyRXlDZndaTmtadFYydmRaSnp5ZEx5alhB?=
 =?utf-8?B?bUpvTklDcXRHT2g0Z3RZVDJJMTlqNXplK2pDMEx3OTFKMmNsaWx6Qmhhb0lP?=
 =?utf-8?B?Vmc1YitJMjcrTTJQOGcwK3pkbEoySVFacnN3YnJGNnZJNmdTNkkyS2kwWEJv?=
 =?utf-8?B?NEo3cGp2WDhocTBrVS9PaHU1TVBzMFpqSWUzZkxqbkZ2WEMxeEtFUUFTY2J4?=
 =?utf-8?B?UnNyeWQ2dVNMeGZaUzZDM3h6aUxRRjlydTZDVmRMOHg5ZWN4NHkxQXJRZktD?=
 =?utf-8?B?ZDBLYWpRWS9xMDhwZ29wMjRqSEtjdE1JV0pMVVpPdEdXay9TdzQrL3hxRHJx?=
 =?utf-8?B?bFZpMzJvVDArVlZrY0NnZnZqVWFFZndyZndRdWJ6SHorZUY0S2I4S25haGdo?=
 =?utf-8?B?aWlrT2JiYkJMU2laamsyMEt1S0dscWcxWm5Ganc3aWZRc2d3c0JYTEc4aTA5?=
 =?utf-8?B?enBTNzlpODhuT0EweG9XWXpjODh6RnRER0huYkRJU2xHMHJCNG9BZGp0ZlI5?=
 =?utf-8?B?a2tGM09PVEZseno0K2U0YzdYZHhlMlJHV0FOTjdXR2U0WXorZTJBM1V3M1g3?=
 =?utf-8?B?QzBlZWFTbnIrRE9JTnVzWDAzK0NPZnI1Z0RDZ0tuY1dRajRMZktHay9weHg1?=
 =?utf-8?B?T1pSenBNcFB1QmtmTWJIZk5RVU5wZlRDb0N4a3hYNVpuNDJPdXJZMGx5aEhI?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97E2202BF701494F8014036AF4265493@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1215b17b-c358-4377-15cc-08dd1a5fced6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 03:48:15.0411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AbMLEZ6RaxRQjve/g6Qmc9aODrLiqTbsx5/adDdfIFrOLRh8A2EjEObxqxwX7xz/dw6FKfQ5DK2x78Tn5GwfejDlKMnDPcZ4fQUlxFHQoIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7553

SGkgQ0ssDQoNClRoYW5rcyBmb3IgdGhlIHJldmlld3MuDQoNCk9uIFdlZCwgMjAyNC0xMi0xMSBh
dCAwNDowNCArMDAwMCwgQ0sgSHUgKOiDoeS/iuWFiSkgd3JvdGU6DQo+IE9uIFdlZCwgMjAyNC0x
Mi0xMSBhdCAxMTo0NiArMDgwMCwgQ0sgSHUgd3JvdGU6DQo+ID4gSGksIEphc29uOg0KPiA+IA0K
PiA+IE9uIFdlZCwgMjAyNC0xMi0xMSBhdCAxMToyMiArMDgwMCwgSmFzb24tSkguTGluIHdyb3Rl
Og0KPiA+ID4gVG8gc3VwcG9ydCBoYXJkd2FyZSB3aXRob3V0IHN1YnN5cyBJRHMgb24gbmV3IFNv
Q3MsIGFkZCBhDQo+ID4gPiBwcm9ncmFtbWluZw0KPiA+ID4gZmxvdyB0aGF0IGNoZWNrcyB3aGV0
aGVyIHRoZSBzdWJzeXMgSUQgaXMgdmFsaWQuIElmIHRoZSBzdWJzeXMgSUQNCj4gPiA+IGlzDQo+
ID4gPiBpbnZhbGlkLCB0aGUgZmxvdyB3aWxsIGNhbGwgMiBhbHRlcm5hdGl2ZSBDTURRIEFQSXM6
DQo+ID4gPiBjbWRxX3BrdF9hc3NpZ24oKSBhbmQgY21kcV9wa3Rfd3JpdGVfc192YWx1ZSgpIHRv
IGFjaGlldmUgdGhlDQo+ID4gPiBzYW1lDQo+ID4gPiBmdW5jdGlvbmFsaXR5Lg0KPiA+ID4gDQo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5j
b20+DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9j
b21wLmMgfCAzNA0KPiA+ID4gKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jDQo+
ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYw0KPiA+ID4gaW5k
ZXggZWRjNjQxNzYzOWU2Li4wNzkyYzg5NTUyNmYgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYw0KPiA+ID4gQEAgLTY2LDE0ICs2NiwzOCBAQCBz
dHJ1Y3QgbXRrX2RkcF9jb21wX2RldiB7DQo+ID4gPiAgCXN0cnVjdCBjbWRxX2NsaWVudF9yZWcg
Y21kcV9yZWc7DQo+ID4gPiAgfTsNCj4gPiA+ICANCj4gPiA+ICsjaWYgSVNfUkVBQ0hBQkxFKENP
TkZJR19NVEtfQ01EUSkNCj4gPiA+ICtzdGF0aWMgdm9pZCBtdGtfZGRwX3dyaXRlX2NtZHFfcGt0
KHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QsDQo+ID4gPiBzdHJ1Y3QgY21kcV9jbGllbnRfcmVn
ICpjbWRxX3JlZywNCj4gPiA+ICsJCQkJICAgdW5zaWduZWQgaW50IG9mZnNldCwgdW5zaWduZWQg
aW50DQo+ID4gPiB2YWx1ZSwgdW5zaWduZWQgaW50IG1hc2spDQo+ID4gDQo+ID4gRHJvcCB0aGlz
IGZ1bmN0aW9uLg0KPiANCj4gU29ycnksIGl0IHNlZW1zIGNtZHFfc3Vic3lzX2lzX3ZhbGlkKCkg
aXMgdXNlZCB0byBjaGVjayB0aGUgU29DDQo+IHN1cHBvcnQgbmV3IEFQSSBvciBub3QuDQo+IEJ1
dCBJIHdvdWxkIHRyeSB0byBmaW5kIG91dCBhIHdheSBub3QgdG8gYWx3YXlzIGNoZWNrIHVzaW5n
IG5ldyBBUEkNCj4gb3Igbm90Lg0KPiANCg0KT0ssIEkgY2FuIGhlbHAgeW91ICB0ZXN0IGl0LCBp
ZiB5b3UgaGF2ZSBhbnkgaWRlYSBmb3IgdGhpcy4NCg0KSSdsbCB1c2UgYGNsLT5jaGFuLCBjbWRx
X3JlZy0+c3Vic3lzID09IElOVkFMSURfU1VCU1lTYCBpbnN0ZWFkIG9mDQpjYWxsaW5nIGBjbWRx
X3N1YnN5c19pc192YWxpZCgpYCB0byBhdm9pZCBmdW5jdGlvbiBjYWxscy4NCg0KPiBSZWdhcmRz
LA0KPiBDSw0KPiANCj4gPiANCj4gPiA+ICt7DQo+ID4gPiArCXN0cnVjdCBjbWRxX2NsaWVudCAq
Y2wgPSAoc3RydWN0IGNtZHFfY2xpZW50ICopY21kcV9wa3QtPmNsOw0KPiA+ID4gKw0KPiA+ID4g
KwlvZmZzZXQgKz0gY21kcV9yZWctPm9mZnNldDsNCj4gPiA+ICsNCj4gPiA+ICsJaWYgKGNtZHFf
c3Vic3lzX2lzX3ZhbGlkKGNsLT5jaGFuLCBjbWRxX3JlZy0+c3Vic3lzKSkgew0KPiA+ID4gKwkJ
aWYgKG1hc2sgPT0gR0VOTUFTSygzMSwgMCkpDQo+ID4gPiArCQkJY21kcV9wa3Rfd3JpdGUoY21k
cV9wa3QsIGNtZHFfcmVnLT5zdWJzeXMsDQo+ID4gPiBvZmZzZXQsIHZhbHVlKTsNCj4gPiA+ICsJ
CWVsc2UNCj4gPiA+ICsJCQljbWRxX3BrdF93cml0ZV9tYXNrKGNtZHFfcGt0LCBjbWRxX3JlZy0+
c3Vic3lzLCANCj4gPiA+IG9mZnNldCwgdmFsdWUsIG1hc2spOw0KPiA+ID4gKwl9IGVsc2Ugew0K
PiA+ID4gKwkJLyogb25seSBNTUlPIGFjY2Vzcywgbm8gbmVlZCB0byBjaGVjayBtbWluZnJvX29m
ZnNldCAqLw0KPiA+ID4gKwkJY21kcV9wa3RfYXNzaWduKGNtZHFfcGt0LCAwLCBDTURRX0FERFJf
SElHSChjbWRxX3JlZy0NCj4gPiA+ID5wYV9iYXNlKSk7DQo+ID4gPiArCQlpZiAobWFzayA9PSBH
RU5NQVNLKDMxLCAwKSkNCj4gPiA+ICsJCQljbWRxX3BrdF93cml0ZV9zX3ZhbHVlKGNtZHFfcGt0
LCAwLA0KPiA+ID4gQ01EUV9BRERSX0xPVyhvZmZzZXQpLCB2YWx1ZSk7DQo+ID4gPiArCQllbHNl
DQo+ID4gPiArCQkJY21kcV9wa3Rfd3JpdGVfc19tYXNrX3ZhbHVlKGNtZHFfcGt0LCAwLA0KPiA+
ID4gQ01EUV9BRERSX0xPVyhvZmZzZXQpLA0KPiA+ID4gKwkJCQkJCSAgICB2YWx1ZSwgbWFzayk7
DQo+ID4gPiArCX0NCj4gPiA+ICt9DQo+ID4gPiArI2VuZGlmDQoNCltzbmlwXQ0KDQo+ID4gPiAg
CWVsc2UNCj4gPiA+ICAjZW5kaWYNCj4gPiA+ICAJCXdyaXRlbF9yZWxheGVkKHZhbHVlLCByZWdz
ICsgb2Zmc2V0KTsNCj4gPiA+IEBAIC05OCw4ICsxMjEsNyBAQCB2b2lkIG10a19kZHBfd3JpdGVf
bWFzayhzdHJ1Y3QgY21kcV9wa3QNCj4gPiA+ICpjbWRxX3BrdCwgdW5zaWduZWQgaW50IHZhbHVl
LA0KPiA+ID4gIHsNCj4gPiA+ICAjaWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4g
PiA+ICAJaWYgKGNtZHFfcGt0KSB7DQo+ID4gPiAtCQljbWRxX3BrdF93cml0ZV9tYXNrKGNtZHFf
cGt0LCBjbWRxX3JlZy0+c3Vic3lzLA0KPiA+ID4gLQkJCQkgICAgY21kcV9yZWctPm9mZnNldCAr
IG9mZnNldCwgdmFsdWUsDQo+ID4gPiBtYXNrKTsNCj4gPiA+ICsJCW10a19kZHBfd3JpdGVfY21k
cV9wa3QoY21kcV9wa3QsIGNtZHFfcmVnLCBvZmZzZXQsDQo+ID4gPiB2YWx1ZSwgbWFzayk7DQo+
ID4gDQo+ID4gLyogb25seSBNTUlPIGFjY2Vzcywgbm8gbmVlZCB0byBjaGVjayBtbWluZnJvX29m
ZnNldCAqLw0KPiA+IGNtZHFfcGt0X2Fzc2lnbihjbWRxX3BrdCwgQ01EUV9YWFhSRUdfMCwgQ01E
UV9BRERSX0hJR0goY21kcV9yZWctDQo+ID4gPnBhX2Jhc2UpKTsNCj4gPiBjbWRxX3BrdF93cml0
ZV9zX21hc2tfdmFsdWUoY21kcV9wa3QsIENNRFFfWFhYUkVHXzAsDQo+ID4gQ01EUV9BRERSX0xP
VyhvZmZzZXQpLA0KPiA+IAkJCSAgICB2YWx1ZSwgbWFzayk7DQo+ID4gDQo+ID4gQ01EUV9YWFhS
RUdfMCBpcyBkZWZpbmVkIGluIGNtZHEgaGVhZGVyIGZpbGUuDQo+ID4gDQoNCk9LLCBJJ2xsIHVz
ZSBDTURRX1RIUl9TUFJfSURYMCBpbnN0ZWFkLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoN
Cj4gPiBSZWdhcmRzLA0KPiA+IENLDQo=

