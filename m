Return-Path: <linux-media+bounces-21612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A046D9D3363
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 07:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 289DB1F21BA1
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 06:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5651581EE;
	Wed, 20 Nov 2024 06:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Mxv3yaO2";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="OfD75UDW"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12224156677;
	Wed, 20 Nov 2024 06:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732082638; cv=fail; b=H6T39+M6hmG/hc5R1dI5i7H/gP8QBSfpWo0J9p36LYvTLyDlTNgZkTuFrfZdv746OpACaOpiZa8FKqb7yzSgJI/BiLySenaY+05kCCkGZRCxjL4Hza39XOb3mfiIdleoQP3Za5PfXLgzNr/WKm+j5RRhNLzi6j3pHVKVOFi/QmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732082638; c=relaxed/simple;
	bh=jBOQN2DnnHkSDRg5ACtoPwCB5o444S+Gmt2Q3IJVvYw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YJwpcfsIKtMD9nOxWABNwjrjerOUYlrQRZOeI0WJklZgMl90pwnt6YeAVwMTVVz2LYhtcurusNB1Tb+hgDorA868OtineYCQSq8XtZjnE2FLswrnHrdWyTK0hj+16HkmCmIWVWhMLHlJMuTJRjJfLxv+dgxO180+Hz9UKkbnLQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Mxv3yaO2; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=OfD75UDW; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 317d269ca70511efbd192953cf12861f-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=jBOQN2DnnHkSDRg5ACtoPwCB5o444S+Gmt2Q3IJVvYw=;
	b=Mxv3yaO2Mf7CVMwEyqqMcCw8gdekehXri1caA/sQkSZixa7IAvdJe8kwee9XFuu1Z05AYb7LCANPdXMLH0sDXsUHBfvgRcECscV4Vttt441hwKl6JivP4MW5peKy8aCiJMbpuuBi99IeKtZxq7vvxsEwF7uBr3rRHXnTbDL+fyo=;
