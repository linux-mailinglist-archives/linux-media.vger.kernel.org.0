Return-Path: <linux-media+bounces-49519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D592ECDD64B
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 08:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46D22301D67A
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 07:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135FF2E228D;
	Thu, 25 Dec 2025 07:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="h28CqkZf";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="vWuPhZt0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33BD2DF6EA;
	Thu, 25 Dec 2025 07:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766646292; cv=fail; b=qVvcrnCJ4Jk78hnDma/8X79BJRaia6hMvjN8shXsGm189SsF9zLTQUd1XJ2x+xYrz2ciN8JnbrThiW82N/mbCTtFIMwze/sbxFOdWap8XyMxeZYf1yLJnK5R/UeidbBeTNG5/qjX+8a3+4zRFa31MRKZK27yvGEQQiprWtU4z+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766646292; c=relaxed/simple;
	bh=kvzbd1Tvj3yEIpgStAmLWITME9pK7vU55vxytFAUsHM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y15KBPCUrNYOfyxFvcpjiqSofJbiMj05cp/GB/eYOSH7Bpgtx6Nkqr27oOpwT7zIn4+Aj9QDFz501OuTPfEL5QkwfyrrqdzpPBKMbDfbpHJU6vZQcy1W+3ASM28zi8jUT2C16DdVIgb8wZH/EfhT5hPE7HdSE1dj4dd3buRdeNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=h28CqkZf; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=vWuPhZt0; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fd7ad6e6e15f11f0b33aeb1e7f16c2b6-20251225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=kvzbd1Tvj3yEIpgStAmLWITME9pK7vU55vxytFAUsHM=;
	b=h28CqkZfNxL27uIbL7Bf8WMMdgEALSy66pvOlZxIaqk857Hq2KRkWS8bQEYjUzuInWMqc/29saETunZQMvFACxgehN/kKVmGutUWQgNj+d4W5P2cNPE/yvdKfs+5neJEEIdgEb7Y+CVaHRT9fguqyxO9LbpAGunwl5h+cEuTL38=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:01f4bd60-6d25-4b83-9925-6e6035698943,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:ad81e628-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd7ad6e6e15f11f0b33aeb1e7f16c2b6-20251225
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 888489812; Thu, 25 Dec 2025 15:04:43 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 25 Dec 2025 15:04:42 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 25 Dec 2025 15:04:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILhe9X4RFU7YyFnb5Tl+Q5sSVyUP9mA1BXVrgU9WIHwgKf9lFRanR/5dsP4emBPv6+wFa/Rt72uQHkWa26aXXzj4Xcs+bAhJIrtVdmpSXYuIydZbWfazwJc6gDMkJmzAYJcMJJ1KICA4wubFb/bHYVYaaW2AnhxLPetf0iPHxRXznGNrR5STomu4IIjQEhKeTdKXBXXXrm4tCp/ZlnHLvkTz5tZZaqvRVrRHPeRgHWxcnocmz/A4yB+K2ycOq5ZsdvpHbXr4c8WREa6c3mXgxdWfdWVvHqMJX1pAuyWkWO6VePmkkQqf+BPWeU8pZOOAoycuY0PSuKIp2xyUWdK0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvzbd1Tvj3yEIpgStAmLWITME9pK7vU55vxytFAUsHM=;
 b=oJTlDd0e3bNS0y3hZ7z001twfKOjqlGolJT4vjPmYPRAC3rhQeMi5cV2F6C/VznwlGQOqtgMGn8gFsVbb/GBjN4Z0s9v6BbGc7Hveu8RjUhkQJVgZ4OpKoKlASnlFpK3kiLED5l1LfJ18WS3JcZuZSmM3IeR1/Txv7N8D3qKLMm3rr/PXm2SUFDvBeX2R5D94G9xsTZDtCPCppv5SVcqoo8sh3t6b60lolJUMBSwsAuavzb2rpZqGc2Ysq6SCtVmjyHMwKkv+sJWKy66GwKYLaAujpbmYCmAKlD4iexAgpyoBklQDO//13MK7US1WklawRHE6C35xWEvXh8GCQhSHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvzbd1Tvj3yEIpgStAmLWITME9pK7vU55vxytFAUsHM=;
 b=vWuPhZt0bzoOsAExSVEQK4mtXp/+PrBcZKUqHh9aT7EBdQfrExGihhucZOIzMz9qAtSmlP958K7kR8LBu4Dp/oQ+L3qLzm7VauaqgHGcAgXfxIx46pjZnDAopF9mHJAwNRkDIKL9nz6fy3FO9+9JA8UXyN2xC5ShI13xi5A/tSU=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by JH0PR03MB8811.apcprd03.prod.outlook.com (2603:1096:990:a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 07:04:35 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9434.009; Thu, 25 Dec 2025
 07:04:35 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v11 06/12] media: mediatek: jpeg: fix decoding buffer
 number setting timing issue
