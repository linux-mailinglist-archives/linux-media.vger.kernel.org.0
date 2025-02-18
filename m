Return-Path: <linux-media+bounces-26264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC984A3970C
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 10:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DDB41891CD0
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 09:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B24322FF22;
	Tue, 18 Feb 2025 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CKQoz3Yp";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ctQ0zp3s"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A545C22DF8C;
	Tue, 18 Feb 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739870770; cv=fail; b=k1e4vEeL3Miawji6A4xvxBl87J0Wq7BMCYQKbaofRDUhY+RO8sfrm8kla0BJihB8QXchN4CGq8OLwgBEQmXsKA2jGZWFf3QTWIK8Rn0nwrvkvbQl9D6BRGQXYiQlI7lWmzEkDQpfWujc63NfXSkHfMxE2xQDkVgykd7IsvNlGME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739870770; c=relaxed/simple;
	bh=pPgnq4pgeWxPWLqlR+NMZX9dfP7DthByXB+JOGP3T0Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bA852GnPQwzLjR1/Te+LMIxq/NeqhmUMZfP7I5SogrmLskFw3i+2V5AwYyhcxiLEJoW14NORnQwauYJG134MMdesJtBzWUwuEzCb5kS171VgX5d9MuEFg4h6j7IUd9tKPIiiubQWBcVjSTOl0rwEsbIAzQ2EJ0ggRvdrwewnfkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=CKQoz3Yp; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ctQ0zp3s; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5d5c71f2edda11efaae1fd9735fae912-20250218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=pPgnq4pgeWxPWLqlR+NMZX9dfP7DthByXB+JOGP3T0Q=;
	b=CKQoz3YpVYRNucs8P1zxHwNGCI5u/+XQBjnkECjvgGn12e7LakG84mMj1FyMn3cw0P6YKFG+xU0Mk5RJmpIz6jafu5gRQrrQmK9vcdUFF2S05lnNfKeyapSNd1sWoo+yJMJAN5zj2CTxyJ5574FGEudM7LvC5pApvSmCwW4zifQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:cfe8811a-8b10-4751-9d2d-79bed24be6ba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:c5fbf228-e0f8-414e-b8c3-b75c08217be8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5d5c71f2edda11efaae1fd9735fae912-20250218
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 580381323; Tue, 18 Feb 2025 17:25:59 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 18 Feb 2025 17:25:58 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 18 Feb 2025 17:25:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNJNjjlqejfmFrFSdO6t9ZuCMEawVvHQYorHCW7SQ5DRpxoJ9hn8pNdIQt+Ahlb7KWhbupjvfT/MIOlN+p/rlNn+sb9zKEQlXB32GxW3DZFyK2uphL59kniykocj67QAOPBFCFrjzSoFKO8Dwm0W6/4uWICuhjZr5LbI0jGk7WStY8pRVzMp/48v7Fs+9vuqmF5Jq+lMsSfZLmqWj6KZlxqx+RtsmSNnqB22WRgoOlcwRDTB84zxGNgtTs+AdcGku6k2EReXwaTMyPBgpeLpbjjMk59QIUjpPDB5tCJ8/s1ABJW8MCGjEpQqAxyCE2YkUFRHm6nsHQlu37iVI1N8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPgnq4pgeWxPWLqlR+NMZX9dfP7DthByXB+JOGP3T0Q=;
 b=yqZMo9SYWkhdBWOqHLI+RU3yENhqYlkRwVVyFpcb+1SC7gAp3gNMUWqPD6iLp3fX35pjnIWDcEluMfKWWL0ZfVa/n30Wc9lut8H+6C4LYf96y/IXq+oP9loRpA27cngKfbfj2jrg9yTZQqggNhShiKKqEZaLlfu/zetTYxsYiv4408AfMQY0W5wMQuYW2yYrDo5K/09m2Um2qWBu83ntPM1NlepavC5+TfWAplUyynZvUvyLPOXuh/HFtfsQJX0dtVTtSn1BVrorrhZA/Gdcq45pbm0+vcvGXNONrrb5qvoQ1aMjV8Sb+0nesPbUstvxiaOD3e8yO6R1/E7Dcyi4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPgnq4pgeWxPWLqlR+NMZX9dfP7DthByXB+JOGP3T0Q=;
 b=ctQ0zp3sxPaVXBiJGE8/GKYLjfZUTh1MeUOIDoYVZXeMuZt88pih0530HZFJ833z9diOEneMhbt0731ISiheZwx87PDq0r/Q4yFfki7yv807r2wMnlJuVhX04sAj84pNQEzUvA/gEUArX1Mray3kMHEV+8aHNprP2k6mw7X7XOY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6504.apcprd03.prod.outlook.com (2603:1096:4:1c8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 09:25:56 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8445.013; Tue, 18 Feb 2025
 09:25:55 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org"
	<treapking@chromium.org>
Subject: Re: [PATCH v4 3/8] mailbox: mtk-cmdq: Add driver data to support for
 MT8196
Thread-Topic: [PATCH v4 3/8] mailbox: mtk-cmdq: Add driver data to support for
 MT8196
Thread-Index: AQHbgcps/HRMazof00CFGp1lztbf1bNMyqIA
Date: Tue, 18 Feb 2025 09:25:55 +0000
Message-ID: <8cfc321d570dbbfafebba55a0bda156314e6bdc0.camel@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
	 <20250218054405.2017918-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20250218054405.2017918-4-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6504:EE_
x-ms-office365-filtering-correlation-id: 52f781c9-b71d-4135-f4f5-08dd4ffe3efb
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WVBKRmo2NStXODdockhYUWRRZ0p2VjRCYlFaOERQcnlDNUpmYlpMSnVTRFpL?=
 =?utf-8?B?MnBmYjJyMGU5MEJqOEJNYS9oRDRNN3dHdis5ZDBlc0t5QVIxZC9YVEtwQ3oz?=
 =?utf-8?B?Yjc2ZGU4M2NVamlUMU5BaGt2WUJJUWo1ZE5kMlcyVWR0TEtjNTVUQnpua1pM?=
 =?utf-8?B?S01xZlFUMk04UFRZSkhEVjhKS1BIR01UQzZBc205ZFpRVFJ0TEMwaE8zbzVX?=
 =?utf-8?B?OGN5VlJ0WVVLK1VzdWtLMk5YMkNwcGpoV2JyR3Y5MENCMUliNEplcmY3YVp5?=
 =?utf-8?B?QmR5bWJBTTNGd2tYQ3VoUEVLeHVXQlFUd25meWxTT01iSENNbTZYOE0rTENW?=
 =?utf-8?B?dzBZcS83L0VwcTFacnFVS0xGTU1PcDZYNWE0NWdYZHZrNG5YSEhvbjVwMDhw?=
 =?utf-8?B?OVpqVXQyTXJVY0tlSlhWYThpc3hQSlc2cU5UWUI3bU1sSHNVWFZTd1ZDSTVT?=
 =?utf-8?B?UytTaFVaNDdpazhJVWZSUWxKNGs1RkZyeEExRnRCNGRBVG8rT1Y0RE1ucXJj?=
 =?utf-8?B?cTVhL3VNbTZMdm9wKzY4YnNPRHhhTnlPaHhZNlV2TU92NXpJTC9hL0laZG93?=
 =?utf-8?B?Ykh3Um1Rc2FXSTNDSG5lSjROdnMyQzdjeXdJLzlLeGRjMGxBNjBlckJ0aCtP?=
 =?utf-8?B?Tm0yUFJkUUM3U2NwM2ptV21tamhqT3dBL3U1WkJYdUxicHM3NXA4cGVRZStP?=
 =?utf-8?B?dWxpRzFDSzRlQ29uWlFhTlBEME16M3ViQUttdWI3T2craFBSVENsak1yRkZo?=
 =?utf-8?B?MjRROC9idkh2RG9lM2NTRW93cVJUMjVqeVA4MGVDYWk3OE13WGk3UUoyS1ly?=
 =?utf-8?B?cUV1L21pM212VGJLTUptdk5VRm84TmhMRWFHdEJGNHJoUyt2YkoxY2RNSnI0?=
 =?utf-8?B?QzJjdUFQbE5ZWE5iS0c3bkUvOVB6UjFVUHF0YzZmSXR3ck1VeEQxcGlGUkVz?=
 =?utf-8?B?cy9WQ1VrblhXdWpaaWYvWmgyMkJXSHhUTWpLTHZKaEJEbGNGd0crUzZ3YWdt?=
 =?utf-8?B?L0tZVkVyQzM4Vi9VT1h5S0t5aE5rK0lyQmg2dURTVUdGWDFTQVNYWkFNMFE0?=
 =?utf-8?B?WHk2UHVURGduelI4Q09tV2JFZkgrNS9Rb3NrTU9tN0pPVy83a3EyS0hQc05W?=
 =?utf-8?B?bzF3UUY5aHNsZ0MzZVNIanFaUGJDdkxtVEhuUkEvdFBlZXN3K294RDJiTlNx?=
 =?utf-8?B?L1Y1Z0k1VGFjUys5VDQzM0FWdW9BcjJrYVZhS2tSMlZ2dFVNbkpuQXVvRlFo?=
 =?utf-8?B?Nnk3WHNYRnFaZm95aEhNZzVaWWlLWERHemU0MEF2Mm15cTc3STZPREQrRG9z?=
 =?utf-8?B?YzZDM00xbGc4Q285VkdiVTFMOTUxSm1QODVwSG8rUVY1d3R5V1htbEtwQVJR?=
 =?utf-8?B?S3lVL2JsNDRhOWZQbnBkUnlZMEp0WFY0SFNBZVRzRXkvVjNMY1g2KzBraXhP?=
 =?utf-8?B?RmZZUzB1QzNOZGxlYzF6ZkFYbCtPZ2I1eGtBVENKWDhKR3RENy81K2cyU05M?=
 =?utf-8?B?eXVmZWRnQ2h4OWptZUlpTDArKzRZY3lEMTByUmJaVnBONy93dkIrVUFLTmJr?=
 =?utf-8?B?aGxEbjdZblhVU1orWWRxbXV3ZmIrakcvS3BqaHRCUUdhc1hoNVR1SXdPYzAv?=
 =?utf-8?B?cW91cTZiaFAyQXlkbzYrWWViQjFEUW92cFNRbStMOFJMMjJHcW1Sem9iWDRz?=
 =?utf-8?B?bW14WWRxTUhXQk1MckRBbnNKRnhKUVcwTUlZMlJEL0V6dzR1VCtma3FMT2FN?=
 =?utf-8?B?Ni8vUE5uTDRETWZjVVVNblQzcVVyVllWLy9WcEZMQ0dEVysvckNtM0xkc2FY?=
 =?utf-8?B?YW5vdGlOdEtraExRekRSMXdWMzBRcDJ2SWtWNWR5MXFWc1RTSlJRYmhrbjFx?=
 =?utf-8?B?K0ZwV2xkT04wcSttT1lLMFNHNk9ZREY1TnJ2aTJxU3RsbmpMaFVkOFdlbEFy?=
 =?utf-8?Q?iZPzpezvCkxl8xk7803Y7Flr5cAl7sHa?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U05YbkNhWWJ3WlVMYWpwTGE1T0h2Vm1aM1NYN2hZVDgreDZNVENwL09TcVgr?=
 =?utf-8?B?Yk1zSnIvSVVmUTd2d2RZTXQ5dThBbHdlQ3VLb1VURFZ1TDF0bXJSbThZaTV4?=
 =?utf-8?B?RjNlbGxDNUViR2NweFJ5MmhRczc2NWVxQlRMOFJtVFdlNHNTZXY5MlJlK1FK?=
 =?utf-8?B?MkhZYmQxUW5ndHlGVGlidHNNUWk5ZmdUQXE2SzNtNUpJeElXR1JKSys2dW83?=
 =?utf-8?B?NmNwY283VEV2Z1JVR3FNNXhoaTY0RzdhNzhMWFJ5RE9jd0J2SHMzZEdQdlBF?=
 =?utf-8?B?eEx2VjRXVmJKbmU5YzRvUmloWHV2dmFQVkZKUk1lRVRnVTJpaUZqa0V2S1Z1?=
 =?utf-8?B?SW5UWXFXM24xQ0xHVERBVHpCYk9wbDlFNkJGbU1oSmR6NmMyZnR2bURjbitE?=
 =?utf-8?B?RzNpYzBaUE5VYVJjSGcza2xuWktJMzUyNWhzUmh3ZDJ4cCtSQ3ZuQmw0QlVP?=
 =?utf-8?B?MFZrODFyUExoeWJlWGdwMnp3VmwyaEtJWExGZk5UNzBjM1dCcm5lOTdFRU0x?=
 =?utf-8?B?VDFZdG1BRVAvZWgyL0hoZzd4M2tGR0VacUg1dlNka1E5L3E1eWw3dWtoYkRy?=
 =?utf-8?B?b1crMk5QQXdtWlNLNHBGQ1pmdU56N2lFN1FEOFdvZzl1SXJBUTdQb2ZjMmtJ?=
 =?utf-8?B?LzJZZXhMUUxZZCsvNUk4RCtDQ3NBM2Y2QzJtc1lJaFFtYzdvMUl0cWhWa1pr?=
 =?utf-8?B?TWI5dWxnWnRTM2xKbGJZR2NpWHNNcTVrL2U3R0pGZzRKakVWUkp3LzBtK0Uw?=
 =?utf-8?B?V3hyd1ZTa0VEMVBUUWV3S0UvQlpMUmp2UFkxdTc5M2p0NDcvSEs0cURxQlJl?=
 =?utf-8?B?Q1hnc2RpTXVFd0I3bzhndk02VXFkaEZLNkx3STZ1bjJmazRSWVlxaVJzTGIr?=
 =?utf-8?B?NHdUcnlzZjF3UzhJZ0xEc0Qrb0lHWmpMZnV2dkV5bnY1SXhYQ0t1UVF6SG9C?=
 =?utf-8?B?NVNuRFg2c3R0SVFPdkpkK01vcy84TmlGVFVWSklxZzVNU2FLMnVsaFhhT3VR?=
 =?utf-8?B?Z0l2TEdpOWtQc3BrUjF5RHhHbWFEc1lrSHVkN0Z2SWJXdU16NzFhSnJPNFpw?=
 =?utf-8?B?cUJFUjRpeFZlZmx3U1JyVE1iYUhBOVlzei94cmhDWjV5T09vLytPTUJtVVFO?=
 =?utf-8?B?T0N6MVgxS0xnWkh0NkxqcHptZ2NLT3RKVjZyTEY1dlZDZmJiZ2tOMjlBcExD?=
 =?utf-8?B?M2ZRWHhLUkpYQmdNSkRYNEkvM2VXSFUyeDJOYzBSTFBkdXN0QnBjSlpPc09q?=
 =?utf-8?B?eWN3T2syTytTc0hSU25jVVJ6NEFtNG1kMmoyREpGemM4SGc2L1R0R1U4eTNG?=
 =?utf-8?B?cStIK1k2eG4rNGhRa1BkT3N1VnI4ZmQ4SUw1TUJHbk5ER3g2d1FZN2VvRTVh?=
 =?utf-8?B?RnZ1SzhOVnovclFJaWNWL1hNZUZHcHd2aDFpQjhDejRRVGZQQ3hDajhlRldt?=
 =?utf-8?B?SDNmeXhNNUFBZWpScnNVa1RZODNqWTBrblBIMHpLaTZwNmk2NUliMU5NWXJz?=
 =?utf-8?B?OWw3LzRZckR3UVpzeWpNOHZta2p4dXZrNW9YYWRDb3lrTHdOU0ZjWTJsYlpV?=
 =?utf-8?B?Ti85M1Y3NEllVGV0MDBaTGhESmJOMzFFWDdaUlBzb2FVOW4yUjNDWlVuV3l3?=
 =?utf-8?B?ZjJsVjlka2RTNDh0cjRMWDdUd0QzQjFEcElSQ3g5TU1kY2gxaEhqSGFmVTRp?=
 =?utf-8?B?UWpYa01wY1NiM0pDS3VUR2RGK29lUWYzRkU1eWFmTkZhYkFEeTJMTVorOXJF?=
 =?utf-8?B?RTMwNENZYUFocXRzSWVzZ0tTdkxLayswSmVzMHFQTnlJdXBmdWUyK1FVTHVi?=
 =?utf-8?B?RzhTY0kvcXNkZ2JIOFA2K2JsRTFFcjZ1d2pVaHVOQ0c5UDNlUFRXeVVUVWl2?=
 =?utf-8?B?dmlZQk9pNTNtRXFVMExiL3VIMkNuK0JHbWpCL2h4Ry9wWTNSUVZod3grS3hN?=
 =?utf-8?B?M2l3MlE2U0g4MForR3U5VGp4MGxvU1N5UTFMc3NMNHdzWTV0MDMraEZVR3Z1?=
 =?utf-8?B?SzF2djEyRENKTmREZnN5QWxuZ3k3UkMxQnN4Yk5DWGo2ZW9VWE02UlRtejJ5?=
 =?utf-8?B?MTNoRklzYUlwdGIrelZBR0tKWVVoT1ZMWitWQ3UxMStrK3c3T0lrZVg1UWUv?=
 =?utf-8?Q?ekBoqRav/rxdcH3eRno+feRME?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFEE867EBF44B1418801B0D89627C18D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f781c9-b71d-4135-f4f5-08dd4ffe3efb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 09:25:55.3208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K3noQfmL2YCv0FJr2TjpE60spKhQZUc1fUzee6vo9iSqjbakiH9qEsabLlMdiWEGhYi/cJTi2c5UaBmqT9ugyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6504

T24gVHVlLCAyMDI1LTAyLTE4IGF0IDEzOjQxICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IE1UODE5NiBoYXMgMyBuZXcgaGFyZHdhcmUgY29uZmlndXJhdGlvbiBjb21wYXJlZCB3aXRoIHRo
ZSBwcmV2aW91cyBTb0MsDQo+IHdoaWNoIGNvcnJlc3BvbmQgdG8gdGhlIDMgbmV3IGRyaXZlciBk
YXRhOg0KPiANCj4gMS4gbW1pbmZyYV9vZmZzZXQ6IEZvciBHQ0UgZGF0YSBwbGFuZSBjb250cm9s
DQo+ICAgIFNpbmNlIEdDRSBoYXMgYmVlbiBtb3ZlZCBpbnRvIG1taW5mcmEsIEdDRSBuZWVkcyB0
byBhcHBlbmQgdGhlDQo+ICAgIG1taW5mcmEgb2Zmc2V0IHRvIHRoZSBEUkFNIGFkZHJlc3Mgd2hl
biBhY2Nlc3NpbmcgdGhlIERSQU0uDQoNCkl0IHNlZW1zIHRoYXQgR0NFIGhhcyBpb3ZhIGFuZCBt
bWluZnJhIHdvdWxkIG1hcHBpbmcgdGhlIGlvdmEgdG8gcGh5c2ljYWwgYWRkcmVzcy4NCk1heWJl
IGxldCBHQ0UgYmUgYSBpb21tdSBkZXZpY2Ugb3IgYWRkIGlvbW11cyBwcm9wZXJ0eSBpbiBkZXZp
Y2Ugbm9kZSwgYW5kIHVzZSBkbWFfbWFwX3h4eCgpIHRvIGdldCBpb3ZhIG9mIEdDRS4NCmlvbW11
cyBwcm9wZXJ0eSBwb2ludCB0byBtbWluZnJhIGRldmljZSAobWF5YmUgYW5vdGhlciBuYW1lKSBh
bmQgbW1pbmZyYSBkZXZpY2Ugd291bGQgcHJvY2VzcyB0aGUgbWFwcGluZyBvZiBpb3ZhIGFuZCBw
aHlzaWNhbCBhZGRyZXNzLg0KDQo+IA0KPiAyLiBnY2Vfdm06IEZvciBHQ0UgaGFyZHdhcmUgdmly
dHVhbGl6YXRpb24NCj4gICAgQ3VycmVudGx5LCB0aGUgZmlyc3QgdmVyc2lvbiBvZiB0aGUgbXQ4
MTk2IG1haWxib3ggY29udHJvbGxlciBvbmx5DQo+ICAgIHJlcXVpcmVzIHNldHRpbmcgdGhlIFZN
LXJlbGF0ZWQgcmVnaXN0ZXJzIHRvIGVuYWJsZSB0aGUgcGVybWlzc2lvbnMNCj4gICAgb2YgYSBo
b3N0IFZNLg0KDQpXaGF0J3MgdGhpcz8gSSBrbm93IHRoaXMgcGF0Y2ggd291bGQgbm90IGltcGxl
bWVudCB0aGUgZnVsbCBWTSBmdW5jdGlvbiwNCmJ1dCBkZXNjcmliZSBtb3JlIGFib3V0IHdoYXQg
dGhpcyBpcy4gV2h5IG5lZWQgdG8gZW5hYmxlIHBlcm1pc3Npb24/DQoNClJlZ2FyZHMsDQpDSw0K
DQo+IA0KPiAzLiBkbWFfbWFza19iaXQ6IEZvciBkbWEgYWRkcmVzcyBiaXQgY29udHJvbA0KPiAg
ICBJbiBvcmRlciB0byBhdm9pZCB0aGUgaGFyZHdhcmUgbGltaXRhdGlvbnMgb2YgTVQ4MTk2IGFj
Y2Vzc2luZyBEUkFNLA0KPiAgICBHQ0UgbmVlZHMgdG8gY29uZmlndXJlIHRoZSBETUEgYWRkcmVz
cyB0byBiZSBsZXNzIHRoYW4gMzUgYml0cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpI
IExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21haWxi
b3gvbXRrLWNtZHEtbWFpbGJveC5jICAgICAgIHwgOTAgKysrKysrKysrKysrKysrKysrKysrLS0t
DQo+ICBpbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oIHwgIDIgKw0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgYi9kcml2ZXJz
L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+IGluZGV4IGQxODY4NjViOGRjZS4uMGFiZTEw
YTdmZWY5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5j
DQo+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gQEAgLTQzLDYg
KzQzLDE3IEBADQo+ICAjZGVmaW5lIEdDRV9DVFJMX0JZX1NXCQkJCUdFTk1BU0soMiwgMCkNCj4g
ICNkZWZpbmUgR0NFX0REUl9FTgkJCQlHRU5NQVNLKDE4LCAxNikNCj4gIA0KPiArI2RlZmluZSBH
Q0VfVk1fSURfTUFQMAkJCTB4NTAxOA0KPiArI2RlZmluZSBHQ0VfVk1fTUFQMF9BTExfSE9TVAkJ
CUdFTk1BU0soMjksIDApDQo+ICsjZGVmaW5lIEdDRV9WTV9JRF9NQVAxCQkJMHg1MDFjDQo+ICsj
ZGVmaW5lIEdDRV9WTV9NQVAxX0FMTF9IT1NUCQkJR0VOTUFTSygyOSwgMCkNCj4gKyNkZWZpbmUg
R0NFX1ZNX0lEX01BUDIJCQkweDUwMjANCj4gKyNkZWZpbmUgR0NFX1ZNX01BUDJfQUxMX0hPU1QJ
CQlHRU5NQVNLKDI5LCAwKQ0KPiArI2RlZmluZSBHQ0VfVk1fSURfTUFQMwkJCTB4NTAyNA0KPiAr
I2RlZmluZSBHQ0VfVk1fTUFQM19BTExfSE9TVAkJCUdFTk1BU0soNSwgMCkNCj4gKyNkZWZpbmUg
R0NFX1ZNX0NQUl9HU0laRQkJMHg1MGM0DQo+ICsjZGVmaW5lIEdDRV9WTV9DUFJfR1NJWkVfSFNP
VAkJCUdFTk1BU0soMywgMCkNCj4gKw0KPiAgI2RlZmluZSBDTURRX1RIUl9BQ1RJVkVfU0xPVF9D
WUNMRVMJMHgzMjAwDQo+ICAjZGVmaW5lIENNRFFfVEhSX0VOQUJMRUQJCTB4MQ0KPiAgI2RlZmlu
ZSBDTURRX1RIUl9ESVNBQkxFRAkJMHgwDQo+IEBAIC04NywxMSArOTgsMjQgQEAgc3RydWN0IGNt
ZHEgew0KPiAgc3RydWN0IGdjZV9wbGF0IHsNCj4gIAl1MzIgdGhyZWFkX25yOw0KPiAgCXU4IHNo
aWZ0Ow0KPiArCWRtYV9hZGRyX3QgbW1pbmZyYV9vZmZzZXQ7DQo+ICAJYm9vbCBjb250cm9sX2J5
X3N3Ow0KPiAgCWJvb2wgc3dfZGRyX2VuOw0KPiArCWJvb2wgZ2NlX3ZtOw0KPiArCXUzMiBkbWFf
bWFza19iaXQ7DQo+ICAJdTMyIGdjZV9udW07DQo+ICB9Ow0KPiAgDQo+ICtzdGF0aWMgaW5saW5l
IHUzMiBjbWRxX3JlZ19zaGlmdF9hZGRyKGRtYV9hZGRyX3QgYWRkciwgY29uc3Qgc3RydWN0IGdj
ZV9wbGF0ICpwZGF0YSkNCj4gK3sNCj4gKwlyZXR1cm4gKChhZGRyICsgcGRhdGEtPm1taW5mcmFf
b2Zmc2V0KSA+PiBwZGF0YS0+c2hpZnQpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIHUz
MiBjbWRxX3JlZ19yZXZlcnRfYWRkcihkbWFfYWRkcl90IGFkZHIsIGNvbnN0IHN0cnVjdCBnY2Vf
cGxhdCAqcGRhdGEpDQo+ICt7DQo+ICsJcmV0dXJuICgoYWRkciA8PCBwZGF0YS0+c2hpZnQpIC0g
cGRhdGEtPm1taW5mcmFfb2Zmc2V0KTsNCj4gK30NCj4gKw0KPiAgc3RhdGljIHZvaWQgY21kcV9z
d19kZHJfZW5hYmxlKHN0cnVjdCBjbWRxICpjbWRxLCBib29sIGVuYWJsZSkNCj4gIHsNCj4gIAlX
QVJOX09OKGNsa19idWxrX2VuYWJsZShjbWRxLT5wZGF0YS0+Z2NlX251bSwgY21kcS0+Y2xvY2tz
KSk7DQo+IEBAIC0xMTIsNiArMTM2LDMwIEBAIHU4IGNtZHFfZ2V0X3NoaWZ0X3BhKHN0cnVjdCBt
Ym94X2NoYW4gKmNoYW4pDQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MKGNtZHFfZ2V0X3NoaWZ0X3Bh
KTsNCj4gIA0KPiArZG1hX2FkZHJfdCBjbWRxX2dldF9vZmZzZXRfcGEoc3RydWN0IG1ib3hfY2hh
biAqY2hhbikNCj4gK3sNCj4gKwlzdHJ1Y3QgY21kcSAqY21kcSA9IGNvbnRhaW5lcl9vZihjaGFu
LT5tYm94LCBzdHJ1Y3QgY21kcSwgbWJveCk7DQo+ICsNCj4gKwlyZXR1cm4gY21kcS0+cGRhdGEt
Pm1taW5mcmFfb2Zmc2V0Ow0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTChjbWRxX2dldF9vZmZzZXRf
cGEpOw0KPiArDQo+ICtib29sIGNtZHFfYWRkcl9uZWVkX29mZnNldChzdHJ1Y3QgbWJveF9jaGFu
ICpjaGFuLCBkbWFfYWRkcl90IGFkZHIpDQo+ICt7DQo+ICsJc3RydWN0IGNtZHEgKmNtZHEgPSBj
b250YWluZXJfb2YoY2hhbi0+bWJveCwgc3RydWN0IGNtZHEsIG1ib3gpOw0KPiArDQo+ICsJaWYg
KGNtZHEtPnBkYXRhLT5tbWluZnJhX29mZnNldCA9PSAwKQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+
ICsNCj4gKwkvKg0KPiArCSAqIG1taW5mcmEgd2lsbCByZWNvZ25pemUgdGhlIGFkZHIgdGhhdCBn
cmVhdGVyIHRoYW4gdGhlIG1taW5mcmFfb2Zmc2V0DQo+ICsJICogYXMgYSB0cmFuc2FjdGlvbiB0
byBEUkFNLg0KPiArCSAqIFNvIHRoZSBjYWxsZXIgbmVlZHMgdG8gYXBwZW5kIG1taW5mcmFfb2Zm
c2V0IGZvciB0aGUgdHJ1ZSBjYXNlLg0KPiArCSAqLw0KPiArCXJldHVybiAoYWRkciA+PSBjbWRx
LT5wZGF0YS0+bW1pbmZyYV9vZmZzZXQpOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTChjbWRxX2Fk
ZHJfbmVlZF9vZmZzZXQpOw0KPiArDQo+ICBzdGF0aWMgaW50IGNtZHFfdGhyZWFkX3N1c3BlbmQo
c3RydWN0IGNtZHEgKmNtZHEsIHN0cnVjdCBjbWRxX3RocmVhZCAqdGhyZWFkKQ0KPiAgew0KPiAg
CXUzMiBzdGF0dXM7DQo+IEBAIC0xNDMsNiArMTkxLDE3IEBAIHN0YXRpYyB2b2lkIGNtZHFfaW5p
dChzdHJ1Y3QgY21kcSAqY21kcSkNCj4gIAl1MzIgZ2N0bF9yZWd2YWwgPSAwOw0KPiAgDQo+ICAJ
V0FSTl9PTihjbGtfYnVsa19lbmFibGUoY21kcS0+cGRhdGEtPmdjZV9udW0sIGNtZHEtPmNsb2Nr
cykpOw0KPiArDQo+ICsJaWYgKGNtZHEtPnBkYXRhLT5nY2Vfdm0pIHsNCj4gKwkJLyogY29uZmln
IGNwciBzaXplIGZvciBob3N0IHZtICovDQo+ICsJCXdyaXRlbChHQ0VfVk1fQ1BSX0dTSVpFX0hT
T1QsIGNtZHEtPmJhc2UgKyBHQ0VfVk1fQ1BSX0dTSVpFKTsNCj4gKwkJLyogY29uZmlnIENQUl9H
U0laRSBiZWZvcmUgc2V0dGluZyBWTV9JRF9NQVAgdG8gYXZvaWQgZGF0YSBsZWFrYWdlICovDQo+
ICsJCXdyaXRlbChHQ0VfVk1fTUFQMF9BTExfSE9TVCwgY21kcS0+YmFzZSArIEdDRV9WTV9JRF9N
QVAwKTsNCj4gKwkJd3JpdGVsKEdDRV9WTV9NQVAxX0FMTF9IT1NULCBjbWRxLT5iYXNlICsgR0NF
X1ZNX0lEX01BUDEpOw0KPiArCQl3cml0ZWwoR0NFX1ZNX01BUDJfQUxMX0hPU1QsIGNtZHEtPmJh
c2UgKyBHQ0VfVk1fSURfTUFQMik7DQo+ICsJCXdyaXRlbChHQ0VfVk1fTUFQM19BTExfSE9TVCwg
Y21kcS0+YmFzZSArIEdDRV9WTV9JRF9NQVAzKTsNCj4gKwl9DQo+ICsNCj4gIAlpZiAoY21kcS0+
cGRhdGEtPmNvbnRyb2xfYnlfc3cpDQo+ICAJCWdjdGxfcmVndmFsID0gR0NFX0NUUkxfQllfU1c7
DQo+ICAJaWYgKGNtZHEtPnBkYXRhLT5zd19kZHJfZW4pDQo+IEBAIC0xOTksNyArMjU4LDcgQEAg
c3RhdGljIHZvaWQgY21kcV90YXNrX2luc2VydF9pbnRvX3RocmVhZChzdHJ1Y3QgY21kcV90YXNr
ICp0YXNrKQ0KPiAgCQkJCXByZXZfdGFzay0+cGt0LT5jbWRfYnVmX3NpemUsIERNQV9UT19ERVZJ
Q0UpOw0KPiAgCXByZXZfdGFza19iYXNlW0NNRFFfTlVNX0NNRChwcmV2X3Rhc2stPnBrdCkgLSAx
XSA9DQo+ICAJCSh1NjQpQ01EUV9KVU1QX0JZX1BBIDw8IDMyIHwNCj4gLQkJKHRhc2stPnBhX2Jh
c2UgPj4gdGFzay0+Y21kcS0+cGRhdGEtPnNoaWZ0KTsNCj4gKwkJY21kcV9yZWdfc2hpZnRfYWRk
cih0YXNrLT5wYV9iYXNlLCB0YXNrLT5jbWRxLT5wZGF0YSk7DQo+ICAJZG1hX3N5bmNfc2luZ2xl
X2Zvcl9kZXZpY2UoZGV2LCBwcmV2X3Rhc2stPnBhX2Jhc2UsDQo+ICAJCQkJICAgcHJldl90YXNr
LT5wa3QtPmNtZF9idWZfc2l6ZSwgRE1BX1RPX0RFVklDRSk7DQo+ICANCj4gQEAgLTI2NCw3ICsz
MjMsNyBAQCBzdGF0aWMgdm9pZCBjbWRxX3RocmVhZF9pcnFfaGFuZGxlcihzdHJ1Y3QgY21kcSAq
Y21kcSwNCj4gIAllbHNlDQo+ICAJCXJldHVybjsNCj4gIA0KPiAtCWN1cnJfcGEgPSByZWFkbCh0
aHJlYWQtPmJhc2UgKyBDTURRX1RIUl9DVVJSX0FERFIpIDw8IGNtZHEtPnBkYXRhLT5zaGlmdDsN
Cj4gKwljdXJyX3BhID0gY21kcV9yZWdfc2hpZnRfYWRkcihyZWFkbCh0aHJlYWQtPmJhc2UgKyBD
TURRX1RIUl9DVVJSX0FERFIpLCBjbWRxLT5wZGF0YSk7DQo+ICANCj4gIAlsaXN0X2Zvcl9lYWNo
X2VudHJ5X3NhZmUodGFzaywgdG1wLCAmdGhyZWFkLT50YXNrX2J1c3lfbGlzdCwNCj4gIAkJCQkg
bGlzdF9lbnRyeSkgew0KPiBAQCAtNDE2LDkgKzQ3NSw5IEBAIHN0YXRpYyBpbnQgY21kcV9tYm94
X3NlbmRfZGF0YShzdHJ1Y3QgbWJveF9jaGFuICpjaGFuLCB2b2lkICpkYXRhKQ0KPiAgCQkgKi8N
Cj4gIAkJV0FSTl9PTihjbWRxX3RocmVhZF9yZXNldChjbWRxLCB0aHJlYWQpIDwgMCk7DQo+ICAN
Cj4gLQkJd3JpdGVsKHRhc2stPnBhX2Jhc2UgPj4gY21kcS0+cGRhdGEtPnNoaWZ0LA0KPiArCQl3
cml0ZWwoY21kcV9yZWdfc2hpZnRfYWRkcih0YXNrLT5wYV9iYXNlLCBjbWRxLT5wZGF0YSksDQo+
ICAJCSAgICAgICB0aHJlYWQtPmJhc2UgKyBDTURRX1RIUl9DVVJSX0FERFIpOw0KPiAtCQl3cml0
ZWwoKHRhc2stPnBhX2Jhc2UgKyBwa3QtPmNtZF9idWZfc2l6ZSkgPj4gY21kcS0+cGRhdGEtPnNo
aWZ0LA0KPiArCQl3cml0ZWwoY21kcV9yZWdfc2hpZnRfYWRkcih0YXNrLT5wYV9iYXNlICsgcGt0
LT5jbWRfYnVmX3NpemUsIGNtZHEtPnBkYXRhKSwNCj4gIAkJICAgICAgIHRocmVhZC0+YmFzZSAr
IENNRFFfVEhSX0VORF9BRERSKTsNCj4gIA0KPiAgCQl3cml0ZWwodGhyZWFkLT5wcmlvcml0eSwg
dGhyZWFkLT5iYXNlICsgQ01EUV9USFJfUFJJT1JJVFkpOw0KPiBAQCAtNDI2LDEwICs0ODUsMTAg
QEAgc3RhdGljIGludCBjbWRxX21ib3hfc2VuZF9kYXRhKHN0cnVjdCBtYm94X2NoYW4gKmNoYW4s
IHZvaWQgKmRhdGEpDQo+ICAJCXdyaXRlbChDTURRX1RIUl9FTkFCTEVELCB0aHJlYWQtPmJhc2Ug
KyBDTURRX1RIUl9FTkFCTEVfVEFTSyk7DQo+ICAJfSBlbHNlIHsNCj4gIAkJV0FSTl9PTihjbWRx
X3RocmVhZF9zdXNwZW5kKGNtZHEsIHRocmVhZCkgPCAwKTsNCj4gLQkJY3Vycl9wYSA9IHJlYWRs
KHRocmVhZC0+YmFzZSArIENNRFFfVEhSX0NVUlJfQUREUikgPDwNCj4gLQkJCWNtZHEtPnBkYXRh
LT5zaGlmdDsNCj4gLQkJZW5kX3BhID0gcmVhZGwodGhyZWFkLT5iYXNlICsgQ01EUV9USFJfRU5E
X0FERFIpIDw8DQo+IC0JCQljbWRxLT5wZGF0YS0+c2hpZnQ7DQo+ICsJCWN1cnJfcGEgPSBjbWRx
X3JlZ19yZXZlcnRfYWRkcihyZWFkbCh0aHJlYWQtPmJhc2UgKyBDTURRX1RIUl9DVVJSX0FERFIp
LA0KPiArCQkJCQkgICAgICAgY21kcS0+cGRhdGEpOw0KPiArCQllbmRfcGEgPSBjbWRxX3JlZ19y
ZXZlcnRfYWRkcihyZWFkbCh0aHJlYWQtPmJhc2UgKyBDTURRX1RIUl9FTkRfQUREUiksDQo+ICsJ
CQkJCSAgICAgIGNtZHEtPnBkYXRhKTsNCj4gIAkJLyogY2hlY2sgYm91bmRhcnkgKi8NCj4gIAkJ
aWYgKGN1cnJfcGEgPT0gZW5kX3BhIC0gQ01EUV9JTlNUX1NJWkUgfHwNCj4gIAkJICAgIGN1cnJf
cGEgPT0gZW5kX3BhKSB7DQo+IEBAIC02NjMsNiArNzIyLDkgQEAgc3RhdGljIGludCBjbWRxX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJaWYgKGVycikNCj4gIAkJcmV0
dXJuIGVycjsNCj4gIA0KPiArCWlmIChjbWRxLT5wZGF0YS0+ZG1hX21hc2tfYml0KQ0KPiArCQlk
bWFfc2V0X2NvaGVyZW50X21hc2soZGV2LCBETUFfQklUX01BU0soY21kcS0+cGRhdGEtPmRtYV9t
YXNrX2JpdCkpOw0KPiArDQo+ICAJY21kcS0+bWJveC5kZXYgPSBkZXY7DQo+ICAJY21kcS0+bWJv
eC5jaGFucyA9IGRldm1fa2NhbGxvYyhkZXYsIGNtZHEtPnBkYXRhLT50aHJlYWRfbnIsDQo+ICAJ
CQkJCXNpemVvZigqY21kcS0+bWJveC5jaGFucyksIEdGUF9LRVJORUwpOw0KPiBAQCAtNzgyLDYg
Kzg0NCwxNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGdjZV9wbGF0IGdjZV9wbGF0X210ODE5NSA9
IHsNCj4gIAkuZ2NlX251bSA9IDINCj4gIH07DQo+ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
Z2NlX3BsYXQgZ2NlX3BsYXRfbXQ4MTk2ID0gew0KPiArCS50aHJlYWRfbnIgPSAzMiwNCj4gKwku
c2hpZnQgPSAzLA0KPiArCS5tbWluZnJhX29mZnNldCA9IDB4ODAwMDAwMDAsIC8qIDJHQiAqLw0K
PiArCS5jb250cm9sX2J5X3N3ID0gdHJ1ZSwNCj4gKwkuc3dfZGRyX2VuID0gdHJ1ZSwNCj4gKwku
Z2NlX3ZtID0gdHJ1ZSwNCj4gKwkuZG1hX21hc2tfYml0ID0gMzUsDQo+ICsJLmdjZV9udW0gPSAy
DQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBjbWRxX29m
X2lkc1tdID0gew0KPiAgCXsuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NzktZ2NlIiwgLmRh
dGEgPSAodm9pZCAqKSZnY2VfcGxhdF9tdDY3Nzl9LA0KPiAgCXsuY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDgxNzMtZ2NlIiwgLmRhdGEgPSAodm9pZCAqKSZnY2VfcGxhdF9tdDgxNzN9LA0KPiBA
QCAtNzkwLDYgKzg2Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGNtZHFf
b2ZfaWRzW10gPSB7DQo+ICAJey5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4OC1nY2UiLCAu
ZGF0YSA9ICh2b2lkICopJmdjZV9wbGF0X210ODE4OH0sDQo+ICAJey5jb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE5Mi1nY2UiLCAuZGF0YSA9ICh2b2lkICopJmdjZV9wbGF0X210ODE5Mn0sDQo+
ICAJey5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1nY2UiLCAuZGF0YSA9ICh2b2lkICop
JmdjZV9wbGF0X210ODE5NX0sDQo+ICsJey5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Ni1n
Y2UiLCAuZGF0YSA9ICh2b2lkICopJmdjZV9wbGF0X210ODE5Nn0sDQo+ICAJe30NCj4gIH07DQo+
ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBjbWRxX29mX2lkcyk7DQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oIGIvaW5jbHVkZS9saW51eC9t
YWlsYm94L210ay1jbWRxLW1haWxib3guaA0KPiBpbmRleCBhOGYwMDcwYzdhYTkuLjc5Mzk4YmY5
NWY4ZCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9tYWlsYm94L210ay1jbWRxLW1haWxi
b3guaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oDQo+
IEBAIC03OSw1ICs3OSw3IEBAIHN0cnVjdCBjbWRxX3BrdCB7DQo+ICB9Ow0KPiAgDQo+ICB1OCBj
bWRxX2dldF9zaGlmdF9wYShzdHJ1Y3QgbWJveF9jaGFuICpjaGFuKTsNCj4gK2RtYV9hZGRyX3Qg
Y21kcV9nZXRfb2Zmc2V0X3BhKHN0cnVjdCBtYm94X2NoYW4gKmNoYW4pOw0KPiArYm9vbCBjbWRx
X2FkZHJfbmVlZF9vZmZzZXQoc3RydWN0IG1ib3hfY2hhbiAqY2hhbiwgZG1hX2FkZHJfdCBhZGRy
KTsNCj4gIA0KPiAgI2VuZGlmIC8qIF9fTVRLX0NNRFFfTUFJTEJPWF9IX18gKi8NCg0K

