Return-Path: <linux-media+bounces-14100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A89165B2
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 13:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D4891F24036
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 11:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8200D14AD17;
	Tue, 25 Jun 2024 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eq8VWKG8";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="HQBeBENp"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271F81095B;
	Tue, 25 Jun 2024 11:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719313375; cv=fail; b=k9uqB3s8Odj6jI1pxBvYZjBN8EABCalHNl2uUgGybosUcmAI3A4RuGnUEVQ2PS+UEH2i6pfKAfw+astsO/8pLMcY6BXPknXtEAEOjQOewuzNBNbEqPcFTG4pKIWeSfwaFAVNCJamaPkfB9XQFPe3fqpiYX6d2mI4yXcMnXnIAYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719313375; c=relaxed/simple;
	bh=pWMBkTK0JZDEZhx3RiuIr9wK/V2Oxmsx3ho7hoZWJ1c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qkDE7mNdla4eOV2JMMIDweoj33BiB8wFIPOt6wlGNo6xa4iPDL+LD9OVDLBb5I7JBj799JcNbBfAP+MWANENXrOG3uxV1EN/4q6sq6mS9gtEqrxv6OURoZIHFywC2W02YmDBbNFFN362f+bN6okLNt4KGqG/oxU6Xzk+4xSyHy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=eq8VWKG8; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=HQBeBENp; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 715b706c32e211ef99dc3f8fac2c3230-20240625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=pWMBkTK0JZDEZhx3RiuIr9wK/V2Oxmsx3ho7hoZWJ1c=;
	b=eq8VWKG8o6SKvF1JZWaIQSU/8lqP2fRifsJu0oqYfUHwVoEzOqjSHl60XZSK01u/7H7XmwEW71ngQOO/dKuz5qPC/jRFbeO76BbLmDEIHT+BmFovMPgvQUMW1ZltVJYY1RiWD4Q4uW0fIrHnuqOXH/vJCVga5NJzeBJAixhSTg0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:1835891d-25f4-48e9-ab70-6e86b5d5c794,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:e1910045-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 715b706c32e211ef99dc3f8fac2c3230-20240625
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2147056098; Tue, 25 Jun 2024 19:02:41 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 25 Jun 2024 19:02:39 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 25 Jun 2024 19:02:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kB2H/GXQ4BonQzxa/KqkpzPaJBzOtIQ2Api/CRwWSVVFqPlZlILKvv0F1RPuwRgd8q1410FowNsp+1OE3y9CQt9OdvmDVxPHqE65jEigS4JY1/oGqxKmIwwfd/vbKgrDp4sR5Lsx2qRlEfDIvxaPpeVrWJr8AxXWdNhdFnZ6JPKw8iwgVTpYdVyDZhqBhWgWOKiH+dgRgkf4Y89QUoCNM9i5lhaJZAZY7ZUy6l3jV1IPolpfmFMOYwcSB1IyREnamfBRJS6m0Y8TqSbqdEUHu7vLKqllEME9jOgE2iVouPpm4MOmNe4EiaMY2De7ATPbPOITw5u0FlyRin5zAMFZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWMBkTK0JZDEZhx3RiuIr9wK/V2Oxmsx3ho7hoZWJ1c=;
 b=bVLFFFzjnk94+M8At2JZUj0v7qZz/pt6Q3HrrIF/gTlxIlWIpSMDTFqHnMC6k3iXHggwq+FCOAyPRSRBiMi0wuG9x3203Zmmb4ZXL61OYfxHJz55TYqyOg7HXwSjvv1MO0Q0FFTba25ElTVE8AneEjEigzMWLJnidc9kCRtTz9SPBdJEKx7nJ6pZMR6nwdxkeXwWcB/xRrVzYJR553bDcfDXAN56N8dmdUlb/MfTZdN3oHHINDiZ0OChn6xSqRX5+WXdjKFZP4jqgHjtOCjklWKTHKoCt+x2xlytEewBogHMq/1/4DvWh6dRFNK6NEJ3BGevHeaIaf5UqP5/3zT9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWMBkTK0JZDEZhx3RiuIr9wK/V2Oxmsx3ho7hoZWJ1c=;
 b=HQBeBENpR+rANJdgQL6wONaOUwllnNo4sUnrpL/zg3hQUrDszeyjCGWro5GOnBSWw5WpMhKJMrwEhfGKeAn0VFeh2NrrgqwAz6+pcSrsiCWkLS/V5xyGLFWh/7ryDxXfbSbFgbXDs/I0WlUeRaRGlzlzkQOwyFb54tR+7YR+nns=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by JH0PR03MB8603.apcprd03.prod.outlook.com (2603:1096:990:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Tue, 25 Jun
 2024 11:02:37 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 11:02:36 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "christian.koenig@amd.com"
	<christian.koenig@amd.com>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mripard@kernel.org" <mripard@kernel.org>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"jstultz@google.com" <jstultz@google.com>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	=?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
	<Jianjiao.Zeng@mediatek.com>, "willy@infradead.org" <willy@infradead.org>,
	=?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
	"quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, "pavel@ucw.cz"
	<pavel@ucw.cz>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"contact@emersion.fr" <contact@emersion.fr>, "logang@deltatee.com"
	<logang@deltatee.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"jkardatzke@google.com" <jkardatzke@google.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"tjmercier@google.com" <tjmercier@google.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "joakim.bech@linaro.org"
	<joakim.bech@linaro.org>, "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Thread-Topic: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Thread-Index: AQHaxufGtXYlJ2nIzkCmfICpDUjhvbHYUI0A
Date: Tue, 25 Jun 2024 11:02:36 +0000
Message-ID: <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
	 <20240515112308.10171-3-yong.wu@mediatek.com>
	 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
	 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
	 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
In-Reply-To: <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|JH0PR03MB8603:EE_
x-ms-office365-filtering-correlation-id: 97e74071-d224-44cd-4f48-08dc95065281
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|7416011|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?cTlRR2lScDdaQzFpbXBCUitXSnU0ZWxPV0dHU05kR1BvNEs2UzhKSFRyVngx?=
 =?utf-8?B?Zmx2Mmt4UnVqbnRPSWpjdzFmdE14YmtxUjlPeUQ4cnlWKzk4bzNUQzlTSDlR?=
 =?utf-8?B?UXJURDgvOUkzRnRxSlNZQmp0V0lrckQzT1FPb0gvbWM4c3NKODVrMnhhVjFO?=
 =?utf-8?B?SlI0djBFeTJwRFVBWk94Sno4WHBKQTluZ21pWVBBTUpZV3lRcXo1Yk9FUGww?=
 =?utf-8?B?UWpqUUdGK2lHQ1Y2VHFxMzE5SnFkR0xFclJ5dW4rcmFKTGNGT05YVDZwdW5E?=
 =?utf-8?B?SHBHY0RoczA1bzhOblltUVVOVFBGd3pwNTd1RGhrSjNUcHJGa1NCWDdKeGZS?=
 =?utf-8?B?V1pDaGY5QVE1cFgvVzdRSkpKQUdhMkxJVDFmb3NXUVBKUHhTeVhMcHJBdWQv?=
 =?utf-8?B?QkFXWVlPUFNOMVI3WFJuV2xyTTJaT1R6c1NxS2l0VHA4YU5Idi9sVWpmMkZO?=
 =?utf-8?B?UzNUMVFidnNDaFdlTk41Q08yWHZtSkZHU29Id2NYZmJFeXZkTEY2c0ZWTFQ5?=
 =?utf-8?B?ellWSG5uSkFIUUV0S0JKQk5iZjVIZ3gxQWV5ZWlicStFbmYraG1ac1loNVRr?=
 =?utf-8?B?ZUUvKzN1M09iRzlHMUN0OUlZYXdHQWdmYXJJUDBub3RRTC93dC9EL1lReHEr?=
 =?utf-8?B?cS9vWE9MMml2cHZWVlV4S2FZQW50ZnlqcUt6SERHdDlxZHUzL1R0TllTRjhX?=
 =?utf-8?B?YmhCcUlwMFgrMFVyWDNkaWpYSmVUV1ZNOVE1ZGEzL2VUOHZDNENZNEN2dWZi?=
 =?utf-8?B?aHZGK0gyVFIyckZaWVpVUDhVVnFlUGFiY2F5YWRtdWRTRitxTmtXZzN2V2dn?=
 =?utf-8?B?T1pzaGdGZlNxWDQ2MVhNdkdBQVFhcldnZENJbUxRREN2bUoxa3kzQStyVFFZ?=
 =?utf-8?B?bVhyWUMyQTE5TjhwbDNMdnhlaVkxNFl0MWJQTnZvdEcxbzVuSndSYzczY2oy?=
 =?utf-8?B?S1g2dzYvVUc1d3MvaE85WXQxc2thb1JYZ1Q5MERHQ1VwYmJHK3pEU1Fwdmdn?=
 =?utf-8?B?UVh3b01DRE94V1RXeGlvc0hGMWdFUkxNR0pHZnZBMTFuNzZZUmErRUM3eTF1?=
 =?utf-8?B?UHdMaUVxYlhXSkJYN2RhbUdZZ05NMWhyMm5KRlFWMDFnc0RYOEFMdmUxVFdS?=
 =?utf-8?B?cCt0YWd3OTRRMUx5MllSTDYzdDQ4bDNpMXNjWnhHd2FKOFNDVDFlSy9MVlpj?=
 =?utf-8?B?Q3FnV3hzWFFkMytZeDFFZk9rZnRlRk9kcE9HL09XeE9XTzZyUDlkUGNFWEEy?=
 =?utf-8?B?T3VGVHZ6Q0lHOE5CNjVmdWphRVFzcGx4dUxtdEh5Nmx0WElyTml3RkZNUm5s?=
 =?utf-8?B?MFIwQ0dTRXkrdVBrVjluaFE0bm9WWWU4MXArS25IaGRlVnVOc05ZNjAwQTdm?=
 =?utf-8?B?MWRYdEFNZnk2TDdZTkYxU2UyR2ZsZ3FOL3cvTjVrQUlTL1BTVVE4QUtXZitp?=
 =?utf-8?B?NFlnMU1oeEJQM2lGWC9iK0xZamVBazVqdG5HWEtMY3VLcFAyYkNMTnVDWXd4?=
 =?utf-8?B?ZzN1anFTcmFHSTAzSmw2SGUxVFRuRFVqT0dGZkd6UUV0RjR4dlhRWHY4Tm04?=
 =?utf-8?B?MTB5S1dtbGRMdUs5T1l0N3VuZHBVOG83a252cEtGbTJKSWMwUXBiY0hwZFVX?=
 =?utf-8?B?YVE0Rm42NXlHWmhZTW1oTkxwaHhNamxNYVl1anoyQ2M1bTlraTlFMlIxMnAw?=
 =?utf-8?B?LzA1cEQ1c20yMENXNEJYRnFhZVBxdWY5d1g1bE5uV2h2a3puUmRtMEx4Q0FW?=
 =?utf-8?B?b1NqYlppSFdaODZ0STEyT2x6MlRQc3kvV25UVDM0ek1jenhvcHdiaDE1S1o3?=
 =?utf-8?Q?BHdIlVUHZIQxzGsnEcdoDATp9qlb9fFgteErY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(7416011)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0hIZ1ZQRGt1ek9qb21NbmpaSUlweVBXWFhQTDA4Y3Q2bVc3M1BwZUZmY0oy?=
 =?utf-8?B?R2YxWXVnczlvMVlmMmw0QnZVNGd5dm5lbmdwTjhocWU3TFZMa2szQytzVjA2?=
 =?utf-8?B?YU0zUXhkVmpIN1BOUFU2b3JKVGtwemV0bUFiUjFMK0pua2NPMVpxNWpFa3lT?=
 =?utf-8?B?Ly9VTzN6Y3NRbXpFTFNlSExXdVlLZDdnRlhmQStVZEROZ1JFTzRpUXFlOWtJ?=
 =?utf-8?B?L0EvTkRML2k2d2p5RVVNTUR2ZE1yM3dnMUtMV3NMdVVpaThac01sVjkvclZ2?=
 =?utf-8?B?YnFXdUVNWTlFNmRGZ0RxWXRsWkxtUDA5eEcwNWpFYXBLNDNkSENNcjJERGcy?=
 =?utf-8?B?UXZobnBGWGZGTk0yd3dQTE1oOWpBRFZDNjRPK25DYitvNGRsVncwNkpMWjRr?=
 =?utf-8?B?SVJrcW5vU1JSb0crYVA2cFFkcUw1ZDBsNnd0WVpsbWVQenlndk9qeGRWUUVk?=
 =?utf-8?B?ZzYrZXNkSEJzYVY4L2dWZUdQSTFrb3FlNXpyUm5WM0lWQzdQMjdCcldSK0Vn?=
 =?utf-8?B?cCs2Z2cvSHA2Z0NHZlRIM01HUVJMaUxDQ1lTVkpoZmRJNDk3LzJYSU05d01t?=
 =?utf-8?B?bnJsSWtkbGpESGZuNXBERWxhdmk2WE0xWklMTzFuRVg4Y3N0dVllN2hUZ1hC?=
 =?utf-8?B?U3Y5eFZKSkx3Y2Z3cCtiNlloSEQvMWFmK1hiRmRTME1weE5ONG9qQ0o2TWRQ?=
 =?utf-8?B?bWNYK2wrTE1LZEYrWnd0TXFYN1kweW85Rnkwems0U1lZMTZ5OGFVRnlWU2N2?=
 =?utf-8?B?YnR3QUVHZzAxbTFQVm1MZmlDeUU4ZjQySUdiNmsvcmw5azVOcVVRZ0svZkZ5?=
 =?utf-8?B?Znhpc1RZakJObTM5NFdYWDBUelo2d3orRTJUckc2SWJ2ekdreS81U1NNVjJr?=
 =?utf-8?B?SlJSMHVLcXhpR1o1czMvV2NEbGY0UnRscVpiS3ZGakFVUk4wOUNyc2RHTVJx?=
 =?utf-8?B?NkhMNWpaQ3ZCOU04TGJqelB1WjNSR2t3L0dwcXVhcXkvUTNqajhrU3lQMEVj?=
 =?utf-8?B?bzdpbWtsUVdEeXVhdFN5M295NDlRN3ZNakpaeHFOaTEvY1BOQy9ZZDd3U2xq?=
 =?utf-8?B?SVdFekJ1Z3hMc3FqZnlDTEtSWWphaGRPWUxHbFA3Q1Rwb0UvZW5tVWVxMHlo?=
 =?utf-8?B?VEF3VjJtNG8xVUhVSm9GOFUzeG5DSnFhQWQ3N3NWb3hOaWNjWjNPU1lBelgw?=
 =?utf-8?B?REQvVGJGU1MyVTFSV2xqT0NvK1ZpRnh1aVZZL2VlU2J6aXIwTHhENUpDUE85?=
 =?utf-8?B?Y1BYaHZvcUI3ZFJMaTN5NjNzWmY4Ykpmd0w0ZS9Vb1ZJRVNYWWloWHpPSXRj?=
 =?utf-8?B?dmVvVm5GMkhKdkVTQndPWTAvYjhpQUdDczdROGpxY0ZiZXBXNERHdlJxdGhT?=
 =?utf-8?B?cDBVTEdWYlo4MUsxdnBheXhXT251L2JWblBicjZNdlpMejRvS2JaRjBzdWQ1?=
 =?utf-8?B?SnZXaWswL1oxM0hQUXl0cjJBUWtUbGNLUHJweG1oYUpReTZxV3hrNTFFdGZK?=
 =?utf-8?B?dXB1U3B0VXhpZlR5QTZhRERHUVZhWkJydXMxQWV6RVBEYURiNXhPTmpCbkxx?=
 =?utf-8?B?M25HQVZwQXNQb2R6MG5tWDVjM1Y0cGJlQWJFZkdJV2Y0d3ExOFVxbEdRSWlw?=
 =?utf-8?B?c1Q3SFY3RWZBdFF4cU1JS2V1alo1R3VmOEJqdFRsblFFNWExVWdHc3FGNk1D?=
 =?utf-8?B?cFhsQ3YvaElDTFdMdWJVUGk0RjJBanZibVB3NnlDdlROWlFhWUNSU3BOWnhK?=
 =?utf-8?B?YTEyMjdkekRpZzJSZ250c3poNnhkT2VKdWZvcURQMUNvMVZ6UlRFenJTVnkx?=
 =?utf-8?B?YmtXRnUyZjUxZkdnTC9XRGVQZ214Um50a1VuZjczOXJ0ZUZURkE3TDdUK09W?=
 =?utf-8?B?M2ZaWHBTRzZvNFpzVVAwYzVMRDQ0V1hqczBSbHprOVUrSmFrVENPVHljQlpQ?=
 =?utf-8?B?d2tCUXBENlZBcS9WNlJWdXBvOHowVWpZWjE3Q0k3MnlWT3ZSU2VUNDZRamNi?=
 =?utf-8?B?Rm1NdlZGWEVwSHEzaGFZRENxaU83Zi9RelI5WWh3YnhTRVo4OHlqVUhlc2F6?=
 =?utf-8?B?dkVwa3MyTUliNEYvUlI2Y3hZQndqUjZoN1BvSUI2MUdlTmhFZHQvYW1aVm5V?=
 =?utf-8?B?dmdqK05SRVFscXczN29PSWhXL2xhVWJTZnhPbXR0RGZUaVdjUUVoMjlka2dJ?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <501BE1303B9C094B996CF1CE6A9FBEA4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e74071-d224-44cd-4f48-08dc95065281
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 11:02:36.5941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /CJffdx6G+bPlEw3D/oh5SJKF+khEzylyf8WXbD4yDwT9atFPA4mGHbbSqbrLC6sj3ezbJc+vWRRb1X6cFrZmvoVAIyQ09o14zpeEJSUDmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8603
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--23.148400-8.000000
X-TMASE-MatchedRID: TmlY9+XBoTkOwH4pD14DsPHkpkyUphL9t3r4XgTRDHeFjYT64fkpaaWz
	WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2RLYH80czGtfVBDonH99+VmHZ+cd7VyKXHOW
	W/Rp/isqkezmFj1qaDD6KDKqSBiRZ4MG9jJywnBUSEYfcJF0pRdJ178I1tpklze5MPJBEaTTi0n
	VT9rWZ+S/ZfM5oj2c5hmFEOYeR2DKQqMvYg6LYsItbv1rdjkQ6yeUl7aCTy8hrMbakJN8Oedzuz
	yvdSEu2ezwGvx6xji0agCCNzTrLEPBUGlJBh5pXFYJUGv4DL3wu7Xu+fl4ygRae5J4l8aLzJDkG
	kQuDnwNuCqm9GoQdiRFIHsQDg8oi2HzzjwqZ3wIDSdxA8LlApfy9bLgnh4Ap1VTshZ4BQIv8/L2
	o6LnOl/1TKBjmzrURsjNhHj6oBIPC5N8cNUn/Xlz+axQLnAVBvgdLSTYd46jagsZM0qVv1ycL9g
	83vYg4GBQG4ecYGn2Rk6XtYogiatLvsKjhs0ldVnRXm1iHN1bEQdG7H66TyOk/y0w7JiZo
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--23.148400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	CED28E86FDDE1AACD1C973F1087D84373E7BFC8E8DF4125DDD719862A72EC6892000:8

SGkgQ2hyaXN0aWFuLA0KDQpPbiBUdWUsIDIwMjQtMDUtMjEgYXQgMjA6MzYgKzAyMDAsIENocmlz
dGlhbiBLw7ZuaWcgd3JvdGU6DQo+IEFtIDIwLjA1LjI0IHVtIDA5OjU4IHNjaHJpZWIgWW9uZyBX
dSAo5ZC05YuHKToNCj4gPiBPbiBUaHUsIDIwMjQtMDUtMTYgYXQgMTA6MTcgKzAyMDAsIENocmlz
dGlhbiBLw7ZuaWcgd3JvdGU6DQo+ID4gPiAgIAkNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxl
YXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0K
PiA+ID4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+
ICAgQW0gMTUuMDUuMjQgdW0gMTM6MjMgc2NocmllYiBZb25nIFd1Og0KPiA+ID4gPiBJbnRyb2R1
Y2UgYSBGTEFHIGZvciB0aGUgcmVzdHJpY3RlZCBtZW1vcnkgd2hpY2ggbWVhbnMgdGhlDQo+ID4g
PiA+IG1lbW9yeQ0KPiA+ID4gDQo+ID4gPiBpcw0KPiA+ID4gPiBwcm90ZWN0ZWQgYnkgVEVFIG9y
IGh5cGVydmlzb3IsIHRoZW4gaXQncyBpbmFjY2Vzc2lhYmxlIGZvcg0KPiA+ID4gPiBrZXJuZWwu
DQo+ID4gPiA+IA0KPiA+ID4gPiBDdXJyZW50bHkgd2UgZG9uJ3QgdXNlIHNnX2RtYV91bm1hcmtf
cmVzdHJpY3RlZCwgdGh1cyB0aGlzDQo+ID4gPiANCj4gPiA+IGludGVyZmFjZQ0KPiA+ID4gPiBo
YXMgbm90IGJlZW4gYWRkZWQuDQo+ID4gPiANCj4gPiA+IFdoeSBzaG91bGQgdGhhdCBiZSBwYXJ0
IG9mIHRoZSBzY2F0dGVybGlzdD8gSXQgZG9lc24ndCBzZWVtIHRvDQo+ID4gPiBhZmZlY3QNCj4g
PiA+IGFueSBvZiBpdCdzIGZ1bmN0aW9uYWxpdHkuDQo+ID4gPiANCj4gPiA+IEFzIGZhciBhcyBJ
IGNhbiBzZWUgdGhlIHNjYXR0ZXJsaXN0IHNob3VsZG4ndCBiZSB0aGUgdHJhbnNwb3J0IG9mDQo+
ID4gPiB0aGlzDQo+ID4gPiBraW5kIG9mIGluZm9ybWF0aW9uLg0KPiA+IA0KPiA+IFRoYW5rcyBm
b3IgdGhlIHJldmlldy4gSSB3aWxsIHJlbW92ZSB0aGlzLg0KPiA+IA0KPiA+IEluIG91ciB1c2Vy
IHNjZW5hcmlvLCBEUk0gd2lsbCBpbXBvcnQgdGhlc2UgYnVmZmVycyBhbmQgY2hlY2sgaWYNCj4g
PiB0aGlzDQo+ID4gaXMgYSByZXN0cmljdGVkIGJ1ZmZlci4gSWYgeWVzLCBpdCB3aWxsIHVzZSBz
ZWN1cmUgR0NFIHRha2VzIG92ZXIuDQo+ID4gDQo+ID4gSWYgdGhpcyBqdWRnbWVudCBpcyBub3Qg
c3VpdGFibGUgdG8gYmUgcGxhY2VkIGluIHNjYXR0ZXJsaXN0LiBJDQo+ID4gZG9uJ3QNCj4gPiBr
bm93IGlmIGl0IGlzIG9rIHRvIGxpbWl0IHRoaXMgaW5zaWRlIGRtYS1idWYuIEFkZGluZyBzdWNo
IGFuDQo+ID4gaW50ZXJmYWNlOg0KPiA+IA0KPiA+IHN0YXRpYyBib29sIGRtYV9idWZfaXNfcmVz
dHJpY3RlZChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmKQ0KPiA+IHsNCj4gPiAJcmV0dXJuICFzdHJu
Y21wKGRtYWJ1Zi0+ZXhwX25hbWUsICJyZXN0cmljdGVkIiwgMTApOw0KPiA+IH0NCj4gDQo+IE5v
LCB1c3VhbGx5IHN0dWZmIGxpa2UgdGhhdCBkb2Vzbid0IGJlbG9uZyBpbnRvIERNQSBidWYgZWl0
aGVyLg0KPiANCj4gUXVlc3Rpb24gaGVyZSByZWFsbHkgaXMgd2hvIGNvbnRyb2xzIHRoZSBzZWN1
cml0eSBzdGF0dXMgb2YgdGhlDQo+IG1lbW9yeSANCj4gYmFja2luZyB0aGUgYnVmZmVyPw0KPiAN
Cj4gSW4gb3RoZXIgd29yZHMgd2hvIHRlbGxzIHRoZSBleHBvcnRlciB0aGF0IGl0IHNob3VsZCBh
bGxvY2F0ZSBhbmQNCj4gZmlsbCBhIA0KPiBidWZmZXIgd2l0aCBlbmNyeXB0ZWQgZGF0YT8NCj4g
DQo+IElmIHRoYXQgaXMgdXNlcnNwYWNlIHRoZW4gdGhhdCBpcyBwYXJ0IG9mIHRoZSBmb3JtYXQg
aW5mb3JtYXRpb24gYW5kDQo+IGl0IA0KPiBpcyBhbHNvIHVzZXJzcGFjZSB3aG8gc2hvdWxkIHRl
bGwgdGhlIGltcG9ydGVyIHRoYXQgaXQgbmVlZHMgdG8gd29yayANCj4gd2l0aCBlbmNyeXB0ZWQg
ZGF0YS4NCj4gDQo+IFRoZSBrZXJuZWwgaXMgaW50ZW50aW9uYWxseSBub3QgaW52b2x2ZWQgaW4g
c3R1ZmYgbGlrZSB0aGF0Lg0KPiANCg0KSGVyZSBpcyB0aGUgZXhwZWN0ZWQgcHJvdGVjdGVkIGNv
bnRlbnQgYnVmZmVyIGZsb3cgaW4gRFJNOg0KMSkgdXNlcnNwYWNlIGFsbG9jYXRlcyBhIGRtYS1i
dWYgRkQgZnJvbSB0aGUgInJlc3RyaWN0ZWRfbXRrX2NtYSIgYnkNCkRNQV9IRUFQX0lPQ1RMX0FM
TE9DLg0KMikgdXNlcnNwYWNlIGltcG9ydHMgdGhhdCBkbWEtYnVmIGludG8gdGhlIGRldmljZSB1
c2luZyBwcmltZSBmb3IgdGhlDQpkcm1fZmlsZS4NCjMpIHVzZXJzcGFjZSB1c2VzIHRoZSBhbHJl
YWR5IGltcGxlbWVudGVkIGRyaXZlciBpbXBvcnQgY29kZSBmb3IgdGhlDQpzcGVjaWFsIGNhc2Vz
IG9mIHByb3RlY3RlZCBjb250ZW50IGJ1ZmZlci4NCg0KSW4gdGhlIHN0ZXAgMyksIHdlIG5lZWQg
dG8gdmVyaWZ5IHRoZSBkbWEtYnVmIGlzIGFsbG9jYXRlZCBmcm9tDQoicmVzdHJpY3RlZF9tdGtf
Y21hIiwgYnV0IHRoZXJlIGlzIG5vIHdheSB0byBwYXNzIHRoZSBzZWN1cmUgZmxhZyBvcg0KcHJp
dmF0ZSBkYXRhIGZyb20gdXNlcnNwYWNlIHRvIHRoZSBpbXBvcnQgaW50ZXJmYWNlIGluIERSTSBk
cml2ZXIuDQoNClNvIEkgY2FuIG9ubHkgdmVyaWZ5IGl0IGxpa2UgdGhpcyBub3c6DQpzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm10a19nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1f
ZGV2aWNlDQoJKmRldiwgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLCBzdHJ1Y3Qg
c2dfdGFibGUgKnNnKQ0Kew0KICAgIHN0cnVjdCBtdGtfZ2VtX29iaiAqbXRrX2dlbTsNCg0KICAg
IC8qIGNoZWNrIGlmIHRoZSBlbnRyaWVzIGluIHRoZSBzZ190YWJsZSBhcmUgY29udGlndW91cyAq
Lw0KICAgIGlmIChkcm1fcHJpbWVfZ2V0X2NvbnRpZ3VvdXNfc2l6ZShzZykgPCBhdHRhY2gtPmRt
YWJ1Zi0+c2l6ZSkgew0KICAgICAgICBEUk1fRVJST1IoInNnX3RhYmxlIGlzIG5vdCBjb250aWd1
b3VzIik7DQogICAgICAgIHJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KICAgIH0NCiAgICBtdGtf
Z2VtID0gbXRrX2dlbV9pbml0KGRldiwgYXR0YWNoLT5kbWFidWYtPnNpemUpOw0KICAgIGlmIChJ
U19FUlIobXRrX2dlbSkpDQogICAgICAgIHJldHVybiBFUlJfQ0FTVChtdGtfZ2VtKTsNCg0KKyAg
IG10a19nZW0tPnNlY3VyZSA9ICghc3RybmNtcChhdHRhY2gtPmRtYWJ1Zi0+ZXhwX25hbWUsICJy
ZXN0cmljdGVkIiwNCjEwKSk7DQogICAgbXRrX2dlbS0+ZG1hX2FkZHIgPSBzZ19kbWFfYWRkcmVz
cyhzZy0+c2dsKTsNCiAgICBtdGtfZ2VtLT5zaXplID0gYXR0YWNoLT5kbWFidWYtPnNpemU7DQog
ICAgbXRrX2dlbS0+c2cgPSBzZzsNCg0KICAgIHJldHVybiAmbXRrX2dlbS0+YmFzZTsNCn0NCg0K
SSB0aGluayBJIGhhdmUgdGhlIHNhbWUgcHJvYmxlbSBhcyB0aGUgRUNDX0ZMQUcgbWVudGlvbiBp
bjoNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyNDA1MTUtZG1hLWJ1
Zi1lY2MtaGVhcC12MS0wLTU0Y2JiZDA0OTUxMUBrZXJuZWwub3JnLw0KDQpJIHRoaW5rIGl0IHdv
dWxkIGJlIGJldHRlciB0byBoYXZlIHRoZSB1c2VyIGNvbmZpZ3VyYWJsZSBwcml2YXRlDQppbmZv
cm1hdGlvbiBpbiBkbWEtYnVmLCBzbyBhbGwgdGhlIGRyaXZlcnMgd2hvIGhhdmUgdGhlIHNhbWUN
CnJlcXVpcmVtZW50IGNhbiBnZXQgdGhlaXIgcHJpdmF0ZSBpbmZvcm1hdGlvbiBmcm9tIGRtYS1i
dWYgZGlyZWN0bHkgYW5kDQpubyBuZWVkIHRvIGNoYW5nZSBvciBhZGQgdGhlIGludGVyZmFjZS4N
Cg0KV2hhdCdzIHlvdXIgb3BpbmlvbiBpbiB0aGlzIHBvaW50Pw0KDQpSZWdhcmRzLA0KSmFzb24t
SkguTGluDQoNCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0K

