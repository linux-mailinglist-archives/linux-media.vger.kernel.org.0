Return-Path: <linux-media+bounces-12934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3FB90378F
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 11:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F56C1F26423
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 09:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E255A176AA0;
	Tue, 11 Jun 2024 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YqQ7o/HN";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="BAJBjB2F"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57612CCB7;
	Tue, 11 Jun 2024 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718097198; cv=fail; b=FwzeyyKmi/i6ITvqKHREllYZumqop9ZWqUF92pnOMgZWFEmiUrgkge2bRmzZ8QO2Ci6rj30rOR7T4Gydj2ov5xcExYlRgmsZRbr//MJvvyx2akKdSNdibTlD4Shm3AyCbt/b+2UNGc8b7ldXVuDI7spPjifBOtFxDjDqdXNQmKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718097198; c=relaxed/simple;
	bh=zUCM4UcO+fvfS3UogD3T8vQSG7PK/GndzbBFwG1XIr4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IIqRQ2TfFYqBa4Ld0QOmX7kQd778mM90drRgAkiPJOA9KPZSDL58tynGvCHw2PwXWYB6JS+6/+TDSZOkLmyGVPx0XL2Eehw7/KshsBoowpS7bBrENG/GemkEsXIYXWLJOFAPhrwbmcNRemNNbFd6w4PeSaue0rmFCpU3UaQcvYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YqQ7o/HN; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=BAJBjB2F; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d1eb89a027d211efa22eafcdcd04c131-20240611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=zUCM4UcO+fvfS3UogD3T8vQSG7PK/GndzbBFwG1XIr4=;
	b=YqQ7o/HNzibcURk598O2JFoWOZ+1FSJ4tIaIDFM7jTGq5nV58tI9WGZFVQEUmPEUB3VKaqFg0E39QCtO0In+UZ5pLIzOMw8826lE8B9cHClSVpBnxohgXc4p6GBpsWB2YQxA22NpmT2ShqGEmza6RQW7porN6J+UNslVUXwCxwc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:99527e23-5650-4c83-a417-ae6e47b54f39,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:126a7044-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT
