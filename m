Return-Path: <linux-media+bounces-34178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B086ACFB64
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 04:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E15991899504
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 02:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2D61DE4C4;
	Fri,  6 Jun 2025 02:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JwwGjwcs";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="T9fayERM"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725051A83F5;
	Fri,  6 Jun 2025 02:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749178235; cv=fail; b=l/8SuvL7T7i8hBpsboB3hEQBK5eQwXezpjvgpJATRZC0vEMM17QJNoWyqZZn0Wa8+q8dC8SPNeRCtEjJTV7Vr9Tts8GilLzBnjgXTTrhmHBv8XY1ozBhNmEzR37GqFbNUI4K9ucssL73JmDV8IipoIa5Pm8DCe47TNTVbGBMs0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749178235; c=relaxed/simple;
	bh=j3M5cAkBax64T12jINKTtIVXwoS1BOhv/G55oStrVJE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dDwgvH1N1E+O7OYtqWBlqppne9sugZ33B7GYaGYCY3kDmnmakNXP1fOnxupJ5OKYSYF+w1DD7v3uviYhI8R1jsyEe9dEJIrO2BqH7DbTN4tGCsa1sGTTrdYQYxDFT9vKD0AiZnW2DsMbVlCQHqvFDtkF7n1neqgxUeQSbP2C/Js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JwwGjwcs; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=T9fayERM; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0084292e428111f0b33aeb1e7f16c2b6-20250606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=j3M5cAkBax64T12jINKTtIVXwoS1BOhv/G55oStrVJE=;
	b=JwwGjwcsyx9fNM1Ri9/6tbddnucMjEd6faJHMyvDZxJTZBdjVofBwVo0GChlBl89IH5jCpZE9rk0i/Mf9vprnaUMHQPHrWvrFHSH7rcFzsR7PafWHjPlC87KzSH0tuESXMZIg29R8fjIGbNdjwjG860LG/M1FPOpCxNQQantSIs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:8a15ff0b-665b-4fc1-96d1-fc6384169b98,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:26e76158-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0084292e428111f0b33aeb1e7f16c2b6-20250606
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 101378369; Fri, 06 Jun 2025 10:50:27 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 6 Jun 2025 10:50:25 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 6 Jun 2025 10:50:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsJbhEczIw3qfIe6G2dytWUSP2eCtD1hdHjTyeLbb+97fNsGPZf3TCFcrwCDXp3tNjbqN+QEIZIsgKQa0YSwN/vuhpTxlPBtnRcLie0pbwVt/TEQqvTRpNNSqGOETATMOCb/+D3UzAi3sahvJ/ZN/xJdaOOUOkOgsbg7x5uhAYwxgK6odIx8wv0/MzAuWNPfWUBRBjxBhqHf3SgCEt/CsN1+rQimKUBlGAeR1XxLKEZrSpTDfsdTs3G0vVqc9+xtl1JMKy4tUu98EVxNbYKviSiB+FehlUADEeD3vzHcpH9MJSwq+Y9+gR6AGKMSOZLlPgUhyZCiDnKiVIzG9kYCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3M5cAkBax64T12jINKTtIVXwoS1BOhv/G55oStrVJE=;
 b=dZ8BHlmSmSwstIHHfJEAA4R4Q6Lhovp0I2x2ZNVJ5F2iKlD4KM9tCeDjBVME/LIw+MAdzkBXDRk68KVxzKNeTYoPoeQmsYksVnQhnUenBFw3sM+OlEA2qWzN8BVX8vdnIJfW2U1V3Mk8afPdEvTNgfy/OVRADNh0yuIcrpz4ykARcSbWKQpok3MlK0dKsi5q6egUKsmSe2eaoR/vabVBtyI01NskycRStK5kf1c80FUi22Q+mU8kSXvwjunQE0MQeKhndLjZBxoDp1hzMqoqKF2AXF/J03/NTkw8+kYIoNZWA+GATy8i7CTJbcqxrXOM8q2U4e6Un9GcWJjIueZ5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3M5cAkBax64T12jINKTtIVXwoS1BOhv/G55oStrVJE=;
 b=T9fayERMbNcw4buCQti9NcEJRmPbQVsNad1aykKEPY64XDYhyyrFVFL1mtOB59g3ovimxtenUlPkrodBK6IS5O1kCqx7CtDTWsGYVkjYUZVClNWfflShKFPhfyy2pjg6hxfmMpaiX5ywOcYBMUhk3pANPLMqetzvmgU6reDdino=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by JH0PR03MB7935.apcprd03.prod.outlook.com (2603:1096:990:34::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 6 Jun
 2025 02:50:22 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%6]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 02:50:22 +0000
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
Subject: Re: [PATCH v5 06/12] media: mediatek: jpeg: refactor jpeg buffer
 payload setting
