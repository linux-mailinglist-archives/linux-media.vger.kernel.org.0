Return-Path: <linux-media+bounces-20556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD50F9B5A4D
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 04:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CAD21C20FF0
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 03:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D75199222;
	Wed, 30 Oct 2024 03:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NRE6/p7e";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="lZ75D+UX"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530E218B09;
	Wed, 30 Oct 2024 03:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730258475; cv=fail; b=tKVE3WtLbzZUAEgk5PNCCKUIqwdby5cjiCPrArMgMt2/iBtAEKlFYnEegDpsdWlQ03lDCFvQnEOYm5vP8/1t4g/4Czt1elPlWTE4muO1GVHUnI16a7RcwGIhOEP8D9NcnI9iXHUsccD9xSrEmOHIQLahESTkYQzr/E54avjs820=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730258475; c=relaxed/simple;
	bh=S+edMhDo5tcTWncCJQNVQs8FfBvKTsl0tV5tLQVh3Oo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J6mmrQm6RVSQY/eYJrEKRAo1RcEu1dFzqk18TjD6mhd6YntXlq5DPLtdT0pc3qO+qvvl5cEC5yxyr8+STfpWHcXhxyr7yBkhWhZ+ExbzbLtpiedM3T6MQEdcR1a8f3sFYZciphMIhTvkNrJIaQoLuJgtKG/4+dHl73Bb8nk7uOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NRE6/p7e; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=lZ75D+UX; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: febdd6ae966d11efbd192953cf12861f-20241030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=S+edMhDo5tcTWncCJQNVQs8FfBvKTsl0tV5tLQVh3Oo=;
	b=NRE6/p7evDnnri0Q+As84lORIHs5iaZAvpYalzTOMUahcrX+IYZSMypjdojsiZaFJQKLhnESwbSQmOpOGWz8Cq1Cmg8S+NrK7x6zqQrYB9lqAxCQ803AMkb9+gxk3mntpy/4i3hpTYQyB8wOezCKJwoxJqORxzLc4zZUwnJ1ox8=;
