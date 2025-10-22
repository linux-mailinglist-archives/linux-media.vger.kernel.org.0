Return-Path: <linux-media+bounces-45181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDC1BFA1AE
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28E43404208
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 05:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256702EF67F;
	Wed, 22 Oct 2025 05:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="E0tikdAB";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="uZnrbAG0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B082EDD51;
	Wed, 22 Oct 2025 05:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761111956; cv=fail; b=K4qWkZf45UeaOmRbYVfcDmQqsjItouUGeYh85uNRgAzOIgWF01g5XJrBEXjKrBHfo06Tq4L8qMPXYiC7HyKdJpcp1QA4vp7U0tO6KsFGYsrvPsU+A/P2neoybYlUKvvkudLvHy2ocgjpWLRIBgpIN2jovnk6g/iAHAhwtE5Mkp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761111956; c=relaxed/simple;
	bh=IVXQOAoez2xRYFETg/dUSQMMy5y2cEhSqBEugysUH/U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rT0iOlLlSVdgNFOfaTlC2s2hYF0ijDD3EcitT/vJDheFF+mGXhkyu7zmroZA9zWp/Xy+5CkwwbiNMPUbdQc9DdKaPa+VyFpAz1bOKrUgYh2z039z/LbTKy2ert3Ba4i2/e3CWooX4JPyflzDpBPC9GHvwoTGNTXlmXjZ+Oj9N1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=E0tikdAB; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=uZnrbAG0; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5c65f290af0a11f0b33aeb1e7f16c2b6-20251022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=IVXQOAoez2xRYFETg/dUSQMMy5y2cEhSqBEugysUH/U=;
	b=E0tikdABXE/YH1LH/R36Lt9dc6meMZITOredTboLlBs18zCRadqAFB8KLKi0TEj8Rtno0Z8kwfqtNjUUhC4V/fpWhhrc/pdnLyiV2z2xDx+RtZ3nJe/iNxZxneDR7vcwKNIG0C+bgSzx2Op3EOa1cMIzeLM1pDqw/EMwGC3g2wo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:d93c353a-e6a4-4c97-bda6-277491ca0f51,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1ef5b258-98d8-4d0a-b903-bc96efd77f78,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5c65f290af0a11f0b33aeb1e7f16c2b6-20251022
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 408767108; Wed, 22 Oct 2025 13:45:48 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 22 Oct 2025 13:45:46 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 22 Oct 2025 13:45:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEaE/8bnVI7aoBNqVx76pdWKulYwLMaNZqskQBNCIKYNzsY8/PFQSoo408BB81eU+z3XA8VCRBNuoMyKgElUwkvOmEYZuvtSCIrQfC/4tCrw2iH1JKxaVHrr7CGFY6u+zFRZDipQUOR7Qq6sidzaW6965wiBf9hHJf47Gmjutt5/Dpb7D9zElQ8F51c4l4SKPneQQ91X8o/Qo/aCICEhGjEqCBoEHwzrvQEQO0drOyukkbT56mY1dESUIOUJwsMHQYxTW2luwRDn2g3kPGTBx/gO0PJA6/qtvRl+grdcNMW96DrQoT4fSdEaEIt/BED5bg7ej9+Irp5oycQd2xLcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVXQOAoez2xRYFETg/dUSQMMy5y2cEhSqBEugysUH/U=;
 b=chOHaTqeeVG/2UEQyUfPbO+Is/Q1Mi5Y+jTwBRbU0gGfUfl7OkJ0DXMfawBWyJUoWFROdTWi2dY6kPmuLdRx+GsxWj56G1L0DfaQSnu4sbw3LTb5a0OTBA4eFKiwno4T1GwzOBofgmildGgesaBcnbdqWEvw/atoE5L1ekoctdxrUEFiNXbdo/giuNy8uFu8b+wCrqhJZUkJ3JpufTJ2AIPL35PRdvnoF2jwbLaueojOCZrYIxJyRiWRXfbcUw/2ri5LJBRih6nNqU0wIPPsrtcSebg+a3W7v+v83AQMndTnGOsX94X4ApkMdOq04sk3qI0v4D6XNAUIWSq39LiRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVXQOAoez2xRYFETg/dUSQMMy5y2cEhSqBEugysUH/U=;
 b=uZnrbAG0nqV2SdrbfJqho5btHY3yP1T8jp0PRl0p+7lyN06NCIjHPf+ZrO153+Ugrh4xHRIoTUZgdQ1LNeDk+L/C2HyAak3aRvrkIzH8S+9OAX+ugGbu7PKgXIgC4LJgvtNywFA/2+4J9vMB5bBBL0q8T1kkty6fdexqCZJ4pE8=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYSPR03MB8084.apcprd03.prod.outlook.com (2603:1096:400:473::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 05:45:43 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 05:45:43 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/8] media: mediatek: vcodec: Add core-only VP9
 decoding support for MT8189
