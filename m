Return-Path: <linux-media+bounces-24087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B25689FC891
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 06:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16A2B1882089
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 05:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7D514C5AA;
	Thu, 26 Dec 2024 05:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WmGvXAqc";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qX/Bh7Ts"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70DB17591;
	Thu, 26 Dec 2024 05:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735190460; cv=fail; b=IhfccgRqPaLmQuvRaTLYXJJaWnCwtZVP2JsCfsIUjL+lTpS+uzudEl0M4DBJKwrtmaMQO7f3chz1L61IXtOifeWZ9/057HSZs90T1YIr9f0NawtVhCnYuDg7UHTbDGvHK9QyZ+avMiEoe9EYO3ceArVDkHEWISjeA1uQkUuGwI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735190460; c=relaxed/simple;
	bh=ZzUCr+voHfUR8IcKJLmGL/8fIBubrORbtDbTAz+rkHA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rKyziHO2S6Zh0g/ui3ebIlJ1+JWQ12YHijUUjQL2BJ8yTIYBw1Lp5gOReVpHo/yPDyJ/S4+ce6cLsUhoLcW9Zh+2f9YKOpMZRf4BrbszU3HCyX9vgnVtv0DZiXG/VLnuF8o22Ek8Y/ikZaY0bC/buPgQj5UONb/YdRwnA+xWAj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WmGvXAqc; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=qX/Bh7Ts; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2d6d6a52c34911ef99858b75a2457dd9-20241226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ZzUCr+voHfUR8IcKJLmGL/8fIBubrORbtDbTAz+rkHA=;
	b=WmGvXAqcmkj+PnzUHTLhkDL9qeX3W+T0ezdHPW0SSMeCm6Hj5jigs1i50byJr7UL005DJk8mAB6R/n2QB+1cw6nKoALefZgvFodR0cvDtjNz2UsGHzRqcmcNY4GHxBEd/pSoU+y6rNo9ud3rcuTToXY0nMDZql+uvZ6tBiVX/wI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:bf87045a-b583-43c7-acf3-f768e49790fd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:922c3625-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2d6d6a52c34911ef99858b75a2457dd9-20241226
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1996167621; Thu, 26 Dec 2024 13:20:53 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Dec 2024 13:20:52 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Dec 2024 13:20:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjIIbrJp8L4C3mls+OBSsKz47k1D9wgm1L3Wuu9sTtapaFon+lI/j87BKsrKYCWsXG+d7abLrZGJa/3B3jzSSg5hlxLUS2MVudgS3N00eFl4Hf+vHzHvLRPSXP8m71G/5U43h/4LuxediNVyhrkWL8JnqHjwlP0P2d4gil5OUalvSaor2gCjIdprse4EP6/COQc/2sGojt1AjYdl8MuoTIjmc4ozNajED0Cr5bOVeBrmKmO4j6T2UOSGoCEqCGWGA96JRJCEWKT81yWny/5P7ejvJaJR5vEf/zojA0Lu/tWvnyG1p0riIpGX3ojfPR06F6WWq/Ivt8V+MUnVokadlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzUCr+voHfUR8IcKJLmGL/8fIBubrORbtDbTAz+rkHA=;
 b=CMZ4vHMYmuT8lUf5H5du5vB6+xTBwikTTW1JAOe0lH0V0Qb6WhdvPxIPWC3/Umy/bcd9lNC0HdRk1IBPvYeG3A8m4c49NN6VwpzXNttNjQwpAdyWbelVDotDyoEAZVE6ccT7q0QscCDXQT8iybP9Sl8y6r0QQjBH8nci4IqvJ/oDuJ6df2o2Yn5a+DAo86bE0g40plSZUd57JvVvqypYtw4uRDPkrkLOoljfMQPhI1M6qVoqI8ekGsefpfUphTg+eMQ21Srd6tQbpSXhUDlEVA1J/lx7Oig5SP6ByWmCiW72pJircN9+NEGoi7ZFop6uUOxpJx0ELwPKMzFk3fvRFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzUCr+voHfUR8IcKJLmGL/8fIBubrORbtDbTAz+rkHA=;
 b=qX/Bh7TsGyhSVZ4DY9GJOGOzBF7hyvbCNAspN8SB4bNynhdWgi9ueA5U1oC36N2Fr2W+MiwR3eZ0sAXd/qK8y4TpxWwo67jdveG3d1Hjma11uLG7ZzB991ERkK5CuKYxpkCKtOwGh7zDSxlgj32O45tRg4BJhe20IbKSoo5r8Fc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB6853.apcprd03.prod.outlook.com (2603:1096:301:da::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Thu, 26 Dec
 2024 05:20:50 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Thu, 26 Dec 2024
 05:20:49 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?Qm8gS29uZyAo5a2U5rOiKQ==?= <Bo.Kong@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Topic: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L3/n8A
Date: Thu, 26 Dec 2024 05:20:49 +0000
Message-ID: <6e0f28d07ab4c800db983c58ebc0f002061643cf.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-4-bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-4-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB6853:EE_
x-ms-office365-filtering-correlation-id: d7981b16-43ca-40f5-6518-08dd256d0f32
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SWRqdTArcmhNOWkzSW1XRWxNZTN6VWR4UXBFZm1LZ3Q0bnR0U3JrUHJNWEY1?=
 =?utf-8?B?UDd1Y0FVTFl3VnFsL0pkekIyOHNIT0FabVhubVdrL2czdGh4eWwzWmZEajUr?=
 =?utf-8?B?WVQ5VWw5VStaVk5jekdCdGp6RC81cDRmajVEVFUvQzVDVEo0bGVSODQyMjc3?=
 =?utf-8?B?UDkvZEFobTZ5djFTdDZMdWNmZno2UnJjYjYzVXIzcmpKSnQyNWlzSXpYTTJk?=
 =?utf-8?B?d0FkOGM5NVhvYUhOMHVkdjJZZ0VJMXRhUDBNQUpZWXNBbUgyR3hkeldJMlBa?=
 =?utf-8?B?cFlFZm5MUlhlQ3BxTUlkcHBxQWVmcWtoVXlFVURieWxNMEZjL24ycEpKNk1K?=
 =?utf-8?B?VnVCbkQ0OGxrWThmRU1rMmttcnIxVURtKzNEclAva2tCT210Qk9hRjd2Yjg1?=
 =?utf-8?B?S3RPRndaSzJRWGh6V1UvcklmWko0cUFhYUpNTkdJVk1kY0piL1NPVGw2OHRs?=
 =?utf-8?B?VjJ2NXM3U0E1Y3R0bDlDYitBWTB1UjdqU2dNd0dRS2duZVpjcHd2dTJnNkZs?=
 =?utf-8?B?YmdacWFWTXM5L0tBb3ljd1hWckxFdk5RK0kxR1FKc3YxeUxKUkVNYjFYTkM2?=
 =?utf-8?B?dW1YM2xsZGRRbE1iRWNyMk5CanRhVDlXWndZVTZWS2JwL1gvUEQwbzR1RGl4?=
 =?utf-8?B?SE5yNjhsY2tVUXJTakdxZ0xISnFQM2FMaCt3dXVqOWhqdzlYUGVQUmlSN0VP?=
 =?utf-8?B?bHhXTkdSUEFNLzBIdms2dHpzWldlWTVqN0p1SVBoTWp5OEEwZmFhTlJZcFAx?=
 =?utf-8?B?dHJaNERGUkdsaEY4dnJQRW1LQ2JtUmlPaVE0bDA1WHRDSFh4MkdUTzdlTEZ0?=
 =?utf-8?B?bHdhUUpKRjRVMUUydVRsN3lHMUJtWWptS0tXWnFsa2xyRGtjakZmTFpNYWFL?=
 =?utf-8?B?OWllR1lrTUVwaDIrM1gyaGlVVXRTa1VtMTQ5YUt5S0pvQUFMUmRjYjh6TnM2?=
 =?utf-8?B?QXRVV0szOG5icnU3UTVkckc1M21ZT2FoSU1wa0tVRklQYXRzK3ZZUXAyNCtJ?=
 =?utf-8?B?UFVhaFh4UExjdjg1dzVlM3J6djZkU2ZLcmRXZnF5NTl1eWtsYzJianF3NHdv?=
 =?utf-8?B?UzZ5cHJaWExqbGhqWlF6V01FWWJnTlpnTTBkQzZ2R1BpeTlNWFcrUmlPVlc3?=
 =?utf-8?B?K29IeE9OcHFRaUQxM3JLM1ZGR2NNQ2F2TDJpdU9iRHVkdmMrV0U0eUxWU2FU?=
 =?utf-8?B?SzM0Z3NXckdzUlRoQmQxMWFIaXpJRWphelk3UnZqeWFpWVNlMGxYdVRZRVJU?=
 =?utf-8?B?c08rMEs4ODYxbVhmSmd5cnFqV0pIYzE3NlVKL21zay9UaTZTQjRwWmJDVGx4?=
 =?utf-8?B?dUVNOXBhYjB2YXNsRjV4K05MRmFqRmxlSDZRWjhaOFVON0hHSWN5bWtRL2RF?=
 =?utf-8?B?ZytjWW5LMHY3MlFJWWlNQllxT3prZThrL0VzMDlGL1YwRkVTbm1ZT1ZzYTNz?=
 =?utf-8?B?SnFRSW5MaXZJN3JrWUFmYlRmUDVZUm9WOURWU1RlUlJiRDFqNExsTlgrd3VM?=
 =?utf-8?B?VG8zRTBaOGd4c0Jaa05zVHA4aFluSGQ5UkExelN5ZkZ2Y1FpTTU2RXlsUlNH?=
 =?utf-8?B?UEpROU9PRWtrQTFaL2tEMzJJUWh5WWV3M0hvOUFwVlNVQ0xOS2JDMXN0Wisv?=
 =?utf-8?B?bDRXMWRaczJnR3JwbDBsMFV0K3k3alZQV0RzMnhYK1FnZVlZeDNYOXlMS3cz?=
 =?utf-8?B?SVJmdTBWNXNpTUlYUFg0QUUxOTYvSE8yeGpGLzZodDZqM1hFeHhTWm9EdEIr?=
 =?utf-8?B?TTBjdnlWQXplZ1UvZTZQRGhmbExHTjlFNFZFUTBWQUNxQVFlRGplQ1FjTElB?=
 =?utf-8?B?NjBrRjFRUGhmS0FyS3hXZnN4UW1ORVliQ0JmUng1T3ErU0FoTkN4TEJUWHEw?=
 =?utf-8?B?a0xuR1NUL0dQSFdaSVRWZFdpdTFCTTVaR1VGdEVqNnpwcnhxVStNME9EY1Bu?=
 =?utf-8?Q?fW+HcdCzsh8x2E+JJiHQDTOjj7MREiSH?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmFGMzEvOXhOM1Q0U0FmRXIzNVNGYnpNSTQwdnBkNzIyZDNKUjR5emJ4UThm?=
 =?utf-8?B?S3BDRmRDbzZldXNHdUdmdE1hdkxMMDlITDhVVEYxSWIyN05oK1dma2hqZ08w?=
 =?utf-8?B?NnFCcHJWRUlMQ3JQWCtHYVVuU2huUE94TlM3bWF5aGQwcjlUTUVuWTlxVnZC?=
 =?utf-8?B?VmlEcStBVm9vdUlEWFl3bnUyd0JRTlpiclRGeVBWTHd6SzNNc01iOXRtb3Q0?=
 =?utf-8?B?V1N5ZUNUd1YrcEpJWnJDQVBCN3Y2MXpiZ3hOSHRERU13S1B5SC9KaGo1T1FP?=
 =?utf-8?B?U3FPemNMMnhTdTZTSmdUWnlodXNDTnV0aC9welpzK25sOTgwRDE1c3IxMUZr?=
 =?utf-8?B?ZmZyMzk0Q3piczJ3ZFcya1pBM24wNW1SVnpSaWtkaEhxQ0p5UUF1cnpXeENa?=
 =?utf-8?B?RzVVSGs4eGhIYTZsa2Q5bFFDeE1zY3lxbldrSTZQZm5tSnk0dlYvUWhLWlVz?=
 =?utf-8?B?NVZGZDgwWGpXNHh3NVIzUFdHNWwrMUdtZk1SS1M3QVpXNER6aHJlaHp1UUh3?=
 =?utf-8?B?Q3hVcDdlZ3BuenpIQ25Oc3BOZDliMzRnMy9zYnpKQWJycGdacUdKQWVubm5m?=
 =?utf-8?B?bnZsOWF0dkdoZ2o2SVBha3hLV1loUTd2cGFTOXNlaU9RRXZNbGhqMHVia3U3?=
 =?utf-8?B?YjdTZEVEOVpzUS9acWdWTWYxTnplTytRbVptUFZYUXMwTXBNdFN2Z2FsR1FF?=
 =?utf-8?B?VDY0SmpENHpWRGdqTmoxSCt0WmN0NXlrZXJzc2dDS0J2MWM5SGduNGMvZG04?=
 =?utf-8?B?b0pkUDRhbW5KaSthc2dCQS9QYUEvdkZic0FLQXZ0dnBCdmZMYk5WM2RJcnZF?=
 =?utf-8?B?ZmdlWVFPTXc5WHZzWnMrNWJZcEJITGRWK3pFeUtGOVFzUFJxcUtEY2U0RGpP?=
 =?utf-8?B?SE1VME1vbGdvRGxVSjRoNlgvcEs0OGw2RlIvMnZZZGpGWnRiNUxIb3JrYm9T?=
 =?utf-8?B?YzVKU25BcE9URkZ2YXE5aVFkdDk0ekRaNUh5WDl2UGVzRlM0VkYzVS9od3lE?=
 =?utf-8?B?OXNvUWYwWjBod0VmTWYzMDZVZHlQL1dpZ09WMDhFT05mUVN4V1M0VEdZTXBC?=
 =?utf-8?B?T0YzNFdyZUJaM0YwNGZNbEkva0djQ2FPUTlFd3lyc2cvOUZXcmNlYlhwSG0z?=
 =?utf-8?B?TWluQlZSR2JGeHpvbUVBeXY0encwRHlVUjlsRHd4UG15cnZySG52VVh1cU11?=
 =?utf-8?B?MGpReTVKYVlkTTExaDhFOE4yNkM4a3JZek9IU2UxYzlFN2o1c28yTG1DeUpY?=
 =?utf-8?B?V0NteVZTaW0vL01NaTJzQ0tUckF1YTBkR2dHY1JzQUFLRHdDK3JZM2tEMHZr?=
 =?utf-8?B?QWp6NThDZ0pKOHVIM3BQMHhrU0haWFhLMU4rOWg2cCt1RzRPbDZwMDZESjlw?=
 =?utf-8?B?NjQvNXA4bXRtWW8wTzJjMHFOZGVGNm5Gc3gvMm55cUYvNEUvN0RmVVRtdytL?=
 =?utf-8?B?ZUdhNlVxTHVHTEQ0aG16WDMxWDZkZXlBbERQRHRFUDNlcEZna3YvZ05lSFN6?=
 =?utf-8?B?SHlPZG5laDFuTUNIZFhMa1FBMUtKK1lQbWhIVStGN0kraTVMV3p0UnRkSHN3?=
 =?utf-8?B?R2MwZzFaU092MXJLdFpsM2RWOHlKQzRLVXNCYXFCV1VEbkFpUGxLYzdiNitV?=
 =?utf-8?B?YWFyUmd0cUdXbnFJTlJqd0U4eWQ3RWNRTTlxZHRPYVFNc0NycTV1bnpTV2w3?=
 =?utf-8?B?VnFNVjVlUTRGYXFrM3pUVXNtQ1U3bVdCbFpzTkl6WWlpSXd6d1pvOUhlNnFC?=
 =?utf-8?B?WFcrcHg0NXpoYVlPS0tFY1JnVlpML2NqRmsrRXVrZ2dSbUUxUHl0OEx0dnJN?=
 =?utf-8?B?TGJCWW4zSkFLMDdyTTlHRmR1SWxNSWg1a2tlYTE0bGRwYWFCWDRNeUFtQ1oy?=
 =?utf-8?B?TTRXVEY2Z3FkV0VRbWVTWlpOdXh6OTNYSVRXWmMyYndrZ0kyT0Y3Vmo2RW43?=
 =?utf-8?B?eG9YQS9Kb1pYYTJBb3FaSzJ2WkVjd2theHpjSUM3Y25ramZuOTZROW85OUY2?=
 =?utf-8?B?YmNEQ0pSb3gwNHNEN2NJL3Y5SGZFcTAvS2tCRUdRN3hSSTVHSUxwTEFHWkRM?=
 =?utf-8?B?d0Y1SURxRUdWQ2tGTDkwNnFsTTI3ZWRvUlR2ZW5UUFVpanhMaDl0dW9ZbjZE?=
 =?utf-8?Q?KN1qtnBK5LA4ISj0c3ElwXeO7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EC03D054F1B584BAA69A247BEFB995B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7981b16-43ca-40f5-6518-08dd256d0f32
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 05:20:49.2905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cg2LfHfdMapG+ntdk/96GPOu/CsnL1FmbBoHfBvlqQ9oHug1irmYUqaaxpJMCAkaVe/oNrbpa28CoM991nnlCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6853

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBhIFY0TDIgc3ViLWRl
dmljZSBkcml2ZXIgZm9yIE1UODE4OCBBSUUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBLb25n
IDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2FpZS9LY29uZmlnIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9haWUvS2NvbmZpZw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmI3OTI1Y2Q2OTMwOQ0KPiAtLS0gL2Rldi9udWxsDQo+
ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvYWllL0tjb25maWcNCj4gQEAg
LTAsMCArMSw0MSBAQA0KPiArY29uZmlnIFZJREVPX01US19BSUUNCj4gKwl0cmlzdGF0ZSAiTWVk
aWFUZWsgQUkgZW5naW5lIGZ1bmN0aW9uIg0KPiArCWRlcGVuZHMgb24gT0YNCj4gKwlzZWxlY3Qg
VjRMMl9NRU0yTUVNX0RFVg0KPiArCXNlbGVjdCBWSURFT0JVRjJfRE1BX0NPTlRJRw0KPiArCXNl
bGVjdCBNRURJQV9DT05UUk9MTEVSX1JFUVVFU1RfQVBJDQo+ICsJaGVscA0KPiArCSAgU3VwcG9y
dCB0aGUgQUkgZW5naW5lIChBSUUpIGZlYXR1cmUNCj4gKw0KPiArCSAgQUlFIGRyaXZlciBpcyBh
IFY0TDIgbWVtb3J5LXRvLW1lbW9yeSBkZXZpY2UgZHJpdmVyIHdoaWNoDQo+ICsJICBwcm92aWRl
cyBoYXJkd2FyZSBhY2NlbGVyYXRlZCBmYWNlIGRldGVjdGlvbiBmdW5jdGlvbiwNCj4gKwkgIGl0
IGNhbiBkZXRlY3QgZGlmZmVyZW50IHNpemVzIG9mIGZhY2VzIGluIGEgcmF3IGltYWdlLg0KPiAr
DQo+ICtjb25maWcgVklERU9fTVRLX0FJRV9SRVNVTFRfSU5fS0VSTkVMDQoNClRoaXMgY29uZmln
IGlzIHVzZWxlc3MsIHNvIGRyb3AgaXQuDQoNCj4gKwlib29sICJPcGVyYXRlIEFJRSBpbiBrZXJu
ZWwgbW9kZSINCj4gKwlkZXBlbmRzIG9uIFZJREVPX01US19BSUUNCj4gKwlkZWZhdWx0IHkNCj4g
KwloZWxwDQo+ICsJICBXaGVuIHRoaXMgb3B0aW9uIGlzIGVuYWJsZWQsIHRoZSBNZWRpYVRlayAo
TVRLKSBBSUUgZHJpdmVyIG9wZXJhdGVzIGluDQo+ICsJICBrZXJuZWwgbW9kZSwgd2hpY2ggaXMg
dGhlIGRlZmF1bHQgbW9kZS4NCj4gKw0KPiArCSAgSW4ga2VybmVsIG1vZGUsIHRoZSBBSUUgZHJp
dmVyJ3MgcmVzdWx0cyBhcmUgcHJvY2Vzc2VkIGRpcmVjdGx5IHdpdGhpbg0KPiArCSAgdGhlIGtl
cm5lbCBzcGFjZSwgZW5oYW5jaW5nIHBlcmZvcm1hbmNlIGFuZCByZWxpYWJpbGl0eS4NCj4gKw0K
PiArCSAgRGlzYWJsaW5nIHRoaXMgb3B0aW9uIG1pZ2h0IGNvbXByb21pc2UgdGhlIEFJRSBkcml2
ZXIgcGVyZm9ybWFuY2UgYW5kIHN0YWJpbGl0eS4NCj4gKw0KPiArCSAgVW5sZXNzIHlvdSBoYXZl
IHNwZWNpZmljIG5lZWRzIGZvciBvcGVyYXRpbmcgdGhlIGRyaXZlciBpbiB1c2VyIG1vZGUsDQo+
ICsJICBmb3IgZXhhbXBsZTogdW5pdCB0ZXN0IChVVCksIHRoaXMgb3B0aW9uIHNob3VsZCByZW1h
aW4gZW5hYmxlZC4NCj4gKw0KPiArY29uZmlnIFZJREVPX01US19BSUVfUkVTVUxUX0lOX1VTRVIN
Cg0KRGl0dG8uDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJYm9vbCAiT3BlcmF0ZSBBSUUgaW4gdXNl
ciBtb2RlIg0KPiArCWRlcGVuZHMgb24gVklERU9fTVRLX0FJRQ0KPiArCWhlbHANCj4gKwkgIEVu
YWJsaW5nIHRoaXMgb3B0aW9uIHNldHMgdGhlIE1lZGlhVGVrIChNVEspIEFJRSBkcml2ZXIgdG8g
b3BlcmF0ZSBpbg0KPiArCSAgdXNlciBtb2RlLg0KPiArDQo+ICsJICBJbiB0aGlzIG1vZGUsIEFJ
RSBkcml2ZXIgcmVzdWx0IHZhbHVlcyBhcmUgaGFuZGxlZCBhdCB1c2VyIGxldmVsLCBwcm92aWRp
bmcgYW4NCj4gKwkgIG9yZ2FuaXplZCBtYW5uZXIgdG8gc3RvcmUgbXVsdGlwbGUgcmVzdWx0IHZh
bHVlcy4NCj4gKw0KPiArCSAgVW5sZXNzIHlvdSB1bmRlcnN0YW5kIHRoZSBpbXBsaWNhdGlvbnMg
b2Ygb3BlcmF0aW5nIGluIHVzZXIgbW9kZSwNCj4gKwkgIHRoaXMgb3B0aW9uIGlzIHVzdWFsbHkg
cmVjb21tZW5kZWQgdG8gYmUgZGlzYWJsZWQuDQo+IA0KDQoNCg==

