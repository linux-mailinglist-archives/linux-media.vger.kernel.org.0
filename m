Return-Path: <linux-media+bounces-14830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC65692CEA1
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 11:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41D44B24315
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 09:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A6718FA2A;
	Wed, 10 Jul 2024 09:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cMwqgCHO";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="JzvKFUHO"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275EA17FD;
	Wed, 10 Jul 2024 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720605431; cv=fail; b=Ho1RrIQKrCaTdtWUCMecDusG9yWIHd9aWH4RTgYMwy7ZvX0QZTSg85ypzoQCOV5VdU3s+XN2yQMy9QFJDBpcLry5yBXq+sdLIjxVmm6K1Dwcbt3wFgBSG7rOlC2oxzYkewcyKaVajF+uwJPe6uXLRZoRl32UpwUibZrqitykOoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720605431; c=relaxed/simple;
	bh=BWM/B1kVIyPQci83j0K+sdLaHNkDFYHjfyLEGmIEkQc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o/ICgWpmy1dAjeSYNUTLbimfJIC9/1znHfcVg6YzqTcPgaX6fcWh3gANZMv7M6U+SZR+C7GzcAScdW4BBdIgNtI1VOKReZQ2Z0Zk4kFYkrl8PZPEzPoG2JsMqj9oSfrCwor4f4PJqZb5x71VAPh5Z0DiqnLY6uhqgCqbJMXEXjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cMwqgCHO; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=JzvKFUHO; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c077f56e3ea211efb5b96b43b535fdb4-20240710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=BWM/B1kVIyPQci83j0K+sdLaHNkDFYHjfyLEGmIEkQc=;
	b=cMwqgCHOc2c75KbPaYfgt3EWEU1UrtazpCquOiu82ihdn2JY3wxL8mqaZwM4o74JyFNEcDb2YOKCHmFsGbw6vajUTVGyC/Ilslzt7b0eEH4Qc6xXVo5LZ8EHLuS5Wcre5BOJwZ6j4jMuBdlBaP+tTdpkd1CVMYOnus69vbW7KfY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:53c5a285-3b41-4209-a3d6-9ef3f1ca0e5e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:af624a0d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: c077f56e3ea211efb5b96b43b535fdb4-20240710
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 547529369; Wed, 10 Jul 2024 17:57:00 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jul 2024 17:57:00 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jul 2024 17:57:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4FZmcP/BrbtynzOglT0/+IyNYWNUWUGf7jgQvBRg7LmNwzSM5CKCP01990eEp9kCOdt+atxDWda0p/WKVMF2ZSKzAWcRIryaWnBpCIVIlVzvq2XmcEv7HlVYu8DeDFrOjg7QGQhXD1joCXWbwvC2gQj4U+lDtHirnXrPeygi8+OQ0cIjayvXDoxdGvE+hq/xVkbhucGA5rVnxFavKPwG8Nru+n10kV7KDu/zPoCoFvN2WqbPmShY1PTiJMafbzo80IDhM053J8MWUreWm1fKIloQe1jp3QLl3okt6qNgDbdL9a1pNNetpFeYdgzwGh6bAh2PKPI3ZvUYifg6Ccvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWM/B1kVIyPQci83j0K+sdLaHNkDFYHjfyLEGmIEkQc=;
 b=ckMDsIg9d/y2mbQoIGXqbxaXvcIQqJ2sFwWWkZlZSu6nPzTJs5DbX0l5cRHWmzd2KHwLSeEon7PUaQB64vc0604loYGFS5G41SqzsGxOy0DOwSChIhdbIhUso0QmnkCQFTYKj4gyZllrqgt2TDDljAqgwUffwBwN9sIWbFuNjUF+ck5uDgTipZaDn/N4OsR+2glnmY3S+7V9Si1N9Yi+JdguExHE2QRLjnsDu8eHQ5CJq2Jyqb7yHZEzOHz0PIV/gfqKLCXPeGtvMtBjEzJajao0rHPGF0KKOJXv/3yf6qUZ8VwL58wkNGMqYs4ZxNIQkvj8tsJAipIlXaEUdzXsPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWM/B1kVIyPQci83j0K+sdLaHNkDFYHjfyLEGmIEkQc=;
 b=JzvKFUHOtpUKiHFGCULb6dGZhC3McGJleq06hXAuF+yVwqqkzxSUpDocdImb2VL+dzgYXq6lr/weYykRc0zLYOl9wpXLwH8m1VGoKNEIJ5m3xkRPZPN0eAbeRIgtdUhRO3KBgYL07wO0m6PAg/K6k3NZAF0jgaYDCmgks1J4NUA=
