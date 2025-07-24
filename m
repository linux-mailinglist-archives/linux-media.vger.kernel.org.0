Return-Path: <linux-media+bounces-38293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 711A5B0FEC2
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 04:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7294F1C2405A
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 02:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC681AAA1C;
	Thu, 24 Jul 2025 02:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SnVgEAD7";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="v3XEnZYt"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537322AF0A;
	Thu, 24 Jul 2025 02:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753323861; cv=fail; b=B/zfHa2sxOuM8Td4vccRD8n8CV52XKep6cV/lD9gG40jkapnEdPvePAv5o0NLEjtTHwlmYKozPZAq1t/sD5N0vj2R1P4MC5Ss7AJvCa+f/r6mKWIQClN4iw+lumKoTmuZ60lcTqAvaxdQ5/7QqJ//EnQ7XrzkBp435XJU8hsEuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753323861; c=relaxed/simple;
	bh=7p5yeZlGYlZZ1nsZd+f9lxz6biJ8qDvwU+wr+8kka0Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rUrm54nAxaejqesifuuFzKr2lZvExDN+iDN3uIPm2aWb7tOc0brTErGHipj4B0St5muczztWfYpfoIDJcNP/4b0vWFdxPfv+0nUCfBR3HQdPRceftbAg2VlEVCTpFu+SUWIS4pM7qjQiS2s+M3xQBZtjEFqeLnlrYFnCNVhDgmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=SnVgEAD7; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=v3XEnZYt; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 49fe7be8683511f0b33aeb1e7f16c2b6-20250724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7p5yeZlGYlZZ1nsZd+f9lxz6biJ8qDvwU+wr+8kka0Y=;
	b=SnVgEAD7JHc4g1o/LeV4KLQ67wov/qC3/iv1cJVngeJyEON3J5yQufpPTVzcpimn3NEL18SK6fu33VIWCEQ1mMgAQHIsAM0T50d0dxfofj9becZcVH6zhpewV+ffdG5gF0bAwoCUr7aR3+SqKpjW4ZyW5shnEhcadc9uubj3r1s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:6843522e-734a-4b10-9648-a8933e119eb6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:5b61359a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 49fe7be8683511f0b33aeb1e7f16c2b6-20250724
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2085613378; Thu, 24 Jul 2025 10:24:13 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 24 Jul 2025 10:24:10 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 24 Jul 2025 10:24:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=il8HNXqKPsvIJN7V6ouNoNGY17MCmM6STFY7N0lR/ZcXLxhMfQl7nCUgiF26wqNjvFXKOKhydJyMUre8aIY3UHkUS6RotnNm+wilNARuK6bzJ7FWfR36FC06M08cQtcAIqUWLkPJlJLuTkcSwuJLEfZHJFUPPGhpYx4WT7soJZseDk2ACx4jhGuWV9U9GabPWDOQ62SF3jZtp+SGT378DoW1yziU69SSwM3WcIdGw4rrcMl+BiPbfs/r0qhHohHi8VoTzdQl8s2qi3xM3p+BhxB3bQ6elQA3eLX+p5KdRKzBP2VtkdMbzUfpuOiEHGpTTgkADZgN4MGtMlPIs8GsiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7p5yeZlGYlZZ1nsZd+f9lxz6biJ8qDvwU+wr+8kka0Y=;
 b=kK3If/WzFGeBe4J8VlkVuB4lyiauoZJApHje6Y29k+2/Zxp8Ub0fuuAErE2UshvnlyTknKKpLU6W626jwJhFp0Er7bQn0ZBCNy9xfESYt5fBGvDdacjz7ZiNRl8eYZwbkVaBPNZs1JmdI3ImKD10ml/8/fOvMdPvYGyQqRAqeN3ahu3WqdXcY155Z+ED/SDbUrcLgIlycHeDVT6dZkr/HZP4LsWI3uYTUJudcoCRf1vMsSbGgY8IyXVl/wAizFZyxaOZx26RrLIbWmE+RVUQd/ze2/Mzm534JmkPJT/3ryO9jWXrylZf/mVCE8I831ADbIXyjY0Sw0YL6+wi2ePcvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7p5yeZlGYlZZ1nsZd+f9lxz6biJ8qDvwU+wr+8kka0Y=;
 b=v3XEnZYtlwYj7nsyHV920l1b+d9cmTMTriP77mT7OP+/SnchWnNjzP60spt9Gj/otQe6+wPe1zOf4Pv6WO7uO777X+7hr19UTfclcBKMEDZ6Xbmwzxi2x0uvbWGFylEuvkZq+2JDa9b9rVfFPtvn6QRre2u5BKsUbd4eW45LGFI=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SE1PPFAF52E6423.apcprd03.prod.outlook.com (2603:1096:108:1::85e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 02:24:09 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 02:24:08 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?=
	<Kyrie.Wu@mediatek.com>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/8] dt-bindings: media: mediatek: decoder: Add MT8189
 mediatek,vcodec-decoder
