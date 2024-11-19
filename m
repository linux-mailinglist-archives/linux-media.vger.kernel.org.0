Return-Path: <linux-media+bounces-21580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3449D229E
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 10:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DE801F223F7
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 09:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6831C1F19;
	Tue, 19 Nov 2024 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i3sXnuDJ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rhM2F505"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D57F1B654E;
	Tue, 19 Nov 2024 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732009319; cv=fail; b=peulI0eohz0YlThkUr2g6wKyZjACoFSV7Wj1ERnVku9Y+0BaoxWzEw9j+La62VoQeK7ZUYOw6lOhifPtUOfNWeI71IQLQpjYJG/RxC6X3ReXnE4MvdssPt4a6Of6x0hV4+ov/LNTL3Ok+qzSQT7AcmydlfF+LCm5+Plb9us6Me8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732009319; c=relaxed/simple;
	bh=u26JHREiuNmiVjR1cdd3xD3JO5XsaXwN1NM6TQYRDvo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TqbwCIE01mODlHhbKl3etz6NdUzFPMfq4PiVDm+ah0UDFIF1KRS+emUbr0i5vRTk2xyYEF0SDUxJCtXT7uQ68J6YvCmHXz5U0+hOAoCy3LZKFfy1iody7+7O7pXbs5OPx7nbCuUZ/sDJL+2l/82uJzqs4eq4G0LQsnyNHep4TV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=i3sXnuDJ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=rhM2F505; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 82a3f61ea65a11ef99858b75a2457dd9-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=u26JHREiuNmiVjR1cdd3xD3JO5XsaXwN1NM6TQYRDvo=;
	b=i3sXnuDJbmaWKCukDr5VwcG2X5bKav72nc8Cd+Qrzgy7F7pb6CzbNJxsZmu8jqucsvr5aduszxaBLjm8cnVuOhmdh3BzSB+ezN/gM6x01x8231+uhCILlhs7YGafyTl3D/tGKCnYQurgaYKRYMEZABvgMoun9OB1rlOYQOou558=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:9da14167-0643-4066-a406-14af08fb70a3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:c5875207-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 82a3f61ea65a11ef99858b75a2457dd9-20241119
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1128441113; Tue, 19 Nov 2024 17:41:54 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Nov 2024 01:41:53 -0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Nov 2024 17:41:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyY4TOZg3/cFHoFFYcuJRdaiQ6vpvJFMDnxdiqTX28/qxtic353Q5baCnGewkkkXKx6CS6rDLELVzybtlMQLtz6q4R6katlKkvPwBWwcjiNS1KasdFYyXLLs+KcwYcSpNdZoTk1XnkK+wYxvtnJ2fsQaz/NsKq+h0agDK3ihII2hMN2QOB0yOVFzNLlc4p8FPtAUZ91vLRrexlUir8A9S+/hyzrLDaH+BTLs8l2f32+raaxsVaG7va+3UorHDlgLLl5JfNOvo1jyBw4ba+xwHUbwedkQyz74BU7vt/aArFip63vwM+z8KBM7vxxIkpp+t6GzWKq9MCXcq0cNZypw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u26JHREiuNmiVjR1cdd3xD3JO5XsaXwN1NM6TQYRDvo=;
 b=G2VYQ/9UQd9edg6Sec+s76J34cMWWeY4rhSHGufI1tcOQZq9SN1einkxHTaFzV/Qprzb7Ja1018q4/UF1bhqgXKDSXF90ypo7j+E0PBHj4CJwG1595G2drsiT6tdyV+wclsVc4aHBAy17ZFKuVa+Plhnb7bRApThdXF3m2dUyTKdDGRsGwYNJaHu0QrKtJq2OzQKbfjV2EBjI2tSMMXEeJUJPht83F0DS+hUb7mlK1LppGXp42QiRf6BFf+Txd+afCMQQNA1+DlzbBYqkLlMdEwd1i11/FiGE69gt/MB0DCD78uxcYvwaSAxIUrRDIxMtEWA6LtlOTAh29+HLinHHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u26JHREiuNmiVjR1cdd3xD3JO5XsaXwN1NM6TQYRDvo=;
 b=rhM2F505UsVzT4FEqpUCqd+/sId6Bv4WA9yeyjfCqHZ1bGkBMsRDtoTpekfY6+aSmjV4NinDrvyvz5NV4g9LPhykPRu5laOZFDnopTnulPWiLHn2E+mdHqNrEvxV/lQ7e0z55bQ8NYmkZEpVy62ucwYQwzrq97PzWDlvUhw0HrE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7371.apcprd03.prod.outlook.com (2603:1096:400:40e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 09:41:50 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 09:41:50 +0000
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
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbK+mgeA
Date: Tue, 19 Nov 2024 09:41:50 +0000
Message-ID: <5710223ad680825400e17e2d9ff1b182f1cdd76e.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7371:EE_
x-ms-office365-filtering-correlation-id: a32f96e1-53bb-4722-53be-08dd087e647d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VUJBQ2hHZDNTelZlYXlRb2tiUHVPMEF6eUhIeDdJSkd2OEE4ZmRLdVdHMHhy?=
 =?utf-8?B?UnoreEdxV2h0V1FaQVFBajhEODREUmpITCtBc05acXl4UnY1SWlMOXZhN1F5?=
 =?utf-8?B?R3FrT0VLcmwwakRGczBBZFpGOHRDZVBZVnZHaUZNUFd4cWdjdE9oZjd3Yndn?=
 =?utf-8?B?dzJuKzIwTFR0MlNrT2tjV1JsZ1ZBRVVpWVpyYjBaY3lHRFIrOU54b1phUHBP?=
 =?utf-8?B?ak56dUJCeDNGRlFCWGFJN0pRL0ZTSkJDb0xINWljNWp4KzYvNExNMmNIQ2pi?=
 =?utf-8?B?VFdoRUh0YmNKNDh3ejdzVmRwTVJPS3hIVzU2aTdLVTRVQ2krYUFzYjhOR2ta?=
 =?utf-8?B?YzFNQWxMVmc4K1kxS2ZiLzRiUEd4R0NOaWMwamZXdndIY0JQRExKdGI3S1RC?=
 =?utf-8?B?czgraXBIMm9sLzJVWSs4bDYrVW00MXpudWtHbjUybVYzUmZZelduT0hmV2xx?=
 =?utf-8?B?enFqRkY1WHRMMnZraXZKYU1xa1I0eFF1QW5wU05OZGQzeXhHUXFLRnd6SUlJ?=
 =?utf-8?B?VUxMTWptaW1icngzeEdPdno4MHpvbUhlK01Ddy9JZi9jQ0hOVFU5TzlHVXNU?=
 =?utf-8?B?VWp3aUVtOG5sNTJZYXhZSXdjMXoySnQvaG81d1BVZkRURFZEb3hkaHhLNmVY?=
 =?utf-8?B?WVhDUkE3RmF3SzBKWVFheUNLdW90QisyVWNFcVMxSXFJZnhDMXBHZVJIOTN4?=
 =?utf-8?B?RmMxVGxYbUtmU2Q4eU5DZVFvMDdDdkJuVTIxd2ZsS0lvNjMxMmVkNGthRHRm?=
 =?utf-8?B?R3lJZ2JuRlJiWHJNSEJWMHRCOFVYRit6RjZaQ214WWxKNzJkMXR1SVN3c2FM?=
 =?utf-8?B?eTBQQWJrd3g2c1EyZzk3dVZBcmdSR1UwYUp2M0lDeURYZEIzMFZwRS82VGxS?=
 =?utf-8?B?RGZPdzJWeU1MelpRTUFEamg0V0NTOUNxZktvM1V1aldWNTl2c1FQN2kzYkFF?=
 =?utf-8?B?T1djbDhWOVlIUFVoUmI2TmZvOHZnTEQ5eXdybFJBOHlaWHFqc3lPeFl4QVJz?=
 =?utf-8?B?L3BXOHZGVU01VkxvbE9PR0RONThPaDhESHVSenZHeHl6T05BN2tnRTBlR0Iv?=
 =?utf-8?B?ZG5CdXBoRklNSk9CYTZkaEdRUW1TaEdLRGtycFlvcHdHRHptK0Rta2F4a2Q2?=
 =?utf-8?B?OEZ5SHplY0ljRTZHM1lUM1VzajZJMXB0Wm80MmpadGVLRWRiVkJzeWpSVmkx?=
 =?utf-8?B?ZytneDM1dXNLNUhwb1J6RjFRdnFNekRSUHR6eForc1MwMHpid29ndjh0M2Fx?=
 =?utf-8?B?Sk1maTVDSkdjRHd3bjAzVFRROWUvYVJuWG5pTENYQit1bG9sS0locm03MmIz?=
 =?utf-8?B?b0xIZXF2RjI2SXBIUVpmd3hvZFhYMjVCNDYwTHdhYlFURHlGaVJlTTc0RkZi?=
 =?utf-8?B?SUR0aURDZndidTFZdnI4c29ZMzduZ0JsYXp4d3l2SHFKU2ZKbU9HbCttRDRv?=
 =?utf-8?B?MjdYeG1rQTVqRFk1ZlRCMXVHeGVzMUhML3owTjVaWTFNUGRDVXdwWlc0TVNX?=
 =?utf-8?B?Z1pzZU80eEtscUY4d2p4TWRCUTYxZE43cTNGdUg2djlIRlIxUUVEODM0OVZ0?=
 =?utf-8?B?NEU0dXFnUnA2d2J3c0NQRXJUVldXbWdzWEU5YWpPYUxzcDA4YTNKRHRMVWtG?=
 =?utf-8?B?NWZxcW1DeDBHNUNVbk52VWw1Q1B0ak9wMGVaVDNET1A3Qkt3SnVUeUFHT3ZU?=
 =?utf-8?B?Y2JhVVZ4ekNFazMxUCtmdEN6cGswSkwxMXdOeGlOMTJ1NVkrZWZON2NyQUxT?=
 =?utf-8?B?SnUxMDBGTVA5Ym8yMzdQTHBPclRBbHlRc1hJOHVmOWxVREpjc2tYNVZ5aXRV?=
 =?utf-8?Q?nfSFHA44LxbYOTKLfx0sLOTsPpYwdmyFwqx1I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHQxNnlMNXl1NS81RDdWQm1DaWQvdTl1N1UyL1dJR1ZDRWU0blh1aE8xdlZL?=
 =?utf-8?B?UXZLMjJrY0Y3S3lpdXd5dEdjeUl5cUhKcWhsMXE5clVwYzh6NTRlZzhkdTA5?=
 =?utf-8?B?VWRJdGM2VjBwcFdGaHF4cUJFOVlyd1M3cGJWNkJyMkxyaHpHZEpkTkx3aHMw?=
 =?utf-8?B?Q1NjSlhRbFBMTVJmM0NkMkhHMWgzbzh0ZzhSay8wZGdkemdnL1ZnSUpnUzY4?=
 =?utf-8?B?MFpKY2xnSWQrM0NNU1JhYmZuQXpLK0xTTDBJVWJEREVSNXZ3Z1FBZXVBOUU1?=
 =?utf-8?B?dWpTSTRFTS9PY0pwdlI5NDdmR09BdEhtWjBQZmppVTVxSU4xRTI0ZkNpaEl2?=
 =?utf-8?B?bWt0azVvZVg1Nzl4aXFtaHNBY3FTbkhxTG1vUTBTQ245NVR4UHVNWUZYOWll?=
 =?utf-8?B?eS9SWC91K3VXOUJaaUpDVkhjMlFjU2syT2NuSEplU3pGRm50WHdNSDJLOEll?=
 =?utf-8?B?WTVUcWZ5TkFxSk9zYnRrd1padXB5TnROcXZac0tXK0pYM25pdVVFSVFicGhJ?=
 =?utf-8?B?TjJueERMeFpmZW1TTkZLUVhTeCtGZnpTSENSVGtwZ1ExSzB4akRZRzNYeHNB?=
 =?utf-8?B?b1A3M1BFYzdYR2JWZFRXTHZLbzJEWUQ2WkRWeVdXR21JTWN4bVRteVRmYUFN?=
 =?utf-8?B?ZHhUdXZrb0xZMVMyWXlYK2RXMkIvc3Fva0Z2VE1ha29WVlFzR2dCVng1bHBa?=
 =?utf-8?B?Y1U5bktuZVVtOGE5V1BuR2ZDWlhXVjFSV3ZNTm81UkxJTnZjT2h5YXNDSUNS?=
 =?utf-8?B?VjJmVWxvd1IzNGFLbURnRU5wWUZLMWJVbHZNcHovWms3anhUZ1pqMEN3bmYr?=
 =?utf-8?B?eUs1WXlObEVsNWRsRGtJY2xTc3l2S2dqdE56b3hEcVRPY01MeW5JSVk4a0FI?=
 =?utf-8?B?ekRRcE1ETVR3MnUvUmVDTUUxVmdIdDVmcXVOZ2RaWmdXaE9QcWRIQkJyc2Jz?=
 =?utf-8?B?NWQrcjNUeXlhcmhVcEI5Z2dhOHpVWmx6cTZsUTBNU1hST0JIalRJb3F0OFNy?=
 =?utf-8?B?Q1ZKc3M1UUlQdyt6cm1Jak04cTZBZnVNMjhLUERlVFh1UEM3TlU3K3gxcGI5?=
 =?utf-8?B?VWlmYXEwSEhvVFo0YTJnUlVEdVg3U1JmL3JDT3FhOFFEVkw4a1oybkRzNC9z?=
 =?utf-8?B?dXRCaDdPM2ZSUjdQRUYwZU5XZ3BKRzBFMmRwNjNDK05YV0c0eUgrc1Vuc2ln?=
 =?utf-8?B?dXNQTTdxOWxSSCtZM3lGZjUvRDBXZDRGZTd0anhJNWxBTnBwQ0tTRFRVZmhw?=
 =?utf-8?B?cWhFMTJhRTlLS2dDMkczaHExOXJjd3h3TWJZSTM4MWsxd3lhWXZnY3VxaWtB?=
 =?utf-8?B?aHF1NXBWcndndkhsVkpLSVd1bHcxM1A3NXZVcUl6K3VNYUNoYjI0RGZPWFVz?=
 =?utf-8?B?K09xSHpHaEdMNC83SVo0d3FIZEpSZkJRUE1aK3pGYmQ3ZE5QSTIzT3RVL3pj?=
 =?utf-8?B?d2YyNmRYTEhJTXhFOFpqamxrU0tnVWo4b21Qd3FKVlI0MkFmbmZBcDdRV1Mw?=
 =?utf-8?B?eThja3FDWk43Rmc1UEZDQWQ5dUxkMHgxMEdDMVBTYWtRN1NIRDNFYjRNZGlk?=
 =?utf-8?B?Y3AvSllzSkZoZHNJNW9IQVpTVXRnS29nKzI0UllXYlRpVFJoQmVLRzNLcHBy?=
 =?utf-8?B?L2ZjanVMckNRQnZ2Z0QzcmVFL3F4R2k1aGNFaFdrd2NTZ2xPRmFZeWZJVE13?=
 =?utf-8?B?OHNOZ0FRNHBNaE1CdERhWDhhMGNkOW9HMnczcHRxZHQ1MDZoL3IzaS9ReWlk?=
 =?utf-8?B?bEJmNTJpNjlhdFkvZU5LRFB0eGE2NWZ0S0JWdEpQTDF6c0lsTmpqY2t1eDBX?=
 =?utf-8?B?NlJrcUNBbGJtb2JpQzFqbnpqRjY4VU9haTJHaXU2RlVGN3RaczJtbzVyenZj?=
 =?utf-8?B?bDNLK2NrNUt1SDQ5ZWJjeWVBWWhzN0J3bVZqdUhCYVhzTXU5SVRzVjlsWjRy?=
 =?utf-8?B?SlNMbHhmQVlCdDQyMVF2SjNGbmtZcUk0UlZHbXJWMVZJdUp5RG4zR0R2MmV3?=
 =?utf-8?B?aFpSNlNJVHBzZW5mRkVYV0J4b2wxM1NPK0o3anFaVWNYeUdOUFRvZUpHdXpl?=
 =?utf-8?B?TmVlNzhoU1k1bU9hSnoweFlKOFdGZW52bTlxc3JtQS9TZmpGVWpWUEJ3UGNv?=
 =?utf-8?Q?aTNZ6kFee5H7QASuWoY3htXzX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50EC807FE106374B879129AC4D037977@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32f96e1-53bb-4722-53be-08dd087e647d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 09:41:50.0729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aub3khnWSGOERJ+rdaeIRi/d22nQLB5sILB+IUw/kq+18o9HLO3gEPGJHZ95JAT8/BQjCMKZgQpU1DHp09pu5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7371

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
DQo+ICsgKiBUaGUgSVBJIGNvbW1hbmQgZW51bWVyYXRpb24uDQo+ICsgKi8NCj4gK2VudW0gbXRr
Y2FtX2lwaV9jbWRzIHsNCj4gKwkvKiByZXF1ZXN0IGZvciBhIG5ldyBzdHJlYW1pbmc6IG10a2Nh
bV9pcGlfc2Vzc2lvbl9wYXJhbSAqLw0KPiArCUNBTV9DTURfQ1JFQVRFX1NFU1NJT04sDQo+ICsJ
LyogY29uZmlnIHRoZSBzdHJlYW06IG10a2NhbV9pcGlfY29uZmlnX3BhcmFtICovDQo+ICsJQ0FN
X0NNRF9DT05GSUcsDQo+ICsJLyogcGVyLWZyYW1lOiBtdGtjYW1faXBpX2ZyYW1lX3BhcmFtICov
DQo+ICsJQ0FNX0NNRF9GUkFNRSwNCj4gKwkvKiByZWxlYXNlIGNlcnRhaW4gc3RyZWFtaW5nOiBt
dGtjYW1faXBpX3Nlc3Npb25fcGFyYW0gKi8NCj4gKwlDQU1fQ01EX0RFU1RST1lfU0VTU0lPTiwN
Cj4gKwkvKiBhY2s6IG10a2NhbV9pcGlfYWNrX2luZm8gKi8NCj4gKwlDQU1fQ01EX0FDSywNCj4g
KwlDQU1fQ01EX1JFU0VSVkVELA0KDQpJdCdzIG5vdCBuZWNlc3NhcnkgdG8gaGF2ZSBDQU1fQ01E
X1JFU0VSVkVELiBEcm9wIGl0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArfTsNCj4gKw0KDQo=

