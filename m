Return-Path: <linux-media+bounces-44244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F45BD1B0F
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 08:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D6D64E2BBB
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 06:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79462E092B;
	Mon, 13 Oct 2025 06:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hEEmG01v";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ifxkRQI1"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC4234BA46;
	Mon, 13 Oct 2025 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760337331; cv=fail; b=o9ffKJ+o7qK2o/szhiNwNl/cbCruyBaKxHrw0++IWiet7ZY98dXoLerw5yRwWeSNw/knNCCpGask5f7ZB+cZAGYqeNEXZ0by93ghEmqVjQE8iUivxN62n+1qyJ0yPZ+4+mIR5LfZ3pBz911mgdMVbeWNTOFvJB3HCqGt8y/9Y18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760337331; c=relaxed/simple;
	bh=gdZeExz3swTPhCWI0u7QIZPuE715DRWinQVj9qfjDsg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VW4TJDungoD0au16toPxOkDAI3rehWKiogW9AzdBbJKeLdNT2HQ+JBzam0tL7j/zMUedBlIk5a/SLDrfo5GEcZ5ONfRNpcCYUFotoufxcjxKnHbI0PwQ3xM3Urq/CCu8SsnkMix57H0Iuz4rfVbdDtPMG9A6Rldnh0mYMvOcwfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hEEmG01v; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ifxkRQI1; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cd13fd6aa7fe11f0b33aeb1e7f16c2b6-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=gdZeExz3swTPhCWI0u7QIZPuE715DRWinQVj9qfjDsg=;
	b=hEEmG01vwSExFqMeviYrnLW3PwauiKsrmu22TdEYk08uy7YRil8ye3Cikxvrb7S7oT8QmaCjpCoTayMic/lybDsHUu3ZIHrq9zZZx0MjxlVP7XheBPf2t+hakGIo08kGtCHQB+kxkUynkRoLrPVxzszXtzZ3yBpUYr/idirMqnM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:04ee45da-c91f-432e-8b85-9076bacf59f3,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c33ffd50-c509-4cf3-8dc0-fcdaad49a6d3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cd13fd6aa7fe11f0b33aeb1e7f16c2b6-20251013
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1424496859; Mon, 13 Oct 2025 14:35:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Oct 2025 14:35:22 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 13 Oct 2025 14:35:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TditnriIuIX4aQGDtFxoebuNa0u76Mp9u/ICwZvh5Z6lA/8exjMVkUH8p6dkMwM8NBM4hPi9Lfj4gtOR/0RQjyjIWywWXWCWz/u0StSjare202a/BVlb8z4h+DtGoU+cE6fb8FOgoIbFLm9RPPSgfJLCWZrxXobSpV3uDQEyZb3CX920/k2mADD8Ud6E0m7o+SrvCHhMRqHuQq2WKLJaFRldFayohB/Dxz/2+UdWUzt4itzD9tjbmVJkemr6QNPHP2+H+BreqOoGwTN0/RA0dYIkDAYdJCEDzr3NwwvJK9wYknQx1wTjmXVXIAdnlvwj36F5G+RSv3aDFAiebsyAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdZeExz3swTPhCWI0u7QIZPuE715DRWinQVj9qfjDsg=;
 b=HR1izSs/SKPHjDtrBKjbl8S+RNQ4aRlLRYwpk5uRjF8InOGvbEX2Csad9KMPYEUEo4RYG5I1xmZIwYrMSatd1x5cz5rt2a1BWiJMz/Jd4Q4pO6OF9AILjF0Q1V+y+fwHCwcMgl81s09BC1/GxjUi3d4e0NNOdHYuhtqe6m/CebF36gQ0/rVMsIn3p4EHF8iZBA1qYxU6mcQgdt6uIDEmlLBeaHG4h2vAe0ju1nNmMk0rUDVCFZ+aLfYQq/b5/qI7Pb5ZV77YgaGpWDWYwdvfe5jsrkte+Y+yTnHI3HsNy9pLMdOUKN0sZz9dJTswRJCV+Af31epja7f0BA/wiJJwsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdZeExz3swTPhCWI0u7QIZPuE715DRWinQVj9qfjDsg=;
 b=ifxkRQI14tmT52ySQTtGgjAvTOoOmBUcGaSvTwiHN4J/QkqeJS4S6/uC4DCkgbWfmyCQxmuOKcm03Rx6DdCJyvk7abAA/MFaBNSdmxQtxKoyXrIRKhQQAtCo0lFmo6e7akaxUYiOQ1aO63gnBZW2s7fBBjXh+L5XX5BHpn0WOMg=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY1PPF52C9F4C99.apcprd03.prod.outlook.com (2603:1096:408::a56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 06:35:20 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:35:20 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 09/20] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 hardware without subsys ID support
