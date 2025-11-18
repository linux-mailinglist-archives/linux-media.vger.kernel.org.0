Return-Path: <linux-media+bounces-47246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 884E1C67F7B
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 08:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8DDF2381122
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 07:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BB93019C3;
	Tue, 18 Nov 2025 07:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IJsaXDKg";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="IUmvEd8y"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980733009F2;
	Tue, 18 Nov 2025 07:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450549; cv=fail; b=qDR3aZcrh67tNgjY9c5+fbHP2yV3AOUjBBBp7WZFXZB9Sk4Zb+YOAFgm2AyiErHy2HT0foURp9SYYf7E58REH4NRe92Rw4g9fzHobDXt8m4KNtWyRpm3WxkDWsbQpSO0HGCq7nC2DzWKWEXtzzc3ACKIPFQt4B0PSwxe9eWdjkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450549; c=relaxed/simple;
	bh=yaxmMLrXe4UpYYSZhfTUkOGF4bRGPDB6l40FJHwPVJg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tfN9lUB8VfSgbhi9xa4VBBMi4iYbB2NTBMgKLJXUWzdOkoySH+U7jycHQqxY2L3UxFrm6KGq7MRjoTXM0QywsQoTKiIHm74Swqf5mbwxpaaxX9ZtpneZwGgbbtqGCYicJakCiQ/5ah1Cb0ltkVWci/Yhn7sWCX8S4o1DNmZb9Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IJsaXDKg; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=IUmvEd8y; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4f949436c44f11f0b33aeb1e7f16c2b6-20251118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=yaxmMLrXe4UpYYSZhfTUkOGF4bRGPDB6l40FJHwPVJg=;
	b=IJsaXDKgfKnDWUl5UAahv4v8FBX+aPfMLW3yfrDr4+gfZ2qLuYOMdL3jiHHehe5GvN9GtPO+roFVQzuqNpqoP5oySKgnUzetT8vDFffMV0dGdPIW5b8pt+f3aD3rhZ48sFeVP/azg0ouac8C8EZwJRfhAGeE6kQUNxoJYPVcQII=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:bd333673-761d-4575-8f62-daad4f417ed0,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:a81bc582-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4f949436c44f11f0b33aeb1e7f16c2b6-20251118
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 363306411; Tue, 18 Nov 2025 15:22:16 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 18 Nov 2025 15:22:14 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 18 Nov 2025 15:22:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG7w5Xodf8QS/+MondFnc83Gmkgmq6gQvuQOFXb0wB5qk2jIC4b67ufbpQr3Hn7KDmP5CVj7sCJel+uv8s5kXfLKhQsiwFM/oT6wFTHAGGMUfQ6sd7toIuwcYDoR3AlpYGuBT3T89kde6aaPwHO9RRrpGydm1vLJ9RmHE3zZCE094EqAy++JRnWx0omV3OpM6cRk3t2fdyjmyuvDOnMbp5XmiF0++EDp3lEoBNNO4YV6oFw4K5B/R2lMLePY9Dc7osVYZdXAJhkwTK4Xg+8tOZ839FeXnWvHLAjGNFm/IcJb4CuoqJLRensb61LLCiVgf6XL/eDpdNJAYbwU0o9JtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaxmMLrXe4UpYYSZhfTUkOGF4bRGPDB6l40FJHwPVJg=;
 b=y4+stMa5UEL2Gvdz4maNCcYXldF5CFoDfL3tcsnw8TQxp+7S6GJHUKxVc8INIEY07LB+5TNOKpMmSSbr+7SxLUBV+yArm5Y/PDZjdEtzrosU47rC7zIX7dIrlQawO1ADAd3q3cMKgvwDCkQRLLMoOf6i1XUIKWlHHN9ByS8vgex214BurVLzbsiYkLbBVY+ggTKtA1RJucqFG2u82FUX9uwFX8d/0eKKqaPxhKpX2p8MBgLYR2OF21XdIh4TfNaoPK+kSv054Xk/ztgwDAAG3YkGkTvwlbtIC52pMVpLbFFKUp3meQKdl8rnbXLQPfkKpENVkNpnit1nnr77/Rko6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaxmMLrXe4UpYYSZhfTUkOGF4bRGPDB6l40FJHwPVJg=;
 b=IUmvEd8yKCq1CxrBWGr7s/9C/aXYomkFmsHTuU2nbv8VDhuJqoSk1vwcllFOyhZvo1dSLZY+gxCaRWsY/f4C0yZPNKDZLZWvwPLnNM0rqMdc8IDO7VxvIaVeFNSOYTvXipDeEDKgXGiOZ1AXopQgxWFckWrbwRyLKKhW27k3eDw=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYQPR03MB9432.apcprd03.prod.outlook.com (2603:1096:405:2ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Tue, 18 Nov
 2025 07:22:09 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9320.018; Tue, 18 Nov 2025
 07:22:09 +0000
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
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/8] media: mediatek: vcodec: add decoder compatible to
 support MT8189
