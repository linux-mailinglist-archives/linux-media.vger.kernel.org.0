Return-Path: <linux-media+bounces-45173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B4484BF9C12
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 04:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1EE19352272
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 02:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3545221282;
	Wed, 22 Oct 2025 02:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="U7gAR4/v";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mMWBKYov"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2882717BB35;
	Wed, 22 Oct 2025 02:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761100889; cv=fail; b=AUrQgstyWrsXppivHrJKbAW2hzTGWMoqsfIFKzrJYJrk5+YQyu9CZcgsaz4nGLVPKFQi7gmkcjml9qQz+3myY3Zh1aNYV2wq5vxmOjbby89w/WbvIDJzW7nPqptBemdcne5BjrAB2acHL+c3G69JuuyDcuZoB6x3lEuV/wQeugo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761100889; c=relaxed/simple;
	bh=+FlhXjpq7A6oiEORVB2YEe8qKWHmzphR8nhb1prXeBE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dp/rNfB0ao5cRtxZ3mrrTPu/XZiUqOfYhoFSV88sUMN2JlXgFt4NHtF8IPM/J57+VUgIFPeyPvxufQid3EuP6ayLjBh0z6XW8AqXdypzXkVRe8o1dLbnAaMtC8oA6qoQGwW3y/VfViSsTD3ojKcQMEwGvgHdWsXXDenRvNVCELA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=U7gAR4/v; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=mMWBKYov; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 968108a8aef011f0ae1e63ff8927bad3-20251022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=+FlhXjpq7A6oiEORVB2YEe8qKWHmzphR8nhb1prXeBE=;
	b=U7gAR4/v8ZkbjbOfyse+ZHXDXwKYtpdTfDwSqrjJAiVlc3wbu2oQJlyEEHHSoXs9sm+nL72hXFvMBqp3GhR0Hs+iKPjrz1Auco98SbgAMVjovj/jCzLQVTmGVXMRcY/i3GVqmAk87Okv1tOa85vkodnAYm2+O5nAExKOOvxDxE0=;
X-CID-CACHE: Type:Local,Time:202510221041+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:4dfd283a-e058-473d-9e48-b6ef3a856457,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:5cab2c84-4124-4606-b51d-d5c9eec0e7b9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 968108a8aef011f0ae1e63ff8927bad3-20251022
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1057713931; Wed, 22 Oct 2025 10:41:18 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 22 Oct 2025 10:41:17 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 22 Oct 2025 10:41:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsLe1tCHwoSEy4/uCYXQWeW6HvJy302Z9GujpevN2xMDOzwKmP1A0QBbEcFtkhogs/881t4sPeBvYy5TOoZrIESJ/AkFArM8s1I89tcX3ycgYzLjB9VtDzWU4IxWLjWUWctvpytLhHXBTrRZOAgVI+dW5DFZfmBlmZBpi+jVc8xj2e3qHPR0iihWou2q2O+9md5RTn1l/pKKhmIV3itZFkUUDJCHU1rtB1d9Hs6XRiZmvzvRKHOG1QRa4L/ZWqw7hpQQfrqXRjVKIeaWHUvw4G/laskuW8jvmkawJCza0vCswVG5Bujg/arEE8SxfIMZJhACiu9FKW+bMqrTnJyrWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FlhXjpq7A6oiEORVB2YEe8qKWHmzphR8nhb1prXeBE=;
 b=k3WEpAefUOMIJuMRozAOncGSxt1kkdm94KjQeOmgcalDY/4G3q75CG/xlwBQbttMwV51iiyJLWZieNSLSvbN3tSbbegL7zke+qNq9SmXEqgS/hUJCEzI89fOMrybBIvmdYNnlPXmEDXdtrCLjDpDXoiuOY0z88DnVfUqUsCcjKPq+pstf6K4mW2Ua+Mx+odyrn3bG/hyPBSWR+/Mmh3it+Xzo58ER6u0+6rwWqOhOwko2uCpkaa0m3ixKsY0oMK+JUizgUBD3lACRM0O4/M+4JR6Em+ipCdtj+KpT3oHgVlxakSiwUCNN8GZQP6dpxc9sk38eyxGXlcNWQjCewNETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FlhXjpq7A6oiEORVB2YEe8qKWHmzphR8nhb1prXeBE=;
 b=mMWBKYovp4C9pkmSNi/uPYwzC08d40GCGGG2oDWp30clIZzIVUooP9Dxh5cksSuM95fsC4vxNbsim1a2Kjl8QtkhTRBrH0IkQoW4lz5d3bsRnrMt4j7k0GjZuWeiqLia1secbm+MCsuRGgRikTSc1iXSRpan3S/4uZOH4ugfp2M=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEYPR03MB8152.apcprd03.prod.outlook.com (2603:1096:101:170::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 02:41:14 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 02:41:07 +0000
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
	"robh@kernel.org" <robh@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/8] Enable video decoder & encoder for MT8189
