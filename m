Return-Path: <linux-media+bounces-19399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 031B9999E68
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 09:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 702331F24D7D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 07:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9956A20A5FC;
	Fri, 11 Oct 2024 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="c/b/FXQ3";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="KQ5a9EaP"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA59E194C8B;
	Fri, 11 Oct 2024 07:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728632857; cv=fail; b=AQXuTbf2woIOVpEyhTGSJLgEpw56yvQT+73YrYApMAMCDpQf5qx/TwVugBFoA5PmWhVQF+ecT29ZFfU9/iKFh8fK+4AjRfI8onH5rqSi0+kSfc1tX3LXm5GM4l37E93seaUX2Jm8wsX7hZVUiueT1kvS0vBstrH5vvHcgd2VJm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728632857; c=relaxed/simple;
	bh=Edgf4cNjp+ZyVOegamnTkBafcR1SK8ITL77Vf0ZHq4U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=edNfgyXt1m+eslzUbM63KMfGQom/K3Kp4UI9onGw4e0GXyfhzbCwi8r0h4b2+EKePWkwr3lKJ26ROYHyBbfC70tss/0gYgYppvHpdx13nPfexzz0IEJobygzqGM3fsyKhYk1cMlCjNyiW4O6TuAVEp07if400DtwvIUN0KcMEvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=c/b/FXQ3; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=KQ5a9EaP; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 10b93a5687a511ef8b96093e013ec31c-20241011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Edgf4cNjp+ZyVOegamnTkBafcR1SK8ITL77Vf0ZHq4U=;
	b=c/b/FXQ3xwKhgZMRzytNcIqgmfsNkN0XzqkhVrbL05I6sU1NPOlJkHV0a1TRgwaXLaJuRN+GNqEvRM4s/8KyxQUA0DzUNKohoT6reuz/+xumEgCteWYA5PKYZkFkbKG+Su8ZPNLA8rLgnXMBJTY/fqKwAGSqFVMmZ23vxJVYH6c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:61bc1ae0-d17a-4306-94b6-5dd4c22b5bf0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:a9261841-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 10b93a5687a511ef8b96093e013ec31c-20241011
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1673647631; Fri, 11 Oct 2024 15:47:29 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 15:47:26 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 15:47:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYXZMkRD8JsYK4jIrIEdvTpfydKxtSDdK0W7CCt1QJCQso20P20utKy1s6OAgF/XUBHLW4Byg40XcxXHAOny79drVS0w689PAo5i8BhrdWWzCUfsGy/b980wBO05ii5B+R6kKzO089rcgV0bE1ttPrPhPeExpbT4EBg//yIj6d3YrZ5fsWrg5i4QucbAg+UrrJT7WrmcfijYCkQWtAdrYRiXyVYb4fVDIl7mNsUNJlYziNgsThgLYqFVJ83AGm5CKb+7SvA5IsmWplyP9HUNTxoeExsIxv/vEZGy8QktDsXgNmW11tFXFBBMdw2aoldWYZmavIYsyyBbuW35ztXs8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Edgf4cNjp+ZyVOegamnTkBafcR1SK8ITL77Vf0ZHq4U=;
 b=TfD9tl7Gx81gB1NF6hWg2uMHIkvE/z0WB3w2o7I+Uhq4+U7FMvwFpMfxNpQWOp4rACJlkE3j/YR4iCsFonXeL8rjz4gA5F+5jFm3XPPaHxBBayD98OZjYDqza/yYFTI9MkL0V7g3wLSA+mPTHVLACH+8deL3EQJ5dxy15Zh6PvDDHLr1pCH2tWHkWAo/yix6PmOX76ieU2ZpjtdyGpm+L5x1Ivzc1icmOmN1aN/buHTklLH/CdnedcVZImT1ieWdbsEMaS1LrUN3cJkbd28EHQD8N1sz2WM4QrEzu4yC0LngrZfNzobCVuhBTwjsIgPAOp7NtW/jISYVuPZKmNUpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Edgf4cNjp+ZyVOegamnTkBafcR1SK8ITL77Vf0ZHq4U=;
 b=KQ5a9EaPzSMhudTKimzvbcPQANtLyL3w5NDLted6QIk2b1DgJkxK9bKossvmGtB8QyvapmA9XTfUO1G3pMiXP8077QATpG/7UC7Kl7BygdPuVFZf3i+YG1oqLQ3REty1NHu6iQmikK2ARTLeNW3AF4JLmHpHwPIEq8UPMjd90o4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7337.apcprd03.prod.outlook.com (2603:1096:101:147::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 07:47:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 07:47:22 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 10/10] uapi: linux: add mediatek isp_7x camsys user api
Thread-Topic: [PATCH v1 10/10] uapi: linux: add mediatek isp_7x camsys user
 api