Thread-Topic: [PATCH v5 2/8] media: mediatek: vcodec: add decoder compatible
 to support MT8189
Thread-Index: AQHcTuSklIk//JfNJkCBwdHYebyIArTls6IAgBJmrQA=
Date: Tue, 18 Nov 2025 07:22:09 +0000
Message-ID: <e2558247735964e2c50a8535017805353b4b8a58.camel@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <20251106061323.2193-3-kyrie.wu@mediatek.com>
	 <49d55e669473bef7b08882916095f10f409c85a0.camel@collabora.com>
In-Reply-To: <49d55e669473bef7b08882916095f10f409c85a0.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYQPR03MB9432:EE_
x-ms-office365-filtering-correlation-id: b7cda15e-6990-4065-04fc-08de26732f8a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?YmJ5VEJJeG5hOVVXL3lrQWZBWC94LzlvSlpLY08reDU4VGlOa2NBVExiRXcv?=
 =?utf-8?B?VlhTc0hxem40Szg2alNvMEd3QmJueWx2c0tqQmM1ZEcxKzI5Q0ZnbGg4dEZN?=
 =?utf-8?B?cTVNTCt1OVpOdG9wdThyYlR2SDg2c3Y0NG9NczZVaTdHUUhqY3YzcHltMzM0?=
 =?utf-8?B?bndRNmdCbjY3UWpwWWVJNy92a2p3eE9IVE9acUxvQ202MHJCQVZiQTIwQk1I?=
 =?utf-8?B?VkxGbkszcGJ6TU83ZU93Q254T2hIcW9lQllnTDY4U3NTdjdVSi9hSkg0K0dC?=
 =?utf-8?B?N2IwWHpRa1VYN2xBRE1YRGl4RllCZm9kSnp3b1hkT0o0dStIVDI4RjQrQVo0?=
 =?utf-8?B?YUVmQ2x0U1lLRm5Gb0ZtaDRJelZwTWdmNjJIdWlnSU4zRTFLNk5leHhveHNw?=
 =?utf-8?B?N2ZaMlcrVFZ1RGtLUHlWRWtFWTBvSThwcEIxTGRPdytqeFMzTk91Zm14czFt?=
 =?utf-8?B?MXVPV2ZRK3dma1EybW13cXhvN1Y3L2FhRjI2UjVsRXY0cUpVV2doNW9ZWk9S?=
 =?utf-8?B?d0ZNa25kS3lJeHZhTS9sUDRuanpqYmJJbXdBSWNDR2x1dThsWmp2clhiMjl4?=
 =?utf-8?B?Uytpejh0NjUvdytyeWY4WVJJQTY2K3RkaFRKU3Faa0Z0MEd2TlZraGthLzZ5?=
 =?utf-8?B?SE4wQS8rWUZib2RRKzZ2ZWpidGo1Si9xRENHMEJwZy9SMU5xYkZKN2JiUmk3?=
 =?utf-8?B?SE5waHQ1cHMycVRtNDNlSFhjRWxCZHRpTmE3eHNGMWpnQWR3MkxMNUxrNEJ1?=
 =?utf-8?B?bW5tQ3F2bllQbExIeERDVjhIQmRYTGIwTGU5a0tVK1dzcVFaTHAxaitpVC9h?=
 =?utf-8?B?MkxBV1BtWjNoOVp4Z1BKM3gzUnIxcHRJU2pDMlBqSjFIdlZ0bExEQzQxZ01u?=
 =?utf-8?B?aTh5Um1aZ0lhU0FLM1VlYzA5Z2toSXhjWjk5dVJMSkQwdER2U1Q1aGkrdXdv?=
 =?utf-8?B?QTZvWDJOMW54UG10RWxRUGJpa0ZrWnJsbGR6eW5OZGU0REVHVEJrdzNRdndQ?=
 =?utf-8?B?WXNuM2hwTzRxblg2YXZNamhNNk9qTGZ1aXRsRTFmZm5yMFVrVjdpbGhqMU9V?=
 =?utf-8?B?VjA0Rit0YnR2Z0Fxbk9nY1NacWx3RFExSnZsM0J5OWtlZWNucXU0aSt4djB2?=
 =?utf-8?B?RTZaY3F2RkZtZ1FUSUNRakVralR5K3h1cDlYdTBWckNjVURhUFRRSC9OYURi?=
 =?utf-8?B?R2I0ZmZnRVdTcHdMRVByOHRhSDFYRDFTL1hONXdmbUVXb1NZZDVaZkxDRzBC?=
 =?utf-8?B?WjdmSmkxM1hXTzR5WTlxU0pOMFRIYlNBYWtoQUhGM1M4cHVPQk1BdkpiN2NI?=
 =?utf-8?B?aTVEcjhnYWVWNzVMTjhVR0IyZ0lPVlhNUG9ZcXJocTkzcnJWc0ZDZkZlWGY4?=
 =?utf-8?B?RjRuLzlnM3B2cjBzQ3NZOEhEWmxQT0ZrdlRJMm10dDZIMEpLc3krZ2JWaURT?=
 =?utf-8?B?U2xhdzZhbG8yd0EwYlVhQmZscWpOY1padnpBVjVEdTBqanZJZFpYOEFDN0w0?=
 =?utf-8?B?aHlHcnN3Q1RRcmN4NGt1c3RFMFVwT1UyRGlQMEpHdFlIQUYyblR3cnFLYWdw?=
 =?utf-8?B?ektSVW8rSG9tQ0lBTk9TVGI2c1NuRElTaXduTk5sRVRkaFNzdUo1TEpWbTE5?=
 =?utf-8?B?UFRqdVhqNnBYVzJzZXhwTklaa3NRdlE1bmEzMzhVS05kekRTWXZ2Yi9LTU9q?=
 =?utf-8?B?b050UytQWDdtVEcwSDBSbVcxRUJ5Nml1ZVVKVC9HaFpBdXg1UG1uUHY5QzBm?=
 =?utf-8?B?cjJkT0xmTEJqc0pHYWlYdXlBV01GYkZzMmhXcHhtNWhLZFpMbE1JMXNackFW?=
 =?utf-8?B?REViSENROWlMVzB3eWswRVVZVWttMUNKaCsyNis2eittS2pXVGkvczBuOG81?=
 =?utf-8?B?VWdqSkNNODFjNTkrcHdYOWNrL3lzRm9URjNIemdialV0TGV3K0VLWmhaYldu?=
 =?utf-8?B?blltMGdFTUVzWlQ1VUFkb0YwNldiRW82cDdpb0ozaFNIREJpSzlsNlY4eUJL?=
 =?utf-8?B?VWIzeXRCb0JWWW05NU9aZTBaYzQ5YXgwSFFsUVJHaWxXYnZwYzYvVEYxeDF6?=
 =?utf-8?B?SmdzWURpN0h3UmlTck5xL1FlZEZpWmo5QVVvdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHBQdjV2Yjk2WUNUYTZUcW8wcEY2cmtWMzVicVZYODFmc1FqRVBZN2hGc2Z1?=
 =?utf-8?B?VWFKNjYyMzdxY3ZBR05zMkQ3YWY2cjRoeFQ2VTV6UHA4UnQ3MUJ2ck1KQnpN?=
 =?utf-8?B?U3VSM2l1ODR0N1pBd3l0cmJ5TitnMGs5eHVLQnNrV3MzL0o0bFdoOWZKbi9n?=
 =?utf-8?B?eGt4RHhMZmJ4ZkprNHVodkVBdXMrQkduM3RZbG9Qd0cxYUJneVZBQUo0UG9y?=
 =?utf-8?B?cFB5ZGJkQmszbEZZT3ZCYTlDR0I0cHE5eEd2TktZOG4rZjNXUG5yYzRXTFlx?=
 =?utf-8?B?c01OaWtIQWtuWXAvVlVja0d1UnNnV3g4YjZoa1ZSdENmOGhwTS9kcTk2djZx?=
 =?utf-8?B?d3BKVnllYXZ6SXZLTmtwMzRiSVdaU05CTEVyQ2wwcmpEZWJmd2VNSGNkNXFx?=
 =?utf-8?B?bUMxc2U2aUNLanBnb0w1MXprNmNtMkkxaFJ0RFBEYUo0eERIUmFEYmxZRFBM?=
 =?utf-8?B?Y1hrWjBFR2lqUXhWMHN2QTgwdHllQ0g4SXhCUnZYcytUMW1QVkpONU5mZ3Rm?=
 =?utf-8?B?TlJOUjAwbDZUd2M0Z1pUUHZqR2dXTVp1bDQ4OHkvRFdORkU3R1JzejNQcENI?=
 =?utf-8?B?ZE5oTzExejFGVmxXRzMrSTRYVXBTODR0N0hUdno1TzVwZ2NsRHY2UUJBMHNQ?=
 =?utf-8?B?TEJXWTJsNjM1N0llNUtYVE9aK1Q3WG8yWjFXR2Vwb2xpRllVZzVhWTE4bW45?=
 =?utf-8?B?cEI1RjlMNndPdXlQQnJNZDZDVTNOZzRINUtSWjVPdXRYMUlkakg2VXVDZy82?=
 =?utf-8?B?bHpzNkdzZ1prUXQwTGtpb0FkR21FdUc2QkNWUHFBWms3dVZjSStKODVqVDha?=
 =?utf-8?B?b2t2TE0xOHhuZytLYWtCdi9mRm96MFZuU1hKOXZsaUtkdGtRMkFOdmErT2lY?=
 =?utf-8?B?VmlyZk5tNEpjSzlqbzFBUlNLZ3hQRUpZSFJIclNrQk42a3dZN01qc3NyQW9S?=
 =?utf-8?B?d3JUbWJ6QmVGem5GTUJEYlJiRmIxQXlEcitFYXR3a09SNy9sM2dxeFJuYXVW?=
 =?utf-8?B?L2lscTVxTnJ5NTNDaHhBZHlRSWtLMXVHNXQxV1A1cXVZWW1TVVoxNWZEZEVD?=
 =?utf-8?B?NE41djJ3VWVtVkUxOVViY0Z5MndaNFRvOVFhM2p4cHFqYUg4eTIzcXdsQ1Jl?=
 =?utf-8?B?VDBIV25LUjJTYUhtMHhyOUErY0Uvb0pVcThKSkZPT0hhOFVKZVpEbXdKSXdp?=
 =?utf-8?B?NHE4WTRUYU1uSlBNZEQ3MkRpUk8wbUhBanhTT0tMQTFQZlkwSUhKU3gvYTdT?=
 =?utf-8?B?Y2F0T2lXTGNhSEF0R1k1a1pkQi9lWDRRNHRxM2JyS3YxZi9PK2NkdlN2QUJQ?=
 =?utf-8?B?ZE1pQ25TazZRdGlhM2N6NVo4QVpZS0Rpd3d1VEdRc0ZkNzVlU01PRGFNbFdx?=
 =?utf-8?B?Qk5EbjF2aGZwT1BZZTRVemc0MXFkZ0ZzV21TUHlYb3ZFcXdMdkR5dlpFUWdv?=
 =?utf-8?B?QUJrcVRjeC9pTlVTYTZ0Z3pWVXZFczJPMW9pTXdCVXFBdG4yWExjazJFejFP?=
 =?utf-8?B?Wk5XMTFsS1VMMFRZbVdTR0dXTHI0MzAvcnNScmJveEsrTWZ5SXhpSW1TZ2F2?=
 =?utf-8?B?YzRLdjdVZTBwdTBHdWx3S2piL2tGUlA2N2YyRFMvN1R3TTZscHZZVzcvbG81?=
 =?utf-8?B?cmlHVmdZcnIrNlhjTXJzOGd6QXVkQkg5M0ZGZzQ5ZjYycDVxQ1gxRlkwN2Mz?=
 =?utf-8?B?MlRFTkIyRzEvbWdXWmVNd1hRL2duTjEvVnBuNHZHOE54TEVzMVNyWFEwYXU2?=
 =?utf-8?B?MHNPSXd0SkQ2QXcwK3lqc2tiRks1NFUyeVdFU05tdHdEZTJKcUhleUV4Rmlu?=
 =?utf-8?B?REJqSVFGaE1GaWcxeFAvNWkyUkRWRDBkRHpiTW5pQkZPMlRabmVLalFpWk5B?=
 =?utf-8?B?ckZaRDg2N1FCcTk5TmNPdHNQNGc1MjFsd3ZBL1dFOVNLRjVnSEp5ZWtUOFpW?=
 =?utf-8?B?ZXJaRkR6NG9OQWc1ZWtJY0ZhNGFEckU0K1l3VVpuTGtVbkswSytqbGV0RkxO?=
 =?utf-8?B?Tm9uWVR1Y094YXdmY2krV1JFcWZFeHpTdy83WjJCNXE1dkdFK3Nxb1FMU3lK?=
 =?utf-8?B?TVdaUG1mOEU5MlNFWi9YTGhGOHJZcm42b3JnaTVoM0psTElncGRlQk1BeERQ?=
 =?utf-8?Q?C2oabC51Uah6kOtV4eGRmGFSK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <243525CC618F7B40A27DCFF0B78EB29A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cda15e-6990-4065-04fc-08de26732f8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 07:22:09.3584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NVyIlhIcZN1pEOBdofX2OGULYrsWwk4VCO/6W5SZVgkVkApi6ui4JmCABXxHaS2qX/AZvrKaGEWbssl3ZcTnJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR03MB9432

