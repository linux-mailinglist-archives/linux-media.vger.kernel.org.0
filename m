Return-Path: <linux-media+bounces-21812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 327F79D5CD2
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90D5CB2699E
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81CC21DDC2B;
	Fri, 22 Nov 2024 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AyXl3uQr";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fg6NbL8A"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ADE176FD2;
	Fri, 22 Nov 2024 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269692; cv=fail; b=EI2UYiEY569IRIPDvZ1tXu9PtqMC1MBy4xm5G6Ip6GcQjCMK5qoteP5t22SfCar4zAa50GZElBe11mBACz4D8OZ3gYPq/j8xSLza498RpMxPFs1jZctK0YOkxYRKz0xhlqt3ZlApLz3xB3Cx7TuJB6Xhs3Sdqu9BlRnNGXQsZsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269692; c=relaxed/simple;
	bh=RlGLhSCCc0Mth4QQgc33Hs/rleEHmnBNo/MIsQMp7Es=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tYYHjGhNuh5ZCGQ2Xcsk5sCRUtjptjx8jd0pINyC3imTecVSC5S1RG3Gk1hBFnBdwyd+LREfWDLjW9wl2fj8AFe9JFGBQS9w8b8hoz0/KComh5CzajJ//7l2xdcEu1mR/+ZPjXjGuEzqWyUxyAp+jkCjqUE88uUTVQYXV1L71+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=AyXl3uQr; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=fg6NbL8A; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b9a963d2a8b811efbd192953cf12861f-20241122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=RlGLhSCCc0Mth4QQgc33Hs/rleEHmnBNo/MIsQMp7Es=;
	b=AyXl3uQr9Owk9gh8LyxKEePz4p2JUfbrsugHnlKTeY1fDcmeVVEYszOXVV4fjkOL818JEsYhbGblSSVcOX1+FatZGRU0H8r5sZueqciT2MpJPvU72Rc1MibhULHVGDJ2pWbyrPWPPN+WFkkDbK1A0oNqNXD18b4uLMhNc+qIbuQ=;
X-CID-CACHE: Type:Local,Time:202411221719+08,HitQuantity:3
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:f8763f56-83f9-4ee1-8bb8-9da62779ee4c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:3b5d3bb9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b9a963d2a8b811efbd192953cf12861f-20241122
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1339924982; Fri, 22 Nov 2024 18:01:21 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Nov 2024 18:01:20 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Nov 2024 18:01:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaHbydK9oBFqhgYN+I6lVc3maRbvCFxIoSfIQ+w8hO+BaNVrefW5lwR8bZOLcRQqa/itLVVxv93y4JXM48wtOLuBQRJRIF0/rb2i1TWW/riFzwqR/i/9RSbFZ2QTrPuihj1S9JCzFA0BC315nGMqiBQ1AHgCWfGeamRceB9Kfai5nyAiaObgxDjSAx4SWR9Ppx80sPSe+aiuQOJUNktIvFaQm+RgQ921cteQOh310MaMiVcDSVPQ9CUi+s+A+BQXIqN43xF0Ka9STcZezqmxP01N+TnU6gHkH0ZwowpxcRAUkJQv86ucsfdSwHtfhRXoGnWKbmoy3/CmQOMGEaLWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlGLhSCCc0Mth4QQgc33Hs/rleEHmnBNo/MIsQMp7Es=;
 b=JokpqOyXVaHOmu4cNxBi1FGm6Br6zCGXgedeX2fQGfzJYYr0vMiH2Q/RfAXzypRaccYpo/yHhsxVSM4Q8/CvQVqvGEKrBxJ7JPwh5BsYIgclL839y2lLkW+RTKby8eed9hH621CM309RJCcIOJsOnNSuORKsZaVUxyTXOzJmqAAPmPeoaMS5SAAeaVtdwEi0GZutNhRcb97FV+xivDgmqBxlaftDgMS2gGYQOzwaozuYmp+4QrFpep0IIHBbb1ZBwQUDccQfWH1jT8dhb33YlFWYvrGv6muaYn4pC0lOI6PsGa/+SqQv9ffKXp+G8MlmE/uOk3iVQRRfmLlFhn7zzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlGLhSCCc0Mth4QQgc33Hs/rleEHmnBNo/MIsQMp7Es=;
 b=fg6NbL8AIE6yHDeqw+x4IanhDH5tve12S8XfarM633ILYIKEihiMyiViWh0GohpKY2saupq40lo/J8r3dkPyAYUi+nPnb1//W4gz8IWkmUVzIYoAZ+ZodUQOrq5ThYnssR1Q8SzNan3xx0uwqbS7KH4eS6sqbbuDZseGdTepYeI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6441.apcprd03.prod.outlook.com (2603:1096:101:41::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 10:01:17 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 10:01:17 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: Julien Stephan <jstephan@baylibre.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLC/MCAgAAMVYCAAAaQAIAAAIKAgAAC4gA=