Thread-Index: AQHbGj2oNs0v9TyLkkuXYBAr3amqdLKBLx+A
Date: Fri, 11 Oct 2024 07:47:22 +0000
Message-ID: <d75bd5e143793e97a8773df8edb1312d87b6efa8.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-11-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-11-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7337:EE_
x-ms-office365-filtering-correlation-id: ffac0093-9828-4289-134c-08dce9c8f0bf
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eE1MTjdmUlpURkdEYlpYcUpSTmFXUW53cEVzRXpNelBjdC9ISktKWk1nM0Fp?=
 =?utf-8?B?TUVPajcrQ1VjVFhrY2ZvdmNreityeTVoZVZJeHBVeTNSd2FkZWFjZjFIQkZs?=
 =?utf-8?B?Uk9iL0NLR0o1RGRSZjVSS0UvTWE3U29zeEJzVEFtYlBFcTFueVp6QkpodGVu?=
 =?utf-8?B?eUhGMDJiVzQrakJkMTIwaHQwUkhzQTZ5Uy9SL1dXYjBHY3pZb2RmRVo4ODZ1?=
 =?utf-8?B?Y05nd3ExRDVuaWJvYlZxQksrNWt0YUhreDh3OHh2T0ZOU0Q1ZURKaVRyVXlU?=
 =?utf-8?B?b2hOSVhXZUFUUGtjTUhSbTF0cWtiNUhWNVZBNktZcGpQQ29QMGxSUUhsUytH?=
 =?utf-8?B?VnRJOWl0cGkzTDhiS0lnUUswQjU3TUx1bFg5YjQ4ZUlFTkcxcWJzejhldDBp?=
 =?utf-8?B?L2cvSE83V0NCL25neVFLMzRHUXVaNkd2NzdjbjhvcERPSTNnd0MzZjRZV3Yr?=
 =?utf-8?B?Wmpib1d2SE45aTFWYnlJNTc3YW8rRkNqWE5FbWFrRm56KzhQNGc4ODVWc1dD?=
 =?utf-8?B?d3ZPbEIzYnJ2TUYzSVJjUzRtREMxMGFzU0M1QkhwTGRPT0dzWWFCRXhIdlpm?=
 =?utf-8?B?Njg3VWY2KzRSVVpSL29Qc0RnUTVEa0dMNkNmSm1EKzJqK1VKMGlYVjdnQUlN?=
 =?utf-8?B?MkhJYnNqdjdPNTNlSk41MUhDK1AybDg4cGxEVmx0ZWQ4MlZka3ZoUzAxRjRF?=
 =?utf-8?B?ZGlRU0dLUXdlVEZpS1V5a0Q4NkpScVltTHdTeXE1OXdQeHI2YXkvQUl6cjY0?=
 =?utf-8?B?VGQ3VXo2aVNPSTJTN0JpeVE1eHg4QUE3bkhCYW9teWNhZTVqZU9BU1JJbFhT?=
 =?utf-8?B?eHlPRFh0OWYzUEZXL1ZLeGo0bnpDSjVFVDBYUEVGUDl0bDNpQmhGY3NFZFhS?=
 =?utf-8?B?L0VWbVk3NkFyZ0FhZjgyVVBPWnNhT0RaaUhIWk54MWtOSUNJdTFLM1F3aEow?=
 =?utf-8?B?WEFlbHlZOHB4eVlBNFRtU2w5a3dDM3NCR3ZHZjl1V3dITzhoRXkrZERaeldz?=
 =?utf-8?B?alBhUVdmVVVkeitBbS9MaDVvelkzQVJBWFR1UGtQVzhGTEZuWEV1QlR0SzJn?=
 =?utf-8?B?Si9zU01BOWkvcGdJK21uN2plTUlmclZNVkUxUDlOUEh3N1JjUTFwUzlVeTJ5?=
 =?utf-8?B?QkVtVlI4VFkvTkNSWnlEZFJuM3FOWWxqTnh3NExROGlFaE5aZGZmOW5YSUFs?=
 =?utf-8?B?a2o0U1Mwdy9lR045Rmo5M1BVd0ZEeW9haTh0WEJDZWxabjMyamlielF4Q3h6?=
 =?utf-8?B?UDNzR21NVUt6Sk1Qc2lCMllZV0tSVUF1T1dWQ2llV2pTZlg4czlHSzQyZ01X?=
 =?utf-8?B?UzExZG5FN0Z0dm9JUXNXYkxURFh5UitvMjdJd1p2elJ6RjJtU0hueUVPREF4?=
 =?utf-8?B?QUUzNzdLakZNMkRGU0hla2hyemRweFAwdUtGd1EvOW4xcmV3VGgvSmx0TmI2?=
 =?utf-8?B?MEZMN2VmcVBVZ0Y2amJtMEp6Zzd4RzFaQnRYS2xTUm13VFNNOEpBTHY1c3BO?=
 =?utf-8?B?WGNwcHNmOUQrNlJWTGd2dDBZNVFoUm9oOW9zbFRuSVhrTnJlZ25kYjNoTUtt?=
 =?utf-8?B?aFFWT0Fub29GZHlVTnVuWTloWDYzczZGSnB1TEhTM2dZekE1UUtZMHU4bmwr?=
 =?utf-8?B?R2lWN3ZHTE9TMHNHeldVUUtTcnNPWE1zOHc1ZFBuOWZKQi93Y2p6K0Z5SmJH?=
 =?utf-8?B?V2M0b1l6QkFnUDdld2Q4M0pDajV5elNRZVlkUndRRHJxajZFVE5ob0dLQzVn?=
 =?utf-8?B?dkFvVHhOVGlzL2UyenA5Z1FDNi8yanBGM0oreHl5aVlZTGhNWkJvYURZWVZ5?=
 =?utf-8?B?ZXBsZTQvclV5NGRYUmw1QT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R09ub20rQkFCMWRORkg3SkdiK2pCa0dmTHVHcFZ4aFNBazNoUEtib0xUc3Ji?=
 =?utf-8?B?bEFza0VtVURIeWZKeTlrZGsrTkpQc2tydzc0NFNRZUtSc3JFQkpUT0ExRHBz?=
 =?utf-8?B?T0JBOFVQZ01ZNjV5c1hITHBIa1o5STZZdUxXVG5OcDhxTXBjWEJ0ajdreFNR?=
 =?utf-8?B?V0lMMHNqVGJKTE40d0FYbnJKYUp3QzFaU25IQjAwRi9RRXcwK1lucWx0Qng4?=
 =?utf-8?B?K2V4cU5YZysxbWJmcTBGbXRkb01iZ2IvMXZIQlB4Z0NrV2JLbXlIRXpZMFow?=
 =?utf-8?B?aVd4RFd6b3pSZVQrUDM2VXpPSkVSM1FsMCs2SkJUN0xmblhxeWlqSTROM2hY?=
 =?utf-8?B?Ry9zcDRYWFNzbDJwQzRNQU03OXRWMkVqT0xISUZMOWlCSHRVeUpxYktVVEFR?=
 =?utf-8?B?V0ZoWkVINVQxUmdYV2dicnRiN0d2TWRrWFgxRTJmc1FJaDhaNG1sVk5keXRk?=
 =?utf-8?B?blNDWEVUOGFWejEvbGdrc0poSEZzSFVZVFJzMGppc1RNSnVtYWtaMFZrd0U3?=
 =?utf-8?B?bTAxdWk2Y3RmU2ZVeXVJR05QMmpzTUwvNnozZDE4WnAxNTVLK1J5KytGN0hx?=
 =?utf-8?B?K1VmTDErczhveHpmSXhKR2RxTDJvMjUrbUhGbDV6REt2VjJFNzJpZ21KOXRS?=
 =?utf-8?B?TkdvbTN6dm9JMkM5L2hKRWs5QVplTlJDWkh1aCtrZ1JhcTBuUFMvcmlBSVhJ?=
 =?utf-8?B?c0VIc2FRck9UaE9aY3I1TDFyRVEzK1RoL0lDWmJnRmorTDhGVmh4UGlYT0xl?=
 =?utf-8?B?dU10SkFhUXV4NDJqTXZNSXRnV3V3NmxYYzlFZ0dKUmJMWnFYK1d4eEFjSjND?=
 =?utf-8?B?V1hWeWc3TG81SVZPQ0syRERXdFB3NUlFZTVCV3ByZmp5ZDJWd21iY1d2UDlT?=
 =?utf-8?B?c2VGa2Y0aHc3R0wxdll5WVdyTzAzU3NyYWh0eXY5dzA5cGQ4Sk1SZWxFc3hF?=
 =?utf-8?B?M3d6K280RmhiTVVhbXB5WEQvMmlnRmxyVCtXN3lLd290Y0ZPRW16VWw4ZUJm?=
 =?utf-8?B?Qnp3ZjQwVitNM2lYSW11dFpvMXVzaEV5ODNSYjY4cXUzcFhMRld2TzVjQVYx?=
 =?utf-8?B?eWcvaU1WZUNhS0pnam5lTUZKanQrTVRETVRaTFplQkNXeDlaeUN5ZThzOC9x?=
 =?utf-8?B?c21IaldSTzVvcE9zbVJ3UlFjaElYV0JNQkpqdFRzNUhCd0NHYkM4RU5heVhQ?=
 =?utf-8?B?VlVXVE9NZWlmV2lncldrNXFiUDgyWWZaMUNUNjNJRG5DemY4ejg4RTNjLzNS?=
 =?utf-8?B?UnlYL0JxRVF1MEFDMlZyUXJ0aC9MRjBpRTBSSW56VEpObVhVUG1McFZYWk0z?=
 =?utf-8?B?amRoQWRkN3NTWmZuUGFnU05wRU9PcTVQRHBnNnZrM290RDR3Nkw0azZ3YnBU?=
 =?utf-8?B?WVFlQ3ZaN3k2bHQyUDdiUjBRV2RjZFdSRVFhNWpMNnBjQmlnMTg3YWdSWTJk?=
 =?utf-8?B?TFNsdWdIT2tveGhlNG9pT0R2SUxZL25EOXpncDVJcC9CcklWcG1RVEsrVlA3?=
 =?utf-8?B?ZERiQ3BkSExwUnZqZlFZaEhCRzROcHRhNU45MG8ydWFIaGlNWHRwYWlRN1NH?=
 =?utf-8?B?MkNGeWZJNGpUL0tETmVScHpmQ2pRZ0tSOEx5aUx2alVQa1hLVGh0Tzl3b21i?=
 =?utf-8?B?WUluc3pUUlp0SkcvYXYveTM1Vjl0UXJNN1IwY2Z4Rk51a2xuQXNzQmdUZG5F?=
 =?utf-8?B?ZmlCcW1JcGhXWHY0d1VTMGVlMXVZMHcrNEZVSW1kOE9mM1lLdW43ZlRKQnpV?=
 =?utf-8?B?a3ZKaWEwa0k0SGNTQ2gzb2tjM3dKS1BOdExzNHZYOG1KSURISk9LZS9Paklz?=
 =?utf-8?B?Rm05dzRXc08yazJKMjBoem1HWUw1Umd2OUJKbXRJZFZucjZWcmtsZ0NHaEpB?=
 =?utf-8?B?dS9aNktlSUJNTEl6V2ZpWFZBUUlNR3B3VXZnQ2xpdG9OTXlSWk9CZ1JiaHZZ?=
 =?utf-8?B?Uk94OHBkY0NPNGpHdWNQVUJqaGFWSlU3RmFJdE5kSUloejRlVUMzUGtIQmxq?=
 =?utf-8?B?MDBqZ2NyS2RBKy83b29zUVV5NWEvSnlET05BdVlqVk5ycWhvZ2tKSmdURklp?=
 =?utf-8?B?RjNJZ0FPdDB6Q1dGdUxCWGFQaGhYQXVaYnRLa1hxSHBHaFJGdlJjbXFEUWhn?=
 =?utf-8?Q?CsqP0KdUaC9pRk0hhP7F91YHB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2008AF48F7F1740BFE9981C4E35C700@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffac0093-9828-4289-134c-08dce9c8f0bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 07:47:22.1023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WU9K11rQ/cHhO13J69+bkM/wHbeCT9GbYAy3b+B6h1wZ3xOc39NNnh1A9Ex8l9zq5cldV8dbm3E8n2QYCGIpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7337
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.319400-8.000000
X-TMASE-MatchedRID: cgbqQT5W8hdm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYJgC
	Mlq+sZ+fP4UK2jG+TwGJBh7KINf2n8Ydp1pG4A6/XbTfocfAWb9+tO36GYDlstchlMhSt6FeNyd
	6ynRfHVHAw5Su4AXqlsNNmRo2tcL/uafWgMhNYLnBVprK8rvWX0wr+fGcfUiamyiLZetSf8n5kv
	mj69FXvKEwgORH8p/AjaPj0W1qn0TGVuWouVipcoH9W+pq/t3vJyM8elFYs/ij843BCNOCoPofv
	DkekCfQA6F6IA/Hye2ZhCpHscKn2dpVo8A/nQq2zBwrz1TOIwGPz6veAK0M9lr/VRGx0IR2+Uo4
	vXq+qmzIizeCsI6wA0LUmjyL3DZSc+aWLqiwUqk=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.319400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	8C11D4CF355D4918315C77743B6791FC39B1B62474570304E282B944DF6FF9F92000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBBZGQgVUFQSSBmb3IgTWVkaWFUZWsgSVNQIHBsYXRmb3Jt