T24gVGh1LCAyMDI1LTExLTA2IGF0IDA5OjIxIC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIGpldWRpIDA2IG5vdmVtYnJlIDIwMjUgw6AgMTQ6MTMgKzA4MDAs
IEt5cmllIFd1IGEgw6ljcml0IDoNCj4gPiBNVDgxODkgaXMgcHVyZSBzaW5nbGUgY29yZSBhcmNo
aXRlY3R1cmUuIFN1cHBvcnQgaXRzIGNvbXBhdGlibGUgYW5kDQo+ID4gdXNlIGBtdGtfdmRlY19z
aW5nbGVfY29yZV9wZGF0YWAgdG8gaW5pdGlhbGl6ZSBwbGF0Zm9ybSBkYXRhLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IEt5cmllIFd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwNCj4gPiBhbmdlbG9naW9hY2No
aW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9wbGF0Zm9ybS9t
ZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19kcnYuYyAgIHwgNg0KPiA+ICsr
KysrKw0KPiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2Rl
Y19kZWNfZHJ2LmggICB8IDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmMNCj4gPiBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19k
ZWNfZHJ2DQo+ID4gLmMNCj4gPiBpbmRleCA2ZmIwNWJiMDA2NDEuLmZjYTYwZTgxZTNjNyAxMDA2
NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVj
L2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmMNCj4gPiArKysNCj4gPiBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNf
ZHJ2DQo+ID4gLmMNCj4gPiBAQCAtMzQ3LDYgKzM0Nyw4IEBAIHN0YXRpYyB2b2lkIG10a192Y29k
ZWNfZGVjX2dldF9jaGlwX25hbWUoc3RydWN0DQo+ID4gbXRrX3Zjb2RlY19kZWNfZGV2ICp2ZGVj
X2RldikNCj4gPiAgCQl2ZGVjX2Rldi0+Y2hpcF9uYW1lID0gTVRLX1ZERUNfTVQ4MTg4Ow0KPiA+
ICAJZWxzZSBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoZGV2LT5vZl9ub2RlLA0KPiA+ICJt
ZWRpYXRlayxtdDgxOTYtdmNvZGVjLWRlYyIpKQ0KPiA+ICAJCXZkZWNfZGV2LT5jaGlwX25hbWUg
PSBNVEtfVkRFQ19NVDgxOTY7DQo+ID4gKwllbHNlIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJs
ZShkZXYtPm9mX25vZGUsDQo+ID4gIm1lZGlhdGVrLG10ODE4OS12Y29kZWMtZGVjIikpDQo+ID4g
KwkJdmRlY19kZXYtPmNoaXBfbmFtZSA9IE1US19WREVDX01UODE4OTsNCj4gPiAgCWVsc2UNCj4g
PiAgCQl2ZGVjX2Rldi0+Y2hpcF9uYW1lID0gTVRLX1ZERUNfSU5WQUw7DQo+ID4gIH0NCj4gPiBA
QCAtNTc0LDYgKzU3NiwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiA+
IG10a192Y29kZWNfbWF0Y2hbXSA9IHsNCj4gPiAgCQkuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDgxOTYtdmNvZGVjLWRlYyIsDQo+ID4gIAkJLmRhdGEgPSAmbXRrX2xhdF9zaWdfY29yZV9wZGF0
YSwNCj4gPiAgCX0sDQo+ID4gKwl7DQo+ID4gKwkJLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTg5LXZjb2RlYy1kZWMiLA0KPiA+ICsJCS5kYXRhID0gJm10a192ZGVjX3NpbmdsZV9jb3JlX3Bk
YXRhLA0KPiA+ICsJfSwNCj4gDQo+IE1heWJlIGl0cyBqdXN0IG1lLCBidXQgaXRzIGFubm95aW5n
IHRoYXQgeW91IG1hdGNoIHRoZSBjb21wYXRpYmxlDQo+IHR3aWNlLiBJdCBpcw0KPiBvZiBjb3Vy
c2UgbW9yZSB3b3JrIHRvIGFkZCB5ZXQgYW5vdGhlciBpbmRpcmVjdGlvbiBmb3IgdGhlIGNoaXBf
bmFtZSwNCj4gYnV0DQo+IGNvbnNpZGVyaW5nIHlvdSBkbyAyIHNvYyAvIHllYXIgKGFuZCBzb21l
dGltZXMgbW9yZSkgdGhpcyB3aWxsIGtlZXANCj4gZ3Jvd2luZy4NCj4gDQo+IE9waW5pb25zID8g
SSdkIGRvbid0IHdhbnQgdG8gYmxvY2sgdGhpcyBmb3JldmVyLCBidXQgSSdkIGxpa2UgdG8gc2Vl
DQo+IHNvbWUNCj4gY2xlYW51cCBvZiB0aGlzIGRyaXZlciBoYXBwZW5pbmcgaW4gdGhlIGxvbmcg
dGVybS4NCj4gDQo+IE5pY29sYXMNCg0KRGVhciBOaWNvbGFzLA0KDQpJIHdpbGwgYWRkIHRoaXMg
c2V0dGluZyB0byBjb21waXRhYmxlIHBkYXRhIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNClRoYW5r
cy4NCg0KUmVnYXJkcywNCkt5cmllDQo+IA0KPiA+ICAJe30sDQo+ID4gIH07DQo+ID4gIA0KPiA+
IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVj
L2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmgNCj4gPiBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4g
LmgNCj4gPiBpbmRleCA0MjliMzI5NTIxOTQuLjk0MjFmZDRmZGExZCAxMDA2NDQNCj4gPiAtLS0N
Cj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRr
X3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmgNCj4gPiArKysNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmgN
Cj4gPiBAQCAtMjUsNiArMjUsNyBAQCBlbnVtIG10a192Y29kZWNfZGVjX2NoaXBfbmFtZSB7DQo+
ID4gIAlNVEtfVkRFQ19NVDgxODMgPSA4MTgzLA0KPiA+ICAJTVRLX1ZERUNfTVQ4MTg2ID0gODE4
NiwNCj4gPiAgCU1US19WREVDX01UODE4OCA9IDgxODgsDQo+ID4gKwlNVEtfVkRFQ19NVDgxODkg
PSA4MTg5LA0KPiA+ICAJTVRLX1ZERUNfTVQ4MTkyID0gODE5MiwNCj4gPiAgCU1US19WREVDX01U
ODE5NSA9IDgxOTUsDQo+ID4gIAlNVEtfVkRFQ19NVDgxOTYgPSA4MTk2LA0K