Thread-Topic: [PATCH v5 06/12] media: mediatek: jpeg: refactor jpeg buffer
 payload setting
Thread-Index: AQHb0Tb/aW/3txZ310qjwpBtQTHvtbPrb54AgAoJcIA=
Date: Fri, 6 Jun 2025 02:50:22 +0000
Message-ID: <a60a408fb68930dca0e4574386032e6bbf8c1173.camel@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
	 <20250530074537.26338-7-kyrie.wu@mediatek.com>
	 <ac655c582609b7887381e1b68ed99f6b128fd794.camel@ndufresne.ca>
In-Reply-To: <ac655c582609b7887381e1b68ed99f6b128fd794.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|JH0PR03MB7935:EE_
x-ms-office365-filtering-correlation-id: d418b8ef-eb13-4fa3-0a23-08dda4a4e1cb
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dEtPN243TGR4bE9HUUdUaWdHRTZxYzJWMnFEU0J4ZG4vRzVhalkwcHorZWFU?=
 =?utf-8?B?ZEZRWVpGczJyQ09pRS9vWWhCNE1SOFQwVGRYNXUxVlF4SHkraXZybXVqS0JG?=
 =?utf-8?B?TWwzbkhFVjBqenVKbEZPTVJrNmcwQ1BUWitjZ01aMkthdXVmQXdBL1lTSHFr?=
 =?utf-8?B?K2hnM2ZsVC9MVVJPY2tyVDBIaFNRdDV1WWYxbEh4ZlAzZXhjdVArbGg1eGZH?=
 =?utf-8?B?ZDg2UkFMdGJVcElTVlFtbGJBRnd4QW9RenlTZ1k2TmV1N2xYWTJmaVVRelVC?=
 =?utf-8?B?L2VxUW9LRkdFZVNGa1NoSkFBdUlIc0pkUXpBaElTT0YycTloUHRBdXBLdTM2?=
 =?utf-8?B?SEgyczRYSm5MSllCK1A3SGtNaW1jTTN1TjRncjQvdmdaakZtaEJIYjlVM1Jv?=
 =?utf-8?B?bm5Zbk92clJudUViTmx4Wk1WSkQzemJBRmRzcnpMSER2ZjVhSDlxQk96UElK?=
 =?utf-8?B?ZktMVDlmS1dWVVQ3S3RYWk05dERpNmo3SWl0RnZyMFViR1llc2NrRnZnN0Yw?=
 =?utf-8?B?YlBXSHJtRHNCTEY0ZmVMSWF6R1VsZUptM2ZBd3BrNVFGMjBrSHJmUmRQNkhR?=
 =?utf-8?B?RHYvdXhIZ2NRUkEwRDd2MkRmbS9aYXB2ZU9MdFNuK0l3ckpUUldMc3dNNVFm?=
 =?utf-8?B?UzVKalFsdEZSUGRZcndLUk9OWk1sSmNnWlg3eUVpQkRrS1dEU2RnWm9BYVRr?=
 =?utf-8?B?bFdoYnFTTjFtZTNsc2w3SmJ1UGs0b0N0MUlHU1F4aEVxdmxVSm03QU1DT1ZI?=
 =?utf-8?B?WTJyeHUxNWpkQllXUHhMbkZaNGRkcHBBOWJzK0g4WjhlNHVNSmdmWGNVQVBN?=
 =?utf-8?B?aGZ4Y1A5eVA5L20wM3VEbnd0c0xjTzU0NUkxa0FYalFsZjEra3pobEErZVpm?=
 =?utf-8?B?MFVhZ3Q5czZZcWZKdHhsbTJmNnhRUXY3VmRHcUhFa051RGhUbmZhamg0NkM0?=
 =?utf-8?B?TGd0bDhZenhyN1c3VkxPU2NnYndzeFJsSXZaS3ltRjFRZmJVTEpTUjhZQlNs?=
 =?utf-8?B?TmwwTklVcVBiS0hnY2grczZSU1NHT1JYRlp3VDUvRkNURnNhMDdBU0JOa2RN?=
 =?utf-8?B?UFRvWEx2cFZHejZlMTZBMmgxcjVtZ1dGKzlsK1V0Vkl1U0RZQVdpWTFVOTl5?=
 =?utf-8?B?d2N3SHV6TjZ2cDBXQkQ3Vzg5RHhQUVl0ZWl1VnB2ak0rL0Z0L0RKMGZUWFhN?=
 =?utf-8?B?K1J2ZzZzdlh3ektYU3QyL2pCUkpCNDFsZGtLdmlzdjVZTjJISWZEd1hSbHJv?=
 =?utf-8?B?OG1STHhTN1dhSUlrdVc5THlLMEYvTVFjVittY1ZFbkdJSXd5a0Q0Si9JZGw5?=
 =?utf-8?B?a0x2RWtKT01BbENiWlVtemg0ZDExUkpwaTBvdkN0NnlyM1Fubk5Mb1ppdEpp?=
 =?utf-8?B?SXdYeHFoWU1ER081c0ozOGFmblR3M1dmeFVYUHhQRmJWbjFBbzhzZmQ5N1E0?=
 =?utf-8?B?cmhLSGl1TklLMlE0WWxwTzU5WTJOSXdiQTZSMTNpRXVOdlFyVG1iZUc2cmdK?=
 =?utf-8?B?NTJzTU1MdzRONjFDU2RhUTMvbjEyQmxhbnNVYkhYU2tPd2loQmtpRnFTempW?=
 =?utf-8?B?ZVVwU1kwYXJ1NmdYMVJSUldrMkwzQzJsZUhjOFNtSUpEa2h4THNYSFVNUVY4?=
 =?utf-8?B?azBkQzg5RTFwUE5VZUxybFpDa2RkYkx2YVkxNmRxdlkvaDM0VkNaSjNZNzM3?=
 =?utf-8?B?cDB3UWFxQUNnMDdmQkNsT2pwOVM2QzRvUWcxQkx4Zjd6d3Z6RXM2QUZIaGtr?=
 =?utf-8?B?V0trTEtFN1J2TGp2MVQ0VmdBYmxzUWxoN1YxYjlIMTJqQXdKUjMzT2pSZmh2?=
 =?utf-8?B?Z0xLdnNjOHc4V2NRRFUxWERMRG9nY1ovNXJLVnFlNytqc0tadFRmQ1JBMGRo?=
 =?utf-8?B?MGlWYVhUYVhZbWdKYUQ4b2plcnBuU3NaNEtUVGwzOGQwSHVERHZGNFR5d0JS?=
 =?utf-8?B?Tk56cGc1amdabk5BWmdDd0NtTUUrb1BHWTQwWXpxT0E4S1FUWE1qK0R1TW5M?=
 =?utf-8?Q?CXYfWlm643cVSYf5ef5rytjfe2GEN8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmExai9URUN3aS9oY2lNQjN3dUJiRXZMUDlrQkdjaFV3WlI3SDBId1hsM3po?=
 =?utf-8?B?QytBemVlc3BIb0tmd3phSVBkNG5BazJ1OUtFQ1pqdWx5TnVMRDRzdk0xejhJ?=
 =?utf-8?B?Y2dIZERFemRtUGkvVlNUSFN2Qk9mVFVRdG9uRmFVejA5SHJ2Vjl4cFNlcWR1?=
 =?utf-8?B?MzNXN3o4eGs2TEM3U3BiYzJ1L2MybHRrWDc4OVdiaXAzem95U1BzV1lOeVJi?=
 =?utf-8?B?TUFCMFBUZ0YrN05lRDBkZmVtRDluVVJTclJxeTdNWFU2WVJlZlRTLzJ4TERJ?=
 =?utf-8?B?MEdZWlcxU09kTmtpSUFrdUlKS3ZKV2xHVmZPMWhyVG9RUzMyT2prV1hGOTZx?=
 =?utf-8?B?V294emNwaDFhT1g3eFllV2FtbUhtSTZYamh0R2s3YldIYUovb3cyaUZiUXEr?=
 =?utf-8?B?MXUyQ0dFQ3ZxY3dqaGEwUXJsMStra3pNR0x6dGowVThaU0owWDk4dy9Sa2FK?=
 =?utf-8?B?RHJBdzErK01jVDM0cFZjMDlsc3RTN1p6ZTRrWkUxWld3dFBPQ2Zmc1ZTdThw?=
 =?utf-8?B?QUlsalZUYkhEdnBvRkxUZzVHdUVXNXVwM2dwWHp3L1JyTGpsSC9XUG14WXRi?=
 =?utf-8?B?Q3hrSmU1V3R0aUlCbVB6bnhGSjFsWVoyMXJUMDNIVWVQeUJGQ05OZlJncU5p?=
 =?utf-8?B?aDhiZHpLKzFXZjJFNW5xUDZ3ZDBFcE1Ud1JRTGg3SG1NS1Q3TDdxSVh3VEZU?=
 =?utf-8?B?SVZGaDhYTHJzVkJ6WElhZjdSRSs0d3NPazNCMXoxczRGS011Vk5lcnpnU0dC?=
 =?utf-8?B?ZWphU3JKNjZmNk9xSzF5elhyeFdKaGVxMnpUUW5CcWtsbCs3eGxFTFpLa1pX?=
 =?utf-8?B?YnZ2NFp4ZmJTTnMxYXVERk5VUnlIVUFrRXhZNXFjd0w0TzM4UEJkNVVONTcv?=
 =?utf-8?B?eDRpWkZONTc3VGpuTlFRWkhVZEtRUVJaWlhJRjZNcEdpWmVLK2dYaGNPak5w?=
 =?utf-8?B?ZHhQV21GT1hDTmFydzFCTkJtY0NQMDhpbi9HR3UxOG1jU013dkpjL1ZSM3Zv?=
 =?utf-8?B?aHQ2S2VJdi9BNXhWamhldHBrTi9WZzFaLzNKSkYxY0cwQ1pweDBGL1d5QjlP?=
 =?utf-8?B?ZU9jTHMxbU9uSFFpQ1BXNnBNYlZrbmRmTG5nK09aKzQ4YUR2YlR4YVN3NXlw?=
 =?utf-8?B?cStzd1BYeC9SZ00vSlVZUGExeUttQy9ESDVqNlB6R0tjeU9idFVaUWhPcjhj?=
 =?utf-8?B?elJGclUvbHpkTkFCSFVka1dZTzhCRUp3Z3BCSnVVTU5SaVFXNnk4U25CTWY2?=
 =?utf-8?B?OU1xTnN5NHV5TER5dUlPd2N2VndZUFFBd2tCNjEwak5UM1RNSWl3V094Rzkv?=
 =?utf-8?B?WXpxSCtnM09KK0JJV1V5Vm51VmJpakc3R3BlUURPNXJoRlprV0RwVWtJZnFs?=
 =?utf-8?B?NXc0NElyYndwR01tTlhwQUREQy9xOHZxSExBOUZBbEJCU3lyS3NNc3hRK1lF?=
 =?utf-8?B?ZUxUMFpBNWNuYWk2V09wVVpROFR2VXY1VGxIeW9hanRiRkFhT0JVRnpIb1du?=
 =?utf-8?B?bnFNbFlFdGZGejJIRnprdDZEV1dpVUlSb21IYTFZVmlnc092bjB3T25RRHFr?=
 =?utf-8?B?UWY3bDlmcmgvWmdPTTByZk1ZS2dJQi9BbW5oYVhvOEYrWEs3NEU4QXN6OFVB?=
 =?utf-8?B?YkpQblN3RlZ4encxcmFlOU1pSU1uVXo2dzJZU2h3dmd5c2s5VGFmS0dyWFJp?=
 =?utf-8?B?NzFrSEpvZzNBYVRCSFR0VjVXNEJvSnVyanBnY0NWNElTbmwybnpwNTRFZE1v?=
 =?utf-8?B?ZFdaOHFja3BFc0d2Y0pNeC85TUJySDdTeTNNQmVXUTVWU0ZhMkw4KzB3MzBJ?=
 =?utf-8?B?VEJ1RU16NWVNSWlTT09PU3BkTVFJWDR3ZVRiSDhIWWxvRWZyVFRDek52S0pD?=
 =?utf-8?B?dTNaZmlnZmtOVDRxRDFma28xdDJGUjB6OTdsUkFFbURpNytFTlhtYUpNUHd1?=
 =?utf-8?B?QWZhVEZSbG1rdnhGZHhiTDdDUWlDaHNKUnVDQnhTNDFheVhMcE1IYmtiVFZP?=
 =?utf-8?B?ZDZ3S0dXUWVkVC90MXd3enViekxodjB2NWxYbG9qMEkxVnA0ekJSKzFqcFYz?=
 =?utf-8?B?bzQ0emx1amVYaTl5cktvT2dHZDVhOFNpOWxyNnB2ZE1uakJWcXVXN242dTFM?=
 =?utf-8?Q?pAVzxq7gAC0GUlZr2dvfXQV6L?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2CC54D3DC1BB94487C8CCF6E2EE88E4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d418b8ef-eb13-4fa3-0a23-08dda4a4e1cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 02:50:22.5749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ZsCFACRSS4RFbhRjft4oipu/ePeqppwjPuRNZ/1I079fhL1rIx/mRljPQzUBxeiuS4QDOzl+qB5GUKtA+NPXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7935

