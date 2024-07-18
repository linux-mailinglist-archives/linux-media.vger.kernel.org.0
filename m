Return-Path: <linux-media+bounces-15103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1C193468D
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 05:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DB3E1F22040
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 03:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A5338382;
	Thu, 18 Jul 2024 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VesYkwbW";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="tB4Xjot4"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452EB20DE8;
	Thu, 18 Jul 2024 02:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721271595; cv=fail; b=NNP1lAp25UiZdtoc7jmqa/suHjqmnMCeymmd2jX1b1QIEBkm7IR8U1Mij3HI5NJ1Evjds4r+tQNTVhZrbbtETP7ZP9mToeAUgQWnFDk1WncUtJ7pTvtAMT/vKtsZZViWC1hOmtitcDZmwWckS7FO14Qc3Pzbx7TOLMaZKpTu7nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721271595; c=relaxed/simple;
	bh=HaI+a6K12diQSftRArt3j1GDpX+RpFco8FYnRd+gEas=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pW+eJVi73ujtH5YSWQEbvqU3l5YjHTr+spXfzu/Lr3VRVMVDpeswkkZaG6O/fLdY3/OolwghqDsh2sR/9H7q0OaEsBX5nEiG58iYRvpZJMzIeSVPGzPHQa36IzyWEqc2vewPuJOVmB8RZPjIIb7Py7BV1JxPvsH4tW9sjTvTOVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VesYkwbW; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=tB4Xjot4; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ad9de88244af11efb5b96b43b535fdb4-20240718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=HaI+a6K12diQSftRArt3j1GDpX+RpFco8FYnRd+gEas=;
	b=VesYkwbW1pHVtjvz0yiF44ddE3t/bnr18F5OXDUmrFPAOcvTKV4ygYjAfcaUOucgSoUb2ChZpvQ5XjsadKMpQjuQGg0Wc0mkEI+/rgG6Ki8MCVuHgnfKGBnJMMcyCWe1XM15Uavq2YjQw0rMoHVciFUX4wOXKOTnCkyJyL1ldzg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:a8014c8b-8e04-4c6b-be93-b6514141b403,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:cfe8960d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ad9de88244af11efb5b96b43b535fdb4-20240718
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1881231950; Thu, 18 Jul 2024 10:44:39 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 Jul 2024 10:44:37 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 Jul 2024 10:44:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NoofjjkOEN/bCKR9yp2ldNqgwe9iuVd94DTvjGxOM6vG9vITCn+9YFRr7495IpeE++8vrb6Xir8po0qdIlZ7t2wse/An/xzJiINIjetQSvXM2obMK5DUQs4QUIO8BQnFjE0aWWqqfjUcwsVCy78/KdK0B04jNaSxpZInA+ZJUxmqHSiI1E9Blfx0cxorY+Lb16WuEHhutfKP0AqGF0+NEFFv7dTRAcARUlwSo6e7NNQOnFHbkRMORiNOdUBawFn0j1PpasH0auOofNhdS3doEESO0u+zDhG4sJDL0SWm79Ge7DjWF+i5R9zpeEqP+wjbIgME0Jq0tI8rT1aWypHQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaI+a6K12diQSftRArt3j1GDpX+RpFco8FYnRd+gEas=;
 b=EG6LmtZHCVO7j7/3aJlUShiOX16sKX/b4NihML7Sasre4PbVf/pvdFRTAjzMZqv87qleHlM2ae7CeA458NCC/pYXQTK3yCPRgH8Bhn63gcYfTWdUsGqsf5OnRQzLKGQKtQQGwjWOKJ3MhsPsJFRy5IjKx1IC8vf9hW1k/l5LOwpAxlyxYyl1gJv+FVcouxaQrpPR9kPDnklEUUsrosTUwMy1kUJCn7R8UbJCmxQOGj/3hK5+VPFTCoYFV3njgwBJVScpeepTUGoTn3Kq/RmM4kN71Aw32s/YHfq/8FsZQ3Oi9t/C4QqPXa0lrckywbiEIzSG5y5k+5WfWNtv6KlWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaI+a6K12diQSftRArt3j1GDpX+RpFco8FYnRd+gEas=;
 b=tB4Xjot4ZBIsB3kGBN/Q/IM8sUJNCDAlW23pzL4dfFvmbdmaAOMWGL8oGxViFZtZTxp7puSD9Kf4cxnB3s2HM8eD0Zs2BFLc4Ehf8xAl3TNRxDZEOVq97d7//ANV+gp7Zlhf/pFwXVgoxtsVeFYS6pOzZqLm4wCjobHzZwPQUeQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6528.apcprd03.prod.outlook.com (2603:1096:400:1f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Thu, 18 Jul
 2024 02:44:35 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 02:44:35 +0000
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
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, "pnguyen@baylibre.com"
	<pnguyen@baylibre.com>