Thread-Topic: [PATCH v7 09/20] soc: mediatek: mtk-cmdq: Add pa_base parsing
 for hardware without subsys ID support
Thread-Index: AQHcORDydJ0y73Pg6EumGOvU7Tdu67S/pPSA
Date: Mon, 13 Oct 2025 06:35:20 +0000
Message-ID: <76f762a66637e34b0a0b8925c0ab2c8c31590faf.camel@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
	 <20250827114006.3310175-10-jason-jh.lin@mediatek.com>
	 <e18a0772-3031-4fff-a625-b1d4e1aab605@collabora.com>
In-Reply-To: <e18a0772-3031-4fff-a625-b1d4e1aab605@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY1PPF52C9F4C99:EE_
x-ms-office365-filtering-correlation-id: 8d41f974-bae1-4ba2-007d-08de0a22ae80
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eml3WXNBS2VqcndaNEc3SlVQUDUwYThGUjZIZlVWSktLMkhGaEhzS1JTSHRI?=
 =?utf-8?B?S25ZSmVrTUhsdGQwd2c1MXdFbFpWdlBLYWRoUVdGdVVXZlNDU1g4aWw2cGN5?=
 =?utf-8?B?VU9jZ2hzR1IreHNENDZuMWNkRk5zbWM2cXcrMS8zZjAyMUp4U2QvdDdrRStP?=
 =?utf-8?B?MmZseXIyekxtU1ZicldmRG5TSDV5VVBUa2VWbW5namJxNDRvc082MnRhN2F4?=
 =?utf-8?B?R2ZmbTRXeGM3VlR0dXduZE1jdjZTSFI0eUJoOFc3SWxyQnNTZlpvWjhaaUV1?=
 =?utf-8?B?RW9rbXVjYXMwMUJYMzZmMmdhVEQ5TCt6R0hZeHpjVHB0ODFRU3cwY2s2UFpw?=
 =?utf-8?B?ZkVERyt0SjZCSitWQzd6N2JKVHg2bUxnYk9mdkJIYmUrWGxHTm5IbHRFMC9U?=
 =?utf-8?B?QUJUL1V6QkVrMklWdGJtazlDb1BJRW55ak1LczJUT2d2aGhhalM4OVpwSUZL?=
 =?utf-8?B?RnQyMTRkT2NES011V2ROWFdIYnFnNlhUNW9aeGJ2M250d1hBcWlNeSsxNlRS?=
 =?utf-8?B?MkZJZnV3S2x2ZE1LMmxESHc5ZWxWVzRKZnQ3UG01TmxBQmR4dTVRaDY1aWFF?=
 =?utf-8?B?YWhkejhxeUZCM29GNTBJelJGdVZaM0JuUm9BalJXMlhYZ1BxU0FhTEpvSkow?=
 =?utf-8?B?K0lRK2ZUK0tnYitQNlRUNjlXaVJDaHhEazlxZDJYVklvU3d3ZTdOMDhuMm9P?=
 =?utf-8?B?Q3kvazVrWHdKWTRFdlVMZmpwR21zMkpMaDZCNkhYT0tzVWdMai9vNGNmL3dZ?=
 =?utf-8?B?SE5SWE1xbi9YUGluM2t0WTA4eVJlTmFXRUo4ZmNsRlVJMXJiMDc3L2tnbGVM?=
 =?utf-8?B?a3VPV0cxSllBV3d1aUg5WGw1a0VtZWpXbXdCTnprL1c0RDJtZUMyR3M2ZUVv?=
 =?utf-8?B?S0o5cXVyU3ZoUDNHTDN0RVVCeFRmcTA1NkdrSUFUNyt2Z1RrakZiRFFpQ0dE?=
 =?utf-8?B?c2luRWRKOGVxMzE2SVl6MnQ3ME0vejZHdXF6QWVxaUMvbk5XZndYamlydDNx?=
 =?utf-8?B?bG9HeFQxY2VxNnNYVEtGWGVFZTU3dUVGUis2RElFVk10RmpnNDAzdU1XZGY3?=
 =?utf-8?B?dXpTYWJhY2N1S3czWk8wUWtndi91TnljRURLUm5aenBQU0ZZWHFHNHBVcGV3?=
 =?utf-8?B?by9tbzZvTVZwK3ZJdnYwbk5GQnBqSEowNVgvRW80KzZFYzk5N0lFWDNYcUZ3?=
 =?utf-8?B?RVFZUlM2MW93VWhvcUhYd0VFOXg5UzcvSDlOUG9jMVUySmtMRTkzZ0hROWJL?=
 =?utf-8?B?d2dCdVplMXlKM0lHbFJxZ3pDb2hzaU5iS2FyZ0ZCcjFQWmd2T1RtTzNzcnFN?=
 =?utf-8?B?MHlYZmdiOXdHeU1BVVFzSTNBTDBZSkV3RFF4YXFoSXE5QzVkWDJZQURyclAv?=
 =?utf-8?B?MWwzNStxZ2xzWEJubitQaTZxdXNxVit2WFZCRGxYc2J4anFPSlpPOUJoOG5h?=
 =?utf-8?B?cEoyaGFEL1pZWkNFdnN6S1lndnBpdTVrOXlpL21kV2VvakpYaTh1OTkvazZ0?=
 =?utf-8?B?ZkhXdzZsdE1jS1FaeEpJUlc0cUZBKzlDV0s2ZEI1bWR6UXRXbnhjYkpvS3Vy?=
 =?utf-8?B?b3owVDNKMWdaV2xaVGd3U3VldjdKVTkydnB6RStnc1pFNVdEaE1XTVFWVjVk?=
 =?utf-8?B?dGJFQ2x1c1R3NnV1TTFERUFBM1p1UEF5TUJacG5Ma1FpZ3k5WWRubjVadXVr?=
 =?utf-8?B?YllrM1M1OWZmb1NKZ3YvdE0rNStqUG9qUzAxbkJTMnBUMUFuL1FUNjlGbkhZ?=
 =?utf-8?B?cXNWSXEzc01tVzA1OWZwYURlOXdZeVo2WXA1ZGhKUmJqNStLZHZKbVF5K0E1?=
 =?utf-8?B?dWlaSVBPaUhxZUt3SGFJRTRHWTdBZnFBZlNvelcrMXhDazRON0RIbmdBditO?=
 =?utf-8?B?WGg3OHAzNHRLanVUbTNGcC9xU0VKanN0cGk1U09TaDFmOE4vWXlXZ0dtUUJh?=
 =?utf-8?B?cDRzRkhCMUp0eFVDSG4wY3hFZU9OcFFVMUVkMkZOQ1I5WEZqRkNSd2FTWDJv?=
 =?utf-8?B?K2RSSXNQM3RSalhLdC83Yi96NkJmUGVPV0tJMVdpUEpaRTZ2MGo5TUFUNXBD?=
 =?utf-8?Q?oBgnK9?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWt5ZjlBOExPenBSZUYzWmtuZ3NQOW04YUEwblBpQnZLZk5URENBOFl1Z2R6?=
 =?utf-8?B?K29WUFRnenMwQi9QN1l3SlBpd2x3TVZIMU9WS3ZaRHJKMzBmR25JNmFMR29h?=
 =?utf-8?B?UGljY3kzR293Y1FQTkxzTW5PUTVtMWVpWmcyUTgzcUJQSERCdThad0UwZXEy?=
 =?utf-8?B?ZFBqNmJyemw1V2NXZkFRdFkvc0dPU2lGZmhobmx6eStCSnlTQXZjTCttN1VL?=
 =?utf-8?B?dURURjdGS25odWg3dkJkeXoycVlGWjNncmFYWDF3WEkzZzhxL0tWajd4bUw4?=
 =?utf-8?B?V2ZDeE9xeGRMd3NpZm5zUWtoRVhnNis2Y2daWnpoN21nN1pLMmpvZzdoaDBm?=
 =?utf-8?B?NmU4ZTVpZTNlSU54RklBR0VjRksvbk1EWnNRVHN0bFdka0lnUW1MWkcycC9j?=
 =?utf-8?B?TVZ6UjBsN2RFdDhpcWxrc2h5SlJDS05VWVQ3WWEvL090eWQ0ZENGelVFNFp5?=
 =?utf-8?B?b1V6bFRFZkh0OC8zd1QwNmRUWkRUdzd0UEw4eVpqZlFFTGQ2RlcxVUNOTW53?=
 =?utf-8?B?VG5oNW90QW5odURoRzYvd0crRGNwV0RjeFdKQUxNY0QwYndmcmNOOUU0eVZH?=
 =?utf-8?B?YXNFZ0NNeS9jRkhvemVVcTFRRGRLT0VpZU5IYmZIa2lua2pEYXY0eUhsTGc3?=
 =?utf-8?B?cUExNkNXUHMwNytPekVOOVhOaVBFQUEzeFBXRWU0UXBOcmw4U1ZvRE1qenNP?=
 =?utf-8?B?WFdjbmFlUjRXWDVlTEx2TzJtWE5DdkxlVUFzYVpMN3JYK21uZzdzK3FPbGNk?=
 =?utf-8?B?MkFXeHFxZnRZRjVRRERCaXU2cndvRTdLZjNuYzhZOHAwRlpRUkdvZFdrWHY0?=
 =?utf-8?B?Z01BbCt5QTNGZE5JYUtlZzRrY05Da2tiZy9RQnFEWDVRMUhwcTY4RWFNOWw1?=
 =?utf-8?B?TmxDczBveWlPZG96RXdmbEFrTUxRd0M5ckxFVlVoelNFL0tXWm1EdXl0cGR1?=
 =?utf-8?B?NE1uMzMvNEJxUjdWNnM0NlN0Tm5VazBZd2N1U0RWY0xId0YwV1BIbXdvMDRR?=
 =?utf-8?B?R1R6cnlJMkV0WWJtQWE2YVJlYXlLYk9NVDlleWg5dnI4K2h2U0V5VitZWUdE?=
 =?utf-8?B?aEo4ZGpJVUNwZk00amdYTHF1cUNQaXBTWmgyYm56OTZRdlFRZTVJUU00MXZw?=
 =?utf-8?B?UVlTa2N6OVRpZ0dLeko2SzFvdVo5VC9DNmJjVlRkWm9Ic1NDelFEUVhxTUVa?=
 =?utf-8?B?enB0aXo1ZnBCZXpTOGgxb3pTckFyaXcyRG5qSjVLWU5BeWpwYzBxUG14NjJN?=
 =?utf-8?B?eDJSRDB5MWQrYWxDeVR4dW9LenB2TmVBUXpzQllvVi8ybHVXMUVObHU5SzQx?=
 =?utf-8?B?RUdqOXhQZUliUE9sTWpYYndiem5USEtodk1VUXZ5OUVWYUE4V1hFVHhEZy96?=
 =?utf-8?B?RzI5MENqMzd6bXEvVUFLcW44OWlCUFdHNlNUTGNnYkx3YXFsMTNHSC80WTl2?=
 =?utf-8?B?L1k5V1FwQkd0Zkx4K2lWUmNOeDZEVnAxV1FxR3pkdXVPeElBR29MRlFyZVZ4?=
 =?utf-8?B?RnhjVUhiZE9ONkhZSGo2bC9hazlaRzZHcUdFWnRXOWJyYndRclBnV1BVT0VX?=
 =?utf-8?B?cGpTNHcvTWlHNFV6VmNBYjduaHhKSC9LVkExTXpwZ2pnbUpQYS80ekQ1TmNE?=
 =?utf-8?B?dTJGMmE4R0dhQ0VieGJMWmhxaUREdWFSaVdKcXlNZ2h3NVlqTDNRMDA0RDJt?=
 =?utf-8?B?dmNnQ0hlZXNob25lWUI2cUNoeUJDeUFIK3U2ZlpDQzQxMVVsbGwrTE5JYzFH?=
 =?utf-8?B?SHZLVDJsU3B2QU04ZUVhbjkyNUVHdHdwRFNJdWg1OFc2M21FMnByWnIrbnor?=
 =?utf-8?B?UkZIMXVJWGtxY20yNHJqd3hheERVdHhuU091TGtsTDk5ZmljSWpDSFN5azFW?=
 =?utf-8?B?WEU1M0pMU3MzMjAxRDNhMkVTRDlNRmhBRC9UaERSTWpFc210Mm1RZVFoSmhr?=
 =?utf-8?B?TFJ4aytNTnBsSDIzMUlXSXNxL2xPU2NVeVZ6RHFWNjl1dmhZUEJtYTNVUklM?=
 =?utf-8?B?bm9aVTNvdXNYcVpKaUora0xqT0NGTko5NThCdEJ6bWwrNFhLRFRwbjlqZDV2?=
 =?utf-8?B?TmliekZINDBTblN3YW15WU1lMWRDOXJKUUR5NFQzcDZoTkRkK1E3SzVyeWVK?=
 =?utf-8?B?a04zUDBINWNNZmxNK05xdWgxMll0eUtKamZ3ZU5HT0VrSytTU1NEajZMZHRr?=
 =?utf-8?B?Smc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <655A8E9682BE53479D25C7E8EE891F40@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d41f974-bae1-4ba2-007d-08de0a22ae80
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 06:35:20.5585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dKnHvK7D/cVkhtLf25Umc9DSeY+U2cQBIlN2DoexVY7sc+BniYEYZaLEIs656Iz6tPllIKSG3ReoVjsVOwnXXNajHi/R4Jc/A2BtmOffUQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF52C9F4C99

