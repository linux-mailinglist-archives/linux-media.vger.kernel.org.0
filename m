Return-Path: <linux-media+bounces-20360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7539B21FE
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 02:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BC711F2123F
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 01:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4D813D297;
	Mon, 28 Oct 2024 01:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="go6YMPD/";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="vTk6JLDT"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477BE2AF07;
	Mon, 28 Oct 2024 01:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730078859; cv=fail; b=BD0HQHCHSduU6iSjvI5blUpPbsW5+46xN+vrChceEr0y+PUHIOTPAeSPxpcpjioMlrM108e5q9NM83oEXs3gyHvv8qNeNbtP8Gep8jKd8oIhCURN8NezA4pht9PFqBvVhJfcNxsftB9zAwg/VsAbuDacrtn9Mu0zc733wFicME0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730078859; c=relaxed/simple;
	bh=vLd5gVO9gBFX4PX7GdwcMcrKPwWbAK6DQWa38ESk9bQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZMAcNWLQEy6QuCTIf6A/r2d+X3Xy9oqxFMY93o/mAJt6grMr0LSfsD4QzUUQ3+mJiJAU1vGCzl5NRxbLkvNXPLgOr/YjEFkQXQns2qEUtLhiBGmCaW/57VItIM83LwXr8XrZOAyQqfgpcPBOZhIiTxXr+WJ4467Zuia2dTGcXG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=go6YMPD/; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=vTk6JLDT; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c8bf9bc694cb11efb88477ffae1fc7a5-20241028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=vLd5gVO9gBFX4PX7GdwcMcrKPwWbAK6DQWa38ESk9bQ=;
	b=go6YMPD//ToAx+wM0ReOq1hWJ1rS5fQfnMr2pfTY/BfFMekS49I1ELXUqRIbAO2CtLGOpZc3uwG6WXmffMtki6BKciNa6r8yRh2XGtsFsXXOxCC3ANhRqmZbVRfhgDBxRfXglWpHHO4lS/Ym8Jvm8Drwol4Txt0uvJkXIMgoHQY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:a4fa0dca-1ae0-433a-9565-d11c80fa9c3d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:b0f8e941-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c8bf9bc694cb11efb88477ffae1fc7a5-20241028
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 556575314; Mon, 28 Oct 2024 09:27:23 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Oct 2024 09:27:22 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 28 Oct 2024 09:27:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjEL5cHc/+WfXeafwuQ6RQeEzKvsWRGs3gROb3tF1JkoBfYJP1jDKrMQdg9EQeM2rQPk0dZQv2kFAqj2lahzythzgv9EzNpwDsGn//QhGnyEq4jqcOlyHyzVzHjbADEiYcH58bHmkYlcAXebqhI8uM02sv16/e8ixdBBd9vuLktYCQtV8DlCC02oymklTlVOcJotVJBCeI6Eu65xfr6wIqf+AqFDRA1APDalAu5J1zLav2VDuDFEHE+1XohOQ1D8JTaCkYBjH/3dphypDgAz451Cxqgv2d10cVYhpBW9DLvPvqtt6l8nliLOTVPSczRJK5Ihq2dFfDtKSmeQTyQbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLd5gVO9gBFX4PX7GdwcMcrKPwWbAK6DQWa38ESk9bQ=;
 b=vljiFrW38inTWpXizzjvP6hOJO5GLr6ZNmz2CKJuYgg7o+vGODgnSG0CvM97de+CS1NJo0w85YLRv1yqffmqfU9XWd+TEgDpTQOdKYPQVKgKIMV0yewpGIIIFwZGCv+pIU5+94UrtPfRt0xag8AxzlF9drMRYnTHqXO8KhwBeMdviFcHfUnC3xjGzZEAwHfl+RIGCxASuaAiZSZ4O4NopDyRpikwCUFAo8ZTYrdoC50RPsayfzVFIwmo3Z5FokB2NCaSxGPxX/EmycRgC5Y0m1hNWN8rlj+L2HdQ05VxUBnWzw6AaDxN7pJi1u1K+e80Gt2DzdUI3/Mwa06rIqfdEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLd5gVO9gBFX4PX7GdwcMcrKPwWbAK6DQWa38ESk9bQ=;
 b=vTk6JLDTMzPFd9Dr0prNBD3ZDN4y3CbM0YYV+O+sfx4XJhqe0k9KuhJA+fAT1PYTM6XLsrVxfcK+bkDiGD4PsruKPNtmr1Lx7YxuHS37behtX8KZRg5lVuyD3oHjSnrM4RdaD1t7AtstJJfIZqgak9hQ2GpIMefw729bckDgkaU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYUPR03MB7031.apcprd03.prod.outlook.com (2603:1096:400:35a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 01:27:19 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 01:27:19 +0000
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
Thread-Index: AQHbGj1K7oS5BpZAxk+Yfu5zQIUxBLKbfJSA
Date: Mon, 28 Oct 2024 01:27:19 +0000
Message-ID: <e1af452761d6e33d54f9d77bf088997fb5d13f9a.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYUPR03MB7031:EE_
x-ms-office365-filtering-correlation-id: dfdd3c41-f9cf-419c-09f4-08dcf6efaa85
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V1BYdzU1WXJXQWNMbHlaN095cG1UL3NQLzBJb0pLMThRUTJQR0NjYUw2cGV4?=
 =?utf-8?B?VHlhSTlJV0R3dmNFYVNGa3JEbVJHSGlDL3VnL1pYUk9BVGRLY2hyWnZoQnh0?=
 =?utf-8?B?dzd5akZpMngvL3k2Z0ZPVkIwQ01rRitKcmViSE5UTFV3aVFiNjZYbFJiaks4?=
 =?utf-8?B?OFEzM1NxMkJIUTN3M29Ud0lOMm1iaGJ1R3p2WUF6Sm9QSUxBRmJSalQwTTZz?=
 =?utf-8?B?bWNOZ3owWTRjMG5QbDdDWFE5MlQzQkkyQjJnN0lUNDNZUG0wRG1qend0V3RS?=
 =?utf-8?B?UkNleG9mNGw2YzljMUhDNlFUTnNvczNmdVlvem1KQzB2VHhSdFhTK29DU3Zr?=
 =?utf-8?B?TGVxdzUxQ0lmZkZnd0JWdkxubngzZGx1TzcvUTJyek9RSTJtVE45eE9vMjg3?=
 =?utf-8?B?YkhDN0dpUk9EN29GUWpSbFdlaFhYZ3MyR21sdzJzT1pZcGdmbnpyNzk5QVlw?=
 =?utf-8?B?bWNIUDRRTmhKcmFFNjlEYldBWnhNajg5T0dzYXYyZG5VUHUxNWdrYU1UaHN1?=
 =?utf-8?B?NkhabVk1dVJlSldpVDdHTW1WQUo5cVhiTTlWd1lVbGdERHNIV1Q1NmVTWHQ3?=
 =?utf-8?B?OHBKRUxRcVc4NldQTFdodFdFTzA0NmVTUXFiL1JGSzhjaDByNmR0NjQ1dnVY?=
 =?utf-8?B?ZUlna0FLa0RlVktzbkVHVkhOdS9jeGl1WUd4MlJhTUsvamN5ZHYySWs0Mmsx?=
 =?utf-8?B?U1dXU1RBZkwxYlBZUVpVL050bnl6V3JoUWc4OE94OUxJVmtwUFYrcSswZWY2?=
 =?utf-8?B?ZUJQbDRVM2ZkSU01WFZKMUNnV01weEN2Vjh0Y0M2SXJvWFViczBndHhQVyt6?=
 =?utf-8?B?c1ZaWG9BbDVqbmsxOC9BS0E0ZnBybTcvZGU1bzVaVEhUbGg1Y0NZWGJoMm8z?=
 =?utf-8?B?R1JlczVDOCtkcXRtUHprSEk0Rnl6VEF2Zmg5MC9VclpHMldyVmNjNDYwUVpB?=
 =?utf-8?B?NnlrQVZQcHF2bGVaUlAxYi9WVEpNZEhET1U5N3ZKZVM4MjBXSS9XL1Raa01h?=
 =?utf-8?B?eUpKUnpFL0Y4aEFXR25XQjlzdkQ1cnh5a0Y2VDRkUDg4M2JYREhTWGJnU09P?=
 =?utf-8?B?ZHZPUHRUM1VWR1MxN0VJVE5YdThYWk9mOE0xZGZEZEkvNHcwcm9WSDVJaTVW?=
 =?utf-8?B?VHZYcG9tNTJzZTFXY3V4RUIwV2Y1OEFyVUFNY3ZiR2JrUkFQcStsTjdFTEpB?=
 =?utf-8?B?Ly9FU3MrQ3k3ZUJ1ajk4a09qZW82ZGRVcHc3ZFFYakV5YXh1MUJHWTdGVmlh?=
 =?utf-8?B?bmNMaFJBeDhXWkhUQysvYm9IbjBwbEpSSUVTbVRMQW5qWVBMa0ZNVTZ3RU5K?=
 =?utf-8?B?eDZJUitXcnRzNG1ka0MzRndZSTR4Vi9EMUlIMUpnUlpiRndrdS9KL21zcHVp?=
 =?utf-8?B?ZVVHcDVhRXhXWlZCRmcvR3dIa09RMU9rY0pPd2xZQno2eUVWQTR3RzhmV1h3?=
 =?utf-8?B?Y3o0ZlNTa3YwSE9zTUR1VFhTVDJCcFA1RzduYTBEemFpZzhZbmdqK2pXdnRQ?=
 =?utf-8?B?MWNRVVNQSDZnK3owQzYxd082TDVPNWVta0lLU3VrSzl3WkM2dEFyM3YwZzVC?=
 =?utf-8?B?bTRNVU5FcjAyNnRqM21HSStIT083YUVDOHJHZnNjbDNoQUZjbUU4MmJIeEJv?=
 =?utf-8?B?YlgvWDZ5dlRpRkd1cVRjR2hVbk56N2Jpc3VwNWRiZnUrMGRMQkIrKzBQSDVT?=
 =?utf-8?B?Q01saktFcHN2WFZReTQwWEFvUXZYS1JVS240SC90aEFuWlhMK0xJVDlRc1ZL?=
 =?utf-8?B?K1ZEdHh0bm84THduQ05saUQzVDFmbUdUMUl4Z3A5bzBEcW1oU01lUUEyUXRo?=
 =?utf-8?Q?hE43V14IIvqJPYva3afMvYXO03wMt05nYDSag=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mi8vdWNYT3RldlRGYWM2NmgzcXdETjgrOHZDWjB6aGlZcXhFUWRWNDhTWjVI?=
 =?utf-8?B?Z2tnWjNTTVk0SDg5S2luN3djVHNpb2FnTHg0ZlBuQ1hHZkJnT2xGb0VpYWI2?=
 =?utf-8?B?d3RVRW5VVGJMMUhoQVNzeHVXSGlpQXVmM2JpWm1RMWpoYy9VcmJPY1NibWZ2?=
 =?utf-8?B?Q2VxOFVpMFhWakRlTmtIQWU0eURUUkZMdnpSV1ptdG9SQ1ZJNlhvTERPT2N3?=
 =?utf-8?B?eHVIc0hUNGJpdHN2Ni9RYUtsd3diMGh6R21obG1QVjhhL3huckFYS3d0RE1W?=
 =?utf-8?B?VXRVNVQ2K2hZcVRmUEx1R0VDR3NBOWNVd1JPSVhoVUFWVUlmV3pYR0loN2FQ?=
 =?utf-8?B?b1p3TnhVdW9LQ2t4ajgrenRxL0hJakljakRCdlZYM1k1MC8ycUtUQ0Y1R1Zk?=
 =?utf-8?B?OUJrcTdQTWZzVUZzbHE1VXEzZkdIdjk0U08vUno3aE9TNkZtNDJWVGFZSkdK?=
 =?utf-8?B?MFU0VXN4LzIxTkw4eStYTFNGYXRTb3ZOTnRvOHprUWh6enhXN1RyZ3lUbVE2?=
 =?utf-8?B?VUF4eFp5NW5RbFFDd1JaQzhaRXlnU0VCcFc5Z3JOVnprQ2ZzUmczWlpCWlhh?=
 =?utf-8?B?Z1R5d2lyakRQOTdIRG1RbGFtSHRxcTZlTVZoTm5EV05WR1VjTk9KSXRRUGI3?=
 =?utf-8?B?VG94RnpTQVFLRDU5OGtWYjVXZFlncFdLc3pUNnBFc1pGZmwrdzJ4KzdxaGJw?=
 =?utf-8?B?QlJZYm5nU01HK1JlaG5LdHFwNW5BSXJVRXlnZ2hrdWhNZkFyZTVmTzFvK21l?=
 =?utf-8?B?cGtNb250SHF1MkVGL1dIQ2hMSzU1VHBIOWZkK1hreURDRHFZQ2xJelpJMDNk?=
 =?utf-8?B?NmRUUWpNQ2FjcERVb2l2NG9mbDdjenlla3AyNkduMlhLampIOGFlL1hwc3po?=
 =?utf-8?B?TVBUb0xScnExcDNzWkFoM3VzV3A0TngrYkR2R3ptcmZWUGR4TVFuZXY2dE1T?=
 =?utf-8?B?akJXWGxCZkozQVllRVljais4QTJPUHNnN0JWelNITEt6RS9IVFErTFc3RDYx?=
 =?utf-8?B?RnYxK0hJZ0JFQW8vWGZzaWNYb3FoZzJrcmNPYXRWTjhsUUhFSHNDTDRwODk1?=
 =?utf-8?B?RDlUZGtneHVQdXBKY044aGdwNy9relQ3Wk4ybm5zbnVOV1UvVVNxOVZOaVVj?=
 =?utf-8?B?U0RVbUJMVlJSaDFIcjBjTHlXcjQ2WTFyYzhNb2ppMTVYU0dTSjM5Snlkck80?=
 =?utf-8?B?cUI3Vm8vaVpsdCt3V0xic3JscHBRMlU3dldSaTRqRS8rNHNXMlljNzZKeFQ4?=
 =?utf-8?B?Q2xUU1BWWHIxdFhLVW9JR24rOWwzMDFGL2N0bFpubGROcUR6N3ZTeHdMWTBP?=
 =?utf-8?B?MGlGaUJERnpYZWs4RE43T0d4K1V1VmptL3BkZ1JBaGpkaGt4UlNWd08wTVF2?=
 =?utf-8?B?UThhL05QOTVjd0JNZlZCMm5ucG1KNWxmN3h2R0hKR3NDd25ONndRb3FSempq?=
 =?utf-8?B?MFJSbWhLcGYxZHZMNmg1VVhtWlpDNHJTZXRzbzBKcTkrMVJmVWZIWXdmc1Rz?=
 =?utf-8?B?RzFZd09McDNFZnhOWmVqUUh6N28ybWJFSGV4TTd5WG5mZjg2TEVzZzkyQm5v?=
 =?utf-8?B?SU1DeUhOa3Q3bjR5eFBLVVN3N2E5TndrTEUzaFl5bEI3QXVXWWFpRjVjV2Vu?=
 =?utf-8?B?cG9aYnRlbDIvZ09OVzEzc3crbm5xY3NEcXRHM1czQnFWZ3A1aS9tUWVXMjhN?=
 =?utf-8?B?eUZVd1krdFZHVHNPaVROUWVXZmk3UDRLV2J1d0Q1KysvR3lUdWY0ZllyQkRT?=
 =?utf-8?B?ZU1kaUFoUklJL1JBelZCZytzbHFuNXZMZEJpRFB4SlU1c3UreG9lWHNxM0NO?=
 =?utf-8?B?L2VrZTFJd0ZLR0xXRkRCMHlOZWdJdHZPeVNVOUJ2RzczTys0MFhnUXdlNlFp?=
 =?utf-8?B?Z0tJVDRkVzE2UDI4OGMxNWxSL0EyRTlvejZONGZJWVBhdGdjcGV5UlBFOHNw?=
 =?utf-8?B?K2tpZm5CVEttbGlMR2F5WW43cnBNUWFUZlhxekUyRC90U2ZpOVplc3Q1emJZ?=
 =?utf-8?B?N25DZC8xdm5TaVB5amlPZFZqeWJUdmFDVTZaT2YvdmpZUjJEQUd1K1VpYWYv?=
 =?utf-8?B?dHVzTTVDR3U1Q1pNRUVESndGQjc1Ly9BWE9EMzMwOVdkb252S25OTzVKcWVp?=
 =?utf-8?Q?8DwizWpN8hI9NsWkA+50aK8yH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <919F22995986C6409FCCB9BEF66F61E6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdd3c41-f9cf-419c-09f4-08dcf6efaa85
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 01:27:19.7703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+mAB7kjkJkRD82an6H4McnfdCoVD9UNcjtd0GeoIMuDCPHAMtcTWDahP++hHkLUxONEQrgZbsUb9h6IHqH5Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7031

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBkcml2ZXIgb2YgdGhlIE1lZGlh
VGVrIFNlbnNvciBJbnRlcmZhY2UsDQo+IGZvY3VzaW5nIG9uIGludGVncmF0aW9uIHdpdGggdGhl
IE1lZGlhVGVrIElTUCBDQU1TWVMuIFRoZQ0KPiBzZW5pbmYgZGV2aWNlIGJyaWRnZXMgY2FtZXJh
IHNlbnNvcnMgYW5kIHRoZSBJU1Agc3lzdGVtLA0KPiBwcm92aWRpbmcgbWFuYWdlbWVudCBmb3Ig
c2Vuc29yIGRhdGEgcm91dGluZyBhbmQgcHJvY2Vzc2luZy4NCj4gS2V5IGZlYXR1cmVzIGluY2x1
ZGUgVjRMMiBmcmFtZXdvcmsgY29udHJvbCwgYW5kIGR5bmFtaWMNCj4gaGFuZGxpbmcgb2Ygc3Ry
ZWFtIGNvbmZpZ3VyYXRpb25zIGFuZCB2aXJ0dWFsIGNoYW5uZWxzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCg0KW3NuaXBdDQoNCj4gKw0KPiArZW51bSB7DQo+ICsJQ0xLX0NBTV9TRU5JTkYgPSAwLA0K
DQpDTEtfQ0FNX1NFTklORiBpcyB1c2VsZXNzLCBzbyBkcm9wIGl0Lg0KDQpSZWdhcmRzLA0KQ0sN
Cg0KPiArCUNMS19UT1BfU0VOSU5GLA0KPiArCUNMS19UT1BfU0VOSU5GMSwNCj4gKwlDTEtfVE9Q
X1NFTklORjIsDQo+ICsJQ0xLX1RPUF9TRU5JTkYzLA0KPiArCUNMS19UT1BfU0VOSU5GNCwNCj4g
KwlDTEtfVE9QX1NFTklORjUsDQo+ICsJQ0xLX1RPUF9TRU5JTkZfRU5ELA0KPiArCUNMS19UT1Bf
Q0FNVE0gPSBDTEtfVE9QX1NFTklORl9FTkQsDQo+ICsJQ0xLX01BWENOVCwNCj4gK307DQo+ICsN
Cg==

