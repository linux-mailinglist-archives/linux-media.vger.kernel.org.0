Return-Path: <linux-media+bounces-21610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9779D3225
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 03:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A7942841BD
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 02:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264B93DBB6;
	Wed, 20 Nov 2024 02:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kvOLhuff";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="EHsnA1S/"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5357C1B95B;
	Wed, 20 Nov 2024 02:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732069319; cv=fail; b=MEXPT60zf0YyEMX7+3Msuw248HtBoCjC8DNkcga5plS2i7p7MboP923AzT9GxNc6SA4WjmKpqgaNh+dxxTTGwGuq+hdNYfDbv/i1/H5Bg7vR/hFhM0yObk+LP1JUIDxxv4uHxIlIylKnOSoI3655zw3d63rqviRd06qOmiEhzA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732069319; c=relaxed/simple;
	bh=lLx88LHlbgEaHUn3yx/VJ31TfhvgjwVkHa0uvZIgEBM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mN2l03wGPcPmUwuMph+DE2fG5mGsszHzRYcjnRHBdi5CLE38wMfIhjpUHjWcU0aXng+fxy2RIv7CI/tHWuNdtKKpI4lnrZlL/YFqFrOLbkaL9MCa5wKQ68IiUUh+wuURTBQ8hM9R0NaimC3IkP3SQ+hUnUd7H0sQQNNe33lmd7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kvOLhuff; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=EHsnA1S/; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3268a2b2a6e611efbd192953cf12861f-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=lLx88LHlbgEaHUn3yx/VJ31TfhvgjwVkHa0uvZIgEBM=;
	b=kvOLhuffEtwSkCfJM1V4c6fKpGOHLfcrciszvReyJHqn/f37zhg5M9yOpElv+KLWrAKB0CVDR1Iy070Mj/vquZWKGdZdYhIrWaJ0FFSkT/fz1DDhecty/92vKD72qG8g8KtJqwOrfOm5Qs/rE9VfIsHbd4AS4uQ4SW6sBUJf+y0=;
