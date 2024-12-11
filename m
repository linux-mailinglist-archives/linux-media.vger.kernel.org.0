Return-Path: <linux-media+bounces-23153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F0B9EC3D5
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 05:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70A0283B12
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 04:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571041B21A0;
	Wed, 11 Dec 2024 04:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XEXQ83a+";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="R+sOq4od"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F8F2451C0;
	Wed, 11 Dec 2024 04:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733889908; cv=fail; b=nMxJKn1ICIpOpv252pub9dLxKHxRbnUIu1/ejE8RZvZKoCQGKZYLze8BRvpDOGPZHY5pXN43XVRZdnoopjztF0u+57DfACVGIXdd2aM2VT33WUhJVoWmSZ+Wov+3mfRx0ppBKnxZ8Va6mu7kvIvCQab0t22Brh4pccYzE98vkXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733889908; c=relaxed/simple;
	bh=k71OFdSU5mXVtGxMak8leREOxuIn+vsVXkbbOxWx7B4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hADfcD/NJsVjl93aJxQTM5AwRbI4w0ap6+ev9eAIr7jnvrBB2HklRLXHpQk9Y1AqjCnWQiKVUoZmwU34qyL/MEA3NcxDOQWYIJfJ5SiP51y18fHytR1e6b5KIr92fNDjBiWhbPBS7O7XJa6eZ2Y1IJhxElz/vKXnEXWJ6cVCX80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=XEXQ83a+; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=R+sOq4od; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 174a1f7ab77511efbd192953cf12861f-20241211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=k71OFdSU5mXVtGxMak8leREOxuIn+vsVXkbbOxWx7B4=;
	b=XEXQ83a+KE57Td8qRXTnrmaB+qgwKa+PjllPBpqXHgTTdjvJpsOCMYMEExSraeHritukUomQx9o3o1klMEqIFNQu/oRcsp+rr7MfNmyxVOGwwUSm88O4jsFWy8cXSJUpsKWGU52V6BaMY1ZbmtJQRjwUwQyhNyMQ0wxWXGL4ku8=;
X-CID-CACHE: Type:Local,Time:202412111146+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:f7720dad-2d5d-4577-a2ea-da080c98f72d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:0ac92dc1-1c82-4420-82d9-d6eb228f5c4a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 174a1f7ab77511efbd192953cf12861f-20241211
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 57600443; Wed, 11 Dec 2024 12:05:00 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Dec 2024 12:04:57 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Dec 2024 12:04:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3CfAG1g6sK7C+/e3cLcF7MHkhJrE7DDrmuKuA6y2w4/C1FcwvLHfT+Yo/23I8ew8r0HakoIc437UwJA0S7+WpjDAvTBStgdPjCze89BmqW+ygacwi6pPPwnEpGtOwuakROQGR4FYSsXdYA6JlVSLg7N3mpXvy6dMBZlsXJoUNpHaue4Lz4Y5QMQsxue1vSctaZWc+B5d2the+XBjGnKk5MowC3YOMXrRk+RSGi8Pk0TDoN6Y8R3foojPeB4+IYtiXxHjIgZXQj2ochwPw9iYGdX19Zg4g4MPtUlkFTJ6xMt3GtIYzzj/tb1bkan5mhBkVCZF2F1Hfc4mg9GN5f5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k71OFdSU5mXVtGxMak8leREOxuIn+vsVXkbbOxWx7B4=;
 b=H1uAKlz/c1AP+23u7x5LmlFuB+1yDwnmWzi67w+pqt5wAT0WHBmdYWHorqWY7lJUKI1oEXej5ofPveEX1PpPOxgSRuMIBOauXbH8sWnI+/4MbifpQkpbQNW35Gwt2vqjuxysgnNs7WidwfeE9V3v3sgfnvbq0JKkR2jT/xG/DL7FEhXjqUlZ7HeCFcChrVDc1bfmklN+sMKZW7fYEvu9/7WMJjl+I97zkrDvleOa3/emtfcQN/gAIMkN3a3dlziQ48yA1Rm3iFWT9IfqUV6oiYdQqXKqqHHrS2Q7HgAtuC1cXgWwHVpzrcsqXO8hCsxR1HQbTJgZ12/4PXWLJ83viQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k71OFdSU5mXVtGxMak8leREOxuIn+vsVXkbbOxWx7B4=;
 b=R+sOq4odSJdmuIhrO1BM1QtGP47zIt/6ts5gsiuNF3JdXolKc0TpuBGlrzZiHaH2wwAAJb1TP/Yq6/BNPui0EUb/vBfueDnSlgP2k8udf4GwVxb3/fF7Rek5TgkxCvmO8AQngxmgzDR5D3iU1Dun81M8bbcp5tFQSwUtkEuRcuU=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by KL1PR03MB7502.apcprd03.prod.outlook.com (2603:1096:820:e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Wed, 11 Dec
 2024 04:04:54 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%5]) with mapi id 15.20.8230.010; Wed, 11 Dec 2024
 04:04:53 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
	<Moudy.Ho@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v2 7/8] drm/mediatek: Add programming flow for unsupported
 subsys ID hardware
