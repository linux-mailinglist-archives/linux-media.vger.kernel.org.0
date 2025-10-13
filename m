Return-Path: <linux-media+bounces-44270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33596BD2C73
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 13:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D892C3BE8B0
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 11:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D902609D9;
	Mon, 13 Oct 2025 11:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SfqasNlv";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PVFKs5Rx"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A09F258ED9;
	Mon, 13 Oct 2025 11:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760355005; cv=fail; b=fQyPdRkKwh+kwSIWqUsI71uOJdhASF+cj4G/3+DC+lUEeMkKVl/cV8ahVQuUdLHIUd93DC5Qxw6uG4TG4VRdjUSGrKuiuBe/Mlj7vprS76MlGDAQj4twyi6A1/O13pbeY6MOBEiFPh1HJZBeXgEwnaPH8abmr+1kX6jfESMuQiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760355005; c=relaxed/simple;
	bh=OGxhfRM36J12MrNqN7mB11IMTCAzs2Kp30iB7v1l0GM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B6WeQEedPJKEKTj56t9K5OI1BPQK/0OqIqNiGzmKM5YS/UyVsnyKQDxcZapPakZcbLoD7e8c8VqTv6RyxYNwBjRdfpSRRXf4Ek8k7MOjkZ6r7pnOMaF8wnVP6B3u4voRMinEzUOBFI+5nYxN/TAwjzm4A1v9XYEg4QugyzWOO0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=SfqasNlv; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=PVFKs5Rx; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f14ba1aaa82711f0b33aeb1e7f16c2b6-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=OGxhfRM36J12MrNqN7mB11IMTCAzs2Kp30iB7v1l0GM=;
	b=SfqasNlvV7cSy4kOkaGFR9mZhOmCbWSOknVlRl39zN96eP6FKeA/78uOkvlAxgzPG7VGhn9QaUHatH8kc9ZmlYySxJ83dFgp+mU4xazFfzO7bZmMQiOpIfrjHTuZ/4mgZvOZZxxF8oeCDZBcWNumPcdfkEoRRZz3a9d/XeYYlZs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:d1452fd8-6317-45a1-b7b9-6ad4420629d1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:5a7c1cb9-795c-4f99-91f3-c115e0d49051,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f14ba1aaa82711f0b33aeb1e7f16c2b6-20251013
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 558316927; Mon, 13 Oct 2025 19:29:55 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Oct 2025 19:29:54 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 13 Oct 2025 19:29:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hzn4casXbh/0YDPmtETZLc4ft7oBcjP+YNWJBcKaJk1IUt8FrY5OUk0UT4t8PchUogocHyoa0au+4jiSTiWhAlyoI4iPWsdi4NWqqve2B/K7gSgVHRLZUlOwIpR4xqqnT49Gr4V4KMOk/kj7V96SwJrL88StV/kLahF54zPr4tSEwVVDVGxFEPHCh4qvQx/AsUL7qGGwGy8E9PEOaWJN3VHBZpQiUBiP64lVWHpvBH+cpDmVsc4RM5WdfaPA+hAr/L0SXQhzfSSaTPPgq0pRKpSa5OsSXFs4Mm3gyKzviasxlMO957TdKa6S3/VDJ75j4CMotbMpfUFBVMwydt0MMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGxhfRM36J12MrNqN7mB11IMTCAzs2Kp30iB7v1l0GM=;
 b=bLdi8FerTPUpJoEpQlrwwHND975SWzXbMs4MzdkuNE8a2BagtLqgvtbBLMaKkaKT7jXKhOIrB+IcLWXyWvwNjv0ZgB73c64L0Qj1aR+Ow+QYyYSyD2ac5LN6ppNQUELWQDWVhF7oWT350JjtTLJqfGPfZC7cV/QYIoyPzzw7mSxfS5J1WpBkqNsYNPHUvgeviiQ02hzUJsAtny5ng5+a4ak/pvYOduw8WJUkHeevCoBHLopWFRcRmy26etQMujgBGy/kw2GFnq4bVXQ8i61upZeghc8BbNkTGFJkmLSXvci9JvMjcknt2JHunfNXEiRcEqZKSMS8UDFOQ2VF/wqrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGxhfRM36J12MrNqN7mB11IMTCAzs2Kp30iB7v1l0GM=;
 b=PVFKs5RxSGZmBZMrW5/8DiShGLeEf5v4LrwynzXUXrzfclozoEjlHyRUdymaQvtgxd38FmoZsk988uhx0vtxc7oSRQWGXcTuIBG5JSp15GDR+2AHgOyC8XGZAGc3ptu8Z6TB4lEbbX/afu7V5iiUIX7e+ihPTD1H/H97JCmMylE=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYQPR03MB9512.apcprd03.prod.outlook.com (2603:1096:405:2fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 11:29:50 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 11:29:50 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
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
Subject: Re: [PATCH v7 13/20] drm/mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Topic: [PATCH v7 13/20] drm/mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Index: AQHcORN3ORivfWNQoEe2BtEW2ICrXLS/9zeA
Date: Mon, 13 Oct 2025 11:29:50 +0000
Message-ID: <41434fa60f587291cf5b98f7e385dc3a9360e6e3.camel@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
	 <20250827114006.3310175-14-jason-jh.lin@mediatek.com>
	 <6690e20f-f88e-4c5a-8188-4d2a941fc6b1@collabora.com>
In-Reply-To: <6690e20f-f88e-4c5a-8188-4d2a941fc6b1@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYQPR03MB9512:EE_
x-ms-office365-filtering-correlation-id: c5b61302-f654-483c-3b5e-08de0a4bd2af
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WU4vQjJpdHdsNDBlUjNDdHR6bDBncDlPSUQ0VTVDc2FIM2dISlFtdXFVZXJC?=
 =?utf-8?B?K2NreWNhbHJ4WEdGUFJodW10aGcySzdkclcwMmhReWxsUTUwZEpjbEtaS05O?=
 =?utf-8?B?WE1Cb0tlbEhCNUFMRGVCRFMzazVFKzcrVTBUcS81c2JoZnZIM0JaTTJ4b0dy?=
 =?utf-8?B?ZkJwSVRucHlSWUdyRG4veFYvelZoWjVIR1NYMTh5cVU4dlFmYkFuRzdSNXJN?=
 =?utf-8?B?blhyUkZTQm5GSlBtNllqTEZxdS8raWNLWFdLdEp3bkpzdUx2Q1lRdGgzLzFl?=
 =?utf-8?B?c3BBZHpUeExwUUNqL0VWZlRRZHBvYzdlQUE5ZzF1bVdTUHZXTlArL2ZXTTQ3?=
 =?utf-8?B?MTJxMTFDcEpFYjJJVFB5UEtwZm5LaHV6NVlXY2JZeExhR3pQNXFiamVDUVlo?=
 =?utf-8?B?SHlXemV6a0RxWjhNNmFQVWN5K0tMcytHOThWYzBHeGpaWGZlK09hcWlJa0Z6?=
 =?utf-8?B?eXhwYWs1YTBrU0c4RmRuTkRFT1g3SEYrcFdxZml4b2ZPQi9Gb1J6K0lMUjRE?=
 =?utf-8?B?NTg4UWhPajlYa3V5Z0RXTk9nTlVIVnVGS2JiZmd1MWtHUE0zRmxCdFZ2Qm9O?=
 =?utf-8?B?NDlabmdPZXpqSjlrYUZCa29OQnh2aU1vbDVSa2FwdzBXNUlLQ0tNTmhCZG9Y?=
 =?utf-8?B?a1p5RjhVdzQxY0FBaC9YeVRybUJnV2VTS0tCcXB1bDZ2L3ZDQm9hMCtWelFZ?=
 =?utf-8?B?ZnIwQ2MzNlN3RlV4MEV2YnFreEV3c2ZTNVRhc0VKTEdvM05CUW5IQjIyNzdP?=
 =?utf-8?B?aDEzeDdRNlpjWFBOMVNkRUJTZ2xieDlWNkRSZnRCVnlheFF6ZjA2anpIOVpQ?=
 =?utf-8?B?RFh2dXVYRVdzbjJ5VG1CL01JNm5qT3phdFRsMXJEL09TMmhMQkZBTmVTMFFr?=
 =?utf-8?B?WXpDUER3OHgza21UU1ZzYVJaNE9aTi9nZXZUblBqRXNnaGU3ZjZ3eDFoQnN2?=
 =?utf-8?B?TzhlYSt2RVBmRFhLMEQ4bmtUblMyeHdRcmhqbGVuNS8wWU1ld3VrcTlVMVBN?=
 =?utf-8?B?MCtnS01sZkNEV2NNU2gzMWNqRWQxWWtYRTdid1JQQ3J3Q1JaMXBNTFhVZThP?=
 =?utf-8?B?V2NLb0FkelNDNHh2dkZMWityQ0cvNXpmYVJxN241VWFObGJLOXROWGtCSk5o?=
 =?utf-8?B?L0wxUnRtbUZtT0QyeDU4Wlg1RmE0TENYS2JHTW45d1pqSDdZUTVMNlU0SkxW?=
 =?utf-8?B?c0JnQnJ0L24yVGRTaFdqYkNycWg0T1J5Sy9PZmpVWXZaSmRVd3hzR2J3b0Fo?=
 =?utf-8?B?Ymxtb0V4NytKSDUxeG5Mdi9DbU10c3dsMVRjTHg3MG5rcW8rRHI4Nlh6OFZ5?=
 =?utf-8?B?bURjdDkybUlTYUVZNEhZamNOcXpxOWlNWmdBK1ZJeGdJUmJZV0lTbnc3Qk1M?=
 =?utf-8?B?dGJNMTdWV2xvMDRnTmdFQzV0dHphRUEvcHFhMkN0VnJRMllERXVKYk8zakRq?=
 =?utf-8?B?WUZzVmZaVnNuM0poMXhSOFpKQU5Wc1FCNGRycTROZ0lYdUJtUkxGYnBwSHhR?=
 =?utf-8?B?WXRtR3NTbU5XQ1hZY3FBMm5vVHNlSUhzWGZRVHFzeGJjYmZBMWJ2M3VlTUMz?=
 =?utf-8?B?TGNOZEg5NEN6NHBtM0ptb085KzBSWDVMd2F0ZVNaOUEzR1VOUkcxdEdxNENQ?=
 =?utf-8?B?Smthd3JVQ3RJcEVIWldwaVVOZDN6b28wNFo3a1ZBU0F2YU5BOGFyRFdtZzky?=
 =?utf-8?B?d0VqdURFZXN0SVNxandZc0k5NG92cWI3bCtrdmFsRDZmaVlhYngrbGlkcC9Q?=
 =?utf-8?B?NkZmOWczdnB4VnNaWVVxTFZsZTJWMXk0TGtMRUQ1OHhZT0UycHNrc3Y5dmJ6?=
 =?utf-8?B?NkVEYVBDRXBEb3pYTnYrUlhucjR3SWExSVp5QldHTGRiUzdUNEpXaS9mZnI3?=
 =?utf-8?B?UEZUTFo1OWtuSTMzYk5GS3pwRU1FTUpUblJPS3prRnFjSGFHUmg2NWZrNjdL?=
 =?utf-8?B?ajJHa0R3WUovTUpMWC92bG16dzZOSHEwcWRHcjdkNi8wZ1Qxbk5GUDJIdlpo?=
 =?utf-8?B?bjZqbFNUVkVyYVlLTlB5SDFGRHJCZDBSZGIzQmwvcHRTYnpic1lqdWtnR0xk?=
 =?utf-8?Q?zj0GbA?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWU3dGQraXZVNDUrMTVzclZ6WitMOXVER0JsazJHdGo0UGM3cG16Q0VNSzcz?=
 =?utf-8?B?UGxaT2FBc2xlNXFOL1JlbUplOStwQ2Q1UnlaQU11SnM1dkdndWc5RnRZUXlt?=
 =?utf-8?B?alkyRGZlNi8zWURWZVgrT2JJSWJINkk0dGNRUWpoSS9JR0NlN25wREFXeW1m?=
 =?utf-8?B?ZlRSTEt6alRUK092Y2xqQk9MdW42ZVhpYTM5UXdyNGpSYkRMdEJXWEtRYWRI?=
 =?utf-8?B?c2RBN1pMMUFJUVVMU2ZZdWpRbWVLaUpadGJjNGxqRFJIUDVOSWJLZTU1cnpY?=
 =?utf-8?B?OVFqOEtMYjhpTGs3MHFyQjJDK3dzb2NZMUFjamJ5M0VVSERGK2ROeEd3RzN3?=
 =?utf-8?B?OWtocEpLamR4bjJtcVpxbzd6YVVJMXJ0S1VrQ3kyaXljWDVJRm44c3dmT01D?=
 =?utf-8?B?V25sSEdXWkhQTUppOXRTS2N4d0pMc2p5aHYvT1FIazE5OThoVW45akpHUDBw?=
 =?utf-8?B?SEJXYkVQcEI5MzhyMHlGdjh4SmNJWktBL3ZKNDIvWS9TYXlURlhzMS9oaVo5?=
 =?utf-8?B?RmlDdHA3Vlo5ckJiclJKK0kvOC8yKzhMYVIvOTVwOHVMZTF5WWpESXIyMm8v?=
 =?utf-8?B?UytYL0ZVd2RJUFZ5aFg0VHRWbDRLN09xZ2I1cG5DQThESG5mYlRrZjhXOTlC?=
 =?utf-8?B?MDZpT1dHcldiNjBYREdWa2lkd1lYby9neGR4RXFzellPbkhRZTJ6WjF0cCtt?=
 =?utf-8?B?SjhDNk91QVZFK2FxZG53bTVkMkVoK2FBSHNqWTJkdGt5dlh6Z3diR3lKbzc1?=
 =?utf-8?B?dm9mSXp3YjdRZXBtcHVUQzJlWVROcVlXdTJTZDQ0Y0JLRzJOUmdtaU8zWFA1?=
 =?utf-8?B?R0VPWDJ0eHFVYnFGREkrRmR3TFRmVkFEZDI3UnM0RFpnajBtTm8wVnB6ZjYz?=
 =?utf-8?B?SFN2aFNjT0FxSk9odHF3cjRNcE5XNkZGdkdSNzFZVmdZNDJqNXNyUytUaHBp?=
 =?utf-8?B?SGtMbnVjc0NBcUlRVXVtSis0dXdDTEJ2UWZLa21Yajh1azZMUVpvM3h3cUdt?=
 =?utf-8?B?TGs5T3pqM0JYaWN4MklIL3pxQ25RcERmenNzMUpKaTNNT0dlclJuZm03S0Ja?=
 =?utf-8?B?c1pyaWFiUVJCbUMzT1JlOVVrRTQxNGw5R1NKeFBlMWlwK3Y1ZmdCQSswZFE5?=
 =?utf-8?B?S3lDK1JmOEpRR1ZIdFRUcmZCRWU5TGR3YUxmVFpCYnVVVGZadlQraDVCeEk2?=
 =?utf-8?B?V1ozRUd2UGkvMml2VmwzTTlONnJlTXRXcHVlTzBjM2YwQzJKQ2FxQkM1QXA4?=
 =?utf-8?B?RlcxeGxtcjVJU0xLeExWK1l6RzZWcWt2UGdYYWFWenpIUHc4L2pXNkJlc3pm?=
 =?utf-8?B?eFR3aHlxQmh2RkIxbnJrUlJlODFFd1Y5MDdHS3VuWU1VamkvdDMvdkc2M2Zq?=
 =?utf-8?B?bkEyRWNGMEU5STlPY09GVkJCeG9Dc2JUUWIvdmx5dzNCZXowcDdKMG9rYjZu?=
 =?utf-8?B?N0t1dTVRd0EvaTRyOXA1aWtGeER6cUFJdmNCTHFFeHJlRGdpRnJPOE9UUEs1?=
 =?utf-8?B?MDAvRXFGdC9VZnZ3U1Z1cFRrVkZBTzBsZytvRnhWZ0hIcXo2am1Nd3UrTkFr?=
 =?utf-8?B?NzkrMXpPOFJweDVsWUJxQnd4dGQ2YzBNTDlJc2txSmZYaktqUXlxZTlhM1N1?=
 =?utf-8?B?K0xOeXZaVUo4WFoydlZWOUljZGxwZk13bEdBTml1SGNBN1pRYmxlZ0c5dnpm?=
 =?utf-8?B?WHlRaGd4VkRXcE1TVXBjL1kvejBVN05tQ3dHVzRIUzNHeEk2b2hsZEExaFlP?=
 =?utf-8?B?WGNMdW1aVEZRM2NsZktQR0diV1Z1UzllUE5FY2ZtOGp2QlJaeDU1azlEd1J6?=
 =?utf-8?B?RThFWkJMUE1mc1BaWmRYUXo5WFNrMXNkUkJaVzhxemNqajAyWjlVQ3FJZk1o?=
 =?utf-8?B?UUc2c283Nzh2YWQrQ0hZbHp5QXlROGhyL3EweGFhS0VhenB1YUtJckVYVTFN?=
 =?utf-8?B?TUYyM21rNER2Uy9VQldZUnBUaE1neEZCR0R4eEFpYlQweEMyTzZLLzc5anFO?=
 =?utf-8?B?SWVINE1VWjZuS2w3U29QMUhwR0pGd3NCcTZraHFvYjdtd2k2TC9qT09BK1lo?=
 =?utf-8?B?bEdyRWxIek9lZUl2N2lzWXJrMm5NeE9QUzluTEIrT0RKQjRLenBHeUU4M3Q0?=
 =?utf-8?B?UW0vWGx1bGorVHpsWWFONXhaendaN3FOWXZMTEJFWW9IbHU4cTJvOGRyamNi?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2443662998C5D4CB6EC64404DF4292F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b61302-f654-483c-3b5e-08de0a4bd2af
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 11:29:50.6229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tIBzN+518IwJrDmWXKPUqiUwYgtbP2mN2rOEN9cBbrHGdw7Prt7npwI/hYlR2wLN+piMRbd2hn544D407VVmQ10yW0ZqrqSxJirhnnSCAmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR03MB9512

SGkgQ0ssIEFuZ2VsbywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBUaHUsIDIwMjUt
MTAtMDkgYXQgMTM6NTQgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0K
PiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBJbCAyNy8wOC8yNSAxMzozNywgSmFzb24tSkggTGluIGhhIHNj
cml0dG86DQo+ID4gVG8gc3VwcG9ydCBoYXJkd2FyZSB3aXRob3V0IHN1YnN5cyBJRHMgb24gbmV3
IFNvQ3MsIGFkZCBhDQo+ID4gcHJvZ3JhbW1pbmcNCj4gPiBmbG93IHRoYXQgY2hlY2tzIHdoZXRo
ZXIgdGhlIHN1YnN5cyBJRCBpcyB2YWxpZC4NCj4gPiANCj4gPiBJZiB0aGUgc3Vic3lzIElEIGlz
IHZhbGlkLCB0aGUgZmxvdyB3aWxsIGNhbGwNCj4gPiBjbWRxX3BrdF93cml0ZV9zdWJzeXMoKQ0K
PiA+IGluc3RlYWQgb2YgdGhlIG9yaWdpbmFsIGNtZHFfcGt0X3dyaXRlKCkuDQo+ID4gDQo+ID4g
SWYgdGhlIHN1YnN5cyBJRCBpcyBpbnZhbGlkLCB0aGUgZmxvdyB3aWxsIGNhbGwNCj4gPiBjbWRx
X3BrdF93cml0ZV9tYXNrX3BhKCkNCj4gPiB0byBhY2hpZXZlIHRoZSBzYW1lIGZ1bmN0aW9uYWxp
dHkuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5A
bWVkaWF0ZWsuY29tPg0KPiANCj4gSW4gbWVkaWF0ZWstZHJtIGFuZCBpbiBtdGstbWRwMyB0aGUg
cGVyZm9ybWFuY2Ugb2YgbXRrX2RkcF93cml0ZSBpcw0KPiBpbXBvcnRhbnQ6IGluDQo+IGJvdGgs
IHRoZXJlIGFyZSB3YXlzIHRvIGtub3cgd2hldGhlciBhIHBsYXRmb3JtIGlzIGV4cGVjdGVkIHRv
IGFsd2F5cw0KPiB1c2UgdGhlDQo+IGNtZHFfcGt0X3dyaXRlX21hc2tfcGEoKSBvciB0aGUgc3Vi
c3lzKCkgb25lLg0KPiANCj4gUGxlYXNlIGNoZWNrIHdoYXQgcGxhdGZvcm0gaXMgdGhpcyBkcml2
ZXIgcnVubmluZyBvbiAtIGJhc2VkIG9uIHRoZQ0KPiBwbGF0Zm9ybSwgeW91DQo+IGNhbiBhc3Np
Z24gYSBmdW5jdGlvbiBwb2ludGVyLCBzbyB0aGF0IHlvdSBhbHdheXMgY2FsbCBpdCBsaWtlDQo+
IA0KPiBwcml2LT53cml0ZV9jbWRxX3BrdChjbWRxX3BrdCwgY21kcV9yZWcsIG9mc3QsIHZhbCwg
bWFzayk7DQo+IA0KPiB3cml0ZV9jbWRxX3BrdCgpIGNvdWxkIHBvaW50IHRvLCBlaXRoZXI6DQo+
IDEuIEEgZnVuY3Rpb24gdGhhdCBjaGVja3MgaWYgc3Vic3lzICE9IENNRFFfU1VCU1lTX0lOVkFM
SUQsIGZvcg0KPiBwbGF0Zm9ybXMgdGhhdA0KPiDCoMKgwqAgYXJlIGV4cGVjdGVkIHRvIGhhdmUg
bWl4ZWQgUEEgKmFuZCogU1VCU1lTIChob3BlZnVsbHkgbm9uZSEhISk7DQo+IG9yDQo+IDIuIFRo
ZSBjbWRxX3BrdF93cml0ZV9tYXNrX3N1YnN5cygpIGZ1bmN0aW9uOyBvcg0KPiAzLiBUaGUgY21k
cV9wa3Rfd3JpdGVfbWFza19wYSgpIGZ1bmN0aW9uLg0KPiANCg0KSSdsbCBhbHNvIGFzc2lnbiBj
bWRxX3BrdF93cml0ZV9zdWJzeXMoKSBhbmQgY21kcV9wa3Rfd3JpdGVfcGEoKSB0bw0KaW5jcmVh
c2UgbW9yZSBmbGV4aWJpbGl0eSBmb3IgRFJNIGRyaXZlcnMuDQoNCj4gVGhpcyByZW1vdmVzIGxv
dHMgYW5kIGxvdHMgb2YgYnJhbmNoZXMgYXQgZXZlcnkgY2FsbC4NCj4gDQo+IEkgd2FudCB0byBy
ZW1pbmQgeW91IHRoYXQgQ01EUSBwYWNrZXRzIGFyZSBiZWluZyBnZW5lcmF0ZWQgaW4gbWFueQ0K
PiBjYXNlcyBpbiB0aGUNCj4gbWVkaWF0ZWstZHJtIGRyaXZlciwgb25lIG9mIHdoaWNoIGlzIHVw
b24gVkJMQU5LOyBUaGluayBvZiB0aGUgY2FzZQ0KPiBpbiB3aGljaCB3ZQ0KPiBhcmUgZHJpdmlu
ZyBhIGhpZ2ggcmVmcmVzaCByYXRlIGRpc3BsYXkgKD49MTIwSHopOiBub3QganVzdCBpbiBEU0kN
Cj4gVmlkZW8gbW9kZQ0KPiBmb3Igd2hpY2ggd2UgbWFuYWdlIGp1c3Qgb25seSB2YmxhbmtzIGFu
ZCBkYXRhIHB1bXBpbmcgKHdoaWNoIHN0aWxsDQo+IG5lZWRzIHF1aXRlDQo+IGEgYml0IG9mIEdD
RSB3cml0ZXMpLi4gYnV0IHNvbWV0aGluZyBsaWtlIERTSSBDTUQgbW9kZSB3b3VsZCBwcm9iYWJs
eQ0KPiBnZW5lcmF0ZQ0KPiAqYSBteXJpYWQqIG9mIEdDRSBjYWxscy4uLi4gYW5kIHRoYXQgaXMg
b25seSBvbmUgb2YgdGhlIGNhc2VzLCB0aGVyZQ0KPiBhcmUgbW9yZQ0KPiB0aGF0IGRvbid0IGlu
dm9sdmUgc3BlY2lmaWNhbGx5IERTSS4NCj4gDQoNClRoYW5rcyEgSSBhZ3JlZSB3aXRoIHlvdXIg
aW5zaWdodCBzdWdnZXN0aW9uLg0KSSdsbCB0cnkgdG8gcmVkdWNlIHRoaXMgYGlmIChzdWJzeXMg
IT0gQ01EUV9TVUJTWVNfSU5WQUxJRClgIGJyYW5jaCBhbmQNCmNyZWF0ZSBhIGZ1bmN0aW9uIGhv
b2sgZm9yIGRkcF9jb21wIGFuZCBhc3NpZ24gdGhlIGNvcnJlc3BvbmRpbmcNCmZ1bmN0aW9uIGJ5
IHBsYXRmb3JtcyBhdCB0aGUgaW5pdGlhbGl6YXRpb24gcGhhc2UuDQoNCj4gT2YgY291cnNlLCBm
b3IgbXRrLW1kcDMgdGhlcmUncyBhIGRpZmZlcmVudCBzdG9yeSAtIGJ1dCBJIGd1ZXNzIGl0J3MN
Cj4gdXNlbGVzcyB0bw0KPiBhZGQgYSBzcGVjaWZpYyBleGFtcGxlIGZvciB0aGF0LCBJJ20gc3Vy
ZSB5b3UgZ290IHRoZSBwb2ludCBoZXJlLg0KPiANCg0KSSdsbCBjaGVjayBpZiBJIGNhbiBhcHBs
eSB0aGlzIHRob3VnaHQgaW50byBtdGstbWRwMy4gVGhhbmtzIQ0KDQpSZWdhcmRzLA0KSmFzb24t
SkggTGluDQoNCj4gQ2hlZXJzLA0KPiBBbmdlbG8NCg0K