Thread-Topic: [PATCH v1 1/8] dt-bindings: media: mediatek: decoder: Add MT8189
 mediatek,vcodec-decoder
Thread-Index: AQHb+i35Rb1+PyxwU0+YrzDkXGi9WrQ9v06AgAAMvoCAADHdgIACkckA
Date: Thu, 24 Jul 2025 02:24:08 +0000
Message-ID: <407d1f9d31e16cb53d8b24dffe19625960590293.camel@mediatek.com>
References: <20250721105520.5625-1-kyrie.wu@mediatek.com>
	 <20250721105520.5625-2-kyrie.wu@mediatek.com>
	 <20250722-sly-sparkling-kangaroo-6ab9ed@kuoka>
	 <7e148282f683f8e0e00a1ad29ada8319ee9e24f4.camel@mediatek.com>
	 <86ee9383-d3dd-40f4-adb8-1f7375018bf5@kernel.org>
In-Reply-To: <86ee9383-d3dd-40f4-adb8-1f7375018bf5@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SE1PPFAF52E6423:EE_
x-ms-office365-filtering-correlation-id: 6d3544bd-1320-41cf-f0bb-08ddca592b5c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dERqaS9tT1FTQkprWk1DY1NoUVRwbFh2Rkd2RGJiWVFkbksvemlwa0VRa0l1?=
 =?utf-8?B?NVVmR1J6azZ6RHgzS2tGTEp5enRQckxzMUJDcUIzTkxpd2tqMlQ4TGhVcW9O?=
 =?utf-8?B?SHVOVmNsMUV4RHNQVnZQeGFQUks5SmhhQ2VTN0tBQ1M1aDdnYWtGQVl5eHhm?=
 =?utf-8?B?aXVtZkJRK2c3enRiNW5hMTB1elAweW0wS2htVjZrUTd4amtLcjUwL1NuNUlK?=
 =?utf-8?B?cElTWWVqTWUxZTM2OEQ4bkp4TE8rZVZraVk4ZndRYk85QklENWo0YVJJcXQz?=
 =?utf-8?B?TXZlUS9PNjMvbktEa3R1SFZjS3p4MGhwaGlRQ1o1Ukxad1pUSmVjOWowdnNw?=
 =?utf-8?B?ampTa1pjRHJvNU5MaldGbmJ1QU9FY0lrMHRiaEtIWHYxSXkyajhFMGVMcURO?=
 =?utf-8?B?RjdOaWpKUm9ZT0FGS2hvcTRLZjUwTjcyVWFncFZDbW9sQzhrbTFhdGdQZERV?=
 =?utf-8?B?Vi8xUHp5Q01abkY2TkdUNVZMOTdnWndWR3Zld09ZdGFhdTBlY2VmRFhZaElY?=
 =?utf-8?B?SHA0V2ZPUDFPU3IveFZBTHdpKy9CM213N3RoQytFUkcvWkVVRWVKbjdSdWxY?=
 =?utf-8?B?b3g2YTdTekYyOENIemhZTERzcno0ZUQ5ZHRibUFGUFUxUVJMd2lpNnh2RGtD?=
 =?utf-8?B?ejNSL2FtMGw4RVJwZDZzZmRGQmo5cGNIM1JRVi8rVFRXWWhFRWRaeWlqcjg2?=
 =?utf-8?B?R1Q1TmY5aHZycE1WeHg3MXVXYW1uMXJwNW12N3BLbDIramFjOGx2STNJN2t4?=
 =?utf-8?B?R3p0VEFlTUV4Z240Q3UrNWpzTmhvUDZvV2d4NlVYN09nMkVxdWpOV1N2YTFi?=
 =?utf-8?B?Z0VlR3BtQm5NNEt4ZFkrN0twL0ZsOW9HMU1QRk5RUmVneUlGQkRKL2g0VFNp?=
 =?utf-8?B?VW13SUdrM3p5OG8vWTNiSGlSZTNMdDltTCtNc3hHL1ErSS9OR2NpNUNJLzdU?=
 =?utf-8?B?cHYwSm5EaFJVdzRKcFQ5NlE3VG0vcnVySi96Qm54RlMrdW4xb3hTT3YxTjlE?=
 =?utf-8?B?OGx5UmhRYnorM3pTSlNvWFVSdWl6Rlpvc0doK3Q0SklScmRPYUVlOUZua1hp?=
 =?utf-8?B?WXcwcGc3ZGYwT0FXWE5Zb0k0Wk9TNWxDZVpxbVdCSWc0VDVOWTB6NEx0TzdG?=
 =?utf-8?B?YjRXZFZOOWFJdWE1ajhnYmlDOHIrOW43MFJKYjV3bnFwY0tvV3NDaTNBVlRX?=
 =?utf-8?B?bXk1WDNvNTIreDRKTmpKUHhUMmFOSzRjVTRMTjZCaDBCT3ZXTENodWRyQnpM?=
 =?utf-8?B?UGx1TUJsaUVTY1VBRGdFVUQvVWh3aEJlekdoYm8rcm5PSmovVEswcENsMzdm?=
 =?utf-8?B?MWRGT2M3WUtnYjhCT3grSnliZ3d1b0E2YkNvK3pxNFpvaTE3VnM5SS8xb28v?=
 =?utf-8?B?L1o5TEVkdk05b2U4TzUyRklJdnE2dC9IaW5Ed01QV2RBSDI0R2VwZmlVSzRJ?=
 =?utf-8?B?QlhBRm9rUW9UdmVvR2FYbWIyOHVHUTQzRzhPUCthbUF4SlZkcVJBdi9tR1RX?=
 =?utf-8?B?bXViN1ZudzNFNGtLNThuSHBPMGJudXY0SFVFaFc4YTdzYWUxNHVoM3ViRFVn?=
 =?utf-8?B?OEk1Z1I4bnZvaXd0M0RBVXJWaW9LelpFQWVaaUZzVEN5eC9QUjhLVU1VY2kx?=
 =?utf-8?B?WW1kYllDZ1hTQWhQbVk0Ti9KQURQYmdJVkppV25qMDU3TGgvNUI0WUorRzlu?=
 =?utf-8?B?Y0ZoOUN4cWpUUDZ5bzBRZjFSUnFCSEh3c1R3cGtkMERBUFhGakE3YzVsN2J2?=
 =?utf-8?B?SzJQQmpDUnpkcWVmeEE1RSt5aVJ0dVMyK3JBNmx1cktYSXlOTWFKYTFRTTFT?=
 =?utf-8?B?NUhOdi9Fd1lXbkVCNDVlU2t4S1ZjbmM3RGZmUWxnaWN0K0crZm9CSlpEaEdz?=
 =?utf-8?B?RGVKRkY1M3BZWUpLTmlPS0NlTlc2cElQZXYvQXYzbXdaL3N5dEtiMDNIMTh0?=
 =?utf-8?B?eWxaenU1VXFoTDBjYXJTcjR2MTJ5UE9uSDBtQnhZRnBmdkhFcllXVG5mV3o3?=
 =?utf-8?B?VXdOT241Mk5BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGFSZmdzTk9tcTUvNFNJbkswMWVlNkowNU5Qb1Flc0tSRlNqSk1XaDFpYTZS?=
 =?utf-8?B?MWFXaFlVczZTell1UW9tL2RxWnhQaUtRV29YdHBaV2JmMlJwdnB3WjZRWE5T?=
 =?utf-8?B?Umduc25BWTZWb3ZYbjhLQkxnRktBQWVwNVVUOGpsdDhlVERHUUd4Vlh4ekpX?=
 =?utf-8?B?bGNXRXcyVnlmNXZxd3JvVlVuSE9UOFZEQU1yQURWNE9vblZuaSs2ZWJLV0N1?=
 =?utf-8?B?dkhqMHNMcC94L0xYWlFrWjNjaWcxdThacnNHSUZwY2dwMWhoSWZNZTB1akMv?=
 =?utf-8?B?TXVxbG94N0Z3N2pRVmY5NHZPejVzd2txMElGRGZPdktkS2dHTXRpY0ZmcDJ2?=
 =?utf-8?B?Y011MjZmV3MvWldyakJMbjhQSDVXL20wNFZxNmFLdnA5c1NsZlRJcVZyV2Zq?=
 =?utf-8?B?bC8vUWVILytxWXkvUkdmUFluOTB1YVFhdHB3c3JlaEdsdUgwZ2dPY1l0MzFY?=
 =?utf-8?B?RGxxWmVCS1Jpd0NBdmo1dHJ0Sk5nMHREb1R5bGJuQ1BiU2IwME9kSm5yUUVp?=
 =?utf-8?B?MHQ0YXhGZVVwdHdvOTgzbkZpV2dtMXJObnphaGV3eFpEZHM5YVpyWjBWYXIr?=
 =?utf-8?B?eE1pLytiVXpMZE5yM0Z2RWZMQUZPNS8xOHI0elZNQmRHWTJXWm1lNzZ6SEti?=
 =?utf-8?B?VWdnY0NVZTY4enlWUDdYMkRqSXlrbU9xSE1NRW9pQTFSUm9POTVvVDF3UU81?=
 =?utf-8?B?ZVNYM1B5eDVZVXE0U1Q4d0JZUnJvWkQ4ZzlpVVpnQmJFeWVDd1VtRy9jNCtM?=
 =?utf-8?B?WS9VU05FaHdJRm9UTTRKdldEdVdDdnJwL2lPT01uYk00d1V2Nkh1T3ZsTm1y?=
 =?utf-8?B?R044ejNMNFd6UXpDTXF0aHpCTk1pV2M5V3Jqb29NclVTeGIvMC9ic0pPNEpD?=
 =?utf-8?B?UUVmWHd3Qy9LS2xZZENwcnJ6dGk5elhTZEM2eitqZFlJR3d6OCtBc0pnK05F?=
 =?utf-8?B?c2ozdGZaNDZZc1hrUGlpd0s1UHRTNFdyQ0wzNGdVN3U5R1B4a1dIdXJPekJN?=
 =?utf-8?B?eFlXUWwrSThnVEMyMUlhUjhXZzQxMkNocDJMK01uWGZFbVgxSTFrQndnSlg0?=
 =?utf-8?B?bll5SHVKSVNJUXVaY2MxYTVSaGdkbW1sYUNaKzdEQkE1T2t4V1BvSHdweVJj?=
 =?utf-8?B?ZlRWV2JVWHpWOGY1N1VDYm5mNXdteTVKK29CRzFZQkxPc0E2U3lDMDNkcUxt?=
 =?utf-8?B?VmczRFIyMlhXVENiSTgvMW1GQUI4bHF5dTFhWC94WVRJK3k2UVlBdU9BNHg5?=
 =?utf-8?B?cUNZMXpkZGZMMEUrMEQ1Q3BYK0FCWkdKOGIyelByUGxmY3NQZm5PVGVEeFhs?=
 =?utf-8?B?MEJpeUpEeWVTemQ3R1NwQmNrcm1jRzUwVkExSkxsRUlUQUFEdlVHeXJneFJ0?=
 =?utf-8?B?VGJFTEd3MzFTSTBwZ1ZOeFR6dVc1czE2dlhScEpKVmpQdkRTd2hWMk1nLzBr?=
 =?utf-8?B?eXRUTDFnS2dvbGJoT0xEbmxPRENEK3lBWTlIUUZXaldxWjVJNy92elJmVWNZ?=
 =?utf-8?B?WFE5TmIxTnBRR3NTdHVMWXl5cUFNY2VFem1Lb0tLeDk3cHhFSmtxbkplSnJR?=
 =?utf-8?B?cGxxU1Z1ZzVWYXNpWUhzNHhtUkFtZVVUN1QxZnpnOUM1TGMveFNJeWZ1VVhj?=
 =?utf-8?B?WkFCc081V3BDazBkWmlpQ0QvTXN1clk0M1g2OUdjMHBaRVpVUndnaGV2VEdr?=
 =?utf-8?B?V3dZSmFrdDY4MHRROVhObFBvUk9HQTNMK0lqTjBrZkxxa1A5M3QxZ0NsQlhx?=
 =?utf-8?B?WXJkc1R0OFpwaFNENkU2M3l3eUo0U016SWhrRDFnMDF0Si83eXQ3eS9XOHAx?=
 =?utf-8?B?ZXVWOHpKQ2FlbTFCVGluQVBLVTE1cjF4QUt4UUxXL1BqS3czcHdxYWcxUzMx?=
 =?utf-8?B?eTRQS3dvRlJ5QjFCV3NoalpFaDBndGdRNUZ1WGlRcGVVTy9NUHIzazNGWU1G?=
 =?utf-8?B?UUlSc0xFbzQ0Z0pvN1oyTVlmYTR5ZTY2dCs2VDVuS25KeTByRnFGSSt3SjVs?=
 =?utf-8?B?cVEzazc4S2hjQ3YwOFBHbUQwTlpqS1BHZmFDTm83RnpJTThBVmsyZGtVZ0hw?=
 =?utf-8?B?SXhWdEtRcHlSR0E2ZnJ4bmFPVXp3SVhza3A5K3RoQU5nY1NvRVh3QWFqZy9t?=
 =?utf-8?Q?LxIUKsjFIycSdcbkpUeGgKj0P?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <925BFAD89BFE5C429EBEB1A67009ED73@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3544bd-1320-41cf-f0bb-08ddca592b5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 02:24:08.4720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aqfvhyHoyA2YOiHbBLOOOdRbXK/7UZMGstW5ECTYrviaPJLZAmETg9BaMF5AVwYYebqax3elDxxK4SPC1Uu3qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFAF52E6423

