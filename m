Return-Path: <linux-media+bounces-21560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A1E9D1D9E
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 02:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA1F3B2123F
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 01:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833C513775E;
	Tue, 19 Nov 2024 01:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eeRsibSi";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="CbpCFxDl"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6434C79;
	Tue, 19 Nov 2024 01:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731981022; cv=fail; b=ORXPF3p8agI3Xd+/tVleSLDpTzLzzFNzLuPjPR0TuSBJb0IW3Yevqd/eTiDvR4e0l5leyAMUKezErV7rXM1VEVyHK7xrDXL26cwnr/CaOK2nZuwbxoLbRaaBUCfnOeORfvx1TEOjCRNHOiyDPAaJlfTWpdqb+dqY+mcRKS9ydas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731981022; c=relaxed/simple;
	bh=T1lREXh4hm5ObMhS9j1HZ5ARlhSCeIT7aAmCYcBYmu4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YVp+WtFA7JntOmH/SvBa07D5C2qzPJRAV/HiJ11oM1o226rZsVPfQXS/0B6HMKcM4si+t5EaQlUr2WaakTYGGj4dMRmSMgEiVRtZ3+QYa3rAM90iumGCKp/jMbTJrApLCDPh9jNEAHS8Rc7RSUX0vCzZAwF6kTd/kQmXILM7a80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=eeRsibSi; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=CbpCFxDl; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9e6e8a5ea61811ef99858b75a2457dd9-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=T1lREXh4hm5ObMhS9j1HZ5ARlhSCeIT7aAmCYcBYmu4=;
	b=eeRsibSiPazJ7e1A236JcL5iv+HXr6CpFk16GH1yDJN9oXlQxDgxooXzxeujHDXn39wcBWeA1cvDP16W0/SBHV8NBhimUDRV5w2J8HnHsEIlNk9rvtUgrmowmDDMBHUr01teWOJ7nIlhjdtMdw3DXne30ccdttqC4nig23qZGvQ=;