LCBwcm92aWRpbmcgdXNlci1zcGFjZQ0KPiBpbnRlcmZhY2VzIGZvciB0aGUgbmV3IGNhbXN5cyBk
cml2ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTaHUtaHNpYW5nIFlhbmcgPFNodS1oc2lhbmcu
WWFuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICsvKiBMdW1pbmFu
Y2UrQ2hyb21pbmFuY2UgZm9ybWF0cyAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfWVVZVjEw
ICB2NGwyX2ZvdXJjYygnWScsICdVJywgJ1knLCAnQScpIC8qIDE2ICBZVVYgNDoyOjIgMTAtYml0
ICovDQo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9ZVllVMTAgIHY0bDJfZm91cmNjKCdZJywgJ1Yn
LCAnWScsICdBJykgLyogMTYgIFlVViA0OjI6MiAxMC1iaXQgKi8NCj4gKyNkZWZpbmUgVjRMMl9Q
SVhfRk1UX1VZVlkxMCAgdjRsMl9mb3VyY2MoJ1UnLCAnWScsICdWJywgJ0EnKSAvKiAxNiAgWVVW
IDQ6MjoyIDEwLWJpdCAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfVllVWTEwICB2NGwyX2Zv
dXJjYygnVicsICdZJywgJ1UnLCAnQScpIC8qIDE2ICBZVVYgNDoyOjIgMTAtYml0ICovDQo+ICsj
ZGVmaW5lIFY0TDJfUElYX0ZNVF9ZVVlWMTIgIHY0bDJfZm91cmNjKCdZJywgJ1UnLCAnWScsICdD
JykgLyogMTYgIFlVViA0OjI6MiAxMi1iaXQgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX1lW
WVUxMiAgdjRsMl9mb3VyY2MoJ1knLCAnVicsICdZJywgJ0MnKSAvKiAxNiAgWVVWIDQ6MjoyIDEy
LWJpdCAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfVVlWWTEyICB2NGwyX2ZvdXJjYygnVScs
ICdZJywgJ1YnLCAnQycpIC8qIDE2ICBZVVYgNDoyOjIgMTItYml0ICovDQo+ICsjZGVmaW5lIFY0
TDJfUElYX0ZNVF9WWVVZMTIgIHY0bDJfZm91cmNjKCdWJywgJ1knLCAnVScsICdDJykgLyogMTYg
IFlVViA0OjI6MiAxMi1iaXQgKi8NCj4gKw0KPiArLyogdHdvIHBsYW5lcyAtLSBvbmUgWSwgb25l
IENyICsgQ2IgaW50ZXJsZWF2ZWQgICovDQo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9OVjEyXzEw
IHY0bDJfZm91cmNjKCcxJywgJzInLCAnQScsICdVJykgLyogMTIgIFkvQ2JDciA0OjI6MCAxMCBi
aXRzIHVuLXBhY2tlZCAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTlYyMV8xMCB2NGwyX2Zv
dXJjYygnMicsICcxJywgJ0EnLCAnVScpIC8qIDEyICBZL0NyQ2IgNDoyOjAgMTAgYml0cyB1bi1w
YWNrZWQgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX05WMTZfMTAgdjRsMl9mb3VyY2MoJzEn
LCAnNicsICdBJywgJ1UnKSAvKiAxNiAgWS9DYkNyIDQ6MjoyIDEwIGJpdHMgdW4tcGFja2VkICov
DQo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9OVjYxXzEwIHY0bDJfZm91cmNjKCc2JywgJzEnLCAn
QScsICdVJykgLyogMTYgIFkvQ3JDYiA0OjI6MiAxMCBiaXRzIHVuLXBhY2tlZCAqLw0KPiArI2Rl
ZmluZSBWNEwyX1BJWF9GTVRfTlYxMl8xMiB2NGwyX2ZvdXJjYygnMScsICcyJywgJ0MnLCAnVScp
IC8qIDEyICBZL0NiQ3IgNDoyOjAgMTIgYml0cyB1bi1wYWNrZWQgKi8NCj4gKyNkZWZpbmUgVjRM
Ml9QSVhfRk1UX05WMjFfMTIgdjRsMl9mb3VyY2MoJzInLCAnMScsICdDJywgJ1UnKSAvKiAxMiAg
WS9DckNiIDQ6MjowIDEyIGJpdHMgdW4tcGFja2VkICovDQo+ICsjZGVmaW5lIFY0TDJfUElYX0ZN
VF9OVjE2XzEyIHY0bDJfZm91cmNjKCcxJywgJzYnLCAnQycsICdVJykgLyogMTYgIFkvQ2JDciA0
OjI6MiAxMiBiaXRzIHVuLXBhY2tlZCAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTlY2MV8x
MiB2NGwyX2ZvdXJjYygnNicsICcxJywgJ0MnLCAnVScpIC8qIDE2ICBZL0NyQ2IgNDoyOjIgMTIg
Yml0cyB1bi1wYWNrZWQgKi8NCj4gKw0KPiArLyogVmVuZG9yIHNwZWNpZmljIC0gTWVkaWFUZWsg
SVNQIGJheWVyIGZvcm1hdHMgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX1NCR0dS
OCAgIHY0bDJfZm91cmNjKCdNJywgJ0InLCAnQicsICc4JykgLyogIFBhY2tlZCAgOC1iaXQgICov
DQo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9NVElTUF9TR0JSRzggICB2NGwyX2ZvdXJjYygnTScs
ICdCJywgJ0cnLCAnOCcpIC8qICBQYWNrZWQgIDgtYml0ICAqLw0KPiArI2RlZmluZSBWNEwyX1BJ
WF9GTVRfTVRJU1BfU0dSQkc4ICAgdjRsMl9mb3VyY2MoJ00nLCAnQicsICdnJywgJzgnKSAvKiAg
UGFja2VkICA4LWJpdCAgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX1NSR0dCOCAg
IHY0bDJfZm91cmNjKCdNJywgJ0InLCAnUicsICc4JykgLyogIFBhY2tlZCAgOC1iaXQgICovDQo+
ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9NVElTUF9TQkdHUjEwICB2NGwyX2ZvdXJjYygnTScsICdC
JywgJ0InLCAnQScpIC8qICBQYWNrZWQgMTAtYml0ICAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9G
TVRfTVRJU1BfU0dCUkcxMCAgdjRsMl9mb3VyY2MoJ00nLCAnQicsICdHJywgJ0EnKSAvKiAgUGFj
a2VkIDEwLWJpdCAgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX1NHUkJHMTAgIHY0
bDJfZm91cmNjKCdNJywgJ0InLCAnZycsICdBJykgLyogIFBhY2tlZCAxMC1iaXQgICovDQo+ICsj
ZGVmaW5lIFY0TDJfUElYX0ZNVF9NVElTUF9TUkdHQjEwICB2NGwyX2ZvdXJjYygnTScsICdCJywg
J1InLCAnQScpIC8qICBQYWNrZWQgMTAtYml0ICAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRf
TVRJU1BfU0JHR1IxMiAgdjRsMl9mb3VyY2MoJ00nLCAnQicsICdCJywgJ0MnKSAvKiAgUGFja2Vk
IDEyLWJpdCAgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX1NHQlJHMTIgIHY0bDJf
Zm91cmNjKCdNJywgJ0InLCAnRycsICdDJykgLyogIFBhY2tlZCAxMi1iaXQgICovDQo+ICsjZGVm
aW5lIFY0TDJfUElYX0ZNVF9NVElTUF9TR1JCRzEyICB2NGwyX2ZvdXJjYygnTScsICdCJywgJ2cn
LCAnQycpIC8qICBQYWNrZWQgMTItYml0ICAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJ
U1BfU1JHR0IxMiAgdjRsMl9mb3VyY2MoJ00nLCAnQicsICdSJywgJ0MnKSAvKiAgUGFja2VkIDEy
LWJpdCAgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX1NCR0dSMTQgIHY0bDJfZm91
cmNjKCdNJywgJ0InLCAnQicsICdFJykgLyogIFBhY2tlZCAxNC1iaXQgICovDQo+ICsjZGVmaW5l
IFY0TDJfUElYX0ZNVF9NVElTUF9TR0JSRzE0ICB2NGwyX2ZvdXJjYygnTScsICdCJywgJ0cnLCAn
RScpIC8qICBQYWNrZWQgMTQtYml0ICAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1Bf
U0dSQkcxNCAgdjRsMl9mb3VyY2MoJ00nLCAnQicsICdnJywgJ0UnKSAvKiAgUGFja2VkIDE0LWJp
dCAgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX1NSR0dCMTQgIHY0bDJfZm91cmNj
KCdNJywgJ0InLCAnUicsICdFJykgLyogIFBhY2tlZCAxNC1iaXQgICovDQo+ICsjZGVmaW5lIFY0
TDJfUElYX0ZNVF9NVElTUF9TQkdHUjhGICB2NGwyX2ZvdXJjYygnTScsICdGJywgJ0InLCAnOCcp
IC8qICBGdWxsLUcgIDgtYml0ICAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfU0dC
Ukc4RiAgdjRsMl9mb3VyY2MoJ00nLCAnRicsICdHJywgJzgnKSAvKiAgRnVsbC1HICA4LWJpdCAg
Ki8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX1NHUkJHOEYgIHY0bDJfZm91cmNjKCdN
JywgJ0YnLCAnZycsICc4JykgLyogIEZ1bGwtRyAgOC1iaXQgICovDQo+ICsjZGVmaW5lIFY0TDJf
UElYX0ZNVF9NVElTUF9TUkdHQjhGICB2NGwyX2ZvdXJjYygnTScsICdGJywgJ1InLCAnOCcpIC8q
ICBGdWxsLUcgIDgtYml0ICAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfU0JHR1Ix
MEYgIHY0bDJfZm91cmNjKCdNJywgJ0YnLCAnQicsICdBJykgLyogIEZ1bGwtRyAxMC1iaXQgICov
DQo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9NVElTUF9TR0JSRzEwRiAgdjRsMl9mb3VyY2MoJ00n
LCAnRicsICdHJywgJ0EnKSAvKiAgRnVsbC1HIDEwLWJpdCAgKi8NCj4gKyNkZWZpbmUgVjRMMl9Q
SVhfRk1UX01USVNQX1NHUkJHMTBGICB2NGwyX2ZvdXJjYygnTScsICdGJywgJ2cnLCAnQScpIC8q
ICBGdWxsLUcgMTAtYml0ICAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfU1JHR0Ix
MEYgIHY0bDJfZm91cmNjKCdNJywgJ0YnLCAnUicsICdBJykgLyogIEZ1bGwtRyAxMC1iaXQgICov
DQo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9NVElTUF9TQkdHUjEyRiAgdjRsMl9mb3VyY2MoJ00n
LCAnRicsICdCJywgJ0MnKSAvKiAgRnVsbC1HIDEyLWJpdCAgKi8NCj4gKyNkZWZpbmUgVjRMMl9Q
SVhfRk1UX01USVNQX1NHQlJHMTJGICB2NGwyX2ZvdXJjYygnTScsICdGJywgJ0cnLCAnQycpIC8q
ICBGdWxsLUcgMTItYml0ICAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfU0dSQkcx
MkYgIHY0bDJfZm91cmNjKCdNJywgJ0YnLCAnZycsICdDJykgLyogIEZ1bGwtRyAxMi1iaXQgICov
DQo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9NVElTUF9TUkdHQjEyRiAgdjRsMl9mb3VyY2MoJ00n
LCAnRicsICdSJywgJ0MnKSAvKiAgRnVsbC1HIDEyLWJpdCAgKi8NCj4gKyNkZWZpbmUgVjRMMl9Q
SVhfRk1UX01USVNQX1NCR0dSMTRGICB2NGwyX2ZvdXJjYygnTScsICdGJywgJ0InLCAnRScpIC8q
ICBGdWxsLUcgMTQtYml0ICAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfU0dCUkcx
NEYgIHY0bDJfZm91cmNjKCdNJywgJ0YnLCAnRycsICdFJykgLyogIEZ1bGwtRyAxNC1iaXQgICov
DQo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9NVElTUF9TR1JCRzE0RiAgdjRsMl9mb3VyY2MoJ00n
LCAnRicsICdnJywgJ0UnKSAvKiAgRnVsbC1HIDE0LWJpdCAgKi8NCj4gKyNkZWZpbmUgVjRMMl9Q
SVhfRk1UX01USVNQX1NSR0dCMTRGICB2NGwyX2ZvdXJjYygnTScsICdGJywgJ1InLCAnRScpIC8q
ICBGdWxsLUcgMTQtYml0ICAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfU0dSQjhG
ICB2NGwyX2ZvdXJjYygnTScsICdGJywgJzgnLCAnUCcpIC8qIHRocmVlIHBsYW5lcyBGdWxsLUcg
OC1iaXQgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX1NHUkIxMEYgIHY0bDJfZm91
cmNjKCdNJywgJ0YnLCAnQScsICdQJykgLyogdGhyZWUgcGxhbmVzIEZ1bGwtRyAxMC1iaXQgKi8N
Cj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX1NHUkIxMkYgIHY0bDJfZm91cmNjKCdNJywg
J0YnLCAnQycsICdQJykgLyogdGhyZWUgcGxhbmVzIEZ1bGwtRyAxMi1iaXQgKi8NCj4gKw0KPiAr
LyogVmVuZG9yIHNwZWNpZmljIC0gTWVkaWFUZWsgTHVtaW5hbmNlK0Nocm9taW5hbmNlIGZvcm1h
dHMgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX1lVWVYxMFAgdjRsMl9mb3VyY2Mo
J1knLCAnVScsICdBJywgJ1AnKSAvKiBZVVYgNDoyOjIgMTAtYml0IHBhY2tlZCAqLw0KPiArI2Rl
ZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfWVZZVTEwUCB2NGwyX2ZvdXJjYygnWScsICdWJywgJ0En
LCAnUCcpIC8qIFlVViA0OjI6MiAxMC1iaXQgcGFja2VkICovDQo+ICsjZGVmaW5lIFY0TDJfUElY
X0ZNVF9NVElTUF9VWVZZMTBQIHY0bDJfZm91cmNjKCdVJywgJ1knLCAnQScsICdQJykgLyogWVVW
IDQ6MjoyIDEwLWJpdCBwYWNrZWQgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX1ZZ
VVkxMFAgdjRsMl9mb3VyY2MoJ1YnLCAnWScsICdBJywgJ1AnKSAvKiBZVVYgNDoyOjIgMTAtYml0
IHBhY2tlZCAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfTlYxMl8xMFAgdjRsMl9m
b3VyY2MoJzEnLCAnMicsICdBJywgJ1AnKSAvKiBZL0NiQ3IgNDoyOjAgMTAgYml0cyBwYWNrZWQg
Ki8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX05WMjFfMTBQIHY0bDJfZm91cmNjKCcy
JywgJzEnLCAnQScsICdQJykgLyogWS9DckNiIDQ6MjowIDEwIGJpdHMgcGFja2VkICovDQo+ICsj
ZGVmaW5lIFY0TDJfUElYX0ZNVF9NVElTUF9OVjE2XzEwUCB2NGwyX2ZvdXJjYygnMScsICc2Jywg
J0EnLCAnUCcpIC8qIFkvQ2JDciA0OjI6MiAxMCBiaXRzIHBhY2tlZCAqLw0KPiArI2RlZmluZSBW
NEwyX1BJWF9GTVRfTVRJU1BfTlY2MV8xMFAgdjRsMl9mb3VyY2MoJzYnLCAnMScsICdBJywgJ1An
KSAvKiBZL0NyQ2IgNDoyOjIgMTAgYml0cyBwYWNrZWQgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhf
Rk1UX01USVNQX1lVWVYxMlAgdjRsMl9mb3VyY2MoJ1knLCAnVScsICdDJywgJ1AnKSAvKiBZVVYg
NDoyOjIgMTItYml0IHBhY2tlZCAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfWVZZ
VTEyUCB2NGwyX2ZvdXJjYygnWScsICdWJywgJ0MnLCAnUCcpIC8qIFlVViA0OjI6MiAxMi1iaXQg
cGFja2VkICovDQo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9NVElTUF9VWVZZMTJQIHY0bDJfZm91
cmNjKCdVJywgJ1knLCAnQycsICdQJykgLyogWVVWIDQ6MjoyIDEyLWJpdCBwYWNrZWQgKi8NCj4g
KyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX1ZZVVkxMlAgdjRsMl9mb3VyY2MoJ1YnLCAnWScs
ICdDJywgJ1AnKSAvKiBZVVYgNDoyOjIgMTItYml0IHBhY2tlZCAqLw0KPiArI2RlZmluZSBWNEwy
X1BJWF9GTVRfTVRJU1BfTlYxMl8xMlAgdjRsMl9mb3VyY2MoJzEnLCAnMicsICdDJywgJ1AnKSAv
KiBZL0NiQ3IgNDoyOjAgMTIgYml0cyBwYWNrZWQgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1U
X01USVNQX05WMjFfMTJQIHY0bDJfZm91cmNjKCcyJywgJzEnLCAnQycsICdQJykgLyogWS9DckNi
IDQ6MjowIDEyIGJpdHMgcGFja2VkICovDQo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9NVElTUF9O
VjE2XzEyUCB2NGwyX2ZvdXJjYygnMScsICc2JywgJ0MnLCAnUCcpIC8qIFkvQ2JDciA0OjI6MiAx
MiBiaXRzIHBhY2tlZCAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfTlY2MV8xMlAg
djRsMl9mb3VyY2MoJzYnLCAnMScsICdDJywgJ1AnKSAvKiBZL0NyQ2IgNDoyOjIgMTIgYml0cyBw
YWNrZWQgKi8NCj4gKw0KPiArLyogVmVuZG9yIHNwZWNpZmljIC0gTWVkaWFUZWsgc3BlY2lmaWVk
IGNvbXByZXNzZWQgZm9ybWF0ICovDQo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9NVElTUF9OVjEy
X1VGQkMgdjRsMl9mb3VyY2MoJzEnLCAnMicsICc4JywgJ0YnKSAvKiBZL0NiQ3IgNDoyOjAgOCBi
aXRzIGNvbXByZXNzZWQgKi8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX05WMjFfVUZC
QyB2NGwyX2ZvdXJjYygnMicsICcxJywgJzgnLCAnRicpIC8qIFkvQ3JDYiA0OjI6MCA4IGJpdHMg
Y29tcHJlc3NlZCAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfTlYxMl8xMF9VRkJD
IHY0bDJfZm91cmNjKCcxJywgJzInLCAnQScsICdGJykgLyogWS9DYkNyIDQ6MjowIDEwIGJpdHMg
Y29tcHJlc3NlZCAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfTlYyMV8xMF9VRkJD
IHY0bDJfZm91cmNjKCcyJywgJzEnLCAnQScsICdGJykgLyogWS9DckNiIDQ6MjowIDEwIGJpdHMg
Y29tcHJlc3NlZCAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfTlYxMl8xMl9VRkJD
IHY0bDJfZm91cmNjKCcxJywgJzInLCAnQycsICdGJykgLyogWS9DYkNyIDQ6MjowIDEyIGJpdHMg
Y29tcHJlc3NlZCAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfTlYyMV8xMl9VRkJD
IHY0bDJfZm91cmNjKCcyJywgJzEnLCAnQycsICdGJykgLyogWS9DckNiIDQ6MjowIDEyIGJpdHMg
Y29tcHJlc3NlZCAqLw0KPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTVRJU1BfQkFZRVI4X1VGQkMg
djRsMl9mb3VyY2MoJ00nLCAnQicsICc4JywgJ1UnKSAvKiBSYXcgOCBiaXRzIGNvbXByZXNzZWQg
Ki8NCj4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX0JBWUVSMTBfVUZCQyB2NGwyX2ZvdXJj
YygnTScsICdCJywgJ0EnLCAnVScpIC8qIFJhdyAxMCBiaXRzIGNvbXByZXNzZWQgKi8NCj4gKyNk
ZWZpbmUgVjRMMl9QSVhfRk1UX01USVNQX0JBWUVSMTJfVUZCQyB2NGwyX2ZvdXJjYygnTScsICdC
JywgJ0MnLCAnVScpIC8qIFJhdyAxMiBiaXRzIGNvbXByZXNzZWQgKi8NCj4gKyNkZWZpbmUgVjRM
Ml9QSVhfRk1UX01USVNQX0JBWUVSMTRfVUZCQyB2NGwyX2ZvdXJjYygnTScsICdCJywgJ0UnLCAn
VScpIC8qIFJhdyAxNCBiaXRzIGNvbXByZXNzZWQgKi8NCj4gKw0KDQpJIHRoaW5rIHRoZSBWNEwy
IHBpeGVsIGZvcm1hdCBzaG91bGQgYmUgZGVmaW5lZCBpbiBpbmNsdWRlL3VhcGkvbGludXgvdmlk
ZW9kZXYyLmgNCg0KUmVnYXJkcywNCkNLDQoNCg==

