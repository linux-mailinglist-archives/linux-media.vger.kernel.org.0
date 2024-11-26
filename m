Return-Path: <linux-media+bounces-22058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850C9D90C4
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 04:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AC71B23931
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 03:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AFB8624B;
	Tue, 26 Nov 2024 03:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L3VN/5xF";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="D9RLBt1Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7C3D51C;
	Tue, 26 Nov 2024 03:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732592459; cv=fail; b=Eoy6XpQ/ka935NouyCq0O4SEfCejvq8zkkH8tpxUeatQlc5PHUFrJhHJI4A90hHfCr0rhhBGMKJGcCSOETL9VWukdEJQSRjDHn0vViLy2kzLHY0KpjfD2waZGLS/LbFDFGJHcCw47eGrACB/fyjonjIiTnGlozAH/IXLrudX3T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732592459; c=relaxed/simple;
	bh=Z+m9YmYvHs1YGYKCkxNSW5lDnaASboVBR5mk8ve7ef4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nopPYELKHVD/iBsJFW+baxS6+vir88x37EdGZ4aUEGyPQNA40q8sOvsjSYK9Vy1KhvLvjF2PhRyH8ssz1G2TzRrSzdhmZbWImbe1t/NjJcGb6zDDdEalnNQ057ojDT+rDDHXorc/ZSBeg8t65r4gbFh8tfv3NM7jIPNR3qa5+hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=L3VN/5xF; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=D9RLBt1Z; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3b58b7f6aba811efbd192953cf12861f-20241126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Z+m9YmYvHs1YGYKCkxNSW5lDnaASboVBR5mk8ve7ef4=;
	b=L3VN/5xFK01KB1Fj0YV5S2JLSW5W5CMG3ITBy8HEDXCLSy7vYczuPdMSlNqUMN+dPA3PbrL7joHgffeP3IyOxgdo0weIBIJ6DnbLsURA3wKnPzyxNe4fxxgW2n8LcO/J4RZBa16ICvi5kUsEAIqTY5JJVICQsxjvcxvDQFv0KX4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:1430b119-ccf5-4cd7-8b9e-c41d2ad56bb9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:d6ac46e0-1fe5-4c4a-bdf3-d07f9790da32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3b58b7f6aba811efbd192953cf12861f-20241126
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 411663730; Tue, 26 Nov 2024 11:40:51 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Nov 2024 11:40:49 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Nov 2024 11:40:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9r70XN+frmEmRfogKyI/gHfkCouaPmPJWSK1MH2QhunazkYzIVqGdG1JBvISV7K3vRMKdEBawjasYIquHy5rbHVzrJDQ7c/5ISwXPSi5zLnnj/LF3ntwUCa4ybh7i4+UXRRjAPqHpisSPwTZ8UmxDkSCN/J9mfcLy/fh1cMpHuQFTgzXe6iea+zwJWZ+L2sSOU3iC0UpwABS90yKFXYKGSWaGTGpeF4iHvglDO1MnkFQWUKKiI9Zuv8m0XBgyiGxzz5PVctanjHvBCh43MrodxreI15ah3L93fpZ5AyAHjSMxQOuP/I6+xd14CP07u9xdo0GEVovx+4EKnzx36qKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+m9YmYvHs1YGYKCkxNSW5lDnaASboVBR5mk8ve7ef4=;
 b=ZsHjis9uE0zCzBqVn1dRvVYLqHTDo7L/Im2bY7rNtd9J+Um2aEYpmpsAq360p0zHKmkmmiMctmF2Jz3/beJ/z4Ugn/WU6vItj4t+DfZsYkQbsMLPH7j9ITDEFALU0QldjqQo208Z6iKyglcubqJxqH7On2LIJMkj3rsX0yydrzGQ1VvCxyMQUXTkwtm9qtjYJjzY+abZAf/KGDpbh4U74el7TABK7ru+eG7Ex72x36tu+n3db6CfKNbpTpW2P3yzuyadZ1j7UG6ceRfQyPIKJwVscqZ3jGIJG/Fjt/PYHOnUvONMcYesKdmcwFvqheqhAyrHMEbKvmqL3VtolXIHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+m9YmYvHs1YGYKCkxNSW5lDnaASboVBR5mk8ve7ef4=;
 b=D9RLBt1ZXwnvCBwh+DOZPR8f2OEX2Hdw/YCr9KsOT//AvoGWzwx7BP1vedx2DdKtNVEnISSJ782i4aTDc+8YUXorGaCsqnaod8p1IN9ywrArONhXe7KlolGZGgy2FgfCfYML+StiMvRpbGnHEpQKnhUQins9TRXu5F/G7YWkFI0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7452.apcprd03.prod.outlook.com (2603:1096:400:430::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 03:40:45 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 03:40:45 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	Julien Stephan <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLI8goA
