Return-Path: <linux-media+bounces-19483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FEE99B074
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 05:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F06A282E8A
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 03:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D7384FAD;
	Sat, 12 Oct 2024 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EyNGFcRB";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="cTPQ2tWf"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9993541C6E;
	Sat, 12 Oct 2024 03:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728704105; cv=fail; b=o0AMeNChZFuqMLY2wuUoFLPBNDUtXOozMhX1gsy/sIred5e47be+LoJvyQdwYv84AHYE1jha5aDrk6eIynS8GgRHVtg4uSCDLRLH5PYT2GS9qY1LK4YIdADi/ELPlDuMWywsNhsNEde5O3jaghY70F1oIp6Wj87PlNcaIlELMjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728704105; c=relaxed/simple;
	bh=nIGSc2V7UrqQ3vsvbyNHrlJ7hrMFuR/k5MipSNtF6mg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h+kel08fyQdEWIQon0MNnpSDzGqvbSj0dHDZWtBuD2ixkGnsQsnfVOuSvaAuHYVZb/ewt2SNEqqmmnkb5uszfePLyP72/xzJA8mEKf0eQFt6LPKrPWJUT0tcsJUtMTSzosyWUoSgoK3XCcPjmCf5BNzG+ONLguHeKr44GS7z0GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=EyNGFcRB; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=cTPQ2tWf; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: efcc05de884a11ef88ecadb115cee93b-20241012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=nIGSc2V7UrqQ3vsvbyNHrlJ7hrMFuR/k5MipSNtF6mg=;
	b=EyNGFcRBSWtb/qposeVt3eFs6cqcbYGkxh+66SBSDQhmdDVVdNW1pow+uBovDwcBk58SyXIeR6LnyIl4BHbKLIX0rVILhO/eR0wpF5O5Uy01znbl3Qe4YI7G+dDszHFYj6iCMz7BBtU58yg6J7erPn6ZFX0/D1KPnPdGDCnCEAw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:cd82f476-18e3-4c40-a8f9-68320196503c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:50091f65-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: efcc05de884a11ef88ecadb115cee93b-20241012
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1258725205; Sat, 12 Oct 2024 11:34:50 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 12 Oct 2024 11:34:49 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 12 Oct 2024 11:34:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mU4/NEkaQtuaeHkwr9A/Fs+FyXJNFoknDl7rdKmGeUHj8DIebA1qTXLCbdg6j33TeiSBe3rjfaFI4f0Gkn6SXK1FhMlZ/DyFAd/7OvCZeyFhG4pUAib3QTJNFOFAaXmi0jqqn/lKYFM4wYLOXg5gzHqM88fLV1cqoHUwlSSZsxVD9En2bYs3WgHZFeg1bKvwlpxG9CLlWraoQ0iM/t3k2DCcypbXJJH02kMrbjGxixmWfpvGvpHsCQg2FN0+jKsbWyJUjszvmtFjthvho4P2T30OmqMHfWsw55ZsQMVJLOcQ8VJkGZxfTb7butulhD3SQWuXigigegNKtt7nHtDd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIGSc2V7UrqQ3vsvbyNHrlJ7hrMFuR/k5MipSNtF6mg=;
 b=Aj7A+rtXPFMN8EY5IeX+ebtDjiXGuyuDou7l5hELU5Hqs+496frkHf6JxJzocUJM0TZUwSTQFZctM9DUmtb4tFUlshV97+nmjVnWYYXKk7NkbM8WN/WNTXgxwZ+NJUwQ5W1AX20ApiN/Sp+IIyA9mynwl7kyOAxmK4WrFLU87F1EYO1dL8m9OJrSg4gWYv1ePu+WP37AvqI8WPwJFG9jL+w2vbOme8MRxn5sep1YpmQPI+AfXaX9KPcLZzrA8VWZIBdRmtP2phV2EkmpYIMKavBMIz5EGWdh+TVPf5qc0E0bZcym9FEpC68T0lpwCBye22LtUNElthgKlxBNJU2hGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIGSc2V7UrqQ3vsvbyNHrlJ7hrMFuR/k5MipSNtF6mg=;
 b=cTPQ2tWfDuR7p2fZkEFGEkvlWQsZ3MzEpD9kZ0kOvLjUrCS0Ty487b4GXz0qD2HL67cppZ1BJsZXBak18OqndMVe6zXiXGBXL9mwNChCIsMVTur+UzgoUq1bL57+YVLyHqlWQPMZpkV4GqujfHAQ3rz7xR8YY2X7zeBpmncfwPQ=
