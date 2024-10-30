Return-Path: <linux-media+bounces-20558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4BA9B5B6D
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 06:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D178281C28
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 05:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924FC1CF5F6;
	Wed, 30 Oct 2024 05:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k+sPRHea";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Hup1nZYC"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262E0374F1;
	Wed, 30 Oct 2024 05:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730266993; cv=fail; b=tN6hDLa0e5MWcV327HlN5N4XzlRRvbc00wIdZnXZDKmVUjHU1xJPlhLKBoaTPDbw2Ul0LMLFUw+IoLjZfWI6p3uGb82UUX83e0WjL5poaBFTRXPiZ6ouDLiTv5SJRqemECFn6yvzcqFY+N5xloq16f3pmRB3Qp8ifzmkGaK2078=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730266993; c=relaxed/simple;
	bh=6ZwBWGs8FzPz6ufZjymLQQpa/8fqC7BbFZ70MtOr3zo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lcLHr2lutINJ+SCvbj0DFKIWb+THPKXRi7k+MbQWV0IVwLhcL591ovv13yqgmZF+v9s6JoBIxzt4M/JNRUooMNiqqMamgnAeTwKxGBxKHI2tYYNJZR/odkblsMG5JOxqfc3eysJlOghcNR613lwX0nUKUtwjhs/0+PGf0mw5hP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=k+sPRHea; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Hup1nZYC; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d65e923e968111efb88477ffae1fc7a5-20241030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6ZwBWGs8FzPz6ufZjymLQQpa/8fqC7BbFZ70MtOr3zo=;
	b=k+sPRHeaCYrLfH2LhKLJiak9pfxQhCcZ2JAINEf/pTvlvQJY7rsounD0L0GwGOxOE2DiH33fQcG1IaY+6IkV6OIJSMxGYg6CxFYuYeIOZ4ElSktrglpG5hNfSxeL0Rqq4MpJr+LPEn6/Uf+XFoTL6m9LQ/DsRnA1RPgfv7hUWvI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:7ea19208-35cf-4f25-83ea-eb96cbe98a7b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:502e46e7-cb6b-4a59-bfa3-98f245b4912e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d65e923e968111efb88477ffae1fc7a5-20241030
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 167237554; Wed, 30 Oct 2024 13:43:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 29 Oct 2024 22:43:05 -0700
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Oct 2024 13:43:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhGFaK92b1VUR3k+Hyu1BHRGgv7KzzDQPaDE7f7BPaJ9s//Kq1KQoA2XsZvXaxanR/VC7m8kKvlTSnoq5JZoIuSL4enaafF+sy8uVRIC3cNki/GuqkHuP48YzD9ziJxxWlcl39ucV26ChOWBFkSs5Sn0iD4hWaVz/YuUeEEd2syyVk8ZY6rdB8/znLfQWUwUstlXzKgH3XGrgqGARfKVF5mrIIiF9PWuqUPXw5CUqsMcRLoZQQT3zgHsUvoN1kCBfuK+t7RR50UOJUJowYS+95bpdfNPQKwywWh6hX54SiBoOlFU7g003jHA+W+Q9mumiLU/lZyZ2cWZnkZavk6r7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZwBWGs8FzPz6ufZjymLQQpa/8fqC7BbFZ70MtOr3zo=;
 b=J222J3ej5DhXrNNIw7CHYE+xVbJtP8pH10CXiR3+Zoqa+Jo0LU4JngMXGvQ0b6A4Ls3tZpDIGComKc9H03Meu8dGeDyTCCWZbipxwJNpl0yz7+FeEXvBbf2FUvmcpj9xZDy4MQmz3rgEdHD0UvVuWYjAP08JPtmF7IA8xVaWUI5d3FTLZ/qtdCQeTasQlo2WmPWZLAysg5Zo2BGrtFifONdtwkrSLqmXNVUaJLa9LOu3O8SsIh1nMbYvPjoR7ozxmq9RJcIJwIY+YBC544MFcZXrnxBqoExPF7OqbU2hoROq4gvbXmZ2G9o6+ANvvWIxSBScZe0SDVEQeSWB8imNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZwBWGs8FzPz6ufZjymLQQpa/8fqC7BbFZ70MtOr3zo=;
 b=Hup1nZYCWfp5WxHmQ8UyhQBGbDU5h/MycVOM6My1vzeifjFfuLdl9c7/e9gfwgpjiGNIbl52qQzI6UYr9KoEwNVIxzLLYY7xGgwsk/Rv93+/0+3vKf6mt+CExZ4rMM6u2nq0PXSPz0ANwmXqBY1qTLbklsPKbciFEskXuV7A3lo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7064.apcprd03.prod.outlook.com (2603:1096:301:11f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 05:43:01 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Wed, 30 Oct 2024
 05:43:01 +0000
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
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarKe6K0A
Date: Wed, 30 Oct 2024 05:43:01 +0000
Message-ID: <3eabad2974c715ce7182c1d4b1181d532122e427.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7064:EE_
x-ms-office365-filtering-correlation-id: e2424ffa-b671-4351-7386-08dcf8a5b7b2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N01CUkQ4UFEraER2YXVyMFBSR1BaZjVvMU1IMnRxZzkzVXNZZ1BJbndsNS9o?=
 =?utf-8?B?bjdJb3hINmUvK1prR2ZVcnVmOFgrWVllWm1NM1FDbjRldGxmL0ZxK2tGV1Fs?=
 =?utf-8?B?aUp4VzVpZzd6M29yQk9odWZITVN2WFpmMVJTQmo0cUtmb0pWRVM5MDBxd3Bz?=
 =?utf-8?B?RlJBNUxWeEdrTDBCZjZUZXBlSkRyWlJGMXRCMHdDWVlKWHJkU2NvUW5BVmw3?=
 =?utf-8?B?MkJFT0JkYnoxUHpnN01WZzFDQWh0byt4dWJmVDZhMjNCejc1VUdwVWpNdlJR?=
 =?utf-8?B?NEZucCtwVDdxY3JCOUg3N0VhQ2lkMGNPR0VRdVlpSUtGWU8vbXhiU0hlOFV1?=
 =?utf-8?B?ckxEWklSdmRUUElaMVlVS2JtNWJkME0vQnlyM2NGUFJXMHNEcGZjWDB0ckZJ?=
 =?utf-8?B?Vk42SnorVDlSbUpPLzhMcWpnQk5WQVduYXhPVEpWWDRkdlEvejVVN3lTNlVo?=
 =?utf-8?B?RnhtK3pjSmd4SHJObWU1ZGd2U0U2UGNoUUhoUHZqaS9DVDl4dW1mVlFnSXo4?=
 =?utf-8?B?VlFuTjd2VHZTVi9aUi8yRGJPTFRQZSt6b3hNcmw0RWtFQjhWMjZTZDh4Q0tr?=
 =?utf-8?B?Rk1sUEpHdGRRbUY4aXRDSFlmVmlLbHBqNE0zY1puMHR2Y21Vbm50SEZKcGZr?=
 =?utf-8?B?d1grOEY1d0YzamRvSGdUL2UvUVFERXlmWUl5SEo2WXJNano1SkJnTzVtSEli?=
 =?utf-8?B?djNjNFV0dkVSajhBT0pXM1A4NVJWZktXK3J3RjltKzhzL3cwZVpLSDJoc3Rk?=
 =?utf-8?B?NmkwcGl1cE5BMHZhUFNkWElub2N1VHlBRWdkMno2eVlkUEt2cllQYTgxa1Rn?=
 =?utf-8?B?RE9YZVhMSkZ2Ym1hWnF2czE2YS9PUXVQUHpidXowTE9lbmxnS202cGM5cUth?=
 =?utf-8?B?SlVLbml0Y2x5U2srUk9DNVBDN0Y5T0toRjBZT216QlliYUlDaHNuL1hsR2dJ?=
 =?utf-8?B?VE14TDZOazhKV3cvNzY5dUFlQnVSSjVuZ2tzWnZLRGwzek1iVjgybXZraWRC?=
 =?utf-8?B?WWNjZ21wZ2F0WStRWWIzVTQ0L29obDZpbG4xSXcvcGtnNjQrcUZmZzFvcStV?=
 =?utf-8?B?ZWhMdFpPTDdjZmxVenJkRXR4M3BtRXVlSzhkd0dHamkvdnZQTEx6dk8wcVZ4?=
 =?utf-8?B?eXZPaC9nblE5MUQxeVRYUkFYQ0NtblZlTDZDR3czamkwTk9uenF6NlNDNUUz?=
 =?utf-8?B?SE5MTDZoMzl6WkVjMTVsbVdTYWVvNkk2d3Fya0dIbGVjaDJUcjVOQUpWUHA0?=
 =?utf-8?B?N0N6My95MWQvUEJmbTlsckVORG5FcnBjZTNianJDNktuMkxVYWNnWWNwMGZz?=
 =?utf-8?B?Rlg3dzB4TDQyNjRwNCt0U1RGNjdaMitXQW1URHkySVdQU2hLWWNEWlJEN0s2?=
 =?utf-8?B?a01tRGlseVovdjZyTUV0Nm5Jemp3QkM2bHFvT2NxWG50Q3ZNdTFvcjU3SXV3?=
 =?utf-8?B?NUI1SWRzNnMzaUhySTVLd3NkdDhzSUtvNW1vYlU0a3FHSmZrU01yUHh4K0FI?=
 =?utf-8?B?UHU4NjE5ZldIcG9VQko4cVJvSEIzelNyN01Gc2J2b29NOFZpdkF1b212TDFT?=
 =?utf-8?B?ZUJEUlVFNEVlaXpYbmQ2SVV0T3k3YVUrN2xwLzhISXFJMzJPOW5odldKMmxD?=
 =?utf-8?B?VENEZ1BSa3d1dFI0c3E1Q0J0ZjRFdEk4UE82YXB5NEc0U1JOUWhtbkY5UGRH?=
 =?utf-8?B?ZTFSZ3NMQUZpZzVwRUQ3SldHNU9yRFV4Q3RZcUJyMmJ6SENBVDE4NW9uNjEz?=
 =?utf-8?B?Q1RFeDFZZWd2TCtndmtUb0F0cHBUNnpRcSs4RCtnazM5WTB1Z3VlSHhoV3Uy?=
 =?utf-8?Q?/DpOP2R1CeW+it9iJB3GChGIKS13ErtxmeWEc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0ZnV3RNQUZMYmthdUpkd2haUWcwdVVURDUzdW9Gam1NcHgvd1Y3bVczb2Uz?=
 =?utf-8?B?c21Wckk4WXlaUFNPWlZsQTE5Y3RtUDdVR1kxbzBpNktxOGI1ZWtXZGUrY3NJ?=
 =?utf-8?B?a0dZNjVpdGRqNDMzSHhhTi9wQysxQ1p4S1pyNGZ3T1A4ZHFGSEdmcloxSlhW?=
 =?utf-8?B?YnFqYTJ0T2txcGQyMk8wbEtCc01VOVFsSFVrS0JCVi8zb0EzdkFPY0NWQ2Y4?=
 =?utf-8?B?c2RMVDgvWFB6YWtwVHE0bDJDck1kMG81b1l5U2VQbk9nTEZwQmZrdkdkRWxT?=
 =?utf-8?B?a29kOXV4Skc4cDBkajdHSUNpNFlsS3p2VVh3OUhHVGQrVDZEY0xpc04ycTNV?=
 =?utf-8?B?UGRtQXdiMGhYYjJPU08zRXYrSWkxYlE1anhsakV5WXF1M0lVK2pFeUNDRy82?=
 =?utf-8?B?S2J1RmNMdkFmWkg1YkI3UmdYbjJTMHpsVXZDMDRVY0lveXF5TkcwMlFsQ3Mx?=
 =?utf-8?B?bXR0NG90eW1IOXc3L05WSHQ4eWhQbTdRQkhzd2Z3ZmtJelVVZW85OExDNmN3?=
 =?utf-8?B?NzJEY01mV3Mxcm9HNW83bER3OVltcDVlUlhwUDUyWDRWMGM5Tm9MR05oYzJD?=
 =?utf-8?B?MlhMa1dhWUgzSS9MMldDZjhCdGtvaXhZSDJ3OG1KTTJ5MVM5MmJ3Yll5Z2M5?=
 =?utf-8?B?U3JZSVZNclkrUTVpdVVsZnFYcXAycGJ1UExEMjkvSUJHSFR2RUtQamYzUlRy?=
 =?utf-8?B?QmdxRE9uVDh1K094NkFVa1l6WlNDaHlwRW9yaTE4TDFnb252VngyZUVLaE9B?=
 =?utf-8?B?WXFJVVlFbStSckZNbXNEMUtyeGx3eTRRNlRRVmRLNGViSFA0YVVrdTF3bW9n?=
 =?utf-8?B?M0xmQzQyZmJmZ3F2QW4xYXRFR09KZjhka2pKeXJ1dCtUcUl3MllwbGxLZ21W?=
 =?utf-8?B?d2pwTG44Vi90S2tRQnNmMWdpUlVrQ0VHclVJbVA5cU1SYmJCdWc5Q0V0Q1o3?=
 =?utf-8?B?aW9LWmF6UjBIcFJBV1J3VnZMVFlFTW82VUJBV1h1SWx2M3lNRFlWcXhud0Fm?=
 =?utf-8?B?d3dLdDBtY203ZzRZYVZNTVlDSDBqK2ZEVVdPTjZvSnJnK3czWkZkUXp3WFpq?=
 =?utf-8?B?dzlxWEFpbTgvM1ErdFp5NzN3cU5KcFZrNkFPVGVJT1ZOYmpFYndFM0J1SXlE?=
 =?utf-8?B?M2JuREd3M3lMamJYSjlMaUVwTnVyRFl0UG9UQUxaNWtwVW1EZ1pBNDBxejRM?=
 =?utf-8?B?bXBra242anoxdmtFY3JkQU12ZmpvNUloTVlSOTc4c1lhaTlnVFpiaDlPeDhj?=
 =?utf-8?B?U1FkK3YrbzBMWnZXb3BKWFJkZUppQ1h3NmJydEp0d0tDUi82MmxOaEg1Y2lw?=
 =?utf-8?B?VWlaV3VGL2JlQmRJZnVVeDIyQW5nTXpPL0E2eFBjNEw3dWMzUlcrL3VhNlVK?=
 =?utf-8?B?ZGF2ZVhaWGpleGlxd1FuemRtVlNvNXVFTUlIM1c1VUNoRy9valBKTzVGV0VK?=
 =?utf-8?B?YzZQbzdCdUhOQVlFM1NaNE42VG05REk2RjJKLzhvM0s4OWg4NmxQK2NZRXZX?=
 =?utf-8?B?NUhJSXc0b1dXWFpWVlpCY2JYNkNpYlhrc3NJUE9KeE5LNWFYbExmRlhxNlpo?=
 =?utf-8?B?K1NlN20vRzgrUmZ2Qm5CU1Z0Sk0rNkV0cjZSa0FPUUdXalhCdkJQdUJQT3pX?=
 =?utf-8?B?ZmhnZGdsY25hYzFoc3ZFbmF0ZTF0dEZuZmtubVRKa3A0WGQ5eFlFd2NoTUxj?=
 =?utf-8?B?SVZQanh3R0llRVlNekhhYkpmSVd6ZEliVkg1TTRjcVJucUsyaXE0anlESkY3?=
 =?utf-8?B?N09NS0t6cGNBSDJlcXQvWE9nMksyQmhFRGl4R2RqbVlpSm5wV3pjY2dtY2JG?=
 =?utf-8?B?TlpYRy9xWGZ1MTU1bDd0a3dZTzRQY0NORHZqT1ZBV28xUDlJUWo2aDRjbEw5?=
 =?utf-8?B?dVptQm92YzNtNEdPc1lYVHRjOExKeHdKYkVoODhkVnhiMm9VbDEwY2laazNi?=
 =?utf-8?B?YnBBRy9GbzlwRmhPYmJTZ0EwQ1FRTm9aVG1weW9uV3pITTNiYzYybzVrZFVE?=
 =?utf-8?B?YTJrdHlPYUpvN3JnSksrK0pyUHdJb0hvVmM2a1ltVXN1YlNmblJDZG4xbmZG?=
 =?utf-8?B?SnptNU40aC9DMXRtTkp2TGJzQTNrV21zWVJqV2gwMkI0VUwxcDFnMmVCaU42?=
 =?utf-8?Q?Y/BX4aPLqKI+DqborKupLRjXs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A27CBAF6CDCD94BAE6ACC02A698D061@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2424ffa-b671-4351-7386-08dcf8a5b7b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 05:43:01.4856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99Bv7Cf0ezpNrRkdechILe5HobzyOIlUZMzrZ102uCLsKevQxPfMd5549lXyVnyX1vODZnZQ2oliwIoVJ/R4bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7064

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
DQo+ICtzdHJ1Y3QgbXRrX2NhbV9kZXZpY2Ugew0KPiArCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4g
Kw0KPiArCXN0cnVjdCB2NGwyX2RldmljZSB2NGwyX2RldjsNCj4gKwlzdHJ1Y3QgdjRsMl9hc3lu
Y19ub3RpZmllciBub3RpZmllcjsNCj4gKwlzdHJ1Y3QgbWVkaWFfZGV2aWNlIG1lZGlhX2RldjsN
Cj4gKwl2b2lkIF9faW9tZW0gKmJhc2U7DQo+ICsNCj4gKwlzdHJ1Y3QgbXRrX3NjcCAqc2NwOw0K
PiArCXN0cnVjdCBkZXZpY2UgKnNtZW1fZGV2Ow0KPiArCXBoYW5kbGUgcnByb2NfcGhhbmRsZTsN
Cg0KcnByb2NfcGhhbmRsZSBpcyB1c2VsZXNzLCBzbyBkcm9wIGl0Lg0KDQo+ICsJc3RydWN0IHJw
cm9jICpycHJvY19oYW5kbGU7DQo+ICsNCj4gKwl1bnNpZ25lZCBpbnQgY29tcG9zZXJfY250Ow0K
PiArDQo+ICsJdW5zaWduZWQgaW50IG51bV9zZW5pbmZfZGV2aWNlczsNCj4gKwl1bnNpZ25lZCBp
bnQgbnVtX3Jhd19kZXZpY2VzOw0KPiArCXVuc2lnbmVkIGludCBudW1fbGFyYl9kZXZpY2VzOw0K
DQpudW1fbGFyYl9kZXZpY2VzIGlzIHVzZWxlc3MsIHNvIGRyb3AgaXQuDQoNClJlZ2FyZHMsDQpD
Sw0KDQo+ICsNCj4gKwkvKiByYXdfcGlwZSBjb250cm9sbGVyIHN1YmRldiAqLw0KPiArCXN0cnVj
dCBtdGtfcmF3IHJhdzsNCj4gKwlzdHJ1Y3QgbXV0ZXggcXVldWVfbG9jazsgLyogcHJvdGVjdCBx
dWV1ZSByZXF1ZXN0ICovDQo+ICsNCj4gKwl1bnNpZ25lZCBpbnQgbWF4X3N0cmVhbV9udW07DQo+
ICsJdW5zaWduZWQgaW50IHN0cmVhbWluZ19jdHg7DQo+ICsJdW5zaWduZWQgaW50IHN0cmVhbWlu
Z19waXBlOw0KPiArCXN0cnVjdCBtdGtfY2FtX2N0eCAqY3R4czsNCj4gKw0KPiArCS8qIHJlcXVl
c3QgcmVsYXRlZCAqLw0KPiArCXN0cnVjdCBsaXN0X2hlYWQgcGVuZGluZ19qb2JfbGlzdDsNCj4g
KwlzcGlubG9ja190IHBlbmRpbmdfam9iX2xvY2s7IC8qIHByb3RlY3QgcGVuZGluZ19qb2JfbGlz
dCAqLw0KPiArCXN0cnVjdCBsaXN0X2hlYWQgcnVubmluZ19qb2JfbGlzdDsNCj4gKwl1bnNpZ25l
ZCBpbnQgcnVubmluZ19qb2JfY291bnQ7DQo+ICsJc3BpbmxvY2tfdCBydW5uaW5nX2pvYl9sb2Nr
OyAvKiBwcm90ZWN0IHJ1bm5pbmdfam9iX2xpc3QgKi8NCj4gKw0KPiArCS8qIHN0YW5kYXJkIHY0
bDIgYnVmZmVyIGNvbnRyb2wgKi8NCj4gKwlzdHJ1Y3QgbGlzdF9oZWFkIGRtYV9wZW5kaW5nOw0K
PiArCXNwaW5sb2NrX3QgZG1hX3BlbmRpbmdfbG9jazsgLyogcHJvdGVjdCBkbWFfcGVuZGluZ19s
aXN0ICovDQo+ICsJc3RydWN0IGxpc3RfaGVhZCBkbWFfcHJvY2Vzc2luZzsNCj4gKwlzcGlubG9j
a190IGRtYV9wcm9jZXNzaW5nX2xvY2s7IC8qIHByb3RlY3QgZG1hX3Byb2Nlc3NpbmdfbGlzdCBh
bmQgZG1hX3Byb2Nlc3NpbmdfY291bnQgKi8NCj4gKwl1bnNpZ25lZCBpbnQgZG1hX3Byb2Nlc3Np
bmdfY291bnQ7DQo+ICsNCj4gKwlzdHJ1Y3QgbXRrX2NhbV9kZWJ1Z19mcyAqZGVidWdfZnM7DQo+
ICsJc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKmRlYnVnX3dxOw0KPiArCXN0cnVjdCB3b3JrcXVl
dWVfc3RydWN0ICpkZWJ1Z19leGNlcHRpb25fd3E7DQo+ICsJd2FpdF9xdWV1ZV9oZWFkX3QgZGVi
dWdfZXhjZXB0aW9uX3dhaXRxOw0KPiArfTsNCj4gKw0KDQo=

