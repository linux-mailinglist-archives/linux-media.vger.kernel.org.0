Return-Path: <linux-media+bounces-47193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EE1C62C68
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 08:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B492A359247
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 07:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D68319864;
	Mon, 17 Nov 2025 07:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sUIU/dYu";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="cA1buiXB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C77319603;
	Mon, 17 Nov 2025 07:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763365272; cv=fail; b=UhCj03dt6dKFefqW8hnMAJp6xpKFockd01kLgL0vOFhpRYSPJA1T1enM8nPT2L7YVinGf4IcRW8usiRmFTuB39Ps7saXEtH0fCOhw0P60SClnbDiE4BFPj8V+7Xsz0tffMHyF0R9bD0TBwcPyvIXTR3ZybzMbgfSxE9oozogcBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763365272; c=relaxed/simple;
	bh=KnUki16WKu7AamkPLg/3D1UlDVm6KUfkznZPVlUXzp8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CzRg/SgQxhBSNPeHa87yin82eWfc0IDLU93f5SLmyfLRsCSCcoUAVTxy+nSWrij0xdSInSUKCwL+WAxvy4HFfXcGRpmGQPn96l9paY3bN+5CfbNmcIU3FSoeQbr74RrbsT5zY2mRuvTmYkKM75OtDXJu4X66u8HpIem1Yefv94I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=sUIU/dYu; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=cA1buiXB; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c338e99ac38811f08ac0a938fc7cd336-20251117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=KnUki16WKu7AamkPLg/3D1UlDVm6KUfkznZPVlUXzp8=;
	b=sUIU/dYu4/P8eAtLTK0vZFB1WocouzwQcSFzlMjxhBfXT7UiFKCjoRCtk2vpuoVZeda5YbXS6op3F/A1wwSOYfq83Nn2LUP6yIdymj96ugnPtCrvKKH8uTa4l6GXDLATUv1n8RdwHKlXmlGQiAzfVHVe2KZo9hPpXRt7XlzeV10=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:847ad8b1-9c58-4a6a-b1f1-94988541b8df,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:4a30ba82-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c338e99ac38811f08ac0a938fc7cd336-20251117
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 401043449; Mon, 17 Nov 2025 15:41:00 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 17 Nov 2025 15:40:59 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 17 Nov 2025 15:40:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqUPaDDyjLhkurOg2zH8DZTOnaLkptARQo0NpIUTVxpf79r9xGmjlEtUxVCjwIcseXw+P6PFFJNLD65U8RcpuRj6Haz1bvZyduxMdp/Dtm3NR8MU7COmDdDgm/RecZ4v3hVk4J4KMnl+JqqodW7laBB5I+YU8f+3vYnBd0/TCVDjrY3dSoPar4kShFhEaB8doo4xOAWT4P1wBEmYx80nUpVGICYjE3XMbODtAnKKv/rgnl6djmZeDQ7hNNq9kcOfxFw12uPo8CXZhJWuDgFv1Z/Ynr/qEBUNi+KMhWBF4Py8HB3PsfL/R+gXkrwr2zXt0MgODbT1P7hr8Gued78d3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnUki16WKu7AamkPLg/3D1UlDVm6KUfkznZPVlUXzp8=;
 b=FQCiKIFcSx/P9gEBX5sn44kNIKxqUr/lI184YFL3VXfvNGAyuV2st76wKIp4/dLI5AJ37FAUqa6f/mX9u2u/zcZ6aLMNM3OFMhMioF3iPWo3jeS2ML8VL8LO4RRKaXFKMPULz7eyKRj/iDyUSS8qYCdbtyHRoeC8YV3gMT3QL6kkDRBv+KRetVf6T7PbPZFav8li3quaxjXhQ3UdAlr6GGQURVLwxQOe/KeNa13WKgxykvawBfqJakvljGOM1lhodOTz0/6+b6JZO5k5Js7HFQFhzCIgM7YUC2bfdxeAoInobmbTe/Bt3vexlJWEaeqMP8FEwvFfFjNSF5Wb9sP7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnUki16WKu7AamkPLg/3D1UlDVm6KUfkznZPVlUXzp8=;
 b=cA1buiXBZV7F0U3VzzDmwlFGZM9MMVSjGy1NtSJffmPmT00KanxVJK1cYCq6Y50LpBLDe7AXUxXVIaxMxeJ7XUDHgsnCihnq9QSnJT0UnMgGDByg0PY4ww0EpJxBI8N53votm1XVbgZU+VOxUqzdrI8alO19Ickq8Vh6ZcvaI6k=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by KL1PR03MB8318.apcprd03.prod.outlook.com (2603:1096:820:111::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 07:40:53 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 07:40:53 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 4/8] media: mediatek: vcodec: Add single core VP9
 decoding support for MT8189
