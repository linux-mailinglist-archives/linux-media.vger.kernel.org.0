Return-Path: <linux-media+bounces-29453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CE7A7D402
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 08:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E28A7A3EC8
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 06:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60EC224B1B;
	Mon,  7 Apr 2025 06:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hUz9RF+u";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="JSKDQs+L"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32034224251;
	Mon,  7 Apr 2025 06:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007246; cv=fail; b=CkkzFVSAbrjuXpwMnFR5iMF6lYH1LrvUTPWKTYtU5R5+RdgwZJJpIUwZr1q4p/uZ1rTJ8hsecV+Y0yLJQIzqvQ/t/UstH5ndpFBl3DS6rECYLaYxsyKpm4zF+/C63V7egP/HMy+7DiHRgG1oSvRXcv5pBFAUUtaQkG7lN7mXVZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007246; c=relaxed/simple;
	bh=hPHPto5XWe7dKvPv8LCaq87zbdeT+lFW8oXTD0oWHtI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ue10giZMDYhZxmQ4Ft/JAQgfXmjuIlWyfr66vldyj4EiQZaAnkSALBzX8/sNs2J3/C/Q+S+zjLwAY0D3u5ocTcOryeZAZNov9x8lxigR+mupiyRoUlXH5hkbjSKrTOrpBUEOOed3ZNa7a/1GdXu0p8U0lu+zwHq+bJ9Zh8wNnAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hUz9RF+u; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=JSKDQs+L; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5aa9e9de137911f0aae1fd9735fae912-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hPHPto5XWe7dKvPv8LCaq87zbdeT+lFW8oXTD0oWHtI=;
	b=hUz9RF+uoQPgxzYMHbQ03a7Hxpn0MoOZHJv1FgYfsihsOBTKmSB3Z34FifdjB52axdFq5Ov36Ffom8HYXnGH8r2kE5CU7KnV/GWsQvwk51mn4B3NG/6ZjJLrNtPngqUyX8f4OZKvoRDJBB9wOtqcn0dnsUz4zvxO66B4yimWOjE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a743f1f6-8e2e-4e3e-94b2-cc46d6e93821,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:559242c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 5aa9e9de137911f0aae1fd9735fae912-20250407
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1441923836; Mon, 07 Apr 2025 14:27:18 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 14:27:16 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 14:27:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcHNd3HVwEwHTgR6u5LoCjGG1Cgv6qUyuhW7Vi9y+LCMm5ftstYcTJZUo/Lgaekp+4MQPhdLt9op84qagDFxLBiiC/legMrPLjy1R6N3M1q9H9J/jAYG1Tf32pnJRYrTR8iUQbWERTH1q4ncbrX3A3pJ4k0F5W9LYmWavI7WtbNMMizToT7640d1PonA5B/aR0SgBG/lsyFlzkkphvGOei52L4NdKCDkSLOiYTPBtgGGmL/w7CqE3ylrrbEyKYQQg0sR8qU58jfJk+XMnvi1hrcNoHcCeN2WZYYNIITxK7m01NmYf20aMRlB+TizusbE1sbKxDjp0WKzjKzHEFUAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPHPto5XWe7dKvPv8LCaq87zbdeT+lFW8oXTD0oWHtI=;
 b=oniP79ZjxLjFdPz/V53l+xFBOvq0rdAS9YQXH42P0vePKPTbpjpfSw5JzAGex9dtvH8Z58gYGTjo3E+vmZM9q/0mK7/ln5KuURwHXOQsWXQCAjaBQ4dWK9yLA9kiHCv5Ygh5YV9Yyv2I/+LhxN4afn5OPLVY/6o+OuB430n0mIRljbcOWZ8iczsWsKjBDO+37AnnsJXUDjCTW+L7QoMhjuZYHyVE/vGR3kdc5FQaKOquLGa/kNwKqjZYYiK+KKTww+xW62LSXwkCvCsp4IfiDepoLuUmc92Z+H7Rfn+QSMU3CbVCzG/5WQ9zm9SK+bNntfobq7mLW3vO3wHrpkGirw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPHPto5XWe7dKvPv8LCaq87zbdeT+lFW8oXTD0oWHtI=;
 b=JSKDQs+LPTNcs30X+chhUoXZC1Z3H+BwIuKwB38ryj04pzxzf4RwL7cwn396BL5EkxFQQFi8jZ88Fudqzn7ahIAz5q69q31dhjgPoJ3CXiDJjXclbYvJF9U8DGzaLRJpp/UB21bm/cqNDGs16t2PwAS8Txz1EjECS7u9f/OcLpo=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEYPR03MB7536.apcprd03.prod.outlook.com (2603:1096:101:146::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Mon, 7 Apr
 2025 06:27:14 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 06:27:13 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "tzungbi@chromium.org" <tzungbi@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>,
	=?utf-8?B?QmluIExpdSAo5YiY5b2sKQ==?= <bin.liu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [V1,00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Thread-Topic: [V1,00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Thread-Index: AQHbYptcL+kFhraGykezUCJU0B7V+bMOekcAgInMswA=
Date: Mon, 7 Apr 2025 06:27:13 +0000
Message-ID: <70516ca05593631343b6fafbea6148f4a6f513d3.camel@mediatek.com>
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
	 <c67ebf846d19086586b00d1d79252c8296a704b5.camel@ndufresne.ca>
In-Reply-To: <c67ebf846d19086586b00d1d79252c8296a704b5.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEYPR03MB7536:EE_
x-ms-office365-filtering-correlation-id: c251ffd2-82c7-41f9-8b1a-08dd759d3c55
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RUxvYnhTQ0I5ZFA0SGhZNjRBMW14YTBHd3h1ZmJrZVJVRGlpMTI4SW0wdW9o?=
 =?utf-8?B?Yy93akQwRG1IUFFjdjUrYXhqL3BnVUh4aU5XQUh6RUFHOHJyay9tbENpVk9i?=
 =?utf-8?B?ZHNwTHd5NTZxRk50Zlk1emVadmhtdm05aVA5NUJCVTN4WjkwL3E2cCs1aHRt?=
 =?utf-8?B?UjlweFNNN2hqK29GQVhnbEdvQjgvZWpjMi9HV3Z0aGphRzBjWUJHRDFMTksr?=
 =?utf-8?B?UFhmdUZWWm9ya1daN04xVXRtcjVmOVJKWnFPOTJwZE45WmNENmJyRThFQ3Ez?=
 =?utf-8?B?ek9OMGI0YjVFNDJ1NGpvVHcra21aZ1JCS2NiRHZReVFnclBlVzUxUy94Q1Bi?=
 =?utf-8?B?QkFsazRZZlBta1Y1ODJTZTVhZERNamZXU1FxTEVsSVVqZVlqZDJCbzh4RktN?=
 =?utf-8?B?T0RyNVZLWVF3S3lvOUpXMksrK1JUeTVzb3V3TzJCbTJpSVBsVVVINE9uRFhi?=
 =?utf-8?B?ZkFiRDk3ZE83aURCV2dyTGtMVzIwclgyVTh5TEszREdFeDQ5bWhIOEVvdGxO?=
 =?utf-8?B?cG1oZWJRL2lnUWtpMzRuSUk3NWpUYTduZWY3Y2VUeFRhY1RYMHF1Q0NhMHJN?=
 =?utf-8?B?cGdTdmJCY29XWTRLRTJoWjk5MG9hZkIxK1FGaXBHeTVMSnVadnNFNC95M2F1?=
 =?utf-8?B?bTl3N2FLcTY1RmcvQmRkeC9IMlUvbVhEVG1GWTdCOS9obmRGQU4rWldRa1Rj?=
 =?utf-8?B?N3Y1eXMrQU9Ra1RSd0tGWGpyeHJkREFhdkdsMEdYc2tiSzZNOWt3ZmJPK211?=
 =?utf-8?B?aktQSE9OenVkK3JtMUhwMG00c09ROFpjK3RLRVBmVjRlRjRXSkJ2aE1LZE5I?=
 =?utf-8?B?eHV6ZXhsUWkrcWZaSFZYcXZsekIySVZhMHMvS01ib1RXUTJoVmZSU0V0Y09a?=
 =?utf-8?B?RTNnRjBmRzFJWHZRN0F3YW5FQWd1RHRhVDJpbjZTeDZ4cUFOQnI5akEvTGdr?=
 =?utf-8?B?QXM4UUpaQWdCUk03OGo0bWVTMHhQSllJQXFYSWFzWE5abmNHOHBiVXY1NzNR?=
 =?utf-8?B?azJ6TWg0ZE9teVE1K2MrdCtjelZ5VWFBRSt4OHdYL1dZeEtmdERYbk1OcWZX?=
 =?utf-8?B?MTE3LzFiQWFrMHM0ZUIxL2JkZ3ZXeG5XclFpcGlxenYvTldtRFYvY1JlYUVM?=
 =?utf-8?B?RlhXZ1lpR0YrcEx3SUFpVnp6VHZjTUhoRktmZXZGSUFySmtKeVNzR3lTSmVT?=
 =?utf-8?B?NjZCR2MxRjlGdU1vWmsya1JuMGRqSHhFSHBMSlRGdVB3TjRuZVZ5UVE1N1Vo?=
 =?utf-8?B?NVFIZVJBZk4xV3lFTDhIWUJJYVphT1dmZFhRUG11eXh3RDVndlBYbXNnWHJW?=
 =?utf-8?B?OUJGM1hEWG56T1piaUw3bUF4R2NuUW95MndUeHBld0JRdWRtMXhkVFZEbzN0?=
 =?utf-8?B?RzFlT3J4U0c4Rm9lbTJoZTMwQ0xidTFQRkU0M1FBZnVZaVk1M0JoSEs2OHBh?=
 =?utf-8?B?Rk1ucU5nenE3TWtOUmloYnZOVXJmMHZwUTJrRTd2RmZ3TWpzQTF4QUN4UWJv?=
 =?utf-8?B?M3IvYkJsU3FSaFpkT0Z1Tnc2Y0tmVXhMUHp0NGlhQ0cxeSt0cTlZOWQyNTg2?=
 =?utf-8?B?U1J3NUlzYWM1UEhIQVh6U3VCQ283aWk4NER1enAwU0ZBZ0drY0plV0s1Nk1Z?=
 =?utf-8?B?TDd0d2loRk1UWVFoa1lwb1RBMzVHWjZoZnY4bUZkTk9FeVVXMFBpb3ZKQ3d6?=
 =?utf-8?B?aHg4Z0tiWmtrWmpYK0QzZEtkRW56N2FONG5ydnFibUtyZGQrLzJPbE8rZUl5?=
 =?utf-8?B?eTFOZlpVeFExMjRQNEd4UFZsSklDN2FLNXdQTlovcVFUMlBncStYQ0tqdVpJ?=
 =?utf-8?B?MkFXcXl0bi9JKzNtQ2ZRY0p1MzEvWUc4clhOcmNjZE5DRnh6ano4Wk1BOUwx?=
 =?utf-8?B?cG13ajZValUyVElqMFNLMllwV3BPbUh1UHEyVzRodjU5d0EySjErS0FtRlJS?=
 =?utf-8?B?VENjVzZtNDJLRHJWNERjN05MeDMydnFRUjBWQm9YMUhIbTdnSWlRNzVqdUVu?=
 =?utf-8?Q?H2wjIxVWpXdh5Q9Vgwn9lAg8ATqEhA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUNHU3NlVkNYSzZUWTlJNFJncU4zQ1N1eXpTY2taejJzYS9zbXExSlV4c3Vm?=
 =?utf-8?B?Y1RURGNtTHlJellKU3FMd2JRUlJUUFBxWmRKTnN6TmFrV2JoemV3SnZLNFVK?=
 =?utf-8?B?dkMzMmdwWTV5N1NIMWx4WmlVUDZkSE4xUGlSMXBVTTN3SExSTDJQQ1RMUjJN?=
 =?utf-8?B?R1FZTFVpY2R5bFRJSzNURE5SaUh4bit4c2JLYVlJNU5aYXh2UzEzT1hJYjEw?=
 =?utf-8?B?UzNLbmRkQ0hzUHlwUzEzYnhHZ2ZMT2hlSTgrYUk4N1F0K3VPalRVbXJDRVlz?=
 =?utf-8?B?dWw2bjIxb25VRURwSG4wZjIzbGNNL1BJbzIzekVOTCtDbWs1YVNsZHBDNys0?=
 =?utf-8?B?eWl2QkR3N2FOd3RPMjJBTDJHTlp0SUFBSEJzY1E4WHBlWFg5OVB2cUxsT1c3?=
 =?utf-8?B?cG0wOTlsckIrQ3c2R082NnlITGpFVHNjempMeXJhWlYrT0xUR3BZdEJGelo0?=
 =?utf-8?B?Vlp5Q3R3VVQ0UWt3LzlVZjZBdldJbUV0OWswdlFxcGt6SzlVRDBNaHAyRko5?=
 =?utf-8?B?a0NzRnd2cW5oZ2t2aXhvMHNQeGRRVGEyTTZCdStzaTcvRjRVeWk0dU9lSXlC?=
 =?utf-8?B?OXdQUjlmdWRMaXhncGY0cE9lTnF6S0VURFRkRWNtaHBiMUZWcHNwMk5sdVdl?=
 =?utf-8?B?TUJHc3B3Z1ZZTFh1Um13elduRTQ0dTQ1aHRzNHNYRTF5aS9ZbjZoV2VMWGJ0?=
 =?utf-8?B?bnplajYrbmhyR25UbTRzQ3Zoczk4YzF6Q3pIbzFwNEFiRzVSVjhnZDltTmVj?=
 =?utf-8?B?YURPalFtbWxydGdJNmVUY1EvbEswMnVmUEdISzVLcmVzVG5OTVk1eSsrMEJx?=
 =?utf-8?B?ME1lU1Z0NmtZSnk2WGtYdU5xYlVxN3ZkSEhWK2ZCZVRJWGFyL01IMFcrSlRw?=
 =?utf-8?B?eUxxaFEvcDRCL0dEQnp5Wnl4SmpBRDVIazQ2bytVMjhkQzZkR2dGM1hPckFB?=
 =?utf-8?B?MUNsYnNWbDMzK3diSGpBa0NmaDZId2FVR3JxS3M1YU45TTRQQmRVbkxMMnlV?=
 =?utf-8?B?eXpOZVhZbncrM3V5Wm1RY1RvNDR2dGZ4S1NiV2NhTUdseENLZ2JXcEkvQ0Y5?=
 =?utf-8?B?UlBlMGxZM25rMFNWcTdnVUdzK0FmcGRNeHBOU053RFVBaUZGL01RVitWcy9X?=
 =?utf-8?B?RWVRNnk2VU1meHFkb3NlZERjQ0syR2hQN3RPZ0tUMDhVbFhIek1hOHFXTHR2?=
 =?utf-8?B?L3NXc0lvVVp2NmpIdHJkdm53Y016YUoweUkvb09VVnpZQjF3WU1nRnVBenlD?=
 =?utf-8?B?bFE0VE1XTk9KcDZlaVRnMll5V205YUcxdWcvcUN3UldoQnNCMjF5OGJiQmcx?=
 =?utf-8?B?WlJGMzd3aFB6UUFrRzBpZ2VXM3ZyT0IzMEFCSFRjb0FVTGR4bmJVK3RFdFJq?=
 =?utf-8?B?UjFRbi9mS1RtUjFNc0NSeXhHUlZpdlhsKzRadkNUM0tGVEhUeFlUazh0ci8v?=
 =?utf-8?B?dStCeDlyY1dBSHNjL0hxSnZZYmpKQVZJL29BL2ZORHdYSytMejdLRG5ucnRy?=
 =?utf-8?B?Ym03L0xWVStGT1FDSE1BeTZyNk9sMER6cUtmcHcxQk83Q0RvK0FiWW5vbHg0?=
 =?utf-8?B?RmdtMWdCREpVRndLQVZYaFc2OW43UnVjTEpPS2oxRW5WclMrRHlERko1T1BD?=
 =?utf-8?B?VDIrbmRoMlNNSGJLb3huamtyQ2MzZnM5M3ZxQXlVUkxyemkrMVh5SjhGdEw5?=
 =?utf-8?B?bks0UUY0Q2Y0dGhxUVF4TENJQ21nMmJPYmJKYkVMQ2RBOUI0R0JEanVpSFhq?=
 =?utf-8?B?bVMra0c2ekJlNjVRUlM2cCtPcXh6bXVwdmRkdHVMVThTSWdqRHBrQlFUOUx2?=
 =?utf-8?B?OXBGOUtUUU14UTlDdjFRdDVMeE5WQ2Evcy9BL2ZuOGI2VXFmQ2NlVVplSVAw?=
 =?utf-8?B?Qk1aODNSN1o2UkhBODlMeEQyd1B0V1hzcEk3ZFFlaFlEK1JJRURsYnViRGVk?=
 =?utf-8?B?d1ZVdVROcXhIUEJCUk5jTm9HbVRjWWJmM09uQUovYm1PdGdXZ1pBY3ZFa21z?=
 =?utf-8?B?Qmx3TWppOVVodFM1blpmeTZJWHhMcGh0bFB6V2lTOFdVMld2NWt1cS9XYzQy?=
 =?utf-8?B?WVVhYUF2TGVFU0tlZnUwNy8wZzJqQ0pJTXY5VEh0a3Uyck5zZnVLbmNCU0xP?=
 =?utf-8?Q?fDlWWMY7o+6h//UFylp28ppH7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD04E86F6A72FD47ABB30F2055BE6810@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c251ffd2-82c7-41f9-8b1a-08dd759d3c55
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 06:27:13.8713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gvbozN5YOKyE39kztBPKMG2SPPEKPRNgd1aWKc5H4kFlJZLGzw7oiVj/8FOi+bym6ef5rxjuMkJTOaa8yW9MUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7536

T24gVGh1LCAyMDI1LTAxLTA5IGF0IDA5OjA2IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IEhpLA0KPiANCj4gTGUgamV1ZGkgMDkgamFudmllciAyMDI1IMOg
IDIxOjM1ICswODAwLCBreXJpZS53dSBhIMOpY3JpdCA6DQo+ID4gVGhpcyBzZXJpZXMgYWRkcyBz
dXBwb3J0IGZvciBtdDgxOTYgbXVsdGktaGFyZHdhcmVzIGpwZWcgZW5jICYgZGVjLA0KPiA+IGJ5
IGZpcnN0IGFkZGluZyBtdDgxOTYganBlZ2RlYyBhbmQganBlZ2VuYyBjb21wYXRpYmxlIHRvIGlu
c3RhbGwNCj4gPiBrZXJuZWwgZHJpdmVyLiBBZGQgc21tdSBzZXR0aW5nIHRvIHN1cHBvcnQgc21t
dSBhbmQgaW9tbXUgYXQgdGhlDQo+ID4gc2FtZSB0aW1lLg0KPiA+IFNlY29uZGx5IHJlZmFjdG9y
IGJ1ZmZlciBhbmQgY2xvY2sgc2V0dGluZyB0byBzdXBwb3J0IG11bHRpLWh3IGpwZWcNCj4gPiB3
b3JraW5nLg0KPiA+IExhc3RseSwgZml4IHNvbWUgYnVncywgaW5jbHVkaW5nIHJlc29sdXRpb24g
Y2hhbmdlIGhhbmRsZWluZywgc3RvcA0KPiA+IHN0cmVhbWluZyBzdyBmbG93IGFuZCBvdGhlcnMu
DQo+ID4gDQo+ID4gVGhpcyBzZXJpZXMgaGFzIGJlZW4gdGVzdGVkIHdpdGggTVQ4MTk2IHRhc3Qg
dGVzdC4NCj4gPiBFbmNvZGluZyBhbmQgZGVjb2Rpbmcgd29ya2VkIGZvciB0aGlzIGNoaXAuDQo+
ID4gDQo+ID4gUGF0Y2hlcyAxLTMgQWRkcyBqcGVnIGVuY29kZXIgYW5kIGRlY29kZXIgY29tcGF0
aWJsZS4NCj4gPiBQYXRjaGVzIDQgYWRkIGpwZWcgc21tdSBzaWQgc2V0dGluZy4NCj4gPiBQYXRj
aGVzIDUgZml4IGpwZWcgaHcgY291bnQgc2V0dGluZyB0byBzdXBwb3J0IGRpZmZlcmVudCBjaGlw
cy4NCj4gPiBQYXRjaGVzIDYgcmVmYWN0b3IganBlZyBidWZmZXIgcGF5bG9hZCBzZXR0aW5nIHRv
IGhhbmRsZSBidWZmZXINCj4gPiBzaXplIGJ1ZyB3aGlsZSByZXNvbHV0aW9uIGNoYW5nZWQuDQo+
ID4gUGF0Y2hlcyA3IHJlY29uc3RydWN0IGpwZWcgZHN0IGJ1ZmZlciBsYXlvdXQuDQo+ID4gUGF0
Y2hlcyA4IGZpeCBtdWx0aS1jb3JlIHN0b3Agc3RyZWFtaW5nIGZsb3cNCj4gPiBQYXRjaGVzIDkg
cmVmYWN0b3IgbXVsdGktY29yZSBjbGsgc3VzcGVuZC9yZXN1bWUgc2V0dGluZw0KPiA+IFBhdGNo
ZXMgMTAgZml4IGRlY29kaW5nIGJ1ZmZlciBudW1iZXIgc2V0dGluZyB0aW1pbmcgaXNzdWUNCj4g
PiBQYXRjaGVzIDExIHJlZmFjdG9yIGRlY29kaW5nIHJlc29sdXRpb24gY2hhbmdlIG9wZXJhdGlv
bg0KPiA+IFBhdGNoZXMgMTIgZml4IHJlbW92ZSBidWZmZXIgb3BlcmF0aW9uDQo+ID4gDQo+ID4g
LS0tDQo+ID4gVGhpcyBzZXJpZXMgcGF0Y2hlcyBkZXBlbmRlbnQgb246DQo+ID4gWzFdDQo+ID4g
DQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQwODA4MDkyNTU1LjEyOTk5LTEtamlh
bmh1YS5saW5AbWVkaWF0ZWsuY29tL19fOyEhQ1RSTktBOXdNZzBBUmJ3IW1KbVlIbF9Tb29tV0w4
YmVQXzVYdVVaMGJwdmhJX1RxSlZjRGpONW1reE9uck5QbkVrZnU4LUpkVGZ4eDNRNlNaSUVCVS0z
Q3ZkZE93LTN1aW8xTXhBJA0KPiA+IA0KPiA+IGt5cmllLnd1ICgxMSk6DQo+IA0KPiB3b3VsZCB5
b3UgbWluZCBmaXhpbmcgdGhlIC0tYXV0aG9yIGluIHlvdXIgY29uZmlndXJhdGlvbiwgd3JpdGUg
eW91cg0KPiBuYW1lDQo+IGluc3RlYWQgb2YgeW91ciB1c2VyIG5hbWUuIFVUOCBpcyBhbGxvd2Vk
LCBtYW55IHBlb3BsZSB3aWxsIHVzZSBhDQo+IEFTQ0kgc3BlbGxpbmcNCj4gKHNvbWUgYXBwcm94
aW1hdGlvbikgYW5kIHRoZW4gYWRkIHRoZWlyIHJlYWwgbmFtZSBpbiBwYXJlbnRoZXNpcy4NCj4g
DQo+IHJlZ2FyZHMsDQo+IE5pY29sYXMNCj4gDQpIaSBOaWNvbGFzLA0KDQpJIHdpbGwgZml4IGl0
IGluIHRoZSBjb21pbmcgdmVyc2lvbi4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KS3lyaWUNCg0K
PiA+ICAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBBZGQgbWVkaWF0ZWssIG10ODE5Ni1qcGdkZWMg
Y29tcGF0aWJsZQ0KPiA+ICAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBBZGQgbWVkaWF0ZWssIG10
ODE5Ni1qcGdlbmMgY29tcGF0aWJsZQ0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiBqcGVnOiBhZGQg
anBlZyBjb21wYXRpYmxlDQo+ID4gICBtZWRpYTogbWVkaWF0ZWs6IGpwZWc6IGFkZCBqcGVnIHNt
bXUgc2lkIHNldHRpbmcNCj4gPiAgIG1lZGlhOiBtZWRpYXRlazoganBlZzogZml4IGpwZWcgaHcg
Y291bnQgc2V0dGluZw0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiBqcGVnOiByZWZhY3RvciBqcGVn
IGJ1ZmZlciBwYXlsb2FkIHNldHRpbmcNCj4gPiAgIG1lZGlhOiBtZWRpYXRlazoganBlZzogcmVm
YWN0b3IganBlZyBkc3QgYnVmZmVyIGxheW91dA0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiBqcGVn
OiBmaXggc3RvcCBzdHJlYW1pbmcgZmxvdyBmb3IgbXVsdGktY29yZQ0KPiA+ICAgbWVkaWE6IG1l
ZGlhdGVrOiBqcGVnOiByZWZhY3RvciBtdWx0aS1jb3JlIGNsayBzdXNwZW5kIGFuZCByZXN1bWUN
Cj4gPiAgICAgc2V0dGluZw0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiBqcGVnOiBmaXggZGVjb2Rp
bmcgYnVmZmVyIG51bWJlciBzZXR0aW5nIHRpbWluZw0KPiA+IGlzc3VlDQo+ID4gICBtZWRpYTog
bWVkaWF0ZWs6IGpwZWc6IHJlZmFjdG9yIGRlY29kaW5nIHJlc29sdXRpb24gY2hhbmdlDQo+ID4g
b3BlcmF0aW9uDQo+ID4gICBtZWRpYTogbWVkaWF0ZWs6IGpwZWc6IGZpeCByZW1vdmUgYnVmZmVy
IG9wZXJhdGlvbiBmb3IgbXVsdGktY29yZQ0KPiA+IA0KPiA+ICAuLi4ueWFtbCA9PiBtZWRpYXRl
ayxtdWx0aS1jb3JlLWpwZWdkZWMueWFtbH0gfCAgMTAgKy0NCj4gPiAgLi4uLnlhbWwgPT4gbWVk
aWF0ZWssbXVsdGktY29yZS1qcGVnZW5jLnlhbWx9IHwgIDEwICstDQo+ID4gIC4uLi9wbGF0Zm9y
bS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuYyAgICB8IDEyNiArKysrKysrKysrKysNCj4g
PiAtLS0tLS0NCj4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5o
ICAgIHwgIDE3ICsrLQ0KPiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19k
ZWNfaHcuYyAgfCAxMTYNCj4gPiArKysrKysrKysrKysrKystDQo+ID4gIC4uLi9wbGF0Zm9ybS9t
ZWRpYXRlay9qcGVnL210a19qcGVnX2RlY19ody5oICB8ICAgNCArDQo+ID4gIC4uLi9wbGF0Zm9y
bS9tZWRpYXRlay9qcGVnL210a19qcGVnX2VuY19ody5jICB8IDExMw0KPiA+ICsrKysrKysrKysr
KysrKy0NCj4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3Lmgg
IHwgICA0ICsNCj4gPiAgOCBmaWxlcyBjaGFuZ2VkLCAzNDMgaW5zZXJ0aW9ucygrKSwgNTcgZGVs
ZXRpb25zKC0pDQo+ID4gIHJlbmFtZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEve21lZGlhdGVrLG10ODE5NS0NCj4gPiBqcGVnZGVjLnlhbWwgPT4gbWVkaWF0ZWssbXVs
dGktY29yZS1qcGVnZGVjLnlhbWx9ICg5NSUpDQo+ID4gIHJlbmFtZSBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEve21lZGlhdGVrLG10ODE5NS0NCj4gPiBqcGVnZW5jLnlh
bWwgPT4gbWVkaWF0ZWssbXVsdGktY29yZS1qcGVnZW5jLnlhbWx9ICg5NCUpDQo+ID4gDQo+IA0K
PiANCg==