T24gVHVlLCAyMDI1LTA3LTIyIGF0IDEzOjA5ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDIyLzA3LzIwMjUgMTA6MTEsIEt5cmllIFd1ICjlkLTm
mZcpIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAyNS0wNy0yMiBhdCAwOToyNSArMDIwMCwgS3J6eXN6
dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4geW91
IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBPbiBNb24sIEp1bCAyMSwgMjAyNSBhdCAwNjo1NToxM1BNICswODAwLCBLeXJpZSBX
dSB3cm90ZToNCj4gPiA+ID4gQWRkIGNvbXBhdGlibGUgZm9yIHZpZGVvIGRlY29kZXIgb24gTVQ4
MTg5IHBsYXRmb3JtLCB3aGljaCBpcyBhDQo+ID4gPiA+IHB1cmUgc2luZ2xlIGNvcmUgYXJjaGl0
ZWN0dXJlLg0KPiA+ID4gDQo+ID4gPiBMb29rcyBjb21wYXRpYmxlIHdpdGggZXhpc3Rpbmcgb25l
cyBhbmQgbm90aGluZyBpbiBjb21taXQgbXNnDQo+ID4gPiBleHBsYWlucw0KPiA+ID4gd2h5IGl0
IHdhcyBub3QgbWFkZSBjb21wYXRpYmxlLiBEZXNjcmliZSB0aGUgaGFyZHdhcmUsIHNheQ0KPiA+
ID4gc29tZXRoaW5nDQo+ID4gPiB1c2VmdWwgdG8gYXZvaWQgc3VjaCBxdWVzdGlvbnMuDQo+ID4g
PiANCj4gPiA+IEJlc3QgcmVnYXJkcywNCj4gPiA+IEtyenlzenRvZg0KPiA+ID4gDQo+ID4gDQo+
ID4gRGVhciBLcnp5c3p0b2YsDQo+ID4gDQo+ID4gVGhlcmUgYXJlIHR3byByZWFzb25zIGZvciBh
ZGRpbmcgYSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgdG8gTVQ4MTg5Og0KPiA+IE9uIHRoZSBvbmUg
aGFuZCwgTVQ4MTg5IGlzIGEgcHVyZSBzaW5nbGUtY29yZSBoYXJkd2FyZSBjaGlwLCBzbyB0aGUN
Cj4gPiBvZl9kZXZpY2VfaWQgZGF0YSBpcyBkaWZmZXJlbnQ7DQo+IA0KPiBOb3QgcmVsZXZhbnQu
IFlvdXIgb2ZfZGV2aWNlX2lkIGlzIHdyb25nIGFuZCBiYXNlZCBvbiB0aGF0IHlvdSBjbGFpbQ0K
PiB0aGUNCj4gaGFyZHdhcmUgaXMgZGlmZmVyZW50Pw0KPiANCj4gRGVzY3JpYmUgdGhlIGhhcmR3
YXJlLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KRGVhciBLcnp5c3p0b2Ys
DQoNClNvcnJ5IGZvciB0aGUgbWlzdW5kZXJzdGFuZGluZyBpbiB5b3VyIHJlcGx5LiBJIHdpbGwg
dXBkYXRlIHRoZSBjb21taXQNCm1lc3NhZ2VzIGluIHRoZSBuZXh0IHZlcnNpb24gb2YgcGF0Y2hz
ZXQgdG8gaW50cm9kdWNlIHRoZSBoYXJkd2FyZQ0KZGlmZmVyZW5jZXMgb2YgTVQ4MTg5Lg0KDQpJ
biBzdW1tYXJ5LCBjb21wYXJlZCB3aXRoIG90aGVyIElDcywgdGhlIE1UODE4OSBlbmNvZGVyIGFu
ZCBkZWNvZGVyIHVzZQ0KaW9tbXUgaW5zdGVhZCBvZiBzbW11LCBhbmQgdXNlIHNjcCBhcmNoaXRl
Y3R1cmUsIHRoZSBmcmVxdWVuY3kgaXMgb25seQ0KNDA2TUhaLCBhbmQgY2Fubm90IHJlYWNoIG1v
cmUgdGhhbiA3MDBNSFouIEF0IHRoZSBzYW1lIHRpbWUsIHRoZQ0KZGVjb2RlciBzdXBwb3J0cyB0
aGUgdnA5IGRlY29kaW5nIHByb3RvY29sIGZvciB0aGUgZmlyc3QgdGltZS4NCg0KVGhhbmtzLg0K
DQpSZWdhcmRzLA0KS3lyaWUuDQo=