Thread-Topic: [PATCH v5 4/8] media: mediatek: vcodec: Add single core VP9
 decoding support for MT8189
Thread-Index: AQHcTuSniJYgRkaqE0G/3h+2/l/w6bTltacAgBDXjwA=
Date: Mon, 17 Nov 2025 07:40:53 +0000
Message-ID: <7514a1019170547402bc730d460c095d3644036c.camel@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <20251106061323.2193-5-kyrie.wu@mediatek.com>
	 <5834fe661f38462d65795a20b5a4f9d2a12d3b35.camel@collabora.com>
In-Reply-To: <5834fe661f38462d65795a20b5a4f9d2a12d3b35.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|KL1PR03MB8318:EE_
x-ms-office365-filtering-correlation-id: bb4e6a4b-a440-428a-78a0-08de25aca33f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UGJUZFlWNEg5blQ5TElTTDVIMlNKNXhRQ0ZqNUhRRXRQTG11TXhLT3hIenli?=
 =?utf-8?B?cFdDaHJVd3k3NWtLY3U0WlZvRlV1dFJPc1pyUWNyN1dsamVpa1RuQXp4c3d6?=
 =?utf-8?B?KzczWjZmOURBdDRXSUN5NkF3aWkycUpNOVo1OXdEZ25sK0JtNm9zRHcwQXc5?=
 =?utf-8?B?VTA2MlZua1E5d2RUTGZQYzNKdVlRdlp5cFl1UHJYK0pXOElpdFZpMG9KUHho?=
 =?utf-8?B?YTRuak9WbkpqS013YlhmcDFMS1U0VWdpSFh3QTIxMGVISHA4Z2tOL1ZwL25X?=
 =?utf-8?B?ZWxkeE5rR1FJWHdGU0tUSDZiRGkvb1hDaERUVENLS2FnZDVDVnFlRTdGaFNh?=
 =?utf-8?B?RkRIOE5QdmdqckZFektQeVl0ZXU2dlcxNWhNNkNTT3V2MWdTaEFnZXBnaTda?=
 =?utf-8?B?MExvL1N4OForUGlrb0pReE00THI0RUM4bUt2R1NRaVQ4V01FYm9BblJqMm5F?=
 =?utf-8?B?K0NISnViTHZDaWFSaEdKMWRFK1I4cUV2R042dnQ1RGhIVUVzQlZtSGFxT1Bo?=
 =?utf-8?B?QklWdm1RcXV3ZWRVWm9xN0JHQ3hIQTJJV2NNdDZQQVVLbVhvSkkzWnZuNC9r?=
 =?utf-8?B?ZDRQMWRBc0xKSVhPdm91RFdzVkR1V2FLV3RPY3M5UHRDSkE2OEF0MW5XQUpE?=
 =?utf-8?B?RlFHZzN6Z3l1c1U2ZzNZeHpMckJsUDVWSkJFSytQRUNRM215OEdoUlhIMkhl?=
 =?utf-8?B?Y0J4OGhmRVRRV21vTVNEMnRTY2ZGQWlTQ1BtU0lJbHM2SkNHZHJEV2JiZG4v?=
 =?utf-8?B?czNpTGRyZTNlcEZPbWhRSk1nWU5VVFZ5WFBPZlNWZmkzUS9NUGtSS0czRFRZ?=
 =?utf-8?B?Y0E5WFlFdHRZbDhEQkNlRHY5Wkw0VWhqL2x2R1FPNFlZMHpaUVh5N2Rua0ky?=
 =?utf-8?B?bjVmV0ZXRXdZSVgwYzFGLzRqbWg1ak0vSGtwOVRyRHloaEJncFBjb0ZIcWtI?=
 =?utf-8?B?TUNMRzdIVDBtdzBDajAwRTdaOFdhcXgzalNMcTQ0M25rY3hoUEJJOTZVVjQx?=
 =?utf-8?B?TjFuNWVkQndESkZaSjh0R0poaEhvUTA1UHJ4d3g1WkJ4dDFQc3g3di9WNERM?=
 =?utf-8?B?Qm5nc2lXM1BWcHpHSURaYVp0ZFlXZU9DMVBObjBoRzR3dWFqNk1LVG5KTEFj?=
 =?utf-8?B?Y1g3ako5WldxUW5oU295TDhjb002WVRSNmM0b1M1anlBbVNKRmVmeDZBSnBP?=
 =?utf-8?B?NmcxOXl4QlNXSHhkb0IrdFZjUlNxN093bUVYRk5jNHVxNmVlQUZQSi81YWpO?=
 =?utf-8?B?TnV3K0FjbEtqakVWVkVXN2FzRjVPb29wQWw3Yk1tTkhvVzdpT0J1TFZONHlU?=
 =?utf-8?B?VDhTNW9FeXhsOUFoakxLUWFFRTRSU2VWRS8xTzkrV3p0Q1dkZEpjODdLeE5R?=
 =?utf-8?B?VCtVa1pNR3g4bjhVUVl1TXdNNlhlUnU3NkZOU3pDK09GbHlaeTROdXlhY0N6?=
 =?utf-8?B?U2h3LzRHbTl0akRrdXcvQmlWSWdYNk5BUkw2cFF5d3ZZd1dxNWFpNnREb3FV?=
 =?utf-8?B?MCt6aGRTZmtJcWZlTjZmbHNyVUptVUhEU00vTnExOVVlWU05SU1VRFI4cjBt?=
 =?utf-8?B?YU5tNGRqd1ZQdlNGcnZlcTNHeVJBMVpNUllBRTlSendIYWpvYWZnRTZSL0Q2?=
 =?utf-8?B?bzhpRHYyR0lCZ2R1b0VteDFCSmU0eGZRWm4rZEYyUlRVUVozKzFBeGtwQlJa?=
 =?utf-8?B?T0FQZXVXVnQ1ZTlQS1J2UjFXUkV4UzFWVHZ4T2RPZ2F5R1poRGR0UDljME90?=
 =?utf-8?B?M0RFSmJBaDJ1OXVyblZHL2NkZ1VicDluZGh4V1JwMEhpNmlFTVVTL3cyU2xF?=
 =?utf-8?B?TDYyVXFlNUZrL1ZZbnhsNldwdHlaa096cHB6YnM4dktzUUxudDlSTTRudU5P?=
 =?utf-8?B?TnNXU25OanJWOTBwYmN4dGFNeVpBUjUySS9ueE5MWmRBWFlvMVhES3ZwRW9R?=
 =?utf-8?B?eWRRcHRJTHRsYTR6KzlOZnUrMEhUcTZYL043WnRDT0NNREhYWjNzOTRNbGNo?=
 =?utf-8?B?QnR0MDY3a0pDNmlKaFdUZFlVZmpibWZTVFdEQnUvMlVqdGdmbml0UVdBUmI3?=
 =?utf-8?B?Rmx5Y0dyc0lULzNCTDV0TGhtTTJtT0JuYUduZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0tHWWpONVpTdmxhdmFYU2h0Z1VDSHJXdXU5QndmWllxVjdMd05OcHp4RG9J?=
 =?utf-8?B?Y0xrdHY3UHlpV3RLSGwvZkhuRjFtUjVRbzJtbnBOZ3d4TC9pWjBDc2tZK3pl?=
 =?utf-8?B?VVFtRUJ2ZmUwcmVoL3JSdjdBWDkxUkczSUJjR1paY2pNRWxIaUppcWd0a3Jt?=
 =?utf-8?B?N1hBaFVsUmU1d0VGRzNUQUdZclNKRHdTVFppYVY5NjlwVGNwQk53YXdKQVMx?=
 =?utf-8?B?UzQ2ZUQwR1FXOTdPbEhGckduNGJQNlUrd0ZnV2NqVmVxUTRsb05HdUVMOGR4?=
 =?utf-8?B?MUVodmF2cWV1RHJSMGVyTmJ3eFprTFJIZkRTY0hUMm8waGdEc2hnQ1Nlempn?=
 =?utf-8?B?R1pLUEVBQkhPTTVoTDhydytNUnNEWloweFQ3NXVJMU1Yd0NTcUZrYzlGN2lr?=
 =?utf-8?B?RDRJREwyK0dIVUZtUUVYbUlIVWIxYitmQU8wWGtPSSt2RlNscUUyenlmWUt3?=
 =?utf-8?B?dWxMSGZJSFY5eU43SkxPdGhWdmwwa2N0R2hZYk5Bc2RQOGxQTHN5NVRhMDM0?=
 =?utf-8?B?Q0JaZU5GcithblR1WVNSVGZpSGxsUUNtM1gyemNacG05c0txNytaOFVXNDM4?=
 =?utf-8?B?ZTFvU2lleFZWUTB3c1hmZjR1eGRzK3FUWUNkbTF1Q3MveHhMU3VlUk9EQklP?=
 =?utf-8?B?K3BIS096YW4vRlkxU3pqb25YQXRHdGtneWhtRG1tOFJIbnNmRER4UmwxanAr?=
 =?utf-8?B?R0EwSnFkdUxOTXF2RTlYNllQOXRUTVhKcFhRM1dlc2UrQ2xkOHduSkxVSnAz?=
 =?utf-8?B?LzNiNmJpdkJmVDJnVkNSL3NDNytwdVIxRVZ6eUpqTlNnMnk0aytnRmNObzda?=
 =?utf-8?B?cUg1NVhwMDNLbFY3cmIzMEpYNWY4VFk5WjB2Y1NXWWRCU1dmb0pNTlVWRU9u?=
 =?utf-8?B?Mm5RcVVReWErcFVRb1V4WktQSnJsV3B3N3NwYlJTRnFpT1lOdXZUT0x0WTRw?=
 =?utf-8?B?aktidms3L1BUR0JkRFY5SDRvNVVBNGE4MWoxNGFwWitPNHJJQmtjMFpOUG9m?=
 =?utf-8?B?UEtDek1BV3EwZCtCRmhkY2dxM041MENCZWF4amM5WDB2bXUrd3VUK1FpRmYx?=
 =?utf-8?B?dkRaMHlBQ0swZTBqL3k3ZzNXUGVUOGJubzhCbG1PeHRpeGxSYUdVMFZLdWJh?=
 =?utf-8?B?ejgxWlVyaEJLVW13dUphZUR2blBhQi9yTzZaRndMc0tUOVZIblV6cXk3SklP?=
 =?utf-8?B?Q1J5TURCQjBUaGoycmJJbEg1b01mSW1NaVliWUFZSllna1VXK1ZNaXp5L2Nz?=
 =?utf-8?B?OWtCeTA5VUZieWFNOEhacC9PZjJYSE9xVUpTSFROSGI1eUhtZ0dHYjdwL1hs?=
 =?utf-8?B?RVlLajV3UzRCa1N1ODFpcTFiYXd3a2p4c1kvV2hHbE5uUHVIVFBicGJVRFY2?=
 =?utf-8?B?dkNmbTBncnozNlVGNTBEdHZ2MEIvaUREYk1qM1FiK1M2ZVVocmdDQnNwSEpW?=
 =?utf-8?B?OFlDRXdKNS9HS3hWTmlWZnhmOVNEaFVtN1VzKzV5UWk4M1d1VElobWFaVVdB?=
 =?utf-8?B?RFJVaFU2dERORFB2QURod0loc1VkSFZrVG44aWVSNkN1Q0pQMDdjbkRYN1BR?=
 =?utf-8?B?OG5LOGIvamI4bTNRQVJIY3hzNytRM29ZQXdVM21IK3B5YmJQN1BvMlpxU0Fm?=
 =?utf-8?B?eXBuUjVlVm1IYlhJZGpScW1hUEdYdDV4cXo0TlVabUVLaVFsVzdRcTlyQ3gx?=
 =?utf-8?B?MnpaSFltTmtCY2xpenhCWG4vQ1BwWmhFZUtGa3FpRWRwWmVsL3dvamVSM1ZN?=
 =?utf-8?B?SlJacTZ6b2k0TVhUc20yVHNYcm40Rnl1TlJIdG9lUDNxdm85S2VRVlpGbkFk?=
 =?utf-8?B?WUxXQWh4OURaRUdNbEQrYWFpT2pBZDh5ZU0vbFFlZ0FoZGphOTU1Z1BtSkhZ?=
 =?utf-8?B?STNRU1hxQWpiUXhtUXAzdkx6TGpCN1FXOHI3S1lCRmlzYXMvUVFjOUUvSnFG?=
 =?utf-8?B?RGhxa1ZTakREeEpWa2dRbmgrUmZtK21hb1IxVXVjSnVVMGVrOCtmb0g2UG03?=
 =?utf-8?B?ZVlRMFJZNE5YTTdjZkEvQ2JXcGVmRS9YWitWdFlwY0xkRVJyM3RNTklFREFW?=
 =?utf-8?B?TkRvK0NkNWV1NTlZYlVtMC9nSFl4cS96WVRxSFJjTGQ0VGhaNW1kQU9zZUhS?=
 =?utf-8?Q?PYq6dR6eQ/ei5Joxyvaz341Ei?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45DA2F54D384104FAF3CEE2B3005A931@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4e6a4b-a440-428a-78a0-08de25aca33f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 07:40:53.6069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mwBv6lmJPYl8qW4eUeAZgz3EL1R4v/0k7+JvAh3VbS2KJTpqIW6PY+cl9GeCN/ecjxBwiOuDRqlq+3y2tha90Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8318