X-CID-CACHE: Type:Local,Time:202410301121+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:8111a756-cb9c-44db-a047-ff44444c9b5d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:185244e7-cb6b-4a59-bfa3-98f245b4912e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: febdd6ae966d11efbd192953cf12861f-20241030
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 620633949; Wed, 30 Oct 2024 11:21:04 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 30 Oct 2024 11:20:59 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Oct 2024 11:20:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQbruObS690T4sTZnzCR3X+SaJ6PbADjhpOLGGGJ3MZZbt/FDQ63gga5+1PQnT1R8WZHIldTqKAs1J7m1DuB5GufhHh6QnAgGAzDWLx8qQadD6PNXKVDx0Mp2/qMb3ZM9f3RYF+pibWeSxvG4sUxac8jaxy2NPj/FIISXSDwdzIBMiRMjN59M/zdZkQEL3ZdQa7Tlccp91wZyqSKb3xDLrB8W8lbrL+6TDI75dKhe03ctpRYkdTqL1iVTrr8VTgYPt+mKl4qwVMvfU3oGJY3vrffbEi68FXuVCUco19Bnd7n91oHFjqv6II4whPcwtvRTkl/8wlFIclw1q3NGCECdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+edMhDo5tcTWncCJQNVQs8FfBvKTsl0tV5tLQVh3Oo=;
 b=UmWjOFISkChxQ90lCa/UumraKqmmB33fRLiA88ZXPlN0bYbQ8iR+kPyiawbv0rnjg0wUmuMXWInUmd7fZdIHsN6/B6X2zsZJewk1rioqP/bXQqFUYKT/egjTN4ZkAAefhLROScn3ATU2WbZbaP5JbpFT1Af5q8mbonanw2rdV+qbvJthbqmB6egjpl6haDInrR+YyPAkcCapGgfyPVw+CtZ9Y2v4KQCpezC3Rq0eYq77JI/IPTHBYWY97QVlsG0MccUIZdPBtZoD8mWzBTMWiu9mnicgQtHpBqnHy2Y51VNkM5KQLRiil6RTuJ2dPcyQBgWs/psUMy+roOGjgWl2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+edMhDo5tcTWncCJQNVQs8FfBvKTsl0tV5tLQVh3Oo=;
 b=lZ75D+UX+Qn8OV9fXwg+PHubsxnyUEk1lp8QRPVEN/5xhbSOIdkk0/rOdjQbmtGrezH15Hx5N+OI9P4+XQm+D9qPDDiP6o3fnBX0KGOFUrRq7G4hJU2A6IRfUntpURmJWNqCN4e/O2N64cAApwHC8Zjo1K3RqsZxkS/2dsS0ois=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7359.apcprd03.prod.outlook.com (2603:1096:101:14a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 03:20:55 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Wed, 30 Oct 2024
 03:20:55 +0000
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
Subject: Re: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Topic: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarKdbLsAgAFUPYA=
Date: Wed, 30 Oct 2024 03:20:55 +0000
Message-ID: <590a078c46847d605e3e35ff404d774c4d36205c.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
	 <3757822556f581a6e79a6f6572bb6445c0f1d147.camel@mediatek.com>
In-Reply-To: <3757822556f581a6e79a6f6572bb6445c0f1d147.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7359:EE_
x-ms-office365-filtering-correlation-id: 75116e82-3bf2-4bcc-c800-08dcf891dda3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RnhYaEdMSzIrVHNFMjFkNXJGc1lZejdrUEFhWnpuWHQ1MTdFUUNQMURwMFdW?=
 =?utf-8?B?dEZ4MUtkRm51TWt3aUdwRnlGcEsvOHllWVJ3S3JrdkxSYnBQMjhyVlplTmVx?=
 =?utf-8?B?blozbzF3U0czczlTaDZWMlFNM3hxOTBxa09TZkpyaHoxUCt5UEFmNXpxWjZh?=
 =?utf-8?B?VDh4VVV4OWN6TEpWS0VzbEJpODRNNEtZYU0rQ1h4OVY1ay84L1FrRkVzbVBI?=
 =?utf-8?B?M0J5NDBtS1A5bWRRT0ljVWhjY1lBUG9LcG9LTkIvSHNvM0VhM1J6N0V0OG0x?=
 =?utf-8?B?ckErWHpHSHAyN3RoTkNpdzZnU0k1bzVpTmQrbFBnTVdPTDZRb0paNFFLUFJr?=
 =?utf-8?B?aGdNcWRlNjhhNUN3dUI4Z3dmREFwb2pwc1I0L21BQjlKL0Z3T213ZW1hbVcx?=
 =?utf-8?B?MFkvaGhoWW84cUNUdGpmZHdFQWwxMDRkMng0WldoelZuakV1d0g0KzZBd0pN?=
 =?utf-8?B?YTcra3g2dUZML3I5ampxSTJ6TUppaWFQUXF0ZDhneXRZM1JiSkRoZHBHV2pV?=
 =?utf-8?B?SDNZZ0xNa2sranFnQ2lRaGUvZ2pCYTVhekIydzBJUll2dzlhYW9acG42dWcz?=
 =?utf-8?B?WkplbUcxSXVLcUlQK0NVUGthREtPb29XbFJpV0JUWjBQWVhZOUNZT2QrVnNj?=
 =?utf-8?B?M2dnSGVLTFNZekE1M29Sbm9BR3dpQnRrMFdKQWJnN2ZuRU1sQkoyTkZZVzZl?=
 =?utf-8?B?M2tBb0tPR3lxQ2lDSHEwbFYzVmJkLzZrSityYTNVUXdGZEw0T0ppNnNHOGM1?=
 =?utf-8?B?Y1FYbjN4R1VQcVB3ejFaYVhPdnhZbE9MRC9COHU2SlQwSmgzb3pzVHVvTjhh?=
 =?utf-8?B?cHhlb1Y1ZEVJdXdCcGV5dnU3bk43aUZibUNGcXFlZ051MnJXT29PL3RuMHE1?=
 =?utf-8?B?S2Y0YkI3S2Vvc2V4UXNoMDFNRXZCa0tnNXlaUGE3b21XcXp1QWREYnZjS0c1?=
 =?utf-8?B?ajdWdXM1bmpBRnZGOGNnVkk0d1ZpTDhtckdZZE9SaWNxWXJkMU9oZGwrTlZk?=
 =?utf-8?B?ZkVnaFJIRldNR29hVk9ibXhOMFV3V05ZMmsvUGtKeTh0ODg1VktZenBDSG9l?=
 =?utf-8?B?TlhiZ2VRUjlzWUVYWkRyTnlIR1h4dnRJbk4xbFgrZlJEM2lhc2phOXhaaVFy?=
 =?utf-8?B?ZU1JbUJ2RlJsT2VsUCt1SG95MEMzcUsrcFFDUldWRnlGK3pHaXJPNGNSQ1dK?=
 =?utf-8?B?NmVXK2lxSlVUWWtkaG5ZYlQxQWdTT2tBNWhYcndVMjNWTnB0Q0RpYng5RWJu?=
 =?utf-8?B?ZUpnQ3JMR1Z3a1lGUk16R1ExL0wyMGhqeHZtb0pjVzVia092QXFvMGg1N3pL?=
 =?utf-8?B?OE40SzB3NmpSMTJnenpqT0s2c1dvQ0xhUVNQcE80Wi82WWJHVTgvVGJsMVZS?=
 =?utf-8?B?cWtEd2dqYUhLVW9oVVZtSEhoTFVyVXRwU2UvTHhlNkhtczR2TGVCbXVTNGtV?=
 =?utf-8?B?V1E1eEgzYm8vbE94TGhNZzN3QWNPb3lwN0dzcnVMRFovT3hhNmpKK0RPQy9F?=
 =?utf-8?B?K011ZFBwWmtNWTA3T1pBQmk3L3M0Skh1VGlXOW5CajhTSFE5V0VTNzdOTm42?=
 =?utf-8?B?OXBSaU1RMlpsSGN4S2NoaDc1UDk0Qjh2WHMwTWlWK3pzZHFGWktMdHM2b2d4?=
 =?utf-8?B?L3JpcWVYeGJIaTR4ZjJrUC9mS2s3QzZ6UEdIQWVzN01XN2tSN2RIY011bUNv?=
 =?utf-8?B?TFIxUFNsZTRFVlZQMFpzZS9aUmx6UzVyQ1pWSHlBSEtQS2xQeFhQTlFYam1h?=
 =?utf-8?B?ZzlkTjd2RUtxN05nVjVTZDhRVUo2dkhNUm5LUXVVZjI0MVJ1VmgxQ1NYOVp4?=
 =?utf-8?Q?0McCaHZKpR9eEMNRfxtPS/yJJXHEu8N8rbro4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlpIaUg1YU80Q2RMbEs0RGkvUHVyRkZJeWtLWGRFK1BpM0dndHhKRnZ6QklL?=
 =?utf-8?B?Q2JHVHFNVzNLeGJUaVZSY01MNDZWcjMvY2VuY1hMUWFsVENsUGRwQ3g2V0Rs?=
 =?utf-8?B?dUgxOVUwU0gvNjBkZUIza1BtTTFJRHMwZTV1RnFOdkVhbEFWd3RVdFA3VThD?=
 =?utf-8?B?UUMrQ3A2UmkrMUljK01CZGhJQktkMjJzVkhZZEREbmJPc3pqNmhmQUgyM1Ey?=
 =?utf-8?B?ZENtaHRSeXU1WUJ2RDNyRFRGb29sUUxnanBVODRWNFRrNXNuTTdGc3pqTURE?=
 =?utf-8?B?M1A3RXU1dHIzb2xYRkhsRGY4Z1FYbEZwdzBaRnpRdUFzYWJkT2VNRXdtQ1ZR?=
 =?utf-8?B?NE9aczVRcVpTVWE4a1FvVHdFK2o2TEpWRVB2SXM1UjBuSm41R29sTWYyRTJD?=
 =?utf-8?B?dVgxODVnamhWdjZUajBHZHFSMisyOXh2RWFrT1RxL1VCeGtPTG14R1M0Qldq?=
 =?utf-8?B?cDV4L2c2bGVaQmNYVXVqalh3a21QNmNXZ0QzT2lhMDRla2pKMG5ZV1hRUHJq?=
 =?utf-8?B?ZXQ4T0Z2VGptT01Ma0FCR29ibHRwT2FBSUhhaGpaTDJ4N1c5a3B0Z1FuOEY3?=
 =?utf-8?B?SGRPNDkxdUpXWWFHZkhTYjRsZjVHVm56U1ZSWXB2alh5YW5wVXBiOFRxcWFG?=
 =?utf-8?B?SXF3ZmRUNlA1aHV2QjA4dUlXQXhWWGRKRWF3ZDJhQnhaNnYzQXhhWGR5Zkw1?=
 =?utf-8?B?OWxlSzNlNkE3UTl5U3RvQk8ycy8rYnhWK1cxRDdGbmNMT1ZUcTNPdVJUMXBt?=
 =?utf-8?B?VGRrWVJ1WTl0WWV0Smx4SEVVbUltdk8wdEFyaGpzUlJ6YzhYemNmK1BEU1pN?=
 =?utf-8?B?b2c0azZCRFp1UHc0R2VEZTZvVzhNbVJDbTM5T3hMaUQwUGZqaWpsVTFkMkxQ?=
 =?utf-8?B?d3ZzZ2o0VHJSZkFUajl0VFpac1p1NURYaVdXTVFkc2E4cWYwTGxnYm5VZ215?=
 =?utf-8?B?S2VlZWJsUW9XV2lPTmYrWG0zSjJPQjZBMkUxRUpPVERBblFJcS84WHBpZkxw?=
 =?utf-8?B?QVNNckhVUUVNUVZ3aFF0bUJDNm9nU284L2dFNnpHZmQ5MVdIY2JVU3dpSTZ0?=
 =?utf-8?B?MnBXSzNFdFJWaWhOemV2dVVoTkJiTUdyK01SMW56Q0xuRklhVGF1b3JJUFlY?=
 =?utf-8?B?U0dBSkwrckEwSWpZWDBmREl6ZmlmTVhNdThNR2ZjUE9WdzZwNTU4QWdjTDR5?=
 =?utf-8?B?amlZdEZXYlV6VkxwYVVMdGRaRHdLM3ZaOVRKV2dYOVRuRGpKZVlsZ2hBNTBM?=
 =?utf-8?B?bVZXMk1sajUwLzV0Wk1XQVEvMEpra2Zid295U1lqcWxwZmxOY3BSVkZaWDc0?=
 =?utf-8?B?MXRMeHl6dnFPdWZvVE5ESUtzcjBrN1BtN1ZHZnNWOUp4SDJqSTkya3hGWWRo?=
 =?utf-8?B?Z25keHpMdUV0dmRmbmFQb1hNMVNKN2M5ZmgxTjd4SmtZOC9tR0czTFpGZ1ZW?=
 =?utf-8?B?bmFRZEIvaldnVFczTlFWeGx3S2Zha2Z1ajNrYktqeWsvcC9ZSmtLK0xuVVI4?=
 =?utf-8?B?NVo4MjYyc3lpcnU0Y2dSK0ZNdWRIaFFNQ2UyQWN6ZnF5dnYzbG5hVkpiYkpD?=
 =?utf-8?B?RWxveHlwTkJCZTFTY0s5bjZ5Zng3SWpyQkd5blpjSWthclN5d1AwR2o1T0tC?=
 =?utf-8?B?NmtLQk9rRWdqaGRJZzRYb0lYc0xnVVNzUmtsTWltREF2NHU4R01hZVQ5bE5T?=
 =?utf-8?B?RE9QbFlTSSt1bVowbUpiQTR4bG51cGcyYjB2V2Z1VkFCVjhJQWJFVE9KWG1M?=
 =?utf-8?B?Z0JZZXBRczQ4d1JycTNWTzlJQkFqSU8wNkdZdXFrYzdYd1dYTVFUbXIyZHJa?=
 =?utf-8?B?eTNkaE9pYW9mZlU2UHVpc2hmc1JiUDQ3QWFtdWt2SGQrNXVSUk16aUZOMU5V?=
 =?utf-8?B?eGgvQS8wa3QzZytYaDRrSlFSSmdvaUZtdFFMdllqMkJJRFVTb0RBMm5vcVRt?=
 =?utf-8?B?SjhiMFZ0aHZ1a0ZZaTU0K21qSEI2VlhocjYrN0JXK2VqMkdxS2l1c2Y0RDVs?=
 =?utf-8?B?REt0SFozMHRTc3dQWE5Sem1GdWhaeWJyaGpRaU56aytEMXNmQzFsMWMzQ041?=
 =?utf-8?B?VW5WNytPYm9lNmpWWGJsNEx1MkV4bFllTmVNNmNrOUk3b1dheUJHUU82aU9I?=
 =?utf-8?Q?h4uo2lluBr7rWXVCrN5SAnR5t?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49623CCC77E44E408227548A5346EBCE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75116e82-3bf2-4bcc-c800-08dcf891dda3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 03:20:55.1801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3onvklEw9d4bD7n+DZ1mxtvkIcjyJE565KhgNRuAQdBrX68JmqXawPxP7KmBjcErP8RkNJNZgw7ZpLTUFOgeqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7359

SGksIFNodS1oc2lhbmc6DQoNCk9uIFR1ZSwgMjAyNC0xMC0yOSBhdCAxNTowMyArMDgwMCwgQ0sg
SHUgd3JvdGU6DQo+IEhpLCBTaHUtaHNpYW5nOg0KPiANCj4gT24gV2VkLCAyMDI0LTEwLTA5IGF0
IDE5OjE1ICswODAwLCBTaHUtaHNpYW5nIFlhbmcgd3JvdGU6DQo+ID4gSW50cm9kdWNlcyB0aGUg
dG9wIG1lZGlhIGRldmljZSBkcml2ZXIgZm9yIHRoZSBNZWRpYVRlayBJU1A3WCBDQU1TWVMuDQo+
ID4gVGhlIGRyaXZlciBtYWludGFpbnMgdGhlIGNhbWVyYSBzeXN0ZW0sIGluY2x1ZGluZyBzdWIt
ZGV2aWNlIG1hbmFnZW1lbnQsDQo+ID4gRE1BIG9wZXJhdGlvbnMsIGFuZCBpbnRlZ3JhdGlvbiB3
aXRoIHRoZSBWNEwyIGZyYW1ld29yay4gSXQgaGFuZGxlcw0KPiA+IHJlcXVlc3Qgc3RyZWFtIGRh
dGEsIGJ1ZmZlciBtYW5hZ2VtZW50LCBhbmQgTWVkaWFUZWstc3BlY2lmaWMgZmVhdHVyZXMsDQo+
ID4gYW5kIHBpcGVsaW5lIG1hbmFnZW1lbnQsIHN0cmVhbWluZyBjb250cm9sLCBlcnJvciBoYW5k
bGluZyBtZWNoYW5pc20uDQo+ID4gQWRkaXRpb25hbGx5LCBpdCBhZ2dyZWdhdGVzIHN1Yi1kcml2
ZXJzIGZvciB0aGUgY2FtZXJhIGludGVyZmFjZSwgcmF3DQo+ID4gYW5kIHl1diBwaXBlbGluZXMu
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUtaHNpYW5nLllh
bmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiANCj4gW3NuaXBdDQo+IA0KPiA+ICtzdHJ1Y3Qg
bXRrX2NhbV9kZXZpY2Ugew0KPiA+ICsJc3RydWN0IGRldmljZSAqZGV2Ow0KPiA+ICsNCj4gPiAr
CXN0cnVjdCB2NGwyX2RldmljZSB2NGwyX2RldjsNCj4gPiArCXN0cnVjdCB2NGwyX2FzeW5jX25v
dGlmaWVyIG5vdGlmaWVyOw0KPiA+ICsJc3RydWN0IG1lZGlhX2RldmljZSBtZWRpYV9kZXY7DQo+
ID4gKwl2b2lkIF9faW9tZW0gKmJhc2U7DQo+ID4gKw0KPiA+ICsJc3RydWN0IG10a19zY3AgKnNj
cDsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKnNtZW1fZGV2Ow0KPiA+ICsJcGhhbmRsZSBycHJvY19w
aGFuZGxlOw0KPiA+ICsJc3RydWN0IHJwcm9jICpycHJvY19oYW5kbGU7DQo+ID4gKw0KPiA+ICsJ
dW5zaWduZWQgaW50IGNvbXBvc2VyX2NudDsNCj4gPiArDQo+ID4gKwl1bnNpZ25lZCBpbnQgbnVt
X3NlbmluZl9kZXZpY2VzOw0KPiA+ICsJdW5zaWduZWQgaW50IG51bV9yYXdfZGV2aWNlczsNCj4g
PiArCXVuc2lnbmVkIGludCBudW1fbGFyYl9kZXZpY2VzOw0KPiA+ICsNCj4gPiArCS8qIHJhd19w
aXBlIGNvbnRyb2xsZXIgc3ViZGV2ICovDQo+ID4gKwlzdHJ1Y3QgbXRrX3JhdyByYXc7DQo+ID4g
KwlzdHJ1Y3QgbXV0ZXggcXVldWVfbG9jazsgLyogcHJvdGVjdCBxdWV1ZSByZXF1ZXN0ICovDQo+
ID4gKw0KPiA+ICsJdW5zaWduZWQgaW50IG1heF9zdHJlYW1fbnVtOw0KPiA+ICsJdW5zaWduZWQg
aW50IHN0cmVhbWluZ19jdHg7DQo+ID4gKwl1bnNpZ25lZCBpbnQgc3RyZWFtaW5nX3BpcGU7DQo+
ID4gKwlzdHJ1Y3QgbXRrX2NhbV9jdHggKmN0eHM7DQo+ID4gKw0KPiA+ICsJLyogcmVxdWVzdCBy
ZWxhdGVkICovDQo+ID4gKwlzdHJ1Y3QgbGlzdF9oZWFkIHBlbmRpbmdfam9iX2xpc3Q7DQo+ID4g
KwlzcGlubG9ja190IHBlbmRpbmdfam9iX2xvY2s7IC8qIHByb3RlY3QgcGVuZGluZ19qb2JfbGlz
dCAqLw0KPiA+ICsJc3RydWN0IGxpc3RfaGVhZCBydW5uaW5nX2pvYl9saXN0Ow0KPiA+ICsJdW5z
aWduZWQgaW50IHJ1bm5pbmdfam9iX2NvdW50Ow0KPiA+ICsJc3BpbmxvY2tfdCBydW5uaW5nX2pv
Yl9sb2NrOyAvKiBwcm90ZWN0IHJ1bm5pbmdfam9iX2xpc3QgKi8NCj4gPiArDQo+ID4gKwkvKiBz
dGFuZGFyZCB2NGwyIGJ1ZmZlciBjb250cm9sICovDQo+ID4gKwlzdHJ1Y3QgbGlzdF9oZWFkIGRt
YV9wZW5kaW5nOw0KPiA+ICsJc3BpbmxvY2tfdCBkbWFfcGVuZGluZ19sb2NrOyAvKiBwcm90ZWN0
IGRtYV9wZW5kaW5nX2xpc3QgKi8NCj4gPiArCXN0cnVjdCBsaXN0X2hlYWQgZG1hX3Byb2Nlc3Np
bmc7DQo+ID4gKwlzcGlubG9ja190IGRtYV9wcm9jZXNzaW5nX2xvY2s7IC8qIHByb3RlY3QgZG1h
X3Byb2Nlc3NpbmdfbGlzdCBhbmQgZG1hX3Byb2Nlc3NpbmdfY291bnQgKi8NCj4gPiArCXVuc2ln
bmVkIGludCBkbWFfcHJvY2Vzc2luZ19jb3VudDsNCj4gDQo+IEkgd291bGQgbGlrZSBzY3AtcmVs
YXRlZCB2YXJpYWJsZSBoYXMgdGhlIHNjcCBwcmVmaXguDQo+IA0KPiBzdHJ1Y3QgbGlzdF9oZWFk
IHNjcF9kbWFfcHJvY2Vzc2luZzsNCj4gc3BpbmxvY2tfdCBzY3BfZG1hX3Byb2Nlc3NpbmdfbG9j
azsNCj4gdW5zaWduZWQgaW50IHNjcF9kbWFfcHJvY2Vzc2luZ19jb3VudDsNCj4gDQo+IFNvIGl0
J3MgZWFzeSB0byB1bmRlcnN0YW5kIHRoYXQgc2NwX2RtYV9wcm9jZXNzaW5nX2NvdW50J3MgbWF4
IHZhbHVlIGlzIDIuDQo+IE9uZSBidWZmZXIgaXMgY3VycmVudGx5IGRvaW5nIGRtYSwgYW5kIGFu
b3RoZXIgb25lIGlzIHdhaXRpbmcgZm9yIGRtYS4gQm90aCBidWZmZXIgYXJlIHF1ZXVlZCBpbiBz
Y3AuDQoNCkZvcmdldCBwcmV2aW91cyBjb21tZW50LiBBZnRlciByZXZpZXcgdGhlIGJ1ZmZlciBj
b250cm9sLCBJIHRoaW5rIHRoZSBidWZmZXIgbGlzdCBzaG91bGQgYmUgc2ltcGxpZmllZC4NCmRt
YV9wZW5kaW5nLCBkbWFfcHJvY2Vzc2luZywgdXNpbmdfYnVmZmVyX2xpc3QsIGNvbXBvc2VkX2J1
ZmZlcl9saXN0LCBwcm9jZXNzaW5nX2J1ZmZlcl9saXN0IGNvdWxkIGJlIG1lcmdlIGludG8gb25l
IGJ1Zl9saXN0Lg0KVGhlIGJ1ZmZlciBpbiBidWZfbGlzdCBoYXMgZGlmZmVyZW50IHN0YXR1cy4N
CkluIGluaXQsIHRoZSBidWZmZXIgaXMgcXVldWVkIGludG8gZHJpdmVyIGFuZCBzdGF0dXMgaXMg
d2FpdGluZy4NCg0KYnVmX2xpc3QtPiBidWYwKHdhaXRpbmcpLT4gYnVmMSh3YWl0aW5nKS0+IGJ1
ZjIod2FpdGluZyktPiBidWYzKHdhaXRpbmcpLT4gYnVmNCh3YWl0aW5nKQ0KDQpJbiBtdGtfY2Ft
X2J1Zl90cnlfcXVldWUoKSwgdXNlIHNjcCB0byBnZW5lcmF0ZSBjcSBidWZmZXIgY29udGVudCBv
ZiBidWYwIGFuZCBidWYxLCBzbyB0aGUgc3RhdHVzIGlzIHNjcF9nZW5lcmF0ZV9jcS4NCg0KYnVm
X2xpc3QtPiBidWYwKHNjcF9nZW5lcmF0ZV9jcSktPiBidWYxKHNjcF9nZW5lcmF0ZV9jcSktPiBi
dWYyKHdhaXRpbmcpLT4gYnVmMyh3YWl0aW5nKS0+IGJ1ZjQod2FpdGluZykNCg0KU28gdGhlIGJ1
Zl9lbnRyeSBpcyBib3VuZCB0byBidWYwIGFuZCBidWYxLCBpdCdzIG5vdCBuZWNlc3NhcnkgaGF2
ZSB1c2luZ19idWZmZXJfbGlzdCwgY29tcG9zZWRfYnVmZmVyX2xpc3QsIHByb2Nlc3NpbmdfYnVm
ZmVyX2xpc3QgdG8gbWFuYWdlIGJ1Zl9lbnRyeS4NCg0KSW4gaXNwX2NvbXBvc2VyX2hhbmRsZXJf
YWNrKCksIHNjcCBoYXMgZmluaXNoIGdlbmVyYXRpbmcgY3EgYnVmZmVyIGNvbnRlbnQsIHNvIHRo
ZSBzdGF0dXMgaXMgY3FfcmVhZHkuDQpJbiB0aGUgbWVhbnRpbWUsIHVzZSBzY3AgdG8gZ2VuZXJh
dGUgY3EgYnVmZmVyIGNvbnRlbnQgb2YgYnVmMi4NCg0KYnVmX2xpc3QtPiBidWYwKGNxX3JlYWR5
KS0+IGJ1ZjEoc2NwX2dlbmVyYXRlX2NxKS0+IGJ1ZjIoc2NwX2dlbmVyYXRlX2NxKS0+IGJ1ZjMo
d2FpdGluZyktPiBidWY0KHdhaXRpbmcpDQoNCkluIG10a19jYW1zeXNfcmF3X2ZyYW1lX3N0YXJ0
KCksIGFwcGx5IGNxIGJ1ZmZlciB0byBoYXJkd2FyZSwgc28gdGhlIHN0YXR1cyBpcyBjcV9hcHBs
eQ0KDQpidWZfbGlzdC0+IGJ1ZjAoY3FfYXBwbHkpLT4gYnVmMShzY3BfZ2VuZXJhdGVfY3EpLT4g
YnVmMihzY3BfZ2VuZXJhdGVfY3EpLT4gYnVmMyh3YWl0aW5nKS0+IGJ1ZjQod2FpdGluZykNCg0K
SW4gbXRrX2NhbXN5c19mcmFtZV9kb25lKCksIGhhcmR3YXJlIGhhcyBmaW5pc2hlZCB3cml0aW5n
IHZpZGVvIGludG8gYnVmZmVyLCBzbyB0aGUgc3RhdHVzIGlzIGRvbmUNCg0KYnVmX2xpc3QtPiBi
dWYwKGRvbmUpLT4gYnVmMShzY3BfZ2VuZXJhdGVfY3EpLT4gYnVmMihzY3BfZ2VuZXJhdGVfY3Ep
LT4gYnVmMyh3YWl0aW5nKS0+IGJ1ZjQod2FpdGluZykNCg0KSW4gdGhpcyBkZXNpZ24sIGp1c3Qg
bmVlZCBvbmUgYnVmX2xpc3Qgd2l0aCBzdGF0dXMuDQpUaGUgY29kZSB3b3VsZCBiZSBtb3JlIHNp
bXBsZS4NClNpbXBsZSBjb2RlIHdvdWxkIGhhcyBsZXNzIGJ1Zy4NCk1heWJlIHlvdSBjb3VsZCBk
cm9wIHNvIG1hbnkgZGVidWcgdXRpbGl0eS4NCg0KUmVnYXJkcywNCkNLDQoNCg0KPiANCj4gUmVn
YXJkcywNCj4gQ0sNCj4gDQo+ID4gKw0KPiA+ICsJc3RydWN0IG10a19jYW1fZGVidWdfZnMgKmRl
YnVnX2ZzOw0KPiA+ICsJc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKmRlYnVnX3dxOw0KPiA+ICsJ
c3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKmRlYnVnX2V4Y2VwdGlvbl93cTsNCj4gPiArCXdhaXRf
cXVldWVfaGVhZF90IGRlYnVnX2V4Y2VwdGlvbl93YWl0cTsNCj4gPiArfTsNCj4gPiArDQo+IA0K
PiANCg==