Received: from TYZPR03MB5566.apcprd03.prod.outlook.com (2603:1096:400:53::7)
 by SEYPR03MB7923.apcprd03.prod.outlook.com (2603:1096:101:171::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Sat, 12 Oct
 2024 03:34:46 +0000
Received: from TYZPR03MB5566.apcprd03.prod.outlook.com
 ([fe80::dbc2:ff5c:56d:2187]) by TYZPR03MB5566.apcprd03.prod.outlook.com
 ([fe80::dbc2:ff5c:56d:2187%6]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 03:34:45 +0000
From: =?utf-8?B?WmhpIE1hbyAo5q+b5pm6KQ==?= <zhi.mao@mediatek.com>
To: "fshao@chromium.org" <fshao@chromium.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
	=?utf-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?=
	<shengnan.wang@mediatek.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?= <Yaya.Chang@mediatek.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"10572168@qq.com" <10572168@qq.com>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGlhb2ZlaXcgV2FuZyAo546L5bCP6aOeKQ==?=
	<ot_xiaofeiw.wang@mediatek.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] media: i2c: improve suspend/resume switch performance for
 GT9769 VCM driver
Thread-Topic: [PATCH] media: i2c: improve suspend/resume switch performance
 for GT9769 VCM driver
Thread-Index: AQHa+2o5xGUgpO8fLU6T3zrq11VWALJlOUAAgB1/SIA=
Date: Sat, 12 Oct 2024 03:34:45 +0000
Message-ID: <f7fd295b116be6f590350a4733a299676d759f88.camel@mediatek.com>
References: <20240831055328.22482-1-zhi.mao@mediatek.com>
	 <CAC=S1nh76iKhMV4roBe4mLTrq-eHqz-3-fYWzNcWAETvj-JETA@mail.gmail.com>
In-Reply-To: <CAC=S1nh76iKhMV4roBe4mLTrq-eHqz-3-fYWzNcWAETvj-JETA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5566:EE_|SEYPR03MB7923:EE_
x-ms-office365-filtering-correlation-id: ad4cd9b6-7fff-4d77-ef7a-08dcea6ed0db
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QnlhUHQ0UDByWFUrWTJjZDNLWVVITTFsZ0JkTTROcTQ2WWhRNFZyelNTOURM?=
 =?utf-8?B?cEdoVStGcWxkWjd5RkMydEs5MjJoMVlNUzhDNGFVbmRjRi9BVjdJMFpidUcr?=
 =?utf-8?B?bUE3dUNzZkkzZGF3NEZBakV3a3VhQ2xDQk5pNlRTUXV2cjRQcURabzZ6OEdm?=
 =?utf-8?B?Ympma0ttRHlDbjY3QTZ6ZXIrZjhkRFUzSTJkQUZxMjdTc3k3RW1sOEo0eUx3?=
 =?utf-8?B?aHNKbnhmcGdGYU1MM0FvMzA1V2tmN20xMk1LMDJ2emhkcmoyN1g5dWFadnlW?=
 =?utf-8?B?cG02bjBmQkdFdjlUQ1hOZGZpcWg4akUzQUpFTWl5TlFHRlkwNGFJd2lkNkNT?=
 =?utf-8?B?VFJGMlc3QU1NL2pDRnFXYmZWUmJ1anZtWTBocWJ4K05raFc2Tno3K2RYQkFL?=
 =?utf-8?B?WE9CQXlTUGpVZzNaVi9rUGR5TUhUd0RqQUVoWk96QTdNMlFpcXd6Yk9MUVMx?=
 =?utf-8?B?MU5tdHpwVkFweFUzbExBd1Zjc1RTWE5EV0tpZXZsQk9sSnJjY1Y3K2wrZGxm?=
 =?utf-8?B?eDVKK3MyL1dnWlNSWVlUdjFLUnJsdDN3dEcwUmE4VFI1aFZJTGtUSGxEeXNa?=
 =?utf-8?B?Tzg2dVgxZ1VIQVMrV1NpMjQ0NU9qdWZBNFAzWUJDNFl6ZVdIeFJrMHRqaVcw?=
 =?utf-8?B?WlhOU3Q1by9QWXhyd2JEcjRFS0xnekUwN1RIK3ZHMktlMmR2bG9lSEVWaEUy?=
 =?utf-8?B?NWwrMmRUR3RRR3NuSXJjb1RQbjB6YW0rU0VLQXUzM0FTK2hXQng2WnZ4RXZ6?=
 =?utf-8?B?cnVFRnJHdldhRVJ5YndXS1I0RDBrNXg1eTBTeWpvN0daWWdwSUMrbzdacjA4?=
 =?utf-8?B?c1RjaHBmNHBwUGZodzZWcERNN0UxRmh5QjIwVDhsaS84NXNwRTZzVEtraHB2?=
 =?utf-8?B?TzRpaTVxaSsvOUYyT0dmdGxjck42MVlQaHBwMmNoenJSYWdTRzd1SUdKVkc0?=
 =?utf-8?B?Rjg2NUxod3NKM05pclNGV1plS3Q4UFNxUDNOYXl0SDJUS2xUcWJaUTQ3MGpj?=
 =?utf-8?B?WEdxNGtHZEJTZ2xrcWYwSFo0U05GQUxxQ3NUaDFScWRJejhFdW1kamRGRFAr?=
 =?utf-8?B?WVRDYktnN3Z1cXE4aEZyVTl3U2NlaDNxVGUrTThDTzZHYXBsWC9xSTRKeEpM?=
 =?utf-8?B?U1ZuMEVXQjJDcm15WHpVb2srRVlvaTNyQVp4aFRZcDQrZnNKcEwvTnZpRzFE?=
 =?utf-8?B?a3JpWkZMKzREMkFibGRyRFJSS0J4SzZ5RS9rTkdpZUU2bXppUHdoWDNJUFNm?=
 =?utf-8?B?bUJwYVJVYnRkQnV1aWYzVE9ldVQ5dk9GREtZT212RzJYZC9udzVZRk9PbEpB?=
 =?utf-8?B?MXk1aXNVVzZxNEhjbEZlWEtaRDQwSC9QOTRlUWc1VXJqWndrVUFUSG5tckZk?=
 =?utf-8?B?TnBaWlVUZVJEZGhxbnJ2UWxDZVBFcS9qV1dyVVNDMlgraGhwSmlTc2hHM29D?=
 =?utf-8?B?TWxTdENGUld3d2FwYmdEdUlsaDYvRSsyUFVzSmVpNWMvbldJQm5XbjZxSnE2?=
 =?utf-8?B?bW03RUlxZ1JkaXQ5TWQ3clB5eHVqcDM4SHVSb0ZScUtsVU5uREVBaW9oaDhK?=
 =?utf-8?B?aFl5WUpwc1pudlI3cHc2aWsxUiswNEhQMGUya2xBWHlTaWRHT2RZeFVaSlZV?=
 =?utf-8?B?Zm40V0ZwUjErZEEweGJNY2hjRUMwZjY4Q0p5cTVodU9yM05pVXRYcEFaaWds?=
 =?utf-8?B?OTVoVFJCOXl1aExhSnExRzdJZ1FGd0Rqd3ZycFV4WmowbHg4enBoa2lHNWt3?=
 =?utf-8?B?UkxxdGRIY3l1eW9OWllGZERUZWdzR2NRWktpeHR5M0R6UWdycXVmbXU3aVY3?=
 =?utf-8?B?c09kZmhxY1MycmV6Q090QT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5566.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTV6dEg4WEpwVTNnWUx5VHl0M2xkZXlyQXFpZ2ZRT0Q3cDZKaTRiNkhzT3lw?=
 =?utf-8?B?VmdIS3pDYjJlei90N0xXdDllVGZrdkFFSFdTM1ZOVUpFT3dxWENWcWt4QTFU?=
 =?utf-8?B?RDlNT25DMjZiaDMxOTVwY3IwQit2VVU2TFNpRWxJVG5ZbEpRZm9oakFCUHp5?=
 =?utf-8?B?T3BBV1l2UDBrT2dqWlBNL2ZQTGIvUGlmeXpXTHJFL3J3WGNiYVJzMG5wYzNB?=
 =?utf-8?B?TmhIeThLY0c5dDFTWE1JeU51azJsV3ovb29iN0RURDFyZkZ0UERmV1VJUWVR?=
 =?utf-8?B?SE9ZMm1oM0xuUHB0ck82a2ZGVmN2eHhWdTI3TkhwTnIrdHJFVnBZRDBNdVNr?=
 =?utf-8?B?NERocFBBajFBbUU2NWRVSWl4NGIyREdEckNieXdGdG1JM0doeXNQYmxpUC9B?=
 =?utf-8?B?cU9ObkRnUDVJd2dUOWtuUlRTUWczYnpqdFVqbGRmb0NvUzIyZ2hOOTNweXVC?=
 =?utf-8?B?Ymhleld0ZktSdk1rR1FRRHJnZnJ5anVPeDRCZzFvcStITXRCZ051d083d01k?=
 =?utf-8?B?c01qMHVvZTVXa2VkZDhRSStTZlBuS0JnVVJ1QWtjTW5CNzNOWGNBZEgzb0tR?=
 =?utf-8?B?MFBwdml6dmtDdlhOSnE5T1A5ZWRsTWJob0thOTh1WlhEWTNDMktkNzlzUVdN?=
 =?utf-8?B?UWI3WjFGSHpEa0cyRlllNG5jdE5XQ1o3bUtTczVJZ2hYYkxQYU44OWhwZGpy?=
 =?utf-8?B?M08wUGtZZ1FmTW1GRGx6akRIQnRGQTNiSGFuRHMwNG1UUGZrOVJwWllJNDRz?=
 =?utf-8?B?emVqSFlxWUhKU3hiSVVRY2Rsa0k2NzFYbWxKbnpyVEdubTFoVkxpL3dCY0RS?=
 =?utf-8?B?Z0tjTk1QSXdXaGZHWUpxUzVyN0ZJMmxtUm9wOXhmK1Q3MlllMDhWQ0tHTlY4?=
 =?utf-8?B?enMrRVZWVjQySlh1aC9WYVpkK01mdGFXTGlrNUN4SCtZRTlwWFE0S3ZNWTBS?=
 =?utf-8?B?dWZWRHZ0czF2LzVJOU5BRzNBcGl3TTBBU1hPaEw5NWtvT2huN1lqOStERUkr?=
 =?utf-8?B?b2VZbVVCSy9kSnFRQUl5eGZGai92STRJaGlHRE1iMEtLODNPMVEvSTFudkdU?=
 =?utf-8?B?eG9VYkZHN3Z3ejZxVHVJaHJHbHJjdnpQOWRIZ1BCdTRkeEZBeUxxM1hHUUF3?=
 =?utf-8?B?bGF5TDQzTU1qQ0hwSFJ4cTVCU3RzV294MHVtQlhabTY3Z2k3Y1JNN2NhL2Fq?=
 =?utf-8?B?ZlpDZC9PNmpzQlhOK0ZCeWRvUmE2L3poN0EvcEJuZlRhUjlxNm9GWWR6YS9i?=
 =?utf-8?B?SVp1VkNTb2tRU25YV3o5cnVTYVl2Y29ESGh6di91Tzc4N21MZitPQTNFUWRZ?=
 =?utf-8?B?RTFBYzg3MjZZNHBrZkVEaWhwZGppSWhkN3pZdnV2emt0c0V4cWNsamlTaDMv?=
 =?utf-8?B?ZFRkU1VFU0JHd0t5WmszbXJXbEtKSFIxSzhsRmNWdkdBRlJtajUzbzdiNHlQ?=
 =?utf-8?B?RHlTMDAyM2dTbXdpamM1VU41WGlaMFdRaGNlNEpxQ3ZXOVhxYzhoS3JPNTM2?=
 =?utf-8?B?NEM1VHY5ZkQySHd1SFBHeEtDVVN5SG4zUzRLK3JpOHNCVUZNdVBLNm9kM2Vr?=
 =?utf-8?B?dDZRalQzTDFQNDYraUYvV2VMUEUxSm1Xc0ZwZE1FZzZqNktQVlBoQVRJUmd6?=
 =?utf-8?B?R2tvN0xuL0p3QkJEcCtWeER2VHdxOGtXbFlOY0lucVdNQkF5VzI5RWFWYlN4?=
 =?utf-8?B?aWx1bHBKYnBHeDJDbFg2d21FbVhabzlmSXBkQ05GdDcxZkw4NkhSSmtpeUln?=
 =?utf-8?B?cEE1NkIySkZEYUFxQ00vYlBCUEhnSUpFbkJOdDI0T2NJbVBpSURvNkI4azlG?=
 =?utf-8?B?NzAvbUtlMFZYeC9penp6ZTFwSk9FenZhRUJTa2VmL0tYdEdJeHE2Z1NHOTNV?=
 =?utf-8?B?c0NJSlZDbnJKY1FoamZWcUU1NEZ6QzE3dkxZNVRvQnBPb2RKei9Td3VWZFFH?=
 =?utf-8?B?Q1V6MWZrRFpJRmlHZzVZTW5EOE1HVy9FbDhDYTROalNLVjYrK2xTOHZ5eTBq?=
 =?utf-8?B?OTc0czcySnB1K2hnTE9uQVhDbHp4Y29ZY241L2xRRWw0SFNubjlDV3VkVmVR?=
 =?utf-8?B?c0dlMWE0bkRRekt3bC9jdUJHZGt2RDR1eHRoRHJmT0lDZlp0KzlZbWswbUZ3?=
 =?utf-8?Q?Bsp0GiOPhaix8o+euBLotNT9C?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E42789188E1CE4488A25AD3177290DFD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5566.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4cd9b6-7fff-4d77-ef7a-08dcea6ed0db
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2024 03:34:45.0891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RY9hwuDbmBcuZzy/HME0UuWl2u9M6NUhcHU7CAh72WZ8aR3CIeYHbs2JkuTq88970q0HrMqaZChltdF4onVzSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7923
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--27.598700-8.000000
X-TMASE-MatchedRID: xIhOSkOSohXUL3YCMmnG4reiCVGXv/W5EtdrY/Wb3fPagsZM0qVv1yZK
	RIFpXA+B1Fc61VCGvh1oYMUHwkc5gHjxgHkp9duCQty8giCJW42r3d1rmRdCgKXJ9vMysD/CPQl
	KJ9DUxnmZKi5OAE9lR9qspQ7EuDzTfTYIha6O7PyaVoAi2I40/bYxxljjfMnjzf+duMCJLEzmBx
	D2j3KOm194pa9DoxK73/0OX7sbFJrDn86zvsbDw1VN8laWo90MvtVce6w5+K+7+NPPxj+R6lO4B
	D7nLMxnThbvLLI8RvPD0xRHlq+aNJSL8e/MGApZ4bl1FkKDELf01irNvag5a9SVUkz9BPXemAIy
	Wr6xn5/iBofij0HxND2H0NTsYyE4cC92X+BT6RaeAiCmPx4NwMFrpUbb72MU1B0Hk1Q1KyLUZxE
	AlFPo846HM5rqDwqtlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--27.598700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	15F26111227DBD7799F303ACF8FE89AF147C152B73149CA37D59527347FA2B3A2000:8

SGkgRmVpLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiBNb24sIDIwMjQtMDktMjMg
YXQgMTc6MDcgKzA4MDAsIEZlaSBTaGFvIHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwg
OiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4g
eW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIEhpIFpoaSwN
Cj4gDQo+IE9uIFNhdCwgQXVnIDMxLCAyMDI0IGF0IDE6NTTigK9QTSBaaGkgTWFvIDx6aGkubWFv
QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+IA0KPiBTdWdnZXN0aW9uIGZvciB0aGUgbmV3IHBhdGNo
IHRpdGxlOg0KPiAgIG1lZGlhOiBpMmM6IGR3OTc2ODogVXNlIHJ1bnRpbWUgUE0gYXV0b3N1c3Bl
bmQNCj4gDQo+IHRvIGJldHRlciBkZXNjcmliZSAid2hhdCIgdGhpcyBwYXRjaCBkb2VzIHRvIHRo
ZSBEVzk3NjggZHJpdmVyLCBub3QNCj4gIndoeSIuDQo+IEFsc28gdGhlcmUncyBub3RoaW5nIHRv
IGRvIHdpdGggR1Q5NzY5IGluIHRoaXMgcGF0Y2guDQo+IA0KPiA+DQo+ID4gQ2hyb21lYm9vayBj
YW1lcmEgQVAgY2FuIHN3aXRjaCBiZXR3ZWVuIHZpZGVvIGFuZCBwaG90byBtb2RlLA0KPiA+IHRo
ZSBiZWhhdmlvciBjb3JyZXNwb25kaW5nIHRvIFZDTSBpcyBzdXNwZW5kIGFuZCByZXN1bWUsDQo+
ID4gaXQgd2lsbCBjYXVzZSBjYW1lcmEgcHJldmlldyBpcyBub3Qgc21vb3RoIGR1cmluZyBzd2l0
Y2hpbmcNCj4gb3BlcmF0aW9uLg0KPiA+IFdlIHVzZSBhdXRvc3VzcGVuZCBmdW5jdGlvbiBjYW4g
Zml4IHRoaXMgaXNzdWUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGkgTWFvIDx6aGkubWFv
QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMg
fCAzICsrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMNCj4g
Yi9kcml2ZXJzL21lZGlhL2kyYy9kdzk3NjguYw0KPiA+IGluZGV4IDE4ZWYyYjM1YzlhYS4uNzQ0
OWQyOWRmOTAxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jDQo+
ID4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMNCj4gPiBAQCAtMzc0LDcgKzM3NCw3
IEBAIHN0YXRpYyBpbnQgZHc5NzY4X29wZW4oc3RydWN0IHY0bDJfc3ViZGV2ICpzZCwNCj4gc3Ry
dWN0IHY0bDJfc3ViZGV2X2ZoICpmaCkNCj4gPg0KPiA+ICBzdGF0aWMgaW50IGR3OTc2OF9jbG9z
ZShzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLCBzdHJ1Y3QNCj4gdjRsMl9zdWJkZXZfZmggKmZoKQ0K
PiA+ICB7DQo+ID4gLSAgICAgICBwbV9ydW50aW1lX3B1dChzZC0+ZGV2KTsNCj4gDQo+IENhbGwg
cG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIHRvIHVwZGF0ZSB0aGUgcG93ZXIubGFzdF9idXN5
IGZpZWxkDQo+IGZvciBhdXRvc3VzcGVuZCB0byB3b3JrIHByb3Blcmx5Lg0KPiANCj4gPiArICAg
ICAgIHBtX3J1bnRpbWVfcHV0X3N5bmNfYXV0b3N1c3BlbmQoc2QtPmRldik7DQo+IA0KPiBVc2Ug
cG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKS4NCj4gRG9uJ3Qgc3dpdGNoIHRvIHRoZSBzeW5j
aHJvbml6ZWQgdmFyaWFudCB3aXRob3V0IHJlYXNvbnMuDQo+IA0KPiA+DQo+ID4gICAgICAgICBy
ZXR1cm4gMDsNCj4gPiAgfQ0KPiA+IEBAIC00OTAsNiArNDkwLDcgQEAgc3RhdGljIGludCBkdzk3
NjhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQNCj4gKmNsaWVudCkNCj4gPiAgICAgICAgICAgICAg
ICAgZ290byBlcnJfcG93ZXJfb2ZmOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gKyAgICAgICBw
bV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZChkZXYpOw0KPiANCj4gQWRkIHBtX3J1bnRpbWVfc2V0
X2F1dG9zdXNwZW5kX2RlbGF5KCkgYmVmb3JlIGNhbGxpbmcNCj4gcG1fcnVudGltZV91c2VfYXV0
b3N1c3BlbmQoKSB0byBhdm9pZCByYXBpZCBwb3dlciBzdGF0ZSBib3VuY2luZy4NCj4gDQoNCkkg
aGF2ZSBmaXhlZCB0aGVzZSBzdWdnZXN0aW9uIGFib3ZlLg0KcGxlYXNlIHJldmlldyBwYXRjaDoN
Cg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQxMDEyMDMyODA1LjIzNTQ1LTEtemhp
Lm1hb0BtZWRpYXRlay5jb20vDQoNCg0KPiBSZWdhcmRzLA0KPiBGZWkNCj4gDQo+IA0KPiANCj4g
PiAgICAgICAgIHBtX3J1bnRpbWVfaWRsZShkZXYpOw0KPiA+DQo+ID4gICAgICAgICByZXR1cm4g
MDsNCj4gPiAtLQ0KPiA+IDIuNDYuMA0KPiA+DQo+ID4NCg==