T24gVGh1LCAyMDI1LTExLTA2IGF0IDA5OjI5IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBMZSBqZXVkaSAwNiBub3ZlbWJyZSAyMDI1IMOgIDE0OjEzICswODAwLCBLeXJpZSBXdSBh
IMOpY3JpdCA6DQo+ID4gMS4gYWRkIGNvbmZpZyB0byBzdXBwb3J0IDRLIHByb2Igc2l6ZTsNCj4g
PiAyLiBQcmV2aW91c2x5LCBjYWxsaW5nIHZkZWNfdnA5X3NsaWNlX3NldHVwX3NpbmdsZV9mcm9t
X3NyY190b19kc3QNCj4gPiB3aXRoIHY0bDJfbTJtX25leHRfc3JjX2J1ZiB0byBvYnRhaW4gYm90
aCBidWZmZXJzIHJlc3VsdGVkIGluDQo+ID4gLUVJTlZBTCwNCj4gPiBpbnRlcnJ1cHRpbmcgdGhl
IGRlY29kaW5nIHByb2Nlc3MuIFRvIHJlc29sdmUgdGhpcywNCj4gPiB0aGUgaW50ZXJmYWNlIHNo
b3VsZCBiZSB1cGRhdGVkIHRvIHNldCBib3RoIHNyYyBhbmQgZHN0IGJ1ZmZlcnMNCj4gPiBmb3Ig
bWV0YWRhdGEgY29uZmlndXJhdGlvbi4NCj4gDQo+IFBsZWFzZSBhdm9pZCB1c2luZyBidWxsZXRz
IGluIGNvbW1pdCBtZXNzYWdlcy4gRXZlcnlvbmUgd2lsbCBhc3N1bWUNCj4gdGhhdCBpZiB5b3UN
Cj4gaGF2ZSB0d28gYnVsbGV0cywgeW91IHNob3VsZCBoYXZlIHR3byBwYXRjaGVzLiBBbmQgSSB0
aGluayB0aGV5IHdvdWxkDQo+IGJlIHJpZ2h0DQo+IGZvciB0aGlzIHBhdGNoLg0KPiANCkRlYXIg
Tmljb2xhcywNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uIEkgd2lsbCBjaGFuZ2UgaXQg
aW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEt5cmllIFd1
IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi92Y29kZWMvZGVjb2Rl
ci92ZGVjL3ZkZWNfdnA5X3JlcV9sYXRfaWYuYyB8IDQzICsrKysrKysrKysrKysrLQ0KPiA+IC0t
LS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4g
PiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92
ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiBpbmRleCBmYTBmNDA2Zjc3MjYuLmQ5NjY5
MTRkYjRiOSAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4g
PiArKysNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29k
ZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiBAQCAtMjMsNiArMjMsNyBA
QA0KPiA+ICANCj4gPiAgI2RlZmluZSBWUDlfVElMRV9CVUZfU0laRSA0MDk2DQo+ID4gICNkZWZp
bmUgVlA5X1BST0JfQlVGX1NJWkUgMjU2MA0KPiA+ICsjZGVmaW5lIFZQOV9QUk9CX0JVRl80S19T
SVpFIDM4NDANCj4gPiAgI2RlZmluZSBWUDlfQ09VTlRTX0JVRl9TSVpFIDE2Mzg0DQo+ID4gIA0K
PiA+ICAjZGVmaW5lIEhEUl9GTEFHKHgpICghISgoaGRyKS0+ZmxhZ3MgJiBWNEwyX1ZQOV9GUkFN
RV9GTEFHXyMjeCkpDQo+ID4gQEAgLTU0Miw2ICs1NDMsMjMgQEAgc3RhdGljIGludA0KPiA+IHZk
ZWNfdnA5X3NsaWNlX2luaXRfZGVmYXVsdF9mcmFtZV9jdHgoc3RydWN0DQo+ID4gdmRlY192cDlf
c2xpY2VfaW5zdGFuY2UNCj4gPiAgCXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPiAgDQo+ID4gK3N0
YXRpYyBzaXplX3QgbXRrX3Zjb2RlY19nZXRfdnA5X3Byb2Jfc2l6ZShlbnVtDQo+ID4gbXRrX3Zj
b2RlY19kZWNfY2hpcF9uYW1lIGNoaXBfbmFtZSkNCj4gPiArew0KPiA+ICsJc2l6ZV90IHByb2Jf
c2l6ZTsNCj4gPiArDQo+ID4gKwlzd2l0Y2ggKGNoaXBfbmFtZSkgew0KPiA+ICsJY2FzZSBNVEtf
VkRFQ19NVDgxODk6DQo+ID4gKwljYXNlIE1US19WREVDX01UODE5NjoNCj4gPiArCQlwcm9iX3Np
emUgPSBWUDlfUFJPQl9CVUZfNEtfU0laRTsNCj4gPiArCQlicmVhazsNCj4gPiArCWRlZmF1bHQ6
DQo+ID4gKwkJcHJvYl9zaXplID0gVlA5X1BST0JfQlVGX1NJWkU7DQo+ID4gKwkJYnJlYWs7DQo+
ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHByb2Jfc2l6ZTsNCj4gPiArfQ0KPiANCj4gVGhp
cyBpcyBhbm90aGVyIGV4YW1wbGUgb2Ygc29tZXRoaW5nIHRoYXQgY291bGQgYmUgaW4gdGhlIHN0
YXRpYw0KPiBjb21wYXRpYmxlDQo+IGRhdGEuDQo+IA0KVGhpcyB3aWxsIHJlcGx5IGluIDIvOC4N
Cg0KVGhhbmtzLg0KDQo+ID4gKw0KPiA+ICBzdGF0aWMgaW50IHZkZWNfdnA5X3NsaWNlX2FsbG9j
X3dvcmtpbmdfYnVmZmVyKHN0cnVjdA0KPiA+IHZkZWNfdnA5X3NsaWNlX2luc3RhbmNlICppbnN0
YW5jZSwNCj4gPiAgCQkJCQkgICAgICAgc3RydWN0DQo+ID4gdmRlY192cDlfc2xpY2VfdnNpICp2
c2kpDQo+ID4gIHsNCj4gPiBAQCAtNjE2LDcgKzYzNCw5IEBAIHN0YXRpYyBpbnQNCj4gPiB2ZGVj
X3ZwOV9zbGljZV9hbGxvY193b3JraW5nX2J1ZmZlcihzdHJ1Y3QgdmRlY192cDlfc2xpY2VfaW5z
dGFuY2UNCj4gPiAqaQ0KPiA+ICAJfQ0KPiA+ICANCj4gPiAgCWlmICghaW5zdGFuY2UtPnByb2Iu
dmEpIHsNCj4gPiAtCQlpbnN0YW5jZS0+cHJvYi5zaXplID0gVlA5X1BST0JfQlVGX1NJWkU7DQo+
ID4gKwkJaW5zdGFuY2UtPnByb2Iuc2l6ZSA9DQo+ID4gKwkJCW10a192Y29kZWNfZ2V0X3ZwOV9w
cm9iX3NpemUoY3R4LT5kZXYtDQo+ID4gPmNoaXBfbmFtZSk7DQo+ID4gKw0KPiA+ICAJCWlmICht
dGtfdmNvZGVjX21lbV9hbGxvYyhjdHgsICZpbnN0YW5jZS0+cHJvYikpDQo+ID4gIAkJCWdvdG8g
ZXJyOw0KPiA+ICAJfQ0KPiA+IEBAIC02OTYsMjEgKzcxNiwyMiBAQCBzdGF0aWMgaW50IHZkZWNf
dnA5X3NsaWNlX3RpbGVfb2Zmc2V0KGludA0KPiA+IGlkeCwgaW50IG1pX251bSwgaW50IHRpbGVf
bG9nMikNCj4gPiAgCXJldHVybiBtaW4ob2Zmc2V0LCBtaV9udW0pOw0KPiA+ICB9DQo+ID4gIA0K
PiA+IC1zdGF0aWMNCj4gPiAtaW50IHZkZWNfdnA5X3NsaWNlX3NldHVwX3NpbmdsZV9mcm9tX3Ny
Y190b19kc3Qoc3RydWN0DQo+ID4gdmRlY192cDlfc2xpY2VfaW5zdGFuY2UgKmluc3RhbmNlKQ0K
PiA+ICtzdGF0aWMgaW50IHZkZWNfdnA5X3NsaWNlX3NldHVwX3NpbmdsZV9mcm9tX3NyY190b19k
c3Qoc3RydWN0DQo+ID4gdmRlY192cDlfc2xpY2VfaW5zdGFuY2UgKmluc3RhbmNlLA0KPiA+ICsJ
CQkJCQkgICAgICAgc3RydWN0DQo+ID4gbXRrX3Zjb2RlY19tZW0gKmJzLA0KPiA+ICsJCQkJCQkg
ICAgICAgc3RydWN0IHZkZWNfZmINCj4gPiAqZmIpDQo+ID4gIHsNCj4gPiAtCXN0cnVjdCB2YjJf
djRsMl9idWZmZXIgKnNyYzsNCj4gPiAtCXN0cnVjdCB2YjJfdjRsMl9idWZmZXIgKmRzdDsNCj4g
PiArCXN0cnVjdCBtdGtfdmlkZW9fZGVjX2J1ZiAqc3JjX2J1Zl9pbmZvOw0KPiA+ICsJc3RydWN0
IG10a192aWRlb19kZWNfYnVmICpkc3RfYnVmX2luZm87DQo+ID4gIA0KPiA+IC0Jc3JjID0gdjRs
Ml9tMm1fbmV4dF9zcmNfYnVmKGluc3RhbmNlLT5jdHgtPm0ybV9jdHgpOw0KPiA+IC0JaWYgKCFz
cmMpDQo+ID4gKwlzcmNfYnVmX2luZm8gPSBjb250YWluZXJfb2YoYnMsIHN0cnVjdCBtdGtfdmlk
ZW9fZGVjX2J1ZiwNCj4gPiBic19idWZmZXIpOw0KPiA+ICsJaWYgKCFzcmNfYnVmX2luZm8pDQo+
ID4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gIA0KPiA+IC0JZHN0ID0gdjRsMl9tMm1fbmV4dF9k
c3RfYnVmKGluc3RhbmNlLT5jdHgtPm0ybV9jdHgpOw0KPiA+IC0JaWYgKCFkc3QpDQo+ID4gKwlk
c3RfYnVmX2luZm8gPSBjb250YWluZXJfb2YoZmIsIHN0cnVjdCBtdGtfdmlkZW9fZGVjX2J1ZiwN
Cj4gPiBmcmFtZV9idWZmZXIpOw0KPiA+ICsJaWYgKCFkc3RfYnVmX2luZm8pDQo+ID4gIAkJcmV0
dXJuIC1FSU5WQUw7DQo+ID4gIA0KPiA+IC0JdjRsMl9tMm1fYnVmX2NvcHlfbWV0YWRhdGEoc3Jj
LCBkc3QsIHRydWUpOw0KPiA+ICsJdjRsMl9tMm1fYnVmX2NvcHlfbWV0YWRhdGEoJnNyY19idWZf
aW5mby0+bTJtX2J1Zi52YiwNCj4gPiAmZHN0X2J1Zl9pbmZvLT5tMm1fYnVmLnZiLCB0cnVlKTsN
Cj4gPiAgDQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgfQ0KPiA+IEBAIC0xODAwLDcgKzE4MjEsNyBA
QCBzdGF0aWMgaW50IHZkZWNfdnA5X3NsaWNlX3NldHVwX3NpbmdsZShzdHJ1Y3QNCj4gPiB2ZGVj
X3ZwOV9zbGljZV9pbnN0YW5jZSAqaW5zdGFuY2UsDQo+ID4gIAlzdHJ1Y3QgdmRlY192cDlfc2xp
Y2VfdnNpICp2c2kgPSAmcGZjLT52c2k7DQo+ID4gIAlpbnQgcmV0Ow0KPiA+ICANCj4gPiAtCXJl
dCA9IHZkZWNfdnA5X3NsaWNlX3NldHVwX3NpbmdsZV9mcm9tX3NyY190b19kc3QoaW5zdGFuY2Up
Ow0KPiA+ICsJcmV0ID0gdmRlY192cDlfc2xpY2Vfc2V0dXBfc2luZ2xlX2Zyb21fc3JjX3RvX2Rz
dChpbnN0YW5jZSwgYnMsDQo+ID4gZmIpOw0KPiANCj4gSSBkb24ndCBzZWUgYSBkaXJlY3QgY29y
cmVsYXRpb24gYmV0d2VuIHRoZSBidWZmZXIgc2l6ZSBjaGFuZ2UgYW5kDQo+IHRoaXMgY2hhbmdl
Lg0KPiBQbGVhc2Ugc3BsaXQuIENoYW5nZXMgbG9va3MgZ29vZCwgdGhlIGNvbW1pdCBtZXNzYWdl
IGlzbid0IHZlcnkgY2xlYXINCj4gdGhvdWdoLg0KPiANCj4gTmljb2xhcw0KDQpUaGFua3MuIEkg
d2lsbCBzcGxpdCB0aGlzIGluIHR3bzogdGhlIG9uZSBpcyBzZXQgdGlsZSBidWZmZXIsIGFuZCB0
aGUNCm90aGVyIGlzIHNldHVwIHNyYyB0byBkc3QgYnVmZmVyLg0KDQpSZWdhcmRzLA0KS3lyaWUN
Cj4gDQo+ID4gIAlpZiAocmV0KQ0KPiA+ICAJCWdvdG8gZXJyOw0KPiA+ICANCg==

