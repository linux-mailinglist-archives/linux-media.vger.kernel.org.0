Return-Path: <linux-media+bounces-41818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD21B453A1
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 11:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 800FE584F39
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 09:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4AD28642B;
	Fri,  5 Sep 2025 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fOKoOvZe";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="CbM5IZtX"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FA427AC3D;
	Fri,  5 Sep 2025 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757065327; cv=fail; b=YgUsYzXaXWPrvqRYdWYGhio6rOkZfMzpNpoQAkIcGixb6FY/WKm8VBztTBdMZ+CO+j2DKnHcr+80SO4TxzHWzQp/tmNdOFenPGITp/HfB4xOkh9IDEtESuBzFxMUnOVHdLRA9E3tKlfoGlsg4w5gkBBId0MIvlv8HPJ1oueigxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757065327; c=relaxed/simple;
	bh=oPgCDe7WO4V86DXkOSx7jbCp24cG4uCm6C+Qtt8gfPI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EUumYSvyiV6gxlTIV3LA8adCehDaUB7vhX361unJvcvvixLzfwSVrKOoDYs54kjwhWBYqmFZuFMUFqkXPexOzsOl+rSGinqww13uJsh/O+lRTzeA0klKYw7Kgu+rlQQF1+h8zaKZnmm2jxs0LM8J4DE6u+BU8rwvK58sVHqyLhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=fOKoOvZe; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=CbM5IZtX; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 911dda548a3c11f0bd5779446731db89-20250905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=oPgCDe7WO4V86DXkOSx7jbCp24cG4uCm6C+Qtt8gfPI=;
	b=fOKoOvZeKwuxvXEPG3BTZdxiISIkHYhJjnHEKy7m5SjUYr5rc0zwYergY3npedJUK/xhuYaMO++TWGGBIZShhldVgl+SWMrVeaRFOE17KpBEcMAB8YyvYoxnJcwZHQY2m6w7q/V0pX/rr6VLfrnA7E+Q1pj+iwkQDpcCN7IAj3A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:de3d1f3f-5bf3-4167-bcbc-bae9dbab67e0,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:46d300a9-24df-464e-9c88-e53ab7cf7153,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 911dda548a3c11f0bd5779446731db89-20250905
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 768097033; Fri, 05 Sep 2025 17:41:58 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 5 Sep 2025 17:41:42 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 5 Sep 2025 17:41:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oP/5Mg9cBP7gOTACZ7aveV+yNXSlGnkul9FbO185DsZ0X0tVGZDO5zXK60YeO2ig3KSUN26spegZT7vONwPGshxBm0nma1iok64EKMERYaxNyWzm+vULDx2sUgStiO080pu7IWBN1HZXP0ckndtD2srnPANQ3fsOwOWsM17RYezG2RuoAXjYr9Fj1/Bo2s56XjMutcSwc5aL4ArPi13rB3YJhOsJMWw3XS+J6OU8pBSKIeBtVVE/EnVP8Poy5cinnRiZeJ6UtJtt36YyXVLFDKtNm7Vk0TUxgccAkdXhsdv1c4O8PZpSJqj7mWDaTNuO7vgzxkA9io3aZKgvs9LkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPgCDe7WO4V86DXkOSx7jbCp24cG4uCm6C+Qtt8gfPI=;
 b=rPHTrK8eZmuePOIDs6xYGPF1BwEyhRCKFUYS4RJNHlx5PxnkBVWQXzO1GYi93f80lHnfoHCFjGmYEUgwYp4U/CZmeLogkxLHC8biYjIeiVC5lJbrfgtqzioIFrLwOM0vO4ZKayCaUaLv7MNHAzGXn7CR0VYHcKn86pgoKXg7rzoD7Vk9YMaq90pF7Z5jcrvwEemNvoWeELoJ9GYmzbwvxP6fixmzqGfmYT0dsxcm1OnnFq3ieyvYIczuFl8bTtupL9wOnJpVwXw2DW+djAKafHJs1TDWHKpLJaZWy8Yt9xM+8fwItp4J7+uCumbqjYIthRN42LXyH6a5nCvoV8iWTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPgCDe7WO4V86DXkOSx7jbCp24cG4uCm6C+Qtt8gfPI=;
 b=CbM5IZtXXBFdf0YQHWPdjdEMOY3n/NpD3I7ajuZJ1yjIU9ox7XRS6MefMXTBOAP06iyDyJg55ZRUmrBEtOK1Lm0E2B3ymOV3mb9tQmmWlQ0tjtLaIT5poBd0iyjv414ph+lzz29/hTibBpzpTuVyjeknJ2TnXyagfHEs5VC+zuo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6540.apcprd03.prod.outlook.com (2603:1096:4:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 09:41:54 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 09:41:52 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
	<Paul-pl.Chen@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to replace
 cmdq_pkt_write() and cmdq_pkt_write_mask()
Thread-Topic: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to
 replace cmdq_pkt_write() and cmdq_pkt_write_mask()
Thread-Index: AQHcF0eLeT2L4UGJx0WwI0G+5FmVsLSEZA2A
Date: Fri, 5 Sep 2025 09:41:52 +0000
Message-ID: <b2335fd9296bc6f3511f8139870f0c34db1be62a.camel@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
	 <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
In-Reply-To: <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6540:EE_
x-ms-office365-filtering-correlation-id: 7d9b7c2a-d89e-4cec-4766-08ddec6071a6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|42112799006|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bncrRkphbGpTeGZSUUxJMHNiQnlRMURFSFY2aDV3ckhOMm9sMWUxVjVSaE4v?=
 =?utf-8?B?a3c5SVJDVHdobEE2M0l6b3doNjhkcmNUWHE4clNKLzM0OVlqem9WRFhON3I1?=
 =?utf-8?B?UTY1TjhGTnJuNVMrcU5NTXk5LzB1RUhCTFZYNzZQSFNVNGRTbk54SU9iTjlx?=
 =?utf-8?B?amRwR0xROUZRb1pRZlpYUlNCa3ZuaDB0NjRuTG8vRThsT251VzVMYnEvNVhh?=
 =?utf-8?B?S1BKNllLMlRWa21DZ3pUSmEzeGs3T0pNVEM5K0o1Q0pkYnVaUEdnUHVodUR6?=
 =?utf-8?B?YldDcDU4WnJTaGtuN3ZDSnlVaWlicSs2TmRwWm1iRWtwUHZuNVpjUThvUEVO?=
 =?utf-8?B?UjZmaWNlRWIrNGsxWk9IcERHcWJrQVE2YmQrV29BclUwQ3BPM0tjVFlYUzky?=
 =?utf-8?B?MmptVkR3NzJiVVVKVTAvWGs4aG84QXgvRk9RalhGb21WOERyZzJzYnBGWXYw?=
 =?utf-8?B?U1JtbzlPRnIyMWNRdHdtVlI1ZUozN1ZCaDdySzZZUTl0aUdBKzJycHZ3eDJ0?=
 =?utf-8?B?azExY1NScEFRM084dFR5L3hIZ2o1S1lXUVRTeTIxNTB4blp3WVRXc1BEWXB0?=
 =?utf-8?B?cml0WFpxMmJlWitkVzJORElCM2ZUQVZmWUE2R053a09TWDZUVGZ5S1BDdnBQ?=
 =?utf-8?B?KzNaSkdYZ2M1WHkyemdXb3hEWFV3L1JJak5jRzN1ZlZuSVpSR0oxNkY2QW1Q?=
 =?utf-8?B?MFZIbG5ETFRDRVVDTHFyQ1JNQ1hwbCsvTE9NOWszSGpvQnRJN0lydmh1SDRw?=
 =?utf-8?B?dXdJMGpTTGVMVnp2VnAzRElYR2tkVkhsMVZMMmxWdGp6LzN1SXBwd0I5UUtY?=
 =?utf-8?B?VU9UOWo4K1FxbzBucm03cXRZYjVJNnltbEFCS1IrUlcwWVEzalArUENVUjJG?=
 =?utf-8?B?eGZjOXZudXQvTDh6UDROTXovNDZvb2h3NTNkc245aFlZOUFsR3VDTXI0Z3JF?=
 =?utf-8?B?WDQrdmJYZnNMMVRZVDYzYlBoa04xRDBNR1FQN3oybU9kTXBTaHJEa1lzdTRS?=
 =?utf-8?B?TitUYXlOUVVYZXdJYlhQclg2Lyt3eGR3cFhUR0tyV1RMTFdEaC9HN0tPcDlR?=
 =?utf-8?B?b3dXcjB0dG9ZR2IwTXBNQlFXWmUxL2xsSEVXdWgxZm9KWTU0cXNrSjVYdWpF?=
 =?utf-8?B?b2ZHbkN4NkxCQ1paUll4L2w5VW0vaTB0d0djWXhkYWdyRzZYVnA4eFNlc3FT?=
 =?utf-8?B?S1RBUDlKYncrZyt4SVhFcHdYYWZZSjBsQ1NPb3RsRUF4SGR0N0huM05YMUdC?=
 =?utf-8?B?Ty9tand6VG90ZmJMS1BqdUtOTjN2SG9yeXBodGNJRS9HcWxuRjVXUFluSzRq?=
 =?utf-8?B?U3dCeGVKcmxSbE5tWkUrWXVqL1d3ejNMMXUrTW95bkMyWnZxYnhHU1c1anhx?=
 =?utf-8?B?Slh0bnNobWdUNXFReU1nUk9xL2t0ZXF2N0VZc1k4cGRxRFUyS09QVzljRU02?=
 =?utf-8?B?VTB4cldVaGk2dEl5d3ZpSldHbEczVEpkUkd3M1RHRTg4ZGoxcmZUMGhJbXRJ?=
 =?utf-8?B?U0xhVmFtZ2txUldkazJZOTI3U3FmdllaS21LeDhuWTBjTXBNK2kwdHFsT0lt?=
 =?utf-8?B?aU5zaXluOFhnV3BwT2hRTUlOdFYyd1g3TFg2eWhKQUxRa2Y3TG5zTW5YTXRZ?=
 =?utf-8?B?Z0pQV2RtWjRIK0ZQRkhnOERwV1FEWG9xa3p4dFlhM3Y4L2EzQWVWMFF2TEtI?=
 =?utf-8?B?eGsyNG80MG5ESFJmUWY1QVVhSW1iNWw5OTAxcVhvMEhLa1ArOWxtK2VZWXVx?=
 =?utf-8?B?SWNtaU1zemF4bjV2aExDRUlSU09JT1poMTR3cDJ6OVhZdmJ2TTNDK3lCZGR1?=
 =?utf-8?B?YW92MmQ0bVpBenhScU9ka3E0ZjRITlhzMkxQcXFpclUrNUNVYTIxenV1eWtC?=
 =?utf-8?B?NitnS3YyQ2lkdEVEMkIyZ05ZNzJYb0ZEUVI5K1JkN0VMaloveG5LY1JxSUNY?=
 =?utf-8?B?SDM5a1l0TURNeTYralN1NC9hcy8ydXYwMzlxU2p4VWNoRGMyYStyZXdvc0VL?=
 =?utf-8?B?NW94c0FZbG93PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWhSMDRpbXVsdyt0V2IxcHNHRllXbndKekUrd2x2UlNiNWdLb251eno5VVlp?=
 =?utf-8?B?bStGUVN3WFdJVGxZYUxjZlBlYnI5ZVhXQlBza3BlRHVYRzhneTZWOTQ1VnBH?=
 =?utf-8?B?dHYyUFl3aWpGd2QzN0FnN3FGWEVVR3l0b0hWdG5XeTBBcGE2U3FhalpLNE1n?=
 =?utf-8?B?blJrUmh3YmF5S1RiUUtkaXB0a0dWRm5RNnFycnp6S0xIcmxsdE5EQU5VTzhv?=
 =?utf-8?B?c2tHZWw3b2ZqQXp0THJWV2VvSTRjNlM4Ym82YU8rSnZLMDB1TUFTUC9FeFpF?=
 =?utf-8?B?VlQ2SkE3b0pZWGtSTzdBdEpweGZLRmhNOTRZRDFUWkE5eDRRcDhNVld0cXZ3?=
 =?utf-8?B?TjFuSEUvWDdEVEpqS1JCVkVoUzV6bElxVUN5VGYzcWYyazJYNjNwT1owYlEv?=
 =?utf-8?B?MURHOGppVm1tSlZ6cEIrQmJJTlBlaS83S0dqMFNGWFl6NHVvZzlSWTdHQ3Bx?=
 =?utf-8?B?UDkyOEJEb1V2eWhOVWQrZEhMUWQ5dW9SeUFPNnJpR1IrcmlVMTBoaUhjc1Js?=
 =?utf-8?B?NGlqNGZxTWR1SzRBaGJJVk9BTUZFZDl3cml2VXc1NVNUR3RYdVZhUUMvZG9s?=
 =?utf-8?B?QTJYMTRnZFNZeTN5THIwNVZId01QS3BVQW1DQktuTGdpSEZrTzRMdzAwaHVF?=
 =?utf-8?B?dm5qRFNaaStjTnEyaUJKRnRPZEhGM3UwNVlWYWpKbDZtTnpBQmh4RERHOWlU?=
 =?utf-8?B?U3dWRHRTVWw0emU0Y3cyNEZiZzNhSU91QUxOaFFqSm1IRk1pelRybTZyaWlM?=
 =?utf-8?B?RXE2ZktrTURMTU5wNDFQenR0YWVVdzBjcHJQdVN6RFNDVWg4aWhQZnFKQ1dk?=
 =?utf-8?B?STk2N0VpaUU1SHpJMjQ1Ky90N2ZmK2psaWpXdStRNmFoQU9wbUJrK1EyeTR1?=
 =?utf-8?B?VTlRUnJXb01EWFJtSXlOUlNkTEp4RVgvTU5qRXdiWlpTbEZ6ZzJNc2FaS25R?=
 =?utf-8?B?UUo3U0NQZ1dxY3kzUjFGdk1reXlVRlRpbk1BWjlWWlVvVVVjTEJ4U0djeTZp?=
 =?utf-8?B?cXdHTnJjMnoyVkM3aG90ZlUrczlZcWNobWFyK2V3dVNHWDZNd2ZuL0xaV0Vn?=
 =?utf-8?B?NTUvbnJKUUhCV3BIaEpSYzdRajBkNHJhOGpNazcrYjArL3FUWlB5VGpYd3FD?=
 =?utf-8?B?TFU1NEx3ZFlaamJTeFlsV3NRUFh1YXJnTzJTOUNZMWszVW9IekVDelBTNUIx?=
 =?utf-8?B?cWxzVE1OUjdwVjYxMDJsOXB0NTFLdC9hMmJPMmh2cHhFKzBtVTBiMFhrSS9j?=
 =?utf-8?B?azFhQ0ZnVHBLcmFXYWV1VFVuVkdtRGRZdEtuU0pCNTJWU0lsc3ZWOUJLNWU2?=
 =?utf-8?B?NmtXQUkvU3dwNjBJYk02ajJ1VjNMYmpCL04xQ0o0aGMvb1lDeCtNTWorZlYz?=
 =?utf-8?B?cEwwZDMzUFVWd3AyRWNpUG9yUFlZNFNYYTVCcTBoLzloRm5wNzFiamJuNGcx?=
 =?utf-8?B?U1JYQjVaN3lPMmFTWS9XL2lSQjQyN3k2ZzMwempielFOUFM2dEduYWtxdzg3?=
 =?utf-8?B?Rk8vMDFLWHZZOWdlUnJTR0JXeVVMZXFQaWNpQjZoVXFETXVneVRqS1VmMEpP?=
 =?utf-8?B?cDRMQ0RBbnprMmE0YXc1OHdyM1llQzh0RmsrU1RxM2c0MHBjUk5lbUxFZDJi?=
 =?utf-8?B?QWJYTjlleXBjbkxpMEQvTTVtUVpJeVlQaGlvREdZSUlRdWFQbnJSUTRHejJP?=
 =?utf-8?B?eVd0TmdzQ3FQR0ZtKy9kSGtMbjBWVDVYYWJTN3paNUpoWUZsdTJEaXh2Q3Ni?=
 =?utf-8?B?NnV4WkVPYXY5enlCQlduenliVEFRWDVHc3hucE1hc1lZaExwRDdqT3lvU3Fv?=
 =?utf-8?B?M01sVDcrK3hYTUhrSGtHc3E2Yjcvb2RCaHRUcGUyRE5POXRVVUpBaVdTVldi?=
 =?utf-8?B?dGFKbjhwaUtmVmMzUFhQRzhRWmRtWjExb2xRMXQybnJBN3FwNWh6NTZWbGZy?=
 =?utf-8?B?YXhFMGVQSUdlRURrQjlOT29ERXRVQTRDRncwVGRadFpLaVNWd0x4NTlwaWVl?=
 =?utf-8?B?OU1nSkdiSnN4Y2lQZVI0NGFwNTZUcVRuMnRaeEt2ZjUzaFZXTlc0TU1ONTkr?=
 =?utf-8?B?K1Z5SUo4djcxM09WdFNFQitVYjdPbmhUTDJodlhhSEI2SU84aGw4NVBjMzdt?=
 =?utf-8?Q?TMH7dT2WMR434Bw0w+eyJQnA6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <440E5BD12505DE47A7CACA6119A2D0BC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9b7c2a-d89e-4cec-4766-08ddec6071a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 09:41:52.3684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ie5VithX7ebafkpzXYAuEDh1zUjA6ZKmhbVgAKZ7XiqU8mjNJ3kHwlh3gmGMnyNrb4K2IaL468r2Ru2qsN6jMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6540

T24gV2VkLCAyMDI1LTA4LTI3IGF0IDE5OjM3ICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IFRvIHN1cHBvcnQgZ2VuZXJhdGluZyBHQ0Ugd3JpdGUgaW5zdHJ1Y3Rpb25zIHVzaW5nIGJvdGgg
cGFfYmFzZSBhbmQNCj4gc3Vic3lzLCB0aGUgb3JpZ2luYWwgY21kcV9wa3Rfd3JpdGUoKSBhbmQg
Y21kcV9wa3Rfd3JpdGVfbWFzaygpIGhhdmUNCj4gYmVlbiBleHBhbmRlZCBpbnRvIGZvdXIgbmV3
IEFQSXM6DQo+IC0gUmVwbGFjZWQgY21kcV9wa3Rfd3JpdGUoKSB0byBjbWRxX3BrdF93cml0ZV9w
YSgpIGFuZA0KPiAgIGNtZHFfcGt0X3dyaXRlX3N1YnN5cygpLg0KPiAtIFJlcGxhY2VkIGNtZHFf
cGt0X3dyaXRlX21hc2soKSB0byBjbWRxX3BrdF93cml0ZV9tYXNrX3BhKCkgYW5kDQo+ICAgY21k
cV9wa3Rfd3JpdGVfbWFza19zdWJzeXMoKS4NCj4gDQo+IFRoZSBvcmlnaW5hbCBjbWRxX3BrdF93
cml0ZSgpIGFuZCBjbWRxX3BrdF93cml0ZV9tYXNrKCkgd2lsbCBiZSByZW1vdmVkDQo+IGFmdGVy
IGFsbCBDTURRIHVzZXJzIGhhdmUgbWlncmF0ZWQgdG8gdGhlIG5ldyBBUElzLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jIHwgNDEgKysrKysr
KysrKysrKw0KPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaCAgfCA3OSAr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMjAgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRx
LWhlbHBlci5jIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMNCj4gaW5k
ZXggNDFlMTk5N2NkZDUzLi43ZTg2Mjk5MjEzZDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc29j
L21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVr
L210ay1jbWRxLWhlbHBlci5jDQo+IEBAIC0yMTMsNiArMjEzLDI2IEBAIGludCBjbWRxX3BrdF93
cml0ZShzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgdTggc3Vic3lzLCB1MTYgb2Zmc2V0LCB1MzIgdmFs
dWUpDQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MKGNtZHFfcGt0X3dyaXRlKTsNCj4gIA0KPiAraW50
IGNtZHFfcGt0X3dyaXRlX3BhKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1OCBzdWJzeXMgLyp1bnVz
ZWQqLywgdTMyIHBhX2Jhc2UsDQo+ICsJCSAgICAgIHUxNiBvZmZzZXQsIHUzMiB2YWx1ZSkNCg0K
c3Vic3lzIGlzIHVzZWxlc3MuIERyb3AgaXQuDQoNCj4gK3sNCj4gKwlpbnQgZXJyOw0KPiArDQo+
ICsJZXJyID0gY21kcV9wa3RfYXNzaWduKHBrdCwgQ01EUV9USFJfU1BSX0lEWDAsIENNRFFfQURE
Ul9ISUdIKHBhX2Jhc2UpKTsNCj4gKwlpZiAoZXJyIDwgMCkNCj4gKwkJcmV0dXJuIGVycjsNCj4g
Kw0KPiArCXJldHVybiBjbWRxX3BrdF93cml0ZV9zX3ZhbHVlKHBrdCwgQ01EUV9USFJfU1BSX0lE
WDAsIENNRFFfQUREUl9MT1cob2Zmc2V0KSwgdmFsdWUpOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJP
TChjbWRxX3BrdF93cml0ZV9wYSk7DQo+ICsNCj4gK2ludCBjbWRxX3BrdF93cml0ZV9zdWJzeXMo
c3RydWN0IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cywgdTMyIHBhX2Jhc2UgLyp1bnVzZWQqLywN
Cj4gKwkJCSAgdTE2IG9mZnNldCwgdTMyIHZhbHVlKQ0KDQpwYV9iYXNlIGlzIHVzZWxlc3MuIERy
b3AgaXQuDQoNCj4gK3sNCj4gKwlyZXR1cm4gY21kcV9wa3Rfd3JpdGUocGt0LCBzdWJzeXMsIG9m
ZnNldCwgdmFsdWUpOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTChjbWRxX3BrdF93cml0ZV9zdWJz
eXMpOw0KPiArDQo+ICBpbnQgY21kcV9wa3Rfd3JpdGVfbWFzayhzdHJ1Y3QgY21kcV9wa3QgKnBr
dCwgdTggc3Vic3lzLA0KPiAgCQkJdTE2IG9mZnNldCwgdTMyIHZhbHVlLCB1MzIgbWFzaykNCj4g
IHsNCj4gQEAgLTIzMCw2ICsyNTAsMjcgQEAgaW50IGNtZHFfcGt0X3dyaXRlX21hc2soc3RydWN0
IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cywNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0woY21kcV9w
a3Rfd3JpdGVfbWFzayk7DQo+ICANCj4gK2ludCBjbWRxX3BrdF93cml0ZV9tYXNrX3BhKHN0cnVj
dCBjbWRxX3BrdCAqcGt0LCB1OCBzdWJzeXMgLyp1bnVzZWQqLywgdTMyIHBhX2Jhc2UsDQo+ICsJ
CQkgICB1MTYgb2Zmc2V0LCB1MzIgdmFsdWUsIHUzMiBtYXNrKQ0KDQpzdWJzeXMgaXMgdXNlbGVz
cy4gRHJvcCBpdC4NCg0KPiArew0KPiArCWludCBlcnI7DQo+ICsNCj4gKwllcnIgPSBjbWRxX3Br
dF9hc3NpZ24ocGt0LCBDTURRX1RIUl9TUFJfSURYMCwgQ01EUV9BRERSX0hJR0gocGFfYmFzZSkp
Ow0KPiArCWlmIChlcnIgPCAwKQ0KPiArCQlyZXR1cm4gZXJyOw0KPiArDQo+ICsJcmV0dXJuIGNt
ZHFfcGt0X3dyaXRlX3NfbWFza192YWx1ZShwa3QsIENNRFFfVEhSX1NQUl9JRFgwLA0KPiArCQkJ
CQkgICBDTURRX0FERFJfTE9XKG9mZnNldCksIHZhbHVlLCBtYXNrKTsNCj4gK30NCj4gK0VYUE9S
VF9TWU1CT0woY21kcV9wa3Rfd3JpdGVfbWFza19wYSk7DQo+ICsNCj4gK2ludCBjbWRxX3BrdF93
cml0ZV9tYXNrX3N1YnN5cyhzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgdTggc3Vic3lzLCB1MzIgcGFf
YmFzZSAvKnVudXNlZCovLA0KPiArCQkJICAgICAgIHUxNiBvZmZzZXQsIHUzMiB2YWx1ZSwgdTMy
IG1hc2spDQoNCnBhX2Jhc2UgaXMgdXNlbGVzcy4gRHJvcCBpdC4NCg0KPiArew0KPiArCXJldHVy
biBjbWRxX3BrdF93cml0ZV9tYXNrKHBrdCwgc3Vic3lzLCBvZmZzZXQsIHZhbHVlLCBtYXNrKTsN
Cj4gK30NCj4gK0VYUE9SVF9TWU1CT0woY21kcV9wa3Rfd3JpdGVfbWFza19zdWJzeXMpOw0KPiAr
DQo=