T24gRnJpLCAyMDI1LTA1LTMwIGF0IDEzOjMzIC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IEhpIEt5cmllLA0KPiANCj4gTGUgdmVuZHJlZGkgMzAgbWFpIDIw
MjUgw6AgMTU6NDUgKzA4MDAsIEt5cmllIFd1IGEgw6ljcml0IDoNCj4gPiAxLiBmb3IgbXVsdGkt
Y29yZSBqcGVnZGVjOg0KPiA+ICAgIGNvcmUwOiB8PC0tLS0tLS0tIGRlY29kaW5nIGJ1ZmZlcjAg
YW5kIHJlc29sdXRpb24gY2hhbmdlZCB0bw0KPiA+IHNtYWxsZXINCj4gPiAgICBjb3JlMTogIHw8
LS0tLS0tLS0gZGVjb2RpbmcgYnVmZmVyMQ0KPiA+ICAgIGNvcmUwOiAgIHw8LSBoYW5kbGluZyBy
ZXNvbHV0aW9uIGNoYW5naW5nDQo+ID4gICAgY29yZTA6ICAgIHw8LSB2YjJfc2V0X3BsYW5lX3Bh
eWxvYWQNCj4gPiAyLiB0aGUgcGF5bG9hZCBzaXplIGlzIGNoYW5nZWQgb24gdGhlIHN0ZXAgb2Yg
c2V0IGZvcm1hdC4gQmVjYXVzZQ0KPiA+IGNvcmUxDQo+ID4gaXMgcnVubmluZyBhbmQgc3RyZWFt
aW5nIGhhcyBub3QgYmVlbiBzdG9wcGVkLCB0aGUgZm9ybWF0IGNhbm5vdCBiZQ0KPiA+IHNldCBh
Z2FpbiwgcmVzdWx0aW5nIGluIG5vIGNoYW5nZSBpbiB0aGUgcGF5bG9hZCBzaXplLg0KPiA+IDMu
IGF0IHRoaXMgdGltZSwgdGhlIHBheWxvYWQgc2l6ZSBpcyBiaWdnZXIgdGhhbiBidWZmZXIgbGVu
Z3RoLA0KPiA+IGl0IHdpbGwgcHJpbnQgYSB3YXJubmluZyBjYWxsIHRyYWNlDQo+ID4gNC4gc2V0
IHBheWxvYWQgc2l6ZSBtdXN0IGxlc3MgdGhhbiBidWZmZXIgbGVuZ3RoDQo+IA0KPiBZb3UnbGwg
aGF2ZSB0byByZXdvcmsgdGhlIHRleHQgaW4gdGhpcyBjb21taXQgbWVzc2FnZSwgSSBtdXN0IGFk
bWl0IEkNCj4gZG9uJ3QNCj4gdW5kZXJzdGFuZCBmcm9tIHRoaXMgdGV4dCB3aGF0IGV4YWN0bHkg
dGhlIHByb2JsZW0gaXMsIG1ha2UgaXQgcmVhbGx5DQo+IGhhcmQgdG8NCj4gcmV2aWV3IHlvdXIg
c29sdXRpb24uDQoNCkRlYXIgTmljb2xhcywNCg0KSSdtIHRlcnJpYmx5IHNvcnJ5IGZvciB0aGUg
aW5jb252ZW5pZW5jZSBjYXVzZWQgdG8geW91LiBJIHdpbGwgY2hhbmdlDQp0aGUgY29tbWl0IG1l
c3NhZ2UgYW5kIGxldCBpdCByZWFkIGVhc2llci4NCg0KVGhhbmtzLg0KPiANCj4gPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBLeXJpZSBXdSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0K
PiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMgICAgIHwgMTgN
Cj4gPiArKysrKysrKysrKysrKystLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiBpbmRleCAw
MDc0ZDFlZGI1MzQuLjUyZDU5YmI1YzlhZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jDQo+ID4gKysrIGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuYw0KPiA+IEBAIC03
MjAsMTAgKzcyMCwyMiBAQCBzdGF0aWMgaW50IG10a19qcGVnX2J1Zl9wcmVwYXJlKHN0cnVjdA0K
PiA+IHZiMl9idWZmZXIgKnZiKQ0KPiA+ICAgICAgICAgICAgICAgcGxhbmVfZm10ID0gcV9kYXRh
LT5waXhfbXAucGxhbmVfZm10W2ldOw0KPiA+ICAgICAgICAgICAgICAgaWYgKGN0eC0+ZW5hYmxl
X2V4aWYgJiYNCj4gPiAgICAgICAgICAgICAgICAgICBxX2RhdGEtPmZtdC0+Zm91cmNjID09IFY0
TDJfUElYX0ZNVF9KUEVHKQ0KPiA+IC0gICAgICAgICAgICAgICAgICAgICB2YjJfc2V0X3BsYW5l
X3BheWxvYWQodmIsIGksDQo+ID4gcGxhbmVfZm10LnNpemVpbWFnZSArDQo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNVEtfSlBFR19NQVhfRVhJRl9TSVpF
KQ0KPiA+IDsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKHZiLT5wbGFuZXNbaV0ubGVu
Z3RoID4NCj4gPiAocGxhbmVfZm10LnNpemVpbWFnZSArDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICBNVEtfSlBFR19NQVhfRVhJRl9TSVpFKSkNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2YjJfc2V0X3BsYW5lX3BheWxvYWQodmIsIGksDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBsYW5lX2ZtdC5zaXplaQ0K
PiA+IG1hZ2UgKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBNVEtfSlBFR19NQVhfRVgNCj4gPiBJRl9TSVpFKTsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgZWxzZQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZiMl9z
ZXRfcGxhbmVfcGF5bG9hZCh2YiwgaSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdmItDQo+ID4gPnBsYW5lc1tpXS5sZW5ndGgpOw0KPiA+
ICsNCj4gPiAgICAgICAgICAgICAgIGVsc2UNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgdmIy
X3NldF9wbGFuZV9wYXlsb2FkKHZiLA0KPiA+IGksICBwbGFuZV9mbXQuc2l6ZWltYWdlKTsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgaWYgKHZiLT5wbGFuZXNbaV0ubGVuZ3RoID4NCj4gPiBw
bGFuZV9mbXQuc2l6ZWltYWdlKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZi
Ml9zZXRfcGxhbmVfcGF5bG9hZCh2YiwgaSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGxhbmVfZm10LnNpemVpDQo+ID4gbWFnZSk7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2YjJfc2V0X3BsYW5lX3BheWxvYWQodmIsIGksDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZiLQ0KPiA+ID5wbGFuZXNbaV0u
bGVuZ3RoKTsNCj4gDQo+IElzIHRoaXMgdGhlIHNhbWUgYXMgPw0KPiANCj4gICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgbWF4X3NpemUgPSBwbGFuZV9mbXQuc2l6ZWltYWdlOw0KPiANCj4g
ICAgICAgICAgICAgICAgIGlmIChjdHgtPmVuYWJsZV9leGlmICYmIHFfZGF0YS0+Zm10LT5mb3Vy
Y2MgPT0NCj4gVjRMMl9QSVhfRk1UX0pQRUcpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIG1h
eF9zaXplICs9IE1US19KUEVHX01BWF9FWElGX1NJWkU7DQo+IA0KPiAgICAgICAgICAgICAgICAg
dmIyX3NldF9wbGFuZV9wYXlsb2FkKHZiLCBpLCBNSU4odmItDQo+ID5wbGFuZXNbaV0ubGVuZ3Ro
LCBtYXhfc2l6ZSkpOw0KPiANCj4gSXQgaXMgdW5jbGVhciB0byBtZSBob3cgdGhpcyBpc24ndCBq
dXN0IGEgd29ya2Fyb3VuZCB0aG91Z2gsIGxvb2tpbmcNCj4gZm9yd2FyZA0KPiB5b3VyIHJld29y
a2VkIGNvbW1pdCBtZXNzYWdlLg0KPiANCj4gTmljb2xhcw0KDQpZZXMsIFRoYW5rcyBmb3IgeW91
IHN1Z2dlc3Rpb24uIEkgd2lsbCBmaXggaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KUmVnYXJk
cywNCkt5cmllLg0KPiANCj4gPiAgICAgICB9DQo+ID4gDQo+ID4gICAgICAgcmV0dXJuIDA7DQo=

