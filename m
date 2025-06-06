Return-Path: <linux-media+bounces-34179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE504ACFB6A
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 04:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D8A81886439
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 02:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7460B1DEFE0;
	Fri,  6 Jun 2025 02:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="O4qD7Csd";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="juimAGfG"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730871DFCE;
	Fri,  6 Jun 2025 02:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749178464; cv=fail; b=h+SkDoiMQg+QMtuFUU8IvyfCrxISBY0D1k3dFf1kNJ63xw1zYMdznK7zkmeB7VX77BlxVgbc/xRCNztvtHAvtebSStkwZ10SLvbJw/zjQMQ76P5BIyN0yl++A/MuhPS6yCSU+8BFMAlDeekJ9RMT7Cpzou+2YmxReeCY0amdBdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749178464; c=relaxed/simple;
	bh=PXEJVa+4un8fUq0d08QMBvLIImOcqCGPPE2G9P0IK58=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KUaAe0j47H8FSVQU+SPs5/UHhNcyuVAkB6ucfOBCQSMeGydI6jK7EfxvYzT5hf5hfkSVkZaoZLuGAyB5hbJqjt+w9lasRSPsKUcapco+VCz/rl1kP7ftkd/z4LoEvFKuQdHOQ8Ig/R7Z5FZzlSSJ+yKe5IaqWi41uJCjIX5oA1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=O4qD7Csd; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=juimAGfG; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8a774404428111f0b33aeb1e7f16c2b6-20250606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=PXEJVa+4un8fUq0d08QMBvLIImOcqCGPPE2G9P0IK58=;
	b=O4qD7CsdEsm7YSAc6+BTxvw97ug77A/xD0+G3xkJcSGB55kEooCOXAPKoLjd9Mhq4Zizl9+ufg7PKUVh5bpPcXZpFzNob/tWH/xzdnPBsZm1QWoHq+SWmWNeX6w7g/XmKvoG3at8eHMme+DTElWMvGLeEQwE6cF0TRdZoStCuIo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:8f876e66-3bd7-4d2f-a5b8-8f38a34c2da9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:71dbedf1-fe3f-487e-8db5-d099c876a5c3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8a774404428111f0b33aeb1e7f16c2b6-20250606
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1597106751; Fri, 06 Jun 2025 10:54:18 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 6 Jun 2025 10:54:17 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 6 Jun 2025 10:54:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=er7cKlcurKleS2h0pOb6tIv5PbpbiBfxPxFGqnL9MVrNocfNQbPefzR5HejYokG/Zh4W0Pp4Sy1EEEwq7LHmz9mvvM7bRjKWsQX86k63YFW1t3AAqjo7QZS4jJtq7kPsFMM8leUJKGQj9PoVU27ihn4jJVg6PN334i5/IE53HwzIHu7IQAN/X+mibCdrMcV4CsF24dlyCYMd+Ym0W0cdxDfV7JjdBe4h8cD1jCnzl98NPpWITH0eqK00tfebRPQzvEfmWTzhmR+940pVM3I2F4iG/fnTjHPyN51BIQVAJGfgu184NY1MJEjqhAQRyv0fml52WQz2748Nu65CXypFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXEJVa+4un8fUq0d08QMBvLIImOcqCGPPE2G9P0IK58=;
 b=O8r4MA8b0iVL1EcWJNhu7iDcEzbkfAckf8xU5L6OTUtY6k3sXsiPK6G/6wszP3KmOfhW6wCSvKkwra5GpBty7/TBGTmSkwOZMa6BTAEhiNtGwZEPBkk/mjayHjM3UiajdQ3mx41l2tdsEf1jdAw4eoSpOoMwcZjgR2WSD36954MF1vz+QIPTtl7aGd8aD3vOlsIPdOtG0YN9KskU7oWS1MHOB5Oa/dzVBpcW25qU3j4x+yzV6VF3Xqiu4qYKMuij2yrMBOvU1G0TFlgLi7extrU7PkKmCR37rX+EXGVa7SaZ84thZwtM2n8XoEBaTlXEXF/c0wQqO9Ini1ZQ7FcEcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXEJVa+4un8fUq0d08QMBvLIImOcqCGPPE2G9P0IK58=;
 b=juimAGfG2VhbQEQBwJe73s+I+p7RZirGfaDbB9CvLAE+Uwki3RQwW5OcmG96NZ3iQdJZgLEHowiQkEW0zHPIvrpB6F68CXnImiFXxBxL+zU4d5RS9M6hUDJBtjmQkSxYmq8ChBRnkYO6rVkMPiHoQMWut5+9Es1d335wSzzRrEE=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEYPR03MB7314.apcprd03.prod.outlook.com (2603:1096:101:13c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 02:54:14 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%6]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 02:54:14 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>
