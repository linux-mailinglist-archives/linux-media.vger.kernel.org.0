Return-Path: <linux-media+bounces-20982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C58329BDF15
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 08:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4704D1F244E5
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057B0193091;
	Wed,  6 Nov 2024 07:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JEWNao2z";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ibrrma7+"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953E51A00FE;
	Wed,  6 Nov 2024 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730876527; cv=fail; b=Oz+4eXhlxkQvophnR1ZFTq27dqhInwzgAOp/t0K8a7SOnKz69DWA/MEoxUzLiTKGl2EyLx2mtrpLmt/yF9puXRpZDnuQEsOvDIvD8ie8JWrWVtIr4xP8RJsiRiCJXI+cPNDOyhY5x2y8sAbAQx8HhFtqh8jPmIgWmw00AWAKcYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730876527; c=relaxed/simple;
	bh=CtsKGlliSx/YwMdLrALT4xyR3mLSgoGE0p6d9lEF0J8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BJhOGCpJPtXu2d9QZ5VhiFdVsms1NWQimzeO1D8J/0WiDBOkCfrvNs3/aMEkxR+Hn3/gyqF9+1wkbjZDi8R4CvEK4itjfGU3p7GvietT3AAOx2Tw5Yb5Dm8rZ1zeRneQnH9C5/ep6WI95ifarEPpT/5B7z9wIWsQpFtSzKbQ1wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JEWNao2z; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ibrrma7+; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 039fe0b49c0d11efbd192953cf12861f-20241106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=CtsKGlliSx/YwMdLrALT4xyR3mLSgoGE0p6d9lEF0J8=;
	b=JEWNao2zAhZEoKAOkXkYQjb9RzNfrwJMiL+GoBwDsR9Z4UtUi2Bs4n6n7q2/MM0EcDKxddgNxU7e201w4RHrqCqtZYsawJOwy7T1J+Qdz3S1bXplfTO6/EWDhx3CwDV7LBPPPzLQnax9WgiIwb8RW7HXBcnoTsMR5TETqhpWwac=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:96cf2840-7fed-40a2-855a-abe94b0be3bb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:506ba106-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 039fe0b49c0d11efbd192953cf12861f-20241106
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1009070032; Wed, 06 Nov 2024 15:01:58 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Nov 2024 15:01:57 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Nov 2024 15:01:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=be4ZmYe8X5oS6DAlG3xQPtf/oiKQrb37QsAl0oZwMYWemsdRCnw09CmxywrQ8kqs1/rUpBA9fiePe2PdknR1BKF7WSQIOzH7oFLMWJt5dDQ7x2sVP9TWbgCiCBGIlEiAt4F82XdQIEmBfleas7pfgT63OLRUp521dfPvWDXgST2jrRpLZXWL1Xuosa/on7TjXZfazn+WZebqqXdUCVE8V5p1Qfs2+ngvt6Ox7lLkvSJ9jjyI4TdSwLuklB+p+yjfFjFAwbLeUB7MTzypxQz9U4bUJLe7KmQQJD1vy1EdJSoi9Ye3Tzn/0Um35iGgVZaq/X+zlhHEmEnKago0LUSbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtsKGlliSx/YwMdLrALT4xyR3mLSgoGE0p6d9lEF0J8=;
 b=KoUYVEEGPa9JmNMuCy4gEo3n4NlrSYyoBMT8jqt7UOqVvMoSOgPTWtHUVDJscXIRjS8cspfp6R1ZT4JgHE/FCVQwEuVdPTQHH3WksqeOlS8tTrni3YDGyE3nUvZYNSaVTT2sibNHErx6aItAQjNt0g7aHN2e/Gn3u3d+jM24dk/MKarUFezd2Hv8sM7U90AJ/93At5IfKozbu2KXTdERhVCS9BtXJP94Y8y+u/zDtdiabKJTCEhnRGQfrD4XKii1MEuQOqcVyy2UD1bVbiM+b/NPQpv0rUCvcvfTc4HoPFOkyAitfMswXMUTyq2tiYxUBETFaQ9gBACPXPi1yWdskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtsKGlliSx/YwMdLrALT4xyR3mLSgoGE0p6d9lEF0J8=;
 b=ibrrma7+DpLWJRysRsKrscL3u6kxSAXgrOOxW1tM9tTTrF4CegF3ocR9lvtS0whwjU7sMLvKAu8nLM/OQr6+Rxu7doqYtYHGrr9Ht2ssYZK8lzxme69OwwQ+1VULGCKeKoa1lEKlHC0mx2cPUoSs3pSDtmWFChqJOBjwSuXjszA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6602.apcprd03.prod.outlook.com (2603:1096:101:86::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 07:01:54 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 07:01:54 +0000
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
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKp/wgA
Date: Wed, 6 Nov 2024 07:01:53 +0000
Message-ID: <19de1ea984ca7adb0d25058572779f44f28744a5.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6602:EE_
x-ms-office365-filtering-correlation-id: 75060e46-2dc3-490c-0c92-08dcfe30e56d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dzlha0svQko4QklNcGFCM0ZDdk02R1R0elRwWEoyb1Z1MDZEU255UDRoSGFR?=
 =?utf-8?B?R3NyTFJ6VzBmTEtNSnZkZ003Z0FScFVRcjROTDhRMWdZQUVXeG41eU9zWi9Z?=
 =?utf-8?B?SGRPcTdJalBJemIrU3lEWUppbENJcjRRaGpEWXBseGZ0U1lPYmlnSlBlaTR1?=
 =?utf-8?B?NkRRdkpkQ1lCb2lIS3ZtQUZHa1JoMVN1Y0VFY1E5UXE0a2JtOU0yTmdYSkUv?=
 =?utf-8?B?dXEzTnBIeTRwNVBxbGRJWHRlY2RxLy9jdmNQNkk3bm1HSXBmMWRSSFFtZHJX?=
 =?utf-8?B?R3g2UHRVbVdMaEFDZkp2N1dRUTdCNktZSXZMcmp3WUhNQkZtSlN1cGNEaFlH?=
 =?utf-8?B?T3VvZU9vMjZkSFQ1elIrd1R5ZTBnRkFQbTRMUW1zQVF0MzN4RDRkY0ZiUUJG?=
 =?utf-8?B?dUNaNTZJWGNkd3BGbEtvUlREQnpxZFJQNG1uYjBwSit1WDFUSGVxYjErcFdQ?=
 =?utf-8?B?NWh6QjJyM3I4QzVWcFdEUUVUUHNtUVFGQ0dQMjB2OUh6eDJlQTF2VDIvMHFT?=
 =?utf-8?B?WC9LWVFFZ002NkdrZmNoaGtMMExxZktVTTYrUnFsYjlXbFZNaU9ReVMxcndM?=
 =?utf-8?B?NFZxZE1XV3l5M09VTngvbnpXYk1LNTdmcGN0TVVVTDFYc3hjLzJ2YXdGbGpv?=
 =?utf-8?B?SFN6NUVjdEtxZ2xpaEo3V1d0UzA0VktqZDgwbUpQenBwUjk3Mms1U3NtRkJB?=
 =?utf-8?B?YW1ncFRFWlVBTWZBcWhwUnkxTStyTk5Nd2FORTVJVTU2YWRaSmN2NkVhQlRp?=
 =?utf-8?B?YkprRjYvYzhJaW0raGZCdmppT1BZREp0UkhzQW5kVjE3bXNUb1AyalVhcW5B?=
 =?utf-8?B?alhJK1dIRWhpTVd4N1NlYVQwa1BPYmRuY2hnQzNURjcxdUVLL3hVVFgzNDVR?=
 =?utf-8?B?NjF1Y05Qc1k5cGlMTVBVYXBXemhMbUtldjVWeTBJaWc5WThCMjQ0NVRWZTBy?=
 =?utf-8?B?dEZNajZrVG1pVEVFN1A3T1RSbUR6aGlDcnhTWjFlTDRpbExOQ0xGeExBNTE1?=
 =?utf-8?B?ZE5IOFJvYTg3ay9GcGc4YkR3emt2S3ZSMkVFdHdpaWtWNjF3RHl6bi9MTFNy?=
 =?utf-8?B?MTVXNEFSYURXeVBzNTJpa0F6U1pRMjZjamJiU2xUeWllS3JaaWlvWG8ycERo?=
 =?utf-8?B?aEdMK25wK3l3NEVPM3crblRFQTdGQjI4TnlsT0tiejFGb1lHRFNncnQ1TFU5?=
 =?utf-8?B?RWZJekV5L1NtV1BrRVFlbzFjVzdYbXhUblZmSDA4WGpGNEV5MWVrRDY2UmtS?=
 =?utf-8?B?Z2kzLy9lWXpmNVZqd0VScHNUeUFWOVNCelNhTVpBWFNzWndiQkkxSGxEc1Rn?=
 =?utf-8?B?ekd5NFp4NEVXRUlhbzlRM1U1bDJvRStsL2JRZmtIVWdOVS9VL1N4MlJjcnMy?=
 =?utf-8?B?TkptY2xyaWJDNk1CWUdtVVVib3ZXRWxUOTUrZGUya2Y0N3RDd0liU3NHUHFQ?=
 =?utf-8?B?MkluSUszSW9la1FoSlc3VlpYaEdaRExUS3JyQkRQcXpsRDh2ZDA3R3d0a0hn?=
 =?utf-8?B?dHNIZWJvMTZhaTBORXV3VnRVdHNhRmR3NUtrRTlFYU5UUjFkMGo5K2dHS2Vx?=
 =?utf-8?B?d0Y4ZWx6RmhEc1lKdGp3V3NsdjJadWZHY1FwOXVkRFZvYzhNYW5LR1YxZnRz?=
 =?utf-8?B?aGpzK01NbHhqSUtleWRzSmozLzhkZ1lTWHo4dXdBUUNvOWcrOTZRaEJTMVJa?=
 =?utf-8?B?Vzh1Y1IrZHFEU2R5Smh2dlRidzRTazA0ZVJRSGV0WHRCUVg5M0JTY1czSThY?=
 =?utf-8?B?M0ZDNmNLWHlnVFd4RnVEOTcwWkRRdzZIWm5FRFE0UUpsN3R4ZXVMdVdScllW?=
 =?utf-8?Q?tOMl03H3Tb0heESO2rOY0YBvuMalADHzqVa18=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjZQSkhEVmQvbExlUlp5eTRaNWRCYU1IR0U4Skd1L2NhdTZaVWhUeWlWK3hI?=
 =?utf-8?B?Zk1ZRXNLNVhReGl6TXhoR3dtVXZvZCswWnBocXQvL0RwS1NnZnY3ZWk0Yy9v?=
 =?utf-8?B?TkNySFJQYzRxaWhMRDRQMjBVVUFNenIzaXoyeFR4eXIyVitpVWI1clFpU2dP?=
 =?utf-8?B?MjlIZEJXYkRnOW8zL2I4QWxqZGRXRWdoSDRGK3dmODZ6MXZadi93cVpXSVZo?=
 =?utf-8?B?Z2Y5bmVPRTVrM1NUOXlhRnRySTErTUhqUjhnaGJoSjRiK2FZZDNhcTRnRmps?=
 =?utf-8?B?ZzYrR2hyQ2dtbHhmdDNqeGZXZUdMdzFBYUFQdVowMjBOUGxJRUpBc0xNTm4x?=
 =?utf-8?B?d0luRW5ZaVB0bUg0VzRTVXVmOGF1dnVNRzhlL0k2VG1yR1o4UHd1cGMySGMx?=
 =?utf-8?B?UGljaW5Oc0Rhc29zUnpFZkVsclo3MllRTXFvWlk5WjZZSTdqNzBJbkJtMXVo?=
 =?utf-8?B?c2xYSUhGWGVab21VcGxhaERkMmlMVHJyWFlMdU9SOWUxZ0lvNUZTZmpmUVRP?=
 =?utf-8?B?SUxHKzNGNG40eWRhQ2RXTm5lWkZVU2tOQlBFWE10bU14bmdjMDJrWlA2SXZS?=
 =?utf-8?B?MTV2ZlFOTkpoNjhSNTRpUS83T3NJdWVRTlp6QW1qcjBLY3FscUNBVUVhUzN6?=
 =?utf-8?B?ckVoVm5RN0I2QU83QTFCUzdzV0ZsaU9aTUlwc1NBMDJmUzRYTnNweC9UM2ZG?=
 =?utf-8?B?TytIOGkwSXRvVk9tN2F1elU2N2I0MWNoUHFZMUJnOWlMd0U3NGY3MnpRc0g0?=
 =?utf-8?B?R1JqSTBEeXdiWFZCd1I2NDArQjNHWDJRYXJuZW85RGljLzZaL1Z2bXlNdkth?=
 =?utf-8?B?UnFsMEVLSUhVV3d6UXI0RHJrZXF6b1FNNVpzeDZPYkdjeHBlYmkzWXdST1Nt?=
 =?utf-8?B?bzZ2UEJFNnphWW1UVW5iYW0yb1BoYkx1VWpjWHVkSGtvb05CeTl5RzFhaEh4?=
 =?utf-8?B?TUhSR0NNLzgvRUJKMktnS3VQbmxqQ3V2VW55NXd4Y2RHK1kyVmdMK0c4TVJx?=
 =?utf-8?B?TDNCOHFIanBOdlFVOTM4eFFoM1hER2h4MDlOUURsWUhDRmFLR0d1NXgwSHZQ?=
 =?utf-8?B?ZzB1SnkwYU1MVnpUeEF3ZHk2aDQwSFlWc2d2QXF3c2kvS2FwaWoxRHl6bXFj?=
 =?utf-8?B?Y2JEaXhObDVuNUxvS2h5aElyM3FWMWV5bkt0TSttamMzU2JaWi9lRW1XWmNt?=
 =?utf-8?B?UFZ1UEVnMlo0WWoyODNDNmlWMUpFREVmMlY5Y3gramF6ekliUE02TldLSGpP?=
 =?utf-8?B?ZjYvMGY3cXpoN2pUVEo0VERIbXQyRFRHQWo5QTJldDNWSW03QS8wNVdmdmxw?=
 =?utf-8?B?THVKaEpHNVEwZldtODBKM0JGYS9YKy9maXh1SEN4bXZ4MUNockx2WlUvWW51?=
 =?utf-8?B?ZW9uYytXQklWSGRrbk00Mk5pd2ZFY3BjQlhibE1URWtGMS9MdjlZMDh4Ny9F?=
 =?utf-8?B?UmxYR0lTZzJpRFUzelpNZm9IeGt4MG5aNjBUOGc4bWpablNvNDR3dlJLN0tn?=
 =?utf-8?B?RENHR2dtSXdvNkhBQ1d3cEFoV05XRDRpZ2lJaW4xKzBiYVNLdHljblE3NkFY?=
 =?utf-8?B?ZCsyZ2NOcDVXUStSUmsrd2FteWdqeExPQXhsUTFtYi8zSDYxMVJjdllWazUw?=
 =?utf-8?B?OVpVSHFRaHZRcExTRzQ3Uk1qeFErYVA3dWhFTjJzUWprWXBwekZUc0RTTG9N?=
 =?utf-8?B?enkxRWpsQUlNVEhiNTN4eUtsdWEvOWE0djdZL05ZMG5PVDZRSG5Qd0tDNE9Q?=
 =?utf-8?B?QmZXSHRDMC92YXRndElyWFVkbEJPWTFFWUFJOFh5SXUzQlpkZGh5MUN3ZFlJ?=
 =?utf-8?B?VUt0bk1oYmNxY0dtb2xkY3cxWjhRaEk0aEViNHZFcEVkS1ZDNWJsS2RTZ0Fk?=
 =?utf-8?B?M1N4N3IyVlZnVGJhRlVXK0lzaUZOOWZQdTRhY1Y0Kzk5YnJUTHFBWWM5dWNw?=
 =?utf-8?B?UStNNW1uZ1Q2bFhxZG03YWh1QldwTHFEUmtLMlJkV2w3eFhOandVdHZuSnJK?=
 =?utf-8?B?SEZKbHJIaExyZzVzd21tSVRqVEZtUW1sYTJnWWY3RkZ4ZFhYY1d2a09ZM21K?=
 =?utf-8?B?YzFpQzN5RTFrT3VMcHV6UW9rK0tORHNseCt0eG5TYUFuZFZwei9wd2FBUHlM?=
 =?utf-8?Q?QNufYoX/GWf7WvWKqaEwTPEdI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F64CA3ACAE8C1347BEB73A2169CAE9B3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75060e46-2dc3-490c-0c92-08dcfe30e56d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 07:01:54.0247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MCi0dbeJZ3lArr4Y8ilvD2n382zR4aKwoPCd7Bx1vm2QaMF1TkWIk82c3GLc0GnBi45DkTQ7sDJnbZUEHbGNQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6602

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
IENBTSBETUEgZG9uZSBzdGF0dXMgKi8NCj4gKyNkZWZpbmUgSU1HT19ET05FX1NUCQkJCQkJQklU
KDApDQoNCklNR09fRE9ORV9TVCBpcyB1c2VsZXNzLCBzbyBkcm9wIGl0Lg0KDQpSZWdhcmRzLA0K
Q0sNCg0KPiArI2RlZmluZSBBRk9fRE9ORV9TVAkJCQkJCUJJVCg4KQ0KPiArI2RlZmluZSBDUUlf
UjFfRE9ORV9TVAkJCQkJCUJJVCgxNSkNCj4gKw0K

