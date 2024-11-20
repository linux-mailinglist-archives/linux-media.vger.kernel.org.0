Return-Path: <linux-media+bounces-21611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 098E89D331C
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 06:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58974B23ACE
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 05:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3A615746E;
	Wed, 20 Nov 2024 05:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uZFDyifR";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="oBVk2vmw"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016A156220;
	Wed, 20 Nov 2024 05:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732080094; cv=fail; b=ZJqMw4gQvEIBIw3OhH1SmgPuxbbSLN2QlnMgmG12+v64O0bdY2ll6gK1Ocw0l91c3WLLXPuEtcNRhRO3PGtipc0hExlXlr8vbt2M2Lk8nAE2RxMEgsC/E7JuDOwpC1FvMNAqCT8RNfEovzsZ6DkgECRNORPqA2Sx1mgdI//qxsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732080094; c=relaxed/simple;
	bh=+1vFzUHK5sGOAbOlYJQXe51wWxzOqRR7WkOdhPgrmTM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uOTrdyBHsdftd5bmr+fvbmayVedDrM0BZaVvGKZHNE6WQI/7IpuiIgD+H9XQi4kNaCS72O11vealwx3kAtwK3rlXHPAoiFrMWqeKNx7D0S9dGomADpsL5z8+Oq5WJTkyBdeKQpN8uD88ezGZxj0Rkqd6gU+tiWfFSz5Rc8WIHyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=uZFDyifR; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=oBVk2vmw; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4b16b0a6a6ff11efbd192953cf12861f-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=+1vFzUHK5sGOAbOlYJQXe51wWxzOqRR7WkOdhPgrmTM=;
	b=uZFDyifR1VV9vKUQoirH1G9mcwdqq8FqUbyl9FioVJrep5uaex73NLgZ11/aeM3Ka8QblXKv8TchGjIH5O+FTD/B2xplQFdj6uYAzVjum+14tE+5twVCCH1nZ+6qtoP3WuDcxsdBkUeXL9/8on29l09ZvI9rRq2hOiYadOQ9ZmY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:867e41ba-4d1f-41bf-8e31-3ce0de29f80c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:7ac917b9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4b16b0a6a6ff11efbd192953cf12861f-20241120
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 726948170; Wed, 20 Nov 2024 13:21:27 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 13:21:26 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 13:21:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwjXUmpr5CQ/K9w2uoL+RT4zIV3KG2EoKNRuO/1ueqE2TE0wO0s6l6FBzW6pMxHYXXV/8hgairnOclaSTUlcFcRjLQTP0HlVK05eiXsE4fIkYyOKZPNTySdCc8NTth5P2ew9ASMAgzGtuzyhjghUCYGyrAoxYY9EGyu+pQRyErasW3YN0dcyGSMs6rDi7ngGRXi0AEvVPT49GlM74wRLH/i9K7omWor6418jYdWlFQShTChW83GUEwRTRHTaLgDvXCJvNcdqJtF3n/hqYMWfZhM/De1wrkrV25J2WQUiTkor1VGEJTe3Xl408KwsmMwfTMHn47yoiCo3aC6jbNoKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1vFzUHK5sGOAbOlYJQXe51wWxzOqRR7WkOdhPgrmTM=;
 b=ejn+e4ZElZVXn0ly2Bngv9gt4i3HJeTLHvGEQd1OgzwyUtIpBQuVQtrhcpvA+4f5fkriD+GsI7yisFTB8/3egjZnETrWxfoZ1VIJXlr3MjkDQ4mhROHgySTeLpReTqBrMm5nYio/2e46ScsRcGobLV8l0/X963y1EsOZvOGdduJ9bhG6tekmpTciItAoyTiclfiotWVQhPNS2w78qU9xsF5GFQ0knyl3BVibN7nVPWfyt6pdyoCpo5RLwMe3WXZQt1JBi3R5hH5QkA7pU+ff4pmnG3ANRU09n7JJYBBXRtzMXaJ7ALVrjqMTb+ooAuNbtI+Bu4rOD9yVxiQwqkQIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1vFzUHK5sGOAbOlYJQXe51wWxzOqRR7WkOdhPgrmTM=;
 b=oBVk2vmwp7kBfYW6IF+mFootOedd2MeG1jqrtKAj+WM2X8CPUvrrjbZE/SLC4/XwO5282zn1b/38F8WW8yYOHhwdCgfKGFr3P1c1Ckwz09fsfZrcVl4QA6DdoJWbpX/D9Q2mHLC5Hb2WXgxoX4tS/Mf8+Mtcf9NL5I3c/tVV1c8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7561.apcprd03.prod.outlook.com (2603:1096:101:147::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 05:21:23 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Wed, 20 Nov 2024
 05:21:23 +0000
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
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbK/45cA
Date: Wed, 20 Nov 2024 05:21:23 +0000
Message-ID: <d3062f9ea7a21c37476a393a865d5ca9d008c1ef.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7561:EE_
x-ms-office365-filtering-correlation-id: af5a67d8-7329-44ed-78b1-08dd09232c92
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U1p6MHRkQ1ZNQTdBb1pqV2xGWTM1SW84cFV3MU9BVVBMRG9lNnVBbU91Wkkw?=
 =?utf-8?B?dFBmZkh6aXRYaGFWN3pKQ2NTdUJrSnhlN3V2eWg5dCszTEpPbE1LTTJaalk3?=
 =?utf-8?B?WWFmYU9NaWpXTkxSdm1hUmpvakdOWHFVZG5EZ3Y5OUpEZ3Z3SUxZSnFpaEtP?=
 =?utf-8?B?azFJdVhQMjh3OXdtQ3ZWTUY2emd3eVQ1dEV3ZlJIaTUwemYxMWNvKzZKa3Qw?=
 =?utf-8?B?MDZUdlpVb2tnSHlHSUtzdE5qdWJMQzkvMmhHWUUvekMrM1FSZmFYUmN1OEha?=
 =?utf-8?B?cGs4Vk5HZWd1NGE2UjJYL0NKWll3bmsrQ1d4bDdDOGJqY3VBZFlYV1NHMXZT?=
 =?utf-8?B?bXZVUXZxaUxwaU9CdWlMd0srSTBtSGdJS2UwNDJzT0I1TXkwU05Bb1drTXRE?=
 =?utf-8?B?K0xiMTg1c3BEc0hEK0JkZUdFSnl3WGdmYkxPOFdBSlg2Y0lLRThJZnFhanNw?=
 =?utf-8?B?VklUbVZtL1NoMm11MmZlNVdJSGxTMmlETzZHMW56OHNWSmx2Sm4zTTR5UFg4?=
 =?utf-8?B?K29vOUhYYUN3NjYveWF1ZXd6WVNzVHErL25SSWJ6OG5zenNHeXBUMDR6Q2F3?=
 =?utf-8?B?UURtdXU5SnFScDdsZXIrWDVXZlo4TGsvM1VMbEZQQ1dMYitjc3JYSjU4Qlh2?=
 =?utf-8?B?TDQ3Ymduc3hOTzh5Z05mdXNLbGxpNllQUnBRditmaXRJMytkWmtVL3QvaDFO?=
 =?utf-8?B?MFhucytsdzJWWXQvT3ZpM1h3YlZMOXBlblVRYmtkTXRVNGc5aWpJVmZ2OUkv?=
 =?utf-8?B?L3lXT1RSdVlZck0yWjZZamhETHR1WlJMOVFWWTBQOVBuajdQeEM2V0dGRkI0?=
 =?utf-8?B?SlNjMzVKclFKeE1LMEtCZHFxUkV0OEFkUmc5UHJuL01ZYVQvaGM4c1BPcGR5?=
 =?utf-8?B?c285QjR0bWVRZzdwQzZXRVJYVkplb1BXaEEvV1I5VVBVWlhKTjluQ3I4RUt2?=
 =?utf-8?B?dnVoYk1YWXh6T0FDTW9DN2VVNk9aYmhRWXlBVXhVMEgrOXI0Q1IxUHNBM1Ni?=
 =?utf-8?B?eDFERlcxQUh3VDBCOW1pb3RPcXVpSUI0VmpXV05jc2lxbXJnYXJaaGFIVWFs?=
 =?utf-8?B?WjczUHF0Z01pMTFJMDZ2d0RjT3JtTFFURytuWXlVdG5rajlLOVloaklWMWZK?=
 =?utf-8?B?bGJ2bk9RQkJ5aGtLUzhHNFNMN2EyeDQvTCtVZVdpS0xwdUEwV05YT2s5NmJF?=
 =?utf-8?B?bk1kMXAvdEI0ODd4N3c4MVZoWEJGc1hMeXdQNXBoNi9VTEI3bm5GRWp4NDNZ?=
 =?utf-8?B?REdYeVRpNXlJVE5pd0FWMU50ZWRjejRuQ2hiYnJZZkhpU0hZQzg0dFo0OHN5?=
 =?utf-8?B?YzNRMVk4YzhmaDFvN1hOY1ZqNy9GaXVHeW5WSXdyd1V4ZlhoM3YvSEpUbC94?=
 =?utf-8?B?MTgrWnhsbG0yV2ptbHV5NEx3T283YWxFUExaSFV2T3JzMTBWeFRHQWd2WVN0?=
 =?utf-8?B?ZHFxOXBFY1FKVFpYYUxQbUlYam95cWwvd2VIOFZsUkU4S3REZlhUbjV1eHpt?=
 =?utf-8?B?eUdCRE9KOEdRMU84R2QxRVorYUVTK3NneVhlRE5TMVpyRVgrOTJTY3I1aDhj?=
 =?utf-8?B?R1plMXNzdVRWVXR5ZmpLTnBBczJocW94TWtLclRCQWZHTW9RU3BybmhkYldx?=
 =?utf-8?B?VzhoTEJ4Y2JwdmQ0d1VIQnFEVDR3NDh6KytPd0hvYndIR2J0L1ozV2p2Zm1z?=
 =?utf-8?B?VUtuZlpUMys0MjBDaEhlSzdSZlRVaFROSjhzaU9ya0M4bTV1TkRPS3ZJRGlC?=
 =?utf-8?B?NkZqSzVMT0NWRS9Cd1NFamIzUVRLV0puQnBIeHVKbk5ERjhXNVd3MXI4eXZ0?=
 =?utf-8?Q?l8BySMPdcwEe+Hmo/Wk2yYbhJEcI+QrhURhJQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUphSnUzdlBWMzBueExHQ2RGdWlKN1g1M2VucG45Nk1nU0NDQUl3QXhZQkxJ?=
 =?utf-8?B?V2VmeHhqaGJUS25Td2FWVTM2TzBqbjZXcVFZUUwvVmU0M1dvYW1qVDRjbkp5?=
 =?utf-8?B?UDFJamJ6TkN3TEt1RnRsSSt1eEVEYXA3ZlphRnVnWHovcVUxUW1jb0ZucFBj?=
 =?utf-8?B?aGZJSlQvV1RHTGR0TkozVHpNemVKMWlScERSQ2hibE84MGRZZXh1VmdVSUhh?=
 =?utf-8?B?R1JtTUYyNFhHd3hzK2JOSHUwWCt3bkVYejBjb2tHU0MrYTUveW5raFBJUGhV?=
 =?utf-8?B?djFhVmk2SytzOE5pREoxcUxtdUdrTDZtdmxxeTVJNGxjR1hwZy9qRVFsNXNQ?=
 =?utf-8?B?b3d3SVlCZFZ3eWhQZ08xKzVnZzdSbHpCSzJYaExuMElRU2MyZWNaWm5lWHNQ?=
 =?utf-8?B?NWxZTmdMVlJVMkNlVzMxYUpkMkdxQVFKK2UxTUc0Rm5LOGNIb21sc3ZhMkdJ?=
 =?utf-8?B?ZVFveVd3VHd1bDVWcUJzL2RmcXBaVzFvbWc0SVExRloxSWxvNlpKNlFQUEFT?=
 =?utf-8?B?N1krVXMwT2huWmVtUjl6WDRNUGY2UTNxMXQ0bElYUUFTYTNndEhIYm9FUUV1?=
 =?utf-8?B?WTJXejBsS3d0bzF4QlRDbjdhNkRnMFFyKyt5QWVqOEpMb3RkZTVTUTlNZGl5?=
 =?utf-8?B?cG5IdEVhcHpRRXlPaERhRll2TXpjYUtoNnVZVFlyRVBBMGZIbUZTa3R4dkwv?=
 =?utf-8?B?cEphaFhDcHZQd2ZUdnJUUXh4OGU3WldEUXhUUFBPK1owaDVDazRlQ1JRMnlj?=
 =?utf-8?B?dCt6TTR1WVU3NDFIVzg3cmY0Z2taUFVFTE14cE5PNXFLUENOQk1UaHovM0lB?=
 =?utf-8?B?UStxQVNXK3hsclJLUDJaNXFzc0ZPUklUOXFsU1hWazFJNkx6S24zekNnaTAv?=
 =?utf-8?B?aTd5bTVVMDBmWEVJemtNbnFTeDZTRDc0TXYwU0Zra21MbHEwcHZOaisydXps?=
 =?utf-8?B?bzFueUVocGdFQUhWZFJpWHBvS091TEUzOU5oZy9WRmtHeEpKU3VPSGZOcVBF?=
 =?utf-8?B?cm5sSnNFRHh3YndKVUVvVnY0WmtBekZDaTlOWmN3bElJRW9OVWMwYWxnTkRi?=
 =?utf-8?B?S3p6bFN0RlBhT1FnSkU5dzZDMWdvQWdJcDVzMk5OV1RlTFpJVHhXR3JJRlY0?=
 =?utf-8?B?cHhTV1BXWDQ3NFF6ZXd2ZVh2aDd4R2hmM2haN3lQdFFrdi95ekZ6RHc4ZUFN?=
 =?utf-8?B?NlZEVHZSYW9PVnZpWG1qRy9HTE5MdUZOKzZFbkgxSnlRTERGSUkzQmhqd2ho?=
 =?utf-8?B?S3ArUFZwakY5eXhnTU9NYTNVTXVVM2VySUVPb3oxdU9MQjBXLzBxS05wWHc1?=
 =?utf-8?B?N1Rwb1BZQ3hzNG1HTFlRcmg3MlN3cGREZ2NtbU0wZXFjV3RPSWdrMnJibmUr?=
 =?utf-8?B?dkdPVUNFVm04Z2ZtMnhGQ2g1RDVVZDR1K2daekY0aG42bldWSDVwVzZ5dFZQ?=
 =?utf-8?B?V0JvdGYrRUcvRGZGWEtabFdyUEN3bHcrdG8ra1FZeUk1MkJtU1g3dEZKOEo5?=
 =?utf-8?B?cW9NN3prNFhLMHByUTVJQ3ZhMlhhZjliS3B2TXozdktmL3lDdFBJVUR1MVRi?=
 =?utf-8?B?cjNTR2lRZ0YyRGV3eXZIZndMM0VxbXRDak5xNVQ0eDFIdW5qcDA4SWpWSEYz?=
 =?utf-8?B?aWR1blBOa2phMG83N3pYR0VQZlFhUXp5N2U2cjJzcGliMzRmaWhvT2RCSDdB?=
 =?utf-8?B?bnllTTlhaUpZMzRkYXAwRHhDd1pOaXRQMkpla3VyVENNWE9QUjFXTHdHTFlV?=
 =?utf-8?B?QlFzWFFKTnpaSXlSZkUyamkzdXRRL1U1bkZPbjF3aWd5dktTdGN3ZVJkcFFU?=
 =?utf-8?B?VHlSOVN0SjFFTDdjdlpQNGFHMkVMZHlCbzBHYUV2S2RQQ3RqTHFjYStXcVJP?=
 =?utf-8?B?UHZ6RFAya2hNRGwxSEwxc0UwamNHbTFvK0Fia2QxZlA3dktiSGZDRXBPQ3FI?=
 =?utf-8?B?cU9qaEpjWm12ZFhreGdlaGIrdkQwUkZ6T1pLMFRlTVk2K0VVYjVGeXRSTGNB?=
 =?utf-8?B?eVJZTFFpaldXV3A5NkpYYmEwUlFDSkpyVnl3b2FaQVhORmtRZEp6WVJ3SjUr?=
 =?utf-8?B?dlNJM0NuakYrOVJJVmg0YmExZHJjUkdOUHQxckFob3N0SGJuZENTLzZxcWdx?=
 =?utf-8?B?eG1iWVRaUmp3SEJwTVUxc0FFcWZ1K3pXamk5dS9PY0hVTGJxSUFDeGN5SGhs?=
 =?utf-8?B?cFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69DAC904E0B7F04F9C78C8B0C97411B3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5a67d8-7329-44ed-78b1-08dd09232c92
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 05:21:23.2400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zbcg4HT6uCQUf0a+Hk9otepOXwwgFUzAObSXFlelnP6Rare1CUyFYoP16Xe5NMNfeYR0epd2OhCvQe+ohgWRYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7561

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gK3N0
YXRpYyB2b2lkIHZiMl9zeW5jX2Zvcl9kZXZpY2Uodm9pZCAqYnVmX3ByaXYpDQo+ICt7DQo+ICsJ
c3RydWN0IG10a19jYW1fdmIyX2J1ZiAqYnVmID0gYnVmX3ByaXY7DQo+ICsJc3RydWN0IHNnX3Rh
YmxlICpzZ3QgPSBidWYtPmRtYV9zZ3Q7DQoNCkkgY291bGQgbm90IGZpbmQgYW55d2hlcmUgdG8g
dXNlIHN0cnVjdCBtdGtfY2FtX3ZiMl9idWYgYW5kIHNldCBidWYtPmRtYV9zZ3QuDQpJIHRoaW5r
IGJ1Zl9wcml2IGlzIHNldCBieSB2YjIgZnJhbWV3b3JrLg0KRm9sbG93IHRoZSBzdGFuZGFyZCB2
YjIgZnJhbWV3b3JrIHRvIHN5bmMgZm9yIGRldmljZS4gKE1heWJlIHRoZSB2YjIgZnJhbWV3b3Jr
IGFscmVhZHkgZG8gdGhpcykNCkFuZCBkcm9wIHN0cnVjdCBtdGtfY2FtX3ZiMl9idWZ7fS4NCg0K
UmVnYXJkcywNCkNLDQoNCj4gKw0KPiArCWlmICghc2d0KQ0KPiArCQlyZXR1cm47DQo+ICsNCj4g
KwlkbWFfc3luY19zZ3RhYmxlX2Zvcl9kZXZpY2UoYnVmLT5kZXYsIHNndCwgYnVmLT5kbWFfZGly
KTsNCj4gK30NCj4gKw0KDQo=

