Return-Path: <linux-media+bounces-31151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3EAA9EAA1
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 10:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A62F33BA40B
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 08:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEE725F78D;
	Mon, 28 Apr 2025 08:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ivnqQpbZ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="EplOzB/1"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA11E25DD1F;
	Mon, 28 Apr 2025 08:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745828388; cv=fail; b=i0PzDejaDAKX/OypsRar+8PdRXiJI63/mH7MOOcKnpdrgCbrcA5f58WiCRwpPEgCKFkPOYQeyYCQmp9a8p96GVJw9cF526U9N08o7QoTv/Qbq888x6pIfIhoHG2/WFhchD9rOqtzWp4rM4CLXbWwl+Uqy1fPts1YN4kZsLcjZSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745828388; c=relaxed/simple;
	bh=YDb2e/egU5w4mLt1Y2Jnxs0Pg96j/BDUiBm1WdbHp+M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DRUl/qa63PvFXODRJg9dmo2t1y+ryztK12YyX8mbZhN3E3kB3Wph0vKSwR7y78x1e1QYpsKnjU+4q5ngoEw6n8scnKNFIRrNI4kTU2BPJriDsn/EzZDqdIpmXiOnRNe7sO8WM30mZN09YUzIAKe8zQbI7hmYrQ5sofaSLjIbHTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ivnqQpbZ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=EplOzB/1; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 886a2e74240911f0980a8d1746092496-20250428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YDb2e/egU5w4mLt1Y2Jnxs0Pg96j/BDUiBm1WdbHp+M=;
	b=ivnqQpbZgXWdnbH2COIGDrjISq8U89+uLJ26sg/smnEwMNP4b7MOumLpIGHpC4bGgiOIq58Wgn8NMdKuFZOWBL71tjDa7YFvSmBZi240JoshGb13lNcAxlMFCQWY5qtQFygws6nc3gIUunuHCKcFgShOrDy/YO+MjCriWr60VKk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:0b1c9fa7-e3e1-42f7-818a-7f3693d37f79,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:5192b2f0-ff26-40e8-a637-f0e9524b171a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 886a2e74240911f0980a8d1746092496-20250428
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 795279004; Mon, 28 Apr 2025 16:19:41 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 28 Apr 2025 16:19:39 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 28 Apr 2025 16:19:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwAShC6Gg5yo5ZECO5psBrP0rnn9JOQLn7qsz071rNOwtCVhYtfCKbMA8xokYvTLvDZiBGyVv4dU7iqtEsviDwLvQmAMt7Sdvhf6KLVvA1LbepACa58X4EcnB0c8CWxhky29HDOuv8wJroJzCmskB1NBmmG8HYGRiEOTeB6LAtDqnR1SXKAEZdpp9p/tNfOtN8ws6XcyCy4F2Vay6wQct/WjGV2t9gjUBdBZ7IbgYfM7ruJ6rjrvEQJ13bmIfJ/R9DMF4y+oWxUjj2oqEl5R5a7NvmOL7lcyZ0+u2t6BtnN+9rfecsx3jlhUqC3yr0RLhnVYq+E7xTI/yHDooyv/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDb2e/egU5w4mLt1Y2Jnxs0Pg96j/BDUiBm1WdbHp+M=;
 b=QG5ACadRxtEWjIAeq9PbcaJ3nqj9r55hFzXK9As9AxPwJvYOVruSOUc14ncJtGKdP8IlbWLBBYUkXthO31W91am852ifggYYyq4+8lwC4ncRFCZer6Wi8ATngd5EdgzKzAMdbTPk/hH8r4fUGOZI+G0uel39Dz+mOqhe8f0jyKOedcG+vOXbo2Xcf2my0Iljt/sm7k6P0cY2tTUEoYqyt2g8r08NCHuB2nA6QSOGKWVkVz0K8+LIFJtIU+X81hOuN0sikMEvL81eHzDMQ6loSqYJnRfDLG02ABzCt6l6hhi2sppC4/INu5vNcQ2KB2nwHM+Rm+tCAUx20gGMFMmvVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDb2e/egU5w4mLt1Y2Jnxs0Pg96j/BDUiBm1WdbHp+M=;
 b=EplOzB/1PxsMhFDGbnA/mMgLGATz7yd94zeokRiJRxhpICBukKeAOlFoSfOHkCiJ9gBJ7DZ87GH7yX3t/42V0AWMCvyjy1ENwASm8/J6mPHBLdrSCBQqiXsqU+O9YXu6bh5xZjwFUul168j5Ai+72DiS7cXEPsIcKoEbCkLabDs=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by KL1PR03MB8449.apcprd03.prod.outlook.com (2603:1096:820:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 08:19:35 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 08:19:35 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: media: mediatek,jpeg: Add mediatek,
 mt8196-jpgdec compatible
Thread-Topic: [PATCH v3 01/12] dt-bindings: media: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Thread-Index: AQHbtb+Ip9hi9FnUgUW7BFGiHpfbe7O4rBmAgAAU8wA=
Date: Mon, 28 Apr 2025 08:19:34 +0000
Message-ID: <5b6e70181b417f1b25df6fc1838b0ad600e29e9c.camel@mediatek.com>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
	 <20250425085328.16929-2-kyrie.wu@mediatek.com>
	 <20250428-ambitious-deer-of-plenty-2a553a@kuoka>
In-Reply-To: <20250428-ambitious-deer-of-plenty-2a553a@kuoka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|KL1PR03MB8449:EE_
x-ms-office365-filtering-correlation-id: b33fb1de-7dab-4e9d-b711-08dd862d68fe
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eHFVODBSTHphQktneFNJb0o5VC94Y2ZuaW1MNVZoNFBKTTlaR2hEUHpVNTdB?=
 =?utf-8?B?ZXQwejk4bVlpRGlyNm5ZZndaQVVBUk82M1RGQjg5ZzlXSERvWXZWdnpyZXlL?=
 =?utf-8?B?WFR4QmtJeEFPZmNZOFZhSWgvL3VvdmlUTDNkRVF2MUZSUzR1ajEyOGJCa1Rr?=
 =?utf-8?B?NUdocWlud0Q5Y3VjZGxoL3RJQVVObEVUUThTbTg0dXFCN2RvRGc2YytndDRG?=
 =?utf-8?B?MWhhQTIwK0RNUlNUZDZ0dGNHaEoydGdOZ2d4RlNTQmdNcmZ1NS9mNjdOM0dZ?=
 =?utf-8?B?NE45MnZvSVVYbnVvOXpLVzNadzgwZTVTdlNyVWpaS2VibmlBd09jWGRoZFpK?=
 =?utf-8?B?L0tFbXR5b2JoTlU2WUVmcUNieXlHMFhCVjJPenY0MlNIVUdKMDFRMEM3T2U5?=
 =?utf-8?B?djJaYktVN000b3BBMy9VSkwzcXh1V3k1cXJqZFEzNGhUK3lmeEtZeVlnbUdu?=
 =?utf-8?B?bERCRlNqdzh2cHlKM1hHYkQwanFJUzhUTVJBQmhEeFJySzZWV0xpVFd2eU16?=
 =?utf-8?B?cDFzdWVqV3J0eFFyelBLQzJVZG9HVFlwSVpFNlQ5ZXowbURkUm02eEZURUdt?=
 =?utf-8?B?VUwrZXVuZUx4MVRFZ2NmY0VoS0xLM3ovRW82d2tvcVFPa2dSaU9td2FDMlFT?=
 =?utf-8?B?VGp2Sy90eG14K2xkT2dYbGdva0hVNXNZZXhTbzA0Yll3V3pidEVNdnQyd1VM?=
 =?utf-8?B?Q05LK1Z1NjN3M1F1bHQxbXZ2ZEkrR2I5V1QvUVU4SE9ic0VvZmJqT1NRdGUy?=
 =?utf-8?B?YkVhbVFKTlpvMnVGMmhIY3JOVU5mSzA2MmhJTWpaVmNkK1JsT2dCb3VtR1Fv?=
 =?utf-8?B?N2ZJNXhaZkZaU1pnbUFyT1R5M3o2cGh4U1BYTGp0NmVqdmtPekNWWHMrUHVy?=
 =?utf-8?B?TUg2emxjU0ttRk1HWHh2anp2SmxwbXpmeVBCcEJsNXVpamJETTdQQmM1ZDZW?=
 =?utf-8?B?SXF4aVQwTEJDbG1zZG1HMTZZV0RyajFob1A1Ly80YW50ZFdkVWxheXp5bElk?=
 =?utf-8?B?RUNQbExmSWFQRkRjTDRod040alV2VnB4T3NRZjR0KytmdHVrWkhhZk16MGdo?=
 =?utf-8?B?NjBmMXFicnJwUW5Nci9uYTAxTUQwWHNCY1NjdjNGejVvZXJaaGVYb0kvVzdu?=
 =?utf-8?B?SzZYcWVJcXZVblZPbXUySUVCSEc4ZWlKakZFbHkzcFNKNitUcUNuMnFkSkZE?=
 =?utf-8?B?ZmZlSnc3M2hvYlVsWDB2RjhNRVlnNU5Wc0Q1UklGM2xUY01nYzVYMmNoQStI?=
 =?utf-8?B?RkE5dnAvNGFFaktEUFo3RTJWV0NaUmY1cWJQZk1RTktPdGJKM1JERG5URE1P?=
 =?utf-8?B?aHU2cjhCY3lLRDB0RmRBNmNFS1pJcko4T3MrTjRtVm1VTHdCeHlTWWZEUzNo?=
 =?utf-8?B?VkRORHpCaUZxZXZoWGlYWUlpanJaU1kxNXFHY3k4VGtMWWsyRW4zUDhPRUhG?=
 =?utf-8?B?SUdIWUlWaVBxbDNlczE2UHNVcjNxQS9aNXFvOXJvTmltT0t0S3hhR3ZWcnpP?=
 =?utf-8?B?N2F1MU51SWM2OE1JK2JMVUdNUWM0ZW9hdmhXQ2phNTJzcGNuM2Z6QWxXOHN1?=
 =?utf-8?B?NW5sdnVsT2VFK0R0aEZ6Wjl1K3ZCeW1WclNwMTU3cStqM05yOUFSN2kzWUJP?=
 =?utf-8?B?SmcrSkY3VnMxSEJTa0R3SUhJQkZnamxwSGNSQjdSRGJ4N3NISkszRW9tMm5L?=
 =?utf-8?B?NVlYZ0gzejhlTW42SEhpQ0x0a3pXc2JIVWMvZ2NUSHFBMVdRU1FXTVBEUzdi?=
 =?utf-8?B?Y3VsLzFIbG5rTlZPVDZ0dGZzazllSTVUOFB4TjZSZjRpUTVWWDU3d0lYak0v?=
 =?utf-8?B?RTBIVzlTTGtXTjhtMkJEZEpYdHhhWjdEZ01GcFJTM0hWR1NWelVTTkpoK2cx?=
 =?utf-8?B?d3o2TE5yOGRIOXVSQzUxNW9MbzRYVjI2cUVzeWZ0RC9pazlrZ1k5QllTZU5n?=
 =?utf-8?B?M0ZrbXhNV2lES1pyV3Y1UXBhbTkyM21UVk4zRDVwdkF1RDQxZEtjMnkxV3JM?=
 =?utf-8?Q?jheyoY9cnG6gZLLM0fnDj+S2G8Rakc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTErUEhjdzVpa0JTSzhOSFpHMStPQjBYREZPRFJ2YVQ4MUE1S1I5dTRzME1O?=
 =?utf-8?B?alUxeWMrYjBvWU84UWpBRVR1cUU3cVhtbzFJUXpCNGJrdTF5S0FpbnVwdGVa?=
 =?utf-8?B?SUNEM25zYi9ObkRiUzRIVTF0Q3BrOUdQSDNuSWd2RW9tQ0R2QklhazQ4YkYz?=
 =?utf-8?B?VDJ1UHk2QXpqT1NPU2NsL0dDZTdBQVcweW01Q1V2Vm5Wb1JvSTlIWThxdzQr?=
 =?utf-8?B?Q2cyc0dKUlRiRFRtZmE4dFFGbzRCYkRtL0I5SnE2TWhOb2R6S3BhWjhpV0Jn?=
 =?utf-8?B?clF1NVhqZEU3NkluZEtMQlBTNkM2b2RmbjBsMXh3K3FJc1ovUnd1R3R1NjV1?=
 =?utf-8?B?Y0VTaGNJV2VoR3VTYThiZXU3RGIvVEdNT0MrZW5CZnVqLzVPY0g3YjBkcENH?=
 =?utf-8?B?cW1KZ2h0MmcvaU91WGVrQ0tLMDhMemVTV3J4VzZOci9nS1BNbnN5RTJ2Tk82?=
 =?utf-8?B?MGd2RlF6ZUk0NTBuTDZIUEhzVCtpWU9uZkNOaE81c1F5RlR6SkJ5cFFkNHdR?=
 =?utf-8?B?T01VNjBhdE9Gbjd0L0ViOEZJekI3b2dVYWFRQWd5UlpXcFVLRzRmSDcyTFEv?=
 =?utf-8?B?b3ZYTjdseXozRkNPOEFVQ29mYXVaczVLa1FYVEpDT3lxeTVzVDg3c0NhUmFM?=
 =?utf-8?B?Qm1KSmhvbzdpNXIrR2k0V0lZR3NWbnhlRlJTVDRaenZndk9hdTJpdjVoOXB4?=
 =?utf-8?B?aVJSQmg1LzlJS1dHS1A2azVxMDBuU25rS2QreWNKY1laaWV3YjdtbjU0dllW?=
 =?utf-8?B?bEQ4RG0yWTZhWldMTVNDWjRqRDFxYXd4UEgzdVAxTUZqSTZLUTdrd085bkxT?=
 =?utf-8?B?NXdWTXc5anFOOGh4K3c1c0VaMVd5cHNiNUFza1BNQ1Bwc3YxNzNDNXhRZHFx?=
 =?utf-8?B?aHNaeFZPYzNSeU9rT3Q2V3Erb1lia3UxbUVuc1praFgzSFlPa1ZMbnhlV0Er?=
 =?utf-8?B?MkpjRTJBTFpZeXF4WjgxSjhnRGtJMFVBZU5ZVTN6Z1hTRG1YQUxoc3Jaci9V?=
 =?utf-8?B?QzA0cE55dkl2d0JRSE5PbWxiUEtBUjBkNUxHTGtEZmVjYmhzNzQvbkN3cXR3?=
 =?utf-8?B?c1YwMFJSMEF2V2UxbzBkQlMrU1NFTUgxWTZHV2g2MXdWejhlTGNMb1VrcVUv?=
 =?utf-8?B?MENYTXc0aFdKMmNNWDlpcDZvczk5ZlZuQS9WMjJIQVZPNThFcWR2WUNUeWY0?=
 =?utf-8?B?TE9mT3hsazdYOUpvTVRvTmtSWFlKNk1xWHVsSnZoanR1bEpKK010TFhjSDFx?=
 =?utf-8?B?clh2bzhYbVJjRnBSMmNjYVhOdkRySjgyckkvMzRrYWpZVjJPVHB3Zy95dEw4?=
 =?utf-8?B?KzdpcU1ieTlTYnJ3eVZzYlhIWHRjcGMwUGlDQzNYMmppdmxzOTAwUEgwY21T?=
 =?utf-8?B?RDdyem9UK2NaVXJYeTFrVlA4MVZxYlh5ZFJQYnI3bDVCaGZrNnRxWXlCZHZy?=
 =?utf-8?B?ek15ZXBEdUNYV010OEhiTUcxc3oyVFZ2NzNDM1pGUC9RYW9CcUpSdC81V0p5?=
 =?utf-8?B?ODRJcllKTmM4V1Z4ak9MZ05DdzczZ0pWTU5PMVI1Snp2UlY1LzZjUFF1SE5T?=
 =?utf-8?B?TG9vc2tiYndxelA1eWdQc3p0b2dKMXdMYUh2VVF6Z1lISlZ0TU1qdThTNUFN?=
 =?utf-8?B?bFpDbnBBQ1paTTJBaU1PM2x2c0ozVmx4R2pDaWkrc1EyRGRGZjhYZXZFSWNO?=
 =?utf-8?B?SHdUVDRtVENiaGxCT2pqVTZORGwzNVh0S2puVlJGT0UvMENxcDI1bmhqV2x2?=
 =?utf-8?B?LzNWaTB1ZGN3WVFpOWxOWGhhWnA3UStlUThtcDFucjI2ZVhrZ1FheTdJeU41?=
 =?utf-8?B?OUVnSjR1ZTA4OWlzSGhESFdGT0dQOTg1bUdvdVkrdHA3MzVyWEJIYVN1eU1a?=
 =?utf-8?B?bURKMnVkd2pGLzlpbnZBdkI5cFA0MmFobkt0WkpHdFdDc3h3UFdPMEpmYjU1?=
 =?utf-8?B?QjF0bzBaMThwNEVlMHZGaTliRjMvK0puM0NQTlByK2lEWlAwaWJBUWFBcTd6?=
 =?utf-8?B?OHFWbm95MCtrN2twUHIrdjkyV1RlNVVqVnVOVUpVVmtWR2lTWTB6T2N4S1hv?=
 =?utf-8?B?QUFxWHN6Vjk1SXZNcFNna1MycUM0K1JlZ2Q3Z2M4KzdOZ2d3bUxVZE5yWUxH?=
 =?utf-8?Q?eOEllrKUZmqsG9i8nHnymTzVD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <425888CF2FEFDE468FF1D803F93022D6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b33fb1de-7dab-4e9d-b711-08dd862d68fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 08:19:34.9159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9TTMS6T582Q+5OLip6GTWl1mtww20sKmOS6skgIBWrjv3WBGfZOnY8efBbP72qhhh5e2f/s+NLoFBFLv5m05Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8449

T24gTW9uLCAyMDI1LTA0LTI4IGF0IDA5OjA0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgQXByIDI1LCAyMDI1IGF0IDA0OjUzOjE3UE0g
R01ULCBLeXJpZSBXdSB3cm90ZToNCj4gPiBDb21wYXJlZCB0byB0aGUgcHJldmlvdXMgZ2VuZXJh
dGlvbiBJQywgdGhlIE1UODE5NiB1c2VzIFNNTVUNCj4gPiBpbnN0ZWFkIG9mIElPTU1VIGFuZCBz
dXBwb3J0cyBmZWF0dXJlcyBzdWNoIGFzIGR5bmFtaWMgdm9sdGFnZQ0KPiA+IGFuZCBmcmVxdWVu
Y3kgc2NhbGluZy4gVGhlcmVmb3JlLCBhZGQgIm1lZGlhdGVrLG10ODE5Ni1qcGdkZWMiDQo+ID4g
Y29tcGF0aWJsZSB0byB0aGUgYmluZGluZyBkb2N1bWVudC4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBLeXJpZSBXdSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiANCj4gSSBnYXZlIHlvdSBh
IGxpbmsgdG8gdGhlIGV4YWN0IHBhcnQgb2YgZG9jdW1lbnRhdGlvbiBhYm91dCBwcmVmaXhlcw0K
PiB0bw0KPiByZWFkLiBJIGRvIG5vdCBzZWUgaW1wcm92ZW1lbnRzLCBzbyBJIGRvIG5vdCBiZWxp
ZXZlIHlvdSByZWFkIGl0LiBJDQo+IGNvdWxkDQo+IGltYWdpbmUgcGVvcGxlIHNraXAgcmVhZGlu
ZyBlbnRpcmUgZG9jICh3aG8gd291bGQgbGlzdGVuIHRvIHRoZQ0KPiByZXZpZXdlciwgcmlnaHQ/
KSwgYnV0IGlmIEkgZ2l2ZSBkaXJlY3QgbGluayB0byBzcGVjaWZpYyBjaGFwdGVyIGFuZA0KPiBz
dGlsbCBub3QgZm9sbG93aW5nIGl0LCBtYWtlcyBtZSBmZWVsIHF1aXRlIGRpc3NhcG9pbnRlZC4N
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KRGVhciBLcnp5c3p0b2YsDQoN
Ckkgd291bGQgbGlrZSB0byBhcG9sb2dpemUgdG8geW91IGFnYWluIGhlcmUuIEkgYW0gdmVyeSBz
b3JyeSBmb3INCndhc3RpbmcgeW91ciBwcmVjaW91cyB0aW1lLiBJIGNoYW5nZWQgdGhlIHN1Ympl
Y3QgZnJvbSAiZHQtYmluZGluZ3M6DQptZWRpYXRlazogWFhYIiB0byAiZHQtYmluZGluZ3M6IG1l
ZGlhOiBtZWRpYXRlayxqcGVnOiBYWFgiIGluIFYzLiBUaGlzDQpjaGFuZ2UgaXMgYmFzZWQgb24g
eW91ciBwcmV2aW91cyBzdWdnZXN0aW9uLiBVc2UgdGhpcyBjb21tYW5kLCBnaXQgbG9nDQotLW9u
ZWxpbmUgLS0NCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS8sIG9idGFp
bmVkLiBCdXQgdGhpcw0KbW9kaWZpY2F0aW9uIGRvZXMgbm90IG1lZXQgeW91ciByZXF1aXJlbWVu
dHMuIFNob3VsZCBJIGNoYW5nZSB0aGUNCnN1YmplY3QgdG8gIm1lZGlhOiBkdC1iaW5kaW5nczog
bWVkaWF0ZWssanBlZzogWFhYIj8NCg0KQW5vdGhlciBxdWVzdGlvbiBJIG5lZWQgdG8gYXNrIHlv
dToNCk1UODE5NSBhbmQgTVQ4MTk2IGJvdGggaGF2ZSBtdWx0aS1jb3JlIGhhcmR3YXJlIGFyY2hp
dGVjdHVyZXMuIERvIHdlDQpuZWVkIHRvIGNoYW5nZSB0aGUgeWFtbCBmaWxlIG5hbWUgZnJvbSAn
bWVkaWF0ZWssbXQ4MTk1LWpwZWdlbmMueWFtbCcNCnRvICdtZWRpYXRlayxtdWx0aS1jb3JlLWpw
ZWdlbmMueWFtbCc/IEluIG15IG9waW5pb24sIHRoaXMgaXMgbW9yZQ0KYXBwcm9wcmlhdGUuIFdo
YXQgaXMgeW91ciBzdWdnZXN0aW9uPw0KDQpUaGFua3MuDQoNClJlZ2FyZHMsDQpLeXJpZS4NCg==