Thread-Topic: [PATCH v11 06/12] media: mediatek: jpeg: fix decoding buffer
 number setting timing issue
Thread-Index: AQHcY3DnIkcjEUvs7ESpg7G64+KKg7Uk4VyAgA0xNAA=
Date: Thu, 25 Dec 2025 07:04:35 +0000
Message-ID: <eeb28d5e47f581db5d7dc0428b25750441853753.camel@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-7-kyrie.wu@mediatek.com>
	 <043630a657ff5403b74202f6a856ff4bcfc6a192.camel@ndufresne.ca>
In-Reply-To: <043630a657ff5403b74202f6a856ff4bcfc6a192.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|JH0PR03MB8811:EE_
x-ms-office365-filtering-correlation-id: 554449d2-526f-4d4e-a9a0-08de4383dca1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Yzd1YkZ4azFETU12bVRmbEFrdWhGdnlzUnlMUFhtdEhZMFJXKzRHcjFYNFpK?=
 =?utf-8?B?dEdVSU9NbE9kZmpmOEtnOGZCc1pFaE02R0xXMExHSVUwZFc4Y0xWMEhZdEFy?=
 =?utf-8?B?TDFnZFN3NVRMY0Z4K2Z2cG04UUs5TjhFZmtTaFpnS0w4NUhTOG8xR3Ntcjhh?=
 =?utf-8?B?SU9TYUZXYURGM2NUR0FMbU9SK0Y3Rk1tTHVaTHRSVnprK2M2dUhqQURzekpp?=
 =?utf-8?B?Rk9HbWZDSkthTEUvenRzeFB1NjZ4bHE2SldPenRmVWtGLyt0VEJQYk1icExr?=
 =?utf-8?B?bmR0bDk3N1QxaE4yeTRYWmxlaEtoQklLK0duOXEvcTJ0bXNHWHlvbnQ3emRm?=
 =?utf-8?B?b0dWbHlPdjJkMEhNWUFDdjUvRWdNOURCalpFTTMwemM2RXFEdGEzaTRtUHBW?=
 =?utf-8?B?MllwTXdCRXFjcjNPcmw1OW5tN0trekFTK0xESUVOWDRINHFkT2tJYVlGK2RG?=
 =?utf-8?B?VW90WGpwTGNKNWZsdE1RTVF5Qmo5V2s1UTRtNEhPVlNkamtJcWkxVjI4amgx?=
 =?utf-8?B?ZTN2dmpieEVEZEUxTkIvMFAyYWJxbDd0U1hoL0NFUGdmQnRpUnE2MXZseGlj?=
 =?utf-8?B?L2U0KzFoUVFmSStVd2sxbnJmcVkwNy9kcThOT2NDMjY3d3prNk5SUVRGc3ZM?=
 =?utf-8?B?NFI1aTdhbzZqcWRQS1p1aVBiQUJvcGs2YlZneWlOazg5TzNSV1QxSFJaTVIx?=
 =?utf-8?B?WStDWlcvL3VTcm43ZU9EQmFzbnR2M2JEVlFLQ2UwVVNMWXI4cE5sOG1xaFU5?=
 =?utf-8?B?T0QyWU1UK1AxSjlNRkhZd3NkOXYrOXlxaVZCMG1EQ0VrK1R2Ym1rVjh6YlJp?=
 =?utf-8?B?NFRwK2wyZGpTd1R0UlZHQ2ZYRE4yb1l3K0tTWGt5UVFsaHlpa0tuTk5pN0dk?=
 =?utf-8?B?and1OHArTVJlNTNXazFrNnk3VG1tVkpINnpNU21EMlFHSTNaV3ZMWmlHTHNS?=
 =?utf-8?B?Ny9DUmxEQ2ZFMEE4b1hHL21EVE15WTBYaEVRaVRVQzVvQmVaODlyVVZWSDMx?=
 =?utf-8?B?aWRMRlNtSHNaRmszSnZmMm1Qa2VyNy9pY3pablhId2dleHFyL1lGb1B4NURB?=
 =?utf-8?B?YlZwTXEyblYrOGloSENhOUJkT1dkTThuNDA0ZDV3NHYydU1RVC9BRFNxL2sx?=
 =?utf-8?B?U3JKUHBNcHFUcGxtOEl2VTZ3Rnc4SVkrb0JUbHVhZTg3NGZXRWtERmUycE1D?=
 =?utf-8?B?V3FXejl0aDNkVjJHeDRmTnhJbGZrd21TN2Y2bXFWbjh6aWdlZTNFOTVhanNk?=
 =?utf-8?B?UjE1bEZIazllQkNFTnY0eHNXRU1LbDJQU3MvZVd2OW9BVVhNa0ZBbUpQOUhJ?=
 =?utf-8?B?bUduQ2c1UmtkcmI1M3lWaE4rdVlvUWFGYXZrZGp6MmpzU3lLTHJaalRQdXlS?=
 =?utf-8?B?UHRtK2JoUzA5UzVqZlMwQkYrSmgxVFRHUVRTbmdtREpIM1JLeDBMMUtpcjFZ?=
 =?utf-8?B?OU4vSFlSZ2U3aEM0OUUrME5ZWXB2bzZka2txT2VJMnhzZ01hTlNacExFYVdN?=
 =?utf-8?B?SEQwN0dMeGlSNERKSEI4ek9KcjJDak9vYzBlUEU3em1Wb2d1NytQSmlyRlFr?=
 =?utf-8?B?Rm9OSDNmTGpEeXgxcEJSTHNOenFFMkY3UjZ1WCtIMCtOYkpncDlHcVpSdTlP?=
 =?utf-8?B?bWJWV083UkJISWhYNFU4NVEyNkVFeFdPRlJKU20ySndqMnEwZDFEcWVrRVUw?=
 =?utf-8?B?L2ZlR2JScHAreHQ3MVQ0aWF3KzVRYzVaQVZmUlhTeHNPbmswUVlJd09Vb2E4?=
 =?utf-8?B?d0lpdTNtYk00c3Z2ajd3enAzSjN6WmI3M25uM3JxL0NhZ014UnBNRitYQ3Q1?=
 =?utf-8?B?R3ZlMkVnMXdxWmFYS2NqR3RwYzBqMWZvZjRiTm5nNlpRZERIVmdwUUhZN3gr?=
 =?utf-8?B?VU9WWXhqQWJiY09XeU8xck1tNXdyUUUwQ1hBMEcydmF3dmczL1plemdtT2JW?=
 =?utf-8?B?c1hpbjRNSGhVN0NGYTc5bURJTHRnUm5udDRmVlBLd1RwMFhydHRXalk0Rncr?=
 =?utf-8?B?NTg1dkF4NlY4V0RBcUp2U21MNU0zRld2bmtKeXVrbUFSVVowdWZRa3hqb29i?=
 =?utf-8?B?NGxuRkdGVDFmMFBYVFlZc1kxZ0c4V1ZvdCt0UT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmRJWTg1NCs4RkFySFU5VXNCcVlHRUhUV1FRR2lEcDFxS0ZQMWR5UEoxNjd3?=
 =?utf-8?B?UE94bVRuZFlBMDFEdVJRNENLMmRVbzN0TFVtQkZYT1d4UHZoWTdVbk5vdmxV?=
 =?utf-8?B?V013NDZ6NVJrWDFnMU1pdnVKaTVmTVQ4SFZnU0lqZmF4VzBic3VqdzJoRFdr?=
 =?utf-8?B?bjZ6YXhHN1NkaTJUL1JUWTJuTjJ5OGxVN1U0d0EvT2c0bjBBNmx3OEF0U3dZ?=
 =?utf-8?B?R0lDNHBESjdIZlFQSHpTSVdJa3hRdmUzNUUrenpJRFZMemcyUjdKNTFEVFhH?=
 =?utf-8?B?Z2ROK0JiMm5EeGQyMXNiUmVBblBvWHRQNHpSa2JPa3I2UzUwaG9FUjJrd29n?=
 =?utf-8?B?TEdjQy95NkhDZi8wODk5d0QwTUN5dzhzSktRRHRXMFZHanRDVDR6ZmZFV3Vz?=
 =?utf-8?B?OThONWFldkVBOHZ5VWZIT2ZwczZCRDJXV1BzdC9DR1FRT09pUHZOOXlVK05L?=
 =?utf-8?B?b2NEekpzU0o1T2tDeXliRnVETkJEU1RhK2NFQURRZUliWGNxdU1hajVsWXM4?=
 =?utf-8?B?N2JydEFPci9kWUlDUGJObmdGaHhHSUVHRnpHbTlmdnZkL0VGWVZ4RzZKYWdP?=
 =?utf-8?B?UG0zOW5lYy8xZzFNUFZ0Z2ZkUEYvMWJUU2J1RC9RM3g3d0cyWVp1a2tUWjdt?=
 =?utf-8?B?RlpscDJURkh4MjliaTRSKzR1MFlSeXlFTzl3MEpKWWJWT1FZN1p6WTYvMHJm?=
 =?utf-8?B?VUNsc3gwWkxSblZiS1I4dlEwTUdSYk04ZG5YMnZzOWgvUGJBczVNbm1KUDdO?=
 =?utf-8?B?NnNZUllRRWlGaG1NUkdvR1NDYlhzcVFkZlRyN0ZCbUJISktCN2lzVEtWVklZ?=
 =?utf-8?B?L3hzYUYxWm1paks2SmpaV0RSRUpkRS9IU1JZSDFkWmZXa1NiemloWWJQY0xm?=
 =?utf-8?B?cTBOQnRMVDl4NUhGY0RsenIyUzFKVmY5M2c2cUxhajNUWVhjR2VWc0h3TEZx?=
 =?utf-8?B?aktOMFozUWlzQ2JneTgrQVFnR3dBY0ZUYldTRHZsYytoeWRjTlBWUTk3SWxu?=
 =?utf-8?B?cG9qalN4dnNON3hKS2xUOWovS0JWdllRSTNMM2xNbi9vWHBndDY1VWVXQlpB?=
 =?utf-8?B?QTFQMGVkVmIrZHpjazFvelJHL1RPK2ZYdDdYQTkxT0xHa3dKSEgrOEdjbmx4?=
 =?utf-8?B?VkllS1ZQODdSWmo3U0ZLN01UZWtHQnlCZ2NWcmVIL1J3bkNTa3p0TlVMeU5i?=
 =?utf-8?B?OHYrTERJSEgxalZWQmN2eWFOMjlORWJPNVJPNExFTWdnaFVNR09yTUs4ckh3?=
 =?utf-8?B?c3ViNTYzTE1hNG4xTitoNmFFN3E4ZHlGanF4T1g4akRGODFMaWZrL3p5VzVZ?=
 =?utf-8?B?WDViRmlHMXJMTndMVE5vM1BWUytNSVZMSG9TZjNwdS8rS3VYNVlRazJLZHUw?=
 =?utf-8?B?Z3g4NFk4Z1Bxa2hNK1JKTFhvbmZtVjRoWERrRUw5VDg2NFpiNE0rQ2ZnUmow?=
 =?utf-8?B?YXpGSTNzM1FNdUNtaUhqcmd5dUkzMGNYcTJlaWRjK3dSZlRPSEJxZnlQOTkv?=
 =?utf-8?B?dlF1ZnJnTmRWNWhkbGJuTUNhMnJ2KzU5RW9VbXZJb3VOTC9TU1FaSlA3dEhi?=
 =?utf-8?B?TlNNc1pPemRRVHUxaGtWQjBmWkZZUnlyYXhTNWd5d2llQlJ3WHRXK1dDQWpG?=
 =?utf-8?B?S3pRSnJ0cUZiamV0QXVycDhaT0VrT1Q0SWVnb3ZXbVI0TG5rQ2dpemJkaTBq?=
 =?utf-8?B?SjBldzFXUXBKTlJsNnh4S0RHMk1KRnIvZHdaUWlHYlA0MHpXam1Nay9FL01l?=
 =?utf-8?B?Q2VodHNxTmJQVE9ZWVdEYXk1SEpRQjBKelVhRy91b1VWdTY3L1V0bFdKano2?=
 =?utf-8?B?L0UxQnN6TVl6VUlIaHlkYitMdjdhT3F0MmkrQkx2TGFKcUxvRVhhWjlpTm5h?=
 =?utf-8?B?NU9CY3R2RWpkZVNCSUJNT1NlRXpGTDhjMDhzZjM0U0E3eEVkRERacjY5Z1pD?=
 =?utf-8?B?bXVrc3IzVGZoTE1vejYvTUd3VEQ5aGlmM2N5OTErdytUQm16Vjk1UVhuVWhZ?=
 =?utf-8?B?dll5Q3BqRHpLemR1Rk1VL0RwMVpvWHcvYmRoVjNVMXNNem5QbEtBUFJBMHo2?=
 =?utf-8?B?OUUyaGcrMUZGeFVCd0pqeDBMN1RyRHZTS3hKc2FtQzN2Ui9KYWUxZUtiZEtK?=
 =?utf-8?B?MHlyRE9TclBFRktidWtTYW94VnhEZERyczZYSGRjcisyM25RNVc3QTRkc1NC?=
 =?utf-8?B?MXl2WEJLdnN2cFBMcjcxVmpPMHdUY01EaWl6MVVneWlkRzRTQ3A5SmRjempB?=
 =?utf-8?B?dVk2Zjl3T29SK3VlYlVlNXVzOUVPSW1ZMDdtVTdiWmRNdkdBUHJESGd3ZXMr?=
 =?utf-8?B?QVhobU9wTjQrU1Z6Yi9pQW5aUm9tOE1GdkVreCtQQkV5TFk2T1ZZZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F728FB1A7B6AF8419A19540735B7171A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554449d2-526f-4d4e-a9a0-08de4383dca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2025 07:04:35.3787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: arsud5DUl8FExcpyi2Fu69BDfOozCeEwYPL+ig37e96mMyk0qO1NbCJxZ43nFEOl4VrZ+eOnCGjsrK4B4d5nQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8811

