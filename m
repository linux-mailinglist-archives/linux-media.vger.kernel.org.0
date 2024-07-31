Return-Path: <linux-media+bounces-15600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE79425AC
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 07:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D0C81F2452A
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 05:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4A949643;
	Wed, 31 Jul 2024 05:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XQG2iUWk";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ZQDcQFPZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A8661FFE;
	Wed, 31 Jul 2024 05:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722402894; cv=fail; b=nzcHiomdZtPAeF8JvNYPGlaXwj33BAS4JqJYL9vCxeA5CtVxm8Wg7lJLzewvOsXaT/AcVOi6F4UHa/WCtnehVbt5Q7sWKc+Dam57zk1xe56jrYFNiSG26cvvSemEemQ/iVvqyq78806Gz7kyAijLXa3xkdr5wOPs1iOIbYg8yQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722402894; c=relaxed/simple;
	bh=/41cqbL8DB6dq1aJtHG8H7YQfoxmXeclPFHx30YHAOI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uQf8T6jZiDWuTMKZyGh42ZsVKhyUMK1pEGO9AoRe5w5EoXsTRDaggfBEm5cvJxeTZvDxCRnh6StxopltyeY3Z6RSy6yLI7UWUTKsIPNvryMpcpAOk5ZpYzo2tDWNSMCsF1dBuREr3L75PdY+5XykgsDRvfrAdhNbFqPE3ByNf7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=XQG2iUWk; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ZQDcQFPZ; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cd9b7a364efb11ef87684b57767b52b1-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=/41cqbL8DB6dq1aJtHG8H7YQfoxmXeclPFHx30YHAOI=;
	b=XQG2iUWkgNHfTiMOJ5FSfERISYprCKSpG7qBEhbIIN8oxfcgp2hPyXGnpeQjDGoriMJHNVCFZxpsAv7ZQGxg6yMcyyQfe45u1ThumEMxgk42wg0sOFV21ENBPBQTvlJ0K5VtlOSHk4Xv1PVEjHnwTD+aMVGuKSeygKSAmmpKljw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:c8c402f3-f0c8-4a5e-88a4-6604b6966aed,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:1d7ff7d5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cd9b7a364efb11ef87684b57767b52b1-20240731
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1185312036; Wed, 31 Jul 2024 13:14:46 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jul 2024 13:14:46 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 13:14:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCSoN8O2+qBIHcB7M8WrAxQ1oEcY+o1y/mkWbpqH5nLrWYOwAWZDcwx0NVcp7LQhma3lFIlv7ibzxyLlx9BOfZo+JMOhj1mqtw0BKzhsIjfC1fsNwMhPxQHeRaXmn4S8x8E2AzcKMOSFh22n4Suu2wM/WK+WY4VqCsSS8QrGFWIbPZuYntwIE0GEgP1VUzIYS+PZYFMElM1rHC2c09MIqYHPKrVckxdN4NVs6mTo4okzQEILI9+E2rsMlWSL12s/mLtiBtUbF7nv9ImwkWhRyPmVXKONjYapXR/5Rxaq3YIAT+d+jpxSPji8G4nbH7BVzDoFtliIzScLMkjxK9EPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/41cqbL8DB6dq1aJtHG8H7YQfoxmXeclPFHx30YHAOI=;
 b=Ro1UdBvDyyGk9mqVITaA/pcSzer4aa5KAPZdqE6RaafhQOijsN/24q8MII22MyftmsGnTJcO3Ca1xo3nHXOY1Q4SzP3fLhxPcRuLb0XjOlpBDQ2y+5DFqyJaxut64ObH7DoT0qNG9lGW+arGfIzPNV9hi4+Y9VUdSM8DJMt9iZhxf5B+AMtKCdVii2HbdbclPpLGlpfk/Am3cNUN83/JXFH18SDE5J/UnCce/RYJC+uQ9qdL6pjR0NSFUbipc7JmvgZBDr/Q/VSjp6RjA+FHrJs66PXO68NfYTRab2WkV6lZXjlbWUReW7d3Q5uAzZS4y6pZ04IoeeL3xETvFQQ6mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/41cqbL8DB6dq1aJtHG8H7YQfoxmXeclPFHx30YHAOI=;
 b=ZQDcQFPZc7GUZbmKwnt2xt8JBOepB+Bha6CebZgdSJLh5DAT5x+SBvI5JBxZOW389szoIFZ4RNJBcND7E5nPwMYCmt4qctgurOCFyrtecxSnCnlM6hgebH/8hLHpAAjSvmAca9Uk6ocWsEIgWbTJpTOunP3PewgLbetMYlP/FcE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7298.apcprd03.prod.outlook.com (2603:1096:101:124::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Wed, 31 Jul
 2024 05:14:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 05:14:42 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"jstephan@baylibre.com" <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Index: AQHa4ce8pNnPk1UzTUirk9/L9Gb6lbIQTYkA
Date: Wed, 31 Jul 2024 05:14:42 +0000
Message-ID: <010b7a4944e6063200d64fc3d8bb90da32b87c1e.camel@mediatek.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
	 <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7298:EE_
x-ms-office365-filtering-correlation-id: 1f459baf-9977-4620-873a-08dcb11fafaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TVF1bGRZRkFsamVVNUhYRW1TV1QvMXQydkRndlNqTkR0cFl0SWl4UEJ6RElG?=
 =?utf-8?B?WExLY1NWWU94Q3Bpc3dJb0hKZWdyRW9LSmtSVHl5eUNzaVJnS0JuNGNER2tV?=
 =?utf-8?B?Vjg3b0VQdWpmOXBxOFRYVzNjZERweDgrRkZqWlRvN0VpQ1h1eGRDT3FGdnZl?=
 =?utf-8?B?VmJScFI1K294SUViYW1vSkRDRWNSY2FncmV6WnpiKy9kQ1hXcDdzL2kydG5i?=
 =?utf-8?B?aEExejMwUG5SVWhVL1lXM2prUUtwTHN0ZjRVUzNhdzhuOWFyZVgyQnNpMEJs?=
 =?utf-8?B?eVZQSHhsV245WHp6NnF3YURFTEtpVjlHMk8xL0R0ZUZBL0ZoM1NEV3JDMksw?=
 =?utf-8?B?ajFiUm9Dbzk3c3NPVVpVd0dsS2FvaWVlampIZTdVK3NoYmVkMFB1T2RxbkV2?=
 =?utf-8?B?S2FYSTEzQUdvZXdTVGVtdWgzZU9GTTRRa2Z1NHgyZWg2WEdhdG1oSzF4ZWdH?=
 =?utf-8?B?YzdxTXhFb3FzS24yc1pnOWVodHAvT3BBT1d3dWdlbUFmanBHbzhoZ2loZ3M1?=
 =?utf-8?B?QWliZnk5NEJCajcvSlJZNFNDcHdpTjl4Q2RLL294Snl6MGY5cVExNjRSVDlY?=
 =?utf-8?B?S3NUbHZNc2V4aGFPT0xhL3M0M1VsbDVMZENPQXppOHNGaFZSdGVPT2Q3MnlV?=
 =?utf-8?B?VjlQZUk5MVJ4K2h2VExPSTNJYkVOOHlqZ3Zyd01VbTZBUmJtZ0ZieXp4MnJm?=
 =?utf-8?B?TW5FYnBFZGFVQ3R6dlhaQ2xkTDhuYW5zN1Q4WnlPdmt4ZW1UVkZXeUlHQnBM?=
 =?utf-8?B?eUFLcFBlYzJzYlFqcFRIditsNUw3L3dKL011UkdDN2wzc3pFWVROZWVMRmFa?=
 =?utf-8?B?TENVdzhXYWhyd0JsK2Y5RWVMdWpDUjdiWXl1c1ZSU3dML3YrRG54WnRJM0ZD?=
 =?utf-8?B?VFRvOURtNUZpYkhlcVVBUzJ1M0VyNnZNUE11am8xekNSUXMyNkRHTXpuQVYw?=
 =?utf-8?B?NEhOK3ZlMHBWc2Q5SzNUc1BYVm9YVlhYYlN6VVAzTWJmWnVpbGlnK2hBaXV2?=
 =?utf-8?B?dElxSXJoWlFCSWxWOTVZYmpaMFFobFA5Vmk4VURpZ3NrcU42Z3ZkU2F4ck93?=
 =?utf-8?B?SHZqaXY0TnNWZE12NmduT1o2S3RIOWRCcERIOVRoWTR4Y1BzNGJIaGh6T0ZW?=
 =?utf-8?B?VTBNY0sraTlZZHZqVUxjaVVnaHRtRENGVkhBcGZxVzg3SE5YSFVLeWlHUHVN?=
 =?utf-8?B?Z0ZPREZmSWhLei9VeHlXNFNsbzljRzBRaVlwTXpaZjBNRGZDY1JnMGljNnBi?=
 =?utf-8?B?ek5mMzJ2Y2JIK3R1LzFSVDNiZjFzTWdaM1lLVm52b0Y5M2h0c01rMElqdXUw?=
 =?utf-8?B?TDh1anBSN0pSZStLNWJQU0kxaXdUeFN4dWUwY21jN1FxVTBzZVVMMHMyRCs4?=
 =?utf-8?B?Q1lkTXBBY2Z1WW9ETWFOOUZPbHZRcjNEOHZJRjc5VkNQRE5pQ1dzOUcxQXI1?=
 =?utf-8?B?MDM4WmdabkdCS1FLWlAzc3cwRVVTUk9jWXdvT1JEcTlzS0xFaityMU83SmQv?=
 =?utf-8?B?WXJrWjNWZzF3N3FzaHY3R1A3VjdJcG1ERWxSMWRrbWJxTENXY3ZxRzJzK1NP?=
 =?utf-8?B?dHRhVlhKakxPc2preDR5UGhyemYxeUJ3NG1yMDlwSGpHcnJvZGluQk9DM1hl?=
 =?utf-8?B?ZE9haUpRUTROQmh6Rjh6TExQODRseHZUd0l6eFRkUjY1dFE2TUw0ZjQ5VjNk?=
 =?utf-8?B?d2plOUpYNytWWGpMN2UrZzF4Z20xL2Q4QUFwUGExRS93NHVIMHN3ZGFtZGpp?=
 =?utf-8?B?VzRLREpyckd2M1NITmtmaU40VVdnWkVKbTQ3M3BBbFZWakN5ek9xK1lZemR4?=
 =?utf-8?B?ZFBjODVYK0NEdm5sMVBlQjVjZHhQbUN6VkMwRWk5WVdFMlVWNFVMcktUbkxm?=
 =?utf-8?B?bHJpU04rK1lQRnJoSjY2aUNGSy9XYjA4a0VuNVRUTlJZeUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T05BM3A3NHg0cEl5cUZ0SktYMDdaVTFrOHlNNWhuWEdQZW85V3oxRjhxMVhr?=
 =?utf-8?B?V1lieGkwQkNoVVptSTJ0Q3Q1eDYwaFpYdTdZQXFCeDU1NlJXejUwdjRDM2NO?=
 =?utf-8?B?TEpmRlNLVlZCRjl6c0tORE9MMFhGYTJCZEk4Rm41V1FVSnQwT1NGSFYreitC?=
 =?utf-8?B?QWE2MGZCSXhtSVR1QWNtWHNmaW9NWEhYT0l4SWFQdWsxN21MdmltYTY4UDk2?=
 =?utf-8?B?ZXFHVld3akY2bjBhT3pjdDlwZlBWZ0F1UHowUjBXemM2eG1WaWg3LzNnZ0RM?=
 =?utf-8?B?VUV5YVNseVVva3ptaWZZVzhVVnBDS3N5VVcyTFltdVdpZGdWb0NqR1MydmhN?=
 =?utf-8?B?M3RkSFpFK2YrMTIrQWFhenFhdHExTE1oT04vWmlEa2JFdzgwNjRXZkVmcFQr?=
 =?utf-8?B?SXkyTXQ5V2NPQ1lsczNCWU11L25sL0o4ZENxQkVXc1lOeGc1enBoTHZ6aHJ2?=
 =?utf-8?B?U2k5ZlZZR0JPQ2RJWFViOXZLSVpxS0Npam1obm1TbFBJMWxnSHo4bFU2UnAr?=
 =?utf-8?B?V1pLY2RtdmM2Rkx2MG4wcERoVDd4a2M2aG14SkJMeWcxd3BNWjFSZ1l0bEJX?=
 =?utf-8?B?ZGVDeThhdDZyTEp5dzFhME9WWVFlY0pvamFGZ3lwcTF4OGlsMFVDbU01NGVp?=
 =?utf-8?B?algwMEt4ZGVISHB1S1Y3ZktySGJhWE56SXozVkNtcVdEUmc1MXZVdEg3UlFl?=
 =?utf-8?B?ZTdxRUttanoyZUhZdWtHOFlOSG9WNDQzb1pvV3AzSSs3UDF4NGN2ZktzVHYv?=
 =?utf-8?B?QzhsT29NUFBFTGczL1VhNnczam1GNEozdkVrMFNxNm1lZmdQYXF1RlFRUHFI?=
 =?utf-8?B?YzVjY0RZbnl5SHV4Z3dwaUhkVVluTGJvU3lIVUxJQXYvNHdqdmE5TTcwajVK?=
 =?utf-8?B?SFJDZ1JtUWJhbmQ2UU56L2xXbTd4WHlicTNyNnZuekVlbjR1VjQvVm9Ucyt1?=
 =?utf-8?B?MFo0MXdyUEs3SkhXSHhUUkxOYWdyajA0ZTY4K3ViWGFtUGQydmF3bG9EeEJJ?=
 =?utf-8?B?V0FOcS91UWtYTlJ5ay9SenJXVnJuZE15VnpXQk5BU1U3eFZvT013NVlDSWdT?=
 =?utf-8?B?NDZaWkNpRm9KQ1hTRmt0WDZqSDZ2NWpHUFN2MjZWVjdnN08yeWt4NDZ2SDc1?=
 =?utf-8?B?NG1udERhR01hZ29ROTJON1VnV2RWZjBRVWFCVmZwZTRZS0ljRkdINmExTEd2?=
 =?utf-8?B?cmxnTmJnMytVcEhjN2RBOWIvMmROVzI0ck5YQlBSTVlNaDZOdDd1QXdXWGdV?=
 =?utf-8?B?VkdWcXJYZVJkWFBSNVp4aG1YUEk2OUlEN3VnRVBOVzhWNU4wZDBEeHU1UURW?=
 =?utf-8?B?QlJLMGRvenpUN1hTRXZGblJrSkZYZE1uTnQvM2JIUmlMdDRMellzTGV1ZVh1?=
 =?utf-8?B?b3JEdmNsZVFJSEFCL0tIUkNPR0JMdjREa1p3MWZFT1BYeFp0M05DMWllREZj?=
 =?utf-8?B?cElhVkp2eVRhRkQ5eTBmeFBLMUNYUzl0Y254QWpXMFNuT2Rkb2hRY3hKUFZF?=
 =?utf-8?B?RStoWWFHbnNNSUtFUjA2SUY0bzBTWDR4V2t3NmlnK3l4czhIQTJveTJxNmJD?=
 =?utf-8?B?OVhqZFd4Nk8xL1VlMHI1ckZjdnU1anpIQ2Rzd3dLcStWVHRPTTAzMWxPQmNu?=
 =?utf-8?B?b3VCL3BTK1ZYbFRSM0xwd2RtQzMxWmtnYU14RG16bEIrZG03bVV2RUlCOFUv?=
 =?utf-8?B?RXJqUTBLQXNMRzNkUlVCWVEySGNiek5xUDQrcWxVQ0szd1NKdzRUMWNHK0U3?=
 =?utf-8?B?dGR0UEpWVW04aUNHVTZHbmZWK3NSSjk0anlvVklpbmNwY1JWNzZGTmhOWXgy?=
 =?utf-8?B?ZktMU2dOUkFheHZWTWlDNXMwMlJqVFlZa2lRK2FxMmxVNm5pUzRuVXlvNTBB?=
 =?utf-8?B?VmIvSFkzMWZ1Tk1OUkRRaWpVU0EvTFZ1U3J1UksrVzZVZkEvNTZiRExLVkcy?=
 =?utf-8?B?R2NLWW5UMTRGVERTYXUxZlgyY0xlbVN0YW9NSUxEZUM5VTlyejI3Q0ZnVEVS?=
 =?utf-8?B?TkZ3ejBiVkhVRURPaHIyckxUbFhldlVRYXcyOXQrVGd1Y3JUTzhqbC82SjJj?=
 =?utf-8?B?TTVwcXNrSUZyUlN0c2lvUFBXNGpndlBPRHY0Q0xsVUJuSE1QamViZlFJSUpk?=
 =?utf-8?Q?xIMyp+TC36bJq4NQ57Srgkhf9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F5F85D62C91144799808377900BC5CD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f459baf-9977-4620-873a-08dcb11fafaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 05:14:42.8788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wwpT96z+rFNPFLk+Qz+XGyt/8Wri/hzHOsiqp5HQH5jin3Vqlsvk2RgAPCBbfE5ptaYfxM3tvIK76OSEmPU82Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7298
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--18.957200-8.000000
X-TMASE-MatchedRID: oTBA/+sdKab4OiVTWoD8RCa1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCkttpN+KVVd9syNb+yeIRAq19kcMOF8gV9nH6NX3JoGqItL
	8M7QRoxdWYmumQvMouRpMhWxtLWkbKmzIo+yV5o8XKqR+w9a7UDFcf92WG8u/yWCL+8tLbvYuLL
	rhEK94BlHxst/OzmdlwbNLek7vkoNoAILruplAqp4CIKY/Hg3AwWulRtvvYxTUHQeTVDUrItRnE
	QCUU+jzjoczmuoPCq2UaKyXM9u1qY/HuZDvX6rK3byawVYYxIWSyo64UYJ3KX1R25kJZOuH
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.957200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	87E2041CBE03A81087D01554957D4AA5235B2D20047AB6D86DDE47A3601A0F8D2000:8

SGksIEp1bGllbjoNCg0KT24gTW9uLCAyMDI0LTA3LTI5IGF0IDE2OjQ4ICswMjAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
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
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICtzdGF0aWMgdm9pZCBmbXRfdG9f
c3BhcmFtcyh1MzIgbWJ1c19mbXQsIHN0cnVjdCBtdGtfY2FtX3NwYXJhbXMgKnNwYXJhbXMpDQo+
ICt7DQo+ICtzd2l0Y2ggKG1idXNfZm10KSB7DQo+ICsvKg0KPiArICogU0JHR1IgdmFsdWVzIGNv
bWluZyBmcm9tIGlzcDUuMCBjb25maWd1cmF0aW9uLg0KPiArICogbm90IHRlc3RlZCBvbiBpc3Ay
LjANCg0KSSBkb24ndCBrbm93IHdoYXQgZG9lcyB0aGlzIGNvbW1lbnQgbWVhbi4NClJlbW92ZSB0
aGUgY29kZSB0aGF0IHlvdSBkb2VzIG5vdCB0ZXN0IGFuZCB5b3UgY291bGQgcmVtb3ZlIHRoaXMg
Y29tbWVudC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKyAqLw0KPiArY2FzZSBNRURJQV9CVVNfRk1U
X1NCR0dSMTJfMVgxMjoNCj4gK2Nhc2UgTUVESUFfQlVTX0ZNVF9TR0JSRzEyXzFYMTI6DQo+ICtj
YXNlIE1FRElBX0JVU19GTVRfU0dSQkcxMl8xWDEyOg0KPiArY2FzZSBNRURJQV9CVVNfRk1UX1NS
R0dCMTJfMVgxMjoNCj4gK3NwYXJhbXMtPndfZmFjdG9yID0gMTsNCj4gK3NwYXJhbXMtPm1vZHVs
ZV9lbl9wYWsgPSAweDQ7DQo+ICtzcGFyYW1zLT5mbXRfc2VsID0gMHgyOw0KPiArc3BhcmFtcy0+
cGFrID0gMHg1Ow0KPiArc3BhcmFtcy0+aW1nb19zdHJpZGUgPSAweDAwMEIwMDAwOw0KPiArYnJl
YWs7DQo+ICtjYXNlIE1FRElBX0JVU19GTVRfU0JHR1IxMF8xWDEwOg0KPiArY2FzZSBNRURJQV9C
VVNfRk1UX1NHQlJHMTBfMVgxMDoNCj4gK2Nhc2UgTUVESUFfQlVTX0ZNVF9TR1JCRzEwXzFYMTA6
DQo+ICtjYXNlIE1FRElBX0JVU19GTVRfU1JHR0IxMF8xWDEwOg0KPiArc3BhcmFtcy0+d19mYWN0
b3IgPSAxOw0KPiArc3BhcmFtcy0+bW9kdWxlX2VuX3BhayA9IDB4NDsNCj4gK3NwYXJhbXMtPmZt
dF9zZWwgPSAweDE7DQo+ICtzcGFyYW1zLT5wYWsgPSAweDY7DQo+ICtzcGFyYW1zLT5pbWdvX3N0
cmlkZSA9IDB4MDAwQjAwMDA7DQo+ICticmVhazsNCj4gK2Nhc2UgTUVESUFfQlVTX0ZNVF9TQkdH
UjhfMVg4Og0KPiArY2FzZSBNRURJQV9CVVNfRk1UX1NHQlJHOF8xWDg6DQo+ICtjYXNlIE1FRElB
X0JVU19GTVRfU0dSQkc4XzFYODoNCj4gK2Nhc2UgTUVESUFfQlVTX0ZNVF9TUkdHQjhfMVg4Og0K
PiArc3BhcmFtcy0+d19mYWN0b3IgPSAxOw0KPiArc3BhcmFtcy0+bW9kdWxlX2VuX3BhayA9IDB4
NDsNCj4gK3NwYXJhbXMtPmZtdF9zZWwgPSAweDA7DQo+ICtzcGFyYW1zLT5wYWsgPSAweDc7DQo+
ICtzcGFyYW1zLT5pbWdvX3N0cmlkZSA9IDB4MDAwQjAwMDA7DQo+ICticmVhazsNCj4gK2Nhc2Ug
TUVESUFfQlVTX0ZNVF9VWVZZOF8xWDE2Og0KPiArY2FzZSBNRURJQV9CVVNfRk1UX1ZZVVk4XzFY
MTY6DQo+ICtjYXNlIE1FRElBX0JVU19GTVRfWVVZVjhfMVgxNjoNCj4gK2Nhc2UgTUVESUFfQlVT
X0ZNVF9ZVllVOF8xWDE2Og0KPiArc3BhcmFtcy0+d19mYWN0b3IgPSAyOw0KPiArc3BhcmFtcy0+
bW9kdWxlX2VuX3BhayA9IDB4ODsNCj4gK3NwYXJhbXMtPmZtdF9zZWwgPSAweDEwMDAwMDM7DQo+
ICtzcGFyYW1zLT5wYWsgPSAweDA7DQo+ICtzcGFyYW1zLT5pbWdvX3N0cmlkZSA9IDB4MDAwOTAw
MDA7DQo+ICticmVhazsNCj4gK2RlZmF1bHQ6DQo+ICticmVhazsNCj4gK30NCj4gK30NCj4gKw0K

