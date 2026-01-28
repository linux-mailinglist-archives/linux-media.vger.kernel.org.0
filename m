Return-Path: <linux-media+bounces-51718-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLF3Lbe+eWl/ywEAu9opvQ
	(envelope-from <linux-media+bounces-51718-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 08:45:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF64B9DD86
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 08:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D19E3006D5D
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 07:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7EA32825D;
	Wed, 28 Jan 2026 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Z2dnuOkC";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="sLRd8VDZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4172D322F;
	Wed, 28 Jan 2026 07:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769586350; cv=fail; b=C8gRst11DrMdZ5jb5HOba/DUQIQbdSDQuSVOjaQ3+xazxAaLdEKtcC583nbHTrz36LVEpPw+dKSpn/2CLtrzSnJ6iPmVmnQTWs0kwdx/rNRxPe9BgxH2ueHHCWtfpIf36bguclvPsEnes8wlB11Fk4BMoFONDqbPpuGPxPtWyjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769586350; c=relaxed/simple;
	bh=5UmEUlu/tGmrgK3eVU1zEemsvB82Zj40Np4eRTltc9I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TgOSfPmVDn44PgZyraA7GPdrcTF3FTVqnR9qCxG2agSCqRUX7Wioawk+h9Yc4Y3cSGKSCN8zWpFwamkKKTJChPr4p+NfJXHPN7+QqQHenUFWDxX2TaYvQGZCybJ5zSMsUE0mmYQZmc12fA/eOqj9TQ7o/cbQEfvy0Flmpwi24xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Z2dnuOkC; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=sLRd8VDZ; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 57fe9c56fc1d11f085319dbc3099e8fb-20260128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5UmEUlu/tGmrgK3eVU1zEemsvB82Zj40Np4eRTltc9I=;
	b=Z2dnuOkCu8c2oBjbgd5VbKM9o/s/P6n/QqRJy/19Ze63U7PdvCVyuAgBnvhe5bLbYFsUKwqJTavSoT8b6nTauKAPQHTVdq4rlZyykTMZQbRCMooYyLab67qjBczdpNZgjK9l1RUQwxSR/7LXpEpWRsEavg57p5gbQXYSBfPdMbw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:81273301-de52-441d-9496-4288a92f8b76,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:f5590df0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 57fe9c56fc1d11f085319dbc3099e8fb-20260128
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1587462134; Wed, 28 Jan 2026 15:45:40 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 28 Jan 2026 15:45:40 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 28 Jan 2026 15:45:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOX0oNGAFrot9rinluqiVeRfoBzoS42yqN6GqWTPtLABSweNfHdOAbcEmzIZ6pE/cakK4qaRtL1BE6DIyERNV98t/Vn006ann2Hm6y0LGH4+p1gysc6fgDejiNsZeAU1eM9UzR65MiAnaY0jHCCyK1029JYlPtacJLyx7zEjCbM+9A6bVrprIVZrlZTCrrgdBeyjpRWZEBaV3aNCkj079WsWfUlNp4Xo9Vvs3HuwbFCmiNCZvUR4x/GRR40UJDZzaobgFWUv/JxKffVvj9DE0qKTh2NcvByuQGSB/va7D5RJcqr3/39urQqieRylqRqf4oJdjs1AgOZ4WMeR2a0whg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UmEUlu/tGmrgK3eVU1zEemsvB82Zj40Np4eRTltc9I=;
 b=UoHR0k0xi5sgp1LSi0jls/kV3+npV96CRPIw8Nt1rfbRPQzqu4pvvXId5m/5/UT4Bp18QEAMZryCMjUsGeCrgJwatx0DZavAfNHoHPamKkCMGbIedaqTy4NNFuGCRWdeCzQ0ZXq5QNMkS3MnTHaEuDdakZ0mwNuhw3OkdihH/BDXoCApISsNX587DA7I3XejrrBvJcWAoPGyz0aMu/37kFn6+DaKS/jwlbljncqj2SjadD6jufIxCLwBgU5k9u9uSscTlLgcvqSVnNx5YCMHUn4YOE72VSFCdFoOfI0x3UvcZJaOFzl+lRw3T3vZZHWESbZ+XynTRR66CMS4dpX//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UmEUlu/tGmrgK3eVU1zEemsvB82Zj40Np4eRTltc9I=;
 b=sLRd8VDZS+LKU0gOzW+SYYbPlIOzgSA5XgX567KFrTHpFWpFVK581t2GQskklKUDgxtmZup+wA5tjxzbnyJx9un+BDxBb+KjZGh4vJ9cPzNXq75jbI98aEP0Jn3wXYxBN2zgxod0y9ydnqbhlRUDCGqJ+3AprbHhFNgpZ07ZOi4=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TY0PR03MB8173.apcprd03.prod.outlook.com (2603:1096:405:1a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 07:45:35 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 07:45:35 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?=
	<Kyrie.Wu@mediatek.com>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	=?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>
Subject: Re: [PATCH v7 05/10] media: mediatek: vcodec: Add Decoder profile &
 level Initialization
Thread-Topic: [PATCH v7 05/10] media: mediatek: vcodec: Add Decoder profile &
 level Initialization
Thread-Index: AQHcjzav7Q1/sAQBiECQANR4l4Xb1rVl7JKAgAFJKwA=
Date: Wed, 28 Jan 2026 07:45:35 +0000
Message-ID: <54689bc16875b979147c021123c2546aacb7541e.camel@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-6-kyrie.wu@mediatek.com>
	 <4a6e111d-49ef-449d-af9d-b0bd4fb468a5@collabora.com>
In-Reply-To: <4a6e111d-49ef-449d-af9d-b0bd4fb468a5@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TY0PR03MB8173:EE_
x-ms-office365-filtering-correlation-id: 74a59400-ccd7-47d7-0ee3-08de5e4138d0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?LzhuOEZjZHJUQ0c4NFoxa2Q0aU84Tmd6aTBhOFhjVjlydUJ0LzdKSlFmTWFm?=
 =?utf-8?B?R2xWdVp5N0lhSWVDekxDS00wMkVLZzZnVFdSdDdmcmNORmh5S013V3dkVzR5?=
 =?utf-8?B?VkVGNHhucVlUUm11TVNXTUkydnpWUnA1SWJwVDk1ZGQrY2YvaEc5UXQ4Yy9D?=
 =?utf-8?B?bTN6R3UwQ0p6MUhtM2ZLOWJ6QjRvOGcwdVYwQnBQUmpSbk95ckIzZzdEU1pJ?=
 =?utf-8?B?Y0REcTg2ZVcwTnBGblp2cko4U3lyWjUwaDlrOGtDNkhTZ045Sjg2WTErS0hk?=
 =?utf-8?B?dUZoYStBbWp6ZitxOGMrM3B1aHpxMVBiQVl3dmpoY3d6ZnlJZGhEbUZtVEZF?=
 =?utf-8?B?WHM4WmlvZFZEWkdlbnZhbHY3cDF1dTBIMk14VE1QWXRody9tMUVhdWVlU2Rm?=
 =?utf-8?B?Tis4YnRFSmZ2OXNqVlhFUjNYUVBRVjJXQ251RFA3SzM1eWgwZDcyRkI2TU5H?=
 =?utf-8?B?ZGVnWGFlc29haVV4ZDJuS2U3Y0UrSGdFaWlwRHhzZHZJMGJtbVQvYStxd1ZN?=
 =?utf-8?B?dy90c1FVS0xPUjBYVnR4S0NXUklvZEllcEV5NmZGbUV2VmpDbUt6UWYrTXcv?=
 =?utf-8?B?QjdjWGxBckJmUUF2REQvdVI4QjRvMDVOZnd4NEE3RndxVnF4bmg3NnYrYlJl?=
 =?utf-8?B?V0k1ak5DYVhTVmZ2NWxuYzlubkZ0d0dZT1IzdkljNHFERVAwZE9IMldyT2Rz?=
 =?utf-8?B?NkZWS3NrMHdKcVpBQ0FlMGcwZTVsUlZsbnZURVc1cTllTTJLektocVNXMmlq?=
 =?utf-8?B?WUFncC84Q2s1NDhJekEvOWZ0WGI0NWJtMENjZWgzWS8zaGtTM1Y0UVFveW51?=
 =?utf-8?B?ZWdQMW8wTzd3TDNRVGVUR2psdU9JNlg5VFdvbTVueVN1aXBCU3ZFWTVLSHJU?=
 =?utf-8?B?MGpwRGVxaTFCY2NqaC9XRGo5aDlMRVhaZkRtejFqVzdLdkpiQTkwQVR6YlhZ?=
 =?utf-8?B?WUlTR3FWdElWWllscVpJLy8rSnV6bGJqYUgvL2FFdWg4SmJOeVFyTFdiNU5u?=
 =?utf-8?B?TnBFSklxdTkwdEdIQi9ZK0RSeWNBaTVqSVJ2OVRNYUJwNkQyWjFVY1FKSldl?=
 =?utf-8?B?bmVBYXRaUWV4VUNBVDY5RTRpVitKeElRNmVHVEppZkVCQldDNVc5QUp5R3Rs?=
 =?utf-8?B?b2lmalZVaWJrU1BZKzZVR1BpcGlISEdGUGlybloyY2xhVFg4STYxWThWRHZz?=
 =?utf-8?B?U2tDS2tVclg5Sk8xbnZGUXNLYm5WYktxa2xSY0RiRWhKMGF6MWVMc3NWeS9t?=
 =?utf-8?B?TTNBOW1Zdyt6MEdpbHZoQU5yck45S0Q5RnhsMERTY0tOOTBuK014c00wNC8x?=
 =?utf-8?B?NXhMdEpmYS9NcG90b1NGSGFsMSt1Z2lraFBtQTRWa3ZaY1VwdEJlNFFVbVhV?=
 =?utf-8?B?NTZ1aGFjcW9ZakZVRW8yM0UwcHBjNlFCWHA1WEZWLzFFSVZNOWhtSllqeldk?=
 =?utf-8?B?dEFHZURJTkNZRWxrNWxxek9WMWNYQlpLZUgyVWtQeWZpczZmYWg1MVI3QmFi?=
 =?utf-8?B?MWhVTWhKWDlnMTZWUVMwN1dPNkxyNCs2cXBvcldVVklPSmtjSStoM2ZOMWVN?=
 =?utf-8?B?RDllamJ5QVdmY2NoN0pISEFFcENjZ0JZdmZrc1pLSUluVWZYRG1haHBlOXZV?=
 =?utf-8?B?UkR1TUEra2l3ajhob3Npb0Q1MEJIOU5lYmlIQzZPb1pnY1ZsN2d5ekp4S2xZ?=
 =?utf-8?B?QWFUMlRvK2dORWNWMlB1aElJK1A4MTNIS3F6WGt6M1dmWE5mRFAvTzZKTHF3?=
 =?utf-8?B?SGRNY3FZYmpyUkRDNVY4ci9hN2pPTnM5akE3REhwYUhKY3cvK1ExSEhoblhC?=
 =?utf-8?B?N2hMNW9TS3ZJYWRtN3Vac2VEZWpQUWRtSzFkVmtsOEdlZXFGQ05HU2M5cm5U?=
 =?utf-8?B?OFlPMEcxNVlGNi95VzF5RmN0TnVlNGRuNHFGVytRdzBTRDdaUWxZT1dhS1I1?=
 =?utf-8?B?TGt4RmdENldwYlpkVXhQcm5Sbk9WR3BVajRUKy9tazQzMDJSekpaMkRTNHZI?=
 =?utf-8?B?SGR0YzhHUVhsc1d6UlJZalJnb1Y0Uzd0dUFYTGFFbEgvUS9YdzdSYktpTUhk?=
 =?utf-8?B?MnM3V3BJb1FoTVZDUU5EUGdISU9wZDhQM2QzWnNuVm13SmJDQktkdk81SkM2?=
 =?utf-8?B?Tms4aDV6cjBWY2JxaTZuSDN6KzZpeGlQYVMzMGxCaUM2cE1FeitEUG10QXZG?=
 =?utf-8?Q?iJ7uJwCAnW9M2BdlwZSoVbS04g/yVLlaEflLJ3kYA5LE?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHJudDdtUFd3aUcvUmd4aERXQ0o2aFBhUVZybS9TNks3N1UweDBOSEFJd0th?=
 =?utf-8?B?cW9QVHVmQ1Ivc1hYUDZyTUdGbmh5R1BVRTh3Sm5hdVlVQXFNbG0vOXh1YUl6?=
 =?utf-8?B?bGZCSjM2Z1l3ZUl6RVhGcnhJZjg5QWVEazZxV3FieHlCYWZPY2dTU0lacUdY?=
 =?utf-8?B?dzBTaU0xekI3L29tdUtVUEtKYzFhNHdMRW5TWnpHSnNsNXphWWdaNnhHUW9z?=
 =?utf-8?B?dFl1Y21NZS9NVW4vd2tJbXFwTlZSTVdQT0ExOEhNOVFJdDZnQlFPeVhMSWQy?=
 =?utf-8?B?OGdwTmswL3BvcEczd1NRVWZ5NmtGQmkrUHNCWE5mZEdpZW54WFVxY0F3QlRx?=
 =?utf-8?B?eXd0aDZtdkR1U1RxYlIxZ3VXZDhuQlBJYlo2QzY3eFR5RHVvQ2pSdEFjUmlL?=
 =?utf-8?B?ZkdiZTRGY1RRcGpiejJIQTZqeU9DTkpJQ3V3TWJ5YUlNRm85bFJXZVVoSUMw?=
 =?utf-8?B?dnJBV3RNM1NDZ0hMbjV6OUJGcUN4NUovY3Z4MVJ2WUdFRDRpWDZiNzBIdzFS?=
 =?utf-8?B?R29DVGxWUFd6UHJFcURMTXhRNjBLSDA3ZWxsV3IzUElqOUdDVHp4RlcvRHUz?=
 =?utf-8?B?VStIR0pSdkZKTXh1TVIzcTZmM1ZXOVpRYU9UNkpUTm1xK0U4SUtWT3Fmb0VE?=
 =?utf-8?B?V2xFNEdLMXlNeTFHRzQrWFVaWjBySlh6cE11WkdiTkxXdzIrczlydVp6NWdK?=
 =?utf-8?B?SFd6NkRlTlZCNFVGL2NnZHZOVy9ZLzB2YWVSTnM5cHJ6QkVDSjU2Y1YxUWRW?=
 =?utf-8?B?TUU4Yk1UUGhZaTVCNGY4NWdsWHFqMExIbFFxY0p6NzBrekFpVUdNR1k3SnI3?=
 =?utf-8?B?bElVNVBIelVQWXhoVlBaMG5CM2hNU0ZXNG5WcDB0TndGTUFPT1lZd0x6eWU4?=
 =?utf-8?B?WkZsOU0zMzh4dDFZdFMxWGRYWlpLcXFHWFg0aVpneE1QSHV4aGhBOUF5YytR?=
 =?utf-8?B?VU8ySlBaOXBwYlFteFJhSlc3TkJCWk93Z09QcGIxdXZnN2FJem0zNUd1ei84?=
 =?utf-8?B?dklkODV4Y1V1akVvM3JpcjN3Sm1LMGN3aHdrRStHckhWVEJnd1lRTE9LNStW?=
 =?utf-8?B?RVlXc2wyaGdJaE9XQ3lWYmdJWjJHYU5XaDhYU2JSY1FmQUJ0T1l2cjlZak5s?=
 =?utf-8?B?bHE0Q3hISERMVjVkMWNPNDEyS29Hb2RkMVdnUVRsTnRNbDZyLzRyNGN1a2c0?=
 =?utf-8?B?d1pvckNPdkhvSlpGenpJZEx0Z3hxSkl1bmpFRURINGdYa3V4L0VnK3RJc0Vp?=
 =?utf-8?B?Sk5NZW9SS2V6SXBieUZ6aVMrdW9YdnZWczRUOGhJbngxTG1kckdNZ2IremJ6?=
 =?utf-8?B?N1pkRzY3NmEyb2VvUVg1dXViMzI0TllxS0RUMm40Uk4zWE95WFhhWW5HRHRi?=
 =?utf-8?B?VjVHTHZTN3J3eXk1THJLSWRNREFDSXNxRUNFb2JLTWNTQmYxRVJVWXhFZGx1?=
 =?utf-8?B?NTRYL0JLYmNsR05JTGFobFdPMmVCanZMbzJxYnR3d29xaElqVldZalFpUkQ2?=
 =?utf-8?B?Q1J3ZUowdTJ5aDZVUXoyR2N2YVlTMzcwT0VXcUUyOXBsTEVpWTlKRXRLdFpl?=
 =?utf-8?B?alhITk0vLzNJRDM3bkxRd3FaN3N2MGZoU09ZRFhaRXRYRHRwb2t4UzFJQ0Zj?=
 =?utf-8?B?QjZDMXhVTVZBalRNelVDVE5lWG94amF0dy9majFYVUVTendOTEY2dVBKQU9X?=
 =?utf-8?B?WTVWZG1Bc290YlhVdWg0NE9sN0wvUkpkTG9oYklma0J0Sm1yZTNQNGJvMzVx?=
 =?utf-8?B?dnhnRGxsVGhnUktsTGNPRUhmT0pNbHFlRjZocWQ2dTFpLzg0MEgrODU0S2JB?=
 =?utf-8?B?dU5QQjZsY1Z3MngzSDZIUEdEUGF1REZCcWV2c20xQXoxQTlrQS9tb1pPM29B?=
 =?utf-8?B?R2VXSlBmZmtrckhxQ2JvdDdrbDREdE5rTndTeU5NTDRWTnhaOHRxNUR6amRS?=
 =?utf-8?B?VGtuVU4vbW9uZDVpcTExWUg4byt4T0d2NStubTNmV0hkNGZoSjRWL0FMbDEy?=
 =?utf-8?B?bGlLdERwZ0lmN3hsSGFvV2d2WTVMVlQwNkhYOTRHdk5adkJCNnRFWC9DMytF?=
 =?utf-8?B?RjllbGNHYWNQOXFTQm1ieURiQzJLL3lEUGNIK1RUMGh6QUZCZzJIK2hZZDBY?=
 =?utf-8?B?dUlIa2pSTWthVzIvWWU2K3ZDZmdtSUhlbHVlK2VZdGFhaERMaFNKTjVEWksr?=
 =?utf-8?B?OUp6dXVybTJRQkloRnhONE51eDJKQVRJL0xIRlhtWHN6WTdRSlBHbXJuNndp?=
 =?utf-8?B?eUNNMHRnLzFYTkVOU2RlWkh6TFlYaHF4cHdSN1FlZEl2YmlsRG1KMFRTN3I2?=
 =?utf-8?B?a2hyeUlXb0hSMk9UYjlWQXNidkc3UjZ0bVE4Yll1YjJHQ2NDaEZEZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <677F0FFC06B9684A95F38E7393AEE8EE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a59400-ccd7-47d7-0ee3-08de5e4138d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 07:45:35.1773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jx2gXw7hqLaHKW4Bemfgib1CkCzO56G1yJU51Jwq/di6GI4py+MHkTNYEDhD4Mtbf1O09UoIV6RDltLOQHeUkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8173
X-MTK: N
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51718-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,mediatek.com:dkim,mediatek.com:mid,mediateko365.onmicrosoft.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,lists.infradead.org,mediatek.com,chromium.org,kernel.org,xs4all.nl,collabora.com,gmail.com,arndb.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,mediatek.com];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Kyrie.Wu@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DF64B9DD86
X-Rspamd-Action: no action

T24gVHVlLCAyMDI2LTAxLTI3IGF0IDEzOjA3ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMjcvMDEvMjYgMDM6NDIsIEt5cmllIFd1IGhhIHNjcml0dG86DQo+
ID4gVGhpcyBjb21taXQgaW5pdGlhbGl6ZXMgY29kZWMgcHJvZmlsZSAmIGxldmVsIGZvciBWREVD
LiBJdCBzZXRzDQo+ID4gZGVmYXVsdCB2YWx1ZXMgZm9yIEgyNjQsIEgyNjUsIGFuZCBWUDkgY29k
ZWNzIGFjcm9zcyBtdWx0aXBsZQ0KPiA+IGNoaXBzZXQgY29uZmlndXJhdGlvbnMuDQo+ID4gDQo+
IA0KPiBUaGUgcHJldmlvdXMgcGF0Y2ggIlJlZmFjdG9yIGRlY29kZXIgcHJvZmlsZSBhbmQgbGV2
ZWwgaGFuZGxpbmciIHdpbGwNCj4gYnJlYWsgdGhlDQo+IGRyaXZlciBpZiB0aGlzIHBhdGNoIGlz
IG5vdCBhbHNvIGFwcGxpZWQgYXQgdGhlIHNhbWUgdGltZS4NCj4gDQo+IFRoZSBjaGFuZ2UgbG9v
a3MgZ29vZCwgYnV0IHlvdSBzaG91bGQgc3F1YXNoIDA1LzEwIGluIDA0LzEwLCBhbmQNCj4gYXNz
aWduIHRoZSBwYXJhbXMNCj4gdGhhdCB5b3UncmUgYWRkaW5nIGhlcmUgYWxvbmcgd2l0aCB0aGUg
cmVmYWN0b3JpbmcsIHNvIHRoYXQgeW91IGdldA0KPiBvbmUgc2luZ2xlDQo+IHBhdGNoIHRoYXQs
IGlmIGFwcGxpZWQsIGRvZXNuJ3QgYnJlYWsgYW55dGhpbmcgYXMgaXQgZG9lc24ndCBkZXBlbmQN
Cj4gb24gYWRkaXRpb25hbA0KPiAoZnV0dXJlLCBhcyB0aGlzIGlzIG51bWJlciA1KSBwYXRjaC4N
Cj4gDQo+IFBsZWFzZSBzcXVhc2gNCj4gDQo+IENoZWVycywNCj4gQW5nZWxvDQoNCkRlYXIgQW5n
ZWxvLA0KDQpUaGUgMDQvMTAgYW5kIDA1LzEwIHdlcmUgZGVzaWduZWQgaW4gb25lIHBhdGNoIGlu
IHY2LA0KYnV0IE5pY29sYXMgdGhvdWdodCB0aGF0IHJlZmFjdG9yIHBhdGNoIGFuZCBjb25maWd1
cmF0aW9uDQp3ZXJlIHR3byBkaWZmZXJlbnQgY2hhbmdlcywgc2hvdWxkIHNlcGFyYXRlIHRoZW0g
aW4gdGhpcw0KY29tbWVudHM6IA0KaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJvamVj
dC9saW51eC1tZWRpYS9wYXRjaC8yMDI1MTIwMjA3NDAzOC4zMTczLTUta3lyaWUud3VAbWVkaWF0
ZWsuY29tLw0KDQpJbiBteSBtaW5kLCByZWZhY3RvciBwcm9maWxlIGFuZCBsZXZlbCBzZXR0aW5n
IGFuZCBhc3NpZ24NCmZvcm1lciBJQ3MnIHBhcmFtZXRlcnMgY291bGQgbWVyZ2UgaW50byBzYW1l
IHBhdGNoLiBUaGUNCmNvbmZpZ3VyYXRpb24gb2YgTVQ4MTg5IHNob3VsZCBzcGxpdCB0byBhbm90
aGVyIG9uZSwgYmVjYXVzZQ0KaXQgaXMgYSBuZXcgc2V0dGluZy4NCg0KRG8geW91IGFncmVlIHdp
dGggbXkgb3Bpbmlvbj8gSSBsb29rIGZvcndhcmQgdG8geW91ciBmdXJ0aGVyIHJlcGx5Lg0KDQpU
aGFua3MuDQoNClJlZ2FyZHMsDQpLeXJpZS4NCg0KDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEt5
cmllIFd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gICAuLi4vdmNvZGVj
L2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhdGVmdWwuYyAgfCAxMiArKysNCj4gPiAgIC4uLi92
Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19zdGF0ZWxlc3MuYyB8IDg0DQo+ID4gKysrKysr
KysrKysrKysrKysrKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRl
ay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19zdGENCj4gPiB0ZWZ1bC5jDQo+ID4gYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNf
ZGVjX3N0YQ0KPiA+IHRlZnVsLmMNCj4gPiBpbmRleCA4ZGRiNjE2NzBkYzYuLmE0NzkwNmI5ZDcx
NyAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
dmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhDQo+ID4gdGVmdWwuYw0KPiA+ICsrKw0K
PiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtf
dmNvZGVjX2RlY19zdGENCj4gPiB0ZWZ1bC5jDQo+ID4gQEAgLTYxOSw0ICs2MTksMTYgQEAgY29u
c3Qgc3RydWN0IG10a192Y29kZWNfZGVjX3BkYXRhDQo+ID4gbXRrX3ZkZWNfODE3M19wZGF0YSA9
IHsNCj4gPiAgIAkuaXNfc3ViZGV2X3N1cHBvcnRlZCA9IGZhbHNlLA0KPiA+ICAgCS5od19hcmNo
ID0gTVRLX1ZERUNfUFVSRV9TSU5HTEVfQ09SRSwNCj4gPiAgIAkuY2hpcF9uYW1lID0gODE3MywN
Cj4gPiArCS5oMjY0X3BhcmFtcyA9IHsNCj4gPiArCQkubGV2ZWwgPSBWNEwyX01QRUdfVklERU9f
SDI2NF9MRVZFTF80XzEsDQo+ID4gKwkJLnByb2ZpbGUgPSBWNEwyX01QRUdfVklERU9fSDI2NF9Q
Uk9GSUxFX0hJR0gsDQo+ID4gKwl9LA0KPiA+ICsJLmgyNjVfcGFyYW1zID0gew0KPiA+ICsJCS5s
ZXZlbCA9IFY0TDJfTVBFR19WSURFT19IRVZDX0xFVkVMXzQsDQo+ID4gKwkJLnByb2ZpbGUgPQ0K
PiA+IFY0TDJfTVBFR19WSURFT19IRVZDX1BST0ZJTEVfTUFJTl9TVElMTF9QSUNUVVJFLA0KPiA+
ICsJfSwNCj4gPiArCS52cDlfcGFyYW1zID0gew0KPiA+ICsJCS5sZXZlbCA9IFY0TDJfTVBFR19W
SURFT19WUDlfTEVWRUxfNF8wLA0KPiA+ICsJCS5wcm9maWxlID0gVjRMMl9NUEVHX1ZJREVPX1ZQ
OV9QUk9GSUxFXzEsDQo+ID4gKwl9LA0KPiA+ICAgfTsNCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNf
ZGVjX3N0YQ0KPiA+IHRlbGVzcy5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX3N0YQ0KPiA+IHRlbGVzcy5jDQo+ID4g
aW5kZXggYTFmNDE5MjAyYTI0Li5iNTcxYzRlZDNmNzkgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNf
ZGVjX3N0YQ0KPiA+IHRlbGVzcy5jDQo+ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX3N0YQ0KPiA+IHRlbGVz
cy5jDQo+ID4gQEAgLTgzMCw2ICs4MzAsMTggQEAgY29uc3Qgc3RydWN0IG10a192Y29kZWNfZGVj
X3BkYXRhDQo+ID4gbXRrX3ZkZWNfODE4M19wZGF0YSA9IHsNCj4gPiAgIAkuaXNfc3ViZGV2X3N1
cHBvcnRlZCA9IGZhbHNlLA0KPiA+ICAgCS5od19hcmNoID0gTVRLX1ZERUNfUFVSRV9TSU5HTEVf
Q09SRSwNCj4gPiAgIAkuY2hpcF9uYW1lID0gODE4MywNCj4gPiArCS5oMjY0X3BhcmFtcyA9IHsN
Cj4gPiArCQkubGV2ZWwgPSBWNEwyX01QRUdfVklERU9fSDI2NF9MRVZFTF80XzIsDQo+ID4gKwkJ
LnByb2ZpbGUgPSBWNEwyX01QRUdfVklERU9fSDI2NF9QUk9GSUxFX0hJR0gsDQo+ID4gKwl9LA0K
PiA+ICsJLmgyNjVfcGFyYW1zID0gew0KPiA+ICsJCS5sZXZlbCA9IFY0TDJfTVBFR19WSURFT19I
RVZDX0xFVkVMXzQsDQo+ID4gKwkJLnByb2ZpbGUgPQ0KPiA+IFY0TDJfTVBFR19WSURFT19IRVZD
X1BST0ZJTEVfTUFJTl9TVElMTF9QSUNUVVJFLA0KPiA+ICsJfSwNCj4gPiArCS52cDlfcGFyYW1z
ID0gew0KPiA+ICsJCS5sZXZlbCA9IFY0TDJfTVBFR19WSURFT19WUDlfTEVWRUxfNF8wLA0KPiA+
ICsJCS5wcm9maWxlID0gVjRMMl9NUEVHX1ZJREVPX1ZQOV9QUk9GSUxFXzEsDQo+ID4gKwl9LA0K
PiA+ICAgfTsNCj4gPiAgIA0KPiA+ICAgLyogVGhpcyBwbGF0Zm9ybSBkYXRhIGlzIHVzZWQgZm9y
IG9uZSBsYXQgYW5kIG9uZSBjb3JlDQo+ID4gYXJjaGl0ZWN0dXJlLiAqLw0KPiA+IEBAIC04Njks
MjQgKzg4MSw3MiBAQCBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGENCj4gPiBtdGtf
dmRlY184MTg4X3BkYXRhID0gew0KPiA+ICAgCU1US19TVEFURUxFU1NfREVDX0RBVEEsDQo+ID4g
ICAJLmh3X2FyY2ggPSBNVEtfVkRFQ19MQVRfU0lOR0xFX0NPUkUsDQo+ID4gICAJLmNoaXBfbmFt
ZSA9IDgxODgsDQo+ID4gKwkuaDI2NF9wYXJhbXMgPSB7DQo+ID4gKwkJLmxldmVsID0gVjRMMl9N
UEVHX1ZJREVPX0gyNjRfTEVWRUxfNV8yLA0KPiA+ICsJCS5wcm9maWxlID0gVjRMMl9NUEVHX1ZJ
REVPX0gyNjRfUFJPRklMRV9ISUdIXzEwLA0KPiA+ICsJfSwNCj4gPiArCS5oMjY1X3BhcmFtcyA9
IHsNCj4gPiArCQkubGV2ZWwgPSBWNEwyX01QRUdfVklERU9fSEVWQ19MRVZFTF81XzEsDQo+ID4g
KwkJLnByb2ZpbGUgPSBWNEwyX01QRUdfVklERU9fSEVWQ19QUk9GSUxFX01BSU5fMTAsDQo+ID4g
Kwl9LA0KPiA+ICsJLnZwOV9wYXJhbXMgPSB7DQo+ID4gKwkJLmxldmVsID0gVjRMMl9NUEVHX1ZJ
REVPX1ZQOV9MRVZFTF81XzEsDQo+ID4gKwkJLnByb2ZpbGUgPSBWNEwyX01QRUdfVklERU9fVlA5
X1BST0ZJTEVfMiwNCj4gPiArCX0sDQo+ID4gICB9Ow0KPiA+ICAgDQo+ID4gICBjb25zdCBzdHJ1
Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGEgbXRrX3ZkZWNfODE5Ml9wZGF0YSA9IHsNCj4gPiAgIAlN
VEtfU1RBVEVMRVNTX0RFQ19EQVRBLA0KPiA+ICAgCS5od19hcmNoID0gTVRLX1ZERUNfTEFUX1NJ
TkdMRV9DT1JFLA0KPiA+ICAgCS5jaGlwX25hbWUgPSA4MTkyLA0KPiA+ICsJLmgyNjRfcGFyYW1z
ID0gew0KPiA+ICsJCS5sZXZlbCA9IFY0TDJfTVBFR19WSURFT19IMjY0X0xFVkVMXzVfMiwNCj4g
PiArCQkucHJvZmlsZSA9IFY0TDJfTVBFR19WSURFT19IMjY0X1BST0ZJTEVfSElHSCwNCj4gPiAr
CX0sDQo+ID4gKwkuaDI2NV9wYXJhbXMgPSB7DQo+ID4gKwkJLmxldmVsID0gVjRMMl9NUEVHX1ZJ
REVPX0hFVkNfTEVWRUxfNCwNCj4gPiArCQkucHJvZmlsZSA9DQo+ID4gVjRMMl9NUEVHX1ZJREVP
X0hFVkNfUFJPRklMRV9NQUlOX1NUSUxMX1BJQ1RVUkUsDQo+ID4gKwl9LA0KPiA+ICsJLnZwOV9w
YXJhbXMgPSB7DQo+ID4gKwkJLmxldmVsID0gVjRMMl9NUEVHX1ZJREVPX1ZQOV9MRVZFTF81XzEs
DQo+ID4gKwkJLnByb2ZpbGUgPSBWNEwyX01QRUdfVklERU9fVlA5X1BST0ZJTEVfMSwNCj4gPiAr
CX0sDQo+ID4gICB9Ow0KPiA+ICAgDQo+ID4gICBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNf
cGRhdGEgbXRrX3ZkZWNfODE5NV9wZGF0YSA9IHsNCj4gPiAgIAlNVEtfU1RBVEVMRVNTX0RFQ19E
QVRBLA0KPiA+ICAgCS5od19hcmNoID0gTVRLX1ZERUNfTEFUX1NJTkdMRV9DT1JFLA0KPiA+ICAg
CS5jaGlwX25hbWUgPSA4MTk1LA0KPiA+ICsJLmgyNjRfcGFyYW1zID0gew0KPiA+ICsJCS5sZXZl
bCA9IFY0TDJfTVBFR19WSURFT19IMjY0X0xFVkVMXzZfMCwNCj4gPiArCQkucHJvZmlsZSA9IFY0
TDJfTVBFR19WSURFT19IMjY0X1BST0ZJTEVfSElHSF8xMCwNCj4gPiArCX0sDQo+ID4gKwkuaDI2
NV9wYXJhbXMgPSB7DQo+ID4gKwkJLmxldmVsID0gVjRMMl9NUEVHX1ZJREVPX0hFVkNfTEVWRUxf
NV8yLA0KPiA+ICsJCS5wcm9maWxlID0gVjRMMl9NUEVHX1ZJREVPX0hFVkNfUFJPRklMRV9NQUlO
XzEwLA0KPiA+ICsJfSwNCj4gPiArCS52cDlfcGFyYW1zID0gew0KPiA+ICsJCS5sZXZlbCA9IFY0
TDJfTVBFR19WSURFT19WUDlfTEVWRUxfNV8yLA0KPiA+ICsJCS5wcm9maWxlID0gVjRMMl9NUEVH
X1ZJREVPX1ZQOV9QUk9GSUxFXzIsDQo+ID4gKwl9LA0KPiA+ICAgfTsNCj4gPiAgIA0KPiA+ICAg
Y29uc3Qgc3RydWN0IG10a192Y29kZWNfZGVjX3BkYXRhIG10a192ZGVjXzgxOTZfcGRhdGEgPSB7
DQo+ID4gICAJTVRLX1NUQVRFTEVTU19ERUNfREFUQSwNCj4gPiAgIAkuaHdfYXJjaCA9IE1US19W
REVDX0xBVF9TSU5HTEVfQ09SRSwNCj4gPiAgIAkuY2hpcF9uYW1lID0gODE5NiwNCj4gPiArCS5o
MjY0X3BhcmFtcyA9IHsNCj4gPiArCQkubGV2ZWwgPSBWNEwyX01QRUdfVklERU9fSDI2NF9MRVZF
TF82XzAsDQo+ID4gKwkJLnByb2ZpbGUgPSBWNEwyX01QRUdfVklERU9fSDI2NF9QUk9GSUxFX0hJ
R0hfMTAsDQo+ID4gKwl9LA0KPiA+ICsJLmgyNjVfcGFyYW1zID0gew0KPiA+ICsJCS5sZXZlbCA9
IFY0TDJfTVBFR19WSURFT19IRVZDX0xFVkVMXzVfMiwNCj4gPiArCQkucHJvZmlsZSA9IFY0TDJf
TVBFR19WSURFT19IRVZDX1BST0ZJTEVfTUFJTl8xMCwNCj4gPiArCX0sDQo+ID4gKwkudnA5X3Bh
cmFtcyA9IHsNCj4gPiArCQkubGV2ZWwgPSBWNEwyX01QRUdfVklERU9fVlA5X0xFVkVMXzVfMiwN
Cj4gPiArCQkucHJvZmlsZSA9IFY0TDJfTVBFR19WSURFT19WUDlfUFJPRklMRV8yLA0KPiA+ICsJ
fSwNCj4gPiAgIH07DQo+ID4gICANCj4gPiAgIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19w
ZGF0YSBtdGtfdmRlY19zaW5nbGVfY29yZV9wZGF0YSA9IHsNCj4gPiBAQCAtOTEwLDYgKzk3MCwx
OCBAQCBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGENCj4gPiBtdGtfdmRlY184MTg2
X3BkYXRhID0gew0KPiA+ICAgCU1US19TVEFURUxFU1NfREVDX0RBVEEsDQo+ID4gICAJLmh3X2Fy
Y2ggPSBNVEtfVkRFQ19QVVJFX1NJTkdMRV9DT1JFLA0KPiA+ICAgCS5jaGlwX25hbWUgPSA4MTg2
LA0KPiA+ICsJLmgyNjRfcGFyYW1zID0gew0KPiA+ICsJCS5sZXZlbCA9IFY0TDJfTVBFR19WSURF
T19IMjY0X0xFVkVMXzRfMiwNCj4gPiArCQkucHJvZmlsZSA9IFY0TDJfTVBFR19WSURFT19IMjY0
X1BST0ZJTEVfSElHSCwNCj4gPiArCX0sDQo+ID4gKwkuaDI2NV9wYXJhbXMgPSB7DQo+ID4gKwkJ
LmxldmVsID0gVjRMMl9NUEVHX1ZJREVPX0hFVkNfTEVWRUxfNCwNCj4gPiArCQkucHJvZmlsZSA9
DQo+ID4gVjRMMl9NUEVHX1ZJREVPX0hFVkNfUFJPRklMRV9NQUlOX1NUSUxMX1BJQ1RVUkUsDQo+
ID4gKwl9LA0KPiA+ICsJLnZwOV9wYXJhbXMgPSB7DQo+ID4gKwkJLmxldmVsID0gVjRMMl9NUEVH
X1ZJREVPX1ZQOV9MRVZFTF80XzEsDQo+ID4gKwkJLnByb2ZpbGUgPSBWNEwyX01QRUdfVklERU9f
VlA5X1BST0ZJTEVfMSwNCj4gPiArCX0sDQo+ID4gICB9Ow0KPiA+ICAgDQo+ID4gICBjb25zdCBz
dHJ1Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGEgbXRrX3ZkZWNfODE4OV9wZGF0YSA9IHsNCj4gPiBA
QCAtOTI4LDQgKzEwMDAsMTYgQEAgY29uc3Qgc3RydWN0IG10a192Y29kZWNfZGVjX3BkYXRhDQo+
ID4gbXRrX3ZkZWNfODE4OV9wZGF0YSA9IHsNCj4gPiAgIAkuaXNfc3ViZGV2X3N1cHBvcnRlZCA9
IHRydWUsDQo+ID4gICAJLmh3X2FyY2ggPSBNVEtfVkRFQ19QVVJFX1NJTkdMRV9DT1JFLA0KPiA+
ICAgCS5jaGlwX25hbWUgPSA4MTg5LA0KPiA+ICsJLmgyNjRfcGFyYW1zID0gew0KPiA+ICsJCS5s
ZXZlbCA9IFY0TDJfTVBFR19WSURFT19IMjY0X0xFVkVMXzVfMiwNCj4gPiArCQkucHJvZmlsZSA9
IFY0TDJfTVBFR19WSURFT19IMjY0X1BST0ZJTEVfSElHSF8xMCwNCj4gPiArCX0sDQo+ID4gKwku
aDI2NV9wYXJhbXMgPSB7DQo+ID4gKwkJLmxldmVsID0gVjRMMl9NUEVHX1ZJREVPX0hFVkNfTEVW
RUxfNCwNCj4gPiArCQkucHJvZmlsZSA9DQo+ID4gVjRMMl9NUEVHX1ZJREVPX0hFVkNfUFJPRklM
RV9NQUlOX1NUSUxMX1BJQ1RVUkUsDQo+ID4gKwl9LA0KPiA+ICsJLnZwOV9wYXJhbXMgPSB7DQo+
ID4gKwkJLmxldmVsID0gVjRMMl9NUEVHX1ZJREVPX1ZQOV9MRVZFTF81XzIsDQo+ID4gKwkJLnBy
b2ZpbGUgPSBWNEwyX01QRUdfVklERU9fVlA5X1BST0ZJTEVfMiwNCj4gPiArCX0sDQo+ID4gICB9
Ow0KPiANCj4gDQo=