Received: from KL1PR03MB7669.apcprd03.prod.outlook.com (2603:1096:820:e2::6)
 by SEYPR03MB7093.apcprd03.prod.outlook.com (2603:1096:101:da::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Wed, 10 Jul
 2024 09:56:55 +0000
Received: from KL1PR03MB7669.apcprd03.prod.outlook.com
 ([fe80::972a:8016:34a9:e923]) by KL1PR03MB7669.apcprd03.prod.outlook.com
 ([fe80::972a:8016:34a9:e923%5]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 09:56:55 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "christian.koenig@amd.com" <christian.koenig@amd.com>,
	"mripard@kernel.org" <mripard@kernel.org>
CC: "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "sumit.semwal@linaro.org"
	<sumit.semwal@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"jkardatzke@google.com" <jkardatzke@google.com>,
	=?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"joakim.bech@linaro.org" <joakim.bech@linaro.org>, "logang@deltatee.com"
	<logang@deltatee.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>,
	=?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
	=?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
	<Jianjiao.Zeng@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"contact@emersion.fr" <contact@emersion.fr>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"tjmercier@google.com" <tjmercier@google.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"willy@infradead.org" <willy@infradead.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "jstultz@google.com" <jstultz@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Thread-Topic: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Thread-Index: AQHaxufGtXYlJ2nIzkCmfICpDUjhvbHYUI0AgAAN6YCAAVLnAIAALb0AgAB3fQCAAJ26AIAAPHkAgACBLwCAAWC3gIAAIPIAgARssgCADjDXgA==
Date: Wed, 10 Jul 2024 09:56:55 +0000
Message-ID: <71254560f15123ef81c4fe6891c1cffdc7fe16b4.camel@mediatek.com>
References: <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
	 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
	 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
	 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
	 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
	 <ZnxWWtdShekGSUif@phenom.ffwll.local>
	 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
	 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
	 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
	 <304c9faa-5a9c-4520-a3d8-0818f76dd7c9@amd.com>
	 <20240628-cuddly-brave-squid-e1cb22@houat>
	 <18c6ab56-1d43-4646-914b-6de793811040@amd.com>
In-Reply-To: <18c6ab56-1d43-4646-914b-6de793811040@amd.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB7669:EE_|SEYPR03MB7093:EE_
x-ms-office365-filtering-correlation-id: bd14d81f-424b-4827-75fe-08dca0c6a180
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?akdWZWRHZmlWZUQvNkFDa2tHeDNzc0crWUppdUpFM3hsNUVRVmRNbXFXd0tK?=
 =?utf-8?B?VGNOYUh3bDFtVllUazIvZmdXYXdIYXppMUdhOU5nWFZwOWl4YXQvcHhCbnYx?=
 =?utf-8?B?Z3VmbXU1Z1VxcEdXS09jMmVLMXRJWGRWajZOYjBuNVBKWithaG5wKzQyUVR1?=
 =?utf-8?B?V3Njbm1WVytCVkhYYUh6YUZVUno2Y0puVzZqajE0NEhOaEZZS2dBOE5LNitm?=
 =?utf-8?B?MGIyZ1NXTjF4cDhLSWJuZmZmL1lYUjJnSmM3LzlNOFZxV2ZncVpVdjBEWm85?=
 =?utf-8?B?TXlabjRyT0NRVUcyV0ZVc1lIU0JJaWxXQVFjNG0xSW85aGNmQjY5Q2ViTVVn?=
 =?utf-8?B?d2x4VlpRaVUya1dMZmxzazJuMWVqa0F4VkFTeDNtZVJJUW9QbzhCUUR4Sndt?=
 =?utf-8?B?dk9wTDJOOEtIMGZiVlNUdFdKU3JUalhtUjhyODJnQUdDSHI0dm5KaktaMVA2?=
 =?utf-8?B?bEJzbFVPM0pIcEluRXhxUjJRam5iSVdDUTlzemJ3M3U2NFNiRit4NUx0YzNo?=
 =?utf-8?B?VHpZWWZNREEwT1RrQzdONWVsbitPSW01dXl4RSs2c2xjR0pheVpDMkVEeC9X?=
 =?utf-8?B?ZE5CYVpXUlJzb0E3U2Q2Z1RETlZRck5QNHlMRUJMbUNCejY2eFBJY1hxMWdt?=
 =?utf-8?B?eW9XUDZ2aHFYR1BRTU5GUkZKWlAvN29xSGJHZ1hsbk8vNE5ndGNwV1N2Ykx0?=
 =?utf-8?B?UXJmN1hEczdScHVBWWpkK2pRQzZUa2hXMGcrQmc2blM1dGlyUkFwazFaWHo0?=
 =?utf-8?B?OWh1LzNuVzlFeE5FMmhkWThaOGN5WmZ0VTQza1drbEc2OVVKVTZNa0xNUGds?=
 =?utf-8?B?RVEvZ0ltU3lLNW1EL1FWU3k4TnpYSkF2d1VieEdjVVgxeDMyQ0FsZWc3ZzlX?=
 =?utf-8?B?S3paY09INGpLZXJBWnRlOGNJMlIxeUx3Y2xROUhCbUZtSFdmODZVTmJxS3hM?=
 =?utf-8?B?bUkwdys0a0tvcUhOT3hxZjVLanhuQytWN1NTYVBBYlR1anNMQ2ppYnc3VkVR?=
 =?utf-8?B?Zkd4UEg3anlUOEdPT1BUQ09xRVU0OHJQcXBiYjZXQk54Vmx0SkYyeUVQZkFo?=
 =?utf-8?B?dmN2YVIxNmpYWFRNdVdmcW9ncUgrM1loWitxRGJtQ0NMYlp4aUthSmRtVHBR?=
 =?utf-8?B?cklabVoyRFo4ZlE1N1NSclNPWG9pWTNvYys0N2FIV3pMN21TVVNmZ3lBMVh4?=
 =?utf-8?B?L0IyaG54eTlMRUplRHk5dkh3RkRsTmhIdmRuVG1FekhGVWFKVW9GRmptdmtW?=
 =?utf-8?B?Yy9PMTUyV0hHVWV5RDlFUVI2L2FkcW83NXlxdWxXYjV0M2tPU055Y1VPMFRh?=
 =?utf-8?B?YUVyQmV3amdGRDdzQzF6M0Z4Nkc3dG9iSmlsbmJ2N3hsNVlMRTZoaHRZVmY5?=
 =?utf-8?B?T0F4cm1CeTFpa20vbElIdGJaSnVCTXpKOFhKYjBxT3BDM0JGNnJvNHUxRGhy?=
 =?utf-8?B?Q3EvK1EyblBYS0pNZk1ISklPRnRUazB5TjdsSDlZanRTVGZnTFZ5Smo4T0ha?=
 =?utf-8?B?eWV2R2ljU3o3TktGTGd1S3BCdnE1YTJxSHBJak8xVk9QM0E3cUVLU3hXL1U3?=
 =?utf-8?B?ZWVISVhGZzJkRU1weUJ1TTZZSTZZdlQ3dkN1ZmVFMDlGK2ZKd0FvcDI1M2Fo?=
 =?utf-8?B?R0d1ZFRtVzVjS3JFb3RtY2NnRnJxOEp1RE5aZmZyeFJVbEtReEhQYVBhc1U2?=
 =?utf-8?B?S29DcDB4dk95anMvVURCdmJ3WElJT0ZDelJsM0ZhTVJ3WjQ3VXk4dTI0Vysz?=
 =?utf-8?B?QXNvZFVwWGdubTgveVIxT3NleDRLaWk0WFNnbXZKQ0JJUDZGbGJNaGpHRklD?=
 =?utf-8?Q?DZavbiTsjwZ6R/yLJleTAwf8KSC21r9EqvhSo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7669.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TS9jUWIvYS9rQjV1U2lnTEJBSkp1OTNibG82U1B6MllkT1AyQWZpbnBJZmZZ?=
 =?utf-8?B?TkxiaGYrTUVGQjRSNUhTN3pDL2hXMG5XWk5nWHBURzJIR2lRQXkrQUVUOWgr?=
 =?utf-8?B?NkpTMkxvcGZPVFlQWENlSjZCdVFEMVFCeDF4enRVdVU4c1oydkl1RGxOaDlB?=
 =?utf-8?B?cU85S3pNMWVqbEVnNHk2VnlHZDlISlA0Tm41ZERXTmtrdklIQjhZQWlqdUpL?=
 =?utf-8?B?ZnpCUkZ4UHNHSUkwQ1FDeU50dyt3djRVbHhZeFgrN0U1TFBENWRkcUNEd3pV?=
 =?utf-8?B?NzdGUHVuaWN2TUFIaEoxSC9FSnV1NVhZUDVwVCszSDRSa1NzcDM1aUd5Wnlv?=
 =?utf-8?B?Vk0xdDNmbytWa0hCRSt0YlBiaVV6Z0pLQ1c0QUFQNWsrdktpV2JFYWRleFho?=
 =?utf-8?B?Z0w0c2dIVTZESGpmbEJDM0dmdlJ0VUV3bFBwYkpqdzBza1FqaVRRMkx0WGxO?=
 =?utf-8?B?eWlwMlJNaWlja0puVXF6a3JMUWQyY3JucjBDbDc2dEQzTE00TDVxeGxXRnRI?=
 =?utf-8?B?aVIyYlczWkZiaTJlSjREK1pEam1lb3lyeS9rM1c4RUlvbE5Ddy9rbHRMM3JR?=
 =?utf-8?B?cFd1eXlzZFZ0cEZFRWxsQXVjYnFiZUZjd3M0SEZnZHM4bHFvdkRZTm1CRnR0?=
 =?utf-8?B?MHRmZDZiZ0JNV0hTVFBWNWVrNmNlaUw3eG1jU2M1U2NzbDI1ZGJ4a21jek5Z?=
 =?utf-8?B?WEdyWGxTVUw1NzFQWGRLZWZpTDg4dExwYld0N0Q1U2JyTnd0d05qcTlFRkRi?=
 =?utf-8?B?UjgzWFpTK280S3E0dHpqa2p3MHpSNlNZY1RVNVYzUE95NFJ1ajdWU1J4Y0xQ?=
 =?utf-8?B?VElRZjAwR2F6bmI5K01sL1RtL3FvQlBEU0d4TExNV1NxdE8zaDh0VUEzcWxX?=
 =?utf-8?B?OXJuZEI2QnN6MXBRNEYxeDNrY0pwNnZSdzB4Mm83WGl0ZitUV21ZLzdrSlJs?=
 =?utf-8?B?UzFuRFYzUlF6ajFwS25tQVpzOGROL00vbzRjNVEycEFFNnlTc2ZvVkRyWHRJ?=
 =?utf-8?B?SXpjY1RCa3FhWmNYcStNSUtOTklPWlhiSHc0ZjhuaDV3TVdDRlQ1bHhXOSt5?=
 =?utf-8?B?MXBXekpUZVIyZ053aERXblpvajh6c3g3a3lOUEZYTUYrT1BBRkE4eUVoNUlo?=
 =?utf-8?B?QnlxYjZmNWZoaVNiSzdzSzFIN2l1TXNqcUx6cGhDaHh5NlZ3UW8rQnNOeFhh?=
 =?utf-8?B?NUIwWllBdlFFVXRJdzZzaTBOdDA4RGFnZGRzTlIxUEJ2c1RGV2gxVXhzQlp2?=
 =?utf-8?B?NVB5T2RycmJyNUV1QjVHNURETVhwZHZNbnBsVmoycTd4OTluUDB6cGcwNUtw?=
 =?utf-8?B?Ry9uc1N4dlNaVVJqRDJzUUZxdnR2OHFZTExGcnFuQWkrWXpERFpMdkw0RHV1?=
 =?utf-8?B?ZlZoVFhhMmM1S2FmbFVMcU1pa2ZBcERjaDRFR3gvcHpZZ3g4MWhMN1g3Yys3?=
 =?utf-8?B?ZlhwNUR6QXF4TU9iRzBYcmo0aG40SUdWTlNPeHZyRkMvcGw0MTZnTHpQcmlk?=
 =?utf-8?B?Qld0bTkvcXNuMk9KWFdEeGRxSGRaTU4xb0o2aHZjY1ZiSHk5MWhHUlkxckdZ?=
 =?utf-8?B?SkZ5Q29VTDRNNnVoQ3pjcktwNE1udHBSMlBuOGtuLzJXVERXYzBMOTZUYThy?=
 =?utf-8?B?QkZpK2p0TmorSXIwZ1VwV2o3dGZaOVhQZGZtaERrMVZ2b3JDeVZrVkExRzI3?=
 =?utf-8?B?NEYrYkdnSlQ1azhxTlp3dHdyVFBjL1lGS2FrQWppUG5iU1NyaEh2UzNNQUtB?=
 =?utf-8?B?MDV6Q2xRNkRmOHpkNGNYdTFFSjExa1ByQXg0NVMzc0gwTWRxZGFIL3ZMTDgy?=
 =?utf-8?B?aXQ1UmNyRmFxdm9veU1XaDNJN1JiVmFaUEZmRFJyUnB6R3pQY1E5YXFIV3ZV?=
 =?utf-8?B?clJjL2NIeDFNUUdtNW12d0oyalI2KzVVbVp3a3ZIVldRWTBaS3Z3T3Fvck9R?=
 =?utf-8?B?b0Q1MXd6YlVBM0VNVjVOR3lYak44YVNMY2dlNjZWWUE5bUZ5RkEvSVZjTUxF?=
 =?utf-8?B?QjZReHdvaGMwM0tkeUViRkUyOG5DUnpPd2dKZzBnUlR2RThieUV5Z3E5bGhh?=
 =?utf-8?B?bUU3T3U2eWFPZnRYRFF1RjRXTDFuSUJhN1JTdm9MM0k5V0duSVdZMTlkUHlW?=
 =?utf-8?B?YloxRWh4RmJabi9ZcHordmFjRHc1TUppaHpwWmx0U3ZYRXRIS0JNaktIc0VY?=
 =?utf-8?B?TFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DAB87C3F0D3434CB9953EA3E4195853@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7669.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd14d81f-424b-4827-75fe-08dca0c6a180
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 09:56:55.2839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yau8JqXsLoZtomduhNyYLakneHg/mqJ8xK3gc9pgmdQQW93qxHcdO6on5gwsonBChreKDofNK8fVPtOT0lebb1AUV7TZxHImvfuSZorBwkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7093
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--32.203800-8.000000
X-TMASE-MatchedRID: cxtZ8fwm3r/4OiVTWoD8RCa1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCpZFiZjLlbTyGVyS87Wb4lx+Mk6ACsw4JnvsbfoZixUTN9E
	Wu0vlYdRER81TKAEI7OHyYk/qa43zYB11qN+uiQDDr0AjBcmfRm3eqxoVjgMESI7wNf2EvtG7CG
	rJz6r8kHiVrFrVkm01yl++oEidUglf4BpTN+neE0OLK43kW8U27TLAShhI26lo5YsPsbyLXeJ85
	MO4rWjIjCirriB3E68fanL/qZCQr+F/B1jEjV+6W7gz/Gbgpl7tJooK6M46AVfXgfL55inv5iEi
	QSjKZutzY42c5lAKivHMSba2OKK7LGnvcLDRAZcpa6LJktEjgNFqG4/BpDVa9YBezwhBfW6Lsl2
	fP0Tm+OSMD8epzY21KCJ2oSlHK1z+MzVaeoq/RbMjW/sniEQKsEf8CpnIYtlXPwnnY5XL5CH1Wq
	UsPIUnBNXbiQmvuPbwC+yY/IpROC2W7Y+Npd9RlGudLLtRO1uagpdUd+Iwzzi0EGOodLuCo8WMk
	QWv6iUVR7DQWX/WkQGLeSok4rrZC24oEZ6SpSkgbhiVsIMQKxZ5+8y352uC
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--32.203800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	BFB463075F67D842818E986814A2E2866657E6FDE3DB0EB4417FA77BB1C68C502000:8

T24gTW9uLCAyMDI0LTA3LTAxIGF0IDExOjE0ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gQW0gMjguMDYuMjQgdW0gMTU6NDAgc2NocmllYiBtcmlwYXJkQGtl
cm5lbC5vcmc6DQo+ID4gW1NOSVBdDQo+ID4gPiA+IFNvIG5vYm9keSBjYW4gbWFwIHRoYXQgYnVm
ZmVyLCBhbmQgdGhlIGZpcm13YXJlIGRyaXZlciBpcyB0aGUNCj4gPiA+ID4gb25lIHdobw0KPiA+
ID4gPiBrbm93cyB0aGF0IHRoaXMgYnVmZmVyIGNhbm5vdCBiZSBhY2Nlc3NlZCBieSBhbnlvbmUu
DQo+ID4gPiANCj4gPiA+IE9uIG1vc3QgaHcgSSBrbm93IHlvdSBjYW4gYWN0dWFsbHkgbWFwIHRo
YXQgYnVmZmVyLCBpdCdzIGp1c3QNCj4gPiA+IHRoYXQgdGhlDQo+ID4gPiBDUFUgc2VlcyBvbmx5
IGdhcmJhZ2UgaW4gaXQgYmVjYXVzZSB5b3UgZG9uJ3QgaGF2ZSB0aGUgbmVjZXNzYXJ5DQo+ID4g
PiBkZWNyeXB0aW9uIGtleXMgYXJvdW5kLg0KPiA+IA0KPiA+IFNvIHlvdSBjYW4gYWx3YXlzIG1h
cCBhbmQgYWNjZXNzIHRoZSBidWZmZXIsIGJ1dCBvbmx5IGlmIHlvdSdyZSBpbg0KPiA+IHRoZQ0K
PiA+IHJpZ2h0ICJjb250ZXh0IiB0aGUgY29udGVudCB3b3VsZCBiZSBjb3JyZWN0Pw0KPiAgDQo+
IEV4YWN0bHkgdGhhdCwgeWVzLiBZb3UgbmVlZCB0byBoYXZlIGFjY2VzcyB0byB0aGUgZGVjcnlw
dGlvbiBrZXlzLg0KPiANCj4gPiBJIHRoaW5rIHRoYXQgcGFydCBpcyBwcmV0dHkgZGlmZmVyZW50
IHRoYW4gd2hhdCBBUk0gU29DcyBhcmUgZG9pbmcsDQo+ID4gd2hlcmUgdGhleSB3b3VsZCB0eXBp
Y2FsbHkgcHJldmVudCBhbnkgQ1BVIGFjY2VzcyBhbmQgZmF1bHQgb24NCj4gPiBhY2Nlc3MuDQo+
ICANCj4gWWVhaCwgdGhhdCdzIGluZGVlZCBhbiBpbXBvcnRhbnQgZGlmZmVyZW5jZSBOaWNvbGFz
IG5vdGVkIGFzIHdlbGwuDQo+IA0KPiANCg0KQXMgSSBrbm93LCB0aGVyZSBhcmUgNCBraW5kIG9m
IGJ1ZmZlciBpbiBTVlAgZmxvdyBvZiBNZWRpYVRlayBwbGF0Zm9ybToNCjEpIFRoZSBub3JtYWwg
YnVmZmVyIHdpdGggdGhlIGVuY3J5cHRlZCB2aWRlbyBiaXRzdHJlYW0gY29udGVudA0KKHNvdXJj
ZSBidWZmZXIgZm9yIGRlY3J5cHRpb24gZW5naW5lKQ0KVXNlciBBUFAgd2lsbCBwdXNoIGVuY3J5
cHRlZCBkYXRhIHRvIHRoaXMgYnVmZmVyIGZvciBkZWNyeXB0ZWQgZW5naW5lLA0Kc28gaXQgc2hv
dWxkIGJlIG5vcm1hbCBidWZmZXIuDQoNCjIpIFRoZSBzZWN1cmUgYnVmZmVyIHdpdGggdGhlIGRl
Y3J5cHRlZCB2aWRlbyBiaXRzdHJlYW0gY29udGVudA0KKHNvdXJjZSBidWZmZXIgZm9yIHZpZGVv
IGRlY29kZXIgZW5naW5lKQ0KDQozKSBUaGUgc2VjdXJlIGJ1ZmZlciB3aXRoIGRlY29kZWQgZnJh
bWUgZGF0YSBjb250ZW50DQooc291cmNlIGJ1ZmZlciBmb3IgR1BVKQ0KDQo0KSBUaGUgc2VjdXJl
IGJ1ZmZlciB3aXRoIHJlc2l6ZWQgYW5kIGZvcm1hdCBjaGFuZ2VkIGZyYW1lIGRhdGEgY29udGVu
dA0KKHNvdXJjZSBidWZmZXIgZm9yIGRpc3BsYXkgZW5naW5lKQ0KDQoNClRoZSBzZWN1cmUgYnVm
ZmVyIGluIERSTSBTVlAgc2VyaWVzOg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz04NTU4ODgNCnNob3VsZCBiZSByZXNpemVk
IGFuZCBmb3JtYXQgY2hhbmdlZCBmcmFtZSBkYXRhIGZvciBkaXNwbGF5IGVuZ2luZSBhbmQNCml0
IGNhbiBvbmx5IGJlIGFjY2Vzc2VkIGluIFRFRSB3b3JsZCBieSB0aGUgc2VjdXJlIGRpc3BsYXkg
aGFyZHdhcmUuDQoNCklmIENQVSBhY2Nlc3MgdGhpcyBidWZmZXIgaW4gbm9ybWFsIHdvcmxkIG9y
IG5vbi1zZWN1cmUgZGlzcGxheQ0KaGFyZHdhcmUgYXJlIGNvbmZpZ3VyZWQgdG8gYWNjZXNzIHRo
aXMgYnVmZmVyLCB0aGV5IHdpbGwgZ2V0IGFuIElPTU1VDQpmYXVsdCBlcnJvciBhbmQgaXQgY2Fu
IG5vdCB0cmFuc2xhdGUgdG8gdGhlIGNvcnJlY3QgYnVmZmVyIGFkZHJlc3MuDQoNCj4gPiA+ID4g
UHV0dGluZyB0aGlzIG9uIHRoZSB1c2Vyc3BhY2UgdG8ga25vdyB3b3VsZCBiZSBwcmV0dHkgd2Vp
cmQsDQo+ID4gPiA+IGFuZA0KPiA+ID4gPiB3b3VsZG4ndCBzb2x2ZSB0aGUgY2FzZSB3aGVyZSB0
aGUga2VybmVsIHdvdWxkIHRyeSB0byBtYXAgaXQuDQo+ID4gPiANCj4gPiA+IEJ1dCB0aGF0J3Mg
ZXhhY3RseSBob3cgYWxsIG90aGVyIGltcGxlbWVudGF0aW9ucyB3b3JrIGFzIGZhciBhcyBJDQo+
ID4gPiBrbm93LiBJDQo+ID4gPiBtZWFuIHdoYXQgZG8geW91IGRvIGlmIHRoZSBrZXJuZWwgbWFw
cyB0aGUgZW5jcnlwdGVkIGJ1ZmZlcj8NCj4gPiA+IA0KPiA+ID4gT24gQU1EIHdlIGFsc28gYmxv
Y2sgdXNlcnNwYWNlIGFuZCBrZXJuZWwgQ1BVIGFjY2Vzc2VzLCBidXQgdGhhdA0KPiA+ID4gaXMg
b25seQ0KPiA+ID4gZG9uZSB0byBtYWtlIGl0IGVhc2llciB0byBmaW5kIGJ1Z3Mgbm90IGZvciBj
b3JyZWN0bmVzcy4NCj4gPiA+IA0KPiA+ID4gQW5kIHVzZXJzcGFjZSBhYnNvbHV0ZWx5IG5lZWRz
IHRvIGJlIGF3YXJlIHRoYXQgYSBidWZmZXIgaXMNCj4gPiA+IGVuY3J5cHRlZCwgY2F1c2UNCj4g
PiA+IG90aGVyd2lzZSBpdCBjb3VsZCBwb3RlbnRpYWxseSB0cnkgdG8gYWNjZXNzIGl0IHdpdGgg
dGhlIENQVS4NCj4gPiANCj4gPiBJIGFic29sdXRlbHkgYWdyZWUuIEkgZ3Vlc3Mgb3VyIGRpc2N1
c3Npb24gaXMgd2hldGhlciBpdCdzDQo+ID4gc29tZXRoaW5nDQo+ID4gdGhhdCBzaG91bGQgYmUg
aW1wbGljaXQgYW5kIHVuZGVyc3Rvb2QgYnkgYXBwbGljYXRpb25zLCBvciBpZiBpdA0KPiA+IHNo
b3VsZA0KPiA+IGJlIGV4cGxpY2l0IGFuZCBkaXNjb3ZlcmFibGUuDQo+ICANCj4gT2ggZ29vZCBw
b2ludCBhcyB3ZWxsLiBCdXQgSSB0aGluayB0aGF0J3MgbW9yZSBhIHF1ZXN0aW9uIGZvciB0aGUN
Cj4gdXNlcnNwYWNlIHN0YWNrIGRlc2lnbi4NCj4gDQo+IEUuZy4gaXQgY2FuIGJlIGhhbmRsZWQg
ZXhwbGljaXRseSBieSB0aGUgYXBwbGljYXRpb24gaXRzZWxmIG9yDQo+IGltcGxpY2l0bHkgYnkg
c29tZSBWNEwgb3IgVkEtQVBJIGxpYnJhcnkgb3Igc29tZXRoaW5nIHNpbWlsYXIuDQo+IA0KPiBG
b3IgdGhlIGtlcm5lbCBVQVBJIGRlc2lnbiB3ZSBhZ3JlZWQgYXQgc29tZSBwb2ludCB0aGF0IHdl
IGRvbid0IHdhbnQNCj4gdG8gaGF2ZSBhbnkgaW1wbGljaXQgcHJvcGVydGllcyBvbiB0aGUgRE1B
LWJ1ZiB3aGljaCBhcmUgY2FycmllZA0KPiBhcm91bmQgYnkgdGhlIGtlcm5lbCwgZS5nLiB0aGUg
d2hvbGUgZm9ybWF0IG1ldGFkYXRhIGZvciBleGFtcGxlLg0KPiANCg0KSSd2ZSBhc2tlZCBvdXIg
dmNvZGVjIG93bmVyIGhvdyB0byBoYW5kbGUgdGhlIHNhbWUgY2FzZSBpbiBWNEwyOg0KDQpodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAy
NDA1MTYxMjIxMDIuMTYzNzktMi15dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20vDQoNClRoZXkgYWxz
byBhZGRlZCBhIHNlY3VyZSBmbGFnIGluIFVBUEkgYW5kIFY0TDIgaGVhZGVyIGFuZCB0aGVuIHBh
c3NlZA0KaXQgZnJvbSB1c2Vyc3BhY2UgdG8gVjRMMiBkcml2ZXIuDQoNClNvIG1heWJlIHdlIGNh
biB1c2UgdGhlIHNhbWUgd2F5IHRvIGFkZCBhIHNlY3VyZSBmbGFnIGluIFVBUEkgYW5kDQpleHRl
bmQgdGhlIGZsYWcgcGFyYW1ldGVyIG9mIEFkZE1vZGVGQjIoKS4NCg0KSSB0aGluayBoZXJlIGlz
IGN1cnJlbnRseSB0aGUgbW9zdCBzdWl0YWJsZSBwbGFjZSB0byBhZGQgdGhlIHNlY3VyZQ0KZmxh
ZyBiZXNpZGVzIGFkZGluZyB0aGUgbmV3IGlvY3RsKCkuDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5M
aW4NCg0KPiBPbmUgbm90YWJsZSBleGNlcHRpb24gdG8gdGhpcyBpcyB0aGUgYWN0dWFsIGh3IHRv
cG9sb2d5LCBlLmcuIHdoZW4NCj4gZm9yIGV4YW1wbGUgYSBkZXZpY2UgaGFzIGEgc3BlY2lhbCBp
bnRlcmNvbm5lY3QgdG8gYW5vdGhlciBkZXZpY2UgYW5kDQo+IHlvdSBuZWVkIHRvIG1ha2Ugc3Vy
ZSB0aGF0IHRoZSBkZXZpY2VzIGFyZSBwb3dlcmVkIHVwIGFuZCBkb3duIGluIGENCj4gc3BlY2lm
aWMgb3JkZXIgdG8gbWFrZSB0aGluZ3Mgd29yay4NCj4gDQo+IFRoaXMgc2hvdWxkIHRoZW4gbWFk
ZSBrbm93biB0byB0aGUgY29yZSBrZXJuZWwgdXNpbmcgZGV2aWNlIGxpbmsNCj4gc3RydWN0dXJl
LiBFLmcuIHNpbWlsYXIgdG8gaG93IGl0J3MgdXNlZCBiZXR3ZWVuIEdQVSBhbmQgSERNSSBhdWRp
bw0KPiBibG9jayBmb3IgZXhhbXBsZS4NCj4gDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCj4g
DQo+ID4gTWF4aW1lDQo+ICANCg==

