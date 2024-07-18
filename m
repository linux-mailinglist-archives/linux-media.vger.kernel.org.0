Return-Path: <linux-media+bounces-15106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E3C9346B0
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 05:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EA18283DF6
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 03:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A174434CD8;
	Thu, 18 Jul 2024 03:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ds+Pdx09";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="jQdu7wAA"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3991B86CE;
	Thu, 18 Jul 2024 03:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273218; cv=fail; b=hfsm9veoARvFDuc0Rltu+mW0oMaNi2W665eDXjcI783Vm3e+p48pzQX7gjyB98eByXLli98/sqnnVGVzW+gP8oRAO9b4OaufT11niPWwigoshC7rAUUBVINRp7TZg02/hXQmUF7iSp7HEx6COmQl3faDqTz272GJ4ZlTOwsF9kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273218; c=relaxed/simple;
	bh=tncWCrUXHh7WMiqV4hP2lbUa/lnSB2P96RKrqWm6TkU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VCdcpXCZlodBe80e0fd+WrDCq+sLwRGeDrkmE6RLBa8ULzWSFjooWRzTmdPZc74dN9p+SZGFuwZG/PT1QKKqSVKebhdrBixKxqVzXbEPZtuMHe+qbkIiCkQTtdwGftL2BKnfd4v7SJ9yewQBDXpb1nFdbKBWQuFsys3D8RnK2s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ds+Pdx09; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=jQdu7wAA; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 911c7e8444b511efb5b96b43b535fdb4-20240718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=tncWCrUXHh7WMiqV4hP2lbUa/lnSB2P96RKrqWm6TkU=;
	b=ds+Pdx094vsCr+1onycqujxq2RVG8ZmGJciBaLFQfvkaophE8q6zOnQW6VmQ0EgfekKinkSl3fnK+O3QkzOhkrkuI/vClJbmMw99/+UWI2g53fcxi95F2JhNO7nHkeS5BewnUsFXPj3AqKRCdc1qZJIqFuACqUEv1J1xE4qFuU4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:19839df2-28bf-40d7-8c1d-9f4416fea931,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:d18d7ad5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 911c7e8444b511efb5b96b43b535fdb4-20240718
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1480809199; Thu, 18 Jul 2024 11:26:48 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 Jul 2024 11:26:46 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 Jul 2024 11:26:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7aHGdw6RtCJYAczl6Hz9aZ0sE4txjBl/7kovRgv7pwc0+7E82Z6m/bMJP3FunKU7lDuRuSF3GhmnypM59ALvEEKlYNq0GLWKJ+eEyPOoiBfZAqONTAQWCBR7BI9JbnbA2/ZmF5Yzv1cIHj8Che13ROLIo+DGfI7UsAxvHvLsrDBmGfJhYatoQ86ljPL+uKlRYU8UTc6R+dTc+0HQ/UWaNHkl8fdi0vF/3kxOYwAyIM1To1Z1Sy68D5MnomH2q9yc6fNXHGpYSqajmgJwz8dKPOOQbw7UcYgHkAG2fjBXRSHTn2qnYyyLlGUvcBsuFnu9/iTvp+NgHTvtuzzln4+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tncWCrUXHh7WMiqV4hP2lbUa/lnSB2P96RKrqWm6TkU=;
 b=yeg0q2A8sYz818Ryt+tN8SnBhXp5cWIVgVNtz0QXhejqBkG7vwdqO4QYOQucFjIat3ZT1kjaHGrtQJtM+mEqfxT2CF71agJ+qhm14ltvHrnfd1wGSqruklE47/kpRSurAJwUuSgDzQWb3kbN/x4f84AXT1aCxDEM4kHMbpEPvkA72qajO7rq/TUZbH+96TwzLJE+ZKf+7WO28YyQVzfOhCGy4jAqkAStu0h7Qgvhq9gEMkjHxm9labDhURsCjz8oLWHUdjFxOinImo2FVVH5X72ZtdVTkvk3jEWS7/cFE+y9RJl97C9MHfXgALotMSwR8P3GEwh1aQZwTwP5m3dDQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tncWCrUXHh7WMiqV4hP2lbUa/lnSB2P96RKrqWm6TkU=;
 b=jQdu7wAAVh+0wz1JxkAZwgYRKewAtvXBUGCGfZct10ESyWiL/JXR4GmG6Oe98t7atXSKotmQdvy7/LJFp+i4gzRbnAwwTGPwD3PK1KW37StC5ZGzRuNyK37WvYf18Pdg/XyA7uD2n/XxzNcWL4fLcq3G8HmPkaV5/3ROyB1QFsY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7969.apcprd03.prod.outlook.com (2603:1096:820:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 03:26:44 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 03:26:44 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"jstephan@baylibre.com" <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Index: AQHazhdkyJtqWsdLFUSbwSAjf5xgNbH76HCA
Date: Thu, 18 Jul 2024 03:26:44 +0000
Message-ID: <c362839138bdd5e85809ca1297e88938f101c46c.camel@mediatek.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
	 <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7969:EE_
x-ms-office365-filtering-correlation-id: 5f1b012d-8e84-4efb-df22-08dca6d972a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?KzQ5MXlRcWdRS0d5MTZUNWpHOTNyaEtNZEkvTEJIbXZKaTRKVVJnajMyQ3d4?=
 =?utf-8?B?RU9ZM1JKRWt1K3V4bUdpbVZYWm9HaFNTWXVGVFBVcTVCeG1GbGF0SGF1Y3Nh?=
 =?utf-8?B?Q0FCK0MzTDJ3RHdoTzFZNmNEZjFpUHQvVit4WEdWTld4c3VqaWFMSkFKQ2VQ?=
 =?utf-8?B?d1BadmVkTkZ1RWwxZllwVUdoQ0ZBdDVacE5ZUFArRHRVOG5pTWY4eHZRQVRp?=
 =?utf-8?B?ekpIa3I1L0NzZjBCUTE5N01JTTczajJQNVhKYTBtS1NVMW1XZnNNbEFucEhW?=
 =?utf-8?B?TmVGZFAwT0tsbWN1dkszS2pLTzNZVXZhSFlySi9KWjI2ZVZHbkVlUXg4T1Mx?=
 =?utf-8?B?SEs4c1lGT3Z2OXhhZHFUNnlFVHY2N1FWWGRrU09xS1NFd0VSeFk3cWFUZ0Zw?=
 =?utf-8?B?ZmNZY0NyNkZpcDNsRmhjSXJGaGppV1piVWFsekRyMWlnSVJycW5hT0Q1TXpN?=
 =?utf-8?B?UnAvUUtzSVk2Q2tGUittRHlMRlgxSlJrUC9JRlZjU2JRdVhYT0xHSEIyNVhk?=
 =?utf-8?B?bTdYb0FCcTdxQitoK2RsOEJFR0dlRDlhZmFGMDhQcHVia0VYOTBVYWRybmN0?=
 =?utf-8?B?MHdJUEw3OUE0SmxwbmJoc0o3WkJpTkNyM1liOVZYeHdWNFlad2U4NWo2WS9S?=
 =?utf-8?B?S2lYM0ZHdDAydkNsRTVtSHBnMmpJQ3pRd3hEU3FuOFlCWXFkeFoyQ1AwSmVL?=
 =?utf-8?B?Qzh3WVBXVGxPYWIvU0hxZldFR0N6a1B5dHdiLy9tSVY4dTVQSDZYbC94TmJm?=
 =?utf-8?B?VkQvT2gxbm5MTlJmeXFqKzREQnhudGtrQzMrZ2FiZDBFaTgwWWZ3alhiUFRW?=
 =?utf-8?B?Z0xCOXVveldYcUFtbUpwNHFRQ3laOFNuckxiRDFDT0kzenlzQm5nRjBNb2hn?=
 =?utf-8?B?dXdwTThDNzVWT0N0bnhEczJlQkFBVUNYdVJ2UnZOZXppUWczTGQxV1NVcEo4?=
 =?utf-8?B?akd2L3V0SGluUDY2ZTJwaEQ2bHZqMXRWS3owa3lOUTRyWFQ0cVY4Rjk0MFFM?=
 =?utf-8?B?SUswU2YzMzhUMTc5dHFPWWhYazFqa3hVWTVNQ2ZnVTlmN2thak9iaUNkKzlR?=
 =?utf-8?B?ODl2QllZRUFEOWtNYzlIQnlIUWF4TDl3K1lEYzRZbVB1UGlKaFJVSzJUQVRO?=
 =?utf-8?B?czVGUkh5T0RibWN3aDhYc1JLcm1qVUV4UWFzMG5IOVAvNkphUEZPTWhsKzNO?=
 =?utf-8?B?aTZrNU1pczlnM3JWaGlnVTBoc1d2WTNzbDB0T3BuZ1FqOWlCU05PTk1sdGtE?=
 =?utf-8?B?UGVobFJ1UFNtVU4xSmpDdTdTeVpVQzhrVGhNRDJQZEVERzdNcWNOdFpEQ1VV?=
 =?utf-8?B?Z3dhNHQ3N1ZWVTJ6UXBYU3N2ZG9EZ1JtRHZFTkVWWUxWaEtaOUNMSDU4VVN5?=
 =?utf-8?B?bHFJT280Z1VrV2hKUEdZUDA3MU03VlA0VFBsaEdtSUdjdGxlQUFuZi9aRmc2?=
 =?utf-8?B?TllhTCtUc2JXaC9JbkJnZG43YXl4bnJHRDByMTVXbEJEcS9YSFlXODlJVW5v?=
 =?utf-8?B?YURsLy9tSlNVdDRwWjZRVWNUaUY1eFd1a0N2V1B3ekJHaXl3eEFxNGVscFBI?=
 =?utf-8?B?RTN5WHJCNXJER3UrYWlPdEZ3RHhTR1dOL0ZCUU5MQUJOY0VxUWtvZFI3cjBH?=
 =?utf-8?B?RGx6TjZ3bVloMnplUDJRT0JZc011clNxditGTU5FZVNRSkpqbU9nUTFrRHF1?=
 =?utf-8?B?Sy9mb0JsRU5hSjUrNk5JekRjR2ltVzIzMElFOS9sZEkzNUxINWlNV2ZkTW9h?=
 =?utf-8?B?bG5YOTNwWWNHTkhtNCtGQTh1Tm9BcUZWcUZMcWhqbVFUZlBIdDNtWjN5bjNM?=
 =?utf-8?B?NmQyT1JEb0lWb1o0K3g0dGFmM1RFdXdWL28zSlJ0UFJvOEFZWGhYR282WUdu?=
 =?utf-8?B?YlJKclpxdndQanFwaWQ3U3dHdjBzbTdBckFMSDA3TnFNQlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1diU0RoSnowNEF1OVN4NUs4emJmMkhYWXhNeTc2ekxDZ0p3VWtLMnFUUG1o?=
 =?utf-8?B?MjZNcmNaanh1OXcyY1FVU1l0dktkYWJlK21hbEZmWW5XVDZ4UkZqT3JsaXFT?=
 =?utf-8?B?S2FheWR0WDBuaW45MFVkcTNoZGVYSW92Z0drZjZQbmF5VHpPWmQ2SythdkRC?=
 =?utf-8?B?M3dGb01ib3pieWtBMEtRaklWWVk1TmlTRVpNblJBZzBiQ3RpVEtUZ0Nsakh3?=
 =?utf-8?B?RFl3ejgvQ1Y0NTE5Z0tnVFgxeDEyN1p2Rzd2dEJLQjg2bWozL0ZPTWpZQmFZ?=
 =?utf-8?B?UGt2OGF5elJCd1hHUU5nd2owWklBOHUxSTlFQlI4ODlOWlI2SnpscHdRNVhv?=
 =?utf-8?B?RVg1Q1dIRG1XVk5ldHpmei9QRHdQS3lvYzhwMVY0dkVBWS9jYUY0TmNSOXJM?=
 =?utf-8?B?OWxJZnBwa1dZcWE0eGRPdG4ydlprMXJkZXhwZnlyek8wZHJxQUkxYUVrZDVD?=
 =?utf-8?B?bTl3VGVSTGJZeGJhemRkM0ZYMUcxREx0UVcyNGNJN201dks2UUNHYmp6RC9i?=
 =?utf-8?B?VmVWSlc2T3V1Y2UzcXV0NGk4RWtnMytsZ0hrS2Z4eVZROHkrMjFjM3ZhVW9S?=
 =?utf-8?B?NktUTTc4QmZVQi9UWnNTa0pwcUdVTGRXdk1rMjI1RE96dWsxcHJURVoycTlZ?=
 =?utf-8?B?YmNwMngzSGVPTnVyOGlJWGxnUmJvUFJXdmFPaGlRTGhxdnVLb1lOeWUxcjFT?=
 =?utf-8?B?NCs4WU5HcHh1SWdZdUFUenBqSjQ0UlVzeldmcEduTlJSMDluWXhhK2lvVDR6?=
 =?utf-8?B?QXF4ekdUUTNBT2Jwd0ppUjF3MUNqSEdweldRZjRySGxmNE5WaE14ZDVxd1c0?=
 =?utf-8?B?NnhWWHZNMEhrL1Qzamt3RXpYZkRoNlJkbzRNcFpDRVpQbTFRNk1nekNGNUl5?=
 =?utf-8?B?WkExR1ZwRHhwY2ZWN3htM01BUmRVY0I5K05WcHhXK3lxeDRtUlh0SGx3RHdt?=
 =?utf-8?B?aFV2Q2NrZ0Q0QWN2NWFrWHRWNGhjV3I4ejM0VG05SkZ3WkxEUXlicWI3WnZO?=
 =?utf-8?B?VHV3NDJndXdFeUlxdjVSMWhLdHUza1JGTFB5V2EwM09aMjlyZ0grSkpYVHRM?=
 =?utf-8?B?MXZFQVlXOUJzbitGZFZvNEYvWDlNN0ppam9oQ1RIWjNiR2hMWFNsTEd1TENC?=
 =?utf-8?B?ZFJiM1M3UHgzM3VCVDZRaEpPU2dFTjVFNUxjR0tQL3VSQUorYlljSUdqZHNF?=
 =?utf-8?B?RjVzZ1hDN3loTGJOdU9uUzVLWkpqbjcvVDZNakFJa3B6ZlNzTnprQUZaMGZL?=
 =?utf-8?B?YkdTUHpmdW1vYUxtU1Z0dnBxRHR1SDdNUWtWNDkwOHc2UDZ1K0lXY0QraDB0?=
 =?utf-8?B?Yk9MQkxYeDAzZHA1Y3c3L1ZyWVJlLzZlSzZubDJGYWZGK0xqeFBmSGh6bmt4?=
 =?utf-8?B?R2tUTXhXRHNOMFpNR2pZWlVkcFJ2aFJtY1RZNDNZV05OU0h2SUg2L0FFak1P?=
 =?utf-8?B?QWtGaUFqblR3S0prWDdQVEhMNzZzckExT1VETSs2emZwWGxGYUFRdjdlcmFG?=
 =?utf-8?B?WHRGRHpiNGVUMW5YUkQ4R1lUNU5VU2R2ZWpZTFkyMCt1QzZmb1A2SWNtNVR1?=
 =?utf-8?B?STZNdTZWUWR4VCtyTnNvNUdvUU1OdWVRTTRiQTJqTUZ0V01tRVYrRUM3THBv?=
 =?utf-8?B?bWJJYkRaN0ZnMFJZbjgrRWE0RnBnbkI2RFp1eGtmMllFRzQyWVJMZVlqQjVZ?=
 =?utf-8?B?NkpBOUM3TTVNVFZncGlzU3ZaNCtJaFgrY1F4N1pESDA0MFV4ZmU3VTJ5dW5J?=
 =?utf-8?B?NWxKZjhQM2dJdUIrcTlleHdwV3diNTNxT3EyU1VLRmN2dXRyNGxyclpOekJJ?=
 =?utf-8?B?eHJJaWRsNDZzbGZlT2o3QlF5TkZvVmx3SmRnblhpWTBKc0prRnFFS2VkSTN5?=
 =?utf-8?B?TzRtYnl6d3FuS2FoY2NtSnpSaTFlVldZT0ZpeDMxV2hzR2hCcXoxU0VSQk13?=
 =?utf-8?B?YmhlbXBIbG5nYldCRVQ3dWtqMDNzN0RTTHJwNjh0dU5sa0JRUXprWmM3YlhF?=
 =?utf-8?B?dmFBV3FPYVcyVTZLTG1SZ1lUczFXRWg5dnJwMXFHZEx1bStGK2pmUnZvaHR2?=
 =?utf-8?B?YVMwQlJKU0JHWTNyRGN5dzBHeTZyME5FS1BjcHR2Mlk2U0xBZnArcHdVTmpQ?=
 =?utf-8?Q?BMPPTUVWuG6ro6GiF0/Xrym+E?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <284D84002085FF4B91798248E6748274@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1b012d-8e84-4efb-df22-08dca6d972a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 03:26:44.1027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AG2K/vew6gxYIFjZCZWiy0DeprSNbZ33GtCJxZ+LmLjryKnc33y8Qy0fbZ3YNinauKC3mVfz1SAhILB5SGl28w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7969
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.846500-8.000000
X-TMASE-MatchedRID: nVQUmLJJeyYOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0r/XD0CNJ3fxO4dcT3ZaTocyYHhs0mgDoxyETzgIO4sasaQTVtPXXNMMhP
	1tiEXdMtQMZqfFfF8q3JxjrgBF/XD0RCs70uuPqGsgaPSWrovRn0tCKdnhB58pTwPRvSoXL2y5/
	tFZu9S3Ku6xVHLhqfxIAcCikR3vq9QYEozb8nt2npiIK3ls/rcjmzIzKhkmMn9cVSnQAww+ZqQx
	LL59awJ
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.846500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	446DEAAEAEECEC5234A1B734C5D81EC0D1CF83771F30C359CF6FD276FEBDEF242000:8

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTA3LTA0IGF0IDE1OjM2ICswMjAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
ZW5AYmF5bGlicmUuY29tPg0KPiANCj4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5
cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gY29taW5nIGZyb20gdGhlIFNF
TklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4gcHJv
Y2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1AuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+
DQo+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBF
bGRlciA8cGF1bC5lbGRlckBpZGVhc29uYm9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArI2RlZmluZSBJTUdfTUFYX1dJRFRINTM3
NlUNCj4gKyNkZWZpbmUgSU1HX01BWF9IRUlHSFQ0MDMyVQ0KPiArI2RlZmluZSBJTUdfREVGX1dJ
RFRIMTkyMFUNCj4gKyNkZWZpbmUgSU1HX0RFRl9IRUlHSFQxMDgwVQ0KPiANCg0KV2h5IGRvIHlv
dSBkZWZpbmUgZGVmYXVsdCB3aWR0aC9oZWlnaHQ/IERvZXMgMTkyMHgxMDgwIGhhdmUgYW55DQpi
ZW5lZml0PyBJZiBzbywgYWRkIGNvbW1lbnQgdG8gZGVzY3JpYmUgd2h5IGNob29zZSAxOTIweDEw
ODAuIElmIG5vLCBJDQp0aGluayB1c2luZyBJTUdfTUFYX1dJRFRIL0lNR19NQVhfSEVJR0hUIGFz
IGRlZmF1bHQgaXMgYSBnb29kIGNob2ljZQ0KYmVjYXVzZSB3ZSBjb3VsZCBkcm9wIHRoaXMgcmVk
dW5kYW50IGRlZmluaXRpb24gYW5kIGxldCBoYXJkd2FyZSB3b3JrDQppbiBpdHMgYmVzdCBxdWFs
aXR5Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KDQo=