Subject: Re: [PATCH v5 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Thread-Topic: [PATCH v5 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Thread-Index: AQHazhd5l4rc57nWtkWApqQhVYkmorH73KkA
Date: Thu, 18 Jul 2024 02:44:35 +0000
Message-ID: <647738c5c776a9ec07615e67094c4141fdf051eb.camel@mediatek.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
	 <20240704-add-mtk-isp-3-0-support-v5-3-bfccccc5ec21@baylibre.com>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-3-bfccccc5ec21@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6528:EE_
x-ms-office365-filtering-correlation-id: 2ff87273-6d43-4fea-ad4b-08dca6d38f59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cHBLZW4vaGtBYkVCWDdxN1pLaWFCajR0a0dhbUFrcjk4RkNtYzVrb0ZzRlRG?=
 =?utf-8?B?WFJ3NUJjT05pL0hLLytPQXlvendnTGl0STVNOWVxTktuazM3YmUvSHFwZkJn?=
 =?utf-8?B?UzJoRmtpYWo1MEx4d1Z2aktWSTg4a05tTUJmaUxTRFQvQi9aSVgrbEV4VHZO?=
 =?utf-8?B?TFV4TEJvT1pLZzBqT2pEekV4Rlh4dXhMVEI3cGUwbkdYT3lDTHZacWJBZ0Nn?=
 =?utf-8?B?RjZiUDExaFFjK08wSEhrckZnZ0trL1AzYytrUHRpYmNhb3JleU9JNE5jcVNU?=
 =?utf-8?B?VCtEYWJoOGI2T3JScVlaOGZ4OFdYNTg3dmcxdU5RTDBJOWVKNkZqVjlrWWY0?=
 =?utf-8?B?eXJKSnB1QWlvYTNZQUpDQ2svR3pNdm9DUGFIZlp3dVBEMkJqWTlveFdwRUJx?=
 =?utf-8?B?Q1R2SW5hNlJSbm1JMTVDcDB3dE95Z2FIUEFUNDhBUFBLMDhKcXBnWm42Rkhl?=
 =?utf-8?B?dGVuRldTRzdkTWZRK3BjVkZKN2ZvRm82TVo2SWlnUWJ5alArc3d6K3FaNUFw?=
 =?utf-8?B?VDJCcllOampFWnlZekJHak9CN3c3TUtqbS9pVjZmWWE4NXlRL1NZVkhYZEwz?=
 =?utf-8?B?aWtmV2lZYUFrUnd0enFkTC9zSzF3eXB3QUdMM3lDd2pOV3RKYXNFeUVJSUhu?=
 =?utf-8?B?RGJUNGljVEQzaGNJYXNKZ3J0VWRJVnVVdmdKeDdnU2hZN2JncHhsSW41ZjJX?=
 =?utf-8?B?UWphaWFQamZLMDR5d1ZsSitKK2xUazJVR0pWOS9MTGV1YlF1Tjk5S3VZTDU5?=
 =?utf-8?B?RktkZkR6aFVpN2RCZEs4Rjh6R2dDWG9aT0tPR2ZoRXhwOFljUEdmOXdreXFZ?=
 =?utf-8?B?Skkxbm1aRkxSVzNLSGJuVW1ucmhVRjdyVWhPSnlsUXgxSEtmVjhJZkVpL1dn?=
 =?utf-8?B?SENCWW50eUVvSFFOQ0NPVnRHREhJN3djSWVwWFYvL0ppR0o3TmltWGE1YlA4?=
 =?utf-8?B?VG9iNHNwQndqcDVFZm40WDY3MjVVSTN0aWlpQi9jeUk5MWJRUDl0UUovZi9v?=
 =?utf-8?B?cm9SVTFFa2dGUXJXdnMzTXp5blRvVGU2LytXOU5SRDN2eGgzRWJpL2g1b1VR?=
 =?utf-8?B?dHZPZ2Rjdmw5RXhqcTdxd1ZOQ0p5UXlVZ3Nwc1dvZ3IxaWI0VjJIODlGS09K?=
 =?utf-8?B?T1U1M1RPR0RoOEpMYnZubEppRkRrR2tJK3AybWxpUDVrRlRpTGFVSG1Zdkdl?=
 =?utf-8?B?UmdRZW5tdkZiRXNObjZZanFlZnlpMnd2UTBwMjAyckNrWE1Wc1pOclZPZnM3?=
 =?utf-8?B?VTFzSUtwbjlFejNCczZlVUYwZkVwYUFDYlU4TTE3czRvaVBWNmN0V3VXVDhk?=
 =?utf-8?B?WTRxVWRnYnkxeWRvUm1KUmxyMWJUaWVXUlUxQlJod1dvT2xaUGwzNVcrUm4z?=
 =?utf-8?B?MHNsYzUwMHVUS1lLU1owNGNGSEptVFVNdFZURkR2dHdaSnNoYlpNVEhpaE0x?=
 =?utf-8?B?eEZsNFBqSEdCZ0duVVZzVitPdkpHN2o0SEYxSHZqdzVDaHRvdWpiSldWWm9X?=
 =?utf-8?B?SWljWDRaVXNlOU9TVVRaOEJZcy9OL2Z2cmdWa2pOVWRrOGhZdTRYZ1J5RmdD?=
 =?utf-8?B?Y2VmNTl3aS9DcWlsc1RkTjhRMG9oTUtaUm1PeVlucDJWWVBMM1VSVFFsc2dk?=
 =?utf-8?B?SFN1MVQ0d0ozN05rQjFKOGxhZFdVVnYvZ1Q3SHJLMndrUFZIa2lKeFUzTEZD?=
 =?utf-8?B?c2Q3aTFwcmZaZUxERERyT2NUaTFicXZRazJiUFFFNktiTkNvc3FMbnRnN2Ri?=
 =?utf-8?B?R2VrQ1kyS0dUMit2NENhOHp1bHl0Rzk3OXU5M3A2SEN6N3Y0Yjdqc2N3aWR0?=
 =?utf-8?B?cm41dithc1hxd2IzQU92M3RRYWNtNTJJemxrSzJOdzJGWG1TSFFEOFIyWTFN?=
 =?utf-8?B?OHNIMVB0dEs5czFMR2RuQW9BZ3pDUlIyclo5SHdsOWxSL2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXB3UFBSRkE1c3c1WHY0N3FPRDRkd0M1NXhqcjgrT2RxMEMrdm5Penk2SzFz?=
 =?utf-8?B?RG9yc0VrclF4ZlJ0RmRRNGJTZDlnMU5zdExXNTMrOEhFL3U0aFdaMkJyL0Jw?=
 =?utf-8?B?R1dmNHVmQWEyY0FTOVVndFQrYncwZHVDNUR3VUdGaGJ4cjZJS2lBTVFPTVJW?=
 =?utf-8?B?Y1g4bnBHWlhTNElmakd0UXB4MFQvc3pjS2VuUmFGZ3pPdXVmc3RGMVlVVWww?=
 =?utf-8?B?Q3cwNFhwUGJQVXg2Z3BGaVZQcjZ6WHoyTUgvbzJOOVUzeHJLend6czJiUkNP?=
 =?utf-8?B?djk5aGViYWFmeGlVYlR3ZWhGSWltc2liYm0rN1JYSzNlaklIU0JOdzNrSVNL?=
 =?utf-8?B?aDJ0UThBUCtmMVJITUNFL01GV2l0YVdmMkU3WEJrUG0rUzQwYW9MSUd5ZVp5?=
 =?utf-8?B?RzVpZS9BcFBoVHVYRTFzYXlYYnVjRFllYnhSN3V0RjNFMkJzTWNOcU83Vzhn?=
 =?utf-8?B?WUI3d2RMMU00ejIvVUg3V20rM1Z5WldoaDZnTUhRUVdqVTE4UGxMMk8wMWtO?=
 =?utf-8?B?Vmw1S3Uva3ptSFpWMEZzV3BzSDZRSXRzd3MxZFlKdDBndjY0QVRHY08vMGV4?=
 =?utf-8?B?R2hreURFTjJRdTdFb1plUmV2b1dvTk1vcFhncTRkL1p6dUlRdjZBbGdKTDVp?=
 =?utf-8?B?SU90UXJTWUpCcVNpWXB5Rkk1cWNIOU85SGR4bjVLVmwrU1ZzTGpZSTJJdi9C?=
 =?utf-8?B?YXh1OUgyNjJ0M3ZtMEhuM3YvWWtmS2ppc2paVE5lV2s1UVBBUndDeVRyTDVx?=
 =?utf-8?B?bHlObnJaSWFoWHkyVSsyeGhGMTlwY01wZk1ZMGJBNytrM2NpeHpDcm5tYU1R?=
 =?utf-8?B?TFpiQTk0R0xIN3dWeFNjK05KTjBqYXJMZHVaUnNyU1Q4RVZ0TjR0UndNQ1lW?=
 =?utf-8?B?R050M0xXOGo4clBmM290bnBPRytzTFZXdUxCeEJFQ3RxK2N3eU1kMUU4R21v?=
 =?utf-8?B?bTF5MVUxeUlEWnlpOEEvR01jRGZydGNpR2RveE52UGhPcnNkWklmU01BUmxq?=
 =?utf-8?B?SGRMWWdhQ0JtU2hsNzRYNWtkaWtOL1ZnQ0VwNWxOR1dEcy9TangrNDRZNy9E?=
 =?utf-8?B?MExrSmsraXVmdkEvMmR2YjFBd0FhUUFVbDdDa21qUlJpTjdmOVpBTzdOZlg5?=
 =?utf-8?B?eEd1Rjg1SjM5N0hLbmZ6ZVA3RXZnV0NuRU94OWhkeGpab25zNkFzVVJ0M3k4?=
 =?utf-8?B?eEJaakFzODYwalJhL21KeWNlcFl3dW8xcXMyWk10SEkveUppTlNobDdpZU0v?=
 =?utf-8?B?SFZVQmRLN0JHQXRPWUhqS29iNzBacG9CcGZzUDRZaDNQVjFHeUNITDZXNU9Q?=
 =?utf-8?B?ZHlrb1RZMWc2Tk1pUWRaSWZjRldCR2cvM2JVU1FxWEdjVk9zVCtXaGd5aVhO?=
 =?utf-8?B?TytoRUNIbllIVHV0eUdPRlhTaisvWkoxaDg5T1l1NUlTSVpOMXFDNk9rVnhk?=
 =?utf-8?B?c3IyOGE1c2pRWnp1d2dvckJIazV0RGR3WTNXR2pVMTFRM0pnRUdVd2k4cy9p?=
 =?utf-8?B?eDU4bWw4amQ5OVJZa2NyMnlZSm4ydDFPa21LdmtYK1lxbVNSRHBwS2UrK0Jl?=
 =?utf-8?B?YVlHb1ZPSU03UWVkd3hTaHR1N1gwNjZsV3daK3YrT0NWZ2NjVjc4ZXczWU1H?=
 =?utf-8?B?UWR0RzBMUWZGNnRvV0kxVzlGRGxrRFJxOWphVlBqRWhIRTNzT2VoYWFKNW0r?=
 =?utf-8?B?NXFRdzU3RkEramFkZVFnN0kvM3piMWxER0lXK1JjNUg5dEo3L2ZYcHBzWEE0?=
 =?utf-8?B?SWNOTllTd1VCampYWkIxNEhldUN6ZExVaHBKUDZNNDlqQWUwNm5CRDhteE0v?=
 =?utf-8?B?UjFadjh6SEN5WFkvd0RRMGlsTEc5c1BjUjJHZUo0aEJ1bFBwK0ZyYjJ6dWgx?=
 =?utf-8?B?WnFqM1BWMnlSNTVJcFlVcFpMbzFPN2pQTyt1WVNLQWdUZjdjYzdScnNSaWk2?=
 =?utf-8?B?a2w3US8yS3l4TzZselRXMkhUSDJjYnNmSDVWS0tHc1FRc1ZGU0EySnBiZFJ1?=
 =?utf-8?B?aTMzZjIwb0tXb2pKT2VSMThROHhzc2lLeGpDR2JTQkVkMG91Q0ptUkx5N20x?=
 =?utf-8?B?ZEpINW1OanFPTUVqZ00zUGNEa1pLSEhEeFJYeXVuVUdZUHpVOXF5Um5oVWo2?=
 =?utf-8?Q?g7RB+w1iOZ/eiypN3gE6QfePs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E98126142014B847B2504E5325D6099B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff87273-6d43-4fea-ad4b-08dca6d38f59
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 02:44:35.2909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vlAF99QM7LC7AO38rl/V9sIPl1tN/Gxz4RO98Q3fkbUgnkfIBu9ZGN+YiE/Q1AfmShw0OqIiUKDbCYGXzFQ3MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6528
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.482000-8.000000
X-TMASE-MatchedRID: O/y65JfDwwsOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0qbqzDH9G7eTD1LciJB3541oMfp2vHck9VUazBX+AUFScaQTVtPXXNM8ha
	W4U9IrFpRUHsj/YINIGFuO67PYQBJDPIzF4wRfrDSBVVc2BozSpwhktVkBBrQjvEeq6gAkYarus
	VRy4an8SAHAopEd76v04FSXArU9/F47oBIJy3ds5gB1VKJHq1mYGPJl9MPD9RA3HOpawBi8Q==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.482000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	42C0B6C1B65AD072490629029547383A55F1BC1D9B77080A35FAAC715F43DD1B2000:8

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTA3LTA0IGF0IDE1OjM2ICswMjAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBGcm9tOiBMb3VpcyBLdW8gPGxvdWlzLmt1b0Bt
ZWRpYXRlay5jb20+DQo+IA0KPiBUaGlzIHdpbGwgYWRkIHRoZSBtZWRpYXRlayBJU1AzLjAgc2Vu
aW5mIChzZW5zb3IgaW50ZXJmYWNlKSBkcml2ZXIgZm91bmQNCj4gb24gc2V2ZXJhbCBNZWRpYXRl
ayBTb0NzIHN1Y2ggYXMgdGhlIG10ODM2NS4NCj4gDQo+IFRoZW4gc2VuaW5mIG1vZHVsZSBoYXMg
NCBwaHlzaWNhbCBDU0ktMiBpbnB1dHMuIERlcGVuZGluZyBvbiB0aGUgc29jIHRoZXkNCj4gbWF5
IG5vdCBiZSBhbGwgY29ubmVjdGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTG91aXMgS3VvIDxs
b3Vpcy5rdW9AbWVkaWF0ZWsuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4g
PHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3Ry
ZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
DQo+IENvLWRldmVsb3BlZC1ieTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNv
bT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19zZW5pbmZf
Y29uZiBzZW5pbmZfODM2NV9jb25mID0gew0KPiArLm1vZGVsID0gIm10ay1jYW1zeXMtMy4wIiwN
Cj4gKy5uYl9pbnB1dHMgPSA0LA0KPiArLm5iX211eGVzID0gNiwNCj4gKy5uYl9vdXRwdXRzID0g
NCwNCj4gK307DQo+ICsNCg0KSSB0aGluayB5b3Ugc2hvdWxkIGRpcmVjdGx5IGRlZmluZSB0aGVz
ZSB2YWx1ZSBhcyBzeW1ib2xzIGJlY2F1c2Ugbm93DQpvbmx5IHN1cHBvcnQgb25lIFNvQy4NCg0K
I2RlZmluZSBNT0RFTCAgICAgIm10ay1jYW1zeXMtMy4wIg0KI2RlZmluZSBJTlBVVF9OUiAgNA0K
I2RlZmluZSBNVVRFWF9OUiAgNg0KI2RlZmluZSBPVVRQVVRfTlIgNA0KDQpCZWNhdXNlIHdlIGRv
bid0IGtub3cgd2hpY2ggU29DIHdvdWxkIGJlIHVwc3RyZWFtIGxhdGVyLCBtYXliZSB0aGUgbmV4
dA0KU29DIHdvdWxkIGJlDQoNCnN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3NlbmluZl9jb25mIHNl
bmluZl84M3h4X2NvbmYgPSB7DQogICAgICAgIC5tb2RlbCA9ICJtdGstY2Ftc3lzLTMuMCIsDQog
ICAgICAgIC5uYl9pbnB1dHMgPSA0LA0KICAgICAgICAubmJfbXV4ZXMgPSA2LA0KICAgICAgICAu
bmJfb3V0cHV0cyA9IDQsDQogICAgICAgIC5zdXBwb3J0X3h4eCA9IHRydWU7DQp9Ow0KDQp0aGVu
IG1vZGVsLCBuYl9pbnB1dHMsIG5iX211eGVzLCBhbmQgbmJfb3V0cHV0cyBoYXMgbm8gZGlmZmVy
ZW5jZSwgc28NCml0J3Mgbm90IG5lY2Vzc2FyeSB0byBkZWZpbmUgdGhlbSBhcyB2YXJpYWJsZS4g
U28gZGVmaW5lIHRoZW0gYXMNCmNvbnN0YW50IG5vdywgYW5kIHdoZW4gbmV4dCBTb0MgdXBzdHJl
YW0sIHRoZW4gd2Uga25vdyB3aGljaCBvbmUgd291bGQNCmJlIHZhcmlhYmxlLg0KDQpSZWdhcmRz
LA0KQ0sNCg0KDQo=