X-CID-CACHE: Type:Local,Time:202411201021+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:97b95537-44b3-4a81-9764-47796f8de94f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:791d7da0-f395-4dfc-8188-ce2682df7fd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3268a2b2a6e611efbd192953cf12861f-20241120
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1640547622; Wed, 20 Nov 2024 10:21:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Nov 2024 18:21:47 -0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 10:21:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHT0scbkzRrYPC0pFxVy4Jxc5coqcQyG7PRk3gFZdvMAva/xPSHPinq6tLwE5e7/kx55UYpBU0V0v7uoplr2Upfe2LUuSXdOeokz/Uj5bHsdZM/fgHKYBXpiniK7UlmDtcFjuex97enfuP4/bQUG203KuXzUjgScbRlfYDpM4GoQNfti2ZcEGSff9+SShVmjsehnaiNPkQBxo/RgankW2v+vhpiH2Sru9ZbYTskSwL+wYcBmQf+oF26vgBNU7a4X2r8VQQzgz1iW1KJGEdGXHrXPMR4eTTCEoqnFpGkgjo0WTdNnMFtULBdbxZfKFBmwHlFLc3E5LEiIOJ1tegSIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLx88LHlbgEaHUn3yx/VJ31TfhvgjwVkHa0uvZIgEBM=;
 b=k0AOVPBxcnXB2hbr/c7PV9U1Xx5povYwTxgDeom/qMVeQTUiBRFhWO8+oUV7ehg14TdWcc0CF7pzt9V91iD1PgS1igUFY282541XEfrHomy1xGh1uBkdud/hPiE3toTLohpTFtwchyMWawQLqbWoUrGsBbKHI1ju5JEdRzY88mJucP791wCcTLqBwA8zjIEZLJAi/8hLK98YRM6jkXcF7dp9wBIVP9+yp3XcBPbtSD7ejYzdBQZllRWujJb/VQng/T8QmsEdJRt7N5s9HLHTLSidpG6polwYxm2Ot96fth1o8Lsz2eK6dgNlKwlUf/fRBHgUxNBJExJ2YTywEGn9qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLx88LHlbgEaHUn3yx/VJ31TfhvgjwVkHa0uvZIgEBM=;
 b=EHsnA1S/4IHFxnfGzIfDdM1flxOu7iz3w5pLfOB1NzoA+WuvMvWa0F9kZydQnxtxWNY5zOGujdTTgjnu5r/iYq8paWlje7PLS88K1Om2QsQnu5XIZ57zgVBNJlqPG0vEF5c9Z0DIm+nCx1kX/YmyGGAlaqH5fundw0M57TOmtWY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OSQPR03MB8673.apcprd03.prod.outlook.com (2603:1096:604:298::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 02:21:44 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Wed, 20 Nov 2024
 02:21:44 +0000
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
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbK/sWaA
Date: Wed, 20 Nov 2024 02:21:43 +0000
Message-ID: <16f46f30852c771ae8f787eb6abaa6c92ea3c5f3.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OSQPR03MB8673:EE_
x-ms-office365-filtering-correlation-id: 3f743cbc-9ee1-4461-63fd-08dd090a139c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aFY3VXJtVHpDalNzVGJPVjh1bzBRRW9UcmtQZE9sQ1dmY2lRaVVFVlB5cTBN?=
 =?utf-8?B?ODRvUlJVeXlnUzFyY2loeTJDZkxpUU9zYmVlU1psQm1qLzVlbyszRC8yb2Z1?=
 =?utf-8?B?WlRLbVc0L2MwS2YzWU5Vc25IVml6M3pocFUxaHd2U3RXb3p1ajd1S0NsdlpH?=
 =?utf-8?B?aUJaQ2YvNFNUejBEYWNtWEdwc3JkNXNEdGcybkVKdWVxdlcrTk5uYXZTN1RP?=
 =?utf-8?B?VVp2a1BmZFJUcU1pR2l0a2pnOTliQzZCMDIxZ2hDaDFidzlFdFVQaCtTMG5T?=
 =?utf-8?B?R2FPbmdsSm91a00wdEMrYkhmR21xenhTdXFBUFhkeG9lMTlmeEtZRllURk9z?=
 =?utf-8?B?S2ljbEcvSk5iZWJZakh3R0pIcUsvSEkzTWFrZC9WRkRzbGFSUVJuTmJKdVQz?=
 =?utf-8?B?anUwZTNCYjQvamgwYSs0NWp5QjRHYmsyNGVWajdVOVUrbnJRVUdpZlI3VFov?=
 =?utf-8?B?U1haV2dzN1lGOEN3WC9uUFg0NXpLdXNWNFUwWW5LV0dsY0FIc1l1dko5YUFv?=
 =?utf-8?B?emtRTjV2QTdUQ3hMemR1TnRUS2FSaTVKYnBSVG1tcFpxMVRIenBwM2hyUjdu?=
 =?utf-8?B?aFJpZGEweVF3MDRGcDVwTWVlaDZXZ3kvMk4xZWxBZ2VMUi9oRjlpZmtDRjlj?=
 =?utf-8?B?WXp4MFdXamx3Q1hJMzMvUys3R0orZE9GNXZMN3Z1aFJJZTJpSlhra000V0FO?=
 =?utf-8?B?TUFJR2ZTRmxGYVo0NXlZL01oVEZDNWdLcTBKdEZVODEzbHZNM202T051VlYx?=
 =?utf-8?B?VzZITHdiayszVVJwS3Q4QXZ6TVUyNTAvMVJPMkkyV0ZnSjZrZHh1cENyd2RE?=
 =?utf-8?B?T2ZLd1FKWVE0cUxNVnhmSWZKSWt1TGtIeHRaeTZIUnk5TTBvdTRXaCtDNHNy?=
 =?utf-8?B?QUpHdDhwY1ZnQloyY25FV0FudXk4eFFWUjVVbDkwVDlzcU8vU1JIVlc2eGt6?=
 =?utf-8?B?MmdxdHFSSHJPRUdORWRKZU83ekFxWmtkRlVlN2ZuYlRJU3MrS0kvWFFXQ2Uw?=
 =?utf-8?B?cVMza29wVkl1Z1ZrcVFiRHF5Ynl5cUJ4bGRvQUpxOERMdlZEYzFMVmlZb2Jh?=
 =?utf-8?B?S3dPdUd1TS9hT0JMUlMvVXBISnA2WklONmVXRXU2aWIvSXZCWnZjdTU5Nld6?=
 =?utf-8?B?U3NKS2p2ek0raWtwOThqTEpZdGRkYkVQN3hvMzhIaVM1MU94K01ybmh5N2Fj?=
 =?utf-8?B?bW5VTFgzTkJ0QWs2NGp3VEdabXJTaWNFS2FjRHgydjlYVnJ6ZkVZOU52Wlgr?=
 =?utf-8?B?bm04dDJMdmNaTjN2a3J1d0M5L0RhOWxJMk1nbVYrc212WEdnSnVBci9FaUli?=
 =?utf-8?B?VlM1U1FieXQ0cStYTXczYjdzcWxKQjJhSjhOcmFxNlVRRytJOHlVdUJmWnR6?=
 =?utf-8?B?bGtmZWVleEtneFdEWXlabkZuOGc3R2ZCeDd3ZDV5Q2Y3TG9ZK3dFcCtKT2ZQ?=
 =?utf-8?B?SFNqKzU5aGJXaXljcFpMZnNjS2Evc0I2eFRtWWVkYmREQStwN2MyUzkxclFy?=
 =?utf-8?B?cy9uVDFWZjdRSHlrMXB4N3B5MG5lSXRxZ0x3cURGL0owMlpBMnQwNmZ4dDhN?=
 =?utf-8?B?ckN6YXdja0NtYnpMQlpvUytlSmhYb2FGeE81TzcxWGdhWnk3dUdRb2syMGdK?=
 =?utf-8?B?ZUYwSFNxc2NUcTRIT2NUY2xselFIL093ODNnVHNETW9JV3AySWtlVDlObHdy?=
 =?utf-8?B?aVU1UGNmZ2ZuQ3dtcFJ1ZlZrL041ZElOLzRDQ0txUHpkZ2JPRk1YS1dZV0hN?=
 =?utf-8?B?amRlcHFUdzByUGhPUU0xMjNjMmZWVXlycWVWYVR4eTluaEZ5ZEpzUHBpdGtW?=
 =?utf-8?Q?fZo7Q5CeWghSOKdjuCDIWrQLGKUB6c9bHg3Wc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUZ1V2h5SmM4UGNPcll6NGVtQUEvWU12Zm9VNmVvNFF1RE8zWnF1Q1h0OHcv?=
 =?utf-8?B?eklSSCtHR2tXYW1KaGI3VXk2Q2FUM1VxVDFhdmdLMWdqT3FHRTlSQ1owWFcz?=
 =?utf-8?B?YU52Qm1MOThLRHNnd2xGVGxUSzNCQlA2NGhDNlpxVXQzbWVTSmZYdXNMNERq?=
 =?utf-8?B?NThmSkZEazhwREx2TysvSG13THhkMGlybU0vQUwzNnZCRGhPcEZvNHcrLzJP?=
 =?utf-8?B?SmpoKzBoTHNHeDFtMlNYeDlWTUMvb2I3dk8rZC9CdWRpSFY3S3RVTjUwRExa?=
 =?utf-8?B?QXlmamF6NlBETmVYd0RGenZaQ3hrYWIvV3I3Q3ZmcFQwa09aeWxpUW5CekFZ?=
 =?utf-8?B?b1ZZSGZCRzMycVBMRG9qM2o3NHN5eVF0S1Zlb21PZXR6NG5UVk5nbXNvbUtD?=
 =?utf-8?B?aHIwTGlyZHlQcjJuR1ZjazV0UU5WZWxJKytpNGpYbVIrOTZ3cTF3YzBQRU4x?=
 =?utf-8?B?cll0Q2trVGFlS3o3alNDbVJ1VlF3Ty9sc2t2OGplck9LbHIrLy8yY0ZZZWhU?=
 =?utf-8?B?cnJ1QWdlUkFFUnVCWHc2ME5ZQWtESVQ5akJjczdHTEV3RnBndlpxZ0dkd0hN?=
 =?utf-8?B?WkRFeHFHaHl0R25XMDJHYTF1QVdkUHZERDJkZzk1MjQ4RFJLeDNNVWlFZXBv?=
 =?utf-8?B?ZTdwRDJ5QlhhMy9MbnJQbTM4cDExQnNwektGQVZaN05Xa2VXcjUyeEpKenVy?=
 =?utf-8?B?c3c2VDJYc1BGTys1VU5vUVFKNjE5TVhZWlhFZkw2dE5ZaTVMR1g1WkhaS2Ro?=
 =?utf-8?B?SDMxSlB4VHA3SzJobVZ1TEQwME1RRlI0UUs5M2Z3OTFLMjF4aUIrbHVBdXFQ?=
 =?utf-8?B?aEd6YTJYWkV6bWZWTmZGdGQzc1dMOEJ4alZxTHFXY0pFRnI4VzNTNjVYemNm?=
 =?utf-8?B?alBhY1ZUUCtpdmlUSEkxZUNPTWcwMXF4SUw2RUJaSVBxa0k5OHVXRitxWFNB?=
 =?utf-8?B?bVBDeVgxR1dsKzBTdTE1VUF6UHA1RGViVWR5VTl0bjBqcGIwQ2FYU21mL1FR?=
 =?utf-8?B?K01ISjdEU0FKZE5FeWhrTDJZQWh6Yjh6SjJqWm5kNWMrNE5Rd04wUnNSRUpa?=
 =?utf-8?B?c1djZ1FJVDZuZjRHY0JLWFNPSS9qMTFmMnBEYVVUVG1vLzJjditwdXhMcHIz?=
 =?utf-8?B?REdMZHFGSGxtenFxWVZtU21JNHd3cGhGN2h1WS9VZzR0dE9jb3V1S2MwRU0r?=
 =?utf-8?B?eXdiVEhScmJCOTg2eXN2b2lVVi8rWW4xSFJZWVdoLzRMWGpDRWxVejRyK1pD?=
 =?utf-8?B?ck5UM1ZkTW40Z2F0clJtK0J2QUpkblg4VkdnNnFKRnlOTG1ORlh4NE02SEJF?=
 =?utf-8?B?aTdQV203V3h3U2tJUlRMaTNnc1RXU2I1b3laNzhKK2d1UmdHdGxERWV2dzR2?=
 =?utf-8?B?Nk9RVDk4WjJXUy9pNnhjclZTdXM2T2NhdWM5WWVwbEFIYklzK3lwVktUVzQx?=
 =?utf-8?B?MkdhUkFCVVQ1aFg4YitmR2NGVjI4dEVLK3pJUm5zSVA5cUZrVGpZRE1pK3R3?=
 =?utf-8?B?QVVtSDhndmI3QTFkTHlya0Z1UGtXQmdQOHNSUWhlZjlMTE1BVDFnNGpSTTA0?=
 =?utf-8?B?WEZiNTN5aU1aKzZBMG5ISHkxS0hYcFhUekI4YmRzT2kzb3BDZDFIY2NMbUVx?=
 =?utf-8?B?cmRydXB6Vm5VY3VNdDhZOVJZT3ptVE1HbkZOdm1rcnNENTBmQllBZU11Tndv?=
 =?utf-8?B?ZTNyOGVzRmNMZTF2a09wZ3oxUnB1a1ZmeVF4bFFTUitwQjREUW5FVVUzblNJ?=
 =?utf-8?B?V295d0VpWjdkcjFxNlJjTlZNYjNCRXNnZm5FWVdULzBlSG5oUk9oZHhDOU5a?=
 =?utf-8?B?VXRMT1BCdUZ0dDZkaG9ZS3hCc2dOQmQ0N09OOG1wTHVpTkljeWdBVDE3eTJ1?=
 =?utf-8?B?aHNGYmpTRzFDOHNHQnh4V0sxOGJUdk5pUVNqRFg1Mmoybi9HUXl0V2FuR0pp?=
 =?utf-8?B?aDlBbDhBQkZxbDBtWVRwZXNGT1BaeXBNTCtoSXdFbFBPUDd2ajNsNXgyVFEw?=
 =?utf-8?B?VEhDaWVrZUx0aTF5ZWNyYTJEWVlBOWp5aTNmVjJYKzh2a05wZDBaUm5lVWFh?=
 =?utf-8?B?aU1nU0d0UXpmUk45MXpOb25URFR3c3hKTzJiSnhwb0luWFBkV2FzQ0ZUV3JX?=
 =?utf-8?Q?LhCNmg0ryb4HVcGEY7nPPhhiZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B29EF5660CD1B42AFBF681CE7693F50@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f743cbc-9ee1-4461-63fd-08dd090a139c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 02:21:43.9667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vLmBKEL1q7JZjhigyS0jVxlA+mMyAjE0W3g8od7ybhIoV5TPyxi4CIG3fRYXCYnXtQoUHjTxP5MYWK0jvq1sYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8673

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKw0K
PiArZW51bSBtdGtjYW1faXBpX3Jhd192aWRlb19pZCB7DQoNCkl0J3MgYmV0dGVyIHRvIHVzZSAn
c2NwJyBpbnN0ZWFkIG9mICdpcGknLg0KVGhlIGludGVyZmFjZSBpcyBwcm92aWRlZCBieSBzY3Au
DQppcGkganVzdCB0cmFuc2ZlciBkYXRhIGJldHdlZW4gbXRrY2FtIGFuZCBzY3AgYW5kIGlwaSBk
b2VzIG5vdCBjYXJlIHRoZSBkYXRhIGNvbnRlbnQuDQoNCj4gKwlNVEtDQU1fSVBJX1JBV19JRF9V
TktOT1dOCT0gMCwNCg0KRGl0dG8uDQoNCj4gKwlNVEtDQU1fSVBJX1JBV19SQVdJXzIsCQkvKiBS
QVdJX1IyICovDQoNCkRpdHRvLg0KDQo+ICsJTVRLQ0FNX0lQSV9SQVdfUkFXSV8zLAkJLyogUkFX
SV9SMyAqLw0KDQpEaXR0by4NCg0KPiArCU1US0NBTV9JUElfUkFXX1JBV0lfNSwJCS8qIFJBV0lf
UjUgKi8NCg0KRGl0dG8uDQoNCj4gKwlNVEtDQU1fSVBJX1JBV19SQVdJXzYsCQkvKiBSQVdJX1I2
ICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfSU1HTywJCS8qIElNR09fUjEgKi8NCj4gKwlNVEtDQU1f
SVBJX1JBV19VRkVPLAkJLyogVUZFT19SMSAqLw0KPiArCU1US0NBTV9JUElfUkFXX1JSWk8sCQkv
KiBSUlpPX1IxICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfVUZHTywJCS8qIFVGR09fUjEgKi8NCj4g
KwlNVEtDQU1fSVBJX1JBV19ZVVZPXzEsCQkvKiBZVVZPX1IxICovDQo+ICsJTVRLQ0FNX0lQSV9S
QVdfWVVWT18yLAkJLyogWVVWT19SMiAqLw0KPiArCU1US0NBTV9JUElfUkFXX1lVVk9fMywJCS8q
IFlVVk9fUjMgKi8NCj4gKwlNVEtDQU1fSVBJX1JBV19ZVVZPXzQsCQkvKiBZVVZPX1I0ICovDQo+
ICsJTVRLQ0FNX0lQSV9SQVdfWVVWT181LAkJLyogWVVWT19SNSAqLw0KPiArCU1US0NBTV9JUElf
UkFXX1JaSDFOMlRPXzIsCS8qIFJaSDFOMlRPX1IyICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfRFJa
UzROT18xLAkvKiBEUlpTNE5PX1IxICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfRFJaUzROT18yLAkv
KiBEUlpTNE5PX1IyICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfRFJaUzROT18zLAkvKiBEUlpTNE5P
X1IzICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfUlpIMU4yVE9fMywJLyogUlpIMU4yVE9fUjMgKi8N
Cj4gKwlNVEtDQU1fSVBJX1JBV19SWkgxTjJUT18xLAkvKiBSWkgxTjJUT19SMSAqLw0KPiArCU1U
S0NBTV9JUElfUkFXX01FVEFfU1RBVFNfQ0ZHLAkvKiBBbGwgc2V0dGluZ3MgKi8NCj4gKwlNVEtD
QU1fSVBJX1JBV19NRVRBX1NUQVRTXzAsCS8qIHN0YXRpc3RpY3MgKi8NCj4gKw0KPiArCS8qDQo+
ICsJICogTVRLQ0FNX0lQSV9SQVdfTUVUQV9TVEFUU18xIGlzIGZvciBBRk8gb25seSwgdGhlIGJ1
ZmZlciBjYW4gYmUNCj4gKwkgKiBkZXF1ZXVlZCBvbmNlIHdlIGdvdCB0aGUgIGRtYSBkb25lLg0K
PiArCSAqLw0KPiArCU1US0NBTV9JUElfUkFXX01FVEFfU1RBVFNfMSwNCj4gKw0KPiArCS8qIHN0
YXRpc3RpY3MgbWF5IGJlIHBhc3MgdG8gRElQICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfTUVUQV9T
VEFUU18yLA0KPiArCU1US0NBTV9JUElfUkFXX0lEX01BWCwNCj4gK307DQo+ICsNCj4gKy8qIFN1
cHBvcnRlZCBiYXllciBwaXhlbCBvcmRlciAqLw0KPiArZW51bSBtdGtjYW1faXBpX2JheWVyX3B4
bF9pZCB7DQoNCkRpdHRvLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArCU1US0NBTV9JUElfQkFZRVJf
UFhMX0lEX0IJCT0gMCwNCj4gKwlNVEtDQU1fSVBJX0JBWUVSX1BYTF9JRF9HQgkJPSAxLA0KPiAr
CU1US0NBTV9JUElfQkFZRVJfUFhMX0lEX0dSCQk9IDIsDQo+ICsJTVRLQ0FNX0lQSV9CQVlFUl9Q
WExfSURfUgkJPSAzLA0KPiArCU1US0NBTV9JUElfQkFZRVJfUFhMX0lEX1VOS05PV04JCT0gNCwN
Cj4gK307DQo+ICsNCg0K

