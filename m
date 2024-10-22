Return-Path: <linux-media+bounces-20007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA789A97A5
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 06:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22EA2B226B8
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 04:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC4879DC7;
	Tue, 22 Oct 2024 04:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NZLPHR7g";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="JI4C5Iv5"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D8D7441A;
	Tue, 22 Oct 2024 04:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729570590; cv=fail; b=No/5a0j699i6f81eGYCN5rsJe8jJZ+j20G3m+1KVwmBNJtHTmQ79N45jHYK5Xy0s1ILDA9uOKzJrIzSuif07M/6qi9y7KdmqgS60eCqsJK3NXiJyNGM+H+jUtLqb0x4dNMz+8TM80obCSVLdtxyFxOOvgIFXWg6GJLOTFywlLYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729570590; c=relaxed/simple;
	bh=qdh6HPaK0AZlvph5TzAvxDPSKuqAY+zoDnhijdBaDiU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lfAonHSC//oOuCVwuLh6eD9w71S7pgvf4Twl8lYA4eg0EspUpodP1dD7I1wmjY2TRWKNK9f+ay1meMvLpWKaac8pET8WJPGf6++GL8+taC+3XT08TUyemHF/83pjfRE+j1GcSG1GldZCeidnybC5rZTHvKgkN5dPZ/oFNo+MaRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NZLPHR7g; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=JI4C5Iv5; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 6526ece8902c11efbd192953cf12861f-20241022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qdh6HPaK0AZlvph5TzAvxDPSKuqAY+zoDnhijdBaDiU=;
	b=NZLPHR7gZCEAjsN4NwTnFSndRMEv0752LIrvkNJPexV684UV07RF1xVfcL4frMcCWVEsAwcH7BSqxduz8J3YO7QDDxm9RAVn/wDhG7OrUxcw6qAJoX2S1BKwhYxSxMirc61FgBg2yN6WTMKTrPdLjG7kMiGw3xJ0cBWmZX+e5iI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:432415e9-c6e5-4696-96ae-ea0a41aba32f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:a8472b0d-1043-475c-b800-3262c01ea3e5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6526ece8902c11efbd192953cf12861f-20241022
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1031351026; Tue, 22 Oct 2024 12:16:22 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 22 Oct 2024 12:16:20 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 22 Oct 2024 12:16:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZt4vQ2pyiO4zmPRs8qm7rQZy7ZqxBcN/4oq5JDe9yw+MeV2xH4OOJXtj+E3X3YAZJHPMGept/XpE/7uAEU6tQKmv9eqVjLaCusZrDytDxvyUzbzp97vwps0xhhScOq1fnf7oB9dB4uTNivjP73BR+3er6zac1bzolQ0Bhtl5XYYJwiVfMYOvxwsYEP8Ptzua0yn1U3vqcgwpeak4/xYROW/Mfri66eVUDjGUhs0hJ4nJFUqKb6AE2G/sJl9R4mExlKrD17+yLwsMwhk37ZzF8Rl3eLP23d9+fSB1640bQ2bhyefH/2Q9BARncb8JfPjzXgkM/m/Bt/0aBYz3eCSBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdh6HPaK0AZlvph5TzAvxDPSKuqAY+zoDnhijdBaDiU=;
 b=QwnbyVLcwyhPOPZsvi4lERh5xnjQWUkKFijbJlq8fStrz5zuQ1U8mZXa1dKvpsi3VXjeO3bSmhnDQZE2sab6kDjniZ6eCw5N+l9/Izc1cM7P89NJIgV70ns9tvko+c+8t/jF5LaU6kcP4j3g2RRaQNpA8RGL80NbG22+mtfMyjt+vgTy2G7O5IZ2JHNWv2AtiHIG7ySbADx6ovdu8zH65QjifgaF1pY+WbFybhXrVzanLuAdd1UqgsZMFyC9xA7YxlW9qvk0hidiEKx0tm1F6tl8g5vwcRlXw8xl+4ddkWfNjGHlH6ufKE+x+M1usVi7KsggHB/+jbRcxUhspviUOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdh6HPaK0AZlvph5TzAvxDPSKuqAY+zoDnhijdBaDiU=;
 b=JI4C5Iv5hhC1D/8DWzMmlksv1BMnAzXJii4yzbBQ3upW3Q48/m7el+qdvgTZWe6X8PmGQoHG6OhB78XVElTidJvByJmew9NjySXcfi6x5fMNZK6pqgiXbQe3camx7rWZX7NAZBY6IQf+16vb+sBn/dwKH4QT9POpJDXvzoB78Tk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYUPR03MB7205.apcprd03.prod.outlook.com (2603:1096:400:35d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 04:16:17 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 04:16:17 +0000
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
Subject: Re: [PATCH v1 02/10] media: platform: mediatek: add seninf controller
Thread-Topic: [PATCH v1 02/10] media: platform: mediatek: add seninf
 controller
Thread-Index: AQHbGj2MNHQ5sKpEAUCTiRDvBgOUWrKSPcsA
Date: Tue, 22 Oct 2024 04:16:17 +0000
Message-ID: <f7c19ef542f1f86c6ecf355942a6e7934e543c97.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-3-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-3-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYUPR03MB7205:EE_
x-ms-office365-filtering-correlation-id: eda2259c-4a60-4fa0-3295-08dcf250467c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YXdPOG5Jc2F4OGFJU0p6V3haRTJCTW5sUVAvMG1GcWxYVUxIR281bW4rMWJj?=
 =?utf-8?B?bmcrSnhnVjVMSVhJWHdYYlR2MnJhN0ZzRWRwQWE2aXRnN1JXbmRjR0RhV21r?=
 =?utf-8?B?ZUlaMTJHVDJSNmJaSXQ0K2xLeTh2bE1Vb2ZlaEZVOHVIbk1CZStZS2pneFVG?=
 =?utf-8?B?UW9QNEV4aTRIeFBqK2tQNk1SR0tGNUZNZWtHSVFSeU5mRjVoU2dBWW1DbzM5?=
 =?utf-8?B?QVFIOUdzalhDQWpRYmFVcjFaN25mZmE5dDJQK0JyM2JLTkM0bmh0TkUyTUdY?=
 =?utf-8?B?dWRVK0M3NlVYbmtTUzFZemxQK2NMR2ZiSVJzdW5nR2RYcHVyL05LUUxuVTZr?=
 =?utf-8?B?NnJPSVlOclU1bHNrRjV6WlhMWFVlOVl3U3VTMU9jd0N6YlBDYU9FU2pqM3RT?=
 =?utf-8?B?SlRvWkRqM2E4eHNPeCs5OThoVzFWa0xObE9TUHdTOXFGb0NaWmdlQmFSaHRD?=
 =?utf-8?B?NHdOVUdCQzQ2UjVyc2lTOUplY3REOVd0a0syam1BS3FVK0NMK0NrVUJpOUZw?=
 =?utf-8?B?WEpKWDhvK3NnWDJLalJYejNISkprQjltSTVHVjljV0dFMWV3b250V2RzSjln?=
 =?utf-8?B?ZDJRaCsvcUVock55N2FWZFRGMjFib3poOGltemlPVWxULzloK2lnanVKcnRl?=
 =?utf-8?B?OU1iNDZxVlBxVGhXZCtCY1ZFb3hyWXdEd0ZXN25IeGFhQ1gzd3ErTENRWnJU?=
 =?utf-8?B?U0NISTROWnI0VUp6SndOWmdWWVZvT0lHWEdpY0VKK2NURWErc0dEcmN5Y3BC?=
 =?utf-8?B?TG9wSVppanFnbHRMcGloWnVKYnVRZ2RYVnhuY1FaWjZjWFFUR1dlUUQwMEpJ?=
 =?utf-8?B?Nk10VURJZHdGcGdIUjluSGRMbE9uSmxSR0ZGQ1ZHUDljRWs2RGRXejZwd2NN?=
 =?utf-8?B?eE5CdUx5SVRxMWViYzhicFU3YnUyRzRxVUx5Z2RWc3h3YTFVdHpMcGNOODMw?=
 =?utf-8?B?a001cVF6TFU1Nm5YcmlDZDlabndhWlVwU0hpSUNPZFUzU3EvUTVGd3g3MGJo?=
 =?utf-8?B?dVcweEF0V2RPdi9GamptU1g0WE84L3AwSXRnVCsvSDZlWktMSklHYjlYR0JK?=
 =?utf-8?B?RmFJelozQWtaWkt4YmZuL1hRLzhodFgrbFBEOS9SQ0N1Tk9Jam4zejhuZDZK?=
 =?utf-8?B?TzQyRElVeFhzclJaOW13eEh1ampxQzVkVWRyR0l2M0RxU2ZOcDlNektZMm9O?=
 =?utf-8?B?d3RIN3ZobjZPaC9oRFhJU2tSdmw3UjhIeUpzU3daVGhTTWxpaXJtUGI3UzFO?=
 =?utf-8?B?SEdZZU9pcHp1MnJIK2ZWSHZFV2FTbWhWNHVPR0ZaSzd4NmRhMDRpeU5nZzk3?=
 =?utf-8?B?ZGE1Uk9Mak5oci8zd2hjOExGcFFwbkxPdTcyY2pGRGk1d0VvZmVSeUV0ZXl3?=
 =?utf-8?B?RUNmeWhFV29aUDUvYnQ3N2NkdkowY3FVdkZsanUyNDdxWU5hS0xSTjZhQk5P?=
 =?utf-8?B?U1BFZllCZkNqWW8rN25ZdXpTSEVlZlhVTkxLYTlHdlhQc2xkQnZKMUZSUTRY?=
 =?utf-8?B?cXE4NWMvY1BhR0J6RmRsSU43b0ExNnVROEJNbHFEeVZrVE5GS3VzVnNOMXNs?=
 =?utf-8?B?b2NUT2VJR1NFaVBMWkNkVVFEampacmhKK21pdElsVHlIOHlwWVFmd3RjeFZs?=
 =?utf-8?B?MW83d2NKOUtpVXRuRkZ1bTVEcHlXNEJpdWJlTjA0WlFMVFNnY2ZHL0tRRUdO?=
 =?utf-8?B?M1hreXVtYnNhUmI5RURjQmkxUGFGakhUQk5xcmJjWGxWbW9ITzMySjlsVXFv?=
 =?utf-8?B?T2xVRVMxYXJNQ29aenQxL3RZdG41dzJSdFNQbkJ2WDZ6WnMrQVBHeFIycCtE?=
 =?utf-8?Q?YfNFXvbBvY2GLhuILEW4bKX6q/xQa/46xxi2I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czkvckpNcE81TS9wVjhiTkVvMWdvc0NGaklaeENpMEtCRWhBUWpFMEFPamhl?=
 =?utf-8?B?ajM0Zm1WaitYN1plRU5QZzVnNG5qQW1lTzdrZWV4VlNEUGhXWHJ5OE5YV2tl?=
 =?utf-8?B?Wkp0RXNmYUFzWnBwMTVRRzlXODA4VUd0UGFteXQ5UlprZ3p2OXJLMzExODVP?=
 =?utf-8?B?eGZ4c2JwcHU4aUNCczNLL1BFc0Z1b2J3dGZ5R3Q2cnJiMis4RE5FNWVmdVpo?=
 =?utf-8?B?K1pPREZYaldhM095KzIrVmpwTzc4QitIZUNETStSUEZnZnRGVGd3ZlNDYU5F?=
 =?utf-8?B?aWxucldJSTJoSDJ3Mlp0eXFjVkoxY0EveUoyVXlsQ3FxYXZxU3FaRTFLTHpP?=
 =?utf-8?B?M0tNemxicXhoYll4NFluaWU1Y2pzUlZNSFNaWXpJcSt6OXVuRjhNMnYyVGp5?=
 =?utf-8?B?VGhZYzhVUk5YQmQ3V0pISWtsWkliT21LMk9BSkMvNy9MU3p6MDhLbUdYTXNP?=
 =?utf-8?B?NzJ2WDVjWjBPM1ljY29sUDhmN092WXVaNjhWa3pBTHBsVER0SHFBS3RZVFZY?=
 =?utf-8?B?cGpTbkN4ZFJuZmRVOFFoblFaRUNQU0hiTWdqWkhlUkFaOTlLRkFMU1dVRmta?=
 =?utf-8?B?T1I0dDEvWjNUNTYrdFpqWVdNSnpRbUxFdTN5TVJWTGZDQ2JUWlU4cjZpdHND?=
 =?utf-8?B?TUdKTHdNdkpVM2gyY3d2cHo1WG5VMnl5RlNheFNlWWVkT1ljeDVXUG9XSzlk?=
 =?utf-8?B?aTJsTTlkOUkwbEdhYURnRzBaU25VYTNpWjFMMzcyQldaeXRHRmhXd3hiMnhm?=
 =?utf-8?B?US84a1VHVWRjVU5IZytjTlYvZ3hTV0Y5R1JGeUNudGFJMk5jbWZNT2tjTUgw?=
 =?utf-8?B?bWhmUm1XUnZ6eDl0NzBrNlpWWXNZdXJZSUl2b0dTUTZiUXpXc25nUWdBNEU2?=
 =?utf-8?B?UXRGaE8zV1lJU1BkRlVzY2grOXlETitzV2owZ0lMY1dCUlpIbnc5RENpVGdF?=
 =?utf-8?B?bzBKY2lOTTJqQ1VQc3djWEhZT0Y1cGZTcnpqOEpjQk9tUFM1MXNFTFVJMEZo?=
 =?utf-8?B?RzQzVE43RnI4czA4aGk4Ti9zRDJXRFVCRndHZmwxWmlPbXBkQ0JyQWVDTXF6?=
 =?utf-8?B?TVkrWi9NN1UyQUxzZlVsalc2WGxiZHRMZVlQaHRkbzB1MUNWSlZLM1FSMXps?=
 =?utf-8?B?UG5ucVpCVTJ4MDRwdjdrOExoOXZtZUZ4OGhZNklFaEhGQXBuVEhFblZ2eFc5?=
 =?utf-8?B?aUl3dGQzWVYxVFRZRmp4dGZMbHFzMThUeDU4Qkp0K2pDYmFSTlFxOXB1TSsv?=
 =?utf-8?B?QkNSZ3pzWEhpcC81SXR5Qm9RSU9TTHZYbCswODV1b2o0eUxaTk4wNzEzMFdS?=
 =?utf-8?B?eFFZQS9aUTRtQ2RTRHpxa0phT3ZZT2hvOWFoOFlWRGkvTjdLd1VSQ1E2UGZF?=
 =?utf-8?B?ZStLUHA2dU5ua1BwbXVKSnNXRHk1UDAxYXczdFY5NCtmL3VUYS9uWHhvR1lk?=
 =?utf-8?B?R3pYS211eVdJb21nQ3FUQ2cvaTk5elNlRGkwOUdnT1Z3enI4TGU1aGYwcy9O?=
 =?utf-8?B?clhrTnd3RHBaMjEyT1k5MEdrVFJQU2NHOU5oUTlFdVFhY29DNC9raGFOenE4?=
 =?utf-8?B?QmFzZ1ZRZHBQcnYrOE1HU2RGaUFNb1M3bW9sR2dBeThIWURtS0JWYnFOdlR4?=
 =?utf-8?B?L2g1VW9xdTNnemVLaXVEdU12M2tTb1pSaGxXUDVMYyszZk5sS2EzYkREd2ZN?=
 =?utf-8?B?T1Rwejlwbm1hVGxqaXFnMHgwK0VEeXBXRWp3bkw4VlNzZWFIYlRkdlF5TDBQ?=
 =?utf-8?B?WUo0SVNVSVJKZEdqNksyZ05CTG10Wnl0T1JPZ3UvTGg1NEFabTdVeUM2RGxW?=
 =?utf-8?B?N2krSStqc1AyTWYxR1o2cWFWaWlTTjh2Um9oeGdWYjRlVFAyZ282Y09LRGdM?=
 =?utf-8?B?RGdWSC9zcjdOeDJ4Y3BJMzM3OVFHYlg3ck9vREVieWFick85TEJMM3RBR2Y3?=
 =?utf-8?B?SkViZmpFaWZMSzZPTTBKS3lVT1poMlN0Q3hBMWpSdnlvRlQxUEtZU08yWXpR?=
 =?utf-8?B?U1phcWF6Sjc4dEwzTjFlTGdwMm0yY3FRQ09kUk43MEV4RG9QREx1bUwvZHBG?=
 =?utf-8?B?UU1kS1EzRk1xaW5ZOEtEczRPMzB0UTdTZ3JDbG5tblU0REtWSEQrdVZQcUhT?=
 =?utf-8?Q?a25HOkGjnoyW+4o5FApzrtD4L?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC78F8E6A6796A4B8B9EA7C8618AD538@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda2259c-4a60-4fa0-3295-08dcf250467c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 04:16:17.3526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjuNlHmtizWco3QWunLF3z3LCT7Glw+QE4YZdu8iGnYCbYuiAgNbvhrW8KT4V+jcvNbgT/dAsH6BsXlQxCsxfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7205

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIHRoZSBzZW5zb3Ig
aW50ZXJmYWNlIGluIHRoZSBNZWRpYVRlayBTb0MsDQo+IHdpdGggdGhlIGZvY3VzIG9uIENTSSBh
bmQgc3RyZWFtIGNvbnRyb2wuIFRoZSBrZXkgZnVuY3Rpb25hbGl0aWVzDQo+IGluY2x1ZGUgcGFy
YW1ldGVyIGNvbnRyb2wsIG1ldGVyaW5nIGFuZCBtYWludGFpbmluZyBzdGF0dXMgaW5mb3JtYXRp
b24sDQo+IGludGVycnVwdCBoYW5kbGluZywgYW5kIGRlYnVnZ2luZy4gVGhlc2UgZmVhdHVyZXMg
ZW5zdXJlIGVmZmVjdGl2ZQ0KPiBtYW5hZ2VtZW50IGFuZCBkZWJ1Z2dpbmcgb2YgdGhlIGNhbWVy
YSBzZW5zb3IgaW50ZXJmYWNlIGhhcmR3YXJlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhz
aWFuZyBZYW5nIDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBd
DQoNCj4gK2ludCBtdGtfY2FtX3NlbmluZl9pbml0X2lvbWVtKHN0cnVjdCBzZW5pbmZfY3R4ICpj
dHgsIHZvaWQgX19pb21lbSAqaWZfYmFzZSwNCj4gKwkJCSAgICAgIHZvaWQgX19pb21lbSAqYW5h
X2Jhc2UpDQo+ICt7DQoNClRoaXMgZnVuY3Rpb24gaXMgZGVmaW5lZCBpbiB0aGlzIHBhdGNoIGJ1
dCBvbmx5IHVzZWQgYnkgcGF0Y2ggWzMvMTBdLg0KVGhlcmUgYXJlIG1hbnkgZnVuY3Rpb24gZGVm
aW5lZCBpbiB0aGlzIHBhdGNoIGJ1dCB1c2VkIG9ubHkgaW4gcGF0Y2ggWzMvMTBdLg0KSSB0aGlu
ayB0aGlzIHBhdGNoIGFuZCBwYXRjaCBbMy8xMF0gc2hvdWxkIGJlIG1lcmdlZCBpbnRvIG9uZSBw
YXRjaCB3aGljaCBpcyBhIGNvbXBsZXRlIHNlbnNvciBpbnRlcmZhY2UgZHJpdmVyLg0KVG8gcHJl
dmVudCB0aGlzIHBhdGNoIHRvIGJlIHRvbyBiaWcsIHNlcGFyYXRlIGFkdmFuY2VkIGZ1bmN0aW9u
IHRvIGFub3RoZXIgcGF0Y2hlcy4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKwl1MzIgaTsNCj4gKw0K
PiArCWN0eC0+cmVnX2FuYV9jc2lfcnhbQ1NJX1BPUlRfMF0gPQ0KPiArCWN0eC0+cmVnX2FuYV9j
c2lfcnhbQ1NJX1BPUlRfMEFdID0gYW5hX2Jhc2UgKyAwOw0KPiArCWN0eC0+cmVnX2FuYV9jc2lf
cnhbQ1NJX1BPUlRfMEJdID0gYW5hX2Jhc2UgKyAweDEwMDA7DQo+ICsNCj4gKwljdHgtPnJlZ19h
bmFfY3NpX3J4W0NTSV9QT1JUXzFdID0NCj4gKwljdHgtPnJlZ19hbmFfY3NpX3J4W0NTSV9QT1JU
XzFBXSA9IGFuYV9iYXNlICsgMHg0MDAwOw0KPiArCWN0eC0+cmVnX2FuYV9jc2lfcnhbQ1NJX1BP
UlRfMUJdID0gYW5hX2Jhc2UgKyAweDUwMDA7DQo+ICsNCj4gKwljdHgtPnJlZ19hbmFfY3NpX3J4
W0NTSV9QT1JUXzJdID0NCj4gKwljdHgtPnJlZ19hbmFfY3NpX3J4W0NTSV9QT1JUXzJBXSA9IGFu
YV9iYXNlICsgMHg4MDAwOw0KPiArCWN0eC0+cmVnX2FuYV9jc2lfcnhbQ1NJX1BPUlRfMkJdID0g
YW5hX2Jhc2UgKyAweDkwMDA7DQo+ICsNCj4gKwljdHgtPnJlZ19hbmFfY3NpX3J4W0NTSV9QT1JU
XzNdID0NCj4gKwljdHgtPnJlZ19hbmFfY3NpX3J4W0NTSV9QT1JUXzNBXSA9IGFuYV9iYXNlICsg
MHhjMDAwOw0KPiArCWN0eC0+cmVnX2FuYV9jc2lfcnhbQ1NJX1BPUlRfM0JdID0gYW5hX2Jhc2Ug
KyAweGQwMDA7DQo+ICsNCj4gKwljdHgtPnJlZ19hbmFfZHBoeV90b3BbQ1NJX1BPUlRfMEFdID0N
Cj4gKwljdHgtPnJlZ19hbmFfZHBoeV90b3BbQ1NJX1BPUlRfMEJdID0NCj4gKwljdHgtPnJlZ19h
bmFfZHBoeV90b3BbQ1NJX1BPUlRfMF0gPSBhbmFfYmFzZSArIDB4MjAwMDsNCj4gKw0KPiArCWN0
eC0+cmVnX2FuYV9kcGh5X3RvcFtDU0lfUE9SVF8xQV0gPQ0KPiArCWN0eC0+cmVnX2FuYV9kcGh5
X3RvcFtDU0lfUE9SVF8xQl0gPQ0KPiArCWN0eC0+cmVnX2FuYV9kcGh5X3RvcFtDU0lfUE9SVF8x
XSA9IGFuYV9iYXNlICsgMHg2MDAwOw0KPiArDQo+ICsJY3R4LT5yZWdfYW5hX2RwaHlfdG9wW0NT
SV9QT1JUXzJBXSA9DQo+ICsJY3R4LT5yZWdfYW5hX2RwaHlfdG9wW0NTSV9QT1JUXzJCXSA9DQo+
ICsJY3R4LT5yZWdfYW5hX2RwaHlfdG9wW0NTSV9QT1JUXzJdID0gYW5hX2Jhc2UgKyAweGEwMDA7
DQo+ICsNCj4gKwljdHgtPnJlZ19hbmFfZHBoeV90b3BbQ1NJX1BPUlRfM0FdID0NCj4gKwljdHgt
PnJlZ19hbmFfZHBoeV90b3BbQ1NJX1BPUlRfM0JdID0NCj4gKwljdHgtPnJlZ19hbmFfZHBoeV90
b3BbQ1NJX1BPUlRfM10gPSBhbmFfYmFzZSArIDB4ZTAwMDsNCj4gKw0KPiArCWN0eC0+cmVnX2Fu
YV9jcGh5X3RvcFtDU0lfUE9SVF8wQV0gPQ0KPiArCWN0eC0+cmVnX2FuYV9jcGh5X3RvcFtDU0lf
UE9SVF8wQl0gPQ0KPiArCWN0eC0+cmVnX2FuYV9jcGh5X3RvcFtDU0lfUE9SVF8wXSA9IGFuYV9i
YXNlICsgMHgzMDAwOw0KPiArDQo+ICsJY3R4LT5yZWdfYW5hX2NwaHlfdG9wW0NTSV9QT1JUXzFB
XSA9DQo+ICsJY3R4LT5yZWdfYW5hX2NwaHlfdG9wW0NTSV9QT1JUXzFCXSA9DQo+ICsJY3R4LT5y
ZWdfYW5hX2NwaHlfdG9wW0NTSV9QT1JUXzFdID0gYW5hX2Jhc2UgKyAweDcwMDA7DQo+ICsNCj4g
KwljdHgtPnJlZ19hbmFfY3BoeV90b3BbQ1NJX1BPUlRfMkFdID0NCj4gKwljdHgtPnJlZ19hbmFf
Y3BoeV90b3BbQ1NJX1BPUlRfMkJdID0NCj4gKwljdHgtPnJlZ19hbmFfY3BoeV90b3BbQ1NJX1BP
UlRfMl0gPSBhbmFfYmFzZSArIDB4YjAwMDsNCj4gKw0KPiArCWN0eC0+cmVnX2FuYV9jcGh5X3Rv
cFtDU0lfUE9SVF8zQV0gPQ0KPiArCWN0eC0+cmVnX2FuYV9jcGh5X3RvcFtDU0lfUE9SVF8zQl0g
PQ0KPiArCWN0eC0+cmVnX2FuYV9jcGh5X3RvcFtDU0lfUE9SVF8zXSA9IGFuYV9iYXNlICsgMHhm
MDAwOw0KPiArDQo+ICsJY3R4LT5yZWdfaWZfdG9wID0gaWZfYmFzZTsNCj4gKw0KPiArCWZvciAo
aSA9IFNFTklORl8xOyBpIDwgX3NlbmluZl9jZmcuc2VuaW5mX251bTsgaSsrKSB7DQo+ICsJCWN0
eC0+cmVnX2lmX2N0cmxbaV0gPSBpZl9iYXNlICsgMHgwMjAwICsgKDB4MTAwMCAqIGkpOw0KPiAr
CQljdHgtPnJlZ19pZl90Z1tpXSA9IGlmX2Jhc2UgKyAweDBGMDAgKyAoMHgxMDAwICogaSk7DQo+
ICsJCWN0eC0+cmVnX2lmX2NzaTJbaV0gPSBpZl9iYXNlICsgMHgwYTAwICsgKDB4MTAwMCAqIGkp
Ow0KPiArCX0NCj4gKw0KPiArCWZvciAoaSA9IFNFTklORl9NVVgxOyBpIDwgX3NlbmluZl9jZmcu
bXV4X251bTsgaSsrKQ0KPiArCQljdHgtPnJlZ19pZl9tdXhbaV0gPSBpZl9iYXNlICsgMHgwZDAw
ICsgKDB4MTAwMCAqIGkpOw0KPiArDQo+ICsJY3R4LT5yZWdfaWZfY2FtX211eCA9IGlmX2Jhc2Ug
KyAweDA0MDA7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0K

