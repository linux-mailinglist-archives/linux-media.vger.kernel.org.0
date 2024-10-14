Return-Path: <linux-media+bounces-19525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C26299BF5B
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE3EEB21336
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 05:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D4213B7A3;
	Mon, 14 Oct 2024 05:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="huNrFolf";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="EniO5eQp"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7FD231C9A;
	Mon, 14 Oct 2024 05:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728883294; cv=fail; b=QjkgmXNAQbmItR8T/xDPOB6HszFX4G6EiTGyON4JhHN/zoC3/XR8xHTn2tWVfjYgq/TWmhEQFGovJXR2Vo/eawecaKecNoZO05RHhwyvSvvGWJk0nhDZxpa3I9gCd20V+aGKuuaSxJssqaEqcZMJDccaSuAwaRYs0TD/fOoBChs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728883294; c=relaxed/simple;
	bh=GNldswMdjwRlAZmo/N5cPZ8ukRY/tgvgKUlJ5GZTmKk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WSBwAG9xuaJgYG8IITqamUUXyoyoilOwfFUgNA4ET26w9T/FlDvBM4M+gPTa1ZPUQTD+EPumLm7TIS39mKzKcZxnBP+1IeSZqHe+6RWqDwwMyGHovyiaFv6f0EHUuj1lX2hgUyBZvHGKY5EXTijOGZOXDy6Dp+VsDeA9JBv4HLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=huNrFolf; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=EniO5eQp; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 28cfcfda89ec11ef88ecadb115cee93b-20241014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=GNldswMdjwRlAZmo/N5cPZ8ukRY/tgvgKUlJ5GZTmKk=;
	b=huNrFolf0yJiX5D1tYVXMYuSu+48xtmP7dE2NVDAzwSkdcAowS89E3HVMIPvhjqa0q69QHOoR01iKPv2uGGmP3jJANhgTdyhDgm+WupQwrSnfvKLcwUTBkjDq8B/k/qOf2DHjFr566IzPz4CeWZcnf7nRBMVXGLB0isF/HzIrl8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:527157c6-dff2-40e5-abd3-0da03ba051db,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:e93cbc06-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 28cfcfda89ec11ef88ecadb115cee93b-20241014
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1016801207; Mon, 14 Oct 2024 13:21:26 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Oct 2024 13:21:24 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Oct 2024 13:21:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqFLa2jkPDz+QmIwr20HfU/OMqOy2MFMbJoqLamcSQNUG3O4/xqq1Iy51q+fwst329GcLMLVXkBUZ2QUpP3EJ+n5grXegeqvjdI3d/s8Ot39v13rPoNZp9khx+f75isA6Bq7zuxTXE4U8RJAeceOIt81ohfCk0yclgYgzHTCwsAcktLG1FhqJic6xDFczSzikLfjQVXm9Y+R4Hv8D35076Lpby+ClZl3k6bgh+Yt80eHPQ2KU0yNPxw5J72cw1+r/XYg2L0P/PQABLOZOjqqtCm9Vq8wannYxjGlWpPm3LW3oZN6MFnX+D1G0U89kzq8M9DngofHuTNe2zhcC2HyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNldswMdjwRlAZmo/N5cPZ8ukRY/tgvgKUlJ5GZTmKk=;
 b=PF4CXmJJJ2Rigpj5+O+idHAS5+ZchpSXbHx51StHF5DWVo+0+FiEJHkz1Hhh9mOSQQWnopKzfD0C1Jp+ej19+Xo2+ff8OecnWTlXP26Bz6Cvm1cvkVRD6hEhZCDduvmoXoB7eFaxSNsOQt7sqKIc30KHfkM40rI5/l3NA5+osvYclgQDXIKXRzKZV1hTGRlZ9XGtgc575YaSIwj6DNqQ8SKqDNMqHKcDPxd4QbSkTiPHsrU+vmn75cwacklGWIRrusfsWYXY8mfqB660DXkfqlLjCnLAeQ8srwEnsrtFtzGME8DrDtDXPa6W4jGWspBfBPr08mD6SyM6/KUrZE50/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNldswMdjwRlAZmo/N5cPZ8ukRY/tgvgKUlJ5GZTmKk=;
 b=EniO5eQpqMX1Id0yxE8mc5d926fE1BPFUoFG6vLHNvDK6kN/mpuM1+NZcMUOMAl4x7kPrRsg0TsRb8vXZvf/9gXOpcOpYBHO3lYoO3DlY8i3F3afJvWi2eQxYrpWP/T9mCQuJUNmeb9xHaJ76aLrV6vbvei9JCrQT5BayVtUecs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7806.apcprd03.prod.outlook.com (2603:1096:990:2c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 05:21:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 05:21:21 +0000
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
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKFvVIA
Date: Mon, 14 Oct 2024 05:21:21 +0000
Message-ID: <330f06069eaa7b6843709bb0d29c3ad5f23a4f3c.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7806:EE_
x-ms-office365-filtering-correlation-id: 2c855685-2526-4d52-1051-08dcec100a70
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?REFZZktDMVljTnJ4N1ZuY25QRTZrelJxVlo0WnUvK3FOclZVSXkza1ErZ2Jz?=
 =?utf-8?B?SFk4S1Y1TXl0UHpiS1FGTlcyZG9xa0RibGF6YmNkSmtmZzlGYzRDOW81dkZn?=
 =?utf-8?B?cVdnTEF2b2lVM0QyTGNMMG1wRXJ0b2pTSm1CbGliL0dwQzJMR0Rxbm5lZGM2?=
 =?utf-8?B?NU41MGdJNFBKdnhwNEx4R2xsQzRHdVFjdmM0OFI2Ti8zVG5NQlhJZVgvZ0xa?=
 =?utf-8?B?enJ5RVIrSERyN05CTVcvemRPbGRJNW0zMmpDYUkxc0dvdDNmQlRXQWpWU2xs?=
 =?utf-8?B?U1dHYmZUTVk4Rnkxb0lTMEcrbW1KY0orWTA2b242MzlUbDQwZU9iaWgrN3lj?=
 =?utf-8?B?SDI2d0wyQWE2cUJwQ2RPN2gxOXE5bXNvSHpMdERsQzYzNS93VWRGUDBZbS83?=
 =?utf-8?B?aExtcC9VRkhVbjJJQnNhdm9JWjFoRmgrRGRLWU9PR2wyN3VJc2plZmtCVFJp?=
 =?utf-8?B?ZVltaDRKVitGeGZqT0piRHEyL0ZuT0psV3FGWW5xQ1Rzemkzby9YbC9tVVA1?=
 =?utf-8?B?OFNhRVNHdFdEV2I0WlA2a3Z4VzZxL2piUWxVaEpadVJuVzdiNHJQa0VraVRl?=
 =?utf-8?B?Z1JPbGJzK3RCVFNSTnhYN29nampxQUtuMnVGYkFGM0pXUjArblhkTUQzbUhN?=
 =?utf-8?B?cU5Dd1hrcys3UXZOdVZ3Qks4TFpML1IrSVFtdVhiVjVuYUFZTUNER3FCVGtr?=
 =?utf-8?B?YUhwRFJQRkRkdktJUG5uN0xFamtaamNrY0grVGl0RGJHNEwwd0xMVXhMazFO?=
 =?utf-8?B?dXhqcFVEVTZkdWNOck9RVnByeGNOYUhrN0JmMTFkc0plM3Eyc1JTbzZIZHNj?=
 =?utf-8?B?TUZDOUR5WS80R3I4L3J0MFVuQVlNVXYwRWUxekVPSk1QcFJaS1QvNFZmZDls?=
 =?utf-8?B?RUIwYWxnOENvTlJqUm0xaW9TNjhqa2c1SWhJZGlyWjY5czFrMGFLRUFreS93?=
 =?utf-8?B?dUR4TnNqWTE3SlErWE41citseDdXM29MZCtrVFdzWUpDbk1jUDhTOTVnQUZW?=
 =?utf-8?B?MHZoaExKdGhvUUJia3lPRVRWWWZUWHU1aXFZdGNwemJPemNzL01sUXBpQTNt?=
 =?utf-8?B?SG9aSUxrTVhBeDdKL3F2RXV3dW80cHRWQXNJdGxITzM3N3NVOHZRUGtHVjU2?=
 =?utf-8?B?WklLbFJwVFdDREphaXV0ZWtzelM3UDZRV2F6OVZhQVU0bXp0c2xSMk0yNjNQ?=
 =?utf-8?B?Z0xQUklwZUhnWjhDZ0hZVUg4am1BSEh6em4rbVFYSDZjOTkvdWdiZUpHSHk3?=
 =?utf-8?B?WGdVNzFkaFZ4c1I5Ky82UFBBTGxMWUh4dld6aE45WEt2RXFWSHc4cnhJNXcx?=
 =?utf-8?B?SkZUak5kWnp4bm9tK3J2TlVRNk1ZUkI5RG9CWjZWb3Z0TXZBa1U3eEJoVVRP?=
 =?utf-8?B?Zk01THY0Mi8yOThIRk9OK1M4Y1RhY2xpSnZkNkxKNHFXaGRXRkQ0TWFlY0hu?=
 =?utf-8?B?QWczQzQzcTA0RCt3UDdZN3o0WXRwdGV4dmxOOGVlaEZ5a2IwUFlFeXhRNnIz?=
 =?utf-8?B?bUJ6ZHhGWTF4dHkzYVAzenBoU2kwSUZIY2wrR1RxVWZIVXdBRityUUJkeVFM?=
 =?utf-8?B?R080VHhYT3NmQlIwdHlKbDFMM2N5Z3dTaWdCNDBRczErOHJTZWd3OVVaSmtr?=
 =?utf-8?B?bDV5NytIY3Zab2ZhZUhqQmFmVk5QalNpem4ybDlNSzRqL3M4RS9CamV2TDNG?=
 =?utf-8?B?S0hnYnhzZ0xtN3FSSWc2Z0VSNGJkSGgycjRwL3hUOGQwdDgyT3IzM0N1NXho?=
 =?utf-8?B?NUFUWGQweUQ3ZXcwNWlic3B0ckJsY1pzR3M4TXJpTFFNYkk2SkVxa0l3eGNV?=
 =?utf-8?B?dEhKeWh3cE13cStCRW5Idz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1QzNFplT3JScTBGem8vYStsZjlxM05vUlVwWEhCMTJBS2lQaENFZWZxcSt5?=
 =?utf-8?B?dnZOZDJHRndPOTllNm9Zb0ltUTlvWGdsNWIyR1JwL3EwWld6dmR3VzUzWHpQ?=
 =?utf-8?B?Z2g5emxEaEpPVmNCRWZqUlkxeVpLb0NkNWVZRHFudXF2TXhnL0tlZVV5bi9W?=
 =?utf-8?B?UjA1cGlqRGtudzNUWCtqMVFZZWVTTlRqRDhQSUIramY5ZW9MdG5BUkJ6SUYy?=
 =?utf-8?B?UjVRSXVyMGE1WjB6anVIajVZbkJDYURYbWpnNGZBRHM2RUZZQjJ5S3o5L2cz?=
 =?utf-8?B?dUZtbFd1SFRnb01ScmxSeDRqM0ZoV1J0d1BSaTlPOUcraXVBT3hSdnlFK0s0?=
 =?utf-8?B?QXVzTXpwQnArSE45dWxXVVE0Y0VqMS9wd0dkR2pJdk5KVWVPV2pydjdHbzRZ?=
 =?utf-8?B?REdvUnF0VDFhUDdoN3MxaWxKMHVWQVBwb25vN1BQcGF5NkVUcGhqUFpJaUgy?=
 =?utf-8?B?SmRsY2lLdUNpSDhnUmVpZnZJdWEyVVRsUHJrUFlqT0p2RkIvcDJXVUZwMXJU?=
 =?utf-8?B?UkZuQ0g2V2twZmU5eWlFQWJTd25IQVBCRzY2LytNV2VjdFUyL2UrSy9PNlhQ?=
 =?utf-8?B?eHM2eDFENzdrRlJXcFIxUkhBS1NjTjlDaUNIdkpjczduVUR1dk5WNEJuU3ht?=
 =?utf-8?B?aElCc1RpTkZ2NzhHQTNOc0RLUVJ5NEhUSGVGRjJaMlhZcmtqQVhDckdTSEJ1?=
 =?utf-8?B?UVMwMWIyWElPK0NoN3FWUE1pK29VZDdYdk9kMkY4MjBzdTlkMkpiWTkyblhP?=
 =?utf-8?B?TFZmZXJFYzdSSVJuSXlra2Z2VW44REp4bzJ6TVpWWUFzSzVqcVlFWkRlc0Rx?=
 =?utf-8?B?RC9RUHZ6U3g0Qmt1R3U3bStuSzhZb1NtVHdpZno3WE9DNlF1OGRJMFlSbTBO?=
 =?utf-8?B?TU5nM3VORmtiMG1VaVB3MVBoWG5yN2VFY01DVGYyMjFQdEpReEFGdzFpRGpa?=
 =?utf-8?B?eHhHM2xyaW9rN29nQTdlTDZvVlNNcWVBM1A5ZTlaNHZpQnJXOWsxY1VmZi9r?=
 =?utf-8?B?RjRqZVBvRWFHSGZGRFlVaUJSWGtxQTVlMUY2OGxaSXRGcGgyTDdZTXg1TllZ?=
 =?utf-8?B?UG9kS1RjeXBOQmFOL2loaEJkM2dJd3pSRXZudE1wWWcyZ1pycURlbnR2UHQy?=
 =?utf-8?B?VkMvOWtqRTNBaC9BdTBRaXBvdFBpWG82MWgzb2tBeHlCbGNqOFpzdzRyRTBr?=
 =?utf-8?B?MDMyTFRrTXJ1bGg5aWFjOHJqWU5QcFFWWlFFeUtlSjlYVExMeWo5L2V5a1hv?=
 =?utf-8?B?WUJRT1hHOUk1OXhLb3JLNmRZWXp4TWpQVDlENHNHWmw1RElMdURnRENOa2pF?=
 =?utf-8?B?dkFlUmdLeTY1MnJyT2hYanMxU1l3dy9oZXhUd09saFBwb0d3UG4razdYMHNh?=
 =?utf-8?B?a2RQYzJ6TDhqbTlnQ0hwYzFUMXh2YjdiYUl5TG1JNWozUzBkTG9CdUcxdEtP?=
 =?utf-8?B?L3RNTTFxYzhiYnVwd0JrTElWT0VycmZsU3BIUE5Fck90dHlpWmpjcVVudlhj?=
 =?utf-8?B?d29kUkxNRWJJRXBGS2Z4Z1NEczU3dTFVbm84NUVwUTJrOVlrdzV1TGdZMEtN?=
 =?utf-8?B?aTNjVVl4Q3h0czBwdE5tRTd2dC9wbjNVdEMwZkMwekZqTlRRb05HblJqRmdW?=
 =?utf-8?B?YU8xUTVjZWZuQmRnSERYbEMxZjNLL05VSFN1WjRNeUM4RUhBYlBSZ3RwT3dI?=
 =?utf-8?B?c0U1d0JvYzZsSTEvRHIxRThKd3VidlhvUVByMy9XeGFmVXkvT3VidU1YSmF6?=
 =?utf-8?B?cVlpYTRxcnA4aTRRSUhLTWs3L0JvSXduMVZ6R3VtS25RZEpzTGtEWVUvYXV3?=
 =?utf-8?B?YmtNVHZiMnBFWkR6cXgxUjhXd29jVWdML0pRdmQ4QWNuUGdFWkI2ZlA1Ui9V?=
 =?utf-8?B?M1lBZVBmN24yV1NTWHNtQmJiVHlwTTA1RDJDUmhMN2s3blB0ZHYyeTFZREpU?=
 =?utf-8?B?WUlib1NWMk14cTVxQVUzRzFlRE9UNVAxVFA0WTdhU0EvQVRGaWlnWERCcW9n?=
 =?utf-8?B?cXBiRlplZEZ2VEc3UkFTdXNaekZzemo4MFNadDh2a0ZGQlErbHQ3ZVFKUUV1?=
 =?utf-8?B?T3F2NDhpdW0xQklhaEZBNkV1L1BubE43UUt1WkxWdnN0UEdQWnd2QXFQM1d3?=
 =?utf-8?Q?uC4yZIn+ETpOrMUY8EtDv9x3a?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EE70C5C5F99194B9C5BF35FE5DB1EB0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c855685-2526-4d52-1051-08dcec100a70
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 05:21:21.8310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: POhTyrJ4orli2Eb3yY1fJQrhdDrMKtz4RWaSiIhpQH5jJtSy+yhkbMl91rF3Lpb471BHrXI+xX0Pr7AL1RS6tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7806

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
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKy8q
DQo+ICsgKiAgViA0IEwgMiAgTSBFIFQgQSAgQiBVIEYgRiBFIFIgIEwgQSBZIE8gVSBUDQo+ICsg
Ki8NCj4gKw0KPiArLyoNCj4gKyAqICBzdHJ1Y3QgbXRrX2NhbV91YXBpX21ldGFfcmF3X3N0YXRz
X2NmZw0KPiArICoNCj4gKyAqICBAYWVfYXdiX2VuYWJsZTogVG8gaW5kaWNhdGUgaWYgQUUgYW5k
IEFXQiBzaG91bGQgYmUgZW5ibGFlZCBvciBub3QuIElmDQo+ICsgKiAgICAgICAgaXQgaXMgMSwg
aXQgbWVhbnMgdGhhdCB3ZSBlbmFibGUgdGhlIGZvbGxvd2luZyBwYXJ0cyBvZg0KPiArICogICAg
ICAgIGhhcmR3YXJlOg0KPiArICogICAgICAgICgxKSBBRS9BV0INCj4gKyAqICAgICAgICAoMikg
YWFvDQo+ICsgKiAgICAgICAgKDMpIGFhaG8NCj4gKyAqICBAYWZfZW5hYmxlOiAgICAgVG8gaW5k
aWNhdGUgaWYgQUYgc2hvdWxkIGJlIGVuYWJsZWQgb3Igbm90LiBJZiBpdCBpcyAxLA0KPiArICog
ICAgICAgIGl0IG1lYW5zIHRoYXQgdGhlIEFGIGFuZCBhZm8gaXMgZW5hYmxlZC4NCj4gKyAqICBA
ZGduX2VuYWJsZTogICAgVG8gaW5kaWNhdGUgaWYgZGduIG1vZHVsZSBzaG91bGQgYmUgZW5hYmxl
ZCBvciBub3QuDQo+ICsgKiAgQGZsa19lbmFibGU6ICAgIElmIGl0IGlzIDEsIGl0IG1lYW5zIGZs
ayBhbmQgZmxrbyBpcyBlbmFibGUuIElmIGllIGlzIDAsDQo+ICsgKiAgICAgICAgYm90aCBmbGsg
YW5kIGZsa28gaXMgZGlzYWJsZWQuDQo+ICsgKiAgQHRzZl9lbmFibGU6ICAgIElmIGl0IGlzIDEs
IGl0IG1lYW5zIHRzZnMgYW5kIHRzZnNvIGlzIGVuYWJsZS4gSWYgaWUgaXMgMCwNCj4gKyAqICAg
ICAgICBib3RoIHRzZnMgYW5kIHRzZnNvIGlzIGRpc2FibGVkLg0KPiArICogIEB3Yl9lbmFibGU6
ICAgICBUbyBpbmRpY2F0ZSBpZiB3YiBtb2R1bGUgc2hvdWxkIGJlIGVuYWJsZWQgb3Igbm90Lg0K
PiArICogIEBwZGVfZW5hYmxlOiAgICBUbyBpbmRpY2F0ZSBpZiBwZGUgbW9kdWxlIHNob3VsZCBi
ZSBlbmFibGVkIG9yIG5vdC4NCj4gKyAqICBAYWVfcGFyYW06ICBBRSBTdGF0aXN0aWMgd2luZG93
IGNvbmZpZw0KPiArICogIEBhd2JfcGFyYW06IEFXQiBzdGF0aXN0aWMgY29uZmlndXJhdGlvbiBj
b250cm9sDQo+ICsgKiAgQGRnbl9wYXJhbTogREdOIHNldHRpbmdzDQo+ICsgKiAgQGZsa19wYXJh
bTogRmxpY2tlciBzdGF0aXN0aWMgY29uZmlndXJhdGlvbg0KPiArICogIEB0c2ZfcGFyYW06IHRz
ZiBzdGF0aXN0aWMgY29uZmlndXJhdGlvbg0KPiArICogIEB3Yl9wYXJhbTogIFdCIHNldHRpbmdz
DQo+ICsgKiAgQHBkZV9wYXJhbTogcGRlIHNldHRpbmdzDQo+ICsgKi8NCj4gK3N0cnVjdCBtdGtf
Y2FtX3VhcGlfbWV0YV9yYXdfc3RhdHNfY2ZnIHsNCg0Kc3RydWN0IG10a19jYW1fdWFwaV9tZXRh
X3Jhd19zdGF0c19jZmd7fSBpcyB1c2VsZXNzLCBzbyBkcm9wIGl0Lg0KDQpSZWdhcmRzLA0KQ0sN
Cg0KPiArCXM4IGFlX2F3Yl9lbmFibGU7DQo+ICsJczggYWZfZW5hYmxlOw0KPiArCXM4IGRnbl9l
bmFibGU7DQo+ICsJczggZmxrX2VuYWJsZTsNCj4gKwlzOCB0c2ZfZW5hYmxlOw0KPiArCXM4IHdi
X2VuYWJsZTsNCj4gKwlzOCBwZGVfZW5hYmxlOw0KPiArCXU4IHJzdjsNCj4gKw0KPiArCXN0cnVj
dCBtdGtfY2FtX3VhcGlfYWVfcGFyYW0gYWVfcGFyYW07DQo+ICsJc3RydWN0IG10a19jYW1fdWFw
aV9hd2JfcGFyYW0gYXdiX3BhcmFtOw0KPiArCXN0cnVjdCBtdGtfY2FtX3VhcGlfYWZfcGFyYW0g
YWZfcGFyYW07DQo+ICsJc3RydWN0IG10a19jYW1fdWFwaV9kZ25fcGFyYW0gZGduX3BhcmFtOw0K
PiArCXN0cnVjdCBtdGtfY2FtX3VhcGlfZmxrX3BhcmFtIGZsa19wYXJhbTsNCj4gKwlzdHJ1Y3Qg
bXRrX2NhbV91YXBpX3RzZl9wYXJhbSB0c2ZfcGFyYW07DQo+ICsJc3RydWN0IG10a19jYW1fdWFw
aV93Yl9wYXJhbSB3Yl9wYXJhbTsNCj4gKwlzdHJ1Y3QgbXRrX2NhbV91YXBpX3BkZV9wYXJhbSBw
ZGVfcGFyYW07DQo+ICsNCj4gKwlzdHJ1Y3QgbXRrX2NhbV91YXBpX3Byb3Qgew0KPiArCQkvKiBU
aGUgZm9sbG93aW5nIHRvcCBjb250cm9sIGFyZSBnZW5lcmF0ZWQgYnkgc2NyaXB0ICovDQo+ICsJ
CXU4IGRyemgybl9yMV90dW5pbmdfZW5hYmxlOw0KPiArCQl1OCBkcnpoMm5fcjJfdHVuaW5nX2Vu
YWJsZTsNCj4gKwkJdTggZHJ6aDJuX3IzX3R1bmluZ19lbmFibGU7DQo+ICsJCXU4IGRyemgybl9y
NF90dW5pbmdfZW5hYmxlOw0KPiArCQl1OCBkcnpoMm5fcjVfdHVuaW5nX2VuYWJsZTsNCj4gKwkJ
dTggZHJ6aDJuX3I2X3R1bmluZ19lbmFibGU7DQo+ICsJCXU4IGRyemgybl9yN190dW5pbmdfZW5h
YmxlOw0KPiArCQl1OCBkcnpoMm5fcjhfdHVuaW5nX2VuYWJsZTsNCj4gKwkJdTggZHJ6czRuX3Ix
X3R1bmluZ19lbmFibGU7DQo+ICsJCXU4IGRyenM0bl9yMl90dW5pbmdfZW5hYmxlOw0KPiArCQl1
OCBkcnpzNG5fcjNfdHVuaW5nX2VuYWJsZTsNCj4gKwkJdTggZG1fdHVuaW5nX2VuYWJsZTsNCj4g
KwkJdTggZHJ6czh0X3IxX3R1bmluZ19lbmFibGU7DQo+ICsJCXU4IGRyenM4dF9yMl90dW5pbmdf
ZW5hYmxlOw0KPiArCQl1OCBnZ21fcjFfdHVuaW5nX2VuYWJsZTsNCj4gKwkJdTggZ2dtX3IyX3R1
bmluZ19lbmFibGU7DQo+ICsJCXU4IGdnbV9yM190dW5pbmdfZW5hYmxlOw0KPiArCQl1OCBicGNf
cjFfZW5hYmxlOw0KPiArCQl1OCBicGNfcjJfZW5hYmxlOw0KPiArCQl1OCBjY21fcjFfZW5hYmxl
Ow0KPiArCQl1OCBjY21fcjJfZW5hYmxlOw0KPiArCQl1OCBjY21fcjNfZW5hYmxlOw0KPiArCQl1
OCBmdXNfZW5hYmxlOw0KPiArCQl1OCBnMmNfcjFfZW5hYmxlOw0KPiArCQl1OCBnMmNfcjJfZW5h
YmxlOw0KPiArCQl1OCBnMmNfcjNfZW5hYmxlOw0KPiArCQl1OCBobHJfZW5hYmxlOw0KPiArCQl1
OCBsc2NfZW5hYmxlOw0KPiArCQl1OCBsdG1fZW5hYmxlOw0KPiArCQl1OCBsdG1zX2VuYWJsZTsN
Cj4gKwkJdTggb2JjX3IxX2VuYWJsZTsNCj4gKwkJdTggb2JjX3IyX2VuYWJsZTsNCj4gKwkJdTgg
dGN5X3IxX2VuYWJsZTsNCj4gKwkJdTggdGN5X3IyX2VuYWJsZTsNCj4gKwkJdTggdGN5X3IzX2Vu
YWJsZTsNCj4gKwkJdTggdG5jc19yMV9lbmFibGU7DQo+ICsNCj4gKwkJc3RydWN0IG10a19jYW1f
dWFwaV9jY21fcGFyYW1fcHJvdCBjY21fcjFfcGFyYW07DQo+ICsJCXN0cnVjdCBtdGtfY2FtX3Vh
cGlfY2NtX3BhcmFtX3Byb3QgY2NtX3IyX3BhcmFtOw0KPiArCQlzdHJ1Y3QgbXRrX2NhbV91YXBp
X2NjbV9wYXJhbV9wcm90IGNjbV9yM19wYXJhbTsNCj4gKwkJc3RydWN0IG10a19jYW1fdWFwaV9k
cnpoMm5fcGFyYW1fcHJvdCBkcnpoMm5fcjFfcGFyYW07DQo+ICsJCXN0cnVjdCBtdGtfY2FtX3Vh
cGlfZHJ6aDJuX3BhcmFtX3Byb3QgZHJ6aDJuX3IyX3BhcmFtOw0KPiArCQlzdHJ1Y3QgbXRrX2Nh
bV91YXBpX2Ryemgybl9wYXJhbV9wcm90IGRyemgybl9yM19wYXJhbTsNCj4gKwkJc3RydWN0IG10
a19jYW1fdWFwaV9kcnpoMm5fcGFyYW1fcHJvdCBkcnpoMm5fcjRfcGFyYW07DQo+ICsJCXN0cnVj
dCBtdGtfY2FtX3VhcGlfZHJ6aDJuX3BhcmFtX3Byb3QgZHJ6aDJuX3I1X3BhcmFtOw0KPiArCQlz
dHJ1Y3QgbXRrX2NhbV91YXBpX2Ryemgybl9wYXJhbV9wcm90IGRyemgybl9yNl9wYXJhbTsNCj4g
KwkJc3RydWN0IG10a19jYW1fdWFwaV9kcnpoMm5fcGFyYW1fcHJvdCBkcnpoMm5fcjdfcGFyYW07
DQo+ICsJCXN0cnVjdCBtdGtfY2FtX3VhcGlfZHJ6aDJuX3BhcmFtX3Byb3QgZHJ6aDJuX3I4X3Bh
cmFtOw0KPiArCQlzdHJ1Y3QgbXRrX2NhbV91YXBpX2RyenM0bl9wYXJhbV9wcm90IGRyenM0bl9y
MV9wYXJhbTsNCj4gKwkJc3RydWN0IG10a19jYW1fdWFwaV9kcnpzNG5fcGFyYW1fcHJvdCBkcnpz
NG5fcjJfcGFyYW07DQo+ICsJCXN0cnVjdCBtdGtfY2FtX3VhcGlfZHJ6czRuX3BhcmFtX3Byb3Qg
ZHJ6czRuX3IzX3BhcmFtOw0KPiArCQlzdHJ1Y3QgbXRrX2NhbV91YXBpX3RuY3NfcGFyYW1fcHJv
dCB0bmNzX3BhcmFtOw0KPiArCQkvKiBzY3JpcHQgZ2VuZXJhdGlvbiBkb25lICovDQo+ICsJCXN0
cnVjdCBtdGtfY2FtX3VhcGlfZHJ6czh0X3BhcmFtX3Byb3QgZHJ6czh0X3IxX3BhcmFtOw0KPiAr
CQlzdHJ1Y3QgbXRrX2NhbV91YXBpX2RyenM4dF9wYXJhbV9wcm90IGRyenM4dF9yMl9wYXJhbTsN
Cj4gKwkJc3RydWN0IG10a19jYW1fdWFwaV9hd2JfcGFyYW1fcHJvdCBhd2JfcGFyYW07DQo+ICsJ
CXN0cnVjdCBtdGtfY2FtX3VhcGlfYnBjX3BhcmFtX3Byb3QgYnBjX3BhcmFtOw0KPiArCQlzdHJ1
Y3QgbXRrX2NhbV91YXBpX2xzY19wYXJhbV9wcm90IGxzY19wYXJhbTsNCj4gKwkJc3RydWN0IG10
a19jYW1fdWFwaV9zbGtfcGFyYW1fcHJvdCBzbGtfcGFyYW07DQo+ICsJCXN0cnVjdCBtdGtfY2Ft
X3VhcGlfd2JfcGFyYW1fcHJvdCB3Yl9wYXJhbTsNCj4gKwkJc3RydWN0IG10a19jYW1fdWFwaV9s
dG1zX3BhcmFtX3Byb3QgbHRtc19wYXJhbTsNCj4gKwkJc3RydWN0IG10a19jYW1fdWFwaV95dXZv
X3BhcmFtX3Byb3QgeXV2b19yMl9wYXJhbTsNCj4gKwkJc3RydWN0IG10a19jYW1fdWFwaV95dXZv
X3BhcmFtX3Byb3QgeXV2b19yNF9wYXJhbTsNCj4gKwkJLyogVGhlIGZvbGxvd2luZyBtb2R1bGUg
c3R1Y3R1cmVzIGFyZSBnZW5lcmF0ZWQgYnkgc2NyaXB0ICovDQo+ICsJCXN0cnVjdCBtdGtfY2Ft
X3VhcGlfcmVnbWFwX3Jhd19icGMgYnBjX3IxOw0KPiArCQlzdHJ1Y3QgbXRrX2NhbV91YXBpX3Jl
Z21hcF9yYXdfYnBjIGJwY19yMjsNCj4gKwkJc3RydWN0IG10a19jYW1fdWFwaV9yZWdtYXBfcmF3
X2NjbSBjY21fcjE7DQo+ICsJCXN0cnVjdCBtdGtfY2FtX3VhcGlfcmVnbWFwX3Jhd19jY20gY2Nt
X3IyOw0KPiArCQlzdHJ1Y3QgbXRrX2NhbV91YXBpX3JlZ21hcF9yYXdfY2NtIGNjbV9yMzsNCj4g
KwkJc3RydWN0IG10a19jYW1fdWFwaV9yZWdtYXBfcmF3X2RtIGRtX3IxOw0KPiArCQl1OCByc3Yx
WzExNl07DQo+ICsJCXN0cnVjdCBtdGtfY2FtX3VhcGlfcmVnbWFwX3Jhd19nMmMgZzJjX3IxOw0K
PiArCQlzdHJ1Y3QgbXRrX2NhbV91YXBpX3JlZ21hcF9yYXdfZzJjIGcyY19yMjsNCj4gKwkJc3Ry
dWN0IG10a19jYW1fdWFwaV9yZWdtYXBfcmF3X2cyYyBnMmNfcjM7DQo+ICsJCXN0cnVjdCBtdGtf
Y2FtX3VhcGlfcmVnbWFwX3Jhd19nZ20gZ2dtX3IxOw0KPiArCQlzdHJ1Y3QgbXRrX2NhbV91YXBp
X3JlZ21hcF9yYXdfZ2dtIGdnbV9yMjsNCj4gKwkJc3RydWN0IG10a19jYW1fdWFwaV9yZWdtYXBf
cmF3X2dnbSBnZ21fcjM7DQo+ICsJCXU4IHJzdjJbNjhdOw0KPiArCQlzdHJ1Y3QgbXRrX2NhbV91
YXBpX3JlZ21hcF9yYXdfbHNjIGxzY19yMTsNCj4gKwkJc3RydWN0IG10a19jYW1fdWFwaV9yZWdt
YXBfcmF3X2x0bSBsdG1fcjE7DQo+ICsJCXN0cnVjdCBtdGtfY2FtX3VhcGlfcmVnbWFwX3Jhd19s
dG1zIGx0bXNfcjE7DQo+ICsJCXN0cnVjdCBtdGtfY2FtX3VhcGlfcmVnbWFwX3Jhd19vYmMgb2Jj
X3IxOw0KPiArCQlzdHJ1Y3QgbXRrX2NhbV91YXBpX3JlZ21hcF9yYXdfb2JjIG9iY19yMjsNCj4g
KwkJdTggcnN2M1sxNDIwXTsNCj4gKwkJc3RydWN0IG10a19jYW1fdWFwaV9yZWdtYXBfcmF3X3Rz
ZnMgdHNmc19yMTsNCj4gKwkJdTggcnN2NFs1MDA4MF07DQo+ICsJCS8qIHNjcmlwdCBnZW5lcmF0
aW9uIGRvbmUgKi8NCj4gKwl9IF9fcGFja2VkIHByb3Q7DQo+ICt9IF9fcGFja2VkOw0KPiArDQo=