X-CID-CACHE: Type:Local,Time:202411201321+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:165449be-47ed-4285-8295-353216dea3a3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:7ac917b9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 317d269ca70511efbd192953cf12861f-20241120
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1711567807; Wed, 20 Nov 2024 14:03:41 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 14:03:39 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 14:03:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buEpTwWqBmp5vdYKjtO+3AYT+Un5sb7MxgxGmuEvPCJHEXFGMjpdFLUf5ys1yHoZbxqDhWM9yfrybHl4egfTcPYxSKiU7OmLJQUa8yJZjSmavr33WsBqxKfSoppIPVXxp/b2LL8rYz7Xldw01zBUp4yp2QlecDAD3o5amDQVqdTf+fJKYrPhGLm3tPRRDzpiGx3MDrHoqdqFhZhCK2P1/dI6duKAb2xbsSieOPdk4ZzyRxWXTgLmgIptYnRsy4OtqLqiJdHDs+xjDyR3Fs5GI6hGRhWfaPtvgM2CWJWSUwQb4HuD+kQjafvDyyhUNc1K2xXCU3xl7/Qap+MDIKuB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBOQN2DnnHkSDRg5ACtoPwCB5o444S+Gmt2Q3IJVvYw=;
 b=rGvX06vq3XegiV6dVYFMCHKMzmozcbV4yR7IQaBb12EInmD57WI4sml6S9XkcwvJSI6s1ptpJ+vU0MTu2nOJQn4SDDbaEA5aeQH4YWtos1ZTTcwBmRCi9yAvSTozkdbeXEPIKBK088pTMmaYoJbvFPtlbMHg21itBwwEHEd6qBtYN0PALem3S5baSgx+RrvLKmUo1G/ORJsrjleXVAzIYqC9XV18wZ8bIfH34f1o+bG9PZHwd/gWp1H6jXx9O4yij2/UV2ycdn9b7ZyUgfSyV5EyQLa/iPxbc/bXMZLO+nNiFfIk0vU26oQyEpU1JHCK1qdnAbmvU4GoX6mP4Bk5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBOQN2DnnHkSDRg5ACtoPwCB5o444S+Gmt2Q3IJVvYw=;
 b=OfD75UDWSqnxs5OUoM+U+bcYxQFb5uRuUifGTnb851oi+cvAXQFiPfLSHN0x3kxxyp06Dhem6uiN5iYiXpyzskJBUiErkPnldCwmWyaNUe4ST2tqpa2TbzD0/ilXkl1lQ9nvPGMCq28cbY617GmILG1cKA+KZWUO3RmuQV3jyeI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6426.apcprd03.prod.outlook.com (2603:1096:400:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 20 Nov
 2024 06:03:36 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Wed, 20 Nov 2024
 06:03:36 +0000
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
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbK/sWaAgAA9/YA=
Date: Wed, 20 Nov 2024 06:03:36 +0000
Message-ID: <f8dcac951608baf5b563a0094f8e320ba7ae0243.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
	 <16f46f30852c771ae8f787eb6abaa6c92ea3c5f3.camel@mediatek.com>
In-Reply-To: <16f46f30852c771ae8f787eb6abaa6c92ea3c5f3.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6426:EE_
x-ms-office365-filtering-correlation-id: 2df70bec-13b4-4c35-4297-08dd0929129e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NXdKRXRFWGp2bkg1ODNOVnlvSTZ4UkNqbTZUT0NmZnAyWmViMXRBdHlQU3B2?=
 =?utf-8?B?THkwVDlWSDBVMS81NnVMM2Z6U29YMUJOZDdzWmZmR3lwalprRk5pdEVYSzNJ?=
 =?utf-8?B?SndPaGR2WnI2cmZZcjh6Y2Z5Znp0eUpMamhrNlBBOXFCNHFtTkJXcS9FR1di?=
 =?utf-8?B?a2dPVzRYNUtRekhmdWYxVll1V0RYeFBlRm5YWlBvMjNOVVQ0dkkwaUsrUUhR?=
 =?utf-8?B?eFdXNWpHSzlZclltWnpuQ1BRdnBmVDZEU3FESXRTVk5RUGZ1NHlvRDNVVTh1?=
 =?utf-8?B?SUs4YTJDKzdJaHE4YzdVRnNGZTVkdmdybm1MaGl4NjNhSGhFRWVqTFZVR0wy?=
 =?utf-8?B?d1J2blViRmoyeVhXWXBaVzE3ZTVwV0Q1U1FXVzNYT2xQUSt5ZDV0Vm4wd1J1?=
 =?utf-8?B?clRVdmxiWHFnUGIyZUE2V2dCcUJUUTdTS2kyN09xamdsWmF4VUtPL01sd0tx?=
 =?utf-8?B?S0s0MFVzR3doQWR4YXpUN3lVQ2xGOEd2Sjdkc0o3OFJNMFc1R25XWTA1UGdu?=
 =?utf-8?B?RjJMVW5hNzJuSXpJV1dpdGlXdVh5ek40ZTNLc3FrMUlsVVNuT3g2K0tDbndF?=
 =?utf-8?B?alJiUEVkNGZKWFFOM09waGd2UVhFekRmdlRJUUlpZGlhMHB3SWZxZEZXSlF1?=
 =?utf-8?B?RTJyTnBuWHJKb29uc2dnbzJKNUpFRTBOYU8vU2NYMTExWk0zWFdRa01qajRF?=
 =?utf-8?B?blFZdjdpcVhzUHlhUXhJaHpucVVZdWdxMVFqSWFQSDlGazdiRG4yQkE5a2Mv?=
 =?utf-8?B?YzdpUlZDTVAzSDl3dDFySS80T05uYXY1QXhpMHJ0cGRoYlhoVlljYTJJYTJ2?=
 =?utf-8?B?a1g4MW9Da0YraUMrVlZWN3lFU2c2TXdnaG9uamhLN3FQSTBsN1RldURZdEt1?=
 =?utf-8?B?WURicHp1ZE1lN1lkdW5ZdWkxQ1J5N0dtOURHWk9lV2FLVkVoUzVyYnZ0NVUv?=
 =?utf-8?B?OHB6YW1kV0UyZE1sR1BUNXhsdnIyOXJRRzFVSVExM2w3Nzdxa2V4anBJL2hG?=
 =?utf-8?B?c3dpeE9BR0dab2NISWhoc1VNa2lsV2tHTzd0Uk5FVVRubFVjZ1ZRQ2N6bjB1?=
 =?utf-8?B?VjU4ZUZBb085SVYvSkI3UEZJOTJkSkVOYXJ0Z0F1ekpzU2ZidXhBaXZnTnRi?=
 =?utf-8?B?aTFYVTRXSXBLbjV4YXk2b3Y5dVU1WG8zU0NJc1pjNVpKZnhRZ0tST3dOS2Ex?=
 =?utf-8?B?U29QZ3k3Q3BERlFqRjhvWmVkSk05WktmcUdncGM4VnRJU3pkcDAvVGtuZWJt?=
 =?utf-8?B?Mzg2Z2g4dmcrYlRCNmFYREdmTlNsbzV2eCs3c3RHQ3hIQWlxeTdKWktmbDlh?=
 =?utf-8?B?VWhtT2IyN25BUnBEZ0MwRktadkZPekhBL1prUGtWb1JKYWVKai9iMjhRb0U1?=
 =?utf-8?B?dkF5NzJqSG1IcVlXVE1yN1lodXZ5cmJWNWJraEdnS05vZExXOEs1MVd5WnZJ?=
 =?utf-8?B?cjBvWWZOQVVEWkc5VnVQdzNOd0NTdm0vUE9aK29EMW9seTdybExqdGxVTTlL?=
 =?utf-8?B?MVloR1BtSG9rWk1MWlRjV0xuSGtMQWcrK1NGS0JENTQyK2F2U29kQUJqOTZk?=
 =?utf-8?B?ZWZGQjVZeURLOVZBbHFOcU5mV1M0aldXOFVXTlJsNlFsUVpua1VIOHpQRVhD?=
 =?utf-8?B?eWdjOE03cTM4ZHEranVIWnVQOHFHMC9ZWUxEck1jWjBQU2xZenljZGpOZWhX?=
 =?utf-8?B?YW4wQ3VicW1RMG91ekpuTXFiK1dLVlZuczZGQS9obXNsdUNvdE9YQWdMTURU?=
 =?utf-8?B?M21QNXRHbzNHNlNrSFR6RWdXeWNqTE83YTZzZlRZYk54K3NZbHY1Tm5KZEg1?=
 =?utf-8?Q?NGwl/2HZXHKJdXJg9LQfJ893o3Byi0K6Fes1M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnZKNnRLdm84a1hUNG1KSnlxMzBzaUthajFZV1hnMURSbXA0cnFIa2JWdEFi?=
 =?utf-8?B?TlRCaEFBeEt5dThTNzh2UzRiWFdPU3IvbkZHelRFUTA4OXlvTWJSL0Nhd2dz?=
 =?utf-8?B?S2xSVDI0TnBVMm02SVBGNEw0b1FlRnYzQnB2eVdlcStFa0RKd1BaMXR5Mm5U?=
 =?utf-8?B?cEJJZDZUcUtDMWd1WXNtK0l6dEJpODJRb1JrWWpLWmFISDMzeUpWdmtLOGtH?=
 =?utf-8?B?VHd6cjVZekhPc045Um0yTFRzTWcrdzdCbDhRa3p5ZkNhajV3RTV6UStJaVkr?=
 =?utf-8?B?ck9heWx3UVFHSUpCaC9DSmlVTUd2N0NrNy9iR0VQSG5rcWdONHJMRTFtS1BB?=
 =?utf-8?B?djlXbHdnOG51NmpTK3B3QzNDMHdrWkVKREdNR3pTY0RmeUUxOUlFUkYvS0Fk?=
 =?utf-8?B?bmYvV2lXUU8vbC9ncjltNG9YWCt6YUxXS3BuR1hUZVZMTUpsa1BQRnBtT3pv?=
 =?utf-8?B?cEZrUVoxWGZKRWFXaTZnZHFDOFAreitmOGhVZzhjSmxqLzJoNjdtaGRXYm1s?=
 =?utf-8?B?MzZKV2hrWEpzZGpReStrMEdVL2JTVEl4SC9Yb3RmTlhIQzdjVjBDUURseW8v?=
 =?utf-8?B?TkJKNU5qdEFFdmFQamQrYXZ5YjlnN0NQN3JUL1ZPODdlb28xc21CRnJMQ2hS?=
 =?utf-8?B?aUh0cS82TXQzWVF2Y2trbWhXTjZOSzYweStPdXVBaml0eUU3OHRwamd4OERS?=
 =?utf-8?B?aG5pVmJOeER2UU5NVU54S2xwN0lpY1M3YlB5NW1FS0N2c2h5aTQyQ1lvWVpx?=
 =?utf-8?B?TjdIWTEvY09LRWVMVUI5SVcrblkyRUh0cVBWREtwRkhHU3dUalV4VHZWcVVV?=
 =?utf-8?B?Qzg5R3JTMk9Wd0RDcTZSblFrdHZDQlZwUm9qOHFvNkFxUVFKQm1sUlhFRGdD?=
 =?utf-8?B?NDBsc1dxWVlFM2p1V3hYN1d0TXhmRG1NQkJjQUE4WHQzVW55WFVXR3pKNUhQ?=
 =?utf-8?B?NU5lcEVUR1Ixd0RNYlJmdlNxTTBIczNWdUlVSDJrcDN1ajJ0TGpxNVRZREpN?=
 =?utf-8?B?L3djamk2cGNKb1ZaZ082d3Y4aG5FY1dqVnVlZWhlK3pudmdyOE50T1lFbWZO?=
 =?utf-8?B?UDlpb0xJblJDdk9KVHhNam8ycmlWT1hQeXo5aHZRMndabXRDc1Bxc1l6aXAz?=
 =?utf-8?B?RVdITjJMVlprdmcrRGtyL1pjZ1RUd0ZXVC9pTlhUWVNnZWk5ZFljUks3WHJr?=
 =?utf-8?B?aHdKbWRiaFk5dXJwdGNwQVhEVWViY0RmQmFvbm8rdzQ5NXNGaUxrRHM0ZFVY?=
 =?utf-8?B?bVNxZUlSR2d2QUY2bDFrUVZuZXRhVWdpSlRscWRQM1orUlY1ZU5FL3Y2ME9j?=
 =?utf-8?B?Ry93SnNRcy9wUDFSRnFxelM4WlQvOXZUMHZZT1FHRGtMODlBNWhXR2FwMFR2?=
 =?utf-8?B?S2JsS3ErdWZoMHJTNGtBdjlzcnA4bk5WbXdhNGhLTVg2K2hjWUhaQzhFUWJN?=
 =?utf-8?B?L2FYMkxtQXRDRlZFVk84OGh1SXFkeTgxZWxmNWx5Z3RUMzVJa0lwbWZ1TE9V?=
 =?utf-8?B?SHVxU2U2TnBHZiswVFo4ZEhrOUI0U3Z0QWtBaVk5ZDBIblBTck1pSXh4ZFNS?=
 =?utf-8?B?d0FJTUk4VEtkdEdaTHh3L0FUaVVkdGdIejNYRktkcGQzU2E1TEx6WmpNM2Jv?=
 =?utf-8?B?Qk0rQ3lBb2VlRmY3SC9kOTU1S0grZ3BDVVdGVmtnZnVvWmxaajNSY3BPdEFE?=
 =?utf-8?B?YjZNVmM3SHZYRGVLM1dhSk54U1MwajJnckp2YUdpaXFNcW9EdUE4bEJReDBz?=
 =?utf-8?B?eWpvMFlBL2FFM0hBN29Kb2ROeUxlV1VOQURud3RGYmZPSlRNd29Nb0R0d0Nm?=
 =?utf-8?B?WTNIS1JvaHIxWHd0RnRRdzliT3pvYkVqNW8vaFZJSmJESWJMenRhb3B3OHpv?=
 =?utf-8?B?ZEVHbG5mVks2V3M3OFNBejBZYzcxbHYvNDNnZG0rM2FpbE9Pb3ducTliWFpQ?=
 =?utf-8?B?WThHM0QwUml2c3dQbTdlRWxtUXd3UkFRSnhHRHpFTHVhNzJhemlRVnl0aEtZ?=
 =?utf-8?B?alYzcHNCOXF0ZCt4ajhyZEczMWpkK0RaVTZXZEtNQUhiVndCUG4xcHNLZHRR?=
 =?utf-8?B?ZlpaSGsvdHIxSFd5WXRtSW5FY3BteXFxVksvd25aeVdCWUpscEpDT1lhaVR2?=
 =?utf-8?Q?U6LOsYVYaLYJp/Avcg8fFiz80?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3105ACCCF0C1143AA79548BA8CEAF0E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df70bec-13b4-4c35-4297-08dd0929129e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 06:03:36.6777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aBAAi60iP9OuwpjpOBtvHRpIijr6+mneG1JJvT6jAmFWFcRoCPaH/LI9XMRCFh9VSinmytf9ZbkVB6Km/MoPRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6426
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--21.151500-8.000000
X-TMASE-MatchedRID: oTBA/+sdKaZm6oeM5+OJFCaix8JZpk78jLOy13Cgb4/mNRhvDVinv7mn
	rGB/kwGMu8VKDO6dgUY/k+dw+d1SPMM8uuVxUoODQmUmxs/F14NG/JUd7BvSQkdmDSBYfnJRz/v
	cBk2M7lJWfnNe4UPfE7orMF3FkrbywV5ZD2sQLdVAKD7bjg/G2i6GDroi1vrl/NpLPdn/hpogLg
	8ukvShb0NaCPH88XfMr3A53hgRMlnwA3qiE1QHoZ4CIKY/Hg3AwWulRtvvYxTUHQeTVDUrItRnE
	QCUU+jzjoczmuoPCq2UTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--21.151500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	E1B094E4F12609716D8543449717A2D349B5CA95ADBC4B5FB2CB5B7C37C604422000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMS0yMCBhdCAxMDoyMSArMDgwMCwgQ0sg
SHUgd3JvdGU6DQo+IEhpLCBTaHUtaHNpYW5nOg0KPiANCj4gT24gV2VkLCAyMDI0LTEwLTA5IGF0
IDE5OjE1ICswODAwLCBTaHUtaHNpYW5nIFlhbmcgd3JvdGU6DQo+ID4gSW50cm9kdWNlcyB1dGls
aXR5IGZpbGVzIGZvciB0aGUgTWVkaWFUZWsgSVNQNy54IGNhbXN5cyBkcml2ZXIuIFRoZXNlDQo+
ID4gdXRpbGl0aWVzIHByb3ZpZGUgZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1
Z2dpbmcgdG9vbHMsIGFuZA0KPiA+IG1hbmFnZW1lbnQgZnVuY3Rpb25zIHRvIHN1cHBvcnQgSVNQ
IG9wZXJhdGlvbnMgYW5kIFNDUCBjb21tdW5pY2F0aW9uLg0KPiA+IEtleSBmdW5jdGlvbmFsaXRp
ZXMgaW5jbHVkZToNCj4gPiAxLkhhcmR3YXJlIHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0
aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4gPiBwcm9jZXNzaW5nIG1vZHVsZXMuDQo+ID4gMi5E
TUEgZGVidWdnaW5nIHV0aWxpdGllcyBhbmQgYnVmZmVyIG1hbmFnZW1lbnQgZnVuY3Rpb25zLg0K
PiA+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGltYWdlIGZvcm1hdHMgZm9yIHByb3BlciBk
YXRhIGhhbmRsaW5nLg0KPiA+IDQuSVBJIGFuZCBTQ1AgY29tbXVuaWNhdGlvbiBzdHJ1Y3R1cmVz
IGZvciBtb2R1bGUgc3RhdGUgbWFuYWdlbWVudCBhbmQNCj4gPiBjb25maWd1cmluZyBJU1AuDQo+
ID4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmluZyBpbWFnZSBwcm9jZXNzaW5n
Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhzaWFuZy5Z
YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtzbmlwXQ0KPiANCj4gPiArDQo+ID4g
K2VudW0gbXRrY2FtX2lwaV9yYXdfdmlkZW9faWQgew0KPiANCj4gSXQncyBiZXR0ZXIgdG8gdXNl
ICdzY3AnIGluc3RlYWQgb2YgJ2lwaScuDQo+IFRoZSBpbnRlcmZhY2UgaXMgcHJvdmlkZWQgYnkg
c2NwLg0KPiBpcGkganVzdCB0cmFuc2ZlciBkYXRhIGJldHdlZW4gbXRrY2FtIGFuZCBzY3AgYW5k
IGlwaSBkb2VzIG5vdCBjYXJlIHRoZSBkYXRhIGNvbnRlbnQuDQoNCkZvcmdldCBteSBwcmV2aW91
cyBjb21tZW50Lg0KSSBmaW5kIHRoZSBzY3AgY29tbWFuZCBpcyBTQ1BfSVBJX0lTUF9DTUQgb3Ig
U0NQX0lQSV9JU1BfRlJBTUUuDQpTbyBtYXliZSB0aGUgcHJlZml4IHNob3VsZCBiZSBzY3BfaXBp
X2lzcCBzbyBzb21lIHNob3J0ZXIgc3ltYm9sIGxpa2UgaXNwLg0KDQpSZWdhcmRzLA0KQ0sNCg0K
PiANCj4gPiArCU1US0NBTV9JUElfUkFXX0lEX1VOS05PV04JPSAwLA0KPiANCj4gRGl0dG8uDQo+
IA0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfUkFXSV8yLAkJLyogUkFXSV9SMiAqLw0KPiANCj4gRGl0
dG8uDQo+IA0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfUkFXSV8zLAkJLyogUkFXSV9SMyAqLw0KPiAN
Cj4gRGl0dG8uDQo+IA0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfUkFXSV81LAkJLyogUkFXSV9SNSAq
Lw0KPiANCj4gRGl0dG8uDQo+IA0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfUkFXSV82LAkJLyogUkFX
SV9SNiAqLw0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfSU1HTywJCS8qIElNR09fUjEgKi8NCj4gPiAr
CU1US0NBTV9JUElfUkFXX1VGRU8sCQkvKiBVRkVPX1IxICovDQo+ID4gKwlNVEtDQU1fSVBJX1JB
V19SUlpPLAkJLyogUlJaT19SMSAqLw0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfVUZHTywJCS8qIFVG
R09fUjEgKi8NCj4gPiArCU1US0NBTV9JUElfUkFXX1lVVk9fMSwJCS8qIFlVVk9fUjEgKi8NCj4g
PiArCU1US0NBTV9JUElfUkFXX1lVVk9fMiwJCS8qIFlVVk9fUjIgKi8NCj4gPiArCU1US0NBTV9J
UElfUkFXX1lVVk9fMywJCS8qIFlVVk9fUjMgKi8NCj4gPiArCU1US0NBTV9JUElfUkFXX1lVVk9f
NCwJCS8qIFlVVk9fUjQgKi8NCj4gPiArCU1US0NBTV9JUElfUkFXX1lVVk9fNSwJCS8qIFlVVk9f
UjUgKi8NCj4gPiArCU1US0NBTV9JUElfUkFXX1JaSDFOMlRPXzIsCS8qIFJaSDFOMlRPX1IyICov
DQo+ID4gKwlNVEtDQU1fSVBJX1JBV19EUlpTNE5PXzEsCS8qIERSWlM0Tk9fUjEgKi8NCj4gPiAr
CU1US0NBTV9JUElfUkFXX0RSWlM0Tk9fMiwJLyogRFJaUzROT19SMiAqLw0KPiA+ICsJTVRLQ0FN
X0lQSV9SQVdfRFJaUzROT18zLAkvKiBEUlpTNE5PX1IzICovDQo+ID4gKwlNVEtDQU1fSVBJX1JB
V19SWkgxTjJUT18zLAkvKiBSWkgxTjJUT19SMyAqLw0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfUlpI
MU4yVE9fMSwJLyogUlpIMU4yVE9fUjEgKi8NCj4gPiArCU1US0NBTV9JUElfUkFXX01FVEFfU1RB
VFNfQ0ZHLAkvKiBBbGwgc2V0dGluZ3MgKi8NCj4gPiArCU1US0NBTV9JUElfUkFXX01FVEFfU1RB
VFNfMCwJLyogc3RhdGlzdGljcyAqLw0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBNVEtDQU1f
SVBJX1JBV19NRVRBX1NUQVRTXzEgaXMgZm9yIEFGTyBvbmx5LCB0aGUgYnVmZmVyIGNhbiBiZQ0K
PiA+ICsJICogZGVxdWV1ZWQgb25jZSB3ZSBnb3QgdGhlICBkbWEgZG9uZS4NCj4gPiArCSAqLw0K
PiA+ICsJTVRLQ0FNX0lQSV9SQVdfTUVUQV9TVEFUU18xLA0KPiA+ICsNCj4gPiArCS8qIHN0YXRp
c3RpY3MgbWF5IGJlIHBhc3MgdG8gRElQICovDQo+ID4gKwlNVEtDQU1fSVBJX1JBV19NRVRBX1NU
QVRTXzIsDQo+ID4gKwlNVEtDQU1fSVBJX1JBV19JRF9NQVgsDQo+ID4gK307DQo+ID4gKw0KPiA+
ICsvKiBTdXBwb3J0ZWQgYmF5ZXIgcGl4ZWwgb3JkZXIgKi8NCj4gPiArZW51bSBtdGtjYW1faXBp
X2JheWVyX3B4bF9pZCB7DQo+IA0KPiBEaXR0by4NCj4gDQo+IFJlZ2FyZHMsDQo+IENLDQo+IA0K
PiA+ICsJTVRLQ0FNX0lQSV9CQVlFUl9QWExfSURfQgkJPSAwLA0KPiA+ICsJTVRLQ0FNX0lQSV9C
QVlFUl9QWExfSURfR0IJCT0gMSwNCj4gPiArCU1US0NBTV9JUElfQkFZRVJfUFhMX0lEX0dSCQk9
IDIsDQo+ID4gKwlNVEtDQU1fSVBJX0JBWUVSX1BYTF9JRF9SCQk9IDMsDQo+ID4gKwlNVEtDQU1f
SVBJX0JBWUVSX1BYTF9JRF9VTktOT1dOCQk9IDQsDQo+ID4gK307DQo+ID4gKw0KPiANCj4gDQo=