Thread-Topic: [PATCH v4 0/8] Enable video decoder & encoder for MT8189
Thread-Index: AQHcPmM9uqR/mXzLpUaOmumbN0OuvbTE2V+AgAikdYA=
Date: Wed, 22 Oct 2025 02:41:07 +0000
Message-ID: <c6a20acff1f2726b5323500356abb6dcc37f551e.camel@mediatek.com>
References: <20251016060747.20648-1-kyrie.wu@mediatek.com>
	 <eeda0221acbe0a70219fb7d87603d3dfec73f56f.camel@collabora.com>
In-Reply-To: <eeda0221acbe0a70219fb7d87603d3dfec73f56f.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEYPR03MB8152:EE_
x-ms-office365-filtering-correlation-id: 11d80d62-ccd5-4c8d-11a9-08de111473bd
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TzJENWtOblo3TCtldC9DVUVaQ3BENXhaMExKMmN4eE1HSVBNeDhWMDB3d3Nv?=
 =?utf-8?B?bkE4WEc1ZDNETm5UYVl6M1NPWVVXWGRqc0E2aUJjVHJtcGhraDd5UjFhUUZO?=
 =?utf-8?B?VkNhUXVFUVBENXZwYnY4eTU2Kzk1VEo4Sm9LTGp2SjNLS0JQSTE1RmdwZlJL?=
 =?utf-8?B?K29ybG1ORms5WStjOTl1YVhzL2Njbm5DWXZpK0w4QjQvQmNQV1ZDT1RDY09n?=
 =?utf-8?B?OFNSdjJWRkkwdy9uZ2xPQmNFejFod1A0WDJ6a1N0TnBqaVpMbXhQZVk4Wkp0?=
 =?utf-8?B?ak0zcWtLM1VPSzd3K2RQY05rWVZDQUNra0NzS0VVdEs1L0haQ01Xd3ZKMFJS?=
 =?utf-8?B?UVFDeGxldEtmQlNHWWh6WEhuVmt6dDVjZkI3YVg0Z25oWjJtK2E0bEpxb3ho?=
 =?utf-8?B?M2ZYbUE4UkNYd2Qram02eGZyV1lhdnhGSzhtSWFqOGx6WnhVU3Jib1phUEJx?=
 =?utf-8?B?Ny9JSXJidWsrTXlBTzNEb1RpSDQ3aUIzaFJrNGIwQmpSVXl1OFozaEhOUW43?=
 =?utf-8?B?bUx5b1ZHWFZHcjVJUWpxM0tjZ0lkVWlOWEdoMGJySUtmSk5wdEZ1bmRXY2VK?=
 =?utf-8?B?N0p5YVgvU3Q3QWhVeVlEMXE3WEl6Ti9RWmhkWFp3QzYrN1ZocnRqa3dUV0hR?=
 =?utf-8?B?NHc0NFNDckthTGNBeThYUTlKOUYrTHhkWjVQODVuRHhRVmRGMTFqRE5HUWZX?=
 =?utf-8?B?YWFNQWsvWU9EYjlUSDE3ck1yRGovbVFoWW1YaXJGMWhMQS9iNktzeU1KeTg5?=
 =?utf-8?B?c1RJeURyKzIzTGpBYXB4VXZNa3J6R0dmMHZEWDd5RUpwTkdScjdXa05NcHRh?=
 =?utf-8?B?NGFoMnBLUGpjL1c4cDhDRXFlb090Nkg3L1dmOGUyUk84a2RyZWxWU2N6OFdH?=
 =?utf-8?B?QmFZTzZpSHJ2TFJ0ZXA3bk1XT1Z5dkdDUjFtWWZZMHFrbXJSaVBMVHh1Z0tT?=
 =?utf-8?B?L3pKb3dWWG1GWmo0Snk3V3VqdWdKR2pWOWY5QVo0YUVEeWU5SXVSTHVFeGNP?=
 =?utf-8?B?QitseENUckhnSFlIY1NBWkJKbkdENkh5WVlJVGFpb2xGU1RCdU1pbGdQNjJK?=
 =?utf-8?B?NXdEeHhtSFlnVC9mTDlxMUxhUU5yM1JHbUxwSUVpMmE5ZEY1VlJyd3RZTWRl?=
 =?utf-8?B?bVhYaThEREhtTk5NQ3ArbjhaOFNJTFlkZStxc2NnNUkwc09QQStFeWNDTTdU?=
 =?utf-8?B?dGxxa2htTmxvVFE3cjNCeVQxRnc4S0ZQZjFJRUlxOGhrc3NSWW4xeHBkRHIx?=
 =?utf-8?B?VkFVNmE5YVhCMGExYnlMTVZuc2JXandMZlFka2diRTBiTEViUzRETjMrSVdx?=
 =?utf-8?B?UHRCWUFxQmh2MVlhQ054YlVieHF6Yy9QSnZ5dm5PQmYvWVExNnBLanJ1TGMx?=
 =?utf-8?B?MkEwa3JrK05hK2I1T3diR3NOa1VZZFd6OFUyZnJCYkpsTmZhcDB6YUhHaVNP?=
 =?utf-8?B?bEFuM3dLVDhYb3htRG9pL3ZRNXdsdC9aZHErQllHQlh1RjJWQ3ArSHRMMWw1?=
 =?utf-8?B?NE10NVlqS3BOMGhVR05oeExJNlZyQktQKzhWdE1CVEpxaUdiT2draFhnSFhs?=
 =?utf-8?B?MW5kMGtTTGVPVDJTOGgycTVTaXN2Um5SOWFqcE41MTYzcEFyM1FSZjIrRjRr?=
 =?utf-8?B?WG9XSzVNQm9TbzRQSUhXS3N4OGFGb2lvUkhHOEVqYnZ5M3BIY2YydGNNeUZW?=
 =?utf-8?B?U2hzejNNQk1wcE50KzdzTW41SUl3emZDZDZ2azFLOVZIOEo4U2d1Ym8xZXJv?=
 =?utf-8?B?dGFHRi82NW5iRmlaWi9RTTI2NXN5UXVUTEdvNkZzQjBXSXo2b3VQOWtWZ01R?=
 =?utf-8?B?djJQMVVWYTEzK25hSGdlNUxQU1dzRG5QYTZmZVU5THhaZDVoL0V1ckVTMk04?=
 =?utf-8?B?dTdvcHlwZC9LeEo4ZmF1NFpOMEZGenVFWnFZTy9MT0k3dDdrS0pZQ2Z6SDE4?=
 =?utf-8?B?TFhCenlyV3NsbHdsek8rQlBrMUlLT2tDb012QWIyT0pLTFdKVkRoYTlCVTd0?=
 =?utf-8?Q?TZa6dlugco+bRwCwky4QeWGWcxSFGM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlBIeXNJRDlZTFhLcG52SkRycEgrMUZNSVZPUGZJK0lJV2tCVmFvc0hzTjFn?=
 =?utf-8?B?dHNER0dyRmM4NFBkSkk0L2NVNjJ6VFRodXorMEMzUmhQZzBua2Y0cURmVklj?=
 =?utf-8?B?amtrODhDL0hwcDNJaEIxRmUvSDJTSk1zWVNTYkZwSlJPa294Y1dIbE44SWxh?=
 =?utf-8?B?VzFBVXprcDRyaTlsWUFINnZxc3F5QnEvYWE3L3N6MTNVT011a3N3SUVlck95?=
 =?utf-8?B?M1VkRVN6SEtNRnk2bUZ2czNGMXRMWEovK3FpUmtWSkI4N2JzSG5maWI5YnRa?=
 =?utf-8?B?dWgyd01iNWxrVHFLUzhEalZkb1h2QmhJMmhaZkgxK3JNbENlT0daU014dk54?=
 =?utf-8?B?eWlhbVZHdEpHa2RvOTFScEhISDZBLzRla0VVajY2TDdtcXljZGF1MEZvUHcr?=
 =?utf-8?B?MFVSWkdzT0o4UXduZjJObGZVUW0yUFpCaGJlMkFWY0hNNkdPMTIzSzZvRnNK?=
 =?utf-8?B?VmIwcXNZYWlGUU1DSGUzRE1CWjllNGtVSWxqVGNMazhXbnVvYzVMS0ZnZGVk?=
 =?utf-8?B?OG02RzUzbXVhcmxZM3VyZlFwZ2poM2tiSnVhTUZqY1EvcC9IMUx4dWdvKzAx?=
 =?utf-8?B?TEg4SWxWdVhIemEvTSs3cHc5MEtEOS9NSXp4Q0w0bkdseWJlU2lISTVuU1VO?=
 =?utf-8?B?OXo2Mm9rNTFSOUFGcVdVYThsN04rd0ZpNC96TWdvN21mM3dYdFZhYVhEVUR6?=
 =?utf-8?B?b2FDd1ZuQlA5SjFvS1M2bFJuQlNGblNMeGdVUFhLODlqVW5kdkRVS2ZuS2Nx?=
 =?utf-8?B?M0pNblhTNjZKaGtIbVlUMUlsak0wcm1UQ1hIK0hWSit1RmNCYkYyTWdNbmk5?=
 =?utf-8?B?amZIaU53Q1NJWmJnSFBLZzNaM1NsYTlndzlFa090UUhrTkhlWU4wN3hVeTUx?=
 =?utf-8?B?eHBZaytZcDZ3TmdjQVdoRFdKb2kvZUhCYS94YUZCTDZOQ0Nkc3NUT2VmbjhI?=
 =?utf-8?B?UGtkNjF5VURMRXhTNjJxVWdGcjRQZ3pZVE5KTEVWOGlnZGlmZEViVmdZZi9x?=
 =?utf-8?B?UzlIK3BkSFNQZ25PZEk1QTVETlQrck1uR0lSeFl2cHhta041T1pKdTNtdXc2?=
 =?utf-8?B?Y2xqQ2ZOTThtRFJIb08zQ0dzdjNVOEhEWWI5Ukw5bTVzeWJrQUUzaFVna3Br?=
 =?utf-8?B?RS9kT2JlY09tSjZ6N1daRXl1Q1lrTG1ndDZQRVpISDVxQ2tqV2FyM0xBS1Mv?=
 =?utf-8?B?MEViVkdaRnVQNVlRQlkrQmgyNnRCY1NXMG5MZHhMOHlwRmk2bCt1cTljZDRk?=
 =?utf-8?B?aTZ1aklxZ0NjR1NyM2RGejFvVkdaekt6KzVvc2VWZko4WUVtYkRySkpWVjVU?=
 =?utf-8?B?Sm1pSnd0andYZGVHcFAvZWpsUW9QZXlCSDAwT1pueHhzcUVrMitUMzU2NnV2?=
 =?utf-8?B?cmROY0dWeE9HZ3B0aW1vWmhsQ2hxUXRPRnZDQ0FQVmowQVpEdi91dXlxY2hM?=
 =?utf-8?B?ZjJnZ25iaTI5MzNaZmc3YTVSSTJDb0ZPMGFGcnRVM0k1RkhEVnRhZU5FRWVC?=
 =?utf-8?B?OW9oWFFHSmFqYVhBd2lQMUVBVno2R0wzbUo1TUpPWUNURWJyNGNWbXFMOFl3?=
 =?utf-8?B?QUFQWGNwT2xSdEh0Y3ZSallOak1UQkNINGNrM1NPd2RYZkNqTUJOZkR1dHgr?=
 =?utf-8?B?MHBoWUNLV0R2Q1ViQkZNVldjRXp2Z0pjWWIxUUhoaStRalF2cC92cWZnbCth?=
 =?utf-8?B?TjlBZFlNRmJZQWNML3JWOER6bjd4ZVMyOTRiUWNZM2ZWN2V4dytDZ0QwbUp0?=
 =?utf-8?B?Q0JZT1VMWWlWY292Y1YxYnRDOE9GVFh3SUJYMGNnZ0tYRmxRSzZZTTR2Tm9Z?=
 =?utf-8?B?Y3YvVDd4UUladC93WVppNUJaMi9MT1J0Q3NBbjZnRVpBMUg4TUY4WHF5cnps?=
 =?utf-8?B?MGRERG9GajgzS0R3NVluTWpCMWFIeUZ2ZldkcndLK3U0V1pKYkRDRmFpeWt0?=
 =?utf-8?B?Y0UyQ3NxTXJSSW02dWV6UTNoT1dyM1JVRmprTmF6TWViZ2dWNE9BenNxdkFR?=
 =?utf-8?B?VWRSY3hvNlN3MHJMZUY0MWRJUW9qTXE2MllWUnN4dEpONkhabWtyYTQvWFdn?=
 =?utf-8?B?MFA0TTNhL25hUVRlZnp0WldCbERJcHgwSTNPL3RaUkpFdU1iV213MjhHK2gr?=
 =?utf-8?Q?IrSrdcn9UjEm+D3rMZJ3KJ5iy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F5D1A374B629849B0793BDD26D8A53A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d80d62-ccd5-4c8d-11a9-08de111473bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 02:41:07.1602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pa3tS0f7/2ocuKuFspzcqL4e1NE33alUOvhUtQGCPw27hOn3OLm2s5osJXq/lSbTAa6QFsOkVTqC4u/MjTczhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8152

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDEwOjQyIC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIGpldWRpIDE2IG9jdG9icmUgMjAyNSDDoCAxNDowNyArMDgwMCwg
S3lyaWUgV3UgYSDDqWNyaXQgOg0KPiA+IFRoaXMgc2VyaWVzIGhhdmUgdGhlIGZvbGxvdyBjaGFu
Z2luZzoNCj4gPiBGaXJzdGx5IGFkZCBtdDgxODkgdmlkZW8gZGVjb2RlciBjb21wYXRpYmxlLCBw
cm9maWxlIGFuZCBsZXZlbCB0bw0KPiA+IHN1cHBvcnQNCj4gPiBNVDgxODkga2VybmVsIGRyaXZl
ci4NCj4gPiBTZWNvbmRseSBmaXggc29tZSBidWdzLCBpbmNsdWRpbmcgdnAgNEsgcHJvZmlsZTIg
YW5kIG1lZGlhIGRldmljZQ0KPiA+IG5vZGUNCj4gPiBudW1iZXIgYnVnLg0KPiA+IExhc3RseSwg
YWRkIG10ODE4OSB2aWRlbyBlbmNvZGVyIGNvbXBhdGlibGUuDQo+ID4gDQo+ID4gVGhpcyBzZXJp
ZXMgaGFzIGJlZW4gdGVzdGVkIHdpdGggTVQ4MTg5IHRhc3QgdGVzdC4NCj4gPiBFbmNvZGluZyBh
bmQgZGVjb2Rpbmcgd29ya2VkIGZvciB0aGlzIGNoaXAuDQo+ID4gDQo+ID4gUGF0Y2hlcyAxLTIg
QWRkIGRlY29kZXIgY29tcGF0aWJsZS4NCj4gPiBQYXRjaGVzIDMgQWRkIHByb2ZpbGUgYW5kIGxl
dmVsIHN1cHBvcnRpbmcuDQo+ID4gUGF0Y2hlcyA0IEFkZCBjb3JlLW9ubHkgVlA5IGRlY29kaW5n
IHN1cHBvcnRpbmcuDQo+ID4gUGF0Y2hlcyA1LTYgZml4IHNvbWUgYnVncy4NCj4gPiBQYXRjaGVz
IDctOCBBZGRzIGVuY29kZXIgY29tcGF0aWJsZS4NCj4gPiANCj4gPiAtLS0NCj4gPiBIMjY0IHRl
c3QgcmVzdWx0czoNCj4gPiAuL2ZsdXN0ZXIucHkgcnVuIC1kIEdTdHJlYW1lci1ILjI2NC1WNEwy
U0wtR3N0MS4wIC1qMSAtdCA5MA0KPiA+ICAgICAgSlZULUFWQ19WMSAgICAgICA5NC8xMzUNCj4g
DQo+IFlvdXIgc2V0IGluZGljYXRlcyB0aGF0IHRoaXMgU29DIHN1cHBvcnRzIG1vcmUgdGhlbiBI
LjI2NCwgYW55IHJlYXNvbg0KPiB0byBvbWl0DQo+IG90aGVyIGNvZGVjcyA/IEFsc28sIHdoeSBu
b3QgLWoyLCBkb2VzIGl0IG1lYW4gY29uY3VycmVudCBkZWNvZGluZyBpcw0KPiBicm9rZW4gPw0K
RGVhciBOaWNvbGFzLA0KDQpJIHdpbGwgdXBkYXRlIHRoZSBIMjY0IGFuZCB2cDkgY29uY3VycmVu
dCBkZWNvZGluZyB0ZXN0IHJlc3VsdHMgaW4gdGhlDQpuZXh0IHZlcnNpb24uDQoNClRoYW5rcy4N
Cj4gPiANCj4gPiB2NGwyLWNvbXBsaWFuY2UgdGVzdCByZXN1bHRzOg0KPiA+IENvbXBsaWFuY2Ug
dGVzdCBmb3IgbXRrLXZjb2RlYy1lbmMgZGV2aWNlIC9kZXYvdmlkZW8yOg0KPiA+IFRvdGFsIGZv
ciBtdGstdmNvZGVjLWVuYyBkZXZpY2UgL2Rldi92aWRlbzI6IDQ3LCBTdWNjZWVkZWQ6IDQ2LA0K
PiA+IEZhaWxlZDogMSwgV2FybmluZ3M6IDANCj4gPiBDb21wbGlhbmNlIHRlc3QgZm9yIG10ay12
Y29kZWMtZGVjIGRldmljZSAvZGV2L3ZpZGVvMzoNCj4gPiBUb3RhbCBmb3IgbXRrLXZjb2RlYy1k
ZWMgZGV2aWNlIC9kZXYvdmlkZW8zOiA0OCwgU3VjY2VlZGVkOiA0OCwNCj4gPiBGYWlsZWQ6IDAs
IFdhcm5pbmdzOiAwDQo+ID4gDQo+ID4gc2NwIHVwc3RyZWFtIGxpbms6DQo+ID4gDQpodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNTA4
MTEwMTU5MjIuMzI2ODAtMS1odWF5dS56b25nQG1lZGlhdGVrLmNvbS8NCj4gPiANCj4gPiBDaGFu
Z2VzIGNvbXBhcmVkIHdpdGggdjM6DQo+ID4gLS1hZGQgcmV2aWV3ZXIgdG8gY29tbWl0IG1lc3Nh
Z2VzDQo+ID4gLS1SZWJhc2VkIG9uIHRvcCBvZiB0aGUgbGF0ZXN0IG1lZGlhIHRyZWUNCj4gPiAN
Cj4gPiBDaGFuZ2VzIGNvbXBhcmVkIHdpdGggdjI6DQo+ID4gLS1hZGQgSDI2NCBmbHVzdGVyIHRl
c3QgcmVzdWx0cw0KPiA+IC0tcmVvcmRlciBjb21wYXRpYmxlIHN0cmluZyBmb3IgZHQtYmluZGlu
Z3MNCj4gPiANCj4gPiBDaGFuZ2VzIGNvbXBhcmVkIHdpdGggdjE6DQo+ID4gLS1hZGQgdjRsMi1j
b21wbGlhbmNlIHRlc3QgcmVzdWx0cw0KPiA+IC0tYWRkIHNjcCB1cHN0cmVhbSBsaW5rDQo+ID4g
LS1hZGQgSFcgZGlmZmVyZW5jZSBkaXNjcmlwdGlvbnMgZm9yIGR0LWJpbmRpbmdzIGNvbW1pdCBt
ZXNzYWdlcw0KPiA+IA0KPiA+IFRoaXMgc2VyaWVzIHBhdGNoZXMgZGVwZW5kZW50IG9uOg0KPiA+
IFsxXQ0KPiA+IA0KaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJvamVjdC9saW51eC1t
ZWRpYS9jb3Zlci8yMDI1MDUxMDA3NTM1Ny4xMTc2MS0xLXl1bmZlaS5kb25nQG1lZGlhdGVrLmNv
bS8NCj4gPiBbMl0NCj4gPiANCmh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Byb2plY3Qv
bGludXgtbWVkaWEvY292ZXIvMjAyNTA4MTQwODU2NDIuMTczNDMtMS1reXJpZS53dUBtZWRpYXRl
ay5jb20vDQo+IA0KPiBJdCBjb3VsZCBiZSBuaWNlIHRvIHF1b3RlIHRoZSBzdWJqZWN0cywgc28g
d2UgY2FuIGRlY2lkZSB0byBvcGVuIHRoZQ0KPiBsaW5rcyBvcg0KPiBub3QuIEkgc3VwcG9zZSB5
b3Ugb3B0ZWQgZm9yIHNlbmRpbmcgdGhlIERUUyBzZXBhcmF0ZWx5LCBJIGRvbid0IGhhdmUNCj4g
dGhlIEhXLA0KPiBidXQgaWYgbXkgY2hhbmNlcyBzb21lb25lIHdhbnRlZCB0byB0ZXN0IHRoYXQs
IGhlJ3MgbmVlZCBhIHRoZXNlLCBjYW4NCj4geW91IGxpbmsNCj4gdGhlbSBwbGVhc2UgPw0KPiAN
Cj4gTmljb2xhcw0KDQpJbiB0aGUgY29taW5nIHZlcnNpb24sIEkgd2lsbCBhdHRhY2ggdGhlIGR0
cyBwYXRjaCBsaW5rLg0KDQpUaGFua3MuDQoNClJlZ2FyZHMsDQpLeXJpZS4NCj4gDQo+ID4gDQo+
ID4gS3lyaWUgV3UgKDgpOg0KPiA+ICAgZHQtYmluZGluZ3M6IG1lZGlhOiBtZWRpYXRlazogZGVj
b2RlcjogQWRkIE1UODE4OQ0KPiA+ICAgICBtZWRpYXRlayx2Y29kZWMtZGVjb2Rlcg0KPiA+ICAg
bWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6IGFkZCBkZWNvZGVyIGNvbXBhdGlibGUgdG8gc3VwcG9y
dCBNVDgxODkNCj4gPiAgIG1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiBhZGQgcHJvZmlsZSBhbmQg
bGV2ZWwgc3VwcG9ydGluZyBmb3INCj4gPiBNVDgxODkNCj4gPiAgIG1lZGlhOiBtZWRpYXRlazog
dmNvZGVjOiBBZGQgY29yZS1vbmx5IFZQOSBkZWNvZGluZyBzdXBwb3J0IGZvcg0KPiA+IE1UODE4
OQ0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6IGZpeCB2cDkgNDA5NngyMTc2IGZhaWwg
Zm9yIHByb2ZpbGUyDQo+ID4gICBtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogZml4IG1lZGlhIGRl
dmljZSBub2RlIG51bWJlcg0KPiA+ICAgZHQtYmluZGluZ3M6IG1lZGlhOiBBZGQgTVQ4MTg5IG1l
ZGlhdGVrLHZjb2RlYy1lbmNvZGVyDQo+ID4gICBtZWRpYTogbWVkaWF0ZWs6IGVuY29kZXI6IEFk
ZCBNVDgxODkgZW5jb2RlciBjb21wYXRpYmxlIGRhdGENCj4gPiANCj4gPiAgLi4uL21lZGlhL21l
ZGlhdGVrLHZjb2RlYy1lbmNvZGVyLnlhbWwgICAgICAgIHwgIDIgKysNCj4gPiAgLi4uL21lZGlh
L21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtZGVjb2Rlci55YW1sIHwgIDEgKw0KPiA+ICAuLi4vdmNv
ZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2LmMgICAgICAgfCAgOSArKysrKy0NCj4gPiAg
Li4uL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2Rydi5oICAgICAgIHwgIDEgKw0KPiA+
ICAuLi4vdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhdGVsZXNzLmMgfCAgNCArKysN
Cj4gPiAgLi4uL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY192cDlfcmVxX2xhdF9pZi5jIHwgMzIg
KysrKysrKysrKysrLS0tDQo+ID4gLS0tLQ0KPiA+ICAuLi4vdmNvZGVjL2VuY29kZXIvbXRrX3Zj
b2RlY19lbmNfZHJ2LmMgICAgICAgfCAxNCArKysrKysrKw0KPiA+ICA3IGZpbGVzIGNoYW5nZWQs
IDUwIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0K

