Return-Path: <linux-media+bounces-17458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D3296994C
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 11:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45A711F2464B
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 09:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460461A0BDB;
	Tue,  3 Sep 2024 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LoHUrleH";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="nr+jJTZE"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0501A0BC4;
	Tue,  3 Sep 2024 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725356386; cv=fail; b=c/8kLXLy5chNKx1OggCuB/k1BDAUpcM//3zq8or9Ql5dz7IHhLjGiv9WrYy3nWCMFmXQy8gAOyTG2x/lPQ3BKxvfuIhIzoEFVA3d/e53WKcFG67K5vBS0N1hx0J9qJVeLr55hNKKCeMVXoNF5+1eMEnhx8YBZS05HK44LGxa5PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725356386; c=relaxed/simple;
	bh=ypBQuA+AIcEE/6X9OeNSXiZ9Yc6T0zY0vK7Sa5PBDUI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AX39fIFCuPRb/Cl1/xSvdOLnRePIlEWesGi4RudI5KAthZQcWViZwZ0QJZ88NU61YTwVQzXlwNBWmv4zPu32zxNU0MCGAgKrfLsg/UcfRZ6IPlRh36ysRW/XWOAseaQBB04GTb+ziEdZ8I4+f/BsqqTSV2VIKMxbZuw1Fd2kj0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LoHUrleH; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=nr+jJTZE; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 69ebe80269d811ef8b96093e013ec31c-20240903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=ypBQuA+AIcEE/6X9OeNSXiZ9Yc6T0zY0vK7Sa5PBDUI=;
	b=LoHUrleH0uC57Nh9XgnZiaxjVHteSoI01ozgEcnuBrEx6r0bwhVAd+hG20AqLnABq5+Bss1g5opNM/hpe3anY2+Ljw0p3njEW+yOgpgEE6Qs/QpDUzVWCDo5mGUgoASP4r1s0wSoFnYZRqx6DSW8u4cqesRaQaWWgvNnxdGK52A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:1041f63c-c9ef-471e-aceb-c466d502b09d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:a8fa3b15-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 69ebe80269d811ef8b96093e013ec31c-20240903
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 228556413; Tue, 03 Sep 2024 17:39:28 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 3 Sep 2024 17:39:28 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 3 Sep 2024 17:39:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKZ87MFvWUZNjterxGi0CUcpBji1ZVehq1HrCckhUmfy5LP5wy8VnI6bI4ijFdu23Qo2Xtr5M5nSl+gqR3YYLMqdtkLKU6qHzA4SOKCgAsdGBe/UBlmu2NaGo9HOW1EMHqB9d8uItB6QMy7OliRojoyZdMV/1KC9hgGnAncXFV3ryAk63JPkkY5ScFxpk9ELUjWn64F4y685uVOzpq9yxNVnmy1uXhZs5xbEBFVgRLSaeq9kS6W6cUs4CKSh9dg3GFu+wKajCwzJaNj8NnIi7MhWqUNfduA57BQx+sgsGjj88o4C+MQKAL7UGpsRvyGK4Vqp+p5ZVLmIHBcgJvat1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypBQuA+AIcEE/6X9OeNSXiZ9Yc6T0zY0vK7Sa5PBDUI=;
 b=XmMeUDublD19QFvT+pzpiPMJvnHGM2UCuAy/dcWRXOtnypakxTXneRNxZNPv04b1cd3IO9qWlA7VkW1rEhw1aguwgmOfuwHJ1SvPq6oj8NCml2khSuW9mui7bmj2o4wBS4+dstiszOM3ECN6/JvR7mw2UVJiJ9oteO7q6B3PR4EmRKCfw+YJuU5dOd9nUaj5R+cXBqhzsdDBhgUwahSHCYaOUK7EjwjT7HRae31vmmSjfZvx3w0PFCfT6tDCErviTizzFleA0s/Dspiv/dsU4+Zvo3p1DClOTUWw8C5LmpEW9tMjzdUUlL8UtI0rUV1R6fOPvmG8b6BSBIeTzOF8jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypBQuA+AIcEE/6X9OeNSXiZ9Yc6T0zY0vK7Sa5PBDUI=;
 b=nr+jJTZEq+5UYcrQfA0FF6QD6ZUfp95uOZzcllTPsHlIBVl08W4HMPdsvubnsze50BOIqmDjuBSPzAAAJ064WzETnCMbqZKdrz5kNmIkAkiI8h6z9dxwARervdOIDGUushLnuRTKyXcKGGWM73e/gsoEnPSGbzmKIo/Orn1N5Rs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6671.apcprd03.prod.outlook.com (2603:1096:400:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 09:39:26 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 09:39:26 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
	<Moudy.Ho@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 2/3] media: platform: mtk-mdp3: Use cmdq_pkt_create()
 and cmdq_pkt_destroy()
