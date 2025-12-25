Return-Path: <linux-media+bounces-49522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AD7CDD691
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 08:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4570301A1AE
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 07:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E9F2EFD89;
	Thu, 25 Dec 2025 07:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ADI3bsFc";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="L6T3V9Yg"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821BB21C16A;
	Thu, 25 Dec 2025 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766647088; cv=fail; b=DPemoijVeJPY4nMcQ9H6RF82HhOijS6ANpLXzIRKvgYUusWpK3vX1di96W0rLVUVfQKz5qqZ6YgWfLmE1fv/xtEijWVZwDtEG9kcnTmLen8iN+cjERdrGWn5LFqqf+ELufiKPSO+OUdePW8K9L2zNzBzFhXeU6Y3JHZEfFPxmWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766647088; c=relaxed/simple;
	bh=JiayjpDCq/y2dKLL6zcFJ+LlNZyPdMDtrru5jQ4ilXk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FUmpHerY7k30wPR0eyxk2SRJAx0OYZJ/FB6NtcZAVhSf+DhEPf7jtSYMZBRj0ikHc7f8D2raX2kIcMiWawbnE5JOWNirAiVKnQGfwroQZz4wTVIVkkyXiUlOGhV19CY/3+sCk63nXIe+aMWNJ+7A4qQtZIKWzQ3NsXnsLs1rXKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ADI3bsFc; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=L6T3V9Yg; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d76acd24e16111f0b33aeb1e7f16c2b6-20251225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=JiayjpDCq/y2dKLL6zcFJ+LlNZyPdMDtrru5jQ4ilXk=;
	b=ADI3bsFcQL/Log9maHic6i12nnapQvfr+Wi+jBQf2QlBRZFxw0y2di0cbmeptfT7r2N4smkGl7bOV0uq45T90HqQVZrX9FeK/AgTBhG79LLjKwrG5eFiY8zK4vkd/Gfill2Dkej3gSVukdVuirWYi7ZPMNt0oIiF72E1HFaJLt0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:9e104a7b-3e7e-43c7-b64d-677ed3e7da55,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:9c95e628-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d76acd24e16111f0b33aeb1e7f16c2b6-20251225
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1286341812; Thu, 25 Dec 2025 15:17:59 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 25 Dec 2025 15:17:57 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 25 Dec 2025 15:17:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcH5yCIwDlzqRugtM3P2FYRJv0eH9r0hMX82MA4fP9nq4BQMNkBA2zKe9yuRr51Fafml4Y9cIHlpX7+u22JcAxdLRwHvAtF27QuhekeoRYydJLrVnGhE8F2OwvRFKcUGIDSaigmMPNnGzqfjr3NhIKCA2+BNMGqpAYOzIBj2MjnAAZwcxRI68U3LpBxOhDLHx8O06QzYbZrNhYpP1e7wyv6Hkdd3JbFGOptk1nq09N0KW35s/es2cnNosi6MA9F+OZkxBGIaaP3oZyawsbg+/66iED8v4K81Sf1dhKMRAN/+jEy5+cOd7ADPGjkfA+t2KYcdKWBxpB/HSiq8zDYIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiayjpDCq/y2dKLL6zcFJ+LlNZyPdMDtrru5jQ4ilXk=;
 b=pL5N0SfG2WUdKc3Qs2HQYqs5p0K+uDzf9aurv5yzIgnVI9LcRiQB+kWqqP8P87q8TvnMvYZ1TI8dPRPBM3Kp+hQO+YAExpd63t5U5D9z2TQqdJt9nG8PEUen3KvDCH+lofRwZcs2UJ92JxEOUMXkp6bslGgH1n7qxA3Yshj1YtvbmxMiQCBrqi0DUGKLfPZ4+yU2aQ4ZD4kvvdmUqoKULqNaabVi/EL2sQW+COUgmoD9mSwo6H61h245XsSRawkb5af1jRyxniLn5ssRxKcmj96IzLx7EbL9E+Qw311mkzeXt5aGeCn9nPoJ6OsgrQ/P/FTc+eIWqkvfSm9BOWN7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiayjpDCq/y2dKLL6zcFJ+LlNZyPdMDtrru5jQ4ilXk=;
 b=L6T3V9YgDSXkyH4FsevRO42TRsN1JyHk2PpxB3KfgG+HOg3sQ6KVJwpRJhU1ITLL69lJvaqADZhZXodBOubu462uJ/Vjx/m8C3NwQwL4CpZp+DTQqWUsxl5VBBYIuK+2ZUKWSCLTpq1PHtJ0AzHRPl/jN3GsZNH5S3usW8dUOOI=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEZPR03MB7754.apcprd03.prod.outlook.com (2603:1096:101:10d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 07:17:55 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9434.009; Thu, 25 Dec 2025
 07:17:55 +0000
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
Subject: Re: [PATCH v11 12/12] media: mediatek: jpeg: add jpeg smmu sid
 setting
Thread-Topic: [PATCH v11 12/12] media: mediatek: jpeg: add jpeg smmu sid
 setting
Thread-Index: AQHcY3DIfa6i0rPQrES4xD7KDrMCmbUk5IKAgA0xyAA=
Date: Thu, 25 Dec 2025 07:17:55 +0000
Message-ID: <b1f6b8f394ccef920f8838a01967dee7e4326bf1.camel@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-13-kyrie.wu@mediatek.com>
	 <086b940b975a9c0f9cb5d5cf2fabe21ddb188821.camel@ndufresne.ca>
In-Reply-To: <086b940b975a9c0f9cb5d5cf2fabe21ddb188821.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEZPR03MB7754:EE_
x-ms-office365-filtering-correlation-id: 26b48d43-51af-41fe-7f6e-08de4385b941
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WCt1QlFSQUFUT2Nwa1o2NFp3SUd4Qld6N1c4dmFWOVU4MHhiL3NNYkxTSHlW?=
 =?utf-8?B?cGlVc2xIcE9zV1EyaTh4bk0xbDRHRU1xZzZVaDJSb3lUemRGeVpiNUJqWHl3?=
 =?utf-8?B?Sk9GZ0k2OG5QYStFTGIrTUZzeFUvclVaWVZqemUyY25KVkVuTnNxakloMUE1?=
 =?utf-8?B?b2pIbzdaRWhMdElmQTB2RENGYkMxa3B4N00zQjd2cEkxU0FXNTBVVW5GUHEx?=
 =?utf-8?B?M3NyZEdWSGRsY3pQSFZEZzJKSlo3OHQwbkJmQ0RYQ3JPajVFVHdGWXMzbEto?=
 =?utf-8?B?Nk1XNlA1cEVWZklxYnR6a0NVU2MwMjlOUnQ1N3QxdC95RU9qb2Nvc0RqZ0dT?=
 =?utf-8?B?RFNjY1NvVGwrbGgrRDRTNEdBRHFTc01zVVJTaXhmQkhaUE9MWFdCUmpLQ3VO?=
 =?utf-8?B?dkp4Q1dhVlZVbFNaYTBta2todjk0ZkptVnhQT3lYdVNsZzEvSFdjS0g0c2s2?=
 =?utf-8?B?TjBUWHlRdkFLK1UxUkhOMHFKdndDdHZ4WUdSQTZBQ2lxWjdvQnVmZG96Mm5S?=
 =?utf-8?B?dlVnU1IwVzh0VWRuZjZzbzZuZ1QrTTl4RnFKTGp2b1JWK0s5OFptT2JaRkND?=
 =?utf-8?B?ZlI4TUVudWV3V29OYVEwMHhLRWF4NkRlQXoxSHZDais4R0I2T1Q3TVBNNUhY?=
 =?utf-8?B?OVlleVlqNXpkSlJnM2pEdkcrMGZ0eC9tZFFmYTFBbEZiMjBtbWU4TEFORDl2?=
 =?utf-8?B?M09iT2JRYjhmdDFSWnFrNUx2b0NMWEVhOXhIQ3lhd3NsZkVzQmkxNDV2OHRp?=
 =?utf-8?B?U1c2RWRlSTdLcXBwL2NhWjVPeWs0Y0RncGk1R0U0d3ErZkpuTkp0V3c3N1h6?=
 =?utf-8?B?OXVseTRCL3c1Kzh2OWcxV2RXZENUeFlqMEgxc2tub0Rucm0xNytMdlBXNFdF?=
 =?utf-8?B?SFFWdytEMWVaay8yYWJUeXZSVFlBRWFkVXVLOU1JZW5rQ09oM2d3cHhXUlZ5?=
 =?utf-8?B?OXV5Y21GUmpwL3N1aGllYnhSVHZxRmpPUGoyQ1RWVyt6NGJGOVlQcm1neTJs?=
 =?utf-8?B?VFZyWVJ6KzVGQWVqVEZZSzZxaUFPSTdUSi8yOFNSYmdleDA2Q1BkYlNEUnpM?=
 =?utf-8?B?a0JaSVMvd0RpWGZ1bFVJMFJXa1hBZ1FuVXlWVk5GanJjcFZEKzRwWmdVVHJp?=
 =?utf-8?B?enpyM3JnZGN3TXBwRE56eG41QnVzVlpuZWRkT3ZYaC9HL0YzTmlkWmc0ZVd6?=
 =?utf-8?B?eVBMOXNKbUQ1NzFLNVZuWE85U0xwOWFXc2QzcVhmOGo4YnFubXVOOGVGMUoz?=
 =?utf-8?B?Zm9LMUFJNVl5MWY4NDN3NVdEVVVLVzZaRHh3TmdCMk52Sy9DcGl1SFp5NjBl?=
 =?utf-8?B?ZXdqMGlYcnVITVJhM2x6MG0zMGZLTk5iYzhpWXRqbzF5MnU2ZTBMUFUvcnNo?=
 =?utf-8?B?Y0tjYUlKNWNaZXUyK0llWnJ2UDRNalkyUncyMXFQOEwzNlhZd1ZWZU5pM1pl?=
 =?utf-8?B?M3h2ZzFxbElWSzRkYktLQW1ML1RtWHM3VVd0QTRIQmVkYk5PT0grSkUwODgy?=
 =?utf-8?B?ZFBIOUhxWUpkbDBibFBQNUlrY2czazVaajJGTG5ySmtPajZyT3VuLzlPb3Qv?=
 =?utf-8?B?Y3BOcllqR3pieS9MUDEyMzZEZnNjaUU1bnBwd1hyQnlIU2YzTHYrQ1Q4bERI?=
 =?utf-8?B?WmR0SGJPMmtSZ0xic1IxZ2tMQU5UajVVMHdnNEE2TFdHUWt1c0dMeTUvVXN1?=
 =?utf-8?B?T3A3Sm4wWEdKZ2FmVzRRZzQwRXRjaFRnUlE1NVRMaEh2NDBkZkV2TG1rNEl6?=
 =?utf-8?B?enNEdFZmYldZQlc0MGlRQXkvemVXRUFPYXVGWVFmQWhYU3ByazRvS3NESVVu?=
 =?utf-8?B?Y1dwZHJJY2FmTDBUd2VsaWNLNkdPSkxGWTVMTHVCRUtBMmFHUEhDSlNGZnJU?=
 =?utf-8?B?UnMvNVNTTmo5cnZDWTJ4aExNakFvKzFUcWVNQXhqbUVzeEdPcUR3MGJvSEFR?=
 =?utf-8?B?NjA2aFhVeUMxajVCTFY2QXNlQ0lKV21rakx4VlBqU0RleG4vZDVsWDE3RDZL?=
 =?utf-8?B?NHlaeUwrRGUrdEhlWng2TVlEd0pQUk9BK1Q5STk1OUhVelNkY1Ewb3Q4VXVO?=
 =?utf-8?B?dm54V1NyK0l0Ym13WHpZeE9ZN1psdHU1U0dtUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWNEamM0Um14UnhOYU5VeUFkdW1ZRTZsLzVxakdERGNKQUhFY0FLTEQzOHU4?=
 =?utf-8?B?OHNER21CaHVzMWVkYnBPWkFHMkgwQVNkK3dKdzcyQjBXa1lZaHZSREJYSFY4?=
 =?utf-8?B?UERHZlVrU1dwdjc5WmpoekZ4OFNLelVncythQ1RDejNxN3pkdGQ5eDVjVVlt?=
 =?utf-8?B?VGtuaE5lVDZzMlh3c0N0Rzl6WW9LSC9neEFEV2duL3JKQlV5LzdmMHBHZWtp?=
 =?utf-8?B?eW4xclVzNE9aZ0lacTdCTllQTk9GTzNCRjY0RHYvSFZqSXdxRngydnVxZyt6?=
 =?utf-8?B?QXBnQ3RLY3ZNM1ZTZmVabEhKVWZUWTdqMS9qWUV0NUhiSXJrVk1vRTB3QWpo?=
 =?utf-8?B?eHJjNVhCdGZGazM1cEpVNFlSVkN0bmRyT3FLd256RW4rQ2o3Q1hMSGRaMngw?=
 =?utf-8?B?S3pHa1J0UmlSbkdzRE9Fa1RqdGxycVpuUWxKYzE4Ni9oLzVyY1VqcEIrcUdE?=
 =?utf-8?B?TGVWWWhXQW1aVWpRMTU1QkwxLzhXeFlaODQ2RHpxRGxqYlAyaGVFVEdaMEdC?=
 =?utf-8?B?S3FsSXlGeHJOb0w3ekdvc1VzWk96R3E4bDlrK0JRTGU3eXc5aVlTWGM4V1Ax?=
 =?utf-8?B?QXRreUJ0TUFaM3lHQnd1bmlaYkozSjgrLzNrL0hKZ05QVGdzZ1NPSUhTUXBU?=
 =?utf-8?B?ZStwYWRzUjdhTmVReitsNjEzY1RVUUpKWXZxUmcza29wTWwrQlFnTGJUZisw?=
 =?utf-8?B?SklGbVA5aWozZDU3Y0E1MFpNTEpoa2srZW0xUUg2aEVZMWdRUVBEamh0aGdF?=
 =?utf-8?B?Yko0YUYzNWtCQW1ha3pXbEZmUXVlUmd3V3pYR1h5dlFqU0tBRmNzMjlobWJv?=
 =?utf-8?B?d1NYdEVSM3ZJVHFlNmltT3czQXZLUU1VbTd5Z0ZwS3lxYVVRcWxDQnMzSVEw?=
 =?utf-8?B?V3kwZGJ3STFWZm1jSmd2MmNVZjlraGJodC9VNkpaemhjUjlXZE5QaW5NZ3pU?=
 =?utf-8?B?RjVtYlQrZ2xmdkNEcFpmcjNyREhsaThKMFNsNE5iak9iaFkxRDEzU1BVWFhw?=
 =?utf-8?B?OHZCRjl5YXY2ZXlQSTdmKytWQ3loNW9heXVTYlJFaWlMdFNYRXBNSG51dG1O?=
 =?utf-8?B?eE9SeldVdVF4b0RTRTBLMUdBY09icFlkcFlWS1BEL2xiMVQ5QkUvanc2bTJZ?=
 =?utf-8?B?MlJlL2hYcjZuc3R2YTc0WUw1U3FQdlhHb1hZaTBtczY1a0RxVFlsZDlVUGg1?=
 =?utf-8?B?bDA4NXozYU15YlUzQkZzNzRScmNCQUtWNnlwVVZzSXZScXp6V0cybkFNeGRG?=
 =?utf-8?B?MS8xbGo0aXdQLzBVY0FIUmszRHFnbmZpWUp5dE0weW04dVZPeHNQeGdVV0d1?=
 =?utf-8?B?L3VvcjhpMEZaUEpRRjRTcWdxc0NDblNuTUp3OGRFTmxiSlFXVC9hK1lBNnJm?=
 =?utf-8?B?cGFVNW5wdThxWTM3cWlRcWlXczRZempTV2JCS2xpMkFHT2lkVVh0bUpIWS9m?=
 =?utf-8?B?WkZxRFBHY1UzdGJEQlRsYUgva25nenBRb3VjeThoNjVwcjczS29WTVNvUmJ3?=
 =?utf-8?B?L3pudllKbndUbjBSbjh6WUFDSUg5SE0rbGV6WTdGN0pZb08rRjdZVUtOZjli?=
 =?utf-8?B?dy9yeU00NlhwVEhocUkvTmVFSVpyVVBzUkk4a2NwSVZoYWNjdDR5TnVONzU4?=
 =?utf-8?B?a0FFUXQrRTlCSFJ5b3Q0ZUd3VTJVSVZGT2RrOUVJZnNwZDI1TE5lNlRPcTJM?=
 =?utf-8?B?c2VieTRUS09hQXlKSnAySW1FYXJpTnhHSERQNnBtdzBzaWFSamlwSDliU0Z3?=
 =?utf-8?B?SjRISjFMQzJ1YUdmd0tEaStMYjJ5bkpzQXJMdE9WUGhFUUJhWkNhQTV1OGFZ?=
 =?utf-8?B?Y1RuRUwwQ3ZnVlI2TC9pb1ViQVkvRWVPTDlUV3FXQVJENzlYd0p0Y0lwWDNk?=
 =?utf-8?B?S2ZKUjY4NmQ3WUJLZW9MZWdsb1FPeVV3Z09zR0dpTUxWM1NKMU9DTW5qRnMy?=
 =?utf-8?B?ajg4WEMwVFF4TkVRWk5SNnh5WWdZTmgzOHVDY05iQ0FlTFZqbjU5MWhqMGEz?=
 =?utf-8?B?WnV6azRVWTdnWDJxMmNMajhMeGZxUExjVnpTWm9HbkJhZU4yM3lNaDBpZWpr?=
 =?utf-8?B?ZjdWcUFKalU2aEZSOHFBbEQzbEJLQStyR1RiTW1maTJyU2dPbnNEeDNPcHJ2?=
 =?utf-8?B?blljVFUvalNrS0pVRUhKQ29rNVUxMXAxSUtDakg5OU0xOFE4WnVTeHRsUEdZ?=
 =?utf-8?B?dEhJUnBQd2c3bmN2N0dWQjhHZytwdUJSZzIrWXptT2NwdGxmSUkrWTdDV0Rk?=
 =?utf-8?B?S1dJNmhEM01jcHNNaU9QVzFHR25Gd0lvcks4U21JVEw0OFlZSk1kUXhiK2tt?=
 =?utf-8?B?OWptMUhJU1pUMWpQMWNxNlpzb1pEdmVZTkhMWTZCTkdsMHpYSjg3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DABF423C54A6D4D92E5806668765169@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b48d43-51af-41fe-7f6e-08de4385b941
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2025 07:17:55.0748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pdPZLXUo5R0FJMn/ATGf8IjVLzFq1nN6L++i+LK/aBQzKTRsbHBKPeWVWFSmNMFSA/c9ctNnhd9bos5aftlftg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7754

T24gVHVlLCAyMDI1LTEyLTE2IGF0IDE2OjQ4IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIG1hcmRpIDAyIGTDqWNlbWJyZSAyMDI1IMOgIDE3OjQ4ICswODAw
LCBLeXJpZSBXdSBhIMOpY3JpdCA6DQo+ID4gQWRkIGEgY29uZmlndXJhdGlvbiB0byBzZXQganBl
ZyBkZWMgJiBlbmMgc21tdSBzaWQNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBLeXJpZSBXdSA8
a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0
ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMgICAgfCAzNw0KPiA+ICsrKysrKysrKysrKysrKysrKysN
Cj4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5oICAgIHwgMTUg
KysrKysrKysNCj4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVjX2h3
LmMgIHwgMjMgKysrKysrKysrKysrDQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210
a19qcGVnX2VuY19ody5jICB8IDIzICsrKysrKysrKysrKw0KPiA+ICA0IGZpbGVzIGNoYW5nZWQs
IDk4IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuYw0KPiA+IGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuYw0KPiA+IGluZGV4IDEwYTU4
OGI5MmU3Ni4uNjI1ZGZhODQ2OGUxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jDQo+ID4gQEAgLTE1LDYg
KzE1LDcgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+DQo+ID4gICNpbmNs
dWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1
bnRpbWUuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPg0KPiA+ICAjaW5jbHVkZSA8
bGludXgvc2xhYi5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4NCj4gPiAgI2lu
Y2x1ZGUgPG1lZGlhL3Y0bDItZXZlbnQuaD4NCj4gPiBAQCAtMTYxMyw2ICsxNjE0LDIwIEBAIHN0
YXRpYyBpcnFyZXR1cm5fdCBtdGtfanBlZ19lbmNfZG9uZShzdHJ1Y3QNCj4gPiBtdGtfanBlZ19k
ZXYgKmpwZWcpDQo+ID4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4gIH0NCj4gPiAgDQo+ID4g
K3N0YXRpYyB2b2lkIG10a19qcGVnX2VuY19zZXRfc21tdV9zaWQoc3RydWN0IG10a19qcGVnZW5j
X2NvbXBfZGV2DQo+ID4gKmpwZWcpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfanBlZ19kZXYg
Km1qcGVnID0ganBlZy0+bWFzdGVyX2RldjsNCj4gPiArDQo+ID4gKwlpZiAoIW1qcGVnLT52YXJp
YW50LT5zdXBwb3J0X3NtbXUgfHwgIWpwZWctPnNtbXVfcmVnbWFwKQ0KPiA+ICsJCXJldHVybjsN
Cj4gPiArDQo+ID4gKwlyZWdtYXBfdXBkYXRlX2JpdHMoanBlZy0+c21tdV9yZWdtYXAsIEpQRUdf
RU5DX1NNTVVfU0lELA0KPiA+ICsJCQkgICBKUEdfUkVHX0dVU0VSX0lEX01BU0sgPDwNCj4gPiAr
CQkJICAgSlBHX1JFR19FTkNfR1VTRVJfSURfU0hJRlQsDQo+ID4gKwkJCSAgIEpQR19SRUdfR1VT
RVJfSURfRU5DX1NJRCA8PA0KPiA+ICsJCQkgICBKUEdfUkVHX0VOQ19HVVNFUl9JRF9TSElGVCk7
DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lkIG10a19qcGVnZW5jX3dvcmtlcihzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCBtdGtfanBlZ2VuY19j
b21wX2RldiAqY29tcF9qcGVnW01US19KUEVHRU5DX0hXX01BWF07DQo+ID4gQEAgLTE2NzQsNiAr
MTY4OSw5IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnZW5jX3dvcmtlcihzdHJ1Y3QNCj4gPiB3b3Jr
X3N0cnVjdCAqd29yaykNCj4gPiAgCWpwZWdfZHN0X2J1Zi0+ZnJhbWVfbnVtID0gY3R4LT50b3Rh
bF9mcmFtZV9udW07DQo+ID4gIAljdHgtPnRvdGFsX2ZyYW1lX251bSsrOw0KPiA+ICAJbXRrX2pw
ZWdfZW5jX3Jlc2V0KGNvbXBfanBlZ1tod19pZF0tPnJlZ19iYXNlKTsNCj4gPiArDQo+ID4gKwlt
dGtfanBlZ19lbmNfc2V0X3NtbXVfc2lkKGNvbXBfanBlZ1tod19pZF0pOw0KPiA+ICsNCj4gPiAg
CW10a19qcGVnX3NldF9lbmNfZHN0KGN0eCwNCj4gPiAgCQkJICAgICBjb21wX2pwZWdbaHdfaWRd
LT5yZWdfYmFzZSwNCj4gPiAgCQkJICAgICAmZHN0X2J1Zi0+dmIyX2J1Zik7DQo+ID4gQEAgLTE3
MDEsNiArMTcxOSwyMCBAQCBzdGF0aWMgdm9pZCBtdGtfanBlZ2VuY193b3JrZXIoc3RydWN0DQo+
ID4gd29ya19zdHJ1Y3QgKndvcmspDQo+ID4gIAl2NGwyX20ybV9qb2JfZmluaXNoKGpwZWctPm0y
bV9kZXYsIGN0eC0+ZmgubTJtX2N0eCk7DQo+ID4gIH0NCj4gPiAgDQo+ID4gK3N0YXRpYyB2b2lk
IG10a19qcGVnX2RlY19zZXRfc21tdV9zaWQoc3RydWN0IG10a19qcGVnZGVjX2NvbXBfZGV2DQo+
ID4gKmpwZWcpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfanBlZ19kZXYgKm1qcGVnID0ganBl
Zy0+bWFzdGVyX2RldjsNCj4gPiArDQo+ID4gKwlpZiAoIW1qcGVnLT52YXJpYW50LT5zdXBwb3J0
X3NtbXUgfHwgIWpwZWctPnNtbXVfcmVnbWFwKQ0KPiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4g
KwlyZWdtYXBfdXBkYXRlX2JpdHMoanBlZy0+c21tdV9yZWdtYXAsIEpQRUdfREVDX1NNTVVfU0lE
LA0KPiA+ICsJCQkgICBKUEdfUkVHX0dVU0VSX0lEX01BU0sgPDwNCj4gPiArCQkJICAgSlBHX1JF
R19ERUNfR1VTRVJfSURfU0hJRlQsDQo+ID4gKwkJCSAgIEpQR19SRUdfR1VTRVJfSURfREVDX1NJ
RCA8PA0KPiA+ICsJCQkgICBKUEdfUkVHX0RFQ19HVVNFUl9JRF9TSElGVCk7DQo+ID4gK30NCj4g
DQo+IENhbiB5b3UgZGVkdXBsaWNhdGUgdGhhdCBmdW5jdGlvbi4gSnVzdCBtYWtlIG9uZSwgYW5k
IHBhc3MgdGhlIFNJRCBhcw0KPiBwYXJhbWV0ZXIuDQoNCkRlYXIgTmljb2xhcywNCg0KVGhhbmtz
IGZvciB5b3VyIGNvbW1lbnRzLCBJIHdpbGwgcmVmYWN0b3IgdGhpcyBmdW5jdGlvbi4NCg0KUmVn
YXJkcywNCkt5cmllLg0KPiANCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lkIG10a19qcGVnZGVjX3dv
cmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCBtdGtf
anBlZ19jdHggKmN0eCA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QNCj4gPiBtdGtfanBlZ19j
dHgsDQo+ID4gQEAgLTE3ODQsNiArMTgxNiw5IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnZGVjX3dv
cmtlcihzdHJ1Y3QNCj4gPiB3b3JrX3N0cnVjdCAqd29yaykNCj4gPiAgCWpwZWdfZHN0X2J1Zi0+
ZnJhbWVfbnVtID0gY3R4LT50b3RhbF9mcmFtZV9udW07DQo+ID4gIAljdHgtPnRvdGFsX2ZyYW1l
X251bSsrOw0KPiA+ICAJbXRrX2pwZWdfZGVjX3Jlc2V0KGNvbXBfanBlZ1tod19pZF0tPnJlZ19i
YXNlKTsNCj4gPiArDQo+ID4gKwltdGtfanBlZ19kZWNfc2V0X3NtbXVfc2lkKGNvbXBfanBlZ1to
d19pZF0pOw0KPiA+ICsNCj4gPiAgCW10a19qcGVnX2RlY19zZXRfY29uZmlnKGNvbXBfanBlZ1to
d19pZF0tPnJlZ19iYXNlLA0KPiA+ICAJCQkJanBlZy0+dmFyaWFudC0+c3VwcG9ydF8zNGJpdCwN
Cj4gPiAgCQkJCSZqcGVnX3NyY19idWYtPmRlY19wYXJhbSwNCj4gPiBAQCAtMTk0Myw2ICsxOTc4
LDcgQEAgc3RhdGljIHN0cnVjdCBtdGtfanBlZ192YXJpYW50DQo+ID4gbXRrODE5Nl9qcGVnZW5j
X2RydmRhdGEgPSB7DQo+ID4gIAkuY2FwX3FfZGVmYXVsdF9mb3VyY2MgPSBWNEwyX1BJWF9GTVRf
SlBFRywNCj4gPiAgCS5tdWx0aV9jb3JlID0gdHJ1ZSwNCj4gPiAgCS5qcGVnX3dvcmtlciA9IG10
a19qcGVnZW5jX3dvcmtlciwNCj4gPiArCS5zdXBwb3J0X3NtbXUgPSB0cnVlLA0KPiA+ICB9Ow0K
PiA+ICANCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfanBlZ192YXJpYW50IG10azgxOTVf
anBlZ2RlY19kcnZkYXRhID0gew0KPiA+IEBAIC0xOTY5LDYgKzIwMDUsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG10a19qcGVnX3ZhcmlhbnQNCj4gPiBtdGs4MTk2X2pwZWdkZWNfZHJ2ZGF0YSA9
IHsNCj4gPiAgCS5jYXBfcV9kZWZhdWx0X2ZvdXJjYyA9IFY0TDJfUElYX0ZNVF9ZVVY0MjBNLA0K
PiA+ICAJLm11bHRpX2NvcmUgPSB0cnVlLA0KPiA+ICAJLmpwZWdfd29ya2VyID0gbXRrX2pwZWdk
ZWNfd29ya2VyLA0KPiA+ICsJLnN1cHBvcnRfc21tdSA9IHRydWUsDQo+ID4gIH07DQo+ID4gIA0K
PiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfanBlZ19tYXRjaFtdID0g
ew0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcv
bXRrX2pwZWdfY29yZS5oDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pw
ZWcvbXRrX2pwZWdfY29yZS5oDQo+ID4gaW5kZXggMzNmN2ZiYzRjYTVlLi42ZTgzMDQ2ODAzOTMg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210
a19qcGVnX2NvcmUuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
anBlZy9tdGtfanBlZ19jb3JlLmgNCj4gPiBAQCAtMTEsNiArMTEsNyBAQA0KPiA+ICANCj4gPiAg
I2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+
DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+DQo+ID4gICNpbmNsdWRlIDxtZWRp
YS92NGwyLWN0cmxzLmg+DQo+ID4gICNpbmNsdWRlIDxtZWRpYS92NGwyLWRldmljZS5oPg0KPiA+
ICAjaW5jbHVkZSA8bWVkaWEvdjRsMi1maC5oPg0KPiA+IEBAIC0zNCw2ICszNSwxNCBAQA0KPiA+
ICANCj4gPiAgI2RlZmluZSBNVEtfSlBFR19NQVhfRVhJRl9TSVpFCSg2NCAqIDEwMjQpDQo+ID4g
IA0KPiA+ICsjZGVmaW5lIEpQRUdfREVDX1NNTVVfU0lECQkJCTANCj4gPiArI2RlZmluZSBKUEVH
X0VOQ19TTU1VX1NJRAkJCQkwDQo+ID4gKyNkZWZpbmUgSlBHX1JFR19HVVNFUl9JRF9NQVNLCQkJ
MHg3DQo+ID4gKyNkZWZpbmUgSlBHX1JFR19HVVNFUl9JRF9ERUNfU0lECQkweDQNCj4gPiArI2Rl
ZmluZSBKUEdfUkVHX0dVU0VSX0lEX0VOQ19TSUQJCTB4NQ0KPiA+ICsjZGVmaW5lIEpQR19SRUdf
REVDX0dVU0VSX0lEX1NISUZUCQk4DQo+ID4gKyNkZWZpbmUgSlBHX1JFR19FTkNfR1VTRVJfSURf
U0hJRlQJCTQNCj4gPiArDQo+ID4gICNkZWZpbmUgTVRLX0pQRUdfQUREUl9NQVNLIEdFTk1BU0so
MSwgMCkNCj4gPiAgDQo+ID4gIC8qKg0KPiA+IEBAIC02NSw2ICs3NCw3IEBAIGVudW0gbXRrX2pw
ZWdfY3R4X3N0YXRlIHsNCj4gPiAgICogQG11bHRpX2NvcmU6CQltYXJrIGpwZWcgaHcgaXMgbXVs
dGlfY29yZSBvciBub3QNCj4gPiAgICogQGpwZWdfd29ya2VyOgkJanBlZyBkZWMgb3IgZW5jIHdv
cmtlcg0KPiA+ICAgKiBAc3VwcG9ydF8zNGJpdDoJZmxhZyB0byBjaGVjayBzdXBwb3J0IGZvciAz
NC1iaXQgRE1BIGFkZHJlc3MNCj4gPiArICogQHN1cHBvcnRfc21tdToJZmxhZyB0byBjaGVjayBp
ZiBzdXBwb3J0IHNtbXUNCj4gPiAgICovDQo+ID4gIHN0cnVjdCBtdGtfanBlZ192YXJpYW50IHsN
Cj4gPiAgCXN0cnVjdCBjbGtfYnVsa19kYXRhICpjbGtzOw0KPiA+IEBAIC04Miw2ICs5Miw3IEBA
IHN0cnVjdCBtdGtfanBlZ192YXJpYW50IHsNCj4gPiAgCWJvb2wgbXVsdGlfY29yZTsNCj4gPiAg
CXZvaWQgKCpqcGVnX3dvcmtlcikoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKTsNCj4gPiAgCWJv
b2wgc3VwcG9ydF8zNGJpdDsNCj4gPiArCWJvb2wgc3VwcG9ydF9zbW11Ow0KPiA+ICB9Ow0KPiA+
ICANCj4gPiAgc3RydWN0IG10a19qcGVnX3NyY19idWYgew0KPiA+IEBAIC0xNTAsNiArMTYxLDcg
QEAgc3RydWN0IG10a19qcGVnZGVjX2NsayB7DQo+ID4gICAqIEBod19wYXJhbToJCWpwZWcgZW5j
b2RlIGh3IHBhcmFtZXRlcnMNCj4gPiAgICogQGh3X3N0YXRlOgkJcmVjb3JkIGh3IHN0YXRlDQo+
ID4gICAqIEBod19sb2NrOgkJc3BpbmxvY2sgcHJvdGVjdGluZyB0aGUgaHcgZGV2aWNlDQo+ID4g
cmVzb3VyY2UNCj4gPiArICogQHNtbXVfcmVnbWFwOglTTU1VIHJlZ2lzdGVycyBtYXBwaW5nDQo+
ID4gICAqLw0KPiA+ICBzdHJ1Y3QgbXRrX2pwZWdlbmNfY29tcF9kZXYgew0KPiA+ICAJc3RydWN0
IGRldmljZSAqZGV2Ow0KPiA+IEBAIC0xNjMsNiArMTc1LDcgQEAgc3RydWN0IG10a19qcGVnZW5j
X2NvbXBfZGV2IHsNCj4gPiAgCWVudW0gbXRrX2pwZWdfaHdfc3RhdGUgaHdfc3RhdGU7DQo+ID4g
IAkvKiBzcGlubG9jayBwcm90ZWN0aW5nIHRoZSBodyBkZXZpY2UgcmVzb3VyY2UgKi8NCj4gPiAg
CXNwaW5sb2NrX3QgaHdfbG9jazsNCj4gPiArCXN0cnVjdCByZWdtYXAgKnNtbXVfcmVnbWFwOw0K
PiA+ICB9Ow0KPiA+ICANCj4gPiAgLyoqDQo+ID4gQEAgLTE3Nyw2ICsxOTAsNyBAQCBzdHJ1Y3Qg
bXRrX2pwZWdlbmNfY29tcF9kZXYgew0KPiA+ICAgKiBAaHdfcGFyYW06CQkJanBlZyBkZWNvZGUg
aHcgcGFyYW1ldGVycw0KPiA+ICAgKiBAaHdfc3RhdGU6CQkJcmVjb3JkIGh3IHN0YXRlDQo+ID4g
ICAqIEBod19sb2NrOgkJCXNwaW5sb2NrIHByb3RlY3RpbmcgaHcNCj4gPiArICogQHNtbXVfcmVn
bWFwOgkJU01NVSByZWdpc3RlcnMgbWFwcGluZw0KPiA+ICAgKi8NCj4gPiAgc3RydWN0IG10a19q
cGVnZGVjX2NvbXBfZGV2IHsNCj4gPiAgCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4gPiBAQCAtMTkw
LDYgKzIwNCw3IEBAIHN0cnVjdCBtdGtfanBlZ2RlY19jb21wX2RldiB7DQo+ID4gIAllbnVtIG10
a19qcGVnX2h3X3N0YXRlIGh3X3N0YXRlOw0KPiA+ICAJLyogc3BpbmxvY2sgcHJvdGVjdGluZyB0
aGUgaHcgZGV2aWNlIHJlc291cmNlICovDQo+ID4gIAlzcGlubG9ja190IGh3X2xvY2s7DQo+ID4g
KwlzdHJ1Y3QgcmVnbWFwICpzbW11X3JlZ21hcDsNCj4gPiAgfTsNCj4gPiAgDQo+ID4gIC8qKg0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRr
X2pwZWdfZGVjX2h3LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBl
Zy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+IGluZGV4IGU0NTNhMTYzNGYzMy4uZGE3NTNhNjM2ZWFh
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9t
dGtfanBlZ19kZWNfaHcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+IEBAIC02MjQsNiArNjI0LDI1IEBAIHN0YXRp
YyBpbnQgbXRrX2pwZWdkZWNfaHdfaW5pdF9pcnEoc3RydWN0DQo+ID4gbXRrX2pwZWdkZWNfY29t
cF9kZXYgKmRldikNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICtzdGF0aWMg
aW50IG10a19qcGVnZGVjX3NtbXVfaW5pdChzdHJ1Y3QgbXRrX2pwZWdkZWNfY29tcF9kZXYgKmRl
dikNCj4gPiArew0KPiA+ICsJc3RydWN0IG10a19qcGVnX2RldiAqbWFzdGVyX2RldiA9IGRldi0+
bWFzdGVyX2RldjsNCj4gPiArDQo+ID4gKwlpZiAoIW1hc3Rlcl9kZXYtPnZhcmlhbnQtPnN1cHBv
cnRfc21tdSkNCj4gPiArCQlyZXR1cm4gMDsNCj4gPiArDQo+ID4gKwlkZXYtPnNtbXVfcmVnbWFw
ID0NCj4gPiArCQlzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKGRldi0+cGxhdF9kZXYt
DQo+ID4gPmRldi5vZl9ub2RlLA0KPiA+ICsJCQkJCQkibWVkaWF0ZWssc21tdS0NCj4gPiBjb25m
aWciKTsNCj4gPiArCWlmIChJU19FUlIoZGV2LT5zbW11X3JlZ21hcCkpIHsNCj4gPiArCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYtPmRldiwgUFRSX0VSUihkZXYtDQo+ID4gPnNtbXVfcmVnbWFw
KSwNCj4gPiArCQkJCSAgICAgIm1tYXAgc21tdV9iYXNlIGZhaWxlZCglbGQpXG4iLA0KPiA+ICsJ
CQkJICAgICBQVFJfRVJSKGRldi0+c21tdV9yZWdtYXApKTsNCj4gPiArCX0NCj4gPiArDQo+ID4g
KwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIGludCBtdGtfanBlZ2RlY19o
d19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICB7DQo+ID4gIAlzdHJ1
Y3QgbXRrX2pwZWdkZWNfY2xrICpqcGVnZGVjX2NsazsNCj4gPiBAQCAtNjc3LDYgKzY5NiwxMCBA
QCBzdGF0aWMgaW50IG10a19qcGVnZGVjX2h3X3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gPiAgCWRldi0+bWFzdGVyX2RldiA9IG1hc3Rlcl9kZXY7DQo+ID4gIAlt
YXN0ZXJfZGV2LT5tYXhfaHdfY291bnQrKzsNCj4gPiAgDQo+ID4gKwlyZXQgPSBtdGtfanBlZ2Rl
Y19zbW11X2luaXQoZGV2KTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4g
PiArDQo+ID4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBkZXYpOw0KPiA+ICAJcG1fcnVu
dGltZV9lbmFibGUoJnBkZXYtPmRldik7DQo+ID4gIAlyZXQgPSBkZXZtX2Nsa19idWxrX2dldChk
ZXYtPmRldiwNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRl
ay9qcGVnL210a19qcGVnX2VuY19ody5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiBpbmRleCBiMzBjNzI4YzM3MTIuLjhh
NjFkNTUzNzMxNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiBAQCAtMzQ4LDYgKzM0OCwy
NSBAQCBzdGF0aWMgaW50IG10a19qcGVnZW5jX2h3X2luaXRfaXJxKHN0cnVjdA0KPiA+IG10a19q
cGVnZW5jX2NvbXBfZGV2ICpkZXYpDQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgfQ0KPiA+ICANCj4g
PiArc3RhdGljIGludCBtdGtfanBlZ2VuY19zbW11X2luaXQoc3RydWN0IG10a19qcGVnZW5jX2Nv
bXBfZGV2ICpkZXYpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfanBlZ19kZXYgKm1hc3Rlcl9k
ZXYgPSBkZXYtPm1hc3Rlcl9kZXY7DQo+ID4gKw0KPiA+ICsJaWYgKCFtYXN0ZXJfZGV2LT52YXJp
YW50LT5zdXBwb3J0X3NtbXUpDQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsJZGV2LT5z
bW11X3JlZ21hcCA9DQo+ID4gKwkJc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZShkZXYt
PnBsYXRfZGV2LQ0KPiA+ID5kZXYub2Zfbm9kZSwNCj4gPiArCQkJCQkJIm1lZGlhdGVrLHNtbXUt
DQo+ID4gY29uZmlnIik7DQo+ID4gKwlpZiAoSVNfRVJSKGRldi0+c21tdV9yZWdtYXApKSB7DQo+
ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LT5kZXYsIFBUUl9FUlIoZGV2LQ0KPiA+ID5z
bW11X3JlZ21hcCksDQo+ID4gKwkJCQkgICAgICJtbWFwIHNtbXVfYmFzZSBmYWlsZWQoJWxkKVxu
IiwNCj4gPiArCQkJCSAgICAgUFRSX0VSUihkZXYtPnNtbXVfcmVnbWFwKSk7DQo+ID4gKwl9DQo+
ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyBpbnQgbXRr
X2pwZWdlbmNfaHdfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgew0K
PiA+ICAJc3RydWN0IG10a19qcGVnZW5jX2NsayAqanBlZ2VuY19jbGs7DQo+ID4gQEAgLTM5OSw2
ICs0MTgsMTAgQEAgc3RhdGljIGludCBtdGtfanBlZ2VuY19od19wcm9iZShzdHJ1Y3QNCj4gPiBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAlkZXYtPm1hc3Rlcl9kZXYgPSBtYXN0ZXJfZGV2
Ow0KPiA+ICAJbWFzdGVyX2Rldi0+bWF4X2h3X2NvdW50Kys7DQo+ID4gIA0KPiA+ICsJcmV0ID0g
bXRrX2pwZWdlbmNfc21tdV9pbml0KGRldik7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCXJldHVy
biByZXQ7DQo+ID4gKw0KPiA+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZGV2KTsNCj4g
PiAgCXBtX3J1bnRpbWVfZW5hYmxlKCZwZGV2LT5kZXYpOw0KPiA+ICAJcmV0ID0gZGV2bV9jbGtf
YnVsa19nZXQoZGV2LT5kZXYsDQo+IA0KPiBXaXRoIHRoYXQgbWlub3IgZml4Og0KPiANCj4gUmV2
aWV3ZWQtYnk6IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNv
bT4NCg==