T24gVGh1LCAyMDI1LTEwLTA5IGF0IDEzOjM1ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToKPiAKPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbAo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5k
ZXIgb3IgdGhlIGNvbnRlbnQuCj4gCj4gCj4gSWwgMjcvMDgvMjUgMTM6MzcsIEphc29uLUpIIExp
biBoYSBzY3JpdHRvOgo+ID4gV2hlbiBHQ0UgZXhlY3V0ZXMgaW5zdHJ1Y3Rpb25zLCBpdCB0eXBp
Y2FsbHkgbG9jYXRlcyB0aGUKPiA+IGNvcnJlc3BvbmRpbmcKPiA+IGhhcmR3YXJlIHJlZ2lzdGVy
IHVzaW5nIHRoZSBzdWJzeXMgSUQuIEZvciBoYXJkd2FyZSB0aGF0IGRvZXMgbm90Cj4gPiBzdXBw
b3J0IHN1YnN5cyBJRCwgdGhlIHN1YnN5cyBJRCBpcyBzZXQgdG8gYW4gaW52YWxpZCB2YWx1ZSwg
YW5kCj4gPiB0aGUKPiA+IHBoeXNpY2FsIGFkZHJlc3MgbXVzdCBiZSB1c2VkIHRvIGdlbmVyYXRl
IEdDRSBpbnN0cnVjdGlvbnMuCj4gPiAKPiA+IFRoZSBtYWluIGFkdmFudGFnZSBvZiB1c2luZyBz
dWJzeXMgSUQgaXMgdG8gcmVkdWNlIHRoZSBudW1iZXIgb2YKPiA+IGluc3RydWN0aW9ucy4gV2l0
aG91dCBzdWJzeXMgSUQsIGFuIGFkZGl0aW9uYWwgYEFTU0lHTmAgaW5zdHJ1Y3Rpb24KPiA+IGlz
IG5lZWRlZCB0byBhc3NpZ24gdGhlIGhpZ2ggYnl0ZXMgb2YgdGhlIHBoeXNpY2FsIGFkZHJlc3Ms
IHdoaWNoCj4gPiBjYW4KPiA+IGltcGFjdCBwZXJmb3JtYW5jZSBpZiB0b28gbWFueSBpbnN0cnVj
dGlvbnMgYXJlIHJlcXVpcmVkLiBIb3dldmVyLAo+ID4gaWYKPiA+IHRoZSBoYXJkd2FyZSBkb2Vz
IG5vdCBzdXBwb3J0IHN1YnN5cyBJRCwgdXNpbmcgdGhlIHBoeXNpY2FsIGFkZHJlc3MKPiA+IGlz
IHRoZSBvbmx5IG9wdGlvbiB0byBhY2hpZXZlIHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkuCj4gPiAK
PiA+IFRoaXMgY29tbWl0IGFkZHMgYSBwYV9iYXNlIHBhcnNpbmcgZmxvdyB0byB0aGUgY21kcV9j
bGllbnRfcmVnCj4gPiBzdHJ1Y3R1cmUKPiA+IHRvIGhhbmRsZSBoYXJkd2FyZSB3aXRob3V0IHN1
YnN5cyBJRCBzdXBwb3J0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSCBMaW4gPGph
c29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+IMKgIGRyaXZlcnMvc29jL21lZGlh
dGVrL210ay1jbWRxLWhlbHBlci5jIHwgMTUgKysrKysrKysrKysrKy0tCj4gPiDCoCBpbmNsdWRl
L2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5owqAgfMKgIDMgKysrCj4gPiDCoCAyIGZpbGVz
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYwo+ID4gYi9kcml2
ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYwo+ID4gaW5kZXggNGIxNTkxZTViMWFl
Li40MWUxOTk3Y2RkNTMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGst
Y21kcS1oZWxwZXIuYwo+ID4gKysrIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVs
cGVyLmMKPiA+IEBAIC04LDYgKzgsNyBAQAo+ID4gwqAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
Pgo+ID4gwqAgI2luY2x1ZGUgPGxpbnV4L21haWxib3hfY29udHJvbGxlci5oPgo+ID4gwqAgI2lu
Y2x1ZGUgPGxpbnV4L29mLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4KPiA+
IMKgICNpbmNsdWRlIDxsaW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaD4KPiA+IAo+ID4gwqAg
I2RlZmluZSBDTURRX1dSSVRFX0VOQUJMRV9NQVNLwqDCoMKgwqDCoCBCSVQoMCkKPiA+IEBAIC02
MCwyMCArNjEsMzAgQEAgaW50IGNtZHFfZGV2X2dldF9jbGllbnRfcmVnKHN0cnVjdCBkZXZpY2Ug
KmRldiwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBjbWRxX2NsaWVudF9yZWcgKmNsaWVudF9yZWcsIGludAo+ID4gaWR4KQo+ID4g
wqAgewo+ID4gwqDCoMKgwqDCoCBzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzIHNwZWM7Cj4gPiArwqDC
oMKgwqAgc3RydWN0IHJlc291cmNlIHJlczsKPiA+IMKgwqDCoMKgwqAgaW50IGVycjsKPiA+IAo+
ID4gwqDCoMKgwqDCoCBpZiAoIWNsaWVudF9yZWcpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gLUVOT0VOVDsKPiA+IAo+IAo+IMKgwqDCoMKgwqDCoMKgIGVyciA9IG9mX2Fk
ZHJlc3NfdG9fcmVzb3VyY2UoIC4uLiApCj4gwqDCoMKgwqDCoMKgwqAgaWYgKGVycikgewo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKC4uLi4pCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPiDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gYWZ0ZXIg
d2hpY2g6Cj4gCj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vCj4gPGFu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KPiAKPiA+ICvCoMKgwqDCoCBp
ZiAob2ZfYWRkcmVzc190b19yZXNvdXJjZShkZXYtPm9mX25vZGUsIDAsICZyZXMpICE9IDApIHsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJNaXNzaW5nIHJlZyBp
biAlcyBub2RlXG4iLCBkZXYtCj4gPiA+b2Zfbm9kZS0+ZnVsbF9uYW1lKTsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArwqDCoMKgwqAgfQoKT0ssIEkn
bGwgcmVmaW5lIHRoaXMuClRoYW5rcyBmb3IgdGhlIHJldmlld3MuCgpSZWdhcmRzLApKYXNvbi1K
SCBMaW4KCj4gPiArwqDCoMKgwqAgY2xpZW50X3JlZy0+cGFfYmFzZSA9IHJlcy5zdGFydDsKPiA+
ICsKPiA+IMKgwqDCoMKgwqAgZXJyID0gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2ZpeGVkX2FyZ3Mo
ZGV2LT5vZl9ub2RlLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAibWVkaWF0
ZWssZ2NlLWNsaWVudC0KPiA+IHJlZyIsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDMsIGlkeCwgJnNwZWMpOwo+ID4gwqDCoMKgwqDCoCBpZiAoZXJyIDwgMCkgewo+ID4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfd2FybihkZXYsCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRldl9kYmcoZGV2LAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICJlcnJvciAlZCBjYW4ndCBwYXJzZSBnY2UtY2xpZW50LXJlZyBwcm9wZXJ0
eQo+ID4gKCVkKSIsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZXJyLCBpZHgpOwo+ID4gCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBl
cnI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIG1ha2Ugc3Vic3lzIGludmFsaWQg
Ki8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xpZW50X3JlZy0+c3Vic3lzID0gQ01E
UV9TVUJTWVNfSU5WQUxJRDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIDA7Cj4gPiDCoMKgwqDCoMKgIH0KPiA+IAo+ID4gwqDCoMKgwqDCoCBjbGllbnRfcmVnLT5z
dWJzeXMgPSAodTgpc3BlYy5hcmdzWzBdOwo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
c29jL21lZGlhdGVrL210ay1jbWRxLmgKPiA+IGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsv
bXRrLWNtZHEuaAo+ID4gaW5kZXggNWUzYTBlODA3OTgwLi4zNjk5MjI5YTczNzUgMTAwNjQ0Cj4g
PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oCj4gPiArKysgYi9p
bmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oCj4gPiBAQCAtMjMsNiArMjMsOCBA
QAo+ID4gwqAgI2RlZmluZSBDTURRX1RIUl9TUFJfSURYMsKgwqAgKDIpCj4gPiDCoCAjZGVmaW5l
IENNRFFfVEhSX1NQUl9JRFgzwqDCoCAoMykKPiA+IAo+ID4gKyNkZWZpbmUgQ01EUV9TVUJTWVNf
SU5WQUxJRMKgIChVOF9NQVgpCj4gPiArCj4gPiDCoCBzdHJ1Y3QgY21kcV9wa3Q7Cj4gPiAKPiA+
IMKgIGVudW0gY21kcV9sb2dpY19vcCB7Cj4gPiBAQCAtNTIsNiArNTQsNyBAQCBzdHJ1Y3QgY21k
cV9vcGVyYW5kIHsKPiA+IAo+ID4gwqAgc3RydWN0IGNtZHFfY2xpZW50X3JlZyB7Cj4gPiDCoMKg
wqDCoMKgIHU4IHN1YnN5czsKPiA+ICvCoMKgwqDCoCBwaHlzX2FkZHJfdCBwYV9iYXNlOwo+ID4g
wqDCoMKgwqDCoCB1MTYgb2Zmc2V0Owo+ID4gwqDCoMKgwqDCoCB1MTYgc2l6ZTsKPiA+IMKgIH07
Cj4gCj4gCgo=