Thread-Topic: [PATCH v4 2/3] media: platform: mtk-mdp3: Use cmdq_pkt_create()
 and cmdq_pkt_destroy()
Thread-Index: AQHa/HvrzIwSoIk6K0eKlefaDAGVSrJEoV4AgAEv/YA=
Date: Tue, 3 Sep 2024 09:39:25 +0000
Message-ID: <d5c512d06e013555397722137d5790dc8a627bfd.camel@mediatek.com>
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
	 <20240901143259.16849-3-chunkuang.hu@kernel.org>
	 <1d4e9e86-aaaf-4d19-b89f-6f7207ab72d8@gmail.com>
In-Reply-To: <1d4e9e86-aaaf-4d19-b89f-6f7207ab72d8@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6671:EE_
x-ms-office365-filtering-correlation-id: 77564307-1d0c-4133-492d-08dccbfc4cbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?emFnUEpVNURHNDBuaytlZUc0S0VxUFVvamtGaTBOQzdBc2dYWUJQaWsvb29M?=
 =?utf-8?B?L2RUWktVcndmeVc2M1JpQVlPNW5mUEduSHcxYzg4Qng2Y282WG5jRkZ5NHl5?=
 =?utf-8?B?WFlFZVBxNEpmdHlYWm4wbnNwR0h2MkNFd0RJMERaMWZqYWhMNWdObUllMzNM?=
 =?utf-8?B?NFd4eFpmUm5oWVVmcGZyMkJuSGVkSGxySFcyb1VPczZmUGJyTnowdSthdXV1?=
 =?utf-8?B?eDhGT01NK3dERExvYTN5VTRzdUhqWkNqU0lONTUyZFY0MkY1WUF2U0s4c2l3?=
 =?utf-8?B?NmdOSG44ZTQyZDNFa2J2YkFzZUh1ZmV5SElWTHJhV1g3WDNPVngxMDh6OWxB?=
 =?utf-8?B?aFRxRW1BUW80V1dXV0NCNy9XQXhhczV2eDJ4ZHlsYjNwVksrSnlsRmdDbWVO?=
 =?utf-8?B?VUpudEZjYUlVbW92K2N5bzFIUWp3cXo4d2xyVWYxdmI3VlF3Z20vRmZjaGlU?=
 =?utf-8?B?dWVYWDMxaU1JdHJVREdGb3A3bndIUVlhZWM5d2FrbXYxNW82WUNKZlYxZTJ0?=
 =?utf-8?B?eU9oei9wazdIcTMzUjhqU1NVVlFnZkhhQ1U3M1lmNk1GOG9wQWN0OENyRXVH?=
 =?utf-8?B?VTQ2Yi9xeFBNeEZkWWFZdlFnaTk4MFdTQ3VMdDBITjBVVEdxaUlXVXZXMXhR?=
 =?utf-8?B?R1dhemVoTFRBN283ZUIvVFJxbzJoNE1OWUNLcWVQMXhZNml0NGx4N0phQ3BK?=
 =?utf-8?B?MXNGaDRQLzBuUG9LbFJvd3puOUcrVlVVaysxd1lETHFMU29OZ2piYXIwTnVp?=
 =?utf-8?B?RmZXTzFCNEtSSWZBdUJrbWxiTXVUR29TdHpQNkpqajhCK2Z0RVFxVFBsUUdo?=
 =?utf-8?B?TktFdjU1YjQ0dWZkWVRUeTVKU3ViOGQ0NmJLeW5FSkp0dlZxRmszUENxb1px?=
 =?utf-8?B?aEZRQU1UZ0JhZEtSS25hRjcrS3pTdlJsR1VBWGJZVFg5bUF4MGhmVGtYSHBD?=
 =?utf-8?B?UXlpT3lJUmU4THU1SFQ0YXdpR1RYSSsrTjRpVmpHN0EvOFRvUnB2alpRbVpr?=
 =?utf-8?B?bGUvR2dVdllEYXlteldhSzNBaUMrb1NqOGQvd2tTY2pvMnA4QUNEa3BDYW1E?=
 =?utf-8?B?MkJiZ3NOS2lyOHVWTDRRa21Pb0hBcDZTOTlPbDRRdnlYM1FxcDI0bkRvOVEw?=
 =?utf-8?B?cm4vUWlScjNNbUloSHpBRytTOSt3OERGOGphQzNNSC9BNTExUk5nUmtUSmly?=
 =?utf-8?B?Q2NueWs3YmFsZVNnMU9SbzRwcG9UaVRkQVJyNDQyaXAvNE1DM2ozK2tYZUp2?=
 =?utf-8?B?MERaZ1VDUzZyWFZWUkl3SS9SVDhweU9OeGNJS1RDT1QxMnFBT1IxMHR3M2FH?=
 =?utf-8?B?V08vaFN3VkV5dVJ2ZVdyUVdSb1RJbEV3K0ltNGFxMlhNWENqTzYxd3kvN2xy?=
 =?utf-8?B?YWxhSFlvY2NyMjZPNU5mR1ZRb1MvSklhKzJJMTRGYmcxdEQwYytpKzg1UzFS?=
 =?utf-8?B?K2Q5WmpGTXVCTmlpNEpON1RmRXQrSXlkTXZjai8yOERPL2Yyd0FibDNIa280?=
 =?utf-8?B?bU41MEcwR3BqVi9MWWxGNEIyakkzek93akgvWkl1dkxhU0RURkpwdHZoRlU0?=
 =?utf-8?B?Q1N4azEySk1mMzk0RDVYUzhjWWV2SHNSdUloakNZdk5obzF4dEZrOVd6dFRa?=
 =?utf-8?B?eHovVll4cVNOOHR1OGF6TUdOcnYyempzWUdxZ1dTNTFNNVZicUVJNWh6dE9q?=
 =?utf-8?B?UUtQanVaMEhWYUFrcXMzeUlVMFkvclRTbEcyN0pBNkIyZHF4ZVZvckFoTWxS?=
 =?utf-8?B?blozeVlmdncwQWpuNmd0WVdzaFk5U2pac2M4ME1kQlpqY0ttVmJPUjZEaXNo?=
 =?utf-8?B?bXVGWkNHRWpJeDl6SEYzNnNTNWhNekQ5YVBaTFM3ZGVTZ0FES1VjRitpRTh5?=
 =?utf-8?B?cWVMam5jQ0JkaW9OQ21obldTbXAvUXErdUl6ZU4yTTNzUytXaTNmc2dIYUcx?=
 =?utf-8?Q?tC8Jo/Fd+f8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z01YMHZJb3dIOWtCZnFhei8vSVNXZDVTZXVZSE01L2FQcTdtc3JIOVg4MnBn?=
 =?utf-8?B?VHpIWE11NHF3UmZpa0UvSlI4OXNwSmN3MWc4NGNuQVZtUk9SYTRzQyt2OU9K?=
 =?utf-8?B?RU5CYWVuMTNHZEVSU1J4NWd0YXNEcVhxazV5bC9EK0V5czdiU0ZXejlGUnhP?=
 =?utf-8?B?ZkZ1Q3Z2MFk5TEIwaTllT2o3S2NJVDV1MEpjWmo3THZuVExRMmUxd1Yvekhr?=
 =?utf-8?B?clhLemZldllqWkpjZXFkVm5ISXVUL1lHeWlxR1lrSjBsOTBCSWx6Q09tUFEx?=
 =?utf-8?B?MDFDcGNZZ09HdHgrM0wvL2pOZ0RDSFlxYS9oTWNKWjAxeFJFbVMxSEhmL0lE?=
 =?utf-8?B?bEZwU2NQT1NQcEFOMVRtV1JmZnAvNDBuTVo0QlhmZC93YnFXaENOT3dLSVpR?=
 =?utf-8?B?SlI3MHZyeEpoV2diV3I0Tldwd0IwRnZXZ1BBRkppaHcyZFNiekZ3cjNSS09T?=
 =?utf-8?B?NHFwMEVyZmltMkYrbmxsbEV5YzhiRXl2NzRyUldMTzAyQ1dpV2RENXhwdkx4?=
 =?utf-8?B?enFUazBpOWtVNTRLRHJHekV5R2wwSW94Z04xQzFKWTJTOGkySVlmNzYxdjlS?=
 =?utf-8?B?MnhHOThLMER5Vk5TSmVoVW5RNnI1M3UxN0pZWDg5d1BON2FXQjJtdmpnZmlW?=
 =?utf-8?B?Ukc4WmRSd3IzeU9Dd2h4Zm1pamVBT2ZCMEdRSVcvSXhwbGJNRVE1ZFhEaE9O?=
 =?utf-8?B?KzJ1WkdDOGhEOFd6TGdJK0R2Nzc2bWdqTzZROWlObmlUU2RxeFVlOHVEektp?=
 =?utf-8?B?ek9oTHpTbXRzVlB1ZnIrdEQzcnlBUzNvTzVwRGR5cHoyM1l6SjlFZS9ZaEts?=
 =?utf-8?B?akFLRmcvNnMwLzdQWi9BMnR2bGhENEk0M3hianFSaGNDVlZSeEpZWmhBd2pR?=
 =?utf-8?B?V0c0bWNqYUlsWU9YT0l2QzRra3BTOTBDaDY2d3l4UkdlTWRxSUo4REhCU3FX?=
 =?utf-8?B?dU9QcEExMGFWc0tNS2hoSVJBZ1BtcmoxWjJ0dDdvQjEyUytjVWxURDRwTDlW?=
 =?utf-8?B?amcvSlBRY2FZVXA5Q1A3SEFGS09TZ054bnBTeGFaQmcwS3VZTEY5cnlDR01j?=
 =?utf-8?B?MTY5YVRjeHNHRU9UWm5DMkwrMEFuOGIwMmJ1TUlpeXAvZCtyNEl1Myt1VGNF?=
 =?utf-8?B?QWJhVmlDZ05uQW5FTTdLbWdFQ0kzQnk1bEgvUzAzaGR4cFp1S0kzcHBiZUNK?=
 =?utf-8?B?c2xpSGc2MG1rYUIxcVdhYjNQMTg5QjNzTklTRVgraktWbEYzYU1Ba2ZwczZ4?=
 =?utf-8?B?SVl3MkpkaWlKU3drNFZ5U0MreTFKeUVzS0xQOE9xV1UzMmRmUXNLbGxzRFNJ?=
 =?utf-8?B?VmJoWlFqWmlQUnc3OWlMbGhPaVNsUXdkM244SjlXNlFuN2tqc2lRNm9BR0x2?=
 =?utf-8?B?cCtNZkZlQW14eUJTMHoxd2xmamZ4N0hzNWJ5enBlRCtBZ1YrS3MydFk5MUFW?=
 =?utf-8?B?a25USk9FdTg1WVhxbEV3akIwRFkwYWJMUndCNGw1M0orcWVSQ2ExMTBBTE0r?=
 =?utf-8?B?R3pZZDJ4RkE3SnU1UXVSaTVLZjIyYitZOGNxV00vYytDNDdjc3d2MTc0R1VJ?=
 =?utf-8?B?ZnJIdHJQMVZld3VhRFNzSVZ2OThsNjlhTjlvaVZnQnR0di9XU3AzNkxXZ0Jv?=
 =?utf-8?B?S1NySit4cHZKdWxaSWRjMkhpc1d1bzJIMlY2U1VibmRlTU4wY1cybGxMSHBJ?=
 =?utf-8?B?a0I1Umc1R3IwVlorRGg0K1hMeHlFaHdFditreitFWnhaU2F6OU9WSVI2VzdQ?=
 =?utf-8?B?T2RCV3M4VHhzY3J6ZGVGZnBXN0RUMkI5WWlxZk1PNlhQVDg1N1ZvSDQ2OWti?=
 =?utf-8?B?T2hkTE8vbGpWd002aTVSWExKUHl4bjk5eXZWSlFKYXRSTkRQdEFXSVBmbnVj?=
 =?utf-8?B?Y2RpMENIRHF4RXRseHVMSm1NVDFrQkFzemloVmFMSG5jZG4rWTZzRnhpZTVT?=
 =?utf-8?B?UTVQenRMWG1rN0tMa1lmS1NIRDJtQWwydUZRUlc0aXd4QiszTHJ4YUxyZ0VC?=
 =?utf-8?B?QVdoaHdVUFhuRE1kVC9FMmt4WE02bHhUOUJlVGJ3ejVxZkNCNUdqZ2ZsTnJk?=
 =?utf-8?B?VEUwRFZYRnhMRU1XZUNQZ2p6S3dlemdQbmRYQlBkWlZaZTd5Q0dFQWdCM3NE?=
 =?utf-8?Q?ylRqnWdnpe3gzTzPoK0NM9Z5j?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA8BD679BC00B64390FC56D41393181A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77564307-1d0c-4133-492d-08dccbfc4cbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 09:39:25.9157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zSR5igM+tarbS/nE8NUtQ6sljxUCm07VcvqG8SFLIiSbQCdBH6b4cK9diBwy6sdL9Ah/EKO9M1hhZ1Lyardwaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6671