Date: Fri, 22 Nov 2024 10:01:17 +0000
Message-ID: <b234ccf388cfc933d7941cbe94ce6ae590ad17e1.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
	 <767085562b5efb43f248e8528bb154a6c30d3999.camel@mediatek.com>
	 <CAEHHSvaePj2MUg+zgmkpZF4HTj_F9ED0RxuzQr2oOAUJgOieng@mail.gmail.com>
	 <bd73658d8ceac0ce236f08f31065350123056724.camel@mediatek.com>
	 <CAEHHSvZLx3MqzK_qheiXm1UsB=i=8f2QbGTpXPkdU2aqUJtvww@mail.gmail.com>
In-Reply-To: <CAEHHSvZLx3MqzK_qheiXm1UsB=i=8f2QbGTpXPkdU2aqUJtvww@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6441:EE_
x-ms-office365-filtering-correlation-id: 93dac740-3592-4848-ec44-08dd0adc9b8b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L3ZCNDlvSVVCZUplMnQ0c0VWQnJseGdveWd4N0FYN0cwNXlPYTA0RjFYVm5x?=
 =?utf-8?B?SW92dGdXY05CSThueGlBejJJOUk0NHlOOFhFSWV0Zk4vTWk1dGE1V2trbTJF?=
 =?utf-8?B?bDFjWWNYNHdnVG8yaHUzUXdza0dqc0R4ZnNRUEc4Qkw1VnZUVkZnSk4zTklL?=
 =?utf-8?B?VFNlVlcvbC9OaVBkWm1wVWVrZjdWM0FTVTh1SWpXYWh2OFRpUC92N2lrSGxE?=
 =?utf-8?B?bndJazNISVlZMlc2VURETFBnU0JDRFR4a3ZPZjB0Rk9tVEhCQXpyRE9JT25y?=
 =?utf-8?B?Nnh2V2VpVTEwM0tjby9QdjIxa2svQ1ZBL014Ujdld0lNZzFpaGtHZ1dBNlNy?=
 =?utf-8?B?eE83VURsY0l5TWNlSUZ1bDJRSUZUNTUxdWMzOVZQR0E4WU85bFFoY2RBNXdq?=
 =?utf-8?B?U1l1ZG4xS0JNYk15UzN4K1JPVmFPVHlhc2pkY1ZkczJQbDFPWkJTTVJaTTcw?=
 =?utf-8?B?bnJ3cHhjVnUyQS9FOTBtemRYWUZ6M0xMekhCMVh3Wk1QczAyTVl2QU9vbWgw?=
 =?utf-8?B?bWVzRHI1RmJETVpvQityS0thRHBEOU5rUWJTTW5uNVVrZ0xValhqM0dETmRi?=
 =?utf-8?B?UUVqVnd4YmtsN2wvT3pwdzljZC9oK2RMNWxMN1hFdHZKT3pqOStkNHZHVGF2?=
 =?utf-8?B?RWNRakU2NnhuWW5RZC9rTHF0MFdNOVRSSkNEaHEyWDl3VzZ1M25VS1dGeDEy?=
 =?utf-8?B?ZVFSZnkwcklKMUV5bXYxcTU3VlRZWXNyNmhNNzEwSlYwTkVhNzArUnoyUENF?=
 =?utf-8?B?K1N3bjFHYWsraTRmQVd2cjFCOC8zL2dFbG5SUmx1Q0RLa0FqditzcWZBZUdX?=
 =?utf-8?B?YUlxeDIxY0R2T1Z4RGo2a0hLTW5QMTBZczRwdUVCaVZycVJLcncvRW0rNlVD?=
 =?utf-8?B?NzN5QXlGYmduQmprUWhBYWczQm9wYVJaOGU4cUNLb29lWVFWUy80aGtmaVhl?=
 =?utf-8?B?blF2cUVSMjNSZE1JZXdWcFA3Nnl1bUsvZTBVaGF6ck10djByR3Y0TUtwZGtw?=
 =?utf-8?B?d1g4Zmc0bXAxYzNMWGVGbHY0Q3l1UlRDcHRsMWUrSlNZbTdkTGtFcmR1RUlk?=
 =?utf-8?B?cG1lRlErMDJRM2FDcTVpOWNHWjJSMTFJL3ZnbzJXdUpmM2FBS3k0aXpER3B0?=
 =?utf-8?B?eUJhMjNxUlRjRnpUVTV5ZXNvZU94YzlXSlhVRTExVWpTdzJwWHQ0RzlLZ3BR?=
 =?utf-8?B?cGZCTDJRUDVSTUhrcnlmL0NNR29wWHh3c0k0Mnlxb1lmT29EYzNMRHNQWkFL?=
 =?utf-8?B?N29KbnpvRTYyZ0Q5TDkwUnY1TmxrV2FlUC80R2Q1Qi9IUkI5ZWs5d0lGT1dw?=
 =?utf-8?B?enVxZ05WSThmQUZhczY1ckZGd2JTR0xmdE8rUWxteUY4SGdFKzM5RThzcVlS?=
 =?utf-8?B?OStwVUEreHJsaUlFVTFrMjJ4TGdjWUhrU252WUk1VXp5d2dydUk0YU04NFNj?=
 =?utf-8?B?VG5CU2FWVVdGQldncGk3TW5mRytGMXRIVnV6eWhHQ2M4VWpyNjZ0T2ZzUDk5?=
 =?utf-8?B?b0g3cy91bjVZSmJaYmo5MmM5NG81L1RDQjl0NzQreDcvM1BpN0Z2ZURqUndj?=
 =?utf-8?B?eHFOenNSMm0zMzRpVHhmbDE4Rll2MzZTM2YyaUJYb1VnaUsyekpFSDlOclc2?=
 =?utf-8?B?Zm81SkZnOENOWTBpaFk5dDM3Rms2MFJjWERBS3ByWlNmMlRDMHJVRW03aDdS?=
 =?utf-8?B?cW51T3BzYy8yMVhyK0x4SW43eElSRzZoWHFYK2dhUTRNc0VDRXFSWkFHYWh2?=
 =?utf-8?B?SEQzMjRseUx5U2JscjgxanY2WDhMNjV0a1doamdmc2d5MVBsbE9WT3VQNTAz?=
 =?utf-8?B?SGp6ZVZ1S1ZJYjJJc0xOMnk3WUdxZzZZTEYwNlloZS9ESW50OUxZZWVCY1VZ?=
 =?utf-8?B?MUJNVmNnYXRDbHF6bmR4bDAySjBVQmY2c1BlZzNTb0QzZFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFNGdnlWOXZBVmZBdngwWVgwUHkvbHlla2RpbGxCZE5kN2FMSlFQRy9uSUV0?=
 =?utf-8?B?RjAxZlRWWmlDRVdaUnVYWFFtSGtQV2lGZXZzWFJhNi94dDNtODJ3Q0N1Z0FB?=
 =?utf-8?B?NlhlYS9CTGpCcDlBM2w2UytPYksrRk14bXlDMk1IWU9wQmcxL0RtT0srOElr?=
 =?utf-8?B?eUpYenFDSXk5TGxNQ0kxaTJWejFxNW5uaHd6R25KdGFnVkt6VkhyU1VzVmg4?=
 =?utf-8?B?NkRYVmVEbGs0anVQSnpRa1BBYitsK3J2RWw0QXVTbUFNTjdHb3Jxd1JQZ1Zk?=
 =?utf-8?B?MkxGTlJRaVJQZkg0ckdiOFJrYkZiMzAwVk9pQlh1czRHcVFMT1NsWHE2VGEv?=
 =?utf-8?B?am9GQ2orV2VGSjBMWVRmamxSc2RITjRmZzJCRFFud09KRENxcTVXanVXWGlm?=
 =?utf-8?B?TkZzS24zVkdjVjRiS1dLSFRnL0FOenVpTE1iSFRabGJudHlacnNIaVVLdndM?=
 =?utf-8?B?RHgrbTlKYmdPN0pPV3ZFU1FvV1JCT3BCdWF2VlVwMHMwQWV2ZTlVWDhGekNG?=
 =?utf-8?B?ZjlDYURoYy9TNHpsWmpZck5ENkdzaVZFYkkxN0tHb1VLRlJxNk9NdHNDQ3N5?=
 =?utf-8?B?UXJndWN1MVEvZWZFR2d2ZXlqTnBPRURDMkdacytlUU5jNXF3bUJWcTNaLzVE?=
 =?utf-8?B?T2YwUUZFWXV6c0t4K2hFWUJEZmRScDgwTXdTaXFkSGxzOTdKbUxtR3l4U0RP?=
 =?utf-8?B?QWRPc2Qxa2RxeWNwWFZ4dStnZWVRdlYvYXJkWlF5Q1NuRElBeFozZlJQVWFY?=
 =?utf-8?B?MXNOMkRIUFlqeG9aZFlidnoxUlhRakI0S1RQRGpxcm16ZklObjU5c3M4eE1E?=
 =?utf-8?B?WS9oMFBYV3h3dy9hazNreVU4ZklMaitZY1NxQkxKTy9MQk0zaFNIRUd0VjY4?=
 =?utf-8?B?M2owcVFMRlNzWHZCNzY3TUlwbHFYVStzZGpCc3JFWVJ4aVNKSTgrNU5kRHZW?=
 =?utf-8?B?VnJlL0p5N1VobW5nQnEvRlExUlFBUHBpLzJRNGY2TFRyL0JMM1F4WjQ5c1hL?=
 =?utf-8?B?M3VEM3FhQjE2NDBCSHR1aW9KYnlTYTY4Mno5c1VIaHZKazdBYTcycnJ2V1FF?=
 =?utf-8?B?dEo1MDlFZFpnTFNaYlNZcnFEcmFiQ2VNbnRLZWE4T2pjWG9lSVRlRzkwVHFG?=
 =?utf-8?B?YjdURitSVWtZbkpoWFFIQ3R5SzN0Rk8wcmdXN3ZiVDNxaktwQzZxYlRnWmZZ?=
 =?utf-8?B?bjBjaW9nQjNxUmNXOXlMS1ZRclV1akJ1N1Z1bVFqSVQrYmEwTEF4ZmVrb0Z1?=
 =?utf-8?B?c3ZVSXM1RW5qbzNCL2p1TDVwLzRJL216TXo3dGlpb3JOT09LQjYvdzNTK2Nu?=
 =?utf-8?B?Tmg4bW5zVTdMTDlmSStGbGdSZW5IalA5VWdPRGJRTDZBSWZTWlJsUEo3bS9a?=
 =?utf-8?B?cE1hYmZYUndRMkk1V3kvWHBCYlRGYVhJNjA5U29jZzJENmV2NVdzRWNsNldP?=
 =?utf-8?B?dVhkUHNFYXJTSE45bzFxQURMVTBqRzhDcjBuNDM4SVBlOGlnVDVnY2hCZ0JE?=
 =?utf-8?B?NE9CUk5wc0RWekJhSi9XOXJQdGpPQnZJQm81UVhNZnBWWm1rTDdDWGd4Ykl6?=
 =?utf-8?B?MjU5ZG5VRURPbmFoZmYza3JjWUFvSkkyV3FNa0NFSTlFVi9CY1FwTnQyODhB?=
 =?utf-8?B?VnZFQ01oVUNYaDVIaUR6dURZeVZ4bWxSQ0xha3FtL2RDOWYwa2ZMc2dxM0s0?=
 =?utf-8?B?b1d4TGNIamxrSHFkS29lVzRueWVuRk52MjRoc1k2RWdPRjVqNW8rcER6cExn?=
 =?utf-8?B?a3dpS05BR0xMSEpOWldDWVpRR3cydmcwSzlVZEcvaVA0dW1DcWdxMVlDZDcv?=
 =?utf-8?B?MC8zWGRpclVwUUcrbHhDVElJaFA0QndVRE9zaHJTbUE0MW0zUW1jblFjSHV3?=
 =?utf-8?B?UXNFVEQwYytLempoZXdCbHM2VzBTYzBWZndBUjB5Si9JNmVUMGM2OGJhWll5?=
 =?utf-8?B?VHJvWUpiV2VOaEUybUplcVFVdWMyZVljM0JlZFNnZ2hqMGI3d3Q1TjdqeHdF?=
 =?utf-8?B?UW0zM2hNbDI1YWx4NXMwZC81NjR5Z3dpQzlBeTdkRUNvM1M0d05CeEhjV2V6?=
 =?utf-8?B?OFJ1YnBTdnArMGx0cXRWVmY5dzNUcmtOaldOdlliRjBnK1V3U1M3ZlZVSXc4?=
 =?utf-8?Q?r8vs7/j4PghQOpojEbPro/No4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88567BA61B927D40BE57422E76A0906C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dac740-3592-4848-ec44-08dd0adc9b8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 10:01:17.5106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XTvTMKXDgeTAprOz2JJSKP/c4b9DybK/unjrpkUQ75Yh0IvGBECoRHQiqsF+acgFw2aaz0210PlQD+vfLt/y1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6441
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--40.761600-8.000000
X-TMASE-MatchedRID: cxtZ8fwm3r8OwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0rWz+cNVAnKHMELLYkjA+xdbc297PAGtWYhdi6zxllm1t3eUkv0LDwMQet
	Uhp4fOly6VMXtSc8qd7WrjxGHjCv1+b1ay1xHBnGimtMQe97AAH607foZgOWyTUobVis5Bb+WI1
	wlJxaoHqiqT2q4UZl79nkzMtsPLI5YpgZmiuURrRz2MDiYujy5GSqdEmeD/nXcrrVBXD2hQS+8O
	xujShyxFfvULuELtuQI5Lh+LXfcQjIwN7B72WwVuIwLnB3Aqp0hHWssEmb8zlpbYq2f4jz+IONi
	d9UX23PghRwq0IGq32VxZV0zkIQxD7+f/jfUYxKn1yJegn+la0yQ5fRSh2658Ule2AXgYUsW1lS
	OgCDSgiXdQfNPKDhI540totUM1ax3IO1C4g5x4VZ0E+oA5pdVdOVUTSKvfakRU+pbc3JVjZFXCG
	KLXjlL5tUpPQ+IUHd8njrd4uSzC8/mgMItUzYIkxIExNA2JIBU+YqtAU+F2dqCxkzSpW/XqF+W1
	M0kGT8RnrkKGK4/PJGTpe1iiCJq0u+wqOGzSV0LbigRnpKlKT4yqD4LKu3A
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--40.761600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	A3F57C790A5E11775C64707A329E40B38B41A2CA8E710BEA92F9D5FA6E296F962000:8

