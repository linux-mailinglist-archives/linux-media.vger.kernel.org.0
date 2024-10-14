Return-Path: <linux-media+bounces-19592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9513499C5F6
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C696284B88
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B10156F27;
	Mon, 14 Oct 2024 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ctxkMZyo";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="C7AE2j3g"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8992715667B;
	Mon, 14 Oct 2024 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898825; cv=fail; b=tEeP7gPM1KRO3CCvTDiwj4K7t6CeEamUvEDyyhiN+eNIpxm66XESTEKv2S4F25j5DoA0nhmasAoJIyUtHrbD0V4ekttTq3GW5f1kvhB1uRPlEGCWr3dyFbxbhPYr4ylBQLnj4IXbHgtloMgZZfyE8vMygZBG9tvVm9qOtuaGvdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898825; c=relaxed/simple;
	bh=PWHMrRFk8Ta9gSs3+UkpLaeEfborQgxvL36aFyaeqrw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vas/rLwp4wj15upeukzuV+6iP0hsA2AIDXq1Yv6/CxZBEku43U+Fsm/Cr5COuWbCbB5LHEVIIupuAShTdR/Q51YtGSZiHH0S3eWDgKwY7ysUigw0mmWehO0xtYRZLFYx0q6GcZH7KrB3CgvpA7ukywrKoR17uAKdw8NJsGAhgh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ctxkMZyo; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=C7AE2j3g; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 516129ac8a1011ef8b96093e013ec31c-20241014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=PWHMrRFk8Ta9gSs3+UkpLaeEfborQgxvL36aFyaeqrw=;
	b=ctxkMZyoKnpH5AuUkjVAKQyYRuATwQkwqA5NdA6BWc2aG1XoSpXGVr8QR9OL6UerqtNc7o6jGdJJvGs4r9MjlAM1aIgNm/LdqZWuBfskJ6CEjfDqnDQHenLdN+kv1Hkk0l4AwINxo3fPySzbeKUpNIoAjuAPApxkESL3j4+WBzI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:f06a52a6-2acc-401a-93ff-91beba015a07,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:2699c006-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 516129ac8a1011ef8b96093e013ec31c-20241014
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 960422354; Mon, 14 Oct 2024 17:40:16 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Oct 2024 02:40:14 -0700
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Oct 2024 17:40:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yy5tdJinHi2N5Rpcsz9N6473qojPIrJSUuG0M001bh8q8iuesHQxljTz8e9NtYNbbPeDC1c/wKiy365Mj8AIRCeBwf11RU8yNbzvTS/YUN0u3mNDBoa0Ja+HHizk5FMFVAyzqmJj2JoOjLzGtbIYKSueL4ri2RtdIg1/6l5Pcl4fili5VyMsOh+NIQKRKVbZutvg+GjOVGi+ZYqYgfYeuav+Mvk6+gIzDMPAS9U12IxxXClCaH4vVznLCCYT+vkLrMpzXSSJrkcDR76gNWLWDgQI7sE/9XWQJt3cME8J0kn3LFH6yYOqAvOnjypbjsIcxNrBIrkziRCJkF85Gf5sAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWHMrRFk8Ta9gSs3+UkpLaeEfborQgxvL36aFyaeqrw=;
 b=ILUKVPPKcc6Wq3O4Ig7TjpVmkzf/9L7AFoJ5xMGQVTDukZsCwZwuVWd3/J3bPOKEKLXfGtwPHa2u9gg+DrQJHXVbpCKpDq37ABwTyX3VhB6KoRIAOGnS/We17J9+2rvcFT9yKINJjbySY8z/pn/Ny7RLXm6kJ+7UP5vmafT8QuSV0ho6+xbaJG5ITkRp1J9R75y+DyTv1Fyx8BSaj/xMehHp7Rz31gF8DdALqipVuTYBqtD8VrFvzE+hzGosopAEsIi1xz6BLxXJlySzOYTUjJxvthgF+OpgwTUtN0LhM+fkJq/1NFwVqRUSFqRsvUrt7mufvBaB5mSDeOvdzjrh/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWHMrRFk8Ta9gSs3+UkpLaeEfborQgxvL36aFyaeqrw=;
 b=C7AE2j3g72A/F7GpYB+X6WQv8Nh84rmoNnydycGYS5BAPHkGEVoKe2fFHFBIfuyaZazw8i++oGNsMjGfH3tZ1j5KiNs9hxgISSCS0SQ2d8ZXIk1/txlTpMsJ1mYNpjUGSpK31KdPXa4Dio/KQCGV9cGPhg0DYymWzhMtSvZNoO8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8047.apcprd03.prod.outlook.com (2603:1096:400:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 09:40:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 09:40:12 +0000
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
Subject: Re: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Topic: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarKGBaSA
Date: Mon, 14 Oct 2024 09:40:12 +0000
Message-ID: <37cdd403a4854f098c9d5e2a1bbbe3692f7576b7.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8047:EE_
x-ms-office365-filtering-correlation-id: 2c2fc134-93cf-4d6a-fbd9-08dcec343332
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NEI3YldvcUtjdXV0UThoRmZ0b0JOT3c3TVNFemE2Z01PMEtOYk5pK01aT1dN?=
 =?utf-8?B?cjJUOGRyUTE4Q1N0QUVwVmJRU3BnME5TUG5EblJ3RW54anE4WHdWUjg1MlZX?=
 =?utf-8?B?VDN2MStndzBJR1ZtaXJqOTJUVDNlZDJYc001QVR5aW9EcEkxL1lQUlN2RmtL?=
 =?utf-8?B?aFFFT3ZYOVRvWDRLbDhjU0krVU8xUnk2Y3NHd3BDNHkvTG5XdllwcFBTMW83?=
 =?utf-8?B?dTV6SFplOGprbGxLaWRhMGdLUlJOaWxhSEQyenJtbmRGYnF2QnMzV0RRdnEy?=
 =?utf-8?B?V1NzZ055WWJGYmdmSGVyanQwdE1xWkg4WE4zLzR2bzhlMXFDWDY3WkNYcEUr?=
 =?utf-8?B?Wm1rTTVCVU16L2JZNVR2VU1QOGk3dWh1Vk01N1FqV2czclM1bUhmOTVON2pN?=
 =?utf-8?B?OXRkaUtObEk1NXJaR20za1p0S3R3dWY2YXJEamIxbkhHdXl3SFVyTVd2WVFO?=
 =?utf-8?B?cGFJRFlJVjl1UG0wOGlCZE9rWVpmYlAya2pIS3ZlRmtsM0kyMDEzUjFtb25I?=
 =?utf-8?B?QkNGRmxQV1h0dGhvbkNCWGdmeWJZbjVQN2xud2RFYStTWGVNNlpjaGFOWjRV?=
 =?utf-8?B?VE53ejRQT1NVdC80TUh3bU0xUlVSNmdQSW5iRkFOOFhLOHZ2czZIWGtUNDdL?=
 =?utf-8?B?c1YvdGNlbFE2QmJaOEdpbkVzM1JsR2ovRGxCY0VNMTRPM1M4L3ZNSERFejY5?=
 =?utf-8?B?QVFPcHlLaDNkeHFSS3FxV0g5eTNMM29yYVdZeEZBVTVScWtDcC9tMkNWU3Ar?=
 =?utf-8?B?TDVvdlFUcnA3TERYUm80UFdXY2NJR2RVbi9TRTJ1RWwzVTVZWkJiS01ab0t0?=
 =?utf-8?B?SUhGb05GSk1pSnp0SkhLSjFNcjdtV29NYldHa1U0MkJ3cWRJS3hNb1JlWVhC?=
 =?utf-8?B?ekdNUEI1V3lLM0U5ZXlUcHZzQUJUTDUzWnlqTW5KeVBXYmV0ZGVkZXg4YWNm?=
 =?utf-8?B?TEg0d1dKTnNjUm5DekxwODNnZjdrZEZMRytGYldHUjY4RFQ2V2J6Ujd2Q1g4?=
 =?utf-8?B?emtmVTZHOFZRVWFYaDEwZnY3bHh6TjhuNCt4aE83cllGSnJrOU9scmlhVzIv?=
 =?utf-8?B?eHIzT2NpS21RbVNCV0FENk52VVpnS1NianJVRjdaa2xFM3ZKNVVLTU9HRzhK?=
 =?utf-8?B?YTQ2SmVPWjl4ekJIMGs5dzFaVnlRWDYwRWNleGVwdlpWcnZjc2s2cEsxczlS?=
 =?utf-8?B?NjM1ay9yUktITmwyTXkyaUZwazBtUTdraUxGVWVCckt2d2Zxb203STdSL1RC?=
 =?utf-8?B?dmRPNnQ1d0U1eEVPNmNGV1hldHdiSGp2UStYM01BWXBKNHdEQ3JNV0lBUStP?=
 =?utf-8?B?azM3Q1hyMUhYTlVQdjZEWmZPRys4MzdJSUltenJrTjJ4RFM1b0VubmlwYk9M?=
 =?utf-8?B?Wlh1NFk5cjVJVlJpMjJUNVo2bEN3eC9xY2RjR1pQdFBNT0JMTzZ4RVNZdmpi?=
 =?utf-8?B?bVZPeHlVK2pXRVg2em9TZkNPcmR5bTl2Rlhoc3pkU2NPeC91WEVxMWVtRmg3?=
 =?utf-8?B?M2VIS2FRSncyUkdmV2NJOUxjeTg0MFppay83UkI1MFc5ZjhnQ0tnTzZpRVU3?=
 =?utf-8?B?NzZIV1RVQytIS0pVQStCeUpVZlhQZlRxN1l2ZW1Mc1I4MGdsZDdIYmM2VzF6?=
 =?utf-8?B?andEdU5kS1dURzExdHBiNnhuNGRjaWRjelljSlhZdHlVUkZTTmV6dWZhUlI1?=
 =?utf-8?B?YkNJeVFaRUlEWXdjOEtoczhON255a1VwbTIremNsUUdxRkRYSVVJbHlKSm9K?=
 =?utf-8?B?ZWhnNU5tVmxwakNHby9tMzhpNVZML1dOZ2RhR0NLZVR3ZXJHY0lkd0xDNEcw?=
 =?utf-8?B?bmUwMGtzaVhtYkdVQlpaZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW1nNVRsdEpuTDV1MytURG1XYkNpNUtOc0YyclZCV2djTHY2WDlnaDFkWmU0?=
 =?utf-8?B?QzM5QnVkQThxVERuWGplVVJoOWw0Z2txc3ZNQXVNREEvOGRWUDFoOVJzdW1k?=
 =?utf-8?B?QWc5NkF3VWZ4TnZXWHNUZi9INlVoOUh1bTJjZGNuaW5zY1pwaWxodzVvU3Ev?=
 =?utf-8?B?MXorV0t1SFNLQmsxcWtSSjZaZHpqeVAzWVJkaDBTeXB0UjlVNHJ4ZDJWb05S?=
 =?utf-8?B?c3dsZ0tlcFJPVzBkMWZ1bEVxdngrZExCY0VuY0N1U0JLeVcxZmFnT2J3UWVY?=
 =?utf-8?B?VzUweG4wdHRSaDNmZFdaWFVDT2dGM1M4R0EvLzVwYXNxdUhJQlM3dWxnNnU4?=
 =?utf-8?B?d1MydHN4UWRjd3ZDcXpmd1RQRFA2Rks3S3FYeGRwR0xNN3BKa1Y0VU5HU0RW?=
 =?utf-8?B?Rm40bWkwZTh4KzRqV2VjS1IrRHRqNTVoL2JrZm1qTGdhVFJka2JuK21kcElH?=
 =?utf-8?B?ZjVoK2xNK2taR3A0NHhEVXNWN2ltbjNIQkVzdFgrcm0yU3g4UzYyUmRkblVJ?=
 =?utf-8?B?cGtteWV2bEJmMmpBSVI3c01mV29mR1N4bEVLbmZCeFIrKzE3QjBubWVmT2FZ?=
 =?utf-8?B?M3AwQ1JEaURxVHZLTWVBQ002ZTQrVTltQ0dqbHA0WW4yRkt1WE1rRWhwK0sx?=
 =?utf-8?B?T1lNZUI1a3dKMkhLanpQZnVyNlhlSld3dlBCeG1uVDBMWjlxdktWbGM3RUc2?=
 =?utf-8?B?OXJaeVBnV0NrN0txZTVidllJN3VQRjZDblU1dVhqNUdmL3Vib2xXeVJuaE1m?=
 =?utf-8?B?YnVEaDNndFNRN1AxM2xSaEprRUgxMnZPcWNSNXovRTQrSUxUV2tJSytXcjlh?=
 =?utf-8?B?WU83WGI3Zjl4TWxDbXZYeHhDS2JuTFRTRU52WWRXSmdPL2I5Z3ZrbWw5bGdq?=
 =?utf-8?B?RkdKRjB2WVZiVWhsY2RjZU4yTVA3OVpiQ3loZ1JwRXJxQysvZ3pDaHc3Qkk1?=
 =?utf-8?B?VllockhCVGZCUWx1RklWc01qUGM5TWMxdWk5dXNLSk9FZ1ZFaU1pdEY4QlJu?=
 =?utf-8?B?OEh0S1J6ZEpSSlFzUFlEQmZnaTRMUXBTTE1VS1Jtd3M3dmg3WUtheWJBU0F6?=
 =?utf-8?B?UmQ0S3FCNmRsTEt6S09Gd0xsODNaVU11QnpjUjhiblcrVkdHNU9XcGhiblRk?=
 =?utf-8?B?U2RzY2tkQVF1amFZak5WTUFla3NMMVFnTERDRE5kUVAwUHBBV2NicWlFRXQx?=
 =?utf-8?B?dzdLdnR2eTZwRUxLQ1B5Uys0YUFHbGsxVXRhOHA4WWFNVUFrdHNUd2RkWis0?=
 =?utf-8?B?WVl4RWtYaURHbUMzSVQ3Vm5UaW9HWi83RXZOaW9vZ2lYY2tqRmRNSFJxeGFG?=
 =?utf-8?B?YXlMV1ZtVUhoZVVMSWhTT2lMKzV6bXQ4WkdZSm50NFl3bUwvRFU2Snoza1Vl?=
 =?utf-8?B?dkFVUmhPdk0vMzFPTDU5bFlPZ1FCVm0xaG4vbGwySmVzZ010a3RJTzRHUUl1?=
 =?utf-8?B?SVprOVQwQm5rQnB2RUF1eGNLdGxzc0c5Y3R3Wkhvei94WFZaUGcrampaVFNj?=
 =?utf-8?B?aUMweVp5Z2pxZDNzVnVuZTMxWFZxVlAzQXNsbTgvK1RZQkpkeWJvVEg3eWVR?=
 =?utf-8?B?Sms3K0lwZ0hwV1IvWDl6aE8xWStVeEF0akZlektVVklpeDlha1NZZFI2R25l?=
 =?utf-8?B?SlBaTEc2OWxiWFdPVTZNYVVKb2JJN2VRVEk0R2pVQ0Q4aXNDUmh6cDJGaWEr?=
 =?utf-8?B?ZjBQZ0NQcWpVVThpRlAyeUIvQWNwQUs1SzdyT3F3QVdpQXNsdDFWVjlieTIr?=
 =?utf-8?B?K0liNEFPOUxzL3ozMzZiK3BVVVhGRmJ5L3plUHNlUVY4NTlQQ3AvVmVraXJL?=
 =?utf-8?B?ZS9LK2JpODdROWRhcU52SVBzeHJ1Y0svdStaSG1RWkhsNjFSUWJyT1kza2VT?=
 =?utf-8?B?cWZnZGJEcVMrOUJQWVN0Q3VSb0E3MmRKUjlSaW9sZTJCM1pWVStoZkRyRlI2?=
 =?utf-8?B?dmlmaVFzdis4eHdTZFA0L0RhOU1pdUhPMW1Ic2I2c1Y4dGwwcm1ocnROY1k0?=
 =?utf-8?B?NzlFZFFHWjlkWWV2VnVDQzNBYW0wSW1mamJickFIclVBR0cxK1JJaWc5NHJi?=
 =?utf-8?B?MTZJNXA4NmRGRS9LbUMzaHhyOGtlQXVjd29keVZPNUVMdTRYL2RpZURORnZx?=
 =?utf-8?Q?a+NXJyXiFUf2nGYqoOhTOYW8S?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59240BA9A688FF4181EEFF08BB617F27@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2fc134-93cf-4d6a-fbd9-08dcec343332
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 09:40:12.1184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MSYFnKyXDh6ZhYYYVowe4hSmVNIu8iLiypJ3CjiKobKAWIg+1jM9FamPw7zFGgXx2DpyYZ56ssnEQMRSBMeeKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8047

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSB0b3AgbWVkaWEgZGV2aWNlIGRy
aXZlciBmb3IgdGhlIE1lZGlhVGVrIElTUDdYIENBTVNZUy4NCj4gVGhlIGRyaXZlciBtYWludGFp
bnMgdGhlIGNhbWVyYSBzeXN0ZW0sIGluY2x1ZGluZyBzdWItZGV2aWNlIG1hbmFnZW1lbnQsDQo+
IERNQSBvcGVyYXRpb25zLCBhbmQgaW50ZWdyYXRpb24gd2l0aCB0aGUgVjRMMiBmcmFtZXdvcmsu
IEl0IGhhbmRsZXMNCj4gcmVxdWVzdCBzdHJlYW0gZGF0YSwgYnVmZmVyIG1hbmFnZW1lbnQsIGFu
ZCBNZWRpYVRlay1zcGVjaWZpYyBmZWF0dXJlcywNCj4gYW5kIHBpcGVsaW5lIG1hbmFnZW1lbnQs
IHN0cmVhbWluZyBjb250cm9sLCBlcnJvciBoYW5kbGluZyBtZWNoYW5pc20uDQo+IEFkZGl0aW9u
YWxseSwgaXQgYWdncmVnYXRlcyBzdWItZHJpdmVycyBmb3IgdGhlIGNhbWVyYSBpbnRlcmZhY2Us
IHJhdw0KPiBhbmQgeXV2IHBpcGVsaW5lcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lh
bmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0K
DQo+ICsNCj4gK3N0YXRpYyBpbnQgbXRrX2NhbV9maWxsX2ltZ19idWYoc3RydWN0IG10a2NhbV9p
cGlfaW1nX291dHB1dCAqaW1nX291dCwNCj4gKwkJCQljb25zdCBzdHJ1Y3QgdjRsMl9mb3JtYXQg
KmYsIGRtYV9hZGRyX3QgZGFkZHIpDQo+ICt7DQo+ICsJdTMyIHBpeGVsZm9ybWF0ID0gZi0+Zm10
LnBpeF9tcC5waXhlbGZvcm1hdDsNCj4gKwl1MzIgd2lkdGggPSBmLT5mbXQucGl4X21wLndpZHRo
Ow0KPiArCXUzMiBoZWlnaHQgPSBmLT5mbXQucGl4X21wLmhlaWdodDsNCj4gKwljb25zdCBzdHJ1
Y3QgdjRsMl9wbGFuZV9waXhfZm9ybWF0ICpwbGFuZSA9ICZmLT5mbXQucGl4X21wLnBsYW5lX2Zt
dFswXTsNCj4gKwl1MzIgc3RyaWRlID0gcGxhbmUtPmJ5dGVzcGVybGluZTsNCj4gKwl1MzIgYWxp
Z25lZF93aWR0aDsNCj4gKwl1bnNpZ25lZCBpbnQgYWRkcl9vZmZzZXQgPSAwOw0KPiArCWludCBp
Ow0KPiArDQo+ICsJaWYgKGlzX210a19mb3JtYXQocGl4ZWxmb3JtYXQpKSB7DQo+ICsJCWNvbnN0
IHN0cnVjdCBtdGtfZm9ybWF0X2luZm8gKmluZm87DQo+ICsNCj4gKwkJaW5mbyA9IG10a19mb3Jt
YXRfaW5mbyhwaXhlbGZvcm1hdCk7DQo+ICsJCWlmICghaW5mbykNCj4gKwkJCXJldHVybiAtRUlO
VkFMOw0KPiArDQo+ICsJCWFsaWduZWRfd2lkdGggPSBzdHJpZGUgLyBpbmZvLT5icHBbMF07DQo+
ICsJCWlmIChpbmZvLT5tZW1fcGxhbmVzID09IDEpIHsNCj4gKwkJCWlmIChpc195dXZfdWZvKHBp
eGVsZm9ybWF0KSkgew0KPiArCQkJCWFsaWduZWRfd2lkdGggPSBBTElHTih3aWR0aCwgNjQpOw0K
PiArCQkJCWltZ19vdXQtPmJ1ZlswXVswXS5pb3ZhID0gZGFkZHI7DQo+ICsJCQkJaW1nX291dC0+
Zm10LnN0cmlkZVswXSA9IGFsaWduZWRfd2lkdGggKiBpbmZvLT5iaXRfcl9udW0NCj4gKwkJCQkJ
CQkgLyBpbmZvLT5iaXRfcl9kZW47DQo+ICsJCQkJaW1nX291dC0+YnVmWzBdWzBdLnNpemUgPSBp
bWdfb3V0LT5mbXQuc3RyaWRlWzBdICogaGVpZ2h0Ow0KPiArCQkJCWltZ19vdXQtPmJ1ZlswXVsw
XS5zaXplICs9IGltZ19vdXQtPmZtdC5zdHJpZGVbMF0gKiBoZWlnaHQgLyAyOw0KPiArCQkJCWlt
Z19vdXQtPmJ1ZlswXVswXS5zaXplICs9IEFMSUdOKChhbGlnbmVkX3dpZHRoIC8gNjQpLCA4KSAq
IGhlaWdodDsNCj4gKwkJCQlpbWdfb3V0LT5idWZbMF1bMF0uc2l6ZSArPSBBTElHTigoYWxpZ25l
ZF93aWR0aCAvIDY0KSwgOCkgKiBoZWlnaHQNCj4gKwkJCQkJCQkgICAvIDI7DQo+ICsJCQkJaW1n
X291dC0+YnVmWzBdWzBdLnNpemUgKz0gc2l6ZW9mKHN0cnVjdCB1ZmJjX2J1ZmZlcl9oZWFkZXIp
Ow0KPiArDQo+ICsJCQkJcHJfZGVidWcoInBsYW5lOiVkIHN0cmlkZTolZCBwbGFuZV9zaXplOiVk
IGFkZHI6MHglbHhcbiIsDQo+ICsJCQkJCSAwLCBpbWdfb3V0LT5mbXQuc3RyaWRlWzBdLCBpbWdf
b3V0LT5idWZbMF1bMF0uc2l6ZSwNCj4gKwkJCQkJICh1bnNpZ25lZCBsb25nKWltZ19vdXQtPmJ1
ZlswXVswXS5pb3ZhKTsNCj4gKwkJCX0gZWxzZSBpZiAoaXNfcmF3X3VmbyhwaXhlbGZvcm1hdCkp
IHsNCj4gKwkJCQlhbGlnbmVkX3dpZHRoID0gQUxJR04od2lkdGgsIDY0KTsNCj4gKwkJCQlpbWdf
b3V0LT5idWZbMF1bMF0uaW92YSA9IGRhZGRyOw0KPiArCQkJCWltZ19vdXQtPmZtdC5zdHJpZGVb
MF0gPSBhbGlnbmVkX3dpZHRoICogaW5mby0+Yml0X3JfbnVtIC8NCj4gKwkJCQkJCQkgaW5mby0+
Yml0X3JfZGVuOw0KPiArCQkJCWltZ19vdXQtPmJ1ZlswXVswXS5zaXplID0gaW1nX291dC0+Zm10
LnN0cmlkZVswXSAqIGhlaWdodDsNCj4gKwkJCQlpbWdfb3V0LT5idWZbMF1bMF0uc2l6ZSArPSBB
TElHTigoYWxpZ25lZF93aWR0aCAvIDY0KSwgOCkgKiBoZWlnaHQ7DQo+ICsJCQkJaW1nX291dC0+
YnVmWzBdWzBdLnNpemUgKz0gc2l6ZW9mKHN0cnVjdCB1ZmJjX2J1ZmZlcl9oZWFkZXIpOw0KPiAr
DQo+ICsJCQkJcHJfZGVidWcoInBsYW5lOiVkIHN0cmlkZTolZCBwbGFuZV9zaXplOiVkIGFkZHI6
MHglbHhcbiIsDQo+ICsJCQkJCSAwLCBpbWdfb3V0LT5mbXQuc3RyaWRlWzBdLA0KPiArCQkJCQkg
aW1nX291dC0+YnVmWzBdWzBdLnNpemUsDQo+ICsJCQkJCSAodW5zaWduZWQgbG9uZylpbWdfb3V0
LT5idWZbMF1bMF0uaW92YSk7DQo+ICsJCQl9IGVsc2Ugew0KPiArCQkJCWZvciAoaSA9IDA7IGkg
PCBpbmZvLT5jb21wX3BsYW5lczsgaSsrKSB7DQo+ICsJCQkJCXVuc2lnbmVkIGludCBoZGl2ID0g
KGkgPT0gMCkgPyAxIDogaW5mby0+aGRpdjsNCj4gKwkJCQkJdW5zaWduZWQgaW50IHZkaXYgPSAo
aSA9PSAwKSA/IDEgOiBpbmZvLT52ZGl2Ow0KPiArDQo+ICsJCQkJCWltZ19vdXQtPmJ1ZlswXVtp
XS5pb3ZhID0gZGFkZHIgKyBhZGRyX29mZnNldDsNCj4gKwkJCQkJaW1nX291dC0+Zm10LnN0cmlk
ZVtpXSA9IGluZm8tPmJwcFtpXSAqDQo+ICsJCQkJCQlESVZfUk9VTkRfVVAoYWxpZ25lZF93aWR0
aCwgaGRpdik7DQo+ICsJCQkJCWltZ19vdXQtPmJ1ZlswXVtpXS5zaXplID0gaW1nX291dC0+Zm10
LnN0cmlkZVtpXQ0KPiArCQkJCQkJKiBESVZfUk9VTkRfVVAoaGVpZ2h0LCB2ZGl2KTsNCj4gKwkJ
CQkJYWRkcl9vZmZzZXQgKz0gaW1nX291dC0+YnVmWzBdW2ldLnNpemU7DQo+ICsNCj4gKwkJCQkJ
cHJfZGVidWcoInBsYW5lOiVkIHN0cmlkZTolZCBwbGFuZV9zaXplOiVkIGFkZHI6MHglbHhcbiIs
DQo+ICsJCQkJCQkgaSwgaW1nX291dC0+Zm10LnN0cmlkZVtpXSwNCj4gKwkJCQkJCSBpbWdfb3V0
LT5idWZbMF1baV0uc2l6ZSwNCj4gKwkJCQkJCSAodW5zaWduZWQgbG9uZylpbWdfb3V0LT5idWZb
MF1baV0uaW92YSk7DQo+ICsJCQkJfQ0KPiArCQkJfQ0KPiArCQl9IGVsc2Ugew0KPiArCQkJcHJf
ZGVidWcoImRvIG5vdCBzdXBwb3J0IG5vbiBjb250aWd1b3VzIG1wbGFuZVxuIik7DQo+ICsJCX0N
Cj4gKwl9IGVsc2Ugew0KPiArCQljb25zdCBzdHJ1Y3QgdjRsMl9mb3JtYXRfaW5mbyAqaW5mbzsN
Cj4gKw0KPiArCQlpbmZvID0gdjRsMl9mb3JtYXRfaW5mbyhwaXhlbGZvcm1hdCk7DQo+ICsJCWlm
ICghaW5mbykNCj4gKwkJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJCWFsaWduZWRfd2lkdGgg
PSBzdHJpZGUgLyBpbmZvLT5icHBbMF07DQo+ICsJCWlmIChpbmZvLT5tZW1fcGxhbmVzID09IDEp
IHsNCj4gKwkJCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5jb21wX3BsYW5lczsgaSsrKSB7DQoNClRo
aXMgZm9yLWxvb3AgaXMgaWRlbnRpY2FsIHdpdGggdGhlIGZvci1sb29wIGluIGlzX210a19mb3Jt
YXQtaXMtdHJ1ZSBibG9jay4NClNvIHRoZSBjaGVja2luZyBvZiBpc19tdGtfZm9ybWF0IGlzIHJl
ZHVuZGFudC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKwkJCQl1bnNpZ25lZCBpbnQgaGRpdiA9IChp
ID09IDApID8gMSA6IGluZm8tPmhkaXY7DQo+ICsJCQkJdW5zaWduZWQgaW50IHZkaXYgPSAoaSA9
PSAwKSA/IDEgOiBpbmZvLT52ZGl2Ow0KPiArDQo+ICsJCQkJaW1nX291dC0+YnVmWzBdW2ldLmlv
dmEgPSBkYWRkciArIGFkZHJfb2Zmc2V0Ow0KPiArCQkJCWltZ19vdXQtPmZtdC5zdHJpZGVbaV0g
PSBpbmZvLT5icHBbaV0gKg0KPiArCQkJCQlESVZfUk9VTkRfVVAoYWxpZ25lZF93aWR0aCwgaGRp
dik7DQo+ICsJCQkJaW1nX291dC0+YnVmWzBdW2ldLnNpemUgPSBpbWdfb3V0LT5mbXQuc3RyaWRl
W2ldDQo+ICsJCQkJCSogRElWX1JPVU5EX1VQKGhlaWdodCwgdmRpdik7DQo+ICsJCQkJYWRkcl9v
ZmZzZXQgKz0gaW1nX291dC0+YnVmWzBdW2ldLnNpemU7DQo+ICsNCj4gKwkJCQlwcl9kZWJ1Zygi
c3RyaWRlOiVkIHBsYW5lX3NpemU6JWQgYWRkcjoweCVseFxuIiwNCj4gKwkJCQkJIGltZ19vdXQt
PmZtdC5zdHJpZGVbaV0sDQo+ICsJCQkJCSBpbWdfb3V0LT5idWZbMF1baV0uc2l6ZSwNCj4gKwkJ
CQkJICh1bnNpZ25lZCBsb25nKWltZ19vdXQtPmJ1ZlswXVtpXS5pb3ZhKTsNCj4gKwkJCX0NCj4g
KwkJfSBlbHNlIHsNCj4gKwkJCXByX2RlYnVnKCJkbyBub3Qgc3VwcG9ydCBub24gY29udGlndW91
cyBtcGxhbmVcbiIpOw0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+
ICsNCg0K