SGksIE1hdHRoaWFzOg0KDQpPbiBNb24sIDIwMjQtMDktMDIgYXQgMTc6MzEgKzAyMDAsIE1hdHRo
aWFzIEJydWdnZXIgd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmll
ZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgDQo+IA0KPiBPbiAwMS8wOS8yMDI0IDE2
OjMyLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0KPiA+IFVzZSBjbWRxX3BrdF9jcmVhdGUoKSBhbmQg
Y21kcV9wa3RfZGVzdHJveSgpIGNvbW1vbiBmdW5jdGlvbg0KPiA+IGluc3RlYWQgb2YgaW1wbGVt
ZW50aW5nIG1kcDMgdmVyc2lvbi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuLUt1YW5n
IEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4NCj4gPiAtLS0NCj4gPiAgIC4uLi9wbGF0Zm9y
bS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNtZHEuYyAgICB8IDQ2ICsrLS0tLS0tLS0tLS0tLS0t
LS0NCj4gPiAgIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNtZHEuaCAgICB8
ICAxICsNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlv
bnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay9tZHAzL210ay1tZHAzLWNtZHEuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvbWRwMy9tdGstbWRwMy1jbWRxLmMNCj4gPiBpbmRleCBlZjVkYWRlMzVmZDMuLjc0MGE0ODRj
OGViNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21k
cDMvbXRrLW1kcDMtY21kcS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay9tZHAzL210ay1tZHAzLWNtZHEuYw0KPiA+IEBAIC00NzEsNDMgKzQ3MSw2IEBAIHN0YXRp
YyBpbnQgbWRwX3BhdGhfY29uZmlnKHN0cnVjdCBtZHBfZGV2ICptZHAsIHN0cnVjdCBtZHBfY21k
cV9jbWQgKmNtZCwNCj4gPiAgIHJldHVybiAwOw0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4gLXN0YXRp
YyBpbnQgbWRwX2NtZHFfcGt0X2NyZWF0ZShzdHJ1Y3QgY21kcV9jbGllbnQgKmNsaWVudCwgc3Ry
dWN0IGNtZHFfcGt0ICpwa3QsDQo+ID4gLSAgICAgICBzaXplX3Qgc2l6ZSkNCj4gPiAtew0KPiA+
IC1zdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ID4gLWRtYV9hZGRyX3QgZG1hX2FkZHI7DQo+ID4gLQ0K
PiA+IC1wa3QtPnZhX2Jhc2UgPSBremFsbG9jKHNpemUsIEdGUF9LRVJORUwpOw0KPiA+IC1pZiAo
IXBrdC0+dmFfYmFzZSkNCj4gPiAtcmV0dXJuIC1FTk9NRU07DQo+ID4gLQ0KPiA+IC1wa3QtPmJ1
Zl9zaXplID0gc2l6ZTsNCj4gPiAtcGt0LT5jbCA9ICh2b2lkICopY2xpZW50Ow0KPiANCj4gY21k
cV9wa3RfY3JlYXRlIGRvZXMgbm90IHNldCB0aGUgY2FsbGJhY2suIFdoeSBkb2Vzbid0IHRoYXQg
YnJlYWsgdGhpbmdzPw0KPiBTYW1lIGhvbGRzIGZvciB0aGUgY3J0YyBkcml2ZXIgdGhhdCBpcyBh
bHJlYWR5IGluIGxpbnV4LW5leHQuDQoNClRoaXMgc2VyaWVzIGlzIHRvIHJlbW92ZSBwa3QtPmNs
Lg0KRm9yIHRoZSBoZWxwZXIgZnVuY3Rpb24gd2hpY2sgbmVlZCBwa3QtPmNsLCBhZGQgcGFyYW1l
dGVyIHRvIHBhc3MgdGhlIGNtZHFfY2xpZW50IGluZm9ybWF0aW9uLg0KVXAgdG8gbm93LCBvbmx5
IGNtZHFfcGt0X2ZpbmFsaXplKCkgdXNlIHBrdC0+Y2wsIGJ1dCBpdCBpcyByZXBsYWNlZCBieSBj
bWRxX3BrdF9lb2MoKSBhbmQgY21kcV9wa3RfanVtcF9yZWwoKSBpbiBbUEFUQ0ggdjQgMS8zXS4N
ClNvIHRoaXMgd291bGQgbm90IGJyZWFrIGFueSB0aGluZy4NCg0KUmVnYXJkcywNCkNLDQoNCj4g
DQo+IFJlZ2FyZHMsDQo+IE1hdHRoaWFzDQo+IA0KPiA+IC0NCj4gPiAtZGV2ID0gY2xpZW50LT5j
aGFuLT5tYm94LT5kZXY7DQo+ID4gLWRtYV9hZGRyID0gZG1hX21hcF9zaW5nbGUoZGV2LCBwa3Qt
PnZhX2Jhc2UsIHBrdC0+YnVmX3NpemUsDQo+ID4gLSAgRE1BX1RPX0RFVklDRSk7DQo+ID4gLWlm
IChkbWFfbWFwcGluZ19lcnJvcihkZXYsIGRtYV9hZGRyKSkgew0KPiA+IC1kZXZfZXJyKGRldiwg
ImRtYSBtYXAgZmFpbGVkLCBzaXplPSV1XG4iLCAodTMyKSh1NjQpc2l6ZSk7DQo+ID4gLWtmcmVl
KHBrdC0+dmFfYmFzZSk7DQo+ID4gLXJldHVybiAtRU5PTUVNOw0KPiA+IC19DQo+ID4gLQ0KPiA+
IC1wa3QtPnBhX2Jhc2UgPSBkbWFfYWRkcjsNCj4gPiAtDQo+ID4gLXJldHVybiAwOw0KPiA+IC19
DQo+ID4gLQ0KPiA+IC1zdGF0aWMgdm9pZCBtZHBfY21kcV9wa3RfZGVzdHJveShzdHJ1Y3QgY21k
cV9wa3QgKnBrdCkNCj4gPiAtew0KPiA+IC1zdHJ1Y3QgY21kcV9jbGllbnQgKmNsaWVudCA9IChz
dHJ1Y3QgY21kcV9jbGllbnQgKilwa3QtPmNsOw0KPiA+IC0NCj4gPiAtZG1hX3VubWFwX3Npbmds
ZShjbGllbnQtPmNoYW4tPm1ib3gtPmRldiwgcGt0LT5wYV9iYXNlLCBwa3QtPmJ1Zl9zaXplLA0K
PiA+IC0gRE1BX1RPX0RFVklDRSk7DQo+ID4gLWtmcmVlKHBrdC0+dmFfYmFzZSk7DQo+ID4gLXBr
dC0+dmFfYmFzZSA9IE5VTEw7DQo+ID4gLX0NCj4gPiAtDQo+ID4gICBzdGF0aWMgdm9pZCBtZHBf
YXV0b19yZWxlYXNlX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+ICAgew0KPiA+
ICAgc3RydWN0IG1kcF9jbWRxX2NtZCAqY21kOw0KPiA+IEBAIC01MzgsNyArNTAxLDcgQEAgc3Rh
dGljIHZvaWQgbWRwX2F1dG9fcmVsZWFzZV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykN
Cj4gPiAgIHdha2VfdXAoJm1kcC0+Y2FsbGJhY2tfd3EpOw0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4g
LW1kcF9jbWRxX3BrdF9kZXN0cm95KCZjbWQtPnBrdCk7DQo+ID4gK2NtZHFfcGt0X2Rlc3Ryb3ko
bWRwLT5jbWRxX2NsdFtjbWQtPnBwX2lkeF0sICZjbWQtPnBrdCk7DQo+ID4gICBrZnJlZShjbWQt
PmNvbXBzKTsNCj4gPiAgIGNtZC0+Y29tcHMgPSBOVUxMOw0KPiA+ICAga2ZyZWUoY21kKTsNCj4g
PiBAQCAtNTc4LDcgKzU0MSw3IEBAIHN0YXRpYyB2b2lkIG1kcF9oYW5kbGVfY21kcV9jYWxsYmFj
ayhzdHJ1Y3QgbWJveF9jbGllbnQgKmNsLCB2b2lkICptc3NnKQ0KPiA+ICAgaWYgKHJlZmNvdW50
X2RlY19hbmRfdGVzdCgmbWRwLT5qb2JfY291bnQpKQ0KPiA+ICAgd2FrZV91cCgmbWRwLT5jYWxs
YmFja193cSk7DQo+ID4gICANCj4gPiAtbWRwX2NtZHFfcGt0X2Rlc3Ryb3koJmNtZC0+cGt0KTsN
Cj4gPiArY21kcV9wa3RfZGVzdHJveShtZHAtPmNtZHFfY2x0W2NtZC0+cHBfaWR4XSwgJmNtZC0+
cGt0KTsNCj4gPiAgIGtmcmVlKGNtZC0+Y29tcHMpOw0KPiA+ICAgY21kLT5jb21wcyA9IE5VTEw7
DQo+ID4gICBrZnJlZShjbWQpOw0KPiA+IEBAIC02MjAsNyArNTgzLDcgQEAgc3RhdGljIHN0cnVj
dCBtZHBfY21kcV9jbWQgKm1kcF9jbWRxX3ByZXBhcmUoc3RydWN0IG1kcF9kZXYgKm1kcCwNCj4g
PiAgIGdvdG8gZXJyX3VuaW5pdDsNCj4gPiAgIH0NCj4gPiAgIA0KPiA+IC1yZXQgPSBtZHBfY21k
cV9wa3RfY3JlYXRlKG1kcC0+Y21kcV9jbHRbcHBfaWR4XSwgJmNtZC0+cGt0LCBTWl8xNkspOw0K
PiA+ICtyZXQgPSBjbWRxX3BrdF9jcmVhdGUobWRwLT5jbWRxX2NsdFtwcF9pZHhdLCAmY21kLT5w
a3QsIFNaXzE2Syk7DQo+ID4gICBpZiAocmV0KQ0KPiA+ICAgZ290byBlcnJfZnJlZV9jbWQ7DQo+
ID4gICANCj4gPiBAQCAtNzAwLDYgKzY2Myw3IEBAIHN0YXRpYyBzdHJ1Y3QgbWRwX2NtZHFfY21k
ICptZHBfY21kcV9wcmVwYXJlKHN0cnVjdCBtZHBfZGV2ICptZHAsDQo+ID4gICBjbWQtPmNvbXBz
ID0gY29tcHM7DQo+ID4gICBjbWQtPm51bV9jb21wcyA9IG51bV9jb21wOw0KPiA+ICAgY21kLT5t
ZHBfY3R4ID0gcGFyYW0tPm1kcF9jdHg7DQo+ID4gK2NtZC0+cHBfaWR4ID0gcHBfaWR4Ow0KPiA+
ICAgDQo+ID4gICBrZnJlZShwYXRoKTsNCj4gPiAgIHJldHVybiBjbWQ7DQo+ID4gQEAgLTcxMSw3
ICs2NzUsNyBAQCBzdGF0aWMgc3RydWN0IG1kcF9jbWRxX2NtZCAqbWRwX2NtZHFfcHJlcGFyZShz
dHJ1Y3QgbWRwX2RldiAqbWRwLA0KPiA+ICAgZXJyX2ZyZWVfY29tcHM6DQo+ID4gICBrZnJlZShj
b21wcyk7DQo+ID4gICBlcnJfZGVzdHJveV9wa3Q6DQo+ID4gLW1kcF9jbWRxX3BrdF9kZXN0cm95
KCZjbWQtPnBrdCk7DQo+ID4gK2NtZHFfcGt0X2Rlc3Ryb3kobWRwLT5jbWRxX2NsdFtwcF9pZHhd
LCAmY21kLT5wa3QpOw0KPiA+ICAgZXJyX2ZyZWVfY21kOg0KPiA+ICAga2ZyZWUoY21kKTsNCj4g
PiAgIGVycl91bmluaXQ6DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jbWRxLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5oDQo+ID4gaW5kZXggNTNhMzBhZDdlMGIwLi45MzVh
ZTk4MjU3MjggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRl
ay9tZHAzL210ay1tZHAzLWNtZHEuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jbWRxLmgNCj4gPiBAQCAtMzUsNiArMzUsNyBAQCBzdHJ1
Y3QgbWRwX2NtZHFfY21kIHsNCj4gPiAgIHN0cnVjdCBtZHBfY29tcCAqY29tcHM7DQo+ID4gICB2
b2lkICptZHBfY3R4Ow0KPiA+ICAgdTggbnVtX2NvbXBzOw0KPiA+ICt1OCBwcF9pZHg7DQo+ID4g
ICB9Ow0KPiA+ICAgDQo+ID4gICBzdHJ1Y3QgbWRwX2RldjsNCg==

