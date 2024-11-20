Return-Path: <linux-media+bounces-21614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA1B9D33A6
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 07:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B485B243D5
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 06:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EAB15A85A;
	Wed, 20 Nov 2024 06:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NZK0vItH";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="M6vV0Mq9"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BFF15625A;
	Wed, 20 Nov 2024 06:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732084573; cv=fail; b=NGSllv17/c+rQQjD3e2WKIGpVgBXDnX8StC9suRz2M1gg5E1ANUJMwgaaNa5EGIczfDE/T4DDm/JAw4c+quc/YTWSfWXuHUs5XuRvD3X/Yb3zoJW49mpuUt6LdVqd4GvV5JH3DqI+QiedRrpmqBE7HWY2t1EIV9NsEDUjLkg614=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732084573; c=relaxed/simple;
	bh=8M6a3vPiGCKH2PoW17Bv0wEvID1FHrQEMfn8CbY9WiE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qtt3EhcyY5XoNKuUQdbEPRXztS/SDn7MWzviP5x43mfUppxGcXT1uFHVrqWK4mSc8kwVwG9vREYqtyTDkILxjlopSGJV6QWV40p0jCOKa+IUSEKEri6+rvu62y5fEPviH0MuPPYa45WAkpC5D7W1fZBX1zYYiFqH4oh/6//NQZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NZK0vItH; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=M6vV0Mq9; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b816f418a70911efbd192953cf12861f-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=8M6a3vPiGCKH2PoW17Bv0wEvID1FHrQEMfn8CbY9WiE=;
	b=NZK0vItHomP3L5rmGny2+IqCeIlVmN3+5+SDGVUqcHrTgYGMempmz2Q8r/uWDW1gUF7e61Igj6syB8yH8n1xhEPcwsy8no5c5xoznY1yL2Y50+gLzdh4+PTciKxH7kI9MkCxHYc+bzreGTChhk/8FULXM0I3neqvvFzsU7+AsV4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:65cd3be5-e858-4041-bde4-ec0bb07b2f1a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:98f447ce-1d09-4671-8b9c-efcc0e30e122,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b816f418a70911efbd192953cf12861f-20241120
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1154016526; Wed, 20 Nov 2024 14:36:05 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 14:36:03 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 14:36:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvjahW0iqd/VMePHEBChtei2aMQOiZL1IYPPWi/Y2CQKIhGgfMyi+kZknpDyXX9v449FyoYgYP3j4QLy0SIrgesqE+PvwLOX+fbyGCfG61o7gKr1dLK7igqoaHtzmOAsj1Y7vP3BOKifj8KxWGrCNmSE78aMnYt38MGRG7bh0pSJGJGA+y8MnX9eopHFqa1TdsS9EMP7+8U6ESax6JSDIorYVa0EVDIXiYXSKLNX3i+y0xWdno1In582lLqkP0nNmJKCPkgyMPLMeR9x+m2fx5bfF9zgsx5hhqr1Iymj6VMsVDBqEu209UKsz8Eqb2NcnPsM4A0l/b1GVdSmf3lGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8M6a3vPiGCKH2PoW17Bv0wEvID1FHrQEMfn8CbY9WiE=;
 b=abhx11W7gMCWSAgU7T4fg10U7yMAXG+BaGgflEjBPdf4SDDh1cLBR0z8zTODVgRpC9XQfT8fnQpRWijP/6ff2erkwPuSxuo3fdH+0aYyNOGP15ULDIzn5Cdm9ohMvn4HEH6rfun4vp5cxzchiLkZmtSm1/enMCpvYaXoc8sIBaO+sz3D+SWUe95+RcSECRym/O7U4/NPHp5nj3JKdIsk0H01X+iOZnIdQCE01BRpIPXmiW9laiHgB8qf/Q+SfERdkMjvzGCDAQ2WZ+421XVlUfphp6cTIPfv5wY/Sfzwm1IJ2hCWCB52c0eFlpsg8FB+9jw0HUeaIBNihCo6neuArQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8M6a3vPiGCKH2PoW17Bv0wEvID1FHrQEMfn8CbY9WiE=;
 b=M6vV0Mq90tVfvHZiIflhUf/5scAvRosm0IBZoa/oYlr4PgmWy1IoQFuS81cW4ihV7qxwVxMWA1Rd3t5X1msczbMX4dH362tccCGqkneAeK/O8Sb9LN2Oag1m+otm6Dc7rUTpCH6P/AukSXs4QPUhP8QQ2FQQqSITQlAy6h5OYdY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6643.apcprd03.prod.outlook.com (2603:1096:101:7b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Wed, 20 Nov
 2024 06:35:53 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Wed, 20 Nov 2024
 06:35:52 +0000
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
Thread-Index: AQHbGj1K7oS5BpZAxk+Yfu5zQIUxBLK/+GgA
Date: Wed, 20 Nov 2024 06:35:52 +0000
Message-ID: <b9fc24079c2004ed15ce7206298bd1dd41896f9a.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6643:EE_
x-ms-office365-filtering-correlation-id: 73d2a809-4c03-4638-d6ad-08dd092d94a6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NkZHdlRuYk93WndtWk0ybldzYmNSRXdTM05qU0ROWXBWM2pFYkN3MERLcExI?=
 =?utf-8?B?ZW9FTlh0ZDVqR1hSWEl6elpyYlJBTmlPZWgxUTFLVThMQUNsYUZyOWdGZ3RS?=
 =?utf-8?B?RU0yVkMzRnNiNU90Z0pEQW0yZElHZitWbXNxOW5nTEh5MzBxL1JoTW9YWm5s?=
 =?utf-8?B?aW9GVFl2akhlQmR3aVIramU1ZDdSNzZ4YlpLSGJ2SW1VSFYrRGpOZ1loQXZx?=
 =?utf-8?B?WENyR2hZY3ZsS1BMTjBVdWx2RHV2ZExNZS9hSTYvb1QwUDVaV01aWnMzeHhJ?=
 =?utf-8?B?UEJoVWZvK0QzVXpUZHJZRWthYjB4aFhDNTlWRDJTK2d0cmhOU3BLUzhKUkpZ?=
 =?utf-8?B?QXFxczV0bUhBallmelk3YlVSbUxUV25VNGM3cVlSSjVwb09Ib3k3UXl4eUFX?=
 =?utf-8?B?amdFclVjTlh2UXJXTDNXaEo1dEluODQ5V3J6djJ6V25uSStGRG1WYVhIQ2F5?=
 =?utf-8?B?NTdNY0RNcGdLQnBuaVIzKzUwMXgzL085NE5oeC8xOWdYUFo2dEtFc0dHelVE?=
 =?utf-8?B?RisySTNKV0ZQRm44WEJNVXJvOS9DVFhOMEx2S1FqdGhNa2dFc3lHcmVOWmVw?=
 =?utf-8?B?TmNwWk56M21hUEprNmpjVjBBWUNSaHlsRzdLWENYWXZ1Z2hnU0RqRFlkaGNo?=
 =?utf-8?B?V2NFNitiZWFnOFBGQmdjRzhoV1k0Vjhwd2VXKzJwS2Znci9RZ3R5c0F4SkZQ?=
 =?utf-8?B?WnZPdzJzQkxXQS9ZLzYxWlJiRTNGL1BYa1lwS25WaW9CN3NnN3JPbDUzQTRU?=
 =?utf-8?B?MTdmTVdZSEo2cXQxVUFyR3NGNWtTWkZ5dENXM1IzOHRQOWJ5YUJCR29paU8v?=
 =?utf-8?B?QmNPR2xndE1meHpuTnpwZG82em9CMEVyS1hYTHdsRXJFYkpyczNvdmR4YUll?=
 =?utf-8?B?RzRIT3pCOXBIamgvbzJTb3VwVitobEx1WW01UldaUDByV1AwQU0zaFlpT0lx?=
 =?utf-8?B?cjk0Y21lVmxxb2lDOEZGZGNQaHFZME0zTWh1Mko0UWJKUlFmRGZLTkhYTG9I?=
 =?utf-8?B?ZitHaEJvWC9nR2ZxbE5kS2hQZmhzVGI3bXpVcDNOSlB0L1BaVDYreEMxUElG?=
 =?utf-8?B?ZmtqVGthd0dHY0QrWDkxWmtlWlh2dnhEZ3FoY0Rzdktsc0Q2RDU1SFdIaGZU?=
 =?utf-8?B?b2F0VCtITE4rUithVTdNWkxkZVlCK0tiblQ2V3hlbVJaWkdhNUdDN2doY2Iv?=
 =?utf-8?B?Qlkxa1VoUHoyT3ZnRHhCQVdDN3p4WFVhQUxIWUZaS09GWU1lb05Vc2p3WSt3?=
 =?utf-8?B?cWVnVWxrZVVYb2xYZ2RiTFF1RHhsSG9oNWJ4TGswbWpXT3JEK0FPd0tnZ2d0?=
 =?utf-8?B?cC8rVkZMUzBDdGc4UCsvTThtajcrb0I4WStqZXNEbmtVOHVGeUdVbzFIUFBu?=
 =?utf-8?B?ZmhwN2Z5ZGtPNnRSdGkwSmhTT0NBSXpyTlNOT0s0enZNd0hBYTNkZWRnSWRk?=
 =?utf-8?B?WFE4UHFuUER3TmxiYTI4Y0ozQURpMnMxODNDQnp4OEttQW1kWVJZTTVabHY5?=
 =?utf-8?B?bFdrclNsMjMwRUd4M0NBbzFZcTlKMmFaVnJrZ21ON1paL1hzMGRWbmV6b2x5?=
 =?utf-8?B?bG10KzVjZnlmQ2Y2TUV6MlVJSUI4UmtibGViN1RaTmxWQUpRYnZobEVwZkRj?=
 =?utf-8?B?SW1XT2lZUzJqOU5rM1lDLzhHN3Q0RGFpMHJGODZCTThDNXB5N0R1YkRPZDZr?=
 =?utf-8?B?eCs2eVN1TDFpWjhBWkJTeERIUUtkT2d3M3Z0SEVzV2cxMklReFlGTTJxUmEr?=
 =?utf-8?B?SjNaMkRURlJIOFloek1nREprbUovTmI4bWRCR3BmNzhRalA5MzE3eWY1aHgv?=
 =?utf-8?Q?JxibR7X1tRFJsqm0EO8zAKpCKt5grxPakWfwU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGdsSE5kNkQwNElCL2pNZHZrK0UvMXdTMExkYldCM2ZRU3J4M2lYbXFtVXIw?=
 =?utf-8?B?Wjh4UHpNelNQcFN0ei9iYXg1bStqbnRlbmVDY29odTQzQXlYVS92TWo1dnJw?=
 =?utf-8?B?NUExVmJKUmcyRkVMTnplZXUrdW8zRm8zRndIT1J2dVdhVk5vS3lzcXVxK0pz?=
 =?utf-8?B?YkplQXhDc291V3ZEYnVhcFJOZG5iQnJ2WWV5Y0pGWlFLRVgzb0ZpeUdHYW53?=
 =?utf-8?B?YjRCS0xwQVV6WHpMUHBwQVhlMHdFSWlrK2FtRDdsN240OGlUNEt2Y1dqQ3ky?=
 =?utf-8?B?RjlXMmh3dlhlVVV0SjBycXpUVE15cU16VEVwcExISnhwVzUzK2gyaHQ0V29B?=
 =?utf-8?B?ak1XcWhDdFVDN3M4OHpGMWhLNVkwNnQ5ZDdmaktMOGRZVTZZQXBKOFdHWVNw?=
 =?utf-8?B?cDAvcTd2Qk5CeWhRSnJTMnpHZ0pscC9TVWFCWWMvVFdWZ3F4ZVpkbkMzTjVK?=
 =?utf-8?B?LzJ4eDBGeloxY0VYMmNsTUJyd0p2YXJWK0lvcW9BR2Z4NHA2NXlkellUaU96?=
 =?utf-8?B?c2tlL3ZDdXMvd01xaFpTUFhNQ0RMTVBiMGIvSzgvVmNvNzMrcS9vM3MyN0ZW?=
 =?utf-8?B?L3k2SUx1OHYwL3VXWHUrK1l0Yk1QeWRCbWZ1UWZhdXJKL0pVejRXZDk0dVBz?=
 =?utf-8?B?dFI3cXFhdkQ3aGdlcDlHeURNS0k4YnhGVHZZMkMyUC9kUkFOeGluRkp2cy9D?=
 =?utf-8?B?dDBndjN3SHMyeGpiWk9aQlliczBkWUxYTTNVUUNXMHB1bGZoWWcwUVVjOENz?=
 =?utf-8?B?K09kL0dDSVhCZ3dNOXlpK2ZubUpiYTdTRS94bng1RDVOS09HbXBkaStPTGxK?=
 =?utf-8?B?UnZjbzc3V1BnendxVGtYdTV0VlY4Vk9DZlpuK2VTbENHNm9scFFHYmthVWE0?=
 =?utf-8?B?SklRSlRyM3lQZlkza0c5T2o3SEJDNHd6L3JIMkZkWWVoNk5QSVhUeEp0N1F6?=
 =?utf-8?B?eXpqSFQrUXJoWFJtbkpsRC94Q0JYeUJoZzk0Y3F3NXd4aVZpejFEMTRzem0x?=
 =?utf-8?B?TWZia25GdU4yV3h4TlRXMTRuVytSeHFKQWgyNllsTDMvQ1dpUmpkTEczamhW?=
 =?utf-8?B?RXNKQVNzZ0lGNStmR0loQjVFQWM4L3AvK3pSdkI4QjRjeHBzekpabHkyenBV?=
 =?utf-8?B?OUhGVkd0RkROd1FDRW82V2RyQ0NHNGpwMFpBUEthRWk3MytZZUdDVm54ZXEx?=
 =?utf-8?B?MlVtVGJvOEpZaXZUMis5RlBMOTM4dGJPWGFEYVN3VFh2N2lCUU5IbVp5U3Z1?=
 =?utf-8?B?bi80cFBzSXVFNnduZXM2K0dXaERJVU5NN052WXFHQVI0a01IdFBnTStOaTFt?=
 =?utf-8?B?ZXp4QlMyL2Q5UUdoZFpVWDNyRnhzMmUvVmVmQ2E5eHMvMlhYRTl4V1pSQjZL?=
 =?utf-8?B?U0V6aHJGdzI1WjJLTDZrcmtQVE56UjBYOHNqR0dYbXpDZExoa1B3S0lyVUht?=
 =?utf-8?B?cXRQVHBRaTdicFUrWi9vNzZ5RXB4c2N5OFc4UFVyM2xTbUpHbzhHU2ppV09T?=
 =?utf-8?B?elgwaXc5Zi9GOUl2TnhHWWsvYTBRU3ZIeFg2VjVMSVRmTlpEbzRsYWVxYmFO?=
 =?utf-8?B?RWlDL20rdEpseFFNZUdzMjdjVkU1QUdFRHFsSnFqbHVXRlhsaHVIZHBwVS8y?=
 =?utf-8?B?SGFqTTVFbERQUlZrdGl6UVlwamozSzJhNGg5WjcyQTJBVFNIZysvbzJ1dVI1?=
 =?utf-8?B?OWVWTUMyVWxVRHZSYklGUUt5V0QxZlRKTmpXMzNmU2s0azVFb1Z2TkpUbVVC?=
 =?utf-8?B?YXFTVHlCRmNKaEVIK0V1eE1hbm91U1VyMWVsRGVEc1JxUGFHeTlzYnBLMU15?=
 =?utf-8?B?Tm4wekxqQ0Y2cDJMeWpaSU4vQmJEU29rR1NSVThWaStRTXprVmRZZHRoYlBM?=
 =?utf-8?B?NkU1bFVqcktZYlVrazgySElEK3lkWmVrN0U0b3ZKdVhTTGJxTFN3SFAyV2pG?=
 =?utf-8?B?VDhpMUZNTmsrQ2thdVJTS0Z3VnREY2t4OVRyek5aOTJhMTMvV1YzZEs3Rm1k?=
 =?utf-8?B?NnhVc09hTmw3ZmFKTnd3cjBiREluZ3BDR25TcERCcm8vVTd1NURncmhHL29i?=
 =?utf-8?B?Z09ERHA1WGZLaVJYYzN4ckxkeGJlTSsrczZvK3E2ZTlRaVZ1eHY3WE9EZ0N0?=
 =?utf-8?B?cVN2OURSdVJHN0lBTVRHWlRFVW5MSFJOWmJFaGRyc3BYNGVaZXZjcWUzUmpm?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B84DE0D1D49807418ECED5C8C11A431C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d2a809-4c03-4638-d6ad-08dd092d94a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 06:35:52.8382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1y/uGO2t109UY2FkdPtEK2Lq/mis4ndq+PCkE5LrwJcwMuhFHJfNgWolWRKz4zQDYLJRtSjilqG9Vvl7AVxbOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6643
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.309300-8.000000
X-TMASE-MatchedRID: nVQUmLJJeyZm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYPuA
	5hg2vazcZc34la8q513oOFZKBrFWj0ILcl5xUj1W+Fq9Vk/m1NqswAN/IQplq7opuhty/mW47PM
	XC4kLwUuBlwj2Y9i777Vi7fvS8x1WATOUpyqPMZwD2WXLXdz+AX0tCKdnhB58pTwPRvSoXL2y5/
	tFZu9S3Ku6xVHLhqfxIAcCikR3vq/ZPGaa7F9qwMRKvg4j77WCI8wkix7QpTEcqw4Z7yDeSIDL1
	Xw9De1e
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.309300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	C54DBA5D64A3AEE8295D590FFB406EBB4D9DB832FB27555B094761FD13225A472000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBkcml2ZXIgb2YgdGhlIE1lZGlh
VGVrIFNlbnNvciBJbnRlcmZhY2UsDQo+IGZvY3VzaW5nIG9uIGludGVncmF0aW9uIHdpdGggdGhl
IE1lZGlhVGVrIElTUCBDQU1TWVMuIFRoZQ0KPiBzZW5pbmYgZGV2aWNlIGJyaWRnZXMgY2FtZXJh
IHNlbnNvcnMgYW5kIHRoZSBJU1Agc3lzdGVtLA0KPiBwcm92aWRpbmcgbWFuYWdlbWVudCBmb3Ig
c2Vuc29yIGRhdGEgcm91dGluZyBhbmQgcHJvY2Vzc2luZy4NCj4gS2V5IGZlYXR1cmVzIGluY2x1
ZGUgVjRMMiBmcmFtZXdvcmsgY29udHJvbCwgYW5kIGR5bmFtaWMNCj4gaGFuZGxpbmcgb2Ygc3Ry
ZWFtIGNvbmZpZ3VyYXRpb25zIGFuZCB2aXJ0dWFsIGNoYW5uZWxzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCg0KW3NuaXBdDQoNCj4gK3N0cnVjdCBzZW5pbmZfbXV4ICptdGtfY2FtX3NlbmluZl9tdXhf
Z2V0X3ByZWYoc3RydWN0IHNlbmluZl9jdHggKmN0eCwNCj4gKwkJCQkJICAgICAgIGludCAqcHJl
Zl9pZHgsIGludCBwcmVmX2NudCkNCj4gK3sNCj4gKwlpbnQgaTsNCj4gKwlzdHJ1Y3Qgc2VuaW5m
X2NvcmUgKmNvcmUgPSBjdHgtPmNvcmU7DQo+ICsJc3RydWN0IHNlbmluZl9tdXggKmVudCA9IE5V
TEw7DQo+ICsNCj4gKwltdXRleF9sb2NrKCZjb3JlLT5tdXRleCk7DQo+ICsNCj4gKwlsaXN0X2Zv
cl9lYWNoX2VudHJ5KGVudCwgJmNvcmUtPmxpc3RfbXV4LCBsaXN0KSB7DQo+ICsJCWZvciAoaSA9
IDA7IGkgPCBwcmVmX2NudDsgaSsrKSB7DQo+ICsJCQlpZiAoZW50LT5pZHggPT0gcHJlZl9pZHhb
aV0pIHsNCg0KVGhlcmUgaXMgb25seSB0d28gcGxhY2UgdG8gY2FsbCBtdGtfY2FtX3NlbmluZl9t
dXhfZ2V0X3ByZWYoKSwgYW5kIGJvdGggcGxhY2UganVzdCBtYWtlIHN1cmUgdGhhdCBwcmVmX2lk
eFtpXSA9IGkuDQpTbyBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gcGFzcyBhbiBhcnJheSBhcyBwYXJh
bWV0ZXIuIFRoaXMgY29kZSBjb3VsZCBiZQ0KDQppZiAoZW50LT5pZHggPT0gaSkgew0KICAgLi4u
DQp9DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJCQkJbGlzdF9tb3ZlX3RhaWwoJmVudC0+bGlzdCwg
JmN0eC0+bGlzdF9tdXgpOw0KPiArCQkJCW11dGV4X3VubG9jaygmY29yZS0+bXV0ZXgpOw0KPiAr
CQkJCXJldHVybiBlbnQ7DQo+ICsJCQl9DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4gKwltdXRleF91
bmxvY2soJmNvcmUtPm11dGV4KTsNCj4gKw0KPiArCXJldHVybiBtdGtfY2FtX3NlbmluZl9tdXhf
Z2V0KGN0eCk7DQo+ICt9DQo+ICsNCg0K