X-CID-BAS: 1,FCT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d1eb89a027d211efa22eafcdcd04c131-20240611
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1737133244; Tue, 11 Jun 2024 17:13:09 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Jun 2024 17:13:07 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 11 Jun 2024 17:13:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXwIHtbChmt8TfVR9re38dru2T0x+ka7GBCmE/nbGBrUBHD2yYvTBKQp8m5WIsJZUaEn9UwMzZjCBVDyxy282hv5Fw6vIFXU2ImoVeQSXdPmgAILvHXhsaluQtqxXsJMZHz8whyXMPh6DuMrwhl4HQt9wy96XSQkAK/TWW0dQyPWs6N/OFKnlY4GdZA0r7/aRy6cw487dqkQ7aVEtNQH4bbYO8tbZ08pZ5yaC32TxORKdlrl2Gp5dYewD452QrgJScdP56XV/KZ9MNz1KJ9Icl30SWyeD9ZW6RU0TSSpSoA4xg7kZkRedPoHl5uvljTTT/6JlPTobpJWnEb4e4yv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUCM4UcO+fvfS3UogD3T8vQSG7PK/GndzbBFwG1XIr4=;
 b=AgAE8M1gy7UsQpL1uXUzyXL8939ub2qG0MA2fW65Q0X+CA7aArud5O8TSYylhXc8gkLnkrQtaUS87wclGac9hctod2oGSsjfkJqheSyVzeuZUNZWLRQvWMwtrwFYSPPmjUTkG/f9lXl+moFCjeOe0zDTj0cQJqGxSkYEdnc3aAi7RPRGe9E1qYNATZwjye0nLkxpznyjyz0Ge5rzAKSPuWiXIGSWVvH57SqaaGAch8MrhnYi/VaKEHsgYXLrbw/3yUOUlB84xOfb11w3DXcz/AEKCXvaHm5aKpQLo+zeORru4GAs0flVrZfD/VmmS51WFzCEVcb9uv4LaXdXF318Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUCM4UcO+fvfS3UogD3T8vQSG7PK/GndzbBFwG1XIr4=;
 b=BAJBjB2FFiwLrRNICHDkSpqTQj+rRXM4ijiRWfhVWnuxkDbbYwRb+d/xYdDDIAKUjJ2kYPpJ1bEzPyxamNwmB2lpJxtPtNZNWbXPhgy5s5KIo9iC0O9fzbjCGXRF/d6vPIYIs9pl8/DfDrLb5gcvcKRzXUDoGVhCu6OhLhh90Ps=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7647.apcprd03.prod.outlook.com (2603:1096:820:e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17; Tue, 11 Jun
 2024 09:13:04 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7677.014; Tue, 11 Jun 2024
 09:13:03 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "mripard@kernel.org" <mripard@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"jason-jh.lin@mediatek.corp-partner.google.com"
	<jason-jh.lin@mediatek.corp-partner.google.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"jkardatzke@google.com" <jkardatzke@google.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Thread-Topic: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Thread-Index: AQHarvtlcrCnuWURZEyY7i7vRSJzi7GrIE8AgAEfYoCAA6bygIAAGI2AgBJh9oA=
Date: Tue, 11 Jun 2024 09:13:03 +0000
Message-ID: <705eb69997333ffaf6efec053e376243a3c80265.camel@mediatek.com>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
	 <20240527-determined-sage-piculet-bfec4a@houat>
	 <4828461fa10101eec29e2885bc1aa0e2b7114e7c.camel@mediatek.com>
	 <20240530-inventive-nippy-bee-bb6fa6@houat>
	 <43db5c0959b387ff049dbd285093b076ed1421fa.camel@mediatek.com>
In-Reply-To: <43db5c0959b387ff049dbd285093b076ed1421fa.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7647:EE_
x-ms-office365-filtering-correlation-id: 63ead11a-d336-409b-512b-08dc89f6b2d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|7416005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Rk1vZk1tWFkzUW01bElDR0pTRzdUMzlyWnA3cVQ5WHNvYTgzbXQ0ZjZRQ1g3?=
 =?utf-8?B?Q3pYUG1uL0EvM01GeDU2RVQzZkRUbHBCVTdlZnlweFRsOU00Y29RUDhWSXkr?=
 =?utf-8?B?YjQ5QVZvTWZIekVrWHg5RW1tYU5PQmJiaHBQWmIvWnY5dTUvU3d4ZXp1bEla?=
 =?utf-8?B?cFRiRllHWk85ZWkxb2VDMDFUNUFKU0pRbHMvZklpeXdRZk5UT20zL1J3YVJX?=
 =?utf-8?B?ZzMzOHpEN1E2Ujkyd3BhWGZ5YWtNd2RZUTN2eDNHNzh6dUJHekc0NThXcEd3?=
 =?utf-8?B?ODR0ZXdiOXMvdUk3a0R6V0MyYXgwb0RXTWNVa2RvYld4WDB6bGwrQVNYb1kx?=
 =?utf-8?B?WG55L0RuK29lUGJGMXJ3Ym1VS0ViWENJZlVzczliY0FuekUwOEoxY3lZdVV6?=
 =?utf-8?B?blg2Zk54bEpPSmprOUZyMTRrK0d1VlQrb1hITjBrcURJZDZ2d3ZZZ0F5S29u?=
 =?utf-8?B?MlI5amYwY3FwSFpuMm1BNnVWOERGdFN6RHRRME10bTV2MTV5Z1JvZzIvRDJQ?=
 =?utf-8?B?c2g2b05qcnFBZkFEL1hnMTE4QzV3dnZKLzdXNndaTDFtdUtFVDd5SXRUaXRO?=
 =?utf-8?B?Kzc4L3pDM2k0NUhEM2tJNHVCVldjaENJam9na0NaZGpwd3FTSENDSksxT3RB?=
 =?utf-8?B?cUFkUUtkLzBrUmFxUHZsV056dXU5WTQ5UUlwZ1dJMkdtQldtQXFqdWtTSkt1?=
 =?utf-8?B?RTU2Sk1FZ0VMdENaLzdnOVZ3L1h0VnE1QSt5eml0cW1BZHBHdWVOV3FLUTlh?=
 =?utf-8?B?M0Q5RHdOcU1MWkh0L2c1Q0JIdUpISDVqdUlBOUhtMkpGNjBReHJjemMzNjlF?=
 =?utf-8?B?ZDRXK25jRDRuSklCTVVnRXJoTllpenI4SHhDdERmOHhFcE1IT2dpWG16dGRq?=
 =?utf-8?B?MTY5TDlCa3JWMHJXcFNyWjFsNDlrTEdoMjVkV2k4Q1JjbjJOZjJBa01US0cz?=
 =?utf-8?B?ejZER1hqd3JIeWRHYnhTTjVXb282ellJcnZoemllWDdaQlI1ejI1eEMvaXNH?=
 =?utf-8?B?aGlPZGVZeVJwYW5oeXhRSjdTSHB4K3p0akMrVFNYZEYvQmlZRlRyVkpzNVZ1?=
 =?utf-8?B?VDRKSzY2WTYyV1o1azAzeVdxRVBEdUpPQVprTTNuMExXT1dFL0Z5T1NBclhX?=
 =?utf-8?B?SVpvK1M3WXVudmVLbXYyQmFUajJybEFJOEQ0SWVGQytHQldkYTVBbkRPaVdR?=
 =?utf-8?B?UzRramk0aXRHdWFaNHVwU0tLRTZEOWtna0VqNk5kRjY0WWpOMVBwZkRQQ3BR?=
 =?utf-8?B?S3lDT21jZmJVNkpJTVZmN2hQYk9TMis0bnVaeEgrZUJzU252QTZVWDBRd08v?=
 =?utf-8?B?OVZiNG0xOFg4Um5FTElVb01ob0hhWXRaRWZKNlpENjFBMUFWYnVGQ3F0NnlI?=
 =?utf-8?B?bWNoSkRYaVBSZkc2alhYanFNcU9LVForVGlrZ2E4amk4TTVTT1k0ME5VNnBB?=
 =?utf-8?B?ckJYUGJia3QxZFVJR1Y2ZzVYTU4wQlJmdmorYkJ0UjJOTlhRQjJxdGF4N0Zo?=
 =?utf-8?B?NTJNZG8wMkVYYWdxVmN3M1ZhQ1NZMlYxTHI1RnZKSUEzYXU4OVZtN2IyZ3Zy?=
 =?utf-8?B?VG9QOVVFRUJpOGc3NHljamIwUkdoMUZWSm5JNGdYdmFGR3RxK0VpZ2gwdTBj?=
 =?utf-8?B?MXZ1ZW9yREFRZmFFR3BWQ2t0aFVFYWJpMitITGZIMmVXQXhSR2tnUndvaU1Q?=
 =?utf-8?B?aUlBdHhXNUZjcjBxaXJ0YS92NFpLSEVrdWtaNTc1RDBKOGlhOTBIb2syRVJD?=
 =?utf-8?Q?La/tz8hnOGIBOi6qb5U1mVDwpJ74wGSzEm0VMyD?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTZWcWZKZmp2ak44elp2bkVEUXFIWkFzTCtpT01BVU83eGhrZDVIYUNSaEFP?=
 =?utf-8?B?am9jT3Jka3lYbVBYZ29CUGNObnpVa1pKRlp4ZVVlZXRIVG1uc3dYU1BLTWRF?=
 =?utf-8?B?dGFQZVN3QytCK1FUdlhpZkpVOUE1NXV6OGZXMmFlVzZiQjZDMDNOZXc4RXdM?=
 =?utf-8?B?NkRUQUZ0V1h6bUdzQ3dpMEdZWHFXTTdUY1Z4Zk1taFhMa2lSMCtLV1BQWURa?=
 =?utf-8?B?dmN6M3hTaytWWGdGME5vS2R1QW1ZcENtRlpRQ01sNHZTRERETVZmWW5qOU5u?=
 =?utf-8?B?dFpWK2cvTCtJL2Fyc0xZOFdNRjQwU2wvUzA5MDAxOWMyM1h2WUlkRy9TRXlw?=
 =?utf-8?B?Sno4U0NsYWM1RXNHaHZXaXV6dnVnL1htU3o1NmJhckhWY2dqa2JDMkhnUnhL?=
 =?utf-8?B?M0RyK21USmhuS2RGeFkvVGhPMURSYnZIWUpFQVhlVDZqUnlReGZOTmM0S21J?=
 =?utf-8?B?WFBjTVNxQjdiMkJod2JVWEVFZTRubjlqWnVOUzdWWkgxOFRzcUo2dGUvWHI0?=
 =?utf-8?B?enNwVXY1RHhnM0pLVGd4VjVoUkt0UDAvNGZHK2pHK2JBSWlrbFNyMldrSFVU?=
 =?utf-8?B?b0pzQWhUYi92SHk1ZzduNWpQSVdJaEdpcHVtVWJCRFJmSnZSK0xOanZKZVd6?=
 =?utf-8?B?VldTVEFjV0phcXkzRVMvM1Z1VlN4NU1kbDBPYU5PVkg5SEQ4ZmxWZHlKQjRL?=
 =?utf-8?B?OTNISE1xczZuVWJHODg1bFpRTUFSOGZvUEkwUEdXU0t4WS9LaDJrc2pIdFZw?=
 =?utf-8?B?SGs1SGh2L2Nsb3RzcitHeGJvekxrbXl4UUdMeWxpdU9BVlIvNTIzSTB5YXYy?=
 =?utf-8?B?Y3d1cVpZUWx4emlYMERHWld4RHA1Qjh3Rkc2c1FqRFgzbUNIRi9kOHNEVkRH?=
 =?utf-8?B?RzQvemk3QnhqQnBTOFdwZG9JRU5hVHhKczR3Qlg1VUtpTkRtbjFZZW1qRVht?=
 =?utf-8?B?R295em5wOSt3UlA3aDBZVE43bjB0STRJR3hYSUZRZ1ZFMDNtZ00vaVBobHI2?=
 =?utf-8?B?SnRVM1Z3SFRpbWlrM1dpSXA4MkkweE1xUmJCbUxIYkJpejdIZXpMTW5DK2t1?=
 =?utf-8?B?Z1l6alBtNmFtdWtDL1UrV29zMEd2Q2x2aDhXYXVOaFhYMVN2Tmpobzd6alFU?=
 =?utf-8?B?c0QzSy9qc29TUmdvalY1cE1sQzBJcWNDVVh0OHJRYjFqV1lyLzZWdWswanhO?=
 =?utf-8?B?dm51aDEzQjNEREhCVCtmSW9VNHZ6a3BRendGdXNxMW9Za1ZaYWdRdnRFQkN4?=
 =?utf-8?B?c1NZRHJxN0l6SzJiNGhMWWh3RUxYUWJCR1BKVTFJUC9qbFYzQk0vYkJtaUI4?=
 =?utf-8?B?Uy9rc0RiNXZNY3kzZWRPaHF6N0VXeGM3UEU1UEt3WEdZUFR0d1ZjNkw3a1lK?=
 =?utf-8?B?UWhYem5DWkt0VkJKS3FwdUk4TjNNbnpWM1hrZkhlSGkzY0lSNlJQcnZwV1dr?=
 =?utf-8?B?WW5xYTUxR2lkRmhLcHUwM3RycDNkTFlIQWpOc2ZmQThsS2hpRFdMK2t3ejFw?=
 =?utf-8?B?VmdmSVFUSWdSUnJHWTNjTlNzVGkzNXVyOGd4MlRFWnpsUzVXNCtZSzBmZTFK?=
 =?utf-8?B?WjVKVFhtalZsdUxGRTNRL2dWV2U1SlFydi9wamlDejlhQVIyRlNUc3A1bmtV?=
 =?utf-8?B?U0dsYytTc2xUZXVTakZsNjVXa1creUZKV3lsKzNWRHl0THJzNlpJYUhsOXNl?=
 =?utf-8?B?MjNjZmhvYy9xeVFSN295bU92eUtrMXlQS1Rva2JZb0ZiM0F1cDdHZzhnb0ZE?=
 =?utf-8?B?MjNQdk5udllBeG1kR2NzaEltVTlhQnR3RjVDRFh3NzhNRWdXUHk2MVYzOHMr?=
 =?utf-8?B?dE96cE9xdVVuYmNsM1A0c0xkOUhwNzN0bS9UTWpJR1FNQVZmYy9XeS92di9I?=
 =?utf-8?B?ZkZZWUhOVWJjM002SEFoSTZ4eVlSZFZNUFc2UDlpZCtzTFBnb0FGQWZHakg5?=
 =?utf-8?B?WExWblFlT1JjOENYSjcvblJkNUF1aURFQk9qYWZRMkdLakVUTWN6NWtTVjkr?=
 =?utf-8?B?ZXYrbHVESmxjZ3dBbTFNRTRtTHNzeEhNeVhwMVJuQjdFRjFTQ1Qvb1BHMWZj?=
 =?utf-8?B?QjhmMzZqWVdyMXRuWWxWdmJYZzM3UUkyWjhYNEtxeXMvQ2hjSFdHUUplcWNU?=
 =?utf-8?B?YzlaY3RIWEtvYlhWbDR4ajl0OTlZWCtsOVNTRG94TGZJaWcvMk1DWDFjZy9s?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3B16FA7C5B85245BE68FD49AA437C24@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ead11a-d336-409b-512b-08dc89f6b2d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 09:13:03.4900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUfpwQw+aX5sEy4NkK5CcTDmZyTvvyQNFjJ9TmyrMRwqGF/qJ429cQlKhwl5BGimBeBAAEglAjH8jJX6u7UDej6+EZb5BVV78kxPGgr0yKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7647
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--19.866000-8.000000
X-TMASE-MatchedRID: oHOSwQSJZWgtqx4vLVZ3FppWgCLYjjT9q/9ouYhuDGSnwjKA2gmo6hRE
	XZwhDuFxZrSQsEnq4VeTu5kEhclEf200sCPwNg7w84dsinZ5e1hzwrLSuuC0ktqCxkzSpW/Xejd
	T9nu61QdN+iktorGlXJurMMf0bt5MbLfoydCzQDPx5KZMlKYS/TFcf92WG8u/GNAPebYwJ/uskQ
	2aQZ051/6UxfLsKhz5p0yCgO9DtmPVBANPT9ZmP7U+IyHhkXf1KFFZAe4nyZ5ZLD9SNJ9sEnIrz
	4haHlKCyfN0KynvEPIlOzx5B5sHMOQTH5TwTA2NSHCU59h5KrEMkbIeqnhWfBS11FlOYRoh9uBY
	yGr8UrPoFXcVyziBPbs9OusH9JJyav6y9O33wRvhqJ6oLOc8QaWO+TWJ05Vprfd0yBY376pLWxh
	h1wyD09zyiSclXSarLZXc2nSL7F1ccQ8eam5EfdIFVVzYGjNKWQy9YC5qGvzmKuxMXtACKKu6xV
	HLhqfxvECLuM+h4RB+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--19.866000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	5A951BECDAA51519365C1465C18F25D189AF2D6764F4A82681CAA7640B57B94F2000:8

SGkgTWF4aW1lLA0KDQpbc25pcF0NCg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+IFRPRE86DQo+
ID4gPiA+ID4gMSkgRHJvcCBNVEtfRFJNX0lPQ1RMX0dFTV9DUkVBVEUgYW5kIHVzZSBETUFfSEVB
UF9JT0NUTF9BTExPQw0KPiA+ID4gPiA+IGluDQo+ID4gPiA+ID4gdXNlcnNwYWNlDQo+ID4gPiA+
ID4gMikgRFJNIGRyaXZlciB1c2Ugc2VjdXJlIG1haWxib3ggY2hhbm5lbCB0byBoYW5kbGUgbm9y
bWFsIGFuZA0KPiA+ID4gPiA+IHNlY3VyZSBmbG93DQo+ID4gPiA+ID4gMykgSW1wbGVtZW50IHNl
dHRpbmcgbW1zeXMgcm91dGluZyB0YWJsZSBpbiB0aGUgc2VjdXJlIHdvcmxkDQo+ID4gPiA+ID4g
c2VyaWVzDQo+ID4gPiA+IA0KPiA+ID4gPiBJJ20gbm90IHN1cmUgd2hhdCB5b3UgbWVhbiBoZXJl
LiBXaHkgYXJlIHlvdSB0cnlpbmcgdG8gdXBzdHJlYW0NCj4gPiA+ID4gc29tZXRoaW5nIHRoYXQg
c3RpbGwgbmVlZHMgdG8gYmUgcmVtb3ZlZCBmcm9tIHlvdXIgcGF0Y2gNCj4gPiA+ID4gc2VyaWVz
Pw0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gQmVjYXVzZSB0aGVpciBpcyB0b28gbXVjaCBwYXRj
aGVzIG5lZWQgdG8gYmUgZml4ZWQgaW4gdGhpcw0KPiA+ID4gc2VyaWVzLA0KPiA+ID4gc28gSQ0K
PiA+ID4gbGlzdCBkb3duIHRoZSByZW1haW5pbmcgVE9ETyBpdGVtcyBhbmQgc2VuZCB0byByZXZp
ZXcgZm9yIHRoZQ0KPiA+ID4gb3RoZXINCj4gPiA+IHBhdGNoZXMuDQo+ID4gPiANCj4gPiA+IFNv
cnJ5IGZvciB0aGUgYm90aGVyaW5nLCBJJ2xsIGRyb3AgdGhpcyBhdCB0aGUgbmV4dCB2ZXJzaW9u
Lg0KPiA+IA0KPiA+IElmIHlvdSBkb24ndCBpbnRlbmQgdG8gdXNlIGl0LCB3ZSBqdXN0IHNob3Vs
ZG4ndCBhZGQgaXQuIFJlbW92aW5nDQo+ID4gdGhlDQo+ID4gVE9ETyBpdGVtIGRvZXNuJ3QgbWFr
ZSBzZW5zZSwgZXZlbiBtb3JlIHNvIGlmIGhlYXBzIHNob3VsZCBiZSB0aGUNCj4gPiB3YXkNCj4g
PiB5b3UgaGFuZGxlIHRoaXMuDQo+ID4gDQo+IA0KPiBTb3JyeSBmb3IgdGhpcyBtaXN1bmRlcnN0
YW5kaW5nLg0KPiANCj4gSSBtZWFuIEknbGwgcmVtb3ZlIHRoZSBEUk1fSU9DVExfR0VNX0NSRUFU
RSBwYXRjaCBhbmQgdGhlbiBjaGFuZ2UNCj4gdXNlcg0KPiBzcGFjZSBjYWxsaW5nIERNQV9IRUFQ
X0lPQ1RMX0FMTE9DIHRvIGFsbG9jYXRlIGJ1ZmZlciBmcm9tIHNlY3VyZQ0KPiBoZWFwLg0KPiAN
Cg0KSSBoYXZlIGNoYW5nZWQgdXNlciBzcGFjZSB0byB1c2UgRE1BX0hFQVBfSU9DVExfQUxMT0Mg
dG8gYWxsb2NhdGUNCnNlY3VyZSBidWZmZXIsIGJ1dCBJIHN0aWxsIGVuY291bnRlciB0aGUgcHJv
YmxlbSBvZiBkZXRlcm1pbmluZyB3aGV0aGVyDQp0aGUgYnVmZmVyIGlzIHNlY3VyZSBpbiBtZWRp
YXRlay1kcm0gZHJpdmVyIHRvIGFkZCBzb21lIHNlY3VyZQ0KY29uZmlndXJlIGZvciBoYXJkd2Fy
ZS4NCg0KDQpBcyB0aGUgY29tbWVudCBpbiBbMV0sIGRtYSBkcml2ZXIgd29uJ3QgcHJvdmlkZSBB
UEkgZm9yIHVzZS4NClsxXTogDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
bGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNDA1MTUxMTIzMDguMTAxNzEtMy15b25nLnd1QG1lZGlh
dGVrLmNvbS8jMjU4NTcyNTUNCg0KDQpTbyBJIHVzZSBuYW1lIGNoZWNraW5nIGF0IFtQQVRDSCB2
NiAzLzddIGxpa2UgdGhpcyBjdXJyZW50bHk6DQoNCnN0cnVjdCBkcm1fZ2VtX29iamVjdCAqbXRr
X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9kZXZpY2UNCipkZXYsDQogICAg
ICAgICAgICBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsIHN0cnVjdCBzZ190YWJs
ZSAqc2cpDQp7DQogICAgc3RydWN0IG10a19nZW1fb2JqICptdGtfZ2VtOw0KDQogICAgLyogY2hl
Y2sgaWYgdGhlIGVudHJpZXMgaW4gdGhlIHNnX3RhYmxlIGFyZSBjb250aWd1b3VzICovDQogICAg
aWYgKGRybV9wcmltZV9nZXRfY29udGlndW91c19zaXplKHNnKSA8IGF0dGFjaC0+ZG1hYnVmLT5z
aXplKSB7DQogICAgICAgIERSTV9FUlJPUigic2dfdGFibGUgaXMgbm90IGNvbnRpZ3VvdXMiKTsN
CiAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQogICAgfQ0KDQogICAgbXRrX2dlbSA9
IG10a19nZW1faW5pdChkZXYsIGF0dGFjaC0+ZG1hYnVmLT5zaXplKTsNCiAgICBpZiAoSVNfRVJS
KG10a19nZW0pKQ0KICAgICAgICByZXR1cm4gRVJSX0NBU1QobXRrX2dlbSk7DQoNCisgICBtdGtf
Z2VtLT5zZWN1cmUgPSAoIXN0cm5jbXAoYXR0YWNoLT5kbWFidWYtPmV4cF9uYW1lLCAicmVzdHJp
Y3RlZCIsDQoxMCkpOw0KICAgIG10a19nZW0tPmRtYV9hZGRyID0gc2dfZG1hX2FkZHJlc3Moc2ct
PnNnbCk7DQorICAgbXRrX2dlbS0+c2l6ZSA9IGF0dGFjaC0+ZG1hYnVmLT5zaXplOw0KICAgIG10
a19nZW0tPnNnID0gc2c7DQoNCiAgICByZXR1cm4gJm10a19nZW0tPmJhc2U7DQp9DQoNCkJ1dCBJ
IHdhbnQgdG8gY2hhbmdlIHRoaXMgbmFtZSBjaGVja2luZyB0byB0aGUgaW5mb3JtYXRpb24gYnJv
dWdodCBmcm9tDQp1c2VyIHNwYWNlLg0KSSB0cmllZCB0byB1c2UgYXJnLT5mbGFncyB0byBhcHBl
bmQgdGhlIHNlY3VyZSBmbGFnIGluIHVzZXIgc3BhY2UgYW5kDQpjYWxsIGRybVByaW1lSGFuZGxl
VG9GRCgpIHRvIHBhc3MgaXQgdG8gRFJNIGRyaXZlciwgYnV0IGl0IHdpbGwgYmUNCmJsb2NrZWQg
YnkgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgZHJtX3ByaW1lX2hhbmRsZV90b19mZF9pb2N0bCgp
Lg0KDQpJIGNhbid0IGZpbmQgYW55IG90aGVyIGV4aXN0aW5nIGlvY3RsIHRvIHBhc3Mgc3VjaCBw
cml2YXRlIGluZm9ybWF0aW9uLg0KRG8geW91IGhhdmUgYW55IGlkZWE/IE9yIHNob3VsZCB3ZSBv
cGVuIGEgbmV3IGlvY3RsIGZvciB0aGF0Pw0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCj4g
PiA+ID4gQWxzbywgSSBtYWRlIHNvbWUgY29tbWVudHMgb24gdGhlIHByZXZpb3VzIHZlcnNpb24g
dGhhdCBoYXZlDQo+ID4gPiA+IGJlZW4NCj4gPiA+ID4gZW50aXJlbHkgaWdub3JlZCBhbmQgc3Rp
bGwgYXBwbHkgb24gdGhpcyB2ZXJzaW9uOg0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gDQo+IA0K
PiANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDI0MDQxNS1ndXBweS1vZi1w
ZXJwZXR1YWwtY3VycmVudC0zYTc5NzRAaG91YXQvDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBJ
IGxvc3QgdGhhdCBtYWlsIGluIG15IG1haWxib3gsIHNvIEkgZGlkbid0IHJlcGx5IGF0IHRoYXQg
dGltZS4NCj4gPiA+IEkgaGF2ZSBpbXBvcnRlZCB0aGF0IG1haWwgYW5kIHJlcGxpZWQgdG8geW91
LiBIb3BlIHlvdSBkb24ndCBtaW5kDQo+ID4gPiA6KQ0KPiA+IA0KPiA+IEkgaGF2ZW4ndCByZWNl
aXZlZCB0aGF0IGFuc3dlcg0KPiANCj4gSSBkb24ndCBrbm93IHdoeSBpdCBkb2Vzbid0IHNob3cg
dXAgYXQgeW91ciBsaW5rLg0KPiANCj4gQ291bGQgeW91IHNlZSBpdCBoZXJlPw0KPiANCj4gDQpo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gv
MjAyNDA0MDMxMDI3MDEuMzY5LTMtc2hhd24uc3VuZ0BtZWRpYXRlay5jb20vDQo+IA0KPiANCj4g
DQo+IFJlZ2FyZHMsDQo+IEphc29uLUpILkxpbg0KPiA+IA0KPiA+IE1heGltZQ0K

