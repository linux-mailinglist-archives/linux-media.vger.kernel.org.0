Return-Path: <linux-media+bounces-29461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B0A7D5D3
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04D147A7A85
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 07:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F63E22A7F9;
	Mon,  7 Apr 2025 07:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cxTaqSDj";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="jon5vMvz"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA4722A7EE;
	Mon,  7 Apr 2025 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010596; cv=fail; b=dD2aBBXb2epTpm26Ko4j0P3TX93cZ5kfDkUYjemQ11mZI+VstpAc/2nxW/H2GiWXYLNabodPnxh1VNdlpyRc/tMrELYVhQzFXXYOQlytH3EgzGvUBBGvFFclibU/0CbwcZdH9isDB+u3GT8lYpRF3qI+fQ8c0FOjuyNH54ezuUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010596; c=relaxed/simple;
	bh=qbkRA+n+wQ6BhRmiNYihLnYbWGw4PDRkFD8o8egHXxA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u8s5PRBMif1SjbLppjFet8hioyK28sZQA8ETht6pxvF1u5hxYbx/MJ7N2vPwz73qmvnERsAqGT+HZlixPfI+4TfqsbLWR/3xCVJG5JT9Tm+o3i5/1YtFUZYmT1KNm+WLSkX9tUw+YCsgD11xOvXbdHRGrO6hW83+qhup1Ube0Lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cxTaqSDj; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=jon5vMvz; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 274e77d2138111f08eb9c36241bbb6fb-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qbkRA+n+wQ6BhRmiNYihLnYbWGw4PDRkFD8o8egHXxA=;
	b=cxTaqSDjDBBOf6am29JOPLzih1BonFabrJPIhdha4KYltIooax4TMc1otxyUZZSFuHuPo0m/WSfe/XJ0sTO6G9Lg8kqG1TtbY38+89yj7uBjigNoPOWQ7diSMsQlRbmpxSl01MUa+/BojUYHCBuFip2T871MmKaN7Zi9DoXBLpw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:bdc4df1f-dc39-463e-a15d-a4ad19d8dd08,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:4cec4b8d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 274e77d2138111f08eb9c36241bbb6fb-20250407
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1494132643; Mon, 07 Apr 2025 15:23:07 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 15:23:06 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 15:23:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBaOPRACBaTofcCItZRZz1ZwYFNyhXElA+SjLHOsZ0kldSwl7I3XjhYM3m6Z8QqZepgf7p0tyyYE4PmPrESU5mhFgklJYLmE0dJtye0Lzc/5Waa8vcIwgcmwcqrl7DyRpr4+Jfm5lQn3kn+uZhe/50XsKpskUmuxSGmCSCwSgwYwmJahRKmZrtG83oAJdNu5oUx8bRDhnQcVegCFiQ5jYUEiyPELZev7taoguVoFqmPS528SPqqtceaQsOwJzR2Dieuu30C5gfAjGMSg+WHcVdn6rE+dpoYgiFFbPq2q8bRQSCq1LHrp4HjvJT/rQm9X0IIaUK7Iw6jjv0H+RlvYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbkRA+n+wQ6BhRmiNYihLnYbWGw4PDRkFD8o8egHXxA=;
 b=k5cweZAmyemfTw2honzOcO7H65XV2lqAYrwDXWMibF7wqnERrMCldqBrC2qjRSiVK2AMUUttiEeS4IVEuZvwa8mBjpwQUcDlMkQ7viYJWwMLIAYca7fvmeiVHk2hqE3bAsfh2py/6BYw1jYcQd7sRAXr9AtIiPqMdq2bxTbxti8/3XqtGGBwZJ+P/X65U2zs/bEuf23F2NDjDQrWC5dVJmLhMEC1AXCVGT30catuqyISChi/Hh+gEoiIBr+B0BuEg+HqdMgUOYE/ep8CX+/0bQNfjMWUQYyx9cnElgR5QftvtLTAzGj7xS6NDLbiYhunRXzVk1gUbRsP6UzZTvPqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbkRA+n+wQ6BhRmiNYihLnYbWGw4PDRkFD8o8egHXxA=;
 b=jon5vMvzNCGgknocfJH+hsKBMnJe3IMmXhKJy/dlMUU/vg0bGx4VsE6C++IYJC9FqbFhIIa6tyLHI2Ljf6v4EWy4gnpLoiCs6QmiJ45mwKaIROGk2lJlfG9Fmu1ZK4bGox92anGkvghiwfpjp2V8XAscJVEGwxxmfAxAiMN83Ck=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SI2PR03MB6859.apcprd03.prod.outlook.com (2603:1096:4:1f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 07:23:04 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 07:23:04 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"tzungbi@chromium.org" <tzungbi@chromium.org>
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
	<krzk+dt@kernel.org>
Subject: Re: [V1,05/12] media: mediatek: jpeg: fix jpeg hw count setting
Thread-Topic: [V1,05/12] media: mediatek: jpeg: fix jpeg hw count setting
Thread-Index: AQHbYpt5sQeXMwzLqUGppD0D2jew5rMPw3MAgIiTIoA=
Date: Mon, 7 Apr 2025 07:23:04 +0000
Message-ID: <dcbe03c7490ffc9879f78fd92e1157276f62f315.camel@mediatek.com>
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
	 <20250109133513.20151-6-kyrie.wu@mediatek.com>
	 <df63b281-6889-4ac1-8dfc-b61d81061953@collabora.com>
In-Reply-To: <df63b281-6889-4ac1-8dfc-b61d81061953@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SI2PR03MB6859:EE_
x-ms-office365-filtering-correlation-id: 8dc72f1a-a9b5-4842-aeb8-08dd75a50987
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MTdIdHlBc1g0UmZYc2xxOVVra2V6QldpVGR6cVl2SUdwUXZBUzZha3Q4Y2NJ?=
 =?utf-8?B?TXpPYktEQjFYTHpKdE5MaW1weVNxdEdKeTFjOWh6d2hCRXJyS0FxY3hCNytK?=
 =?utf-8?B?Q1hpK0N2YVRLdWpvK0NVNWIraEplWFN3N2Q3NUJLZlk0VitBbTZpaW16OVJO?=
 =?utf-8?B?bWxtL1J0MWlPTUs0TDdlVDgrdDZYLzQ0NnpYeXhvMTZpUDdSYlAwSkpUQXNX?=
 =?utf-8?B?bVBQVEJSK1pDYzVaVFZvQVZmNmNlZ2xzT1hDZUpuWmlaZWprdXp4aXZPYzhK?=
 =?utf-8?B?aHdlL0MrVlNiTTZDSGpmQzFWaUZQUTdpejE0QWtTWlFRSitNd0Z5Tjc3V2hn?=
 =?utf-8?B?Q0hma2Y3UzhEWXRRc0Q5bFNvR2ZNYlEvZUpVbHc3VkFTRFZmSWt4RmsrTVdj?=
 =?utf-8?B?ekRTRDVtSjFvVXV3MVRJUlV5Q2VvTTBFeGg0YkFkdW96eU5peFpNU0ZscVhM?=
 =?utf-8?B?SGFTbmY1T05ucm9jaWF4VFpxK0JtR05lSGxuZWgrSkM5enRTQXVuclhDUlk0?=
 =?utf-8?B?ZW5NbVRuZUpwb0VjeUtJK29COHIzb0lZdngyNlYwYndudzdmaERiZ2M2a3k5?=
 =?utf-8?B?NG1oNUg0dVZaQ2ZZb0lDRlg4M2tIS3Q5SlNRU1FVWkpkSmhpTFVWNnk1Um9j?=
 =?utf-8?B?cjVkMXhZTE9tdlZjR1JhZndRcWE1alZXYlEwYUxDdllzU2ZmUmpyeVBNb2FN?=
 =?utf-8?B?V2tnL1JnWDNJZ0ZVc1NJREVCYSt4djl5WTA4OTVBNFRoM015M1hITlFBV0NS?=
 =?utf-8?B?OUxMVmloQnkxSStxU3pYbmxBMk9uS2tOVmZNak01d3cvYklBYWZESWVIMWZX?=
 =?utf-8?B?UVZVWmxtUmpXeUNpdkw1OGNRRGZnZFhDM0h4bFVXVHNiUCs2NmJ0L3E2K2lM?=
 =?utf-8?B?aTJoMzFncG1xbXVnTFRsMno3Qk9aMnVRYzhxVlBQc3lGR3grNG81QXhFc3pr?=
 =?utf-8?B?VFM0Nnk2VXZMaStkWUcyZmlsVU9rNWRaMDBEUWtWY3BSVXcxdE93Z2grdnBR?=
 =?utf-8?B?dzZlY0o5emR1b3gzVjA1bHlIQzdNT1FTclg5VWlrTDhsb1dqZHN6NjhwZThX?=
 =?utf-8?B?ay9IaElyVzJVVzRtQytVVUtISjRiOE52R0djaEgxbE96MGM0K3JKN2VZbmxs?=
 =?utf-8?B?R0FtK2djNytBTEpXZWs2a3hyS2k0YkhrNU43cmNITFViOTU2YXJBaWxiZkNO?=
 =?utf-8?B?Mk1CM3VUa3VwWmxlc0VvZ2FuRjNGTU5HamwzNXdQcnJ0VktQNlBwL1o0NjNJ?=
 =?utf-8?B?bFEwWndhd3l3U0xBc1lYaHBJSlRqYzZ1Z3I2STNSOUM0SCtjSFoxTE9Nb2xD?=
 =?utf-8?B?aWx5WEFEK2xDbktaSFdCc0RsQitrRmptNmZic2pHUjdCN3QyTndIZlJtRU1y?=
 =?utf-8?B?SnkvdENmUlJkVm1UNDVOT3o2UEpDRFJMY0xIVWFVaEpOaWc0YUpVT1lqQktE?=
 =?utf-8?B?bUpRbEg3UzRqSWw5TER1amZYTjFqeXNkcUpET3VFU0lCTHhrRURpeUEyYzVY?=
 =?utf-8?B?MGVsdWVReVAwQzJKcHhHZVM2cHdLT2h6TDNITTljOFFiU0lVKzNnMTJFTzRO?=
 =?utf-8?B?aHFoZnVFWjBLRDhTSEFPaDdpZTFJN3ZTT3hMKzlXeitteFl1WjNKb1lXWVNM?=
 =?utf-8?B?OEZsNzhGUytuck5lRGUzT2tHU3Q5L1RkYm5nWWJnZTFUYk1ENk9IMExsQ1py?=
 =?utf-8?B?ZEtFcEUrM2pWUkNNV2R0djJpWVVndHpuMTQ2WHcyZmFnUHd4TlNocFZXcVZH?=
 =?utf-8?B?YkxGWGxxWGJGZDNZcFFPTVAxY3Y1OTVxR1ZicnBPQm1XWWRCMHkvc2h6bkVF?=
 =?utf-8?B?R250eVVEYzQ1TnVFN0ZjVGt0d2toSkVId0cvUmZndDJicTl0MGxMUjV4MHhn?=
 =?utf-8?B?NldPNjhZTzhoenV0L0U4c3hERi9XbE90YmlUSGJtcUFlMVB2WjZhbnVWZFRx?=
 =?utf-8?B?Nm9iMHhYTjdiQ3Zxdi9FanRSM2ViRC9jc3NNSmlmSmNKK0tUc3R0MFBLZkxn?=
 =?utf-8?B?WHdJMmNOTXNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXFwbHcwU1AzWExCNkV1ek4zSGZpNmRlRUZKRFYxUUk2eFFlWWhua2pGeHlZ?=
 =?utf-8?B?SjJ1a2pJbVowSVVyQ0NpMnEzL29WYitybHBhbldIOTZ4L2JRNUJGenFSZ2N2?=
 =?utf-8?B?ak1DSnZIamQ3a1hOcFJMZXR1REl5bng2aTJ6MlZVTnR1QmNBczQ0SDZXNWVQ?=
 =?utf-8?B?Vm9KS2d3SlloOE5oUE85dnZwbVpPd3dUNmthZ0MxZUlNVzZwalJkRXV1aTdL?=
 =?utf-8?B?ZHZBS0J5WkZkTnhrSFNraVBMTmNsS2RaMG1rY0JLenNtNGJIVG93a1NaUlVh?=
 =?utf-8?B?dmZSU3dVN3haOFNJbDc5OEE1NGIrQkQrdFRzUTB2MEtEb1FCY0dLaWJNNlYy?=
 =?utf-8?B?VlVNdjJRekYrUDRlZVFzRGlxSTZSUVFmdEUzME8wUVpOVkVvL2dsajdua0lJ?=
 =?utf-8?B?TWV0d2hIRFNyMGJMTHZzenpZNDdEVUxsVTVkaUJESk9wNHh6Um1OaTdKRm9U?=
 =?utf-8?B?OGVvZzkvUlJkbHRVNkh4Z2kyWEh1UkE1elBCTkh3NkE1VkMrb3gxWG9LcEJi?=
 =?utf-8?B?a09zVUVxTnhMRDlnMW0yTTNveTZ5dlpyWjgwSkRNd0IzODdPcndwaGxNbzNK?=
 =?utf-8?B?c0ZwUkh6NDRoYVJTcmVoV3FTakcrTk9rVmVrTGJhb2hmQ2ViMVZhMFM3Tzhj?=
 =?utf-8?B?UGhvamlsWkZzN3VDWjVHeTkvRXFNb2Nva3M2YUVWVmNNdGN0L1Y2OTRkY3RH?=
 =?utf-8?B?RTBKRUQ4M0FiSFd2aXo3Q0VpVU11VlBwVUF4NUFSVXJwRldyL0VNTkNyWE5r?=
 =?utf-8?B?SHo2MWt2NDRPYm1wMUg2bHk5bGZUOTFjbXFXeVBrZVo4VDBiTmROY3M4MWZD?=
 =?utf-8?B?SWEvMVlXSkg5QjZyTk1MUm5lVXJ2THcrdXR5dkVyYzJGRG5qZkd6UnUrbnhy?=
 =?utf-8?B?R1hYajQwbENoM2ZSY2FLM1dlTUR5SGEya2l4L3lhSDVSSjF1SE82YWxua1ZW?=
 =?utf-8?B?NkVLZjVNeVpMNE1qYkpUaERtbDFHdlNXWkRmbmkvU3MxdjBXTlhiVHpmT0xz?=
 =?utf-8?B?U2ZiQ3FaZStHVE15cFVOS1BnaTVQNWgvWS8yMGxJeVVWUXRLaVVkQU1OWXRP?=
 =?utf-8?B?QnVUeEVWWkh6V24zNzA0NHJybEhiUnY4TFVQYXI2M3dZa20vMi9LTmd1NFlO?=
 =?utf-8?B?b0xCS3U5dzhxb2QvSjRoRzBQS3ROT2VteFQ1UWwrUVJ2SXJQSTlKNis3Qk0w?=
 =?utf-8?B?alhnSU1mcTZjMGhndVRJVE9OR0dRVnNWTk1BbWRrdmV0WStpS2VYSVVIcWZL?=
 =?utf-8?B?SU51SWRBdHJKZFZ2YnFIQUN4VWFRY2VqUGtESWVhYXNsa3BrYUJHSTlsZTNQ?=
 =?utf-8?B?VS91MUN1aUprSDU1UUFaK01LRUdtdFBXNW9nRWtpOWloVXJrMjN5am4wVVM5?=
 =?utf-8?B?NTdXQVgyQzE3d0pDOG1VaHNHVHNXbzBxMVNQQlZLQ2cyVVk5cVp6djkwV3Bn?=
 =?utf-8?B?QlYrSzdyWFRoOStkKzAxNitBSmlZVFJHVkxEUlBvSklzdzlKK2lDK1NnT0tp?=
 =?utf-8?B?RlkrZzZkYm5WWGt1dG5OcVNxRzA1QStXaGF1MUV0WXVUclZGZlhsaVJubWEy?=
 =?utf-8?B?TzI0TmxOaDVMTFVpcmkvWUw5OVNtR2xIcVUxQWJVZ1cvV1ZIVFpLOUQ5d2sz?=
 =?utf-8?B?RG1RaklZbE5pdkwxc2dpTm9zY0g0YTlpUDVQK3VSNnVyWGowdUhwOUZ0UkJh?=
 =?utf-8?B?RmZiNE1ESVdLMU5iSG1IQnlSVGxlWDdEQkhCc1lBRlZkTmFIRkFTT2hxcUFy?=
 =?utf-8?B?Ry8yREpYUTdHbElXdU9jNkVzNXZEZ0cvMExHajNkbS9NZHpZRHZxa0dRTy9N?=
 =?utf-8?B?SS93ZkFuS3FGN2hoMEhRZHYxNzc1aktaTDlvVjdVZzhyTnNLNjNPV2hhS0dQ?=
 =?utf-8?B?UU90VzZyUk8zNUcwbTB1QUE2d09iVitDWkZROVJndDJtaGdNZVBjU2Zjd1Bk?=
 =?utf-8?B?MkVIY0o2emNNRmdmMlNqYjJFSXJiQzU0WnpDT2hGaWZ3czN5d2QyaFlOdnZM?=
 =?utf-8?B?RmhDSUFSelJLOVVkcjF6d3B3MmNSOHZqNDNYeVZnSGRHc3RJUmFPUkxqRzFJ?=
 =?utf-8?B?WGF2OVl3OGpocnRIZUw2Zlc3RGpkaWV3QmpRTGRwUWlmRjN0Wm9WbFVCTUZh?=
 =?utf-8?Q?7ltfDAhdbICuO/7W0V0ibU2uH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F05A14FDFC3ED94789C65BCDFB23D2FD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc72f1a-a9b5-4842-aeb8-08dd75a50987
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 07:23:04.6115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQjAkYHr/c9hC/Go0fTAWKXZElnhaA/xThtnwrM6rEZAC+bISnVPBwFVvu5jiLwFz+1bxJEiWkhSxxXwd8zqHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6859

T24gRnJpLCAyMDI1LTAxLTEwIGF0IDEwOjQ1ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAwOS8wMS8yNSAxNDozNSwga3lyaWUud3Ug
aGEgc2NyaXR0bzoNCj4gPiAxLiBkaWZmZXJlbnQgSUMgaGFzIGRpZmZlcmVudCBodyBjb3JlOw0K
PiA+IDIuIHVzZSBhIHBhcmFtZXRlciB0byBzZXQganBlZyBodyBjb3VudC4NCj4gDQo+IEluIE1U
ODE5NSwgZWFjaCBkZWNvZGVyIGNvcmUgaGFzIGl0cyBvd24gZGV2aWNldHJlZSBub2RlLCBzbyB5
b3UgY2FuDQo+IGNvdW50DQo+IGhvdyBtYW55IGNvcmVzIGFyZSBhY3R1YWxseSBwcmVzZW50IGFu
ZCByZWdpc3RlcmVkLg0KPiANCj4gUGxlYXNlIGRvIHRoZSBzYW1lIHdpdGggTVQ4MTk2LCBhbmQg
cmVwbGFjZSBNVEtfSlBFR3tFTkMsREVDfV9IV19NQVgNCj4gd2l0aCBhDQo+IHZhcmlhYmxlIHRo
YXQgc3RvcmVzIHRoZSBudW1iZXIgb2YgY29yZXMsIGNvdW50ZWQgYXQgcHJvYmUgdGltZS4NCj4g
DQo+IFJlZ2FyZHMsDQo+IEFuZ2Vsbw0KDQpEZWFyIEFuZ2VsbywNCg0KSSB3aWxsIGZpeCBpdCBp
biB0aGUgY29taW5nIHZlcnNpb24uDQoNClRoYW5rcy4NCg0KUmVnYXJkcywNCkt5cmllLg0KPiAN
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBreXJpZS53dSA8a3lyaWUud3VAbWVkaWF0ZWsuY29t
Pg0KPiA+IC0tLQ0KPiA+ICAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29y
ZS5jICAgIHwgMjgNCj4gPiArKysrKysrKysrKysrKystLS0tDQo+ID4gICAuLi4vcGxhdGZvcm0v
bWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmggICAgfCAgMiArKw0KPiA+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29y
ZS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdf
Y29yZS5jDQo+ID4gaW5kZXggNzdiM2JkNmM0ZDNmLi40ZGM2ZjgyZDc0ZmEgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBl
Z19jb3JlLmMNCj4gPiBAQCAtMTQ2OCw3ICsxNDY4LDcgQEAgc3RhdGljIGludCBtdGtfanBlZ2Vu
Y19nZXRfaHcoc3RydWN0DQo+ID4gbXRrX2pwZWdfY3R4ICpjdHgpDQo+ID4gICAgICAgaW50IGk7
DQo+ID4gDQo+ID4gICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmpwZWctPmh3X2xvY2ssIGZsYWdz
KTsNCj4gPiAtICAgICBmb3IgKGkgPSAwOyBpIDwgTVRLX0pQRUdFTkNfSFdfTUFYOyBpKyspIHsN
Cj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwganBlZy0+dmFyaWFudC0+bWF4X2h3X2NvdW50OyBp
KyspIHsNCj4gPiAgICAgICAgICAgICAgIGNvbXBfanBlZyA9IGpwZWctPmVuY19od19kZXZbaV07
DQo+ID4gICAgICAgICAgICAgICBpZiAoY29tcF9qcGVnLT5od19zdGF0ZSA9PSBNVEtfSlBFR19I
V19JRExFKSB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGh3X2lkID0gaTsNCj4gPiBAQCAt
MTUxNSw3ICsxNTE1LDcgQEAgc3RhdGljIGludCBtdGtfanBlZ2RlY19nZXRfaHcoc3RydWN0DQo+
ID4gbXRrX2pwZWdfY3R4ICpjdHgpDQo+ID4gICAgICAgaW50IGk7DQo+ID4gDQo+ID4gICAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJmpwZWctPmh3X2xvY2ssIGZsYWdzKTsNCj4gPiAtICAgICBmb3Ig
KGkgPSAwOyBpIDwgTVRLX0pQRUdERUNfSFdfTUFYOyBpKyspIHsNCj4gPiArICAgICBmb3IgKGkg
PSAwOyBpIDwganBlZy0+dmFyaWFudC0+bWF4X2h3X2NvdW50OyBpKyspIHsNCj4gPiAgICAgICAg
ICAgICAgIGNvbXBfanBlZyA9IGpwZWctPmRlY19od19kZXZbaV07DQo+ID4gICAgICAgICAgICAg
ICBpZiAoY29tcF9qcGVnLT5od19zdGF0ZSA9PSBNVEtfSlBFR19IV19JRExFKSB7DQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgIGh3X2lkID0gaTsNCj4gPiBAQCAtMTU5OCw3ICsxNTk4LDcgQEAg
c3RhdGljIHZvaWQgbXRrX2pwZWdlbmNfd29ya2VyKHN0cnVjdA0KPiA+IHdvcmtfc3RydWN0ICp3
b3JrKQ0KPiA+ICAgICAgICAgICAgICAganBlZ193b3JrKTsNCj4gPiAgICAgICBzdHJ1Y3QgbXRr
X2pwZWdfZGV2ICpqcGVnID0gY3R4LT5qcGVnOw0KPiA+IA0KPiA+IC0gICAgIGZvciAoaSA9IDA7
IGkgPCBNVEtfSlBFR0VOQ19IV19NQVg7IGkrKykNCj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwg
anBlZy0+dmFyaWFudC0+bWF4X2h3X2NvdW50OyBpKyspDQo+ID4gICAgICAgICAgICAgICBjb21w
X2pwZWdbaV0gPSBqcGVnLT5lbmNfaHdfZGV2W2ldOw0KPiA+ICAgICAgIGkgPSAwOw0KPiA+IA0K
PiA+IEBAIC0xNjk2LDcgKzE2OTYsNyBAQCBzdGF0aWMgdm9pZCBtdGtfanBlZ2RlY193b3JrZXIo
c3RydWN0DQo+ID4gd29ya19zdHJ1Y3QgKndvcmspDQo+ID4gICAgICAgc3RydWN0IG10a19qcGVn
X2ZiIGZiOw0KPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gDQo+ID4gLSAgICAg
Zm9yIChpID0gMDsgaSA8IE1US19KUEVHREVDX0hXX01BWDsgaSsrKQ0KPiA+ICsgICAgIGZvciAo
aSA9IDA7IGkgPCBqcGVnLT52YXJpYW50LT5tYXhfaHdfY291bnQ7IGkrKykNCj4gPiAgICAgICAg
ICAgICAgIGNvbXBfanBlZ1tpXSA9IGpwZWctPmRlY19od19kZXZbaV07DQo+ID4gICAgICAgaSA9
IDA7DQo+ID4gDQo+ID4gQEAgLTE5MjUsNiArMTkyNSw3IEBAIHN0YXRpYyBzdHJ1Y3QgbXRrX2pw
ZWdfdmFyaWFudA0KPiA+IG10azgxOTVfanBlZ2VuY19kcnZkYXRhID0gew0KPiA+ICAgICAgIC5v
dXRfcV9kZWZhdWx0X2ZvdXJjYyA9IFY0TDJfUElYX0ZNVF9ZVVlWLA0KPiA+ICAgICAgIC5jYXBf
cV9kZWZhdWx0X2ZvdXJjYyA9IFY0TDJfUElYX0ZNVF9KUEVHLA0KPiA+ICAgICAgIC5tdWx0aV9j
b3JlID0gdHJ1ZSwNCj4gPiArICAgICAubWF4X2h3X2NvdW50ID0gMiwNCj4gPiAgICAgICAuanBl
Z193b3JrZXIgPSBtdGtfanBlZ2VuY193b3JrZXIsDQo+ID4gICB9Ow0KPiA+IA0KPiA+IEBAIC0x
OTM4LDYgKzE5MzksMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfanBlZ192YXJpYW50DQo+
ID4gbXRrODE5NV9qcGVnZGVjX2RydmRhdGEgPSB7DQo+ID4gICAgICAgLm91dF9xX2RlZmF1bHRf
Zm91cmNjID0gVjRMMl9QSVhfRk1UX0pQRUcsDQo+ID4gICAgICAgLmNhcF9xX2RlZmF1bHRfZm91
cmNjID0gVjRMMl9QSVhfRk1UX1lVVjQyME0sDQo+ID4gICAgICAgLm11bHRpX2NvcmUgPSB0cnVl
LA0KPiA+ICsgICAgIC5tYXhfaHdfY291bnQgPSAzLA0KPiA+ICsgICAgIC5qcGVnX3dvcmtlciA9
IG10a19qcGVnZGVjX3dvcmtlciwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX2pwZWdfdmFyaWFudCBtdGs4MTk2X2pwZWdkZWNfZHJ2ZGF0YSA9IHsNCj4gPiAr
ICAgICAuZm9ybWF0cyA9IG10a19qcGVnX2RlY19mb3JtYXRzLA0KPiA+ICsgICAgIC5udW1fZm9y
bWF0cyA9IE1US19KUEVHX0RFQ19OVU1fRk9STUFUUywNCj4gPiArICAgICAucW9wcyA9ICZtdGtf
anBlZ19kZWNfcW9wcywNCj4gPiArICAgICAubTJtX29wcyA9ICZtdGtfanBlZ19tdWx0aWNvcmVf
ZGVjX20ybV9vcHMsDQo+ID4gKyAgICAgLmRldl9uYW1lID0gIm10ay1qcGVnLWRlYyIsDQo+ID4g
KyAgICAgLmlvY3RsX29wcyA9ICZtdGtfanBlZ19kZWNfaW9jdGxfb3BzLA0KPiA+ICsgICAgIC5v
dXRfcV9kZWZhdWx0X2ZvdXJjYyA9IFY0TDJfUElYX0ZNVF9KUEVHLA0KPiA+ICsgICAgIC5jYXBf
cV9kZWZhdWx0X2ZvdXJjYyA9IFY0TDJfUElYX0ZNVF9ZVVY0MjBNLA0KPiA+ICsgICAgIC5tdWx0
aV9jb3JlID0gdHJ1ZSwNCj4gPiArICAgICAubWF4X2h3X2NvdW50ID0gMiwNCj4gPiAgICAgICAu
anBlZ193b3JrZXIgPSBtdGtfanBlZ2RlY193b3JrZXIsDQo+ID4gICB9Ow0KPiA+IA0KPiA+IEBA
IC0xOTU0LDYgKzE5NzAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19qcGVnX3ZhcmlhbnQN
Cj4gPiBtdGs4MTg4X2pwZWdlbmNfZHJ2ZGF0YSA9IHsNCj4gPiAgICAgICAuaW9jdGxfb3BzID0g
Jm10a19qcGVnX2VuY19pb2N0bF9vcHMsDQo+ID4gICAgICAgLm91dF9xX2RlZmF1bHRfZm91cmNj
ID0gVjRMMl9QSVhfRk1UX1lVWVYsDQo+ID4gICAgICAgLmNhcF9xX2RlZmF1bHRfZm91cmNjID0g
VjRMMl9QSVhfRk1UX0pQRUcsDQo+ID4gKyAgICAgLm1heF9od19jb3VudCA9IDEsDQo+ID4gICAg
ICAgLnN1cHBvcnRfMzRiaXQgPSB0cnVlLA0KPiA+ICAgfTsNCj4gPiANCj4gPiBAQCAtMTk3MCw2
ICsxOTg3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfanBlZ192YXJpYW50DQo+ID4gbXRr
ODE4OF9qcGVnZGVjX2RydmRhdGEgPSB7DQo+ID4gICAgICAgLmlvY3RsX29wcyA9ICZtdGtfanBl
Z19kZWNfaW9jdGxfb3BzLA0KPiA+ICAgICAgIC5vdXRfcV9kZWZhdWx0X2ZvdXJjYyA9IFY0TDJf
UElYX0ZNVF9KUEVHLA0KPiA+ICAgICAgIC5jYXBfcV9kZWZhdWx0X2ZvdXJjYyA9IFY0TDJfUElY
X0ZNVF9ZVVY0MjBNLA0KPiA+ICsgICAgIC5tYXhfaHdfY291bnQgPSAxLA0KPiA+ICAgICAgIC5z
dXBwb3J0XzM0Yml0ID0gdHJ1ZSwNCj4gPiAgIH07DQo+ID4gDQo+ID4gQEAgLTIwMDgsNyArMjAy
Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkDQo+ID4gbXRrX2pwZWdfbWF0
Y2hbXSA9IHsNCj4gPiAgICAgICB9LA0KPiA+ICAgICAgIHsNCj4gPiAgICAgICAgICAgICAgIC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Ni1qcGdkZWMiLA0KPiA+IC0gICAgICAgICAgICAg
LmRhdGEgPSAmbXRrODE5NV9qcGVnZGVjX2RydmRhdGEsDQo+ID4gKyAgICAgICAgICAgICAuZGF0
YSA9ICZtdGs4MTk2X2pwZWdkZWNfZHJ2ZGF0YSwNCj4gPiAgICAgICB9LA0KPiA+ICAgICAgIHt9
LA0KPiA+ICAgfTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay9qcGVnL210a19qcGVnX2NvcmUuaA0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
ZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuaA0KPiA+IGluZGV4IGQzYWJhMWU2Y2FlOC4uMzg2
NzI0OTljYTE4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvanBlZy9tdGtfanBlZ19jb3JlLmgNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5oDQo+ID4gQEAgLTc0LDYgKzc0LDcgQEAgZW51
bSBtdGtfanBlZ19jdHhfc3RhdGUgew0KPiA+ICAgICogQG91dF9xX2RlZmF1bHRfZm91cmNjOiAg
IG91dHB1dCBxdWV1ZSBkZWZhdWx0IGZvdXJjYw0KPiA+ICAgICogQGNhcF9xX2RlZmF1bHRfZm91
cmNjOiAgIGNhcHR1cmUgcXVldWUgZGVmYXVsdCBmb3VyY2MNCj4gPiAgICAqIEBtdWx0aV9jb3Jl
OiAgICAgICAgICAgICBtYXJrIGpwZWcgaHcgaXMgbXVsdGlfY29yZSBvciBub3QNCj4gPiArICog
QG1heF9od19jb3VudDogICAgICAgICAgICBqcGVnIGh3LWNvcmUgY291bnQNCj4gPiAgICAqIEBq
cGVnX3dvcmtlcjogICAgICAgICAgICBqcGVnIGRlYyBvciBlbmMgd29ya2VyDQo+ID4gICAgKiBA
c3VwcG9ydF8zNGJpdDogIGZsYWcgdG8gY2hlY2sgaWYgc3VwcG9ydCBkbWFfYWRkcmVzcyAzNGJp
dA0KPiA+ICAgICovDQo+ID4gQEAgLTkxLDYgKzkyLDcgQEAgc3RydWN0IG10a19qcGVnX3Zhcmlh
bnQgew0KPiA+ICAgICAgIHUzMiBvdXRfcV9kZWZhdWx0X2ZvdXJjYzsNCj4gPiAgICAgICB1MzIg
Y2FwX3FfZGVmYXVsdF9mb3VyY2M7DQo+ID4gICAgICAgYm9vbCBtdWx0aV9jb3JlOw0KPiA+ICsg
ICAgIHUzMiBtYXhfaHdfY291bnQ7DQo+ID4gICAgICAgdm9pZCAoKmpwZWdfd29ya2VyKShzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKndvcmspOw0KPiA+ICAgICAgIGJvb2wgc3VwcG9ydF8zNGJpdDsNCj4g
PiAgIH07DQo+IA0KPiANCg==