T24gRnJpLCAyMDI0LTExLTIyIGF0IDEwOjUwICswMTAwLCBKdWxpZW4gU3RlcGhhbiB3cm90ZToN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVu
dC4NCj4gDQo+IA0KPiBMZSB2ZW4uIDIyIG5vdi4gMjAyNCDDoCAxMDo0OSwgQ0sgSHUgKOiDoeS/
iuWFiSkgPGNrLmh1QG1lZGlhdGVrLmNvbT4gYSDDqWNyaXQgOg0KPiA+IA0KPiA+IE9uIEZyaSwg
MjAyNC0xMS0yMiBhdCAxMDoyNSArMDEwMCwgSnVsaWVuIFN0ZXBoYW4gd3JvdGU6DQo+ID4gPiBF
eHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0K
PiA+ID4gDQo+ID4gPiANCj4gPiA+IExlIHZlbi4gMjIgbm92LiAyMDI0IMOgIDA5OjQxLCBDSyBI
dSAo6IOh5L+K5YWJKSA8Y2suaHVAbWVkaWF0ZWsuY29tPiBhIMOpY3JpdCA6DQo+ID4gPiA+IA0K
PiA+ID4gPiBIaSwgSnVsaWVuOg0KPiA+ID4gPiANCj4gPiA+ID4gT24gVGh1LCAyMDI0LTExLTIx
IGF0IDA5OjUzICswMTAwLCBKdWxpZW4gU3RlcGhhbiB3cm90ZToNCj4gPiA+ID4gPiBFeHRlcm5h
bCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEZyb206IFBoaS1iYW5nIE5ndXllbiA8cG5ndXll
bkBiYXlsaWJyZS5jb20+DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhpcyBkcml2ZXIgcHJvdmlk
ZXMgYSBwYXRoIHRvIGJ5cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gPiA+
ID4gPiBjb21pbmcgZnJvbSB0aGUgU0VOSU5GIGNhbiBnbyBkaXJlY3RseSBpbnRvIG1lbW9yeSB3
aXRob3V0IGFueSBpbWFnZQ0KPiA+ID4gPiA+IHByb2Nlc3NpbmcuIFRoaXMgYWxsb3dzIHRoZSB1
c2Ugb2YgYW4gZXh0ZXJuYWwgSVNQLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFBoaS1iYW5nIE5ndXllbiA8cG5ndXllbkBiYXlsaWJyZS5jb20+DQo+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogRmxvcmlhbiBTeWx2ZXN0cmUgPGZzeWx2ZXN0cmVAYmF5bGlicmUuY29tPg0K
PiA+ID4gPiA+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBQYXVsIEVsZGVyIDxwYXVsLmVsZGVyQGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPiA+
ID4gQ28tZGV2ZWxvcGVkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+ID4gPiA+IENvLWRldmVs
b3BlZC1ieTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNvbT4NCj4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gU3RlcGhhbiA8anN0ZXBoYW5AYmF5bGlicmUuY29tPg0K
PiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiANCj4gPiA+ID4gW3NuaXBdDQo+ID4gPiA+IA0KPiA+ID4g
PiA+ICtzdGF0aWMgaXJxcmV0dXJuX3QgaXNwX2lycV9jYW1zdjMwKGludCBpcnEsIHZvaWQgKmRh
dGEpDQo+ID4gPiA+ID4gK3sNCj4gPiA+ID4gPiArICAgICAgIHN0cnVjdCBtdGtfY2FtX2RldiAq
Y2FtX2RldiA9IChzdHJ1Y3QgbXRrX2NhbV9kZXYgKilkYXRhOw0KPiA+ID4gPiA+ICsgICAgICAg
c3RydWN0IG10a19jYW1fZGV2X2J1ZmZlciAqYnVmOw0KPiA+ID4gPiA+ICsgICAgICAgdW5zaWdu
ZWQgaW50IGlycV9zdGF0dXM7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsgICAgICAgc3Bpbl9s
b2NrKCZjYW1fZGV2LT5idWZfbGlzdF9sb2NrKTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAg
ICAgICBpcnFfc3RhdHVzID0gbXRrX2NhbXN2MzBfcmVhZChjYW1fZGV2LCBDQU1TVl9JTlRfU1RB
VFVTKTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAgICAgICBpZiAoaXJxX3N0YXR1cyAmIElO
VF9TVF9NQVNLX0NBTVNWX0VSUikNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgZGV2X2Vycihj
YW1fZGV2LT5kZXYsICJpcnEgZXJyb3IgMHglbHhcbiIsDQo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgaXJxX3N0YXR1cyAmIElOVF9TVF9NQVNLX0NBTVNWX0VSUik7DQo+ID4gPiA+
ID4gKw0KPiA+ID4gPiA+ICsgICAgICAgLyogRGUtcXVldWUgZnJhbWUgKi8NCj4gPiA+ID4gPiAr
ICAgICAgIGlmIChpcnFfc3RhdHVzICYgQ0FNU1ZfSVJRX1BBU1MxX0RPTikgew0KPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICBjYW1fZGV2LT5zZXF1ZW5jZSsrOw0KPiA+ID4gPiA+ICsNCj4gPiA+
ID4gPiArICAgICAgICAgICAgICAgYnVmID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZjYW1f
ZGV2LT5idWZfbGlzdCwNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBtdGtfY2FtX2Rldl9idWZmZXIsDQo+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaXN0KTsNCj4gPiA+
ID4gPiArICAgICAgICAgICAgICAgaWYgKGJ1Zikgew0KPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGJ1Zi0+djRsMl9idWYuc2VxdWVuY2UgPSBjYW1fZGV2LT5zZXF1ZW5jZTsNCj4g
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBidWYtPnY0bDJfYnVmLnZiMl9idWYudGlt
ZXN0YW1wID0NCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGt0aW1l
X2dldF9ucygpOw0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHZiMl9idWZmZXJf
ZG9uZSgmYnVmLT52NGwyX2J1Zi52YjJfYnVmLA0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBWQjJfQlVGX1NUQVRFX0RPTkUpOw0KPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGxpc3RfZGVsKCZidWYtPmxpc3QpOw0KPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICB9DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBi
dWYgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoJmNhbV9kZXYtPmJ1Zl9saXN0LA0KPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IG10a19jYW1fZGV2X2J1ZmZlciwNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxpc3QpOw0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBp
ZiAoYnVmKQ0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIG10a19jYW1zdjMwX3Vw
ZGF0ZV9idWZmZXJzX2FkZChjYW1fZGV2LCBidWYpOw0KPiA+ID4gPiANCj4gPiA+ID4gSWYgYnVm
ID09IE5VTEwsIHNvIGhhcmR3YXJlIHdvdWxkIGF1dG9tYXRpY2FsbHkgc3RvcCBETUE/DQo+ID4g
PiA+IEkgZG9uJ3Qga25vdyBob3cgdGhpcyBoYXJkd2FyZSB3b3JrLg0KPiA+ID4gPiBCZWxvdyBp
cyBteSBpbWFnaW5lIGFib3V0IHRoaXMgaGFyZHdhcmUuDQo+ID4gPiA+IA0KPiA+ID4gPiAxLiBT
b2Z0d2FyZSB1c2UgQ0FNU1ZfSU1HT19GQkNfUkNOVF9JTkMgdG8gaW5jcmVhc2Ugc29mdHdhcmUg
YnVmZmVyIGluZGV4Lg0KPiA+ID4gPiAyLiBIYXJkd2FyZSBoYXMgYSBoYXJkd2FyZSBidWZmZXIg
aW5kZXguIEFmdGVyIGhhcmR3YXJlIGZpbmlzaCBvbmUgZnJhbWUsIGhhcmR3YXJlIGJ1ZmZlciBp
bmRleCBpbmNyZWFzZS4NCj4gPiA+ID4gMy4gQWZ0ZXIgc29mdHdhcmUgYnVmZmVyIGluZGV4IGlu
Y3JlYXNlLCBoYXJkd2FyZSBzdGFydCBETUEuDQo+ID4gPiA+IDQuIFdoZW4gaGFyZHdhcmUgYnVm
ZmVyIGluZGV4IGlzIGVxdWFsIHRvIHNvZnR3YXJlIGJ1ZmZlciBpbmRleCwgaGFyZHdhcmUgYXV0
b21hdGljYWxseSBzdG9wIERNQS4NCj4gPiA+ID4gDQo+ID4gPiA+IERvZXMgdGhlIGhhcmR3YXJl
IHdvcmsgYXMgbXkgaW1hZ2luZT8NCj4gPiA+ID4gSWYgaGFyZHdhcmUgY291bGQgYXV0b21hdGlj
YWxseSBzdG9wIERNQSwgYWRkIGNvbW1lbnQgdG8gZGVzY3JpYmUuDQo+ID4gPiA+IElmIGhhcmR3
YXJlIGNvdWxkIG5vdCBhdXRvbWF0aWNhbGx5IHN0b3AgRE1BLCBzb2Z0d2FyZSBzaG91bGQgZG8g
c29tZXRoaW5nIHRvIHN0b3AgRE1BIHdoZW4gYnVmID09IE5VTEwuDQo+ID4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBZb3UgYXJlIHJpZ2h0IGV4Y2VwdCB0aGF0IGRtYSBpcyBub3Qgc3RvcHBlZCBidXQg
ZnJhbWVzIGFyZQ0KPiA+ID4gYXV0b21hdGljYWxseSBkcm9wcGVkIGJ5IGhhcmR3YXJlIHVudGls
IGEgbmV3IGJ1ZmZlciBpcyBlbnF1ZXVlZCBhbmQNCj4gPiA+IHNvZnR3YXJlIHVzZXMgQ0FNU1Zf
SU1HT19GQkNfUkNOVF9JTkMgdG8gaW5jcmVhc2UgdGhlIHNvZnR3YXJlIGJ1ZmZlcg0KPiA+ID4g
aW5kZXguDQo+ID4gPiANCj4gPiA+IFdoYXQgYWJvdXQgYWRkaW5nIHRoZSBmb2xsb3dpbmcgY29t
bWVudDoNCj4gPiA+IA0KPiA+ID4gLyoNCj4gPiA+ICogSWYgdGhlcmUgaXMgbm8gdXNlciBidWZm
ZXIgYXZhaWxhYmxlLCBoYXJkd2FyZSB3aWxsIGRyb3AgYXV0b21hdGljYWxseQ0KPiA+ID4gKiBm
cmFtZXMgdW50aWwgYnVmX3F1ZXVlIGlzIGNhbGxlZA0KPiA+ID4gKi8NCj4gPiANCj4gPiBZb3Ug
c2F5IERNQSBpcyBub3Qgc3RvcHBlZC4gRG8geW91IG1lYW4gaGFyZHdhcmUgc3RpbGwgd3JpdGUg
ZGF0YSBpbnRvIGxhdGVzdCBidWZmZXIgd2hpY2ggd291bGQgYmUgZGVxdWV1ZWQgdG8gdXNlciBz
cGFjZT8NCj4gPiBJIHRoaW5rIGhhcmR3YXJlIHNob3VsZCBub3Qgd3JpdGUgZGF0YSBpbnRvIHRo
ZSBidWZmZXIgd2hpY2ggaGFzIGJlZW4gdGFrZSBhd2F5IGJ5IHVzZXIgc3BhY2UuDQo+ID4gSSB0
aGluayBzb2Z0d2FyZSBzaG91bGQgZG8gc29tZXRoaW5nIHRvIHN0b3AgRE1BLiBNYXliZSB1c2Ug
bXRrX2NhbXN2MzBfY21vc192Zl9od19kaXNhYmxlKCkgdG8gc3RvcCBETUEuDQo+ID4gDQo+IA0K
PiBObywgSSBzYWlkIGZyYW1lIGlzIGRyb3BwZWQuLiBJdCBkb2VzIG5vdCB3cml0ZSBhbnkgZGF0
YS4NCg0KT0ssIGZvciBtZSwgRE1BIG1lYW4gbWVtb3J5IGFjY2Vzcy4gTm90IHdyaXRpbmcgYW55
IGRhdGEgaXMgZXF1YWwgdG8gc3RvcCBETUEgZm9yIG1lLg0KVGhlIGNvbW1lbnQgaXMgT0sgZm9y
IG1lIG5vdy4gQnV0IGl0IG1heSBjaGFuZ2UgYWZ0ZXIgd2UgZGlzY3VzcyBmYmNfaW5jLg0KDQpS
ZWdhcmRzLA0KQ0sNCg0KPiANCj4gPiBSZWdhcmRzLA0KPiA+IENLDQo+ID4gDQo+ID4gPiANCj4g
PiA+IExldCBtZSBrbm93IGlmIHRoYXQgd29ya3MgZm9yIHlvdQ0KPiA+ID4gDQo+ID4gPiBDaGVl
cnMNCj4gPiA+IEp1bGllbg0KPiA+ID4gDQo+ID4gPiA+IFJlZ2FyZHMsDQo+ID4gPiA+IENLDQo+
ID4gPiA+IA0KPiA+ID4gPiA+ICsgICAgICAgfQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAg
ICAgIHNwaW5fdW5sb2NrKCZjYW1fZGV2LT5idWZfbGlzdF9sb2NrKTsNCj4gPiA+ID4gPiArDQo+
ID4gPiA+ID4gKyAgICAgICByZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4gPiA+ID4gK30NCj4gPiA+
ID4gPiArDQo+ID4gPiA+IA0KPiA+ID4gPiAqKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVu
dGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNCj4gPiA+ID4gVGhlIGluZm9ybWF0
aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55DQo+ID4g
PiA+IGF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmls
ZWdlZCwgb3Igb3RoZXJ3aXNlDQo+ID4gPiA+IGV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIg
YXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZQ0KPiA+ID4gPiBjb252ZXllZCBv
bmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlv
biwNCj4gPiA+ID4gZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcg
b2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMNCj4gPiA+ID4gYXR0YWNobWVudHMpIGJ5IHVu
aW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heQ0KPiA+
ID4gPiBiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9m
IHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQo+ID4gPiA+IHRoYXQgeW91IGhhdmUgcmVjZWl2ZWQg
dGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlcg0KPiA+ID4gPiBp
bW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBh
bGwgY29waWVzIG9mDQo+ID4gPiA+IHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1l
bnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQo+ID4gPiA+IGRpc2Nsb3NlIHRoZSBj
b250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCj4g
PiANCj4gPiAqKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioq
KioqKioqKioqKioqKioqKioNCj4gPiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
ZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkNCj4gPiBhdHRhY2htZW50cykgbWF5IGJlIGNv
bmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KPiA+IGV4
ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRl
ZCB0byBiZQ0KPiA+IGNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMp
LiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLA0KPiA+IGRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJl
dGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzDQo+ID4gYXR0
YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQgYW5kIG1heQ0KPiA+IGJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCBy
ZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCj4gPiB0aGF0IHlvdSBoYXZlIHJl
Y2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXINCj4g
PiBpbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFu
ZCBhbGwgY29waWVzIG9mDQo+ID4gdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVu
dHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCj4gPiBkaXNjbG9zZSB0aGUgY29udGVu
dCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo+IA0KPiAN
Cg==