Date: Tue, 26 Nov 2024 03:40:45 +0000
Message-ID: <90e5a0185cf893fd486f32d790bab2123885db9a.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
In-Reply-To: <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7452:EE_
x-ms-office365-filtering-correlation-id: 4c1df739-37ae-40f3-e631-08dd0dcc1c08
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UjBQekxjRlRwaGY0Ukd6aWVhekRvc3h4dWR5ZkU0amlpR3EzQ0NzWVgwNWZ6?=
 =?utf-8?B?VnJwQ05lUHM5cFU1eEo4V3Z5aWcyVlI4N1Fyd0grS1RJdjFXVFZXdDR3K1Fi?=
 =?utf-8?B?Zmo0OVI0UE9WaXdpa2dibTA1OGRrYzV2WW5EL2NCZkR3ZFFwaGdDUCtxWTJu?=
 =?utf-8?B?NGErWVBNM1N4UXBzMWdkUXUvVGRXMmc0dWZJZzlBYkdsWkVENjBYaFBMU0U3?=
 =?utf-8?B?WS96WGNtSW1nYk4yblBnbXNYOUMvWklvR05hU0Y0MWpEbzEzYXZNbHQ0eDg5?=
 =?utf-8?B?T2Q1YlRkU3BEc1A3QzN5Y2dkbUw1a3NidmdQbHNWQTVCYUxqS2pybjBZcmZR?=
 =?utf-8?B?K3M3MjF6MEl3Tzg1Z3diNk1NdWdIUEFTc2Y0Qm5YeUtqMDlFbWYxaDc0MlU5?=
 =?utf-8?B?c2RuR2hEK25LYW8rNU9HK2hhOGdHSC93QXRFOFRWR3lHYkRoMjRXQVhTSW5N?=
 =?utf-8?B?bWEyNUxWcjFYUXZHQTZ0MGRGbWx4bWtmaEZoOTlQY28xaFFsZC9WN1JBd3pz?=
 =?utf-8?B?MCtRVVlmdm5Zc2kydGY4ZWp4cG9VM01HMHN0YlppbTF5S2tNWnFDQUx1OEIy?=
 =?utf-8?B?OHg5MG1tUTRXQ29CR3ROWCtkbmJaSjdqeE43ZHZGUEswNUtMYk95Rk1Tdnl5?=
 =?utf-8?B?UTNnRUF1U3dkL0ZjWUw1Y2VMM3ZiaW9ncTNSZ0dYVjNQSFR4bDNrMjZRR0hj?=
 =?utf-8?B?dVBycFZ1ZjkwSDFyaWtiTEZ1YXZMREpRR0YrSUVRL2RGWlQ4MHpxMVBTQjRD?=
 =?utf-8?B?MUtxZWxQalhOekhRU2dCWTQwQ3I3NTVEa2pZSGlUMHRKU3prZldsTTlnTzYw?=
 =?utf-8?B?eDdSeGxqUU5LVDVGaFdkOURNWi9KbjlocVBaUHUxdVNWVGpuR0FoTjhHaG1h?=
 =?utf-8?B?UGNDUXE1VEJsYXJHWGI0UDM3WXlzRVZtVzI0L2JDR1hVM2F3dFAzaWxIeGg4?=
 =?utf-8?B?blZuMzdOSCtFUUtKbzh1YXZVdzNlQVAwRFpiZ0FYWlIvOVVGSW84YS8xRGV1?=
 =?utf-8?B?MmxPSVJQWE15K1JPTnF5dlExUzdoVkRtdkE5Vkk1UHhiK3BsNVduMlRVWVZW?=
 =?utf-8?B?MXFXWng5blhwTlFOUUhxbDdyNHJEZWFkdUZoUiszemVlR2cvVkF0Z2hGSHhY?=
 =?utf-8?B?VTJjbWg3eVE5blFRU0sxdW43VUlrd0FMVXdvWHlzZDBVZXdPa0F6WG9rV3RI?=
 =?utf-8?B?VWozbDFiQWd3MjNKTG1kSEJKR3ZqUGd0MUlTUVpNWWFIcnNEazBZaWg5RDJO?=
 =?utf-8?B?am1ERG85UEpyMnNuQVZLR3I0RzNMMnpxMnhxd1RKcDd6TnFieFRHeENSdWx6?=
 =?utf-8?B?WGZzTUk2NzZibWIvdHdPVXV5OUN0M3B5YURPQ3V3cXpsMnFtRUNsZ2FlM0pW?=
 =?utf-8?B?RmJWWFdqdzgwdmMwVG9xWmkvOWhpTmhaOTR1a05iUGU0M1pWUVRrbW9CcWI0?=
 =?utf-8?B?T3ZZYlJMUHMyWVJSd1ZNTTE4NC9HWXVZWnlsVEVQY2RDL3g5bWdtUGIwdnMv?=
 =?utf-8?B?cCsrQmlKaWd5Nm5xcVdNb1B4a1Q3K2xLaEpQc0o0VzJJN0hxemsvRC9Zem42?=
 =?utf-8?B?c3RuaXdjZHlaK3JMTDY5eTNmZ2hMTFlnTmpiQ05welk1MzZoYTF5eDJqaTZs?=
 =?utf-8?B?dEJOMUxWUVQ2V2lGSmU3U2hoNnBQQnl1VHJ6Z1g4YjlyaVlPMFNrUXJhSnlG?=
 =?utf-8?B?dndEQmJtbWNndmFIRVJXL2pnRTJlSWpZYWM2dUdDak1lTUJYV2dnZTFsbDNL?=
 =?utf-8?B?Y2Y2bFN1WXhDZ3l2amlocFhOTm9mVGxKZXBaWmxpd29tZGhISW9BSHlLbnUw?=
 =?utf-8?B?U0VMRDBqRi9SaG12QTNaVE5tQ2N2anh5NklvNmt2ZGY0QUZkR2dUMkZKSUl2?=
 =?utf-8?B?bDhNVHgrSDhuTVpzU0FTdHJiaHE4aXdIT0VZL0xXZTNJNHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXdBbmtPQkYyOVl5WWRlZGxTUi8rUE15OUxQekhibjg0UmxlYXhldjNtV0Ji?=
 =?utf-8?B?VUlEUWxRUXJWOVppbjNHTTMzVm5GWjVESTRuNnV5S3VGaVVqQnFqMkZ1L0Yw?=
 =?utf-8?B?ZWFzQnZlRnFCNkVwUGR5d2VLbnVkRFJhL1c2WENMSHg0aDhlc2YrU1pFS1RW?=
 =?utf-8?B?YzlYRkZVNzRFUXlqS1ZTby9nODZ5MjdnR0R2bzhKbXIrVTRGaE5MT1ROemg4?=
 =?utf-8?B?WTRhQTdsWUpraTk5aVY1SkdRR3N2QTk0akp0cGtKeDZlT3RvQnhXMjZ2c0sz?=
 =?utf-8?B?a3ZlUlpKY1ArMEpEenkwaVVpZjBMaVZvU2NjM1gxN3ZneTBSL2JpSzF2MnIw?=
 =?utf-8?B?amxkM1VaNXRtRG55TmhCamRHcnhUaVNxTVBKNi9wMjRjcWFVOGJjQ1N4aFVB?=
 =?utf-8?B?QWVSOHlnM0VkYUpTc3ZhNk96eUlGMjJycnR3a21XMEZpNENrRUJlVHJWWDFV?=
 =?utf-8?B?Qm80VHR0by9kaG9LVlFOaXBIa0llRFVWMy93MDNIT0RkanBTSTZmciswZm5Z?=
 =?utf-8?B?VCtGaTRNVVBydVpkS0d0NThSbnppRjBNejUwMVlYY2RBeEJQNWd5QzZBTXYr?=
 =?utf-8?B?N3NOdnFjaWJJQkp6ZHZnTVBJS0grMTY4enJoamNYZ090VEpVZTQreXZoSWc5?=
 =?utf-8?B?cmtTaktqaWxiY0NidnY2eEhZUjVZL0Q0U2FPUVBBQnJYOG51Y08zdVpDaHAw?=
 =?utf-8?B?ZWVnRTNYTFprdEswdm1YT09obzNjMnBTdXhtUFZ3dFFOVklTUDZFZllpbXNX?=
 =?utf-8?B?aCtkd0pWR1lNcUZjVzhmenEzcUljK3lSclY5d0RIb290VXowTFgzdjZjWkRs?=
 =?utf-8?B?ZTZyWUVkdzZWQUxJMjdqTGtUVXE2UW1tNmZ1MmtEeEdBMCs0MkN4SG4rZ1Jr?=
 =?utf-8?B?UTUxTmsyUkJuaUtVSFJZNkZjV2hEbEZncUtrWGphU3c3dmNocFg0a2xNdm5D?=
 =?utf-8?B?ZS9IL0Rqc1lTeXpTblkxckExREVhTm1EbVowUFlCWktUSkJJWUgxQm1MMzBL?=
 =?utf-8?B?Wm1IY1RJWGF1WmlRaDJacFl6YWo1U3ZOLzVtZnorWitGMkQxSXdGWSs1aC9x?=
 =?utf-8?B?VXJnSXg3OEI4c0lYQjhPNm5vTnZ5Nkc3aE1SbStyMHEwVHpaY2JzUDJZQWp3?=
 =?utf-8?B?eThHcFcwdFJ2VzUyWjQxd01DbldMVWt6QTFJWldidEZPL3JjdnVweUVXcHY1?=
 =?utf-8?B?aXdRODRwTEhRNnArUjVmTzIzbmtuM09mcXZCTVlQRjdjYmxqYU10UUl6OXNM?=
 =?utf-8?B?VmFTWXpqYlptMmdSUnVUblNvOGpUYitzczcxeXhQQWNvMkI4ZlNsKzlOTGcr?=
 =?utf-8?B?bVl0VHl1WEhjczJ6Q1N0TWFFWEl3Nm90NnNBRWN0MUw4T1dxNHZORkpvazRS?=
 =?utf-8?B?ZDVlVDB1bkZVRVJuZjdROG1OK3hRS1llQnhrWk1sb1FhTE1oODhWYTBwaWI1?=
 =?utf-8?B?VWRsYVF4ZG9MVEV2aDgxNXVXZEttaTlIelo5bGJ0TEFvbzF3TnFDR0JJeUxW?=
 =?utf-8?B?TkRvbGNCMkhOTVdkaitlWm9CMk1hZ2orcmE4MTFPUXJCaVdLVmtpWUd0eG5n?=
 =?utf-8?B?c0RqWURKR3cycFl4bSs2WnFKOERObGtaaTk2T1lpeXBlMEpCYi9GVXNabHJk?=
 =?utf-8?B?K0xHRFJiL1RmK2FpOFU4aUxzcEtoVDVnQkhmeWZscjVPYUFpYS9PQTFHSHVi?=
 =?utf-8?B?TkxQeDZZWkh5c0c0b3VNMXFlMElpMEhjZ3pKb3dEeHoyZjZYWnR6Q3F3V2Fv?=
 =?utf-8?B?cVZnaWpvR0ZqTDRFTmQ2OURuUE9ZZDU5OVMyOFg2eU1nVDIyaGRKZVVTakx6?=
 =?utf-8?B?Q09WUGZ1YUo4RnJyUnFrL3RnU3BEMzA0ZDBXUFUyR2Z4bXBzaUVnOWkxQjh6?=
 =?utf-8?B?WFlHVXJYVTQ3SXhZVDZ5aWdVQnpISXFoY3h6MWJEV3VtZ1B4NmpHSUh6dGRM?=
 =?utf-8?B?YUlzZlFId3ZZVWJpcXdERHBTTFdYSmNlMVU2aFVvOEhuNkNuYTcvM1A3V0pL?=
 =?utf-8?B?OXBKZXJ1TGpuOVpFaUNvNitCcjdQa0d4MU9HRzZLWXozT0lHaFA2T0wzQnZR?=
 =?utf-8?B?MzRNWkZrUklGam1YZWw0b05JVkVhNVY5VkRuZkFRTWprYjQwTGU1MFA4Zjd4?=
 =?utf-8?B?QW80RHFCQ3cxTG4rMkRNby9hYmxlUmpQb2s5bDNIeTM3YmxaMVRHbVBrOXZU?=
 =?utf-8?B?OFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B5F2A70F28205E4697B9B04F099246D6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1df739-37ae-40f3-e631-08dd0dcc1c08
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 03:40:45.1250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mraVafVuVwMgvHNkOJ6TuaHZumfl6+lZIpNd0tc4XbzZ4S2bGrihV1uog5IsIDb4DkC0IOBg9LXxbCOK90cc2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7452

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTExLTIxIGF0IDA5OjUzICswMTAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
ZW5AYmF5bGlicmUuY29tPg0KPiANCj4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5
cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gY29taW5nIGZyb20gdGhlIFNF
TklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4gcHJv
Y2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1AuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+
DQo+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBF
bGRlciA8cGF1bC5lbGRlckBpZGVhc29uYm9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9pc3Av
S2NvbmZpZyAgICAgICAgfCAgMTggKw0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRl
ay9pc3AvTWFrZWZpbGUgICAgICAgfCAgIDUgKw0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
ZWRpYXRlay9pc3AvbXRrX2NhbXN2LmMgICAgfCAyNzUgKysrKysrKysNCg0KSXQncyBlYXN5IGZv
ciB1cyB0byB0aGluayB0aGUgbmFtZSAnbXRrX2NhbXN2LmMnIGlzIHRoZSBlbnRyeSBjb2RlIChw
cm9iZSBmdW5jdGlvbikgb2YgdGhpcyBkcml2ZXIuDQpJdCdzIG5vdCBlbnRyeSBjb2RlIGFuZCBo
YXMgb25seSB2NGwyIHJlbGF0ZWQgY29kZSBpbiBpdC4NCk1heWJlIG5lZWQgc29tZSBzdWZmaXgg
b3IgbWVyZ2UgdGhpcyBmaWxlIHdpdGggbXRrX2NhbXN2X3ZpZGVvLmMuDQoNClJlZ2FyZHMsDQpD
Sw0KDQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2lzcC9tdGtfY2Ftc3YuaCAg
ICB8IDE3MCArKysrKw0KPiAgLi4uL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2lzcC9tdGtfY2Ft
c3YzMF9ody5jICAgfCA1MzkgKysrKysrKysrKysrKysrKw0KPiAgLi4uL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL2lzcC9tdGtfY2Ftc3ZfdmlkZW8uYyAgfCA3MDEgKysrKysrKysrKysrKysrKysr
KysrDQo+ICA2IGZpbGVzIGNoYW5nZWQsIDE3MDggaW5zZXJ0aW9ucygrKQ0KPiANCg0KDQo=