Thread-Topic: [PATCH v2 7/8] drm/mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Index: AQHbS3w6tqpwRTdGjUKWb1hyrDVA0LLgZ4iAgAAFKYA=
Date: Wed, 11 Dec 2024 04:04:53 +0000
Message-ID: <4e10e2cd5d58321bdd7e5dabf5fb70702f8afc92.camel@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
	 <20241211032256.28494-8-jason-jh.lin@mediatek.com>
	 <761ef6ecfe8298f945e6627aff29f864fcf7b9c0.camel@mediatek.com>
In-Reply-To: <761ef6ecfe8298f945e6627aff29f864fcf7b9c0.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|KL1PR03MB7502:EE_
x-ms-office365-filtering-correlation-id: 1e86c229-7172-4733-6a51-08dd1998f7aa
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OC9RSFZ3RDQyYnZZMWVmbVd0SE5VZFpkSUtKekVYRmZMYll4b2ZZWkdqdERR?=
 =?utf-8?B?NmFPTjNUM0l3UVdjWWdobVdCN0tCNDYyNXJZRXQrYVE2c1YrOTBkVjNsYWpE?=
 =?utf-8?B?SzVMUDBSdmM1WFhPdkZUNkREKzdEUkxMOFp1ODU1WXhDUk1pSWxZdnRtRm9J?=
 =?utf-8?B?M0ZNWHdFYXVWR2FKQk9jSjBLNnJVNzhjSk9DdWtCT3RsZmNGMktIRGhTdHov?=
 =?utf-8?B?cFFyVzh2R0tCNmlXdVBQQlFlbGNhY0NvQTAyQWRvamJpQ1U2UTlIb1kxcmFF?=
 =?utf-8?B?dnNPL3BhUUFXbVNpVFZJeFhzRWUrM2hROGlMam5WNStGRjc0QUFqNnVzTllu?=
 =?utf-8?B?SHNBU2p3T0F4OFNiOFVRR1hwb0JPa2dKdGpsdTFrNW5JeGRWNWhUSThNM2FE?=
 =?utf-8?B?NVE5bVRzTWVtb1JHbytGK2UwV2pFdEs1WW5oRUtJOW1jbndhMmhVRXNFUVBF?=
 =?utf-8?B?NDFzcnFBN3NVUlhSSUU1UFpGVEE2NUZKeUIyRkN1a0U4R1diUGM5aG5UZytZ?=
 =?utf-8?B?VVlrMVVJOUJ3NkkwZ1V6bHAzaE9HOE13YUZicmkxK0t4SkNHWDV6eTdJQjNt?=
 =?utf-8?B?c284MEFjcXpOem5seVJkMDJVY296Z3VrdWxsbGxaWjBZcWJCNGVHOVk3Q1BO?=
 =?utf-8?B?dytlSkEvekJEQlQ1QkMyaEl1UThlMTdWTEZSRjhTUGhPeWRKSkRsZUdVRDNG?=
 =?utf-8?B?dVptWmV5Z203bHRrK0ZiSmNhS3RpK1lLeGJFVzVDdjRCenpjVGV0ZlFTb3Bl?=
 =?utf-8?B?MUlCZDNiQ3A1Sk8xVUtVcHBBTW9UQmxiWDZIc1JlSWtYL1Y1cm5qUTBJZkVT?=
 =?utf-8?B?N05wNUtEQ0w2aHpFY1p6NkxiZ25pM1dJSkNCTkhWeWpkNTQvMDNrZkhtWURm?=
 =?utf-8?B?SndRZnZFM2FoNlhqL0pmaWYyZFhZVGhBMlJJdGd1U0NyanBlc25vOWdpQmFL?=
 =?utf-8?B?VnlqRlRkWVlQSWYrWkZWbk1CdlAvVEdVT2Y3V1RtNC9XWnZPR1RCb0RmOXRB?=
 =?utf-8?B?bmN4eTBzU0NnVkwwbHFOalk4clN1UHFVQ2JRK0pRQ0F6aVdWQ3g2T2c1Um9J?=
 =?utf-8?B?emNEeWN6blMzVENEcnNHM1ZPNnVRd2xGRzVVelo3dzBiQUh2MGtWaDJQUnYw?=
 =?utf-8?B?cE44YzNVZDZKemYwNnRTWGI1c2RDTWJlTExWOE9iUDByR2JWVlY1OEp3eTBj?=
 =?utf-8?B?TStFM01ZdEgyWnU2Q1Y5amJ2WWMxYjlBTkIvNjAyRzdzdTVWVWJMVEZwSFMw?=
 =?utf-8?B?aXE2cGpOZlV6c1NBd2J3NHAyNWsveEFZUXNVMTlOajQzRUVBWHEyMEpEbjIr?=
 =?utf-8?B?OHc2OHRDejVTV21BVmFITG9UZjM0dEJ0QWtNT3BUTFVkMFNHdHF4b3luU1BS?=
 =?utf-8?B?bEtQU0ordUN4L2o3Yy82L2VNMTdJeXR4enlyeGFMYVJxVXcycXJsZGlubXJU?=
 =?utf-8?B?cVR2b2crZFBWVElpZmJ4am1RR083M2Jyb0xDWU9QK0VSb0t3L2lzQnpGQWg2?=
 =?utf-8?B?ajVEVk1HSVJBQlhkMXFBTmJBNUtELzlZalNSVFBSMUZzWHpPeEtabklNMWM1?=
 =?utf-8?B?RUo4ME1JdlRXdmVwSFpDR2FPTE51c2pXa1RWTDNkMjNMQzZiKzhTWEk5TVJ5?=
 =?utf-8?B?alBSOHFBQUQ5Zjk0cmRHZzBZOEozemIrd0tGM1VkSkFUNUljNFpuT0NyOTUz?=
 =?utf-8?B?bXFVenZOZXN4RWc3Uk4yR0dYK0FJTzhERGVkdXc5dklEVjEwalpjeUlwVEgv?=
 =?utf-8?B?Wk52bnhxQit5dG5OOEZwSEVKRFR1YnF2L0FBV1NlVnRJLzZySzU5SFAzeU9u?=
 =?utf-8?B?TnNmbU9oRUZDRExYVkc4STA4ZXQ0T2UwNm9CMVpWSnhvazNTVWVPa3NtVzBV?=
 =?utf-8?B?RVNTU3VUUTR2N2RQNmI3VkJDL0VWYzh4QmRpUTJ4ZEN4QTZlUy9nV2pQU295?=
 =?utf-8?Q?crB/BXs4QmafW9I3VPRzFjF7DKxD5Ng1?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjZ4WXVyQmx5OXRjSk04WC85ZnJBUmUzTlB6eGR2N0ZsNE1KeWc2bGZOSDdP?=
 =?utf-8?B?MTlicVRJRUF0a1JpOTgxRlZVZk9FTjAyeVVUd2NLQXFKNU52clBOVTQrS3Vk?=
 =?utf-8?B?ZGJqMzBWdW8yMVUvU0dyNXh1MWFLQnpIejB6YmlQTjJYckg2R1dCRUdqNExD?=
 =?utf-8?B?UVVYU1R2cTF6Q0p3Q2JBQkc1bHphTWx6blMrMFBFTVh5K0hPYXg3eVM0MDU1?=
 =?utf-8?B?b05xWTdoblBTanpZQlFZOGVtcHQ1Q29JS2dEVm9KR1NQQ3dHaTZiNzQyY0tN?=
 =?utf-8?B?cUszRmRlZElybXoxZnQ3L1VlK3ZCOVQrMjBjQ3h4dTBaNVVwV2JuM1dCaDJT?=
 =?utf-8?B?Sm9DSE1QbGZOQTJmWTdlZlA3VklrcjMyQThGUEZIaFBTQ3VOeGJwdm4xRGY0?=
 =?utf-8?B?TkNpNHBaeERnQnBCeDVtemxKMFIxTW5QOWRWSHFwd3FRZXhkNmg5S1dqZHVK?=
 =?utf-8?B?UkVYa3JyWU1nWlRzZmlNV1M0cGJpdjNpcVJ3bG9uS0pCRU8xc2ZCdnMzYTVZ?=
 =?utf-8?B?ei9qL2E2VFVyZjgzK2kzNVJ0OWczaEpQWnpZSWVMcVpxUzZZVndaUzBjeWVY?=
 =?utf-8?B?Vll0TnVjSlpKOHFvdFNsM3hXeFpGVzVqdGdQTy9PbEF1a0x2ZVZwSU5oYmN5?=
 =?utf-8?B?Q0FFVjhSanF3UUR1SjBneXE3UjZpUmpxWWNKNzZJeEw3M0VxMFYxQzc0dkp4?=
 =?utf-8?B?VG56bG8zY2FxblN5N3N0VUpKQVJPaFZRdmhMMHJmbDRUMTJvTmw1dFVMcWdl?=
 =?utf-8?B?NEppNy93KzdsYy8yQko4Z0s5aGZjQnFDeXlnQjZkNStqTDQ2ZVE4K1dyMUZY?=
 =?utf-8?B?Y3BsWGF2ZXF2eWtSTm8xU2xSdkNWOE1IaHVRSnQ2c1dJWURyVU9NQmgvNHlX?=
 =?utf-8?B?TUpZN2V1d2dEVWVHeVFOdURpZWxLS3VpSjVSYnptTlpoVitLT0JJMnVmdGZ6?=
 =?utf-8?B?T3BtUmxCUmxyNnlZLzN0VDdEbUtaWXMrRWJVVmovKzdzZjV2V1JWRkw1NEds?=
 =?utf-8?B?MDNXUWUyRTVOakNPNE9nQldwVXJSd1ZMSlJRcVdOWG13OG1Rdkd0UzJndmk0?=
 =?utf-8?B?OEVzRHNZbjRXNUNBalVaenNkaVFRcE5HdUw3Z1JUQmxQRE0zSXRpZHFCaVIx?=
 =?utf-8?B?SUk1VFJQaXJwR1JjZklIbXFlZE9mb2hOd1dMakFubU9Td3ZLTm9mbHdhc2N3?=
 =?utf-8?B?OU9BMUI4YXRNUkJuRlRCdGRSVkxpMThOMFN4ZEduMkpQOUZaajFsNkJld1cz?=
 =?utf-8?B?dUI5ZzJIeDBzS0lBT0Y0QzJOSGNqcm5vRG9FZGNVZmlxL0tmUkEyMmlKSnQ0?=
 =?utf-8?B?amtLMHRiRGl4cDZTVEtaT1laeWJ1SGZ1NmlnWW1hRkZEZVpONlRZM2k0Tmhr?=
 =?utf-8?B?M284aEszQjZDc1pVZndkM1pWYXdCcDlNSnQycDBJay9EMHhqaHZOd2F2REd1?=
 =?utf-8?B?OUFVMmdVendISi9iYkY2ZCtNc3lRSTZ4SmxuMkE4d3VZdVQzSnJKMmhRUEV2?=
 =?utf-8?B?cndsTmkycmwzZVZCSDV3Q2VHRjArV01RSUtucUFIZVFja1BpU2IrbUczb2xE?=
 =?utf-8?B?RHRTY3BESGdicHJCdEdhdHJGdDFCYWp5Mmh2eGxycVNkV3hJbndxYTVabDlu?=
 =?utf-8?B?Q2I2VDNYUHJaREtETE9DQUJFeC82Z3RZWmpOVUZPS2ppMXQxeHF1NHVWeGdi?=
 =?utf-8?B?Y0l2MWU5MUJldEVrS3p3QXE2a2EvRWI5VWhKQncyVTdWQ0xKdG05MDBCYkVv?=
 =?utf-8?B?Rk54L2RmZGVYcU5YcU0xLzFRRGhTbW9LSDFiNUUvUzBNeHNSVGF6L212bHlu?=
 =?utf-8?B?RXp5aHlYaExmMk0vVmtBT3pYMUNKVCtuMHIwcHhYUW5heHpWS09vL1BVcWxP?=
 =?utf-8?B?aGoxSGNaSmtiQzJId2kzTlB2QTNJSmE2bXlWeW43VGMzamtZV2l1R1RGZnBr?=
 =?utf-8?B?VWZZRHVORmxhTisxZW9HNDYyNDV2bmlzcTE0RVl6L29aUG5nK2Q2bTQ0Smlj?=
 =?utf-8?B?YjQ0S0hyUUZTaGNNbk5PMmw5NnNuRXlhaWFjWFJZRjNvSnRmMVl2VGlGTkxo?=
 =?utf-8?B?RkdYbnVqYnR5cVQrQ3RDVStzbC9NWUJsNkU0dzdjSHhkemhLQ29jeGJwSWZR?=
 =?utf-8?B?T2VVOGl6WE5ZNlVLS2JlWUlzekhwMTV2RnJjYmpIdHRreHZ0UGh2aGh2L01Q?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7FBBD925F494E4E9A81099649B4432B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e86c229-7172-4733-6a51-08dd1998f7aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 04:04:53.7297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vLcLuj5qJjb5DS4jM8NVi+iomjVGqqU9Hd9o1mPkNpikMLdQs/FlCn8eglZrjvPcny7s2Kpw+7SH44mpb7kpEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7502
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--19.488500-8.000000
X-TMASE-MatchedRID: cgbqQT5W8hcOwH4pD14DsPHkpkyUphL9fjJOgArMOCZnnK6mXN72m5gC
	Mlq+sZ+fWEDozV8OQeixMzOyGfm1EgDNPxu11HXj4pdq9sdj8LWBHKTJ+sfXGWM+uU0H6Ayrcy4
	sqUzwBjthHyJ4SSKm2UZANm0HdjZex94l9TkMZwvBVprK8rvWXyY5b9OspOHwmyiLZetSf8n5kv
	mj69FXvKEwgORH8p/AjaPj0W1qn0SQZS2ujCtcuA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--19.488500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	46458381C38E7A9A0E2243B3A7BCD5DF3E4835B325E85F598ECE1E12E12E51772000:8

