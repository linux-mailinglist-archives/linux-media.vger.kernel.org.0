Return-Path: <linux-media+bounces-30082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A120A87177
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 11:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E5D0189A25B
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 09:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1316719F130;
	Sun, 13 Apr 2025 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VHXQmiyH";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="D/SUseuA"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FA8188CB1;
	Sun, 13 Apr 2025 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744538203; cv=fail; b=ri0HcHtbG/hO6qDDlMJqfrp42GSL8SrfPxlwlpdIdmsS3F/HOIsV2hN4hhyiBX6k0+pdmLQpRwgnLE7QpyMfN+YYYUGGSVn72XjHKxLdzUMS+SXpdAGZgkP4uBKfasMJO8+90KDwTyVbJrE+RUBBcO1sRRQiWJ6LdaDz79xz+98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744538203; c=relaxed/simple;
	bh=H0XpjmhBA8D93VEK8gScwtbK+HASV11EOcaYVYuU3ls=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uYTcx5VQgvEyN2yFKgWUwbHp6YJhoBrp9ozbiATHmcLSFMFcuezrkYNOYqWR/HNM4fe4PexWCMD8itQQE9gEzxn8ZBU/7Cxr4BsaBplUlZHd+Oh9epwsW1aEM+dtM9SuCnuBnYf1tYL+0OYi1FVXlACj8cC6oautvUaD8fBIe4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VHXQmiyH; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=D/SUseuA; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 918fc882184d11f08eb9c36241bbb6fb-20250413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=H0XpjmhBA8D93VEK8gScwtbK+HASV11EOcaYVYuU3ls=;
	b=VHXQmiyHG6EacxA236W2q3CAEi4iIOImkG0eUV58k5JZxz1uN0PWwNtFv3dP5/1rsUx+IpOvmczO8e2jblydD8GVDbJgY7GDnrdktukq5+zc5oXFLGcfgupz/Baz5QuKbLvh1lXT5l41Sbac52q2A8JCGGT5H59U45IK/bdRq/o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:42cdc757-df2f-494c-8ac8-1329407042ab,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:55cf2e8b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 918fc882184d11f08eb9c36241bbb6fb-20250413
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 483815565; Sun, 13 Apr 2025 17:56:28 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 13 Apr 2025 17:56:27 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 13 Apr 2025 17:56:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tkb3gs9nEZaAHY8A6SIdM97dKqCGxoD1pNDF3PExsQCAKtH/AGIIeWqIBtE4sEc4vFq0jXouMhixqpURPrih5EH+2f++1n++YNkdbyoHQ8FAsRJns8MDbxhnHBk3c61okHgK7QFBC9ieXsgKAC24dztIz+xRnxfhyQS14m9wEm41hGcCSV7Fk38dMWgiK93GF/KzOmCPbFMtOkbeB1EXzyNTGuakkCaUGyxXOeS637Xs63IpZN9iWkFAGc5NiIhYKIiU1OlIxBSJ5tu2JpHCmoAUDcVhDMgjkULpOGNOCf0CuM3BApWkRvDfNjkFABzaprpZlyiOYvS4561woUqxfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0XpjmhBA8D93VEK8gScwtbK+HASV11EOcaYVYuU3ls=;
 b=oHMvkLPlEi2/RO7q4iaQ6x8gkwP91sS1r+ezAvnJRFn4n45t0fOA/jNoXll23qK/Q+qHS6we60EN+jMfOMkUIe21suHXfTkyktfv3CZ4pkbpNUShxWK/kJwtogtg0d3jsCHPSXD+aWKjbczmj1igFWM9O+F7xH1AZGsAmu5uhf50WGHcz63WOArVi6T4DZPb6nAaoDAxoTyfMS0R7TbTN4LnpuEnAh29wBImAUzBB1uAqIwAWT5o2OlvaloAKNhWPoMgS12vrwFH+ndECpg6UT5/SnPuqu3b3jKDE977NZeV9sS7PKTXpmLkimrCdogpbh/XqDapMhBLup4+gM60Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0XpjmhBA8D93VEK8gScwtbK+HASV11EOcaYVYuU3ls=;
 b=D/SUseuAGgfEPB9V+TO6zXe1z9yZ8K5fJ33QtVyx8DaDN0r7I5A4XfG2vZHtWK5K9BmV2lfF9UANFWH2EUjie5AX/YafhBgcbHrF9Ig+9jEMVJVlrWKZQu7076e3eEowRO4hS/sgP+6z3Kuy/Fnlw35XQLh1P1l/yHGFMJLU8Ek=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEZPR03MB8408.apcprd03.prod.outlook.com (2603:1096:101:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Sun, 13 Apr
 2025 09:56:21 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8632.030; Sun, 13 Apr 2025
 09:56:21 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgenc compatible
Thread-Topic: [PATCH v2 02/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgenc compatible
Thread-Index: AQHbqeIP+01Xdz/BbkS2VaGyOTV29LOccyAAgAFRYgCAAg7vAIABjWcA
Date: Sun, 13 Apr 2025 09:56:21 +0000
Message-ID: <b1e2d695898b6ee170985e1d28705097b58c2c72.camel@mediatek.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
	 <20250410063006.5313-3-kyrie.wu@mediatek.com>
	 <20250410-new-zippy-elephant-54bbcb@shite>
	 <82eec9802028d0e44530b4c7ddcaa5362f2434b9.camel@mediatek.com>
	 <48a63395-e9d1-4825-bc3a-7a043ce006bc@kernel.org>
In-Reply-To: <48a63395-e9d1-4825-bc3a-7a043ce006bc@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEZPR03MB8408:EE_
x-ms-office365-filtering-correlation-id: b1eabdb5-4293-412c-cef2-08dd7a7171ae
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SGJVdmNZZU1NeUh1UXFyZGZtTHpUR09ZeXZoYmVNMkJiZmxVNEFreUhjak5l?=
 =?utf-8?B?ZDE4WG9CUEdLWTBKK2V3R2g0WmNMclNIZFo1aDZodDgveWk1NC9OeUszdWtj?=
 =?utf-8?B?QVM4QWVLUVVZZ0VvVExGTitoUHZqaGp5Q1JaWHZ1c0JubGZiK0JnUFR6clNz?=
 =?utf-8?B?UFhyTzgyT2o5OTFOSThTUy9jemtDV25IUGsvUUE3aUVXZkpMSXdIKytYSjV4?=
 =?utf-8?B?Q0w0MnMvMWJFa1ByUDN2Z3NtczNrdzJoamNmWWtCYTM1S09CTjBXeXNpU1pC?=
 =?utf-8?B?SnBxTEpRRzQzdjdlUGVLQllmV3dTUDhnWVBIbUNVU0hPRFRaWUI3K2JVZWZr?=
 =?utf-8?B?RXY5My93ek9EL0NJNW9MaUlzdFZqRkpPSUQyL2RDWWgycnhQL1NsS0crcTNS?=
 =?utf-8?B?cldobXVMMkJlcnhRYVpmZUlkQzVoQW9VRnZJalNJWGh0YWNLbnE2eTVKbERh?=
 =?utf-8?B?M1FGUDF1MmxVZzVScjFiMzA2WnZSRVh0QWFYdGRjN0Rob056Q3VBQlBjVFNn?=
 =?utf-8?B?RFp0MThBRkRKSjlYNG00dnZoSWhRZTJPR05ZbHN1dW5HMWlQUlEwNm5pVUVG?=
 =?utf-8?B?bUxlTU1vdmtJTU9IcEVQMTc3V21Sc3NJZ2FrSGcybTBKQjVaTmpXbXN2UGwz?=
 =?utf-8?B?d0pFRXZpMmdadUJma0JCVDlaUkJwVmJHNlVoSTdjL2VnL0E0cHh2TnJsalRQ?=
 =?utf-8?B?R1FWeVBrcE5qTkg0MWtVNjNIbFVxTDBmUW1sYitYREt2Y1FhUmVzbXYwdzJL?=
 =?utf-8?B?bzVqZWZwTHkzWDV1dTBZdmlFTDFNdGwwN0wxbFZPL0pRVGd5Sk1rK1poQXll?=
 =?utf-8?B?Z2U1YWFKeG1xa1JNbC9zZ2tNS2JYajZseUZMT0tJUm9pamZCRkYzVi81bGIw?=
 =?utf-8?B?M05jeUtvNzYyNVZRYUoxZnBsTld0Vjc3cnE2bkZhemoyQk9UK29aOStFU1Yw?=
 =?utf-8?B?aTl0cTg4V01DeERaM3FmRktXSnJadXFKaCtSRFF0aUNIeS9yVURDdFdDVEJT?=
 =?utf-8?B?bGY4a2c1ZnVGdW5OWW5EcXZFc2NQamZVN1N6K28xbm1wRXR2c2pYYmFKUGVX?=
 =?utf-8?B?aFkwVjdYSFdXcnVWV3JvWVQ5QllrYmtBdlVYODFxZytxRWhDWDBjY0lTU0RU?=
 =?utf-8?B?UG95NkgrYXlLZm5wSmIzQzZtTGNWK2JQOVZ6VFp5MzlDUlMxdERha29ZOEo1?=
 =?utf-8?B?cUc2OGV1cjZLMVRQSjlPSFd5aU16bTNLbmUrK2FwUUE0QXdHb24xQjRsVEd5?=
 =?utf-8?B?V2RFTFdwYmwzZzZRN1pDSGMvVkhJVzJ1RldXY1JTRkhCMDZFK3FsV09oRExU?=
 =?utf-8?B?eG9NVW1LUy9sKyt3SFE0TW9HK3ZDRlQ3c3VCZkVkU0p5YTBoWWhUcGVPeUF4?=
 =?utf-8?B?RWttckVJMXZYR3JPNG9YbjIxYmlVN0FpU2tXM1Evc0VtS2VtbFlOTFFLcnRa?=
 =?utf-8?B?VDlVSzY4UnJ6QzB4QXh6RHhrU1RTRmgxSGx0K0Z0T09oeXcyeld6VTlZUllX?=
 =?utf-8?B?cjF3cTQzUUdmZFpUQ00xa1Q5YWs2Nm9TRTlLY3A3V0d4RUhlUEU0UkhtNXpW?=
 =?utf-8?B?QUlnZnFQaVc0R01FTnJpUTJveGdPN2toKy9mdjJXaUtaK0pUWngzUjUzMlpr?=
 =?utf-8?B?c1lhQzJKNlp4L0VmeVRSOWN1S3VubjZvSE16UFRmYXF5TWtmbzFXR0krVTJX?=
 =?utf-8?B?T1dJS1JXYXMxVXJveHVYbE9YMVRTRlYyVFhNcGNlU0diaC9WTEw4TWVUV3Zk?=
 =?utf-8?B?TThOL1FxVHZXNkZwSHBNYmxsRk9HN0o0cHU5QTA0VitYM0dVa01hMW0yLzg5?=
 =?utf-8?B?c2lYTkpld2QzYzdrNzNvZ3A0bEdEY2ZOZVBaeElBK0NCZUZzQ1UyRVk4a2lu?=
 =?utf-8?B?Y0kwTUFqL2Q5bzI2Y0lvbFE5L3NsM2s1QzIxQWhyRS9iU1FiSGJXUTVkUmJr?=
 =?utf-8?Q?1hWL+27U+Vs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkVMaVQralFaMk05YzkrOENYbGh5Q1lDeGRVRTZyRE9VZ09udk5ZUXVJbmwy?=
 =?utf-8?B?UjR2Um54Q2hVK3ljQk1hWEhwcktXVFRhL0VTcnRxZDAvNVh0bCt2UzdxblQ5?=
 =?utf-8?B?eEdiSDJvOFlING5lWXdrMXl2Wmw5OHpRNW8wdUdsQ052djVzMnY1WDFXTXQ0?=
 =?utf-8?B?SGZjMG85Z1hKWUpPTlUrVGNjSGl1KzNWREtXNDVtT3hKOTFraDJGTHNkL05G?=
 =?utf-8?B?eE5Xd1BjbUN4N1k2ZnJ0RGhpaCtkeEx5UWFEeGR3bituYXZxcVRNWGdhb3dH?=
 =?utf-8?B?V1YzaDROKzIyMDJ5dU90M2U3L0piR0JMZ1VaQlpqaFlRL1dzWE5HVnRvak8x?=
 =?utf-8?B?N29rRE9UeEw0S2xhMlRzWE84WUpZUURzVW1qNnh2emZFU0lOcTRLbm40RVlK?=
 =?utf-8?B?dE04UUIyNEJYaTNlR0FnNHA2bFRJZnFHeEZ4a1FMQkQ4aEVGVEFpM2diV0xW?=
 =?utf-8?B?Nm1jb3JtMlBXd1RocGJjTC9kZitTNVdNSHA1RnE0Q1p6NnpGbTV3T1p1NGhK?=
 =?utf-8?B?L2NJUkRYSzVxL1hzM2xrbW1VQkZGcDQrMnMyTmZrOUl1MjVTNnBTYm9DQ0dj?=
 =?utf-8?B?eitFSmdmNjJGZzFJUmVxN0NsN1Q5S2NrSUZqemQrUU9mWEE1SFJXRzhtN3pO?=
 =?utf-8?B?cFlQWjU1RUozYjNJL0xMQ2h4b0FQUDNpay9wWHBGQzMyTkl4TlV2TnJpcVNK?=
 =?utf-8?B?akNqejRjTXRNaXdyZ2h6aXhHVXhrNUlEYzNLandhUHVRZHg4ZzdGNjlZOFFH?=
 =?utf-8?B?a0tsTHhKLzNZM3p0SVFCSVlKWXBNWUx3NUc0MDczNTEzWnNDcE1rbVpRMlpn?=
 =?utf-8?B?MUdRc0pXc0p0ODBqQ280SFJheEthUjQ1Z0FqWnFVcWlKTGdIQzR2WitkWWFF?=
 =?utf-8?B?bFh1ai9rNTNPNTEvcXpyeFRsVVBwMDRhaW50eGJubnBmTnI4WjcvM3NQVlNC?=
 =?utf-8?B?a2IybW8wbzZ1a0hrTmIrSjJTcTk5c2RHWFQrdFBLb2NTbERrVTRIelN1QVU3?=
 =?utf-8?B?UkE0U29xYTZVMlBHRVQrK09iVm9pREhoZGxaMmJ2MVJrdzRBbnhQWStKZ21s?=
 =?utf-8?B?NGxIc1JHblZRVXFzV1ZkUld1cVI2cFpIMW54WEQ4NGtPUFRQUjNtR2JDUDdr?=
 =?utf-8?B?V3BPNlVjR2NSc2hMUm5kNGdpVWpUZmVCMDk2VGFzT3k3cTY3TWo3M0FmcEJa?=
 =?utf-8?B?SWQzV3J0NnkyWmxFVG5mald0dEtOdTBONEFXbHFXMWplUHFJNVViVno3SVdZ?=
 =?utf-8?B?THBxdUdmSnlCNzFKODFYZWNMbjVrQnBWbk4yanUyeENOWExuSzJMR3ZGSXBN?=
 =?utf-8?B?NzRuK1M1enpXdEIyUXhDdGtnZXBtZ0F4bFV1SE9kbXg5eWZhTGdRUXNXWGtt?=
 =?utf-8?B?NWhnckdDOEVNcnJFWHJKTWJmVkR1c2djcHhWcnZoenNDc2pHTlJEak0yUFdB?=
 =?utf-8?B?VFMyRmlDUkhTUmtkZlBiRkZMYmREYlVPYUZ4N1o1ZFY1NWlaOGtrQU0wK0hj?=
 =?utf-8?B?TVd1UkRPWmxNWFBGVFhKY0I2T0NvYURYOU94Y1g3WEY5WWpHWFVUMTJ2NzVN?=
 =?utf-8?B?cFp2WE9xNUtleDFTYy9XZ3BmdGlDaFBGaW1zUkZvaUhGOUNSRnBod0EzbUhC?=
 =?utf-8?B?RUd3VkNDcVd5MGpBNHdhRTBkYVBlYXB1bjdnZGlUcFZSYUV0bEJ1RlZwOUFB?=
 =?utf-8?B?YUpDUFhSa2U5eWdnQXE2SXYzRnJKaS9FV01vYk0reFRaM3NpSFE5T2tScCs2?=
 =?utf-8?B?TnFkR0kwVGZhYUNVdFREWDA1NXliYkhEUjdPYnJGTmhQd0NNZHczQklWa1BC?=
 =?utf-8?B?VU5TNENvdS9pM1c3T0g5bHpwajdtOUUrNDBEWVlvczJ0d0V2bDRScXRmZmJm?=
 =?utf-8?B?bExZcmI2QU9rdE5lMGxRZ0xESC9JeVJVaEEyRTdEaUZPekFpOVBSQXJyWWJu?=
 =?utf-8?B?YkZGNXJlTzhyQld6cW41SGxQV0x5SnhSN2pvbVEySndzQTdXaTFlSW1EWmky?=
 =?utf-8?B?UURrOERqYi9KNUZPQTRIUXZtaEJsNHd2N1dvdWJLb2drZGJFdyt5Q2VqRWdu?=
 =?utf-8?B?K0tPZ3Y2cW1VczJNdmtkT25weVVtNXorbmZpVmQ3YXNIamhSL3hJTE9nVVI4?=
 =?utf-8?Q?R0QXMwBsazPzy2CCeY7h8MqXt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C49495EBAD35B4CBE624370DD72B11F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1eabdb5-4293-412c-cef2-08dd7a7171ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2025 09:56:21.3383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P9KgA1BV/CzSOr4M5HqPKm/P9R/43XP3LIQjtbFBlcSHjc7yAXaakIiY6CHnUGTt1g6A+qsnhUzeuwzFOxxrxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8408

T24gU2F0LCAyMDI1LTA0LTEyIGF0IDEyOjEzICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDExLzA0LzIwMjUgMDQ6NDgsIEt5cmllIFd1ICjlkLTm
mZcpIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyNS0wNC0xMCBhdCAwODo0MCArMDIwMCwgS3J6eXN6
dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4geW91
IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBPbiBUaHUsIEFwciAxMCwgMjAyNSBhdCAwMjoyOTo1NVBNIEdNVCwga3lyaWUud3Ug
d3JvdGU6DQo+ID4gPiA+IEFkZCBtZWRpYXRlayxtdDgxOTYtanBnZW5jIGNvbXBhdGlibGUgdG8g
YmluZGluZyBkb2N1bWVudC4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IGt5cmll
Lnd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gPiANCj4gPiA+IFNhbWUgY29tbWVudHMu
DQo+ID4gPiANCj4gPiA+IEFsc286IG1pc3NpbmcgbWVkaWEgcHJlZml4IGluIHN1YmplY3QuDQo+
ID4gPiANCj4gPiA+IFBsZWFzZSB1c2Ugc3ViamVjdCBwcmVmaXhlcyBtYXRjaGluZyB0aGUgc3Vi
c3lzdGVtLiBZb3UgY2FuIGdldA0KPiA+ID4gdGhlbQ0KPiA+ID4gZm9yDQo+ID4gPiBleGFtcGxl
IHdpdGggJ2dpdCBsb2cgLS1vbmVsaW5lIC0tIERJUkVDVE9SWV9PUl9GSUxFJyBvbiB0aGUNCj4g
PiA+IGRpcmVjdG9yeQ0KPiA+ID4geW91ciBwYXRjaCBpcyB0b3VjaGluZy4gRm9yIGJpbmRpbmdz
LCB0aGUgcHJlZmVycmVkIHN1YmplY3RzIGFyZQ0KPiA+ID4gZXhwbGFpbmVkIGhlcmU6DQo+ID4g
PiANCj4gPiANCj4gPiANCmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3d3dy5r
ZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmct
cGF0Y2hlcy5odG1sKmktZm9yLXBhdGNoLXN1Ym1pdHRlcnNfXztJdyEhQ1RSTktBOXdNZzBBUmJ3
IWxZbkdMY09CUUloOXlRVXlNY3RlS3h2Y0tRdjJfZVNjNHVkeGtERFdYaWtUeU44VmNYeVlEZ0d1
Sy04VVpXeEtFNVBtZzNENWx2cGxjdyQNCj4gPiA+IA0KPiA+ID4gQmVzdCByZWdhcmRzLA0KPiA+
ID4gS3J6eXN6dG9mDQo+ID4gPiANCj4gPiANCj4gPiBEZWFyIEtyenlzenRvZiwNCj4gPiANCj4g
PiBUaGFua3MgZm9yIHlvdXIgY29tbWVudC4gSSB3aWxsIGNoYW5nZSBzdWJqZWN0IGluIHRoZSBu
ZXh0IHZlcnNpb24NCj4gPiBsaWtlIGZvbGxvd2luZzoNCj4gPiANCj4gPiBkdC1iaW5kaW5nczog
bWVkaWE6IG1lZGlhdGVrLGpwZWc6IHh4eA0KPiANCj4gRGlkIHlvdSBldmVuIHJlYWQgdGhlIGxp
bmsgSSBwcm92aWRlZD8gSG93IGNhbiBJIGJlIG1vcmUgc3BlY2lmaWM/DQo+IA0KPiBCZXN0IHJl
Z2FyZHMsDQo+IEtyenlzenRvZg0KDQpEZWFyIEtyenlzenRvZiwNCkknbSB0ZXJyaWFibHkgdG8g
Ym90aGVyIHlvdSBhZ2Fpbi4NCkkgdXNlZCB0aGUgY21kIG9mICdnaXQgbG9nIC0tb25lbGluZSAt
LQ0KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhLycsIHRoZSBiZWxvdyBz
dHJpbmcgd2VyZSBnb3Q6DQouLi4NCmR0LWJpbmRpbmdzOiBtZWRpYTogbWVkaWF0ZWssanBlZzog
UmVsYXggSU9NTVUgbWF4IGl0ZW0gY291bnQNCi4uLg0KQnV0IHRoZXNlIGNvbnRlbnRzIGFyZSBz
aG93biBmcm9tIHRoZSBsaW5rIHlvdSBzdXBwbGllZDoNCkZldyBzdWJzeXN0ZW1zLCBsaWtlIEFT
b0MsIG1lZGlhLCByZWd1bGF0b3JzIGFuZCBTUEksIGV4cGVjdCByZXZlcnNlDQpvcmRlciBvZiB0
aGUgcHJlZml4ZXM6DQoiPGJpbmRpbmcgZGlyPjogZHQtYmluZGluZ3M6IC4uLiINClRoZSB0d28g
cmVzdWx0cyBhcmUgZGlmZmVyZW50LiBXaGljaCBkbyBJIG5lZWQgdG8gdGFrZSB0byBmaXggbXkg
cGF0Y2gNCmluIHRoZSBuZXh0IHZlcnNpb24/DQoNClRoYW5rcy4NCg0KUmVnYXJkcywNCkt5cmll
Lg0K

