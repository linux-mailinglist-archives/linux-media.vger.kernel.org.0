Return-Path: <linux-media+bounces-19712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B4D99FFA5
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 05:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA621B25661
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 03:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FBD187877;
	Wed, 16 Oct 2024 03:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="W7q3OMAs";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ZpDTZXZG"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F67A186E5F;
	Wed, 16 Oct 2024 03:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050286; cv=fail; b=PTqk2FEgT7CEXLi/en5aKPHoA2FlyMIGbzKgtiG57R9qGPmeq4NadLcwlAYyIrmeA8zZrcQRhn9W9DjrW2PjEw6vI/G6NNGXwEvM4ZE8bk/ml3q9ktsnb1HF4Eiyb2M+T7QIQStTWEdG49fa7KAeQNDyTvRCGpemndhU44dYSj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050286; c=relaxed/simple;
	bh=zQPjDn+poZxa/eNscomU6/WL17wLEZMrxR6Gsgqxrp4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q4BpIb0bXJZby5J5DCOx0tcrYJ/7n7CB/RKReYcLVkQbPNjy2NT0suu1DtdXZ0XXHgPH9o7BL8iBBpjZznSsJaXirw4tubIIAAa0ECoVc1Tg01MsreROu0YNaaYivySmB9AjdJk2EGSfD8lT0G/qLBUv5A27ciAk5iysJRd348Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=W7q3OMAs; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ZpDTZXZG; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f89cdce68b7011ef88ecadb115cee93b-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=zQPjDn+poZxa/eNscomU6/WL17wLEZMrxR6Gsgqxrp4=;
	b=W7q3OMAs+EscMu+X+D2B2eBrtfSwyGPe0zkkHTulhasMCb2pHd8mR1CZi6+Xe1s6JkroSbpcMfsvsydA2OuKki9FyhTZDtwu3UNFw8hBRyNZkJP09hEFUP3/MxQHP3uVOhHUgK37r02tMrZS+eddEPc90Bf4cc5Is2lCFI3JBIs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7780c2bc-73d4-48c3-b9ea-1a22ead37954,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:671edb06-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: f89cdce68b7011ef88ecadb115cee93b-20241016
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1496602495; Wed, 16 Oct 2024 11:44:39 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 11:44:38 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 11:44:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7W5d+Lq82F2RKk39ckPh7qhpaovqCbN5QSVjKkcEk4GjUK815tdpiFzEepD01cDiN1h9nRyVtYHQdXFvgFvCFYHXK7CJZ+Emr9t9m1Uef9sxc+H2ioLH/UX1nBZ/SVkA4Reznv2AqZFaPDkmvNR8Uz1uvM6nrmdGltsdYAsGMCD/V8fP/w+XsWaVS36eG4TIHKL3k69H7tH7zdg+EJMigRyZ4qZBj8g1z7ca7uq8CxXSmYZpKy/7mPtC9z1iYv+CnM5nEZRK1ZxOf2rXJ6PFeYWOwHDztYYRRpN0tDXyVeogrZmkDvI8J8rCbpQtogIBc4GHurRQTJAdQgFUhHY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQPjDn+poZxa/eNscomU6/WL17wLEZMrxR6Gsgqxrp4=;
 b=MOVNxY817/HN/LAoUDSEUrqqTpgrrUzqwOwOKvziUYMemtJOuyrrpg35LT0A6r/lb9z3iqZa/sHm28wb2q+p7UO4IqTh54NtsOvnjz/K2Kqq18fXFKs7Q+bQdsqncjYF17Mrsf+VsEOhqIF7evBUk5kPlKF9MpEpcH5bBs88MZRnadDimqtSoZHnavPG7+AoON8lNxdTSAUjhhZ2JLHNEVqiNxAYPcmpdRQE/2ADeAF+yyul/cmsGua9PVaMiHVlBfaIUY58rujz3iQvJOPZj02GjGecGrJ+QO+27oZoGDApX4im3dP+ZTfTxqtvJ77b9cb0tgqLyxfJzoqWquU/9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQPjDn+poZxa/eNscomU6/WL17wLEZMrxR6Gsgqxrp4=;
 b=ZpDTZXZGI72PsXp6kGX9ZVs9JixU5yvuU+fUXQ5b+H+nzQlvtRBn60CcuoxRF2M5d3vFQFdHq8o0aXI/TVuYqN13QhjEiUufd7ogTlCvbDyOtAqFo5Pq8wvl51tMxG+qZGjZHqNGpoGHm7p9pB3WAovDoTaHgETCx7zBhWNJDN0=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by TYSPR03MB8590.apcprd03.prod.outlook.com (2603:1096:405:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Wed, 16 Oct
 2024 03:44:35 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 03:44:35 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
	<stevecho@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "hsinyi@chromium.org" <hsinyi@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Nicolas Prado" <nfraprado@collabora.com>
Subject: Re: [PATCH 0/6] media: mediatek: vcodec: support h264 extend vsi
Thread-Topic: [PATCH 0/6] media: mediatek: vcodec: support h264 extend vsi
Thread-Index: AQHbHgt1ehhZmmJ73ky6h9mIrWmHtrKHcuIAgAFMfAA=
Date: Wed, 16 Oct 2024 03:44:34 +0000
Message-ID: <c320a54c290827372a6c4fc18b89a4c702917175.camel@mediatek.com>
References: <20241014073314.18409-1-yunfei.dong@mediatek.com>
	 <CAGXv+5HV5EPvhFb6oFkRBSw-EGaccxDGBrW0tVDoWQR0RAAeiQ@mail.gmail.com>
In-Reply-To: <CAGXv+5HV5EPvhFb6oFkRBSw-EGaccxDGBrW0tVDoWQR0RAAeiQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|TYSPR03MB8590:EE_
x-ms-office365-filtering-correlation-id: ced43c2b-018d-4408-40b3-08dced94da16
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZkF1RGtuS3BUd3VuQVdleWJadWpMMVRsV1M4bXVBdThjVEhOem1mVWt1dlYv?=
 =?utf-8?B?blQvTlpnUFFMbG1DV3FLK1o4Rlh6aG40dWFHRktHRExmWm1jUFFZM3kyZFB4?=
 =?utf-8?B?MFlPVVhkQXZ3WWpMK1cyNWp2dEhvQTdacjN6dkxJcHErR3JTSmFnUEY0a0pH?=
 =?utf-8?B?UmM5eHh0dlNkeDZlYTBrRDdWZ0E3ZHFOVTdkS0Z5VmFNek1jSVdsOGpoTmVz?=
 =?utf-8?B?em9DRWZFQ1FXTjBoNXFrMWlzNkFZZnpsdXl5ZHFtdDFqWVRRZnExZlBiOFUy?=
 =?utf-8?B?MVJLRWFRUzMwcUtWLzJPYWRKN1o3eU1sV0FhbnhMRWlNMWd6WFJyWTZKblM1?=
 =?utf-8?B?NVlGT3NOaUdIa1VCckJoRjVNVVg2bHFsTk5FeVRiYjkwVXkrWFNacG8yMGZK?=
 =?utf-8?B?cmxFeHZQWFY1TGJkYWFqRU9yZUd1OEVSSFVGVEpSUmdVeXNqRVJiWlh0UEdy?=
 =?utf-8?B?K040MFRuMnlNWThROHgwSTk5VUxRSzE5MnRHcUV3eU5jbXI3WS9tNUpLQVA2?=
 =?utf-8?B?MmtpekhiYUFXeEtEZ2ZaclJxY3Byb3Nvc0RTRXVnckdzV01OdktIZmd2RTF3?=
 =?utf-8?B?QjlsZXpJVGU2VEhVaks1cC9iUkRrQjJMdkZDWkkwa2ptU0lKeWl2SjdWNEdz?=
 =?utf-8?B?djgrck5MREVYVzNnd3RTdmhQTGc0bjJwOXJyb1FTaGpRcDU1aHlMOVlvSWVS?=
 =?utf-8?B?SFUxMlR2eEVNYXVOMVNKakVYVXZISWZ5VjFIeXBSQzdVejVTWTBVd2piaGFa?=
 =?utf-8?B?RmxPMEM5U1B6c2Jzd1NLQWI2YzNsbFV6Ym9tRC9rVHJpSG9SS01IMXg1L1ZE?=
 =?utf-8?B?VS9sL2JaN3BObzY5THlHS2EzTHUwSkh6WGRnRlNnT3V0UnJxQ0dBNkdpdVVl?=
 =?utf-8?B?WTRmS2JqUkg5SzE1bEVITnZqRkJlWlRjbisxS1pNNW80MDZPOStmd0Nwem0z?=
 =?utf-8?B?VktiSE1maXo4VlpDTmNTK2lMc1dNa0hzMzhuRnFQV3ZKTGhwL0UvaE9hdTFj?=
 =?utf-8?B?UW9tNFVHSXh2NlVpRW8zZlEyMnZBakNMMHdKY05HWnBYTHRHaDFXdG9OZ1ls?=
 =?utf-8?B?SkZIanJZSXdpM0N3emQwZ2lvZkZPc2Nua1BDc1k0YzRrTjN4UnRVM2NJNHNY?=
 =?utf-8?B?cUpKbXZUQUN0ek4xeFgwV2VnaUZ5UDJVb0k3YTZlcVFNaEF3TkxTNTBSblIx?=
 =?utf-8?B?OXNIVkhuL0x4T1FWZXdNN0YyMFB3dW9DSXJaWTdRbWZvNVEvSzVxem1DUUJs?=
 =?utf-8?B?eS8wS1FYUkViVmgxQ1E1VFQ0bjdsTURFVmE2THFzWjU0b1RxVkUwcGNYeGtI?=
 =?utf-8?B?dVBvemhZMjlrK2Mrb2huaDNycE5DUFozWXF0b0tOakhaR2JxK0twV2VhVWNG?=
 =?utf-8?B?TGtFcGNYQVFJeWdoWFI0dnVxLzAwd3VXeVZ3V0J4b0JGTmIrRmNUaFVVaFJj?=
 =?utf-8?B?RHdSc1RSdytUVW5LLzgrTDR2OFc1dzFlWnB5bXlsNlY4MG04ZEp1NXlVV0dm?=
 =?utf-8?B?bEowQ3ZDOFpaMGN1VG9oNHdDT2gxK1pCWjhNRy9raWlRcTJFSzYzeHZGSlBu?=
 =?utf-8?B?L1ljc05PQWpuZmtWWXF0NVlEVTFuZi9ITnk2bTBIRE9Bd2NKcmtPN2dmL25F?=
 =?utf-8?B?YVlRc2FGcmViOXVBM3hyYUZFOWlwd1l0WnZxVklTSExxelVEUk1JcElESWhC?=
 =?utf-8?B?NEpmRGdGRUFOTis5VkVXNWFzTXdHNWlQVGthTHdQbUlBV1MxcUtMc2JjaHJJ?=
 =?utf-8?B?VEhhd2RlaW4vQzRTanZYbk9UV1dZZ1FGOERDYVVWRnREdGVxTmZyMTlLZGFD?=
 =?utf-8?B?blBqTjNxTDRwQXp5U3BFUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR03MB8697.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dURjY1c5UFVMR3dLZEZIdU5IVy9EazBubjV5M2JuY3pmVElEV3dhaTI3cndG?=
 =?utf-8?B?akFjVm12cjMyUUhvbWVBUUVpb3NwYjB2R0UwcXZNMGtyZXZnajJxeFBHcjJp?=
 =?utf-8?B?MzFFMnZIa1N0UVpEdi9hT1c4Y0NESDZtRnRMUjU4Uzhoc3p1d3g2UmN2R2lD?=
 =?utf-8?B?SVhuRHNtY1A2dWRhNzlKa0lRcE4yNVhMU2d0YjdHSEJLL2tFbkh0Z3BDWlpO?=
 =?utf-8?B?Q3BUR2xDUWJ2MUJsWjVSVHR4S0R3YU05ZUY1dlFRd1FCRS9hbW1qN2FUcVRL?=
 =?utf-8?B?eE42MW0zZmIzYVVlWGR2VEVkK0pGcWt2NTQzTmFZMEpSUzY0RDc5N1EyTi9y?=
 =?utf-8?B?QUw0eGcrdUVVamhKSFFDL01mS2tvWE1PYy9sbWQ1TDQzby93TDlaWUduMmlh?=
 =?utf-8?B?N2hqelRWdTRXR29QUkxZZDMxdHBsT2lISWM0aGVZdkR1bk1jL1NtT1dVNFpp?=
 =?utf-8?B?YnlHSVVTdVJIZzB2WVNXb21pNVRLTklESFJRT2htWW5KY2tEZDVGSWhZLzg3?=
 =?utf-8?B?TnFlRDFqZC9raGdnVTR3eXlidlRtZExXQ0JXOXovUURwS1ZrVGdaYThzRlU5?=
 =?utf-8?B?Yk1VdXkrM1ltNnhFMk5qMEZxbHdMcStuK2pBSHNhcjM3OE5hRjAxZHRZRDJN?=
 =?utf-8?B?OVdkYVhVeUtyQ2dHYmpFdVpCY1RORW9Sd2F6dDk5N0s3Tm0xSHMxUUVRVjJX?=
 =?utf-8?B?a1FnUlFkSmJyTzgzUGFZRkl0Q0ozT2RnK2dNY2JIT0JGbkVHeHNQVlRTQXNn?=
 =?utf-8?B?RDZMbHM5YTErN2pweC9yOU9XNTJmWVlRRFRPTWlBbUMvQ2graXBwaXNMQzhM?=
 =?utf-8?B?Tm9rdXpHK0ZjOUNUUmFaRlZwdDRZSnNMYXFmV0czRDBzNkpwTVdyc28yMnkw?=
 =?utf-8?B?clNRQ2xvb2pBZ3VSdG8zWFNyZDlQWFo0QlRVNXdUTlB6cDlWVlBoOU1UTXl3?=
 =?utf-8?B?b3FWRHRlUFhXa05Fa0dORmQ2Wm9WT3dzVE00MGJFbE1MUFdMT3hwcHE3UEhN?=
 =?utf-8?B?Tmtkd3BTdVYzWk9sZ2ZsVUFBNUI3VFVKL2FUOExmMFpoLzhXb2JyejR3WGUw?=
 =?utf-8?B?c3JlbFY3WHg3ckNDbTdEbXJVOHdpZDZLNDdaVmZNRm5VUkxxQUFKZ3hQOHJa?=
 =?utf-8?B?bS9KNm13d05yWXJZVHRWc1VtVndZSUFaQUR1dE5YRFVScC9vc21ZZHJ3a0R0?=
 =?utf-8?B?cys1K05rOXkxQUNRTlVFOFRWQmE5MXpySmdtZi9wamJkQVk4UVR3alpPL3JF?=
 =?utf-8?B?K1V5dGl2WCtJcWh0dUlNUmhBTXBVdlFxRWJXQkV4U2F5eUJOQkFEcFdLT3JI?=
 =?utf-8?B?YmdxbkNjV01ZUTNOdktFVVo1ZG1vQS9mSHg2MWpVSzR1Z2xaTkZxWlZlamxx?=
 =?utf-8?B?eitVNWpRQ3Qza2lUR0NhV2tQdTJnakxqRTNIQnlMMjBaNXR1UnhMODRuSnVI?=
 =?utf-8?B?a2U3VHRFU01FYXNzNFRPMGFITzdLRFRDZlN6V1VzdXFDQll2K2NJc2tRTVhQ?=
 =?utf-8?B?OTZmU2ZxRnFpT1gyYUZTMUQvQ2UrVlN2MEFSdnFKZlpYMEZFZS9RaS8wSVcr?=
 =?utf-8?B?b1pPM2MwUkY4UFlrTHJjbGVDQ3hZUSswbFloby9MOGY3TEtJTmVGNy9VRysr?=
 =?utf-8?B?VGhMWnpoL01mU2dEV2MvK3JrNVo5R3U3bFdUTWxFdGdrb1B6aUFZakk4ZnVp?=
 =?utf-8?B?Q1BQb1U4QUxZc2Q4YUEwMFRyWWF4akh3bTM3YkNDTnZlNU41c2o2Zzgwb3JC?=
 =?utf-8?B?OXZwYVRRK0xrK1Q3SFIxUENZQktkeVFTektHSXhOV1ljTjlPclUrUVpTbjk0?=
 =?utf-8?B?T3kzQ28zYlJHd2xMaVRQL1duSzF1eWEwZU9JOUgyd0ozTHlzRFdYRmdOS0RQ?=
 =?utf-8?B?YlphQ3dQOG14alFlZmVUanFQeDJJb0JWamI1enkwaC9FNDA0TlhHdGJDQlRH?=
 =?utf-8?B?K2NGVllqNWlWaHV2aSt2dHk3OHJhcHRrdCt1TzRRZHV4M2dVWE9JM09tVG9L?=
 =?utf-8?B?WUJrNUsxMm9valZRUDZDSHcybVNrVldRNFBnUlRydnpoSTJ0U1QvZ0c2RGZo?=
 =?utf-8?B?bHpvUkJyK3FZV2NiKzlXWWhQNzUrY3RPcmpRM0x2RHJaOTZaL0RBYVRCK0VU?=
 =?utf-8?B?cGQxa3duRDJRdCt4Y0wyMFJPQ2VYdlJyd0VJei9ZRnRZbkovM2VGT3kxWkVv?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD7D7910EC83B0449B93DBDA73325F6D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced43c2b-018d-4408-40b3-08dced94da16
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 03:44:34.9119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lM0nyCg7hM9iVkUm6wFnpeVS0aUQ7cKVZTA0slRHBeHfdqg+ZjKS9PRGREOmqYuzsPzcvVhWoF7QqQGvs/t+qjBogw7hVPM42u52YFf6/8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8590
X-MTK: N

SGkgQ2hlbi1ZdSwNCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAgdG8gcmV2aWV3IHRoZSBwYXRjaC4N
Ck9uIFR1ZSwgMjAyNC0xMC0xNSBhdCAxNTo1NCArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdyb3RlOg0K
PiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gIEhpLA0KPiANCj4gT24gTW9uLCBPY3QgMTQsIDIwMjQgYXQgMzozM+KA
r1BNIFl1bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20NCj4gPiB3cm90ZToNCj4g
Pg0KPiA+IFRoZSB3b3JraW5nIGJ1ZmZlciBhZGRyZXNzIHN0YXJ0IGFuZCBlbmQgYXJlIGNhbGN1
bGF0ZWQgaW4ga2VybmVsDQo+ID4gc2lkZSBjdXJyZW50bHksIGNhbid0IGNhbGN1bGF0ZSB0aGUg
YWRkcmVzcyBlbmQgaWYgdGhlIGRyaXZlciBvbmx5DQo+ID4gZ2V0dGluZyB0aGUgYWRkcmVzcyBm
aWxlIGhhbmRsZSwgbm90IHRoZSByZWFsIHBoeXNpY2FsIGFkZHJlc3MuDQo+IE5lZWQNCj4gPiB0
byBleHRlbmQgdGhlIHZzaSB0byBjYWxjdWxhdGUgdGhlIGFkZHJlc3MgZW5kIGluIHNjcC4NCj4g
Pg0KPiA+IFJlLWNvbnN0cnVjdCBzb21lIGludGVyZmFjZSBhbmQgYWRkIGNvbmZpZyB0byBzdXBw
b3J0IGV4dGVuZCBhbmQNCj4gbm9uDQo+ID4gZXh0ZW5kIGF0IHRoZSBzYW1lIHRpbWUuDQo+ID4g
LS0tDQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgZGVwZW5kcyBvbjoNCj4gPiBbMV0gDQo+IGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9jb3Zlci8yMDI0
MTAxMjA2NDMzMy4yNzI2OS0xLXl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbQ0KPiA+IC0tLQ0KPiA+
IFl1bmZlaSBEb25nICg2KToNCj4gPiAgIG1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiBleHRlbmQg
aDI2NCB2aWRlbyBzaGFyZSBpbmZvcm1hdGlvbg0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiB2Y29k
ZWM6IHJlbW92ZSBwYXJzZSBuYWwgaW5mbyBpbiBrZXJuZWwNCj4gPiAgIG1lZGlhOiBtZWRpYXRl
azogdmNvZGVjOiByZW1vdmUgdnNpIG9wZXJhdGlvbiBpbiBjb21tb24gaW50ZXJmYWNlDQo+ID4g
ICBtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogcmVuYW1lIHZzaSB0byBleHRlbmQgdnNpDQo+ID4g
ICBtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogYWRkaW5nIG5vbiBleHRlbmQgc3RydWN0DQo+ID4g
ICBtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogc3VwcG9ydCBleHRlbmQgaDI2NCBkcml2ZXINCj4g
DQo+IFRoaXMgc2hvdWxkIGJlIHJld29ya2VkIHNvIHRoYXQgImFkZGluZyBub24gZXh0ZW5kIHN0
cnVjdCIgaXMgbm90DQo+IG5lZWRlZC4NCj4gInJlbmFtZSB2c2kgdG8gZXh0ZW5kIHZzaSIgYW5k
ICJleHRlbmQgaDI2NCB2aWRlbyBzaGFyZSBpbmZvcm1hdGlvbiINCj4gY291bGQgYmUgY29tYmlu
ZWQgc28gdGhhdCB5b3UgYXJlICJhZGRpbmciIHRoZSBleHRlbmRlZCBkYXRhDQo+IHN0cnVjdHVy
ZXMsDQo+IG5vdCByZXdvcmtpbmcgdGhlIGV4aXN0aW5nIG9uZXMuIE90aGVyd2lzZSB0aGUgd2hv
bGUgdGhpbmcgYnJlYWtzDQo+IGV4aXN0aW5nDQo+IHN5c3RlbXMgdW50aWwgImFkZGluZyBub24g
ZXh0ZW5kIHN0cnVjdCIgaXMgYXBwbGllZCwgbWFraW5nIHRoZQ0KPiBzZXJpZXMNCj4gbm9uLWJp
c2VjdGFibGUuDQo+IA0KPiANCllvdXIgYWR2aWNlIGlzIHZlcnkgcmVhc29uYWJsZSwgSSB3aWxs
IHJld3JpdGUgdGhlIHBhdGNoZXMgYWdhaW4uDQoNCj4gQ2hlbll1DQo+IA0KQmVzdCBSZWdhcmRz
LA0KWXVuZmVpIERvbmcNCj4gPg0KPiA+ICAuLi4vdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19k
ZWNfZHJ2LmggICAgICAgfCAgIDIgKw0KPiA+ICAuLi4vZGVjb2Rlci92ZGVjL3ZkZWNfaDI2NF9y
ZXFfbXVsdGlfaWYuYyAgICAgfCA1MTYNCj4gKysrKysrKysrKysrKysrKystDQo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgNDkzIGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
LS0NCj4gPiAyLjQ2LjANCj4gPg0KPiA+DQo=

