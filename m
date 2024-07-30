Return-Path: <linux-media+bounces-15498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2DE94042A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 04:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FF352838A3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 02:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3357D20326;
	Tue, 30 Jul 2024 02:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y7dbLmAU";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="d34PZoto"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D6E241E7;
	Tue, 30 Jul 2024 02:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722305518; cv=fail; b=aq8FL3Q5y7JkcTgjh9QK/nTEMyq/E/Me8+qW2/K7pp5fRDPYanD8FJLeHijOSlRXywsbISv4pKB+Y3PwwcIxSNjEc5tewV7ecGXN9U58/mcnSQ3aQ0a4IFRL7lResazwrgMR9oBikDhTIBCGSWJRemz31vY2GmjnqsOMwGEOEoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722305518; c=relaxed/simple;
	bh=7F383hYc6tcN2fCU7wYJ5+1p7wwXlE7GIo0fdewKUIc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OJS5qloa1UNOP7duw6nMNtsL0QGhjeFspxKRnIQXReycMLZQUeuGOqkAXux+vuxGbQ68x0YcKIpfd8qyn4VM1ZWoy8W4SM1Vyj6dOnda/CxrlAF1CdhwFhtOAh27+b2M1SLjzG/ykzuF7+lYkmj5BzTqDWVLD35e993oJdg21dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Y7dbLmAU; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=d34PZoto; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 14d752964e1911efb5b96b43b535fdb4-20240730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7F383hYc6tcN2fCU7wYJ5+1p7wwXlE7GIo0fdewKUIc=;
	b=Y7dbLmAU5p163RRLINAIG85DKUz1YqZsQrgcQBNmBpoHom1GYxl0pzm2vFeXk1Qhxqcg3WY0fN+0pGBCmOpkQqANY8BvU49/dqLPPLsjC4JkKFbTkPfJ2GD+GcgXPzpuR/da8BuoGErTGizaU4hCCtBVkaSYCthXObVAf7bXEHY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7e269920-ef13-415b-a5fb-481d729f78fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:04960cd2-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 14d752964e1911efb5b96b43b535fdb4-20240730
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1294718351; Tue, 30 Jul 2024 10:11:50 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jul 2024 19:11:49 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 Jul 2024 10:11:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+I6anIeZK+A64cXGdA0TyltiwepLAHxlkn7zGiJyfiVpJ16bA+HJhK77h4TAa4VjFV3DDGYNLBghkUH7sieys4vJSsMCRevaQY7Er47qgk+vv/RMZfZzBwBx/2SO0K4R+kcGdA+tVeAIvMpQ2DktAY3CMGx64P7YJ2G20fSm5LdGH+SfE43/bywllMeO+aa0VrSw5SbTC4xF/l6ELnuD/QRGRFDuCUo+BOMy1qiJ3pjphL5Z6rgdySNCXkLt43XBmz2OQrRPWUb9L5qOpincM4ZNBGRHF9+u2mKZeQ3jwPlwLUas+CfSnptaQ8O8gGMBIsZ2YLOmrr7PlAjK5E+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7F383hYc6tcN2fCU7wYJ5+1p7wwXlE7GIo0fdewKUIc=;
 b=gLiSWvnyCR/9vZVWp5LC4rEUh5eVkuVLgKuUTc8jGbK8CXPkdQGMJP4+soBKzjZj+xoYPksIlCHkpCwTsnLo3bRQktzWkUQjAuUhqU30WeVrGTrn1f90EycpBfMkXmRT3zfNMK2H7mnm58zmnfrUNUQm+OBpA3sU+aQMTO5R3A+5IoxBVmMuu3OtlwdERPSfD3Iib4y5ZUal/EtFtuLvQHLJUB64Ovh40I0uRxMFJHVdtaNNFEFYNpsD4TO+CUzJiCuSqZ7FoPRsNEQLN/bgyb+JauWIVADRVWbLwBcIJIDOQ7eDpBYknQZX3YQSSFvJ1FlJnBQu65AtUyd7cmBi0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7F383hYc6tcN2fCU7wYJ5+1p7wwXlE7GIo0fdewKUIc=;
 b=d34PZotoO3ayw2UgwUjKhDlSA6cxW4geUZys7C80ON+H9oNHnVDY0c7yDKovpNtcnRX3fBnin24JOlsnQ614buo2fUN5ir/nPnkpKds4kQpRPckMmwlg3Y3sDzoqFM62yMH6gkNOzGCPggnLf+uaib2KlgmoI2+c/XcIH5TKFhk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6801.apcprd03.prod.outlook.com (2603:1096:4:1ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Tue, 30 Jul
 2024 02:11:45 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:11:45 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "jstephan@baylibre.com" <jstephan@baylibre.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "pnguyen@baylibre.com"
	<pnguyen@baylibre.com>
Subject: Re: [PATCH v5 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Thread-Topic: [PATCH v5 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Thread-Index: AQHazhd5l4rc57nWtkWApqQhVYkmorH73KkAgBHx0YCAAOD8AA==
Date: Tue, 30 Jul 2024 02:11:45 +0000
Message-ID: <15c7bc8119b10168f2de146bbbf743869193eba3.camel@mediatek.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
	 <20240704-add-mtk-isp-3-0-support-v5-3-bfccccc5ec21@baylibre.com>
	 <647738c5c776a9ec07615e67094c4141fdf051eb.camel@mediatek.com>
	 <CAEHHSvYqT5-s57FijOf+SfLYF4znjaseazxiY-07jVHs09iK6Q@mail.gmail.com>
In-Reply-To: <CAEHHSvYqT5-s57FijOf+SfLYF4znjaseazxiY-07jVHs09iK6Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6801:EE_
x-ms-office365-filtering-correlation-id: 914c35b7-a8a1-4674-f08a-08dcb03cf602
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RUtVbDJmSGpLQjFsK1ZyLzk0eFhjTmtMRzA5Qlp5MUV2M1dKR3d5aGdKU1JM?=
 =?utf-8?B?SVByUHMxWnlGaDJOOWEzNGVhUXU2M1k3QUFSNERnMUpVeVhXUHJXdUF6bWNM?=
 =?utf-8?B?NU1MNHZkNmpzTGwvQ3hFb0R0cG55L3RGWVVXOCtlRGhQalNoby8xNUJTR3pw?=
 =?utf-8?B?VzNuUEZzNUYxZnFMK1RTSnBLSjB4dGZPT0VGNmwveU1CS0dqbEpuZGR1NXhx?=
 =?utf-8?B?dTEvSmdmQTFGNTBnblJQTnVyWml0dnRoQUkrMHpSQ2RKQllIcHgvMHl1UTJX?=
 =?utf-8?B?Q2U4Vmh1UXZpM2hRYmJuZkRjeXAxTU1va1lyZ1JHdEJtb0dKZ0dDSFRrRC9T?=
 =?utf-8?B?c0F6WmFwc01rK0F4RzZzaTF4cmdvMEk4VGFHOCtTaHRBcU1YbDV0RUxwWkpO?=
 =?utf-8?B?Z3B6TWFxL2JHbG82T1hvWktacEwydEo2Y0I5citaSTFhQk5ZR0RTOW0wQlNo?=
 =?utf-8?B?bG9tbU5xWDFud0dPaUZZbWlDd1ExM2lCRmhKUzd2Vk1sbkpOSFFLNVVWR3Bz?=
 =?utf-8?B?NmVKekhaeUN1b0ltQklyRGRLYTM1N05Wd2tjVnZEWGk2MVk1bkRaZm13TzBZ?=
 =?utf-8?B?RWM1Mk5HaHc4RW5ZaHZmd05jMldVY2g0S3FpelJ4a283N2tjcUpkYzdzNG50?=
 =?utf-8?B?OXp0UnpvbjZJMmV6alFweUx1eU5zRTRINkpHeWZGcGd2WFNiU3ZISlVPVGhq?=
 =?utf-8?B?UlhzQTg0QUFDQ0FMeU9BUUZRQnVXT3RQOHR3NUR2bWlZL0tEU001RVZKQmps?=
 =?utf-8?B?L3JuNWh6WVhOdVlDZ01HNnJ3djFtYnBVeE4xaTNOMlVMMUJpV2dWT1BpRUdm?=
 =?utf-8?B?ei8yTmY2eVVHSUdpS3NPaFIzL3pTSGwzYXVBSUF1dE5EdjVvUXJMYkNLVFgx?=
 =?utf-8?B?ZmVIQWI5V2RzdS8rc1FkNmZ2NUxtTmtLejNtN1FWaWRVUTdUNzRjanZjNC80?=
 =?utf-8?B?dGJMcE9LVHYrTHhyZlRjUzh5d1RyWkZQSGQxQmE5aXY1ckFTNksvTENnWFFU?=
 =?utf-8?B?YmxnTkwzMm1LYUNFSmZ3ZHhUdHdLS081TGFyN0xXZjdmcitZNFJhcTZhcjVF?=
 =?utf-8?B?aDJnN0JZZDdldVJzQTZnZFVQNUl6ajVZd2Ezd0tjd0N3bHN2anFrVmU0aFY1?=
 =?utf-8?B?RVkrdVlNdmJzMkNRNzZtejdLUGVmYnFmei9mRGhYR29IR3UxQWtVdW5saSsw?=
 =?utf-8?B?TVRBS2FPQ0p4bGF1SHhHUkJxd2psVktFRnhFN28zai9Zd1orL0k5WUFNcDdH?=
 =?utf-8?B?aVk1YkdzWG1nUlZ2VDhMSXZ5UGhXRm5rMU13MmMvOEFlOHlPODhtQmxIb2FD?=
 =?utf-8?B?Ny9iUkJ4NThEZE5Udk9IUmhYK1pST1dBcHMwZzVjanl1Ym1SRndjTUJsS3o5?=
 =?utf-8?B?U3pRSzJXK1dVaHFlMHp0L1VUSTJrRmRvbXRQd2FmWnZHVnVWUGFtbWk0N3JO?=
 =?utf-8?B?WHc3NDlQZElnRnFHdVVhQnVxYmNzenM3Y0llc2llTHZKcFJQekxMWWNwajRP?=
 =?utf-8?B?bGFidkExbDQ2SGtVOEhoaERQblMvYXUyelhGc1I2TzdqWThNNDlMR2RPdjZP?=
 =?utf-8?B?TXc4aEFmNUYwVU1XbDNZaWJ0MDNxaTNXaEJQMHcyOGp4K2hteUlaWW5GYTZG?=
 =?utf-8?B?RHFoMTdESnBneFd6TXBpVDA3L3FRSS9TcjR1UHBOTjVjbW9ad3Q2b25EOGsx?=
 =?utf-8?B?d0VLb2RRcWJIL001VjJ3SXJBdjNaa3BvMkVPd2JsVHlLN0dMdXhoTzVXZkdJ?=
 =?utf-8?B?SUYvK3ExMTFNa2FBVmVvNlNrUHhXSWcvZGpaclhLRzhBQzFveTRiZTNvd1o1?=
 =?utf-8?Q?du7UQmlKGG63H7Z1BNfY4nt3lJx6b7d0tbLFE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkswWFd5ZmZQSk96anZRdXNOOFVlRndPWndkaXVLa2p0UFFWTEFJblpCa1E3?=
 =?utf-8?B?UHZMOUZwL0lpU21wYzFnSlV3Z0tRT2dnV0NLN3ZPRnUwNFR5TGtIYUVmWlNj?=
 =?utf-8?B?ZmJRdjkyd3NkL1RMdmZwMjhGWFpYclk5eW9xRXlVTmRNOVF6Z1M0ZUhuZEhX?=
 =?utf-8?B?TnMwL1d4U0NaSXhncDVDTnhlSUYvZk5DTCtXS0JTMmo4eXJ0RmJYLzBiSnBt?=
 =?utf-8?B?b1VZVFZmODhTR1FCYmxQSGdkZnJBYzZrVWRuSXBMUGZ2c0F1UGh2bjhiQVJV?=
 =?utf-8?B?VENXbk8zN1N4SVUwZ2MxSm0vb0dmcTZQbVdISVVjZ0xJMU01WC9ydlJqcjB1?=
 =?utf-8?B?YzBMSERMamFtRmlHbHY1RkRsem9yQk0vNjlncVRQTjN0MGZHajUrWHYzSHB2?=
 =?utf-8?B?TnZRZXNnMklXTklpZVZhdnBkcWtwQnZST1lZeGpZQ081S0NLWmFWM3NnalVT?=
 =?utf-8?B?bG16a3BJTWRYTmJteVNicUNqTktCbWFkV2lYZzdQNUVFa2RkTXpoM3VzYzVz?=
 =?utf-8?B?OWU2ZThRa3NsUEoxMTB3clM0RG5kb0NGTzl5R2ZXeVova2J3cjQvVmJxRHVv?=
 =?utf-8?B?MWQwUkhVWXkwOXBjbVRMcFNBdTM2UlpLNlpSNzEwQzVpRFRacUgrVW5uT1FY?=
 =?utf-8?B?dzAvcTVhYjFMN2xDYnFpbEVlVWxaL1JQb0lvYUlKcUhVMStUbjJoRU5CcWda?=
 =?utf-8?B?MWVZaDVqK1lHaDBEMkFNYWVHZWtBZDBMU254Um82aHU1dkdsQmdJa3JkNTBt?=
 =?utf-8?B?UHdrTjc5Vk1SNWJVbVZMN0h1OFJPaWFjZ1d0N05KTW5qRmo1dFVmQkN4VjZz?=
 =?utf-8?B?WlpQSUpVSUVzSEZyeVZzRGIvVkJDVTZXS3FRMkhrRzJzZkhKczl3VkQrV1dI?=
 =?utf-8?B?ZlgweVJ0V2VIbGxJSXV4ZnN5YW5JMmQrbEFZTnRza0lmL1VhUHZHdk5uUFNP?=
 =?utf-8?B?b1Z5WXpxNDIrSFQwbGNxcEZRcURuaWs2UFZvcDhJV1dFUUNNc1BJMHdkUUh2?=
 =?utf-8?B?NFR5YVhRNXpwSmljOXZ2d2pTMWQycGMxVDB6VmFMQVNrdXpKUGd3TWNqQmMy?=
 =?utf-8?B?YTdjOStvS0R6N3E3ME1yUExXSlF3MGdDMUlmYnFaaFNHM0hZaHJJOXBDQVJK?=
 =?utf-8?B?a2UwNFRaa09JTEJJZ0loR09mUjFpckVLVGpxU05BQ29aVFRmdnY3TWdndXZT?=
 =?utf-8?B?OEdxTkNkUWw3d0FVQlluRy9CWXRLVmpyZTRrbjQzRzQ0cFVyeERRcGNoV0V3?=
 =?utf-8?B?dllDRlZGaE01c2pFYlZZK3FVN3liWG9EUE9Kb2RTdEkrZ0ROOTNBUC9JV3Vn?=
 =?utf-8?B?YTFrcElabVQ0TS9tTjNOS08xcW93SDRTYjdSbEVIelY3aVJXS3B1VThTTzJI?=
 =?utf-8?B?TW9aOWNmc3FGSGd4Rk1uNG0xOS93dHdBU0J5dHZuMkdHMXFaTS9oTVlOaTYy?=
 =?utf-8?B?RGtwSGUxa1RiSkFJR2lhdXBWQWNjUHU1U3M4dVpLbnhqLzU1aHgzZURuYldN?=
 =?utf-8?B?RG9oMlp6Tm1KZ28yem14elIzN05IQ0M4a3kyTUtQOFlXR1hoS3J4Q1lETUdB?=
 =?utf-8?B?ZExFcTBhVHJLMmVPVzJhSy9mRlhpRTVzZWdINnZMRjBpK2h5cE5scm9NdzBi?=
 =?utf-8?B?eVZnQ1YyeklWd3dFU1ZtUXZqYnRwVHY5MzQ0NE9mTkdKUm1uWllVWndlRjl4?=
 =?utf-8?B?SXRUWlExK2YyL3oyN2xYWkVHNDJZbjhmeEtHUkl4MVlwSnEzOFljdGtDZnV0?=
 =?utf-8?B?ZjJLaWh1dXYwVTNTc2s2VVdzUWRvUG5lUkNXQXRiUVljZE5iMWFjN0dlRHVG?=
 =?utf-8?B?d0tkVjhjK1NYKys3SUU0NFJmdE5jY080VnorTVBBdFV3SHEybWhWWUgrM20y?=
 =?utf-8?B?bGlQcXRuL1BqNENzUnE1UURsTGJaWkpGdk5WbGFQQnZYVnEyQ1RhTFpWL3ZV?=
 =?utf-8?B?RU12aFhYM3RvdTh6bk9KUFNWNUY1d0NpWEUzZ2t5RE9FZ1R4SElxTW1jbU1C?=
 =?utf-8?B?SzFyTkVlR2s0eXhMcW9wOW1tVW5nZUNuSklzWWFmRTJ4K3Ardm56YzY3Y2xY?=
 =?utf-8?B?ZG9tZW5OK3Exbi9oVFBuL2FoVXhGMGtlZEZUWjhNTU0zdzg1aTFGVnRmdTA0?=
 =?utf-8?Q?jO4iZh+5y0T4QFfMh+uNBbVWn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C87CD15BF801EE409A5D12EFA693E937@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914c35b7-a8a1-4674-f08a-08dcb03cf602
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 02:11:45.1239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dG3G18oxi0JR1JzPccPan3Yqwf+e7OaWjoXJF38+ZuVYlni76VA0L6wehnC/zuOz/PJTHKMwKQ5gPSdGL54NHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6801

T24gTW9uLCAyMDI0LTA3LTI5IGF0IDE0OjQ2ICswMjAwLCBKdWxpZW4gU3RlcGhhbiB3cm90ZToN
Cj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+ICBMZSBqZXUuIDE4IGp1aWwuIDIwMjQgw6AgMDQ6NDQsIENLIEh1ICjog6Hk
v4rlhYkpIDxjay5odUBtZWRpYXRlay5jb20+IGEgw6ljcml0IDoNCj4gPg0KPiA+IEhpLCBKdWxp
ZW46DQo+ID4NCj4gPiBPbiBUaHUsIDIwMjQtMDctMDQgYXQgMTU6MzYgKzAyMDAsIEp1bGllbiBT
dGVwaGFuIHdyb3RlOg0KPiA+ID4NCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVk
IHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4gPiAgRnJvbTogTG91aXMgS3VvIDxsb3Vp
cy5rdW9AbWVkaWF0ZWsuY29tPg0KPiA+ID4NCj4gPiA+IFRoaXMgd2lsbCBhZGQgdGhlIG1lZGlh
dGVrIElTUDMuMCBzZW5pbmYgKHNlbnNvciBpbnRlcmZhY2UpIGRyaXZlciBmb3VuZA0KPiA+ID4g
b24gc2V2ZXJhbCBNZWRpYXRlayBTb0NzIHN1Y2ggYXMgdGhlIG10ODM2NS4NCj4gPiA+DQo+ID4g
PiBUaGVuIHNlbmluZiBtb2R1bGUgaGFzIDQgcGh5c2ljYWwgQ1NJLTIgaW5wdXRzLiBEZXBlbmRp
bmcgb24gdGhlIHNvYyB0aGV5DQo+ID4gPiBtYXkgbm90IGJlIGFsbCBjb25uZWN0ZWQuDQo+ID4g
Pg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTG91aXMgS3VvIDxsb3Vpcy5rdW9AbWVkaWF0ZWsuY29t
Pg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGhpLWJhbmcgTmd1eWVuIDxwbmd1eWVuQGJheWxpYnJl
LmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gU3lsdmVzdHJlIDxmc3lsdmVzdHJl
QGJheWxpYnJlLmNvbT4NCj4gPiA+IENvLWRldmVsb3BlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTog
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+
ID4gQ28tZGV2ZWxvcGVkLWJ5OiBKdWxpZW4gU3RlcGhhbiA8anN0ZXBoYW5AYmF5bGlicmUuY29t
Pg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJl
LmNvbT4NCj4gPiA+IC0tLQ0KPiA+DQo+ID4gW3NuaXBdDQo+ID4NCj4gPiA+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IG10a19zZW5pbmZfY29uZiBzZW5pbmZfODM2NV9jb25mID0gew0KPiA+ID4gKy5t
b2RlbCA9ICJtdGstY2Ftc3lzLTMuMCIsDQo+ID4gPiArLm5iX2lucHV0cyA9IDQsDQo+ID4gPiAr
Lm5iX211eGVzID0gNiwNCj4gPiA+ICsubmJfb3V0cHV0cyA9IDQsDQo+ID4gPiArfTsNCj4gPiA+
ICsNCj4gPg0KPiA+IEkgdGhpbmsgeW91IHNob3VsZCBkaXJlY3RseSBkZWZpbmUgdGhlc2UgdmFs
dWUgYXMgc3ltYm9scyBiZWNhdXNlIG5vdw0KPiA+IG9ubHkgc3VwcG9ydCBvbmUgU29DLg0KPiA+
DQo+ID4gI2RlZmluZSBNT0RFTCAgICAgIm10ay1jYW1zeXMtMy4wIg0KPiA+ICNkZWZpbmUgSU5Q
VVRfTlIgIDQNCj4gPiAjZGVmaW5lIE1VVEVYX05SICA2DQo+ID4gI2RlZmluZSBPVVRQVVRfTlIg
NA0KPiA+DQo+ID4gQmVjYXVzZSB3ZSBkb24ndCBrbm93IHdoaWNoIFNvQyB3b3VsZCBiZSB1cHN0
cmVhbSBsYXRlciwgbWF5YmUgdGhlIG5leHQNCj4gPiBTb0Mgd291bGQgYmUNCj4gPg0KPiA+IHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3NlbmluZl9jb25mIHNlbmluZl84M3h4X2NvbmYgPSB7DQo+
ID4gICAgICAgICAubW9kZWwgPSAibXRrLWNhbXN5cy0zLjAiLA0KPiA+ICAgICAgICAgLm5iX2lu
cHV0cyA9IDQsDQo+ID4gICAgICAgICAubmJfbXV4ZXMgPSA2LA0KPiA+ICAgICAgICAgLm5iX291
dHB1dHMgPSA0LA0KPiA+ICAgICAgICAgLnN1cHBvcnRfeHh4ID0gdHJ1ZTsNCj4gPiB9Ow0KPiA+
DQo+ID4gdGhlbiBtb2RlbCwgbmJfaW5wdXRzLCBuYl9tdXhlcywgYW5kIG5iX291dHB1dHMgaGFz
IG5vIGRpZmZlcmVuY2UsIHNvDQo+ID4gaXQncyBub3QgbmVjZXNzYXJ5IHRvIGRlZmluZSB0aGVt
IGFzIHZhcmlhYmxlLiBTbyBkZWZpbmUgdGhlbSBhcw0KPiA+IGNvbnN0YW50IG5vdywgYW5kIHdo
ZW4gbmV4dCBTb0MgdXBzdHJlYW0sIHRoZW4gd2Uga25vdyB3aGljaCBvbmUgd291bGQNCj4gPiBi
ZSB2YXJpYWJsZS4NCj4gPg0KPiANCj4gSGkgQ0ssDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIg
ZmVlZGJhY2sgb24gdGhpcyBzZXJpZXMuDQo+IFdlIGFscmVhZHkgZGlzY3Vzc2VkIHRoaXMgaW4g
YW4gZWFybHkgdmVyc2lvbiBvZiB0aGUgc2VyaWVzIChzZWUNCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzJkZDQxMmYwLTg2Y2ItM2FlMC0zMDVkLTBlODE5MmI5MTI4YUBjb2xsYWJvcmEu
Y29tLykuDQo+IA0KDQpTb3JyeSBmb3IgbG9zaW5nIHNvbWUgaW5mb3JtYXRpb24uIFRoaXMgaXMg
bm90IGEgcmVkIGZsYWcgZm9yIG1lLg0KDQo+IEkgYWxzbyBkaXNjdXNzZWQgd2l0aCBpbnRlcm5h
bCB0ZWFtcyBpbiBNZWRpYXRlayBhYm91dCB0aGUgZm9sZGVyDQo+IGFyY2hpdGVjdHVyZS4gSWYg
dGhpcyBpcyBub3QgYSByZWQgZmxhZyBmb3IgeW91LCBJICdsbCBsZXQgaXQgYXMgaXMuDQoNClRo
ZSBmb2xkZXIgYXJjaGl0ZWN0dXJlIGlzIGEgcmVkIGZsYWcgZm9yIG1lLg0KWW91ciByZWFzb24g
aXMganVzdCAiTWVkaWFUZWsgaW50ZXJuYWwgdGVhbXMgd2FudCBpdCIuDQpJIHRoaW5rIG5vIG9u
ZSB3b3VsZCBhY2NlcHQgdGhpcyByZWFzb24uDQpQbGVhc2UgcHJvdmlkZSBtb3JlIGFjY2VwdGFi
bGUgcmVhc29uLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gSSB3aWxsIGZpeCBvdGhlciBjb21t
ZW50cyB5b3UgZGlkIGFuZCB0aGF0IEkgZm9yZ290IHRvIGFkZCBpbiBwcmV2aW91cyB2ZXJzaW9u
cy4NCj4gDQo+IENoZWVycw0KPiBKdWxpZW4NCj4gDQo+ID4gUmVnYXJkcywNCj4gPiBDSw0KPiA+
DQo+ID4NCj4gPg0KPiA+ICoqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5v
dGljZSAqKioqKioqKioqKioqKioqKioqKg0KPiA+IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueQ0KPiA+IGF0dGFjaG1lbnRzKSBt
YXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNl
DQo+ID4gZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlz
IGludGVuZGVkIHRvIGJlDQo+ID4gY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNp
cGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sDQo+ID4gZGlzdHJpYnV0aW9uLCBwcmlu
dGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMN
Cj4gPiBhdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkg
cHJvaGliaXRlZCBhbmQgbWF5DQo+ID4gYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGlu
dGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KPiA+IHRoYXQgeW91
IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNl
bmRlcg0KPiA+IGltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YNCj4gPiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBh
dHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KPiA+IGRpc2Nsb3NlIHRo
ZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSEN
Cg==