Subject: Re: [PATCH v5 07/12] media: mediatek: jpeg: refactor jpeg dst buffer
 layout
Thread-Topic: [PATCH v5 07/12] media: mediatek: jpeg: refactor jpeg dst buffer
 layout
Thread-Index: AQHb0TcARGLkUUk8hkiscm6aAGiMVbPrcM8AgAoJVIA=
Date: Fri, 6 Jun 2025 02:54:13 +0000
Message-ID: <a84c6da0f14eb51aeed478c254f07ae23cee13ee.camel@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
	 <20250530074537.26338-8-kyrie.wu@mediatek.com>
	 <8eadc152c3542c30fb31bb67093087f2bb0a6c31.camel@ndufresne.ca>
In-Reply-To: <8eadc152c3542c30fb31bb67093087f2bb0a6c31.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEYPR03MB7314:EE_
x-ms-office365-filtering-correlation-id: abd107e8-8292-44f3-4dbd-08dda4a56baf
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?MTNCMFpQS2ppS1FlcmRYN1YxV3VNclFoakcybWNMaGQ5UWhZbFRzeEFscERD?=
 =?utf-8?B?TUFQZDFYSW5uc0pIVUVKbklzWUV2bzEwMENKNGYya3pDVHdMeHVldmxLSERN?=
 =?utf-8?B?NTNDNjFHZG52dng1WjVTMGFScmgwajNPRWRPZWdRZm5kMzNMYUhibWNvOHpx?=
 =?utf-8?B?MWZ0MnhSVFJaMlorajJROS9zNU1ublhRUmVlNSs4c0R5V25sUlV0aXcxSXVl?=
 =?utf-8?B?TGFBWUc5OEdOUm9uVzltekttdEcyeG54V3NBSW1FZGZTM2JuaTA0d0Z4dFBB?=
 =?utf-8?B?UzlmYmRKM2UrWFBFTTBSSFVvaWN4K1dxdUlMemxXNlFBVDBLdG5DejhrUXVs?=
 =?utf-8?B?Nkk5cGdkR2pKWUVtYTJOTkFQVW5wc3hRdnR3ZmE3TXFvaFNkRHM0OFFyTzJR?=
 =?utf-8?B?bXB5QVBDMFByYm5RWGhVUldCbVdZYTY5bzYzM0djSUk0VjNvN2pZTlJ3cVhj?=
 =?utf-8?B?RGFQVThpMU40OThjVXBBYWQ3aUZ1MnIrczRoanloTFovc2FIRFNDVzIzN3lz?=
 =?utf-8?B?T0lGcXUyVGJhV3ptaUlWWE1IZDRkV2Zld1NObUtJeE41dkFsb2FRUXNGOUtV?=
 =?utf-8?B?Yk03L1hHaktKYnErMjVDcnRGZThpam9UZHUzZWxubk9pMENtdWhwT0lEL3p6?=
 =?utf-8?B?TnpRRFh3VnpKd3dyeHdGY3FxZmtHNWpsNVpPdFlLVUIwSS84WkpkLy9wN3pC?=
 =?utf-8?B?YlBPZS92REdWZkNFMzNCRTFBbllmM0c1MGZwNEdPWGN0UTQxSzBpc1VHa05x?=
 =?utf-8?B?NnplYUZmSzlmVnZsRXlPTmNqVEc4NTRSY2tpWlJwQm1BNytUV0R4cU5VWEkw?=
 =?utf-8?B?MTJQMDBNQUp6SS8rZy9xSW5iNTlSTmVWOFZLRDcwMEkveDQ1d2ZuNHRhdzdG?=
 =?utf-8?B?OGFlYTR3VDZteEd1dlp2VzlhanZZajBjR3d4bHBWSmJPb0tIUGFpakMyVjVy?=
 =?utf-8?B?WUN1RGxVMG55alFkdUpxZHRUZ0NkZE5iTHg5VEVheUh5Tjh3MkUxMGdhRklu?=
 =?utf-8?B?TzVwT3MvcS93K0IvNFR0R2FGc3dGQUV6LzdEVXdlR0phdWpRejBrVDFZdVBW?=
 =?utf-8?B?OURIWWV0dnBSUmR6TFA5MnpSS05HMXl5QmQweG42OUlJSllxbVpFaWRic2xL?=
 =?utf-8?B?amk5ZnlYZDU3MGRqb1pzVVJxeFc3cmJWeHpYNWNtbjMvWG1yR01Vam45TjZq?=
 =?utf-8?B?Vy9zRHNYZDUrQ3YvbFhYTEVaQnE1VVJSd1VQUjNDL05rYkovdHpPRmlubUl2?=
 =?utf-8?B?VEE4ZmpnTlRRVGdXUkZEcFh2bXNDRitWaUc0MW10eXBIRVZEODYrZUdETkcr?=
 =?utf-8?B?aXFYb1AvZkFkbEtMd3R2VHUvNDMwVVJSMVFWZGpjUmpvY3hLbExUSFdwWW5r?=
 =?utf-8?B?OHFML2hvR2ZIRFFKSUlxanF2WE1wT2hUN3BabW9kNnNMemF2b1d4bnlYWXZn?=
 =?utf-8?B?azZwZFk0MFpwU2VuUUZ1R0xOaVZlOG0wQm1oMkJtZk8xa0prRW43N0Z5czdY?=
 =?utf-8?B?NjRRZTJDR2draW5VZTFVMTVLUmhWbkk3YjEvVmFKem1KUk5zeEN4cXVuZVFK?=
 =?utf-8?B?VWY5OUVDVmtzNEl2UTJVa1cvNW9FNWxOZytUc0ZYbUo5SGdkdTg2SlpXdEFx?=
 =?utf-8?B?TXArbWk4ZmtCYUJsd3k2VXYzWHhpVUg1SW80elhBeVlIeTdjOGVwSWVVWGhX?=
 =?utf-8?B?MUJwa3FVSkFELzNucDhUT3ptT1VlUG1VVTIxTFIrTFdoeE8zQm9ZSTMzQkMr?=
 =?utf-8?B?TkRhTG5Lb2UyN2hlRkpuKzFJcjJWM0pDWDduVVlCeERpUGwzeFkyWU42U0U5?=
 =?utf-8?B?Y1JRUVZGcUFSMEtSVmhaUWdsSWJUVXI2TkdzWkFJNkYzNlYrNjBucGRCNWRj?=
 =?utf-8?B?bnR2SXhVU2dXYnNvdDM2Yy9xUXcwZCtjc3M3NHI2a28zOEovVVdvTzJha0NY?=
 =?utf-8?B?OVJCL0VHWTZQMDV2WnZQMXEwT2JwWXRiZGQ0SzA5d1JkZHpEaE1rdDVYd2lj?=
 =?utf-8?Q?m7HfVwXhzixOeysv4Dmm26TJZohGUI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZW9QWGQwd2xYazZwNGVGWEljUEE3NTh0Tm9mdkd4OHhRcE9SaGNKdWIxZFN4?=
 =?utf-8?B?Q1dESkVYUHFoNlBPWXN6eHl6S0thOGppeU1PUnlYeEFvSUdPczdPb1JNZERD?=
 =?utf-8?B?NitTUk5TY0pEUzZnZmxDNnZuOW9FenZQTVBrWTRJUUJCMW9NZG1DUzZMSzQr?=
 =?utf-8?B?WlRqcEhmV2x0ZVhPVjdYWFdGTE82QkRQK0lBZFhEYlAzMFFkU2VHMWJ4VFJN?=
 =?utf-8?B?UWRiTlBjaHhEaGRmS3B6ZXFnUi9yQUExbDc1bFRNRGZFaFBmRlZJVThKOU5j?=
 =?utf-8?B?OTZUd0poekpOSElOcUJ2aXpGQkc4NjY0bSt1dHhuYjY3Vkx6US91STlBKzFS?=
 =?utf-8?B?dWkwYnpIS3RqTVNnNUxPWFVWK1V5ajBuamF3TFpPR0Y1bTV2Q2V3ZTZwQ1o1?=
 =?utf-8?B?cFRCd1gycVBrd3hKd0luUHJtV1dJenNVcWtOQ0NmR1E2WEFFbHJnczA4U3By?=
 =?utf-8?B?ci84QktMOS9QOFRiSGxLRU1FbjRxdUJvYklobkgrQldkNkxnSUVDcUNFQkVs?=
 =?utf-8?B?N2NIM3dTdTlTTkgrTEltN0d2blpTTU1jeVg0QlR1Ym5RaEdtR3M2aVZubWFa?=
 =?utf-8?B?T29jSDJ6L3p4WmhaTlA0Zmh5eFZncVIyWGF2WlN6ZGRjMzJ2K1djdkdYbWpI?=
 =?utf-8?B?YmN2aFo0NkZNUDFCREpMc2FlYnpIM2J0WjMzNmxsZmIydjlkNSt0L001dXkz?=
 =?utf-8?B?S1lISWp2aUs4am9VYVYzcTV1TitCWnB0a0NrNEhIK0tZUmdQNVF2enJiaEpn?=
 =?utf-8?B?ZHBvRFJtZjB6Mmc5Z0VqdEdvMVMzM2srNW5xOWZjK2x2TmV0cGlsWXhGSks2?=
 =?utf-8?B?Y09TTkxjdTFRTzRrRWZsWWd0SGJUOE81WHY2dFUvVVdxdXVGNjlCZDlYQWRQ?=
 =?utf-8?B?c3pBb1RLck9Pb2xNdW42MnRhaFhSWGxUVGRlYnpiUndpWGZTWWpuNkJSZUQv?=
 =?utf-8?B?bzNEVHFhRlVFc1lLdlpkZWt3cytFWEl4TTlwWWJKMk5udUtsTUE4MW9xRndY?=
 =?utf-8?B?UFR1YTlpSTFIVEFWRmRGMk4vcG9vemdQSlpwdkxxTUMxamtWaWhEU2w0N0Jh?=
 =?utf-8?B?VitvVmRKVGRiUTczT0NqNW5BNGJMU1dHdEIvOXFUT2wvblowNUFGNGl1NmJY?=
 =?utf-8?B?SVEyY0lrckNsRmZWOE12ZmEvdmFoTW42cDd3ZVRkMzRnWm44Rm56MzdPWlJm?=
 =?utf-8?B?TXNEWG9uWVNaQ2JWWktjZnlKNnd3Yis4RWpoOXRwbm0wZzVqVTQ4NGZCR1hV?=
 =?utf-8?B?bGR2djlvK243WWxWeXhRWWRUWVd5WGlNYlZhSll5Y0JBcUIyR2RpdWlNazB3?=
 =?utf-8?B?R0xsOERTSFJlbTlTdWZDdHpTbmU5M1orVEpXWGd1S3JGeXRSblZzbldkc08x?=
 =?utf-8?B?UitzUjNvdEIxTFQ5ZjdmN3RpR3dFbGZxdklIak9JMHl3L1pkWWdXSFBlSFE2?=
 =?utf-8?B?K0d5ajlEK3ZJekF6YzJ1WElPT1RiMUY0MzZGb09CazhIZHJvK1Q5RWZCSkFw?=
 =?utf-8?B?SnJ3azNYeU42MitxNFM0NFhOdXhiZzdaQ0FsRjZPUjh2WGZ3cDJyNkJselVH?=
 =?utf-8?B?U0RmQ3F6VXU5MU8rUndrVU1kZXNvMzNmYmc0aEU1NWxXU0hSci9BTVZYcGY1?=
 =?utf-8?B?dzdVM3E1Qk1VdEdaY1J1Tlp0Q0JacTZocW5vbERUbGdJdmRVUWt5TmhTME9N?=
 =?utf-8?B?RE1NaTJBZS9LR1B3eFF2UDhIVEwvRngwek9sUEI1UC9LMGcrTmFPR1oyZTBy?=
 =?utf-8?B?Ty8wek5jeWtMeHJnSG1BU3VmZ0hwRFVNQk92ZHdXeEU2WTFOUGFKa21GM3F2?=
 =?utf-8?B?dmdSL0YySW54MXdUUjhkcVdoRVNGTXNjQ3IyQm9jbmxxbDY2Y2ZDZHV2NGhC?=
 =?utf-8?B?Ni9WbEVTSk1FMzZLZ1IwUy9hbSt4SVNaN0hsUTJhN1V5bDFZNTR4TUtEdGd1?=
 =?utf-8?B?UmhWdVVvTm1DMWZuTGhwbHhDbVBQeHc4ZnVFTnZUNUwxRWU5Ty9XT2lhbUg2?=
 =?utf-8?B?YXV2LzVpYjhJUWh2UTR6UlRXZjM5RThFQ1ZaK1hobTBZdUhkNXo0NFBmdGM1?=
 =?utf-8?B?U2VNaGk4VlJub0J1bjB4Y0J0Z00vR3kwUmJaemtEWlBCbkVyQzdVUkFZWUlq?=
 =?utf-8?Q?8+2s+GhGwKMASbViRj5OdfjG5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98EA96C262EE8A41A3B095E2E87EA101@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd107e8-8292-44f3-4dbd-08dda4a56baf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 02:54:13.9632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCdcojjkrDulyNRwazkoFW3Jnh6733pLnsOhARSXhCjFjH7sM6aE839efFg8BczLVCOAZy6l6SOxFXqghsa5Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7314

