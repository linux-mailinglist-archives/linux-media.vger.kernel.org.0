Return-Path: <linux-media+bounces-15603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B484E94268C
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 08:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6CF31C23D65
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 06:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3164C16D31E;
	Wed, 31 Jul 2024 06:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dz1rYAMW";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mtyQKypy"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B829E16D316;
	Wed, 31 Jul 2024 06:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406802; cv=fail; b=RzNJOb09cXyo590akL9IYis0gFxwBzBDWlOEzKt3TtD7H63dxkprVKwLkua/jSYrgGFzI/2teB4+6o4P85B93OZENjJqwOzfPl1eAExvyiLZ1+5xXTNINtoiRQuVooOQ7z+14rU/S0rFxfTVoxj8W7eci7a3YSArQCsxXrqJK9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406802; c=relaxed/simple;
	bh=vM7L6HGaZwKkqmF+Gc12b0HuKyPJnyDt6fUKa6j+XVE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L3Yr4dDcR4/zsZNEkRZYc768cNhCTVrig3MbXOD5ZOVmpAlQ/Vjbzw1VVAclfIRUh7cKPginGlwScYUSQs8BL8J8IpiuJNDIB6Al9tIuWH/NGGKXGqXMd5Zm18N2IkLU6eP17pUFDk7ow4+ZLE5IDBNzjIAtsBXNjEkO6vQEcpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dz1rYAMW; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=mtyQKypy; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e53b56264f0411ef87684b57767b52b1-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=vM7L6HGaZwKkqmF+Gc12b0HuKyPJnyDt6fUKa6j+XVE=;
	b=dz1rYAMWHeCC2vvPOMEkGIQ2i+0w0+2vLWKBAVYdMFsG8Mrgl2OeAenLGdIWJ/eoZG+Q+uO20w5EmNMMop1tNLaW9UFsMvNPpFa5w7Hs1L973l3wgAqh4Gna5LBNTXE/KGSrJz5agsfjYBINIWqPx4Nv9UwF1W0dqYqlsESWsek=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:8df979b6-7ede-48da-8007-d9a069590036,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:b2971bd2-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e53b56264f0411ef87684b57767b52b1-20240731
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 503271300; Wed, 31 Jul 2024 14:19:51 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 Jul 2024 23:19:52 -0700
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 14:19:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIR4WATLnn8MFEy+6JzWElgrCMJf6fCfrnKe0eAUmqAGkxfVUPMLH3JmMf9KxZ6xHmi8ALMxRQEVJKAaWGsgcHKbnpoLxJLEQci+CLF5ZwMprtXdGhWttJkc/PBkUHZ/7UGhBXsZqXXnoCxzRwMiYPY+rSWc3Z/R7fv4PzQa9vdmWKYffLxRw406knkGiMahQivGAtG56vPjteiokm8c/kSyD37D5BPkN+MI6ee8KePpGW3iLLbekmQU0jpI6bYm3QW5Y21XnHYKJ5+Q4i5Ne4whkLSChmF9gAVwWEEXc807Fo2Sr8mezJw4ro0jRbIOBDSUAdrPNTRtZf4j5K+XrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vM7L6HGaZwKkqmF+Gc12b0HuKyPJnyDt6fUKa6j+XVE=;
 b=WHvMbjsoEh9w/fqfywbUi0foV7o3+rRrB845Sa8y+qZ2VmCD0Djk0n06Bk3bIhW9bGlZ3cDRd6j4qU/vzjciRcfM+hMPnC3Aa11aWiHJDnpvM5VWPgZtZRs+/KgFmucjq9+3UOh3w8U0EE+pf4FtpLlSi0ETgWeL72RpO8Pwfy/GxX4ea1iDmpFZ87mdvBi4G0GL1an8y8JpW4Pp2fDVSWTgqT9qfzyToN6p77WdEO2uvtW6EtiMlgOSscWsPpBMsh9c5/fjdI9wU62JXWhxWVEnMm0E1Al+VXZyTqyuePs8hF/Nenkc3p2rPghbTDESOSLLSBDNeBVLdCdyrY6RIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vM7L6HGaZwKkqmF+Gc12b0HuKyPJnyDt6fUKa6j+XVE=;
 b=mtyQKypyFtHQCf3Lh5IZFAntDc98mFKlmSES9Hrxdshkb8ucpmkTd0H3wWu/0rKx0sGg2srvWqg6p3quJ6zI/caHzgXp5nYJ24Fam4l2lrW45mGHBdhLcPKPIRDrg/n7+lh6xFSCeVDyWoB4syz/d+/L4pNz0Bq6OawcAHmp6cA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8735.apcprd03.prod.outlook.com (2603:1096:405:62::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 06:19:49 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 06:19:49 +0000
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
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, "pnguyen@baylibre.com"
	<pnguyen@baylibre.com>
Subject: Re: [PATCH v6 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Thread-Topic: [PATCH v6 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Thread-Index: AQHa4ce0R/yhPmqOq0yo2W+0gnxvirIQX7oA
Date: Wed, 31 Jul 2024 06:19:49 +0000
Message-ID: <90e13cea78a15ca85edce1ca6cdf2c972fe3aa01.camel@mediatek.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
	 <20240729-add-mtk-isp-3-0-support-v6-3-c374c9e0c672@baylibre.com>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-3-c374c9e0c672@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8735:EE_
x-ms-office365-filtering-correlation-id: 033fb2c4-7bac-480e-d699-08dcb128c85f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Ym5BK1JFS3VEZ2NaZ1ZwOWd5OWZRZC8zZ1pMU3hNcjlPRERQNXhaRkx0MDRl?=
 =?utf-8?B?OC9kb0plYmRaV1Arc1FnQXRCaG5xelUxQng0TEJsTEVzOThlYXNCQlRwUEdi?=
 =?utf-8?B?MWpxTDlrZ2tOeFB2cDJIKzAwZ29XeTdhZ01MVzAveXQrUEpEbmkwQUowSU5X?=
 =?utf-8?B?azVZSVo2bi9OTEFWUW1nbU96NDl4WVRvZExma2hhSU9XVUVyMHh3VzlxWjNo?=
 =?utf-8?B?Z05oV0pRMVY2Tkx3Q0d4SDkwMnRiNGFrSjNaQ2JBQVZCMGt6RmszdjZ3c0VW?=
 =?utf-8?B?SWVqTldxWjBHSzExeUUwOTR6U1VTNnU4UXRmMjhjbitvNjZzL1F5ZnNDUXMr?=
 =?utf-8?B?ek5HczVUTnZCOUUrRHBIc25YR3dGQ0FtSVhOb1RUemtxbVlvQlQ4YTZQNkx0?=
 =?utf-8?B?bGcwZUQzQmNLajErVGs1R0lDZFphYll0YStMK3JscjlKK1lHYmZiMmZRZjFM?=
 =?utf-8?B?Y0hpSnlRUGhkVG9jdVFYOWpXSDFxRUdJYW4xSVFGZklLcU81d0c2UUVNQ1hi?=
 =?utf-8?B?S2hHbUxiaVpoOFhyNkEwZU5mZzlpL3k1cUxHWGlNWGJ4bmNSR3hoRzhmZklx?=
 =?utf-8?B?NFE3ZEhnWndNcEdOaTlJcHZvSmhJZzJXbE5Nb1JvY1ExNFdlL3U2cGlrelR1?=
 =?utf-8?B?ODlDTnJIdkV0TXFwRitSNHdXNzZjd3ZSUjF0aHB0UzJvVnZZTldxcnlBMUtK?=
 =?utf-8?B?cGVpZFl0QWFoR0FFTHhWVU4rQkJKei9xUUtXUDg2eEhRVzhGMDY1Z1pNam5M?=
 =?utf-8?B?RFF2QmwySkQ1WXdtTzRHS2FFT2tZSzBpWEpZTVllY2lBUTdwZmhXcGJYRU5Q?=
 =?utf-8?B?aDFRY3Bua2dnV2hRa3F1OHNEc01QVmh6WjdIdTJzbEZhMGRPc0JSSkM5b1Zx?=
 =?utf-8?B?UlE3dTJ0YVBEenNpQkxpRHVEeFFEcWc1ako4WHRCQUJKTUxWZHVwa1lkdk1X?=
 =?utf-8?B?bTNDTFlxNTY0Z0pVSFFHUWthbW5EWHZjUXEzeWdzayszTGs5RUF1V0sxUCtJ?=
 =?utf-8?B?SmNBU2FvbU9sQ25BS0pSSzg1TlBpb3VZNUU1T0lHVjNzZFRBNVJ5Sy85cWgz?=
 =?utf-8?B?L1pPZVpPdkMwOWxJTyt0SE42NVhjUGtwSWdYYlZIZllpanRrTTdWekJwc25o?=
 =?utf-8?B?MVlRNU9yaFJheVhZVXBXS3EvMWxCMTc0V29QL2t0NkkwMTcrN0lmZVFjYUkr?=
 =?utf-8?B?QVJnbUpPUnRlekd5MzV4VmE3WVFQUVo4SXhoSElJcWIyQVNLVWozclRzQ2U2?=
 =?utf-8?B?cDdrdi8zWHBEVkZwMnB6QXQraS9KdDY5Q3RESHpTZjNlOXI1azJLMEM1djQ5?=
 =?utf-8?B?N0YxQ1RZdkJqU0hjclZTYnpMdWR6SGE3eGwranpXNm1MSG54dnJqNDJmejE3?=
 =?utf-8?B?dWoxYjJYbVA4VDRIQkRsOWNwQ1RuZE82SHcycUVJSHUzcTU2YlpmbStRazBY?=
 =?utf-8?B?eGJ3QzJicUpTYU54bDZLUU9ERkpxOTd6WnVoYWs0MHlja1Bwc0FKZVFtUTUw?=
 =?utf-8?B?WThXbmtnTElxc2cza2RsdWJ0a1lQekhlSWYzd3RJZ2k0ZzB6bHJScjRwTjhx?=
 =?utf-8?B?b1pRbFo1VmZ0dEFORWEwMVNrUUU5elpnYXNIak1BamJDdTF4bjViaGE2OUdq?=
 =?utf-8?B?bllJUitwbzZCUHhyVzQrTm96eVlnNjA1bFAxRGVYdnNDMUI3VkFFTFlwbVY4?=
 =?utf-8?B?SVlIUHZLaVFVY1FjczZJc3RBOEk2SFdmaTFudnNGdWhjRXdvMnlQRjVwN2lZ?=
 =?utf-8?B?YzArSS9zNGd1WmYxMkRCTHhRbW93U3VYN2ZxSDhZMWpvSjBsaGdJMDdTS1Qw?=
 =?utf-8?B?czVmcGJCTTFtbFB3SFI5WkdzeXRTOEJlZWlseXVta2hkSk1CQlEyWm1VVDhh?=
 =?utf-8?B?ZmhHVnB0cjlDbU5oZkMrWEp5SEFQTEdLZnRKZFhDa3l5amc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?am1MM0lvbWpWY2VJZTBia2g1ZFN5cDNBRTZzUlpBNkgrMSsrVC9BLy8zVkJa?=
 =?utf-8?B?WGR4S0xWVmE3Vy9yN0lYeGpjY1ExSzgxTHVsczF0bFRVYkg0djdScFRlOHBW?=
 =?utf-8?B?aFhKQTkzSHJwajU5elBjL3gveE5wdGNlbHFvL21sWlhaM1RFQkhSQkpSNGl3?=
 =?utf-8?B?SjBXNTlvV1lSN1IwTEZtelEzTkd2WFNaM3FWM2sxWHpYVzRhTnV1VEY4Z0x6?=
 =?utf-8?B?aW1TMkVjZlFCNUpRRmRvR0N5M2xFWHdCZ1o2R1drZXZPY1ZzcWpxNjVrZUpo?=
 =?utf-8?B?Ny9tVzlpN211T0JDTkZVWGlld0NRcVRqSFk5NzFvb09IZVlRQzJFUVJmK0JW?=
 =?utf-8?B?MTdmWFpJWnFZcFBXREpOWXBTaHVKc3NER2dqcUdaRGMxNlI0TW4xb2dzanVp?=
 =?utf-8?B?Y2tWYU80RUMwVURUNGpabFAzV1dXdnMxd2lnVEZCUkl3QlFMellVdmo2ajR1?=
 =?utf-8?B?ZFI2RzQxUHA0NndhdnZUSXR3WU9JWmlPakNOeEVBSUNhcXBZb3FqalVWQ05D?=
 =?utf-8?B?cnhmdlFQbWgrZlFSYjZEd3F6RnpYeE1ZWUh1VmduRkVlZjB6R2RqM3B2S0VK?=
 =?utf-8?B?VzZTRmQ5MG5OMzMxZ0VBUDhGb1NRNTFrRHpSd3FzZDhUWUlnNEdkUHdpcFZJ?=
 =?utf-8?B?d2NiWDVSV1NwZVhheU9uOTV2enc0Ui9YV0g4c1lzaUFVUlhwQ0gvbDJvM21t?=
 =?utf-8?B?WDJMTWNRUEdSWTFIanp0RzJ1VE5RTVlTdGloQkRMaFhPTFIrV3pBQWUycVYx?=
 =?utf-8?B?U1NSUkJFcWNFT3c2WDZCeFN5YldjRzlmUjVLYnhJcDI3bjVlcDR1RHF6aW5Q?=
 =?utf-8?B?K3V3UVo1OTlCWWpJQ2RGbWxiaDc2d3h2cDRZRURhZDBTbWpUT3NJMFJYUHEv?=
 =?utf-8?B?YU8yYVJCZzJwOVdacGNMTHozZjlrNmZsYnoxVXpYUk12K2xSL1dVVk1EZFNU?=
 =?utf-8?B?QmZJQVZZZTFLMzVaRGRyNDIvOWNHeGJYemxMc0NoZGlaN2xwTlJ0YXpzcGow?=
 =?utf-8?B?dXpSOFpHTUNRbWVWOE13SGI3WHU5QWZ5eUM4ZzA3UkZpU0JRZ0lhMDVENU54?=
 =?utf-8?B?VkZOejgyU1E0YTRDaGVDZjdXWWs1eVZ3allLSGlWNlpuRkZ1bHVnSWxBUnRu?=
 =?utf-8?B?bjgxcElVQ2NGSy9ucVBLRGlFRXQ1enNGL2wvOXBpbktzMHBTamlkbWxZNlda?=
 =?utf-8?B?Mk9QOWR1ZlVibThZaTN1YS93anpTQldPMFc5bFAzVkF5Vjd3V25TN3ZyQW1o?=
 =?utf-8?B?akV0RUd4bHJaMFdNaXppeUwwQ0tKaFNXaVFFRWFrRHlkYjNJMXJZbENFcDZs?=
 =?utf-8?B?MVJLRmxUcy9yVGpRa2tDVXF4MDJudkI1S0RsOGpibmlHY3lBUjNvU2IwZC9m?=
 =?utf-8?B?Zk5FWWo4OHlvYlI4eWs5UkNiUWVhM3p3ZXdYaHNxczBjbmxaNFdBRFlham5Q?=
 =?utf-8?B?ZWV0VTU5ekJidWNIbERRNjV2VVRFSmxQTG9ubUNjVHlrajJOTnVQWmRKN3lX?=
 =?utf-8?B?cEdkZUdSelBuM2RJSUIzYUx1dyt4bWYrWExDcXJpcWEzTnQ5eitNWE1DTkxG?=
 =?utf-8?B?WXpJMnZpZ2c2WmRMRjNMQmNrdDE0K2o0RXhaR0FzakNES2trUUtQanZmNVNJ?=
 =?utf-8?B?Nmw4ZzdCM3pyYzBzeXdneFB1cHlLcUxacDJGL1pLcXdPRU1KNjl1Y3NoUk84?=
 =?utf-8?B?Y0tEZjlIQkNIWDdDcnFBeWQ3OTFaTmJXS21CaVVSMTZsKzhxbDJad1U4bUZ5?=
 =?utf-8?B?Z2k0bUpwTTR5R2JHZ2xYMGRmcjBaVWhyd1p1T2huQk9iMGMwR1ppRnFtdy9O?=
 =?utf-8?B?UmZtM1FxeExhakVRVE5WSFVheko4Q3pTVng2ZVZNY3VheHdqcmhiaTF2WTRj?=
 =?utf-8?B?WGdWRU54Yk1UYnRBSDI0Wjl5dHNIWGttTXArbDRFb3p6NjMrV1JGZFFIOGww?=
 =?utf-8?B?dGFvaTN2WmxYd3M5MTNTZGJZSXlNQ3R6QXExWXpNWi9TeURHNFEvSTk3bXJY?=
 =?utf-8?B?QkRIdVRPeUJtTWd1blRidUhFU055Vi96dk4vUVQ1ZlBEbW9saHZVYWc5WEF5?=
 =?utf-8?B?MW00SzdGNGpXbFNuQncrRmtjQnZCazNrT3Q0YSs0VGZYa3BjSWxFTTNCUkJy?=
 =?utf-8?Q?lBnrO95ZDOa7s4JVO90w/t/w3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <988AECD41542A44888BFD3F671FDF09D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033fb2c4-7bac-480e-d699-08dcb128c85f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 06:19:49.8212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7VJxHvgfdKGbXiMlVRVjSU63BTGv0XENdJ/+xWEj+0LWqQN3HN7GmBnoZRjB93AfLJ3AmjZTzgNQWtiM6Pkzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8735

SGksIEp1bGllbjoNCg0KT24gTW9uLCAyMDI0LTA3LTI5IGF0IDE2OjQ4ICswMjAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBGcm9tOiBMb3VpcyBLdW8gPGxvdWlzLmt1b0Bt
ZWRpYXRlay5jb20+DQo+IA0KPiBUaGlzIHdpbGwgYWRkIHRoZSBtZWRpYXRlayBJU1AzLjAgc2Vu
aW5mIChzZW5zb3IgaW50ZXJmYWNlKSBkcml2ZXIgZm91bmQNCj4gb24gc2V2ZXJhbCBNZWRpYXRl
ayBTb0NzIHN1Y2ggYXMgdGhlIG10ODM2NS4NCj4gDQo+IFRoZW4gc2VuaW5mIG1vZHVsZSBoYXMg
NCBwaHlzaWNhbCBDU0ktMiBpbnB1dHMuIERlcGVuZGluZyBvbiB0aGUgc29jIHRoZXkNCj4gbWF5
IG5vdCBiZSBhbGwgY29ubmVjdGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTG91aXMgS3VvIDxs
b3Vpcy5rdW9AbWVkaWF0ZWsuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4g
PHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3Ry
ZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
DQo+IENvLWRldmVsb3BlZC1ieTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNv
bT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgaW50IG10a19zZW5pbmZfaW5wdXRfc2V0
dXBfY3NpMihzdHJ1Y3QgbXRrX3NlbmluZiAqcHJpdiwNCj4gK3N0cnVjdCBtdGtfc2VuaW5mX2lu
cHV0ICppbnB1dCwNCj4gK3N0cnVjdCB2NGwyX3N1YmRldl9zdGF0ZSAqc3RhdGUpDQo+ICt7DQo+
ICtjb25zdCBzdHJ1Y3QgbXRrX3NlbmluZl9mb3JtYXRfaW5mbyAqZm10aW5mbzsNCj4gK2NvbnN0
IHN0cnVjdCB2NGwyX21idXNfZnJhbWVmbXQgKmZvcm1hdDsNCj4gK3Vuc2lnbmVkIGludCBudW1f
ZGF0YV9sYW5lcyA9IGlucHV0LT5idXMubnVtX2RhdGFfbGFuZXM7DQo+ICt1bnNpZ25lZCBpbnQg
dmFsID0gMDsNCj4gK3M2NCBjbG9ja19jb3VudDsNCj4gKw0KPiArZm9ybWF0ID0gdjRsMl9zdWJk
ZXZfc3RhdGVfZ2V0X2Zvcm1hdChzdGF0ZSwgaW5wdXQtPnBhZCwgMCk7DQo+ICtmbXRpbmZvID0g
bXRrX3NlbmluZl9mb3JtYXRfaW5mbyhmb3JtYXQtPmNvZGUpOw0KPiArDQo+ICsvKiBDb25maWd1
cmUgdGltZXN0YW1wICovDQo+ICt3cml0ZWwoU0VOSU5GX1RJTUVTVEFNUF9TVEVQLCBpbnB1dC0+
YmFzZSArIFNFTklORl9URzFfVE1fU1RQKTsNCj4gKw0KPiArLyogSFEgKi8NCj4gKy8qDQo+ICsg
KiBDb25maWd1cmUgcGhhc2UgY291bnRlci4gWmVybyBtZWFuczoNCj4gKyAqIC0gU2Vuc29yIG1h
c3RlciBjbG9jazogSVNQX0NMSw0KPiArICogLSBTZW5zb3IgY2xvY2sgcG9sYXJpdHk6IFJpc2lu
ZyBlZGdlDQo+ICsgKiAtIFNlbnNvciByZXNldCBkZWFzc2VydGVkDQo+ICsgKiAtIFNlbnNvciBw
b3dlcmVkIHVwDQo+ICsgKiAtIFBpeGVsIGNsb2NrIGludmVyc2lvbiBkaXNhYmxlZA0KPiArICog
LSBTZW5zb3IgbWFzdGVyIGNsb2NrIHBvbGFyaXR5IGRpc2FibGVkDQo+ICsgKiAtIFBoYXNlIGNv
dW50ZXIgZGlzYWJsZWQNCj4gKyAqLw0KPiArd3JpdGVsKDB4MCwgaW5wdXQtPmJhc2UgKyBTRU5J
TkZfVEcxX1BIX0NOVCk7DQo+ICsNCj4gK2Nsb2NrX2NvdW50ID0gbXRrX3NlbmluZl9nZXRfY2xr
X2RpdmlkZXIocHJpdiwgaW5wdXQtPnNlbmluZl9pZCwgZm10aW5mby0+YnBwLA0KPiArIG51bV9k
YXRhX2xhbmVzKTsNCj4gK2lmIChjbG9ja19jb3VudCA8IDApDQo+ICtyZXR1cm4gY2xvY2tfY291
bnQ7DQo+ICsNCj4gK2Nsb2NrX2NvdW50ID0gRklFTERfUFJFUChHRU5NQVNLKDIxLCAxNiksIGNs
b2NrX2NvdW50KSB8IDB4MTsNCj4gK3dyaXRlbChjbG9ja19jb3VudCwgaW5wdXQtPmJhc2UgKyBT
RU5JTkZfVEcxX1NFTl9DSyk7DQo+ICsNCj4gKy8qIEZpcnN0IEVuYWJsZSBTZW5zb3IgaW50ZXJm
YWNlIGFuZCBzZWxlY3QgcGFkICgweDFhMDRfMDIwMCkgKi8NCj4gK210a19zZW5pbmZfaW5wdXRf
dXBkYXRlKGlucHV0LCBTRU5JTkZfQ1RSTCwgU0VOSU5GX0VOLCAxKTsNCj4gK210a19zZW5pbmZf
aW5wdXRfdXBkYXRlKGlucHV0LCBTRU5JTkZfQ1RSTCwgUEFEMkNBTV9EQVRBX1NFTCwgU0VOSU5G
X1BBRF8xMEJJVCk7DQo+ICttdGtfc2VuaW5mX2lucHV0X3VwZGF0ZShpbnB1dCwgU0VOSU5GX0NU
UkwsIFNFTklORl9TUkNfU0VMLCAwKTsNCj4gK210a19zZW5pbmZfaW5wdXRfdXBkYXRlKGlucHV0
LCBTRU5JTkZfQ1RSTF9FWFQsIFNFTklORl9DU0kyX0lQX0VOLCAxKTsNCj4gK210a19zZW5pbmZf
aW5wdXRfdXBkYXRlKGlucHV0LCBTRU5JTkZfQ1RSTF9FWFQsIFNFTklORl9OQ1NJMl9JUF9FTiwg
MCk7DQo+ICsNCj4gKy8qIERQQ00gRW5hYmxlICovDQo+ICtpZiAoZm10aW5mby0+ZmxhZ3MgJiBN
VEtfU0VOSU5GX0ZPUk1BVF9EUENNKQ0KPiArdmFsID0gU0VOSU5GX0NTSTJfRFBDTV9ESV8yQV9E
UENNX0VOOw0KPiArZWxzZQ0KPiArdmFsID0gU0VOSU5GX0NTSTJfRFBDTV9ESV8zMF9EUENNX0VO
Ow0KPiArd3JpdGVsKHZhbCwgaW5wdXQtPmJhc2UgKyBTRU5JTkZfQ1NJMl9EUENNKTsNCj4gKw0K
PiArLyogU2V0dGxlIGRlbGF5ICovDQo+ICttdGtfc2VuaW5mX2lucHV0X3VwZGF0ZShpbnB1dCwg
U0VOSU5GX0NTSTJfTE5SRF9USU1JTkcsDQo+ICtEQVRBX1NFVFRMRV9QQVJBTUVURVIsIFNFTklO
Rl9TRVRUTEVfREVMQVkpOw0KPiArDQo+ICsvKiBDU0kyIGNvbnRyb2wgKi8NCj4gK3ZhbCA9IHJl
YWRsKGlucHV0LT5iYXNlICsgU0VOSU5GX0NTSTJfQ1RMKQ0KPiArICAgICAgfCAoRklFTERfUFJF
UChTRU5JTkZfQ1NJMl9DVExfRURfU0VMLCBEQVRBX0hFQURFUl9PUkRFUl9ESV9XQ0xfV0NIKQ0K
PiArICAgICAgfCBTRU5JTkZfQ1NJMl9DVExfQ0xPQ0tfTEFORV9FTiB8IChCSVQobnVtX2RhdGFf
bGFuZXMpIC0gMSkpOw0KPiArd3JpdGVsKHZhbCwgaW5wdXQtPmJhc2UgKyBTRU5JTkZfQ1NJMl9D
VEwpOw0KPiArDQo+ICttdGtfc2VuaW5mX2lucHV0X3VwZGF0ZShpbnB1dCwgU0VOSU5GX0NTSTJf
UkVTWU5DX01FUkdFX0NUTCwgQllQQVNTX0xBTkVfUkVTWU5DLCAwKTsNCj4gK210a19zZW5pbmZf
aW5wdXRfdXBkYXRlKGlucHV0LCBTRU5JTkZfQ1NJMl9SRVNZTkNfTUVSR0VfQ1RMLCBDRFBIWV9T
RUwsIDApOw0KPiArbXRrX3NlbmluZl9pbnB1dF91cGRhdGUoaW5wdXQsIFNFTklORl9DU0kyX1JF
U1lOQ19NRVJHRV9DVEwsIENQSFlfTEFORV9SRVNZTkNfQ05ULCAzKTsNCj4gK210a19zZW5pbmZf
aW5wdXRfdXBkYXRlKGlucHV0LCBTRU5JTkZfQ1NJMl9NT0RFLCBDU1JfQ1NJMl9NT0RFLCAwKTsN
Cj4gK210a19zZW5pbmZfaW5wdXRfdXBkYXRlKGlucHV0LCBTRU5JTkZfQ1NJMl9NT0RFLCBDU1Jf
Q1NJMl9IRUFERVJfTEVOLCAwKTsNCj4gK210a19zZW5pbmZfaW5wdXRfdXBkYXRlKGlucHV0LCBT
RU5JTkZfQ1NJMl9EUEhZX1NZTkMsIFNZTkNfU0VRX01BU0tfMCwgMHhmZjAwKTsNCj4gK210a19z
ZW5pbmZfaW5wdXRfdXBkYXRlKGlucHV0LCBTRU5JTkZfQ1NJMl9EUEhZX1NZTkMsIFNZTkNfU0VR
X1BBVF8wLCAweDAwMWQpOw0KPiArDQo+ICttdGtfc2VuaW5mX2lucHV0X3VwZGF0ZShpbnB1dCwg
U0VOSU5GX0NTSTJfQ1RMLCBDTE9DS19IU19PUFRJT04sIDApOw0KPiArbXRrX3NlbmluZl9pbnB1
dF91cGRhdGUoaW5wdXQsIFNFTklORl9DU0kyX0NUTCwgSFNSWF9ERVRfRU4sIDApOw0KPiArbXRr
X3NlbmluZl9pbnB1dF91cGRhdGUoaW5wdXQsIFNFTklORl9DU0kyX0NUTCwgSFNfVFJBSUxfRU4s
IDEpOw0KPiArbXRrX3NlbmluZl9pbnB1dF91cGRhdGUoaW5wdXQsIFNFTklORl9DU0kyX0hTX1RS
QUlMLCBIU19UUkFJTF9QQVJBTUVURVIsDQo+ICtTRU5JTkZfSFNfVFJBSUxfUEFSQU1FVEVSKTsN
Cj4gKw0KPiArLyogU2V0IGRlYnVnIHBvcnQgdG8gb3V0cHV0IHBhY2tldCBudW1iZXIgKi8NCj4g
K210a19zZW5pbmZfaW5wdXRfdXBkYXRlKGlucHV0LCBTRU5JTkZfQ1NJMl9ER0JfU0VMLCBERUJV
R19FTiwgMSk7DQo+ICttdGtfc2VuaW5mX2lucHV0X3VwZGF0ZShpbnB1dCwgU0VOSU5GX0NTSTJf
REdCX1NFTCwgREVCVUdfU0VMLCAweDFhKTsNCj4gKw0KPiArLyogSFEgKi8NCj4gK3dyaXRlbCgw
eGZmZmZmZmZlLCBpbnB1dC0+YmFzZSArIFNFTklORl9DU0kyX1NQQVJFMCk7DQo+ICsNCj4gKy8q
IEVuYWJsZSBDU0kyIElSUSBtYXNrICovDQo+ICsvKiBUdXJuIG9uIGFsbCBpbnRlcnJ1cHQgKi8N
Cj4gK3dyaXRlbCgweGZmZmZmZmZmLCBpbnB1dC0+YmFzZSArIFNFTklORl9DU0kyX0lOVF9FTik7
DQo+ICsvKiBXcml0ZSBjbGVhciBDU0kyIElSUSAqLw0KPiArd3JpdGVsKDB4ZmZmZmZmZmYsIGlu
cHV0LT5iYXNlICsgU0VOSU5GX0NTSTJfSU5UX1NUQVRVUyk7DQo+ICt3cml0ZWwoMHhmZmZmZmZm
ZiwgaW5wdXQtPmJhc2UgKyBTRU5JTkZfQ1NJMl9JTlRfU1RBVFVTX0VYVCk7DQo+ICsvKiBFbmFi
bGUgQ1NJMiBFeHRlbmQgSVJRIG1hc2sgKi8NCj4gK3dyaXRlbCgweGZmZmZmZmZmLCBpbnB1dC0+
YmFzZSArIFNFTklORl9DU0kyX0lOVF9FTl9FWFQpOw0KDQpEb2VzIHRoZSBJUlEgbWVhbnMgdGhl
IENQVSB3b3VsZCByZWNlaXZlIGFuIGludGVycnVwdD8NCkJ1dCB0aGlzIGRyaXZlciBkb2VzIG5v
dCByZXF1ZXN0IGludGVycnVwdCBoYW5kbGVyLCBzbyBlbmFibGUgSVJRIHNlZW1zIHJlZHVuZGFu
dC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKy8qIFJlc2V0IHRoZSBDU0kyIHRvIGNvbW1pdCBjaGFu
Z2VzICovDQo+ICttdGtfc2VuaW5mX2lucHV0X3VwZGF0ZShpbnB1dCwgU0VOSU5GX0NUUkwsIENT
STJfU1dfUlNULCAxKTsNCj4gK3VkZWxheSgxKTsNCj4gK210a19zZW5pbmZfaW5wdXRfdXBkYXRl
KGlucHV0LCBTRU5JTkZfQ1RSTCwgQ1NJMl9TV19SU1QsIDApOw0KPiArDQo+ICtyZXR1cm4gMDsN
Cj4gK30NCj4gKw0KPiANCg==