X-CID-CACHE: Type:Local,Time:202411190946+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:809b985b-23c3-409d-a313-b90ce4320324,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:9b9e434f-a2ae-4b53-acd4-c3dc8f449198,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9e6e8a5ea61811ef99858b75a2457dd9-20241119
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 170884755; Tue, 19 Nov 2024 09:50:13 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Nov 2024 09:50:11 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Nov 2024 09:50:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rE8N7ujTW9ysqmxYLnrW0qNbrgT55uivtJwJR83s2vRFPKlMuMuJ/0yx1rfifq1i4p+2KMVQ5V3CbLOiS1no/AApF4jd04CmdXn+xPvuPfrGdkQY9bebWlKrjwrTsIapmWZ3M5UmYQCcFn97iTD2WYHs/u/n3QMVtJ7ZR5+Kx+9Sb0ydi/7Jywom8lqSVzMZW1XZcPZI/JjmpXzzM+imhXNNpct9NES9+PXjQbzwM1a04WY0e+1u9YdFEtZkKBj24dQ0/vaGDrEjUmOvK4kE3UAGuW+sEhaJPGBVIwTk6t/aW2bJYvsP9M4waU3aDYHnvOHjYgdAec2JTCJCCn9p5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1lREXh4hm5ObMhS9j1HZ5ARlhSCeIT7aAmCYcBYmu4=;
 b=iCFK7lV7L3enit6oVLC2g0Sj1AAEI3A0tpulDh7jORa9UKlUEqW82sogjEfy9X4Xi64wnDFAnNQ7mdFiV0QuVAAcmap10Tdraszoi81Nb3nNPbfexyZNITDGTcaKD8eGrWVdiywifKl3K4DqWGo6m7oyPe4ip/r4azhi0fVwnOrkJLJxVWSZbJSxzQgIG3bjjFThdKhUCKMfMAUHETgjUkIJcPPL1BFF6FSgB9jSveHdSUGIwf9FWnVYYnmLofvXjVCrwpTBZeox3QUZGVgL7h4XWn0NDADX2Wna25lAbwEQ8nndxLgSKgAalTuEGvlSpTCCJyqSzHezPbjNLxqVYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1lREXh4hm5ObMhS9j1HZ5ARlhSCeIT7aAmCYcBYmu4=;
 b=CbpCFxDlR3spRClTmMuPNhYLW4Y2EM2taAUTBuNt1GYfdPcVopdebQW0Y2/8yg/Shp9fV9uqFnbIvEkjYiArRuVZo5WJPDklI7XUhUv/+ZWr7MPOYqZV0JYWnPo+YLXpFabE1jRLbV18Ndr2KforEq6WsKh/mKX3NhooQJIqmfU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6479.apcprd03.prod.outlook.com (2603:1096:4:1c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Tue, 19 Nov
 2024 01:50:07 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 01:50:06 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Topic: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Index: AQHbGj1K7oS5BpZAxk+Yfu5zQIUxBLK+FjwA
Date: Tue, 19 Nov 2024 01:50:06 +0000
Message-ID: <9d93099b16cfeb23602be3de7c3b7b7e8d1cf238.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6479:EE_
x-ms-office365-filtering-correlation-id: 4d014200-804d-425e-7008-08dd083c7e6b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RUpLaVdBbXhxUTdIdEFDc0FSamJ3YXgzUnFZU1NCR0hSWjZ4T1F3K0NjUGo3?=
 =?utf-8?B?S1ZrcE9HNC9UWFlKMzE4TTFwbHhwbFUvZFYyN1VUSzljZ296RTNqUG5UZHF2?=
 =?utf-8?B?NysxbDd1TXlsTGorckJPZ04zam9aV3l6Wkh3eVBlLzNxbDVGUUhkNVFSeWlx?=
 =?utf-8?B?UWg0Q3QyTHYwTFJyZjBaSmlaV3kvM0RwMVBJUGlIM2Vwc3V5TGZTeUtQNS82?=
 =?utf-8?B?UC9ka2kvU0JKM1FiZWtXYTI5c1UxcTlRZjNsaTd3UjlJeVZ2dXFFZHhkdG9n?=
 =?utf-8?B?SENVYnFKNy9rWVMwSndaeVRtRkZROXNGelEreHNHWlNsVk1rZmZ1RVFULys1?=
 =?utf-8?B?NytFb0tvYVlaakZVM2JZYWhYQWRQRlZXTG1qeks0a1R4MWRIcmVpUlFPSGRu?=
 =?utf-8?B?ZzNjTHcwRFJSTFp1Z3ViNDFBcVEwZnp4S1ZmbVhyOTBnNmxDMThmT2hWMkZ2?=
 =?utf-8?B?K0paditRMUROOHdoWUE2Q0RreVVsUnhhZFdSWnJLVGthYS9pUytSdWJWeGwz?=
 =?utf-8?B?VjFZWURXVndHczhKTzlVaXNCdlhXTCtwYTR0c0swVmx1OFkzVDNJNmFpd20r?=
 =?utf-8?B?U08rMG1pZll4cDU3SW94WmNCdlArb21nT0xqb2xXZzRLd0xXQkd3UWg5Lzh5?=
 =?utf-8?B?bkgwRzNnR2F3dnRkMVZmL3Z3NEpTVHE2bnB0L3ZEOEsrNXVpUll6VHNzcTN6?=
 =?utf-8?B?NWEzZ0Yrd3Njc2JhNFZwN1poQm0wRnpmRU45cGZRYnBPSmxEVDdSMmNRSVAw?=
 =?utf-8?B?b002VURNOWhZNjJuc0JNSDBUMlY4QUVLZmZhNUdKSi8rZ05laVg3SFkreURu?=
 =?utf-8?B?Sm5iVjlzWVRLb0R5TUFLcDBRU1B3L2YxK2U3SVhSZDI2YlNaZTlhOUpIUlVx?=
 =?utf-8?B?bmt6b3cwaTBKbHZveHZaWmYwWklkY3FLcUZSQ2ZxTmg2eHZmVTNkYVJGSFRx?=
 =?utf-8?B?bVpyWDJkRUl2VDdZOUd3NjlLNzdHQXJjKzZzZTZmc0h0Q1N0eHZEeFFFSXE3?=
 =?utf-8?B?SG5FZkI0M1o1ZFJIQWVMMGxDL2owY1ZQV3Jjc1FtUWYyZ1lRQncxN0I4Q1RI?=
 =?utf-8?B?clJRRmRJZng0UnYrYytqMUZRRGd3VjBock5kcElMOGFyVEV0RzNMS2U0MXN0?=
 =?utf-8?B?d3RDZ2ZxeUNodlpZSHVDbjB3czlZWk5RT09lK0d4WmN3bkM0bjZyQU02TmN6?=
 =?utf-8?B?V1cyREpzZXoxa0pMSW9JdVF1TUI2MzV6WkEwNFJKZ0ZOVXFhU1NCS1JOTVE4?=
 =?utf-8?B?Uml4WDJpYTErY1Q3TmVtcVdKLy9RL2Z4czhsV1lqam50TFRqeHpjaEFtakc5?=
 =?utf-8?B?MkUzcWNnQXdsV09KNW4xUW93WU5NcVlQZTRzd2ZFT1k1VWlPcGpteUhtZDdx?=
 =?utf-8?B?L09XMTlQZmpGc2oyTGc2OFZ4VUlBV21DcTBrL1hQa0IvbDlhTlpEN0NGTFgz?=
 =?utf-8?B?YTdVWHlONHJxSGl3RjBlNGJ5Nk96dUVnS3BCckJZVFduVXlzalhobEdxNWlQ?=
 =?utf-8?B?NytRNHNVdzRTZjNKUkJVWmpySFk1cWV6L1BIT3Q2a25HeEJDb2RuZ2xOdDVr?=
 =?utf-8?B?ZnJ1YlB4end5QXkwRTE1WEZDU3BiS1p3emdra3hkSmRITkR2dThaUWJqcEtR?=
 =?utf-8?B?Wm8xSG96SW5maW5ZeTNwdEJ6T21aWUxwbXBVUStyUUEwR2U1a1NhM3V3VWdV?=
 =?utf-8?B?M2xEQmkxK2pEMnI3M3UrUjZxWEhUMXJPbXQzNFlkcEJsRTBDRXZVTGF3eDFk?=
 =?utf-8?B?ODdNUWtnQXFsaTU0L3pqZng4eHFJUjgrNFpmc0RjWk1wbGptWjdUNmVxVFU1?=
 =?utf-8?Q?L0ZXJR6web4xWqHNv5k+4ZLk0yQxXgZlv+hGw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d09uWE96TXFUTHlrWjB1ODBTRzh1bGxzVXZNRWhLQ2JyaHZwYmg4ZzhERkZQ?=
 =?utf-8?B?Z1JLOVRVVjRnZTVkc1hvNjlwM0ZFVmV1Ykxrb3RpaUdBbGovVzkrMU9FVTd4?=
 =?utf-8?B?akYrY3RMM3BoMnM2NHB1STFCcmEwTjBoSlc5SGN4djNnNW96aTVtc0hUVEV2?=
 =?utf-8?B?cTRvMVNBYWtmUVZuekkxOHdhaDA3b1N2d2tZSjRSVzhXSVowUWEyTDluZ0dh?=
 =?utf-8?B?aXNSQmJCRzJQeUtKK3JBb01PTUJhK0thbWtvdmNTenJrNCtOZ0dMd0tvN2tl?=
 =?utf-8?B?ZHBCbndVaklVanRIc09FUFpiU2U1TklBaEtCUStCRTA0dTd4dEErdVRZSFZj?=
 =?utf-8?B?NW5wV3YrRmwwbmxiL0I4cGlaaFNVdmtaY1ZjSWM2UjRiVENLVUJlcE14L0dh?=
 =?utf-8?B?WnEvNHR0THJjdTV1cndveE44UE9Fdk5Ibng0YVU3VGNLclZNTFhmN2FJMnZY?=
 =?utf-8?B?ZStjd1lRa3ppZ3JlWWpCb0V6WFk2Rno5VnpIV29kdDVOYkZ5M3RJRmNxbVRu?=
 =?utf-8?B?NHZYOEdvdWJQZ1VtSGMxYXRFUjhlbWxwV1NrSnVMQ1JPMFBGeVIzRUZxa09q?=
 =?utf-8?B?Z3dtdW5ETFplaWxnUStWQjJUTjZQbzhVK1BkclRJUU5oSjFSaWw4cTJhK1Bk?=
 =?utf-8?B?RU5qdGZuM0xTOVZZV1pIYnc1L2hQYWhQTWovTUN6SHhpYmNNa250U1BDQTk5?=
 =?utf-8?B?S01sZ09PdHhnLzBNb0ZTQ2YwV0hTY3lRQnpha2JRaHUzYm1XellESVh3dWlJ?=
 =?utf-8?B?RTVsZktoajk3UDBrdnFZZjE4VFJ3emxZbXpaUk1WSE10OEtKKzhIczcyYTJL?=
 =?utf-8?B?NTljUzZoTnZIZ3M2d1l3YWc2d01IbDU3emV0RHl3UGJqM1dPSlRpTVpacW52?=
 =?utf-8?B?di93V3pCZHRFSTJSTWVMcTMvckdLQnNwNkZhNGpjVHBJTTNZdXdvNFpHM292?=
 =?utf-8?B?WjdXV2JrOHJONlJLMnV4dGl2elV4dDdQMFZaSngwN1lXLzJUd3FlWnFKaCsr?=
 =?utf-8?B?ZHpsTm5KdVRvT1dmbFJvb3RFbGZIUktWbjJKcVdzZjMrSng1TW0rS3F4Wklj?=
 =?utf-8?B?Y1BjZi9sYjFwVXpmODVIQ3ZsT29DSkJaZ3hRZnk3cUY3STl1c3dKTHJYK1o4?=
 =?utf-8?B?UGpmdE5zeGRIbVZGV0s5L0granJaZ0cydVhPdG9jbVFyS1FxcTJqZnpMb2FX?=
 =?utf-8?B?cG5HMVpMbXVRUy9IeDZ6RTkxRExSSklpc2V2TWJVMkxHQ1ZYcmxzUjE1NDJ0?=
 =?utf-8?B?UDhla1JtdWlPbU9XTXgyRkNwMHdhdVVtOVFrdzIydVIvL25Na2Znc3l0V29w?=
 =?utf-8?B?dGp5dVpRZEFUWGF5WlRRM0hFaFZQdC83MTNLTWVHN3pKc1REenhGSDJKOVdO?=
 =?utf-8?B?clVKcE1pY3BEZG81cTkzWm1sUVFZRlVDZmV6YXNoTkpZSTd4RExTcEtwQlc0?=
 =?utf-8?B?NmRFYkl5b0lhV3JGY1NOYU0xSkx1Y1hGMEZMLzBCLzB5U3pleTBJWUlSSEJw?=
 =?utf-8?B?a3dBRmsxdUdYaUhtN2tWcCtEb3BnTk1EbFR2QTBzOVMxZlUzb1dYUWFQY3V0?=
 =?utf-8?B?QXowODc4VHVEcjllSnpIOHRGNFBObmM2T2ZyWXF1UWtzb1BWL2ErSFFUUXNB?=
 =?utf-8?B?Mzh0V0JMTmNEcWVxMmhHUnZOTW5ELzN5ZFd6NnZndXRBakQyTUF3bmJQZDlL?=
 =?utf-8?B?dVg4b2NhdUJ5S0tGclA5cGt5dHQ4aFBBaTFqRlN1VGZPSHI0ZXlMYm1oNUJt?=
 =?utf-8?B?c1dOeWVSbGk0RmFPNEF5OU9ZZ0NoME5UTDEwMzJLZFhSWCs4c2llVmdpL0pm?=
 =?utf-8?B?Y3NaTTlONE1jRjNobWUyaVYyU2xlVjZ4K1FSNzZjK1dvWnN6QTI2aUJHTmpL?=
 =?utf-8?B?VTQwdzJoU3VKdkVxZXpBRExsbkhhNEpuUm5DMzNseGRiR056VEl0R2tYa0o3?=
 =?utf-8?B?eDBhRXNpbDlXb1RLaUFyVHdBcEdXbStpemhhckI2bTJWZ1ZoQmdNOHlSaTRt?=
 =?utf-8?B?K1hxdnNUNFlPRWttMTBQcEE2TjhUTUpIVGRUeElDd3VFVHgxQjNlK090eFlz?=
 =?utf-8?B?QkxEMUZodlFEbUkwTCtLc0hVNm9ick1rUzRDeXIwTFhVeStZRGY2bDdLK2p2?=
 =?utf-8?B?dmNRckg3ak9NanN2Z21VMWRxU3hneVRuN3RXTHY3YnhHa2xHSy9NTGsvZXNH?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7C153D710A1B740A51D075DB1DFD8EF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d014200-804d-425e-7008-08dd083c7e6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 01:50:06.7925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Glpypce+xwGRuIe4e+c9cuNQbFtocjogEhAiyC7OGDKyYhQ98OBS0fRK7u3a7JJBxiCviX7BXKJKMURr+WNFVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6479
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.407100-8.000000
X-TMASE-MatchedRID: 5+1rHnqhWURm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYPuA
	5hg2vazcZc34la8q513oOFZKBrFWj0ILcl5xUj1W+Fq9Vk/m1Nravf8JfgyUoJsoi2XrUn/J+ZL
	5o+vRV7wDpAZ2/B/Blg1fA1QHegDv3QfwsVk0UbtuRXh7bFKB7gQwmAtfk3LPttksnjTj0GsLgr
	KOu9oghz4lmtW4KuAFxYVzI3UCCaY=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.407100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	29FA3E32B36C29BFB9796BCA0CFEE6259C1ED2EBD69D1F284B8914A69C0B584C2000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBkcml2ZXIgb2YgdGhlIE1lZGlh
VGVrIFNlbnNvciBJbnRlcmZhY2UsDQo+IGZvY3VzaW5nIG9uIGludGVncmF0aW9uIHdpdGggdGhl
IE1lZGlhVGVrIElTUCBDQU1TWVMuIFRoZQ0KPiBzZW5pbmYgZGV2aWNlIGJyaWRnZXMgY2FtZXJh
IHNlbnNvcnMgYW5kIHRoZSBJU1Agc3lzdGVtLA0KPiBwcm92aWRpbmcgbWFuYWdlbWVudCBmb3Ig
c2Vuc29yIGRhdGEgcm91dGluZyBhbmQgcHJvY2Vzc2luZy4NCj4gS2V5IGZlYXR1cmVzIGluY2x1
ZGUgVjRMMiBmcmFtZXdvcmsgY29udHJvbCwgYW5kIGR5bmFtaWMNCj4gaGFuZGxpbmcgb2Ygc3Ry
ZWFtIGNvbmZpZ3VyYXRpb25zIGFuZCB2aXJ0dWFsIGNoYW5uZWxzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCg0KW3NuaXBdDQoNCj4gK3N0cnVjdCBzZW5pbmZfY2FtX211eCB7DQoNCnN0cnVjdCBzZW5p
bmZfY2FtX211eHt9IGlzIHVzZWxlc3MsIHNvIGRyb3AgaXQuDQoNClJlZ2FyZHMsDQpDSw0KDQo+
ICsJc3RydWN0IGxpc3RfaGVhZCBsaXN0Ow0KPiArCWludCBpZHg7DQo+ICt9Ow0KPiArDQoNCg==