Thread-Topic: [PATCH v4 4/8] media: mediatek: vcodec: Add core-only VP9
 decoding support for MT8189
Thread-Index: AQHcPmNfBWj8l4JPK0i5y6CfXPi1jLTE47QAgAjNuQA=
Date: Wed, 22 Oct 2025 05:45:43 +0000
Message-ID: <0106493ff42524553e4a953757afd21766215e5a.camel@mediatek.com>
References: <20251016060747.20648-1-kyrie.wu@mediatek.com>
	 <20251016060747.20648-5-kyrie.wu@mediatek.com>
	 <f5956178a0e5d91dabc12e89f666eac2140f141e.camel@collabora.com>
In-Reply-To: <f5956178a0e5d91dabc12e89f666eac2140f141e.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYSPR03MB8084:EE_
x-ms-office365-filtering-correlation-id: f0fa6500-2c8f-4948-1024-08de112e3d8a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?OHd5TzBIUkUwSU95MXEwQ2F5UkpoUUZqczh4aXpzRThrNlpiUkJWTk9uNVlT?=
 =?utf-8?B?QjVVVVJrMWpNV2FxaGFrSVlqdW50OHR2Sjd0bWxnSEN2L25KODJuaFdMZm1W?=
 =?utf-8?B?ZzB1N2xsM2tlUzVVanJQV1B0YVpxaG42QXVqZWRFNS9KVkRRZzV1dk9oYVJ1?=
 =?utf-8?B?RHlKTGQ4dnpObWEyZzZYODZkRUgrWm5nYnYyWFlQV05YWk1MUThiZDV0K1B1?=
 =?utf-8?B?S3REakFXVW5pV1pUeDBvZndEUUNOYkFiOHBxbU14VWRjd2t0bkJ3bVZQY3pw?=
 =?utf-8?B?Ty8vRUJnTUhjZG5RKzh5VmZENWxRSnlVRVpodStodVFTNG1Xc2hPSG9oT0xu?=
 =?utf-8?B?dDhpa1RlK2JSYk1TVTRSVkpKb1o2Sjg4MWlFZlpNUUJmZHNaRDUrVVlqRmR6?=
 =?utf-8?B?WjZYdnpxY2Z5WFhucG10d0hibXU4bkp0UFV5ZW9XanhiQ3JVVW1tYloxOXJ0?=
 =?utf-8?B?T3F1K1JtUlRaL20zaDduS1BlcUhhb3lWRHU4elRmYWZkYi9PUFlhVG45eDVm?=
 =?utf-8?B?SG5VV2hMOXlIS0Z4dEJ0c2NSaVErY1Y2SkZUN0ZoNzA5d0xTcVEwVjVjeVVB?=
 =?utf-8?B?aVFmV0UyZjYreU5RdnRsbkxzYVZGakZxTFhRZnVxMzhjeDZvTFlKL3ZYT1Vh?=
 =?utf-8?B?ZFl1cXhsaE5oK2NlZmdCSmtiMlBuT2VNbllMTWhHOWs1eDVTSThJa3RtWlh3?=
 =?utf-8?B?bWtQYVpOM3duSnlBR0JOOTZ6UXlXVERsOEwyc2hNUlM0QzBMdDl4MVNPaHY3?=
 =?utf-8?B?bDBUNnhFeVlSSG5ZK3dDQ3lyeXlrbUFER3d5YllZYW9ocjkzSnJ2djhQdWNz?=
 =?utf-8?B?eTh0SFBMV1lnUUtVRk5oM2RnbVROSjlFN1hoWWpVZk85aTMyUi9YWG5sRjVJ?=
 =?utf-8?B?VXRSWHNDVHVqZ1VQb1BmdWxmUzZTSGV6ZUd3bFlaVlB2bC9XZXVFbGVDU1FC?=
 =?utf-8?B?azR6NWQxUTZvQ2xldElnUVczOTdRenZrUjZqamJFMmQrRGhTZWt4RWFiUHRT?=
 =?utf-8?B?anlCWlAvUlhsQitXUDA1UndxTlB1ZVQxczRlODhlemlhZ1Iwb21OQm9YaHBp?=
 =?utf-8?B?Sjkya1V2QjNWRjRoK0YxZ1ZXWms3Qmx4OWpVTHJYaC9veVpjTXI1YnhSVzND?=
 =?utf-8?B?Qm9HNHQ0cXBUaGU5SFpFQjk2ZXUzemJSaHJhQUdnTzk3andXcVNIYkJFbHJL?=
 =?utf-8?B?K3hRNGZZaDZ5R3VzcnZzalJKcy9WbnBNcjVXRm1wKzEvMjYvRjZadEZ6N0xF?=
 =?utf-8?B?UnNqTlRkdStNM0EyUFlUYWRLTzI0cE5kNWJyK3B2cVZLK1RZQS9CRGE4dTEx?=
 =?utf-8?B?L0JubnhLWmdFWGxDQXNhTEY1ZzA2dU42ck5uY3p4SG1pUThOSWtVQ0MwV3Q4?=
 =?utf-8?B?WllXRTNDR0podDA2YVUvdzBFcVJ0M2lqbTJGb252ajh5UCsyczB5Zi96NWNq?=
 =?utf-8?B?RFkyWVdmMVh3MWVWdVA1N3FwalptaGNSZkdWQTgzQlIvZTdpNDRVby9DZ01Q?=
 =?utf-8?B?eHhJNUQzNEpqdUJNV1dlVXlLQkdFN0pEZllDSTZvVkpNNHhTVGN4Zi9OVzcw?=
 =?utf-8?B?NUEzVzdoYUZ1dWEvbnRyczk2Um95QmdvdG9MeWNzOEdRWHEzNjN1SXZ4UUtv?=
 =?utf-8?B?U2Z4ejJhOGNSc3luY3RCN0phdmkwUlppYTJXdWd6NUZZdFFuRmlUeE5SRU1z?=
 =?utf-8?B?VUlxMVlkRnVXUGZESmM2bGNKSU85L3h2eUg4djl5K1FtQkpGeG1lK0o4NmU4?=
 =?utf-8?B?ZkdpRWk1S0tZMWgyWlJSSW5EQkNWdG5kSXZEWTZKVTBRdXJMc3lKR3BGOXN3?=
 =?utf-8?B?aGJ3RWVwWnhUVlZBbVcveG5zajBiVUMyWDJyNHVBMS9nMEN3clk1OVY3OHFk?=
 =?utf-8?B?dGRmQkRUR3N3ajhyVlp1cGRYVkdyb0NQSktWMkhNUkRiVGc4VU9PZ0tKVkJk?=
 =?utf-8?B?RDVSeFdBNkFZOWNwaWxMM3dEby9HYzIxOUN1WmsyWFNkMkttSnJuUitUaHFR?=
 =?utf-8?B?R2lLTC9DT2ptRHQwVVIyK2toWDh0Vk9GVFE2aVArSEhYQVhvd0VqMVpuOWJX?=
 =?utf-8?B?NHBGZkFleWk2V1FJTVBEMm04SGVNb0gvbGxMUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnovZFZmeHlwQWdtS2hmWUtxblJpYnJNUlBqendlZStXa1RiK1V5c05QZUt6?=
 =?utf-8?B?d0hHdTQ5TGdJaGlLZlpkM3F2eVdINE9XdVE5Q3VSbW51QXNkNm4zdVNxQUpP?=
 =?utf-8?B?NHlpWWdRZU1EaUhqc3ZiZkkrQVc2d1BYbVcxWWNuaTg2VUN5TndwbCsrdnZW?=
 =?utf-8?B?Rjc0d2lETHM3Q1FTclhFU3djTjRteEZodCtETW1KcGN3SWppT0xtSmhNaEN2?=
 =?utf-8?B?am55em5adjE5TVFTd01GRVJNN1FNMm5ZZUVUbGRjb2F4MGhoTnlWZFlUVWta?=
 =?utf-8?B?R3RmelRGQVArNkFvVldRRUMzQVA5SS9hWXEwaTRsUnk3U0NBZGJWV3p3bDg5?=
 =?utf-8?B?WjB0dDU2Ykg5UDJXTEFqeCs0U213YlFnd1BzMkdqdlRRMzd4MGVubEkrUlQw?=
 =?utf-8?B?YmtFTVZDbWNKYStkL1FJaWlGUnVUQ3k4cFRKY2pTeXdkdU9EK25scmlTV1Np?=
 =?utf-8?B?QkdQckV6R29zQUtSSk5QVFdpRllCdk5OVXRXOWpGV0ZQZDZnM1ljeG1ac2N6?=
 =?utf-8?B?OVcySEU5Ym9vY25EL1dpdGFmbDluWjdaSStid1ozaGdna1ZPUWFaUUdFQjFu?=
 =?utf-8?B?emwvaWllUjhXSXBtVWU5UElTM0NnWHVFMFl4UFQ3K0ZTaU5jdkx4cWh6Z2M2?=
 =?utf-8?B?citlNWY4aEpNMEo2MnRjekJWcENub0NKTlVscDZlaWhuZkN2RzV3d1JxTzRT?=
 =?utf-8?B?WDhLYjV5OXdSMFZWQit0QjVTUXNmaXAxZjdKYURqdTcwRUFoSXdRbndnSnFv?=
 =?utf-8?B?Q0c2ZGY0QmZqR2NCRXA4NUFKYUtQT1o5cVQzRkRjR2EzTkg4c2w4MVYrTzNC?=
 =?utf-8?B?ZmcyTnFjSnRvOFJhcnRrazl0YlVLM21KSWRweG9McjBXK25ZSm1oRGRvRWFO?=
 =?utf-8?B?OGN2R1kvK1J0T1Zjd2NzeVBSZGRWQXlmWkFXQmV3bGw4Q0RkNU5xQnMrSWFq?=
 =?utf-8?B?SFdacWZlRzZaaXAvRTZRcDI0MytnRzVSQitabWFMYkx0cGVnelNRMldxVjRQ?=
 =?utf-8?B?Rlhqa2hvdDBENVpaNWxpRVUvR2lmYTB1K3JZVG9lMktLcmFJMGwvVll5QUJv?=
 =?utf-8?B?dTBncUNPelk2Q1kvc0xMczEvM3hNNThxUzhoaWhqS0s1bmNDWmpuVDBCTGxN?=
 =?utf-8?B?VHpWeGhiL1NJTDNGVU5EK2g2U3Rzd3NjbjVBWStmaklMOXZBc3IwQU10cmpB?=
 =?utf-8?B?OUIyK0xLVXNXQ0N2YXF4c3NrSXZZdk1wTFVBTUpjSWRoa3g4aWJ6NTNCY2tP?=
 =?utf-8?B?dEQzdmNaWE1rNDZaL0dKT25mZE9ybFhtSU1objZBTzYxY2hRL3JKNHNwRk9G?=
 =?utf-8?B?Tnd0T3dsSU1wWWhLalNGYzRXb2Rzb05KdXhOQWlVamd0a0hqRjdua014ZzVC?=
 =?utf-8?B?WG8ra1ZHcU1kRWVwVVdKQjl1aDZtR21tN3JOamdoZi9CSnd2d055TENpRjlR?=
 =?utf-8?B?V0c5TzZzck1uL09YOFJBaGhxRnRwRFJ6SmdtNkZuWml2dUE4NDBYTWxoZTNq?=
 =?utf-8?B?VEN4K1l6Rm1PdENtS0wxd2RuV2Y2Q2dXSUdyc3A4TGNhYnhwSlVjVm9QZzRo?=
 =?utf-8?B?U2Jxb0JsMmpEOGlYRmZKcFJCV3dZT2JHL1ZZSGdTYmtyeDVraDVialQxNjU2?=
 =?utf-8?B?bGk2azhUbUtGRE1SSGI5NmcxcHZaS3lTZld0Z2xLSWpXSm5tejJtR28rZ25j?=
 =?utf-8?B?bDdaeEJJbkIzdUdoNDB5YjdvYlFjVGhlb0dzWU51V0pNeEVkVmhob3NNVUox?=
 =?utf-8?B?OHBVSmkxYmY5OHhjVFdPSkhLeUhYRjQ5SnA0bU55M0lvcDFWMy95aWFrMFhv?=
 =?utf-8?B?bndxRTE3RnY4U1B0NFhaZkV2KzluZTduN2N2QW15Qkc0UDFQdjNreFNnbkNG?=
 =?utf-8?B?OTQ0M09ra1dLem5lWXphM2M0cjRsNExlcE5TUlhqcUNRQW8wa0tuem1JMjdw?=
 =?utf-8?B?TnZQTGNWempOSmwxTE1sWDhYZER2NVBGSkFGVU1zTC9zclhHZlpzdk9RUExO?=
 =?utf-8?B?TWQ4US9iYWZMUjdlYzFwblk5dFhET3lzTkdxandyQlFVbzExSDRlV29rSmRy?=
 =?utf-8?B?a0tqOTBBS0JHeEZBOXovUytacWFsKzlHV2thcDdyODF3Nkl2UEQrK3QxRWJJ?=
 =?utf-8?Q?GI7pkppXJ6xz9PUSfEn99bUDH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40457C2D9A455847B63B77153894B6C2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fa6500-2c8f-4948-1024-08de112e3d8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 05:45:43.0810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgtA1JYG/j2fF0zcHzDbchagsto9O256JIQvDg+IRpu28+0oOsgl+1lCTB4lVLrQccdMF/L2l1ZmMGZ9PYv38A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8084

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDExOjE5IC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIGpldWRpIDE2IG9jdG9icmUgMjAyNSDDoCAxNDowNyArMDgwMCwg
S3lyaWUgV3UgYSDDqWNyaXQgOg0KPiA+IEltcGxlbWVudGVkIGNvcmUtb25seSBWUDkgZGVjb2Rp
bmcgZnVuY3Rpb25zIGZvciBNVDgxODkuDQo+IA0KPiBXaGF0IGRvZXMgImNvcmUtb25seSIgbWVh
bnMgPyBEaWQgeW91IG1lYW4gc2luZ2xlIGNvcmUgPw0KRGVhciBOaWNvbGFzLA0KDQpZZXMsIGl0
J3MgYSByaWdodCB0aGlua2luZy4gSSB3aWxsIGNoYW5nZSB0byAic2luZ2xlIGNvcmUiIHRvIHJl
bW92ZQ0KdGhlIG1pc3NpbmcgdW5kZXJzdGFuZGluZy4NCg0KVGhhbmtzLg0KPiANCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBLeXJpZSBXdSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IC0t
LQ0KPiA+ICAuLi4vdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfbGF0X2lmLmMgfCAy
NyArKysrKysrKysrKy0tDQo+ID4gLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNl
cnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY192
cDlfcmVxXw0KPiA+IGxhdF9pZi5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY192cDlfcmVxXw0KPiA+IGxhdF9pZi5jDQo+ID4g
aW5kZXggZmEwZjQwNmY3NzI2Li4wNDE5NzE2NGZiODIgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY192
cDlfcmVxXw0KPiA+IGxhdF9pZi5jDQo+ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY192cDlfcmVxXw0KPiA+IGxhdF9p
Zi5jDQo+ID4gQEAgLTIzLDYgKzIzLDcgQEANCj4gPiAgDQo+ID4gICNkZWZpbmUgVlA5X1RJTEVf
QlVGX1NJWkUgNDA5Ng0KPiA+ICAjZGVmaW5lIFZQOV9QUk9CX0JVRl9TSVpFIDI1NjANCj4gPiAr
I2RlZmluZSBWUDlfUFJPQl9CVUZfNEtfU0laRSAzODQwDQo+ID4gICNkZWZpbmUgVlA5X0NPVU5U
U19CVUZfU0laRSAxNjM4NA0KPiA+ICANCj4gPiAgI2RlZmluZSBIRFJfRkxBRyh4KSAoISEoKGhk
ciktPmZsYWdzICYgVjRMMl9WUDlfRlJBTUVfRkxBR18jI3gpKQ0KPiA+IEBAIC02MTYsNyArNjE3
LDEwIEBAIHN0YXRpYyBpbnQNCj4gPiB2ZGVjX3ZwOV9zbGljZV9hbGxvY193b3JraW5nX2J1ZmZl
cihzdHJ1Y3QNCj4gPiB2ZGVjX3ZwOV9zbGljZV9pbnN0YW5jZSAqaQ0KPiA+ICAJfQ0KPiA+ICAN
Cj4gPiAgCWlmICghaW5zdGFuY2UtPnByb2IudmEpIHsNCj4gPiAtCQlpbnN0YW5jZS0+cHJvYi5z
aXplID0gVlA5X1BST0JfQlVGX1NJWkU7DQo+ID4gKwkJaW5zdGFuY2UtPnByb2Iuc2l6ZSA9ICgo
Y3R4LT5kZXYtPmNoaXBfbmFtZSA9PQ0KPiA+IE1US19WREVDX01UODE5NikgfHwNCj4gPiArCQkJ
CSAgICAgICAoY3R4LT5kZXYtPmNoaXBfbmFtZSA9PQ0KPiA+IE1US19WREVDX01UODE4OSkpID8N
Cj4gPiArCQkJCQlWUDlfUFJPQl9CVUZfNEtfU0laRSA6DQo+ID4gVlA5X1BST0JfQlVGX1NJWkU7
DQo+IA0KPiBJIGZlZWwgbGlrZSB0aGlzIHdpbGwga2VlcCBncm93aW5nLCB0aGVuIHlvdSdsbCBt
b3ZlIHRvIDhLIGFuZCBpdA0KPiB3aWxsIGNvbnRpbnVlLg0KPiBZb3UgYWxyZWFkeSBtYXRjaCBl
dmVyeSBTb0MgaW4gdGhlIGRyaXZlciwgeW91IHNob3VsZCBjb21lIHVwIHdpdGgNCj4gU29DDQo+
IGNvbmZpZ3VyYXRpb24gZGF0YSBzdHJ1Y3R1cmUgc28geW91IGRvbid0IGhhdmUgdG8gYWRkIGRv
YyBjaGVjaw0KPiBjb25kaXRpb25zIGFsbA0KPiBvdmVyIHRoZSBwbGFjZS4gVGhpcyBjaGFuZ2Ug
aXMgYWxzbyBub3QgcmVmbGVjdGVkIGluIHRoZSBjb21taXQNCj4gbWVzc2FnZS4NCg0KVGhlIHBy
b2Igc2l6ZSBpcyBpbmRlcGVuZGVudCB3aXRoIHJlc29sdXRpb24uIEJhc2VkIG9uIGZlZWRiYWNr
IGZyb20NCmhhcmR3YXJlIGRlc2lnbmVyLCB0aGlzIHNpemUgd29uJ3QgaW5jcmVhc2UuIERpZmZl
cmVudCBJQ3Mgd2lsbCBvbmx5DQpjaG9vc2UgYmV0d2VlbiA0MDk2IGFuZCAyNTYwLiBIb3dldmVy
LCBhcyBtb3JlIElDcyBhcmUgYWRkZWQsIHJlZHVuZGFudA0KY29kZSB3aWxsIGJlY29tZSBpbmNy
ZWFzaW5nbHkgY29tbW9uLiBJJ20gY29uc2lkZXJpbmcgYWRkaW5nIGEgZnVuY3Rpb24NCnRvIGhh
bmRsZSB0aGlzLCBhcyBzaG93biBiZWxvdzoNCg0Kc3RhdGljIGludCBtdGtfdmNvZGVjX2dldF92
cDlfcHJvYl9zaXplKGludCBjaGlwX25hbWUpDQp7DQoJc3dpdGNoIChjaGlwX25hbWUpIHsNCgkJ
Y2FzZSBNVEtfVkRFQ19NVDgxODk6DQoJCWNhc2UgTVRLX1ZERUNfTVQ4MTg5Og0KCQkJcmV0dXJu
IFZQOV9QUk9CX0JVRl80S19TSVpFOw0KCQlkZWZhdWx0Og0KCQkJcmV0dXJuIFZQOV9QUk9CX0JV
Rl9TSVpFOw0KCX0NCn0NCg0KdGhlIHByb2Igc2l6ZSBpcyBzZXQgbGlrZSB0aGF0Og0KaW5zdGFu
Y2UtPnByb2Iuc2l6ZSA9DQptdGtfdmNvZGVjX2dldF92cDlfcHJvYl9zaXplKC4uLikNCg0KQ291
bGQgeW91IHBsZWFzZSBnaXZlIGZ1cnRoZXIgY29tbWVudHMgZm9yIGFib3ZlIHNvbHV0aW9uPw0K
DQpUaGFua3MuDQoNCj4gDQo+ID4gKw0KPiA+ICAJCWlmIChtdGtfdmNvZGVjX21lbV9hbGxvYyhj
dHgsICZpbnN0YW5jZS0+cHJvYikpDQo+ID4gIAkJCWdvdG8gZXJyOw0KPiA+ICAJfQ0KPiA+IEBA
IC02OTYsMjEgKzcwMCwyMiBAQCBzdGF0aWMgaW50IHZkZWNfdnA5X3NsaWNlX3RpbGVfb2Zmc2V0
KGludA0KPiA+IGlkeCwgaW50DQo+ID4gbWlfbnVtLCBpbnQgdGlsZV9sb2cyKQ0KPiA+ICAJcmV0
dXJuIG1pbihvZmZzZXQsIG1pX251bSk7DQo+ID4gIH0NCj4gPiAgDQo+ID4gLXN0YXRpYw0KPiA+
IC1pbnQgdmRlY192cDlfc2xpY2Vfc2V0dXBfc2luZ2xlX2Zyb21fc3JjX3RvX2RzdChzdHJ1Y3QN
Cj4gPiB2ZGVjX3ZwOV9zbGljZV9pbnN0YW5jZSAqaW5zdGFuY2UpDQo+ID4gK3N0YXRpYyBpbnQg
dmRlY192cDlfc2xpY2Vfc2V0dXBfc2luZ2xlX2Zyb21fc3JjX3RvX2RzdChzdHJ1Y3QNCj4gPiB2
ZGVjX3ZwOV9zbGljZV9pbnN0YW5jZSAqaW5zdGFuY2UsDQo+ID4gKwkJCQkJCSAgICAgICBzdHJ1
Y3QNCj4gPiBtdGtfdmNvZGVjX21lbQ0KPiA+ICpicywNCj4gPiArCQkJCQkJICAgICAgIHN0cnVj
dCB2ZGVjX2ZiDQo+ID4gKmZiKQ0KPiA+ICB7DQo+ID4gLQlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVy
ICpzcmM7DQo+ID4gLQlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICpkc3Q7DQo+ID4gKwlzdHJ1Y3Qg
bXRrX3ZpZGVvX2RlY19idWYgKnNyY19idWZfaW5mbzsNCj4gPiArCXN0cnVjdCBtdGtfdmlkZW9f
ZGVjX2J1ZiAqZHN0X2J1Zl9pbmZvOw0KPiA+ICANCj4gPiAtCXNyYyA9IHY0bDJfbTJtX25leHRf
c3JjX2J1ZihpbnN0YW5jZS0+Y3R4LT5tMm1fY3R4KTsNCj4gPiAtCWlmICghc3JjKQ0KPiA+ICsJ
c3JjX2J1Zl9pbmZvID0gY29udGFpbmVyX29mKGJzLCBzdHJ1Y3QgbXRrX3ZpZGVvX2RlY19idWYs
DQo+ID4gYnNfYnVmZmVyKTsNCj4gPiArCWlmICghc3JjX2J1Zl9pbmZvKQ0KPiA+ICAJCXJldHVy
biAtRUlOVkFMOw0KPiA+ICANCj4gPiAtCWRzdCA9IHY0bDJfbTJtX25leHRfZHN0X2J1ZihpbnN0
YW5jZS0+Y3R4LT5tMm1fY3R4KTsNCj4gPiAtCWlmICghZHN0KQ0KPiA+ICsJZHN0X2J1Zl9pbmZv
ID0gY29udGFpbmVyX29mKGZiLCBzdHJ1Y3QgbXRrX3ZpZGVvX2RlY19idWYsDQo+ID4gZnJhbWVf
YnVmZmVyKTsNCj4gPiArCWlmICghZHN0X2J1Zl9pbmZvKQ0KPiA+ICAJCXJldHVybiAtRUlOVkFM
Ow0KPiA+ICANCj4gPiAtCXY0bDJfbTJtX2J1Zl9jb3B5X21ldGFkYXRhKHNyYywgZHN0LCB0cnVl
KTsNCj4gPiArCXY0bDJfbTJtX2J1Zl9jb3B5X21ldGFkYXRhKCZzcmNfYnVmX2luZm8tPm0ybV9i
dWYudmIsDQo+ID4gJmRzdF9idWZfaW5mby0NCj4gPiA+IG0ybV9idWYudmIsIHRydWUpOw0KPiA+
IA0KPiA+ICANCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+ID4gQEAgLTE4MDAsNyArMTgwNSw3
IEBAIHN0YXRpYyBpbnQgdmRlY192cDlfc2xpY2Vfc2V0dXBfc2luZ2xlKHN0cnVjdA0KPiA+IHZk
ZWNfdnA5X3NsaWNlX2luc3RhbmNlICppbnN0YW5jZSwNCj4gPiAgCXN0cnVjdCB2ZGVjX3ZwOV9z
bGljZV92c2kgKnZzaSA9ICZwZmMtPnZzaTsNCj4gPiAgCWludCByZXQ7DQo+ID4gIA0KPiA+IC0J
cmV0ID0gdmRlY192cDlfc2xpY2Vfc2V0dXBfc2luZ2xlX2Zyb21fc3JjX3RvX2RzdChpbnN0YW5j
ZSk7DQo+ID4gKwlyZXQgPSB2ZGVjX3ZwOV9zbGljZV9zZXR1cF9zaW5nbGVfZnJvbV9zcmNfdG9f
ZHN0KGluc3RhbmNlLCBicywNCj4gPiBmYik7DQo+IA0KPiBUaGlzIGVudGlyZSBjaGFuZ2UgaXMg
bm90IGV4cGxhaW5lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYXQgYWxsLg0KPiBFeHBsYWluIHdo
eQ0KPiB0aGlzIGlzIG5lZWRlZCwgd2hhdCBkaWZmZXJlbmNlIGl0IG1ha2VzLiBUaGVyZSBpcyBu
byBjbGVhcg0KPiBpbmRpY2F0aW9uIHdlIGFyZSBpbg0KPiBhbiBNVDgxODkgY29kZSBwYXRoLCBz
byB0aGlzIGNoYW5nZSBjb3VsZCBoYXZlIGEgaW5jaWRlbmNlIG9uIGFsbA0KPiBzaW5nbGUgY29y
ZQ0KPiBTb0MgKGlmIGFueSkuDQo+IA0KPiBOaWNvbGFzDQoNCkluIHRoZSBkZWNvZGluZyBzb2Z0
d2FyZSBmbG93LCB0aGUgYXBwIHF1ZXVlIHNyYyBvciBkc3QgYnVmZmVyIHRvIHRoZQ0KZHJpdmVy
IHdpbGwgdHJ5IHRvIHNjaGVkdWxlIHRoZSBkZWNvZGluZyBzb2Z0d2FyZSBmbG93IGJ5IHF1ZXVp
bmcgdGhlDQp3b3JrIHF1ZXVlLiBBdCB0aGlzIHRpbWUsIG9ubHkgb25lIG9mIHRoZSBzcmMgb3Ig
ZHN0IGJ1ZmZlciBjYW4gYmUNCm9idGFpbmVkLiBIb3dldmVyLCBpbiB0aGUgb3JpZ2luYWwgc29m
dHdhcmUgZmxvdywgY2FsbGluZyB0aGUNCnZkZWNfdnA5X3NsaWNlX3NldHVwX3NpbmdsZV9mcm9t
X3NyY190b19kc3QgZnVuY3Rpb24gdXNpbmcNCnY0bDJfbTJtX25leHRfc3JjX2J1ZiB0byBnZXQg
dGhlIHNyYyBhbmQgZHN0IGJ1ZmZlcnMgd2lsbCByZXR1cm4NCi1FSU5WQUwsIGludGVycnVwdGlu
ZyB0aGUgZGVjb2RpbmcgcGlwZWxpbmUuIFRoZXJlZm9yZSwgdGhpcyBpbnRlcmZhY2UNCm5lZWRz
IHRvIGJlIG1vZGlmaWVkIHRvIHNldCBib3RoIHNyYyBhbmQgZHN0IGJ1ZmZlciB0byBzZXQgbWV0
YWRhdGEuDQoNClRoYW5rcy4NCg0KUmVnYXJkcywNCkt5cmllLg0KPiANCj4gPiAgCWlmIChyZXQp
DQo+ID4gIAkJZ290byBlcnI7DQo+ID4gIA0K

