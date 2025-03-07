Return-Path: <linux-media+bounces-27787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC4A55CBE
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 02:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FB0118848BA
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 01:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E268145323;
	Fri,  7 Mar 2025 01:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BTzAjcxF";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="uPb+uGzO"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0B129408;
	Fri,  7 Mar 2025 01:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309885; cv=fail; b=Q728hfYlLdWWMDIlWDBNKymQvaRONyVuJfjO0hIhBeoi+UF8zSgtmIkUgdn5TeSpH5PlBfO54HAlxEIi9osSrbJO5G37D7mzQvRn4zYEMIQJxIbXu2Cm4SPElW9r1dfufEdctj5I1Srp0hTHEEe8DzyxqfPM+/jSvD7A+nzg+JI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309885; c=relaxed/simple;
	bh=Fo2nMhoL/HFNOjDnfviESSHxKsO/qEQtGNIGwHhCQ+Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FM+1qhBaE1p4YkjngeT+F4iOwKGkGscA8TqkyxFsDUjpKM5FUXPC/9oy9BuB193JQj6WffIfmJWDNO52n62GBbUDq4l4bJn6DADkq/t13t1FbvrmWGJpy6QA+mgDjgWnWcF3ZV+WL3U5A/YrIhkD6Q7WSQgXDGaK+jne4AwNoq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BTzAjcxF; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=uPb+uGzO; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0cf61154faf111ef8eb9c36241bbb6fb-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Fo2nMhoL/HFNOjDnfviESSHxKsO/qEQtGNIGwHhCQ+Y=;
	b=BTzAjcxFrtdLn5MAyrBTez1mlUvvB/MMhHhM74NyJS8ADSf7y9ngVRaD+NjHisrZ+c3A4Rc2ivO8S+AxILJ6vjGpC1ZOZq7ud0bsBnbfjJEgw2J/z2FZpYdTEG6jlboVsAi0/YxLwFFAkbezVFWIhfWAv0yk50ZbCcOHVlbXaiM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d29fe750-c5d5-4a61-a325-5aadd35e87fa,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:d97e0e8c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:-10|4
	|50,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0cf61154faf111ef8eb9c36241bbb6fb-20250307
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 720856582; Fri, 07 Mar 2025 09:11:08 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 09:11:07 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 09:11:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNzDpuxvVgnbQI0Z9ZzLAGYl6kFUIiRD8c0gfmLzOsQwPfE8UEMEScxGNDcx74C26yox2Bs7We1XL5EimNcLSvb2DjLmIUrJ4tbCNdxDoX+a0+bGlfYnTGLMU/i/bd+8m+ufXaZlnTK6tzKQgGUdNzWLPfe+JHNxh/ogcQ8/+bcwSWbzMria9slDbG0G1KvM5X5RKWaFLnbdpwBPk2DQjTw6F+MXM8w+fq1298zNz9EUSUpAbOmSN9Xk/9NHyj/6sPDrIvphpOpD8VsmJN2VWcLZ14xku+ooVST+ZbqpMJhSORl/30cC5ltwj3E99oQgTKXywdfGnWQzmjTrMO8Erg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fo2nMhoL/HFNOjDnfviESSHxKsO/qEQtGNIGwHhCQ+Y=;
 b=w232ST5GzObInrCfOpSICd3hi6sOAEy/cBQ/4+pwLAQ2x0KQElwrBwwDRei7BKfX5l5xYsGLDlLzFeJ0iimGNwyY4iMzsqSdwk6jTxlmMideky0ta5HF7DvIeEFocUMy4TZ1BLIo40CpKP2ztApN+Mhcanmw6F4puDZfpWasy+YvpKoXdjelVQoYkklDOFRP7wmHN+op47uATe2C+vGz1InLSWdS+RNqli3/B94HPXJdY7I3/CTh2wGTQUpHn8KNjwlnWWEEenIVAPlXOg+71faXaJikFT1AJVnZG/dC3XSXrJpS6jhRkrVJ+11aZ8UnH5PNr/we9vBhNNLwULhy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fo2nMhoL/HFNOjDnfviESSHxKsO/qEQtGNIGwHhCQ+Y=;
 b=uPb+uGzO7JMIm24CK3fgsCuxOUoLb3nI8pR1/7MJ7qZg5Xg00lS69LB7mALzQls50IHhgJI5oWkJmHfHDdkEYsYjK60Xd0cWgg6BaMdsZKlN78IpKydU66bj260pDK3cTIE5vM8Uwokw1TtWByGALEBdTmO3bVkITBpwEjhbrgU=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB8750.apcprd03.prod.outlook.com (2603:1096:405:66::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 01:11:04 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 01:11:04 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
CC: "robh@kernel.org" <robh@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?=
	<Sirius.Wang@mediatek.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "fshao@chromium.org" <fshao@chromium.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org"
	<treapking@chromium.org>
Subject: Re: [PATCH v4 3/8] mailbox: mtk-cmdq: Add driver data to support for
 MT8196
Thread-Topic: [PATCH v4 3/8] mailbox: mtk-cmdq: Add driver data to support for
 MT8196
Thread-Index: AQHbgcg2iEEFnb0qD02RDglBS18jJrNizUQAgAGCroCAADpRgIABgDqAgAAjjYCAAMn8gA==
Date: Fri, 7 Mar 2025 01:11:04 +0000
Message-ID: <a7a48975665ba3493166e0c55ecf9e82f6df8cca.camel@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
	 <20250218054405.2017918-4-jason-jh.lin@mediatek.com>
	 <652e435c-563b-496a-a4c3-c2e2b665abcf@collabora.com>
	 <5aa04ff5fa567468f32921d4014bbae696c6470f.camel@mediatek.com>
	 <9d383fc5-8c64-478c-8aab-6c56bf5b45be@collabora.com>
	 <0efe42427be4eb619b6ea7db18687b0211d1ec9f.camel@mediatek.com>
	 <1f9007ed-c978-431d-aab2-c04237d5d117@collabora.com>
In-Reply-To: <1f9007ed-c978-431d-aab2-c04237d5d117@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB8750:EE_
x-ms-office365-filtering-correlation-id: 19456473-3710-4efd-c097-08dd5d14eeab
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZHE3d2xObHB1Y0NOYWtJbTdGTS9IYW5xSWM2OTUxTiszSkQ0SGR2UzhsUFlN?=
 =?utf-8?B?QW51eGFLNSs2eEF1ZUdITWIrREVNc1MvWUxmUE00UDVMYXNXU2Q4U1VoK0x3?=
 =?utf-8?B?N2xFMnpYM2xmLzFaVFh2cW4xVEZUbTJVTldRM1NTdkdPWVNNSmpCYS8vZHdj?=
 =?utf-8?B?N1RiRzFPcVcxZHp6bGpTcEFvaVRRcW1ibHptcWdCc2MzNzduMVdWeCtyNHRV?=
 =?utf-8?B?VW9BN2NjSzJnVC9WTVg3TTlPWGt1NVBicjNPOXlYUXFHTjFkZWFHL0VHQzNW?=
 =?utf-8?B?cnJCdHFPMkZ5MDRSeitZS2JsOXR2dnZvNDQ3REllWGZGNjJtNUFoQWJlMU5a?=
 =?utf-8?B?VHFSTWJFblc3Znp0UVJYWHVXc1llZHYrY2dWY1VZV1JjNnIyT0NJK3VYdmRp?=
 =?utf-8?B?aE5RSmV2SUN2Rm1DMmgyTjlDSC9oQmFIZzJjc09aV1QwZVJQSkhZU0RyR0wr?=
 =?utf-8?B?NFc5Q2ZWN3lqdENTaVI2cGdyV1duRExVZnhzT2dDckUrRlplcDhKOU03K2U2?=
 =?utf-8?B?aTFzV1hCVkRYNnFUR2FDSFVEdTJZTnlHd0tMVzBGcjFFRGkwdXRjd0t0OFpy?=
 =?utf-8?B?OFY5emJxV2tzc0NJZWhIM0krRTk0Z3dlSzA0TGFxWlIyallOSGNQMmZDaGZI?=
 =?utf-8?B?d2FnMENVa0c3QmoxYXZKaTJ6TTFHRklPdGlwMTdRK3ZIdDFaakRuWEJnTkxm?=
 =?utf-8?B?WkNsMWVTV1ZCNkNvTFNCL2lHS29BTUpkKzVJMit1bG9wL2MwOFZVMlB2N0g3?=
 =?utf-8?B?MW1KbUZUSlVJRktyM0xxL0xUVzNDa0tKZ1VFbjFJdThlOVk4M2VXZGF1d3ZD?=
 =?utf-8?B?WWg5NkpYN3UxTHVTanRTNHlxK20rekJabTNMWUVQM0hYdXFlYTBSK0QrTzZ1?=
 =?utf-8?B?ajF1c2JUSTRBUWlLaU9nZU1KSEF5bStoNGJpN2o1KzJ0Ty9BWGtKMDhXQ3pW?=
 =?utf-8?B?TU4vNENFZlA4b0VETUFXWDZ4cUJiaURpdHMwbWplc0pNVkV1ZTNHL1hXMHhW?=
 =?utf-8?B?eG44aXdORmsyaXlTTVhlQlJmdFVJN2c4Z00xUVpzREFKUEV4Z1RHK25XU3pF?=
 =?utf-8?B?R3BBUHZJOE02YnhHZ1pRTmJSQm94WFI4TnVka2U5L0hJR0ZSWmFrb0NsOWZO?=
 =?utf-8?B?SXdnVVFyeU83LzVyR21pcXNZalZlajF3WkNaUVlPdDRzOTNPdHpaakJhd1Bl?=
 =?utf-8?B?dkJGVURoaTFZTnNuUHZUbzZ3Ly94TE9jNUR4YnJYWnlqYzFWK1dyTkFETmw2?=
 =?utf-8?B?MW9qbTdZT3g0aXhZMW1HcWk5TVRjR3QxM2J6aGNoSmxCdGc5Yjd1eDdTZTRW?=
 =?utf-8?B?VU5HY0x6Z2J4UGNnczFvYnhUYUhIcHY1bGtzbDNISlNBQmVSVThRb3BiN3BE?=
 =?utf-8?B?VUhtMTdmc3EwZGpWTnZxZ3dsOGdNZXRuc3ArTDFickZZM2w3T0laY29nZlY1?=
 =?utf-8?B?bFRUQmhYLy9iM1pGbHFteDFjSzZ3ZTFDQzhGMmkrUndGbVZUM3Bvbkx1bmQr?=
 =?utf-8?B?MVMvbHN6TGFDK0VPdVpPeEFLTG9XZldScjFZUHQyeXhTeDRLaXkxWDAxOE5J?=
 =?utf-8?B?d1ZoR2ZZQUtOZzdpNmNYeTN3Z2VwM3VHeTRHKzBUakZLeGgrdk40WWkvbmRK?=
 =?utf-8?B?VGgwRG1lMUFkem9CcU1ReHdPaUF5TXpySWlTTmduYkFDbXl4akFHNTBMRHZz?=
 =?utf-8?B?bkYrWDR4dE5GSFEwSXpQVUZQSFdUSGtoUDBpZGExY0dMa0pGaHFSMEs2MlIy?=
 =?utf-8?B?aDRSbVVCUmRaKy9MaS9pcUlPSE5rejREOTYvbVRnckxiMmVqQW1uakk3eDhH?=
 =?utf-8?B?V3paOE01UDJBdlZobUttYVBuTGQ0VWNVTDBnTVFzbUpJcWxnbW53MWh5RXlR?=
 =?utf-8?B?RWRGQjdFaDhNNjdIRCtLLy9PY1liZFJEY0pMNkhsVldtM0dPa0dJTFU1aTY0?=
 =?utf-8?Q?xwgUxWHBxHv1Mz72AcXIG/pD8kJIIlyV?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUF3Ull5S25nZWN3Si9FZUhnTHBHb3o5SzMyWktVSTRqbzl1eUFnc25RWkgv?=
 =?utf-8?B?citzdmxRWGZXVW1zdTY2eW5nR2QvNVZpY0t5OTUxN3VmRmRBZUkyWXZSZFNx?=
 =?utf-8?B?a0xHOGJWYko0cXRreWZZSmN5blJNNzQ0dkU1WE45T3h1eGtKM0czcW10TVh3?=
 =?utf-8?B?OWVnMStwR0t2VUhYcEVOeGVkZjZyYU5SQitaNWM1QkhKaEsrMEVabk9kMksv?=
 =?utf-8?B?UVhFWEdSYytmUC90SjFEa1NqK3hSQTgwSkF5QSt5NVhVMjNhMUZQMUxVcCsw?=
 =?utf-8?B?VlY2VFZlU3Y3VFlvbnAzY0RzTnJGVmMxNmR6NkVXMXFQQ3FwOUo0TXM2S2Vi?=
 =?utf-8?B?YktWUVVGU1RTaCs1WXdxQmFYemlobFRMTWt5bTN1Y0lQd08vRVplS0I1VW9k?=
 =?utf-8?B?UHQ1Z2Y2b09jZ3hjTXJRSUZRazBuNkFSWUkybExFNGRtblhpWTIrY0N3UTZl?=
 =?utf-8?B?YTBjelkxTERUZHRldmpvMnhlYXh4WXpzaFdYWnJ4bEVzTVNmbE1xVWkxM002?=
 =?utf-8?B?REdjU28wbFh4d3E5akRya2xqdGJLakUrdklaUjRFYlowTWVteG8xU2liRmlX?=
 =?utf-8?B?cnpPbmhmTDJId1IzaWJVUkVGWU95ZGRDcFB5L2x6VVk4YkNCQVFSWjg0eGxR?=
 =?utf-8?B?Z1Q1UW0wR2ZMalhxOGxlMy9WRUxMY1ZyQStVcDY2WXRuM042MUNjbGJsN3Ez?=
 =?utf-8?B?akI5K3J1YUd0RWxZOFVEdDVqQXhoNjNkcUR3MnlMNEpFYWhwUHdtSGVWWXR0?=
 =?utf-8?B?WW8yczVDL3h5ZEFWY3NKOVZOMjMrVks3ZVdEcXJyTGFLTkdnb3F6b0xVeUU4?=
 =?utf-8?B?ZnJ5M3BpRWpsUWc0b0pzeUdkUzErckRVREhnY2dIdmtrUG1JQlZHd1ZmQk5j?=
 =?utf-8?B?T0hSMzFWbmk4eEUzSzlYc1ZxSkdpcVU3SmpiUGFiaVRiOFVQMzNGc0xJeWZi?=
 =?utf-8?B?TDlUQjdHaTc4TXlodWlKWEVHMEVCenA1YTROVk9KODN4R004ZzdQVCtpQ3pV?=
 =?utf-8?B?NXFPNUE1cXJKNU9mTHZTNEtLbWVpZk8xTUN6RU9tTmN3SkR2UGpIdHA4cW5w?=
 =?utf-8?B?QlVqR2ZtSGQyZFl1d1l6OUNNYzNyVzNYOEZrenFxZDREcmRueTB4R3p3YTRC?=
 =?utf-8?B?aDgrdlhQaVJpWmx2NzFXUmwwVUt3T2pTV2Q0L3RCdkxmZTdoenBBeEZScEJu?=
 =?utf-8?B?UDdwS1VvamMyd000TWNKTTRFSDJ0aEU2WHZ6NUp6cmdNci9Ic1hLM2JvUGlF?=
 =?utf-8?B?VzI0ZE9mb3doMlRFTzVpdTFPL0pGelF2UzZRem02NThEaWJtTS9JbGJYR0Nz?=
 =?utf-8?B?bXhqTHRkSHNlU0JEMkhxQUQ2WDFSUEcvSDRxUjJPZVROeTFnSU0yZ1VIV1dv?=
 =?utf-8?B?U0sxV2JQc3p0ei8vaGw2Z1dnQm5tajVCTFRBaUlSMXRDRVJCdTZDQkk3c1JP?=
 =?utf-8?B?cUVTWk8rUVFQalFkOXhqSU9wbnRiM2h2UnpvM3haYUJEUmtoYXJQYml1eWtj?=
 =?utf-8?B?eVpQeWoxL0k3TjhLRjFYSGJOUGlVdENOb0w4aHJtWFg3RktqTTduUUw3N1FB?=
 =?utf-8?B?bUwvWjFiY2g4LzJoeFJFdFlwZzU1U0N5anZZZlNxWUlCUG5HOEVKZVZYKzBq?=
 =?utf-8?B?NUNscHNGbnZIYmN0bGIzY2F5S2VWUmlNaWxrSTJtdk81K1RyTkdzOGZIWGxz?=
 =?utf-8?B?M2NTZ2lTbXdMS0xMRnk2a3FTRksyQVZaRzVydW92TG4wMm5BSmlIY3QyL2hm?=
 =?utf-8?B?b1pCMis0ajFRSXA3dUx1eHZtakFwNjNlWTg0ZFhSNk04bVBrS3lqTXdxaUNv?=
 =?utf-8?B?eFI1NERTREVwM2oveDluU1lSS1A2NTJRT2RQdmpmL3ozbVIxQ2hqeXYrdDha?=
 =?utf-8?B?T1VlU3dkaVB3dFdXdkdZWFUyMWZRMUg2WXpBV3B2anFkNzVrOE5sOXNXbGxs?=
 =?utf-8?B?T2lUcGZjeG45bmwweUYwMnFtL3MreXN6MEhkenJML21WeDVrVjNjSEhEMGtL?=
 =?utf-8?B?WUtxVXdOZllUMzJXS3UyTWdTSitvRHp6dEUzcXhMU0JwQmwyYlk2U2UxZGRn?=
 =?utf-8?B?Q0VwS3hmcDBpZE1UdzVXNFNFbFlVSlZqdi9EUTllaGRnQ2pZVHpuTmgyTHdL?=
 =?utf-8?B?TTZmUHREc1A3cGdjdkc1bHYvZDd4ZGovZ2h4TFVsY0hTZ1BKcUx3Mlo4RkRm?=
 =?utf-8?B?eXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29136E3DF068E1469E0BA86D663FB78A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19456473-3710-4efd-c097-08dd5d14eeab
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 01:11:04.1333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2DXO1OlcyppIgPB4xFBvAbSLEY+8xeP9oFbht/5U7BXC+Ta5y8wvaLi6QtpB7CsXogQagI4KYS+slH+mW7p4R5EueB3YsTttTGnsfSswxWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8750

PiA+IA0KDQpbc25pcF0NCg0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gwqDCoMKgICNkZWZp
bmUgQ01EUV9USFJfQUNUSVZFX1NMT1RfQ1lDTEVTIDB4MzIwMA0KPiA+ID4gPiA+ID4gwqDCoMKg
ICNkZWZpbmUgQ01EUV9USFJfRU5BQkxFRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxDQo+ID4g
PiA+ID4gPiDCoMKgwqAgI2RlZmluZSBDTURRX1RIUl9ESVNBQkxFRMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDB4MA0KPiA+ID4gPiA+ID4gQEAgLTg3LDExICs5OCwyNCBAQCBzdHJ1Y3QgY21kcSB7DQo+
ID4gPiA+ID4gPiDCoMKgwqAgc3RydWN0IGdjZV9wbGF0IHsNCj4gPiA+ID4gPiA+IMKgwqDCoMKg
wqDCoMKgIHUzMiB0aHJlYWRfbnI7DQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCB1OCBzaGlm
dDsNCj4gPiA+ID4gPiA+ICvCoMKgwqDCoCBkbWFfYWRkcl90IG1taW5mcmFfb2Zmc2V0Ow0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IEl0IGxvb2tzIGxpa2UgdGhpcyBpcyBleGFjdGx5IHRoZSBEUkFN
J3MgaW9zdGFydC4uLiBhdCBsZWFzdCwNCj4gPiA+ID4gPiBJDQo+ID4gPiA+ID4gY2FuDQo+ID4g
PiA+ID4gc2VlIHRoYXQgaW4gdGhlDQo+ID4gPiA+ID4gZG93bnN0cmVhbSBkZXZpY2V0cmVlIHRo
YXQncyB3aGVyZSBpdCBzdGFydHMuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgIG1lbW9yeTogbWVtb3J5QDgwMDAwMDAwIHsNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldmljZV90eXBlID0gIm1lbW9yeSI7DQo+ID4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MCAweDgwMDAwMDAwIDAg
MHg0MDAwMDAwMD47DQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIH07DQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gSXQgZG9lc24ndCByZWFsbHkgbG9vayBsaWtlIGJlaW5nIGEgY29pbmNpZGVu
Y2UsIGJ1dCwgZm9yIHRoZQ0KPiA+ID4gPiA+IHNha2Ugb2YNCj4gPiA+ID4gPiBhc2tpbmc6DQo+
ID4gPiA+ID4gaXMgdGhpcyBqdXN0IGEgY29pbmNpZGVuY2U/IDotKQ0KPiA+ID4gPiA+IA0KPiA+
ID4gPiANCj4gPiA+ID4gQXMgdGhlIGNvbmZpcm1hdGlvbiB3aXRoIHRoZSBoYXJkd2FyZSBkZXNp
Z25lciBpbiBwcmV2aW91cw0KPiA+ID4gPiByZXBseQ0KPiA+ID4gPiBtYWlsDQo+ID4gPiA+IGZv
ciBDSzoNCj4gPiA+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LW1lZGlhdGVrL3BhdGNoLzIwMjUwMjE4MDU0NDA1LjIwMTc5MTgtNC1qYXNvbi1qaC5saW5AbWVk
aWF0ZWsuY29tLyoyNjI1ODQ2Mw0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gVGhhdCBleHBsYW5h
dGlvbiB3YXMgc2ltcGx5IHdvbmRlcmZ1bC4NCj4gPiA+IA0KPiA+ID4gPiBTaW5jZSB0aGUgTU1J
TkZSQSByZW1hcCBzdWJ0cmFjdGluZyAyRyBpcyBkb25lIGluIHRoZSBoYXJkd2FyZQ0KPiA+ID4g
PiBjaXJjdWl0DQo+ID4gPiA+IGFuZCBjYW5ub3QgYmUgY29uZmlndXJlZCBieSBzb2Z0d2FyZSwg
dGhlIGFkZHJlc3MgKzJHDQo+ID4gPiA+IGFkanVzdG1lbnQgaXMNCj4gPiA+ID4gbmVjZXNzYXJ5
IHRvIGltcGxlbWVudCBpbiB0aGUgQ01EUSBkcml2ZXIuDQo+ID4gPiA+IA0KPiA+ID4gPiBTbyB0
aGF0IG1pZ2h0IG5vdCBiZSBhIGNvaW5jaWRlbmNlLg0KPiA+ID4gPiBCdXQgZXZlbiBpZiBEUkFN
IHN0YXJ0IGFkZHJlc3MgY2hhbmdlcywgdGhpcyBtbWluZnJhX29mZnNldCBpcw0KPiA+ID4gPiBz
dGlsbA0KPiA+ID4gPiBzdWJ0cmFjdGluZyAyRywgc28gSSB0aGluayBpdCBpcyBhIGJldHRlciBj
aG9pY2UgdG8gZGVmaW5lIGl0DQo+ID4gPiA+IGFzDQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiBkcml2
ZXIgZGF0YSBmb3IgTVQ4MTk2Lg0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gLi4uLnNvLCB0aGlz
IG1ha2VzIG1lIHRoaW5rIHRoZSBmb2xsb3dpbmc6DQo+ID4gPiANCj4gPiA+IDEuIFRoZSBEUkFN
IHN0YXJ0IGFkZHJlc3MgY2Fubm90ICpldmVyKiBiZSBsZXNzIHRoYW4gMkcsIGJlY2F1c2UNCj4g
PiA+IG90aGVyd2lzZSB0aGUNCj4gPiA+IMKgwqDCoMKgIE1NSU5GUkEgSFcgd291bGQgaGF2ZSBh
IGhvbGUgaW4gdGhlIHVzYWJsZSBhZGRyZXNzIHJhbmdlOw0KPiA+ID4gwqDCoMKgwqAgMWEuIElm
IHRoZSBzdGFydCBhZGRyZXNzIGNoYW5nZXMgdG8gbGVzcyB0aGFuIDJHLCB0aGVuIGFsc28NCj4g
PiA+IHRoZQ0KPiA+ID4gSU9NTVUgd291bGQNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgZ2V0IGxp
bWl0YXRpb25zLCBub3Qgb25seSB0aGUgbW1pbmZyYS4uIQ0KPiA+ID4gwqDCoMKgwqAgMmIuIFRo
aXMgbWFrZXMgaXQgdmVyeSB2ZXJ5IHZlcnkgdW5saWtlbHkgZm9yIHRoZSBzdGFydA0KPiA+ID4g
YWRkcmVzcw0KPiA+ID4gdG8gYmUgY2hhbmdlZA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCB0byBs
ZXNzIHRoYW4gMHg4MDAwMDAwMA0KPiA+ID4gDQo+ID4gPiAyLiBJZiB0aGUgRFJBTSBzdGFydCBh
ZGRyZXNzIGNoYW5nZXMgdG8gYmUgQUJPVkUgMkcgKHNvIG1vcmUgdGhhbg0KPiA+ID4gMHg4MDAw
MDAwMCksDQo+ID4gPiDCoMKgwqDCoCB0aGVyZSB3b3VsZCBiZSBubyBwb2ludCBmb3IgTU1JTkZS
QSB0byBzdGFydCBhICJjb25maWcgcGF0aCINCj4gPiA+IHdyaXRlIChvciByZWFkKQ0KPiA+ID4g
wqDCoMKgwqAgaW4gdGhlIFNNTVUgRFJBTSBibG9jaywgd291bGQgaXQ/IDstKQ0KPiA+ID4gDQo+
ID4gDQo+ID4gR0NFIGlzIHVzaW5nIElPTU1VIGluIE1UODE5Niwgc28gYWxsIHRoZSBhZGRyZXNz
IHB1dCBpbnRvIHRoZSBHQ0UNCj4gPiBpbnN0cnVjdGlvbiBvciBHQ0UgcmVnaXN0ZXIgZm9yIEdD
RSBhY2Nlc3Mgc2hvdWxkIGJlIElPVkEuDQo+ID4gDQo+ID4gVGhlIERSQU0gc3RhcnQgYWRkcmVz
cyBpcyAyRyhQQT0weDgwMDAwMDAwLCBJT1ZBPTB4MCkgY3VycmVudGx5LCBzbw0KPiA+IHdoZW4g
R0NFIHdhbnQgdG8gYWNjZXNzIHRoZSBJT1ZBPTB4MCwgaXQgd2lsbCBuZWVkIHRvICsyRyBpbnRv
IHRoZQ0KPiA+IGluc3RydWN0aW9uLCB0aGVuIHRoZSBNTUlORlJBIHdpbGwgc2VlIGl0IGFzIGRh
dGEgcGF0aChJT1ZBID4gMkcpDQo+ID4gYW5kDQo+ID4gc3VidHJhY3QgMkcgZm9yIHRoYXQgSU9W
QSwgc28gR0NFIGNhbiBmaW5hbGx5IGFjY2VzcyB0aGUgSU9WQT0weDAuDQo+ID4gDQo+ID4gSSdt
IG5vdCBzdXJlIGlmIEkndmUgbWlzdW5kZXJzdG9vZCB3aGF0IHlvdSBtZWFuIGJ5IEFCT1ZFIDJH
LiA6LSkNCj4gPiBJZiBEUkFNIHN0YXJ0IGFkZHJlc3MgaXMgY2hhbmdlZCB0byAzRyhQQT0weGMw
MDAwMDAwKSB0aGUgSU9WQSBpcw0KPiA+IHN0aWxsDQo+ID4gMHgwLCBzbyBHQ0Ugc3RpbGwgbmVl
ZCB0byArIDJHIHRvIG1ha2UgTU1JTkZSQSBnbyB0byB0aGUgZGF0YSBwYXRoLg0KPiA+IA0KPiA+
IEJ1dCBpZiB5b3UgbWVhbiBQQT0weDgwMDAwMDAwIGFuZCBJT1ZBIHN0YXJ0IGFkZHJlc3MgaXMN
Cj4gPiAzRygweGMwMDAwMDAwKSwNCj4gPiB0aGVuIE1NSU5GUkEgd2lsbCBnbyB0byB0aGUgZGF0
YSBwYXRoIHdpdGhvdXQgR0NFICsyRy4NCj4gPiBIb3dldmVyLCBNTUlORlJBIHdpbGwgLTJHIHdo
ZW4gZ29pbmcgdG8gdGhlIGRhdGEgcGF0aCBhbmQgdGhhdCB3aWxsDQo+ID4gY2F1c2UgR0NFIGFj
Y2VzcyB0aGUgd3JvbmcgSU9WQS4NCj4gPiBTbyBHQ0Ugc3RpbGwgbmVlZCB0byArMkcgbm8gbWF0
dGVyIElPVkEgc3RhcnQgYWRkcmVzcyBpcyBhbHJlYWR5DQo+ID4gY2FuDQo+ID4gbWFrZSBNTUlO
RlJBIGdvIHRvIHRoZSBkYXRhIHBhdGgoSU9WQSA+IDJHKS4NCj4gPiANCj4gPiBXZSBoYXZlIGFs
cmVhZHkgY29tcGxhaW5lZCB0byBvdXIgaGFyZHdhcmUgZGVzaWduZXIgdGhhdCBNTUlORlJBIC0N
Cj4gPiAyRw0KPiA+IGNvbiBub3QgYmUgY2hhbmdlZCwgd2hpY2ggd2lsbCBtYWtlIHNvZnR3YXJl
IG9wZXJhdGlvbiB2ZXJ5DQo+ID4gdHJvdWJsZXNvbWUuDQo+ID4gU28gaW4gdGhlIG5leHQgZmV3
IGdlbmVyYXRpb25zIG9mIFNvQyB3aWxsIGNoYW5nZSB0aGlzIE1NSU5GUkEgLTJHDQo+ID4gdG8N
Cj4gPiBzb2Z0d2FyZSBjb25maWd1cmFibGUuIFRoZW4gd2UgY2FuIGp1c3QgbWFrZSBJT1ZBIHN0
YXJ0IGFkZHJlc3MgdG8NCj4gPiAyRw0KPiA+IHdpdGhvdXQgYWRkaW5nIHRoZSBtbWluZnJhX29m
ZnNldCB0byB0aGUgSU9WQSBmb3IgR0NFLg0KPiA+IA0KPiANCj4gT2theSBub3cgSSBnb3QgaXQs
IHRoZSByZWFsaXR5IGlzIHdheSB3b3JzZSB0aGFuIEkgd2FzIHRoaW5raW5nLi4uDQo+IGV3dy4u
LiA6LSgNCj4gDQo+ID4gPiBJIGdldCBpdCAtIGlmIHRoZSBEUkFNIG1vdmVzIHVwLCBNTUlORlJB
IGlzIHN0aWxsIGF0IDJHIGJlY2F1c2UNCj4gPiA+IHRoYXQncyBoYXJkIGJha2VkDQo+ID4gPiBp
bnRvIHRoZSBoYXJkd2FyZSwgYnV0IEkgZm9yZXNlZSB0aGF0IGl0J2xsIGJlIHVubGlrZWx5IHRv
IHNlZSBhDQo+ID4gPiBwbGF0Zm9ybSBjaGFuZ2luZw0KPiA+ID4gdGhlIERSQU0gc3RhcnQgYWRk
cmVzcyBhcmJpdHJhcmlseSwgZ2V0dGluZyBvdXQtb2Ytc3luYyB3aXRoDQo+ID4gPiBNTUlORlJB
Lg0KPiA+ID4gDQo+ID4gPiBJIHByb3Bvc2UgdG8ganVzdCBnZXQgdGhlIGFkZHJlc3MgZnJvbSB0
aGUgbWVtb3J5IG5vZGUgZm9yIG5vdywNCj4gPiA+IGFuZA0KPiA+ID4gdG8gYWRkIGEgbmljZQ0K
PiA+ID4gY29tbWVudCBpbiB0aGUgY29kZSB0aGF0IGV4cGxhaW5zIHRoYXQgIkluIGF0IGxlYXN0
IE1UODE5NiwgdGhlDQo+ID4gPiBNTUlORlJBIGhhcmR3YXJlDQo+ID4gPiBzdWJ0cmFjdHMgeHl6
IGV0YyBldGMiIChhbmQgdGhhdCBleHBsYW5hdGlvbiBmcm9tIHRoZSBwcmV2aW91cw0KPiA+ID4g
ZW1haWwNCj4gPiA+IGlzIGFnYWluDQo+ID4gPiB3b25kZXJmdWwgYW5kIHNoYWxsIG5vdCBiZSBs
b3N0OiBlaXRoZXIgdXNlIHRoYXQgaW4gdGhlIGNvbW1lbnQsDQo+ID4gPiBvcg0KPiA+ID4gYWRk
IGl0IHRvDQo+ID4gPiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uLCBiZWNhdXNlIGl0J3MgcmVhbGx5
IHRoYXQgZ29vZCkuDQo+ID4gPiANCj4gPiA+IFNob3VsZCBhIG5ldyBTb0MgYXBwZWFyIGluIHRo
ZSBmdXR1cmUgcmVxdWlyaW5nIGFuIG9mZnNldCBmcm9tDQo+ID4gPiB0aGUNCj4gPiA+IERSQU0g
c3RhcnQNCj4gPiA+IGFkZHJlc3MsIHdlIHdpbGwgdGhpbmsgYWJvdXQgaG93IHRvIG1ha2UgdGhh
dCB3b3JrIGluIHRoZSBiZXN0DQo+ID4gPiBwb3NzaWJsZSB3YXk6IGluDQo+ID4gPiB0aGF0IGNh
c2Ugd2UgY291bGQgZWl0aGVyIHJlZmVyZW5jZSBzb21ldGhpbmcgZWxzZSB0byBnZXQgdGhlDQo+
ID4gPiByaWdodA0KPiA+ID4gYWRkcmVzcyBvcg0KPiA+ID4gd2UgY2FuIGp1c3QgY2hhbmdlIHRo
aXMgZHJpdmVyIHRvIGp1c3QgdXNlIHRoZSAyRyBvZmZzZXQNCj4gPiA+IHN0YXRpY2FsbHkNCj4g
PiA+IGZvciBhbGwuDQo+ID4gPiANCj4gPiA+IFdoYXQgSSdtIHRyeWluZyB0byBkbyBoZXJlIGlz
IHRvIHJlZHVjZSB0aGUgYW1vdW50IG9mIGNoYW5nZXMNCj4gPiA+IHRoYXQNCj4gPiA+IHdlJ2Qg
bmVlZCBmb3INCj4gPiA+IGFkZGluZyBuZXcgU29Dczogc2luY2UgdGhhdCAyRyBNTUlORlJBIG9m
ZnNldCAtPiAyRyBEUkFNIHN0YXJ0IGlzDQo+ID4gPiBub3QNCj4gPiA+IGEgY29pbmNpZGVuY2UN
Cj4gPiA+IEkgdGhpbmsgdGhhdCwgc2hvdWxkIHRoZSBEUkFNIHN0YXJ0IHZhcnkgb24gbmV3IFNv
Q3MsIHRoZSBNTUlORlJBDQo+ID4gPiBvZmZzZXQgd2lsbA0KPiA+ID4gZm9sbG93IHRoZSB0cmVu
ZCBhbmQgdmFyeSB3aXRoIGl0Lg0KPiA+ID4gDQo+ID4gPiBTbyB3aGF0IEkgdGhpbmsgaXM6DQo+
ID4gPiAxLiBJZiBJJ20gcmlnaHQsIGFkZGluZyBhIG5ldyBTb0MgKHdpdGggZGlmZmVyZW50IE1N
SU5GUkEgKyBEUkFNDQo+ID4gPiBvZmZzZXQpIHdpbGwgYmUNCj4gPiA+IMKgwqDCoMKgIGFzIGVh
c3kgYXMgYWRkaW5nIGEgY29tcGF0aWJsZSBzdHJpbmcgaW4gdGhlIGJpbmRpbmdzLCBubw0KPiA+
ID4gZWZmb3J0DQo+ID4gPiBpbiBjaGFuZ2luZw0KPiA+ID4gwqDCoMKgwqAgdGhpcyBkcml2ZXIg
d2l0aCBuZXcgcGRhdGEgb2Zmc2V0czsNCj4gPiA+IDIuIElmIEknbSB3cm9uZywgYWRkaW5nIGEg
bmV3IFNvQyBtZWFucyBhZGRpbmcgY29tcGF0IHN0cmluZyBhbmQNCj4gPiA+IGFkZGluZyBwZGF0
YSBhbmQNCj4gPiA+IMKgwqDCoMKgIG9uZSB2YXJpYWJsZSBpbiB0aGUgY21kcSBzdHJ1Y3QuDQo+
ID4gPiANCj4gPiA+IFdoZXJlIE4uMiBpcyB3aGF0IHdlIHdvdWxkIGRvIGFueXdheSBpZiB3ZSBk
b24ndCBnbyB3aXRoIG15DQo+ID4gPiBwcm9wb3NlZA0KPiA+ID4gc29sdXRpb24uLi4NCj4gPiA+
IA0KPiA+ID4gQWxsIHRoaXMgaXMganVzdCB0byBnaXZlIHlvdSBteSBjb25zaWRlcmF0aW9ucyBh
Ym91dCB0aGlzIHRvcGljIC0NCj4gPiA+IHlvdSdyZSBsZWZ0DQo+ID4gPiBjb21wbGV0ZWx5IGZy
ZWUgdG8gZGlzYWdyZWUgd2l0aCBtZS4NCj4gPiA+IElmIHlvdSBkaXNhZ3JlZSwgSSB3aWxsIHRy
dXN0IHlvdXIganVkZ2VtZW50LCBubyBwcm9ibGVtIGhlcmUuDQo+ID4gPiANCj4gPiANCj4gPiBZ
ZXMsIEkgdGhpbmsgeW91ciBhcmUgcmlnaHQuIE5vIG1hdHRlciB0aGUgSU9WQSBzdGFydCBhZGRy
ZXNzDQo+ID4gY2hhbmdpbmcsDQo+ID4gTU1JTkZSQSB3aWxsIHN0aWxsIC0yRyh0aGUgc3RhcnQg
YWRkcmVzcyBvZiBEUkFNIFBBKS4NCj4gPiBEbyB5b3UgbWVhbiB3ZSBjYW4gZ2V0IHRoZSBtbWlu
ZnJhX29mZnNldCBmcm9tIHRoZSBzdGFydCBhZGRyZXNzIG9mDQo+ID4gbWVtb3J5IGluIERUUywg
cmF0aGVyIHRoYW4gZGVmaW5pbmcgaXQgaW4gcGRhdGE/DQo+ID4gDQo+IA0KPiBBZnRlciB0aGUg
bGFzdCBleHBsYW5hdGlvbi4uLiBubywgaXQgd291bGQgYmUgd3JvbmcgdG8gZ2V0IHRoZSBzdGFy
dA0KPiBmcm9tDQo+IG1lbW9yeSBpbiBEVFMsIGJlY2F1c2UgdGhlbiB0aGlzIHdpbGwgc3RpbGwg
bmVlZCBoYWNrcy4NCj4gSSB3YXMgc29tZWhvdyBjb252aW5jZWQgdGhhdCB0aGUgRFJBTSBzdGFy
dCBhZGRyZXNzIGFuZCB0aGUgTU1JTkZSQQ0KPiBvZmZzZXQNCj4gd2VyZSBkaXJlY3RseSByZWxh
dGVkIGFuZCB0aGF0IGl0IHdvdWxkJ3ZlIGJlZW4gaGFyZCB0byBjaGFuZ2UgdGhlDQo+IERSQU0N
Cj4gc3RhcnQgYWRkcmVzcyB3aXRoIHRoZSBNTUlORlJBIG9mZnNldCBiZWluZyAtMkcsIGJ1dCBp
dCdzIG5vdCwgc28NCj4gZG9pbmcgaXQNCj4gbXkgd2F5IHdpbGwgZXZlbnR1YWxseSBiYWNrZmly
ZSBvbiB1cy4NCj4gDQo+IFNvIG15IHdheSBpcyBub3QgZ29vZCwgYXMgaXQncyBub3Qgc2hvd2lu
ZyB0aGUgcmVhbGl0eSBvZiB0aGluZ3MuDQo+IA0KPiBKdXN0IGdvIHdpdGggeW91ciBjdXJyZW50
IHdheSwgYXMgaXQncyByZWFsbHkgdGllZCB0byB0aGUgaGFyZHdhcmUNCj4gYW5kIGl0J3MNCj4g
bm90IHJlc3RyaWN0ZWQgdG8gdGhhdCBkcmFtIHN0YXJ0IGNvaW5jaWRlbmNlIGluIHRoZSBlbmQu
IFRoYXQncyBhDQo+IHBpdHkuDQo+IA0KPiBKdXN0IGluc3RlYWQgb2Ygd3JpdGluZyAweDgwMDAw
MDAwLCB1c2UgIiBTWl8yRyAiIGluc3RlYWQuLi4gYW5kDQo+IHBsZWFzZQ0KPiBhZGQgYSBjb21t
ZW50IGluIHRoZSBjb2RlIHRoYXQgZXhwbGFpbnMgaW4gYnJpZWYgdGhhdCB0aGVyZSdzIHRoaXMN
Cj4gc3RyYW5nZQ0KPiBiZWhhdmlvciBmb3Igd2hpY2ggd2UuLiBuZWVkIHRoYXQsIGFuZCB0aGF0
J3MgYSBzdGF0aWMgc3VidHJhY3Rpb24sDQo+IGFuZCBpcw0KPiB0aWVkIHRvIHRoZSBNTUlORlJB
IGhhcmR3YXJlLCBhbmQgY2Fubm90IGJlIGNoYW5nZWQgOi0oDQo+IA0KPiBidHcsIGJlaW5nIGNs
ZWFyLi4NCj4gDQo+ICNpbmNsdWRlIDxsaW51eC9zaXplcy5oPg0KPiANCj4gLm1taW5mcmFfb2Zm
c2V0ID0gU1pfMkcsDQo+IA0KPiAuLnRoYXQgd2F5IHlvdSBkb24ndCBldmVuIG5lZWQgYSBjb21t
ZW50IHNheWluZyAvKiAyR0IgKi8gLi4uLg0KPiANCj4gQ2hlZXJzIQ0KDQpHb3QgaXQuIEknbGwg
bW9kaWZ5IGl0Lg0KVGhhbmtzIGZvciB0aGUgY29uZmlybWF0aW9uLg0KDQpSZWdhcmRzLA0KSmFz
b24tSkggTGluDQo=