T24gV2VkLCAyMDI0LTEyLTExIGF0IDExOjQ2ICswODAwLCBDSyBIdSB3cm90ZToNCj4gSGksIEph
c29uOg0KPiANCj4gT24gV2VkLCAyMDI0LTEyLTExIGF0IDExOjIyICswODAwLCBKYXNvbi1KSC5M
aW4gd3JvdGU6DQo+ID4gVG8gc3VwcG9ydCBoYXJkd2FyZSB3aXRob3V0IHN1YnN5cyBJRHMgb24g
bmV3IFNvQ3MsIGFkZCBhIHByb2dyYW1taW5nDQo+ID4gZmxvdyB0aGF0IGNoZWNrcyB3aGV0aGVy
IHRoZSBzdWJzeXMgSUQgaXMgdmFsaWQuIElmIHRoZSBzdWJzeXMgSUQgaXMNCj4gPiBpbnZhbGlk
LCB0aGUgZmxvdyB3aWxsIGNhbGwgMiBhbHRlcm5hdGl2ZSBDTURRIEFQSXM6DQo+ID4gY21kcV9w
a3RfYXNzaWduKCkgYW5kIGNtZHFfcGt0X3dyaXRlX3NfdmFsdWUoKSB0byBhY2hpZXZlIHRoZSBz
YW1lDQo+ID4gZnVuY3Rpb25hbGl0eS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1K
SC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYyB8IDM0ICsrKysrKysrKysrKysrKysrKysr
LS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYw0KPiA+
IGluZGV4IGVkYzY0MTc2MzllNi4uMDc5MmM4OTU1MjZmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYw0KPiA+IEBAIC02NiwxNCArNjYsMzggQEAgc3Ry
dWN0IG10a19kZHBfY29tcF9kZXYgew0KPiA+ICAJc3RydWN0IGNtZHFfY2xpZW50X3JlZyBjbWRx
X3JlZzsNCj4gPiAgfTsNCj4gPiAgDQo+ID4gKyNpZiBJU19SRUFDSEFCTEUoQ09ORklHX01US19D
TURRKQ0KPiA+ICtzdGF0aWMgdm9pZCBtdGtfZGRwX3dyaXRlX2NtZHFfcGt0KHN0cnVjdCBjbWRx
X3BrdCAqY21kcV9wa3QsIHN0cnVjdCBjbWRxX2NsaWVudF9yZWcgKmNtZHFfcmVnLA0KPiA+ICsJ
CQkJICAgdW5zaWduZWQgaW50IG9mZnNldCwgdW5zaWduZWQgaW50IHZhbHVlLCB1bnNpZ25lZCBp
bnQgbWFzaykNCj4gDQo+IERyb3AgdGhpcyBmdW5jdGlvbi4NCg0KU29ycnksIGl0IHNlZW1zIGNt
ZHFfc3Vic3lzX2lzX3ZhbGlkKCkgaXMgdXNlZCB0byBjaGVjayB0aGUgU29DIHN1cHBvcnQgbmV3
IEFQSSBvciBub3QuDQpCdXQgSSB3b3VsZCB0cnkgdG8gZmluZCBvdXQgYSB3YXkgbm90IHRvIGFs
d2F5cyBjaGVjayB1c2luZyBuZXcgQVBJIG9yIG5vdC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+
ID4gK3sNCj4gPiArCXN0cnVjdCBjbWRxX2NsaWVudCAqY2wgPSAoc3RydWN0IGNtZHFfY2xpZW50
ICopY21kcV9wa3QtPmNsOw0KPiA+ICsNCj4gPiArCW9mZnNldCArPSBjbWRxX3JlZy0+b2Zmc2V0
Ow0KPiA+ICsNCj4gPiArCWlmIChjbWRxX3N1YnN5c19pc192YWxpZChjbC0+Y2hhbiwgY21kcV9y
ZWctPnN1YnN5cykpIHsNCj4gPiArCQlpZiAobWFzayA9PSBHRU5NQVNLKDMxLCAwKSkNCj4gPiAr
CQkJY21kcV9wa3Rfd3JpdGUoY21kcV9wa3QsIGNtZHFfcmVnLT5zdWJzeXMsIG9mZnNldCwgdmFs
dWUpOw0KPiA+ICsJCWVsc2UNCj4gPiArCQkJY21kcV9wa3Rfd3JpdGVfbWFzayhjbWRxX3BrdCwg
Y21kcV9yZWctPnN1YnN5cywgb2Zmc2V0LCB2YWx1ZSwgbWFzayk7DQo+ID4gKwl9IGVsc2Ugew0K
PiA+ICsJCS8qIG9ubHkgTU1JTyBhY2Nlc3MsIG5vIG5lZWQgdG8gY2hlY2sgbW1pbmZyb19vZmZz
ZXQgKi8NCj4gPiArCQljbWRxX3BrdF9hc3NpZ24oY21kcV9wa3QsIDAsIENNRFFfQUREUl9ISUdI
KGNtZHFfcmVnLT5wYV9iYXNlKSk7DQo+ID4gKwkJaWYgKG1hc2sgPT0gR0VOTUFTSygzMSwgMCkp
DQo+ID4gKwkJCWNtZHFfcGt0X3dyaXRlX3NfdmFsdWUoY21kcV9wa3QsIDAsIENNRFFfQUREUl9M
T1cob2Zmc2V0KSwgdmFsdWUpOw0KPiA+ICsJCWVsc2UNCj4gPiArCQkJY21kcV9wa3Rfd3JpdGVf
c19tYXNrX3ZhbHVlKGNtZHFfcGt0LCAwLCBDTURRX0FERFJfTE9XKG9mZnNldCksDQo+ID4gKwkJ
CQkJCSAgICB2YWx1ZSwgbWFzayk7DQo+ID4gKwl9DQo+ID4gK30NCj4gPiArI2VuZGlmDQo+ID4g
Kw0KPiA+ICB2b2lkIG10a19kZHBfd3JpdGUoc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCwgdW5z
aWduZWQgaW50IHZhbHVlLA0KPiA+ICAJCSAgIHN0cnVjdCBjbWRxX2NsaWVudF9yZWcgKmNtZHFf
cmVnLCB2b2lkIF9faW9tZW0gKnJlZ3MsDQo+ID4gIAkJICAgdW5zaWduZWQgaW50IG9mZnNldCkN
Cj4gPiAgew0KPiA+ICAjaWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4gPiAgCWlm
IChjbWRxX3BrdCkNCj4gPiAtCQljbWRxX3BrdF93cml0ZShjbWRxX3BrdCwgY21kcV9yZWctPnN1
YnN5cywNCj4gPiAtCQkJICAgICAgIGNtZHFfcmVnLT5vZmZzZXQgKyBvZmZzZXQsIHZhbHVlKTsN
Cj4gPiArCQltdGtfZGRwX3dyaXRlX2NtZHFfcGt0KGNtZHFfcGt0LCBjbWRxX3JlZywgb2Zmc2V0
LCB2YWx1ZSwgR0VOTUFTSygzMSwgMCkpOw0KPiANCj4gLyogb25seSBNTUlPIGFjY2Vzcywgbm8g
bmVlZCB0byBjaGVjayBtbWluZnJvX29mZnNldCAqLw0KPiBjbWRxX3BrdF9hc3NpZ24oY21kcV9w
a3QsIENNRFFfWFhYUkVHXzAsIENNRFFfQUREUl9ISUdIKGNtZHFfcmVnLT5wYV9iYXNlKSk7DQo+
IGNtZHFfcGt0X3dyaXRlX3NfdmFsdWUoY21kcV9wa3QsIENNRFFfWFhYUkVHXzAsIENNRFFfQURE
Ul9MT1cob2Zmc2V0KSwgdmFsdWUpOw0KPiANCj4gPiAgCWVsc2UNCj4gPiAgI2VuZGlmDQo+ID4g
IAkJd3JpdGVsKHZhbHVlLCByZWdzICsgb2Zmc2V0KTsNCj4gPiBAQCAtODUsOCArMTA5LDcgQEAg
dm9pZCBtdGtfZGRwX3dyaXRlX3JlbGF4ZWQoc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCwgdW5z
aWduZWQgaW50IHZhbHVlLA0KPiA+ICB7DQo+ID4gICNpZiBJU19SRUFDSEFCTEUoQ09ORklHX01U
S19DTURRKQ0KPiA+ICAJaWYgKGNtZHFfcGt0KQ0KPiA+IC0JCWNtZHFfcGt0X3dyaXRlKGNtZHFf
cGt0LCBjbWRxX3JlZy0+c3Vic3lzLA0KPiA+IC0JCQkgICAgICAgY21kcV9yZWctPm9mZnNldCAr
IG9mZnNldCwgdmFsdWUpOw0KPiA+ICsJCW10a19kZHBfd3JpdGVfY21kcV9wa3QoY21kcV9wa3Qs
IGNtZHFfcmVnLCBvZmZzZXQsIHZhbHVlLCBHRU5NQVNLKDMxLCAwKSk7DQo+IA0KPiAvKiBvbmx5
IE1NSU8gYWNjZXNzLCBubyBuZWVkIHRvIGNoZWNrIG1taW5mcm9fb2Zmc2V0ICovDQo+IGNtZHFf
cGt0X2Fzc2lnbihjbWRxX3BrdCwgQ01EUV9YWFhSRUdfMCwgQ01EUV9BRERSX0hJR0goY21kcV9y
ZWctPnBhX2Jhc2UpKTsNCj4gY21kcV9wa3Rfd3JpdGVfc192YWx1ZShjbWRxX3BrdCwgQ01EUV9Y
WFhSRUdfMCwgQ01EUV9BRERSX0xPVyhvZmZzZXQpLCB2YWx1ZSk7DQo+IA0KPiA+ICAJZWxzZQ0K
PiA+ICAjZW5kaWYNCj4gPiAgCQl3cml0ZWxfcmVsYXhlZCh2YWx1ZSwgcmVncyArIG9mZnNldCk7
DQo+ID4gQEAgLTk4LDggKzEyMSw3IEBAIHZvaWQgbXRrX2RkcF93cml0ZV9tYXNrKHN0cnVjdCBj
bWRxX3BrdCAqY21kcV9wa3QsIHVuc2lnbmVkIGludCB2YWx1ZSwNCj4gPiAgew0KPiA+ICAjaWYg
SVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4gPiAgCWlmIChjbWRxX3BrdCkgew0KPiA+
IC0JCWNtZHFfcGt0X3dyaXRlX21hc2soY21kcV9wa3QsIGNtZHFfcmVnLT5zdWJzeXMsDQo+ID4g
LQkJCQkgICAgY21kcV9yZWctPm9mZnNldCArIG9mZnNldCwgdmFsdWUsIG1hc2spOw0KPiA+ICsJ
CW10a19kZHBfd3JpdGVfY21kcV9wa3QoY21kcV9wa3QsIGNtZHFfcmVnLCBvZmZzZXQsIHZhbHVl
LCBtYXNrKTsNCj4gDQo+IC8qIG9ubHkgTU1JTyBhY2Nlc3MsIG5vIG5lZWQgdG8gY2hlY2sgbW1p
bmZyb19vZmZzZXQgKi8NCj4gY21kcV9wa3RfYXNzaWduKGNtZHFfcGt0LCBDTURRX1hYWFJFR18w
LCBDTURRX0FERFJfSElHSChjbWRxX3JlZy0+cGFfYmFzZSkpOw0KPiBjbWRxX3BrdF93cml0ZV9z
X21hc2tfdmFsdWUoY21kcV9wa3QsIENNRFFfWFhYUkVHXzAsIENNRFFfQUREUl9MT1cob2Zmc2V0
KSwNCj4gCQkJICAgIHZhbHVlLCBtYXNrKTsNCj4gDQo+IENNRFFfWFhYUkVHXzAgaXMgZGVmaW5l
ZCBpbiBjbWRxIGhlYWRlciBmaWxlLg0KPiANCj4gUmVnYXJkcywNCj4gQ0sNCj4gDQo+ID4gIAl9
IGVsc2Ugew0KPiA+ICAjZW5kaWYNCj4gPiAgCQl1MzIgdG1wID0gcmVhZGwocmVncyArIG9mZnNl
dCk7DQo+IA0KDQo=