T24gRnJpLCAyMDI1LTA1LTMwIGF0IDEzOjM4IC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IEhpLA0KPiANCj4gTGUgdmVuZHJlZGkgMzAgbWFpIDIwMjUgw6Ag
MTU6NDUgKzA4MDAsIEt5cmllIFd1IGEgw6ljcml0IDoNCj4gPiAxLiBjaGFuZ2UgZHN0IGJ1ZmZl
ciBzaXplIHRvIHNhbWUgYXMgc3RydWN0IG10a19qcGVnX3NyY19idWYNCj4gPiB0byBtYWtlIHN1
cmUgYWxsIHBhcmFtcyBvZiBtdGtfanBlZ19zcmNfYnVmIGNvdWxkIGdldCBhIG1lbW9yeS4NCj4g
PiAyLiBGb3IgbWVtb3J5IGFsbG9jIG9wZXJhdGlvbjoNCj4gPiB0aGUgdjRsMiBmcmFtZXdvcmsg
bWFsbG9jIGEgbWVtb3J5LCB0aGUgYmFzZSBhZGRyIGlzIHZiMl9idWZmZXIgYW5kDQo+ID4gdGhl
IHNpemUgaXMgc2l6ZW9mKHN0cnVjdCBtdGtfanBlZ19zcmNfYnVmKSwgbXRrX2pwZWdfc3JjX2J1
ZiBjb3VsZA0KPiA+IGdldA0KPiA+IGl0c2VsZiBhZGRyIGJ5IGNvbnRhaW5lcl9vZiBsaWtlIHRo
YXQ6DQo+ID4gdmIyX2J1ZmZlciAtPiB2YjJfdjRsMl9idWZmZXIgLT4gbXRrX2pwZWdfc3JjX2J1
Zi4NCj4gPiB2YjJfdjRsMl9idWZmZXIgbXVzdCBrZWVwIG9uIHRoZSB0b3Agb2YgbXRrX2pwZWdf
c3JjX2J1Zi4NCj4gDQo+IFRoZSBzdWJqZWN0IGltcGx5IGEgcmVmYWN0b3JpbmcsIGJ1dCB0aGUg
bW9zdCBpbXBvcnRhbnQgY2hhbmdlIGluDQo+IHlvdXINCj4gcGF0Y2ggaXMgdG8gZml4IHRoZSB3
cm9uZyBidWYgc3RydXQgc2l6ZS4gQ2FuIHlvdSByZXdvcmsgdGhlIHN1YmplY3QNCj4gYW5kIG1l
c3NhZ2UgdG8gc3RhdGUgd2hhdCB5b3UgYXJlIGZpeGluZyBwbGVhc2UuDQo+IA0KPiBBZGQgYSBG
aXhlcyB0YWcsIGFuZCBtb3ZlZCBpdCBhdCB0aGUgc3RhcnQgb2YgdGhlIHNlcmllcyB0byBzaG93
IHRoaXMNCj4gaXNuJ3QgYSBwcm9ibGVtIHlvdSBoYXZlIGludHJvZHVjZWQgaW4gcHJldmlvdXMg
cGF0Y2guDQoNCkRlYXIgTmljb2xhcywNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24gYW5k
IEkgd2lsbCBjaGFuZ2UgdGhlIHRhZyBmcm9tICJyZWZhY3RvcmluZyINCnRvICJmaXhlcyIgYW5k
IGFkZCB0aGUgdGFnLg0KDQpUaGFua3MuDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEt5
cmllIFd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMgfCAyICstDQo+ID4gIGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmggfCAyICst
DQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pw
ZWcvbXRrX2pwZWdfY29yZS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L2pwZWcvbXRrX2pwZWdfY29yZS5jDQo+ID4gaW5kZXggNTJkNTliYjVjOWFkLi43ZTM1MDliZTZm
NjkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVn
L210a19qcGVnX2NvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiBAQCAtMTEwMyw3ICsxMTAzLDcgQEAgc3RhdGlj
IGludCBtdGtfanBlZ19xdWV1ZV9pbml0KHZvaWQgKnByaXYsDQo+ID4gc3RydWN0IHZiMl9xdWV1
ZSAqc3JjX3ZxLA0KPiA+ICAgICAgIGRzdF92cS0+dHlwZSA9IFY0TDJfQlVGX1RZUEVfVklERU9f
Q0FQVFVSRV9NUExBTkU7DQo+ID4gICAgICAgZHN0X3ZxLT5pb19tb2RlcyA9IFZCMl9ETUFCVUYg
fCBWQjJfTU1BUDsNCj4gPiAgICAgICBkc3RfdnEtPmRydl9wcml2ID0gY3R4Ow0KPiA+IC0gICAg
IGRzdF92cS0+YnVmX3N0cnVjdF9zaXplID0gc2l6ZW9mKHN0cnVjdCB2NGwyX20ybV9idWZmZXIp
Ow0KPiA+ICsgICAgIGRzdF92cS0+YnVmX3N0cnVjdF9zaXplID0gc2l6ZW9mKHN0cnVjdCBtdGtf
anBlZ19zcmNfYnVmKTsNCj4gPiAgICAgICBkc3RfdnEtPm9wcyA9IGpwZWctPnZhcmlhbnQtPnFv
cHM7DQo+ID4gICAgICAgZHN0X3ZxLT5tZW1fb3BzID0gJnZiMl9kbWFfY29udGlnX21lbW9wczsN
Cj4gPiAgICAgICBkc3RfdnEtPnRpbWVzdGFtcF9mbGFncyA9IFY0TDJfQlVGX0ZMQUdfVElNRVNU
QU1QX0NPUFk7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvanBlZy9tdGtfanBlZ19jb3JlLmgNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmgNCj4gPiBpbmRleCA2NTVkYzljMzI4MGMuLjE4NmNk
MTg2MjAyOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L2pwZWcvbXRrX2pwZWdfY29yZS5oDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
ZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuaA0KPiA+IEBAIC05NiwxMCArOTYsMTAgQEAgc3Ry
dWN0IG10a19qcGVnX3ZhcmlhbnQgew0KPiA+ICB9Ow0KPiA+IA0KPiA+ICBzdHJ1Y3QgbXRrX2pw
ZWdfc3JjX2J1ZiB7DQo+ID4gLSAgICAgdTMyIGZyYW1lX251bTsNCj4gPiAgICAgICBzdHJ1Y3Qg
dmIyX3Y0bDJfYnVmZmVyIGI7DQo+ID4gICAgICAgc3RydWN0IGxpc3RfaGVhZCBsaXN0Ow0KPiA+
ICAgICAgIHUzMiBic19zaXplOw0KPiA+ICsgICAgIHUzMiBmcmFtZV9udW07DQo+IA0KPiBUaGlz
ICJyZWZhY3RvcmluZyIgc2hvdWxkIGJlIHNwbGl0LCBpdCBkb2VzIG5vdCBmaXggYW55dGhpbmcu
DQoNClRoYW5rcy4gSSB3aWxsIGNoYW5nZSBpdCBpbiB0aGUgY29taW5nIHZlcnNpb24gNi4NCj4g
DQo+IE5pY29sYXMNCg0KUmVnYXJkcywNCkt5cmllLg0KPiANCj4gPiAgICAgICBzdHJ1Y3QgbXRr
X2pwZWdfZGVjX3BhcmFtIGRlY19wYXJhbTsNCj4gPiANCj4gPiAgICAgICBzdHJ1Y3QgbXRrX2pw
ZWdfY3R4ICpjdXJyX2N0eDsNCg==

