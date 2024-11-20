Return-Path: <linux-media+bounces-21608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2049D3197
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 02:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25C86B227A5
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 01:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F33E12B71;
	Wed, 20 Nov 2024 01:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tpJtlePB";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="S6YUvUvJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B7A4683;
	Wed, 20 Nov 2024 01:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732064761; cv=fail; b=h9qHI9CaXRZ/HYc7Vr7QwnxRfD960CsBpMy1S2ZKUsh9ccTFq7JBz3nvqNk8K634ulzUEeVusEP+a7JKU9F3/Re8K4JR+atQrnMR3tXTfujg5Dxnoi/SpKLoSaJNy5Kxc66UkW5bD9+p62G9TAKRYAe7VRetuvRAQZUxFAIOO6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732064761; c=relaxed/simple;
	bh=7CjzgWuPylRlfcJnzX+9kAhhfBYs/k4S/5UJz1+JVkI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VpvLTPXpOgPcq05lAnjXMg3hLdLmKt9RhculgDHIryEsw7PFnoqBTrpHU40Bjuc5UwCFJ1ZVjPhaNme8SlU7XU2kKAZRKh1foIcOsF1kGtX6kHpb30pEybJOybVqh+s+czJg/cDIN6n8SF0G1tDs4ZwcsesJJPyeuoPqMqev+wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tpJtlePB; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=S6YUvUvJ; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9695a9f2a6db11ef99858b75a2457dd9-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7CjzgWuPylRlfcJnzX+9kAhhfBYs/k4S/5UJz1+JVkI=;
	b=tpJtlePBjAQRuOCMyyix3RiuZxFibyeE02xiDCH+w8Bpv16eJyLxMI0u0Pt+Zsx5lNF3f+nVk6IRwyV2nkEaNNGgKb/6NXXYnDkkmJlP39mcdO6vBe6UJscHTbHNQRWOU/IIqg1zM/FK23SJMKXaM9IY1CcQzD6TU/B6umfTq/8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:d32ffba3-0bc7-4e3b-91ed-0d196e9cac9d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:fb42534f-a2ae-4b53-acd4-c3dc8f449198,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9695a9f2a6db11ef99858b75a2457dd9-20241120
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 988178524; Wed, 20 Nov 2024 09:05:52 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 09:05:48 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 09:05:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P86nRyixy/fdKL2pj/zw/HHjGppQKpfgeaJ3Kz+6JzHGc/A4PFlQJXdqyKUhXxV4/B3ugSS8neM3eaVi0CfStCW1AOCnRzsN4vLvnhCEGVMZSNvVnnh6kwQSvNxs6zmeRooh0NRgtna9iDEVw10rr88JHSPZ8c0vlplHvSE/1EidWiM4wcUaWEo4Zm7eTmaZz8j8uKUn2QVi/RmeFxBSmfvv0f3a2V3BB93DsVtq9gHAaRYvV38f2AhGl5+C9zUd+hG5BSKKsWwTfn1xGLNywJmiIbuQ9yhF2JeZmu1+P5KyMGGZVAGHL7RlsqW1Hd40MnbskSskNhmFErzDBK9VBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CjzgWuPylRlfcJnzX+9kAhhfBYs/k4S/5UJz1+JVkI=;
 b=FxqUKDqV4lY/6tH/GB+ON5OHZNNaOAcfptHSDs6cwxaAIoR/saHLBV2KmK+H5k0yiq0brV8oGKeOUrKNSqFgDPRMMzJVpWrK339CoIAmT18xxHuFSdvhPmGbWiwkGFYYGJWKYW0a2hJBB2PcPgrmT7sOfka1k9UI0f2s8ov+Sg6ulxF79rBKac7DtcWN+CgDPCotoRbo5OYeuemT5PFkDdFoLzwtK7Xq/E5mkdjdLfm9lXIRPU449nWJw34LsAz5y1SMh3a2o3T7Y7y+7zcPfg9hcpsLMHhRW+4hUUH71oeK9EAKvp1dsDYgocJ5OKCPrMQQe9h6oWNIfs5XRhu3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CjzgWuPylRlfcJnzX+9kAhhfBYs/k4S/5UJz1+JVkI=;
 b=S6YUvUvJriz0mSZ63RAgC7tQj6nCROedoB/cW2mTOJ08LYQdl2iOgnPvawpI/9XKXkA9m8ryBVjRLrXZ83z38tdjxADyV6meFmZv4cOpYiYElx3A717NBsMRc8y9u+a3u00nJ1KjxucFhv6/cBQmXGUmh1ElHLGlERgL8dmpkIY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6606.apcprd03.prod.outlook.com (2603:1096:400:204::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 01:05:45 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Wed, 20 Nov 2024
 01:05:44 +0000
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
Subject: Re: [PATCH v1 07/10] media: platform: mediatek: add isp_7x video ops
Thread-Topic: [PATCH v1 07/10] media: platform: mediatek: add isp_7x video ops
Thread-Index: AQHbGj2rn5mkjx9+gEa8/1/+8BPSjrK/nCmA
Date: Wed, 20 Nov 2024 01:05:43 +0000
Message-ID: <558a6847ee699ecafdb015864cde2bb42babee33.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-8-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-8-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6606:EE_
x-ms-office365-filtering-correlation-id: 98e80d31-814c-4121-279d-08dd08ff75a2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VXNRU0w4TmRkVyt4S3owSVZuTUwxU2lNNWdxQWlJWXI4QlNzYlluVkcwOU83?=
 =?utf-8?B?c214VDJodnAvTDZYTlFuY21HS2w4QURHdjdVVStjMTZNeFJlS1hha2g4eUQy?=
 =?utf-8?B?cFlsRzZMWUYyTXNNN1E3U2xBeDRiSzRtR0pmZCtTMXh2SHBSNXBQbWRrWEhy?=
 =?utf-8?B?b1pVQUF5ME43MWZTYjQ1bFplQWR6Qk9adFM4ZUNCWDBVaHNwNVFWYXgvZ2Vs?=
 =?utf-8?B?SlFHYXpBUHdKMjdHbmNhUEhGSkkxZnVaZFRhNm5lS0RIaFAvckoyQWdHV1E2?=
 =?utf-8?B?NTIwdFllLzBobFNvaFRJcThOVzl0S1dCMW9iQXcvZmJESUhERHBtZ293RjJi?=
 =?utf-8?B?MmhYb0Y4MENrMEhETnNXWU90QmxDN1NyOXdLbGZrVnNtTnl2cVpLSlZNcS9l?=
 =?utf-8?B?NFUvRW42QUFRM1UzaVVmRUNPMlROdEU4Q0NMeVJkS2IrdFBuajl6c0dRT0VZ?=
 =?utf-8?B?R1ZYQVgvZjVvZGsyempPSWo1NzNDMU16UFBqb1krRWJmREptWnZHczBjYWxz?=
 =?utf-8?B?OVBKdjFEcGMwYkJzeWtVcVgxSkg5clREWGQvc3RyeEd5S0hpQkxPY0tVMjhp?=
 =?utf-8?B?L2t3VG1QdytqUVpMbmdxcnBFMW1hZHNoYnhBV0oyWnh5R211VllYYU1zTzR2?=
 =?utf-8?B?QlY1TmJLNjJudkRYVzBNUURzUm5SakFPQzBmSmtpNnhXS01Xayt4WFRrekpl?=
 =?utf-8?B?b0duaW5GNTVNK2RZd0JjY3dtVDlDMG9CRmJURkRWUE5Ec2NuQUo0WHQxSWNL?=
 =?utf-8?B?ZWx3YzhzSUIrMHovd0NrZTZYcWZGYis5VTQ5OXdmZGpvd3BGamVDRG5iYk1U?=
 =?utf-8?B?di9EWEFQdVpmYzhQU0hpNVB1NEVEZGFCam5EaEFFRFZSUGhYNjdFaGlFNE5O?=
 =?utf-8?B?bUpYL2V3MC9Cb25ZYzRVb09hSFdGSDY1TFpxYklYMVMzOUF1OVQ3MG5pV0VI?=
 =?utf-8?B?d28vbnBvNmE1c1Q5YlFEWGJ3cklJVXE4VHFma2F0aXdPWGZRY3lWZTgvd3JM?=
 =?utf-8?B?NzJJUjVGK3l6STZubHZYdGZCMDJUZVpOTENldFBFbHFheGZSS2dRQXV1NGxr?=
 =?utf-8?B?N043NngwdEFSTjNUVUc1cU9uekVzbDBrdzdpcTQ2bmlrYVEwbEdFbEVxeGhs?=
 =?utf-8?B?S0NBUTZhVlA5eHdJUlI0RC9Ncll2cmNsa0RLaTN3Z2l3MHRpanl4aFVVTHM4?=
 =?utf-8?B?dWx2bjV4WTh6b3dXNEJqNDBBU21FSVdZZDNpbEdLZk1FcE9wLzlhSENuNW83?=
 =?utf-8?B?ZHNqZCsrY0pkemhESkh2UG44QjA2NnlxTzVxUlhzb3VyR2lONTNnOFl3dUtZ?=
 =?utf-8?B?K2RxWHZKdzM1VnVGandZOGVKcFh3ZmdNV1JDUHFsbWFUZkdZRkluK1ZhS1FW?=
 =?utf-8?B?VU1Rcnk2WWZoSXJwY1ViWHp1MG9qakkreEQrb3prWXVObVFXTEQ0MVNnWWts?=
 =?utf-8?B?a2sxRTBYd2F5by94enRuUEw1T0YxSGtHUVpqYU1yb1F6QVhoa1NoNVppVkx5?=
 =?utf-8?B?ZWVMeGg4enk5TUZhR0hVaTF5N0pJN292YlVmMkRONFlEbE5WbEV5TFhkWmJh?=
 =?utf-8?B?UXUyY0pNUmJOanBCWFFZRkorZWoxbDE0ZGxOK3JVNWhJd3l4MFlSWWluL1VV?=
 =?utf-8?B?bCtLUTdRN0dwV3Q1YkdNT1dqeVJrUkNZOFZaR2hBTWZ3cGtHUEk1cFZVSm4y?=
 =?utf-8?B?VFhwZm9KOTRlVE5od0sxUlNHV2R5eXlZdlplTXJXbmg2WDJTYm1IUUNXQVhU?=
 =?utf-8?B?UVB5eTZxRHgyd1hSSEJCOUhiM1NqTElqSmN5M2FOUjZTc29Ia0hucjhnVTBK?=
 =?utf-8?Q?t7Ko8kL4lp8P4Sb0/RhIXc7CFJftLZhcybrKA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UW5NRTN6YTBYY1VWcWFuNTVReWZGWjNPb1FhYUtXdThtRkVXYnJ1QTN3R1Rk?=
 =?utf-8?B?UnJGV0hUS2dtcVg0SHBZNjFwVFpId0ZFUDlpZWd0N2RDck9BUHBab2lHS25E?=
 =?utf-8?B?UjlZSEJVaUNUQXhuS2haN0IwTXU0Q1p2b0M4ODZCRGZYYlNXelppclk3bHR6?=
 =?utf-8?B?bm5qYm45QTROQ2NyZjN6YjFpYVVEcmp3Y1VYTS8yajlaRitsOWYweWo5TDVR?=
 =?utf-8?B?dGRYbXhncVBGL3Y5dS82WEpSaEQvN1pYYmY4dDZJZXArb2l6dmNxQU1UNzY3?=
 =?utf-8?B?VDRxYTJkU3NzQ0NtVnhOZUx0NnVTUldWUzdNUXVQM3Flc0RkOTluVk5qZ0NW?=
 =?utf-8?B?VUI1M0dvMVZjWXdRNXF3aTJGM0h2YkxGellBNXlBZlZObFZQOW9icEJzRVh1?=
 =?utf-8?B?dmZuU2kvWjJSaXBHZXFwU0xXMnArNHJQYmtWTlVyZlBQcGRWRWl1N004d0Jl?=
 =?utf-8?B?MjdqSlMyR1dNYTcxWSs3L25qck9SM3RGYnpqMFZvRHY4OWI5dFc3d1NUaHRQ?=
 =?utf-8?B?eXNzbzlFK3pEczkreU1LRm4rbHltVFVDRDBZOUJrTHcrNTRTYUhvaEkzODlC?=
 =?utf-8?B?bXJwMVJ4ZWo5VGZwdTEyaTN3bzRBMlRHemtndWpiS1JPT1l3OGZLMlk3Y3BU?=
 =?utf-8?B?Q1JaN1FFL3JqVk94a044NkNvMGxScFl6c2lPRzlWWGZYSkhXUGxTb1ZneVFM?=
 =?utf-8?B?YVFEWjJzdU1ha2FITkpnYlA0R2lZcERDQ1lhK2lEMHVVUGE2OHc5SllCY2ty?=
 =?utf-8?B?Q0lVeXdPTkhHZWxyWlpSeXo4UmpNR3VSalRoTm51cy93bi9EYTBoY2YvOGV6?=
 =?utf-8?B?SzlMMlhXRXI3M1pwSUdZeDFVcWhaRXNIelE1bEhVbkpWQlhLTG95NEFxdlVN?=
 =?utf-8?B?aEEyNEZmelFFaTV4MXhWaFR6cmxDank5b1krY3I0MDBZL21oR3pQQzA4Qlhu?=
 =?utf-8?B?OEIxVmNSTTBBUUpRd1F2elg0MTRUNHZ2UXo1M1NZbC9WSTRzRitubE1zRlFP?=
 =?utf-8?B?ZFFpaUNRZS9NeGlTL3FIUEVnaGl3RUhUOFN3czRqTy9lYVBvNTRxWVRaL0Zs?=
 =?utf-8?B?R0NPOTdWK0g1U0dGRnZCSkxRVW1PSndoZjRHdDJUTzBUcFY3Z2gxZytCZHk3?=
 =?utf-8?B?SDJCUmMwVkd5QnNkeXBkakJzNWJ4U1QwSnpXUG5hZEszRnpoTmxlbDZCYnA2?=
 =?utf-8?B?cHRlb3piVUV2ZGRlTEgyWGdBeDdYa2ZsaHZNMWdtZkdISlV5RjhoOUJ0N1N2?=
 =?utf-8?B?YXJNSm1vZzVEbitjNWhEcDl0OTdBdmMvSG1KeFBzUUd3S0ZkMHZRNXhvWWF2?=
 =?utf-8?B?K2FucXB4ODlrNXNnSElMdU0rZ0VvSEczT1dHQjR3ejdLU1NHSVRIZVNGRnRX?=
 =?utf-8?B?RUZaU2R4RXpBangxcUxlN1IyVnliRkpxRkdCT25BNmpETk5SSUw4amJ3ZzVL?=
 =?utf-8?B?WERody9OOWdVVE5mQ3FYMU9XVGFvZTZpZWYzUVVPeVRDWmFsaDBZMklDZXkr?=
 =?utf-8?B?NjlpL2x1bjNiOEZUWkl4dUM0NlVpcmpzL3FuOGFieWpIZEVwcHRIU3hUYU10?=
 =?utf-8?B?dUcxY1BwOE5VYWhBMnlJakc1SjhONERQb0tydWROTUpucjdmdTlyMUVrV3o3?=
 =?utf-8?B?K1NZa0NtUWxsSHF1U2NIaDdIL1cyczlGZnlSN05HTFZMd1BSMm0vMmtaRms3?=
 =?utf-8?B?WmNId3l4bjVlSE9GMVd2YUlBWTlYelVpTm1EdmoxQnNRc2h3UC81V2ZYZEFn?=
 =?utf-8?B?aFBwVTg5eVpxS2RYUnI5WnFvWHJrMXhMS0x6bmtNczE3Z0NmTFR5MnprUjVa?=
 =?utf-8?B?VUM1M1dHYXF0OWJxdGNNZ0FOMkhtUWlGeVBrTTQ2NG1qR3JOcExmZXAyZjlU?=
 =?utf-8?B?d0lsaDIxMURra2sycXloOHE3VUtkbzZNZk9qbENyY3g2Rk05STZjSmZJbWgx?=
 =?utf-8?B?bW9DQmdSaHluWmZoSGVtWGhiMDhYZ0FLRUkyeTA1THc4OENGbXJqK1hOcThm?=
 =?utf-8?B?OC9YcGJvVGJrZmphYkMzcnhDazRhSUErTEQ4ZS8rUlpMQU5KMWI5KzFlYjFr?=
 =?utf-8?B?SHkxTmQ3c2hwTFhubEpTekNmWmhvMFI2NGFIOFBscGEyRUlZTlIydFV5SnE2?=
 =?utf-8?Q?uQECd3UoYvdCHfMwhWP0fqGJj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E03CB68D48FBA449674242C59B4C2C4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e80d31-814c-4121-279d-08dd08ff75a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 01:05:43.9397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xwLugYnCg9PLT28tijGhT++psrTILPyfMWYQ2wUfAU06kPWUxtKTg7NozQxb2uLeJ7zgpGW0vHTyRIj1E+NnYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6606
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.846600-8.000000
X-TMASE-MatchedRID: +f/wAVSGjuhm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYG22
	e6GsqEr82KZvSbusf6rE7R5+4LNubM2Q7FOLzb9yXbTfocfAWb/54F/2i/DwjX5h6y4KCSJcNzD
	QBKb2yJ1Altf1YsvUWavK/da5ydmztn6yDc1amOKzI1v7J4hECo4lnIgC6UzTmBadosOIaCHTZN
	K+pGSjkPcqU4dInnrprWM/0JoqnqmLsaKRY8xM1nzakQ47arfwWDdWpJMntKgNmPMcsvd5FlWh9
	aRY+Gu1pPfp/tMmq7hpdhec84AExutsQZv7lD95o4427PDKC0ZQBou0AH89tJsoi2XrUn/J+ZL5
	o+vRV7yhMIDkR/KfwI2j49Ftap9EOwBXM346/+z0NjmAlxC710Lqzq9uMfI5J1YcByGycmEVx6J
	Gp9v4B9lTbFE3/ydJ
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.846600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	E141780C20F2982D400A58B70E50C50CB0C2BBAF993E240148DB3C18A9AF42302000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBWNEwyIHZpZGVvIGludGVyZmFj
ZSBhbmQgZmVhdHVyZSBtYW5hZ2VtZW50IGZvciB0aGUNCj4gTWVkaWFUZWsgSVNQN3ggQ0FNU1lT
LiBUaGVzZSBpbnRlcmZhY2VzIGluY2x1ZGUgdmFyaW91cyBmdW5jdGlvbmFsaXRpZXMsDQo+IHN1
Y2ggYXMgdmlkZW8gb3BlcmF0aW9uIGluaXRpYWxpemF0aW9uIGFuZCByZWdpc3RyYXRpb24uIFRo
ZXkgYWxzbw0KPiBtYW5hZ2UgTWVkaWFUZWstc3BlY2lmaWMgZm9ybWF0cyBhbmQgaGFuZGxlIGJ1
ZmZlcnMgZm9yIE1lZGlhVGVrIGNhbWVyYQ0KPiB2aWRlbyBkZXZpY2VzLiBUaGlzIGludGVncmF0
ZXMgQ0FNU1lTIGZ1bmN0aW9uYWxpdGllcyB0byBiZSBjb21wYXRpYmxlDQo+IHdpdGggdGhlIFY0
TDIgZnJhbWV3b3JrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUt
aHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gK2ludCBtdGtf
Y2FtX3ZpZGVvX3JlZ2lzdGVyKHN0cnVjdCBtdGtfY2FtX3ZpZGVvX2RldmljZSAqdmlkZW8sDQo+
ICsJCQkgICBzdHJ1Y3QgdjRsMl9kZXZpY2UgKnY0bDJfZGV2KQ0KPiArew0KPiArCXN0cnVjdCBt
dGtfY2FtX2RldmljZSAqY2FtID0NCj4gKwkJY29udGFpbmVyX29mKHY0bDJfZGV2LCBzdHJ1Y3Qg
bXRrX2NhbV9kZXZpY2UsIHY0bDJfZGV2KTsNCj4gKwlzdHJ1Y3QgbWVkaWFfcGFkICpwYWQgPSAm
dmlkZW8tPnBhZDsNCj4gKwlzdHJ1Y3QgdmlkZW9fZGV2aWNlICp2ZGV2ID0gJnZpZGVvLT52ZGV2
Ow0KPiArCXN0cnVjdCB2YjJfcXVldWUgKnEgPSAmdmlkZW8tPnZiMl9xOw0KPiArCXVuc2lnbmVk
IGludCBvdXRwdXQgPSBWNEwyX1RZUEVfSVNfT1VUUFVUKHZpZGVvLT5kZXNjLmJ1Zl90eXBlKTsN
Cj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJaWYgKHZpZGVvLT5kZXNjLmxpbmtfZmxhZ3MgJiBNRURJ
QV9MTktfRkxfRU5BQkxFRCkNCj4gKwkJdmlkZW8tPmVuYWJsZWQgPSB0cnVlOw0KPiArCWVsc2UN
Cj4gKwkJdmlkZW8tPmVuYWJsZWQgPSBmYWxzZTsNCj4gKw0KPiArCW11dGV4X2luaXQoJnZpZGVv
LT5xX2xvY2spOw0KPiArDQo+ICsJLyogaW5pdGlhbGl6ZSB2YjJfcXVldWUgKi8NCj4gKwlxLT50
eXBlID0gdmlkZW8tPmRlc2MuYnVmX3R5cGU7DQo+ICsJcS0+aW9fbW9kZXMgPSBWQjJfTU1BUCB8
IFZCMl9ETUFCVUY7DQo+ICsNCj4gKwlpZiAocS0+dHlwZSA9PSBWNEwyX0JVRl9UWVBFX01FVEFf
T1VUUFVUKQ0KPiArCQlxLT50aW1lc3RhbXBfZmxhZ3MgPSBWNEwyX0JVRl9GTEFHX1RJTUVTVEFN
UF9NT05PVE9OSUM7DQo+ICsJZWxzZQ0KPiArCQlxLT50aW1lc3RhbXBfZmxhZ3MgPSBWNEwyX0JV
Rl9GTEFHX1RJTUVTVEFNUF9CT09USU1FOw0KDQpXaHkgVjRMMl9CVUZfVFlQRV9NRVRBX09VVFBV
VCB1c2UgZGlmZmVyZW50IHRpbWVzdGFtcCBmbGFnPw0KRGlmZmVyZW50IG91dHB1dCBkYXRhIGlz
IGdlbmVyYXRlIGF0IHRoZSBzYW1lIHRpbWUsDQpzbyB1c2UgdGhlIHNhbWUgdGltZXN0YW1wIHNv
IHdlIGFyZSBhYmxlIHRvIGxpbmsgdGhlc2Ugb3V0cHV0IGRhdGEgdG8gdGhlIHNhbWUgZnJhbWUu
DQoNCkFuZCBJIGNvdWxkIG5vdCBmaW5kIGFueXdoZXJlIHRvIGRlZmluZSBWNEwyX0JVRl9GTEFH
X1RJTUVTVEFNUF9CT09USU1FLg0KU28gZHJvcCBWNEwyX0JVRl9GTEFHX1RJTUVTVEFNUF9CT09U
SU1FIGFuZCB1c2UgVjRMMl9CVUZfRkxBR19USU1FU1RBTVBfTU9OT1RPTklDIGZvciBhbGwgcXVl
dWUuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsNCj4gKwlpZiAodmlkZW8tPmRlc2Muc21lbV9hbGxv
Yykgew0KPiArCQlxLT5iaWRpcmVjdGlvbmFsID0gMTsNCj4gKwkJLyogcmVzZXJ2ZWQgbWVtb3J5
ICovDQo+ICsJCXEtPmRldiA9IGNhbS0+c21lbV9kZXY7DQo+ICsJfSBlbHNlIGlmIChpc195dXZf
bm9kZSh2aWRlby0+ZGVzYy5pZCkpIHsNCj4gKwkJcS0+ZGV2ID0gY2FtLT5yYXcueXV2c1swXTsN
Cj4gKwl9IGVsc2Ugew0KPiArCQlxLT5kZXYgPSBjYW0tPnJhdy5kZXZzWzBdOw0KPiArCX0NCj4g
Kw0KPiArCXEtPnN1cHBvcnRzX3JlcXVlc3RzID0gdHJ1ZTsNCj4gKwlxLT5sb2NrID0gJnZpZGVv
LT5xX2xvY2s7DQo+ICsJcS0+b3BzID0gJm10a19jYW1fdmIyX29wczsNCj4gKwlxLT5tZW1fb3Bz
ID0gJnZiMl9kbWFfY29udGlnX21lbW9wczsNCj4gKwlxLT5kcnZfcHJpdiA9IGNhbTsNCj4gKwlx
LT5idWZfc3RydWN0X3NpemUgPSBzaXplb2Yoc3RydWN0IG10a19jYW1fYnVmZmVyKTsNCj4gKw0K
PiArCWlmIChvdXRwdXQpDQo+ICsJCXEtPnRpbWVzdGFtcF9mbGFncyB8PSBWNEwyX0JVRl9GTEFH
X1RTVEFNUF9TUkNfRU9GOw0KPiArCWVsc2UNCj4gKwkJcS0+dGltZXN0YW1wX2ZsYWdzIHw9IFY0
TDJfQlVGX0ZMQUdfVFNUQU1QX1NSQ19TT0U7DQo+ICsNCj4gKwkvKiBObyBtaW5pbXVtIGJ1ZmZl
cnMgbGltaXRhdGlvbiAqLw0KPiArCXEtPm1pbl9xdWV1ZWRfYnVmZmVycyA9IDA7DQo+ICsNCj4g
KwlyZXQgPSB2YjJfcXVldWVfaW5pdChxKTsNCj4gKwlpZiAocmV0IDwgMCkgew0KPiArCQlkZXZf
aW5mbyh2NGwyX2Rldi0+ZGV2LCAiRmFpbGVkIHRvIGluaXQgdmIyIHF1ZXVlOiAlZFxuIiwgcmV0
KTsNCj4gKwkJZ290byBlcnJvcl92YjJfaW5pdDsNCj4gKwl9DQo+ICsNCj4gKwlwYWQtPmZsYWdz
ID0gb3V0cHV0ID8gTUVESUFfUEFEX0ZMX1NPVVJDRSA6IE1FRElBX1BBRF9GTF9TSU5LOw0KPiAr
CXJldCA9IG1lZGlhX2VudGl0eV9wYWRzX2luaXQoJnZkZXYtPmVudGl0eSwgMSwgcGFkKTsNCj4g
KwlpZiAocmV0IDwgMCkgew0KPiArCQlkZXZfaW5mbyh2NGwyX2Rldi0+ZGV2LCAiRmFpbGVkIHRv
IGluaXQgdmlkZW8gZW50aXR5OiAlZFxuIiwgcmV0KTsNCj4gKwkJZ290byBlcnJvcl9tZWRpYV9p
bml0Ow0KPiArCX0NCj4gKw0KPiArCXJldCA9IG10a192aWRlb19pbml0X2Zvcm1hdCh2aWRlbyk7
DQo+ICsJaWYgKHJldCA8IDApIHsNCj4gKwkJZGV2X2luZm8odjRsMl9kZXYtPmRldiwgIkZhaWxl
ZCB0byBpbml0IGZvcm1hdDogJWRcbiIsIHJldCk7DQo+ICsJCWdvdG8gZXJyb3JfdmlkZW9fcmVn
aXN0ZXI7DQo+ICsJfQ0KPiArDQo+ICsJdmRldi0+ZW50aXR5LmZ1bmN0aW9uID0gTUVESUFfRU5U
X0ZfSU9fVjRMOw0KPiArCXZkZXYtPmVudGl0eS5vcHMgPSBOVUxMOw0KPiArCXZkZXYtPmZvcHMg
PSAmbXRrX2NhbV92NGwyX2ZvcHM7DQo+ICsJdmRldi0+ZGV2aWNlX2NhcHMgPSB2aWRlby0+ZGVz
Yy5jYXAgfCBWNEwyX0NBUF9TVFJFQU1JTkc7DQo+ICsJdmRldi0+djRsMl9kZXYgPSB2NGwyX2Rl
djsNCj4gKw0KPiArCXZkZXYtPnZmbF9kaXIgPSBvdXRwdXQgPyBWRkxfRElSX1RYIDogVkZMX0RJ
Ul9SWDsNCj4gKwl2ZGV2LT5xdWV1ZSA9ICZ2aWRlby0+dmIyX3E7DQo+ICsJdmRldi0+aW9jdGxf
b3BzID0gdmlkZW8tPmRlc2MuaW9jdGxfb3BzOw0KPiArCXZkZXYtPnJlbGVhc2UgPSB2aWRlb19k
ZXZpY2VfcmVsZWFzZV9lbXB0eTsNCj4gKwkvKiBzaGFyZSBxX2xvY2sgKi8NCj4gKwl2ZGV2LT5s
b2NrID0gJnZpZGVvLT5xX2xvY2s7DQo+ICsJc3Ryc2NweSh2ZGV2LT5uYW1lLCB2aWRlby0+ZGVz
Yy5uYW1lLCBzaXplb2YodmRldi0+bmFtZSkpOw0KPiArDQo+ICsJcmV0ID0gdmlkZW9fcmVnaXN0
ZXJfZGV2aWNlKHZkZXYsIFZGTF9UWVBFX1ZJREVPLCAtMSk7DQo+ICsJaWYgKHJldCA8IDApIHsN
Cj4gKwkJZGV2X2luZm8odjRsMl9kZXYtPmRldiwgIkZhaWxlZCB0byByZWdpc3RlciB2aWRlbyBk
ZXZpY2U6ICVkXG4iLA0KPiArCQkJIHJldCk7DQo+ICsJCWdvdG8gZXJyb3JfdmlkZW9fcmVnaXN0
ZXI7DQo+ICsJfQ0KPiArCXZpZGVvX3NldF9kcnZkYXRhKHZkZXYsIGNhbSk7DQo+ICsNCj4gKwlk
ZXZfZGJnKHY0bDJfZGV2LT5kZXYsICJyZWdpc3RlcmVkIHZkZXY6JWQ6JXNcbiIsDQo+ICsJCXZp
ZGVvLT5kZXNjLmlkLCB2ZGV2LT5uYW1lKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArDQo+ICtl
cnJvcl92aWRlb19yZWdpc3RlcjoNCj4gKwltZWRpYV9lbnRpdHlfY2xlYW51cCgmdmRldi0+ZW50
aXR5KTsNCj4gK2Vycm9yX21lZGlhX2luaXQ6DQo+ICsJdmIyX3F1ZXVlX3JlbGVhc2UoJnZpZGVv
LT52YjJfcSk7DQo+ICtlcnJvcl92YjJfaW5pdDoNCj4gKwltdXRleF9kZXN0cm95KCZ2aWRlby0+
cV9sb2NrKTsNCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCg0K