T24gVHVlLCAyMDI1LTEyLTE2IGF0IDE2OjM3IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIG1hcmRpIDAyIGTDqWNlbWJyZSAyMDI1IMOgIDE3OjQ3ICswODAw
LCBLeXJpZSBXdSBhIMOpY3JpdCA6DQo+ID4gbW92ZSBkZWNvZGluZyBidWZmZXIgaW5jcmVhc2Ug
Y29kZSBpbnRvIHNwaW5sb2NrDQo+ID4gcHJvdGVjdGluZyBhZXJhIGZvciBtdWx0aS1jb3JlDQo+
IA0KPiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyB0ZXh0LCBwbGVhc2UgcmV3b3JrLg0KRGVhciBO
aWNvbGFzLA0KDQpUaGUgZHN0IGJ1ZiBwYXJhbWV0ZXJzIG9ubHkgbmVlZCB0byBzZXQgd2hlbiB0
aGUgcG93ZXINCnNldCBzdWNjdXNzZWQgYW5kIHByb3RlY3QgdGhlIHNldHRpbmcgYnkgc3Bpbmxv
Y2suDQoNCkkgd2lsbCByZXdvcmsgdGhlIGNvbW1pdCBtZXNzYWdlIGluIHRoZSBjb21pbmcgdmVy
c2lvbi4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KS3lyaWUuDQo+IA0KPiA+IA0KPiA+IEZpeGVz
OiBkZWRjMjE1MDAzMzQgKCJtZWRpYTogbXRrLWpwZWdkZWM6IGFkZCBqcGVnIGRlY29kZSB3b3Jr
ZXINCj4gPiBpbnRlcmZhY2UiKQ0KPiA+IA0KPiANCj4gRHJvcCB0aGF0IGJsYW5rIGxpbmUuDQo+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEt5cmllIFd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBl
Z19jb3JlLmMgICB8IDkgKysrLS0NCj4gPiAtLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYyB8IDEgKw0KPiA+ICBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMgfCAxICsNCj4gPiAg
MyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtf
anBlZ19jb3JlLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9t
dGtfanBlZ19jb3JlLmMNCj4gPiBpbmRleCBlNDVkN2U4MmI4YTAuLjVmZmFlZTRkY2QxOSAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pw
ZWdfY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVn
L210a19qcGVnX2NvcmUuYw0KPiA+IEBAIC0xNzQ2LDcgKzE3NDYsNiBAQCBzdGF0aWMgdm9pZCBt
dGtfanBlZ2RlY193b3JrZXIoc3RydWN0DQo+ID4gd29ya19zdHJ1Y3QgKndvcmspDQo+ID4gIA0K
PiA+ICAJdjRsMl9tMm1fYnVmX2NvcHlfbWV0YWRhdGEoc3JjX2J1ZiwgZHN0X2J1ZiwgdHJ1ZSk7
DQo+ID4gIAlqcGVnX3NyY19idWYgPSBtdGtfanBlZ192YjJfdG9fc3JjYnVmKCZzcmNfYnVmLT52
YjJfYnVmKTsNCj4gPiAtCWpwZWdfZHN0X2J1ZiA9IG10a19qcGVnX3ZiMl90b19zcmNidWYoJmRz
dF9idWYtPnZiMl9idWYpOw0KPiA+ICANCj4gPiAgCWlmIChtdGtfanBlZ19jaGVja19yZXNvbHV0
aW9uX2NoYW5nZShjdHgsDQo+ID4gIAkJCQkJICAgICAmanBlZ19zcmNfYnVmLT5kZWNfcGFyYW0p
KSANCj4gPiB7DQo+ID4gQEAgLTE3NTUsMTEgKzE3NTQsNiBAQCBzdGF0aWMgdm9pZCBtdGtfanBl
Z2RlY193b3JrZXIoc3RydWN0DQo+ID4gd29ya19zdHJ1Y3QgKndvcmspDQo+ID4gIAkJZ290byBn
ZXRidWZfZmFpbDsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gLQlqcGVnX3NyY19idWYtPmN1cnJfY3R4
ID0gY3R4Ow0KPiA+IC0JanBlZ19zcmNfYnVmLT5mcmFtZV9udW0gPSBjdHgtPnRvdGFsX2ZyYW1l
X251bTsNCj4gPiAtCWpwZWdfZHN0X2J1Zi0+Y3Vycl9jdHggPSBjdHg7DQo+ID4gLQlqcGVnX2Rz
dF9idWYtPmZyYW1lX251bSA9IGN0eC0+dG90YWxfZnJhbWVfbnVtOw0KPiA+IC0NCj4gPiAgCW10
a19qcGVnZGVjX3NldF9od19wYXJhbShjdHgsIGh3X2lkLCBzcmNfYnVmLCBkc3RfYnVmKTsNCj4g
PiAgCXJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoY29tcF9qcGVnW2h3X2lkXS0+ZGV2
KTsNCj4gPiAgCWlmIChyZXQgPCAwKSB7DQo+ID4gQEAgLTE3ODQsNiArMTc3OCw5IEBAIHN0YXRp
YyB2b2lkIG10a19qcGVnZGVjX3dvcmtlcihzdHJ1Y3QNCj4gPiB3b3JrX3N0cnVjdCAqd29yaykN
Cj4gPiAgCQkJICAgICANCj4gPiBtc2Vjc190b19qaWZmaWVzKE1US19KUEVHX0hXX1RJTUVPVVRf
TVNFQykpOw0KPiA+ICANCj4gPiAgCXNwaW5fbG9ja19pcnFzYXZlKCZjb21wX2pwZWdbaHdfaWRd
LT5od19sb2NrLCBmbGFncyk7DQo+ID4gKwlqcGVnX2RzdF9idWYgPSBtdGtfanBlZ192YjJfdG9f
c3JjYnVmKCZkc3RfYnVmLT52YjJfYnVmKTsNCj4gPiArCWpwZWdfZHN0X2J1Zi0+Y3Vycl9jdHgg
PSBjdHg7DQo+ID4gKwlqcGVnX2RzdF9idWYtPmZyYW1lX251bSA9IGN0eC0+dG90YWxfZnJhbWVf
bnVtOw0KPiA+ICAJY3R4LT50b3RhbF9mcmFtZV9udW0rKzsNCj4gPiAgCW10a19qcGVnX2RlY19y
ZXNldChjb21wX2pwZWdbaHdfaWRdLT5yZWdfYmFzZSk7DQo+ID4gIAltdGtfanBlZ19kZWNfc2V0
X2NvbmZpZyhjb21wX2pwZWdbaHdfaWRdLT5yZWdfYmFzZSwNCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2RlY19ody5jDQo+ID4g
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMN
Cj4gPiBpbmRleCA1ZjE1NTdkYWZhZDYuLmIzMTQyZGM5YmU4NSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMNCj4g
PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVj
X2h3LmMNCj4gPiBAQCAtNTEzLDYgKzUxMyw3IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnZGVjX3B1
dF9idWYoc3RydWN0DQo+ID4gbXRrX2pwZWdkZWNfY29tcF9kZXYgKmpwZWcpDQo+ID4gIAkJCQl2
NGwyX20ybV9idWZfZG9uZSgmdG1wX2RzdF9kb25lX2J1Zi0+YiwNCj4gPiAgCQkJCQkJICBWQjJf
QlVGX1NUQVRFX0RPTkUpOw0KPiA+ICAJCQkJY3R4LT5sYXN0X2RvbmVfZnJhbWVfbnVtKys7DQo+
ID4gKwkJCQlicmVhazsNCj4gPiAgCQkJfQ0KPiA+ICAJCX0NCj4gPiAgCX0NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2VuY19o
dy5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdf
ZW5jX2h3LmMNCj4gPiBpbmRleCA3ODVkYjViYTQ3NzAuLjgyYzk3MTkzNmM0ZCAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5j
X2h3LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRr
X2pwZWdfZW5jX2h3LmMNCj4gPiBAQCAtMjQyLDYgKzI0Miw3IEBAIHN0YXRpYyB2b2lkIG10a19q
cGVnZW5jX3B1dF9idWYoc3RydWN0DQo+ID4gbXRrX2pwZWdlbmNfY29tcF9kZXYgKmpwZWcpDQo+
ID4gIAkJCQl2NGwyX20ybV9idWZfZG9uZSgmdG1wX2RzdF9kb25lX2J1Zi0+YiwNCj4gPiAgCQkJ
CQkJICBWQjJfQlVGX1NUQVRFX0RPTkUpOw0KPiA+ICAJCQkJY3R4LT5sYXN0X2RvbmVfZnJhbWVf
bnVtKys7DQo+ID4gKwkJCQlicmVhazsNCj4gPiAgCQkJfQ0KPiA+ICAJCX0NCj4gPiAgCX0NCj4g
DQo+IE5vcm1hbGx5IEknZCBzZWVrIGZvciB0aGUgY29udGV4dCBpbiB0aGUgY29kZS4gQnV0IEkg
dGhpbmsgSSdsbCB3YWl0DQo+IGZvciBhDQo+IHByb3BlciBjb21taXQgbWVzc2FnZSwgYW5kIGRv
IGEgcHJvcGVyIHJldmlldyB0aGVuLg0KPiANCj4gTmljb2xhcw0K

